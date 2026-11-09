# Review of IntegralLattices (pull request #1797 at 2654a44)

**Verdict:** needs changes

The IntegralLattices `README.md` and `Suggested.lean` at this head are byte-identical to main (`1bea835`).
- `git diff origin/main HEAD -- TauCetiRoadmap/IntegralLattices` lists only the generated `PROGRESS.md` and `STATUS.md`.
- Those two files equal the merge base `eaf17b1`, so they are inert in a merge.
- `git merge-tree origin/main HEAD` reports no conflict in this folder.

The folder appears in the diff only because the merge base is stale. Every defect below is therefore a defect of main's text.

#617 also revises this folder, and its head already repairs R01–R06; the lines are given in each finding. The one action this pull request needs is R09. R01–R08 are recorded so that whichever pull request carries the folder fixes them.

Pins: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`. Paths of native declarations are relative to the pinned Tau Ceti package.

## R01 (P2) — The module docstring says B2 and B3 are not statable, but Tau Ceti proves both at the pin

**Location.** `TauCetiRoadmap/IntegralLattices/Suggested.lean:75–79`: "the binary dictionary into `Pic 𝒪_Δ` and `NarrowPic 𝒪_Δ` (B2) and the ring class field … it carries no `NumberField` instance … and no ring class field exists at the pin."

**Claim.** All three missing carriers exist at the pin, and both headlines are already proved.

**Witness.**
- `TauCeti/NumberTheory/BinaryQuadraticForm/Ideal/PicEquivalence.lean:55`, `posDefProperClassEquivPic`:
  - its type is `PosDefProperClass n ≃ Pic (QuadraticOrder.numberFieldOrder (-n) hn)`;
  - it is built with `inferInstanceAs (NumberField (QuadraticAlgebra ℚ _ 0))`.
- `Ideal/Narrow/Equivalence.lean:106`, `properClassEquivNarrowPic`.
- `Ideal/RingClassField.lean:83`, `posDefProperClassEquivGal`, with values in `Gal(ringClassField …)`.

**Repair.**
- Delete the B2/B3 bullet from the docstring's "not statable" list.
- Say instead that B2 and B3 are proved in Tau Ceti, and name the three declarations.
- In the README, list them under §*From Tau Ceti* and state B2 and B3 as native, not as targets. Do not restate them in `Suggested.lean`: they would close in one term.

#617's head does this in its `Suggested.lean`, lines 124–125.

## R02 (P2) — Results and definitions that Tau Ceti already proves are stated as this roadmap's targets

**Location.**
- README milestones 1H, 1I, 1L, 2F, 2G, B1–B5, 4E, 4F, 5J (necessity), 6B, 6C, 6G, 6H, 7A, 7C, 7E (values), 7G and 9B.
- The README asserts these are not native in several places:
  - line 459: "Minkowski's second theorem is 2F below";
  - line 2190: "This milestone is owned here" (6G);
  - line 2451: the convergence of the 7C product "is the successor's".
- §*From Tau Ceti* (lines 419–453) names none of the declarations below.
- `Suggested.lean` restates several of them on Gram matrices, and copies three native definitions.

**Claim.** Each result has two owners. Per the duplication rule it must be cited, not restated.

**Witness.** The native declarations at the pin:

| Milestone | Native declaration (file:line) |
| --- | --- |
| 1H | `FiniteQuadraticModule.nonempty_isometry_iff_bilinear_isometry_and_gaussSign_eq` (`LinearAlgebra/FiniteBilinearModule/Comparison.lean:175`) |
| 1I | `IntegralLattice.gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg` (`LinearAlgebra/IntegralLattice/Milgram.lean:313`) |
| 1L | `IntegralLattice.vanDerBlij` (`…/Characteristic/VanDerBlij.lean:141`) |
| 2F | `IsPosDef.prod_successiveMinimum_mul_pi_pow_le` (`…/PosDef/Minkowski.lean:219`); squaring 2F gives exactly this |
| 2G | `exists_finset_forall_exists_gramMatrix_mem`, `finite_of_pairwise_isEmpty_isometry` (`…/PosDef/Classes.lean:52, 67`); `IsPosSemidef.exists_isMinkowskiReduced` (`…/PosDef/Reduction.lean:147`); `IsPosDef.finite_genusClasses` (`NumberTheory/IntegralLattice/ClassNumber.lean:173`) |
| B1 | `binaryNormForm`, `binaryContent`, `binaryDiscriminant` (`…/Binary/NormForm.lean:43, 173, 177`); `binaryNumberFieldOrder`, `binaryOrderEquivProductOfSq` (`…/Binary/Order.lean:106, 141`) |
| B2, B3 | the three declarations of R01; composition in `…/Ideal/Narrow/Composition.lean:131, 153` and `RingClassField.lean:117, 132` |
| B4 | `index_specialOrthogonalGroup_eq_two_iff_narrowPicClass_sq_eq_one`, `IsPosDef.index_specialOrthogonalGroup_eq_two_iff_picClass_sq_eq_one`, `picClass_two_one_three_sq_ne_one` (`…/Binary/Ambiguous.lean:55, 79, 100`) |
| 4E | `finite_genusClasses_of_finrank_eq_two` (`…/Binary/ClassNumber.lean:93`) |
| 4F | `infinite_isometry_of_isIndefinite` (`NumberTheory/IntegralLattice/IndefiniteIsometry.lean:171`) |
| 5J | `TwoElementaryAdmissible`, `TwoElementaryLatticeWithInvariants`, `TwoElementaryLatticeWithInvariants.twoElementaryAdmissible` (`LinearAlgebra/IntegralLattice/TwoElementary.lean:81, 285, 303`) |
| 6B | `exists_isEven_isUnimodular_isPosDef_iff` (`…/PosDef/EvenUnimodular.lean:163`) |
| 6C | `IsPosDef.nonempty_isometry_of_isUnimodular_of_finrank_le_nine`, `IsPosDef.nonempty_isometry_typeE₈RootLattice_of_isEven` (`…/PosDef/SmallRankUnimodular.lean:378, 407`) |
| 6G | `card_isometry_typeE₈RootLattice` (`…/RootLattice/TypeE/WeylGroup.lean:272`) |
| 6H | `nonempty_isometry_orthogonalSum_hyperbolicPlane_e8PowLattice` (`NumberTheory/IntegralLattice/Cancellation.lean:311`) |
| 7A, 7G | `mass`, `properMass`, `properMass_eq_two_mul_mass`, and the rank-0/1 values (`…/IntegralLattice/Mass.lean:91, 100, 154, 252–270`) |
| 7C | `Matrix.localDensityCount`, `localDensityCount_succ_of_dvd`, `localDensityCount_div_pow_of_det_ne_zero`, `tendsto_localDensityCount_div_of_card_eq_two_mul_add_one/_two` (`…/LocalDensity/Basic.lean:110, 508, 599, 711, 737`); the Euler products (`…/LocalDensity/EulerProduct.lean:109, 161`) |
| 7E | `orthogonalGroupMeasure`, `orthogonalGroupVolume_eq_prod`, `specialOrthogonalGroupVolume_eq_prod`, `two_mul_pi_rpow_mul_prod_Gamma_eq_two_pow_div_orthogonalGroupVolume` (`Geometry/Euclidean/Volume/OrthogonalGroup.lean:344, 446, 500, 516`) |
| 9B | `sum_inv_natCard_isometry_eq_mass_iff` (`…/IntegralLattice/Mass.lean:221`) |

**Repair.**
1. Move each row into §*From Tau Ceti*, with its name and file.
2. Narrow each milestone to what remains open at the pin:
   - 5J: the sufficiency half only.
   - 7E: the identification of the Riemannian measure with the native `orthogonalGroupMeasure`. The pin says "that comparison is not formalized here".
   - 7C: the dyadic part and the Conway–Sloane dictionary.
   - 6D: state it on the native `e8PowLattice 2` and `checkerboardPlusLattice (8 * 2) _`.
3. In `Suggested.lean`, delete the restatements:
   - the theorems `IsPosDef.volume_ball_mul_prod_sqrt_successiveMinimum_le`, `finite_classes_of_posDef`, `finite_genusClasses_rank_two`, `equivalent_one_of_odd_unimodular_posDef_of_le_eight`, `equivalent_one_or_e8_sum_one_of_unimodular_posDef_nine`, `gramIsometric_e8SumE8_sum_U_d16Plus_sum_U`, `localDensityCount_succ_eq`, `localDensityCount_eq_of_odd_of_not_dvd` and `isometric_mem_of_sum_eq_genusMass`;
   - the copies `localDensityCount`, `TwoElementaryAdmissible`, `TwoElementaryLatticeWithInvariants` and `IsGenusMass`;
   - the Archimedean value definitions `sphereArea` and `orthogonalSkewBasisVolume`.
4. Restate 5J as the sufficiency implication on the native `TauCeti.IntegralLattice.TwoElementaryAdmissible` and `TwoElementaryLatticeWithInvariants`.

#617's head carries none of the copies or restatements listed in item 3: each of those names occurs 0 times in its `Suggested.lean`.

## R03 (P3) — Seven sorried headlines close with one tactic from the pin

**Location.** These declarations in `TauCetiRoadmap/IntegralLattices/Suggested.lean`:
- `IntegralLattice.vanDerBlij` (line 111);
- `FiniteQuadraticModule.nonempty_isometry_iff_gaussSign_eq` (211);
- `milgram` (228);
- `infinite_isometry_of_isIndefinite` (357);
- `exists_isEven_isUnimodular_isPosDef_iff` (570);
- `nonempty_isometry_typeE₈RootLattice_of_isEven_of_finrank_eq_eight` (577);
- `natCard_isometry_typeE₈RootLattice` (688).

**Claim.** Each one is padding.

**Witness.** I ran a scratch copy with the seven native modules imported. It elaborates with 24 `sorry` warnings instead of 31 and no errors, using:
- `simpa [integralNorm_apply] using L.vanDerBlij hU hw`;
- `simp [nonempty_isometry_iff_bilinear_isometry_and_gaussSign_eq h₁, hb]`;
- `simp [gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg]`;
- `infinite_isometry_of_isIndefinite (by rwa [finrank_carrier]) hL`;
- `TauCeti.IntegralLattice.exists_isEven_isUnimodular_isPosDef_iff n`;
- `⟨(IsPosDef.nonempty_isometry_typeE₈RootLattice_of_isEven hp hu he (by rwa [finrank_carrier])).some.symm⟩`;
- `card_isometry_typeE₈RootLattice`.

The 1H hypothesis `h₂` is then unused.

**Repair.** Delete the seven declarations from `Suggested.lean`. The README cites the natives, as in R02.

## R04 (P3) — 3E's locator into Allcock–Gal–Mark points at the wrong theorem

**Location.** `TauCetiRoadmap/IntegralLattices/README.md:857`: "Allcock–Gal–Mark (Theorem 5.1 there, which proves the canonical symbol a complete invariant)".

**Claim.** Theorem 5.1 classifies unimodular lattices only.

**Witness.**
- `allcock-gal-mark2016` line 686: Theorem 5.1 is the unimodular classification by dimension, type, sign and oddity.
- Line 849: Theorem 6.2, on p. 20, is the equivalence of 2-adic symbols under sign walks.
- Line 917: Corollary 6.4, on p. 21, says canonical symbols are equal exactly for isometric lattices.

**Repair.** Cite Theorem 6.2 (p. 20) for the equivalence and Corollary 6.4 (p. 21) for the canonical form. Keep Theorem 5.1 (p. 16) for the unimodular constituents.

#617's head has this at README line 962.

## R05 (P3) — A 4G Check violates its own construction: 125 is not 0 mod 50

**Location.** `README.md:1745`: "`v = (11, 2)` has `β(v, v) = 125 ≡ 0 (mod 50)`".

**Claim.** The construction asks for `β(v, v) ≡ 0 (mod 2p²) = 50`, and this `v` does not satisfy it.

**Witness.** `125 = 2·50 + 25`. The construction's hypothesis is at line 1733.

**Repair.** Take `v = (1, 7)`. Then:
- `β(v, v) = 50 ≡ 0 (mod 50)`;
- `L_v = {a + 2b ≡ 0 (mod 5)}`, unchanged;
- `M = L_v + ℤ·(1/5, 7/5)` contains `(3/5, −4/5) = 3·(1/5, 7/5) − (0, 5)` and `(−4/5, −3/5) = −4·(1/5, 7/5) + (0, 5)`;
- `(11/5, 2/5) = (1/5, 7/5) + (2, −1) ∈ M`, so `M` is the same lattice.

I checked these values. #617's head rewrites this Check at its lines 2081–2083.

## R06 (P3) — A 3C Check gives a false reason: 3 and 12 are one square class

**Location.** `README.md:826–827`: "a splitting `⟨1⟩ ⊕ ⟨3⟩` would have determinant class `3 ≠ 3·4 = 12` and is wrong".

**Claim.** `12 = 3·2²`, so the two total determinants agree modulo squares. The conclusion is right, but the reason is false.

**Witness.** `12/3 = 4 = 2²`. What separates the two splittings is the scale-1 constituent: `⟨1⟩` against `⟨2⟩`, with `(1|3) = 1` and `(2|3) = −1`.

**Repair.** State that the total determinant classes agree. Then separate the splittings by the unit determinant of the scale-1 constituent, which is what 3C's invariants record.

#617's head has this at its lines 917–921.

## R07 (P3) — Native declarations are labelled as other roadmaps' suppliers

**Location.** The following names are cited as supplied by other roadmaps, but each is native at the pin:
- `hilbertSymbol_productFormula`, labelled "R Quadratic Form Invariants" (README lines 476, 898, 1027, 2229, 2319). Native: `TauCeti/NumberTheory/QuadraticForm/Global/ProductFormula.lean:67`.
- `hilbertProductFormula`, labelled R Class Field Theory (lines 480, 897, 1027). Native: `NumberTheory/ClassFieldTheory/Global/Hilbert/Reciprocity.lean:65`.
- `ringClassField` and `ringClassArtinMap`, labelled R Class Field Theory (lines 479, 1044, 1408). Native: `NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean:111` (`ringClassField`) and `:264` (`ringClassArtinMap`).
- `finite_narrowPic`, labelled R Global Number Fields (lines 478, 1276, 1410, 1664). Native: `…/Orders/NarrowPic/RayClass.lean:297`.
- `transvectionLiftHom`, labelled R Orthogonal and Spin Groups (line 482). Native: `LinearAlgebra/CliffordAlgebra/Spin/Transvection.lean:357`.
- B7's dependency row (line 1412) labels `RestrictedProductGroup`, `CompactOpenSubgroups`, `integralSubgroup`, `isCompact_integralSubgroup` and `rationalDiagonal` as R Restricted Products. Line 451 lists the same names as T. They are native at `Topology/Algebra/RestrictedProduct/Basic.lean:59, 94, 244, 260` and `Diagonal.lean:62`.

**Claim.** This is supplier drift: the prerequisite kind is wrong.

**Witness.** The declarations above, at the given lines of the pin.

**Repair.**
- Relabel these names as T, with their files.
- Keep an R row only for what is not at the pin: `hasseMinkowski_equivalent`, `equivalent_of_locallyEquivalent`, `gal_ringClassField_equiv_pic`, `picEquivUnitsIdealClassMonoid`, `orthogonalBaseChangeReal`, `spinorNorm_reflection`. For Class Field Theory's `gal_ringClassField_equiv_pic`, cite the native `ringClassArtinEquiv` (`Field.lean:178`) instead.

## R08 (P3) — Locators missing in Layer B; dangling labels; an unstated comparison

**Location.**
- These targets carry no source: B1 (`README.md:1053–1080`), B3's genus-as-coset and square-branch counts (1165–1229), B6 (1288–1295) and B7 (1310–1345).
- B8 (1394–1396) promises that "these values agree with the Conway–Sloane normalization that the successor's 7H uses in rank 2" but gives no statement.
- The References cite milestones "(5C)", "(5D)", "(5E)" and "(5H)" (lines 3036–3038). §*From Tau Ceti* lists "5D" as a consumer (line 426). None of these milestones exists in this README.

**Claim.** Each theorem needs a locator, and each promised comparison needs a target. The four labels dangle.

**Witness.** `grep -n '^\*\*5[A-J]\.'` lists only 5A, 5B, 5F, 5G, 5I and 5J.

**Repair.**
- Add a locator at each claim. Gauss's principal-genus theorem and the square-discriminant reduction are both textbook results; cite them uncertified, like Cox.
- Either state the B8 comparison as an equation with both sides named, or cut it.
- Drop the four labels, and say that Nikulin 1.13–1.14 belong to `IntegralLatticesPartII`.

## R09 (P3) — The folder enters this diff only through a stale base, and #617 and #1411 revise it

**Location.** The pull request description, which never mentions IntegralLattices. The commit `df89c5d` resets the folder to main's text.

**Claim.**
- The overlap check reports that #617 and #1411 conflict with this pull request in `TauCetiRoadmap/IntegralLattices/README.md` and `Suggested.lean`.
- No merge order is stated.
- Repairing R01–R08 here would duplicate #617's revision.

**Witness.**
- `roadmaps overlaps IntegralLattices` reports: "#617 and #1797 conflict in `TauCetiRoadmap/IntegralLattices/README.md`, `TauCetiRoadmap/IntegralLattices/Suggested.lean`".
- `git diff origin/main HEAD -- TauCetiRoadmap/IntegralLattices` shows only the generated files, at their merge-base contents.

**Repair.** Rebase this pull request onto main so that IntegralLattices leaves its diff. Then state in the description that #617 carries this folder's revision and merges independently. If the folder must stay, state that order instead, and make no edit that #617 already makes.

## Verified sound

**Gate.**
- The worker's gate at `2654a44` passes, every check 0.
- My rerun prints `outside-folder=54`, all of them in the brief's named folders. `git diff --stat origin/main...HEAD` outside those folders is empty.
- Dependency check: `depcheck: 236 roadmaps, 2286 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.

**Build.**
- `lake env lean …/Suggested.lean` exits 0 with 31 `sorry` warnings and nothing else.
- `#check @` of 36 declarations (every headline theorem and the definitions they use) elaborates with no error and no lost binder.
- Each signature matches its README statement in generality. 4F's `finrank ℚ V` equals the native `finrank ℤ L` by `finrank_carrier`.

**Statable headlines that remain genuinely open at the pin**, so not padding: 4B, 5A (the converse), the three 5B statements, 5G (both), 5J (sufficiency), 6A (both), 6D (non-isometry), 6E (both) and the 7E comparison.

**Not-statable claims that hold:**
- 3E/3G: there is no genus-symbol carrier.
- 4C: there is no ℚˣ-diagonal quotient carrier.

**Natives opened at the pin.** All the declarations in R01, R02, R03 and R07, plus `TauCeti.FiniteQuadraticModule.oddCyclic`, `dyadicCyclic`, `dyadicU` and `dyadicV`.
- Their docstrings give `b = θxy/m`, `q = θx²/2^{k+1}`, `q = x₁x₂/2^k` and `q = (x₁² + x₁x₂ + x₂²)/2^k`.
- These are the discriminant forms of `⟨θp^k⟩`, `⟨θ2^k⟩`, `2^k U` and `2^k !![2,1;1,2]`.
- So `realizationDet` gives the right square classes.

**Cross-roadmap citations resolved on main:**
- Global Number Fields Layer 11;
- Restricted Products Layers 1–3;
- Orthogonal and Spin Groups 0C, 2C, 2F, with `orthogonalBaseChangeReal`, `spinorNorm_reflection` and `transvectionLiftHom` in its `Suggested.lean`;
- Root Systems Layer 3 §3.1;
- DifferentialGeometry 12.1 and 12.4;
- Global Quadratic Forms 6.3, with `hasseMinkowski_equivalent` and `equivalent_of_locallyEquivalent`;
- Quadratic Form Invariants Layer 6D;
- Rank-24 lattice constructions Layers 3 and 6;
- Class Field Theory `gal_ringClassField_equiv_pic`.

The 17 "found nowhere" Lean names of the citations lead are all this roadmap's own `Suggested.lean` declarations.

**Sources checked at their locators:**
- `voight2023`: lines 230–231 (Definition 3.10), 245–247 (Lemma 3.12) and 251–262 (Proposition 3.13(iii), with `p² ∣ Q(v)`, which is `2p² ∣ β(v,v)` in the bilinear convention). This matches 4G.
- `boya-sudarshan-tilma2003`:
  - line 643 has (6.1), and lines 647 and 655 have (6.2) and (6.3): the normalization −Tr λ² = 2, which is the metric −tr(XY)/2;
  - line 659 has (6.4), with vol SO(2) = 2π;
  - line 669 has (6.5), the product for vol SO(n), on p. 17;
  - line 684 has (6.9), vol O(n) = 2·vol SO(n).
- `allcock-gal-mark2016`: lines 686, 849, 864 and 917, as in R04.

**Adversarial table** (values computed by hand, or by a scratch brute-force script where marked †):

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| B1 norm form, Δ | `!![4,1;1,6]` | `N = 4x²+2xy+6y²`, disc −92 = −4·23, `c = 2`, `f = (2,1,3)`, `Δ = −23 ≡ 1 (4)` | true | none |
| B1 split branch | `U` | `N = 2xy`, `c = 2`, `Δ = 1`; `(1+t)/2` idempotent, so `𝒪 ≅ ℤ×ℤ` | true | none |
| B1 content vs index | `⟨2e₁,e₂⟩ ≤ ℤ²` | `4x²+y²`: content 1, det ×4 | true | none |
| B2 sign clause | Δ = 12 | `𝔞_{(1,0,−3)} = 𝔞_{(−1,0,3)} = ℤ+√3ℤ`; `x²−3y² = −1` has no solution mod 3; the rotated form `(3,0,−1)` gives `√3𝒪`, N(√3) = −3, every unit of ℤ[√3] has norm +1 | true | none |
| B2 | Δ = −3 | reduced forms {(1,1,1)}† | true | none |
| B3 split genera | Δ = 25 | `5xy+cy²` takes values ≡ `c` mod 5; genera {1,4} and {2,3}; (ℤ/5)ˣ/{±1} has order 2 | true | none |
| B3 split torus | Δ = 64 | squares mod 8 = {1}: 4 genera; `t² = 1` on all of (ℤ/8)ˣ, so the quotient is trivial, while the {±1} version gives 2 | true | none |
| B3 ring class field | Δ = −23 | native `finrank_ringClassField_neg_twenty_three_eq_three` (`RingClassField.lean:200`) gives 3, and the brute-force h(−23) = 3† | true | R01 |
| B4 index | `!![4,1;1,6]` | \|O\| = 2, \|SO\| = 2†; (2,1,3) and (2,−1,3) are distinct reduced forms | true | none |
| B4 index | `U`, `A₂`, `I₂` | \|O\| = 4, 12, 8; \|SO\| = 2, 6, 4† | true | none |
| B4 Pell | x²−3y² | 2+√3 has norm 1 and infinite order | true | none |
| B5 reduced forms | Δ = −23, −20, −4 | 3, 2 and 1 forms†; split counts φ(5) = 4, φ(8) = 4 | true | none |
| B6 | x²+y², `U` | T(ℤ) = {±1,±i}, of order 4 = \|SO(I₂)\|†; for `U`, (a,b) ↦ ab is onto ℚ_pˣ | true | R08 (locator) |
| B7 | Δ = −4, 12, 1 | volumes 2π/4 = π/2 and log(2+√3) ≈ 1.317; ℤ̂ˣ × ℝ_{>0} has infinite volume; the modulus kernel has volume 1 | true | R08 (locator) |
| B8 mass | `A₂` | w = 6, h⁺ = 1, a = 1, m = 1/12 = 1/\|O(A₂)\|† | true | none |
| B8 mass | gen `!![4,1;1,6]` | h⁺ = 3, a = 1, h = 2; m = 1/4+1/2 = 3/4 = h⁺/(2w), while h/(2w) = 1/2; \|O(!![2,1;1,12])\| = 4† | true | none |
| 1G/1H dyadic | u(2), v(2) | Gauss sums 1+1+1−1 = 2 and 1−3 = −2, invariants 0 and 4; q₁(2) = 1/4 = 5/4 = q₅(2) | true | R03 |
| 1H odd | oddCyclic 3, θ = 1, 2 | 1+2e(2/3) = −i√3, so 6 ≡ −2; i√3, so 2 = −2+4 | true | R03 |
| 1I | ⟨2⟩, ⟨−2⟩ | 1±i = √2·e(±1/8): ±1 = t₊−t₋ | true | R03 |
| 1L | ⟨2⟩, ⟨1⟩ | every w is characteristic for ⟨2⟩, and 2w² is even ≢ 1; odd w² ≡ 1 | true | R03 |
| 2F | ⟨a⟩, 2ℤ⁵+ℤ𝟙, A₂, E₈ | 2√a = 2√a; det 256, λᵢ = 4, 168.4 ≤ 512; 6.28 ≤ 6.93; 64.9 ≤ 256 | true | R02 |
| 2G | rank 2, det 3 | reduced: [1,0;0,3], [2,±1;±1,2], so 2 classes | true | R02 |
| 4B | ⟨1⟩, gen `!![4,1;1,6]` | 1 point; 2 and 3 points = h and h⁺ | true | none |
| 4F | x²+y²−3z² | 3 \| x and 3 \| y forced, so anisotropic over ℚ | true | R03 |
| 4G | ℤ², p = 5 | 125 mod 50 = 25 ≠ 0; (1,7) gives 50 | false Check | R05 |
| 3C | A₂ at 3 | 12/3 = 4 = 2²; (1\|3) = 1 against (2\|3) = −1 | false reason | R06 |
| 5A | ⟨1⟩⊕⟨5⟩ vs !![2,1;1,3] | b-values {1/5, 4/5} against {3/5, 12/5 ≡ 2/5}; dual vector (3/5,−1/5) | true | none |
| 5B | (1,0,q₁⁽²⁾(2)), (1,0,q₁⁽³⁾(3)), (0,0,0) | all four conditions hold; sign 6 ≠ 1 (condition 1 fails); live clauses with empty product 1; ⟨2⟩/⟨10⟩ differ by 5 ∉ ℚ₂ˣ² | true | none |
| 5J | (0;4,0,0), (1;3,0,1), (1;4,0,2), (0;4,0,4) | each fails exactly condition 4, 5, 6, 7 respectively | true | R02 |
| 5G 1.12.4 → | S = ⟨2⟩^{t} | rank T ≥ l(A_S) = t, so l₊+l₋ ≥ 2t | true | none |
| 6D | `d16PlusGram` | det 1; leading minors 4, 8, …, 60, 1† (positive definite); A₁₅-chain variant 16·(4−15/16) = 49 | true | none |
| 6E | root counts | D₁₆E₈: 480+240 = 720 = E₈³; A₁₇E₇: 306+126 = 432 = D₁₀E₇² | true | none |
| 6G | \|O(E₈)\| | 240·126·23040 = 696729600 = 2¹⁴·3⁵·5²·7; half is 348364800 | true | R03 |
| 7C | U at 2; U at 3; I₂ at 3, 5; ⟨1⟩, ⟨2⟩ at 2 | 6, 16, 32 (α₂ = 4); 4, 12 (4/3); 8, 24 (8/3); 8 (8/5); stable 4 and 8† | true | R02 |
| 7E | SO(2), SO(3), O(1) | 2π; 2π·4π = 8π²; 2; sphereArea 1 = 2 | true | R02 (values native) |
| 9B | three Gram matrices of one lattice | 3·(1/4) = 3/4, but the class of `!![4,1;1,6]` is missed, so the pairwise hypothesis is needed | true | R02 |

**Ownership against open pull requests.**
- `OrthogonalTamagawaAndLatticeMass` (open head) cites §§2G, 4B, 6C, 6D and 7C here as their owner and claims none of them as its own.
- #1723 (LatticePackingsAndPerfectForms) was not given with files, so ownership against it was not checked.

## Not verifiable

None of the following can be read legally; I found no open-repository or author copy of any of them.
- Cox, *Primes of the form x² + ny²*:
  - the locators are Theorem 7.7 p. 137 (B2), Theorem 3.9 p. 50 (B4), and Theorems 2.8 p. 27 and 2.13 p. 29 (B5);
  - it is a Wiley book with no manifest key.
  - Tau Ceti's `PicEquivalence.lean` also cites Cox §7, Theorem 7.7, which corroborates the number but does not verify it.
- `cohen1993` §§5.2 and 5.6 (B2, B5): settled as uncertified, and paywalled.
- Cassels, *Introduction to the Geometry of Numbers*, Chapter VIII (2F), uncertified.
- `kawauchi-kojima1980` (1G): settled as uncertified.
- `conway-sloane-mass1988`: waived.
- Nikulin 1979, the Izv. translation (Layers 1 and 5): a paywalled journal.
- O'Meara, Serre, Milnor–Husemoller, Cho, Gan–Yu, van der Blij, Wall, SPLAG: commercial texts with no manifest key.

B1, B3 (genus and split counts), B6 and B7 cite no locator, so there was nothing to check (R08).

## Source issues

- **Error** in SPLAG (Conway–Sloane, *Sphere Packings, Lattices and Groups*, no manifest key) at Chapter 15, §7, the canonical 2-adic symbol:
  - The source says signs can be walked along an entire train, so that after leftward walking each train carries at most one sign.
  - It should be signways rather than trains: some compartments block sign walking. This is documented at `allcock-gal-mark2016` lines 919–924.
  - It affects a stated result.
