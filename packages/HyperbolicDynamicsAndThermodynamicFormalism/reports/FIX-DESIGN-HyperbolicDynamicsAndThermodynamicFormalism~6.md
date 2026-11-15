# Repair of HyperbolicDynamicsAndThermodynamicFormalism (design, after review round 5)

Files edited: `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/README.md`, `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, `packages/HyperbolicDynamicsAndThermodynamicFormalism/sources.toml` (one locator narrowed). Each of the six findings of `REV-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism~5` was checked against the pinned Mathlib, the cached sources and ClassicalErgodicTheory at its head, and each one is correct. Five are applied as asked. One (F06) is applied with a narrower claim, because the extracted text cannot confirm part of the suggested wording. There is no `Suggested.lean` at the design stage.

## F01 (P2) — applied

Conventions: "Distances on M are the Riemannian distance (`Manifold.riemannianEDist`)" → "the truncated distance d = min(1, ρ), ρ the Riemannian extended distance, ⊤ between components; d metrises M and equals ρ below 1; bi-Lipschitz on compact sets (finitely many components)", with a witness: ρ(c, d) = ⊤, truncated distance 1. Layer 8 header changed the same way. New §8.4 Check: {c, d} with distance 1 is §2.2's swap. Plan 8.4 gets a matching test.

Evidence: `Mathlib/Geometry/Manifold/Riemannian/PathELength.lean`:208 defines it as `⨅ (γ : Path x y) …` in `ℝ≥0∞`, which is ⊤ when no path exists. The pattern was repaired everywhere it occurs: the Mathlib contract bullet (truncation is the convention's distance), the "Already in the library" sentence and Layer 8's Dependencies ("Riemannian extended distance"), and Layer 11's header ("distances being truncated at 1"). The compact-metric-space claims in §§10.2–10.3 now hold as stated.

## F02 (P2) — applied

Scope: "owns … Bowen balls" → "owns the dynamical distances d_n and d_t, the API of ClassicalErgodicTheory's Bowen balls". The Bowen balls are added to the "Stated by ClassicalErgodicTheory and imported" list. §1.1 now defines d_n and d_t only. It takes the Bowen balls from ClassicalErgodicTheory's Conventions and proves that, for ε > 0, they are the open balls of d_n and d_t (finite maximum; for flows the supremum is attained on the compact [0, t] because `Flow` is jointly continuous, `Mathlib/Dynamics/Flow.lean`:88).

The supplier contract heading adds "Conventions", with a bullet quoting the supplier's two formulas. §1.1's Needs and Layer 1's Dependencies cite them. In the plan: 1.1's statement and locator change, the prerequisite `roadmap:ClassicalErgodicTheory Conventions` is added, and the target name `Dynamics.bowenBall` becomes `Dynamics.dynDist`, so that no later stage declares the supplier's object a second time. The ClassicalErgodicTheory supplier entry also gains the "Conventions" section.

Evidence: ClassicalErgodicTheory README, Conventions, paragraph "Separated sets and Bowen balls" (README line 170 at the head the roadmaps tool reads). Its `Suggested.lean` declares no Bowen-ball name.

Same pattern: the Conventions item on separated sets (`Dynamics.IsDynNetIn`) is the supplier's convention too, and now says "as in ClassicalErgodicTheory's Conventions".

## F03 (P3) — applied

§8.1: "for each n" → "for each n ∈ ℤ". The unique family is now (W^+_n)_{n∈ℤ}. Clause (iii), "backward images … decay faster than ν^{−L}", now reads: if z has points z_L of the box, with z_0 = z, f_{n−L}(z_L) = z_{L−1} and |z_L| < Cν^{−L}|z|, where λ' < ν < μ', then z ∈ W^+_n.

The text adds how the n ∈ ℤ form follows from the source's n ≤ 0 form (apply it to shifted sequences, then use uniqueness). It also adds a forward-only cone proof of (iii), with the source's λ' = λ + (1 + γ⁻¹)δ (ClimenhagaPesin2016 line 1854). The Check on (2x, 0) is extended, and plan 8.1 is updated to match.

Evidence: ClimenhagaPesin2016 lines 1824 (n ≤ 0), 1833 (family over n ∈ ℤ) and 1839–1840 (clause (iii) uses inverses).

## F04 (P3) — applied

§8.3 now states the straightening charts: φ_x, a C^r map from the ε-ball of T_xM with φ_x(0) = x and Dφ_x(0) = id. It carries the ε-ball of E^s ⊕ ℝX into 𝒲^{cs}_{r₀}(x) and that of E^u ⊕ ℝX into 𝒲^{cu}_{r₀}(x), with C¹ bounds uniform in x. Consequence: φ_{g^t x}⁻¹ ∘ g^t ∘ φ_x has derivative Dg^t_x at 0 (BowenRuelle1975, A.1, lines 643–652).

The text gives the construction by two shears: first the weak stable graph, then the weak unstable graph in the straightened coordinates. This is the order of BowenRuelle1975 lines 647–652, which the review's "compose with the graph maps" leaves unstated. Two Checks are added: the cat suspension, and a curved plaque, v = u²/3. Needs gains `extChartAt`. §§11.3(c) and 11.4 now name "the charts φ_x of §8.3". Plan 8.3 gets an API entry and two tests.

## F05 (P3) — applied

Scope: "Apart from the Bowen balls, … no roadmap on main, at the open roadmap heads or on the board plans these results" → "No other roadmap plans these results". The README was searched for other process words ("board", "heads", "pull request", "review", "currently", "not yet"): none remain.

## F06 (P3) — applied differently

§1.1: "ClimenhagaThompson2016, lines 175–177, use closed balls with s ∈ [0, t]" → "lines 170–175, defines d_t with s ∈ [0, t] and both the open and the closed d_t-balls, and its separated sets are separated in the closed sense, d_t(x, y) > δ, line 945". The plan 1.1 locator changes the same way.

Why differently: line 174 (open, `< δ`) and line 175 (closed, `≤ δ`) are confirmed. However, the extraction drops the overline that distinguishes the two balls, so lines 335 and 1253 cannot be read as using the open ball. Only what the text shows is cited; line 945 confirms the closed-ball separation.

## Adversarial pass (changed statements)

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| Truncated distance d = min(1, ρ) | {c, d} in two copies of ℝ²; triangle ρ(x,y) = ρ(y,z) = 0.6, ρ(x,z) = 1.2; metrics g and 4g on ℝ² | ρ(c,d) = ⊤, d = 1; 1 ≤ 0.6 + 0.6; ρ = 0.3: min(1, 0.6) = 0.6 ≤ 2·0.3; ρ = 0.7: 1 ≤ 1.4; ρ = 2: 1 ≤ 2 | True; witness added |
| Truncation leaves flat-torus Checks unchanged | 𝕋² (diameter √2/2 ≈ 0.707); 𝕋⁴ (diameter 1); attracting circle of §10.1 | ρ ≤ 1 everywhere, so d = ρ | No Check changes |
| §8.4 new Check | swap {c, d}, δ < 1 | W^s_δ(c) ∩ Λ = {c}; weak specification τ = 1 for δ < d(c, d) = 1 (§2.2) | True |
| §1.1 Bowen ball = open d_n-ball | doubling map, ε = 1/8, n = 2; n = 0; ε = 0 | half-width 1/16 both ways; ∀ k < 0 vacuous gives univ, d_0 = 0 < ε gives univ; at ε = 0 supplier's B_0 = univ but the open 0-ball is ∅ | True for ε > 0 (stated) |
| §1.1 flow ball = open d_t-ball | t = 0; rotation flow of ℝ/ℤ | Icc 0 0 = {0}: the ε-ball; constant distance: equal | True; continuity of `Flow` (`cont'`) used |
| §8.1(iii) without inverses | f = (2x, 0), z = (x, 0); z = (x, y), y ≠ 0; linear diag(2, 1/2), z = (x, y), y ≠ 0 | z_L = (2^{−L}x, 0), 2^{−L} < 2ν^{−L} for ν < 2, so z is on y = 0; no z_1, off the graph; z_L = (2^{−L}x, 2^L y) leaves the box, hypothesis fails and z is off y = 0 | True in all three |
| §8.1 constants | λ = 1/2, μ = 2, γ = 1/2, δ = 0.01 | λ' = 0.5 + 3·0.01 = 0.53; μ' = (2 − 0.015)/1.5 = 1.3233; λ' < μ' | Cone step factor = source's λ' |
| §8.1 cone invariance | \|Δy\| ≤ γ\|Δx\| | \|Δy'\| ≤ (λγ + δ(1+γ))\|Δx\|, \|Δx'\| ≥ (μ − δ(1+γ))\|Δx\|; invariant iff λ' ≤ μ − δ(1+γ), implied by line 1852 | True |
| §8.1 z = 0 | strict inequality | 0 < 0 fails, hypothesis vacuous; 0 ∈ W^+_n by the graph transform | True |
| §8.3 chart, cat suspension | x = [s₀, w₀], t = 1 | composite (σ, a, b) ↦ (σ, 2.618a, 0.382b) = Dg^1_x | True |
| §8.3 chart, curved plaque | θ' = 1, u' = u, v' = −v + u² | v = u₀²e^{2t}/3 + ce^{−t}; W^{cu} = {v = u²/3}; φ_x(σ, a, 0) = (θ₀+σ, a, a²/3) lies on it; {v = 0} ∩ {v = u²/3} = {u = 0}; Dφ_x(0) = id | True; Check added |
| §8.3 two-shear order | shear 1 then 2 | second shear maps E^s ⊕ ℝX to itself (u_2 = 0 gives u_0 + u_1 + φ''(u_0, 0)), so the weak stable image is preserved | Order recorded in text |

## Checks run

- Dependency check, after the last edit:

      candidate: HyperbolicDynamicsAndThermodynamicFormalism is not in the merge order yet; checked as if placed after ArithmeticDynamics (the intake inserts it when its design is accepted)
      depcheck: 245 roadmaps, 2232 edges, 0 problem(s)

  No UPWARD or CYCLE line.
- Citation resolver on the README: no cross-roadmap citation and no Lean name found nowhere. New pinned names checked by hand: `Manifold.riemannianEDist` (`Mathlib/Geometry/Manifold/Riemannian/PathELength.lean`:208, namespace `Manifold` from line 51); `Flow.cont'` (`Mathlib/Dynamics/Flow.lean`:88); topology agreement via `PseudoEMetricSpace.ofRiemannianMetric` (`Mathlib/Geometry/Manifold/Riemannian/Basic.lean`:521, `[RegularSpace M]`).
- Plan: 45 targets; ids equal the README's `### k.n` headings; every definition target has at least three tests; the JSON is in the file's own format (indent 1, UTF-8). `sources.toml` parses.
- Suggested.lean: none at the design stage, so no elaboration or `#check` comparison was run.
- No gate failures were listed for this round.

## Notes for the maintainer

- Ownership: Bowen balls and dynamical distances were searched by object at all open heads and on main (`roadmaps grep` for Bowen ball, `bowenBall`, `dynDist`). Only ClassicalErgodicTheory has them, as a Convention, with no Lean name; this roadmap now cites it. ClassicalErgodicTheory is another author's open pull request that adds a new folder, and is not in the merge order.
- The plan's target name for §1.1 changed from `Dynamics.bowenBall` to `Dynamics.dynDist`. No other roadmap cites it.
- Overlap lead "GeneralizedCohomology §G4.0b is defined only by an open revision": this is false. Main's `TauCetiRoadmap/GeneralizedCohomology/README.md` line 1082 states G4.0b, so the citation needs no change and no dependency.
- No suspicious instructions were found in the review text.
