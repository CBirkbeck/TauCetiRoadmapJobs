# FIX-DESIGN-RationalAnalyticPrismatization~17

This round settles the findings of REV-DESIGN-RationalAnalyticPrismatization~16. There is one review, so the ids are unqualified.

Files changed:
- `packages/RationalAnalyticPrismatization/design/README.md`
- `packages/RationalAnalyticPrismatization/design/plan.json`

`sources.toml` is unchanged. Every new locator (ALRS Example 5.5.9, Lemma 5.5.11, Remark 4.2.12, the notation line 6053) is in ALRS, which the manifest already records. The package has no `Suggested.lean` at the design stage.

All three findings are right, and all three are applied. No section, target, layer id or name changed.

## F01 (P3) — applied

Old (10.8, first Check; `eps_trivial`): "For A with trivial G-action, A^{Bin_{r,ϖ}} = A and ϵ-TORS holds for every ϵ." New: for A = Λ°, τ_{≥0}A^{Bin_{r,ϖ}} = Λ° and the negative homotopy is ϖ^ϵ-torsion once 2^{−ϵ} < r^{−ω} (Example 5.5.9); likewise for A trivial modulo some ϖ^δ (Lemma 5.5.11); a ℤ_p witness shows π_{−1} ≠ 0.

Verification:
- ALRS line 6145–6150 (Example 5.5.9) says only that the higher cohomology of Γ(G, C_{r,ϖ}(G, Λ°)) is killed by ϖ^ϵ, not that it vanishes. ALRS line 6165 (proof of Corollary 5.5.10) states τ_{≥0}(A^{Bin}) = A only.
- C_{r,ϖ}(G, Λ°) is cut out by |c_α|_ϖ r^{τ(α)} ≤ 1 (ALRS line 5364–5375; README 10.4).
- Witness G = ℤ_p with generator γ, w = w(γ):
  - π_{−1} = coker(γ − 1), because the Lazard resolution of ℤ_p has length 1.
  - With either action convention, γ − 1 is ±γ^{0 or 1}∘Δ, where Δ(Σ c_n binom(x, n)) = Σ c_{n+1} binom(x, n). Translations fix constants.
  - 1 = Δ(c_0 + binom(x, 1)), and that preimage has norm r^w > 1, so [1] ≠ 0.
  - For any g = Σ b_n binom(x, n) in C_{r,ϖ}, the preimage c_0 + Σ ϖ^ϵ b_n binom(x, n+1) has norms 2^{−ϵ} r^w · |b_n| r^{wn} ≤ 2^{−ϵ} r^w. So ϖ^ϵ kills π_{−1} exactly when 2^{−ϵ} r^w ≤ 1.
- Consistency with ALRS: for d = 1, ω = 2w. The source's sufficient bound 2^{−ϵ} < r^{−2w} gives 2^{−ϵ} r^w < r^{−w} < 1.

Pattern search: I searched for other claims that a trivial action gives invariants equal to A.
- 10.1 (R = ℤ), 10.5 (R = ℚ_p) and 10.6 (X = GSpec(ℚ_p)) are rational statements. There Γ(G, C_{r,ϖ}(G, Λ)) = Λ holds (ALRS line 5542).
- No other integral occurrence was found.

## F02 (P3) — applied

Old (10.8 statement, first API bullet): "connective ϖ-complete A-module N … → M ⊗ A_{ϖ^{(d+1)ϵ}} → … M with trivial action". New: G-equivariant N; G-equivariant A_{ϖ^{(d+1)ϵ}}-linear maps through M ⊗_{R_0} A_{ϖ^{(d+1)ϵ}}, R_0 = Γ(G, (τ_{≥0}A^{Bin_{r_0,ϖ}})_{ϖ^{(d+1)ϵ}}), M a not necessarily connective R_0-module; N_a defined (ALRS line 6053). Second Check recomputed: R_0 = A_{ϖ^ϵ} for d = 0.

Verification:
- ALRS line 6062–6066 states the hypothesis over this base. (The source prints "r_0,ω" there, a misprint for ϖ.)
- R_0 → A_{ϖ^{(d+1)ϵ}} is Γ(G, B_a) → B_a → (A^{Bin})_a → A_a, the last map being evaluation at 1 ∈ G.
- The base matters. Take Corollary 5.5.10 (A = Λ°, G = ℤ_p, N = P with P/p^s trivial).
  - Then R_0 = Γ(ℤ_p, Λ°_a), which has π_0 = π_{−1} = Λ°_a, so it is not connective.
  - The source's M is P′_a ⊗_{Λ°} R_0, also not connective.
  - The old reading over Λ° is the special case M = M′ ⊗_{Λ°} R_0.

Pattern search: I listed every unsubscripted ⊗ in Layers 10–11. They are:
- R ⊗ ℤ_■[Π];
- M ⊗ C(Π_0, ℚ_p);
- C^la_G ⊗ M and C^la_G ⊗ R;
- O ⊗ C(ℤ_p^×, ℚ_p);
- K ⊗ RΓ(…).

All of these are over ℚ_p or have an evident base. The second API bullet already had its base τ_{≥0}Γ(G, A_{ϖ^δ}).

## F03 (P3) — applied

Old (8.5, third Check; `radius_reversed`): "would place the Hodge–Tate locus at p^n for n ≥ 0 and exchange the roles of (0, p) and (1, ∞)". New: κ ↦ 1/κ fixes the Hodge–Tate locus, moves its n-th inverse translate from p^{-n} to p^n, and turns (0, p), (1, ∞) into (1/p, ∞), (0, 1). Part (1) in that radius would claim isomorphisms at p, p², …, refuted via 8.6's first Check.

Verification:
- ALRS line 3327–3329 gives (r, s) ↔ (1/s, 1/r). Hence 1/(0, p) = (1/p, ∞) and 1/(1, ∞) = (0, 1).
- ALRS line 3291–3292 (Remark 4.2.12): X^Δ agrees with the de Rham stack of the disc off {p^{−n}}, and the translates of X^HT lie at p^{−n}.
- Failure at those radii:
  - Suppose X^Δ → (D^×)^dR were an isomorphism over (0, 1). By φ-equivariance and 8.5(2) it would then be one over (0, p).
  - Its coequalizers would give Div¹ ≅ Q_p^HK.
  - By 8.6's first Check, Div¹ → Q_p^HK is a base change of A¹/G_m → A^{1,dR}/G_m^dR. The fibre of that map over the origin is G_a^†/G_m^†.
  - Over ℚ_p[ε]/ε², G_a^†/G_m^† has the non-isomorphic points 0 and ε, so it is not a point.
  - The origin is hit, by Q_p^HT ⊆ Div¹.

Pattern search for "exchang", "reciprocal" and "1/κ":
- Conventions (line 25), the 6.1 Check on the reciprocal convention, and the proof route and first Check of 8.5 are consistent with the new Check.
- The only other "exchanging" is in the `stacky-cartier-duality` gap, which is unrelated.

## Adversarial pass (changed statements)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 10.8 Check 1, H⁰ | G = ℤ_p, A = Λ° | ker Δ = constants c_0, \|c_0\|_ϖ ≤ 1, so π_0 = Λ° | holds | — |
| 10.8 Check 1, π_{−1} ≠ 0 | G = ℤ_p, any r ∈ (1, 2) | preimage of 1: c_0 + binom(x, 1), norm r^w > 1, so [1] ≠ 0 | holds (old Check false) | Check |
| 10.8 Check 1, exact torsion | G = ℤ_p, w = 1, r = 2^{1/4} | ϖ^ϵ kills π_{−1} iff 2^{−ϵ}·2^{1/4} ≤ 1 iff ϵ ≥ 1/4; source bound ω = 2: ϵ > 1/2 (sufficient) | holds | — |
| 10.8 Check 1, γ convention | (γf)(x) = f(x ± 1) | γ − 1 = Δ or −γ∘Δ; γ fixes constants; same constants in image | holds | — |
| 10.8 Check 1, d = 0 | G trivial | ω = 0 (only I = J = ∅); C_r = Λ°; no negative homotopy | holds | — |
| 10.8 Check 1 vs Check 3 | A = Λ° | π_{−1} is ϖ^ϵ-torsion for r near 1; not the non-example of Check 3 | consistent | — |
| 10.8 hypothesis, base R_0 | d = 0 | R_0 = Γ(1, A_{ϖ^ϵ}) = A_{ϖ^ϵ} (A connective); M = N_{ϖ^ϵ}, δ = 0, composite = id = ϖ^0 | holds | Check 2 |
| 10.8 hypothesis, base R_0 | A = Λ° trivial, G = ℤ_p, N = P with P/p^s trivial | R_0 = Λ°_a ⊕ Λ°_a[−1] (π_0 = π_{−1} = Λ°_a); M = P′_a ⊗ R_0; M ⊗_{R_0} A_a = P_a | holds; non-connective M needed | statement, API |
| 10.8 hypothesis, ring map | general | R_0 = Γ(G, B_a) → B_a → A^{Bin}_a → A_a (evaluation at 1) | defined | — |
| 10.8 conclusion | d = 0 | N[1/ϖ] ⊗_{A[1/ϖ]} A[1/ϖ] → N[1/ϖ] identity | holds | — |
| 8.5 Check 3, intervals | κ ↦ 1/κ | 1 ↦ 1; p^{−1}, p^{−2} ↦ p, p²; (0, p) ↦ (1/p, ∞) ≠ (1, ∞); (1, ∞) ↦ (0, 1) ≠ (0, p) | old Check false | Check |
| 8.5 Check 3 vs route | φ on 𝒳_T | 𝒳_{T,(1/p,∞)} ≅ 𝒳_{T,(1,∞)} ↔ X^Δ_{(0,p)} ≅ X^Δ_{(0,1)}; 𝒳_{T,(0,1/p)} ≅ 𝒳_{T,(0,1)} ↔ X^Δ_{(p,∞)} ≅ X^Δ_{(1,∞)} | consistent | — |
| 8.5 Check 3, failure at p^{−n} | X = GSpec(ℚ_p), test ring ℚ_p[ε]/ε² | fibre G_a^†/G_m^†: points εℚ_p, (1 + aε)·bε = bε, classes 0 ≠ ε | not an isomorphism | — |
| 8.5 Check 1, Conventions | n = 0, 1 | HT at 1, translate at 1/p (X^Δ); copies at 1, p (𝒳_T); reciprocal | consistent | — |

## Checks run

**Plan–README agreement (scripted):** all 626 `statement` strings of `plan.json` occur verbatim in the README (0 missing). `plan.json` is rewritten in its existing format (indent 1, trailing newline); the diff touches only the five changed strings.

**Policy grep on the changed lines:** no LaTeX delimiters, machine paths, pull-request numbers or process words.

**Dependency check:**

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 235 roadmaps, 2255 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

**Lean `#check` pass:** not applicable. There is no `Suggested.lean` at the design stage, and this round changed no Lean name.

**Ownership:** no new construction, target or citation of another roadmap was added, so there is no new ownership question. The repairs concern statements this roadmap already owns (10.8, 8.5).

## Notes for the maintainer

- **Source misprint.** ALRS Proposition 5.5.6 (ALRS line 6063 and 6065) writes the base as Γ(G, (τ_{≥0}A^{Bin_{r_0,ω}})_{ϖ^{(d+1)ϵ}}), with ω in place of ϖ. Here ω is otherwise the constant of Lemma 5.2.19. The README writes ϖ. This affects nothing.
- **No downstream impact.** No name, id or citation that other roadmaps use has changed.
