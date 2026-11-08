<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7625#issuecomment-6715943912 -->
Review (claude) of ff45e4c

Verdict: needs_changes

1. **F01** (P3) §4.5's corestriction needs §2.4 (or §4.6(b)), which its `*Needs:*` line omits

   **Location.** `packages/SobolevMapsBetweenManifolds/design/README.md` lines 957–958 ("if
   `f(M) ⊆ W` for an open `W ⊆ N`, then `f ∈ W^{1,p}_loc(M, N)` iff the corestriction lies in
   `W^{1,p}_loc(M, W)`") and line 972 (`*Needs:* §1.3, §3.3, §4.2, §4.3`); `plan.json` 4.5
   `prerequisites`.

   **Claim.** The corestriction equivalence follows from the listed inputs.

   **Witness.** The "if" direction must produce membership of the representative `ψ_{y₀} ∘ f ∘ φ⁻¹`
   for `y₀ ∈ N ∖ W`, whose chart may meet `f(M)`. §4.2's atlas independence needs an atlas `ℬ`
   covering `N`; the restricted charts of `W` cover only `W`. The representative is
   `(ψ_{y₀} ∘ ψ_y⁻¹) ∘ (ψ_y ∘ f ∘ φ⁻¹)` with `y ∈ W`: a `C¹` postcomposition of a continuous member,
   which is §2.4 (equivalently §4.6(b) with `g` the inclusion `W ↪ N`), then §1.3 glues. Neither
   §2.4 nor §4.6 is on the line.

   **Repair.** Add `§2.4` to §4.5's `*Needs:*` line and `target:2.4` to `plan.json` 4.5's
   `prerequisites`, and add one clause to the corestriction item: "the chart of a point of
   `N ∖ W` is read through a chart of `W` by §2.4". Tested on the instance that exposed it: for
   `f = tanh` corestricted to `W = (−1, 1)` and `y₀ = 2` with `ψ_{y₀} = id`, the representative is
   `id ∘ tanh`, a `C¹` postcomposition of a continuous member of every class, so membership and
   `Df = 1 − tanh²` follow for the chart at `2` exactly as for the charts at points of `W`.

One finding, P3 and non-blocking, a repair for the fix round to apply before the port (a
missing `*Needs:*` edge and `plan.json` prerequisite). The four findings of round 2 are
repaired. Everything else checked (the repaired passages under the adversarial pass, the seeded
sample at the sources' lines, every library name of the sampled targets at the pins, every
cross-roadmap citation at main or at the open head, the merge-order gate, the duplication
greps, the headline theorems) was found sound.

## Round 2 findings, checked one by one

- **F01 (P2, §3.1 and RiemannianGeometry R4.6 both own the null-set transfer) — repaired, by
  the reviewer's fallback.** `README.md` lines 104–111: "R4.6 owns the comparison of chartwise
  nullity with the Riemannian volume under its conventions (smooth, boundaryless, Hausdorff,
  second-countable manifolds with smooth metrics) … §3.1 differs in asking only a continuous
  metric on a `C¹` Lindelöf manifold, possibly with boundary, and for a smooth metric it is
  R4.6's comparison (a Check)"; the supplier subsection `### From TauCetiRoadmap.RiemannianGeometry`
  (lines 345–350, "used only in the agreement Check of §3.1; no proof here consumes it"); the
  §3.1 Check (lines 720–727); `plan.json` suppliers entry and test `riemannian_geometry_agreement`;
  no `*Needs:*` line cites R4.6. The fallback's premise is verified: RiemannianGeometry's
  conventions on main (`TauCetiRoadmap/RiemannianGeometry/README.md` lines 15–16) and at the head
  of its open revision (lines 51–52) are "Hausdorff, second-countable, boundaryless smooth
  manifolds and smooth positive-definite Riemannian metrics", and the transfer at the head
  (lines 1225–1233) is stated for `TauCeti.riemannianVolume` of those metrics. §3.1's instances
  (`IsManifold I 1 M`, `LindelofSpace`, continuous metric, model possibly with boundary) are
  strictly wider, and §3.2, §5.3 and Layers 5–6 use it for arbitrary continuous metrics, so the
  continuous-metric variant is a kept variant with its one-clause difference. The agreement Check
  is computed below. Note for the package stage, not a finding: the transfer that the Check names
  exists at the open head only (on main, line 700, R4.6 says "chart nullity and its
  canonical-volume comparison" for the cut locus), while the id `R4.6` exists on main; the
  pull request opened from the package should name RiemannianGeometry's revision in its
  merge-order paragraph, as the round-2 repair asked.
- **F02 (P3, `J(id_V) = 1` needs one orientation) — repaired.** Line 1109–1110: "`J(id_V) = 1`
  when `o_W = o_V` and `J(id_V) = −1` when `o_W = −o_V`"; the orthonormal-basis Check (line
  1133) now says "with the standard orientation on both sides"; `plan.json` `orientedJacobian_comp`
  and `non_orthonormal_bases` agree. Recomputed below.
- **F03 (P3, the Cantor Check cites a lemma on `[0, 1]` for a class on `(0, 1)`) — repaired.**
  Lines 450–457: the Check is now on `ℝ` for `c` with `c = 0` on `(−∞, 0]` and `1` on `[1, ∞)`
  (`TauCeti.cantorFunction_of_nonpos`, `CantorFunction.lean:162`, and `cantorFunction_of_one_le`,
  `:167`, at the pin), restricted to `(0, 1)` so that `HasWeakLineDerivOn.absolutelyContinuousOnInterval`
  (`Interval.lean:302–306`: `Ioo a b`, `IntegrableOn u' (Ioo a b)`, `ContinuousOn v (Icc a b)`)
  applies on `[0, 1]`, against `not_absolutelyContinuousOnInterval_cantorFunction`
  (`CantorFunction.lean:245`, on `0 1`); the `(0, 1)` clause goes through `[1/4, 3/4]` with
  `c(1/4) = 1/3`, `c(3/4) = 2/3`. Both values recomputed below. `plan.json` `cantor_not_member`
  agrees.
- **F04 (P3, the circle-map value of `Df` holds almost everywhere only) — repaired.** Lines
  922–925 ("for almost every `t`. Changing that field at `t = 1` gives another weak differential");
  the same pattern at the Conventions' Totality bullet (lines 176–180), §4.4 (lines 939–942),
  §5.1 (line 1034), §6.2 (line 1183) and the worked example (lines 1456–1458). Grep of the README
  for "everywhere" outside "almost everywhere" finds only the junk value `Df = 0` for
  discontinuous `f` (line 922), the pointwise linear-algebra identities (lines 179–180, 1162–1163)
  and "`p = ∞` is included everywhere" (line 135): nothing else claims a pointwise value of `Df`.

Pattern search for the repaired patterns elsewhere: identity Jacobians carry their orientation
pair at every occurrence (Conventions line 171, §6.1, §6.2 line 1183, §7.1 line 1281 under the
theorem's "both `Ω` and `E` carry the orientation `model o`"); the Cantor Checks of §4.4 and §5.2
cite §1.2 on `ℝ`; no other object of this roadmap is owned at an open head (duplication greps
below).

## Verified sound

**Principles.** No route-specific shortcut (every `1 ≤ p ≤ ∞`, every finite-dimensional
codomain, no bound on `C¹` factors, no injectivity in §2.2, no Nash embedding); no re-planned
roadmap (Tau Ceti `W1p`, PH1.1, PH1.2, PH4.1, GeometricCurrents G6, DifferentialGeometry 2.1–2.2
and 12.1–12.4, RiemannianGeometry R4.6 are cited, not restated); no upward or cyclic supply
(gate below); no copied passage; no computational algorithm; the design has no Lean file, so no
sorry'd data and no `set_option`. Elaboration: not available (this lane does not elaborate; the
design stage has no `Suggested.lean`).

**Gate.**

```
candidate: SobolevMapsBetweenManifolds is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2391 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve`: no cross-roadmap citation and no Lean name found
nowhere (names outside TauCetiRoadmap are opened at the pins below). `roadmaps overlaps`: no open
pull request changes this roadmap, no dropped id, no id only an open revision defines; closest
roadmaps DifferentialGeometry (#886, #1187), SobolevDifferentialForms (#1609),
SobolevPolynomialApproximation (#1612), GeometricMeasureTheory (#1187). Intake note, as in round 2:
QuasiregularMaps (merge order line 272, a board package) consumes this roadmap through six
declared gaps (`packages/QuasiregularMaps/design/README.md` lines 263–296), so the roadmap should
be inserted before it.

**Sources (seeded sample, at the locators).**

| Target | Source and locator | Finding |
|---|---|---|
| 1.4 | Mazya2011 §1.1 | uncertified; GeometricCurrents G6 (`TauCetiRoadmap/GeometricCurrents/README.md` line 750) defines `W^{j,p}_loc(Ω)` by restriction to relatively compact opens, as §1.4 says |
| 2.1, 3.3 | Lee2012 Ch. 6 | uncertified; the statements are the standard null-set lemmas, restated at the generality of Haar measures and `C¹` maps with the dimension and countability hypotheses the Checks separate |
| 2.2 | Ziemer1989 Thm 2.2.2; Mazya2011 §1.1 | uncertified; the PH1.2 agreement Check matches PH1.2 on main (`TauCetiRoadmap/PseudoholomorphicCurveAnalysis/README.md` line 277, `kp > 2`) |
| 4.2, 4.3, 4.4 | HeikkilaPankka2025 lines 22–26 | "A continuous map `f : M → N` between oriented Riemannian `n`-manifolds, `n ≥ 2`, is quasiregular if `f` belongs to `W^{1,n}_loc(M, N)`", "`‖Df‖` is the operator norm of the weak differential `Df`": the class of continuous maps and its weak differential, generalised here to every `p` and no orientation |
| 4.5 | Mazya2011 §1.1 | uncertified (locality) |
| 4.6 | Ziemer1989 Thms 2.1.11, 2.2.2 | uncertified |
| 5.2 | Rickman1993 Ch. I §1; HeikkilaPankka2025 lines 22–26 | Rickman uncertified; HP as above |
| 6.1 | MartioRickmanVaisala1969 line 124 | "The Jacobian of `f` at `x` is denoted by `J(x, f)`" after the formal derivative (lines 119–121); Rickman1993 uncertified |
| 6.3 | Rickman1993 Ch. I §1; HeikkilaPankka2025 line 23 | `W^{1,n}_loc` at line 23 is the borderline `p = n` |
| 6.4 | HeikkilaPankka2025 lines 25–27; Lee2012 Ch. 16 | "`J_f` is the Jacobian determinant of `f`" (line 26–27); Lee uncertified |
| 7.1 | MartioRickmanVaisala1969 line 124, lines 332–340 | Definition 2.16: `ACL` (continuous, absolutely continuous on almost every axis-parallel segment of each `n`-interval in `U`), `ACL^p` (partials locally `L^p`, `p ≥ 1`) |
| 8.3 | Hajlasz2009 lines 23–28; Bethuel1991 Introduction | line 28: `W^{1,p}(M, N) = {u ∈ W^{1,p}(M, ℝ^ν) : u(x) ∈ N a.e.}` with `N` compact, boundaryless, isometrically embedded (lines 23–25); Bethuel uncertified |
| Scope, Downstream | Hajlasz2009 lines 129–130, 138–141 | Theorem 2.1 "If `p > n = dim M`"; "If `p = n`" opens inside the proof at line 138 |
| 8.2 | HeikkilaPankka2025 line 1328 | "Let `ι : N → ℝ^m` be a Nash embedding. Then `p ∘ ι ∈ W^{1,∞}(M, ℝ^m)`" (the composite is written in the wrong order: Source issues) |

Flagged-unverified locators: none beyond the five uncertified texts.

**Library declarations opened at the pins** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, the pins of
`lake-manifest.json` and `plan.json`'s baseline), for the sampled targets and the round-3
citations:

- `TauCeti.cantorFunction_of_nonpos` (`Analysis/SpecialFunctions/CantorFunction.lean:162`),
  `cantorFunction_of_one_le :167`, `image_cantorFunction_cantorSet :174` (the image of the Cantor
  set is `Icc 0 1`, used by the §2.1 Check), `not_absolutelyContinuousOnInterval_cantorFunction :245`;
  `HasWeakLineDerivOn.absolutelyContinuousOnInterval` (`WeakDeriv/Interval.lean:302`).
- `TauCeti.W1p` (`W1p/Basic.lean:372`, `Opens E`, `mu.IsAddHaarMeasure`, `Fact (1 ≤ p)`;
  `w1pSubmodule :327`), `mem_w1pSubmodule_iff_hasWeakFDerivOn :573`; `W1p.compL`
  (`ChangeOfVariables.lean:274`; variables `:262–266`: `p ≠ ⊤`, `DifferentiableOn`, `InjOn`,
  `MapsTo`, `‖fderiv Φ x‖ ≤ L`, `0 < c ≤ |det|`; `InnerProductSpace ℝ E` at `:274`).
- `MeasureTheory.addHaar_image_eq_zero_of_differentiableOn_of_addHaar_eq_zero`
  (`Function/Jacobian.lean:556`, `f : E → E`), `lintegral_image_eq_lintegral_abs_det_fderiv_mul :1184`
  (`MeasurableSet s`, `HasFDerivWithinAt`, `InjOn`); `DifferentiableOn.addHaar_image_eq_zero_of_finrank_lt_finrank`
  (`Sard/LowDimension.lean:73`, no null hypothesis on `s`); `ContDiffAt.toOpenPartialHomeomorph`
  (`InverseFunctionTheorem/ContDiff.lean:31`).
- `IsLocalDiffeomorph` (`LocalDiffeomorph.lean:275`), `isOpen_extChartAt_target`
  (`ExtChartAt.lean:548`, `I.Boundaryless`), `contDiffOn_ext_coord_change :784`;
  `TopologicalSpace.Opens.instChartedSpace` (`HasGroupoid.lean:284`, charts `subtypeRestr`, so the
  preferred chart of `Ω : Opens E` is `Subtype.val` with target `Ω`, as §7.1 uses);
  `TauCeti.WithMetric` (`WithMetric.lean:68`, parametrised by a `ContMDiffRiemannianMetric I n`,
  `n : ℕ∞ω`, so `n = 0` is the continuous case; same `ChartedSpace :155`, `IsManifold :164`,
  Borel `:150–152`, `IsContinuousRiemannianBundle :401`).
- `TauCeti.riemannianVolume` (`VolumeDensity/Volume.lean:82`; variables `:58–63` need no
  `Boundaryless`, as §3.1's "model may have boundary" uses), `riemannianVolume_restrict_source :87`,
  `setLIntegral_riemannianVolume_of_subset :112` (`s ⊆ chart source`, `MeasurableSet s`, integral
  against `(Module.finBasis ℝ E).addHaar` with the chart density);
  `Topology.IsOpenEmbedding.measurableEmbedding` (`BorelSpace/Basic.lean:687`).
- `TauCeti.IsNullSet` (`Geometry/Manifold/Measure.lean:36`); `Manifold.Orientation.model`
  (`Orientation/Basic.lean:235`, `Fintype.card ι = finrank`), `.orientationAt :140`,
  `.restrict` (`OpenSubset.lean:49`, pullback along `Subtype.val`), `IsOrientationPreservingAt`
  (`Preserving.lean:63`); `riemannianVolumeForm` (`Riemannian/VolumeForm.lean:55`);
  `Manifold.instRiemannianBundleOpen` (`Restriction.lean:209`); `riemannianMetricVectorSpace`
  (`Mathlib/Geometry/Manifold/Riemannian/Basic.lean:102`, instance `:126`).
- `Orientation.volumeForm` (`InnerProductSpace/Orientation.lean:170`: for `n = 0`,
  `constOfIsEmpty 1` for the positive orientation and its negative otherwise, `volumeForm_zero_pos
  :178`, `volumeForm_zero_neg :184`), `volumeForm_robust :198`, `volumeForm_neg_orientation :223`,
  `abs_volumeForm_apply_le :245`, `abs_volumeForm_apply_of_orthonormal :286`, `volumeForm_map :290`,
  `finOrthonormalBasis :148` (`0 < n`); `Module.Basis.orientation_isEmpty`
  (`LinearAlgebra/Orientation.lean:186`); `AlternatingMap.eq_smul_basis_det` (`Determinant.lean:647`);
  `LinearMap.normDet` (`NormDet.lean:69`).
- `MeasureTheory.locallyIntegrableOn_iff` (`LocallyIntegrable.lean:188`: `PseudoMetrizableSpace`
  codomain, `LocallyCompactSpace X`, `IsLocallyClosed s`, no separation axiom, as §1.1's bullet
  states).

The round-2 review opened every other backticked library name of the README at the same pins;
the pins are unchanged (`lake-manifest.json`), and the round-3 repair added no library name.

**Duplication by object.** `roadmaps grep` over main and the 476 open heads (index of
2026-11-08) for `W^{1,p}_loc(M, N)`, "oriented Jacobian"/`orientedJacobian` and "weak
differential"/`weakMFDeriv`: no roadmap other than this one and QuasiregularMaps states the
continuous class between manifolds, its weak differential or the oriented Jacobian (the only
"weak differential" hits are PH4.1's `du` on main, lines 819–834, which the Downstream section
cites as the `p > 2` surface case, DGFloer's determinant dictionary and Poincare3D's
Hamilton–Jacobi inequalities, different objects). `IsNullSet` is used by DifferentialGeometry
(#886, Sard), TangentialBordism (#942), HomotopySpheres (#1287), AlgebraicTopology (#1663),
RiemannianGeometry (#1683: the transfer of F01) and the batch revision #1187. The nullity-to-volume
transfer has one other owner, RiemannianGeometry R4.6 for smooth metrics, which the Scope now names
with the one-clause difference. The open siblings SobolevDifferentialForms §4.1 (head, line 387,
"Pullback") and SobolevPolynomialApproximation §2.1 (head, line 325, "Composition with `C^k`
diffeomorphisms") are the global counterparts the Scope names. Ownership against the open pull
requests was checked for these and by the object greps.

**Supplier order.** Suppliers on main: PDE Layer 1 (`TauCetiRoadmap/PDE/README.md` line 675),
GeometricCurrents G6 (line 668; local spaces line 750), PseudoholomorphicCurveAnalysis PH1.1,
PH1.2, PH4.1 (lines 213, 277, 807), DifferentialGeometry 2.1, 2.2, 10.2, 12.1, 12.4 (lines 345,
352, 884, 915, 923) and its no-measurable-structure convention (line 50), RiemannianGeometry
R4.6 and R6 (lines 694–703, 1221), GeometricMeasureTheory G2 (line 148; `normDet` at 83),
PseudodifferentialOperators §5.2 (line 967). TeichmullerGeometry §7.4 (head of its pull request,
line 577) and the two open siblings are cited only as deferrals in the Scope. No `*Needs:*` line
cites a later roadmap; no declared gaps; every `*Needs:*` item resolves to a section of this
roadmap, a main-branch section or a pinned declaration (R01: one section missing from one line).

**Shape.** Summary; Scope and ownership; Conventions; Exact supplier contracts (Mathlib, Tau
Ceti, DifferentialGeometry, PseudoholomorphicCurveAnalysis, RiemannianGeometry); How to read the
build; eight layers each ending in `### Examples` and `### Dependencies`; Downstream consumers;
Worked examples; References. Nine definitions with API lists and Check counts 4, 5, 4, 3, 3, 5,
3, 3, 3; twenty theorems with hypotheses in the sentence and a locator; `plan.json`: 29 targets,
104 tests, every target with a locator and prerequisites. No process residue, no LaTeX
delimiters, no `lemma`, no pull-request number, no path, no "optional" or "deferred". No
backticked name is presented as this roadmap's own (the identifiers in backticks are library
names, source keys and notation). `sources.toml` records all eight cited works; the three
certified entries carry the hashes of the cached texts.

**Headline theorems.** T1–T7 are listed in the Summary with section labels, every label
resolves (T1: §1.3, §2.2–2.4; T2: §3.1, §4.2–4.4; T3: §5.2–5.3; T4: §6.1–6.4; T5: §8.2; T6:
§7.1; T7: §8.4), and each is a theorem on the roadmap's own objects with its hypotheses in the
sentence. For the package stage, as in round 2: T1 is statable on `TauCeti.HasWeakFDerivOn` and
`MeasureTheory.MemLp`; T2–T7 need the predicates of §4.2–§4.3 and the oriented Jacobian of
§6.1, each definable with a real body from `extChartAt`, `HasWeakFDerivOn`,
`Orientation.volumeForm` and `Manifold.Orientation.orientationAt`. Nothing in the README is
padding-shaped.

**Adversarial table** (repaired passages, sampled targets, headline theorems, the finding).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Scope, R4.6's conventions (F01) | RG main lines 15–16; head #1683 lines 51–52, 1225–1233 | "Hausdorff, second-countable, boundaryless smooth manifolds and smooth positive-definite Riemannian metrics"; transfer at the head for every subset (one direction) and on chart sources (converse) | §3.1's instances (`C¹`, Lindelöf, continuous metric, boundary allowed) are wider; kept variant correct | none |
| §3.1 Check, R4.6 case | smooth metric, RG conventions | §3.1's iff for every `s` follows from the head's two statements by the countable chart cover and `IsNullSet.iUnion`/`.mono` | the Check's "is R4.6's comparison" holds | none |
| §3.1 Check, continuous metric | `g = (1 + |x₁|^{1/2}) δ` on `ℝ²` | Gram det `(1 + |x₁|^{1/2})²`, density `1 + |x₁|^{1/2}`; `vol([0,1]²) = ∫_0^1 (1 + t^{1/2}) dt = 1 + 2/3 = 5/3`; `{0} × [0,1]` Lebesgue-null, density bounded on it, volume `0`; `∂₁ |x₁|^{1/2}` unbounded at `0`, so not `C¹` | outside R4.6, inside §3.1 | none |
| §3.1, dimension `0` | `0`-manifold | Haar on `0` charges `{0}`; `0 × 0` Gram determinant `1`, counting measure | only `∅` null on both sides | none |
| §3.1, flat `ℝ²` | unit square; segment | `1`, `4` (density `√det(4I₂) = 4`); segment null for both | consistent with Conventions' volume witness | none |
| Conventions, Totality (F04) | discontinuous `f`; `0`-manifold; `|J_f| = normDet(Df)` at a point off the class | `Df = 0`; `J(0) = 0 = normDet(0)` for `n ≥ 1`, `J(0) = ±1`, `normDet = 1` for `n = 0` | pointwise identities hold everywhere, values a.e. | none |
| §1.2 Cantor on `ℝ` (F03) | member hypothesis | restriction to `Ioo 0 1` (`.mono`), line derivative in direction `1` (`hasWeakFDerivOn_iff`), `U · 1` integrable on `(0,1)` from `L¹_loc(ℝ)`, `c` continuous on `[0,1]`: the interval lemma gives `AbsolutelyContinuousOnInterval c 0 1`, refuted by the pinned lemma | not a member | none |
| §1.2 Cantor on `(0,1)` | `[1/4, 3/4]` | `1/4 = 0.0202…₃ ↦ 0.0101…₂ = 1/3`; `3/4 = 0.2020…₃ ↦ 0.1010…₂ = 2/3`; AC with `c' = 0` a.e. forces increment `0 ≠ 1/3` | not a member | none |
| §1.1 definition | `|x|^{−1/2}` on `ℝ`, `p = 1, 2` | `∫_{−1}^1 |x|^{−p/2} = 4/(2 − p)`: `4`, `∞`; on `ℝ ∖ {0}` compact sets avoid `0`, so `L^∞_loc` | member iff `p < 2` | none |
| §1.1 definition | `1/x` on `(0,1)` | bounded by `1/a` on `[a,b]`; `∫_0^1 dx/x = ∞` | `L^∞_loc`, not `L¹`; bounded-subset model excluded | none |
| §1.1 continuous members | compact `K ⊆ s`, Hausdorff `X` | `K` closed hence Borel; continuous on compact gives a.e.-strong measurability without second countability; bounded on `K` with `μ(K) < ∞` | every `p` | none |
| §1.1 gluing | locally compact `X`, open `sᵢ`, compact `K` | each `x ∈ K` has a compact neighbourhood in some `sᵢ`; finitely many cover `K`; `μ|_K ≤ Σ μ|_{Kⱼ}` | holds | none |
| §1.1 `locallyIntegrableOn_iff` | pin `:188` | hypotheses `LocallyCompactSpace X`, `IsLocallyClosed s`, metrizable codomain | matches the bullet | none |
| §1.4 (sampled) | `u = x₁`, `V = B(0,1/2)`; `log|x|`, `p = 2`; `|x|`, `p = ∞`, `V = ℝ` | gradient `e₁`; `∫_V |x|^{−2} = ∞`; `|x| ∉ L^∞(ℝ)` while bounded `V` work | iff as stated; relatively compact `V` needed and present | none |
| §1.4 route | compact `K ⊆ Ω` | an open `V ⊇ K` with compact closure in `Ω` exists (local compactness); `W1p` jets have gradient in `Lp E p`, read as `⟨∇w, ·⟩` (`candidateWeakFDeriv`) | both directions sound | none |
| §2.1 (i) | projection `ℝ² → ℝ`, `ℝ × {0}` | `finrank 2 > 1`; image `ℝ` | dimension hypothesis used | none |
| §2.1 (i) equal dims | linear equivalence `L : E' ≃ E` | `θ ∘ L⁻¹ : E → E` differentiable on `L(A)`, `μ(L(A)) = 0` (Haar to Haar); Mathlib `:556` | holds | none |
| §2.1 (i) smaller dim | `finrank E' < finrank E` | Tau Ceti `:73` with no null hypothesis on `A` | holds | none |
| §2.1 (ii) | constant map; route | `θ⁻¹({c}) = ℝ²`, derivative `0`; IFT pieces `Wₖ` countable (second countable `E'`), `Wₖ ∩ θ⁻¹S = θₖ⁻¹(S ∩ θ(Wₖ))`, image of a null set under the `C¹` inverse, (i) | holds; invertibility used | none |
| §2.1 Cantor Check | Cantor set `C`, `c(C) = [0,1]` (`image_cantorFunction_cantorSet`) | symmetric quotient at `x ∈ C` over `3^{−k}`: `≥ 2^{−k}/(2 · 3^{−k}) = (3/2)^k/2 → ∞`, so no finite derivative on `C` | differentiability on `A` used | none |
| §2.2 (i) local integrability | `W ⋐ Ω'` injective, `|det Dθ| ≥ c` | `∫_W |u ∘ θ| ≤ c⁻¹ ∫_{θ(W)} |u|` | `HasWeakFDerivOn`'s integrability clauses hold | none |
| §2.2 (ii) `p = ∞` | exceptional null set `Z ⊆ Ω` of `‖U‖ ≤ ess sup` | `θ⁻¹(Z) ∩ W` null by §2.1 (ii) | `‖U(θ y) ∘ Dθ(y)‖ ≤ L · ess sup` a.e. | none |
| §2.2 values | `θ = 2y`, `u = |x|`; `θ = z²`, `u = log|w|` | `2⟨y,·⟩/|y|`; `⟨z², 2zh⟩/|z|⁴ = 2 Re(z̄h)|z|²/|z|⁴ = 2⟨z,h⟩/|z|²` | equal to `D(2|y|)`, `D(2 log|z|)` | none |
| §2.2 negative controls | `θ = (y₁, 0)`, `log|x|`; `θ = y³ + y`, `|x|` | `∫_{[−1,1]²} |y₁|^{−1} = ∞`; `(3y² + 1) sign(y)` unbounded on `ℝ` | invertibility and the local class used | none |
| §2.2 compL agreement | `F = ℝ`, `p < ∞` | `⟨Dθ* ∇u(θy), v⟩ = ∇u(θy) · Dθ(y)v = U(θy)(Dθ(y)v)` | agrees with `gradient_compL_ae` | none |
| §2.2 dimension `0` | `E = E' = 0` | `θ = 0`, `fderiv = 0 : 0 → 0` invertible; `u ∘ θ = u(0)`, derivative `0` | holds | none |
| §3.3 (i) | `θ : ℝ × D → ℝ`, `(x,d) ↦ x`, `s = {0}` | `θ⁻¹(s) = {0} × D`; each slice chart sees one point, image `{0}` | null without countability of `M'` | none |
| §3.3 (i) route | chart source `W` of `M'` | `W` second countable; countably many `Wⱼ` with `C¹` inverses, `θ(Wⱼ) ⊆ ψⱼ.source`; `φ(θ⁻¹s ∩ Wⱼ)` is the preimage of the null `ψⱼ(s ∩ θ(Wⱼ))` under `ψⱼ ∘ θ ∘ φ⁻¹` with invertible derivative; §2.1 (ii) | sound | none |
| §3.3 (ii) | `ℝ × D`, `D = ℝ` discrete, `f(x,d) = d`, `s = {0} × D`; `D = ℤ` | `s` null, `f(s) = ℝ` not; no countable cover; with `ℤ`: `f(s) = ℤ` null | hypothesis used; Check records it | none |
| §3.3 (ii) route | piece `Sₖ`, chart `ψ` | `ψ(f(s ∩ Sₖ) ∩ ψ.source) = (ψ ∘ f ∘ φₖ⁻¹)(φₖ(s ∩ Sₖ ∩ f⁻¹ψ.source))`, the latter `⊆ φₖ(s ∩ Sₖ)` null; representative differentiable on the open `φₖ(Sₖ ∩ f⁻¹ψ.source)`; §2.1 (i); `IsNullSet.iUnion` | sound | none |
| §3.3 (iii) | `U : Opens M`, `x ∉ U`, `s ⊆ U` | chart of `U` at `x' ∈ U` is `(chartAt x').subtypeRestr`, same image in `E`; for `x ∉ U`, `s ∩ source_x` is covered by countably many `U`-chart sources, each image null, transported by `C¹` coordinate changes (§2.1 (i)) | both directions | none |
| §3.2 (now reviewed in full) | compact `K ⊆ φ.source` | `K` closed in the Hausdorff chart source, hence Borel; `∫_K ‖g‖^p dvol = ∫_{φK} ρ ‖g ∘ φ⁻¹‖^p`, `0 < inf ρ ≤ sup ρ < ∞` on `K` | comparable measures, §1.1 | none |
| §3.2, arbitrary compact `K ⊆ M` | non-Hausdorff `M` | `K ⊆ ⋃ⱼ Kⱼ` finite, `Kⱼ` compact inside chart sources (closed balls pulled back); `vol|_K ≤ Σ vol|_{Kⱼ}` | no separation axiom needed | none |
| §3.2 Checks | `dx²` vs `e^{2x}dx²`, `g = 1_{[0,∞)} e^{−x}`; `1/x`; `0`-manifold | `∫ g dx = 1`, `∫ g e^x dx = ∞`; `L^∞_loc((0,∞))`; counting measure | same local classes, different global | none |
| §4.2 (T2, sampled) openness | `Ω_{x₀y₀} = φ.target ∩ φ.symm⁻¹(f⁻¹ψ.source)` | `φ.target` open (boundaryless), `φ.symm` continuous on it, `f` continuous | open | none |
| §4.2 atlas independence route | `z ∈ Ω_{x₀y₀}`, `e ∈ 𝒜`, `e' ∈ ℬ` at `φ⁻¹z`, `f(φ⁻¹z)` | `ψ ∘ f ∘ φ⁻¹ = (ψ ∘ e'⁻¹) ∘ (e' ∘ f ∘ e⁻¹) ∘ (e ∘ φ⁻¹)`: §2.2 (invertible derivative) on the right, §2.4 (continuous middle) on the left; open cover of `Ω_{x₀y₀}`; §1.3 | three items equivalent | none |
| §4.2 vector target | `N = V`, `ψ = id` | `Ω_{x₀y₀} = φ.target`, representative `u ∘ φ⁻¹` | continuous members of §4.1 | none |
| §4.2 Checks | circle map; `{x ↦ x³}` source | `|t|^{1/2}`, `∫_{−1}^1 |t|^{−p/2} < ∞` iff `p < 2`; `y^{1/3}`, `|y|^{−2/3}/3`, `2p/3 < 1` iff `p < 3/2` | as stated | none |
| §4.3 (T2) existence | Lindelöf `M`, cover `(Sₖ)` | `f(Sₖ)` Lindelöf (continuous image of second countable), countably many `ψⱼ`; `D` defined on `Sₖ ∩ f⁻¹ψⱼ.source` via `(φₖ, ψⱼ)`; consistency a.e. by §2.2, §2.4, uniqueness; §1.3 glues in every preferred pair | exists | none |
| §4.3 uniqueness | `D ≠ D'` at `x ∈ φ.source` | `dψ_{f x}`, `d(φ⁻¹)` invertible, so chart expressions differ at `φ(x)` for `ψ = ψ_{f(x)}`; `f(φ.source)` covered by countably many `ψⱼ`, so the disagreement image lies in a countable union of a.e.-null sets | `IsNullSet` without extra hypothesis | none |
| §4.3 chart expression | field changed on a null set | image under `φ` of `s ∩ source` is `μ`-null | still a weak differential | none |
| §4.3 Checks | `φ(x) = 2x`, `f = id`; circle map changed at `t = 1` | `1 · Df · 1/2 = 1/2`, `Df = 1`; `{1}` null | pinned; a.e. only | none |
| §4.4 (T2) | `ContMDiff I J 1 f` | representatives `C¹` on open `Ω_{x₀y₀}`, continuous hence `L^p_loc` for every `p` including `∞`; derivative `dψ ∘ mfderiv f ∘ d(φ⁻¹)` by the chain rule | member, `mfderiv f` a weak differential | none |
| §4.4 Checks | `t|t|`; `|t|`; Cantor | `f' = 2|t|` continuous, `f'' = 2 sign(t)` discontinuous; `Df = sign` a.e.; `C¹` off the closed null Cantor set, not a member (§1.2) | as stated | none |
| §4.5 (i), (ii), (iv) | open `U`; cover `(Uᵢ)`; `WithMetric` | restricted charts give restricted representatives (§1.2); `Ω_{x₀y₀}` covered by `φ(φ.source ∩ Uᵢ ∩ f⁻¹ψ.source)`, §1.3; same `ChartedSpace` instance | hold; total choices agree a.e. | none |
| **§4.5 (iii) "if"** | `y₀ ∈ N ∖ W` with `ψ_{y₀}.source ∩ f(M) ≠ ∅` | representative `(ψ_{y₀} ∘ ψ_y⁻¹) ∘ (ψ_y ∘ f ∘ φ⁻¹)`, `y ∈ W`: needs §2.4; §4.2's atlas `ℬ` must cover `N`, restricted charts of `W` do not | true, input missing from `*Needs:*` | **R01** |
| §4.5 Checks | circle map, cover `{(0,∞), (−∞,0)}`; `tanh` | `0` missed; `(tanh)' = 1 − tanh²` | as stated | none |
| §4.6 (a) | `θ(y) = 2y`, `f = |t|^{1/2}` | `2 Df(2y) = sign(y)|2y|^{−1/2}`; `(√2 |y|^{1/2})' = sign(y)|y|^{−1/2}/√2 = sign(y)(2|y|)^{−1/2}` | equal | none |
| §4.6 (a) route | charts `φ'`, `φ`, `ψ` | `ψ ∘ f ∘ θ ∘ φ'⁻¹ = (ψ ∘ f ∘ φ⁻¹) ∘ (φ ∘ θ ∘ φ'⁻¹)`, §2.2; exceptional set pulled back by §3.3 (i) | formula a.e. | none |
| §4.6 (b) | `g = (cos, sin)`, `f = |t|^{1/2}`; route | circle map, member iff `p < 2`; `(χ ∘ g ∘ ψ⁻¹) ∘ (ψ ∘ f ∘ φ⁻¹)`, §2.4 | holds, no bound | none |
| §4.6 negative control | `θ = (y₁, 0)`, `f = |x|^{1/2}` on `ℝ²` | `|Df| = |x|^{−1/2}/2 ∈ L^p_loc` iff `p < 4`; `|y₁|^{−1/2}/2 ∈ L^p_loc(ℝ²)` iff `p < 2` | for `2 ≤ p < 4` (a) fails | none |
| §5.2 (T3) ⇒ | compact `K'` of `M` | finitely many compact `K ⊆ φ.source ∩ f⁻¹ψ.source` cover `K'`; `‖Df‖ ≤ C ‖D rep ∘ φ‖` a.e. on `K`; §3.2 | `‖Df‖ ∈ L^p_loc` | none |
| §5.2 ⇐ | compact `K ⊆ Ω_{x₀y₀}` | `φ⁻¹K` compact in the overlap; `‖U‖ ≤ C ‖Df ∘ φ⁻¹‖` a.e.; §3.2; representatives continuous | member; `p = ∞` same | none |
| §5.2 Checks | `|t|^{1/2}`; `t log|t|`; Cantor | `|t|^{−1/2}/2`, `p < 2`; `log|t| + 1 ∈ L^p_loc` all finite `p`, unbounded; classical derivative `0` | class for finite `p` only; hypothesis used | none |
| §6.1 `J(id)` (F02) | `(o_V, o_W) = (+,+), (+,−)`; `n = 0` all four pairs | `1`, `−1`; `1, −1, −1, 1` | as restated | none |
| §6.1 basis and matrix formula | `b = (e₂, e₁)`, `A = diag(2,1)`; `b' = (e₂,e₁)` | `ω_V(b) = −1`, `ω_W(e₂, 2e₁) = −2`, product `2`; `[A] = [[0,1],[2,0]]`, `det −2`, signs `1 · (−1)`, `2` | `det A` | none |
| §6.1 `J > 0` iff | bijective `A`, `n ≥ 1`; `n = 0`, `A = 0` | `ω_W(A ∘ b) > 0` iff `A ∘ b` positively oriented iff `map A o_V = o_W`; map of the zero equivalence preserves the sign | agrees | none |
| §6.1 Hadamard equality | `A = λU`, `λ ≥ 0`; `n = 0` | `λⁿ = λⁿ`; `1 ≤ 1` | equality case right | none |
| §6.1 orthonormal Check | `id`, bases `(2e₁, e₂)`, `(e₁, e₂)` | `diag(2,1)`, `det 2`; `J(id) = 1` with one orientation | orthonormality used | none |
| §6.2 identity reversed | `(M, o) → (M, −o)` | `Df = id` off a null set (§4.4); `J_{(o,−o)}(id) = −1` | a.e. | none |
| §6.3 (T4) pointwise | point off the class, `n ≥ 1`; `n = 0` | `J(0) = 0 ≤ 0`; `1 ≤ 1` | everywhere | none |
| §6.3 exponent | `n = 0`; `p = ∞`; `1 ≤ p < n` | `p/0 = ∞`, `J = ±1 ∈ L^∞_loc`; `∞/n = ∞`; `|J|^{p/n} ≤ ‖Df‖^p ∈ L¹_loc` with `0 < p/n < 1` | holds; `L¹_loc` only for `p ≥ n` | none |
| §6.3 radial stretch | `x|x|^{−1/2}`, polar `r ↦ r^{1/2}` | singular values `r^{−1/2}`, `r^{−1/2}/2`; `J = (1/2)r^{−1/2} · r^{−1/2} = 1/(2r)`; `∫ r^{−p/2} r dr < ∞` iff `p < 4`; `∫ (2r)^{−q} r dr < ∞` iff `q < 2` | `q < 2 = p/n` at `p = 4` | none |
| §6.3 bump sum | `r_k = 2^{−k}`, `λ_k = 2^k/√k` | `|f| ≤ λ_k r_k = 1/√k → 0` (continuous); `Σ λ_k^p r_k² = Σ 2^{k(p−2)} k^{−p/2}` converges iff `p < 2`; inner half-discs: `J = λ_k²`, mass `π r_k² λ_k²/4 = π/(4k)`, `Σ = ∞`; `∫|J_f| ≥ Σ π/(4k)` whatever the sign on the annuli | `J_f ∉ L¹_loc` for `p < 2 = n` | none |
| §6.4 theorem route | Borel `A`, chart pair `(φ, ψ)`, `A' = A ∩` overlap | `∫_{A'} J_f dvol_M = ∫_{φA'} |det D rep| ρ_N(rep ·) dLeb` (`J > 0`, so `ε_M ε_N det = |det|`) `= ∫_{rep(φA')} ρ_N = vol_N(f(A'))` by `:1184` (injective on `φA'`); countable pairs (`M` Lindelöf, `f(φₖ.source)` Lindelöf); disjoint images by injectivity | holds; injectivity used twice | none |
| §6.4 Checks | `2x`; `−x`; `z²` on `1 < |z| < 2` | `μ⁺([0,1]) = 2 = vol([0,2])`; `μ⁺ = 0`, `μ⁻([0,1]) = 1`; `2π ∫_1^2 4r³ dr = 30π` vs `15π` | roles and multiplicity right | none |
| §7.1 (T6) chart | `Ω : Opens E` | preferred chart `(refl).subtypeRestr` extended by `𝓘(ℝ,E)` is `Subtype.val`, target `Ω`; `Ω_{x₀y₀} = Ω`, representative `f̃|_Ω` | iff as stated | none |
| §7.1 volume | flat metric, `Module.finBasis` | density `√det Gram(finBasis) =: κ` constant; `κ · finBasis.addHaar (parallelepiped finBasis) = κ = volume(parallelepiped)`, so `= volume` by `addHaar_eq_iff` | `riemannianVolume = volume` restricted | none |
| §7.1 orientation | `model o` on `E`, `restrict` to `Ω` | `orientationAt = o` at every point on both sides; §6.1 `o_V = o_W ⇒ J = det` | `J_f = det U` a.e. | none |
| §7.1 Checks | `id`; reflection; `z²`; radial stretch | `(id, 1, 1)`; `det diag(1,−1) = −1`; `det(2z·) = |2z|² = 4|z|² = |∂f|² − |∂̄f|²` with `∂̄f = 0`; `J = 1/(2r)` | agree with §6.1–§6.3 | none |
| §8.3 null-set invariance | `u` changed on an `IsNullSet` | `ι ∘ u` changed on `φ`-images that are Haar-null; §4.1 | unchanged | none |
| §8.3 source formulation | injective `ι`, `N ≠ ∅`, `v ∈ ι(N)` off null `Z` | `u = ι⁻¹ ∘ v` off `Z`, a fixed point on `Z`; `ι ∘ u = v` off `Z` | both directions | none |
| §8.3 hedgehog | `x/|x|` on `B³` | `D = (I − x̂x̂ᵀ)/|x|`, `|D|_HS = √2/|x|`; `4π ∫_0^1 r^{2−p} dr < ∞` iff `p < 3`; discontinuous at `0` | extrinsic class `[1, 3)`, continuous class never | none |
| §8.3 non-examples | `sign(x₁)` into `S⁰`; `L^p_loc`-only model | jump across `{x₁ = 0}` (§1.3); the wrong model accepts it | valid | none |
| T5 (§8.2) | circle, `ι` vs `2ι`; `ι(s) = s³`, `f = t^{1/3}` | `|D(ι ∘ f)| = |t|^{−1/2}/2 = ‖Df‖`, doubled by `2ι`; `Df = t^{−2/3}/3 ∈ L^p_loc` iff `p < 3/2` while `ι ∘ f = id` | isometry and immersion used | none |
| T7 (§8.4) | `ι₂(s) = (s, e^{e^s})`, `u = log log(1/|x|)` on `B(0, e^{−1})` | `∫|Du|² = 2π ∫_1^∞ dt/t² = 2π`; second coordinate `1/|x|`, `∫ r^{−2} r dr = ∞` | compactness used | none |
| T1 (§1.3) | `sign(x₁)`, two half-planes; empty index | `Du = 0` on each; a weak derivative on `ℝ²` would give `∫ U φ = 2 ∫_{x₁=0} φ`; `Ω = ∅` both sides | open cover of all `Ω` used | none |
| Conventions witnesses | direction; norm; volume; `J` sign | `1 · Df · 1/2 = 1/2 ⇒ Df = 1`; `‖Df‖ = 2` for `4 dt²`; square `1`, `4`; `J(diag(−1,1)) = −1`, `+1` to the negative | same values at every later occurrence (§4.3, §5.1, §3.1, §6.1, §6.2, §6.4, §7.1) | none |

**Convention witnesses recomputed across layers.** The direction of `Df` (Conventions, §4.1,
§4.3, §5.1, §6.2), the operator norm (Conventions, §5.1, §5.3, §7.1, §8.2), the volume
(Conventions, §3.1, §6.2, §6.4, §7.1) and the sign of `J` (Conventions, §6.1, §6.2, §6.4, §7.1)
give the same values at every occurrence; the circle map, the radial stretch and the hedgehog
agree in every section that uses them.

**Overlap facts.** No id this roadmap cites is dropped by an open pull request; no id it cites
is defined only by an open revision (R4.6 exists on main; its transfer content is at the head,
noted above for the package's merge-order paragraph); no other open pull request changes this
roadmap; no object with two owners after the F01 repair.

## Not verifiable

- Ziemer1989 Theorems 2.1.11 and 2.2.2 and Ch. 2 §2.1, Mazya2011 §1.1, Rickman1993 Ch. I §1,
  Lee2012 Ch. 4, 6, 15, 16: paywalled, settled as uncertified in `sources.toml`; cited by
  locator. The statements attributed to them are standard and agree with the reviewer's
  knowledge of the texts, but the pages were not opened.
- Bethuel1991: open content on Project Euclid, but the sources service received only a
  bot-protection page (recorded in the manifest); context for the Part II scope only.
- Elaboration of a Lean file: not available (this lane does not elaborate; the design stage has
  no `Suggested.lean`).
- Whether RiemannianGeometry's Lean statement of R4.6's transfer will be restricted to smooth
  metrics cannot be read from its text; the roadmap's conventions (smooth metrics) are what the
  Scope now records, and nothing here consumes it.

## Source issues

- **Misprint** in HeikkilaPankka2025 at Appendix B, proof of Proposition B.1, line 1328 (arXiv
  v2): the source writes the composite of the map `p : M → N` with the embedding `ι : N → ℝ^m`
  in the order `p ∘ ι`; it should be `ι ∘ p`, the only composable order; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ff45e4c1852cb79893ade5ed4a2966fc14c3a26e", "job": "REV-DESIGN-SobolevMapsBetweenManifolds~3", "model": "fable", "worker": "chris-x9"} -->
