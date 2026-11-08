# FIX-PKG-AutomorphicCongruences~5

All edits are in `packages/AutomorphicCongruences/README.md`. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged: no Lean name, gap or source changed.

## F01 (P2) — applied

Verified: SU line 9442–9445 (Prop. 13.4.1(ii), p. 217) requires M⁺ divisible only by split primes and M⁻ only by inert primes. Part (ii) is deduced from Prop. 12.3.6 (SU line 9451), which carries the same hypothesis.
§1.7(ii): "M^- … all inert in K" → "every prime dividing M^+ split in K, every prime dividing M^- inert in K, …". C_D is now defined as {c_D(β_i,x) : 1 ≤ i ≤ h_K, x_p ∈ Q(ℤ_p)}, with β_i = diag(1,q_i) (SU (11.9.3.c), p. 190, line 8127). I added the level Check (K = ℚ(√−7), p = 11, M⁻ = 3; M⁺ = 13 rejected, M⁺ = 29 accepted). Part (i) is unchanged.
**Same pattern elsewhere:** §5.10 lacked the split condition on n⁺ (Wan-2015 line 117–119, Theorem 3). It now states n = n⁺n⁻ with n⁺ split and n⁻ inert in M. §5.3 is repaired under F04. §1.5(iii) and §1.10 already carried the condition.

## F02 (P1) — applied

Verified: FW line 2596–2613 uses the ordinary group-like element [σ] in (4.2.2) and a separate *action* [·] in which u acts as u⁻¹. The README had merged the two.
§2.19: the basis element is now e_σ, with y(x) = Σ x^σ e_σ and a separate action u⋆f = e_(u⁻¹)f. S = {f : f^u = u⋆f}, the isomorphism carries the Galois action to ⋆, and y(x^u) = u⋆y(x). The twist ρ is extended linearly on e_σ, and its G_(ℚ_p)-invariance is checked in one line. The [u] Check is rewritten with ⋆. I added the 𝔽₂₇ Check for both conventions.

## F03 (P1) — applied

Verified: Wan-2015 line 3347–3350 defines ℓ_f as a generator of T ∩ (0 ⊕ F) with ℓ_f = η_f 1_f, which is not an idempotent.
- The §5.2 title "Integral projector" is now "Integral congruence-line generator", and the section anchor was updated in §0.8.
- §5.2 now states ℓ_f² = η_f ℓ_f, that ℓ_f acts on the f-line by η_f, and that e_f is the only idempotent. η_f is kept in the integral interpolation.
- I added the ℤ₅[x]/(x(x−5)) Check.
- §5.4: "Gorenstein idempotent ℓ_f" → "integral congruence-line generator ℓ_f = η_f e_f (not an idempotent)"; Wan's 1_f is now identified with e_f.
- §5.11: "period/projector" → "period and congruence-line generator".

## F04 (P2) — applied

Verified: Wan-2015 line 3525–3558 (§7.3.1, Definition 85, Theorem 86) and line 3584–3594 (Lemma 87).
§5.3 is rewritten:
- It now defines the anticyclotomic specialization β, the integral function L^(Σ,−) and the rational function L̃^(Σ,−), each with its coefficient ring, and their v-restrictions (setting γ⁻_(v′,i) = 1 for v′ ≠ v).
- (NV1) is stated as a nonzero rational restriction and (NV2) as an integral restriction outside ϖ_A A[[Γ⁻_v]].
- Targets: (1) NV1 and (2) NV2 at every v | p. NV2 needs ξ = 1, the split/inert level, parity, residual ramification and the Theorem 8/Fujiwara instance. (3) states Lemma 87 with the nonsplit Euler factors kept.
- I added Checks for X, X+Y and ϖ(X+Y), and a level negative control.
- §5.9 now cites §5.3(2)–(3) in place of "primitive NV2".

## Checks run

- `lake env lean packages/AutomorphicCongruences/Suggested.lean`, run from the content checkout: exit 0, no output. `Suggested.lean` is unchanged and still declares nothing, so the `#check @name` signature audit has nothing to check.
- Depcheck (`--movable`): `depcheck: 56 roadmaps, 662 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- Gate failures: none were listed in the brief.

## Adversarial pass (changed statements)

| Statement | Instances | Values | Result |
|---|---|---|---|
| §1.7(ii) level | K=ℚ(√−7), p=11, M⁻=3, M⁺=13 or 29 | −7≡4=2² (11); ≡2 (3), nonsquare; ≡6 (13), nonsquare (squares mod 13: 1,3,4,9,10,12); ≡22=14² (29) | 13 rejected, 29 accepted; gcd(39·87, 7)=1 |
| §2.19 y lands in S | 𝔽₂₇, τ(a)=a+1 | correct convention: y(a)=(a,a+1,a+2), y^τ=τ⋆y=(a+1,a+2,a). Inverse pairing: (a,a+2,a+1), conjugate (a+1,a,a+2) ≠ τ⋆ (a+2,a+1,a) | corrected convention consistent |
| §2.19 twist invariance | general u ∈ U | u(ρ(d)x)=ρ(e_u d^u)x=ρ(e_u e_(u⁻¹) d)x=ρ(d)x | holds with linear extension on e_σ |
| §5.2 ℓ_f | T=ℤ₅[x]/(x(x−5)) ↪ ℤ₅², x↦(0,5) | image {a≡b mod 5}; T∩ℚ₅(1,0)=ℤ₅(5,0); ℓ²=(25,0)=5ℓ; T/5=𝔽₅[x]/(x²) local | ℓ_f² = η_f ℓ_f; not idempotent |
| §5.3 NV1/NV2 | X, X+Y, ϖ(X+Y) in A[[X,Y]] | restrictions (X→0 at v₂, X at v₁); (Y, X); (ϖY, ϖX) | separates global nonzero, NV1, NV2 |
| §5.3 level | d=2, n⁻=1, n⁺ an inert prime | labelled parity 0≡2 (mod 2); actual inert count 1 | excluded by the split condition |
| §5.10 level | same instance | same values | excluded |

## Notes for the maintainer

- §§5.3 and 5.10 assume p ≥ 5, while Wan-2015 states Theorem 86 (line 3550) and Theorems 3 and 101 for p > 5. The period argument in Theorem 86 excludes only p = 3. §5.10 includes p = 5 on purpose, through BCS Theorem 3.2.1. At p = 5 the case rests on Hung2017, which is uncertified. I left this unchanged because no finding raised it; a future review may.
- The §5.2 heading anchor changed to `#52-integral-congruence-line-generator-and-canonical-period`. Its only in-roadmap link (§0.8) is updated. `roadmaps grep --fixed '52-integral-projector'` finds no match on main or in any open roadmap pull request.
- No Lean names changed, and no cross-roadmap citation or supplier changed. Ownership was not re-examined: no new object was introduced.
- I found nothing suspicious in the review text.
