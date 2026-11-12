# Review of VonNeumannAlgebras (pull request #2242 at 2f485b4)

**Verdict:** needs changes

The previous review of this roadmap folder (r46, accepted) has no findings, so there is nothing to re-check.

## R01 (P2) — Lemma 4.5 relation has no existential for x

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:3150–3151`, "the bounded relation `TJx'JT=λ(2−R)xR+conj(λ)Rx(2−R)` for x'∈M' and `Re λ>0` (Lemma 4.5)".

**Claim:** x is unbound, so read literally the identity holds for every x∈M, which is false. The source only says that some x∈M exists, depending on x' and λ.

**Witness:** Take x=0, x'=1 and H≠0. The left side is `T²`, which is nonzero because T is injective; the right side is 0. rieffel-van-daele-1977 lines 623–625: "there is an x∈M such that".

**Repair:** Replace with "establish their real predual separation lemma (Lemma 4.3) and the bounded relation of Lemma 4.5: for every x'∈M' and every λ with `Re λ>0` there is x∈M with `TJx'JT=λ(2−R)xR+conj(λ)Rx(2−R)`; then its scalar matrix-coefficient integral solution …". Check on x'=1: `x=(2Re λ)⁻¹·1` gives `R(2−R)=T²` on both sides.

## R02 (P2) — Tomita's theorem can be stated at the pin but is missing

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:61–63`, "Layer 10: Tomita–Takesaki theory, … There is no closed antilinear operator `S`, modular operator `Δ`, modular conjugation `J` or modular automorphism group."

**Claim:** The revised V10 builds J from bounded data on Mathlib's real closed subspaces. Rieffel–van Daele Proposition 2.3 pins J down, and stating `JMJ=M'` then needs no carrier for S or Δ. The headline can be stated, but it is not in the file.

**Witness:** The Repair's theorem, inserted after `existsUnique_isKMS_flow` in a scratch copy of `Suggested.lean`, elaborates under `lake env lean` (exit 0, 33 `sorry` warnings and nothing else). The one-tactic probe does not close it.

**Repair:** Add after `existsUnique_isKMS_flow`:

```lean
open ClosedSubmodule in
/-- **Tomita's theorem** `JMJ = M'` for a cyclic separating vector `Ω`. The modular conjugation
`J` is the antiunitary involution characterized by `J(K) = K.symplComp` and `0 ≤ Re⟪ξ, J ξ⟫`
on `K = closure_ℝ(M_sa Ω)` (README, V10.StandardRealSubspaces and V10.ModularTheory;
Rieffel–van Daele, Proposition 2.3 and Theorem 4.2). On `M₂(ℂ)` acting on its Hilbert–Schmidt
space with `Ω = h^{1/2}`, `J` is the adjoint. -/
theorem exists_conj_commutant_eq_of_isCyclic_of_isSeparating {M : VonNeumannAlgebra H} {Ω : H}
    (hc : IsCyclic M Ω) (hs : IsSeparating M Ω) :
    ∃ J : H ≃ₗᵢ⋆[ℂ] H, (∀ ξ, J (J ξ) = ξ) ∧
      (∀ ξ, ξ ∈ (Submodule.span ℝ {η | ∃ x ∈ M, IsSelfAdjoint x ∧ x Ω = η}).closure ↔
        J ξ ∈ (Submodule.span ℝ {η | ∃ x ∈ M, IsSelfAdjoint x ∧ x Ω = η}).closure.symplComp) ∧
      (∀ ξ ∈ (Submodule.span ℝ {η | ∃ x ∈ M, IsSelfAdjoint x ∧ x Ω = η}).closure,
        0 ≤ (inner ℂ ξ (J ξ)).re) ∧
      ∀ y : H →L[ℂ] H, y ∈ M.commutant ↔ ∃ x ∈ M, ∀ ξ, y ξ = J (x (J ξ)) := by
  sorry
```

In the module docstring, replace the first two sentences of the Layer 10 bullet with: "Layer 10: the closed-operator form of Tomita–Takesaki theory (`S = JΔ^{1/2}`, `Δ^{it}`), the finite-dimensional identification `σ_t = Ad(h^{it})` and the Bost–Connes type III theorem. There is no closed antilinear operator `S`, no unbounded modular operator `Δ` and no modular automorphism group. Tomita's theorem `JMJ = M'` is stated below, with `J` characterized on Mathlib's real closed subspaces." In README V10.ModularTheory (`:3158`), after "In particular `JMJ=M'` and `U_t M U_t*=M`;", add: "the first, with J characterized by `J(K)=K.symplComp` and `Re⟨ξ,Jξ⟩≥0` on K (Rieffel–van Daele, Proposition 2.3), is `exists_conj_commutant_eq_of_isCyclic_of_isSeparating`;".

## R03 (P3) — Suggested.lean keeps the 2009 Jones page numbers

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:575–576` "Jones, Exercises 7.3.2 and 7.3.8, pp. 46–47"; `:599` "Definition 16.1.1, p. 107"; `:615–616` "Theorems 16.3.1 and 16.3.2, pp. 108–109"; `:701` "§16.2, pp. 107–108".

**Claim:** `README.md:5433–5434` now makes the 13 November 2015 notes the only Jones reference. These four locators are page numbers from the 2009 version, and in the 2015 notes they point to the wrong pages.

**Witness:** 2015 notes (key `jones-vna`): lines 1518, 1538 (Exercises 7.3.2, 7.3.8, p. 47); 3714 (Definition 16.1.1, p. 113); 3730–3744 (§16.2, pp. 113–114); 3745 (Theorem 16.3.1, p. 114); 3817 (Theorem 16.3.2, p. 115).

**Repair:** Replace them with "Jones, Exercises 7.3.2 and 7.3.8, p. 47", "Jones, Definition 16.1.1, p. 113", "Jones, Theorems 16.3.1 and 16.3.2, pp. 114–115" and "Jones, §16.2, pp. 113–114".

## R04 (P3) — V10.StandardRealSubspaces has two Checks, and none pins its strip convention

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:2987`, "with `f(t)=⟨η,U_t ξ⟩` and `f(t−i)=⟨U_t ξ,η⟩`", and the Checks at `:3000–3007`.

**Claim:** The block defines R, T, J and U_t but has only two Checks. Neither evaluates the KMS boundary values, so no Check rules out swapping them, which amounts to using the group `U_(−t)`.

**Witness:** In the M₂ model take ξ=η=(e₁₂+e₂₁)h^(1/2). Then `f(z)=(1/3)2^(iz)+(2/3)2^(−iz)` gives `f(t−i)=(2/3)2^(it)+(1/3)2^(−it)=⟨U_tξ,η⟩`. With `U_(−t)` the same construction gives `(1/6)2^(−it)+(4/3)2^(it)≠⟨U_(−t)ξ,η⟩`.

**Repair:** Add the Check: "- In the same model take ξ=η=(e₁₂+e₂₁)h^(1/2)=3^(−1/2)e₁₂+(2/3)^(1/2)e₂₁∈K. Then `f(z)=(1/3)2^(iz)+(2/3)2^(−iz)` is bounded on `−1≤Im z≤0`, `f(t)=⟨η,U_tξ⟩`, `f(t−i)=(2/3)2^(it)+(1/3)2^(−it)=⟨U_tξ,η⟩`, and `f(t−i/2)=(2√2/3)cos(t log 2)` is real. For the group `U_(−t)` the bounded extension has `f(t−i)=(1/6)2^(−it)+(4/3)2^(it)`, not `⟨U_(−t)ξ,η⟩=(1/3)2^(it)+(2/3)2^(−it)`, so the condition fixes the sign of t."

## R05 (P3) — two new Mathlib inputs are missing from the supplier contract

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:163–257` (From Mathlib) and `:4358–4365` (Layer 11 Dependencies). The two inputs are used at `:3163` and `:3707`.

**Claim:** V10.ModularTheory consumes `Continuous.fourierInv_fourier_eq` and V11 consumes `IsCoercive.continuousLinearEquivOfBilin`, but "From Mathlib" lists neither. Layer 11's Dependencies also omit Lax–Milgram.

**Witness:** In README.md, `fourierInv_fourier_eq` occurs only at lines 3163 and 3664, and `IsCoercive` only at 3707. At the pin: `Mathlib/Analysis/Fourier/Inversion.lean:175` and `Mathlib/Analysis/InnerProductSpace/LaxMilgram.lean:105`.

**Repair:** Append to the StandardSubspace paragraph of From Mathlib: "For V10.ModularTheory consume the Fourier inversion theorem `Continuous.fourierInv_fourier_eq`, for a continuous integrable function on a finite-dimensional real inner product space whose Fourier transform is integrable (`Mathlib/Analysis/Fourier/Inversion.lean`). For V11 consume the Lax–Milgram theorem `IsCoercive.continuousLinearEquivOfBilin`, for a coercive bounded real bilinear form on a complete real inner product space, not assumed symmetric (`Mathlib/Analysis/InnerProductSpace/LaxMilgram.lean`)." Add to the Layer 11 Dependencies: "- Mathlib `IsCoercive.continuousLinearEquivOfBilin` for the left Hilbert algebra regularization."

## R06 (P3) — the description overstates the Jones change and omits the PolarDecomposition change

**Location:** Pull-request description: "Use Jones's 13 November 2015 notes throughout this roadmap, correct the changed page references".

**Claim:** `Suggested.lean` still cites 2009 Jones pages (R03). The text also does not say that the OperatorTheory/PolarDecomposition contract (PD-A36–A45, PD-B23–B36) is now consumed over ℝ as well as ℂ.

**Witness:** `README.md:450–458` at the head: "between complete real or complex Hilbert spaces … the modulus and polar decomposition are consumed over both ℝ and ℂ". `Suggested.lean:599`: "Jones, Definition 16.1.1, p. 107".

**Repair:** Replace the first bullet with: "This revises the VonNeumannAlgebras roadmap on main. It adds the Layer 10 target V10.StandardRealSubspaces (bounded modular data of a Mathlib `StandardSubspace`), rewrites V10.ModularTheory around the Rieffel–van Daele bounded proof, adds Rieffel–van Daele (1977) as a source, and consumes OperatorTheory/PolarDecomposition PD-A36–A45 and PD-B23–B36 over ℝ as well as ℂ. New Mathlib inputs: `StandardSubspace`, `Continuous.fourierInv_fourier_eq` and `IsCoercive.continuousLinearEquivOfBilin`. Every Jones locator in README.md and Suggested.lean refers to the 13 November 2015 notes, and Suggested.lean adds Tomita's theorem `exists_conj_commutant_eq_of_isCyclic_of_isSeparating`." Drop "No Lean files change" once R02 and R03 are applied.

## Verified sound

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| V10.StandardRealSubspaces: R, T, J laws | `K=ℝ⊂ℂ` | p, q are the coordinate projections; `R=1`; `p−q=diag(1,−1)`, so `T=1` and J is conjugation; `K.symplComp=ℝ`, complex `K^⊥=0` | holds; agrees with Check 1 | none |
| same, M₂ model | HS `M₂`, `h=diag(2/3,1/3)`, coefficients on e₁₂, e₂₁ | `p(1,0)=(1/3,√2/3)`, `q(1,0)=(1/3,−√2/3)`: `Re₁₂=(2/3)e₁₂`, `Re₂₁=(4/3)e₂₁`; `T=2√2/3=√(2/3·4/3)`; `J(u,v)=(v̄,ū)`, the adjoint | holds; agrees with Check 2 | none |
| order of the imaginary powers in U_t | same | `(2−R)^(it)R^(−it)e₁₂=(4/3)^(it)(2/3)^(−it)e₁₂=2^(it)e₁₂`; reversed order gives `2^(−it)`; `he₁₂h⁻¹=2e₁₂` | holds | none |
| symplectic-complement laws | general K | `K.symplComp` and its `i`-multiple have projections `1−q`, `1−p`: `R'=2−R`, `p'−q'=p−q`, `U'_t=R^(it)(2−R)^(−it)=U_(−t)` | holds | none |
| real-subspace KMS (RvD Thm 3.8) | M₂, `ξ=η=3^(−1/2)e₁₂+(2/3)^(1/2)e₂₁` | `f(t−i)=(2/3)2^(it)+(1/3)2^(−it)=⟨U_tξ,η⟩`; `f(t−i/2)=(2√2/3)cos(t log 2)`; `U_(−t)` gives `(1/6)2^(−it)+(4/3)2^(it)` and fails | holds; no Check records it | R04 |
| half-strip condition, ξ≠η | `η=i3^(−1/2)e₁₂−i(2/3)^(1/2)e₂₁` | `⟨η,U_tξ⟩=−(i/3)2^(it)+(2i/3)2^(−it)`; at `t−i/2`: `(2√2/3)sin(t log 2)`, real | holds | none |
| ModularTheory: K, RΩ=Ω | M₂ model, `Ω=h^(1/2)` | `Re⟨Ω,ixΩ⟩=Re(iφ(x))=0` for x=x*: `qΩ=0`, `pΩ=Ω`, `RΩ=Ω`, `JΩ=Ω*=Ω`, `U_tΩ=Ω` | holds | none |
| Lemma 4.5 as written | `x=0`, `x'=1`, H≠0 | left `T²≠0` (T injective); right 0 | false without "there is x∈M" | R01 |
| Lemma 4.5 with the existential | tracial `M_n` (`R=T=1`); x' right multiplication by a | `Jx'J` is left multiplication by `a*`, which equals `2Re λ·x` for `x=a*/(2Re λ)∈M`; `x'=1`: `x=(2Re λ)⁻¹` | holds | R01 repair |
| Lemmas 4.6–4.7 kernel | f≡1 | `∫e^(−θt)/(2cosh πt)dt=sec(θ/2)/2`; times `λ+λ̄=2cos(θ/2)` gives `1=f(0)` | holds | none |
| Fourier uniqueness step | `g(t)/(2cosh πt)`, g bounded continuous | continuous and integrable; the zero transform is integrable; `Continuous.fourierInv_fourier_eq` gives the function `=𝓕⁻0=0` | holds | R05 (contract) |
| comparison `R=2(1+Δ)⁻¹`, `U_t=Δ^(it)` | M₂ | `Δe₁₂=2e₁₂`→2/3; `Δe₂₁=e₂₁/2`→4/3; `Δ^(it)e₁₂=2^(it)e₁₂`, as in the ModularTheory Check | holds | none |
| Tomita `JMJ=M'` | M₂ model | J=adjoint: `J(xh^(1/2))=h^(1/2)x∈K.symplComp`; `⟨ξ,Jξ⟩=2√2/3≥0` for x=e₁₂+e₂₁; `JxJξ=ξx*` | holds; can be stated, absent from Lean | R02 |
| KMS translation `F(z)=f(z−i)` | M₂, x=e₁₂, y=e₂₁ | `f(z)=(1/3)2^(iz)`: `f(t)=φ(yσ_t(x))`, `f(t−i)=(2/3)2^(it)=φ(σ_t(x)y)`; `F=(2/3)2^(iz)`, `F(t+i)=(1/3)2^(it)` | holds; matches Lean and the KMS Check | none |
| V11 Lax–Milgram form | M₂, λ=1+i, `ζ=h^(1/2)(e₁₂+e₂₁)`, `η=h^(1/2)(ie₁₂−ie₂₁)` in `K.symplComp` | `⟨ζ,η⟩=i/3`; `B(η,ζ)=−1/3`, `B(ζ,η)=1/3`; `B(η,η)=‖η‖²=1` | coercive and not symmetric, so Lax–Milgram is needed | none |
| PolarDecomposition over ℝ | supplier on main | `OperatorTheory/PolarDecomposition/README.md:29`: 𝕜 is ℝ or ℂ; PD-A36 (`:211`) and PD-B23–B36 (`:371–397`) are stated over 𝕜 | holds | none |
| ITPFI J (Jones Example 13.3.1) | `M₂`, μ=(2/3,1/3) | `J(e₁₂Ω)=√(μ₂/μ₁)e₂₁Ω=2^(−1/2)e₂₁Ω`; HS model: `J(√μ₂e₁₂)=√μ₂e₂₁`, the same | agrees with the ModularTheory Check | none |
| `tomiyama` (13.1) | diagonal E on M₂, a=diag(2,3), b=diag(5,7), x=[[1,2],[3,4]]; `P=e₁₁·e₁₁`; A=0 | `axb=[[10,28],[45,84]]`, `E(axb)=diag(10,84)=aE(x)b`; `‖P‖=1`, `P(1)=e₁₁`; A=0: every map has norm 0 | holds | none |
| `IsInjective` (13.1) | B(H); `ℓ∞⊂B(ℓ²)`; M=0 | the identity; the diagonal expectation, norm 1; P=0 with `‖P‖=0≤1` | holds | none |
| Arveson Checks (13.1) | transpose on M₂; the state `(a+b)/2` | `Σe_ij⊗e_ij` goes to the flip, eigenvalue −1 on `e₁⊗e₂−e₂⊗e₁`; `[[1/2,c],[c̄,1/2]]≥0` iff `\|c\|≤1/2` | holds | none |
| V13b.SpatialNorm Checks | `u=e₁₂⊗e₁₂+e₂₁⊗e₂₁`; `1⊗1`; `(0,ℂ,id)` | `u*u=e₁₁⊗e₁₁+e₂₂⊗e₂₂`, ‖u‖=1 vs 2; ‖1⊗1‖=1 vs 2; slice norm 0 vs 1 | holds | none |
| `IsHyperfinite` and its Checks (13.2) | R; B(ℓ²); 0; `E_n`, `f=1_[0,1/3]` | `M_(2ⁿ)`; `A_n≅M_n⊕ℂ`; `{0}''={0}`; `E_nf=frac(2ⁿ/3)∈{1/3,2/3}` near 1/3: sup error ≥1/3, L¹ error ≤`2^(−n)` | holds | none |
| Følner Checks (13.2) | ℂ², `τ=(a+2b)/3`, u=(1,−1), x=(1,0), ε=1/10 | `8s(1−s)≤0.01` forces s≤0.00125 or s≥0.99875; ratios s and 1/2 vs 1/3; for T, `1/3+2/3=1` | holds | none |
| `isInjective_iff_isHyperfinite` | L(F₂); ℂ1; H=0 | a hypertrace gives a mean with `m(W(a))+m(W(a⁻¹))=1=m(W(b))+m(W(b⁻¹))`: four disjoint sets of total mass 2>1; ℂ1 and 0: both sides true | holds | none |
| uniqueness of the injective II₁ and II∞ factors | R vs `R⊗̄M₂`; `R⊗̄B(ℓ²)` | `M_(2ⁿ)⊗M₂=M_(2ⁿ⁺¹)`; the corner by `1⊗e₀₀` is R; both signatures require H and K separable | holds | none |
| `double_commutant_iff_isClosed_image_ofCLM` | ℂ1; `K(ℓ²)+ℂ1` | `ℂ1''=ℂ1`, closed; `(K+ℂ1)''=B(ℓ²)`, not WOT closed: both sides false | holds | none |
| `closure_unitBall_eq_unitBall_double_centralizer` | `K(ℓ²)+ℂ1` | `P_nxP_n∈K`, `‖P_nxP_n‖≤‖x‖`, and `P_nxP_n→x` strongly: both sides are `B(ℓ²)₁` | holds | none |
| `closure_isStarProjection_eq_positive_contractions` | H=ℂ | the projections {0,1} form a closed set that excludes 1/2, so the infinite-dimension hypothesis is needed | holds | none |
| `exists_faithful_nondegenerate_representation`, `_lp` | A=0 | K=0 works; on ℓ²(ℕ) the zero map has span of ranges 0, hence `[Nontrivial A]` | holds | none |
| `isCyclic_iff_isSeparating_commutant` | B(ℂ²) with e₁; ℂ1 on ℂ² with e₁ | both sides true; `ℂe₁≠ℂ²` and `e₁₂e₁=0`: both sides false | holds | none |
| `equivalent_of_subequivalent`, `tracialState_unique`, `exists_faithful_tracialState` | M₂; ℂ⊕ℂ; B(ℓ²) | `e₁₁≾1` but not `1≾e₁₁` (rank); tr/2 is the only tracial state; `t·pr₁+(1−t)pr₂` for every t; `1∼p∼1−p` forces `τ(1)=2τ(1)` | holds | none |
| `isFactor_groupVonNeumannAlgebra_iff` | ℤ/2; trivial group; F₂ | circulant centre of dimension 2 and finite class {g}: both false; ℂ: both true; `bⁿab⁻ⁿ` distinct: both true | holds | none |
| `existsUnique_isKMS_flow` | M₂, h=diag(2/3,1/3), x=e₁₂, y=e₂₁; `Ad(diag(3^(it),1))` | `F=(2/3)2^(iz)`, `F(t+i)=(1/3)2^(it)`; with rate 3, `(2/9)3^(it)≠(1/3)3^(it)` | holds | none |
| `dye`, `exists_unique_extension_of_finitelyAdditive` | ℂ² swap; M₃ transpose; M₂ | the swap is Jordan; `(e₁₂e₂₁)ᵀ=e₁₁=e₂₁ᵀe₁₂ᵀ`, anti-multiplicative; M₂ is the excluded I₂ case | holds | none |
| `exists_conj_commutant_eq_of_isCyclic` | `M₂⊗1` on ℂ⁴, `Ω=(e₁⊗e₁+e₂⊗e₂)/√2`; M₂ on ℂ² | vector state tr/2, tracial; on ℂ² the vector states are pure and never tracial | holds | none |
| `exists_linearIsometryEquiv_withLp_of_generalPosition` | ℂ², p=diag(1,0), q onto (cos θ, sin θ) | `b=cos²θ`, `√(b(1−b))=cos θ sin θ=q₁₂`; the four intersections are 0 for 0<θ<π/2 | holds | R03 (docstring page) |
| `not_hasPropertyGamma_…_freeGroup`, `hasPropertyGamma_of_isHyperfinite` | F₂; R; M₂ | `1≤2y+2ε` and `1≥3y−4ε` give ε≥1/14; R: `diag(1,−1)` at site n, trace 0, asymptotically central; M₂: central unitaries are scalars | holds | R03 (docstring pages) |
| `ergodicSMul_dense_subgroup`, `commutant_spatialTensor` | ℚ⊂ℝ; `B(H)`, `B(K)` | Jones 2015 Example 11.2.21, p. 76, non-compact, Lebesgue measure regular; `(B(H)⊗̄B(K))'=ℂ1=ℂ1⊗̄ℂ1` | holds | none |
| `exists_predual`, `exists_vonNeumannAlgebra_starAlgEquiv`, `isNormalFunctional_iff_exists_tsum_inner` | ℂ1 on ℂ; B(ℓ²) | predual ℂ; ℂ is its own model; `Σ2^(−n)⟨e_n,xe_n⟩` is normal; a Banach limit of `⟨e_n,xe_n⟩` vanishes on finite rank: not normal | holds | none |
| `exists_starAlgEquiv_multiplicationAlgebra`, `isSimpleRing_of_isTypeIIOne`, `isFiniteProjection_iff_modular` | `ℓ∞(2)` on ℂ²; B(ℓ²); M₂ | counting probability on {0,1} gives ℂ²; the compacts are a proper ideal of B(ℓ²), not II₁; M₂'s lattice is modular, the shift breaks B(ℓ²)'s | holds | none |
| `exists_isNormalSemifiniteTrace_of_isFactor`, `nonempty_starAlgEquiv_spatialTensor_of_isTypeIIInfinity`, `existsUnique_typeDecomposition` | B(ℓ²); `R⊗̄B(ℓ²)`; `M₂⊕L∞` | Tr, `Tr(p)<∞` iff p has finite rank; the corner `1⊗e₀₀` is R; type I part `M₂⊕L∞`, II and III parts 0 | holds | none |

- Gate and dependencies: the worker's gate at 2f485b4 has every counter at 0, `build=0`, `OK`. The dependency check prints `depcheck: 206 roadmaps, 1900 edges, 0 problem(s)` (no UPWARD, CYCLE or `moved:` line). `git diff --stat origin/main...HEAD` outside the folder is empty; the change removes or adds 0 headings and 0 Lean declarations.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 32 `sorry` warnings and nothing else. One-tactic probe: 32 errors at 32 lines, none closes. `#check @name` for all 56 declarations elaborates, and every needed binder (`CompleteSpace`, `SeparableSpace`, `Nontrivial`) is kept, as the README states. The R02 repair, in a copy of the file, exits 0 with 33 warnings.
- Source locators read at the text: rieffel-van-daele-1977, 22 (Def 2.1 through the Appendix, pp. 188–220; printed page = PDF page + 185); the 2015 Jones notes, 38 (every Jones locator in README.md and Suggested.lean; printed page = PDF page); anantharaman-popa 14 (printed = PDF − 6); hiai-lectures 4; peterson-notes 2; haagerup-2016 5; haagerup-1989 2; connes-feldman-weiss 5.
- Library declarations opened at the pins: Mathlib `Analysis/InnerProductSpace/StandardSubspace.lean:70–81, 102, 146, 178, 204, 210, 218`, `Analysis/InnerProductSpace/LaxMilgram.lean:105`, `Analysis/Fourier/Inversion.lean:175`, `Topology/Algebra/Module/ClosedSubmodule.lean:188`. Tau Ceti `Analysis/InnerProductSpace/LaxMilgram.lean:107` is a wrapper of the same theorem. Tau Ceti `Geometry/Symplectic/Complex/Module/Hom.lean:83` is an algebraic adapter on a non-canonical complex structure, not the bounded adapter that V10.StandardRealSubspaces owns. Neither pin has a modular conjugation or a standard-subspace KMS theory.
- Cross-roadmap citations resolved: PolarDecomposition on main `:29, 211–227, 371–397`. BanachSpaceTheory `#b1-…`, `#b2-…`, `#b4-…` are mapped to Layers 1, 2 and 4 at the head of its open revision (lines 31–37), so they need no change. OperatorAlgebraDynamics `README.md:129–136, 565–580`, QuantumGroups `:899` and QuantumFoundations (open) `:637–643` consume V10.ModularTheory and V10.KMS content that this head keeps. `roadmaps resolve` lists nothing unresolved.
- Overlap check: read QuantumFoundations, NoncompactQuantumSymmetry, CompactQuantumMetricSpaces, AnalyticNumberTheoryPartII and SelfAdjointSpectralTheory (open), and FactorRigidity, OperatorAlgebraDynamics and CStarAlgebras (main); the results-and-headings list is empty. Nothing is shared: each consumes VonNeumannAlgebras sections (V0–V4, V8, V10–V11, V13b) owned here, and none owns standard subspaces or a real-subspace KMS theory.

## Not verifiable

- Tomiyama 1957, Theorem 1, pp. 608–609: the cached `tomiyama-1957` text is the host's block page (line 5). The README cites it only through Anantharaman–Popa Appendix A.4, which was read.
- Settled as uncertified and cited by locator: Arveson 1969 (Theorem 1.2.3), Haagerup 1985, Haagerup 1987, Connes–Størmer 1978.
- Takesaki I, IV.4.9; Takesaki II, Chapter VI, VII.1–VII.2 and VIII.2.6; Takesaki III, XV.3, XVI.1.9, XVII.3.12, XVIII.2; Reed–Simon; Rudin: these are cited in V10, V11 and 13.2 and are not in the cache. I made no fetch.
- No readable `design/plan.json`, so I checked no declared supplier gap; the README declares none.

## Source issues

- **Gap** in rieffel-van-daele-1977 at Lemma 5.6, p. 211: the source calls `B(η,ζ)=Re(λ⟨η,ζ⟩)` a scalar product on iK^⊥, but it is not symmetric when Im λ≠0; it should invoke Lax–Milgram for the coercive form `B(η,η)=‖η‖²`; affects the proof.
- **Misprint** in rieffel-van-daele-1977 at Proposition 3.7, p. 196: the source refers to Definition 3.3 for the group Δ^{it}; it should be Definition 3.2; affects nothing.
- **Misprint** in rieffel-van-daele-1977 at the proof of Lemma 5.12, p. 217: the source cites Proposition 5.10; it should be Lemma 5.10; affects nothing.
- **Misprint** in rieffel-van-daele-1977 at the Appendix Proposition, p. 219: the proof cites Lemma 2.3 for J; it should be Proposition 2.3; affects nothing.
- **Misprint** in jones-vna (2015 notes) at the proof of Lemma 8.2.1, p. 54: the source states compactness for α(M₁) and the contradiction for α(M); both should be α(M_{1/2}); affects nothing.
- **Misprint** in jones-vna (2015 notes) at Definition 16.1.1, p. 113: the definition of property Γ breaks off after "a central"; it should end with a nontrivial central sequence; affects nothing.
- **Misprint** in jones-vna (2015 notes) at Theorem 16.3.2, p. 115: the source says "for n≥" with no bound; it should be n≥2; affects nothing.
- **Misprint** in anantharaman-popa at Definition 11.1.2, p. 173: ε is used without a quantifier; it should read "for every finite F and every ε>0"; affects nothing.
