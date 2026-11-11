# Repair of LocallyAnalyticRepresentationsOfLocalGroups (package, round 5)

`REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~4` has two findings. Both are applied.

Two files changed:

- `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md`;
- `packages/LocallyAnalyticRepresentationsOfLocalGroups/design/plan.json`, where only the `needs` string of the existing top-level gap `ordered-character-map` changed. Its slug, supplier and section are the same.

`Suggested.lean`, `metadata.toml` and `sources.toml` are unchanged. No source was fetched, and no `needs-references.toml` was written.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~4/F01 (P1) — applied

**Verified.** The witness is correct, and the defect is algebraic, not analytic. Any homomorphism χ : (ℚ_3, +) → ℚ_3^× with χ(1) = 4 gives x = χ(1/3) with x³ = 4. Then v_3(x) = 0, but the cubes of 1, 2, 4, 5, 7, 8 mod 9 are 1, 8, 1, 8, 1, 8, never 4.

The same holds for every finite E and every p. χ(1) = χ(p^(−n))^(p^n) would make 1 + p infinitely p-divisible in E^× ≅ ϖ^ℤ × μ_(q−1) × U¹. The infinitely p-divisible elements of that group are only μ_(q−1), and 1 + p ∈ U¹ ∖ {1}.

**Changed.** Layer 0 Examples. Old: one bullet, "G = ℚ_p … integration map of a ↦ (1 + p)^a". New: three bullets: the direct sum over ℚ_p/ℤ_p; the integration map on ℤ_p, p odd (values 1, 4, 16 at p = 3); a ℚ_3 non-example (x³ = 4, unit cubes ≡ ±1 mod 9) with the general reason.

**Pattern.** I searched for every other character given by `(1 + p)^a`:

- §0.2 Check (line 201), §0.5 Check (line 264) and §2.5 Example (line 616) are on ℤ_p with p odd. They are correct.
- §3.3 Check (line 679) is on the disc group ℤ_p + p𝔻 with p odd. exp(a·log(1 + p)) converges there because v(a·log(1 + p)) ≥ 1 > 1/(p − 1). It is correct.
- No other example puts an additive character on ℚ_p or L. The remaining characters are on ℚ_p^× or L^× (x ↦ x^k, |·|, log_p, the valuation).

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~4/F02 (P2) — applied

**Verified.** DING25 lines 1593–1596 (proof of Proposition 3.3, arXiv v2 p. 39) define 𝒥_w : ∏_i Spec H_(w⁻¹(i)) → Spec H as a morphism of spaces. Lines 1597–1601 (p. 40) print 𝒥_(w_2) = (w_2w_1⁻¹) ∘ 𝒥_(w_1), which is ill-typed.

The README's contract had a second, separate inconsistency. It called the 𝒥_w algebra maps "from the Bernstein centre to the functions on the torus", but composed them as maps of spaces. So the differential in §8.8 had no consistent source or target.

CEGGPS line 1921 (Lemma 3.22, p. 47) identifies the centre with the W(D)-invariants. This reverses arrows between rings and spectra.

The repaired order is well-typed. Put u = w_2w_1⁻¹ and p_u(φ′)_i = φ′_(u⁻¹(i)). The i-th coordinate is a twist of φ_(w_1⁻¹u⁻¹(i)) = φ_(w_2⁻¹(i)), so p_u : X_(w_1) → X_(w_2). Also p_u(w_1(φ))_i = φ_((uw_1)⁻¹(i)) = w_2(φ)_i.

Why 𝒥_(w_2) ∘ p_u = 𝒥_(w_1): the unnormalised induction with η is the normalised induction twisted by ηδ_(B⁻)^(−1/2) = |det|_L^((n−1)/2). The exponent of coordinate i is (i − 1) + (n + 1 − 2i)/2 = (n − 1)/2. So the point of Spec 𝒵 depends only on the multiset {φ′_i}.

**Changed.** Gap contract: "𝒥_w from the centre to torus functions, 𝒥_(w_2) ∘ p_(w_2w_1⁻¹) = 𝒥_(w_1)" → 𝒥_w : X_w → Spec 𝒵, p_u : X_(w_1) → X_(w_2), 𝒥_(w_2) ∘ p_u = 𝒥_(w_1), injective θ with θ ∘ κ_w = d𝒥_w; same in plan.json. §8.8 route (2) rederived; §8.8 Check and DING25 correction added.

**Why θ was made explicit.** The finding asks for a differential with a specified source and target. The route needs θ to be injective: from θ(κ_(w_2)(u·ψ)) = θ(κ_(w_1)(ψ)) one concludes κ_(w_2)(u·ψ) = κ_(w_1)(ψ) only if θ is injective. The old phrase "identify … with first-order deformations" left this implicit. This is the step Ding calls classical (DING25 lines 1589–1596). It holds at generic φ: the stabiliser in S_n of w(φ) is trivial because φ_i ≠ φ_j, so the quotient map onto Spec 𝒵 is étale there.

**Notation.** The parameter torus is called X_w, not T_w, because Layer 9 (9.1, 9.3, 9.5, 9.6) already uses T_w for a P-filtration. For the same reason, 𝒵 replaces Ding's H, since the README uses Z for the centre of GL_n and H for compact open subgroups.

**Pattern.** The construction 𝒥_w/p_u occurs only in the contract and in §8.8. The other places that use the Weyl transition were left as they are, because their statement is unchanged and correct under Convention 6:

- 8.14 API (line 1453): ζ_(w_2) ∘ (w_2w_1⁻¹) = ζ_(w_1);
- 9.6 (3);
- Convention 6.

The existing n = 3 Check in §8.8 agrees with the new one: (1 2 3)·ψ_1 = ψ_2.

## Checks run

- **Lean.** `lake env lean` on `packages/LocallyAnalyticRepresentationsOfLocalGroups/Suggested.lean`, run from the content checkout: exit 0, no output. The file imports only `Mathlib`, so no `TauCeti.*` module had to be built.
- **Signature comparison.** `Suggested.lean` has zero declarations (unchanged this round), so the `#check @name` scratch file would be empty. There was no elaborated type to compare and nothing changed.
- **Dependency check** (`gate --depcheck … --movable`), exact output:

```text
depcheck: 236 roadmaps, 2145 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or moved line.
- **Citation resolver.** `roadmaps resolve` reports one lead, as in earlier rounds: "LocallyAnalyticDistributionsPartII §1.1: no roadmap … on main or in an open pull request". This is a false positive. LocallyAnalyticDistributionsPartII is a board package that is earlier in the merge order, and its §1.1 exists (`packages/LocallyAnalyticDistributionsPartII/README.md`). It is unaffected by this round.
- **Overlaps.** `scratch/overlaps.md` lists:
  - no open pull request that changes this roadmap;
  - no dropped id;
  - no id that only an open revision defines.

## Ownership and suppliers

No new construction was introduced. The Bernstein centre and its block decomposition belong to SmoothRepresentationsOfLocalGroups SR.3.2 (*bernstein-centre-blocks*, which states Z_s ≅ ℂ[D_s]^(W_s) over ℂ). I read that section at the head of its open pull request.

The gap stays assigned to that roadmap and section. It asks for the E-valued ordered form and the tangent statement, which SR.3.2 does not state. SmoothRepresentationsOfLocalGroups is earlier than this roadmap in the merge order.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| Layer 0: D(ℚ_p, E) as a direct sum | G = ℚ_p, H = ℤ_p | Index set ℚ_p/ℤ_p ≅ ℤ[1/p]/ℤ, countable and infinite; matches the §0.4 Check | Kept, with the index set named |
| Layer 0: χ(a) = (1 + p)^a on ℤ_p | p = 3, a = 0, 1, 2; p = 2 | p = 3: χ = 1, 4, 16, and χ(2) = χ(1)² = 16. v_3(log 4) = 1 > 1/2, so exp converges on ℤ_3. p = 2: exp(log 3) = exp(log(−3)) = −3 ≠ 3 | Formula correct for p odd only; "p odd" stated, matching §§0.2, 0.5 |
| Layer 0 non-example on ℚ_3 | E = ℚ_3, a = 1/3 | x³ = 4 forces v(x) = 0. Unit cubes mod 9 are {1, 8}, and 4 ∉ {1, 8} | Added as a negative control |
| No extension to ℚ_p for any finite E | E = ℚ_3, general E | Infinitely 3-divisible elements of ℚ_3^× are μ_2 = {±1}, and 4 ∉ {±1}. In general they are μ_(q−1), and 1 + p ∈ U¹ ∖ {1} | Added in one clause |
| p_u is well-typed | n = 3, w_1 = 1, u = w_2 = (1 2 3) | u⁻¹ = (1 3 2). p_u(2, 4, 8) = (φ′_3, φ′_1, φ′_2) = (8, 2, 4) = u(φ). The alternative φ′_(u(i)) gives (4, 8, 2) ≠ u(φ) | Base-point law excludes the inverse convention; Check added |
| 𝒥_(w_2) ∘ p_u = 𝒥_(w_1) | Same tuple; n = 2 with (a, b) | e_k(2, 4, 8) = e_k(8, 2, 4) = (14, 56, 64). n = 2: (a + b, ab) for both orders | Holds |
| η-twist invariance | n = 1, 2, 3 | Exponents (i − 1) + (n + 1 − 2i)/2: n = 1 gives 0; n = 2 gives 1/2, 1/2; n = 3 gives 1, 1, 1 | Constant, so the point depends only on the multiset |
| Old ring-map version | Algebra maps 𝒵 → O(X_w) | 𝒥_(w_2) ∘ p_u would need p_u to land in 𝒵: undefined. The correct order is 𝒥_(w_1)^* = p_u^* ∘ 𝒥_(w_2)^* : 𝒵 → O(X_(w_2)) → O(X_(w_1)) | Replaced |
| Tangent law d𝒥_(w_2)(u·ψ) = d𝒥_(w_1)(ψ) | n = 3, deform coordinate 1 to 2(1 + ε) | e_1 = 14 + 2ε, e_2 = 56 + 24ε, e_3 = 64 + 64ε. After p_u, (8, 2(1 + ε), 4) gives the same values, i.e. ψ_1 ↦ ψ_2 | Agrees with Convention 6 and the existing §8.8 Check |
| d𝒥_w injective needs genericity | n = 2 in log coordinates, (a, b); a = b | Jacobian [[a, b], [ab, ab]] has determinant ab(a − b). It is nonzero for a ≠ b and 0 for a = b | Genericity (φ_i ≠ φ_j) is needed; it is in the standing hypotheses |
| d𝒥_w at the n = 3 point | (2, 4, 8) | Vandermonde (2 − 4)(2 − 8)(4 − 8) = −48, times ∏ t_i = 64, gives −3072 ≠ 0 | Bijective, as the route uses |
| Degenerate n = 1 | S_1, u = 1, η = 1 | p_u = id. 𝒥_1 : Spec 𝒵_1 → Spec 𝒵 is the identity. θ : Hom_sm(L^×, E) (dimension 1) → tangent space (dimension 1) | Consistent with the §8.8 Check (dimension 1 + d_L, smooth part 1) |
| Hom_sm(T(L), E) = tangent space of X_w | L = ℚ_p, n = 1 | A smooth additive character kills the profinite O_L^× (finite image in a characteristic-0 group is 0), so it is unramified. Dimension 1 = dim 𝔾_m | Identification in the contract correct |
| θ ∘ κ_w = d𝒥_w | E[ε]-deformation, z ∈ 𝒵 acting by a + bε | (z − a) acts by bε, i.e. b times the map quotient → sub. So θ(κ_w(ψ)) = d𝒥_w(ψ) | Holds by definition of θ |
| Source correction (DING25) | Typing of the printed formula | 𝒥_(w_1) lands in Spec H; the permutation's source is a product of tori | Recorded, forced by the new §8.8 Check |

## Notes for the maintainer

- No Lean name changed or was added or deleted; `Suggested.lean` still has no declarations.
- The gap:ordered-character-map contract for SmoothRepresentationsOfLocalGroups is now more precise. It names the ordered torus X_w, the direction of p_u and the injective map θ. Whoever fills it in SR.3.2 should read the new wording.
- No section or target id of this roadmap moved, so TriangulineVarietyAndItsLocalModel and PadicHodgeParametersInLocallyAnalyticRepresentations, which cite it, are unaffected.
- The text I read contained no passage that tried to instruct me.
