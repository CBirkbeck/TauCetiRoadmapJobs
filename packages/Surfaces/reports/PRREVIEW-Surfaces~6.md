# Review of Surfaces (pull request #1974 at c019d09)
Folder: `TauCetiRoadmap/RiemannianGeometry/Surfaces/`
**Verdict:** needs changes

This is an incremental re-review of the 144 lines changed since c30b6b2. All five findings of the previous review are repaired. Two new findings remain, both P3, and none is blocking:

- **R01:** the gate fails on four `haveI` in the new 3.2 signature. The previous review's own suggested code introduced them.
- **R02:** the new 3.2 prose and docstring omit the integrability hypothesis that the Lean statement carries.

`Suggested.lean` elaborates with eight `sorry` warnings and nothing else. The order-aware dependency check reports no problem.

## R01 (P3) — The gate fails: `haveI` appears four times in the signature of the 3.2 theorem

- **Location:** `TauCetiRoadmap/RiemannianGeometry/Surfaces/Suggested.lean` lines 181, 185, 189 and 193, each `haveI := o.fact_finrank_tangentSpace (c t)` (or `(c s)`), in `integral_curvature_add_integral_geodesicCurvature_add_sum_exteriorAngle_eq_two_pi`.
- **Claim:**
  - The worker's gate on c019d09 reports `statement-hygiene=4 … FAIL` (`scratch/gate.md`), with rule "no `letI`/`haveI` in a signature", severity P3 and the repair "use an instance binder".
  - My rerun of the brief's gate command prints the same four lines.
  - The previous review's R01 repair block contained these four `haveI`, so the repair introduced this failure.
- **Witness:** `fact_finrank_tangentSpace` (`TauCeti/Geometry/Manifold/Orientation/Basic.lean:92`) is a `Fact` about `Module.finrank ℝ (TangentSpace I x)` at each point x. A `Fact` lives in `Prop`, so one instance binder quantified over x provides it for every `c t` without `haveI`.
- **Repair:**
  - Replace the theorem's signature by the block below, from `theorem` to `sorry`. It adds one binder after `o`, deletes the four `haveI` fragments, and rewraps `hk` and the sum to at most 100 columns. Lines `hK` through `hcusp` are unchanged.
  - Tested in four ways:
    1. A copy of `Suggested.lean` with this block elaborates under `lake env lean`, with eight `sorry` warnings and nothing else.
    2. The brief's gate, run on a scratch clone of c019d09 that holds this copy, reports `statement-hygiene=0`. It still prints `depcheck: NOT IN ORDER` and `outside-folder`, the two false positives of the bare rerun discussed below.
    3. In a probe, the head's statement follows from the repaired one: `have` the `Fact` family from `o.fact_finrank_tangentSpace`, then `exact`.
    4. The repaired statement follows from the head's statement by `exact`. Since 3 and 4 both hold, the mathematics is unchanged.

  ```lean
  theorem integral_curvature_add_integral_geodesicCurvature_add_sum_exteriorAngle_eq_two_pi
      (o : TauCeti.Manifold.Orientation I M (Fin 2))
      [∀ x : M, Fact (Module.finrank ℝ (TangentSpace I x) = 2)] (K : M → ℝ)
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
        ∀ᶠ ε in 𝓝[>] (0 : ℝ), riemannianExp I M (c t)
          (ε • (o.orientationAt (c t)).rightAngleRotation (curveVelocityWithin I c univ t)) ∈
            interior D)
      (hk : IntervalIntegrable (fun t ↦ inner ℝ
          (alongCurveWithin (leviCivitaConnection I M) c (curveVelocityWithin I c univ) univ t)
          ((o.orientationAt (c t)).rightAngleRotation (curveVelocityWithin I c univ t))) volume 0 L) :
      (∫ x in D, K x ∂riemannianVolume I M) +
        (∫ t in (0)..L, inner ℝ
            (alongCurveWithin (leviCivitaConnection I M) c (curveVelocityWithin I c univ) univ t)
            ((o.orientationAt (c t)).rightAngleRotation (curveVelocityWithin I c univ t))) +
        ∑ s ∈ T, ((o.orientationAt (c s)).oangle (curveVelocityWithin I c (Iic s) s)
            (curveVelocityWithin I c (Ici s) s)).toReal = 2 * Real.pi := by
    sorry
  ```

## R02 (P3) — The 3.2 statement sentence and docstring omit the integrability hypothesis `hk`, which the Lean statement needs

- **Location:**
  - `README.md` lines 523–526: "In the statement, the boundary is a piecewise `C²` unit-speed Jordan curve c with corners at a finite set T of parameters, D lies on its left …"
  - `Suggested.lean` lines 160–161: "whose boundary is a piecewise `C²` unit-speed Jordan curve `c` with corners at `T`, with `D` on its left".
- **Claim:**
  - The Lean statement assumes `hk`: `k_g` is interval integrable on `[0, L]` (line 185). Its `hc` gives `C²` only off the corners.
  - The sentence that describes the Lean statement does not mention `hk`, and neither does the docstring. 3.1 states the same hypothesis in both places: README line 474 "integrable signed curvature k on the smooth pieces", and the docstring at line 129.
  - `hk` is load-bearing. Under `hc` alone, curvature can fail to be integrable near a corner, and the Lean integral is then 0.
- **Witness:** take the closed upper half unit disk. Near the corner (1,0), replace its bottom side by the graph of `(1−x)³ sin(1/(1−x))`.
  - The curve is still `C^∞` off the corners. The one-sided tangent at (1,0) is still (1,0).
  - But `∫ |k_g| ≥ ∫ |sin u|/u du = ∞`.
  - Without `hk` the left side would be `0 + 0 + 2·π/2 = π ≠ 2π`.
- **Repair:**
  - In README 3.2, write "with corners at a finite set T of parameters and integrable k_g on the smooth pieces".
  - In the docstring, write "with corners at `T` and integrable `k_g`".
  - Tested: the wiggle example violates the added clause. The unit disk (`k_g ≡ 1`) and the unit square (`k_g ≡ 0`) satisfy it.

## Previous findings

- R01 — repaired: `Suggested.lean` 164–196 states 3.2. The docstring (25–27) lists only 2.2 as not statable. README 3.2 names `integral_curvature_add_integral_geodesicCurvature_add_sum_exteriorAngle_eq_two_pi`, and the contracts list `Orientation.rightAngleRotation`, `Orientation.oangle`, `TauCeti.Manifold.Orientation` and `orientationAt`. The repair introduced R01 and R02 above.
- R02 — repaired: line 605 reads "A geodesic triangle in the Poincaré disk bounds the solid hyperbolic triangle, whose area is `π − (β₁ + β₂ + β₃)` by 3.2: with three angles `π/4`, … `A = π/4`."
- R03 — repaired: lines 395–396 read "For a boundary circle, ℓ is any positive number such that the rest of the boundary lies at distance at least ℓ from σ." The Checks at 421, 424, 443–448 and 459 state `ℓ ≥ ρ`, `ℓ ≥ π/2` and `ℓ > R > ρ`.
- R04 — repaired: the ConformalMapping contract (lines 206–210) now ends "…the Carathéodory closed-disc correspondence for Jordan domains."; "L5 states no index value" is gone.
- R05 — repaired: the Laplacian sentence and the `laplaceBeltrami` item are gone. The DifferentialGeometry contract (196–197) reads "12.2: the gradient with its chain rule; 12.4: the density/measure comparison". A search for "Laplac", "12.3", "12.5", "divergence" and "Hessian" matches nothing.

## Verified sound

### Gate, dependency check and diff scope

- **The worker's gate on c019d09** (`scratch/gate.md`) fails only on `statement-hygiene=4`, which is R01. `build=0`.
- **My rerun** of the brief's gate command prints the same four hygiene lines. It also prints `depcheck: NOT IN ORDER: Surfaces` and `outside-folder: TauCetiRoadmap/RiemannianGeometry/README.md`. As in the last two rounds, these two are false positives of the bare rerun:
  - The default order is not the candidate order, which lists Surfaces at line 399.
  - The parent README is the family index, which this pull request owns. The brief's exclusion diff is empty.
- **Order-aware dependency check** (the brief's `--depcheck … --movable` command), output verbatim:

  ```text
  depcheck: 239 roadmaps, 2327 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **Diff scope:**
  - `git diff --stat c30b6b2 HEAD` touches only `Surfaces/README.md` (82 lines) and `Surfaces/Suggested.lean` (62 lines).
  - Since the previous review, the parent README is unchanged: 36 lines against main, as before.
  - `changes.md` lists no file outside the folder.

### Lean audit

- **Elaboration at the head:** `lake env lean` gives eight `declaration uses 'sorry'` warnings (lines 56, 77, 102, 130, 164, 211, 237, 286) and nothing else. 5.1 remains proved.
- **Signatures:** I appended `#check @name` for all nine declarations to a scratch copy and elaborated it once.
  - The eight carried-over declarations are unchanged from `scratch/signatures.md`.
  - The new 3.2 theorem keeps every section binder it uses: `MeasurableSpace`, `BorelSpace`, `LindelofSpace` and `IsContinuousRiemannianBundle` for `riemannianVolume`, and `[I.Boundaryless]` for `riemannianExp`.
  - It has no `hE`. That is correct, because `o : Orientation I M (Fin 2)` forces `finrank ℝ E = 2` by `Orientation.card_eq` (`Orientation/Basic.lean:83`).
- **One-tactic probe** on the new theorem: `first | rfl | simp | infer_instance | (intros; simp_all)` leaves unsolved goals. It is not padding. The other seven `sorry` targets are unchanged and failed the same probe last round.
- **R01 repair probe:** see R01 for the elaboration, the gate run on the scratch clone, and the equivalence in both directions.

### Library declarations opened at the pins (11)

- **Tau Ceti:**
  - `TauCeti.Manifold.Orientation` (`Geometry/Manifold/Orientation/Basic.lean:32`).
  - `Orientation.card_eq` (`:83`), `fact_finrank_tangentSpace` (`:92`) and `orientationAt` (`:140`). `orientationAt` gives a `_root_.Orientation ℝ (TangentSpace I x) ι` at every point, boundary and corners included.
  - `CompactConvexPolygon.volume_carrier` (`Analysis/Complex/UpperHalfPlane/Polygon/GaussBonnet.lean:524`): area `(n − 2)π − Σ` interior angles. It confirms the new 4.1 Check: `π − 3π/4 = π/4`.
- **Mathlib:**
  - `Orientation.rightAngleRotation` (`Analysis/InnerProductSpace/TwoDim.lean:230`) and `Complex.rightAngleRotation` (`:520`): `rightAngleRotation z = I * z`, so J is rotation by `+π/2`.
  - `Orientation.oangle` (`Geometry/Euclidean/Angle/Oriented/Basic.lean:55`, `arg (o.kahler x y)`) and `Complex.oangle` (`:584`, `arg (conj w * z)`). For unit `v⁻` this is `arg(v⁺/v⁻)`, the convention of 3.1 and of the README.
  - `oangle_eq_pi_iff_sameRay_neg` (`:375`) and `Real.Angle.neg_pi_lt_toReal` / `toReal_le_pi` (`Analysis/SpecialFunctions/Trigonometric/Angle.lean:461`, `:465`). Together these show `αᵢ ∈ (−π, π)` once `hcusp` excludes `v⁺ = −v⁻`.
  - `TangentSpace` (`Geometry/Manifold/IsManifold/Basic.lean:1033`), a plain `def`.

### Cross-roadmap citations resolved (6)

- **DifferentialGeometry on main** (39d3d60): 12.2 (line 918, gradient with chain rule) and 12.4 (line 923, density/measure). This matches the shortened contract.
- **ConformalMapping on main:** the contract is unchanged except for the deleted sentence.
- **PositiveMass at the #956 head:** lines 148–155 consume S3 with D on the left, the inward conormal and `αᵢ = π − βᵢ`. The new J/oangle conventions give the same signs (see the table). Lines 50, 726 and 733 cite S3 by layer.
- **Overlaps** (`scratch/overlaps.md`): there is no dropped id, no other pull request changes this roadmap, and the closest roadmaps (#1683, #1327, #1187, #956, #1506) are those assessed last round.

### Ownership

- The changed passages own no new object. 3.2 was already this roadmap's target.
- `roadmaps grep --fixed --lean-only geodesicCurvature`, over main and all open heads, matches only this file's line 164.
- Tau Ceti's Gauss–Bonnet files are all hyperbolic polygon results (`UpperHalfPlane/Polygon`, `Fuchsian`). None states Gauss–Bonnet for disks on a Riemannian surface.

### Adversarial table

The rows for statements the diff leaves untouched are carried from the previous review (at c30b6b2), with its values. The other rows are new and cover the changed statements.

| Statement | Instances | Computed values (left / right) | Result | Change |
|---|---|---|---|---|
| 3.2 Lean (head form; the repaired form is equivalent) | unit disk in ℂ, `c = e^{it}`, `L = 2π`, `T = ∅`, standard orientation | `J c′ = I·ie^{it} = −e^{it}` (inward, `hin` holds); `⟨c″, J c′⟩ = 1`; `0 + 2π + 0 = 2π` | holds | none |
| 3.2 Lean | clockwise `c = e^{−it}` | `J c′ = e^{−it}` is outward, so `hin` fails; without `hin` the sum would be `0 − 2π + 0 = −2π ≠ 2π` | `hin` load-bearing | none |
| 3.2 Lean | unit square, `T = {0,1,2,3}`, `L = 4` | at `(1,0)`: `oangle(1, i) = arg(i) = π/2`; at `s = 0`, by periodicity, `oangle(−i, 1) = π/2`; `0 + 0 + 4·π/2 = 2π` | holds | none |
| 3.2 Lean | L-shape, reflex corner at (1,1) | `oangle(−1, i) = arg(−i) = −π/2`; `5·π/2 − π/2 = 2π` | holds | none |
| 3.2 Lean | hemisphere, outward orientation, equator | `∂_φ × (sin φ)⁻¹∂_ψ` = position vector, so the frame is positive; `J c′ = −∂_φ` points north; `2π + 0 + 0 = 2π` | holds | none |
| 3.2 Lean | hyperbolic triangle with angles `π/4` | `−π/4 + 0 + 3·3π/4 = 2π`; `volume_carrier`: `π − 3π/4 = π/4` | holds | none |
| 3.2 Lean | cusp `v⁺ = −v⁻`; fake corner `v⁺ = v⁻` | `oangle = π` and `toReal = π`, excluded by `hcusp`; a fake corner adds `0` | holds | none |
| 3.2 Lean | `E = ℝ³` | `card_eq` gives `2 = 3`, so no `o` exists | dimension fixed by `o` | none |
| 3.2 Lean | half-disk with an `x³ sin(1/x)` wiggle at a corner, `hk` dropped | junk `0 + 0 + π = π`; improper integral `π + 0 + π = 2π` | `hk` load-bearing, not in the prose | R02 |
| Conventions: `αᵢ = oangle(v⁻, v⁺)` | `Complex.oangle` | `arg(conj v⁻ · v⁺) = arg(v⁺/v⁻)` for unit `v⁻`, which is 3.1's `Complex.arg` | consistent | none |
| Conventions: cap witness with the new J | cap `φ ≤ φ₀`, `T = e₂` | `J e₂ = −e₁` points into the cap; `k_g = ω(e₂) = cos φ₀/sin φ₀ = cot φ₀` | consistent | none |
| 2.1 Checks with ℓ | disk ρ = 1, ℓ = 2; hemisphere, ℓ = 2 | `c = min(ρ, ℓ) = 1`; `c = min(π/2, 2) = π/2` | holds | none |
| 2.2 Checks | ρ = 1, ℓ = 2, R = 3/2 and R = 1/2; hemisphere, R < π/2 | `2π·1/2 = π = π·1²`; `2π(1/2 − 1/8) = 3π/4 = π(1 − 1/4)`; `2π sin R` on both sides | holds | none |
| Layer 2 negative control | ρ = 1, ℓ = 2, R = 3/2 | `a(3/2) = −1/2 < 0`; the zero extension gives `π` | holds | none |
| 4.1 triangle Check | three angles `π/4` | `−A + 9π/4 = 2π`, so `A = π/4`, which agrees with `volume_carrier` | holds | none |
| 1.1 `polar_jacobian_ode` (carried) | ℝ²; S², R ≤ π; ℍ²; `j = r` on S²; S² with R = 4 | `0 + 0 = 0`, `j(0) = 0`, `j′(0⁺) = 1`; `−sin r + sin r = 0`; `sinh r − sinh r = 0`; `0 + r ≠ 0`; `|v| = 3.5` gives `d = 2.78 ≠ 3.5`, so `hdist` fails | holds | none |
| 1.2 `normalStrip_jacobian` (carried) | plane circle ρ = 2, inward and outward normal; latitude φ₀ = π/3; equator; line | `a_t(0) = −0.5 = −k_g`; `+0.5`; `−cot(π/3) = −0.5774`, `a_tt + a = 0`; `a = cos t`; `a ≡ 1` | holds | none |
| 1.2 API (carried) | latitude; sector of angle θ | `L′ = −2π cos(φ₀ − t) = ∫ a_t ds`; `θ(ρt − t²/2)` on both sides | holds | none |
| 1.3 (carried) | segment `[0,1]`, points (1/2, 2) and (2, 1) | `(0,−2)·(1,0) = 0`; `(−1,−1)·(1,0) = −1`, an endpoint foot | holds | none |
| 1.4 `hasDerivAt_polarLength_and_volume_ball` (carried) | ℝ²; S²; ℍ²; integrated forms at r = 1 | `2π = 2π − 0`; `2π cos r = 2π − 2π(1 − cos r)`; `2π cosh r = 2π + 2π(cosh r − 1)`; `−0.9961 = −0.9961`; `−0.2532 = −0.2532` | holds | none |
| Layer 2 trapezoid control (carried) | 135° corner, R ≤ 1 | missed sector of angle π/4, area `πR²/8` | holds | none |
| 3.1 `integral_signedCurvature_add_sum_exteriorAngle_eq_two_pi` (carried) | unit circle; square; L-shape; clockwise circle; z on the curve | `2π`; `4·π/2`; `5π/2 − π/2`; index −1, so `hz` fails; principal value 1/2 or `β/2π`, so `hz` fails | holds | none |
| 3.2 README Checks (carried) | unit disk; hemisphere; octant; lune β; cap φ₀; outward conormal | `0 + 2π + 0`; `2π + 0 + 0`; `π/2 + 3π/2`; `2β + 2(π − β)`; `2π(1 − cos φ₀) + 2π cos φ₀`; `−2π ≠ 2π` | holds | none |
| 3.2 common-arc law (carried) | `[0,2]×[0,1]` split at x = 1; annulus halves | `π/2 + π/2 = 0 + π`; `2·2π − 4π = 0` | holds | none |
| ω convention (carried) | sphere cap | `dω = −sin φ dφ∧dψ = −K dA`, `k_g = cot φ₀`, opposite sign `−cot φ₀` | holds | none |
| 4.1 `exists_disk_of_simpleClosedCurve` (carried) | unit circle in the disk of radius 2; in the annulus `1/2 < |z| < 2`; S² equator | closed unit disk; `0 ∉ B`, so `hsc` is load-bearing; a hemisphere, outside the chart generality | holds | none |
| 4.2 `riemannianExp_bijOn_ball_of_curvature_nonpos` (carried) | ℝ², ℍ²; flat cylinder, R = 4; oblate spheroid; slit plane | bijective; `exp(0,π) = exp(0,−π)` with `π < 4`, so only `hsc` fails; only `hK` fails; only `hcpt` fails | holds | none |
| 4.2 bigon and loop (carried) | lune β; equator as a loop | `2β = β + β`; `2π = π + π` | holds | none |
| 5.1 `integral_norm_mgradient_sq_rescale` (carried, proved) | ℝ² with `f = e^{2x}`; `f = 4`; ℝ³ | `e^{2x}·e^{−2x} = 1`; `4·4⁻¹ = 1`; `e^{3x}·e^{−2x} = e^x`, excluded by `hE` | holds | none |
| 5.2 `integral_norm_mgradient_sq_comp_eq_of_pullback_eq_rescale` (carried) | `Φ(z) = 2z`; `Φ(z) = z̄` | `∫ 4|∇φ(2z)|² dx dy = ∫ |∇φ|² dw`; `f = 1`, equal energies | holds | none |
| Parent R1 item 5 and R4.1 Riccati (carried) | S²; ℝ² | `K(g_j) = λ_j⁻² K`; `−t⁻² + t⁻² = 0`; `−csc² t + cot² t + 1 = 0`; `r cot r > 0` iff `r < π/2` | holds | none |

### Remarks on untouched text

None.

## Not verifiable

The sampled targets that fall in changed passages are 2.1 and 2.2 (Checks only), 3.2 (statement) and 4.1 (one Check). Their locators did not change since c30b6b2:

- do Carmo, *Curves and Surfaces*, §4-5 from p. 264.
- Lee, 2nd ed., pp. 271–275 and 307–312.
- Chavel §§III.2 and III.6.

I did not fetch these again. The previous round's attempts still apply:

- Lee's DOI 10.1007/978-3-319-91755-9 is paywalled.
- The sources service found no legal copy of do Carmo (1976).
- Chavel's DOI has no legal copy, and the publisher's table of contents returned HTTP 503.

All the changed Checks and the 3.2 statement are verified by computation in the table above. Epstein (1966) belongs to untouched text and was not retried. Acta Mathematica back issues are served openly by Project Euclid, so a later full review may be able to read Theorem 1.7 there.

## Source issues

- none
