# Review of ComplexKahlerGeometry (pull request #1808 at d1a45bf)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ComplexKahlerGeometry/` at d1a45bf. Against main (665b395) the pull request changes three README sentences (line 609: the pointwise star "is consumed by RiemannianGeometry and consumed by SpinGeometry"; lines 1538 and 1613: the Frölicher adapter consumes "AlgebraicTopology Stage 5.0" instead of DGFloer); `Suggested.lean`, `PROGRESS.md`, `STATUS.md` and `metadata.toml` are byte-identical to main. The folder text is byte-identical to the copy that pull request #1807 carried at its heads 4f06ba2, 0f7ed58 and 12e0624 (README hash 29c0e374…, Lean hash eeae7ebb…); #1807 has since replaced the whole folder (its head commit 2110869 "headline acceptance file, roadmap form, pinned Tau Ceti carriers, loops cut": `import Mathlib` header, 15 `sorry`, headline theorems from Newlander–Nirenberg to Hard Lefschetz). The pull request's own merge-order paragraph puts #1807 before this pull request, so after that merge this pull request's change to the folder is empty; every finding below is a defect of the text as it stands at this head, and the repair for all of them at once is a rebase onto #1807's head (R14).

Gate at this head, re-run from the worktree with the board order: `set_option=0 blob=29 latex=0 tex=0 prnum=0 sorry-data=20 sorry-examples=0 residue=0 private-paths=0 imports=1 mathlib-subimports=5 no-import-mathlib=1 lean-lines=0 statement-hygiene=1 forbidden=0 dropped=14 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=26 source-material=0 FAIL` (the worker's fifteen-folder gate counts outside-folder=2, the two files of R14; the other 24 are the pull request's own sibling folders). Dependency check: `depcheck: 239 roadmaps, 2424 edges, 0 problem(s)`, no UPWARD, no CYCLE, no `moved:` line (this roadmap is not in the merge order; it is placed after its last supplier). `lake env lean` on `Suggested.lean`: exit 0 in 30 s, 37 `declaration uses sorry` warnings and nothing else. The worker's `SignatureCheck.lean` (62 `#check`) elaborates with exit 0 and no error. Pins: Tau Ceti 2fd255d9, Mathlib 1b1ccf4b.

## R01 (P1) — Twenty sorried data declarations in `Suggested.lean`

Location: `TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` lines 77, 139, 151, 155, 159, 163, 168, 224, 234, 287, 291, 295, 303, 308, 348, 369, 397, 428, 434, 489 (gate rule `sorry-data`, 20 hits).

Claim: `nijenhuisTensor`, `realBundleTestSubmodule`, the four `realBundleTest*` instances, `realBundleTestOfChart`, `bundleTestSubmodule`, `bundleTestSmul`, the four `bundleTest*` instances, `bundleTestOfChart`, `bundleTestRestrictScalars`, `bundleSobolevSubmodule`, `bundleSobolevToDistribution`, `realDistributionComplexify`, `bundleDistributionConjugation` and `complexBesselToL2` are `def`s or `instance`s with `sorry` in their bodies or proof fields, and everything downstream (`IsKahler` line 94, `nijenhuisTensor_skew`, `BundleTest`, `BundleDistribution`, `BundleSobolev`, the `*_apply`, `*_continuous_iff`, `*_range` and `complexBesselToL2_*` theorems) mentions one of them. The elaborated types show the consequence: `nijenhuisTensor`, `nijenhuisOnFields` and `IsKahler` elaborate without `[CompleteSpace E] [FiniteDimensional ℝ E] [T2Space M]` (signature listing lines 65–111), while `nijenhuisTensor_skew` keeps them; the pinned `TauCeti.SmoothAlmostComplexStructure.nijenhuis` needs `[FiniteDimensional ℝ E]` (`TauCeti/Geometry/Symplectic/Manifold/Nijenhuis.lean` lines 153–158).

Witness: line 77 `def nijenhuisTensor … := by sorry`; line 151 `instance realBundleTestTopology … := by sorry`; line 236 `⟨⟨fun x ↦ c • s.1 x, by sorry⟩, by sorry⟩`.

Repair: delete every sorried `def`/`instance` and every declaration that mentions one. The LF test topology, the Sobolev carrier and the complexification maps stay in the README as K5a targets (none is a headline). Give `IsKahler` the real body `form.IsClosed ∧ form.Compatible J ∧ ∀ x v w, J.nijenhuis x v w = 0` with `[FiniteDimensional ℝ E]` carried in its own signature (R04 gives the pinned declaration), or drop it in favour of the Kähler predicate on `SmoothForm 𝓘(ℝ,E) M ℝ 2` that the headline theorems need (R03).

## R02 (P2) — Import header: five `Mathlib.<submodule>` lines, no `import Mathlib`, and another roadmap's acceptance file

Location: `Suggested.lean` lines 1–9 (gate rules `imports`, `mathlib-subimports`, `no-import-mathlib`).

Claim: the header imports `Mathlib.Analysis.Complex.Basic`, `Mathlib.Analysis.FunctionalSpaces.BesselPotentialSpace`, `Mathlib.Analysis.Distribution.Distribution`, `Mathlib.Geometry.Manifold.VectorField.LieBracket`, `Mathlib.Geometry.Manifold.VectorBundle.ContMDiffSection` and `TauCetiRoadmap.DifferentialGeometry.Suggested` (used only by `DensityFiber`, lines 120–121); there is no `import Mathlib` line. The acceptance test is therefore stated against DifferentialGeometry's acceptance file, not against the pinned libraries, and the gate refuses the header.

Witness: line 8 `import TauCetiRoadmap.DifferentialGeometry.Suggested`; `grep -c '^import Mathlib$'` is 0.

Repair: `import Mathlib` followed by the `TauCeti.*` modules actually used (`TauCeti.Geometry.Symplectic.Manifold.AlmostComplex.Basic`, `TauCeti.Geometry.Symplectic.Manifold.TwoForm`; `TauCeti.Analysis.Complex.CauchyIntegralPolydisc` is unused). Delete `DensityFiber`: the density fibre is DifferentialGeometry's object (main README line 528, `Density`, `RoughDensity`) and is cited in the README, not re-declared.

## R03 (P2) — No headline theorem is stated, several are statable at the pins, and the docstring names none as unstatable

Location: `Suggested.lean` lines 11–22 (module docstring) and the whole file.

Claim: the README's end theorems are Newlander–Nirenberg (K1, line 181), the polydisc Dolbeault–Grothendieck lemma and the parameter solver (K2, lines 196–197, 207–212), Weierstrass preparation, Rückert's Nullstellensatz, Oka and Cartan coherence, Hartogs extension (K3, lines 325–329, 379–383, 393–399, 432–436), Koszul–Malgrange and the flat-bundle/local-system equivalence (K4, lines 480–486, 536–550), elliptic regularity, the Hodge theorem and Serre duality (K5, lines 1008–1014, 1230–1240), the Kähler identities, Hodge decomposition, Hard Lefschetz and Hodge–Riemann (K6, lines 1276–1290), the projective, torus, Hopf and Iwasawa computations (K7–K8). The file states none of them. Its only theorem that is not an API lemma about a sorried carrier is `realified_isManifold_analytic` (line 35), which is the pinned `IsManifold.restrictScalars_of_ne_zero` (`TauCeti/Geometry/Manifold/Complex/Analytic.lean` line 115): the scratch probe `IsManifold.restrictScalars_of_ne_zero (m := ∞) ω (by simp) inferInstance` elaborates with exit 0 against the statement verbatim. The docstring says "These are suggested forms, not an exhaustive checklist" and names no missing carrier.

Witness: at the same pins, #1807's head (`TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` there, lines 75–305) states `newlander_nirenberg`, `dolbeault_grothendieck_polydisc`, `hartogs_extension`, `weierstrass_preparation` (with uniqueness), `isRegularLocalRing_holomorphicStalk`, `uniqueFactorizationMonoid_holomorphicStalk`, `finiteDimensional_dolbeaultCohomology`, `finrank_dolbeaultCohomology_serre`, `finrank_complexDeRhamCohomology_eq_sum_dolbeault`, `finrank_dolbeaultCohomology_symm`, `even_finrank_complexDeRhamCohomology_odd` and `hard_lefschetz` on the pinned `SmoothForm`, `delBar`, `IsOfType`, `holomorphicStructureSheaf` and `IsPseudoholomorphicOn` carriers (`TauCeti/Geometry/Manifold/DifferentialForm/Dolbeault/Basic.lean` line 95, `…/AlmostComplexType.lean` line 201, `TauCeti/Geometry/Manifold/Complex/StructureSheaf/Basic.lean` line 68, `TauCeti/Geometry/Symplectic/Manifold/JHolomorphic.lean` line 96).

Repair: state the statable headlines (the list above) and delete `realified_isManifold_analytic` (R12). List in the docstring each headline that is still not statable with the carrier it lacks (Serre duality with bundle coefficients needs the holomorphic-bundle mixin of ComplexManifolds Milestone 7; the Kähler identities need the complex-linear Hodge star on `(p,q)` forms, which the pin has only for real coefficients, `TauCeti/Geometry/Manifold/Riemannian/HodgeStar.lean` line 296).

## R04 (P2) — The README and `Suggested.lean` re-plan objects the pinned Tau Ceti already owns

Location: `Suggested.lean` lines 35–39, 50–91; `README.md` lines 13–14 and 299–312 (realified atlas), 96–115 (complex orientation and its chart signs), 141–150 (joint holomorphic implicit function), 134–147 (complex scalar action on `SmoothForm`), 164–179 (Nijenhuis tensor, eigenbundles, type decomposition, `∂̄²f = −¼∂f(N)`), 195–196 (∂ and ∂̄ with their laws), 214–227 (Cauchy–Green with parameters), 317–345 (stalk, maximal ideal, domain, fraction field of meromorphic germs, principal parts, regular evaluation), 598–606 (pointwise Hodge star, `*² = (−1)^(k(m−k))`, `α∧*β = ⟨α,β⟩vol`, orientation-reversal sign), 1080–1083 (`d* = (−1)^(m(k+1)+1)*d*`), 1407–1443 (projective affine charts, `T2Space`, `CompactSpace`, `SecondCountableTopology`, `ConnectedSpace`, the complex `IsManifold` instance).

Claim: duplication by object against Tau Ceti 2fd255d9, each opened at the pin today:

- realification: `IsManifold.restrictScalars_of_ne_zero` (`Geometry/Manifold/Complex/Analytic.lean` 115), `contMDiff_iff_mdifferentiable` (174), scoped instance `isManifold_real` (`Complex/Orientation.lean` 195);
- orientation: `complexManifoldOrientation` (`Complex/Orientation.lean` 216), `complexOrientationLift` (297), `IsLocalDiffeomorphAt.isOrientationPreservingAt_complexManifoldOrientation` (359), the `Diffeomorph` and subtype forms (391, 414): README lines 96–115 plan exactly the reindexing, chart-sign positivity and biholomorphism preservation;
- joint implicit function: `exists_jointImplicitFunction_of_eventually_mdifferentiableAt` (`Complex/ImplicitFunction.lean` 52);
- Cauchy–Green with parameters: `contDiffOn_integral_sub_inv_smul_with_param`, `hasFDerivAt_…`, `conjWirtingerDeriv_integral_sub_inv_smul_with_param`, `differentiableAt_…` (`Analysis/Complex/Pompeiu/Parameter.lean` 75, 124, 158, 182): the "Parameter Cauchy–Green" lemma of README line 214 (joint smoothness, differentiation under the integral, `∂̄_z T(χf) = χf`);
- stalk algebra: `holomorphicStructureSheaf` (`Complex/StructureSheaf/Basic.lean` 68) with `Domain.lean` (`smoothStalkIsDomain`), `LocalRing.lean`, `MaximalIdeal.lean`, `DiscreteValuationRing.lean`, `MeromorphicGerm.lean` (`isFractionRing_meromorphicGerms`), `RegularEval.lean`, `SmoothComparison.lean`, `Germ.lean`, `Pullback.lean`: K3.HolomorphicStalk's stalk/maximal-ideal comparison and all of K3.MeromorphicGermField (fraction field, pole-only comparison, regular subring and value map);
- complex scalar action on forms: `instModule`, `smul_eq_mapCoeff`, `mextDerivₗ_smul`, `mpullback_smul` (`DifferentialForm/MapCoeff.lean` 273, 266, 305, 312): README lines 134–147 plan this action through `mapCoeff` with the same laws;
- Nijenhuis tensor and integrability: `nijenhuis` (`Nijenhuis.lean` 158), `nijenhuis_apply` (170, the field formula of `nijenhuisOnFields`), `nijenhuis_antisymm` (207, `nijenhuisTensor_skew`), `isInvolutiveComplexDistribution_eigenspace_I_iff` (`AlmostComplex/Eigenbundle.lean` 96, README line 179);
- ∂ and ∂̄: `del`, `delBar` (`Dolbeault/Basic.lean` 86, 95), `IsOfType` (`AlmostComplexType.lean` 201), `delBar_apply_apply` (366, exactly `dbarFunction`), `delBar_apply_eq_zero_iff` (378, exactly `dbarFunction_eq_zero_iff`), `delBar_delBar_apply` (405, `∂̄∂̄f(v,w) = −¼·∂f(N(v,w))`, the README's pinned formula);
- Hodge star and codifferential: `SmoothForm.hodgeStar` (`Riemannian/HodgeStar.lean` 296), `hodgeStar_hodgeStar` (310, `(−1)^(k·l)` with `k + l = m`), `inner_smul_riemannianVolumeForm_eq_wedge_hodgeStar` (317), `codifferential` (`Riemannian/Codifferential.lean` 88, `(−1)^(m(k+2)+1)*d*` on `(k+1)`-forms, the README's law after `k ↦ k+1`);
- projective space: `Projectivization.instTopologicalSpace`, `instSecondCountableTopology`, `instT2Space`, `instCompactSpace`, `instPathConnectedSpace` (`Topology/Algebra/Projectivization.lean` 90, 149, 188, 215, 251), `affineOpenPartialHomeomorph_mem_atlas`, `contDiffOn_affineChart_symm_trans`, `instIsManifold` (`Geometry/Manifold/Instances/Projectivization.lean` 67, 73, 82): K7.1's charts, transition holomorphy and the four topological instances.

Witness: `Suggested.lean` line 77 declares `nijenhuisTensor` with the type `Nijenhuis.lean` line 158 gives `nijenhuis`; README line 601 `*²=(−1)^(k(m−k))` is `hodgeStar_hodgeStar` line 310; README line 1410 "Construct the affine chart on `U_i`" is `Instances/Projectivization.lean` lines 62–96.

Repair: delete `dbarFunction`, `dbarFunction_apply_J`, `dbarFunction_eq_zero_iff`, `nijenhuisOnFields`, `nijenhuisTensor`, `nijenhuisTensor_onFields`, `nijenhuisTensor_skew` and `realified_isManifold_analytic` from `Suggested.lean`; in the README move each object above into a `From Tau Ceti` supplier contract by its name and file, and cut the construction sentences, keeping only what the pin lacks (the complex-bilinear extension of `N` and its `(0,1)`-field evaluation, conjugation and holomorphic-pullback naturality of ∂̄ if they are not at the pin, the orientation-line twist of the star and its complex-linear `(p,q)` extension, the regular-piece partition).

## R05 (P2) — Two-way supply with RealAnalyticGeometry

Location: `README.md` lines 280–284 ("RealAnalyticGeometry R3.2 consumes this colimit theorem"), 410, 424–430 ("R1 local finiteness … RealAnalyticGeometry R5 supplies the global compatible triangulation"), 459, 1174, 1271, 1337 ("Consume RealAnalyticGeometry R0–R5"), 1665–1666, 1689–1691 ("precede RealAnalyticGeometry R1's local semianalytic/component results; those results then supply K3's finite regular-piece partition").

Claim: `TauCetiRoadmap/RealAnalyticGeometry/README.md` on main (re-read today) consumes this roadmap at line 173 ("The proof uses CK K3's convergent Weierstrass preparation"), line 217 ("Use CK K3's Noetherian germs"), lines 736–758 (the structure sheaf "supplied by CK K4") and line 780 ("Consume CK K3's Oka output"). This roadmap consumes RealAnalyticGeometry R1 in K3 (lines 424–430, 1689) and R0–R5 in K6.1 (line 1337). K3/K4 → RAG R1–R5 → K3's partition and K6.1 is a cycle between the two roadmaps' layers; the mechanical check does not report it because both are on main.

Witness: RealAnalyticGeometry README line 173 `CK K3`, line 736 `CK K4`; this README line 1337 `RealAnalyticGeometry R0–R5`.

Repair: one direction. RealAnalyticGeometry R3–R5 depend on K3 and K4, so this roadmap cannot consume R1/R5: prove the finiteness of the regular-piece partition in K3 from local parametrization and compactness and drop the R1 citation; move K6.1's analytic-cycle triangulation and integral fundamental class (from "For singular V, consume K3's finite regular-piece partition", line 1337, to the end of K6.1) to "ComplexKahlerGeometry, Part II" placed after RealAnalyticGeometry, the introduction saying this roadmap stops at the de Rham functional `∫_(V_reg)`; rewrite lines 280–284, 1174, 1271 and 1689–1691 as consumer sentences only.

## R06 (P2) — Two-way supply with PseudodifferentialOperators

Location: `README.md` lines 45–53 ("PseudodifferentialOperators P1.0 supplies differential-operator carriers, jets, symbols and formal density adjoints after K5a's initial density-line construction and before its analytic scale"), 575–577, 651, 1647–1650 ("PDO P1.0 consumes that density bundle; K5a's distributional operator action … then consume P1.0").

Claim: `TauCetiRoadmap/PseudodifferentialOperators/README.md` on main (re-read today) has the supplier contract "From TauCetiRoadmap.ComplexKahlerGeometry. K5a supplies bundle distributions, …" (line 91), "CKG K5a consumes this predicate for its analytic regularity" (441), `*Needs:* P1.0 differential operators; ComplexKahlerGeometry K5a's smooth-section Fréchet` (529) and "ComplexKahlerGeometry K5a's density and section-topology contracts" (541). The roadmap-level graph is K5a (early) → P1.0 → K5a (late) → P1.1 onward: each is the other's supplier. PseudodifferentialOperators is line 14 of the merge order; this roadmap is unlisted.

Witness: PseudodifferentialOperators README lines 91, 441, 529, 541; this README lines 575–577 and 1650.

Repair: one owner upstream. Move the pre-P1.0 part of K5a (the density line `DensityBundle M`, `BundleTest`, `BundleDistribution`, the Fréchet section topology and the Montel instance) into PseudodifferentialOperators P1.0's smooth-section floor and consume them here, K5a then starting at the Hilbert scale; or move P1.0's operator core here and let PseudodifferentialOperators consume all of K5a. Either way the two READMEs must agree, and the PseudodifferentialOperators edit is the author's, outside this folder.

## R07 (P2) — DifferentialGeometry 6.1, 6.2, 8, 8.3–8.5 and 9.3 are cited as suppliers but dropped by the open revision of DifferentialGeometry

Location: `README.md` lines 922 ("DG8.4's existing vector-valued simplex/chain integrals and Stokes"), 953 ("DG6.2's smooth star-convex primitive target"), 1082 ("identify its cohomology with DifferentialGeometry's de Rham object"), 1328 ("DG9.3's general fundamental-class integration formula"), 1374 ("DG8's de Rham isomorphism"), 1382, 1388 ("DG8.4's open-pair cone", "DG8.4's relative `chainIntegral_map`"), 1396 ("DG9.3's compactly supported relative integration formula and DG8.3's smooth/continuous relative-chain comparison"), 1666 ("DG8.3–8.5/9.3/12.1").

Claim: on main, DifferentialGeometry has 6.1 (line 786), 6.2 (791), 8.3 (836), 8.4 (845), 8.5 (852) and 9.3 (872), but 8.3, 8.4 and 9.3 plan the absolute theory only, not the open-pair cone, the relative chain comparison or the compactly supported relative integration formula. At the head of pull request #886 (DifferentialGeometry revision, listed by `roadmaps list`), the README's layer headings run Layer 0–5, 5.6 and then Layer 12 (lines 392–1363): Layers 6–11 are gone, so every citation above breaks when #886 merges, and `scratch/overlaps.md` does not list them. The relative theory that K6.1 actually uses is owned by DeRhamCohomologyAndDuality (new folder, pull request #1768), whose README names ComplexKahlerGeometry K6.1 as its consumer of §§2.4, 3.1–3.3 and 4.1 and says "K6.1 names these as DifferentialGeometry 8.4's, 8.3's and 9.3's; DifferentialGeometry 8.3, 8.4 and 9.3 plan the absolute theory only" (lines 75–77, 695–702 at its head).

Witness: `TauCetiRoadmap/DifferentialGeometry/README.md` at #886's head, lines 1084 (`### Layer 5.6`) and 1363 (`### Layer 12`) with no heading between; DeRhamCohomologyAndDuality README lines 695–702.

Repair: cite the pinned de Rham theory where it exists (`TauCeti/Geometry/Manifold/DeRham/Basic.lean` lines 77 and 95, `closedForms`, `exactForms`, `deRhamCohomology`; the flat Poincaré lemma and `HomotopyInvariance.lean`, `CompactlySupportedMayerVietoris.lean` in the same directory) for lines 953 and 1082, and for the relative open-pair cone, the relative chain comparison and the compactly supported relative integration formula cite DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1 by name (it is a new roadmap, later in the merge order than every supplier of this roadmap, and consumes nothing from this one), naming that revision in the pull request's merge-order paragraph; keep DG 12.1 and 12.4, which #886 keeps (Layer 12 at its line 1363).

## R08 (P3) — SurfaceTopology and PlanarTopology, names on the dropped list, are cited as suppliers

Location: `README.md` lines 1488, 1492, 1493, 1495, 1496, 1505, 1506, 1674, 1675 (gate rule `dropped`, 14 hits).

Claim: K7.2's Riemann-surface genus dictionary consumes "PlanarTopology's surface convention", "PlanarTopology Layer 6's `Surface.Orientation`", "SurfaceTopology Layers 2–3", "Layer 6's polygon normal forms" and "Layer 8's compact-surface classification" through fork links; both names are on the project's dropped-names list, neither is on main, and no roadmap on main owns the classification of compact surfaces (GeometricTopology on main has Layer 11 at line 831 and no 1.7; Layers 1.7/1.7.1 exist only at #903's head).

Witness: line 1493 "Consume [SurfaceTopology Layers 2–3](https://github.com/mccorvie/…)"; the dropped-names list contains `SurfaceTopology` and `PlanarTopology`.

Repair: replace the citations by what the genus computation needs, stated as K7 targets (the oriented one-vertex, 2j-edge, one-face CW model of a closed orientable surface of genus j and `b₁ = 2j` from the cellular comparison already consumed from AlgebraicTopology Stage 4/6), or cite GeometricTopology Layers 1.7/1.7.1 naming that revision (#903) in the merge-order paragraph.

## R09 (P3) — Pull-request numbers and commit-pinned or fork links as supplier citations

Location: `README.md`: 21 occurrences of "#279" and 3 of "#280" (for example lines 17–18, 28, 97, 103, 313, 445, 1551, 1591, 1668, 1672: "#279 Milestones", "#280 Milestone 1"); 29 `github.com/TauCetiProject/TauCetiRoadmap/blob/<sha>/…` links (gate `blob`, lines 26, 29, 31, 35, 41, 45, 53, 199, 200, 345, 472, 475, 572, 573, 1049, 1051, 1059, 1063, 1065, 1153, 1337, 1551, 1591, 1618, 1637, 1653, 1656, 1674, 1675, 1683); 8 fork links `github.com/mccorvie/…` and `github.com/Paul-Lez/…` (lines 1488–1496, 1591, 1674–1675).

Claim: cross-roadmap citations name the roadmap and its section, never a pull-request number or a commit-pinned path. ComplexManifolds and ComplexTori are on main with Milestones 1–7 (ComplexManifolds README lines 172–319) and Milestone 1 (ComplexTori README line 130).

Witness: ComplexManifolds README line 197 `## Milestone 2: the canonical real orientation`; this README line 97 "Consume #279 Milestones 1 and 2".

Repair: "#279" → "ComplexManifolds", "#280" → "ComplexTori"; each blob or fork link → the roadmap name and section (DifferentialGeometry 0.4, GlobalHolomorphicFunctions 0.3/2.5/4.1/7.2, VariationalMethods §2.2–2.4/§3.1/§5.1–5.2, OperatorTheory/UnboundedOperators §4.7, ComplexComparisonPartII C−1.1/C0.4/C5.1–5.2, FormalConnectionsOpers §2.4, LieGroupoidsPoisson §G1.3a, RealAnalyticGeometry R0–R5), the SurfaceTopology/PlanarTopology links as in R08.

## R10 (P3) — Citation labels that do not resolve in the suppliers' own numbering

Location: `README.md` lines 572, 1049, 1059, 1063, 1065, 1153, 1653, 1656 (VariationalMethods "V2–V5.2", "V5.1", "V2.2–V2.4", "V3–V4", "V5.1–V5.2", "V3.1"); 35, 981, 1637 ("GlobalHolomorphicFunctions GH5.1" for the exactness of every smooth complex 2-form); 1551, 1683 ("LieGroupoidsPoisson G1.3"); 571, 813, 825, 1652 ("PDE Lane A.3", "PDE Lane B.9"); 1475 ("AT 8.12 consumes that later comparison"); 1039, 1072 ("HamiltonianReduction R5").

Claim: VariationalMethods at #1028's head has no `V<digit>.<digit>` label (0 matches); its sections are 2.2 (line 452), 3.1 (562), 5.1 (839), 5.2 (882), which is why the resolver lists V5.1 and V2.2 as found nowhere (`scratch/citations.md`, both confirmed). GlobalHolomorphicFunctions at #992's head proves two-form exactness in 7.2 (line 1865) and labels 7.4 "(GH5.1)" (line 1989). LieGroupoidsPoisson's standalone Chevalley–Eilenberg complex is §G1.3a (main README line 86, which itself names K8 as its consumer). PDE on main labels its sections "(A3)" at §1.3 (line 769) and "(B9)" at §2.2 (line 1148) and has no "Lane". AlgebraicTopology at this head says 8.12 uses "no projective carrier or external comparison" (line 2511); the finite-to-infinite comparison is CharacteristicClasses C1.5's (CharacteristicClasses README at this head lines 107–114). HamiltonianReduction is neither on main nor in `Completed/` nor among the open new roadmaps (`roadmaps list`).

Witness: VariationalMethods README line 839 `### 5.1 The compact-pair specialization`; GlobalHolomorphicFunctions README line 1865 `### 7.2 Planar coordinate forms and two-form exactness`.

Repair: "VariationalMethods §5.1" (and §2.2–2.4, §3–4, §3.1, §5.1–5.2), "GlobalHolomorphicFunctions 7.2", "LieGroupoidsPoisson §G1.3a", "PDE §1.3 (A3)" and "§2.2 (B9)"; delete the AT 8.12 clause (CharacteristicClasses C1.5 is the consumer, already named at line 1473); drop the HamiltonianReduction consumer sentences or name an existing owner.

## R11 (P3) — `Classical.choose` in the body of a definition

Location: `Suggested.lean` line 400 (gate `statement-hygiene`, P3).

Claim: `bundleSobolevToDistribution` is defined by `toFun u := Classical.choose u.2`; with `localize = 0` and `q = 1` the carrier is `{v | (v 0).toDistr = 0}` and the chosen `u` is any distribution, so the datum is not determined by the definition (the injectivity hypothesis `hinj` is carried but not used by the body).

Witness: line 400 `toFun u := Classical.choose u.2`.

Repair: delete the declaration with R01 (it mentions the sorried `bundleSobolevSubmodule`); if a reconstruction map is kept as a README target, define it through the universal property of the closed image, or take the distribution as the datum and the tuple as derived.

## R12 (P3) — Padding in `Suggested.lean`

Location: lines 35–39 (`realified_isManifold_analytic`), 55–66 (`dbarFunction_apply_J`, `dbarFunction_eq_zero_iff`), 88–91 (`nijenhuisTensor_skew`), 106–115 (`memSobolev_iff_bundled`, proved), 243–284 (`bundleTestComplexModule`, `bundleTestScalarTower`, proved field by field), 275–276 (`bundleTest_smul_apply`, `rfl`), 360–361, 383–385, 388–394, 405–409, 413–416, 503–506 (all proved in one term), 484–486 (`complexBesselDistributionMultiplier_real`, the identity `exp((s/2) log(1+|ζ|²)) = (1+|ζ|²)^(s/2)`).

Claim: `realified_isManifold_analytic` closes by one `exact` of the pinned lemma (probe above, exit 0); `dbarFunction_apply_J`, `dbarFunction_eq_zero_iff` and `nijenhuisTensor_skew` are the pinned `delBar_apply_apply`, `delBar_apply_eq_zero_iff` and `nijenhuis_antisymm` (R04); the proved declarations restate definitions or follow from one library lemma (`PiLp.norm_sq_eq_of_L2`, `completeSpace_coe_iff_isComplete`, `LinearIsometry.norm_map`). One-tactic probe on a scratch copy (`rfl`, `infer_instance`, `simp`, `exact` of the pinned lemma, `simp [dbarFunction, …]; ring_nf`): 0 of the 17 sorried theorems closes; the 12 inline ones are statements about the sorried data of R01.

Repair: delete them from `Suggested.lean`; the README keeps the type law of ∂̄, the skew-symmetry of N, the bundled/unbundled Sobolev comparison and the symbol identity as Checks and API bullets.

## R13 (P3) — README not in TauCetiRoadmap form

Location: whole `README.md`: title line 1 (`# Complex manifolds, Dolbeault theory, and Kähler geometry`, not `# Roadmap: …`); no `**Summary.**`, `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build`, `### Examples` or `### Dependencies` (the ten `##` headings are "Conventions and suppliers", K1–K8 and "Order and references"); 0 occurrences of `**Checks.**`; LaTeX macros inside code spans at lines 120–121 (`φ_{\bar z}d\bar z`); process wording at line 66 ("the prototypes use that native carrier … during its migration") and in the Lean docstring line 21 ("these prototypes do not prove the analytic targets"); the reference list at lines 1694–1703 (Wells without chapter; Griffiths–Harris "chapter 0" without section; no `sources.toml` key for Raghunathan, which K8 line 1612 relies on through Sakane); backticked names of this roadmap's own that `Suggested.lean` does not declare: `DensityBundle M` (line 626), `BundleSobolev E s` (lines 728, 892; the Lean `BundleSobolev` takes `F V n q G localize s`), `RealBundleSobolev V 0` (line 785).

Claim: the definitions of K3, K4 and K5a have API prose but no Checks, so the three-Checks rule fails for every definition; of the sampled targets, "Parameter Cauchy–Green", K4.ComponentwiseFiniteRankAssembly, K5a.DistributionLocalStructure, K5a.SmoothSectionMontel, K5a.ComponentwiseCompact, K5b.0 and K7.1 carry no locator; K5b.1 and K8 cite "Wells" and Sakane without theorem numbers at the claim.

Repair: bring the README to the house shape (title, Summary, Scope and ownership, Conventions, Exact supplier contracts with the R04 names, How to read the build, layers with Examples and Dependencies, Downstream consumers, References); add at least three discriminating Checks per definition (for `dz_j♯`: value `2∂_(z_j)` at `H = I` and the failure of the dual-frame normalization `∂_(z_j)`; for the star: `*² = −1` on 1-forms of a surface; for the Hopf weights: `2^(1−m−n) = 1/2` at `m = n = 1`); give each theorem a locator (Demailly II §4.2 for Weierstrass preparation, II (4.22) for the Nullstellensatz, II (4.29) and (4.31) for coherence and the singular locus, VI (7.2) for Hodge finiteness, Sakane Theorem 1 p. 189 for the Dolbeault comparison); write `φ_z̄`, `dz̄` in Unicode; drop the process wording; declare or unbacktick the three names.

## R14 (P3) — Two edits outside the pull request's folders, and a stale copy of a folder #1807 rewrites

Location: `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77 (`git diff --stat origin/main...HEAD` outside the fifteen named folders: 2 files, 1 line each); the whole folder `TauCetiRoadmap/ComplexKahlerGeometry/`.

Claim: the two one-liners are #1807's commits e591d10 and 61e5385, which #1807 reverted at 74e527e8; 74e527e8 is not an ancestor of d1a45bf (`git merge-base --is-ancestor` false). The folder at this head is #1807's pre-repair copy (hashes above); #1807's head carries the rewritten folder (2110869). The description's merge order (#1101 → #1807 → this pull request) already makes #1807 the owner of the folder's text; pull requests #1234 and #1398 (other author) also change this folder and conflict with this head (`scratch/overlaps.md`), and the description names no order against them.

Witness: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/…'` (the brief's command) lists exactly the two files; `git log prreview/1807 -- TauCetiRoadmap/ComplexKahlerGeometry` shows 2110869 after 4f06ba2.

Repair: rebase this branch onto #1807's head; the two outside-folder lines disappear and this pull request's change to `TauCetiRoadmap/ComplexKahlerGeometry/` becomes empty (its three sentences are already in #1807's text: Stage 5.0 at lines 2124, 2141, 2168 there). If the folder stays in the diff, the description must say that #1234 and #1398 are rebased on it or it on them.

## Verified sound

- **Gate and build.** Gate re-run (counts above); `lake env lean Suggested.lean` exit 0 with 37 sorry warnings only; `SignatureCheck.lean` (62 `#check`) exit 0; `#check` types compared with the README for `realified_isManifold_analytic` (matches K3.0 line 299–312), `IsKahler` (matches K6.0 line 1248 "Compatible, closed and N=0"), `nijenhuisTensor` (binders dropped, R01), `BundleSobolev`/`bundleSobolev_norm_sq` (K5a line 743 "‖u‖² = Σ‖χ_i u‖²"), `complexBesselSymbol` (K5a line 866 "symbol `exp((z/2) log(1+|ζ|²))`"). Depcheck: `239 roadmaps, 2424 edges, 0 problem(s)`.
- **Pinned declarations opened** (file:line at Tau Ceti 2fd255d9): Analytic.lean 115/174; Orientation.lean 195/216/297/359/391/414; ImplicitFunction.lean 52; Pompeiu/Parameter.lean 75/124/158/182; StructureSheaf/Basic.lean 68–259 and the Domain, LocalRing, MaximalIdeal, DiscreteValuationRing, MeromorphicGerm, RegularEval, SmoothComparison modules; MapCoeff.lean 266/273/305/312; Nijenhuis.lean 158/170/207; Eigenbundle.lean 96; AlmostComplexType.lean 201; Dolbeault/Basic.lean 86/95/366/378/405; HodgeStar.lean 296/310/317; Codifferential.lean 88; JHolomorphic.lean 96; DeRham/Basic.lean 77/95; Topology/Algebra/Projectivization.lean 90/149/188/215/251; Instances/Projectivization.lean 62–96; Exhaustion.lean (`exists_isFilledIn_compact_exhaustion`); CauchyIntegralPolydisc.lean (`analyticOnNhd_iff_differentiableOn_of_finiteDimensional`); RemovableSingularity.lean (`analyticAt_circleIntegral`); Analytic/Inverse.lean (`analyticAt_implicitFunction`); VolumeDensity/Volume.lean (`isLocallyFiniteMeasure_riemannianVolume`). Mathlib (1b1ccf4b): `PowerSeries.IsWeierstrassFactorization`, `meromorphicOrderAt_eq_int_iff`, `MontelSpace` (Montel.lean 46), `ContinuousLinearEquiv.toCompactConvergenceCLM`, `TestFunction.continuous_iff_continuous_comp`, `TemperedDistribution.MemSobolev`, `memSobolev_zero_iff` (Sobolev.lean 157), `besselPotential` (73), `Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'`, `fourierMultiplierCLM` (FourierMultiplier.lean 50), `SchwartzMap.fourier_convolution`, `OnePoint.equivProjectivization` (ProjectiveLine.lean 84: `∞ ↦ [1:0]`, `t ↦ [t:1]`, as README line 1432), `MDifferentiable.exists_eq_const_of_compactSpace`, `MDifferentiable.isLocallyConstant`, `differentiableAt_complex_iff_differentiableAt_real`, `real_linearMap_map_smul_complex`, `LinearMap.complexOfReal`, `ContDiffAt.to_localInverse`, `ContDiffAt.implicitFunction`, `MvPolynomial.mul_esymm_eq_sum`, `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `smoothSheafCommRing` (Smooth.lean 294) and `isUnit_stalk_iff`, `Opens.overPullbackSheafEquivOver`, `Complex.starConvex_one_slitPlane`, `IsCoercive.continuousLinearEquivOfBilin`, `BesselPotentialSpace.toLpₗᵢ`, `Lp.toTemperedDistribution`: all present. `Projectivization.affineOpenPartialHomeomorph` is Tau Ceti's, not Mathlib's.
- **Cross-roadmap citations resolved** on main (665b395): ComplexManifolds Milestones 1–7 (lines 172–319), ComplexTori Milestone 1 (130), DifferentialGeometry 0.1/0.3/0.4/1.2/1.5/2.1/2.2/5.4/5.5/6.1/6.2/8.3/8.4/8.5/9.3/12.1/12.4 (lines 272–927), SmoothBundlesConnections B2.1–B2.5, B5.0–B5.2 (559–1209), PseudodifferentialOperators P1.0 (164), P1.1 (507), P5 (927), P7 (1598), LieGroupoidsPoisson §G1.3a (86), PDE (A3)/(B9) (769/1148), GeometricTopology Layer 11 (831), HopfRinow (Completed/, Levi-Civita at lines 40/179/265), HodgeStructures (Completed/), RealAnalyticGeometry R1/R3.1/R3.2/R5 (173–805), Hyperfunctions HF5 (43), RiemannianGeometry R7.1–R7.8 (1303), SymplecticGeometry (consumer, line 68), ContourIntegration (Completed/); at open heads: VariationalMethods #1028, UnboundedOperators #1027 §4.7 (UO-D06, line 512), GlobalHolomorphicFunctions #992 0.3/2.5/4.1/7.2/7.4 (419/955/1286/1865/1989), FormalConnectionsOpers #1056 §2.4 (F2.4, line 722; it names K1/K3.0/K4 at line 64), IndexTheory #1077 (K5/K5a/K7 at lines 73/195–197; Layer 7.4 at 63), DifferentialGeometry #886 (R07), DeRhamCohomologyAndDuality #1768 (R07), AlgebraicTopology and CharacteristicClasses at this head (Stage 4.6 line 816–820, Stage 5.0 line 115, Stage 6.3 lines 76/835/2084, `cwSubcomplexNeighborhoods` 751, `simplicialRealizationCW` 846, 8.12 line 2511; CC lines 107–114). ComplexComparisonPartII is only at #848 (draft); GeometricQuantization only at #1186; both are named here as consumers only.
- **Ownership against open work**: the ℂPⁿ CW structure has one owner at this head (AlgebraicTopology lines 1836–1842 and 2501 consume K7.2's finite CW structure; main's AlgebraicTopology builds none); the exponential sequence of K4 is not stated in this text; the Hodge star is consumed by RiemannianGeometry (main line 43) and SpinGeometry as the changed line 609 says. Checked against #848, #886, #946, #992, #1768, #1772, #1028, #1027, #1077, #1186, #1234, #1398, #1807 and #1854 heads named in the brief; the ownership questions this raises are R04–R07.
- **Seeded sample.** "Parameter Cauchy–Green" (line 214): no source locator; the four identities are the pinned `Pompeiu/Parameter.lean` theorems (R04) and the values are recomputed below. K3.HolomorphicStalk (317): `PowerSeries.IsWeierstrassFactorization` at the pin; Demailly II §4.2 would be the locator (R13). K3.MeromorphicGermField (332): `MeromorphicAt`, `meromorphicOrderAt_eq_int_iff` at the pin; the coefficient formula verified below; the object is pinned (R04). K4.ComponentwiseFiniteRankAssembly (517): no locator, own construction, values below. K5a (570): supplier labels in R10; `MontelSpace` and `toCompactConvergenceCLM` at the pin. K5a.DistributionLocalStructure (658), K5a.SmoothSectionMontel (726), K5a.ComponentwiseCompact (1086): own constructions, values below. K5b/K5b.0/K5b.1 (1168–1240): conventions recomputed below; Serre duality and diamond symmetry as stated. K7.1 (1407): Mathlib's `equivProjectivization` formulas match; the rest is pinned (R04). K7.2 (1444): values below. K8.NilpotentCentralReduction (1558): sakane-parallelisable line 102 (Theorem 1, PDF page 4 = printed 189), lines 106–115 (last nonzero `C^m(G)` central, `A ∩ Γ` a lattice of `A`, `AΓ` closed, `π(Γ)` a lattice of `G/A`, the holomorphic principal torus bundle), lines 339–341 (Iwasawa `h^(0,1) = 2`, `h^(1,0) = 3`, `b₁ = 4`); the README's "pp. 188–189" covers lines 56–128. Also opened: angella-iwasawa lines 701 (`b₁ = 4`), 717–724 (`h^(1,0) = 3`, `h^(0,1) = 2`); demailly-agbook lines 4742 (4.22 Nullstellensatz), 4842 (4.29 Cartan), 4929 (4.31 `A_sing` analytic); lojasiewicz-triangulation line 512 (Theorem 2, printed p. 464: countable real-analytic manifold, locally finite semianalytic family).
- **Adversarial table** (values on both sides):

| statement | instance | left | right | result |
|---|---|---|---|---|
| `h_T(u^(1,0),v^(1,0)) = 2g_ℂ(bar u^(1,0), v^(1,0))` (line 69) | ℂ, u = v = ∂_x, J∂_x = ∂_y | h_T(∂_x,∂_x) = g + iω = 1 + 0 | u^(1,0) = ∂_z; 2·g_ℂ(∂_z̄,∂_z) = 2·¼(1+1) = 1 | holds |
| `ω = (i/2)Σ dz∧dz̄` vs `Σ dx∧dy` (72) | n = 1 | (i/2)(−2i)dx∧dy = dx∧dy | dx∧dy | holds |
| coframe h_T*-norm = Gram norm/√2 (73) | dz | h_T*: 1 | Gram: √2; √2/√2 = 1 | holds |
| `g(u,v) = ω(u,Jv)` with `h_T = g + iω` (56, 65) | u = ∂_x, v = ∂_y | g(∂_x,∂_y) = 0 | ω(∂_x, J∂_y) = ω(∂_x,−∂_x) = 0; ω(∂_x,∂_y) = −g(∂_x,J∂_y) = 1 | consistent |
| Chern frame law `h′ = g*hg`, `A′ = g⁻¹Ag + g⁻¹dg`, `A = h⁻¹∂h` (85–88) | e′ = eg, D(eσ) = e(dσ+Aσ) | σ = gσ′ gives A′ = g⁻¹(dg + Ag) | metric compatibility dh = A*h + hA, (1,0) part ∂h = hA | holds |
| `∫_line ω_FS = 1`, `ω_FS = (i/2π)∂∂̄ log(1+|z|²)` (89–90) | ℂP¹ | (i/2π)·dz∧dz̄/(1+|z|²)² = (1/π)dxdy/(1+r²)² | ∫ = (1/π)·π = 1 | holds |
| `dd^c = 2i∂∂̄`, `d^c = i(∂̄−∂)` (54) | ∂² = ∂̄² = 0 | (∂+∂̄)i(∂̄−∂) = i(∂∂̄ − ∂̄∂) | = 2i∂∂̄ | holds |
| `[Λ,d] = −(d^c)*`, `[L,d*] = d^c` (1255) | from `[Λ,∂] = i∂̄*`, `[Λ,∂̄] = −i∂*` | [Λ,d] = i∂̄* − i∂* | (d^c)* = −i(∂̄*−∂*), so −(d^c)* = i∂̄* − i∂* | holds |
| `Δ_d` on functions = −div grad (93, 1073) | ℝ, f = x² | d*df = −f″ = −2 | div grad f = 2 | holds (sign as stated) |
| `∂̄²f(X,Y) = −¼∂f(N(X,Y))` (170) | pinned `delBar_delBar_apply` line 405; integrable J | N = 0 ⇒ ∂̄² = 0 | −¼·∂f(0) = 0 | holds; owned at the pin |
| `dbarFunction` (50) = (df(v) + i df(Jv))/2 | f = z, v = 1: (1 + i·i)/2 = 0; f = z̄: (1 + i(−i))/2 = 1 | pinned `delBar_apply_apply` same formula | | holds; pinned |
| `dbarFunction_apply_J` (55) | v ↦ Jv | (df(Jv) − i df(v))/2 | −i(df(v) + i df(Jv))/2 = (−i df(v) + df(Jv))/2 | holds |
| N skew (88) | swap X,Y | each bracket changes sign | −N(Y,X) | holds; `nijenhuis_antisymm` |
| `*² = (−1)^(k(m−k))` (601) | m = 2, k = 1 | −1 | pinned (−1)^(k·l), l = 1: −1 | holds |
| `d* = (−1)^(m(k+1)+1)*d*` (1080) | m = 2, k = 1 | (−1)^5 = −1 | pinned on (k+1)-forms (−1)^(m(k+2)+1) at k = 0: −1 | holds |
| `dvol_g = ω^n/n!` (1177) | n = 1; n = 2 | ω = dx∧dy; ω² = 2dx¹dy¹dx²dy² | dvol; /2! | holds |
| `|dz_j|² = 2(H⁻¹)_jj`, `dz_j♯ = 2∂_(z_j)` (1181–1184) | H = I | |dx|²+|dy|² = 2; (dx+i dy)♯ conjugate-linear = ∂_x − i∂_y | 2∂_z = ∂_x − i∂_y | holds |
| `e_θ i_η + i_η e_θ = ⟨η,θ⟩` (1189); ψ = φ/√2 gives 2δ (1194–1196) | θ = η unit; φ of Gram norm √2 | 1 | 2 | holds |
| symbol `σ(Δ_∂̄) = ½|ξ|² Id` (1173), `Δ_d = 2Δ_∂̄` (1257) | flat ℂ | Δ_∂̄ = ½Δ_d on functions | ½|ξ|² | holds |
| Serre `H^q(E)* ≃ H^(n−q)(E*⊗K)` (1232) | ℂP¹, E = O(−1) | H¹(O(−1))* | H⁰(O(1)⊗O(−2)) = H⁰(O(−1)) = 0 | holds; line 1458 |
| `h⁰(O(k)) = binom(n+k,n)` (1453) | n = 1, k = 2 | 3 | monomials z⁰,z¹,z² | holds |
| `K_(ℂP¹) ≃ O(−2)` via `dz = −w⁻²dw` (1456) | z = 1/w | dz = −w⁻² dw | transition w⁻² = degree −2 | holds |
| torus `h^(p,q) = binom(n,p)binom(n,q)` (1479) | n = 1 | h^(1,0) = h^(0,1) = 1 | b₁ = 2 | holds |
| curve `h^(0,1) = g`, `b₁ = 2g` (1481–1483) | ℂP¹ | g = 0, b₁ = 0 | | holds |
| Hopf weights `2^(d+1)`, `2^(1−m−n)` (1527–1529) | d = 0; m = n = 1 | 2; ½ | neither is 1 | holds |
| Hopf diamond (1530–1532) | b₁, b₂, b₃ of S¹×S³ | 0+1, 0+0+0, 1+0 | 1, 0, 1 | holds |
| Iwasawa `h^(1,0) = 3`, `h^(0,1) = 2`, `b₁ = 4` (1543) | sakane line 339, angella 701/717–724 | 3, 2 | b₁ = 4 ≠ 5 | holds; E₁ ≠ E_∞ |
| Hard Lefschetz `L^(n−k)` (1280) | n = 1, k = 0 | L: H⁰ → H² | [ω] ≠ 0 | holds |
| Hodge–Riemann sign (1282–1284) | n = k = 1, α = f dz | i·∫ |f|²dz∧dz̄ = i(−2i)∫|f|² | 2∫|f|² > 0 | holds |
| odd Betti even (1279) | b₁ = h^(1,0) + h^(0,1) | 2h^(1,0) | | holds |
| Laurent `c_(−k) = (2πi)⁻¹∮ f (z−a)^(k−1)` (350) | f = (z−a)^m | ∮ (z−a)^(m+k−1) = 2πi iff m = −k | | holds |
| Weierstrass coefficients vanish at 0 (325–327) | f = w² − z, d = 2 | unit 1 · (w² + 0·w − z) | a₁(0) = a₀(0) = 0 | holds |
| hypersurface Nullstellensatz needs f irreducible (379) | f = w², h = w | h vanishes on V(f) | w² ∤ w | hypothesis needed, present |
| singular locus smaller dimension (393) | V = {zw = 0} | Sing = {0}, dim 0 | dim V = 1 | holds |
| node/cusp (436) | z² = w²+w³; z² = w³ | irreducible globally; 2 branches / 1 branch at 0 | | holds |
| Hartogs `dim A ≤ n−2` (432) | n = 1, A = {0}, f = 1/z | no extension | condition empty for n = 1 | hypothesis needed, present |
| Peetre `〈ζ+η〉^s ≤ 2^(|s|/2)〈ζ〉^s〈η〉^|s|` (998) | n = 1, s = 1, ζ = η = 1 | √5 ≈ 2.24 | √2·√2·√2 ≈ 2.83 | holds |
| `(1+|ξ|)^(2s) ≍ (1+|ξ|²)^s` (881) | ratio | between 1 and 2^s | | holds |
| `H^s ⊂ C^k` for `s > k + n/2` (886) | n = 1, k = 0 | s > ½ | s = ½ fails | hypothesis sharp |
| `⟨δ^(n)/n!, φ⟩ = 2^n` (713) | φ = 1/(1+2x) near 0 | (−1)^n φ^(n)(0)/n! = (−1)^n(−2)^n | 2^n | holds |
| nonextension `exp(1/‖x‖²)` (700–708) | supp φ_ε ⊂ B((1+c)ε) | pairing ≥ (cε)^n ∫φ · exp((1+c)^(−2)ε^(−2)) | finite order ≤ Cε^(−N) | contradiction, holds |
| `H_m = t_+^(m−1)/(m−1)!` is `C^(m−2)`, `D^m H_m = δ` (676–684) | m = 2 | H₂ = t_+, C⁰ | D²t_+ = δ | holds |
| supported jets `(−1)^|β|β!u_β` (690–692) | pair z^β with Σu_α⊗∂^αδ | (−1)^|α|∂^α z^β(0) = (−1)^|β|β!δ_αβ | | holds |
| degree of `∂^αδ` = −q−|α| (696) | q = 1, α = 0 | δ(λz) = λ⁻¹δ | | holds |
| Montel: bounded ⇒ compact closure (726) | C^∞ on compact; negative control C⁰ | Arzelà–Ascoli on every derivative | unit ball of C⁰ not compact | hypothesis (smooth Fréchet) needed, present |
| finitely many components (1086) | compact locally connected; negative control Cantor set | components open and cover | Cantor set: infinitely many | hypothesis needed, present |
| rank constant on components, varying across (517–523) | two components ranks 0 and 1 | local system r = 0 on one | r = 1 on the other | allowed as stated |
| `OnePoint.equivProjectivization` (1432) | Mathlib line 84–85 | `∞ ↦ [1:0]`, `t ↦ [t:1]` | README `t ↦ [t:1]`, `∞ ↦ [1:0]` | holds |
| ℂP⁰ a point; T2/compact/second countable/connected (1427–1429) | n = 0 | one line | pinned instances 149/188/215/251 (path connected needs `Nontrivial V`) | holds; pinned |
| Sakane central reduction (1558–1584) | sakane 106–115 | A = last nonzero `C^m(G)` central, A∩Γ lattice, π(Γ) lattice | README's A, `Γ∩A`, `Γ̄` | holds |
| Łojasiewicz hypotheses (1341–1346) | line 512–515 | countable analytic manifold, locally finite semianalytic family | README "second-countable … locally finite" | holds |
| `realified_isManifold_analytic` (35) | probe | `restrictScalars_of_ne_zero (m := ∞) ω (by simp) inferInstance` | exit 0 | pinned (R12) |
| `IsKahler` (94) | ℂ with dx∧dy; S⁶ with its standard J | closed, compatible, N = 0 | N ≠ 0 on S⁶ | discriminates; N through sorried data (R01) |
| `bundleSobolevToDistribution` (397) | localize = 0, q = 1 | carrier {v : (v 0).toDistr = 0} | chosen u arbitrary | R11 |
| `complexBesselSymbol` at real z = s (466, 484) | exp((s/2)log(1+|ζ|²)) | (1+|ζ|²)^(s/2) | Mathlib's `besselPotential` weight | identity (R12) |

## Not verifiable

- webster-nn (Webster 1989, K1's Newlander–Nirenberg route), hormander-alpdo1, wells-dacm (K5b/K5 "Wells"), raghunathan-discrete-subgroups (the Malcev theory K8 restates) and griffiths-harris (K3 "chapter 0 §§1–2", K5b): recorded as uncertified in the manifest; cited by locator only, text not read.

## Source issues

- none
