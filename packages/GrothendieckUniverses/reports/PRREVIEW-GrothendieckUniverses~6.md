# Review of GrothendieckUniverses (pull request #1783 at 8cb2b62)

**Verdict:** needs changes

Incremental re-review of the 75 lines changed since b6c8e9a (the repairs of R01–R04 of the previous review, in 0.2, 1.1, 1.2, 1.3, the Conventions, the supplier contracts and two statements of `Suggested.lean`). All four previous findings are repaired; the route of 1.2 now closes on inputs the roadmap owns. Two residues remain, both P3 and both one-line edits.

## R01 (P3) — `isInaccessible_card` is an iff in the README and an implication in the Lean

Location: `TauCetiRoadmap/GrothendieckUniverses/README.md` lines 209–211 ("`IsGrothendieckUniverse.isInaccessible_card`: `card U` is inaccessible in Mathlib's sense exactly when `ZFSet.omega ∈ U`"); `TauCetiRoadmap/GrothendieckUniverses/Suggested.lean` lines 85–86.

Claim: the backticked name is attached to a biconditional, but the declaration it names states only `omega ∈ U → (card U).IsInaccessible` (its elaborated type, checked with `#check @IsGrothendieckUniverse.isInaccessible_card`: `∀ {U : ZFSet}, IsGrothendieckUniverse U → omega ∈ U → U.card.IsInaccessible`), and its docstring (line 83–84) says the same one direction. The README's generality exceeds the Lean's under the same name. Witness that the converse is a separate claim: for `U = V_ κ.ord`, `card U = κ` inaccessible gives `α(U) = κ > ℵ₀`, hence an element of `U` of cardinality `≥ ℵ₀` and, by 0.2, `omega ∈ U`; that step runs through 0.2's "`omega ∈ U` iff `U` has an infinite element", which the Lean statement does not encode.

Repair (either one): state the biconditional in `Suggested.lean`, `theorem IsGrothendieckUniverse.isInaccessible_card {U : ZFSet.{u}} (hU : IsGrothendieckUniverse U) : (card U).IsInaccessible ↔ omega ∈ U`, and adjust its docstring and the module docstring (line 25) to "has inaccessible cardinality exactly when it contains `ω`"; or keep the Lean as it is and write in README 1.3 "`IsGrothendieckUniverse.isInaccessible_card`: `card U` is inaccessible in Mathlib's sense when `ZFSet.omega ∈ U`; conversely, if `card U` is inaccessible then `U` has an element of cardinality `≥ ℵ₀`, so `ZFSet.omega ∈ U` by 0.2". The first is the better headline; with it the first Check of 1.3 reads as the negative control for both directions at `U = V_ ω` (`ℵ₀` not inaccessible, `omega ∉ V_ ω`).

## R02 (P3) — `Cardinal.ord` is filed under the wrong Mathlib file

Location: `TauCetiRoadmap/GrothendieckUniverses/README.md` lines 87–88 ("`Cardinal.IsRegular`, `Cardinal.preBeth`, `Cardinal.ord`, `Cardinal.le_preBeth_ord` (`Mathlib/SetTheory/Cardinal/Regular.lean`, `Aleph.lean`)").

Claim: at the pin (Mathlib 1b1ccf4b) `Cardinal.ord` is declared in `Mathlib/SetTheory/Ordinal/Basic.lean` (line 980), not in `Regular.lean` or `Aleph.lean`. The other names on the line are placed correctly (`IsRegular`: Regular.lean line 40; `preBeth`: Aleph.lean line 549; `le_preBeth_ord`: Aleph.lean line 633; `IsStrongLimit`: Order.lean line 432, as the repair of the previous R03(4) says). Repair: move `Cardinal.ord` to its own clause, "`Cardinal.ord` (`Mathlib/SetTheory/Ordinal/Basic.lean`)".

## Previous findings

- R01 — repaired: 0.2 (lines 128–134) defines `α(U)` as the least cardinal bounding the cardinalities of elements, proves it regular and a strong limit and Kruse's criterion `x ∈ U ↔ x ⊆ U ∧ card x < α(U)` (kruse1965 lines 113–119); 1.2 (lines 186–193) runs on `α(U)`, uses the criterion at the successor step and the regularity of `α(U)` in the second inclusion, and its *Needs:* line lists 0.2; the ℶ_ω witness is now a Check (lines 201–203). The route closes (values below).
- R02 — repaired: `eq_vonNeumann_card` (Suggested.lean line 91–92) has no `hω`; README 1.3 line 208–209 says "for every universe"; the first Check of 1.3 computes `V_ ω`. The accompanying rewording of `isInaccessible_card` as "exactly when" is the new R01.
- R03 — repaired: (1) Suggested.lean line 66 says Shepherdson 1952; (2) 1.1 line 161–162 cites Williams (b), (c) with Kruse Theorem 1 (b)⇒(a), p. 98; (3) 1.2 line 186 cites Kruse Theorem 1, p. 98; (4) `Cardinal.IsStrongLimit` is filed under `Order.lean` (lines 88–89). The same line misfiles `Cardinal.ord`: the new R02.
- R04 — repaired: Conventions lines 52–57 attribute the `2^ξ < α` clause to Kruse 1965, p. 96, and the `ξ^η < α` clause to Williams 1969, p. 1, "which also admits `2`"; both read against the texts (kruse1965 line 39–42; williams1969 p. 1, IA1–IA2, read on the page image, OCR line 44 being garbled).

## Verified sound

**Gate and build.** The worker's gate at 8cb2b62 passes every check (build 0, depcheck 0, stray-files 0, outside-folder 0). `git diff --stat origin/main...HEAD` outside the folder is empty at this head (the merge base is the tip of main; the long list in the change summary is against an older base). `lake env lean` on `TauCetiRoadmap/GrothendieckUniverses/Suggested.lean` from the worktree: 8 `declaration uses sorry` warnings (lines 67, 72, 78, 85, 91, 99, 104, 112) and nothing else. Depcheck: `depcheck: 240 roadmaps, 2350 edges, 0 problem(s)`; no UPWARD or CYCLE line; the roadmap consumes no roadmap.

**Pins.** The merge from main moved the pins to Mathlib 1b1ccf4b and Tau Ceti 2fd255d9 (the previous review read Mathlib f6090c70). Every library name the README cites was re-found at the new pin: `ZFSet.mem_powerset`, `sUnion`, `iUnion`, `mem_iUnion`, `range`, `small_coe`, `pair`, `prod` (Basic.lean 701), `omega`, `regularity` (`ZFC/Basic.lean`); `IsTransitive` and `Ordinal.toZFSet` (`ZFC/Ordinal.lean` 299, with `rank_toZFSet` 313 and `mem_toZFSet_iff` 306); `rank_lt_of_mem` (`ZFC/Rank.lean`); `mem_vonNeumann` 76, `rank_vonNeumann` 88, `vonNeumann_mem_vonNeumann_iff` 94, `vonNeumann_add_one`, `isTransitive_vonNeumann`, `vonNeumann_subset_of_le`, `card_vonNeumann` 141 (`(V_ o).card = preBeth o`) (`ZFC/VonNeumann.lean`); `card_mono` 42, `card_empty`, `card_singleton` (`ZFC/Cardinal.lean`); `IsInaccessible` 302 (fields `aleph0_lt`, `le_cof_ord`, `isStrongPrelimit`), `.isRegular` 319, `.isStrongLimit` 322, `.univ` 333, `.preBeth_ord` 336, `IsRegular` (`Cardinal/Regular.lean`); `IsStrongLimit` 432 (fields `ne_zero`, `isStrongPrelimit`) (`Cardinal/Order.lean`); `IsStrongLimit.aleph0_le` (`Cardinal/Basic.lean` 391, so a strong limit is infinite, which the case split of 1.2 needs); `preBeth` 549, `preBeth_strictMono` 554, `preBeth_limit` 592, `le_preBeth_ord` 633 (`Cardinal/Aleph.lean`). Tau Ceti 2fd255d9 now has `SetTheory/Cardinal`, `SetTheory/Descriptive` and `SetTheory/Ordinal`; none mentions `ZFSet`, universes or `IsInaccessible`, so "nothing from Tau Ceti" still holds, and no Grothendieck-universe predicate exists in Mathlib's `SetTheory` at the pin. Ownership against open pull requests: the overlap tool lists no pull request changing this roadmap and HanfNumbers as the only neighbour; it consumes `ZFSet.vonNeumann` and defines no universe notion (unchanged since the previous review).

**Signatures.** `#check @name` for all 9 declarations through a scratch importer of the built module: each elaborated type agrees with its README statement; the file has no `variable` block, so nothing can be dropped. `eq_vonNeumann_card : ∀ {U}, IsGrothendieckUniverse U → U = V_ U.card.ord`, as README 1.3 now states.

**One-tactic probe** on the changed statement `eq_vonNeumann_card` (the others carry the previous report's result): `simp` and `simp_all` make no progress, `rfl` fails, `exact?` finds only the theorem itself. Not padding.

**Sources read.** kruse1965 (Numdam CM_1965-1966__17__96_0): definition of inaccessible lines 39–42; the universe axioms with "nonvoid" lines 74–83; Theorem 1 lines 106–111; its proof (a)⇒(b) lines 113–119 (α the least cardinal bounding `card X` for `X ∈ U`; inaccessibility from (i) and (iv); the criterion from (ii) and (i)); (b)⇒(c)⇒(a) lines 120–124. williams1969 (Numdam CM_1969__21_1_1_0): UA1–UA5 lines 32–37; IA1–IA2 lines 42–45 and on the page image (`ξ^η < α`); (a)–(c) p. 2 on the page image ((c) is the iff `x ∈ Ψ(α) ⇔ x ⊆ Ψ(α) & card x < α`); Kruse's result quoted as an iff p. 2; Theorem 1 and its induction `A(β) : β < α(U) ⇒ Ψ(β) ⊆ U` lines 69–83; Theorem 2 `card U = α(U)` lines 92–97.

**Locators of the changed passages.** Conventions: Kruse p. 96 ✓, Williams p. 1 ✓. 0.2: Kruse Theorem 1 (a)⇒(b), p. 98 ✓ (the README's `α(U)` is Kruse's α, line 113–114). 1.1: Williams (b), (c) p. 2 ✓ with Kruse Theorem 1 (b)⇒(a) p. 98 ✓ (Kruse proves it through (c), the roadmap's route is direct; the citation is of the theorem). 1.2: Williams Theorem 1 p. 2 ✓, Kruse Theorem 1 p. 98 ✓. 1.3: Williams Theorem 2 p. 3 ✓ (`card U = α(U)`, from `card Ψ(α) = α`). The sampled targets 0.1, 2.1, 2.2 and 2.3 are untouched by the diff; their locators stand as verified in the previous report.

**The route of 1.2, checked step by step.** Induction claim `V_ β ∈ U` for `β < α.ord`, `α = α(U)`. Base: `V_ 0 = ∅ ∈ U` (0.2). Successor: `V_ β ∈ U` gives `V_ (β+1) = (V_ β).powerset ⊆ U` by closure under subsets, `card V_ (β+1) = 2^(card V_ β) < α` since `card V_ β < α` (definition of `α(U)`) and `α` is a strong limit, so `V_ (β+1) ∈ U` by the criterion (UA2 gives it in one step as well; Williams's own induction, line 74–78, proves `Ψ(β) ⊆ U` and uses the criterion on `Ψ(β)` then UA2). Limit `β`: the index set `β.toZFSet` has rank `β` (`rank_toZFSet`), its elements `γ.toZFSet`, `γ < β`, lie in `V_ (γ+1) ∈ U`, so `β.toZFSet ⊆ U` with `card β.toZFSet = card β < α` (`β < α.ord`), hence `β.toZFSet ∈ U` by the criterion, and UA4 gives `V_ β = ⋃_{γ < β} V_ γ ∈ U`. Then `V_ α.ord ⊆ U`. Second inclusion as the README says: an `∈`-minimal `x ∈ U \ V_ α.ord` has `x ⊆ V_ α.ord` (UA1 and minimality), `card x < α`, and `rank x = sup_{y ∈ x} (rank y + 1)` is a supremum of fewer than `α` ordinals below `α.ord`, hence `< α.ord` by the regularity of `α`. Case split: `α` is a strong limit so `ℵ₀ ≤ α` (`IsStrongLimit.aleph0_le`); `α = ℵ₀` gives `U = V_ ω`, `α > ℵ₀` gives `α` inaccessible (`aleph0_lt`, `le_cof_ord` from regularity, `isStrongPrelimit`). Every input is 0.2, 1.1 or a pinned declaration; nothing is circular.

**Adversarial table** (rows for untouched statements carried from the previous report, cited as "r5"):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: Kruse's clauses | `α = 0, 1, 2, ℵ₀` | `0`: both clauses vacuous, admitted; `1`: `2^0 = 1 ≮ 1`; `2`: `2^1 = 2 ≮ 2`; `ℵ₀`: finite unions of finite sets finite, `2^n` finite | list "`0`, `ℵ₀`, Mathlib's inaccessibles" right for the clauses as written (Kruse's own "ℵ₀ is the first", line 42, ignores `0`: Source issues) | none |
| Conventions: Williams's IA2 | `α = 2` | `0^0 = 1`, `0^1 = 0`, `1^0 = 1`, `1^1 = 1`, all `< 2`; IA1: a family of `≤ 1` set of size `≤ 1` has union of size `≤ 1` | "also admits `2`" right | none |
| 0.2 `α(U)` exists | `U = V_ ω`; `U = V_ κ.ord` | the set of bounds contains `card U` (0.2 bound), is well-ordered, has a least element; `α(V_ ω) = ℵ₀` (`card V_ n = preBeth n ≥ n`, elements finite); `α(V_ κ.ord) = κ` (`preBeth β < κ` for `β < κ.ord`; `V_ (c.ord+1) ∈ U` has `card ≥ 2^c > c` for `c < κ`) | true | none |
| 0.2 `α(U)` regular | `U = V_ ω`; `V_ κ.ord`; negative control `V_ (ω+ω)` (no UA4) | cofinal family of `cof α` sets of sizes `< α` indexed by an element of size `cof α < α`, union in `U` by UA4 of size `≥ α`: contradiction; `V_ (ω+ω)` has "α" `= ℶ_ω`, `cof = ω`, so UA4 is the input | true; UA4 used | none |
| 0.2 `α(U)` strong limit | `x ∈ U`, `card x = c < α` | `powerset x ∈ U` (UA2), `card = 2^c < α`; `α ≠ 0` from `∅ ∈ U` | true | none |
| 0.2 Kruse's criterion | ⇒; ⇐ with `x ⊆ U`, `card x < α`; `x = ∅` | ⇒: UA1 and the definition of `α`; ⇐: some `y ∈ U` has `card y = card x` (closure under subsets of a larger element), `x = ⋃_{i ∈ y} {g i}` by UA3 and UA4; `∅ ∈ U` separately (Kruse line 119) | true | none |
| 0.2 `omega ∈ U ⇐` infinite element | `x ∈ U` infinite | a countable `y ⊆ x` is in `U`, `omega = ⋃_{i ∈ y} {g i}` with `card omega = ℵ₀ ≤ card y < α`: criterion ⇐ | true, input now owned | none (R01 of r5 closed) |
| 1.2 `V_ α.ord ⊆ U` | successor `β+1`; limit `β`; `β = 0` | `card V_ (β+1) = 2^(preBeth β) < α`; `β.toZFSet`: rank `β`, `card β < α`; `V_ 0 = ∅ ∈ U` | true | none |
| 1.2 `U ⊆ V_ α.ord` | `∈`-minimal `x`; `α = ℶ_ω` (negative control) | `rank x = sup (rank y + 1) < α.ord` by regularity; for `ℶ_ω`, `{V_ (ℶ_n).ord}` has `card ℵ₀ < ℶ_ω`, rank `ℶ_ω.ord` | true; regularity used, as the new Check says | none |
| 1.2 case split | `α = ℵ₀`; `α > ℵ₀` | `V_ ℵ₀.ord = V_ ω`; `α` inaccessible from regular, strong limit, `ℵ₀ < α` | both cases of the iff reached | none |
| 1.3 `card U = α(U)` | `V_ ω`; `V_ κ.ord` | `preBeth ω = ⨆_{n<ω} preBeth n = ℵ₀` (`preBeth_limit`) `= α(V_ ω)`; `preBeth κ.ord = κ` (`IsInaccessible.preBeth_ord`) `= α(V_ κ.ord)` | true | none |
| 1.3 `eq_vonNeumann_card` (no `hω`) | `V_ ω`; `V_ κ.ord` | `ℵ₀.ord = ω`, `V_ ω = V_ ω`; `V_ κ.ord = V_ κ.ord` | true for every universe | none (R02 of r5 closed) |
| 1.3 `isInaccessible_card` | ⇒ at `V_ κ.ord`; ⇐ at `V_ ω`; converse at `V_ κ.ord` | `card = κ` inaccessible; `card V_ ω = ℵ₀`, `ℵ₀ < ℵ₀` fails, `omega ∉ V_ ω` (rank `ω`); converse: `α(U) = κ > ℵ₀` gives an infinite element, then 0.2 | both directions true; Lean states one | R01 |
| 0.1 `IsGrothendieckUniverse` | as r5 | `∅`, `{∅}`, `V_ (ω+1)`, `V_ (ω+ω)`, `V_ ω` (r5) | unchanged | none |
| 1.1 `V_ κ.ord`, `V_ ω` universes | as r5 | `ℵ₁`, `ℶ_ω` negative controls (r5) | statement unchanged; locator extended | none |
| 2.1, 2.2, 2.3 | as r5 | r5's values | unchanged by the diff | none |

**Shape.** The new prose of 0.2, 1.2 and 1.3 is prose with locators at the claims and *Needs:* lines item by item; the new Checks (0.2 fourth, 1.2 fourth, 1.3 first) compute values; no LaTeX, no process words, no pull-request numbers, no `set_option`; module header `module` / `public import Mathlib` / `public section`; `theorem` throughout; one docstring per declaration; the module docstring names what is not stated (0.2's closure properties, deliberately).

## Not verifiable

- tarski1938 and shepherdson1952: as in the previous report (impan.pl page in no licence class; JSTOR landing page). No changed passage depends on them.
- sabbagh1969, Ewald 1996, Kanamori 2003, SGA 4, Bourbaki, Krömer 2006, Kashiwara–Schapira 2006, the Bourbaki archive items: context and bibliography only; not read.

## Source issues

- **Gap** in kruse1965 at p. 96, the definition of inaccessible (line 39–42): the source says ℵ₀ is the first inaccessible cardinal; the two clauses as written are vacuous at `α = 0`, so `0` also satisfies them (Kruse evidently intends nonzero cardinals); affects nothing (Theorem 1's α is `≥ ℵ₀` for a nonvoid universe).
- **Error** in williams1969 at p. 1–2, IA1–IA2 and (c): as recorded in the previous report, the narrow-sense definition admits `α = 2` and (c) fails there; affects nothing here.
- **Misprint** in williams1969 at p. 1 (abstract and the sentence after (3)): "rank α" and "rank ≤ β" for "rank < β"; as in the previous report; affects nothing.
