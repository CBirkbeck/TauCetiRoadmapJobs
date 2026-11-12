<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13001#issuecomment-6790434285 -->
Review (codex) of ddb9232

Verdict: needs_changes

1. **F01** (P2) The second auxiliary switch is missing for m = 2

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:1534`, :1572 and :1588. The standing range is “`n ≥ 1` and `m ≥ 2`”, but the target constructing both auxiliary systems begins “Let `m > 2`”.

   **Claim:** The Summary and §§9.8–9.11 supply the auxiliary systems `R_aux` and `S_UA`, including the rank-two variant.

   **Witness:** At `(n,m)=(3,2)`, §9.11 constructs rank-two `R_aux`; §9.10 excludes m=2, so no target constructs rank-six `S_UA`. BCGNT25 line 3318 starts the common second switch after the rank-two alternative at line 3293.

   **Exact repair:** Separate the first construction of `R_aux` from the subsequent construction of `S_UA`. Supply `R_aux` for m>2 by the Dwork family and for m=2 by the twisted modular curve, then state the second construction for both, using the rank-nm Dwork family when nm>2. Carry the splitting of the places above prp₀q, the required local good-reduction/ordinary/component conditions and residual trivializations through the modular-curve branch too. For the allowed boundary `(n,m)=(1,2)`, give the second switch using the rank-two modular-curve interface, rather than calling the undefined rank-two Qian system. Put these targets in dependency order and preserve any moved section ids with an old-to-new mapping.

   **Repair test:** For `(3,2)`, `Sym²R` has weights `{0,2,4}` and determinant ε⁻⁶. Tensoring with `R_aux`, of weights `{0,1}` and determinant ε⁻¹, gives rank 6, weights `{0,1,2,3,4,5}`, determinant ε⁻¹⁵ and a skew-Hermitian residual form. These satisfy the rank-six second-stage interface. For `(1,2)`, the weights are `{0,1}`, determinant ε⁻¹ and the required q-level is `H¹(A,𝔽_q)`; this needs the modular-curve branch. Neither case is supplied by merely defining the tensor product. This is the remaining part of previous F04, not a request to redo the repaired tensor calculation.

2. **F02** (P3) Rank zero does admit a multiplier function

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:236`: “For `n = 0` every scalar satisfies `M†M = a·1`, so no multiplier function exists”.

   **Claim:** The rank-zero equation prevents the existence of a multiplier function.

   **Witness:** Over 𝔽₉/𝔽₃, GL₀ has one element. The function ν(1)=1 is a homomorphism satisfying the equation. Both a=1 and a=2 satisfy that equation; it fails to determine a, rather than preventing a function.

   **Exact repair:** Keep n≥1 in the definition, but replace this Check by the precise failure of scalar uniqueness: over 𝔽₉/𝔽₃ in rank zero, a=1 and a=2 give the same empty matrix. Do not claim nonexistence of a function. If stating the failure generally, require #k>2; over 𝔽₂ the unit group is a singleton.

   **Repair test:** In rank zero both sides are the unique empty matrix for a=1 and a=2. In rank one, M=1 forces a=1 by its diagonal entry. This tests exactly why the positive-rank definition determines its multiplier.

3. **F03** (P3) The Hodge-grade proof reverses the wraparound count

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:1205`: “increases by one … because … exactly one entry wraps around at each such step”.

   **Claim:** One wraparound produces the increment of one in the normalized sum defining the Hodge grade.

   **Witness:** N=5, a=(1,0,0,0,4): at d=2 the representatives are (3,2,2,2,1), sum 10; at d=3 they are (4,3,3,3,2), sum 15. No entry wraps, and the grade increases 1→2.

   **Exact repair:** Write that when d≡ab for b∈B, no entry equals N, so all N representatives increase by one and the grade increases by one. Otherwise, for 1≤d<N, exactly one entry equals N; its wrap subtracts N from the total increment N, leaving the grade unchanged. Keep the stated Hodge formula, and add the two steps below as the discriminating Check. QIAN23 lines 1002–1004 explicitly distinguish these cases.

   **Repair test:** At d=1 the same datum gives (2,1,1,1,5), sum 10; the step 1→2 has one wrap and grades 1→1. The step 2→3 has zero wraps and grades 1→2. The corrected explanation agrees with both the formula and the existing self-dual example.

4. **F04** (P1) Prescribed CM infinity types are attributed to a supplier that does not construct them

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:1547`: “Algebraic Hecke characters of a CM field with prescribed infinity type exist (GlobalNumberFields Layers 9–10)”.

   **Claim:** The character Ψ₀ required in §9.8 is available from the cited supplier, before finite-order corrections.

   **Witness:** `TauCetiRoadmap/GlobalNumberFields/README.md:508` and :531 define characters and infinity types; :555–560 prove properties of existing characters. They contain no prescribed-type existence theorem. PotentialModularityAndCompatibleSystems, PR #1075, `TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md:918`, only constructs quadratic induction over a totally real base.

   **Exact repair:** Replace the asserted import by a declared, minimal supplier gap owned by GlobalNumberFields, with the same slug in the plan and its README contract. The needed theorem is: for a CM number field L and integers a_τ indexed by its complex embeddings, if a_τ+a_(cτ)=w is independent of τ, there exists an algebraic Hecke character whose connected-infinity restriction is ∏τ τ(x)^(−a_τ). Arbitrary additional finite conductor is allowed. This does not request new character carriers, reciprocity, avatars or finite local corrections. Cite the existing finite-local-character extension separately for the unramified and wild restrictions. Do not invoke the quadratic theorem §3.1 as an arbitrary-degree determinant theorem: state the determinant calculation for §9.8's induction and use the already cited finite-order root correction. Give the new gap a primary locator and show the compatibility of this specific infinity type.

   **Repair test:** For m=3 the three conjugate pairs of exponents are (2,0), (1,1), (0,2), all with sum 2; their pullbacks to L₁ remain compatible. The new existence contract applies and induction has rank 3. The quadratic supplier instead produces rank 2 over a totally real field, whereas F₁ here is CM. Types with pair sums 2 and 1 fail the corrected contract, so it does not assert unrestricted prescribed-type existence.

   **Pinned and ownership check:** `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Algebraic.lean:60` defines algebraicity for an existing χ; `UnitCompatibility.lean:144` starts with χ and its matching infinity type; `Purity.lean:112` derives equal pair sums from χ. None reverses these quantifiers. Searches of the main and open roadmaps locate finite-character extension and the restricted crystalline-character construction in AutomorphicGaloisRepresentationsPartII AG2.0 (PR #1006, `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:919`), whose split-place prescription is not this general existence statement. The gap therefore extends the named character supplier without replanning its existing carriers. This is an undeclared prerequisite, not one of the three settled declared gaps.

Four findings: one P1, one P2 and two P3. The package is repairable. The acceptance file elaborates, and the dependency check passes. Eight previous findings are repaired; F04 is partly repaired because its newly explicit parameter range still has an uncovered second switch.

## Verified sound

### Previous findings checked first

Locations below are in `packages/PotentialAutomorphyDworkMotivesPartII/README.md`. The previous repair report marked all nine findings applied; none was marked not actionable. Each repair was checked against its original witness, and the repaired pattern was searched elsewhere in the package.

| Previous finding | Repaired passage | Assessment and counterexample test |
|---|---|---|
| F01, missing coefficient places | :44, “Rational coefficients … are taken at every finite place”; :521 rational projectors; :1330 all-place families | Repaired. At N=401 the denominator 401³⁹⁹ is invertible in M_λ even at λ over 401. Members at 2 and 401 now exist, with crystalline and de Rham assertions respectively. The all-place construction is propagated through §§2.3,2.5,3.1,3.4–3.6,6.8,7.4–7.7,7.11 and 9.10. Integral/residual restrictions remain separate. |
| F02, duplicated torsion-freeness | :498, “Integral Betti cohomology”; :504 uses “EtaleDualityAndPerverseSheaves §4.3(c)” | Repaired. The retained theorem is the integral Betti comparison corollary. A quadric has H²=ℤ², and a Fermat quintic has middle Betti rank 204; the general étale theorem and family form are imported, not replanned. |
| F03, ordinary locus | :1367, “`U = V ∩ g⁻¹(T_{1,k(v)}[1/u])`” | Repaired. The nonordinary polygon (3/2,3/2,0) still has trace-unit-compatible minimum 0 and total 3, but has gap 3/2; V now excludes it. The map's domain excludes t=0. |
| F04, undefined auxiliary data | :1534 fixes R, n and m; :1557 defines B and B′; :1572, “`S_aux = (Sym^{n−1}R…) ⊗ R_aux`” | Partly repaired. The tensor, determinant, coefficient field and form are now specified and correct for m>2. R01 records the uncovered m=2 second stage. |
| F05, companion-gap duplication | :110 imports “§RD.3.37” and “§RD.5.8”; :112 asks for “a crystalline companion” | Repaired. The gap no longer asks for the existing restriction functor or full faithfulness. On the unit object the restriction on Frobenius-horizontal endomorphisms is the identity K^σ→K^σ. |
| F06, tower hypotheses | :130, “`C ⊆ B ⊆ A` and `C ⊆ D`”; applications at :1431 and :1468 | Repaired. The previous A=ℚ√2, B=ℚ√3 example fails B⊆A. With B=A and C=D=ℚ, A∩BD=B has degree 2 on both sides. |
| F07, cyclic quotient argument | :912, “`SL_n(k(λ))` is perfect”; :917, “A central composition factor is not a cyclic quotient” | Repaired. For N=603,n=3,l=7237 the centre has order 3 but the abelianization has order 1. The analogous SU argument uses perfectness; the Sp argument separates SL₂(𝔽₃). |
| F08, Dickson locator | :317, “Chapter XII, §§249–260, pp. 269–286”; summary “§260, pp. 285–286” | Repaired. The readable OCR at DICKSON01 lines 10079–10112 contains the subgroup summary. The manifest retains the same source key and this locator. |
| F09, ramified inertia | :50, “`∏_τ ω_τ^e = ε̄_l`”; :1524 uses “restrictions of these characters” | Repaired. For ℚ₅(√5), e=2 and residue unit 2, ε̄=4, not 2. The two-character product is explicitly over an unramified quadratic field and is then restricted to larger inertia groups. |

### Principles, scope, shape and coverage

Read all 83 numbered targets, their API and Checks, all 83 `Needs` lines, ten layer summaries, ten Examples sections and ten Dependencies sections. Every numbered target has at least three Checks. The mathematical order proceeds through finite groups, the family and its realizations, hypergeometric comparison, monodromy, determinants, local realizations and switching. Dependencies explain that order; no layer follows a source chapter merely for exposition. The opening identifies where the base PotentialAutomorphyInfrastructure stops.

No copied source passage, executable algorithm, forbidden supplier, route-specific replacement for the general classification, sorry'd data, `set_option`, process narrative, machine path or HTML anchor was found in the package's roadmap text. R01 is an endpoint completeness defect; R02 and R03 correct explicit mathematical explanations; R04 records an undeclared supplier prerequisite. The README, Suggested.lean, metadata, sources manifest and design were not edited. No source fetch was needed.

The earlier review's computed rows were used only for unchanged statements. Targets without such rows were read and tested afresh, including §§0.10,0.12,1.2,1.3,1.6,3.1–3.5,4.1,5.8–5.10,6.5–6.6,7.2,7.6,7.8,9.2,9.6 and the rewritten auxiliary constructions. This exposed R03. The report table below includes the seeded targets, headlines, repaired patterns and findings; it is not a claim that finite examples prove the general theorems.

The definition checks included empty products, zero and one ranks, characteristic 2 where admitted, characteristics 3 and 5, zero/nonzero projector images, field versus integral coefficients, ramified versus unramified local fields, the identity map, repeated exponents, noncommuting peripheral loops, reducible and irreducible representations, and disconnected/empty torsor fibres. Field hypotheses exclude the zero ring; the large-N bounds exclude truncated natural-subtraction values in the group headlines. The Gauss identity also admits the legitimate N=1,n=0 boundary, where both sides equal 1; it remains a general nontrivial identity, not a boundary theorem.

### Computed adversarial evidence

| Statement | Instances and values on the two sides | Result / change |
|---|---|---|
| §0.5, sampled unitary groups | Enumerating 2×2 matrices over 𝔽₉ gives #U₂=96, #SU₂=24, index 4=q+1. For i²=−1, diag(i,1) has multiplier 1 and determinant i≠1. U₁ has order 4, SU₁ order 1. | Correct positive-rank definition and determinant condition. |
| §0.5, rank-zero Check | Over 𝔽₉/𝔽₃, empty M†M=empty aI for a=1 and 2; the homomorphism from GL₀={1} has ν(1)=1. | R02: scalar uniqueness fails, existence does not. |
| §§0.6–0.9, forms and small groups | B(1,i)=−i, B(i,1)=i=c(−i); Norm(i)=1, Norm(1+i)=2. Over 𝔽₄/𝔽₂, Tr(ω)=1 and Norm(ω)=1. #SL₂(𝔽₃)=24, abelianization order 3. | Slot, trace and small-group exceptions agree with the hypotheses. |
| §0.11, sampled classification | The exceptional SL₂(𝔽₅) has order 120, versus SL₂(𝔽₉) order 720. Upper unitriangular 3×3 matrices preserve a one-dimensional subspace, so 1<3 refutes their absolute irreducibility. | Rank-two exception and irreducibility condition retained. |
| §§0.10,0.12, quotient obstruction | Diagonal S₃ has 6 elements, versus 36 in S₃×S₃. PSL₂(5) and PSL₂(4) both have order 60, but characteristic 2 is excluded. A₅ and S₃ have no common nontrivial quotient; product order 360. | Common-quotient and exceptional-characteristic hypotheses are doing work. |
| §§1.2–1.3, pencil/symmetry | Hesse t=0 has no projective zero of gradient 3(x²,y²,z²) when 3 is invertible; at t=1, [1:1:1] has gradient 0. For N=3, #H=9, #H₀=3, #H/H₀=3. | Smooth locus and quotient are correct, including characteristic 2. |
| §1.5, sampled stabilisers | Qian (401,3): B={1,2,398}, sum 401≡0, stabiliser {1}; (503,4): B={1,2,3,497}, sum 503≡0, stabiliser {1}. Self-dual (5,2): B={2,3}, stabiliser {1,4}; (7,4): {2,3,4,5}, stabiliser {1,6}. | Asymmetric versus ±1 stabilisers distinguished. |
| §1.5, interval negative control | N=11,L=3,d=5: intersection size 0, two-truncation formula 0+0=0; d=1 gives 2=L−1. | Repaired formula retained; no negative cardinality. |
| §1.6, quotient family | N=3,t=2,t′=8: t′⁻¹(tX₃)³=X₃³, and RHS becomes 6X₁X₂X₃. At t=0 the image is outside T′₀. | Coordinate and domain correct. |
| §2.2, sampled Betti torsion-freeness | Quadric H²=ℤ² and H²_ét=ℤ_ℓ²; torsion orders 1 on both sides. Five reduced points have H⁰=ℤ⁵. Fermat quintic middle rank (4⁵−4)/5=204. | Correct comparison corollary, including dimension zero. Enriques torsion is outside the complete-intersection domain. |
| §§2.1,2.7, sampled rank | N=3,a=(0,0,0): B={1,2}, two nonzero Fermat lines, rank 2. N=5,a=(1,0,0,0,4): B={2,3}, rank 2. Qian N=401,n=3: #B=3. | All three rank descriptions agree. |
| §§2.3–2.6, all-place repair | For λ over 401, 401³⁹⁹ has nonzero valuation but its inverse belongs to M_λ; the rational projector still squares to itself. For N=5,l=3, 5∤8 but 5 divides 80: eigenlines split over 𝔽₈₁, not 𝔽₉. | Rational/integral distinction and real-form scalar extension correct. |
| §§3.1–3.3, hypergeometric carriers | n=1 shift 0 gives rank 1 and its Kummer trace. n=2 shift 1 gives the negative convolution sum; weight 1 gives determinant modulus q, agreeing with Tate(−1). J₂−I has rank 1, square 0; distinct infinity characters give a semisimple rank-two action. | Distinctness, nontriviality, shift and local models preserved. |
| §§3.4–3.6, comparison/twist | N=401,n=3: weights 399−2=397 for Ψ, and 399−397=2 for W; ΨcΨ has weight 794=−2(−397). Standard S₃ representation restricts to two lines on A₃. | Twist sign correct; irreducibility after cyclic pullback requires and has its separate argument. |
| §§4.1–4.6, headline complex monodromy | For p₀=(12),p₁=(23), conjugated γ₁=(13) gives γ₀γ₁γ∞=1. J₃−I has ranks 2,1,0 in successive powers; I₃−I has 0,0,0. In characteristic 3, J₃³=I but the nilpotence index is 3. | Loop order and maximal-block condition distinguish the wrong conventions/models. |
| §4.7, sampled residual irreducibility | For λ∤N, a primitive ζ_N remains order N; ζ₁₅ modulo 3 instead has order 5, and ζ₉ order 1. At N=401,l=5, eigenvalue exponents {1,2,398} exclude 0, so their spectrum misses the unipotent spectrum {1}. | Prime-to-N and inverse-spectrum conditions supply Levelt's disjointness. |
| §5.1, Lean SL headline | ord₄₀₁(5)=25; −1 is absent from this odd-order subgroup. Sum B=401, hence det h₀=ζ⁴⁰¹=1, and det h∞=1. n=2 violates 2<n. | Correct subgroup, field-of-definition and rank domain; no assertion of enumerating the huge group. |
| §5.2, Lean Sp headline | N=7,n=4: B={2,3,4,5}=−B, sum 14≡0 and determinant 1. n=2 means m=1, excluded by 1<m. | Trace-field and even-rank hypotheses agree with the prose. |
| §5.3, Lean SU headline | ord₄₀₁(3)=400 and 3²⁰⁰≡−1. Small model #SU₃(3)=27·8·28=6048; #U₃(3)=24192. | Inverting automorphism and determinant-one condition exclude U in place of SU. |
| §5.4, Lean two-prime headline | N=401,l₁=5,l₂=3209: residue degrees 25 and 1; distinct characteristics, maximum 3209>10. Diagonal H has #H rather than #H² elements in H×H. | Product requires the distinct quotient types, not just surjective projections. |
| §§5.5,5.8, cyclic pullback | N=603,n=3,l=7237: centre order gcd(3,7236)=3; abelianization order 1. A cyclic quotient must therefore have order 1. | Previous F07 repaired; centre factors do not obstruct this pullback. |
| §5.6, sampled full Sp monodromy | Retained computed rank-two test: the N=5,l=3 companion pair over 𝔽₉ generates 720 elements. In SL₂(𝔽₅), 20 elements have order 3; their pairwise products have orders {1,3,4,6,10}, never 5. | The exceptional 120-element group is excluded. The previous numerical row applies unchanged. |
| §5.9, sampled determinant descent | W in rank 3 has det=ε⁻³. At l=7 the cyclotomic image of order 6 gives determinant image order 6/gcd(6,3)=2; after adjoining ζ₇ it has order 1. | Descent is not a claim of nontriviality after arbitrary base change. |
| §5.10, sampled full product | #Sp₂(𝔽₃)=24, #Sp₂(𝔽₁₁)=1320, product order 31680. The first is solvable; the second has PSL₂(11) of order 660 as a quotient. They share no nontrivial quotient. | Exceptional small factor is handled without calling it perfect. |
| §§5.11–5.12, torsor headline | Rank-two paired fibre over 𝔽₁₁ has 1320 isometries with its induced determinant trivialization; multiplying that trivialization by 2 gives 0. | Pairing/determinant compatibility is essential and present. |
| §6.1, sampled Fermat Frobenius | Fermat cubic over 𝔽₇ has 9 points. Signed Gauss formula gives α=(-1+3√−3)/2 and its conjugate: sum −1, product 7; 7+1−(−1)=9. | Geometric Frobenius and q⁻¹ normalization agree with point count. Direct complex sums agree to numerical precision. |
| §6.2, Lean Gauss headline | N=3,n=2,a=0,q=7: g(0)=1, g(1)g(2)=7; LHS=7³=343, RHS=7²·7=343. N=1,n=0 gives empty products 1=1. | Signs and exponent n(N−n)/2 correct; no division by a zero sum. |
| §§6.5–6.6, finite-field roots | Cubing on 𝔽₃× is identity. On 𝔽₉× its inverse exponent is 3, since 9≡1 mod 8. Cubes in 𝔽₇× are {1,6}; a cube root of 3 would have order 18, impossible in 𝔽₄₉× of order 48. | Prime-to-l exponent and actual root containment are correctly separated. |
| §6.8, sampled Frobenius compatibility | Cubic polynomial X²+X+7 has determinant 7 and trace −1 in every characteristic-zero coefficient completion away from 7. For Qian N=401,n=3, weights V=399, Ψ=397, W=2. | Common polynomial is over M, not necessarily ℚ; rational projectors extend it to coefficient primes over N. |
| §7.2, wraparound | Self-dual N=5: d=1,2,3 give sums 10,10,15 and grades 1,1,2; wrap counts for the two steps are 1,0. | R03 reverses the explanatory count; formula itself passes. |
| §7.3, sampled consecutive Hodge numbers | Computed Qian grades: (401,3) gives 198,199,200; (503,4) gives 248,249,250,251; (601,5) gives 297,…,301. Self-dual (5,2) gives 1,2. | Exactly n consecutive one-dimensional grades in each case. |
| §7.4, sampled de Rham weights | Fermat cubic grades 0,1 agree with H¹ weights 0,1. Tate(1) has weight −1 here and +1 in the supplier's HT convention, filtration jump −1 in both. Self-dual quintic twist subtracts 1 from {1,2}. | Sign adapter and all finite coefficient places retained. |
| §§7.6–7.8, local headline | Qian grades 198,199,200 minus 198 give 0,1,2. For residue degree 2, φ² valuations 0,2,4 normalize to 0,1,2. At t=0, tᴺ−1=−1; at t=1 it is 0. | Hodge type, Frobenius normalization and good reduction are separately required. |
| §§7.9,9.6, inertia | Rank 3 exponents θ²,θθᶜ,(θᶜ)² have determinant ε̄⁻³. For p=5,m=2, exponents −2,−10 modulo 24 sum −12; m=6 gives equal exponents 18,18 and is excluded by m≤4. | Cohomological inverse and small-weight bound checked. |
| §§7.10,8.1, infinity headline | N_op=[[0,1],[0,0]], d=2: dN_op≠0, square 0, kernel dimension 1. For φ=diag(1,p), N_opφ=pφN_op. Non-zero-shaped (1,2,2,0,0) at N=5 has two singleton blocks instead. | Scaling, consecutive Hodge type and maximal-block hypotheses retained. |
| §7.11, repaired compatibility | At N=401,t=0, required members in coefficient characteristics {2,401}: two; constructed rational members: two. J₂ and I₂ share polynomial (X−1)², but only I₂ is semisimple. | All-place coverage and explicit semisimplification correct. |
| §§7.12–7.13, sampled ordinary open | Generic slopes (2,1,0), special candidate (3/2,3/2,0): prefixes (2,3,3) versus (3/2,3,3), total 3 on both, gaps (1,1) versus (0,3/2). u(0)=1. | V retains the generic gap bound; intersection with its nonempty trace-unit pullback is nonempty. |
| §§9.1–9.4, switch headlines | v_l(1/l)=−1, v_l′(l′)=1. Rank-two real conjugation diag(1,−1) has multiplier −1 and eigenspace dimensions 1,1. Correct tower test B=A gives intersection degree 2=2. | Local signs, real conditions and avoidance-field direction pass. |
| §9.5, sampled local constancy | For y²=t over ℚ₅ near t=1, derivative 2 is a unit and all t∈1+5ℤ₅ have split fibre of size 2. At t=2 the square class is nontrivial. | Finite-level constancy holds on a neighbourhood, not the entire parameter space. |
| §9.8, auxiliary seed | m=2 gives rank 2, weights 0,1, determinant exponent −1; m=3 gives rank 3, weights 0,1,2, exponent −3. Pair sums (2+0,1+1,0+2)=(2,2,2), while the cited quadratic induction has rank 2≠3. | Numerical seed data agree; R04 supplies the missing compatible-type existence contract. |
| §§9.10–9.11, auxiliary headline | (n,m)=(2,3): rank 6, weights 0,…,5, determinant ε⁻¹⁵, Hermitian tensor before rescaling. (3,2): same rank/weights/determinant but skew-Hermitian tensor already. (1,2): rank 2, determinant ε⁻¹. | Tensor repair correct; R01 supplies the missing second-stage targets for m=2. |
| §9.11, level duality | At cyclotomic value 2 modulo 5, det A[5]=2 and det H¹=3. Dualizing the cohomological seed changes 3 to 2. | Twisted modular curve is fed the correct dual seed. |

### Seeded sources and locators

All 15 seeded targets were compared with the cached texts. Source line references below refer to the supplied line-numbered extractions. QIAN23 uses arXiv v1 numbering, BCGNT25 arXiv v3, DK17 v11; BLGHT11 page numbers are the printed author-copy numbers. The manifest records these versions and the Qian published-number crosswalk. The six settled uncertified originals remain distinguished from the readable applications.

| Seeded target | Text opened at the locator | Assessment |
|---|---|---|
| 0.5 Finite unitary groups | BCGNT25 lines 2306–2322, Definition 4.3.1 and Remark 4.3.3, p.45 | Supports the finite-field setup. Its SU/kernel slip is corrected in the definition. R02 concerns the roadmap's extra rank-zero Check. |
| 0.11 Transvection-generated groups | QIAN23 lines 682–715, proof of Lemma 3.6, pp.15–16; BLGHT11 lines 1182–1218, Lemma 4.6, pp.32–33; DICKSON01 lines 10079–10112, XII §260, pp.285–286 | Dimension>2 applications read; rank-two exception checked against Dickson's subgroup summary. Original ZS76 is uncertified. |
| 1.5 Stabilisers | QIAN23 lines 490–518, Lemma 3.1, pp.11–12; BLGHT11 lines 1213–1227, proof of Lemma 4.6, p.33 | Trivial and ±1 stabilisers supported with the stated large-N/even-rank hypotheses. The overlap formula is the roadmap's explicit proof detail. |
| 2.2 Betti torsion-freeness | QIAN23 lines 582–586, Proposition 3.2, p.13; BLGHT11 lines 1002–1017, Lemma 4.1, pp.27–28; EtaleDualityAndPerverseSheaves §4.3(c),(e) | The papers supply Dwork applications. The general integral Betti result is correctly distinguished as the comparison corollary of the named general supplier. |
| 2.7 Rank n | Same QIAN23 Proposition 3.2 and BLGHT11 Lemma 4.1; DMOS82 Proposition 7.4, p.46, beginning at line 2142 | Counting the allowed Fermat eigenlines gives n; general exponent data use the number of allowed shifts. |
| 4.7 Residual irreducibility | QIAN23 lines 673–681, opening proof of Lemma 3.6, p.15; BLGHT11 lines 1185–1189, proof of Lemma 4.6, p.32 | Coprime characteristic polynomials survive at primes not dividing N. General-field Levelt input is supplied by HypergeometricMotives §3.4, not inferred from a complex-only citation. |
| 5.6 Full symplectic image | BLGHT11 lines 1182–1244, Lemma 4.6 and Corollary 4.7, pp.32–34 | Supports the full image. Roadmap separately repairs the rank-two classification exception and cyclic-cover argument. |
| 5.9 Determinant descent | QIAN23 lines 719–725, proof of Lemma 3.6, p.16 | Trivial geometric determinant gives a character of the base. Nontriviality is correctly conditional on the cyclotomic image. |
| 5.10 Two-prime product | QIAN23 lines 738–756, Proposition 3.7, p.16; BLGHT11 lines 1245–1254, Corollary 4.8, p.34; BCGNT25 lines 2388–2409, Proposition 4.4.2, p.47 | Distinct characteristics and the stated bound cover the linear/unitary exceptions; the symplectic small-factor case is explicitly separated. |
| 6.1 Fermat Gauss sums | QIAN23 lines 769–841, proof of Lemma 3.8, p.17; DMOS82 lines 2142,2176,2314–2325, Propositions 7.4,7.6,7.10, pp.46–47,50 | Eigenline, geometric Frobenius and q⁻¹ product normalization agree with the cubic computation. |
| 6.8 Common Frobenius polynomial | BCGNT25 lines 2074–2123, Proposition 4.2.5 and proof, pp.42–43; KATZ09 lines 514–523, Question 5.5, p.97 | Main claim supported by BCGNT and the equivariant trace route. Katz's question is contextual, not a theorem proving the general assertion. Integrality at the residue-characteristic place is correctly postponed to §7.7. KM74 is uncertified. |
| 7.3 Consecutive Hodge numbers | QIAN23 lines 980–1008, Lemma 3.9, pp.19–20; BLGHT11 lines 1325–1347, Lemma 5.2, p.36 | Formula, multiplicities and labelled shifts agree. The source's wrap calculation exposes R03 in the preceding roadmap proof. |
| 7.4 De Rham weights | QIAN23 lines 1010–1039, Lemma 3.10, pp.20–21; BLGHT11 lines 1348–1391, Lemma 5.3, pp.37–38 | Consecutive weights and proper-smooth comparison supported. Extension to all rational coefficient places uses the explicitly named comparison suppliers. |
| 7.13 Generic crystalline ordinarity | BCGNT25 lines 2126–2299, Proposition 4.2.6, pp.43–45; DK17 lines 193–245, Theorem 1.3.3, pp.4–5; lines 1364–1380,1434–1462, Proposition A.3.1/Corollary A.3.2, pp.28–30 | The proof retains U⊂V, uses absolute residue degree and normalized valuation, and has nonzero trace polynomial u(0)=1. The extension-field trace argument is in BCGNT, rather than silently substituting the prime-field appendix statement. |
| 9.5 Finite-level local constancy | BCGNT25 lines 3273–3292, proof of Theorem 6.2.4, p.66 | Source applies the stronger Kisin theorem. Roadmap states and proves only finite-level constancy via finite étale trivializations and the henselian implicit-function theorem. KIS99 remains uncertified. |

For the rewritten auxiliary data, BCGNT25 lines 3160–3344, Theorem 6.2.4 and its proof, pp.64–67, were read through the two switches, including the rank-two alternative and tensor definition. For the ramification repair, CEGS lines 194–230, §1.4, p.5, supplies the exponent e. The QIAN21 ordinary criterion and its consecutive-weight correction were checked against the named ModularityAndLanglandsExtensions and PadicHodgeTheory inputs. The source manifest has 20 distinct works, all cited works accounted for; no new key or missing-text request was introduced.

### Lean acceptance, signatures and padding

From the pinned content checkout, the required `lake env lean` command on the unchanged package `Suggested.lean` exited 0. The only warnings were the five expected `sorry` warnings, at lines 92,111,131,150,185. No TauCeti import is present, so no missing object-file build was required.

A scratch copy replaced every admission with alternatives testing `simp`, `rfl` and `infer_instance` as complete one-tactic solutions. All five failed to close their goals. The nearest one-lemma candidates were then compared at the pins: native SL generation concerns all elementary transvections, not these two hypergeometric generators; `Subgroup.goursat` requires a quotient analysis; symplectic/unitary membership characterizations do not identify generated subgroups; Gauss inversion and Gauss/Jacobi identities are not the zero-shaped product. No applicable single-library-lemma proof or padding declaration was found.

| Admitted theorem | Probe result | Nontrivial content retained |
|---|---|---|
| `qian_hypergeometric_group_eq_SL` | simp/rfl/infer_instance did not close | Identification of a particular two-generator subgroup over its exact finite field. |
| `selfDual_hypergeometric_group_conj_Sp` | None closed | Existence of a conjugating basis and full symplectic image. |
| `qian_hypergeometric_group_conj_SU` | None closed | Involution-compatible form and full determinant-one unitary image. |
| `qian_two_prime_hypergeometric_group` | None closed | Simultaneous product image, beyond either projection. |
| `zeroShaped_gauss_product` | None closed | General combinatorial Gauss product, not its N=3 Check. |

A second scratch file appended `#check @name` for all ten explicit declarations, plus `ZeroShapedDatum.injOn_nonzero`. It elaborated successfully. No needed binder disappeared, and the five theorem signatures agree with their README generality. The datum has a real exponent vector, zero-sum/count/injectivity laws, and a real index-set body. The field, odd-characteristic, primitive-root, field-generation and rank conditions occur explicitly in the group signatures. The Gauss theorem retains `IsDomain`, `NeZero N`, odd N, exact character order and primitive additive character. All five supporting definitions are used by headlines; none is sorry'd data. Every explicit Lean name is discussed in the README.

Headline coverage from the Summary and endpoint targets:

| Headline | Acceptance-file disposition |
|---|---|
| Residual hypergeometric SL, Sp, SU and two-prime product, §§5.1–5.4 | Four actual theorems on pinned matrix/finite-field carriers. |
| Fermat Gauss determinant calculation, §§6.1–6.2 | The general finite-data Gauss identity is stated. The cohomological Frobenius interpretation needs the missing realizations named in the docstring. |
| Katz comparison, maximal complex monodromy and companion realization, §§3.4,4.4–4.6 | Named as unstatable: relative cohomology, eigensheaves and monodromy realization are missing. |
| Geometric residual monodromy and connected level torsors, §§5.5–5.12 | Named as unstatable on the missing lisse-sheaf/fundamental-group/torsor carriers. The four finite-group theorems are substantive parts, not free-Prop stand-ins. |
| Hecke comparison character, common polynomials, labelled de Rham weights, crystalline/ordinary and Steinberg fibres, weak compatibility, §§6.8,7.4–7.13,8.1 | Missing character avatars, period functors/comparison maps, WD and compatible-system carriers are explained in the docstring. Existing BDeRham and Hecke-character carriers alone do not state these results. |
| Qian, self-dual and auxiliary switches, §§9.3,9.4,9.10,9.11 | Named as unstatable, with missing actual geometric torsors and Moret-Bailly realization. R01 concerns the README endpoint, not a request for an ad hoc Lean substitute. |

No statable headline was found omitted or forced through a stand-in.

### Pinned library evidence and duplication by object

Pins checked in `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Opened the native definitions and relevant hypotheses, including the following locations. Paths in this table are relative to the respective library root.

| File and line | Object and comparison |
|---|---|
| `Mathlib/LinearAlgebra/Transvection/Basic.lean:56`, :408, :426, :527, :633, :674 | Transvection x↦x+f(x)v, rank≤1 characterization, determinant and base change. Native transvection/dilatransvection sets include identity; the roadmap excludes it for pseudo-reflections. |
| `Mathlib/LinearAlgebra/Transvection/Generation.lean:487` | Non-exceptional Dieudonné factorization includes its non-exceptional hypothesis. |
| `Mathlib/LinearAlgebra/Matrix/Transvection.lean:81`, :143; `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:70`, :297, :699 | Matrix elementary operations; SL is determinant-one matrices; the centre equivalence uses max(card n,1); the factorization retains the diagonal factor. |
| `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean:600` | `closure_range_toSpecialLinearGroup_eq_top_of_field`, generation by the entire elementary-transvection range. Imported rather than restated. |
| `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Perfect.lean:102`, :116 | Perfectness for field cardinality≥4, and for rank≥3. |
| `TauCeti/LinearAlgebra/Projectivization/PSL/Simple.lean:127`, :142 | PSL simplicity with the stated rank/cardinality conditions. |
| `TauCeti/LinearAlgebra/Matrix/RationalCanonicalFormFinTwo.lean:69` | Companion [[0,−d],[1,t]], confirming the column convention. |
| `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:43` | GL is the units of the matrix ring, not a monodromy object. |
| `Mathlib/LinearAlgebra/UnitaryGroup.lean:105`, :121, :278, :285 | Unitary group and special-unitary intersection with det=1. An explicit field involution is the package's distinguished adapter. |
| `Mathlib/LinearAlgebra/SymplecticGroup.lean:102`, :118, :186 | AJAᵀ=J and equivalent membership forms; no hypergeometric generation theorem. |
| `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:149`, :525 | Semilinear-first symmetry and separating-left condition; the package's form is linear-first and explicitly flips it. |
| `Mathlib/FieldTheory/Finite/GaloisField.lean:219`; `Mathlib/RingTheory/Trace/Basic.lean:519` | Finite-field norm is onto; trace surjectivity requires finite dimension and separability. |
| `Mathlib/FieldTheory/Finite/Basic.lean:448`, :525; `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean:63` | Frobenius order, unit-valued totient power and exact primitive-root order. |
| `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:227`; `Mathlib/GroupTheory/OrderOfElement.lean:179`; `Mathlib/Data/Nat/Prime/Defs.lean:403` | Cyclotomic zero case, infinite-order zero convention, and prime-divisor hypothesis n≠1. The package's domains avoid the junk values. |
| `Mathlib/GroupTheory/Goursat.lean:131`; `Mathlib/GroupTheory/GroupAction/Iwasawa.lean:83` | Quotient graph theorem and simplicity criterion with perfectness/action hypotheses. These do not by themselves prove the new product/classification conclusions. |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:84` | Multiplicative Hilbert 90 on the actual field-automorphism action. |
| `Mathlib/NumberTheory/MulChar/Basic.lean:73`; `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean:60` | Characters vanish on nonunits, including 0; primitive additive characters are nontrivial after every nonzero shift. |
| `Mathlib/NumberTheory/GaussSum.lean:72`, :76, :200 | Native Gauss sum, shift and inverse-character product; domain and primitive/nontrivial hypotheses retained. |
| `Mathlib/NumberTheory/JacobiSum/Basic.lean:48`, :194, :325 | Jacobi sum, nonzero-denominator quotient and power-product identity. None is the zero-shaped determinant identity. |
| `Mathlib/NumberTheory/ModularForms/Identities.lean:55` | Search near-match `slash_action_generators` assumes the generated subgroup and concerns slash invariance, not its identification. |
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140`; `Mathlib/LinearAlgebra/Matrix/Rank.lean:134`; `Mathlib/FieldTheory/Minpoly/Basic.lean:41`; `Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean:43` | Actual charpoly/rank/minpoly/star-transpose carriers; minpoly's nonintegral zero case is excluded by the finite-dimensional matrix setting. |
| `Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:34`, :44 | Product reverses path concatenation; the README's conjugated middle peripheral loop matches the supplier. |
| `Mathlib/Algebra/MonoidAlgebra/Defs.lean:76`; `Mathlib/Algebra/MvPolynomial/Basic.lean:80`; `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:59` | Native algebra/polynomial/smoothness substrates do not supply a cohomological realization. Smooth does not mean proper. |
| `Mathlib/RingTheory/Henselian.lean:154`; `Mathlib/RingTheory/Perfectoid/BDeRham.lean:88` | Ideal-adic completeness supplies henselianity; BDeRham is a ring, not D_dR or a comparison theorem. |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/FiniteComponent.lean:85` | Actual continuous finite component of a Hecke character; no l-adic Galois avatar is supplied there. |

Object searches in both pinned libraries covered Dwork, hypergeometric sheaves versus analytic hypergeometric functions, compatible systems, cohomological projectors, character avatars, transvections, classical groups, norms/traces, Gauss/Jacobi sums, and generated subgroups. The statistical and analytic hypergeometric definitions are different objects. Near-match searches and explicit declaration searches found no duplicate kept headline.

### Supplier resolution, open work and merge order

Read the board package index before making absence claims. Used the provided open-head tools for object searches and supplier snapshots. The overlap file has no conflicting head, dropped cited id, or revision-only cited id; the five closest roadmaps were also inspected by scope and owned object. Three main-branch roadmaps were read for shape: BelyiMaps, NewtonPolygons and ProfiniteCohomology.

The following locations are in `TauCetiRoadmap/<Supplier>/README.md`, at main or the supplied open head as indicated. They are repository line numbers, excluding the tool's wrapper line.

| Supplier | Resolved citations and mathematical boundary |
|---|---|
| ClassicalArithmeticCompletion, main | §§2.46 (:3775),2.60 (:4188): companion construction, determinant/minimal polynomial and characteristic polynomial. |
| HypergeometricMotives, PR #1716 | §§3.1 (:961),3.2 (:996),3.4 (:1042): cyclicity, Levelt triple and field-form rigidity/irreducibility. Package owns the stated order adapter and Dwork/finite-group specializations, not Levelt again. |
| EtaleCohomologyFoundations, main | F.0.2 (:200), F.0.A2 (:368), F.2.1 (:504), F.2.4–F.2.7 (:592,:613,:645,:759), F.3 (smooth-proper result :708), F.4.2 (:979), F.4.5 (:1041), F.6 (:1200). Properness, invertible torsion where required, and adic realization domains agree with the uses. |
| ComplexComparisonPartII, PR #848 | C5.2 (:3257; relative Betti :3441), C5.3 (:3584; pure Hodge :3663, bundles :3683), C6.5 (:5045), C6.6 (:5143). Relative and adic comparisons support the Betti and all-place repairs. |
| InverseGaloisAndArithmeticFundamentalGroups, PR #850 | IG.0.T2 (:531), IG.0.T3 (:566), IG.1.3 (:1168): finite/rational equivariant trace and specialization. |
| DeligneWeightsAndPurity, PR #929 | §§0.1 (:560),3.2 (:1202),7.15 (:2308),8.19 (:2718). Purity implies geometric semisimplicity here, not semisimplicity of every arithmetic fibre. |
| EtaleDualityAndPerverseSheaves, PR #1040 | §§0.5 (:668),0.6 (:821),4.3 (:4218; torsion-free clause :4227, family clause :4229). The repaired package imports the general étale complete-intersection object. |
| LefschetzPencilsAndVanishingCycles, PR #873 | §§0.5 (:544),0.8a (:693),1.1 (:960),1.6 (:1241),2.4 (implicit-function theorem :1761),2.7 (:2080),2.8 (:2196). The separate tame-point contract is declared as a gap. |
| ArithmeticGaloisRepresentations, PR #856 | §2.4 (:1978), arithmetic WD adapter with exp/log and its normalized monodromy input. |
| PadicHodgeTheory, PR #1062 | §§3.2–3.4 (:665,:682,:705),3.6 (:754),6.1 (:1130),6.4 (:1186),8.1–8.2 (:1378,:1407). The package translates the opposite HT sign and preserves prescribed Hodge type in slope criteria. |
| LocalGaloisDeformationRings, PR #923 | §1.7 (:1380),6.8 (:3025),6.19 (:3238),6.25 (:3338): ordinary flags, connection relation, local models and crystalline weight-zero connectedness. The unramified comparison is made before restriction to the larger local fields. |
| PadicDifferentialEquationsAndRigidCohomology, PR #1002 | RD.2.3 (:4222),3.34 (:6474),3.37 (restriction),3.43 (:6767),5.8 (:8782),7.7 (:13968). Restriction/full faithfulness now imported; only the curve companion remains a gap. |
| SchemeAndStackFoundations, main | §§1.15 (:2604),1.16 (:2693): torsors, contracted products and twisting with appropriate flatness/descent. |
| AbelianSchemesAndArithmeticModuli, PR #849 | A6.30–A6.31 (:3714,:3735): Weil restriction and splitting along finite separable extensions. |
| AlgebraicModuliForArithmeticGeometry, PR #853 | §3.4 (:1683): relative Hom and Weil restriction. |
| ArithmeticGaloisDuality, PR #858 | R02.4.6, root theorem at :4352: algebraically closed coefficient roots, prescribed splitting/unramifiedness and avoidance. Package §6.5 adds the finite-field-valued refinement. |
| BelyiMaps, main | §§5.2 (:1966),5.6 (:2173): p₁p₀p∞=1 and the free group. The package explicitly changes the middle loop to its own convention. |
| Chebotarev, main; GlobalNumberFields, main | Layer 10 density/Frobenius prime sets; Layers 9–10 (:508, :531) define Hecke characters and algebraic infinity types; they do not construct characters with prescribed type. R04 records the incorrect import at §9.8. |
| ModularCurves, main; ModularCurvesPartII, PR #913 | §5C (:2252); §5.14 (:1936). Rational-field paired twists and compactification do not silently supply the declared general integral/monodromy contract. |
| PotentialModularityAndCompatibleSystems, PR #1075 | §§1.1 (:95),1.3 (:145),1.4 (:164),1.7 (:242),1.9 (:302),1.11 (:334),2.14 (:779),2.15 (:789),2.16 (:815),2.17 (:823),2.18 (:837),2.20 (:855),3.1 (:918). All-place versus density-one Hodge conditions, semisimplified operations, tower inclusions and local completion compatibility were compared. §3.1 has quadratic/totally-real hypotheses, not the arbitrary m/CM-base hypotheses of §9.8 (R04). |
| ModularityAndLanglandsExtensions, PR #1180 | §§2.9–2.12 (:941,:962,:985,:1005),2.14 (:1044),2.18 (:1120). Fibrewise eigenrealizations, semistable models, ordinary criterion and paired switch are earlier inputs; package refinements are identified in Scope. Its §2.23 also supplies the prime-level number-field modular curve, but not the full declared general-level gap. |
| PotentialAutomorphyInfrastructure, PR #1081 | §2.20 (:1044): density-one crystalline full residual SL₂ containment for strongly irreducible rank-two very weak systems. This is stronger than residual irreducibility and is the actual input to §9.9. |
| PotentialAutomorphyInfrastructurePartII, PR #2135, downstream | Scope :66–67 and §6.1 (:1346 onward) consume the geometric self-dual switch and add the automorphic conclusion. There is no reverse supply from this downstream roadmap. |

The resolver's five leads are accounted for: `VanishingCycles.finiteEtaleGaloisCategory` and `lisseMonodromyEquiv` belong to EtaleCohomologyFoundations F.0.2; `VanishingCycles.etaleTraceFormulaFinite` to InverseGaloisAndArithmeticFundamentalGroups IG.0.T2. They are prospective supplier declarations, not pinned-library claims. `ZeroShapedDatum.indexSet` and `injOn_nonzero` are the package's actual definition and generated structure field.

The object audit also distinguished characteristic-zero symplectic Lie-algebra generation in LefschetzPencilsAndVanishingCycles §5.6 from this package's finite residual classification, and the Dwork period examples in PeriodsAndSpecialValues from its lisse-family/switching ownership. Searching the open and main Lean files for the kept hypergeometric and Gauss headline names found no duplicate fully qualified declaration. The board index's three other packages do not claim these objects.

All three declared gaps have matching slugs, named earlier suppliers and matching needs sentences in the README and the plan: `tame-point-specialization`, `curve-crystalline-companions`, `twisted-modular-curve-over-number-fields`. The first asks for the fibre specialization law; the second now asks only for the companion; the third asks for the general-level twisted-family integral/monodromy interface. They are precise supplier contracts rather than unowned prerequisites, and their current absence is not a finding. The existing prime-level modular-curve result and the existing full-faithfulness result were specifically checked against these boundaries.

The required dependency command, with the supplied configuration, package README, name, order, movable flag and content checkout, returned exactly:

```text
depcheck: 236 roadmaps, 2155 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. Semantic supplier coverage was checked separately as above; the mechanical pass does not fill R01's missing endpoint or R04's missing supplier theorem.

## Not verifiable

- LEWIS82, §4: settled uncertified original. Its finite-field use in BCGNT25 Lemma 4.3.4 and the explicit form calculations were checked, not the unavailable original.
- KM74, Theorem 2: settled uncertified original. Checked the BCGNT25 application and the exact Katz–Messing supplier in RD.7.7.
- KIS99, Theorem 5.1: settled uncertified original. Checked the weaker finite-level theorem and its independent finite-étale/implicit-function route; did not certify the stronger Kisin statement from unseen text.
- KATZ90, Theorems 8.4.11 and 8.12.2(1a), Chapter 8: settled uncertified book. Read the corresponding applications in KATZ09, BLGHT11 and BCGNT25; these do not count as opening the book itself.
- ARTIN55, Theorem 2: settled uncertified original. Checked the restricted application in QIAN23 and the exceptional-order controls.
- ZS76, main theorem: settled uncertified original. Read the dimension>2 applications in QIAN23/BLGHT11 and the separate rank-two Dickson classification evidence.

No settled source was requested again. There is no new missing-reference request. These limitations are distinct from the four actionable findings.

## Source issues

- **Misprint** in BCGNT25 at Definition 4.3.1, p.45: the source says the multiplier kernel is SU; it should be U, with SU additionally imposing determinant one; affects a stated result.
- **Misprint** in BCGNT25 at Remark 4.3.3, p.45: the source says skew-Hermitian symmetry conjugates without exchanging the arguments; it should exchange the arguments as well; affects a stated result.
- **Misprint** in BCGNT25 at §4.2, duality and comparison-character formulas, pp.41–42: the source says the middle-cohomology duality twist is shifted by one; it should be 2−N, giving comparison-character weight N−n−1; affects a stated result.
- **Misprint** in BCGNT25 at proof of Proposition 4.2.6, p.45: the source says the last base-q digit is indexed r_d; it should be r_(d−1) in the q^(d−1) term; affects the proof.
- **Error** in BCGNT25 at proof of Theorem 6.2.4, p.67: the source says the auxiliary arithmetic image is all GU_m with its prescribed determinant; it should be the actual arithmetic image G containing SU_m and obeying that determinant; affects a stated result.
- **Gap** in BCGNT25 at proof of Theorem 6.2.4, p.67: the source says the preceding avoidance field suffices through the second switch; it should also preserve the new auxiliary residual image by avoiding its kernel field; affects the proof.
- **Gap** in BLGHT11 at proof of Lemma 4.6, pp.32–33: the source says the transvection classification gives only the classical alternatives in rank two; it should separately exclude the binary icosahedral characteristic-three alternative; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "ddb923207d5756506d287c09c646d34110ba19e0", "job": "REV-PKG-PotentialAutomorphyDworkMotivesPartII~4", "model": "gpt-6-astra", "worker": "chris-6"} -->
