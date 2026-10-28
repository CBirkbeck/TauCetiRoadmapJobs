<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1597#issuecomment-6398095566 -->
Review (codex) of 4a10c97

Verdict: needs_changes

1. **F01** (P1) Odd-primary Frobenius coefficients have incompatible signs

   **Location:** `packages/StableHomotopyKTheoryPartII/README.md:762`, also lines 133, 743, 766, 773–774, 781, 802 and 1022. Quoted claim: “Σ_(i≥0)P^i(x)t^((p−1)i)+Σ_(i≥0)βP^i(x)t^((p−1)i)e”.

   **Claim:** With the stated coefficient generators and Koszul convention, this is the multiplicative, all-degree Tate-valued Frobenius; the coefficient splitting in §6.3 has unsigned reduced-power components.

   **Witness:** At p=3 on BC₃×BC₃, take degree-one x,z and y=βx,w=βz. The displayed formula gives coefficient +1 on yze in F(xz), but coefficient −1=2 in F(x)F(z).

   Indeed positive reduced powers of x,z and xz vanish by instability. The two computations are

   - F(xz)=xz+(yz−xw)e;
   - F(x)F(z)=(x+ye)(z+we)=xz+(xw−yz)e.

   The monomials yze and xwe are nonzero and independent. This contradicts multiplicativity of the E∞ Frobenius in §§4.1 and 5.6, using precisely the Bockstein and tensor signs fixed at lines 23 and 69. It is not a missing finiteness assumption.

   There is also a scalar error in the even coefficient, detectable without an odd class. At p=3 let v be the degree-two complex-line class and let u=βb generate H²(BC₃;𝔽₃). The equivariant Euler calculation gives

   - the power numerator v(v+u)(v+2u)=v³−vu²;
   - the reduced regular Euler denominator u·2u=−u²;
   - after Tate suspension, v−v³u⁻², whereas line 773 gives v+v³t².

   Changing a degree −2 generator by a nonzero 𝔽₃ scalar cannot change its square. Thus rescaling t does not repair the even discrepancy. Independently, §1.1 does not fully normalize t,e: replacing both by their negatives preserves t⁻¹e, the degrees and all three stated Checks, but reverses the odd coefficient.

   **Exact repair:** Fix b as the chosen positive H¹ generator, put u=βb, and specify t=u⁻¹ and e=b/u; in particular βe=1. With coefficient factors written on the right and x homogeneous of degree n, replace the odd-prime formula by

   `F(x) = Σ_i (-1)^i P^i(x)t^((p-1)i) + (-1)^n Σ_i (-1)^i βP^i(x)t^((p-1)i)e`.

   This follows from the Euler-normalized expansion in bmms86, VIII.2, Proposition 2.4(vi), printed p.259, bmms86 line 4481, and its χ=m!u^m, ω=m!bu^(m−1) convention on printed p.260, bmms86 line 4501, where m=(p−1)/2. Dividing the power by its leading suspension coefficient gives (−1)^(mi)χ^(−2i); Wilson's identity (m!)²=(−1)^(m+1) makes this (−1)^i t^((p−1)i). The odd term additionally has (−1)^n.

   Update §6.3 and all the listed examples to use this coefficient formula. In the monomial splitting the even stable components are (−1)^iP^i, and (−1)^iP^i∘r for HZ. Specify the suspension convention for the odd projections explicitly: their right-e coefficients in degree n are (−1)^(n+i)βP^i. If using an additive splitting with literal unsigned stable operations instead, define its sign changes and distinguish it from the monomial splitting of §6.1. Do not claim that this changed splitting preserves the displayed coefficient algebra generators.

   **Repair tested:** The corrected formula gives F(x)=x−ye, F(z)=z−we and F(xz)=xz+(yz−xw)e, so the products agree. It gives F(v)=v−v³t², agreeing with the independent Euler quotient. Its degree-zero component sends 1 to 1. At p=2 the original square formula remains unchanged. Add both p=3 computations as negative-control Checks and a βe=1 normalization Check. The unsigned formula printed in ns18 line 5170 is itself erroneous under this graded convention; citing it alone cannot resolve the contradiction.

2. **F02** (P2) The sphere fixpoint counterexample already has an earlier owner

   **Location:** `packages/StableHomotopyKTheoryPartII/README.md:881`, and `packages/StableHomotopyKTheoryPartII/Suggested.lean:40`. Quoted claim: “Give S the trivial C_(p²)-action. Then (S^(hC_p))^(t(C_(p²)/C_p))≃S_p^∧≠0.”

   **Claim:** §7.4 presents this result with its own proof route as a theorem to build in this roadmap, and the Lean docstring includes it among this roadmap's headlines.

   **Witness:** `TauCetiRoadmap/RefinedTraceMethods/README.md:575`, at head 9dd2691, already states the identical sphere equivalence in §2.3, with trivial C_(p²)-action and the same residual quotient and source example.

   RefinedTraceMethods precedes this roadmap in the merge order. The local addition of explicit residual-action wording does not create a different theorem: it is the residual action in the supplier's displayed expression. This is a small ownership overclaim, not grounds to reject the entire Part II roadmap.

   **Exact repair:** Delete §7.4 as an owned theorem/proof target. Record RefinedTraceMethods §2.3 as the owner in Scope and ownership and consume this exact counterexample in its supplier contract. Retain the p=2 and p=3 computations as applications/Checks of that import in the Layer 7 examples. Remove the sphere counterexample from the list of locally owned headline theorems in the module docstring; retain the distinct KU orbit and tensor-diagonal counterexamples. Adjust numbering and local references consistently, without an upward dependency.

   **Repair tested:** The supplier gives the same π₀=ℤ₂ and ℤ₃ and mod-p quotients 𝔽₂ and 𝔽₃. No mathematical assertion or boundedness test is lost by importing it.

3. **F03** (P3) The negative permutation twist Check loses the factor p

   **Location:** `packages/StableHomotopyKTheoryPartII/README.md:641`. Quoted claim: “At X=* and n=−1, restricting to the trivial subgroup gives π₁R on each side, rather than π₋₁R.”

   **Claim:** Restricting −ρ to the trivial group behaves like a virtual line of rank −1.

   **Witness:** For p=2 and R=ΣHℤ, the actual group is [S²,ΣHℤ]=π₂(ΣHℤ)=0; the claimed π₁(ΣHℤ) is ℤ.

   **Exact repair:** Replace π₁R by π_pR, and π₋₁R by π_(−p)R, because ρ has dimension p. Add p=2,R=ΣHℤ as the negative control and p=2,R=Σ²Hℤ as a nonzero control. Keep the rank −1 Check in §5.1: that Check concerns an actual rank −1 virtual bundle and is correct.

   **Repair tested:** For those two R, both sides of the corrected adjunction have groups 0 and ℤ respectively. The statement of the Thom adjunction at line 632 is sound; this finding concerns its Check.

4. **F04** (P3) Theorem 5.9 starts on printed page 902

   **Location:** `packages/StableHomotopyKTheoryPartII/README.md:285`, repeated at line 291. Quoted locator: “§5.2, Theorem 5.9, p.903”.

   **Claim:** The statement of LNR Theorem 5.9 is on printed page 903.

   **Witness:** lnr12 line 1964 starts Theorem 5.9 on printed p.902; the next printed page marker, at line 1973, is p.903 and begins its proof.

   **Exact repair:** Cite “Theorem 5.9 and proof, pp.902–903” at both occurrences. The broader reference entry and existing manifest range already cover both pages and need no replacement.

   **Repair tested:** The revised range contains the bounded-below, degreewise finite-type hypotheses, both continuous-cohomology/homology comparisons and their proof. The theorem number and mathematical use are correct.

Four findings: one P1, one P2 and two P3; two are blocking. The Part II scope is appropriate and repairable. The principal mathematical defect is the odd-primary coefficient formula, including a source error that the package inherited. No package input was edited during this review.

## Verified sound

Read the whole package: 38 numbered target blocks in eight layers, all 120 target Checks, all ten construction API lists, the conventions, supplier contracts, proof routes, worked examples, metadata, manifest and Lean companion. There was no earlier review to rely on. The evidence below distinguishes successful computations from the four defects; this section is not an assertion that the defective passages are sound.

The roadmap extends StableHomotopyKTheory's stable foundations instead of replacing them. It retains all primes, arbitrary small vector-space dimension, individually bounded-below tower stages without a uniform lower bound, and integer virtual ranks. It does not replace the general bounded-below Segal theorem by a finite-type special case. No computational algorithm, copied source passage, sorry'd data, set_option, foreign roadmap import or empty Prop stand-in was found. Each layer has Examples and Dependencies, and each target has its own Needs line. All ten constructions have an API list and at least three Checks. GeneralizedCohomology, BordismFormalGroups and EnhancedDerivedSheaves on main were read to compare the roadmap shape. The false Check and duplicated theorem are recorded above.

The following table records computed values. Hᶜ denotes the specified continuous cohomology; a lower degree means the lowest potentially nonzero homotopy degree. A value on a deliberately excluded input is a negative control, not an extension of the theorem. Statements with multiple clauses were also compared with their source hypotheses and imported interfaces in the tables below.

| Statement | Instances tried | Values on the two sides / competing models | Result and change |
|---|---|---|---|
| Conventions and imported extended powers | k=0,1; G=S₃,k=3; suspensions 1,2 | D₀(0)=S versus D_k(0)=0 for k>0; D₁(S)=S; π₀D_(S₃)(S)=ℤ=π₀Σ∞₊BS₃. Swap degrees are −1 and +1, not both +1. | Correct; nonabelian and empty-tensor controls included. |
| Imported operations and Adams conventions | u∈H¹(RP∞); v∈H²(CP∞),p=3; B=H𝔽_p | Sq¹u=u², Sq²u=0; P¹v=v³ in degree 6, P²v=0; Ext(A_p,𝔽_p) is 𝔽_p in (0,0), zero otherwise, matching π_*H𝔽_p. | Correct. β(xz)=yz−xw is the R01 sign witness. |
| 1.1 cyclic coefficients | p=2,3; a=−1 at p=3; simultaneous negative rescaling | At p=3, weights(t,t²,e,t⁻¹e)=(−1,1,1,−1), degrees=(−2,−4,−1,1). Hℤ Tate has (π₀,π₁)=(𝔽₂,0), H𝔽₂ Tate has (𝔽₂,𝔽₂). The rescaled pair has the same stated values but opposite βe. | Rings, degrees and weights correct; complete normalization as R01. |
| 2.1 continuous cohomology | constant H𝔽₂; zero; Singer sphere tower | Constant tower: Hᶜ=A₂=H*(H𝔽₂). Zero: 0=0. Singer sphere: degree −1 of Hᶜ is 𝔽₂, while H⁻¹(S₂^∧;𝔽₂)=0. | Correct; tower dependence is real. |
| 2.2 inverse-limit Adams | constant H𝔽_p; zero; Singer sphere n=0,1,2 | E₂^(0,0)=𝔽_p=π₀ of limit completion; zero tower gives 0=0. Singer lower degrees at p=2 are 1,0,−1, so no single lower bound. Differential (r,r−1) changes stem by −1. | Correct hypotheses and convergence route. |
| 2.3 Singer functor and augmentation | M=0,𝔽_p; r=0,−1; p=2,3 | R₊0=0. ε(Σx⁻¹)=1 at 2 and ε(Σxy⁻¹)=1 at 3, both degree 0. Sq¹(x⁻¹)=binom(−1,1)=1 mod 2; β(xy⁻¹)=1 and β(y^r)=0. A coefficientwise trivial action gives 0 instead of 1. | Correct, including integer binomial and augmentation signs. |
| 2.4 Tor-equivalence | M=0,𝔽_p; target N=𝔽_p,Σ⁻¹𝔽_p | Zero gives zero Tor on both sides. For M=N=𝔽_p, degree-zero Hom dimensions are 1 and 1, and ε sends unit to unit. Suspending N by −1 shifts the corresponding scalar class by −1 on both sides. | Correct; finite-type/boundedness belongs to N in the Ext statement, not arbitrary M in Tor. |
| 2.5 Singer approximation | B=0,S; p=2,3; n=0,1,2 | Zero stages=0. At n=0, U₀(S)=ΣΣ∞₊BC_p, bottom degree 1. Bottom degrees 1−n(p−1): (1,0,−1) at 2 and (1,−1,−3) at 3. Greenlees indices give the same triples. | Correct; filtration index is not a suspension of Tate. |
| 2.6 continuous Singer comparison | B=0,S; p=2,3 | Zero gives 0=0. Unit classes Σx⁻¹ and Σxy⁻¹ each have degree 0 and augment to 1; omitting Σ gives degree −1. | Correct mathematical statement; R04 locator. |
| 2.7 finite-type Segal | B=S,H𝔽_p,Hℚ; p=2,3 | Target π₀ respectively ℤ_p,𝔽_p,0, equal to completed-source π₀; negative groups for S vanish. Hℚ source π₀=ℚ but both completion and target=0. | Correct; the diagonal is completion, not generally an equivalence before completion. |
| 3.1 finite pro-constant towers | constant ∅ and {a,b}; {a,b}←{a}←{a}; binary-prefix tower | Limit/image sizes are (0,0), (2,2), (1,1). In the third tower stage-0 size is 2 but stable image size 1. Binary-prefix limit has size 2^ℵ₀ and stage-n size 2^n; two different sequences project to the same prefix. | Correct, including empty limit and nonsurjective maps; infinite-limit control excludes injectivity. |
| 3.2 truncated tensor Tate | X=0,H𝔽_p,H𝔽_p⊕H𝔽_p; n<0 | Negative truncations of the connective tensor are 0, hence Tate=0. For two summands, p=2 has 2 diagonal words and one free orbit of 2 mixed words; p=3 has 2 diagonal words and two free orbits of 3 words. Mixed Tate contributions=0. | Correct; uniform upper truncation is what permits arbitrary sums. |
| 3.3 arbitrary-dimensional case | dimensions 0,1,2,κ uncountable | π₀ dimensions on source and target: 0=0,1=1,2=2,κ=κ; other homotopy groups=0. For infinite J, a function constantly 1 belongs to the product but not the direct sum; it is not an extra target class. | Correct; stabilization indices are inherited from the one-dimensional tower. |
| 3.4 bounded-below Segal | S,Σ⁻¹H𝔽_p; unbounded KU at 2 | π₀=S case ℤ_p on both completed sides; Σ⁻¹H𝔽_p has exactly π₋₁=𝔽_p on both. KU₂^∧/2 has π₋₂=𝔽₂ but T₂(KU)/2 has 0. | Correct generality and negative control. |
| 4.1 Weyl refinement | p=2,3; S; S[ℕ] | W orders 1,2; inverse of 2 mod 3 is 2. Sphere unit maps 1→1. At p=2, monoid generator z maps z², while identity would give z. | Correct; averaging denominator is a unit. |
| 4.2 underlying-space factorization | 0; Hℤ,p=2,class 2; S unit | Zero gives a point→point. Pre-Tate power gives 4, while an additive map with unit 1 would give 2; after Tate both reduce to 0. Sphere unit gives 1=1, not p. | Correct space-level, not spectrum-level, factorization. |
| 4.3 norm splitting | X=0,H𝔽₂,p=2 | Zero gives 0⊕0=0. At degree 0, kernel and quotient have order 2, but middle group is ℤ/4: twice a chosen lift of 1 is the nonzero transfer. A group splitting would give ℤ/2⊕ℤ/2. | Correct restriction of additive splitting to i≥1. |
| 4.4 degree-zero power | Hℤ,p=2; H𝔽₃; zero ring | P₂(1+1)=4 versus P₂(1)+P₂(1)=2; transfer defect=2. Over 𝔽₃, 2³=2. Zero ring has unique value 0=1. | Correct set operation, multiplicative and unital. |
| 4.5 transfer ideal | Hℤ,p=2,3,5; H𝔽_p | Transfer indices are {2},{3,3},{5,10,10,5}; gcds 2,3,5. Over 𝔽_p each is 0. At p=5,2⁵−2=30 is 0 mod 5 but 30 mod 120. | Correct ideal (p), not (p!); prime-order intersection argument works. |
| 4.6 degree-zero comparison | Hℤ,p=2; H(𝔽₃[z]); X=∅ | Two routes send 2→4 mod 2=0; send z→z³, with z³−z≠0. Empty X gives zero cohomology and the sole value 0 on both routes. | Correct. |
| 4.7 ordinary/finite complete examples | A=ℤ,ℚ,0,𝔽₄; sphere p-inversion | At p=3,2→2; ℚ/pℚ=0 and 0/p0=0. In 𝔽₄, a²=a+1≠a. Completed p-inversion colimit=0, while colim π₀Maps(S_p^∧,S_p^∧)=ℚ_p. | Correct; finite dualizable argument avoids the source's compactness mistake. |
| 4.8 spherical Witt vectors | d=1; p=2,d=2; zero-degree/non-field control | Rank 1 gives sphere and F=id. For 𝔽₄, rank=2, F([a])=[a+1], F²([a])=[a]. Zero ring is not a degree d≥1 finite field. Marked π₀ fixes the otherwise possible Frobenius automorphism of the lift. | Correct, conditional on the declared integral étale contract. |
| 5.1 virtual twists | V=0,−1; Möbius versus trivial line; ρ₂ | Rank 0 gives R⁰(X); point/rank −1 gives π₁R. On S¹ integral sign cochains have differential 2 and H¹=ℤ/2, versus differential 0 and ℤ for trivial coefficients. Swap degree for ρ₂ is −1, for 2ρ₂ is +1. | Correct; rank alone is insufficient. |
| 5.2 Thom adjunction | n=0,−1; p=2; R=ΣHℤ,Σ²Hℤ | n=0 gives maps out of Σ∞₊(X×BΣ_p) on both sides. Restricted n=−1 gives π₂R, with values 0 and ℤ for the two R, whereas π₁R gives ℤ and 0. | Theorem correct; R03 fixes the Check. |
| 5.3 all-degree powers | n=0,1,−1; p=2,3 | Zero maps to 0, degree-zero unit to 1. Twist ranks are 0,p,−p; −ρ⊕ρ has rank 0. At p=2 the n=1 swap has degree −1, unlike a trivial rank-2 twist. | Correct; no additive or orientability claim. |
| 5.4 Tate suspension | n=0,±1; p=2,R=H𝔽₂ | n=0 is identity. At n=1 each π_i on both Tate sides is 𝔽₂. Composing n=1 and −1 has shift 0; using +ρ twice would have underlying rank 4. | Correct; comparison shifts by n, not np. |
| 5.5 extended-power Thom | X=*,V=0,1,−1; p=2 | V=0 gives Σ∞₊BΣ₂ on both sides. V=1 gives inverse bundle rank −2 and determinant −1 on both; trivial rank −2 would give +1. V=−1 gives +ρ, rank 2, on both. | Correct for virtual, including negative, bundles. |
| 5.6 all-degree Frobenius | n=0,Hℤ,p=2; n=1,u∈H¹(RP∞); n=−1 | Both routes give 0 from 2 mod 2; give u+u²s with degrees 1 and 2−1=1; inverse-twist cancellation gives rank 0. | Coordinate-free comparison correct; R01 corrects later coordinate extraction. |
| 6.1 EM product decompositions | p=2,3; Hℤ versus H𝔽_p | At p=3 invariant suspension degrees are 0,1,4,5,8,9,… and negative counterparts, not 0,1,2,3,… . Each π_i has at most one contributing factor; sum→product is 𝔽_p→𝔽_p or 0→0. Integral p=2 has π₁=0. | Correct factor 2 and products. Specify coefficient normalization as R01. |
| 6.2 total ordinary operation | p=2,u; p=3,x,z,v | At 2: u+u²s. At 3: yze coefficients 1 versus 2 in the two multiplicative routes; Euler quotient for v is v−v³t² versus claimed v+v³t². | Fails; R01. |
| 6.3 stable Frobenius components | unit; p=3, integral/mod-3 CP∞ class; mod-2 u | Unit components 1=1. At p=3 the degree-4 component evaluates to −v³=2v³ under monomial normalization versus claimed v³; reduction from HZ has the same discrepancy. At 2 Sq¹u=u² on both descriptions. | Fails in the stated normalization; R01. |
| 7.1 Atiyah cyclic power | virtual ranks 0,1,2,−1; p=2 | Values 0,1,3·1+sign,sign. At rank 2, dimension=4 and transposition trace=2; at virtual rank −1, trace=−1, not +1. | Correct virtual-complex and Koszul convention. |
| 7.2 periodic KU Tate | p=2,r=1,2; p=3; x=0 | Even ℚ₂-dimensions 1 and 1+2=3, odd=0. At 3 cyclotomic degree=2, invariant degree=1. Correct p-series at x=0 is 0; (x−1)³−1 gives −2. | Correct coefficient calculation and correction of source sign. |
| 7.3 KU Adams comparison | H=1+β on S²; β and β⁻¹; p=2,3 | (1+β)^p=1+pβ since β²=0. Images (pβ,β⁻¹/p) multiply to 1; omitting denominator gives p. At p=2 the virtual −1 character is −1 on both routes. | Correct localized target, Bott direction and compact-space hypothesis. |
| 7.4 sphere fixpoint counterexample | p=2,3; zero spectrum | Iterated Tate π₀=ℤ₂ or ℤ₃, mod-p quotient=𝔽₂ or 𝔽₃; zero input gives 0. Supplier gives exactly these same values. | Mathematics correct; R02 ownership repair. |
| 7.5 KU orbit counterexample | p=2,3; Hℚ | Comparison has even dimensions 3→1 at 2 and 8→2 at 3; differences 2 and 6. For Hℚ both Tate sides=0. | Correct; residual quotient action is retained. |
| 7.6 unbounded tensor Segal | KU at 2 in degrees −2,0,2; sphere | KU₂^∧/2 gives (𝔽₂,𝔽₂,𝔽₂), rational tensor Tate/2 gives (0,0,0). Sphere target π₀=ℤ₂, so it is not rational. | Correct use of height-one descent, not a claim about every Tate spectrum. |
| 8.1 free-loop totalization | Y=*,S²,S¹,∨_κS²; n=1,2 | Point: S=S. S² fibers have bottom pairs (1,3),(2,4); the same holds for any κ. S¹ first bottom degree n−n=0 at both stages. | Correct simply connected hypothesis and no finite-type restriction. |
| 8.2 controlled Tate/limit comparison | constant tower; fibers ΣⁿH𝔽_p; trivial G | Constant comparison fibers=0. Orbit fibers of ΣⁿH𝔽_p have π_i=0 for i<n; at i=0,n≥1 the error is 0. For trivial G, norm=id and Tate=0 on both sides. | Correct finite-group and increasing-connectivity argument. |
| 8.3 free-loop Segal | Y=*; Y=S² and ∨_κS²; n=0,1,2 | Point Frobenius target π₀=ℤ_p. At C_p genuine fixed sphere π₀ is ℤ² whereas homotopy-fixed π₀ is ℤ⊕ℤ_p; after p-completion both are ℤ_p². n=0 comparison=id; n=1,2 use one and two restriction steps. Growing bounds remain (1,3),(2,4). | Correct p-adic, not integral, genuine comparison. |

The domains exclude p=1 and nonprime p, nonfinite group averaging and cardinalities outside the fixed universe. No DVR, ramification, quotient of ideals or geometric Frobenius convention is silently introduced. The possible denominators are units for stated reasons: t and Euler classes in the Tate localization, p in the localized KU target, and p−1 on p-primary coefficients. The zero ring, empty space/set, zero module/spectrum, negative degree, nonabelian symmetric group and excluded unbounded spectrum tests are included above. No additional false iff or set equality was found.

**Source sample.** All 15 requested sampled targets were checked against the cached legal texts. There were zero author-flagged unverified locators. All 11 cited works have one existing certified manifest entry; no source needed fetching, no entry was changed, and no missing-reference request was necessary. The BMMS scan was also inspected visually at the crucial coefficient formula; the NS printed pages were inspected to distinguish real mathematical errors from extraction artifacts. In particular the indices in Theorem IV.1.15 include zero: a lost equality bar in text extraction is not a source error.

| Sampled target | Text and exact locator read | Hypotheses, direction and outcome |
|---|---|---|
| 1.1 | ns18 line 596, I.1 p.218; ns18 line 5098, IV.1 p.332 | Trivial coefficient action; cohomological grading; inverse conjugation action on H¹. Laurent/exterior rings and weights agree. The additional normalization needed to identify operations is R01. |
| 2.3 | lnr12 line 641, Definition 3.1 and (3.1)–(3.3), pp.875–876 | Both prime cases, all integer Laurent indices, suspension, Bockstein and the two signed odd augmentation terms agree. This is an arbitrary graded module construction, not an instability assumption. |
| 2.4 | agm85 line 68 and line 90, Proposition 1.2 and Theorem 1.3, p.436; agm85 line 236 and line 285, Lemmas 2.1–2.2; lnr12 line 722, Proposition 3.3/Theorem 3.4/Corollary 3.5, pp.876–877 | Arbitrary M in Tor; bounded-below degreewise finite N in Ext. The right/left free bimodule and coinvariant proof supplies the algebraic route, without assuming the Segal conclusion. |
| 2.5 | lnr12 line 1148, Definition 4.3, p.885; line 1181, Lemma 4.4; line 1233, Lemma 4.5; line 1255, Lemma 4.6, pp.886–887; line 1935, Proposition 5.7, p.902 | Genuine Tate filtration and derived replacements give stage 1−(p−1)n and Σ^(n+1)D_Cp(Σ⁻ⁿB). Bounded-below finite-type hypotheses ensure each stage is finite type; no common lower bound is asserted. |
| 2.6 | lnr12 line 1646 and line 1684, Lemma 5.1/Theorem 5.2, pp.896–898; line 1964, Theorem 5.9, pp.902–903; line 2002, Definition 5.10; line 2021, Lemma 5.11; line 2038, Proposition 5.12, pp.903–905 | The continuous-cohomology isomorphism and augmentation direction agree. The proof identifies the map by unit, suspension and representing cohomology classes before using Segal. R04 corrects the theorem's starting page. |
| 2.7 | lnr12 line 2109 and line 2122, Theorem 5.13 and proof, pp.905–906 | Bounded below and degreewise finite over 𝔽_p; p-adic equivalence. Target p-completeness is separately supplied by the bounded-below Tate theorem. |
| 4.2 | ns18 line 4920, Lemma IV.1.7 and proof, p.327 | All spectra; Ω∞ factorization. Source uses comparison on underlying spaces and does not manufacture an additive spectrum-level lift. |
| 4.8 | ns18 line 4858, Example IV.1.2(ii), p.325 | Finite-field spherical Witt example and Frobenius uniqueness are present. Degree d=1 is the sphere example immediately preceding it. The integral finite-étale/endomorphism input is honestly a separate declared contract; the package avoids the source's categorical compactness claim. |
| 5.1 | ns18 line 5256, Lemma IV.1.19 and proof, pp.336–338; line 5370, virtual-bundle discussion, p.339 | Parametrized spheres and their inverses define the virtual Thom object over arbitrary spaces. No global finite-rank complement or orientation is required. |
| 5.2 | ns18 line 5256, Lemma IV.1.19, pp.336–338 | Left adjoint defines the negative Thom object; right adjoint gives homotopy fixed points of S^(nρ)⊗R. The integer n and the permutation representation are retained. R03 concerns the roadmap's Check, not this source statement. |
| 5.3 | ns18 line 5189, equation (12), pp.333–334; line 5256 and line 5338, Lemmas IV.1.19–IV.1.20 | The Ω∞ construction has source ΣⁿR and equivariant target S^(nρ)⊗R; applies for n∈ℤ, natural as an operation of sets. |
| 5.5 | ns18 line 5338, Lemma IV.1.20 and proof, pp.338–339 | Extended powers commute with the Thom colimit; pullback along X×BΣ_p→D_pX gives nρ. The virtual-bundle form is included in the proof. |
| 6.1 | ns18 line 5098, displays on p.332 | The source coefficient degrees imply even period 2(p−1). The roadmap correctly repairs the factor 2 missing in the source's displayed splittings. Degreewise finite support justifies sum→product, not a general tensor/cohomology interchange. |
| 6.3 | ns18 line 5132, Theorem IV.1.15, pp.332–333; line 5155, Proposition IV.1.16; line 5412, proof, p.340; bmms86 line 4481 and line 4501, VIII.2 pp.259–260 | Source has both the degree misprint and a coefficient normalization error. The package fixes the degree but inherits the latter. The primary power expansion and computed R01 witnesses refute the unsigned monomial formula. |
| 7.4 | ns18 line 618, Example I.2.3(i), p.219, through line 635 | Trivial C_(p²) action on S, coherent residual quotient action, and equivalence to S_p^∧ all match. Mathematics verified; earlier ownership is R02. |

Beyond the sample, the compact inverse-limit argument of lnr12 Proposition 2.2 (lnr12 line 265 through line 391) was read, including the limit-exactness and complete-convergence steps. The arbitrary-dimensional argument was checked at ns18 line 3305 through line 3348, including the finite-set lemma at line 3331. The KU comparison was checked at ns18 line 5002 and bmms86 line 4664. The arbitrary-space extension in §8.1 is supported by malkiewich17 line 609 through line 626, Proposition 2.22, preprint pp.14–15: the displayed fiber terms have growing connectivity independently of finite type. Kuhn alone would only supply the finite-complex comparison in Theorem 6.6 (kuhn04 line 625, preprint p.16). The totalization/Tate step and the free-loop conclusion are in ns18 line 5978 through line 6007, pp.354–355. The 2019 correction was read; it does not correct the sign and grading errors recorded here.

**Pinned library audit.** The checkouts match `lake-manifest.json`: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Searches were by the objects and operations (Tate cohomology/norms, Eilenberg–MacLane and stable spectra, Steenrod operations, extended powers, Thom objects, completion, finite inverse systems, Witt Frobenius), not just prospective declaration names.

| Declaration opened at the pin | File and line | What the actual type/body supplies |
|---|---|---|
| CategoryTheory.Functor.sections | `Mathlib/CategoryTheory/Types/Basic.lean:222` | Body: `{ u \| ∀ {j j'} (f : j ⟶ j'), F.map f (u j) = u j' }`. Neither finiteness nor nonemptiness is part of this definition. |
| nonempty_sections_of_finite_cofiltered_system | `Mathlib/CategoryTheory/CofilteredSystem.lean:79` | Cofiltered category and finite, nonempty stages; cannot prove the empty-limit case by pretending these hypotheses hold. |
| CategoryTheory.Functor.eventualRange | `Mathlib/CategoryTheory/CofilteredSystem.lean:125` | Intersection of transition ranges. At {a,b}←{a}, eventual range is {a}, not the whole first stage. |
| isMittagLeffler_of_exists_finite_range | `Mathlib/CategoryTheory/CofilteredSystem.lean:230` | Finite-range criterion supplies stabilization; the package consumes it rather than redefining it. |
| toEventualRangesSectionsEquiv; surjective_toEventualRanges | `Mathlib/CategoryTheory/CofilteredSystem.lean:255` and `:262` | Section equivalence and surjectivity for the Mittag–Leffler eventual-range system. These are the correct inputs for nonsurjective original towers. |
| eval_section_surjective_of_surjective; eventually_injective | `Mathlib/CategoryTheory/CofilteredSystem.lean:312` and `:323` | The section includes finite nonempty stages and explicitly includes the transition-surjectivity binder. The second theorem also requires nonempty J and finite sections. The README preserves these restrictions. |
| frobenius | `Mathlib/Algebra/CharP/Lemmas.lean:321` | Ring homomorphism on a commutative semiring in exponential characteristic p, with body x↦x^p. This is consumed, not re-owned by §4.7. |
| WittVector.frobenius | `Mathlib/RingTheory/WittVector/Frobenius.lean:218` | Prime p and a commutative coefficient ring; genuine Witt endomorphism, not a general identity map. |
| WittVector.coeff_frobenius_charP; WittVector.frobenius_zmodp | `Mathlib/RingTheory/WittVector/Frobenius.lean:255` and `:275` | Coefficientwise pth power requires CharP; identity specializes to ZMod p. The 𝔽₄ value a↦a+1 distinguishes the wider finite-field case. |
| Tate cohomology functor | `Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean:140` | Type is `Rep R G ⥤ ModuleCat R`, indexed by ℤ. It supplies algebraic Tate cohomology, not a spectrum with a coherent finite-group action or the tensor Tate diagonal. |
| TopPair.HomologyPretheory | `Mathlib/AlgebraicTopology/EilenbergSteenrod.lean:36` | Bundles relative/absolute homology functors and boundary transformations. It is not an Eilenberg–MacLane spectrum or the stable Steenrod algebra. |
| HasPairSequence, IsAdditive, HasDimensionAxiom | `TauCeti/AlgebraicTopology/EilenbergSteenrod.lean:65`, `:85`, `:94` | Additional axioms on that ordinary homology pretheory; no stable spectral carrier, KU, spectral Tate or representation-sphere category. |

No pinned declaration supplies the headline spectral carriers. The existing finite-system and Witt operations are correctly imported by exact names. The new finite-tower statement assembles eventual images, finite limit and the empty case into a pro-isomorphism; it does not restate a single native theorem. No collision of a fully qualified Lean declaration is possible here: Suggested.lean declares none.

**Supplier resolution and ownership.** The main snapshot was 35c9f96. `roadmaps list`, object searches with `roadmaps grep`, and `roadmaps show` were used for the indexed open heads as well as the direct main files. The board package index was read first. All 20 indexed board heads were searched: five supplied package READMEs and fifteen supplied design READMEs at their specified heads where package READMEs were absent. No absence finding was inferred from the single local board checkout. Searches included Singer, Segal, cyclic Tate, permutation/representation spheres, Steenrod, spherical Witt, virtual Thom, KU Adams and free-loop totalization.

The resolved suppliers are below. Paths refer to the roadmap files, not cached tool wrappers; line numbers exclude the tool's extra header line. Where a roadmap has an open progress/revision branch, its main version was used instead of treating that revision as a dependency.

| Supplier and snapshot | Resolved sections, file/line evidence | Contract actually found / ownership conclusion |
|---|---|---|
| StableHomotopyKTheory, new-roadmap head 00bfbf7 | `TauCetiRoadmap/StableHomotopyKTheory/README.md:1835`, Layer 5; `:2333`, §7.9; `:2401`, §§7.14–7.19; `:2474`, §§7.21–7.26 | Spectra/smash/EM/connectivity, Milnor comparison, completion/detection/rationalization and complete spectral-sequence convergence. The extension begins after these foundations. |
| GeneralizedCohomology, main | `TauCetiRoadmap/GeneralizedCohomology/README.md:432`, G2.8; `:785`, G3.8; `:878`, G3.9; `:1214`, G4.2; `:1536`, G5.3; `:1559`, G5.4 | Extended powers, spectral limits, function-spectrum completion, Thom objects and ku/KU. The local Singer tower and virtual power comparison add specific theorems, not another definition of the supplied ordinary carriers. |
| TangentialBordism, new-roadmap head bf9da30 | `TauCetiRoadmap/TangentialBordism/README.md:537`, B4; items 2 at `:564`, 7 at `:628`, 8 at `:652` | Full Steenrod algebra, mod-2 and odd-prime operations and Adams convergence. Read the odd-prime item, not merely the mod-2 item. Coproduct, top-power and Bockstein signs are compatible until the local error R01. |
| BordismFormalGroups, main | `TauCetiRoadmap/BordismFormalGroups/README.md:555`, F6.1; `:1002` and `:1064`, F6.3; `:1526`, F6.5; `:2508`, finite-height descent | Localization, finite Hopf pieces and freeness, finite-action norm/Tate, coherent Kan and induced vanishing. Height-one raw Tate is E(0)-local, hence rational; §7.6 does not infer rationality from K(1)-acyclicity alone. |
| KTheoryFiniteLocalFields, new-roadmap head afe02e8 | `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:604`, §4.0; `:666`, §4.4; `:705`, §4.5 | Genuine cyclic models, modern comparison and algebraic EM Tate/cup/resolution machinery. The differential alternates 0 and p integrally and becomes 0 mod p. Its connecting-map sign is retained; it does not fix the additional t,e scalar normalization in R01. |
| AInfCohomology, new-roadmap head b47987b | `TauCetiRoadmap/AInfCohomology/README.md:3817` and `:3849`, AI.7.2 | Circle actions/Tate orbit and unit-normalized exact lax monoidal Tate diagonal. Its sphere Segal Check is a consequence to be justified by the Singer theorem; it is not used as an input to the local finite-type proof. |
| RefinedTraceMethods, new-roadmap head 9dd2691 | `TauCetiRoadmap/RefinedTraceMethods/README.md:553`, §2.3; `:579`, §2.4; §§2.5–2.6,2.8 at `:795`; §2.10 at `:870`; §§2.11–2.13,2.16 at `:1034`, `:1218` | Postnikov bounds/p-completeness, parametrized spectra, cyclic realization, THH Frobenius, spherical-loop model and genuine/restriction interfaces all exist. It also explicitly owns the sphere counterexample at `:575`, giving R02. |
| RefinedTraceMethods, same head | `TauCetiRoadmap/RefinedTraceMethods/README.md:2372`, §5.1; `:2450`, §5.3; `:2478`, §6.1 | Snaith and localized stable Adams, orientation inputs, spectral étale lifting. §5.3 does not supply the full KU cyclic coefficient-field computation of local §7.2. The missing finite-field integral input is declared as a gap, not falsely attributed to §6.1. |
| EnhancedDerivedSheaves, main | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1117`, E3; `:1436`, E5:abstract | Coherent diagram/relative Kan and monoidal formalism. Absolute Kan foundations are imported there from BordismFormalGroups F6.5; the particular parametrized spectral adjunction also appears in RefinedTraceMethods §2.4. No unowned adjunction is needed. |
| AlgebraicTopology, main | `TauCetiRoadmap/AlgebraicTopology/README.md:946`, Stage 6 | Ordinary cochains, cup products and relative comparisons on the shared ordinary-cohomology model. No spectral Steenrod construction is attributed to these ordinary functors alone. |
| TopologicalKTheory, new-roadmap head 7575afa | `TauCetiRoadmap/TopologicalKTheory/README.md:702`, T2.5; `:816`, T4; `:886`, T5 | Bundle λ/Adams operations, splitting and Bott orientation on finite CW inputs. The β↦pβ direction agrees with the chosen line class; stable index inversion is supplied by RefinedTraceMethods. |

The main and open-head object searches found no earlier owner for the Singer functor, its topological cohomology comparison, the arbitrary-cardinality Segal extension or the free-loop Segal theorem beyond the cited inputs. HabiroCohomologyFoundationsPartII §0.1 (`TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md:145`) concerns more general spherical lifts of perfect δ-ring data. It is later in the merge order (224 versus this roadmap's 218). The finite étale specialization here is the earlier case and must remain owned here; a later general extension may consume it. There is no upward import of that roadmap. The cyclic KU fields and the twist-sensitive comparisons are additional results, not restatements of the supplied Bott, Thom or ordinary Steenrod constructions. The sole repeated owned target found is R02.

Every Needs line and supplier citation was read, including the end-of-layer summaries. The mechanical dependency check was run with the prescribed configuration, package README, name, order and `--movable`. Its complete output was:

    depcheck: 51 roadmaps, 585 edges, 0 problem(s)

Exit status 0; no UPWARD, CYCLE or moved line. `roadmaps resolve` reported no unresolved roadmap citations or backticked Lean names. Its warning that external library names were not checked was addressed by opening the actual pinned declarations above. The internal build route is acyclic: Singer Tor and continuous cohomology precede finite-type Segal; truncation and pro-constancy precede arbitrary-dimensional Segal; twisted powers precede coefficient extraction; free-loop connectivity precedes interchange with Tate. Later-theorem references inside diagnostic Checks are not proof inputs.

**Declared gap.** `gap:finite-field-witt-etale-frobenius` is identical in slug, supplier, section and mathematical content between `packages/StableHomotopyKTheoryPartII/design/plan.json` and the exact supplier contract at `packages/StableHomotopyKTheoryPartII/README.md:105`. It specifies every prime, a finite field of degree d≥1, finite étaleness and rank d over ℤ_p, and the endomorphism/reduction identification carrying Witt Frobenius to pth power. These are one coherent finite étale lifting contract, with all hypotheses stated. Native Witt Frobenius supplies neither the integral finite étale classification nor the endomorphism bijection. The other inspected Witt suppliers did not already supply this complete contract. It is precise, owned and minimal for §4.8; its present absence in RefinedTraceMethods is not a finding. Any later acceptance remains conditional on this contract. No `conditional_gaps` field is used with this needs_changes verdict.

**Headlines, elaboration and padding.** The README's deep/end theorems match the 14 groups named in the module docstring, as follows. R02 changes ownership of one member; R01 changes the stated coordinate formula, not the fact that its spectral carrier is missing.

| README headline | Docstring line in Suggested.lean | Missing native carrier at the pins |
|---|---|---|
| §2.4 Singer augmentation Tor-equivalence | 10 | Stable Steenrod algebra, graded modules and twisted Singer functor |
| §2.2 inverse-limit Adams theorem | 13 | Spectrum category, Adams tower and continuous spectral cohomology |
| §2.6 continuous Singer comparison and augmentation | 16 | Spectral cyclic extended powers and Singer module |
| §2.7 finite-type Segal | 19 | Coherent tensor action, spectral Tate and spectral p-completion |
| §3.4 all bounded-below Segal | 22 | Same carriers and spectral boundedness/completion |
| §4.1 unique Weyl refinement | 25 | Lax monoidal spectral diagonal and coherent normalizer action |
| §5.6 all-integer-degree power comparison | 27 | E∞ spectra, representation-sphere twists and represented cohomology |
| §4.8 finite-field spherical Witt Frobenius | 30 | Connective sphere algebra and spectral étale lifting |
| §6.3 total Steenrod description | 34 | EM spectra, spectral Tate and stable operations |
| §7.3 KU Frobenius/Adams | 37 | KU spectrum and localized stable Adams maps |
| §§7.4–7.6 boundedness counterexamples | 40 | Spectral Tate/residual actions, KU and spectral localization; import the first member per R02 |
| §8.1 free-loop totalization | 43 | Suspension spectra and derived spectral totalization |
| §8.2 controlled Tate/limit comparison | 46 | Coherent-action spectra, norm and connectivity |
| §8.3 free-loop Segal and genuine comparisons | 49 | THH, genuine cyclic spectra and spectral p-completion |

`lake env lean` was run on the actual package Suggested.lean from the prescribed content checkout. It exited 0 with no warnings. The file is 60 lines, contains the single `import Mathlib`, one explanatory module docstring and the correct namespace, and has no declarations. Thus there are zero declarations to check with `#check @name`, zero section binders to lose and zero sorried theorems to try with the one-tactic probe. No such probe was fabricated, and no padding is present. The absence of signatures is justified by the native-carrier audit, not by the difficulty of proving the theorems. The finite-set argument and ordinary Witt formulas are supporting results already assigned appropriately in the README; turning them into surrogate headline signatures would be padding.

## Not verifiable

- No requested source locator was unreadable or inaccessible. The passages supporting the sampled statements were read, and the crucial ambiguous scanned coefficient formula was checked visually.
- The finite-field Witt étale/endomorphism contract remains future supplier work, explicitly declared as `gap:finite-field-witt-etale-frobenius`. Its fulfillment was not asserted or inferred from the source example.
- The spectral headlines cannot be elaborated as native-carrier theorem signatures at these pins, for the concrete reasons in the headline table. The empty acceptance file elaborates; this supplies no proof of the README's mathematics.

## Source issues

- **Misprint** in ns18 at IV.1, decompositions before Theorem IV.1.15, printed p.332 (ns18 line 5120 and line 5126): the source says odd-prime invariant summands have period p−1 in suspension degree; it should be period 2(p−1), as forced by the degree −2 Laurent generator; affects a stated result.
- **Misprint** in ns18 at Theorem IV.1.15, printed pp.332–333 (ns18 line 5136 and line 5140): the source says P^i and βP^i have target shifts i(p−1) and i(p−1)+1; it should be 2i(p−1) and 2i(p−1)+1; affects a stated result.
- **Error** in ns18 at Proposition IV.1.16 and its proof, printed pp.333,340 (ns18 line 5167 and line 5431): the source says the monomial-coefficient total reduced-power and Bockstein formula is unsigned; it should be Euler-normalized with the (−1)^i scalars and the degree-dependent right-coefficient Bockstein sign; affects a stated result.
- **Error** in ns18 at Example IV.1.2(ii), printed p.325 (ns18 line 4852): the source says the p-complete sphere is an example of categorical compactness in p-complete spectra; it should be treated as finite dualizable there; its p-inversion diagram disproves categorical compactness; affects the proof.
- **Misprint** in ns18 at Example I.2.3(iii), printed p.220 (ns18 line 649 and line 660): the source says the multiplicative p^r-series is (x−1)^(p^r)−1; it should be (1+x)^(p^r)−1 in the coordinate x=L−1, vanishing at x=0; affects a stated result.
- **Error** in ns18 at the paragraph following Theorem IV.1.21, printed p.340 (ns18 line 5405): the source says the pre-Tate all-degree power is a graded-ring map; it should be multiplicative with an additive transfer defect, becoming additive after the appropriate transfer quotient or Tate comparison; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4a10c9753db1edc8911ec6e719c6428f461ec083", "job": "REV-PKG-StableHomotopyKTheoryPartII", "model": "gpt-6-astra", "worker": "chris-8"} -->
