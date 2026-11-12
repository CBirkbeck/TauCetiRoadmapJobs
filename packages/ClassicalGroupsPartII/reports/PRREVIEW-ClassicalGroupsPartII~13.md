# Review of ClassicalGroupsPartII (pull request #1492 at a8badcd)

**Verdict:** accepted

Incremental re-review of 100 changed lines since 515c01e. The change is confined to `TauCetiRoadmap/ClassicalGroupsPartII/README.md`. It touches only library locators: 36 permalinks move from Tau Ceti a91d3aa / Mathlib 6b7abb3 to the pins of `lake-manifest.json` (Tau Ceti 2fd255d, Mathlib 1b1ccf4), 24 line numbers in the "From Tau Ceti" table change, and one file path changes. The word-level diff has no other change. The previous finding is repaired, the repair adds no problem, and the gate passes. No findings remain.

## Previous findings

- R01 — repaired: the table now reads, for example, “(`TauCeti/Algebra/AlgebraicGroup/Representation/PointsAction/Basic.lean`, lines 102, 120)” and “`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`, line 755”. All 43 Tau Ceti and 8 Mathlib permalinks carry the pinned hashes, and none of the former hashes remains.

## Verified sound

**The change (word-level diff 515c01e → a8badcd).** `git diff --word-diff` over the folder shows only two kinds of change: the commit hash inside 36 permalinks, and the parenthesised line numbers/path of 17 rows of the Tau Ceti table. `Suggested.lean`, `metadata.toml`, `lake-manifest.json` and `lean-toolchain` are unchanged. `git diff --stat origin/main...HEAD` outside the folder is empty (origin/main 4ec889e).

**Every moved locator, opened at Tau Ceti 2fd255d** (24 line numbers in 16 files plus the new path; each declaration starts on the line the README gives):
`JFin` 245 and `JFin_two_eq` 271, where the matrix is `!![0,0,−1,0; 0,0,0,−1; 1,0,0,0; 0,1,0,0]`, so the upper-right block is −I and the lower-left block is I, as the README says. `smoothCommHopfAlgProperty_of_charZero` 151 and `HopfAlgebra.isReduced_of_charZero` 169 (both `[Field k] [CharZero k]`, finite type). `isIso_kernelFppfQuotientHom` 194 and `kernelFppfQuotientIso` 204 (both still take `FaithfullyFlat` and `FinitePresentation`). `isColimitFppfQuotientCokernel` 68 (`I.IsNormal`). `IsCentralIsogeny` 78 (= `IsIsogeny` (finite ∧ faithfully flat) ∧ central kernel Hopf ideal). `reductiveCommHopfAlgProperty` 71. `ExactStructure.abelian` 124 (line 71 is the private `ConflationClass.abelian`). `ExactK0.fromSplitEquiv` 755, whose hypothesis is that every conflation has `Nonempty S.Splitting`. `corestrictStandardComodule` 190 and `standardCoact_apply_basisFun` 77. `basePointsRepresentation` 102 and `basePointsRepresentation_mem` 120 in `PointsAction/Basic.lean`; the former `PointsAction.lean` is absent at the pin. `stabilizerHopfIdeal` 193, `_eq_bot_iff` 238 and `_le_ker_iff` 278 (the A-points criterion is `(W.baseChange A).map (endOfPoint …) = W.baseChange A`). `diagonalTorusCoordinateMap` 189 and `diagonalTorus` 423 (`[CommRing R]`). `isMaximalTorus_diagonalTorusDefiningIdeal` 181 (`omit [IsAlgClosed k]`, so it holds over every field). `diagonalRootDatum` 260. `diagonalWreathProductMulEquivWeylGroup` 265. `diagonalNormalizerQuotientMulEquivWreathProduct` 273: the pin assumes `[CommRing k] [IsCancelMulZero k]` with a unit u ≠ u⁻¹, which is weaker than the README's "field", so the README's use is covered. The interface column still describes each of these statements correctly.

**Unchanged locators in the same table, re-read at the pin (all correct):** `Comodule.exteriorPower` 73, `Hom.exteriorPowerMap` 110, `baseChange_subtype_endOfPoint_ιMulti` 166; `GLSymplecticFin.diagonal` 95; the three Weyl elements 79, 422, 428; `repRing` 106; `HopfIdeal.IsMaximalTorus` 50; `isLinearlyReductive_iff_forall_nonempty_splitting` 123; `fgPointRepresentationCategoryEquivalence` 231; `diagonalRootBase` 225; `Abelian (FGComoduleCat R C)` (`Finite/Abelian.lean:68`); `Matrix.transpose_mul_J_mul_eq_det_smul` (`SymplecticMultiplier.lean:63`).

**Every permalink target at the pins (51 links, 25 distinct declaration/file pairs).** Each file exists and declares the named object:
- Tau Ceti: `FGComoduleCat`; `instMonoidalCategory` (`Monoidal.lean:161`); `instBraidedCategory` (`Symmetric.lean:81`); `hasBinaryBiproducts`; `SplitK0`, `SplitK0.of`; `of_mul_of`, `liftRingHom`, `mapRingHom`; the three `DiagonalizableGroup` weight declarations; `Comodule.baseChange`; `matrixCoefficientSubcoalgebra` and `_finite`; both `coordinateHopfAlgebra`s; `char_extPowerRep_diagonal`; `Comodule.Hom.ker` and `ker_finite`.
- Mathlib 1b1ccf4: `Matrix.GeneralLinearGroup` (`Defs.lean:43`, `[DecidableEq n] [Fintype n] [Semiring R]`); `MonoidAlgebra.domCongr` (`Basic.lean:301`); `LaurentPolynomial.T n := .single n 1` (`Laurent.lean:156`, with `T_zero` at 162 and `T_add` at 165); `MvPolynomial.esymmAlgEquiv` (`FundamentalTheorem.lean:341`, `[CommRing R]`, `Fintype.card σ = n`).

**Cross-roadmap citations on the changed *Needs* lines, re-resolved this round.**
- ReductiveGroups on main (4ec889e): the anchors for Layers 0, 1, 6 and 7 match its headings, and §10A and §10B are at lines 4089 and 4143.
- ClassicalGroups on main: the anchors for Layers 0, 1, 2 and 4 match. §3A.1, §3A.2 and §3A.3 are defined only at the head of the open ClassicalGroups revision (47ca68e, unchanged), whose anchors match. The description names that revision in its dependency and merge-order blocks.
- ArithmeticGaloisRepresentations at its head 00e8930: §7.3 "Similitude groups" names `SimilitudeGroup.GSp` and `SimilitudeGroup.multiplier`.
- PELModuli: head 697b514, unchanged since the previous review.
- The overlap list shows no other pull request changing this roadmap and no dropped id. Its six "only an open revision defines" entries are all the ClassicalGroups revision's §3A ids, which the description names. The five name leads of the citation list are names defined in ArithmeticGaloisRepresentations §7.3 and PELModuli, which are not library names.

**Gate, order, build, signatures and padding.**
- Gate re-run (`gate … ClassicalGroupsPartII --base origin/main`): every counter is 0 and the result is `OK`, exit 0. The worker's gate on this head also records `build=0`.
- Dependency check with `--movable`: `depcheck: 227 roadmaps, 2061 edges, 0 problem(s)`, exit 0. There is no UPWARD, CYCLE or `moved:` line. In the merge order, ArithmeticGaloisRepresentations is at line 58, PELModuli at 115 and ClassicalGroupsPartII at 201.
- `lake env lean TauCetiRoadmap/ClassicalGroupsPartII/Suggested.lean` exits 0. The only warnings are `declaration uses sorry` at lines 109, 130 and 136.
- `#check @name` on a scratch copy for the three theorems: `fullInvariantPresentation` is stated for every g; `mem_positiveSubring` and `positiveInvariantPresentation` carry `0 < g`. These match CG.2.4, CG.3.1 and CG.3.2. The worker's signatures for all 21 declarations show 0 lost binders.
- One-tactic probe on a scratch copy (`first | rfl | simp | infer_instance | trivial | decide | omega | aesop` in place of each `sorry`): lines 113, 132 and 140 all fail. There is no padding.
- Headlines: unchanged since the previous review. The three statable headlines are stated, and the docstring's account of the unstatable ones (no GSp coordinate Hopf algebra at the pins) still holds, since the pins have not moved.

**Declared gaps.** No gap text changed. The three slugs (`gap:generated-vector-base-change`, `gap:central-quotient-representations`, `gap:finite-comodule-category`) are untouched, and the pins are the ones at which the previous review found them precise and minimal.

**Sources and the seeded sample.** The changed lines are the *Needs* lines that close twelve "Consequences to check" blocks (CG.0.1, 0.5, 1.1, 1.4, 1.6, 1.7, 1.9, 2.1, 2.3, 2.4, 2.5, 3.2) plus the supplier table. Their changed words are library hashes and line numbers only, with no source locator, so the sample falls on them only through the library locators verified above. The previous review's verification of the sample in `yu`, `milne` and `sternberg` stands. As a spot check, `yu` line 3736 is the cone inequality (7.1.1) and line 3745 is Remarque 7.1.1, both on page 64, matching the README's `#page=64` link and the docstrings of `mem_positiveSubring` and `fullInvariantPresentation`.

**Adversarial table.** No statement changed. Rows marked "carried" are from the previous report (review at 515c01e, same pins). The headline and CG.2.3/CG.2.5 rows were recomputed this round with an exact integer script, and the `JFin` row was read at the pin.

| Statement (location) | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| `fullInvariantPresentation` (`Suggested.lean:109`; CG.2.4) | g=1,2,3 generators; T↦t | F_k at g=1,2,3 computed from ∏(1+(z_i+t/z_i)X+tX²): every monomial has cone value ≥0 (minimum 0); `LaurentPolynomial.T 1 = single 1 1` at the pin, so `C (T 1)`↦t is well-typed; carried: z²+(t/z)² = X₁²−2T, e₂ = F₂+t | True; retain |
| `mem_positiveSubring` (130; CG.3.1) | carried: g=2, all 125 weights in [−2,2]³; g=0 | carried: 0 mismatches between cone value ≥0 and the monoid ⟨e_i, e_t−e_i⟩; at g=0, t has cone value 1 but the generated ring is ℤ, so `0<g` is needed and present | True; retain |
| `positiveInvariantPresentation` (136; CG.3.2) | g=1,2,3 | minimum cone value over all monomials of all F_k = 0, and t has cone value 1, so the generators lie in the positive fixed ring | True; retain |
| `exteriorCharacter`, `fundamentalCharacter` (97–104; CG.2.3) and the CG.2.5 Check at README 1386 | g=1,2,3 | augmentations of F_k are [2], [4,5], [6,14,14], equal to C(2g,k)−C(2g,k−2); F₂ at g=2 = z₁z₂ + t + tz₁/z₂ + tz₂/z₁ + t²/(z₁z₂), so dim P₂ = 5, as the Check says | True; retain |
| Tau Ceti `JFin_two_eq` versus CG.0.1's "our pairing uses its negative" (README 207) | m=2 at the pin, line 271 | upper-right block [[−1,0],[0,−1]], lower-left [[1,0],[0,1]], so −`JFin 2` has upper-right I, matching Yu's ( 0 I ; −I 0 ) at `yu` line 3748 | True; retain |
| `flipWeight`, `permWeight`, `coneValue` Checks | carried | (−1,2)↦(1,−2)↦(−1,2); superadditivity in 2000 random pairs; h(0,1)+h(0,−1)=−1<0 | True; retain |
| CG.0.1–CG.0.6 conventions and Checks | carried | hJhᵀ=hᵀJh=3J; C²=s presentation both ways; d(e_t)=2; roots restrict to ±e_i±e_j, ±2e_i; diag(1,6) carries multiplier 6 | True; retain |
| CG.1.1–CG.1.5, §3A transport | carried | (z+t/z)² = Sym² + t; κ_(k+2)L_k−L_(k−2)κ_k=(g−k)id for g≤3; dim ker κ_k = 5, 14, 14; κ_nat=−κ | True; retain |
| CG.2.5, CG.3.4, PELModuli and §7.3 contracts | carried | weight multiplicities of ker κ_k = coefficients of F_k; d=4: (0,4)×1, (1,2)×3, (2,0)×2; −`Matrix.J` is this roadmap's J | True; retain |

**Remark on untouched text** (no change requested): “`Finite/Preadditive.lean`, lines 48–62” still covers the forget-functor instances, which are now at lines 49–53.

## Not verifiable

- The pull-request description was judged from the worker's quoted copy, not from the live page.
- Tau Ceti declarations were read in source at the pinned checkout. Their object files were not elaborated separately, because `Suggested.lean` imports only `Mathlib`.
- The source texts were not re-read in full, because no source locator changed. The single spot check in `yu` is recorded above.

## Source issues

- none
