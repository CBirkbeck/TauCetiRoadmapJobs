<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18010#issuecomment-6908467323 -->
Red team round 2 pass a (claude) of afb3867

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the three Euclidean tangent theorems carry a hypothesis that their own `hδ` implies

   Location: `packages/Varifolds/Suggested.lean:444`, `:521`, `:537`,
   "`(hV : HasLocallyBoundedFirstVariation V)`"; `packages/Varifolds/README.md:1629`, "with locally
   bounded first variation on a neighbourhood of x ∈ W".

   Claim: the Lean statements are at the README's generality (first variation bounded near x).

   Witness: `hδ` forces `firstVariationMass V (Metric.ball x ρ) < ⊤` for small ρ, which is bounded first
   variation near x. In ℝ², k = 1: V = v(x-axis, 1) + the vertical lift of H¹⌞{y₂ = 5}, x = 0: `hdens`
   (θ = 1) and `hδ` (‖δV‖(B_ρ(0)) = 0 for ρ < 5) hold, C = v(x-axis, 1), `hV` fails (4.3's Check).

   Repair: in `Euclidean.IsVarifoldTangent.isStationary`, `Euclidean.IsVarifoldTangent.isRectifiable`
   and `Euclidean.IsVarifoldTangent.isIntegral` delete the binder
   `(hV : HasLocallyBoundedFirstVariation V)`. Docstrings: in the first, replace "If `V` has locally
   bounded first variation in `W`, `Θ^k(‖V‖, x)` exists and is finite at `x ∈ W` and" by "If
   `Θ^k(‖V‖, x)` exists and is finite at `x ∈ W` and"; and after "as `ρ ↓ 0`" add "(so that `‖δV‖` is
   finite on small balls about `x`: `V` has bounded first variation near `x`)"; in the other two
   replace "(locally bounded first variation, a finite density at `x` and `ρ^{1−k}‖δV‖(B_ρ(x)) → 0`)"
   by "(a finite density at `x` and `ρ^{1−k}‖δV‖(B_ρ(x)) → 0`)". `Euclidean.HasLocallyBoundedFirstVariation`
   is then used by no theorem: delete it from `Suggested.lean`, and in `README.md:1028–1029` replace
   "and for W ⊆ E `Euclidean.IsStationary` and `Euclidean.HasLocallyBoundedFirstVariation`" by "and
   for W ⊆ E stationarity is `Euclidean.IsStationary`". In `README.md:1647` replace "under all three
   hypotheses of the first paragraph" by "under the density and decay hypotheses of the first
   paragraph (the decay hypothesis, stated with `Euclidean.firstVariationMass`, contains the bound on
   the first variation near x)". Tested on the witness: the repaired statements apply to V at 0 and
   give C stationary, ‖C‖(B_ρ(0)) = 2ρ = 1·ω_1·ρ and ‖C‖(sA) = s‖C‖(A).

   Note, no change asked: the same implication makes `hV` of `monotonicity_inequality` and
   `monotoneOn_exp_mul_densityRatio` and `hbdd` of the two compactness theorems redundant (an infinite
   `firstVariationMass` on B_t makes the right side ⊤; `hΛ` and `hmass` bound it). There the README
   states the same hypothesis (6.2, 7.4, 7.6, as Scharrer2022 line 1123 and Simon1983 line 7886–7890
   do), so README and Lean agree.

2. **F02** (P3) 4.4's *Needs:* line omits Layer 3.2

   Location: `packages/Varifolds/README.md:1109`, "*Needs:* Layer 4.2, Layer 4.3; Mathlib
   `Measure.rnDeriv`, …".

   Claim: the line lists what 4.4 uses.

   Witness: 4.4's bullet "Dilations in E: `δ(V_{x,λ})(Y) = λ^{1−k} δV(Y ∘ η_{x,λ})` …"
   (`README.md:1088`) uses `V_{x,λ}` of 3.2. 3.2 is not reached through 4.2 (no layer inputs), 4.3
   (4.1, 4.2) or 4.1 (1.3, 3.1).

   Repair: "*Needs:* Layer 3.1–3.2 (the isometry and dilation laws), Layer 4.2, Layer 4.3; Mathlib
   `Measure.rnDeriv`, …" (the rest unchanged). The layer's Dependencies paragraph ("Layers 1–3") is
   already right.

Two findings, both P3. No statement of `Suggested.lean` or of the README was refuted on any
instance tried, every supplier citation resolves on main or at the pins, and the dependency check
is clean.

## Round-1 findings at this head

| Round-1 id | Status | Witness at afb3867 |
|---|---|---|
| 1a/F01, 1b/F01 (5.2 Checks) | repaired | `packages/Varifolds/README.md:1262–1277`: "The trace is over S, not over T_xM, and the curvature term enters with a minus sign. Let M be the unit cylinder …" and the helix Check. Recomputed: B(τ,τ) = −ν; vertical line tr_S B = 0 (full trace −ν); circle H = −ν (opposite sign +ν); helix γ''/\|γ'\|² = −cos²α ν = cos²α B(τ,τ). |
| 1a/F02 (`instBorelSpace`) | repaired | No `instBorelSpace` in `Suggested.lean`; `README.md:505` reads "(`grassmannBundle.instMeasurableSpace`; it is a Borel space by definition)". No remaining statement mentions a `BorelSpace` on the bundle. |
| 1a/F03, 1b/F05 (one universe) | repaired | The sentence is gone (no match for "single universe" in the README). |
| 1a/F04, 1b/F04 (Lemma 2.22) | repaired | `README.md:1357–1359`: "a differential form for a weighted, mollified mass ratio, under a two-sided bound \|sec\| ≤ K …, Lemma 2.22"; `Suggested.lean:328–330` says "compare". AgnolettoCorreaHoyosDaSilvaNardulli2025 line 524 (two-sided bound) and line 542–545 (σ-derivative) agree. |
| 1a/F05 (source chapter in the Summary) | repaired | `README.md:4`: "in the generality of Allard's theory:"; `README.md:23`: "(Allard1972; Simon1983, §§38–42)"; `README.md:160`: "(Simon1983 line 2898–2902, §15)", which is the weight-convergence convention (Simon1983 line 2898–2902). |
| 1b/F02 (docstring locators) | repaired | `Suggested.lean:418` "(Simon1983, 42.3)", `Suggested.lean:442` "(Simon1983, 42.1–42.3)"; Simon1983 line 7736 (42.1), 7763 (42.2), 7768 (42.3). |
| 1b/F03 (supplier file) | repaired | `README.md:224–233`; at the pin `InnerProductSpace.euclideanHausdorffMeasure_eq_volume` is `Mathlib/Geometry/Euclidean/Volume/Measure.lean:191`, `HasBesicovitchCovering` is `Mathlib/MeasureTheory/Covering/Besicovitch.lean:155`, `exists_isNormalDomain_ball` states `∃ r, 0 < r ∧ IsNormalDomain I M p (Metric.ball 0 r)`. |

No repair introduced an error: the new 5.2 Checks agree with 5.1 (H = −x on the unit circle) and
with the first consequence of 5.2 (bound attained, \|B_M\| = 1); the deleted instance is used
nowhere.

## Verified sound

Counts: 39 declarations of `Suggested.lean` read (24 definitions and one instance among them, 15
theorems); 34 README sections read, every line; 26 source locators opened (Simon1983 14,
Scharrer2022 2, AgnolettoCorreaHoyosDaSilvaNardulli2025 5, Simon2023 2, EdelenSpolaor2023 3); about
45 Check bullets recomputed (values below; the others were read against their statements); 15
sibling citations resolved on main (GeometricCurrents G1, G2, G5, G6; GeometricMeasureTheory G2;
RiemannianGeometry R4 item 1, R5a, R5a.2; MinimalSurfaces Scope, 3.1, 3.3; HopfRinow Layers 0, 1, 2,
4); 125 backticked
names of the README resolved (39 own, the rest found at the pinned Mathlib or Tau Ceti; none
missing).

Dependency check, output:

```
depcheck: 251 roadmaps, 2381 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The package changes only `packages/Varifolds/` (README.md,
Suggested.lean, metadata.toml, sources.toml and three reports).

Suppliers, read on main at their current text: GeometricCurrents G1 (the criterion for a scalar
distribution on a connected Euclidean open set annihilated by coordinate derivatives of smooth
tests; 6.4's tests ∂_iφ, φ ∈ C¹_c, include them), G2 (manifold/chart comparison, integer-rectifiable
and locally integral currents, mass of the current of a compact oriented smooth source), G5, G6
(unoriented fibre by orientation quotient, compactness over compact base regions, Radon
compactness, auxiliary varifold, weak first variation, monotonicity, tangent cones);
GeometricMeasureTheory G2 (approximate tangent planes, measurability of the plane field, tangential
differentiation, area formula with extended multiplicity, injective case, C¹ graphs);
RiemannianGeometry R4 item 1 (radial Hessian zero, lower bound by s_κ'/s_κ under radial K ≤ κ
before the first model zero), R5a, R5a.2; RiemannianGeometry/MinimalSurfaces Scope and ownership,
3.1, 3.3; HopfRinow (Completed). No declared gap; `design/plan.json` has `gaps = []`.

Ownership: `roadmaps grep -i varifold` over the 462 open heads and main returns only
GeometricCurrents, GeometricMeasureTheory (an exclusion) and MinimalSurfaces, all cited. No open
roadmap or roadmap on main declares a density ratio, upper density, first variation of a varifold
or a monotonicity formula for varifolds (`upperDensity` in ArithmeticStatisticsPartI is a density
of arithmetic families, another namespace). The overlap list names no pull request that changes
this roadmap, no dropped id and no second copy.

Pins: `TangentSpace` has no norm instance of its own at the pin (only `T2Space`, `Inhabited` and the
derived algebraic and topological ones), so `‖X x‖`, `⟪·,·⟫_ℝ`, `IsStarProjection p.snd` and
`Metric.ball (0 : TangentSpace I x) ρ₀` are those of the scoped `Bundle.RiemannianBundle` fibre
instances, opened by `open Bundle`. `IsNormalDomain.zero_mem` makes `hnormal` imply ρ₀ > 0.
`IsNormalDomain.image_riemannianExp_ball` gives `eball p (ENNReal.ofReal r)`, the ball of the Lean
statements. `CovariantDerivative.sectionalCurvature` is `⟨R(u,v)v,u⟩ / det Gram`, 0 on dependent
pairs, so `hcurv` over all pairs is the README's condition for κ ≥ 0.

Elaborated signatures: no Lean was run (read-only pass). `scratch/signatures.md` was compared with
the README: its 17 "dropped binder" leads are all definitions whose bodies do not use the dropped
class; every theorem keeps the full variable block. Nothing changed.

Headline theorems (README Summary) against `Suggested.lean`: Riesz decomposition (stated);
monotonicity, Euclidean and Riemannian, with existence and semicontinuity of densities (stated);
Allard rectifiability (stated); rectifiable and integral compactness (stated for a fixed metric;
varying metrics named as not statable); varifold tangents and tangent cones (stated in E;
Riemannian forms named); constancy (stated); the comparison 5.2 and the identification 9.3 (named
as not statable, with the missing carrier). Padding probe: none of the 15 theorems follows from the
library or from a definition in one step; every definition is used by a theorem (after S01,
`Euclidean.HasLocallyBoundedFirstVariation` would not be, hence its deletion there).

Policy: no pull-request number or process narrative in the README or docstrings, no `lemma`, no
`set_option`, `#eval`, `#print`, `True` placeholder or sorry'd data; one `import Mathlib` and three
`TauCeti.*` modules that exist at the pin and are used (`IsNormalDomain`, `sectionalCurvature`, the
smoothness instance of the Levi-Civita connection).

Arrangement: Simon1983 has 88 of the 139 source mentions. Its contents: §3–§4 (densities, Radon
measures), §9, §11, §15–§19 (rectifiable varifolds, monotonicity, tangent cones), Chapter 8 =
§38–§42. Layer 1 ↔ §38 (start) and §4; Layer 2 ↔ §11, §15; Layer 3 ↔ 38.1–38.4 and 39.1; Layer 4 ↔
§39, §4 and the roadmap's own 4.5; Layer 5 ↔ §9, §16, 41.2(3); Layer 6 ↔ §17, §19, §40, §41 and
Scharrer2022; Layer 7 ↔ 40.6 and §42; Layer 8 ↔ 42.6; Layer 9 has no counterpart. No one-to-one run
in order; the order 4 → 6 → 7 → 8 is forced by the *Needs:* lines of 6.1 (4.1–4.4), 7.1 (6.2–6.3)
and 8.1 (7.1–7.3).

Wording: at each of the 26 locators the README text was set beside the source, and so were the
routes of 6.5 (Simon1983 line 3381–3391), 7.2 (line 7738–7745) and 8.1 (line 7798–7805) and the
statements of 7.4 (line 7886–7898) and 9.4 (Simon2023 line 89–96; EdelenSpolaor2023 line 130–135).
The shared runs are formulas, standard names and hypothesis lists; no sentence, proof plan, table or
list of examples is reproduced.

Source independence: 26 passages compared with 5 sources, none shared; largest share Simon1983, 88
of 139 locators; contents compared with Simon1983: independent (Allard1972, Federer1969 and
Maggi2012 are uncertified and were not read).

### The adversarial pass: `Suggested.lean`

Riemannian context: `E` finite-dimensional normed, `I` boundaryless, `M` an `EMetricSpace` with
`IsManifold I ∞ M`, second countable, `RiemannianBundle`, `IsContMDiffRiemannianBundle I ∞`,
`IsRiemannianManifold I M`, Borel. Euclidean context: `F` finite-dimensional inner product space,
Borel, `W : Opens F`.

| Declaration (layer) | Instances tried | Values computed | Result |
|---|---|---|---|
| `grassmannBundle`, `instMeasurableSpace` (1) | dim E = 0, k ≥ 1; k = 0 | ∅ (every statement then has V = 0); {(x, 0)} | matches 1.2 |
| `weight` (1) | V = 0; `δ_{(x,P)}` | 0; δ_x | matches 1.3 |
| `Euclidean.grassmannian` (1) | F = ℝ, k = 0, 1, 2; `[[1,1],[1,1]]` | {0}, {1}, ∅; squares to twice itself, excluded | matches 1.1 |
| `Euclidean.weight` (1) | W a disc | measure on F, null off W | as 1.3 |
| `VarifoldTendsto` (1) | blow-ups not finite on compacts for early j | integrals junk (0) for finitely many j only | harmless: `Tendsto` is eventual |
| `IsRectifiable` (both) (2) | vertical lift with a C¹ curve meeting the axis on a set T; non-measurable θ | tangent horizontal at accumulation points of T, so vertical contact is countable, H¹-null; `withDensity` uses the lower integral | excludes the vertical lift |
| `IsIntegral` (both) (2) | non-measurable θ : M → ℕ; θ = 0 on a piece | a measurable g ≤ θ with the same density has ⌈g⌉ ≤ θ, integer valued; Γ = {θ > 0} | integer multiplicity kept |
| `Euclidean.blowUp` (3) | cone C, x = 0; s = 2, segment [0,1] | `blowUp C 0 s = C`; mass ½ | matches 3.2 |
| `firstVariation` (both) (4) | k = 0; unit circle, X = y | 0; 2π | matches 4.1 |
| `IsStationary`, `HasLocallyBoundedFirstVariation` (both) (4) | X = 0; scaling X ↦ cX | 0 ≤ C; bound with sup ≤ 1 equals C_K sup\|X\| | matches 4.3 |
| `firstVariationMass` (both) (4) | V with unbounded first variation; U ⊆ U' | ⊤; monotone in U | defined for every V |
| `exists_firstVariation_eq_riesz` (4) | k = 0; k > dim; step multiplicity 1, 2 | all 0; V = 0; H = 0, σ = δ₀, η = −e₁, ‖δV‖(U) = δ₀(U) | true |
| `unitBallVolume`, `densityRatio`, `HasDensity`, `upperDensity` (6) | k = 0; segment endpoint; atom | ω₀ = 1; ½; ⊤ | match Conventions |
| `Euclidean.monotonicity_identity` (6) | unit circle, σ < 1 < ρ; k = 0; cut-off derivation with φ ↑ 1_{[0,1)} | 2π/ρ = 2π − 2π(1 − 1/ρ); both sides ‖V‖(annulus), last term 0 by `hrep`; open balls and σ ≤ r < ρ | true as typed |
| `monotonicity_inequality` (6) | κ = 0; S², k = 2; ‖δV‖(B_t) = ⊤ | no curvature term; f(0+) = π > f(π/2) = 8/π, gain ≥ 8 − 5.1σ; right side ⊤ | true; Scharrer2022 line 1120–1127, 1184–1203 |
| `monotoneOn_exp_mul_densityRatio` (6) | Grönwall with g(σ) = f(ρ) + c∫_σ^ρ f; ρ₀ ≤ 0 | (e^{cσ}g)' = c e^{cσ}(g − f) ≥ 0; `Ioo 0 ρ₀ = ∅` | true |
| `ae_hasDensity` (6) | v(L, e^{−1/\|t\|}) at 0 | null point; density 0 exists there | true |
| `hasDensity_and_limsup_le_of_firstVariationMass_le` (6) | no `hV` in the signature; crossing lines | `hΛ` bounds ‖δV‖ on relatively compact open sets of U; Θ(0) = 2 ≥ 1 | true; local |
| `one_le_upperDensity_of_mem_support` (6) | v(L, ½); segment with U = B_a(0) | `hθ` fails; endpoints outside U | true |
| `constancy` (6) | k = dim M, M with two components; θ₀ = 0 with Hᵏ(Σ) = ∞; k > dim M | range ι clopen; `0 • μ = 0`; no embedding, vacuous | true |
| `Euclidean.IsVarifoldTangent` (7) | cone at 0 | C = V | |
| `Euclidean.exists_isVarifoldTangent` (7) | W ≠ F | `s⁻¹(K) + x ⊆ W` for large j; masses → θ ω_k R^k | true |
| `Euclidean.IsVarifoldTangent.isStationary` (7) | θ = 0; A not measurable; S01's V | C = 0; hulls scale; conclusion holds, `hV` fails | true; S01 |
| `isRectifiable_of_ae_density_pos` (7) | Lebesgue with a line; vertical lift | Θ = 0, excluded; excluded by `hV` | true |
| `rectifiable_compactness` (7) | alternating lines; zigzags | two limits; ‖δV_i‖ = √2(i − 1) + 2 → ∞ | true |
| `integral_compactness` (7) | v(L,1) + v(L_i,1); θ = 0 pieces | limit v(L,2); V = v({θ > 0}, θ) | true |
| `Euclidean.IsVarifoldTangent.isRectifiable` (8) | `{Θ* < 1}` against `{Θ < 1}` | equal ‖V‖-a.e.; Simon1983 line 7793–7797 | true |
| `Euclidean.IsVarifoldTangent.isIntegral` (8) | cone property without `hlow` | integral gives Θ ≥ 1 a.e., so 42.6 applies; Simon1983 line 7764–7767 says the cone property is open without it | true |

### The adversarial pass: README targets

| Section | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 | (diag(1,0), P_{ℓ₀}); rotation e | Q = diag(1,0), A = 1, QA⁻¹Q* = P_{ℓ₀}; R_{−φ}P_θR_φ = P_{θ−φ} | sound |
| 1.2 | h = diag(1,4), u = (1,1) | h(e₁,u)/h(u,u) = 1/5 against 1/2 | sound |
| 1.3, 1.4 | restriction to the half disc; `j·δ` | support [0,½)×{0}; no Radon limit | sound |
| 2.1 | φ = 2·id | φ_*H¹⌞L = ½H¹⌞L, multiplicity 1/J = ½ | sound |
| 2.2 | weighted measure in the vanishing-off-carrier bullet | t Hᵏ(B_t) ≤ μ(U) → 0 for open U ⊇ B_t, μ(B_t) = 0 | sound |
| 2.3 | graph of \|t\|^{3/2} | (16/27)((13/4)^{3/2} − 1) = (26√13 − 16)/27 ≈ 2.879 | sound |
| 3.1 | f = t²; non-injective rectifiable formula | v([0,1], 2); fibre sums by the area formula | sound |
| 3.2 | composition of dilations | η_{0,μ} ∘ η_{x,λ} = η_{x,λμ} | sound |
| 3.3 | \|y₁\|H¹⌞L + \|y\|⁻¹ Lebesgue | r² + 2πr, Θ(0) = π, D = L, ratio 9 > 4 = 3^k + 1 | sound |
| 4.1–4.3 | X = ψy₂²e₁; X_n = n⁻¹ψ sin(ny₂)e₂ | div_L X = 0 on L; ∂₂X²(t,0) = ψ(t,0) | sound |
| 4.4 | dilation law; step multiplicity | δ(V_λ)(Y) = λ^{1−k}δV(Y∘η), H scales by λ; −X¹(0) | sound; S02 |
| 4.5 | g = e^{4t}dt², h = 4g; blow-up isometry | Γ = 2, 4 − 2 = 2 > 8/(3√3); m_λ*g̃_λ = λ⁻²g, ‖δ‖ scales by λ^{1−k} | sound |
| 5.1 | graph of \|t\|^{5/2} | ∫φ'u'(1+u'²)^{−1/2} = −∫φu''(1+u'²)^{−3/2} | sound |
| 5.2 | tangent test field Y; helix | ⟨Y, tr_S B⟩ = 0, so ‖δV‖ ≤ ‖δ(ι_#V)‖; −cos²α ν | sound |
| 6.1 | exponential form; weighted identity rederived | (e^{Λt}f)' ≥ e^{Λt}J' ≥ J'; ρI' − kI = ρJ' + ∫φ(y−x)·P∇h − δV(X_ρ) | sound |
| 6.2 | Hess(r²/2) ≥ c g with c = √κ r cot(√κ r) ≤ 1; open against closed balls | (1 − c)dr⊗dr ≥ 0; limits s ↑ σ | sound |
| 6.3 | route for a.e. existence; e^{−1/\|t\|} | S₁ ≤ 2f(ρ) + S₂; ratio ≥ ρ⁻², doubling ≥ (2r)⁻¹e^{1/(3r)} | sound |
| 6.4 | absolute continuity step; g = e^{2t}dt² | D ≥ ω_k/c_t > 0 and ∫_A D dν ≤ dt(A); (e^tX)' integrates to 0 | sound |
| 6.5 | test field; catenoid | div_S X = kγ + γ'\|P_S(y−ξ)\|²/r; 2π(h + sinh h cosh h) | sound |
| 7.1–7.4 | polar-density measure; segments; zigzag | (π/4)(sin log λ − cos log λ): −π/4, π/4; 2i; √2(i−1)+2 | sound |
| 7.5 | small disc; plane of multiplicity m under a small disc at height h | every point of D lies in R, ‖V‖(Z) = πr²; plane part of Z within radius √(ε/(πm)) + r, mass about ε | Checks sound; statement beyond Simon1983 42.9 not verified |
| 7.6 | integer-valued ψ' ≤ a | ∫\|ψ' − θ\| ≤ 2(a − θ)ω_k + δ, so dist(θ, ℤ) ≤ 2(δθ + 2δ) + δ/ω_k | sound given 7.5 |
| 8.1, 8.2 | Simon1983 line 7764–7767, 7793–7805 | cone property claimed only with the density hypothesis or integrality | sound |
| 9.1–9.3 | v(L₁,1) + v(L₂,2); [[P]] − [[P]] | ball through 0 not a submanifold; Γ_T⁺ = ∅ | sound |
| 9.4 | Simon2023 line 84–96; EdelenSpolaor2023 line 104–135 | n ≥ 3, m ≥ 2, n + m ≥ 8, ℓ ≥ 1; p + q = n − 1, all C_{p,q} minimizing for n > 7 | faithful |

## Not verifiable

- Allard1972, Federer1969 and Maggi2012 are uncertified: their locators were not opened.
- 7.5 beyond Simon1983 42.9 (the set Z, the bound over every x off Z, the case h ≠ e): the
  extraction of Simon1983 line 8014–8151 is too damaged to follow the slab estimates. Two further
  instances were computed against the statement (table above) and are consistent with it; the proof
  plan was not checked as a proof. 7.6's route depends on it.
- Simon1983 line 7736 (42.1) is partly illegible in the extraction: whether the source asks
  Θ ∈ (0, ∞) or only finiteness could not be read. The README's case Θ = 0 gives C = 0 and is
  harmless.
- That `Suggested.lean` elaborates, and that it would after S01: no Lean was run in this pass; the
  repair report of round 1 records 15 `sorry` warnings and no error at this text.
- That GeometricCurrents G6's unoriented bundle is homeomorphic to `grassmannBundle` (1.2): G6 is a
  plan on main with no carrier at the pins.

## Source issues

- **Misprint** in Simon1983 at the proof of Remark 42.8, printed p. 250: the source says the maximum of ψ_i and an integer N above θ₀ converges in L¹ to θ₀; it should be the minimum of ψ_i and N; affects nothing.
- **Gap** in AgnolettoCorreaHoyosDaSilvaNardulli2025 at the proof of Theorem 2.32, printed p. 17: the source says locally bounded first variation is preserved by push-forward under a smooth bi-Lipschitz chart; it should prove this, since the chart is no isometry and the connection changes; affects the proof.

## For the human reviewers

- **Scope.** AgnolettoCorreaHoyosDaSilvaNardulli2025 is an arXiv preprint (2504.10758v3), cited 19 times, beside Simon1983 or Scharrer2022 except for Definition 1.2 in 9.1 (`README.md:1991`).
- **Scope.** 4.5, the set Z of 7.5, the varying-metric forms of 7.1–7.6 and the general case of 6.5 are marked "this roadmap" in the README: no cited source states them.
- **Scope.** `README.md:1900–1902` says the printed proof of Simon1983 42.8 uses only a measure bound and repairs it with 7.5's set Z; that passage of the source (line 7977–7985) is partly illegible in the extraction.
- **Not tested.** Allard1972, Federer1969 and Maggi2012 are uncertified: wording and locators were not compared with them (18 of 139 source mentions).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "afb3867f9fb117ea6c0b9f70acc44fc18764941f", "job": "RT-Varifolds~2a", "model": "fable", "worker": "chris-x89"} -->
