<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7613#issuecomment-6705045533 -->
Review (claude) of f046196

Verdict: needs_changes

1. **F01** (P3) §7.3 has no locator

   **Location.** `packages/QuasiregularMaps/README.md` lines 1539–1542: "Prove that if
   `α|w| ≤ |w|' ≤ β|w|` on `TN` and `N` is `K`-quasiregularly elliptic for `g_N`, then it is
   `(β/α)ⁿ K`-quasiregularly elliptic for `g'_N`. Hence for closed `N`, quasiregular ellipticity
   does not depend on the metric. … Route: §4.1".

   **Claim.** The target is a theorem of the roadmap with a route but no locator into a source; it
   is the only `Prove` target of the README without one (every other section from §1.1 to §7.6
   carries a theorem, line or chapter locator at its claim).

   **Witness.** HeikkilaPankka2025 line 20 defines ellipticity for "a connected and oriented
   Riemannian `n`-manifold", and lines 32–34 call a branched covering `Tⁿ → N` "quasiregular with
   respect to smooth structures of `Tⁿ` and `N`", which is exactly the metric independence for
   closed manifolds that §7.3 proves; the comparison behind it is §4.1, whose locators are
   Rickman1993 Ch. I and HeikkilaPankka2025 lines 20–27.

   **Repair.** At the end of the first sentence of §7.3, after "for `g'_N`", add the locator
   "(HeikkilaPankka2025 lines 20–21 for the definition on a Riemannian manifold, and lines 32–34,
   where quasiregularity into a closed manifold is taken with respect to its smooth structure; the
   comparison is §4.1)". Nothing else changes: `sources.toml` already records HeikkilaPankka2025
   with `cited_for` containing "7.3". Tested on the instance that showed the gap: the sentence then
   has a source line for the definition it quantifies over and one for the smooth-structure
   reading it establishes, as §7.2 (lines 20–21) and §7.6 (lines 32–34, 85–91) already do.

One P3 finding, nothing blocking. The single finding of round 1 is repaired, the repaired route
is sound at the pin, the Lean file elaborates with the five `sorry` warnings as its only output,
no sorried theorem closes by one tactic, the seeded sample agrees with the certified sources at
every cited line, every cited library declaration was opened at the pin, every cross-roadmap
citation resolves, and the dependency check reports no problem. Acceptance after the fix round
is conditional on the seven declared supplier gaps.

## Repair check of round 1

- **REV-PKG-QuasiregularMaps/F01 (P3), §6.1 local finiteness: repaired.** The first bullet of
  §6.1 now reads (`packages/QuasiregularMaps/README.md` line 1297) "`K` is locally finite: every
  simplex of `K`, in particular every vertex, is a face of only finitely many simplices; and every
  compact subset of `M` meets `κ(σ)` for only finitely many simplices `σ`", and the Route
  paragraph (lines 1315–1329) derives it from the local compactness of `M`
  (`Manifold.locallyCompact_of_finiteDimensional`), a compact neighbourhood `C` of a point `p`
  with carrier `τ`, the finite vertex set `V` of
  `AbstractSimplicialComplex.exists_finset_support_subset_of_isCompact`, and the segment
  `(1 − t) p + t b_σ` toward the barycentre of each `σ ⊇ τ`, which has carrier `σ` for
  `0 < t ≤ 1` and enters `C`, so `σ ⊆ V`. The compact-set statement is then derived from it. The
  infinite-star Check (lines 1363–1370) records why the realization alone does not suffice.
  Checked at the pin: `Manifold.locallyCompact_of_finiteDimensional`
  (`Mathlib/Geometry/Manifold/IsManifold/ExtChartAt.lean` line 909, hypotheses
  `[LocallyCompactSpace 𝕜] [FiniteDimensional 𝕜 E]` and a `ChartedSpace`, no manifold class),
  `AbstractSimplicialComplex.faceBarycenter` (`…/Realization/Basic.lean` line 80, with
  `faceBarycenter_apply` at 92: coordinate `(card σ)⁻¹` on `σ`, `0` elsewhere), `carrier`
  (line 362: the support of the barycentric coordinates), `continuous_faceInclusion` (line 169,
  for the weak topology defined at 165 as the supremum of the coinduced topologies),
  `exists_finset_support_subset_of_isCompact` (`…/Realization/Compact.lean` line 87:
  `∃ V : Finset ι, ∀ x ∈ s, x.1.support ⊆ V`) and `compactSpace_realization_iff_finite`
  (line 97). The Mathlib and Tau Ceti contracts (lines 199–203 and 293–303), the `*Needs:*`
  line of §6.1 (1372–1380) and the GeometricTopology contract (361–363, now in the wording of
  GeometricTopology Layer 11 on main, line 860) carry the new names. Adversarial pass on the new
  text is in the table below (rows §6.1 route and §6.1 infinite star).

The repaired pattern (a compactness lemma cited for local finiteness) occurs nowhere else: the
remaining uses of `exists_finset_support_subset_of_isCompact` (§6.1 Route, the contracts) and
of `compactSpace_realization_iff_finite` (§6.4, finitely many `n`-simplices on a compact `M`)
use the lemmas for what they state.

## Verified sound

**Principles.** No route-specific shortcut: all manifold statements are for every `n ≥ 1` on
the general class, with the sources' `n ≥ 2` recorded in the Conventions (line 104) and the
Euclidean statements of `Suggested.lean` carrying no dimension hypothesis (the `n = 0` values are
in the table). No re-planned roadmap: the Sobolev class between manifolds is consumed through
seven declared gaps from the board target `packages/SobolevMapsBetweenManifolds/target.md`
(T1 at line 141, T2 at 151, T3 at 160, T4 at 166, T6 at 181; Scope items 2–5 at lines 41–75
were read against the seven `needs` sentences and agree); quasiconformal maps from
TeichmullerGeometry §7.4 at its open head; orientations, null sets, the Riemannian volume, the
quotient metric and realizations from Tau Ceti. Supply is downward only. No source passage is
copied (the three certified texts were compared at every cited line). No algorithm. No sorry'd
data, no `set_option`, no `lemma` keyword, no `#eval`, no pull-request number, date or machine
path (grep over the README and the Lean file: the only hits of "lemma" are the English word in
prose, lines 79, 192, 362, 1328, 1425).

**Elaboration.** `lake env lean` on `packages/QuasiregularMaps/Suggested.lean` from the content
checkout: exit 0 in 10.1 s real time, output exactly five lines, `declaration uses sorry` at
106:8, 122:8, 175:8, 191:8, 205:8. Imports: `import Mathlib` and
`TauCeti.Analysis.Sobolev.WeakDeriv.Basic`, whose object file was present; no build was run. A
scratch copy with `#check @name` for all ten declarations elaborated; every type agrees with
`scratch/signatures.md` and with its README statement (§1.1, §2.9, §3.2 Euclidean form, §5.1,
§5.2, §5.3): `[FiniteDimensional ℝ F]` on the two §5.2 theorems and on §5.3 through
`EuclideanSpace`, `1 ≤ p` on `isACLpOn_iff_exists_hasWeakFDerivOn`, `1 ≤ K` on
`isQuasiregularOn_iff_isACLpOn` and on `IsQuasiregularOn.of_det_le_mul_minimalStretch_pow`;
nothing lost a section binder.

**Padding probe.** On a scratch copy every `sorry` was replaced by
`first | rfl | infer_instance | simp_all | simp`. All five fail: `simp made no progress` at
113, 129 and 184; unsolved goals at 198 and 211. The three definitions have real bodies on
native carriers and are needed by the headlines; the one proved `example` (the identity is
`1`-quasiregular) tests satisfiability of `IsQuasiregularOn` through
`TauCeti.hasWeakFDerivOn_of_differentiableOn` and is the only example.

**Headline theorems** (Summary, lines 15–27) against `Suggested.lean`:

| headline | status |
| --- | --- |
| `K_I ≤ K_O^{n−1}`, `K_O ≤ K_I^{n−1}` on Euclidean domains | stated: `IsQuasiregularOn.det_le_pow_mul_minimalStretch_pow`, `IsQuasiregularOn.of_det_le_mul_minimalStretch_pow` |
| the same between manifolds | docstring line 33: not statable, lacks `W^{1,n}_loc(M, N)` |
| `ACL^p = W^{1,p}_loc` for continuous maps, agreement with Definition 2.20 | stated: `isACLpOn_iff_exists_hasWeakFDerivOn`, `ae_hasLineDerivAt_of_hasWeakFDerivOn`, `isQuasiregularOn_iff_isACLpOn` |
| simplicial maps are quasiregular | docstring line 35: not statable |
| ellipticity independent of metric and orientation | docstring line 38: not statable |
| closed flat manifolds `1`-elliptic | docstring line 40: not statable |
| branched coverings by tori | docstring line 41: not statable |

Neither Mathlib nor Tau Ceti has a Sobolev class of maps between manifolds at the pins
(`TauCeti/Analysis/Sobolev` is Euclidean), so the five docstring entries are correct. The
Euclidean form of §3.2 is MartioRickmanVaisala1969 (2.25) in its own setting (line 438, with
Definition 2.20 at 409–412 on domains of `ℝⁿ`), stated as its own target, not a stand-in. Every
backticked name the README attributes to the roadmap (`minimalStretch`, `IsQuasiregularOn`,
the two §3.2 theorems, `formalDeriv`, `IsACLOn`, `IsACLpOn`, the two §5.2 theorems,
`isQuasiregularOn_iff_isACLpOn`) is declared, and every Lean name appears in the README (lines
401, 791, 919, 922, 1135, 1140, 1143, 1197, 1200, 1249). The two leads of `roadmaps resolve`
(`scratch/citations.md`) are these own declarations.

**Dependency check.** Output of the gate command on the README, unchanged by this review:

```
depcheck: 240 roadmaps, 2367 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. QuasiregularMaps is at line 272 of the merge order, directly
after TeichmullerGeometry (271); FourManifolds (125), named under Downstream consumers as a
supplier of Part III, precedes it. DifferentialGeometry, RiemannianGeometry, GeometricTopology
and PDE are on main.

**Sources: the seeded sample.** Certified texts read at the cited lines; uncertified ones cited
by locator only (under Not verifiable).

| target | locator | read | result |
| --- | --- | --- | --- |
| 1.4 | MRV (2.23) lines 426–430, (2.24) 435–436 | yes | (2.23) is the Hilbert–Schmidt form with `n^{n/2}` on the right; (2.24) `K_S ≤ K_O ≤ n^{n/2} K_S`, "best possible" at 436 |
| 2.1 | HP 20–27; Prywes 22–26; MRV Def 2.20 409–412 | yes | HP: `W^{1,n}_loc`, `‖Df‖ⁿ ≤ K J_f` a.e., `n ≥ 2`, `K ≥ 1`, continuous `f`; Prywes: closed connected orientable target, `J_f = det Df`; MRV: `ACLⁿ`, `K ≥ 1` |
| 2.2 | MRV 412–413, 418–419 | yes | the smallest `K ≥ 1` is the outer dilatation; `∞` when not quasiregular |
| 2.3 | MRV 412–413 | yes | the attainment statement is the existence of that smallest `K` |
| 2.4 | Rickman1993 Ch. I (uncertified); T4 of the supplier | no | Hadamard's inequality and `J_f ∈ L¹_loc` for `p ≥ n` are the gap `sobolev-maps-jacobian` (target T4, line 166, states both) |
| 2.5 | Rickman1993 Ch. I (uncertified) | no | locality is also the chart definition of the class, HP 22–23 |
| 3.2 | MRV (2.25) 438–439 | yes | `K_O ≤ K_I^{n−1}`, `K_I ≤ K_O^{n−1}`, best possible; the Lean docstrings name first and second inequality in the source's order |
| 4.2 | HP 20–27 | yes | oriented manifolds; the sign law is linear algebra on `J_f` |
| 4.3 | Rickman1993 Ch. I (uncertified) | no | chain rule is the gap `sobolev-maps-chain-rules` (T1(a), line 143–144: `D(u ∘ θ)(y) = Du(θ y) ∘ Dθ(y)` a.e.) |
| 5.1 | MRV 118–121 (formal derivative), 332–340 (Def 2.16) | yes | `f'(x) eᵢ = ∂ᵢ f(x)` when all partials exist; `ACL`: continuous, absolutely continuous on almost every axis-parallel segment of each `n`-interval `Q` with closure in `U`, exceptional set of `(n − 1)`-measure zero; `ACL^p`: partials locally `L^p`, `p ≥ 1` |
| 5.3 | MRV Def 2.20, (2.21) 409–411; 412–419; `J(x, f)` 124 | yes | the right-hand side of the Lean `iff` is Definition 2.20 with `J = det f'` |
| 7.1 | HP 20–21, 271–273; Prywes 26–27 | yes | ellipticity for connected oriented `N`; `K`-ellipticity at 271–273 |
| 7.3 | none at the claim (R01); §4.1 cites Rickman Ch. I, HP 20–27 | — | mathematics checked in the table |
| 7.4 | HP 85–91 | yes | composition of a branched covering `T⁴ → N` with the Riemannian covering `ℝ⁴ → T⁴` |
| 7.6 | HP 32–34, 85–91; Prop. B.1 1247–1251 | yes | branched covering quasiregular for the smooth structures gives ellipticity; B.1 for closed oriented PL Riemannian `n`-manifolds, `n ≥ 2` |

Also read: HP 18–19 (Theorem 1.1), 52–57 (Prywes's bound and the torus), 94–96 (Corollary
1.2), 1234–1245 (piecewise smooth triangulation: a locally finite complex and, for each
simplex, a smooth extension `λ` of rank `dim σ` on a neighbourhood, as §6.1 says), 1255–1260
(Lemma B.2: closed `M`, continuous `ρ` with a smooth extension on each `n`-simplex,
`ρ ∈ W^{1,∞}`), 1317–1339 (proof of B.1: local diffeomorphisms `ϕᵢ` and the simplexwise
bound); Prywes 28–36 (Theorem 1.1, Bonk–Heinonen, the torus); MRV 420–425 (quasiconformal
agreement; the projection satisfies (2.22) with `K = 1`), 440–444 (Lemma 2.26). All eleven
cited works are in `sources.toml` with `cited_for` sections the README uses; the References
block agrees with these reads.

**Library declarations opened at the pins.** Mathlib (`Mathlib/…`): `LinearMap.singularValues`
(Analysis/InnerProductSpace/SingularValues.lean 95, zero-indexed, zero beyond the rank),
`singularValues_antitone` (142), `injective_iff_forall_lt_finrank_singularValues_pos` (156),
`normDet` (NormDet.lean 69), `normDet_eq_prod_singularValues` (374), `normDet_eq_abs_det`
(389), `Orientation.volumeForm_robust` (Orientation.lean 198), `volumeForm_neg_orientation`
(223), `abs_volumeForm_apply_le` (245), `volumeForm_map` (290), `ae_le_essSup` (EssSup.lean
266, 355), `essSup_le_of_ae_le` (109), `AbsolutelyContinuousOnInterval`
(MeasureTheory/Function/AbsolutelyContinuous.lean 155, on `uIcc a b`, no order hypothesis) and
`.ae_differentiableAt` (444, scalar `f : ℝ → ℝ`, which the README's "componentwise in a basis
of `F`" accounts for), `.integral_mul_deriv_eq_deriv_mul`
(IntervalIntegral/AbsolutelyContinuousFun.lean 259), `volume_preserving_piFinSuccAbove`
(Constructions/Pi.lean 819), `IsOpen.ae_eq_zero_of_integral_contDiff_smul_eq_zero`
(AEEqOfIntegralContDiff.lean 205), `LipschitzWith.ae_differentiableAt` (Rademacher.lean 386),
`Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le` and its primed form (MeanValue.lean),
`extChartAt` (ExtChartAt.lean 437), `Manifold.locallyCompact_of_finiteDimensional` (909),
`DifferentiableAt.conformalAt` (Complex/Conformal.lean 147), `lineDeriv` (LineDeriv/Basic.lean
109: `deriv` at `0`, junk `0`), `HasLineDerivAt` (81), `LineDifferentiableAt` (92),
`measurable_lineDeriv` (Measurable.lean, needs global `Continuous f`, which the README
acknowledges with "by the argument of"), `EuclideanSpace.basisFun` (PiL2.lean 782),
`Module.Basis.constr` (Basis/Defs.lean 507), `LinearMap.toContinuousLinearMap`
(FiniteDimension.lean 310), `MemLp` (LpSeminorm/Defs.lean 154, with `eLpNorm` at 92: `∞` for
non-measurable functions, `0` at `p = 0`, so `MemLp` at `p = 0` is a.e. strong measurability,
as line 219 says), `LocallyIntegrableOn` (LocallyIntegrable.lean 50),
`measureSpaceOfInnerProductSpace` (Haar/OfBasis.lean 310). Tau Ceti (`TauCeti/…`):
`LinearMap.norm_toContinuousLinearMap_eq_singularValues_zero` (EckartYoung.lean 98),
`LinearMap.singularValues_mul_norm_le_norm_apply` (InnerProductSpace/SingularValues.lean 325:
`σₙ ‖x‖ ≤ ‖A x‖` on the span of the right singular vectors of index `≤ n`, all of `E` for
`n = finrank − 1`), `frobenius_apply_eq_sqrt_sum_sq_singularValues` (Frobenius.lean 191),
`Manifold.Orientation` (Orientation/Basic.lean 32), `.neg` (97), `.orientationAt` (140),
`.eq_or_eq_neg` (172, `[PreconnectedSpace M]`), `.model` (235), `IsOrientationPreservingAt`
(Preserving.lean 63: `[IsManifold I 1 M]`, an equivalence equal to `mfderiv` carrying one
tangent orientation to the other, no differentiability near the point, as line 239–241 says),
`IsOrientationReversingAt` (82), `Orientation.restrict` (OpenSubset.lean 49),
`Orientation.pullback` (Pullback.lean 173: `ContMDiff 1`, invertible `mfderiv` everywhere,
`card ι = finrank`), `IsNullSet` (Measure.lean 36), `.iUnion` (72), `.interior_eq_empty` (89),
`riemannianVolume` (VolumeDensity/Volume.lean 82: `IsManifold I 1`, `LindelofSpace`,
`IsContinuousRiemannianBundle`), `isLocallyFiniteMeasure_riemannianVolume` (179),
`isOpenPosMeasure_riemannianVolume` (Support.lean 36), `riemannianVolumeForm` (VolumeForm.lean
55), `WithMetric` (WithMetric.lean 68), `IsLocalRiemannianIsometry` (Isometry/Local.lean 70),
`Bundle.ContMDiffRiemannianMetric.quotient` (Pullback/Descent.lean 258, in that namespace, for
a `MulAction` with invariant metric, `ContMDiffConstSMul I ∞`) and
`isLocalRiemannianIsometry_descend` (189), `TauCeti.isLocalDiffeomorph_quotientMk`
(Instances/Quotient.lean 253, in namespace `TauCeti`, as cited), `HasWeakFDerivOn`
(WeakDeriv/Basic.lean 251 through `HasWeakLineDerivOn` at 212: `CompleteSpace F`, local
integrability of `u` and `u'` on `Ω`, the identity against `𝓓(Ω, ℝ)`),
`Module.Basis.hasWeakFDerivOn_of_forall` (657), `HasWeakFDerivOn.ae_eq` (`[FiniteDimensional
ℝ E]`, a.e. on `μ.restrict Ω`), `.mono` (292), `hasWeakFDerivOn_of_differentiableOn` (747),
`hasWeakFDerivOn_iff_forall_isCompact_closure` (Local.lean 71),
`hasWeakFDerivOn_of_hasFDerivAt_off_countable` (Removable.lean 43: countable `s`,
`ContinuousOn u Ω`, `LocallyIntegrableOn U Ω μ`, `HasFDerivAt` off `s`, `μ` additive Haar),
`LocallyLipschitzOn.hasWeakFDerivOn_fderiv` (Lipschitz.lean 134, `[FiniteDimensional ℝ F]`),
`HasWeakLineDerivOn.absolutelyContinuousOnInterval` (Interval.lean 302), `.ae_hasDerivAt`
(318), `W1p` (W1p/Basic.lean 372), `W1p.exists_value_ae_eq_const_of_gradient_eq_zero`
(Wirtinger/W1p.lean 436, `IsPreconnected Ω`), `LocallyLipschitzOn.ae_differentiableAt_of_mem`
(Rademacher.lean 83), `DifferentiableOn.addHaar_image_eq_zero_of_finrank_lt_finrank`
(Sard/LowDimension.lean 73), `cantorFunction` (CantorFunction.lean 71), `cantorFunction_of_nonpos`
(162), `cantorFunction_of_one_le` (167), `not_absolutelyContinuousOnInterval_cantorFunction`
(245), `IsSimplexImmersion` (SmoothTriangulation/Basic.lean 97: an extension `F` that is `Cⁿ`
within the standard simplex with a derivative within it injective on the sum-zero directions,
as §6.1 line 1337–1338 says), `IsSmoothTriangulation` (191: a homeomorphism from a realization
that is an immersion on every closed simplex; no local finiteness, no purity),
`exists_contMDiff_not_isSmoothTriangulation_trans` (365), `AbstractSimplicialComplex.Realization`,
`faceInclusion` (Realization/Basic.lean 150), `continuous_faceInclusion` (169), `faceBarycenter`
(80), `carrier` (362), `exists_finset_support_subset_of_isCompact` (Compact.lean 87),
`compactSpace_realization_iff_finite` (97), `PreAbstractSimplicialComplex.SimplicialMap`
(Maps.lean 36), `.realizationMap` (Realization/Map.lean 149), `IsPure` (Pure.lean 37). Count: 90
declarations, all present, each with the hypotheses the README states for it.

**Cross-roadmap citations.** DifferentialGeometry on main: Layer 2 (README line 341) with 2.1
(345, `Manifold.Orientation`, `orientationAt`, `eq_or_eq_neg`) and 2.2 (352,
`IsOrientationPreservingAt`, pullback orientations), Layer 12 (910) with 12.1 (915, `Opens`
metrics) and 12.4 (923, `riemannianVolumeForm` and `TauCeti.riemannianVolume` with full
support). RiemannianGeometry R4 item 7 on main (lines 717–756: Killing–Hopf and the quotient
atlas, descended metric and covering for free properly discontinuous isometry groups).
GeometricTopology Layer 11 on main (831; the compactness lemma at 860 in the wording the
contract now uses). PDE Layer 1 (675) and §1.1 (677: absolutely continuous representatives of
`W^{1,p}(a, b)` with derivative in `L^p`). TeichmullerGeometry §7.4 at its open head (line 577:
weak Wirtinger derivatives of `W^{1,2}_loc` maps, orientation-preserving quasiconformal maps as
`W^{1,2}_loc` homeomorphisms with `f_z̄ = μ f_z`, `‖μ‖_∞ < 1`, dilatation
`(1 + ‖μ‖_∞)/(1 − ‖μ‖_∞)`). `scratch/overlaps.md`: no pull request changes this roadmap, no
cited id is dropped, no id of this roadmap is cited elsewhere.

**Duplication by object.** `roadmaps grep` over main and the open heads: "quasiregular" matches
only crystalline (CrystallineCohomology CR.DDR) and the Margulis–Tomanov
`StronglyQuasiregularMap` of GeometryOfNumbersAndQuadraticArithmetic (line 1506, a rational map
on an algebraic group), different objects; "outer dilatation", "inner dilatation", "minimal
stretch", `ACL`: no match. "Sobolev maps between manifolds" matches
PseudoholomorphicCurveAnalysis §4.1 on main, which defines `W^{k,p}_loc(Σ, M)` for a *surface*
`Σ` and `kp > 2` (supercritical, continuous by Morrey); the critical class `W^{1,n}_loc(M, N)`
in dimension `n` with `p = n` is not that object, so the gaps `sobolev-maps-*` ask for nothing
that roadmap provides. Tau Ceti has `torusOrientation` and the orientation double cover, neither
the descent of an orientation to a general `X/Γ` that `orientation-descent` asks for. Ownership
against open pull requests was checked through the tool over every head.

**Declared gaps.** The seven slugs are in `design/plan.json` (`gaps`, with the suppliers and
sections the README states) and each README contract line reads `What <Supplier> must provide
(gap:<slug>): …` with one object and its hypotheses (lines 319, 323, 327, 331, 335, 339, 351).
Each is precise and minimal: nothing at the pins or on main provides the class, its weak
differential, norm, Jacobian, chain rules or Euclidean compatibility between manifolds, nor the
orientation descent to an orbit space.

**Shape and style.** Summary, Scope and ownership, Conventions, Exact supplier contracts (per
supplier), How to read the build, seven layers of `### k.n` prose each ending with `###
Examples` and `### Dependencies`, Downstream consumers, Worked examples, References. Every
definition has an API list and at least three Checks (§1.1: 5, §1.2: 5, §1.4: 5, §2.1: 4,
§2.2: 4, §2.8: 3, §2.9: 5, §3.1: 3, §3.4: 3, §5.1: 6, §6.2: 3, §7.1: 4); every target a
`*Needs:*` line; Unicode mathematics, no LaTeX delimiters. `metadata.toml` topic `math.CV`
matches MSC 30C65.

**Adversarial pass.** One row per sampled target, headline theorem, repaired passage and
section the previous round summarised without values; values computed on both sides.

| statement | instances tried | values computed | result |
| --- | --- | --- | --- |
| §1.1 `ℓ(A) = σₙ`, index `n − 1` | `diag(3, 1/2)`; shear; projection; `n = 1`; `n = 0` | index 1 of `(3, 1/2)` is `1/2`, index 0 is `3`, index 2 is `0`; shear `AᵀA = [[1,1],[1,2]]`, eigenvalues `(3 ± √5)/2`, `ℓ = (√5 − 1)/2`; projection `ℓ = 0`, `‖A‖ = 1`; `|a|`; `n = 0`: index `0 − 1 = 0`, value `0`, `0⁰ = 1` | holds |
| §1.4 `q_S ≤ q_O ≤ n^{n/2} q_S` | `diag(2,1)`; `diag(1, ε)`; `diag(1, ε, ε)`; `id`; `0`; `J ≤ 0` | HS² `5`, `q_S = 5/4 ≤ 2 ≤ 5/2`; `q_O/q_S = 2/(1 + ε²) → 2`; `3^{3/2}/(1 + 2ε²)^{3/2} → 3^{3/2}`; `1`; `0 ≤ 0 ≤ 0`; `∞ ≤ ∞ ≤ ∞`; AM–GM `(Σσᵢ²/n)^{n/2} ≥ Πσᵢ` with equality iff all `σᵢ` equal iff `q_O = 1`; strict upper bound since `σ₁ⁿ = (Σσᵢ²)^{n/2}` forces `σ₂ = … = 0` | holds, matches MRV (2.24) |
| §1.5 planar `A z = a z + b z̄` | `a = 1, b = 1/2`; `a = 0, b = 1`; `a = 2i`; `z + z̄/3`; `A = 0`; `|b| ≥ |a| > 0` | matrix `[[a₁ + b₁, b₂ − a₂],[a₂ + b₂, a₁ − b₁]]`, `det = |a|² − |b|²`; `‖A‖ = 3/2`, `ℓ = 1/2`, `J = 3/4`, `q_O = 3 = (3/2)/(1/2)`; `J = −1`, `∞`; `1`; `(4/3)/(2/3) = 2`, `k = 1/3`; `0 ≤ (1+k)/(1−k)` and `0 ≤ 0`; `∞` and `|b| ≤ k|a|` false; for `|b| < |a|`: `(|a|+|b|)(1−k) ≤ (1+k)(|a|−|b|)` iff `|b| ≤ k|a|` | holds |
| §2.1 `K`-quasiregular | identity; `(M, o) → (M, −o)` with `K = −1`; fold; `max(0, t)`; `0 ≤ K < 1` | `1 ≤ 1·1`; `J = −1`, `1 ≤ (−1)(−1)` true but `1 ≤ K` fails; `‖DF‖ = 1`, `J_F = sign x₁`, fails on `{x₁ < 0}`; `n = 1`: `Df ∈ {0, 1}`; `‖Df‖ⁿ ≤ K J_f ≤ K ‖Df‖ⁿ` gives `Df = 0` | holds |
| §2.2 `K_O = max(1, ess sup q_O)` | constant; `z ↦ z²`; radial `a = 2`, `1/2` in `ℝ³`; fold | `ess sup = 0`, `K_O = 1`; `‖Df‖ = 2|z|`, `J = 4|z|²`, `q_O = 1` off `0`, `0` at `0`; singular values `a r^{a−1}` once and `r^{a−1}` `n − 1` times give `q_O = a^{n−1} = 4` and `1/a = 2`; `q_O = ∞` on `{x₁ < 0}`, naive ratio `±1` | holds |
| §2.3 attainment | identity; fold; `M = ∅` | `[1, ∞)`; `∅`, `K_O = ∞`; measure `0`, `ess sup = 0`, `K_O = 1`, set `[1, ∞)` | holds |
| §2.4 Jacobian | `z ↦ z²`; projection `n ≥ 2`; radial `a > 0`, `a → 0` | `J = 4|z|² ≥ 0`, `Df = 0` only at `0`; `J_P = 0`, `DP ≠ 0`; `J = a r^{n(a−1)}`, `∫₀¹ r^{n(a−1)} r^{n−1} dr < ∞` iff `na > 0` | holds |
| §2.5 restriction, locality, cover formula | shear `(x, y + x³/3)`; `M = ∅`; uncountable cover | `DfᵀDf = [[1 + x⁴, x²],[x², 1]]`, `λ_max = (2 + x⁴ + x²√(x⁴+4))/2 = ((x² + √(x⁴+4))/2)²`, so `‖Df‖ = (x² + √(x⁴+4))/2`, `J = 1`, `K_O = ∞` on `ℝ²`, finite on `{|x| < R}`; `max(1, 0) = 1`; countable subcover gives `≤`, restriction gives `≥` | holds |
| §2.6 vanishing differential | two balls; Cantor `(c(x₁), 0)`; `max(0, t)` | not constant, so connectedness used; not `ACL` on `[0,1]²` hence not `W^{1,1}_loc` by §5.2; `J = 1` on `(0, ∞)`, `0` on `(−∞, 0)`, positive on positive measure only | holds |
| §2.7 `C¹` maps | `(x, y) ↦ (x³, y)`; `−id`; `ℝⁿ → ℝⁿ/ℤⁿ` | `df = diag(3x², 1)`, `J = 3x²`, `q_O = max(3x², 1)²/(3x²) → ∞`, at `0` `df ≠ 0`, `J = 0`; `J = (−1)ⁿ`; `‖dπ‖ = J = 1`; ess sup of a lower semicontinuous function for an open-positive measure is its sup: `q_O(df_{x₀}) > c` gives an open set of positive measure where `q_O > c` | holds |
| §2.9 `IsQuasiregularOn` | radial `a > 0`, `a = 0`; `−o` on the target; identity; fold; `Ω = ∅`; `n = 0` | `‖Du‖ⁿ ≍ r^{n(a−1)}` integrable iff `a > 0`; `x/|x|` discontinuous, `r^{−n}` not integrable; `J = −det Du`; `1 ≤ 1·1` (proved in Lean); `det = −1` on `{x₁ < 0}`; vacuous, every `f` for `K ≥ 1`; `det = 1`, `1 ≤ K` | holds; `det`, not `|det|` |
| §2.10 Beltrami | `z + a z̄`; `z̄`; holomorphic; `{f_z = 0}` | `a = f_z`, `b = f_z̄`, §1.5 gives `q_O ≤ K` iff `|f_z̄| ≤ k|f_z|` with `k = (K−1)/(K+1)`, `0 ≤ k < 1` for `K ≥ 1`; `(1 + |a|)/(1 − |a|) = 3` at `a = 1/2`; `J = −1`; `k₀ = 0`, `K_O = 1`; on `{f_z = 0}` finiteness forces `f_z̄ = 0`, `q_O = 0`; TG §7.4 maps: `|f_z̄| ≤ ‖μ‖_∞ |f_z|` a.e. | holds |
| §3.1 `K_I`, `K` | radial `a = 1/2`, `2` in `ℝ³`; projection; `n = 2` | `K_O = 2, K_I = 4, K = 4`; `K_O = 4, K_I = 2, K = 4`; `q_I(DP) = 0`, `K_I = ∞` by convention; `q_I = q_O = σ₁/σ₂` | holds |
| §3.2 manifold form | winding map; `diag(3,2,1)`; `n = 1`; `a = s`, `1/s` | `4 = 2²`; `9/2`, `6`, `6 < 81/4`, `9/2 < 36`; `1`; `K_I = s`, `K_O = s^{n−1}` and the reverse | holds |
| Thm A `det Du ≤ K^{n−1} ℓ(Du)ⁿ` a.e. | `det > 0`; `det ≤ 0`; radial `a = 1/2`, `ℝ³`, `K = 2`; `n = 1`; `n = 0`; exponent `K` | `q_I = Π_{i≤n−1} σᵢ/σₙ ≤ (σ₁/σₙ)^{n−1} ≤ q_O^{n−1} ≤ K^{n−1}`; `‖Du‖ⁿ ≤ K det ≤ 0` forces `Du = 0`, `0 ≤ 0`; `det = r^{−3/2}/2 = 2² · r^{−3/2}/8`, equality; `det = |Du| ≤ 1·|Du|`; `1 ≤ 1·1`; `r^{−3/2}/2 ≤ r^{−3/2}/4` false | holds, sharp |
| Thm B `IsQuasiregularOn (K^{n−1})` | `det > 0`; `det ≤ 0`; radial `a = 2`, `K = 2`; projection with `K = 1`; constant with `K = 1/2`; `n = 1`; `n = 0` | `q_O = Π_{i≥2} σ₁/σᵢ ≤ (σ₁/σₙ)^{n−1} ≤ q_I^{n−1} ≤ K^{n−1}`; `Du = 0` from `hf`, `0 ≤ 0`; `det = 2r³ ≤ 2 r³`, `‖Du‖³ = 8r³ = 4·2r³`, attained; `0 ≤ 1·0` but `1 ≤ K'·0` fails, so `hf` excludes it; `0 ≤ (1/2)·0`, conclusion needs `1 ≤ 1/2`, so `hK` used; `|Du| ≤ Du`; `1 ≤ 1·1` | holds, both hypotheses needed |
| §3.3 projection | `n ≥ 2`; `n = 1` | `J_P = 0 = ℓ(DP)ⁿ`, `‖DP‖ = 1`; `P = 0`, `K_O = 1` | holds, matches MRV 423–425 |
| §3.4 `K_S` | identity; `diag(2,1)`; `diag(1, ε)`; `f` in the class, not quasiregular; `Df = 0`; `Df ≠ 0`, `J ≤ 0` | `1`; `5/4`, `2`; `2/(1 + ε²)`; `q_S ≥ q_O/n^{n/2}` unbounded so `K_S = ∞`; `q_S = 0 ≤ K` and `0 ≤ 0`; `q_S = ∞` and `‖Df‖_HSⁿ > 0 ≥ n^{n/2} K J` fails | holds |
| §4.1 metric change | `g'_N = c² g_N`; `T²` with `dx² + 4dy²`; `dx² + e^{2x}dy²`; conformal `e^{2x}(dx² + dy²)` | `‖A‖' ≤ (β/a)‖A‖`, `J' = J ρ_N/ρ_M`, so `q'_O ≤ (bβ/(aα))ⁿ q_O`; factor `(c/c)ⁿ = 1`; `‖dπ‖' = 2`, `ρ_N = 2`, `q'_O = 4/2 = 2 ≤ 4`; `q'_O = e^{|x|}`; `q'_O = 1` | holds |
| §4.2 orientations | `(M, o) → (M, −o)`; reflection to `(ℝⁿ, −std)`; both reversed | `J = −1`; `J = −det R = 1`; unchanged | holds |
| §4.3 precomposition | `f ∘ π`; shear with `f = id`; `θ = R` | `q_O(Df ∘ dθ) ≤ q_O(Df) q_O(dθ) ≤ K K_θ` off the null preimage of `{q_O(Df) > K}`; `K_π = 1`; `K_θ = ∞`, `θ` not quasiregular; `J = −1` | holds |
| §4.4 postcomposition | `z² ∘ z²`; isometry; `a = 2` after `a = 1/2` | `z⁴`, `1`; unchanged; identity, `K_O = 1 ≤ 8` | holds |
| §5.1 `formalDeriv`, `IsACLOn`, `IsACLpOn` | `(x₂, 0)`; `|x₁|`; `c(x₁)`; `|x|^{1/2}` with `p = 2, 4, 6`; indicator of `{0}`; `x = (1/2, 1/2)`, `i = 2`; `n = 0`; `p = 0` | columns `[[0,1],[0,0]] = fderiv`, rows would send `e₁ ↦ e₂`; entry `0` on the null line; segments in direction 1 are `c`, not AC; `2π∫₀¹ r^{1−p/2} dr` finite iff `p < 4`; discontinuous; `t ↦ u(1/2, t)` on `[0,1]` versus `[1/2, 3/2]`; vacuous boxes; `MemLp` at `0` is measurability | holds; matches MRV 332–340 (closed boxes in `Ω` and open intervals with closure in `Ω` give the same class: each closed box lies in a larger open box with closure in `Ω`, and AC restricts to subintervals) |
| §5.2 `ACL^p ⇔ W^{1,p}_loc` | `|x|^{1/2}`; `C¹`; Cantor; strips at `p = 1/2`; `|x₁|` at `p = ∞`; `n = 0` | agree for each `p`; both true; both false; strips `{|y − 2^{−k}| < 8^{−k}}` disjoint, `∫|∂₁u| ≈ Σ 2^{−k}16^k 8^{−k} = Σ 1 = ∞`, `∫|∂₁u|^{1/2} ≈ Σ 8^{−k/2}`, `∫|∂₂u|^{1/2} ≈ Σ 4^{−k}`, vertical variation `≤ Σ 2·2^{−k}`: `ACL^{1/2}` with no weak derivative; `Du = (sign x₁, 0)`; both sides true (`volume` on a point has mass `1`, `Du = 0`, test identity `0 = 0`) | holds with `1 ≤ p` |
| §5.2 `HasLineDerivAt` a.e. | `|x₁|`; Cantor; strips | `sign x₁` off the null line; vacuous (no weak derivative); vacuous; measurability of the failure set for continuous `u` makes Fubini apply | holds |
| §5.3 agreement with Def 2.20 | radial `a = 1/2`, `ℝ³`; identity; `K = 0` constant; `max(0, t)`; `n = 0` | `2`-quasiregular here, `K = 4` in MRV; all `1`; `0 ≤ 0·det 0` and `ACLⁿ` hold, `1 ≤ 0` fails; `f' ∈ {0, 1}`; both sides `1 ≤ K·1` | holds; `1 ≤ K` used |
| §6.1 route (repaired) | `p = v₀`, `σ = {v₀, v₁}`; `σ = τ`; `S¹` by a triangle; `ℝ` by `ℤ`; `C' = [0, 5/2]` | `b_σ = (1/2, 1/2)`, point `(1 − t/2, t/2)`, carrier `σ` for `t ∈ (0, 1]`, limit `(1, 0) = p`; coordinates `(1 − t)p_w + t/|τ| > 0` on `τ`; each vertex in 3 simplices; vertex `k` in `{k}`, `[k−1,k]`, `[k,k+1]`; carriers met `{0}`, `(0,1)`, `{1}`, `(1,2)`, `{2}`, `(2,3)`, closed simplices met `7` | holds |
| §6.1 infinite star | compact `{v}`; neighbourhood `U` of `v` | `V = {v}` satisfies the lemma, `{v}` meets every edge; `U` meets every open edge, `U ∖ {v}` has infinitely many components versus `2` for an interval; the route needs a compact `C ∋ v`, which does not exist | holds |
| §6.1 Checks | inscribed triangle edge; `t ↦ t²` | `|p(t)|² = 1 − 3t + 3t² ∈ [1/4, 1]`, `dθ/dt = (√3/2)/|p|² ∈ [√3/2, 2√3]`; docstring of the Tau Ceti theorem names the squaring map | holds |
| §6.2 non-degenerate, orientation preserving | identity; fold; vertex collapse | `J(dp) > 0` on closed simplices by continuity, density of `κ₁(σ°)` and nonvanishing; fold reverses on `x₁ < 0`; rank `n − 1` | holds |
| §6.3 locally Lipschitz | eight-sector map; `|x₁|`; gluing | `L = [[1, −1],[0, √2]]`, `det = √2`, `LᵀL = [[1,−1],[−1,3]]`, eigenvalues `2 ± √2`, `q_O = (2 + √2)/√2 = 1 + √2 = q_I`; `1`-Lipschitz; a continuous function `L`-Lipschitz on finitely many closed pieces covering a segment is `L`-Lipschitz | holds |
| §6.4 simplicial maps quasiregular | identity; `3 × 3` and `6 × 3` grids on `T²`; fold; collapse; `h`-stretch | `K_p = 1`; `9` vertices, `27` edges, `18` triangles, `χ = 0`, distinct vertex sets, doubling sends vertices `(i/6, j/3)` to `(i/3, j/3)`, `dp = diag(2,1)`, `q_O = 4/2 = 2`; `J < 0` on `x₁ < 0`; `J = 0` on positive measure; `h(k+1) = h(k) + k`, `dp = diag(k, 1)` on `[k, k+1]`, `q_O = k² / k = k`, `K_p = ∞`; a.e. point lies in some `κ₁(σ°)` where `Dp = dp`, and `K_O = max(1, K_p)` by positivity on open sets | holds |
| §7.1 ellipticity | identity; constant; ball; `n = 1` | `1`; excluded by "non-constant"; a chart ball of bounded distortion makes every `N` elliptic from a ball; `ℝ`, `ℝ/ℤ`; `J_f > 0` on positive measure iff `Df ≠ 0` on positive measure iff non-constant (§2.6) | holds |
| §7.2 orientation independence | `f ∘ R` | `J_{f∘R}(x)` for `(std, −o_N)` is `−(J_f(Rx) · det R) = J_f(Rx)`; non-constant since `R` is bijective | holds |
| §7.3 metric independence | `g' = c² g`; `T²` with `dx² + 4dy²` | §4.1 with `a = b = 1`: factor `(β/α)ⁿ`; `(c/c)ⁿ = 1`; `4`, while `(y ↦ 2y)` makes it isometric to flat `ℝ²/(ℤ × 2ℤ)`, `1`-elliptic | holds; locator missing (R01) |
| §7.4 transfer | doubling of `T²`; inclusion `ℂ ∖ {0} → ℂ`; conjugation | `q_O(dq) = 4/2 = 2`; `K_q = 1`, `exp` is `1`-quasiregular and non-constant; `K_q = ∞`; `‖dq‖ⁿ ≤ K_q J(dq)` everywhere since `J(dq) > 0`; a constant `q ∘ f` puts the connected `f(ℝⁿ)` in a discrete fibre | holds |
| §7.5 flat manifolds | `Tⁿ`; `ℂ/(ℤ + iℤ)`, `exp`; Klein bottle; rotation by `π` | `J_π = 1`, `K_O = 1`; nowhere-zero holomorphic derivative, conformal; glide reflections reverse orientation, no orientation; fixed point, not free; an orientable `ℝⁿ/Γ` has every `γ` orientation preserving (`π ∘ γ = π`, pull `o_N` back) | holds |
| §7.6 branched coverings by tori | `p = id`; doubling after `π`; degenerate `s`; `ℝ²` with the integer grid | `K = 1`; `K_π max(1, K_p) = 1·2 = 2`; no conclusion; `K_π = K_p = 1`, `p ∘ π = id`, `N` not compact; non-constancy: the open `π(ℝⁿ)` meets some `κ₁(σ°)` since the lower skeleton is null, and `p ∘ π` is a local diffeomorphism there | holds |

Also recomputed: §1.2 lower semicontinuity of `q_O` (value `0` at `A = 0`; `‖B‖ⁿ/J(B) → ∞` or
`J(B) ≤ 0` near `J(A) = 0`, `A ≠ 0`; `∞` near `J(A) < 0`), `q_I`-submultiplicativity needs the
sign hypotheses (`R ∘ R = id`: `1 > 0·0`); §1.3 `K ≥ 0` is needed (`K = −1`, `R = diag(−1,1)`);
§2.8 winding map `2`-Lipschitz with singular values `2, 1, 1`; the Layer 3 table (`q_S` of the
winding map `6^{3/2}/(2·3^{3/2}) = √2`, of the radial stretch
`(a² + n − 1)^{n/2}/(n^{n/2} a)`).

## Not verifiable

- Rickman1993 Ch. I and Ch. VI, Vaisala1971 Ch. 3, Reshetnyak1989 Ch. II, IwaniecMartin2001
  Ch. 6, Ahlfors2006 Ch. I, BonkHeinonen2001 Theorem 1.1, Gromov1981 p. 200, Gromov1999 Ch. 2:
  settled as uncertified in the manifest; cited by locator only. The sampled statements they are
  cited for (§2.4, §2.5, §4.3 Rickman Ch. I; §5.2 Vaisala Ch. 3) were checked against
  MartioRickmanVaisala1969 where it covers them (lines 118–127, 332–340, 409–425) and by the
  computations in the table otherwise.
- The Annals versions of HeikkilaPankka2025 and Prywes2019 were not checked; the arXiv
  numbering the manifest records was used throughout.
- The MartioRickmanVaisala1969 scan is image-only and its recognised text is noisy; the cited
  lines were readable for every statement checked, but the bar over `Q` in Definition 2.16
  (line 335) cannot be seen in the text, so whether the source's segments are those of the open
  interval or of its closure was not settled from the scan; both readings give the class the
  README defines (table row §5.1).

## Source issues

- **Misprint** in HeikkilaPankka2025 at Proof of Proposition B.1, line 1328 (printed page 24):
  the source writes the composite of the Nash embedding and the map in the order "map after
  embedding"; it should be the embedding after the map, since the embedding goes out of the
  target; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f0461967936c54ab58109c0be220ed26a1f86a1c", "job": "REV-PKG-QuasiregularMaps~2", "model": "fable", "worker": "chris-x10"} -->
