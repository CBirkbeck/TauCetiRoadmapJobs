# Review of QuadraticFormInvariants (pull request #1797 at 6dc200b)

**Verdict:** needs changes

Incremental re-review of 10 changed lines since `6cec06f`. The change is the pull request's adaptation of this folder to the bumped pin (`lake-manifest.json` now pins Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`, toolchain `v4.36.0-rc2`): one README sentence renames four Tau Ceti declarations, two imports become `…Hasse.Basic` and `…Defect.Basic`, the binder `[Fact (Nat.Prime 2)]` is dropped from `dyadicLevel_eq_absoluteRamificationIndex`, and one tactic alternative is removed from `pinE1_mul_pinT_pow_four`. All four edits are correct at the new pin (details under *Verified sound*). None of the eight findings of the previous review was addressed by an edit; the pin bump itself repairs part of R06 and R07, and it also makes both headline theorems of the file native, which sharpens R01 and R02. Every carried finding is restated below with its witness re-checked at this head and at the pins (file paths under `TauCeti/` are in the pinned Tau Ceti tree).

## R01 (P1) — Layers 7–9 are stated on another roadmap's sorry'd data, and both headlines are now native

Location: `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` lines 2–4 (the imports of `TauCetiRoadmap.ProfiniteCohomology.Suggested`, `Completed.LocalFieldsRamification.Suggested`, `TauCetiRoadmap.ClassFieldTheory.Suggested`), `cup11` (1510), `kummerClass` (1560), `h2MuToUnits` (1585), `sw2Class` (2690), `galoisEvens2` (2970), and the two headlines `galoisEvens2_kummerClass` (3723) and `relativeStiefelWhitney_quadraticExtension` (3792).

Claim: the docstrings (1501–1509, 1557–1559) and README 898–928 say the cohomological objects are "the supplier's" and "abbreviations of Tau Ceti's declarations of the same names"; the module docstring (39–50) presents the two Layer 9 theorems as the headlines the finished roadmap will prove.

Witness: `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` at this head still has `cup := sorry` (3868–3871), `inhomogeneousCochain2` (5145–5147), `f2Pairing` (5332–5334), `homClass` (5537–5540) and `galoisF2Iso` (5846–5852) with body `sorry`; the gate records `imports=1`. At the pin `2fd255d9` both headlines are Tau Ceti theorems: the Evens-norm value `TauCeti.galoisEvens2_kummerClass` at `TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/Evens/Kummer/Value.lean:220` (same statement, including `Tr a = t` and `(2) ∪ (d)`; trace-zero case at 182), and the degree-2 relative formula `TauCeti.sw2Class_formClass_traceTransfer_smul_sq` at `TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/QuadraticExtension.lean:249` (diagonal form at 268). The native carriers are `TauCeti.kummerClass` (`MuTwo/Basic.lean:355`), `TauCeti.h2MuToUnits` (`MuTwo/BrauerTorsion.lean:62`), `TauCeti.sw1Class`/`sw2Class` (`StiefelWhitney/Class.lean:100,198`), `TauCeti.galoisEvens` (`GaloisCohomology/EvensNorm.lean:84`).

Repair: imports become `import Mathlib` plus the `TauCeti.*` modules used; the three roadmap imports go. Neither headline is absent at the pin any more, so each is stated as an `example` discharged by the native theorem (as the four-fold criterion is at 410–416), or named in the module docstring as Tau Ceti's with its declaration; nothing is restated on `cup11`/`galoisEvens2`. Rewrite README 898–928 to say which supplier names are Tau Ceti's at the pin and which are prototypes.

## R02 (P2) — The file is an API catalogue of declarations proved at the pin

Location: `Suggested.lean`, 136 sorried declarations (the elaboration at this head prints 136 `declaration uses sorry` warnings); representative lines unchanged: Layer 5 `quaternionClass_symm/_sq/_mul/_congr/_one_sub` (561–596), `hasseInvariant_*` (613–636), `cliffordInvariant_eq` (777); Layer 6 `squareClass_finite` (971), the defect calculus (1069–1131), `hilbertSymbol_*` (1190–1302), the 6D block (1315–1358), `serreEps`/`serreOmega` (1377–1440); Layer 7 `kummerSquareClassEquiv` (1569), `Br2` (1659), the crossed-product and `Inflation` block (1706–2345), `hilbertSymbol_productFormula` (2578); Layers 8–9 the Pin model (3116–3295), `rootSign … galoisF2Iso_inv_kummerClass` (3395–3486).

Claim: the module docstring calls the file "target signatures"; the contract is headline theorems only, with what exists at the pin deleted and cited.

Witness (object → native declaration at `2fd255d9`, file under `TauCeti/`): `Algebra/Quaternion/BrauerClass.lean:173,212,255` (`quaternionClass_comm`, `_sq`, `_mul`); `NumberTheory/HilbertSymbol/Basic.lean:47,147,251` (`hilbertSymbol`, `_congr_sq`, `_comm`); `NumberTheory/LocalField/QuadraticForm/Bimultiplicativity.lean:97` (`hilbertSymbol_mul_right`); `MuTwo/CupNorm.lean:103`, `MuTwo/LocalSymbol.lean:191`; new at this pin: `LinearAlgebra/QuadraticForm/Witt/Clifford.lean` (`TauCeti.cliffordHomI2`, `cliffordHomI2Bar`, `cliffordHomI2_pfisterClass`), `NumberTheory/QuadraticForm/Global/ProductFormula.lean:67` (`TauCeti.hilbertSymbol_productFormula`, over any number field), `NumberTheory/LocalField/QuadraticForm/Invariants.lean:101–155` (`localInvariants`, injectivity and range). One-tactic probe on a scratch copy at this head and this pin: `quaternionClass_symm`, `quaternionClass_sq`, `quaternionClass_mul`, `hilbertSymbol_congr_sq`, `hilbertSymbol_neg_self`, `hilbertSymbol_comm`, `hilbertSymbol_mul` each close with one `exact` of the native declaration; the copy elaborates with 129 sorry warnings, no error. Seven of seven close (the linter also reports that `hilbertSymbol_comm` does not use its local-field section variables).

Repair: delete every declaration whose object exists at the pin and the proved comparisons with it (`pinE1_eq_native` … `pinLift_eq_native`, 3337–3387). Keep, as reducible aliases proved from the native declarations and with no `sorry`, only what `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` and `TauCetiRoadmap/IntegralLattices/Suggested.lean` on main consume from this namespace (`RegularFormClass`, `formClass`, `wittRing`, `toWittRing`, `discr`, `signedDiscr`, `hilbertSymbol`, `hilbertSymbol_neg_self`, `hilbertSymbol_mul`, `hilbertSymbol_comm`, `exists_hilbertSymbol_eq_neg_one`, `localHasse`, `exists_of_realization`, `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula`; GlobalQuadraticForms unfolds `localHasse` and `hilbertSymbol`, so these keep their bodies or GlobalQuadraticForms is edited in the same change).

## R03 (P2) — The second headline theorem is statable at the pin and absent

Location: README 19–23 name three high points; `Suggested.lean` states the first (410–416) and the third (3792); Layer 6D (README 2360–2365) has no statement: 1315–1351 state realization, `u(K) = 4` and quaternary uniqueness, not the classification.

Claim: "Two regular forms over `K` are isometric if and only if `(dim, d, s)` agree".

Witness: `TauCeti.RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq` at `TauCeti/NumberTheory/LocalField/QuadraticForm/Classification.lean:132`, re-opened at `2fd255d9`; `grep eq_iff_rank_eq_and_discr_eq_and_localHasse_eq Suggested.lean` is empty at this head.

Repair: state it in `Suggested.lean` as an `example` discharged by the native theorem, or name it in the module docstring as Tau Ceti's with that declaration.

## R04 (P2) — Sorry'd data and `set_option`

Location: `Suggested.lean` 822 `cliffordHomI2`, 864 `cliffordHomI2Bar`, 971 `instance squareClass_finite`, 1569 `kummerSquareClassEquiv`, 1619 `resHUnits`, 1835 `cocycleOfSplitting`, 1862–1866 `TwoCocycle.comap` (`isCocycle := sorry`), 2353 `brauerCohomologyEquiv`, 2358 `brauer2EquivH2`; 51 `set_option maxHeartbeats`/`synthInstance.maxHeartbeats … in` lines between 1981 and 2387. Gate at this head: `sorry-data=9 set_option=51`.

Claim: the docstrings (2347–2352, 2403–2407) call these "named definitions" that carry the normalisation.

Witness: a `def` with body `sorry` asserts nothing, so `brauerCohomologyEquiv_unique` (2393) is about an unknown map. At `2fd255d9` native bodies exist for `cliffordHomI2`/`cliffordHomI2Bar` (`TauCeti/LinearAlgebra/QuadraticForm/Witt/Clifford.lean`), `kummerSquareClassEquiv` (`MuTwo/Basic.lean:668`), `cocycleOfSplitting` (`Algebra/CrossedProduct/Splitting/Basic.lean:321`), `brauerCohomologyEquiv` (`CrossedProduct/Comparison.lean:274`), `brauer2EquivH2` (`CrossedProduct/TwoTorsion.lean:152`); `squareClass_finite` follows from `TauCeti.card_squareClass` (`NumberTheory/LocalField/SquareClass.lean:83`).

Repair: delete the nine with R02 (the two Clifford maps included, now native); the `set_option` lines go with the `Inflation` section; any kept statement is restated to elaborate under the defaults.

## R05 (P3) — The pull request moves a process document into the README

Location: README 33–331 ("Audit status: incomplete. This roadmap remains active." at 35; the Tau Ceti commit `cd83a3c6…` at 105 and 157 with "Lean `4.36.0-rc1`" at 140 and 157; "The repository dependency pin remains `a91d3aa…`" at 146; the placeholder `/absolute/path/to/that/file.lean` at 169; the 150-line Lean fence ending in two `#print axioms` lines at 330–331) and 3618–3626; `Suggested.lean` 403 and 1209 name "`gq2`'s B11a", a label defined nowhere.

Witness: the README rules (timeless; no process narrative, pull-request references or local paths; `#print axioms` never). The pin facts recorded are now doubly stale: the manifest pins Tau Ceti `2fd255d9…` and the toolchain is `v4.36.0-rc2`.

Repair: delete 33–331 and 3618–3626 and the two "B11a" phrases; the native-interface facts that survive at the pin go into the supplier contracts with pin-true paths (R06).

## R06 (P3) — Claims about the pin that are false at `2fd255d9`, and ownership overclaims

The pin bump repaired most of the previous list: the six `ULift`/`Congr` files, `NumberTheory/LocalField/QuadraticForm/Invariants.lean` with `localInvariantsEquiv`, `StiefelWhitney/QuadraticExtension.lean`, `RegularFormClass/Hasse/Basic.lean`, and the declarations `brauerCohomologyEquiv_baseChange` (`Algebra/CrossedProduct/BaseChange/Naturality.lean:51`), `continuousCohomologyIso`, `RingEquiv.unitsCoeffCongr`, `BrauerGroup.uliftEquiv` all exist at this pin, and the universe claims hold (`MuTwo/CupNorm.lean:69` and `StiefelWhitney/Class.lean:90,182` read `variable {K : Type u}`). What remains false or overclaimed, each re-checked in the pinned tree:

- Files cited that do not exist: `NumberTheory/LocalField/WorkedExamples/DyadicSqrt/NormControl.lean` (README 134–137), `LinearAlgebra/QuadraticForm/RegularFormClass/Matrix.lean` (117). Declarations cited that exist nowhere: `TauCeti.oneFoldPfister_smul_equivalent_of_mem_unitValueSet` and `twoFold…` (1603–1604; the pin's names are `oneFoldPfister_smul_equivalent_iff`, `twoFoldPfister_smul_equivalent_iff`, `Witt/Round.lean`). The worker's citation leads list the last two.
- The pin sentence at 146 (`a91d3aa…`) contradicts the manifest (`2fd255d9…`).
- Ownership: "The Hilbert symbol is this roadmap's, in both halves" (2174) and "the comparison is the frozen declaration `hilbertSymbol_eq_cohomological`" (2180): `TauCeti.hilbertSymbol` (`NumberTheory/HilbertSymbol/Basic.lean:47`) and `TauCeti.hilbertSymbol_eq_cohomological` (`MuTwo/LocalSymbol.lean:191`) are native. "This sublayer is the canonical owner of the Kummer-cup/norm-equation criterion" (2824): `TauCeti.cup_kummerClass_eq_zero_iff` (`MuTwo/CupNorm.lean:103`). "The Galois refinement `exists_finiteGalois_splittingField` is this roadmap's own" (2615–2626): `Algebra/CentralSimple/FiniteGalois.lean:51`. "`hilbertSymbol_productFormula`, exported to Global Quadratic Forms" (860–897, row 5): `TauCeti.hilbertSymbol_productFormula` at `NumberTheory/QuadraticForm/Global/ProductFormula.lean:67`.

Repair: every such sentence says "Tau Ceti's, consumed" with the pin-true file, or is deleted; the two Pfister names become the pin's `_iff` names; the pin sentence goes with R05.

## R07 (P3) — Gate text rules

Location: the gate at this head prints `set_option=51 … tex=14 … sorry-data=9 sorry-examples=10 … imports=1 … readme-ids-missing=11 … FAIL`, the same text-rule line as at `6cec06f`: `tex` at README 774, 1459, 1461, 1701, 2023, 2041, 2051, 2258, 2558, 3153–3154, 3294; `readme-ids-missing` for the eleven names listed in the gate; `sorry-examples` at `Suggested.lean` 1411, 1416, 1421, 1434, 1439, 2774, 2786, 2814, 2822, 3830; the module-system advisory on the header.

Witness: my gate run at this head reproduces the worker's line. All eleven flagged identifiers now exist at the pin under a namespace (`TauCeti.RegularFormClass.discr_baseChange` at `RegularFormClass/BaseChange.lean:437`, `signedDiscr_add` at `Witt/Discriminant.lean:100`, `signedDiscr_mul`/`_mk_rankOne_mul` at `RegularFormClass/Discriminant.lean:321,329`, `TauCeti.hilbertSymbol_mul_right` at `Bimultiplicativity.lean:97`, `map_ker_reₗ_of_algEquiv` at `Algebra/Quaternion/AlgEquiv.lean:150`, `LocalFieldsRamification.map_norm_unitFiltration_zero` at `Completed/LocalFieldsRamification/Suggested.lean:857`, `IntermediateField.finrank_adjoin_simple_eq_two_of_sq_mem_notMem` at `FieldTheory/IntermediateField/Quadratic.lean:113`, `discr_one_elem_eq_of_sq_algebraMap` at `FieldTheory/Trace.lean:78`, `sw1Class_traceTransfer_mk_rankOne` at `StiefelWhitney/Transfer.lean:137`, `brauerCohomologyEquiv_baseChange` at `CrossedProduct/BaseChange/Naturality.lean:51`).

Repair: put the 14 displays in code spans; prefix the eleven supplier names with their namespace; delete the ten admitted examples (their content is native, R02) or prove them; the header becomes `module` / `public import Mathlib` / `public import TauCeti.*` once the roadmap imports of R01 are gone.

## R08 (P3) — Garbled text and README shape

Location: README 2167–2171 ("the classical part of6C and can precede6D without6E/7B", "The full6B defect"), 2217 ("The direct6B computation") and 3486–3488 ("Layer 6 first consumes6A", "feed6D", "the direct6B tables"): sublayer labels fused to the preceding word, in a 200-word imperative sentence at 2169. The README has no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` or `## How to read the build` heading (grep count 0 at this head), no `*Needs:*` lines, no `### Examples`/`### Dependencies` per layer.

Witness: the house shape in the brief and the roadmaps on main written in it (`TauCetiRoadmap/ClassFieldTheory/README.md`). The changed sentence at 2167 keeps this shape (a one-paragraph imperative recipe naming Tau Ceti declarations without backticks).

Repair: restore the spaces and rewrite 2167–2171 as prose targets with `*Needs:*` lines (the four renamed declarations in backticks with their hypotheses: `algebraicExtensionValuativeRel K M` needs `[Algebra.IsAlgebraic K M]`, `finiteExtension_isNonarchimedeanLocalField` needs `[Module.Finite K M]`); move the README toward the house shape.

## R09 (P3) — The elaboration no longer has `sorry` as its only warning

Location: `Suggested.lean` 3332:77 and 3333:16, inside `pinDiagonalLift_mul` (3319–3335).

Claim: the module elaborates with `sorry` the only warning.

Witness: `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` at this head and pin: exit 0, 136 `declaration uses sorry`, plus two `Unused tactic linter: <;> can be removed` warnings at those positions (the worker's gate build lists the same two). The previous head elaborated with no other warning; the new toolchain's linter now fires on the `<;>` after `fin_cases j` and after `(simp … <;>`.

Repair: remove the two redundant `<;>` (or delete the Pin-model block with R02, since `TauCeti/FieldTheory/GaloisCohomology/MuTwo/TwistedBoundary.lean` and `LinearAlgebra/Matrix/PinPlusPlane/*` carry it natively, as the file's own `pinE1_eq_native` … `pinLift_eq_native` comparisons at 3337–3387 attest).

## Previous findings

- R01 — not repaired: `Suggested.lean` 2–4 still import the three roadmap modules; `cup11` (1510), `sw2Class` (2690), `galoisEvens2` (2970) and the headlines (3723, 3792) still sit on `ProfiniteCohomology`'s sorry'd `cup`, `f2Pairing`, `galoisF2Iso`; both headlines are now native at the pin.
- R02 — not repaired: 136 sorried declarations; the seven probed close with one `exact` of the native declaration at `2fd255d9`; `cliffordHomI2` and `hilbertSymbol_productFormula` are also native now.
- R03 — not repaired: the classification by `(dim, d, s)` has no statement in `Suggested.lean`; `Classification.lean:132` at the pin states it.
- R04 — not repaired: nine `def`/`instance` bodies are `sorry` (822, 864, 971, 1569, 1619, 1835, 1862, 2353, 2358); 51 `set_option … in` lines between 1981 and 2387.
- R05 — not repaired: README 35 "Audit status: incomplete. This roadmap remains active."; 105/157 the Tau Ceti commit; 140/157 "Lean `4.36.0-rc1`"; 146 the `a91d3aa…` pin; 169 the absolute-path placeholder; 330–331 `#print axioms`.
- R06 — partly repaired (by the pin bump, not by an edit): the `ULift`/`Congr` files, `Invariants.lean`, `QuadraticExtension.lean`, `brauerCohomologyEquiv_baseChange` and the universe claims are true at `2fd255d9`; `NormControl.lean`, `Matrix.lean`, the two `_of_mem_unitValueSet` names, the `a91d3aa…` pin sentence and the ownership sentences at 2174, 2180, 2615–2626, 2824 remain.
- R07 — partly repaired (by the pin bump): the eleventh `readme-ids-missing` name now exists at the pin; the gate's text-rule line is otherwise identical (`set_option=51 tex=14 sorry-data=9 sorry-examples=10 imports=1 readme-ids-missing=11 FAIL`).
- R08 — not repaired: README 2169–2171 "The full6B defect …", 3486 "Layer 6 first consumes6A"; no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build` headings.

## Verified sound

**The change.** `git diff --stat 6cec06f HEAD -- TauCetiRoadmap/QuadraticFormInvariants`: `README.md` 1 line, `Suggested.lean` 4 lines (5 insertions, 5 deletions). The merge base with `origin/main` (`ffac5139`) is `a891cd19`, the pin bump; `git diff --stat origin/main...HEAD` outside the five owned folders is empty, so the long "files changed outside the folder" list in the change summary is main's own pin-bump commit, merged into the branch, not the pull request's. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` and the generated `PROGRESS.md`, `STATUS.md` (`stray-files=0`).

**The four edits, each checked at `2fd255d9`.**

- README 2167: the old names `finiteExtensionValuativeRel`, `finiteExtensionNormedFieldTopology`, `finiteExtension_valuativeExtension` occur nowhere in the pinned tree; the new ones are `TauCeti.algebraicExtensionValuativeRel` (`TauCeti/NumberTheory/LocalField/AlgebraicExtension/Basic.lean:130`, under `[Algebra.IsAlgebraic K M]` at 72), `algebraicExtensionNormedFieldTopology` (86), `algebraicExtension_valuativeExtension` (147), `finiteExtension_isNonarchimedeanLocalField` (`LocalField/FiniteExtension/Basic.lean:54`, under `[Module.Finite K M]` at 40). For `L = K(s)` with `[L:K] = 2` both hypotheses hold. The sentence's other citations resolve: `TauCeti.index_normGroup_of_isCyclic` (`NumberTheory/ClassFieldTheory/Brauer/LocalH2Bound.lean:70`, with `[IsCyclic (L ≃ₐ[K] L)]` as the sentence says), `TauCeti.normGroup` (`RingTheory/Norm/Units.lean:110`), `Algebra.normUnits` (52), `QuadraticAlgebra.det_toLinearMap_eq_norm` (Mathlib `Algebra/QuadraticAlgebra/NormDeterminant.lean:30`). No leftover of the old names anywhere in the README.
- Imports: `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Hasse/Basic.lean` and `TauCeti/NumberTheory/LocalField/QuadraticForm/Defect/Basic.lean` exist at the pin (the directories replaced the files `Hasse.lean`, `Defect.lean`); every one of the 33 imports of the file resolves to a file at the pin, the three roadmap imports to files on this branch.
- `dyadicLevel_eq_absoluteRamificationIndex` (919): the supplier lemma `TauCeti.absoluteRamificationIndex_eq_natCastValuation` (`LocalField/AbsoluteRamificationIndex.lean:145`, variables at 106–108: `[Fact p.Prime] [FinitePadicExtension K p]`) takes `Fact (Nat.Prime 2)` from Mathlib's global instance `Nat.fact_prime_two` (`Mathlib/Data/Nat/Prime/Defs.lean:472`), so the dropped binder was redundant; the proof term elaborates (exit 0).
- `pinE1_mul_pinT_pow_four` (3229): the statement is unchanged; the `ring1` alternative removed from `first | …` was never needed (the residual goals after `simp` are the two `r2⁻¹ * r2⁻¹ * 2 = 1` instances); the proof elaborates.

**Gate and dependency check.** My gate run at this head (text rules, `--order`): `set_option=51 blob=0 latex=0 tex=14 prnum=0 sorry-data=9 sorry-examples=10 residue=0 private-paths=0 imports=1 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=11 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=52 source-material=0 FAIL`; all 52 `outside-folder` lines are in `TauCetiRoadmap/AlgebraicTopology`, `GeometricTopology`, `ReductiveGroups`, `RepresentationTheory/LieHighestWeight`, the pull request's own. The worker's build step adds 26 advisories: the module-system notes on the supplier closure and the two linter warnings of R09; no error. `gate --depcheck … --movable`: `depcheck: 242 roadmaps, 2373 edges, 0 problem(s)`; no UPWARD or CYCLE line. The three suppliers (`ProfiniteCohomology`, `ClassFieldTheory`, `Completed/LocalFieldsRamification`) are on main.

**Elaboration.** `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` from the worktree at this head and pin: exit 0 in 28 s, 136 `declaration uses sorry` warnings, the two unused-tactic warnings of R09, no error. Signature step: the one changed signature (`dyadicLevel_eq_absoluteRamificationIndex`) was compared with README 2140–2160 (Layer 6A: "`e = v_K(2)`; in mixed characteristic `2` it is the absolute ramification index of `K/ℚ_2`") by reading; its binders `[Algebra ℚ_[2] K] [ValuativeExtension ℚ_[2] K] [Module.Finite ℚ_[2] K]` are exactly the `FinitePadicExtension K 2` data; nothing else changed.

**Padding probe at this head and pin.** Scratch copy with seven sorries replaced by one `exact` each (the terms listed in R02): exit 0, 129 sorry warnings, no error. Seven of seven close.

**Seeded sample** (each passage re-read at this head; the supplier files changed under the pin bump, so every backticked name of the three contract paragraphs was re-resolved):

- "Audit status: incomplete. This roadmap remains active" (README 35): process text (R05); its pin claims are checked in R06.
- "From the local-fields-ramification roadmap" (833–859): 39 distinct backticked names; 30 resolve in `Completed/LocalFieldsRamification/Suggested.lean` at this head, 5 are Tau Ceti's at the pin (`card_squareClass_of_odd` at `NumberTheory/LocalField/SquareClass.lean`, `unitFiltration_le_square` and `not_unitFiltration_le_square` at `LocalField/Squares.lean`, `exists_unramified_class` at `QuadraticForm/UnramifiedClass.lean`, `unramified_class_unique` at `QuadraticForm/Ramification/Dictionary.lean`), 4 are this roadmap's own declared in `Suggested.lean` (`dyadicLevel` 917, `card_squareClass_of_dyadic` 994, `nonempty_unitFiltrationGraded_zero_equiv`, `…_succ_equiv`). None is missing.
- "From the class-field-theory roadmap" (860–897): every name resolves in `TauCetiRoadmap/ClassFieldTheory/Suggested.lean` except nine that are this roadmap's own or Tau Ceti's (`cup11`, `f2Pairing`, `trivialF2`, `kummerCoeffIsoTrivialF2`, `kummerMapCanonical`, `cup_kummerClass_eq_zero_iff_hilbertSymbol`, `localSymbol_eq_zero_iff_cup`, `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula`), each declared in `Suggested.lean` and, for the last two, also native (R06). The worker's leads `muNRepCoeffDictionary` and `absoluteGaloisGroupComparison` are ClassFieldTheory declarations, not library ones: not defects.
- "From the profinite-cohomology roadmap" (898–928): every name resolves in `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` except four of this roadmap's own (`cup11_homClass`, `f2CocycleClass`, `f2CocycleClass_add`, `f2CocycleClass_eq_add`), all declared in `Suggested.lean`; the "abbreviations of Tau Ceti's declarations" claim fails for `cup`, `f2Pairing`, `homClass`, `cochainClass`, `inhomogeneousCochain2`, `galoisF2Iso` (R01).
- "The Hilbert symbol is this roadmap's, in both halves" (2174), "Compatibility with the cup product" (2458–2464) and "This sublayer is the canonical owner of the Kummer-cup/norm-equation criterion" (2824): the mathematics is right and native (`CupNorm.lean:103`, `LocalSymbol.lean:191`, `LocalField/QuadraticForm/Brauer.lean`); the ownership sentences are refuted (R06).

**Sources.** The changed sentence cites no source. The sampled targets' locators are unchanged from the previous report and were re-opened there: Kahn 1984 (`kahn1984`) Théorème 2 (line 55), Lemme II.2.1 (763–769), Prop. II.3.5 (1044–1059); Serre CMH 1984 (`serre1984cmh`) Théorème 1′ (560–562); Kozlowski 1984 (`kozlowski1984`) Theorem 1.1 (34–41).

**Library declarations opened at `2fd255d9`** (file under `TauCeti/`): `NumberTheory/LocalField/AlgebraicExtension/Basic.lean:72,86,130,147`; `LocalField/FiniteExtension/Basic.lean:40,54`; `LocalField/AbsoluteRamificationIndex.lean:64–70,106–108,145`; `LocalField/Squares.lean:82–90`; `ClassFieldTheory/Brauer/LocalH2Bound.lean:70`; `RingTheory/Norm/Units.lean:52,110`; `FieldTheory/QuadraticForm/StiefelWhitney/Evens/Kummer/Value.lean:77,182,220`; `StiefelWhitney/QuadraticExtension.lean:249,268`; `StiefelWhitney/Class.lean:90,100,182,198`; `StiefelWhitney/Transfer.lean:137`; `GaloisCohomology/EvensNorm.lean:84`; `MuTwo/Basic.lean:355,668`; `MuTwo/BrauerTorsion.lean:62`; `MuTwo/KummerCharacter.lean:178`; `MuTwo/CupNorm.lean:69,103`; `MuTwo/LocalSymbol.lean:191`; `MuTwo/EvensNorm.lean:119`; `NumberTheory/LocalField/QuadraticForm/Classification.lean:132`; `Invariants.lean:101–155`; `Bimultiplicativity.lean:97`; `NumberTheory/HilbertSymbol/Basic.lean:47,147,251`; `NumberTheory/QuadraticForm/Global/ProductFormula.lean:61,67`; `Algebra/Quaternion/BrauerClass.lean:173,212,255`; `Algebra/CrossedProduct/BaseChange/Naturality.lean:51`, `Comparison.lean:274`, `TwoTorsion.lean:152`, `Splitting/Basic.lean:321`; `Algebra/CentralSimple/FiniteGalois.lean:51`; `LinearAlgebra/QuadraticForm/Witt/Clifford.lean`, `Witt/Round.lean`; Mathlib `Algebra/QuadraticAlgebra/NormDeterminant.lean:30`, `Data/Nat/Prime/Defs.lean:472`. Absent at the pin: `LocalField/WorkedExamples/DyadicSqrt/NormControl.lean`, `RegularFormClass/Matrix.lean`, any `…_of_mem_unitValueSet` name.

**Adversarial table.** Rows for the untouched statements carry the previous report's values (review at `6cec06f`, which carried them from `67b939d`); the last three rows are this report's, for the changed statements.

| Statement | Instances | Values | Result | Source of row |
|---|---|---|---|---|
| `hasseInvariant_smul` (632) | general `n`; `n = 0, 1, 2` | `∏_{i<j}(λa_i,λa_j) = (λ,λ)^{C(n,2)}·(λ,∏_{i<j}a_ia_j)·s(q)`, `∏_{i<j}a_ia_j = d^{n−1}`, `(λ,λ) = (λ,−1)`; `n = 2`: `(λa,λb) = (λ,−1)(λ,ab)(a,b)` | holds | previous report |
| `hasseInvariant_append` (622) | `⟨a⟩ ⊥ ⟨b⟩` | lhs `(a,b)`; rhs `1·1·(a,b)` | holds | previous report |
| `cliffordInvariant_eq` (777) | `⟨1,…,1⟩` over ℝ, `n = 1..8`; `n = 0, 1` | exponents `(0,0),(0,0),(1,1),(3,5),(6,15),(10,35),(15,70),(21,126)`; predicted `1,1,[ℍ],[ℍ],[ℍ],[ℍ],1,1`; actual `ℝ, M₂(ℝ), ℍ, M₂(ℍ), M₂(ℍ), M₄(ℍ), M₈(ℝ), M₁₆(ℝ)` | holds | previous report |
| `signedDiscr_mk` (483) | `⟨1,−1⟩` | `(−1)^1·(−1) = 1 = d±(ℍ)` | holds | previous report |
| `exists_of_realization` (1319) | `n = 1, s = −1`; `n = 2, d = [−1], s = −1`; `(2,[1],−1)` over ℚ₂ | first two excluded by `h₁`, `h₂`; `⟨−1,−1⟩`: `d = 1`, `s = (−1,−1)_{ℚ₂} = −1` | holds | previous report |
| `localHasse_of_discr_neg_one` | `⟨a,−a⟩` | `(a,−a) = 1` by `−a = 0² − a·1²` | holds | previous report |
| Serre's ℚ₂ formula (1396), `8×8` table (README 2293) | `(2,5)`, `(−1,−1)`, `(5,5)`, `(2,−1)`, `(−1,5)`, `(2,2)`, `(−1,2)` | `ε(1,3,5,7) = 0,1,0,1`, `ω = 0,1,1,0`; values `−1,−1,+1,+1,+1,+1,+1` | holds | previous report |
| Odd-residue formula (1276, README 2258) | `a = π^α u`, `b = π^β u'` | `(π,π)^{αβ}(π,u')^α(u,π)^β(u,u')`, `(u,u') = 1`, `(π,π) = (π,−1)` | holds | previous report |
| Bimultiplicativity over a general field (README 2341) | `K = ℚ`, `a = −1`, `b = 3`, `c = 7` | `3, 7, 21` not sums of two rational squares | fails, as the README says | previous report |
| `defectExponent_unit` (1120) | ℚ₂: `u = 5, −1, 3`; `e = 0` | `δ = 2 = 2e`; `δ = 1`; `δ = 1`; list `{2e} ∪ {2k+1 : k < e}`; `e = 0`: `δ = 0` | holds | previous report |
| `exists_sq_mul_eq_unramified` (1128) | `d` even | `δ(ac²) = d + 2v(c)`, `v(c) = e − d/2` | holds | previous report |
| `unitNorm_iff_integralBasis_families` (1150) | `K = ℚ₂(π)`, `π² = 2`, `a = 5` | `(π+½)² − 5·¼ = 1 + π`, a unit; coordinates `(π+1, 1)` | holds | previous report |
| `card_squareClass_of_dyadic` (994) | ℚ₂; ℚ₂(√2) | `4·2¹ = 8`; `e = 2, q = 2`: `16 = 2^{2+2}` | holds | previous report |
| `cup_kummerClass_eq_zero_iff` (2462), `hilbertSymbol_eq_cohomological` (2552) | `a` a square | `(a) = 0 ⇒ cup = 0 ⇒ b = 1² − a·0²`, symbol `+1` | holds; native | previous report |
| 6E milestone 1 (1358) | `Q(K) = {1,[D]}`; ℚ | `ε` injective into `ℤˣ` iff `|Q(K)| ≤ 2`; false over ℚ | holds under the section's hypotheses | previous report |
| `brauer2EquivH2_cliffordInvariant` (2763) | `n = 3` | `w₂ + 1·((−1)∪d) + 1·((−1)∪(−1))` | holds | previous report |
| `sw_append` (2746) | `⟨a⟩ ⊥ ⟨b⟩` | lhs `(a)∪(b)`; rhs `0 + 0 + (a)∪(b)` | holds | previous report |
| `discr_traceTransfer` (2896) | `a = 1`; `a = x` | `Tr_*⟨1⟩ = ⟨2,2d⟩`, `d ≡ 4d`; `Tr(x(u+vx)²) = 4duv`, hyperbolic | holds | previous report |
| Kahn's basis (2867) | `Tr a ≠ 0` | `polar(1, x/a) = 0`; `q(x/a) = d·Tr a/N a` | holds | previous report |
| `galoisEvens2_kummerClass` (3723) | `a = 1 + t x`; ℚ₂, `d = −1`, `a = 1+2i` | `(2c)∪(−d) + (2)∪(d) = (c)∪(c) + (c)∪(d)`; `(2)∪(−1) = 0`; `(2)∪(5) ≠ 0` | holds; now native `Value.lean:220` | previous report, native twin this report |
| Relative formula degree 2 (3792) | general `a`; `Tr a = 0` | rhs `(2)∪(d) + N((a)) + (d)∪(N a)` with `(d)∪(N a) = 0`; trace zero: `0 = (2)∪(d) + (2)∪(d)` | holds; now native `QuadraticExtension.lean:249` | previous report, native twin this report |
| `cup11_comm` (1521) | bidegree `(1,1)`, `𝔽₂` | sign `(−1)^{1·1} = +1` | holds (about the opaque cup, R01) | previous report |
| `kummerCharacter` homomorphism (3400) | `g r = ±r`, `h r = ±r` | `rootSign(gh) = rootSign g + rootSign h` in all four cases | holds | previous report |
| Pin model (3116–3335) | `e₁ = diag(1,−1)`, `e₂` = swap | `e₁` lifts `diag(−1,1)`; `t² = 1`; `(e₁t)⁴ = −1` | holds | previous report |
| `galoisRes2_eq_zero_iff` (3083) | `L = K(√d)` | `ker(res) = (d) ∪ H¹(G_K)` | holds | previous report |
| README 2410 negative control | ℝ: `⟨1,1,1,1⟩`, `⟨−1,−1,−1,−1⟩` | `d = 1, 1`; `s = 1, (−1,−1)^6 = 1`; signatures `4, −4` | holds | previous report |
| Layer 0 rank-one boundary (235, 269) | `⟨1⟩`, `⟨4⟩` over ℚ | isometric by `x ↦ x/2` | holds | previous report |
| `exists_hilbertSymbol_eq_neg_one` | `a` a square | `(a,b) = 1` for all `b` | holds | previous report |
| `hilbertSymbol_mul` (1233), `quaternionClass_*` (561–578), probe | `[Invertible (2 : K)]`; `a b c : Kˣ` | each closes with the native lemma (`Invertible.ne_zero` supplies `(2 : K) ≠ 0`) | hold, native at `2fd255d9` | this report |
| `dyadicLevel_eq_absoluteRamificationIndex` (919), binder dropped | `K = ℚ₂`; `K = ℚ₂(√2)`; `K = ℚ₃` | ℚ₂: `v_K(2) = 1 = e`; ℚ₂(√2): `v_K(2) = 2 = e`; ℚ₃ admits no `Algebra ℚ_[2] K`, so it is outside the statement, and `dyadicLevel ℚ₃ = 0` is reached only through `TauCeti.dyadicLevel` (the docstring's point); `Fact (Nat.Prime 2)` is `Nat.fact_prime_two` | holds; elaborates at the pin | this report |
| `pinE1_mul_pinT_pow_four` (3229), tactic changed | `r2² = 2` | `pinT = r2⁻¹(e₁ − e₂) = r2⁻¹[[1,−1],[−1,−1]]`; `e₁·pinT = r2⁻¹[[1,−1],[1,1]]`; square `= ½[[0,−2],[2,0]] = [[0,−1],[1,0]]`; fourth power `= [[−1,0],[0,−1]]`; residual goals `r2⁻¹·r2⁻¹·2 = 1` | holds; statement unchanged, proof elaborates | this report |
| README 2167 (6C alternative), renamed names | `L = K(s)`, `s² = a`, `a` a nonsquare; `a = c²` | `(x,y) ↦ x + ys`: matrix of multiplication `[[x, ay],[y, x]]`, `det = x² − ay² = N(x+ys)`; `[L:K] = 2` gives `Module.Finite` and `IsAlgebraic`, so the four renamed declarations apply; split case: `K × K` has surjective norm `(u,v) ↦ uv`, indicator `≡ +1`; index two from `index_normGroup_of_isCyclic` under `IsCyclic (L ≃ₐ[K] L)` | holds | this report |

## Not verifiable

- T. Y. Lam, *Introduction to Quadratic Forms over Fields*; O. T. O'Meara, *Introduction to Quadratic Forms*; Gille–Szamuely, *Central Simple Algebras and Galois Cohomology*: no legal copy in the cache (AMS, Springer, CUP paywalls); the statements cited to them were checked by computation and against the pinned Tau Ceti files, as in the previous report.
- J.-P. Serre, *A Course in Arithmetic* and *Local Fields* (`serre1973cia`, `serre1979lf`), J. Milnor 1970 (`milnor1970`): settled as uncertified, cited by locator.
- Ownership against open pull requests: checked through the brief's sibling checkouts by name; none is a quadratic-form-invariants roadmap (`GlobalQuadraticForms` and `IntegralLattices` are consumers; `QuadraticFormInvariantsPartII` consumes), and the board's packages index lists no other owner of these objects.

## Source issues

- none
