# Review of QuadraticFormInvariants (pull request #1797 at 6cec06f)

**Verdict:** needs changes

Incremental re-review. The previous review read `67b939d`; between that head and `6cec06f` the folder `TauCetiRoadmap/QuadraticFormInvariants/` changed by 0 lines (`git diff --stat 67b939d 6cec06f -- TauCetiRoadmap/QuadraticFormInvariants` is empty; the only commit since is the GeometricTopology repair, which the brief names as the pull request's own). The folder is therefore byte-identical to what the previous review found, and every one of its eight findings stands: none is repaired, none introduced a new problem, and no new finding arises. Each is restated below with its witness re-checked at this head and at the pins (Tau Ceti `358314d`, Mathlib `f6090c7`, both read from `lake-manifest.json` and `.lake/packages/*`).

## R01 (P1) — Layers 7–9 are stated on another roadmap's sorry'd data, not on the pinned carriers

Location: `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` lines 2–4 (`import TauCetiRoadmap.ProfiniteCohomology.Suggested`, `import Completed.LocalFieldsRamification.Suggested`, `import TauCetiRoadmap.ClassFieldTheory.Suggested`), then `cup11` (1510), `kummerClass` (1560), `h2MuToUnits` (1585), `sw1`/`sw2` (2601/2606), `sw1Class`/`sw2Class` (2684/2690), `galoisEvens2` (2970), `galoisCor1` (2959), `f2CocycleClass` (3490), `kummerInd` (3545), and the two headlines `galoisEvens2_kummerClass` (3723) and `relativeStiefelWhitney_quadraticExtension` (3792).

Claim: the docstrings at 1501–1509 and 1557–1559 say the cohomological objects are "the supplier's" and "a real term, so the two cannot drift"; README 319–331 says the ProfiniteCohomology names consumed "are abbreviations of Tau Ceti's declarations of the same names or are proved by them".

Witness (re-read at this head): `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` on main has `cup` with body `sorry` (3865–3868), `f2Pairing := sorry` (5328–5330), `galoisF2Iso` sorry'd (5839–5848), `homClass` (5530), `cochainClass` (428), `inhomogeneousCochain2` (5141). So every statement here that mentions `cup11`, `kummerClass`, `sw2Class`, `galoisEvens2` or `galoisCor1` mentions sorry'd data through the import, and the gate records `imports=1`. The native carriers exist at the pin: `TauCeti.kummerClass` (`TauCeti/FieldTheory/GaloisCohomology/MuTwo/Basic.lean:353`), `TauCeti.h2MuToUnits` (`MuTwo/BrauerTorsion.lean:62`), `TauCeti.kummerClass_eq_homClass` (`MuTwo/KummerCharacter.lean:169`), `TauCeti.sw1Class`/`sw2Class` (`FieldTheory/QuadraticForm/StiefelWhitney/Class.lean:99,190`), `TauCeti.galoisEvens` (`FieldTheory/GaloisCohomology/EvensNorm.lean:60`), `TauCeti.sw1Class_traceTransfer_mk_rankOne` (`StiefelWhitney/Transfer.lean:137`).

Repair: imports become `import Mathlib` plus the `TauCeti.*` modules actually used; the three roadmap imports go. State the two headlines absent at the pin on the native carriers: the Evens-norm value `TauCeti.galoisEvens K L σ hdeg (TauCeti.kummerClass a) = cup (kummerClass t) (kummerClass (-(d * N a))) + cup (kummerClass 2) (kummerClass d)` for `Tr a = t ≠ 0` with the trace-zero case, the cup being `(TauCeti.trivialF2TopPairing (AbsoluteGaloisGroup K)).cup 1 1`; and the degree-2 relative formula on `TauCeti.sw2Class (RegularFormClass.traceTransfer K ⟦⟨1, fun _ => a⟩⟧)`. Delete the re-definitions of R02. Rewrite README 319–331 to say which supplier names are Tau Ceti's at the pin and which are prototypes.

## R02 (P2) — The file is an API catalogue of declarations that are proved at the pin

Location: `Suggested.lean`, 136 sorried declarations (the elaboration at this head prints 136 `declaration uses 'sorry'` warnings); representative lines in the previous report's list, unchanged here: Layer 5 `quaternionClass_symm/_sq/_mul/_congr/_one_sub` (561–596), `hasseInvariant_congr/_append/_smul` (613–636), `cliffordInvariant_eq` (777); Layer 6 `squareClass_finite` (971), the defect calculus (1069–1131), `hilbertSymbol_congr_sq … exists_hilbertSymbol_eq_neg_one` (1190–1302), `localHasse` and the 6D theorems (1182–1358), `serreEps`/`serreOmega`/`hilbertSymbol_padicTwo` (1377–1440); Layer 7 `kummerSquareClassEquiv` (1569), `resHUnits` (1619), `Br2` (1659), the two splitting-field theorems (1671, 1681), the whole crossed-product and `Inflation` block (1706–2345), `brauerCohomologyEquiv`/`brauer2EquivH2` (2353, 2358), the cup-norm block (2462–2571); Layers 8–9 `sw1 … brauer2EquivH2_hasseInvariant`, the transfer theorems (2896 ff.), the Pin model (3116–3295), `rootSign … galoisF2Iso_inv_kummerClass` (3395–3486).

Claim: the module docstring (39–50) presents the file as "target signatures"; the contract is headline theorems only, with what exists at the pin deleted and cited.

Witness (object → native declaration at the pin, file under `TauCeti/`): `Algebra/Quaternion/BrauerClass.lean:173,212,255` (`quaternionClass_comm`, `_sq`, `_mul`); `NumberTheory/HilbertSymbol/Basic.lean:46,101,146,228` (`hilbertSymbol`, `_neg_self`, `_congr_sq`, `_comm`); `NumberTheory/LocalField/QuadraticForm/Bimultiplicativity.lean:97` (`hilbertSymbol_mul_right`); `NumberTheory/LocalField/QuadraticForm/Classification.lean:129`; `MuTwo/CupNorm.lean:100`, `MuTwo/LocalSymbol.lean:185`; and the rest of the previous report's list. One-tactic probe on a scratch copy at this head: `quaternionClass_symm`, `quaternionClass_sq`, `quaternionClass_mul`, `hilbertSymbol_congr_sq`, `hilbertSymbol_neg_self`, `hilbertSymbol_comm`, `hilbertSymbol_mul` all close with one `exact` of the native declaration (`TauCeti.BrauerGroup.quaternionClass_comm a b`, `TauCeti.hilbertSymbol_mul_right (Invertible.ne_zero (2 : K)) a b c`, and so on): the copy elaborates with 129 sorry warnings and no error. The previous report's probe closed 26 of 28 the same way; the file is unchanged, so those results stand.

Repair: delete every declaration whose object exists at the pin, and the proved comparisons with it (`pinE1_eq_native` … `pinLift_eq_native`, 3337–3387). Keep, as reducible aliases proved from the native declarations and with no `sorry`, only what `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` on main consumes from this namespace (`RegularFormClass`, `formClass`, `wittRing`, `toWittRing`, `discr`, `signedDiscr`, `hilbertSymbol`, `hilbertSymbol_neg_self`, `hilbertSymbol_mul`, `hilbertSymbol_comm`, `exists_hilbertSymbol_eq_neg_one`, `localHasse`, `exists_of_realization`, `hilbertSymbol_eq_cohomological`; it unfolds `localHasse` and `hilbertSymbol` in proofs, so these two keep their bodies or GlobalQuadraticForms is edited in the same change). What is absent at the pin becomes a README target or a headline (R01).

## R03 (P2) — The second headline theorem is statable at the pin and absent

Location: README 19–23 name three high points; `Suggested.lean` states the first (410–416) and the third (3792); Layer 6D (README 2360–2365, "The classification") has no statement: 1315–1351 state realization, `u(K) = 4` and the quaternary uniqueness, not the classification.

Claim: "Two regular forms over `K` are isometric if and only if `(dim, d, s)` agree".

Witness: `TauCeti.RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq` at `TauCeti/NumberTheory/LocalField/QuadraticForm/Classification.lean:129`, re-opened at the pin; every carrier in it exists there.

Repair: state it in `Suggested.lean` (an `example` discharged by the native theorem, as the four-fold criterion is at 410–416), or, if the file is cut to the two absent headlines, name it in the module docstring as Tau Ceti's with the declaration.

## R04 (P2) — Sorry'd data and `set_option`

Location: `Suggested.lean` 822 `cliffordHomI2`, 864 `cliffordHomI2Bar`, 971 `instance squareClass_finite`, 1569 `kummerSquareClassEquiv`, 1619 `resHUnits`, 1835 `cocycleOfSplitting`, 1862–1866 `TwoCocycle.comap` (`isCocycle := sorry`), 2353 `brauerCohomologyEquiv`, 2358 `brauer2EquivH2`; 51 `set_option maxHeartbeats`/`synthInstance.maxHeartbeats … in` lines between 1981 and 2387. Gate at this head: `sorry-data=9 set_option=51`.

Claim: the docstrings (2347–2352, 2403–2407) call these "named definitions" that carry the normalisation.

Witness: a `def` with body `sorry` asserts nothing, so `brauerCohomologyEquiv_unique` (2393) is a statement about an unknown map; six of the nine have native bodies (R02: `MuTwo/Basic.lean:666`, `GaloisCohomology/UnitsRestriction.lean:62`, `CrossedProduct/Splitting/Basic.lean`, `Comap.lean`, `CrossedProduct/Comparison.lean:267`, `TwoTorsion.lean:152`); `grep cliffordHom` in the pinned tree is empty.

Repair: delete the six native ones with R02. For the `I² → Br(K)[2]` map state the mathematics as a theorem (`∃ c : ↥(fundamentalIdeal K ^ 2) →+ Additive (BrauerGroup K), (∀ a b, c ⟨pfisterClass ![a, b], _⟩ = Additive.ofMul (quaternionClass a b)) ∧ ∀ x, (x : WittRing K) ∈ fundamentalIdeal K ^ 3 → c x = 0`) and keep `cliffordHomI2Bar` as a README target. `squareClass_finite` follows from `TauCeti.card_squareClass` (`NumberTheory/LocalField/SquareClass.lean:83`) or is deleted. The `set_option` lines go with the `Inflation` section; any kept statement is restated to elaborate under the defaults.

## R05 (P3) — The pull request moves a process document into the README

Location: README 152–331 (the pull request's own change): "checked against Tau Ceti `cd83a3c6…` with Lean `4.36.0-rc1`" (155–157), reproduction instructions with the placeholder `/absolute/path/to/that/file.lean` (168–170), a 150-line Lean fence ending in two `#print axioms` lines (171–331). It joins 33–150 ("Audit status: incomplete. This roadmap remains active." at 35, TauCeti pull-request numbers at 128–131, commit hashes and links at 44–83, "The repository dependency pin remains `a91d3aa…`" at 147 while `lake-manifest.json` pins `358314d`) and 3618–3626 ("the private migration and provenance ledger"). `Suggested.lean` 403 and 1209 name "`gq2`'s B11a", a label defined nowhere.

Witness: the README rules (timeless; no process narrative, pull-request references, round labels or local paths; `#print axioms` never) and the stray-files rule. Nothing in 33–331 is a target, a Check or a supplier contract, and part of what it records about the pin is false (R06).

Repair: delete 33–331 and 3618–3626 and the two "B11a" phrases; the native-interface facts that survive at the pin go into the supplier contracts with pin-true paths (R06).

## R06 (P3) — Claims about the pin that are false at `358314d`, and ownership overclaims

Location and witness, each re-checked in the pinned tree at this head:

- Files cited as native that do not exist: `Algebra/BrauerGroup/ULift.lean`, `FieldTheory/GaloisCohomology/Congr.lean`, `Algebra/Algebra/ULift.lean`, `Algebra/CrossedProduct/ULift.lean`, `FieldTheory/Galois/AbsoluteGaloisGroup/Congr.lean`, `Algebra/CrossedProduct/FieldCongr.lean`, `NumberTheory/LocalField/WorkedExamples/DyadicSqrt/NormControl.lean` (README 44–83, 134–137), `NumberTheory/LocalField/QuadraticForm/Invariants.lean` with `localInvariantsEquiv` (118), `RegularFormClass/Matrix.lean` (117), `StiefelWhitney/QuadraticExtension.lean:249` (121; the only relative formula at the pin is degree 1, `StiefelWhitney/Transfer.lean:137`); `RegularFormClass/Hasse/Basic.lean` (117) is `Hasse.lean`. Declarations cited that exist nowhere: `brauerCohomologyEquiv_baseChange` (90), `ContinuousMulEquiv.continuousCohomologyIso` (44), `RingEquiv.unitsCoeffCongr` (61), `BrauerGroup.uliftEquiv` (73), `TauCeti.oneFoldPfister_smul_equivalent_of_mem_unitValueSet`/`twoFold…` (1603–1604; the pin's names are `oneFoldPfister_smul_equivalent_iff`, `twoFoldPfister_smul_equivalent_iff`, `Witt/Round.lean:44,61`). The worker's citation leads list five of these.
- Universe claims: "the audited native cup-norm theorem already preserves `K : Type u`" (999) and the "binds `K : Type u`" row (960): `MuTwo/CupNorm.lean:66` has `variable {K : Type}`; "`Class.lean` descends both `sw1Class` and `sw2Class` for `K : Type u`" (2870–2872): `StiefelWhitney/Class.lean:174` has `variable {K : Type}`.
- Ownership: "The Hilbert symbol is this roadmap's, in both halves" (2174) and "the comparison is the frozen declaration `hilbertSymbol_eq_cohomological`" (2180): `TauCeti.hilbertSymbol` (`HilbertSymbol/Basic.lean:46`) and `TauCeti.hilbertSymbol_eq_cohomological` (`MuTwo/LocalSymbol.lean:185`) are native. "This sublayer is the canonical owner of the Kummer-cup/norm-equation criterion" (2824): `MuTwo/CupNorm.lean:100`, and the README's own table at 960 lists it as native. "The Galois refinement `exists_finiteGalois_splittingField` is this roadmap's own" (2615–2626): `Algebra/CentralSimple/FiniteGalois.lean:51`, `FiniteSeparable.lean:45`.

Repair: every such sentence says "Tau Ceti's, consumed" with the pin-true file, or is deleted; the contract rows cite the pinned declarations by their exact names.

## R07 (P3) — Gate text rules

Location: at this head the gate prints `set_option=51 … tex=14 … sorry-data=9 sorry-examples=10 … imports=1 … readme-ids-missing=11 … FAIL`, the same line as at `67b939d`: `tex` at README 774, 1459, 1461, 1701, 2023, 2041, 2051, 2258, 2558, 3153–3154, 3294 (`^{…}`/`_{…}` outside code spans); `readme-ids-missing` for `discr_baseChange`, `signedDiscr_add`/`_mul`/`_mk_rankOne_mul`, `hilbertSymbol_mul_right`, `map_ker_reₗ_of_algEquiv`, `map_norm_unitFiltration_zero`, `finrank_adjoin_simple_eq_two_of_sq_mem_notMem`, `discr_one_elem_eq_of_sq_algebraMap`, `sw1Class_traceTransfer_mk_rankOne`, `brauerCohomologyEquiv_baseChange`; `sorry-examples` at `Suggested.lean` 1411, 1416, 1421, 1434, 1439, 2774, 2786, 2814, 2822, 3830; the module-system advisory on the header.

Witness: my gate run at this head (text rules) reproduces the worker's line; the worker's build step adds `build=12` advisories, 11 from the three supplier imports of R01. Ten of the eleven flagged identifiers exist at the pin under a namespace (`TauCeti.RegularFormClass.discr_baseChange`, `…signedDiscr_add/_mul/_mk_rankOne_mul`, `TauCeti.hilbertSymbol_mul_right` at `Bimultiplicativity.lean:97`, `TauCeti.QuaternionAlgebra.map_ker_reₗ_of_algEquiv`, `LocalFieldsRamification.map_norm_unitFiltration_zero`, `TauCeti.finrank_adjoin_simple_eq_two_of_sq_mem_notMem`, `TauCeti.Algebra.discr_one_elem_eq_of_sq_algebraMap`, `TauCeti.sw1Class_traceTransfer_mk_rankOne`); the eleventh does not exist (R06).

Repair: put the 14 displays in code spans; prefix the ten supplier names with their namespace and delete the eleventh; delete the ten admitted examples (their content is native, R02) or prove them; the header becomes `module` / `public import Mathlib` / `public import TauCeti.*`.

## R08 (P3) — Garbled text and README shape

Location: README 2167–2171 ("the classical part of6C and can precede6D without6E/7B", "The full6B defect", "Only after the classical6D") and 3486–3491 ("Layer 6 first consumes6A", "feed6D", "the direct6B tables"): sublayer labels fused to the preceding word, in a 200-word imperative sentence at 2167. The README has no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` or `## How to read the build` heading (grep count 0 at this head), no `*Needs:*` lines, no `### Examples`/`### Dependencies` per layer; it uses "Prerequisites:/Milestones:/Basic API:" blocks and a "Suggested homes" file tree (333–349).

Witness: the house shape in the brief and the roadmaps on main written in it (`TauCetiRoadmap/ClassFieldTheory/README.md`).

Repair: restore the spaces and rewrite 2167–2171 as prose targets with `*Needs:*` lines; move the README toward the house shape rather than away from it, as the fold-in of R05 does.

## Previous findings

- R01 — not repaired: `Suggested.lean` 2–4 still import the three roadmap modules; `cup11` (1510), `sw2Class` (2690), `galoisEvens2` (2970) and the two headlines (3723, 3792) still sit on `ProfiniteCohomology`'s sorry'd `cup`, `f2Pairing`, `galoisF2Iso`.
- R02 — not repaired: 136 sorried declarations; the seven probed at this head close with one `exact` of the native declaration (`BrauerClass.lean:173,212,255`, `HilbertSymbol/Basic.lean:101,146,228`, `Bimultiplicativity.lean:97`).
- R03 — not repaired: the classification by `(dim, d, s)` (README 2360–2365) has no statement in `Suggested.lean`; `Classification.lean:129` at the pin states it.
- R04 — not repaired: nine `def`/`instance` bodies are `sorry` (822, 864, 971, 1569, 1619, 1835, 1862, 2353, 2358); 51 `set_option … in` lines between 1981 and 2387.
- R05 — not repaired: README 35 "Audit status: incomplete. This roadmap remains active."; 155–157 the Tau Ceti commit and Lean version; 168–170 the absolute-path placeholder; 330–331 `#print axioms`.
- R06 — not repaired: README 2174 "The Hilbert symbol is this roadmap's, in both halves"; 2824 "This sublayer is the canonical owner of the Kummer-cup/norm-equation criterion"; the seven absent files and five absent declarations are still cited.
- R07 — not repaired: the gate line at this head is identical to the one at `67b939d` (`set_option=51 tex=14 sorry-data=9 sorry-examples=10 imports=1 readme-ids-missing=11 FAIL`).
- R08 — not repaired: README 2169–2171 "The full6B defect …", 3486 "Layer 6 first consumes6A"; no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build` headings.

## Verified sound

**The change.** `git diff --stat 67b939d 6cec06f -- TauCetiRoadmap/QuadraticFormInvariants` is empty; the only change in the pull request since the previous head is `TauCetiRoadmap/GeometricTopology/README.md` and `Suggested.lean`, a folder the brief names as the pull request's own with a review of its own. The diff outside the five owned folders against `origin/main` is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` and the generated `PROGRESS.md`, `STATUS.md`; the gate reports `stray-files=0`.

**Gate and dependency check.** `gate … QuadraticFormInvariants --base origin/main` at this head: `set_option=51 blob=0 latex=0 tex=14 prnum=0 sorry-data=9 sorry-examples=10 residue=0 private-paths=0 imports=1 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=11 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=50 source-material=0 FAIL`; the `outside-folder` lines are all in `TauCetiRoadmap/AlgebraicTopology` and `TauCetiRoadmap/GeometricTopology`, the pull request's own. `gate --depcheck … --movable`: `depcheck: 236 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line. The three suppliers (`ProfiniteCohomology`, `ClassFieldTheory`, `Completed/LocalFieldsRamification`) are on main; the roadmap is on main and not in the merge order (its Part II is), which is in order.

**Elaboration.** `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` from the worktree at this head: exit 0 in 45 s, 136 `declaration uses 'sorry'` warnings, no error and no other warning (the supplier oleans were already built by the worker's targeted build). The signature step is as in the previous report (the file is unchanged): the binders were compared with the README sentences by reading, and the probe re-elaborates every declaration.

**Padding probe at this head.** Scratch copy `Probe.lean` with seven sorries replaced by one `exact` each: `quaternionClass_symm` ← `TauCeti.BrauerGroup.quaternionClass_comm a b`; `quaternionClass_sq` ← `…quaternionClass_sq a b`; `quaternionClass_mul` ← `…quaternionClass_mul a b c`; `hilbertSymbol_congr_sq` ← `TauCeti.hilbertSymbol_congr_sq a a' b b' ha hb`; `hilbertSymbol_neg_self` ← `TauCeti.hilbertSymbol_neg_self a`; `hilbertSymbol_comm` ← `TauCeti.hilbertSymbol_comm a b`; `hilbertSymbol_mul` ← `TauCeti.hilbertSymbol_mul_right (Invertible.ne_zero (2 : K)) a b c`. Result: exit 0, 129 sorry warnings, no error. Seven of seven close.

**Seeded sample** (the passages are unchanged; each re-read at this head, the supplier files re-opened on main):

- "Audit status: incomplete. This roadmap remains active" (README 35): process text; its pin claims are the absent files of R06 and the pin at 147 is not the manifest's (`358314d`).
- "From the local-fields-ramification roadmap" (254–279): the 33 declarations of the contract table resolve in `Completed/LocalFieldsRamification/Suggested.lean` (lines 120–1148 as listed in the previous report); the `[Algebra ℚ_[2] K]` remark holds at 708, 737, 752.
- "From the class-field-theory roadmap" (281–317): all 18 names resolve in `TauCetiRoadmap/ClassFieldTheory/Suggested.lean` (`H` 630, `kummerClass` 922, `localSymbol` 1183, `tateDualityPairing` 1516, `hilbertProductFormula` 4396, `muNRepCoeffDictionary` 785, `absoluteGaloisGroupComparison` 668, among them); the worker's three "found nowhere" leads for CFT names are roadmap declarations, not library ones, so they are not defects. `localArtinMap_quadratic_eq_hilbertSymbol` (1851) is on `localSymbol`, so "CFT states no comparison with the norm-equation symbol" holds.
- "From the profinite-cohomology roadmap" (319–348): the 57 names resolve in `ProfiniteCohomology/Suggested.lean`; the "abbreviations of Tau Ceti's declarations" claim fails for `cup`, `f2Pairing`, `homClass`, `cochainClass`, `inhomogeneousCochain2`, `galoisF2Iso` (R01).
- "The Hilbert symbol is this roadmap's, in both halves" (2174) and "This sublayer is the canonical owner of the Kummer-cup/norm-equation criterion" (2824): refuted at the pin (R06); the mathematics of both halves is right (table).
- "Compatibility with the cup product" (2458–2464): `(a) ∪ (b) = 0 ↔ (a,b)_K = +1` is `MuTwo/CupNorm.lean:100`; `ε(hasseInvariant q) = localHasse q` is `LocalField/QuadraticForm/Brauer.lean:43`; the sign step is forced because `H²(G_K, 𝔽₂)` has two elements.

**Sources.** As in the previous report, re-opened for the sampled targets: Kahn 1984 (`kahn1984`), Théorème 2 (line 55, p. 224), Lemme II.2.1 (763–769, p. 241), Prop. II.3.5 (1044–1059, p. 249); Serre CMH 1984 (`serre1984cmh`), Théorème 1′ (560–562, p. 668) and `d(Q_{E,a}) = d_E·Na` (546); Kozlowski 1984 (`kozlowski1984`), Theorem 1.1 (34–41, p. 309).

**Library declarations opened at the pin** at this head (file under `TauCeti/`): `FieldTheory/GaloisCohomology/MuTwo/Basic.lean:353`, `MuTwo/BrauerTorsion.lean:62`, `MuTwo/KummerCharacter.lean:169`, `MuTwo/CupNorm.lean:66,100`, `MuTwo/LocalSymbol.lean:185`, `FieldTheory/QuadraticForm/StiefelWhitney/Class.lean:99,174,190`, `StiefelWhitney/Transfer.lean:137`, `FieldTheory/GaloisCohomology/EvensNorm.lean:60`, `NumberTheory/LocalField/QuadraticForm/Classification.lean:129`, `NumberTheory/HilbertSymbol/Basic.lean:46,101,146,228`, `NumberTheory/LocalField/QuadraticForm/Bimultiplicativity.lean:97,108`, `Algebra/Quaternion/BrauerClass.lean:173,212,255`; the absence of `Algebra/BrauerGroup/ULift.lean`, `FieldTheory/GaloisCohomology/Congr.lean`, `NumberTheory/LocalField/QuadraticForm/Invariants.lean`.

**Adversarial table.** Every statement is untouched by the diff, so each row carries the previous report's values (review at `67b939d`, same row), recomputed where marked.

| Statement | Instances | Values | Result | Source of row |
|---|---|---|---|---|
| `hasseInvariant_smul` (632) | general `n`; `n = 0, 1, 2` | `∏_{i<j}(λa_i,λa_j) = (λ,λ)^{C(n,2)}·(λ,∏_{i<j}a_ia_j)·s(q)`, `∏_{i<j}a_ia_j = d^{n−1}`, `(λ,λ) = (λ,−1)`; `n = 2`: `(λa,λb) = (λ,−1)(λ,ab)(a,b)` | holds | previous report, recomputed |
| `hasseInvariant_append` (622) | `⟨a⟩ ⊥ ⟨b⟩` | lhs `(a,b)`; rhs `1·1·(a,b)` | holds | previous report |
| `cliffordInvariant_eq` (777) | `⟨1,…,1⟩` over ℝ, `n = 1..8`; `n = 0, 1` | exponents `(0,0),(0,0),(1,1),(3,5),(6,15),(10,35),(15,70),(21,126)`; predicted `1,1,[ℍ],[ℍ],[ℍ],[ℍ],1,1`; actual `ℝ, M₂(ℝ), ℍ, M₂(ℍ), M₂(ℍ), M₄(ℍ), M₈(ℝ), M₁₆(ℝ)`; `n = 0,1` both exponents `0` | holds | previous report |
| `signedDiscr_mk` (483) | `⟨1,−1⟩` | `(−1)^1·(−1) = 1 = d±(ℍ)` | holds | previous report |
| `exists_of_realization` (1319) | `n = 1, s = −1`; `n = 2, d = [−1], s = −1`; `(2,[1],−1)` over ℚ₂ | first two excluded by `h₁`, `h₂`; `⟨−1,−1⟩`: `d = 1`, `s = (−1,−1)_{ℚ₂} = −1` | holds; native `Realization.lean:113` same exceptions | previous report |
| `localHasse_of_discr_neg_one` | `⟨a,−a⟩` | `(a,−a) = 1` by `−a = 0² − a·1²`; isotropic at `(1,1)` | holds | previous report |
| Serre's ℚ₂ formula (1396), `8×8` table (README 2293) | `(2,5)`, `(−1,−1)`, `(5,5)`, `(2,−1)`, `(−1,5)`, `(2,2)`, `(−1,2)` | `ε(1,3,5,7) = 0,1,0,1`, `ω = 0,1,1,0`; values `−1,−1,+1,+1,+1,+1,+1`; Gram matrix on `{−1,2,5}` = `[[1,0,0],[0,0,1],[0,1,0]]` | holds; matches README 2299–2306 | previous report, recomputed |
| Odd-residue formula (1276, README 2258) | `a = π^α u`, `b = π^β u'` | `(π,π)^{αβ}(π,u')^α(u,π)^β(u,u')`, `(u,u') = 1`, `(π,π) = (π,−1)` | holds; `α β : ℕ` narrower than Serre, covered by square-class invariance | previous report |
| Bimultiplicativity over a general field (README 2341) | `K = ℚ`, `a = −1`, `b = 3`, `c = 7` | `3, 7, 21` not sums of two rational squares | fails, as the README says | previous report |
| `defectExponent_unit` (1120) | ℚ₂: `u = 5, −1, 3`; `e = 0` | `5 − 1 = 4`: `δ = 2 = 2e`; `−1`, `3`: `δ = 1`; list `{2e} ∪ {2k+1 : k < e}`; `e = 0`: `δ = 0` | holds; native `Defect.lean:507` same list | previous report |
| `exists_sq_mul_eq_unramified` (1128) | `d` even | `δ(ac²) = d + 2v(c)`, `v(c) = e − d/2` | holds | previous report |
| `unitNorm_iff_integralBasis_families` (1150) | `z = X + Yω`; `K = ℚ₂(π)`, `π² = 2`, `a = 5` | `N = X² + TXY + NY²`; `(π+½)² − 5·¼ = 1 + π`, a unit; coordinates `(π+1, 1)` | holds | previous report |
| `card_squareClass_of_dyadic` (994) | ℚ₂; ℚ₂(√2) | `4·2¹ = 8`; `e = 2, q = 2`: `16 = 2^{2+2}` | holds; pin's version needs `[FinitePadicExtension K 2]` | previous report |
| `cup_kummerClass_eq_zero_iff` (2462), `hilbertSymbol_eq_cohomological` (2552) | `tr : ≃+ ZMod 2`; `a` a square | `tr` unique; `(a) = 0 ⇒ cup = 0 ⇒ b = 1² − a·0²`, symbol `+1` | holds; native `CupNorm.lean:100`, `LocalSymbol.lean:185` | previous report |
| 6E milestone 1 (1358) | `Q(K) = {1,[D]}`; ℚ | `ε` injective into `ℤˣ` iff `|Q(K)| ≤ 2`; false over ℚ | holds under the section's hypotheses | previous report |
| `brauer2EquivH2_cliffordInvariant` (2763) | `n = 3` | `w₂ + 1·((−1)∪d) + 1·((−1)∪(−1))` | holds | previous report |
| `sw_append` (2746) | `⟨a⟩ ⊥ ⟨b⟩` | lhs `(a)∪(b)`; rhs `0 + 0 + (a)∪(b)` | holds | previous report |
| `discr_traceTransfer` (2896) | `a = 1`; `a = x` (trace zero) | `Tr_*⟨1⟩ = ⟨2,2d⟩`, `d ≡ 4d`; `Tr(x(u+vx)²) = 4duv`, hyperbolic, `−1 ≡ −d²` | holds; Serre CMH line 546 | previous report |
| Kahn's basis (2867) | `Tr a ≠ 0` | `polar(1, x/a) = 0`; `q(x/a) = d·Tr a/N a`; `Tr a·d·Tr a/N a ≡ d·N a` | holds | previous report |
| `galoisEvens2_kummerClass` (3723) | `a ∈ Kˣ`; `a = 1 + t x`; ℚ₂, `d = −1`, `a = 1+2i` | `(2c)∪(−d) + (2)∪(d) = (c)∪(c) + (c)∪(d)`; `(2)∪(−1) = 0`; `(2)∪(5) ≠ 0` since `(2,5)_{ℚ₂} = −1`; `SD₁₆` candidate gives `0` | holds; `kahn1984` lines 764–765 | previous report, recomputed |
| Relative formula degree 2 (3792) | general `a`; `Tr a = 0` | rhs `(2)∪(d) + N((a)) + (d)∪(N a)` with `(d)∪(N a) = 0`; lhs `(Tr a)∪(−d·N a)`; trace zero: `0 = (2)∪(d) + (2)∪(d)` | holds; Kahn Prop. II.3.5, lines 1046–1059 | previous report |
| `cup11_comm` (1521) | bidegree `(1,1)`, `𝔽₂` | sign `(−1)^{1·1} = +1` in `𝔽₂` | holds (about the opaque cup, R01) | previous report |
| `kummerCharacter` homomorphism (3400) | `g r = ±r`, `h r = ±r` | `rootSign(gh) = rootSign g + rootSign h` in all four cases | holds | previous report |
| Pin model (3116–3335) | `e₁ = diag(1,−1)`, `e₂` = swap | `e₁` lifts `diag(−1,1)`; `t² = 1`; `(e₁t)⁴ = −1`; twisted boundary `(−1)^{c(ρg,ρh) + rootSign(√2,g)·coordC(ρh)}` | holds; matches README 3165–3244 | previous report |
| `galoisRes2_eq_zero_iff` (3083) | `L = K(√d)` | `ker(res) = (d) ∪ H¹(G_K)` | holds | previous report |
| README 2410 negative control | ℝ: `⟨1,1,1,1⟩`, `⟨−1,−1,−1,−1⟩` | `d = 1, 1`; `s = 1, (−1,−1)^6 = 1`; signatures `4, −4` | holds | previous report |
| Layer 0 rank-one boundary (235, 269) | `⟨1⟩`, `⟨4⟩` over ℚ | isometric by `x ↦ x/2`; no chain | holds | previous report |
| `exists_hilbertSymbol_eq_neg_one` | `a` a square | `(a,b) = 1` for all `b`, so `¬IsSquare a` is needed | holds | previous report |
| `hilbertSymbol_mul` (1235), probe at this head | `[Invertible (2 : K)]` in scope | native needs `(2 : K) ≠ 0`, supplied by `Invertible.ne_zero`; closes | holds, native | this report |
| `quaternionClass_symm/_sq/_mul` (563, 570, 578), probe | `a b c : Kˣ` | each closes with the native lemma of the same statement | hold, native | this report |

## Not verifiable

- T. Y. Lam, *Introduction to Quadratic Forms over Fields* (I.2.3, I.3.4, I.4.1–4.9, I.5.1–5.2, III.2.7, III.2.11, V.3.4, V.3.16–3.21, VII §1): no legal copy in the cache; AMS GSM is paywalled. The V.3.20 formula was checked by the ℝ computations in the table.
- O. T. O'Meara, *Introduction to Quadratic Forms* §63 and the 1955 paper: no legal copy (Springer/JSTOR paywalls); the statements were checked against the pin's `Defect.lean`, `UnramifiedClass.lean`, `Bimultiplicativity.lean`, `Realization.lean`, `Isotropy.lean`.
- J.-P. Serre, *A Course in Arithmetic* and *Local Fields* (`serre1973cia`, `serre1979lf`): settled as uncertified, cited by locator; the ℚ₂ formula and the IV §2 lists were checked by computation and against `PadicTwo.lean`, `Isotropy.lean`, `Realization.lean`.
- Gille–Szamuely, *Central Simple Algebras and Galois Cohomology* (1.1.9, 1.5.2, 4.4, 4.7): no legal copy relied on.
- Evens 1963, Milnor 1970 (`milnor1970`, uncertified), Guillot 2010: cited for background; not re-read for this round.
- Ownership against open pull requests: checked through the brief's listed sibling checkouts by name; none is a quadratic-form-invariants roadmap (`GlobalQuadraticForms` and `IntegralLattices` are consumers), and the board's packages index lists no other owner of these objects.

## Source issues

- none
