# Review of GeometryOfNumbersAndQuadraticArithmetic (pull request #851 at 4c5dbb9)

**Verdict:** needs changes

The gate fails on this head (one forbidden import, nine UPWARD edges, one CYCLE); the targeted build itself passes (`sorry` the only warning, 24 declarations). The mathematics of the sampled targets and of every headline statement checked out under the adversarial pass below; the blocking findings are about supply direction, ownership and the acceptance test's imports, not about false statements.

## R01 (P1) — Supply cycle through OrthogonalSpinGroups and OrthogonalTamagawaAndLatticeMass, with an ownership contradiction against main

Location: `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md` lines 29, 122, 852 ("§3.3 is the canonical owner of `orthogonalTamagawa_two` … and `smoothMaximalOrthogonalModel`"; "From TauCetiRoadmap.OrthogonalSpinGroups … consumed by 2.4").

Claim: this roadmap consumes OrthogonalSpinGroups 1D, 2F and 3F and owns the orthogonal Tamagawa number, the orthogonal gauges and the smooth maximal-lattice models that OrthogonalTamagawaAndLatticeMass consumes.

Witness: the dependency check prints `CYCLE among: GeometryOfNumbersAndQuadraticArithmetic, OrthogonalSpinGroups, OrthogonalTamagawaAndLatticeMass`. OrthogonalSpinGroups on main (README line 30) names OrthogonalTamagawaAndLatticeMass "the single named owner of the orthogonal Tamagawa number, the mass formula, and the density statements"; OrthogonalTamagawaAndLatticeMass at its open head (README line 11) consumes "GeometryOfNumbersAndQuadraticArithmetic §§2.4/3.3". So main assigns the Tamagawa and mass ownership to a roadmap that in turn imports it from here, and the edge back through OrthogonalSpinGroups closes the cycle.

Repair: break the cycle by moving ownership, in one of two ways. (a) Let OrthogonalTamagawaAndLatticeMass keep the ownership main already gives it: delete `orthogonalTamagawa_two`, `orthogonalPinnedGaugeJacobian`, `compactOrthogonalGaugeVolume`, `smoothMaximalOrthogonalModel`, the dyadic maximal-lattice congruence theory and the maximal-lattice mass formula 3.3.5 from §3.3, keep here only the finite stabilizers, class-set finiteness and the genus mass 3.3.1–3.3.3 and 3.3.6, and list the moved material under *Scope and ownership* as deferred to that roadmap. (b) Keep §3.3 as written but remove every citation of OrthogonalSpinGroups: 2.4.2–2.4.5 can cite Tau Ceti's `CliffordAlgebra.spinorNorm` and `TauCeti.QuadraticMap.OrthogonalCompactOpens.adelicSpinorNorm` directly (both at the pin: `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Isometry.lean` and `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/AdelicSpinorNorm.lean`) and state the nondyadic local image 2.4.2 as the target it already is, so that OrthogonalSpinGroups is no longer a supplier; then the contradiction with OrthogonalSpinGroups' ownership statement on main must still be resolved, which means (a) in any case for the Tamagawa number and the mass formula. Rerun the dependency check after the edit; it must print no CYCLE line.

## R02 (P2) — `Suggested.lean` imports another roadmap's module; four headlines are not statable at the pins without it

Location: `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/Suggested.lean` line 5 (`import TauCetiRoadmap.SuccessiveMinima.Suggested`), used at lines 171, 192, 372, 381.

Claim: the file states the headline theorems against the pinned Mathlib and Tau Ceti.

Witness: the gate reports `imports (1)`; the rule allows `import Mathlib` and `TauCeti.*` modules only. Grepping the pinned Tau Ceti for `successiveMin` finds nothing (`TauCeti/NumberTheory/GeometryOfNumbers/` contains only `BoundaryCount`, `Doubling`, `LatticePointCount`, `RankTwoDoubling`), so the carrier `TauCetiRoadmap.SuccessiveMinima.successiveMin` exists only in SuccessiveMinima's own `Suggested.lean` (its line 156). A local copy would plan SuccessiveMinima's object a second time.

Repair: delete line 5. Remove `prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`, `lattice_count_lt_successive_minima`, `euclidean_dual_transference_upper` and `covering_dual_transference` from the file (the README keeps 1.3.3, 4.1.12, 4.4.13 and 4.4.14 as targets), and name them in the module docstring as not statable at the pins because the successive-minima carrier is SuccessiveMinima's and is not in the pinned libraries. Update README lines 57–77 (*Headline signatures*) accordingly. Tested: the remaining file elaborates with `import Mathlib` plus the three `TauCeti.*` lines; `SuccessiveMinima.successiveMin` is the only identifier the removed import supplied.

## R03 (P2) — Nine upward supplier edges in the merge order; the roadmap is not movable past them

Location: `README.md` lines 114–122, 150–180, 216, 228–229, 417, 424, 514–519, 626, 852, 1136, 1148, 1162, 1482, 2285–2287, 3126, 3189–3191.

Claim: the suppliers cited there precede this roadmap.

Witness: the dependency check output (full text under *Verified sound*) lists UPWARD edges to ClassFieldTheory (#262), DifferentialGeometry (#221), GlobalQuadraticForms (#317), HomotopySpheres (#241), IntegralLattices (#242), LFunctions (#301), OrthogonalSpinGroups (#290), ProfiniteCohomology (#376) and RepresentationTheory (#180) against this roadmap's position #69, and says the roadmap is "not movable" because EffectiveBoundsPartII (#97) consumes it and precedes ProfiniteCohomology. Seven of the nine are roadmaps on main and two (HomotopySpheres, LFunctions) are other authors' open pull requests adding new folders; the brief's supplier rule admits both kinds, so these lines may be false positives of the ordering rather than defects of the citations, and the board has to settle the placement. They are reported because the gate rule is binding and the roadmap cannot be moved below EffectiveBoundsPartII's position without moving that consumer too.

Repair (author side, where possible): reduce the edge set. The OrthogonalSpinGroups edge disappears with R01(b). The DifferentialGeometry edge (3.3's Riemannian density comparison) and the ProfiniteCohomology edge (6.10's `cd_p`) each serve one comparison target and can be restated here as targets with their hypotheses, with the move recorded under *Scope and ownership*. The remaining edges are the board's to order.

## R04 (P2) — Squared-norm minima are consumed from Tau Ceti declarations that do not exist at the pin, with pin narrative in place of a supplier

Location: `README.md` §1.2.13a (line 417: "Tau Ceti's module `TauCeti.LinearAlgebra.IntegralLattice.PosDef.SuccessiveMinima` supplies the native squared-minimum API … the module is not at the Tau Ceti pin"), §1.2.14 (line 432, target named `TauCeti.IntegralLattice.successiveMinimum_eq_sq_successiveMin`), §1.3 *Status* (line 444).

Claim: `TauCeti.IntegralLattice.successiveMinimum`, `successiveMinimum_le_iff` and `IsPosSemidef.exists_linearIndependent_integralNorm_eq_successiveMinimum` supply the squared-norm minima and their attainment.

Witness: at the pinned Tau Ceti (`6b7abb3`) the directory `TauCeti/LinearAlgebra/IntegralLattice/PosDef/` holds `Covolume`, `Finite`, `Minimum`, `RepresentationNumber` only; `successiveMinimum` occurs nowhere in the pinned sources (the worker's citation list flags both names). IntegralLattices on main plans these as milestone 2F (its README line 801), so the statement is owned, but the README writes it as supplied by Tau Ceti and tells the reader so only through "not at the Tau Ceti pin".

Repair: in §1.2.13a cite IntegralLattices §2F alone for the squared-norm minimum, its threshold form and its attainment, and delete the four Tau Ceti module and declaration names; rename the 1.2.14 target into this roadmap's namespace (a target of this roadmap must not carry the `TauCeti.` prefix); delete the sentences about revisions and pins in §1.2.13a and the whole *Status* paragraph of §1.3, keeping only the mathematics of 1.3.1–1.3.3 (which are correct and are owned here, since SuccessiveMinima lists the upper inequality under "already in Tau Ceti" and does not plan it).

## R05 (P3) — Process narrative in the Lean docstrings and the README

Location: `Suggested.lean` lines 19–21 ("The successive minima are SuccessiveMinima's `successiveMin`, whose `Suggested.lean` also states …"), 158–160 ("Tau Ceti proves this statement … at a revision later than the pins"); `README.md` line 27 ("until the Tau Ceti dependency reaches that revision"), line 444 (*Status*).

Claim: timeless text.

Witness: the quoted sentences describe pin states and future revisions.

Repair: delete them; the docstring of a stated theorem gives the mathematics and the source only (and after R02 these two theorems leave the file).

## R06 (P3) — Supplier declaration names that do not exist where they are cited

Location: `README.md` line 170 and the supplier table row for LFunctions §0 (`HasDirichletAgreement.completes`); the PivotalSpherical row of the supplier table and §6.1b (`IsFiniteSemisimpleCategory.exists_biproduct_simples`, `multiplicity`).

Witness: LFunctions at its open head (#248) has `HasDirichletAgreement` (README line 872) but no `completes` field in its README or `Suggested.lean`; the name occurs only in ZerosOfLFunctions (#253, README). PivotalSpherical on main, Layer 3 (README lines 352–386), names `SimpleClasses C` and describes "The decomposition API" in prose; it names no `exists_biproduct_simples` and no `multiplicity`.

Repair: cite LFunctions §0 and §3 by their statements (`completedDedekindZeta_eq` carries the conductor power and Gamma factors and does exist at that head) or cite ZerosOfLFunctions if the `completes` interface is what 3.3 needs; cite PivotalSpherical Layer 3 by its section and `SimpleClasses` only.

## R07 (P3) — Locator slips

- `README.md` 2.8.1–2.8.5: Emery–Kim 2022 §5.1 begins on printed p.12 (emery-kim-2022 line 546), Lemma 5.1 is on p.12 (line 565) and Lemma 5.2 on pp.12–13 (line 577); the README says pp.10–11, p.11 and pp.11–12.
- §3.2 "Representation charts": Cho–Yamauchi Definition 3.1 is on physical p.9 (cho-yamauchi-2020 line 427), not pp.11–12.
- 4.5.1: Mahler 1946 Definition 4 is on printed p.157 (mahler-1946 line 226), Definition 3 on p.156.
- §6.1b: Barwick Theorem 5.16 and its corollary are on p.19 (barwick-heart line 801), not p.18.
- 6.9.3: CDH III Remark 2.2.6 is on p.40 (cdhhlmns-iii line 1819), not p.39.
- References: the Milne *Arithmetic Duality Theorems* URL returns 404 (the sources service could not fetch it); the author's copy is at a different file name on the same site.

## R08 (P3) — Forward references inside a layer

Location: `README.md` line 437 (1.2.14 *Needs:* "1.3.1 `successiveMin_pos`"), line 503 (2.1.3 "constructed in 6.4, so this comparison is stated here and proved there").

Witness: 1.2 precedes 1.3 and Layer 2 precedes Layer 6 in the build; the targets depend on later ones.

Repair: move 1.2.14 after 1.3.1 (or move positivity into 1.2), and move 2.1.3 into §6.4 as the field comparison of `ExactW0`, leaving a one-line pointer in 2.1.

## R09 (P3) — A code repository named as the supplier of reduced bases

Location: `README.md` line 2194 ("It is implemented and proved in hex-lll … Consumers who need an actual reduced basis use hex-lll").

Witness: suppliers are Mathlib, Tau Ceti and roadmaps; an external repository is neither a source nor a supplier, and the sentence directs consumers to code outside the pins.

Repair: delete the pointer, or keep one sentence of mathematical background saying that the reduction algorithm is not a target here.

## Verified sound

**Gate and build.** The worker's gate: `set_option=0 latex=0 prnum=0 sorry-data=0 … imports=1 depcheck=10 build=0 stray-files=0 outside-folder=0 FAIL`. I re-elaborated `Suggested.lean` with `lake env lean` from the worktree: 24 `declaration uses 'sorry'` warnings, no errors, 5 s. `git diff --stat origin/main...HEAD` outside the folder is empty. `metadata.toml` is `topic = "math.NT"`.

**Dependency check** (`gate --depcheck … --movable`), verbatim:

```text
not movable: GeometryOfNumbersAndQuadraticArithmetic consumes ProfiniteCohomology (#376) and is consumed by EffectiveBoundsPartII (#97), which comes first: moving GeometryOfNumbersAndQuadraticArithmetic after ProfiniteCohomology would put a supplier after a consumer, a cycle through GeometryOfNumbersAndQuadraticArithmetic
UPWARD: GeometryOfNumbersAndQuadraticArithmetic (#69) -> ClassFieldTheory (#262) at README lines [162, 1136]
UPWARD: GeometryOfNumbersAndQuadraticArithmetic (#69) -> DifferentialGeometry (#221) at README lines [154, 156, 1162]
UPWARD: GeometryOfNumbersAndQuadraticArithmetic (#69) -> GlobalQuadraticForms (#317) at README lines [114, 116, 514, 515, 518, 519]
UPWARD: GeometryOfNumbersAndQuadraticArithmetic (#69) -> HomotopySpheres (#241) at README lines [178, 180, 2285, 2287, 3189, 3191]
UPWARD: GeometryOfNumbersAndQuadraticArithmetic (#69) -> IntegralLattices (#242) at README lines [118, 120, 156, 216, 417, 424]
UPWARD: GeometryOfNumbersAndQuadraticArithmetic (#69) -> LFunctions (#301) at README lines [170, 228, 229, 1148]
UPWARD: GeometryOfNumbersAndQuadraticArithmetic (#69) -> OrthogonalSpinGroups (#290) at README lines [122, 852]
UPWARD: GeometryOfNumbersAndQuadraticArithmetic (#69) -> ProfiniteCohomology (#376) at README lines [162, 3126]
UPWARD: GeometryOfNumbersAndQuadraticArithmetic (#69) -> RepresentationTheory (#180) at README lines [122, 150, 152, 626, 852, 1482]
CYCLE among: GeometryOfNumbersAndQuadraticArithmetic, OrthogonalSpinGroups, OrthogonalTamagawaAndLatticeMass
depcheck: 163 roadmaps, 1189 edges, 10 problem(s)
```

**Signature check.** A scratch file with `#check @` for all 40 declarations elaborated without error; every binder the README's standing hypotheses require is present in the elaborated types (`[FiniteDimensional ℝ E]`, `[MeasurableSpace E] [BorelSpace E]`, `[DiscreteTopology Δ] [IsZLattice ℝ Δ]` on the covolume theorems; `[CompleteSpace H]`, finite centre, simplicity, connectedness and second countability on `howe_moore`; `IsClosedEmbedding ρ`, the invariant probability `μ` and the generation hypothesis `hU` on the Ratner theorems; `[Module.Finite R M] [Module.Projective R M]` and `Irreducible π` on `atomic_normal_form`). Nothing changed. One-tactic probe (`rfl`, `simp`, `infer_instance`, `le_refl`, `trivial`) on a scratch copy: all 24 theorems fail to close, so no declaration is padding by that test; no definition has a `sorry` body; no `set_option`; no `lemma`.

**Library declarations opened at the pins.** Mathlib: `ZLattice.covolume` (`Algebra/Module/ZLattice/Covolume.lean` line 72, no lattice instance in the definition, so the covolume of a non-lattice is a junk value, which none of the stated theorems hits because every mapped or comapped submodule in them is a full lattice), `covolume_pos` (line 98), `covolume_eq_det_mul_measureReal`, `covolume_div_covolume_eq_relIndex'`, `ZLattice.comap`, `comap_discreteTopology`, `instIsZLatticeRealSpan`, `discreteTopology_pi_basisFun`, `Module.Basis.ofZLatticeBasis`, `Submodule.exists_smith_normal_form_of_le`, `LinearMap.BilinForm.dualSubmodule`, `dualSubmodule_span_of_basis`, `inner_orthogonalProjectionOnto_eq_of_mem_left`, `ker_orthogonalProjectionOnto`, `finrank_add_finrank_orthogonal`, `det_fromBlocks_zero₂₁`, `sum_inner_mul_inner`, `normDet_sq_eq_det_gram`, `gram_eq_conjTranspose_mul`, `Measure.toSphere` (`MeasureTheory/Constructions/HaarToSphere.lean`), `Matrix.IsUpperTriangular`, `ErgodicSMul`, `GroupLieAlgebra`, `minSmoothness`, `ContRepresentation` (`RepresentationTheory/Continuous/Basic.lean` line 54: `toMonoidHom : G →* V →L[R] V`, continuity of each operator only, as the README says), `Submodule.IsLattice`, `exists_pair_mem_lattice_not_disjoint_vadd`, `covolume_idealLattice`, `exists_ideal_in_class_of_norm_le`, `poissonMeasure`. Tau Ceti (`6b7abb3`): `ZLattice.covolume_sq_eq_det_gram` (`Algebra/Module/ZLattice/Covolume.lean`), `ContRepresentation.IsUnitary` (`RepresentationTheory/Continuous/Unitary/Basic.lean` line 52, inside `namespace TauCeti`), `TauCeti.IsSemialgebraic` (`Geometry/RealAlgebraic/Semialgebraic/Basic.lean` line 68), `hurwitzClassNumber` (`NumberTheory/HurwitzClassNumber.lean` line 84: `-1/12` at `0`, else the weighted sum over `reducedForms D`), `hurwitzClassNumber_eq_finsum` (`BinaryQuadraticForm/Reduction.lean` line 232: weight `2 / |Stab|`), `hurwitzClassNumber_three/_four/_twelve/_sixteen`, `hurwitzClassNumber_eq_zero_of_mod_four_eq_one_or_two`, `posDef D` (`BinaryQuadraticForm/Basic.lean` line 209: discriminant `−D`, `0 < a`), `reducedForms`, `IsReducedForm`, `IntegralLattice.representationNumber` (`PosDef/RepresentationNumber.lean` line 73, the shell cardinality), `IntegralLattice.minimum` (`PosDef/Minimum.lean` line 81), `IsPosDef.finite_isometry`, `IntegralLattice.scale`, `IntegralLattice.IsEven`, `dualCarrier`, `adelicSpinorNorm`, `spinorNorm`, `scharlauTransfer`, `WittGrothendieckRing`, `IsInvolutiveDual`, `dualityEquivalence`, `ExactK0.of_conflation` (used in `CartanMap/Basic.lean` line 317), `finiteProjectiveModulesExactStructure_eq_split`, `IsConflationExact`, `ExactStructure.op`, `ExactStructure.split`, `linearHomComplexEnrichedCategory`, `dgDifferential_dgComp`, `dgComp_op`, `DGCategoryData.ofKeller`, `mapDGHomotopyCategory`, `fixedSpace`, `compMeasurePreserving_eq_self_iff`, `cohomologicalDimensionAt`, `riemannianVolume`. Absent at the pin, as the README states: any successive-minima module, `MinkowskiSecond.lean`, `IntegralLattice.successiveMinimum` (R04).

**Cross-roadmap citations resolved** (on main or at the head the brief gives): SuccessiveMinima's `successiveMin` (line 156 of its `Suggested.lean`), `finite_gauge_sublevel`, `successiveMin_le_iff_finrank`, `exists_successiveMin_witnesses`, `successiveMin_smul_body`, `successiveMin_linearEquiv`, `successiveMin_first_le_iff`, `exists_integral_minimum_flag`, `minkowski_second_lower`, `minkowski_linear_forms`, `finite_interior_disjoint_translate_volume`, `convex_cluster_intersection_null`, `exists_integral_basis_same_flag`, `hermitian_gram_hadamard`, `gram_uniform_bound`, `orthonormal_coordinate_hadamard`, `coe_successiveMin` (all declared there); SuccessiveMinima's README lists the upper half of Minkowski's second theorem under "already in Tau Ceti" (its lines 86–92, 781–783) and plans no target for it, so 1.3.3 has one owner. ThetaSeries §2C `covolume_dual` (README line 507, `Suggested.lean` line 355: `covolume (L^∨) = (covolume L)⁻¹`), `realModel`, `poissonSummation`, `thetaCoset`, `fourier_gaussian`, `summable_poisson_left/right`. IntegralLattices 2F (line 801), 7E (line 1869), Layer B; Completed IntegralLattices Layers 1, 2, 4. QuadraticFormInvariants Layers 1–6, 9 (discriminant convention line 199); GlobalQuadraticForms Layers 5, 6. OrthogonalSpinGroups 1D, 2F, 3F and its consumer contract (line 900). PointProcesses `PointMeasure.ofTuple` (#417). LFunctions `dedekindZetaC`, `dedekindZetaC_eq`, `completedDedekindZeta_eq`, `completedDedekindZeta_one_sub`, `dedekindZetaData`, `gammaFactor`, `eq_of_meromorphic_of_eqOn_halfPlane`, `eventuallyEq_of_meromorphic_of_eqOn_halfPlane`, `covolume_dualIdealLattice`, `Grossencharacter.mixedFourier_harmonicFactor_mul_archGaussian` (#248). ArithmeticGaloisDuality `RestrictedRamification.locMap` (#858). GeneralAlgebraicKTheory `exactCategory_devissage`, `IsPlusConstruction.lift` (#1212); StableHomotopyKTheory `hSpace_isAbelianSpace`, `finiteGLBlockSum` (#1227). EnhancedDerivedSheaves `stable_fibre_cofibre`, `dgNerve_shift_cone_comparison`, `indCompactComparison`, `symmetricSpectra_towerComparison` (main); GeneralizedCohomology `spectrumDerivedPrimeCompletion`; ComplexTori `normHomCompSub`; DifferentialGeometry `riemannianDensity`, `integral_riemannianVolume_eq_integralDensity`; RealAlgebraicGeometry `stack_connected`; PivotalSpherical Layer 3 `SimpleClasses`. Ownership against open work: OrthogonalTamagawaAndLatticeMass (#1222) consumes §§2.4/3.3 here (R01); GeometryOfNumbersAndQuadraticArithmeticPartII (#1691) builds on §§6.2–6.11 and plans nothing of Layers 0–5. Open pull requests without a path in the brief (PointProcesses, LFunctions' sibling ZerosOfLFunctions, GeneralAlgebraicKTheory, StableHomotopyKTheory, AdelicAlgebraicGroups, ArithmeticGaloisDuality, AlgebraicKTheory) were searched with the roadmaps tool only; ownership against them beyond the names above was not checked.

**Sources read at their locators** (ids are the keys I fetched; line numbers are into the sources cache): Horesh–Karasik 2023 Proposition B.4 (horesh-karasik-2023 line 1375, published p.1290), B.5 and Corollary B.6 (lines 1391, 1397, p.1291), Corollary A.3 (line 1188, p.1285), Definition 2.2 (line 324, p.1261); Henk Theorem 1.3 (henk-2002 line 58, p.2), (1.2)–(1.3) and the floor sentence (lines 76–82), Theorem 1.5 (line 109, p.3), Lemma 2.1 and the (1.3) deduction (lines 154–168, p.4), §3 proof (line 221, pp.5–7); Evertse Lemma 2.8 (evertse-geometry-of-numbers line 409, printed pp.23–24), Theorem 2.9 (line 439, p.24); Voight *Quaternion algebras* 9.4.5 (voight-quaternion-algebras line 6190), Definition 9.8.1 (line 6486, printed p.147), Example 9.8.2 (line 6491), Proposition 9.8.4 (line 6511, pp.147–148); Voight 2012 Example 3.14 (voight-matrix-ring-2012 line 637, p.13); Li–Zhang §1.7 (li-zhang-2019 line 295, p.8), §3.1 (line 599, p.15), (3.2.0.2) (line 629, p.16), `m(a;X)` (line 682, p.17), Theorem 3.5.1 and proof (lines 688–700, pp.17–18); Emery–Kim §5.1, Lemmas 5.1–5.2 (emery-kim-2022 lines 546–582); Cho–Yamauchi Lemma 3.4 (p.12), Corollary 3.5 (p.13), Theorem 3.9, Lemma 3.10, Theorem 3.12 (p.15), (3.4) (p.16); Hironaka Theorems 2.6 (p.15), Corollary 2.7 (p.16), Lemma 5.1, Theorem 5.2 (p.28), Proposition 5.3 (p.29), Corollary 5.4 (p.30), Theorem 5.6 (p.31), Remark 5.7 (p.32), (1.2), (1.4), (5.1) (pp.3, 4, 27); Duke 1988 introduction (duke-1988 lines 42–55, printed p.74); Morris Corollary 20.2.5 (morris-arithmetic-groups line 17141, printed p.410), 20.1.3 (line 16981, p.406), 20.3.2–20.3.4 (lines 17226–17264, pp.412–413); Bhargava–Shankar Proposition 2.5 (bhargava-shankar line 696, physical p.14); Mortenson 2017 Theorem 1.2/(1.8) (mortenson-2017 lines 98–107); O'Sullivan Theorems 5.1–5.4 (pp.14–16), Lemma 5.5 and Theorem 5.6 (p.17); Regev Lecture 11 Theorem 4, Claim 3 (p.2), Lemmas 5–7 (pp.3–4), Corollary 8, Lemma 9 (p.5), proof of Theorem 4 (pp.5–6); Aggarwal–Stephens-Davidowitz abstract and Theorem 1.2 (lines 15, 60–62); Mahler Definitions 3–5, Theorems 4, 6, 7 (mahler-1946 lines 216–294, printed pp.156–158); Benoist Fact 1.5 (benoist-arithmeticity line 171, p.7); Schlichting 2010 Example 2.2 (p.109), Lemma 2.6 (p.110), Lemma 2.8 (p.111), Remarks 4.2–4.3 (p.117), Proposition 4.7 (p.118), Proposition 4.11 (p.121), Remark 4.13 (p.122), Corollary 9.6 (p.161); Barwick Recollection 1.2 (p.4), Theorems 6.1, 6.2, 6.4 (pp.19–22); Hebestreit–Lachmann–Steimle §6 (pp.16–19); CDH I Examples 5.4.11–5.4.13 (p.115), Proposition 7.5.3, Corollaries 7.5.10, 7.5.15 (pp.172–175); CDH III Lemma 2.2.2 (p.37), Proposition 2.1.3, Lemma 2.1.4 (p.35), Theorem 2.2.4, Corollary 2.2.5 (p.39), Example 2.3.13 (p.46), Proposition 3.1.14 (p.54), Theorems 3.2.2, 3.2.9, 3.2.13 (pp.56–60); Weibel K-book VI Theorem 10.1 (weibel-k-book-vi line 2686); Bhargava–Shankar, Henk and Li–Zhang support the three Layer 3–4 headline formulas exactly as restated.

**Adversarial table.** One row per statement checked, with the values computed.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.2.1 adapted basis | ℤ², W = ℝ(1,1); first column (2,0) | basis (1,1),(0,1): det 1; any (2,0),(x,y): det 2y even | holds; negative control holds | none |
| 0.2.3 Gram block product | b = (1,1),(0,1), W = ℝ(1,1); sign-reversed basis; empty family | 1 = 2·(1/2); det −1 but Gram det 1; 1 = 1·1 | holds | none |
| 0.2.4 biorthogonal Gram | b=2,d=1/2; [[2,1],[1,1]] vs [[1,−1],[−1,2]]; b=d=2 | 4·(1/4)=1; 1·1=1 (inverse matrices); 16 ≠ 1 | holds; non-example fails as claimed | none |
| 0.2.5 dual of projection | Δ=2ℤ⊂ℝ; y ∈ W⊥, x ∈ E | dual (1/2)ℤ ≠ 2ℤ; ⟨y,πx⟩=⟨y,x⟩ so (πΔ)* = Δ*∩W⊥ | holds for every submodule | none |
| 0.3.1 `covolume_projection` | ℤ² off diagonal; Δ=2ℤe₁⊕3ℤe₂, W=ℝe₁; W=E; W=0 | 1/√2 = 1/√2; 3 = 6/2; covol(0 in 0-space)=1=covol Δ/covol Δ; covol Δ = covol Δ/1 | holds, including both degenerate W | none |
| 0.3.3 `primitive_orthogonal_covolume` | ℤ², W=ℝ(1,2); W=ℝ(1,1) | ℤ(1,2) and ℤ(2,−1) both √5; ℤ(1,1), ℤ(1,−1) both √2 | holds | none |
| 1.2.13a squared minima | Gram [4]; diag(1,4); diag(0,4); [−1]; rank 0 | threshold 3 fails, 4 holds; (1,4); (0,4); threshold 0 met by v with norm −1, no nonzero norm-0 vector | Checks consistent | R04 (supplier) |
| 1.2.14 real vs squared | Gram [4]; diag(1,4); I₂ | real 2, squared 4 = 2²; (1,2)² = (1,4); (1,1) both | holds | R04, R08 |
| 1.3.1 positivity | ℤ, [−1,1]; ℤ×{0} in ℝ², square; ℤ², segment | λ₀=1>0; λ₁ threshold set empty, junk 0; λ₁ junk 0 | holds; both negative controls show the hypotheses are load-bearing | none |
| 1.3.2 monotonicity | ℤ², [−3,3]×[−1,1]; cube; ℤ×{0} | (1/3,1); all 1; (1,0) breaks monotonicity without fullness | holds | none |
| 1.3.3 upper Minkowski | ℤ², [−3,3]×[−1,1], Lebesgue; diamond; d=0 | (1/3)·1·12 = 4 = 2²; 1·1·2 = 2 < 4; empty product 1, both sides μ(0-space) | holds with equality on the box | R02 (import) |
| 2.1.2 discriminant scaling | q = B(x,x)/2 in dim n | polar of q is B; Gram of b_q is B/2, det 2^{−n}det B; sign (−1)^{n(n−1)/2} | consistent with QuadraticFormInvariants line 199 convention | none |
| 2.4.5 spinor orbit Check | q=xy, τ_(1,1)τ_(1,2); ℚ₂; ℚ₃ | product diag(2,1/2), norm [1·2]=[2]; 2 non-square in ℚ₂; unit non-square in ℚ₃, stabilizes ℤ₃² | holds | none |
| 2.4.6 reflection | ℤ₂, q=xy, v=(1,1); v=(1,2); rank 0 | B(v,(a,b))=a+b, s_v(a,b)=(−b,−a), det −1; q(v)=2, B(v,(0,1))=1, image (−1/2,0) ∉ L; no det −1 element | holds; minimal-valuation choice is load-bearing | none |
| 2.6.1 atomic predicate vs Voight 9.8.1 | xy over ℤ₂; x²+xy+y²; 2 a unit; n=0 | v(1)=0<v(0)=∞≤∞, b unit; 0<1≤1; only case (i); (Fin 0→R)≃R impossible | matches source (v(a)v(b)=0 ⇔ a or b unit) | none |
| 2.6.3 | v(A),v(C)>v(B), B≠0 | v(AC)>2v(B)=v(B²) so v(AC−B²)=2v(B) | holds | none |
| 2.6.4 splitting coefficients | polar [[A,B],[B,C]], T(v_i,M)⊆BR | α=(C T₁−B T₂)/d, β=(A T₂−B T₁)/d; numerators ∈ B²R, v(d)=2v(B) | integral; sign convention "adding" = subtracting (α,β) consistent | none |
| 2.6.10 | [a,b,c], basis (e₁, e₂−(b/2a)e₁) | q = c − b²/(2a) + b²/(4a) = c − b²/(4a); cross term b − 2a·b/(2a) = 0 | holds; source misprint E15 confirmed | none |
| 2.6.11 `atomic_normal_form` | 𝔽₂[[t]], x²+ty²; ℤ₂, xy; 2 unit, x²+πy²; zero form rank r | T=0, ⟨1⟩⊥t⟨1⟩; one binary block, no unary split (unary polar det 4ac non-unit vs −1); exponents 0,1; r zero blocks | holds in every characteristic (char 2 via q additive) | none |
| 2.7.3 dual quotient size | rank 1 Gram π³; (0,1,1); unramified | val 3, type 1; val 2, type 2; #L∨/L = (q²)^{Σa_i} = q^{2val} | holds | none |
| 2.8.3–2.8.4 | (f·a)(x)=ā f(x); diagonal units a_i | (f·a)(xb) = ā f(x) b; (f·a)·b = \overline{ab} f; adjoint e_i ↦ a_i e_i*, inverse e_i* ↦ e_i a_i⁻¹ | holds | R07 (pages) |
| 3.1.1–3.1.2 counts | ℤ/3, G=B=1; G=1,B=0; n=0 | x²=1: 2; x²=0: 1; empty map 1, injective | holds | none |
| 3.1.3 `finite_hermitian_isometry_formula` | n=m=1,a=0; n=m=1,a=1; q=2,n=1,a=0,m=1,2,3; n=1,a=1,m=2 | q(1+1/q)=q+1; q(1+1/q)(1−1)=0; 3, 8·(3/4)=6, 32·(9/8)=36 (= q^{2m−1}−(−1)^m q^{m−1}); q³(1−q⁻²)(1+q⁻¹) = (q²−1)(q+1) = nonzero isotropic vectors | holds; `a = finrank (ker B)`, `2m−n` no truncation under n ≤ m | none |
| 3.2.4/3.2.6 rank-one polynomial | val a = 1,2,3 | overlattice sums 1−X; 1−X+X²; 1−X+X²−X³ = Σ(−X)^i | holds | none |
| 3.2.5 weight | a=0,1,2 | m=1,1−X,(1−X)(1+qX); −m′(1)=0,1,1+q | holds, matches li-zhang-2019 line 685 | none |
| 3.2.7 functional equation | a=1; a=2 | (−X)(1−X⁻¹)=1−X; X²(1−X⁻¹+X⁻²)=1−X+X²; D(1)=0 for odd a | holds, Li–Zhang (3.2.0.2) | none |
| density transform | n=1,a=1,2 | g=1+qY ↦ 1−X under Y=(−q)⁻¹X; qY(1+q·q⁻²/Y)=1+qY; a=2 likewise | holds | none |
| finite Fourier count | q=2, n=m=1, T=1; T=0; one-row integral e=0,1,2 | 1+(−1)(−1/2)=3/2 = 3/2^{1}; 1−1/2=1/2 = 1/2; 1, −1/2, 1/4 = (−q)^{−e} | holds | none |
| 3.3.6 proper vs ordinary mass | class with improper isometry; class without | 1·2/|O| ; 2·1/|O| | proper mass = 2 × ordinary mass | none |
| `orthogonalTamagawa_two` scope | rank 2 split torus | τ=1 ≠ 2 | rank ≥ 3 hypothesis is necessary and present | R01 (ownership) |
| 4.1.12 `lattice_count_lt_successive_minima` | ℤ², square; ℤ², tiny ball; rectangle minima (1,3) | 9 < 2·3·3; 1 < 2·1·1; 3 < 2·3·1 | holds; Henk Theorem 1.5 with floor (E9) | R02 |
| 4.1.13 `davenport_multiset_estimate` | n=1 (empty projection set); μ=2·1_{[0,N]}; indicator of {0,2}; shear (x,y)↦(x,y+Mx) | sSup ∅ = 0, max 1 0 = 1; count 2(N+1), vol 2N, error 2; count 2, vol 0; count 4, projections length 1 for every M | matches Bhargava–Shankar Prop 2.5 (C before M, A after) | none |
| `howe_moore` hypotheses | compact G; infinite centre | hG excludes compact; `Finite (center G)` present | correct generality | none |
| `moore_ergodicity` | Γ discrete with invariant probability; compact G | μ exists ⇒ Γ lattice; no closed noncompact K, vacuous | correct | none |
| Ratner 4.2.4–4.2.6 vs Morris | U trivial; periodic orbit; identity flow | closure {x}, Dirac, L trivial; closure the orbit; time average f(x) | Lean conclusions match Morris 20.1.3/20.3.3/20.3.4 with the connected specialization | none |
| `dani_margulis_nondivergence` | identity flow | occupation T ≥ (1−ε)T | holds | none |
| `oppenheim_values` hypotheses | integral form; definite; x²−(3+2√2)y² | discrete values; not dense; |N|(a+αb)/(a−α′b) ≥ 1 with N=a²−2ab−b² ≠ 0 | n ≥ 3, indefinite, irrational are all load-bearing; `hirr` ⇔ not proportional to rational by polarization | none |
| `three_square_hurwitz` | n=1,2,3,4,7; n=0 | 12(1/2−0)=6; 12(1−0)=12; 12(4/3−2/3)=8; 12(3/2−1)=6; 12(2−2)=0; at n=0, 12(−1/12+2/12)=1=r₃(0) although the theorem starts at n=1 | holds; Tau Ceti weights 1/2, 1/3 confirmed by `hurwitzClassNumber_eq_finsum` | none |
| `signedThreeSquareCount` | n=1,2,3,7 | 6; 6·(−1)·(−2)=12; 12−4=8; 12−12=0 | matches Mortenson (1.8) | none |
| class-number formula | n=1,2,3,5,11 | 24·1/4=6; 24·1/2=12; 48·1/6=8; 24·2/2=24; 48·1/2=24 | holds, and agrees with H(4n)−2H(n) via h(−4n)=3h(−n) for n≡3 (8), n>3 | none |
| Duke exponent | k=ℓ+3/2, Iwaniec k/2−2/7 | (ℓ/2+3/4−2/7+ε) − ℓ/2 − (1/2−ε) = −1/28+2ε | negative for ε < 1/56 | none |
| harmonic Gaussian transform | P=x, n=1, t=1; constant, t | −iξe^{−πξ²}; t^{−n/2} | holds | none |
| degree-4 harmonic Check | Σx_i⁴ − (3/5)(Σx_i²)² in ℝ³ | Δ: 12Σx_i² − (3/5)·20Σx_i² = 0; n=1 coefficient 6·(2/5)=12/5 | holds | none |
| Kloosterman Checks | c=4, ℓ=0,1; (m,n)=(1,1) | 1−i; 1+i; −1+i | holds with ε₃=i, (4/3)=1 | none |
| 4.4.13 `euclidean_dual_transference_upper` | aℤ; ℤⁿ; hexagonal | 1; 1 ≤ n; 2/√3 > 1, ≤ 2 | holds; index pairing i+j+1=n correct | R02 |
| transference constants | b(c), c=(2π)^{−1/2}; c=3/4,n=3; tail c=2e^{−3π/4} | 1; 0.529³=0.148<0.15; 0.190; e^{−π/3}+c³=0.358<0.4 | the contradiction 0.7 vs 0.4 is real | none |
| 4.4.14 `covering_dual_transference` | aℤ; ℤⁿ | 1/2; √n/2 ∈ [1/2, n] | holds | R02 |
| 4.5 `StarBody`, admissibility | (√|x|+√|y|)²; √|xy|; strip |x| | midpoint value 2 > 1; real quadratic order |N|≥1 admissible; Minkowski gives |x|<1 point | finite-type Checks hold | none |
| 4.5.9 `critical_lattice_exists` | disc; √|xy|; rank 0 | hexagonal √3/2; ℤ[(1+√5)/2] covolume √5; ⊥ admissible, Δ=1 | holds; non-finite-type gives sInf ∅ = 0 junk, excluded by hypothesis | none |
| 4.5.8 `mahler_relativelyCompact_iff` | diag(t,t⁻¹)ℤ² | first minimum → 0 | criterion well defined on cosets (gγℤⁿ = gℤⁿ) | none |
| 4.6.1 `siegel_mean_value` | ℤ ⊂ ℝ, f = 1_{[−1/2,1/2]}; 1_{[−1,1]}; v=0 | transform 0 vs integral 1 (n=1 excluded); 2; adding f(0) breaks the identity | hypotheses n ≥ 2, v ≠ 0 load-bearing; lattice independent of representative | none |
| 5.1 `IsLLLReduced` | (1,0),(1/2,1); (2,0),(0,1); (2,0),(1,1) | μ=1/2, 1 ≥ (3/4−1/4)·1; 1 ≥ 3 fails; 1 ≥ 2 fails | holds | none |
| 5.1.3–5.1.4 | GS lengths 1, 1/2, μ=1/2; n=1 | ratio 2 = 2^{1}; factor 2⁰=1 | holds | none |
| 6.1b Checks | cofiber of 2 in Perf(ℤ); C₃ rotation | [ℤ/2]=0; End = ℂ, multiplicity 1 | holds | none |
| 6.4 FH = 1+D | field, trivial D; ℝ hyperbolic plane | rank doubles; GW rank 2, W class 0 | holds | none |
| 6.9.1 residue coefficient | ℤ at (2), (3) | Ext¹(ℤ/p,ℤ)=ℤ/p, Hom=0, shift −1 | holds | none |
| 6.10b signatures | Lgq₀(ℤ)→Lgs₀(ℤ) | E₈ signature 8; ℤ[−2] signature 1 in degree 4 | consistent | none |
| E16 Weibel VI 10.1 | n=6 (k=0), n=7 | printed c₁ vs correct c₂=1 (B₄/8 numerator); printed ℤ/c₄ vs ℤ/w₄ = ℤ/240 = K₇(ℤ) | README's erratum confirmed | none |
| E12 Voight 9.8.2 uniqueness | [1,1,1] vs [5,1,5] over ℤ₂ | x²+xy+y² represents 5 at (1, (−1+√17)/2), √17 ∈ ℤ₂; both normalized, same class | uniqueness claim false, erratum confirmed | none |

## Not verifiable

- Banaszczyk 1993 (4.4.13 and the Gaussian lemmas): Springer DOI only, paywalled; cited by locator, `uncertified`.
- Iwaniec 1987 (the half-integral coefficient bound and Kloosterman estimates of 4.3): Inventiones, paywalled.
- Siegel 1945 (4.6.1): JSTOR only; the service recorded it in `needs-references.toml`.
- Siegel 1935 (4.3 class-number bound): the Acta Arithmetica DOI resolves to no open copy I could confirm; my attempt at the publisher's download link returned an unrelated article, so the Hilfssätze locators are unchecked.
- Davenport 1951 and the 1964 correction (4.1.13): Wiley, paywalled.
- Margulis–Tomanov 1994, Lindenstrauss 2001, Weil 1965, Sansuc 1981, Gross–Gan 1999, Rognes–Weibel 2000, Quillen 1972 and 1973, Schlichting 2004, Segal 1974, McDuff–Segal 1976, Waldhausen 1985, Friedlander 1976, Conway–Sloane, Platonov–Rapinchuk–Rapinchuk 2023: no legal text reached (paywalled DOIs or books); cited by locator only.
- Lenstra–Lenstra–Lovász 1982 (5.1): the mirror is an image-only scan and OCR is not available on this worker, so Proposition 1.11 and (1.4)–(1.7) are unchecked at the page level; the statements agree with the standard text.
- Milne, *Arithmetic Duality Theorems*: the README's URL returns 404 (R07).
- Fetched but not opened at the cited locators for lack of time: Kirschmer 2013, Gan–Hanke–Yu 2001 (§7 and the mass formula pages), Weil 1964, Hochman 2017, Ciobotaru 2014, Kleinbock–Margulis 1998, Shah 1994, Benoist Facts 3.3–3.4, Lurie HTT/HA, Hebestreit–Steimle, Kurinczuk–Skodlerack–Stevens, Skodlerack–Stevens, Schulze-Pillot §9.2, Bruhat–Tits II, Atiyah 1961, Couveignes 2020, Schlichting lecture notes §§2.4.3–2.4.6, Schlichting derived Example 1.30 (E17).
- Sections not read line by line: 2.5, 2.9, 3.3 beyond the statements listed in the table, 3.4, 4.2 outside 4.2.1–4.2.6, 4.7, 6.1, 6.1a, 6.2, 6.6, 6.6a, 6.7, 6.8, 6.8a, 6.10, 6.10a, 6.11.

## Source issues

- **Misprint** in henk-2002 at p.2, sentence after (1.2): the source says the bracket denotes the smallest integer not less than x; it should be the greatest integer not greater than x, as the proof of Theorem 1.5 (n₁ = ⌊2/λ₁⌋+1) uses; affects nothing.
- **Error** in voight-quaternion-algebras at 9.4.5, printed p.140: the source says every finitely generated module over a DVR is free; it should say every finitely generated torsion-free module (R/π is finitely generated and not free); affects nothing (the lattice applications are torsion-free).
- **Error** in voight-quaternion-algebras at Example 9.8.2, printed p.147: the source says the atomic representative [a,1,c] with a = ±2ᵗ or ±5·2ᵗ is unique in its isometry class over ℤ₂; it is not, since [1,1,1] and [5,1,5] are isometric over ℤ₂ (x²+xy+y² represents 5 primitively because √17 ∈ ℤ₂); affects a stated result (the uniqueness remark only, not Proposition 9.8.4).
- **Error** in voight-matrix-ring-2012 at Example 3.14, printed p.13: the source says the diagonalized forms are ⟨a, c + b²/4a⟩ and ⟨c, a + b²/4c⟩; they should be ⟨a, c − b²/4a⟩ and ⟨c, a − b²/4c⟩, as completing the square gives; affects a stated result (the example's display only).
- **Misprint** in morris-arithmetic-groups at the prose before Theorem 20.3.3, printed p.413: the source says Ratner's orbit-closure theorem concerns any one-parameter subgroup U; it should say any one-parameter unipotent subgroup, as Theorem 20.3.3 itself does; affects nothing.
- **Misprint** in weibel-k-book-vi at Theorem 10.1(5)–(6), chapter p.60: the source says |K_{8k+6}(ℤ)| = c_{2k+1} and K_{8k+7}(ℤ) ≅ ℤ/c_{4k+4}; it should say c_{2k+2} and ℤ/w_{4k+4}, as the proof (|K_{4m−2}(ℤ)| = c_m) and Table 10.1.1 give; affects a stated result (the displayed table values, not the proof).
