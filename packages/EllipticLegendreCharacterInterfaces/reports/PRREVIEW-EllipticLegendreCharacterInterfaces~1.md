# Review of EllipticLegendreCharacterInterfaces (pull request #1545 at 2b50d7a)

**Verdict:** accepted

No P1, P2 or P3 findings. This is an independent AI review; acceptance means ready for human final approval, not approval or merger of the pull request. The source-access limitations below remain explicit.

## Verified sound

Reviewed all 27 numbered target sections, their supporting APIs, Checks, proof routes and dependencies in `TauCetiRoadmap/EllipticLegendreCharacterInterfaces/README.md`, and both definitions and all seven theorems in `TauCetiRoadmap/EllipticLegendreCharacterInterfaces/Suggested.lean`. Read the repository README's normative writing rules and CONTRIBUTING, and compared the main-branch EllipticCurves roadmap and the completed Multiquadratic and EffectiveBounds roadmaps.

The worktree head is the requested `2b50d7a93d23152ea096f32ac7e0a7a09b1a9a5a`. The outside-folder diff and worktree status are empty. No PR file was edited. The worker's gate passes every check, including the targeted module build: all reported counters are zero. Independent direct elaboration of Suggested.lean exited successfully with exactly seven `sorry` warnings and no other warnings. The formerly missing imported object files were available for this run.

The dependency command specified in the brief returned:

```text
depcheck: 204 roadmaps, 1498 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. All 27 `*Needs:*` lines and the supplier contracts were examined. The local dependency direction is equations → invariants and normalization → valuations; CRT → squareclass readings → halving → torsion. The trace layer depends on the equations and native counts, independently of the conductor and descent layers. The occurrence of §2.8 in §2.5's explanatory Check is not an input to its proof. No undeclared supplier gap was found.

The roadmap is explicitly an extension of EllipticCurves: it leaves general equations, twists, local reduction, descent and conductors with their existing owners. It develops fields of arbitrary characteristic different from two, all odd finite fields, every good odd prime and all four indicated characters. The restrictions at two are mathematical hypotheses, witnessed below; they are not a selection of convenient good primes. No computational algorithm, copied source passage, sorry'd data, `set_option`, circular hypothesis or arbitrary substitute carrier was found.

### Source sample

All **15 seeded targets** were inspected. Every accessible BS20 locator was checked against the cached publisher text, including its printed page heading. The document identifies the generalizations it derives; I did not treat a prime-field source statement as already proving the arbitrary-field version. S09 and K84 are settled uncertified references, as detailed under Not verifiable.

| Target | Locator and what the text supports | Assessment |
| --- | --- | --- |
| 0.1 | BS20 line 513, equation (17), §6, printed p.367 | Correct equation. The commutative-ring coefficient identity is a direct specialization and does not require the paper's rational ellipticity assumptions. |
| 0.4 | S09 §III.1 | Text unavailable. Independently checked the native invariant definitions and the substitution, including zero ring, characteristic two, characteristic three and a nonreduced ring. |
| 0.5 | S09 §III.1 | Text unavailable. Native twist formulas and direct coefficient substitution give exactly powers d⁶ and d². |
| 0.6 | BS20 lines 544–545, proof of Lemma 6.2, printed p.368 | All six ratios and their order agree after λ=b/a. The target excludes every zero denominator. |
| 0.8 | BS20 lines 513–516 and 544–545, printed pp.367–368 | Supports the rational twist interpretation and six parameters. The general-field translation and the six scalars are derived in the README, and were recomputed independently. |
| 0.9 | S09 §§III.1–III.2; BS20 lines 515–516, p.367 | BS20 supplies the rational specialization. The general-field route uses the pinned normal-form, separable-cubic and two-torsion count declarations; no automorphism classification or exclusion of j=0,1728 is needed. |
| 0.10 | S09 §III.2; BS20 lines 666–667, proof of Lemma 6.5, p.370 | BS20 uses the three root points over a prime field. The labelled general-field set equality is derived using native negation and the root equation, rather than attributed to that special case. |
| 1.1 | S09 §III.1; BS20 lines 526–546, pp.367–368 | BS20 is the subsequent good-prime application, not the displayed valuation trichotomy. Independently checked the trichotomy from the rational j formula, including nonvanishing of its numerator. |
| 1.3 | BS20 lines 568–569, proof of Lemma 6.4, p.368 | The unit-parameter implication is present inside the proof. The README gives the independent unit-discriminant/minimality argument and does not import the progression hypotheses. |
| 1.4 | BS20 lines 526–536, Lemma 6.2(ii), pp.367–368 | Source assumes semistability away from two and concludes odd-conductor divisibility. The stronger support assertion is correctly derived from the named squareclass-character supplier and §1.2 without semistability. |
| 2.7 | BS20 lines 657–662, descent discussion, p.370 | Correct product-one assertion. The README separately treats O, nonroot points and root points over the general field. |
| 3.2 | BS20 lines 668–671, proof of Lemma 6.5, p.370 | Correct half (i,1−i), its double, and its first descent class. The general-field membership and doubling identities were checked. |
| 3.7 | BS20 lines 663–672, Lemma 6.5, p.370 | Exact two-part eight is stated for primes congruent to five modulo eight. The finite-field extension uses the cardinality versions of the supplementary laws and the explicitly supplied divisible-root information. |
| 5.1 | S09 §V.1; K84 p.41; BS20 lines 462–464, p.366 | BS20 confirms the K84 page reference for the prime-field symmetric Legendre case. The general normal-form count and all symmetric cubics, including the cusp, are derived using the pinned square-root formula and cancellation. |
| 5.2 | S09 §V.1; BS20 lines 703–705, proof of Lemma 6.6, p.371 | BS20 supplies the nonsquare d=2 Legendre specialization. The README's substitution proves the broader normal-form statement, including singular equations; its separate d=0 argument is valid. |

Also checked the other BS20 locators used by the roadmap: Lemma 6.3, lines 547–557, p.368; the descent branches at lines 659–662 and 710–715, pp.370–371; and the order-four witness at line 718, p.371. The latter contains the source error recorded below; the roadmap corrects it rather than inheriting it.

### Adversarial values

The table records statement-level tests, including each definition's API, every seeded target and all headline theorems. Numerical tests are evidence alongside the algebraic proof-route audit, not substitutes for proofs. Here L(d,λ) denotes the scaled model, L(λ)=L(1,λ), O is the point at infinity, and [a] is a nonzero squareclass. All displayed valuations are additive. “Agree” means the tested equality or equivalence agrees in the stated domain; negative controls are deliberately outside that domain. No change is proposed.

Independent finite-field enumeration checked **266 elliptic scaled models and 2,982 affine halving equivalences** over 𝔽₃, 𝔽₅, 𝔽₇, 𝔽₁₁ and 𝔽₁₃. It constructed **24 subgroups of size eight** for every admissible η in those fields. It checked **3,107 twist-trace identities** for all normal-form coefficient triples and all d over 𝔽₃, 𝔽₅ and 𝔽₇. It also checked all 21 symmetric cubics in the sampled prime fields with q≡3 mod4, and all 27 choices of a over 𝔽₂₇. Extension fields were constructed as 𝔽₉=𝔽₃[i]/(i²+1), 𝔽₂₇=𝔽₃[z]/(z³−z+1), and 𝔽₁₂₅=𝔽₅[z]/(z³+z+1).

| Statement | Instances tried | Values on the two sides / discriminating values | Result; change |
| --- | --- | --- | --- |
| Conventions: new-to-old translation | Roots (3,5,9), r=3 | Old roots minus 3=(0,2,6); L(2,3) roots=(0,2,6). Translation by −3 instead gives (6,8,12). | Agree; none |
| Conventions: twist normalization | d=2 in ℚ | 0²−4(−2/4)=2; using n=−2 instead gives 8. | Agree; none |
| Conventions: trace and Euler sign | λ=3 over 𝔽₅, d=1,2 | Counts 4,8; 6−counts=2,−2; polynomials 1−2T+5T², 1+2T+5T². | Agree; none |
| 0.1 coefficient definition | λ=2,−1 over ℚ | (a₂,a₄)=(-3,2),(0,-1), matching the expanded cubics x³−3x²+2x and x³−x. | Agree; none |
| 0.1 affine-equation equivalence | λ=2, (x,y)=(2,0),(−2,0) | 0²=0 in the first case; 0²≠−24 in the second, for both expanded and factored equations. | Agree; none |
| 0.1 coefficient mapping | ℚ's integral coefficients at λ=3 reduced mod 5 | (0,−4,0,3,0) reduces to (0,1,0,3,0), the same coefficients as L(3) over 𝔽₅. | Agree; none |
| 0.1 injectivity | λ=2,3, and λ=μ=2 | a₄ values 2≠3 distinguish the models; equal parameter gives identical five coefficients. The zero ring has just one parameter and one model. | Agree; none |
| 0.1 normal form | λ=0,2,−1 | (a₁,a₃)=(0,0) in each case; Δ=0,64,64 shows normal form alone does not assert ellipticity. | Agree; none |
| 0.1 Frey specialization | (A,B)=(1,−2) | B−A=−3 and −AB=2, exactly L(2)'s coefficients. | Agree; none |
| 0.1 ring boundary Checks | Zero ring; λ=2+ε in 𝔽₅[ε]/ε² | Zero-ring Δ=0=1 is a unit; direct native formula gives 4+2ε and (4+2ε)(4+3ε)=1. | Agree; none |
| 0.2 scaled definition and equation | d=2,λ=3 | Coefficients (0,−8,0,12,0); both cubics expand to x³−8x²+12x. | Agree; none |
| 0.2 scalar-one comparison | d=1,λ=3 | Both coefficient tuples are (0,−4,0,3,0). | Agree; none |
| 0.2 coefficient mapping | d=2,λ=3, reduce mod 5 | Scaled coefficients (−8,12) become (2,2); scaling the reduced parameters gives (2,2). | Agree; none |
| 0.2 native twist comparison | λ=3,d=2, n=−1/2 | Native weights give (a₂,a₄,a₆)=(-8,12,0), exactly L(2,3). | Agree; none |
| 0.2 twist ellipticity | d=0 and d=2, λ=3 over ℚ | Δ=0 versus 36864; native twisting discriminants 0 versus 2 give nonunit versus unit. | Agree; none |
| 0.2 Frey specialization | (A,B)=(2,−6), compare (2,6) | Correct pair gives (a₂,a₄)=(-8,12), roots (0,2,6); wrong sign gives (4,−12), roots (0,2,−6). | Agree; none |
| 0.2 square scaling | L(3), change scaling 1/2 | New (a₂,a₄)=(-16,48)=L(4,3); point coordinates multiply by (4,8). Scaling 1/4 gives (−64,768)=L(16,3); scaling 4 gives (−1/4,3/256). | Agree; none |
| 0.3 tuple definition and six evaluations | λ=3 and −1 over ℚ | (3,1/3,−2,−1/2,3/2,2/3); (−1,−1,2,1/2,1/2,2). | Agree; none |
| 0.3 admissibility | λ=3, versus total λ=0,1 | Six entries at 3 avoid 0,1; total boundary tuples are (0,0,1,1,0,0) and (1,1,0,0,0,0). | Agree; none |
| 0.3 reciprocal pairs | λ=3 | Products 3·(1/3), (−2)·(−1/2), (3/2)·(2/3) all equal 1. | Agree; none |
| 0.3 field-homomorphism compatibility | ℚ→ℝ, λ=1/2 | Both tuples are (1/2,2,1/2,2,−1,−1). Repeated labels 0,2 both remain 1/2. | Agree; none |
| 0.4 discriminant formula | λ=2,1/2,−1,3 over ℚ | Native invariant computation gives Δ=64,1,64,576; 16λ²(1−λ)² gives the same values. | Agree; none |
| 0.4 c₄ formula | Same parameters | Native c₄=48,12,48,112; 16(λ²−λ+1) gives 48,12,48,112. | Agree; none |
| 0.4 ellipticity iff | λ=0,1,2 over ℚ; λ=2 over 𝔽₃ | Δ=0,0,64 and 1 respectively; nonzero tests match both directions. In characteristic 2 every Δ is 0. | Agree; none |
| 0.4 j formula | λ=2,1/2,−1,3 over ℚ; λ=2 over 𝔽₃ | c₄³/Δ=1728,1728,1728,21952/9; characteristic-three value is 0³/1=0. | Agree; none |
| 0.5 scaled discriminant | (d,λ)=(2,3),(2,1/2),(0,3) | Direct native Δ=36864,64,0; d⁶Δ(L(λ))=36864,64,0. | Agree; none |
| 0.5 scaled c₄ | Same inputs | Direct c₄=448,48,0; d²c₄(L(λ))=448,48,0. Wrong d⁴ scaling at (2,3) would give 1792. | Agree; none |
| 0.5 ellipticity and j comparison | (2,3),(2,1/2),(0,3) | First two are elliptic with j=21952/9,1728, matching unscaled j. Last Δ=0, so no native j is formed. | Agree; none |
| 0.6 ordered cross-ratios | Roots (3,5,9), and coincident (0,0,1) | Ordered ratios (3,1/3,−2,−1/2,3/2,2/3) equal the tuple. Coincident-root first ratio is total 1/0=0, excluded. | Agree; none |
| 0.8 split normalization | Cubic with roots (3,5,9) | (a₂,a₄,a₆)=(-17,87,-135) translates to (−8,12,0)=L(2,3). | Agree; none |
| 0.8 six ordering scalars | Same roots, orders 012,021,102,120,210,201 | (d′,λ′)=(2,3),(6,1/3),(−2,−2),(4,−1/2),(−4,3/2),(−6,2/3); third roots d′λ′=6,2,4,−2,−6,−4. | Agree; none |
| 0.8 twist versus isomorphism | L(2,3) versus L(3) over ℚ | Discriminant ratio=64=2⁶; a rational twelfth power has 2-adic valuation divisible by 12, whereas 64 has valuation 6. Ordering 120 instead has square scalar 4 and yields L(−1/2) after scaling by 2. | Agree; none |
| 0.9 full-two-torsion normalization | y²=x³−x over ℚ and 𝔽₃; y²=x³−2x over ℚ | First two doubling kernels have size 4 and normalize with (d,λ)=(1,−1); last has size 2 and fails hfull. | Agree; none |
| 0.9 general-field control | K=𝔽₃(t), λ=t; extend by t=s³ | Roots (0,1,t) become (0,1,s³); Δ=t²(1−t)² becomes s⁶(1−s³)²≠0. Pure inseparability of the extension does not destroy the distinct roots. | Agree; none |
| 0.10 labelled point definition | (d,λ)=(1,−1),(2,1/2) over ℚ | Tuples are ((0,0),(1,0),(−1,0)) and ((0,0),(2,0),(1,0)); each cubic value is 0. | Agree; none |
| 0.10 doubling | Three roots of L(−1)/𝔽₃ | All three doubles are O, while each affine root point is different from O. | Agree; none |
| 0.10 injectivity and nonzero points | L(2,1/2)/ℚ | Three x-coordinates 0,2,1 are distinct; none is the infinity constructor. Tuple size=3. | Agree; none |
| 0.10 kernel exhaustion, both directions | L(−1)/𝔽₃ | Full point set and doubling kernel both equal {O,(0,0),(1,0),(2,0)}, size 4. | Agree; none |
| 0.10 horizontal-line relation | L(3)/ℚ | T₀+T₁=T₃ and T₃+T₃=O; replacing T₃ by O would give T₃ instead. | Agree; none |
| 1.1 negative parameter valuation | p=3,λ=1/3 | (a,b)=(-1,-1); v₃(j)=−2=2a. | Agree; none |
| 1.1 positive parameter valuation | p=3,λ=3 | (a,b)=(1,0); v₃(j)=−2=−2a. | Agree; none |
| 1.1 positive complement valuation | p=3,λ=−2 | (a,b)=(0,1); v₃(j)=−2=−2b. | Agree; none |
| 1.1 integral-j consequence | λ=−1,p=3; negative control λ=2,p=2 | First (vλ,v(1−λ),vj)=(0,0,3); dyadic control gives (1,0,6). Integral j suffices at odd primes, unit j is unnecessary. | Agree; none |
| 1.2 good-prime units, every ordering | L(−1)/ℚ at p=5 | Parameters −1,2,1/2 and complements 2,−1,1/2 all have valuation 0. | Agree; none |
| 1.2 model-independent reduction | L(−1) over ℚ₃, change scaling 1/3 | New a₄=−81 and v₃(Δ)=12; original a₄=−1 and v₃(Δ)=0. Both represent the same curve, with parameter valuations (0,0). | Agree; none |
| 1.3 integral model and good reduction | λ=3,p=5 versus p=3 | At 5, Δ mod 5=1, λ̄=3, (1−λ)̄=3; at 3, v₃Δ=2, λ̄=0. The unit hypothesis separates them. | Agree; none |
| 1.3 dyadic boundary | Residue field 𝔽₂ | The only possible nonzero λ̄ is 1, giving 1−λ̄=0; two unit parameters cannot occur. | Agree; none |
| 1.4 primitive-character support | λ=2,1/2; ω=1,−1,2,−2 | Conductor vectors are (8,8,1,4) in both cases; odd parts (1,1,1,1). | Agree; none |
| 1.4 nontrivial odd support | λ=3; same ω | Conductors (12,3,24,24), odd parts (3,3,3,3); v₃(ωλ)=1 and v₃(j)=−2. | Agree; none |
| 1.4 trivial-character boundary | λ=−1; same ω | Conductors (4,1,8,8), all odd parts 1; conductor-one input is included. | Agree; none |
| 1.5 odd-conductor divisibility | λ=3 at 3; L(−1) conductor 32 | First character odd conductor is 3, local elliptic conductor exponent is 1 versus v₃Δ=2. Second odd character conductor is 1, and 1 divides 32. | Agree; none |
| 2.1 ordered CRT definition/evaluations | d=2,λ=3, h=X+1,X²,1 | Images (1,3,7),(0,4,36),(1,1,1), matching direct evaluation at 0,2,6. | Agree; none |
| 2.1 inverse and equality detection | Lagrange basis at roots 0,2,6 | Evaluation matrix is diag(1,1,1); tuple (1,3,7) reconstructs X+1. A nonzero difference of degree≤2 cannot vanish at all three roots. | Agree; none |
| 2.1 native root image | d=1,λ=−1; d=2,λ=1/2 | Images (0,1,−1) and (0,2,1), exactly the declared order. | Agree; none |
| 2.1 unit iff | d=2,λ=3, h=X+1 versus X | Evaluations (1,3,7) are all nonzero, hence a unit; (0,2,6) has zero first coordinate, hence a nonunit. | Agree; none |
| 2.3 squareclass-equivalence definition | X+1 and X+2 on L(2,3)/ℚ | Readings (1,[3],[7]) and ([2],1,[2]); swapping the last roots changes the first to (1,[7],[3]). | Agree; none |
| 2.3 identity class | Constant 1 and constant 4 | Both read (1,1,1), since 1=1² and 4=2². Constant 0 is not a unit. | Agree; none |
| 2.3 triviality iff all coordinates trivial | Constants 4 and 2 over ℚ | 4 has three trivial coordinates; 2 has three nontrivial [2] coordinates. Inverse CRT transports the three coordinate square roots to a square root in A. | Agree; none |
| 2.3 multiplicativity | (X+1)(X+2) at roots 0,2,6 | Evaluations (2,12,56); classes ([2],[3],[14]) equal coordinate products of (1,[3],[7]) and ([2],1,[2]). | Agree; none |
| 2.5 nonroot descent | L(4)/𝔽₇, P=(3,1) | Differences (3,2,6); signs (−1,1,−1); product=36≡1=y². Reversed differences give product −1, a nonsquare. | Agree; none |
| 2.5 value at O | Any admissible model | Native μ(O)=1; split reading=(1,1,1), product 1. | Agree; none |
| 2.6 root-zero reading | L(2,3)/ℚ | Tuple (12,−2,−6); derivative at zero=12, not 0. | Agree; none |
| 2.6 root-d reading | Same model, root 2 | Tuple (2,−8,−4); derivative at 2=−8. | Agree; none |
| 2.6 root-dλ reading | Same model, root 6 | Tuple (6,4,24); derivative at 6=24. | Agree; none |
| 2.6 finite-field root readings | L(2,3)/𝔽₅ and L(−1)/𝔽₅ | First raw tuples (2,3,4),(2,2,1),(1,4,4), giving ([2],[2],1),([2],[2],1),(1,1,1). Second raw tuples (4,4,1),(1,2,2),(4,3,2). | Agree; none |
| 2.7 product-one theorem | Rational roots above; O; (2,4) on L(−1)/𝔽₅ | Products 144=12²,64=8²,576=24²; 1; and 2·1·3≡1. All yield squareclass 1. Uncorrected root representative would give inadmissible 0. | Agree; none |
| 2.8 halving iff, both directions | (0,0),(1,0),(2,4) on L(−1)/𝔽₅ | Difference triples (0,4,1),(1,0,2),(2,1,3); square predicates true,false,false; membership in doubling image true,false,false. | Agree; none |
| 2.8 rational negative control | (0,0) on L(−1)/ℚ | Differences (0,−1,1) fail the square condition. Duplication x-coordinate would require x(Q)²=−1, impossible in ℚ. | Agree; none |
| 3.1 two-by-four subgroup | η=2 over 𝔽₅ and 𝔽₇ | Counts both 8. Over 5, 2(2,1)=(0,0); over 7, 2(3,1)=(1,0). Independent roots (1,0),(0,0) respectively yield eight distinct generated points. | Agree; none |
| 3.1 extension and excluded parameters | η=i over 𝔽₉; η=0,±1; 𝔽₃ | Extension count=16 and 2(i,1−i)=(0,0); excluded parameters give Δ=0; 𝔽₃ has zero admissible η. | Agree; none |
| 3.2 half definition and membership | i=2,3 over 𝔽₅ | P=(2,4),(3,3); y² and x³−x are respectively 1=1,4=4; denominators 2y=3,1. | Agree; none |
| 3.2 doubling | Same points | Both doubles=(0,0), which is not O. | Agree; none |
| 3.2 exact order | Same points | 2P=(0,0)≠O; 4P=O; exact orders both 4. | Agree; none |
| 3.2 first descent class | i=2,3 over 𝔽₅; i=4 over 𝔽₁₇ | Characters −1,−1,+1 respectively, matching [i]; i=4=2² shows nonsquareness cannot be asserted from i²=−1 alone. | Agree; none |
| 3.2 field-map compatibility | ℚ(i)→ℂ with i mapped to i or −i | Coordinate images are (i,1−i) and (−i,1+i), respectively, equal to the construction at the image of i. | Agree; none |
| 3.6 divisible two-torsion | L(−1)/𝔽₅,𝔽₁₃ | Of three nonzero roots exactly one, (0,0), is in the doubling image in each field; other two readings contain [2]≠1. | Agree; none |
| 3.6 four halves | L(−1)/𝔽₅ | Halves of (0,0) are (2,1),(2,4),(3,2),(3,3); first characters all −1. Thus none is itself a double. | Agree; none |
| 3.6 no order eight | q=5,13 versus 41 | First two groups have order set {1,2,4}; at 41 the count is 32 and (6,13) has order 8. | Agree; none |
| 3.7 exact two-part | q=5,13,29,125 | Counts 8,8,40,104; quotients by 8 are 1,1,5,13; all four v₂ values are 3. | Agree; none |
| 3.7 finite-abelian-group route | C₂×C₄ versus C₄×C₄ | Both doubling kernels have size 4 and no element of order 8; orders are 8,16 and divisible nonzero two-torsion counts 1,3. The latter is excluded by §3.6. | Agree; none |
| 4.1 conic identities and membership | 𝔽₅, t=v=2,i=3 | λ=3, r=4,s=2; r²−s²=2; P=(4,3); y²=4=cubic(P). Printed pair (4,4) instead gives 1≠4. | Agree; source error below |
| 4.1 nonzero coordinates and nonsingularity | Same input; i=2 alternative | λ=3 avoids 0,1; y=3 or 4 is nonzero; roots are 0,2,1 and Δ=4. With i=2, P=(3,4) has y²=1=cubic(P). | Agree; none |
| 4.1 doubling | Same two choices of i | Slopes 1 and 2; both doubles=(1,0)=(2λ,0). | Agree; none |
| 4.1 exact order | Same points | 2P=(1,0)≠O and 4P=O, hence exact order 4 for each. | Agree; none |
| 4.1 third descent coordinate | Same points | Differences (4,2,3) and (3,1,2); third entries 3 and 2 equal 4itv and both have character −1. | Agree; none |
| 4.1 characteristic three and base change | 𝔽₉, t=v=1, i²=−1 | P=(1+i,1−i), y²=i=cubic(P), double=(1,0). Under i↦−i the coordinates become (1−i,1+i), exactly the construction at −i. | Agree; none |
| 5.1 normal-form character count | L(3)/𝔽₅ and L(2,3)/𝔽₅ | Direct counts 4,8; character sums −2,2; q+1+sum=4,8. | Agree; none |
| 5.1 trace formula | Same equations | Native q+1−count=2,−2; negative character sums=2,−2. | Agree; none |
| 5.1 symmetric-cubic definition | a=3 over 𝔽₇, x=1,−1 | f(1)=4, f(−1)=3=−4; character values +1,−1 cancel. | Agree; none |
| 5.1 symmetric trace-zero headline | q=7,a=3 and a=1 | Character vectors (0,1,0,1,−1,0,−1) and (0,1,−1,1,−1,1,−1); both sums 0, counts 8, traces 0. | Agree; none |
| 5.1 characteristic-three and cusp cases | q=3,a=−1 and a=0 | Square-root count vectors (1,1,1),(1,2,0); both projective counts 4=q+1, traces 0. | Agree; none |
| 5.1 extension and congruence control | All a over 𝔽₂₇; a=−1 over 𝔽₉; a=−1,1 over 𝔽₅ | 27 counts all 28 with trace 0; at 9 count 16, trace −6; at 5 counts 8,4 and traces −2,2. | Agree; none |
| 5.1 Legendre specialization and coverage | q=7,u=2; compare a=1 | −u²=3 and L(2,−1) coefficients (0,0,0,3,0); a=1 would require u²=6, which has zero solutions. | Agree; none |
| 5.1 odd-characteristic hypothesis | y²=x³+1 over 𝔽₂ | Actual count=3; proposed odd-field expression=2+1+(1+0)=4. This is the stated excluded control. | Agree; none |
| 5.2 twist-trace headline | q=5,λ=3,d=2 and 4 | Twisted traces −2 and 2; character-scaled traces (−1)·2=−2 and 1·2=2. | Agree; none |
| 5.2 substitution identity | f=x³−4x²+3x, d=2,z=2 over ℚ | f_d(4)=−16 and d³f(2)=8·(−2)=−16. | Agree; none |
| 5.2 singular equations | q=5,λ=0,d=2 | Counts 5,7, traces 1,−1; −1=χ(2)·1. | Agree; none |
| 5.2 zero scalar | d=0 over 𝔽₅ | Cusp count=6, trace=0; χ(0)·a=0 for every original a. | Agree; none |
| 5.2 extension-field normal form | W:y²=x³+x+1 over 𝔽₉, d=1+i | Counts 16,4; traces −6,6; χ(d)=−1, so 6=(−1)(−6). | Agree; none |
| 5.2 Euler polynomial consequence | λ=3,d=2 over 𝔽₅ | Unscaled 1−2T+5T²; twisted 1+2T+5T². At d=0, Δ=0 and the good-Euler assertion is not made. | Agree; none |

The zero ring is used only for ring coefficient identities and the native unit predicate. Field statements exclude it by the Field instance. A field of cardinality one is likewise impossible. The finite-group structure theorem is applied only to the native additive commutative point group: for comparison S₃ has order 6 and four elements killed by two, but is nonabelian and is not admitted by that input. No local statement silently substitutes a general DVR for ℚ_p; the good-prime theorem is explicitly rational. Nonzero arguments and denominators are supplied wherever valuations, root ratios, tangent slopes or unit squareclasses use them. The singular point-count convention is kept distinct from the nonsingular point-group convention throughout.

### Pinned declarations and ownership

Pins were verified directly: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; the content main checkout is `fa41b3747f56d4e77bd69e7099c1be4f2e4959ba`. The following **24 pinned source files** were inspected by declaration and signature. Paths are relative to their respective library repositories.

| Pinned file and lines | Declarations/content checked and consequence |
| --- | --- |
| Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:76,120,131,366,388,477 | Five coefficients; c₄, Δ, IsElliptic, j, map_j. IsElliptic contains `IsUnit W.Δ`, not merely Δ≠0. Native j needs ellipticity. |
| Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Basic.lean:149,156 | Equation and equation_iff: the five-coefficient equation used in the coefficient calculations. |
| Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:477,701,823 | Point is infinity or a nonsingular affine point; add_self_of_Y_ne requires the tangent branch; map uses an algebra homomorphism and base-changed models. The roadmap's field maps can be viewed over their source field. |
| Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean:57,246 | VariableChange has unit scaling; variableChange_j preserves j. Point transport is new equation to old equation. |
| Mathlib/AlgebraicGeometry/EllipticCurve/NormalForms.lean:107,166 | IsCharNeTwoNF has exactly a₁=a₃=0; it does not itself assert characteristic ≠2. toCharNeTwoNF requires invertible 2. |
| Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:57,139,149,274,299,323,328 | IsIntegral, integralModel_c₄_eq, integralModel_Δ_eq, IsMinimal, minimal, HasGoodReduction, hasGoodReduction_iff_isElliptic_reduction. Good reduction includes minimality and multiplicative discriminant valuation one. |
| Mathlib/NumberTheory/Padics/PadicVal/Basic.lean:126,223,261,319 | padicValRat, mul, div and add_eq_min; the nonzero and unequal-valuation hypotheses agree with §1.1's route. |
| Mathlib/NumberTheory/Padics/PadicNumbers.lean:1063 | Padic.valuation_ratCast compares the rational and p-adic additive valuations with the same sign. |
| Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:119,133,158,164,180,213,257,267 | quadraticChar; square/nonsquare tests; nonsquare existence; Euler criterion; square-root count; supplementary law at −1; FiniteField.isSquare_neg_one_iff. Finite-field cardinality, not primality, controls the signs. |
| Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/GaussSum.lean:37 | quadraticChar_two=χ₈(card F), for every odd finite field. |
| Mathlib/RingTheory/Ideal/Quotient/Operations.lean:325 | quotientMulEquivQuotientProd requires coprime ideals; distinct roots supply this. |
| Mathlib/RingTheory/Polynomial/Quotient.lean:29 | quotientSpanXSubCAlgEquiv is evaluation at the specified root. |
| Mathlib/GroupTheory/QuotientGroup/Defs.lean:120,309 | eq_one_iff and map have the needed normal-subgroup/transport hypotheses. Unit square subgroups are the actual subgroups used. |
| Mathlib/GroupTheory/FiniteAbelian/Basic.lean:134 | AddCommGroup.equiv_directSum_zmod_of_finite, used with a finite abelian group, gives prime-power cyclic factors. |
| Mathlib/NumberTheory/DirichletCharacter/Basic.lean:39,291 | DirichletCharacter and IsPrimitive; primitivity means conductor equals modulus. §1.4 additionally excludes modulus zero. |
| Mathlib/NumberTheory/LegendreSymbol/Basic.lean:109,180 | legendreSym and its nonzero-square comparison, consistent with the rational numerator-times-denominator convention. |
| TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/XSubT.lean:164,255,276,283,297,505,548,558,566,584,590,595,794,803,961,1023 | f, separable_f, A, equivProdA', equivProdA'_apply, M, μX and its two branches, μ₀ and its evaluations, μ, μ_apply, ker_μ_eq and normM_μ₀_eq_one. The root branch adds the cofactor; μ's source is Multiplicative Point. These are consumed, not rebuilt. |
| TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/TwoTorsion.lean:57 | card_ker_nsmul_two exports the root count plus one. The labelled set equality occurs inside its proof but is not an exported declaration; §0.10 is a justified adapter. |
| TauCeti/AlgebraicGeometry/EllipticCurve/NormalForms.lean:157 | y_eq_zero_of_order_two applies to a nonsingular affine point in normal form, assuming 2≠0. |
| TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/VariableChange.lean:132,177 | equivVariableChange is a bijection; addEquivVariableChange is the additive equivalence. Direction matches the roadmap. |
| TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean:73,86,101,109 | pointCount counts all affine solutions plus one; pointCount_eq_card_point requires ellipticity; frobeniusTrace and frobeniusTrace_def use integer subtraction. |
| TauCeti/AlgebraicGeometry/EllipticCurve/SingularPointCount.lean:247 | frobeniusTrace_eq_zero_of_c₄_eq_zero assumes both Δ=0 and c₄=0, exactly satisfied by the cusp. |
| TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FinitePoint.lean:53 | finite_point provides finiteness of the actual Point carrier over finite coefficients. |
| TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:169,229,239,299,306 | quadraticTwistOf, c₄_quadraticTwistOf, Δ_quadraticTwistOf, isElliptic_quadraticTwistOf_iff, j_quadraticTwistOf. The polynomial coefficients and unit twisting-discriminant condition match §§0.2,0.5,5.2. |

Searched by Legendre models, ordered split cubics, halving/two-torsion, descent squareclasses, character point counts, symmetric cubics and twist traces in the pins, main, board packages and the available open-roadmap heads, using `roadmaps grep` as well as local searches. No duplicate fully qualified name or existing exported headline was found. In particular the general descent map and kernel are already supplied; the new content is their ordered split reading. Searches for an actual elliptic conductor and its native comparison did not find an implemented carrier at the pin.

The `roadmaps resolve` result reports no cross-roadmap citations or roadmap Lean names found nowhere. Its own output says it did not check external library names; those were checked directly at the pins above. Resolved contracts and close ownership boundaries are:

| Roadmap and locator | Witness and ownership conclusion |
| --- | --- |
| TauCetiRoadmap/EllipticCurves/README.md:821,1187,1583, on main | Layer 4 provides potential-good-reduction/integral-j theory; Layer 5 the generic twist; the worked Frey example explicitly gives (0,B−A,0,−AB,0), Δ and c₄ over every commutative ring. This roadmap keeps their Legendre specializations and new arithmetic interfaces, not the generic construction. |
| TauCetiRoadmap/ModularCurves/README.md:1100,2008,2030, on main | §§4C,9E provide the universal family and S₃/invariant-ring theory. The coefficient model over all rings and labelled root-order calculations differ from those scheme/moduli statements. |
| TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:501,545,1789, on main | §§1.7,1.8,1.51 provide primitive fundamental-discriminant characters, prime-value uniqueness and rational squareclass characters, including odd-conductor parity/squarefreeness. The names in the contract occur in its §1.51 API at lines 1797–1808. |
| TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:3313,3472, via roadmaps show | §§5.3a,5.3g provide actual Artin elliptic conductors, independence of the auxiliary prime, and f=0/1 iff good/multiplicative reduction. This is precisely the missing native carrier for §1.5, with a named earlier owner. |
| TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:2375,2498,2583, via roadmaps show | Layer 3 constructs Artin and Swan conductors; §3.2 uses the actual inertia representation. The elliptic specialization remains with the preceding Néron-model owner. |
| TauCetiRoadmap/EllipticCurveModularityPartII/README.md:550,568, supplied open head | §5.1 defines FullRationalTwo by cardinality four of the rational killed-by-two subgroup. It packages the condition and does not duplicate general-field Legendre normalization. |
| TauCetiRoadmap/ErdosProgressionPowers/README.md:362,1104, supplied open head | Contract and §2.1 import these coefficient models, ordering scalars, square scaling, normalization, conductors, descent and torsion results; progression-specific inequalities remain there. The d versus d² convention agrees. |
| TauCetiRoadmap/ComputationalNumberTheory/README.md:1723,1727, supplied open head | §3.17 explicitly imports §§5.1–5.2 here, including singular equations and all d. It owns enumeration, not the character-sum identity. |
| TauCetiRoadmap/ArithmeticDynamics/README.md:9121,10387,10416, supplied open head | §§6.35,6.111,6.112 are the Legendre Lattès and projected-torsion consumers. §6.35 imports the invariant formulas here and constructs the dynamical map. |
| TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:159,502, supplied open head | Imports §5.1 here and its symmetric trace-zero result for the Jacobsthal-sum interpretation; no competing owner. |
| TauCetiRoadmap/HypergeometricMotives/README.md:134,1235, supplied open head | Imports §§0.1,5.1 here to reach the hypergeometric point-count theorem; no competing owner. |
| packages/EllipticCurvesPartII/design/README.md:3,53 | Explicitly an import index for this roadmap, with zero independent ownership. Its matching material is an alias, not a second roadmap replanning these objects. |

The supplied HyperellipticCurves and CurvesOverFiniteFields heads were also searched around model/twist and character-sum ownership; their higher-genus/model and global curve-count theories do not duplicate these targets. No ownership move or new supplier dependency is needed. The unavailable MordellLawrenceVenkatesh consumer is recorded below rather than presumed checked.

### Lean headlines, retained binders and padding

The README has **eight headline endpoints**. Seven are statable and appear on native carriers:

| README | Suggested.lean declaration and line | Signature audit |
| --- | --- | --- |
| 0.9 normalization | exists_scaledLegendre_of_full_two_torsion:34 | Arbitrary Field and DecidableEq, 2≠0, E.IsElliptic and doubling-kernel cardinality four retained; produces actual VariableChange and admissible d,λ. |
| 1.2 good-prime units | legendre_units_of_good_reduction:45 | Prime p, p≠2, rational elliptic E, actual equation identification and good reduction of its p-adic minimal model retained. No arbitrary displayed-model reduction substitution. |
| 2.8 halving criterion | scaledLegendre_halving_iff_squares:58 | Arbitrary Field, DecidableEq, 2≠0, all three distinct-root conditions and native nonsingular point retained. The existential half is in the same Point group. |
| 3.1 subgroup | legendre_two_by_four_subgroup:70 | Finite field and parameter exclusions retained; an actual injective additive homomorphism from ZMod 2 × ZMod 4 is required. |
| 3.7 exact two-part | legendre_minus_one_point_count_v_two:79 | Fintype field and cardinality congruence retained; value is padicValNat 2 of the full native count, not an affine count. |
| 5.1 symmetric count/trace | symmetric_cubic_trace_zero:89 | All a, including zero, and q≡3 mod4 retained; both the count and integer trace are stated. |
| 5.2 twist trace | quadraticTwistOf_frobeniusTrace:97 | All normal-form W and all d over an odd finite field retained; no ellipticity or nonzero-d narrowing. |
| 1.5 odd conductor divisibility | Named in module docstring:9 | Not statable on the actual elliptic conductor at these pins. The missing carrier and comparison are stated explicitly; no discriminant or arbitrary predicate substitutes for them. |

Ran `#check @name` for **all nine declarations** in one scratch copy, and compared every elaborated type with the README. No standing hypothesis was dropped; no signature change is needed. There are no implicit section-variable blocks carrying hidden requirements. Both definitions have genuine five-coefficient bodies and are needed by the retained headlines.

On another scratch copy, tried closing each of the seven admitted theorems with `simp`, `rfl` and `infer_instance`, as separate backtracking one-tactic attempts: **21 attempts, zero successes**. The native declaration search and signature inspection found no single matching library theorem for an `exact` proof of any headline. The descent kernel and generic twist-invariant formulas do not themselves express the split halving or twist-trace conclusions. No theorem is merely a definition restatement, small computation, boundary case or README Check. The explicit halves and coefficient computations appropriately remain supporting README targets.

All eight substantive definitions/constructions—two models, the labelled parameter tuple, root-point tuple, CRT equivalence, squareclass equivalence, chosen minus-one half and conic witness—have APIs and at least three discriminating Checks. Each layer has Examples and Dependencies; all owned backticked declarations correspond to the Lean file. The module uses one `import Mathlib` plus two used Tau Ceti imports, one namespace, README-ordered layer comments, declaration docstrings and seven theorem bodies containing only `sorry`.

## Not verifiable

- **S09**, second edition, DOI 10.1007/978-0-387-09494-6: §§III.1–III.2, §V.1 and §X.1 Proposition 1.4 remain **uncertified**, as already settled by the supplied source manifest. Checked that manifest and the supplied cache inventory; no legal text was supplied. I did not refetch or request it. This affects textual verification of the cited locators, including seeded §§0.4,0.5,0.9,0.10,1.1,5.1,5.2 and the split-descent references. The independent calculations and pinned proof inputs above were checked; they do not certify the inaccessible book's wording, page or proposition hypotheses.
- **K84**, first edition, DOI 10.1007/978-1-4684-0255-1, p.41 remains **uncertified**, also settled. Checked the manifest/cache inventory and BS20 line 464, which identifies that page; the book text itself was not supplied. No new request was made.
- **MordellLawrenceVenkatesh §6.4**, cited as a downstream consumer at README lines 13 and 640: no main-branch file or package README was available in the supplied locations, and the brief supplies no checkout for its open head. The resolver finds the citation in its index, but that is not inspection of its text. Ownership against this unavailable open roadmap, and other open roadmaps without supplied files, was not checked. It is not used as a supplier here. The specified available sibling heads and the actual suppliers were checked as described above.

No review is parked for these settled source-access cases; no new missing-reference request was created.

## Source issues

- **Error** in BS20 at §6, proof of Lemma 6.6, printed p.371, BS20 line 718: the source says the displayed polynomial y-coordinate defines the chosen order-four point; it should be y=8itv(t+iv), with the same x-coordinate and conic relation; affects the proof.

For that source error, over 𝔽₅ with t=v=2 and i=3, the printed pair is (4,4), giving y²=1 while x(x−2)(x−2λ)=4. The corrected point is (4,3), has y²=4, and doubles to (1,0). With i=2, the printed pair happens to be the negative of the corrected point, so that instance alone would fail to detect the error. The roadmap already contains both discriminating Checks and the general corrected membership/doubling calculation; this is not a finding against the PR.
