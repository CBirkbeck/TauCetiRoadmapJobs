# Review of FlagVarieties (pull request #1762 at 670f067)

**Verdict:** needs changes

🤖 Independent AI review (full re-review: the folder changed by 223 lines since b3bd0b6). Eight findings, three blocking (two P1, one P2). The mathematics of the five headline classifications survived every concrete check below, and the characteristic-zero restriction of the previous round is gone. What blocks is that the roadmap's own GL layer consumes its own conclusion as an unowned "gap", that every supplier gap is written as a ReductiveGroups target the supplier does not state instead of as a declared gap, and that the one headline statable at the pins is absent from `Suggested.lean`. The gate also fails on three style rules.

**Status of the previous review's findings (PRREVIEW-FlagVarieties~1 at b3bd0b6).**

| Previous | Passage at 670f067 | Status |
| --- | --- | --- |
| R01 (P1) acceptance file absent | `TauCetiRoadmap/FlagVarieties/Suggested.lean` exists, 75 lines, elaborates with only the `sorry` warning | repaired |
| R02 (P1) native parabolic APIs not at the pins | README 23–31, 42, 104, 126: "`HopfIdeal.IsParabolicOverAlgClosed`: declared gap at the pin", "ReductiveGroups 7/7b target `TauCeti.TitsSystem.standardParabolicOrderIso` (declared gap at the pin)" | partly: the claims of availability are gone, but the gaps are not declared in the project's form and are attributed to supplier sections that do not state them (R02 below) |
| R03 (P1) complete-`G/B` route without a contract | README 30: "declared gaps: independent complete-Borel-quotient theorem and fixed-point theorem"; 118: "unconditional `IsBorelOverAlgClosed.exists_conjugate_eq` from `Borel/Conjugacy/Existence.lean`" | partly: named as gaps, no `needs` sentence, a file path that does not exist at the pin (R02) |
| R04 (P2) already-supplied API restated | README 26, 62: "cite the existing identity, inverse and composition laws in `HopfIdeal/Conjugation.lean`" | repaired in the README; `Suggested.lean` 38–54 now restates two pinned lemmas (R04 below) |
| R05 (P2) characteristic-zero restriction | README 5, 11, 12: smooth hypotheses in every characteristic, Cartier only as the characteristic-zero corollary | repaired |
| R06 (P3) claim-local locators | README 220–222 "Claim-local source locators"; `sources.toml` added inside the folder | partly: locators present and checked below; the manifest is a stray file and "§7.7" is not a Milne label (R05, R07) |
| R07 (P3) per-definition Checks | README 206–214 "## Checks", four groups | partly: three discriminating computations per definition exist, collected in one section rather than at the definitions (R06) |
| R08 (P3) roadmap structure | `# Roadmap:` title, supplier table, `*Needs:*` lines, "How to read the build" | partly: no `### Examples`/`### Dependencies`, target ids `F0.1` fail the gate, process narrative remains (R05, R06) |

## R01 (P1) — Layer F1A consumes its own conclusion from nobody

**Location:** `TauCetiRoadmap/FlagVarieties/README.md:74`–78: "*Needs:* `standardParabolic_weightParabolicSimple`, `standardParabolic_eq_of_subgroupB_le`, `isParabolicOverAlgClosed_weightParabolicDefiningHopfIdeal` … The first three are declared gaps at the pinned version." Also line 90: `P_J(k) = TitsSystem.standardParabolic J`.

**Claim:** Layer F1A proves that every parabolic Hopf ideal of `GL_{n+1}` containing the upper-triangular ideal is a unique weight ideal, with inputs supplied elsewhere.

**Witness:** None of the three names, nor `TitsSystem.standardParabolic`, occurs in the pinned Tau Ceti (`grep -rn standardParabolic` over `TauCeti/` is empty; `GroupTheory/TitsSystem/Basic.lean:50`–105 and `Bruhat/*.lean` define Bruhat cells only, no `B W_J B` subgroup). No supplier is named for them: the table row "GL Tits system and weight ideal | ReductiveGroups 7C" lists only the two existing declarations. Main `TauCetiRoadmap/ReductiveGroups/README.md:627`–780 (Layers 7, 7C, 7b) plans parabolic subgroup schemes, Bruhat decomposition and type-A block maps, never a weight-ideal/Tits-system comparison for `GL`. The three "gaps" are exactly the statement of F1A: the comparison of the abstract standard parabolic with the weight ideal, the abstract "a subgroup containing `B` is standard", and parabolicity of the weight ideal. With them taken as inputs the layer proves nothing.

**Repair:** Make F1A own its statement. State it as the target "for algebraically closed `k`, every reduced Hopf ideal `I ≤ UpperTriangular.definingHopfIdeal k (n+1)` of `GeneralLinear.coordinateHopfAlgebra k (n+1)` equals `weightParabolicDefiningHopfIdeal k (w J)` for exactly one `J ⊆ Fin n`, where `w J (i) = −#{j < i : j ∉ J}`", with the proof route (block-triangular point description of `P_J(k)`, point separation `HopfIdeal.eq_of_quotientPointsSubgroup_eq` at `HopfIdeal/Points/Separation.lean:84`, and the abstract Tits-system classification). Give the abstract `B W_J B` subgroup and the theorem "every subgroup of `G` containing `B` is `B W_J B` for a unique `J`" either as a target of this roadmap (it is pure group theory on the pinned `TitsSystem`, Bourbaki IV §2.5 Theorem 3) or as a declared gap on ReductiveGroups Layer 7, which owns BN-pairs on main, in the form of R02. Repair test: for `n = 2` the four weights `w ∅ = (0,−1,−2)`, `w {0} = (0,0,−1)`, `w {1} = (0,−1,−1)`, `w S = (0,0,0)` cut out subgroups of orders 8, 24, 24, 168 on `𝔽₂`-points (enumerated below), and the ideal for `J = ∅` has the same relation set as `UpperTriangular.weights 3 = (2,1,0)` because `weightParabolicRelationSet` (`Weight/Parabolic/Basic.lean:54`) depends only on the order pattern of `w`.

## R02 (P1) — Supplier gaps are written as ReductiveGroups targets the supplier does not state

**Location:** `TauCetiRoadmap/FlagVarieties/README.md:23`, 24, 27, 29–32, 42, 104 ("Consume the ReductiveGroups 7/7b target `TauCeti.TitsSystem.standardParabolicOrderIso` (declared gap at the pin)"), 118, 126, 140, 164.

**Claim:** ReductiveGroups Layers 3, 3A, 7 and 7b state, as targets, the parabolic predicate `IsParabolicOverAlgClosed`, the actual reductive-group Tits system with `standardParabolicOrderIso`, the standard-parabolic bridge `P_J(k) = TitsSystem.standardParabolic J`, `normalizer_standardParabolic`, unconditional Borel conjugacy `IsBorelOverAlgClosed.exists_conjugate_eq`, representability of `G/H`, complete `G/B`, the complete-scheme Borel fixed point and the orbit comparison, and that writing "declared gap at the pin" declares them.

**Witness:** On main, `TauCetiRoadmap/ReductiveGroups/README.md` contains none of `standardParabolic`, `IsParabolic`, `normalizer_standard`, `exists_conjugate_eq`, "fixed point theorem" or "complete G/B" (grep over the 2237 lines; the only "fixed-point" hits are Frobenius and Steinberg fixed points at lines 112, 708, 985). Layer 3 (line 234) says representability of `G/H` "is a theorem with hypotheses"; Layer 7 (line 627) names Borel conjugacy, parabolic subgroup schemes and BN-pairs without these declarations. At the pin, `Borel/Conjugation.lean:161` `exists_conjugate_eq_of_isBorelOverAlgClosed` still needs the `hcontain` hypothesis, and the file `Borel/Conjugacy/Existence.lean` named at line 23 does not exist (`Algebra/AlgebraicGroup/Borel/` holds `Conjugation.lean` and `Existence.lean`). The project's declared-gap form is the sentence `What <Supplier> must provide (gap:<slug>): <one-sentence need>` under the supplier's subsection of `## Exact supplier contracts`; no such sentence and no slug exists in this README, and the brief records no `design/plan.json` for this roadmap, so no gap is declared. Line 27 bundles four needs in one cell ("actual reductive-group instance, `standardParabolicOrderIso`, bridge and normalizer").

**Repair:** For each missing input write one contract in the declared form, one need per sentence, with its hypotheses, under a `From TauCetiRoadmap.ReductiveGroups` (or `ShimuraData`) subsection, and drop the phrases "target" and "declared gap at the pin" elsewhere. Tested drafts (each is one statement with its hypotheses, nothing this roadmap or the pin provides):

- `What ReductiveGroups must provide (gap:borel-conjugacy-connected): for a smooth geometrically connected affine group of finite type over an algebraically closed field, any two Hopf ideals satisfying IsBorelOverAlgClosed are conjugate by a rational point, without the hcontain hypothesis of Borel/Conjugation.lean:161.`
- `What ReductiveGroups must provide (gap:borel-pointwise-normalizer): for such a group and a Borel ideal B, a rational point whose conjugation fixes B lies in B(k).`
- `What ReductiveGroups must provide (gap:tits-system-of-points): the Tits system on G(k) with subgroupB = B(k), subgroupN = N_G(T)(k) and simple set the simple reflections of the root system of (G,T), for G smooth connected reductive, T ⊆ B.`
- `What ReductiveGroups must provide (gap:standard-parabolic-scheme): for J a set of simple reflections, the smallest closed subgroup scheme P_J containing B and the root subgroups U_{−α}, α ∈ J, with P_J(k) = B(k) W_J B(k), smooth, connected, P_∅ = B, P_S = G.`
- `What ReductiveGroups must provide (gap:parabolic-predicate): HopfIdeal.IsParabolicOverAlgClosed meaning a smooth closed subgroup scheme whose ideal is contained in some Borel ideal.`
- `What ReductiveGroups must provide (gap:homogeneous-quotient-scheme): for smooth affine G of finite type over k and any closed subgroup scheme H, a separated finite-type k-scheme representing fppfHomogeneousQuotient with its universal property (Milne Theorem 7.18, p. 143).`
- `What ReductiveGroups must provide (gap:complete-borel-quotient): G/B is proper over k for a Borel B of a smooth connected affine G (Milne Theorem 17.9(a), p. 354).`
- `What ReductiveGroups must provide (gap:borel-fixed-point-scheme): a smooth connected solvable group acting on a nonempty proper k-scheme over algebraically closed k has a k-rational fixed point (Milne Corollary 17.3, p. 353).`
- `What ReductiveGroups must provide (gap:orbit-map-quotient): for a transitive action on a smooth separated finite-type X with k-point x and smooth stabilizer H, the orbit map induces an isomorphism G/H ≅ X (Milne Proposition 7.15, p. 142).`

Where the pin already provides the input, cite it instead: Cartier's theorem is `TauCeti.smoothCommHopfAlgProperty_of_charZero` at `Algebra/AlgebraicGroup/Smooth/CharZero.lean:145`, so the "Cartier" of lines 54 and 144 needs no gap. Record the `plan.json` side of each slug with the board when the package is created; the README form is the part this pull request can carry.

## R03 (P2) — The GL-case headline is statable at the pins but absent from `Suggested.lean`

**Location:** `TauCetiRoadmap/FlagVarieties/Suggested.lean:72`–73 (`#check GeneralLinear.weightParabolicDefiningHopfIdeal`, `#check glTitsSystem`) and docstring lines 12–13: "The five headline classifications cannot yet be stated on their intended native carriers"; README 72–78 (Layer F1A).

**Claim:** Nothing beyond the Borel-containment uniqueness statement is statable, so the `GL` carrier is only pinned by `#check`.

**Witness:** The Layer F1A classification elaborates against the pins. A scratch file with the definition `standardWeight J i = −#{j : Fin n | j < i ∧ j ∉ J}` and the theorem

```lean
theorem exists_unique_standardWeight_eq {k : Type u} [Field k] [IsAlgClosed k] (n : ℕ)
    (I : HopfIdeal k (GeneralLinear.coordinateHopfAlgebra k (n + 1)))
    (hIB : I ≤ GeneralLinear.UpperTriangular.definingHopfIdeal k (n + 1))
    [IsReduced (CommHopfAlgCat.quotient (GeneralLinear.coordinateHopfAlgebra k (n + 1)) I)] :
    ∃! J : Finset (Fin n),
      I = GeneralLinear.weightParabolicDefiningHopfIdeal k (standardWeight (J : Set (Fin n)))
```

elaborated with `lake env lean` from the worktree (exit 0, `sorry` the only warning) after `lake build TauCeti.Algebra.AlgebraicGroup.GeneralLinear.UpperTriangular.Basic`; the variant indexed by `J ⊆ (glTitsSystem k n).simple` through `glTitsSystemSimpleRep` also elaborates once `[Nontrivial kˣ]` is added (`glTitsSystem` at `Diagonal/TitsSystem.lean:195` requires it). The `decide` checks `standardWeight ∅ = ![0,−1,−2]`, `standardWeight univ = ![0,0,0]`, `standardWeight {0} = ![0,0,−1]` on `Fin 2` passed.

**Repair:** Add the definition `standardWeight` (the only definition the headline needs) and the theorem above to `Suggested.lean` under a `/-! ## Layer F1A -/` comment, import `TauCeti.Algebra.AlgebraicGroup.GeneralLinear.UpperTriangular.Basic`, name both in the README's F1A prose, and correct the docstring: headline 1 is statable for `GL_{n+1}`; headlines 1–5 for general reductive `G` lack the Tits system on `G(k)`, the standard-parabolic scheme, the parabolic predicate and the represented quotient. Use `IsReduced` or `smoothCommHopfAlgProperty` on the quotient as the smoothness hypothesis; over the algebraically closed base the two agree for group schemes, and the README's F0.1 already says smooth parabolics are reduced.

## R04 (P3) — Two declarations restate pinned lemmas

**Location:** `TauCetiRoadmap/FlagVarieties/Suggested.lean:38`–42 and 45–54: `points_antitone … := by exact CommHopfAlgCat.quotientPointsSubgroup_antitone H A`; `reduced_ideals_eq_of_points_eq … := by exact HopfIdeal.eq_of_quotientPointsSubgroup_eq h`.

**Claim:** These are acceptance statements of the roadmap.

**Witness:** Each closes by one `exact` of the library lemma it renames: `HopfIdeal/Points/Order.lean:55` and `HopfIdeal/Points/Separation.lean:84` at the pin state them verbatim. Neither name occurs in the README, which the rule "every Lean name appears in the README" also requires.

**Repair:** Delete both from `Suggested.lean`; the README's supplier table (lines 25–26) already cites the two pinned declarations. Keep `conjugate_eq_of_borel_le`, which no pinned lemma closes (no unconditional Borel conjugacy or normalizer theorem exists at the pin; see the table below for its instances).

## R05 (P3) — The gate fails on three style rules

**Location:** `TauCetiRoadmap/FlagVarieties/README.md:52`, 60, 66, 84, 102, 114, 124, 132, 142, 150, 160, 166 (`### F0.1 …` … `### F4.2 …`); `TauCetiRoadmap/FlagVarieties/sources.toml`; `TauCetiRoadmap/FlagVarieties/Suggested.lean:1` (`import Mathlib`).

**Claim:** The folder passes the push gate.

**Witness:** The worker's gate at this head: `target-ids=12 stray-files=1 build=1 FAIL`. The twelve target headings carry the `F` prefix; the rule is `### k.n Title` with digits only. `sources.toml` is not a roadmap file ("sources are the README's references"), and README line 222 points readers to it. The build step reports Lake's warning "imports `Mathlib` … designed for use with the module system; consider adding `module`", which the gate counts as a failure; direct `lake env lean` of the file is clean (it never prints Lake's warning).

**Repair:** Rename the headings `### 0.1 Closed subgroups and rational points` and so on (keep the layer headings `## Layer 0: …`, which pass; "F1A" becomes a numbered layer, for instance `## Layer 1: the GL case` with `### 1.1`), delete `sources.toml` from the folder and the sentence that names it (the manifest belongs to the board package), and start `Suggested.lean` with `module`, a blank line, `public import Mathlib`, one `public import TauCeti.…` per used module, the docstring, then `public section` before the namespace (the form of `TypeAHeckeAlgebras/Suggested.lean` on main). Re-run the gate.

## R06 (P3) — Shape, process narrative and README–Lean agreement

**Location:** `TauCetiRoadmap/FlagVarieties/README.md:3` (`## Summary`), 17 (no `## Scope and ownership`), 38 (`## Conventions and native interfaces`), 198–204 ("Mathlib and Zulip coordination … Recheck these four searches at implementation time"; "`Suggested.lean` is a checked prototype"), 206–214 (`## Checks` as a separate section), 216–218 (`## Downstream consumers`), every layer (no `### Examples`, no `### Dependencies`); `Suggested.lean:56`–70.

**Claim:** The README has the TauCetiRoadmap form and agrees with the Lean file.

**Witness:** The upstream shape is an opening `**Summary.**` paragraph, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, layers each ending with `### Examples` and `### Dependencies`, then consumers and references; here the deferrals (line 36) sit inside the contracts section and "How to read the build" follows the references. Lines 198–204 are process narrative. The four `**Checks.**` groups are discriminating (each value was recomputed below) but are not attached to the definitions they test (homogeneous variety at line 47, standard parabolic at 86, type at 120). Line 218 says SchubertGeometry, ShimuraData §3.8 and GroupSchemesOverABase GS7 consume this roadmap, but SchubertGeometry on main (`SchubertGeometry/README.md:21`) consumes ShimuraData §3.8 for `G/P`, ShimuraData is earlier in the merge order (position 103 against 374) and GroupSchemesOverABase (#1522) is not in the order; a consumers section creates no edges, but the claim is wrong. The Lean theorem `conjugate_eq_of_borel_le` holds for every smooth geometrically connected affine `G` and never uses reductivity, nor `hG_smooth`, `hP_smooth`, `hQ_smooth` (the argument conjugates the two Borels of `Q` inside `(Q_red)°` and uses `N_G(B)(k) = B(k)`), while the README states headline 2 for reductive `G` only.

**Repair:** Reorder and rename the headings to the upstream shape, move the deferrals of line 36 into `## Scope and ownership`, delete lines 198–204 (the `Module.Grassmannian` remark belongs in the contracts as a one-line "not the carrier" note), attach each `**Checks.**` list to its definition, end every layer with `### Examples` and `### Dependencies`, and rewrite `## Downstream consumers` to the roadmaps that actually consume these quotients later in the order (none today; say so). In the README say that the uniqueness half of headline 2 holds for every smooth connected affine group, and either drop the three unused smoothness hypotheses from the Lean statement or keep them with a sentence saying the route uses them. Write the two-term conjugation witness of line 212 with a characteristic hypothesis or a matrix that still separates `g` from `g⁻¹` in characteristic 2: over `𝔽₂`, `e₁+e₂ = e₁−e₂`, so `[[1,0],[1,1]]` and its inverse send `⟨e₁⟩` to the same line.

## R07 (P3) — Locators and supplier details

**Location:** `TauCetiRoadmap/FlagVarieties/README.md:222` ("Milne (2017), §7.7 and Proposition 7.15, printed pp.141–142"; "Conrad–Feng (2020), Appendix T.1, p.305, for uniqueness of standard type"); 108 ("Formulate intersections scheme-theoretically, using characteristic-zero smoothness"); 54, 144 ("Cartier").

**Claim:** Each locator names the passage that proves the claim, at the claim's generality.

**Witness:** Milne's Chapter 7 is sectioned by letters; quotients are §7.e "Quotients of affine algebraic groups", printed pp. 141–143 (503f1a7d line 6031), and there is no "§7.7". Proposition 7.15 (line 6061, p. 142) is the fibre-product comparison; the orbit-to-quotient isomorphism F0.3 needs is Proposition 7.11 and the surrounding §7.c–e. Conrad–Feng Appendix T.1 (a0caf508 lines 13449–13457, p. 305) is a recap ("We have seen that each conjugacy class … has a unique standard member"), not the proof. The scheme-theoretic equality `P_J ∩ P_K = P_{J∩K}` holds in every characteristic (two parabolics containing a common maximal torus intersect in a smooth connected group; main ReductiveGroups 7b, line 744, owns the scheme-level intersection theorem), so "using characteristic-zero smoothness" narrows the target below the source. Cartier's theorem exists at the pin (`smoothCommHopfAlgProperty_of_charZero`, `Smooth/CharZero.lean:145`) and is uncited by name. Humphreys is paywalled (uncertified); its section numbers are cited without text, which is allowed, but the README should say so once.

**Repair:** Cite Milne §7.e and Proposition 7.11/7.15 with pp. 141–143 for F0.3; cite the proof source for the standard-conjugacy-representative theorem (Conrad–Feng's proof is in the body, or Milne Theorem 21.91, p. 453, in the split case) and keep T.1 as the statement reference; state the intersection equality in all characteristics citing ReductiveGroups 7b; add the Cartier declaration to the `From Tau Ceti` contracts; mark Humphreys as cited by locator only.

## R08 (P3) — Projectivity of `G/P` has an earlier owner to cite

**Location:** `TauCetiRoadmap/FlagVarieties/README.md:132`–140 (F3.1: "Prove this orbit is closed … so the Chevalley model is projective") and line 29 ("scheme representability … declared gaps").

**Claim:** FlagVarieties owns the projectivity of `G/H` for `H ⊇ B`, with representability a gap on ReductiveGroups 3/3A.

**Witness:** ShimuraData §3.8 (open head at merge-order position 103, earlier than this roadmap) states: "the functor of parabolic subgroup schemes of type `t` is represented by a smooth proper `S`-scheme `Par_t(G)` … projective when `S` is affine", with `G/P → Par_t(G)` an isomorphism; main SchubertGeometry line 21 already defers `G/P` to it. A parabolic in that sense is one with `G/P` proper (SGA3), so the content FlagVarieties adds is exactly "contains a Borel ⇒ `G/H` proper" (Milne 17.16, p. 356) and the comparison of the two notions, not a second projectivity proof. Open SchubertGeometry #1224 S1.0 builds the same `Par_t(G)`, `G/P ≅ Par_t(G)` and schematic self-normalization; it is a revision of a main roadmap and is not a supplier.

**Repair:** In F3.1 consume ShimuraData §3.8's `Par_t(G)` (projective, with `G/P ≅ Par_t(G)`) for the representability and projectivity of `G/P` once `P` is known parabolic in the SGA3 sense, and keep here only the properness of `G/H` for `H ⊇ B` via complete `G/B` (gap of R02) and the equivalence of the two parabolic notions. Keep the generic representability gap on ReductiveGroups Layer 3 for arbitrary closed `H`, which F3.2 needs before parabolicity is known. Say in `## Scope and ownership` that ShimuraData §3.8 owns `Par_t(G)` and that this roadmap owns the Borel-containment comparison.

## Verified sound

**What was read.** The whole README (222 lines) and `Suggested.lean` (75 lines) at 670f0679; the worker's gate, change set, citations and signature files; the previous review. Pins: Tau Ceti `358314d4`, Mathlib `f6090c70` (`lake-manifest.json`; the shared packages directory is at these revisions). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FlagVarieties'` is empty. No LaTeX, process ids, pull-request numbers, `set_option`, sorry'd data, `lemma`, algorithms or copied passages (compared against the two readable sources) in the folder.

**Gate and dependency check.** Worker's gate: `target-ids=12 stray-files=1 build=1 FAIL`, everything else 0 (R05). The dependency check run as instructed with `--movable` against the candidate order and the main content snapshot printed exactly

```text
depcheck: 204 roadmaps, 1655 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The suppliers named in `*Needs:*` lines and the contracts table resolve as: ReductiveGroups (main; Layers 3, 3A, 7, 7C, 7C.5, 7b exist at `ReductiveGroups/README.md:234, 249, 627, 634, 682, 732`), SchubertGeometry (main; S1 at line 30, S2.3 at line 42, `B−` convention at line 9), SchemeAndStackFoundations (main; Layers 0–1, descent §§1.1–1.2 at lines 2071–2091), ShimuraData §3.8 (open #1038, order position 103, "Compact dual" with `Par_t(G)`), GroupSchemesOverABase GS7 (open #1522, not in the order; cited only as an owner and consumer, never as a supplier). FlagVarieties sits last in the candidate order (position 374).

**Elaboration and signatures.** `lake env lean TauCetiRoadmap/FlagVarieties/Suggested.lean` from the worktree: exit 0, one warning (`sorry` at line 58), the two `#check` outputs. The worker's `#check @name` audit covers all 3 declarations; I compared each elaborated type with the README: `conjugate_eq_of_borel_le` carries `[IsAlgClosed k]`, `hG_smooth`, `hG_connected`, `hB`, `hP_smooth`, `hQ_smooth`, `hPB`, `hQB` explicitly (nothing lost), `points_antitone` and `reduced_ideals_eq_of_points_eq` match their library originals. One-tactic probe: the two restatements close by their own single `exact` (R04); `conjugate_eq_of_borel_le` has no pinned closer (no unconditional Borel conjugacy, no normalizer theorem at the pin). The scratch probe of R03 elaborated (exit 0, two `sorry` warnings, three `decide` checks passed). No Lean process is left running.

**Pinned declarations opened** (file and line at Tau Ceti `358314d4`):

| Declaration | File:line | What it gives, and does not |
| --- | --- | --- |
| `TitsSystem` | `GroupTheory/TitsSystem/Basic.lean:50` | BN-pair with `simple : Set (N/(B∩N))`; no `B W_J B` subgroup, no classification of subgroups containing `B` |
| `TitsSystem.bruhatCell`, `bruhatCells_eq_iUnion_bruhatCell`, `bruhatCell_mul_eq_union_of_wordLength_lt` | `TitsSystem/Bruhat/Basic.lean:100, 170`; `Length.lean:129` | cells and the rank-one multiplication law; the inputs F1.1 needs for `B W_J B` to be a subgroup |
| `glTitsSystem` | `LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/TitsSystem.lean:195` | `B` upper triangular, `N` the torus normalizer, simple set `Fin n`-indexed adjacent transpositions; needs `[Nontrivial kˣ]` (so not over `𝔽₂`) |
| `GeneralLinear.weightParabolicDefiningHopfIdeal`, `weightParabolicRelationSet` | `Algebra/AlgebraicGroup/GeneralLinear/Weight/Parabolic/Basic.lean:143, 54` | ideal generated by `X_ij` with `w i < w j`; depends only on the order pattern of `w` |
| `GeneralLinear.UpperTriangular.weights`, `definingHopfIdeal` | `GeneralLinear/UpperTriangular/Basic.lean:66, 112` | `w i = n−1−i`; the Borel ideal is the weight ideal of `weights` |
| `UpperTriangular.isBorelOverAlgClosed_definingHopfIdeal`, `exists_conjugate_eq_of_isBorelOverAlgClosed` | `GeneralLinear/UpperTriangular/Borel.lean` (module docstring, lines 1–60) | unconditional Borel conjugacy in `GL_n` only |
| `HopfIdeal.IsBorelOverAlgClosed` | `Algebra/AlgebraicGroup/Borel/Basic.lean:148` | `IsAlgClosed k ∧ Minimal (IsBorelCandidate k H)`; no connectedness of `H` assumed |
| `HopfIdeal.exists_conjugate_eq_of_isBorelOverAlgClosed` | `Borel/Conjugation.lean:161` | conjugacy conditional on `hcontain`; not the unconditional theorem |
| `HopfIdeal.le_of_quotientPointsSubgroup_le`, `eq_of_quotientPointsSubgroup_eq` | `HopfIdeal/Points/Separation.lean:58, 84` | finite type and reducedness of the quotients are explicit instance hypotheses |
| `CommHopfAlgCat.quotientPointsSubgroup_antitone` | `HopfIdeal/Points/Order.lean:55` | ideal order reverses point order |
| `HopfIdeal.conjugate`, `conjugate_one`, `conjugate_mul`, `conjugate_inv_conjugate` | `HopfIdeal/Conjugation.lean:66, 96, 102, 110` | `I.conjugate g` cuts out `gKg⁻¹`; `conjugate (g*h) = (conjugate h).conjugate g` |
| `CommHopfAlgCat.pointConjugation_mem_conjugate_iff` | `HopfIdeal/Conjugation.lean:292` | `g x g⁻¹ ∈ points(I.conjugate g) ↔ x ∈ points(I)` |
| `CommHopfAlgCat.fppfHomogeneousQuotient`, `fppfHomogeneousQuotientHomEquiv` | `Fppf/Quotient/Homogeneous/Basic.lean:216, 280` | sheafified left-coset presheaf and its universal property; no representability |
| `Comodule.range_toProjectiveOrbit_kernelPoint_eq_closedPoints` | `Representation/ProjectiveOrbit/Homogeneous.lean:42` | closed points of the projective orbit scheme are rational translates; group need not be smooth |
| `smoothCommHopfAlgProperty`, `geometricallyConnectedCommHopfAlgProperty` | `Smooth/CommHopfAlgCat.lean:40`; `Connected/CommHopfAlgCat.lean:61` | `Algebra.Smooth`; connected `Spec(H ⊗ K)` for every field extension |
| `smoothCommHopfAlgProperty_of_charZero` (Cartier) | `Smooth/CharZero.lean:145` | exists at the pin (R07) |
| `FiniteTypeCommHopfAlgCat.quotient`, `CommHopfAlgCat.quotient` | `HopfIdeal/Quotient/Basic.lean:614, 103` | the quotient carriers used in the Lean statements |

Absent at the pin, confirmed by grep over `TauCeti/`: `IsParabolicOverAlgClosed`, `standardParabolic`, `standardParabolicOrderIso`, `normalizer_standardParabolic`, `standardParabolic_weightParabolicSimple`, `standardParabolic_eq_of_subgroupB_le`, `isParabolicOverAlgClosed_weightParabolicDefiningHopfIdeal`, `Borel/Conjugacy/Existence.lean`. The only `IsParabolic` is `Matrix.IsParabolic` for elements of `PSL(2,R)`.

**Ownership by object.** `roadmaps grep` over the 441 open heads and main for "projective homogeneous", "standard parabolic … conjugate", "G/P_J" and "flag variet… classif" finds the classification only here; ShimuraData §3.8 owns `Par_t(G)` and `G/P ≅ Par_t(G)` (R08); SchubertGeometry on main defers `G/P` to it; GroupSchemesOverABase GS7 (#1522) owns relative `Bor(G) ≅ G/B`; main ReductiveGroups 7C.5 owns the type-A block-parabolic flag and Grassmannian maps and the `G/B+` cell coordinates; main ReductiveGroupsPartII line 22–26 confirms Part I owns "parabolic and Levi subgroups, Bruhat decomposition and BN-pairs". The five board packages under review (AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) are unrelated. FlagVarieties is therefore the owner of the Borel-containment classification, the type and conjugacy classification, the homogeneous-space classification and the equivariant-morphism classification; nothing was moved.

**Source audit: 15 targets.** The brief gives no seed or target ids, so the sample is the fifteen source-bearing statements of the README: the Conventions block and F0.1, F0.2, F0.3, F1A, F1.1, F1.2, F2.1, F2.2, F3.1, F3.2, F3.3, F4.1, F4.2, F5. Texts: Milne, *Algebraic Groups* (2017), author-page PDF, cache id 503f1a7d, printed page = marker page − 12; Conrad–Feng, *Reductive Groups over Fields* (version of 5 December 2020), author page, cache id a0caf508. Humphreys is paywalled: see Not verifiable.

| # | Target (README line) | Locator read | Conclusion |
| --- | --- | --- | --- |
| S01 | Conventions, coset direction and `OrderDual` (41, 43) | `HopfIdeal/Points/Order.lean:55`; Milne §5 quotient convention lines 4545–4557 | ideal order reverses inclusion; left cosets `gH` with right `H`-multiplication; consistent |
| S02 | F0.1 point detection (54) | `Separation.lean:58, 84` | reduced + finite type exactly as stated; Cartier at `CharZero.lean:145` |
| S03 | F0.2 conjugation laws (62) | `Conjugation.lean:66–118, 292` | all cited laws exist; orientation `gKg⁻¹` |
| S04 | F0.2 quotient points and maps (62) | Milne Prop. 5.22, p. 104, line 4545; Prop. 7.15, p. 142, line 6061 | universal map and fibre comparison; the "§7.7" label is wrong (R07) |
| S05 | F0.3 orbit = quotient (68) | Milne Prop. 7.11, p. 141, line 6036; §7.e lines 6031–6100 | needs the scheme stabilizer and smoothness as the README says |
| S06 | F1A GL classification (74) | Milne Thm. 21.91, p. 453, line 18691; pin `Weight/Parabolic/Basic.lean:143` | statable and true; inputs unowned (R01, R03) |
| S07 | F1.1 `P_J(k) = B W_J B`, closedness (86–98) | Milne Thm. 21.91 proof, pp. 454, lines 18704–18717 | the concentrator/Bruhat-union construction; README's constructible-subgroup route is an alternative and sound (row 18) |
| S08 | F1.2 order classification (104–108) | Milne 21.91 line 18700; Conrad–Feng T.1 lines 13453–13456 | inclusion-preserving bijection; intersection equality holds in all characteristics (R07) |
| S09 | F2.1 unique standard representative (116–120) | Conrad–Feng T.1 line 13453; Milne Cor. 17.49 proof, p. 367, lines 15080–15084 | Borels of `P_K` conjugate inside `P_K°`, then `N_G(B) = B`; same route as the README |
| S10 | F2.2 pointwise normalizer (126) | Milne Thm. 17.48, p. 367, line 15049; Cor. 17.49, line 15075 | `N_G(P)(k) = P(k)` for `P ⊇ B`; scheme smoothness of the normalizer is separate, as the README avoids |
| S11 | F3.1 line stabilizer and immersion (134) | Milne Thm. 4.27, p. 94, line 4189; Thm. 7.18, p. 143, line 6102 | every closed subgroup is a line stabilizer; `G/H` separated |
| S12 | F3.1 complete `G/B`, descent (136–138) | Milne Thm. 17.9(a), p. 354, lines 14525–14540; Thm. 17.16 proof, line 14610 | properness descends along surjective `G/B → G/H`; valid |
| S13 | F3.2 fixed point, equivalence (144–146) | Milne Cor. 17.3, p. 353, line 14478; Def. 17.15, Thm. 17.16, p. 356, lines 14605–14615 | Milne defines parabolic by completeness; the README's definition by Borel containment plus this theorem is the comparison |
| S14 | F3.3, F4.1, F4.2 assembly (152, 162, 168) | Milne Prop. 5.22 line 4545 (equivariant maps), 17.48/17.49, 21.91 | assembly of S09–S13; the unique `B`-fixed coset argument is correct (row 44) |
| S15 | F5 examples (178–181) | enumeration below; pin `UpperTriangular/Basic.lean:66` | all values agree |

**Adversarial values.** Finite computations are an independent enumeration of `GL₃(𝔽₂)` (168 elements, 7 lines, 7 planes, 21 flags) in a scratch script; `A = P_{s₁}` stabilizes the plane `⟨e₁,e₂⟩`, `C = P_{s₂}` the line `⟨e₁⟩`, types in the order `∅, {s₁}, {s₂}, S`.

| Statement | Instances tried | Values on each side | Result / change |
| --- | --- | --- | --- |
| 01. Standing scope (5, 15) | trivial group; `Gₘ`; `SL₂` | `S` has 0, 0, 1 elements; standard labels 1, 1, 2; projective homogeneous spaces: point; point; `ℙ¹` and point | consistent; no faithfulness needed |
| 02. Hopf-ideal order (41) | `GL₂`, `B ⊂ G` | `I(G) = 0 ⊂ (X₁₀) = I(B)`; `dim B = 3 < 4` | `OrderDual` direction right; `P ≤ B` in Lean means `P ⊇ B` |
| 03. Left cosets (43) | `S₃`, `H = ⟨(12)⟩`, `g = (123)` | `gH = {(123),(13)}`, `Hg = {(123),(23)}`; `leftRel`: `x⁻¹y ∈ H` | `gH` matches `homogeneousQuotientPresheaf` (`Homogeneous/Basic.lean:44`, `QuotientGroup.leftRel`) |
| 04. `J` lists Levi roots (44) | `GL₃`, `J = {s₁}` vs `{s₂}` | retained dimensions `{2}` vs `{1}`; orders 24, 24; `J ⊆ K ⇒ P_J ⊆ P_K`: `∅ ⊂ {s₁}` gives `8 ∣ 24` | correct |
| 05. `standardWeight` (R03) | `n = 2`, `J = ∅, {0}, {1}, S` | `(0,−1,−2)`, `(0,0,−1)`, `(0,−1,−1)`, `(0,0,0)`; forbidden pairs 3, 2, 2, 0 | by `decide`; the same relation sets as the block parabolics |
| 06. Weight ideal vs Borel ideal | `UpperTriangular.weights 3 = (2,1,0)` vs `standardWeight ∅ = (0,−1,−2)` | both forbid exactly `X_ij`, `i > j` | ideals equal; `weightParabolicRelationSet` uses only `w i < w j` |
| 07. `glTitsSystem` hypothesis | `k = 𝔽₂` | `kˣ` trivial, instance `Nontrivial kˣ` fails (probe error) | the GL Tits system exists only for `|k| > 2`; algebraically closed `k` is fine; README's `𝔽₂` Check is about `P_J(𝔽₂)`, not the Tits system |
| 08. F0.1 nonreduced control (56, 214) | `μ_p` vs `1`; `F⁻¹(B) ⊂ SL₂` vs `B`, char `p` | same geometric points; coordinate lengths `p` vs 1; `c^p = 0` vs `c = 0` | point equality cannot see nilpotents; hypotheses in `Separation.lean:84` required |
| 09. F0.2 orientation (62, 212) | `GL₂`, `g = [[1,0],[1,1]]`, `B` upper | `gBg⁻¹` fixes `⟨e₁+e₂⟩`; `g⁻¹Bg` fixes `⟨e₁−e₂⟩`; enumeration: `g·⟨e₁⟩ = ⟨(1,1,0)⟩` | distinct iff char ≠ 2 (R06 Check wording) |
| 10. Conjugation laws | `g, h` as above | `conjugate (g*h) = (conjugate h).conjugate g` (`Conjugation.lean:102`) matches `(gh)K(gh)⁻¹ = g(hKh⁻¹)g⁻¹` | pinned, no restatement needed |
| 11. F0.3 stabilizer/orbit (68) | `GL₂` on `ℙ¹` at `[e₁]`; Frobenius-twisted `SL₂` on `ℙ¹` | stabilizer `c = 0`, dim 3, quotient dim 1; twisted stabilizer `c^p = 0` with Lie dim 3 vs 2 | smooth-stabilizer hypothesis necessary (headline 4) |
| 12. F1A/F1.1 orders (74, 210) | `GL₃(𝔽₂)`, four `J` | `|P_J| = 8, 24, 24, 168`; Weyl parabolics `1, 2, 2, 6` | matches README line 210 |
| 13. F1.1 Bruhat union | `J = {s₁}` | `W_J = {e, s₁}`, cells of sizes 8 and 16, sum 24 = `|A|` | union is the ambient parabolic |
| 14. F1.1 rank-one two cells | `SL₂(𝔽₂)`, `SL₂(𝔽₃)` | `|B| + |BnB| = 2 + 4 = 6`, `6 + 18 = 24` | both equal the group order |
| 15. F1.1 endpoints, torus | `P_∅`, `P_S`; `G = T` | `8 = |B|`, `168 = |G|`; torus: `S = ∅`, `P_∅ = T = B = G` | README line 15, 178 agree |
| 16. F1.2 order isomorphism (headline 1) | four subsets of `S` | poset `∅ < {s₁}, {s₂} < S`, singletons incomparable; orders `8 < 24, 24 < 168`, `A ⊄ C`, `C ⊄ A` | same poset both sides |
| 17. F1.2 inverse label | `Q = A` | `P_{s₁} ⊆ A` true, `P_{s₂} ⊆ A` false; label `{s₁}` | not the complement |
| 18. F1.2 intersection and join (108) | `A, C` | `|A ∩ C| = 8 = |P_∅|`; `|A ∪ C| = 40`, `|⟨A,C⟩| = 168 = |P_S|` | join is generated, not union; equality holds in char 2 (R07) |
| 19. F1.1 constructible-subgroup closedness (96) | `H = B W_J B` in `G` | `H ⊇ U` open dense in `H̄`; `H = ⋃_{h∈H} hU` open in `H̄`; `H̄ \ H` a union of open cosets | closed; argument sound |
| 20. F2.1 uniqueness (headline 2) | `GL₃`: `A, C` | quotient dimensions 2, 2; types `{s₁} ≠ {s₂}`; not conjugate (fixed-point matrix row 27) | dimension is not the type |
| 21. F2.1 bridge inside `P_K` (118) | `K = {s₁}`, `u = I + E₂₁ ∈ A` | `uBu⁻¹` fixes `⟨e₁+e₂⟩ ≠ ⟨e₁⟩`; `u⁻¹` restores `B` inside `A` | `B` is not normal in `A`; conjugacy inside `P_K` needed, as written |
| 22. `conjugate_eq_of_borel_le` (Lean 58–70) | `P = Q = B`, `g` as in 09; `P = B, Q = G`; `P = Q = G`; `S₃` constant with `B = 1`, `P = ⟨(12)⟩`, `Q = ⟨(13)⟩ = gPg⁻¹` | first two: `hconj` false (vacuous); third: `P = Q` true; `S₃`: all hypotheses but `hG_connected` hold and `P ≠ Q` | connectedness necessary and present; reductivity and the three smoothness hypotheses unused (R06) |
| 23. F2.2 self-normalizers (126) | `GL₃(𝔽₂)`, four `P_J` | normalizer orders 8, 24, 24, 168 = `|P_J|` | enumerated |
| 24. F3.1 line model (134) | `GL₂`, `H = B`; `H = G` | standard representation: line `⟨e₁⟩`, stabilizer `B`, orbit `ℙ¹`; trivial representation: stabilizer `G`, orbit a point | prescribed stabilizer matters |
| 25. F3.1 closed orbit (136) | `SL₂/B ⊂ ℙ¹`; `GL₂/T ⊂ ℙ¹×ℙ¹` | first image all of `ℙ¹`; second misses the diagonal, not closed | properness via `G/B` needed; not every orbit is closed |
| 26. F3.2 fixed point (144) | `B` on `ℙ¹`; `Gₘ` on itself | fixed loci `{[e₁]}` and `∅`; targets complete yes/no | hypothesis prevents the false case |
| 27. Headline 3 | `SL₂`: `H = B, G, T` | (parabolic, proper, projective) = (t,t,t), (t,t,t), (f,f,f); `G/T` = distinct ordered pairs of lines | both directions |
| 28. Headline 4 | `SL₂` on `ℙ¹` and on a point; base points `[1:0]`, `[0:1]` | `H = B, J = ∅`; `H = G, J = S`; stabilizers `B`, `nBn⁻¹` both of type `∅` | independence of `x` is conjugacy |
| 29. F4.1 fixed cosets (162) | `SL₂`, `P = Q = B`, `g = e, n`; `Gₘ`, `P = Q = 1` | `g⁻¹Bg ⊆ B`: true, false; `Gₘ`-equivariant endomorphisms `x ↦ xa`, any `a` | inverse direction right; no false uniqueness for `Q = 1` |
| 30. F4.2 unique `B`-fixed point (168) | `GL₃(𝔽₂)`, four quotients of sizes 21, 7, 7, 1 | `B`-fixed counts 1, 1, 1, 1 (enumerated) | `T`-fixed would be 6, 3, 3, 1 |
| 31. Headline 5 | `P_J`-fixed points on `G/P_K`, rows `J`, columns `K` | `[1,1,1,1]; [0,1,0,1]; [0,0,1,1]; [0,0,0,1]` = Boolean `J ⊆ K` (enumerated) | all 16 directions, both forbidden line↔plane maps |
| 32. F4.2 automorphisms (170) | `J = K` | diagonal count 1 each | equivariant automorphism group trivial; no claim on `Aut` of the variety |
| 33. F5 `GL_n` small `n` (180) | `n = 1`; `n = 0` | `S = ∅`, one space (point); `GL₀` has empty index set | endpoints consistent; `Fin 0` gives no junk |
| 34. Headline 3, non-smooth `H` in char `p` (11) | `H = F⁻¹(B) ⊂ SL₂` | `G/H → G/B` finite surjective, so `G/H` projective while `H` is not smooth | the smooth hypothesis in headline 3 is necessary for the stated definition; consistent with the Check at line 208 |
| 35. ShimuraData `Par_t` vs F3.1 (R08) | `P = B` in `SL₂` | `Par_t(SL₂) = ℙ¹ = SL₂/B`; self-normalizing | same object, earlier owner |

The nonabelian `S₃` row (22) and the cyclic `Gₘ` rows (26, 29) were both tried; `p = 2` enters rows 07, 09, 12–18, 30–31 and `p = 3` row 14; the only inverses taken are of invertible matrices and nonzero scalars.

**Headline inventory.**

| Headline | README | In `Suggested.lean` | Statable at the pins |
| --- | --- | --- | --- |
| 1. `J ↦ P_J` order isomorphism | 9, F1.2 | no | general `G`: no (no Tits system on `G(k)`, no `P_J`); `GL_{n+1}`: yes, absent (R03) |
| 2. unique standard conjugate | 10, F2.1 | uniqueness half, `conjugate_eq_of_borel_le` | existence half needs the parabolic predicate and `P_J`; docstring says so |
| 3. parabolic ⇔ projective | 11, F3.2 | no | needs a represented quotient scheme; docstring says so |
| 4. classification of projective homogeneous varieties | 12, F3.3 | no | needs the quotient and stabilizer comparison; docstring says so |
| 5. equivariant morphisms ⇔ `J ⊆ K` | 13, F4.2 | no | needs `G/P_J` schemes; docstring says so |

## Not verifiable

- **Humphreys, *Linear Algebraic Groups*:** paywalled Springer DOI only; not in the sources cache (no `Linear Algebraic Groups` text among the 13,417 cached files is the book). Sections §§11–12, 17.6, 19, 21–23, 24–28, 29.1–29.3, 30.1 are cited by locator alone (uncertified); their numbering was not checked. The Milne and Conrad–Feng comparisons above do not certify them.
- **Seeded sample:** the brief names no seed or target ids; the fifteen targets audited are the fifteen source-bearing statements listed, not a reproduction of an unspecified random draw.
- **ShimuraData §3.8 and GroupSchemesOverABase GS7** were read at their open heads through the roadmap service; their own acceptance is not this review's.
- **Build warning:** the gate's `build=1` is Lake's module-system warning, reproduced from the gate file; `lake env lean` cannot show it.

## Source issues

- **Misprint** in Milne (503f1a7d) at Proposition 7.15, printed p. 142: the smooth/finite clause names the map `G/H' → G/H` for `H ⊆ H'`; it should be `G/H → G/H'`; affects a stated result.
- **Misprint** in Milne (503f1a7d) at Corollary 17.49 proof, printed p. 367: Borel conjugacy is credited to 17.10 (maximal tori); it should be Theorem 17.9(b); affects the proof.
- **Error** in Milne (503f1a7d) at Corollary 21.92 proof, printed p. 455: `B` is said to be generated by its positive root groups; it should be generated by `T` and the positive root groups; affects the proof.
