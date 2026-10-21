<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/540#issuecomment-6315822736 -->
Review (claude) of b92e3cd

Verdict: accepted
Conditional on the announced gaps: `classical-metaplectic-model`, `analytic-elliptic-regularity`, `vector-bundle-dolbeault`

1. **F01** (P3) Board path in the References paragraph

   Location: `packages/QSeriesPartitionsAndMockModularForms/design/README.md` line 1331, "Locators below use the versions in `packages/QSeriesPartitionsAndMockModularForms/sources.toml`; source text is not included."

   Claim: the References paragraph points readers to the board's package manifest.

   Witness: the README is destined for `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md` on the content repository, where no `packages/` folder exists; the house style asks for timeless prose without process references.

   Exact repair: replace the sentence by "Locators name the editions and versions listed in the roadmap's sources manifest; source text is not included." (or simply drop the path).

Acceptance is conditional on the three declared supplier gaps `classical-metaplectic-model` (MetaplecticAutomorphicForms §§2.4b–2.6), `analytic-elliptic-regularity` (PDE Lane E) and `vector-bundle-dolbeault` (ModularForms Layer 10B). Each is precise, minimal against what the suppliers state today, and declared under the same slug in `packages/QSeriesPartitionsAndMockModularForms/design/plan.json` and in the README.

## Previous findings, checked first

The round-2 review (`packages/QSeriesPartitionsAndMockModularForms/reports/REV-DESIGN-QSeriesPartitionsAndMockModularForms~2.md`, read from the board history) raised two findings; the repair report is `packages/QSeriesPartitionsAndMockModularForms/reports/FIX-DESIGN-QSeriesPartitionsAndMockModularForms~3.md`. Neither was marked not actionable.

| Finding | Status | Repaired passage and independent check |
| --- | --- | --- |
| F01 (P1), eleven-dissection residue-five term printed A₈ | Repaired | README line 488: "−(c₂+c₄)(A₃B₂−XA₉B₇)", with the note "The residue-five term corrects A₈ in the printed (6.8) to A₉". I recomputed V(ζ₁₁;q) exactly in ℤ[ζ]/Φ₁₁ through degree 132 from the product ∏(1−qᵈ)/((1−ζqᵈ)(1−ζ⁻¹qᵈ)) and compared every one of the eleven residue components with the README's theta-product tuple divided by E(X): all agree. With A₈ in residue five the comparison fails first at degree 49, as the finding said. The five- and seven-dissections were checked the same way through degree 132 and agree. The added general derivation (K E(q¹¹)V = N via theta addition at a=ζ⁹, b=ζ⁵) is consistent: the eight positive tails P(ζ^{±9}q),P(ζ^{±5}q),P(ζ^{±3}q),P(ζ^{±4}q) cover the exponents 2,…,9, and the two missing ones give E(q¹¹)V(ζ;q)/E(q)·E(q)². The theta-addition law itself was checked numerically at two parameter sets (difference below 1e-14). The new Check `dissectionCrankFortyNine` is correct: all eleven ordinary crank counts at size 49 equal 15775. |
| F02 (P3), large-base radius Check terminated | Repaired | README line 254: "q=2,a=−1/2,r=1,s=0 is nonterminating: for cₙ=Pₙ(a;2)/Pₙ(2;2), \|cₙ₊₁/cₙ\|→1/4, giving radius 4"; a separate `largeBaseTermination` keeps a=1/2 as the polynomial 1−z/2. Exact coefficients for a=−1/2: 1, −3/2, 1, −3/7, 1/7, −9/217, with ratios tending to −1/4; for a=1/2 the coefficients are 1, −1/2, 0, 0. The Layer 2 Examples paragraph was updated consistently. |

## Verified sound

### Principles

No route-specific shortcut: finite products are over arbitrary commutative rings, formal products over native power series, bilateral series carry their actual two-tail domains, cone data include isotropic boundaries, Maass spaces allow every half-integral weight and all cusps, Jacobi decomposition allows every pole order. No existing roadmap is re-planned: ClassicalArithmeticCompletion §§2.31, 4.20, 4.40, 4.60, 4.61, GeometryOfNumbersAndQuadraticArithmetic §4.3, ThetaSeries Layers 1–3, MetaplecticAutomorphicForms §§2.4b–2.6, 4.7, 6.18, 6.20, 7.1, 7.2, 7.49, ModularForms Layers 0 and 10B, ContourIntegration Layers 2–3, PDE Lane E and IntegralLattices §§0G, 1G–1H are imported by section and were read at those sections (main branch, or the open heads `roadmap/geometry-of-numbers-and-quadratic-arithmetic` and `roadmap/metaplectic-automorphic-forms` for the two roadmaps not yet on main). Single supply direction: the gate output is below; MetaplecticAutomorphicForms names this roadmap only as a consumer of its Layer 7 (consistent). Statements are in the author's words with locators; no copied passages. No algorithms: the eta-decimation modules and dissections are stated as identities with finite worked Checks. No Suggested.lean exists at the design stage (no `set_option`, no sorry'd data to check). No LaTeX delimiters, no `lemma` as a keyword (only the title "bailey lemma"), no process words, job ids, pull-request numbers or machine paths in the README or plan (grep).

### Seeded source sample

All fifteen targets were read at their locators in the cached texts. Pages are printed pages of the cited edition.

| Target | Text inspected | Result |
| --- | --- | --- |
| 1.5 q pochhammer calculus | Gasper1995 line 313 (1.3.10), line 329 (Exercise 1.1(ii)) | Inversion identity (a;q)ₙ=(a⁻¹;q⁻¹)ₙ(−a)ⁿq^{n(n−1)/2} and concatenation agree; unit hypotheses on a,q are the ones needed. |
| 2.2 basic hypergeometric psi | Gasper1995 lines 805–854 ((3.1.11)–(3.1.13)) | Sign and q-power (−1)^{(s−r)n}q^{(s−r)n(n−1)/2} agree; q≠0 and z≠0 are the source's conditions; the shift law was rederived by reindexing j=k+j′ (q^{hkj′} absorbed into zq^{hk}). The j=−1 coefficient (q−b)/((q−a)z) is correct. |
| 2.3 basic hypergeometric convergence | Gasper1995 lines 775–784, 846–854; lines 313–323 | Small-base domains agree. Gasper's \|q\|>1 radius omits the factor \|q\| that (1.3.11) carries; the README's term-by-term base inversion (checked by hand: the q-powers cancel exactly, giving (z∏A/(q∏B))ⁿ) and its degree d=s−r+r₀−s₀ are right. The q=0 values and both bilateral tail ratios were rederived. |
| 3.3 rogers ramanujan | Gasper1995 line 1672 ((4.2.11)–(4.2.12)); Pak2002 lines 3703–3755 | (q²,q³,q⁵;q⁵)/(q;q)=1/(q,q⁴;q⁵) agrees with the README's product; counting interpretations as in Pak §7.1.1. Exact coefficients 1,1,1,1,2 and 1,0,1,1,1 and the product identities hold through degree 40. |
| 4.2 weighted vector partition | AndrewsGarvan1988 lines 24–64 ((1.4)–(1.11)) | Distinct first component, weight (−1)^{#π₁}, statistic #π₂−#π₃ and the product (1.11) agree; V₁=z+z⁻¹−1 recomputed by enumeration; V equals the ordinary crank series at sizes 2,3,4 and differs at size 1 exactly by (1−z)X. |
| 4.4 partition residue counts | Zagier2009 lines 898–925 | N(r,t;n) and R(w;q) as stated; the character filter is the finite geometric sum. Residue classes at sizes 4,5,6 enumerated. |
| 5.2 eta multiplier | Zwegers2002 lines 734–746 (Theorem 1.11(2)) | v(γ)=η(γτ)/((cτ+d)^{1/2}η(τ)) agrees; ν(S)=exp(−πi/4), ν(T)=exp(πi/12), ν(−I)=−i and the τ=i factor 1 recomputed. The lower-unipotent values in `rankLevelLowerUnipotent` agree with Rademacher's formula ν([[1,0],[c,1]])=exp(−πic/12). |
| 5.4 mordell integral | Zwegers2002 lines 217–320 (Definition 1.1, Proposition 1.2) | Both difference equations, uniqueness, evenness and the S-law agree; h(1/2;i)=1 and h(0;i)>0 confirmed by numerical quadrature (1.0000, 0.669). |
| 5.6 zwegers mu | Zwegers2002 lines 362–483 (Propositions 1.4–1.5) | Definition, unit shifts, the τ-shift with −i exp(−πi(u−v)−πiτ/4), symmetry, residue −1/(2πiϑ(v)) and the Mordell defect h/(2i) agree. The Appell–Lerch comparison μ=−i exp(−πiτ/4+πi(u−v))m(X,q,Z) was rederived from GeometryOfNumbersAndQuadraticArithmetic §4.3's m(x,q,z) and j(z;q). |
| 6.2 zwegers period formulas | Zwegers2002 lines 835–1027 (Theorem 1.16, Lemmas 1.18–1.19) | Open intervals, characteristic shift by 1/2 and both right-hand sides agree; the derived `unaryCorrection_period` C(a,b)=−i∫g(a,−b) follows from the displayed computation and matches Proposition 4.2(2) at line 3545. |
| 8.3 harmonic weak maass space | BruinierFunke2003 lines 366–383, 487–501 | C², all-cusp exponential growth, Δ_k and the H⁺ definition agree; the source's "automatically real analytic" is correctly turned into the analytic-regularity gap. |
| 8.5 harmonic maass fourier and xi | BruinierFunke2003 lines 190, 384–442, 450–484, 503–515 | ODE, H(w), asymptotics, finiteness of forbidden tails, kernel of ξ and the coefficient bounds agree. Lemma 3.1 as printed carries a factor −2v^{2−k} that direct differentiation of H(2πnv)e(nu) does not produce; the README's values (1−k)conj(a⁻(h,0)) and −conj(a⁻(h,n))conj((−4πn)^{1−k}) follow from its own operator ξ_k=2iy^k conj(∂τ̄) and are correct. The ambient-dimension assumption at line 190 is handled by hyperbolic stabilization. |
| 10.6 fifth order transform | Zwegers2002 lines 4415–4456, 4857–4883, 5029–5052 | T₅ entries and the six rows of M₅ agree entry by entry; ((2/√5)M₅)²=I checked (a²+b²=5/4); G₅,₂=−G₅,₁ at line 5049. |
| 10.8 seventh order transform | Zwegers2002 lines 3781–3808, 4018–4077 | T and the sine matrix agree; M₇²=I checked numerically; Corollary 4.6 gives the period defect with i√21 as the README's `seventhOrder_periodDefect`. G₇ (lines 3771–3778) matches §10.7 entry by entry. |
| 11.3 rank residue mock modularity | Zagier2009 lines 952–965 | The corollary's holomorphic part and shadow support agree; the level statement is the existential one proved in 11.2. |

Additional locators read: Zwegers2002 lines 336–360 (Proposition 1.3, for 5.1), 818–834 (Definition 1.14, Proposition 1.15, for 6.1), 1275–1347 (Definition 2.1, for 7.1–7.2), 2308–2317 (Corollary 2.9, for 7.4), 2673–2696 ((3.1)–(3.4), for 9.1 and 9.5), 2750–2762 (Definition 3.2), 3101–3136 (Theorem 3.9, for 9.5), 3531–3554 (Definition 4.1, Proposition 4.2), 3603–3640 (Proposition 4.3, for 7.5), 3694–3778 (seventh-order data), 4329–4414 and 4770–4856 (fifth-order vectors); BringmannOno2006 lines 270–337 (for 10.1–10.2); Zagier2009 lines 125–149 (third-order definitions: φ and ψ are defined there with q replaced by −q, exactly as in 10.1) and 929–951 (Theorem 7.1); BruinierFunke2003 lines 622–699 (Theorem 3.7, Corollary 3.8, for 8.6); AndrewsGarvan1988 lines 80–88 (crank definition).

### Exact and numerical controls

| Statement | Control | Result |
| --- | --- | --- |
| 4.4a dissections (ℓ=5,7,11) | Exact in ℤ[ζ]/Φ_ℓ through degree 132 | All components agree; A₈ variant fails at degree 49. |
| 4.4a theta addition, 3.4 theta addition, 3.4 quintuple product | Numerical at two parameter sets each | Agree to 1e-14. |
| 3.1–3.3 | Gaussian product identity n≤8; Schur finite identities n≤12; Rogers–Ramanujan through degree 40 | All hold; G(2,1)=1+Q, G(3,1)(1)=3, G(2,1)(−1)=0. |
| 4.1, 4.3, 4.5 | Enumeration of partitions to size 6 | rank/crank of (1), (3,2,1,1), (3,3) as stated; classes mod 5,7,11 at sizes 4,5,6 all of size 1 for crank; rank 1 occurs twice at size 6 mod 11; C=V+(1−z)X at sizes 0–4. |
| 4.6, 4.8, 4.9 | δ values; p(n) to n=300 | δ(5,1)=4, δ(7,1)=5, δ(11,1)=6, δ(5,2)=24, δ(7,3)=243; p(6)=11; p(243)≡245 mod 343; 5\|p(5n+4), 7\|p(7n+5), 11\|p(11n+6), 25\|p(25n+24), 49\|p(49n+47), 121\|p(121n+116) on the computed range. The parity pattern L_r=X·P̂₊(1;X^ℓ)·F or X·P̂₊(1;X)·F was rederived for ℓ=5, r=1,2,3. |
| 10.1 | Exact through degree 40 | f=1+q−2q²+3q³−3q⁴, ω=1+2q+3q²+4q³; 2φ−f=f+4ψ=Σ(−q)^{n²}/P(−q;q); R(−1;q)=f. |
| 10.3, 10.3a | Exact through degree 41 | Both χ relations; all five fifth-order families (including 1+2ψ₀ and the factor q in φ₁) and all three seventh-order cone sums hold; constants as in the Checks. |
| 2.3, 2.4, 2.6, 2.7 | Exact rationals | Large-base coefficients above; Euler coefficients 1,2,8/3 at q=1/2; the finite Bailey transform preserves the pair relation for n≤5 on rational data. |
| 11.1, 11.2 | Numerical at three (α,τ) | Bilateral identity to 1e-16; the README's corrected expression −η(3τ)³/(η(τ)ϑ_Z(3α;3τ))+q^{−1/6}[ξ⁻¹μ̂_Z(3α,−τ)−ξμ̂_Z(3α,τ)] holds to 1e-15 (holomorphic parts); Zagier's printed display at line 947 fails (differences 1.8, 2.8, 1e-4), so the manifest's version note is justified. ϑ(τ;3τ)=−iq^{−1/6}η(τ) confirmed. |
| 11.2 shadow at α=1/2 | Hand computation | D/(2√6)Σχ₁₂(n)n e^{πin/2}q^{n²/24} equals √(2/3)Σ_{n≡1 (6)}nq^{n²/24}, which is 2√6 g(1/6,0;3τ), the shadow of −2C(1/6,0;3τ) from 10.2. |

### Adversarial mathematics table

Instances were tried on every target; rows marked "no defect" record the degenerate cases, context and conventions examined.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions | q=0,1; zero ring; τ=i; S,T,−I; ν=±1/2; ⟨2⟩ | All witnesses recomputed (ν_η(S)=e^{−πi/4}, ν_η(−I)=−i, ϑ pair, crank −1 at size 1, kernel 2, T=i and Z=−i for ⟨2⟩). | None |
| 1.1–1.6 | n=0,1,2; a=0; a=q⁻¹; index −1 with a=3,q=2 and a=q=2; 𝔽₂ | P₂ expansion, P₋₁=−2, forbidden factor, ratio continuation −1 and 0, formal P̂(1;X)=0 with unit tail, zero locus of the analytic product. | None |
| 2.1–2.7 | Empty lists; terminating numerator; B=[1]; z=0 bilateral; a=b in 1ψ1; ρ₁=aq; a=0 limits | Normalisation sign c₁=−1/(1−q); domains guarded; base inversion rederived; both Bailey limits rederived from the finite transform. | None |
| 3.1–3.5 | k<0; Q=−1; n=0 Schur; z=1 quintuple; p(0) | Polynomial survives 0/0; signed floor indices out of range stay zero; 2−2q−2q²; Π·pentagonal=1. | None |
| 4.1–4.9 | Sizes 0–6; t=1; ℓ=2,3 offsets; r=1,2,3 at 7 | All counts, symmetries, offsets and exponents as stated; no stronger 7-power is claimed. | None |
| 5.1–5.7 | u=0 pair; unit shifts; y=0; S at τ=i; opposite lift | Oddness, evenness of R, pole guards, cancellation h/(2i)+(i/2)h=0, Zagier normalisation factor i. | None |
| 6.1–6.3 | a=b=0; a=1/2; d>0 scaling; β↦β+1; (0,0) characteristic | ξ_{1/2}C=−√2g and −√(2d) rederived; stabilizer phase C_g rederived from the modular and joint elliptic laws; boundary term kept. | None |
| 7.1–7.5 | Hyperbolic plane; rank one A=[−2]; diag(1,−1); c=2 nonprimitive; dependent rays | Boundary admissibility, Q⁺≡0 for two boundary vectors, S-prefactor τ, half-diagonal shift, −C(1/4,0;2τ), index-two cosets. | None |
| 8.1–8.7 | k=0,1; y, iy, y², log y; conj(q⁻¹); rank-zero lattice; Γ₀(2) cusp; M=2, i, unipotent | Δ_k(yˢ)=−s(s+k−1)yˢ; ξ₀(iy)=−i; ξ₀(conj q⁻¹)=4πq⁻¹; central parity; H_k(2πβy) versus K_{k,β} and the β=0, k≠1 relation rederived; Eichler lower-endpoint derivative (i/2)y^{−k}conj(g). | None |
| 9.1–9.5 | m=0; l=0,1; double pole; k=1; one theta component | Component formula n=l+2mj rederived; residue −1/(2πi); R_{m,0}(0)=1 and R_{m,m}(0)=0 by pairing; (3.3)–(3.4) match. | None |
| 10.1–10.8 | q=0; degrees ≤41; leading exponents; squares of S-matrices | All identities and matrices checked; −2C correction and 2√6 shadow; −√60 and −√42 scales. | None |
| 11.1–11.3 | z=−1; z→1; α=1/2, 1/3; ξ=1; t=1,2; lower unipotent | Removable values, witness at ξ=−1, trivial root excluded, lower-unipotent eta values, conjugated filter. | None |

### Duplication audit (objects at the pins)

Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`: `Nat.Partition.genFun`, `coeff_genFun`, `hasProd_genFun` (`Mathlib/Combinatorics/Enumerative/Partition/GenFun.lean`), the Glaisher file's `hasProd_powerSeriesMk_card_restricted`, `card_restricted_eq_card_countRestricted`, `card_odds_eq_card_distincts`, `PowerSeries.pentagonalSeries` and `WithPiTopology.hasProd_one_sub_X_pow` (no `T2Space` needed, as the README says), `jacobiTheta₂_term` with exponent 2πinz+πin²τ, `hasSum_jacobiTheta₂_term` (Im τ>0), `jacobiTheta₂_functional_equation`, `hasDerivAt_jacobiTheta₂_fst`, `ModularForm.eta`, `eta_ne_zero`, `multipliableLocallyUniformlyOn_one_sub_pow` were read; the eta file has no transformation law, so 5.2 is not a duplicate. No finite q-Pochhammer, Gaussian polynomial, basic hypergeometric series, rank, crank, Mordell integral, Zwegers μ, indefinite theta or harmonic Maass object exists at the pin. Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`: `TauCeti.conjugate`, `conjugate_parts`, `conjugate_conjugate`, `conjugate_parts_sort` and `CuspFormClass.eichlerIntegral_slash_apply` (weight k=n+2, arithmetic level, strict periods) read; both are consumed, not restated. Roadmaps: ClassicalArithmeticCompletion owns the formal triple product and specialisations (cited, not restated); GeometryOfNumbersAndQuadraticArithmetic §4.3 owns the analytic `qPochhammer`, `jacobiProduct`, Kronecker and Appell–Lerch identities (cited); ThetaSeries owns Poisson summation with the `e(+⟨v,m⟩)` convention (cited); MetaplecticAutomorphicForms owns the cover, `finiteWeil_T`/`finiteWeil_conjugate`, Jacobi decomposition, theta multiplier, the weight-1/2 square-integrable space and the unitary comparison with the 3/16 constant (cited, and consistent with 8.2's (k/2)(1−k/2)). No object is planned twice.

### Supplier-order audit

All 69 `*Needs:*` lines resolve to earlier targets (plan check: no internal order problem), to Mathlib or Tau Ceti declarations read above, to supplier sections that exist at the cited places, or to the three declared gaps. Dependency check output:

```text
candidate: QSeriesPartitionsAndMockModularForms is not in the merge order yet; checked as if placed after MetaplecticAutomorphicForms (the intake inserts it when its design is accepted)
depcheck: 6 roadmaps, 40 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The downstream names (HabiroNahmSeries, HabiroRings, HabiroCohomologyFoundations, CountingBundlesAndHallAlgebrasOfCurves) appear only as consumers.

### Shape and completeness

69 targets (33 definitions, 6 constructions, 30 theorems), 249 API entries, 208 Checks; every name in the plan occurs in the README; every definition and construction has at least three Checks; every target has a locator; each of the 11 layers ends with Examples and Dependencies; the README has the required sections in order. README and plan agree on the gaps (slugs, suppliers, sections, `needs`, `neededBy` = the `*Needs:*` lines of 5.2, 6.1, 6.3, 8.1, 8.3, 8.6). Lean elaboration: not available at the design stage (no `Suggested.lean` exists; the brief authorises no Lean command here), so none was run.

## Not verifiable

- Hickerson1988 (seventh-order Hecke identities), AtkinSwinnertonDyer1954 (complete rank dissections) and Andrews1976: recorded `uncertified` in the manifest and cited by locator only; the seventh-order identities were instead checked exactly against the unilateral definitions through degree 41, and the rank dissections remain targets of §4.4a. GasperRahman2004 and BFOR2017 are `waived` bibliographic background. None was listed in `needs-references.toml`.
- §4.8a: the Watson/Atkin integral-module spans (valuation arrays θ, ξ, ε and the exceptional seven-steps) were not recomputed from the modular equations; only their consequences (p(243)≡245 mod 343, 49∣p(49n+47), Ω₅(B⁻¹)=5b₅ and Ω₇(B⁻¹)=7b₃+49b₇ as Ramanujan's identities) were checked.
- Zwegers Lemmas 4.8 and 4.11 (cone models in §10.4) and the full matrix of §6.3 beyond the stabilizer factor were read against the thesis but not recomputed.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b92e3cd28ca0f278f37473ce8283dfd812ab0104", "job": "REV-DESIGN-QSeriesPartitionsAndMockModularForms~3", "model": "fable", "worker": "chris-f"} -->
