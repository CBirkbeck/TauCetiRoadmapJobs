<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1067#issuecomment-6398931814 -->
Red team round 1 pass a (codex) of 7e4f54f

Verdict: accepted

## Verified sound

No package finding survived verification. This verdict is conditional on the seven declared supplier contracts, not on their already being implemented.

Read all 759 lines of `packages/AnalyticToricGeometryPartII/README.md`, all 48 lines of `packages/AnalyticToricGeometryPartII/Suggested.lean`, the repository README and CONTRIBUTING rules, the plan, source manifest and last repair report. The inventories below cover **29 target subsections, 60 API bullets, 102 Checks, zero Lean declarations, 12 named roadmap suppliers, seven gaps and 27 explicitly cited numbered source locators**. Remark 7.15 and the cited unnumbered model/proof paragraphs were also read. Ownership searches included main, Completed, board packages and all 51 explicitly supplied sibling folders. The sibling/supplier ledger below records the relevant matches, not merely search-name matches.

The reviewed head is `7e4f54f033282df2f8c15c24b71439cbc6ef3d63`. The base-to-head diff contains eight files, all inside `packages/AnalyticToricGeometryPartII`. Mathlib was inspected at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, as pinned in `lake-manifest.json`. No build, elaboration, git mutation or external write was run. Only this report and scratch notes were written. The last repair report has no finding marked not actionable that this review re-raises.

The required dependency command returned:

```text
depcheck: 52 roadmaps, 592 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Internal prerequisites precede their consumers; the apparent cross-characteristic circle is broken by proving power-pullback invertibility through smooth proper specialization before applying tower continuity. DeligneWeightsAndPurityPartII and MotivesAndAlgebraicCyclesPartII are consumers only.

### Lean declaration and headline inventory

`Suggested.lean` has one module docstring, one `import Mathlib`, the required namespace, **no declarations, section variables, instances or examples**. Thus the declaration/context inventory is empty: no omitted section hypothesis, universe binder, admitted datum, padding theorem or duplicate fully qualified name exists. There is no `set_option`, `lemma`, placeholder predicate or substitute homeomorphism. No signature elaboration is claimed.

| README headline | Module-docstring coverage | Carrier audit at the pins; result |
|---|---|---|
| §§0.3–0.6: actual toric sections/base change, invariant representatives, field-independent class presentation | Suggested.lean:12 | Native Finsupp/module/tensor and generic divisor carriers exist; the arbitrary-coefficient fan scheme and its ray/Cartier constructions do not. The tensor identity on a free coefficient module alone is an API consequence, not the global-section identification. No missing statable headline found. |
| §1.2: unit generic fibre versus analytification | Suggested.lean:17 | Native adic spaces exist; toric formal completion, generic-fibre functor and this comparison are substantial supplier constructions. |
| §§2.1, 2.4: perfectoid charts and graded divisor algebra | Suggested.lean:20 | No native completed perfected cone algebra with its plus ring/tilt to specialize. A bare c₀ module does not state perfectoidness. |
| §§3.1–3.7: five comparisons and full affine-line sharp comparison | Suggested.lean:22 | Toric tower, tilt, small adic étale sites and their constructed geometric morphisms are missing. Arbitrary inverse systems would change the statement. |
| §§4.1–4.2: power automorphism and torsion-cohomology isomorphism | Suggested.lean:27 | Generic sheaf cohomology alone does not supply those sites, spaces or pullback maps. |
| §§5.1–5.3: cofinal tubes, nonzero dense-field section approximation, hypersurface approximation | Suggested.lean:30 | Integral toric line bundles, section domains, homogeneous cone algebra and sharp are missing. Scalar inequalities alone would be a stand-in. |
| §§6.1–6.2: operational Chow/Minkowski identification and displacement product | Suggested.lean:34 | The integer balancing kernel is easy to define, but operational Chow, orbit evaluation and product comparison are not at the pins. |
| §§6.3–6.4: positive refined degree and complete-intersection approximation | Suggested.lean:37 | Missing preceding Chow/Gysin geometry, actual zero loci and toric projection. No replacement by arbitrary cycle data is justified. |

### Computed conventions and boundary tests

In the following tables, `r=abs(ϖ)` with `0<r<1`; `D∞` is the negative-ray divisor on ℙ¹, and `F,G` are the two fibre classes on ℙ¹×ℙ¹. A result of “retained” means the stated hypotheses survive the displayed instance; it is not a substitute for the displayed computation. All rows have change **none** unless explicitly describing a rejected input.

| Convention/statement | Instances and computed values on the two sides | Result/change |
|---|---|---|
| Nonempty finite salient fan; rank zero, README:19 | Rank-zero fan: N=M=0, one zero cone, realization Spec A. Empty fan: realization empty. Whole line contains 1 and −1, so fails salience although it contains 0. | Retained; empty/line inputs excluded. |
| Regular versus complete versus projective, README:19 | Separate rays (1,0),(1,2): each primitive, no 2-cone, support not ℝ². Fujino–Sato complete regular example: three strict ample inequalities sum to 0>0. | Distinctions retained. |
| Divisor, section and local-equation signs, README:21 | div(t)=(1,−1); O(D∞) frame weights (0,1), local equations (0,−1), first/second ratio t⁻¹, reverse ratio t, product 1. | All signs agree with §§0.1, 0.5, 6.1. |
| Arbitrary coefficient ring, README:23 | A=k[ε]/ε²: S_A(0)=A, ε≠0, ε²=0. A=0: all coefficient modules 0; no field-fibre Weil claim is applied. | Retained. |
| Convolution, README:23 | (2χ⁰)(3χ¹)=6χ¹; multiply by 5χ⁰: 30χ¹ in either association. Pointwise product of supports {0},{1} is 0. | Wrong multiplication excluded. |
| p-local exponents, README:25 | p=2: 1/2∈ℤ[1/2], 1/3∉ℤ[1/2]. p=3 reverses these examples. Rank-zero exponent set remains {0}. | Retained. |
| Fractional thresholds, README:25 | c=1/2: abs(f)²≤abs(ϖ) is the definition at any ordered-value-group point; r^(1−ε)<1 for 0<ε<1. c=0 gives threshold 1. | No division by zero or real-valued-point assumption. |
| c₀ topology, README:27 | Coefficients 1 at infinitely many weights: infinitely many exceed 1/2, rejected. Coefficients ϖⁿ: tail supremum r^(N+1)→0, accepted. | Discrete-index completion retained. |
| Unit versus full spaces, README:27 | t=ϖ⁻¹ has norm r⁻¹>1: outside unit disc and unit torus, inside full affine line and analytic G_m. Unit torus requires norm exactly 1. | Retained. |
| Sharp and direction, README:29 | Mixed characteristic p=2: (1+1)♯=0, but 1♯+1♯=2≠0. Equal characteristic: sharp=id. Space map tilt→untilt; cohomology map untilt→tilt. | No additive or ringed-space identification. |
| Coefficients, README:31 | ℓ=3,m=1,p=2: multiplication by p sends 1→2 invertibly. ℓ=p: ℤ/p top-class map sends 1→0 in mixed characteristic. m=0 would give the zero ring and is excluded. | Range retained. |
| Universes, README:31 | All chart objects live in fixed U; sheaves live in its successor. Enlarging U changes presentation, not N, coefficients or the computed chart rings. | No field-cardinality restriction introduced. |
| Finite type/flatness and coefficient generality | Ray model K°[t] is free over K°; localization K°[t,t⁻¹] is torsion-free. Mod ϖ can be nonreduced when valuation is nondiscrete, but the geometric residue-field fibre k[t] is reduced. | No conflation of mod-ϖ with reduced special fibre. |
| Identity and excluded irrelevant tests | q=1, rank-zero projection and identity field extension give identity character and coefficient maps. No target quantifies over arbitrary nonabelian groups or uses natural subtraction, polynomial degree, q=1 residue cardinality or out-of-range sequence indices. | Such tests are inapplicable, not counted as additional checks. |

### Target-by-target truth and context ledger

Each row covers the target paragraph and its proof route; the API and Check tables below give the individual identities and test cases. README line references throughout this report refer to `packages/AnalyticToricGeometryPartII/README.md` unless another file is named.

| Target/location | Standing context retained | Instances; computed values | Result/change |
|---|---|---|---|
| 0.1:113 invariant divisors | k field for native Weil divisors; arbitrary A only orbit ideals | ℙ¹ ray vector (2,−1) maps to 2D₊−D₋ with those same coefficients; zero-cone boundary group 0. | Retained; field normality supplied by declared gap. |
| 0.2:139 character weights | Integral D; local cone action only | W(dD∞), d=−1,0,1,2 gives ∅,{0},{0,1},{0,1,2}; local negative chart gives d+ℤ≤0. | Retained; negative/global-action controls included. |
| 0.3:162 sections and base change | Every commutative A; Cartier for line bundle; normal field fibre for native divisorial sheaf | Degree 1: S=A² and B⊗A A²=B². Degree −1: 0. S(O(1))⊗S(O(1)) has rank 4 while S(O(2)) has rank 3. | Product is not overclaimed to be an isomorphism. |
| 0.4:188 representatives | Field k; regularity for every invariant divisor Cartier | div(t−a)=[a]−D∞; x² has order 2; on G_m div(t)=0. | Multiplicity and nontrivial class retained. |
| 0.5:204 integral models | Regular fan; all A; actual K° frame | O(D∞) transition t⁻¹, inverse t, cocycle product 1. Integral unit u and inverse give abs(u)≤1 and ≥1, hence 1. | Frame sign and model dependence retained. |
| 0.6:228 class presentation | k field; regular for Pic=Cl; complete regular for free quotient | ℙ¹ coker(u↦(u,−u))=ℤ. Zero-cone map ℤ→0 has kernel ℤ. Separate rays matrix determinant 2, coker=ℤ/2. | Claimed exactness/freeness scopes retained. |
| 1.1:254 unit models | Complete nontrivially valued rank-one field; finite fan | Ray: K⟨t⟩; zero cone: K⟨t,t⁻¹⟩; overlap abs(t)=1. Norm of (1+ϖt)(1−ϖt) is 1=1·1. | Gauss plus ring and face localization retained. |
| 1.2:278 analytification | Complete fan for surjectivity; no regular/projective requirement | Ray omits ϖ⁻¹; ℙ¹ discs cover because either abs(t)≤1 or abs(t⁻¹)≤1; nonprojective complete fixture still proper. | No incomplete-fan equality asserted. |
| 1.3:292 powers | q integer ≥1, coefficients fixed | φ₂*φ₃*t=t⁶=φ₆*t; q=1 gives t; q=0 gives 1 and sends origin to 1. F₄ coefficient a stays a instead of a+1. | Relative/absolute distinction retained. |
| 2.1:327 perfected charts | Perfectoid K, residue p; arbitrary finite fan | Ray exponents ℤ[1/p]≥0; torus exponents ℤ[1/p]; rank-zero chart K. p·(u/p^(n+1))=u/pⁿ. | Correct projection direction; cone gap supplies perfection. |
| 2.2:348 perfected sections | p-local D; complete normed targets for extension; regular for invertibility | Infinite coefficients ϖⁿ at 1/pⁿ converge; constant coefficients do not. D=D∞/4,p=2 requires two squarings, yielding D∞. | Both divisor and weight denominators retained. |
| 2.3:379 cone and grading | Integer D; completeness only for degree-zero K | O(D∞): 0≤u≤j, (u,j)↦(u,j−u) is quadrant. D=0 complete: {0}×ℤ[1/p]; incomplete ray degree 0 has u≥0. | Negative degrees and completeness retained. |
| 2.4:400 completed algebra | Coefficient Gauss/c₀ grading, cone gap | D=0 gives perfected Laurent z; z·z⁻¹=1, while pointwise multiplication gives 0. Degree-zero subspace K, whole algebra larger. | Correct completion and multiplication. |
| 3.1:438 tilt | Same fan and specified coefficient tilt | Disc t has no inverse on either side; torus t has inverse on both; characteristic-p rank-zero tilt is identity. | Monomial-compatible identification retained. |
| 3.2:452 tilde-limit | Common ϖ, integral lattices, isometric maps; qcqs noetherian finite levels | χ^u maps to χ^(u/pⁿ); coefficient ϖ^a belongs to ϖ^b lattice iff a≥b before and after exponent change. Rank-zero tower constant. | Completed-colimit hypotheses are furnished. |
| 3.3:466 point-space limit | Characteristic-p perfection with coefficient twists identified | x gives ((x^(1/pⁿ))♯); next coordinate's pth power equals prior coordinate. 0 and ∞ give respective constant towers. | No extra root branch or stratum exchange. |
| 3.4:480 projection/naturality | Continuous isometric field embeddings; underlying spaces, not ringed morphism | π([λx_i])=[λ♯x_i♯]=[x_i♯]; π(x^p)=(x♯)^p. p=2, [1:1:0] maps to sum 2, not 0. | Coordinate, coefficient and map directions retained. |
| 3.5:504 étale-topos limit | Perfected cone charts; finite stages qcqs locally noetherian | Algebraically closed point: finite étale K-algebras K^r correspond to (K♭)^r for r=0,1,2. Torus t^(1/p) has separable degree 1. | Uses actual étale topoi; no unperfected-space equivalence. |
| 3.6:518 open restriction | Any open U, finite-stage opens φ⁻ⁿ(U) | U={abs(t−ϖ)≤r²}: t=ϖ gives 0≤r², image ϖ^p gives r>r². Empty/whole restrictions give empty/whole. | No stability hypothesis silently imposed. |
| 3.7:534 full affine line | Complement of ∞ in complete ℙ¹ model | ϖ⁻¹ is retained despite norm >1; 0 and 1 yield constant towers; ∞ alone removed. | Full-line comparison, not unit-disc substitute. |
| 4.1:558 power automorphism | Complete regular Σ, algebraically closed perfectoid K, ℓ≠p, m≥1 | ℙ¹ groups (Λ,0,Λ(−1)); actions (1,0,p). p=2,ℓ=3 top map 1→2; ℓ=p top map 0 in mixed characteristic. | Automorphism, not identity; specialization scope matches suppliers. |
| 4.2:574 cohomology | Same scope; constructed π pullback and cup contract | ℤ/3 tower with ×2 has direct limit ℤ/3, using [a,n]↦2^(−n)a; quotient by (2−1) would be 0. 1∪α=α on both sides. | Correct colimit and naturality direction. |
| 5.1:600 section tubes | Finite normalized equations; complete regular model; full adic zero locus | f=t: c=1 radius r; f=t²: threshold 2c radius r^c, threshold c radius r^(c/2). Empty equations give whole X. | Finite family and scale retained; constructible compactness applicable. |
| 5.2:616 nonzero dense approximation | Nonzero integral homogeneous f, c≥0, 0<ε<1; arbitrary specified dense k₀ | f=ϖ²,p=2,ε=1/2,c=0 permits zero since r²≤r^(1/2). c′>2 gives r^(5/2)<r², excluding zero. (a+bt^(1/p))^p=a^p+b^pt. | Nonzero coefficient and denominator-clearing arguments survive. |
| 5.3:633 hypersurface | Complete regular; nonempty effective Cartier Y; K need not algebraically closed | Class O(1) becomes O(p^N), nonzero; doubled equation class 2 becomes 2p^N. Rank-zero nonzero scalar has empty zero locus, hence is not input. | Nonempty proper output without projectivity; torsion-free Pic used correctly. |
| 6.1:660 Minkowski/Chow | Complete fan, 0≤j≤n, split torus orbits over k | ℙ¹ balancing [1,−1](a,a)=0; product fan (1,0,0,0) has vector (1,0). Wall sign gives m₋−m₊=1. | General operational rather than smooth-only Chow; split-orbit gap essential. |
| 6.2:686 displacement | a,b≥0, a+b≤n; quotient N/Nγ, finite index for contributing terms | On product fan (aF+bG)(cF+dG)=ad+bc. Vectors (1,0),(1,2) give index 2. Rank-zero empty product degree 1. | Quotient and multiplicities correct. |
| 6.3:702 positive refined degree | Smooth projective, exactly codimension c intersection, ample H | Two line classes in ℙ²: δ=1. Coincident replacement sections have support line L, localized class c₁(O(1)|L)[L], degree 1. p=2,N₁=N₂=1 gives 4. | Excess support argument uses refined Gysin, not properness of replacement intersection. |
| 6.4:719 closed dense-field model | Smooth projective, nonempty Y, c=codim Y, dense k₀ | Two distinct lines: n−c=0; coincident equations violate c=2 premise. Excess line can be cut to a point. x^p−t has length p after root extension, reduction length 1. | Dimension/support descend; geometric reduced structure not overclaimed. |

### Individual API identity/definition ledger

The context is exactly that of the corresponding target row above. All 60 bullets were evaluated; all results below retain the statement with no change. The examples also test zero/incorrect operations, reversed signs and coefficient loss.

| API line/section | Instance and computed result on each side | Result/change |
|---|---|---|
| 121 / 0.1 ray divisor map | ℙ¹ vector (2,−1) gives 2D₊−D₋; vector (0,0) gives 0. | Retained/none. |
| 122 / 0.1 coefficients | Coefficients of 2D₊−D₋ at D₊,D₋,[1] are 2,−1,0 respectively. | Retained/none. |
| 123 / 0.1 injectivity | (2,0) versus (1,0): coefficient at D₊ is 2 versus 1, so divisors unequal; equal vectors give equal sums. | Retained/none. |
| 124 / 0.1 character order | t²: pairings with +1,−1 are 2,−2, equal to orders at 0,∞. | Retained/none. |
| 145 / 0.2 weight subset | D∞ gives {0,1}; −D∞ gives ∅; zero-cone D=0 gives all M. | Retained/none. |
| 146 / 0.2 membership iff | D∞, u=1: inequalities (1,0)≥0; u=2: (2,−1), fails exactly second inequality. | Retained/none. |
| 147 / 0.2 principal shift | D∞+div(t)=D₊; W(D₊)={−1,0}={0,1}−1. | Retained/none. |
| 148 / 0.2 addition | 0∈W(D∞),1∈W(D∞); 0+1=1∈W(2D∞)={0,1,2}. | Retained/none. |
| 170 / 0.3 submodule | Over ℤ, S(D∞)=ℤχ⁰⊕ℤχ¹; χ² outside. Sum χ⁰+χ¹ remains inside. | Retained/none. |
| 171 / 0.3 basis | Over ℤ, χ⁰,χ¹ have coordinate vectors (1,0),(0,1); over zero ring all coefficients 0, with no nonzero-rank claim. | Retained/none. |
| 172 / 0.3 coefficient extensionality | 2+3t versus 2+4t differ at weight 1: 3≠4; identical coefficients reconstruct identical finite sums. | Retained/none. |
| 173 / 0.3 base change | ℤ→ℤ/2 sends 2+3t to t; (ℤ/2)⊗ℤ ℤ²=(ℤ/2)². Identity leaves (2,3); composed ring maps act on the same two coordinates. | Retained/none. |
| 174 / 0.3 associative unital product | ((2χ⁰)(3χ¹))(5χ⁰)=30χ¹=(2χ⁰)((3χ¹)(5χ⁰)); χ⁰·χ¹=χ¹. | Retained/none. |
| 210 / 0.5 character trivialization | O(D∞): local modules k[t]·1 and k[t⁻¹]·t, free rank 1 on both charts. | Retained/none. |
| 211 / 0.5 frame equations | m₊=0 pairs to 0=−a₊; m₋=1 pairs with −1 to −1=−a₋. | Retained/none. |
| 212 / 0.5 transitions/cocycle | m=(0,1,2): exponents −1,−1,2 sum 0; product t⁰=1. | Retained/none. |
| 213 / 0.5 coefficient change | ℤ→k[ε]/ε² preserves monomials 1,t and transition t⁻¹; ε times frame remains ε times that frame. | Retained/none. |
| 214 / 0.5 integral frames | abs(u)≤1 and abs(u⁻¹)≤1 imply abs(u)=1; u=ϖ has abs r<1 and its inverse fails integrality. | Retained/none. |
| 260 / 1.1 glued model | ℙ¹ gives two unit discs with common unit torus; rank-zero gives one Spa(K,K°). | Retained/none. |
| 261 / 1.1 cover | t=ϖ lies in positive disc, t=ϖ⁻¹ in negative disc, t=1 in both; no omitted point since norms are ordered. | Retained/none. |
| 262 / 1.1 face map | Invert t in formal disc: both t,t⁻¹ bounded, hence abs(t)=1. t=ϖ is excluded although t≠0. | Retained/none. |
| 263 / 1.1 field base change | Disc ring after extension is L⟨t⟩, torus L⟨t,t⁻¹⟩; image of ϖ still has norm r for isometric extension. | Retained/none. |
| 298 / 1.3 coefficient-linear map | φ₂*(a+bt)=a+bt²; constant a preserved. | Retained/none. |
| 299 / 1.3 monomial rule | u=−1 on torus,q=3 gives t⁻³; u=0 gives 1; coefficient a still a. | Retained/none. |
| 300 / 1.3 identity/composition | q=1 gives t; q=2,r=3 gives (t²)³=t⁶. | Retained/none. |
| 301 / 1.3 divisor pullback | φ₂*D∞=2D∞; frame t of O(D∞) pulls back to t² in O(2D∞). | Retained/none. |
| 333 / 2.1 perfectoid gluing | Perfected ℙ¹ charts have nonnegative/nonpositive p-local exponents; intersection all ℤ[1/p]. | Retained/none. |
| 334 / 2.1 perfected face | Disc t^(1/p) noninvertible; face makes its inverse available and forces abs(t)=1. | Retained/none. |
| 335 / 2.1 projection | pr_n*(t)=t^(1/pⁿ); pr_(n+1)*(t^p)=t^(p/p^(n+1))=t^(1/pⁿ). | Retained/none. |
| 336 / 2.1 functoriality | Fan map exponent u↦qu: (qu)/pⁿ=q(u/pⁿ); coefficient embedding sends aχ^u to image(a)χ^u on both routes. | Retained/none. |
| 356 / 2.2 c₀ module | Complete fan D=0 gives c₀({0},K)=K; D∞ admits coefficients ϖⁿ at 1/pⁿ, with tail r^(N+1). | Retained/none. |
| 357 / 2.2 norm/extensionality | f=1+ϖt has coefficients (1,ϖ), norm max(1,r)=1; g=1 differs at t by ϖ≠0. | Retained/none. |
| 358 / 2.2 dense extension | Truncations of Σϖⁿχ^(1/pⁿ) have error r^(N+1)→0. A continuous extension into the finite-support span would have that infinite coefficient family as its value, impossible. | Retained/none. |
| 359 / 2.2 bounded product | χ⁰·χ¹=χ¹ in Ŝ(2D∞), norm 1≤1·1. | Retained/none. |
| 360 / 2.2 denominator clearing | p=2,D=D∞/4: exponent 0 needs no clearing, divisor does; p²D=D∞ and (aχ⁰)^4=a⁴χ⁰. | Retained/none. |
| 361 / 2.2 singleton | ϖχ^(1/p) has coefficient ϖ at 1/p and 0 at 0; norm r. | Retained/none. |
| 362 / 2.2 coefficient sum | On torus take f_n=ϖⁿ at n and g_n=ϖⁿ at −n, n≥1: coefficient at 0 is Σϖ^(2n)=ϖ²/(1−ϖ²), norm r². | Retained/none; denominator has norm 1. |
| 363 / 2.2 monomial product | (ϖχ⁰)(ϖχ¹)=ϖ²χ¹; coefficient r² in norm, exponent 0+1=1 admissible for 2D∞. | Retained/none. |
| 364 / 2.2 norm bound | Previous singleton product has norm r²=r·r; zero input gives norm 0=0·r. | Retained/none. |
| 385 / 2.3 cone | D∞ inequalities u≥0,j−u≥0; (1,2) passes, (2,1) fails second by −1. | Retained/none. |
| 386 / 2.3 fibres | Degree 2 gives 0≤u≤2=W^p(2D∞); degree −1 gives ∅. | Retained/none. |
| 387 / 2.3 closure | (1,1)+(0,1)=(1,2); divide (1,1) by p to (1/p,1/p), both inequalities remain ≥0. | Retained/none. |
| 388 / 2.3 principal shift | D∞→D₊ via div(t): (u,j)↦(u−j,j) sends [0,j] to [−j,0], inverse adds j; degree unchanged. | Retained/none. |
| 406 / 2.4 graded/cone isometry | O(D∞): (u,j)=(1,2) maps to quadrant (1,1), preserving its coefficient and Gauss norm. | Retained/none. |
| 407 / 2.4 homogeneity | χ^(1,2) has only degree 2 support; χ^(1,2)+χ^(0,1) has degrees {1,2}, hence is not homogeneous. | Retained/none. |
| 408 / 2.4 degree pieces/products | Degree j=0 gives K; χ^(0,1)χ^(1,1)=χ^(1,2), degree 1+1=2, norms 1=1·1. | Retained/none. |
| 409 / 2.4 homogeneous sharp | Monomial coefficient a and exponent (u,j) map to coefficient a♯ at (u,j); degree j remains j. In characteristic p this is identity. | Retained/none. |
| 410 / 2.4 degree zero | Complete fan permits u=0 only: degree-zero K. Incomplete positive ray permits u=1, giving nonconstant χ¹. | Retained/none. |
| 411 / 2.4 singleton | ϖχ^(1,2) has only coefficient ϖ at (1,2); degree 2 and norm r. | Retained/none. |
| 412 / 2.4 convolution | D=0: f_n=ϖⁿ at (0,n), g_n=ϖⁿ at (0,−n) give coefficient ϖ²/(1−ϖ²) at (0,0), norm r². | Retained/none. |
| 413 / 2.4 monomial multiplication | χ^(0,1)χ^(0,−1)=χ^(0,0)=1; degree 1+(−1)=0. | Retained/none. |
| 486 / 3.4 level zero | Tower ((x^(1/pⁿ))♯) maps to x♯ at n=0. Reversing projection would lack a source element. | Retained/none. |
| 487 / 3.4 projective formula | [λ:λx] maps to [λ♯:λ♯x♯]=[1:x♯] for λ≠0. | Retained/none. |
| 488 / 3.4 power commutation | (x^p)♯=(x♯)^p; x=0,1 gives 0,1 on both routes. | Retained/none. |
| 489 / 3.4 strata | Zero coordinates stay 0 and nonzero coordinates stay nonzero under sharp; [0:1] and [1:0] retain their strata. | Retained/none. |
| 490 / 3.4 opens | Preimages of ∅,whole are ∅,whole. Disc bound abs(t)≤r pulls back to abs(t)≤abs(ϖ♭). | Retained/none. |
| 491 / 3.4 field naturality | For embedding ι, ι(x♯)=(ι♭x)♯; for x=ϖ♭ both equal ι(ϖ), norm r. Identity embedding gives identical π. | Retained/none. |
| 668 / 6.1 kernel | ℙ¹ relation [1,−1] has kernel {(a,a)}; vectors (1,1),(2,2) sum (3,3) still in kernel. | Retained/none. |
| 669 / 6.1 balancing iff | Product-fan vector (1,0,1,0) yields (0,0); vector (1,0,0,0) yields (1,0), excluded. | Retained/none. |
| 670 / 6.1 extensionality | ℙ¹ weights (1,1) and (2,2) differ at either cone; all equal coordinate values reconstruct equal integer functions. | Retained/none. |

### All 102 README Checks

The result of every row is **retained; no change**. The values column gives the discriminating computation, including the incorrect competing value where relevant. Check counts by layer are 19, 12, 16, 22, 6, 11 and 16, respectively.

| Check line / section | Instances and computed values | Result/change |
|---|---|---|
| 128 / 0.1 | t has orders +1 at 0 and −1 at ∞: vector (1,−1). | Retained/none. |
| 129 / 0.1 | Zero-cone ray index set ∅; ℤ^∅=0. | Retained/none. |
| 130 / 0.1 | D₊ coefficient 1 versus 2D₊ coefficient 2; distinct despite equal support. | Retained/none. |
| 131 / 0.1 | Closed map k[t]→k sends t→0; face map k[t]→k[t,t⁻¹] sends t to a unit. Quotient k differs from Laurent ring. | Retained/none. |
| 152 / 0.2 | d=0,1,2 gives weights {0},{0,1},{0,1,2}, cardinalities 1,2,3. | Retained/none. |
| 153 / 0.2 | d=−1 requires 0≤u≤−1, giving ∅. | Retained/none. |
| 154 / 0.2 | Rank-one zero cone has no inequalities, W=ℤ; 1 belongs, so W≠{0}. | Retained/none. |
| 178 / 0.3 | d=0,1,2 gives A,A²,A³; d=−1 gives 0, distinguished from A if A≠0. | Retained/none. |
| 179 / 0.3 | A=k[ε]/ε², D=0: constant section ε≠0 with square 0 remains. | Retained/none. |
| 180 / 0.3 | A=0 gives zero coefficient at every weight, hence module 0 for every D. | Retained/none. |
| 196 / 0.4 | Order of x² at 0 is 2; reduced support has order 1. | Retained/none. |
| 197 / 0.4 | t·t⁻¹=1 on G_m, no zeros/poles, divisor 0. | Retained/none. |
| 198 / 0.4 | div(t−a)=[a]−D∞ for a≠0; both [a] and D∞ have class/degree 1, not 0. | Retained/none. |
| 218 / 0.5 | d=1,2 gives frame weights (0,1),(0,2), transitions t⁻¹,t⁻². | Retained/none. |
| 219 / 0.5 | D=0: both frames 1, transition 1, trivial line bundle. | Retained/none. |
| 220 / 0.5 | c=1 preserves norm; c=ϖ multiplies norm by r<1, changing threshold locus. | Retained/none. |
| 236 / 0.6 | (a,b)↦a+b has kernel {(u,−u)}; d=1,2 powers give p^N,2p^N>0. | Retained/none. |
| 237 / 0.6 | ℤ→0 has kernel ℤ and cokernel 0; not injective. | Retained/none. |
| 238 / 0.6 | Matrix [[1,0],[1,2]] has determinant 2 and Smith factors 1,2; Pic=ℤ/2. | Retained/none. |
| 267 / 1.1 | Positive ray dual monoid ℕ gives K⟨t⟩; t=ϖ permitted, t=ϖ⁻¹ excluded. | Retained/none. |
| 268 / 1.1 | Zero cone dual monoid ℤ: t,t⁻¹ bounded implies norm(t)=1. Norm r≠1 excludes ϖ. | Retained/none. |
| 269 / 1.1 | ℙ¹ charts norm(t)≤1 or norm(t⁻¹)≤1; intersection norm(t)=1. | Retained/none. |
| 270 / 1.1 | Product 1−ϖ²t² has norm max(1,r²)=1=1·1; norm(t)=1, norm(ϖ⁻¹)=r⁻¹>1. | Retained/none. |
| 284 / 1.2 | Point ϖ⁻¹ has norm r⁻¹>1, lies in full A¹ and outside unit model. | Retained/none. |
| 285 / 1.2 | For a finite coordinate of norm >1, its reciprocal has norm <1; ∞ lies in reciprocal chart. Intersection norm 1. | Retained/none. |
| 286 / 1.2 | Fixed seven-ray fan is complete; its three strict support-function inequalities sum to 0>0. Proper unit comparison still onto. | Retained/none. |
| 305 / 1.3 | [0:1]↦[0:1], [1:0]↦[1:0], [1:x]↦[1:x^p]. | Retained/none. |
| 306 / 1.3 | q=1: aχ^u↦aχ^u, including u=0. | Retained/none. |
| 307 / 1.3 | Coefficient a maps to a; absolute Frobenius would give a^p. | Retained/none. |
| 308 / 1.3 | q=0: t↦1, origin↦1 rather than 0; excluded. | Retained/none. |
| 309 / 1.3 | In F₄, a²=a+1≠a; coefficient-linear image a, absolute image a+1. | Retained/none. |
| 340 / 2.1 | Positive ray: exponents 0,1/p,1,… admitted; exponent −1 excluded. | Retained/none. |
| 341 / 2.1 | Zero cone: t^(1/pⁿ)t^(−1/pⁿ)=1 for every n. | Retained/none. |
| 342 / 2.1 | Rank zero: exponent monoid {0}, algebra K, pr_n=id. | Retained/none. |
| 368 / 2.2 | For D∞, 1/pⁿ lies in [0,1] for n≥0; 2 outside. | Retained/none. |
| 369 / 2.2 | Complete fan,D=0: u≥0 and −u≥0 on ℙ¹ force u=0, so section module K. | Retained/none. |
| 370 / 2.2 | Constant-one family has infinitely many coefficients ≥1/2; not c₀. | Retained/none. |
| 371 / 2.2 | χ⁰χ¹=χ¹ with coefficient 1 at 1; pointwise product would have all coefficients 0. | Retained/none. |
| 372 / 2.2 | Coefficients ϖⁿ at distinct 1/pⁿ have tail norm r^(N+1)→0, infinitely many nonzero coefficients; no finite-support value can equal the limit. | Retained/none. |
| 373 / 2.2 | D∞/4,p=2: one power gives D∞/2, two give D∞; weight 0 stays integral throughout. | Retained/none. |
| 392 / 2.3 | D∞: inequalities u≥0 and j−u≥0; (1/2,1) satisfies, (2,1) fails. | Retained/none. |
| 393 / 2.3 | D=0 complete: u=0, j arbitrary; (0,−1) present. | Retained/none. |
| 394 / 2.3 | Incomplete positive ray degree 0 admits (1,0), hence nonconstant monomial and degree-zero algebra≠K. | Retained/none. |
| 417 / 2.4 | (u,j)↦(u,j−u); inverse (a,b)↦(a,a+b). (1,2)↔(1,1), total degree 2. | Retained/none. |
| 418 / 2.4 | D=0 complete: degree ±1 monomials z,z⁻¹ both exist, so R≠K; degree 0 consists of constants. | Retained/none. |
| 419 / 2.4 | Coefficient 1 in infinitely many degrees has infinitely many entries ≥1/2; outer c₀ fails. | Retained/none. |
| 420 / 2.4 | z·z⁻¹=1 of degree 0, versus pointwise coefficient product 0. | Retained/none. |
| 444 / 3.1 | Tilted and untilted disc both contain t and omit t⁻¹. | Retained/none. |
| 445 / 3.1 | Both torus algebras contain t^(±1/pⁿ), whose product is 1. | Retained/none. |
| 446 / 3.1 | Equal-characteristic rank-zero chart has K♭=K, sharp=id, same Spa point. | Retained/none. |
| 458 / 3.2 | Next-stage image of t^p is t^(p/p^(n+1))=t^(1/pⁿ), equal to prior projection. | Retained/none. |
| 459 / 3.2 | Weight a/pⁿ already occurs at level n. Finite truncation error r^(N+1)→0; coefficient-one infinite sum rejected. | Retained/none. |
| 460 / 3.2 | Constant rank-zero tower has underlying inverse limit the same one-point Spa(K,K°). | Retained/none. |
| 472 / 3.3 | ((x^(1/p^(n+1)))♯)^p=(x^(1/pⁿ))♯. | Retained/none. |
| 473 / 3.3 | x=0 gives (0,0,…); x=∞ gives (∞,∞,…). | Retained/none. |
| 474 / 3.3 | In perfect characteristic-p field, y^p=x has one root x^(1/p), not p distinct branches. | Retained/none. |
| 495 / 3.4 | 0♯=0; ∞ fixed projectively; finite coordinate x maps to x♯. | Retained/none. |
| 496 / 3.4 | (λx_i)♯=λ♯x_i♯, and projective common scalar λ♯≠0 cancels. | Retained/none. |
| 497 / 3.4 | p=2,[1:1:0]: tilted sum 0, untilted sharp-coordinate sum 2≠0. Finite-stage sums remain untilted polynomials. | Retained/none. |
| 498 / 3.4 | Equal characteristic: sharp=id, so preimage of Σx_i=0 satisfies the same equation, including [1:1:0] at p=2. | Retained/none. |
| 510 / 3.5 | Algebraically closed point finite étale degree r=0,1,2 gives empty algebra object, K, K×K; same degrees after tilt. | Retained/none. |
| 511 / 3.5 | t^(1/p) over K(t) has inseparable degree p, separable degree 1; no new separable branch. | Retained/none. |
| 512 / 3.5 | ℙ¹ unperfected chart lacks t^(1/p); perfected chart contains it. Site comparison does not erase this algebra distinction. | Retained/none. |
| 526 / 3.6 | π⁻¹(∅)=∅, π⁻¹(A)=A♭; corresponding restriction is empty/global respectively. | Retained/none. |
| 527 / 3.6 | t=ϖ: distance 0; image ϖ^p: distance abs(ϖ^p−ϖ)=r>r². | Retained/none. |
| 528 / 3.6 | φ_p⁻¹({∞})={∞}; complements on both sides are full affine lines. | Retained/none. |
| 540 / 3.7 | t=ϖ⁻¹ has norm r⁻¹>1, finite coordinate retained in line. | Retained/none. |
| 541 / 3.7 | Finite x gives only finite roots/sharp coordinates; ∞ produces constant ∞ tower and is excluded. | Retained/none. |
| 542 / 3.7 | x=0 and x=1 give respective constant towers and projections 0,1. | Retained/none. |
| 566 / 4.1 | ℙ¹ gives (H⁰,H¹,H²(Λ(1)))=(Λ,0,Λ), actions (1,0,p); p=2 modulo 3 sends 1→2. | Retained/none. |
| 567 / 4.1 | Mixed characteristic, Λ=ℤ/p: top map p·1=0, not bijective. | Retained/none. |
| 568 / 4.1 | Algebraically closed point: H⁰=Λ,H^i=0 for i>0; power map id. | Retained/none. |
| 582 / 4.2 | Corresponding ℙ¹ groups (Λ,0,Λ) on both sides; comparison is iso, transitions top multiplication by p. | Retained/none. |
| 583 / 4.2 | ×2 on ℤ/3 gives 1→2→1; direct limit ℤ/3, whereas quotient by p−1=1 gives 0. | Retained/none. |
| 584 / 4.2 | 1∪α=α; toric O(1) class is fixed in H²(Λ(1)) by field automorphism. | Retained/none. |
| 608 / 5.1 | f=t,c=1: t=0 gives 0≤r; t=1 gives 1>r. ϖ≠0. | Retained/none. |
| 609 / 5.1 | abs(t²)≤r^(2c) iff abs(t)≤r^c; threshold r^c instead gives radius r^(c/2)>r^c for c>0. | Retained/none. |
| 610 / 5.1 | abs(ϖf)≤r^c iff abs(f)≤r^(c−1); unit norm 1 preserves bound. Empty family intersection X. | Retained/none. |
| 624 / 5.2 | f=χ^u,g=χ^u gives error 0; truncated maxima identical. | Retained/none. |
| 625 / 5.2 | r²≤r^(1/2) permits g=0 at c=0; c′>2 yields required r²≤r^(5/2), false. | Retained/none. |
| 626 / 5.2 | (a+bt^(1/p))^p=a^p+b^pt; section degree p in O(pD∞); b≠0 makes nonconstant polynomial, not global scalar on ℙ¹. | Retained/none. |
| 627 / 5.2 | abs(b′−b)<abs(b) implies abs(b′)=abs(b)>0; dropping b instead gives error abs(b), too large. | Retained/none. |
| 641 / 5.3 | O(1) powered gives class p^N>0 in Pic(ℙ²)=ℤ, so nonzero section has nonempty proper zero set. | Retained/none. |
| 642 / 5.3 | f² has twice divisor class; threshold 2c preserves radius r^c, threshold c changes to r^(c/2). | Retained/none. |
| 643 / 5.3 | Seven-ray regular complete fixture has Pic free rank 7−3=4; boundary D₄ has nonzero class, so p^N[D₄]≠0. | Retained/none. |
| 644 / 5.3 | Rank-zero nonzero scalar is a unit, zero set ∅; fails nonempty-hypersurface premise. | Retained/none. |
| 674 / 6.1 | [1,−1](a,a)=0; [1,−1](1,0)=1≠0. | Retained/none. |
| 675 / 6.1 | Two rows applied to (a,b,a,b) yield (a−a,b−b)=(0,0). | Retained/none. |
| 676 / 6.1 | Rows applied to (1,0,0,0) give (1,0), not (0,0). | Retained/none. |
| 677 / 6.1 | m₋−m₊=1−0=1=1·b₊, b₊=1; degree +1. Reversing gives −1. | Retained/none. |
| 678 / 6.1 | Spec ℂ over ℝ: evaluation 1↦[ℂ:ℝ]=2 on ℤ, cokernel ℤ/2. Split Spec k: 1↦1. | Retained/none. |
| 694 / 6.2 | F²=G²=0,FG=1; (aF+bG)(cF+dG)=ad+bc. (2F)(F+G)=2; F²=0. | Retained/none. |
| 695 / 6.2 | Rank N=2, rank Nγ=1, quotient rank 1. Every vector of Nγ projects to 0, which is exceptional. | Retained/none. |
| 696 / 6.2 | det((1,0),(1,2))=2, giving multiplicity 2; rank-zero empty intersection product degree 1. | Retained/none. |
| 710 / 6.3 | Two disjoint fibres class 2F: (2F)(F+G)=2; each contributes 1; support has two components. | Retained/none. |
| 711 / 6.3 | Coincident lines have Z=L, excess O(1)|L; degree of c₁(O(1)|L)[L] is 1, despite dim Z=1 rather than expected 0. | Retained/none. |
| 712 / 6.3 | δ=1 becomes p^(N₁+N₂); p=2,N₁=N₂=1 gives 4, p=3 gives 9. c=0 on ℙ^n,H=O(1) gives 1, also n=0. | Retained/none. |
| 713 / 6.3 | x^p−t point over F_p(t) has degree p; effective zero cycle degree Σm_i[k_i:k]>0; zero cycle degree 0. | Retained/none. |
| 727 / 6.4 | Two fibres on surface: codim 1, dimension 1, components 2; claimed output dimension 1. | Retained/none. |
| 728 / 6.4 | c=0 gives Y=X, Z₀=X over k₀ and dim n; c=1 hypersurface gives n−1. | Retained/none. |
| 729 / 6.4 | Identical lines have c_equations=2,codim=1, excluded for c=2; distinct lines meet at point of codim 2, dimension 0. | Retained/none. |
| 730 / 6.4 | x^p−t irreducible over F_p(t): reduced field of degree p. After root extension: (x−t^(1/p))^p, length p; reduction length 1. | Retained/none. |

Additional proof-route controls: a finite field cannot be dense in a nontrivially valued field, since its nonzero elements have norm 1 while a sufficiently small ball around ϖ contains none; the dense k₀ in §6.4 is therefore infinite. If an approximate two-equation intersection in ℙ² is a line rather than a point, a further independent k₀-line cuts it to a nonempty dimension-zero scheme. For §5.1, continuity of any adic-point valuation and ϖⁿ→0 exclude a fixed nonzero f-value from all domains abs(f)≤abs(ϖⁿ); the intersection really is the full adic zero locus, including higher-rank points.

### Supplier resolution and ownership

The paths in this table are repository-relative. Main copies were used for existing roadmaps; the roadmap service's current head was read for open new suppliers. Repeated citations to the same section were resolved to the same current text, including the hypotheses, not to an older declaration spelling.

| Supplier / current location | Citations resolved and applicability |
|---|---|
| `TauCetiRoadmap/AnalyticToricGeometry/README.md:166`, Layer 0 | Lattice, cone, dual semigroup, regular monoid coordinates, finite fans and complex realization. Its scope stops before the coefficient-general divisor/sheaf and nonarchimedean constructions here. The Part II boundary is accurate. |
| `TauCetiRoadmap/ShimuraCompactifications/README.md`, C0.6–C0.7, C0.9, C0.16–C0.18 | Face quotient/ideal coefficient change, open face localization, arbitrary-ring finite-fan schemes, relative toric maps, complete-fan properness, regular boundary. Nonflat coefficient change and K° are admitted. General normal field fibres/regular smoothness are correctly declared as an extension rather than silently inferred from chart gluing. |
| `TauCetiRoadmap/AdicSpaces/README.md:354`, Layers 2–5 | Huber spectra, rational opens/localization, sheafiness under its hypotheses, native adic spaces and gluing. Classical toric affinoids are strongly noetherian; perfected ones instead use PerfectoidSpaces. |
| `TauCetiRoadmap/AdicSpacesPartII/README.md:7466`, R0.19.1–R0.19.3; R0.20.1 at 8136; R1 | Constructible compactness/pro-constructible subsets, completed-colimit criterion, analytification and properness. The criterion asks for compatible integral rings of definition, a common ideal/pseudouniformizer, finite-stage detection and sheafiness. Gauss-isometric character maps supply detection, not merely topological density. |
| `TauCetiRoadmap/AdicSpacesPartIII/README.md:4356`, R2.2–R2.4; R2.8 at 7480; R2.10 at 8158 | Admissible formal schemes over rank-one valuation rings, generic fibres, tubes, completion/good-reduction comparison and fractional section bounds. R2.8 explicitly admits nonnoetherian O_K and finite-type ideals; R2.10 allows higher-rank adic points. No noetherian formal-GAGA shortcut is used. |
| `TauCetiRoadmap/PerfectoidSpaces/README.md`, P1.30; P2.1–P2.3; P2.9–P2.12; P3.18/P3.20; P7.1–P7.3/P7.11–P7.13/P7.15 | Perfected polydiscs, homogeneous estimate, rational localization and tilting, étale sites, two tilde-limit notions, completed-colimit criterion, restrictions/gluing, perfection and topos/cohomology limits. Cone and homogeneous-cone extensions are declared. P7.15:17139 supplies residue-field conversion for qcqs locally noetherian finite levels; 17270 supplies inseparable-tower invariance. P7.12 handles arbitrary finite-stage opens, so §3.6 does not require U to be power-stable. |
| `TauCetiRoadmap/AdicEtaleGeometry/README.md:3259`, A1.6 | Actual small étale site, jointly surjective covers, geometric-morphism functoriality and comparison with the native strongly sheafy presentation. No bare sheaf category is substituted for the toric site. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, §§0.7, 0.17–0.18, 0.23a, 0.29, 2.1–2.2, 3.4, 4.13, 5.1–5.6 | Finite-type dimension/base change, CM/unmixedness and regular-sequence facts, universal-homeomorphism invariance, relative Frobenius with twisted target, site cohomology, Picard/divisor excision, regularity/Bertini, cycles/Chern/Gysin/product. §5.5:6818 has `Chow.gysin` for arbitrary base change of a regular immersion, with excess/self-intersection at 6823–6827 and zero-section homotopy at 6813. These suffice for excess support in §6.3. General split-orbit operational duality, ample cuts and Laurent divisor interfaces are declared extensions. |
| `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md`, A2.7, `ampleIntersectionPositive` | Current target is for proper schemes over every field and nonempty closed subschemes, not merely abelian varieties or geometrically integral schemes. Applying it to components with positive lengths gives positive effective-cycle degree, including degree-zero/inseparable points. |
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:540`, F.2.3 | Smooth ULA for finite lisse coefficients invertible on the base, including nonnoetherian bases; coherent cospecialization/base change. Constant ℤ/ℓ^m with ℓ≠p is in scope. |
| `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md`, §§1.1, 6.2, 8.2 | Ordinary derived/module-sheaf cohomology; natural proper specialization over strictly henselian valuation rings with separably closed fraction field; proper algebraic/analytic torsion comparison. The rank-one algebraically closed K° model meets the specialization hypotheses. General geometric-morphism/cup comparison is declared, not falsely claimed present. |
| `TauCetiRoadmap/WeilConjectures/README.md`, WC.6, “A smooth proper nonprojective threefold” | Same seven rays and ten maximal cones as FS25, integral model, properness/nonprojectivity and fixed-fan Chow ring. The package uses the fixture only as Checks; it does not redeclare it. Its general all-complete-fan operational theorem has different scope. |

The resolver's sole `Chow.gysin` warning is a false alarm for this package: the name is explicitly a SchemeAndStackFoundations target at the location above, not a claim about the pin. No supplier name/section drift was confirmed.

Object searches used the roadmap service as well as the supplied checkouts, with terms for finite-fan schemes, invariant divisors/sections, formal toric models, perfected cone algebras, toric towers/tilting, Minkowski weights, operational Chow and refined intersections. Relevant nearby owners were read:

- `TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:1720` at the supplied head extends finite fans to arbitrary small fans and makes Berkovich valued/tropical comparisons; its finite part imports ShimuraCompactifications C0.16–C0.17. It does not own the present unit adic model, sharp projection or complete-intersection approximation.
- `TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:981` at the supplied head studies Hilbert toroidal-boundary higher-direct-image vanishing and the arithmetic monomial splitting. It is not an owner of these general finite-fan tilting/approximation conclusions. The underlying monoid exponent map here is already imported from Mathlib and the integral toric map supplier.
- The indexed toric-root-cover matches in PerfectoidTowers, AInfCohomology and PadicHodgeTheory concern small framed torus covers, period sheaves and their cohomology. The present general cone perfectoidness is assigned to PerfectoidSpaces; the package's new content is fan gluing, divisor cones and the specified comparisons. Those indexed matches are not evidence of another owner of the global fan theorems.
- Board-package matches for Newton/toric divisor applications did not supply these all-fan constructions. No Lean fully qualified collision is possible here because the acceptance file declares nothing.

### Pinned-object ledger

| Pinned file/declaration | Read definition or hypothesis; concrete implication |
|---|---|
| `Mathlib/Geometry/Convex/Cone/Pointed.lean:33`, `PointedCone`; `Mathlib/Geometry/Convex/Cone/Basic.lean:298`, `ConvexCone.Salient` | Pointed-cone carrier alone does not prohibit lines; salience separately excludes x and −x for x≠0. The whole real line fails the package's extra condition. |
| `Mathlib/Algebra/MonoidAlgebra/Defs.lean`, `AddMonoidAlgebra`, Finsupp | Finite character sums and convolution already exist; no new carrier claimed. Distinct supports {0},{1} multiply at weight 1, not to zero. |
| `Mathlib/Algebra/MonoidAlgebra/MapDomain.lean:285`, `MonoidAlgebra.mapDomainRingHom` | Exponent-change ring homomorphism; applying `Multiplicative` admits the additive monoid. Coefficients stay fixed under u↦qu. |
| `Mathlib/Topology/ContinuousMap/ZeroAtInfty.lean:45`, `ZeroAtInftyContinuousMap` | Continuous map plus tending to zero along cocompact filter. Discreteness, norm and convolution are not fields; they are supplied explicitly in the toric application. |
| `TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean:83`, `TauCeti.Toric.Fan`; same file:246, `FanHom` | Finite fan/integral-lattice structure and compatible cone maps. Package separately excludes empty fans for nonempty geometric statements. |
| `TauCeti/Geometry/Toric/Algebraic/Cone/Basic.lean:147`, `IsToricCone`; `TauCeti/Geometry/Toric/Algebraic/Ray/Primitive.lean:167`, `primitiveGenerator` | Rationality/salience and integral lattice retained; primitive rays are not arbitrary nonzero rescalings. Replacing (1,0) by (2,0) would change orders and is not allowed. |
| `TauCeti/Geometry/Toric/Algebraic/DualSemigroup/Basic.lean:53`, `dualSemigroup`; `TauCeti/Geometry/Toric/Algebraic/DualSemigroup/Finiteness.lean:76`, `IsToricCone.fg_dualSemigroup` | Integral additive monoid and finite generation. Positive ray gives ℕ, zero cone ℤ; the latter has units and must not become a positive monoid. |
| `TauCeti/Geometry/Toric/Algebraic/Fan/Scheme.lean:136`, `Fan.algebraicRealization` | Complex realization, not arbitrary-A toric realization. This prevents using it as a false native carrier for Layer 0's general statements. |
| `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean:46`, `SchemeWeilDivisor`; `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Principal.lean:126`, `OrderSystem.ofScheme` | Integer Finsupp on codimension-one points; principal-order constructor needs integral Noetherian scheme. These hypotheses hold on the stipulated normal finite-type field fibres, not on arbitrary K° models. |
| `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Sheaf.lean:250`, `SchemeWeilDivisor.sheaf`; same file:642, `nonempty_iso_sheaf_of_linearlyEquivalent` | Integral locally Noetherian scheme and codimension-one DVRs; relevant standing contexts at 75, 82 and 565 were read. No silent arbitrary-base sheaf use. |
| `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:206`, `isAdic`; :231, `isAdic_restrict`; :244, `TauCeti.AdicSpace` | Sheafy and locally affinoid, with open restriction; no smooth/proper/toric/perfectoid origin in the carrier. This supports the module docstring's missing-construction explanation. |

No duplicate construction was found at the pins for the operational toric Chow comparison, arbitrary-coefficient global fan divisor modules, perfected cone completion/tilt, or toric sharp geometric morphism. Simple native support submodules and generic tensor or cohomology carriers do not construct these objects.

### Seven declared gaps: precision, minimality and declaration matching

Every slug has the same named supplier and the same `needs` sentence in `design/plan.json` and the README's Exact supplier contracts. There is no supplier `none`. Each group is one coherent interface with its required structure/compatibilities; none combines unrelated downstream theories. Existing specializations remain imports.

| Gap | Supplier/section | Missing extension and discriminating boundary; result |
|---|---|---|
| `toric-field-fibres` | ShimuraCompactifications C0.16–C0.18 | Normal geometrically integral nonempty finite-fan field fibres, ray prime divisors and regular-fan smoothness. Arbitrary-ring chart gluing alone supplies none of these field/regularity conclusions; zero-ring models are not assigned Weil primes. Matched; conditional contract retained. |
| `perfected-cone-algebras` | PerfectoidSpaces P1.30; P2.1 | Polydisc theorem extended to rational cones including lineality, Gauss plus ring and tilt. Zero cone yields Laurent exponents ±1, unlike a disc. The toric specialization in §2.1 does not re-prove the foundational theorem. Matched. |
| `homogeneous-cone-approximation` | PerfectoidSpaces P2.1 | Same explicit sharp estimate for graded cone algebras, integral f, rational c≥0, p-local ε∈(0,1), degree-zero K and specified ϖ. Incomplete positive-ray D=0 fails degree-zero K; zero g counterexample at coarse c is handled locally by §5.2. Matched. |
| `operational-chow-finite-orbits` | SchemeAndStackFoundations 5.1–5.6 | Operational theory and integral duality for split orbit strata, beyond the existing smooth intersection product. Spec ℂ over ℝ gives evaluation ×2, excluded; Spec k gives ×1. Fixed-fan WC.6 is not this general theorem. Matched. |
| `ample-generic-cuts` | SchemeAndStackFoundations 4.13 | Nonempty dimension-dropping cuts for every projective W over an infinite field, not only a smooth Bertini locus. Curve cuts have dimension 0; d=0 is excluded. Ample positivity alone does not supply a k-defined avoiding equation. Matched. |
| `geometric-morphism-cup-pullback` | ClassicalAdicEtaleCohomology 1.1 | Extend morphisms-of-spaces/site pullback to the actual geometric morphisms, preserving cup/coefficient-forgetting/field functoriality. π is cross-characteristic and has no ringed-space morphism; identity still sends 1∪α to α. Matched. |
| `split-torus-divisors` | SchemeAndStackFoundations 3.4 | Laurent UFD, exact units aχ^u and native class-group/excision interface for every field/lattice. On G_m, t unit and Cl=0; on ℙ¹ its divisor (1,−1) is nonzero. Generic monoid algebra and excision do not supply the complete torus calculation/bridge. Matched. |

### Source-locator ledger

All four works have one manifest key, legal cached text and explicit version information. Published SCH12 numbering, FS94 arXiv-v1 pagination, FS25 author version 0.27 and the Stacks tag/chapter-number distinction were checked. No missing text or extra source request was necessary. This ledger counts 27 explicit numbered locators: 16 SCH12, seven FS94 including equation (2.3), one FS25, three Stacks; proof paragraphs and the additional errata inspections are not inflated into that count.

| Source locator and source-text line | What was verified; computed scope/sign control |
|---|---|
| SCH12 Theorem 1.5, p.247; line 91 | Full affine-line inverse-power comparison. Point ϖ⁻¹ is finite and must survive. |
| SCH12 Theorem 1.13, pp.249–250; line 186 | Projective point-space and étale-topos comparison; homogeneous sharp ignores common nonzero scaling. |
| SCH12 Lemma 1.16, p.251; line 271 | Hypersurface approximation scope; class O(1) cannot yield a nowhere-vanishing section of O(p^N). |
| SCH12 Proposition 5.20, p.280; line 1344 | Perfected polydisc and monomial tilt; arbitrary cones are a declared extension, not silently attributed to this proposition. |
| SCH12 Lemma 6.5 and Remark 6.6, pp.288–290; lines 1752, 1759 | Homogeneous approximation with quantitative bound. For f=ϖ²,c=0,ε=1/2 zero is allowed; the package explicitly refines the threshold. |
| SCH12 Definition 7.14, Proposition 7.16, Theorem 7.17, pp.302–303; lines 2317, 2324, 2335 | Residue-field limit, étale base change and fibred-topos limit. Remark 7.15 at line 2322 was also read; finite toric levels and their limit are qcqs. |
| SCH12 Corollaries 7.18–7.19, p.303; lines 2344, 2349 | Abelian-sheaf cohomology continuity and purely inseparable tower invariance. ×2 colimit on ℤ/3 remains ℤ/3. |
| SCH12 Definition/Proposition 8.4, p.304; lines 2381–2386 | Invariant divisors, linear equivalence and ray inequalities; ℙ¹ div(t)=(1,−1), W(D∞)={0,1}. Arbitrary coefficient modules are the package's stated extension. |
| SCH12 unnumbered unit/perfected-model and power paragraphs, p.304; lines 2391, 2400, 2405, 2410 | Disc/torus distinction, perfected exponent rings and character power maps. Package completes ϖ-adically and retains fixed coefficients. |
| SCH12 Theorem 8.5, pp.304–305; lines 2414, 2422, 2428, 2430, 2433 | All five comparisons, direction of π and étale-topos conclusion; no false additive sharp claim. |
| SCH12 Proposition 8.6, pp.305–306; lines 2446, 2450 | Algebraically closed K, complete regular fan, prime-to-p torsion. Top cohomology power map ×p is invertible, not necessarily identity. |
| SCH12 Proposition 8.7 and proof, p.306; lines 2458, 2461, 2463, 2475, 2477, 2482, 2491 | Complete regular hypersurface approximation, homogeneous ring, integral frames and dense coefficients. The package corrects the powered-function slip and proves nonzero/nonempty output. |
| SCH12 Corollary 8.8 and proof, p.307; lines 2496, 2501 | Projective set-theoretic complete intersection, positivity and dimension cuts; disconnected/effectively nonreduced inputs retained. |
| FS94 Proposition 1.1, pp.4–5; line 117 | Orbit-closure cycle generators and character relations; relations preserve integer multiplicities. |
| FS94 Proposition 1.4 and Theorem 2.1, p.6; lines 176, 198, with weight definition at 188 | Kronecker duality and complete toric operational weights. Arbitrary-field split-orbit extension is expressly assigned to a supplier. |
| FS94 Corollary 2.4 and equation (2.3), p.7; lines 222, 230, 235 | Picard/degree-one weights and local-equation sign. With section frames, m₋−m₊=+1 on ℙ¹. |
| FS94 Proposition 3.1, p.10; lines 373, 385 | Diagonal cap/cup and degree evaluation. Package uses degrees a,b explicitly, avoiding the source's stray k in part (b). |
| FS94 Theorem 3.2 and proof, pp.11–13; lines 393, 400, 431, 491, 505 | Generic displacement in quotient N/Nγ and index multiplicities. Rank-two ray quotient has rank 1; determinant-2 term has multiplicity 2. |
| FS25 Example 4.1, pp.7–8; lines 299, 301, 303, 318 | Seven rays/ten cones match WC.6. Cone 123 has identity matrix; class relations eliminate D₁,D₂,D₃, leaving D₄,…,D₇ as a free basis. Three primitive relations sum to zero, contradicting simultaneous strict ample inequalities. |
| STACKS tags 020I, 035X, chapter pp.5–6; lines 223, 229 | Reduced versus geometrically reduced; x^p−t becomes a length-p thickening after adjoining a root. Perfect k₀ removes this obstruction. |
| STACKS Lemma 33.45.9, tag 0BEV, p.104; line 4827 | Positive ample intersection on a nonempty closed proper subscheme, including dimension zero. An inseparable degree-p point has degree p>0. |

Additional source-error witnesses were computed, not inferred solely from typography. For FS94's smooth-freeness assertion, the two separate primitive rays (1,0),(1,2) give smooth charts but Pic=ℤ/2. In its cup formula the second factor has degree q, so its cone index must have codimension q. For SCH12 Lemma 5.21, take equal-characteristic perfectoid R=K and x=ϖ^(1/p): the displayed product x·x♯=x² has norm <1, so norm(1−x²)=1, whereas x·(x⁻¹)♯=1 gives error 0. For SCH12's bijection-to-homeomorphism remark, X is the disjoint union of points indexed by ℤ_p and X_n the finite union indexed by ℤ/pⁿ: all residue-field maps are identities and the set map is bijective, but singleton {0} is open only in the discrete source. PerfectoidSpaces P7.15 explicitly retains qcqs to exclude this example. The package copies none of these slips.

## Not verifiable

- No Lean build or signature elaboration was run, as required by the read-only brief. There are zero declarations to elaborate; the supplied signature inventory likewise records no named declaration. This report does not certify implementation of the future constructions.
- The seven supplier gaps remain future contracts. Their matching declarations, scope and ownership were checked; existence of finished Lean proofs was not assumed.
- Ownership against open work without a supplied checkout was not exhaustively checked. The roadmap service's indexed object search was used, and current named supplier texts plus all 51 explicitly supplied sibling folders were inspected/search-resolved; this is not a claim to have read every open roadmap in full.
- Sources were checked in the supplied legal versions, not against inaccessible later printings or unpublished corrections. All cited texts were readable; there is no unresolved source request.

## Source issues

- **Error** in FS94 at §1 after Corollary 1.2, printed page 4 (FS94 line 132): the source says smooth toric varieties have free Chow groups; it should be restricted to smooth complete toric varieties, since separate rays (1,0),(1,2) give Picard group ℤ/2; affects nothing.
- **Misprint** in FS94 at Proposition 3.1(b), printed page 10 (FS94 line 383): the source says the second cup-product cone has codimension k−p, with k unspecified; it should be codimension q, the degree of the second factor; affects nothing.
- **Misprint** in FS94 at Theorem 3.2, printed page 11 (FS94 line 400): the source says exceptional displacement subspaces lie in the cone-span lattice; it should be the quotient N/N_gamma, as the proof specifies; affects nothing.
- **Misprint** in FS94 at proof of Lemma 3.4, printed page 12 (FS94 line 442): the source says the divisor calculation proves Lemma 3.3; it should be Lemma 3.4, the result being proved; affects nothing.
- **Misprint** in SCH12 at proof of Lemma 5.21, printed page 281 (SCH12 line 1377): the source says multiplying x by its approximate sharp lift gives an element close to one; it should be multiplication by the sharp of the inverse of that lift; affects nothing.
- **Error** in SCH12 at proof of Proposition 7.16, printed page 302 (SCH12 line 2327): the source says bijectivity and residue-field density imply the limit homeomorphism without compactness of X; it should be stated with X quasicompact and quasiseparated, as in the supplier's corrected criterion; affects nothing.
- **Misprint** in SCH12 at proof of Proposition 8.7, printed page 306 (SCH12 line 2491): the source says a large p-power yields a global regular function; it should be a section of the correspondingly powered divisor line bundle; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "7e4f54f033282df2f8c15c24b71439cbc6ef3d63", "job": "RT-AnalyticToricGeometryPartII~1a", "model": "gpt-6-astra", "worker": "chris-16"} -->
