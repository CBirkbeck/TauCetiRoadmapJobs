<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1113#issuecomment-6400415305 -->
Red team round 1 pass a (codex) of 6e5cf00

Verdict: needs_changes

1. **F01** (P3) A uniformizer class need not have order two

   **Location:** packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:292, also :354 and :1246: “the uniformizer class ... has order two”.

   **Claim:** A uniformizer of a ramified quadratic local extension has order two in E_v×/F_v×.

   **Witness:** In E=ℚ₃(√3), π=√3(1+√3) is a uniformizer, but π²=12+6√3∉ℚ₃. Therefore [π]²≠1. Odd valuation only gives order two after additionally quotienting by integral units.

   **Exact repair text:** “For a ramified quadratic local field E_v/F_v, valuation induces (E_v×/F_v×)/im(O_E,v×)≅ℤ/2ℤ. Every uniformizer represents its nonzero class and is excluded from the integral-unit image. E_v×/F_v× is compact; a uniformizer class in this group need not itself have order two.” Replace all three assertions and retain the displayed ℚ₃ counterexample as a negative-control Check.

   **Repair test:** v_E(π)=1, v_E(F×)=2ℤ, so the new quotient class is 1 modulo 2; π² has valuation 2 and lies in F×O_E×, while remaining outside F×.

2. **F02** (P3) The quadratic endpoint lacks its actual period-formula locator

   **Location:** packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:738–740: “the imaginary quadratic period relation”.

   **Claim:** The exact quadratic height formula is supported by A's introductory remark and C Theorem 0.3.

   **Witness:** A line 38 only identifies the classical case. C line 288 is the height functional, not Chowla–Selberg. The required period relation and its height conversion occur in C §0.6, pp. 632–633, lines 339–370.

   **Exact repair text:** Append to §4.6: “The quadratic period identity and its conversion to height are [C], §0.6, pp. 632–633 (C lines 339–370); use Theorem 0.3(ii), p. 631, for the height functional. Theorem 0.5 alone is insufficient: it leaves a rational multiple of log 2.” Add §0.6, pp. 632–633 to the existing C manifest locator; retain its existing key.

   **Repair test:** For E=ℚ(i), the Dirichlet beta formula gives ℓ(0)=−log 4+2log(Γ(1/4)/Γ(3/4)). The asserted unscaled height becomes −log(Γ(1/4)/Γ(3/4))−log π/2. The complete quadratic period identity fixes this value; a formula modulo ℚlog 2 does not.

3. **F03** (P1) The auxiliary-prime input has no cited supplier

   **Location:** packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:894–898: “Use Chebotarev to choose enough inert primes”.

   **Claim:** The listed inputs of §7.1 provide arbitrarily many inert primes outside a prescribed finite set.

   **Witness:** The listed analytic sections concern residues, logarithmic derivatives and ideal counts. The actual owner is TauCetiRoadmap/Chebotarev/README.md:370–408, Layer 9, abelian Chebotarev; §7.1 does not cite it.

   **Exact repair text:** Add to the supplier contracts and §7.1's Needs: “Chebotarev Layer 9: for the nonidentity element of Gal(E/F)≅C₂, the unramified inert primes have Dirichlet density 1/2; removing finitely many primes leaves infinitely many. Use this to choose S outside the ramification set.” Add the same edge to Layer 7's dependency summary. This imports an existing main-branch owner; no new gap or duplicate density target is needed.

   **Repair test:** For E=ℚ(i), primes 3 and 7 are unramified inert and give g+|S|=3. After excluding either prime the density remains 1/2 and two replacements exist. For even g one inert prime makes g+1 odd; for odd g≥3, S=∅ suffices.

4. **F04** (P2) The hermitian-balancing contract does not specify a bound

   **Location:** packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:132 and :1190: “hermitian lattice balancing”; matching gap in design/plan.json.

   **Claim:** The declared reduction contract supplies the quantitative hermitian change of lattice needed in §13.3, as well as Siegel reduction.

   **Witness:** The contract specifies a size parameter only for a Siegel matrix. For L=ℤ[i], h_m(x,y)=m x̄y, every nonzero integral vector has h_m(v,v)≥m. Rank alone cannot bound the balanced Gram entries or the index.

   **Exact repair text:** Separate the two obligations. Retain the original slug for the explicit Siegel-matrix assertion. Add matching README/plan gap `gap:quantitative-hermitian-lattice-balancing`, with the same supplier, for: “For fixed n,r≥1, a degree-2n CM field E, conjugation-stable order R, full R-stable lattice L⊂E^r, positive definite hermitian form h, and integer N≥1 such that q=N Tr_E/ℚ h is integral on L, put D=max(2,|disc R|,N,det Gram(q on L)). There are C,a>0 depending only on n,r and E-linearly independent v₁,…,v_r∈L such that every conjugate of h(v_i,v_j) and the index [L:ΣR v_i] have absolute value at most CD^a.” Specify in §13.3 how its polarization supplies N and bounds D by a power of D_x. Do not assert that the change matrix is unimodular; retain its finite index. Cite PT Lemma 3.7, preprint p. 9 (PT lines 362–385), for the independent-vector argument, with the index bound included explicitly.

   **Repair test:** For the rank-one example N=1 and det Gram(q)=4m²; v₁=1 gives Gram entry m and index 1, bounded by D. For L=2ℤ[i], h(x,y)=x̄y, q has determinant 64, v₁=2 gives entry 4 and index 1. These examples distinguish varying metric size from varying lattice index; neither is measured by the original phrase.

5. **F05** (P3) A height Check only repeats its API law

   **Location:** packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:918: “An extension of the field of definition multiplies both degree and denominator by the same amount.”

   **Claim:** This supplies one of the three discriminating Checks for the quaternionic height definition.

   **Witness:** The same general base-extension assertion is already the API bullet at README:912. The Check names no extension, nonzero degree or resulting height, so it adds no instance testing that law.

   **Exact repair text:** Replace the first §7.2 Check with: “In the normalization calculation, take [F(P):F]=3 and arithmetic degree 6 log 2. The height is 2 log 2. Under a degree-two extension the numerator is 12 log 2 and the denominator 6, again giving 2 log 2. Leaving the numerator unchanged gives log 2 and fails.” Label this a normalization calculation, without asserting that these arbitrary numbers specify a CM point.

   **Repair test:** 6 log2/3=12 log2/6=2 log2; 6 log2/6=log2≠2 log2. The nonzero numerator detects the incorrect base-change convention.

## Verified sound

Read all 1,282 README lines and all 86 Suggested.lean lines: **68 numbered mathematical targets, 2 Lean declarations, 0 Lean definitions/instances**. Read the repository writing/review rules. The target inventory below covers every numbered target; the README uses numbered headings rather than bold target labels.

There are **21 Checks blocks, containing 69 bullets**. Their finite computations and negative controls are recorded below. The false uniformizer bullet is R01; its two repetitions fail for the same reason. The definition blocks have at least three associated Check bullets, but R05 identifies one that merely repeats its API law. The field and lattice hypotheses exclude the zero ring, inseparable number fields, positive-characteristic coefficient fields, nonfull lattices and degree-zero CM fields. The explicitly allowed empty partition is tested, rather than excluded. Arbitrary topological groups and non-quasi-separated schemes are not quantified over. The nonreduced determinant example correctly lies outside the regular arithmetic base.

**Source coverage:** 9 cited works available in the supplied legal cache; 68 target citation blocks inspected, with their advertised source statements or proof passages located. This is locator/statement verification, not certification of every proof in those works. R02 identifies the missing primary locator for the quadratic period input. The source ledger below gives the passages used, grouped by target. The preprint/author pagination is retained for PT, T12 and YE.

**Dependency coverage:** 22 cross-roadmap supplier subsections, naming 24 roadmaps, resolved; the two library subsections were checked separately. The resolver found no missing named roadmap sections or backticked declaration names. Detailed checks included the current GrossZagierAndArithmeticHeights sections 6.56, 7.65–7.67 and 7.77–7.78, the ramification restrictions in HilbertModularVarietiesAndShimuraCurves 18.2.17–18.2.18, ArakelovGeometryAndAbelianHeights 4.6–4.8, the analytic uniformity inputs, and the two earlier board-design contracts for Lubin–Tate reciprocity and the geometric isogeny estimate. R03 concerns an omitted dependency, which a name resolver cannot detect. There are **8 declared gap slugs**, each present in both the README and plan, with named suppliers. Their present absence is not treated as a defect; R04 concerns the precision of one contract.

Ownership searches used the roadmap tool, the board packages, main/Completed, the supplied sibling heads and the pinned libraries, searching objects as well as names. No second declaration with either acceptance theorem's fully qualified name was found. The generic component determinants, norm cokernel, discriminant identity, height machine, quaternionic adjunction and reduction machinery are imported. The overlap/total-reflex, CM graph application, orthogonal special-divisor intersection and quantitative CM conclusions are this package's targets. The abelian CM character-product/class-number targets of CyclotomicClassGroupsAndStickelberger have different hypotheses and conclusions. The two kept Lean declarations require substantive uniform number-field and CM-isogeny results; neither passes the one-tactic padding probe.

The two signatures in the supplied elaboration record agree with the file and README. Both retain g, its positivity, ε and its positivity, Field, NumberField, IsCMField and the degree equation. The second additionally retains the actual complex abelian variety, dimension equation and ring equivalence. No section variable is silently lost. No new Lean invocation was made, in accordance with the read-only/no-build instruction.

Pinned declarations inspected include CMField's native CM class, conjugation, unit index and regulator ratio; ClassNumber's positivity and nonzero ideal representative; Scheme.Hom.finrank and its finite-flat rank lemmas; Tau Ceti's AbelianVariety, End, IsIsogeny and underlying scheme morphism; and its ideal-count and discriminant bounds. In particular IsIsogeny means finite and surjective, while the degree statement relies on flatness of isogenies over ℂ, explained in README §10.2. Neither an arbitrary map nor a nonflat map is silently included in that bound.

The diff against origin/main changes only this package's folder. Suggested.lean has one Mathlib import, one used pinned Tau Ceti module, two theorems with sorry, and no sorry'd data, set_option, admitted examples or placeholder predicates.

Dependency checker output, unchanged:

```text
moved: ComplexMultiplicationAndExplicitReciprocityPartII moved in the merge order from #229 to #230, right after its last supplier AutomorphicBundles; checked as moved (the worker moves it there when it submits)
depcheck: 54 roadmaps, 616 edges, 0 problem(s)
```

The move is not a defect. No UPWARD or CYCLE was reported.

### Headline acceptance inventory

| Headline | Acceptance status |
| --- | --- |
| CM height linearity | Named as not statable: missing CM types, period functional and stable height carriers. |
| Integral CM realizations and different-torsion graph comparison | Named as not statable: missing integral families and Breuil–Kisin realization interface. |
| Total-reflex metrized determinant and height | Named as not statable: missing total-reflex family, filtered Hodge bundles and arithmetic degrees. |
| Orthogonal big-CM intersection and prime elimination | Named as not statable: missing integral GSpin divisors and arithmetic intersection carriers. |
| Nearby-type identity and quaternionic height | Named as not statable: missing component heights, integral curves and modified intersection. |
| Averaged Colmez, including g=1 | Named as not statable: missing actual CM-type/height carriers. |
| Relative class-number growth | Stated, Suggested.lean:49, on native number fields. |
| Distant CM ideal isogenies | Stated, Suggested.lean:71, on native abelian varieties and actual isogenies. |
| Individual CM height bound | Named as not statable: missing stable height. |
| Primitive and arbitrary center-order CM orbits | Named as not statable: missing polarized CM moduli/Galois-action interface. |
| CM lift height and bounded-moduli-degree finiteness | Named as not statable: missing CM Siegel locus and algebraic uniformization interface. |

No headline was replaced with algebra on unconstrained scalars. The local determinant/resultant identities and cube counts are intermediate targets, not substitutes for the unstatable headlines.

### Computed audit: README targets

In this table “consistent” means the displayed instances satisfy the statement; it does not claim that finitely many instances prove a general theorem. Numerical substitutions in height identities test normalization and cancellation; unless explicitly identified as a CM field, they are algebraic consistency tests, not asserted realizations of arbitrary height data. All field rows retain g≥1, characteristic zero and finite degree. Local rows retain the specified complete DVR, full lattice, separability and splitting hypotheses. All line references are to packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md.

| Target / line | Instances and computed values on both sides | Result / change |
| --- | --- | --- |
| Conventions / 17 | Square torus: integral volume 2; squared metrics 2, 1, 1/π. Heights differ by −log2/2 and +log(2π)/2. Arithmetic Artin unit 2 at 5 acts by 3, with 2·3=1 mod5. Base change: 2a/(2d)=a/d. | Consistent; applying the metric shift twice or using geometric Artin fails. |
| 0.1 / 164 | Quadratic overlaps (1,0); two factors (2,0). C₂×S₃ example: transposition overlaps (6,2,2), average 10/3; complements (0,4,4), average 8/3; total 6. C₆ values (0,1,1,0,−1,−1) have complementary sums 0 but f(r)=1≠−1=f(r⁻¹). Constant 1 has value 1 at c, overlaps 0. | Consistent; excludes unaveraged functions and uniqueness on the larger space. |
| 0.2 / 194 | For any overlap a, (ht+t ev_c)(a)=ht(a)+t·0=ht(a); on constant 1 the difference is t. For extension degree 2, both overlap and product height scale by 2. | Consistent restriction to H_CM. |
| 0.3 / 204 | d=1: (1+χ)/2 has values (1,0). d=2: 1+Indχ/2. d=3 at identity: (8·3)/6=4=2(1+3/3). Trivial-character log derivative contributes −d log(2π)/2. | Consistent; all 2^d types are necessary. |
| 0.4 / 214 | f(x,y)=x, g(x,y)=y: f(1,1)=g(1,1)=1, but f(1,0)=1≠0=g(1,0). The C₆ counterfunction has values 1,−1 on inverses and is excluded from H_CM. | Consistent; average equality does not assert the conjecture. |
| 1.1 / 248 | d=1: dim T=2 and scalar kernel μ₁=1. d=2: dim T=3 and diagonal −1 has norm (+1), giving μ₂. A single embedding vector has pair sums (1,0), whereas a type vector has (1,1). | Consistent. |
| 1.2 / 273 | d=1 integral units give K₀. For E=ℚ₃(√3), π=√3(1+√3) has valuation 1, but π²=12+6√3∉ℚ₃. Modulo both F× and units its square is 1. In an unramified quadratic field, unit valuation is 0 and base uniformizer valuation is 1. | R01: correct quotient in the order-two Check. |
| 1.3 / 297 | At maximal integral level inertia maps into K₀, so its action on the level coset is identity. A smaller cyclotomic level at 5 can retain inertia of order 4, hence ramification index 4 rather than 1. | Consistent distinction between maximal-level étaleness and smaller levels. |
| 1.4 / 307 | Elliptic lattice ℤ[i], pairing 2 times a principal Riemann form: elementary divisor 2, polarization degree 4. Identity family maps extend as identity; zero representation would fail faithfulness/polarized realization hypotheses. | Consistent; principal polarization is not imposed. |
| 1.5 / 317 | d=1: degree 2, dimension 1. E=ℚ(i,√2): two type orbits of size 2, algebra ℚ(i)×ℚ(√−2), dimension 2. d=3: degree 8, dimension 4. Replacing a positive ξ by −ξ reverses all selected signs. | Consistent; field-only and wrong-sign models excluded. |
| 1.6 / 342 | d=3 identity value: total-reflex type size 4 equals (1/6)·8·3. Using 1/8 instead gives 3, not 4. d=1 gives coefficient 1/2 on two identical heights. | Consistent. |
| 2.1 / 362 | Trivial rank-one representation: inertia 1, crystalline slope 0. Lubin–Tate unit 2 at 5 acts by 3 mod5, not 2; uniformizer acts by 1 on torsion. | Consistent inverse-Artin convention. |
| 2.2 / 372 | Trivial Kisin module S with φ=1: φ*M/u=W and φ*M/E(u)=O; both have rank 1. Rank zero produces zero specializations. A rank-one Tate twist changes its Frobenius valuation and cannot be replaced with φ=1. | Consistent; actual φ-pullback retained. |
| 2.3 / 382 | Identity tensor stays identity under tensor comparisons. For a symplectic basis with pairing 1, scalar 2 changes the pairing to 4; it is a similitude of factor 4, not an isometry of factor 1. | Consistent distinction; p-adic tensor compatibility remains the declared gap. |
| 2.4 / 392 | Elliptic homology has rank 2 and Hodge ranks (1,1); the homological and cohomological filtrations are dual, not identical. Zero representation gives zero bundle/crystal. At non-étale level the stated global étale-locus assertion cannot be invoked. | Consistent scope of the global assertion and local lattices. |
| 2.5 / 402 | [2] on an elliptic curve is integral of degree 4. The rational endomorphism 1/2 is a quasi-isogeny and is not in End(ℂ/ℤ[i]); identity has degree 1. | Consistent integral/rational distinction. |
| 2.6 / 412 | f₁(z)=z̄ gives f₁²=1. f_i(z)=i z̄ also squares to 1, whereas multiplication by i squares to −1. On the positive plane z=(1,i), B(z,z̄)=4. | Consistent semilinear quadratic norm and positive metric. |
| 2.7 / 436 | For ℚ(i) at split p=5, the two local rank-one pieces contain one Lubin–Tate factor and one complementary factor; ranks add to 2. At inert p=3 there is one quadratic local factor of ℚ₃-rank 2. | Consistent factorwise convention; no simultaneous local conjugation assumed. |
| 2.8 / 446 | CM elliptic reduction: split 5 has slopes (0,1); inert 3 has (1/2,1/2). The second is supersingular; the first is not. | Consistent nonsplit hypothesis. |
| 3.1 / 466 | d=1 determinant exponent 1; d=3 exponent 4. diag(π,1,1,1) has determinant π and cokernel length 1. Over k[ε]/ε², determinant ε is nonzero but annihilated by ε, hence not Cartier. | Consistent regular-base restriction; square-zero example excluded. |
| 3.2 / 491 | Empty or full part gives quotient 0, length 0. B=A×A split singleton partition also length 0. For ℤ₃[π], π²=3, singleton quotient C/(2π), length 1. | Consistent; detects the nonzero ramified quotient. |
| 3.3 / 515 | Same quadratic example: full discriminant valuation 2, half 1, within-part sums 0, cross sum 1. Thus 1=1−0−0; reversed sign gives −1. Unramified-separated factors have cross length 0. | Consistent corrected sign. |
| 3.4 / 525 | μ(1)=0; tame nontrivial quadratic μ(χ)=1. Infinite digit map sends 0↦0 and p^n↦(2p)^−(n+1), nonzero arbitrarily near 0; it does not factor through a finite quotient. | Consistent locally constant domain. |
| 3.5 / 549 | ℚ₃(√3): e_P=2, diagonal μ=1/2 for each embedding, off-diagonal μ=−1/2. Partition length (2/2)(1/2+1/2)=1. Empty partition gives 0. | Consistent positive conductor prefactor. |
| 3.6 / 559 | r=1 trace-one top class has absolute period 2π, not (2π)^−1; multiplying by u multiplies period by |σu|. With v=(1,i), conjugate w=(1,−i), the graded action has coefficient 2; ω norm 2 and volume metrics give determinant norm 1. For d=1 the degree term is 2log(2π). | Consistent trace normalization and dual volume line. |
| 3.7 / 569 | d=1: D_F=1, local different valuation 0, length 0. For E=ℚ(ζ₈), F=ℚ(√2), at the dyadic prime of E, v(2√2)=6; d=2 gives coefficient 1 and length 6. Restriction of type choices has fiber 2^(d−d_p). | Consistent normalization; transfer to the actual integral graded module is a target, not inferred solely from the count. |
| 3.8 / 579 | d=1 gives mean=degω₀/(4degY₀)−log(2π)/2 and degΔ=0. d=3 gives degΔ/degY₀=4logD_F. Substituting r=4 in the determinant relation and dividing by 8 gives coefficient 1/4 on degω₀. | Consistent factors 2d and 2^d. |
| 4.1 / 599 | d=1, ξ=−1: signature (0,2). d=2, ξ=√2: trace form 8(a₁a₂+b₁b₂), signature (2,2). Local goodness: valuation 0 gives unit ideal; valuation 1 does not. | Consistent trace over F and sign data. |
| 4.2 / 623 | Negative plane: z=(1,i), B=−4, norm²=4. f=0 gives divisor 0 and Green function 0. Stabilizer order 2 contributes 1/2; degree-two pullback multiplies numerator and denominator by 2. | Consistent positivity and stack weights. |
| 4.2a / 643 | Odd discriminant valuation 1 gives E_p=0; valuation 2 does not meet that clause. Dyadic self-dual rank≥7 gives n≥5 and E₂=0; n=3 does not meet it. c(0)=2 gives ω² and constant 2log(4πe^γ). | Consistent exact support clauses. |
| 4.2b / 663 | f=0: both sides 0/Λ(0)=0. Shadow 0 kills its derivative term; shadow≠0 need not. Degree-two level change: (2a)/(2d)=a/d. | Consistent nonzero Λ(0) and full shadow term. |
| 4.2c / 681 | f→2f gives (2E)/(2c·degY)=E/(c·degY). Gamma terms: −2(ℓ+logQ/2−d log(4πe^γ)/2)−d log(4πe^γ)=−2ℓ−logQ. Rank-one complement ⟨1⟩ has denominator vector 1/2 of norm 1/4; coefficient 1 there fails avoidance, coefficient 0 satisfies it. | Consistent rank-one case and denominator-coset condition. |
| 4.2d / 700 | Unramified quadratic E_v/ℚ_p, ξ=−p²: p^−1O_E has unit rescaled norm; proposed full lattice ξO_E=p²O_E has index p⁶ inside p^−1O_E. They differ. Degree-two level pullback preserves the normalized logD_F term. | Consistent rejection of the false full-lattice shortcut; filtered-line comparison remains a substantive target. |
| 4.3 / 710 | Formal values error=8,c=2,degY=1 give discrepancy 8/(4·2)=1. Scaling f by 2 gives 16/(4·4)=1. c=0 makes this quotient inadmissible. | Consistent factor 1/4. |
| 4.4 / 718 | In the everywhere finite-unramified branch, χ on all real signs gives (−1)^d=1, so d is even. d=2 requires χ(d_F)=−1; d=4 requires +1. For S=∅ there are no local avoidance conditions. | Consistent parity; precise narrow-norm statement remains the declared supplier gap. |
| 4.5 / 726 | a log2+b log3=0 with rational a,b gives 2^m3^n=1 after clearing denominators; valuations at 2,3 give m=n=0. Eliminating only the first coefficient would leave, for example, log3≠0. | Consistent need for each prime, nonzero c(0) and vertical support. |
| 4.6 / 736 | ℚ(i): D_E=4, ℓ(0)=−log4+2log(Γ(1/4)/Γ(3/4)); formula simplifies to −log(Γ(1/4)/Γ(3/4))−logπ/2 for either type. | R02 locator repair; the d≥2 argument is correctly excluded. |
| 5.1 / 754 | Identity isogeny has two local cokernel lengths 0, difference 0. Scalar [n] has matched component/dual lengths v(n), so difference 0; multiplying a period generator by u gives opposite dual scaling. | Consistent invariance mechanism; arbitrary non-CM partial heights excluded. |
| 5.2 / 764 | g=1 selected reflex orders have rank 1 and discriminants 1: correction −log1/(4·2)=0. For F=ℚ(√2), averaged correction is −log8/4. At p=2, ℚ(√17,√−7) gives ℤ₂⁴ with residue algebra 𝔽₂⁴; a single element has at most 2 residue values, so cannot generate it. | Consistent factorwise, not global, monogenicity. |
| 5.3 / 774 | g=1: (vertices,edges)=(2,1); g=2:(4,4); g=3:(8,12). Opposite square vertices have symmetric difference 4, not 2. Heights (a,b) yield (a+b)/2=(b+a)/2. | Consistent unordered convention. |
| 5.4 / 798 | Give every component height value 1: each type sum is g and each edge height is 1; 2^(1−g)·g2^(g−1)=g. For g=1 coefficient 1, discriminant correction 0. | Consistent factor two. |
| 6.1 / 818 | Unit different: both torsion groups 0 and graph 0. Graph of identity on a finite module has both projections bijective. A product kernel containing (a,0), a≠0, has noninjective second projection and fails the datum. | Consistent actual graph requirement. |
| 6.2 / 842 | For π²=3, π−π̄=2π, valuation 1; modulo the different π=π̄. For π²=2 over ℚ₂, v(2π)=3; equality modulo the different still holds, while replacing it by the uniformizer would lose two length units. | Consistent dyadic different and conjugation convention. |
| 6.3 / 852 | Graph of an isomorphism H→H has order |H| and projection kernels 0; product H×H has order |H|² and is not that graph. Unit-different case is the zero finite flat group, self-dual. | Consistent graph projections and degenerate case. |
| 6.4 / 862 | Component heights a,b give h_near=(a+b)/2; the determinant identity gives h(A,τ)=a+b, so h(A,τ)/2 agrees. Raw ramified quotient O/(2√3) has length 1 and is not a free rank-zero summand; at 2 the analogous length is 3. | Consistent conditional use of the declared relative/image determinant contract. |
| 6.5 / 870 | In the split presentation, generator (1−j)/(π−π̄) has projections ±1/(2π) for π²=3, giving the two length-one different-torsion modules. At division places E/F unramified gives δ=1 and kernel 0. | Consistent; arbitrary product isogenies do not qualify. |
| 7.1 / 890 | g=1, |S|=2: total ramification 3; g=2, |S|=1: total 3; g=3, |S|=0: total 3. Switching one real invariant leaves 2 in each case. | R03 missing Chebotarev edge. |
| 7.2 / 900 | z=i and 1+i give ‖dz‖=2. Field extension degree 2 gives 2a/(2d)=a/d; replacing relative degree d by absolute degree 2d halves the value when [F:ℚ]=2. | Consistent relative normalization; R05 replaces the non-instance Check. |
| 7.3 / 924 | Rank-two tensor twist: det(M⊗ℓ)=detM⊗ℓ²; the paired dual twist is ℓ^−2, product 1. Quaternionic tangent Hom rank 1 differs from unconstrained O_E-linear rank 2. | Consistent need for the constrained deformation problem and ramified bridge gap. |
| 7.4 / 932 | Substitute h_L=−ℓ+log(d_B/d_rel)/2: h_L/2−log(d_BD_F)/4=−ℓ/2−log(d_relD_F)/4. Coefficient of log d_B is 1/4−1/4=0. | Consistent auxiliary-prime cancellation. |
| 8.1 / 952 | Formal ℓ=0,d_rel=4,d_B=9 gives i₀/e=log(2/3). With e=2, i₀=2log(2/3), not log(2/3). | Consistent unit factor and quotient direction. |
| 8.3 / 960 | Same substitution: h_L=log(3/2)=−i₀/e. Reversing just one sign would give log(2/3), the wrong value. | Consistent adjunction sign. |
| 9.1 / 980 | Combining 7.4 and 8.3 gives −ℓ/2−log(D_E/D_F)/4, since d_relD_F=D_E/D_F; converting YZ once subtracts g log(2π)/2. g=1 reduces to row 4.6. | Consistent agreement of both normalizations. |
| 10.1 / 1000 | ℚ(i): h_E/h_F=1,D=4; ε=1/8 and test C=4^−1/8 give RHS lower bound 1. For ℚ(√−3), same C gives (3/4)^1/8<1=h_E/h_F. Degree six: regulator ratio 4/Q_E∈{2,4}, not 1. | Consistent samples; constants are uniform, not field-dependent. |
| 10.2 / 1010 | A=ℂ/ℤ[i], ideal (1+i): norm 2 and kernel order 2. B may be chosen isomorphic to A in class-number-one case; minimal isogeny degree then 1. Identity degree 1, [2] degree 4, zero map not finite. With ε=1/8 and test c=4^−1/8 the lower bound is 1. | Consistent; the universal quantifier is over actual isogenies and includes identity when A≅B. |
| 10.3 / 1026 | Heights (−1,3) have mean 1 and lower bound −1. Individual bound 2·1−(−1)=3 is attained; requiring a positive lower constant would fail. | Consistent signed lower bound and mean argument. |
| 11.1 / 1046 | g=1: 2·3⁴=162, 4·3⁸=26244. u=577+408√2≡1 mod3 but u≠1 and uū=u²≠1. For f=[2], g₀=id gives g₀f=[2] and unchanged pulled-back polarization. | Consistent polarized descent; unpolarized level is insufficient. |
| 11.2 / 1062 | Example exponent budget κ=2, δ=1/16, a=3/16, ε=1/32: 2δ=1/8<a and 2ε=1/16<a. Large D cannot satisfy D^a≲max(D^(κδ),D^(κε)); bounded D is absorbed by constants. | Consistent strict exponent choice. |
| 11.3 / 1072 | Maximal ℚ(i) point j=1728 has orbit 1 and D=4; lower bound requires c≤4^−δ, a positive permitted constant. | Consistent bounded-discriminant range. |
| 12.1 / 1092 | ℤ+2ℤ[i]: J=2,D=4·4=16. A simple B repeated n times has center E once. Coupled order {(a,b)∈ℤ[i]²:a≡b mod2} has J=4 and discriminant 4²·(4·4)=256 despite not decomposing as a product. | Consistent full-order identity and repeated factors. |
| 12.2 / 1116 | For class number 1 the reflex image has size 1. A norm cokernel of size at most 2 can reduce an image by at most factor 2, not arbitrarily. Marking fiber bound ≤2h and unit-norm obstruction ≤2^h are distinct factors. | Consistent comparison, rather than equality, of relative and absolute orbits. |
| 12.3 / 1126 | ℚ(i), conductor 3: order index J=3; local compact-unit index I=|𝔽₉×|/|𝔽₃×|=4; P=4. D=36, while I²P=64. At p=2, exp(2) is outside the usual scalar convergence disk; exp(4) is inside it. | Consistent inequality J versus I; equality would fail. |
| 12.4 / 1136 | With m primitive factors, max D_i≥P^(1/m), so a bound on the largest projection gives a positive power of P. If B=1/2 and #S=2 the loss is 1/4, not 1. I=P=1 is handled by a positive constant rather than log denominators. | Consistent retention and absorption of the bad-prime factor. |
| 12.5 / 1146 | Orbit lower bound O≥cD^δ inverts to D≤c^−1/δ O^1/δ. For O=1 this is a finite discriminant bound; conductor-2 ℚ(i) has D=16, not 4. | Consistent all-center-order formulation. |
| 13.1 / 1166 | g=1: complex degree≤2, real/imaginary degree≤4. g=2: bounds 24 and 48. For Z=i, entries have degrees 2,1,1. A sextic signed-permutation type can have joint type-field degree 8>6. | Consistent normal-closure bound, rather than 2g. |
| 13.2 / 1176 | I=mℤ[i]: index m², covolume m²; formula 2^−1√4·m²=m². For multiplier order R of index e_R, e_R O_EI⊂I gives [O_EI:I]≤e_R^(2g). | Consistent noninvertible-lattice treatment. |
| 13.3 / 1186 | Z=N+i: symplectic matrix [[1,−N],[0,1]] sends it to i, with largest entry N≤h₀(Z). Rank-one hermitian h_m on ℤ[i] has smallest Gram value m and trace discriminant 4m². | R04: specify the hermitian size/index bound independently of h₀. |
| 13.4 / 1196 | Z=i: real/imaginary absolute heights 1,1. Z=2i: imaginary height 2, polynomial X²+4 has coefficient height 4; scalar height and coefficient height are related by bounded-degree powers, not equality. | Consistent distinction between height conventions. |
| 13.5 / 1206 | At fixed N, D≤C_gN^b gives fixed coordinate-height bound and degrees≤2(2g)!. For g=1 this is degree≤4; for N=1 the bounds remain finite. Counting all parameters without selecting a fundamental lift would repeat a point infinitely often under Z→Z+n. | Consistent distinct-point conclusion. |

### Computed audit: Lean declarations and binder contexts

| Declaration | Full relevant context | Computed instance / probe | Result |
| --- | --- | --- | --- |
| Suggested.lean:49, relative_class_number_growth | Namespace TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocityPartII; universe u; g:ℕ, 0<g; ε:ℝ, 0<ε; ∃C>0 before ∀E:Type u; Field E, NumberField E, IsCMField E; finrank ℚ E=2g. RHS uses maximal orders and the actual maximalRealSubfield. | g=1, ε=1/8, E=ℚ(i): h_E/h_F=1, D=4. Test constant 4^−1/8 makes lower expression 1. E=ℚ(√−3) gives (3/4)^1/8<1. ε≥1/4 gives exponent≤0 and D^exponent≤1; g=0 excluded by 0<g. | No dropped binder, zero denominator, padding or README mismatch. Test constants illustrate these fields only, not a proof of uniformity. |
| Suggested.lean:71, distant_cm_isogenies | Same g, ε, universe and field context; ∃c>0 before E,A; A:AbelianVariety ℂ, dimA=(g:WithBot ℕ∞); ι:O_E≃+*End A; ∃B,κ; actual intertwining isogeny; every actual isogeny to that same B. Rank is evaluated at B.zeroPoint. | E=ℚ(i), A=B=ℂ/ℤ[i]: identity rank 1; [2] rank 4; zero map fails IsIsogeny. ε=1/8, test c=4^−1/8 gives lower expression 1. A product has a nontrivial idempotent in End⁰, so cannot have End⁰≅field E; the ring equivalence excludes this wrong model. | No dropped binder, free surrogate action or conclusion-containing hypothesis. Any second isogeny differs rationally by an element of E, hence intertwines the transported actions. |

### Source locator ledger

The line intervals below identify the portions inspected, not copied passages. They include the printed normalization corrections that the README explicitly makes.

| Targets | Source locations inspected |
| --- | --- |
| 0.1–0.4 | A lines 4984–5165, Definitions 9.1.1/9.1.3, Theorem 9.1.5, Conjecture 9.1.6, Proposition 9.3.1; C lines 227–337, component generators and Theorem 0.3. |
| 1.1–1.6 | A lines 998–1245, §§3.1–3.4; A lines 5067–5165, §§9.2–9.3. |
| 2.1–2.8 | A lines 1300–1710, Propositions 3.5.2–3.5.6 and §3.6. |
| 3.1–3.8 | A lines 5177–5645, §9.4, with the quadratic resultant and trace-volume tests above. |
| 4.1–4.2d | A lines 2487–2626, metric/divisor/Borcherds input; A lines 2793–2825, good-lattice definition; A lines 3023–3028, completed equation; A lines 3382–3479, shadow and arithmetic degree; A lines 4927–5010, proper intersection and Hodge degree; A lines 5648–5715, auxiliary data and narrow norms. |
| 4.3–4.6 | A lines 5642–5840, Proposition 9.5.1 and prime elimination; A lines 25–80, quadratic remark; C lines 339–370, actual quadratic period/height passage. |
| 5.1–5.4 | Y lines 464–720, component invariance, discriminant decomposition and nearby averaging. |
| 6.1–6.5 | YE lines 1–429, complete author erratum, with its graph hypothesis and local Kisin/determinant arguments. |
| 7.1–7.4 | Y lines 120–241, setup and Theorem 1.6; Y lines 1800–1826, Proposition 5.7; YE lines 33–110, actual graph application. |
| 8.1–9.1 | Y lines 241–260 and 4217–4241, height and modified intersection; adjunction supplied by GrossZagierAndArithmeticHeights §7.78; Y lines 97–118 and A Theorem A, average normalization. |
| 10.1–11.3 | T lines 116–249, class-number/isogeny/height and polarized descent argument; native regulator ratio retained. |
| 12.1–12.5 | T lines 250–327; T12 lines 595–850, §§7.1–7.2, compact-index and general orbit arguments. |
| 13.1–13.5 | PT lines 80–385, §3; PT14 lines 642–757, Conjecture 7.1 and Lemma 7.4; T lines 327–370, degree/height discussion; MZ lines 1437–1444, §5.4. |

## Not verifiable

- No Lean build or new elaboration was run. The supplied elaborated signatures were inspected and compared; this is not an independent compilation claim.
- The full proofs of all quoted analytic, integral-model, comparison and arithmetic-intersection results were not re-proved. The table separates finite counterexample tests and normalization checks from the deep existence/comparison targets. In particular the integral total-reflex graded-module identification and the corrected orthogonal filtered-line comparison require their own proofs; the scalar checks do not establish them.
- The eight announced supplier gaps are not implemented in the inspected supplier versions. Acceptance of consumers remains conditional on those exact contracts, with R04 requiring a more precise hermitian clause. The declared absolute-Hodge p-adic comparison is not silently supplied by the existing Betti comparison.
- The 2022 author erratum and the 2023 journal erratum were not collated. PT and T12 were checked in the manifest's named arXiv versions, not the published pagination. No claimed journal correction is inferred from preprint text.
- C is an OCR extraction. The theorem/section labels and the quadratic discussion can be identified, but the badly extracted displayed gamma-product formula was not independently typeset or numerically evaluated from the scan. R02 points to that primary passage without claiming that OCR alone certifies every symbol.
- Ownership searching was performed against the supplied heads and the tool's available index; no unavailable open-PR checkout was fetched. A negative text search is not a proof that no differently phrased target exists elsewhere.

## Source issues

- **Error** in A at §3.1, p. 415 (A lines 1015–1016): the source says the diagonal scalar map embeds G_m into T; it should be the norm-identified kernel G_m, while the diagonal has kernel μ_d; affects a stated result.
- **Error** in A at §3.2, pp. 416–417 (A lines 1079–1097): the source says the integral level is maximal compact and uses separate local norm quotients; it should be the compact subgroup above the integral-unit image, with the product norm obstruction; affects the proof.
- **Misprint** in A at Proposition 3.5.2, p. 422 (A line 1311): the source says the crystalline fiber uses an undefined lattice Λ; it should be the fixed representation lattice N_p and its fiber; affects nothing.
- **Misprint** in A at Proposition 3.5.5(5), p. 425 (A line 1424): the source says the geometric crystalline fiber uses Witt vectors of the finite residue field; it should be Witt vectors of the geometric residue field; affects a stated result.
- **Misprint** in A at Proposition 3.6.1, p. 430 (A line 1606): the source says a place of F is nonsplit in F; it should be nonsplit in E/F; affects nothing.
- **Misprint** in A at the paragraph following (8.3.1), p. 508 (A line 4987): the source says the odd error primes satisfy nondivisibility by p² and names the original lattice; it should be possible divisibility by p² for the enlarged lattice, as in Theorem 4.8.1; affects the proof.
- **Error** in A at Theorem 9.1.5, p. 510 (A line 5073): the source says total overlap heights uniquely determine the functional on all CM⁰; it should be uniqueness on their span, or additional component-period values on the full space; affects a stated result.
- **Error** in A at the standard Hodge-line metric, p. 514 (A line 5218): the source says a negative bilinear value defines the standard positive-plane squared norm; it should be the positive absolute bilinear value; affects the proof.
- **Error** in A at Lemma 9.4.3, p. 516 (A lines 5312–5336): the source says an arbitrary integral generator has fixed inverse-power period; it should be trace-one period of absolute value (2π)^r, with the archimedean unit factor for other generators; affects the proof.
- **Error** in A at Lemma 9.4.4 and (9.4.6), pp. 517–518 (A lines 5358–5378): the source says within-part valuations minus half the discriminant give the quotient length; it should be half the discriminant minus within-part sums, with the corresponding corrected kernel-image computation; affects the proof.
- **Error** in A at the conductor functional, p. 518 (A line 5411): the source says finite-image characters span all continuous class functions; it should be locally constant class functions, factoring through finite quotients; affects a stated result.
- **Error** in A at Proposition 9.4.5 and (9.4.13), pp. 519, 522 (A lines 5446, 5613): the source says a negative conductor prefactor gives the partition and reflex lengths; it should be the positive prefactor e_P/2; affects the proof.
- **Error** in A at (9.5.3), p. 523 (A line 5670): the source says the full auxiliary lattice equals the displayed scalar multiple of the standard lattice; it should be a proved comparison of filtered Hodge-line indices, retaining the different and actual integral lattices; affects the proof.
- **Misprint** in A at Proposition 9.5.2, p. 524 (A lines 5696–5697): the source says the auxiliary quadratic form uses the trace from E of an F-valued norm expression; it should be the trace from F, without the extra factor two; affects the proof.
- **Error** in Y at the proof of Theorem 2.2, p. 546 (Y lines 551–552): the source says one local conjugation exchanges all paired embeddings; it should be a pairing in the sum over embeddings, since a split local decomposition group cannot perform that exchange; affects the proof.
- **Error** in Y at the proof of Theorem 2.3, p. 547 (Y line 610): the source says the whole algebra O_E⊗ℤ_p admits one integral generator; it should be factorwise monogenicity after unramified decomposition, since 𝔽₂⁴ is not monogenic over 𝔽₂; affects the proof.
- **Error** in Y at Theorem 2.7, pp. 549–551 (compared with YE lines 1–49): the source says the nearby-height identity applies to an arbitrary O_E-isogenous variety; it should be restricted to the different-torsion graph situation, with the determinant comparison proved for that kernel; affects a stated result.
- **Misprint** in YE at Proposition 4, pp. 6–7 (YE lines 206–244): the source says the semilinear Frobenius preserves the displayed embedding labels without relabeling; it should be the Frobenius-permuted embedding on the source factor; affects the proof.
- **Error** in YE at the contraction step, p. 7 (YE line 253): the source says n≥e_v suffices for the stated divisibility; it should be at least n≥max(2,e_v) in the ramified-quadratic e_v=1 case, where the first power has valuation 1<2; affects the proof.
- **Gap** in YE at Proposition 6, pp. 9–10 (YE lines 365–369): the source says raw embedding quotients preserve the required exact locally free determinant sequence; it should be a relative/image determinant argument accounting for ramified torsion such as O/(2√p); affects the proof.
- **Misprint** in YE at the proof of the graph application, p. 11 (YE line 402): the source says the second torsion factor is cut out by π; it should be cut out by δπ as in the preceding graph construction; affects the proof.
- **Misprint** in T at §2.2, p. 382 (T line 133): the source says the CM and maximal-real regulators are equal; it should be R_E/R_F=2^(g−1)/Q_E, with Q_E∈{1,2}; affects nothing.
- **Error** in T at Corollary 3.3, p. 384 (T line 213): the source says the uniform lower height constant is positive; it should be a real constant, since stable CM elliptic heights can be negative in this normalization; affects a stated result.
- **Gap** in T at the proof of Corollary 3.3, p. 384 (T lines 231–235): the source says Cauchy's estimate applies to the indicated Artin function on a fixed circle; it should be justified through the quadratic Hecke/regularized endpoint argument, without assuming general Artin holomorphy; affects the proof.
- **Gap** in T at Lemma 4.1, p. 384 (T lines 245–246): the source says full level-three torsion rigidifies the unpolarized CM object; it should be polarized rigidification, since nontrivial units congruent to 1 modulo 3 remain unpolarized automorphisms; affects the proof.
- **Gap** in T at §5, p. 386 (T lines 311–315): the source says the absolute unmarked moduli degree equals the relative marked class-group orbit; it should be bounded-factor comparisons accounting for reflex fields, markings and polarizations; affects the proof.
- **Gap** in T at §6.2, p. 387 (T lines 327–365): the source says CM period coordinates fit the degree-2g counting setup; it should be a proved normal-closure degree bound, also accounting for adjoining i for real and imaginary parts; affects the proof.
- **Error** in T12 at §7.2, preprint p. 18 (T12 line 731): the source says the center-order discriminant uses the square of the compact subgroup index; it should be the square of the order index, with a separate inequality comparing the indices; affects a stated result.
- **Misprint** in PT at Lemma 3.3, preprint p. 4 (PT line 146): the source says the complex lattice covolume uses the field discriminant without its square root; it should be 2^−g√D_E times the lattice index in ordinary Lebesgue measure; affects the proof.
- **Misprint** in PT at the symplectic reduction step, preprint p. 7 (PT line 268): the source says the reduction matrix belongs to Sp₄ in the general-dimensional argument; it should be Sp₂g; affects nothing.
- **Misprint** in PT at the isotypic endomorphism algebra, preprint p. 8 (PT line 296): the source says the matrix size is the simple factor's dimension; it should be its isotypic multiplicity n_i; affects the proof.
- **Gap** in PT at Lemma 3.6 and its proof, preprint p. 8 (PT lines 325–339): the source says the decomposition-isogeny degree depends only on the maximal-algebra discriminant; it should be a bound retaining the order index e_R and hence dependence on disc R; affects the proof.
- **Gap** in PT14 at Lemma 7.4, p. 675 (PT14 line 756): the source says the final scalar degree bound is at most 2g; it should be justified with a splitting-field bound and the extra i-extension for real and imaginary coordinates; affects the proof.
- **Misprint** in A at (9.5.1), p. 523 (A line 5652): the source says unnormalized arithmetic degrees differ by the fixed scalar log D_F; it should be degrees divided by their common weighted complex degree; affects the proof.
- **Misprint** in Y at the paragraph following Lemma 9.4, p. 633 (Y lines 4666–4668): the source says the level projection is étale while its CM fiber has multiplicity e; it should be a section construction retaining the ramification index, since étaleness would force multiplicity one; affects the proof.
- **Misprint** in T12 at §7.1, preprint p. 15 (T12 line 638): the source says the type stabilizer inside Gal(L/ℚ) is Gal(K/ℚ); it should be Gal(L/K), with the normal closure L; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "6e5cf0054e09ad1f9b9d7bee5bb26dcaa4e8474a", "job": "RT-ComplexMultiplicationAndExplicitReciprocityPartII~1a", "model": "gpt-6-astra", "worker": "chris-38"} -->
