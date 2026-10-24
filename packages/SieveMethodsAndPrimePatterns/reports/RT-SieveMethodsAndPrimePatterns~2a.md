<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/177#issuecomment-6377973081 -->
Red team round 2 pass a (codex) of 4fbab2b

Verdict: needs_changes

1. **F01** (P2) Polynomial Farey headline is absent from the acceptance test

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:2094`, “Polynomial Farey large sieve”; `packages/SieveMethodsAndPrimePatterns/Suggested.lean:8–20` lists the headlines and unavailable carriers but omits this branch.

   **Claim:** The finite-field polynomial sieve is a promised endpoint, yet none of the 44 declarations tests it. Its carriers are already present; §2.8 itself specifies a simple coefficient definition using native polynomials and power series.

   **Witness:** At p=2, ℓ=1, m=2, the reduced fractions are 1/T and 1/(T+1), with coefficient words (1,0) and (1,1). With every test function one, the inequality is 2≤4.

   **Exact repair text:** “The acceptance file also states the polynomial Farey large sieve of §2.8, using its reversed-denominator coefficient adapter on `Polynomial (ZMod p)` and `PowerSeries (ZMod p)`: for prime p, natural ℓ,m with m≤2ℓ, and nonnegative real functions f_j on ZMod p, the sum over monic degree-ℓ denominators and coprime numerators of degree below ℓ of ∏_(j<m)f_j(c_j(G/H)) is at most p^(2ℓ−m)∏_(j<m)Σ_ξf_j(ξ).” Add that definition with a real body and that theorem with `sorry`, including G=0 at ℓ=0 by using polynomial degree rather than the false condition `natDegree G < 0`. Add their Lean names to the README.

   **Repair test:** For the witness the bound stays 2≤4. For ℓ=m=0 the sole reduced fraction 0/1 and both empty products give 1=1. These cases require no new carrier or Laurent-series construction.

2. **F02** (P1) Jutila's claimed explicit gap has no owner or declaration

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:2040`, “The earlier character mean-square and divisor-moment inputs have an explicit gap”; line 2042 names only the character adapter and reciprocity.

   **Claim:** The Jutila proof, and hence the new Smith and Koymans–Pagano acceptance statements, consume an earlier character mean-square estimate and divisor moments. Neither is a named target here, an exact supplier citation, nor one of the twelve declared gaps; the divisor bounds do have an earlier owner that should be cited.

   **Witness:** JUTILA-ORIGINAL lines 120–125 and 156–159 use Lemma 2; lines 111–121 use summatory divisor and squared-divisor bounds. The scanned printed p.194 gives log⁸X. No corresponding slug occurs in `design/plan.json`.

   **Exact repair text:** Register a named supplier contract: “What AnalyticNumberTheoryPartII must provide (gap:jutila-unweighted-mean-square): For X≥3 and Y≥1, supply an absolute C such that the sum over nonsquare discriminants D≡0,1 mod 4 with |D|≤X of |Σ_(1≤n≤Y)χ_D(n)|² is at most CXY(log X)⁸ (Jutila, Lemma 2, printed p.194).” Add the same slug, supplier and §5.29 to the plan's gaps. Replace the undeclared-gap sentence and extend `Needs` with this contract. For the divisor inputs cite the existing AnalyticNumberTheoryPartI §3.22 divisor average and §1.2a's bound Σ_(n≤Y)τ(n)²≪Y log³(2Y), instead of creating duplicate targets. The latter section explicitly derives its bound from τ²≤τ₄ and harmonic sums.

   **Repair test:** For X=3,Y=1 the only allowed D is −3 and the mean square is 1; the displayed majorant is 3C(log 3)⁸. At Y=2 the divisor sums are 3 and 5; fixed positive constants accommodate both. The square-discriminant exclusion remains essential as Y grows.

3. **F03** (P2) Conductor reduction incorrectly requires coprime factors of the modulus

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:2387`, “Write q=rs with primitive conductor r and coprime cofactor s.”

   **Claim:** Every imprimitive modulus in the all-moduli argument has that form with gcd(r,s)=1.

   **Witness:** Inflate the primitive character modulo 4 to modulus 8. Its conductor is r=4 and q/r=2, so gcd(r,s)=2. Its values at 1 and 3 are 1 and −1, respectively.

   **Exact repair text:** “Write q=rs with primitive conductor r and cofactor s=q/r; r and s need not be coprime. The induced character equals its primitive character times the coprimality mask 1_(n,s)=1. Retain this mask in every coefficient sequence and use the all-cofactor estimates.” Add the modulus-8 example as a negative-control Check.

   **Repair test:** For r=4,s=2 the mask is one on odd arguments and zero on even ones. It gives the actual character modulo 8, including 0 at n=2, without deleting this modulus from the sums. Section 3.4's earlier conductor-reduction target already allows this case.

4. **F04** (P3) The binary sieve's new proof dependencies occur after their consumer

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:1129`, “Layer 1 §1.4 binary sieve cutoff comparison”; the comparison is stated at line 1137, after both large-sieve targets.

   **Claim:** The section is a build sequence. The full theorem uses the later comparison; the following conservative theorem says to prove itself first and also uses that comparison.

   **Witness:** At θ=1/4 the proof uses w=z^(10/13); changing the product at w to the product at z needs the later comparison with s=13/10. The local edge is explicit at line 1129.

   **Exact repair text:** “Order §1.4 as Euler denominator; curvature comparison; finite-character Gram bound; binary sieve cutoff comparison; conservative-cutoff large sieve; full-cutoff large sieve; power-level and divisibility consequences.” In the conservative theorem replace “preceding bound” by its displayed inequality or “the binary-form bound”; in the full theorem refer to the preceding conservative theorem if that proof route is retained.

   **Repair test:** The θ=1/4 calculation remains w^(13/2)=z⁵, and its s=13/10 product comparison is now available before either consumer. No theorem is weakened and no supplier direction changes.

5. **F05** (P3) Several bundled definitions still have no discriminating Checks

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:2493–2517`, “Define y, λ, w, S₁, S₂^(m), g and y^(m)”; lines 3223–3247 define saturation and its least index but test only membership in O_r. The polynomial-vector norm at lines 859–865 and the separate linear sieve functions at lines 2995–3000 also have only two explicit evaluations each.

   **Claim:** Each definition has at least three discriminating README Checks. The weight block tests λ and w but never computes S₁, S₂, g or y^(m); the saturation block never tests density, saturation or the least index.

   **Witness:** Replacing both S₁ and S₂ by zero, g by zero, or every saturation number by zero leaves every Check in those blocks unchanged. No displayed value distinguishes these wrong definitions.

   **Exact repair text:** Add joint weight Checks with k=1,W=1,h=0,v₀=0 and F≡1: “At R=4 the supported y values at 1,2,3 are 1, and λ₁=5/2, λ₂=−2, λ₃=−3/2. For N=2, w₂=1/4,w₃=1, so S₁=S₂=5/4; y^(1)₁=5/2 and y^(1)_r=0 for r>1. At R=2,N=2 the corresponding values are λ₁=1,w₂=w₃=1,S₁=S₂=2,y^(1)₁=1. With F=0 all those quantities vanish. Separately g(1)=1,g(2)=0,g(5)=3,g(25)=9.” Add saturation Checks: “For a singleton orbit on which f has value 6, saturation holds first at r=2; for value 1 it holds at r=0; for value 0 it never holds and the outside-domain convention assigns 0. The empty locus is not dense in a nonempty singleton.”

   **Repair test:** The finite computations use φ(1),φ(2),φ(3)=1,1,2 and μ(1),μ(2),μ(3)=1,−1,−1. The singleton examples distinguish a genuine minimum zero from the non-saturating convention. Also add: “The empty polynomial vector has norm 1; components T over 𝔽₂ and T² over 𝔽₃ have joint norm 18. F(2)=e^γ; f(4)=e^γ log3/2.” These supply a third norm/function evaluation. The kernel Checks at lines 3540–3541 merely repeat its laws; replace them with the actual distinct kernel values in S11 if the local block survives S07. Keep all these Checks in README, not `Suggested.lean`.

6. **F06** (P1) The quadratic large sieve is already owned by an earlier roadmap

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:1980`, “Heath-Brown quadratic large sieve”; `packages/SieveMethodsAndPrimePatterns/Suggested.lean:165`, `SieveQuadratic.quadratic_largeSieve`.

   **Claim:** This package owns and reconstructs Heath-Brown's odd-squarefree quadratic large sieve.

   **Witness:** `TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md:1583–1599`, §5.29, states exactly this theorem and owns its reciprocity/Poisson proof. Its `Suggested.lean` declares `quadratic_large_sieve` with the same complex coefficients and odd-squarefree ranges. It precedes this roadmap, positions 100 and 264.

   **Exact repair text:** “Supplied by AnalyticNumberTheoryPartII §5.29: the odd-squarefree quadratic large sieve, its primitive-real form and square-pair correction, with ε-dependent constants uniform in both cutoffs and arbitrary complex coefficients.” Replace the local foundational target and its analytic reconstruction with this supplier contract; delete `SieveQuadratic.quadratic_largeSieve` from `Suggested.lean`. Repoint the bilinear consequence and later prime-symbol consumers to §5.29, retaining the genuinely new prime-denominator adapter and applications.

   **Repair test:** Both statements include m=n=1. For M=1,N=3,a₁=1,a₃=−1 the left side is 0 and energy 2; changing a₃ to 1 gives 4 and energy 2. No squarefree restriction, conjugation convention or constant uniformity is lost on import. This is an ownership defect, not padding to be proved locally.

7. **F07** (P1) The conditional joint-spin chain duplicates ArithmeticStatisticsPartV

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:3480`, “Joint spin of ideals”; lines 3509,3555,3593 state its Type I, Type II and prime-oscillation theorems as local work.

   **Claim:** This package owns the unit-averaged joint-spin sequence and the complete conditional analytic chain.

   **Witness:** `TauCetiRoadmap/ArithmeticStatisticsPartV/README.md:2095–2107`, §3.30 “Conditional joint-spin prime bound”, explicitly owns the same unit sum, generator independence, both analytic estimates and prime extraction. Its exponent is identical. Merge positions are 132<264.

   **Exact repair text:** “ArithmeticStatisticsPartV §3.30, Conditional joint-spin prime bound, supplies the unit-averaged sequence, generator independence, uniform Type I estimate, Type II estimate and prime-ideal cancellation under C_(|S|n). Import that chain with its fixed field, nonempty inverse-disjoint S, unit hypotheses, residue weight and modulus. The spin-sign equidistribution consequence here consumes that theorem.” Replace the duplicate local construction and four proof plans by this import; retain only independently new general interfaces, explicitly identifying their difference. Assign any additional proof-strength contracts needed inside the imported chain to its owner rather than planning the chain again here. The existing geometric gaps are not rejected merely because implementation is outstanding.

   **Repair test:** For n=3,|S|=1,δ=1 both routes give saving 1/(54·3·37)=1/5994. Both define every coefficient as zero when ψ=0, and both exclude S containing an involution. The totally complex unit average and the totally real positive-unit-square hypothesis agree. No upward edge is introduced.

8. **F08** (P3) Two analytic supplier locators do not match the supplier

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:53`, “Use §§0.10–0.11 for the prime number theorem with every fixed logarithmic saving”; line 55 names `smoothCount_rankin`.

   **Claim:** Those two sections supply the stated quantitative error, and the Rankin theorem has the supplied declaration name `smoothCount_rankin`.

   **Witness:** `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:330–350` states interval/Mertens estimates; §0.32:739 supplies the stronger error. §3.35:3123 states Rankin by description. Neither that README nor its current `Suggested.lean` declares `smoothCount_rankin`.

   **Exact repair text:** “Use AnalyticNumberTheoryPartI §0.32 at q=1 for the prime number theorem with every fixed logarithmic saving; use §0.10 for primes in a fixed multiplicative interval and §0.11 for the logarithmically weighted prime sum.” Make the same distinction wherever a proof cites §§0.10–0.11 for the stronger error. Replace “`smoothCount_rankin`” by “§3.35, Rankin smooth-number upper bound”; keep the existing mathematical supplier, whose statement has x≥1,y≥2,σ>0.

   **Repair test:** Setting q=1 gives φ(q)=1 and 1≤(log x)^B for x≥e, so the cited estimate specializes to |ψ(x)−x|≤C_A x/(log x)^A. No new gap or later supplier is needed.

9. **F09** (P2) The general Brun fundamental estimate has no acceptance statement

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:1018`, “Brun fundamental sieve estimate”; `packages/SieveMethodsAndPrimePatterns/Suggested.lean:46–94` includes only Selberg and its applications in Layer 1.

   **Claim:** The roadmap develops general Brun bounds, but its acceptance file only mentions Brun's reciprocal-convergence application. The general estimate is statable using native `BoundingSieve` and finite products/sums, without constructing the combinatorial coefficients in Lean.

   **Witness:** For P=1, X=S=1, R₁=0, κ=1,K=2,u=10, the general estimate reads −1023≤1≤1025. Neither this general conclusion nor its product-dimension hypothesis occurs in the acceptance file or its unavailable-headline list.

   **Exact repair text:** “State the Brun fundamental estimate of §1.2 for a native BoundingSieve with X≥0, κ>0,K>1,y>1,u≥9κ+1, z=y^(1/u), every sieving prime below z, and the stated product-dimension bound. Writing V=∏_(p|P)(1−ν(p)), δ=exp(9κ+1−u)K¹⁰ and R(y)=Σ_(d|P,d<y)|R_d|, assert (1−δ)VX−R(y)≤S≤(1+δ)VX+R(y).” Add only the simple finite-product dimension and remainder definitions required by this headline, or state them inline; each has a real body. Add the theorem with `sorry` and its name to README.

   **Repair test:** The displayed modulus-one computation is retained. With u=20 instead, δ=1024e^(−10)≈0.04649 and the bracket becomes 0.95351≤1≤1.04649, detecting the lower-sign error in the printed source. No unsupported β-sieve-function carrier is needed.

10. **F10** (P2) Jutila's headline is statable with a simple numerical character adapter

   **Location:** `packages/SieveMethodsAndPrimePatterns/Suggested.lean:14`, “The general Jutila character mean is not statable here”; README:2034 states the full headline.

   **Claim:** The absence of ThetaSeries' future character carrier prevents stating this finite numerical estimate. Its statement needs only a real-valued function on integer discriminants and natural arguments, whose real body is elementary on the pinned APIs.

   **Witness:** Pinned `Mathlib/NumberTheory/LegendreSymbol/JacobiSymbol.lean:86`, `Mathlib/Data/Nat/PrimeFin.lean:37` and `Mathlib/Data/Nat/Factorization/Defs.lean:50` define all needed data. A finite prime-factor product gives χ₅(2)=−1, χ₈(2)=0, χ₈(3)=−1, χ₁(0)=0 and χ₁(1)=1.

   **Exact repair text:** “State Jutila's mean-value lemma of §2.7 against the numerical real discriminant adapter of §0.6. Give that adapter the real body χ_D(0)=0 and χ_D(n)=∏_(p∈n.primeFactors) c(D,p)^(n.factorization p) for n>0, where c(D,p)=jacobiSym D p for odd p and c(D,2) is 1 for D≡1,7 mod 8, −1 for D≡3,5 mod 8, and 0 otherwise. Its comparison and character laws remain supplied by ThetaSeries §2H.” Put the full finite estimate at README:2034 in a theorem with `sorry`; remove this headline from the unavailable list and add its name to README. The numerical specialization does not establish a competing generic character library.

   **Repair test:** For X=8,N=2 and a supported at 2 with value 1, the six discriminants −8,−7,−4,−3,5,8 give squared values 0,1,0,1,1,0, hence left side 3. The square-product term is 8C and the eighth-moment term is nonnegative. The adapter retains nonfundamental discriminants and the correct dyadic convention; it is neither a free predicate nor sorry'd data.

11. **F11** (P1) The real joint-spin kernel drops the infinite-place sign

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:3519`, “For odd elements α,β coprime to F”; line 3532, “The exchange sign depends only on residues mod 8.”

   **Claim:** The exchange sign for arbitrary allowed elements depends only on their residues modulo 8, including in totally real fields.

   **Witness:** Let K=ℚ(t), t³+t²−2t−1=0, σ(t)=t²−2, S={σ}, α=1+8t, β=1+16σ(t). Both residues are 1 modulo 8, but Φ(α,β)=1 and Φ(β,α)=−1; Φ(α,1)=Φ(1,α)=1.

   **Exact repair text:** “For arbitrary nonzero odd α,β, the exchange factor depends on their residues modulo 8 and their signs at every real embedding. Retain the product, over σ∈S and v|2∞, of (α,σ(β))_v(α,σ⁻¹(β))_v. If a shared odd prime makes a kernel zero, both exchanged kernels are zero. On totally positive generator domains the infinite factors are 1, giving the residue-only corollary; totally complex fields have no infinite sign factors.” Correct the exposed exchange law and its proof, and add the displayed example as a negative-control Check. If S07 transfers this target to its existing owner, transfer this correction with it.

   **Repair test:** This cyclic cubic field has discriminant 49 and class number 1 (Minkowski bound 14/9<2). The signs of t,σ(t),−1 span all three sign coordinates, so its totally positive units are squares. Choose class representatives of norms 41 and 71; the resulting F is coprime to Nα=377=13·29 and Nβ=3569=43·83. Finite-field evaluation gives:

   | Kernel | Norm prime | Roots of t³+t²−2t−1 in the denominator | Numerator Legendre values | Product |
   |---|---:|---|---|---:|
   | Φ(α,β) | 43 | 8,19 | −1,1 | −1 |
   | Φ(α,β) | 83 | 10,57 | 1,−1 | −1 |
   | Φ(β,α) | 13 | 7,10 | 1,1 | 1 |
   | Φ(β,α) | 29 | 3,7 | −1,1 | −1 |

   Thus the complete products are 1 and −1. Both elements are dyadic squares since they are 1 modulo 8. Their real sign patterns are two distinct two-negative patterns, so the retained infinite factor is −1 and the repaired exchange gives 1=(−1)(−1). KM-21 lines 1238–1276 make the residue-only assertion inside an argument on the positive generator domains; that assertion does not extend to arbitrary odd elements.

## Verification of the first-round findings

The identifiers below are the repair report's F identifiers; `a` and `b` distinguish the two original passes. Locations in this table are in `packages/SieveMethodsAndPrimePatterns/README.md` unless explicitly marked Lean. “Repaired” concerns the reported defect, not certification of all later proofs. The two dispositions marked “not actionable in this package” are accepted as named supplier contracts; neither is re-raised.

| Earlier finding | Status | Repaired passage and current location | Independently checked witness |
|---|---|---|---|
| a F01: 68 admitted examples | Repaired | Lean:8, “The headlines are”; there are no `example` declarations | 29 theorems, 15 definitions, zero examples; deleted checks have no replacement boundary theorems |
| a F02: nonsquarefree denominator | Repaired | 1313, “Σ_(1≤d<z) μ(d)²” | At g(p)=1/p the d=4 term is now 0 rather than 1; squarefree terms through 9999 sum 10.5433421 |
| a F03: zero-label divisor identity | Repaired | 2510, “For k = 1 and n+h₁>0” | n=h₁=0,R=2,F(0)=1 gives finite weight 1 and native divisor sum 0; comparison excludes it |
| a F04: false square-sum inference | Repaired | 917, “Neither (Ω₁) nor (Ω₂) implies Σ_p g(p)²log p<∞”; 921–923 retain the sparse-prime control | With log p_j between j log2 and (j+1)log2, g(p_j)²log p_j≥log2/(j+1); divergence retained |
| a F05: unsupported positive lower sieve | Repaired, conditional source | 3051, “Positive lower sieve above 9t”; 3313 invokes it | t=1,s=9.5 is now allowed by the named stronger target; old elementary parameters β=10,K=2 give δ=1024 and no positive lower bound. BGS text remains uncertified |
| a F06: affine stand-in | Repaired | Lean:19, “saturation and squarefree expansion lack the word-population and congruence-mixing interfaces” | No finite arbitrary-error surrogate or supporting proxy definitions remain |
| a F07: invented suppliers | Partly repaired | 53, “Use §§0.10–0.11”; 57–69 name actual owners | Invented AN/FF/AC labels removed; the remaining PNT strength is mislocated: S08. Stronger contracts are declared |
| a F08: missing spin/expansion inputs | Repaired as declared contracts | 83–91, “gap:spin-sliced-lattice”, “gap:spin-codimension-two”, “gap:subgroup-strong-approximation”, “gap:squarefree-ring-sum-product”, “gap:sl2-noncommutative-flattening” | All five slugs and named suppliers occur in the plan. Absence of completed supplier proofs is not re-raised. S07 is a separately discovered ownership conflict |
| a F09: unweighted Gram duplication | Repaired | 67, “ErdosProgressionPowers §3.1 supplies the uniform-row, maximum-row and diagonal/off-diagonal finite Gram inequalities” | Supplier 1001–1006 includes empty families and real/complex spaces; the retained weighted result gives 1/3+4/6=1 for x=1,y=(1,2) |
| a F10: Kronecker duplication | Repaired | 648, “real coercion of ThetaSeries §2H's kroneckerSym” | Supplier 562–576 owns odd/dyadic/zero conventions; local adapter χ₈(3)=−1 and χ₈(2)=0 |
| a F11: missing hD and modulus-one mismatch | Repaired | 655, “For a proof hD that D is fundamental, with 1<D.natAbs” | D=1,n=0 gives adapter 0 versus native character 1; new restriction excludes it. Pinned Character.lean:34 has the explicit proof binder |
| a F12: conductor ideal counts | Repaired as declared contract | 93, “gap:quadratic-order-conductor-counts”; 833 retains conductor primes | Plan names GlobalNumberFields Layer 11; its README:586–589 only supplies extension/contraction away from conductor. No assertion that this already supplies bad-prime counts |
| a F13: Hilbert ownership | Repaired | 65, “QuadraticFormInvariants §6C”; 3464, “Ideal-symbol reciprocity adapter” | Supplier 1873–1883 owns classical/cohomological comparison; rational (3/7)(7/3)=−1 agrees with the dyadic/infinite product |
| a F14: ideal coefficient moments | Repaired | 3565, “Ideal divisor and logarithmic coefficient bounds” | τ_ℚ((4))=3, Λ((4))=log2; square moment through 4 is 18. Native `norm_vonMangoldt_le_log` and supplier §§3.3–3.4 provide the inputs actually used |
| a F15: Smith/KP headlines | Repaired | Lean:188,198, `smith_prime_legendre_bilinear`, `koymans_pagano_row_mean` | X₁={3,5},X₂={7,13}: rows (−1,1),(−1,−1), total 2; ε precedes C and c₂,c₄,a precede ε. Their Jutila prerequisite remains S02 |
| a F16: missing Checks | Partly repaired | 2555, “Further discriminating Checks for each functional” | Triangle I=1/2,J=1/3; scaling by two gives I=2,J=4/3; the zero-fibre polynomial gives I=1/3150,J=0. Weight totals and saturation definitions still lack tests: S05 |
| a F17: catalogue/docstrings/names | Repaired | Lean:6, “only their simple definitions” | All 44 declarations have mathematical docstrings and README names; unused BinaryPolynomial and catalogue removed |
| a F18: stale pins | Repaired | 41, “Mathlib 6b7abb3c… and Tau Ceti a91d3aaf…” | Both full hashes equal lake-manifest pins; the fundamental-character definition exists and is integer-valued before coercion |
| a F19: missing source manifest | Repaired | `packages/SieveMethodsAndPrimePatterns/sources.toml`, schema and 29 entries | 22 cached texts, 3 uncertified works, 4 waived works; no repeated settled request. Some locator metadata is broad; source comparisons below distinguish actual theorem numbers |
| a F20: Richert local obstruction | Repaired | 3105, “0≤g(p)≤1−1/A₁” and the uniform product bound | Multiples of 30 force g(2)=g(3)=g(5)=1, now excluded. At r=2,γ=.9,α=.225,β=.81 the numerical positivity margin is about .44514 |
| a F21: binary cutoff narrowed | Partly repaired | 1121, “2≤z≤min((A/R^θ)^(1/5),A^(1/2))”; 1095 supplies a new Gram estimate | Circle R=32,θ=1,z=2 gives 1024≤1024π and 4≤32√π. θ=1/4 gives exponent 13/2 and w=z^(10/13). Full range is restored; new forward ordering is S04 |
| b F01: progression headline | Repaired | Lean:82, `progression_upper` | k=1,a=0,x=4 gives count 2 and scale 4/log4>0; k=3,a=1,x=12 gives count 1 and scale 6/log4. Constant is chosen before k,a,x |
| b F02: taper Needs | Repaired | 1431, “Mathlib max_def and Int.cast_abs” | Both pinned names exist. N=1,L=2,n=1,2,3 gives weights 1,1/2,0 |
| b F03: review narrative | Repaired | 642, “two-residue cutoff step”; 2187, “displayed smooth-factor construction”; 3655, “cited versions” | Previous process references removed; no pull-request numbers or review findings in README/Lean |
| b F04: completed supplier link and ST.2 | Repaired | 65, “ArithmeticDirichletSeries … Layers 1–2 … Layer 5” | Link resolves to Completed; nonexistent ST.2 consumer removed; local coefficient estimates are now named |

## Verified sound

Read all 3851 README lines and all 413 Lean lines. The inventory contains **228 bold mathematical targets** (including the analytic proof requirement), **44 Lean declarations: 29 theorems and 15 definitions**, and **52 explicit Checks blocks containing 215 bullets read and tested against their definitions**. The seven additional functional checks at lines 2557–2563 are included in that bullet count. Finite witnesses below cover every target and declaration; asymptotic rows evaluate normalizations and do not assert that a small input exceeds an unspecified threshold. Source and supplier checks, rather than those finite values alone, support the asymptotic comparisons. The source-collation table records the number and scope of locators actually checked. Source uncertainties are listed separately.

The 25 previous findings were checked individually above. The two settled supplier-gap dispositions remain accepted. All twelve gap slugs have named suppliers and occur in both the README and plan. None is rejected for being unimplemented. The requested stronger estimates are distinct from the cited existing subpower, fixed-model or rational-point statements. S02 concerns a different, undeclared input.

Compared all 44 supplied elaborated signatures against the actual definitions and README. No required section binder disappeared. The only ambient mathematical variables occur in SieveGram; they are all retained in its theorem. The other declarations have explicit individual binders. I used the supplied successful signature extraction and did not execute Lean, respecting the read-only/no-build instruction.

The one-tactic probe found no remaining acceptance theorem that is a mere definition, boundary computation or single pinned lemma. The generic unweighted Gram inequality is now imported; the weighted denominator result remains a substantive theorem. S06 is mathematical ownership duplication with a planned earlier theorem, not a proposal to prove padding locally. All fifteen definitions are used by retained headlines. The file has a single `import Mathlib`, mathematical declaration docstrings, the correct namespace and layer order, no admitted data, no admitted examples, no `lemma`, no `set_option` and no catalogue commands. The 42 resolver leads are local acceptance names, not absent library declarations.

The README headlines covered by Lean are weighted Gram and optimized Selberg bounds; interval/progression/twin/Goldbach bounds and Brun convergence; additive and primitive large sieves (both constants), the quadratic sieve and prime bilinear consequences, Linnik, Smith and Koymans–Pagano; Vaughan; prime distribution, maximal BV and BDH; Maynard clusters, variational growth, M₅ and M₁₀₅ certificates, gaps and positive-proportion tuples; Chen's two endpoints. Missing statable headlines are the general Brun estimate, polynomial Farey theorem and Jutila mean: S09, S01 and S10. The module explicitly names the binary L-domain, general weighted sieve-function, joint-spin and affine expansion/saturation endpoints as unavailable on their unfinished interfaces. No stand-in for them remains.

The exact rational computations reproduce both Maynard certificates. At k=5, I=29509/1222452000 and ΣJ=40493/838252800, giving 1417255/708216>2. At k=105 all 42 coefficients reproduce the three printed exact fractions and ratio 4.000543795842186>4. All 2009 Vaughan identities for n=0,…,40 and U,V=0,…,6 agree coefficient-by-coefficient in the formal prime logarithms. The singular-conic counts and the real cubic kernel counterexample were independently enumerated over their finite residue fields.

The required dependency command returned:

```text
depcheck: 29 roadmaps, 255 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This external graph does not detect the local forward references of S04 or duplicated ownership. The read-only diff against origin/main contains seven files, all under `packages/SieveMethodsAndPrimePatterns/`; no out-of-folder package edit was found. This pass wrote only its report and scratch notes.

Ownership was searched by object through the roadmap service, active/completed main, board packages and the 28 supplied sibling checkouts. Relevant matches were opened, including the two earlier owners in S06–S07. No duplicate fully qualified acceptance name was found. This roadmap owns the sieve-specific adapters, finite local comparisons and new prime-pattern consequences; generic Gram, Kronecker, quadratic reciprocity, lattice geometry, norm fibres and the two duplicate analytic chains retain their existing owners. Other open heads were not independently discovered beyond the service index and the files supplied in the brief.

The following **33 distinct supplier section references** were resolved at main or an allowed earlier new-roadmap head, with their relevant hypotheses read: AnalyticNumberTheoryPartI §§0.10,0.11,0.21,0.26,0.31,0.32,1.2a,3.3,3.4,3.22,3.26,3.32,3.34,3.35; AnalyticNumberTheoryPartII §5.29; ArithmeticStatisticsPartV §3.30; GeometryOfNumbersAndQuadraticArithmetic §4.1; AdelicAlgebraicGroups §4.2; InverseGaloisAndArithmeticFundamentalGroups §IG.2.5; IntegralLattices Layers 0,3; GlobalNumberFields §§3,3C,Layer 11; ArithmeticDirichletSeries Layers 1–2,5; ClassFieldTheory Layer 14; QuadraticFormInvariants §6C; Chebotarev Layer 13; ThetaSeries §2H; ErdosProgressionPowers §3.1; Isoperimetry I2; RiemannianGeometry R4.9.6a. Layers 1–2 of ArithmeticDirichletSeries are counted as one reference. S08 identifies the remaining strength and declaration-name locator mismatches. Relevant pinned definitions were read at their files, including native BoundingSieve's global nonnegative weights, squarefree nonzero modulus, strict prime-density margins and arbitrary real approximate mass; ideal Λ's nonzero-ideal carrier and norm bound; fundamentalDiscriminantChar's explicit fundamentalness proof; and the finite additive-character sum's domain assumptions.

The statement ledgers use the existing target inventory but recompute its witnesses. In particular the second-moment row uses the actual reduced-residue mean, the M₁₀₅ row uses its own 105-dimensional certificate, and no asymptotic threshold is inferred from a small finite normalization.

| README statement (section and line) | Instances tried | Values computed | Result | Required change |
|---|---|---|---|---|
|  §0.1, line 121: Weighted divisibility interchange | P=1, population {0,1}, weights 1, c(1)=−2 | −4 = −4; gcd(1,0)=1 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.1, line 133: Exact Legendre sieve identity | P=6, support {0,1,2,3,6}, weights 1 | 5−3−3+2 = S = 1 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.1, line 143: Euler-product main term with signed remainder | P=1, A₁=10, X=7 | 10 = 7+3; R₁=3 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.1, line 155: Absolute Legendre error bound | P=1, A₁=10, X=7 | ‖10−7‖ = ‖R₁‖ = 3 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.1, line 165: Lower sieve coefficient inequality | P=6, c=μ, support {0,1,2,3,6} | lower divisor sums at 1,2,3,6: 1,0,0,0; weighted sum = S = 1 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.1, line 177: Lower main term minus absolute remainder | P=1, A₁=10, X=7, c(1)=1 | X main−err=7−3=4 ≤ S=10 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.1, line 189: Remainder bound at a coefficient cutoff | P=1, R₁=3, c(1)=−2, D=1, C=2 | err=6 = 2·3; removing d=1 gives 0 incorrectly | Values agree; analytic hypotheses retained | None from this instance |
|  §0.1, line 201: First Bonferroni lower sieve bound | P=6, support {0,1,2,3,6} | A₁−A₂−A₃=−1 ≤ S=1 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.2, line 215: Weighted finite-family sieve | labels 7,7; weights 2,3; P=2 | pushforward weight = A₇ = S = 2+3 = 5; empty family 0 = 0 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.2, line 242: Divisibility sums of a weighted family | labels 7,7; weights 2,3; P=2 | pushforward weight = A₇ = S = 2+3 = 5; empty family 0 = 0 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.2, line 252: Sifted sums of a weighted family | labels 7,7; weights 2,3; P=2 | pushforward weight = A₇ = S = 2+3 = 5; empty family 0 = 0 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.3, line 266: Prime divisibility of a residue label | Q={2}, Ω₂={1}; integer labels 0 and 1 | L(0)=1, L(1)=2; divisibility false/true; coprimality true/false | Values agree; analytic hypotheses retained | None from this instance |
|  §0.3, line 278: Simultaneous local conditions as divisibility | Q={2}, Ω₂={1}; integer labels 0 and 1 | L(0)=1, L(1)=2; divisibility false/true; coprimality true/false | Values agree; analytic hypotheses retained | None from this instance |
|  §0.3, line 290: Local avoidance as coprimality | Q={2}, Ω₂={1}; integer labels 0 and 1 | L(0)=1, L(1)=2; divisibility false/true; coprimality true/false | Values agree; analytic hypotheses retained | None from this instance |
|  §0.3, line 302: Sieve with arbitrary excluded residue classes | Q={2}, Ω₂={1}; integer labels 0 and 1 | L(0)=1, L(1)=2; divisibility false/true; coprimality true/false | Values agree; analytic hypotheses retained | None from this instance |
|  §0.3, line 330: Divisibility sum equals the local intersection | Q={2}, Ω₂={1}; integer labels 0 and 1 | L(0)=1, L(1)=2; divisibility false/true; coprimality true/false | Values agree; analytic hypotheses retained | None from this instance |
|  §0.3, line 340: Sifted sum equals the original local avoidance count | Q={2}, Ω₂={1}; integer labels 0 and 1 | L(0)=1, L(1)=2; divisibility false/true; coprimality true/false | Values agree; analytic hypotheses retained | None from this instance |
|  §0.3, line 350: Deleting empty local conditions preserves the Euler product | Q={2,3}, Ω₂={1}, Ω₃=∅ | (1−1/2)(1−0)=1/2 = active-prime product | Values agree; analytic hypotheses retained | None from this instance |
|  §0.3, line 360: A fully excluded residue space leaves no survivors | Q={2}, Ω₂={0,1}, labels 0,1 | survivors 0 = asserted 0 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.3, line 376: Legendre error for arbitrary local residue conditions | labels 0,1; weights 1,2; Q={2}, Ω₂={1}, X=3 | S=1; X V=3/2; ‖error‖=1/2=‖R₂‖+‖R₁‖ | Values agree; analytic hypotheses retained | None from this instance |
|  §0.4, line 396: Vanishing Gram row detects the zero vector | y=0 versus y=1 | row 0 iff vector 0; row 1 iff vector nonzero | Values agree; analytic hypotheses retained | None from this instance |
|  §0.4, line 406: Gram-row bound for a finite linear combination | real y=(1,2), c=(1,1) | ‖1+2‖²=9 = 3+6 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.4, line 416: Selberg's normalized projection defect bound | real x=1,y=(1,2), c=(1/3,1/3) | defect 0 = 1−(1/3+4/6) | Values agree; analytic hypotheses retained | None from this instance |
|  §0.4, line 428: Selberg's weighted inner-product inequality | real x=1,y=(1,2); complex x=1,y=i | 1/3+4/6=1=‖x‖²; coefficient −i gives reconstruction 1 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.5, line 442: Logarithmic sieve dimension | P={2}, g(2)=1/2,z=2,κ=0,C=log2/2 | sum = C = 0.3465735903; empty P,C=−1 gives 0>−1 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.5, line 469: Euler-product sieve dimension | P={2},g(2)=1/2, [2,2), [2,3) | products 1 and 2; empty interval forces K≥1 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.5, line 496: Truncated remainder mass | P=1,R₁=3,D=1 then 2; c(1)=2 | masses 0 and 3; at D=2 coefficient error 6=2·3 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.5, line 523: Level of distribution of a sieve family | X=1 with all R=0; then R₁=1 | remainder masses 0 versus 1 for D>1; θ=0 excluded in both cases | Values agree; analytic hypotheses retained | None from this instance |
|  §0.5, line 550: Coefficient error controlled by remainder mass | P=1,R₁=3,c₁=2,C=2,D=2; D=1 negative control | err=6=C·mass=2·3; D=1 gives mass 0 but violates strict support | Values agree; analytic hypotheses retained | None from this instance |
|  §0.5, line 562: Finite tilted density Euler product | P=1,ν(1)=1,x=1; empty selected prime set | divisor sum 1 = Euler product 1; Rankin bound 1≤1 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.5, line 574: Weighted Rankin cutoff bound | P=1,ν(1)=1,x=1; empty selected prime set | divisor sum 1 = Euler product 1; Rankin bound 1≤1 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.5, line 586: Weighted Rankin remainder-tail bound | P=1,ν(1)=1,x=1 | strict tail 0 ≤ product bound 1 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.5, line 598: Tilted Euler-product estimate from logarithmic dimension | P=1,z=e²,κ=1,C=0; choose K=1,z₀=e² | tilted product 1≤K(log z)^κ=2; for every z≥e² the bound is 1≤log z | Values agree; analytic hypotheses retained | None from this instance |
|  §0.5, line 610: Dimension-controlled weighted divisor count | P=1,z=e²,κ=1,C=0,K=1; x=1,4 | count 1≤x log z exp(−log x/log z), giving 1≤2 and 1≤4 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.5, line 622: Dimension-controlled divisor-density tail | P=1,z=e²,κ=1,C=0,K=1; x=1,1/4 | strict tail 0≤2 at x=1; tail 1≤2 exp(log4/2)=4 at x=1/4 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.5, line 634: Eratosthenes estimate with a justified mass and divisor cutoff | P=1, support {1},X=M=x=1,c=0 | ‖S−X‖=0 ≤ 1; cutoff at d=1 retains the mass | Values agree; analytic hypotheses retained | None from this instance |
|  §0.6, line 648: Real discriminant character adapter | D=5,8,1; n=0,1,2,3 | χ₅(2)=−1; χ₈(2)=0; χ₈(3)=−1; χ₁(0)=0≠1 (native modulus one) | Values agree; analytic hypotheses retained | None from this instance |
|  §0.7, line 669: Binary polynomial local densities | Q=x²; moduli 0,1,4,8,9 | ρ=0,1,8,16,27 respectively; at p²=9, 27>degree·p²=18 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.7, line 700: Curve lifting and singular correction | Q=x²,p=2,k=2 | ρ(4)=8, ρ̃(4)=4, singular ρ(8)=16; 4·4=4·8−16 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.7, line 710: Binary Schwartz–Zippel specialization | Q=x²,p=3; Q=0 as excluded control | ρ(3)=3≤3·2=6; zero reduction has 9 zeros | Values agree; analytic hypotheses retained | None from this instance |
|  §0.7, line 720: Multiplicative sieve growth class | f(n)=1 for n>0, A=B=1,ε=1 | f(1)=1=min(1,1); f(2)=1≤min(1,2); f(n)=n fails A=1 at n=2 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.7, line 745: Binary density correction factor | Q=x,p=3, n=3 and 9 | ρ(3)=3; λ(3)=2/3; θ(3)=θ(9)=5/3=1+2/3 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.8, line 773: Integral local normal forms for conic counts | q=x²+y²; even-bilinear matrix diag(2,2) | half-norm(1,1)=2=q(1,1); D=−4 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.8, line 783: Regular-prime conic densities | Q=x²+y²+4; moduli 3,5,9 | counts 4,4,12 = p^(n−1)(p−χ₋₄(p)) | Values agree; analytic hypotheses retained | None from this instance |
|  §0.8, line 793: Singular-prime conic density recursion | q₀=x²−y²,p=3; (n,m)=(1,1),(2,1),(2,2) | R=5=4+1; 12=12+0; 21=12+9 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.8, line 805: Uniform conic local-density bound | q=x²+y²,D=−4,ω=1,p=3,n=2 | ρ(9)=12 ≤16·3³=432 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.8, line 815: Genus-restricted conic density sum | p=3,u=u_A=ω=1,k=1,ε=−1 | actual count 18 = corrected formula; opposite sign gives 9 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.9, line 827: Quadratic-order ideal counts in the growth class | maximal order ℤ[i], norms 1,2,5,9 | invertible ideal counts 1,1,2,1 ≤ divisor majorants 1,2,2,3; conductor cases require gap | Values agree; analytic hypotheses retained | None from this instance |
|  §0.10, line 839: Polynomial-vector sieve data | p=2,D=T³; A=T²,D=T,I={T}; coupled Bernoulli labels | norm 8; rough event 0 although divisibility 1; joint probability 1/2≠1/4 | Values agree; analytic hypotheses retained | None from this instance |
|  §0.10, line 869: Finite-field polynomial counts for the vector sieve | 𝔽₂, j=0,1,2 | monic counts 1,2,4; irreducible counts 0,2,1; reciprocal sum 5/4≤1+log2; also ≤3/2 | Values agree; analytic hypotheses retained | None from this instance |
|  §1.1, line 911: Selberg's diagonal sum in dimension one (GGPY Lemma 3, κ=1) | γ(p)=1; sparse γ(pⱼ)/pⱼ=log2/logpⱼ | cγ=1 in the first case; sparse weighted square term ≥log2/(j+1), divergent; no square-sum inference | Finite normalization only | None from this instance |
|  §1.1, line 929: Smoothly weighted diagonal sum (Maynard Lemma 6.1, GGPY Lemma 4) | γ(p)=1, W=1, test G(t)=1 and G(t)=t | ∫₀¹1 dt=1; ∫₀¹t dt=1/2; main coefficients log z and (log z)/2 | Values agree; analytic hypotheses retained | None from this instance |
|  §1.2, line 943: Brun combinatorial coefficients | P=2,y=8,β=2 | λ⁺(1)=λ⁻(1)=1; λ⁺(2)=0,λ⁻(2)=−1; brackets at r=2: 0≤0≤1; support 2<8 | Values agree; analytic hypotheses retained | None from this instance |
|  §1.2, line 970: Brun pointwise divisor brackets | P=2,y=8,β=2 | λ⁺(1)=λ⁻(1)=1; λ⁺(2)=0,λ⁻(2)=−1; brackets at r=2: 0≤0≤1; support 2<8 | Values agree; analytic hypotheses retained | None from this instance |
|  §1.2, line 982: Brun coefficient modulus bound | P=2,y=8,β=2 | λ⁺(1)=λ⁻(1)=1; λ⁺(2)=0,λ⁻(2)=−1; brackets at r=2: 0≤0≤1; support 2<8 | Values agree; analytic hypotheses retained | None from this instance |
|  §1.2, line 994: Strict Brun coefficient support | P=2,y=8,β=2 | λ⁺(1)=λ⁻(1)=1; λ⁺(2)=0,λ⁻(2)=−1; brackets at r=2: 0≤0≤1; support 2<8 | Values agree; analytic hypotheses retained | None from this instance |
|  §1.2, line 1006: Dimension-controlled Brun main terms | P=1,X=1,R₁=0,κ=1,K=2,u=10 | V=main±=S=1; δ=2¹⁰=1024; elementary lower main factor −1023 is not positive | Values agree; analytic hypotheses retained | None from this instance |
|  §1.2, line 1018: Brun fundamental sieve estimate | P=1,X=1,R₁=0,κ=1,K=2,u=10 | V=main±=S=1; δ=2¹⁰=1024; elementary lower main factor −1023 is not positive | Values agree; analytic hypotheses retained | S09: add acceptance theorem |
|  §1.3, line 1032: Selberg optimal weights | P=6,ν(2)=1/2,ν(3)=1/3,z=4; P=1,z=1 | G=5/2,λ=(1,−4/5,−3/5,0), main=2/5; strict G(1)=0 excludes z=1 | Values agree; analytic hypotheses retained | None from this instance |
|  §1.3, line 1058: Selberg upper-bound sieve | P=6,ν(2)=1/2,ν(3)=1/3,z=4; P=1,z=1 | G=5/2,λ=(1,−4/5,−3/5,0), main=2/5; strict G(1)=0 excludes z=1 | Values agree; analytic hypotheses retained | None from this instance |
|  §1.4, line 1070: Binary sieve Euler denominator | g(p)=0, z=2, degree bound 1 | squarefree sum 1 = Euler product 1 | Values agree; analytic hypotheses retained | None from this instance |
|  §1.4, line 1080: Curvature-to-area and lcm cutoff comparison | circle R=32,θ=1,z=2; unrelated-R control | 1024≤A=3216.990877; z²=4≤√A=56.7185; unrelated data give 14400>10000 | Values agree; analytic hypotheses retained | None from this instance |
|  §1.4, line 1095: Finite-character Gram bound from lattice discrepancies | closed disk R=32,w=2, coefficient 1 at origin only; finite normalization | N=3209; four character sums all 1: energy 4; coefficient energy 1; majorant 3209+C·32^θ·2^max(5,7−2θ) | Finite normalization only | None from this instance |
|  §1.4, line 1121: Binary-form large sieve on convex domains | disk radius 32,Q=x,θ=1,z=2,a=k₀=k₁=k₂=1 | positive-x lattice count 1572; rough-product scale A=3216.990877; modulus-one comparisons are identities | Finite normalization only | S04: move prerequisites earlier |
|  §1.4, line 1131: Binary-form large sieve with a conservative cutoff | disk radius 32,Q=x,θ=1,z=2,a=k₀=k₁=k₂=1 | positive-x lattice count 1572; rough-product scale A=3216.990877; modulus-one comparisons are identities | Finite normalization only | S04: move prerequisites earlier |
|  §1.4, line 1137: Binary sieve cutoff comparison | Q=x,z=3,s=1 | both Euler products 1/2; multiplicative cutoff factor s^degree=1 | Values agree; analytic hypotheses retained | S04: move before consumers |
|  §1.4, line 1147: Binary polynomial sieve at power level | disk radius 32,Q=x,θ=1,z=2,a=k₀=k₁=k₂=1 | positive-x lattice count 1572; rough-product scale A=3216.990877; modulus-one comparisons are identities | Values agree; analytic hypotheses retained | None from this instance |
|  §1.4, line 1157: Binary sieve with divisibility conditions | disk radius 32,Q=x,θ=1,z=2,a=k₀=k₁=k₂=1 | positive-x lattice count 1572; rough-product scale A=3216.990877; modulus-one comparisons are identities | Values agree; analytic hypotheses retained | None from this instance |
|  §1.4, line 1167: Multiplicative decoupling inequality | Z=1,g=δ₁,ψ=δ₁ (so ψ(pʲ)=0 for j≥1) | sum 1 = 1·empty product 1 | Values agree; analytic hypotheses retained | None from this instance |
|  §1.4, line 1177: Average absorption of the density correction | Q=x,f=1,z=3 | base 11/6; corrected 23/9; ratio 46/33<2 | Values agree; analytic hypotheses retained | None from this instance |
|  §1.4, line 1187: Large smooth-factor saving | Q=x,f=δ₁,z=e⁴,α=1/2,s=κ=1,r=1,ε=1/10 | left 0; right scale e^(−1/2)=0.60653066; κ≤1.8 | Values agree; analytic hypotheses retained | None from this instance |
|  §1.4, line 1197: Extremely smooth-factor saving | Q=x,z=16,r=1; α=0,β=1 and α=1,β=1/2 | left 31/16≤16; endpoint left 1/16≤1/4; constants fixed after α | Values agree; analytic hypotheses retained | None from this instance |
|  §1.4, line 1207: Binary multiplicative-function sieve | disk radius 32,Q=x,θ=1,z=2,a=k₀=k₁=k₂=1 | positive-x lattice count 1572; rough-product scale A=3216.990877; modulus-one comparisons are identities | Values agree; analytic hypotheses retained | None from this instance |
|  §1.4, line 1215: Analytic proof requirement | Q=x²,p=3 | ordinary ρ(9)=27>18; corrected ρ̃(3)=0; ordinary bound is not implied | Values agree; analytic hypotheses retained | None from this instance |
|  §1.4, line 1219: Binary sieve with a fixed divisor | disk radius 32,Q=x,θ=1,z=2,a=k₀=k₁=k₂=1 | positive-x lattice count 1572; rough-product scale A=3216.990877; modulus-one comparisons are identities | Values agree; analytic hypotheses retained | None from this instance |
|  §1.4, line 1229: Binary sieve with a unit congruence | disk radius 32,Q=x,θ=1,z=2,a=k₀=k₁=k₂=1 | positive-x lattice count 1572; rough-product scale A=3216.990877; modulus-one comparisons are identities | Values agree; analytic hypotheses retained | None from this instance |
|  §1.5, line 1241: Polynomial Bonferroni brackets | bad subset cardinalities 0,1,2; v=1 | lower sums 1,0,−1; indicators 1,0,0; upper sums 1,0,0 | Values agree; analytic hypotheses retained | None from this instance |
|  §1.5, line 1251: Brun sieve for polynomial vectors | one 𝔽₂ component A=D=1,I={T},ℓ=11 | rough probability 1; product main scale 2·1/2=1; defect term for T is 1/2 | Values agree; analytic hypotheses retained | None from this instance |
|  §1.5, line 1261: Polynomial Euler product excluding T | p=2,m=0 and 1 | products 1 and 1/2; upper bounds 2 and 1 | Values agree; analytic hypotheses retained | None from this instance |
|  §1.6, line 1273: Prime upper bound in intervals | x=y=2 | π(4)−π(2)=1; leading scale 4/log2=5.77078 | Finite normalization only | None from this instance |
|  §1.6, line 1283: Prime upper bound in progressions | (k,a,x)=(1,0,4),(3,1,12) | counts 2 and 1; C=1 scales 4/log4 and 12/(2log4), both positive | Finite normalization only | None from this instance |
|  §1.6, line 1293: Selberg bounds for twin primes and Goldbach | x=7; even N=4 and 10 | twin count 2; ordered Goldbach counts 1 and 3; odd-prime local products 1 and 4/3 | Values agree; analytic hypotheses retained | None from this instance |
|  §1.6, line 1303: Brun reciprocal convergence | twin primes p≤7: 3 and 5 | partial sums 1/3+1/5=8/15 and 1/5+1/7=12/35 | Values agree; analytic hypotheses retained | None from this instance |
|  §1.6, line 1313: Selberg denominator in dimension κ | g(n)=μ²(n)/n,z=10000; strict z=1 | exact rational squarefree sum ≈10.5433421 versus log10000≈9.2103404; at z=1 sum 0 | Finite normalization only | None from this instance |
|  §1.6, line 1329: Selberg parity sequences | n=4,12,0 | (even,odd) weights (1,0),(0,1),(0,0); Ω(12)=3 versus ω(12)=2 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.1, line 1387: Multiplicity of an integer difference | M=2,n=0,1,2 | pair counts 2,1,0 = truncated 2−‖n‖ | Values agree; analytic hypotheses retained | None from this instance |
|  §2.1, line 1399: Triangular Fourier sum as a squared modulus | M=2,t=1/2; t=0 control | K=0 = sin²π/sin²(π/2); integral phase K=4 while quotient is undefined mathematically | Values agree; analytic hypotheses retained | None from this instance |
|  §2.1, line 1409: Sine quotient for a finite Fourier sum | M=2,t=1/2; t=0 control | K=0 = sin²π/sin²(π/2); integral phase K=4 while quotient is undefined mathematically | Values agree; analytic hypotheses retained | None from this instance |
|  §2.1, line 1421: Piecewise taper weights and their bounds | N=1,L=2,n=1,2,3; L=0 control | W=1,1/2,0; totalized L=0 gives 0 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.1, line 1433: Finite tapered Fourier vector | N=1,L=2, frequency −1,x=1/4, coefficient 1 | coordinate i; pairing −i=e(−1/4); core weight 1; L=0 vector 0 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.1, line 1459: Coordinates of the tapered Fourier vector | N=1,L=2, frequency −1,x=1/4, coefficient 1 | coordinate i; pairing −i=e(−1/4); core weight 1; L=0 vector 0 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.1, line 1471: Untapered coordinates on the core | N=1,L=2, frequency −1,x=1/4, coefficient 1 | coordinate i; pairing −i=e(−1/4); core weight 1; L=0 vector 0 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.1, line 1481: Signed Gram kernel of tapered vectors | N=L=1,x−y=1/2 | Gram=−1=(K₂−K₁)/1; modulus 1≠−1 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.1, line 1491: Squared norm of the tapered Fourier vector | N=1,L=2 | weight sum 1/2+1+1+1+1/2=4=2N+L | Values agree; analytic hypotheses retained | None from this instance |
|  §2.1, line 1501: Off-diagonal tapered Gram bound | N=L=1,x−y=1/2 | modulus 1 ≤1/(1·sin²(π/2))=1 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.1, line 1511: Tapered pairing recovers a core Fourier sum | N=1,L=2, frequency −1,x=1/4, coefficient 1 | coordinate i; pairing −i=e(−1/4); core weight 1; L=0 vector 0 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.1, line 1523: Large-sieve bound from cosecant row control | two frequencies 0,1/2; N=L=1; f at frequency 0 | Fourier energy 2≤(2+1+1)·1=4 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.2, line 1539: Sine lower bound from circular distance | t=1/2 and 1/4 | 4d²=1 and 1/4; sin²=1 and 1/2 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.2, line 1549: Two-point bound for circular radial bins | δ=3/10, points 0 and 2/5 | radial floor 1; bin count 1≤2, despite upper endpoint 3/5>1/2 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.2, line 1559: Separated cosecant-square row bound | δ=1/2, points 0 and 1/2 | row sum 1≤π²/3=3.2898681 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.2, line 1569: Explicit positive integer taper width | δ=1/2,L=2 | L+π²/(12δ²L)=3.6449341≤4=2/δ | Values agree; analytic hypotheses retained | None from this instance |
|  §2.2, line 1579: Large sieve on the centered finite core | H=2,a=(1,1), frequencies 0,1/2,δ=1/2 | energy 4≤(2+4)·2=12; H=0 gives 0≤0 | Finite normalization only | None from this instance |
|  §2.2, line 1591: Centered interval coefficient vector | H=2,L=2,a=(1,i); H=0 control | padded frequencies 0,1; norm²=2=1+1; translation centre at M=0 is 1; empty norm 0 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.2, line 1617: Coordinates of the centered interval vector | H=2,L=2,a=(1,i); H=0 control | padded frequencies 0,1; norm²=2=1+1; translation centre at M=0 is 1; empty norm 0 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.2, line 1629: Core support of the interval vector | H=2,L=2,a=(1,i); H=0 control | padded frequencies 0,1; norm²=2=1+1; translation centre at M=0 is 1; empty norm 0 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.2, line 1639: Norm preservation under interval padding | H=2,L=2,a=(1,i); H=0 control | padded frequencies 0,1; norm²=2=1+1; translation centre at M=0 is 1; empty norm 0 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.2, line 1649: Fourier translation of the padded interval | H=2,L=2,a=(1,i); H=0 control | padded frequencies 0,1; norm²=2=1+1; translation centre at M=0 is 1; empty norm 0 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.2, line 1659: Cardinality above the circle diameter | δ=3/5 | two points impossible since maximum distance 1/2<3/5; singleton cardinal 1 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.2, line 1669: Bombieri's additive large sieve | H=2,a=(1,1), frequencies 0,1/2,δ=1/2 | energy 4≤(2+4)·2=12; H=0 gives 0≤0 | Finite normalization only | None from this instance |
|  §2.3, line 1685: Circular separation of reduced fractions | Q=2, fractions 0/1 and 1/2 | circle distance 1/2≥1/Q²=1/4 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.3, line 1695: Additive large sieve over reduced residues | Q=H=1,a=1,M=0 | primitive/reduced energy 1≤(1+2)·1=3; q/φ(q)=1 | Finite normalization only | None from this instance |
|  §2.3, line 1705: Integer phase of the standard residue character | q=2,u=1,n=1 | stdAddChar(1)=−1=e(1/2); q=1 gives 1=1 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.3, line 1715: Squared norm of a primitive Dirichlet Gauss sum | q=1, unit coefficient/function 1; principal q=4 control | primitive energy and Gauss norm² 1=1; q=4 principal Gauss sum 0 and not primitive | Values agree; analytic hypotheses retained | None from this instance |
|  §2.3, line 1727: Gauss expansion of a finite character sum | q=1, unit coefficient/function 1; principal q=4 control | primitive energy and Gauss norm² 1=1; q=4 principal Gauss sum 0 and not primitive | Values agree; analytic hypotheses retained | None from this instance |
|  §2.3, line 1739: Parseval identity over Dirichlet characters | q=1, unit coefficient/function 1; principal q=4 control | primitive energy and Gauss norm² 1=1; q=4 principal Gauss sum 0 and not primitive | Values agree; analytic hypotheses retained | None from this instance |
|  §2.3, line 1749: Primitive character energy at one modulus | Q=H=1,a=1,M=0 | primitive/reduced energy 1≤(1+2)·1=3; q/φ(q)=1 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.3, line 1759: Primitive-character large sieve | Q=H=1,a=1,M=0 | primitive/reduced energy 1≤(1+2)·1=3; q/φ(q)=1 | Finite normalization only | None from this instance |
|  §2.4, line 1773: Incomplete logarithm | n=0..40,U,V=0..6; n=8,U=V=2 witness | 2009 exact prime-log coefficient identities; n=0: 0=0; n=8: log2=log2 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.4, line 1800: Subtracting the short von Mangoldt divisor sum | n=0..40,U,V=0..6; n=8,U=V=2 witness | 2009 exact prime-log coefficient identities; n=0: 0=0; n=8: log2=log2 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.4, line 1810: Vanishing below the incomplete-log cutoff | V=3,n=2; n=0 | λ₃(2)=0 and λ₃(0)=0 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.4, line 1820: Pointwise incomplete-log coefficient bounds | V=2,n=12 and n=0 | λ₂(12)=log6 between 0 and log12; λ₂(0)=log0=0 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.4, line 1830: Möbius inversion of the incomplete logarithm | n=0..40,U,V=0..6; n=8,U=V=2 witness | 2009 exact prime-log coefficient identities; n=0: 0=0; n=8: log2=log2 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.4, line 1840: Vaughan's identity with its boundary term | n=0..40,U,V=0..6; n=8,U=V=2 witness | 2009 exact prime-log coefficient identities; n=0: 0=0; n=8: log2=log2 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.4, line 1850: Weighted Vaughan identity on a finite hyperbola | n=0..40,U,V=0..6; n=8,U=V=2 witness | 2009 exact prime-log coefficient identities; n=0: 0=0; n=8: log2=log2 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.4, line 1860: Exact support of the bilinear Vaughan term | V=2,ℓ=4,m=1,N=4 | λ₂(4)=log2≠0; 2<4 and 1≤floor(4/3)=1 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.4, line 1870: Finite Type I–Type II Vaughan decomposition | n=0..40,U,V=0..6; n=8,U=V=2 witness | 2009 exact prime-log coefficient identities; n=0: 0=0; n=8: log2=log2 | Finite normalization only | None from this instance |
|  §2.4, line 1880: Elementary Vaughan coefficient energies | V=2,L=1,M=2 | λ₂(2)=0; first energy 0≤log²2; μ(2)²=1=M−L | Values agree; analytic hypotheses retained | None from this instance |
|  §2.5, line 1894: Primitive character energy on a dyadic band | all coefficients zero; empty dyadic band J=0 | E_a=E_b=T=0; both sides 0, including every cofactor mask | Values agree; analytic hypotheses retained | None from this instance |
|  §2.5, line 1906: Bilinear primitive character bound on one band | all coefficients zero; empty dyadic band J=0 | E_a=E_b=T=0; both sides 0, including every cofactor mask | Values agree; analytic hypotheses retained | None from this instance |
|  §2.5, line 1918: Exact partition of the dyadic modulus interval | R=1,J=2,c(q)=1 | 3 integers in (1,4]; bands have 1+2=3 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.5, line 1930: Finite sum of the bilinear dyadic coefficients | R=1,H=K=0,J=1 and 0 | coefficient sum 8≤9; at J=0 both sides 0 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.5, line 1942: Primitive bilinear tail through a dyadic endpoint | all coefficients zero; empty dyadic band J=0 | E_a=E_b=T=0; both sides 0, including every cofactor mask | Values agree; analytic hypotheses retained | None from this instance |
|  §2.5, line 1954: Primitive bilinear tail at an arbitrary cutoff | all coefficients zero; empty dyadic band J=0 | E_a=E_b=T=0; both sides 0, including every cofactor mask | Values agree; analytic hypotheses retained | None from this instance |
|  §2.6, line 1968: Squared finite large-sieve duality | matrix [[1,i]]; coefficient (1,−i) | forward energy 4≤2·2=4; adjoint energy at b=1 is 2=2·1 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.7, line 1980: Heath-Brown quadratic large sieve | M=N=1,a₁=1 | Jacobi(1,1)=1; energy 1≤C·2 with C=1 | Finite normalization only | S06: import earlier owner |
|  §2.7, line 1990: Heath-Brown quadratic bilinear estimate | M=N=1,a=b=1 | sum modulus 1≤C(1+1)=2 at C=1 | Values agree; analytic hypotheses retained | S06: consume owner theorem |
|  §2.7, line 2000: Prime-denominator quadratic symbol | p=2,3; a=3,6,2,9 | symbol₂(3,2)=1; symbol₂(6,2)=0; (2/3)=−1; (9/3)=0 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.7, line 2024: Prime quadratic-symbol bilinear estimate | K=3,L=2,a=b=1 | sum=2 from odd numerators 1,3; even numerator contributes 0 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.7, line 2034: Jutila mean value lemma | X=8,N=2,a₂=1,a₁=0 | six discriminant squares 0,1,0,1,1,0 sum to 3; diagonal term 8C; nonnegative eighth-moment term | Finite normalization only | S02 and S10: own prerequisites and state headline |
|  §2.7, line 2044: Smith prime Legendre-symbol estimate | X₁={3,5},X₂={7,13},t₁=5,t₂=13,ε=1/10,c₂=c₄=1,a=1/10 | symbol rows (−1,1),(−1,−1); absolute row sum 2; cardinal lower bounds 0.311,0.507<2; log13<5 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.7, line 2054: Koymans–Pagano normalized row mean | X₁={3,5},X₂={7,13},t₁=5,t₂=13,ε=1/10,c₂=c₄=1,a=1/10 | symbol rows (−1,1),(−1,−1); absolute row sum 2; cardinal lower bounds 0.311,0.507<2; log13<5 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.8, line 2068: Polynomial Farey coefficient adapter | p=2,G=1,H=T+1,ℓ=1; one-point coefficient population | reciprocal expansion at infinity has c₀=c₁=1; additive phase −1; squared norm 1 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.8, line 2094: Polynomial Farey large sieve | p=2,ℓ=1,m=2,f₀=f₁=1; ℓ=m=0 | fractions 1/T,1/(T+1): left 2≤2^0·2²=4; degree-zero fraction 0/1 gives 1=1 | Finite normalization only | S01: add acceptance theorem |
|  §2.8, line 2104: Additive sieve for bounded integer coefficients | H=Y=1,a₀=1,all other a=0 | only q=1 contributes; left 1≤3(1+1)·1=6 | Values agree; analytic hypotheses retained | None from this instance |
|  §2.9, line 2116: Separated Hilbert inequality | x=(0,1/2),a=(1,i),δ=1/2 | Hilbert sum modulus 4≤(π/δ)·2=4π | Values agree; analytic hypotheses retained | None from this instance |
|  §2.9, line 2126: Sharp separated additive large sieve | H=2,a=(1,1),x=(0,1/2),δ=1/2 | left 4≤(H−1+δ⁻¹)·2=6 | Finite normalization only | None from this instance |
|  §2.9, line 2136: Sharp primitive-character large sieve | Q=H=1,a=1 | left 1 = (H−1+Q²)·1 | Finite normalization only | None from this instance |
|  §2.9, line 2146: Large sieve for forbidden residues | P={2},Ω₂={0}, interval {1,2}, surviving indicator | Z=1; L denominator 1+1=2; energy uses coefficient at 2 equal 0 | Finite normalization only | None from this instance |
|  §2.9, line 2156: Least quadratic nonresidue | p=3,7,2 | least nonresidues 2,3,0 (the last is outside the odd-prime domain) | Values agree; analytic hypotheses retained | None from this instance |
|  §2.9, line 2181: Linnik bounded exceptional primes | N=7,ε=1/2 | exceptional set {7}, cardinal 1; 2²≤7<3² distinguishes p=3 and p=7 | Finite normalization only | None from this instance |
|  §3.1, line 2221: Level of distribution of the primes (Maynard (1.3)) | x=10,q=3 and q=1; θ=0 | class counts 1,2 versus mean 2 give discrepancy 1; q=1 discrepancy 0, so level-zero sum 0 | Values agree; analytic hypotheses retained | None from this instance |
|  §3.2, line 2260: Arithmetic progression discrepancy | f=δ₂,x=3,q=3,a=1; q=2 control | D=0−1/2=−1/2; at q=2 the nonunit is omitted, D=0 | Values agree; analytic hypotheses retained | None from this instance |
|  §3.2, line 2287: Discrepancy to restricted character sums | f=g=0, positive cutoffs; q=1 principal-conductor control | discrepancies, energies and restricted sums 0=0; nonprincipal character family at q=1 is empty | Values agree; analytic hypotheses retained | None from this instance |
|  §3.2, line 2297: Primitive-conductor reduction of discrepancies | primitive conductor 4 inflated to modulus 8; r=4,s=2 | gcd(r,s)=2; χ(1)=1,χ(3)=−1,χ(2)=0; coprimality mask reproduces all three | Values agree; analytic hypotheses retained | None from this instance |
|  §3.2, line 2307: Convolution discrepancy mean value | f=g=0, positive cutoffs; q=1 principal-conductor control | discrepancies, energies and restricted sums 0=0; nonprincipal character family at q=1 is empty | Values agree; analytic hypotheses retained | None from this instance |
|  §3.2, line 2317: Maximal Bombieri–Vinogradov theorem | q=1,x=4, with every real y≤4 | sup error 3−log2=2.3068528; at y=4 error 4−log12=1.5150934 | Values agree; analytic hypotheses retained | None from this instance |
|  §3.3, line 2329: Bombieri–Vinogradov: every level θ<1/2 | θ=0, q=1 | prime-count discrepancy 0, summed error 0≤C x/log(x)^A; θ<1/2 includes this endpoint | Values agree; analytic hypotheses retained | None from this instance |
|  §3.4, line 2343: Weighted prime-distribution transfer | q=1; zero coefficients for bilinear terms | prime-count error 0, window error 1; coefficient correlation discrepancy 0=0 | Values agree; analytic hypotheses retained | None from this instance |
|  §3.4, line 2355: Arithmetic discrepancy second moment | f=δ₁,x=1,Q=3,Δ=1 | q=1,2 discrepancies 0; q=3 values ±1/2; sum of squares 1/2; RHS scale 4C(1+log3)^5 | Values agree; analytic hypotheses retained | None from this instance |
|  §3.4, line 2365: Barban–Davenport–Halberstam theorem | x=4,Q=1 | ψ(4)=log12=2.48490665; residual log12−4=−1.51509335; square 2.29550786 | Values agree; analytic hypotheses retained | None from this instance |
|  §3.4, line 2375: Bilinear congruence correlation | q=1; zero coefficients for bilinear terms | prime-count error 0, window error 1; coefficient correlation discrepancy 0=0 | Values agree; analytic hypotheses retained | None from this instance |
|  §4.1, line 2407: Admissible tuple | H={0,2},{0,1},{0,2,4},∅ | mod-2 images have cardinal 1,2; latter prime-translate sets {2},{3}; empty tuple translates all naturals | Values agree; analytic hypotheses retained | None from this instance |
|  §4.1, line 2434: The prime k-tuples conjecture, as a named statement | H={0,2},{0,1},{0,2,4},∅ | mod-2 images have cardinal 1,2; latter prime-translate sets {2},{3}; empty tuple translates all naturals | Values agree; analytic hypotheses retained | None from this instance |
|  §4.2, line 2462: The W-trick residue v₀ (Maynard (4.1)) | H={0,2}, W=6 | v₀=5 gives gcd(5·7,6)=1; v₀=1 gives gcd(1·3,6)=3 | Values agree; analytic hypotheses retained | None from this instance |
|  §4.2, line 2489: Maynard's multidimensional sieve weights | k=W=1,F=1,R=4,N=2,h=0; then F=0 | λ₁=5/2,λ₂=−2,λ₃=−3/2; w₂=1/4,w₃=1; S₁=S₂=5/4; all vanish for F=0 | Values agree; analytic hypotheses retained | S05: add missing definition Checks |
|  §4.3, line 2525: Maynard's variational quantity M_k | k=2 triangle indicator; twice it; zero-fibre polynomial | I=1/2,2,1/3150; each J=1/3,4/3,0; ratios 4/3,4/3,0; zero function I=J=0 | Values agree; analytic hypotheses retained | None from this instance |
|  §4.3, line 2569: Smooth approximation within the simplex | k=1, positive smooth compactly supported interval bump; δ=1 | choosing F₁=F gives ratio difference 0>−1; I and J are strictly positive | Values agree; analytic hypotheses retained | None from this instance |
|  §4.4, line 2585: Size of λ in terms of y (Maynard (5.9)) | k=1,W=1,R=2,y₁=1 and other y=0 | max λ=1 = Σ_(u<2)μ²(u)τ₁(u)/φ(u) | Values agree; analytic hypotheses retained | None from this instance |
|  §4.4, line 2597: Diagonal form of S₁ (Maynard Lemma 5.1) | finite normalization k=2,H={0,2},N=2,R=2,W=1,F(0)=1 | weights at 2,3 are 1,1; S₁=2; prime coordinates give S₂=1+2=3; not an assertion about the asymptotic threshold | Finite normalization only | None from this instance |
|  §4.4, line 2607: Diagonal form of `S₂^{(m)}` (Maynard Lemma 5.2) | finite normalization k=2,H={0,2},N=2,R=2,W=1,F(0)=1 | weights at 2,3 are 1,1; S₁=2; prime coordinates give S₂=1+2=3; not an assertion about the asymptotic threshold | Finite normalization only | None from this instance |
|  §4.4, line 2629: Asymptotic for S₁ (Maynard Lemma 6.2) | finite normalization k=2,H={0,2},N=2,R=2,W=1,F(0)=1 | weights at 2,3 are 1,1; S₁=2; prime coordinates give S₂=1+2=3; not an assertion about the asymptotic threshold | Finite normalization only | None from this instance |
|  §4.4, line 2641: Asymptotic for `S₂^{(m)}` (Maynard Lemma 6.3) | finite normalization k=2,H={0,2},N=2,R=2,W=1,F(0)=1 | weights at 2,3 are 1,1; S₁=2; prime coordinates give S₂=1+2=3; not an assertion about the asymptotic threshold | Finite normalization only | None from this instance |
|  §4.4, line 2653: Maynard's asymptotics for S₁ and S₂ (Proposition 4.1) | finite normalization k=2,H={0,2},N=2,R=2,W=1,F(0)=1 | weights at 2,3 are 1,1; S₁=2; prime coordinates give S₂=1+2=3; not an assertion about the asymptotic threshold | Finite normalization only | None from this instance |
|  §4.5, line 2667: The GPY positivity criterion | weights 1 at n=2,3, H={0,2},ρ=1 | weighted positivity (1−1)+(2−1)=1>0; n=3 has 2>1 primes | Values agree; analytic hypotheses retained | None from this instance |
|  §4.5, line 2679: From prime clusters to prime gaps | n=3,H={0,2},r=2 | primes 3,5 have consecutive gap 2 = diameter H | Values agree; analytic hypotheses retained | None from this instance |
|  §4.5, line 2691: Primes in admissible tuples (Maynard Proposition 4.2) | k=0 and k=1 boundary normalizations | M₀=0 gives r₀=0; M₁=1 and 0<θ≤1 gives ceil(θ/2)=1 | Values agree; analytic hypotheses retained | None from this instance |
|  §4.6, line 2705: Lower bound for M_k when k is large (Maynard Proposition 4.3(3)) | k=22026, expression normalization only | log k−2loglog k−2 = 3.394812896; not a claimed finite threshold | Finite normalization only | None from this instance |
|  §4.6, line 2717: Moments on the simplex (Maynard Lemma 8.1, corrected) | k=5,a=2,b=0; k=1,a=0,b=j=1 | 2!/7!=1/2520≠0; ∫₀¹t=1/2 | Values agree; analytic hypotheses retained | None from this instance |
|  §4.6, line 2729: I_k and J_k as quadratic forms (Maynard Lemma 8.2) | k=5, four monomials of (8.16) | I=29509/1222452000; sumJ=40493/838252800; ratio=1417255/708216>2 | Values agree; analytic hypotheses retained | None from this instance |
|  §4.6, line 2741: M₅ > 2 (Maynard Proposition 4.3(1)) | k=5, four monomials of (8.16) | I=29509/1222452000; sumJ=40493/838252800; ratio=1417255/708216>2 | Values agree; analytic hypotheses retained | None from this instance |
|  §4.6, line 2753: M₁₀₅ > 4 (Maynard Proposition 4.3(2)) | all 42 printed rational coefficients at k=105 | exact I and sumJ match the displayed fractions; sumJ/I=4.000543795842186; (sumJ−4I)/I=.0005437958421860858 | Values agree; analytic hypotheses retained | None from this instance |
|  §4.7, line 2822: Engelsma's admissible 105-tuple of diameter 600 | all 105 listed shifts; 27 primes through 103 | cardinality 105; diameter 600; missing residues at 2,3,5,7,11,13: 1,2,1,4,7,6 | Values agree; analytic hypotheses retained | None from this instance |
|  §4.7, line 2834: The first k primes above k are admissible | k=5 and k=0 | {7,11,13,17,19} has diameter 12 and misses 0 mod5; empty diameter convention unused | Values agree; analytic hypotheses retained | None from this instance |
|  §4.7, line 2846: Bounded gaps between primes (Maynard Theorem 1.3) | ratio₁₀₅=4.000543795842186; θ=0.49999 | θ ratio/2=1.00011594>1; ceil is 2; diameter conversion gives 600 | Finite normalization only | None from this instance |
|  §4.7, line 2858: Gaps under Elliott–Halberstam (Maynard Theorem 1.4) | variational ratios at k=5 and 105 | 2/ratio₅=0.99941930<1; 4/ratio₁₀₅=0.99986407<1; strict θ<1 choices exist | Values agree; analytic hypotheses retained | None from this instance |
|  §4.7, line 2870: m + 1 primes in bounded intervals (Maynard Theorem 1.1) | m=1 normalizing scale | m³exp(4m)=exp4=54.598150; constant chosen before m | Finite normalization only | None from this instance |
|  §4.7, line 2882: A positive proportion of admissible m-tuples are prime (Maynard Theorem 1.2) | m=1,A={0,1}; m=0 excluded | both singleton subsets have infinite prime shifts; count 2=choose(2,1) | Finite normalization only | None from this instance |
|  §4.8, line 2896: Bouniakowsky and Schinzel hypotheses | f=X+1, X²+X+2, X(X+2),1; pair X,X+1 | first is admissible; second values 2,4 are even; third reducible; 1 a unit; pair covers both residues mod2 | Values agree; analytic hypotheses retained | None from this instance |
|  §5.1, line 2962: From roughness to an almost-prime bound | z=2,n=1,8,25 and n=0 control | Ω=0,3,2; 8<2³ is false; 25<5³ and roughness at 5 give P₂; zero excluded | Values agree; analytic hypotheses retained | None from this instance |
|  §5.2, line 2976: Linear sieve functions | s=1,2,3,4 | F(1)=2e^γ; f(2)=0; f(4)=e^γlog3/2=0.9783540; F(3)=2e^γ/3 | Values agree; analytic hypotheses retained | None from this instance |
|  §5.2, line 3004: Rosser sieve weights | D=8; d=1,2,3 | upper weights 1,0,0 since p³≥8; lower weights 1,−1,−1 | Values agree; analytic hypotheses retained | None from this instance |
|  §5.2, line 3031: Rosser–Iwaniec linear sieve | P=1,X=1, all R=0; z=D=2 | V=1,S=1; lower coefficient f(1)=0 and upper coefficient F(1)=2e^γ bound 1 | Values agree; analytic hypotheses retained | None from this instance |
|  §5.2, line 3041: Beta sieve in general dimension | κ=1 and κ=1/2 endpoints | (β,A,B)=(2,2e^γ,0) and (1,2sqrt(e^γ/π),0); β₁=2<9 | Values agree; analytic hypotheses retained | None from this instance |
|  §5.2, line 3051: Positive lower sieve above 9t | t=1,s=9.5; elementary u=10,K=2 control | 9.5>9; β₁=2<9.5; elementary error 1024>1 so cannot yield positivity | Finite normalization only | None from this instance |
|  §5.2, line 3069: Fundamental lemma for the linear sieve | exact population, all remainders 0; s→∞ | relative remainder 0; limiting upper/lower function values both 1 | Finite normalization only | None from this instance |
|  §5.2, line 3079: Richert logarithmic weights | N=8,α=1/4,β=1,r=1,n=8 | only distinct prime 2 is weighted; Ω(8)=3; square exception 2² divides 8 | Values agree; analytic hypotheses retained | None from this instance |
|  §5.2, line 3105: Richert weighted sieve | multiples of 30; r=2,γ=.9,α=.225,β=.81 | g(2)=g(3)=g(5)=1 fails margin; f(4)−integral=0.44514382>0 while Ω≥3 | Values agree; analytic hypotheses retained | None from this instance |
|  §5.2, line 3121: Richert explicit level threshold | r=2 and 3 | Λ₂=1.83404377, Λ₃=2.77124375; 1/Λ₃<1/2<1/Λ₂ | Values agree; analytic hypotheses retained | None from this instance |
|  §5.3, line 3133: Joint-spin arithmetic data | σ of order 2 versus 3; empty S control | order2 has σ=σ⁻¹ and cannot belong; order3 singleton obeys inverse exclusion; ‖S‖=0 rejected | Values agree; analytic hypotheses retained | None from this instance |
|  §5.3, line 3159: Short character input for joint spins | q=15,k=3 and k=15; subset sizes 2 then 1 | reduced conductors 5>1 and 1 excluded; δ transfers to δ/2 | Values agree; analytic hypotheses retained | None from this instance |
|  §5.3, line 3175: Squarefull norm tail for spin divisors | β with norm radical g₀=1, Z=1; zero difference excluded | tail indicator 0; Z^(−1+2/3)=1 at Z=1; zero difference cannot enter factorization | Values agree; analytic hypotheses retained | None from this instance |
|  §5.3, line 3185: Common norm tail for two spin differences | norm differences 1 and 1,Z=1; zero-difference control | gcd=1 so tail indicator 0; zero differences are separated rather than factored | Values agree; analytic hypotheses retained | None from this instance |
|  §5.4, line 3197: Primitive affine sieve pair | values {2,3}; coordinate on all ℤ; empty orbit | gcd values 1 but no value coprime to 6; value1 avoids every q; empty orbit fails q=2 | Values agree; analytic hypotheses retained | None from this instance |
|  §5.4, line 3223: Affine almost-prime locus and saturation | singleton orbit f=6,1,0; signed values −6 and 8 | least saturation indices 2,0,undefined (outside convention 0); Ω(6)=2,Ω(8)=3; empty locus not dense in singleton | Values agree; analytic hypotheses retained | S05: add density and minimum Checks |
|  §5.4, line 3251: Affine walk sieve data | length0 identity word; two distinct words with same value | mass 1 at length0; collision weight 2=1+1, not 1 | Values agree; analytic hypotheses retained | None from this instance |
|  §5.4, line 3277: Local densities for affine orbits | G=SL₂, f=upper-left entry, prime p | zero-locus density 1/(p+1); at p=2 density 1/3<1; β(p)=1/p+O(p^(−2)) | Values agree; analytic hypotheses retained | None from this instance |
|  §5.4, line 3287: Affine sieve level from expansion | dim=3,τ=1/2,δ=1/12; R supported only at d=1 | τ+δdim=3/4<1; Σ‖R‖=1; at R=0 both sides 0 | Values agree; analytic hypotheses retained | None from this instance |
|  §5.4, line 3297: Escape from proper algebraic subvarieties | proper empty subvariety; entire G as excluded control | empty count 0; count in G is X, incompatible with a strict power saving | Values agree; analytic hypotheses retained | None from this instance |
|  §5.4, line 3307: Affine sieve saturation with expansion | G=SL₂,Γ=SL₂(ℤ),f=upper-left entry; matrices [[2,1],[1,1]] and [[8,1],[7,1]] | determinants 1,1; f-values 2 and 8 have Ω=1 and 3; first lies in P₁, second is outside P₂ | Values agree; analytic hypotheses retained | None from this instance |
|  §5.4, line 3317: Explicit affine almost-prime bound | q=1 trivial quotient; bipartite degree2k control | no nonconstant q=1 eigenvector; nonconstant eigenvalue −2k survives one-sided expansion and prevents absolute mixing | Values agree; analytic hypotheses retained | None from this instance |
|  §5.4, line 3327: Squarefree congruence expansion for SL₂ | q=1 trivial quotient; bipartite degree2k control | no nonconstant q=1 eigenvector; nonconstant eigenvalue −2k survives one-sided expansion and prevents absolute mixing | Values agree; analytic hypotheses retained | None from this instance |
|  §5.5, line 3339: Chen switching weight | N=1000,n=11,286,3,27 | weights 1,0,1/2,1/2; n=27 violates squarefreeness and Ω=3 | Finite normalization only | None from this instance |
|  §5.5, line 3364: Goldbach local factor | N=6,10,18,0 | C₆/C₂=2,C₁₀/C₂=4/3,C₁₈/C₂=2,C₀=0 | Values agree; analytic hypotheses retained | None from this instance |
|  §5.5, line 3389: Chen switched triple upper bound | normalizing constants in the Chen subtraction | 3.9404/2=1.9702; 2.6408−1.9702=0.6706; tuples retain ordered multiplicity | Finite normalization only | None from this instance |
|  §5.5, line 3401: Chen primes with an almost-prime shift | h=2,x=10 | qualifying primes 2,3,5,7 give count 4; nonunit condition excludes Ω=0 | Finite normalization only | None from this instance |
|  §5.5, line 3411: Chen original-family lower estimate | corrected logarithmic expression V | V≈−0.0164726270754; valid lower endpoint −0.0164727; final lower margin >2.6408077 | Finite normalization only | None from this instance |
|  §5.5, line 3421: Chen’s Goldbach theorem | N=10 finite normalization | qualifying p=3,5,7 give count 3; complement Ω values 1,1,1; asymptotic threshold not asserted at 10 | Finite normalization only | None from this instance |
|  §5.6, line 3433: Quadratic ideal residue symbol adapter | K=ℚ, denominator unit,5 and even ideal; K degree2 control | (0/unit)=1; (2/5)=−1,(4/5)=1,(15/5)=0; rational ideal in degree2 gives +1 | Values agree; analytic hypotheses retained | None from this instance |
|  §5.6, line 3464: Ideal-symbol reciprocity adapter | ℚ, (α,β)=(3,7),(−1,−1),(3,3) | products −1=(−1)·1; 1=(−1)·(−1); last excluded: ideal product 0 versus Hilbert ±1 | Values agree; analytic hypotheses retained | None from this instance |
|  §5.6, line 3480: Joint spin of ideals | ψ=0; unit element/ideal for symbol normalizations | all joint coefficients and Type I/II sums 0; individual spin of 1 is 1; bound scales with fixed sup‖ψ‖ | Values agree; analytic hypotheses retained | S07: import existing chain |
|  §5.6, line 3509: Type I estimate for joint spins | ψ=0; unit element/ideal for symbol normalizations | all joint coefficients and Type I/II sums 0; individual spin of 1 is 1; bound scales with fixed sup‖ψ‖ | Values agree; analytic hypotheses retained | S07: import existing chain |
|  §5.6, line 3519: Joint-spin bilinear kernel | K=ℚ(t),t³+t²−2t−1=0; α=1+8t,β=1+16σ(t); also β=1 | residues both 1 mod8; Φ(α,β)=1, Φ(β,α)=−1; Φ(α,1)=Φ(1,α)=1; residue-only exchange fails | Counterexample to exchange law | S11: retain real-place sign |
|  §5.6, line 3545: Bilinear bound for spin kernels | ψ=0; unit element/ideal for symbol normalizations | all joint coefficients and Type I/II sums 0; individual spin of 1 is 1; bound scales with fixed sup‖ψ‖ | Values agree; analytic hypotheses retained | S11: correct kernel premise before application |
|  §5.6, line 3555: Type II estimate for joint spins | ψ=0; unit element/ideal for symbol normalizations | all joint coefficients and Type I/II sums 0; individual spin of 1 is 1; bound scales with fixed sup‖ψ‖ | Finite normalization only | S07: import existing chain |
|  §5.6, line 3565: Ideal divisor and logarithmic coefficient bounds | K=ℚ; unit ideal,(4); square moment through 4 | τ=1,3; Λ=0,log2≤log4; Στ²=1+4+4+9=18 | Values agree; analytic hypotheses retained | None from this instance |
|  §5.6, line 3583: FIMR sieve conversion to prime ideals | ϑ=δ/(54n‖S‖²), θ=1/(6n); n=3,‖S‖=1,δ=1 | saving ϑθ/(2+θ)=1/5994 with denominator 54·3·37=5994; ψ=0 sums 0 | Values agree; analytic hypotheses retained | None from this instance |
|  §5.6, line 3593: Oscillation of joint spins over prime ideals | ϑ=δ/(54n‖S‖²), θ=1/(6n); n=3,‖S‖=1,δ=1 | saving ϑθ/(2+θ)=1/5994 with denominator 54·3·37=5994; ψ=0 sums 0 | Finite normalization only | S07: import existing chain |
|  §5.6, line 3603: Equidistribution of joint spin signs | one sign coordinate e,s∈{±1} | (1+es)/2 equals 1 when e=s and 0 otherwise; two coordinates give uniform coefficient 1/4 | Finite normalization only | None from this instance |

The Lean ledger below gives every declaration's effective context. Names have the common prefix `TauCetiRoadmap.SieveMethodsAndPrimePatterns`. All finite sums use the displayed finite carrier; classical decidability is local. “Normalization” is a finite evaluation, not a proof of a frequent/eventual statement.

| Declaration and Lean line | Section, variables and instances retained | Instances and computed values | Result / change |
|---|---|---|---|
| SieveGram.selberg_weighted_inner:41 | Layer 0; independent universes for 𝕜,E,ι; RCLike 𝕜, NormedAddCommGroup E, InnerProductSpace 𝕜 E, Fintype ι; y,x | Empty ι gives 0≤‖x‖²; zero row 0/0=0; x=1,y=(1,2) gives 1/3+4/6=1; complex y=i requires reconstruction coefficient −i | Context retained; zero rows legitimate |
| SieveSelberg.diagonalMass:52 | Layer 1; s:BoundingSieve,z:ℝ; no X≥0 premise | P=1: z=1 gives 0,z=2 gives 1; P=2,ν₂=1/2: z=2 gives 1,z=3 gives 2 | Strict cutoff |
| SieveSelberg.selberg_upper_bound:57 | Layer 1; s,z,hz:1<z | P=1,A₁=1,X=−1 gives R₁=2, bound 1≤−1/1+2=1; z=1 excluded because G=0 | Negative approximate mass is allowed correctly |
| SieveApplications.prime_interval_upper:68 | Layer 1; ∃ absolute C>0 before all real x,y≥2 | x=y=2: π4−π2=1; main term 4/log2≈5.77078; error multiplier loglog6>0 | Uniformity retained |
| SieveApplications.twin_goldbach_upper:74 | Layer 1; common absolute C; x:ℕ≥3; N:ℕ≥4 even | x=7 twin count 2; N=4,10 Goldbach counts 1,3; local products 1,4/3; odd factors p≥3 make p−2 positive | Ordered counts and natural subtraction agree |
| SieveApplications.progression_upper:82 | Layer 1; absolute C before k,a:ℕ,x:ℝ; k≥1,coprime(a,k),x≥4k | (k,a,x)=(1,0,4):2≤C·4/log4; (3,1,12):1≤C·6/log4; k=0 excluded | Modulus one retained |
| SieveApplications.brun_reciprocals:89 | Layer 1; subtype of p:ℕ with p,p+2 prime | p=3,5 partial sums 8/15 and 12/35; no zero denominator | Correct two summability statements |
| SieveTaper.additive_largeSieve:102 | Layer 2; arbitrary universe ι, Fintype,DecidableEq; M:ℤ,H:ℕ,a:Fin H→ℂ,x:ι→ℝ,δ>0,pairwise circular separation | H=0:0≤0; H=2,a=(1,1),x=(0,1/2),δ=1/2:4≤12; empty frequency family:0≤RHS | Non-sharp constant and empty cases correct |
| SieveTaper.sharp_additive_largeSieve:110 | Same, H≥1,0<δ≤1/2 | Same two-frequency example:4≤6; H=1,one point,a=1,δ=1/2:1≤2 | Extra hypotheses explicit |
| SieveCharacters.primitive_largeSieve:122 | Layer 2; Q,H:ℕ,M:ℤ,a:Fin H→ℂ; q indexed by Fin Q then q+1; all primitive complex characters | Q=0 or H=0:0≤0; Q=H=1,a=1:1≤3; q/φ(q)=1 at q=1 | No accidental modulus zero |
| SieveApplications.sharp_primitive_largeSieve:134 | Layer 2; same positive cutoffs Q,H≥1 | Q=H=1 gives 1=(H−1+Q²)·1; principal mod4 has Gauss sum 0 but is excluded as imprimitive | Correct conductor restriction |
| SieveApplications.leastNonresidue:144 | Layer 2; p:ℕ; conditional Nat.find on an odd prime and existence, default 0 | p=3,7,2 gives 2,3,0; jacobi(3,3)=0≠−1 | Domain and default correct |
| SieveApplications.linnik_exceptional:151 | Layer 2; ε>0; C before every N:ℕ≥2 | N=7 threshold √7≈2.64575; p=3 has q=2 below threshold; p=7 has q=3 above; exceptional count 1≤C | Uniformity retained; normalization only |
| SieveQuadratic.primeDenominatorSymbol:160 | Layer 2; a:ℤ,p:ℕ; explicit p=2 parity branch | (a,p)=(3,2),(6,2),(2,3),(9,3):1,0,−1,0; (3,0) gives native Jacobi value 1 | Different from Kronecker at (3,2) by design |
| SieveQuadratic.quadratic_largeSieve:165 | Layer 2; ε>0; C before M,N≥1 and a:ℕ→ℂ; both ranges odd squarefree | M=1,N=3,a₁=1,a₃=−1:0 versus energy 2; changing a₃ to 1 gives 4 versus energy 2 | Truth/source match; S06 ownership deletion |
| SieveQuadratic.prime_quadratic_bilinear:176 | Layer 2; ε>0; C before K,L≥1,complex sequences,bounds A,B≥0 on finite ranges | K=3,L=2,a=b=1:sum 2; RHS=C[6^(1+ε)/√2+3]; A=0 forces sum and bound 0 | Dyadic error retained |
| SieveQuadratic.smith_prime_legendre_bilinear:188 | Layer 2; ε>0; C before disjoint finite sets of odd primes and real t₁,t₂≥2 | X₁={3,5},X₂={7,13}: rows (−1,1),(−1,−1), absolute row sum 2; empty set gives 0 | Signature correct; S02 prerequisite |
| SieveQuadratic.koymans_pagano_row_mean:198 | Layer 2; c₂,c₄,a>0 then ε>0 then C; disjoint odd primes;3≤t₁≤t₂;growth and cardinality lower bounds | t₁=5,t₂=13,c₂=c₄=1,a=.1:log13<5; lower sizes .311,.507<2; left 2; RHS=4C·5^(3/4+ε) | Correct constant order; S02 prerequisite |
| SieveVaughan.vaughan_identity:217 | Layer 2; U,V,n:ℕ, no positive-cutoff assumptions | 2009 exact coefficient equalities; n=0:0=0; U=V=0 gives μ*log=Λ; n=8,U=V=2 gives log2 on both sides | Boundary term retained |
| SieveDistribution.primeCountAP:236 | Layer 3; x:ℝ,q,a:ℕ; finite floor range | (5,1,0),(10,2,0),(5,0,5),(4,0,5) give 3,1,1,0; negative x gives count 0 | Includes nonunit classes and totalized q=0 |
| SieveDistribution.discrepancy:241 | Layer 3; x:ℝ,q:ℕ; real sSup of finite reduced-class errors | (10,3),(5,3),(5,1),(5,0) give 1,3/2,0,0; at q=0 the real empty supremum is 0 | Mean uses all primes, as README |
| SieveDistribution.PrimesHaveLevel:247 | Layer 3; θ:ℝ; ∀ A>0 followed by big-O atTop | θ=0:only q=1, error 0; θ<0:eventual empty sum 0; θ=2:positive errors on x<q≤x² give order x², incompatible with x/log^A x | Correct quantified level |
| SieveDistribution.ElliottHalberstam:254 | Layer 3; no free parameters; ∀ θ<1 | θ=1/2,3/4 included; θ=1,2 excluded; θ=0 included with sum 0 | Conjecture not assumed automatically |
| SieveDistribution.primesHaveLevel_of_lt_half:258 | Layer 3; θ:ℝ,hθ:θ<1/2 | θ=0 gives zero sum; θ=−1 eventually zero; θ=1/2 is excluded | Right endpoint deliberate |
| SieveArithmeticDistribution.bombieri_vinogradov_maximal:268 | Layer 3; A>0; B,C,x₀ before x,Q; x≥x₀≥3;1≤Q≤√x/log^B x; q positive; real y∈[0,x] | q=1,x=4:sup error=3−log2≈2.30685; endpoint error=4−log12≈1.51509 | Maximality not silently replaced by endpoint |
| SieveArithmeticDistribution.barban_davenport_halberstam:279 | Layer 3; A>0; B,C,x₀ before x,Q;1≤Q≤x/log^B x | q=1,x=4:ψ4=log12; square error=(log12−4)²≈2.29550786 | ψ−x normalization retained |
| SieveMaynard.IsAdmissible:296 | Layer 4; H:Finset ℕ; every prime misses a residue | ∅,{0,2} true; {0,1} false at 2; {0,2,4} false at 3; {0,2,6,8,12} misses1,1,4 at2,3,5 | Tests both directions |
| SieveMaynard.primeTranslates:301 | Layer 4; H:Finset ℕ; set of natural translations | ∅→ℕ; {0}→primes; {0,1}→{2}; {0,2,4}→{3} | Infinitude distinct from nonemptiness |
| SieveMaynard.maynardSimplex:306 | Layer 4; k:ℕ; real vectors Fin k→ℝ | k=0 unique vector with sum0 in; k=2:(1/2,1/2) in,(1,1) out,(−1,0) out | Rank-zero and nonnegative coordinates retained |
| SieveMaynard.maynardI:311 | Layer 4; k,F: (Fin k→ℝ)→ℝ; integral on unit cube, not automatically simplex | F=0:0; triangle indicator:1/2; twice it:2; zero-fibre polynomial:1/3150 | Real body; support is a separate premise |
| SieveMaynard.maynardJ:316 | Layer 4; k,m:Fin k,F; iterated Lebesgue integral with m-coordinate replaced | triangle:1/3; twice triangle:4/3; zero-fibre polynomial:0; F=x on triangle: x-fibre1/20,y-fibre1/30 | Coordinate dependence and square placement correct |
| SieveMaynard.IsMaynardAdmissible:322 | Layer 4; k,F; pointwise support, MemLp 2 on cube, I≠0,each J≠0 | triangle true; zero false by I=0; global one false by support; zero-fibre polynomial false by J=0 despite I=1/3150 | Each defining condition distinguishes a wrong input |
| SieveMaynard.maynardRatio:329 | Layer 4; k,F; real sumJ/I | zero:0/0=0; triangle:4/3; twice triangle:4/3; global cube constant k=2:2 | Totalized and homogeneous |
| SieveMaynard.maynardM:334 | Layer 4; k; real supremum of ratios over explicit admissibility predicate | M₀=0; M₁=1; triangle gives4/3≤M₂≤2 | Supremum is bounded; no sorry'd carrier |
| SieveMaynard.infinite_many_primes_of_level:339 | Layer 4; real θ with0<θ≤1 and level; k; injective h:Fin k→ℕ; admissible image | k=0:ceil(θM₀/2)=0, all natural n qualify; k=1:ceil(θ/2)=1; duplicated shifts excluded by injectivity | Headline generality matches |
| SieveMaynard.eventually_log_sub_lt_maynardM:348 | Layer 4; eventual k atTop | At k=22026 comparison scale is3.394812896; this is not claimed to be the start of the eventual range | Source asymptotic, finite normalization only |
| SieveMaynard.maynardM_five_ge:355 | Layer 4; no variables | Exact witness ratio1417255/708216≈2.001162075 exceeds2 and equals stated lower bound | Nontrivial certificate, not padding |
| SieveMaynard.four_lt_maynardM_105:360 | Layer 4; no variables | Exact42-term ratio4.000543795842186>4 | Nontrivial certificate |
| SieveMaynard.frequently_nth_prime_succ_sub_le_600:365 | Layer 4; frequently n:ℕ atTop | n=0:first gap3−2=1; θ=.49999 with certificate gives θ·ratio/2≈1.00011594; tuple diameter600 | Correct index shift; infinitude source needed |
| SieveMaynard.elliottHalberstam_gaps:371 | Layer 4; explicit ElliottHalberstam assumption | n=0 gaps1 and3; thresholds2/ratio₅≈.9994193<1,4/ratio₁₀₅≈.99986407<1 | Both conditional gap conclusions retain hypothesis |
| SieveMaynard.exists_frequently_nth_prime_sub_le:378 | Layer 4; absolute C>0 before m≥1; frequent n | m=1 scale e⁴≈54.59815; n=0 actual gap1; m=0 excluded | Uniform in m, finite normalization only |
| SieveMaynard.positive_proportion_prime_tuples:386 | Layer 4; m≥1; r₀,c>0 before all finite A with card≥r₀ | m=1,A={0,1}:2 successful singleton subsets, choose(2,1)=2; arbitrary translations preserve infinitude | Threshold not asserted at this A |
| SieveWeighted.chen_goldbach:401 | Layer 5; c>0,N₀ before all sufficiently large even N; complement>1 and Ω≤2 | N=10:qualifying p=3,5,7,count3; Ω complements1,1,1; complement1 excluded | Nonunit and evenness explicit |
| SieveWeighted.chen_prime_shift:407 | Layer 5; fixed h:ℕ positive even; c,x₀ may depend on h | h=2,x=10:p=2,3,5,7 all qualify,count4; h=0 excluded | Correct fixed-shift uniformity |

The following **22 cached-source locator groups** were collated. A group is one row, not a claim that every page of its work was verified. Individual additional erratum locators appear below. Cached text was used directly; the Jutila and Bombieri image scans were also inspected where OCR obscured formulas.

| Source | Locators checked against cached text | Scope of comparison |
|---|---|---|
| HB-SIEVES | §1, equations (1.1)–(1.8), lines 69–225; Selberg denominator lines 556–570; progression bound lines 901–909; §4 lines 1184–1405; §5 lines 1768–1916; Richert and Chen lines 2088–2295 | Signed finite identities, arbitrary mass, Selberg optimization, logarithmic denominators, parity, linear sieve and weighted thresholds; listed source corrections |
| KED-ANT-11 | Definition 11.6 and Theorem 11.9, lines 500–597; Theorem 11.11 proof, lines 636–671 | Local residue data, dimension, mass/cutoff premises and unsupported two-residue inference |
| KED-ANT-12 | §12.1 lines 354–414; Lemma 12.1 lines 475–501; coefficient construction and Theorem 12.2 lines 530–686 | Strict first-failure cutoffs, coefficient brackets and lower-sign correction |
| KED-ANT-14 | §14.1 Wirsing calculation and §14.2 denominator, lines 365–500 | Squarefree support, Euler/Gamma normalization and distinct general-κ hypotheses |
| KED-chap-largesieve | Lemmas 15.1,15.4 and sharp theorem, lines 373–518; Exercise 15.4.4 lines 582–593 | Difference kernels, complex duality and endpoint sharp constant |
| KED-ANT-16 | Theorems 16.1,16.2 lines 373–462; Definition 16.3, Theorem 16.4, Lemma 16.5 lines 485–521; Definition 16.6 and Theorem 16.7 lines 549–596 | Primitive/reduced distinction, masking, CRT phase, dyadic nonresidue and smooth-count proof |
| KED-chap-bombieri | Theorems 17.1–17.5, lines 381–460 | Level <1/2, EH range, maximal version and BDH normalization |
| KED-ANT-18 | Lemma 18.2 lines 373–420; Theorem 18.3 lines 429–495; §18.2 lines 520–617; Theorem 18.5 and Corollary 18.6 lines 630–661 | Character reduction with all cofactors, Vaughan boundary, maxima, convolution and second-moment proof requirements |
| GGPY-2009 | Lemmas 3–4 with hypotheses (2.3)–(2.5), lines 410–473 | Dimension-one weighted diagonal and dependence on A₁,A₂,L |
| SS-23 | Lemma 6.3, lines 2788–2836 | Prime-symbol dyadic convention and prime bilinear bound; broader numerator range checked against HB-REAL-95 |
| SMITH-17 | Proposition 6.6, lines 3226–3265 | Disjoint odd-prime sets and symmetric t₁,t₂ exponents |
| KP-22 | Proposition 7.6 assumptions (ii),(iii), lines 2891–2913; equation (7.11), lines 2989–3004 | Log-growth and lower-cardinality assumptions retained in the normalized row estimate |
| BSKK-23 | Lemma 6.2, lines 1832–1875; Proposition 8.1 and Lemma 8.2, lines 2263–2345 | Polynomial Farey range m≤2ℓ, joint law and polynomial Brun parameters; finite monic/irreducible counts |
| KM-21 | Theorems 1–2, lines 65–96; Cₙ and analytic estimates lines 335–398; Lemmas 3.1,3.2 lines 533–540,719–735; Lemma 4.1 and proof lines 1205–1307 | Unit/character hypotheses, exact tail exponents, kernel carrier and period; source's positive-domain context versus S11 |
| FIMR-13 | Proposition 5.2, lines 1304–1314; §6 setup and Proposition 6.1 lines 1320–1347 | Prime-extraction exponent and distinction between all-ideal Type I and the restricted source congruence estimate |
| BENNETT-SIKSEK-2020 | Theorem 7, lines 1044–1058 | Unweighted Gram maximum; it does not itself supply the weighted denominator variant |
| MAYNARD-2015 | Theorems 1.1–1.4 lines 80–130; Propositions 4.1–4.3 lines 268–359; tuple footnote lines 380–385; Lemma 8.1 lines 1718–1780; Lemma 8.2 and certificates lines 1841–2029 | Quantifiers, variational constants, exact integration, 105-tuple, repaired moments and semidefinite J matrix |
| JUTILA-ORIGINAL | Lemmas 2–3 and (12)–(17), lines 102–159, scanned printed pp.194–195 | Full discriminant range, square-product diagonal, eighth moment and required earlier mean square with log⁸X |
| HB-REAL-95 | Theorem 1 and Corollaries 1–4, lines 185–257 | Odd-squarefree quadratic sieve and arbitrary-numerator bilinear consequence |
| KHAYUTIN-19 | Definitions 9.1,9.4,9.6, Theorem 9.7 and Lemmas 9.8–9.11, lines 3430–3690; Lemmas 9.21,9.23 lines 3968–4088; (47) and Propositions 9.25–9.26 lines 4172–4498; Appendix B lines 6102–6523 | Corrected densities, geometric cutoff, ordinary-density gap, scaled hypotheses and independently recomputed conic corrections |
| IWA-ROSSER | Theorem 1 and initial functions/constants, scanned pp.172–173 | Linear/general-dimension normalization, error and half-dimension endpoints; not a certification of BGS's stronger lower bound |
| BOMBIERI-1971 | Proposition 1 and proof, lines 4–95, scanned pp.401–403; final packing argument lines 100–119, p.404 | Weighted row denominator, signed Gram kernel and last radial-bin omission |

Additional computed controls: the 105 shifts are distinct, have diameter 600 and miss a residue at all 27 primes through 103; the first six missed residues are 1,2,1,4,7,6. The corrected genus sums at p=3 are 0,54 for k=0, ε=−1,+1 and 18,9 for k=1. The smooth-tuple counterexamples give 36745 ordered representations versus 35819 distinct integers at N=100000, and 387659 versus 344299 at N=1000000. Chen's displayed scalar expression evaluates to −0.01647262707537 and the resulting lower margin to 2.64080770563682; this checks the arithmetic, not the waived Chinese source's reduction.

## Not verifiable

- BGS-10, FIMR-ERRATUM-2015 and DFI-1997 remain **uncertified**. Their supplied theorem/equation locators were retained without pretending to collate unavailable text. In particular the stated BGS positivity threshold, squarefree expansion proof and exact numerical saturation endpoint were not source-certified. Bipartite mixing and strict-parameter issues can be checked mathematically without certifying the printed versions.
- CHEN-73-CN, HR-SIEVE, RICHERT-1969 and KM-16RANK-published remain **waived**. Chen's switching, fourth-moment and integral reductions, the Halberstam–Richert analytic proof and the imported spin-kernel argument were not independently collated to those texts. No settled reference was requested again.
- Jutila's earlier 1973 mean-square proof was not read. The available 1975 Lemma 2 supplies its statement and log⁸X normalization; S02 concerns ownership of that mathematical input, not a claim that the theorem is false. The apparent reference-number slip is recorded below.
- No fresh Lean elaboration was performed. The supplied 44 elaborated types were compared with the unchanged source; truth checks and native-definition inspection supplement that extraction. No assertion is made that any proposed repair has been compiled.
- The report does not certify every internal analytic estimate in these long source proofs. The source table specifies the locators collated, and the twelve declared supplier contracts remain conditional obligations. The frozen or waived texts have not been used to claim a new source error.
- The listed 28 sibling heads and service-indexed matches were searched. Open work not represented by those inputs was not independently discovered or inspected. No claim of absence is based solely on the resolver.

## Source issues

- **Misprint** in HB-SIEVES at introductory Goldbach question, p.1, line 24: the source says every even integer starting at 2 is a sum of two primes; it should be every even integer starting at 4; affects a stated result.
- **Error** in HB-SIEVES at Example 1, p.2, line 47: the source says the rough count is π(x)−π(z); it should be 1+π(x)−#{p prime:p<z}, retaining the unit and boundary prime; affects a stated result.
- **Misprint** in HB-SIEVES at divisor-count calculation, p.4, line 147: the source says the strict prime product has 2^π(z) divisors; it should be 2^#{p<z}, bounded above by 2^π(z); affects the proof.
- **Error** in HB-SIEVES at Example 2 and its divisibility count, pp.2–3, lines 49,90–103: the source says the image-set cardinality equals its parameter count; it should be a weighted image or indexed count preserving multiplicities; affects a stated result.
- **Error** in HB-SIEVES at Example 2 prime-pair interpretation, p.2, lines 54–56: the source says only the first prime needs the lower cutoff; it should be both prime factors above the cutoff, with ordering consistent with the population; affects a stated result.
- **Error** in HB-SIEVES at Example 3, p.2, line 63: the source says excluding primes congruent to 3 modulo 4 characterizes primitive sums of squares; it should be supplemented by 4∤n and a convention allowing zero coordinates; affects a stated result.
- **Gap** in HB-SIEVES at Corollary 1.2, p.4, lines 149–160: the source says the asymptotic follows solely from z≤log x; it should be stated with z→∞ or retain the exact finite Euler product for bounded z; affects a stated result.
- **Misprint** in HB-SIEVES at the Liouville error definition, p.24, lines 1215–1218: the source says the unnormalized summatory error decays to zero; it should be x exp(−c√log x), as required by the following squared calculation; affects the proof.
- **Misprint** in HB-SIEVES at the cutoff after (4.2), p.25, lines 1275–1279: the source says to use the preceding decaying E₁(x) as a growing cutoff; it should be x exp(−√log x); affects the proof.
- **Error** in HB-SIEVES at Theorem 4.1 induction, p.28, line 1389: the source says the transformed parameter lies in (0,2] for every p≥x^(1/s); it should be restricted to x^(1/3)≤p<x, with the remaining ranges handled separately; affects the proof.
- **Misprint** in HB-SIEVES at (5.3), p.33, lines 1655–1673: the source says the upper main sum is added to the positive first-failure tail; it should be the upper main sum minus that tail, with all terms normalized when dividing by X; affects the proof.
- **Misprint** in HB-SIEVES at Theorem 5.1, p.35, line 1782: the source says the lower main term has an upper estimate; it should be bounded below by W(z) times the lower sieve function minus its error; affects a stated result.
- **Misprint** in HB-SIEVES at Example 1 after Corollary 5.1, p.36, line 1812: the source says the remainder cutoff is x(log x)²; it should be x/(log x)², matching the subsequent O(y) error; affects the proof.
- **Error** in HB-SIEVES at Example 4, p.38, lines 1899–1903: the source says θ>1/2 gives positivity and θ>1/5 gives four factors; it should be 2/5<θ<1/2 for this argument; affects the proof.
- **Gap** in HB-SIEVES at the fundamental lemma, p.38, lines 1908–1916: the source says an absolute error bound in x suffices for relative asymptotics; it should be supplemented by remainder o(XW(z)) and vanishing relative sieve-function error; affects a stated result.
- **Misprint** in HB-SIEVES at partial summation after (6.3), p.44, lines 2192–2194: the source says the integral has the same lower and upper endpoint; it should be integrated from N^α to N^β; affects the proof.
- **Gap** in KED-ANT-11 at Theorem 11.11 proof, §11.5, unpaginated, lines 636–651: the source says the two-residue family satisfies the earlier sieve hypotheses after its remainder check; it should be supplied with the missing divisor-cutoff verification or a suitable stronger theorem; affects the proof.
- **Gap** in KED-ANT-11 at Theorem 11.11 proof, §11.5, unpaginated, lines 645–648: the source says an unspecified O(log z) prime sum gives dimension exactly 2; it should be replaced by the coefficient-one estimate log z+O(1); affects the proof.
- **Error** in KED-ANT-12 at the all-prime examples, §12.1, unpaginated, lines 401–414: the source says the unshifted coprimality sieve counts all primes and then twins; it should be the unit plus primes above the sieve cutoff, with shifted residue conditions for twins; affects a stated result.
- **Error** in KED-ANT-12 at Lemma 12.1, §12.2, unpaginated, lines 359,477–495: the source says the first-failure identity uses the inclusive Euler product at the final prime; it should be the strict left-limit product, with matching outer prime cutoffs; affects a stated result.
- **Misprint** in KED-ANT-12 at Theorem 12.2, §12.4, unpaginated, line 661: the source says the lower main term exceeds a factor greater than one times V; it should be the factor one minus the positive error; affects a stated result.
- **Misprint** in BOMBIERI-1971 at the coefficient after (4), p.402, lines 74–81: the source says the projection coefficient uses a globally summed squared Gram denominator; it should be the first-power absolute Gram row sum for the fixed index; affects the proof.
- **Misprint** in BOMBIERI-1971 at the kernel display, p.403, lines 77–89: the source says an inner-product modulus equals a signed kernel difference; it should be the absolute value of that difference; affects the proof.
- **Gap** in BOMBIERI-1971 at the radial bins, p.404, lines 100–104: the source says bins whose upper endpoints stay below one half cover all points; it should be augmented by the final partial bin and the antipodal endpoint; affects the proof.
- **Error** in KED-ANT-16 at Lemma 16.5, §16.3, unpaginated, lines 500–521: the source says the local energy bound applies to coefficients on excluded residues; it should be applied to coefficients masked onto surviving classes; affects a stated result.
- **Misprint** in KED-ANT-16 at Theorem 16.4 proof, §16.3, unpaginated, lines 485–521: the source says the primitive multiplicative theorem bounds the resulting additive energy; it should be the reduced-residue additive theorem, Theorem 16.1; affects the proof.
- **Misprint** in KED-ANT-16 at Lemma 16.5 CRT display, §16.3, unpaginated, line 535: the source says the second phase fraction sits inside the first denominator; it should be a₁/q₁+a₂/q₂; affects the proof.
- **Error** in KED-ANT-16 at Definition 16.6, §16.3, unpaginated, lines 549–551: the source says the least nonsquare residue is defined at every prime; it should be restricted to odd primes or separately totalized at 2; affects a stated result.
- **Misprint** in KED-ANT-16 at Theorem 16.7 proof, §16.3, unpaginated, lines 556–596: the source says (p−1)/(p+1) is asymptotic to one half; it should be asymptotic to one; affects the proof.
- **Error** in KED-ANT-16 at Theorem 16.7 smooth-number argument, §16.3, unpaginated, lines 588–596: the source says an ordered-prime-tuple sum is a lower bound for distinct smooth integers; it should be corrected for multiplicities and use an integer tuple length; affects the proof.
- **Gap** in KED-ANT-18 at Theorem 18.3 small-conductor estimate, §18.1, unpaginated, lines 466–470: the source says the bound contains only the second support's square root; it should be multiplied by the first support's square root as supplied by Lemma 18.2; affects the proof.
- **Gap** in KED-ANT-18 at Theorem 18.3 dyadic summation, §18.1, unpaginated, lines 473–495: the source says the displayed block bounds sum with no further logarithmic loss; it should be justified by a sharper argument or retain that loss; affects the proof.
- **Misprint** in KED-ANT-18 at the boundary after (18.2.2), §18.2, unpaginated, line 559: the source says only n<x^(1/5) contributes the omitted boundary; it should be n≤x^(1/5), including prime-power endpoints; affects the proof.
- **Error** in KED-ANT-18 at the partition parameter, §18.2, unpaginated, line 573: the source says x^(1/5)<δ≤1 for x>1; it should be a nonempty positive range, with the needed lower constraint proved; affects the proof.
- **Gap** in KED-ANT-18 at the multiplicative partition, §18.2, unpaginated, lines 573–585: the source says O(δ⁻¹) consecutive intervals cover [1,x]; it should be justified with the log x factor or a stated restricted interval; affects the proof.
- **Error** in KED-ANT-18 at the rectangles after (18.2.3), §18.2, unpaginated, lines 582–585: the source says rectangles with ℓ>L,m>M,LM=x cover ℓm≤x; it should be rectangles below the hyperbola with separate boundary-strip estimates; affects the proof.
- **Misprint** in KED-ANT-18 at the bilinear discrepancy display, §18.2, unpaginated, lines 592–596: the source says the residue and summation index share a name and the average lacks coefficients; it should be a distinct residue and identical bilinear summands in both terms; affects the proof.
- **Error** in KED-ANT-18 at the final substitution, §18.2, unpaginated, lines 605–609: the source says δ=√Δ turns its displayed bound into √Δ x log³x; it should be rederived, since direct substitution leaves an extra x/Δ factor; affects the proof.
- **Misprint** in KED-ANT-18 at Theorem 18.5, §18.3, unpaginated, line 635: the source says the sum over residue a uses a free residue m; it should be the discrepancy at a and a consistently squared ℓ² norm; affects a stated result.
- **Misprint** in MAYNARD-2015 at (4.4), p.389, lines 339–341: the source says to sum over j while the summand uses m; it should be summed over m; affects the proof.
- **Misprint** in MAYNARD-2015 at Theorem 1.1 proof, p.391, lines 398–401: the source says only primes smaller than k are handled by nondivisibility; it should be primes at most k; affects the proof.
- **Misprint** in MAYNARD-2015 at (5.8), p.393, lines 608–609: the source says the denominator uses undefined functions μ_i; it should be μ(d_i) in each factor; affects the proof.
- **Misprint** in MAYNARD-2015 at (6.18), p.404, lines 1353–1355: the source says the product excludes an undefined index j; it should be the integrated coordinate m; affects the proof.
- **Misprint** in MAYNARD-2015 at the sentence preceding (7.10), p.407, line 1582: the source says the removed constraint sums from index 1; it should be from index 2, matching the variables of the error integral; affects the proof.
- **Misprint** in MAYNARD-2015 at Lemma 8.1, p.409, lines 1724–1780: the source says the composition sum starts at length 1; it should be length 0 included, giving G_(0,j)=1; affects a stated result.
- **Misprint** in MAYNARD-2015 at (8.10), p.411, line 1976: the source says the factorial denominator uses c instead of twice c′ and the polynomial uses c; it should be (k+b+2c′−1)! and G_(c′,2)(k−1); affects the proof.
- **Error** in MAYNARD-2015 at matrix positivity after Lemma 8.2, p.411, lines 1978–1987: the source says both quadratic forms are positive definite; it should be positive semidefiniteness for the J form, and independence of basis vectors for the I form; affects the proof.
- **Misprint** in JUTILA-ORIGINAL at Lemma 2 reference, p.194, line 120: the source says the previously proved mean-square lemma is reference 2; it should be reference 3, the 1973 work identified in the introduction and bibliography; affects nothing.
- **Gap** in KHAYUTIN-19 at Lemma 9.9, pp.224–225, lines 3612–3644: the source says the lcm discrepancy estimate applies throughout the displayed range directly; it should be preceded by the curvature-to-area cutoff argument and a valid small-θ Gram bound; affects the proof.
- **Misprint** in KHAYUTIN-19 at Lemma 9.9 discrepancy bound, p.225, lines 3615–3624: the source says replacing area by lattice population keeps exactly the same discrepancy constant; it should be enlarged to absorb the second discrepancy contribution; affects the proof.
- **Error** in KHAYUTIN-19 at Lemma 9.11, pp.225–226, lines 3665–3690: the source says the product comparison is uniform for all positive s; it should be restricted to s≥1 or have its small-s factor changed; affects a stated result.
- **Gap** in KHAYUTIN-19 at Lemma 9.21, pp.230–231, lines 4025–4054: the source says the final prime sum is uniformly bounded; it should be estimated with the discarded Möbius-difference factors, since its displayed summands dominate 1/p; affects the proof.
- **Gap** in KHAYUTIN-19 at Lemma 9.23, p.231, lines 4078–4082: the source says the logarithmic argument covers α=0; it should be treated separately because log α is undefined there; affects the proof.
- **Gap** in KHAYUTIN-19 at Theorem 9.7 proof, (47), p.233, lines 4182–4185: the source says corrected-density control gives the required ordinary prime-power density bound; it should be replaced by a justified ordinary-density input or a different contribution estimate; affects the proof.
- **Gap** in KHAYUTIN-19 at Proposition 9.25, pp.235–236, lines 4333–4360: the source says the scaled curvature bound by area suffices for the same η; it should be bounded by scaled area to power 1−3η; affects the proof.
- **Misprint** in KHAYUTIN-19 at Proposition 9.26, pp.236–237, lines 4450,4465–4468: the source says the local residue is k₁ℓ after reducing the original congruence; it should be k₀k₁ℓ, or transport ℓ after dividing by k₀; affects a stated result.
- **Error** in KHAYUTIN-19 at Lemma B.4, pp.266–267, lines 6182–6209,6263–6277: the source says the smooth zero-level contribution is (1−χ)p^(n−1); it should be (p−1)(1+χ)p^(n−1), with the stated singular recursion; affects a stated result.
- **Misprint** in KHAYUTIN-19 at Proposition B.5 second branch, p.268, line 6329: the source says the counted modulus is p^ℓ; it should be p^n; affects a stated result.
- **Error** in KHAYUTIN-19 at Proposition B.5, (68), pp.268–269, lines 6368–6374: the source says scaling produces twice the parity exponent and a negative constant term; it should be exponent ℓ mod2 and constant +4ωu u_A; affects a stated result.
- **Error** in KHAYUTIN-19 at Corollary B.7, p.269, lines 6409–6424: the source says the pre-threshold formula includes n=ℓ; it should be n<ℓ, with the corrected non-lifting count at the threshold; affects a stated result.
- **Error** in KHAYUTIN-19 at Proposition B.8, pp.270–271, lines 6447–6456,6491–6515: the source says the final character term is (ωu/p); it should be (−ωu/p), as required by Q=q−ωD; affects a stated result.
- **Misprint** in KM-21 at Lemma 4.1 domain, p.20, lines 1205–1215: the source says the first argument is an ideal and the second lies in O_F; it should be nonzero elements of O_K coprime to f and elements of O_K; affects a stated result.
- **Misprint** in KM-21 at Lemma 4.1(P3), p.20, line 1215: the source says the complete sum is modulo the principal ideal (w); it should be modulo the rational norm ideal |N(w)|O_K, matching the preceding period; affects a stated result.
- **Misprint** in HB-SIEVES at Chen's local constant, p.46, lines 2293–2299: the source says the universal product uses only odd primes dividing N; it should be over all odd primes, with the N-dependent correction separate; affects a stated result.
- **Misprint** in KED-ANT-16 at (16.1.2), §16.1, unpaginated, lines 362–365: the source says the integer translated in the formula is n while m is quantified; it should be the quantified m; affects the proof.
- **Misprint** in KED-ANT-16 at the smooth-count asymptotic, §16.3, unpaginated, line 588: the source says the positive asymptotic constant is some N; it should be some c>0, while N tends to infinity; affects nothing.
- **Gap** in KM-21 at definition (2.4), pp.5–6, lines 243–274: the source says an arbitrary odd principal generator can be passed to ψ on unit classes modulo F; it should be restricted to ideals coprime to F or use an explicit zero extension; affects a stated result.
- **Error** in KM-21 at Theorem 1, p.2, lines 70–80: the source says the bound's constant depends only on K and ε despite unrestricted ψ; it should be allowed to depend on fixed ψ or require a bound for its supremum norm; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4fbab2b2f8b90794e0873ea2bfd5b4d063905ea9", "job": "RT-SieveMethodsAndPrimePatterns~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
