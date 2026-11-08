<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7613#issuecomment-6713953464 -->
Review (claude) of 547b900

Verdict: accepted
Conditional on the announced gaps: `sobolev-maps-class`, `sobolev-maps-weak-differential`, `sobolev-maps-norm`, `sobolev-maps-jacobian`, `sobolev-maps-chain-rules`, `sobolev-maps-euclidean`, `orientation-descent`

No finding. The one finding of round 2 is repaired, the repaired passage is supported by the
source at every cited line, the Lean file elaborates with the five `sorry` warnings as its only
output, no sorried theorem closes under the one-tactic probe, every elaborated signature agrees
with the recorded one and with its README statement, the seeded sample agrees with the certified
texts, every cited library declaration exists at the pin with the hypotheses the README states,
every cross-roadmap citation resolves on main or at the cited open head, the seven declared gaps
are precise, minimal and declared in both `design/plan.json` and the README, and the dependency
check reports no problem. Acceptance is conditional on the seven declared supplier gaps.

## Repair check of round 2

- **REV-PKG-QuasiregularMaps~2/F01 (P3), §7.3 without a locator: repaired.** The first
  paragraph of §7.3 (`packages/QuasiregularMaps/README.md` lines 1539–1547) now reads "… then it
  is `(β/α)ⁿ K`-quasiregularly elliptic for `g'_N` (the definition on a Riemannian manifold is
  HeikkilaPankka2025 lines 20–21; the comparison is §4.1). Hence for closed `N`, quasiregular
  ellipticity does not depend on the metric. This is the reading HeikkilaPankka2025 takes for
  granted: its Theorem 1.1 (line 18) speaks of a closed quasiregularly elliptic manifold without
  fixing a metric, and lines 32–34 measure quasiregularity of a branched covering of a closed `N`
  by a torus against the two smooth structures only." Read in the certified text: line 18 is
  Theorem 1.1 for a closed quasiregularly elliptic `n`-manifold, `n ≥ 2`, with no metric named;
  lines 20–21 define ellipticity for a connected oriented Riemannian `n`-manifold by a non-constant
  quasiregular map from `ℝⁿ`; lines 32–34 say that a piecewise linear branched covering `Tⁿ → N`
  quasiregular for the smooth structures of `Tⁿ` and `N` makes `N` elliptic. Each sentence of the
  repair is supported by the line it cites, and the source does not prove the independence (it
  uses it), which is what the sentence says. The wording differs from the round-2 repair text in
  placing the lines 32–34 locator on the closed-case sentence and adding line 18; both are the
  claims those lines support. `sources.toml` already lists `7.3` under HeikkilaPankka2025.

The repaired pattern (a `Prove` target with no locator) occurs nowhere else: every `### k.n`
section from §1.1 to §7.6 carries a source key at its claim (checked by a scan of each section
for a key of `sources.toml`).

## Verified sound

**Principles.** No route-specific shortcut: every manifold statement is for all `n ≥ 1` on the
general class, with the sources' `n ≥ 2` recorded in the Conventions (README line 104); the
Euclidean statements of `Suggested.lean` carry no dimension hypothesis and the `n = 0` values are
in the table. No re-planned roadmap: the Sobolev class between manifolds is consumed through seven
declared gaps from the board target `packages/SobolevMapsBetweenManifolds/target.md` (T1 at
line 141, T2 at 151, T3 at 160, T4 at 166, T6 at 181, Scope items 1–5 at lines 20–75; each of the
six `needs` sentences names objects and hypotheses that appear there), quasiconformal maps from
TeichmullerGeometry §7.4 at its open head (line 577), and orientations, null sets, the Riemannian
volume, quotient metrics and realizations from Tau Ceti. Supply is downward only. No source
passage is copied (the three certified texts compared at every cited line). No algorithm, no
sorry'd data, no `set_option`, no `lemma`, no `#eval`, no pull-request number, date, process word,
LaTeX delimiter or machine path (grep over README and Lean file: empty).

**Elaboration.** `lake env lean` on `packages/QuasiregularMaps/Suggested.lean` from the content
checkout: exit 0 in 7.7 s real time; output exactly five lines, `declaration uses sorry` at
106:8, 122:8, 175:8, 191:8, 205:8. Imports: `import Mathlib` and
`TauCeti.Analysis.Sobolev.WeakDeriv.Basic`, whose object file was present; no build was run.

**Elaborated signatures.** A scratch copy with `#check @name` for all ten declarations
(`minimalStretch`, `IsQuasiregularOn`, `IsQuasiregularOn.det_le_pow_mul_minimalStretch_pow`,
`IsQuasiregularOn.of_det_le_mul_minimalStretch_pow`, `formalDeriv`, `IsACLOn`, `IsACLpOn`,
`isACLpOn_iff_exists_hasWeakFDerivOn`, `ae_hasLineDerivAt_of_hasWeakFDerivOn`,
`isQuasiregularOn_iff_isACLpOn`) elaborated; a `diff` of the ten types against
`scratch/signatures.md` is empty. Each type matches its README statement (§1.1 line 401, §2.9
lines 788–800, §3.2 lines 914–925, §5.1 lines 1133–1150, §5.2 lines 1194–1203, §5.3 lines
1246–1249): `[FiniteDimensional ℝ F]` on the two §5.2 theorems, `1 ≤ p` on
`isACLpOn_iff_exists_hasWeakFDerivOn`, `1 ≤ K` on `isQuasiregularOn_iff_isACLpOn` and on
`IsQuasiregularOn.of_det_le_mul_minimalStretch_pow`, the measure `volume.restrict Ω` for "almost
every `x ∈ Ω`". No section binder was lost; nothing changed.

**Padding probe.** On the scratch copy every `sorry` was replaced by
`first | rfl | infer_instance | simp_all | simp | (exact TauCeti.HasWeakFDerivOn.ae_eq ‹_› ‹_›)`.
All five fail: type mismatch at lines 113 and 129 (after `simp` made no progress), `assumption`
failures at 184, unsolved goals at 198 and 211. The three definitions have real bodies on native
carriers (`LinearMap.singularValues`, `TauCeti.HasWeakFDerivOn`, `lineDeriv`,
`AbsolutelyContinuousOnInterval`, `MemLp`) and are needed by the headlines; the one proved
`example` (the identity is `1`-quasiregular) tests satisfiability of `IsQuasiregularOn` through
`TauCeti.hasWeakFDerivOn_of_differentiableOn` and is the only example. Nothing restates a
definition, mirrors a Check, computes a value or treats a boundary case.

**Headline theorems** (Summary, README lines 15–27) against `Suggested.lean`:

| headline | status |
| --- | --- |
| `K_I ≤ K_O^{n−1}`, `K_O ≤ K_I^{n−1}` on Euclidean domains (MartioRickmanVaisala1969 (2.25)) | stated: `IsQuasiregularOn.det_le_pow_mul_minimalStretch_pow`, `IsQuasiregularOn.of_det_le_mul_minimalStretch_pow` |
| the same between manifolds | docstring line 33: not statable, lacks `W^{1,n}_loc(M, N)` |
| `ACL^p = W^{1,p}_loc` for continuous maps; agreement with Definition 2.20 | stated: `isACLpOn_iff_exists_hasWeakFDerivOn`, `ae_hasLineDerivAt_of_hasWeakFDerivOn`, `isQuasiregularOn_iff_isACLpOn` |
| simplicial maps are quasiregular | docstring line 35: not statable |
| ellipticity independent of metric and orientation | docstring line 38: not statable |
| closed flat manifolds `1`-elliptic | docstring line 40: not statable |
| branched coverings by tori | docstring line 41: not statable |

`TauCeti/Analysis/Sobolev` at the pin is Euclidean (`HasWeakFDerivOn` on `Opens E` of a normed
space, `W1p` scalar on an open set of `E`); no class of maps between manifolds exists in Mathlib
or Tau Ceti, so the five docstring entries are correct. The Euclidean form of §3.2 is the source's
own theorem in its own setting (line 438 with Definition 2.20 at 409–412 on domains of `ℝⁿ`), not
a stand-in. Every backticked name the README attributes to the roadmap is declared (ten names at
README lines 401, 791, 919, 922, 1135, 1140, 1143, 1197, 1200, 1249) and every Lean name appears
in the README. The two leads of `roadmaps resolve` (`scratch/citations.md`, the §3.2 theorem
names) are these own declarations.

**Dependency check.** Output of the gate command on the README:

```
depcheck: 240 roadmaps, 2370 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. QuasiregularMaps is at line 272 of the merge order, directly after
TeichmullerGeometry (271); FourManifolds (125), named under Downstream consumers as a supplier of
Part III, precedes it. DifferentialGeometry, RiemannianGeometry, GeometricTopology and PDE are on
main.

**Sources: the seeded sample.** Certified texts read at the cited lines (`MRV` =
MartioRickmanVaisala1969, `HP` = HeikkilaPankka2025); uncertified ones cited by locator only.

| target | locator | read | result |
| --- | --- | --- | --- |
| 1.3 | MRV (2.25) line 438 | yes | `K_O ≤ K_I^{n−1}`, `K_I ≤ K_O^{n−1}`, best possible (439); the README's pointwise form with `J > 0` implies it |
| 1.4 | MRV (2.23) 426–430, (2.24) 435–436 | yes | (2.23): `(Σ_{i,j} (∂_j f_i)²)^{n/2} ≤ n^{n/2} K J`; (2.24): `K_S ≤ K_O ≤ n^{n/2} K_S`, best possible |
| 2.2 | MRV 412–413, 418–419 | yes | the smallest `K ≥ 1` with (2.21) a.e. is `K_O`; `K_O = K_I = K = ∞` when not quasiregular |
| 2.4 | Rickman1993 Ch. I (uncertified); supplier T4 | no | Hadamard and `J_f ∈ L¹_loc` for `p ≥ n` are in T4 (target line 166–175), declared as gap `sobolev-maps-jacobian` |
| 2.6 | Rickman1993 Ch. I (uncertified) | no | the route is a pinned declaration, `W1p.exists_value_ae_eq_const_of_gradient_eq_zero` (Wirtinger/W1p.lean 436, `IsPreconnected Ω`), checked in the table |
| 2.9 | MRV Def 2.20 409–412; Prywes 22–26 | yes | `ACLⁿ`, `K ≥ 1`, `‖f'‖ⁿ ≤ K J` a.e.; Prywes: `J_f = det(Df)` (line 26) |
| 3.1 | MRV 413–419 | yes | inner dilatation the smallest `K ≥ 1` with (2.22) for quasiregular `f`; `K(f) = max`; `K`-quasiregular means `K(f) ≤ K` (418) |
| 3.2 | MRV (2.25) 438–439; 423–425 | yes | both inequalities, best possible; the projection satisfies (2.22) with `K = 1` and is not quasiregular, as the Lean docstring says |
| 3.4 | MRV (2.23)–(2.24) 426–436 | yes | as for 1.4; `K_S` the smallest `K ≥ 1` with (2.23) a.e. (433–434) |
| 4.3 | Rickman1993 Ch. I (uncertified); supplier T1(a) | no | chain rule with null preimages is gap `sobolev-maps-chain-rules` (target line 143–144) |
| 5.2 | Vaisala1971 Ch. 3, Rickman1993 Ch. I (uncertified); MRV 332–340 | partly | Definition 2.16 read: continuous, absolutely continuous on almost every axis-parallel segment of each `n`-interval `Q` with closure in `U`, exceptional set of `(n−1)`-measure zero; `ACL^p` for `p ≥ 1` (339–340); the theorem itself is checked in the table |
| 5.3 | MRV Def 2.20, (2.21) 409–411; `J(x, f)` 124–125; `f'` 118–121 | yes | the right-hand side of the Lean `iff` is Definition 2.20 with `J = det f'` |
| 6.1 | HP Appendix B 1236–1245 | yes | piecewise smooth triangulation: a locally finite complex with a smooth rank-`dim σ` extension of each simplex, as §6.1 line 1344–1346 says |
| 6.4 | HP Prop. B.1 1247–1251, proof 1317–1339 | yes | closed oriented PL Riemannian `n`-manifolds, `n ≥ 2`, non-degenerate orientation-preserving PL map; simplexwise bound `max ‖Dϕᵢ‖ⁿ / min det Dϕᵢ` (1331–1338) |
| 7.2 | HP 20–21 | yes | ellipticity for a connected oriented Riemannian `N`; the reflection argument is the roadmap's, computed in the table |
| 7.3 (repaired) | HP 18, 20–21, 32–34 | yes | see the repair check |

Also read: HP 22–27 (the class and (1.1)), 52–57 (Prywes's bound; the torus), 85–96 (torus
branched coverings; Corollary 1.2), 268–275 (`K`-quasiregular ellipticity), 1255–1262 (Lemma
B.2, closed `M`); Prywes 28–36 (Theorem 1.1, Bonk–Heinonen, the torus); MRV 440–444 (Lemma 2.26).
All eleven cited works are in `sources.toml` with `cited_for` listing the sections that use them;
the References block agrees.

**Library declarations opened at the pins** (file and line). Mathlib, under `Mathlib/`:
`LinearMap.singularValues` (Analysis/InnerProductSpace/SingularValues.lean 95),
`singularValues_antitone` (142), `injective_iff_forall_lt_finrank_singularValues_pos` (156),
`LinearMap.normDet` (NormDet.lean 69), `normDet_eq_prod_singularValues` (374),
`normDet_eq_abs_det` (389), `Orientation.volumeForm` (Orientation.lean 170), `volumeForm_robust`
(198), `volumeForm_neg_orientation` (223), `abs_volumeForm_apply_le` (245), `volumeForm_map`
(290), `essSup` (MeasureTheory/Function/EssSup.lean 46), `essSup_le_of_ae_le` (109),
`ae_le_essSup` (266), `AbsolutelyContinuousOnInterval`
(MeasureTheory/Function/AbsolutelyContinuous.lean) and `.ae_differentiableAt` (444, scalar
`f : ℝ → ℝ`, which the README's "componentwise in a basis of `F`" accounts for),
`.integral_mul_deriv_eq_deriv_mul` (Integral/IntervalIntegral/AbsolutelyContinuousFun.lean 259),
`volume_preserving_piFinSuccAbove` (Constructions/Pi.lean 819),
`IsOpen.ae_eq_zero_of_integral_contDiff_smul_eq_zero` (Analysis/Distribution/AEEqOfIntegralContDiff.lean
205), `LipschitzWith.ae_differentiableAt` (Analysis/Calculus/Rademacher.lean 386),
`Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le` (MeanValue.lean 423) and its primed form
(527), `extChartAt` (Geometry/Manifold/IsManifold/ExtChartAt.lean 437),
`Manifold.locallyCompact_of_finiteDimensional` (909), `DifferentiableAt.conformalAt`
(Analysis/Complex/Conformal.lean 147), `lineDeriv` (Analysis/Calculus/LineDeriv/Basic.lean 109),
`HasLineDerivAt` (81), `LineDifferentiableAt` (92), `measurableSet_lineDifferentiableAt`
(LineDeriv/Measurable.lean 37, `Continuous f`) and `measurable_lineDeriv` (44, `Continuous f`,
which the README's "by the argument of" acknowledges), `EuclideanSpace.basisFun`
(Analysis/InnerProductSpace/PiL2.lean 782), `EuclideanSpace.single` (317), `Module.Basis.constr`
(LinearAlgebra/Basis/Defs.lean 507), `LinearMap.toContinuousLinearMap`, `MemLp`
(MeasureTheory/Function/LpSeminorm/Defs.lean 154), `LocallyIntegrableOn`
(Function/LocallyIntegrable.lean 50), `measureSpaceOfInnerProductSpace` (Measure/Haar/OfBasis.lean
310), `LinearMap.det`, `fderiv_id` (Analysis/Calculus/FDeriv/Basic.lean 717),
`ContinuousLinearMap.norm_id` (Analysis/Normed/Operator/Basic.lean 320). Tau Ceti, under
`TauCeti/`: `LinearMap.norm_toContinuousLinearMap_eq_singularValues_zero`
(Analysis/OperatorIdeal/ApproximationNumber/EckartYoung.lean 98),
`LinearMap.singularValues_mul_norm_le_norm_apply` (Analysis/InnerProductSpace/SingularValues.lean
325), `frobenius_apply_eq_sqrt_sum_sq_singularValues` (UnitarilyInvariantSeminorm/Frobenius.lean
191), `Manifold.Orientation` (Geometry/Manifold/Orientation/Basic.lean 32), `.neg` (97),
`.orientationAt` (140), `.eq_or_eq_neg` (172, `[PreconnectedSpace M]`), `.model` (235),
`IsOrientationPreservingAt` (Orientation/Preserving.lean 63), `IsOrientationReversingAt` (82),
`Orientation.restrict` (OpenSubset.lean 49), `Orientation.pullback` (Pullback.lean), `IsNullSet`
(Geometry/Manifold/Measure.lean 36), `.iUnion` (72), `.interior_eq_empty` (89),
`riemannianVolume` (Riemannian/VolumeDensity/Volume.lean 82),
`isLocallyFiniteMeasure_riemannianVolume` (179), `isOpenPosMeasure_riemannianVolume`
(VolumeDensity/Support.lean 36), `riemannianVolumeForm` (Riemannian/VolumeForm.lean 55),
`WithMetric` (Riemannian/WithMetric.lean 68), `IsLocalRiemannianIsometry`
(Riemannian/Isometry/Local.lean 70), `Bundle.ContMDiffRiemannianMetric.quotient`
(Riemannian/Pullback/Descent.lean 258) and `isLocalRiemannianIsometry_descend` (189),
`TauCeti.isLocalDiffeomorph_quotientMk` (Geometry/Manifold/Instances/Quotient.lean 253),
`HasWeakFDerivOn` (Analysis/Sobolev/WeakDeriv/Basic.lean 251: for every direction `v` a weak
line derivative, hence `CompleteSpace F` and local integrability of `u` and of each `x ↦ U x v`
on `Ω`), `HasWeakFDerivOn.mono` (292), `Module.Basis.hasWeakFDerivOn_of_forall` (657),
`hasWeakFDerivOn_of_differentiableOn` (747), `HasWeakFDerivOn.ae_eq` (856, `=ᵐ[μ.restrict Ω]`,
in finite dimension), `hasWeakFDerivOn_iff_forall_isCompact_closure` (WeakDeriv/Local.lean 71:
iff on every open `V` with compact closure in `Ω`), `hasWeakFDerivOn_of_hasFDerivAt_off_countable`
(WeakDeriv/Removable.lean 43), `LocallyLipschitzOn.hasWeakFDerivOn_fderiv` (WeakDeriv/Lipschitz.lean
134), `HasWeakLineDerivOn.absolutelyContinuousOnInterval` (WeakDeriv/Interval.lean 302),
`.ae_hasDerivAt` (318), `W1p` (Sobolev/W1p/Basic.lean 372),
`W1p.exists_value_ae_eq_const_of_gradient_eq_zero` (Sobolev/Poincare/Wirtinger/W1p.lean 436),
`LocallyLipschitzOn.ae_differentiableAt_of_mem` (Analysis/Calculus/Rademacher.lean 83),
`DifferentiableOn.addHaar_image_eq_zero_of_finrank_lt_finrank` (Calculus/Sard/LowDimension.lean 73),
`cantorFunction` (Analysis/SpecialFunctions/CantorFunction.lean 71),
`not_absolutelyContinuousOnInterval_cantorFunction` (245), `IsSmoothTriangulation`
(Geometry/Manifold/SmoothTriangulation/Basic.lean 191), `IsSimplexImmersion` (97),
`exists_contMDiff_not_isSmoothTriangulation_trans` (365), `AbstractSimplicialComplex.Realization`
(AlgebraicTopology/SimplicialComplex/Realization/Basic.lean 380), `faceInclusion` (150),
`continuous_faceInclusion` (169), `faceBarycenter` (80), `carrier` (362),
`exists_finset_support_subset_of_isCompact` (Realization/Compact.lean 87),
`compactSpace_realization_iff_finite` (97), `PreAbstractSimplicialComplex.SimplicialMap`
(SimplicialComplex/Maps.lean 36), `.realizationMap` (Realization/Basic.lean 565, documented in
Realization/Map.lean), `IsPure` (SimplicialComplex/Pure.lean 37). Count: 93 declarations, all
present with the hypotheses the README states.

**Cross-roadmap citations.** DifferentialGeometry on main: Layer 2 (README line 341) with 2.1
(345: `Manifold.Orientation`, `neg`, `orientationAt`, `eq_or_eq_neg` on preconnected `M`) and 2.2
(352: `IsOrientationPreservingAt`, pullback orientations along local diffeomorphisms); Layer 12
(910) with 12.1 (915: `Opens` metrics) and 12.4 (923: `riemannianVolumeForm`,
`TauCeti.riemannianVolume` with full support). RiemannianGeometry R4 item 7 on main (lines
749–756: Killing–Hopf, the quotient atlas, descended metric and covering for a free properly
discontinuous discrete group of smooth isometries on any Riemannian manifold). GeometricTopology
Layer 11 on main (849–862: realization, maps, restriction, the compactness lemma in the wording
the contract uses). PDE Layer 1 (675) and 1.1 (677: the absolutely continuous representative of
`W^{1,p}(a, b)` with derivative in `L^p`). TeichmullerGeometry §7.4 at its open head (line
577–579: weak Wirtinger derivatives of `W^{1,2}_loc` maps, orientation-preserving quasiconformal
maps as `W^{1,2}_loc` homeomorphisms with `f_z̄ = μ f_z` a.e., `‖μ‖_∞ < 1`, dilatation
`(1 + ‖μ‖_∞)/(1 − ‖μ‖_∞)`). `scratch/overlaps.md`: no pull request changes this roadmap, no cited
id is dropped, no id is defined only by an open revision.

**Duplication by object.** `roadmaps grep` over main and all 472 open heads: "quasiregular"
matches only CrystallineCohomology's quasiregular semiperfect rings and the Margulis–Tomanov
`StronglyQuasiregularMap` of GeometryOfNumbersAndQuadraticArithmetic (line 1486, a rational map on
an algebraic group), different objects; "dilatation" matches TeichmullerGeometry 578 (its planar
quasiconformal dilatation, which §2.10 consumes), and unrelated uses; `ACL`, "minimal stretch",
`W^{1,n}_loc`, "quasiregularly elliptic", `IsSmoothTriangulation`: no match. "smooth
triangulation" matches PlanarTopology, HomotopySpheres, ArithmeticLocallySymmetricSpaces and
GeometricTopology for Whitehead's theorem and compact triangulations, none of which states the
measure-theoretic facts of §6.1 (local finiteness, purity, null skeleton, bi-Lipschitz simplices).
The closest open roadmap by vocabulary, SobolevDifferentialForms, owns real-valued forms on open
subsets of `EuclideanSpace ℝ (Fin n)` (its line 19), not maps. Tau Ceti's
`Orientation/Cover/Descent.lean` descends differential forms along the orientation double cover
(its three theorems `exists_mpullback_proj_eq_iff`, `exists_mpullback_proj_eq_invariantPart`,
`exists_smoothForm_mpullback_proj_eq_iff`), `Orientation/Atlas.lean` 143 builds an orientation
from an oriented atlas, and `Orientation/Torus.lean` 67 orients the torus; none descends an
orientation to a general orbit space `X/Γ`, so the gap `orientation-descent` asks for nothing
provided. Ownership against open pull requests was checked through the tool over every head.

**Declared gaps.** The seven slugs are in `design/plan.json` (`gaps`, with suppliers
SobolevMapsBetweenManifolds T2/T2/T3/T4/T1(a)-(b)/T1+T6 and DifferentialGeometry Layer 2) and
each README contract reads `What <Supplier> must provide (gap:<slug>): …` (lines 319, 323, 327,
331, 335, 339, 351), one object with its hypotheses per sentence. Precise and minimal: nothing at
the pins or on main provides the class, its weak differential, norm, Jacobian, chain rules or
Euclidean compatibility between manifolds, nor the orientation descent to an orbit space.

**Shape and style.** Summary, Scope and ownership, Conventions, Exact supplier contracts (per
supplier), How to read the build, seven layers of `### k.n` prose each ending with `### Examples`
and `### Dependencies` (lines 554/561, 862/868, 987/1001, 1112/1120, 1274/1280, 1482/1488,
1648/1657), Downstream consumers, Worked examples, References. Every definition has an API list
and at least three Checks (§1.1: 5, §1.2: 5, §1.4: 5, §2.1: 4, §2.2: 4, §2.8: 3, §2.9: 5, §3.1:
3, §3.4: 3, §5.1: 6, §6.2: 3, §7.1: 4); every target a `*Needs:*` line and a locator; Unicode
mathematics; no target tables or field lists; no "optional" or "deferred". `metadata.toml` topic
`math.CV` matches MSC 30C65.

**Adversarial pass.** One row per sampled target, headline theorem and repaired passage, plus
the sections used by their routes; values computed on both sides.

| statement | instances tried | values computed | result |
| --- | --- | --- | --- |
| §1.1 `ℓ(A) = σₙ`, index `n − 1`; API | `diag(3, 1/2)`; shear; projection `diag(1,0)`; `n = 1`; `n = 0` | index 1 of `(3, 1/2)` is `1/2`, index 0 is `3`, index 2 is `0`; shear `AᵀA = [[1,1],[1,2]]`, eigenvalues `(3 ± √5)/2`, `ℓ = (√5 − 1)/2 ≈ 0.618`, basis minimum would give `1`; projection `ℓ = 0`, `‖A‖ = 1`; `ℓ(a·id) = |a|`; `n = 0`: index `0`, value `0`, `0⁰ = 1`; `ℓ(A)‖A⁻¹‖ = (1/2)·2 = 1`; `ℓ = ‖A‖` iff all `σᵢ` equal iff `A = cU` | holds |
| §1.2 conventions, submultiplicativity | `diag(2,1)`; `R = diag(−1,1)`; `0`; `R∘R`; `−id`, `n = 2, 3` | `q_O = 4/2 = 2`, `q_I = 2/1 = 2`; `q_O(R) = ∞`, `q_I(R) = 0`, naive `−1`; `q_O(0) = q_I(0) = 0`; `q_I(id) = 1 > 0·0`, so the sign hypotheses are used; `J(−id) = (−1)ⁿ`: `∞` for `n = 3`, `1` for `n = 2`; `q_O(BA) ≤ q_O(B)q_O(A)` in the four cases `J(A), J(B) > 0` (`‖BA‖ⁿ ≤ ‖B‖ⁿ‖A‖ⁿ`), `A = 0` or `B = 0` (`0 ≤ 0`), `A ≠ 0 ≠ B` with a non-positive Jacobian (`∞` on the right) | holds |
| §1.3 iffs with `K ≥ 0` | `J > 0`; `A = 0`; `A ≠ 0`, `J ≤ 0`; `K = −1` with `R` | `‖A‖ⁿ/J ≤ K` iff `‖A‖ⁿ ≤ KJ`; `0 ≤ 0` and `0 ≤ K`; `‖A‖ⁿ > 0 ≥ KJ` false and `∞ ≤ K` false; `J ≤ Kℓⁿ` true and `0 ≤ K` true when `J ≤ 0`; `1 ≤ (−1)(−1)` true while `∞ ≤ −1` false, so `K ≥ 0` is used | holds |
| §1.3 pointwise (2.25), equality cases | `diag(2,1,1)`; `diag(1,1,1/2)`; `diag(3,2,1)`; `n = 1`; `n = 2`; `diag(1,0)` | `q_I = Π_{i≤n−1} σᵢ/σₙ ≤ (σ₁/σₙ)^{n−1}` and `σ₁/σₙ ≤ q_O = Π_{i≥2} σ₁/σᵢ` (a factor of it, `n ≥ 2`); `4 = 2²` (`σ₂ = σ₃`); `q_O = 2`, `q_I = (1/2)/(1/8) = 4 = 2²` (`σ₁ = σ₂`); `q_O = 27/6 = 9/2`, `q_I = 6`, `6 < 81/4`, `9/2 < 36`; `n = 1`: `1 ≤ 1⁰`; `n = 2`: `q_O = q_I = σ₁/σ₂`; projection: `q_O = ∞ ≤ 0¹` fails, `0 ≤ ∞` holds | holds |
| §1.4 `q_S ≤ q_O ≤ n^{n/2} q_S` | `diag(2,1)`; `diag(1, ε)`; `diag(1, ε, ε)`; `id`; `0`; `diag(−1,1)` | `‖A‖_HS² = 5`, `q_S = 5/(2·2) = 5/4 ≤ 2 ≤ 5/2`; `q_O/q_S = (1/ε)/((1+ε²)/(2ε)) = 2/(1+ε²) → 2`; `(1/ε²)/((1+2ε²)^{3/2}/(3^{3/2}ε²)) = 3^{3/2}/(1+2ε²)^{3/2}`; `n^{n/2}/n^{n/2} = 1`; `0`; `∞`; `σ₁ⁿ ≤ (Σσᵢ²)^{n/2} ≤ n^{n/2}σ₁ⁿ`, upper equality forces `σ₂ = … = 0`, impossible with `J > 0`, `n ≥ 2`; AM–GM `(Σσᵢ²/n)^{n/2} ≥ Πσᵢ` gives `q_S ≥ 1`, equality iff all `σᵢ` equal iff `q_O = 1` | holds, matches MRV (2.23)–(2.24) |
| §2.1 `K`-quasiregular | identity; `(M,o) → (M,−o)` with `K = −1`; fold; `max(0,t)`; `0 ≤ K < 1` | `1 ≤ 1·1`; `J = −1`, `1 ≤ (−1)(−1)` true but `1 ≤ K` fails; `‖DF‖ = 1`, `J_F = sign x₁`, fails on `{x₁ < 0}`, `|J|` would accept it; `Df ∈ {0,1}` on `ℝ`; `‖Df‖ⁿ ≤ KJ_f ≤ K‖Df‖ⁿ` forces `Df = 0` | holds |
| §2.2 `K_O = max(1, ess sup q_O)` | constant; `z ↦ z²`; radial `a = 2`, `1/2` in `ℝ³`; fold | `ess sup 0`, `K_O = 1`; `‖Df‖ = 2|z|`, `J = 4|z|²`, `q_O = 1` off `0` and `0` at `0`, `K_O = 1`; singular values `a r^{a−1}` once and `r^{a−1}` twice: `q_O = max(a,1)³/a = 4` and `2`; `q_O = ∞` on `{x₁ < 0}`, naive ratio `±1` | holds, matches MRV 412–413, 418–419 |
| §2.3 attainment | identity; fold; `M = ∅` | `[1, ∞)`; empty set, `K_O = ∞`; measure `0`, `ess sup 0`, `K_O = 1`, set `[1, ∞)` | holds |
| §2.4 Jacobian | `z ↦ z²`; projection, `n ≥ 2`; radial `a > 0` | `J = 4|z|² ≥ 0`, `Df = 0` only at `0`; `J_P = 0`, `DP ≠ 0`, not quasiregular; `J = a r^{n(a−1)}`, `∫₀¹ r^{n(a−1)+n−1} dr < ∞` iff `na > 0`; `J ≥ 0` from `‖Df‖ⁿ ≥ 0`, `K > 0`; `Df = 0` where `J = 0` from `‖Df‖ⁿ ≤ 0` | holds |
| §2.5 locality, cover formula | shear `(x, y + x³/3)`; `z²` on `{Re z > 0}`; `M = ∅` | `DfᵀDf = [[1+x⁴, x²],[x², 1]]`, `λ_max = ((x² + √(x⁴+4))/2)²` (checked: `((x²+s)/2)² = (x⁴ + x²s + 2)/2` with `s² = x⁴+4`), `J = 1`, `K_O = ∞` on `ℝ²`, `((R² + √(R⁴+4))/2)²` on `{|x| < R}`; injective, `1`-quasiregular; `max(1, 0) = 1` | holds |
| §2.6 vanishing differential | two balls; Cantor `(c(x₁), 0)`; `max(0,t)` | not constant, connectedness used; not `ACL` (line functions in direction 1 on `[0,1]²` are `c`), hence not `W^{1,1}_loc` by §5.2; `J = 1` on `(0,∞)`, `0` on `(−∞,0)`: positive on a set of positive measure only | holds |
| §2.7 `C¹` maps | `(x,y) ↦ (x³, y)`; `−id`; `ℝⁿ → ℝⁿ/ℤⁿ`; `z²` | `df = diag(3x², 1)`, `J = 3x²`, `q_O = max(3x²,1)²/(3x²) → ∞`, `df_0 = diag(0,1) ≠ 0` with `J = 0`; `J = (−1)ⁿ`; `‖dπ‖ = J = 1`; `1`-quasiregular, not injective; `q_O` lower semicontinuous (at `J > 0` continuous, at `0` value `0`, at `A ≠ 0`, `J ≤ 0` value `∞` with `‖B‖ⁿ/J(B) → ∞` or `∞` nearby), so `ess sup = sup` for a measure positive on open sets | holds |
| §2.8 locally Lipschitz | winding map; fold; `|x|^{1/2}` | singular values `2, 1, 1`, `J = 2`, `K_O = 4`, `K_I = 2`; `1`-Lipschitz, not quasiregular; `W^{1,p}_loc(ℝ)` iff `p < 2`, so "every `p`" is Lipschitz-specific | holds |
| §2.9 `IsQuasiregularOn` | radial `a > 0`, `a = 0`; `−o` on the target; identity; fold; `Ω = ∅`; `n = 0` | `‖Du‖ⁿ ≍ r^{n(a−1)}` integrable near `0` iff `a > 0`; `x/|x|` discontinuous and `r^{−n}` non-integrable; `J = −det Du`; `1 ≤ 1·1` (proved in Lean); `det = −1` on `{x₁ < 0}`; vacuous, every `f` for `K ≥ 1`; `det(0 : End 0) = 1`, `‖Du‖⁰ = 1`, condition `1 ≤ K` | holds; `det`, not `|det|` |
| §2.10 Beltrami | `z + a z̄`; `z̄`; holomorphic; `{f_z = 0}` | with `a = f_z`, `b = f_z̄`: `(|a|+|b|)² ≤ K(|a|+|b|)(|a|−|b|)` iff `|b|(K+1) ≤ |a|(K−1)` iff `|b| ≤ k|a|` when `|a|+|b| > 0`, both true at `a = b = 0`; `(1 + 1/2)/(1 − 1/2) = 3`; `J = −1`; `k₀ = 0`, `K_O = 1`; `f_z = 0` forces `f_z̄ = 0`, `q_O = 0` | holds |
| §3.1 `K_I`, `K` | radial `a = 1/2`, `2` in `ℝ³`; projection; `n = 2` | `K_I = a/min(a,1)³`: `(1/2)/(1/8) = 4`, `2/1 = 2`; `K = 4` both; `q_I(DP) = 0`, `K_I = ∞` by convention; `q_I = q_O = σ₁/σ₂`, `z + z̄/2` has `3`; `K_O = 1 ⇒ Df ∈ {0, λU}` a.e. `⇒ K_I = 1`, and `K_I = 1 ⇒` at `J > 0` all `σᵢ` equal, at `J ≤ 0` `Df = 0` (§2.4) `⇒ K_O = 1` | holds, matches MRV 413–419 |
| §3.2 manifold form | winding map; `diag(3,2,1)`; `n = 1`; radial `a = s`, `1/s` | `4 = 2²`; `9/2`, `6`, both strict; `K_O = K_I = 1`; `K_I = s`, `K_O = s^{n−1}` and the reverse; `K ≤ max(K_O, K_O^{n−1}) = K_O^{n−1}` | holds |
| Thm A `det Du ≤ K^{n−1} ℓ(Du)ⁿ` a.e. | `det > 0`; `det ≤ 0`; radial `a = 1/2`, `ℝ³`, `K = 2`; `n = 1`; `n = 0`; exponent `K` instead | `q_I ≤ (σ₁/σₙ)^{n−1} ≤ q_O^{n−1} ≤ K^{n−1}`; `‖Du‖ⁿ ≤ K det ≤ 0` forces `Du = 0`, `0 ≤ 0`; `det = r^{−3/2}/2 = 4·(r^{−1/2}/2)³ = r^{−3/2}/2`, equality; `det = |Du| ≤ 1·|Du|`; `1 ≤ 1·1`; `r^{−3/2}/2 ≤ r^{−3/2}/4` false; any `Du` agrees a.e. with the definition's (`HasWeakFDerivOn.ae_eq`) | holds, sharp |
| Thm B `IsQuasiregularOn (K^{n−1})` | `det > 0`; `det ≤ 0`; radial `a = 2`, `K = 2`; projection with `K = 1`; constant with `K = 1/2`; `n = 1`; `n = 0` | `q_O ≤ (σ₁/σₙ)^{n−1} ≤ q_I^{n−1} ≤ K^{n−1}`; `Du = 0` from `hf`, `0 ≤ 0`; `det = 2r³ ≤ 2·r³`, `‖Du‖³ = 8r³ = 4·2r³`, attained; `0 ≤ 1·0` but `1 ≤ K'·0` fails, so `hf` excludes it (MRV 423–425); `0 ≤ (1/2)·0` but `1 ≤ 1/2` fails, so `hK` is used; `|Du| ≤ Du`; `1 ≤ 1·1`; local integrability of `‖Du‖ⁿ` transfers along a.e. equality on `Ω` | holds, both hypotheses needed |
| §3.3 projection | `n ≥ 2`; `n = 1` | `J_P = 0 = ℓ(DP)ⁿ`, `‖DP‖ = 1`; `P = 0`, `K_O = 1` | holds |
| §3.4 `K_S` | identity; `diag(2,1)`; `diag(1,ε)`; not quasiregular; `Df = 0`; `Df ≠ 0`, `J ≤ 0` | `1`; `5/4`, `2`; `2/(1+ε²)`; `q_S ≥ q_O/n^{n/2}` unbounded so `K_S = ∞`; `q_S = 0 ≤ K`; `q_S = ∞` and `‖Df‖_HSⁿ > 0 ≥ n^{n/2}KJ` fails; Layer 3 table: winding `6^{3/2}/(2·3^{3/2}) = 2^{3/2}/2 = √2`, radial `(a² + n − 1)^{n/2}/(n^{n/2} a)` | holds |
| §4.1 metric change | `g'_N = c² g_N`; `T²` with `dx² + 4dy²`; `dx² + e^{2x}dy²`; conformal `e^{2x}(dx² + dy²)` | `A^*(ρ_N vol_N) = ρ_N J/ρ_M · vol'_M`, `ρ ∈ [aⁿ, bⁿ]` from Gram eigenvalues in `[a², b²]`, `‖A‖' ≤ (β/a)‖A‖`, so `q'_O ≤ (β/a)ⁿ(bⁿ/αⁿ) q_O = (bβ/(aα))ⁿ q_O`; factor `1`; `‖dπ‖' = 2`, `ρ_N = 2`, `J' = 2`, `q'_O = 4/2 = 2 ≤ 4`; `q'_O = e^{|x|}`; `q'_O = 1` | holds |
| §4.2 orientations | `(M,o) → (M,−o)`; reflection to `(ℝⁿ, −std)`; both reversed; quasiregular for `(o_M, ±o_N)` | `J = −1`; `J = −det R = 1`; unchanged; `J ≥ 0` and `−J ≥ 0` a.e. give `J = 0` a.e., `Df = 0` a.e. (§2.4) | holds |
| §4.3 precomposition | `f ∘ π`; shear with `f = id`; `θ = R`; `q_I` signs | `q_O(Df(θy) ∘ dθ_y) ≤ q_O(Df(θy)) q_O(dθ_y) ≤ K K_θ` off `θ⁻¹` of the null set `{q_O(Df) > K}`; `K_π = 1`; `K_θ = ∞`, `θ` not quasiregular; `J = −1`; `q_I(BA) ≤ q_I(B)q_I(A)` with `J(A), J(B) ≥ 0`: `ℓ(BA) ≥ ℓ(B)ℓ(A)` when both `J > 0`, `0 ≤ …` when one vanishes; `J(dθ) > 0` everywhere, `J_f ≥ 0` a.e.; compact `M'` bounds the continuous `‖dθ‖ⁿ/J(dθ)` | holds |
| §4.4 postcomposition | `z² ∘ z²`; isometry; `a = 2` after `a = 1/2` in `ℝ³` | `z⁴`, `1`; unchanged; `|y| y` with `y = |x|^{−1/2}x` is `|x|^{1/2}|x|^{−1/2}x = x`, `K_O = 1 ≤ 4·2 = 8`; `df_0 = 0` for `a = 2`, `C¹` | holds |
| §5.1 `formalDeriv`, `IsACLOn`, `IsACLpOn` | `(x₂, 0)`; `|x₁|`; `c(x₁)`; `|x|^{1/2}` with `p = 2, 4, 6`; indicator of `{0}`; `x = (1/2,1/2)`, `i = 2`; `n = 0`; `p = 0` | columns `[[0,1],[0,0]] = fderiv`, rows would send `e₁ ↦ e₂`; `(sign x₁, 0)` off the null line, entry `0` on it; direction-1 segments are `c`, not AC; `2π∫₀¹ r^{1−p/2} dr` finite iff `p < 4`; discontinuous; `t ↦ u(1/2, t)` on `[0,1]` versus the unshifted segment to `(1/2, 3/2)`; boxes vacuous (`Fin 0`); `MemLp` at `0` is a.e. strong measurability; closed boxes in `Ω` and open intervals with closure in `Ω` give one class | holds, matches MRV 332–340 |
| §5.2 `ACL^p ⇔ W^{1,p}_loc` | `|x|^{1/2}`; `C¹`; Cantor; strips at `p = 1/2`; `|x₁|` at `p = ∞`; `n = 0`; `Ω = ∅` | agree for each `p`; both true; both false; strips `{|y − 2^{−k}| < 8^{−k}}` disjoint (`2^{−(k+1)} > 8^{−k} + 8^{−(k+1)}` for `k ≥ 1`), `∫|∂₁u| ≈ Σ 8^k · 8^{−k} = ∞`, `∫|∂₁u|^{1/2} ≈ Σ 8^{−k/2}`, `∫|∂₂u|^{1/2} ≈ Σ 2^k 8^{−k} = Σ 4^{−k}`, vertical derivatives have `L¹` norms `≤ Σ 2·2^{−k}`: `ACL^{1/2}` with no weak derivative since one would equal `u'` a.e.; `Du = (sign x₁, 0)`, bounded; `n = 0`: both sides true (`Du = 0`, test identity `0 = 0`); `∅`: both sides vacuous | holds with `1 ≤ p` |
| §5.2 `HasLineDerivAt` a.e. | `|x₁|`; Cantor; strips; measurability | `sign x₁` off the null line; vacuous (no weak derivative); vacuous; the failure set is measurable for continuous `u` (`measurableSet_lineDifferentiableAt` at the pin for global continuity, the same argument on `Ω`), so Fubini applies; the statement concerns `u` only near `x ∈ Ω` | holds |
| §5.3 agreement with Def 2.20 | radial `a = 1/2`, `ℝ³`; identity; `K = 0` constant; `max(0,t)`; `n = 0` | `2`-quasiregular here, `K = 4` in MRV; all `1`; `0 ≤ 0·det 0` and `ACLⁿ` hold, `1 ≤ 0` fails; `f' ∈ {0,1}`; `n = 0`: `IsACLpOn 0` true, `‖f'‖⁰ = 1 ≤ K·1`, both sides `K ≥ 1`; `(⇒)` `Du ∈ Lⁿ` on compacts from `‖Du‖ⁿ ∈ L¹_loc` with a.e. strong measurability from the directional local integrability in a basis; `(⇐)` §5.2 at `p = n ≥ 1` gives `Du = f'` a.e. | holds; `1 ≤ K` used |
| §6.1 triangulations | local finiteness route; purity; `S¹` by a triangle; `t ↦ t²`; infinite star | `p = v₀`, `σ = {v₀,v₁}`: `b_σ = (1/2,1/2)`, point `(1 − t/2, t/2)` has carrier `σ` for `t ∈ (0,1]`, limit `p`; for maximal `τ`, `|K| ∖ τ°` is the union of the other closed simplices, closed in the weak topology (its trace on each closed simplex is a finite union of faces), so `τ°` is open and `κ(τ°)` is a non-empty open set, null if `dim τ < n`; `dim τ > n` contradicts an injective differential into `ℝⁿ`; chains above a simplex are finite by local finiteness; `|p(t)|² = 1 − 3t + 3t² ∈ [1/4, 1]`, `dθ/dt = (√3/2)/|p|² ∈ [√3/2, 2√3]`; `√t` not Lipschitz at `0`; `{v}` compact with carrier `{v}` meets every edge, no compact neighbourhood of `v` | holds |
| §6.2 non-degenerate, orientation preserving | identity; fold; vertex collapse | `J(dp) > 0` on closed `κ₁(σ)` by continuity, positivity on `κ₁(σ°)` and non-vanishing; fold reverses on `x₁ < 0`; rank `n − 1` | holds |
| §6.3 locally Lipschitz | eight-sector map; `|x₁|`; gluing | `L = [[1,−1],[0,√2]]` (from `e₁ ↦ e₁`, `(1,1)/√2 ↦ e₂`), `det = √2`, `LᵀL = [[1,−1],[−1,3]]`, eigenvalues `2 ± √2`, `q_O = (2+√2)/√2 = 1 + √2`, `q_I = √2/(2 − √2) = 1 + √2`; `1`-Lipschitz; `L`-Lipschitz on finitely many closed pieces covering a segment gives `L`-Lipschitz | holds |
| §6.4 simplicial maps quasiregular | identity; `3 × 3` and `6 × 3` grids on `T²`; fold; collapse; `h`-stretch; `K_O = max(1, K_p)` | `K_p = 1`; `9` vertices, `27` edges, `18` triangles, `χ = 0`, distinct vertex sets since `3 ≥ 3`; doubling sends `(i/6, j/3) ↦ (i/3, j/3)` and each triangle to a triangle with the same diagonal, `dp = diag(2,1)`, `q_O = 4/2 = 2`; `J < 0` on `x₁ < 0`; `J = 0` with `dp ≠ 0` on positive measure; `h(k+1) = h(k) + k`, `dp = diag(k,1)`, `q_O = k²/k = k`, `K_p = ∞`; a.e. point lies in some `κ₁(σ°)` where `Dp = dp` (§6.3, null skeleton), `‖dp‖ⁿ ≤ K_p J(dp)` there; `≥` by continuity of `q_O(dp)` on the open `κ₁(σ°)` and positivity of the measure on open sets; `K_p ≥ 1` since `J > 0` on a non-empty `κ₁(σ°)` (purity) | holds, matches HP B.1 |
| §7.1 ellipticity | identity; constant; ball; `n = 1` | `1`; excluded by "non-constant"; a chart ball with bounded distortion on the closed ball makes every `N` elliptic from a ball; `ℝ`, `ℝ/ℤ`; `J_f > 0` on positive measure iff non-constant (§2.6) | holds |
| §7.2 orientation independence | `f ∘ R`; `n = 1` | `J` of `R` for `(std, −std)` is `−det R = 1`, so `R` is an orientation-preserving isometry with `K_R = 1`; §4.2 then §4.3: `f ∘ R` is `K`-quasiregular into `(N, −o_N)`; `J_{f∘R}(x) = −(J_f(Rx) det R) = J_f(Rx)`; non-constant since `R` is bijective; `n = 1`: `R = −id` | holds |
| §7.3 metric independence (repaired) | `g' = c² g`; `T²` with `dx² + 4dy²`; compact `N`; `ℝ²` with `dx² + e^{2x}dy²` | §4.1 with `a = b = 1`: factor `(β/α)ⁿ`, same witness, `(β/α)ⁿK ≥ 1`; `(c/c)ⁿ = 1`; bound `4` while `(x,y) ↦ (x, 2y)` makes it isometric to flat `ℝ²/(ℤ × 2ℤ)`, `1`-elliptic; compact: `|w|'/|w|` continuous and positive on the compact unit sphere bundle has a minimum `α > 0` and a maximum `β`; `ℝ²`: ratio `eˣ` for `∂_y` unbounded, identity has `q'_O = e^{|x|}`, so compactness is used | holds |
| §7.4 transfer | doubling of `T²`; `ℂ ∖ {0} → ℂ`; conjugation; constancy | `q_O(dq) = 4/2 = 2`; `K_q = 1`, `exp` is `1`-quasiregular and non-constant; `K_q = ∞`; `‖dq‖ⁿ ≤ K_q J(dq)` everywhere since `J(dq) > 0`; a constant `q ∘ f` puts the connected `f(ℝⁿ)` in a discrete fibre | holds |
| §7.5 flat manifolds | `Tⁿ`; `ℂ/(ℤ + iℤ)`, `exp`; Klein bottle; rotation by `π`; orientable `ℝⁿ/Γ` | `J_π = 1`, `K_O = 1`; nowhere-zero holomorphic derivative, conformal; glide reflections reverse orientation, no orientation; fixed point, not free; a given orientation on `N ≅ ℝⁿ/Γ` makes the second bullet apply directly, the descent gap is used only to orient a quotient from `Γ` | holds |
| §7.6 branched coverings by tori | `p = id`; doubling after `π`; degenerate `s`; `ℝ²` with the integer grid | `K = 1`; `K_π max(1, K_p) = 1·2 = 2`; no conclusion; `K_π = K_p = 1`, `p ∘ π = id`, `N` not compact; non-constancy: the open `π(ℝⁿ)` meets some `κ₁(σ°)` since the lower skeleton is null, and `p ∘ π` is a local diffeomorphism there | holds, matches HP 32–34, 85–91 |
| Conventions witnesses | `diag(2,1)`; `R`; radial `a = 1/2`; reflection to `−std`; `diag(2,1,1)`, `diag(1,1,1/2)` | `‖A‖² = 4`, `J = 2`, `K = 2` versus `5/4`; `q_O(R) = ∞`, `q_I(R) = 0`, naive `−1`; `K_O = 2`, `K_I = 4`; `J = −1` and `J = +1`; `q_O = 4`, `q_I = 2` and `q_O = 2`, `q_I = 4` | consistent with §1.2–§1.4, §3.1, §4.2 |

## Not verifiable

- Rickman1993 Ch. I and Ch. VI, Vaisala1971 Ch. 3, Reshetnyak1989 Ch. II, IwaniecMartin2001
  Ch. 6, Ahlfors2006 Ch. I, BonkHeinonen2001 Theorem 1.1, Gromov1981 p. 200, Gromov1999 Ch. 2:
  settled as uncertified in the manifest; cited by locator only. The sampled statements they are
  cited for (§2.4, §2.6, §4.3 Rickman Ch. I; §5.2 Vaisala Ch. 3) were checked against
  MartioRickmanVaisala1969 where it covers them (lines 118–127, 332–340, 409–425) and by the
  computations in the table otherwise.
- The Annals versions of HeikkilaPankka2025 and Prywes2019 were not checked; the arXiv numbering
  the manifest records was used throughout.
- The MartioRickmanVaisala1969 scan is image-only and its recognised text is noisy; the cited
  lines were readable for every statement checked. The bar over `Q` in Definition 2.16 (line 335)
  is not visible in the text, so whether the source's segments are those of the open interval or
  of its closure was not settled from the scan; both readings give the class the README defines
  (table row §5.1).

## Source issues

- **Misprint** in HeikkilaPankka2025 at Proof of Proposition B.1, line 1328 (printed page 24):
  the source writes the composite of the Nash embedding and the map as the map after the
  embedding; it should be the embedding after the map, since the embedding goes out of the target;
  affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "547b900fcb33dbef0c00588a2986cb391413ccc2", "job": "REV-PKG-QuasiregularMaps~3", "model": "fable", "worker": "chris-x9"} -->
