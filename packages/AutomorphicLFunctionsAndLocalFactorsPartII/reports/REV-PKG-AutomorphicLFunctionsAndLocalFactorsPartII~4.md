<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1023#issuecomment-6400799273 -->
Review (claude) of 389ebdc

Verdict: accepted
Conditional on the announced gaps: `hermitian-unitary-groups`, `gspin-group-schemes`, `classical-support-quotient`, `rectangular-orbit-support`, `standard-archimedean-transfer`, `opposite-unipotent-estimate`, `real-chevalley-contragredient`, `prescribed-classical-supercuspidal-globalization`, `controlled-gl-test-globalization`, `archimedean-wavefront-whittaker`, `archimedean-induced-wavefront`, `archimedean-derivative-models`, `archimedean-degenerate-derivative`, `archimedean-whittaker-exactness`, `eisenstein-pole-cuspidal-detection`, `speh-cusp-normalized-intertwiner`, `twisted-square-normalizers`, `hermitian-residual-support`, `automorphic-constituent-support`, `gamma-supercuspidal-support`, `nongeneric-pair-epsilon-character-change`

1. **F01** (P3) the torus divergence remark in §9.1 claims more than its witness

   **Location.** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:1449`, "For the split-torus cases SO₂ and GSpin₂ the same integral diverges for every s, because the Petersson pairing of two automorphic characters over an infinite-volume quotient is infinite".

   **Claim.** The period integral diverges at every s, for every k≥1.

   **Witness.** The only witness, the Check at `README.md:1478`, is k=1 with the positive spherical kernel. For k>1 the kernel is a (U,ψ_U) Fourier coefficient with no sign; the "because" clause is the unfolded expression, which presupposes Fubini. What the argument proves: for Re(s) large, the inner g₂-integral is absolutely convergent and equals φ₂(g₁)·Z_local(s), constant on G(F)⧸G(A), so absolute convergence of the double integral would contradict Fubini; for s outside the convergence region nothing is established. Also, "Write SO₄ as the image of SL₂×SL₂" (`README.md:1478`) holds for algebraic groups, not on F-points (SO₄(F) is larger by the spinor norm); the Check survives because the archimedean one-parameter subgroup it uses lies in that image.

   **Repair.** Replace "diverges for every s, because" by "does not converge absolutely for Re(s) large, for every k≥1: by Fubini on the inner integral its g₁-integrand would be the constant Z_local(s) on the infinite-volume quotient, and for k=1 the Check below exhibits the divergence directly". In the Check write "the isogeny SL₂×SL₂→SO₄" and "the one-parameter subgroup b∈ℝ_(>0), which lies in the image of SL₂(ℝ)×SL₂(ℝ)". Retested on the k=1 instance: unchanged, log R divergence.

2. **F02** (P3) the Jacquet–Shalika Satake bound is cited from AL.3 but lives in AL.2

   **Location.** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:81`, "AL.3 … the Jacquet–Shalika Satake bound"; `README.md:1647`, "Layer AL.3 (Rankin–Selberg factors and the Jacquet–Shalika Satake bound)".

   **Claim.** The bound q^(−1/2)<|α_i|<q^(1/2) is a Layer AL.3 target of AutomorphicLFunctionsAndLocalFactors.

   **Witness.** At the open head of AutomorphicLFunctionsAndLocalFactors (its README at #924), the anchor `jacquet-shalika-satake-bound` is at its line 1817, inside `## Layer AL.2` (line 1582) and before `## Layer AL.3` (line 1951).

   **Repair.** In both places write "AL.2, The Jacquet–Shalika Satake bound" (keep the AL.3 citations for the Rankin–Selberg factors). Nothing else changes; §10.3's Needs line then names AL.2 and AL.3 separately.

All three findings of round 3 are repaired, and the repair's second defect (entireness for the split tori) is repaired with it. Two non-blocking notes remain. No package file was changed by this review; no source was added to the manifest.

## Verified sound

### Previous findings, checked first

| Round-3 finding | Status | Repaired passage and recomputed witness |
|---|---|---|
| F01 (P2), θ domain | Repaired | `README.md:1363` "G₀=GSpin₀=GL₁ when H=GSpin_(2kc) … θ=1 when H=Sp or SO"; `:1365`, `:1399–1401`, `:1411`, `:1419–1421` carry "θ=1 outside GSpin". CFK lines 1505–1507 and 1516–1518 say exactly this. New Check `:1385`: SL₂, section covariance \|a\|^(s+1) = \|a\|^(2u), u=(s+1)/2, Res_(u=1)=3/π gives Res_(s=1)=2·3/π=6/π; with θ=1, τ=1 is excluded at t=0. The base case `:1423` reads \|det\|^(it)τ≄τ∨. Every remaining θ in the README is the MVW involution (§3.2) or the scalar θ(s) (§6.5). |
| F02 (P1), torus period | Repaired | `README.md:29` names the split-torus cases; `:1449–1451` restricts §9.1 to Sp_c (c≥2), SO_c, GSpin_c (c≥3) with the GK assumption (GK lines 4161–4163); `:1486–1488`, `:1520–1522`, `:1532–1534` restrict §§9.2–9.4; new §6.11 (`:1197–1223`) and §9.5 (`:1540–1556`) carry the torus branch through AL.3; §§10.4–10.7 route the tori through α⊞β. Recomputed: weights of (diag(a,a⁻¹),diag(b,b⁻¹)) on X↦AXB⁻¹ are a/b, ab, (ab)⁻¹, b/a, so t₁=a/b on the diagonal plane and t₂=ab on the antidiagonal one; the Siegel parabolic Stab{X: im X⊂ℓ} is B_A×SL₂; the inducing character \|det\|^(s−1/2) is trivial on the image of SL₂(𝔸), so E is constant along b; ∫₁^R dr/r=log R. The repair's second defect (§9.4 false for tori) is verified in the adversarial table below. |
| F03 (P3), HLS pages | Repaired | `README.md:1710` "internal pp.1–68". HLS line 1 records 68 pages; HLS line 2738 is the last page, printed 68. |

The six administrative records G1–G6 of `design/plan.json` remain settled for the reason the round-2 repair gave (they are referenced from the plan's coverage stages, which a repair may not edit, and every obligation in them is a target here or a named contract); round 3 accepted this and nothing in round 4 changed it. I do not re-raise it.

### Principles

Read: all 64 targets (62 plus the new §6.11 and §9.5), their Checks, every `*Needs:*` line, every layer's Examples and Dependencies, the scope, conventions and contracts sections, `Suggested.lean`, `sources.toml`, `metadata.toml` (math.NT) and the plan's gap list. The roadmap extends AutomorphicLFunctionsAndLocalFactors and imports its GL theory; the torus branch imports the GL₁×GL_k functions from AL.3 rather than re-planning them. No route-specific restriction: the split tori keep every place, and §6.11's ramified case is a target. No copied passage, no algorithm, no `set_option`, no `lemma`, no sorried data, no process words (the only grep hit, `README.md:177`, is the word "ground"). The new text is prose with one indented formula block.

### Seeded sample

Each passage was opened at its line in the cached text; "supported" means the source states what the README attributes to it at the stated generality, with the README's own normalization claims identified as targets.

| Target | Passage | Hypotheses and result |
|---|---|---|
| 0.1 | EHLS §4.1.1, p.44, lines 1862–1881 | V^d={(x,x)}, V_d={(x,−x)}, P=Stab(V^d), M≅GL_K(V)×G_m with m(A,λ)=diag(λ(A*)⁻¹,A), δ_P=\|det∘Δ\|^n: README §§0.1–0.2 agree. EHLS identifies N with Her_n after a basis choice; the README's skew-adjoint/trace-zero rescaling is its own explicit version. Supported. |
| 0.3 | CFK §1, pp.6–8, lines 250–304 | Sp₀, SO₀, SO₁ trivial (253); GSpin₀=GSpin₁=GL₁, GSpin₂=GL₁×GL₁, C•=e₀∨(GL₁) (266–267); dual groups table (277–278); N=c+1 for Sp, else 2⌊c/2⌋ (304); "c>1" (302). Supported, including c=2. |
| 1.1 | EHLS §4.1.2, p.44, lines 1882–1889 | I(χ,s)=Ind(χ(det∘Δ)δ_P^(−s/n)\|ν\|^(sn/2)), smooth unitarily normalized: identical to I_EHLS. Supported. |
| 2.4 | EHLS §§4.1.3–4.1.4, p.45, lines 1893–1910 | Eisenstein series, meromorphic continuation for K-finite sections, doubling summary. The local functional equation itself is the README's transport target from MetaplecticAutomorphicForms §6.10a; EHLS supplies only the family. Supported as a family locator. |
| 3.4 | EHLS §4.2.1, pp.48–49, lines 2081–2116 | d_(n,v)I_v=L_v(s+1/2,π_v,χ_v) and L_v(s,π_v,χ_v)=L_v(s,BC(π_v)⊗χ_v∘det), (53), HLS errata (2109–2116). The χ⁻¹ is the README's right-action claim, tested by the rank-one sum below. Supported. |
| 4.5 | EHLS §4.4.2, pp.72–73, lines 3373–3400 | χ=‖·‖^mχ₀, Λ(m,χ₀)=(m−b;…;−m+a;…), J_χ=j^(−m+a)j′^(−m+b)ν^(n(m+a+b)), restriction to U(a,b)×U(b,a) is a multiplicity-free sum over C₃(m,χ₀). The README's compact-coordinate labels are its declared dictionary (gap G3 text); the phase test below shows the README's labels match J_χ. Supported with that dictionary as a target. |
| 4.8 | EHLS Lemma 4.5.2, Remark 4.5.3, (107), pp.80–81, lines 3680–3691 | Image in I_σ(m−n/2,χ), similitude factors omitted, f_σ=B·D·J; §4.5.4 writes f_σ∈I(χ_u,m). The README's s_crit=t−n/2 with χ_u⁻¹ is computed below and is self-consistent; see Source issues. |
| 5.2 | MODELS Def. 1, pp.2–3, lines 94–100; p.5–6, lines 200–222; GK lines 72–80 | Vanishing for σ≿(k^c) plus one-dimensional Hom; (2.4) may be reducible, finite length, central character, unique (k,c) subquotient by exactness (GGS17 Cor. G); GL₂ blocks as quotients of ρ_c(χ₁)×ρ_c(χ₂) (204–206). Supported. |
| 5.4 | CFK §3.3, pp.12–13, lines 491–534; GK §1.5, p.12, lines 504–517 | c>1, k≥1; Q with Levi GL_c^(k−1)×G_(2c); ψ_U for ((2k−1)^c1^c); e injective except GSpin with diagonal C• kernel; k=1 gives U=1; P′=^(kc)P, δ=δ₀δ₁, V with δV=U_(c^k), ψ_U(δ⁻¹u)=ψ_k⁻¹(u), ι with δe(g,ιg)⊂M_P; Example 3.1 for Sp. Supported. |
| 7.5 | CFK Prop. 3.17, p.24, lines 987–993 | σ∈Irr(GL_l) unramified at finite places, τ unitary generic; (3.32) exponent s−(kc−c−l+1)/2; continuous meromorphic continuation; data with Z₂/L(s,σ∨×χ_πτ) nonzero. Supported. |
| 8.2 | CFK (4.5), Lemma 4.3, pp.35–36, lines 1560–1583; (4.8)–(4.9), pp.37–38, lines 1648–1660 | M₁ holomorphic Re(s)>−c′/2, M₂ on Re(s)≥1/2, normalized ratio holomorphic for Re(s)>(1−c′)/4; the proof's roles of the two L-factors are reversed (recorded in round 3), and the README states the correct roles. Supported. |
| 8.5 | CFK proof of Thm 4.8, p.40, lines 1724–1729 | Twisted ∧² and Sym² partial factors holomorphic on Re≥0 under (1); L(s+c/2,τ) holomorphic on Re(s)≥1/2 since c≥2; b^S holomorphic on Re(s)≥1/2. Supported. |
| 9.1 | GK §3.2, pp.72–73, lines 4161–4198; CFK §4.3, pp.38–39, lines 1668–1709 | GK assumes nontrivial unipotent subgroups (4162–4163) and says low rank "can be included" (4193); CFK takes c>1 (1668), claims convergence from cusp-form decay (1691–1693), and (4.10) is the Euler identity. The README now carries GK's assumption. Supported for the restricted groups; see Source issues for the tori. |
| 10.4 | CFK Thm 0.1, p.2, lines 58–62; §4.4, pp.40–41, lines 1749–1760 | Rank n≥1 (so SO₂ is formally included), nonempty S_π, arbitrary Π_ν with central character χ_π^(N/2) at S_π. Supported. |
| 10.5 | CFK Thm 4.10, p.41, lines 1792–1815 | Reduction to the archimedean-matched transfer, globalization of σ′ unramified at all finite ν≠ν₀, η highly ramified on S_π−{ν₀} with η_(ν₀)=1, cancellation through (3.14). The README's contract weakens unramifiedness to common-good places, as recorded in round 3. Supported. |

Also reread for the repairs: CFK Theorem 3.5, (3.8)–(3.13), lines 634–660, and (3.15)–(3.17) with the Sp₀/GSpin_(c≤1) tail conventions, lines 671–697; CFK Theorem 4.8 and proof, lines 1719–1746; GK Theorem A, lines 88–105. The three uncertified works (CFK22 Lemma 7.3, YAM14 Theorem 7.1, KAP23 Theorem 25) are cited by locator only and were not requested.

### Computed adversarial table

Rows cover the sample, the headlines, every passage the repairs touched and the finding targets. "Wrong" values are negative controls.

| Statement | Instances | Values computed on both sides / negative control | Result |
|---|---|---|---|
| Conventions, split-torus cases | SO₂, GSpin₂, SO₃≅PGL₂, GSpin₃≅GL₂, Sp₂ | dim G/C• = 1, 1, 3, 3, 3; character group of G/C• is ℤ, ℤ, 0, 0, 0; A×/F× has infinite volume. | Compatible. |
| 0.1 doubled form | h=x̄y, (1,−1),(1,1); (u,v)=(3,1) | h_W((1,−1),(1,1))=1−(−1)=2; ((3−1)/2,(3+1)/2)=(1,2), (1,−1)+(2,2)=(3,1); without halves (6,2). | Compatible. |
| 0.3 degrees, determinant | Sp₂, SO₃, GSpin₅, GSpin₂ | N=3,2,4,2; tI₄∈GSp₄ has similitude t², det t⁴=χ²; GSpin₂ standard weights e₁∨ and e₀∨−e₁∨ sum to e₀∨, so det=χ_π=χ_π^1. | Compatible. |
| 1.1 covariance | n=1, s=0, χ=1, \|B\|_E=4 | δ_mod^(1/2)=\|B\|_E^(−1/2)=1/2; inverse modulus would give 2. | Compatible. |
| 2.3 rank-one sum | X=1/2, Y=1/3 | 1/(1−X)+Y/(1−Y)=2+1/2=5/2; (1−XY)/((1−X)(1−Y))=(5/6)/(1/3)=5/2; Euler product 2·(3/2)=3, d₁=6/5, d₁Z=3. | Compatible. |
| 2.4 Weyl character | E/F=ℂ/ℝ, χ(z)=z/\|z\| | χ^c(z)=z̄/\|z\|=χ⁻¹(z), so χʷ=(χ^c)⁻¹=χ, χʷ(i)=i, χ⁻¹(i)=−i; twice returns χ. | Compatible. |
| 3.4 returning twist | same χ; z=3/4 | (χʷ)⁻¹=χ^c; reflection sends z=3/4 to 1/4, s_U=1/4 to −1/4. | Compatible. |
| 4.2/4.8 phase and fiber | n=1, m=3, a_χ=2, b_χ=0 | t=m−(a+b)/2=2, s_crit=t−n/2=3/2; on m(2,1): J_χ=2^(−1)·2^(−3)=1/16 and χ_u⁻¹(2)\|2\|_ℂ^(−1/2−3/2)=4^(−2)=1/16; at zI₂, z=e^(iπ/4): J_χ=z⁻¹z̄⁻³=z²=i and χ_u⁻¹(z)=(z/\|z\|)^(a−b)=z²=i; χ_u(z)=−i fails. General identity d^(−m+a)d̄^(−m+b)=\|d\|^(−2m+a+b)e^(iφ(a−b))=χ_u⁻¹(d)\|d\|_ℂ^(−t). | Compatible; EHLS's printed parameter m−n/2 differs (Source issues). |
| 4.5 branching labels | a=b=1, m=3, a_χ=2, b_χ=0, r=1, s=0 | κ=(2;−3), generator (−2;3); κ^opp=(1;−4), generator (−1;4); dual-and-swap of (−2;3) is (−3;2), plus a−b=2 gives (−1;4). At z=e^(iπ/8): z^(−2+3)·z^(−1+4)=z⁴=i; J_χ(zI₄)=(z²)^(−1)(z̄²)^(−3)=z⁴=i; inverse twist gives z⁻⁴=−i. | Compatible. |
| 5.2 admissible infinite-length example | ℚ₂, K(m)=1+2^m Mat₂(ℤ₂) | ℤ₂×/(1+2ℤ₂)=1, so no conductor-one character; χ_n∘det is K(m)-fixed iff n≤m, count max(m−1,0): 0,1,2 for m=1,2,3. | Compatible. |
| 5.4 middle character | Sp₂, k=2, entries 1 and 2 | ψ(1+2)=ψ(3); first entry alone ψ(1). | Compatible. |
| 6.1–6.2 torus local integral (new) | SO₂, k=1, μ unramified, c=1, spherical f | f(n(z)diag(a,a⁻¹))=\|a\|^(2s)max(\|a²z\|,1)^(−2s)=max(\|a\|\|z\|,\|a\|⁻¹)^(−2s); with t=a²: ≍\|t\|^(−s) as t→∞ and \|t\|^s as t→0, so Z converges absolutely for Re(s)>0 (and >\|r\| for μ=\|·\|^rμ₀). Z=Σ_n μ(ϖ)^n q^(−\|n\|s)=L(s,μ)L(s,μ⁻¹)/ζ(2s). Without the \|a\|^(2s) normalization one would wrongly get ∫_(\|t\|≤1)μ(t)d×t=∞. | Compatible with §6.2 and §6.11. |
| 6.3 torus multiplicity one (new) | SO₂(F)×SO₂(F) on P⧸SO₄(F)=ℙ¹(F) | Open stratum = graphs of isometries ≅ F×, one orbit under (t₁,t₂)·φ=t₁φt₂⁻¹, stabilizer {(t,t⁻¹)}, so ι=inversion and π^ι=μ⁻¹=π∨; two closed fixed points 0,∞ contribute only on a discrete set. Using only the image of SL₂(F)×SL₂(F) would wrongly give [F×:F×²] (=4 at odd p, 8 at ℚ₂) open orbits. | Compatible with GK Theorem A. |
| 6.5–6.6 ψ-change, duality (torus) | c=2, N=2 | (3.12): χ_π(b)^k ω_τ(b)²\|b\|^(2k(s−1/2)); product of two GL₁×GL_k rules: (αβ)(b)^k ω_τ(b)²\|b\|^(2k(s−1/2)); equal iff αβ=χ_π. Duality: γ(π∨×τ)=γ(α⁻¹×τ)γ(β⁻¹×τ) and γ(π×χ_π⁻¹τ)=γ(β⁻¹×τ)γ(α⁻¹×τ). The pair (σ,σ⁻¹) for GSpin₂ violates (3.12) when χ_π(b)^k≠1. | Compatible. |
| 6.11 identifications | GSpin₂ via CFK root datum | X∨=ℤe₀∨⊕ℤe₁∨; GSO₂(ℂ)=diag(x,y) with similitude xy; standard weights x=e₁∨, y=e₀∨−e₁∨; so (α,β)=(π∘e₁∨, π∘(e₀∨−e₁∨))=(σ,σ⁻¹χ_π). | Compatible with `README.md:1199`. |
| 6.11 Checks | ℚ₂, μ=τ=1, s=1; odd p, μ quadratic ramified, τ=μ; ℝ, μ=sgn; q=3 GSpin₂ | (1−1/2)⁻²=4; b=ζ₂(2)=4/3 (∧² of GL₁ is 1), Z=3, bZ=4; one factor gives 2. μτ=μ⁻¹τ=1, L=(1−p^(−s))⁻². L(s,sgn)²=Γ_ℝ(s+1)². (1−1/3)⁻¹(1+1/3)⁻¹=(3/2)(3/4)=9/8; (3/2)²=9/4. | Compatible. |
| 6.11 ramified route | α⋊π₀ with P=G | CFK (3.9) has no properness condition (line 638); G₀=SO₀ trivial, or GSpin₀ with γ=1 (line 697); block γ(α×τ)γ(α∨×χ_πτ)=γ(α×τ)γ(β×τ). Tempered: poles of L(s,α×τ)L(s,β×τ) in Re≤0, dual factors at 1−s in Re≥1, no cancellation, so §6.7's P recovers the product. | Compatible. |
| 8.1–8.4 θ domain | SL₂, k=c=1, τ=1, θ of conductor 5; GSpin₄, k=1, c=2 | θ(u)=−1 at a 5-adic unit while \|u\|^(it)=1; residue 6/π at s=1; with θ=1 excluded at t=0. GSpin₄ Siegel Levi GL₂×GL₁ carries θ. | F01 repaired. |
| 8.2 half-planes | c=2 (c′=1), s=1/2 | M₁ on Re(s)>−1/2; N₂ on Re(s)>0; L(2s)=L(1) holomorphic iff no pole at 1, i.e. θ⁻¹τ≇τ∨, excluded; L(2s+1)=L(2)≠0. | Compatible. |
| 8.3 exponents | c=2, Re(s₀)=1/4 | First coordinate −1/4−1/2=−3/4; tail ≤1/4; partial sums ≤−3/4, −1/2; at Re(s₀)=0 the last bound is 0. | Compatible. |
| 8.5 arguments | c=2, s=1/2; τ=χ_π=1 on GL₁ | 2s=1, 2s+1=2, Sp s+c/2=3/2; untwisted Sym² has a pole at u=1 but violates the exclusion at t=0. | Compatible. |
| 9.1 restricted period | SO₂/ℚ, k=1, π=τ=1 | Weights a/b, ab, (ab)⁻¹, b/a; P=B_A×SL₂; E constant in b; ∫₁^R dr/r=log R; positive kernel for real s large. For Re(s) large and k≥1 the inner integral equals φ₂(g₁)Z_local(s), constant on the infinite-volume quotient. | F02 repaired; R01 wording. |
| 9.2–9.3 formal identities | good factor 2 into S; b=2 over ℚ | (1/2)·2=1; \|2\|_∞\|2\|₂=2·(1/2)=1; real-only idele has norm 2. | Compatible. |
| 9.4 counterexample for tori | F=ℚ(√−23), h=3, μ of order 3, τ=μ⁻¹ | μ² has order 3 and is nontrivial on 𝔸¹/F×, so μ²≠\|·\|^(it); no ramified place; CFK (1) reads μ⁻¹\|·\|^(it)≇μ, satisfied; L=Λ_F(s)Λ(s,μ⁻²), Λ(1,μ⁻²)≠0 finite, pole at 1. GSpin₂: (α,β)=(μ,1), τ=μ⁻¹: exclusion μ⁻¹≠\|·\|^(−it) holds, L=Λ_F(s)Λ(s,μ⁻¹), pole at 1. All places unramified or complex, so only CFK's own unramified and archimedean factors enter. | Restriction correct; CFK Theorem 4.8 false for tori (Source issues). |
| 9.5 criterion | ℚ, π=τ=1; k≥2; ατ=\|·\|^(it) | Λ_ℚ(s)², double poles at 0 and 1, ε=1, L₂(1)=4. k≥2: Λ(s,τ⊗α) entire (AL.3, n≠m). Pole of Λ(s,ατ) at 1−it; Λ(1−it,βτ) is a pole or finite nonzero (AL.3 boundary nonvanishing, Gamma factors zero-free), no cancellation; s=−it by the functional equation; ν ramified at one prime makes both factors entire. | Compatible. |
| 10.1–10.2 | Sp₂; GL₂ trivial vs Steinberg | N=3; shared support {ν^(1/2),ν^(−1/2)}; (1−q^(1/2−s))/(1−q^(s−1/2))=−q^(1/2−s). | Compatible. |
| 10.3 convergence | σ₀, N=2,3 | Σ_v q_v^(σ₀+1/2−σ) converges for σ>σ₀+3/2; \|α⁻¹\|≤q^((N−1)σ₀) when \|det\|=1. | Compatible. |
| 10.4 torus transfer and twist conductors | μ(ϖ)=3; ℚ₂ conductor m≥4; odd p | (1−3T)(1−T/3)=1−(10/3)T+T²; roots multiply to αβ(ϖ)=χ_π(ϖ). (1+2^(m−2)ℤ₂)²=1+2^(m−1)ℤ₂ for m≥4, so η² has conductor m−1; at odd p conductor m. | Compatible. |
| 10.5 isolation | T={v₁}, auxiliary w | v₁ by stability after central matching, w by §6.8; uncontrolled factors 0; ramified test at v₁ would leave 1. Tori: Π=α⊞β by isobaric strong multiplicity one, local components Ind(α_v⊗β_v) irreducible for unitary data, γ-product by GL multiplicativity. | Compatible. |
| 10.6–10.7 tails | one GL₁ block; torus factor | N=N₀+2l: Sp 1+2=3, SO 0+2=2; every constituent of α×β has the product γ by the segment formula; torus cuspidal factor routed through §10.4. | Compatible. |

### Pinned libraries

Pins from `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Opened at the cited lines: `Matrix.fromBlocks` (Block.lean:45), `Matrix.fromBlocks_multiply` (:213, needs `Fintype` contracted indices and a nonunital nonassociative semiring), `Matrix.conjTranspose` (ConjTranspose.lean:43), `Matrix.IsHermitian` (Hermitian.lean:44, `Aᴴ = A`), `Matrix.trace` (Trace.lean:43), `AddChar` (AddChar.lean:70), `lipschitzGroup` (SpinGroup.lean:61) and `spinGroup` (:292, `pinGroup ⊓ even`), `CliffordAlgebra.mem_lipschitzGroup_iff_involute_act_ι_mem_range_ι` (CliffordGroup.lean:138, hypotheses `Q.Nondegenerate` and `∃ v, IsUnit (Q v)`), `TauCeti.weylModuleOfShape` (:429), `TauCeti.weylRepOfShape` (:441), `TauCeti.isIrreducible_weylRepOfShape_iff` (:160). All exist as the README describes. The new torus objects (products of two Hecke or GL₁×GL_k completed L-functions over a number field) have no pinned carrier; Mathlib's `LSeries` and Dirichlet L-functions are rank-one over ℚ only. No duplicated API block.

### Suppliers, ownership and order

The resolver reports no missing cross-roadmap citation and no missing Lean name (main `bbed953`, 365 open heads, index of 2026-10-25T16:46:16Z). The citations the repair added were read at the open heads: AutomorphicLFunctionsAndLocalFactors (#924) Representation prerequisites "GLₙ isobaric sums" (its line 272), AL.3 "Continuation and the Rankin–Selberg pole criterion" (entire for n≠m; for n=m poles at iσ and 1+iσ with π_n∨≅π_m⊗|det|^(iσ)), "The global Rankin–Selberg functional equation", "Rankin–Selberg nonvanishing on the boundary" (partial L^S on Re(s)≥1, removed factors regular), "Strong multiplicity one for isobaric sums", "Hecke, eigensystem and Rankin–Selberg data" with the strip bounds of "Boundedness on finite vertical strips", and AL.1 "Canonical archimedean factors" and "Local epsilon factors and Gauss sums". The Jacquet–Shalika Satake bound is at its line 1817 under Layer AL.2 (R02). Existence of the other cited sections was confirmed at the heads: AutomorphicSpectralTheory (#925) §§2.3a, 2.4, 2.4a, 2.5, 4.14a, 5.12; MetaplecticAutomorphicForms (#1063) §§3.2a, 3.3, 3.3b, 3.15, 6.2, 6.10a, 6.11; EndoscopicTransferAndUnitaryTraceComparison (#999) §§5.1, 10.29; GL2AutomorphicRepresentationsAndTransfer (#931) R16.1.8. The remaining supplier sections (SmoothRepresentationsOfLocalGroups, AdelicAlgebraicGroups, AutomorphicFormsOnReductiveGroups, GeometryOfNumbersAndQuadraticArithmetic, ReductiveGroups, ReductiveGroupsPartII, OrthogonalSpinGroups, RepresentationTheory/ClassicalGroups) are unchanged since round 3, which opened them; their existence is covered by the resolver.

Ownership of the split-torus branch: `roadmaps grep` over the open heads and main for GSpin₂, split-torus doubling and SO₂ transfer finds no other owner (the two hits are unrelated: a split-torus remark in AdelicAlgebraicGroups and a non-flat-algebra sentence in SmoothRepresentationsOfLocalGroups). The branch imports AL.3 and owns only the identification. Ownership against open pull requests whose files the brief does not provide was not checked beyond the indexed tools. The board package index lists 19 packages; none concerns doubling or this roadmap.

All 64 `*Needs:*` lines point to earlier layers, Layer 0 or named suppliers; §6.11 lists EndoscopicTransferAndUnitaryTraceComparison §10.29, which its route does not use (τ is generic), a harmless surplus. The dependency command exited 0:

```text
moved: AutomorphicLFunctionsAndLocalFactorsPartII moved in the merge order from #26 to #167, right after its last supplier MetaplecticAutomorphicForms (SmoothRepresentationsOfLocalGroups, AdelicAlgebraicGroups, AutomorphicFormsOnReductiveGroups, GeometryOfNumbersAndQuadraticArithmetic, AutomorphicLFunctionsAndLocalFactors, AutomorphicSpectralTheory, GL2AutomorphicRepresentationsAndTransfer, EndoscopicTransferAndUnitaryTraceComparison also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 55 roadmaps, 622 edges, 0 problem(s)
```

No UPWARD or CYCLE line; the moved placement is not a defect. The merge-order file was not edited.

### Declared gaps

The 21 named contracts in the README's Exact supplier contracts match the 21 slugged entries of `design/plan.json` (same slug, supplier, section and needs sentence); the plan's `gaps` list is unchanged since round 3 (git history of `design/`). Each needs sentence names its hypotheses and asks for nothing the pins or an earlier roadmap provide; round 3's per-gap precision table was reread and still holds. Round 4 added no gap. The acceptance is conditional on these 21.

### Shape, headlines and Lean

README shape: summary, scope, conventions, contracts, build guide, Layers 0–10 each ending in Examples and Dependencies, downstream consumers, references. The new §6.11 has five Checks and §9.5 three; both are theorem-type targets with their hypotheses in an "Assume" sentence and a locator. Unicode mathematics throughout; display formulas as an indented block.

The seventeen headlines of "How to read the build" are the seventeen bullets of the `Suggested.lean` docstring, each naming its missing carrier; the two Layer 9 bullets now name the split-torus branch. None is statable at the pins: Mathlib and Tau Ceti have no smooth admissible, Casselman–Wallach, automorphic or Eisenstein carriers, and the native matrix, Weyl-module and additive-character carriers do not make any of the seventeen statable with a few simple definitions. `lake env lean` on the absolute path of `Suggested.lean`, from the content checkout, exited 0 with no output (2.8 s); the file has one `import Mathlib`, one module docstring, an empty namespace, no `lemma`, no `set_option`, no declaration. The `#check` binder audit and the one-tactic padding probe therefore have empty domains; no Lean process was left running.

## Not verifiable

- CFK22 Lemma 7.3, YAM14 Theorem 7.1 and KAP23 Theorem 25 remain uncertified; they are cited by locator only and were not requested.
- Whether the torus period converges conditionally for k>1 outside the absolute-convergence region (R01) was not decided; the README asserts nothing about it except the divergence wording R01 corrects.
- Ownership against open pull requests without supplied files, beyond the indexed `roadmaps grep`.

## Source issues

- **Error** in CFK at Theorem 4.8, printed p.39, CFK lines 1719–1723: the source says that for every split classical G_c with c>1 the completed doubling L-function is entire under hypotheses (1) and (2); it should exclude SO₂ and GSpin₂, where an order-three class-group character of ℚ(√−23) with τ=μ⁻¹ satisfies both and gives a pole at s=1; affects a stated result.
- **Gap** in GK at §3.2, printed p.73, GK lines 4193–4196: the source says the low-rank case c=2, G=SO₂ can be included by globalizing Lemma 2.16; it should also address the infinite volume of G(F)⧸G(𝔸), which makes the pairing in (3.8) infinite; affects the proof.
- **Gap** in EHLS at Lemma 4.5.2 and Remark 4.5.3, printed p.80, EHLS lines 3680–3683: the source says the image of the holomorphic module lies in I_σ(m−n/2,χ) with similitude factors omitted; it should state the parameter after separating the unitary part of χ (the computed covariance is χ_u⁻¹(d)|d|^(−t) with t=m−(a+b)/2); affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "389ebdcbdbbefbbb55272e3a8a7f2d1ab32fe1a4", "job": "REV-PKG-AutomorphicLFunctionsAndLocalFactorsPartII~4", "model": "fable", "worker": "chris-i"} -->
