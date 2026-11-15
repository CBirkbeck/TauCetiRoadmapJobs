# FIX-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism~11

One review (REV-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism~10), one finding. Files changed: `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/README.md`, `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`. `sources.toml` is unchanged: no new work is cited and no source was fetched.

## F01 (P3) — applied

Verified: BowenRuelle1975 lines 275–277 give the bound for every ε > 0, with C_ε, all x ∈ Λ and T > 0. The README only gave it at small scales (§6.8(b)).

§10.3: "satisfies the lower Gibbs bound ν(B_x(ε, T)) ≥ C_ε exp(…) for x ∈ Λ, T > 0" → "for every ε > 0 there is C_ε > 0 with ν(B_T(x, ε)) ≥ C_ε exp(…) for all x ∈ Λ and T ≥ 0", naming the balls (open, of g|Λ; a fortiori the closed ones of §11.4). New §10.3 Check gives the explicit constant on a periodic orbit. Plan 10.3 changed to match.

How the larger scales are reached: the review's "by monotonicity of the balls in ε" is now a stated API fact of §5.1, not a parenthesis in §10.3. New §5.1 bullet: the lower Gibbs property at scale ε₀ with constant K holds at every ε ≥ ε₀ with the same K, since B_t(x, ε) ⊇ B_t(x, ε₀). So every sufficiently small scale gives every scale, and also ∫₀ᵗφ − tP ≤ log K. §5.3 now concludes "at every scale ε > 0" through this bullet. §6.8(b) passes that on, and §10.3 takes it from §6.8(b).

The same implicit quantifier appeared in other places, all repaired:
- §6.8(a) and §10.2: "Gibbs property at small scales" → "at every sufficiently small scale". Only that is true for the two-sided property.
- §6.8(b): "lower Gibbs property at small scales" → "(§5.1) at every scale ε > 0 (§5.3)".
- §5.3: as above.
- Plan targets 5.3, 6.8, 10.2 and 10.3: statements changed to match.
- Plan 5.1: new API entry `lowerGibbs_mono_scale` and new test `upper_bound_large_scale`.
- Plan 10.3: new test `periodic_orbit_every_scale`.

New §5.1 Check: on the full two-shift with the Bernoulli measure, the product μ(B_n(x, ε))·2^n is 1 at ε = 1 and 2^n at ε = 2 (above the diameter). So the upper Gibbs bound fails at large scales and only the lower bound extends. The roof-one suspension gives 2^t in the same way.

No *Needs* line changes. §5.3 already needs §5.1, §6.8 needs §§5.2–5.3, and §10.3 needs §6.8.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.1 new bullet: scale ε₀ with K gives every ε ≥ ε₀ with K | ε = ε₀; ε > diam X; one-point X (fixed point) | ε = ε₀: identity. ε > diam: B_t = X, μ = 1, and the ε₀ bound with μ(B) ≤ 1 gives exp(tP − ∫φ) ≥ K⁻¹, so 1·exp(tP − ∫φ) ≥ K⁻¹. One point: P = φ(pt), exponent 0, μ(B) = 1, K = 1 at every ε | Pass | added |
| §5.1 bullet, second sentence: ∫₀ᵗφ − tP ≤ log K | periodic orbit, period p | exponent ∈ [−2p max\|φ\|, 2p max\|φ\|], and the bound holds with K = (p/2s_ε)e^{2p max\|φ\|} ≥ e^{2p max\|φ\|} | Pass | added |
| §5.1 new Check (two-shift, metric 2^{−N}) | ε = 1/2, 1, 2 | ε = 1/2: cylinder x_{−1..n}, 2^{−(n+2)}·2^n = 1/4 (matches §5.2 Check). ε = 1: d < 1 ⟺ x_k = y_k, cylinder x_{0..n−1}, 2^{−n}·2^n = 1. ε = 2 > diam 1: ball = X, 1·2^n → ∞ | lower bound holds with K = 1 at ε = 2; two-sided fails | added |
| §5.3: lower Gibbs at every ε > 0 | flow on a periodic orbit; roof-one suspension of the two-shift at ε above its diameter | periodic orbit: C_ε = (2s_ε/p)e^{−2p max\|φ\|}. Suspension: μ(B_t) = 1, product 2^t ≥ 1 | Pass | edited |
| §6.8(a), §10.2: Gibbs at every sufficiently small scale | full shift at ε = 2; swap of two points (d = 1) | shift: upper bound fails (2^n), so "every scale" would be false. Swap: ε ≤ 1 gives B_n = {x}, μ = 1/2, S_nφ − nP ∈ [−max\|φ\|, max\|φ\|], bounded both ways | wording "every sufficiently small" is correct | edited |
| §6.8(b): lower Gibbs at every ε > 0 | periodic orbit (§6.8 Check 3); the monotone shift's suspension (non-transitive, excluded) | periodic orbit as above; the monotone suspension is excluded by forward transitivity, unchanged | Pass | edited |
| §10.3: ∀ε > 0 ∃C_ε > 0 ∀x ∈ Λ ∀T ≥ 0 | hyperbolic periodic orbit of period p (new Check); T = 0; ε > diam Λ; cat-map suspension, F = 0 | Periodic orbit: T = kp + r, −TP + ∫₀ᵀF = ∫₀^r F − rP ∈ [−2p max\|F\|, 2p max\|F\|]; the arc has measure 2s_ε/p, so C_ε = (2s_ε/p)e^{−2p max\|F\|}, and e^{−2p max\|F\|} above the diameter. T = 0: B_0 ⊇ B_1, so ν(B_0) ≥ C_ε e^{−\|P\| − max\|F\|}. ε > diam: ν = 1 ≥ C_ε exp(…) since exp(…) ≤ K. Cat suspension: P = log((3+√5)/2) = 0.9624, exponent −0.9624T, ν(B_T) decays at the same rate | Pass | edited |
| §10.3, open balls vs. the closed balls of §11.4 | x ∈ Λ, balls in M against balls in Λ | ν is supported on Λ; ν(closed ball in M) = ν(closed ball ∩ Λ) ≥ ν(open ball of g\|Λ) | Pass: "a fortiori" | edited |
| §10.3 source agreement | BowenRuelle1975 lines 272–277 | source: ∀ε > 0 ∃C_ε, all x ∈ Λ, T > 0; README: T ≥ 0, which adds T = 0 and implies the source's statement | Pass | none |
| §11.6 proof, consumer of §10.3 "at radius ε" | small ε of §§11.4–11.5 | the every-scale statement contains the small-scale case it uses | Pass | none |
| New §10.3 Check, s_ε | p = 1, F ≡ 0 | P = 0, exponent 0, ν(B_T) ≥ 2s_ε ≤ 1; s_ε exists by uniform continuity of (s, y) ↦ g^s y on [−1, 1] × O with g⁰ = id | Pass | added |

## Checks

Dependency check (output in full):

    candidate: HyperbolicDynamicsAndThermodynamicFormalism is not in the merge order yet; checked as if placed after ArithmeticDynamics (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2245 edges, 0 problem(s)

There is no UPWARD or CYCLE line.

`plan.json` still parses as JSON after the edits. Plan 5.1 now has four API entries and four tests. Plan 10.3 now has four tests.

There is no `Suggested.lean` at the design stage, so nothing was elaborated and the `#check` comparison does not apply.

No gate failures were listed for this round.

## Notes for the maintainer

- The overlaps lead "GeneralizedCohomology §G4.0b is defined only by an open revision" does not hold. Main (1a19c9f) states G4.0b in `TauCetiRoadmap/GeneralizedCohomology/README.md`: it is introduced at line 939 and its item is at line 1080. The citation needs no change and adds no dependency.
- Ownership: nothing new is owned. The added API fact concerns this roadmap's own definition (§5.1, the lower Gibbs property of flows), and the added Checks are about it.
- Ownership against open pull requests was checked through the review's `roadmaps grep` and `roadmaps show` record. It was not re-run this round, since no new object was introduced.
- No name that other roadmaps cite changed. No section, layer or target was renumbered.
- No source text was copied. The new locator, BowenRuelle1975 lines 275–277, was read in the cached extraction.
