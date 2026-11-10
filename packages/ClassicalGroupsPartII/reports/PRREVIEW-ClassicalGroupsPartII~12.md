# Review of ClassicalGroupsPartII (pull request #1492 at 515c01e)

**Verdict:** needs changes

Incremental re-review of 0 changed lines in the folder since e211c63. The new head merges main, which moves the pins in `lake-manifest.json` from Tau Ceti a91d3aa / Mathlib 6b7abb3 to Tau Ceti 2fd255d / Mathlib 1b1ccf4 (Lean v4.36.0-rc2). The previous finding (the description) is repaired. The pin move makes one passage of the README wrong: the line and file locators of its Tau Ceti table. Nothing else needs to change.

## R01 (P3) — The Tau Ceti locators in the supplier table are those of the former pin

**Location.** `TauCetiRoadmap/ClassicalGroupsPartII/README.md:207–226` (table “From Tau Ceti”), for example line 220: “(`TauCeti/Algebra/AlgebraicGroup/Representation/PointsAction.lean`, lines 90, 108)”, and line 217: “`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`, line 625”.

**Claim.** Each parenthesis locates a declaration by file and line in the pinned Tau Ceti. At the pin this head carries (2fd255d), 24 of these line numbers in 16 files are off, and one file no longer exists. Every declaration still exists with the same statement; only the locators are wrong.

**Witness.** At 2fd255d, `TauCeti/Algebra/AlgebraicGroup/Representation/PointsAction.lean` is absent; `basePointsRepresentation` is at `…/Representation/PointsAction/Basic.lean:102` and `basePointsRepresentation_mem` at `:120`. `ExactK0.fromSplitEquiv` is at `Exact.lean:755`, not 625.

**Exact repair.** Replace the locators as follows (paths under `TauCeti/`; everything not listed is still correct):

| README line | Declaration | File | README says | At 2fd255d |
| --- | --- | --- | --- | --- |
| 207 | `JFin`, `JFin_two_eq` | `LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Basic.lean` | 243, 263 | 245, 271 |
| 211 | `smoothCommHopfAlgProperty_of_charZero`, `HopfAlgebra.isReduced_of_charZero` | `Algebra/AlgebraicGroup/Smooth/CharZero.lean` | 148, 166 | 151, 169 |
| 212 | `isIso_kernelFppfQuotientHom`, `kernelFppfQuotientIso` | `Algebra/AlgebraicGroup/Fppf/Quotient/Kernel.lean` | 166, 222 | 194, 204 |
| 213 | `isColimitFppfQuotientCokernel` | `Algebra/AlgebraicGroup/Fppf/Quotient/Cokernel.lean` | 66 | 68 |
| 214 | `IsCentralIsogeny` | `Algebra/AlgebraicGroup/Isogeny/Basic.lean` | 77 | 78 |
| 215 | `reductiveCommHopfAlgProperty` | `Algebra/AlgebraicGroup/Reductive/Basic.lean` | 70 | 71 |
| 217 | `ExactStructure.abelian` | `CategoryTheory/Exact/Abelian.lean` | 123 | 124 |
| 217 | `ExactK0.fromSplitEquiv` | `CategoryTheory/GrothendieckGroup/Exact.lean` | 625 | 755 |
| 219 | `corestrictStandardComodule`, `standardCoact_apply_basisFun` | `Algebra/AlgebraicGroup/GeneralLinear/StandardComodule.lean` | 187, 74 | 190, 77 |
| 220 | `basePointsRepresentation`, `basePointsRepresentation_mem` | `Algebra/AlgebraicGroup/Representation/PointsAction.lean` → `…/Representation/PointsAction/Basic.lean` | 90, 108 | 102, 120 |
| 221 | `stabilizerHopfIdeal`, `_eq_bot_iff`, `_le_ker_iff` | `Algebra/AlgebraicGroup/Representation/Stabilizer.lean` | 188, 233, 273 | 193, 238, 278 |
| 223 | `diagonalTorusCoordinateMap`, `diagonalTorus` | `Algebra/AlgebraicGroup/Symplectic/DiagonalTorus/Basic.lean` | 186, 406 | 189, 423 |
| 224 | `isMaximalTorus_diagonalTorusDefiningIdeal` | `…/Symplectic/DiagonalTorus/Maximal.lean` | 189 | 181 |
| 225 | `diagonalRootDatum` | `…/Symplectic/DiagonalTorus/RootDatum.lean` | 257 | 260 |
| 226 | `diagonalWreathProductMulEquivWeylGroup` | `…/Symplectic/DiagonalTorus/WeylGroup.lean` | 264 | 265 |
| 226 | `diagonalNormalizerQuotientMulEquivWreathProduct` | `LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Diagonal/WeylGroup.lean` | 250 | 273 |

The same table and four *Needs* lines carry 36 permalinks to the former commits (`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` for Tau Ceti, `6b7abb3c7686292736be2955bd3eb9ebf63b456a` for Mathlib). All 13 Tau Ceti files and 4 Mathlib files they name exist at the new pins with the named declarations, so replacing the two hashes by `2fd255d997f47c0b5d834ee416c7015d55444ce5` and `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` keeps every link valid and makes the README cite one pin throughout. A more durable alternative is to drop the line numbers and keep file plus declaration name, which is how lines 183–202 already cite.

Tested: each replacement was read at the pinned checkout, where the declaration starts on the line given in the last column.

## Previous findings

- R01 — repaired: the description now reads “Open suppliers: ArithmeticGaloisRepresentations (#856) §7.3; PELModuli (#966) §§M0.5–M0.8; the ClassicalGroups revision (#1192) §§3A.1–3A.3”, and its merge-order block names kim-em. The repair introduced no new problem.

## Verified sound

**The change.** `TauCetiRoadmap/ClassicalGroupsPartII/` is byte-identical to e211c63 (`README.md` 1704 lines, `Suggested.lean` 142 lines, `metadata.toml`). `git diff --stat origin/main...HEAD` outside the folder is empty; the files listed as changed since e211c63 are main's own, brought in by the merge. What the merge changes for this roadmap is the pins, so the checks below were made at the new ones.

**Gate, order, build, signatures and padding (all at 515c01e)**
- Gate re-run (`gate … ClassicalGroupsPartII --base origin/main`): every counter 0, `OK`. The worker's gate also records `build=0`.
- Dependency check with `--movable`: `depcheck: 227 roadmaps, 2109 edges, 0 problem(s)`, exit 0; no UPWARD, CYCLE or `moved:` line. Merge order: ArithmeticGaloisRepresentations line 58, PELModuli 115, ClassicalGroupsPartII 201.
- `lake env lean TauCetiRoadmap/ClassicalGroupsPartII/Suggested.lean` exits 0 at the new pins; the only warnings are `declaration uses sorry` at lines 109, 130 and 136.
- `#check @name` on a scratch copy for the three theorems, and the worker's elaborated signatures for all 21 declarations (0 lost binders; the file has no `variable` block): `fullInvariantPresentation` holds for every g; `mem_positiveSubring` and `positiveInvariantPresentation` carry `0 < g`. These match CG.2.4, CG.3.1 and CG.3.2. A proved scratch `example` still gives `flipWeight 0 (−1,2) = (1,−2)` at g=1. Nothing changed.
- One-tactic probe at the new pins (`first | rfl | simp | infer_instance | trivial | decide | omega | aesop` in place of each `sorry`): lines 113, 132 and 140 all fail. No padding.
- Headlines: the three statable ones are stated. The module docstring's claim that the others lack the GSp coordinate Hopf algebra is still true at the new pins: a search of Tau Ceti 2fd255d and Mathlib 1b1ccf4 for `Similitude|similitude|GSp|GeneralSymplectic` finds only `Mathlib/Topology/MetricSpace/Dilation.lean` (an unrelated use of the word).

**Library declarations opened at the new pin** (41 names)
- The 24 moved locators of R01 and these unchanged ones: `Comodule.exteriorPower`, `Hom.exteriorPowerMap`, `baseChange_subtype_endOfPoint_ιMulti` (`ExteriorAlgebra/Power.lean:73, 110, 166`); `GLSymplecticFin.diagonal` (:95); the three Weyl elements (`Weyl.lean:79, 422, 428`); `repRing` (:106); `HopfIdeal.IsMaximalTorus` (:50); `isLinearlyReductive_iff_forall_nonempty_splitting` (:123); `fgPointRepresentationCategoryEquivalence` (:231); `diagonalRootBase` (:225); `Abelian (FGComoduleCat R C)` (`Finite/Abelian.lean:68`); `Matrix.transpose_mul_J_mul_eq_det_smul` (`SymplecticMultiplier.lean:63`).
- Statements that moved were compared with the former pin: `isIso_kernelFppfQuotientHom` and `kernelFppfQuotientIso` still take `FaithfullyFlat` and `FinitePresentation`; `fromSplitEquiv` still takes `E.Conflation S → Nonempty S.Splitting` under `[Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C] [EssentiallySmall C]`; `JFin_two_eq` still has upper-right block −I.
- Names cited without lines also resolve: `SplitK0.of_mul_of`, `liftRingHom`, `mapRingHom` (`GrothendieckGroup/Monoidal/Basic.lean:132, 213, 272`); `FGComoduleCat.hasBinaryBiproducts`; `DiagonalizableGroup.weightSpace`, `isInternal_weightSpace`, `finite_setOf_weightSpace_ne_bot`; `Comodule.Hom.ker`, `ker_finite`; `matrixCoefficientSubcoalgebra_finite`; `char_extPowerRep_diagonal`; the two Lie highest-weight theorems of the Scope section; `FGComoduleCat.scalarExtensionFunctor` (`Finite/ScalarExtension/Basic.lean:54`).
- Mathlib 1b1ccf4: `MonoidAlgebra.domCongr` (`Algebra/MonoidAlgebra/Basic.lean:301`), `LaurentPolynomial.T n = single n 1` (`Algebra/Polynomial/Laurent.lean:156`), `MvPolynomial.esymmAlgEquiv` (`…/Symmetric/FundamentalTheorem.lean:341`).
- Remark on untouched text: “Native preadditivity … (`Finite/Preadditive.lean`, lines 48–62)” still covers the forget-functor additivity instances (now lines 49–53).

**Declared gaps at the new pin**
- The three slugs still match the README (lines 258, 278, 304), each with ReductiveGroups Layer 1 or 3 as supplier.
- None is provided by Tau Ceti 2fd255d: no least vector-generated subcomodule (no `sInf`, closure or generated-subcomodule declaration under `Algebra/Coalgebra`); no `EssentiallySmall`, `MonoidalPreadditive` or `CategoryTheory.Linear` instance on `FGComoduleCat`; no descent of representations along a central quotient. The new pin does add `FGComoduleCat.homModule` and `homLinearEquiv` (`Comodule/Finite/Basic.lean:132, 137`), the Hom module structure the finite-comodule-category gap builds on; the gap's four requirements remain open, so it is still minimal.
- ReductiveGroups on main (Layers 1 and 3) does not state any of the three either.

**Cross-roadmap citations re-resolved**
- ReductiveGroups on main: Layer 0, Layer 1, Layer 3, Layer 6 (characteristic-zero reductive ⇔ linearly reductive), Layer 7, Layer 7C (all-field rank-one charts), §10A “The rational category and actual torus lattice”, §10B “Induction, Weyl modules and simple heads”. The four README anchors into it match its headings.
- ClassicalGroups on main: Layers 0, 1, 2 and 4 at lines 175, 200, 216 and 272; anchors match. §§3A.1–3A.3 exist only at the head of the open ClassicalGroups revision (47ca68e, unchanged since the previous review), which the description names in its dependency and merge-order blocks, so the six ids of the overlap list are covered.
- ArithmeticGaloisRepresentations §7.3 and PELModuli §§M0.5–M0.8: both heads (00e8930, 697b514) are the ones the previous review read; its resolution stands. The five name leads of the citation list are these roadmaps' names.
- The overlap list shows no other pull request changing this roadmap and no dropped id. The merge-order chain's pull requests are by CBirkbeck and kim-em only, as the description says.

**Sources.** No passage changed, so the seeded sample falls in none; the previous review verified every locator of the sample in the cached texts (`yu`, `milne`, `sternberg`), and that record stands. The README flags no locator as unverified.

**Adversarial table.** No statement changed. Rows 2–6 and the rows for CG.0.1–CG.3.4 are carried from the previous report (review at e211c63, same table); the three headline rows were recomputed this round with an exact integer script on the weight lattice, because the pins under them moved.

| Statement (location) | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| `fullInvariantPresentation` (`Suggested.lean:109`; CG.2.4) | g=1: z²+(t/z)²; g=2: e₂(x); g=1,2,3 invariance | z²+(t/z)² = X₁²−2T exactly; e₂(x) = F₂+t, i.e. X₂−T; every F_k fixed by every flip. `LaurentPolynomial.T 1 = single 1 1` at the new pin, so T↦t | True; retain |
| `mem_positiveSubring` (130; CG.3.1) | g=2, all 125 weights in [−2,2]³; g=0 | cone value ≥0 versus membership in the monoid ⟨e_i, e_t−e_i⟩: 0 mismatches; t⁻¹ has cone value −1; at g=0 t has cone value 1 but the generated ring is ℤ | True; `0<g` needed and present; retain |
| `positiveInvariantPresentation` (136; CG.3.2) | g=1,2,3 generators | every monomial of every F_k has cone value ≥0, and t has cone value 1, so the generators lie in the positive fixed ring | True; retain |
| `exteriorCharacter`, `fundamentalCharacter` (97–104; CG.2.3) | g=1,2,3 | augmentations of F_k: [2], [4,5], [6,14,14] = binom(2g,k)−binom(2g,k−2); F₂ at g=2 has the five monomials z₁z₂, t, tz₁/z₂, tz₂/z₁, t²/(z₁z₂) | True; retain |
| `flipWeight`, `permWeight`, `coneValue` Checks | carried: previous report, rows 5–6 | (−1,2)↦(1,−2)↦(−1,2); superadditivity in 2000 random pairs; h(0,1)+h(0,−1)=−1<0 | True; retain |
| CG.0.1–CG.0.6 conventions and Checks | carried: previous report, rows 7–12 | hJhᵀ=hᵀJh=3J; C²=s presentation both ways; d(e_t)=2; roots restrict to ±e_i±e_j, ±2e_i; diag(1,6) carries multiplier 6 | True; retain |
| CG.1.1–CG.1.5, §3A transport | carried: previous report, rows 13–18 | (z+t/z)² = Sym² + t; κ_(k+2)L_k−L_(k−2)κ_k=(g−k)id for g≤3; dim ker κ_k = 5, 14, 14; κ_nat=−κ | True; retain |
| CG.2.5, CG.3.4, PELModuli and §7.3 contracts | carried: previous report, rows 19–21 | weight multiplicities of ker κ_k = coefficients of F_k; d=4: (0,4)×1, (1,2)×3, (2,0)×2; −`Matrix.J` is this roadmap's J | True; retain |

## Not verifiable

- The pull-request description was judged from the worker's quoted copy, not from the live page.
- The cited Tau Ceti declarations were read in source at the pinned checkout; their object files were not elaborated separately (`Suggested.lean` imports only `Mathlib`).
- The source texts were not re-read this round: no README passage changed.

## Source issues

- none
