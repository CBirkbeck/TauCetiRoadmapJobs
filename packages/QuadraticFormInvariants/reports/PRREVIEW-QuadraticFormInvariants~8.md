# Review of QuadraticFormInvariants (pull request #1797 at 84818d4)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `c065862`. `git diff --stat c0658625 HEAD -- TauCetiRoadmap/QuadraticFormInvariants` is empty: the folder (`README.md` 3626 lines, `Suggested.lean` 3873 lines, `metadata.toml`, generated `PROGRESS.md` and `STATUS.md`) is byte-identical to the head the previous review read. The commits since then are a merge of main (`345ce56f`) and repairs in the pull request's own `AlgebraicTopology` and `ReductiveGroups` folders; the merged main commits touch `DGFloer`, `TaubesGromov`, `ComplexCurveModuli`, `HeegaardFloer`, `RepresentationTheory` progress files and two CI workflows, and the whole `c065862..HEAD` diff contains no occurrence of `QuadraticFormInvariants`, `hilbertSymbol`, `StiefelWhitney` or `quaternionClass`. The pins are unchanged (Tau Ceti `2fd255d9…`, Mathlib `1b1ccf4b…`, toolchain `v4.36.0-rc2`, each confirmed by `git rev-parse HEAD` in the pinned package and by `lean-toolchain`), and the three supplier modules this file imports are byte-identical to `origin/main` at this head. So every finding of the previous review stands with the same witness, each re-checked at this head and re-opened at the pin below; none is repaired, and no new defect was introduced. The gate still fails on the same text rules and the elaboration still has two warnings besides `sorry`. A rewritten folder (330-line `Suggested.lean` with a module header and every headline discharged by the pin) exists as a commit in the review checkout that is an ancestor of no branch (`git merge-base --is-ancestor` fails for it against this head); nothing of it is in this pull request, so it is not reviewed here.

## R01 (P1) — Layers 7–9 are stated on another roadmap's sorry'd data, and both headlines are native at the pin

Location: `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` lines 2–4 (`import TauCetiRoadmap.ProfiniteCohomology.Suggested`, `import Completed.LocalFieldsRamification.Suggested`, `import TauCetiRoadmap.ClassFieldTheory.Suggested`); `cup11` (1510), `kummerClass` (1560), `h2MuToUnits` (1585), `sw2Class` (2690), `galoisEvens2` (2970); the two headlines `galoisEvens2_kummerClass` (3723) and `relativeStiefelWhitney_quadraticExtension` (3792).

Claim: README 898–911 says the profinite-cohomology names consumed are "abbreviations of Tau Ceti's declarations of the same names or are proved by them", so that "every statement here is about Tau Ceti's objects"; the module docstring presents the two Layer 9 theorems as the headlines the finished roadmap proves.

Witness: `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` at this head (identical to main) still has `cup` (3868), `inhomogeneousCochain2` (5145), `f2Pairing` (5332), `homClass` (5537) and `galoisF2Iso` (5846) as `noncomputable def`s with body `sorry`, re-read this round. The gate records `imports=1`. At the pin both headlines are Tau Ceti theorems: `TauCeti.galoisEvens2_kummerClass` at `TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/Evens/Kummer/Value.lean:220` (trace-zero case `…_of_trace_eq_zero` at 182) and `TauCeti.sw2Class_formClass_traceTransfer_smul_sq` at `TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/QuadraticExtension.lean:249`, both re-opened at `2fd255d9` this round.

Repair: imports become `import Mathlib` plus the `TauCeti.*` modules used; the three roadmap imports go. Each headline is stated as an `example` discharged by the native theorem (as the four-fold criterion is at 410–416) or named in the module docstring as Tau Ceti's with its declaration; nothing is restated on `cup11`/`galoisEvens2`. README 898–928 says which supplier names are Tau Ceti's at the pin and which are the supplier's prototypes.

## R02 (P2) — The file is an API catalogue of declarations proved at the pin

Location: `Suggested.lean`, 136 sorried declarations (the elaboration at this head prints 136 `declaration uses sorry` warnings); representative lines unchanged: Layer 5 `quaternionClass_symm/_sq/_mul/_congr/_one_sub` (561–596), `hasseInvariant_*` (613–636), `cliffordInvariant_eq` (777); Layer 6 `squareClass_finite` (971), the defect calculus (1069–1131), `hilbertSymbol_*` (1190–1302), the 6D block (1315–1358), `serreEps`/`serreOmega` (1377–1440); Layer 7 `kummerSquareClassEquiv` (1569), `Br2` (1659), the crossed-product and `Inflation` block (1706–2345), `hilbertSymbol_productFormula` (2578); Layers 8–9 the Pin model (3116–3295) with its own `pinE1_eq_native … pinLift_eq_native` comparisons (3338–3387), `rootSign … galoisF2Iso_inv_kummerClass` (3395–3486).

Claim: the module docstring calls the file "target signatures"; the contract is headline theorems only, with what exists at the pin deleted and cited.

Witness (object → native declaration at `2fd255d9`, paths under `TauCeti/`, each re-opened this round): `Algebra/Quaternion/BrauerClass.lean:173,212,255` (`BrauerGroup.quaternionClass_comm`, `_sq`, `_mul`); `NumberTheory/HilbertSymbol/Basic.lean:47,102,147,251` (`hilbertSymbol`, `hilbertSymbol_neg_self`, `_congr_sq`, `_comm`); `NumberTheory/LocalField/QuadraticForm/Bimultiplicativity.lean:97` (`hilbertSymbol_mul_right`); `MuTwo/CupNorm.lean:103`; `MuTwo/LocalSymbol.lean:191`; `LinearAlgebra/QuadraticForm/Witt/Clifford.lean:142,187`; `NumberTheory/QuadraticForm/Global/ProductFormula.lean:67` (`hilbertSymbol_productFormula`). One-tactic probe re-run this round on a scratch copy at this head and pin: the sorries at 563, 570, 578, 1192, 1197, 1211, 1235 (`quaternionClass_symm`, `quaternionClass_sq`, `quaternionClass_mul`, `hilbertSymbol_congr_sq`, `hilbertSymbol_neg_self`, `hilbertSymbol_comm`, `hilbertSymbol_mul`) each close with the single native term (`hilbertSymbol_mul` through `TauCeti.hilbertSymbol_mul_right (Invertible.ne_zero (2 : K)) a b c`); the copy elaborates with exit 0 in 49 s, 129 sorry warnings, no error. Seven of seven close. The linter also reports that `hilbertSymbol_comm` uses none of `[ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]`, so the local hypotheses at 1205–1206 are not needed for it.

Repair: delete every declaration whose object exists at the pin and the proved comparisons with it (3338–3387). Keep, as reducible aliases proved from the native declarations and with no `sorry`, only what `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` and `TauCetiRoadmap/IntegralLattices/Suggested.lean` on main consume from this namespace (`RegularFormClass`, `formClass`, `wittRing`, `toWittRing`, `discr`, `signedDiscr`, `hilbertSymbol`, `hilbertSymbol_neg_self`, `hilbertSymbol_mul`, `hilbertSymbol_comm`, `exists_hilbertSymbol_eq_neg_one`, `localHasse`, `exists_of_realization`, `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula`; GlobalQuadraticForms unfolds `localHasse` and `hilbertSymbol`, so these keep their bodies or GlobalQuadraticForms is edited in the same change).

## R03 (P2) — The second headline theorem is statable at the pin and absent

Location: README 19–23 name three high points; `Suggested.lean` states the first (410–416) and the third (3792); Layer 6D (README 2360–2365) has no statement: 1315–1351 state realization, `u(K) = 4` and quaternary uniqueness, not the classification.

Claim: "Two regular forms over `K` are isometric if and only if `(dim, d, s)` agree".

Witness: `TauCeti.RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq` at `TauCeti/NumberTheory/LocalField/QuadraticForm/Classification.lean:132`, re-opened at `2fd255d9` this round; `grep -c eq_iff_rank_eq_and_discr_eq_and_localHasse_eq Suggested.lean` prints 0 at this head.

Repair: state it in `Suggested.lean` as an `example` discharged by the native theorem, or name it in the module docstring as Tau Ceti's with that declaration.

## R04 (P2) — Sorry'd data and `set_option`

Location: `Suggested.lean` 822 `cliffordHomI2`, 864 `cliffordHomI2Bar`, 971 `instance squareClass_finite`, 1569 `kummerSquareClassEquiv`, 1619 `resHUnits`, 1835 `cocycleOfSplitting`, 1862–1866 `TwoCocycle.comap` (`isCocycle := sorry`), 2353 `brauerCohomologyEquiv`, 2358 `brauer2EquivH2`; 51 `set_option maxHeartbeats`/`synthInstance.maxHeartbeats … in` lines, the first at 1981 and the last at 3552 (`grep -c '^set_option'` prints 51 at this head). Gate at this head: `sorry-data=9 set_option=51`.

Claim: the docstrings (2347–2352, 2403–2407) call these "named definitions" that carry the normalisation.

Witness: a `def` with body `sorry` asserts nothing, so `brauerCohomologyEquiv_unique` (2393) is about an unknown map. At `2fd255d9`, re-opened this round, native bodies exist for `cliffordHomI2`/`cliffordHomI2Bar` (`LinearAlgebra/QuadraticForm/Witt/Clifford.lean:142,187`), `kummerSquareClassEquiv` (`MuTwo/Basic.lean:668`), `cocycleOfSplitting` (`Algebra/CrossedProduct/Splitting/Basic.lean:321`), `brauerCohomologyEquiv` (`Algebra/CrossedProduct/Comparison.lean:274`), `brauer2EquivH2` (`Algebra/CrossedProduct/TwoTorsion.lean`, docstring line 19 and the definition below it); `squareClass_finite` follows from `TauCeti.card_squareClass` (`NumberTheory/LocalField/SquareClass.lean`, listed at line 38).

Repair: delete the nine with R02 (the two Clifford maps included, now native); the `set_option` lines go with the sections they sit in; any kept statement is restated to elaborate under the defaults.

## R05 (P3) — The README carries a process document

Location: README 33–331 (the heading `## Completion audit (2026-10-28)` at 33; "Audit status: incomplete. This roadmap remains active." at 35; the Tau Ceti commit `cd83a3c6…` at 105 and 157 with "Lean `4.36.0-rc1`" at 140 and 157; "The repository dependency pin remains `a91d3aa…`" at 146; the placeholder `/absolute/path/to/that/file.lean` at 169; the 150-line Lean fence ending in `#print axioms` lines at 330–331) and 3618–3626 (the "private migration and provenance ledger"); `Suggested.lean` 403 and 1209 name "`gq2`'s B11a", a label defined nowhere.

Witness: the README rules (timeless; no process narrative, pull-request references or local paths; `#print axioms` never). The pin facts recorded are stale: the manifest pins Tau Ceti `2fd255d9…` and the toolchain is `v4.36.0-rc2` (both re-read this round).

Repair: delete 33–331 and 3618–3626 and the two "B11a" phrases; the native-interface facts that survive at the pin go into the supplier contracts with pin-true paths (R06).

## R06 (P3) — Claims about the pin that are false at `2fd255d9`, and ownership overclaims

Each re-checked in the pinned tree this round:

- Files cited that do not exist: `NumberTheory/LocalField/WorkedExamples/DyadicSqrt/NormControl.lean` (README 134–137), `LinearAlgebra/QuadraticForm/RegularFormClass/Matrix.lean` (117); `ls` fails on both. Declarations cited that exist nowhere: `TauCeti.oneFoldPfister_smul_equivalent_of_mem_unitValueSet` and `twoFold…` (1603–1604; `grep -rn` of the two full names over the pinned `TauCeti/` prints 0 hits; the pin's names are `oneFoldPfister_smul_equivalent_iff` and `twoFoldPfister_smul_equivalent_iff`, `LinearAlgebra/QuadraticForm/Witt/Round.lean:44` and the docstring at 20–22). The worker's citation leads list the last two.
- The pin sentence at 146 (`a91d3aa…`) contradicts the manifest (`2fd255d9…`).
- Ownership: "The Hilbert symbol is this roadmap's, in both halves" (2174) and "the comparison is the frozen declaration `hilbertSymbol_eq_cohomological`" (2180): `TauCeti.hilbertSymbol` (`NumberTheory/HilbertSymbol/Basic.lean:47`) and `TauCeti.hilbertSymbol_eq_cohomological` (`MuTwo/LocalSymbol.lean:191`) are native. "This sublayer is the canonical owner of the Kummer-cup/norm-equation criterion" (2824): `TauCeti.cup_kummerClass_eq_zero_iff` (`MuTwo/CupNorm.lean:103`, with the `_hilbertSymbol_eq_one` form at 132). "`exists_finiteGalois_splittingField` … is a target here and not an assumption" (2623–2626): `Algebra/CentralSimple/FiniteGalois.lean` (listed at line 26). "`hilbertSymbol_productFormula`, exported to Global Quadratic Forms" (866, 870–872): `TauCeti.hilbertSymbol_productFormula` at `NumberTheory/QuadraticForm/Global/ProductFormula.lean:67`.

Repair: every such sentence says "Tau Ceti's, consumed" with the pin-true file, or is deleted; the two Pfister names become the pin's `_iff` names; the pin sentence goes with R05.

## R07 (P3) — Gate text rules

Location: the gate at this head prints `set_option=51 … tex=14 … sorry-data=9 sorry-examples=10 … imports=1 … readme-ids-missing=11 … FAIL`: `tex` at README 774, 1459, 1461, 1701, 2023, 2041, 2051, 2258, 2558, 3153–3154, 3294; `readme-ids-missing` for `brauerCohomologyEquiv_baseChange`, `discr_baseChange`, `discr_one_elem_eq_of_sq_algebraMap`, `finrank_adjoin_simple_eq_two_of_sq_mem_notMem`, `hilbertSymbol_mul_right`, `map_ker_reₗ_of_algEquiv`, `map_norm_unitFiltration_zero`, `signedDiscr_add`, `signedDiscr_mk_rankOne_mul`, `signedDiscr_mul`, `sw1Class_traceTransfer_mk_rankOne`; `sorry-examples` at `Suggested.lean` 1411, 1416, 1421, 1434, 1439, 2774, 2786, 2814, 2822, 3830; the module-system advisory on the header.

Witness: my gate run at this head reproduces the worker's line exactly. The flagged identifiers exist at the pin under a namespace, re-opened this round: `TauCeti.WittRing.signedDiscr_add` (`Witt/Discriminant.lean`, docstring line 41), `signedDiscr_mul` at `RegularFormClass/Discriminant.lean:321`, `TauCeti.hilbertSymbol_mul_right` at `Bimultiplicativity.lean:97`, `signedDiscr_mk_rankOne_mul_of_even` used at `RegularFormClass/Clifford.lean:644`; `discr_baseChange`, `map_ker_reₗ_of_algEquiv`, `finrank_adjoin_simple_eq_two_of_sq_mem_notMem`, `discr_one_elem_eq_of_sq_algebraMap`, `sw1Class_traceTransfer_mk_rankOne`, `brauerCohomologyEquiv_baseChange` and `map_norm_unitFiltration_zero` carried from the previous report (`RegularFormClass/BaseChange.lean:437`, `Algebra/Quaternion/AlgEquiv.lean:150`, `FieldTheory/IntermediateField/Quadratic.lean:113`, `FieldTheory/Trace.lean:78`, `StiefelWhitney/Transfer.lean:137`, `CrossedProduct/BaseChange/Naturality.lean:51`, `Completed/LocalFieldsRamification/Suggested.lean:857`).

Repair: put the 14 displays in code spans; prefix the eleven supplier names with their namespace; delete the ten admitted examples (their content is native, R02) or prove them; the header becomes `module` / `public import Mathlib` / `public import TauCeti.*` once the roadmap imports of R01 are gone.

## R08 (P3) — Garbled text and README shape

Location: README 2167–2171 ("The full6B defect", "the classical6D quaternion uniqueness theorem do6E/7B"), 2217 and 2225 ("The direct6B computation", "of6B"), 3486–3490 ("Layer 6 first consumes6A", "feed6D", "the direct6B tables", "The complete6B defect", "the6C table outputs"): sublayer labels fused to the preceding word, inside a one-paragraph imperative recipe at 2167–2169 that names Tau Ceti declarations without backticks. The README's `## ` headings at this head are `Completion audit (2026-10-28)`, `Suggested homes`, `Scope`, `Standing hypotheses and conventions`, `What this roadmap consumes`, `Native interfaces and remaining comparisons`, `Remaining comparisons and computations`, `The build, in layers`, `Worked examples (acceptance criteria)`, `Ordering and parallelism`, `References`, `Ownership and coordination`: no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` or `## How to read the build`; `grep -c 'Needs:'` prints 0; no `### Examples`/`### Dependencies` per layer.

Witness: the house shape in the brief and the roadmaps on main written in it (`TauCetiRoadmap/ClassFieldTheory/README.md`).

Repair: restore the spaces and rewrite 2167–2171 as prose targets with `*Needs:*` lines (the four Tau Ceti declarations in backticks with their hypotheses: `algebraicExtensionValuativeRel K M` needs `[Algebra.IsAlgebraic K M]`, `finiteExtension_isNonarchimedeanLocalField` needs `[Module.Finite K M]`); move the README toward the house shape.

## R09 (P3) — The elaboration has two warnings besides `sorry`

Location: `Suggested.lean` 3332:77 and 3333:16, inside `pinDiagonalLift_mul` (3319–3335).

Claim: the module elaborates with `sorry` the only warning.

Witness: `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` at this head and pin, run this round: exit 0 in 38 s, 136 `declaration uses sorry`, plus `Unused tactic linter: <;> can be removed` at 3332:77 and 3333:16 (the worker's gate build lists the same two).

Repair: remove the two redundant `<;>`, or delete the Pin-model block with R02 (`TauCeti/FieldTheory/GaloisCohomology/MuTwo/TwistedBoundary.lean` and `LinearAlgebra/Matrix/PinPlusPlane/*` carry it natively, as the file's own `pinE1_eq_native … pinLift_eq_native` comparisons at 3338–3387 attest).

## Previous findings

- R01 — not repaired: `Suggested.lean` 2–4 still import the three roadmap modules; `cup11` (1510), `sw2Class` (2690), `galoisEvens2` (2970) and the headlines (3723, 3792) still sit on `ProfiniteCohomology`'s sorry'd `cup`, `f2Pairing`, `galoisF2Iso`; both headlines are native at the pin.
- R02 — not repaired: 136 sorried declarations; the seven probed close with the native declaration at `2fd255d9` (probe re-run this round, exit 0, 129 sorry warnings).
- R03 — not repaired: no statement of the `(dim, d, s)` classification in `Suggested.lean`; `Classification.lean:132` at the pin states it.
- R04 — not repaired: nine `def`/`instance` bodies are `sorry` (822, 864, 971, 1569, 1619, 1835, 1862, 2353, 2358); 51 `set_option … in` lines from 1981 to 3552.
- R05 — not repaired: README 35 "Audit status: incomplete. This roadmap remains active."; 105/157 the Tau Ceti commit; 140/157 "Lean `4.36.0-rc1`"; 146 the `a91d3aa…` pin; 169 the absolute-path placeholder; 330 `#print axioms`.
- R06 — not repaired: `NormControl.lean` and `Matrix.lean` absent at the pin, the two `_of_mem_unitValueSet` names at 1603–1604, the pin sentence at 146, the ownership sentences at 2174, 2180, 2623–2626, 2824.
- R07 — not repaired: the gate's text-rule line is identical (`set_option=51 tex=14 sorry-data=9 sorry-examples=10 imports=1 readme-ids-missing=11 FAIL`).
- R08 — not repaired: README 2171 "The full6B defect …", 3486 "Layer 6 first consumes6A"; the four house headings and `*Needs:*` lines absent.
- R09 — not repaired: the two `<;>` at 3332:77 and 3333:16 still fire the unused-tactic linter.

## Verified sound

**The change.** `git diff --stat c0658625 HEAD -- TauCetiRoadmap/QuadraticFormInvariants` is empty (`stray-files=0`; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`, `PROGRESS.md`, `STATUS.md`). `git diff --stat c0658625 HEAD` lists 15 files (437 insertions, 5090 deletions): the pull request's own `AlgebraicTopology`, `GeometricTopology` and `ReductiveGroups` folders, and the merged main commits `77a53e0f … eaf17b10` (`.github/workflows/progress-announce.yml`, `progress-merge.yml`, `ComplexCurveModuli/README.md`, `DGFloer/README.md`, `HeegaardFloer/README.md` and `Suggested.lean`, `RepresentationTheory/PROGRESS.md` and `STATUS.md`, `TaubesGromov/README.md`); that diff contains no occurrence of `QuadraticFormInvariants`, `hilbertSymbol`, `StiefelWhitney` or `quaternionClass`, so nothing this roadmap relies on or supplies moved. `git diff --stat origin/main...HEAD` outside the five owned folders is empty. `lake-manifest.json` and `lean-toolchain` are unchanged against `origin/main`: Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` (both by `git rev-parse HEAD` in the pinned packages), `v4.36.0-rc2`. The three supplier modules imported (`TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`, `TauCetiRoadmap/ClassFieldTheory/Suggested.lean`, `Completed/LocalFieldsRamification/Suggested.lean`) and the two consumers on main (`GlobalQuadraticForms`, `IntegralLattices`) are byte-identical to `origin/main` at this head (`git diff --stat origin/main HEAD` on them is empty).

**Gate and dependency check.** My gate run at this head (`--base origin/main`, 6 s): `set_option=51 blob=0 latex=0 tex=14 prnum=0 sorry-data=9 sorry-examples=10 residue=0 private-paths=0 imports=1 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=11 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=50 source-material=0 FAIL`; every `outside-folder` line is under `TauCetiRoadmap/AlgebraicTopology/`, `GeometricTopology/`, `ReductiveGroups/` or `RepresentationTheory/LieHighestWeight/`, which this brief names as the pull request's own. The worker's build step adds the module-system advisories on the supplier closure and the two linter warnings of R09; no error. `gate --depcheck … --movable`: `depcheck: 240 roadmaps, 2438 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` from the worktree at this head and pin: exit 0 in 38 s, 136 `declaration uses sorry` warnings, the two unused-tactic warnings of R09, no error. No signature changed since the previous `#check` comparison (the folder is byte-identical since `6cec06f`), so the signature step is carried from the previous reports (the one changed signature then, `dyadicLevel_eq_absoluteRamificationIndex`, matched README Layer 6A).

**Padding probe, re-run.** Scratch copy with the seven sorries at 563, 570, 578, 1192, 1197, 1211, 1235 replaced by one native term each (`TauCeti.BrauerGroup.quaternionClass_comm a b`, `quaternionClass_sq a b`, `quaternionClass_mul a b c`, `TauCeti.hilbertSymbol_congr_sq a a' b b' ha hb`, `TauCeti.hilbertSymbol_neg_self a`, `TauCeti.hilbertSymbol_comm a b`, `TauCeti.hilbertSymbol_mul_right (Invertible.ne_zero (2 : K)) a b c`): exit 0 in 49 s, 129 sorry warnings, no error. Seven of seven close.

**Seeded sample** (each passage re-read at this head; line numbers unchanged):

- "Audit status: incomplete. This roadmap remains active" (README 35): process text (R05); its pin claims are the subject of R06.
- "From the local-fields-ramification roadmap" (833, within `## What this roadmap consumes`, 580–946): the contract and its table are unchanged; the names resolved in earlier rounds (30 in `Completed/LocalFieldsRamification/Suggested.lean`, 5 Tau Ceti's at the pin, 4 this roadmap's own) are unchanged, and `Completed/LocalFieldsRamification/Suggested.lean` on this branch is identical to main.
- "From the class-field-theory roadmap" (860–897): unchanged; the leads `muNRepCoeffDictionary` (884) and `absoluteGaloisGroupComparison` (889) are ClassFieldTheory declarations, not library ones: not defects. The ownership sentence at 866 ("exported to Global Quadratic Forms") is R06.
- "From the profinite-cohomology roadmap" (898–928): unchanged; the "abbreviations of Tau Ceti's declarations" claim fails for `cup`, `f2Pairing`, `homClass`, `inhomogeneousCochain2`, `galoisF2Iso` (sorry'd in the supplier, R01).
- "The Hilbert symbol is this roadmap's, in both halves" (2174), "Compatibility with the cup product" (2458–2464) and "This sublayer is the canonical owner of the Kummer-cup/norm-equation criterion" (2824): the mathematics is right and native (`cup_kummerClass_eq_zero_iff` at `MuTwo/CupNorm.lean:103`, `hilbertSymbol_eq_cohomological` at `MuTwo/LocalSymbol.lean:191`); the ownership sentences are refuted (R06). The cup-compatibility paragraph's two-step argument (`ι [(a,b)] = (a) ∪ (b)` and `ε (hasseInvariant q) = localHasse q`, hence `(a) ∪ (b) = 0 ⇔ (a,b)_K = +1`) is consistent with the sign row of the table below.

**Sources.** No sentence changed, so no new locator was opened; the sampled targets' locators were re-read in the cache this round at the lines the previous reports gave: Kahn 1984 (`kahn1984` line 55, Théorème 2: the transfer formula `w(T(q)) = N(w(q))·w(T(1))^r` with `r` the rank), Serre CMH 1984 (`serre1984cmh` lines 560–562, Théorème 1′: `w₂(Q_E) = … + (2)(d_E)`, with the remark that `d_E` and not `d(Q_E)` enters), Kozlowski 1984 (`kozlowski1984` lines 34–41, Theorem 1.1: the transfer for 2-coverings commutes with the total Stiefel–Whitney class). Kahn's Lemme II.2.1 (763–769) and Prop. II.3.5 (1044–1059) are carried from the previous reports. The manifest keys are `kahn1984`, `serre1984cmh`, `kozlowski1984`, `milnor1970`, `serre1973cia`, `serre1979lf`, `evens1963`, `guillot2010`, `omeara1963`, `scharlau1985`; no `needs-references.toml` was written.

**Library declarations opened at `2fd255d9` this round** (file under `TauCeti/`): `FieldTheory/QuadraticForm/StiefelWhitney/Evens/Kummer/Value.lean:182,220`; `StiefelWhitney/QuadraticExtension.lean:249`; `GaloisCohomology/MuTwo/CupNorm.lean:73,103,132`; `MuTwo/LocalSymbol.lean:191`; `MuTwo/Basic.lean:668`; `NumberTheory/LocalField/QuadraticForm/Classification.lean:132`; `Bimultiplicativity.lean:97`; `NumberTheory/HilbertSymbol/Basic.lean:47,102,147,251`; `NumberTheory/QuadraticForm/Global/ProductFormula.lean:36,67`; `NumberTheory/LocalField/SquareClass.lean:38`; `Algebra/Quaternion/BrauerClass.lean:173,212,255`; `Algebra/CrossedProduct/Splitting/Basic.lean:321`, `Comparison.lean:274`, `TwoTorsion.lean:19`; `Algebra/CentralSimple/FiniteGalois.lean:26`; `LinearAlgebra/QuadraticForm/Witt/Clifford.lean:142,187`, `Witt/Round.lean:20–22,44`, `Witt/Discriminant.lean:41`; `RegularFormClass/Discriminant.lean:321`, `RegularFormClass/Clifford.lean:644`; the rest of R07's names carried from the previous report. Absent at the pin, confirmed by `ls`: `LocalField/WorkedExamples/DyadicSqrt/NormControl.lean`, `RegularFormClass/Matrix.lean`; absent by `grep -rn` of the full names: the two `_of_mem_unitValueSet` names.

**Ownership.** The board's packages index lists `AnalyticNumberTheory`, `LawrenceVenkateshMethod` and `LogicAndDefinabilityInNumberTheory` only; none owns a quadratic-form object. The overlap leads list no dropped or revision-only id and no second owner; the one other open pull request touching this folder is the Tau Ceti bump #1187, which conflicts in `Suggested.lean` (a rebase of whichever merges second, no shared target). The closest open roadmaps by vocabulary (`QuadraticFormInvariantsPartII`, `GlobalQuadraticForms`, `OrthogonalSpinGroups`, the two `ProfiniteCohomology` revisions) consume this roadmap or supply it. Nothing changed in the folder, so no new object was searched for among the sibling checkouts.

**Adversarial table.** No statement changed since `6cec06f`, so every row carries the previous report's values (which carried them from `6dc200b`, `6cec06f` and `67b939d`); the probe row is this report's re-run.

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
| `galoisEvens2_kummerClass` (3723) | `a = 1 + t x`; ℚ₂, `d = −1`, `a = 1+2i` | `(2c)∪(−d) + (2)∪(d) = (c)∪(c) + (c)∪(d)`; `(2)∪(−1) = 0`; `(2)∪(5) ≠ 0` | holds; native `Value.lean:220` | previous report |
| Relative formula degree 2 (3792) | general `a`; `Tr a = 0` | rhs `(2)∪(d) + N((a)) + (d)∪(N a)` with `(d)∪(N a) = 0`; trace zero: `0 = (2)∪(d) + (2)∪(d)` | holds; native `QuadraticExtension.lean:249` | previous report |
| `cup11_comm` (1521) | bidegree `(1,1)`, `𝔽₂` | sign `(−1)^{1·1} = +1` | holds (about the opaque cup, R01) | previous report |
| `kummerCharacter` homomorphism (3400) | `g r = ±r`, `h r = ±r` | `rootSign(gh) = rootSign g + rootSign h` in all four cases | holds | previous report |
| Pin model (3116–3335) | `e₁ = diag(1,−1)`, `e₂` = swap | `e₁` lifts `diag(−1,1)`; `t² = 1`; `(e₁t)⁴ = −1` | holds | previous report |
| `galoisRes2_eq_zero_iff` (3083) | `L = K(√d)` | `ker(res) = (d) ∪ H¹(G_K)` | holds | previous report |
| README 2410 negative control | ℝ: `⟨1,1,1,1⟩`, `⟨−1,−1,−1,−1⟩` | `d = 1, 1`; `s = 1, (−1,−1)^6 = 1`; signatures `4, −4` | holds | previous report |
| Layer 0 rank-one boundary (235, 269) | `⟨1⟩`, `⟨4⟩` over ℚ | isometric by `x ↦ x/2` | holds | previous report |
| `exists_hilbertSymbol_eq_neg_one` | `a` a square | `(a,b) = 1` for all `b` | holds | previous report |
| `dyadicLevel_eq_absoluteRamificationIndex` (919) | `K = ℚ₂`; `K = ℚ₂(√2)`; `K = ℚ₃` | ℚ₂: `v_K(2) = 1 = e`; ℚ₂(√2): `v_K(2) = 2 = e`; ℚ₃ admits no `Algebra ℚ_[2] K` | holds | previous report |
| `pinE1_mul_pinT_pow_four` (3229) | `r2² = 2` | `pinT = r2⁻¹[[1,−1],[−1,−1]]`; `e₁·pinT = r2⁻¹[[1,−1],[1,1]]`; square `[[0,−1],[1,0]]`; fourth power `−I` | holds | previous report |
| README 2167 (6C alternative) | `L = K(s)`, `s² = a`; `a = c²` | multiplication matrix `[[x, ay],[y, x]]`, `det = N(x+ys)`; split case norm surjective, indicator `≡ +1`; index two under `IsCyclic (L ≃ₐ[K] L)` | holds | previous report |
| `hilbertSymbol_mul` (1233), `quaternionClass_*` (561–578), `hilbertSymbol_congr_sq/_neg_self/_comm` (1190–1210), probe | `[Invertible (2 : K)]`; `a b c : Kˣ` | each closes with the native term; `Invertible.ne_zero (2 : K)` supplies `(2 : K) ≠ 0` for `hilbertSymbol_mul_right`; copy: exit 0, 129 sorry warnings | hold, native at `2fd255d9` | this report (re-run) |

## Not verifiable

- T. Y. Lam, *Introduction to Quadratic Forms over Fields*; O. T. O'Meara, *Introduction to Quadratic Forms* (`omeara1963`); W. Scharlau, *Quadratic and Hermitian Forms* (`scharlau1985`); Gille–Szamuely, *Central Simple Algebras and Galois Cohomology*: no legal copy in the cache (AMS, Springer, CUP paywalls); the statements cited to them were checked by computation and against the pinned Tau Ceti files, as in the previous reports.
- J.-P. Serre, *A Course in Arithmetic* and *Local Fields* (`serre1973cia`, `serre1979lf`), J. Milnor 1970 (`milnor1970`): settled as uncertified, cited by locator.
- Ownership against open pull requests: checked through the brief's sibling checkouts by name, the overlap leads and the board's packages index; none is a quadratic-form-invariants roadmap (`GlobalQuadraticForms` and `IntegralLattices` are consumers; `QuadraticFormInvariantsPartII` consumes). Nothing changed in the folder, so no new object was searched for.

## Source issues

- none
