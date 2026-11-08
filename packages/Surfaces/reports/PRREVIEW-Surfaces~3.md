# Review of Surfaces (pull request #1974 at 2cd64ea)
Folder: `TauCetiRoadmap/RiemannianGeometry/Surfaces/`
**Verdict:** needs changes

There are eight findings. Four are blocking: R01 is P1, and R02–R04 are P2.

## R01 (P1) — The turning theorem in `Suggested.lean` integrates the corner sum over `[0, L]`

- **Location:** `TauCetiRoadmap/RiemannianGeometry/Surfaces/Suggested.lean`, lines 53–55: `∫ t in (0)..L, (deriv (deriv γ) t * (starRingEnd ℂ) (deriv γ t)).im + ∑ s ∈ T, Complex.arg (…) = 2 * Real.pi`.
- **Claim:** the statement is false, for two independent reasons.
  - The body of `∫ t in a..b, …` extends over `+`, so the corner sum lies inside the integral. The theorem therefore asserts `∫k + L·Σα = 2π`.
  - `hγ` gives `C²` only off the corners. It does not make the curvature integrable near a corner, and where the curvature is not integrable Lean's integral is `0`.
- **Witness:**
  - *The parse.* Take the unit square traversed counterclockwise, with `L = 4`, `T = {0,1,2,3}`, `k = 0` and `Σα = 2π`. The left side is `∫₀⁴ (0 + 2π) dt = 8π ≠ 2π`. A scratch file proves `(∫ _t in (0:ℝ)..2, (0:ℝ) + 1) = 2` by `simp`, and `#check @` prints the sum inside the integral without parentheses.
  - *Integrability.* Take a D-shape: a semicircle closed by its diameter, with two corners of angle `π/2`. Near one corner, set the tangent angle on the diameter to `ε·t·sin(1/t)·χ(t)`, with `χ` a cutoff. Then `k` is not integrable, and even the parenthesised left side is `0 + π`.
- **Repair:** parenthesise the integral and add an integrability hypothesis. Tested: this elaborates at the pins. It gives `0 + 2π = 2π` on the square, and `hk` excludes the D-shape. Requiring `C²` on each closed piece between corners, the README's "piecewise smooth", would also do.

  ```lean
      (hk : IntervalIntegrable (fun t ↦ (deriv (deriv γ) t * (starRingEnd ℂ) (deriv γ t)).im)
        volume 0 L)
      … :
      (∫ t in (0)..L, (deriv (deriv γ) t * (starRingEnd ℂ) (deriv γ t)).im) +
        ∑ s ∈ T, Complex.arg (derivWithin γ (Ici s) s / derivWithin γ (Iic s) s) = 2 * Real.pi
  ```

## R02 (P2) — Layer 4 still assumes the ball lies in one chart instead of owning disk filling

- **Location:**
  - `Surfaces/README.md` lines 47–52: "…is owned by no roadmap cited here; Layer 4 therefore takes the disk structure of the ball as a hypothesis and owns disk filling in a chart".
  - Lines 409–410 and 424.
  - `Suggested.lean` line 126, `hchart : ∃ e ∈ atlas H M, Metric.ball p R ⊆ e.source`.
- **Claim:** this was R04 of the review at 18d2e3d, and it is not repaired.
  - The theorem holds without the chart hypothesis. "No roadmap owns it" is a reason to own the theorem here, not to assume it away.
  - `hchart` ranges over `atlas H M`, the chosen atlas of the instance, not the maximal atlas. So it depends on how the surface is presented. The Poincaré-disk chart of line 449 lies only in the maximal atlas.
  - With `hchart` in place, the sphere control of line 453 also violates `hchart`, so it no longer shows that the curvature sign is load-bearing.
- **Witness:**
  - *The chart is implied, but only through classification.* If `B(p,R)` is compact, it is open and closed, so it equals `M`. Then `M` is a closed simply connected surface, hence S², with `∫K = 4π > 0`. So under the other hypotheses `B` is a noncompact simply connected surface, and therefore diffeomorphic to ℝ².
  - *The sphere control.* S² is compact, so it lies in no chart source.
  - *No supplier.* TeichmullerGeometry §0.0d (head of #1169, line 163) uses Epstein's Theorem 1.7 only inside a route, for PL loops on finite combinatorial surfaces.
- **Repair:**
  - Make 4.1 the owned theorem, with a route and a *Needs:* line: a simple closed piecewise `C¹` curve that is null-homotopic in an open surface bounds an embedded compact disk with Layer 3's corner regularity (Epstein, Theorem 1.7). Keep the one-chart case as a Check.
  - State 4.2 and `riemannianExp_bijOn_ball_of_curvature_nonpos` without `hchart`. Tested: this elaborates, with `[I.Boundaryless]` as in R03. The sphere control then fails `K ≤ 0` alone.
  - If a one-chart lemma is kept, quantify over `IsManifold.maximalAtlas I ∞ M` (tested: elaborates).

## R03 (P2) — The exponential-map suppliers assume a boundaryless model; Layers 1 and 4 allow corners

- **Location:**
  - `Surfaces/README.md` lines 62–64: "Unlike the parent, surface domains may have boundary and corners … Interior statements use boundaryless neighbourhoods".
  - The contracts at lines 103–118.
  - `Suggested.lean` lines 62–67, 78, 102 and 121: there is no `[I.Boundaryless]`, only `hint : … ⊆ I.interior M`.
- **Claim:** the routes of 1.1, 1.4 and 4.2 consume suppliers that are all stated for boundaryless models: the Gauss lemma, `isJacobiFieldOn_mfderiv_riemannianExp`, `norm_le_norm_mfderiv_riemannianExp_of_sectionalCurvature_nonpos`, HopfRinow, and the parent's R2, R4.2 and R6. Nothing provides a boundaryless structure on `I.interior M` that agrees with `M`'s exponential map, curvature and distance. The contracts do not record the hypothesis.
- **Witness:**
  - `[I.Boundaryless]` appears at the following places in `TauCeti/Geometry/Manifold/Riemannian/`: `Jacobi/Exponential.lean:61`, `Geodesic/Gauss/Polar.lean:60`, `Geodesic/HopfRinow.lean:72`, `Geodesic/Gauss/Basic.lean:127` and `Jacobi/Comparison.lean:50`.
  - The parent README on main, line 15, works with "boundaryless smooth manifolds".
  - Mathlib has only `interior_eq_univ` (`IsManifold/InteriorBoundary.lean:192`).
- **Repair:**
  - In Conventions, take the ambient surface boundaryless, with domains that have boundary and corners as compact subsets of it, as Layer 3 already does.
  - Add `[I.Boundaryless]` to `polar_jacobian_ode`, `hasDerivAt_polarLength_and_volume_ball` and `riemannianExp_bijOn_ball_of_curvature_nonpos`, and drop `hint`. Tested: this elaborates.
  - Record the hypothesis against each supplier in the contracts. 1.2's boundary-arc paragraph then concerns an arc of `∂D`.
  - If ambient surfaces with boundary are kept instead, own a Layer 1 target that supplies this bridge.

## R04 (P2) — The normal-strip headline (1.2) is statable at the pins but is listed as not statable

- **Location:** `Suggested.lean` lines 21–22: "Layer 1.2 … lacks: the signed geodesic curvature of an embedded arc with respect to a chosen unit normal". Lines 25–26 name the same carrier as missing for 3.2.
- **Claim:**
  - The carrier exists. `k_g(s) = ⟨D_s σ′, n(s)⟩` is `inner ℝ (alongCurveWithin (leviCivitaConnection I M) σ (curveVelocityWithin I σ univ) univ s) (n s)`, which is the pinned covariant derivative along curves that defines geodesics and Jacobi fields. No new definition is needed.
  - What 3.2 actually lacks is a carrier for a compact disk domain with a piecewise smooth boundary parametrization and its corners.
- **Witness:**
  - `alongCurveWithin` is at `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/AlongCurve/Basic.lean:127` and `curveVelocityWithin` at `…/MFDeriv/Curve.lean:135`. `IsJacobiFieldOn.equation` (`Jacobi/Basic.lean:66`) uses both.
  - The statement below elaborates.
- **Repair:**
  - Add the statement (it needs `import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.AlongCurve.Basic`) and drop the 1.2 bullet.
  - Reword the 3.2 bullet to name the disk-domain carrier.
  - Checked on the plane circle of radius ρ with inward normal: `a = 1 − t/ρ` and `a_t(s,0) = −1/ρ = −k_g`.

  ```lean
  theorem normalStrip_jacobian (hE : Module.finrank ℝ E = 2) [I.Boundaryless]
      (σ : ℝ → M) (hσ : ContMDiff 𝓘(ℝ) I ∞ σ)
      (hunit : ∀ s, ‖curveVelocityWithin I σ univ s‖ = 1)
      (n : (s : ℝ) → TangentSpace I (σ s))
      (hn : ContMDiff 𝓘(ℝ) I.tangent ∞ (fun s ↦ TotalSpace.mk' E (σ s) (n s)))
      (hn1 : ∀ s, ‖n s‖ = 1) (hn0 : ∀ s, inner ℝ (n s) (curveVelocityWithin I σ univ s) = 0)
      {δ : ℝ} (hδ : 0 < δ) (hdom : ∀ s, ∀ t ∈ Ioo (-δ) δ, t • n s ∈ expDomain I M (σ s))
      (K : M → ℝ) (hK : ∀ x (u v : TangentSpace I x), LinearIndependent ℝ ![u, v] →
        (leviCivitaConnection I M).sectionalCurvature
          (isMetricCompatible_leviCivitaConnection I) x u v = K x) :
      let F : ℝ → ℝ → M := fun s t ↦ riemannianExp I M (σ s) (t • n s)
      let a : ℝ → ℝ → ℝ := fun s t ↦ ‖mfderiv 𝓘(ℝ) I (fun s' ↦ F s' t) s 1‖
      let kg : ℝ → ℝ := fun s ↦ inner ℝ
        (alongCurveWithin (leviCivitaConnection I M) σ (curveVelocityWithin I σ univ) univ s) (n s)
      ∀ s, a s 0 = 1 ∧ HasDerivAt (a s) (-kg s) 0 ∧
        ∀ t ∈ Ioo (-δ) δ, 0 < a s t → deriv (deriv (a s)) t + K (F s t) * a s t = 0 := by
    sorry
  ```

## R05 (P3) — Three Check values are wrong

- **Location and claim:**
  - (a) Lines 273–275: "for … `[0,1]` and the point `(1,2)` the foot `(1,0)` is interior". In fact `(1,0)` is the endpoint `x = 1`.
  - (b) Lines 329–331: "a region of area `R²/2`" is missed in the 45° trapezoid. That value is wrong for either angle.
    - At an acute 45° corner the domain D lies over σ, every footpoint is interior, and the formula holds.
    - At an obtuse 135° corner the missed set is a 45° sector, of area `πR²/8`.
  - (c) Lines 394–396: one radial cut of the annulus does not give the embedded boundary that 3.2 requires, because the slit is traversed twice.
- **Witness:**
  - (a) For `(1/2,2)` the foot `(1/2,0)` is interior, and the velocity `(0,−2)` is orthogonal to the arc.
  - (b) Take `σ = [0,4]`, the top side from `(−1,1)` to `(1,1)` and `R ≤ 1`. The interior angle at `(0,0)` is 135°, and the points of D with `x < 0` within distance R of σ form a sector of angle π/4.
  - (c) Each half-annulus gives `0 + (π − π) + 4·π/2 = 2π`.
- **Repair:**
  - (a) Use `(1/2,2)`, and keep `(2,1)` as the endpoint case: velocity `(−1,−1)`, whose inner product with `(1,0)` is `−1`.
  - (b) Specify the 135° corner and the value `πR²/8`.
  - (c) Cut along the radial arcs θ = 0 and θ = π into two half-annuli, each with four right-angle corners. The common arcs cancel, and the eight corners' `4π` leaves `2π − 2π = 0` for the annulus.
- Values (a) and (b) came from the table of the review at 18d2e3d, where they were already wrong.

## R06 (P3) — Parts of the README and `Suggested.lean` are not in the house form

- **Location:** the defined objects j (1.1), a and k_g (1.2), L and V (1.4), c and T_R (2.1), T̂ (3.1) and E_g (5.2); line 375 (`k_g ds = dθ + ω`); `Suggested.lean` lines 11–17 and the order of its declarations.
- **Claim:**
  - None of these objects has an API list or a `**Checks.**` list; the values sit only in the layers' `### Examples`.
  - The sign of ω has no witness.
  - None of the six Lean names appears in the README.
  - The docstring is titled "selected target interfaces" and says the file "illustrates" the headlines. The declarations run in layer order 3, 1, 1, 4, 5, 5, with no `/-! ## Layer k: … -/` comments.
  - "From TauCetiRoadmap" is a single subsection.
- **Witness:** take the unit sphere with `e₁ = ∂_φ`, `e₂ = (sin φ)⁻¹∂_ψ` and `∇e₁ = ω ⊗ e₂`. Then `ω = cos φ dψ` and `dω = −K dA`. On the boundary of the cap `{φ ≤ φ₀}`, `T = e₂`, θ is constant and `k_g = ω(T) = cot φ₀`. The opposite sign convention gives `−cot φ₀`.
- **Repair:**
  - Add API bullets to each defining subsection, and move the matching Examples there as `**Checks.**` (at least three each).
  - Add the ω convention together with the witness above.
  - Name each Lean declaration at its target.
  - Retitle the docstring "…: target signatures". Order the declarations by layer and add the layer comments.
  - Use one `### From TauCetiRoadmap.<X>` subsection per supplier.

## R07 (P3) — Most locators are chapter-level, and two attributions are inaccurate

- **Location:**
  - The README gives no page numbers anywhere.
  - Several targets have only chapter-level locators: 1.2 (Chavel Ch. III; Lee Ch. 10), 1.3 (Lee Ch. 6), 1.4 (Chavel §III.1), 2.1–2.2 (Chavel Ch. III), 3.2 (Lee Ch. 9) and 5.1 (Lee Ch. 2). 4.1 and 5.2 have no locator.
  - Lines 479 and 530–531 cite Lee–Parker §2 for "the conformal change of the gradient and the volume".
  - Lines 415–416: "DifferentialGeometry 5.6.3 gives `filledHull ⊆ Ω` with winding number one inside".
- **Claim:**
  - Lee–Parker §2 states neither conformal law.
  - DifferentialGeometry 5.6.3 assumes the containment rather than proving it.
- **Witness:**
  - LeeParker1987 line 239 (printed p. 42) gives only the density in coordinates. Lines 284–288 (p. 43, (2.5)–(2.6)) give the Ricci and scalar curvature laws.
  - The DifferentialGeometry README on main, lines 735–737, states the "HOL Light specialization" with `filledHull K ⊆ U` and winding number `1` as hypotheses.
- **Repair:**
  - Give theorem, proposition or equation numbers with printed pages.
  - Cite Lee–Parker p. 42 for the coordinate density only, and cite the gradient law to `inner_mgradient_rescale`.
  - In 4.1, derive the containment from ConformalMapping L5 (the index is ±1 on the bounded component) and from the vanishing of the index outside Ω. Use 5.6.3 only for the Green identity.

## R08 (P3) — README and Lean differ on the hypotheses of 1.1, and two dependency lists omit R1

- **Location:**
  - README lines 176–178: "maps a tangent ball of radius strictly larger than R diffeomorphically onto the metric ball".
  - `Suggested.lean` lines 75–77 and 99–101.
  - README line 380: 3.2's *Needs:* includes "R1's curvature of a surface".
  - Parent README lines 1510–1512 ("uses HopfRinow, R2, R4.2, R4.9.6a's … and R6") and `Surfaces/README.md` line 511.
- **Claim:**
  - The Lean statements assume only `BijOn` on the R-ball with `dist = ‖v‖`. This is more general than the README, and still true.
  - Both dependency lists leave out R1.
- **Witness:** a geodesic stops minimizing past a conjugate point. So `hdist` already excludes conjugate points on `(0,R)`, which gives `j > 0` there.
- **Repair:** state 1.1 in the README with the Lean hypotheses, and add R1 to both lists.

## Verified sound

### The findings of the review at 18d2e3d

| Id | Status | Evidence at 2cd64ea |
|---|---|---|
| R01 | Repaired | `Suggested.lean` exists (178 lines) and builds. Its statements are covered by R01, R02 and R04 above. |
| R02 | Repaired | Lines 43–46: "PositiveMass §3.1 owns the Gauss–Bonnet theorem for compact surfaces … Annuli are the case `χ = 0`". At the head of #956, PositiveMass cites "RiemannianGeometry/Surfaces S3" for the disk formula (its lines 47–50, 148–155, 724–733). The pull-request link is gone. The candidate merge order lists PositiveMass at line 285 and Surfaces at line 396, so PositiveMass has to move after Surfaces; the description orders the two pull requests that way. |
| R03 | Repaired | No R4.9.6a hunk remains in the diff. The parent says Surfaces "supplies nothing to this roadmap". Main line 868 owns the smooth turning input, and 3.1 consumes it. |
| R04 | Not repaired | Raised again as R02 above. |
| R05 | Repaired | Line 470: "for every real φ". Line 476: "Neither side needs a regularity or support hypothesis". Both forms are stated in Lean. |
| R06 | Repaired | Mathlib, Tau Ceti and roadmap contracts are separate, each with its module. Rademacher is cited from Mathlib. L3 and L5 are cited correctly. The missing `[I.Boundaryless]` is R03 above. |
| R07 | Partly | The corner convention is defined (lines 74–79) and pinned by the L-shape (386–388), and the requested values are present. The `**Checks.**` form is R06 above and the wrong values are R05. |
| R08 | Partly | Theorem numbers are now given for Lee 6.9 and 12.8, do Carmo RG 7.3.1 and Epstein 1.7. The rest is R07 above. |
| R09 | Mostly | The required headings, Layers 1–5 with `### Examples` and `### Dependencies`, per-target *Needs:* lines and Downstream consumers are all present. The polar formulas moved to 1.4 with "No curvature sign … is a prerequisite". The remainder is R06 above. |
| R10 | Repaired | The description says the pull request "merges after #1683 and #1327 … placing R1 item 5 after #1683's §2.2". #1187 changes parent lines 54, 114 and 892 only, which are disjoint from these hunks. |

### Gate, dependency check, scope

- **Gate:** the worker's run on 2cd64ea passes every check. My rerun with the brief's command reports `depcheck: NOT IN ORDER: Surfaces` and `outside-folder: TauCetiRoadmap/RiemannianGeometry/README.md`. Neither is a finding:
  - The first is the gate's default order. The candidate order lists Surfaces at line 396, and the order-aware check passes.
  - The second is the family index, which the brief makes this pull request's own.
- **Dependency check:** `depcheck: 238 roadmaps, 2344 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Scope:** `git diff origin/main...HEAD` touches only the parent README and this folder.

### Lean audit

- **Signatures.** `#check @` on all six declarations shows every binder kept. Compared with the README, the differences are R01, R02, R03 and R08.
- **Fibre norms.** `‖e‖` on `TangentSpace I p` elaborates through `instNormedAddCommGroupOfRiemannianBundle…`, the metric norm.
- **Sectional curvature.** `sectionalCurvature` is `⟨R(u,v)v,u⟩ / det Gram` (`Curvature/Sectional.lean:77–80`). So `hK` is satisfiable; an unnormalized quotient would force K = 0.
- **One-tactic probe.**
  - `simp` leaves goals in all five sorried theorems.
  - `exact?` fails or times out on all five.
  - A single `simp` with the two pinned lemmas does not close the proved rescaling identity.
  - So nothing in the file is padding.
- **Probe statements.** Every probe elaborates with only the `sorry` warning: repaired S3, S4 with `[I.Boundaryless]` and no `hint` or `hchart`, S4 with `maximalAtlas`, and 1.2.
- **Name clashes:** none of the six names occurs in any other roadmap, on main or at an open head.

### Library declarations opened at the pins (37)

- **Tau Ceti, under `TauCeti/Geometry/Manifold/Riemannian/`:**
  - `Geodesic/`: `expDomain` and `riemannianExp` (`Exponential.lean:98`, `:104`), `IsGeodesicCurveOn` (`Basic.lean:102`), `IsNormalDomain` and `riemannianLog` (`Normal/Basic.lean:89`, `:225`).
  - `Geodesic/Gauss/`: `inner_mfderiv_riemannianExp_radial` (`Basic.lean:127`), and `abs_inner_le_norm_mul_norm_mfderiv_riemannianExp` and `IsNormalDomain.ofReal_norm_riemannianLog_le_pathELength` (`Polar.lean:67`, `:253`).
  - `Jacobi/`: `IsJacobiFieldOn` (`Basic.lean:59`), `isJacobiFieldOn_mfderiv_riemannianExp` (`Exponential.lean:91`), `not_isConjugateOn_of_sectionalCurvature_nonpos` (`Conjugate.lean:222`), `norm_le_norm_mfderiv_riemannianExp_of_sectionalCurvature_nonpos` (`Comparison.lean:50`).
  - Elsewhere: `hasDerivAt_energy` (`FirstVariation.lean:212`), `mgradient` (`Gradient/Basic.lean:73`), `laplaceBeltrami` (`Laplacian.lean:238`), `riemannianVolume` (`VolumeDensity/Volume.lean:82`), `integral_riemannianVolume_rescale` (`VolumeDensity/Conformal.lean:142`), `inner_mgradient_rescale` (`Conformal.lean:102`), `WithMetric` (`WithMetric.lean:68`), `ContMDiffRiemannianMetric.pullback` (`Pullback/Basic.lean:158`).
- **Tau Ceti, other directories:**
  - `TauCeti/Geometry/Manifold/`: `ContMDiffRiemannianMetric.rescale` and `conformalClass` (`VectorBundle/Riemannian/Conformal.lean:87`, `:216`), `sectionalCurvature` (`VectorBundle/CovariantDerivative/Curvature/Sectional.lean:77`), `alongCurveWithin` (`VectorBundle/CovariantDerivative/AlongCurve/Basic.lean:127`), `curveVelocityWithin` (`MFDeriv/Curve.lean:135`).
  - `TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/`: `normalExp` and `normalExpDomain` (`Basic.lean:113`, `:58`), `isOpen_normalExpDomain` and `contMDiffOn_normalExp` (`Regularity.lean:47`, `:63`), `exists_partialDiffeomorph_normalExp_subset` (`Coordinates.lean:89`).
  - `TauCeti.Contour.windingNumber` (`TauCeti/Analysis/Contour/Winding/Number/Basic.lean:76`), `IsJordanCurve` (`TauCeti/Topology/JordanCurve/Basic.lean:107`), `filledHull` (`TauCeti/Topology/FilledHull.lean:99`).
- **Mathlib:** `LipschitzWith.ae_differentiableAt` (`Analysis/Calculus/Rademacher.lean:386`), `SimplyConnectedSpace` (`AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:41`), `IsManifold.maximalAtlas` (`Geometry/Manifold/IsManifold/Basic.lean:868`), `interior_eq_univ` (`…/InteriorBoundary.lean:192`).

### Cross-roadmap citations resolved (25)

- **RiemannianGeometry on main:** R1 (line 179; conformal laws at 226–229), R2 (300; fixed-chart formula at 310), R4.1 (609), R4.2 (641; moving endpoint at 656), R4.4 (676), R4.6 (687), R4.9.6a (856; turning input at 868), R6 (1221; focal nullity at 1239, shortening at 1255).
- **DifferentialGeometry on main:** 5.3 (518), 5.4 (524), 5.5 (528), 5.6.3 (708, specialization at 735), 10.2 (884), 12.2–12.5 (918–930).
- **Other roadmaps on main:** GeometricMeasureTheory G1 (106) and G2 (148); ConformalMapping L3 and L5 (`Completed/ConformalMapping/README.md` 119, 133); HopfRinow Layers 0–4 (229–495).
- **For the parent edits and open heads:** SmoothBundlesConnections B6.0 (1306), which supplies the uniform normal radius and variable-base exp that R1 item 5 consumes; PositiveMass §3.1 at #956; TeichmullerGeometry §0.0d at #1169.

### Ownership

Searched by object with `roadmaps grep` on main and at all 466 open heads:

- **Turning theorem:** R4.9.6a owns only the smooth case (on main and at #1327 and #1683).
- **Gauss–Bonnet:** only PositiveMass §3.1 consumes this roadmap's disk formula. FuchsianOrbifolds' orbifold signature formula and RicciFlow's closed-surface identity are different objects.
- **No other owner:** polar length and area on surface balls, normal strips and cut-time integration on domains, and 2D Dirichlet-energy invariance. R4.1 owns only the complete all-dimension polar domain.
- **Local Cartan–Hadamard:** R4.4 owns the complete case only.
- **Epstein's disk filling:** owned only by SurfaceTopology, which is never to be cited, and used route-internally by TeichmullerGeometry (see R02).

### Adversarial table

| Statement | Instances | Computed values (left / right) | Result | Change |
|---|---|---|---|---|
| 1.1 `polar_jacobian_ode` | ℝ²; unit sphere, R ≤ π; ℍ²; j = r on the sphere; sphere with R = 4 | `0 = 0`, `j(0) = 0`, `j′(0⁺) = 1`; `−sin r + sin r = 0`; `sinh − sinh = 0`; `0 + r ≠ 0`; `hdist` fails, since `d = 2π − |v|` for `|v| > π` | holds | R03, R08 |
| 1.2 normal strip | plane circle, inward and outward normal; latitude φ₀; equator; line | `a = 1 − t/ρ`, `a_t = −1/ρ = −k_g`; `1 + t/ρ`, `k_g = −1/ρ`; `sin(φ₀−t)/sin φ₀`, `a_t(0) = −cot φ₀`; `cos t`; `1` | holds | R04 |
| 1.3 orthogonality | `[0,1]` with points (1/2,2), (2,1), (1,2) | interior foot, `(0,−2)·(1,0) = 0`; endpoint foot, `−1 ≠ 0`; (1,2) has an endpoint foot, not the "interior" the README claims | holds | R05 |
| 1.4 `hasDerivAt_polarLength_and_volume_ball` | ℝ²; sphere; ℍ²; integrated form on the sphere | `2π = 2π − 0` and `V′ = 2πr`; `2π cos r = 2π − 2π(1 − cos r)` and `V′ = 2π sin r = L`; `2π cosh r = 2π + 2π(cosh r − 1)`; `2π(sin r − r) = −2π(r − sin r)` | holds | none |
| 2.1–2.2 cut-time integral | disk with R > ρ and R < ρ; rectangle; hemisphere over the equator; trapezoid | `πρ² = 2πρ·ρ/2`; `2πρR − πR²` on both sides; `aR = aR`; `2π sin R = ∫₀^{2π}∫₀^R cos t`; at the 135° corner the gap is `πR²/8`, not `R²/2` | holds; the control's value is wrong | R05 |
| 2.2 `|grad d| = 1` | rectangle; disk | `|∂_y y| = 1`; `|∇(ρ − |x|)| = 1` off the centre | holds | none |
| 3.1 README turning theorem | circle ccw and cw; square; L-shape; figure eight | `2π`, degree 1; `−2π`, excluded; `0 + 2π`; `5π/2 − π/2`; total turning 0, not Jordan | holds | none |
| 3.1 Lean `integral_signedCurvature_…` | unit circle with T = ∅; square; D-shape with oscillating tangent | `2π = 2π`; `8π ≠ 2π`; `π ≠ 2π` | **false** | R01 |
| 3.2 Gauss–Bonnet | unit disk; hemisphere; octant; L-shape; outward conormal; lune | `0+2π+0`; `2π+0+0`; `π/2+3π/2`; `0+0+2π` (unsigned: 3π); `−2π ≠ 2π`; `2β + 2(π−β) = 2π` | holds | none |
| 3.2 `k_g ds = dθ + ω` | sphere cap `{φ ≤ φ₀}` | `k_g = cot φ₀ = ω(T)`; the opposite sign gives `−cot φ₀` | needs its witness | R06 |
| 3.2 annulus Check | one cut; two cuts | one cut leaves a non-embedded boundary; two cuts give `0 + (π − π) + 2π = 2π` per half, so the annulus total is 0 | wrong as written | R05 |
| Corner sign | ccw square corner; reflex corner of the L-shape | `arg(i/1) = π/2`; `arg(1/i) = −π/2` | holds | none |
| 4.1 disk filling | circle in a disk chart; core circle of an annulus chart | bounds; not null-homotopic, so excluded | holds | R02 |
| 4.2 `riemannianExp_bijOn_…` | ℝ²; ℍ²; flat cylinder with R = 4; sphere with R = 4 | bijective; bijective, but the Poincaré chart lies only in the maximal atlas; the meridian lies in the ball and `exp(0,π) = exp(0,−π)`; the conclusion fails but both `hK` and `hchart` fail too | holds; `hchart` is redundant and presentation-dependent | R02 |
| 4.2 bigon and loop | lune of angle β; equator as a loop | `∫K = 2β = β + β`; `2π = π + π` | holds | none |
| Curvature sign | unit sphere | `⟨R(u,v)v,u⟩ / Gram = +1 = K` | holds | none |
| 5.1 `integral_norm_mgradient_sq_rescale` | ℝ² with `f = e^{2x}`; ℝ³; constant `f = 4` | `e^{2x}·e^{−2x} = 1`; `e^{3x}·e^{−2x} = e^x`, excluded by `hE`; `4 · 4⁻¹ = 1` | holds (proved) | none |
| 5.2 `integral_norm_mgradient_sq_comp_…` | `F(z) = 2z`; `F(z) = z̄`; non-differentiable φ | `∫4|∇φ(2z)|² dxdy = ∫|∇φ|² dw`; `f = 1`, equal energies; the junk gradient 0 appears at the same points on both sides | holds | none |
| Parent R1 item 5 | unit sphere; Euclidean metric | `λ²g` has `K = λ⁻²`; `λ²F*g = λ²·λ⁻²·g_euc` | holds | none |
| Parent R4.1 Riccati | ℝ²; unit sphere | `S = 1/t`: `−t⁻² + t⁻² = 0`; `S = cot t`: `−csc² + cot² + 1 = 0`; `Hess(r²) > 0` exactly for `r < π/2` | holds | none |

## Not verifiable

- **Lee, *Introduction to Riemannian Manifolds*, 2nd ed.:** Theorems 6.9 and 12.8 and Chapters 2, 6, 9 and 10 (targets 1.1–1.3, 2.1, 3.2, 4.2 and 5.1). The sources service resolved DOI 10.1007/978-3-319-91755-9 to a paywalled page only.
- **do Carmo, *Riemannian Geometry*:** Chapter 7, Theorem 3.1 and Lemma 3.3 (target 4.2). Paywalled.
- **do Carmo, *Curves and Surfaces*:** §§4-5, 4-6 and 5-7 (targets 1.1, 1.4, 3.1 and 3.2). The sources service found no legal copy.
- **Chavel, 2nd ed., Chapter III** (targets 1.2, 1.4, 2.1 and 2.2). The sources service found no legal copy of DOI 10.1017/CBO9780511616822.
- **Epstein (1966), Theorem 1.7** (target 4.1). DOI 10.1007/BF02392203 is paywalled.

For these targets the mathematics was checked by computation instead; see the table. 5.2 has no locator.

## Source issues

- none
