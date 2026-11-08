<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7625#issuecomment-6714236957 -->
Review (claude) of f9c8ebf

Verdict: needs_changes

1. **F01** (P2) §3.1 and RiemannianGeometry R4.6 both own the null-set transfer

   **Location.** `packages/SobolevMapsBetweenManifolds/design/README.md` lines 104–107 (Scope:
   "RiemannianGeometry R4.6 and R6 prove that the cut locus and the focal set have Riemannian
   measure zero. They relate chart nullity to the volume of a smooth metric for those sets. The
   comparison for arbitrary sets and every continuous metric is §3.1 here") and §3.1, lines 672–674;
   `plan.json` 3.1.

   **Claim.** This roadmap owns the identification of `TauCeti.IsNullSet` with the null sets of
   `TauCeti.riemannianVolume`, and RiemannianGeometry proves it only for two specific sets.

   **Witness.** `TauCetiRoadmap/RiemannianGeometry/README.md` at the head of pull request #1683
   (an open revision of the roadmap on main), line 42: "R4.6 owns the transfer of chartwise
   nullity to the Riemannian volume, which R6 reuses for the focal set"; line 136: "R4.6 owns the
   transfer from chartwise nullity to the Riemannian volume built on them"; R4.6 item 6, lines
   1225–1233: a subset of `M` that is `TauCeti.IsNullSet` has `TauCeti.riemannianVolume` zero
   (countable chart cover, `TauCeti.chartRiemannianVolume_apply`, Borel hull of a Haar-null image),
   and conversely a subset of a chart source of volume zero has Lebesgue-null chart image. That is
   §3.1's statement for every subset (its converse for subsets of chart sources gives the converse
   for every set by intersecting with the countably many chart sources). On main (line 1239–1240)
   RiemannianGeometry only says "relate chart Lebesgue nullity to the canonical density" for the
   focal set, so the Scope is accurate for main and wrong at the head. RiemannianGeometry is on main
   and earlier in the merge order, so it cannot cite §3.1; the object has two owners.

   **Repair.** Make RiemannianGeometry R4.6 the owner of the transfer and consume it:

   1. In the Scope bullet (lines 104–107) write that RiemannianGeometry R4.6 owns the transfer of
      chartwise nullity to the Riemannian volume: a `TauCeti.IsNullSet` has volume zero, and a
      subset of a chart source of volume zero has null chart image, for a Lindelöf manifold with a
      continuous metric and Borel structure; §3.1 here states the two-sided form for arbitrary
      subsets of `M` (outer measure) as a one-line consequence (intersect with the countably many
      chart sources), and owns the consequences that follow (the almost-everywhere reformulation,
      the independence of the metric, and `TauCeti.riemannianVolume = volume` on an inner product
      space).
   2. Add a subsection `### From TauCetiRoadmap.RiemannianGeometry` to the supplier contracts
      naming R4.6's two statements with those hypotheses, and add
      `{"roadmap": "RiemannianGeometry", "sections": ["R4.6"]}` to `plan.json` suppliers and
      `roadmap:RiemannianGeometry R4.6` to 3.1's prerequisites.
   3. Rewrite §3.1's first paragraph so that the target is: for every `s ⊆ M`, `IsNullSet I s` iff
      `riemannianVolume s = 0`, *Needs:* RiemannianGeometry R4.6 for both directions on chart
      sources, `TauCeti.riemannianVolume_restrict_source` and the countable cover; keep the
      Consequences and the three Checks unchanged. The route paragraph then only has to say how
      the outer-measure statement follows.
   4. Because the content exists only at the open revision, the pull request opened from this
      package names RiemannianGeometry's revision in its merge-order paragraph (the id `R4.6` itself
      exists on main, so no renumbering is involved).

   If the fix worker finds that R4.6's transfer is restricted to smooth metrics when it is read at
   the head (the passage speaks of "the continuous chart density", and Tau Ceti's
   `riemannianVolume` needs only `IsContinuousRiemannianBundle`, so I read it as continuous), keep
   §3.1 as the continuous-metric variant instead, with the one-clause difference in the Scope
   ("§3.1 differs in asking only a continuous metric and a `C¹` Lindelöf manifold") and a Check
   that for a smooth metric it is R4.6's transfer. Either way the Scope bullet as written is to be
   replaced. Tested on the instance that refuted the original: with R4.6 cited for the chart-source
   statements, the flat-`ℝ²` Check (unit square `1` and `4`, a segment null for both) and the
   dimension-`0` Check (only `∅` null on either side) are unchanged, and nothing in Layers 4–8
   cites §3.1 for more than the iff.

2. **F02** (P3) §6.1: `J(id_V) = 1` needs one orientation on both sides

   **Location.** `README.md` lines 1081–1082: "`J(B ∘ A) = J(B) J(A)`. Also `J(id_V) = 1`, and
   `J(cA) = cⁿ J(A)`"; `plan.json` 6.1 API item `orientedJacobian_comp`: "J(id) = 1".

   **Claim.** The oriented Jacobian of the identity is `1`.

   **Witness.** `J` is defined for a pair `(o_V, o_W)`. For `V = W = ℝ`, `o_V` positive and `o_W`
   negative, `o_W.volumeForm = −o_V.volumeForm` (`Orientation.volumeForm_neg_orientation`), so
   `id^*(o_W.volumeForm) = −o_V.volumeForm` and `J(id) = −1`; §6.2's own Check (line 1156) computes
   `J_f = −1` for the identity from `(M, o)` to `(M, −o)`. The adjacent bullet "For `V = W` with
   `o_V = o_W`, `J(A) = det A`" has the hypothesis the identity needs.

   **Repair.** Write "Also `J(id_V) = 1` when `o_W = o_V`" in the README and
   "J(id) = 1 for o_V = o_W" in `plan.json`'s `orientedJacobian_comp`. Tested: with `o_V = o_W`,
   `id^* ω = ω` gives `J = 1`; with `o_W = −o_V` the statement is no longer claimed.

3. **F03** (P3) §1.2: the Cantor Check cites a lemma on `[0, 1]` for a class on `(0, 1)`

   **Location.** `README.md` lines 436–439: "The Cantor function on `(0, 1)` … is not in
   `W^{1,1}_loc((0, 1))`. A member is absolutely continuous on compact subintervals
   (`TauCeti.HasWeakLineDerivOn.absolutelyContinuousOnInterval`), and the Cantor function is not
   (`TauCeti.not_absolutelyContinuousOnInterval_cantorFunction`)"; `plan.json` 1.2 test
   `cantor_function`.

   **Claim.** The cited non-absolute-continuity lemma refutes membership on `(0, 1)`.

   **Witness.** `TauCeti/Analysis/SpecialFunctions/CantorFunction.lean:245` states
   `¬ AbsolutelyContinuousOnInterval cantorFunction 0 1`, on `[0, 1]`, which is not a compact
   subinterval of `(0, 1)`; `TauCeti/Analysis/Sobolev/WeakDeriv/Interval.lean:302` gives absolute
   continuity on `[a, b]` only for `Ioo a b ⊆ Ω`. The Check is true, but through a different step:
   on `[1/4, 3/4]` the Cantor function has `c(1/4) = 1/3` (ternary `0.0202…`, binary `0.0101…`)
   and `c(3/4) = 2/3`, while an absolutely continuous function with derivative `0` almost
   everywhere is constant.

   **Repair.** Either state the Check on `Ω = ℝ` for the Cantor function extended by `0` on
   `(−∞, 0]` and `1` on `[1, ∞)` (then `[0, 1]` is a compact subinterval and the pinned lemma
   applies as cited), or keep `Ω = (0, 1)` and replace the last clause by "and an absolutely
   continuous function with derivative `0` almost everywhere on `[1/4, 3/4]` would take the same
   value `1/3` at `1/4` and `2/3` at `3/4`". Same change in `plan.json`. Tested: on `ℝ` the
   extended function is continuous with weak derivative `0` off a null set, the interval lemma
   applies on `Ioo 0 1 ⊆ ℝ`, and the pinned lemma gives the contradiction.

4. **F04** (P3) §4.3: the circle-map value of `Df` holds almost everywhere only

   **Location.** `README.md` lines 896–897: "For the map into `S¹` of §4.2 at `p < 2`, `Df(t)` is
   `sign(t)|t|^{−1/2}/2` times the angular unit vector, for `t ≠ 0`"; `plan.json` 4.3 test
   `totality`.

   **Claim.** The total choice `Df` takes the displayed value at every `t ≠ 0`.

   **Witness.** Line 889: "The *weak differential* `Df` is a total choice: a weak differential when
   one exists". Any field agreeing with the displayed one outside a `TauCeti.IsNullSet` is a weak
   differential (line 885), so the choice may differ from it on, say, `{1}`; the value is determined
   almost everywhere, as the Conventions' direction witness and §4.3's uniqueness bullet say.

   **Repair.** Write "for almost every `t`" (and the same in `plan.json`). Tested: the statement
   "outside a null set, `Df(t)` is the displayed field" holds by uniqueness, and the Check still
   separates the circle map from the zero field.

One blocking finding (an object that the open revision of RiemannianGeometry and §3.1 both own)
and three non-blocking notes. The five findings of round 1 are repaired. Everything else
checked, including the repaired passages under the adversarial pass, the seeded sample at the
sources' lines, every library name at the pins, every cross-roadmap citation at main or at the
open head, the merge-order gate and the headline theorems, was found sound.

## Round 1 findings, checked one by one

- **F01 (P2, §3.3 (ii) needs countability of the source) — repaired.** `packages/SobolevMapsBetweenManifolds/design/README.md` lines 740–742:
  "`s ⊆ M'` is a `TauCeti.IsNullSet` contained in the union of countably many preferred chart
  sources … then `f(s)` is a `TauCeti.IsNullSet`. Every `s` has such a cover when
  `[LindelofSpace M']`". The route (lines 750–756) covers `s` by `(Sₖ)`, reads
  `ψ(f(s ∩ Sₖ) ∩ ψ.source)` as the image of a null set under the representative, applies §2.1 and
  `TauCeti.IsNullSet.iUnion`. The witness `ℝ × D` is a negative-control Check (lines 764–770),
  `plan.json` 3.3 carries the hypothesis, the prerequisite and the test `non_lindelof_source`, and
  the Conventions (line 139–141) list §3.3 among the places where Lindelöf enters. Recomputed
  below.
- **F02 (P3, `vol_N` in §6.4 needs its instances) — repaired.** Line 1200: "let `N` also be
  Lindelöf with `[MeasurableSpace N] [BorelSpace N]`, so that `vol_N = TauCeti.riemannianVolume`
  of `N` is defined"; `f(A)` Borel by `Topology.IsOpenEmbedding.measurableEmbedding`
  (`Mathlib/MeasureTheory/Constructions/BorelSpace/Basic.lean:687`, both sides Borel, as the
  variable block at line 627 requires). `plan.json` 6.4 has the hypothesis, the API item and the
  prerequisite.
- **F03 (P3, dimension `0` in §6.1) — repaired.** Lines 1066–1069: `J(A)` is defined by
  `A^*(o_W.volumeForm) = J(A) · o_V.volumeForm`, with existence from
  `AlternatingMap.eq_smul_basis_det` (`Mathlib/LinearAlgebra/Determinant.lean:647`) and
  uniqueness from `|o_V.volumeForm b| = 1` (`Orientation.lean:286`); the basis formula
  `J(A) = o_V.volumeForm b · o_W.volumeForm (A ∘ b)` for every orthonormal `b` (line 1075) is valid
  at `n = 0`, and the dimension-`0` Check (lines 1109–1113) now excludes the wrong model. Values
  recomputed below.
- **F04 (P3, Scope and the planar and global siblings) — repaired, with different wording.**
  Lines 83–87 name PH1.2 as the case `E = ℂ`, `p > 2` of §2.4 and §2.2; lines 88–96 name
  SobolevPolynomialApproximation §2.1 and SobolevDifferentialForms §4.1 as the global
  counterparts and say that §2.2 "gives no norm bound". PH1.2 is in the supplier contract
  (line 334) and in `plan.json` suppliers; §2.2 and §2.4 each end with a PH1.2 agreement Check
  (lines 576–578, 649–652). The repair report's reason for not writing "§2.2 contains them" is
  right: a local class states no norm bound, so the global theorems are counterparts, not
  special cases. Both sibling sections exist at their heads (§2.1 at
  `TauCetiRoadmap/SobolevPolynomialApproximation/README.md` line 325, §4.1 at
  `TauCetiRoadmap/SobolevDifferentialForms/README.md` line 387); PH1.2 is on main at
  `TauCetiRoadmap/PseudoholomorphicCurveAnalysis/README.md` lines 279–321 and says what the Scope
  says (composition with `C^ℓ` maps, invariance under `C^k` diffeomorphisms, `kp > 2`).
- **F05 (P3, Hajlasz Theorem 2.1 is `p > n`) — repaired.** Lines 115–116 ("Theorem 2.1, lines 129–130,
  for `p > dim M`, and lines 138–141 for `p = dim M`"), the Downstream section (the Part II bullet),
  the References (line 1444) and `sources.toml` (`locator` and `cited_for` of Hajlasz2009) agree.
  Verified: Hajlasz2009 line 129 states Theorem 2.1 with `p > n = dim M`; line 138 opens the case
  `p = n` inside the proof.

Pattern search for the repaired patterns elsewhere: images of sets under maps are claimed null
only in §3.3 (ii) (countable cover) and §6.4 (`M`, `N` Lindelöf): nothing else. Every use of
`TauCeti.riemannianVolume` carries the three instances: §3.1 (line 672), §3.2 ("as in §3.1"),
Layer 5 preamble (line 986), §6.2 (line 1131), §6.4 (line 1197), §7.1 (an open subset of `E` is
second countable and the subtype carries its Borel structure). Dimension `0` is covered in the
Conventions, §3.1, §3.2, §4.1, §6.1, §6.3 Checks.

## Verified sound

**Principles.** No route-specific shortcut (chain rules at every `1 ≤ p ≤ ∞`, every
finite-dimensional codomain, no bound on the `C¹` factors, no injectivity in §2.2); no
re-planned roadmap (Tau Ceti `W1p`, PH1.1, PH1.2, PH4.1, GeometricCurrents G6, DifferentialGeometry
2.1–2.2 and 12.1–12.4 are cited, not restated; the R01 overlap is with an open revision that
appeared after the design was written); no upward or cyclic supply (gate below); no copied
passage (every statement is the author's with line locators); no computational algorithm; no
Lean file at the design stage, so no sorry'd data or `set_option`. Elaboration: not available
(this lane does not elaborate; the design has no Lean file).

**Gate.**

```
candidate: SobolevMapsBetweenManifolds is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2367 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve`: no cross-roadmap citation and no Lean name found
nowhere (it does not check names outside TauCetiRoadmap; those are opened at the pins below).
`roadmaps overlaps`: no open pull request changes this roadmap, no dropped id, no id only an open
revision defines. Note for the intake, not a finding: QuasiregularMaps (merge order line 272)
consumes this roadmap through six declared gaps
(`packages/QuasiregularMaps/design/README.md` lines 263–296), while this roadmap's suppliers are
all on main, so the gate's provisional placement "after GlaubermanZStar" is after a consumer; the
intake should insert the roadmap before QuasiregularMaps.

**Sources (seeded sample, at the locators).**

| Target | Source and locator | Finding |
|---|---|---|
| 1.2 | HeikkilaPankka2025 lines 22–23 | continuous `f : M → N`, oriented Riemannian `n`-manifolds, `n ≥ 2`, `f ∈ W^{1,n}_loc(M, N)`: the class, generalised here to every `p` and no orientation; Ziemer1989 Ch. 2 §2.1, Mazya2011 §1.1 uncertified |
| 1.3, 1.4, 4.5 | Mazya2011 §1.1 | uncertified, by locator; 1.4 also GeometricCurrents G6 (`TauCetiRoadmap/GeometricCurrents/README.md` line 750: `W^{j,p}_loc(Ω)` by restriction to relatively compact opens, finite-cover gluing) |
| 2.2 | Ziemer1989 Thm 2.2.2 | uncertified; PH1.2 Check matches PH1.2's change of variables (main, line 303) |
| 2.4 | Ziemer1989 Thm 2.1.11 | uncertified; PH1.2 Check matches PH1.2's composition (main, lines 294–297) |
| 3.3 | Lee2012 Ch. 6 | uncertified; its standing second countability is now the countable-cover hypothesis of (ii) |
| 4.1 | Hajlasz2009 line 28 | `W^{1,p}(M, N) = {u ∈ W^{1,p}(M, ℝ^ν) : u(x) ∈ N a.e.}`: the ambient class is the object; line 23–24 has `N` compact, isometrically embedded |
| 4.3 | HeikkilaPankka2025 lines 22–26 | "`‖Df‖` is the operator norm of the weak differential `Df`": the weak differential of a continuous Sobolev map |
| 5.1, 5.3 | HeikkilaPankka2025 line 26; Rickman1993 Ch. I §1 | operator norm as cited; Rickman uncertified |
| 6.1 | MartioRickmanVaisala1969 line 124 | "The Jacobian of `f` at `x` is denoted by `J(x, f)`" after the formal derivative at lines 119–121; Rickman1993 uncertified |
| 7.1 | MartioRickmanVaisala1969 line 124, lines 332–340 | Definition 2.16: `ACL` (continuous, absolutely continuous on a.e. axis-parallel segment), `ACL^p` (partials locally `Lᵖ`, `p ≥ 1`): the Euclidean setting T6 compares with |
| 8.2 | Hajlasz2009 line 28; HeikkilaPankka2025 lines 1328–1329 | the class through a Nash embedding `ι : N → ℝ^m` (see Source issues for the order of composition) |
| 8.3 | Hajlasz2009 lines 23–28; Bethuel1991 Introduction | Hajlasz as above; Bethuel uncertified (bot page) |
| Scope, Downstream | Hajlasz2009 lines 129–130, 138–141 | Theorem 2.1 for `p > n`; the case `p = n` at line 138 (F05) |

Flagged-unverified locators: none beyond the five uncertified texts.

**Library declarations opened at the pins** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, as
`lake-manifest.json` and `plan.json` baseline record). Every backticked library name of the
README was grepped as a declaration and opened; all exist, with the hypotheses the README states:

- Tau Ceti weak derivatives: `HasWeakLineDerivOn` (`Analysis/Sobolev/WeakDeriv/Basic.lean:212`:
  `CompleteSpace F ∧ LocallyIntegrableOn u ∧ LocallyIntegrableOn u' ∧` the test-function
  identity), `HasWeakFDerivOn :251`, `hasWeakFDerivOn_iff :257`, `.mono :292`, `.const_smul :370`,
  `.congr_ae :448`, `.congr_ae_deriv :453`, `.add :553`, `.clm_comp :569` (complete codomain),
  `Module.Basis.hasWeakFDerivOn_of_forall :657`, `hasWeakFDerivOn_of_differentiableOn :747`,
  `.ae_eq :856`, `.ae_eq_fderiv :893`; `hasWeakFDerivOn_iff_forall_isCompact_closure`
  (`Local.lean:71`); `hasWeakFDerivOn_of_tendsto_lintegral_enorm_sub` (`Limit.lean:89`,
  `OpensMeasurableSpace E`, local integrability of the limits, `L¹(Ω)` convergence);
  `HasWeakFDerivOn.comp_measurePreserving` (`MeasurePreserving.lean:130`, `MeasurePreserving Φ μ ν`,
  `LocallyLipschitzOn U Φ`, `MapsTo`); `HasWeakLineDerivOn.absolutelyContinuousOnInterval`
  (`Interval.lean:302`, `Ioo a b` as the domain, `IntegrableOn u'`, continuous representative).
- Mollification: `HasWeakFDerivOn.hasFDerivAt_indicator_convolution_normed`
  (`Mollification/Interior.lean:87`, `MemLp u p`, `MemLp U q` on `Omega`, `1 ≤ p, q`, closed ball
  in `Omega`), `.fderiv_indicator_convolution_normed :110`;
  `tendsto_eLpNorm_normed_convolution_sub` (`MeasureTheory/Function/Lp/ApproximateIdentity.lean:165`,
  `p ≠ ∞`, `MemLp f p mu`).
- `W1p` (`W1p/Basic.lean:372`, `w1pSubmodule :327`), `mem_w1pSubmodule_iff_hasWeakFDerivOn :573`;
  `W1p.compL` (`ChangeOfVariables.lean:274`; variables `:262–266`: `p ≠ ⊤`, `DifferentiableOn`,
  `InjOn`, `MapsTo`, `‖fderiv Φ x‖ ≤ L`, `0 < c ≤ |det|`), `value_compL_ae :302`,
  `gradient_compL_ae :316` (`(fderiv ℝ Φ x).adjoint (∇u (Φ x))`); `W1p.hasWeakFDerivOn_comp`
  (`ChainRule.lean:375`, `p ≠ ∞`, `ContDiff ℝ 1 F`, `‖deriv F t‖₊ ≤ M`, `F : ℝ → ℝ`).
- `not_absolutelyContinuousOnInterval_cantorFunction` (`CantorFunction.lean:245`, on `0 1`: R03);
  `DifferentiableOn.addHaar_image_eq_zero_of_finrank_lt_finrank` (`Sard/LowDimension.lean:73`).
- `IsNullSet` (`Geometry/Manifold/Measure.lean:36`: every `x`, every Haar `μ` on `E`,
  `μ (extChartAt I x '' (s ∩ source)) = 0`; needs `[MeasurableSpace E] [BorelSpace E]`),
  `.chartwise :50`, `.mono :56`, `.union :64`, `.iUnion :72` (`Countable ι`), `.biUnion :81`,
  `.interior_eq_empty :89`, `.dense_compl :108`, `isNullSet_boundary :114`; no other `IsNullSet`
  theorem exists in Tau Ceti except Sard's `isNullSet_image_of_not_isRegularPoint` and
  `isNullSet_image_criticalPoints` (`Sard/EqualDimension.lean:90, 105`, images of critical
  points, not of null sets).
- `riemannianVolume` (`Riemannian/VolumeDensity/Volume.lean:82`; variables `:58–63`:
  `FiniteDimensional ℝ E`, `IsManifold I 1 M`, `MeasurableSpace M`, `BorelSpace M`,
  `LindelofSpace M`, `RiemannianBundle`, `IsContinuousRiemannianBundle`),
  `riemannianVolume_restrict_source :87`, `setLIntegral_riemannianVolume_of_subset :112`
  (`s ⊆ chart source`, `MeasurableSet s`), `isLocallyFiniteMeasure_riemannianVolume :179`;
  `chartRiemannianVolume` (`Measure.lean:113`: `((finBasis).addHaar.withDensity density).comap
  (source.domRestrict extChartAt)` mapped by `Subtype.val`, density `target.piecewise density 0`);
  `chartVolumeDensity` (`Basic.lean:48`, `√det chartGramMatrix`), `chartVolumeDensity_pos :61`
  (on the trivialization base set, which is the chart source);
  `chartVolumeDensity_changeChart` (`ChangeOfCoordinates.lean:52`,
  `|det tangentCoordChange| ·`); `isOpenPosMeasure_riemannianVolume` (`Support.lean:36`).
- `Manifold.Orientation` (`Orientation/Basic.lean:32`, a quotient of `OrientationLift`),
  `.orientationAt :140`, `.orientationAt_neg :157`, `.model :235` (needs
  `Fintype.card ι = finrank`), `.restrict` (`OpenSubset.lean:49`), `IsOrientationPreservingAt`
  (`Preserving.lean:63`: a linear equivalence equal to `mfderiv` carrying `o.orientationAt x` to
  `o'.orientationAt (f x)`), `IsOrientationReversingAt :82`; `riemannianVolumeForm`
  (`Riemannian/VolumeForm.lean:55`, fibrewise `volumeFormL`, needs `IsManifold I 1 M` and a
  `RiemannianBundle` only).
- `WithMetric` (`Riemannian/WithMetric.lean:68`, parametrised by a
  `ContMDiffRiemannianMetric I n`, `n : ℕ∞ω`; instances `ChartedSpace :155`, `IsManifold :164`,
  `LindelofSpace :144`, Borel `:150–152`, `RiemannianBundle :393`,
  `IsContinuousRiemannianBundle :401`); `Manifold.instRiemannianBundleOpen`
  (`Restriction.lean:209`).
- `ContMDiffOn.isImmersionAt_iff_injective_mfderiv` (`Immersion/Differential.lean:257`:
  `FiniteDimensional 𝕜 E'`, `ContMDiffOn I J n f s`, `IsOpen s`, `x ∈ s`, `1 ≤ n`);
  `Manifold.IsImmersionAt.exists_contMDiffOn_retraction` (`SmoothEmbedding/Extension.lean:64`,
  `I.Boundaryless`, `IsEmbedding f`); `exists_contMDiffOn_normalRetraction`
  (`TubularNeighborhood/LocalInverse.lean:46`, `C^{n+1}` into an inner product space);
  `SmoothEmbedding` (`SmoothEmbedding/Basic.lean:75`, a `ContMDiffMap` with
  `Manifold.IsSmoothEmbedding`); `SmoothEmbedding.exists_contMDiffMap_extension_hasCompactSupport`
  (`Extension.lean:201`; variables `:164–171`: source model boundaryless, ambient
  `IsManifold J ∞`, `T2Space`, `SigmaCompactSpace`, finite-dimensional ambient model, `n : ℕ∞`;
  `IsCompact K`; gives `EqOn (G ∘ f) g K`, `HasCompactSupport G`): with ambient `V₁`,
  `g = ι₂`, `K = univ` this is §8.4's `G`.
- Mathlib: `MeasureTheory.Measure.isAddLeftInvariant_eq_smul` (to_additive of
  `isMulLeftInvariant_eq_smul`, `Haar/Unique.lean:922`, namespace `MeasureTheory.Measure`,
  second countable locally compact group); `Module.Basis.addHaar :254`, `addHaar_eq_iff :268`,
  `addHaar_self :278` (`Haar/OfBasis.lean`); `MeasurableEmbedding.comap_apply`
  (`Measure/Restrict.lean:877`, arbitrary `s`);
  `addHaar_image_eq_zero_of_differentiableOn_of_addHaar_eq_zero` (`Function/Jacobian.lean:556`,
  `f : E → E`); `lintegral_image_eq_lintegral_abs_det_fderiv_mul :1184` (`MeasurableSet s`,
  `HasFDerivWithinAt`, `InjOn`); `locallyIntegrableOn_iff` (`LocallyIntegrable.lean:188`,
  `LocallyCompactSpace X`, `IsLocallyClosed s`, metrizable codomain); `memLp_top_of_bound`
  (`LpSeminorm/Basic.lean:620`), `MemLp.of_le :584`; `withDensity_absolutelyContinuous`
  (`WithDensity.lean:160`); `Topology.IsOpenEmbedding.measurableEmbedding`
  (`BorelSpace/Basic.lean:687`); `ContDiffAt.toOpenPartialHomeomorph`
  (`InverseFunctionTheorem/ContDiff.lean:31`); `exists_contDiff_support_eq_eq_one_iff`
  (`Geometry/Manifold/PartitionOfUnity.lean:788`: `IsOpen s`, `IsClosed t`, `t ⊆ s`, gives
  `support f = s` and `f = 1` exactly on `t`), `SmoothPartitionOfUnity.exists_isSubordinate :556`
  (`T2Space`, `SigmaCompactSpace`); `isOpen_extChartAt_target` (`ExtChartAt.lean:548`,
  `I.Boundaryless`), `contDiffOn_ext_coord_change :784`; `IsManifold.maximalAtlas`
  (`IsManifold/Basic.lean:868`); `TopologicalSpace.Opens.instChartedSpace`
  (`HasGroupoid.lean:284`, charts `subtypeRestr`); `IsLocalDiffeomorph`
  (`LocalDiffeomorph.lean:275`, argument order `I J n f`); `mfderiv_eq_fderiv`
  (`MFDeriv/NormedSpace.lean:786`); `Manifold.IsImmersionAt` (`Immersion.lean:191`; the normal
  form `IsImmersionAtOfComplement :174` holds on the domain chart source and maps it into the
  codomain chart source, which is what §8.1's `U` uses), `Manifold.IsSmoothEmbedding`
  (`SmoothEmbedding.lean:70`, `I J n f`); `exists_embedding_euclidean_of_compact`
  (`WhitneyEmbedding.lean:132`, `T2Space`, `CompactSpace`); `riemannianMetricVectorSpace`
  (`Riemannian/Basic.lean:102`, instance `:126`); `Bundle.RiemannianBundle`
  (`VectorBundle/Riemannian.lean:420`), `IsContinuousRiemannianBundle :60`; `ContDiffBump`
  (`BumpFunction/Basic.lean:70`); `Orientation.volumeForm :170` (for `n = 0`:
  `±constOfIsEmpty 1` by the sign of `o`), `volumeForm_robust :198`,
  `volumeForm_neg_orientation :223`, `abs_volumeForm_apply_le :245`,
  `abs_volumeForm_apply_of_orthonormal :286`, `volumeForm_map :290`, `finOrthonormalBasis :148`
  (`0 < n`); `Module.Basis.orientation_isEmpty` (`LinearAlgebra/Orientation.lean:186`);
  `AlternatingMap.eq_smul_basis_det` (`Determinant.lean:647`); `LinearMap.det`, `normDet`
  (`NormDet.lean:69`, zero when no orthonormal basis of the range indexed by `Fin (finrank U)`
  exists), `normDet_eq_prod_singularValues :374`, `normDet_eq_abs_det :389` (endomorphisms).

**Duplication by object.** Grep of the pinned Mathlib and Tau Ceti for local Lebesgue or
Sobolev classes (`MemLpLoc`, `W1pLoc`, `WkpLoc`), weak differentials on manifolds, oriented or
signed Jacobians and Sobolev classes of maps between manifolds: none exists. The Tau Ceti files
that mention Sobolev norms on manifolds (`Geometry/Manifold/Riemannian/Sobolev.lean`,
`Trudinger.lean`, `ChartCutoff.lean`) prove the Sobolev and Trudinger inequalities for `C¹`
functions on closed manifolds and define no class; `Geometry/Symplectic/JHolomorphic/WeakDerivative.lean`
is one theorem on a planar puncture; `VolumeDensity/Conformal.lean` is the volume under a
conformal change. `ChartCutoff.lean:59` compares the coordinate derivative of a `C¹` function
with its gradient length near a point, the scalar `C¹` model of §5.1's chart comparison, not the
same object. Across main and the 472 open heads (`roadmaps grep`), no roadmap states
`W^{1,p}_loc(M, N)`, the weak differential of a map between manifolds or the oriented Jacobian;
"Sobolev maps between manifolds" occurs only at PH4.1 (cited). `IsNullSet` is used by
DifferentialGeometry (#886, as on main: the convention of line 52 and Sard at 10.2),
TangentialBordism (#942, Sard applications) and RiemannianGeometry (#1683: R01). The closest
open roadmaps of `scratch/overlaps.md` (SobolevDifferentialForms #1609 §4.1, DifferentialGeometry
#886 and #1187, SobolevPolynomialApproximation #1612 §2.1, GeometricMeasureTheory #1187 G2) own
no local, vector-valued or manifold-valued class; #1609 §4.1 and #1612 §2.1 are the global
siblings the Scope names. QuasiregularMaps (board package) consumes exactly what its six gaps
name (class, weak differential and null sets, norm, Jacobian, chain rules, Euclidean case) and
owns the locally Lipschitz case, as the Downstream section says; its chain-rule gap uses only
preimages of null sets (its README lines 285–289), so F01's countability hypothesis does not
reach it. Ownership against the open pull requests was checked for these and by the object
greps above.

**Supplier order.** Suppliers on main: PDE Layer 1 (`TauCetiRoadmap/PDE/README.md` line 675),
GeometricCurrents G6 (line 668, local spaces at line 750), PseudoholomorphicCurveAnalysis PH1.1,
PH1.2, PH4.1 (lines 213, 279, 807), DifferentialGeometry 2.1, 2.2, 10.2, 12.1, 12.4 (lines 345,
352, 884, 915, 923) and its no-measurable-structure convention (lines 50–52), RiemannianGeometry
R4.6 and R6 (lines 698–702, 1239–1240), GeometricMeasureTheory G2 (line 148; `normDet` at 83),
PseudodifferentialOperators §5.2 (line 967: `W^{k,p}` bundle carrier on a compact base).
TeichmullerGeometry §7.4 (head of its pull request, line 577: Wirtinger derivatives, Beltrami
equation) is cited only as a deferral in Scope, never on a `*Needs:*` line; so are the two open
siblings. No `*Needs:*` line cites a later roadmap; no declared gaps; every `*Needs:*` item
resolves to a section of this roadmap, a main-branch section or a pinned declaration.

**Shape.** Summary; Scope and ownership; Conventions; Exact supplier contracts (Mathlib, Tau
Ceti, DifferentialGeometry, PseudoholomorphicCurveAnalysis); How to read the build; eight layers,
each ending in `### Examples` and `### Dependencies`; Downstream consumers; Worked examples;
References. Nine definitions (1.1, 1.2, 4.1, 4.2, 4.3, 6.1, 6.2, 6.4, 8.3) with API lists and
Check counts 4, 5, 4, 3, 3, 5, 3, 3, 3; twenty theorems with hypotheses in the sentence and a
locator; Check counts of the theorems 3–6. `plan.json`: 29 targets, 103 tests, every target
with a locator and prerequisites (1.1 lists five tests where the README has four Checks: the
fifth, the empty set, is an API bullet in the README; no change needed). No process residue, no
LaTeX delimiters, no `lemma`, no pull-request number, no path. `sources.toml` records all eight
cited works; the three certified entries carry the hashes of the cached texts; no entry is wrong.

**Headline theorems.** T1–T7 are listed in the Summary with section labels, and every label
resolves (T1: §1.3, §2.2–2.4; T2: §3.1, §4.2–4.4; T3: §5.2–5.3; T4: §6.1–6.4; T5: §8.2;
T6: §7.1; T7: §8.4). For the package stage: T1 is statable now on `TauCeti.HasWeakFDerivOn` and
`MeasureTheory.MemLp` on compact subsets; T2–T7 need the predicates of §4.2–4.3 and the
`orientedJacobian` of §6.1, each definable with a real body from `extChartAt`,
`HasWeakFDerivOn`, `Orientation.volumeForm` and `Manifold.Orientation.orientationAt`, so every
headline is statable with those definitions. Nothing in the README is padding-shaped.

**Adversarial table** (repaired passages, sampled targets, headline theorems, findings).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §3.3 (ii) repaired | `M' = ℝ × D`, `D = ℝ` discrete, `f(x,d) = d`, `s = {0} × D` | each chart source (a slice) meets `s` in one point, image `{0}`, null; uncountably many slices, no countable cover; `f(s) = ℝ`, Lebesgue measure `∞` | hypothesis fails, nothing claimed; Check records it | none |
| §3.3 (ii) | `D = ℤ` | `s ⊆ ⋃_k ℝ × {k}` countable; `f(s) = ℤ`, measure `0` | holds | none |
| §3.3 (ii) | `f = id_ℝ`, `s` Cantor set | `μ(C) = 0`, `f(C) = C` | holds | none |
| §3.3 (ii) | `M' = pt`, `M = ℝ` | Haar on `0` gives `{0}` positive mass, only `∅` null; `f(∅) = ∅`; `0 ≤ 1` | holds | none |
| §3.3 (ii) | projection `ℝ² → ℝ`, `ℝ × {0}` | `finrank 2 > 1`; image `ℝ` | excluded by the dimension hypothesis | none |
| §3.3 (ii) route | chart `ψ` of `M`, piece `Sₖ` | `ψ(f(s ∩ Sₖ) ∩ ψ.source) = (ψ ∘ f ∘ φₖ⁻¹)(φₖ(s ∩ Sₖ ∩ f⁻¹ψ.source))`, the latter `⊆ φₖ(s ∩ Sₖ)` null; representative `C¹` on the open `φₖ(Sₖ ∩ f⁻¹ψ.source)`; §2.1 (i) applies; countable union by `IsNullSet.iUnion` | sound | none |
| §3.3 (i), no Lindelöf | `θ : ℝ × D → ℝ`, `(x,d) ↦ x`; `s = {0}` | `θ⁻¹(s) = {0} × D`; each slice chart sees one point, image `{0}` | null without countability of `M'` | none |
| §3.3 (i) route | chart source `W` of `M'` | `W` second countable, `θ(W)` Lindelöf, covered by countably many `ψⱼ`; `φ(θ⁻¹(s ∩ ψⱼ.source) ∩ W)` is the preimage of `ψⱼ(s ∩ ψⱼ.source)` (null) under the representative with invertible derivative; §2.1 (ii) | sound | none |
| §3.3 (iii) | `U = (0,1)`, `s = {1/2}` | images `{1/2}` in both charts | null in both | none |
| §6.4 theorem, `N` instances | `f(x) = 2x` on `ℝ` | `J_f = 2`, `μ_f^+([0,1]) = 2 = vol([0,2])` | holds | none |
| §6.4 | `f = id`, target `4 dt²` | `J_f = 2` (Conventions), `μ_f^+([0,1]) = 2`, `vol_N([0,1]) = ∫_0^1 2 = 2` | consistent with the volume witness | none |
| §6.4 | `f(x) = −x` | `J = −1`, `μ_f^+ = 0`, `μ_f^−([0,1]) = 1 = vol([−1,0])` | roles exchanged | none |
| §6.4 | `z²` on `1 < |z| < 2` | `μ_f^+(A) = 2π ∫_1^2 4r³ dr = 30π`; area of `{1 < |w| < 4}` `= 15π` | injectivity used | none |
| §6.4 | `N = ℝ × D` without instances | `riemannianVolume` of `N` has no `LindelofSpace` instance | hypothesis needed to state it, present | none |
| §6.1 definition, `n = 0` | `(o_V, o_W) ∈ {(+,+), (+,−), (−,+), (−,−)}` | `volumeForm` is `±constOfIsEmpty 1`; `ω_W(∅)/ω_V(∅) = 1, −1, −1, 1` | matches the Check | none |
| §6.1 wrong model | `ω_W(A ∘ ∅)` at `(−, +)` | `+1` against `−1` | excluded by the Check | none |
| §6.1 basis formula, negative `b` | `A = diag(2,1)`, `b = (e₂, e₁)` | `ω_V(b) = −1`, `ω_W(e₂, 2e₁) = −2`, product `2 = det A` | holds | none |
| §6.1 matrix formula | `b = (e₁,e₂)`, `b' = (e₂,e₁)` | `[A] = [[0,1],[2,0]]`, `det −2`, signs `1 · (−1)`, product `2` | holds | none |
| §6.1 signs | `R = diag(−1,1)` | `J = −1` (std → std), `+1` (std → −std) | pinned | none |
| **§6.1 `J(id_V) = 1`** | `V = ℝ`, `(o_V, o_W) = (+, −)` | `id^* ω_W = −ω_V`, `J = −1` | false without `o_W = o_V` | **R02** |
| §6.1 scaling, non-bijective | `cA`; `A` of rank `< n` | `ω_W(cA ∘ b) = cⁿ ω_W(A ∘ b)`; `ω_W(A ∘ b) = 0` and `normDet = 0` (no orthonormal basis of the range of size `n`) | hold | none |
| §6.1 Hadamard | `diag(2,1)`; `λU`; `n = 0` | `2 ≤ ‖A‖² = 4`; `λⁿ = λⁿ`; `1 ≤ 1` | holds, equality case right | none |
| §6.1 `J > 0` iff | `n = 0`, `A = 0` bijective | `Orientation.map` of the zero equivalence fixes the sign; `J = +1` iff same sign | agrees | none |
| §2.2 PH1.2 Check | `θ(z) = 2z`, `u = |w|^{1/2}`, `p = 3` | `|Du| ∼ |w|^{−1/2}/2`, `∫ r^{−3/2} r dr < ∞`; `u ∘ θ = √2 |z|^{1/2}` | both statements give membership | none |
| §2.2 outside PH1.2 | `θ = z²`, `u = log|w|` | non-injective; membership only `p < 2` | outside on both counts | none |
| §2.4 PH1.2 Check | `G(s,t) = st`, `u ∈ W^{1,3}_loc(ℂ)` | continuous by Morrey; `D(u₁u₂) = u₂Du₁ + u₁Du₂` | agree | none |
| Scope, global siblings | `Φ(x) = 2x`, `u = x²` on `(0,2)` | `D(u ∘ Φ) = 8x = Du(2x) · 2` | same derivative, no bound claimed | none |
| Hajlasz locator | lines 129–130, 138 | "If `p > n`" (Theorem 2.1); "If `p = n`" (proof) | F05 repaired | none |
| 1.2 `log|x|` on `ℝ²` | `p = 1, 2` | `∫_{|x|<1}|x|^{−p} = 2π/(2−p)`: `2π`, `∞` | member iff `p < 2` | none |
| 1.2 Heaviside | test `φ` | `∫ H φ' = −φ(0)`, so a weak derivative would satisfy `∫ U φ = φ(0)` | no `L¹_loc` `U` | none |
| **1.2 Cantor Check** | `Ω = (0,1)`, `[1/4, 3/4]` | `c(1/4) = 1/3`, `c(3/4) = 2/3`, `c' = 0` a.e.; pinned lemma is on `[0,1] ⊄ (0,1)` | Check true, cited lemma off-domain | **R03** |
| 1.2 Haar independence | `μ' = c μ` | `isAddLeftInvariant_eq_smul` gives `c = haarScalarFactor > 0`; both sides of `∫ ∂φ u = −∫ φ U` scale by `c` | same class and derivative | none |
| 1.3 empty index | `Ω = ∅` | `HasWeakFDerivOn μ ∅ u 0` holds; `L^p_loc(∅)` holds | both sides true | none |
| 1.3 cover up to a null set | `sign(x₁)`, two half-planes | `Du = 0` on each; a weak derivative on `ℝ²` would satisfy `∫ U φ = 2∫_{x₁=0} φ` | not a member; open cover used | none |
| 1.3 route | test `φ` on `Ω` | finitely many `Ωᵢ` cover `supp φ`; `SmoothPartitionOfUnity.exists_isSubordinate` on `E` (`T2`, σ-compact) splits `φ`; `U = Uᵢ` a.e. on `Ωᵢ` | sound | none |
| 1.4 | `u = x₁`, `V = B(0,1/2)` | jet value `x₁`, gradient `e₁`, `Du = ⟨e₁, ·⟩` | agrees | none |
| 1.4 | `log|x|`, `p = 2`, `V = B(0,1/2)` | `∫_V |x|^{−2} = ∞` | no `W1p` element; agrees with 1.2 | none |
| 1.4 | `|x|`, `p = ∞`, `V = ℝ` | `|x| ∉ L^∞(ℝ)` | relatively compact `V` needed, present | none |
| 2.2 values | `θ = 2y`, `u = |x|` | `Du(2y) ∘ 2 = 2⟨y,·⟩/|y| = D(2|y|)` | equal | none |
| 2.2 values | `θ = z²`, `u = log|w|` | `⟨z², 2zh⟩/|z|⁴ = 2⟨z,h⟩/|z|²` | equal | none |
| 2.2 local class | `θ = y³ + y`, `u = |x|` | `u ∘ θ = |y|(y² + 1)`, derivative `sign(y)(3y² + 1)` | `L^∞_loc`, not `L^∞` | none |
| 2.2 route | `W ⋐ Ω'` injective, `p = 1` | `compL` hypotheses on `W`: `p ≠ ⊤`, `InjOn`, `‖Dθ‖ ≤ L`, `c ≤ |det|`; gradient `Dθ*∇u(θ y)` paired with `v` gives `U(θ y)(Dθ(y) v)`; `∫_W ‖U ∘ θ‖^p ≤ c⁻¹ ∫_{θ(W)} ‖U‖^p` by `lintegral_image_eq_lintegral_abs_det_fderiv_mul` | sound at every `p` | none |
| 2.3 route | `V ⋐ V' ⋐ Ω` | mollification hypotheses `MemLp u 1 (μ.restrict V')`, closed balls in `V'`; `|DG(u_ε)Du_ε − DG(u)U| ≤ L|Du_ε − U| + |DG(u_ε) − DG(u)||U|`, second term `≤ 2L|U| ∈ L¹(V)` | sound | none |
| 2.4 cut-off | `K = u(V̄)` | `exists_contDiff_support_eq_eq_one_iff` with `s ⋐ W` open, `t` a closed neighbourhood of `K` in `s`: `support χ = s`, `χ = 1` on `int t ⊇ K`; `χG` extended by `0` is `C¹` on `W ∪ (F ∖ s̄) = F` | sound | none |
| 2.4 values | `G = log`, `u = |x|` on `ℝ² ∖ {0}` | `D log|x| = ⟨x,·⟩/|x|²` | agrees | none |
| 4.1 `C¹` structure | atlas `{x ↦ x³}`, `u = |x|` | representative `|y|^{1/3}`, derivative `|y|^{−2/3}/3`, `L^p_loc` iff `2p/3 < 1` | member iff `p < 3/2` | none |
| 4.1 existence | charts at every point, no cover | a pointwise definition through the chart at each `x` is not a weak derivative on any chart target (uncountably many a.e. relations); the countable cover defines `D` piecewise and §2.2 gives each chart identity | Lindelöf used, present | none |
| 4.1 uniqueness | two weak differentials | `ae_eq` on each chart target; `d(φ.symm)_z` invertible, so the disagreement set has null chart image at every `x₀` | no countability needed | none |
| 4.3 direction | `φ(x) = 2x`, `ψ = id`, `f = id` | representative `y/2`, `1 · Df · (1/2) = 1/2`, `Df = 1`; `dφ` in place of `(dφ)⁻¹` gives `1/4` | pinned | none |
| **4.3 totality Check** | circle map, choice modified on `{1}` | still a weak differential (agrees off a null set) | "for `t ≠ 0`" overstates; a.e. | **R04** |
| 4.5 | `tanh` corestricted to `(−1,1)` | `Df = 1 − tanh²` on both | agrees | none |
| 4.5 | cover `{(0,∞), (−∞,0)}` of `ℝ` | misses `0`; circle map member on each, on `ℝ` only `p < 2` | open cover of all `M` used | none |
| 5.1 norm | `id`, target `4 dt²` | `|v|_{g_N}/|v| = 2` | `‖Df‖ = 2`, chart norm `1` | none |
| 5.1 | circle map, radius `1`, `3` | angle chart; metric `dθ²`, `9 dθ²`; `|t|^{−1/2}/2`, `3|t|^{−1/2}/2` | agrees | none |
| 5.1 chart comparison | `K` compact in `φ.source ∩ f⁻¹ψ.source` | in the trivializations `Df(x)` is `D(rep)(φ x)`; `g_x`, `h_{f x}` continuous positive on `K`, uniformly comparable to the model norms | `C` exists | none |
| 5.2 (T3) | `t log|t|` | `f' = log|t| + 1`, in every `L^p_loc`, `p < ∞`, not `L^∞_loc` | class for finite `p` only | none |
| 5.3 | `c² g_N`; `dx² + 4dy²`; `e^{2x}dx²` | `‖A‖' = c‖A‖`; `‖id‖' = 2 = β/a`; `‖id‖' = e^x` unbounded | bounds attained, non-example valid | none |
| 6.2 chart formula | frame `∂ᵢ = dφ⁻¹eᵢ` | `vol_M(∂) = ε_M ρ_M`, `Df ∂ᵢ = Σ Aⱼᵢ ∂'ⱼ`, `vol_N(Df ∂) = det A · ε_N ρ_N` | `J_f = ε_M ε_N det A ρ_N/ρ_M` | none |
| 6.2 | `M = N = ℝ`, target `4 dt²` | `ρ_N = 2`, `ρ_M = 1`, `J_f = 2f'`, `normDet(Df) = 2|f'|` | consistent with 5.1 | none |
| 6.3 radial stretch (T4) | `x|x|^{−1/2}` | singular values `|x|^{−1/2}`, `|x|^{−1/2}/2`; `‖Df‖ ∈ L^p_loc` iff `p < 4`; `J_f = |x|^{−1}/2 ∈ L^q_loc` iff `q < 2 = p/n` | Hadamard `|x|^{−1}/2 ≤ |x|^{−1}` | none |
| 6.3 `n = 0` | `p/0` | `ENNReal`: `∞`; `J_f = ±1`, `‖Df‖⁰ = 1` | consistent | none |
| 7.1 (T6) | `Ω : Opens E`, chart | preferred chart of `Ω` is `subtypeRestr` of `refl`, target `Ω`, so the representative is `f̃` on `Ω` and `Ω_{x₀y₀} = Ω`; `f̃ ∈ L^p_loc` automatic from continuity | iff as stated | none |
| 7.1 values | `id`; reflection; `z²` | `(1, 1, 1)`; `J = −1`; `J = |2z|² = 4|z|² = |∂f|² − |∂̄f|²` | agree with 6.1, 6.2 | none |
| 8.1 route | normal form at `y₀` | `codChart ∘ ι ∘ domChart⁻¹ = equiv ∘ (·, 0)` on the domain chart source, mapped into the codomain chart source (`IsImmersionAtOfComplement`); `r = domChart⁻¹ ∘ fst ∘ equiv⁻¹ ∘ codChart` on the open `t`; `r(ι y) = y` on `U = domChart.source ∩ ι⁻¹(t)` | sound without `IsEmbedding` | none |
| 8.1 | `ι(s) = s³`, `s³` with `f = t^{1/3}` | every left inverse is `s^{1/3}`, not differentiable at `0`; `Df = t^{−2/3}/3`, `L^p_loc` iff `p < 3/2` | hypothesis used (8.1, 8.2) | none |
| 8.2 (T5) | circle map, `ι` vs `2ι` | `|D(ι ∘ f)| = |t|^{−1/2}/2 = ‖Df‖`; `2ι` doubles the left side | isometry used | none |
| 8.2 "if" route | `x₀`, `r` at `f(x₀)` | `f = r ∘ (ι ∘ f)` on `f⁻¹(U)`, values in `t`; `ψ ∘ r` is `C¹` on `t ∩ r⁻¹ψ.source` open, representative continuous; §2.4; §4.5 glues | sound | none |
| 8.2 double cover | `ι = z²`, `f(t) = e^{i|t|^{1/2}/2}` | `ι ∘ f` is the circle map; `f` in the angle chart `|t|^{1/2}/2`, derivative `sign(t)|t|^{−1/2}/4` | both member iff `p < 2` | none |
| 8.3 hedgehog | `x/|x|` on `B³` | `|D(ι ∘ u)|_{HS} = √2/|x|`; `4π ∫_0^1 r^{2−p} dr < ∞` iff `p < 3` | extrinsic class `p < 3`, continuous class never | none |
| 8.3 | `sign(x₁)` into `S⁰`; `L^p_loc`-only model | jump, in no class; the wrong model accepts it | non-example valid | none |
| 8.3 agreement | injective `ι`, `N ≠ ∅`, `v ∈ ι(N)` a.e. | `u := ι⁻¹ ∘ v` off the null set, a fixed point elsewhere; `ι ∘ u = v` a.e.; 4.1 is null-set invariant | both directions | none |
| 8.4 (T7) compactness | `N = ℝ`, `ι₂(s) = (s, e^{e^s})`, `u = log log(1/|x|)` on `B(0, e^{−1})` | `∫|Du|² = 2π ∫_1^∞ dt/t² = 2π`; second coordinate `1/|x|`, gradient `|x|^{−2}`, `∫ r^{−2} r dr = ∞` | `ι₁ ∘ u ∈ W^{1,2}_loc`, `ι₂ ∘ u ∉ W^{1,1}_loc` | none |
| 8.4 injectivity | `ι₁ = z²`, `u = e^{iθ/2}` | `ι₁ ∘ u = z/|z|` smooth; `ι₂ ∘ u` jumps `1 → −1` across `θ = 0` | non-example valid | none |
| 8.4 two embeddings | `S¹ ⊂ ℝ²`, `z ↦ (z, z²)`, `u = x/|x|` | both gradients `≍ 1/|x|`, `∫ r^{−p} r dr < ∞` iff `p < 2` | same range | none |
| 8.4 route | `exists_contMDiffMap_extension_hasCompactSupport` | ambient `V₁`: `IsManifold ∞`, `T2`, σ-compact, finite-dimensional; source model boundaryless; `K = univ` compact; `n = 1 : ℕ∞`; `G` compactly supported `C¹`, `‖DG‖` bounded | all hypotheses available | none |
| Conventions, volume and `J` witnesses | unit square; `id` to `4 dt²` | density `√det(4I₂) = 4`; `vol_N = 2 dt`, `J_f = 2` | consistent with 3.1, 6.2, 6.4 | none |
| Conventions, dimension `0` | any map of a `0`-manifold | only linear map `0`; `J(0) = ±1`; every class | consistent with 3.1, 4.1, 6.1 | none |

**Convention witnesses recomputed across layers.** The direction of `Df` (Conventions, 4.1,
4.3, 5.1, 6.2), the operator norm (Conventions, 5.1, 5.3, 7.1, 8.2), the volume (Conventions,
3.1, 6.2, 6.4, 7.1) and the sign of `J` (Conventions, 6.1, 6.2, 6.4, 7.1) give the same values
at every occurrence; the circle map, the radial stretch and the hedgehog agree in every section
that uses them (rows above).

**Overlap facts.** No id this roadmap cites is dropped by an open pull request; no id it cites
is defined only by an open revision (the R01 repair introduces one: RiemannianGeometry R4.6's
transfer, whose id exists on main, so the worker names the revision in the merge-order
paragraph); no other open pull request changes this roadmap; one object with two owners (R01).

## Not verifiable

- Ziemer1989 Theorems 2.1.11 and 2.2.2 and Ch. 2 §2.1, Mazya2011 §1.1, Rickman1993 Ch. I §1,
  Lee2012 Ch. 4, 6, 15, 16: paywalled, settled as uncertified in `sources.toml`; cited by
  locator. The statements attributed to them are standard and agree with the reviewer's
  knowledge of the texts, but the pages were not opened.
- Bethuel1991: open content on Project Euclid, but the sources service received only a
  bot-protection page (recorded in the manifest); it is context for the Part II scope only.
- Elaboration of a Lean file: not available (this lane does not elaborate; the design stage has
  no `Suggested.lean`).
- RiemannianGeometry R4.6's transfer was read at the head of its open pull request (R01); whether
  its Lean statement will be restricted to smooth metrics cannot be read from the text, which
  speaks of "the continuous chart density".

## Source issues

- **Misprint** in HeikkilaPankka2025 at Appendix B, proof of Proposition B.1, line 1328 (arXiv
  v2): the source writes the composite of the map `p : M → N` with the embedding `ι : N → ℝ^m`
  in the order `p ∘ ι`; it should be `ι ∘ p`, the only composable order; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f9c8ebfb80decfe1fe3cc4f5d732ea155b8c858f", "job": "REV-DESIGN-SobolevMapsBetweenManifolds~2", "model": "fable", "worker": "chris-x9"} -->
