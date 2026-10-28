<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/129#issuecomment-6400653669 -->
Review (codex) of b9d6195

Verdict: needs_changes

1. **F01** (P2) The SU coefficient theorem omits the split part of the level

   **Location:** packages/AutomorphicCongruences/README.md:599, §1.7: “if M = M^+M^- with M^- squarefree with an odd number of prime factors, all inert in K”.

   **Claim:** Part (ii) excludes a common height-one divisor of the Fourier coefficients and the p-adic L-function without restricting the primes in M⁺.

   **Witness:** SU line 9442–9445, Proposition 13.4.1(ii), author-copy p.217, requires every M⁺ prime to split. The source deduces (ii) using Proposition 12.3.6; the package's §1.5:547 retains that hypothesis.

   There is no standing level convention supplying it in §1.7. A Needs edge to §1.5 does not add that theorem's hypotheses to a new quantified statement. For a finite arithmetic control take K=ℚ(√−7), p=11, M⁻=3 and M⁺=13. Here −7≡4 mod11 is a square, but −7≡2 mod3 and 6 mod13 are nonsquares. The displayed §1.7 level test accepts the labelled one-prime M⁻, whereas the actual inert part of M has two prime factors. This is a separating test of the hypotheses, not a claim to have constructed a newform counterexample.

   **Exact repair:** Add “every prime dividing M⁺ splits in K” to part (ii), retaining all present hypotheses. Specify C_D using the chosen β_i and admitted x of SU line 9439. Add the above level test as a negative control; M⁺=29 is a positive control since 14²≡−7 mod29. The corrected hypothesis rejects 13 and accepts 29. Check the same split/inert-level pattern in §5.3 when applying R04. Do not narrow part (i), which has no such level hypothesis.

2. **F02** (P1) The Yager sum and its specified inverse action disagree

   **Location:** packages/AutomorphicCongruences/README.md:1102, §2.19: “multiplication by the group-like element u⁻¹ (written [u])” and “y_(K/ℚ_p)(x) = Σ_(σ∈Gal(K/ℚ_p)) x^σ[σ]”.

   **Claim:** This map lands in S={f : fᵘ=[u]f} and induces the asserted module isomorphism.

   **Witness:** In 𝔽₂₇=𝔽₃[a]/(a³−a−1), τ(a)=a+1. With the declared brackets, the identity coefficient of y(a)^τ is a+1; that of [τ]y(a) is a+2.

   Write e_σ for the ordinary group-ring basis. The package defines [σ]=e_(σ⁻¹), so y(a)=a e₁+(a+2)e_τ+(a+1)e_(τ²). In the ordered basis (1,τ,τ²), coefficient Frobenius gives (a+1,a,a+2), while multiplication by e_(τ⁻¹) gives (a+2,a+1,a). Thus y does not even land in S. The unramified degree-three extension at p=3 has this residue field, so reduction already disproves the integral assertion. The polynomial has no root in 𝔽₃ and defines a field.

   FW line 2593–2613, §4.2.2, pp.43–44, uses ordinary basis symbols in (4.2.2) and then an inverse multiplication *action*. LZ14 line 423–445, §3.2, uses an inverse-basis sum with the other action convention. The package identifies both bracket meanings. The previous review's positive-basis computation did not expand this identification and therefore did not test the literal formula now audited.

   **Exact repair:** Use e_σ consistently for the canonical group-ring basis. Set y(x)=Σ x^σ e_σ, define the action u⋆f=e_(u⁻¹)f separately, and set S={f : fᵘ=u⋆f}. Specify that the target module structure in the isomorphism uses ⋆; with the ordinary Galois action on the source, y(xᵘ)=e_(u⁻¹)y(x). Transport the twist/evaluation convention accordingly. Add the degree-three calculation: y(a)=(a,a+1,a+2), and both sides become (a+1,a+2,a). Keep the existing trace tests; they cannot detect this inverse error.

3. **F03** (P1) The new Hilbert API calls a scaled projector idempotent

   **Location:** packages/AutomorphicCongruences/README.md:1753, §5.4: “The integral family uses the Gorenstein idempotent ℓ_f”. Related wording: §5.2:1700–1710, “Integral projector” and “ℓ_f=η_f e_f”.

   **Claim:** The integral congruence-line generator ℓ_f is an idempotent.

   **Witness:** In T=ℤ₅[x]/(x(x−5))⊂ℤ₅², e=(1,0) and ℓ=5e=(5,0); ℓ²=(25,0)≠ℓ. Wan-2015 line 3344–3350 defines a generator, not an idempotent.

   This finite flat reduced local complete-intersection algebra is Gorenstein. Its image in ℤ₅² is {(a,b):a≡b mod5}; T∩ℚ₅e=ℤ₅(5,0). Thus it models precisely the distinction the API must preserve. More generally, the package's own equation implies ℓ_f²=η_fℓ_f. Calling it idempotent is incompatible with a nontrivial congruence ideal. Gorensteinness does not remove that ideal. The source locators are §7.2.1, p.65, and Definition 79, pp.65–66.

   **Exact repair:** Replace “Gorenstein idempotent” by “integral congruence-line generator” (or “scaled Hecke operator”), reserve “idempotent/projector” for e_f, and replace the misleading integral-projector wording in §5.2. State ℓ_f²=η_fℓ_f and its action by η_f on the f-line. Preserve η_f in the canonical-period/interpolation normalization. Add the displayed algebra as a Check. The corrected equation reads (25,0)=5(5,0), and e²=e only in the rational algebra. This is a defect introduced by the F04 repair, whose other API and Check additions are sound.

4. **F04** (P2) NV1 and NV2 lack their per-prime objects and quantifiers

   **Location:** packages/AutomorphicCongruences/README.md:1722–1724, §5.3: “NV1 is nonzero, and under the Fujiwara instance NV2 is primitive modulo the uniformizer”.

   **Claim:** The Hilbert nonvanishing input has been specified sufficiently to use in the congruence argument.

   **Witness:** Wan-2015 line 3525–3558, Definition 85 and Theorem 86, pp.69–70, first restricts to each v-direction and asserts NV1/NV2 for every v|p. For f=X, μ(f)=0 but f(0,Y)=0.

   NV1/NV2 are properties, not named functions; neither their objects nor the local specialization is defined here or elsewhere in this package. A nonzero or primitive multivariable anticyclotomic function need not have the required nonzero/primitive restriction at every v. Also define n⁻ as the inert part of the level and n⁺ as its split part: Theorem 86 requires the full level to be a product of these parts, not merely an arbitrary labelled squarefree n⁻.

   **Exact repair:** Define the central-critical anticyclotomic specialization β, then for each v|p set every γ⁻_(v′,i)=1 for v′≠v. Name the resulting rational Petersson-normalized function and the integral canonical-period-normalized function with their coefficient rings. State NV1 as nonzero rational local restriction and NV2 as integral local restriction outside ϖ_A A[[Γ⁻_v]], both for every v|p. Retain ξ=1, the split/inert decomposition, parity and residual ramification, and all Theorem 8/Fujiwara assumptions for NV2; retain the nonsplit Euler-factor corrections of Lemma 87 rather than asserting every imprimitive variant is primitive. Add tests with two directions: X fails the Y-direction; X+Y restricts to X and Y, both nonzero and primitive; ϖ(X+Y) restricts to ϖX and ϖY, both nonzero but not primitive. These tests separate exactly the three assertions conflated by the present sentence.

Four blocking findings: two P1 and two P2. The package is repairable in its present scope. None is a re-raised finding that the repair worker marked not actionable. The declared supplier gaps are contracts, not findings.

## Verified sound

### Previous findings, checked first

The previous report and repair report were read before the new pass. The mathematical repairs were checked against their changed text and sources, not accepted on the repair report's assertion. Comparing the preceding package revision with this one identifies changes in §§0.9, 2.4, 2.8, 2.12, 5.4 and 5.5, together with scope/contracts and layer dependencies. Every changed passage was reread; the matching patterns were searched elsewhere.

| Previous finding / repair id | Repaired passage in this package | Verdict and evidence |
|---|---|---|
| R01 / F01: mixed triple-product normalizations | §2.4: “ζ^Σ(2)²” and “raw J_v”; §2.12: “raw archimedean integral J_∞ of §2.4” | Repaired. CLW line 5769–5777, (7.11.9), p.72, supports the partial-factor/raw-integral arrangement. The computed q=2 multiplier is 1, not 32/9 or 2. |
| R02 / F02: general-CM auxiliary character at an absent discriminant place | Contract and §5.5: “M is not contained in the narrow Hilbert class field of F”; “at some finite place v dividing D_(M/F), which exists by Δ+” | Repaired. Wan-2015 line 26–27 and line 4038–4069. The unramified CM example has relative discriminant norm 1 and is excluded; the positive example has norm 49. |
| R03 / F03: route-specific restriction of CLW integrality | §2.8(a): “for every p ≥ 3”; §0.9: case (D), supplied by “gap:cm-congruence-katz-integral” | Repaired conditionally on the declared comparison. CLW line 6232–6233 has this full range. The new gap is recorded identically in the plan and names PadicFamilies. It asks for the CM-family congruence comparison, not the final Selmer or integrality conclusion. |
| R04 / F04: missing Hilbert-family API and Checks | §5.4: “Specialization at a generic arithmetic point φ is a ring map”; “For β = diag(1,0), det β = 0” | Partly repaired. Six API bullets and four computed new Checks now specify normalization, extraction, specialization, uniqueness and boundary. The normalization and boundary tests pass; the new idempotence description fails R03. |

The restored CLW endpoint includes p=3 even when tame factors are nonunits. The discriminant condition and raw/normalized integral distinction are propagated to their uses. No unresolved earlier finding was silently treated as settled merely because a repair was attempted.

### Coverage and computed adversarial pass

The README has 92 numbered targets in nine layers, with 92 Needs lines. All target statements, APIs, Checks and proof routes were read. For unchanged material, only the previous review's rows carrying actual computed values were reused; its general assurances were not used as mathematical evidence. New computations cover the repairs, the fifteen seeded targets, and previously uncomputed interfaces, including §§0.4, 0.6, 1.9, 2.11, 5.2–5.3 and the local-direction meaning of nonvanishing. The table is deliberately limited to the sampled targets, endpoints and finding/repair targets. It tests definitions, hypotheses, directions and normalizations; these algebraic models are not computations of unknown automorphic Selmer groups.

| Statement | Instances tried | Values computed on both sides | Result / change |
|---|---|---|---|
| §0.1, divisor convention | M=0 and M=k[[x,y]]/(x,y) | Ch(0)=A; Ch(M)=A, while Fitt₀(M)=(x,y) | Zero module and pseudo-null module are distinguished from Fitting ideals. |
| §§0.2, 0.6 local conditions | Trivial ℚₚ/ℤₚ coefficient, unramified character sending Frobenius to 1/p; ℓ=11,p=5 | Restriction to inertia=0; value on decomposition group=1/p≠0; v₅(1−1/11)=1 | D-kernel is stronger than inertial kernel; ramification does not make the Euler factor a unit. |
| §§0.3, 7.3, sampled control | A=ℤₚ[[T]], X=A/(p,T), T↦0; X=A/(p) | First: image Ch=A/(T)=ℤₚ, specialized Ch=(p), 1∉(p). Second: both (p) | Correct containment; equality under arbitrary specialization rejected. |
| §0.4 Eisenstein quotient | Λ=ℤ₅, T=Λ[x]/(x(x−5)), λ(x)=0; constants Λ→Λ[X] with no generator relation | T/(x)=Λ, kernel 0; in second model X is outside image | Scalarization of all generators, not finiteness alone, supplies surjectivity. Flat change preserves the first kernel. |
| §0.5, sampled lattice datum | Middle ranks 0,1,2; ν(c)=1 or −1; diag(1,2,3,4) | Total ranks 2,3,4; rank 0 excluded. Φᵗ=−Φ or Φ. det(1−XM)=1−10X+35X²−50X³+24X⁴, trace=10=−coeff₁, not 50 | Three blocks and polarization sign retained; trace convention agrees across §§1.3, 1.8, 2.6, 4.6, 5.6. |
| §0.7 and §1.9 length bounds | Reduction of R² modulo π; congruence exponent 2 and scalar Selmer exponent 0 | Reduced length=2; lower bound=2−0=2, not merely 1 | Prior computed length test retained; scalar term and nonvanishing assumptions are essential. |
| §§0.9, 2.8, repaired headline | p=3, tame n=7 or 5; H=3 and h_K Katz=3 or 1; RS=u/3 | v₃(φ(7))=1, v₃(φ(5))=0; products u or u/3 have valuations 0 or −1 | Case (D), not rational case (C), handles the first conductor. Full endpoint restored conditionally. |
| §1.5, sampled interpolation | κ=2, conductor norm 1; κ=4; M⁻ with 0,1,2 factors | ((κ−2)!)²=1 or 4; norm exponent=0 or 2; odd parity accepts only 1 factor | Formula keeps factorial, period and conductor factors; M⁺ split is explicit here. |
| §1.7, sampled coefficient avoidance | K=ℚ(√−7), p=11, M⁻=3; M⁺=13 or 29 | −7 mod11=4 square; mod3=2 nonsquare; mod13=6 nonsquare; mod29=22=14² | R01: first level fails source splitting; repaired statement rejects it. |
| §1.10 SU two-variable headline | Ch=(π³), L=π² | Ch⊆(L) because 3≥2; reversed inequality would require 2≥3 | Direction agrees with source; coefficient normality and level restrictions retained. |
| §1.11 SU cyclotomic headline | 11a1 at p=7 versus p=5 | a₇=−2; 7∤5=v₁₁(Δ); rational 5-torsion prevents residual irreducibility at 5 | Previous computed endpoint test remains applicable. |
| §2.1, sampled projector and weights | U=diag(1,0) over 𝔽₃; trivial module; torus coordinates 2,4 with exponents 1,2 | U^(n!)=diag(1,0) for n≥1, e²=e, image rank 1; zero image rank 0. Inverse weight=1/32, versus 32 for uninverted weight | Semi-ordinary projector uses local finiteness; torus/weight direction preserved. |
| §§2.4, 2.12, repaired triple product | Spherical q=2 with Satake parameters (i,−i)³; enlarge Σ | ζ₂(2)=4/3, L_tri=16/81, L_Ad=512/729, J_raw=1/2, J_normalized=1. Correct RHS multiplier=2·1/2=1=LHS multiplier; old multiplier=32/9 | F01 repaired; partial factors with normalized J would give 2 and are excluded. |
| §§2.4, 2.12 denominators and archimedean factor | Pairings (1,0,1) or (1,2,1); k=2,4 | Pairing products 0 or 2; raw J_∞=1 or 1/3 | Quotients require nonzero pairings; cleared equation remains the primary statement. |
| §2.7 localized CLW headline | O[[S,T]] localized over O[[S]] | S and p invert; T does not. Ideals (S),(p) become unit; (T) stays proper | Localization is stronger than p-inversion. |
| §2.11 class-number factor | K=ℚ(√−23), p=3 | h_K=3; −23≡1 mod3, hence split; v₃(3)=1, while v₃(1)=0 | Omitting h_K changes integral ideals; it disappears only at the level of ideals after p-inversion. |
| §2.13, sampled excluded primes | Nonzero constant term u or π in O[[X]]; nonzero global series X | μ(u)=0, μ(π)=1; X has μ=0 but specialization at X=0 is 0 | The actual nonzero, primitive specialization is required; a nonzero global series alone is insufficient. |
| §2.14 FW headline | Steinberg prime 11, k=2 or 4 | Required local sign gives −1 or −11, not +1 or +11 | Source's Steinberg and residual hypotheses retained. |
| §2.19 Yager map | 𝔽₂₇ cubic model in R02; x=1 in degree p | Literal coefficient vectors (a+1,a,a+2) and (a+2,a+1,a) differ; corrected vectors both (a+1,a+2,a). Tr(1)=p, not a unit | R02; trace criterion itself is sound. |
| §2.20 crystalline-short headline | [A→ˣA], x↦0; equal Satake roots | Before specialization H⁰=0; afterwards H⁰=H¹=E. α−β=0 | Derived/Tor correction and separate irregular comparison are retained. |
| §2.21 ordinary FW headline | Scalar −1 versus 1 over 𝔽₅ | Invariant dimensions 0 versus 1; exponent inequality 3≥2 gives (π³)⊆(π²) | No-invariants hypothesis and direction retained. |
| §2.22 Wan Rankin headline | Extra old level; c=2,j=0,trivial character in smoothing factor | Two old degeneracy vectors; c²−c²=0 | Newness and nonzero smoothing hypotheses cannot be dropped; prior row remains applicable. |
| §3.1 residual local hypotheses | Split distinct representation; irreducible non-absolutely-irreducible quadratic model; nonsplit distinct extension | End dimensions over 𝔽₅ are 2,2,1 | Scalar End is separate; broad FW cases use the declared descent contract. |
| §3.4, sampled fundamental lines | C=[A→πA] in degrees 0,1; inverse determinant; α=1 | Standard determinant trivialization has image πA; inverse has π⁻¹A. For 1−α=0, both H⁰ and H¹ are A | Correct degree/sign and no acyclic trivialization at a zero Euler factor. |
| §3.8, sampled zeta specialization | Σ={p}; add factor 1−γ; one-dimensional inertia invariants | Empty product=1; γ=1+T gives −T, nonzero nonunit; local polynomial degree=1 | Euler-corrected Kato map, not its unsmoothed replacement, is compared. |
| §3.10, sampled main-conjecture propositions | Images A,πA,TA in A=O[[T]]; scalar π on rank-two restriction | Only A is the unit lattice; πA becomes A after p-inversion, TA remains proper; norm(π)=π² | S_Iw, S and regular-subring statements are not conflated. |
| §4.3 universal-family headline | Finite free coefficient extension of rank 2; scalar π | Determinant over Λ=π², not π | Restriction-of-scalars theorem is the claimed endpoint, not a theorem over arbitrary singular T. |
| §4.5 pointwise headline | t=u², fibre t=0; p odd and even weight | u²=0 with u≠0; 2a even cannot equal k−1 odd mod even p−1 | Ramified points need the source's separate argument; scalar residual exclusion is justified. |
| §4.6, sampled Euler/Tor control | Inertia N=[[0,X],[0,0]], X↦0; A/(X) | Generic invariant rank 1; specialized rank 2; Tor₁(A/(X),A/(X))=A/(X) | Full Euler-line comparison needs suitability; partial derived comparison is distinct. |
| §§5.2, 5.4 integral operator | T=ℤ₅[x]/(x(x−5)) | e²=e in ℚ₅²; ℓ²=(25,0)≠(5,0); ηℓ=(25,0) | R03; no integral idempotence follows from Gorensteinness. |
| §5.3, sampled nonvanishing | X, X+Y, π(X+Y), specializing away one direction | X→0 or X; X+Y→Y or X; π(X+Y)→πY or πX, valuations 1 | R04; nonzero, global primitive and every-direction primitive are different. |
| §5.4 repaired family API | β=diag(1,0) or I₂; raw coefficient 2, scalar 3; two cusps | det=0 or 1; normalized coefficient=6, not 18; boundary values (0,1) fail all-cusp vanishing | Four new computed Checks discriminate; no further normalization defect found. |
| §5.5 and CM gap | F=ℚ(√3), M=ℚ(ζ₁₂),p=13; F=ℚ(√29),M=F(√−7),p=23 | Relative discriminant norms 144/12²=1 and (29·7)²/29²=49; 4²≡3,5²≡−1 mod13; 11²≡29,4²≡−7 mod23 | F02 repaired: first excluded by Δ+, second has finite ramification and split base-ramified prime. |
| §5.10 Hilbert headline | p=5, weight 2; positive-rank module versus torsion | 5≥5,2≥2; extended Ch of positive-rank module=0, so 0⊆(L) proves no torsion | Boundary cases retained; torsion remains separately proved. |
| §6.1, sampled PR/Greenberg equivalence | Local cone length c=2, characteristic/analytic lengths (5,4) and (3,2) | Defects 5−4=1=3−2. Two-form direct sum adds defects; opposite inequality changes both signs | Compatible four-term exact sequences, both directions and integral/rational branches retained. This is a length-model test, not a computation of the arithmetic modules. |
| §6.6 early product headline | Rational containment, analytic μ=0; contrast μ=1 | Missing prime inequality is 0≤length, automatic; 1≤0 fails in the contrast | μ=0 restores exactly the omitted prime; no cyclotomic endpoint used. |
| §§7.1, 7.2, sampled integral twists | Quadratic generator acting −1; p=5 versus 2; pⁿ-torsion | χ²=1; multiplication-by-p commutes with −1. At 5, 1/2 is integral, ± projectors have eigenvalues (1,0); at 2 they are not integral | Point equivariance passes compatibly to Tate lattices; discrete Shapiro is used only after passing to p-primary coefficients. |
| §7.4, sampled period factorization | D_K=−7,p=11; rescaling period by 11 | v₁₁(√7)=0, v₁₁(11)=1; raw area equals √7·Ω_E/K, not Ω_E/K | Discriminant and component factors are units in the selected case; arbitrary scalar period rescaling is not allowed. |
| §7.8, sampled four-factor separation | Nonnegative defects with sum≤0; remove individual bounds | All four defects=0. Countermodel J exponents (1,1,0,0), L exponents (2,0,0,0) has equal sums 2 but unequal factors | Both product and individual containments are required. Nonzero cancellation also proves the stated nonprincipal ideal extension. |
| §§7.9, 7.10 rational/integral headlines | E:y²=x³−4x+7,p=5; σ unipotent with upper entry 1 or p | #E(𝔽₃)=7,#E(𝔽₅)=4; a₃=−3,a₅=2; residual Frobenius discriminant=2 mod5. Cokernels ℤₚ or ℤₚ⊕𝔽ₚ; v₅(10/11)=1 | Endpoint includes this curve under (im); the saturated-comparison gap is necessary. Squaring gives entry 2, still a unit at odd p. |
| §8.1 aggregate | (π) versus A before/after p-inversion | Distinct integrally; both become A[1/p] | Aggregate does not upgrade the rational branch without (im). |

Field/DVR/zero-ring distinctions were also checked against the actual standing hypotheses: the arithmetic rings are nonzero normal domains or p-adic integer rings; the zero ring and equal-characteristic coefficients are not admitted into these arithmetic conclusions. Rank-zero polarized data are excluded, but zero torsion modules are admitted and have unit characteristic ideal. Generic complex and ideal constructions retain their broader carriers. Nonreduced fibres and exceptional eigenvalues were tested where specialization admits them. The relevant group rings are abelian because the specified towers are abelian; no assertion silently extends their Fourier identities to S₃ or Q₈. Pure ideal transport and module restriction assertions do not require abelian ambient Galois groups.

### Seeded source verification

All fifteen sampled targets have readable controlling texts. No additional locator is labelled unverified by the author. The settled waived/uncertified works are listed below; their contents are not claimed verified. Numbering is for the version actually read: SU author copy; FW v3; CLW v1 and addendum; NAK v2; BCS v2 or the published text as indicated; CGS23 v1 and v2.

| Target | Locator opened | Result |
|---|---|---|
| 0.5 | SU line 1832–1887, §§4.1–4.2, pp.49–50; line 2225–2235, §4.5, p.59 | Polarization, three distinct residual blocks, local freeness/disjointness and coefficient assumptions retained. |
| 1.5 | SU line 8546–8555, Theorem 12.3.1, p.199; line 8661–8683, Proposition 12.3.6, p.202 | Both interpolation normalizations, factorial/conductor factors, split M⁺ and inert M⁻ hypotheses match. |
| 1.7 | SU line 9433–9455, Proposition 13.4.1, p.217 | Part (i) matches; part (ii) loses M⁺ splitting: R01. |
| 2.1 | CLW line 428–441, §2, p.8; line 959–970, Theorem 2.9.1, p.13; line 2107–2131, Theorem 4.6.1, p.29 | Residual torus, inverse weight, local-finiteness and semi-ordinary theorem correspond; no full ordinary theorem substituted. |
| 2.13 | FW line 5717–5760, Theorem 7.32 and proof, pp.96–97 | Exceptional-prime removal retains the extra Steinberg-twist/root-number and μ inputs; ramification alone is not used as a replacement. |
| 3.4 | FW line 1768–1848, Lemma 3.17, Definitions 3.18–3.19 and Proposition 3.20, pp.31–32 | Partial derived change separated from full suitable change; local Euler complexes and determinant orientation retained. |
| 3.8 | NAK line 2900–2944, Theorem 4.3, p.66 | Literal dual source, twist-one target, selected residual hypotheses and Σ-Euler product match. |
| 3.10 | FW line 1950–1995, Conjectures 3.24–3.27, p.34; line 2070–2077, Conjecture 3.30, p.36 | S_Iw and Λ formulations correctly distinguished; propositions defined rather than assumed as hypotheses. |
| 4.6 | FW Lemma 3.17/Proposition 3.20, pp.31–32, and regular-subring discussion; NAK line 3413–3416, (77), p.78; line 3511–3525, (78)–(80), pp.80–81 | Euler products, derived control and restriction-of-scalars role agree. (77) is not confused with the H¹/H² comparison. |
| 5.3 | Wan-2015 line 3525–3594, Definition 85, Theorem 86 and Lemma 87, pp.69–71 | Period argument and retained nonsplit factors match; per-v specialization and exact level decomposition need R04. Hung2017 itself remains uncertified. |
| 6.1 | BCS line 389–410 (v2), Theorem 4.1.3/Corollary 4.1.4, p.8 | p∤2NN′, split p, discriminant coprimality and residual irreducibility over K retained; both directions, products and integral versions match. |
| 7.1 | BCS line 472–490 (published), Lemma 5.1.1, p.10, and line 569–590, p.12; SU §§3.1.1–3.1.5, pp.16–19 | Integral quadratic twist is a required adapter, not supplied by a rational isogeny. Pinned point equivariance supports its route. |
| 7.3 | SU Propositions 3.2.8/3.2.11 and Corollary 3.2.9(ii), pp.23–24; BCS line 494–503 (published), p.11 | Restriction-control hypotheses and principal-majorant direction agree. |
| 7.4 | CGS23 line 358–390 (v1), Definition 1.2.2/Remark 1.2.3/Proposition 1.2.4, pp.7–8; line 372–402 (v2), corresponding §2.2; BCS published proof p.12 | Unit ideal identity survives the source's missing complex discriminant factor; package retains that factor instead of copying the false area equality. |
| 7.8 | BCS line 569–590 (published), (5.3)–(5.4), proof of Theorem 1.1.2, p.12 | Product plus four upper bounds yields four equalities; rational and integral assertions separated. |

Additional repaired-source checks: Wan-2015 line 2392, raw-to-normalized G_D; line 3344–3363, congruence generator; line 3597–3615, Theorem 88/Remark 89, p.71; line 4038–4069, Proposition 96, pp.79–80. CLW line 6217–6244 and line 6374–6385, Theorem 8.2.1(2) and proof, pp.78,81, were compared with HT94's localizations and Hid06's p>3 hypothesis. CLW-addendum Theorems 5.0.1–5.0.2 preserve the two-family repair. LZ14 §3.2 and LZ16 Theorem 7.1.5/Remark 7.1.6 were fetched through the sources service and read; the latter explicitly retains its auxiliary smoothing factor, sufficiently small Coleman discs and its weight-one covering qualification.

### Headline and Lean audit

The fourteen endpoint targets are:

- §§1.10–1.11: SU two-variable and cyclotomic divisibilities.
- §§2.7–2.8: CLW localized and p-inverted/integral variants.
- §§2.14, 2.20–2.22: FW Greenberg, crystalline-short and ordinary results, and Wan's Rankin–Selberg divisibility.
- §§4.3, 4.5: FW universal-family and every-classical-point main conjectures.
- §5.10: Wan's parallel Hilbert-family divisibility.
- §6.6: BCS integral two-variable product containment.
- §§7.9–7.10: BCS rational and integral cyclotomic equalities.

All fourteen are named, with the missing carriers, in packages/AutomorphicCongruences/Suggested.lean. The intermediate deep constructions likewise need genuine automorphic families, continuous arithmetic Selmer modules and determinant/zeta comparisons. A theorem about four arbitrary ideals would not state any of these arithmetic endpoints. The native completed group algebra and continuous H¹ do not supply the missing Selmer conditions, characteristic divisors, Hida/deformation families or normalized p-adic L-functions.

Suggested.lean is 44 lines, with a single `import Mathlib`, one module docstring and an empty correctly named namespace. There are zero definitions, zero sorried theorems and zero admitted examples; no sorry'd data, set_option, substitute Prop fields or padding. Accordingly the elaborated-signature audit and one-tactic padding probe have zero instances, rather than untested declarations. No statable arithmetic headline was found omitted.

The prescribed `lake env lean` invocation on packages/AutomorphicCongruences/Suggested.lean, from the pinned content checkout, exited 0 with no diagnostics or warnings. No TauCeti import required an object build. No review Lean process remains running. Elaboration checks this file's form; it does not certify the README mathematics.

### Pins, ownership and supplier direction

The pins in lake-manifest.json are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Object searches covered their sources, main roadmaps, the supplied board index/packages and the readable open heads through `roadmaps grep`/`roadmaps show`. The main PadicMeasuresIwasawaAlgebras and ProfiniteCohomology READMEs were read for upstream shape. Source files and external text were treated as data; no suspicious instruction was acted on.

The following native declarations were opened at the pins. Paths in this table are relative to the respective library source roots.

| Library file and line | Declaration / what it actually supplies |
|---|---|
| Mathlib/RingTheory/Length.lean:30 | Module.length takes values in ℕ∞; finite length is not built into arbitrary modules. |
| Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:132; Coeff.lean:334 | Matrix.charpoly is det(TI−M); coeff_charpolyRev_eq_neg_trace applies to coefficient 1 of the reciprocal polynomial, including empty matrices. |
| Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56 | IsDiscreteValuationRing includes local PID and nonfield conditions, over an integral domain; it does not specify mixed characteristic or a uniformizer p. |
| Mathlib/RingTheory/RegularLocalRing/Defs.lean:51 | IsRegularLocalRing includes Noetherian and local hypotheses. |
| Mathlib/RingTheory/MvPowerSeries/Basic.lean:86 | Native formal series are functions on finitely supported exponent vectors; they do not carry an arithmetic L-function. |
| Mathlib/RingTheory/Ideal/Maps.lean:80,185,654,769 | Ideal.mem_comap, map_span, map_mul and RingHom.comap_ker. Extension preserves products; contraction is preimage. These do not prove arbitrary characteristic-ideal specialization. |
| Mathlib/RingTheory/Ideal/Quotient/Operations.lean:89,93,133 | RingHom.quotientKerEquivOfSurjective and its application formula; Ideal.mk_ker. Surjectivity is an explicit input. |
| Mathlib/RingTheory/Ideal/Span.lean:100 | Ideal.span_singleton_mul_left_unit requires IsUnit; multiplication by π does not qualify. |
| TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:712 | TauCeti.ContCohomology.H1 is the quotient of continuous cocycles by coboundaries, not an Iwasawa Selmer module. |
| TauCeti/RingTheory/FittingIdeal/BaseChange.lean:128–135 | fittingIdeal_baseChange has Module.Finite explicitly in scope; no flatness required for this Fitting statement. |
| TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:952 | quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map supplies the integral point-group equivariance. Passing to torsion, inverse limits and ordinary lines remains §7.1's adapter. |
| TauCeti/NumberTheory/Multiquadratic/MultiquadraticSplitting.lean:199 | NumberField.ncard_primesOver_multiquadratic_iff assumes p odd and avoiding all radicands, plus actual generators. |
| TauCeti/NumberTheory/Multiquadratic/Galois/Basic.lean:190 | TauCeti.Multiquadratic.isGalois requires 2≠0 and the square-root generation setup. |
| TauCeti/NumberTheory/Multiquadratic/Prime/Discriminant/Basic.lean:50 | oddPrimeDiscriminant is p or −p according to p mod4. Its definition alone does not assert primality. |
| TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145 | completedGroupAlgebra exists; it does not by itself supply the arithmetic endpoints. |
| TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104 | selmerGroup₂ is a square-class subgroup cut out by norm and local conditions for 2-descent, not an ordinary p-primary Selmer group over a tower. |

The dependency command, with the supplied order and `--movable`, returned:

```text
depcheck: 54 roadmaps, 626 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Every Needs line was read. The early BCS product precedes factor separation; ModularIwasawaMainConjectures and HeegnerPointEulerSystems are consumers. No cycle was introduced by the CM comparison gap.

Cross-roadmap citations were resolved anew, not inherited from memory. The locator evidence covers 180 cited section/layer headings in 35 supplier READMEs. Representative exact resolutions, including every delicate ownership boundary, follow; section ranges here mean all named sections in the range, not an inferred theorem beyond them.

| Supplier and current locator | Consumed object / boundary checked |
|---|---|
| TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:2361,2530,2710,3172,3897 | §§4.1,4.4,4.6,5.1,6.5: pseudo-nullity, μ/λ, divisors versus UFD ideals, determinant sign and native Fitting ideals. The general divisorial ideal is an additional contract. |
| TauCetiRoadmap/SelmerIwasawaCohomology/README.md:346,492–713,817–932,1358–1616,1743–1815,1865,1935 | §§2.1,2.7–2.10,2.12–2.13,2.19,2.21,2.23–2.24; §§3.1–3.2,3.5,3.8–3.14,3.16–3.20; §§4.7,4.10. Local conditions, derived errors and Fontaine–Laffaille restrictions are retained. |
| TauCetiRoadmap/ArithmeticGaloisDuality/README.md:3324,4540,4910,5220,5404 | R02.4.3 and D7.1,D7.3–D7.5: finite duality, coefficient algebra, continuous derived cochains, local/global duality. |
| TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md:1675,1701,1864 | §§4.4–4.5,5.4: perfect local complexes and derived change, analytic ψ comparison. Global FW finite-slope comparison remains here. |
| TauCetiRoadmap/ProfiniteCohomology/README.md:1168; EllipticCurves/README.md:647,1262; NumberFieldArithmetic/README.md:489 | Discrete Shapiro; integral torsion/Tate modules and general Selmer structures; relative splitting. Compact T is not passed directly to discrete Shapiro. |
| TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:2201,2375,2829–2954,1661,3170–3225,3477,3545 | §§1.3–1.4,2.1–2.3,3a.1,4.1–4.2,5.3,Layer 6. Generic Hecke/GMA theory is imported; its two-character rank-two theorem is not the polarized 1+n+1 theorem. |
| TauCetiRoadmap/IntegralIwasawaTheory/README.md:586,1587; DirichletPadicLFunctions/README.md:614 | §§5.0,12.1 and §2.8: canonical abelian function, Wiles and Euler deletion. Source-specific character substitutions remain here. |
| TauCetiRoadmap/PELModuli/README.md:3631,3673; ShimuraCompactifications/README.md:2290,2538,2572 | M5.5–M5.6 and C5.3,C5.15–C5.16: unitary geometry and classical expansions. |
| TauCetiRoadmap/AutomorphicBundles/README.md:4567,4790,5033,5103; IgusaVarietiesAndTorsionConcentration/README.md:117,866,1089 | B5.1a,B5.7,B5.14–B5.15 and IG.0–IG.2. Classical injectivity and the ordinary tower contract are distinct. |
| TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:618,1553,1674–1714,1746–1804 | §§3.3,6.2,6.10a–6.13,6.17–6.20: unitary splittings, doubling, Jacobi extraction/theta decomposition. Three-GL₂ Ichino and source-specific Klingen families remain here. |
| TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1950; AutomorphicSpectralTheory/README.md:912,1600,2352 | AL.3 and §§1.2,2.4,4.3. Generic Rankin factors and spectral theory do not supply Harris's particular holomorphic CAP exclusion. |
| TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:1203,1758,2036 | AG2.2,AG2.5 and AG2.6: geometric/polarized Galois input with field and regularity restrictions. Imaginary-quadratic extension is declared. |
| TauCetiRoadmap/PadicFamilies/README.md:359–541,1080,1159–1289,2353–2395,2529,2596,2639,2759–2822 | §§0a.11,0a.15–0a.16,0a.19,0a.22; §§1.3,1.7–1.8,1.10–1.11; §§4.0.1–4.0.3,4.1,4.6,4.9; §§5.1,5.6–5.9. Ordinary projectors, congruence/period lines and even-degree Hilbert theory are imported. |
| TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:1303,1404,1742 | §§1.1,1.3,2.5: periods, stabilization and small-slope functions. Néron-normalized integral comparison remains a gap. |
| TauCetiRoadmap/PadicHodgeRegulators/README.md:455,600,1697,1861–1933,2258 | §§1.2,1.10,8.8,8.18–8.19,8.22,9.22: exp/log, regulators, Coleman and refinement. These do not define the Yager module. |
| TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:1882–2058,2243,2348 | §§5.5,5.7–5.9,5.11,6.1,6.6: scalar-End and excluded-extension assumptions were compared; p=3 generic freeness is declared. |
| TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:1320,1463–1545,2111 | §§4.1,4.4–4.5,4.7,6.2. §4.7 requires scalar End; the broader FW descent is a separate gap. |
| TauCetiRoadmap/LocalGaloisDeformationRings/README.md:691,864,1293,2415,3370,4021 | F.2.5,F.2.9,§§1.1,3.4,6.12,8.3: universal/fixed-type/ordinary/low-weight rings with Schur and weight hypotheses. |
| TauCetiRoadmap/GlobalGaloisDeformations/README.md:574,640,694,1461; DeformationAndDerivedPatchingAlgebra/README.md:526,615,1234,1382 | §§3.7–3.8,4.1,R04.6; §§3.1,3.4,6.2,7.3. Restriction maps do not automatically preserve minimal local types. |
| TauCetiRoadmap/ClassicalSerreModularity/README.md:850; SerreWeightAndLevelOptimisation/README.md:621; GL2ModularityLifting/README.md:1491,2101,2321,2341,2553,2835 | R27.6; §2.13; §§5.16,7.8,8.7–8.8,10.5,12.1. Conditional level lowering is used only after modularity, not as its proof. |
| TauCetiRoadmap/OrdinaryAutomorphicFormsAndModularityLifting/README.md:1199,1233,1796–1860,2125 | §§3.28–3.29,4.13–4.16,5.6. Nice-prime R=T is distinguished from the required minimal Fujiwara theorem. |
| TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:5114; EulerSystemsCyclotomicMainConjecture/README.md:2339 | §8.16 and Layer 3: Poitou–Tate and cyclotomic equality; imaginary-quadratic Rubin extension is declared. |
| TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:5504,5626 | §§9.15,9.21: weight-two BDP function and coefficient integrality. Higher/Hilbert toric input remains a contract. |
| packages/KatoEulerSystems/README.md:435,708–799,1110–1311,1463,1533–1564,1870,1974,2058 | §§0.1,2.1–2.3,4.1–4.4,5.1,5.3–5.4,6.6,7.2,7.4 at supplied head 0590194. Actual unsaturated scalar/Euler bounds are weaker than the declared saturated Néron comparison. |

The resolver's sole absent-roadmap lead was KatoEulerSystems. The supplied board index identifies its package and head, and the cited sections were read there; this is not supplier drift. Searches by object found no second owner of the Yager module or these source-specific congruence constructions. The downstream ModularIwasawaMainConjectures README:126 explicitly imports the universal zeta/fundamental-line construction; its README:165 leaves Katz inputs elsewhere. HeegnerPointEulerSystems README:248–252 declares its toric μ input from this roadmap. Those are consumption boundaries, not duplication or upward supply. Related main/open constructions were checked through the roadmap service; no unprovided open head was guessed.

All sixteen declared gap slugs and needs sentences match exactly between the README and design/plan.json, and every supplier is named and earlier. The precision/minimality checks distinguish the added object from what the cited section already supplies:

| Gap | Missing extension, rather than a duplicate |
|---|---|
| divisorial-char-ideal | Ideal realization for normal nonfactorial branches, plus faithful coefficient extension; supplier presently gives the divisor and factorial ideal. |
| unitary-ordinary-igusa | The specified ordinary integral Levi torsor, boundary ideals and p-adic-form actions; classical compactification expansions alone are insufficient. |
| unitary-galois-imaginary-quadratic | Imaginary-quadratic field range, beyond the cited geometric degree restriction. |
| katz-cm-padic-l | Katz/CM Rankin normalization and the separately hypothesized nonvanishing branches; ordinary family regulators alone do not supply them. |
| anticyclotomic-rankin-selberg | General/Hilbert toric input and its local μ/Euler conditions, beyond the weight-two BDP owner. |
| hilbert-hida-odd-degree | Odd-degree extension of supplier §§5.6–5.9, which explicitly assume even degree. |
| msd-neron-periods | Néron versus saturated modular-symbol periods with actual Manin/degree factors. |
| rubin-imaginary-quadratic | Two-variable/anticyclotomic imaginary-quadratic main conjecture, beyond the cyclotomic supplier. |
| fujiwara-minimal | Minimal R=T/freeness and local types, not nice-prime localization alone. |
| minimal-lift-base-change | Existence of a minimal lift preserving all six local clauses, not merely the restriction ring map. |
| paskunas-p3-freeness | The p=3 application at generic points with the stated residual exclusions. |
| gl2-essential-vectors | Unconditional family/newvector comparison with constant monodromy/conductor and specialization, beyond generic co-Whittaker vocabulary. |
| fw-zeta-local-descent | Coefficient-compatible descent for the additional nonscalar local-End cases; excludes neither FW branch and assumes no endpoint. |
| hilbert-cm-unit-congruence | General-CM auxiliary character and integral congruence-period input under Δ+, not imaginary-quadratic nonvanishing. |
| kato-neron-saturated-comparison | Primitive integral lattice/local-cone regulator comparison preserving zeta index; not cancellation of r_E or a nonunit Euler factor. |
| cm-congruence-katz-integral | Integral CM-branch congruence-to-Katz comparison outside the cited localized/p>3 cases; no π, Selmer module or final divisibility in its conclusion. |

No gap is reported merely because its promised result is absent today. The newest contract may require substantial new mathematics; its breadth is explicit, and the package's endpoint remains conditional on it. No existing roadmap was re-planned, no computational algorithm was introduced, and no route-specific prime restriction remains from F03. README headings, layer endings, mathematical prose and explicit dependencies follow the requested shape. R02–R04 identify the remaining definition/convention precision defects rather than treating a source citation as their definition.

## Not verifiable

- Ichino2008, Ikeda1994, Harris1984, Rubin2000 and BST19 remain **waived** in sources.toml. Their direct texts were not certified. The accessible CLW/FW formulas and the named supplier contracts were checked where applicable; this is not a claim to have independently read the waived originals.
- Hung2017 remains **uncertified**. Wan-2015 Definition 85/Theorem 86 and its period comparison are readable and were checked; Hung's own proof was not certified. Neither this nor a waived item is a renewed source request.
- No other required sampled source was unreadable. The source service added the missing LZ14 and LZ16 entries. The original 39 author entries remain a byte-identical prefix; the manifest now records 41 unique works (35 certified, five waived, one uncertified). Alternate BCS published and CGS23 v2 texts were read under their existing keys. No source extraction was copied into the package and no new missing-reference request remains.
- The pinned APIs do not yet express the arithmetic headline carriers. The successful empty-namespace elaboration is therefore not a formal verification of any of the fourteen mathematical endpoints.

## Source issues

- **Error** in Wan-2020 at the triple-product display in §8.4, p.80, line 4074–4079: the source says a partial global L-ratio uses full zeta factors and normalized local integrals; it should be a consistent full-ratio/normalized or partial-ratio/raw formula; affects a stated result.
- **Misprint** in FW at Conjecture 3.25, p.34, line 1969: the source says the final source line uses T_λ without its cyclotomic deformation; it should be T_(λ,Iw), matching S_Iw and the preceding morphism; affects a stated result.
- **Gap** in FW at Definition 3.18 and following base-change discussion, p.31, line 1798: the source says full Euler-corrected lines commute with arbitrary specialization; it should retain the suitability conditions of Proposition 3.20 or the inertia-rank correction; affects the proof.
- **Misprint** in CLW at the end of the proof of Theorem 8.1.1, p.78, line 6212: the source says the Eisenstein-ideal valuation is bounded above by the analytic valuation; it should be bounded below; affects the proof.
- **Gap** in CLW at the proof of Theorem 8.2.1(2), p.81, line 6380–6381: the source says cited CM main conjectures give integral congruence comparison throughout its range; it should supply the comparison outside their prime and localization hypotheses; affects the proof.
- **Misprint** in Wan-2015 at Definition 85, p.69, line 3537–3541: the source says the integral function without a v-subscript belongs to the v-direction algebra; it should use the preceding v-specialization, as Theorem 86 does; affects a stated result.
- **Error** in CGS23 at Remark 1.2.3, p.7, line 364–369 (v1), and Remark 2.2.3, p.8, line 380–385 (v2): the source says the raw Petersson area equals degree divided by Manin-constant squared times Ω_E/K; it should include √|D_K| with that definition of Ω_E/K; affects a stated result.
- **Misprint** in BCS at Lemma 5.1.1 proof, published p.10, line 488: the source says both Shapiro summands are cohomology over M; it should be over K, with the second twisted by η_F; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b9d6195d9fb056f011896899b062bfd2689c44e1", "job": "REV-PKG-AutomorphicCongruences~4", "model": "gpt-6-astra", "worker": "chris-30"} -->
