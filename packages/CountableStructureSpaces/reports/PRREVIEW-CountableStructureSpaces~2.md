# Review of CountableStructureSpaces (pull request #1316 at 113f171)

**Verdict:** needs changes

Incremental re-review of the 82 changed lines since `bcfbb31` (README 32 lines, `Suggested.lean` 50 lines; nothing changed outside the folder). The worktree was not edited. Of the thirteen findings of the previous review, four are repaired (R02, R04, R05, R06), one is partly repaired (R09) and eight are not repaired, most of them by the author's stated choice. One repair introduced a new problem (the equivalence laws of `BFEquiv` are now consumed from a supplier that does not state them). The gate still fails on seven checks.

## R01 (P1) — The targeted build gate still fails

**Location:** `TauCetiRoadmap/CountableStructureSpaces/Suggested.lean:1–2`; the gate at this head, `build=2`.

**Claim:** The acceptance file passes the targeted build with `sorry` as its only warning.

**Witness:** The gate reports two module-system warnings, one for `Completed/InfinitaryLogic/Suggested.lean` and one for this file, both from importing `Mathlib` without the module form. Direct `lake env lean` exits 0 with 72 `sorry` warnings (22 s), so this is a gate failure, not an elaboration error. Carried from the previous R01; the pull-request text says the module migration is deferred until the parent prototype is no longer imported.

**Repair:** Drop the `Completed.InfinitaryLogic.Suggested` import (R03) and write the retained file in the supported module form, then rerun the prescribed gate until `build` passes. No option may suppress the warning.

## R02 (P2) — Reflexivity and transitivity of `BFEquiv` are consumed from a supplier that does not state them

**Location:** `TauCetiRoadmap/CountableStructureSpaces/README.md:117` ("`BFEquiv` with `refl`, `symm`, `trans` (across three structures)"), 407–409 ("assembled from the parent's `BFEquiv.refl`, `BFEquiv.symm` and `BFEquiv.trans` (Layer 1 of InfinitaryLogic)"), 433 ("needs only `BFEquiv.trans` across three structures"); `Suggested.lean:427–452`.

**Claim:** InfinitaryLogic Layer 1 supplies reflexivity, symmetry and three-structure transitivity of `BFEquiv`, so `bfEquivSetoid` and the constant-chain bound rest on owned inputs.

**Witness:** `Completed/InfinitaryLogic/README.md:425` names as targets the successor and limit laws, monotonicity and symmetry; neither reflexivity nor transitivity appears anywhere in that README or in `Completed/InfinitaryLogic/Suggested.lean` (which declares `BFEquiv.succ`, `.limit`, `.monotone` at lines 203–220 and nothing else on `BFEquiv`). The pinned Tau Ceti (`358314d4`) has no `TauCeti/ModelTheory/BackAndForth` directory at all (only `ModelTheory/Algebra`), so `TauCeti.BFEquiv.refl` and `.trans` do not exist at the pin; they exist in Tau Ceti at `85f3eb5` (checked on GitHub), which is later than the pin and not a citable supplier. `CountableModelCounting` on main (README lines 159–162) also cites them to Tau Ceti, not to any roadmap section, so no roadmap on main owns them. The `_root_` declarations at `Suggested.lean:437–452` put admitted theorems into the parent's namespace to fill the hole. Transitivity is a genuine theorem (induction on the level, three structures in three universes); nothing on main or at the pin proves it.

**Repair:** State reflexivity and transitivity of `BFEquiv` across structures of any universes as targets of §4.1 of this roadmap, in this roadmap's own namespace, each by transfinite induction on the level from the parent's `BFEquiv.succ` and `BFEquiv.limit` (both parent targets), with `*Needs:*` lines naming them; correct the supplier row at README 117 to list only what InfinitaryLogic Layer 1 states (successor and limit laws, monotonicity, symmetry); delete the three `_root_` stand-ins. When the Tau Ceti pin passes `85f3eb5`, the two targets become citations of `TauCeti.BFEquiv.refl` and `TauCeti.BFEquiv.trans`. The setoid then uses this roadmap's own reflexivity and transitivity plus the parent's symmetry. Check on the witness pair: the nullary-disagreement codes stay unrelated at level 0 (atomic types differ), identical codes stay related.

## R03 (P2) — The acceptance file still imports the parent prototype and now carries five copied supplier declarations

**Location:** `TauCetiRoadmap/CountableStructureSpaces/Suggested.lean:2` (`import Completed.InfinitaryLogic.Suggested`), 437–452 (three `_root_.TauCetiRoadmap.InfinitaryLogic.BFEquiv.*` stand-ins), 662–690 (`PCMem`, `pcSeparation`); gate `imports=1`.

**Claim:** The file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti.

**Witness:** Carried from the previous R03, which the pull-request text keeps by choice; the diff since `bcfbb31` adds three more stand-ins declared with `_root_` under another roadmap's namespace, each with an admitted proof. At the pin, `BFEquiv`, `SelfStabilizesCompletely`, `scottSentence` and the infinitary syntax exist only in the parent's prototype, not in Tau Ceti (its `ModelTheory` directory contains only `Algebra`). The gate refuses any import other than `Mathlib` and `TauCeti.*` modules.

**Repair:** As in the previous R03: remove the roadmap import and every copied supplier declaration (the three `BFEquiv` laws, `PCMem`, `pcSeparation`); keep the headlines statable on native carriers (the coding space, the permutation group, the action, the invariant σ-algebra, trees, tree heights, the well-order class and its non-analyticity) and name in the module docstring the headlines that need the infinitary carriers (satisfaction, the Scott height comparisons, López–Escobar in sentence form, PC separation) as not statable at the pins with the missing carrier. This also resolves R01's import component and removes the `_root_` declarations of R02.

## R04 (P3) — Padding in the acceptance file, now including the countable corollary of the constant-chain bound

**Location:** `TauCetiRoadmap/CountableStructureSpaces/Suggested.lean:129`, 245, 303, 423, 465, 848, 862–868 (the six one-tactic declarations and two worked-example theorems of the previous R07, unchanged), 83–86 (two `inferInstance` examples), and the new `stabilizesCompletely_add_omega0` at 525–528.

**Claim:** Each is a headline acceptance target.

**Witness:** The six one-tactic closures of the previous R07 were rerun by reading; the declarations are unchanged at this head. The new countable case closes from the general bound in one term, elaborated on a scratch copy against the built module:

```lean
theorem probe_countable_case ... (h : SelfStabilizesCompletely (L := L) M β) :
    StabilizesCompletely (L := L) M (β + Ordinal.omega0) :=
  fun _N _ _ _n _a _b hab => bfEquiv_of_selfStabilizesCompletely h hab _
```

**Repair:** Delete these declarations from `Suggested.lean`; the README keeps each fact (the countable case stays in §4.2 as the sentence that follows the general bound). Do not prove them in place.

## R05 (P3) — No claim-level locators on the sampled targets

**Location:** `TauCetiRoadmap/CountableStructureSpaces/README.md:259–625` (§§1.1–6.2); §4.2 at 415–455 contains no theorem, section or page locator.

**Claim:** Each theorem has an exact locator into a legal source.

**Witness:** Carried from the previous R08; the diff adds no locator. Marker, Gao and Keisler are still cited as whole books; the provenance table at 756–763 gives file names. The constant-chain bound now says where its argument comes from (`RefinementCount.lean`, `countableRefinementHypothesis`) but not the revision-and-declaration form the previous review asked for.

**Repair:** As in the previous R08: attach a theorem-and-page locator to each claim (the previous report's seeded audit gives usable ones for Vaught 1974 §3 and the 2013 Marker notes), cite the reference formalization by immutable revision and declaration, and mark texts not readable legally as uncertified.

## R06 (P3) — Definitions still lack three discriminating Checks

**Location:** `TauCetiRoadmap/CountableStructureSpaces/README.md:363–366` (`KBLT`), 466–496 (`bfTree`, and `prefixTree`, which exists only in `Suggested.lean`), 504–535 (the witness vocabulary); the README has no `**Checks.**` list.

**Claim:** Every definition has at least three discriminating Checks.

**Witness:** Partly repaired: the Layer 1 acceptance check at 302–306 now uses the 3-cycle, which separates the action from the inverse convention, and a noncommuting product (both values recomputed below and correct). The other definitions named in the previous R09 still have none; a grep for `**Checks.**` finds zero lists.

**Repair:** As in the previous R09: add a `**Checks.**` list to each definition, for tree height with ∅ ↦ 0, root-only ↦ 1, decreasing naturals ↦ ω + 1; for `KBLT` the three computed comparisons; for the witness sentences the standard model, a finite cycle and a non-numeral extra component.

## R07 (P3) — The README still lacks the required shape and local dependencies

**Location:** `TauCetiRoadmap/CountableStructureSpaces/README.md:1–50`, 104–120, and the ends of Layers 0–6.

**Claim:** The overview table is a sufficient build specification.

**Witness:** Carried from the previous R10: zero `*Needs:*` lines, zero `### Dependencies` and `### Examples` headings, no `**Summary.**` paragraph, no `## Exact supplier contracts` or `## How to read the build` section (the supplier table is under `## Existing library and ownership`).

**Repair:** As in the previous R10, with the new targets included: the constant-chain bound needs the parent's `BFEquiv.succ`, `BFEquiv.limit`, monotonicity and symmetry, `SelfStabilizesCompletely.bfEquiv_of_le`, and this roadmap's transitivity (R02); the setoid needs reflexivity, symmetry and transitivity; §6.2 needs Layer 3 only, §6.1 needs Layer 5.

## R08 (P3) — `set_option` in the acceptance file

**Location:** `TauCetiRoadmap/CountableStructureSpaces/Suggested.lean:23`; gate `set_option=1`.

**Claim:** The file elaborates under the default options.

**Witness:** Carried from the previous R11; the pull-request text keeps `autoImplicit false` by choice. The rule admits no option of any kind.

**Repair:** Delete the line; every binder in the file is already explicit (the elaboration of the probe shows no auto-bound variable), so nothing else changes.

## R09 (P3) — Pull-request numbers and process words in the README and the Lean docstrings

**Location:** `TauCetiRoadmap/CountableStructureSpaces/README.md:47–48`, 96, 118–119, 165, 181, 191, 355, 722, 740–742, 748, 753; `Suggested.lean:16–18`, 427–434.

**Claim:** Citations name roadmaps and sections; the text is timeless.

**Witness:** Carried from the previous R12. The gate flags `prnum=1` (line 119, "Mathlib #42693") and `residue=2` ("checkpoint" at 748 and 753). Other numbered pull requests remain at 47, 48, 165 (#1317, #1315, #1318), 96, 191, 355 (#41946), 118 and 722 (Tau Ceti #18977); "stand-ins" at 181 and in the Lean docstrings at 16–18 and 427–434, which also record a revision "later than this repository's Tau Ceti pin".

**Repair:** Cite roadmaps by name and section only; keep provenance as repository, immutable revision and declaration without "checkpoint"; remove the stand-in narrative from the docstrings (it disappears with R03).

## R10 (P3) — Four README names claim declarations the acceptance file does not have

**Location:** `TauCetiRoadmap/CountableStructureSpaces/README.md:355` (`body_mono`), 419 (`StabilizesCompletely.bfEquiv_of_le`), 422 (`stabilizesCompletely_iff_univ`), 601 (`isomorphismInvariant_wellOrderClass`); gate `readme-ids-missing=4`.

**Claim:** Each backticked name of this roadmap's own is declared in `Suggested.lean`.

**Witness:** Carried from the previous R13; the four names are the same and none is declared (the probe's `#check` of the parent's `SelfStabilizesCompletely.bfEquiv_of_le` resolves, but README 419 names a `StabilizesCompletely.` version that nothing declares).

**Repair:** State the four facts in prose without a Lean name; do not add declarations.

## Previous findings

- R01 — not repaired: the gate still reports `build=2`, the two module-system warnings for `Completed/InfinitaryLogic/Suggested.lean` and this file; the pull-request text defers the migration (this report's R01).
- R02 — repaired: README 115 now cites `FirstOrder.Language.dlo` (for `[L.IsOrdered]`, here `Language.order.dlo`) and the worked example at 649 uses `Language.order.dlo`; both names elaborate at the pin (probe).
- R03 — not repaired: the import of `Completed.InfinitaryLogic.Suggested` and the `PCMem`/`pcSeparation` copies remain, and three further admitted stand-ins were added under the parent's namespace (this report's R03, and R02 for what they stand for).
- R04 — repaired: `bfEquivSetoid` no longer has an admitted field; its `iseqv` is assembled from three named theorems and the gate reports `sorry-data=0`. The three theorems are themselves admitted and their stated owner does not state two of them (this report's R02).
- R05 — repaired: `bfEquiv_of_selfStabilizesCompletely` takes `N : Type w'` with no countability, arbitrary tuples, and concludes `BFEquiv γ` for every `γ : Ordinal.{w}`; README 424–435 states it the same way, with the proof sketch checked below; the countable case is derived (and is padding, this report's R04).
- R06 — repaired: README 240–243 puts `[Countable (Σ l, L.Relations l)] [Countable α]` on the continuum bound and its equality case, states the unrestricted cardinality `2 ^ #(RelQueryOn L α)` and gives the `ℝ` witness `2 ^ 𝔠`; this agrees with the Lean hypotheses at line 149 and with the computation below.
- R07 — not repaired: the six one-tactic declarations, the two worked-example theorems and the two `inferInstance` examples are unchanged; the repair of R05 added one more one-line corollary (this report's R04).
- R08 — not repaired: no locator was added; §4.2 has none (this report's R05).
- R09 — partly repaired: the Layer 1 action check now uses the 3-cycle and a noncommuting product (values correct); no `**Checks.**` list exists for any definition (this report's R06).
- R10 — not repaired: no `*Needs:*` line, no `### Dependencies`/`### Examples`, no `**Summary.**`, no supplier-contracts or how-to-read section (this report's R07).
- R11 — not repaired: `set_option autoImplicit false` at line 23, kept by choice (this report's R08).
- R12 — not repaired: `prnum=1`, `residue=2`, the other pull-request numbers and the stand-in narrative remain (this report's R09).
- R13 — not repaired: the same four names are missing (this report's R10).

## Verified sound

The head is `113f17164edd1357601947de0097d5f52670a62f`; `git status` is clean and `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. The change since `bcfbb31` is confined to the passages reviewed above; no new route-specific shortcut, re-planning, computational algorithm, copied passage, cycle or sorry'd data entered with it.

**Gate (worker's run at this head, data):** FAIL on `set_option=1`, `prnum=1`, `residue=2`, `imports=1`, `readme-ids-missing=4`, `build=2`; `sorry-data` went from 1 to 0, `blob`, `latex`, `tex`, `stray-files`, `depcheck`, `outside-folder` and the rest pass. Every failing check is a finding above (R01, R03, R08, R09, R10).

**Dependency check**, exactly as prescribed, printed one line and no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 233 roadmaps, 2133 edges, 0 problem(s)
```

CountableStructureSpaces is line 379 of the merge order; its suppliers InfinitaryLogic (Completed), BorelEquivalenceRelations, InfinitaryModelExistence and its consumer CountableModelCounting are on main.

**Elaboration.** `lake env lean` on `Suggested.lean` from the worktree root: exit 0 in 22 s, 72 warnings, all `declaration uses sorry`, nothing else. A scratch file importing the built module `TauCetiRoadmap.CountableStructureSpaces.Suggested` elaborated with exit 0 and printed, by `#check @name`, the types of the five changed or new declarations and the supplier declarations they rest on; each agrees with its README statement:

| Declaration | Elaborated binders and type (abridged) | README agreement |
| --- | --- | --- |
| `BFEquiv.refl` (stand-in) | `{M : Type u₃} [L.Structure M] (β : Ordinal.{u₄}) {n} (a : Fin n → M) : BFEquiv β n a a` | law stated at README 407; owner issue R02 |
| `BFEquiv.symm` (stand-in) | `{M : Type u₃} {N : Type u₄} … {β : Ordinal.{u₅}} … : BFEquiv β n a b → BFEquiv β n b a` | parent target (Completed/InfinitaryLogic README 425) |
| `BFEquiv.trans` (stand-in) | `{M : Type u₃} {N : Type u₄} {P : Type u₆} … : BFEquiv β n a b → BFEquiv β n b c → BFEquiv β n a c` | three universes as README 433 says; owner issue R02 |
| `bfEquivSetoid` | `[L.IsRelational] → Ordinal.{0} → Setoid (StructureSpace L)`; relation is definitionally `BFEquiv β 0 Fin.elim0 Fin.elim0` on the decoded structures (`Iff.rfl` closed) | README 407–410 |
| `bfEquiv_of_selfStabilizesCompletely` | `{M : Type u₃} {N : Type u₄} … {β : Ordinal.{u₃}}, SelfStabilizesCompletely M β → ∀ {n a b}, BFEquiv (β + ω) n a b → ∀ γ : Ordinal.{u₃}, BFEquiv γ n a b` | README 424–426: any cardinality, any universe, all tuples, every level (γ in `Ordinal.{w}`, Convention 7) |
| `stabilizesCompletely_add_omega0` | `SelfStabilizesCompletely M β → StabilizesCompletely M (β + ω)` | README 434–435, the countable case |
| `StabilizesCompletely` | `(M : Type u₃) [L.Structure M] → Ordinal.{u₃} → Prop`, quantifying over `N : Type` countable | Convention 8 |
| `mk_structureSpaceOn_le_continuum` | `[Countable (Σ l, L.Relations l)] [Countable α] : #(StructureSpaceOn L α) ≤ 𝔠` | README 240–241 after R06 |
| `SelfStabilizesCompletely`, `SelfStabilizesCompletely.bfEquiv_of_le`, `BFEquiv` (parent prototype) | ordinal universe free (`Ordinal.{u₄}`, `Ordinal.{u₅}`) | the stand-ins' `Ordinal.{u'}` binders are consistent |
| `FirstOrder.Language.dlo`, `Language.order.dlo` | `(L) [L.IsOrdered] → L.Theory`; `Language.order.Theory` | README 115, 649 after R02 |
| `Ordinal.omega0` | `Ordinal.{u}` | — |

No section variable disappeared from a `def` or `theorem` whose type needs it: every hypothesis is in the declaration's own binders (the file carries none in `variable` blocks beyond `L` and `α`).

**Ownership and citations resolved at this head.** Main is the content checkout; the parent is `Completed/InfinitaryLogic` (README 412–427 for `BFEquiv`, 513–527 for `SelfStabilizesCompletely`; `Suggested.lean` 191 `BFEquiv`, 203–220 its laws, 313 `SelfStabilizesCompletely`, 319 `bfEquiv_of_le`). `CountableModelCounting` on main (README 102, 206–208, 348–352) consumes `bfEquivSetoid`, `measurableSet_bfEquivSetoid` and `structureIsoSetoid_le_bfEquivSetoid` from this roadmap, so this roadmap is their owner; its lines 159–162 cite `BFEquiv.refl/.symm/.trans/.comp` to Tau Ceti, not to a roadmap section. A `roadmaps grep` over the 448 open heads and main for `BFEquiv\.(refl|trans|symm)`, `bfEquiv_of_selfStabilizesCompletely`, `stabilizesCompletely_add_omega0` and `bfEquivSetoid` finds the first three only in this pull request and the setoid only here and in CountableModelCounting as a consumer: no second owner. The pinned Tau Ceti directory `TauCeti/ModelTheory` contains only `Algebra`; `TauCeti/ModelTheory/BackAndForth/Equivalence.lean` at `85f3eb5` on GitHub declares `TauCeti.BFEquiv.refl`, `.symm`, `.trans` with the ordinal in its own universe, confirming the docstring's claim about a later revision and that nothing of it is at the pin.

**Seeded sample, where it falls in the changed passages.** §1.2 (the action check) and §4.2 (the constant-chain bound) changed; the other ten sampled targets are untouched and their audit stands as in the previous report. §1.2: the convention `(σ • c) ⟨R, v⟩ = c ⟨R, σ⁻¹ ∘ v⟩` is Mathlib's `arrowAction` (previous report, `Mathlib/Algebra/Group/Action/Basic.lean:100`) and Vaught's (previous report, `vaught1974` lines 389–404, §3, p. 282); the new check's values are recomputed below. §4.2: the reference proof (`RefinementCount.lean` at `518a366`, read in the previous review, lines 63–125) carries `[Countable N]`; the README now says so (761) and states the arbitrary-`N` form as an adaptation. I checked the adaptation step by step: from `BFEquiv (β + k) (snoc a m) (snoc b m')` and the back clause of `BFEquiv (succ (β + k + 1)) n a b` for `m'`, some `w` has `BFEquiv (β + k + 1) (snoc a w) (snoc b m')`; monotonicity and symmetry give `BFEquiv (β + k) (snoc b m') (snoc a w)`, transitivity gives `BFEquiv (β + k) (snoc a m) (snoc a w)` inside `M`, monotonicity gives level `β`, `SelfStabilizesCompletely.bfEquiv_of_le` lifts it to `β + k + 1`, and transitivity with the `w` clause gives `BFEquiv (β + k + 1) (snoc a m) (snoc b m')`. The forth and back cases are symmetric. So the pairs equivalent at every `β + k` form a tuple back-and-forth system, and transfinite induction on `γ` (successor: the system; limit: `BFEquiv.limit`) gives every level. `β + ω` is a limit ordinal, so `BFEquiv.limit` turns the hypothesis into all `β + k`. No countability of `N` enters. The sketch's "needs only `BFEquiv.trans`" also uses symmetry and monotonicity (parent targets) and `bfEquiv_of_le`; that is a wording nit, not a finding.

**Adversarial pass.** Rows for the changed statements, with computed values; the 160 rows of the previous report for the untouched statements are carried by citation (previous report, tables under "Adversarial computations"), the only changes being the two rows marked below. `c_S` is the code of the unary predicate `P = S` on ℕ; T/F are truth values.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `BFEquiv.refl` stand-in | pure ℕ, empty tuple, β = 0 and β = ω; one nullary symbol true | atomic type of a tuple with itself: every index agrees, T; forth/back by the identity at every level, T; nullary symbol T = T | law holds | owner R02 |
| `BFEquiv.symm` stand-in | (c_∅, c_{0}) at β = 0, 1; nullary disagreement at β = 0 | β = 0: T/T (no nullary symbol, empty tuples agree); β = 1: F/F (element 0 of c_{0} has no P-partner, and conversely no P-element to send 0 to); nullary: F/F | symmetric in each case | parent target |
| `BFEquiv.trans` stand-in | M = ℕ pure in `Type`, N = `ULift ℕ` in `Type 1`, P = ℝ pure; chain c_∅, c_{0}, c_{0,1} | infinite pure sets: all three pairs T at every level, conclusion T; chain at β = 0: T, T ⊢ T (empty tuples, no nullary symbols); at β = 1: c_∅ ~ c_{0} is F so the hypothesis fails and nothing is claimed | no counterexample | owner R02 |
| `bfEquivSetoid β` | diagonal (c, c); nullary disagreement; (c_∅, c_{0}) at β = 0 and 1 | relation is definitionally the parent's `BFEquiv β 0` (`Iff.rfl`); diagonal T; nullary off-diagonal F; (c_∅, c_{0}) T at 0, F at 1 | pass; relation unchanged from `bcfbb31` | R04 repaired; R03 stand-ins |
| `bfEquiv_of_selfStabilizesCompletely` | M = ℕ pure, β = 0, N = ℝ pure, empty tuples; same M with N = `Fin 3`; M = `Fin 2` pure, N = ℕ; M, N differing on a nullary symbol; M = K₂ ⊔ K₃ (s = 2), N = K₂ ⊔ K₃ ⊔ K₃; N an isomorphic copy of M in `Type 1` | ℕ self-stabilizes at 0 (same equality pattern ⇒ automorphic); BF_ω(∅, ∅) between infinite pure sets T, conclusion T at every γ; N = `Fin 3`: BF_4 of empty tuples F (a fourth distinct element has no partner) so BF_ω F, vacuous; `Fin 2` vs ℕ: BF_3 F, vacuous; nullary: BF_0 F, vacuous; 5 vs 8 vertices: BF_9 F, vacuous; isomorphic copy: T ⇒ T | pass; proof sketch checked above | R05 repaired |
| `stabilizesCompletely_add_omega0` | ℕ pure, β = 0; `Fin 2` pure, β = 0 | ℕ at ω: countable N finite gives BF_ω F; N infinite pure gives T ⇒ T; `Fin 2` at ω: N of size ≠ 2 BF_ω F, size 2 T ⇒ T, consistent with the least external level 3 ≤ ω | pass; closes in one term from the general bound | R04 padding |
| continuum bound and equality case (README 240–243) | one unary symbol on `Fin 2`, ℕ, ℝ; one nullary symbol on ℕ | `#(Q → Bool) = 2^#Q`: 4 ≤ 𝔠; 2^ℵ₀ = 𝔠 (α infinite, arity 1: Q countably infinite); #Q = 𝔠 gives 2^𝔠 > 𝔠, now excluded by the hypotheses and matched by the stated formula; nullary only: #Q = 1, 2 ≠ 𝔠, excluded by "positive arity" | pass | R06 repaired |
| action check (README 302–306) | σ = (0 1 2), τ = (0 1), c = c_{0} | `(σ • c) x = c (σ⁻¹ x)` is T iff σ⁻¹ x = 0 iff x = 1: P = {1}; inverse convention T iff σ x = 0 iff x = 2: P = {2}; σ(0) = 1 ∈ {1}, so σ is an isomorphism c → σ • c; `(σ τ) • c`: P = {σ(τ 0)} = {2}; `τ • (σ • c)`: P = {τ 1} = {0}; `σ • (τ • c)`: τ • c = c_{1}, then {σ 1} = {2} = `(σ τ) • c`, a left action | pass; the 3-cycle separates the convention, the transposition does not (σ = σ⁻¹) | R09 partly |
| supplier row, `BFEquiv` laws (README 117) | parent README 425; parent Lean 203–220; pin directory listing; CountableModelCounting 159–162 | parent states succ, limit, monotonicity, symmetry: 4 of the 6 listed; reflexivity, transitivity: stated nowhere on main, absent at the pin, present at `85f3eb5` | drift | R02 |
| DLO worked example (README 649) | ℚ with its order; ℕ with its order | `Language.order.dlo` elaborates; ℚ satisfies linearity, density, no endpoints: T; ℕ fails density and no-bottom: F | pass | R02 (previous) repaired |

**Headline coverage.** Unchanged since the previous review: the endpoints are all attempted; the defect remains the use of unavailable infinitary carriers (R03), not absence of a statable headline. The native headlines (Polish permutation group, continuous action, invariant σ-algebra, tree boundedness, non-analyticity of the well-order class) remain statable and stated.

## Not verifiable

- **Kechris (1995), Gao (2009), Keisler (1971), Marker (2016) published numbering:** as in the previous report (paywalled or not legally readable; the 2013 Marker notes were read instead). The diff cites none of them anew.
- **Tau Ceti beyond the pin:** `TauCeti.BFEquiv.refl/.symm/.trans` at `85f3eb5` were read on GitHub only to confirm the docstring's claim; they are not at the pin and were not treated as suppliers.
- **The reference formalization's `countableRefinementHypothesis`** was read in the previous review, not re-read; its `[Countable N]` binders are as that report records.

## Source issues

- none (the changed passages cite no new source passage; the errata of the previous report for the 2013 Marker notes stand).
