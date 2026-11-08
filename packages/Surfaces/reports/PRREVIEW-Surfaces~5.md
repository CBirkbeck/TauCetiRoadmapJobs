# Review of Surfaces (pull request #1974 at c30b6b2)
Folder: `TauCetiRoadmap/RiemannianGeometry/Surfaces/`
**Verdict:** needs changes

There are five findings. R01 (P2) blocks: Gauss–Bonnet for disks with corners (3.2) is statable at the pins, but `Suggested.lean` lists it as not statable. The other four are P3. All eight findings of the previous review are repaired. `Suggested.lean` elaborates with only its seven `sorry` warnings. The order-aware dependency check reports no problem.

## R01 (P2) — Gauss–Bonnet for disks with corners can be stated at the pins, but the docstring says it cannot

- **Location:** `TauCetiRoadmap/RiemannianGeometry/Surfaces/Suggested.lean` lines 28–29: "Layer 3.2, Gauss–Bonnet for a disk with corners: a compact disk domain in a surface with a piecewise smooth boundary parametrization and its corners."
- **Claim:** every carrier the docstring names now exists in this very file.
  - `exists_disk_of_simpleClosedCurve` (lines 161–167) states a compact disk with a boundary parametrization: `IsCompact D`, `frontier D = range c`, `D ≃ₜ closedBall 0 1`.
  - 3.1 (lines 134–141) encodes the corners as a `Finset` of parameters with one-sided derivatives.
  - The pins supply the rest:
    - Tau Ceti's `TauCeti.Manifold.Orientation.orientationAt` (`TauCeti/Geometry/Manifold/Orientation/Basic.lean:140`) orients every tangent plane.
    - Mathlib's `Orientation.rightAngleRotation` (`Mathlib/Analysis/InnerProductSpace/TwoDim.lean:230`) gives the inward conormal `J c′` of a boundary that has D on its left.
    - Mathlib's `Orientation.oangle` (`Mathlib/Geometry/Euclidean/Angle/Oriented/Basic.lean:55`) gives the signed exterior angle `αᵢ`.
  - 3.2 is the title theorem of Layer 3 and the supplier of PositiveMass §3.1, so it is a headline.
- **Witness:** the statement below, inserted into a scratch copy of `Suggested.lean` together with one import, elaborates under `lake env lean`. The output is eight `sorry` warnings and nothing else.
  - Unit disk with the standard orientation: `J c′ = −(cos t, sin t)` points inward and `⟪D_t c′, J c′⟫ = 1`, so the sum is `0 + 2π + 0 = 2π`.
  - Unit square: `oangle(1, i) = π/2` at each of the four corners, so the sum is `0 + 0 + 2π = 2π`.
- **Repair:**
  - Add `import TauCeti.Geometry.Manifold.Orientation.Basic`.
  - Insert this section after `end Planar`.
  - Delete the 3.2 bullet from the module docstring.
  - In README 3.2, add "Lean name: `integral_curvature_add_integral_geodesicCurvature_add_sum_exteriorAngle_eq_two_pi`".
  - In the contracts, add `TauCeti.Manifold.Orientation` and `orientationAt` (Tau Ceti), and `Orientation.rightAngleRotation` and `Orientation.oangle` (Mathlib).
  - Tested: the copy elaborates, and the two instances above give `2π` on both sides.

  ```lean
  section DiskGaussBonnet

  variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    {M : Type*} [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    [IsRiemannianManifold I M] [MeasurableSpace M] [BorelSpace M] [LindelofSpace M]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]

  open TauCeti TauCeti.Manifold CovariantDerivative Filter Topology

  /-- Layer 3.2: Gauss–Bonnet for a compact disk `D` in an oriented surface whose boundary is a
  piecewise `C²` unit-speed Jordan curve `c` with corners at `T`, with `D` on its left: `k_g` is
  taken against `J c′`, `J` the rotation by `+π/2`, and the exterior angles are oriented angles. -/
  theorem integral_curvature_add_integral_geodesicCurvature_add_sum_exteriorAngle_eq_two_pi
      (o : TauCeti.Manifold.Orientation I M (Fin 2)) (K : M → ℝ)
      (hK : ∀ x (u v : TangentSpace I x), LinearIndependent ℝ ![u, v] →
        (leviCivitaConnection I M).sectionalCurvature
          (isMetricCompatible_leviCivitaConnection I) x u v = K x)
      {D : Set M} (hD : IsCompact D) (hdisk : Nonempty (D ≃ₜ Metric.closedBall (0 : ℂ) 1))
      (c : ℝ → M) {L : ℝ} (hL : 0 < L) (hper : Function.Periodic c L) (hcont : Continuous c)
      (hinj : InjOn c (Ico 0 L)) (hfr : frontier D = range c)
      (T : Finset ℝ) (hT : (T : Set ℝ) ⊆ Ico 0 L)
      (hc : ContMDiffOn 𝓘(ℝ) I 2 c {t | ∀ s ∈ T, ∀ k : ℤ, t ≠ s + k * L})
      (hunit : ∀ t, (∀ s ∈ T, ∀ k : ℤ, t ≠ s + k * L) → ‖curveVelocityWithin I c univ t‖ = 1)
      (hleft : ∀ s ∈ T, MDifferentiableWithinAt 𝓘(ℝ) I c (Iic s) s ∧
        ‖curveVelocityWithin I c (Iic s) s‖ = 1)
      (hright : ∀ s ∈ T, MDifferentiableWithinAt 𝓘(ℝ) I c (Ici s) s ∧
        ‖curveVelocityWithin I c (Ici s) s‖ = 1)
      (hcusp : ∀ s ∈ T, curveVelocityWithin I c (Ici s) s ≠ -curveVelocityWithin I c (Iic s) s)
      (hin : ∀ t, (∀ s ∈ T, ∀ k : ℤ, t ≠ s + k * L) →
        haveI := o.fact_finrank_tangentSpace (c t)
        ∀ᶠ ε in 𝓝[>] (0 : ℝ), riemannianExp I M (c t)
          (ε • (o.orientationAt (c t)).rightAngleRotation (curveVelocityWithin I c univ t)) ∈
            interior D)
      (hk : IntervalIntegrable (fun t ↦ haveI := o.fact_finrank_tangentSpace (c t)
        inner ℝ (alongCurveWithin (leviCivitaConnection I M) c (curveVelocityWithin I c univ) univ t)
          ((o.orientationAt (c t)).rightAngleRotation (curveVelocityWithin I c univ t))) volume 0 L) :
      (∫ x in D, K x ∂riemannianVolume I M) +
        (∫ t in (0)..L, haveI := o.fact_finrank_tangentSpace (c t)
          inner ℝ (alongCurveWithin (leviCivitaConnection I M) c (curveVelocityWithin I c univ) univ t)
            ((o.orientationAt (c t)).rightAngleRotation (curveVelocityWithin I c univ t))) +
        ∑ s ∈ T, (haveI := o.fact_finrank_tangentSpace (c s)
          ((o.orientationAt (c s)).oangle (curveVelocityWithin I c (Iic s) s)
            (curveVelocityWithin I c (Ici s) s)).toReal) = 2 * Real.pi := by
    sorry

  end DiskGaussBonnet
  ```

## R02 (P3) — A 4.1 Check uses a geodesic bigon in the Poincaré disk, and no such bigon exists

- **Location:** `README.md` line 585: "A geodesic bigon in the Poincaré disk bounds the hyperbolic lune between its sides."
- **Claim:**
  - In the hyperbolic plane two distinct geodesics meet at most once, so there is no geodesic bigon to fill.
  - The roadmap's own 4.2 route (lines 604–611) excludes bigons on every such ball, because K = −1.
  - So the Check is false as an existence claim and tests nothing about 4.1.
- **Witness:** apply 3.2 to a hypothetical bigon with interior angles β₁ and β₂ and `K = −1`. It gives `−A + (π − β₁) + (π − β₂) = 2π`, so `A = −(β₁ + β₂) < 0`.
- **Repair:** replace the Check with "A geodesic triangle in the Poincaré disk bounds the solid hyperbolic triangle, whose area is `π − (β₁ + β₂ + β₃)` by 3.2."
  - Tested with three angles of `π/4`: `−A + 3 · 3π/4 = 2π` gives `A = π/4 > 0`.
  - This agrees with the pinned `CompactConvexPolygon.volume_carrier` (`TauCeti/Analysis/Complex/UpperHalfPlane/Polygon/GaussBonnet.lean:524`): `(3 − 2)π − 3π/4 = π/4`.

## R03 (P3) — The boundary-circle Checks of Layer 2 depend on ℓ, but they never state it

- **Location:** `README.md` 2.1, lines 380–386: "In the arc case, … for 0 ≤ t ≤ ℓ. Assume all remaining boundary is at distance at least ℓ from σ … Define c(s), capped at ℓ". The Checks at lines 407, 410 and 429 are "c ≡ ρ", "c ≡ π/2" and "Disk of radius ρ with R > ρ".
- **Claim:**
  - For a boundary circle with no other boundary, nothing constrains ℓ.
  - c is capped at ℓ, so the Check values hold only for some ℓ, and the text never says which.
  - "R > ρ" needs `ℓ > R`.
- **Witness:** take the unit disk with `ℓ = 1/2`, which the text allows. Then `c ≡ 1/2`, not `ρ = 1`, and `R > ρ` is impossible because `R < ℓ`.
- **Repair:**
  - After line 383, add: "For a boundary circle, ℓ is any positive number such that the rest of the boundary lies at distance at least ℓ from σ."
  - Write the Checks as:
    - "with `ℓ ≥ ρ`: `c ≡ ρ`";
    - "with `ℓ ≥ π/2`: `c ≡ π/2`";
    - "with `ℓ > R > ρ`: `πρ² = 2πρ · ρ/2`".
  - Tested with `ρ = 1`, `ℓ = 2` and `R = 3/2`:
    - `c ≡ 1`, and both sides are `π`.
    - With `R = 1/2`, both sides are `3π/4`.

## R04 (P3) — The negative claim "L5 states no index value" is false at the head of the ConformalMapping revision

- **Location:** `README.md` lines 197–198, in the ConformalMapping contract: "L5 states no index value."
- **Claim:**
  - The sentence is true on main. It describes what a supplier lacks, and no target needs it, because 4.1's route (lines 568–577) now goes through the filled-hull criterion and uses no index.
  - The open revision of ConformalMapping (#998), at its head, makes the sentence false.
  - It also reads as a reply to review, which the timeless rule excludes.
- **Witness:** at the head of #998, `Completed/ConformalMapping/README.md` line 733 opens "Layer 5: Jordan domains and the boundary index", and line 906 is "5.6 The Jordan index theorem".
- **Repair:** delete the sentence. The contract keeps what 4.1 consumes: separation, the inside, the filled-hull API and the closed-disc correspondence. Tested: no line of the README cites an index value from L5 (3.1 takes its orientation from R4.9.6a).

## R05 (P3) — The Laplacian convention and three supplier items are not consumed by any target

- **Location:**
  - `README.md` lines 74–75: "The scalar Laplacian is DifferentialGeometry's `laplaceBeltrami`, `Δ = div grad`."
  - Lines 149–150: the Tau Ceti item `laplaceBeltrami`.
  - Lines 184–185: DifferentialGeometry "12.2–12.5: … Hessian, Laplacian, … and the divergence theorem".
- **Claim:**
  - No target, route or *Needs* line uses the Laplacian, DifferentialGeometry 12.3 or DifferentialGeometry 12.5.
  - The *Needs* lines use 12.2 (5.2) and 12.4 (1.1, 1.2, 2.2, 3.2) only.
  - A contract lists what is consumed.
- **Witness:** a search of the README for "Laplac", "12.3", "12.5", "divergence" and "Hessian" matches only lines 75, 150 and 184–185.
- **Repair:**
  - Delete the Laplacian sentence on line 75 and the `laplaceBeltrami` item on line 150.
  - Shorten line 184 to "12.2: the gradient with its chain rule; 12.4: the density/measure comparison".
  - Tested: every remaining DifferentialGeometry citation (lines 87, 241, 255, 275, 299, 371, 413, 435, 451, 536, 550, 693, 716, 726) names 5.3–5.5, 5.6.3, 10.2, 12.2 or 12.4.

## Verified sound

### The previous review's findings (at b52bcd4)

| Id | Status at c30b6b2 | Evidence |
|---|---|---|
| R01 (P1), common-arc law | Repaired | Lines 515–518 read "the interior angles add, so the two exterior angles sum to the exterior angle of the union plus π". The split-rectangle Check is at 530–532 (`π/2 + π/2 = 0 + π`, rectangle `4π − 2π = 2π`). The annulus example at 540–544 gives `2 · 2π − 4π = 0`. |
| R02, L5 index | Repaired | The contract (194–198) no longer claims an index; R04 above concerns only its new last sentence. The 4.1 route (568–577) uses `Complex.exists_continuousOn_eqOn_exp_comp` and `hasContinuousLogOn_sub_iff_notMem_filledHull`. 3.1 *Needs* (494–495) and the Layer 3 dependencies (550–552) cite L5 "for the Jordan separation". |
| R03, 4.1 statable | Repaired | `exists_disk_of_simpleClosedCurve` is at `Suggested.lean` 161–168, named at README 566. The docstring bullet is gone, and 4.1 is widened to all simple closed curves. |
| R04, sphere Check and compactness control | Repaired | Lines 347–351: `2π(sin 1 − 1) = −0.9961 = −2π(1 − sin 1)` and `2π(1 − cos 1) − π = −0.2532 = −2π(cos 1 − 1/2)`. The slit-plane control is at 639–644. |
| R05, Lee–Parker | Repaired | Lines 668–670 and 758–759. LeeParker1987 line 239 (printed p. 42) gives `dV_g = (det g)^(1/2)|dx|`. |
| R06, 5.2 change of variables | Repaired | `Homeomorph.measurePreserving_riemannianVolume` appears in the contract (151–155), the route (691–694) and *Needs* (716). DifferentialGeometry 12.2's chain rule is cited. N is modelled on the same E (`Suggested.lean` 229–231); the pinned lemma allows different H and H′ over one E (`Isometry.lean` lines 20–22, 173). |
| R07, annulus in API | Repaired | Line 519 reads "The restriction and orientation-reversal laws for these domains." |
| R08, parent R3 | Repaired | Parent `README.md` 1510–1512 lists "HopfRinow, R1, R2, R3, R4.2, R4.9.6a's … and R6". |

### Gate, dependency check and diff scope

- **The worker's gate on c30b6b2** (`scratch/gate.md`) passes every check, including the build.
- **My rerun** of the brief's gate command prints `depcheck: NOT IN ORDER: Surfaces` and `outside-folder: TauCetiRoadmap/RiemannianGeometry/README.md`. As in the last round, I treat both as false positives:
  - The default order is not the candidate order, which lists Surfaces at line 397.
  - The parent README is the family index, which this pull request owns.
- **Order-aware check:** `depcheck: 239 roadmaps, 2353 edges, 0 problem(s)`, with no UPWARD or CYCLE line. PositiveMass (candidate line 285) consumes Surfaces S3. The pull-request description orders the two.
- **Diff scope:** `git diff --stat origin/main...HEAD` touches only the parent README (36 lines) and this folder. The extra files in `changes.md` come from the merge of main.

### Lean audit

- **Elaboration:** `lake env lean` on `Suggested.lean` gives seven `declaration uses 'sorry'` warnings (lines 58, 79, 104, 132, 161, 187, 236) and nothing else. 5.1 is proved.
- **Signatures:** I compared all 8 elaborated types (`scratch/signatures.md`) with the README.
  - No binder is lost.
  - 4.1 carries `[T2Space M]` and `[I.Boundaryless]`.
  - 1.4 carries `MeasurableSpace`, `BorelSpace`, `LindelofSpace` and `IsContinuousRiemannianBundle`.
  - 1.2 is stated for any smooth unit-speed `σ : ℝ → M`, not only embedded arcs. That is wider than the README's arc, and still true: each conjunct is a pointwise Jacobi-field fact.
  - In 1.1 and 1.4, `hbij` and `hcpt` are not needed for the stated conclusions. This is a note, not a finding.
- **One-tactic probe:** in a scratch copy I replaced each `sorry` by `first | rfl | simp | infer_instance | (intros; simp_all)`.
  - All seven targets fail: six with unsolved goals, and 5.2 because `simp_all` made no progress.
  - Nothing in the file is padding.
- **R01 probe:** the copy with the 3.2 statement elaborates, with eight `sorry` warnings.
- **3.1's hypothesis `hz`:** `windingNumber` (`TauCeti/Analysis/Contour/Winding/Number/Basic.lean:76`) is the principal-value index. On a piecewise `C¹` unit-speed Jordan curve the principal value exists at every point. It equals 1 inside a positively oriented curve, 1/2 at smooth points of the curve and `β/2π < 1` at a corner. So `hz` forces positive orientation.

### Library declarations opened at the pins (38)

- **Tau Ceti, `Geometry/Manifold/Riemannian/`:**
  - `Homeomorph.measurePreserving_riemannianVolume` and `RiemannianIsometry.measurePreserving_riemannianVolume` (`VolumeDensity/Isometry.lean:173`, `:215`).
  - `ContMDiffRiemannianMetric.pullback` and `pullback_inner` (`Pullback/Basic.lean:158`, `:193`).
  - `inner_mgradient_rescale` (`Conformal.lean:102`) and `integral_riemannianVolume_rescale` (`VolumeDensity/Conformal.lean:142`).
  - `not_isConjugateOn_of_sectionalCurvature_nonpos` (`Jacobi/Conjugate.lean:222`; it needs the curvature sign only along the curve).
  - `norm_le_norm_mfderiv_riemannianExp_of_sectionalCurvature_nonpos` (`Jacobi/Comparison.lean:50`; it needs the curvature sign only on the radial segment).
  - `isJacobiFieldOn_mfderiv_riemannianExp` (`Jacobi/Exponential.lean:91`) and `IsJacobiFieldOn` (`Jacobi/Basic.lean:59`).
  - Gauss lemma and polar estimates: `inner_mfderiv_riemannianExp_radial` (`Geodesic/Gauss/Basic.lean:127`), `abs_inner_le_norm_mul_norm_mfderiv_riemannianExp` (`Gauss/Polar.lean:67`), `IsNormalDomain.ofReal_norm_riemannianLog_le_pathELength` (`Gauss/Polar.lean:253`).
  - Geodesics and normal domains: `IsNormalDomain` and `riemannianLog` (`Geodesic/Normal/Basic.lean`), `IsGeodesicCurveOn` (`Geodesic/Basic.lean`).
  - `hasDerivAt_energy` (`FirstVariation.lean:212`), `mgradient` (`Gradient/Basic.lean:73`), `laplaceBeltrami` (`Laplacian.lean:238`), `riemannianVolume` (`VolumeDensity/Volume.lean:82`).
  - `TotalCurvature.lean`: conformal invariance of total curvature on closed surfaces, a different object.
- **Tau Ceti, `Geometry/Manifold/` outside `Riemannian/`:**
  - `conformalClass` (`VectorBundle/Riemannian/Conformal.lean:216`).
  - `sectionalCurvature` (`VectorBundle/CovariantDerivative/Curvature/Sectional.lean:77`).
  - `alongCurveWithin` (`…/AlongCurve/Basic.lean:127`) and `curveVelocityWithin` (`MFDeriv/Curve.lean:135`).
  - `normalExpDomain` and `normalExp` (`TubularNeighborhood/Riemannian/Basic.lean:58`, `:113`), `contMDiffOn_normalExp` (`…/Regularity.lean:63`).
  - Orientation: `Manifold.Orientation`, `fact_finrank_tangentSpace` and `orientationAt` (`Orientation/Basic.lean:32`, `:92`, `:140`).
  - `integralTopForm_mextDeriv` (`DifferentialForm/Integration/Stokes.lean`): Stokes with boundary but without corners, so DifferentialGeometry 5.5 is still the supplier for corners.
- **Tau Ceti, other directories:**
  - `windingNumber` (`Analysis/Contour/Winding/Number/Basic.lean:76`).
  - `IsJordanCurve` (`Topology/JordanCurve/Basic.lean:107`) and `filledHull` (`Topology/FilledHull.lean:99`).
  - `HasContinuousLogOn` (`Analysis/Complex/ContinuousLog/Basic.lean:141`) and `hasContinuousLogOn_sub_iff_notMem_filledHull` (`Analysis/Complex/PlaneSeparation/Basic.lean:415`, for closed bounded K).
  - `CompactConvexPolygon.volume_carrier` (`Analysis/Complex/UpperHalfPlane/Polygon/GaussBonnet.lean:524`).
  - The length-space predicates of `Topology/MetricSpace/Length.lean`. There is no intrinsic metric on a subset, so 2.2's "not statable" claim stands.
- **Mathlib:**
  - `Complex.exists_continuousOn_eqOn_exp_comp` (`Analysis/Complex/BranchLogRoot.lean:39`, for an open `IsSimplyConnected` set).
  - `LipschitzWith.ae_differentiableAt` (`Analysis/Calculus/Rademacher.lean:386`).
  - `IsSimplyConnected` (`AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:137`).
  - `Orientation.rightAngleRotation` (`Analysis/InnerProductSpace/TwoDim.lean:230`) and `Orientation.oangle` (`Geometry/Euclidean/Angle/Oriented/Basic.lean:55`).

### Cross-roadmap citations resolved (31)

- **RiemannianGeometry at this head:**
  - Sections: R1 (186), R1 item 5 (226–240), R2 (322), R3 (369, with non-minimality past a conjugate point at 412), R4 (629), R4.1 (631), R4.2's moving endpoint (686), R4.4 (706), R4.6 (717), R4.9.6a (886, turning input at 898), R6 (1251, focal nullity and shortening at 1269 and 1286), dependency paragraph (1510–1512).
  - Anchors: all four resolve here. They also resolve at the #1683 head, where the R headings survive as subheadings (393, 1194, 1656, 2275), and at the #1327 head.
- **SmoothBundlesConnections on main:** B6.0 (1306), with the uniform normal radius on compact sets and the variable-base exponential, as the new R1 item 5 says.
- **DifferentialGeometry on main:** 5.3 (518), 5.5 (528), 5.6.3 (708), 10.2 (884), 12.2 (918, chain rule), 12.4 (923).
- **GeometricMeasureTheory on main:** G1 (106) and G2 (148).
- **ConformalMapping on main** (`Completed/`): L3 (119–124) and L5 (133–144). At the #998 head these become Layer 3 (580) and Layer 5 (733), with the closed-disc homeomorphism in 5.1 (735) and the Jordan curve theorem in 5.3 (787). The overlap tool reports no dropped id, and the folder path is unchanged.
- **HopfRinow on main** (`Completed/`): Layers 0–4 (229, 264, 427, 451, 495).
- **PositiveMass at the #956 head:** 47–50 and 148–155 (S3 consumed with the same conventions: D on the left, inward conormal, `αᵢ = π − βᵢ`), and 715–733.

### Ownership

- I searched by object (`roadmaps grep -i --readme-only`, on main and at all open heads) for:
  - the turning theorem with corners;
  - Fermi coordinates and normal strips;
  - geodesic polar coordinates and the polar Jacobian;
  - Gauss–Bonnet on disks;
  - conformal invariance of the Dirichlet energy.
- Results:
  - Only R4.9.6a owns the smooth turning theorem, at main 868, #1327 1428 and #1683 1656.
  - Only PositiveMass consumes the disk Gauss–Bonnet.
  - The one other "polar Jacobian" hit is a planar change of variables in GlobalHolomorphicFunctions (#992 line 1982).
  - #1187 is a pin bump across many roadmaps.
- No second owner exists. No name in `Suggested.lean` collides with a roadmap declaration or a Tau Ceti declaration.

### Adversarial table

| Statement | Instances | Computed values (left / right) | Result | Change |
|---|---|---|---|---|
| 1.1 `polar_jacobian_ode` | ℝ²; S², R ≤ π; ℍ²; `j = r` on S²; S² with R = 4 | `0 + 0 = 0`, `j(0) = 0`, `j′(0⁺) = 1`; `−sin r + sin r = 0`; `sinh r − sinh r = 0`; `0 + r ≠ 0`; `|v| = 3.5` gives `d = 2π − 3.5 = 2.78 ≠ 3.5`, so `hdist` fails | holds | none |
| 1.2 `normalStrip_jacobian` | plane circle, ρ = 2, inward and outward normal; latitude at φ₀ = π/3; equator; line | `a = 1 − t/2`, `a_t(0) = −0.5 = −k_g`; `a = 1 + t/2`, `a_t(0) = 0.5 = −(−0.5)`; `a_t(0) = −cot(π/3) = −0.5774`, `a_tt + a = 0`; `a = cos t`; `a ≡ 1` | holds | none |
| 1.2 API, L′ and area | latitude at φ₀; sector of angle θ about radius ρ | `L = 2π sin(φ₀ − t)`, `L′ = −2π cos(φ₀ − t) = ∫ a_t ds`; `θ(ρt − t²/2)` on both sides | holds | none |
| 1.3 | segment `[0,1]` with points (1/2, 2) and (2, 1) | `(0,−2)·(1,0) = 0`; `(−1,−1)·(1,0) = −1`, an endpoint foot | holds | none |
| 1.4 `hasDerivAt_polarLength_and_volume_ball` | ℝ²; S²; ℍ²; integrated forms at r = 1 | `2π = 2π − 0`, `V′ = 2πr`; `2π cos r = 2π − 2π(1 − cos r)`; `2π cosh r = 2π + 2π(cosh r − 1)`; `−0.9961 = −0.9961`; `−0.2532 = −0.2532` | holds | none |
| 2.1 cut time | disk of radius ρ with ℓ ≥ ρ and with ℓ = ρ/2; rectangle; hemisphere | `c ≡ ρ`; `c ≡ ρ/2`; `c ≡ b`; `c ≡ π/2` only when ℓ ≥ π/2 | Checks depend on ℓ | R03 |
| 2.2 integration formula | disk ρ = 1, ℓ = 2, R = 3/2 and R = 1/2; rectangle; hemisphere | `π = 2π · 1/2`; `3π/4 = 2π(1/2 − 1/8)`; `aR = aR`; `2π sin R` on both sides | holds once ℓ is stated | R03 |
| Layer 2 trapezoid control | 135° corner, R ≤ 1 | missed sector of angle π/4 and area `πR²/8` | holds | none |
| 3.1 `integral_signedCurvature_add_sum_exteriorAngle_eq_two_pi` | unit circle, T = ∅; square, T = {0,1,2,3}; L-shape; clockwise circle; z on the curve | `2π`; `0 + 4·(π/2)`; `5π/2 − π/2`; index −1, so `hz` fails; principal value 1/2 or `β/2π < 1`, so `hz` fails | holds | none |
| 3.2 (README) | unit disk; hemisphere; octant; lune of angle β; cap at φ₀; hyperbolic triangle with angles π/4; outward conormal | `0 + 2π + 0`; `2π + 0 + 0`; `π/2 + 3π/2`; `2β + 2(π − β)`; `2π(1 − cos φ₀) + 2π cos φ₀`; `−π/4 + 9π/4 = 2π`, which matches `volume_carrier`; `−2π ≠ 2π` | holds; statable | R01 |
| 3.2, the R01 statement | unit disk, standard orientation; unit square | `J c′ = −(cos t, sin t)` is inward, `∫⟪c″, J c′⟫ = 2π`; `oangle(1, i) = π/2`, four times | holds | R01 |
| 3.2 API, common-arc law | `[0,2]×[0,1]` split at x = 1; annulus halves | `π/2 + π/2 = 0 + π`; `2·2π − 4π = 0` | holds | none |
| ω convention | sphere cap | `ω = cos φ dψ`, `dω = −sin φ dφ∧dψ = −K dA`, `k_g = ω(e₂) = cot φ₀`; the opposite sign gives `−cot φ₀` | holds | none |
| 4.1 `exists_disk_of_simpleClosedCurve` | unit circle in B = disk of radius 2; unit circle in the annulus `1/2 < |z| < 2`; S² equator with B = S² | D is the closed unit disk; no D ⊆ B works since 0 ∉ B, so `hsc` is load-bearing; D is a hemisphere, so the chart condition is the stated generality (lines 53–61) | holds | none |
| 4.1 Check: bigon in the Poincaré disk | hypothetical bigon with angles β₁, β₂ and K = −1 | `A = −(β₁ + β₂) < 0` | Check false | R02 |
| 4.2 `riemannianExp_bijOn_ball_of_curvature_nonpos` | ℝ², ℍ²; flat cylinder, R = 4; oblate spheroid; slit plane, R = 2 | bijective; only `hsc` fails, `exp(0,π) = exp(0,−π)` with `|v| = π < 4`; only `hK` fails; only `hcpt` fails, `exp_p(1.5, 0)` undefined | holds | none |
| 4.2 bigon and loop | lune of angle β; equator as a loop | `2β = β + β`; `2π = π + π` | holds | none |
| 5.1 `integral_norm_mgradient_sq_rescale` (proved) | ℝ² with `f = e^(2x)`; `f = 4`; ℝ³ | `e^(2x)·e^(−2x) = 1`; `4·4⁻¹ = 1`; `e^(3x)·e^(−2x) = e^x`, excluded by `hE` | holds | none |
| 5.2 `integral_norm_mgradient_sq_comp_eq_of_pullback_eq_rescale` | `Φ(z) = 2z`; `Φ(z) = z̄`; non-differentiable φ | `∫ 4|∇φ(2z)|² dx dy = ∫ |∇φ|² dw`, with `dw = 4 dx dy`; `f = 1`, equal energies; gradient 0 at the same points on both sides | holds | none |
| Parent R1 item 5 | S²; Euclidean metric | `K(g_j) = λ_j⁻² K`; `λ²·λ⁻² g_euc = g_euc` | holds | none |
| Parent R4.1 Riccati | ℝ²; S² | `−t⁻² + t⁻² = 0`; `−csc² t + cot² t + 1 = 0`; `Hess(r²) > 0` iff `r cot r > 0` iff `r < π/2 = π/(2√κ)` | holds | none |

## Not verifiable

I checked every sampled target, 1.1–5.2, by computation (table above). Except for Lee–Parker, no locator could be checked against a legal text. This round I asked the sources service again, writing only to a scratch manifest:

- **Lee, *Introduction to Riemannian Manifolds*, 2nd ed.** This covers Theorems 6.9 and 12.8 and the page ranges for 1.1–1.3, 2.1, 3.1, 3.2, 4.1, 4.2, 5.1 and 5.2. DOI 10.1007/978-3-319-91755-9 is paywalled, and the service refused the publisher's front-matter PDF as paywalled.
- **do Carmo, *Differential Geometry of Curves and Surfaces* (1976).** This covers §§4-5, 4-6 and 5-7, cited for 1.1, 1.4, 3.1 and 3.2. The service found no legal source.
- **do Carmo, *Riemannian Geometry* (1992).** This covers Chapter 7, Theorem 3.1 and Lemma 3.3, cited for 4.2. DOI 10.1007/978-1-4757-2201-7 is paywalled.
- **Chavel, 2nd ed. (2006).** This covers §§III.1, III.2 and III.6, cited for 1.2, 1.4, 2.1 and 2.2. The DOI has no legal copy, and the publisher's table-of-contents PDF returned HTTP 503 three times.
- **Epstein (1966), Theorem 1.7.** DOI 10.1007/BF02392203 is paywalled. It is cited only for the reduction that Layer 4 does not use.

Lee and Parker (1987) was read from the AMS open archive: LeeParker1987 line 239, printed p. 42, supports the corrected wording.

## Source issues

- none
