# Repair report: red-team round 1 of AutomorphicLFunctionsAndLocalFactorsPartII

There were two reviews: pass a (F01–F09, the first nine finding sections below) and pass b (F01–F04, the last four). In the text, `a.Fnn` and `b.Fnn` say which pass a finding comes from. The overlapping locator findings a.F03, b.F02 and b.F03 were settled once, under pass a F03, and each still has its own section below.

## F01 (P1) — applied

Finding of review pass a.

The witness holds. MetaplecticAutomorphicForms §6.10a builds its factors with "the compatible unitary splitting characters", and §3.3 requires `χV|F×=ω_(E/F)^(dim V)`. For E=ℚ₃×ℚ₃ and χ=(ϑ,1), with ϑ ramified quadratic, χ(2,2)=(2/3)=−1. Every split splitting character and every norm twist gives 1 there.

Change: new supplier gap `gap:arbitrary-character-unitary-doubling` (MetaplecticAutomorphicForms, 6.10a and 6.11). It is stated under the MetaplecticAutomorphicForms contracts with the ℚ₃×ℚ₃ witness, added to the plan's `gaps` list, mentioned in Scope, and added to the *Needs:* lines of §§2.1, 2.2, 2.3, 2.4 and 3.4. Arbitrary χ stays in scope.

## F02 (P2) — disputed

Finding of review pass a.

The Cauchy decomposition of §4.4 is a classical (GL_u, GL_u)-duality input. Only §§4.5–4.7 consume it. It is not among the end theorems listed in the Summary (unitary L-function, Garrett pullback, critical nonvanishing and algebraicity, generalized local functional equations, stability, entireness, transfer). Pass b reached the same conclusion independently. Stating it in Suggested.lean would add a supporting lemma, which the acceptance-test rules exclude.

The docstring did list §4.4 among items lacking Harish-Chandra carriers, which was inaccurate. It now cites §§4.3 and 4.5–4.7 and adds one sentence: §4.4 is expressible on the pinned Weyl modules but is a supporting input kept as a README target.

## F03 (P3) — applied

Finding of review pass a.

Confirmed at the open heads:
- SmoothRepresentationsOfLocalGroups: *mirabolic-derivatives* is in SR.5.1 (head line 3648); SR.5.3 starts at line 4661, and *highest-derivative-adapter* is at line 4717.
- AutomorphicLFunctionsAndLocalFactors: the Jacquet–Shalika Satake bound is in AL.2 (line 1821); AL.3 starts at line 1953.

Old → new:
- The `rectangular-orbit-support` contract now reads "conversion between SR.5.1 mirabolic-derivatives and SR.5.3 highest-derivative-adapter". Its plan `needs` and `section` changed to "SR.2, SR.3.3, SR.5.1 and SR.5.3".
- SR.5.1 is added to the SR consume list.
- The Satake bound moves from AL.3 to AL.2 in the AL contract, in the §10.3 *Needs:* line and in the Layer 10 Dependencies.

## F04 (P3) — applied differently

Finding of review pass a.

The reviewer is right that the zero-data and k=1 Checks cannot detect the sign of ψ_U.

The proposed U₀ root-chart Check would need a root of U₀ on which ψ_U is nontrivial, and I could not certify that from the sources read. I used a Check that tests the same convention on certain data instead. The left V-descent of the integrand needs ψ_U(v)=ψ_(k,c)(δvδ⁻¹)⁻¹ (§5.4). With ψ_U⁻¹, for k=c=2 over ℚ₃ with upper-right block diag(1/3,0), the integrand picks up the factor ζ₃²≠1 and does not descend.

This Check replaces the two duplicated zero-data and k=1 bullets. The central-cancellation and GSpin₂ Checks are kept.

## F05 (P2) — applied

Finding of review pass a.

At its head, AutomorphicPadicLFunctionsPartII is about critical Hecke values and ray-class measures and has no unitary-doubling target. AutomorphicCongruences exists neither on main nor in any open pull request.

Changes:
- Scope: "p-adic interpolation … belongs to AutomorphicPadicLFunctionsPartII … AutomorphicCongruences" → "p-adic interpolation and integral congruence applications of the unitary doubling outputs are outside this roadmap".
- Downstream consumers: now names "subsequent arithmetic applications".
- §1.2: the same pattern is fixed; "ordinary Schwartz choices belong to AutomorphicPadicLFunctionsPartII" → "are not targets here".

## F06 (P2) — applied

Finding of review pass a.

Verified: for SO₂/ℚ₃ with π=1, τ ramified quadratic and τ(3)=1, γ=ε(s,τ)²=τ(−1)·3X²=−3X², while L=1.

§6.7 now takes the zero divisor of γ on ℂ× and ignores the order at X=0, equivalently the zeros in the s-plane, as in CFK line 673. A new Check records γ=−3X² → P=1, L=1, and that an unramified factor 1−aX still contributes its root a⁻¹. The §6.11 tempered argument now says "zeros on ℂ×".

## F07 (P2) — applied

Finding of review pass a.

The witness holds. For SO₂, CFK (3.8) has no twist of π, and with μ of negative exponent there is no Langlands datum with positive exponent in the fixed coordinates.

Changes:
- §6.7 defines the torus factors directly: L=L(α×τ)L(β×τ) and ε likewise, with no condition on the sign of the exponents.
- §6.11's statement now says γ is a theorem, while for L and ε it proves the γ-identity and agreement with the other §6.7 definitions.
- The common norm-shift sentence is replaced by the base-case comparison, including the GSpin₂ shift via Υ(e₁∨(y)e₀∨(x))=yx² (CFK line 292).
- New Check: μ=χ|·|⁻¹, τ=χ, at s=2 the value is 81/52.

## F08 (P2) — applied

Finding of review pass a.

Verified: CFK Lemma 3.16 uses R with Levi GL_l×G_(c−2l), which needs 2l≤c (CFK line 430). It also assumes τ is unitary generic (CFK line 852).

§5.3 now gives the two transforms separate statements, assumptions and API bullets:
- the c-splitting functional, with 0<l<c;
- the classical transform, with a split G_c and 1≤l≤⌊c/2⌋.

Also added: the r_z locator (CFK (3.23), line 845), a *Needs:* entry for §5.4 (coordinates only, so no cycle), and the c=3, l=2 negative-control Check.

## F09 (P2) — applied

Finding of review pass a.

Verified at CFK lines 857–858: the target is a↦W_l(diag(a,I_((k−1)l))).

§5.3 now has the restriction space R_l(τ) as the transform's codomain and explicitly asserts no injectivity of the restriction. A Check for k=3, l=1 was added: W′ vanishes on diag(a,1,1) but W′(diag(1,2,1))=ζ₃²−ζ₃.

Same pattern repaired in §7.5: "reaches arbitrary lower-model data" → "reaches every restriction a↦W_l(diag(a,I)) … which is all that the auxiliary integral of §7.1 evaluates". This is sufficient, because Z_GL only evaluates W(e₁(g)).

## F01 (P1) — applied

Finding of review pass b.

I recomputed the integral independently with the §1.2 w-projection. The A-block of m(B,1) is B_wbar⁻¹ and the D-block is B_w. The Iwasawa D-entry of ι((x,x⁻¹),1) has absolute value max|(x±1)/2|. This gives X=β₀χ_wbar⁻¹t and Y=β₀⁻¹χ_w⁻¹t, so d₁Z=((1−X)(1−Y))⁻¹, which is the factor of BC(β⁻¹)⊗χ⁻¹. The old label BC(π)⊗χ⁻¹ was wrong.

Changes:
- §2.3: the label is now L_E(s+1/2,BC(π∨)⊗χ⁻¹), equivalently BC(π)⊗(χ^c)⁻¹. β₀ is defined and the Iwasawa step is stated.
- §1.2: the w-projection is made explicit.
- §3.4: the Euler product label is corrected, and the returning factor L(1−z,BC(π∨)⊗χ^c) is identified with L(1−z,BC(π)⊗χ).
- §4.8: the factor is now that of BC(π∨)⊗χ_u.
- Layer 2 Examples: a new Check with β₀=i, χ=(1,−1), t=1/2 gives (3/4+i)⁻¹ against (3/4−i)⁻¹.

## F02 (P3) — applied

Finding of review pass b.

This is the AL.2 Satake-bound half of a.F03. The changes are listed there.

## F03 (P3) — applied

Finding of review pass b.

This is the SR.5.1 *mirabolic-derivatives* half of a.F03. Both the needs text and the plan `section` were updated, as listed there.

## F04 (P3) — applied

Finding of review pass b.

EHLS lines 1920–1924 and 2224–2227: (54) defines f_(p,s)(g)=|ν|^(sn/2)⊗f_(w,s)(g_w) on G_p=ℚ_p^××∏G_w, which determines the full GU covariance.

Change: "rather than the incomplete multiplier formula in (54)" → "uses the decomposition G(ℚ_p)=ℚ_p^××∏_w G_w through which (54) attaches |ν|^(sn/2), recomputed here in the m(B,λ) coordinates".

## Checks run

- **Elaboration.** `lake env lean packages/AutomorphicLFunctionsAndLocalFactorsPartII/Suggested.lean`, run from the content checkout, exited 0 with no output. No TauCeti module is imported, so nothing was built.
- **Binder check.** Suggested.lean declares nothing, so there is no `#check @name` comparison to make. Nothing changed in Lean except the docstring.
- **Dependency check.** Output:

  ```text
  depcheck: 56 roadmaps, 650 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line. The new gap names MetaplecticAutomorphicForms, which is already this roadmap's last supplier in the order.
- **Citation resolver.** `roadmaps resolve` reports no unresolved citations or Lean names.
- **Gap consistency.** All 22 slugged gaps have identical `needs` text in the README and in `design/plan.json`. That file was checked mechanically after the edit.

## Adversarial pass on new and changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §2.3 label BC(π∨)⊗χ⁻¹ | β₀(ϖ)=i, χ_w(ϖ)=1, χ_wbar(ϖ)=−1, t=1/2 | X=Y=−i/2; d₁Z=(1+i/2)⁻²=(3/4+i)⁻¹; old label (i,i) gives (3/4−i)⁻¹ | new label matches |
| §2.3 label, degenerate | χ_w=χ_wbar; β₀²=1 | the two labels coincide | explains why earlier Checks missed it |
| §2.3 Iwasawa step | \|x\|=q^(−m), q^m, 1 (residue characteristic ≠2) | \|d\|=1, q^m, 1; \|a\|=q^(−m), 1, 1 | gives X^m, Y^m, 1 |
| §2.3 X=1/2, Y=1/3 Check | as written | Z=5/2, d₁=6/5, product 3 | unchanged, consistent |
| §3.4 returning factor | (χʷ,−s) with spherical identity | L(1−z,BC(π∨)⊗χ^c); conjugate is BC(π)⊗χ, the dual of BC(π∨)⊗χ⁻¹ | consistent |
| §4.8 factor | χ=χ_u⁻¹ | BC(π∨)⊗χ⁻¹=BC(π∨)⊗χ_u | consistent |
| gap witness | (ϑ,1) at (2,2) over ℚ₃ | −1, while splitting characters and norm twists give 1 | gap needed |
| §6.1 ψ_U descent | k=c=2, ℚ₃, block diag(1/3,0) | ψ_U: 1; ψ_U⁻¹: ζ₃² | discriminates |
| §6.7 punctured divisor | SO₂, π=1, τ ramified quadratic, τ(3)=1; P=1−aX | γ=−3X² → P=1, L=1; root a⁻¹ kept | P(0)=1 holds |
| §6.7 torus base case | μ=χ\|·\|⁻¹, τ=χ, s=2, q=3 | L=(3/2)(27/26)=81/52; exponents −1 and +1 | covered |
| §6.7 torus vs Langlands | SO₂ with μ of positive exponent, σ=μ | L(μτ)L(μ⁻¹τ)·1 = product | agree |
| §6.11 GSpin₂ shift | \|Υ\|^(r₀) with Υ(e₁∨(y)e₀∨(x))=yx² | σ→σ\|·\|^(r₀); σ⁻¹χ_π→σ⁻¹χ_π\|·\|^(−r₀+2r₀) | both shift by r₀ |
| §6.11 old Checks | 4, 9/8, Γ_ℝ(s+1)², ψ_b rule | unchanged values | consistent with the base case |
| §5.3 classical range | c=3, l=1, k=2; c=3, l=2; c=2, l=1 | exponent 1, l≤1 holds; c−2l=−1 excluded; l=1 allowed (tail rank 0) | correct range |
| §5.3 restriction space | k=3, l=1, ψ(1/3)=ζ₃ | W′(diag(a,1,1))=0; W′(diag(1,2,1))=ζ₃²−ζ₃ | no injectivity claimed |
| §7.5 reach | Z_GL uses W(e₁(g)) only | the restriction space suffices | consistent |
| §1.2 w-projection | n=1, m(B,1)=diag(B_wbar⁻¹,B_w) | χ_wbar⁻¹(a)χ_w(d)\|a/d\|^(s+1/2) = §1.1 covariance | consistent |

## Notes for the maintainer

- **New supplier gap.** `gap:arbitrary-character-unitary-doubling` asks MetaplecticAutomorphicForms §§6.10a–6.11 for doubling factors and the completed function for unitary inducing characters without the splitting restriction.
- **Ownership against open pull requests.** I checked with `roadmaps grep` over main and all open heads. Only MetaplecticAutomorphicForms owns the classical doubling factors.
- **No renamed declarations.** No Lean names exist, and none changed. No other roadmap cites this one.
- **Sources.** The CFK manifest locator now also lists Lemma 3.16 and (3.23). No new source was fetched, and no `needs-references.toml` entry was written.
- **Suspicious text.** None found in the reviews.
