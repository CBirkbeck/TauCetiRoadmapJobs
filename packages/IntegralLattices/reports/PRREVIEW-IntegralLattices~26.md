# Review of IntegralLattices (pull request #1411 at 69323b7)

**Verdict:** needs changes

Pins: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`. Paths under `TauCeti/` are in the pinned package.

**The previous review (r22 at `a5227b0`), finding by finding.**

| r22 | Status at 69323b7 | Evidence |
| --- | --- | --- |
| R01 (P1) stale copy, conflict with main | Repaired in content, not in merge state | `git diff origin/main HEAD -- TauCetiRoadmap/IntegralLattices` is now the 88-line repair diff on `README.md` only; `Suggested.lean` is byte-identical to main's. `git merge-tree --write-tree origin/main HEAD` still reports "CONFLICT (content): Merge conflict in TauCetiRoadmap/IntegralLattices/README.md" (merge base `eaf17b1`). See R09. |
| R02 depcheck UPWARD/CYCLE | Repaired | My run: `depcheck: 237 roadmaps, 2307 edges, 0 problem(s)`. |
| R03 sorry-data, R04 sorry-examples, R05 imports, R06 prnum, R07 residue, R08 statement-hygiene | Repaired | My gate: every scanner 0 except `outside-folder`. |
| R09 `Completed/LocalGaloisGroups/Suggested.lean` | Not repaired | Still in `git diff --stat origin/main...HEAD` (2 lines); the gate now lists it under `outside-folder` (R08 below). |
| R10 other pull requests, no order for #1797 | Not repaired | The description's merge-order paragraph names #617, #1215, #1410, #1474 and not #1797; the folder now restates #617's edits (R09 below). |
| R11 ring-class-field contract | Repaired | README 450–451 and 1054–1059 cite `TauCeti.ClassFieldTheory.ringClassField`, `ringClassArtinMap`, `ringClassArtinEquiv` with `[Field K] [NumberField K]` and no degree hypothesis; at the pin `ClassFields/RingClass/Field.lean:92` has `variable {K : Type} [Field K] [NumberField K] (O : NumberFieldOrder K)`, and lines 111, 178, 264 define the three. |
| R12 3C Check | Repaired | README 827–830: "`3` and `12 = 3·2²` lie in one square class", constituents `1, 1` against `2, 2`, `(2|3) = −1`; recomputed below. |
| R13 3E oddity fusion | Repaired | README 871–877: `⟨1⟩ ⊕ ⟨14⟩ ≅ ⟨7⟩ ⊕ ⟨2⟩`; `allcock-gal-mark2016` line 760 (Lemma 5.2, p. 17–18) and line 864 (Theorem 6.3, p. 20) are where cited; recomputed below. |
| R14 3G Check | Repaired | README 912–917: `1_5^{−1} 3^{+1}` fails only the oddity formula. |
| R15 Theta Series contract | Repaired | README 60, 190–195, 485–488, 2617–2621, 2663, 3000, 3015 now say 6D only; Theta Series' README on main lines 97–106, 143 and 162 say the same. |

The repairs are right, but the full review below finds that most of what the folder states as targets is already proved at the pin.

## R01 (P2) — Seven headline theorems of `Suggested.lean` close in one term from the pin, and the rest of Layers 2, 4–7 and 9 restate pinned theorems

- **Location.** `TauCetiRoadmap/IntegralLattices/Suggested.lean`:111 `vanDerBlij`, 211 `nonempty_isometry_iff_gaussSign_eq`, 228 `milgram`, 357 `infinite_isometry_of_isIndefinite`, 570 `exists_isEven_isUnimodular_isPosDef_iff`, 577 `nonempty_isometry_typeE₈RootLattice_of_isEven_of_finrank_eq_eight`, 688 `natCard_isometry_typeE₈RootLattice`; then 271, 283, 342, 494, 514, 595, 639, 677, 700, 709, 724, 747–822, 846–860.
- **Claim.** The acceptance test states theorems that Tau Ceti proves at the pin. Seven are padding by the one-tactic probe; the others are the same statements by object on a Gram-matrix or coordinate carrier.
- **Witness, probe.** On a scratch copy of the file with the native modules imported (`lake env lean`, exit 0, the `sorry` warnings drop from 31 to 24), each of these closes by the single term named:
  - `vanDerBlij` by `simpa [integralNorm_apply] using TauCeti.IntegralLattice.vanDerBlij L hU hw` (`LinearAlgebra/IntegralLattice/Characteristic/VanDerBlij.lean:141`);
  - `milgram` by `rw [gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg L hL]; push_cast; ring` (`LinearAlgebra/IntegralLattice/Milgram.lean:313`);
  - `nonempty_isometry_iff_gaussSign_eq` from `nonempty_isometry_iff_bilinear_isometry_and_gaussSign_eq h₁` (`LinearAlgebra/FiniteBilinearModule/Comparison.lean:175`); its `h₂` is then unused, as Lean warns;
  - `infinite_isometry_of_isIndefinite` from the native theorem of the same name after `rw [← L.finrank_carrier] at hr` (`NumberTheory/IntegralLattice/IndefiniteIsometry.lean:171`);
  - `exists_isEven_isUnimodular_isPosDef_iff n` by the native theorem of the same name (`LinearAlgebra/IntegralLattice/PosDef/EvenUnimodular.lean:163`);
  - the E₈ uniqueness by `hp.nonempty_isometry_typeE₈RootLattice_of_isEven hu he _` (`LinearAlgebra/IntegralLattice/PosDef/SmallRankUnimodular.lean:407`);
  - `natCard_isometry_typeE₈RootLattice` by `card_isometry_typeE₈RootLattice` (`LinearAlgebra/IntegralLattice/RootLattice/TypeE/WeylGroup.lean:272`).
- **Witness, same statement at the pin** (the carrier differs, the content does not):
  - 2F line 271: `IsPosDef.prod_successiveMinimum_mul_pi_pow_le` (`PosDef/Minkowski.lean:219`) is `∏ λ_i · π^n ≤ 4^n Γ(n/2+1)² det L`, the square of the stated inequality with `vol(Bₙ) = π^{n/2}/Γ(n/2+1)`;
  - 2G line 283: `LinearMap.BilinForm.exists_finset_forall_exists_toMatrix_mem` (`LinearAlgebra/BilinearForm/FiniteClasses.lean:242`) is the finite set of Gram matrices of positive definite forms of rank `n` and determinant `≤ D`; `finite_of_pairwise_isEmpty_isometry` (`PosDef/Classes.lean:67`) is the class statement;
  - 4E line 342: `finite_genusClasses_of_finrank_eq_two` (`NumberTheory/IntegralLattice/Binary/ClassNumber.lean:93`), with no definiteness hypothesis;
  - 5J lines 494 and 514: `TwoElementaryAdmissible` (`LinearAlgebra/IntegralLattice/TwoElementary.lean:81`) and `TwoElementaryLatticeWithInvariants` (:285) are native, field for field, with the necessity half `TwoElementaryLatticeWithInvariants.twoElementaryAdmissible` (:303); the file redeclares both;
  - 6C lines 586 and 595: `IsPosDef.nonempty_isometry_of_isUnimodular_of_finrank_le_nine` (`SmallRankUnimodular.lean:378`): `Iₙ`, `E₈` or `I₁ ⊕ E₈`;
  - 6D line 639: `sameGenus_e8PowLattice_checkerboardPlusLattice` and `isEmpty_isometry_e8PowLattice_checkerboardPlusLattice` (`NumberTheory/IntegralLattice/EvenUnimodularGenus.lean:72, 82`), on `e8PowLattice 2` and `checkerboardPlusLattice 16`; `d16PlusGram` (610) is a second model of a native lattice;
  - 6H line 677: `nonempty_isometry_orthogonalSum_hyperbolicPlane_e8PowLattice` and `not_forall_nonempty_isometry_of_orthogonalSum` (`NumberTheory/IntegralLattice/Cancellation.lean:311, 344`);
  - 7C lines 700, 709, 724: `Matrix.localDensityCount` (`NumberTheory/IntegralLattice/LocalDensity/Basic.lean:110`); stabilization at every prime with `r₀ = 2 v_p(2 det A) + 1`, `localDensityCount_succ_of_dvd` (:508) and `localDensityCount_div_pow_of_det_ne_zero` (:599); the odd-prime values `tendsto_localDensityCount_div_of_card_eq_two_mul_add_one` (:711) and `…_two_mul_add_two` (:737), the latter with `ε = quadraticChar ((−1)^{m+1} det A)`; the `U` at 3 test (:762); the dyadic `U` count `2^{r+2}` (`LocalDensity/Dyadic.lean:139`);
  - 7E lines 747–822: `specialOrthogonalGroupVolume_eq_prod` (`Geometry/Euclidean/Volume/OrthogonalGroup.lean:500`), `∏_{j=2}^{n} 2π^{j/2}/Γ(j/2)`, and `orthogonalGroupVolume_eq_two_mul_specialOrthogonalGroupVolume` (:475), for the Euclidean measure `orthogonalGroupMeasure`;
  - 9B lines 846, 860: `sum_inv_natCard_isometry_eq_mass_iff` (`NumberTheory/IntegralLattice/Mass.lean:221`).
- **Repair.** Delete these declarations from `Suggested.lean` (the README keeps the statements as native rows, R02), and keep the file to what is not at the pin: 4B `exists_genusClasses_equiv_doubleCoset`, 5A, 5B (`padicDiscriminant`, the four conditions, both theorems), 5G, 5J's `exists_twoElementaryLattice_iff` restated on the native predicates, 6A (R10), 6E. Then re-run `#check @name` on what remains. This is the shape of #617's head (`roadmaps show IntegralLattices --pr 617 --file Suggested.lean`, docstring lines 53–100), which this folder should not diverge from (R09).

## R02 (P2) — The README states as targets milestones that are native at the pin, and attributes native results to other roadmaps

- **Location.** `TauCetiRoadmap/IntegralLattices/README.md`: 574–586 (1G), 620–625 (1H), 695–703 (2F), 718–723 (2G), 778–796 (3B), 815–819 (3C), 837–842 (3D), 880–885 (3F), 970–1010 (3I), 1109–1130 (B2), 1227 (B3), 1248–1260 (B4), 1289–1297 (B5), 1392–1396 (B8), 1456–1463 (N0), 1672–1681 (4E), 1735–1750 (4G), 2003 (5J), 2053–2055 (6B), 2066–2078 (6C), 2088–2098 (6D), 2194–2202 (6G), 2215–2220 (6H), 2388–2391 (7A), 2415–2430 and 2462–2465 (7C), 2486–2530 (7E), 2570–2578 (7G), 2667–2680 (9B).
- **Claim.** "Prove", "the targets", "this milestone asks for", "proved here", "owned here" and "is the successor's" are written for statements that `TauCeti` at `2fd255d` proves, and §*From Tau Ceti* has no row for them. The `*Needs:*` lines and the Dependencies tables then route an implementer into reproving the library.
- **Witness** (each opened at the pin; file under `TauCeti/`):
  - 1G: the relations are the isometries of `LinearAlgebra/FiniteBilinearModule/OddCyclic/Relations.lean`, `Dyadic/Relations.lean`, `Dyadic/SmallRelations.lean`, `Dyadic/UnequalExponents.lean`; the odd-prime classification is `nonempty_isometry_pi_oddCyclic_iff` (`OddCyclic/PiClassification.lean:267`).
  - 1H: `gaussSign_oddCyclic` (`OddCyclic/GaussSum.lean:255`) gives `k²(1 − p) + 2k(1 − (θ|p))`, which is the stated `k²(1 − p) + 4kη`; Theorem 1.11.3 is `nonempty_isometry_iff_bilinear_isometry_and_gaussSign_eq` (`Comparison.lean:175`).
  - 2F, 2G: as in R01, plus `IsMinkowskiReduced` and `IsPosSemidef.exists_isMinkowskiReduced` (`PosDef/Reduction.lean:80, 147`) and `IsPosDef.finite_genusClasses` (`NumberTheory/IntegralLattice/ClassNumber.lean:173`).
  - 3B: `IsSymm.exists_isJordanSplitting` and `IsJordanSplitting.finrank_eq_of_equivalent` (`LinearAlgebra/BilinearForm/JordanSplitting/Basic.lean:380, 490`), `IsJordanSplitting.isScaleEven_iff_of_equivalent` (`JordanSplitting/Parity.lean:112`), `exists_isJordanSplitting_localIntegralForm` (`NumberTheory/IntegralLattice/JordanSplitting.lean:68`).
  - 3C: `localIntegralForm_equivalent_iff_forall_equivalent_restrict` (`JordanSplitting.lean:92`). 3D: `localIntegralForm_two_equivalent_iff` (`Dyadic/Unimodular.lean:102`), the unimodular-at-2 classification by rank, parity, determinant square and oddity. 3F: `sameGenus_iff_localIntegralForm_equivalent_primeFactors` (`Genus.lean:216`), the finite test over `p ∣ 2 det L` after the determinant and signature.
  - 3I: `DyadicJordanProfile` with `IsBound`, `nM`, `nQ`, `densityExponent` and Cho's Lemma 5.1 `nQ_eq_nM_add_densityExponent` (`Dyadic/DensityExponent/Basic.lean:43, 253`); invariance `dyadicJordanProfile_eq_of_equivalent` (`DensityExponent/JordanSplitting.lean:140, 210`); sums `densityExponent_add` (`DensityExponent/Sum.lean:292`).
  - B1–B5, B8: `QuadraticOrder.numberFieldOrder` (`NumberTheory/QuadraticOrder/Field.lean:39`), `binaryNormForm`, `binaryDiscriminant`, `binaryOrder` (`Binary/NormForm.lean:43, 177`, `Binary/Order.lean:43`); B2's bijections `posDefProperClassEquivPic` (`BinaryQuadraticForm/Ideal/PicEquivalence.lean:55`) and the oriented `properClassEquivNarrowPic` with `[Fact (¬ IsSquare D)] (hpos : 0 < D)` (`Ideal/Narrow/Equivalence.lean:106`); B3's composite `posDefProperClassEquivGal` (`Ideal/RingClassField.lean:83`); B4's `specialOrthogonalGroupEquivNormOneUnits` (`Binary/NormOne.lean:72`), `card_specialOrthogonalGroup_of_binaryDiscriminant_neg` (:104) and `index_specialOrthogonalGroup_eq_two_iff_reflected` (`Binary/Isometry.lean:127`); B5's `exists_finset_forall_exists_binaryNormForm_mem` (`Binary/ClassNumber.lean:62`); B8's "rank-2 case of 7A, proved here" is `properMass_eq_two_mul_mass` (`Mass.lean:154`), stated for every positive rank.
  - N0: `localStabilizer_eq_integralOrthogonalSubgroup` (`Localization/Stabilizer.lean:119`). 4G: `IsNeighbor` with `.symm` (`LinearAlgebra/IntegralLattice/Neighbor/Basic.lean:54, 66`), `IsNeighbor.sameGenus` (`NumberTheory/IntegralLattice/Neighbor.lean:43`), `neighbor` and `isNeighbor_neighbor` (`Neighbor/Isotropic.lean:232, 367`).
  - 6B, 6C, 6D, 6G, 6H, 7A, 7C, 7E, 9B: as in R01; 7G's values are `mass_eq_one_of_finrank_eq_zero`, `mass_eq_inv_two_of_finrank_eq_one` and the proper versions (`Mass.lean:252–270`); the `E₈` mass that README 2843 and 3053 leave to "the successor's 7H" is `mass_typeE₈RootLattice` (`E8Genus.lean:65`).
  - 7C lines 2462–2465 say every statement about the convergence of the good-prime product is OTM's; `hasProd_inv_half_localDensity_of_card_eq_two_mul_add_one` and `…_two_mul_add_two` (`LocalDensity/EulerProduct.lean:109, 161`) prove the displayed `ζ^{(S)}` and `L(m, χ)` products at the pin.
- **Repair.** Add these declarations, with files, to §*From Tau Ceti*; rewrite each milestone above as "native (…)" keeping as targets only what is not at the pin: 1G's dyadic bilinear classification and the decomposition record; 3E and 3G; 3I's dictionary to the symbol; B6, B7; 4A's class sets as sets, 4B, 4C, N1's images at the bad primes; 5A, 5B, 5F, 5G, 5I, 5J's sufficiency; 6A, 6E, 6F; 7C's `[K_p : K_p⁺]` and the Conway–Sloane §12 dictionary. Relabel the Dependencies rows R → T where the supply is native, and drop "the successor's" from 7C's convergence paragraph and from the `E₈` mass. #617's head (`roadmaps show IntegralLattices --pr 617`, its README 471–502 and its milestone paragraphs) already has this text; see R09.

## R03 (P2) — The module docstring says B2 and B3 are not statable at the pin; both are proved there, and the README itself cites the ring class field

- **Location.** `TauCetiRoadmap/IntegralLattices/Suggested.lean:75–79`: "the quadratic algebra … carries no `NumberField` instance and the order `ℤ[(Δ+√Δ)/2]` is not a `NumberFieldOrder` of it …, and no ring class field exists at the pin."
- **Claim.** A false statement about the library, and a statable headline (B3's `Gal(H_{𝒪_Δ}/K_Δ) ≃ Pic 𝒪_Δ ≃ proper classes`) omitted on that ground. It contradicts README 450–451 and 1054–1056, which cite `TauCeti.ClassFieldTheory.ringClassField`.
- **Witness.** `QuadraticOrder.numberFieldOrder D hD : NumberFieldOrder (QuadraticAlgebra ℚ D 0)` under `[Fact (¬ IsSquare D)]` (`NumberTheory/QuadraticOrder/Field.lean:39`), with the `NumberField` instance `QuadraticAlgebra.instNumberField` it uses; `ringClassField` (`ClassFieldTheory/ClassFields/RingClass/Field.lean:111`); the composite `posDefProperClassEquivGal n hn : PosDefProperClass n ≃ Gal(ringClassField (numberFieldOrder (-n) hn) / QuadraticAlgebra ℚ (-n) 0)` (`BinaryQuadraticForm/Ideal/RingClassField.lean:83`).
- **Repair.** Delete the bullet. B2 and B3 are native (R02); the docstring's "proved in Tau Ceti" paragraph names `posDefProperClassEquivPic`, `properClassEquivNarrowPic` and `posDefProperClassEquivGal`.

## R04 (P3) — Three native theorems are cited as supplies of other roadmaps

- **Location.** README 477 and 480 (the 3G rows), 905 and 1038 (3G `*Needs:*` and its Dependencies row): "R Class Field Theory `hilbertProductFormula`; R Quadratic Form Invariants `hilbertSymbol_productFormula`"; README 479 and 1424: "R Global Number Fields … `finite_narrowPic`".
- **Witness.** `TauCeti.ClassFieldTheory.hilbertProductFormula` (`NumberTheory/ClassFieldTheory/Global/Hilbert/Reciprocity.lean:65`), `TauCeti.hilbertSymbol_productFormula` (`NumberTheory/QuadraticForm/Global/ProductFormula.lean:67`), `finite_narrowPic` (`NumberTheory/NumberField/Global/Orders/NarrowPic/RayClass.lean:297`, an instance, in a file the README's own row at 449 lists). The QFI file at this head re-exports the second (`TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:196` is a one-line wrapper of `TauCeti.hilbertSymbol_productFormula`).
- **Repair.** Move the three to §*From Tau Ceti* with these files and relabel the rows T; `picEquivUnitsIdealClassMonoid` stays an R row (it is Global Number Fields' `Suggested.lean:798`, not at the pin).

## R05 (P3) — The 3E locator names the unimodular theorem for the canonical-symbol statement

- **Location.** README 859–861: "the canonical form is the corrected one of Allcock–Gal–Mark (Theorem 5.1 there, which proves the canonical symbol a complete invariant)".
- **Witness.** `allcock-gal-mark2016` line 686: Theorem 5.1 (p. 16) characterizes a *unimodular* lattice by dimension, type, sign and oddity. The equivalence of 2-adic symbols under sign walks is Theorem 6.2 (line 849, p. 20), the uniqueness given the signs is Theorem 6.3 (line 864, p. 20), and the canonical form as a complete invariant is Corollary 6.4 (line 917, p. 21). The manifest's own locator for this key reads "Theorem 6.2, p. 20; Corollary 6.4, p. 21; Theorem 5.1, p. 16".
- **Repair.** Write "(Theorems 6.2 and 6.3, p. 20, and Corollary 6.4, p. 21, there; Theorem 5.1, p. 16, is the unimodular case)".

## R06 (P3) — 4G: the construction's hypothesis is too strong for an odd lattice, the Check's arithmetic is false, and one item is an algorithm

- **Location.** README 1745: "choose `v ∈ L` primitive with `β(v, v) ≡ 0 (mod 2p²)`"; 1757: "`v = (11, 2)` has `β(v, v) = 125 ≡ 0 (mod 50)`"; 1741: "a decidable check for one edge".
- **Claim.** `125 mod 50 = 25`. With the stated hypothesis the Check's `v` is not admissible, yet its neighbour is correct, because integrality of `L_v + ℤ(v/p)` needs only `p² ∣ β(v, v)`: `β(v/p, v/p) = 125/25 = 5` and `β(x, v/p) ∈ ℤ` for `x ∈ L_v`. The factor 2 is needed only to keep an even lattice even.
- **Witness.** `voight2023` line 261: Proposition 3.13(iii) asks `p² ∣ Q(v)` for Voight's integral quadratic form `Q`, whose bilinear form `T` has `T(v, v) = 2Q(v)`; the README's `β` is `T` only for even lattices. The native `neighbor` takes `(hv : (p : ℤ)^2 ∣ L.integralNorm v)` and `isEven_neighbor` adds `2 * p^2 ∣ …` (`LinearAlgebra/IntegralLattice/Neighbor/Isotropic.lean:232, 282`).
- **Repair.** State the construction with `p² ∣ β(v, v)`, and `2p² ∣ β(v, v)` for evenness only; write "`125 ≡ 0 (mod 25)`, and `M` is odd like `L`"; delete the decidable-check item (an executable procedure). The milestone is otherwise native (R02).

## R07 (P3) — 4B Check: `K₂⁺(⟨1⟩ ⊕ ⟨1⟩) = SO(V₂)`, so the clause "although `K_2⁺(L) ≠ SO(V_2)`" is false

- **Location.** README 1590–1591.
- **Witness.** `SO(V₂)` for `x² + y²` over `ℚ₂` is `{(a, b) : a² + b² = 1}`. If `v(a) = −k < 0` then `v(b) = −k` too, and `a' ² + b' ² = 4^k` with `a', b'` odd units; odd squares are `≡ 1 (mod 8)`, so the left side is `≡ 2 (mod 8)` while `4^k ≡ 0 (mod 4)`. Hence every element is `ℤ₂`-integral and stabilizes `ℤ₂²`. The N1 Check at 1507–1509 is consistent with this (it reads `H₂(L)` as the norm group of `ℚ₂(i)`).
- **Repair.** Drop the clause, or move the Check to a prime `p ≡ 1 (mod 4)`, where `SO(V_p) ≅ ℚ_pˣ` is not compact and `K_p⁺ ≠ SO(V_p)` holds.

## R08 (P3) — Gate `outside-folder`: `Completed/LocalGaloisGroups/Suggested.lean`

- **Location.** `git diff --stat origin/main...HEAD` outside the three folders the brief names: `Completed/LocalGaloisGroups/Suggested.lean | 4 ++--` (two `⟨…⟩` wrappings of `h2MuEquivZMod_mixed` and `h2FpEquivZMod_of_mu`).
- **Witness.** The worker's gate and mine both print `outside-folder` with this file and `FAIL`; mine lists `outside-folder=6`, the other five being the ClassFieldTheory and QuadraticFormInvariants files the brief names as the pull request's own. No acceptance is possible while the gate fails. (Carried from r22 R09; the description names the folder, the board does not.)
- **Repair.** Have the board record `Completed/LocalGaloisGroups` as a folder of this pull request, or move the two lines to a pull request of their own.

## R09 (P3) — Merge state: the branch still conflicts with main, restates #617's edits, and names no order with #1797

- **Location.** The pull request description's merge-order paragraph; `git merge-tree --write-tree origin/main HEAD`.
- **Witness.**
  - `git merge-tree` reports a content conflict in `TauCetiRoadmap/IntegralLattices/README.md`; the merge base is `eaf17b1`, before main's rewrite `47fc6a3`. Resolving toward this head is now safe (it is main's text plus the 88-line repair), but it is a manual step the description should name.
  - `roadmaps overlaps`: "#617 and #1411 conflict in … `IntegralLattices/README.md`, `Suggested.lean`" and "#1411 and #1797 conflict in … `IntegralLattices/README.md`". #1797's copy of this folder is main's text verbatim (3093 lines; `diff` against this head shows only this head's repair hunks). #617's head carries main's text with the same five repairs (its README 143, 919, 961, 970, 1386: the ring-class rows, 3C, the AGM theorems 6.2/6.3/6.4, 3G, `ringClassArtinEquiv`) and, beyond them, the native citations of R01–R04 (its README 471–502, 755, 1082, 1151, 1623–1629, 2016, 2270, 2498, 2646–2688; its `Suggested.lean` docstring 53–100).
  - The description names #617, #1215, #1410, #1474; not #1797.
- **Repair.** State which of #617 and this pull request carries the folder and that the other rebases onto it; the smaller change is to resolve this folder to #617's head, which already contains R01–R05's repairs, and to say so. Name #1797 in the order (it rebases onto whichever carries the folder). Say that the merge conflict with main on `README.md` is resolved toward the branch.

## R10 (P3) — The 6A headlines are stated on Gram matrices rather than on the native carrier

- **Location.** `Suggested.lean:536–568`, `equivalent_of_isEven_unimodular_indefinite` and `equivalent_of_odd_unimodular_indefinite`, with `∀ i, 2 ∣ G i i`, `G.det = 1 ∨ G.det = -1` and `sigPos`/`sigNeg` of a real form.
- **Witness.** README 224–247 makes `TauCeti.IntegralLattice` the canonical object and the abstract form "an input view, not a second carrier". `IsEven`, `IsUnimodular`, `IsIndefinite`, `signature` and `Isometry` exist at the pin (`LinearAlgebra/IntegralLattice/Even.lean`, `Unimodular.lean`, `Signature.lean`, `Isometry/Basic.lean`). After R01 these two are the only Gram-level headlines left.
- **Repair.** State both on `L : IntegralLattice V`, `M : IntegralLattice W` with the native predicates, `L.signature = M.signature`, and conclusion `Nonempty (L.Isometry M)`; keep the Gram form as a README remark.

## Verified sound

**Gate and build.**
- My gate (`gate … --base origin/main`): `outside-folder=6` (R08), every other scanner 0, `FAIL`.
- Dependency check: `depcheck: 237 roadmaps, 2307 edges, 0 problem(s)`; no UPWARD, no CYCLE, no `moved:` line (the roadmap is on main).
- `lake env lean …/Suggested.lean`: exit 0 in 14 s, 31 warnings, all `declaration uses 'sorry'`, no other diagnostic.
- Signatures: the worker's `#check @name` transcript covers all 66 declarations; I compared each with its README statement. `vanDerBlij` keeps `[FiniteDimensional ℚ V] [L.IsNondegenerate]`; `exists_primitiveEmbedding_iff` uses `lp - S.sigPos` only under `S.sigPos ≤ lp`; `localDensityCount_eq_of_odd_of_not_dvd` uses `n * (n − 1) / 2` and `Finset.Icc 1 (n/2 − 1)` only under `0 < n` (at `n = 2` the product is empty, as the README's `m − 1 = 0` requires); `soEuclideanMeasure` keeps its `ContMDiff` and injectivity binders. No binder is lost; nothing changed.
- No `set_option`, no sorried data, no `example`, no roadmap import, imports are `Mathlib` plus 21 `TauCeti.*` modules that exist at the pin.
- Padding probe: three scratch elaborations (exit 0 each); seven headlines close in one term (R01); the one-line attempt at 2G fails on a `PosDef` instance mismatch, so 2G is a duplication by object, not padding by this test; the other 17 sorries were not attempted with one tactic beyond `rfl`/`simp`-free reading, and none is a definition restatement or a Check.

**Seeded sample (B1–B8), each recomputed; Cox and Cohen are uncertified, so the locators are unchecked.**

| Target | Checked | Result |
| --- | --- | --- |
| B1 | `A₂`: `N = 2x² − 2xy + 2y²`, content 2, `f = x² − xy + y²`, `Δ = −3`, `disc N = 4 − 16 = −12 = −4·det`; `⟨2e₁, e₂⟩ ≤ ℤ²`: `4x² + y²`, content 1, index 2 | sound; native `binaryNormForm`, `binaryDiscriminant` (R02) |
| B2 | reduced forms `Δ = −3: (1,1,1)`; `−4: (1,0,1)`; `−12: (1,0,3)`; `−23: (1,1,6),(2,±1,3)`; `Δ = 12`: `x² − 3y² = −1` impossible mod 3, `𝔞_f = 𝒪₁₂` for both signs | sound; native `properClassEquivNarrowPic` carries `0 < D` and `¬ IsSquare D` as B2 says (R02) |
| B3 | split `m = 5`: genera `{1,4}`, `{2,3}`, torus quotient `(ℤ/5)ˣ/{±1}` of order 2; `m = 8`: every unit squares to 1, four genera of one class; composite for `Δ < 0` | sound; the composite is native `posDefProperClassEquivGal` (R03) |
| B4 | `|O|` by brute force: `!![4,1;1,6]` 2, `!![2,1;1,12]` 4, `A₂` 12, `I₂` 8, `U` 4; norm-4 vectors of `!![4,1;1,6]` are `±e₁` only; `h(−23) = 3` | sound; native `card_specialOrthogonalGroup_of_binaryDiscriminant_neg`, `index_…_iff_reflected` (R02) |
| B5 | counts above; `Δ = −44`: `(1,0,11), (3,±2,4)`, `h = 3`; split `φ(5) = 4` | sound |
| B6 | `T_L(ℤ)`: `{±1, ±i}` (4); `±(2+√3)^k`; `U`: `{±1}` | sound |
| B7 | volumes `2π/4 = π/2`, `log(2+√3) ≈ 1.317`; `U`: `ℚˣ\𝔸^{×,1} ≅ ℤ̂ˣ` of volume 1, `𝔸ˣ/ℚˣ` infinite | sound (the `ℤ̂ˣ/{±1}` slip of #617's text is not in this head) |
| B8 | `Δ = −23`: `w = 2`, `h⁺ = 3`, `a = 1`, `m = 1/4 + 1/2 = 3/4 = h⁺/(2w)` against `h/(2w) = 1/2`; `A₂`: `1/12` | sound; `m⁺ = 2m` is native (R02) |

**Adversarial pass** (values by hand and by a brute-force script in exact arithmetic).

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1G `l(A)` | `(ℤ/2)² ⊕ ℤ/3` | max over primes 2, sum 3 | pass | R02 (native) |
| 1G odd pairings | `b₁⊕b₁`, `b₂⊕b₂` on `(ℤ/3)²` | dets `1`, `4 ≡ 1`; `(2|3) = −1` | pass | R02 |
| 1H odd value | `oddCyclic 3 θ`: `q(1) = 2θ/3` | `θ=1`: `1 + 2e(2/3) = −i√3`, sign 6 `= −2`; `θ=2`: `i√3`, sign 2 `= −2 + 4` | pass | R02 (`gaussSign_oddCyclic`) |
| 1H metabolic converse | `q^{(5)}_θ(5)`, `(θ|5) = −1`: `q(x) = 3θx²/5` | sum `1 + 4cos 72° = √5`, sign 0; order 5 no square | pass | none |
| 1H Lagrangian for `q` | `A₁ ⊕ A₁` | `(1+i)² = 2i`, sign 2; `H = ⟨(1,1)⟩`, `q = 1/2` | pass | none |
| 1I | `⟨2⟩`, `⟨−2⟩`, `A₂` | `1 + i`: 1; `1 − i`: 7; `A₂`: 2 = 2 | pass | R01 (one `rw`) |
| 1L | `⟨1⟩`, `⟨2⟩`, `E₈`, `I₈` | `w² ≡ 1`; `2k²` even vs 1; `0 ≡ 8`; `8 ≡ 8` | pass | R01 (one term) |
| 2F | `A₂`, `E₈`, `2ℤ⁵ + ℤ𝟙` | `6.28 ≤ 6.93`; `64.9 ≤ 256`; det 256, `λ_i = 4`, `168.4 ≤ 512` | pass | R01/R02 (native, squared form) |
| 2G | rank 2, det 3; rank 1, `d ≤ 0`; indefinite `[0,1;1,2k]` | two classes; none; no bound | pass | R01/R02 |
| 3B/3E | `⟨1⟩⊕⟨3⟩ ≅ ⟨5⟩⊕⟨7⟩`: dets `3`, `35 ≡ 3`; oddities `4`, `12 ≡ 4` | pass | none |
| 3C | `A₂` at 3: basis `e₁, e₁ + 2e₂`, Gram `diag(2, 6)`; `12/3 = 4` square; constituents `2,2` vs `1,1` | pass | none |
| 3D/3E sign walking | `⟨1⟩⊕⟨4⟩`: `P = !![1,−4;1,1]`, `det 5`, Gram `diag(5,20)` | oddities `2 ≡ 10` | pass | none |
| 3E oddity fusion | `⟨1⟩⊕⟨14⟩`: basis `e₁+e₂, −14e₁+e₂`, Gram `diag(15, 210)`, `det P = 15` | `15 ≡ 7`, `105 ≡ 1`; compartment oddity `0 = 0` | pass | none; locator R05 |
| 3F | `⟨1⟩`, `⟨17⟩`; `⟨1⟩⊕⟨5⟩`, `!![2,1;1,3]` at 5 | dets `1 ≠ 17`; `⟨2⟩⊕⟨10⟩` (basis `e₁, e₁ − 2e₂`, `2 − 2 = 0`, `2 − 4 + 12 = 10`), `(2|5) = −1` | pass | R02 (native test) |
| 3G | `⟨3⟩`: `1_3^{−1} 3^{+1}`, `1 + 2 = 3`; `1_5^{−1} 3^{+1}`: `3 ≢ 5` | pass | none |
| 3I | `U`, `⟨1⟩`, `⟨2⟩`, `⟨1⟩⊕⟨2⟩` | `N = 2, 1, 2, 2`; counts mod `2^r`: `U` 16, 32 at `r = 2, 3` (`2^{r+2}`); `⟨1⟩` 4; `⟨2⟩` 8 | pass | R02 (native profile) |
| 4B | `⟨1⟩`; genus of `!![4,1;1,6]`; `⟨1⟩⊕⟨1⟩` at 2 | one point; 2 and 3 points; `a² + b² = 1` forces integrality | R07 | R07 |
| 4C | `⟨1⟩`; `x²+y²`; `Δ = 25` | `W/(W ∩ ℚˣJ²)` infinite; `[C_L:C_L²] = 1` vs order 2; `G[2]G² = {±1}`, both order 2 | pass | none |
| 4F | `x² + y² − 3z²` | `x² + y² = 3z²` forces `3 ∣ x, y` | pass | R01 (one term) |
| 4G | `v = (11, 2)`, `p = 5` | `125 mod 50 = 25`, `125 mod 25 = 0`; `M ∋ (3/5, −4/5), (−4/5, −3/5)` orthonormal | R06 | R06 |
| 5A | `E₈²`/`D₁₆⁺`; `I₈`/`E₈`; `!![2,1;1,3]` | `(16,0,0)` both; parity; dual generator `(3/5, −1/5)` of norm `3/5`, values `{2/5, 3/5}` vs `{1/5, 4/5}` | pass | none |
| 5B | `(1,0,q₁⁽²⁾(2))`; `(1,0,q₁⁽³⁾(3))`; `(0,0,0)` | signs `1 = 1`; `6 ≠ 1`; `0 = 0`, conditions 3, 4 live with `|A| = 1` | pass | none |
| 5B `padicDiscriminant` | `⟨2⟩`, `⟨10⟩` at 2 | one `q₂`, dets differ by 5, nonsquare | pass | none |
| 5G 1.12.4 | K3, `ρ ≤ 11` | `2ρ ≤ 22`, `1 ≤ 3`, `ρ − 1 ≤ 19` | pass | none |
| 5J boundary | `(0,4,0,0)`, `(1,3,0,1)`, `(1,4,0,2)`, `(0,4,0,4)` | each fails exactly clause 4, 5, 6, 7 | pass | R01 (native predicates) |
| 6A | `U` vs `⟨1⟩⊕⟨−1⟩`; `E₈²` vs `D₁₆⁺` | parity; definiteness | pass | R10 |
| 6B | `n = 0, 4, 8` | `0`; `D₄` det 4; `E₈` | pass | R01 |
| 6C | `I₈`/`E₈`; `E₈⊕I₁`/`I₉`; `D₁₂⁺` | parity; 2 vs 18 norm-1 vectors; no norm 1 | pass | R01 |
| 6D | `d16PlusGram` | symmetric, even, `det = 1`, leading minors `4, 8, …, 60, 1` (chain minors `2, 3, …, 15`, `D₁₅` block 4); `A₁₅` variant `det 49` | pass | R01 (native pair) |
| 6E | `D₁₆E₈` vs `E₈³` | `480 + 240 = 720 = 3·240` | pass | none |
| 6G | `240·126·23040` | `696729600 = 2¹⁴·3⁵·5²·7` | pass | R01 |
| 6H | ranks, dets, signatures | 18, `−1`, `(17,1)` | pass | R01 |
| 7A | rank 0, 1; `Δ = −23` | `(1,1)`, `(1/2, 1)`; `3/4`, `3/2` | pass | R02 |
| 7C | `U` at 3: counts 4, 12; `I₂` at 3: 8; `I₂` at 5: 8 | `4/3 = 2(1 − 1/3)`, `ε = (1|3)`; `8/3`, `ε = −1`; `8/5` | pass | R01/R02 |
| 7E | `sphereArea 1..4`; `SO(3)` | `2, 2π, 4π, 2π²`; `8π²` | pass | R01/R02 |
| 9B | `Δ = −23`; rank 0; three Gram matrices of one class | `1/4 + 1/2 = 3/4`; `1`; `3/4` missing a class | pass | R01 |
| 3C Check (R12) | as above | `3`, `12` one class; constituents separate | pass | none |

**Library declarations opened at the pin**, beyond those named in R01–R04: `IntegralLattice` (`LinearAlgebra/IntegralLattice/Basic.lean:63`, fields as displayed at README 232–238), `finrank_carrier` (:126); `integralNorm` (`Norm.lean:105`); `exists_isometry_prod_pi_generators` (`FiniteBilinearModule/Decomposition.lean:103`); `gaussSign_dyadicCyclic` (`Dyadic/GaussSum.lean:365`); `SameGenus` (`Genus.lean:77`) and `SameGenus.exists_isometry` (`ClassNumber.lean:133`); `genusClasses_typeE₈RootLattice` (`E8Genus.lean:42`); `span_vectorsOfNorm_two_lattice_of_ne` (`Rank24/Niemeier.lean:200`), `components_multiset_injective` (`Rank24/RootSystems.lean:216`), `vectorsOfNorm_two_leechLattice` (`Leech/Minimum.lean:189`), `map_span_vectorsOfNorm` (`PosDef/RepresentationNumber.lean:179`); the N0/N1 family `integralOrthogonalSubgroup_eq_closure_reflectionOrthogonal` (:250), `map_spinorNorm_comap_…` (:360), `localSpinorNormImage_eq_bot_of_finrank_le_one` (:99), `adelicSpinorNorm` (:75); `properClassEquivNarrowPic` with `(hpos : 0 < D)`; `specialOrthogonalGroupEquivNormOneUnits (hL : L.form ≠ 0)`; `specialOrthogonalGroupVolume` as the `orthogonalGroupMeasure` of the determinant-one set. No native theorem was found for 4B's double-coset bijection, 5A's even-genus criterion, 5B, 5G, 5J's sufficiency, 6A or 6E, so those remain targets. Mathlib: `AddCommGroup.primaryComponent`, `Group.rank` (`GroupTheory/Rank.lean:36`), `legendreSym` (`LegendreSymbol/Basic.lean:109`), `DoubleCoset.Quotient` (`GroupTheory/DoubleCoset.lean:79`), `Pell.Solution₁` (`NumberTheory/Pell.lean:95`), `Submodule.smithNormalFormOfRankEq`, `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`, `InnerProductSpace.volume_ball`, `ZLattice.covolume_eq_det`, `AddSubgroup.relIndex_eq_abs_det` all resolve.

**Cross-roadmap citations resolved.** Global Quadratic Forms (main): `hasseMinkowski_equivalent` (README 736), `equivalent_of_locallyEquivalent` (921). Global Number Fields (Completed): `picEquivUnitsIdealClassMonoid` (`Suggested.lean:798`). Orthogonal and Spin Groups (Completed): 0C (README 368), 2C (684), 2F (717), `spinorNorm_reflection` (`Suggested.lean:420`), `transvectionLiftHom` (904), `orthogonalBaseChangeReal` (1025), and its export clause to OTM (934). Root Systems §3.1 (README 687) and `RootPairing.weylGroup` (189). Restricted Products Layers 1–3 (README 268, 305, 361). Differential Geometry 12.1 and 12.4 (915, 923). `RepresentationTheory/LieGroups` exists on main. Rank-24 lattice constructions Layers 3 and 6 (223, 312). Theta Series as in the r22 table. OrthogonalTamagawaAndLatticeMass at its head: §§0.3, 1.1–1.4, 2.1–2.3, 3.1, 4.1, 4.2 exist (lines 185–634) and its contract (line 50) consumes §§0A–0E, 2C/2G, 3C/3E/3I, 5A, 4A–4C, N0–N1, 6C–6E, 6G, 7A/7C/7E/7G, B1–B4/B7/B8, 9B, all of which exist here. Class Field Theory and Quadratic Form Invariants at this head: `hilbertProductFormula`, `hilbertSymbol_productFormula` (R04).

**Overlaps and ownership.** No dropped id, no id defined only by an open revision. The closest roadmaps: Theta Series (read as above), OrthogonalTamagawaAndLatticeMass (contract read), LatticePackingsAndPerfectForms and GeometryOfNumbersAndQuadraticArithmetic (not reopened; this head adds no object to the folder). Two open pull requests, #617 and #1797, carry this folder (R09). Ownership against the 396 open roadmap pull requests without files was not checked beyond the overlap tool.

## Not verifiable

- Cox, *Primes of the form x² + ny²*, Theorems 2.8, 2.13, 3.9, 7.7 (B2, B4, B5): paywalled, not in the cache.
- Cohen, GTM 138, §§5.2, 5.6 (B2, B5, B7): uncertified in the manifest.
- Cassels, *Rational Quadratic Forms* (Layers 3, 4, B) and *An Introduction to the Geometry of Numbers* Chapter VIII (2F): not in the cache.
- Nikulin, Izv. 1979 / translation 1980 (Layers 1, 5): not in the cache; the numbering of Theorems 1.9.1, 1.10.1, 1.12.2, 1.12.4, 3.6.2 is unchecked.
- O'Meara, Serre, Milnor–Husemoller, Kawauchi–Kojima (uncertified), Wall, van der Blij, Cho, Gan–Yu, Kitaoka, Kneser, Ebeling, SPLAG: not in the cache. Conway–Sloane 1988 is waived.

## Source issues

- none
