# Review of QSeriesPartitionsAndMockModularForms (pull request #1391 at b0f44a8)

**Verdict:** accepted

No findings. This is an incremental re-review of the 11 lines changed since e68263d (the head the previous review read): the scope paragraph at `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md:13`, the AutomorphicSpectralTheory contract at line 109, the level-11 basis paragraph of §4.8a at line 737 with its new public law (line 747) and two new Checks (lines 762–763), and the §8.2 opening sentence at line 1180. `Suggested.lean` is unchanged since e68263d. Nothing changed outside the folder.

## Previous findings

- R01 — repaired: §4.8a now defines S^∞ and S⁰, states Atkin's B₁₁ with its existence, Fricke invariance, poles and normalization, states the full expansion of S in the G_n, B₁₁, a constant and the g_n (Lemma 4) and the S^∞ expansion in the g_n alone (Lemma 5), and says only the S^∞ theorem is applied to X₁₁ and Y₁₁. The retest instance F=1 is now the Check “eleven full expansion” with the computed coordinates. No new problem introduced (the two new statements are checked below).
- R02 — repaired: the invented name `weight_laplacian_power` is gone from lines 13 and 109; the contract now cites the weight-k Laplacian and “the Powers bullet of §1.16” in prose and keeps `weight_laplacian_slash`, which is the API bullet name at AutomorphicSpectralTheory §1.16 (open head, README line 1291). §8.2 (line 1180) now says “the weight-k Laplacian Δ_k of AutomorphicSpectralTheory §1.16” instead of a backticked name.

## Verified sound

**Gate.** Run on this head: `gate QSeriesPartitionsAndMockModularForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's gate record for this head additionally reports `build=0`.

**Dependency check.** `depcheck: 204 roadmaps, 1392 edges, 0 problem(s)`, exit 0: no UPWARD, CYCLE or moved line. The roadmap is at line 231 of the merge order. The changed passages add no `*Needs:*` item and no new supplier; the §4.8a `*Needs:*` line (751) and the §8.2 one (1194) are unchanged and cite ClassicalArithmeticCompletion, GeometryOfNumbersAndQuadraticArithmetic, ModularForms Layers 2, 6, 10A, 10B, AutomorphicSpectralTheory §1.16 and MetaplecticAutomorphicForms §7.49, all earlier in the order or on main.

**Elaboration.** `lake env lean` on a scratch copy of `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/Suggested.lean` (274 lines, imports `Mathlib` and `TauCeti.Analysis.SpecialFunctions.Erf`, whose object file exists at the pin) with `#check @name` appended for all 27 declarations (12 definitions, 15 theorems): exit 0, exactly 15 `declaration uses sorry` warnings, no other diagnostic, 27 signatures printed. The signatures agree with those recorded in the previous review; the file is byte-identical to the one reviewed at e68263d, so the headline coverage and one-tactic padding probes of that review stand (15 sorried headlines, none closing in one tactic, no statable headline absent). Pins: Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf` from `lake-manifest.json`.

**Sources at the changed locators.** Atkin1967 (cache text, pdftotext, 19 pages): lines 45–50 define S (Γ₀(11)-invariant, regular on ℍ, at most poles at the two cusps), S^∞ (zero at i∞) and S⁰ (zero at 0), as the README now states. Lemma 1 (line 54–56): F(−1/(11τ)) ∈ S and the exchange S^∞ ↔ S⁰. Lemma 2 (lines 83–88): U-stability, the identity 11UF(−1/(11τ)) − 11UF(11τ) = F(−1/(121τ)) − F(τ), and (4): F ∈ S^∞ ⇒ UF ∈ S^∞ (not for S⁰). Lemma 3 (lines 95–106): G_n ∈ S⁰, G_n(−1/(11τ)) = 11^θ(n) g_n with θ = 6k+(2,3,4,6,6), integral FS with leading x^(−n) and x^μ(n), μ = 5k+(1,2,3,5,4); B ∈ S with simple poles at both cusps, B(−1/(11τ)) = B(τ), integral FS with leading x^(−1). Lemma 4 (lines 112–116): the full expansion with Σ A_(−r)G_r + A_(−1)B + A₀ + Σ A_r g_r. Lemma 5 (lines 118–120): the S^∞ expansion in the g_r alone. Lemma 9 (line 351): F(−1/(11τ)) + 11UF is entire on the full modular group. Lemma 11 (line 416): the S^∞ statement with the φ twist. ξ and η=ε definitions at lines 235–239, X and Y at 239–246, Lemma 7 at 247, Lemma 13 at 454. Appendix A (lines 513–565): B = G₂g₂ − 12 at (48), Fricke invariance (49) from (47), G₅ = G₂G₃ − 11G₄ by the genus-one argument at lines 549–551, integrality via Fine's functions at 558–564. Table 1 (lines 578–588): B = x⁻¹(1, −5, 17, 46, …), g₂ = x(1, 5, 19, …), G₂ = x⁻²(1, 2, −12, 5, …), G₃ = x⁻³(1, −3, −5, …); Table 3 (594–598) gives the θ exponents 2, 3, 4, 6, 6. The README's principal parts for G₂, G₃, its θ, μ, ξ, ε and the leading terms all agree with these lines. The README's locator “Lemmas 1–5 at lines 54–120” and “definitions … at lines 45–50” are exact.

AutomorphicSpectralTheory at its open head (README lines 1281–1306, §1.16): the operator Δ_k = −y²(∂ₓ²+∂ᵧ²) + iky(∂ₓ+i∂ᵧ) for real k on C² functions, the API bullet `weight_laplacian_slash` (integral k, slash covariance) and the “Powers” bullet Δ_k yˢ = s(1−k−s)yˢ for complex s, y>0; its Checks include Δ_k 1 = 0, Δ₀y² = −2y² and the y^(k/2) conjugation shift −3/16 at k=1/2, which this README's §8.2 Checks repeat. Its `Suggested.lean` (117 lines) declares no Laplacian, so `weight_laplacian_slash` is a supplier API-bullet name, cited as such; the previous review's R02 concerned only the nonexistent `weight_laplacian_power`.

**Seeded sample.** None of the fifteen seeded targets (1.2, 2.1, 2.2, 4.1, 4.4, 4.4a, 4.5, 5.1, 7.3, 8.1, 8.6, 10.1, 10.1a, 10.7, 11.2) falls in the changed lines, so they were not re-read in this incremental round; the previous review's locator checks of the then-seeded targets stand unchanged. The README flags no locator as unverified.

**Ownership of the new statements.** `roadmaps grep` for Γ₀(11), X₀(11), Atkin1967 and “Fricke-invariant” over the open heads and main: hits in NeronModelsAndSemistableAbelianVarieties, ModularCurvesPartII, AlgebraicModularFormsAndSerreWeights and ModularSymbolsPadicLFunctions all concern X₀(11) as an elliptic curve, its Jacobian, Hecke algebra or modular symbols; none states the Atkin modular-function basis, the operator U₁₁ on S or the expansions of Lemmas 4–5. The board package AutomorphicCongruences (its README at head c88704a) concerns congruences of p-adic L-functions and has no level-11 function basis. This roadmap is the owner of these targets; the curve data it uses (genus, cusps, Riemann–Roch, U and Fricke conventions) are cited from ModularForms Layers 2, 6, 10A, 10B.

**Adversarial mathematics.** New rows for the changed statements first, with computed values; the rows for untouched statements are carried from the previous review (marked), with the row that failed there replaced.

| Statement / object | Instances tried | Computed sides or competing values | Result / change |
| --- | --- | --- | --- |
| 4.8a full expansion (Lemma 4), existence | F=1 (N=M=0) | left side 1; right side A₀=1, all other A_r=0; a competing “g_n only” expansion gives constant coefficient 0≠1; a “G_n only” expansion vanishes at cusp 0 whereas 1(0)=1 | Keep; this is the repaired R01 instance |
| 4.8a full expansion, uniqueness | orders at infinity of the generators | G_r: −r (r≥2); B₁₁: −1; 1: 0; g_r: μ(r)=1,2,3,5,4,6,7,8,10,9 for r=2…11, a bijection onto ℤ_{>0}; all orders distinct, so a vanishing combination has every coefficient 0 | Keep “uniquely” |
| 4.8a full expansion, forced coefficients | F∈S holomorphic at cusp 0 (M=0) with N=1 | B₁₁ has pole order 1 at cusp 0, so A_(−1)=0 and F is constant; agrees with “no single simple pole on genus one” | Keep; formula allows the zero coefficient |
| 4.8a S^∞ expansion (Lemma 5), degenerate | F∈S^∞ with M=0; M=1 | empty sum 0 on the right; on the left F has no pole (M=0) or one simple pole (M=1), so F is constant and vanishes at infinity: F=0 | Keep |
| 4.8a S^∞ versus S | F=1 | value at infinity 1≠0, so 1∉S^∞; the Check “eleven full expansion” states exactly this | Keep |
| 4.8a B₁₁ existence via G₂g₂ | orders at the two cusps | G₂: −2 at ∞, +1 at 0 (from g₂'s order μ(2)=1 under Fricke); g₂: +1 at ∞, −2 at 0; product: −1 at ∞, −1 at 0: simple poles at both; Fricke: (G₂g₂)(−1/(11τ)) = 11²g₂·11⁻²G₂ = G₂g₂ | Keep; Atkin (48)–(49), lines 534–536 |
| 4.8a B₁₁ uniqueness up to a constant | two such B, B′ with leading q⁻¹ | B−B′ is holomorphic at ∞ with at most a simple pole at cusp 0; on genus one a single simple pole is impossible, so B−B′ is constant; Riemann–Roch: ℓ(P_∞+P_0)=2−1+1=2 | Keep |
| 4.8a B₁₁ normalization | Atkin's B from Table 1 vs. G₂g₂−12 | constant coefficient of G₂g₂: 1·5+2·1=7, minus 12 gives −5 = Table 1 line 578; x¹ coefficient 19+10−12=17 = Table 1 | Keep; README's B₁₁ = Atkin's B + 5, its own declared normalization, harmless since A₀ absorbs constants and only Lemma 5 feeds X₁₁, Y₁₁ |
| 4.8a Check “eleven Fricke pole” | span of 1, G_n, g_n | pole order at ∞ of a combination is max over nonzero terms of {r≥2, 0, none}: 0 or ≥2; B₁₁ has 1 | Keep |
| 4.8a G_n, g_n memberships | n=2,3 from Table 1 | G₂=x⁻²(1,2,−12,…) ∈ S⁰ (Appendix A line 532), g₂=x(1,5,19,…) vanishes at ∞; g_n pole order at cusp 0 = order of G_n at ∞ = n | Keep |
| 4.8a θ, μ, ξ, ε tables | n=2…8 | θ=(2,3,4,6,6) = Table 3 exponents 2,3,4,6,6; μ=(1,2,3,5,4) = Table 1 leading powers of g₂…g₆ (x¹,x²,x³,x⁵,x⁴); ξ(4..8)=(1,3,3,4,5), ε=ξ+1 for n≥4 = lines 235–239 | Keep |
| Scope and §From AST: Powers law | k=0,s=2; k=1,s=1; k=0,s=1 | Δ_k yˢ = −s(s−1)yˢ − ks yˢ = s(1−k−s)yˢ: −2y², −y, 0 | Keep; sign matches §8.2/§8.3 Checks |
| §8.2 factorization with the supplied Δ_k | k=0 on y and y² | L₀y = −2iy²(i/2) = y²; R_(−2)y² = 2i(−i/2)(2y) − 2y = 0, so −R_(−2)L₀ y = 0 = Δ₀y; R₀y² = 2y, L₂(2y) = 2y², −L₂R₀y² − 0 = −2y² = Δ₀y² | Keep |
| §8.2 law Δ₁(log y)=0 | k=1 | −y²(−1/y²) + i·y·(i/y) = 1 − 1 = 0 | Keep |
| §8.2 unitary shift | k=1/2 | (k/2)(1−k/2) = (1/4)(3/4) = 3/16; AST's y^(k/2) conjugation constant k²/4−k/2 = −3/16 | Keep; opposite signs are the two directions of the same conjugation |
| 4.8a Fricke identity (unchanged text, re-run) | F=1 | 11·1 − 11·1 = 0 = 1 − 1; trace 1 + 11 = 12 = [SL₂(ℤ):Γ₀(11)] | Keep |
| Conventions: starting index, units, q=1 | n=0,2; arbitrary ring; q=1 | P₀=1; P₂=1−a−aq+a²q; at q=1 both sides=(1−a)²; zero ring 1=0 | Keep; analytic q=1 excluded (carried from r1) |
| 1.2 integer product | a=3,q=2,n=−1 | P₋₁=−2; P₁(3/2;2)=−1/2; product=1 | Keep (carried from r1) |
| 1.2 invalid negative domain | a=q=2,n=−1 | factor 1−a/q=0; inverse product cannot equal 1 over ℚ | Excluded by unit hypothesis (carried from r1) |
| 1.3 regular quotient | a=3,b=1,q=2,n=−1; then b=2 | quotient=(1−2)/(3−2)=−1; at b=2 quotient=0 although separate denominator P₋₁(b;q) is undefined | Keep regular quotient (carried from r1) |
| 1.4 full formal product | generic a through X²; a=1 | coefficients 1−a, −a(1−a), −a(1−a); at a=1 all zero | Keep index-zero factor (carried from r1) |
| 1.4 positive tail / scalar change | a=1; ℤ→𝔽₂ | tail=1−X−X²+O(X⁵); image=1+X+X²+O(X⁵); constant=1 | Keep; unit survives (carried from r1) |
| 1.5 inversion | a=3,q=2,n=2 and n=−1 | P₂=10; (−3)²·2·P₂(1/3;1/2)=10; negative formula gives −2 on both sides | Keep (carried from r1) |
| 1.6 prefix and tail | n=0,1; a=0; a=1 | P(a;q)=P₁(a;q)P(aq;q); a=0 gives 1=1·1; a=1 gives 0=0·P(q;q) | Keep nonzero-tail condition when dividing (carried from r1) |
| 2.1 unilateral normalization | no parameters, n=1; q=1/2 | coefficient −1/(1−q)=−2; deleting normalized sign gives +2 | Keep (carried from r1) |
| 2.1 numerator parameter | one a, n=1 | coefficient (1−a)/(1−q); at a=1 it is 0 | Keep termination (carried from r1) |
| 2.2 bilateral normalization | j=0,−1; a=3,b=1,q=2,z=1 | term₀=1; term₋₁=−1 on regular quotient; a=q produces zero denominator | Keep pole exclusions (carried from r1) |
| 2.3 radius and terminating exceptions | q=2,a=−1/2; a=1/2 | asymptotic coefficient ratio 1/4, radius 4; a=1/2 series terminates at 1−z/2 | Keep distinction (carried from r1) |
| 2.3 q=0 unilateral convention | nonterminating r=s+1; coefficient C after n=0 | sum=1+Cz/(1−z), not 1+Cz; positive normalization exponent gives 1+(−1)^e Cz | Keep 0⁰ convention (carried from r1) |
| 2.4 q-binomial headline | q=.2,a=.3,z=.7 | sum≈3.007306345365; product ratio≈3.007306345365 | Keep (carried from r1) |
| 2.4 large-base headline | q=2,a=0,z=3 | sum≈−.0522988955771; inverse-base product≈−.0522988955771; radius condition 0<1 | Keep a=0 case (carried from r1) |
| 2.4 Euler headlines | q=.2,z=.7; entire identity z=2 | inverse sum/product≈4.015699529238; entire sum/product≈4.627022595122 | Keep different z domains (carried from r1) |
| 2.4 Euler boundary / natural subtraction | q=0,n=0,1,2 | n(n−1)/2=0,0,1; entire series=1+z, matching product | Keep (carried from r1) |
| 2.5 Ramanujan 1ψ1 headline | a=.8,b=.1,q=.2,z=.7 | bilateral sum≈1.189220922478; four-product ratio≈1.189220922478 | Keep (carried from r1) |
| 2.5 regular b=0 | j=−1,a=3,q=2,z=1 | regular term=−2; factor b−q is −2, not a pole | Keep b=0 allowed (carried from r1) |
| 2.6 Bailey pair | α=δ₀; q=1/2,a=1,n=1 | β₁=1/((1−q)(1−aq))=4; β=δ₀ would give 0 | Keep relation ties sequences (carried from r1) |
| 2.6 false candidate pair | α=β=δ₁; q=1/2,a=1,n=1 | β₁=1; defining sum=1/((1−q)(1−q²))=8/3 | Excluded (carried from r1) |
| 2.7 Bailey-transform headline | a=q=0, ρ₁,ρ₂ units, α=δ₀ | βₙ=1; α′=δ₀; β′ₙ=1, including n=0 via t⁰=1 | Keep; genuine general transformation not a tautology (carried from r1) |
| 3.1 Gaussian signed/rectangle adapter | n=0,k=−1,0; n=4,k=2,Q=−1 | values 0,1; Gaussian value 2 whereas uncancelled field quotient is 0/0 | Keep polynomial identity (carried from r1) |
| 3.2 Schur polynomials | n=0,1,2 | initial pairs (1,1),(1,1); n=2 gives 1+Q and 1+Q²; recurrence agrees | Keep indexing (carried from r1) |
| 3.3 gap/residue definitions | empty; (1,1); (1,3) | empty satisfies both; (1,1) fails gap despite residue condition; (1,3) satisfies gap but not ±1 residues | Keep distinct predicates (carried from r1) |
| 3.3 first RR counting headline | n=0,…,8 | gap counts and residue counts both [1,1,1,1,2,2,3,3,4] | Keep (carried from r1) |
| 3.3 second RR counting headline | n=0,…,8 | counts on both sides [1,0,1,1,1,1,2,2,3] | Keep minimum-part condition (carried from r1) |
| 3.3 analytic RR headline | q=.2 | first sum/product≈1.252084005385; second≈1.050083338710 | Keep (carried from r1) |
| 3.4 quintuple headline | q=.2,z=.7 | bilateral sum≈1.099066055466; product≈1.099066055466 | Keep (carried from r1) |
| 3.4 theta addition | constant coefficient, a=2,b=3 | both sides −10/3 | Keep signs (carried from r1) |
| 3.5 partition adapter | n=0,…,8 | native counts and Euler reciprocal coefficients both [1,1,2,3,5,7,11,15,22] | Keep native carrier (carried from r1) |
| 4.1 rank and crank | empty; (1); (3,2,1,1) | (rank,crank)=(0,0),(0,−1),(−1,−1); ≥ instead of > gives crank 0 in third case | Keep strict comparison (carried from r1) |
| 4.1 conjugation | (3,3)↔(2,2,2) | ranks 1 and −1; crank(3,3)=3 | Keep transpose sign (carried from r1) |
| 4.2 vector partitions / size-one correction | coefficient of q | product gives z+z⁻¹−1; adding (1−z) gives z⁻¹, ordinary crank of (1) | Keep (carried from r1) |
| 4.3 generating functions | n=0,1 | rank coefficients 1,1; crank coefficients 1,z⁻¹; forgetting correction gives z+z⁻¹−1 at n=1 | Keep (carried from r1) |
| 4.4 residue counts/filter | t=1; t=2,n=2 | t=1 count=p(n); at n=2 ranks ±1 give residue counts [0,2], same as Fourier filter | Keep; t=0 filter excluded (carried from r1) |
| 4.4a complete dissections | mod 5,size4; mod 7,size5 | rank residue vectors [1,1,1,1,1] and [1,1,1,1,1,1,1] | Keep; full source limitation below (carried from r1) |
| 4.4a modulus-11 rank distinction | size6 | rank counts [1,2,1,1,0,1,1,0,1,1,2], versus all-one crank vector | Keep; no false rank-11 equidistribution (carried from r1) |
| 4.5 rank equidistribution headline | n=0 in 5n+4,7n+5 | every residue count 1 on both progressions | Keep (carried from r1) |
| 4.5 crank equidistribution headline | (ℓ,d)=(5,4),(7,5),(11,6),n=0 | all residue counts 1 in each case | Keep (carried from r1) |
| 4.6 offsets | ℓʳ=1,5,25,7,49,343 | least inverses of 24 are 0,4,24,5,47,243; 24δ≡1 for each nontrivial modulus | Keep positivity/coprimality (carried from r1) |
| 4.7 extraction | U₂X; U₂X²; U₀1 | 0; X; ΣXⁿ respectively, versus Laurent zero-modulus junk 0 | Keep t>0 comparisons (carried from r1) |
| 4.7 residue-range comparison | t=2,a=2,input1 | power-series extraction 0; Laurent extraction X⁻¹ | Keep a<t (carried from r1) |
| 4.7 pullout | t=1,a=1,f=X,g=1 | E₁,₁(X)=1 but X·E₁,₁(1)=0 | Keep a<t hypothesis (carried from r1) |
| 4.8 eta decimation | ℓ=5,r=1,2; ℓ=11,r=1 | offsets 4,24; parity Euler factors P(X⁵),P(X); L₁ for 11 starts 11X | Keep (carried from r1) |
| 4.8a eta equations | first nonconstant terms | degree-five: X⁵−Y has 5t^(11/6), cancelled by 5Y²X; degree-seven: 7t^(11/4), cancelled by 7YX⁴ | Keep lower-degree term (carried from r1) |
| 4.8a seven-module base | Ω₇(B⁻¹)/7 | b₃+7b₇; O₇ requires b₇ coefficient divisible by 49 | Keep separate first step (carried from r1) |
| 4.8a S versus basis | F=1 at infinity | F constant coefficient 1; every finite gₙ combination coefficient 0 | Failed in r1 (R01); repaired statement re-tested in the new rows below |
| 4.8a Fricke trace | F=1 | 1+11U₁₁1=12; Fricke difference identity 0=0 | Keep factor 11 (carried from r1) |
| 4.8a genus / uniqueness | X₀(11), pole order ≤1 at infinity alone | g=1+12/12−2/2=1; function-space dimension 1 (constants), not 2 | Keep (carried from r1) |
| 4.9 prime-power headline | r=1,n=0; ℓ=7,r=3,n=0 | p4=5,p5=7,p6=11; p243=133978259344888≡245 mod343, hence divisible by49 but not343 | Keep exponent floor(r/2)+1 (carried from r1) |
| 5.1 odd theta | z=0 and z=1/4,τ=i | θ(0)=0; θ(1/4)≈−.643589764039; first pair i q^(1/8)(e^(πiz)−e^(−πiz)) | Keep sign; derivative −2πη³ (carried from r1) |
| 5.2 eta multiplier | S at i; T; −I | ν(S)=e^(−πi/4), √i=e^(πi/4), product1; ν(T)=e^(πi/12); (−i)i=1 | Keep root normalization (carried from r1) |
| 5.3 E and β | x=0,t=0; derivative x=0 | E(0)=0,β(0)=1,E′(0)=2; missing √π scaling gives 2/√π | Keep (carried from r1) |
| 5.3 Wirtinger / xi | τ,y and i·y at k=0 | bar∂τ=0; bar∂y=i/2; ξ₀y=1; ξ₀(iy)=−i | Keep antilinearity (carried from r1) |
| 5.4 Mordell | τ=i,z=1/2 | h≈1; exact symmetry/shift expression gives1 | Keep (carried from r1) |
| 5.4 shift/S | τ=i,z=1/4 | shift sides≈11.708242116621; S sides≈.606847937009 | Keep (carried from r1) |
| 5.5 R correction | u=1/12,τ=i; u→u+1 | R≈.323196786374; translated value≈−.323196786374 | Keep antiperiodicity (carried from r1) |
| 5.6 μ | u=1/3,v=1/4,τ=i | μ≈−.894187284346i; μ+iR/2≈−.732588891159i | Keep nonzero correction (carried from r1) |
| 5.7 elliptic headline | same u,v,τ; u→u+τ | both sides≈−.015829018232+.027416663811i | Keep (carried from r1) |
| 5.7 modular headline | S; same u,v,τ | both sides≈.716779363149i; eta factor at i is i²=−1 | Keep (carried from r1) |
| 5.7 I,−I,T consistency | eta-quotient factor | I:1; −I:1; T:e^(−πi/4); branch-free quotient agrees with ν⁻³√w | Keep (carried from r1) |
| 6.1 unary corrections | a=b=0; a=1/6,b=0 | g₀,₀=C₀,₀=0 by pairing; g₁/₆,₀ begins (1/6)q^(1/72); ξC=−√2g | Keep sign (carried from r1) |
| 6.1 scaled correction | d>0,τ↦dτ | differentiating gives ξC(a,b;dτ)=−√(2d)g(a,b;dτ), not −√2g | Keep √d (carried from r1) |
| 6.2 period domain | a=1/2; endpoints with a integral | valid interior sign is fixed; at a=0 the zero summand has sign0 and cannot use a formula assuming 0<a<1 | Keep endpoint separation (carried from r1) |
| 6.3 torsion normalization | u=1/2,v=τ/2; β→β+1 | both points off lattice; characteristic phase changes by −1 in the half-character case | Keep rational phases (carried from r1) |
| 7.1 cone data | hyperbolic plane; c₁=(1,0),c₂=(0,−1),c₀=(1,−1) | Q(c₁)=Q(c₂)=0,Q(c₀)=−1; B(c₁,c₀)=B(c₂,c₀)=−1 | Keep common cone component (carried from r1) |
| 7.1 rank-one negative lattice | form [−2] | Q(x)=−x², isotropic vectors only0; no nonzero primitive isotropic boundary | Keep explicit boundary domain (carried from r1) |
| 7.2 ordered theta kernel | hyperbolic ν=(1/2,1/2), then (1/2,−1/2) | sign difference 1−(−1)=2, then −1−(−1)=0; c₁=c₂ gives0 | Keep ordering (carried from r1) |
| 7.3 convergence majorant | boundary c=(1,0),ν=c | Q(ν)=0; boundary modified quadratic form also0, so positive definiteness cannot be asserted there | Keep separate boundary analysis (carried from r1) |
| 7.4 transformation | hyperbolic A,detA=−1; odd diag(1,−1) | S prefactor τ; odd half-diagonal shift vector (1,1), rather than0 | Keep odd/even distinction (carried from r1) |
| 7.5 factorization | rank-one correction; double-length coset split | −C(1/4,0;2τ); second split −C(1/8,0;8τ)−C(5/8,0;8τ) | Keep scaling and both cosets (carried from r1) |
| 8.1 automorphy/growth | trivial representation, constant1 | weight0:1=1, but not cuspidal; odd integral full-group weight: −I would require1=−1 | Keep parity and cusp conditions (carried from r1) |
| 8.2 operators | y,y²,log y | L₀y=y²; Δ₀y=0; Δ₀y²=−2y²; Δ₁log y=0 | Keep; supplier locator R02 (carried from r1) |
| 8.2 unitary comparison | k=1/2 | holomorphic-to-unitary constant shift −3/16; corresponding eigenvalue 3/16 | Keep supplier sign (carried from r1) |
| 8.3 harmonic spaces | constant1; y² at k=0 | Δ₀1=0; Δ₀y²=−2y²≠0 | Keep actual PDE condition (carried from r1) |
| 8.4 scalar ODE kernel | k=0,w=±1 | H₀(w)=eʷ, values e and e⁻¹; partner e⁻ʷ has reversed values, nonzero Wronskian | Keep independent modes (carried from r1) |
| 8.4 constant modes | k=1,y=1,e | (1,log y)=(1,0),(1,1); incorrectly using (1,y⁰) gives (1,1) twice | Keep k=1 exception (carried from r1) |
| 8.4 gamma comparison | k=0,w=−1 | e·Γ(1,2)=e⁻¹=H₀(−1); shape1>0 | Keep k<1 for real integral (carried from r1) |
| 8.4a parabolic matrices | M=[[1,1],[0,1]],v=(τ,1) | v(τ+1)=(τ+1,1)=Mv(τ); scalar periodic coefficients alone miss τ | Keep Jordan modes (carried from r1) |
| 8.4a nonunitary frequency | M=2; M=i | shifts −i log2/(2π) and 1/4 respectively; e(shift)=2 and i | Keep complex frequencies (carried from r1) |
| 8.5 Weil normalization | rank-zero lattice; lattice ⟨2⟩,h=1/2 | rank zero at weight1/2: central law f=−f forces0; ⟨2⟩ gives Q(h)=1/4, T phase i and central phase −i | Keep conjugate Weil convention (carried from r1) |
| 8.5 Fourier/xi | k=0, conjugate(q⁻¹); zero mode a y^(1−k) | ξ₀ conjugate(q⁻¹)=4πq⁻¹; ξ_k(a y^(1−k))=(1−k)conjugate(a) | Keep polar shadows in full space (carried from r1) |
| 8.6 surjectivity proof normalization | k=0,g=1 | bar∂y=i/2 gives ξ₀y=1; bar∂(2y)=i gives ξ₀(2y)=2 | Keep roadmap's half factor; source issue below (carried from r1) |
| 8.6 divisor hypotheses | two elliptic components,D supported on one | H¹ on untouched component has dimension1, not0 for any n | Keep positive degree on every component (carried from r1) |
| 8.7 mock object/completion | zero correction; k=0 zero-mode conventions | shadow0 for zero correction; y and y−1 differ by holomorphic constant1; ξ₀ of both=1 | Keep specified normalization (carried from r1) |
| 8.7 conjugate scalar | F→iF | ξ(iF)=−iξ(F), not iξ(F) | Keep shadow's antilinearity (carried from r1) |
| 9.1 holomorphic theta | m=1,classes0,1 | θ₁,₀=1+(e(2z)+e(−2z))q+…; θ₁,₁=q^(1/4)(e(z)+e(−z))+… | Keep 2m indexing (carried from r1) |
| 9.2 Jacobi definition | constant1,m>0,z=0,τ=i | elliptic shift would require1=e^(2πm), false; θ₁,j satisfies the law | Keep index/elliptic condition (carried from r1) |
| 9.3 mixed residues | (1+v+bar(v))/v²; bar(v)/v; 1/v;1 | residues 1,0,1,0 respectively | Keep bar-degree-zero extraction (carried from r1) |
| 9.3 affine coordinates | v=2w, differential dv/v | transformed differential dw/w, residue1=1; function alone gains factor1/2 | Keep differential/Jacobian convention (carried from r1) |
| 9.4 polar kernel | simple pole; m-character endpoints | residue −1/(2πi); R_m,0(0)=1 and R_m,m(0)=0 | Keep signs and endpoint values (carried from r1) |
| 9.4 cone realization | specified two-dimensional kernel | Q(c₂)=−m, B(c₁,c₂)=−1 | Keep positive m (carried from r1) |
| 9.5 decomposition | φ=θ_m,j, no poles; double pole | corrected coefficient vector δ_j, polar part0; for v⁻²A(v), residue A′(0) | Keep arbitrary pole order (carried from r1) |
| 9.5 weights | k=1 | coefficient weight k−1/2=1/2, not3/2 | Keep (carried from r1) |
| 10.1 third-order definitions | f,ω through q³ | f=1+q−2q²+3q³; ω=1+2q+3q²+4q³ | Keep actual unilateral series (carried from r1) |
| 10.1a rank and f bridge | q=.2,z=.7; z=−1 symbolically | rank sides≈1.328424407776; z=−1 gives identical denominators Pₙ(−q;q)² for f | Keep (carried from r1) |
| 10.1a ω bridge | q=.2 | P(q²;q²)ω(q)≈1.499934967742; bilateral side≈1.499934967742 | Keep (carried from r1) |
| 10.2 third-order vector S | τ=.17+1.1i | both vectors≈(.420123272091+.012234952158i, .606697161074−.072841738892i, .009455858563−.099933933909i) | Keep; component residuals below 7×10⁻¹⁶ (carried from r1) |
| 10.2 T/leading phases | first entry q^(−1/24); last pair q^(1/3)ω(±q^(1/2)) | first phase ζ₂₄⁻¹; T swaps last two with phase ζ₃ | Keep exchange (carried from r1) |
| 10.3 fifth-order definitions | q→0 | f₀,f₁,F₀,F₁,φ₀,ψ₁,χ₀,χ₁ constants1; ψ₀,φ₁ constants0; φ₁(−q)/q→−1 | Keep signed arguments (carried from r1) |
| 10.3a Hecke bridges, f₀/f₁ | q=.2 after Euler multiplication | both sides≈.888030023612 and .785716216301 | Keep (carried from r1) |
| 10.3a Hecke bridges, F₀/F₁ | q=.2 after even Euler multiplication | both sides≈1.006323199306 and 1.199932391424 | Keep (carried from r1) |
| 10.3a Hecke bridges, φ₀/φ₁ | q=.2 | both sides≈1.241935979521 and .201920619323 | Keep prefactor q for φ₁ (carried from r1) |
| 10.4 indefinite realization | Q and cone vectors in retained theta formulas | ordered-cone sign2 on same-sign interior; reversing endpoints gives−2 | Keep endpoint order from §7 (carried from r1) |
| 10.5 fifth correction vectors | τ=.17+1.1i; sum of paired completions | first correction G₅,₁,₁≈.557887761575−.009932845653i, G₅,₂,₁ is its negative; sum0 | Keep nonzero corrections and cancellation (carried from r1) |
| 10.6 fifth transformations | multiply displayed S matrix by itself | I₆: diagonal1, off-diagonal0 (floating residual norm≈3.14×10⁻¹⁶) | Keep asymmetric √2 entries (carried from r1) |
| 10.6 fifth S law on actual series | τ=.17+1.1i | both six-vectors≈(.505362227191+.004128522071i, .353688249173−.057818438796i, .397756535369+.001034066381i, .247237506773−.046495045432i, .385593599225−.004119716235i, .128003056987−.049554342949i) | Keep; residuals below 7×10⁻¹⁶ (carried from r1) |
| 10.7 seventh vector | cone normalization and leading exponents | Q(c)=−21/2,B(c₁,c₂)=−28; exponents −1/168,47/168,143/168 | Keep order (F₀,F₂,F₁) (carried from r1) |
| 10.8 seventh transformations | S²; third T phase | I₃: diagonal1, off-diagonal0 (residual≈2.36×10⁻¹⁶); 143≡−25 mod168 | Keep (carried from r1) |
| 11.2 root completion | α=1/2,τ=i | correction-defined F≈.506566028747; H₃ first component≈.506566028747 | Keep (carried from r1) |
| 11.2 corrected Lerch expression | α=1/2,τ=i before completion | hα/D≈.650841567833i; corrected expression≈.650841567833i; printed source expression≈.650850612912i | Keep roadmap correction; source issue below (carried from r1) |
| 11.2 root endpoints | α=1/3; α=0 | first has 3α∈ℤ, so separate terms polar but combined rank series regular; α=0 gives η⁻¹ of weight−1/2 | Keep cancellation; trivial root excluded (carried from r1) |
| 11.2 shadow / phase | α=1/2; lower-unipotent N=10368 | correction −2C(1/6,0;3τ) gives +2√6g; rational phase 3N/4=7776∈2ℤ | Keep (carried from r1) |
| 11.3 residue deviations | t=1; t=2 | t=1 coefficient p(n)−p(n)=0 and empty correction0; t=2 deviations ±f/2 with the common q^(−1/24) factor | Keep Fourier projection (carried from r1) |

The 16 new rows all keep; the 114 carried rows and the replaced one bring the table to 131 rows. The previous review's cross-roadmap resolution table, pinned-declaration table, gap audit (the three declared gaps `classical-metaplectic-model`, `analytic-elliptic-regularity`, `vector-bundle-dolbeault` are unchanged in the README and plan) and headline list are unaffected by the diff and are not repeated here.

## Not verifiable

- The seeded sample targets lie outside the changed lines and were not re-read in this round; this is by the incremental brief, not a limitation of the sources.
- GasperRahman2004 and BFOR2017 are waived, Andrews1976, Hickerson1988 and AtkinSwinnertonDyer1954 uncertified: none is cited by the changed lines, and none was requested.
- The Atkin1967 cache text is an OCR-quality extraction: Lemma 3(ii)'s displayed exponent (line 98–99) and parts of Lemma 11 (line 416) are garbled; the exponents were confirmed from Table 3 (lines 594–598) and the surrounding definitions instead.

## Source issues

- none
