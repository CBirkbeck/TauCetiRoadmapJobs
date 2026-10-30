# Review of QSeriesPartitionsAndMockModularForms (pull request #1391 at e68263d)

**Verdict:** needs changes

## R01 (P1) — The displayed level-11 basis does not span S

**Location:** `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md:737`, §4.8a: “the expansion of every element of S in the basis with its finitely many coefficients.”

**Claim:** The preceding level-11 basis supplies finite expansions for every modular function holomorphic on ℍ and meromorphic at the two cusps.

**Witness:** The constant function 1 belongs to S. Every displayed gₙ has strictly positive order at infinity, so every finite linear combination has constant coefficient 0, whereas 1 has constant coefficient 1.

The preceding Gₙ family alone also cannot repair this: its elements vanish at cusp 0. Atkin1967 Lemma 4, printed p. 17, lines 112–116 supplies the full expansion using both families, a constant, and B. B has simple poles at both cusps (Lemma 3, lines 105–106). Lemma 5, lines 118–121 restricts the gₙ expansion to the subspace vanishing at infinity. Those are different spaces.

**Exact repair:** Name S∞ and S₀ as the subspaces vanishing at the respective cusps and state their appropriate basis theorems. State the full S expansion with 1, B, Gₙ and gₙ, including B's normalization and existence, as in Lemmas 3–4; use the S∞ theorem for X₁₁ and Y₁₁. Do not restrict the general S trace/principal-part statements to conceal the missing basis elements.

**Retest:** In the repaired full expansion, 1 has constant coordinate 1 and all other coordinates 0. In S∞ it is excluded because its value at infinity is 1. The constant-function trace Check still gives 1+11=12.

## R02 (P3) — Cite the supplier's actual power-law target

**Location:** `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md:109`, also line 13: “`weight_laplacian_power` gives Δ_k(yˢ)=s(1−k−s)yˢ”.

**Claim:** This is the name of a supplied declaration.

**Witness:** AutomorphicSpectralTheory §1.16 states the result in its “Powers” API bullet, but neither that README nor its Suggested.lean contains the declaration name `weight_laplacian_power`.

**Exact repair:** Cite “AutomorphicSpectralTheory §1.16, Powers” in prose instead of assigning this nonexistent declaration name. Likewise describe its Laplacian definition by that section unless citing an actual declaration. The mathematical prerequisite is present, so this is a locator issue, not an unowned prerequisite or a request for a supplier gap.

**Retest:** The cited Powers bullet gives precisely s(1−k−s)yˢ for complex s and y>0. At k=0, s=2 it gives −2y², agreeing with this roadmap.

## Verified sound

This review read both complete target files, the repository's normative Writing a roadmap checklist and CONTRIBUTING.md, the supplied gate and citation leads, and the named supplier contracts. It compared the shape with ThetaSeries, ModularForms and the completed ContourIntegration roadmap. The worktree head is the requested head; the diff outside the reviewed folder is empty. No source passage, computational implementation, sorry-defined data, forbidden option, duplicate roadmap carrier or route-specific restriction was identified in the target files.

There are **2 findings: 1 P1 and 1 P3; 1 blocking finding**. The mathematics below records tests, not proofs of the proposed theorems. Exact arithmetic, formal coefficients and symbolic substitutions are distinguished from approximate evaluations of convergent sums.

**Gate and dependency audit.** The worker's head-specific gate reports:

| Check group | Result |
| --- | --- |
| set_option, blob, latex, tex, prnum, sorry-data, sorry-examples | all 0 |
| residue, private-paths, imports, mathlib-subimports, no-import-mathlib | all 0 |
| lean-lines, forbidden, dropped, readme-ids-missing, empty-sections | all 0 |
| round-labels, long-fences, layer-ids, target-ids, depcheck, metadata | all 0 |
| stray-files, dirty, outside-folder, source-material, build | all 0; OK |

I independently ran the specified dependency check with `--depcheck`, `--name QSeriesPartitionsAndMockModularForms`, `--movable`, the supplied order and main-content repository. **Exit status: 0. Standard output and standard error: empty.** Thus its output contains no UPWARD, CYCLE or moved line. I read the Needs lines in addition to this mechanical check.

**Sources: all 15 seeded targets.** No additional locator explicitly marked unverified was found in the README. The following compares statements, hypotheses and printed numbering against the supplied legal text extractions. A derived extension is identified as such; it is not attributed verbatim to the source.

| Sampled target | Text read and outcome |
| --- | --- |
| 1.5 inversion for two unit parameters | Gasper1995 (1.3.10), p. 6, lines 313–323. The finite inverse-base formula agrees. The arbitrary-ring/unit and negative-index formulations are algebraic extensions with explicit factor-unit domains, not assertions that the source already treats arbitrary rings. |
| 3.4 quintuple product | Gasper1995 (2.2.10), p. 11, lines 605–610. The exponents, plus sign in 1+zqⁿ and five products agree after the stated parameter change. The punctured q-disc and z≠0 are retained. |
| 4.1 native partition rank and crank | AndrewsGarvan1988, pp. 167–169, lines 10–16 and 80–88. Largest part minus number of parts, and the strict count of parts greater than the number of ones, agree. The empty partition is an explicit extension. Native multiset and conjugation were checked separately at the pin. |
| 5.2 eta multiplier | Zwegers2002 Theorem 1.11(2) and its proof, pp. 15–17, lines 734–805. The eta quotient and cubic multiplier agree. The square-root-cover equivalence is a declared supplier contract, not something proved by this source locator. |
| 5.3 smoothing kernel | Zwegers2002 Definition 1.6 and Lemma 1.7, p. 11, lines 485–505; tail estimate at lines 547–567. E, β and their normalizations agree. Real erf is consumed at the pin; the entire extension and sharper bound remain targets. |
| 5.4 Mordell integral | Zwegers2002 Definition 1.1 and Proposition 1.2, pp. 6–7, lines 217–320. Integral, two shift defects, evenness and S transformation agree, with Im τ>0. |
| 5.7 completed Lerch function | Zwegers2002 Theorem 1.11, pp. 15–17, lines 734–812. The pole exclusions and full elliptic/modular laws agree. Zagier2009 §2, printed pp. 986–06–07, lines 287–339 confirms θ_Z=−iθ and μ_Z=iμ, hence μHat_Z=iμHat. |
| 8.7 specified mock completions | Zagier2009 §5, pp. 986–12–14, lines 640–735; BruinierFunke2003 (3.2), p. 9, lines 423–438. The roadmap keeps a specified correction/completion and does not assume injectivity after forgetting it. Its k≠1 Fourier use and distinct k=1 constant mode are explicit. |
| 9.2 meromorphic Jacobi data | Zwegers2002 §3.1, p. 49, lines 2660–2668, and Theorem 3.9 at line 3101. Transformation laws and positive integral index agree. Meromorphicity in the elliptic variable is not silently replaced by holomorphy in both variables. |
| 9.3 mixed real-analytic residues | Zwegers2002 Definition 3.8, pp. 56–57, lines 3082–3099. The v⁻¹ bar(v)⁰ coefficient is the intended residue. Affine-coordinate compatibility is an additional algebraic target. |
| 9.5 meromorphic Jacobi decomposition | Zwegers2002 Theorem 3.9 and proof, pp. 57–59, lines 3101–3238; coefficient transformation at lines 2691–2696. Arbitrary finite pole orders, corrected coefficients and weight k−1/2 agree. No general harmonicity is inferred. |
| 10.1a bilateral bridges | Zagier2009 proof of Theorem 7.1, p. 986–17, lines 937–945 gives the rank bilateral identity. BringmannOno2006 (2.1), p. 5, lines 270–278 defines ω. The ω bilateral bridge is explicitly a target derived from q-calculus, not falsely described as (2.1) itself. |
| 10.2 third-order completed vector | BringmannOno2006 (2.2)–(2.5), Theorem 2.1, pp. 5–6, lines 270–337. Entry order, factors 2, T exchange, S sign and correction normalization agree. |
| 10.5 fifth-order correction vectors | Zwegers2002 §4.4, pp. 74–80, lines 4329–4414 and 4770–4856. Both six-component correction vectors, characteristic arguments and coefficients agree. |
| 10.6 fifth-order transformations | Zwegers2002 Propositions 4.10, 4.13 and 4.14, pp. 75–83, lines 4415–4456, 4857–4883 and 5029–5052. The unequal √2 factors in the first S block, the second vector's law and cancellation of corrections agree. |

**Adversarial mathematics.** In this table Pₙ denotes the finite product, P the infinite product, and q-series coefficients are listed starting with the constant coefficient unless indicated. “Keep” means no change required by that test; it does not certify the general theorem by numerical sampling. Complex sums/products were truncated in their rapidly convergent domains; Mordell integrals used numerical quadrature. Values marked ≈ are diagnostic values, without an interval-arithmetic error certificate. All other listed finite values and coefficient identities are exact. The **115 test rows** cover every target subsection, the sampled targets and the Lean headlines; API and convention tests are included with the object to which they belong.

| Statement / object | Instances tried | Computed sides or competing values | Result / change |
| --- | --- | --- | --- |
| Conventions: starting index, units, q=1 | n=0,2; arbitrary ring; q=1 | P₀=1; P₂=1−a−aq+a²q; at q=1 both sides=(1−a)²; zero ring 1=0 | Keep; analytic q=1 excluded |
| 1.2 integer product | a=3,q=2,n=−1 | P₋₁=−2; P₁(3/2;2)=−1/2; product=1 | Keep |
| 1.2 invalid negative domain | a=q=2,n=−1 | factor 1−a/q=0; inverse product cannot equal 1 over ℚ | Excluded by unit hypothesis |
| 1.3 regular quotient | a=3,b=1,q=2,n=−1; then b=2 | quotient=(1−2)/(3−2)=−1; at b=2 quotient=0 although separate denominator P₋₁(b;q) is undefined | Keep regular quotient |
| 1.4 full formal product | generic a through X²; a=1 | coefficients 1−a, −a(1−a), −a(1−a); at a=1 all zero | Keep index-zero factor |
| 1.4 positive tail / scalar change | a=1; ℤ→𝔽₂ | tail=1−X−X²+O(X⁵); image=1+X+X²+O(X⁵); constant=1 | Keep; unit survives |
| 1.5 inversion | a=3,q=2,n=2 and n=−1 | P₂=10; (−3)²·2·P₂(1/3;1/2)=10; negative formula gives −2 on both sides | Keep |
| 1.6 prefix and tail | n=0,1; a=0; a=1 | P(a;q)=P₁(a;q)P(aq;q); a=0 gives 1=1·1; a=1 gives 0=0·P(q;q) | Keep nonzero-tail condition when dividing |
| 2.1 unilateral normalization | no parameters, n=1; q=1/2 | coefficient −1/(1−q)=−2; deleting normalized sign gives +2 | Keep |
| 2.1 numerator parameter | one a, n=1 | coefficient (1−a)/(1−q); at a=1 it is 0 | Keep termination |
| 2.2 bilateral normalization | j=0,−1; a=3,b=1,q=2,z=1 | term₀=1; term₋₁=−1 on regular quotient; a=q produces zero denominator | Keep pole exclusions |
| 2.3 radius and terminating exceptions | q=2,a=−1/2; a=1/2 | asymptotic coefficient ratio 1/4, radius 4; a=1/2 series terminates at 1−z/2 | Keep distinction |
| 2.3 q=0 unilateral convention | nonterminating r=s+1; coefficient C after n=0 | sum=1+Cz/(1−z), not 1+Cz; positive normalization exponent gives 1+(−1)^e Cz | Keep 0⁰ convention |
| 2.4 q-binomial headline | q=.2,a=.3,z=.7 | sum≈3.007306345365; product ratio≈3.007306345365 | Keep |
| 2.4 large-base headline | q=2,a=0,z=3 | sum≈−.0522988955771; inverse-base product≈−.0522988955771; radius condition 0<1 | Keep a=0 case |
| 2.4 Euler headlines | q=.2,z=.7; entire identity z=2 | inverse sum/product≈4.015699529238; entire sum/product≈4.627022595122 | Keep different z domains |
| 2.4 Euler boundary / natural subtraction | q=0,n=0,1,2 | n(n−1)/2=0,0,1; entire series=1+z, matching product | Keep |
| 2.5 Ramanujan 1ψ1 headline | a=.8,b=.1,q=.2,z=.7 | bilateral sum≈1.189220922478; four-product ratio≈1.189220922478 | Keep |
| 2.5 regular b=0 | j=−1,a=3,q=2,z=1 | regular term=−2; factor b−q is −2, not a pole | Keep b=0 allowed |
| 2.6 Bailey pair | α=δ₀; q=1/2,a=1,n=1 | β₁=1/((1−q)(1−aq))=4; β=δ₀ would give 0 | Keep relation ties sequences |
| 2.6 false candidate pair | α=β=δ₁; q=1/2,a=1,n=1 | β₁=1; defining sum=1/((1−q)(1−q²))=8/3 | Excluded |
| 2.7 Bailey-transform headline | a=q=0, ρ₁,ρ₂ units, α=δ₀ | βₙ=1; α′=δ₀; β′ₙ=1, including n=0 via t⁰=1 | Keep; genuine general transformation not a tautology |
| 3.1 Gaussian signed/rectangle adapter | n=0,k=−1,0; n=4,k=2,Q=−1 | values 0,1; Gaussian value 2 whereas uncancelled field quotient is 0/0 | Keep polynomial identity |
| 3.2 Schur polynomials | n=0,1,2 | initial pairs (1,1),(1,1); n=2 gives 1+Q and 1+Q²; recurrence agrees | Keep indexing |
| 3.3 gap/residue definitions | empty; (1,1); (1,3) | empty satisfies both; (1,1) fails gap despite residue condition; (1,3) satisfies gap but not ±1 residues | Keep distinct predicates |
| 3.3 first RR counting headline | n=0,…,8 | gap counts and residue counts both [1,1,1,1,2,2,3,3,4] | Keep |
| 3.3 second RR counting headline | n=0,…,8 | counts on both sides [1,0,1,1,1,1,2,2,3] | Keep minimum-part condition |
| 3.3 analytic RR headline | q=.2 | first sum/product≈1.252084005385; second≈1.050083338710 | Keep |
| 3.4 quintuple headline | q=.2,z=.7 | bilateral sum≈1.099066055466; product≈1.099066055466 | Keep |
| 3.4 theta addition | constant coefficient, a=2,b=3 | both sides −10/3 | Keep signs |
| 3.5 partition adapter | n=0,…,8 | native counts and Euler reciprocal coefficients both [1,1,2,3,5,7,11,15,22] | Keep native carrier |
| 4.1 rank and crank | empty; (1); (3,2,1,1) | (rank,crank)=(0,0),(0,−1),(−1,−1); ≥ instead of > gives crank 0 in third case | Keep strict comparison |
| 4.1 conjugation | (3,3)↔(2,2,2) | ranks 1 and −1; crank(3,3)=3 | Keep transpose sign |
| 4.2 vector partitions / size-one correction | coefficient of q | product gives z+z⁻¹−1; adding (1−z) gives z⁻¹, ordinary crank of (1) | Keep |
| 4.3 generating functions | n=0,1 | rank coefficients 1,1; crank coefficients 1,z⁻¹; forgetting correction gives z+z⁻¹−1 at n=1 | Keep |
| 4.4 residue counts/filter | t=1; t=2,n=2 | t=1 count=p(n); at n=2 ranks ±1 give residue counts [0,2], same as Fourier filter | Keep; t=0 filter excluded |
| 4.4a complete dissections | mod 5,size4; mod 7,size5 | rank residue vectors [1,1,1,1,1] and [1,1,1,1,1,1,1] | Keep; full source limitation below |
| 4.4a modulus-11 rank distinction | size6 | rank counts [1,2,1,1,0,1,1,0,1,1,2], versus all-one crank vector | Keep; no false rank-11 equidistribution |
| 4.5 rank equidistribution headline | n=0 in 5n+4,7n+5 | every residue count 1 on both progressions | Keep |
| 4.5 crank equidistribution headline | (ℓ,d)=(5,4),(7,5),(11,6),n=0 | all residue counts 1 in each case | Keep |
| 4.6 offsets | ℓʳ=1,5,25,7,49,343 | least inverses of 24 are 0,4,24,5,47,243; 24δ≡1 for each nontrivial modulus | Keep positivity/coprimality |
| 4.7 extraction | U₂X; U₂X²; U₀1 | 0; X; ΣXⁿ respectively, versus Laurent zero-modulus junk 0 | Keep t>0 comparisons |
| 4.7 residue-range comparison | t=2,a=2,input1 | power-series extraction 0; Laurent extraction X⁻¹ | Keep a<t |
| 4.7 pullout | t=1,a=1,f=X,g=1 | E₁,₁(X)=1 but X·E₁,₁(1)=0 | Keep a<t hypothesis |
| 4.8 eta decimation | ℓ=5,r=1,2; ℓ=11,r=1 | offsets 4,24; parity Euler factors P(X⁵),P(X); L₁ for 11 starts 11X | Keep |
| 4.8a eta equations | first nonconstant terms | degree-five: X⁵−Y has 5t^(11/6), cancelled by 5Y²X; degree-seven: 7t^(11/4), cancelled by 7YX⁴ | Keep lower-degree term |
| 4.8a seven-module base | Ω₇(B⁻¹)/7 | b₃+7b₇; O₇ requires b₇ coefficient divisible by 49 | Keep separate first step |
| 4.8a S versus basis | F=1 at infinity | F constant coefficient 1; every finite gₙ combination coefficient 0 | **Fails: R01** |
| 4.8a Fricke trace | F=1 | 1+11U₁₁1=12; Fricke difference identity 0=0 | Keep factor 11 |
| 4.8a genus / uniqueness | X₀(11), pole order ≤1 at infinity alone | g=1+12/12−2/2=1; function-space dimension 1 (constants), not 2 | Keep |
| 4.9 prime-power headline | r=1,n=0; ℓ=7,r=3,n=0 | p4=5,p5=7,p6=11; p243=133978259344888≡245 mod343, hence divisible by49 but not343 | Keep exponent floor(r/2)+1 |
| 5.1 odd theta | z=0 and z=1/4,τ=i | θ(0)=0; θ(1/4)≈−.643589764039; first pair i q^(1/8)(e^(πiz)−e^(−πiz)) | Keep sign; derivative −2πη³ |
| 5.2 eta multiplier | S at i; T; −I | ν(S)=e^(−πi/4), √i=e^(πi/4), product1; ν(T)=e^(πi/12); (−i)i=1 | Keep root normalization |
| 5.3 E and β | x=0,t=0; derivative x=0 | E(0)=0,β(0)=1,E′(0)=2; missing √π scaling gives 2/√π | Keep |
| 5.3 Wirtinger / xi | τ,y and i·y at k=0 | bar∂τ=0; bar∂y=i/2; ξ₀y=1; ξ₀(iy)=−i | Keep antilinearity |
| 5.4 Mordell | τ=i,z=1/2 | h≈1; exact symmetry/shift expression gives1 | Keep |
| 5.4 shift/S | τ=i,z=1/4 | shift sides≈11.708242116621; S sides≈.606847937009 | Keep |
| 5.5 R correction | u=1/12,τ=i; u→u+1 | R≈.323196786374; translated value≈−.323196786374 | Keep antiperiodicity |
| 5.6 μ | u=1/3,v=1/4,τ=i | μ≈−.894187284346i; μ+iR/2≈−.732588891159i | Keep nonzero correction |
| 5.7 elliptic headline | same u,v,τ; u→u+τ | both sides≈−.015829018232+.027416663811i | Keep |
| 5.7 modular headline | S; same u,v,τ | both sides≈.716779363149i; eta factor at i is i²=−1 | Keep |
| 5.7 I,−I,T consistency | eta-quotient factor | I:1; −I:1; T:e^(−πi/4); branch-free quotient agrees with ν⁻³√w | Keep |
| 6.1 unary corrections | a=b=0; a=1/6,b=0 | g₀,₀=C₀,₀=0 by pairing; g₁/₆,₀ begins (1/6)q^(1/72); ξC=−√2g | Keep sign |
| 6.1 scaled correction | d>0,τ↦dτ | differentiating gives ξC(a,b;dτ)=−√(2d)g(a,b;dτ), not −√2g | Keep √d |
| 6.2 period domain | a=1/2; endpoints with a integral | valid interior sign is fixed; at a=0 the zero summand has sign0 and cannot use a formula assuming 0<a<1 | Keep endpoint separation |
| 6.3 torsion normalization | u=1/2,v=τ/2; β→β+1 | both points off lattice; characteristic phase changes by −1 in the half-character case | Keep rational phases |
| 7.1 cone data | hyperbolic plane; c₁=(1,0),c₂=(0,−1),c₀=(1,−1) | Q(c₁)=Q(c₂)=0,Q(c₀)=−1; B(c₁,c₀)=B(c₂,c₀)=−1 | Keep common cone component |
| 7.1 rank-one negative lattice | form [−2] | Q(x)=−x², isotropic vectors only0; no nonzero primitive isotropic boundary | Keep explicit boundary domain |
| 7.2 ordered theta kernel | hyperbolic ν=(1/2,1/2), then (1/2,−1/2) | sign difference 1−(−1)=2, then −1−(−1)=0; c₁=c₂ gives0 | Keep ordering |
| 7.3 convergence majorant | boundary c=(1,0),ν=c | Q(ν)=0; boundary modified quadratic form also0, so positive definiteness cannot be asserted there | Keep separate boundary analysis |
| 7.4 transformation | hyperbolic A,detA=−1; odd diag(1,−1) | S prefactor τ; odd half-diagonal shift vector (1,1), rather than0 | Keep odd/even distinction |
| 7.5 factorization | rank-one correction; double-length coset split | −C(1/4,0;2τ); second split −C(1/8,0;8τ)−C(5/8,0;8τ) | Keep scaling and both cosets |
| 8.1 automorphy/growth | trivial representation, constant1 | weight0:1=1, but not cuspidal; odd integral full-group weight: −I would require1=−1 | Keep parity and cusp conditions |
| 8.2 operators | y,y²,log y | L₀y=y²; Δ₀y=0; Δ₀y²=−2y²; Δ₁log y=0 | Keep; supplier locator R02 |
| 8.2 unitary comparison | k=1/2 | holomorphic-to-unitary constant shift −3/16; corresponding eigenvalue 3/16 | Keep supplier sign |
| 8.3 harmonic spaces | constant1; y² at k=0 | Δ₀1=0; Δ₀y²=−2y²≠0 | Keep actual PDE condition |
| 8.4 scalar ODE kernel | k=0,w=±1 | H₀(w)=eʷ, values e and e⁻¹; partner e⁻ʷ has reversed values, nonzero Wronskian | Keep independent modes |
| 8.4 constant modes | k=1,y=1,e | (1,log y)=(1,0),(1,1); incorrectly using (1,y⁰) gives (1,1) twice | Keep k=1 exception |
| 8.4 gamma comparison | k=0,w=−1 | e·Γ(1,2)=e⁻¹=H₀(−1); shape1>0 | Keep k<1 for real integral |
| 8.4a parabolic matrices | M=[[1,1],[0,1]],v=(τ,1) | v(τ+1)=(τ+1,1)=Mv(τ); scalar periodic coefficients alone miss τ | Keep Jordan modes |
| 8.4a nonunitary frequency | M=2; M=i | shifts −i log2/(2π) and 1/4 respectively; e(shift)=2 and i | Keep complex frequencies |
| 8.5 Weil normalization | rank-zero lattice; lattice ⟨2⟩,h=1/2 | rank zero at weight1/2: central law f=−f forces0; ⟨2⟩ gives Q(h)=1/4, T phase i and central phase −i | Keep conjugate Weil convention |
| 8.5 Fourier/xi | k=0, conjugate(q⁻¹); zero mode a y^(1−k) | ξ₀ conjugate(q⁻¹)=4πq⁻¹; ξ_k(a y^(1−k))=(1−k)conjugate(a) | Keep polar shadows in full space |
| 8.6 surjectivity proof normalization | k=0,g=1 | bar∂y=i/2 gives ξ₀y=1; bar∂(2y)=i gives ξ₀(2y)=2 | Keep roadmap's half factor; source issue below |
| 8.6 divisor hypotheses | two elliptic components,D supported on one | H¹ on untouched component has dimension1, not0 for any n | Keep positive degree on every component |
| 8.7 mock object/completion | zero correction; k=0 zero-mode conventions | shadow0 for zero correction; y and y−1 differ by holomorphic constant1; ξ₀ of both=1 | Keep specified normalization |
| 8.7 conjugate scalar | F→iF | ξ(iF)=−iξ(F), not iξ(F) | Keep shadow's antilinearity |
| 9.1 holomorphic theta | m=1,classes0,1 | θ₁,₀=1+(e(2z)+e(−2z))q+…; θ₁,₁=q^(1/4)(e(z)+e(−z))+… | Keep 2m indexing |
| 9.2 Jacobi definition | constant1,m>0,z=0,τ=i | elliptic shift would require1=e^(2πm), false; θ₁,j satisfies the law | Keep index/elliptic condition |
| 9.3 mixed residues | (1+v+bar(v))/v²; bar(v)/v; 1/v;1 | residues 1,0,1,0 respectively | Keep bar-degree-zero extraction |
| 9.3 affine coordinates | v=2w, differential dv/v | transformed differential dw/w, residue1=1; function alone gains factor1/2 | Keep differential/Jacobian convention |
| 9.4 polar kernel | simple pole; m-character endpoints | residue −1/(2πi); R_m,0(0)=1 and R_m,m(0)=0 | Keep signs and endpoint values |
| 9.4 cone realization | specified two-dimensional kernel | Q(c₂)=−m, B(c₁,c₂)=−1 | Keep positive m |
| 9.5 decomposition | φ=θ_m,j, no poles; double pole | corrected coefficient vector δ_j, polar part0; for v⁻²A(v), residue A′(0) | Keep arbitrary pole order |
| 9.5 weights | k=1 | coefficient weight k−1/2=1/2, not3/2 | Keep |
| 10.1 third-order definitions | f,ω through q³ | f=1+q−2q²+3q³; ω=1+2q+3q²+4q³ | Keep actual unilateral series |
| 10.1a rank and f bridge | q=.2,z=.7; z=−1 symbolically | rank sides≈1.328424407776; z=−1 gives identical denominators Pₙ(−q;q)² for f | Keep |
| 10.1a ω bridge | q=.2 | P(q²;q²)ω(q)≈1.499934967742; bilateral side≈1.499934967742 | Keep |
| 10.2 third-order vector S | τ=.17+1.1i | both vectors≈(.420123272091+.012234952158i, .606697161074−.072841738892i, .009455858563−.099933933909i) | Keep; component residuals below 7×10⁻¹⁶ |
| 10.2 T/leading phases | first entry q^(−1/24); last pair q^(1/3)ω(±q^(1/2)) | first phase ζ₂₄⁻¹; T swaps last two with phase ζ₃ | Keep exchange |
| 10.3 fifth-order definitions | q→0 | f₀,f₁,F₀,F₁,φ₀,ψ₁,χ₀,χ₁ constants1; ψ₀,φ₁ constants0; φ₁(−q)/q→−1 | Keep signed arguments |
| 10.3a Hecke bridges, f₀/f₁ | q=.2 after Euler multiplication | both sides≈.888030023612 and .785716216301 | Keep |
| 10.3a Hecke bridges, F₀/F₁ | q=.2 after even Euler multiplication | both sides≈1.006323199306 and 1.199932391424 | Keep |
| 10.3a Hecke bridges, φ₀/φ₁ | q=.2 | both sides≈1.241935979521 and .201920619323 | Keep prefactor q for φ₁ |
| 10.4 indefinite realization | Q and cone vectors in retained theta formulas | ordered-cone sign2 on same-sign interior; reversing endpoints gives−2 | Keep endpoint order from §7 |
| 10.5 fifth correction vectors | τ=.17+1.1i; sum of paired completions | first correction G₅,₁,₁≈.557887761575−.009932845653i, G₅,₂,₁ is its negative; sum0 | Keep nonzero corrections and cancellation |
| 10.6 fifth transformations | multiply displayed S matrix by itself | I₆: diagonal1, off-diagonal0 (floating residual norm≈3.14×10⁻¹⁶) | Keep asymmetric √2 entries |
| 10.6 fifth S law on actual series | τ=.17+1.1i | both six-vectors≈(.505362227191+.004128522071i, .353688249173−.057818438796i, .397756535369+.001034066381i, .247237506773−.046495045432i, .385593599225−.004119716235i, .128003056987−.049554342949i) | Keep; residuals below 7×10⁻¹⁶ |
| 10.7 seventh vector | cone normalization and leading exponents | Q(c)=−21/2,B(c₁,c₂)=−28; exponents −1/168,47/168,143/168 | Keep order (F₀,F₂,F₁) |
| 10.8 seventh transformations | S²; third T phase | I₃: diagonal1, off-diagonal0 (residual≈2.36×10⁻¹⁶); 143≡−25 mod168 | Keep |
| 11.2 root completion | α=1/2,τ=i | correction-defined F≈.506566028747; H₃ first component≈.506566028747 | Keep |
| 11.2 corrected Lerch expression | α=1/2,τ=i before completion | hα/D≈.650841567833i; corrected expression≈.650841567833i; printed source expression≈.650850612912i | Keep roadmap correction; source issue below |
| 11.2 root endpoints | α=1/3; α=0 | first has 3α∈ℤ, so separate terms polar but combined rank series regular; α=0 gives η⁻¹ of weight−1/2 | Keep cancellation; trivial root excluded |
| 11.2 shadow / phase | α=1/2; lower-unipotent N=10368 | correction −2C(1/6,0;3τ) gives +2√6g; rational phase 3N/4=7776∈2ℤ | Keep |
| 11.3 residue deviations | t=1; t=2 | t=1 coefficient p(n)−p(n)=0 and empty correction0; t=2 deviations ±f/2 with the common q^(−1/24) factor | Keep Fourier projection |

The R01 repair was tested on the actual refuting instance, not only against its source. No analogous counterexample was found for the other sampled identities. Infinite convergence, all-cusp growth and general surjectivity are assessed from the stated hypotheses and proof inputs; finite evaluations alone do not establish them.

**Pinned libraries and duplication.** Pins were checked as Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following are concrete declarations/definitions inspected, not name-only matches:

| File at the pin | Lines / declarations and relevant constraint |
| --- | --- |
| `Mathlib/Combinatorics/Enumerative/Partition/Basic.lean` | 52, 87, 205: `Nat.Partition`, `ofSums`, `restricted`; positive natural multiset with prescribed sum, not arbitrary lists containing zeros. |
| `Mathlib/Combinatorics/Enumerative/Partition/YoungDiagram.lean` | 36, 42, 76, 81: diagram conversion, decreasing sorted row lengths, `conjugate`, involution. |
| `Mathlib/Combinatorics/Enumerative/Partition/GenFun.lean` | 48–60 and 77–170: `genFun`, `coeff_genFun`, `hasProd_genFun`; commutative semiring weights, topology and Hausdorff hypotheses retained for product equality. |
| `Mathlib/Combinatorics/Enumerative/Partition/Glaisher.lean` | 49, 153, 158: restricted product, Glaisher and odd/distinct counting; positive multiplicity bound. |
| `Mathlib/RingTheory/PowerSeries/Expand.lean` | 28–34, 110: `expand`, `coeff_expand`; commutative ring and nonzero expansion modulus. |
| `Mathlib/RingTheory/PowerSeries/Inverse.lean` | 82–109: `invOfUnit`, `mul_invOfUnit`, `isUnit_iff_constantCoeff`; the chosen unit must equal the constant coefficient in the inverse law. |
| `Mathlib/Combinatorics/Enumerative/Pentagonal/PowerSeries.lean` | 81, 168–190: pentagonal series and eventual coefficients; `hasProd_one_sub_X_pow` works with arbitrary coefficient topology; tprod equality adds T2. |
| `Mathlib/NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean` | 45, 261, 336, 465: native theta term, HasSum, derivative and functional equation; upper-half-plane conditions checked for analytic use. |
| `Mathlib/NumberTheory/ModularForms/DedekindEta.lean` | 56, 69, 113: eta product, local uniformity and `eta_ne_zero`; these do not themselves supply the general multiplier theorem. |
| `Mathlib/Analysis/SpecialFunctions/Log/Summable.lean` | 171, 222: multipliability requires completeness and norm summability; nonzero product also requires nonzero factors and multiplicative norm. |
| `Mathlib/Analysis/SpecialFunctions/Log/Deriv.lean` | 52, 149: `Real.hasDerivAt_log`, `HasFDerivAt.log`; nonzero real argument. |
| `TauCeti/Analysis/SpecialFunctions/Erf.lean` | 51–54, 64–72, 92, 140, 186, 196: real erf/erfc bodies, zero/oddness, derivative, positivity and bounds. |
| `TauCeti/Analysis/SpecialFunctions/IncompleteGamma.lean` | 110, 119, 125, 245, 329: lower integral definition, valid integral comparison, junk branch, derivative and limit; shape>0 and derivative argument>0. |
| `TauCeti/NumberTheory/ModularForms/EichlerIntegral/Transformation.lean` | 121: `CuspFormClass.eichlerIntegral_slash_apply`; weight n+2, arithmetic subgroup and strict positive periods. It is not this roadmap's nonholomorphic primitive. |
| `TauCeti/Analysis/Contour/Residue/Basic.lean` | 80: `residue` is native meromorphic residue, zero for analytic germs and junk zero outside its meromorphic domain; it does not define mixed real-analytic residues. |
| `TauCeti/Analysis/Contour/Residue/Theorem.lean` | 349: circle residue theorem with positive radius, finite interior support and the explicit meromorphic-order support condition. |
| `TauCeti/Analysis/Contour/HomologyCauchy.lean` | 108: open domain, closed piecewise C¹ curve, holomorphic integrand and null homology. |

Additional name/hypothesis checks covered ZMod inverse/representative lemmas in `Mathlib/Data/ZMod/Basic.lean:61`, 205 and 778; Gamma integral statements in `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:66` and 405; and native multiset sorting in `Mathlib/Data/Multiset/Sort.lean:30`. Searches by object in both pinned libraries found no existing Bailey transformation, rank/crank equidistribution, quintuple or completed Zwegers-Lerch theorem replacing a retained headline.

**Cross-roadmap ownership and supplier resolution.** I used the roadmap search/show tools and read the located paragraphs; board package searches were also made for square-root covers, analytic elliptic regularity, vector-bundle Dolbeault, harmonic weak Maass spaces and meromorphic Jacobi decomposition. The substantive boundaries resolved as follows. Line locators refer to the selected main version or permitted new-roadmap head, not to another revision of an existing roadmap.

| Supplier / owner | Resolved object and locator |
| --- | --- |
| HabiroCyclotomicCompletions | §1.1, README lines 204–293: finite Pochhammer, diagonal inversion, field coefficient series and integral universal product. The independent two-unit inversion and analytic convergence here are extensions, not a second finite-product owner. |
| ArithmeticStatisticsPartIV | §3.2, README lines 130–169: Gaussian polynomial and finite Cauchy identity; §3.9, lines 923–934: real Euler q-binomial sum. This roadmap adds rectangle interpretation, signed lower-index adapter and complex analytic domains. |
| PadicMeasuresIwasawaAlgebras | §2.9, README lines 1788–1824: `PowerSeries.cartier`, `coeff_cartier`, `cartier_expand_mul`; arbitrary shift for extraction, residue-range restriction for pullout. |
| ClassicalArithmeticCompletion | §2.10, README lines 2954–2999: field Laurent Cartier; §2.31 at 3619: Taylor specialization; §§4.20,4.40,4.60,4.61 at 8210,8809,9339,9366: scalar change and formal product identities. |
| GeometryOfNumbersAndQuadraticArithmetic | §4.3, README lines 1708–1785: analytic product/triple product, Kronecker identity and actual Appell–Lerch m. Substitution gives μ=−i q^(−1/8)e^(πi(u−v))m, as retained here. |
| ThetaSeries | Layers 1–3, README around 423,484,587: lattice Poisson, negative Fourier phase and positive-definite coset theta. Indefinite/boundary theta is a different object. |
| MetaplecticAutomorphicForms | §§2.4b–2.6, README lines 476–540; §4.7 at 1244–1266; §§6.18–6.20 at 1768–1824; §7.1 at 1834; §7.49 at 2378. Cover, conjugate finite Weil convention, holomorphic Jacobi decomposition and unitary comparison resolved. |
| ModularForms | Layers 0,2,6 at README 259,382,678; 10A around 1050; 10B at 1068–1115; eta worked target at 1381–1383. Integral slash, U/Fricke conventions, analytic modular curve and line-bundle duality are retained with their owner. |
| AutomorphicSpectralTheory | §1.16, README lines 1281–1306: real-weight Laplacian, integral slash covariance and complex-exponent Powers target. The mathematical input exists; R02 concerns its invented declaration locator. |
| PDE | Main README lines 322–340, Lane E: smooth/Schauder regularity. Analytic regularity is properly distinguished. |
| IntegralLattices | Main §0G, README 568–575; §§1G–1H, 642–692: hyperbolic plane, finite quadratic modules and Gauss invariants. The revision PR was not substituted for main. |
| ContourIntegration | Completed roadmap Layers 2–3, README lines 158–192: residues and global/homological Cauchy. Actual supplied implementations were opened at the pin above. |
| StandardDistributions | Main Layer 2, README lines 314–338: lower incomplete gamma and error functions, including invalid-parameter branches. This roadmap consumes the pinned implementation and adds Fourier-kernel comparisons. |
| HalfIntegralWeightModularForms | Supplied open head, README lines 151–160 and 180–193: consumes this roadmap's eta, unary theta and Jacobi inputs, and explicitly leaves harmonic/mock/Lerch theory here. It is a consumer, not an upward supplier. |
| MaassForms | Supplied open head, README lines 1–30: weight-zero square-integrable cusp spectral theory; distinct from half-integral exponential-growth harmonic spaces. |
| HabiroNahmSeries | Supplied open head, README lines 117–121: consumes this roadmap's analytic identities and records additional root-modularity needs as its own gap. Boundary Habiro evaluation is not duplicated here. |

The six worker citation leads were investigated. `BruinierFunke2003` is a source key, not a missing roadmap. QToolkit and the Cartier names are proposed supplier declarations found in the cited roadmap sections; their absence from the pinned libraries is not supplier drift. No second declaration with a retained fully qualified target name was identified in the searched roadmap material.

All three declared gap slugs occur in both `packages/QSeriesPartitionsAndMockModularForms/design/plan.json` and the README contracts: `classical-metaplectic-model`, `analytic-elliptic-regularity`, `vector-bundle-dolbeault`. Their suppliers are named. The surrounding contract text specifies respectively root preservation and chosen lifts; real-analytic elliptic coefficients and interior solutions; and finite-rank bundles on compact curves with divisor positive on every component. The bundle contract leaves automorphic cusp primitives and growth control to §8.6. These are coherent extensions of the named owners, not unowned prerequisites. No finding is raised merely because the supplier extension is still absent.

**Lean acceptance test and headline coverage.** I built the missing `TauCeti.Analysis.SpecialFunctions.Erf` object, then ran the requested direct Lean elaboration. It exited 0 with exactly 15 sorry warnings and no other diagnostics. A scratch copy appended `#check @name` for all **27 declarations: 12 real-body definitions and 15 theorems**. All signatures printed; explicit ring, unit, summability-domain, upper-half-plane, pole and arithmetic-progression binders remained present. There was no silently dropped section hypothesis.

The README's statable headline list is represented by:

- analytic q-binomial, large-base binomial and Euler identities;
- Ramanujan 1ψ1 and the Bailey transformation;
- both Rogers–Ramanujan counting identities and the paired analytic identity;
- quintuple product;
- rank equidistribution mod 5 and 7, crank equidistribution mod 5, 7 and 11, and prime-power partition congruences;
- the full completed Lerch elliptic and SL₂(ℤ) laws;
- third-order f as the rank specialization.

The module docstring separately names the remaining full headlines and missing constructions: indefinite theta including isotropic boundary/discriminant data; harmonic Fourier and xi exact sequences with all-cusp Weil-form spaces; arbitrary-pole Jacobi decomposition with mixed residues and completed polar kernel; and torsion, classical mock vectors and root-of-unity rank completions with normalized corrections and cusp coordinates. No statable headline missing from the file was identified.

Every sorry was probed in a scratch copy with a closing `simp`, `rfl` or `infer_instance` attempt before its fallback sorry. All **15** still required sorry. Object searches found no one-library-lemma replacement for the retained statements. In particular the f/rank theorem compares a unilateral series with native finite partition counts, so its simple z=−1 analytic specialization is not by itself a proof of the Lean theorem. No padding finding is raised.

The README has the required scope, conventions, supplier contracts, layered build, examples, dependencies, downstream consumers and references. Definitions retain API and discriminating checks; formulas were tested against those checks, including the negative controls above. The false level-11 expansion is the substantive failure preventing acceptance.

## Not verifiable

These limitations do not request new texts or reopen settled source decisions.

- **GasperRahman2004:** waived; cited by its recorded locators. The accessible Gasper1995 notes were used for the seeded inversion and quintuple targets. No claim is made to have read the waived book.
- **BFOR2017:** waived; background locators retained without text certification. The sampled completion statements were checked against Zwegers2002, Zagier2009 and BruinierFunke2003 instead.
- **Andrews1976:** uncertified; partition-book locators remain uncertified. Native carrier facts and finite counting tests were independently checked.
- **AtkinSwinnertonDyer1954:** uncertified; the full rank dissections at pp. 84–106 were not text-certified. Small residue counts do not substitute for that source check.
- **Hickerson1988:** uncertified; the seventh-order unilateral-to-Hecke identifications at pp. 665–666 were not text-certified. Zwegers's transformation statements and the displayed normalization checks were checked separately.
- **Scan/OCR detail:** Garvan1988 (6.8), p. 64, line 695 does not preserve the disputed subscript legibly enough to independently certify that glyph from the extraction. Its residue-five expression was compared with the clearer (6.24), p. 65, lines 747–749. Likewise the original problematic third/eighth formulas of Andrews1986 Theorem 9 were not independently certified glyph by glyph; Zwegers2002 lines 4096–4124 gives corrected formulas and explicitly identifies the two problems. These are not treated as newly established source errata here.
- Numerical checks of infinite sums/integrals are finite-precision diagnostics, not certified analytic proofs. Declared supplier extensions remain conditional inputs. Neither limitation masks the exact counterexample in R01.

## Source issues

- **Misprint** in BruinierFunke2003 at proof of Theorem 3.7, printed p. 14, lines 681–688: the source says solving bar∂f=i y⁻ᵏ conjugate(g) produces ξₖf=g; it should be bar∂f=(i/2)y⁻ᵏ conjugate(g), or rescale the resulting f by one half; affects the proof.
- **Error** in Zagier2009 at proof of Theorem 7.1, printed p. 986–17, line 948: the source says the Lerch decomposition has a positive eta quotient and two unscaled positive Lerch terms; it should be the negative eta quotient plus q^(−1/6)(ξ⁻¹μ(3α,−τ)−ξμ(3α,τ)) in its stated normalization; affects the proof.

