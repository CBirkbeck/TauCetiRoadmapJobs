# Review of CohomologyOfGroups (pull request #2338 at f8d096c)

**Verdict:** needs changes

## R01 (P3) — The Künneth citation mentions the theorem but does not state it

**Location:** `TauCetiRoadmap/CohomologyOfGroups/README.md:1823`: “Loh19 Outlook 3.2.26, p. 138, records the statement without proof”.
**Claim:** The cited Outlook does not state the displayed isomorphism or its finite-dimensionality hypothesis.
**Witness:** Loh19 lines 5985–5994, Outlook 3.2.26, p. 138, mentions group-cohomology Künneth under an unspecified finiteness assumption and refers to another work; it supplies no formula or precise hypothesis.
**Repair:** Replace the parenthesis with: “(Loh19 Outlook 3.2.26, p. 138, mentions a group-cohomology Künneth theorem under a finiteness assumption; the statement here follows from 5.1 and 5.2).” The C₂ × C₂ calculation below remains 3 = 1+1+1.

## Verified sound

| Statement | Instances tried | Computed left side | Computed right side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| Conventions: zero coefficients | Any G; k the zero ring | Hₙ = Hⁿ = 0 | All coefficient maps 0 → 0 | Agree | — |
| Conventions: Tate indexing | C₃; M = ℤ; degree −2 | Ĥ⁻² = ℤ/3 | H₁ = ℤ/3 | Agree | — |
| 1.1 `conjRes` | A₃ ≤ S₃; transposition; H¹(−,𝔽₃) | Character 1 maps to −1 = 2 | Pullback by inversion gives 2 | Agree; identity map gives 1 | — |
| 1.1 `conjCores` | A₃ ≤ S₃; transposition; H₁(−,ℤ) | Generator maps to 2 mod 3 | Inversion on A₃ gives 2 | Agree | — |
| 1.1 coefficient action, composition | C₄; A = 1; sign ℤ; degree 0 | c_t(1) = −1; c_t²(1) = 1 | c_(t²)(1) = 1 | Omitting coefficients gives +1 | — |
| 1.1 noninjective compatible pairs | C₄ → C₂; trivial 𝔽₂; degree 2 | Inflation of generator = 0 | Reduction of doubled integral class = 0 | No injectivity assumed | — |
| 1.1 inner triviality | C₃; generator; H₁(−,ℤ) | c_g(1) = 1 | Identity sends 1 to 1 | Agree | — |
| 1.2 quotient action | S₃/A₃; H¹(A₃,𝔽₃) | Transposition acts by 2 | Invariants solve z = 2z: z = 0 | H¹(S₃,𝔽₃) = 0 | — |
| 1.2 degree-zero quotient action | C₄/2C₄; sign ℤ | Generator acts by −1 on ℤ | Mᴺ = ℤ with quotient action −1 | Trivial action excluded | — |
| 1.2 endpoint subgroups | N = 1 or N = G | N = 1: H⁰ = M, Hⁿ⁺¹ = 0 | N = G: Q = 1 acts identically | Agree | — |
| 1.3 sums and products | C₂; trivial integral coefficients; two factors | H₁(ℤ²) = (ℤ/2)² | H₁(ℤ) ⊕ H₁(ℤ) = (ℤ/2)² | Agree | — |
| 1.3 infinite-sum negative control | G = ℤ^(ℕ); coefficient ℤ^(ℕ) | Identity homomorphism has infinitely many nonzero coordinate maps | Every element of ⊕ℕ Hom(G,ℤ) has finitely many | Not surjective, as stated | — |
| 1.4 permutation Shapiro | C₂ on C₂ ⊔ point; ℤ | H₀ = ℤ²; H₁ = ℤ/2 | H₀(1) ⊕ H₀(C₂) = ℤ²; H₁ = 0 ⊕ ℤ/2 | Agree | — |
| 1.4 induction projection convention | C₃ = ⟨t⟩; regular coefficient basis e₁ | Induction generator t sends e₁ to e_(t⁻¹) | Native `indProjectionHom_apply_mk`: e_(t²) | Agree; forward action gives e_t | — |
| 1.5 discrete comparison | C₂; trivial 𝔽₂; degrees 0,1,2 | Continuous dimensions (1,1,1) | Ordinary dimensions (1,1,1) | Identical normalized cochains | — |
| 2.1 hyperhomology | S₃; ℤ[S₃/A₃] → ℤ | HyperH₀,₁,₂ = 0, ℤ/2, ℤ/3 | Shifted sign-module H = 0, ℤ/2, ℤ/3 | Agree | — |
| 2.1 hypercohomology | G = 1; D = (ℤ →² ℤ) | HyperH⁰ = 0; HyperH¹ = ℤ/2 | ker(2) = 0; coker(2) = ℤ/2 | Agree | — |
| 2.1 resolution comparison, shifts | G = 1; ℤ concentrated in degree 2 | HyperH₂ = ℤ; other degrees 0 | Shifted degree-zero homology: ℤ at 2 | Agree | — |
| 2.2 long exact sequences | C₂; 0 → ℤ →² ℤ → 𝔽₂ → 0 | δ: H¹(C₂,𝔽₂) → H²(C₂,ℤ) is 1 ↦ 1 | Next map ×2 on ℤ/2 is 0; kernel ℤ/2 | Exact; CE56 text uncertified | — |
| 2.3 two spectral sequences | S₃; augmentation ℤ[S₃/A₃] → ℤ | E²₀,₁ = ℤ/2; E²₁,₁ = ℤ/3 | Abutment H₁ = ℤ/2; H₂ = ℤ/3 | Agree | — |
| 2.3 first differential | Same complex; q = 0 | d¹: ℤ → ℤ sends 1 ↦ 1 | H₀(total) = coker(id) = 0 | Zero differential would give ℤ | — |
| 2.3 vanishing has no converse | Replace A₃ by ⟨(12)⟩ | HyperH₀ = HyperH₁ = 0 | H₁(coefficient complex) = ℤ² | No converse claimed | — |
| 3.1 equivariant homology comparison | Free contractible C₂-complex; M = ℤ | Equivariant H₁ = ℤ/2 | H₁(C₂,ℤ) = ℤ/2 | Agree | — |
| 3.1 projectivity negative control | G = 1; flat resolution of ℤ[1/2]; target ℤ | Ext¹(ℤ[1/2],ℤ) = ℤ₂/ℤ ≠ 0 | Hom(ℤ[1/2],ℤ) in degree 1 gives 0 | Flatness alone excluded in cohomology | — |
| 3.2 orbit spectral sequence | Reflection of a circle by C₂; ℤ | Vertex E¹₀,₁ = (ℤ/2)²; edge E¹₁,₁ = 0 | Stabilizers: two C₂ vertices, trivial edge | Agree | — |
| 3.2 monomial twist | C₂; one orbit fixed; sign ℤ | H₀ = ℤ/2; H₁ = 0 | Norm = 0; t−1 = −2 | Untwisted model gives ℤ, ℤ/2 | — |
| 3.3 free-complex collapse | Free C₂ action on circle; ℤ | Quotient circle H₀ = ℤ, H₁ = ℤ | Coinvariant cellular complex has differential 0 | Agree | — |
| 3.3 resolution condition | G = 1; C = ℤ in degree 0; M arbitrary | H₀(C ⊗ M) = M; Hₙ⁺¹ = 0 | H₀(1,M) = M; Hₙ⁺¹ = 0 | Agree | — |
| 3.4 tree chain sequence | Segment oriented v₀ → v₁ | ∂e = v₁−v₀; augmentation ∂e = 0 | Kernel of (a,b) ↦ a+b is ℤ(−1,1) | Exact | — |
| 3.4 tree negative control | Circle with one vertex, one loop | ∂e = 0; kernel ℤ | Tree sequence requires kernel 0 | Circle excluded | — |
| 3.5 tree sequence | ℤ translating its line; sign ℤ | Boundary t⁻¹−1 = −2 | H₁ = 0; H₀ = ℤ/2 | Agree | — |
| 3.5 orientation | Same line; trivial ℤ | Difference 1−1 = 0; H₀ = ℤ | Sum 1+1 = 2; cokernel ℤ/2 | Wrong sign excluded | — |
| 3.6 amalgam sequence | C₄ ∗_(C₂) C₆; trivial ℤ | Cokernel of 1 ↦ (−2,3) is ℤ/12 | H₁(SL₂(ℤ),ℤ) = ℤ/12 | Agree | — |
| 3.6 HNN sequence | BS(1,2); trivial ℤ | H₁ edge map = 1−2 = −1; H₀ map = 0 | H₁(total) = ker(0) = ℤ | Sum would give ℤ/3 | — |
| 3.6 `freeGroup_isZero_of_two_le` | Free rank 0, 1, 2; any module; n ≥ 2 | Length-one resolution: Hₙ = Hⁿ = 0 | Claimed pair of zero objects = (0,0) | Agree; n = 1 excluded | — |
| 3.6 `coprod_groupHomology_bijective` | C₂ ∗ C₂; ℤ; n = 2,3 | H₂ = 0; H₃ = (ℤ/2)² | Summand groups: 0 ⊕ 0; ℤ/2 ⊕ ℤ/2 | Agree | — |
| 3.6 degree-one negative control | F₂; both generators act by −1 on ℤ | H₁ = ker(−2,−2) ≅ ℤ | H₁ of each cyclic factor = 0 | Degree bound necessary | — |
| 4.1 cochain cup | ℤ²; coordinate characters x,y; ordered torus cycle z | (x ∪ y)(z) = 1−0 = 1 | (y ∪ x)(z) = 0−1 = −1 | Standard cup sign | — |
| 4.1 Leibniz and coefficient action | G = ℤ; φ = id; ψ(1) = 1 in regular ℤ[ℤ]; evaluate (1,1,1) | Correct formula: d(f ∪ g)−df ∪ g+f ∪ dg = 0 | Omitting action leaves 2(t−1) ≠ 0 | Wrong formula excluded | — |
| 4.2 connecting compatibility | C₂; 0 → ℤ →² ℤ → 𝔽₂ → 0; unit x | δ(x ∪ y) = δy = 1 mod 2 | x ∪ δy = 1 mod 2 | Degree-zero normalization agrees | — |
| 4.2 tensor exactness restriction | Tensor 0 → ℤ →² ℤ → ℤ/2 with ℤ/2 | First tensor map = 0 on ℤ/2 | Injective map required; kernel = ℤ/2 | Flatness/splitting restriction needed | — |
| 4.3 associativity and graded commutativity | ℤ³; coordinate x,y,z; positive fundamental class | ((x ∪ y) ∪ z)[T³] = 1 | (x ∪ (y ∪ z))[T³] = 1 | Swap x,y gives −1 | — |
| 4.4 diagonal approximation | Torus cycle z = [a,b]−[b,a] | AW₁,₁(z) = [a]⊗[b]−[b]⊗[a] | Evaluating x⊗y gives 1 | Augmentation and cup agree | — |
| 4.5 projection formula | C₂ ≥ 1; ℤ; degree 0; x = 2, y = 3 | cor(res(x)·y) = 2·6 = 12 | x·cor(y) = 2·6 = 12 | Agree | — |
| 4.6 cap and evaluation | ℤ²; coordinate y; torus cycle z | Back-face y ∩ z = [e₁] | ⟨x,y ∩ z⟩ = 1 = ⟨x ∪ y,z⟩ | Front face gives −[e₁] | — |
| 4.6 excessive degree | G = 1; p = 1, n = 0 | H¹ = 0; defined cap = 0 | Degree truncated to 0 still receives zero map | No natural-subtraction artifact | — |
| 4.7 Tate cup comparison | C₂; 𝔽₂; generator x in degree 1 | Ordinary x² generates H² = 𝔽₂ | Tate x² generates Ĥ² = 𝔽₂ | Agree | — |
| 4.7 degree-zero quotient | C₂; ℤ; norm element 2; positive torsion class y | 2 ∪ y = 0 | Image of 2 in Ĥ⁰ = 0 | Quotient, not H⁰-isomorphism | — |
| 4.7 discrete/profinite comparison | ∏ℕ C₂; discrete trivial 𝔽₂ | Continuous H¹ = ⊕ℕ 𝔽₂, countable | Abstract Hom(∏ℕ 𝔽₂,𝔽₂), uncountable | Comparison restricted to finite quotients | — |
| 5.1 Künneth homology | C₂ × C₂; ℤ | H₂ = ℤ/2; H₃ = (ℤ/2)³ | Tensor/Tor: ℤ/2; (ℤ/2)² ⊕ ℤ/2 | Agree | — |
| 5.1 flatness negative control | G = H = 1; M = N = ℤ/2 | H₁(1,M⊗N) = 0 | Tor₁(ℤ/2,ℤ/2) = ℤ/2 | Neither coefficient flat; excluded | — |
| 5.1 shuffle normalization | ℤ × ℤ; degree-one generators a,b | a × b = [(a,1),(1,b)]−[(1,b),(a,1)] | Evaluation of x × y = 1 | Sign agrees with 4.1 | — |
| 5.2 homological UCT | C₂; k = ℤ; A = ℤ/2; n = 2 | H₂(C₂,ℤ/2) = ℤ/2 | Tensor term 0; Tor₁(ℤ/2,ℤ/2) = ℤ/2 | Exact | — |
| 5.2 `cohomologyEvaluation` | G = ℤ; k = A = ℤ; n = 1 | Character g ↦ g sends generator to 1 | Hom(H₁,ℤ) generator evaluates to 1 | Zero/rescaled map excluded | — |
| 5.2 `extToCohomology` | C₂; k = ℤ; A = ℤ/2; n = 1 | Ext¹(ℤ/2,ℤ/2) generator maps to nonzero H² | H²(C₂,ℤ/2) = ℤ/2; evaluation target 0 | Injective, kernel equality | — |
| 5.2 `universalCoefficient_cohomology` | C₂; k = ℤ; A = ℤ/2; degrees 1,2 | H¹ = ℤ/2; H² = ℤ/2 | Ext/Hom: 0⊕ℤ/2; ℤ/2⊕0 | Both maps and split sequence agree | — |
| 5.2 global-dimension negative control | k = ℤ/4; G = C₂; A = ℤ/2; degree 2 | H² has 2 elements | Ext¹ and Hom each have 2: middle would need 4 | Excluded by dimension hypothesis | — |
| 5.3 cohomological cross product | C₂ × C₂; 𝔽₂; n = 2 | Target dimension = 3 | Tensor dimensions 1+1+1 = 3 | Mathematics agrees; citation overstates source | R01 |
| 5.3 finiteness negative control | G = H = ℤ^(ℕ); ℚ; mixed degree 2 | Diagonal bilinear form has infinite rank | Image of tensor of duals has finite rank | Missing finite-dimensionality would fail | — |
| 5.4 Pontryagin exterior comparison | A = ℤ²; k = 𝔽₂ | Dimensions H₀,₁,₂,₃ = 1,2,1,0 | Exterior dimensions = 1,2,1,0; x² = 0 | Characteristic two included | — |
| 5.4 torsion negative control | A = C₂; k = ℤ | H₃ = ℤ/2 | Λ³(C₂) = 0 | Integral torsion case excluded | — |
| 5.4 rational and directed-union forms | A = ℚ or C₃; k = ℚ | ℚ: H₁ = ℚ, H₂ = 0; C₃: H₁ = 0 | Exterior powers of A⊗ℚ give same values | Agree | — |
| 6.1 normalized filtration | N = 1; nontrivial Q; normalized cochains | E₂ has only q = 0 row | Hⁿ(G,M) = Hⁿ(Q,M) | Inflation identity | — |
| 6.1 global boundedness | N = G versus N = 1; nonzero M | N = G: quotient has no positive normalized cochains | N = 1: nonzero cochains in arbitrarily high degrees | Degreewise boundedness retained | — |
| 6.2 cohomological Hochschild–Serre | C₂ → C₄ → C₂; 𝔽₂ | E₂ = 𝔽₂[x,y]; d₂(y) = x² | H*(C₄,𝔽₂) = Λ(x)⊗𝔽₂[z₂] | Nonzero differential necessary | — |
| 6.2 nonabelian quotient action | A₃ → S₃ → C₂; 𝔽₃ | H¹,H² = 0; H³,H⁴ = 𝔽₃ | Invariant degrees in Λ(a₁)⊗𝔽₃[b₂]: 0,3 mod 4 | Agree | — |
| 6.2 page/index convention | Classical (p,q) = (0,1), r = 2 | Tau position (2,−1), page 3; total 1 | d₂ target (2,0), total 2 | Bidegree (2,−1) preserved | — |
| 6.3 homological Hochschild–Serre | C₃ → S₃ → C₂; ℤ | E²₀,₁ = (ℤ/3)_(−1) = 0 | H₁(S₃,ℤ) = H₁(C₂,ℤ) = ℤ/2 | Agree | — |
| 6.4 edge maps | N = 1 or N = G; ℤ | N = 1: inflation/coinflation identity | N = G: edge in degree 0 identity; positive quotient groups 0 | Agree | — |
| 6.4 acyclic-coefficient edge | G = S₃; N = A₃; M = ℤ[S₃] | H₀(G,M) = ℤ; Hₙ⁺¹ = 0 | M_N = ℤ[C₂]; quotient homology ℤ,0 | Supplied edge isomorphism agrees | — |
| 6.5 multiplicativity | ℤ²; quotient character x, kernel character y | E₂ product of y then x = +xy | Sign (−1)^(p q′) is +1; reverse order gives −xy | Matches anticommutative abutment | — |
| 6.6 transgression and sign | C₃ → C₉ → C₃; 𝔽₃; arguments (2,1) | Lift coboundary = −1 = 2 mod 3 | −factor-set evaluation = −1 = 2 | Positive carry would give 1 | — |
| 6.6 nonabelian extension check | C₄ → Q₈ → C₂; 𝔽₂ | Section square is kernel element 2; scalarization 0 | d₂ of degree-one character = 0 | Nonsplit does not imply nonzero d₂ | — |
| 6.6 higher transgression endpoints | N = 1; n ≥ 1 | Domain Hⁿ(1,M) = 0 | Transgression image = 0 | Quotient target causes no spurious map | — |
| 6.7 low-degree sequences | C₂ → C₄ → C₂; integral homology | 0 → ℤ/2 →² ℤ/4 → ℤ/2 → 0 | Kernels: 0, {0,2}, ℤ/2 | Exact | — |
| 6.7 higher vanishing range | N = 1; m ≥ 2 | H^q(N,M) = 0 for q > 0 | Inflation H^m(Q,M) → H^m(G,M) = id | Exact sequence collapses correctly | — |
| 6.8 `nonempty_groupHomology_two_addEquiv_hopf` | ℤ² = F₂/[F₂,F₂] | H₂(ℤ²,ℤ) = ℤ | [F₂,F₂]/[F₂,[F₂,F₂]] ≅ ℤ | Isomorphism exists | — |
| 6.8 calibrated map | Positive torus cycle; lifts s,t | Lifted boundary [ts]−[st] | ts(st)⁻¹ = [s,t]⁻¹ | In Heisenberg(𝔽₃): central value 2, not 1 | — |
| 6.8 degenerate presentations | R = 1 or R = F | H₂(F,ℤ) = 0; H₂(1,ℤ) = 0 | Quotients 1/1 and [F,F]/[F,F] are trivial | Agree | — |
| 6.9 finite/profinite five-term comparison | C₂ → C₄ → C₂; 𝔽₂ | Discrete transgression sends 1 ↦ 1 | Continuous transgression sends 1 ↦ 1 | Same finite cochains | — |
| 7.1 `doubleCosetTerm`, cohomological sum | S₃; H = K = C₂; ℤ; degree 0 | res cor multiplies by 3 | Two double-coset terms multiply by 1 and 2 | 3 = 1+2 | — |
| 7.1 `res_comp_corestriction_eq_finsum` | Same subgroups; degree 2 | res cor = id on ℤ/2 | Identity double coset gives id; trivial intersection gives 0 | Agree | — |
| 7.1 `doubleCosetTermHomology`, transfer sum | S₃; H = K = C₂; degree 0 | tr cor multiplies by 3 | Two terms have degrees 1 and 2 | 3 = 1+2 | — |
| 7.1 `transfer_comp_cores_eq_finsum` | Same subgroups; ℤ; degree 1 | Inclusion ℤ/2 → ℤ/2 and transfer composite = id | Nonidentity intersection contributes 0; identity contributes id | Agree | — |
| 7.1 arbitrary-index-group generality | G = ℤ; H = 2ℤ; K = 1; degree 0 | res cor = ×2 | Two singleton-intersection terms = id+id | Infinite G permitted | — |
| 7.2 `IsStableClass` | S₃; P = A₃; ℤ; n = 2,4 | Stable subgroups = 0, ℤ/3 | Conjugation acts by −1,+1 respectively | Rejects constant-degree sign | — |
| 7.2 `bijOn_res_sylow_isStableClass` | Same instance | H²(S₃)(3) = 0; H⁴(S₃)(3) = ℤ/3 | Stable target = 0, ℤ/3 | Restriction bijective | — |
| 7.2 twisted fusion negative control | C₂ × S₃; abelian P; permutation 𝔽₂³ | Normalizer invariants dimension 3; cocycle z ↦ e₃ | Stable dimension 2; conjugation gives e₂ ≠ e₃ | Trivial-action hypothesis needed | — |
| 7.2 `IsHomologyStableClass` | S₃; P = A₃; ℤ; n = 1 | Condition z = −z in ℤ/3 gives {0} | H₁(S₃,ℤ)(3) = 0 | Agree | — |
| 7.2 `bijOn_cores_sylow_isHomologyStableClass` | G = (C₃)² ⋊ C₂, inversion; n = 2 | Stable H₂(P,ℤ) = Λ²P = ℤ/3 | H₂(G,ℤ)(3) = ℤ/3 | Corestriction bijective | — |
| 7.2 positive-degree bound | S₃; P = A₃; ℤ; n = 0 | Stable ordinary classes = ℤ | Primary part of H⁰ or H₀ = 0 | Degree zero excluded | — |
| 7.2 `IsTateStableClass` | S₃; P = A₃; sign ℤ; n = 0 | Invariance z = −z in ℤ/3 gives 0 | Ĥ⁰(S₃,ℤ_sgn) = 0 | Coefficient action required | — |
| 7.2 `bijOn_tateRes_sylow_isTateStableClass` | S₃; P = C₂; ℤ; n = 0 | Primary subset of ℤ/6 = {0,3} | Reduction mod 2 gives {0,1}, all stable | Bijective | — |
| 8.1 `tate_duality` | C₂; M = ℤ; i = 0,1 | Ĥ⁰(ℚ/ℤ) = 0; Ĥ¹(ℚ/ℤ) = ℤ/2 | Duals of Ĥ⁻¹(ℤ), Ĥ⁻²(ℤ): 0, ℤ/2 | Agree | — |
| 8.1 `tate_duality_of_free` | C₃; M = ℤ; i = 0 | Pairing (1,1) = 1 mod 3 | Character sends 1 ↦ 1/3; three possible characters | Perfect in second variable | — |
| 8.1 freeness negative control | C₂; M = ℤ/2; i = 0 | Ĥ⁰(Hom(M,ℤ)) = 0 | Hom(Ĥ⁰(M),ℚ/ℤ) = ℤ/2 | Nonfree module excluded | — |
| 8.1 infinite rank | C₂; M = ⊕ℕ ℤ; i = 0 | Ĥ⁰(Hom(M,ℤ)) = ∏ℕ 𝔽₂ | Hom(⊕ℕ 𝔽₂,𝔽₂) = ∏ℕ 𝔽₂ | No finite-rank assumption needed | — |
| 8.2 p-group classification | C₄, Q₈, D₈; p = 2 | All abelian subgroups cyclic: true, true, false | Cyclic/quaternion: true, true, false | D₈ contains V₄ | — |
| 8.2 native primality control | C₇ ⋊ C₃; parameter 21 | Every g satisfies g²¹ = 1 | Group neither cyclic nor generalized quaternion | `IsPGroup` alone lacks primality | — |
| 8.3 cohomologically trivial resolution | C₂; 0 → ℤ_sgn → ℤ[C₂] → ℤ → 0 | Shift length 1 changes sign coefficients | Two shifts return coefficients, period 2 | Twisted case retained | — |
| 8.3 nonflat coefficients | Same sequence; M = ℤ/2 | Middle 𝔽₂[C₂] has Tate groups 0 | δ: ℤ/2 → ℤ/2 is bijective in every degree | No flatness hypothesis added | — |
| 8.3 existence obstruction | C₂ × C₂; 𝔽₂ | Dimensions Hⁿ = n+1 | Any fixed period would require n+1 = n+d+1 | No positive d; sequence impossible | — |
| 8.4 `cup_characterConnectingClass_bijective` | C₃; faithful χ(t)=1/3; M = ℤ | Cup δχ sends 1 mod 3 ↦ 1 mod 3 | Two-periodic groups ℤ/3 in even degrees, 0 odd | Bijective | — |
| 8.4 least primary period | S₃; p = 3; d = 2,4,8 | H₁(−,ℤ_(3)) = 0; H₃ = H₇ = ℤ/3 | Full-order degrees 4,8; least 4 | Declared minimality gap matches | — |
| 8.4 quaternion period | Q₈; integral Tate groups | Ĥ² = (ℤ/2)²; Ĥ⁴ = ℤ/8 | First full-order cyclic degree = 4 | Imported quaternion class | — |
| 8.5 `tfae_periodic_cohomology` | G = 1, S₃, A₄ | Global period exists: true, true (4), false | Abelian-subgroup condition: true, true, false (V₄) | Both directions agree | — |
| 8.5 `tfae_primary_periodic_cohomology` | A₄; p = 3 versus 2 | 3-primary H² = ℤ/3; 3-period 2 | Sylow₃ cyclic; Sylow₂ = V₄, not periodic | Primary/global distinction retained | — |
| 8.5 nondividing prime | C₂; p = 3 | All primary Tate groups = 0, order 1 | 3⁰ = 1; Sylow₃ = 1; all four conditions true | No divisibility hypothesis needed | — |
| 8.5 finite-field check | SL₂(𝔽₃) versus SL₂(𝔽₉) | Defining-characteristic Sylows C₃ versus C₃² | Orders 24,720; full 3-parts 3,9 | First periodic; second not | — |

- Sources: all 15 seeded targets examined; readable support at HS53 lines 201, 246, 273, 283, 355, 386, 489, 654, 796, 854, 984; MilneCFT lines 3459, 3492; Loh19 lines 5762, 5830, 5985, 7012, 7069, 7089; Hutchinson13 lines 482, 499, 511; limitations below.
- Pins: 12 critical declarations opened at `Mathlib/GroupTheory/PGroup.lean:45`, `Mathlib/GroupTheory/Torsion.lean:450`, `Mathlib/LinearAlgebra/FreeModule/Basic.lean:44`, `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:132`, `TauCeti/RepresentationTheory/Induction/Projection.lean:129`, `TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:121`, `:153`, `:180`, `TauCeti/Algebra/Homology/Kronecker.lean:252`, `TauCeti/RepresentationTheory/Homological/TateCohomology/Projective/Basic.lean:104`, `:232`, `TauCeti/Algebra/Homology/SpectralSequence/Filtered/Stabilization.lean:83`; `IsPGroup` assumes no primality, and `Module.Free` imposes no finite rank.
- Near-matches: 23 declarations audited; the pinned free-group theorem (`TauCeti/AlgebraicTopology/ClassifyingSpace/WedgeCircles.lean:259`) has only trivial coefficients; cyclic cup comparison (`TauCeti/RepresentationTheory/Homological/TateCohomology/Cup/Cyclic.lean:146`) treats degree zero; neither supplies the corresponding headline.
- Ownership: 14 named supplier contracts plus ModularCurvesPartII §15.4 resolved at main/open heads; 8 closest scopes read; 0 conflicting heads, dropped identifiers or duplicate fully qualified names found; 3 declared gaps match `design/plan.json` and the README.
- Shape/headlines: 41 numbered subsections; every definition has an API and at least 3 Checks; 14 Lean headline theorems, 9 supporting definitions; missing construction-dependent headlines identified in the module docstring; 0 missing statable headlines found.
- Gate: all scanner counts and targeted-build failures 0; dependency rerun: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; 0 UPWARD/CYCLE lines; 0 outside-folder changes.
- Elaboration: direct Lean succeeded with exactly 14 `sorry` warnings; scratch `#check @name` inspected all 23 declarations, 0 lost hypotheses or generality changes; `simp`, `rfl`, `infer_instance` closed 0 of 14 theorem probes, and no exact library-lemma replacement was found.
- Pull-request text: addition of 3 files, 3368 lines, 74 headings and 23 declarations agrees with the description; 0 removed headings/declarations, 0 prose contradictions found.

Overlap check: read SpectralSequencesAndConvergencePartII (generic hyperderived/composite-functor/Künneth spectral sequences and filtered pairings), K3BlochGroups (integral stable elements, duality, quaternion resolution, Swan periods), ArithmeticGaloisDuality (finite-group integral UCT and Sylow surjectivity), InductionRestrictionPartII (central five-term sequence, Hall multiplier and integral exterior square), SpectralSequencesAndConvergence (abstract convergence), ProfiniteCohomology (continuous comparisons, products and Mackey), DerivedModuleAlgebra (double-complex sequences), InductionRestriction (representation induction and Mackey); those objects retain the named owners, and the arbitrary-coefficient discrete-group constructions and stated refinements belong to CohomologyOfGroups.

Source independence: 24 passages compared with 5 readable sources, no copied prose or reused table found; largest share HS53, 31 of 93 source-key citation occurrences before References; its three-part structure was compared with the eight layers: independent. The dependency lines force 6.1 → 6.2 → 6.4–6.6 → 6.7, rather than imposing the source's full arrangement. Brown82 and CE56 wording and contents were unavailable; SwanPPeriod60 is waived.

## Not verifiable

- Brown82, settled uncertified in the source manifest: direct text checks unavailable for Chs. III, V, VI §§7–9 and VII, including the orbit sequence, general double-coset/stable-element formulas, Tate duality and periodicity equivalences.
- CE56, settled uncertified in the source manifest: Chs. XII and XVII unavailable, including §2.2's hypercohomology long exact sequence and the cited Tate-duality/periodicity statements.
- SwanPPeriod60, settled waived in the source manifest: Theorems 1–2 not inspected directly; Hutchinson13 Theorem 3.1, p. 12, was checked instead.
- Loh19 Theorem 4.3.7 and §4.3.2 support the sphere-action route and necessary Sylow restrictions; the arbitrary cohomologically trivial resolution and full periodicity equivalences are not stated there.

## Source issues

- **Misprint** in Hutchinson13 at Corollary 3.3, proof, p. 12 (line 518): the source says the nonzero degrees satisfy k ≡ 3 modulo 3; it should be k ≡ 3 modulo 4, as in the corollary; affects the proof.
- **Misprint** in Loh19 at Corollary 3.2.23, proof, p. 136 (lines 5903, 5908, 5927): the source says the tensor resolution uses the G-resolution twice; it should be the tensor product of the G-resolution and the H-resolution; affects the proof.
- **Misprint** in Loh19 at Example 3.2.24, p. 137 (lines 5954–5955): the source says integral homology of ℤ² vanishes for n ≥ 2; it should be n ≥ 3, since its preceding calculation gives H₂ = ℤ; affects a stated result.
- **Misprint** in Loh19 at Example 3.2.25, p. 138 (lines 5976–5980): the source says the final calculation has integral coefficients and dimension n over 𝔽_p; it should be coefficients 𝔽_p and dimension n+1, matching the n+1 summands; affects a stated result.
- **Error** in MilneCFT at Chapter II, Corollary 1.32, p. 70 (lines 3372–3376): the source says finite G and finitely generated M imply Hʳ(G,M) finite without a degree restriction; it should be restricted to r > 0, since H⁰(1,ℤ) = ℤ; affects a stated result.

## For the human reviewers

- none
