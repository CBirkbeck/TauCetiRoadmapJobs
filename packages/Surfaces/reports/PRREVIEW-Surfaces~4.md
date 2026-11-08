# Review of Surfaces (pull request #1974 at b52bcd4)
Folder: `TauCetiRoadmap/RiemannianGeometry/Surfaces/`
**Verdict:** needs changes

There are eight findings. One is blocking: R01 (P1), a sign error in the common-arc corner law that PositiveMass §3.1 consumes. The other seven are P3. `Suggested.lean` elaborates with only the six `sorry` warnings. The order-aware dependency check reports no problem.

## R01 (P1) — The common-arc corner law has the wrong sign

- **Location:** `TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md` lines 498–500: "at a point where the common arc meets the outer boundary, the two exterior angles sum to the exterior angle of the union minus π."
- **Claim:** the law is false; the correct sum is the union's exterior angle **plus** π.
  - At the meeting point the interior angles add, `β = β₁ + β₂`, and `αᵢ = π − βᵢ`. So `α₁ + α₂ = 2π − β = α + π`.
  - This bullet is the endpoint-angle half of the cancellation that PositiveMass §3.1 consumes (its README at the head of #956, lines 47–50 and 148–155).
  - The Conventions route for reflex corners (lines 85–86) also uses it.
- **Witness:**
  - Split `[0,2] × [0,1]` along `x = 1`. At `(1,0)` each unit square has `α = π/2`, and the rectangle has no corner (`α = 0`). The sum is `π`; the README gives `0 − π = −π`.
  - The layer's own annulus example (lines 520–524) needs `+π`. With `+π`, the four meeting points carry `4π` and `2·2π − 4π = 0`. With `−π` the same accounting gives `8π`.
- **Repair:**
  - Replace the clause with: "the interior angles add, so the two exterior angles sum to the exterior angle of the union plus π".
  - Add the split rectangle as a Check: `π/2 + π/2 = 0 + π`.
  - Tested on the rectangle (`π = π`) and on the annulus (`0`).

## R02 (P3) — ConformalMapping L5 is cited for the Jordan index theorem, which it does not state

- **Location:**
  - README lines 182–183: "L5: the planar Jordan curve theorem with the index `±1` on the bounded complementary component".
  - Lines 545–546, in the 4.1 route: "By ConformalMapping L5, ĉ has exactly two complementary components, its index is `±1` on the bounded one".
  - Line 531: "ConformalMapping L5 for the Jordan orientation".
- **Claim:**
  - On main, L5 (`Completed/ConformalMapping/README.md` lines 133–144) states only these facts:
    - two complementary components;
    - the inside is open, bounded and connected, with frontier C;
    - the filled-hull API;
    - the Carathéodory extension.
  - It states no index value.
  - The Jordan index theorem on main belongs to GeometricMeasureTheory G6, which this roadmap already uses for G1 and G2. The revision of ConformalMapping at #998 is a revision, so it cannot be a supplier.
  - The previous review's repair R07 pointed at L5 for this fact. That pointer was wrong.
- **Witness:**
  - `TauCetiRoadmap/GeometricMeasureTheory/README.md` lines 291–294 (main): for a rectifiable Jordan curve, the existing winding number equals `σ ∈ {−1, 1}` on the inside and 0 outside.
  - Pinned alternative: `TauCeti.hasContinuousLogOn_sub_iff_notMem_filledHull` (`TauCeti/Analysis/Complex/PlaneSeparation/Basic.lean:415`). For closed bounded K, `z ↦ z − a` has a continuous logarithm on K exactly when `a ∉ filledHull K`.
- **Repair:** take one of these routes.
  - Cite G6 for the index:
    - Add G6 to the GeometricMeasureTheory contract (lines 177–178) and to 4.1's *Needs*.
    - Keep L5 for separation and the closed-disc correspondence.
    - On line 531, write "for the Jordan separation" and cite G6 or R4.9.6a for the orientation.
  - Or route 4.1 through the pinned Borsuk criterion, which needs no index value:
    - For `a ∉ Ω`, the loop ĉ is null-homotopic in `ℂ ∖ {a}`.
    - So `z ↦ z − a` has a continuous logarithm on the trace, and hence `a ∉ filledHull ĉ`.
    - Tested on the annulus-chart control of line 554: the core circle has index 1 at the hole, so it has no logarithm there, and the hole lies in its filled hull. That is why the hypothesis on B is needed.

## R03 (P3) — 4.1 can be stated at the pins, but the module docstring says it cannot

- **Location:** `Suggested.lean` lines 30–31: "Layer 4.1, disk filling in a chart: an embedded compact disk with piecewise smooth boundary in a surface."
- **Claim:**
  - The conclusion of 4.1 needs only a compact set that is homeomorphic to the closed disk and has the curve's trace as its frontier. Every carrier for that is native.
  - The boundary regularity "of Layer 3" is the regularity of `c`, which is a hypothesis, not a missing carrier.
  - The Summary (lines 3–7) does not list disk filling among the headlines.
- **Witness:** the statement below, appended to a scratch copy of `Suggested.lean`, elaborates at the pins under `lake env lean` with only the `sorry` warning.

  ```lean
  variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    {M : Type*} [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]

  theorem exists_disk_of_simpleClosedCurve (hE : Module.finrank ℝ E = 2) {B : Set M}
      (hB : IsOpen B) (hsc : SimplyConnectedSpace B)
      (hchart : ∃ e ∈ IsManifold.maximalAtlas I ∞ M, B ⊆ e.source)
      (c : ℝ → M) {L : ℝ} (hL : 0 < L) (hper : Function.Periodic c L) (hcont : Continuous c)
      (hinj : InjOn c (Ico 0 L)) (hcB : range c ⊆ B) :
      ∃ D ⊆ B, IsCompact D ∧ frontier D = range c ∧
        Nonempty (D ≃ₜ Metric.closedBall (0 : ℂ) 1) := by
    sorry
  ```

- **Repair:** do one of the following.
  - State it, as above. Name it at README 4.1, and widen 4.1 to every simple closed curve in B, with Layer 3's corner regularity whenever c has it. The proof route (chart, L5, closed-disc correspondence) uses no regularity.
  - Or delete the 4.1 bullet from the docstring's list, since 4.1 is a step towards 4.2 rather than a headline.

## R04 (P3) — One Check value is wrong, and one negative control does not isolate its hypothesis

- **(a) Location:** line 335, "integrated, `2π(sin r − r) = −2π ∫₀ʳ (t − sin t) dt`".
  - **Witness:** at `r = 1` the left side is −0.9961 and the right side is −0.2532.
  - The right side belongs to the area identity of the 1.4 API: `V − πr² = 2π(1 − cos r) − πr²`, which is −0.2532 at `r = 1`. It does not belong to the length identity.
  - **Repair:**
    - Write `2π(sin r − r) = −2π ∫₀ʳ (1 − cos t) dt`. At `r = 1` the right side is `−2π(1 − sin 1) = −0.9961`.
    - Add the area identity `2π(1 − cos r) − πr² = −2π ∫₀ʳ (t − sin t) dt` as its own Check.
- **(b) Location:** lines 609–610. The punctured-plane control for compactness of the closed ball also fails simple connectivity, as the text admits. So it does not show that compactness is needed.
  - **Repair:** use the slit plane `M = ℝ² ∖ {(x, 0) : x ≥ 1}`, with `p = 0` and `R = 2`.
    - The open ball is the disk minus `[1,2) × {0}`. It is star-shaped about 0, so simply connected, and planar, so it lies in one chart. `K = 0`.
    - The closed ball is not compact.
    - The geodesic in direction `(1,0)` stops at `t = 1`, so `B(0,2) ⊄ expDomain` and the conclusion fails. Only the compactness hypothesis fails.

## R05 (P3) — Lee–Parker p. 42 does not state the conformal density law

- **Location:**
  - Lines 633–634: "the coordinate density `dμ_(fg) = f^(N/2) dμ_g` is Lee and Parker, *The Yamabe problem*, p. 42".
  - Lines 715–716: "p. 42: the coordinate density of a conformally changed metric".
- **Claim:** p. 42 gives only the coordinate expression of the Riemannian density of a single metric. This is the previous R07, partly repaired.
- **Witness:**
  - LeeParker1987 line 239 (printed p. 42) gives `dV_g = (det g)^(1/2)|dx|` and nothing about `fg`.
  - The conformal laws on p. 43 (lines 284–288) concern the Ricci and scalar curvature only.
- **Repair:**
  - Write "the coordinate density `dV_g = (det g)^(1/2) |dx|` is Lee and Parker p. 42. Since `det(fg) = f^N det g`, it gives `dμ_(fg) = f^(N/2) dμ_g`, which is the pinned `integral_riemannianVolume_rescale`."
  - In References, write "p. 42: the coordinate expression of the Riemannian density".

## R06 (P3) — 5.2 cites DifferentialGeometry 12.4 for a change of variables that it does not state and that is pinned

- **Location:** lines 651–653 ("the change of variables for diffeomorphisms of the Riemannian volume") and line 673 (*Needs:* "…; DifferentialGeometry 12.4").
- **Claim:**
  - DifferentialGeometry 12.4 (main, line 923) is the bridge between densities and measures. It states no change of variables under diffeomorphisms.
  - The fact is pinned. Its two manifolds must share the model vector space, whereas 5.2 models N on `E'`.
  - The transport of the gradient is DifferentialGeometry 12.2's chain rule (line 918).
- **Witness:**
  - `Homeomorph.measurePreserving_riemannianVolume` (`TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Isometry.lean:173`) says that a differentiable homeomorphism whose tangent maps preserve the inner products preserves the Riemannian volume.
  - `RiemannianIsometry.measurePreserving_riemannianVolume` (`:215`) is the same fact for isometries.
  - The module docstring says that the two models share E.
- **Repair:**
  - Name the pinned lemma in 5.2's route, in its *Needs* and in the Tau Ceti contract (lines 148–153).
  - Either model N on the same E (both have finrank 2) or add the transport along a linear isomorphism `E ≃ E'` to the route.
  - Replace "DifferentialGeometry 12.4" with "DifferentialGeometry 12.2 (chain rule for `mgradient`)".

## R07 (P3) — The scope says annuli are not restated here, but 3.2's API restates the nested-disk annulus

- **Location:**
  - Line 52: "Annuli are the case `χ = 0` of that theorem and are not restated here."
  - Lines 501–502: "the disk-difference laws for these domains, the last giving the annulus between two nested disks".
- **Claim:** the difference of two nested disks is an annulus. So the API bullet owns a formula that the scope gives to PositiveMass §3.1 (`χ = 0`), whose round-sphere case R4.9.6a also owns.
- **Repair:** delete "and disk-difference laws … two nested disks" from the bullet, keeping the restriction and orientation-reversal laws. The annulus example at lines 520–524 then remains a Check against PositiveMass, as its text says.

## R08 (P3) — The parent's dependency paragraph omits R3

- **Location:** `TauCetiRoadmap/RiemannianGeometry/README.md` lines 1510–1512: "The Surfaces sub-roadmap uses HopfRinow, R1, R2, R4.2, R4.9.6a's signed planar turning theorem and R6".
- **Witness:**
  - Surfaces lines 40–41 (R3 owns the loss of minimality past a conjugate point).
  - Lines 207 and 241: 1.1's route and *Needs* use R3.
  - Line 690 lists R3 among the suppliers.
- **Repair:** add R3 to the parent's list.

## Verified sound

### The previous review's findings (at 2cd64ea)

| Id | Status at b52bcd4 | Evidence |
|---|---|---|
| R01 | Repaired | `Suggested.lean` lines 139–140 add `hk : IntervalIntegrable …`. Lines 145–146 parenthesise the integral before `+ ∑ s ∈ T, …`, and the elaborated type shows the parentheses. Unit square: `0 + 4·arg(i) = 2π`. |
| R02 | Not raised again; the stated reason holds | 4.1 is now an owned target (lines 536–549), with a route and *Needs*. `hchart` ranges over `IsManifold.maximalAtlas` (line 175). The curvature-sign control is now an oblate spheroid that satisfies every other hypothesis (lines 602–608). Lines 53–61 give the reason for keeping the chart: the general case needs disk filling on arbitrary surfaces (Epstein). The only roadmap that plans it is PlanarTopology/SurfaceTopology (#271 head, README lines 43, 64–65, 1234), which this roadmap may not cite. Owning it here would duplicate that plan. The flat cylinder control (lines 599–601) now isolates simple connectivity, because the ball is a planar annulus and so lies in one chart. |
| R03 | Repaired | Conventions lines 68–71 make the ambient surface boundaryless. The contracts record it (lines 114–116 and 166). `[I.Boundaryless]` is at `Suggested.lean` lines 49 and 157, and `hint` is gone. |
| R04 | Repaired | `normalStrip_jacobian` (lines 81–98) is stated with `alongCurveWithin` and `curveVelocityWithin`. The docstring bullet for 3.2 names the disk-domain carrier (lines 28–29). |
| R05 | Repaired | The point (1/2, 2) appears at lines 300–301 and (2, 1) at 302–304. The 135° corner with area `πR²/8` is at lines 423–427. The two radial cuts are at lines 520–524. |
| R06 | Repaired | API and Checks lists now appear in 1.1, 1.2, 1.4, 2.1, 3.1 and 5.2. The ω convention and its sphere witness are at lines 89–98. Lean names are given at the targets. The docstring is titled "target signatures", with layer comments in order 1, 1, 1, 3, 4, 5, 5. There is one contract subsection per supplier (lines 158–185). |
| R07 | Partly | Page ranges have been added. 5.6.3 is now used only for the Green identity (lines 86–87). The gradient law is cited to `inner_mgradient_rescale` (line 627). What remains is R05 (Lee–Parker), together with the L5 misattribution that the previous repair introduced (R02). |
| R08 | Repaired, apart from R08 | 1.1 is stated with the Lean hypotheses (lines 204–206). R1 has been added to 3.2's *Needs* (line 516) and to the parent paragraph. R3 is missing from the parent paragraph (R08 above). |

### Gate and dependency check

- **The worker's gate on b52bcd4** (`scratch/gate.md`) passes every check, including the build.
- **My rerun** of the brief's gate command prints `depcheck: NOT IN ORDER: Surfaces` and `outside-folder: TauCetiRoadmap/RiemannianGeometry/README.md`. I treat both as false positives:
  - The first comes from the default order. The candidate order lists Surfaces at line 397.
  - The second is the family index, which this pull request owns.
- **Order-aware dependency check:** `depcheck: 239 roadmaps, 2353 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Scope of the diff:** `git diff --stat origin/main...HEAD` touches only the parent README and this folder.

### Lean audit

- **Elaboration.** `lake env lean` on `Suggested.lean` gives exactly six `declaration uses 'sorry'` warnings (lines 60, 81, 106, 134, 169 and 218) and nothing else.
- **Signatures.** I compared the elaborated types of all 7 declarations (`#check @`, in `scratch/signatures.md`) with the README:
  - No binder is lost. Layers 1 and 4 keep `[I.Boundaryless]`, and 1.4 keeps its measure instances.
  - In 1.1 and 1.4, `hbij` and `hcpt` are not needed for the conclusions; `hdist` already excludes conjugate points. This is a note, not a finding, because the README states the same hypotheses.
  - Layer 5 omits `[I.Boundaryless]`. That is more general than the Conventions, and still true, since Layer 5 uses no exponential map.
- **One-tactic probe.**
  - `simp` in place of each `sorry` leaves unsolved goals in five theorems and makes no progress on 5.2.
  - `intros; constructor <;> (try intros) <;> rfl` fails on all six.
  - The proved 5.1 takes five steps from two pinned lemmas.
  - So nothing in the file is padding.
- **Probe of 4.1.** The statement in R03 elaborates.
- **Name clashes.** None of the 7 names occurs in another roadmap's Lean on main or at any open head (`roadmaps grep --lean-only`), nor in Tau Ceti.
- **3.1's orientation hypothesis.** `TauCeti.Contour.windingNumber` (`Analysis/Contour/Winding/Number/Basic.lean:76`) is the principal-value winding number. On a positively oriented Jordan curve it equals 1 inside, 1/2 at smooth points and `β/2π < 1` at a corner. So `hz` holds only at inside points of a positively oriented curve; a clockwise curve gives −1, −1/2 or 0.

### Library declarations opened at the pins (31)

- **Tau Ceti, `Geometry/Manifold/Riemannian/`:**
  - `Geodesic/`: `expDomain` and `riemannianExp` (`Exponential.lean:98`, `:104`), `inner_mfderiv_riemannianExp_radial` (`Gauss/Basic.lean:127`), `eventually_notMem_nhdsLT_maximalGeodesic` (`Escape.lean:82`), `exists_riemannianExp_eq_and_norm_eq_dist` (`Minimizing.lean:144`, which needs `expDomain = univ`).
  - `Jacobi/`: `isJacobiFieldOn_mfderiv_riemannianExp` (`Exponential.lean:91`), `not_isConjugateOn_of_sectionalCurvature_nonpos` (`Conjugate.lean:222`), `norm_le_norm_mfderiv_riemannianExp_of_sectionalCurvature_nonpos` (`Comparison.lean:50`), `IsJacobiFieldOn.forall_inner_curveVelocityWithin_eq_zero_iff` (`Tangential.lean:182`), `IsJacobiFieldOn.norm_eq_abs_curvatureSine_mul_norm` (`Model.lean:118`).
  - Conformal geometry and volume: `inner_mgradient_rescale` (`Conformal.lean:102`), `integral_riemannianVolume_rescale` (`VolumeDensity/Conformal.lean:142`), `riemannianVolume` (`VolumeDensity/Volume.lean:82`), `Homeomorph.measurePreserving_riemannianVolume` and `RiemannianIsometry.measurePreserving_riemannianVolume` (`VolumeDensity/Isometry.lean:173`, `:215`), `WithMetric` (`WithMetric.lean:68`), `ContMDiffRiemannianMetric.pullback` (`Pullback/Basic.lean:158`).
  - `TotalCurvature.lean` (closed-surface total curvature, a different object).
- **Tau Ceti, `Geometry/Manifold/` outside `Riemannian/`:** `rescale` and `conformalClass` (`VectorBundle/Riemannian/Conformal.lean:87`), `sectionalCurvature` (`VectorBundle/CovariantDerivative/Curvature/Sectional.lean:77`), `alongCurveWithin` (`…/AlongCurve/Basic.lean:127`), `curveVelocityWithin` (`MFDeriv/Curve.lean:135`), `normalExp`, `normalExpDomain`, `isOpen_normalExpDomain`, `contMDiffOn_normalExp` and `exists_partialDiffeomorph_normalExp_subset` (`TubularNeighborhood/Riemannian/`).
- **Tau Ceti, other directories:** `windingNumber` (`Analysis/Contour/Winding/Number/Basic.lean:76`), `hasContinuousLogOn_sub_iff_notMem_filledHull` (`Analysis/Complex/PlaneSeparation/Basic.lean:415`), `IsJordanCurve` (`Topology/JordanCurve/Basic.lean:107`), `filledHull` (`Topology/FilledHull.lean:99`), `CompactConvexPolygon.volume_carrier` (`Analysis/Complex/UpperHalfPlane/Polygon/GaussBonnet.lean:524`).
- **Mathlib:** `LipschitzWith.ae_differentiableAt` (`Analysis/Calculus/Rademacher.lean:386`).

### Cross-roadmap citations resolved (24)

- **RiemannianGeometry at this head:**
  - Sections: R1 (186), R2 (322), R3 (369), R4 (629), R4.2's moving endpoint (686), R4.9.6a (886, with the turning paragraph at 898), R6 (1251).
  - Anchors: all four resolve here, and also at the heads of #1327 and #1683.
- **DifferentialGeometry on main:** 5.3 (518), 5.5 (528), 5.6.3 (708), 10.2 (884), 12.2 (918), 12.4 (923), 12.5 (930).
- **GeometricMeasureTheory on main:** G1 (106), G2 (148), G6 (275; the index theorem at 291–294).
- **ConformalMapping on main:** L3 (119), L5 (133–144).
- **HopfRinow on main:**
  - Layers 0–4 (229, 264, 427, 451, 495).
  - The escape lemmas (385–388) are the "compact continuation" of 4.2.
- **Open heads:** PositiveMass at #956 (47–50, 148–155, 723–733), PlanarTopology/SurfaceTopology at #271, Isoperimetry I6 on main (397).

### Ownership

I searched by object with `roadmaps grep`, on main and at all 466 open heads.

- **Smooth signed turning theorem:** owned only by R4.9.6a (main 868, #1327 1440, #1683 1540).
- **Gauss–Bonnet with corners:** consumed only by PositiveMass §3.1. Its conventions match this roadmap's (inward conormal, `αᵢ = π − βᵢ`, outward-first orientation equivalent to the domain on the left). The pinned `CompactConvexPolygon.volume_carrier` is the special case of convex hyperbolic polygons; it agrees with 3.2 (table below).
- **Conformal invariance of energy:** HeegaardFloer 4.6c (main 2961) states it for maps from closed surfaces into a symplectic target. CanonicalModelsAndGonality §8.3 (#1726 1770) has it as an API remark. Neither owns the scalar surface identity.
- **Merge order:** PositiveMass (line 285 of the candidate order) cites Surfaces (line 397). That is PositiveMass's upward edge, and the pull-request description orders the two.

### Adversarial table

| Statement | Instances | Computed values (left / right) | Result | Change |
|---|---|---|---|---|
| 1.1 `polar_jacobian_ode` | ℝ²; unit sphere, R ≤ π; ℍ²; `j = r` on the sphere; sphere with R = 4 | `0 + 0 = 0`, `j(0) = 0`, `j′(0⁺) = 1`; `−sin r + sin r = 0`; `sinh r − sinh r = 0`; `0 + r ≠ 0`; for `|v| = 4`, `d = 2π − 4 = 2.28 ≠ 4`, so `hdist` fails | holds | none |
| 1.2 `normalStrip_jacobian` | plane circle of radius ρ, inward and outward normal; latitude φ₀ = π/3; equator; line | `a = 1 − t/ρ`, `a_t(0) = −1/ρ = −k_g`; `a = 1 + t/ρ`, `a_t(0) = 1/ρ = −(−1/ρ)`; `a = sin(π/3 − t)/sin(π/3)`, `a_t(0) = −0.577 = −cot(π/3)`; `cos t` with `a_tt + a = 0`; `a ≡ 1`, `k_g = 0` | holds | none |
| 1.2 API, L′ and area | latitude circle; plane sector of angle θ | `L′ = −2π cos(φ₀ − t)` on both sides; `θρt − θt²/2 = ρθ(t − t²/(2ρ))` | holds | none |
| 1.3 | segment `[0,1]`; points (1/2, 2) and (2, 1) | `(0,−2)·(1,0) = 0`; `(−1,−1)·(1,0) = −1`, an endpoint foot | holds | none |
| 1.4 `hasDerivAt_polarLength_and_volume_ball` | ℝ²; S²; ℍ² | `2π = 2π − 0` and `V′ = 2πr = L`; `2π cos r = 2π − 2π(1 − cos r)`; `2π cosh r = 2π + 2π(cosh r − 1)` | holds | none |
| 1.4 integrated sphere Check | r = 1 | `L − 2π = −0.9961`; README right side `−0.2532`; corrected `−2π(1 − sin 1) = −0.9961`; `V − π = −0.2532` | Check false | R04 |
| 2.1 cut time | disk; rectangle; hemisphere | `c ≡ ρ`; `c ≡ b`; `c ≡ π/2` | holds | none |
| 2.2 integration formula | disk with R > ρ and R < ρ; rectangle; hemisphere | `πρ² = 2πρ·ρ/2`; `2πρR − πR²` on both sides; `aR = aR`; `2π sin R = ∫₀^(2π)∫₀^R cos t` | holds | none |
| Layer 2 trapezoid control | base `[0,4]`, side to (−1,1), R ≤ 1 | interior angle 135°; the missed sector `(π/4)·R²/2 = πR²/8` | holds | none |
| 3.1 (README) | circle ccw and cw; square; L-shape; figure eight | `2π`, deg 1; `−2π`, excluded; `0 + 2π`; `5π/2 − π/2 = 2π`; turning 0, not Jordan | holds | none |
| 3.1 Lean `integral_signedCurvature_add_sum_exteriorAngle_eq_two_pi` | unit circle, T = ∅; square; reflex corner; cw circle; z on the curve | `∫₀^(2π) Im(i) = 2π`; `0 + 4·(π/2)`; `arg(1/i) = −π/2`; winding −1, −1/2 or 0, so `hz` fails; `β/2π < 1`, so `hz` fails | holds | none |
| 3.2 Gauss–Bonnet | unit disk; hemisphere; octant; lune of angle β; outward conormal; cap φ₀ | `0 + 2π + 0`; `2π + 0 + 0`; `π/2 + 0 + 3π/2`; `2β + 0 + 2(π − β)`; `−2π ≠ 2π`; `2π(1 − cos φ₀) + 2π sin φ₀ cot φ₀ = 2π` | holds | none |
| 3.2 API, common-arc law | `[0,2]×[0,1]` split at x = 1; annulus halves | `α₁ + α₂ = π`; README `0 − π = −π`; corrected `0 + π`; annulus `2·2π − 4π = 0` with `+π`, `8π` with `−π` | **false** | R01 |
| ω convention | unit sphere, cap boundary | `ω = cos φ dψ`, `dω = −sin φ dφ∧dψ = −K dA`; `k_g = ω(e₂) = cot φ₀`; the opposite sign gives `−cot φ₀` | holds | none |
| 3.2 against the pin | hyperbolic triangle with angles a, b, c | 3.2 gives `−A + 3π − (a+b+c) = 2π`, so `A = π − Σ`; `volume_carrier` gives `(3 − 2)π − Σ` | agree | none |
| 4.1 disk filling | circle in the disk chart; annulus core circle; probe statement | bounds a disk; index 1 at the hole outside Ω, excluded by `hsc`; elaborates | holds; docstring wrong | R02, R03 |
| 4.2 Lean `riemannianExp_bijOn_ball_of_curvature_nonpos` | ℝ² and ℍ²; flat cylinder, R = 4; oblate spheroid; slit plane, R = 2; punctured plane | bijective; only `hsc` fails, `exp(0,π) = exp(0,−π)`; only the curvature sign fails (two minimizers to equator points near q); only `hcpt` fails, exp undefined at (1.5, 0); `hsc` and `hcpt` both fail | holds | R04(b) |
| 4.2 bigon and loop | lune of angle β; hemisphere as a loop | `∫K = 2β = β + β`; `2π = π + π` | holds | none |
| 5.1 `integral_norm_mgradient_sq_rescale` (proved) | ℝ² with `f = e^(2x)`; `f = 4`; ℝ³ | `e^(2x)·e^(−2x) = 1`; `4·4⁻¹ = 1`; `e^(3x)·e^(−2x) = e^x`, excluded by `hE` | holds | none |
| 5.2 `integral_norm_mgradient_sq_comp_eq_of_pullback_eq_rescale` | `F(z) = 2z`; `F(z) = z̄` | `∫ 4|∇φ(2z)|² dx dy = ∫ |∇φ|² dw`; `f = 1`, equal energies | holds | R06 (citation) |
| Parent R1, item 5 | S²; Euclidean metric | `K(g_j) = λ⁻²K`; `λ²·λ⁻² g_euc = g_euc` | holds | none |
| Parent R4.1, Riccati | ℝ²; S² | `−t⁻² + t⁻² = 0`; `−csc² t + cot² t + 1 = 0`; transverse `2r cot r > 0` iff `r < π/2` | holds | none |

## Not verifiable

I checked the sampled targets 1.1–5.2 by computation (table above). Except for Lee–Parker, I could not check their locators against a legal text:

- **Lee, *Introduction to Riemannian Manifolds*, 2nd ed.** Theorems 6.9 and 12.8 and the page ranges given for 1.1–1.3, 2.1, 3.1, 3.2, 4.1, 4.2, 5.1 and 5.2. The sources service resolved DOI 10.1007/978-3-319-91755-9 only to a paywalled page.
- **do Carmo, *Differential Geometry of Curves and Surfaces* (1976).** §§4-5, 4-6 and 5-7 (1.1, 1.4, 3.1, 3.2). The service found no legal source.
- **do Carmo, *Riemannian Geometry* (1992).** Chapter 7, Theorem 3.1 and Lemma 3.3 (4.2). DOI 10.1007/978-1-4757-2201-7 is paywalled.
- **Chavel, 2nd ed. (2006).** §§III.1, III.2 and III.6 (1.2, 1.4, 2.1, 2.2). DOI 10.1017/CBO9780511616822 resolves only to the Cambridge landing page, with no legal copy.
- **Epstein (1966), Theorem 1.7.** DOI 10.1007/BF02392203 is paywalled. It is cited only for the reduction that Layer 4 does not use.

Lee and Parker (1987) was read from the AMS open archive at its locator; see R05.

## Source issues

- none
