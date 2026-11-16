# Review of ModularFormsPartII (pull request #2434 at cd38aeb)

**Verdict:** accepted

No finding. The acceptance is conditional on the three declared supplier gaps (`gap:udc-rational-cusp-of-twisted-full-level`, `gap:udc-all-prime-cuspidal-model-of-full-level`, `gap:udc-bombieri-andre-katz`).

## Verified sound

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Previous R01 (description, consumers) | summary block now: "the λ covering and the vector-valued results are exported for later roadmaps on …" | citations of this roadmap: NoncongruenceModularForms only (README lines 49, 161, 300–307, 786, 1588); the sentence no longer claims other consumers | repaired | none |
| §1.7 `L(H_A) ∣ Np` | p = 2; B = [[1,0],[1,1]], [[2,1],[1,1]] | A⁻¹[[−1,2],[−2,3]]A = [[−1,1],[−4,3]] = CTC⁻¹, C = [[1,0],[2,1]]; A⁻¹[[−3,8],[−2,5]]A = [[−3,4],[−4,5]] = CT⁴C⁻¹, C = [[1,1],[1,2]] | widths 1 and 4 divide Np = 4; CDT's printed C = [[1,1],[2,1]] has det −1 | none |
| §2.1 η-quotient λ | q-series to q¹³; τ = 0.3+0.8i, 1.3+0.8i, i, 2i, 0.6+1.6i | x/q = 1, −8, 44, −192, 718; 0.7660029+0.4097863i; −0.0508248−1.8402518i = λ/(λ−1); 0.5; 0.0294373; −0.0278242+0.1029613i | holds; exponent 8(−1/24+2/12) = 1 | none |
| §2.7 two uniformizations | F₂′(0) by central difference; γ₂, γ₃ from §5.1 formula | F₂′(0) = 4.3768792; Γ(1/4)⁴/(4π²) = 4.3768792; γ₃ = 2.5810565 > 16^(1/3) = 2.5198421; cusp counts 3, 4, 6, 12 against N+1 | holds | none |
| §3.0 `lambdaField` | N = 1 generator; N ∣ M substitution | 16q − 128q² + 704q³ (16·44); `laurentQExpansion : ℝ → (ℍ → ℂ) → LaurentSeries ℂ` takes 2N cast to ℝ | holds | none |
| §3.2 `boundedDenominatorSpan` | control H = Γ₀(3), N = 1; (λ−1/2)⁻¹ | Γ₀(3)·Γ(2) = SL₂(ℤ); width 3 at cusp 0 does not divide 2; exponent of (η(τ)/η(3τ))¹² is 12(1−3)/24 = −1 | definition discriminates | none |
| §3.5 finiteness | N = 2, r = 0.95 | 0.95·4.3768792/4 = 1.0395 > 1; DiophantineApproximationAndTranscendencePartII §4.5 asks for φ holomorphic near the closed disc, \|φ′(0)\| > 1: met | holds | none |
| §3.8 rank bound | N = 5, 10, 50; N = 1 | (γ_N/16^(1/N) − 1)N³ = 0.6186, 0.6051, 0.6012 ≥ ζ(3)/2 = 0.60103; log 1 = 0 < 1 = [R₂ : ℚ(λ)] | holds with log(2N) | none |
| §5.3 degree doubling | tower R₂Np ⊇ R₂N·M₂Np ⊇ M₂Np | [R₂Np : M₂Np] = [R₂Np : R₂N M₂Np]·[R₂N : M₂N] ≥ 2[R₂N : M₂N]; CDT25 line 1819 takes f in R₂Np | holds with f in R₂N | none |
| §5.4 congruence degree | N = 1, 2, 3 | 1/2 (split off); 64/12·3/4 = 4 = 48/6/2 > 32/π² = 3.24; 216/12·3/4·8/9 = 12 = 144/6/2 | holds | none |
| §7.1 algebraicity | f = (1−16x)^(1/2); control K₀ | 1 − 8x − 32x² ∈ ℤ[[x]], operator (1−16x)∂ + 8, trivial monodromy at 0, algebraic; K₀: recurrence (n+1)²a_(n+1) = 4(2n+1)²a_n, logarithmic second solution | holds; control excluded | none |
| §7.2 congruence | same f at x = λ/16 | (1−λ)^(1/2) = (θ₄/θ₃)², checked as q-series to q¹³; 2-adic valuations (4−a)m − v₂(m!) at a = 1 bounded | holds | none |
| §7.12 `vectorValued_effective_mason` | ρ = 1 ⊕ σ, F = (1,0,0) | ρ(γ)F = F for all γ; image of ρ infinite; CDT25 Definition 7.3.1 (lines 3663–3680) has no spanning condition | holds as stated; source corollary does not | none |
| §7.13 σ | σ(S) = diag(1,−1), σ(R) = [[2,1],[−7,−3]] | σ(R)² = [[−3,−1],[7,2]], σ(R)³ = I; σ(T) = [[2,1],[7,3]], X² − 5X − 1, roots 5.19258, −0.19258; c = 0.26216 | holds | none |
| §8.2 `quasiModularWeakAlgebra_differential_closure` | Δ, E₂ | θ_qΔ = 2q² − 96q⁴ = 2(1−24q²)(q²−24q⁴) to q⁴; `normalizedDerivOfComplex_E₂` = 12⁻¹(E₂² − E₄); CDT25 lines 3895, 3903 pair (1/πi)d/dτ with θΔ = E₂Δ | holds with the factor 2 | none |
| §8.3 E₀ | series to x¹³, q¹³ | E₀ = (1−16x)K₀ + 8∫K₀ = (1−16x)(K₀+2xK₀′); E₀(x(q)) = 1, −4, 20, −64, 164, −392 = (θ₃θ₄⁴+4θ_qθ₃)/θ₃³; θ_qx = xθ₄⁴; Sturm ⌊12/12⌋ = 1 | holds; CDT25 line 3949 has constant term −1 | none |
| §9.1 cuspidal model | N = 5, 6; blow-up of ℙ¹ at ε(v) | genus 1 + (N−6)μ/(12N): 0 at N = 5, 1 at N = 6; C² = E² = −1, C·E = 1 | holds; non-minimal model excluded | none |
| §1.8 `wohlfahrt_Gamma_le` | N = 0; H′ at N = 2; ker χ, χ(T) = e^(πi/6) | Γ(0) = ⊥; gT²g⁻¹ = [[−1,2],[−2,3]] ∉ H′, its negative ∈ H′; χ(−I) = −1: T^m-conjugates in ±G iff 6∣m, in G iff 12∣m | holds in signed form only | none |
| §2.2 `modularLambda_covering` | τ = 1+i, (1+i)/2, −1+i, (−1+i)/2 | λ = −1, 2, −1, 2; ST⁻²S⁻¹ = [[1,0],[2,1]]; S(−1+it) has real part 1/(1+t²), on \|τ−1/2\| = 1/2 | holds | none |
| §4.1 `nonabelian_ihara` | G ⊇ Γ(N); N = 2 outside the range | S trivial; at N = 2, ⟨⟨T²⟩⟩ ∋ [[−1,2],[−2,3]] ∉ Sanov's index-2 group, so ⟨⟨T²⟩⟩ = Γ(2) and S is trivial | holds; N ≥ 3 drops only trivial cases | none |
| §4.3 `ihara_generation` | G = ±Γ(3), p = 2 | A[[1,3],[0,1]]A⁻¹ = [[1,6],[0,1]]; A[[1,0],[3,1]]A⁻¹ = [[1,0],[3/2,1]] not integral; images {1}×S×{1} and S×{1}×B generate S×S×B | holds | none |
| §6.1 `boundedDenominatorSpan_eq_congruenceSpan` | N = 1; generator on H with −I and all conjugates of T^(2N) | R₂ = M₂ = ℚ(λ); stabilizer congruence of level ∣ 2N contains Γ(2N) by §1.8 | holds | none |
| §6.1 `boundedDenominatorSpan_finrank_le` | N = 1 | finrank 1 ≤ C log 2 needs C ≥ 1.4427; `FiniteDimensional` conjunct excludes the junk finrank 0 | holds | none |
| §6.2 h₀ | series; γ = [[1,0],[12,1]]; −γ for c < 0 | h₀ = q^(11/12)(1, −6, 33, −134), inverse (1, 6, 3, −46); numerator 24 − 36 = −12, ε = −1; −γ: ≡ −6 mod 12 | holds | none |
| §6.3 `unbounded_denominators` | Δ, h = 1; f·h₀^k in t = exp(2πiτ/2M) | Γ′ = SL₂(ℤ); q^(11k/12) = t^(11k·2M/24), an integral power since 24 ∣ 2M | holds | none |
| §6.4 `rational_unbounded_denominators` | Δ⁻¹/11 | Δ⁻¹ = Q⁻¹ + 24 + 324Q; D = 11; Γ′ = SL₂(ℤ) | holds | none |
| §6.5 `weakForm_galois_conjugate` | √2Δ⁻¹, σ(√2) = −√2; weight k via h₀ | conjugate −√2Δ⁻¹; (f·h₀^k)^σ/h₀^k has exponents in (lcm(h,24)/h)ℤ, so period h | holds | none |
| §6.6 `algebraicInteger_unbounded_denominators` | K = ℚ(√2), basis 1, √2, f = −√2 + 16x | traces 32x and −4, both integral | holds | none |
| §7.11 `vectorValued_component_congruence` | odd k; ρ(T) = [[1,1],[0,1]] | F = −F forces F = 0; the Jordan block fails `Module.End.IsSemisimple` | holds | none |
| §8.6 `congruenceKernel_no_deficient_place` | Δ; E₄; f(Mτ) | A⁻¹γA = [[a, b/M],[Mc, d]] ∈ Γ₀(M²) ∩ Γ₁(M) for γ ∈ Γ(M); E₄ fails a₀ = 0 and 240σ₃(m) ≥ 240m³ | holds | none |
| §8.7 `exists_deficient_finite_place` | S = ∅; ρ = 1 ⊕ σ | all places bounded gives d ∈ 𝓞_K clearing a_j, contradicting §7.11; σ(T)^h − 1 invertible (no root-of-unity eigenvalue) | holds | none |
| §6.7–6.9 tests | j^(1/3); u^(1/5), u^(1/24); n = 8, 16, 3 | 1, 248, 4124, 34752; 1, −24/5, 348/25, −4544/125, 52854/625; 1, −1, 1, −2, 2, −3; valuations s₂(m) ≥ 1, −v₂(m!), −m − v₃(m!) | holds | none |
| §8.4 Catalan quotient | series to q¹¹ | ΣC_n²xⁿ = 1, 1, −4, 5, 12, −42 = theta quotient; constant term of the bracket is 0 | holds | none |
| §2.3, §2.5 | inverse series; x₂, x₃, x₁₆ | q = x + 8x² + 84x³ + 992x⁴ + 12514x⁵, integral to x¹³; 1, −4, 14, −40; 1, −8/3, 68/9, −1408/81; 1, −1/2 | holds | none |
| §2.6 locality | τ₀ = (8+2i)/17 | K₀(λ(τ₀)/16) = 1.0074837; θ₃(τ₀)² = 1.0074837 + 4.0299349i = (1+4i)θ₃(2i)² | holds near ∞ only | none |
| §7.14 example | −gT²g⁻¹ = [[1,−2],[2,−3]] on (h, τh) | B = [[−3,−2],[2,1]], trace −2, det 1; B² = [[5,4],[−4,−3]] | holds | none |

- Gate at cd38aeb: every check passes; the diff outside the folder is empty. Dependency check: `depcheck: 248 roadmaps, 2375 edges, 0 problem(s)`.
- Elaboration of `TauCetiRoadmap/ModularFormsPartII/Suggested.lean`: exit 0, 15 warnings, all `declaration uses sorry`. The file has no `variable` line; no declaration can lose a binder.
- One-tactic probe (`first | rfl | trivial | simp | infer_instance | decide | exact?`) on a scratch copy: all 15 theorems fail. Statable headlines are stated; the docstring's reasons for §§5.3, 5.5, 7.1–7.2, 9.3 hold at the pins.
- Library declarations: 79 names of the supplier contracts elaborate under `#check` at the pins; definitions opened: `Subgroup.adjoinNegOne` (ArithmeticSubgroups.lean:220), `strictWidthInfty` and `widthInfty` (Cusps.lean:318, 329), `IsCongruenceSubgroup` (CongruenceSubgroups.lean:164), `laurentQExpansion` (QExpansion/Laurent.lean:130), `qExpansion_nat_mul` (QExpansion/Order.lean:70), `cuspFormsOld` (Newforms/Basic.lean:180).
- Source locators checked against the text: 41 in CDT25 (the 15 sample targets and 26 further), all at the stated page and supporting the statement; KSV10 Lemma 7, Proposition 3 and Remark 8 (pp.4–6).
- Cross-roadmap citations resolved, 62 sections: on main ModularForms §§0.2, 8.0–8.1, Layer 10; FuchsianOrbifolds; BelyiMaps; UniversalCovers; ConformalMappingPartII; DiophantineApproximationAndTranscendence §§5.2–5.3; EtaleCohomologyFoundations §F.0.2; NoncongruenceModularForms §§3.1, 3.3, 8.1, 8.2. At open heads ModularCurvesPartII (17 sections), SpecialFunctionsTheta §§2.2, 4.2, 6.1, 6.2, 6.4; QSeriesPartitionsAndMockModularForms §§8.1, 8.4a; DiophantineApproximationAndTranscendencePartII §§4.1–4.8; AlgebraicModularFormsAndSerreWeights §2.9; AutomorphicGaloisRepresentations §4.2. Each states what is consumed.
- Declared gaps: the three slugs agree between the README and plan.json; none is already supplied (ModularCurvesPartII §11.4 covers Γ₀(pⁿM) at p > 3 only, its §§5.14, 6.3 state no rational cusp of the twist; DiophantineApproximationAndTranscendence has no Bombieri–André or Katz theorem).
- Pull-request text against the head: 15 theorems and 9 definitions as stated; suppliers listed agree with the README; no sentence contradicted.

Overlap check: read HalfIntegralWeightModularForms, SpecialFunctionsTheta, DiophantineApproximationAndTranscendencePartII, QSeriesPartitionsAndMockModularForms, SiegelModularForms, NoncongruenceModularForms, ModularForms, ConformalMappingPartII. λ, its transformation laws and mapping theorem: SpecialFunctionsTheta (the η-quotient presentation, Γ(2)-invariance and covering here; the two `modularLambda` have different namespaces and bodies). Holonomic germs and rank bound: DiophantineApproximationAndTranscendencePartII. `A_k(Γ, ρ)` and cusp expansions: QSeriesPartitionsAndMockModularForms. `F_N`, `γ_N`, mean growth: ConformalMappingPartII. η multiplier, arithmetic cusp forms: ModularForms. Strict level, strict Wohlfahrt, transport to `ModularForm`: NoncongruenceModularForms; signed level, signed Wohlfahrt and the theorem on weak forms: this roadmap. No other roadmap states the nonabelian Ihara lemma or the generation identity.

Source independence: 16 passages compared with 2 sources (CDT25, KSV10), none shared beyond formulas and statements of a dozen words; largest share CDT25, 89 of 92 parenthesised page locators; contents compared with CDT25 §§1–7: independent (Layer 3 merges §3 with §4.2, Layer 4 precedes Layer 5 against §§4.3–4.4, §§2, 5, 6 are other roadmaps'; Layer 8 follows Layer 7 through the *Needs* of §§8.5, 8.7 on §§7.3, 7.11, 7.13).

## Not verifiable

- Ihara1994, Theorem 1 (pp.248–249) and §4 (p.252), cited in §9.2: paywalled, recorded as uncertified; the locator agrees with CDT25's own citation (CDT25 lines 4128–4133).

## Source issues

- **Misprint** in CDT25 at proof of Lemma 4.1.7, case (2), p.654: the source says C = [[a/p, b],[cp, d]], obtained with the factor diag(p, 1/p); it should be C = [[a/p, b],[c, pd]], with the factor diag(1/p, p), of determinant 1; affects nothing.
- **Misprint** in CDT25 at proof of Theorem 4.3.2, p.656: the source says the form f is chosen in R₂Np outside M₂N; it should be chosen in R₂N outside M₂N, as Theorem 4.3.1 requires; affects nothing.
- **Error** in CDT25 at §4.4, definition of f₂, p.658: the source says conjugation by A is an isomorphism of ⟨E,Γ(N)⟩∩Γ₀(p) onto itself; it should say a map into ⟨E,Γ(N)⟩, since [[1,0],[Np,1]] goes to [[1,0],[N,1]]; affects nothing.
- **Error** in CDT25 at §4.4, before Lemma 4.4.4, p.659: the source says the reduction ⟨E,Γ(N)⟩∩Γ₀(p) → B has kernel Γ(Np); it should say the kernel also contains matrices ≡ −I mod N and ≡ I mod p; affects nothing.
- **Gap** in CDT25 at Lemma 4.2.3 and its proof, pp.655–656: the source says the normal core of the stabilizers of a basis lies in ⟨E,Γ(2N)⟩ with level 2N; it should first intersect with ⟨E,Γ(2N)⟩, as the basis {1} of R₂ gives SL₂(ℤ); affects a stated result.
- **Gap** in CDT25 at Corollary 2.0.5, (2.0.7), p.636: the source says the bound holds for the ℚ(p)-dimension of the ℚ(x)-span V; it should bound the ℚ(p)-span of H unless x(t) is integral; affects a stated result.
- **Misprint** in CDT25 at Propositions 3.0.1 and 4.3.5, pp.650, 657: the source says the dimension is at most C N³ log N for every N, which is 0 at N = 1; it should be C N³ log(2N); affects nothing.
- **Misprint** in CDT25 at (1.0.4), p.629: the source says h = λ(1−λ)/16 has level Γ₀(2); it should name the theta group ⟨Γ(2), S⟩, since with q = e^(πiτ) the translation T negates h; affects nothing.
- **Misprint** in CDT25 at proof of Lemma 7.4.4, pp.692–693: the source says θΔ = E₂Δ for θ = (1/πi)d/dτ; it should be θΔ = 2E₂Δ; affects nothing.
- **Misprint** in CDT25 at §7.4.2, p.693: the source says (2/π)E(16x) equals (16x−1)(2/π)K(16x) minus 8 times the integral; it should be (1−16x)(2/π)K(16x) plus 8 times the integral; affects nothing.
- **Error** in CDT25 at §7.4.2, p.693: the source says every even-degree Laurent monomial in ϑ₂, ϑ₃, ϑ₄ lies in the quasimodular ring of Γ(12); it should be checked per monomial, as ϑ₂ϑ₃ changes sign under T¹²; affects nothing.
- **Gap** in CDT25 at proof of Theorem 7.3.3, p.690: the source says the translates F_j∣γ span a free rank-6n bundle that may be assumed irreducible; it should use the rank-n local system and the continuation space of F_j; affects the proof.
- **Error** in CDT25 at Corollary 7.3.4, p.691: the source says ρ has finite image with kernel containing some Γ(N); it should say Γ(N) fixes every value F(τ), as ρ = 1 ⊕ σ with F = (1,0,0) shows; affects a stated result.
- **Error** in CDT25 at §7.4.8, p.695: the source says Σ(ρ) contains a finite place whenever ker ρ is not congruence; it should require a noncongruence component, since ρ = 1 ⊕ σ has Σ(ρ) empty; affects a stated result.
- **Misprint** in KSV10 at proof of Proposition 3, p.6: the source says L = T′T^(a−1)T′⁻¹; it should be L = T′⁻¹T^(a−1)T′, since at a = 2 the printed product is [[0,1],[−1,2]]; affects nothing.

## For the human reviewers

- none
