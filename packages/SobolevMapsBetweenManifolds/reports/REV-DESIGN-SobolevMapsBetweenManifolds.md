<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7625#issuecomment-6701198270 -->
Review (claude) of d5ab755

Verdict: needs_changes

1. **F01** (P2) §3.3 item (ii): images of null sets need a Lindelöf source

   **Location.** `packages/SobolevMapsBetweenManifolds/design/README.md` line 711: "if `f : M' → M` is
   `C¹` and `finrank E' ≤ finrank E`, then `f(s)` is a `TauCeti.IsNullSet` whenever `s` is"; the same
   statement is `plan.json` target 3.3 (ii), whose hypotheses are only "M', M boundaryless C¹
   manifolds with finite-dimensional models".

   **Claim.** The forward image of a chartwise null set under a C¹ map into a manifold of at least
   the same dimension is null, with no second-countability hypothesis on `M'` (the Conventions say
   Lindelöf "enters exactly where it is used", and §3.3 does not list it).

   **Witness.** Let `D = ℝ` with the discrete topology and `M' = ℝ × D`, charted by
   `(x, d) ↦ x` on each open slice `ℝ × {d}`: a Hausdorff `C^∞` 1-manifold, not Lindelöf. Let
   `M = ℝ`, `f(x, d) = d` (locally constant, hence `C¹`), and `s = {(0, d) : d ∈ D}`. For the chart at
   any `(x, d)` the set `s ∩ source` is the single point `(0, d)`, whose image `{0}` is Haar-null, so
   `s` is a `TauCeti.IsNullSet`. But `f(s) = ℝ`, which is not null. The dimension hypothesis holds
   (`1 ≤ 1`). Lee2012 Ch. 6 proves the statement for second-countable manifolds, its standing
   assumption; the target drops that hypothesis. Item (i) is unaffected: a chart source of `M'` is
   second countable, so its image meets only countably many charts of `M`, and the inverse-function
   argument is local. Item (iii) is unaffected.

   **Repair.** In §3.3 (ii) and in `plan.json` 3.3 add the hypothesis `[LindelofSpace M']` (or, more
   finely, "`s` is contained in a Lindelöf open subset of `M'`"), route: cover `s` by countably many
   chart sources and apply §2.1 in each. Add the witness above as a negative-control Check ("the
   Lindelöf hypothesis is used: on `ℝ × D` with `D` uncountable discrete, the locally constant map
   `(x, d) ↦ d` carries the null set `{0} × D` onto `ℝ`"). Then recheck the consumers: §4.1
   (composition), §4.6(a) and §8 use only item (i), so nothing else changes; §6.4 already has
   `[LindelofSpace M]` from Layer 5. Tested on the instance: with `M'` Lindelöf the slices are
   countably many and the image is a countable union of null sets, so the repaired statement
   holds and the witness is excluded.

2. **F02** (P3) §6.4's change-of-variables theorem needs the measure structure on `N`

   **Location.** `README.md` §6.4, the paragraph "Prove: if `f` is a `C¹` open embedding … then
   `μ_f^− = 0` and `μ_f^+(A) = vol_N(f(A))` for every Borel `A ⊆ M`"; `plan.json` 6.4, hypotheses
   "as in 6.2, `J_f` locally integrable".

   **Claim.** `vol_N` is `TauCeti.riemannianVolume` of `N`, but Layer 5's preamble (and 6.2's
   hypotheses) install `[LindelofSpace M] [MeasurableSpace M] [BorelSpace M]` on `M` only.

   **Witness.** `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean` lines 58–63: the
   variable block of `riemannianVolume` requires `[MeasurableSpace M] [BorelSpace M] [LindelofSpace M]`
   on the manifold it measures. Nothing in §6.4 supplies them for `N`.

   **Repair.** Add to §6.4's theorem and to `plan.json` 6.4 the hypotheses "`N` Lindelöf with
   `[MeasurableSpace N] [BorelSpace N]`" (and say that `f(A)` is Borel because `f` is an open
   embedding). The route is unchanged.

3. **F03** (P3) §6.1's basis formula for `J(A)` is empty in dimension `0`

   **Location.** `README.md` line 1023–1024: "that is, `J(A) = o_W.volumeForm (A ∘ b)` for any
   positively oriented orthonormal basis `b` of `V`"; `plan.json` 6.1, "i.e. `o_W.volumeForm (A ∘ b)`
   for any positively oriented orthonormal basis `b` of `V`".

   **Claim.** The basis formula characterises `J(A)` in every dimension, including `n = 0`, where the
   Check computes `J(A) = −1` when exactly one of `o_V`, `o_W` is the negative orientation.

   **Witness.** For `n = 0` the only basis is the empty family, whose orientation is
   `positiveOrientation`; when `o_V` is its negative no positively oriented basis exists, and
   Mathlib's `Orientation.finOrthonormalBasis` (`Mathlib/Analysis/InnerProductSpace/Orientation.lean`)
   takes `0 < n`. The intrinsic identity `A^*(o_W.volumeForm) = J(A) · o_V.volumeForm` still
   determines `J(A)`, since `o_V.volumeForm` is `±1 ≠ 0` on the empty family, and gives the
   Check's value.

   **Repair.** Define `J(A)` by the intrinsic identity (the scalar exists and is unique because
   `o_V.volumeForm ≠ 0`), and state the basis formula as an API item for `n ≥ 1`. The dimension-`0`
   Check stays as it is.

4. **F04** (P3) Scope does not name the special cases of T1 that other roadmaps plan

   **Location.** `README.md` Scope, lines 83–87 (PseudoholomorphicCurveAnalysis, naming PH1.1 and
   PH4.1 only) and the supplier contract at line 312 (PH1.1 only).

   **Claim.** The only planar sibling of Layer 1–2 is PH1.1.

   **Witness.** `TauCetiRoadmap/PseudoholomorphicCurveAnalysis/README.md` §1.2 (lines 279–300, on
   main) plans, for `kp > 2` on planar domains, composition with `C^ℓ` maps "with the chain rule for
   weak derivatives" and invariance under `C^k` diffeomorphisms: at `k = 1`, `p > 2`, `E = ℂ` these
   are §2.4 and §2.2. The open pull requests SobolevPolynomialApproximation §2.1 (global `W^{k,p}`,
   bounded derivatives, `W1p.compL` at `k = 1`) and SobolevDifferentialForms §4.1 (global pullback of
   forms, bounded `DΦ`, `DΦ⁻¹`) are the global bounded-derivative siblings that `target.md` named.
   The objects differ (local class, no bounds, local diffeomorphisms, every `p`), so this roadmap is
   the owner of T1; but a reader of the Scope cannot see that the overlap was settled.

   **Repair.** In the PseudoholomorphicCurveAnalysis bullet of Scope add one clause: "Its PH1.2
   composition and change-of-variables theorems are the case `E = ℂ`, `p > 2` of §2.2 and §2.4
   (a Check of each)", and list PH1.2 in the supplier contract for those Checks. Add one bullet
   naming SobolevPolynomialApproximation §2.1 and SobolevDifferentialForms §4.1 as the global
   bounded-derivative statements on Euclidean domains, with the clause that §2.2 contains them at
   order one as the case of bounded `Dθ` and injective `θ`.

5. **F05** (P3) Locator: Hajlasz2009 Theorem 2.1 states `p > n`, not `p ≥ n`

   **Location.** `README.md` line 1351–1352: "the density of smooth maps in `W^{1,p}(M, N)` for
   `p ≥ dim M` (Hajlasz2009 Theorem 2.1, lines 129–137)".

   **Claim.** Theorem 2.1 covers `p ≥ dim M`.

   **Witness.** Hajlasz2009 lines 129–130 state Theorem 2.1 for `p > n = dim M`; lines 138–141 say
   that the case `p = n` is also true by a different argument (no uniform convergence). The
   statement is in the Part II description only, so no target of this roadmap is affected.

   **Repair.** Write "for `p > dim M` (Hajlasz2009 Theorem 2.1, lines 129–130) and `p = dim M`
   (lines 138–141)"; same in `sources.toml`'s `cited_for` of Hajlasz2009 if the package stage keeps
   the sentence.

One blocking finding (a statement of §3.3 that is false without the second-countability
hypothesis the Conventions reserve for "where it is used") and four non-blocking notes. Everything
else checked, including every library name cited in the README against the pinned Mathlib and
Tau Ceti, the three certified sources at their line locators, the cross-roadmap citations on
main, the merge-order gate and the adversarial computations below, was found sound.

## Verified sound

**Principles.** No route-specific shortcut (the chain rules are stated at every `1 ≤ p ≤ ∞`, for
every finite-dimensional `E`, with no bound on the `C¹` factors); no re-planned roadmap (the
scalar, global, planar and surface classes are cited: Tau Ceti `W1p`, PH1.1, PH4.1, GeometricCurrents
G6); no upward or cyclic supply (gate output below); no copied passage (all statements are the
author's, with line locators); no computational algorithm; no `Suggested.lean` yet at the design
stage, so no sorry'd data or `set_option` to check. Elaboration: not available (this lane does not
elaborate; the design has no Lean file).

**Gate.**

```
candidate: SobolevMapsBetweenManifolds is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2350 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` found no unresolved citation or Lean name;
`roadmaps overlaps` found no open pull request changing this roadmap and no dropped id.

**Sources (seeded sample, verified at the locators).**

| Target | Source and locator | Finding |
|---|---|---|
| 1.2 | HeikkilaPankka2025 lines 22–23 | Continuous `f : M → N` between oriented Riemannian `n`-manifolds, `n ≥ 2`, in `W^{1,n}_loc(M, N)`: matches the class, which the roadmap generalises to all `p` and no orientation. Ziemer1989 Ch. 2 §2.1, Mazya2011 §1.1: uncertified, cited by locator. |
| 1.3 | Mazya2011 §1.1 | Uncertified, cited by locator. |
| 1.4 | GeometricCurrents G6 | `TauCetiRoadmap/GeometricCurrents/README.md` line 750: `W^{j,p}_loc(Ω)` by restriction to relatively compact opens, finite-cover gluing. Matches the citation. |
| 2.1, 3.3 | Lee2012 Ch. 6 | Uncertified; Lee's standing assumption is second countability, which 3.3 (ii) drops (R01). |
| 2.2, 4.6(a) | Ziemer1989 Thm 2.2.2 | Uncertified, cited by locator. |
| 2.4, 4.6(b) | Ziemer1989 Thm 2.1.11 | Uncertified, cited by locator. |
| 3.2 | Lee2012 Ch. 16 | Uncertified, cited by locator. |
| 4.1 | Hajlasz2009 line 28 | `W^{1,p}(M, N) = {u ∈ W^{1,p}(M, ℝ^ν) : u(x) ∈ N a.e.}`, `N` compact isometrically embedded: matches 8.3; 4.1's ambient class `W^{1,p}(M, ℝ^ν)` is the object at line 28. |
| 4.5 | Mazya2011 §1.1 | Uncertified. |
| 5.2, 5.3 | Rickman1993 Ch. I §1; HeikkilaPankka2025 lines 22–26 | Rickman uncertified; HP lines 25–26 define `‖Df‖` as the operator norm of the weak differential, as 5.1 says. |
| 6.2 | HeikkilaPankka2025 lines 25–27 | `J_f` the Jacobian determinant, `‖Df‖ⁿ ≤ K J_f` a.e.: matches. |
| 7.1 | MartioRickmanVaisala1969 line 124, lines 332–340 | Line 124 introduces `J(x, f)` for the formal derivative; lines 332–340 are Definition 2.16 (`ACL`, `ACL^p`). Matches. |
| 8.1 | Lee2012 Ch. 4 | Uncertified (the rank theorem is in Ch. 4 of the 2nd edition). |
| 8.2 | HeikkilaPankka2025 lines 1328–1329; Hajlasz2009 line 28 | Line 1328 takes a Nash embedding `ι : N → ℝ^m` and concludes `p ∈ W^{1,∞}(M, N)` from the composite in `W^{1,∞}(M, ℝ^m)`: the extrinsic description, as cited (see Source issues for the misprint). |
| 8.4 | Hajlasz2009 lines 23–28 | Compact `N`, embedded; matches the compactness hypothesis of T7. |

Flagged-unverified locators: none flagged by the author beyond the five uncertified texts.

**Library declarations opened at the pins** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, as
`lake-manifest.json` and `plan.json` baseline record). Every backticked library name in the
README (162 distinct spans, 20 of them library-qualified in Mathlib and 60 in Tau Ceti) resolves:

- `TauCeti.HasWeakFDerivOn` (`WeakDeriv/Basic.lean:251`), defined through `HasWeakLineDerivOn`
  (`:212`), which carries `CompleteSpace F`, `LocallyIntegrableOn` of `u` and `u'`, and the
  test-function identity: exactly what the supplier contract says. `.mono :292`,
  `.const_smul :370`, `.congr_ae :448`, `.congr_ae_deriv :453`, `.add :553`, `.clm_comp :569`,
  `Module.Basis.hasWeakFDerivOn_of_forall :657`, `hasWeakFDerivOn_of_differentiableOn :747`,
  `.ae_eq :856`, `.ae_eq_fderiv :893`.
- `hasWeakFDerivOn_iff_forall_isCompact_closure` (`WeakDeriv/Local.lean:71`),
  `hasWeakFDerivOn_of_tendsto_lintegral_enorm_sub` (`Limit.lean:89`, `L¹` convergence on `Ω`),
  `HasWeakFDerivOn.comp_measurePreserving` (`MeasurePreserving.lean:130`: `MeasurePreserving Φ μ ν`,
  `LocallyLipschitzOn U Φ`, `MapsTo`), `HasWeakLineDerivOn.absolutelyContinuousOnInterval`
  (`Interval.lean:302`).
- `TauCeti.W1p.compL` (`W1p/ChangeOfVariables.lean:274`) with hypotheses `p ≠ ⊤`,
  `DifferentiableOn ℝ Φ U`, `InjOn Φ U`, `MapsTo Φ U V`, `‖fderiv Φ x‖ ≤ L`, `c ≤ |det|`, `0 < c`;
  `value_compL_ae :302`, `gradient_compL_ae :316` (`(fderiv Φ x).adjoint (∇u (Φ x))`): the
  Scope's description is exact. `W1p.hasWeakFDerivOn_comp` (`ChainRule.lean:375`): `p ≠ ∞`,
  `ContDiff ℝ 1 F`, `‖deriv F t‖₊ ≤ M`. `mem_w1pSubmodule_iff_hasWeakFDerivOn` (`W1p/Basic.lean`).
- `HasWeakFDerivOn.hasFDerivAt_indicator_convolution_normed` (`Mollification/Interior.lean:87`,
  `MemLp u p`, `MemLp U q`, `1 ≤ p, q`, closed ball inside `Ω`),
  `tendsto_eLpNorm_normed_convolution_sub` (`ApproximateIdentity.lean:165`, `p ≠ ∞`).
- `TauCeti.IsNullSet` (`Geometry/Manifold/Measure.lean:36`): for every `x` and Haar `μ`,
  `μ (extChartAt I x '' (s ∩ source)) = 0`; `.mono :56`, `.iUnion :72`, `.interior_eq_empty :89`.
- `riemannianVolume` (`Riemannian/VolumeDensity/Volume.lean:82`, variables `:58–63`:
  `IsManifold I 1 M`, `MeasurableSpace M`, `BorelSpace M`, `LindelofSpace M`, `RiemannianBundle`,
  `IsContinuousRiemannianBundle`), `riemannianVolume_restrict_source :87`,
  `setLIntegral_riemannianVolume_of_subset :112`, `isLocallyFiniteMeasure_riemannianVolume :179`;
  `chartRiemannianVolume` (`Measure.lean:113`: comap of `(finBasis).addHaar.withDensity density`
  along the chart, mapped by `Subtype.val`); `chartVolumeDensity` (`Basic.lean:48`,
  `√det` of the chart Gram matrix), `chartVolumeDensity_pos :61` (on the chart base set);
  `chartVolumeDensity_changeChart` (`ChangeOfCoordinates.lean:52`, factor `|det tangentCoordChange|`);
  `isOpenPosMeasure_riemannianVolume` (`Support.lean:36`).
- `Manifold.Orientation` (`Orientation/Basic.lean:32`), `.orientationAt :140`,
  `.orientationAt_neg :157`, `.model :235`; `.restrict` (`OpenSubset.lean:49`);
  `IsOrientationPreservingAt` (`Preserving.lean:63`: a linear equivalence equal to `mfderiv`
  carrying `o.orientationAt x` to `o'.orientationAt (f x)`), so `J(mfderiv f x) > 0` there, as 6.2
  says. `riemannianVolumeForm` (`Riemannian/VolumeForm.lean:55`, fibrewise `volumeFormL`).
- `Manifold.instRiemannianBundleOpen` (`Riemannian/Restriction.lean:209`); `WithMetric`
  (`Riemannian/WithMetric.lean:68`, parametrised by a `ContMDiffRiemannianMetric I n`, `n : ℕ∞ω`,
  so `n = 0` carries a continuous metric, with `LindelofSpace`, `MeasurableSpace`, `BorelSpace`,
  `IsManifold` and `RiemannianBundle` instances at `:144–397`).
- `ContMDiffOn.isImmersionAt_iff_injective_mfderiv` (`Immersion/Differential.lean:257`:
  `ContMDiffOn I J n f s`, `IsOpen s`, `x ∈ s`, `1 ≤ n`, `FiniteDimensional 𝕜 E'`);
  `Manifold.IsImmersionAt.exists_contMDiffOn_retraction` (`SmoothEmbedding/Extension.lean:64`,
  needs `IsEmbedding f`, which 8.1 replaces by shrinking the source);
  `exists_contMDiffOn_normalRetraction` (`TubularNeighborhood/LocalInverse.lean:46`, `C^{n+1}`);
  `SmoothEmbedding` (`SmoothEmbedding/Basic.lean:75`);
  `SmoothEmbedding.exists_contMDiffMap_extension_hasCompactSupport` (`Extension.lean:201`,
  variables `:164–171`: source model boundaryless, ambient `IsManifold J ∞`, `T2Space`,
  `SigmaCompactSpace`, finite-dimensional ambient model, `n : ℕ∞`; `K` compact; gives
  `EqOn (G ∘ f) g K`, `HasCompactSupport G`). With `f = ι₁`, `g = ι₂`, `K = univ` this is exactly
  8.4's `G`.
- `DifferentiableOn.addHaar_image_eq_zero_of_finrank_lt_finrank` (`Sard/LowDimension.lean:73`),
  `not_absolutelyContinuousOnInterval_cantorFunction` (`CantorFunction.lean:245`).
- Mathlib: `MeasureTheory.Measure.isAddLeftInvariant_eq_smul` (to_additive of
  `isMulLeftInvariant_eq_smul`, `Haar/Unique.lean:922`, namespace `MeasureTheory.Measure`);
  `Module.Basis.addHaar_eq_iff` (`Haar/OfBasis.lean:268`); `MeasurableEmbedding.comap_apply`
  (`Measure/Restrict.lean:877`, arbitrary `s`); `addHaar_image_eq_zero_of_differentiableOn_of_addHaar_eq_zero`
  (`Function/Jacobian.lean:556`, `f : E → E`); `lintegral_image_eq_lintegral_abs_det_fderiv_mul`
  (`:1184`, `MeasurableSet s`, `HasFDerivWithinAt`, `InjOn`); `locallyIntegrableOn_iff`
  (`LocallyIntegrable.lean:188`); `memLp_top_of_bound` (`LpSeminorm/Basic.lean:620`),
  `MemLp.of_le :584`; `ContDiffAt.toOpenPartialHomeomorph` (`InverseFunctionTheorem/ContDiff.lean:31`);
  `exists_contDiff_support_eq_eq_one_iff` (`Geometry/Manifold/PartitionOfUnity.lean:788`),
  `SmoothPartitionOfUnity.exists_isSubordinate :556`; `contDiffOn_ext_coord_change`
  (`IsManifold/ExtChartAt.lean:784`); `TopologicalSpace.Opens.instChartedSpace`
  (`HasGroupoid.lean:284`); `IsLocalDiffeomorph` (`LocalDiffeomorph.lean:275`);
  `mfderiv_eq_fderiv` (`MFDeriv/NormedSpace.lean:786`); `Manifold.IsImmersionAt`
  (`Immersion.lean:191`, normal form `codChart ∘ f ∘ domChart⁻¹ = equiv ∘ (·, 0)`);
  `Manifold.IsSmoothEmbedding` (`SmoothEmbedding.lean:70`: `IsImmersion ∧ IsEmbedding`);
  `exists_embedding_euclidean_of_compact` (`WhitneyEmbedding.lean:132`: `T2Space`, `CompactSpace`,
  gives `CMDiff ∞ e ∧ IsClosedEmbedding e ∧ ∀ x, Injective (mfderiv e x)`);
  `riemannianMetricVectorSpace` (`Riemannian/Basic.lean:102`, instance at `:125`);
  `Orientation.volumeForm_map :290`, `abs_volumeForm_apply_le :245` and the other three
  (`InnerProductSpace/Orientation.lean`); `LinearMap.normDet :69`,
  `normDet_eq_prod_singularValues :374` (`NormDet.lean`); `ContMDiffRiemannianMetric`
  (`VectorBundle/Riemannian.lean:245`).

**Duplication by object.** No `MemLpLoc`, `W1pLoc`, weak manifold differential, oriented
Jacobian or Sobolev class of maps between manifolds exists in the pinned Mathlib or Tau Ceti
(grep of both trees for the objects' names and for "locally … Sobolev"; the only hits are
docstrings of `W1p/ChangeOfVariables.lean` and `LocalRepresentative.lean`, which glue local
`Cⁿ` representatives, a different object). Tau Ceti's `W1p` is scalar and global, as the Scope says.
PH1.1 (planar, every order) and PH4.1 (surfaces, `kp > 2`) are cited, not restated; the general
class is new (R04 asks only for PH1.2 and the two open pull requests to be named). GeometricCurrents
G6's scalar local spaces are cited and specialised in §1.4. DifferentialGeometry 2.1, 2.2, 10.2,
12.1, 12.4 exist on main (`DifferentialGeometry/README.md` lines 345, 352, 884, 915, 923) and are
consumed through the Tau Ceti declarations above; its convention of no measurable structure on
manifolds (line 50–52) is the one adopted. RiemannianGeometry R4.6 (line 700: chart nullity and
canonical-volume comparison for the cut locus) and R6 (line 1239–1240, focal set) prove nullity
for specific sets of a smooth metric, as the Scope says; §3.1's general statement for every set and
every continuous metric is owned here. GeometricMeasureTheory G2 (line 148) uses
`LinearMap.normDet` (line 83) as its only Jacobian, and §6.1 compares the oriented one with it.
QuasiregularMaps (board package, merge order 272) consumes exactly what Layers 3–7 state: its six
declared gaps (`sobolev-maps-class`, `-weak-differential`, `-norm`, `-jacobian`, `-chain-rules`,
`-euclidean`, `packages/QuasiregularMaps/design/README.md` lines 263–296) map to §4.2–4.5, §3.1/4.3,
§5.1–5.2, §6.1–6.3, §4.6, §7.1 with the same hypotheses; it owns the locally Lipschitz case (its
§2.8), as the Downstream section says. Ownership against the open pull requests named in the brief
was checked for the five closest roadmaps of `scratch/overlaps.md` (SobolevDifferentialForms #1609,
DifferentialGeometry #886 and #1187, SobolevPolynomialApproximation #1612, GeometricMeasureTheory
#1187): none owns a local, vector-valued or manifold-valued Sobolev class; #1609 §4.1 and #1612
§2.1 are the global siblings of R04.

**Supplier order.** All suppliers are on main (PDE, GeometricCurrents, PseudoholomorphicCurveAnalysis,
DifferentialGeometry, RiemannianGeometry, GeometricMeasureTheory, SuccessiveMinima) or in the pins;
TeichmullerGeometry (merge order 271) and PseudodifferentialOperators (9) are cited only as
deferrals in Scope, never on a `*Needs:*` line. No `*Needs:*` line cites a later roadmap. No
declared gaps. Every `*Needs:*` item was resolved to a section of this roadmap, a main-branch
section or a pinned declaration (list above).

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
build, eight layers each ending in Examples and Dependencies, Downstream consumers, Worked
examples, References. Nine definitions (1.1, 1.2, 4.1, 4.2, 4.3, 6.1, 6.2, 6.4, 8.3), each with an API
list and 3–6 Checks; twenty theorems, each with hypotheses in the sentence and a locator;
100 tests in `plan.json`, every target with a locator and prerequisites. No process residue
(the only hits for "round" are round metrics and spheres), no LaTeX delimiters, no `lemma`, no
pull-request numbers or paths. `sources.toml` records all eight cited works, with the three
certified texts' hashes and the five uncertified ones by locator; no entry is wrong.

**Headline theorems.** T1–T7 are stated in the Summary with section labels, and every label
resolves (T1: §1.3, §2.2–2.4; T2: §3.1, §4.2–4.4; T3: §5.2–5.3; T4: §6.1–6.4; T5: §8.2; T6: §7.1;
T7: §8.4). Statability at the pins (for the package stage): T1 is statable now on
`TauCeti.HasWeakFDerivOn` with `MeasureTheory.MemLp` on compact subsets; T2–T7 need the carriers
of §4.2–4.3 (the class and `Df`), which are simple predicates over `extChartAt` and
`HasWeakFDerivOn` and can be given real bodies, so each headline is statable with those
definitions; T4 additionally needs `orientedJacobian`, definable through `Orientation.volumeForm`
and `Manifold.Orientation.orientationAt`, both pinned. Nothing in the README is padding-shaped
(small-value computations and degenerate cases are Checks, as they should be).

**Adversarial table** (sampled targets, headline theorems and every target a finding touches).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `L^p_loc` of `|x|^{−1/2}` on `ℝ` | `p = 1`, `p = 2` | `∫_{−1}^{1}|x|^{−p/2} = 4/(2−p)`: `4` at `p = 1`, `∞` at `p = 2` | member iff `p < 2`, as the Check says | none |
| 1.1 gluing | `X` not Hausdorff | `MemLp` on a finite union follows from `μ.restrict (A ∪ B) ≤ μ.restrict A + μ.restrict B`, no intersection of compacts used | holds without Hausdorff, as stated | none |
| 1.2 `log|x|` on `ℝ²` | `p = 1, 2` | `∫_{|x|<1}|x|^{−p} = 2π/(2−p)`: `2π` at `p = 1`, `∞` at `p = 2` | `W^{1,p}_loc` iff `p < 2` | none |
| 1.2 identity of `E` | `E = 0`, `E = ℝ`, `p = ∞` | on `E = 0` the identity is the constant `0`; on `ℝ`, `‖id‖_{L^∞(ℝ)} = ∞` | the Check's "`E ≠ 0`" is needed only for the global non-membership, as written | none |
| 1.3 sheaf, empty index | `Ω = ∅` | `HasWeakFDerivOn μ ∅ u 0` holds (both integrability conditions on `∅`) | both sides true | none |
| 1.3 cover up to a null set | `sign(x₁)` on the two half-planes | `Du = 0` on each; `∫ U φ = 2∫_{x₁=0} φ ≠ 0` would be needed on `ℝ²` | not a member of `W^{1,1}_loc(ℝ²)`; the hypothesis "open cover of `Ω`" is used | none |
| 1.4 agreement with `W1p` | `u = |x|`, `p = ∞`, `V = ℝ` | `|x| ∉ L^∞(ℝ)` | relatively compact `V` needed, as stated | none |
| 2.1 image of null sets | projection `ℝ² → ℝ`, `A = ℝ × {0}` | `finrank 2 > 1`; `θ(A) = ℝ`, `μ(ℝ) = ∞` | dimension hypothesis needed and present | none |
| 2.1 preimage under invertible-derivative map | constant map | `fderiv = 0`, `θ⁻¹({c}) = ℝ²` | invertibility needed and present | none |
| 2.2 chain rule values | `θ(z) = z²`, `u = log|w|` | `⟨z², 2zh⟩/|z|⁴ = 2|z|²⟨z,h⟩/|z|⁴ = 2⟨z,h⟩/|z|²`; `D(2 log|z|)h = 2⟨z,h⟩/|z|²` | equal | none |
| 2.2 global bound absent | `θ(y) = y³ + y`, `u = |x|` | `D(u∘θ) = sign(y)(3y² + 1)`, in `L^∞_loc` not `L^∞` | local class needed, as stated | none |
| 2.2 reduction to `compL` | `p = 1` on `W ⋐ Ω'` | `compL` needs `p ≠ ⊤`, `InjOn`, `‖Dθ‖ ≤ L`, `c ≤ |det|`: all hold on `W` with compact closure | route sound at every `p` since only `p = 1` is fed to `compL` | none |
| 2.3 bounded derivative needed | `G(t) = e^{t²}`, `u = log|x|` | for `|x| ≤ e^{−2}`: `log|x|(log|x| + 2) ≥ 0` so `e^{(log|x|)²} ≥ |x|^{−2}`; `∫_{|x|<e^{−2}}|x|^{−2} = ∞` | `G ∘ u ∉ L¹_loc` | none |
| 2.3 route | dominated convergence | `|DG(u_ε)Du_ε − DG(u)U| ≤ L|Du_ε − U| + |DG(u_ε) − DG(u)||U|`, second term `≤ 2L|U| ∈ L¹(V)` | sound; limits need only `L¹(V)`, which `p ≥ 1` on `V ⋐ Ω` gives | none |
| 2.4 cut-off | `K = u(V̄)` | `exists_contDiff_support_eq_eq_one_iff` with `t` a closed neighbourhood of `K`, `s ⋐ W`: `χ = 1` on `int t ⊇ K`, so `D(χG) = DG` on `K` | sound | none |
| 2.4 continuity needed | `u = log|x|`, `G = e^{t²}` | as 2.3's instance | non-example valid | none |
| 3.1 iff, non-measurable `s` | arbitrary `s` | `MeasurableEmbedding.comap_apply` evaluates arbitrary sets; `map Subtype.val` on a null Borel superset | outer-measure statement sound; needs Lindelöf, present | none |
| 3.1 dimension `0` | `M = pt` | Haar on `0` gives `{0}` positive mass; density `√det(0×0) = 1`; both sides: only `∅` null | agree | none |
| 3.1 flat `E` | `ℝ²`, metric `4(dx²+dy²)` | density `√det(4I₂) = 4`; unit square `4` | matches `vol = volume` with density | none |
| 3.2 global vs local | `ℝ`, `dx²` vs `e^{2x}dx²`, `g = 1_{[0,∞)}e^{−x}` | `∫ g dx = 1`, `∫ g e^{x}dx = ∞` | same local, different global classes | none |
| **3.3 (ii)** | `M' = ℝ × D`, `D = ℝ` discrete, `f(x,d) = d`, `s = {0} × D` | `s ∩ source = {(0,d)}` null for every chart; `f(s) = ℝ` not null; `finrank 1 ≤ 1` | **false without Lindelöf `M'`** | **R01** |
| 3.3 (i) | same `M'`, `θ` a local diffeomorphism | a chart source of `M'` is second countable; `θ(source)` meets countably many charts of `M` | holds without Lindelöf | none |
| 4.1 `C¹` structure matters | atlas `{x ↦ x³}` on `ℝ`, `u = |x|` | representative `|y|^{1/3}`, derivative `|y|^{−2/3}/3`, `L^p_loc` iff `2p/3 < 1` | member iff `p < 3/2` | none |
| 4.2 circle map | `f(t) = (cos|t|^{1/2}, sin|t|^{1/2})` | representative `|t|^{1/2}`, derivative `sign(t)|t|^{−1/2}/2`, `L^p_loc` iff `p < 2` | member iff `p < 2`, consistent with 4.3, 5.1, 5.2, 8.2 and the worked example | none |
| 4.3 direction witness | `φ(x) = 2x`, `ψ = id`, `f = id` | representative `y ↦ y/2`; `1 · Df · (1/2) = 1/2` | `Df = 1`; `dφ` in place of `(dφ)⁻¹` gives `1/4` | none |
| 4.3 uniqueness without Lindelöf | two weak differentials | the set where they differ is chartwise null at every point by `ae_eq` | `IsNullSet` needs no countable union | none |
| 4.6(a) | `θ(y) = 2y`, `f = |t|^{1/2}` | `2·Df(2y) = sign(y)|2y|^{−1/2}`; `d(√2|y|^{1/2}) = sign(y)|y|^{−1/2}/√2` | equal (`1/√2 = √2/2`) | none |
| 4.6(a) local diffeomorphism needed | `θ(y₁,y₂) = (y₁,0)`, `f = |x|^{1/2}` on `ℝ²` | `|Df| ≍ |x|^{−1/2}`: `L^p_loc(ℝ²)` iff `p < 4`; `f∘θ = |y₁|^{1/2}`: iff `p < 2` | for `2 ≤ p < 4` `f` in, `f∘θ` out | none |
| 5.1 norm witness | `id` from flat `ℝ` to `4dt²` | `|v|_{g_N}/|v| = 2` | `‖Df‖ = 2`, chart norm `1` | none |
| 5.2 (T3) | `t log|t|` | `f' = log|t| + 1`, in every `L^p_loc`, `p < ∞`, not `L^∞_loc` | class for every finite `p`, not `∞` | none |
| 5.3 | `g' = dx² + 4dy²` on the target, `id` | `‖id‖' = sup|v|'/|v| = 2 = β/a` | bound attained | none |
| 6.1 `J` witnesses | `diag(2,1)`, `diag(−1,1)`, `id` in bases `(2e₁,e₂)`,`(e₁,e₂)` | `2`; `−1` (same orientations), `+1` (negated target); matrix `diag(2,1)` has `det 2` but `J(id) = 1` | orthonormality and direction pinned | none |
| 6.1 multiplicativity | `A : V → W`, `B : W → X` | `(B∘A)^*ω_X = A^*(J(B)ω_W) = J(B)J(A)ω_V` | holds | none |
| 6.1 `|J| = normDet` | `A` not bijective | `ω_W(Ab) = 0` (dependent family); `normDet = 0` (no orthonormal basis of `range` indexed by `Fin n`) | agree | none |
| **6.1 dimension `0`** | `o_V` negative | no positively oriented basis; intrinsic identity gives `J = ω_W(∅)/ω_V(∅) = ∓1` | basis formula empty, intrinsic one fine | **R03** |
| 6.2 chart formula | `M = N = ℝ`, target `4dt²` | `ρ_N = 2`, `ρ_M = 1`, `det = f'`: `J_f = 2f'`; `normDet(Df) = 2|f'|` | consistent with 5.1's `‖Df‖ = 2` for `f = id` | none |
| 6.2 chart formula, general | frame `∂ᵢ = dφ⁻¹eᵢ` | `vol_M(∂) = ε_Mρ_M`, `Df∂ᵢ = Σ Aⱼᵢ∂'ⱼ`, `vol_N(Df∂) = det A·ε_Nρ_N` | `J_f = ε_Mε_N det A ρ_N/ρ_M` | none |
| 6.2 fold | `F(x₁,x₂) = (|x₁|,x₂)` | `DF = diag(sign x₁, 1)` a.e. | `J_F = sign x₁`, `‖DF‖ = 1` | none |
| 6.3 radial stretch | `f = x|x|^{−1/2}` on `ℝ²` | singular values `|x|^{−1/2}` (tangential), `|x|^{−1/2}/2` (radial); `‖Df‖ ∈ L^p_loc` iff `p < 4`; `J_f = |x|^{−1}/2 ∈ L^q_loc` iff `q < 2` | `q = p/2`, Hadamard `|x|^{−1}/2 ≤ |x|^{−1}` | none |
| 6.3 `p < n` non-integrable `J_f` | discs `r_k = 2^{−k}`, `λ_k = 2^k/√k` | `λ_k r_k = 1/√k → 0` (continuity); `Σ λ_k^p r_k² = Σ 2^{k(p−2)}k^{−p/2} < ∞` iff `p < 2`; `Σ πλ_k²r_k²/4 = Σ π/(4k) = ∞` | valid non-example | none |
| 6.3 `n = 0` | `p/0` | `ENNReal`: `p/0 = ∞` for `p ≠ 0`; Hadamard `|J_f| ≤ 1` | `J_f ∈ L^∞_loc`, consistent | none |
| **6.4 theorem** | `vol_N` | `riemannianVolume` needs `[LindelofSpace N] [MeasurableSpace N] [BorelSpace N]` (`Volume.lean:58–63`) | hypotheses absent from the prose | **R02** |
| 6.4 injectivity needed | `f(z) = z²`, annulus `1<|z|<2` | `μ_f^+(A) = 2π∫_1^2 4r³dr = 30π`; area of `{1<|w|<4}` is `15π` | multiplicity `2` | none |
| 6.4 sign | `f(x) = −x` | `J_f = −1`: `μ_f^+ = 0`, `μ_f^−([0,1]) = 1` | signed density pinned | none |
| 7.1 (T6) | `z²` on `ℂ` | `J = |2z|² = 4|z|²`; reflection `J = −1`; `id`: `1, 1, 1` | consistent with 6.1, 6.2 | none |
| 7.1 charts of `Opens` | `Opens.instChartedSpace` | chart at `x` is `subtypeRestr` of `refl`, extend `= Subtype.val`, target `Ω` | representative is `f̃` on `Ω` | none |
| 8.1 immersion needed | `ι(s) = s³` | every left inverse is `s^{1/3}`, not differentiable at `0` | hypothesis used | none |
| 8.2 (T5) | circle map, `ι` inclusion vs `2ι` | `|D(ι∘f)| = |t|^{−1/2}/2 = ‖Df‖`; `2ι` doubles the left side | isometry hypothesis used | none |
| 8.2 non-injective `ι` | double cover `z ↦ z²`, `f(t) = (cos(|t|^{1/2}/2), sin(|t|^{1/2}/2))` | `ι∘f` is the circle map | both sides member iff `p < 2` | none |
| 8.3 hedgehog | `x/|x|` on `B³` | `|D(ι∘u)|_{HS} = √2/|x|`; `4π∫_0^1 r^{2−p}dr < ∞` iff `p < 3` | extrinsic class for `p < 3`, continuous class never | none |
| 8.4 (T7) compactness needed | `N = ℝ`, `ι₂(s) = (s, e^{e^s})`, `u = log log(1/|x|)` on `B(0,e^{−1}) ⊆ ℝ²` | `∫|Du|² = 2π∫_1^∞ dt/t² = 2π < ∞`; second coordinate `1/|x|`, gradient `|x|^{−2}`, `∫ r^{−2} r dr = ∞` | `ι₁∘u ∈ W^{1,2}_loc`, `ι₂∘u ∉ W^{1,1}_loc` | none |
| 8.4 injectivity needed | `ι₁ = z²` on `S¹`, `u = e^{iθ/2}` | `ι₁∘u = z/|z|` smooth; `ι₂∘u` jumps from `1` to `−1` across `θ = 0` | valid non-example | none |
| 8.4 route | `exists_contMDiffMap_extension_hasCompactSupport` | ambient `V₁`: `IsManifold ∞`, `T2`, σ-compact, finite-dimensional; source model boundaryless; `K = univ` compact; `n = 1 : ℕ∞` | all hypotheses available | none |
| Conventions, `J` witness | `id`, target `4dt²` | `vol_N = 2dt`, pulled back `= 2 vol_M` | `J_f = 2` | none |
| Conventions, dimension `0` | any map of a `0`-manifold | only linear map is `0`; `J(0) = ±1` by 6.1's dimension-`0` row | consistent | none |

**Convention witnesses recomputed across layers.** The direction of `Df` (Conventions, 4.3), the
operator norm (Conventions, 5.1, 5.3, 8.2), the volume (Conventions, 3.1, 6.2) and the sign of
`J` (Conventions, 6.1, 6.2, 6.4, 7.1) give the same values at every occurrence; the circle map,
radial stretch and hedgehog agree in every section that uses them (table rows above).

## Not verifiable

- Ziemer1989 Theorems 2.1.11 and 2.2.2, Mazya2011 §1.1, Rickman1993 Ch. I §1, Lee2012 Ch. 4, 6,
  15, 16: paywalled, settled as uncertified in `sources.toml`; cited by locator. The statements
  attributed to them are standard and agree with the reviewer's knowledge of the texts, but the
  pages were not opened.
- Bethuel1991: open content on Project Euclid, but the sources service received only a
  bot-protection page (recorded in the manifest); used only as context for the Part II scope.
- Elaboration of a Lean file: not available (this lane does not elaborate; the design stage has no
  `Suggested.lean`).

## Source issues

- **Misprint** in HeikkilaPankka2025 at Appendix B, proof of Proposition B.1, line 1328 (arXiv
  v2): the source writes the composite of the map `p : M → N` and the embedding `ι : N → ℝ^m` in
  the order `p ∘ ι`; it should be `ι ∘ p`, the only composable order; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d5ab755dad8c7355dfaa8b5ce6819ec6a8f33b43", "job": "REV-DESIGN-SobolevMapsBetweenManifolds", "model": "fable", "worker": "chris-x17"} -->
