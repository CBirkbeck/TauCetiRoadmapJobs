<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13845#issuecomment-6798949556 -->
Review (claude) of ee86048

Verdict: needs_changes

1. **F01** (P2) GeometricCurrents G2 is cited for a volume comparison it does not state

   **Location:** `packages/Varifolds/design/README.md:510`, "which is the Riemannian volume
   `TauCeti.riemannianVolume` of Σ with the induced metric, pushed into W (GeometricCurrents G2's
   comparison of mass and Riemannian volume)"; also `README.md:221` (supplier contract) and the
   *Needs:* line at 522–524; `packages/Varifolds/design/plan.json`, target 2.3.

   **Claim:** G2 supplies `Hᵏ⌞Σ = Riemannian volume` for the Σ of 2.3: C¹, embedded, possibly
   non-compact, non-orientable, not closed.

   **Witness:** `TauCetiRoadmap/GeometricCurrents/README.md:268–272` (main): the identification is for
   "the current of a compact oriented smooth source P" under an isometric embedding. The graph of
   `|t|^{3/2}` (9.1's own Check) and the open half-line of 2.3 are outside it.

   **Exact repair:** Keep the bullet as this roadmap's own statement and give its route: by
   `TauCeti.eq_riemannianVolume_iff` (`TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean`)
   it suffices to compare on chart sources of Σ; there Σ is a C¹ graph, GeometricMeasureTheory G2's
   area formula (injective case, agreement on C¹ graphs) gives the chart Hausdorff measure as
   `∫ √det(g_Σ) dt`, and GeometricCurrents G2's chart comparison of Hᵏ passes to d_g. Reword the
   contract line at 221 to what G2 states (compact oriented smooth sources) and cite it only as the
   agreement case. Tested on the witness: for `t ↦ (t, |t|^{3/2})` the area formula gives
   `∫ √(1 + (9/4)|t|) dt`, which is the chart volume of the induced continuous metric
   (`riemannianVolume` needs only `IsManifold I 1` and a continuous metric, Volume.lean line 60–63).
   The statement of 2.3 does not change; 5.1 and 6.4, which use it for C² Σ, are covered by the same
   route.

2. **F02** (P2) R5a's second fundamental form is cited for C² submanifolds

   **Location:** `README.md:874–876`, "Σ ⊆ W be a C² embedded k-submanifold … H_Σ = (1/k) tr B be its
   averaged mean curvature (RiemannianGeometry R5a, R5a.2)".

   **Claim:** R5a and R5a.2 define B and H for the C² Σ of 5.1.

   **Witness:** `TauCetiRoadmap/RiemannianGeometry/README.md:2842`: "For a smooth isometric immersion
   f:M→N, construct …"; R5a.2 (line 2997) inherits it. A C² graph such as `t ↦ (t, |t|^{5/2})` is not
   a smooth immersion.

   **Exact repair:** In 5.1 say that for C² Σ, B is the Conventions' formula `B(X, Y) = (∇_X Y)^⊥`
   on C¹ tangent fields (continuous, tensorial) and `H_Σ = (1/k) tr B`, and that for smooth Σ these
   are R5a's and R5a.2's objects. On the witness, B at t is `u''(t)(1 + u'²)^{−3/2}` times the unit
   normal with `u'' = (15/4)|t|^{1/2}`, continuous, so 5.1's formula and its route (which already
   treats C² separately) apply. Same wording for the C² Σ of 6.4 and reg² in 9.1, which use only 5.1's
   conventions.

3. **F03** (P3) "only when U is surjective" fails for k = 0

   **Location:** `README.md:291–292`, "this subset is all of G(F, k) only when U is surjective"
   (passage added by the last repair).

   **Claim:** For every admitted k, the image of `P ↦ U P U*` is all of G(F, k) only for surjective U.

   **Witness:** k = 0 (admitted: 0 ≤ k ≤ dim E), U : ℝ → ℝ², t ↦ (t, 0). G(ℝ, 0) = {0},
   `U 0 U* = 0`, G(ℝ², 0) = {0}: the image is everything and U is not surjective.

   **Exact repair:** "for k ≥ 1 this subset is all of G(F, k) only when U is surjective; for k = 0
   both sides are {0}". For k = 1 and the same U the image is {diag(1, 0)} ≠ G(ℝ², 1), as the existing
   Check computes; for k = 0 the corrected sentence gives {0} = {0}. Add the k = 0 case to the Check.

4. **F04** (P3) The chart-level total variation measure exists at the pin and is not cited

   **Location:** `README.md:725–729`, route of 4.2: "the vector measure they form has total variation
   ‖L‖ on U and polar density η".

   **Claim:** The total variation measure with its open-set supremum formula has to be built here from
   the scalar Riesz components.

   **Witness:** `TauCeti/Analysis/Distribution/Mass/Measure.lean` line 191 (`Distribution.massMeasure`)
   and line 213 (`massMeasure_preimage_coe`: its value on Ω ∩ U is the supremum of `|T φ|` over tests
   with `‖φ‖ ≤ 1` supported in U), for F-valued test functionals of locally finite mass on a Euclidean
   open set.

   **Exact repair:** Add `TauCeti.Distribution.massMeasure` and `massMeasure_preimage_coe` to "From
   Tau Ceti" and to 4.2's *Needs:*, and let the route take ‖L‖ on a frame domain from it (in a
   g-orthonormal frame `|X|_g` is the Euclidean norm of the components; smooth tests are dense in the
   continuous ones for the supremum). 4.2 keeps what the pin lacks: the polar field η, continuous
   fields, and gluing over W. On 4.2's Check `L(X) = ∫ (X¹ + X²) dy` the pinned supremum is
   `√2·vol(U)`, the stated value, and not the coordinatewise `2·vol(U)`.

5. **F05** (P2) The a.e. ball-ratio bound of 6.3 is stated on M but routed only in charts

   **Location:** `README.md:1025–1026`, "whenever ‖δV‖(B_ρ(x)) ≤ Λ‖V‖(B_ρ(x)) for all small ρ; this
   holds for ‖V‖-a.e. x ∈ W, so Θ^k(‖V‖, ·) exists ‖V‖-a.e."

   **Claim:** On a manifold the geodesic-ball ratio bound holds at ‖V‖-a.e. x, and a.e. existence
   follows from it.

   **Witness:** The route at 1040–1044 gets the bound only on chart-Euclidean balls;
   `Besicovitch.ae_tendsto_rnDeriv` (`Mathlib/MeasureTheory/Covering/Besicovitch.lean:1077`) needs
   `HasBesicovitchCovering`, whose only instance is for normed spaces (`BesicovitchVectorSpace.lean:500`).
   Passing to geodesic balls needs doubling, i.e. Θ(x) > 0 (3.3's own caveat).

   **Exact repair:** "…for all small ρ. In E this holds for ‖V‖-a.e. x (Besicovitch). On M, Θ^k(‖V‖, ·)
   exists ‖V‖-a.e. by the route below, and the geodesic-ball bound holds at ‖V‖-a.e. x with
   Θ^k(‖V‖, x) > 0 (chart bound, nesting and `‖V‖(B̄_{c²r}) ≤ (c^{2k} + 1)‖V‖(B̄_r)`)". This is all 7.3
   (iv) uses, since there Θ > 0 a.e. I recomputed the route: with f(t) = t^{−k}‖V‖(B̄_t(x)), 6.2 gives
   `f(σ') ≤ f(ρ) + 2Cρ·max(sup_{[σ,ρ]} f, sup_{[ρ,c²ρ]} f)`, so sup f is bounded once 2Cρ < 1/2, and
   then lim sup_σ f ≤ f(ρ) + C'ρ; the a.e. existence stands without the geodesic bound.

Five findings, each with a repair to apply: three P2 (R01, R02 and R05: a supplier cited beyond what
it states, twice, and an almost-everywhere claim wider than its route) and two P3 (R03, R04). No P1.
All ten findings of REV-DESIGN-Varifolds~3 are repaired. No declared gaps. No file of the design and
no manifest entry was edited; no source was fetched (all eight cited works are already recorded). No
maintainer notes were supplied for this roadmap.

## Verified sound

### Previous review, finding by finding

| Prior finding | Repaired passage | Status and my test |
|---|---|---|
| ~3/R01 | 1.1: "A surjective linear isometry U … P ↦ U P U⁻¹"; "Any linear isometry U … P ↦ U P U* … onto the closed subset" | **Repaired.** U(t) = (t,0): U*U = 1, U1U* = diag(1,0), diag(0,1) missed; with L = U, Q*Q + 1 − P = 1 and QA⁻¹Q* = UPU*. Residual k = 0 slip is R03 above. |
| ~3/R02 | 6.4: "∫ θ̃ ∂_i φ dt = 0: the distributional derivatives of θ̃ itself, with respect to coordinate Lebesgue measure dt and not to θ̃ w" | **Repaired.** g = e^{2t}dt²: w = e^t, div_g X = e^{−t}(e^t X)', δ[ℝ](X) = ∫(e^t X)' dt = 0, θ̃ = 1 constant, (θ̃w)' = e^t ≠ 0. X^i = φ/w is C¹ because w is C¹ for C² Σ. |
| ~3/R03 | Layer 7: "Convergence of the V_i is not part of the setting: 7.1 assumes it and 7.4 produces it along a subsequence"; 7.4: "there are a strictly increasing sequence i_1 < i_2 < …" | **Repaired.** Lines y₂ = 0 / y₂ = 1 alternating: masses 2R and 2√(R² − 1) ≤ 2R, test integrals 1, 0, 1, 0; hypotheses hold, two subsequential limits. Matches Simon1983 line 7886–7898. |
| ~3/R04 | 7.2: "Dilation invariance of the weight uses non-radial tests … ∫ (k h + y·∇h) d‖C‖ = 0" | **Repaired.** d/dλ[λ^{−k}∫h(y/λ)] = −λ^{−k−1}∫(k h_λ + y·∇h_λ) = 0. Control μ = (1 + ½ sin log r cos ϑ) dr dϑ: μ(B_ρ) = 2πρ, λ⁻¹∫_{B_λ} cos ϑ dμ = (π/4)(sin log λ − cos log λ) = −π/4, +π/4 at λ = 1, e^π. Simon1983 line 3461–3481 read. |
| ~3/R05 | 4.2 is now Riesz representation, 4.3 stationarity; "*Needs:* Layer 4.1, Layer 4.2" | **Repaired.** plan.json: 34 distinct ids, no prerequisite at or after its target (script), 4.2 has no target prerequisite. `sources.toml` `cited_for` follows (Federer 4.2; Agnoletto 4.3). |
| ~3/R06 | 4.5: "For the flat metric g = e this is at most k|c^k − 1| sup|DX| ‖V‖(K)" plus the non-flat control | **Repaired.** g = e^{4t}dt²: Γ = 2, div_g X(0) = 2, δ_hV^h = 4, left side 2 > 8/(3√3) = 1.5396; ‖h − g‖_{C⁰} = 3e⁴. |
| ~3/R07 | 7.4: "‖δV_i‖(ℝ²) = √2(i − 1) + 2" | **Repaired.** Corner: (1,1)/√2 − (1,−1)/√2 = (0,√2), norm √2; endpoints 1 each; i = 2 gives √2 + 2. |
| ~3/R08 | 7.5: "‖δ_h W‖(B_3(0)) < ε², ∫ ‖P_S − p‖ dW < ε²"; "The case h ≠ e … is this roadmap's" | **Repaired.** Simon1983 line 7991–8000 read (ε ∈ (0, δ²), bound (1 + δ)(ω2ⁿ)⁻¹μ(B₂(x)) + δ). m-plane: m ≤ (1+δ)m + δ; two sheets, k = 1: ratio 2√(1 − ε²/16). |
| ~3/R09 | 4.2 Check: "For v ≠ 0 … For v = 0, L = 0 and ‖L‖ = 0, and no value of η is determined" | **Repaired.** v = 2e₁: 2δ₀, η(0) = e₁; v = 0: zero measure, no quotient formed. |
| ~3/R10 | 9.4: "Σ = reg^∞[Σ] (Σ is the whole regular set of its closure, Simon's standing convention…)" | **Repaired.** Simon2023 line 81–83 read. Punctured ℝ⁸×{0} in ℝ⁹: H⁸({0}) = 0, same varifold, origin regular but missing, convention violated. |

Same-pattern search on the repaired patterns over the whole text: isometry statements (1.2, 3.1,
4.4, 9.2 now say "onto" or use `df P df*`); coordinate-density arguments (5.1 applies the flat
divergence theorem to w·Y, correct); assumed convergence (only 7.1, explicit); endpoint atoms (7.1:
2i for i segments; 6.5: two unit atoms; 8.1: 1); normalised vectors (θ'/θ with θ ≥ 1, co-normals).
Nothing further beyond R03. No finding of the repair report was marked not actionable.

### Principles, shape, plan

Read all 1578 lines, 34 targets. No route-specific narrowing (arbitrary Radon varifolds, k = 0 and
k = N kept through Layer 5, general metrics), no re-planned roadmap, no algorithm, no copied
passage, no gap declared and none needed, no `set_option`/Lean file at this stage. The layer order
is forced by the *Needs:* lines (first variation needs push-forward; monotonicity needs the Riesz
decomposition; rectifiability needs densities, constancy and tangents); no layer is named after a
source chapter. Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to
read the build, nine layers each ending in Examples and Dependencies, Downstream consumers,
References; 34 `**Checks.**` blocks, every definition with ≥ 3 Checks and an API (plan: 12
definitions/constructions, tests 3–6 each). Grep for process words, pull-request numbers, machine
paths, LaTeX delimiters, HTML anchors, `lemma` as a keyword, numbering tables: none. No backticked
name is presented as this roadmap's own (the 50 backticked identifiers are library names).

### Adversarial table (values computed this round)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 1.1 isometry / image plane | U(t) = (t,0), k = 0, 1; L = diag(1,0), P = P_{ℓ₀} | k = 1: image {diag(1,0)} ≠ G(ℝ²,1); k = 0: {0} = {0}; A = 1, QA⁻¹Q* = P_{ℓ₀} | R03; else sound |
| 1.2 bundle, metric change | h = diag(1,4), u = (1,1) | h(e₁,u)/h(u,u) = 1/5 vs Euclidean 1/2; h = c²g: same projection | sound |
| 1.4 convergence | δ_{(je₁,P)}; jδ_{(0,P)} | masses 1 → limit 0; test integrals j → ∞ | sound |
| 2.1 normalisation, chart | H¹⌞L, Lebesgue, δ₀; φ = 2·id | 2λ·λ⁻¹ = 2; πλ → 0; λ⁻¹ → ∞; φ_*μ = ½H¹⌞L = θ/J with J = 2 | sound |
| 2.1 on M | φ∘exp_x(λv) = φ(x) + λdφ_x v + o(λ) | θHᵏ(T ∩ dφ⁻¹A) = (θ/J)Hᵏ(dφT ∩ A) | sound |
| 2.3 weight | graph of `|t|^{3/2}`; half-line | ∫√(1 + (9/4)|t|) dt = chart volume; support [0,∞)×{0} | R01 (attribution) |
| 3.1 push-forward | 2·id; (y₁,0) on vertical segment; t² on [−1,1]; k = 0 | mass 1 → 2; J = 0 → 0; 2∫₀¹φ, density 2; J = 1 (empty normDet) | sound |
| 3.3 doubling example | `|y₁|H¹⌞L + |y|⁻¹L²`; weight e^{−1/|y₁|} | r² + 2πr, Θ¹(0) = π; 9r² vs r²; ratio ≥ e^{1/r − 1/(2r)} = e^{1/(2r)} | sound |
| 4.1 first variation | circle, X = ψy; vertical lift, X = ψy₂e₂ | 2π = d/dt 2πe^t; ∫ψ ≠ 0 with X = 0 on support | sound |
| 4.2 Riesz | ⟨X(0),v⟩, v = 2e₁, 0; ∫(X¹ + X²) | 2δ₀, e₁; 0; √2 L², η = (e₁+e₂)/√2 | sound; R04 |
| 4.4 decomposition, dilation | θ = 1 + y₁²; step 1→2; circle R | H = (θ'/θ)e₁; σ = δ₀, η = −e₁; div(Y∘η) = λ⁻¹(div Y)∘η ⇒ λ^{1−k}, H_λ∘η = λH | sound |
| 4.5 two metrics | g = e^{4t}dt², h = 4g; blow-up | 2 vs 1.5396; (λ⁻¹exp⁻¹)*g̃_λ = λ⁻²g; ‖δ‖ scales λ^{−k}·λ; D²g̃_λ = λ²D²g̃ | sound |
| 5.1 submanifold | S^k, X = ψx; S^{N−1} outward ν | kHᵏ(S^k) both sides; S_ν = −id, H = −(N−1)x | sound; R02 |
| 5.2 inclusion | great S^k ⊂ S^N, X = x | X^⊤ = 0, −∫⟨x, −kx⟩ = kHᵏ; |H_V + tr B|² = |H_V|² + |tr B|² ≥ |H_V|² | sound |
| 6.1 identity | circle, σ < 1 < ρ; exponential form | 2π/ρ = 2π − 2π(1 − 1/ρ); (e^{Λρ}f)' ≥ e^{Λρ}J' ≥ J' | sound |
| 6.1 weighted | line, h = t² | I = c₂ρ³, LHS 2c₂ρ; RHS ρ⁻²∫φ·t·2t = 2c₂ρ | sound |
| 6.2 Riemannian | (1 − x cot x)/x at π/2; great circle | 2/π ≤ 1 so term ≤ k√κ‖V‖(B̄_t); ratio 2, e^ρ·2 increasing | sound |
| 6.3 densities | crossing lines, triple junction, step | 2, 3/2; step: Θ(0) = 3/2 < 2 = lim sup | sound; R05 |
| 6.4 constancy | g = e^{2t}dt²; v(L,3); sin(1/t) graph | θ̃ = 1, (θ̃w)' = e^t; θ₀ = 3; length ≥ ∫₁^∞|cos u|du = ∞, V = 0 branch | sound |
| 6.5 convex hull | X = ψγ(r)(y − ξ) | div_S X = kγ + γ'|P_S(y − ξ)|²/r ≥ kγ; k ≥ 1 needed | sound |
| 7.1 semicontinuity | i segments of length 1/(2i) | Θ = 1, ‖δV_i‖ = 2i, limit density ½ | sound |
| 7.2 tangents | ball masses; angular control | ‖C‖(B_ρ) ≤ Θω_kρ^k ≤ ‖C‖(B̄_ρ) ∀ρ ⇒ equality; ∓π/4 | sound |
| 7.3 rectifiability | cone C, y ≠ 0 | ρ^{−k}‖C‖(B_ρ(y)) ↑ Θ(x)ω_k as ρ → ∞ and ≥ ω_kΘ(C,y) ≥ ω_kΘ(x): constant | sound |
| 7.4 compactness | alternating lines; zigzag i = 2 | 1,0,1,0; √2 + 2 | sound |
| 7.5 multiplicity | m-plane; tilted plane, counted point | m ≤ (1+δ)m + δ; d < ε, ratio ≥ (1 − ε²/4)^{k/2} | sound for small ε(k) |
| 8.1–8.2 cones | ½v(L,1); step; integral stationary V | VarTan = {½v(L,1)}; ρ⁰‖δV‖(B_ρ) = 1 ↛ 0; {Θ < 1} null, D²g̃_λ → 0 | sound |
| 9.1 regular set | graph of `|t|^{3/2}` | u' = (3/2)|t|^{1/2}sgn t continuous, u'' unbounded: reg¹ ∖ reg² | sound |
| 9.2 invariance | dilation of circle R | |H| = λ/R, Θ = 1 | sound |
| 9.4 statements | K = ∅; n ≥ 8 | closure = reg = Σ; EdelenSpolaor2023 line 120: every C_{p,q} minimizing for n > 7 | sound |

### Sources: the seeded sample, read at the locators

| Target | Text opened | Outcome |
|---|---|---|
| 1.2 | Simon1983 line 7301–7305; Agnoletto line 151–156 | G_n(A) = A × G, compact over compacts; bundle definition. Match. |
| 1.4 | Simon1983 line 1038–1045 (4.4), 7336–7338, 7739–7740 | Vague convergence, compactness under local mass bounds. Match. |
| 2.1 | Simon1983 line 2276–2301 (11.4–11.6), 2352–2374 (11.8–11.9) | Criterion with θ ∈ (0,∞) μ-a.e., conclusion μ = Hⁿ⌞θ; converse. Match. |
| 3.1 | Simon1983 line 7443–7454 (39.1), 2903–2933 (15.6–15.7); Agnoletto line 188–195 | C¹, proper on spt, J_S f, set {J ≠ 0}; multiplicity sum over fibres. Match. |
| 4.1 | Simon1983 line 7455–7473 (39.2), 1860–1956 (9.1–9.3); Agnoletto line 179–187, 210–212; Scharrer2022 line 87–98 | Definition, derivative of mass. Match. |
| 4.2 | Simon1983 line 857–882 (4.1–4.2) | Hilbert-valued Riesz theorem and the open-set supremum. Match; the manifold version is the roadmap's, with a route. |
| 4.5 | Agnoletto line 1788–1810; Simon1983 line 7336–7338 | Chart preservation asserted without argument, as the README says. Statement is the roadmap's own. |
| 5.1 | Simon1983 line 1950–1973 (9.3, 9.5(2)), 2979–2988 (16.6(1)) | First variation of C² M, stationarity iff H = 0. Match (closedness in W is the roadmap's form of 9.5(2)'s compactness condition). |
| 6.1 | Simon1983 line 3016–3076 (17.2–17.5), 7513–7547 (40.1–40.4), 3205–3221 (18.1) | 40.2 and 40.3 match; 40.4 printed with +δV(X) (see Source issues), roadmap's sign verified above. |
| 6.4 | Simon1983 line 7664–7732 (41.1–41.2(1)) | Statement, closedness remark, proof steps (1)–(5) and the coordinate multiplicity. Match. |
| 7.2 | Simon1983 line 7733–7774 (42.1–42.3), 3414–3481 (19.3) | Hypothesis 42.1, stationarity, 42.2; degree-zero homogeneous weights. Match. |
| 7.4 | Simon1983 line 7886–7898 (42.7) | Any sequence, subsequence, lim inf. Match. |
| 8.2 | Simon1983 line 7793–7805 (42.6), 7899–7912 (42.8); EdelenSpolaor2023 line 109–112 | Match. |
| 9.1 | Agnoletto line 89–92 (Definition 1.2); Simon2023 line 73–83 | C¹ regular set; smooth hypersurface case and convention. Match. |
| 9.2 | Simon1983 line 7443–7454 | Supports the push-forward only; the invariance list is marked "this roadmap". Correct attribution. |

Also read: Scharrer2022 line 823–854, 1120–1127, 1184–1203 (6.2); Simon1983 line 3373–3400
(6.5), 7550–7583 (6.3, 7.1), 7986–8050 (7.5); Simon2023 line 84–96, 432–441 and EdelenSpolaor2023
line 104–135 (9.4). No locator was flagged unverified by the author.

### Pins, suppliers, direction, overlaps

- Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, equal to `lake-manifest.json` and to the plan's
  baseline. All 50 backticked identifiers resolve at the pins (mechanical grep, each hit read);
  opened this round: `Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure`
  (`Mathlib/MeasureTheory/Measure/Regular.lean:1183`, pseudometrizable σ-compact),
  `Measure.ext_of_integral_eq_on_compactlySupported` (`…/RieszMarkovKakutani/Real.lean:408`, two
  regular measures), `Vitali.vitaliFamily` (`…/Covering/Vitali.lean:460`: doubling at every point of
  the space, so 3.3 must take D' itself as the space, as its wording "on a Borel set D'" does),
  `Besicovitch.ae_tendsto_rnDeriv` (`Besicovitch.lean:1077`), `TauCeti.riemannianVolume`
  (`Volume.lean:82`, C¹ manifold, continuous metric), `TauCeti.CountablyRectifiable` and
  `mono`/`congr`/`iUnion`/`image` (`Rectifiable/Basic.lean:44, 74, 78, 122, 135`),
  `TauCeti.RealRMK.posPart`/`negPart` (`Signed.lean:160, 205`). No varifold or approximate
  tangent carrier at either pin (grep). Duplication by object: R04.
- Suppliers, resolved on main at its head `9f7c032`: GeometricCurrents G1 (line 219–238,
  distributional constancy criterion), G2 (240–275; R01), G5 (583), G6 (668–683: unoriented
  Grassmann bundle, compactness, auxiliary varifold, first variation, monotonicity, tangent cones);
  GeometricMeasureTheory G2 (148–181); RiemannianGeometry R4 item 1 (2108–2115), R5a (2840; R02),
  R5a.2 (2997–3037); HopfRinow (Completed) Layers 0–2 (229, 264, 427). None of the four suppliers has
  an open revision in the list of open pull requests given to this job.
- Ownership against open work: `roadmaps grep` for varifold, approximate tangent, Allard,
  monotonicity formula, Grassmann bundle over the 419 open heads and main: only GeometricCurrents
  and GeometricMeasureTheory on main mention them, and GeometricMeasureTheory excludes varifolds
  (line 12). The closest open roadmaps (RicciFlow, ManifoldOptimization, PointProcesses,
  QuasiregularMaps, YangMillsConnectionsAndCaloricGauge) own none of these objects (scope sections
  read for the last two; the first three as in the earlier round). The board package index (three
  number-theory packages) was read. Overlap report: no conflicting pull request, no dropped id, no
  revision-only id. No roadmap cites Varifolds, so the 4.2/4.3 renumbering breaks nothing.
- Dependency check:

      candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
      depcheck: 208 roadmaps, 1916 edges, 0 problem(s)

  No UPWARD or CYCLE line. `roadmaps resolve`: no cross-roadmap citation and no Lean name found
  nowhere (the tool says it did not check library names; the pin check above did).

### Headlines and Lean form

Headline theorems (Summary): Riesz decomposition (4.4); monotonicity, Euclidean and Riemannian
(6.1–6.2); densities (6.3); Allard rectifiability (7.3); rectifiable and integral compactness (7.4,
7.6); varifold tangents and cones (7.2, 8.1–8.2); constancy (6.4); intrinsic versus ambient (5.2);
comparison with GeometricCurrents G6 (9.3). This is the design stage: there is no `Suggested.lean`,
so there is nothing to probe for padding, no binder check and no import header. Elaboration: not
available (this lane does not elaborate). For the package: the general-varifold headlines (4.4,
6.1–6.3, 6.5, 7.2 and the measure part of 7.4) are statable on native carriers with a few real
definitions; those needing weighted approximate tangent planes, submanifold predicates or the
supplier's currents (7.3's conclusion, 7.6, 8.x, 6.4, 5.2, 9.3) must be named in the module
docstring with the missing carrier unless stated without stand-ins.

## Not verifiable

- Federer1969 2.5, 2.8, 3.2; Allard1972 Sections 3–6, 8; Maggi2012 Part II: settled as
  uncertified, cited by locator only; not requested.
- 7.5 for h ≠ e: no accessible source states it; the README marks it as its own and gives a route
  whose error accounting (`ε²σ(1 + σ/τ) ≤ 2εσ/τ` for ετ ≤ 1, εσ ≤ 1) I checked, but the full
  induction is not certified by a text. The formulas of Simon1983 42.9–42.10 are partly lost in the
  OCR text (line 7991–8012); I read the surviving parameters (ε ∈ (0, δ²), the bound with
  (1 + δ) and + δ, L(A) < δ) and relied on the earlier page-image reading for the ε² thresholds.
- Lean elaboration, one-tactic probes, `#check` comparison: no Lean file at the design stage.

## Source issues

- **Misprint** in Simon1983 at 40.4, printed page 236: the source says the weighted radial identity carries the first variation with a plus sign; it should be a minus sign, as 18.1 with δV(X) = −∫H·X gives; affects a stated result.
- **Misprint** in Simon1983 at proof of 42.8, printed page 250: the source says the maximum of the fibre multiplicity and N converges to the limit multiplicity; it should be the minimum, since a maximum with N above the limit cannot converge to it; affects the proof.
- **Gap** in AgnolettoCorreaHoyosDaSilvaNardulli2025 at proof of Theorem 2.32, arXiv v3 page 17: the source says locally bounded first variation is preserved by a bi-Lipschitz chart push-forward, without argument; it should be supplying a metric comparison, since the change of metric adds a term in the derivative of the test field; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ee860484e081b389b3f30d7230cb82ecaa83f754", "job": "REV-DESIGN-Varifolds~4", "model": "fable", "worker": "chris-x10"} -->
