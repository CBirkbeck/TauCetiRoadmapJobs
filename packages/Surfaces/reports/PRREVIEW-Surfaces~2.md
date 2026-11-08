# Review of Surfaces (pull request #1974 at 18d2e3d)
Folder: `TauCetiRoadmap/RiemannianGeometry/Surfaces/`
**Verdict:** needs changes

Ten findings, four of them blocking (P2). The gate fails on this head (R01).

## R01 (P2) — `Suggested.lean` is missing, so headlines that are statable at the pins are absent

- **Location:** `TauCetiRoadmap/RiemannianGeometry/Surfaces/`. The folder contains only `README.md`.
- **Claim:** the roadmap has no acceptance test. The gate fails, and none of the headlines is stated against the pinned libraries, although at least three of them can be.
- **Witness:** rerunning the gate on this head gives `gate Surfaces: missing-files=1 FAIL` for `TauCetiRoadmap/RiemannianGeometry/Surfaces/Suggested.lean`. A scratch file with the three statements below elaborates under `lake env lean` at the pins, with only `declaration uses 'sorry'` warnings.
- **Repair:** add `TauCetiRoadmap/RiemannianGeometry/Surfaces/Suggested.lean` with:
  - `import Mathlib` and the Tau Ceti modules it uses. The tested statements need `TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Conformal`, `TauCeti.Geometry.Manifold.Riemannian.Geodesic.Exponential`, `TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Regularity`, `TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Sectional` and `TauCeti.Analysis.Contour.Winding.Number.Basic`.
  - The namespace `TauCetiRoadmap.Surfaces` and the standard module docstring.
  - The headlines. The following statements elaborate as written; S4 is stated at the README's generality, with boundary allowed and the closed ball in the interior, and without the chart hypothesis (see R04).

  ```lean
  /-- S3: signed turning theorem for a positively oriented C² Jordan curve. -/
  theorem integral_signedCurvature_eq_two_pi (γ : ℝ → ℂ) {L : ℝ} (hL : 0 < L)
      (hper : Function.Periodic γ L) (hinj : InjOn γ (Ico 0 L))
      (hγ : ContDiff ℝ 2 γ) (hunit : ∀ t, ‖deriv γ t‖ = 1) {z : ℂ}
      (hz : TauCeti.Contour.windingNumber γ 0 L z = 1) :
      ∫ t in (0)..L, (deriv (deriv γ) t * (starRingEnd ℂ) (deriv γ t)).im = 2 * Real.pi := by
    sorry

  -- variables: E, H, I, M with [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M],
  -- RiemannianBundle, IsContMDiffRiemannianBundle I ∞ E, IsRiemannianManifold I M
  /-- S4: a simply connected, relatively compact ball with K ≤ 0 is a normal ball. -/
  theorem riemannianExp_bijOn_ball_of_curvature_nonpos (hE : Module.finrank ℝ E = 2)
      (p : M) {R : ℝ} (hR : 0 < R) (hcpt : IsCompact (Metric.closedBall p R))
      (hint : Metric.closedBall p R ⊆ I.interior M)
      (hK : ∀ x ∈ Metric.ball p R, ∀ u v : TangentSpace I x,
        inner ℝ ((CovariantDerivative.leviCivitaConnection I M).curvatureTensor x u v v) u ≤ 0)
      (hsc : SimplyConnectedSpace (Metric.ball p R)) :
      Metric.ball (0 : TangentSpace I p) R ⊆ expDomain I M p ∧
        BijOn (riemannianExp I M p) (Metric.ball 0 R) (Metric.ball p R) ∧
        ∀ v ∈ Metric.ball (0 : TangentSpace I p) R, dist p (riemannianExp I M p v) = ‖v‖ := by
    sorry
  ```

  - S5 in the form of R05's repair. State the conformal-diffeomorphism form as the headline. The plain rescaling identity is a short consequence of two pinned lemmas; apply the one-tactic probe to it before keeping it in the file.
  - In the module docstring, name each headline that cannot be stated and the carrier it lacks: S3's Gauss–Bonnet formula with corners, which needs the geodesic curvature of a boundary arc and the exterior angle at a corner of a piecewise smooth domain, and S2's integration formula, which needs the cut time of the normal exponential of a boundary arc. S1's polar density can be stated through `mfderiv (riemannianExp I M p)`; either state it or name it there.

## R02 (P2) — S3's Gauss–Bonnet formula duplicates PositiveMass §3.1, and the README misstates how the two relate

- **Location:** `Surfaces/README.md` lines 26–30: "The general Gauss–Bonnet theorem for compact surfaces with boundary … PositiveMass §3.1, proposed in [#956](…), owns it and consumes S3's local interfaces rather than rebuilding them." The S3 statement is at lines 160–168.
- **Claim:**
  - PositiveMass §3.1 already owns `∫K + ∫k_g + Σα = 2πχ` with corners, and the disk (χ = 1) and the annulus (χ = 0) are special cases of it, so the object has two owners.
  - The claim that PositiveMass consumes S3 is false. If it were true it would be an upward edge, because PositiveMass is at line 286 of the merge order and Surfaces at line 397.
  - The README also links a pull-request number, which policy forbids.
- **Witness:** `TauCetiRoadmap/PositiveMass/README.md` at the head of #956, lines 697–704, proves the formula "including piecewise smooth corners with exterior angles". Its *Needs:* line (707) lists no Surfaces. Its Checks give disk 2π, annulus 0 and hemisphere 2π, with S3's conventions (D on the left, inward conormal).
- **Repair:**
  - Cite PositiveMass §3.1 for the Gauss–Bonnet formula and turn the disk and annulus cases into Checks.
  - Keep in S3 only what §3.1 does not state, each item with one clause saying how it differs: reflex corners, if §3.1 does not cover them; comparison of the boundary term with a local connection form; cancellation along a shared arc; the corner extension of the turning theorem (see R03).
  - Delete the sentence that PositiveMass consumes S3, and the link.
  - Tested: S3's formula and §3.1's agree on all three of §3.1's Checks under the same orientation and conormal, so citing §3.1 loses nothing.

## R03 (P2) — Supply runs both ways between RiemannianGeometry and Surfaces

- **Location:** parent `TauCetiRoadmap/RiemannianGeometry/README.md` line 890 ("specialize [Surfaces S3]…"), line 898 ("The signed planar turning theorem, the comparison of the boundary arclength integral … are S3's") and line 1511. Surfaces lines 63–67 consume R2, R4.2 and R6.
- **Claim:** Surfaces consumes RiemannianGeometry R2, R4.2 and R6, while the edited R4.9.6a consumes Surfaces S3. Two roadmaps therefore cite each other. RiemannianGeometry is on main and Surfaces is at line 397 of the merge order, so the R4.9.6a citation points upward. There is no cycle at section level, because S3 uses only DifferentialGeometry and ConformalMapping. The edit also re-plans R4.9.6a, which on main owns the turning theorem. Line 898 hands S3 "the comparison … with DG's oriented line integral and the area comparison", which S3 (lines 168–180) never states.
- **Witness:** main's parent README line 868 reads "Build the signed turning input here: an oriented smooth embedded planar Jordan curve … has tangent-map degree+1". The heads of #1327 (line 1440) and #1683 (line 1540) keep that sentence.
- **Repair:** drop the R4.9.6a hunks and the clause "its S3 precedes R4.9.6a's round disk and annulus identities". R4.9.6a then keeps the smooth signed turning theorem and the round disk and annulus identities, as on main. S3 cites "RiemannianGeometry R4.9.6a" for the smooth turning theorem and states only the extension to piecewise smooth curves with corners. Supply then runs from RiemannianGeometry to Surfaces only. The alternative is to move S3 into the parent.

## R04 (P2) — S4's single-chart hypothesis narrows the theorem to suit the proof route

- **Location:** `Surfaces/README.md` lines 185–187: "Assume that open ball is simply connected and lies in the domain of a single chart into ℝ²". Lines 204–206: "a disk-filling theorem … would replace this step; that theorem is not part of S4."
- **Claim:** the chart hypothesis is there only because the disk-filling step is not owned. A consumer has to produce a chart that the other hypotheses already guarantee.
- **Witness:** a compact open ball would be a closed simply connected surface, so S², where ∫K = 4π > 0. So under K ≤ 0 the ball is noncompact, hence diffeomorphic to ℝ²: the chart exists, but only uniformization produces it.
- **Repair:**
  - State S4 without the chart hypothesis. The S4 statement in R01 elaborates.
  - Add, as an S4 target with its own source locator, the disk-filling theorem: a simple closed piecewise C¹ curve that is null-homotopic in an open surface bounds an embedded closed disk (Epstein, *Curves on 2-manifolds and isotopies*, Acta Math. 115, 1966).
  - Keep the one-chart case, through DifferentialGeometry 5.6.3 and ConformalMapping L5, as its Check.
  - SurfaceTopology, which plans this theorem, is on the never-cite list, so it has to be owned here.

## R05 (P3) — S5 is stated under hypotheses the identity does not need

- **Location:** `Surfaces/README.md` lines 222–223: "u a smooth real function and φ a C¹ real function with compact support in the interior of the domain".
- **Claim:** the integrated identity holds for every φ. Neither C¹ nor compact support is needed. Compact support matters only for the separate integrability claim.
- **Witness:** `TauCeti.WithMetric.inner_mgradient_rescale` (`TauCeti/Geometry/Manifold/Riemannian/Conformal.lean:102`) holds for all `u w : M → ℝ`. `integral_riemannianVolume_rescale` (`…/VolumeDensity/Conformal.lean:142`) holds for all `φ`. With N = 2 and f = e^(2u), the integrand factor is `f^(N/2) · f⁻¹ = 1`.
- **Repair:** state the identity for arbitrary φ, as in the scratch statement below, which elaborates. Keep compact support only for the integrability bullet. Make the conformal-diffeomorphism form `E_(g_U)(φ ∘ F) = E_(g_V)(φ)` the headline.

  ```lean
  theorem integral_norm_mgradient_sq_rescale_exp (hE : Module.finrank ℝ E = 2) (u : M → ℝ)
      (hf : ContMDiff I 𝓘(ℝ) n (fun x ↦ Real.exp (2 * u x))) (φ : M → ℝ) :
      ∫ x, ‖mgradient I (φ ∘ WithMetric.ofWithMetric) x‖ ^ 2
          ∂riemannianVolume I (WithMetric (g.rescale _ hf (fun _ ↦ Real.exp_pos _))) =
        ∫ x, ‖mgradient I (φ ∘ WithMetric.ofWithMetric) x‖ ^ 2
          ∂riemannianVolume I (WithMetric g)
  ```

## R06 (P3) — The supplier contracts attribute pinned library declarations to roadmaps

- **Location:** `Surfaces/README.md` lines 57–82, and S4 line 189 ("the Jacobi equation to exclude conjugate points").
- **Claim:** several inputs already exist at the pins but are cited as roadmap work. One section label is also wrong.
- **Witness:**
  - `TauCeti.Manifold.not_isConjugateOn_of_sectionalCurvature_nonpos` (`Jacobi/Conjugate.lean:222`) is pinned.
  - Rademacher's theorem is Mathlib's `LipschitzWith.ae_differentiableAt` (`Mathlib/Analysis/Calculus/Rademacher.lean:386`), not GeometricMeasureTheory G1–G2.
  - ConformalMapping L3 is the Riemann mapping theorem; the Jordan curve theorem is in L5.
- **Repair:** split the supplier list into "From Mathlib", "From Tau Ceti" and "From TauCetiRoadmap.X", giving each declaration's module:
  - `riemannianExp`, `riemannianLog` and `IsNormalDomain`: `Riemannian/Geodesic/…`.
  - `IsJacobiFieldOn`: `Riemannian/Jacobi/Basic.lean:59`.
  - `TauCeti.SmoothEmbedding.normalExp`: `TubularNeighborhood/Riemannian/Basic.lean:113`.
  - `laplaceBeltrami`: `Riemannian/Laplacian.lean:238`.
  - The two conformal lemmas of R05.
  - `not_isConjugateOn_of_sectionalCurvature_nonpos`, and `norm_le_norm_mfderiv_riemannianExp_of_sectionalCurvature_nonpos` (`Jacobi/Comparison.lean:50`) for S4.
  - `LipschitzWith.ae_differentiableAt` for S2.

  Keep the roadmap citations for what is still planned: R4.2's moving-endpoint first variation, R6's focal-set nullity and shortening variation, DifferentialGeometry 5.6.3, and ConformalMapping L3 (Riemann mapping) with L5 (the Jordan curve theorem and Carathéodory).

## R07 (P3) — No definition has Checks, and the corner-angle sign has no witness

- **Location:** every defined object: j (line 92), a and k_g (107), c(s) and T_R (138–141), αᵢ and `T̂` (162–173), L(r) and V(r) (208), and E_g (234). "Order and validation" (lines 245–248) gives only flat-plane values.
- **Claim:** none of these has three discriminating Checks. Nothing pins the sign convention "signed exterior corner angles αᵢ, reflex corners included", and cusps (αᵢ = ±π) are neither admitted nor excluded.
- **Witness:** the L-shaped domain, with K = 0 and k_g = 0, has five corners with α = π/2 and one with α = −π/2, so Σα = 2π. Unsigned exterior angles would give 3π.
- **Repair:** define αᵢ = π − βᵢ, with βᵢ ∈ (0, 2π) the interior angle in D, and say whether cusps are admitted. Add the following Checks (all values computed in the table below):
  - j = sin r on the unit sphere and sinh r on the hyperbolic plane.
  - For the latitude circle at polar angle φ₀: a = sin(φ₀ − t)/sin φ₀ and k_g = cot φ₀.
  - For the equator: a = cos t.
  - On the unit sphere: L = 2π sin r and L′ = 2π cos r = 2π − 2π(1 − cos r).
  - The L-shaped domain above.
  - The octant triangle: π/2 + 3π/2 = 2π.
  - S2's 45° trapezoid as a negative control for its side conditions.
  - The flat cylinder of circumference 2π with R = 4 as a negative control for simple connectivity in S4.
  - u = x in dimension 3 as a negative control for dimension two in S5.
  - Outward conormal as a negative control: on the unit disk it gives −2π.

## R08 (P3) — No theorem carries a locator

- **Location:** S1–S5 (lines 86–235). The references (lines 252–258) cite only chapters.
- **Claim:** no theorem names a source theorem or page, so the sample of 15 targets had nothing to verify.
- **Witness:** the only locators are "Chapter 9 for the rotation index theorem and Gauss–Bonnet", "Chapter 10 for Jacobi fields" and "Chapter III for cut loci".
- **Repair:** put a theorem or proposition number and a page in parentheses at each claim: the polar Jacobian equation, the normal-strip Jacobian, the first variation to a curve, the cut-time integration formula, Gauss–Bonnet with corners, the rotation index theorem with corners, local Cartan–Hadamard, the polar length formula, and conformal invariance. Cite the primary source for disk filling (R04).

## R09 (P3) — The README is not in the TauCetiRoadmap form

- **Location:** whole file. The headings are `# Local geometry…`, `## Conventions and suppliers`, `## Milestones`, `### S1 … S5`, `## Order and validation` and `## References`.
- **Claim:** the following are missing:
  - `# Roadmap: …` with a `**Summary.**` paragraph.
  - `## Scope and ownership`; the boundaries sit in the introduction's bullets.
  - `## Exact supplier contracts` (see R06).
  - `## How to read the build`.
  - Layers with numbered subsections, each layer ending in `### Examples` and `### Dependencies`.
  - Per-target *Needs:* lines.
  - `## Downstream consumers`.
- **Witness:** S2 (lines 132–156) has no *Needs:* line, although it uses S1, R6, R4.2 and GeometricMeasureTheory. The polar length and area formulas (lines 208–218) sit under S4 but do not use K ≤ 0.
- **Repair:**
  - Restructure into Layers 1–5, one per S-section, with *Needs:* lines item by item.
  - Move the polar formulas to the S1 layer, or say that they do not need K ≤ 0.
  - Add `## Downstream consumers`: RiemannianGeometry R4.9.6a, if R03 keeps it as a consumer.

## R10 (P3) — The parent README edits conflict with two open RiemannianGeometry pull requests, and no order is stated

- **Location:** parent README lines 13–19 (sub-roadmap paragraph), 226–240 (R1 item 5) and 1509–1513 (dependency paragraph).
- **Claim:** #1327 (head 5297709) and #1683 (head 470e031) change the same lines differently. Neither this description nor theirs says which pull request rebases on which.
- **Witness:** `git merge-tree` of this head against each head conflicts at three hunks. #1683 moves R1's normal-coordinate jets to "### 2.2 … (R1.4)", where this pull request appends R1 item 5.
- **Repair:** state the order in the description (rebase this pull request after #1683 and #1327) and place R1 item 5 after #1683's §2.2. R03's repair removes the ownership conflict over R4.9.6a.

## Verified sound

- **Gate:** rerun on this head; the only failure is `missing-files: TauCetiRoadmap/RiemannianGeometry/Surfaces/Suggested.lean`.
- **Dependency check:** `depcheck: 235 roadmaps, 2419 edges, 0 problem(s)`. It found no UPWARD or CYCLE line. The README has no *Needs:* lines (R09), so this is weak evidence; R03's two-way supply is in prose.
- **Pull-request scope:** `git diff origin/main...HEAD` touches only the parent README and `Surfaces/README.md`. The files listed outside the folder in the change set come from the merge of main, not from this pull request.
- **Library names opened at the pins (13):**
  - `riemannianExp` (`Riemannian/Geodesic/Exponential.lean:104`), defined with corners and without `Boundaryless`.
  - `riemannianLog` (`Normal/Basic.lean:225`) and `IsNormalDomain` (`Normal/Basic.lean:89`).
  - `IsJacobiFieldOn` (`Jacobi/Basic.lean:59`).
  - `TauCeti.SmoothEmbedding.normalExp` (`TubularNeighborhood/Riemannian/Basic.lean:113`).
  - `laplaceBeltrami` (`Riemannian/Laplacian.lean:238`) and `mgradient` (`Gradient/Basic.lean:73`).
  - `inner_mgradient_rescale` (`Conformal.lean:102`) and `integral_riemannianVolume_rescale` (`VolumeDensity/Conformal.lean:142`). Neither has a hypothesis on the integrand; the second needs `[FiniteDimensional ℝ E] [LindelofSpace M]`.
  - `not_isConjugateOn_of_sectionalCurvature_nonpos` (`Jacobi/Conjugate.lean:222`) and `norm_le_norm_mfderiv_riemannianExp_of_sectionalCurvature_nonpos` (`Jacobi/Comparison.lean:50`).
  - `TauCeti.Contour.windingNumber` (`Analysis/Contour/Winding/Number/Basic.lean:76`).
  - Mathlib's `LipschitzWith.ae_differentiableAt` (`Analysis/Calculus/Rademacher.lean:386`).
  - Mathlib's `RiemannianBundle`, `IsContMDiffRiemannianBundle`, `IsRiemannianManifold` and `ModelWithCorners.interior` were used in the elaborated statements.
- **Cross-roadmap citations resolved (8):**
  - HopfRinow Layers 0–4 (Completed; first variation at line 444).
  - Parent R4.2's moving-endpoint first variation (parent line 686).
  - Parent R6's normal exponential, Sard nullity of the focal set and shortening past an interior focal point.
  - GeometricTopology Layer 1's tubular neighbourhoods.
  - DifferentialGeometry 5.6.3, which states the winding-weighted Green identity, `filledHull K ⊆ U` and winding number 1 inside; 10.2, which states Sard; and 12.2–12.3, which state gradient, Hessian and Laplacian.
  - GeometricMeasureTheory G1 and G2.
  - ConformalMapping L3 and L5.
  - PositiveMass §3.1 at the head of #956.
  - The anchors `#r1-…`, `#r4-…`, `#r6-…` and `#r496a-…` still resolve at #1683's restructured head. The parent's anchor `#s3--gaussbonnet-for-disks-and-annuli` matches S3's heading.
- **Ownership searched by object** on main and at every open head (with the roadmaps-grep tool), with these results:
  - Gauss–Bonnet: owned by PositiveMass §3.1 (R02).
  - The turning theorem: owned by R4.9.6a on main, #1327 and #1683 (R03).
  - Disk filling and Schoenflies on surfaces: only SurfaceTopology, which may not be cited (R04).
  - Conformal invariance of the Dirichlet energy, the polar length formula, and cut-time integration for curves on surfaces: no other owner, so Surfaces is the owner.
  - Isoperimetry, and GeometricTopology's nearest-point theorem, which is Euclidean: no overlap.
- **Parent additions checked mathematically:**
  - R4.1's Riccati route: in ℝ², S = 1/t gives S′ + S² = 0 and tS → 1. On the unit sphere, S = cot t gives −csc²t + cot²t + 1 = 0. Positivity of Hess(r²) = 2 dr² + 2r cot r (g − dr²) holds exactly for r < π/2 = π/(2√κ).
  - R1 item 5's scaling: λ²·(unit round metric) has K = λ⁻².
- **Lean form:** there is no `Suggested.lean`, so the `#check @name` audit and the one-tactic probe had nothing to run on. The three probe statements above were elaborated twice, the second time without `[I.Boundaryless]` and with `hint`. Each gives only the `sorry` warning.

### Adversarial table

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| S1.1 `j_rr + Kj = 0`, `j(0)=0`, `j_r(0)=1` | plane; unit sphere; hyperbolic plane; wrong model j = r on the sphere | plane: 0 = 0. Sphere j = sin r: −sin r + sin r = 0. Hyperbolic j = sinh r: sinh − sinh = 0. j = r on the sphere: 0 + r ≠ 0 | holds; the wrong model is excluded | Checks (R07) |
| S1.1 area `j dr dθ` | unit-sphere cap | ∫₀^{2π}∫₀^r sin = 2π(1 − cos r) = cap area | holds | none |
| S1.2 `a_t(s,0) = −k_g` | plane circle of radius ρ, inward / outward normal | inward: a = 1 − t/ρ, a_t = −1/ρ, k_g = 1/ρ. Outward: a = 1 + t/ρ, k_g = −1/ρ | holds; normal change consistent | none |
| S1.2 on the sphere | equator; latitude at polar angle φ₀ | equator: a = cos t, k_g = 0, a″ + a = 0. Latitude: a = sin(φ₀ − t)/sin φ₀, a_t(0) = −cot φ₀ = −k_g | holds | Checks (R07) |
| S1.2 `L′ = ∫a_t`, `Area = ∫₀ᵗ L` | latitude circle; plane annular sector of angle θ | L′ = −2π cos(φ₀ − t) on both sides. Sector: θ/2·(ρ² − (ρ − t)²) = (s₁ − s₀)(t − t²/2ρ) | holds | none |
| S1.3 orthogonality at an interior footpoint | x-axis segment [0,1] and point (1,2); point (2,1) | interior foot (1,0): velocity (0,−2) ⊥ σ. Endpoint foot (1,0): velocity (−1,−1), not ⊥ | holds; "interior" is load-bearing | none |
| S2 cut-time integral | disk radius ρ with R > ρ and R < ρ; rectangle [0,a]×[0,b]; 45° trapezoid | πρ² = 2πρ·ρ/2. 2πρR − πR² on both sides. aR = aR. Trapezoid: region of area R²/2 with nearest point at the endpoint, missed | holds; side conditions load-bearing | negative-control Check (R07) |
| S2 `|grad d| = 1` a.e. | rectangle | d = y, |∂y| = 1 | holds | none |
| S3 Gauss–Bonnet | unit disk; annulus 1 < r < 2; hemisphere; octant; L shape; outward conormal | 2π = 2π. 2π − 2π = 0. 2π + 0 = 2π. π/2 + 3π/2 = 2π. 5π/2 − π/2 = 2π. Outward: −2π ≠ 2π | holds; duplicates PositiveMass §3.1 | R02, R07 |
| S3 turning theorem | circle ccw / cw; square; figure eight | 2π, deg 1. cw: −2π. Square Σα = 2π. Figure eight: 0 (not Jordan) | holds; orientation and Jordan hypotheses load-bearing | R03 (owner) |
| S4 local Cartan–Hadamard | plane; ℍ²; flat cylinder of circumference 2π with R = 4; unit sphere with R = 4 | bijective; bijective. Cylinder: exp(0,π) = exp(0,−π) with the ball not simply connected. Sphere: injectivity fails at |v| = π with K = 1 > 0 | holds; hypotheses load-bearing; chart hypothesis redundant | R04 |
| S4 bigon / loop `∫K = β₁+β₂`, `π+β` | lune of angle β on the unit sphere; equator as a loop with β = π | area 2β = β + β. 2π = π + π | formula correct; positivity ⇒ contradiction with K ≤ 0 | none |
| S4 `L′ = 2π − ∫_{B_r}K`, `V′ = L` | unit sphere; ℍ² | 2π cos r = 2π − 2π(1 − cos r). V′ = 2π sin r = L. ℍ²: 2π cosh r = 2π + 2π(cosh r − 1) | holds | move to S1 (R09) |
| S4 integrated `V − πr²` | unit sphere | left: 2π(1 − cos r) − πr². Right: −2π∫₀ʳ(t − sin t)dt, the same | holds | none |
| S5 conformal identity | ℝ² with u = x; ℝ³ with u = x; non-C¹ φ | e^{−2x}·e^{2x} = 1 on both sides. ℝ³: factor e^{x}, unequal. Non-C¹ φ: the pinned lemmas still give equality | holds in dimension 2 for every φ | R05 |
| S5 conformal diffeomorphism | F(z) = 2z on ℂ | ∫4|∇φ(2z)|² dxdy = ∫|∇φ|² dw | holds | none |
| Curvature sign convention | unit sphere | ⟨R(u,v)v,u⟩ = +1 = K | holds | none |

## Not verifiable

- **J. M. Lee, *Introduction to Riemannian Manifolds*, 2nd ed., Springer GTM 176 (2018), Chapters 2, 6, 9 and 10.** The text is behind the Springer paywall; the author's page has only errata. The chapter attributions (for example normal coordinates to Chapter 6) are unchecked.
- **I. Chavel, *Riemannian Geometry: A Modern Introduction*, 2nd ed., CUP (2006), Chapter III.** The text is behind the CUP paywall; unchecked.
- **The seeded sample of 15 targets.** No target has a theorem-level locator, so nothing could be sampled against a text (R08). All mathematical claims were instead checked by computation in the adversarial table.
- **Epstein (1966), proposed in R04.** I did not read it. Its theorem number has to be supplied with the repair.

## Source issues

- none
