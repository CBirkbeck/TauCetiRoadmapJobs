# FIX-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism~8

This round repairs the five findings of the round-7 review of the design (one P2, four P3). It changes two files: `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/README.md` and `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`. `sources.toml` is unchanged. No source was fetched, and every locator added here points into a text already in the manifest.

## F01 (P2) — applied

§9.2(a): "C^r Anosov diffeomorphism … (r ≥ 1) … C^r Anosov flow" → "C^∞ (`Diffeomorph I I N N ∞`) … C^∞ Anosov flow". §9.2(c): "C^{r+1} φ … ∂_t C^r because the torus is C^{r+1}" → "C^∞ φ, R of class C^r (r ≥ 1); ∂_t is C^∞, so h∂_t is C^r". Added a closing sentence on finite r, a clause at the supplier bullet for the mapping torus, and a Scope exclusion. Plan 9.2 mirrored.

Verification at the pins. `TauCeti/Geometry/Manifold/Instances/MappingTorus.lean` makes the torus of `φ : M ≃ₘ^n⟮I, I⟯ M` a C^n manifold (module docstring, lines 18–25). The quotient's order is that of `instContMDiffConstSMul` (line 201), the action by the C^n maps (t, x) ↦ (t + k, φ^{−k}x). Its derivative API, lines 589 ff., assumes `[IsManifold I ∞ M]` and a C^∞ φ. `TauCeti.nonempty_contMDiffRiemannianMetric` assumes `[IsManifold IB ∞ B]` (`…/Riemannian/Existence.lean`:69–72). So for a C¹-only φ, Layer 8 has no metric on the torus.

The cat map is analytic, and `IsManifold.of_le` (`Mathlib/Geometry/Manifold/IsManifold/Basic.lean`:819) turns ω into ∞. So every Check on the cat suspension still applies. I wrote "a smooth manifold of the Conventions when φ is C^∞", not the review's "exactly when". The converse depends on how Tau Ceti chooses its quotient atlas, and nothing here needs it.

Pattern. The §9.2 Check "the periods … are integers, so the flow is not mixing" deduced non-mixing from integer periods. A mixing flow without periodic orbits refutes that deduction in general. The Check now cites the flow-box argument of §2.1. Plan test `integer_periods` is mirrored. No other statement uses a mapping torus of finite class: §7.2's suspension of diag(2, 1/2) is linear.

## F02 (P3) — applied

§8.1 gains clause (iv): unstable cones are invariant with expansion. The difference (Δx', Δy') of the images satisfies |Δy'| ≤ γ|Δx'| and |Δx'| ≥ (μ − (1 + γ)δ)|Δx|, with μ − (1 + γ)δ > 1. §8.3's route now proves W^s_{r/K}(x) ⊆ 𝒲^s_r(x) in three steps: the cone step for the time-one maps, then y = g^v y', then v = 0, since τ_Λ > r₀. A negative-control Check is added. Plan 8.1 and 8.3 are mirrored, with a new test.

Verification. For the time −1 maps λ = 1, so λ' = 1 + (1 + γ⁻¹)δ > 1. §8.1(iii) then needs a rate ν > 1, but W^s_ε(x) gives only convergence.

Proof of (iv): by the mean value inequality, |Δg|, |Δh| ≤ δ(1 + γ)|Δx|. The source's choice of δ₀ (ClimenhagaPesin2016 lines 1850–1855) gives δ(1 + γ)² < γ(μ − λ) and μ − (1 + γ)δ > 1 + γ. Both bounds follow from λ + (1 + γ⁻¹)δ < (μ − δ(1 + γ))/(1 + γ), because λ, δ ≥ 0.

Proof of the v = 0 step: d(g^{t+v}x, g^t x) → 0, so g^v fixes a limit point in Λ. Because X has no zero on the compact Λ, periods are bounded below by some τ_Λ > 0.

The unstable inclusion is the same argument for the reversed flow. §8.2 is unaffected, because there λ' < 1 and ν = 1 works. No other route applies §8.1(iii) with λ' ≥ 1; §11.2(iii) uses only graph-norm contraction.

## F03 (P3) — applied

§4.1, first Check: "…gives 2P_g(F/2), which differs for nonconstant F" → "…gives P_{g'}(F) = 2P_g(F/2), which differs from 2P_g(F) exactly when P_g(F/2) ≠ P_g(F)". It adds the values for F = c and for F = 1 on the roof-one two-shift suspension, and notes that a coboundary F = L_gψ does not detect the wrong scaling. Plan test `rescale_pressure` is mirrored.

Verification. The fourth item of §4.1 gives P_g(L_gψ/2) = P_g(L_g(ψ/2)) = h_top(g) = P_g(L_gψ). So the two values agree for this nonconstant F, as the review says. For F = 1 with h_top = log 2 the values are 2 log 2 + 1 ≈ 2.386 and 2 log 2 + 2 ≈ 3.386.

## F04 (P3) — applied

§6.6, first Check: "its periods are integers, so strong specification … fails" → a height argument. The height s mod 1 is continuous into ℝ/ℤ and advances at unit speed. The segments ([0, a], 0), ([0, b], 1) force τ to lie within 1/4 of ℤ. The segments ([0, a], 1/2), ([0, b], 1) force τ to lie within 1/4 of 1/2 + ℤ. These two conditions are disjoint. Plan test `suspension_weak_spec` is mirrored.

Verification. Strong specification (§2.2) mentions no periodic point. I took δ from uniform continuity of the height map (the README fixes no metric on the suspension), so δ-close points have heights within 1/8. That replaces the review's "2δ". For every τ, dist(τ, ℤ) + dist(τ, 1/2 + ℤ) = 1/2. For example τ = 0.1 gives 0.1 + 0.4 and τ = 0.25 gives 0.25 + 0.25, so both distances cannot be below 1/4. The other "integer periods" sentence, in §2.2's second Check, concerns `HasFlowSpecification`, where periods do enter; it is correct and unchanged.

## F05 (P3) — applied

§10.4 *Needs:* "Layers 6.3, 9.1, 10.2, 10.3" → "Layers 6.3, 6.6, 8.4, 8.5, 9.1, 10.1, 10.2, 10.3". The route sentence now names its inputs: for diffeomorphisms §§8.4, 10.1 and §6.3's third item; for flows §§8.5, 10.1 and §6.6. Plan 10.4 prerequisites are mirrored. All of these are earlier than 10.4.

Pattern. I compared each section's § references with its *Needs* line. §11.6's statement uses φ^u and its Hölder continuity (§11.1) through ν_{g,φ^u}, but its *Needs* omitted 11.1. The README line now includes it. Plan 11.6 listed `target:11.5` twice and lacked 11.4 and 11.1; both are fixed. The other differences were forward references in Checks or analogies ("as in §6.2"), not route inputs.

## Checks

Dependency check (`gate --only HyperbolicDynamicsAndThermodynamicFormalism`), run after the last edit:

    candidate: HyperbolicDynamicsAndThermodynamicFormalism is not in the merge order yet; checked as if placed after ArithmeticDynamics (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2236 edges, 0 problem(s)

There is no UPWARD and no CYCLE line.

`roadmaps resolve` on the README found no cross-roadmap citation and no Lean name that exists nowhere. The tool did not check Lean names outside TauCetiRoadmap, so I checked the declarations cited in this round by hand at the pins:
- `TauCeti.SmoothMappingTorus` (and its instances);
- `TauCeti.nonempty_contMDiffRiemannianMetric`;
- `IsManifold.of_le`;
- `Diffeomorph`.

`plan.json` parses and keeps its format (indent 1, UTF-8, no trailing newline). It still has 45 targets. Every `target:` prerequisite is earlier than its consumer, no prerequisite list has duplicates, and every target has at least three tests.

There is no `Suggested.lean` at the design stage, so no elaboration or `#check` comparison applies. No gate failures were listed for this round.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §9.2(a), C^∞ φ | cat map (C^ω); C¹-only φ | ω ≥ ∞, so `IsManifold … ∞` holds and the metric exists; C¹ φ gives a C¹ atlas only, with no `IsManifold … ∞` | Pass for C^∞; C¹ now excluded | statement |
| §9.2(c), h∂_t of class C^r | R ≡ 1, c = 1/2; R(x₀) = 1, c = 2 | return time c + (R − c)·1 = R; ∫(1 + ρ)/2 = 1; denominator 2 − ρ vanishes where ρ = 2 | Pass; c < min R still needed | statement |
| §9.2 Check, non-mixing | constant roof; mixing flow without periodic orbits | flow boxes at heights 1/4 and 3/4 meet only at times near 1/2 + ℤ; vacuous integer periods do not exclude mixing | old inference unsupported, new Pass | Check |
| §8.1(iv), cone step | μ = 2, λ = 1, γ = 1/2, δ = 0.08 | source's δ₀: 1.5 + 4.5δ < 2 − 1.5δ ⇔ δ < 1/12; expansion 2 − 0.12 = 1.88 > 1.5; cone 0.5 + 0.12 = 0.62 ≤ 0.5·1.88 = 0.94 | Pass | clause added |
| §8.1(iv), degenerate | Δx = 0 in the cone | then Δy = 0, the same point, and both sides are 0 | Pass | none |
| §8.3, first inclusion | cat suspension, y = g^c x with 0 < \|c\| < 1 | chart coordinates (c, 0, 0) for all n, bounded and off {σ = a = 0}; g^c has no fixed point, so min d(g^c z, z) > 0; τ_Λ = 1 | (iii) with ν = 1 would be false; new route Pass | route and Check |
| §8.3, v = 0 step | periodic orbit of period p | g^v fixes a point of Λ ⇒ v ∈ pℤ; \|v\| ≤ r₀ < p ⇒ v = 0 | Pass | none |
| §4.1 Check | F = 1 on the two-shift suspension; F = L_gψ | 2.386 vs 3.386; 2h_top both ways | Pass | Check |
| §6.6 Check | τ = 0.1, 0.25, 0.6 | (0.1, 0.4), (0.25, 0.25), (0.4, 0.1): each pair sums to 1/2 | Pass | Check |
| §10.4 Needs | flow route; diffeomorphism route | §§8.5, 10.1 → §6.6; §§8.4, 10.1 → §6.3 | Pass | Needs and plan |
| §11.6 Needs | statement uses ν_{g,φ^u} | §10.3 needs a Hölder φ^u, which is §11.1, third bullet | Pass | Needs and plan |

## Notes for the maintainer

- Ownership: no construction was added. Clause (iv) is a step of this roadmap's own §8.1, and the §8.3 route is internal. The mapping torus stays Tau Ceti's and is cited.
- Scope narrowed: suspensions of diffeomorphisms of finite class C^r are now listed as not part of this roadmap. Their mapping torus is not a manifold of the Conventions. C^r Anosov diffeomorphisms themselves remain covered by Layers 7, 8 and 10. No roadmap cites §9.2's C^r form (the only consumers are GeometricTopology and TaubesGromov, through 7.1 and 9.1).
- No name or id that other roadmaps cite has changed. No other open pull request changes this roadmap.
- The "GeneralizedCohomology §G4.0b, only an open revision defines it" lead in the overlaps file is a false positive, as in earlier rounds: main states G4.0b.
- Nothing in the review text read as an instruction.
