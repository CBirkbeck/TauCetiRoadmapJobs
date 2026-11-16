# Review of RiemannianManifoldsWithConvexBoundary (pull request #2451 at bde64ee)

**Verdict:** needs changes

## R01 (P3) — False negative-control Check in 4.5

**Location:** `TauCetiRoadmap/RiemannianManifoldsWithConvexBoundary/README.md` line 1314: "`−ρ` itself is not a convexity function at `q`: on the closed unit disc, with `U` the open disc of radius `1/2` about `q = (0, −1)` …"

**Claim:** A convexity function is a triple `(U, x̃, c₀)` with `U` chosen freely, so fixing one `U` does not show that `−ρ` is not one. On the disc `−ρ` is one, so the Check is false and does not test the `−ε|z − q|²` term.

**Witness:** `U = ℝ² ∖ {0}`, `x̃ = |z|² − 1`: `x̃(q) = 0`, `dx̃_q = (0, −2) = −dρ_q`, `dx̃ = 2z ≠ 0` on `U`, `Hess x̃ = 2g`, and `K_c = {1 − c ≤ |z|² ≤ 1}` is compact for `0 ≤ c ≤ 1/2`.

**Repair:** Replace the bullet with: "- `−ρ` is not always a convexity function. Take the parabola epigraph `M = {y ≥ x²} ⊆ ℝ²`, `ρ = y − x²`, `q = 0`. Here `∂M` is strictly convex at `q`, since `Hess(−ρ)(e_x, e_x) = 2`. For `x̃ = −ρ` and every open `U ∋ q`, the set `K_0 = U ∩ {y = x²}` is open in the parabola. If it were compact it would also be closed there, so it would be the whole parabola, which is not compact. So no `U` works. With `x̃ = −ρ − ε(x² + y²)` the set `K_c` lies in `{ε(x² + y²) ≤ c}` and is compact. On the closed unit disc, by contrast, `−ρ` is a convexity function with `U = ℝ² ∖ {0}`, because the whole circle is strictly convex."

## R02 (P3) — 4.4 cites lines that do not state its results

**Location:** `README.md` line 1238: "prove (Stefanov–Uhlmann–Vasy, lines 20–22 and 220–221; Lee, …)"; line 1166 (4.3) cites the same lines 220–221.

**Claim:** Neither passage states the collar, the distance collar, `E*g = dr² + h_r` or `II = −½ ∂_r h_r`. The cached book states the first three for compact `∂M`.

**Witness:** `stefanov-uhlmann-vasy2021` lines 20–22 name normal coordinates as a gauge; lines 220–221 use jets in them. `paternain-salo-uhlmann2023` lines 10065–10077 (Proposition 11.2.2, p. 253) state the diffeomorphism, distance `|t|` and `g = g_αβ dx^α dx^β + dt²`.

**Repair:** In 4.4, replace "Stefanov–Uhlmann–Vasy, lines 20–22 and 220–221" with "Paternain–Salo–Uhlmann, Proposition 11.2.2, lines 10065–10077, for compact `∂M`", and keep the Lee locators for `II = −½ ∂_r h_r`. In 4.3, cite "Stefanov–Uhlmann–Vasy, lines 99–100" and drop "and 220–221".

## R03 (P3) — The description's dependency paragraph names no roadmap

**Location:** Pull request description: "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them)."

**Claim:** The paragraph promises a list of suppliers and gives none. This is a new roadmap with six supplier roadmaps, all on main.

**Witness:** The README's `## Exact supplier contracts` (lines 342–436) has supplier sections for DifferentialGeometry, HopfRinow, RiemannianGeometry, GeometricTopology, ComplexKahlerGeometry and SmoothBundlesConnections. The description names none of them.

**Repair:** Replace the paragraph with: "Dependencies, all on main and cited by section (the Lean imports none of them): DifferentialGeometry 5.1, 12.1–12.3 and 12.5; HopfRinow Layers 1–2; RiemannianGeometry R5a, R5c and R7.9; GeometricTopology 1.1 and 1.3; ComplexKahlerGeometry K5a; SmoothBundlesConnections B6.0. RiemannianGeometry/Surfaces, AffineMorseLefschetz 4.5 and PositiveMass are named for comparison only."

## Verified sound

| Target | Instances tried | Values computed (roadmap / independent) | Result |
|---|---|---|---|
| 1.2 `ν_in` | `g = [[1,a],[a,1]]`, `a = 1/2`; unit ball | `(2/√3, −1/√3)`: `g(ν,e₁) = 0`, `g(ν,ν) = 1`; chart formula `(1,−a)/√(1−a²)` agrees; ball `ν_out = x` | holds |
| 1.3 defining functions | `1 − \|x\|²`, `(2+x₁)(1−\|x\|²)`, `(1−\|x\|²)²`, `x(1−x)` on `[0,1]` | `\|dρ\| = 2`; `u ∈ [1,3]`; `dρ'' = 0` on sphere (excluded); `\|dρ\| = 1` at both ends | holds |
| 1.4 `secondFundamentalForm` | ball radius `R`, half-space, exterior | `−Hess ρ/\|dρ\| = 2h/2R = h/R`; `0`; `−h`; Lean `−Hess x⁰/‖grad x⁰‖` equals source `−⟨∇_v ν, w⟩` (+h on ball) | holds |
| 1.6 conformal law | `φ = log 2`; `φ = −\|x\|²`; `φ = (\|x\|²−1)²` | `2h`; `−e⁻¹h`, `Ĥ = −e`; `h`. On `T∂M`, `Hess_ĝ ρ = Hess_g ρ + ⟨∇φ,∇ρ⟩g` gives `e^φ(II − dφ(ν_in)h)` | holds |
| 2.1 `IsStrictlyConvexAt` | `{y ≥ x³}`; `n = 0`, `[0,1]` | `II(t,t) = 6x/(1+9x⁴)^{3/2}`: sign of `x`, `0` at origin; `n = 0` vacuous, convex and concave | holds |
| 2.2 `isStrictlyConvexAt_iff_hessian_neg` | `ρ' = uρ`, `u > 0`; `n = 0` | `Hess ρ' = u Hess ρ` on `T∂M` (`ρ = dρ = 0` there), so the sign is unchanged; `n = 0`: both sides vacuous | holds |
| 2.3 openness, bound | hyperbola epigraph; `e^{−2s\|x\|²}g` on disc | `κ = (1+2x²)^{−3/2} → 0` (needs compactness); `II = e^{−s}(1−2s)h`, open set `s < 1/2` | holds |
| 3.1 regular domains | `(2+x₁)(1−\|x\|²)`, `(1−\|x\|²)³`, `x₀² − x₁²` | value `8` at `x₁ = −3`; set is ball ∪ `{x₁ ≤ −2}`; `0` is a critical value; double cone | holds |
| 3.3 `ρ̃` | `[0,1]` with collar `t/2`; half-space; `∂M = ∅` | `ρ̃ = 2x` for `\|x\| < 1/4`, `\|dρ̃/dx\| = 2`, `M̃ = (−1/2, 3/2)`; `ρ̃ = x⁰`; `ρ̃ ≡ 1` | holds |
| 3.5 `exists_isSmoothEmbedding_regularDomain` | `M = ∅`; `[0,1]`, `g = (1+x)²dx²`; half-line with doubled point | `N = ∅`, all clauses vacuous; circle, length `3/2`; non-Hausdorff case excluded by `[T2Space M]`; norm and inner are `g`'s | holds |
| 4.2 `not_exists_isGeodesicCurveOnFrom_of_isStrictlyConvexAt` | unit ball; `{y ≥ x⁴}`; `n = 0` | `ρ(q+tv) = −t²`, `(ρ∘γ)'' = −2 = −\|dρ\|II`; `x⁴` leaves with `II = 0` (converse not claimed); `n = 0`: `v ≠ 0` impossible | holds |
| 4.2 `mem_interior_of_isGeodesicCurveOn` | `γ(t) = t` on `[0,1]`; disc chords; constant curve | interior on `(0,1)`; chord interior points have `\|x\| < 1`; constant curve excluded by `∃ s, γ s ≠ γ a` | holds |
| 4.4 boundary normal coordinates | ball `R`; exterior; cap `φ₀`; strip `[0,1]×ℝ` | `h_r = (1−r/R)²h₀`, `−½∂_r = h₀/R`; `(1+r)²`, `−h₀`; `a = sin(φ₀−r)/sin φ₀`, `cot φ₀`; distance `0.2` at `(0.8,0)` | holds; locator R02 |
| 4.5 `exists_convexityFunction` | disc, `ε < 1`; parabola `y ≥ x²`; disc with `U = ℝ²∖{0}` | `Hess x̃ = (2−2ε)g`, `K_c ⊆ {ε\|z−q\|² ≤ c}`; for the parabola `−ρ` fails for every `U`; for the disc `−ρ` succeeds | theorem holds; Check false (R01) |
| 5.3 fold normal form | `y − t²`; `y − t⁴`; `cos r`; parametric Morse lemma at pin | `Q = r`, `a = y`; `t⁴` fails `∂²_t < 0`; `H(s) = Σ(−s)^k/(2k)!`; pin gives `k = k(y,0) − cϑ²` | holds |
| 5.4 `contMDiffOn_exitTime` | disc at `(0,−1)`; annulus `1 ≤ \|x\| ≤ 2`; `[a,b]` | `τ = 2 sin θ` or `0`, slopes `2`, `0` at glancing (excluded set); annulus jump `3/2+√3` vs `→ 3/2` (not convex); `(b−x)/v` | holds |
| 5.4 `exists_contMDiff_eq_exitTime_sub_exitTime_neg` | unit ball; `[a,b]` | `σ = −2⟨x,v⟩`, `d/dt = −2`; `F = v(a+b−2x)`, `dF(X) = −2v² = −2` | holds |
| 5.4 `exists_contMDiff_eq_exitTime_mul_exitTime_neg` | unit ball; `[a,b]` | `T = 1 − \|x\|²`; `(b−x)(x−a)`; `σ² + 4T = (b−a)²` gives `τ = b − x` | holds |
| 5.5 `isNonTrapping_tfae` | ball, `u = \|x\|²/2`; closed `M ≠ ∅`; `M = ∅`; half-circle, `n = 0` | `τ ≤ 2`; all three false; all three true; `τ = π/2 ∓ θ`, all true | holds |
| 5.6 `scatteringRelation_involutive` | ball; `[a,b]`; glancing `z`; zero vector | `α(x,v) = (x − 2⟨x,v⟩v, v)`, `α² = id`; `α(a,+1) = (b,+1)`, no fixed points; glancing: `τ = 0` both ways, `α z = z` | holds |
| 5.6 `exists_contMDiffOn_eq_scatteringRelation` | ball; disc lens data at `(0,−1)`, `w = (c,0)` | ball formula smooth on `TN`; `\|L\|² = c²(2c²−1)² + 4c⁴(1−c²) = c²`, `ℓ = 2√(1−c²)` | holds |
| 6.4 small geodesic balls | `S^{n+1}`; `S¹`; flat torus | eigenvalue `2s cot s < 0` for `s > π/2`, so `r_p ≤ π/2`; `θ²` smooth on `B(p,π)`; torus `II = 4h = h/R`, `τ ≤ 1/2` | holds |

- Source locators checked against the text: 62 (41 `paternain-salo-uhlmann2023`, 13 `stefanov-uhlmann-vasy2021`, 8 `uhlmann-vasy2016`), covering every sampled target. One locator does not state its claim (R02).
- Library: all 86 backticked qualified names of the README resolve at the pins (66 by `#check`, and 20 in modules without object files by their declaration and namespace). Opened and read: `TauCeti.Manifold.IsGeodesicCurveOn`/`IsGeodesicCurveOnFrom` (`Riemannian/Geodesic/Basic.lean:102,134`), `curveVelocityWithin` (`MFDeriv/Curve.lean:135`), `TauCeti.IsOutwardPointing` (`Boundary/Orientation.lean:46`), `hessian` (`Riemannian/Laplacian.lean:135`), `exists_parametric_morse_chart` (`Morse/Parametric.lean:100`), Mathlib `IsImmersionAt` (`Immersion.lean:191`) and `IsSmoothEmbedding` (`SmoothEmbedding.lean:70`).
- Cross-roadmap citations resolved on main: DifferentialGeometry 5.1, 12.1–12.3 and 12.5 (`exists_halfSpaceOutwardUnitNormal`); HopfRinow Layers 1–2; RiemannianGeometry R5a, R5c items 1 and 3, R7.9; Surfaces 1.2–1.3; GeometricTopology 1.1 and 1.3; ComplexKahlerGeometry K5a; SmoothBundlesConnections B6.0 (also present at its open revision's head); AffineMorseLefschetz 4.5; PositiveMass 5.1. No supplier is upward.
- Gate: every check passes. Dependency check: `depcheck: 256 roadmaps, 2432 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives 11 `sorry` warnings and nothing else. I compared all 22 elaborated signatures with the README and found no change needed: `IsBoundaryDefiningFunctionOn` drops `[IsManifold]`, which none of its fields use. `‖·‖` and `inner` on tangent spaces resolve to the Riemannian-bundle instance.
- Padding probe: `first | rfl | infer_instance | simp | simp_all` closes none of the 11 theorems. All 11 headline theorems listed in the Summary are stated, and none is padding.
- Overlap check: read ManifoldOptimization, LorentzianGeometry, Varifolds, HyperbolicDynamicsAndThermodynamicFormalism and SmoothBundlesConnections (open), and RiemannianGeometry, HopfRinow and Surfaces (main). Each shared object is cited from its owner: R5a's `B` and R5c's domain presentation and R7.9's collar (RiemannianGeometry), normal strips (Surfaces), and B6.0 radii (SmoothBundlesConnections). Nothing is owned twice.
- Source independence: 13 passages compared with 3 sources; nothing is shared beyond formulas and hypothesis lists. The largest share is `paternain-salo-uhlmann2023`, 47 of 87 source citations. Contents compared with its Ch. 3 §§3.1–3.3: independent. Layer 5's order 5.2 → 5.4 → 5.5/5.6 is forced by their *Needs:* on 5.4, and Layers 1–4 and 6 map to no run of sections.

## Not verifiable

- `lee-riemannian2018` (Ch. 5 pp. 133–136; Ch. 6 Lemma 6.16, Theorem 6.17; Ch. 7–8): settled as uncertified, no legal copy; cited by locator.
- `lee-smooth2012` Theorem 9.25: settled as uncertified, no legal copy.
- `sharafutdinov1994` Ch. 4: settled as uncertified, no legal copy.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, p. 64: the source defines `T` as `τ(x, v)` times `τ` evaluated at `(x − v)`; it should be `τ(x, v) τ(x, −v)`; affects nothing.
- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), p. 47: the source requires `b′(1) > 0`; it should be `b′(r₁) > 0`, the outer radius of `{r₀ < r ≤ r₁}`; affects nothing.

## For the human reviewers

- none
