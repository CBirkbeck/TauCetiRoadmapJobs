# Review of HabiroNumberFields (pull request #1469 at 8617991)

**Verdict:** needs changes

## R01 (P2) — Import the completed Coleman comparison from its earlier owner

**Location:** TauCetiRoadmap/HabiroNumberFields/README.md:7, :828 and :845. The scope says it “owns the completed local K₃ comparison with the integral Coleman regulator lattice, finite root-class generation”.

**Claim:** §§3.0a–3.0b reconstruct completed root classes, the normalized regulator, its lattice isomorphism, root presentations, naturality and transfer. These are already targets of the earlier PadicHodgeRegulators, not new arithmetic interfaces owned here.

**Witness:** TauCetiRoadmap/PadicHodgeRegulators/README.md:1165, :1188, :1213 and :1231 give exactly these four constructions/theorems; :7 explicitly assigns ownership. Merge-order entries 302 and 304 put that supplier before HabiroNumberFields.

**Repair:** Delete the duplicate construction and theorem targets and add the exact PadicHodgeRegulators §§4.7, 5.6–5.9 and 6.3 contract. Retain only genuine Habiro adapters, including composition with the global completion map and use of the regulator in local sections. Update the scope, Layer 3 introduction and affected Needs lines. Import the actual normalized map and its transfer diagram, not merely an abstract lattice isomorphism.

**Repair check:** At p=5 the supplier gives the same image 25O_L and root value; on L=ℚ₅×ℚ₂₅ it gives rank 3. Its trace law sends the restricted value (25,25) to 50. Thus this import preserves the full product, normalization and transfer requirements. No move of ownership or upward dependency is needed.

## R02 (P2) — Keep the exceptional comparison with its declared supplier

**Location:** TauCetiRoadmap/HabiroNumberFields/README.md:507, with the ownership assertions at :9 and :61; packages/HabiroNumberFields/design/plan.json:3.

**Claim:** §1.11 now constructs the positive B_old(𝔽₂)/3–K₃(𝔽₂)/3 comparison and its unramified reduction square locally. The still-declared gap assigns that same comparison and square to K3BlochGroups. The README has no matching gap:bloch-foundations contract.

**Witness:** The plan's gap:bloch-foundations names K3BlochGroups and requests the positive comparison on [0] with the reduction square. README:507 instead says to prove both here.

**Repair:** Consume this comparison under the declared gap, restore its exact “What K3BlochGroups must provide (gap:bloch-foundations)” sentence in the supplier subsection, and remove the duplicate construction from §1.11. Keep the finite P computation and its compatibility application here. This uses the precise, minimal contract already declared; its absence from the supplier today is permitted.

**Repair check:** In 𝔽₄, ζ²+ζ+1=0 gives D_ζ(1)=ζ and R_ζ([0])=ζ²≠1, with (ζ²)³=1. Importing the positive cyclic-class comparison leaves that calculation unchanged and supplies exactly the additional sign/reduction identification it cannot establish by itself.

This does not re-raise repair F06's complaint that the supplier theorem is absent. That absence is allowed. The defect is the competing local ownership introduced while the declared supplier contract remains in force.

## R03 (P3) — Correct the root label or the determinant

**Location:** TauCetiRoadmap/HabiroNumberFields/README.md:855: “the columns for i and ζ have determinant 3”.

**Claim:** The displayed calculation establishes the residue of D(ζ⁵), but the determinant sentence uses D(ζ).

**Witness:** Frobenius sends 4+3ζ to 4+3ζ²=1+2ζ. The columns for i,ζ are (1,0),(1,2), with determinant 2. The columns for i,ζ⁵ have determinant 3.

**Repair:** Change the second column label to ζ⁵, or change the determinant to 2 and include the Frobenius conversion. If this Check is retained with the imported contract after R01, use the corrected version there.

**Repair check:** Both 2 and 3 are nonzero in 𝔽₅, so the intended spanning conclusion survives. Zero and pD still give zero residue columns.

## R04 (P3) — Repair three cached-text locators

**Location:** TauCetiRoadmap/HabiroNumberFields/README.md:343, :418 and :912.

**Claim:** The cited source lines identify unrelated text rather than the statements discussed.

**Witness:** GZ line 836 ends a matrix example; the generic-locus argument is at 875–879. CGZ line 206 concerns calibration; Theorem 1.7 starts at 218. GSWZ (48)–(49) start at 806 and 810.

**Repair:** Use GZ line 875 for the paragraph following (56), CGZ line 218 for Theorem 1.7, and GSWZ lines 806, 810 and 855 for the defect formulas and Proposition 2.2. Keep the theorem/equation and printed-page locators.

**Repair check:** Opening the replacements gives respectively the rational-function/density motivation, the exact sequence ending in K₂(F)[n], and the two expressions for the same Pochhammer defect. These are locator corrections, not changes to those mathematical claims.

## Verified sound

The review covered both target files at the specified head, all 56 numbered subsections, the 15 seeded source targets, the four Lean theorems, and the six elaborated declarations. The adversarial table records 99 rows, in addition to the ten exhaustive finite-field rows. The computations below test the statements and their excluded cases; they are not proofs of the new arithmetic descent or normalization comparisons.

### Gate, build and signatures

The worker's gate at 8617991 reports:

    gate HabiroNumberFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK

The prescribed dependency check was independently run. Its final output was:

    depcheck: 204 roadmaps, 1496 edges, 0 problem(s)

There was no UPWARD or CYCLE line. This checks declared edges; it does not discover the omitted supplier in R01. The outside-folder diff was empty. No PR file was changed.

Independent elaboration of TauCetiRoadmap.HabiroNumberFields.Suggested succeeded with only the four expected sorry warnings. A scratch copy with explicit checks of all six fully qualified declarations also elaborated. No required section binder disappeared.

| Declaration | Elaborated context and README comparison |
|---|---|
| cyclicDilog | Arbitrary universe, commutative ring, n:ℕ and ζ,x:R. Real finite-product body; n=0 gives 1. Matches §1.1. |
| cyclicDilog_quasiPeriodicity | Field; 0<n; primitive ζ of order n; s≤n. No division by 1−xⁿ. Thus vanishing factors remain in scope, as promised in §1.1. |
| cyclicDilog_one_pow_twentyFour | Field; 0<n; primitive ζ; (n:K)≠0. Natural exponent 12n. Matches the phase-free §1.1 headline. |
| cyclicHypergeom | Arbitrary field universe; finite sum with total division. No hidden nonvanishing premise on the definition. Matches §1.2, including its explicitly excluded singular examples. |
| cyclicHypergeom_shift | Field; positive order, primitive root, X≠1, Y≠1, and (1−Y)Z=1−X. All remain explicit. Matches §1.2. |
| kms | Field; positive invertible order; primitive root; xyz≠0; X,Y≠1; X≠Y; hypersurface relation. Natural n(n−1)/2 agrees with the integer exponent because n>0 and n(n−1) is even. Matches §1.3. |

Each of the four admitted theorems was tried on a scratch copy with simp, rfl and infer_instance as single-tactic alternatives; all four remained unresolved. Object searches found no pinned theorem giving any of the four by a single exact application. No padding finding is raised. There are two real-bodied definitions, four theorem admissions, one import Mathlib, no sorry'd data, no options and no namespace collision found in readable roadmap heads.

The README headlines are: the finite Chern unit theorem; integral cyclic quasi-periodicity and phase-free value; the cyclic difference equation and KMS identity; finite regulator construction and Chern comparison, with conditional scalar calibration; arithmetic Habiro gluing and the rational-field comparison; completed local regulator lattice and root generation; local rank-one freeness; effective global descent; tensor equivalences and the Picard character; pullback/scalar equivalence; and multiplicative transfer. The module docstring names the unavailable K-theory/Bloch, cyclotomic-completion/Taylor, Chern-root-line/indexed-module, and analytic Pochhammer/bilateral carriers. The four headlines expressible using the two short native finite definitions are present. None is replaced by an arbitrary function, a conclusion-as-hypothesis, or a free proposition.

### Seeded source verification

All eight supplied texts were readable from the legal cache. Published CGZ was additionally obtained through the prescribed source service from its author's page; “CGZ (published)” below distinguishes that extraction from CGZ v3. No locator in the target README is labelled unverified. The following covers all 15 seeded targets, including the limits of what the sources support.

| Target | Text and printed locator opened | Verification |
|---|---|---|
| §0.1 Integral cyclotomic lifting | CGZ lines 378–410 and 791–830, §§2.1 and 3.1, pp.7–9 and 17–18 | The source supplies the cyclotomic/Kummer setting, not an unconditional integral character projector. The n=9 obstruction and injection-based replacement are expressly local arguments. The inverse character and noninvertible group-order issue survive the tests below. |
| §1.3 KMS and proof route | GZ lines 852–953, Proposition 8.1 and (55)–(60), pp.235–237; lines 129–144 and 331 onward, Lemma 2.1 and its proof, pp.221,224–225 | The finite identity has the stated order and orientation. Its printed complex generic-locus proof is not itself an arbitrary-characteristic theorem. The README explicitly owns density, integral descent, uniform tails and corrected Gaussian scale. Cached PDF pp.235–237 were visually inspected: (57) really has the half-power in the denominator. R04 concerns its separate generic-locus line pointer. |
| §1.6 Étale Bloch/K₂ | CGZ lines 218–224, Theorem 1.7, p.5; lines 1443–1519, Definition 6.1 and (35)–(38), pp.31–33; lines 699–706, Theorem 2.11, p.15 | Exactness uses the absence of relevant roots of unity; comparison uses the stated prime-power/Tate hypotheses. The target keeps K₂(F)[n], not all K₂(F), and distinguishes the divisible boundary from the ordinary Bloch boundary. R04 fixes the line pointer. |
| §1.13 Chebotarev detection | CGZ lines 1004–1046, Proposition 4.2, pp.22–23; lines 1171–1285, §5.2, pp.26–28 | Retains the Galois-closure root condition, exclusion of finitely many primes, and comparison only up to a unit. A product replaces the printed direct sum. The exact residue valuation and distribution work are explicit inputs, not consequences of mere congruence modulo n. |
| §1.14 Image/calibration | CGZ lines 1305–1318, §5.3, pp.28–29; lines 1740–1744, Theorem 7.4, p.39; H2024 lines 271–272 and 353–357, Theorem 3.1 and Proposition 4.6, pp.6–7; CGZ (published) lines 93–117 and 157–181, Theorems 1.2,1.5,1.6 and Remark 1.4, pp.385–386 | Distinguishes the later Nahm eta evaluation from the early conditional comparison and does not infer a scalar from equal images. The repeated-prime restriction and reduced excluded integer are retained. Raw/positive/fixed Chern normalization is a separate comparison target. |
| §2.2 Full coefficients/Frobenii | GSWZ lines 244–275 and 3292–3348, Definition 1.1 and §5.2, pp.6–7,64–65; W-thesis lines 1313–1321; Q lines 647–658 | The full tensor algebra, arithmetic Frobenius and cyclotomic Frobenius are distinguished. Product factors and the zero completion at inverted primes are explicit. The latter repairs the unrestricted tensor/completion identification. |
| §2.4 Taylor gluing | GSWZ lines 255–278, Definition 1.1 and its discussion, p.6 | The direction is rex(f_m)=φ_R(f_pm), with φ_R acting on coefficients. The i versus −i test excludes untwisted gluing. |
| §2.6 Local chart/p-chain | W-thesis lines 1432–1451, Lemma 2.12 proof, p.32; Q lines 750–784, Lemma 2.12 proof, p.18; GSWZ lines 288–298, p.7 | The source's irreducibility claim is false. The roadmap replaces it by the full separable algebra. The mixed (p,Φ_m)-adic p-chain comparison is an explicit refinement, not a consequence of equality of single-adic topologies. |
| §2.8 Coordinates/jets | GSWZ lines 2964–2994 and 3030–3058, §5.1, pp.59–60 | x=−ζu accounts for (−ζ)^k. The weighted range m(k+1)<N correctly has no entries at N=0,1 and five pairs at N=4. |
| §3.5 Half shift/first jet | GSWZ lines 788–817, (46)–(50), p.18; GSWZ lines 877–885, Bernoulli expansion (60), p.19; lines 2168–2182, (207), p.42 | B₂(1/2)=−1/12 gives the displayed positive 1/48 example after multiplying by Li₀(−1)=−1/2. Prime-to-p roots, 1−ζ a unit and p>3 are essential for the integral jet. |
| §3.6 Local freeness | GSWZ lines 380–402, Definition 1.3/Theorem 1, p.9; lines 2034–2096 and 2103 onward, Dwork and (195), pp.39–41; lines 2180–2211, p.42 | The README includes the integral first jet absent from Definition 1.3. Its equal-degree ratio argument uses corrected Dwork integrality. It does not say that every nonzero module element generates. R01 concerns ownership of its regulator input. |
| §3.9 Ring/multiplication | GSWZ lines 415–447, Definition 1.4/Theorem 2, pp.10–11; lines 2213–2220, proof, p.43 | The printed nonlinear condition is insufficient. The README's full-order linear equalizer gives the right degree-zero equations, and keeps multiplication separate from tensor bijectivity. |
| §3.10 Effective descent | GSWZ lines 436–447 and 2213–2220, Theorem 2 and proof, pp.10–11,43 | The printed proof does not establish effective descent, finite presentation or tensor bijectivity. The README explicitly makes all of these new targets. The table tests why local rank alone is insufficient; the source is motivation, not certification of this refinement. |
| §3.14 Vanishing/constants | GSWZ lines 465–471 and 2285–2296, Proposition 1.5 and proof, pp.11,45 | Vanishing propagates along allowed transitions, not across inverted primes; a zero constant is not a zero component series. Integral constants take values in the specified root line. |
| §3.19 Multiplicative transfer | GSWZ lines 415–447, Definition 1.4/Theorem 2, pp.10–11, together with the roadmap's §§3.10,3.16,3.18 | The source has no theorem asserting this transfer. The README labels it a functorial extension and owns the determinant norm, trace-on-degree comparison and descent. It does not identify the norm with an additive map. |

Other source checks included BG lines 1267–1268, §7 table, p.24, which lists discriminant magnitude 4 among the trivial tame kernels; H2013 lines 1554–1624, §6.4, pp.32–33, which gives the positive cyclic-chain formula but requires an auxiliary projective point outside the orbit; and H2024's product/Bockstein and eta conventions. In particular H2013's generic configuration argument was not silently applied to the three-point projective line over 𝔽₂.

### Computed finite identities

For the following table X=xⁿ, Y=yⁿ and Z=zⁿ. Every admissible nonzero triple in the indicated finite field was enumerated, using the hypotheses of kms. Both KMS and the shift equation were evaluated directly from their finite products and sums.

| Field, n, ζ | Admissible triples | One (x,y,z) | KMS left/right | Shift left/right | Failures |
|---|---:|---|---|---|---:|
| 𝔽₁₁,1,1 | 72 | (2,3,6) | 1 / 1 | 6 / 6 | 0 |
| 𝔽₁₁,2,10 | 32 | (2,4,3) | 2 / 2 | 10 / 10 | 0 |
| 𝔽₁₉,3,7 | 108 | (2,10,5) | 5 / 5 | 11 / 11 | 0 |
| 𝔽₁₇,4,4 | 128 | (3,6,6) | 6 / 6 | 11 / 11 | 0 |
| 𝔽₃₁,5,2 | 500 | (3,11,7) | 30 / 30 | 26 / 26 | 0 |
| 𝔽₃₇,6,11 | 864 | (2,5,9) | 11 / 11 | 21 / 21 | 0 |
| 𝔽₄₃,7,4 | 1372 | (3,7,6) | 39 / 39 | 31 / 31 | 0 |
| 𝔽₇₃,9,2 | 4374 | (3,25,25) | 18 / 18 | 64 / 64 | 0 |
| 𝔽₂[t]/(t⁴+t+1),3,t+t² | 108 | (t,1+t,t) | t²+t³ / t²+t³ | t+t² / t+t² | 0 |
| 𝔽₃[t]/(t³+2t+1),2,−1 | 480 | (t,1+t,2t+t²) | 2+t+t² / 2+t+t² | 2 / 2 | 0 |

Total: 8,038 admissible triples, with zero failures in either equation. This includes characteristic two, characteristic three, even order and repeated-prime order, rather than just characteristic-zero or prime-order examples.

Quasi-periodicity was independently tested for every x and 0≤s≤n in the eight prime fields above: 1,735 cases, zero failures, including vanishing factors. Integer polynomial reduction of D_n(T,1)²⁴−n^(12n) modulo Φ_n(T) gave remainder 0 for each n=1,…,16. These exact reductions also check even and composite orders.

### Adversarial table

A “retain” result means the displayed instance agrees and the indicated excluded or wrong model is distinguished. It is not a claim to have proved an unformalized theorem. Multiple rows separate different maps or claims in one subsection. R01–R04 identify the changes required.

| Statement | Instance(s) tried | Computed values on the two sides, or correct/wrong models | Result; change |
|---|---|---|---|
| Conventions: positive orders and zero completion | n=0,1; R=ℤ[1/6],p=3 | Empty D=1 and empty f=0; coefficient order 1 gives the trivial group. R/3ᵃR=0 for every a, while R⊗ℤ₃=ℚ₃≠0. | Retain positivity and zero-completion convention. |
| Conventions: full tensor factors | K=ℚ(i),m=4 | K⊗ℚ ℚ(i)≃K×K has K-rank 2; a selected field has rank 1. | Retain full algebra. |
| §0.1 integral eigenspaces | n=9,G=(ℤ/9)ˣ; G=1 | Twisted augmentation of an eigenvector is 6c, with image {0,3,6}; 1 has no eigenlift. With G=1 the projector is identity. | Correct obstruction; averaging cannot replace lifting. |
| §0.1 inverse character | n=5,σ₂; root character at n=7 | χ⁻¹(σ₂)=3, while χ(σ₂)=2. On μ₇, σ₂ζ=ζ²; inverse weight would require ζ⁴. | Distinguishes χ from χ⁻¹. |
| §0.2 excluded integers | ℚ; ℚ(i); n=1,3,9 | For ℚ, M=12,M′=4; gcd(3,4)=1 but 9∣9 excludes n=9 in the reduced variant. For ℚ(i), M=24,M′=8. gcd(1,M)=1. | Matches tame-kernel data and reduced hypothesis. |
| §0.3 Kummer direction | 𝔽₇,n=3,a=2 | α³=2 gives α⁷/α=α⁶=4; inverse convention gives 2. Cubes are {1,6}. | Positive Kummer sign distinguished. |
| §0.3 Tate root change | r=1,2,k=−1 | Root-change exponent is 1 at r=1 and −1 at r=2; a cubic class 2 changes to 4, not 2. | Retain basis-dependent untwisting. |
| §0.4 restriction/injectivity | F=ℚ,n=3,9; trivial group | n=3 has no repeated prime and qualifies. n=9 fails since 3∣w₂(ℚ)=24. The trivial-group scalar a−1 is 0, not a unit. | No artificial vanishing or squarefree exclusion. |
| §0.5 finite endomorphism criterion | A=ℤ/9,f=2,n=9 | f(A)=A and ker f=0; hence ker f∩A[9]=0. | Retain. |
| §0.5 failed premises and n=0 | A=ℤ/9,f=0,n=3; A=ℚ/ℤ,f=3,n=3; A=0 | Finite premise gives 3A≠A and intersection has order 3. Infinite example has f(A)=A but intersection also order 3. At n=0, onto finite f has kernel 0; zero group gives 0=0. | Finiteness is essential. |
| §0.6 exact eigenlift | Injection U→M, zero target class; D=3ℤ⊂ℤ,n=3 | Injectivity turns f(σu−χ⁻¹u)=0 into σu−χ⁻¹u=0. The generator 3 of D/3D is nonzero but maps to 0 in ℤ/3. | Retain exact lattice, not ambient valuation test. |
| §0.6 cyclotomic ramification | F=ℚ,p=3,a=2 | Degree=e=φ(9)=6, residue degree=1; 6 mod9 is not invertible. | Lifting works without averaging; ramification premise retained. |
| §0.7 S-unit/ordinary-unit separation | Class [2], then adjoin an n-th root | v₂(2)=1, so 2 is not an ordinary unit; after adjoining α with αⁿ=2, its power class becomes 1. | No unconditional extension injectivity or uniform S in n. |
| §0.8 unit multiplicities | F=ℚ,p=3,5,7 | r₂=0; inverse-character mod-p dimensions are 1,0,0. At p=3 the extra class is μ₃, not a free-unit rank. | Torsion correction retained. |
| §0.8 equivariant Dirichlet rank | Totally imaginary quadratic F, odd nontrivial character; trivial character | Nontrivial odd multiplicity r₂(F)=1; trivial multiplicity r₁+r₂−1=0. | Nontriviality and archimedean stabilizers distinguish the formulas. |
| §0.9 finite Chern unit theorem | F=ℚ,n=1,3,5,35 | At 1 both groups are trivial. At 3 the reduced good-order statement compares order-3 groups; at 5 and 35, the odd K₃ quotient and inverse-character unit part are zero. | Prime/composite and reduced-order controls agree. |
| §1.1 definition D | n=0,1,2; ζ=−1 | D₀=1,D₁=1,D₂(x)=1+x; in the zero ring its value is the unique element 0=1. | Actual commutative-ring definition; not restricted to fields. |
| §1.1 quasi-periodicity | n=2,s=1,ζ=−1,x=2 | Left (1−4)D(−2)=3; right D(2)(1−2)²=3. At x=1 both sides are 0; at s=0 both are D(x). | Retain cleared, division-free form. |
| §1.1 phase-free value | n=1,2,3 | Values are 1=1, 2²⁴=2²⁴ and D₃(1)²⁴=3³⁶. The cubic value before taking powers is ζ(1−ζ)³. | Exact polynomial remainder tests n≤16 also pass. |
| §1.1 cubic class and field extension | ℚ(ζ₃)⊂ℚ(ζ₉) | D₃(1)=ζ₃(1−ζ₃)³; over ℚ(ζ₉) it equals (ζ₉(1−ζ₃))³. | Nontriviality is field-relative, not universal. |
| §1.2 finite sum and singular total division | n=0,1; n=2,ζ=−1,x=y=−1,z=1 | f₀=0,f₁=1. Singular f₂=1 because its second quotient is 0/0=0, whereas a geometric-sum replacement gives 2. | Singular input excluded from identities. |
| §1.2 shifted product convention | n=2,ζ=−1,x=2,y=3,z=5 over ℚ | f=1+(1+3)/(1+2)·5=23/3. Starting the product at exponent 0 gives 11 instead. | Fixes j+1 indexing. |
| §1.2 difference equation | n=1,𝔽₁₁,(2,3,6) | (1−6)·1=6; (2−3·6)·1=6. | Exhaustive tests above extend beyond this boundary. |
| §1.3 KMS | Ten finite-field/order pairs above | 8,038 pairs of exact left/right values agree, including 𝔽₁₆,n=3 and 𝔽₂₇,n=2. | No field-embedding shortcut; retain integral descent. |
| §1.3 analytic center | X=1/5,Y=2,Z=−4/5 | (1−Y)Z=4/5=1−X; |X/Y|=1/10<4/5<1; S=4/9 and C=169/36. | Nonempty nonsingular annulus and positive branches. |
| §1.3 Gaussian/phase scale | Same center, n=1; residue increment j at general n | √S=2/3; ((1−x)/(1−yz))√C=(4/13)(13/6)=2/3. Log-period summation gives −nεj²/(2S), hence √(2πS/n), not √(2πS). | Corrected scale; uniform tails remain a proof target. |
| §1.3 unshifted Pochhammer half-power | n=1,x=−1 | After removing exp(Li₂(−1)/ε), inverse product tends to 2^(−1/2); positive half-power would give 2^(1/2). | README and actual PDF (57) agree; no sign finding. |
| §1.3 dilogarithm route | Same center | Abel inputs are 4/9,1/9 with sum 5/9; its three transformed arguments are 1/2,1/5,1/10. Log quotient (1−Z)/(1−X/(YZ))=8/5=−YZ. | Branch domains and cancellation inputs agree. |
| §1.3 algebraic-density target | n=1; general simple zero in z | For n=1 the x equation has derivative 1. For general n the constant polynomial 1−(1−yⁿ)zⁿ has nonzero z derivative at each zero over the generic coefficient field. | Eisenstein route retains a simple prime and monic freeness; no positive-characteristic embedding in ℂ. |
| §1.4 Kummer value/odd-order scope | n=2,X=1/2 | For x=1/√2, P=(2+√2)/4. A square root is t/2 with t⁴−4t²+2=0; its cyclic quartic field is not the universal multiquadratic extension. | Even-order case is not covered by odd descent. |
| §1.5 powered descent ambiguity | F=ℚ(ζ₃),n=3,ξ=0 | [1] and [2] both restrict to 1 in the universal Kummer extension; v₂(2)=1 prevents [2]=1 in Fˣ/Fˣ³. | Lift set is a torsor, not a unique value without coprimality. |
| §1.5 root and CRT laws | n=15; ζ↦ζ⁻¹ | Roots for orders 3,5 are ζ⁵,ζ³, respectively; inversion changes exponent 1 to −1. At ξ=0,n=1, lift set={1}. | Domains and uniqueness conditions retained. |
| §1.6 étale Bloch versus ordinary Bloch | F=ℚ,n=5,[32] | Boundary is 5(2∧−31), so it vanishes mod5. Dividing gives {2,−31}; its tame value at 31 is 2 of order 5. Ordinary K₃(ℚ)/5=0. | Larger group detects a nonzero boundary; not the ordinary Bloch group. |
| §1.7 eta degeneracies/root change | n=3,5 | At 3 the degenerate sum [∞]+2[0]=[0], not 0. At 5, root change k=2 multiplies eta by k²=4. | Keeping [0] and the root convention matters. |
| §1.8 positive chains | C₃ | dα₂=3[t], while dα₃=0 in coinvariants. A negative periodic generator gives the opposite Bockstein. | Positive chain convention agrees with supplied Bott. |
| §1.8 integral lift obstruction | Scalar ζI in M₃(ℚ(ζ₃)); ζ in the field | det(ζI)=ζ³=1, so its K₁ class is zero; the field unit ζ has nonzero K₁ class. | Obstruction concerns K₁, not inequality of ring elements. |
| §1.9 diagonalization/cyclic generator | n=3 | det of eigenvector matrix is ζ−ζ⁻¹≠0; rescaling a column by its inverse makes determinant 1. Root inversion exchanges the two eigenvalues. | No unmarked conjugacy/normalization shortcut. |
| §1.10 raw versus positive Chern | Order 3 | Raw value ζ⁻¹=ζ² differs from positive value ζ; squaring gives ζ versus ζ², still different. | Separate normalization comparison required. |
| §1.11 exceptional finite field | n=3,ℓ=2 | In 𝔽₄, D(1)=ζ, R([0])=ζ², and cubes={1}. Both relevant groups have order 3, but this alone does not identify their signed reduction maps. | Retain local calculation; repair ownership by R02. |
| §1.11 unique finite roots | n=3,ℓ=5 versus ℓ=7 | gcd(3,4)=1 gives a unique cube root in 𝔽₅ˣ; gcd(3,6)=3 gives three cube roots of 1 in 𝔽₇ˣ. | Congruence ℓ≡−1 is material. |
| §1.12 exact valuation | n=3,ℓ=5,17 | v₃(6)=1 versus v₃(18)=2. In cyclic order 18, an order-3 element is 6g and is 0 modulo 3G; it cannot generate G/3G. | Retain exact-valuation test and higher-order distribution. |
| §1.13 detection up to unit | Cyclic order 5, classes g and 2g | At every place, r(g)=0 iff 2r(g)=0; g≠2g. Nonzero Frobenius occurs at infinitely many places. | Vanishing loci cannot fix a scalar; target must be a product, not finite-support sum. |
| §1.14 scalar calibration | n=5,a=2,b=1 or −1 | γ=ab⁻¹ gives 2 in the positive case, 3 in the negative case. | Sign comparison cannot be omitted. |
| §1.15 torsors/root lines | ξ=0; m=2; representatives 2 and 18 | Trivial class gives trivial torsor; squaring a square class gives 1. y²=2 is transported to (3y)²=18, without supplying a rational root of 2. | Representative independence does not trivialize every torsor. |
| §1.15 retain global degree | Cubic torsion class and p=5 completion | Prime-to-5 torsion maps to 0 in the completed ℤ₅-module but its order-3 Chern data need not be 1. | Completed presentations cannot replace all-order global torsors. |
| §2.1 compatible roots | Coprime 2 and 3 | ζ₂ζ₃=exp(5πi/3), not exp(πi/3). At p=2,m=5 the transition shift is −2ζ₅ and has valuation 1. | Distinguishes compatible CRT roots from independent principal choices. |
| §2.2 two Frobenii | K=ℚ(i),p=3,m=4 | φ_R(i)=−i and φ_R(ζ₄)=ζ₄; φ_cycl(i)=−i and φ_cycl(ζ₄)=−ζ₄. | Coefficient and root action separated. |
| §2.2 semilocal order | ℚ(∛2),p=5 | x³−2=(x−3)(x²+3x+4) mod5; residue degrees 1,2 give Frobenius order lcm(1,2)=2. | Retains all factors and inseparable exclusions. |
| §2.3 convergent re-expansion | x²; Σxᵏ with constant shift c | x²↦x²+2cx+c². For c=p, the geometric constant is 1/(1−p); for c=1 the scalar sum diverges. | Requires topological nilpotence and completeness. |
| §2.4 twisted gluing | K=ℚ(i),p=3,constant family i | rex(i)=i, φ_R(i)=−i; 2i≠0. Constant 0 and 1 give 0=0 and 1=1. | Rejects arbitrary coefficient constants. |
| §2.5 p-chain untwisting | Scalar seed i, p=3 | Twisted sequence i,−i,i becomes i,i,i after φ_R^0,φ_R^1,φ_R^2. | Fixes inverse reconstruction direction. |
| §2.6 prime-to-p chart | m=5,p=11; m=3,p=2 | Φ₅ has four roots 3,4,5,9 mod11, giving four factors; Φ₃ mod2 is irreducible of degree 2. | Full étale algebra has rank φ(m) in both cases. |
| §2.6 excluded nonétale case | m=p=3 | Φ₃(q)=(q−1)² mod3; derivative at 1 is 0. The residue quotient is nonreduced, unlike the prime-to-p chart. | Retain p∤m. |
| §2.6 mixed-adic p-chain | p=2,m=1,q+1 quotient | Mod(4,q+1), q−1=−2≠0 but (q−1)²=4=0. At q=1, (q+1)^N=2^N is not in (2)^(N+1). | Mixed ideals, not falsely identical single-adic topologies. |
| §2.7 splitting/image criterion | p=2, prime-to-p seed 1 only at order 1; polynomial q² | Reconstruction is 1 along orders 1,2,4,… and 0 on other chains. At q=1+x, q² has coefficients 1,2,1. | Local product supports more seeds than a global integral Taylor family. |
| §2.8 coordinate conversion | q=ζ(1−u),x=q−ζ | x=−ζu; x²=ζ²u². At m=1 the linear sign is −; at m=2 it is +. | Weighted Taylor coordinate sign retained. |
| §2.8 jet index bounds | N=0,1,2,4 | First two have no pairs; N=2 has (1,0); N=4 has (1,0),(1,1),(1,2),(2,0),(3,0), with total coefficient rank 6. | Strict bound matters; no natural-subtraction junk entry. |
| §2.9 rational-field comparison | R=ℤ[1/2] | Odd-order indicator e satisfies e²=e, e≠0,1; integral H_ℤ is a domain. | Localization changes components; no blanket domain assertion. |
| §2.10 external components | Δ=6; orders 5,35,10,18 | Their Δ-supported parts are 1,1,2,18. | Orders with different labels are disconnected by the allowed edges. |
| §2.10 internal idempotents | K=ℚ(i),m=4 | With a=i⊗ζ₄, a²=1. Thus e=(1−a)/2 has e²=e and gives components 0,1. | One order component need not be a domain. |
| §2.11 scalar embedding | K=ℚ(ζ₅),order 2 | φ₂⁻¹(ζ₅)=ζ₅³, and φ₂(ζ₅³)=ζ₅. Wrong choice φ₂(ζ₅)=ζ₅² gives φ₂(ζ₅²)=ζ₅⁴. | Inverse Artin action is necessary. |
| §3.0a completed root classes | p=5,root order 3 | Inverses of 3 are 2 mod5 and 17 mod25, and 17 mod5=2. | Coefficient-compatible divided class; import under R01. |
| §3.0a rank and torsion | ℚ₅×ℚ₂₅; p=3 | Completed rank 1+2=3. The extra order-3 torsion at ℚ₃ maps to 0 in a characteristic-zero regulator target. | p>3 and completion matter; R01. |
| §3.0b lattice and determinant | p=5,ζ³=1 | p⁻²D(ζ⁵)=4+3ζ; p⁻²D(ζ)=1+2ζ; p⁻²D(i)=1. Determinants 3 and 2 respectively. | R03 corrects the labelled Check; R01 imports theorem. |
| §3.0b trace/naturality | Diagonal quadratic algebra; degrees 2 then 3 | 25↦(25,25), trace 50; iterated trace 150=6·25. Empty algebra gives 0→0. | Actual map and full trace required; R01. |
| §3.1 corrected local section | ξ=0,m=1,f=(1+x)^(1/p) | Log defect is 0, constant 1, but first coefficient 1/p is nonintegral. | Integral first jet excludes the wrong section. |
| §3.1 module versus units | Generator s; 0 and ps | 0 has constant 0; ps has nonunit constant p. Both are module elements but neither is an invertible local section. | Span definition, not a group of units. |
| §3.2 Dwork criterion | p=5,f=1+x/5 | Coefficient of x² in log(f(q⁵−1))−5log f(x) is 8/5, not in 5ℤ₅. For (1+x)^(1/5), quotient is 1 but first jet fails. | Both defect and first-jet premises tested. |
| §3.2 coefficient scope | Equal characteristic p; ramified ring; p=2 | In characteristic p, p=0 and inversion collapses; ordinary exp at arbitrary 2ℤ₂ does not meet the p>2 convergence bound. | No implicit extension of the unramified mixed-characteristic result. |
| §3.3 depleted coefficients | p=5,s=0 | Coefficients at t,t²,t³,t⁴ are 1; at t⁵ and t⁰ are 0. Li₀(t)−Li₀(t⁵) has those coefficients. | Checks depletion and zero index. |
| §3.3 defect residue | Coefficient t, q=1+x | p/(1−q)=−p/x, not +p/x. | README corrects source (56); R04 fixes pointer. |
| §3.4 regularized factors | Empty root presentation; generator rescaling | Empty nonconstant product is 1. Rescaling local generator by 2 at p=5 has unit ratio 2, while original prime-to-p torsors remain separate data. | No recovery of global torsors from a completed zero class. |
| §3.4 representative change | p=5,m=3,u=6 | First log term log(6)=5 mod25; the indicated twice-log contribution is 10 mod25, not 0. | Trivialization changes must be included, not discarded as constants. |
| §3.5 half-shift coefficient | ζ=−1,r=1; ζ=2,r=1; ζ=−1,r=2,−1 | H values are 1/48,1/12,1/96,−1/48. B₂(1/2)/2·Li₀(−1)=1/48. | Sign and 1/r scaling agree. |
| §3.5 excluded denominators | ζ=1; r=0; p=2,3 | ζ/(1−ζ) and 1/r have totalized zero values at forbidden inputs; 24 is nonunit at 2,3. | These are outside the analytic/first-jet theorem, not valid zero limits. |
| §3.6 local rank-one freeness | ξ=0,s=1; s′=2s or 5s at p=5 | Ratios are 2 (unit) and 5 (nonunit). Coordinates of as under s′=2s are a/2. | Freeness concerns an invertible generator, not every nonzero section. |
| §3.7 phase normalization | ω=2 at p≥5 versus p=3 | ω−ω⁻¹=3/2 is a unit at p≥5 and 0 mod3. Zero cocycle gives β=0. | Prime restriction is tied to a computed denominator. |
| §3.7 linear extension | s′=2s,p=5; zero | E(a/2)·2ŝ=E(a)ŝ; E(0)=0. At degree zero the i seed extends i,−i,i. | Generator independence and scalar reconstruction agree. |
| §3.8 linear equalizer | K=ℚ,Δ=6,f₂=−1,others 1 | Nonlinear products are all 1, but edge 2→10 at p=5 asks −1=1. | Correctly rejects nonlinear-only membership. |
| §3.8 addition negative control | Same f and constant 1 | Their sum has values 0 at order2 and 2 elsewhere; γ=1 products are 0 at2 and 4 at10. | Printed nonlinear condition is not additive; linear equalizer excludes this defect. |
| §3.8 nonlinear consequence | Degree 0,f=1−q,γ=2 | Product is (1−q²)²(1−q⁻¹), a Laurent polynomial over ℤ[1/2]. | Localize coefficients; do not reduce modulo 2. |
| §3.9 zero-degree ring identification | f_pm=φ_R⁻¹rex(f_m) | Applying φ_R gives rex(f_m)=φ_R(f_pm), and applying φ_R⁻¹ reverses it. At the sign family the edge is −1≠1 in either form. | Both directions agree with ring gluing. |
| §3.9 graded multiplication | Degrees 0,0 and ξ,−ξ | 0·f=0,1·f=f,e(1−e)=0; ξ+(−ξ)=0. | Multiplication need not produce a unit. |
| §3.10 effective descent | H and proper idempotent summand eH | Component ranks are (1,1) for H and (1,0) for eH. | Rank one must hold on every component. |
| §3.10 finite-presentation negative control | L_p=p⁻¹ℤ_p in ℚ_p for every p | Intersection contains 1/2,1/3,1/5,…; every finite set of rational generators has bounded denominator support, so cannot generate it. | Local rank 1 does not prove finite generation; actual descent remains a target. |
| §3.11 tensor equivalence | M₀⊗M_ξ; dual pairing | 1⊗s↦s. A finite dual witness maps Σf_i⊗g_i to Σf_i g_i=1; a single fg=1 would imply more. | Keeps genuine tensor inverse, not global generator. |
| §3.11 Picard character | ξ=0 and ξ+(−ξ) | [M₀]=0 and [M_ξ]+[M_(−ξ)]=0. | Only after invertibility; agrees with pinned Picard API. |
| §3.12 substitution | γ=2,m=1,f=1−q; m=2 | At 1+x, 1−q²=−2x−x². Order 2 is sent to order 1. | Full order change, not an automorphism at every m. |
| §3.12 involution | q=ζ+x | q⁻¹=ζ⁻¹−ζ⁻²x+…; at ζ=1, x↦−x/(1+x), whose double application is x. | Pins sign, center and inverse map. |
| §3.13 proportionality | g=0; f=g; orthogonal idempotents | For g=0, a=b=0 and af=bg=0. For f=g, both sides use gτg; orthogonal factors may give b=0. | Cross multiplication is valid without division by a section. |
| §3.14 propagation | Zero component; series x | E(0)=0, but ct(x)=0 while x≠0. An inverted-prime component indicator has values 0 and 1 on disconnected components. | Neither constant-term nor across-Δ propagation is asserted. |
| §3.14 constant line | Torsor y²=2; zero degree | y is not in ℚ, while y spans its root line. At ξ=0,q² has constant 1 at q=1; zero section has constant 0. | Integral root-line target, not an unjustified scalar value. |
| §3.15 multiplication/freeness | Sections 1,0,1−q in degree zero | Multiplication by 1 is identity, by 0 is zero. If (1−q)f=1, evaluation at 1 would give 0=1. | Nonzero does not imply generator. |
| §3.16 pullback | ℚ→ℚ(i),p=5; identity | a↦(a,a), retaining both split factors; identity gives a↦a. | Field map fixes the abstract root and acts on coefficients. |
| §3.16 scalar base change | ξ=0 | H_S⊗_(H_R)H_R→H_S sends s⊗r↦sr and 1⊗1↦1. Arbitrary R coefficients would require the failed constant-i embedding. | Correct tensor base; no invented universal R-algebra structure. |
| §3.17 Galois action | K=ℚ(i),σ conjugation | i↦−i↦i, abstract ζ₄ unchanged. Involution τ instead sends ζ₄↦ζ₄⁻¹. | Coefficient action and q-involution differ. |
| §3.18 determinant norm | Split quadratic u=(1+2x,1+3x) | Norm=1+5x+6x²; coefficientwise norm misses 6. Base scalar 3 has norm 9 and trace 6. | Whole-series determinant and full rank retained. |
| §3.18 log/trace | Same u | x coefficient 5 on both sides; x² coefficient in log norm is 6−25/2=−13/2, equal to −4/2−9/2. | Correct additive regulator degree for a multiplicative norm. |
| §3.19 transfer | Quadratic extension, constants; tower degrees 2,3 | Norm(1+1)=4 but Norm(1)+Norm(1)=2; Norm(6)=36=Norm(2)Norm(3)=4·9. Tower gives (2²)³=2⁶=64. | Multiplicative, not additive; identity extension and 0,1 have expected values. |

Nonabelian groups do not satisfy the CommGroup/abelian hypotheses used for power classes and finite Fourier projectors: in S₃ the squares are {1,(123),(132)}, and multiplication of squares is not the square of a product in general. For transpositions a=(12),b=(23), a²b²=1 while (ab)²≠1. The ordinary quotient-by-power-hom construction therefore cannot be widened to arbitrary groups. Similarly, noncompact groups, arbitrary topological coefficient modules, inseparable extensions and ramified local coefficient rings were checked against the explicit hypotheses of the suppliers; they are not admitted by the imported compact/profinite, smooth discrete, number-field or unramified contracts.

### Pinned-library audit

Pins read from lake-manifest.json: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Paths below are relative to the corresponding pinned library root. The following declaration bodies/signatures were opened, rather than inferred from names.

| Library file and line | Declaration(s) and relevant limit |
|---|---|
| Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean:784,821 | IsPrimitiveRoot.autToPow and autToPow_spec; nonzero order and primitive-root datum. |
| Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean:212 | modularCyclotomicCharacter requires the root-count equality and NeZero n. |
| Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean:161,226,231 | selmerGroup is defined by valuations outside S; fromUnitLift and its injectivity require positive n. The carrier itself does not assert ordinary-unit representatives. |
| Mathlib/RingTheory/PowerSeries/Basic.lean:559,583,605,615 | rescale multiplies coefficient n by aⁿ, with coefficient, composition and map laws. It is not convergent translation by a nonzero constant. |
| Mathlib/RingTheory/PicardGroup.lean:484,494,502 | Pic.mk_eq_mk_iff, mk_eq_one_iff_free and mk_tensor apply to genuine invertible modules; they do not supply effective descent. |
| Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:652 | Cyclotomic separability under the characteristic restriction; it does not imply irreducibility over each finite field. |
| Mathlib/RingTheory/Polynomial/Cyclotomic/Eval.lean:41 | eval_one_cyclotomic_prime_pow: exponent p^(k+1), with p prime. It is not an order-zero formula. |
| Mathlib/RingTheory/Smooth/Fiber.lean:245 | Algebra.Etale.of_formallyUnramified_of_flat also requires finite presentation; those hypotheses are available for the finite cyclotomic algebras, not arbitrary rings. |
| TauCeti/Algebra/Group/PowerClassGroup.lean:38,48,52 | powerSubgroup, powerClassQuotient, powerClassHom use CommGroup; the quotient is by the image of the power homomorphism. |
| TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:341,360,370,384,537 | kummerClassMap, injectivity, surjectivity, kummerIso and kummerIsoTransport; transport needs an equivariant coefficient equivalence. |
| TauCeti/RepresentationTheory/Homological/ContCohomology/InnerConjugation.lean:297 | map_eq_id_of_inner retains locally compact group and smooth discrete coefficient assumptions. |
| TauCeti/LinearAlgebra/Eigenspace/JointEigenvector/Basic.lean:368,384 | The two finite commutative-group eigenspace decomposition results require invertible group order and enough roots over the domain. |
| TauCeti/NumberTheory/LocalField/ResidueCorrespondence.lean:164,178,197 | frobeniusAlgEquiv, its order and residue-power congruence are local unramified results; the product identification is an arithmetic adapter. |
| TauCeti/NumberTheory/NumberField/ArtinSymbol.lean:57,113 | artinSymbol has an explicit unramifiedness argument and returns a conjugacy class; restriction is along a normal scalar tower. |
| TauCeti/RingTheory/DedekindDomain/SInteger/SelmerGroup/Basic.lean:186,269,296 | S-unit injection, kernel and range descriptions; range_toClassGroup retains NeZero n. |
| TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean:74,83 | infinite_frobeniusPrimeSet and the finite-symmetric-difference density theorem supply infinitely many specified primes and allow finite exclusions. |

These 16 file groups cover the substantive native interfaces used in the adversarial checks. Object searches in both pins for cyclic dilogarithms, KMS/cyclic hypergeometric sums, Habiro completions, Bloch groups and completed K₃ found no existing replacement for the four Lean headlines or their missing heavy carriers. Standard unit, discriminant, cyclotomic, homology and completion declarations were located separately; their existence was not treated as a proof of the new comparison maps.

### Cross-roadmap ownership and supplier resolution

The prescribed roadmap search/show tools and the supplied checkouts were used to resolve the contracts by object. The citation resolver found no cross-roadmap citation or own Lean name found nowhere against main fa41b37 and the indexed open heads. Its library-name check was unavailable on that service host, so the pinned-library checks above were performed locally. Earlier/open-roadmap targets are contracts, not claimed completed implementations.

| Supplier | Sections resolved and what is consumed |
|---|---|
| StableHomotopyKTheory | §§7.2–7.4,7.33: finite-coefficient spectra, universal coefficient sequence, products and their parity restrictions; README:2367,2389,2397,2788. |
| GeneralAlgebraicKTheory | §§2.1–2.4,3.2,7.4–7.8: restriction, products and finite-flat transfer; §13.8c finite-field K-groups; README:260,288,312,330,418,1478,1506,1522,1538,1554,3027. |
| ArithmeticKTheory | §§3.4,4.1–4.4,5.2–5.4,6.1,6.13: tame-kernel finiteness, Tate invariants, odd-primary comparison, real-place qualifications and the actual inverse-character Picard quotient/invariant statement; README:1190,1402,1454,1486,1547,1611,1795,1819,2065,2958. |
| K3BlochGroups | §§3.12–3.16, Layer 4,5.4–5.5,6.3–6.7: convention changes, configurations, finite fields with q≥4, root multiples/divided classes and Chern comparison; README:904,952,985,1011,1045,1835,1885,2089,2119,2230,2256. Its separate 𝔽₂ group calculation does not provide the reduction square in the declared gap. |
| K2SymbolsBrauerPartII | §5.2, README:782: actual adic K₂ torsion comparison and its coefficient/restriction/completion diagrams, not a replacement of K₂ by a divisible envelope. |
| KTheoryFiniteLocalFields | §§1.2,1.5,1.8,2.1,3.0a,6.5a–6.10,7.1–7.4,7.6: Bott/Chern conventions, finite-field maps, rigidity, Milnor/completed inputs and semilocal completion; README:230,267,316,512,1360,1373,1398,1418,1459,1484,1609,1620,1639,1649,1682 for the inspected targets. |
| ColemanIntegration | L2.16–L2.18 and L2.Fb: analytic continuation, equivariance, branch-normalized dilogarithm and Bloch evaluation; README:1468,1726,1743,1754. These supply evaluation, not the completed K₃ normalization/lattice comparison duplicated in R01. |
| HabiroCyclotomicCompletions | §§1.1–1.5,3.1–3.3,4.5–4.8,5.2–5.4: generic products/completions, convergent substitution, Taylor-lattice detection and rational-coefficient components; README:204,380,462,581,710,935,1024,1061,1496,1644,1760,1907,2083,2177,2311. Full arithmetic coefficient/Frobenius assembly here is a distinct extension. |
| QWittVectors | §§2.4,6.1, README:414,841: perfect coverage and the completed étale Frobenius with naturality. No irreducibility of Φ_m modulo p is supplied or needed. |
| QSeriesPartitionsAndMockModularForms | §§1.2–1.6,2.3,2.5,5.2, README:129,150,171,195,209,280,323,815: integer-indexed products, convergence, Ramanujan and eta. The radial asymptotic is expressly owned here. |
| PolylogarithmFunctions | §§1.1–1.7,3.2,3.4, README:105,138,151,170,189,210,223,399,449: principal branches, derivative recursion, inversion and Abel's identity. Landen's derivative argument here is not misattributed to a nonexistent supplier target. |
| Chebotarev | Completed/Chebotarev/README.md, Layer 10, and the pinned declarations above: prescribed conjugacy classes and finite exclusions. |
| PadicHodgeRegulators | §§4.7,5.6–5.9,6.3 at the supplied open head: the missing ownership import of R01. README:7,1165,1188,1213,1231,2699 explicitly identifies HabiroNumberFields as consumer. |

The ownership search included main, board packages and the accessible open heads for HabiroRings, HabiroNahmSeries, HabiroCohomologyFoundations/PartII, QWittVectors, K3BlochGroups, ArithmeticKTheory, KTheoryFiniteLocalFields, Polylogarithms and PadicHodgeRegulators, plus the global object search across the readable index. The name search found no second declaration with one of this file's six fully qualified names. The arithmetic full-coefficient ring and linear indexed-family construction are distinct from generic cyclotomic completion and relative Habiro cohomology. Nahm asymptotics remains downstream; the early scalar comparison explicitly assumes its eta value. No cycle through that value was found.

The declared gap is precise and limited: a positive cyclic comparison and its naturality square are one coherent contract; K3BlochGroups already supplies the group carrier, so that carrier is not requested again. R02 concerns its inconsistent ownership at this head, not its being unfinished. Restoring the declared contract permits review conditional on that gap.

The README has the required scope, conventions, exact supplier contracts, layer order, examples/dependencies, consumers and references. Definition blocks have API prose and at least three associated discriminating Checks; R03 is the incorrect numerical Check found. No computational algorithm, route-specific replacement theorem, copied source passage, process-based instruction, sorry'd data or set_option was found. References to earlier work and exclusions such as unramified p>3 occur with the relevant source theorem and separate boundary tests, rather than hiding unsupported all-prime claims.

## Not verifiable

- No sampled source was inaccessible or paywalled, and no missing-reference request was needed. Published CGZ and its preprint were distinguished rather than silently interchanging theorem numbers.
- The finite computations and successful sorry build do not certify the new effective-descent theorem, its conservative arithmetic charts, or scalar/norm descent. GSWZ's printed proof does not supply those arguments. The README explicitly owns them in §§3.7–3.10 and 3.16–3.19; they remain mathematical implementation obligations.
- The exact c_fixed/c_raw/c_plus normalization diagram is not settled by the printed eta evaluations alone. The roadmap makes its uses conditional on that named comparison. No unproved choice of sign was treated as verified.
- The exceptional positive 𝔽₂ comparison and its arithmetic reduction square remain the declared supplier gap. Group orders and the nonzero P-value verify a necessary test, not that naturality square.
- This is a review of the specified heads and pins. Open-work ownership was checked where the brief supplied readable files; unreadable or unprovided work was not inferred from titles.

## Source issues

- **Error** in GZ at Appendix A, Gaussian preceding (59), printed p.236, GZ line 912: the source says the quadratic exponent has positive coefficient 1/S; it should be −mn²ε/(2S), with the subsequent sum scaled by 1/√m; affects the proof.
- **Misprint** in GZ at Appendix A (60), printed p.237, GZ line 935 onward: the source says the m-th power has prefactor √(2π/ε); it should be (2π/ε)^(m/2), with the consistently tracked phase; affects the proof.
- **Error** in W-thesis at Lemma 2.12 proof, printed p.32, W-thesis line 1448: the source says Φ_m is irreducible modulo ℓ whenever ℓ∤m; it should be separable, retaining every field factor; affects the proof.
- **Error** in Q at Lemma 2.12 proof, printed p.18, Q line 781: the source says the prime-to-ℓ cyclotomic quotient is one residue field; it should be the full finite étale algebra, for example four factors at m=5,ℓ=11; affects the proof.
- **Error** in GSWZ at Definition 1.3 and Theorem 1, printed p.9, GSWZ lines 380–402: the source says arbitrary rational linear coefficients satisfy the intended local-section definition; it should require an integral first jet, excluding (1+x)^(1/p); affects a stated result.
- **Misprint** in GSWZ at (56), printed p.19, GSWZ line 858: the source says the additive-coordinate residue is positive pLi₂^(p)(ζ); it should be −pLi₂^(p)(ζ), since 1−q=−x; affects a stated result.
- **Error** in GSWZ at Definition 1.4 and Theorem 2, printed pp.10–11, GSWZ lines 415–447: the source says the nonlinear product condition defines the asserted module and recovers degree zero; it should include coherent full-order linear transitions; affects a stated result.
- **Gap** in GSWZ at proof of Theorem 2, printed p.43, GSWZ lines 2217–2220: the source says multiplicative compatibility yields the tensor isomorphism and invertibility; it should supply effective descent or a finite projective presentation with conservative tensor comparisons; affects the proof.
- **Error** in GSWZ at footnote 1, printed p.6, GSWZ lines 262–265: the source says the abelian scalar family uses the direct Artin action at m; it should use its inverse for the displayed Frobenius gluing direction; affects a stated result.
- **Error** in GSWZ at (329), printed p.65, GSWZ lines 3335–3336: the source says the p-adic completion agrees with R⊗ℤ_p without excluding inverted primes; it should restrict that identification to p∤Δ; affects a stated result.
- **Misprint** in CGZ at Proposition 4.2(a), printed p.22, CGZ line 1008: the source says the simultaneous local map lands in a direct sum; it should land in the product, since nonzero Frobenius values occur infinitely often; affects a stated result.
- **Error** in CGZ at proof of Theorem 5.2 after Lemma 5.3, printed p.27, CGZ lines 1243–1244: the source says the reduced order-n eta class generates at every q≡−1 mod n; it should require exact p-valuation or pass through higher-order distribution; affects the proof.
- **Misprint** in CGZ at §6 after (36), printed p.32, CGZ line 1488: the source says Q/nR is K₂(F); it should be K₂(F)[n], as in the surrounding exact sequence; affects nothing.
