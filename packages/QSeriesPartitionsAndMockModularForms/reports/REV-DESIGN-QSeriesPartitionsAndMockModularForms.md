<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/540#issuecomment-6314230407 -->
Review (claude) of 3a13ee4

Verdict: needs_changes

1. **F01** (P1) Gap `rank-crank-dissections` has no owner

   - Location: `design/plan.json`, gaps entry `rank-crank-dissections`: `"supplier": "none"`; `design/README.md` line 87, "Owner: this roadmap; Layer 4, proof inputs to 4.5"; consumed at line 496 (`*Needs:* §4.3; §4.4; gap:rank-crank-dissections`).
   - Claim: the root-of-unity dissections of R(ζ_ℓ;q) (ℓ=5,7) and V(ζ_ℓ;q) (ℓ=5,7,11) are a declared gap.
   - Witness: a gap with `supplier = none` is an unowned prerequisite; the design itself says the owner is this roadmap, so the item is a target, not a contract. The sources are at hand: Garvan1988 line 154 ((1.27)–(1.29)) and §§2–6; AndrewsGarvan1988 line 69 ((1.13)–(1.15)).
   - Repair: delete the gap from `plan.json` and the README. Add a target 4.4a `rankCrankDissections` in Layer 4 (before 4.5): for ℓ∈{5,7} the ℓ-dissection of R(ζ_ℓ;q), for ℓ∈{5,7,11} of V(ζ_ℓ;q), as explicit identities with their theta/eta products, absolute summability on |q|<1, hypotheses (ζ_ℓ primitive, |q|<1), an API (coefficient of each residue class, vanishing of the target class), three Checks (e.g. the q⁴ coefficient of V(ζ₅;q), the nonvanishing of a non-target class, and ℓ=11 for R failing), and the locators Garvan1988 §§2–6 and AndrewsGarvan1988 (1.13)–(1.15). Then 4.5 needs §4.4a instead of the gap.

2. **F02** (P1) Gap `prime-power-filtrations` has no owner

   - Location: `design/plan.json`, gaps entry `prime-power-filtrations`: `"supplier": "none"`; README line 89, "Owner: this roadmap; Layer 4, between 4.8 and 4.9"; consumed at line 558.
   - Claim: the integral eta-decimation modules and their U-stability estimates are a declared gap.
   - Witness: `supplier = none`. The sources are certified and already read: Atkin1967 line 410 (Lemma 10) and Lemmas 3–8, 11–14; Watson1938 lines 76, 123–126 (Hauptsätze 1, 3, 4) and §§2–4.
   - Repair: delete the gap. Add a target 4.8a `etaDecimationModules` stating, for ℓ∈{5,7,11}, the explicit modules (bases of eta quotients on Γ₀(ℓ)), the integrality of U_ℓ and U_ℓ∘(φ_ℓ·) on them, and the gain of one factor ℓ per step (one per two steps for ℓ=7 after the first), with locators Atkin1967 Lemma 10 and Lemmas 8, 14, Watson1938 §§2–4, an API, and Checks (the ℓ=7 exceptional first step; p(243) ≡ 245 mod 343 from Watson1938 line 108; the ℓ=11 base case p(6)=11). Then 4.9 needs §4.8a.

3. **F03** (P1) Gap `general-parabolic-fourier` has no owner

   - Location: `design/plan.json`, gaps entry `general-parabolic-fourier`: `"supplier": "none"`; README line 93, "Owner: this roadmap; Layer 8, general representation interface"; consumed at lines 854 and 952.
   - Claim: cusp expansions and normalized nonholomorphic parts for arbitrary finite-dimensional ρ are a declared gap, with the alternative "or retain this explicit gap without a Weil-only substitution".
   - Witness: `supplier = none`; the `needs` sentence is also disjunctive ("Provide … or retain …"), so it is not a contract anyone can discharge. The definitions 8.1 and 8.7 that depend on it are the roadmap's own.
   - Repair: either (a) add a target 8.4a `parabolicFourierExpansion` for a general finite-dimensional ρ: Jordan decomposition of ρ(T), expansion of each generalized eigenspace in e(nτ)·(polynomial in τ) with the Maass kernels of 8.4, hypotheses (finite index, exponential growth, k≠1), API, Checks (a unipotent 2×2 monodromy giving a τ·e(nτ) term; the semisimple case recovering 8.5), and a locator the fix worker certifies; or (b) restrict 8.1's cusp conditions and 8.7's normalized parts to representations with semisimple parabolic monodromy (which includes every finite Weil module and every scalar multiplier used in Layers 10–11), state that restriction in Scope, and remove the gap. In both cases 8.1 and 8.7 stop citing a gap.

4. **F04** (P1) Gap `mock-shadow-faithfulness` has no owner

   - Location: `design/plan.json`, gaps entry `mock-shadow-faithfulness`: `"supplier": "none"`; README line 97, "Owner: this roadmap; Layer 8, standard mock-space comparison"; consumed at line 952 by `mockModularForm_zeroShadow`.
   - Claim: injectivity of the normalized holomorphic-part correspondence on the standard mock space is a declared gap.
   - Witness: `supplier = none`. The README already sketches the proof (Stokes/Petersson positivity after subtracting local cusp primitives), so the roadmap owns it.
   - Repair: delete the gap. Either add a target 8.6a `standardMock_periodFaithfulness` (for finite-index Γ, unitary finite Weil ρ_L, k≠1: F∈H_k⁺ with F⁺ weakly holomorphic has F⁻=0; hypotheses, API, Checks including the negative control conj(j−744) in the full space), with a certified locator, or weaken `mockModularForm_zeroShadow` to the two implications that 8.5 already gives (shadow zero iff F⁻=0) and drop the clause "iff h is weakly holomorphic".

5. **F05** (P1) Gap `mock-hecke-identifications` has no owner

   - Location: `design/plan.json`, gaps entry `mock-hecke-identifications`: `"supplier": "none"`; README line 99, "Owner: this roadmap; Layer 10, proof inputs to 10.4"; consumed at line 1117.
   - Claim: the equalities between the thirteen unilateral series of 10.3 and the Hecke-type sums of 10.4 are a declared gap.
   - Witness: `supplier = none`. Zwegers2002 line 4123 states the thesis takes the Hecke sums as definitions; the equalities are theorems of Andrews1986 (its Theorems listed in the References at lines 241, 266, 450, 698 of that text) and Hickerson1988 pp. 665–666 (uncertified, cited by locator). Both are already in the manifest.
   - Repair: delete the gap. Add a target 10.3a `fifthSeventhOrder_unilateralToHecke`: the eight fifth-order equalities of Zwegers2002 lines 4085–4120 and the three seventh-order equalities of lines 3697–3720, each stated for the actual unilateral series of 10.3, with hypotheses |q|<1, the ψ₁ constant-term convention, the index dictionary F₀,F₁,F₂ = A₀,A₁,A₂, locators Andrews1986 Theorems 3–4, 9, 13 and Hickerson1988 pp. 665–666, an API (the Bailey-pair inputs of 2.6–2.7 used), and Checks (constant terms; the q¹ coefficient of f₀; the corrected 3rd and 8th formulas of Andrews1986 noted at Zwegers2002 line 4123). Then 10.4 needs §10.3a.

6. **F06** (P1) Gap `rank-root-level` has no owner

   - Location: `design/plan.json`, gaps entry `rank-root-level`: `"supplier": "none"`; README line 101, "Owner: this roadmap; Layer 11, explicit-level contract for 11.2–11.3"; consumed at lines 1219 and 1236.
   - Claim: the identity ν_eta(γ₃)⁻³ = ν_eta(γ)⁻¹ on Γ(2592t²), the common multiplier χ_t and the cusp transports are a declared gap.
   - Witness: `supplier = none`. Zagier2009 line 929 (Theorem 7.1) gives mock modularity with an unspecified congruence group; the explicit level is Bringmann–Ono's theorem (BringmannOno2006, certified in the manifest, §1 of the author version), so this is a target with a source, not a contract on another roadmap.
   - Repair: delete the gap. Add a target 11.2a `rankRoot_congruenceMultiplier` stating the eta-multiplier comparison and the common character at the chosen level with its proof route (the characteristic phase −ab/3 ± 2(j/t)a(1−d) + 3(j²/t²)c(2−d) and its evenness, as already written in the gap text), the removable order-3 specialization, hypotheses (t>1, α=h/t in lowest terms, γ∈Γ(N)), an API, Checks (t=2 against H₃; one explicit γ∈Γ(N) with c≠0), and a locator into BringmannOno2006 (author version, §1 statement and §3 proof) and Zagier2009 line 929. If the explicit level cannot be certified from the readable sources, state 11.2 and 11.3 for "a congruence subgroup of finite index depending on t" as Zagier does and move the explicit level to a Check rather than a law.

7. **F07** (P3) `baileyLemma_limit` has no stated hypotheses

   - Location: README line 314, "`baileyLemma_limit`: The coefficientwise and dominated analytic limiting transforms with their actual parameter domains", and line 312, "whenever the derived majorants apply".
   - Claim: limiting forms of Bailey's lemma as ρ-parameters tend to infinity.
   - Witness: the law names no limit and no domain; a law "whenever the majorants apply" cannot be held to.
   - Repair: state the two standard limits as laws: for ρ₁,ρ₂→∞ with a,q fixed, |q|<1, Σ aⁿq^(n²)βₙ = P(aq;q)⁻¹Σ aⁿq^(n²)αₙ, under Σ|aⁿq^(n²)αₙ|<∞; and the one-parameter limit ρ₁→∞ with ρ₂ fixed, with its explicit factor; each with the Andrews1986 locator (line 110 region for (3.1)).

8. **F08** (P3) 7.5 silently drops the source's primitivity hypothesis

   - Location: README line 822, "For any negative integral c, split a+ℤʳ into cosets…" with locator Zwegers2002 Proposition 4.3.
   - Claim: the unary factorization for every integral c with Q(c)<0.
   - Witness: Zwegers2002 line 3624, "Let c ∈ C_Q ∩ ℤʳ be primitive". The README's statement is nevertheless true (the coset decomposition only needs Q(c)≠0, and the Check `correctionNonprimitive` at line 833 exhibits c=2, which I verified: −C(1/8,0;8τ)−C(5/8,0;8τ) covers 1/4+ℤ exactly).
   - Repair: add one clause at the claim: "Zwegers states this for primitive c; the proof below needs only Q(c)≠0, and `correctionNonprimitive` witnesses the non-primitive case."

9. **F09** (P3) Which finite Weil representation 8.5 calls ρ_L is not pinned

   - Location: README line 914 ("F∈H_k(Γ,ρ_L)", "n∈ℤ+Q(h)") and line 916 (`harmonicMaass_centralAction`: "F_h=exp(πi(k−σ/2))F_(−h)"), against the supplier contract at line 63 (MetaplecticAutomorphicForms §4.7).
   - Claim: Fourier support n∈ℤ+Q(h) and the central phase exp(πi(k−σ/2)).
   - Witness: MetaplecticAutomorphicForms §4.7 supplies two representations, ω_L (T acts by exp(−2πiq(μ))) and its conjugate ρ_L (positive exponent); BruinierFunke2003 line 392 ("vanish unless n−q(h)∈ℤ") is the ρ_L convention, under which the central phase is exp(−πiσ/2). With ω_L both signs flip. The only Check, `fourierCentralParity` (line 927), has σ=0 and cannot tell them apart.
   - Repair: in Conventions or 8.5 say "ρ_L is the conjugate of MetaplecticAutomorphicForms §4.7's ω_L (its `finiteWeil_conjugate`)", and add a Check with σ≠0, e.g. L=⟨2⟩ (σ=1, h=1/2): exponents lie in ℤ+1/4 and ρ_L(Z)e_(1/2)=exp(−πi/2)e_(−1/2).

10. **F10** (P3) Process and status words in the README

   - Location: README lines 1260–1276 (References: "certified", "waived", "uncertified", "(inherited bibliographic locators, not independently checked)", "(bibliographic locators only)"); line 1254 ("Its exact section contract is not present", "no verified section-level request is asserted here"); line 1258 ("A locator to a statement does not certify an absent intermediate proof contract").
   - Claim: house style forbids process narrative; a reader a year from now should not see manifest status in the roadmap text.
   - Witness: the quoted phrases.
   - Repair: keep the References as author, title, year, locator and link only (status lives in `sources.toml`); rewrite the Downstream consumers paragraph as timeless statements of what is supplied to whom; delete the sentence at line 1258.

11. **F11** (P3) Two imprecise supplier phrasings

   - Location: README line 700, "g is a cusp form of weight 3/2 on the finite stabilizer of its characteristics"; line 990, "`meromorphicJacobiDatum_holomorphic`: With empty pole divisor recover the holomorphic Jacobi carrier of §6.18".
   - Claim: the stabilizer is finite; the holomorphic data of 9.2 are the objects of MetaplecticAutomorphicForms §6.18.
   - Witness: the stabilizer of a rational characteristic in Mp₂(ℤ) is of finite index, not finite. MetaplecticAutomorphicForms §6.18 defines adelic "smooth automorphic sections … holomorphic in the complex Heisenberg variable" and says "Layer 8 supplies the BFH coordinate specialization"; 9.2's data are classical functions satisfying (E) and (M) of Zwegers2002 line 2661.
   - Repair: write "finite-index stabilizer"; in 9.1/9.2 say the comparison with §6.18/§6.20 goes through MetaplecticAutomorphicForms' classical-coordinate specialization and name its hypotheses (positive index m, weight k, trivial finite multiplier), as 9.1 already does for the theta decomposition.

12. **F12** (P3) Scope names a roadmap that does not exist as an owner

   - Location: README line 11, "The Siegel–Narain kernel, theta lifting and Siegel–Weil theory retain their separate owners, including IndefiniteThetaAndSiegelWeil."
   - Claim: Siegel–Weil theory is owned by `IndefiniteThetaAndSiegelWeil`.
   - Witness: no roadmap of that name is on main, in `merge-order/ORDER.txt`, or under `board/packages`.
   - Repair: name an existing owner (MetaplecticAutomorphicForms owns theta kernels and Siegel–Weil in its Layers 6–8) or say that these theories are outside this roadmap without naming an owner.

Files reviewed: `packages/QSeriesPartitionsAndMockModularForms/design/README.md`, `packages/QSeriesPartitionsAndMockModularForms/design/plan.json`, `packages/QSeriesPartitionsAndMockModularForms/sources.toml`. No previous review exists. No `Suggested.lean` exists at the design stage, so no elaboration was run.

## Adversarial pass

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| 1.1 `qPochhammerFin` | n=0,1,2; q=0; q=1; zero ring; P₂(a;q)=1−a−aq+a²q | all correct | none |
| 1.2 `qPochhammerInt` | a=3,q=2 gives P₋₁=−2; a=q=2 excluded | matches Gasper1995 line 437 | none |
| 1.3 `qPochhammerRatio` | Q₋₁([3];[1];2)=−1; Q₋₁([3];[2];2)=0 | correct; continuation avoids 0/0 | none |
| 1.4 `formalQPochhammer` | first three coefficients; a=1; 𝔽₂ | (1−a)−a(1−a)X−a(1−a)X²; 1+X+X² mod 2 | none |
| 1.5 inverse-base identity | n=2 | (1−a)(1−aq)=a²q(1−a⁻¹)(1−a⁻¹q⁻¹) | none |
| 1.6 limit, zero locus | a=q⁻¹; q=0 | tail at n=1 is zero; P(a;0)=1−a | none |
| 2.1 `basicHypergeometricPhi` | A=B=[]; A=[a]; termination at N=0; B=[1] | c₁=−1/(1−q), (1−a)/(1−q); inadmissible case excluded | none |
| 2.2 shift law | k arbitrary | Q-concatenation and q-exponents match termwise | none |
| 2.3 convergence | q=2,a=1/2 (radius 4); q=0 with e=0,1 | ratio |a/q|; q=0 formulas verified | none |
| 2.3 inverse-base term identity | general n | signs and q-powers cancel exactly | none |
| 2.4 q-binomial | q=0; q=1/2 (1+2z+(8/3)z²) | correct | none |
| 2.5 ₁ψ₁ | a=1/2,b=1/10,q=0.4,z=1/2 numerically | equality to 1e-10 | none |
| 2.6 Bailey pair | unit pair, zero pair, β₁ | matches Andrews1986 line 95 | none |
| 2.7 Bailey lemma | q=0,a=0 transform | α=δ₀, βₙ=1 | R07 (limit law hypotheses) |
| 3.1 Gaussian polynomial | G(2,1), G(0,−1), G(3,1)(1), G(2,1)(−1) | 1+Q, 0, 3, 0 | none |
| 3.2 Schur finite identities and recurrences | n=0…12 exactly in ℤ[Q] | both identities and both recurrences hold | none |
| 3.3 Rogers–Ramanujan | coefficients 0…4 | 1,1,1,1,2 and 1,0,1,1,1 | none |
| 3.4 quintuple product | q=0.3, z=0.7+0.2i numerically; z=1 first terms | equality; 2−2q−2q² | none |
| 3.5 partition series | p(0..4); pentagonal product | 1,1,2,3,5; product 1 | none |
| 4.1 rank/crank | ∅, (1), (3,2,1,1), (3,3), conjugates | 0/0, 0/−1, −1/−1, 1/3; conjugate (2,2,2) rank −1 | none |
| 4.2 vector partitions | size 0,1; swap | V₁=z+z⁻¹−1 | none |
| 4.3 C=V+(1−z)X | size 1 | z⁻¹ = (z+z⁻¹−1)+(1−z) | none |
| 4.4 character filter | t=1; n=1 mod 2 | classes 0 (rank), 1 (crank) | none |
| 4.5 equidistribution | sizes 4,5,6; rank at 6 mod 11 | one per class; rank 1 occurs twice | none |
| 4.6 offsets | δ(5,1..2), δ(7,1), δ(7,3), δ(11,1); ℓ=2,3 | 4,24,5,243,6; no solution | none |
| 4.8 eta decimation | ℓ=11 first step; δ=ℓ−m for ℓ=5,7,11 | p(6)=11; 4,5,6 | none |
| 4.9 seven exponent | r=3 | 49 | p(243), 343 ∤ (Watson1938 line 108) | none |
| 5.1 odd theta | ν=±1/2 pair; comparison with `jacobiTheta₂` | i·e^(πiτ/4)(e^(πiz)−e^(−πiz)); exponent matches Mathlib's term | none |
| 5.2 eta multiplier | T, S at τ=i, −I | e^(πi/12), e^(−πi/4), −i; completed μ factor 1 | none |
| 5.3 β bound | x>0 | β(x)≤e^(−πx)/(π√x) | none |
| 5.4 Mordell integral | z=1/2, τ=i | h=1 from shift equation and evenness | none |
| 5.5 `zwegersR_dbar_u` | τ=i, u=i/2 numerically (finite differences) | ∂̄_u R = √(2/y)e^(−2πa²y)conj ϑ(u;τ) to 1e-8; the alternative ϑ(u;−τ̄) has the opposite sign | none (README correct) |
| 5.6 μ vs m(x,q,z) | normalization comparison | μ=−i·e^(−πiτ/4+πi(u−v))m(X,q,Z) | none |
| 5.7 completion | S-defect constants | h/(2i)+(i/2)h=0 | none |
| 6.1 ∂̄_τ C and ξ_(1/2)C | direct differentiation; scaling τ↦dτ | −i g(a,−b;−τ̄)/√(2y); −√2 g; −√(2d) g(a,b;dτ) | none |
| 6.3 stabilizer phase C_g | derived from Theorem 1.11 (1),(2) | formula at line 731 reproduced | none |
| 7.1–7.2 hyperbolic example | c₀=(1,−1), boundary (1,0),(0,−1); a=(1/2,1/2),(0,1/2); ν=(1/2,±1/2) | kernels 2 and 0; (0,1/2) excluded; (−1,0) rejected | none |
| 7.3 Q⁺ | hyperbolic negative pair; boundary pair | positive values; identically 0 for the boundary pair | none |
| 7.4 S-prefactor, odd diagonal | det A=−1, r=2; diag(1,−1) | τ; v=(1,1) | none |
| 7.5 factorization | A=[−2], c=1 and c=2 | −C(1/4,0;2τ); −C(1/8,0;8τ)−C(5/8,0;8τ) | R08 |
| 8.2 operators | y^s, log y at k=1; ξ₀(y), ξ₀(iy); k=1/2 constant | −s(s+k−1)y^s; 0; 1; −i; 3/16; Δ_k=−ξ_(2−k)ξ_k verified | none |
| 8.4 kernel | k=0 | H₀=e^w | none |
| 8.5 ξ of Fourier modes | a y^(1−k); conj(q⁻¹) at k=0; central element | (1−k)conj a; 4πq⁻¹; phase depends on ρ_L vs ω_L | R09 |
| 8.7 Eichler integral | differentiate lower endpoint | ∂̄F⁻=(i/2)y^(−k)conj g, ξF⁻=g | none |
| 9.1 components | θ₁,₀, θ₁,₁ leading terms | 1+(e(2z)+e(−2z))q; q^(1/4)(e(z)+e(−z)) | none |
| 9.4 cone data and R_(m,l)(0) | A=[[2m,1],[1,0]]; l=0,m | Q(c₂)=−m, B=−1; R_(m,0)(0)=1, R_(m,m)(0)=0 | none |
| 10.1 third order | f, ω, φ, ψ coefficients to q⁷; 2φ−f=f+4ψ=θ₄/(−q;q)_∞ | exact in ℤ⟦q⟧ to degree 13 | none |
| 10.2 third-order shadow | first component | H₃,₁=q^(−1/24)f−2C(1/6,0;3τ), shadow 2√6 g(1/6,0;3τ) | none |
| 10.3 χ relations | elimination in Zagier2009 lines 205–217 | χ₀=2F₀−φ₀(−q), χ₁=2F₁+φ₁(−q)/q | none |
| 10.4–10.8 Hecke sums, cone data, matrices | all exponents, c-vectors, T and S matrices against Zwegers2002 | match (lines 3697–3804, 4085–4120, 4243–4249, 4329–4450, 4679–4685, 4770–4883, 5029–5052) | none |
| 10.6 T-law on F₅,₂ | component 4 under τ↦τ+1 | −ζ₂₄₀^(−49)=ζ₂₄₀^(71) | none |
| 11.1 bilateral rank | z=−1; z=e(1/5), q=0.3 numerically | equality to 1e-12 | none |
| 11.2 rank-to-Lerch | α=1/5, τ=0.1+0.8i numerically with ξ^(1/2)=e(α/2) | README formula equals q^(−1/24)R/D to 1e-12; Zagier2009 line 948 as printed does not | none |
| 11.2 shadow | ξ=−1 | D/(2√6)·Σχ₁₂(n)n i^n q^(n²/24) = √(2/3)Σ_(n≡1 (6)) n q^(n²/24) = ξH₃,₁ | none |
| 11.3 filter | t=1, t=2 | 0; ±(1/2)q^(−1/24)f | none |

## Supplier-order audit

Gate output:

```
candidate: QSeriesPartitionsAndMockModularForms is not in the merge order yet; checked as if placed after MetaplecticAutomorphicForms (the intake inserts it when its design is accepted)
depcheck: 5 roadmaps, 30 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every `*Needs:*` line and supplier citation was read: suppliers are Mathlib, Tau Ceti, ClassicalArithmeticCompletion (order line 79), GeometryOfNumbersAndQuadraticArithmetic (line 60), MetaplecticAutomorphicForms (line 111), and the main-branch roadmaps ThetaSeries, ModularForms, PDE, ContourIntegration (completed) and IntegralLattices (completed; milestones 0G, 1G, 1H in the main README). No consumer is cited as a supplier. No supplier drift: each cited section exists and states what is attributed to it (GeometryOfNumbersAndQuadraticArithmetic §4.3 defines `qPochhammer`, `jacobiProduct`, `kronecker_single_identity` and `appell_lerch_difference_identity` with `m(x,q,z)` as used in 5.6; MetaplecticAutomorphicForms §§2.4b, 2.5, 2.6, 4.7, 6.18, 6.20, 7.1, 7.2, 7.49 exist with the content cited; ClassicalArithmeticCompletion §§2.31, 4.20, 4.40, 4.60, 4.61 exist; ModularForms Layer 0 and 10B exist). The three supplier gaps (`classical-metaplectic-model`, `analytic-elliptic-regularity`, `vector-bundle-dolbeault`) are precise, minimal and declared in both files; the six self-owned gaps are R01–R06.

## Verified sound

- Principles: no route-specific shortcut, no re-planned roadmap (ClassicalArithmeticCompletion, GeometryOfNumbersAndQuadraticArithmetic, MetaplecticAutomorphicForms, ThetaSeries, ModularForms objects are imported, not restated), no copied passages, no computational algorithm, no sorry'd data or `set_option` (no Lean file at this stage).
- Seeded sample, 15 targets, all verified at their locators: 1.1 (Gasper1995 lines 81, 477), 1.2 (line 437), 1.6 (lines 127, 328), 2.5 (lines 478–508, hypotheses |b/a|<|z|<1, a≠0 as stated), 2.6 (Andrews1986 lines 93–95), 4.1 (AndrewsGarvan1988 lines 10, 80–83), 4.3 (lines 87–88, Theorem 1 for n>1; Zagier2009 lines 914–922), 5.5 (Zwegers2002 lines 506–518, 521–531, 640–682), 6.3 (lines 735–751; Zagier2009 lines 327–339), 8.1 (BruinierFunke2003 lines 366–374, 461–470), 8.5 (lines 384–515 and 190), 9.1 (Zwegers2002 lines 2673–2696), 9.2 (lines 2660–2668, 3101–3131), 9.4 (lines 2750–2774, 2880–2915), 11.2 (Zagier2009 lines 929–951; BringmannOno2006 lines 270–327).
- Additional locators read and found correct: Zwegers2002 Propositions 1.3–1.4 (lines 336–381), Theorem 1.16 (835–849), Definition 2.1 and Lemmas 2.5–2.6 (1276–1410), Corollary 2.9 (2308–2317), Definition 3.8 (3082–3099), Definition 4.1 and Proposition 4.2 (3531–3554), Proposition 4.3 (3624–3646), §§4.3–4.4 identities and vectors (3697–3804, 4085–4120, 4329–4450, 4770–4883, 5029–5052); Gasper1995 (1.3.3)–(1.3.4), (1.3.6)–(1.3.11), (2.2.10), (3.1.6), Rogers–Ramanujan (lines 267–285, 294–323, 606–608, 717, 1672–1680); Pak2002 §2.2.1 and §7.1.1 (lines 442–452, 3703–3712); Atkin1967 Theorem 2, (29)–(33), Lemma 10 (lines 28, 57–59, 375–410); Watson1938 lines 76, 108, 123–126; BevilacquaChandranChoi2019 lines 36–44; BruinierFunke2003 Theorem 3.7 and Corollary 3.8 (lines 626–699).
- Mathlib at `6b7abb3c`: all 20 cited declarations found in the cited files (`Nat.Partition.genFun`, `coeff_genFun`, `hasProd_genFun` under `[T2Space R]` as the README says, `hasProd_powerSeriesMk_card_restricted`, `card_restricted_eq_card_countRestricted`, `card_odds_eq_card_distincts`, `ofSums`, `PowerSeries.isUnit_iff_constantCoeff`, `invOfUnit`, `mul_invOfUnit`, `pentagonalSeries`, `WithPiTopology.hasProd_one_sub_X_pow`, `jacobiTheta₂` with term exponent 2πinz+πin²τ, `hasSum_jacobiTheta₂_term`, `jacobiTheta₂_functional_equation`, `hasDerivAt_jacobiTheta₂_fst`, `ModularForm.eta`, `eta_ne_zero`, `multipliableLocallyUniformlyOn_one_sub_pow`, `multipliable_one_add_of_summable`, `tprod_one_add_ne_zero_of_summable`). Tau Ceti at `a91d3aaf`: `conjugate`, `conjugate_parts`, `conjugate_conjugate`, `conjugate_parts_sort`, `CuspFormClass.eichlerIntegral_slash_apply` found.
- Duplication audit by object: no q-Pochhammer, q-binomial, rank, crank, Bailey pair, basic hypergeometric series, Appell–Lerch, Mordell integral, mock/harmonic Maass, eta multiplier or incomplete-gamma kernel object exists in Mathlib or Tau Ceti at the pins; the analytic q-product, triple product and Appell–Lerch identities are imported from GeometryOfNumbersAndQuadraticArithmetic §4.3 and the formal ones from ClassicalArithmeticCompletion, as required.
- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, 11 layers with Examples and Dependencies, Downstream consumers, References. 65 targets, 190 Checks; every definition has at least three discriminating Checks (counted per target); every theorem carries hypotheses and a locator; every `*Needs:*` line names existing sections or declared gaps. Gap slugs agree between `plan.json` and the README (9 of 9).
- Conventions with witnesses: the index-zero factor (P₂), the crank at size one, the two central theta terms, ν_eta at T, S and −I, the hyperbolic-plane kernel 2, ξ_k(y^(1−k))=1−k, and the factor i between Zagier's and Zwegers' normalizations were each recomputed and found correct.

## Not verifiable

- Andrews1986 displays (2.4)–(2.6): the extraction has blank lines 99–102 (equation images); the transforms written in 2.7 are the standard ones and pass the q=0 check, but were not read from the text.
- Hickerson1988 pp. 665–666 (uncertified, paywalled): the seventh-order identities were checked against Zwegers2002 lines 3697–3720 instead.
- AtkinSwinnertonDyer1954 (uncertified): cited only inside the gap `rank-crank-dissections`; not read.
- Andrews1976, GasperRahman2004, BFOR2017 (uncertified or waived): no statement relies on them.
- Zwegers2002 equation (1.4) at line 526: the OCR loses the overlines, so whether the thesis writes ϑ(u;−τ̄) or conj ϑ(u;τ) cannot be read; the README's form was confirmed numerically instead.
- Suggested.lean: none exists at the design stage, so no elaboration was run.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3a13ee464b941e7ccaf9b3c48af08c63c08fc65f", "job": "REV-DESIGN-QSeriesPartitionsAndMockModularForms", "model": "fable", "worker": "chris-g"} -->
