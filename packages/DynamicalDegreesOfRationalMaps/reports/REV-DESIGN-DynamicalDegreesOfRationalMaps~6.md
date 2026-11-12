<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12938#issuecomment-6796543324 -->
Review (codex) of ec0e4c6

Verdict: needs_changes

1. **F01** (P3) Correct the manifest page for the Cremona example

   **Location:** `packages/DynamicalDegreesOfRationalMaps/sources.toml:109`: “Section 4: Lemma 4.4, Lemma 4.6, example p. 13”.

   **Claim:** The manifest locates the example on page 13 of the recorded arXiv version.

   **Witness:** `russakovskiishiffman1997` line 538 starts page 14; lines 542–552 contain the plane Cremona example and its degrees 2 and 1. Page 13 contains the definition and the beginning of Lemma 4.4.

   **Exact repair:** In this existing manifest entry, change only `example p. 13` to `example p. 14`. Keep the key, version, hash and other recorded metadata. The reviewer leaves the author's entry untouched.

   **Repair test:** The corrected page contains `[x₁x₂:x₀x₂:x₀x₁]`, whose first degree is 2 and whose generic field degree is 1; its square reduces to the identity. The README's §6.3 locator, lines 542–552, already points to that example.

There is one nonblocking P3 locator finding and no P1 or P2 findings. The manifest locator requires repair, so the verdict is needs changes. Lean elaboration is not available in this design lane. The previous finding is repaired. No design text or recorded source entry was changed.

## Verified sound

### Previous finding and repair verification

The previous review has one finding, F01 (called R01 in its closing prose). The repair report marks it applied, not “not actionable”. I checked it before the fresh pass.

| Previous finding | Repaired passage | Verification and status |
| --- | --- | --- |
| F01: name the existing supplier for flat base change of images | `packages/DynamicalDegreesOfRationalMaps/design/README.md:22`: “This is the scheme case of the schematic image of AlgebraicModuliForArithmeticGeometry §5.4” | **Repaired.** At open #853, `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:8710` constructs the image; lines 8721–8722 give flat base change and identify the scheme case with `Scheme.Hom.image`. |
| Propagate the supplier into contracts and dependencies | README:99 names “the schematic image of a quasi-compact morphism of locally Noetherian DM stacks, consumed only for schemes”; README:213,219,236 name §5.4 | **Repaired.** Scope, contract, statement, Needs and Layer 1 dependencies agree. The plan supplier lists §§1.4 and 5.4; target 1.4 includes the supplier and the flatness/quasi-compactness hypotheses. No new supplier edge is needed. |
| Validate the added pinned proof route and negative control | README:213: “the kernel of γ_f ×_K K' is then the kernel of the base-changed closed immersion”; README:224: “whose image is empty, while the inverse image of 𝔸¹_K is the point Spec K” | **Sound addition.** The kernels, closed immersion and flat pullback declarations were opened at the pins. The non-flat example computes different ideals, ⊤ and ⊥, as below. |

The Noetherian hypotheses hold: the domain is open in a finite-type scheme over a field, its graph map is quasi-compact, and the ambient product after any field extension is again finite type over a field. Infinite transcendence degree of the extension does not change this. The pinned route is an application to the graph, not a second proposed generic image construction.

I searched all remaining graph/base-change uses. §§4.3 and 5.3 consume §1.4; neither bypasses it. I also searched for the earlier repaired patterns: restricting real nef inputs to positive sums of nef line bundles, taking an integral multiple of an irrational class, discarding geometric multiplicities, using a finite basis when finrank is zero, and unadjusted Fekete infima. None recurs as a claimed general result.

### Extent, principles and design shape

I read the README's 27 target sections, their routes and Needs lines, and compared the plan's statements, hypotheses, prerequisites and 115 Checks. The round-5 computed table supports unchanged assertions; its uncomputed summaries were not used to certify sources, current suppliers or pinned declarations. The fifteen seeded targets and all repaired/additional assertions were checked afresh. The table below records computations for the sample, headlines and repair, with additional rows for the other targets.

The scope develops general rational-map degree theory over arbitrary fields. It does not re-plan ArithmeticDynamics's projective-line morphisms, numerical divisor spaces, generic intersections or alteration theory. The geometric hypotheses remain explicit: dominance, equal dimension when generic degree is finite, positive middle volume in submultiplicativity, and geometric integrality when the base-changed map is itself a map of varieties. General base change retains the entire fundamental cycle. No good-prime restriction, computational algorithm, copied source passage, source-chapter plan or circular proof route was found.

The six mathematical layers build function fields/graphs, intersections, positivity, graph degrees, limits and examples. The dependencies force the major ordering; Layer 2 explicitly does not use Layer 1. Siu and Hodge are independent intermediate branches used by product Siu and Khovanskii–Teissier respectively, rather than a claimed mandatory source order. I read the main copies of SchemeAndStackFoundations and StableReduction for house shape and the consumed interfaces.

All six layers end with Examples and Dependencies. All 27 sections have a Needs line and source or supplier locators. The seven definition/construction blocks have API/Check counts in the plan: §1.1 6/6, §1.2 6/5, §1.3 3/4, §2.3 4/4, §4.1 5/4, §5.1 2/3 and §5.4 3/4; the README expands the properties in prose. Checks distinguish competing conventions and wrong objects. Constructed maps have sources and targets. Denominators used in proofs are positive volumes, positive generic degrees or cleared positive integers. The empty-family approximation case is harmless: its coefficient conditions are empty and the approximant is δH. No false implication is obtained from a zero denominator there.

There are no maintainer notes in this brief. I found no suspicious instruction in the material read. No process identifiers, local machine paths, `set_option`, sorry'd data, or proposed Lean declaration names masquerading as supplied declarations occur in the design prose. Mathematical symbols in code spans are notation, not claims of Lean declarations.

### Computed adversarial table

For the elliptic-product rows let H = F₁+F₂ and A = (1+√2)F₁+(2+√2)F₂−√2Δ on E×E with End(E)=ℤ. Their matrices are I and [[1,√2],[√2,2]]. Squares are twice the determinant and mixed intersections are tr(B adj B′). This fixes the convention in both this roadmap and AlgebraicModuliForArithmeticGeometryPartII's §§1.2,1.4 Checks. “Retain” means no mathematical repair is needed; R01 changes only the source page.

| Statement | Instances tried | Values computed on each side / wrong-model control | Result; change |
| --- | --- | --- | --- |
| §1.1 pullback, field degree, birationality | Squaring in characteristic 0 and 2; projection ℙ²⇢ℙ¹; identity; squaring then translation at z=1 | Squaring ranks 2 and 2, versus separable rank 1 in characteristic 2; two squarings give 4=2·2. Projection has trdeg difference 1 and finrank 0. Identity rank 1. Composite value 2, reversed order 4. | Retain the full degree, dominance and order conventions. |
| §1.2 graph and projections | Identity; squaring; constant map; plane Cremona; projection ℙ²⇢ℙ¹ | Diagonal projection degrees 1,1; squaring 1,2. Constant target image has dimension 0 rather than 1. Cremona has three exceptional line fibres, generic degree 1. Projection has fibre dimension 1. | Retain; proper and generically finite are not confused with finite. |
| §1.3 composite correspondence | Two squarings; Cremona squared; ℙ¹_ℂ over ℝ | W→Γ_g has degree 2, while the composite has degree 4. Cremona square has degree 1. ℂ⊗ℝℂ=ℂ×ℂ gives two ambient components; the triple diagonal W is integral and its projections have degree 1. | Retain direct image in the possibly nonintegral product. |
| §1.4 repaired image base change | Identity of ℙ¹_ℂ/ℝ, extended to ℂ | Ambient product after extension has 4 components; the image has 2 diagonal components, as does the pullback of the original diagonal. Degree 2=1+1. | Repair verified. |
| §1.4 nonreduced and zero-dimensional control | K=𝔽_p(t), L=K(t^(1/p)), identity of Spec L; extend to L, p=2,3 | L⊗_K L=L[ε]/ε^p. Both images have length p, namely 2=2 and 3=3; replacing by reductions would give 1. | Retain scheme structure and the geometric-integrality qualification. |
| §1.4 non-flat negative control | 𝔾_m→𝔸¹, pull back along t=0 | Original kernel 0, image 𝔸¹. New source has ring K[t,t⁻¹]/(t)=0; its image ideal in K is K. Pullback of old image has ideal 0. Thus empty ≠ Spec K. | Added Check is correct. |
| §1.4 pinned kernel route | Scheme-theoretically dominant p followed by closed immersion i | ker(p≫i)=(ker p).map i=⊥.map i=ker i. Flat pullback preserves ker p=⊥; the preceding non-flat case instead gives ⊤. | All named inputs have the required hypotheses. |
| §1.4 normalization and rank argument | Cuspidal cubic; z²; unequal-dimensional projection | Hyperplane degree after normalization is 3=3. Basis {1,z} has rank 2 before and after field extension. Projection retains dimension difference 1 and finrank 0=0, with no rank-zero basis claim. | Retain. |
| §2.1 component law | Double point, double line, disjoint line and point, reducible conic | Length 2=2·1; double-line degree 2=2·1; χ(line⊔point,O(n))=n+2 has leading coefficient 1; reducible conic degree 2=1+1. | Retain multiplicities and dimension cutoff. |
| §2.2 Chow comparison | ℙ² hyperplanes and ℙ¹×ℙ¹ rulings | H²=1 on both sides; h₁h₂=1 and h₁²=0. The n₁n₂ coefficient of (n₁D₁+n₂D₂)²/2 is D₁D₂, not 2D₁D₂. | Retain normalization. |
| §2.3 real coefficients | √2h₁+h₂; −O(1) on ℙ¹; 2O(1,1)−O(1,0) | Square 2√2 equals its multilinear expansion; the negative class has degree −1. The signed expression is O(1,2), with ruling degrees 2 and 1. | Retain full vector space and curve-defined nef cone. |
| §2.4 reduction | ℙ¹_ℂ/ℝ; anisotropic real conic; x²+ty² over 𝔽₂(t) | First c=2 and degree 2=2·1; conic c=1 and degree 2=1·2. Inseparable conic has Hilbert polynomial 2n+1; normalized curve has 2n+2, same leading coefficient 2; geometric double line contributes 2·1. | Retain normalization before taking constants. |
| §3.1 full nef cone | A, H, F₁−F₂ | A has eigenvalues 0,3, square 0, A·H=3 and curve degrees 2,1,3+2√2. H²=2. F₁−F₂ has square −2 and degree −1 on F₁. | Retain; the negative class is excluded. |
| §3.1 exclusion of rationally generated cone | v=(−√2,1), rational PSD summands B | vᵀAv=0. In A=Σa_jB_j, a_j>0, each B_jv=0; rational entries force B_j=0, contradicting tr A=3. | Earlier full-cone repair remains effective. |
| §3.1 ample approximation | m=n=3, δ=1/5; coefficients 2.41,3.41,−1.42 | Errors <1/90. Raw determinant −463/10000; adding δH/2 gives 2617/10000; adding δH gives 5897/10000. N=100 gives integral determinant 5897 and Nδ/2=10≥1. | Rounding alone fails; stated correction works. |
| §3.1 homogeneity and pullback | H/2 on ℙ²; zero class; projection ℙ¹×ℙ¹→ℙ¹ | Square 1/4<1 although every integral ample square is ≥1. δH has degree δ→0. Pullback of O(1) has ruling degrees 1,0 and square 0. | Homogeneity is necessary; arbitrary pullback preserves nefness, not bigness. |
| §3.2 nonnegativity | A,H; double line; zero-dimensional double point | A²=0≥0, A·H=3≥0; line contribution 2=2·1; empty intersection length 2. Non-nef F₁−F₂ has square −2. | Retain proper-support/projective-modification route. |
| §3.3 Siu | On product surface A=(1,1), B=(1,0), C=(0,1); on E×E use A+H,A,H | Product surface: 2=2. Elliptic surface: 8·3=24≤2·3·5=30. Non-nef B=(1,−1) would give 2≤0. | Retain nefness and integral support. |
| §3.4 Hodge | Quadric cone; blow-up with H=2L+E and D=L; two exceptional classes | Cone 4=2·2. Blow-up H²=3, H·E=−1, and 4≥3 despite H non-nef. H=E₁,D=E₂ would give 0≥1, but H²=−1 excludes it. | Retain positive square, without adding nefness. |
| §3.5 Khovanskii–Teissier | (2,1),(1,1); A,H; disjoint planes; endpoint | 9≥4·2=8. A,H give 9≥0; regularized gap (3+2ε)²−2(6ε+2ε²)=9. Disjoint planes give 16<25. At k=0, A=2H,B=H on ℙ² would give 1≥2. | Integrality and interior index range are correct. |
| §3.6 product Siu and ratios | (ℙ¹)³, i=2, B=h₁+h₂+h₃, A₁=h₁,A₂=h₂,C=h₃ | B³=6; bound 6≤4·1·2=8. x=(1,2,2), y=(1,2,6): first step 1≤2, second 2≤8/3. Dropping constant gives false 6≤2. At i=r both sides are identical. | Retain telescoping constant and positive denominators. |
| §3.6 reducible control | Two planes, B=(H,2H), A=C=(H,0) | B²=5, A·C=A·B=B·C=1; alleged global inequality gives 5≤2. | Correctly excluded; source error is not copied. |
| §4.1 mixed degrees/model factor | Squaring; degree-two model; real cycle √2[point] | Graph degrees (1,2); degree-two model (2,4)=2·(1,2). Real cycle degree √2 is not in the integer image of CH₀(ℙ¹). | Retain model factor and real Chow coefficients. |
| §4.2 endpoints, integrality, positivity, monotonicity | Cremona; p=2,3 power maps; non-big ruling; A≤A+H | Degrees (1,2,1), (1,2,4), (1,3,9); top degrees 1,4,9 include inseparability. Ruling square 0 fails positivity hypothesis. A comparisons 0≤3≤8. Replacing (1,1) by (1.5,.5) drops 2 to 1.5, with negative difference degree −.5. | Retain all qualifications. |
| §4.3 invariance of degrees | Normalized cubic; whole base change of ℙ¹_ℂ/ℝ | 3=3; 2=1+1. Cremona over ℚ and ℂ has (1,2,1) on both sides. | Retain whole cycle. |
| §4.4 submultiplicativity | Squaring twice; Cremona squared; Frobenius then squaring; outer classes A | 4=2·2; 1≤2·2·2=8; 2p=p·2. On E×E with middle H and outer A, 0≤(2/2)·3·3=9. | Retain positive middle volume, allowing non-big outer classes. |
| §4.5 comparison | Factor swap, polarizations (1,1),(2,1); H,A+H | First degrees 2,5; volumes 2,4; mixed product 3; c=9/4, reverse 9/16, C=9 gives 2/9≤5≤18. Second degrees 2,9; volumes 2,8; mixed product 5; C=25 gives 2/25≤9≤50. | Constants independent of map/iterate; retain. |
| §5.1 limit and adjusted infimum | Identity ℙ² with ω=H/2 | Degree 1/4, C₁=8; adjusted roots 2^(1/n)→1 with infimum 1. Unadjusted infimum is 1/4. Comparison constant 16 gives 1/4≥1/16; u₀/0=0 is covered by the lower bound. | Retain adjusted Fekete sequence. |
| §5.2 properties | Degree-two morphism of ℙ²; Cremona; Fibonacci; iteration | λ=(1,2,4), (1,1,1), (1,φ,1); log-concavity 4=4 and φ²≈2.618≥1. Squaring twice has λ₁=4=2². Endpoint k=0 would falsely demand 1≥φ. | Retain interior indices and m≥1. |
| §5.3 invariance | Normalized cubic; ℙ¹_ℂ/ℝ; Frobenius | 3^(1/n)→1 and 2^(1/n)→1; whole geometric cycle still has degree 2. Frobenius λ_k=p^k on both fields. | Retain distinction between maps of varieties and base-changed cycles. |
| §5.4 algebraic entropy | Degree-two ℙ² morphism; Cremona; Fibonacci; identity | Entropies log4,0,logφ,0. Lower/upper bounds give log4=2log2; for Fibonacci 0≤logφ≤2logφ. Maximizers respectively {2}, {0,1,2}, {1}, all indices. At iterate 0, entropy 0=0·h. | Retain. |
| §6.1 forms and composition | Common-factor tuple; constant into Cremona base point; squaring followed by Cremona | (x₀²,x₀x₁,x₀x₂) reduces to degree 1, not 2. Constant substitution is (0,0,0), excluded by dominance. Squaring then Cremona has degree 4=2·2; Cremona squared reduces to 1<4. | Retain reduced forms and dominance; constant morphism iterates have degrees 1,0,0,… with 0⁰=1. |
| §6.2 projective degree recursion | Cremona and power maps | Cremona: deg₁=2, deg₂=1≤2·2=4; power map of degree a: deg_k=a^k and recursion a^(k+1)=a·a^k. | Retain exceptional-divisor route and index range. |
| §6.3 examples; R01 | Fibonacci n=0,1,2,3; Cremona dimensions 2,3 | Fibonacci degrees 1,2,3,5; n=2 tuple (xyz,xy²,z³), n=3 (xy²z²,x²y³,z⁵). Erroneous n=0 tuple (1,y,z) has degrees 0,1,1. Cremona first degrees 2,3 and square degree 1 in each case. | Mathematics sound; correct manifest page by R01. |
| §6.4 polynomial extension | (x²,y); Hénon; (y,z,x+yz); (x,xy) | First iterated degrees 2^n and λ=(1,2,2). Hénon gives 2^n, top degree 1. Third gives degrees 2,3,5 and top degree 1. Last has no preimage of (0,1), although dominant, so cannot be proper/surjective. | Retain; properness used through affine proper⇔finite. |

Zero rings and empty schemes are excluded as varieties by integrality over a field; nonreduced schemes remain admitted where the intersection statements say proper schemes. Dimension zero is included in those statements: Spec F has empty intersection [F:K], while a trivial line factor on a positive-dimensional support gives zero. No test silently replaces a purely inseparable degree by a geometric-point count.

### Sources: seeded sample and manifest

The manifest has fifteen distinct works/keys: thirteen cached readable texts and two settled uncertified books. No source was fetched and no manifest entry was rewritten. I found no additional locator flagged as unverified beyond the settled books. Pages below refer to the recorded preprint/chapter versions, not an unexamined journal pagination. Source lines, theorem numbers and hypotheses were reopened, including the steps cited from proofs.

| Seeded target | Source opened | What supports the target; limitation checked |
| --- | --- | --- |
| 1.2 The graph | dinhsibony2005 line 45, p.2; dang2020 line 21, p.1; guedj2010 line 1099, printed p.29; stacks-morphisms line 488, Lemma 6.7 (056B), p.11 | The dynamics papers give graph/projection conventions in their own settings. General scheme integrality comes from the reduced-image result and the stated projective/separated hypotheses, not from assuming a complex argument works over every field. |
| 1.4 Normalization and field extension | stacks-morphisms line 2198, Lemma 26.16 (081I), pp.48–49; truong2020 line 1529, §6.3, p.36 | Flat base change needs quasi-compactness; the graph has it. Truong explicitly warns of reducible geometric fibres. The arbitrary-extension degree assertion is justified by the design's finite-basis/dimension split. |
| 2.2 Chow comparison | stacks-chow line 3995, Lemma 41.4 (0BFI), pp.82–83 | Exact proper-scheme statement, fundamental-cycle multiplicities, Chow modification and Cartier restriction proof agree. |
| 2.3 Real coefficients | stacks-varieties line 4778, Lemma 45.5 (0BER), p.103; dangfavre2021 line 436, §1.3, p.12 | Additivity supports tensor extension; the latter uses real numerical polarizations. The design explicitly constructs the extension on Pic⊗ℝ and imports the numerical quotient/nef cone; it does not identify Pic with Num. |
| 3.1 Nef line bundles | cutkosky2015 line 274, §2.2, p.6; current numerical supplier §§1.5,1.7 | Curve criterion and the full real cone are supported. Quantitative approximation is an argument here using ample fixed twists, with the computed rounding control above; no finite-dimensional Pic hypothesis is needed. |
| 3.4 Hodge inequality | kleiman2005 line 3803, Theorem B.27, p.79; cutkosky2015 line 994, p.22 | B.27 allows positive-square H, not only ample H. Its geometric-irreducibility setting is handled by §2.4, with smooth Hodge supplied after an alteration. |
| 3.5 Khovanskii–Teissier | cutkosky2015 line 983, Theorem 6.1, pp.21–22; line 1024, Corollary 6.3, p.22; line 1014, Remark 6.2 | Arbitrary-field nef inequality, interior indices and reducible counterexample match. The source proof uses surface Hodge/Bertini; the roadmap names those inputs. Lazarsfeld locators remain uncertified. |
| 3.6 Product Siu | dang2020 line 871, Theorem 3.4.4 and proof, p.18; line 141, Theorem 3, p.3; dangfavre2021 line 427, Theorem 1.2, p.12 | The explicit constant comes from Dang's proof. The source's reducible-support overclaim is excluded here. The roadmap supplies the real and arbitrary-field extensions through approximation/reduction. |
| 4.2 Values, integrality, positivity | dangfavre2021 line 454, footnote 5, p.12; russakovskiishiffman1997 line 506, p.13 | Integrality for integral line bundles and the morphism formula agree. Source topological degree over ℂ is replaced by the explicitly defined full field degree over arbitrary fields, with a proof and inseparable tests. |
| 4.4 Submultiplicativity | dang2020 line 27, Theorem 1(i), p.1, and line 1271, Theorem 5.2.1/proof, pp.25–26; dangfavre2021 line 448, Theorem 1.3, p.12; dinhsibony2005 line 245, Proposition 6, pp.6–7; truong2020 line 143, Theorem 1.1, p.4 | Normal/algebraically closed and complex source settings are not silently dropped: the triple graph and product-Siu proof establishes the stated arbitrary-field chain estimate. Generic degree cancels from numerator and denominator. |
| 4.5 Comparison/conjugacy | dang2020 line 31, Theorem 1(ii), p.1; dangfavre2021 line 457, Theorem 1.3, p.13; dinhsibony2005 line 256, Corollaire 7, p.7 | Uniform-in-map comparison, then iterates and conjugacy. Explicit constant checked separately. The reversed inequality in the Dinh–Sibony proof is not repeated. |
| 5.2 Properties | dang2020 line 42, p.1; dangfavre2021 line 464, p.13; guedj2010 lines 1136 and 1180, printed pp.30–31 | Lower bound, polarization independence and log-concavity agree. Guedj's endpoint misprint is corrected by the explicit range 1≤k≤d−1. Iteration and top degree follow from the stated graph-degree formulas. |
| 5.3 Invariance | truong2020 line 159, Theorem 1.1(2), p.4, and line 1529, §6.3, p.36; dang2020 line 35, p.1; dinhsibony2005 line 256, p.7 | Birational invariance and the warning about reducible field extension match. Normalization and arbitrary field extension are proved through §§1.4,4.3 rather than by selecting a geometric component. |
| 6.3 Standard examples | silverman2014 line 358, Example 5, p.9; guedj2010 line 1272, Example 2.5, printed p.33; russakovskiishiffman1997 line 542, p.14; truong2020 line 1542, §6.4, p.37 | Fibonacci indexing, Cremona degrees and inverse were recomputed. Silverman's regularity claim is not used. Manifest page error is R01. |
| 6.4 Polynomial self-maps | silverman2014 line 373, Example 6, p.9; dangfavre2021 line 177, Theorem 2, p.5 | The first supports the affine Fibonacci example after correcting its printed index. The second is explicitly context for proper polynomial maps in characteristic zero, not a citation asserting arbitrary-field homogenization; that is proved from §§6.1–6.2 and the pinned proper/affine criterion. |

Also checked the existence/entropy headline locators: dangfavre2021 lines 461–467 (pp.13), silverman2014 Proposition 7 at line 383 (pp.9–10), and dinhsibony2005 Théorème 1 at line 33 (p.1). Algebraic entropy is not identified with topological entropy over arbitrary fields. The adjusted infimum is the one the pinned Fekete statement proves.

### Supplier resolution, ownership and order

I read the board package index and supplied overlaps before making ownership claims. The overlaps list no shared head, dropped cited id, or revision-only cited id. `roadmaps resolve` reports no unresolved roadmap or own-name citation, but explicitly does not check external pinned names; those were checked locally below. `roadmaps show` and object searches through `roadmaps grep` were used at the available open heads. The board package texts and main were searched by objects: rational maps/graphs, function fields, numerical intersections, nef cones, mixed inequalities, alterations and schematic images.

| Supplier/copy | File and resolved sections | Ownership result |
| --- | --- | --- |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md`: §§0.3:695,0.7:923,0.11:1129,0.20:1448,0.30:2050; §2.6:3554; §3.3:4917; §§4.11:5820,4.12:5915,4.13:5945,4.16:6349,4.19:6683; §§5.1:6902,5.2:7000,5.3:7045,5.10:7565 | Proj, dimension, descent, normalization, cohomology, degree, modifications, alterations, Chow operations and smooth-surface Hodge resolve. The Hodge contract indeed allows H²>0 without nefness. Main, not revision-only numbering, is consumed. |
| StableReduction, main | `TauCetiRoadmap/StableReduction/README.md:405`, Layer 2; especially lines 437–444 | Projectivity and line-bundle operations resolve. No duplicate carrier is needed here. |
| CyclotomicClassGroupsAndStickelberger, #1260 | `TauCetiRoadmap/CyclotomicClassGroupsAndStickelberger/README.md:795`, §4.3; API at 801 and Checks at 803 | Numerical intersections, polynomiality, projection/Cartier formulas and field extension are supplied. The design adds compatibility and graph applications. |
| AlgebraicModuliForArithmeticGeometryPartII, #1754 | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometryPartII/README.md`: §§0.1:95,1.1:246,1.2:277,1.4:310,1.5:335,1.7:387 | Curve degree, Num/N¹, full nef cone, fixed twists and Kleiman are supplied. The two extra sections resolve the elliptic-product Checks. Finite-expression approximation in Pic⊗ℝ is an additional argument, not a second numerical-space construction. |
| AlgebraicModuliForArithmeticGeometry, #853 | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:706`, §1.4; high powers at 731; schematic images at 8710–8722 in §5.4 | Both contracts resolve. Its §9.10 at 10319 has a smooth characteristic-zero mixed bound for effective very-ampleness applications; the present arbitrary-field singular full mixed inequality is a general extension. |
| ArakelovGeometryAndAbelianHeightsPartII, #1833 | `TauCetiRoadmap/ArakelovGeometryAndAbelianHeightsPartII/README.md:151`, §0.1; §0.3:208, geometric formulas at 210–212 | Geometric nefness and arbitrary-field volume/Siu inputs are explicit. Arithmetic constructions are not owned here. |
| LefschetzPencilsAndVanishingCycles, #873 | `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:2801`, §5.1, especially 2810–2813 | Generic inverse-image irreducibility is present with dim image>s. All cuts in the routes occur within that range. |
| ArithmeticDynamics, #1335 | `TauCetiRoadmap/ArithmeticDynamics/README.md:1332`, §0.18; §0.26:1564 | Binary-form projective-line morphisms, including constants, are supplied. Their scheme comparison and degree convention agree with the d=1 Checks. |

The closest open scopes were read: #1754 and #1833 are the suppliers above; #1796 `TauCetiRoadmap/AdicCoefficientsAndComparisonsPartII/README.md:9` owns prime-controlled alterations, not these degrees; #1892 `TauCetiRoadmap/JacobianChallenge/README.md:22` owns Jacobians, curve/coherent foundations and abelian theory; #1656 revises SchemeAndStackFoundations's general foundations. No additional owner of dynamical degrees was found. The existing generic schematic-image owner is now cited. Hits for abelian images, deformation-ring images, Gauss graphs and height comparisons concern their specific applications, not another ownership claim to this general dynamical theory. No reciprocal hand-off, upward supplier or forbidden supplier was found.

The plan has 90 local prerequisite edges, with zero unknown targets and zero forward edges. Its baseline hashes agree with the pinned manifest. The gaps list is empty. The prescribed dependency gate returned:

```text
candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
depcheck: 229 roadmaps, 2063 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No merge-order or tool file was edited.

### Pinned declarations opened and duplication by object

Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following are paths within those pinned libraries. The short quoted bodies describe the carrier and its limits, rather than assuming properties from a name.

| Object | Pinned file/declarations opened | Relevant scope or limitation |
| --- | --- | --- |
| Rational maps | `Mathlib/AlgebraicGeometry/Birational/RationalMap.lean:48,377,396,440,501,562,575,586,608`: PartialMap, RationalMap, IsOver, compHom, fromFunctionField, equivFunctionFieldOver, domain, dense_domain, toPartialMap | RationalMap is a quotient of partial maps; IsOver is a separate condition. Largest-domain representative needs reduced source and separated target. The Spec-function-field equivalence needs integral source and locally finite-type target. |
| Dominance/composition | `Mathlib/AlgebraicGeometry/Birational/Dominant.lean:74`; `Composition.lean:155,170,173,182,193,217` in that directory | Composition uses a dominant first map. Associativity/IsOver include the irreducibility and nonemptiness scopes fulfilled by varieties. |
| Birational data | `Mathlib/AlgebraicGeometry/Birational/Birational.lean:39,55,88,166,182`: PartialIso, IsOver, symm, toRationalMap, Birational | `Birational X Y := Nonempty (PartialIso X Y)` is about a pair of schemes; it does not make every self-map birational. |
| Function field, tower law | `Mathlib/AlgebraicGeometry/FunctionField.lean:37,51`; `Mathlib/LinearAlgebra/Dimension/Free.lean:35,76` | Generic stalk is a field under integrality; finrank tower needs compatible scalar actions/free modules. Infinite-dimensional finrank is not a positive degree. |
| Images | `Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean:574,658,661,706,716`; `Basic.lean:691` | Image is `f.ker.subscheme`; toImage is dominant under quasi-compactness. It is not a bare reduced topological closure definition. |
| Added flat-image proof | `Mathlib/AlgebraicGeometry/IdealSheaf/Functorial.lean:39,79,139,163`: comap, ker_fst_of_isClosedImmersion, map_bot, ker_comp; `Mathlib/AlgebraicGeometry/Morphisms/SchemeTheoreticallyDominant.lean:37,112` | `ker_eq_bot` defines scheme-theoretic dominance. Its pullback result requires quasi-compactness and Flat. Kernel of a composite uses ideal pushforward; pullback of a closed immersion uses ideal comap. |
| Image reducedness and dominance | `TauCeti/AlgebraicGeometry/SchemeTheoreticImage/Basic.lean:65,78` | isSchemeTheoreticallyDominant_toImage requires quasi-compactness; isReduced_image additionally requires reduced source. |
| Projective forms | `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Scheme.lean:855`; `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:87,613`; `Mathlib/RingTheory/Polynomial/UniqueFactorization.lean:128` | Proj, homogeneousSubmodule, gradedAlgebra and uniqueFactorizationMonoid supply the native carriers, not the proposed graph-degree theorem. |
| Proper affine maps | `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:97`: IsFinite.iff_isProper_and_isAffineHom | Exactly `IsFinite f ↔ IsProper f ∧ IsAffineHom f`. Dominance supplies surjectivity in the affine example. |
| Fekete | `Mathlib/Analysis/Subadditive.lean:33,106,109,155`: Subadditive, lim, lim_le_div, tendsto_lim | lim is sInf on indices ≥1; convergence requires BddBelow over the full range u_n/n. The design supplies that, including n=0. |
| Example constants | `Mathlib/Data/Nat/Fib/Basic.lean:56`; `Mathlib/NumberTheory/Real/GoldenRatio.lean:36` | fib starts at (0,1); goldenRatio=(1+√5)/2. |
| Line bundles | `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:119`; `Pullback.lean:100`; `TensorProduct.lean:65`; `Dual.lean:44`; `Class.lean:50,142` | InvertibleSheaf is the full subcategory of invertible modules, with module morphisms. LineBundleClass is its skeleton with commutative group structure. |
| Ampleness | `TauCeti/AlgebraicGeometry/LineBundle/Ample.lean:71,96` | Native IsAmple includes quasi-compactness and affine nonvanishing loci of positive powers. of_pow requires a positive exponent. |
| Cohomology and curve degree | `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61`; `EulerCharacteristic.lean:105`; `TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:130`; `TauCeti/AlgebraicGeometry/IntersectionNumber/Basic.lean:111`; `FieldTower.lean:66` | eulerCharBelow is the truncated alternating finrank sum. Higher-dimensional multilinear intersection is not this unary curve-degree definition; coherent finiteness is supplied. Field restriction multiplies by [κ:k]. |
| Effective Cartier divisors | `TauCeti/AlgebraicGeometry/EffectiveCartierDivisor/Basic.lean:78` | Local principal equations are regular elements; the integral-support nonzero sections in the proof meet this condition. |
| Morphism pullbacks | `TauCeti/AlgebraicGeometry/Morphisms/Dominant.lean:151,206,212,221`; `TauCeti/AlgebraicGeometry/Scheme/BaseAlgebra.lean:409,421,427`; `TauCeti/AlgebraicGeometry/Scheme/FunctionField.lean:101` | functionFieldMap/AlgHom, identity/composition and extensionality have the stated dominance, integral/reduced/separated and base scopes. Dimension is trdeg for integral schemes locally finite type over a field. |
| Specialized existing maps | `TauCeti/AlgebraicGeometry/Birational/AlgHom.lean:64,71`; `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/FunctionField.lean:167` | The first extends a field map to a morphism for valuation-ring local sources/proper targets; the second is Weierstrass-isogeny pullback. Neither is a general dominant rational-map degree API. |

Object searches in both pins found the above existing machinery and no general dynamical-degree or Siu/Khovanskii–Teissier theory replacing the kept targets. Existing constructions are imported. The shape of native definitions was checked rather than inferred from absence of the roadmap's proposed names.

### Headline coverage and package-stage obligations

The explicit headline list in `packages/DynamicalDegreesOfRationalMaps/design/README.md:132` comprises: graph integrality/projectivity/projections (§1.2); arbitrary-field Khovanskii–Teissier and product Siu (§§3.5–3.6); positivity/endpoints and field invariance (§§4.2–4.3); submultiplicativity and comparison/conjugacy (§§4.4–4.5); existence/properties/invariance of dynamical degrees and algebraic entropy (§§5.1–5.4); and projective/affine degree formulas with Cremona and Fibonacci examples (§§6.2–6.4). Each is present as a design target and covered by the computed table.

This submission has no `Suggested.lean`. Thus there are zero sorried declarations to probe, zero binder types to compare, and no import header or docstring to certify. This is not a missing-artifact finding at the design stage. In particular this review does **not** declare all headlines unstatable: rational maps and scheme-theoretic images already exist at the pins. The package must assess native signatures plus simple definitions, state each statable headline, explain each genuinely missing carrier in the module docstring, and delete any padding. The padding and absent-headline checks are explicitly inapplicable to the absent design-stage Lean file, rather than recorded as passed elaboration.

## Not verifiable

- Lean elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command or one-tactic/#check probe was run. There is no “sorry is the only warning” claim.
- `lazarsfeld2004` and `fulton1998` are settled uncertified books. Their listed locators were retained as such; neither text was opened or requested again. The readable primary texts, supplier statements and independent calculations were used where available.
- Ownership is checked against the supplied main checkout, board package texts and readable indexed open heads. The board index also lists packages on other board branches without a supplied readable checkout; those heads were not fetched independently. No claim concerns later-changing or unprovided heads.

## Source issues

The following source problems were checked against the cached versions and do not create additional roadmap findings: the design avoids the faulty statements. R01 is an error in the manifest, not an error in the source.

- **Error** in dang2020 at Proposition 3.4.1, printed page 17, and Theorem 3.4.4, printed page 18: the source says the global-ratio Siu bound holds on every closed subscheme; it should require irreducible support or componentwise bounds; affects a stated result.
- **Misprint** in dang2020 at Proposition 3.4.1 proof, printed page 17: the source says the kernel dimension strictly exceeds the difference of section dimensions; it should allow equality; affects the proof.
- **Misprint** in dang2020 at Theorem 3.4.4 proof, printed page 18: the source says the final constant uses ambient dimension n; it should use support dimension r in the telescoped expression; affects nothing.
- **Misprint** in dinhsibony2005 at Corollaire 7 proof, printed page 7: the source says the limit equals the infimum of unadjusted degree roots; it should use roots adjusted by the submultiplicativity constant; affects the proof.
- **Misprint** in dinhsibony2005 at Corollaire 7 proof, printed page 7: the source says the preceding upper bound gives λ(f)≤λ(h); it should first give λ(h)≤λ(f), then apply inverse conjugacy; affects the proof.
- **Error** in silverman2014 at Example 5, printed page 9: the source says the Fibonacci birational map has disjoint indeterminacy loci from its inverse; it should note their common point [0:1:0]; affects nothing.
- **Misprint** in silverman2014 at Example 6, printed page 9: the source says the nth iterate has degree F_n; it should use F_(n+2), with initial degrees 2,3,5; affects nothing.
- **Misprint** in guedj2010 at Théorème 2.4(a), printed page 31: the source says the adjacent-index inequality includes l=k; it should stop at l=k−1 because λ_(k+1) is undefined; affects a stated result.
- **Misprint** in cutkosky2015 at §2.2, printed page 6: the source says Pic(X) is the group of Cartier divisors; it should be Cartier divisors modulo principal divisors; affects nothing.

Short independent witnesses: the two-plane Siu test gives 5>2. On ℙ¹, A=2H, B=H and m distinct points give kernel dimension m+1=(2m+1)−m, not a strict inequality. For Dinh–Sibony's normalized setting, on E×E take automorphism matrix [[2,1],[1,1]] and polarization H/√2: volume 1, first degree 7/2, limiting first dynamical degree (7+3√5)/2>7/2, so the unadjusted infimum cannot equal the limit. The Fibonacci inverse is [vw:u²:uw]; both base loci contain [0:1:0]. The nonzero Cartier divisor [0]−[∞] has zero Picard class.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "ec0e4c6111e993a8b2e6060d00a684b4b8e3ce23", "job": "REV-DESIGN-DynamicalDegreesOfRationalMaps~6", "model": "gpt-6-astra", "worker": "chris-9"} -->
