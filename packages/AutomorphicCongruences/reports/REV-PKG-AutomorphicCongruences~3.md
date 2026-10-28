<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/129#issuecomment-6397556228 -->
Review (codex) of 08f531f

Verdict: needs_changes

1. **F01** (P1) The triple-product identity counts the removed Euler factors incorrectly

   **Location:** packages/AutomorphicCongruences/README.md:790–794, §2.4; inherited by §2.12. The displayed right side contains “ζ(2)² · L^Σ(1/2,Π,r)/L^Σ(1,Π,Ad)” together with the normalized local factors J_v defined immediately above it.

   **Claim:** This cleared identity, and its quotient version when the pairings are nonzero, give Ichino's formula with those normalizations.

   **Witness:** At q=2, take spherical Satake parameters (i,−i) in each factor and local pairings 1. The triple/adjoint Euler ratio is 9/32 and J₂=1. Adding 2 to Σ multiplies only the asserted right side by 32/9.

   **Exact repair:** Keep the normalized J_v and use the full global triple-product/adjoint L-ratio, with the same specified archimedean convention. Equivalently, restore to the present expression the product of L_v(1/2,Π_v,r)/L_v(1,Π_v,Ad) over the removed finite places. Another consistent formulation uses partial ζ^Σ(2)², partial L-functions and the raw local integrals. Apply the same convention to the cleared and quotient formulas and to §2.12. Retain the repaired nonzero-pairing conditions.

   **Repair test:** For the witness, L₂(1/2,Π,r)=16/81, L₂(1,Π,Ad)=512/729 and ζ₂(2)=4/3. The raw spherical integral is 1/2; normalization gives J₂=1. With full global L-functions, enlarging Σ changes the right side by 1. With partial ζ and raw integrals, its multiplier is 2·(1/2)=1. CLW line 5769 through line 5777, equation (7.11.9), p.72, uses the latter consistent arrangement. Wan-2020 line 4074 and line 4079 contain the inconsistent arrangement copied into this target; see Source issues. This is a finite-place normalization defect, independent of the waived primary Ichino text.

2. **F02** (P2) The new Hilbert-CM contract omits the ramification hypothesis needed by its conclusion

   **Location:** packages/AutomorphicCongruences/README.md:115, gap:hilbert-cm-unit-congruence; the matching needs sentence in packages/AutomorphicCongruences/design/plan.json:182; consumption in §5.5. The contract requires “at some discriminant place v” a prescribed nontrivial local character.

   **Claim:** The auxiliary character exists for every CM quadratic M/F of degree greater than two satisfying the stated prime and splitting assumptions.

   **Witness:** Take F=ℚ(√3), M=ℚ(ζ₁₂), p=13. Their discriminants are 12 and 144, so N(D_M/F)=144/12²=1. Both 3 and −1 are squares modulo 13. There is no relative-discriminant place to choose.

   **Exact repair:** Add Wan's ambient Δ hypotheses to this contract in both locations: M is not contained in the narrow Hilbert class field of F, and primes ramified in F/ℚ split in M/F. Carry them into the invocation in §5.5. In particular, explicitly require a finite ramified place for the local character condition. These are the hypotheses in Wan-2015 line 26–27, p.1, under which the proof at line 4038–4055, pp.79–80, makes that choice. Do not add a new restriction to the BCS endpoint: §5.13 already proves these conditions for its selected fields.

   **Repair test:** The witness is excluded because its relative discriminant is the unit ideal. For the existing positive control F=ℚ(√29), M=Fℚ(√−7), p=23, the absolute discriminants give N(D_M/F)=49; 7 supplies finite ramification, 29 splits in ℚ(√−7), and 29≡11², −7≡4² modulo 23. This tests the field hypotheses only, not the remaining automorphic datum. The gap has a named earlier owner and is correctly registered; the finding is its missing hypothesis, not the present absence of its requested theorem.

3. **F03** (P2) The CLW integrality headline is narrowed to the available proof route

   **Location:** packages/AutomorphicCongruences/README.md:862–874, §2.8(a), using §0.9. It says “The integral form of (a) is not asserted at p = 3” in the listed exceptional cases.

   **Claim:** Integral CLW integrality is planned only in cases (A) or (B); otherwise the package stops after inverting p.

   **Witness:** CLW line 6232–6234, Theorem 8.2.1(2), p.78, asserts integrality under residual distinctness for p≥3. The package's n=7 test has φ(7)=6 and v₃(6)=1, and explicitly drops that integral target.

   **Exact repair:** Retain §0.9(A)–(C) as proved-range intermediate targets, but restore the full integrality target of CLW Theorem 8.2.1(2). Own the additional comparison argument here, or declare a precise earlier-supplier contract for the missing integral CM congruence/denominator comparison, including the p=3 and nonunit tame-factor cases. The contract must supply the comparison, not assume the desired final main-conjecture divisibility. Update the scope and §2.8 proof dependencies accordingly. Do not infer an integral assertion from a rational identity.

   **Repair test:** The n=7 arithmetic obstruction still gives v₃(6)=1; it now selects the additional integral comparison instead of deleting the headline. The n=5 case has φ(5)=4 and v₃(4)=0 and continues to use route (B) when its other hypotheses hold. The source gap is real: Hid06 line 58 assumes p>3, while HT94 line 159–165, Theorem 0.3, p.92, localizes at φ(Nc) and sometimes a trivial-zero factor. Acknowledging that gap is correct; narrowing the library's endpoint to that route violates the binding generality principle. CLW-addendum line 368, Theorem 5.0.2, p.6, retains the original theorem's scope.

4. **F04** (P3) The Hilbert Klingen construction still lacks its API and discriminating Checks

   **Location:** packages/AutomorphicCongruences/README.md:1733–1744, §5.4. The two Checks say “Use GU(2,2)” and “Check boundary divisibility at all cusps”.

   **Claim:** This section constructs the integral family, its coefficient functions and the normalized p-adic L-function, but supplies no API list and only two instructions to check properties.

   **Witness:** The section has zero API bullets and two Check bullets. Neither computes a value. The construction in line 1733 includes specialization, all-cusp coefficients and degenerate-coefficient divisibility.

   **Exact repair:** Add prose API bullets specifying the source and target of coefficient extraction and specialization, their compatibility, expansion uniqueness, the normalization, and the degenerate-coefficient ideal. Add at least three separate computed Checks: determinants 0 and 1 for diag(1,0) and diag(1,1); raw coefficient 2 normalized by 3 becoming 6 rather than 18; and a family with a unit coefficient reducing to 1 versus its uniformizer multiple reducing to 0. For the boundary test, explicitly test all admitted cusp expansions. These belong in the README, not Suggested.lean.

   **Repair test:** The proposed values distinguish the singular-index condition, application of the normalizing scalar exactly once, and integral primitivity. This is the same missing-construction-API pattern as the previous review's R11, which was fixed at its three named locations but remains here.

Four findings: one P1, two P2 and one P3. The package is repairable. The verdict is not a rejection of its scope or of its declared supplier-gap mechanism.

## Verified sound

### Previous findings, checked individually

The comparison used package revisions b047dd3 and 08f531f. All fourteen earlier findings were checked before the fresh pass. No previous finding was marked “not actionable in this package”; none is being reopened against such a settlement. Quotes below are short repaired passages from the package, not source quotations.

| Previous finding | Repaired passage and location | Status and verification |
|---|---|---|
| R01, unreduced lattice | §0.7, line 331: “reduce it modulo I” | Repaired. N is taken from the reduced middle block, and the finite descent module is distinguished from the unreduced lattice. A free rank-two R-lattice has generic rank 2; its R/π reduction has generic rank 0 and length 2. SU line 2038–2055 and line 2120–2132 support the reduction. |
| R02, trace coefficient | §0.5, line 294: “minus its X coefficient is 10, the trace” | Repaired throughout the changed instances in §§1.3, 1.8, 2.6 and 5.6 and their subsequent uses. The cubic coefficient would give 50, not 10. The native reciprocal-polynomial declaration agrees. |
| R03, Igusa torsor | Contract line 95 and §1.1: “GL₂(ℤ_p) × GL₂(ℤ_p)” | Repaired. SU line 3200–3205 gives the integral Levi group; at level 3 its order is 2304 rather than the torus's 16. The torus is retained only for weights after unipotent invariants. |
| R04, corank-one forms | §§1.1–1.2: “I¹ still vanishes at the genus-zero strata” | Repaired. The corank-one space has zero genus-zero constant term; the unrestricted form with that term 1 is excluded. The q=0 cuspidal space remains distinct. SU line 3237–3244 uses the corresponding boundary ideal. |
| R05, ordinary odd-prime range | Layer 1, line 416: “p is odd and split in K” | Repaired. At p=2, the two nonzero factors ([−1]−1) and ([−1]+1) multiply to zero; at p=3, −1 is outside 1+3ℤ₃. The odd-prime weight-ring usage is consistent. |
| R06, scalar local endomorphisms | §3.1: “N3 is kept as a separate hypothesis”; line 153 declares gap:fw-zeta-local-descent | Repaired conditionally on the declared contract. The envelope branch in §§3.5, 3.7–3.8 is restricted; §§3.9–4.6 explicitly use the wider descent contract for FW's full class. End dimensions 2, 2 and 1 distinguish split, non-absolutely-irreducible and nonsplit-distinct cases. |
| R07, imaginary-quadratic input used over general CM fields | §5.5: “For F = ℚ use gap:katz-cm-padic-l” | Partly repaired. General CM input now has a separate earlier owner and the two-component period is retained. Its new contract is false without the additional field hypothesis in R02. |
| R08, nonvanishing hypotheses | Contract line 111: “W(χ\|·\|_K^(−1/2)) = +1”; §5.5 retains “local μ = 0” | Repaired. The self-dual and non-residually-self-dual Hsieh branches are separated; sign −1 gives L=0, and positive local μ prevents a unit. The ramified-conductor squarefree condition belongs to Theorem A, not B. |
| R09, extra unit restriction on integral BCS endpoint | §7.10: “assume (im)” and “gap:kato-neron-saturated-comparison” | Repaired conditionally on the declared comparison. The E:y²=x³−4x+7, p=5 witness is included despite v₅(10/11)=1. Coefficient-lattice saturation expressly retains the zeta image's arithmetic index. |
| R10, nondiscriminating specialization example | §0.3, line 231: “strictly contained in ℤ_p” | Repaired. For A/(p,T), the two ideals are ℤ_p and (p). The older positive-rank example is correctly labelled as testing only 0=0. |
| R11, missing construction APIs | §§1.5, 1.6 and 2.10 now have “**API.**” and separate Checks | Repaired at all three named locations. Their coefficient, normalization, boundary and weight tests discriminate. The same pattern survives in §5.4: R04. |
| R12, stale Lean headline locators | Suggested.lean names “README §2.14 and §§2.20–2.22” and “§6.6, §7.9 and §7.10” | Repaired. All fourteen endpoint references resolve to their actual README sections. |
| R13, nonexistent Hsieh theorem | sources.toml, Hsieh2012 entry: “Theorems A–B” | Repaired. Hsieh2012 line 82 and line 104 are Theorems A and B; line 1339 is Corollary 6.5, p.22. No Theorem C of this work is used. |
| R14, division by zero pairings | §2.4, line 794: “Only when every d_i and every d_(i,v) used as a denominator is nonzero” | The denominator defect is repaired; the revised formula is only partly sound because of R01. Pairings (1,0,1) give product 0, while (1,2,1) give 2. A local zero still prohibits the quotient. |

### Coverage and computed adversarial pass

There are 92 numbered target sections. Repairs touched 32 of them, as well as conventions, contracts and the module docstring. Those changed passages were rechecked. Unchanged passages used the earlier review only where its target/API rows contain actual computed values; its uncomputed descriptions were not treated as evidence. The fifteen seeded targets were checked afresh against their sources. The compact table below records the seeded targets, all headline endpoints, and the changed patterns and findings. Algebraic models test the interface and normalization; they do not purport to calculate an unknown Selmer group or prove an automorphic theorem.

The changed sections were §§0.3, 0.5, 0.7, 0.9, 1.1–1.3, 1.5–1.8, 2.4, 2.6, 2.10, 2.12, 3.1, 3.7–3.10, 4.1–4.6, 5.5–5.6, 5.13, 7.7, 7.10 and 8.1. The repeated trace, boundary, local-endomorphism and period patterns were also searched outside those passages. No new sorry'd data, algorithms, cyclic ownership or re-planning of an existing roadmap was found. R03 is the remaining route-specific restriction.

| Statement | Instances tried | Values computed on both sides | Result / change |
|---|---|---|---|
| §0.1 and divisorial contract | M=0; M=k⟦x,y⟧/(x,y) | Ch(0)=A; Ch(M)=A but Fitt₀(M)=(x,y) | Determinant/divisorial ideal is not replaced by Fitting. |
| §0.3 specialization | A=ℤ_p⟦T⟧, M=A/(p,T), T↦0 | Image Ch_A(M)=ℤ_p; Ch(M/TM)=(p); 1∉(p) | Correct strict containment; prior R10 repaired. |
| §§0.5, 1.3, 1.8, 2.6, 5.6, trace convention | diag(1,2,3,4); empty and rank-one matrices | det(1−XM)=1−10X+35X²−50X³+24X⁴; trace=10=−coeff₁, not 50; empty gives 1 and trace 0; rank one [a] gives 1−aX | Correct native convention; prior R02 repaired. |
| §0.7 lattice bound, sampled | ℒ=R², I=(π); congruence length 2 | ℒ has generic rank 2, ℒ/Iℒ rank 0 and length 2; v(J)=2 requires Selmer length ≥2, rather than merely ≥1 | Reduction and length direction agree with SU. |
| §0.5 polarization and §5.8, sampled | Middle ranks 1,2; ν(c)=1,−1 | Total ranks 3,4; Φᵗ=−Φ or +Φ; scalar Selmer valuation 0 and v(J)=2 give lower bound 2 | Retains three distinct residual blocks, sign, scalar term and local conditions. |
| §§1.1–1.2 ordinary tower and boundary | GL₂(𝔽₃)², diagonal torus; genus-zero constant term | (9−1)²(9−3)²=2304 versus 2⁴=16; allowed boundary value 0 versus excluded 1 | Integral Levi torsor and corank-one restriction repaired. |
| Layer 1 odd-p convention | Element −1 at p=2 and 3 | At 2, (g−1)(g+1)=0 with g²=1; at 3, −1≡2≠1 | Dyadic weight-ring argument excluded. |
| §1.4 pullback, sampled | Raw coefficient 2, scalar 3; β=diag(1,0), I₂ | C=6 rather than 18; det β=0 and 1 | Raw and normalized series distinguished. |
| §§1.5–1.6 new APIs | N⁻ with 0,1,2 factors; boundary π², unit coefficient | Required odd parity selects 1; v(boundary)≥2 and v(coefficient)=0; zero family has no unit coefficient | New Checks exclude wrong parity and zero congruence witness. |
| §§1.7, 5.5 nonvanishing | Self-dual root number −1; positive local μ=1 | L=−L gives L=0; normalized valuation ≥1 is not 0 | Correct Hsieh branches and unit conditions. |
| §1.10 SU two-variable headline | Ch=(π³), L=π² | Ch⊆(L), since 3≥2; converse would need 2≥3 | Correct direction and source hypotheses. |
| §1.11 SU cyclotomic headline | 11a1 at p=7 versus p=5 | a₇=−2; 7∤v₁₁(Δ)=5; −3≡4 mod7 and 8 mod11; rational 5-torsion excludes p=5 residual irreducibility | Local and residual restrictions retained. |
| §2.4 triple-product normalization | Spherical q=2, parameters (i,−i)³ | L_tri=16/81, L_Ad=512/729, raw=1/2, J=1; current RHS changes by 32/9, LHS by 1 | R01; full global ratio repairs multiplier to 1. |
| §§2.4, 2.12 pairing and coprimality | Pairings (1,0,1)/(1,2,1); ideals (X,Y)/(X,X²) | Products 0/2; heights 2/1; k=2,4 give 1/(k−1)=1,1/3 | Nonzero quotients and joint, not individual, height-one avoidance retained; normalization needs R01. |
| §2.5 CLW bound, sampled | E=(π³), boundary exponent 2 | E⊆(π²); v(E)=3≥2, whereas 3≤2 is false | Corrects source's final sign slip. |
| §2.7 CLW localized headline | A=O⟦S,T⟧ localized over O⟦S⟧ | S and p become units; T need not; (S) disappears and (T) survives | Cyclotomic localization correctly distinguished from p-inversion. |
| §§0.9, 2.8 CLW integrality, sampled headline | p=3, n=7 then 5; H=3, Katz=1 | v₃(φ(7))=1; v₃(φ(5))=0; u/3 has valuation −1 though rational divisibility holds | Integral conclusion cannot follow from rational route; restore missing general target under R03. |
| §2.10 vector-valued family, sampled | (k,m)=(2,0),(4,1); κ=6,k=4 | Weights (0,0,0;κ), (1,−1,−1;κ+1); Γ(5)Γ(6)=24·120=2880; i⁻⁵=−i | Weight reparametrization and gamma/sign factors agree with FW. |
| §2.10 character reparametrization | χ_p(γ)=4, ψ_p(γ)=7 | χ_p⁻¹ψ_p=7/4, not 28 | The inverse character in the source is retained. |
| §2.14 FW reverse headline | Steinberg prime ℓ=11, k=2,4 | −ℓ^(k/2−1)=−1,−11; opposite convention gives +1,+11 | Local sign and ramified witness retained. |
| §2.19 Yager convention | Unramified degree p, x=1; cubic finite-field model | Tr(1)=p, not 1; in 𝔽₂₇ with α³=α+1, coeff₀(y^τ)=α+1=coeff₀(e_τ⁻¹y) | Trace normal-basis and inverse-action conventions agree with LZ14/FW. |
| §2.20 crystalline-short headline | C=[A→ˣA], x↦0; α=β | H⁰(C)=0, but H⁰(C⊗ᴸE)=E and H¹=E; α−β=0 | Derived control and the separate irregular branch avoid false specialization and division by zero. |
| §2.21 ordinary FW headline | Local scalar −1 versus 1 over 𝔽₅ | Invariant dimensions 0 versus 1; (π³)⊆(π²) corresponds to 3≥2 | No-invariants condition and direction retained. |
| §2.22 Wan Rankin–Selberg headline, sampled | Old level at an extra good prime; c=2,j=0,trivial character | Oldspace has two degeneracy vectors; smoothing scalar c²−c²=0 | New-outside-p condition and smoothing denominators cannot be dropped. |
| §3.1 residual predicates, sampled | Split diag(1,2) over 𝔽₅; irreducible X²+2; nonsplit distinct extension | End algebras 𝔽₅², 𝔽₂₅, 𝔽₅, of dimensions 2,2,1 | N3 separated; full FW route uses the declared gap. |
| §3.3 seed points/density, sampled | p=5 quadratic twist; étale versus ramified fibre | ω²(2)=−1 mod5; E×E has nilradical 0, E[u]/u² has nonzero nilpotent u | Twist alternative and restriction to good points matter. |
| §§3.7–3.8 universal zeta and comparison | Σ={p}; add Euler 1−γ; Steinberg local factor | Empty product 1; γ=1+T gives −T; inertia-invariant polynomial degree 1, not 2 | Coefficient descent gap retained; no unsmoothing by a nonunit. |
| §§3.9–3.10 fundamental-line images | t(e)=π⁻¹; ideals A,πA,TA | Dual image π; degree-two norm π²; after p-inversion πA=A but TA≠A | Dual, norm, integral and rational conditions remain distinct. |
| §§4.1–4.2 integrality/unit detection | 1/T, T/p; α=1+T or p+T, T↦0 | Valuations −1 at (T) or (p); specializations 1 versus p | Height-one integrality and local unit tests discriminate. |
| §4.3 universal-family headline | Rank-two finite coefficient extension, scalar π | Norm determinant π², not π | Correct Λ-level statement; full local cases conditional on descent gap. |
| §§4.4–4.5 pointwise headline | t=u², t↦0; naive twist equation 2a≡1 mod(p−1) | Fibre has u²=0 but u≠0; left parity even, right odd | Arbitrary étale specialization and a universal naive critical twist are not substituted for the source route. |
| §4.6 base change | Inertia N=[[0,X],[0,0]], X↦0 | Kernel rank 1 generically, 2 at zero; Tor₁ of A/(X) is E | Full Euler-line base change keeps suitability/Tor restrictions. |
| §4.7 congruences, sampled | m=2, n=1, scalar π | π mod π²≠0, π mod π=0 | Both maps use modulus π^m; source's n is a slip. |
| §5.4 Hilbert family, sampled | Same β and normalization as §1.4; integral coefficient 1 versus π | det β=0/1; coefficient 2→6, not 18; reductions 1/0 | Source range and boundary ideal checked; package needs API/Checks under R04. |
| §5.5 new CM contract | F=ℚ(√3), M=ℚ(ζ₁₂), p=13 | N(D_M/F)=1; 4²≡3 and 5²≡−1 mod13; required discriminant-place set is empty | R02. Positive control ℚ(√29,√−7) has relative discriminant norm 49. |
| §5.6 coefficient Eisenstein ideal | ℤ→𝔽₅, operator 8 versus eigenvalue 3 | Difference 5 maps to 0; I=0 in 𝔽₅ but coefficient kernel E=(5) in ℤ | Contraction remains essential; E is not I or (25). |
| §5.8 ordinary extension, sampled | Congruence valuation 2, scalar Selmer valuation 0 | Middle rank 2 gives total rank 4; ordinary lower bound ≥2; Euler 10/11 at p=5 has valuation 1 | Three-block theorem, scalar term and primitive factors retained. |
| §5.10 Hilbert headline, sampled | p=5, κ₀=2; extended ideal of a positive-rank module | 5≥5 and 2≥2; extended Ch=0 gives 0⊆(L), not torsion | Boundary cases included; genuine divisorial ideal distinguished from zero convention. |
| §5.13 auxiliary fields, sampled | p=5, ℓ=19 inert / 11 split | q_v=361≡1 / 11≡1; using 19 gives −1≡4 | Correct residue-cardinality tests. A prime dividing D_K gives finite ramification since it cannot divide D_F. |
| §6.6 early product headline | Rational divisibility with analytic μ=0; contrast μ=1 | At (p), required 0≤length is automatic; 1≤0 would fail | μ=0 restores exactly the missing prime inequality. No later equality is used. |
| §7.4 analytic factorization, sampled | Discriminant −7 at p=5; period multiplied by 5 | v₅(√7)=0, but v₅(5)=1; integral Néron-area identity differs by √7 before taking p-adic unit ideals | Unit tracking supports ideal equality; literal unscaled complex-period equality is not used. |
| §§7.7–7.10 Kato and BCS headlines, including sampled §7.9 | E:y²=x³−4x+7 at p=5 | #E(𝔽₃)=7, #E(𝔽₅)=4; a₃=−3,a₅=2; Δ=−16·11·97; Frobenius discriminant 2 mod5; v₅(10/11)=1 | Rational endpoint has exactly irreducibility/good ordinary; integral endpoint retains (im) and the saturated-comparison contract. |
| §7.10 image condition | σ=[[1,u],[0,1]], u=1 then p; odd-p quadratic twist | Cokernels ℤ_p versus ℤ_p⊕𝔽_p; σ² has off-diagonal 2u | Free rank one, not rational rank one; squaring preserves it at odd p. |
| §7.8 and §8.1 aggregate | Four defects d_i≥0, sum≤0; omit individual inequalities | Necessarily all d_i=0; exponents J=(1,1,0,0), L=(2,0,0,0) have equal sums 2 but unequal factors | Factor separation needs all four one-sided bounds and nonzero factors; restored endpoint uses them. |

### Seeded source verification

All fifteen sampled sections had readable controlling texts. Source statements were compared with the package's hypotheses, map/ideal directions and normalizations, not merely their theorem numbers. The following locators use the cached versions identified in sources.toml; BCS published pagination is distinguished from arXiv v2.

| Sampled target | Source text opened | Outcome |
|---|---|---|
| 0.7 | SU line 2012–2055, line 2120–2132 and line 2210–2220, §§4.3–4.4, especially (4.4.1.a–c) and Proposition 4.4.5, pp.53–59 | Reduced middle module, finite descent and length orientation match the repair. |
| 1.4 | SU line 4968–4983, Lemma 9.3.2/Proposition 9.3.3, pp.125–126; line 5784–5802, Proposition 11.2.3, p.144; line 7627, (11.7.5.a), p.181; line 8725–8735, Theorem 12.4.2, p.203 | κ>6 and the raw/normalized distinction are present. Integral singular coefficients belong to the period-normalized family. |
| 2.5 | CLW line 6143–6149 and line 6210–6214, Theorem 8.1.1, pp.77–78; CLW-addendum line 351–364, Theorem 5.0.1, p.6 | Correct ≥ direction; the indexed family may depend on the height-one prime. |
| 2.8 | CLW line 6217–6249 and line 6367–6385, Theorem 8.2.1(2), pp.78,81; CLW-addendum line 368, Theorem 5.0.2, p.6; HT94 line 159–165; Hid06 line 58 | Localization and source-proof restrictions are accurately noticed, but the planned integral scope is too small: R03. |
| 2.10 | FW line 5199–5228, Proposition 7.19, p.88; line 5233–5253, reparametrization and interpolation; line 5282–5292, Corollary 7.21/Lemma 7.22, p.89 | Fixed representation weight, translated character, gamma factors, periods and boundary product retained. |
| 2.22 | Wan-2020 line 76–114, Theorems 1.1–1.2, pp.2–3 | p≥5, local newness, residual/ordinary conditions, level and character restrictions retained; no arbitrary-family theorem substituted. |
| 3.1 | FW line 923–929, Assumption 2.1, p.17; assumptions/theorems cited in §3.1; NAK Theorem 1.1/Remark 1.2, pp.4–5 | Correct distinction between FW predicates and scalar End; the broader descent is an explicit gap. |
| 3.3 | FW line 939–965, Lemma 2.2, p.17; line 1143–1181, Lemma 2.8, pp.20–21; line 1694–1735, Proposition 3.16, pp.29–30 | Crystalline-short/ordinary alternatives and quadratic twist retained; no global smoothness claim. |
| 4.7 | NAK line 3360–3398, Corollary 5.6, p.77 of v2 | Euler-corrected maps, common residual representation and common modulus m match. |
| 5.4 | Wan-2015 line 3394–3427, Theorem 82, pp.66–68; line 3597–3611, Theorem 88, p.71 | Integral canonical-period family and degenerate coefficients match; required API/Checks are missing under R04. |
| 5.8 | Wan-2015 line 4290–4345, §9.2.1/Proposition 98, pp.84–86; line 4357–4409, Theorem 100 and twist dictionary, pp.87–88 | Ten hypotheses, local ordinary polynomial comparison, coefficient intersection and scalar Selmer term are retained. |
| 5.10 | Wan-2015 line 4411–4452, Theorem 101, pp.88–89; BCS published Theorem 3.2.1, pp.7–8 | Parallel weight, Δ, squarefree/parity, residual ramification and normal coefficient ring are retained; weight two and p=5 are included. |
| 5.13 | Wan-2015 line 4526–4564, Theorem 103/proof, pp.91–92; BCS published line 513–568, Proposition 5.2.1/Lemma 5.2.3, pp.11–12; Fujiwara Definition 6.11, pp.54–55 | Minimality is a precise supplier contract; field conditions discharge Δ and the local q_v tests. |
| 7.4 | CGS23 line 358–377, Definition 1.2.2/Remark 1.2.3/Proposition 1.2.4, pp.7–8; BCS published line 574–583, p.12 | Integral ideal factorization is compatible with the retained discriminant and Néron-period units. The source's literal area equality has a missing factor. |
| 7.9 | BCS published line 63–73, Theorem 1.1.2, p.2; line 569–590, proof, p.12 | Rational equality needs no surjectivity or extra multiplicative prime; integral equality is separately conditioned on (im). |

The additional changed-source checks included SU's Igusa definition (line 3200), Hsieh2012 Theorems A–B and Corollary 6.5, Wan-2015 Proposition 96, and the two competing triple-product normalizations. LZ14 and LZ16, already cited in prose but absent from this manifest, were fetched through the sources service. Their §3.2 and Theorem 7.1.5/Remark 7.1.6 were read. The manifest now has 41 unique works; all 39 author-recorded entries remain a byte-identical prefix. No source extraction was copied into the repository.

### Headline and Lean acceptance-test audit

The README endpoints are §1.10, §1.11, §2.7, §2.8, §2.14, §2.20, §2.21, §2.22, §4.3, §4.5, §5.10, §6.6, §7.9 and §7.10. Suggested.lean names all fourteen in its module docstring. The substantial intermediate constructions—lattice-to-Selmer comparison, Eisenstein families and universal zeta morphism—likewise require arithmetic carriers beyond simple native definitions.

The absent carriers are actual Iwasawa Selmer modules with their local conditions, their characteristic divisors, the normalized automorphic p-adic L-functions, Hida/deformation families and their zeta/determinant comparisons. Native continuous H¹, coefficient power series, Fitting ideals and fixed 2-descent Selmer groups do not supply those carriers. Replacing the endpoints by inequalities between arbitrary ideals or free Prop fields would be a stand-in. No such replacement is present.

Suggested.lean has 44 lines, one `import Mathlib`, one module docstring, an empty namespace and no declarations. It has no sorry'd data, set_option, lemma, examples, placeholder propositions or cross-roadmap imports. There are zero named declarations for the requested elaborated-signature comparison and zero sorried theorems for the one-tactic probe; both audits therefore have zero instances. No padding was found. The absence of a TauCeti import is appropriate because no Tau Ceti declaration occurs in an elaborated term.

The prescribed `lake env lean` invocation on packages/AutomorphicCongruences/Suggested.lean, run from the pinned content checkout, exited 0 with no diagnostics or warnings. No targeted Tau Ceti build was required, and no Lean process remains running. This is an elaboration result, not evidence that the README's mathematical formulas are true.

### Dependency and ownership audit

The requested dependency command, using the supplied order and `--movable`, returned:

```text
depcheck: 51 roadmaps, 611 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Every Needs line was inspected, including internal routes that use the new gaps. The BCS early product bound precedes four-factor separation; ModularIwasawaMainConjectures and the Heegner endpoint are consumers, not hidden suppliers. A conditional supplier request was not treated as an unowned prerequisite.

All fifteen gap slugs and needs sentences agree between the README and plan. Each has a named earlier owner. The two new comparison gaps for FW descent and saturated Kato/Néron comparison specify actual maps, lattices, local factors and compatibility, rather than assuming the final endpoint. The new general-CM gap is distinct from the F=ℚ contract, but requires R02. The other contracts retain their stated prime, regularity, coefficient and local hypotheses. Their present absence is not a finding.

The source/main revisions were checked anew: content main 86e155cac97365a2b24380c270383cd1d01628be, Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The board index was read before any absence claim. Fresh citation resolution reported only KatoEulerSystems as absent from its main/open index. This is an index miss: its README was read at the supplied board head a3ba9c5, and all cited sections resolve there. The resolver did not inspect the pinned libraries; those were searched and opened directly as recorded below.

Ownership was searched by object through the roadmap service across main and available open heads, and in the board packages/design READMEs. In particular:

- PadicFamilies owns projectors, congruence modules, period lines and the existing Hilbert Hida theory. Its §§5.6–5.9 have the even-degree restriction, so the odd-degree contract is additional. The Klingen-specific interpolation and integral comparisons remain here.
- IntegralHeckeAndGaloisDeterminants owns generic Hecke images, determinants and the two-character rank-two Ribet input. Its Layer 6 does not supply the polarized three-block 1+n+1 theorem; middle ranks 1 and 2 produce ranks 3 and 4 here.
- PELModuli, ShimuraCompactifications, AutomorphicBundles and IgusaVarietiesAndTorsionConcentration own the geometric carriers. HigherHidaAndColemanTheory's supplied design treats different higher/cohomological constructions and explicitly does not provide the general unitary integral extension; it is not a second owner of these source-specific ordinary towers or families.
- MetaplecticAutomorphicForms owns doubling, Jacobi extraction, theta and Rallis machinery. The searches for triple-product/Ichino objects found related Gan–Ichino and Ichino–Prasanna constructions, not this three-GL₂ period formula. The formula here remains this roadmap's target and requires R01.
- PadicHodgeRegulators and PhiGammaModulesAndIwasawaCohomology provide regulators and relative local complexes. They do not supply the trace-compatible Yager module or the global finite-slope/irregular FW comparison stated here. The Rubin–Yager reference in NoncommutativeAndEquivariantIwasawa concerns a different CM main-conjecture object.
- CompletedCohomologyAndLocalGlobalCompatibility §4.7 and PadicLocalLanglandsForGL2Qp §§5.8–5.9 retain scalar local endomorphisms. Their new Part II design texts concern density/capture and Drinfeld-type geometry, respectively; they do not supply the requested full FW zeta descent. KatoEulerSystems owns the full-level classical classes. The universal automorphic zeta-morphism application is assigned to this roadmap in ModularIwasawaMainConjectures §§2–4 and its supplier contract.
- SmoothRepresentationsOfLocalGroups §SR.5.2 has the conditional family interface; the unconditional fixed-conductor essential-vector contract is additional. AutomorphicGaloisRepresentationsPartII AG2.2 has the base-degree restriction, so the imaginary-quadratic unitary extension is additional.
- KatoEulerSystems §§6.6 and 7.4 retain the unsaturated scalar and Euler factors. The new contract asks for the coefficient-lattice/local-cone comparison that those sections do not supply; it does not request their existing zeta classes again.

No second owner of a retained construction was established. Suggested.lean has no fully qualified declaration names and hence no name collision. The findings concern mathematical scope and formulas, not the existence of ordinary foundational notions already imported by name.

### Resolved supplier sections

All 177 section/layer references below were resolved in fresh copies of the 35 named supplier READMEs. The numbers after @ are repository file lines. Kato uses the board head described above; the others use main or the supplied new-roadmap heads through the roadmap service.

| Supplier README | Sections/layers and file lines |
|---|---|
| TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md | 4.1 @ 2361; 4.4 @ 2530; 4.6 @ 2710; 5.1 @ 3172; 6.5 @ 3897 |
| TauCetiRoadmap/SelmerIwasawaCohomology/README.md | 2.1 @ 346; 2.7 @ 492; 2.8 @ 519; 2.8a @ 546; 2.9 @ 562; 2.10 @ 589; 2.12 @ 645; 2.13 @ 713; 2.19 @ 817; 2.21 @ 845; 2.23 @ 914; 2.24 @ 932; 3.1 @ 1358; 3.2 @ 1390; 3.5 @ 1439; 3.8 @ 1496; 3.9 @ 1522; 3.10 @ 1547; 3.11 @ 1567; 3.12 @ 1585; 3.13 @ 1604; 3.14 @ 1616; 3.16 @ 1743; 3.17 @ 1755; 3.18 @ 1773; 3.19 @ 1797; 3.20 @ 1815; 4.7 @ 1865; 4.10 @ 1935 |
| TauCetiRoadmap/ArithmeticGaloisDuality/README.md | R02.4.3 @ 3324; D7.1 @ 4540; D7.3 @ 4910; D7.4 @ 5220; D7.5 @ 5404 |
| TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md | 4.4 @ 1675; 4.5 @ 1701; 5.4 @ 1864 |
| TauCetiRoadmap/ProfiniteCohomology/README.md | Layer 7 @ 1168 |
| TauCetiRoadmap/EllipticCurves/README.md | Layer 2 @ 647; Layer 7 @ 1262 |
| TauCetiRoadmap/NumberFieldArithmetic/README.md | 1.1 @ 489 |
| TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md | 1.3 @ 2201; 1.4 @ 2375; 2.1 @ 2829; 2.2 @ 2894; 2.3 @ 2954; 3a.1 @ 1661; 4.1 @ 3170; 4.2 @ 3225; 5.3 @ 3477; Layer 6 @ 3545 |
| TauCetiRoadmap/IntegralIwasawaTheory/README.md | 5.0 @ 586; 12.1 @ 1587 |
| TauCetiRoadmap/DirichletPadicLFunctions/README.md | 2.8 @ 614 |
| TauCetiRoadmap/PELModuli/README.md | M5.5 @ 3631; M5.6 @ 3673 |
| TauCetiRoadmap/ShimuraCompactifications/README.md | C5.3 @ 2290; C5.15 @ 2538; C5.16 @ 2572 |
| TauCetiRoadmap/AutomorphicBundles/README.md | B5.1a @ 4567; B5.7 @ 4790; B5.14 @ 5033; B5.15 @ 5103 |
| TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md | Layer IG.0 @ 117; Layer IG.1 @ 866; Layer IG.2 @ 1089 |
| TauCetiRoadmap/MetaplecticAutomorphicForms/README.md | 3.3 @ 618; 6.2 @ 1553; 6.10a @ 1674; 6.11 @ 1688; 6.12 @ 1706; 6.13 @ 1714; 6.17 @ 1746; 6.19 @ 1786; 6.20 @ 1804 |
| TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md | Layer AL.3 @ 1950 |
| TauCetiRoadmap/AutomorphicSpectralTheory/README.md | 1.2 @ 912; 2.4 @ 1600; 4.3 @ 2352 |
| TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md | Layer AG2.2 @ 1203; Layer AG2.5 @ 1758; Layer AG2.6 @ 2036 |
| TauCetiRoadmap/PadicFamilies/README.md | 0a.11 @ 359; 0a.15 @ 429; 0a.16 @ 443; 0a.19 @ 485; 0a.22 @ 541; 1.3 @ 1080; 1.7 @ 1159; 1.8 @ 1192; 1.10 @ 1262; 1.11 @ 1289; 4.0.1 @ 2353; 4.0.2 @ 2369; 4.0.3 @ 2382; 4.1 @ 2395; 4.6 @ 2529; 4.9 @ 2596; 5.1 @ 2639; 5.6 @ 2759; 5.7 @ 2784; 5.8 @ 2798; 5.9 @ 2822 |
| TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md | 1.1 @ 1303; 1.3 @ 1404; 2.5 @ 1742 |
| TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md | 9.15 @ 5480; 9.21 @ 5602 |
| packages/KatoEulerSystems/README.md | 0.1 @ 435; 2.1 @ 708; 2.2 @ 756; 2.3 @ 799; 4.1 @ 1110; 4.2 @ 1180; 4.3 @ 1253; 4.4 @ 1302; 5.1 @ 1449; 5.3 @ 1519; 5.4 @ 1550; 6.6 @ 1835; 7.2 @ 1939; 7.4 @ 2021 |
| TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md | 8.16 @ 5114 |
| TauCetiRoadmap/EulerSystemsCyclotomicMainConjecture/README.md | Layer 3 @ 2339 |
| TauCetiRoadmap/PadicHodgeRegulators/README.md | 1.2 @ 455; 1.10 @ 600; 8.8 @ 1697; 8.18 @ 1861; 8.19 @ 1883; 8.22 @ 1933; 9.22 @ 2258 |
| TauCetiRoadmap/OrdinaryAutomorphicFormsAndModularityLifting/README.md | 3.28 @ 1199; 3.29 @ 1233; 4.13 @ 1796; 4.14 @ 1816; 4.15 @ 1838; 4.16 @ 1860; 5.6 @ 2125 |
| TauCetiRoadmap/GlobalGaloisDeformations/README.md | 3.7 @ 574; 3.8 @ 640; 4.1 @ 694 |
| TauCetiRoadmap/LocalGaloisDeformationRings/README.md | F.2.5 @ 691; F.2.9 @ 864; 1.1 @ 1293; 3.4 @ 2415; 6.12 @ 3370; 8.3 @ 4021 |
| TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md | 3.1 @ 526; 3.4 @ 615; 6.2 @ 1234; 7.3 @ 1382 |
| TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md | 4.1 @ 1320; 4.4 @ 1463; 4.5 @ 1491; 4.7 @ 1545; 6.2 @ 2111 |
| TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md | 5.5 @ 1882; 5.7 @ 1942; 5.8 @ 1964; 5.9 @ 2000; 5.11 @ 2058; 6.1 @ 2243; 6.6 @ 2348 |
| TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md | SR.5.2 @ 3732 |
| TauCetiRoadmap/GL2ModularityLifting/README.md | 5.16 @ 1491; 7.8 @ 2101; 8.7 @ 2321; 8.8 @ 2341; 10.5 @ 2553; 12.1 @ 2835 |
| TauCetiRoadmap/ClassicalSerreModularity/README.md | Layer R27.6 @ 850 |
| TauCetiRoadmap/SerreWeightAndLevelOptimisation/README.md | 2.13 @ 621 |

### Native declarations opened at the pins

These are direct source reads, including the pertinent binders. Native definitions were checked for what they omit as well as what they provide. The searches for Hida-family, Klingen, Katz-function, universal-zeta and Iwasawa-Selmer objects found no native carrier supplying the missing endpoints. This does not assert that the pins lack ordinary power-series rings, cohomology or elliptic curves.

| Pinned file and line | Declaration and relevant scope |
|---|---|
| Mathlib/RingTheory/Length.lean:30 | Module.length is the ℕ∞-valued dimension of the submodule lattice; finiteness is not automatic. |
| Mathlib/Algebra/Module/LocalizedModule/Basic.lean:88 | LocalizedModule is OreLocalization S M; no finite-generation or freeness claim is built into it. |
| Mathlib/RingTheory/Ideal/Maps.lean:80,185,654,769 | Ideal.mem_comap, Ideal.map_span, Ideal.map_mul and RingHom.comap_ker supply contraction, generators, products and composite kernels. They do not assert arbitrary kernel/base-change equality. |
| Mathlib/RingTheory/Ideal/Span.lean:100 | Ideal.span_singleton_mul_left_unit requires IsUnit of the multiplier. At p=5, 2 qualifies and 5 does not. |
| Mathlib/RingTheory/Ideal/Quotient/Operations.lean:89,93,133 | RingHom.quotientKerEquivOfSurjective and its apply_mk rule require actual surjectivity; Ideal.mk_ker identifies the quotient kernel. Constants ℤ→ℤ[X] do not qualify. |
| Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:132,143,147,150 | Matrix.charpoly is det(XI−M); empty matrices give 1, zero matrices give X^n, diagonal matrices give the product of linear factors. |
| Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:138,290,334 | trace_eq_neg_charpoly_coeff requires nonempty index type; charpolyRev is det(1−XM); coeff_charpolyRev_eq_neg_trace uses coefficient 1, including the empty case. |
| Mathlib/RingTheory/MvPowerSeries/Basic.lean:86 | MvPowerSeries is the function carrier (σ→₀ℕ)→R. Finiteness of σ, noetherianity, domain and coefficient topology are additional hypotheses. |
| Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56 | IsDiscreteValuationRing includes local PID structure and a nonzero maximal ideal on a domain. It includes neither completeness nor finite residue field. A field is excluded. |
| Mathlib/RingTheory/LocalRing/Defs.lean:30 | IsLocalRing extends Nontrivial, excluding the zero ring; it does not imply noetherianity. |
| Mathlib/RingTheory/RegularLocalRing/Defs.lean:51 | IsRegularLocalRing includes local/noetherian hypotheses, not completeness. |
| Mathlib/Algebra/GroupWithZero/Basic.lean:191; Mathlib/RingTheory/UniqueFactorizationDomain/Defs.lean:131 | IsReduced excludes nonzero nilpotents; UniqueFactorizationMonoid supplies the factorization predicate. Neither supplies arithmetic deformation structure. |
| Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean:161 | selmerGroup is a multiplicative K×/K×ⁿ valuation subgroup, not an elliptic Iwasawa Selmer module. |
| TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:712 | TauCeti.ContCohomology.H1 is the quotient of continuous cocycles by coboundaries. It is not equipped here with arithmetic Selmer local conditions. |
| TauCeti/RingTheory/FittingIdeal/Basic.lean:343; TauCeti/RingTheory/FittingIdeal/BaseChange.lean:134 | fittingIdeal has explicit finite-module input; fittingIdeal_baseChange works for arbitrary scalar extension. Neither supplies a divisorial characteristic ideal or an invertible perfect-complex determinant. |
| TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:952 | quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map gives the character-equivariant point comparison. The p-power torsion limit and ordinary filtration still need the roadmap's comparisons. |
| TauCeti/NumberTheory/Multiquadratic/MultiquadraticSplitting.lean:199 | NumberField.ncard_primesOver_multiquadratic_iff assumes a finite generating family, an odd prime and coprimality with the radicands. It verifies splitting, not auxiliary-field existence. |
| TauCeti/NumberTheory/Multiquadratic/Galois/Basic.lean:190 | TauCeti.Multiquadratic.isGalois uses NeZero (2:K). The inseparable characteristic-two case is excluded. |
| TauCeti/NumberTheory/Multiquadratic/Prime/Discriminant/Basic.lean:50 | oddPrimeDiscriminant is a total if-expression: inputs 0,1,2 give 0,1,−2. Its odd-prime interpretation needs the separately stated prime hypothesis. |
| TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104 | selmerGroup₂ is the fixed 2-descent norm kernel with local conditions. It is not the p-primary ordinary Selmer dual over a cyclotomic tower. |

The README's general shape was compared with the main PadicMeasuresIwasawaAlgebras and ProfiniteCohomology roadmaps. It has the required summary, scope, conventions, contracts, build paragraph, nine ordered layers with Examples/Dependencies, consumers and references. Definitions and theorem routes were distinguished when checking the API requirement; R04 identifies an actual construction lacking its promised interface. No artificial minimum size was imposed on the Lean file.

## Not verifiable

- **Ichino2008**, Theorem 1.1: settled as waived. Its primary text's full number-field generality was not independently certified. The finite Euler-factor inconsistency in R01 is independently visible in the readable Wan-2020 and CLW texts and its explicit local computation.
- **Ikeda1994**, the dense-image Fourier–Jacobi theorem at the package's locators: settled as waived. FW's use was checked; the primary proof was not available.
- **Harris1984**, Theorem 2.5.6: settled as waived. CLW/FW's application of CAP exclusion was checked, not the primary proof.
- **Rubin2000**, the Euler-system bound at the package's locators: settled as waived. The exact supplier interfaces were checked; the monograph was not independently read.
- **BST19**, the cited Beilinson–Kato nonvanishing input: settled as waived.
- **Hung2017**, Hilbert toric-period nonvanishing: settled as uncertified/paywalled. Its locator and role were retained without guessing the text.

These six statuses were not reopened and no new missing-source request remains. The sampled primary texts were readable. No source or repository text was treated as an instruction to execute supplied code, change scope or contact others. For §5.10 the cached PDF page 88 was also rendered: it confirms p≥5 and κ₀≥2, where extraction drops the equality bars. Wan-2020 PDF page 80 confirms that R01 is present in the printed formula, not an extraction artifact. CGS23 v2 was additionally fetched through the sources service under the same key; line 390–422 confirms the corresponding Definition 2.2.2, Remark 2.2.3 and Proposition 2.2.4, pp.7–8. The author-recorded manifest entry was kept unchanged. There is no claim to have proved the deep arithmetic targets or the newly declared supplier contracts during this review.

## Source issues

- **Misprint** in SU at Proposition 7.2.1 proof, printed p.101 (SU line 3952): the source says the degree-2n−1 coefficient of the reciprocal Euler polynomial gives minus trace; it should use degree one, or the reversed monic polynomial; affects the proof.
- **Misprint** in SU at §6.5.3, printed p.98 (SU line 3820): the source says the Eisenstein ideal is the quotient of the coefficient map; it should be its kernel, consistent with the following quotient isomorphism; affects nothing.
- **Error** in FW at the paragraph after Assumption 2.1, printed p.17 (FW line 928): the source says local endomorphisms are scalar unless the semisimple characters coincide; it should also exclude split distinct characters and irreducible representations that are not absolutely irreducible; affects the proof.
- **Misprint** in FW at Proposition 3.16 proof, printed p.30 (FW line 1730): the source says the nonzero-zeta locus has positive codimension; it should say the zero-zeta locus; affects the proof.
- **Gap** in FW at the paragraph after Definition 3.18, printed p.31 (FW line 1798): the source says the earlier perfect-complex result gives unrestricted base change of the full Euler-corrected line; it should justify local Euler-line compatibility or retain the suitability restrictions of Proposition 3.20; affects the proof.
- **Misprint** in CLW at Theorem 8.1.1 proof, printed p.78 (CLW line 6212): the source says the congruence ideal's valuation is at most m after proving containment in P^m; it should say at least m; affects the proof.
- **Gap** in CLW at Theorem 8.2.1(2) proof, printed p.81 (CLW line 6380): the source says the cited CM main-conjecture results give integral congruence comparison for the full stated range; it should justify p=3 and nonunit tame/exceptional factors not covered by those cited integral results; affects the proof.
- **Misprint** in CLW at Theorem 8.2.1(2) proof, printed p.81 (CLW line 6380): the source says distinguishedness twice in listing its two residual hypotheses; it should list irreducibility and distinguishedness; affects nothing.
- **Error** in Wan-2020 at §8.4 triple-product formula, printed p.80 (Wan-2020 line 4074–4079): the source says partial global L-functions multiply already normalized local integrals; it should use full global L-functions, or consistently partial zeta/L-functions with raw local integrals; affects a stated result.
- **Misprint** in Hsieh2012 at the paragraph after Theorem A, printed p.2 (Hsieh2012 line 90): the source says the positive-root-number assumption is equivalent to condition V; it should be equivalent to failure of V for the self-dual character; affects nothing.
- **Misprint** in NAK at Corollary 5.6 proof, printed p.77 of v2 (NAK line 3391): the source says the second specialization is reduced modulo ϖ^n while the target is O/ϖ^m; it should reduce both modulo ϖ^m; affects the proof.
- **Misprint** in BCS at Lemma 5.1.1 proof, printed p.10 published (BCS published line 488): the source says both Shapiro summands are cohomology over M; it should put the two twisted summands over K; affects the proof.
- **Misprint** in CGS23 at Remark 1.2.3, printed p.7 of v1 (CGS23 line 364–369): the source says the modular Néron-area identity uses Ω_E/K without an additional discriminant scalar; it should include √|D_K| with that definition of Ω_E/K; affects a stated result.

- **Misprint** in CGS23 at Proposition 2.2.4 proof, printed p.8 of v2 (CGS23 v2 line 420): the source says the period was defined in Remark 2.3.2; it should refer to Remark 2.2.3; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "08f531f687445e2831d08a6202621df021607d25", "job": "REV-PKG-AutomorphicCongruences~3", "model": "gpt-6-astra", "worker": "chris-12"} -->
