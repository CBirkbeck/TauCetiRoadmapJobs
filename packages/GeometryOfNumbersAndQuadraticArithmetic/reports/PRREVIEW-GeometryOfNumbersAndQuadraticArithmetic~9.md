# Review of GeometryOfNumbersAndQuadraticArithmetic (pull request #851 at ebaa5bb)

**Verdict:** needs changes

This is a full review: the folder changed by 529 lines since `f8d56e6`. All seven findings of the previous review are repaired (see *Previous findings*). The gate passes, the dependency check prints no problem, and `Suggested.lean` elaborates with 23 `sorry` warnings and no error. The blocking finding is a headline that the pinned Tau Ceti now makes statable, although the README and docstring say it is not. The other five findings are smaller: library duplications, supplier names that the suppliers do not use, two locator slips, the Lean section layout, and Check/prose slips.

## R01 (P2) — §1.2.14 is statable at the pins, but the README and docstring say its carrier is missing

Location: `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/Suggested.lean` lines 30–32 ("stated through the real model `realModel` of a positive definite integral lattice, which ThetaSeries 2D supplies and the pins do not; it is a README target"). The same claim appears in `README.md` lines 93–95, and §1.2.13a consumes the squared-norm minima from IntegralLattices §2F (lines 426–429).

Claim: the comparison of squared-norm and body minima (§1.2.14) cannot be stated against the pinned Mathlib and Tau Ceti.

Witness: Tau Ceti at the pin (`2fd255d`) has `TauCeti.IntegralLattice.realModel` (`TauCeti/Algebra/Module/ZLattice/RealModel.lean` line 177) with `DiscreteTopology` and `IsZLattice` instances (lines 215, 219) and `norm_sq_realModelMap` (line 166). It also has `TauCeti.IntegralLattice.successiveMinimum` (`TauCeti/LinearAlgebra/IntegralLattice/PosDef/SuccessiveMinima.lean` line 47).

Tau Ceti also states the whole §2F API that 1.2.13a lists as consumed: `successiveMinimum_le_iff` (line 84), `monotone_successiveMinimum` (96), `IsPosSemidef.successiveMinimum_zero` (105), `IsPosSemidef.exists_linearIndependent_integralNorm_eq_successiveMinimum` (186) and `IsPosDef.successiveMinimum_pos` (255). The route's SuccessiveMinima 1.4 is pinned as `ZLattice.successiveMin_le_iff_finrank` (`TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.lean` line 457). The headline is therefore statable and absent.

Repair, tested on a scratch copy that elaborates with only `sorry` warnings (24):
1. In `Suggested.lean`, add `public import TauCeti.Algebra.Module.ZLattice.RealModel` and `public import TauCeti.LinearAlgebra.IntegralLattice.PosDef.SuccessiveMinima`.
2. Move `euclideanUnitBall` into a Layer 1 section and add:

```lean
/-- The squared-norm successive minima of a positive definite integral lattice are the squares of
the body minima of its real model for the unit ball (1.2.14). -/
theorem sqSuccessiveMin_eq_sq_successiveMin {V : Type*} [AddCommGroup V] [Module ℚ V]
    (L : TauCeti.IntegralLattice V) (hL : L.IsPosDef) (i : Fin (finrank ℤ L)) :
    ((L.successiveMinimum i : ℕ) : ℝ) =
      ZLattice.successiveMin (L.realModel hL) euclideanUnitBall
        (Fin.cast (TauCeti.IntegralLattice.RealModelSpace.finrank_eq (M := L) (hM := hL)).symm i) ^ 2 := by
  sorry
```

3. Delete docstring lines 30–32 and README lines 93–95, and list `sqSuccessiveMin_eq_sq_successiveMin` under *Headline signatures*, Layer 1.
4. In §1.2.13a, *Exact supplier contracts* and §1.2.14's *Needs*, cite the Tau Ceti declarations above (with files) in place of IntegralLattices §2F, ThetaSeries 2D `realModel` and SuccessiveMinima 1.4.

The instance check: rank one with Gram `[4]` gives `successiveMinimum = 4` and real model `2ℤ`, so `λ = 2` and `λ² = 4`.

## R02 (P3) — 0.3.2 and 3.4.1 take from roadmaps, or define again, what the pinned Tau Ceti states

Location: `README.md` line 348 and supplier row 245 ("Supplied by ThetaSeries §2C / **Covolume, determinant, index**, `ThetaSeries.covolume_dual`"). Line 1209 defines `latticeThetaSeries` and proves `thetaSeries_realModel`. Line 23 claims ownership of "the theta series of a positive definite lattice on Tau Ceti's integral-lattice carrier".

Claim: these objects are owned here or supplied by ThetaSeries.

Witness: at the Tau Ceti pin:
- `ZLattice.covolume_dual` (`TauCeti/Algebra/Module/ZLattice/Covolume.lean` line 273) and `ZLattice.dual` with its full-lattice instances (`Dual.lean` line 78).
- `ZLattice.thetaSeries` (`TauCeti/NumberTheory/ModularForms/ThetaSeries/Basic.lean` line 102), with `summable_thetaSeries` (190) and `mdifferentiable_thetaSeries` (266).
- `ZLattice.thetaSeries_smul` (`Functoriality.lean` line 74), and the `q`-expansions `hasSum_thetaSeries_qParam` (even) and `hasSum_thetaSeries_qParam_two` (integral) (`ThetaSeries/QExpansion.lean` lines 143, 181).
- `TauCeti.IntegralLattice.qExpansion_two_thetaSeries_realModel_coeff` and `IsEven.qExpansion_thetaSeries_realModel_coeff` (`ThetaSeries/RealModel.lean` lines 39, 48), which give exactly 3.4.1's coefficient statements on the real model.

Repair:
- In 0.3.2 and row 245, cite `ZLattice.covolume_dual` and `ZLattice.dual` (file and line) and keep only the real-span transport as this roadmap's target.
- In 3.4.1, delete the definition `latticeThetaSeries` and the bridge `thetaSeries_realModel`. Use `ZLattice.thetaSeries (L.realModel hL)` and cite the two coefficient theorems, summability, holomorphy and `thetaSeries_smul`. Keep ThetaSeries 3D only for orthogonal sums, which the pin lacks.
- Delete the theta-series clause of the ownership sentence on line 23.
- Keep the Checks on lines 1216–1219; they then test the pinned object.

## R03 (P3) — Lean names attributed to suppliers that the suppliers do not state

Location and witness, checked at the open heads given by `roadmaps show` and at the pins:
- Line 2173 cites GeneralAlgebraicKTheory §2.1's `QCat E` and "supplied API" `quillenQ.ofSpan_eq_iff`, `quillenQ.comp_ofSpan`, `quillenQ.id_ofSpan`. Line 2180 cites `KGroup.zero_eq_exactK0`, `pi1QEquivExactK0`, `KGroup.map` and `kGroup_finiteProduct`; lines 233 and 2338 cite `exactCategory_devissage`. None occurs in GeneralAlgebraicKTheory's README or `Suggested.lean` at #1212. Its §§2.1–2.6 and 4.7–4.8 exist, and only `ExactK0.*` and `ExactStructure.*` names appear there.
- Line 205 cites StableHomotopyKTheory §3.15's `hSpace_isAbelianSpace` and §4.14's `stableGeneralLinearGroup`, `stableElementaryGroup`, `finiteGLBlockSum`; none occurs at #1227. Its §4.14 uses AlgebraicKTheory A1's stable GL, E and block map. Line 205's "stated there without a Lean name" is also false: §3.28 names `IsPlusConstruction.hSpaceRecognition`.
- Lines 209 and 3119 cite `RestrictedRamification.locMap` and `locMap_indep`. ArithmeticGaloisDuality R02.3.1 at #858 names only `RestrictedRamification.galoisGroupS` and `maxUnramifiedOutside`.
- Lines 115 and 2949 cite `TauCeti.linearHomComplex`. No such declaration exists at the pin; the object is Mathlib's `CochainComplex.linearHomComplex` (`Mathlib/Algebra/Homology/HomotopyCategory/HomComplex.lean` line 980).
- Line 115's `DG/Functor.lean` and `CategoryTheory/DG/CochainComplex.lean` are directories at the pin. `mapDGHomotopyCategory` is in `DG/Functor/Basic.lean` and `DG/NaturalTransformation.lean` (line 271), and `dgComp_linearHomComplex` is in `DG/CochainComplex/Basic.lean`.

Repair:
- Cite these suppliers by section, using only names they state. Drop `QCat`, the `quillenQ.*`/`KGroup.*` supplier names, `pi1QEquivExactK0`, `kGroup_finiteProduct`, `exactCategory_devissage`, the three StableHomotopyKTheory §4.14 names and `hSpace_isAbelianSpace`, or present them as this roadmap's own aliases.
- Replace "stated there without a Lean name" with `IsPlusConstruction.hSpaceRecognition`.
- Replace `RestrictedRamification.locMap` with "the localisation maps of R02.3.1".
- Write `CochainComplex.linearHomComplex` (Mathlib) and correct the two paths.

## R04 (P3) — Two 6.8a locators point at the wrong pages of the cited versions

Location: line 2974, "(CDH III, Definition 1.1.2 and surgery diagram (4), pp.16–18.)", and line 2994, "(CDH II, Remark 1.1.7, pp.18–19; …)".

Claim: these locators support the Poincaré-object and isotropic-surgery paragraph and the quotient-structure formula.

Witness:
- In arXiv:2009.07225v4, Definition 1.1.2 is on p.12 and defines *r-symmetric* and *m-quadratic* structures (`cdh-iii` line 535), not Poincaré objects. The surgery statement is Proposition 1.1.13, with Remark 1.1.14's diagram (4), on p.14 (`cdh-iii` lines 641–645).
- In arXiv:2009.07224v5, Remark 1.1.7 starts on p.17 and ends on p.18 (`cdh-ii` lines 852–857).

Repair: read "CDH III, Proposition 1.1.13 and Remark 1.1.14 with surgery diagram (4), p.14" (keep CDH I Definitions 1.1.1, 1.2.1 and 2.1.1, pp.10, 17, 30, which are correct), and "CDH II, Remark 1.1.7, pp.17–18".

## R05 (P3) — `Suggested.lean` states targets of five layers without layer section comments, out of README order

Location: `Suggested.lean` lines 59–78 (the Layer 5 definitions `lllCoefficient`, `IsLLLReduced` and the Layer 4 `ternaryShell` come before Layer 0's `covolume_projection`). No `/-! ## Layer k: … -/` comment appears anywhere.

Claim: the file meets the Lean form rules.

Witness: the form rules require `/-! ## Layer k: <title> -/` section comments in README order where the file states targets of several layers. Here the file states targets of Layers 0, 2, 3, 4 and 5 (70 of the 141 `Suggested.lean` files on main carry such comments).

Repair, tested together with R01 on the scratch copy (24 `sorry` warnings, nothing else):
- Insert `/-! ## Layer 0: Lattices, Gram determinants and covolumes -/` before `section Covolumes`, and likewise for Layers 1–5 with the README layer titles.
- Move `section ReductionConvention` into the Layer 5 block before `lll_short_vector_factor`, and `ternaryShell` into Layer 4 before `duke_sphere_equidistribution`.

## R06 (P3) — Checks that name Lean counterparts, and a history sentence

Location and witness:
- Line 2691 (6.6a Check): "The Lean boundary target `freeFGAb_not_sFiltering` states the free-group obstruction to `descend_inflation`." A Check never names a Lean counterpart, and no file declares this name.
- Line 1066 (`genusMass` Check): "outside the nonempty hypothesis of `genusMass_pos`". `genusMass_pos` is stated nowhere: it is neither a target of 3.3 nor declared in `Suggested.lean`.
- Line 113: "(Tau Ceti has moved both from its `TauCeti` namespace to the root namespace; 4.2 opens `TauCeti`, so the short names resolve on either side of that move)". This is library-history narrative. At the pin both declarations are `ContRepresentation.IsUnitary` and `ContRepresentation.matrixCoeff` (`TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean` line 30, `namespace ContRepresentation`).

Repair:
- End the line 2691 Check at "cannot automatically be justified by this four-condition theorem."
- On line 1066, read "outside the nonempty-genus hypothesis of the positivity statement in the basic theory".
- Replace the parenthesis on line 113 by the root names with their file.

## Previous findings

- **R01 (P2, HomotopySpheres re-planned): repaired.**
  - `### From TauCetiRoadmap.HomotopySpheres` (line 197) again consumes §3A.3, §7B.2–7B.4 and §7C.1–7C.3. All six sections resolve at #1287 (head `b3f62ce`), at its README lines 868, 2388, 2396, 2416 and 2484–2502.
  - The four §6.8 Wall-form paragraphs and `sphereSuspensionHom`/`stableStem` are gone. `sphereSpectrumHomotopyIso` (line 2264) now compares "with HomotopySpheres' stable stems".
  - 6.10a (line 3184) consumes HomotopySpheres, and the three Arf declarations are gone from `Suggested.lean`.
- **R02 (P2, PointProcesses re-planned): repaired.**
  - `### From TauCetiRoadmap.PointProcesses` (line 193) is restored.
  - Every cited name resolves at #417 (head `234a33d`): `PointMeasure.ofTuple`, `campbellMeasure`, `campbellMeasure_fst`, `lintegral_campbellMeasure`, `IsPoissonRandomMeasure`, `poissonLaw`, `isPoissonRandomMeasure_id_poissonLaw` and `map_eq_poissonLaw` (its `Suggested.lean` lines 127, 229, 244, 249, 382, 396, 400, 404). Its Layer 6 **Build, operations** covers restriction and colour splitting (README lines 1283–1296).
  - The Campbell and Poisson-law paragraphs and declarations are deleted, and **Finite Poisson sampling** (line 1492) keeps `poissonLaw_smul_eq_map` as asked.
- **R03 (P3, `[Fintype F]`): repaired.** Lines 137–146 now read `def hermitianEmbeddingCount [Finite A]`, with `Nat.card`, and `[Finite F] … (hcard : Nat.card F = q ^ 2)`. The gate's statement-hygiene check is 0.
- **R04 (P3, old ids): repaired.** Lines 29–43 map §0.1, §§1.2–1.5, the §1.3 renumbering and the old §6.1a names. Each target resolves: SuccessiveMinima 0.1.2, 1.5, 2.1.4–2.1.6 and 2.2.2 on main, and Tau Ceti `ZLattice.successiveMin_pos` (line 424), `monotone_successiveMin` (416) and `prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume` (`MinkowskiSecond.lean` line 626). DiophantineApproximationAndTranscendence's citations (its lines 44–59) and LatticePackingsAndPerfectForms' "§1.3" (its line 265) are covered.
- **R05 (P3, locators): repaired.**
  - 4.4.3 reads "Evertse, Theorem 2.20 … printed pp.32–33".
  - 4.4.1 cites Dutour Sikirić–Schürmann–Vallentin §1, p.1, which defines the packing radius as half the minimum distance (`DutourSikiricSchurmannVallentin2009` line 23).
  - 4.4.4 and 4.4.6 read p.2 with (1)–(2) (`Regev2004` lines 79–87).
  - 6.2.1 reads "Definition 2.1 and Example 2.2, printed p.109".
  - 6.2.2 reads "Definition 2.4, printed p.110, and Definition 3.1, printed p.113" (`Schlichting2010` lines 205 and 360–367).
- **R06 (P3, cofinal restated): repaired.** 6.6.1 (line 2661) is a definition, with four Checks, located at `Schlichting2010` lines 171–175 (p.109) and 813–815 (p.124).
- **R07 (P3, Checks and prose): repaired.**
  - The 2.9.6 Check ends at "cannot define a hyperbolic bilinear form in characteristic two" (line 797).
  - The infinite-dimensional adjoint Check is under `SignedHermitianSpace` (line 759).
  - The RandomMatrices row is gone, the five capitalised verbs and "an TauCeti" are fixed, and 2.9.1 (line 761) states KSS Lemma 3.1 as asked.
  - R06 above records a Check slip that was present before this round but was not reported.

## Verified sound

**Gate, build and signatures.**
- The gate rerun on this head with the brief's command prints `… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (every check 0).
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `lake env lean` on `Suggested.lean` gives 23 `declaration uses sorry` warnings (lines 85 … 508) and no error.
- The `module` / `public import` header matches 11 `Suggested.lean` files on main, and the gate accepts it.
- All 11 "looks dropped" leads of `signatures.md` are false positives:
  - `hρ`, `hμ`, `hU` and `hΓ` are present as anonymous hypotheses in the elaborated types of the Ratner, Mahler, Dani–Margulis and Siegel theorems.
  - `StarBody`, `admissible` and `IsFiniteType` do not use `[FiniteDimensional ℝ E]`, nor does `latticeCoveringRadius` use `[InnerProductSpace ℝ E]`.
- Each elaborated type was compared with its README statement; no binder is lost.

**Dependency check**, verbatim: `depcheck: 240 roadmaps, 2448 edges, 0 problem(s)`.
- HomotopySpheres is at line 72 of the order, this roadmap at 74, ArithmeticGaloisDuality at 47, LFunctions at 28 and StableHomotopyKTheory at 17.
- PointProcesses is a new-roadmap pull request by another author (admissible).
- ThetaSeries, SuccessiveMinima, EnhancedDerivedSheaves, GeneralizedCohomology, BordismFormalGroups, TopologicalKTheory, DGAInfinity, AlgebraicTopology, ComplexTori, PivotalSpherical and ReductiveGroupsPartII are on main.

**Padding probe.** On a scratch copy, every `sorry` was replaced by `first | (rfl; done) | (infer_instance; done) | (simp; done) | (norm_num; done) | (trivial; done) | (positivity; done) | (aesop; done)`. All 23 theorems fail, so none is padding by that test. No declaration restates a definition, mirrors a Check or computes a small value.

**Library declarations opened at the pins.**
- Tau Ceti `2fd255d`:
  - `ZLattice.successiveMin` and its API (`SuccessiveMinima.lean` lines 111–586); `prod_successiveMin_mul_measure_le_two_pow_mul_covolume` (`MinkowskiSecond.lean` line 610).
  - The R01/R02 declarations above.
  - 65 further Tau Ceti names of *From Tau Ceti*, *Already in Mathlib or Tau Ceti* and §§3.4, 4.2, 4.3 and 6.8a, found by a declaration grep on the final name component. These include the 15 spinor-norm names, `TauCeti.hurwitzClassNumber` (`HurwitzClassNumber.lean` line 90; `H 0 = −1/12`, a ℚ-valued sum of reduced-form weights), `hurwitzClassNumber_eq_finsum`, `_three`, `_four`, `_twelve` and `_sixteen`, `TauCeti.Probability.fixedSpace` (`Probability/Ergodic/FixedSpace.lean` line 43) and the DG declarations. The only exception is `TauCeti.linearHomComplex` (R03).
- No Tau Ceti module states hermitian local densities, hermitian integral lattices, Grothendieck–Witt groups, Howe–Moore, Ratner, LLL, critical lattices or Siegel transforms (grep). This confirms the docstring's other non-statability statements and the ownership of those objects.
- Mathlib: 60 names from *From Mathlib* and the *Needs* lines of 0.2–1.1, 4.1, 4.4 and 5.1 resolve by declaration grep. Mathlib has the residue class number formula `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`; 4.3's `quadraticClassNumberFormula` (L(1, χ_d)) is a different statement.

**Cross-roadmap citations resolved.**
- QuadraticFormInvariants Layers 1–6 and 9 on main (layer headings at its lines 1058, 1145, 1242, 1338, 1460, 1600, 2797). Layer 6's "isometric iff (dim, d, s) agree" is at line 581 of that file, supporting 2.1.5.
- GlobalQuadraticForms Layers 5–6 (its lines 544, 692).
- IntegralLattices 2F and 7E on main (lines 801, 1869). The `overlaps.md` lead that only #1239 defines them is false, as in r8.
- AlgebraicTopology Stage 4 item 4 (`reducedSuspensionSphereHomeomorph` and the reduced suspension, its lines 535–560) and `kanCubicalHomotopyComparison` (line 1657).
- LFunctions names of 3.3 and 4.3, including `Grossencharacter.mixedFourier_harmonicFactor_mul_archGaussian` (README and `Suggested.lean` on main).
- ComplexTori `cyclicNormHom`, `oneSubPow`, `normHomCompSub` and `subCompNormHom`.
- GeneralAlgebraicKTheory §§1.1–2.6, 4.7–4.8, 5.2–5.11, 11.5–11.16 and 13.8a–c, StableHomotopyKTheory §§3.15, 3.25, 3.28 and 4.14, and ArithmeticGaloisDuality R02.3.1 and R02.4.1–R02.4.4 exist at their heads (names: R03).

**Ownership against open work.** Checked with `roadmaps grep` and the sibling checkouts. The open roadmaps that share objects with this one all cite it by section, and every cited id resolves here:
- HalfIntegralWeightModularForms #1721 (`HalfIntegralCuspForm`, theta multiplier, §4.3).
- QSeriesPartitionsAndMockModularForms #1391 (`qPochhammer`, `jacobiProduct`, `appell_lerch_difference_identity`, §4.3).
- LatticePackingsAndPerfectForms #1723 (4.4.1–4.4.2, 4.5.1, `polynomialLaplacian`).
- ProbabilisticAndMetricNumberTheory #1421 (`howe_moore`, `moore_ergodicity`, §4.5, `finitePartitionEntropy` at line 1517).
- QuantitativeOrbitMethod… #1842 (4.2.5, `exists_actionErgodicKernel`).
- GeometryOfNumbersAndQuadraticArithmeticPartII #1691.
- ClassicalArithmeticCompletion on main (§4.3).
No two-owner object was found among these.

**Sources read at their locators** (keys are fetch keys; lines are into the sources cache).
- 1.1: `couveignes-2020` (arXiv v2) p.6, lines 220–233: ball volume `≥ 2^ℓ ℓ^(−ℓ/2)`, ordered product, `ℓ+1−i` roots.
- 1.2: `Evertse2023` §2.3, Lemma 2.8 and proof, lines 403–431 (printed pp.23–24). Tau Ceti as in R01.
- 2.1: QuadraticFormInvariants and GlobalQuadraticForms, as above.
- 2.7: `li-zhang-2019` §1.7, lines 295–319 (p.8), and §3 scope, lines 596–598 (p.15).
- 2.8: `emery-kim-2022-vor` (Forum Math. Sigma version of record, open access) §5.1, lines 475–489 (p.10); Lemma 5.1, lines 494–498, and Lemma 5.2, lines 504–508 (p.11).
- 2.9: `KurinczukSkodlerackStevens2020`:
  - Lemma 3.1, lines 457–474 (p.10) and §3.2, line 521 (p.12);
  - §3.3 adjoint and twist, lines 610–631 (pp.13–14);
  - Proposition 3.12, line 650, and γ-twist, lines 666–671 (p.14);
  - §3.5, line 674, and Propositions 3.13–3.14, lines 694–713 (p.15).
- 3.1: `li-zhang-2019` §3.1, lines 599–608 (p.15), and the proof of Theorem 3.5.1, lines 698–711 (p.18), which counts with `q^{n(2m−n)} ∏_{i=0}^{n+a−1}(1−(−q)^{i−m})`.
- 3.2:
  - `li-zhang-2019` (3.1.0.2), (3.2.0.1), (3.2.0.2), m(a;X) and Theorem 3.5.1, lines 610–694 (pp.16–17), and Example 3.5.2, line 712.
  - `cho-yamauchi` Definition 3.1, line 553 (p.11); Lemma 3.4, line 621 (p.12); Corollary 3.5, line 670 (p.13); Theorem 3.9, Lemma 3.10, Corollary 3.11 and Theorem 3.12, lines 755–790 (p.15); (3.4), line 821 (p.16).
  - `hironaka`: (1.2) line 104 (p.3), (1.4) line 164 (p.4); Theorem 2.3, line 502 (p.10); Theorem 2.6 with Γ_σ, lines 950–959 (p.15); Corollary 2.7, line 1005 (p.16); (5.1) line 1679 (p.27); Lemma 5.1 and Theorem 5.2, lines 1709–1736 (p.28); Proposition 5.3, line 1789 (p.29); Corollary 5.4, line 1833 (p.30); Theorem 5.6, lines 1886–1891 (p.31).
- 4.3:
  - `morris` Corollary 20.2.5, lines 17141–17148 (printed pp.410–411), Exercise #3, line 17193; Theorems 20.1.3 (p.406), 20.3.3 and 20.3.4 (p.413), A4.9 (p.436), A7.7 (p.443), 4.5.1 (p.56), 4.6.3 (p.61).
  - `duke-1988` p.74, lines 37–63.
  - `osullivan` Theorems 5.1–5.4 (pp.14–16) and Lemma 5.5, Theorem 5.6 and Lemma 5.7 (p.17).
  - `mortenson-2016` Theorem 1.1, lines 91–127 (p.2): its kernel, the three theta terms and the correction term with factor 2 equal 4.3's `kroneckerSummand`, T and C.
- 4.4: `Regev2004` Definition 2, Example 1, Claim 3 and Theorem 4, lines 53–77 (p.2). `Henk2002` Theorem 1.5, lines 109–116 (p.3).
- 4.5: `mahler-1946` Definitions 3–4, lines 216–228 (pp.156–157); Definitions 5–6 and Theorem 4, lines 244–248 (p.157); §6 and Theorems 6–7, lines 278–296 (p.158); Theorem 8 and proof (7.1)–(7.3), lines 303–331 (p.159). `Benoist2019` Fact 1.5, line 171 (p.7), and Facts 3.3–3.4, lines 771–792 (p.20).
- 5.1: `lll-1982` (OCR) (1.2)–(1.4), lines 73–82 (p.2); (1.5)–(1.7) and the proof of (1.6), lines 89–134 (p.3); (1.11), lines 143–150 (p.4).
- 6.1a: `lurie-ha` (September 2017):
  - Definition 1.1.1.9, line 658 (pp.19–20); Theorem 1.1.2.14, line 1008 (p.27); Proposition 1.1.3.4, line 1193 (p.31); Proposition 1.1.3.6, line 1259 (p.32);
  - Construction 1.3.1.6 (p.81) and Proposition 1.3.1.10 (p.82);
  - Corollary 1.4.2.17, line 5519 (p.146); Corollary 1.4.2.23 and Proposition 1.4.2.24, lines 5563–5569 (p.147); Definition 1.4.3.1, line 5675 (p.150); Proposition 1.4.3.6, line 5707 (p.151);
  - Theorem 7.1.2.13, line 46530 (p.1212).
- 6.6: `Schlichting2010` §2.1, lines 171–175 (p.109); §5.1, lines 811–815 (p.124); §§5.2–5.3, lines 839–878 (pp.125–126); Theorem 5.1 and proof, lines 886–948 (pp.126–127); Corollary 5.2, line 949 (p.127).
- 6.8: `Schlichting2010` §4.3 formations, Proposition 4.9 and Lemma 4.10 (pp.119–121), as in r8. The rational parity map checks out: Lagrangians of a split rational space lie in two families, distinguished by the parity of `dim L₁ − dim(L₁∩L₂)`.
- 6.8a:
  - `schlichting-derived` Example 1.4, lines 438–446 (p.10); Definitions 1.24, 1.26 and Examples 1.25, 1.27, lines 873–911 (pp.18–19); Definition 1.29, line 992 (p.20); Example 1.30, lines 1002–1013 (p.21); §1.11, lines 1047–1068 (p.22); Definition 1.35, line 1149 (p.24).
  - `cdh-i` Definitions 1.1.1 (p.10), 1.2.1 (p.17) and 2.1.1 (p.30); Lemma 3.2.5 and Construction 3.2.6 (p.52); Example 3.2.8 (p.53); 4.2.2–4.2.5 (p.68); Remark 4.2.16 (p.70); Proposition 4.2.22 (p.73).
  - `cdh-ii` Definitions 4.1.1 and 4.2.1 and Corollaries 4.2.3 and 4.2.7 (pp.97–100); Definition 3.6.10 (p.92); Theorem 4.4.2, Lemma 4.4.3 and Definition 4.4.4 (pp.103–105); 3.5.6, 3.5.8, 3.6.5 and 3.6.7 (pp.87–90); 4.4.11, 4.4.13 and 4.5.1 (pp.106–107); B.2.1–B.2.4 (pp.143–144).
  - `cdh-iii` R.4 and R.6 (pp.8–9); 1.1.4 (p.12); 1.2.12 (p.18); 1.2.22 (p.21); 1.3.8 and 1.3.9 (p.30); 1.3.14 (p.31); 1.3.15 and 1.3.16 (p.32); 2.2.2 (p.37); 2.2.4 and 2.2.5 (pp.38–39); 2.3.13 (p.46); 3.1.11 and 3.1.13 (p.53); 3.1.14 (p.54); 3.2.7 (p.58); 3.2.10 (p.59).
  - `hebestreit-steimle` Definition 3.1.1 (p.16); 3.2.1–3.2.4 (p.21); Theorem 5.2.1 (p.48); Theorem 6.4.1 (p.58); Theorem 7.2.1 (p.67); Corollary 8.1.2 (p.69).
  - The exceptions are R04.

**Adversarial table.** One row per statement; values computed on each side.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.3.1 `covolume_projection` | ℤ², `W=ℝ(1,1)`; `W=0`; `W=E`; `Δ=2ℤe₁⊕3ℤe₂`, `W=ℝe₁` | comap `ℤ(1,1)`, covol `√2`; image `ℤ(½,−½)` covol `1/√2 = 1/√2`; `covolΔ/1`; `1 = covolΔ/covolΔ`; `3 = 6/2` | holds | none |
| 0.3.3 `primitive_orthogonal_covolume` | ℤ², `W=ℝ(1,2)`; `W=0` | `ℤ(1,2)`, `ℤ(2,−1)`: `√5 = √5`; zero space covol 1 = covol ℤ² = 1 (self-dual) | holds | none |
| 1.1.1–1.1.5 | `(1,2,4)`; `(½,2)`; cube `n=2,r=3`; ball `n=4` | tails `1,4,4 ≤ 8`; `2 > 1` without `a_j≥1`; `36`, not `9`; `(2/√4)⁴ = 1` | holds | none |
| 1.2.13a (pinned `successiveMinimum`) | `[4]`; `diag(1,4)`; `A₂` | `4` (threshold 3 fails); `(1,4)`; `(2,2)` | holds | R01 (cite pin) |
| 1.2.14 `sqSuccessiveMin_eq_sq_successiveMin` | `[4]`; `diag(1,4)`; `I₂`; rank 0 | `4 = 2²`; `(1,4) = (1²,2²)`; `(1,1)`; `Fin 0` vacuous | holds; elaborates at pins | R01 |
| 2.1.2 discriminant scaling | `B=[2]` (`q=x²`); hyperbolic `B=[[0,1],[1,0]]` | `2⁻¹·2 = 1`; `2⁻²·(−1) ≡ −1`, signed `(−1)¹(−1) = 1` | holds | none |
| 2.1.5 local classification | `⟨1,1⟩`, `⟨1,−1⟩` over ℚ₃ | dims 2, 2; discriminants `1` vs `−1`, `−1` a nonsquare mod 3 | not isometric; matches QFI Layer 6 | none |
| 2.6.11 `atomic_normal_form` | `x²+xy+ty²` over `𝔽₂[[t]]`; `xy` over ℤ₂; `x²+3y²` over ℤ₃; zero form rank 2; `M=0` | `v(b)=0 < v(2a)=∞ ≤ ∞`, `a` unit → one binary block; `[0,1,0]` binary; exponents `0,1`; `s=0,z=2`; `s=z=0` | holds in every characteristic | none |
| 2.6.4 splitting coefficients | solve `T(vᵢ, x+αv₁+βv₂)=0` | `α=(BT₂−CT₁)/d`, `β=(BT₁−AT₂)/d`; valuations `≥0`, `>0` | integral | none |
| 2.4.6 reflection | `xy` over ℤ₂, `v=(1,1)`; `v=(1,2)` | `s_v(a,b)=(−b,−a)`; `s_v(0,1)=(−½,0)` | least valuation load-bearing | none |
| 2.7.3 invariants | Gram `π³`; invariants `(0,1,1)` | val 3, type 1, not vertex; val 2, type 2, vertex; `#L∨/L = q^{2·val}` | matches Li–Zhang §1.7 | none |
| 2.8.4 adjoint inverse | `φ(eᵢ)=eᵢ*aᵢ` | `φ(eᵢaᵢ⁻¹) = eᵢ*aᵢaᵢ⁻¹ = eᵢ*` | matches Emery–Kim Lemma 5.1 | none |
| 2.8.1 Lipschitz Check | `h(i,i)`; `(1+i+j+k)/2` | `(−i)i = 1`; not in `ℤ⟨1,i,j,k⟩` | holds | none |
| 2.9.1 norm group | ramified `F₀(√π)`; unramified `F₀(√ε)` | `−π=N(√π)`, unit norms = unit squares; unramified: every unit an `F`-square, odd valuation never | `(F²∩even)∪(−F²∩odd)` both cases | none |
| 2.9.2–2.9.4 | hyperbolic `[[0,1],[ε,0]]`; `⟨1⟩⊥⟨1⟩` | det `−ε`; zero iff `−1 ∈ N`; order 4 | KSS §3.2, Prop. 3.12 | none |
| 2.9.3 twist | `ā=ηa` | `a*(h)` is `ηε`-hermitian; adjoint `b ↦ a⁻¹b̄a` | KSS p.14 | none |
| 3.1.3 `finite_hermitian_isometry_formula` | `q=2`: `(n,m,a)=(1,1,0),(1,1,1),(1,2,0),(1,2,1),(2,2,0)` | direct counts `3, 0, 6, 9, 18`; formula `2·3/2, 0, 8·¾, 8·¾·3/2, 16·¾·3/2` | equal | none |
| 3.1.1 count | ℤ/3, `G=B=1`; `G=1,B=0`; `n=0` | `2`; `1`; `1` | holds | none |
| 3.2.1 normalised count | `x²=1` over ℤ/3 at `N=0,1` | `2`, `2/3` | holds | none |
| 3.2.4/3.2.6 Siegel polynomial | rank 1, `a=1,2,3` | `1−X`; `1−X+X²`; `1−X+X²−X³` | Li–Zhang Ex. 3.5.2 | none |
| 3.2.5 weights | `a=0,1,2` | `0, 1, 1+q` | matches `m(a)` | none |
| 3.2.7 functional equation | `n=1`, `a=1,2` | `qY(1+q·q⁻²Y⁻¹) = 1+qY`; `q²Y²(1+q⁻¹Y⁻¹+q⁻²Y⁻²) = g_T` | Hironaka Thm 5.6 | none |
| Hironaka `Γ_σ` | long root `2eₙ` | factor 1 (his (2.15)) | holds | none |
| norm Gaussian | `q=2`, `e=0,1,2` | `1`, `(1+3·(−1))/4 = −½`, `¼` | `(−q)^{−e}` | none |
| 3.3.6 doubling | stabilizer 2 with improper; 4 without | `½ → 1`; `¼ → ¼+¼` | doubles | none |
| 3.3.8 local factors | `q=2,r=1` types I, II±; `q=3,r=2` I, II | `3/6=½`, `3/2`, `½`; `2·8/8=2`, `4·10/8=5` | Kirschmer Def. 3.1 | none |
| 3.4 theta (pinned object) | ℤ; ℤ²; rank 0 | coefficients `2,0,0,2`; `4,4`; `1` | holds | R02 |
| 4.1.12 `lattice_count_lt_successive_minima` | ℤ², `[−1,1]²`; `d=1`, `[−1,1]` | `9 < 18`; `3 = 3` | `d≥2` load-bearing; Henk Thm 1.5 | none |
| 4.1.13 `davenport_multiset_estimate` | `n=1`; unit square, shear `(x,y+Mx)` | `sSup ∅ = 0`, bound `C`; count 4, projections 1 | uniform in shear | none |
| `howe_moore` | `SL₂(ℝ)`; `ℝ` with `e^{it}` | finite centre, simple; `ℝ` abelian, excluded | hypotheses load-bearing | none |
| `moore_ergodicity` | compact `K` | excluded by `hnc` | holds | none |
| 4.2.3 `dani_margulis_nondivergence` | `u≡1` | `C={x}`, occupation `T ≥ (1−ε)T` | Benoist Fact 3.4 | none |
| Ratner 4.2.4–4.2.6 | `U` trivial; periodic horocycle; identity flow | closure `{x}`, Dirac; `L=U`, circle Haar; average `f(x)` | holds | none |
| `oppenheim_values` | `x²+y²−√2z²`; `x²+y²−z²`; `x²−(3+2√2)y²` | dense; `hirr` fails with `c=1`; `\|N\|(a+αb)/(a−α′b) ≥ 1` | hypotheses load-bearing; Morris 20.2.5 | none |
| `duke_sphere_equidistribution` | `n≡7 (8)`; exponent | shell empty, filtered out; `3/4−2/7−1/2 = −1/28` | Duke p.74 | none |
| `three_square_hurwitz` | `n=1,2,3,4,7` | `12·½=6`; `12`; `12(4/3−2/3)=8`; `12(3/2−1)=6`; `12(2−2)=0` | holds | none |
| `siegel_three_square_lower_bound` | `n=1,2,3`; `n=7` | `6, 12, 8 > 0`; excluded | holds | none |
| `euclidean_dual_transference_upper` | `aℤ`; rectangle `(1,0),(0,k)` | `a·(1/a)=1`; paired `1·1`, `k·(1/k)`; equal index `k > 2` | `rev` load-bearing | none |
| `covering_dual_transference` | `aℤ`; ℤⁿ; rectangle `k=4` | `½`; `√n/2 ≤ n`; `√17/8 ∈ [½,2]` | Regev Claim 3, Thm 4 | none |
| `critical_lattice_exists` | `\|x\|`; `\|x\|/2`; disc; `√\|xy\|` | `Δ=1`, ℤ; `Δ=2`, `2ℤ`; `√3/2`, hexagonal; `√5`, `O_{ℚ(√5)}` | Mahler Thm 8 (no evenness used) | none |
| `criticalDeterminant` | strip `\|x\|` | no admissible lattice, `sInf ∅ = 0` (Mahler: ∞) | junk value documented | none |
| `mahler_relativelyCompact_iff` | `diag(t,1/t)ℤ²`, `t→0` | first minimum `t → 0`; not relatively compact | both sides false | none |
| `siegel_mean_value` | `n=1`, `1_{[−½,½]}`; ball | `0` vs `1`, excluded by `n≥2`; expected count = volume | holds | none |
| `IsLLLReduced`, `lll_short_vector_factor` | `((1,0),(½,1))`; `((2,0),(0,1))`; `n=1` | `1 ≥ (¾−¼)·1`; `1 < ¾·4` fails; factor `2⁰` | LLL (1.4)–(1.11) | none |
| 6.6.1 cofinal | free ⊂ projective; even ⊂ all dimensions | `P⊕Q≅Rⁿ`; `T=k` | Schlichting §5.1 | none |
| 6.6.4 | Corollary 5.2 | `GWᵢ` iso `i≥1`, mono `i=0` | as stated | none |
| 6.8 parity | `H(ℚ)` coordinate pair; `H(ℚ)⊥H(ℚ)`, `(span(e₁,e₂),span(e₁,f₂))` | `δ=1`; `δ=2−1=1`, reduction by `ℚe₁` keeps 1 | two Lagrangian families | none |
| 6.8a signs | dual differential `i=−1,0,1`; morphism sign `(i,j)=(1,2),(0,1),(−1,1)`; `ℚ[0]→(ℚ→ℚ)` | `+,−,+`; `+,−,+`; `D(δf)⁻¹ = −id = δ(Df)⁻¹` | chain law holds with `j(j−i)`, fails with `i(j−i)` | none (E17 confirmed) |
| 6.8a residue line | ℤ, `p=(2)`, `(3)` | `Hom(2ℤ,ℤ)/res ≅ ℤ/2`; `ℤ/3` | holds | none |
| 6.11.10 | `Lgq₀→Lgs₀ = ×8` | kernel 0, cokernel `ℤ/8`; `C₁=ℤ/2`, `C₋₁=ℤ/2` | holds | none |

## Not verifiable

- Couveignes 2020, published p.494 (1.1): the service has no licence class for the Annals host, so I read arXiv:1907.13617v2, which has the §3 content on its p.6. The published page number remains unchecked.
- Iwaniec 1987 (4.3 `halfIntegralCoefficientBound`): the service refuses the Springer DOI (paywalled). Duke p.74 confirms the exponent `k/2−2/7` it quotes.
- Siegel 1935 (4.3): the IMPAN landing page is on a host in no licence class; not read.
- Banaszczyk 1993 (4.4.13), Margulis–Tomanov 1994, Weil 1964/1965, Sansuc 1981, Gross–Gan 1999, Davenport 1951, Siegel 1945, Quillen, Waldhausen, Segal, McDuff–Segal, Conway–Sloane, Platonov–Rapinchuk–Rapinchuk and Ranicki 1981: these are paywalled, are books, or were not fetched this round. None is a locator of the sampled sections except Banaszczyk and Iwaniec, which Regev p.1 (`Regev2004` line 31) and Duke p.74 corroborate.
- Ownership against AnalyticNumberTheoryPartI (#1126) and ImaginaryQuadraticClassNumber (#1914), which also mention Siegel's theorem and the quadratic class number formula of 4.3, was not checked: the brief gives no checkout of either.

## Source issues

- **Misprint** in schlichting-derived at Example 1.30, printed p.21: the source writes the component map as `E(Mⁱ,Nʲ)→E(N⁻ⁱ,M⁻ʲ)` with sign `(−1)^{i(j−i)}`; it should map `(Nʲ)*=(N*)^{−j}` to `(Mⁱ)*=(M*)^{−i}` with sign `(−1)^{j(j−i)}`, as its §1.11 convention gives; affects a stated result.
- **Misprint** in morris at the prose before Theorem 20.3.3, printed p.413: the source summarises the orbit-closure theorem for any one-parameter subgroup U; it should say one-parameter unipotent subgroup, as Theorem 20.3.3 itself does; affects nothing.
