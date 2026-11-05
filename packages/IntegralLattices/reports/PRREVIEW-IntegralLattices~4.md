# Review of IntegralLattices (pull request #1239 at acc5d58)

**Verdict:** needs changes

Full re-review of the repaired head. The gate passes, the dependency check reports no problem, `Suggested.lean` elaborates with 24 `sorry` warnings and nothing else, and the six findings of the previous review are repaired (table under *Verified sound*). Two blocking findings remain: statable headlines that the module docstring declares unstatable or omits, and one milestone sentence in N1 that drops the rank hypothesis its own Check refutes. Two P3 findings cover locators and the form of 7E.

## R01 (P2) — Statable headlines absent; the docstring misclassifies 6D and 6H

**Location:** `TauCetiRoadmap/IntegralLattices/Suggested.lean:59–61` ("the pinned Tau Ceti has `D₈⁺` but no `D₁₆⁺`, whose construction needs the isotropy of its spinor class as a proof inside the definition"), and the headline list at lines 36–48, which names neither the odd-prime value of 7C, nor 5A, nor 4F.

**Claim:** the rank-16 pair (6D) and the failure of cancellation (6H) are not statable at the pins; the stated headlines are the statable ones.

**Witness:** the file already states 6A, 6C, 2G, 4B, 4E and 9B at the level of integral Gram matrices with its own `GramIsometric` and `GramSameGenus`. In that vocabulary `D₁₆⁺` is one integer matrix: in the basis `h, e₁−e₂, …, e₁₄−e₁₅, e₁₅+e₁₆` with `h = (½,…,½)` its Gram matrix has diagonal `4, 2, …, 2`, the `A₁₅`-type band, the two entries `1` and `−1` in the last row, and determinant `1` (recomputed exactly). A scratch file importing the built module elaborates, with only `sorry` warnings, the five statements below:

```lean
theorem d16Plus_sameGenus_not_isometric_e8SumE8 :
    (∀ i, 2 ∣ d16PlusGram i i) ∧ d16PlusGram.det = 1 ∧ (Matrix.toQuadraticForm' d16PlusGram).PosDef ∧
    GramSameGenus e8SumE8Gram d16PlusGram ∧ ¬ GramIsometric e8SumE8Gram d16PlusGram := sorry
theorem gramIsometric_e8SumE8_sum_U_d16Plus_sum_U :
    GramIsometric (reindex … (fromBlocks e8SumE8Gram 0 0 !![0, 1; 1, 0]))
      (reindex … (fromBlocks d16PlusGram 0 0 !![0, 1; 1, 0])) := sorry
theorem localDensityCount_eq_of_odd_of_not_dvd (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) {n : ℕ}
    (A : Matrix (Fin n) (Fin n) ℤ) (hA : A.IsSymm) (hdet : ¬ (p : ℤ) ∣ A.det) (hn : 0 < n) :
    ∃ r₀, ∀ r ≥ r₀, (localDensityCount p A r : ℚ) = (p : ℚ) ^ (r * (n * (n - 1) / 2)) *
      (if n % 2 = 1 then 2 * ∏ i ∈ Finset.Icc 1 (n / 2), (1 - (p : ℚ) ^ (-(2 * (i : ℤ))))
       else 2 * (1 - (legendreSym p ((-1) ^ (n / 2) * A.det) : ℚ) * (p : ℚ) ^ (-((n / 2 : ℕ) : ℤ))) *
         ∏ i ∈ Finset.Icc 1 (n / 2 - 1), (1 - (p : ℚ) ^ (-(2 * (i : ℤ))))) := sorry
theorem gramSameGenus_iff_of_isEven … :   -- 5A: GramSameGenus G H ↔ equal signature ∧ isometric
    GramSameGenus G H ↔ (ofGramMatrix (Pi.basisFun ℚ (Fin n)) G hGs).signature = … ∧
      Nonempty ((… G …).discriminantQuadraticModule hGe).Isometry ((… H …).discriminantQuadraticModule hHe)) := sorry
theorem infinite_isometry_of_isIndefinite … (L : IntegralLattice V) [L.IsNondegenerate]
    (hL : L.IsIndefinite) (hr : 3 ≤ Module.finrank ℚ V) : Infinite (L.Isometry L) := sorry
```

`e8SumE8Gram` is `fromBlocks (CartanMatrix.E 8) 0 0 (CartanMatrix.E 8)` reindexed by `finSumFinEquiv`, exactly as the file's own rank-9 statement is built. Even on the native carrier `D₁₆⁺` is `ofGramMatrix (Pi.basisFun ℚ (Fin 16)) d16PlusGram (by decide)` (`TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:261` takes a Gram matrix and a symmetry proof only); the native `d8PlusLattice` goes through the glue construction because it wants the glue theorems, not because the Gram route is unavailable. The 7C closed form at odd `p` is what the README calls the milestone's value and what OrthogonalTamagawaAndLatticeMass cites ("§7C at odd primes"); `legendreSym` is at `Mathlib/NumberTheory/LegendreSymbol/Basic.lean:109`, and the hypothesis `0 < n` keeps the rank-0 exception out, as the README's own text requires. The statement was checked on `U` at `p = 3` (count `4` mod 3 and `12` mod 9, both `4/3` normalized), on `I₂` at `3` and `5` (`8/3 = 2(1 + 1/3)` with `ε = (−1|3) = −1`; `8/5 = 2(1 − 1/5)` with `ε = (−1|5) = 1`).

**Repair:** add `d16PlusGram` (with the basis named in its docstring) and `e8SumE8Gram`, state 6D and 6H as above, and delete the first bullet of the unstatable list. State the odd-prime value of 7C (the file's `localDensityCount_succ_eq` is only the stabilization). State 5A at Gram level and 4F as above, or name both in the docstring as README targets with the reason; the README's 1738 ("the genus of an even lattice from its discriminant form") and the 4F milestone present them as results of the roadmap, and both are statable with the file's existing vocabulary.

## R02 (P2) — N1 states the unit-square-class containment without the rank hypothesis

**Location:** `TauCetiRoadmap/IntegralLattices/README.md:1454–1457`: "The containment `H_p(L) ⊇ ℤ_pˣ(ℚ_pˣ)²` for `p ∤ 2 det L` … is the native almost-everywhere statement made exact: it holds at every odd `p` not dividing `det L`."

**Claim:** for every nondegenerate `L` and every odd `p ∤ det L`, the spinor image of `K_p⁺(L)` contains the unit square classes.

**Witness:** `L = ⟨1⟩`, `det L = 1`: `K_p⁺(L) = SO(V_p) = 1` and `H_p(L)` is trivial at every `p`, while `ℤ_pˣ(ℚ_pˣ)²` has order 2. The README's own Check at line 1468 ("Rank 1: `K_p⁺(L) = {1}`, so `H_p(L)` is trivial") and the native `localSpinorNormImage_eq_bot_of_finrank_le_one` (`TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/SpinorNormImage.lean:107`) refute the sentence; the native almost-everywhere theorem it claims to sharpen carries `2 ≤ finrank ℚ V` (`Integral/CompactOpen.lean:160`), and the odd-prime equality carries `[Nontrivial ι]` (`Integral/SpinorNorm.lean:367`). 4C already restricts its finiteness statement to `rank L ≥ 2` for exactly this reason.

**Repair:** write "for `rank L ≥ 2` it holds at every odd `p` not dividing `det L`; in rank at most 1 the image is trivial (`localSpinorNormImage_eq_bot_of_finrank_le_one`)". While there: line 1443–1444 attaches "of rank at least 2" to the reflection generation as well, which the native `integralOrthogonalSubgroup_eq_closure_reflectionOrthogonal` (`Integral/SpinorNorm.lean:254`) proves in every rank; only the unit-square-class equality needs the rank.

## R03 (P3) — Locators and citations

- `README.md:478, 2096, 2099`: "Root Systems Layer 5 ADE classification". `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md` on main has Layers 1–3; the classification is Layer 3, §3.1 "Classification independent of a base" (line 506), and `DynkinType.E8` is in its *From Tau Ceti* table (line 229). Cite Layer 3 §3.1.
- `README.md:1700` (4G): "Voight, *Kneser's method of neighbors*, §2". In the cached arXiv text (2308.11566, cache 6662b395) §2 is "Neighbors, a first meeting" (line 32, a simplified setting); the definition `[Λ : Λ ∩ Π] = [Π : Λ ∩ Π] = p` is Definition 3.10 (line 230), the determinant and genus equalities Lemma 3.12 (line 245), and the construction `Λ(p, v) = (v/p)ℤ + {w : T(v, w) ∈ pℤ}` with `p² ∣ Q(v)` is Proposition 3.13(iii) (line 261). Cite §3.
- `README.md:2181`: "Quadratic Form Invariants Layers 6D and 7C" as inputs of the odd 6A theorem. QFI's 7C is the cup-norm theorem over an arbitrary field (`TauCetiRoadmap/QuadraticFormInvariants/README.md:2641–2660`); the Hilbert reciprocity the proof uses is QFI Layer 5 `hilbertSymbol_productFormula` (its line 688; `Suggested.lean:2578`), as the *From other roadmaps* table already says. Cite Layer 5.
- `README.md:476`: quotient measures and the Tamagawa normalization "belong to `TamagawaMeasures`". No roadmap of that name exists on main or among the open pull requests (`roadmaps list`). Name the actual owner (OTM §1.2, which the ownership table at line 84 already assigns, or AdelicAlgebraicGroups AA0–AA4 as at line 115) or drop the name.

## R04 (P3) — 7E keeps the form the previous review asked to retire, and three definitions have no Checks

- `README.md:2334–2399` (7E) is the ASCII prose that the previous review's R06 named for the 6A/6D supplement, which was rewritten: "has norm1", "C1 charts", "Lindelof", "a sphere chart phi and polar map `(r,y)↦r phi(y)`", "integration over0<r<1", "Include S0", "so(n-1)", "determinant1 shear", "with volume1", "component-factor2", "its n0 instance", "a SEPARATE successor obligation", and the displays `vol(S^(j-1))=2*pi^(j/2)/Gamma(j/2)`, `2*pi^(-n(n+1)/4)*product_(j=1..n)Gamma(j/2)`. The mathematics is right (table below); write it in the README's Unicode form with spaces, and give the volume formula a locator (any standard reference for `vol(SO(n)) = ∏_{j=2}^{n} vol(S^{j−1})` in the metric `−tr(XY)/2`; the roadmap's other milestones all carry one).
- Definitions without `**Checks.**`: 7E's five (`sphereArea`, `orthogonalSkewBasisVolume`, `skewMetricCoordinates`, `soEuclideanMeasure`, `oEuclideanMeasure`; the Examples line has the three values `2π`, `8π²`, `2`, which can become Checks together with `sphereArea 1 = 2`, `sphereArea 2 = 2π` and the `n = 0` singleton); 5B's `NikulinExistenceConditions` and `EvenLatticeWithInvariants` (the `⟨2⟩`/`⟨10⟩` pair and the rank-0 instance `q = 0`, `(0, 0)` are in the prose; a third is `⟨2⟩` with `(1, 0, q_1^{(2)}(2))`, which meets condition 4 in its switched-off case); B6's torus and B7's measures (the three cases `Δ = −4`, `12`, `1` of the Examples line, with the values `2π`, `log(2 + √3)` and the infinite `dt/t` direction).

## Verified sound

**Repair status of the previous review (71db65f).**

| Previous | Passage now | Status |
| --- | --- | --- |
| R01 native declarations planned again | *From Tau Ceti* rows at lines 441–448 list the 55 integral-stabilizer, spinor-image, order/Picard and Hasse declarations with their files; N0 (1397–1420), N1 (1436–1458), 3C (803–813) and 4B (1502–1534) consume them and keep as targets only the two comparisons, the bad-prime images, the two double-coset bijections and the spinor-genus count; the *From other roadmaps* table (469–478) keeps the 13 non-native names; `isProperFractionalIdeal_iff_isUnit_of_finrank_eq_two` cited (447, 1114) | repaired (all 199 backticked names of the table found at the pin; the 32 new ones located file and line, see below) |
| R02 docstring and 1.11.3 | `nonempty_isometry_iff_gaussSign_eq` at `Suggested.lean:206`; 4B at Gram level (323); docstring list rewritten (57–74) | repaired, but see R01: 6D/6H are statable at the same Gram level |
| R03 1G attribution | lines 571–582: Nikulin states the relations as a calculation, classification in two steps via Kawauchi–Kojima (uncertified, in `sources.toml`) and 1.11.3 | repaired |
| R04 `minGenerators` | `AddGroup.rank` at `Suggested.lean:362, 378, 382, 388, 413`; README 567, 405 | repaired |
| R05 locators | 7A row "Conway–Sloane §6" (2730); 6B "V.1.4.3 … remark after V.2 Theorem 2 … Corollary 2" (1973–1975); `Cartan/Basic.lean` (401); characteristic signature "Serre, V.2.1 Theorem 2 with its corollaries" (2185); Cox Theorem 3.9, p. 50 (1236); Serre reference "Source for 1I, 6A, 6B and 6D" (2891); "2A–2E" (450) | repaired |
| R06 shape | Checks at 3D, 3E, 3F, 3G, 3H, 4A, 4B, 4C, 4G, 5A, 5F, 5I, 6D, 6F, 7A, 7G; supplement 2102–2223 in Unicode prose; 7C's successor narration reduced to one sentence (2310–2312); "old labels", "are belong", `localConditions`, "by an algorithm" gone | repaired for what it named; 7E untouched (R04) |

**Gate and build.** The worker's gate: every counter 0, `build=0`, OK. `lake env lean TauCetiRoadmap/IntegralLattices/Suggested.lean`: exit 0 in 11 s, 24 warnings, all `declaration uses sorry`. Dependency check:

```text
depcheck: 232 roadmaps, 2133 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The folder exists on main, so it is not in the merge order; every supplier cited is on main (Completed GlobalNumberFields, RestrictedProducts, OrthogonalSpinGroups; QuadraticFormInvariants, GlobalQuadraticForms, ClassFieldTheory, RootSystems, LieGroups, DifferentialGeometry, ThetaSeries and LFunctions as consumers only). OrthogonalTamagawaAndLatticeMass (open, #1222) and AdelicAlgebraicGroups (open, #792) are named as owners and consumed nowhere; GeometryOfNumbersAndQuadraticArithmetic (open, #851) is mentioned once in the ownership table and, at its head, consumes this roadmap (its supplier section "From Completed/IntegralLattices and TauCetiRoadmap/IntegralLattices" cites 2A–2C, 2F–2G, 3A, 3F, 4C, 7A and B2), so the supply runs one way. The diff outside the folder is empty. No `set_option`, no `lemma`, no sorry'd data, no admitted `example`, imports `Mathlib` plus 18 `TauCeti.*` modules that build, no pull-request numbers or process words in the README.

**Padding probe.** A scratch copy with every `sorry` replaced by `by first | rfl | (simp; done) | infer_instance | decide | (norm_num; done)` fails at exactly the 24 admitted lines (108, 210, 227, 271, 282, 329, 341, 366, 406, 415, 438, 450, 484, 507, 524, 532, 541, 550, 562, 569, 592, 662, 688, 728) with no parse error; none closes.

**Signatures.** The worker's elaborated types of the 57 declarations were compared with the README statements; none lost a binder (`vanDerBlij` keeps `[FiniteDimensional ℚ V] [L.IsNondegenerate]` and unimodularity; `milgram` keeps nondegeneracy and evenness; `padicDiscriminant_eq_squareClass_gramDet` keeps the dyadic exception as `p ≠ 2 ∨ ¬ HasCyclicTwoSummand`, the rank equation and the `p`-primary isometry; `exists_primitiveEmbedding_iff` keeps `t₊ ≤ l₊`, `t₋ ≤ l₋`). Generality agrees with the README in every case I checked: 1.11.3 quantifies over nondegenerate modules with isometric bilinear modules; 5B's four clauses are one field each, conditions 3 and 4 guarded by the equality `t₊ + t₋ = l(A_{q_p})` and 4 by the absence of `q_θ^{(2)}(2)`; 5J's seven clauses in Nikulin's order; 6A at Gram level with evenness as even diagonal, unimodularity as `det = ±1`, indefiniteness as both signature entries positive; 7C's count with `n(n−1)/2` exact in `ℕ`; 7E over any `C¹` structure in which the coordinate map is an immersion, which forces the submanifold structure and `dim E = n(n−1)/2`.

**Library declarations opened at the pins.**

| Declaration | File:line | Note |
| --- | --- | --- |
| `integralOrthogonalSubgroup`, `mem_integralOrthogonalSubgroup_iff_mem_span`, `integralOrthogonalSubgroup_eq_of_span_eq`, `eventually_mem_integralOrthogonalSubgroup`, `eventually_integralOrthogonalSubgroup_baseChange_eq` | `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/Integral/Basic.lean:51, 94, 119, 234, 250` | definition asks integrality of matrix and inverse (N0's remark correct) |
| `integralOrthogonalSubgroup_eq_closure_reflectionOrthogonal` (any rank), `map_spinorNorm_comap_integralOrthogonalSubgroup_eq_unitSquareClasses` (`[Nontrivial ι]`) | `Integral/SpinorNorm.lean:254, 367` | R02 |
| `eventually_localSpinorNormImage_integral_eq_unitSquareClasses` (`2 ≤ finrank`) | `Integral/CompactOpen.lean:160` | R02 |
| `localSpinorNormImage_eq_bot_of_finrank_le_one`, `exists_localSpinorNormImage_ne_unitSquareClasses` | `SpinorNormImage.lean:107`, `LowRank.lean:142` | rank-1 Check |
| `integralSpinSubgroup`; `finiteAdelicSpecialOrthogonal`, `finiteAdelicSpin`; `finiteAdelicSquareClasses`, `adelicSpinorNorm` | `Integral/Spin.lean:70`; `FiniteAdelic.lean:85, 90`; `AdelicSpinorNorm.lean:67, 79` | 4B, 4C |
| `spinorNorm_reflectionPairSpecialOrthogonal`; `orthogonalGroupBaseChange`; `transvection` | `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean:298`; `QuadraticForm/BaseChange.lean:379`; `QuadraticForm/Transvection/Basic.lean:194` | N1, 4B, 4F |
| `NumberFieldOrder` (needs `[NumberField K]`), `invertibleProperFractionalIdeals`, `card_narrowPic` | `TauCeti/NumberTheory/NumberField/Global/Orders/Basic.lean:59`, `ProperIdeal.lean:179`, `NarrowPic/Kernel.lean:198` | B2 docstring reason holds: `QuadraticAlgebra` has `Field` (`Mathlib/Algebra/QuadraticAlgebra/Basic.lean:513`) and no `NumberField` instance |
| `equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq`; `locallyEquivalent_iff_…_realPositiveIndex_eq`; `exists_of_realization`; `localHasse`; `hasseInvariant` | `TauCeti/NumberTheory/LocalField/QuadraticForm/Classification.lean:178`; `Global/Classification.lean:129`; `Realization.lean:113`; `Hasse.lean:91`; `RegularFormClass/Hasse.lean:118` | 3H, 6A |
| `unitNormSplittingIsometry`; `restrictFullIsometry`; `dualCarrier_smul`; `isEven_iff_isCharacteristicVector_zero`; `IsUnimodular.exists_isCharacteristicVector`, `…characteristicVector_integralNorm_modEq`; `orthogonalGroupToLinearIsometryEquiv` | `Orthogonal/UnitNorm.lean:111`; `Restriction.lean:199`; `Dual/Scaling.lean:71`; `Characteristic/Basic.lean:66`; `Characteristic/Unimodular.lean:34, 100`; `TauCeti/LinearAlgebra/OrthogonalGroup.lean:39` | 0F, 0A, 1L |
| `ofGramMatrix` (basis, Gram matrix, symmetry proof) | `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:261` | R01 |
| `d8PlusLattice` via `isEven_d8PlusCarrier.isIntegral.toIntegralLattice`; `typeE₈IsometryD8Plus` | `RootLattice/D8Plus/Basic.lean:164`; `D8Plus/Isometry.lean:298` | R01 |
| `IsIndefinite := 0 < sigPos ∧ 0 < sigNeg` | `Signature.lean:111` | 4F statable |
| `oddCyclic m θ` with `q = θ(m+1)/(2m)`; `dyadicCyclic k θ` with `q = θ/2^{k+1}` | `FiniteBilinearModule/OddCyclic/Basic.lean:62`; `Dyadic/Cyclic.lean:56` | the 1H Check `q(1) = 2θ/3` and the generator labels of 1G agree with Nikulin's `q_θ^{(p)}(p^k)`, `q_θ^{(2)}(2^k)` |
| `inducedRiemannianMetric` (pullback inner product of an immersion), `riemannianVolume` (chart-defined) | `TauCeti/Geometry/Manifold/Riemannian/Induced.lean:92`; `VolumeDensity/Volume.lean:76` | 7E |
| `DoubleCoset.Quotient`; `Pell.exists_of_not_isSquare`; `AddCommGroup.primaryComponent`; `legendreSym`; `volume_ball` | `Mathlib/GroupTheory/DoubleCoset.lean:79`; `NumberTheory/Pell.lean:323`; `GroupTheory/Torsion.lean:450`; `LegendreSymbol/Basic.lean:109`; `Measure/Lebesgue/VolumeOfBalls.lean:307` | 4B, B4, 1G, R01, 2F |

Every name of the *From Mathlib* table (33 checked) and of the *From Tau Ceti* table (199 backticked names) occurs in the pinned sources. The upper half of Minkowski's second theorem for convex-body minima (`ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`, which SuccessiveMinima's README on main calls native) is not at this pin and is planned by GeometryOfNumbersAndQuadraticArithmetic §1.3.3 for real minima; 2F on the native squared-norm `successiveMinimum` is a different object and is not a duplicate at the pin.

**Cross-roadmap citations resolved (every one, this round).**

| Citation | Resolved at | Result |
| --- | --- | --- |
| QFI `hilbertSymbol_productFormula` (Layer 5); Layer 6D; 7C | `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:2578`; README 688, 2167, 2641 | present; 7C is the cup-norm theorem (R03) |
| GQF `hasseMinkowski_equivalent` (`Q.Equivalent R ↔ LocallyEquivalent Q R`), `equivalent_of_locallyEquivalent`; 6.3; Layers 0–6 | `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean:439, 544`; README 723 | present |
| GNF `picEquivUnitsIdealClassMonoid`, `finite_narrowPic`; Layer 11 | `Completed/GlobalNumberFields/Suggested.lean:798, 991`; README 571 | present |
| CFT `ringClassField`, `ringClassArtinMap`, `gal_ringClassField_equiv_pic` (all with `Module.finrank ℚ K = 2`), `hilbertProductFormula` | `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:4318, 4327, 4350, 4396` | present; the README's "no split ring class field" reading of the types is right |
| OSG 0C, 2C, 2F; `orthogonalBaseChangeReal`, `spinorNorm_reflection`, `transvectionLiftHom`; Layers 1–2 | `Completed/OrthogonalSpinGroups/README.md:368, 684, 717`; `Suggested.lean:1022, 418, 901` | present |
| Restricted Products Layers 1–3 | `Completed/RestrictedProducts/README.md` | present |
| Root Systems "Layer 5", `weylGroup` | `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:504–611` (Layer 3 is the last), 115, 229 | section number wrong (R03) |
| LieGroups matrix groups; DifferentialGeometry 12.1, 12.4 | `…/LieGroups/README.md:32–34`; `TauCetiRoadmap/DifferentialGeometry/README.md:915, 923` | present |
| Rank-24 Layers 3 and 6; Theta Series; LFunctions; `Completed/IntegralLattices` | `TauCetiRoadmap/Rank24LatticeConstructions/README.md:223, 312`; `ThetaSeries/README.md` (cites IntegralLattices 9 times, as consumer); dirs on main | present |
| OTM §§0.3, 1.1, 1.2, 1.3, 1.4, 2.1–2.3, 3.1, 4.1, Layer 3 | `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md:155, 177, 192, 210, 232, 391, 405, 444, 473, 525, 471` at the head of its open pull request | present. Note for the author: OTM's head still cites IntegralLattices §6E and §§7H/7I (its lines 541, 573), labels this head no longer carries; that is OTM's drift |
| `TamagawaMeasures`; `IntegralLatticesPartII`, `IndefiniteLatticeAutomorphisms`, `IndefiniteThetaAndSiegelWeil`, `FiniteQuadraticModuleWittTheory` | none on main or open | the first is cited as an owner (R03); the others are named successors, consumed nowhere |

Ownership against the open pull requests was searched by object with `roadmaps grep` (Minkowski's second theorem, `successiveMinim`, proper spinor genera, Nikulin 1.10.1, local densities, `vol(SO(n))`, `D₁₆⁺`, binary forms and `NarrowPic`): the hits are OTM (consumer), GeometryOfNumbersAndQuadraticArithmetic #851 (consumer of 2A–2C, 2F–2G, 3A, 3F, 4C, 7A, B2; its §2.4 generalizes the spinor-genus theory to number rings and cites the native `map_spinorNorm_comap_…` as the `ℚ_p` case), LatticePackingsAndPerfectForms #1723 (consumes real minima from SuccessiveMinima and the upper half from #851), SiegelModularForms #1714 and the omnibus #1187/#1800 (mention `D₁₆⁺` as theta-series input). No sibling builds these objects.

**Adversarial pass.** `⟨a⟩` has Gram `[a]`; `U = !![0,1;1,0]`; half-norm discriminant values; counts are brute force unless marked.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 1G odd-`p` bilinear classification | `b_1^{(3)}(3)^{⊕2}` vs `b_2^{(3)}(3)^{⊕2}`; `b_1` vs `b_2` | determinant classes `1 ≡ 4` (squares mod 3); `(2\|3) = −1` | pass |
| 1G `q_1^{(2)}(2) ≅ q_5^{(2)}(2)`; `u ⊕ u ≅ v ⊕ v` | half-norms `1/4`, `5/4`; Gauss sums | `5/4 − 1/4 = 1 ∈ ℤ`; `2·2 = (−2)(−2) = 4` | pass |
| 1H `oddCyclic 3 θ` | `θ = 1, 2` | native `q(1) = θ·4/6 = 2θ/3`; sums `−i√3`, `i√3`; signs `6 = −2 + 0`, `2 = −2 + 4` (nikulin1980 cache b0f9f2a7 line 717) | pass |
| 1H Theorem 1.11.3 | `u(2)`, `v(2)`; `q_1(2)`, `q_3(2)` | same bilinear module, signs `0 ≠ 4`; `1 ≠ 7` | pass (line 724) |
| 1I / 1L | `⟨2⟩`, `⟨−2⟩`, `⟨1⟩`, `E₈`, `I₈` | `1 + i → 1`, `1 − i → 7`, odd excluded, `0`, `8 ≡ 0`; van der Blij Theorem 2 (cache 1ea182d4 line 54), `(7)` `f(w,w) ≡ τ (mod 8)` for `D = ±1` | pass |
| 2F | `⟨a⟩`; `ℤ²`; `A₂`; rank 0 | `2√a ≤ 2√a`; `π ≤ 4`; `2π ≤ 4√3`; `1·1 ≤ 1·√1` | pass |
| 2G | rank 2, det 3; `U` | `[1,0;0,3]`, `[2,±1;±1,2]`: two classes; `[0,1;1,2k]` unbounded | pass |
| 3B/3E oddity fusion | `⟨1⟩⊕⟨3⟩` vs `⟨5⟩⊕⟨7⟩` | dets `3`, `35 ≡ 3 (mod 8)`; oddities `4`, `12 ≡ 4`; symbol `1_4^{−2}` | pass |
| 3D sign walking | `⟨1⟩⊕⟨4⟩` | `(e₁+e₂)·(−4e₁+e₂) = −4 + 4 = 0`, norms `5`, `20`; `1 ≢ 5` mod unit squares | pass |
| 3F/3H | `!![2,1;1,3]` at 5 | basis `e₁, e₁−2e₂`: `2 − 2 = 0`, `2 − 4 + 12 = 10`; `(2\|5) = −1`; `(2,10)_5 = (2,5)_5 = −1` | pass |
| 3G oddity formula | `⟨1⟩`, `⟨3⟩`, `⟨5⟩`, `U` | `1 + 0 = 1`; `1 + 2 = 3`; `1 + 4 = 5`; `0 + 0 = 0` | pass |
| 3I exponents (Cho Lemma 5.1, cache 075df344 line 1223–1251; Def 2.1 line 113) | `U`, `⟨1⟩`, `⟨2⟩`, `⟨1⟩⊕⟨2⟩` | `N = 2, 1, 2, 2`; `α₂ = 2^{N−n(n−1)/2}·#𝒢̃` gives `4, 4, 8` | pass |
| 7C stabilization and values | `U` mod `2, 4, 8, 16`; `U` mod `3, 9`; `⟨1⟩` mod `2^r`; `⟨2⟩` mod `2^r`; `I₂` mod `2^r`, `3`, `9`, `5` | counts `6, 16, 32, 64` (normalized `3, 4, 4, 4`); `4, 12` (`4/3`); `1, 2, 4, 4, 4, 4`; `2, 2, 4, 8, 8, 8`; `2, 16, 64, 128` (ratio `2 = 2^{1}` from `r = 3`), `8/3`, `24/9 = 8/3`, `8/5` | pass; `ε = ((−1)^m det\|p)` confirmed at `p = 3, 5` |
| 7C normalized products | `n = 1, 0`; `n = 2`, `−det` square | empty product; no factor 2; `∏(1 − p⁻¹)⁻¹` diverges | pass |
| 7E | `n = 0, 1, 2, 3`; Γ identity `n = 0, 1` | `1, 1, 2π, 8π²`; `vol(O(1)) = 2 = 2·1`; `2 = 2/1`; `2π^{−1/2}√π = 2 = 4/2` | pass |
| B1 | `A₂`, `U`, `⟨1,−2⟩`, `!![4,1;1,6]` | `(c, Δ) = (2,−3), (2,1), (1,8), (2,−23)`; `disc N_L = −4 det L` | pass |
| B2 oriented map | `Δ = 12` | `𝔞_f = 𝔞_{f'} = 𝒪₁₂`; `x² ≡ −1 (mod 3)` impossible; `N(2+√3) = 1`, `Pic` trivial, `NarrowPic` order 2 | pass |
| B3 split branch | `m = 2, 3, 5, 8` | `(0,2,1) ~ (0,−2,1)` by `!![1,0;−2,1]`; `φ(3) = 2` classes in 2 genera (values `≡ 0,1` vs `0,2` mod 3); `φ(5) = 4`, genera `{1,4},{2,3}`; torus quotient `(ℤ/m)ˣ/(ℤ/m)ˣ[2]` of order `2, 1` at `m = 5, 8` | pass |
| B4 automorphism orders | `!![4,1;1,6]`, `!![2,1;1,12]`, `!![3,1;1,4]`, `A₂`, `I₂`, `U`, `!![2,3;3,16]` | `2, 4, 2, 12, 8, 4, 4` (exhaustive over entries `≤ 6`) | pass |
| B5 reduced forms | `Δ = −3, −4, −23, −44` and every `Δ ∈ {−4d : d ≤ 10} ∪ {−7,−11,−15,−19,−35}` | `h⁺ = 1, 1, 3, 3`; ambiguous `1, 1, 1, 1`; all classes ambiguous for every `Δ` of determinant `≤ 10` | pass; "smallest determinant 11" confirmed |
| B7 torus quotient | nonsquare `Δ`; `Δ = 1` | `Ψ: T(ℚ)\T(𝔸_f)/T(ℤ̂) → NarrowPic²`, `a/ā ↦ [𝔞]²`, well defined (`𝔞𝔞̄ = N(𝔞)𝒪`, `[(q)]² = 1`, unit `u/ū` gives `[𝔲]² = 1`) and injective (`[𝔞]² = 1 ⇒ ā = qau`, norms force `q ∈ T(ℚ)`, `u ∈ T(ℤ̂)`); `𝔸ˣ/ℚˣ ≅ ℤ̂ˣ × ℝ_{>0}` | pass |
| B8 mass | `Δ = −3`; `Δ = −23` | `1/12`; `1/4 + 1/2 = 3/4 = 3/(2·2)`; `h/(2w) = 1/2` wrong | pass |
| N0 Check | `U`, `e ↦ 2e, f ↦ f/2`; `5`-neighbour | `B(2e, f/2) = 1`; `(5,0) − 2(11/5, 2/5) = (3/5, −4/5)`, norm `1`, `v·v = 125 ≡ 0 (mod 50)` | pass |
| N1 containment | `⟨1⟩`, any odd `p` | `H_p = 1 ⊉ ℤ_pˣ(ℚ_pˣ)²` of order 2 | **fail without `rank ≥ 2`** (R02) |
| 4C rank 1 / rank 2 | `⟨1⟩`; `I₂` at 2; `5xy + y²` | `J/(ℚˣJ²)` infinite; `{1,2,5,10}(ℚ₂ˣ)²` index 2; `G = ℤ/4`, `G[2]G² = {±1}`, both counts 2 | pass |
| 4G | `L = M`; `p = 2` on `ℤ²` | index `1 ≠ p`; `(1+2a)² + (1+2b)² ≡ 2 (mod 4)` | pass |
| 5B conditions | `q = 0`, `(0,0)`; `⟨2⟩` vs `⟨10⟩` | empty filter gives `d = 1`, class of `1`, `|A| = 1`; `12·5/12`-type ratio `5` nonsquare in `ℚ₂`, excluded by `HasCyclicTwoSummand` | pass |
| `padicDiscriminant_eq_squareClass_gramDet` | `⟨6⟩` vs `⟨42⟩` at 3; `⟨2⟩⊕⟨6⟩` vs `⟨2⟩⊕⟨30⟩` at 2 | `q_3` both `1/3` (`θ = 2`), `42/6 = 7 ≡ 1` square; second pair has `q_1(2)` summands so the hypothesis excludes it, dets `12`, `60` differ by `5` | pass |
| 5G 1.12.2 (line 788), 1.12.4 (line 806–811) | `⟨2d⟩ ↪ U`; `(1,0) ↪ (1,1)`, `(0,0)`; `t = 0` | `K = ⟨−2d⟩`; `2 ≤ 2`, `1 ≤ 0` fails; reduces to 6B | pass |
| 5I Check | `⟨2⟩ ⊂ A₂` | `(a + 2b)² = 2 − 4 + 8 = 6`, `a·(a+2b) = 0`; `1/4 − 1/3 = −1/12 = −q_K(1/6)` | pass |
| 5J (line 1630–1640) | `(0,4,0,0)`, `(1,3,0,1)`, `(1,4,0,2)`, `(0,4,0,4)`; `(1,1,0,1)`, `(0,1,1,2)`, `(0,4,0,2)`, `(0,0,0,0)`; `(1,0,0,0)` | excluded by exactly clause 4, 5, 6, 7; all seven pass; excluded by 4 (zero lattice forces `δ = 0`, matching the Lean `↔`) | pass |
| 6A/6H | `U` vs `⟨1⟩⊕⟨−1⟩`; `U⊕E₈⊕E₈(−1)`; `E₈²⊕U` vs `D₁₆⁺⊕U` | parity; `(9,9) → U⁹`; rank 18, det `−1`, `(17,1)` | pass |
| 6D `D₁₆⁺` | Gram in basis `h, e₁−e₂, …, e₁₅+e₁₆` | diagonal `4, 2, …, 2`, `h·(e₁₅+e₁₆) = 1`, det `1` (exact), even | pass (R01) |
| 6C/6G | `E₈⊕I₁` vs `I₉`; orbit chain | norm-1 counts `2`, `18`; `240·126·23040 = 696729600 = 2¹⁴3⁵5²7` | pass |
| 7A/7G | rank 0; `⟨a⟩`; genus of `!![4,1;1,6]` | `(1,1)`; `(1/2, 1)`; `m = 3/4`, `m⁺ = 3/2` | pass |
| 9B | `{!![2,1;1,12], !![4,1;1,6]}`; three Grams of one class | `1/4 + 1/2 = 3/4`; `3·(1/4)` without pairwise non-isometry | pass |
| `IsPrimitiveEmbedding`, `GramSameGenus`, `IsGenusMass` | `ℤ → ℤ`, `x ↦ 2x`; `n = 0`; indefinite `G` | cokernel `ℤ/2` fails saturation; all vacuous; `S = ∅`, `m = 0` | pass |

**Seeded sample.** B1–B8 recomputed as above. Cox (B2 Theorem 7.7, B4 Theorem 3.9, B5 Theorems 2.8/2.13) and Cohen (§5.2, §5.6) are uncertified and were not read; Conway–Sloane (author-page copy, cache e0dcc36e) line 31 is equation (1), lines 318–328 the §6 dimension guard and proper `p`-mass, line 1092–1104 the §12 density `N(p^r)/p^{rn(n−1)/2}`, which is 7C's definition; the mathematics of B1–B8 agrees with every statement checked. Also read this round: nikulin1980 (cache b0f9f2a7) lines 488–494 (1.9.1), 605–622 (1.10.1, 1.10.2), 716–730 (1.11.2, 1.11.3), 788–832 (1.12.2–1.12.4), 1630–1656 (3.6.2); cho2015 (cache 075df344) lines 113–117, 250–251, 1223–1251; van der Blij (cache 1ea182d4) lines 54–57; Voight (cache 6662b395) lines 32–80, 228–262; Allcock–Gal–Mark (cache 69a6506b) line 71 (Theorem 5.1 is the completeness of the canonical symbol).

## Not verifiable

- O'Meara, *Introduction to Quadratic Forms* (81:14, 91:9, 92:1, 92:1a, 92:5, 93:16, 93:28–29, 101:8, 102:7, 103:4, 104:4–5, 106:13): no legal copy; the rank-≤ 9 classification, the odd-prime Jordan uniqueness and the spinor-genus count rest on it, and were checked by computation only.
- Cassels, *Rational Quadratic Forms* and *Geometry of Numbers* (2F, 4F, B4); Cox and Cohen (B2, B4, B5, uncertified by the README); Milnor–Husemoller (1H, 1I, 1L, 6A, 6H); Wall (1H); Gan–Yu Theorem 7.3 (7C); SPLAG chapters 4, 15, 16; Ebeling; Kitaoka; Kneser: paywalled or absent.
- Serre, *A Course in Arithmetic* (1I, 6A, 6B, 6D): the only cached copy is a course-page upload, which I did not rely on; the Serre locators were checked against Nikulin and by computation only.
- Kawauchi–Kojima (1G): settled uncertified in `sources.toml`.

## Source issues

- none
