# Review of ModularFormsPartII (pull request #2434 at cd38aeb)

**Verdict:** needs changes

## R01 (P3) — The description names consumers that do not exist

**Location** Pull-request description, summary block: "roadmaps on vertex-operator-algebra characters, Belyi covers and arithmetic fundamental groups draw on the λ covering and the vector-valued results."

**Claim** The only roadmap that cites ModularFormsPartII is NoncongruenceModularForms. The sentence describes other current consumers, and none exists.

**Witness** `roadmaps grep --fixed ModularFormsPartII` over main and the 462 open heads gives 13 hits, all in NoncongruenceModularForms. `TauCetiRoadmap/BelyiMaps/README.md` lines 192–193 on main say that "no layer here consumes or supplies" the λ-uniformization.

**Repair** Replace the sentence with: "NoncongruenceModularForms rests on its signed Wohlfahrt theorem and the main theorem in all three forms; the λ covering and the vector-valued results are exported for later roadmaps on vertex-operator-algebra characters, Belyi covers and arithmetic fundamental groups."

## Verified sound

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.7 `L(H_A) ∣ Np` | p = 2; B = [[1,0],[1,1]] and [[2,1],[1,1]] | A⁻¹[[−1,2],[−2,3]]A = [[−1,1],[−4,3]] = CTC⁻¹ (width 1); A⁻¹[[−3,8],[−2,5]]A = [[−3,4],[−4,5]] = CT⁴C⁻¹ (width 4) | holds; CDT's C has det ad/p − bcp ≠ 1 | none |
| §2.1 η-quotient λ | τ = 0.3+0.8i, 1.3+0.8i, i, 2i; q-series | 0.7660029+0.4097863i (SpecialFunctionsTheta §6.1 agrees); −0.0508248−1.8402518i = λ/(λ−1); 0.5; 0.0294373; x = q−8q²+44q³−192q⁴+718q⁵ | holds | none |
| §2.2 `modularLambda_covering` | 1+i, (1+i)/2, −1+i; −I ∈ Γ(2) | λ = −1, 2, −1, so the paired sides agree; SpecialFunctionsTheta states no covering (no "covering" in its README) | holds | none |
| §2.5 Kummer coordinate | N = 2, 3, 16 | x₂ = t−4t³+14t⁵−40t⁷; x₃ = t−(8/3)t⁴+(68/9)t⁷−(1408/81)t¹⁰; x₁₆ = t−(1/2)t¹⁷ | integral iff N ∣ 8 | none |
| §3.1 `congruenceSpan` | N = 1, 2; constant √2 | M₂ = ℚ(λ); [M₄ : M₂] = 48/6/2 = 4, against the unsigned 8; √2 excluded by rational coefficients | holds | none |
| §3.5 finiteness | N = 2, r = 0.95 | γ₂ = Γ(1/4)⁴/(4π²) = 4.376879 > 4; \|φ′(0)\| = 0.95·γ₂/4 = 1.0395 > 1 | holds | none |
| §4.1 `nonabelian_ihara` | g = [[1,0],[Np,1]]; N = 4, G = ⟨⟨T⁴⟩⟩ ∌ −I | c(g) = [[1,0],[N,1]] ∉ Γ₀(p); S = ℤ/2 is nontrivial; amalgam, congruence subgroup property and Wohlfahrt force surjectivity; `hc` determines c uniquely | holds | none |
| §5.4 congruence degree | N = 1, 2, 3 | formula gives 1/2 at N = 1 (split off); (64/12)(3/4) = 4 > 32/π² = 3.24; (216/12)(3/4)(8/9) = 12 | holds | none |
| §5.5 doubling vs bound | N = 1 under CDT's log N | CDT: C·1·log 1 = 0 < 1 = [R₂ : M₂]; with log(2N) the bound needs C ≥ 1/log 2 | holds | none |
| §6.2 h₀ | q-series; γ = [[1,0],[12,1]]; T⁶, T¹² | h₀ = q^(11/12)(1−6q+33q²), h₀⁻¹ = q^(−11/12)(1+6q+3q²); numerator −12, ε = −1, ε² = 1; ε²(T⁶) = −1; h₀(τ+12) = −h₀(τ) | holds | none |
| §6.5 `weakForm_galois_conjugate` | f = √2Δ⁻¹, σ(√2) = −√2; odd k via h₀ | coefficients √2(Q⁻¹+24+324Q+⋯) lie in ℚ(√2); the conjugate −√2Δ⁻¹ is a weak form | holds | none |
| §7.6 L_ρ | ρ = 1; ρ = 1 ⊕ σ | rank 1 (CDT's 6n would give 6); rank 3 with F = (1,0,0) | holds | none |
| §7.8 L_j | W = span{1}, span{1,x}, 0 | Wr(1,y)/Wr(1) = y′ (the reversed order gives −y′); y″; the identity operator | holds | none |
| §7.9 descent | gap:udc-bombieri-andre-katz against DAT §5.3 | DAT §5.3 has `SolvesSystem` and `GalochkinCondition` but neither Bombieri–André nor Katz; the slug is the same in plan.json | holds | none |
| §7.13 σ | σ(S) = diag(1,−1), σ(R) = [[2,1],[−7,−3]] | σ(R)² = [[−3,−1],[7,2]], σ(R)³ = I; σ(T) = [[2,1],[7,3]], X²−5X−1, eigenvalue 5.19258 | refutes CDT Cor. 7.3.4 | none |
| §1.8 `wohlfahrt_Gamma_le` | N = 0; H′ at N = 2; G = ker χ with χ(T) = e^(πi/6) | Γ(0) = ⊥; Γ(2) = ±H′ with −I ∉ H′; conjugates of T^m lie in ±G iff 6 ∣ m, in G iff 12 ∣ m | holds in signed form | none |
| §4.3 `ihara_generation` | G = ±Γ(3), p = 2; general g | [[1,3],[0,1]] ↦ [[1,6],[0,1]]; [[1,0],[3,1]] ↦ [[1,0],[3/2,1]] is excluded; AgA⁻¹ ∈ ±Γ(N) ⇒ g ∈ ±Γ(N) ∩ Γ₀(p) | holds | none |
| §6.1 `boundedDenominatorSpan_eq_congruenceSpan` | N = 1; control H = Γ₀(3) | R₂ = M₂ = ℚ(λ); requiring only T^(2N) ∈ H would admit (η(τ)/η(3τ))¹², which is not in ℚ(λ) | holds; the definition discriminates | none |
| §6.1 `boundedDenominatorSpan_finrank_le` | N = 1; infinite-dimensional junk | finrank 1 ≤ C log 2; the `FiniteDimensional` conjunct rules out the junk value finrank = 0 | holds | none |
| §6.3 `unbounded_denominators` | Δ with h = 1; f = 0; odd k with Γ ∌ −I | Γ′ = SL₂(ℤ); the one-tactic probe fails | holds | none |
| §6.4 `rational_unbounded_denominators` | Δ⁻¹/11, h = 1 | expansion (1/11)(Q⁻¹+24+324Q+⋯); D = 11; Γ′ = SL₂(ℤ) | holds | none |
| §6.6 `algebraicInteger_unbounded_denominators` | K = ℚ(√2), f = −√2+16x | traces against the basis 1, √2: 32x and −4 | holds | none |
| §7.11 `vectorValued_component_congruence` | odd k; ρ(T) = [[1,1],[0,1]] | ρ(−I) = 1 forces F = 0; a Jordan block ρ(T) fails `Module.End.IsSemisimple` | holds | none |
| §7.12 `vectorValued_effective_mason` | ρ = 1 ⊕ σ, F = (1,0,0) | ρ(γ)F = F for every γ, while the image of ρ is infinite | holds as stated | none |
| §8.2 `quasiModularWeakAlgebra_differential_closure` | Δ, E₂ | E₂ = DΔ·Δ⁻¹ ∈ A; DE₂ = (E₂²−E₄)/12; θ_qΔ = 2q²−96q⁴ = 2E₂Δ | holds | none |
| §8.6 `congruenceKernel_no_deficient_place` | Δ with a_m = τ(m); E₄ | Δ satisfies `HasCuspidalExpansionOver`; E₄ fails because a₀ = 1, and 240σ₃(m) ≥ 240m³ | holds | none |
| §8.7 `exists_deficient_finite_place` | S = ∅; ρ = 1 ⊕ σ | S = ∅ contradicts §7.11, so the statement is vacuously true; the σ-part is 0 because σ(T)^h − 1 is invertible | holds | none |
| PR description, consumers (R01) | grep over main and 462 open heads | 13 citations, all in NoncongruenceModularForms; BelyiMaps: "no layer here consumes or supplies" | contradicted | R01 |

- Gate at cd38aeb: every check passes, and the diff outside the folder is empty (rechecked). Depcheck output: `depcheck: 250 roadmaps, 2381 edges, 0 problem(s)`. The suppliers ModularCurvesPartII (79), AlgebraicModularFormsAndSerreWeights (108), AutomorphicGaloisRepresentations (178), QSeriesPartitionsAndMockModularForms (265) and DiophantineApproximationAndTranscendencePartII (296) all precede this roadmap (297). SpecialFunctionsTheta is a new roadmap in another author's pull request.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ModularFormsPartII/Suggested.lean` exits 0 with 15 warnings, all `declaration uses sorry`. One scratch file with `#check @` for the 24 declarations and 89 library names elaborates without error; each type matches the README's generality and no binder is lost.
- One-tactic probe (`first | rfl | infer_instance | trivial | simp | decide`): all 15 theorems fail, so there is no padding. Statable headlines are all stated; the docstring's reasons for omitting §§5.3, 5.5, 7.1–7.2 and 9.3 hold (the pins have no ODE monodromy and no minimal regular model of X(N)).
- Locators checked against the text: the 15 sample targets and 22 more in CDT25, all at the right page and supporting the statement; KSV10 Lemma 7, Proposition 3 and Remark 8 (pp.4–6) and the misprint on p.6.
- Library declarations opened at the pins: `Subgroup.adjoinNegOne` (ArithmeticSubgroups.lean:220), `Subgroup.widthInfty` (Cusps.lean:329), the `HasDetOne` instance for the image of SL₂(ℤ) subgroups (ArithmeticSubgroups.lean:55), `Derivative.normalizedDerivOfComplex` (Derivative.lean:39), `TauCeti.UpperHalfPlane.laurentQExpansion` (QExpansion/Laurent.lean:130), and Poincaré's polygon theorem under FuchsianOrbifolds item 2.3 (Fuchsian/Polygon/Poincare.lean).
- Cross-roadmap citations resolved:
  - On main: ModularForms, FuchsianOrbifolds, BelyiMaps, UniversalCovers, ConformalMappingPartII, DiophantineApproximationAndTranscendence, EtaleCohomologyFoundations and NoncongruenceModularForms; every cited section, layer and item is present.
  - At open heads: ModularCurvesPartII, SpecialFunctionsTheta, QSeries §§8.1/8.4a, DATPartII §§4.1–4.8, AlgebraicModularFormsAndSerreWeights §2.9 (its alias R15.2) and AutomorphicGaloisRepresentations §4.2; all present.
  - NoncongruenceModularForms cites W1.2–W1.3, W1.5–W1.6, W1.8 and W6.3–W6.5, and each resolves through the old → new table.
- The three gap slugs agree between the README and plan.json. None is already supplied: ModularCurvesPartII §5.14 and §6.3 have no rational cusp of X(ℤ/m ⊕ μ_m), and DAT §5.3 has no Bombieri–André or Katz theorem.
- Recomputed in exact arithmetic: x, q(x), x₂, x₃, x₁₆, h₀^(±1), u^(1/5), u^(1/24), the valuations of (1−16x)^(1/n) for n = 8, 16, 3, E₀ (both forms), K₀(x) = θ₃², the Catalan theta quotient through q¹², η⁴, j^(1/3) and Δ⁻¹. Numerically: λ at 8 points, γ₂, γ₃, F₂′(0) = 4.37688 and the §2.6 locality example (1.0074837 against 1.0074837+4.0299349i). All agree with the README.

Overlap check: read HalfIntegralWeightModularForms, SpecialFunctionsTheta, DiophantineApproximationAndTranscendencePartII, QSeriesPartitionsAndMockModularForms, SiegelModularForms, NoncongruenceModularForms, ModularForms and ConformalMappingPartII. Each shared object has one owner, cited by the other:
- λ and its mapping theorem belong to SpecialFunctionsTheta; the η-quotient presentation, Γ(2)-invariance and the covering belong here.
- Holonomic rings and the rank bound belong to DiophantineApproximationAndTranscendencePartII.
- A_k(Γ, ρ) and expansions at the cusps belong to QSeriesPartitionsAndMockModularForms.
- F_N and γ_N belong to ConformalMappingPartII.
- The η multiplier and arithmetic cusp forms belong to ModularForms.
- NoncongruenceModularForms owns the strict level, strict Wohlfahrt, number-field bounded denominators and the theorem transported to `ModularForm`. This roadmap owns the signed level, signed Wohlfahrt and the theorem on weak forms. §8.6 reaches the cusp-form case from ModularForms §§8.0–8.1 and AlgebraicModularFormsAndSerreWeights §2.9, because citing NoncongruenceModularForms would make the two roadmaps cite each other.

Source independence: 12 passages compared with 2 sources (CDT25, KSV10), with no shared run beyond forced formulas and notation. The largest share is CDT25, 67 of 74 locators. Contents compared with CDT25 §§1–7: independent. Layers 1–6 do not follow §§2–6 (Layer 4 precedes Layer 5, the reverse of §§4.3–4.4); Layer 8 follows Layer 7 because §§7.3, 7.11 and 7.13 are needed.

## Not verifiable

- Ihara1994, Theorem 1 (pp.248–249) and §4 (p.252), cited in §9.2: the text is paywalled (doi:10.1017/CBO9780511569302.011) and the manifest records it as uncertified. The locator matches CDT25's citation of it (CDT25 lines 4128–4133).

## Source issues

- **Misprint** in CDT25 at proof of Lemma 4.1.7, case (2), p.654: the source says C = [[a/p, b],[cp, d]] = (A⁻¹BA)·diag(p, 1/p); it should be C = [[a/p, b],[c, pd]] = (A⁻¹BA)·diag(1/p, p), of determinant 1; affects nothing.
- **Misprint** in CDT25 at proof of Theorem 4.3.2, p.656: the source chooses f in R₂Np outside M₂N; it should choose f in R₂N outside M₂N, the input of Theorem 4.3.1; affects nothing.
- **Error** in CDT25 at §4.4, definition of f₂, p.658: the source says conjugation by A maps ⟨E,Γ(N)⟩∩Γ₀(p) onto itself; it should say into ⟨E,Γ(N)⟩, since [[1,0],[Np,1]] ↦ [[1,0],[N,1]] ∉ Γ₀(p); affects nothing.
- **Error** in CDT25 at §4.4, before Lemma 4.4.4, p.659: the source says reduction ⟨E,Γ(N)⟩∩Γ₀(p) → B has kernel Γ(Np); it should say the kernel also contains elements ≡ −I mod N, ≡ I mod p (−I when p = 2); affects nothing.
- **Gap** in CDT25 at Lemma 4.2.3 and its proof, pp.655–656: the source takes the normal core of the basis stabilizers and asserts it lies in ⟨E,Γ(2N)⟩ with level 2N; it should first intersect with ⟨E,Γ(2N)⟩, since for R₂ = ℚ(λ) the core is SL₂(ℤ); affects a stated result.
- **Gap** in CDT25 at Corollary 2.0.5, p.636: the source bounds the ℚ(p(x))-dimension of the ℚ(x)-span V; it should bound the ℚ(p(x))-span of H, which is all its proof through Theorem 2.0.1 (integral t-expansions) gives; affects a stated result.
- **Misprint** in CDT25 at Propositions 3.0.1 and 4.3.5, pp.650, 657: the source bounds by C N³ log N for all N, which is 0 at N = 1; it should use log(2N), since [R₂ : M₂] = 1; affects nothing.
- **Misprint** in CDT25 at (1.0.4), p.629: the source gives h = λ(1−λ)/16 level Γ₀(2); it should say the theta group ⟨Γ(2), S⟩, since with q = e^(πiτ) the matrix T ∈ Γ₀(2) negates h; affects nothing.
- **Misprint** in CDT25 at proof of Lemma 7.4.4, p.692: the source says θΔ = E₂Δ for θ = (1/πi)d/dτ; it should be θΔ = 2E₂Δ; affects nothing.
- **Misprint** in CDT25 at §7.4.2, p.693: the source writes (2/π)E(16x) = (16x−1)(2/π)K(16x) − 8∫₀ˣ; it should be (1−16x)(2/π)K(16x) + 8∫₀ˣ, both sides having constant term 1; affects nothing.
- **Error** in CDT25 at §7.4.2, p.693: the source says every even-degree Laurent monomial in ϑ₂, ϑ₃, ϑ₄ lies in M̃(Γ(12)); it should be checked monomial by monomial, since ϑ₂ϑ₃ changes sign under T¹²; affects nothing.
- **Gap** in CDT25 at proof of Theorem 7.3.3, p.690: the source builds a free rank-6n bundle from the translates F_j|γ and assumes irreducibility; it should use the rank-n system, since the translates are ℂ-combinations of n components; affects the proof.
- **Error** in CDT25 at Corollary 7.3.4, p.691: the source concludes that ρ has finite image with ker ρ ⊇ Γ(N); it should conclude only that Γ(N) fixes every value F(τ), as ρ = 1 ⊕ σ, F = (1,0,0) shows; affects a stated result.
- **Error** in CDT25 at §7.4.8, p.695: the source says Σ(ρ) contains a finite place whenever ker ρ is not congruence; it should require a noncongruence component, since for ρ = 1 ⊕ σ every element of S_k(ρ) has zero σ-part and Σ(ρ) = ∅; affects a stated result.
- **Misprint** in KSV10 at proof of Proposition 3, p.6: the source factors L = T′T^(a−1)T′⁻¹; it should be T′⁻¹T^(a−1)T′ (at a = 2 the printed product is [[0,1],[−1,2]] ≠ L); affects nothing.

## For the human reviewers

- none
