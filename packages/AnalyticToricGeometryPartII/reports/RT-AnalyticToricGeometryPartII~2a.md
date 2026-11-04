<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1067#issuecomment-6420985629 -->
Red team round 2 pass a (codex) of abc9f0d

Verdict: accepted

No new package finding survived verification. The conclusion is conditional on the seven declared supplier contracts, not on their implementation.


## Round-one findings: verification at this head

Pass a raised no package findings. Pass b raised F01–F05; the repair report marks all five applied, none not actionable. The quotations below are from `packages/AnalyticToricGeometryPartII/README.md` at the reviewed head. Supplier line numbers below refer to the repository files; the service adds one header line when displaying a roadmap.

| Earlier finding | Status and repaired passage | Independently verified witness and regression test |
|---|---|---|
| F01: smoothness bundled into a supplier gap | **Repaired.** Line 55: “With the C0.9 and C0.16 open charts and the Mathlib smoothness facts above, XΣ,R is therefore smooth over R for every regular finite fan Σ and every R”. Line 57 omits smoothness. | `TauCetiRoadmap/ShimuraCompactifications/README.md:587` gives regular polynomial–Laurent coordinates. `Mathlib/RingTheory/Smooth/Basic.lean:539`, :558, :567 give smoothness, localization and composition. Over ℤ/4 the ray chart is (ℤ/4)[t], smooth; over 0 its spectrum is empty, also smooth. The empty fan is now excluded from geometric integrality. The cone (1,0),(1,2) is not regular. |
| F02: wrong face-map supplier sections | **Repaired.** Line 55: “C0.1 and C0.4–C0.5 supply the face projections, off-face ideals and stratum quotient algebras of closed strata, and C0.6–C0.7 their coefficient change”. | `TauCetiRoadmap/ShimuraCompactifications/README.md:403`, :461, :477, :498, :513: projection, kernel, quotient, coefficient naturality, ideal extension. For P=ℕ, F={0}, t↦0, quotient R; ℤ/4→ℤ/2 sends coefficient 2 to 0 on both paths. Lines 123, 141 and 254 use the corrected ownership. |
| F03: omitted existing ℙ¹ tower | **Repaired.** Line 73: “Only the ℙ¹ agreement Check of §3.2 uses them; the constructions of §§2.1 and 3.2 for an arbitrary fan and perfectoid K do not.” | `TauCetiRoadmap/PerfectoidTowers/README.md:1265`, :1575–1580 states the two charts and the ℂ_p Frobenius tower. The new line-467 Check computes t^(1/pⁿ)·t^(−1/pⁿ)=1. Identity transitions leave t unchanged and miss t^(1/p), unlike the power tower. Keeping the general construction independent of this special-case Check is appropriate. |
| F04: unnecessary degree-zero hypothesis | **Repaired.** Line 406: “For every Σ, R_D with this grading satisfies the hypotheses of the PerfectoidSpaces P2.1 homogeneous-cone contract; when Σ is complete its degree-zero part is K.” | SCH12 lines 1788–1807 use homogeneous components of degree d−di, not a one-dimensional degree-zero piece. For the positive ray and D=0, degree zero is K⟨t^(1/p^∞)⟩, whereas the complete zero-divisor example has degree zero K. Both remain in the revised cone contract. README line 77 and plan gaps[2] agree. |
| F05: missing Noetherian binder in native sheaf transport | **Repaired.** Line 45: “besides the hypotheses of `sheaf` it requires `IsNoetherian X` (quasi-compact and locally noetherian)”. | `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Sheaf.lean:565` introduces the instance used at :642; `Principal.lean:126` also requires it. A finite fan over k has finitely many finitely generated affine k-charts, hence the required noetherian scheme. ℙ¹ and Spec k satisfy it; arbitrary K° models are not passed to this theorem. |

The two revised gap sentences match `design/plan.json` exactly. The new PerfectoidTowers subsection interrupts the two PerfectoidSpaces gap paragraphs, but both paragraphs still explicitly name PerfectoidSpaces and their plan slugs; ownership is unambiguous. No mathematical regression was found in these five repairs.


## Verified sound

Read the whole README (766 lines) and Suggested.lean (48 lines), repository README and CONTRIBUTING rules, both earlier reviews, their repair report, plan gaps and source manifest. Inventory: **29 target subsections, 60 API bullets, 103 Checks, zero Lean declarations, 13 named roadmap suppliers, seven gaps, 27 numbered source locators verified**. The 54 expressly supplied sibling folders (108 README/Lean files) were searched by object, along with main, Completed, board packages and the roadmap-service index. No new finding numbered S01 is warranted.

The checked head is `abc9f0d`. The pinned revisions in `lake-manifest.json` are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The base-to-head diff has nine files, all under `packages/AnalyticToricGeometryPartII`. No package edits, git mutations, builds, elaboration or external writes were made. Only this report and scratch notes were written.

The dependency command on the reviewed README returned:

```text
depcheck: 56 roadmaps, 648 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. Internal inputs precede their uses. Section 3.4 first constructs the continuous projection; §3.5 adds its geometric morphism, so the reference to that following comparison is not a circular proof. Section 4.1 proves power-pullback invertibility by specialization before §4.2 invokes continuity. Layer 5 does not use Layer 4. The downstream consumers supply no input.

### Lean declarations and headline coverage

| Declaration | Section / variables / instances | Instance values / result / change |
|---|---|---|
| None | One namespace, no variables, definitions, instances, theorems or examples | Declaration count 0; admitted data 0; padding 0. No signature can lose a binder. No change. |

The single import is `Mathlib`. There is no `set_option`, `lemma`, placeholder, stand-in, or admitted example. There are no own backticked Lean names in the README. The complete missing-carrier list is in the module docstring. The generic complex toric scheme, c₀, Finsupp, tensor product and generic sheaf cohomology do not supply the actual objects of these headlines.

| README headline | Suggested.lean coverage | Pin audit / result |
|---|---|---|
| Integral sections/base change, invariant representatives, divisor-class presentation (§§0.3–0.6) | Lines 12–15 | The native fan scheme is over ℂ. The arbitrary-ring gluing, ray divisors and Cartier models are substantive constructions, not simple definitions on that scheme. No narrowed complex substitute required. |
| Unit-model/full-analytification comparison (§1.2) | Lines 16–18 | Native AdicSpace has neither formal completion nor the generic-fibre/analytification comparison. |
| Perfectoid charts and graded divisor algebra (§§2.1, 2.4) | Lines 19–20 | Completed cone algebra, perfectoidness and tilt are absent. A plain c₀ carrier does not state this result. |
| Five toric comparisons and full affine line (§§3.1–3.7) | Lines 21–26 | Missing actual tower, tilted spaces, small adic étale sites and geometric morphisms. A free inverse system would not test these headlines. |
| Power-pullback and torsion comparison (§§4.1–4.2) | Lines 27–29 | Missing those sites and their constructed comparison maps, despite generic cohomology carriers. |
| Tubes, nonzero dense approximation, hypersurfaces (§§5.1–5.3) | Lines 30–33 | Missing integral line-bundle domains, graded perfectoid algebra and sharp; scalar inequalities are not a substitute. |
| Operational Chow/Minkowski weights and product (§§6.1–6.2) | Lines 34–36 | A balancing kernel is statable, but the native operational Chow group and evaluation identification are missing. |
| Positive refined degree and complete-intersection approximation (§§6.3–6.4) | Lines 37–40 | Missing the geometric intersection and comparison constructions above. No statable omitted headline established. |

### Conventions and additional boundary computations

Here and in the ledgers below, r=|ϖ| with 0<r<1, D∞ is the negative-ray divisor of ℙ¹, and F,G are the ruling classes of ℙ¹×ℙ¹. The previous inventory was used as a checklist; the computations below were evaluated again against this head. “Retained” refers to the displayed instance and stated hypotheses, not a claim of a formal proof.

| Convention / context | Instances and computed values | Result / change |
|---|---|---|
| Finite, nonempty, salient fan | Rank 0: N=M=0, fan {0}, scheme Spec A. Empty fan: empty scheme, not integral. Whole line contains 1 and −1 and fails salience. | Retained; excluded cases identified. |
| Divisor and frame signs | div(t)=(1,−1); O(D∞) section weights (0,1), local-equation weights (0,−1), transition t⁻¹ and inverse t, product 1. | Retained in all layers. |
| Coefficients | Over k[ε]/ε², S(0)=k[ε]/ε² retains ε≠0 with ε²=0. Over 0 all modules vanish. Field Weil claims are not applied to either nonnormal base. | Retained. |
| Convolution | (2χ⁰)(3χ¹)=6χ¹, then times 5χ⁰ gives 30χ¹ in either association. Pointwise product would give 0. | Wrong model excluded. |
| p-locality | p=2 admits 1/2, excludes 1/3; p=3 admits 1/3, excludes 1/2. Rank-zero exponent set {0} stays {0}. | Retained. |
| Fractional threshold | c=1/2 means |f|²≤r, c=0 means |f|≤1; ϖ is a nonzero unit, so denominators do not vanish. | Valid for ordered value groups. |
| Sharp / direction | p=2 mixed characteristic: tilted 1+1=0 but sharp-coordinate sum 2≠0. Equal characteristic: sharp=id. Space map tilt→untilt; cohomology pullback reverses it. | Retained. |
| Singular chart in characteristics 2 and 3 | Cone rays (1,0),(1,2) yield k[a,b,c]/(b²−ac). At origin Jacobian (−c,2b,−a) is 0 in either characteristic. Regular-coordinate smoothness is not applied. | F01 repair retains arbitrary singular fans elsewhere. |
| Smoothness over nonreduced base | Regular ray over ℤ/4 gives (ℤ/4)[t], formally smooth and finitely presented; zero-ring spectrum empty; zero cone gives Laurent algebra. | New proof route survives non-field bases. |
| Complete versus projective | FS25 relations give three strict ample inequalities whose sum is 0>0; complete unit-model comparison still applies. | Completeness is not silently strengthened. |
| Higher-rank point tubes | If a nonzero value a satisfied a≤|ϖ|ⁿ for every n, continuity at 0 and ϖⁿ→0 would eventually give |ϖ|ⁿ<a, contradiction. | Intersection of all tubes equals the full adic zero locus. |
| Dense field and cutting | A finite subfield has |a|=1 for a≠0 and misses a small ball about ϖ; thus dense k₀ is infinite. An excess line in ℙ² meets an independent k₀-line in dimension 0 and degree 1. | The generic-cut contract applies. |
| Identity / universes / inapplicable cases | q=1 gives χᵘ↦χᵘ; identity field extension preserves every coefficient. Fixed-universe enlargement does not alter these values. No target quantifies over nonsplit tori, arbitrary nonabelian groups, arbitrary non-qcqs fans, or a polynomial degree at 0. | Such unrelated cases are not counted as tests. |

### Target-by-target truth and context ledger

Each row covers the target paragraph and its proof route; the API and Check tables below give the individual identities and test cases. README line references throughout this report refer to `packages/AnalyticToricGeometryPartII/README.md` unless another file is named.

| Target/location | Standing context retained | Instances; computed values | Result/change |
|---|---|---|---|
| 0.1:119 invariant divisors | k field for native Weil divisors; arbitrary A only orbit ideals | ℙ¹ ray vector (2,−1) maps to 2D₊−D₋ with those same coefficients; zero-cone boundary group 0. | Retained; field normality supplied by declared gap. |
| 0.2:145 character weights | Integral D; local cone action only | W(dD∞), d=−1,0,1,2 gives ∅,{0},{0,1},{0,1,2}; local negative chart gives d+ℤ≤0. | Retained; negative/global-action controls included. |
| 0.3:168 sections and base change | Every commutative A; Cartier for line bundle; normal field fibre for native divisorial sheaf | Degree 1: S=A² and B⊗A A²=B². Degree −1: 0. S(O(1))⊗S(O(1)) has rank 4 while S(O(2)) has rank 3. | Product is not overclaimed to be an isomorphism. |
| 0.4:194 representatives | Field k; regularity for every invariant divisor Cartier | div(t−a)=[a]−D∞; x² has order 2; on G_m div(t)=0. | Multiplicity and nontrivial class retained. |
| 0.5:210 integral models | Regular fan; all A; actual K° frame | O(D∞) transition t⁻¹, inverse t, cocycle product 1. Integral unit u and inverse give abs(u)≤1 and ≥1, hence 1. | Frame sign and model dependence retained. |
| 0.6:234 class presentation | k field; regular for Pic=Cl; complete regular for free quotient | ℙ¹ coker(u↦(u,−u))=ℤ. Zero-cone map ℤ→0 has kernel ℤ. Separate rays matrix determinant 2, coker=ℤ/2. | Claimed exactness/freeness scopes retained. |
| 1.1:260 unit models | Complete nontrivially valued rank-one field; finite fan | Ray: K⟨t⟩; zero cone: K⟨t,t⁻¹⟩; overlap abs(t)=1. Norm of (1+ϖt)(1−ϖt) is 1=1·1. | Gauss plus ring and face localization retained. |
| 1.2:284 analytification | Complete fan for surjectivity; no regular/projective requirement | Ray omits ϖ⁻¹; ℙ¹ discs cover because either abs(t)≤1 or abs(t⁻¹)≤1; nonprojective complete fixture still proper. | No incomplete-fan equality asserted. |
| 1.3:298 powers | q integer ≥1, coefficients fixed | φ₂*φ₃*t=t⁶=φ₆*t; q=1 gives t; q=0 gives 1 and sends origin to 1. F₄ coefficient a stays a instead of a+1. | Relative/absolute distinction retained. |
| 2.1:333 perfected charts | Perfectoid K, residue p; arbitrary finite fan | Ray exponents ℤ[1/p]≥0; torus exponents ℤ[1/p]; rank-zero chart K. p·(u/p^(n+1))=u/pⁿ. | Correct projection direction; cone gap supplies perfection. |
| 2.2:354 perfected sections | p-local D; complete normed targets for extension; regular for invertibility | Infinite coefficients ϖⁿ at 1/pⁿ converge; constant coefficients do not. D=D∞/4,p=2 requires two squarings, yielding D∞. | Both divisor and weight denominators retained. |
| 2.3:385 cone and grading | Integer D; completeness only for degree-zero K | O(D∞): 0≤u≤j, (u,j)↦(u,j−u) is quadrant. D=0 complete: {0}×ℤ[1/p]; incomplete ray degree 0 has u≥0. | Negative degrees and completeness retained. |
| 2.4:406 completed algebra | Coefficient Gauss/c₀ grading, cone gap | D=0 gives perfected Laurent z; z·z⁻¹=1, while pointwise multiplication gives 0. Degree-zero subspace K, whole algebra larger. | Correct completion and multiplication. |
| 3.1:444 tilt | Same fan and specified coefficient tilt | Disc t has no inverse on either side; torus t has inverse on both; characteristic-p rank-zero tilt is identity. | Monomial-compatible identification retained. |
| 3.2:458 tilde-limit | Common ϖ, integral lattices, isometric maps; qcqs noetherian finite levels | χ^u maps to χ^(u/pⁿ); coefficient ϖ^a belongs to ϖ^b lattice iff a≥b before and after exponent change. Rank-zero tower constant. | Completed-colimit hypotheses are furnished. |
| 3.3:473 point-space limit | Characteristic-p perfection with coefficient twists identified | x gives ((x^(1/pⁿ))♯); next coordinate's pth power equals prior coordinate. 0 and ∞ give respective constant towers. | No extra root branch or stratum exchange. |
| 3.4:487 projection/naturality | Continuous isometric field embeddings; underlying spaces, not ringed morphism | π([λx_i])=[λ♯x_i♯]=[x_i♯]; π(x^p)=(x♯)^p. p=2, [1:1:0] maps to sum 2, not 0. | Coordinate, coefficient and map directions retained. |
| 3.5:511 étale-topos limit | Perfected cone charts; finite stages qcqs locally noetherian | Algebraically closed point: finite étale K-algebras K^r correspond to (K♭)^r for r=0,1,2. Torus t^(1/p) has separable degree 1. | Uses actual étale topoi; no unperfected-space equivalence. |
| 3.6:525 open restriction | Any open U, finite-stage opens φ⁻ⁿ(U) | U={abs(t−ϖ)≤r²}: t=ϖ gives 0≤r², image ϖ^p gives r>r². Empty/whole restrictions give empty/whole. | No stability hypothesis silently imposed. |
| 3.7:541 full affine line | Complement of ∞ in complete ℙ¹ model | ϖ⁻¹ is retained despite norm >1; 0 and 1 yield constant towers; ∞ alone removed. | Full-line comparison, not unit-disc substitute. |
| 4.1:565 power automorphism | Complete regular Σ, algebraically closed perfectoid K, ℓ≠p, m≥1 | ℙ¹ groups (Λ,0,Λ(−1)); actions (1,0,p). p=2,ℓ=3 top map 1→2; ℓ=p top map 0 in mixed characteristic. | Automorphism, not identity; specialization scope matches suppliers. |
| 4.2:581 cohomology | Same scope; constructed π pullback and cup contract | ℤ/3 tower with ×2 has direct limit ℤ/3, using [a,n]↦2^(−n)a; quotient by (2−1) would be 0. 1∪α=α on both sides. | Correct colimit and naturality direction. |
| 5.1:607 section tubes | Finite normalized equations; complete regular model; full adic zero locus | f=t: c=1 radius r; f=t²: threshold 2c radius r^c, threshold c radius r^(c/2). Empty equations give whole X. | Finite family and scale retained; constructible compactness applicable. |
| 5.2:623 nonzero dense approximation | Nonzero integral homogeneous f, c≥0, 0<ε<1; arbitrary specified dense k₀ | f=ϖ²,p=2,ε=1/2,c=0 permits zero since r²≤r^(1/2). c′>2 gives r^(5/2)<r², excluding zero. (a+bt^(1/p))^p=a^p+b^pt. | Nonzero coefficient and denominator-clearing arguments survive. |
| 5.3:640 hypersurface | Complete regular; nonempty effective Cartier Y; K need not algebraically closed | Class O(1) becomes O(p^N), nonzero; doubled equation class 2 becomes 2p^N. Rank-zero nonzero scalar has empty zero locus, hence is not input. | Nonempty proper output without projectivity; torsion-free Pic used correctly. |
| 6.1:667 Minkowski/Chow | Complete fan, 0≤j≤n, split torus orbits over k | ℙ¹ balancing [1,−1](a,a)=0; product fan (1,0,0,0) has vector (1,0). Wall sign gives m₋−m₊=1. | General operational rather than smooth-only Chow; split-orbit gap essential. |
| 6.2:693 displacement | a,b≥0, a+b≤n; quotient N/Nγ, finite index for contributing terms | On product fan (aF+bG)(cF+dG)=ad+bc. Vectors (1,0),(1,2) give index 2. Rank-zero empty product degree 1. | Quotient and multiplicities correct. |
| 6.3:709 positive refined degree | Smooth projective, exactly codimension c intersection, ample H | Two line classes in ℙ²: δ=1. Coincident replacement sections have support line L, localized class c₁(O(1)|L)[L], degree 1. p=2,N₁=N₂=1 gives 4. | Excess support argument uses refined Gysin, not properness of replacement intersection. |
| 6.4:726 closed dense-field model | Smooth projective, nonempty Y, c=codim Y, dense k₀ | Two distinct lines: n−c=0; coincident equations violate c=2 premise. Excess line can be cut to a point. x^p−t has length p after root extension, reduction length 1. | Dimension/support descend; geometric reduced structure not overclaimed. |

### Individual API identity/definition ledger

The context is exactly that of the corresponding target row above. All 60 bullets were evaluated; all results below retain the statement with no change. The examples also test zero/incorrect operations, reversed signs and coefficient loss.

| API line/section | Instance and computed result on each side | Result/change |
|---|---|---|
| 127 / 0.1 ray divisor map | ℙ¹ vector (2,−1) gives 2D₊−D₋; vector (0,0) gives 0. | Retained/none. |
| 128 / 0.1 coefficients | Coefficients of 2D₊−D₋ at D₊,D₋,[1] are 2,−1,0 respectively. | Retained/none. |
| 129 / 0.1 injectivity | (2,0) versus (1,0): coefficient at D₊ is 2 versus 1, so divisors unequal; equal vectors give equal sums. | Retained/none. |
| 130 / 0.1 character order | t²: pairings with +1,−1 are 2,−2, equal to orders at 0,∞. | Retained/none. |
| 151 / 0.2 weight subset | D∞ gives {0,1}; −D∞ gives ∅; zero-cone D=0 gives all M. | Retained/none. |
| 152 / 0.2 membership iff | D∞, u=1: inequalities (1,0)≥0; u=2: (2,−1), fails exactly second inequality. | Retained/none. |
| 153 / 0.2 principal shift | D∞+div(t)=D₊; W(D₊)={−1,0}={0,1}−1. | Retained/none. |
| 154 / 0.2 addition | 0∈W(D∞),1∈W(D∞); 0+1=1∈W(2D∞)={0,1,2}. | Retained/none. |
| 176 / 0.3 submodule | Over ℤ, S(D∞)=ℤχ⁰⊕ℤχ¹; χ² outside. Sum χ⁰+χ¹ remains inside. | Retained/none. |
| 177 / 0.3 basis | Over ℤ, χ⁰,χ¹ have coordinate vectors (1,0),(0,1); over zero ring all coefficients 0, with no nonzero-rank claim. | Retained/none. |
| 178 / 0.3 coefficient extensionality | 2+3t versus 2+4t differ at weight 1: 3≠4; identical coefficients reconstruct identical finite sums. | Retained/none. |
| 179 / 0.3 base change | ℤ→ℤ/2 sends 2+3t to t; (ℤ/2)⊗ℤ ℤ²=(ℤ/2)². Identity leaves (2,3); composed ring maps act on the same two coordinates. | Retained/none. |
| 180 / 0.3 associative unital product | ((2χ⁰)(3χ¹))(5χ⁰)=30χ¹=(2χ⁰)((3χ¹)(5χ⁰)); χ⁰·χ¹=χ¹. | Retained/none. |
| 216 / 0.5 character trivialization | O(D∞): local modules k[t]·1 and k[t⁻¹]·t, free rank 1 on both charts. | Retained/none. |
| 217 / 0.5 frame equations | m₊=0 pairs to 0=−a₊; m₋=1 pairs with −1 to −1=−a₋. | Retained/none. |
| 218 / 0.5 transitions/cocycle | m=(0,1,2): exponents −1,−1,2 sum 0; product t⁰=1. | Retained/none. |
| 219 / 0.5 coefficient change | ℤ→k[ε]/ε² preserves monomials 1,t and transition t⁻¹; ε times frame remains ε times that frame. | Retained/none. |
| 220 / 0.5 integral frames | abs(u)≤1 and abs(u⁻¹)≤1 imply abs(u)=1; u=ϖ has abs r<1 and its inverse fails integrality. | Retained/none. |
| 266 / 1.1 glued model | ℙ¹ gives two unit discs with common unit torus; rank-zero gives one Spa(K,K°). | Retained/none. |
| 267 / 1.1 cover | t=ϖ lies in positive disc, t=ϖ⁻¹ in negative disc, t=1 in both; no omitted point since norms are ordered. | Retained/none. |
| 268 / 1.1 face map | Invert t in formal disc: both t,t⁻¹ bounded, hence abs(t)=1. t=ϖ is excluded although t≠0. | Retained/none. |
| 269 / 1.1 field base change | Disc ring after extension is L⟨t⟩, torus L⟨t,t⁻¹⟩; image of ϖ still has norm r for isometric extension. | Retained/none. |
| 304 / 1.3 coefficient-linear map | φ₂*(a+bt)=a+bt²; constant a preserved. | Retained/none. |
| 305 / 1.3 monomial rule | u=−1 on torus,q=3 gives t⁻³; u=0 gives 1; coefficient a still a. | Retained/none. |
| 306 / 1.3 identity/composition | q=1 gives t; q=2,r=3 gives (t²)³=t⁶. | Retained/none. |
| 307 / 1.3 divisor pullback | φ₂*D∞=2D∞; frame t of O(D∞) pulls back to t² in O(2D∞). | Retained/none. |
| 339 / 2.1 perfectoid gluing | Perfected ℙ¹ charts have nonnegative/nonpositive p-local exponents; intersection all ℤ[1/p]. | Retained/none. |
| 340 / 2.1 perfected face | Disc t^(1/p) noninvertible; face makes its inverse available and forces abs(t)=1. | Retained/none. |
| 341 / 2.1 projection | pr_n*(t)=t^(1/pⁿ); pr_(n+1)*(t^p)=t^(p/p^(n+1))=t^(1/pⁿ). | Retained/none. |
| 342 / 2.1 functoriality | Fan map exponent u↦qu: (qu)/pⁿ=q(u/pⁿ); coefficient embedding sends aχ^u to image(a)χ^u on both routes. | Retained/none. |
| 362 / 2.2 c₀ module | Complete fan D=0 gives c₀({0},K)=K; D∞ admits coefficients ϖⁿ at 1/pⁿ, with tail r^(N+1). | Retained/none. |
| 363 / 2.2 norm/extensionality | f=1+ϖt has coefficients (1,ϖ), norm max(1,r)=1; g=1 differs at t by ϖ≠0. | Retained/none. |
| 364 / 2.2 dense extension | Truncations of Σϖⁿχ^(1/pⁿ) have error r^(N+1)→0. A continuous extension into the finite-support span would have that infinite coefficient family as its value, impossible. | Retained/none. |
| 365 / 2.2 bounded product | χ⁰·χ¹=χ¹ in Ŝ(2D∞), norm 1≤1·1. | Retained/none. |
| 366 / 2.2 denominator clearing | p=2,D=D∞/4: exponent 0 needs no clearing, divisor does; p²D=D∞ and (aχ⁰)^4=a⁴χ⁰. | Retained/none. |
| 367 / 2.2 singleton | ϖχ^(1/p) has coefficient ϖ at 1/p and 0 at 0; norm r. | Retained/none. |
| 368 / 2.2 coefficient sum | On torus take f_n=ϖⁿ at n and g_n=ϖⁿ at −n, n≥1: coefficient at 0 is Σϖ^(2n)=ϖ²/(1−ϖ²), norm r². | Retained/none; denominator has norm 1. |
| 369 / 2.2 monomial product | (ϖχ⁰)(ϖχ¹)=ϖ²χ¹; coefficient r² in norm, exponent 0+1=1 admissible for 2D∞. | Retained/none. |
| 370 / 2.2 norm bound | Previous singleton product has norm r²=r·r; zero input gives norm 0=0·r. | Retained/none. |
| 391 / 2.3 cone | D∞ inequalities u≥0,j−u≥0; (1,2) passes, (2,1) fails second by −1. | Retained/none. |
| 392 / 2.3 fibres | Degree 2 gives 0≤u≤2=W^p(2D∞); degree −1 gives ∅. | Retained/none. |
| 393 / 2.3 closure | (1,1)+(0,1)=(1,2); divide (1,1) by p to (1/p,1/p), both inequalities remain ≥0. | Retained/none. |
| 394 / 2.3 principal shift | D∞→D₊ via div(t): (u,j)↦(u−j,j) sends [0,j] to [−j,0], inverse adds j; degree unchanged. | Retained/none. |
| 412 / 2.4 graded/cone isometry | O(D∞): (u,j)=(1,2) maps to quadrant (1,1), preserving its coefficient and Gauss norm. | Retained/none. |
| 413 / 2.4 homogeneity | χ^(1,2) has only degree 2 support; χ^(1,2)+χ^(0,1) has degrees {1,2}, hence is not homogeneous. | Retained/none. |
| 414 / 2.4 degree pieces/products | Degree j=0 gives K; χ^(0,1)χ^(1,1)=χ^(1,2), degree 1+1=2, norms 1=1·1. | Retained/none. |
| 415 / 2.4 homogeneous sharp | Monomial coefficient a and exponent (u,j) map to coefficient a♯ at (u,j); degree j remains j. In characteristic p this is identity. | Retained/none. |
| 416 / 2.4 degree zero | Complete fan permits u=0 only: degree-zero K. Incomplete positive ray permits u=1, giving nonconstant χ¹. | Retained/none. |
| 417 / 2.4 singleton | ϖχ^(1,2) has only coefficient ϖ at (1,2); degree 2 and norm r. | Retained/none. |
| 418 / 2.4 convolution | D=0: f_n=ϖⁿ at (0,n), g_n=ϖⁿ at (0,−n) give coefficient ϖ²/(1−ϖ²) at (0,0), norm r². | Retained/none. |
| 419 / 2.4 monomial multiplication | χ^(0,1)χ^(0,−1)=χ^(0,0)=1; degree 1+(−1)=0. | Retained/none. |
| 493 / 3.4 level zero | Tower ((x^(1/pⁿ))♯) maps to x♯ at n=0. Reversing projection would lack a source element. | Retained/none. |
| 494 / 3.4 projective formula | [λ:λx] maps to [λ♯:λ♯x♯]=[1:x♯] for λ≠0. | Retained/none. |
| 495 / 3.4 power commutation | (x^p)♯=(x♯)^p; x=0,1 gives 0,1 on both routes. | Retained/none. |
| 496 / 3.4 strata | Zero coordinates stay 0 and nonzero coordinates stay nonzero under sharp; [0:1] and [1:0] retain their strata. | Retained/none. |
| 497 / 3.4 opens | Preimages of ∅,whole are ∅,whole. Disc bound abs(t)≤r pulls back to abs(t)≤abs(ϖ♭). | Retained/none. |
| 498 / 3.4 field naturality | For embedding ι, ι(x♯)=(ι♭x)♯; for x=ϖ♭ both equal ι(ϖ), norm r. Identity embedding gives identical π. | Retained/none. |
| 675 / 6.1 kernel | ℙ¹ relation [1,−1] has kernel {(a,a)}; vectors (1,1),(2,2) sum (3,3) still in kernel. | Retained/none. |
| 676 / 6.1 balancing iff | Product-fan vector (1,0,1,0) yields (0,0); vector (1,0,0,0) yields (1,0), excluded. | Retained/none. |
| 677 / 6.1 extensionality | ℙ¹ weights (1,1) and (2,2) differ at either cone; all equal coordinate values reconstruct equal integer functions. | Retained/none. |

### All 103 README Checks

The result of every row is **retained; no change**. The values column gives the discriminating computation, including the incorrect competing value where relevant. Check counts by layer are 19, 12, 16, 23, 6, 11 and 16, respectively.

| Check line / section | Instances and computed values | Result/change |
|---|---|---|
| 134 / 0.1 | t has orders +1 at 0 and −1 at ∞: vector (1,−1). | Retained/none. |
| 135 / 0.1 | Zero-cone ray index set ∅; ℤ^∅=0. | Retained/none. |
| 136 / 0.1 | D₊ coefficient 1 versus 2D₊ coefficient 2; distinct despite equal support. | Retained/none. |
| 137 / 0.1 | Closed map k[t]→k sends t→0; face map k[t]→k[t,t⁻¹] sends t to a unit. Quotient k differs from Laurent ring. | Retained/none. |
| 158 / 0.2 | d=0,1,2 gives weights {0},{0,1},{0,1,2}, cardinalities 1,2,3. | Retained/none. |
| 159 / 0.2 | d=−1 requires 0≤u≤−1, giving ∅. | Retained/none. |
| 160 / 0.2 | Rank-one zero cone has no inequalities, W=ℤ; 1 belongs, so W≠{0}. | Retained/none. |
| 184 / 0.3 | d=0,1,2 gives A,A²,A³; d=−1 gives 0, distinguished from A if A≠0. | Retained/none. |
| 185 / 0.3 | A=k[ε]/ε², D=0: constant section ε≠0 with square 0 remains. | Retained/none. |
| 186 / 0.3 | A=0 gives zero coefficient at every weight, hence module 0 for every D. | Retained/none. |
| 202 / 0.4 | Order of x² at 0 is 2; reduced support has order 1. | Retained/none. |
| 203 / 0.4 | t·t⁻¹=1 on G_m, no zeros/poles, divisor 0. | Retained/none. |
| 204 / 0.4 | div(t−a)=[a]−D∞ for a≠0; both [a] and D∞ have class/degree 1, not 0. | Retained/none. |
| 224 / 0.5 | d=1,2 gives frame weights (0,1),(0,2), transitions t⁻¹,t⁻². | Retained/none. |
| 225 / 0.5 | D=0: both frames 1, transition 1, trivial line bundle. | Retained/none. |
| 226 / 0.5 | c=1 preserves norm; c=ϖ multiplies norm by r<1, changing threshold locus. | Retained/none. |
| 242 / 0.6 | (a,b)↦a+b has kernel {(u,−u)}; d=1,2 powers give p^N,2p^N>0. | Retained/none. |
| 243 / 0.6 | ℤ→0 has kernel ℤ and cokernel 0; not injective. | Retained/none. |
| 244 / 0.6 | Matrix [[1,0],[1,2]] has determinant 2 and Smith factors 1,2; Pic=ℤ/2. | Retained/none. |
| 273 / 1.1 | Positive ray dual monoid ℕ gives K⟨t⟩; t=ϖ permitted, t=ϖ⁻¹ excluded. | Retained/none. |
| 274 / 1.1 | Zero cone dual monoid ℤ: t,t⁻¹ bounded implies norm(t)=1. Norm r≠1 excludes ϖ. | Retained/none. |
| 275 / 1.1 | ℙ¹ charts norm(t)≤1 or norm(t⁻¹)≤1; intersection norm(t)=1. | Retained/none. |
| 276 / 1.1 | Product 1−ϖ²t² has norm max(1,r²)=1=1·1; norm(t)=1, norm(ϖ⁻¹)=r⁻¹>1. | Retained/none. |
| 290 / 1.2 | Point ϖ⁻¹ has norm r⁻¹>1, lies in full A¹ and outside unit model. | Retained/none. |
| 291 / 1.2 | For a finite coordinate of norm >1, its reciprocal has norm <1; ∞ lies in reciprocal chart. Intersection norm 1. | Retained/none. |
| 292 / 1.2 | Fixed seven-ray fan is complete; its three strict support-function inequalities sum to 0>0. Proper unit comparison still onto. | Retained/none. |
| 311 / 1.3 | [0:1]↦[0:1], [1:0]↦[1:0], [1:x]↦[1:x^p]. | Retained/none. |
| 312 / 1.3 | q=1: aχ^u↦aχ^u, including u=0. | Retained/none. |
| 313 / 1.3 | Coefficient a maps to a; absolute Frobenius would give a^p. | Retained/none. |
| 314 / 1.3 | q=0: t↦1, origin↦1 rather than 0; excluded. | Retained/none. |
| 315 / 1.3 | In F₄, a²=a+1≠a; coefficient-linear image a, absolute image a+1. | Retained/none. |
| 346 / 2.1 | Positive ray: exponents 0,1/p,1,… admitted; exponent −1 excluded. | Retained/none. |
| 347 / 2.1 | Zero cone: t^(1/pⁿ)t^(−1/pⁿ)=1 for every n. | Retained/none. |
| 348 / 2.1 | Rank zero: exponent monoid {0}, algebra K, pr_n=id. | Retained/none. |
| 374 / 2.2 | For D∞, 1/pⁿ lies in [0,1] for n≥0; 2 outside. | Retained/none. |
| 375 / 2.2 | Complete fan,D=0: u≥0 and −u≥0 on ℙ¹ force u=0, so section module K. | Retained/none. |
| 376 / 2.2 | Constant-one family has infinitely many coefficients ≥1/2; not c₀. | Retained/none. |
| 377 / 2.2 | χ⁰χ¹=χ¹ with coefficient 1 at 1; pointwise product would have all coefficients 0. | Retained/none. |
| 378 / 2.2 | Coefficients ϖⁿ at distinct 1/pⁿ have tail norm r^(N+1)→0, infinitely many nonzero coefficients; no finite-support value can equal the limit. | Retained/none. |
| 379 / 2.2 | D∞/4,p=2: one power gives D∞/2, two give D∞; weight 0 stays integral throughout. | Retained/none. |
| 398 / 2.3 | D∞: inequalities u≥0 and j−u≥0; (1/2,1) satisfies, (2,1) fails. | Retained/none. |
| 399 / 2.3 | D=0 complete: u=0, j arbitrary; (0,−1) present. | Retained/none. |
| 400 / 2.3 | Incomplete positive ray degree 0 admits (1,0), hence nonconstant monomial and degree-zero algebra≠K. | Retained/none. |
| 423 / 2.4 | (u,j)↦(u,j−u); inverse (a,b)↦(a,a+b). (1,2)↔(1,1), total degree 2. | Retained/none. |
| 424 / 2.4 | D=0 complete: degree ±1 monomials z,z⁻¹ both exist, so R≠K; degree 0 consists of constants. | Retained/none. |
| 425 / 2.4 | Coefficient 1 in infinitely many degrees has infinitely many entries ≥1/2; outer c₀ fails. | Retained/none. |
| 426 / 2.4 | z·z⁻¹=1 of degree 0, versus pointwise coefficient product 0. | Retained/none. |
| 450 / 3.1 | Tilted and untilted disc both contain t and omit t⁻¹. | Retained/none. |
| 451 / 3.1 | Both torus algebras contain t^(±1/pⁿ), whose product is 1. | Retained/none. |
| 452 / 3.1 | Equal-characteristic rank-zero chart has K♭=K, sharp=id, same Spa point. | Retained/none. |
| 464 / 3.2 | Next-stage image of t^p is t^(p/p^(n+1))=t^(1/pⁿ), equal to prior projection. | Retained/none. |
| 465 / 3.2 | Weight a/pⁿ already occurs at level n. Finite truncation error r^(N+1)→0; coefficient-one infinite sum rejected. | Retained/none. |
| 466 / 3.2 | Constant rank-zero tower has underlying inverse limit the same one-point Spa(K,K°). | Retained/none. |
| 467 / 3.2 | ℂ_p, ℙ¹: root coordinates t^(1/pⁿ) and t^(−1/pⁿ) have product 1; successor transition gives t^(p/p^(n+1))=t^(1/pⁿ). Identity transitions give t at every level and miss the root t^(1/p). | Retained/none. |
| 479 / 3.3 | ((x^(1/p^(n+1)))♯)^p=(x^(1/pⁿ))♯. | Retained/none. |
| 480 / 3.3 | x=0 gives (0,0,…); x=∞ gives (∞,∞,…). | Retained/none. |
| 481 / 3.3 | In perfect characteristic-p field, y^p=x has one root x^(1/p), not p distinct branches. | Retained/none. |
| 502 / 3.4 | 0♯=0; ∞ fixed projectively; finite coordinate x maps to x♯. | Retained/none. |
| 503 / 3.4 | (λx_i)♯=λ♯x_i♯, and projective common scalar λ♯≠0 cancels. | Retained/none. |
| 504 / 3.4 | p=2,[1:1:0]: tilted sum 0, untilted sharp-coordinate sum 2≠0. Finite-stage sums remain untilted polynomials. | Retained/none. |
| 505 / 3.4 | Equal characteristic: sharp=id, so preimage of Σx_i=0 satisfies the same equation, including [1:1:0] at p=2. | Retained/none. |
| 517 / 3.5 | Algebraically closed point finite étale degree r=0,1,2 gives empty algebra object, K, K×K; same degrees after tilt. | Retained/none. |
| 518 / 3.5 | t^(1/p) over K(t) has inseparable degree p, separable degree 1; no new separable branch. | Retained/none. |
| 519 / 3.5 | ℙ¹ unperfected chart lacks t^(1/p); perfected chart contains it. Site comparison does not erase this algebra distinction. | Retained/none. |
| 533 / 3.6 | π⁻¹(∅)=∅, π⁻¹(A)=A♭; corresponding restriction is empty/global respectively. | Retained/none. |
| 534 / 3.6 | t=ϖ: distance 0; image ϖ^p: distance abs(ϖ^p−ϖ)=r>r². | Retained/none. |
| 535 / 3.6 | φ_p⁻¹({∞})={∞}; complements on both sides are full affine lines. | Retained/none. |
| 547 / 3.7 | t=ϖ⁻¹ has norm r⁻¹>1, finite coordinate retained in line. | Retained/none. |
| 548 / 3.7 | Finite x gives only finite roots/sharp coordinates; ∞ produces constant ∞ tower and is excluded. | Retained/none. |
| 549 / 3.7 | x=0 and x=1 give respective constant towers and projections 0,1. | Retained/none. |
| 573 / 4.1 | ℙ¹ gives (H⁰,H¹,H²(Λ(1)))=(Λ,0,Λ), actions (1,0,p); p=2 modulo 3 sends 1→2. | Retained/none. |
| 574 / 4.1 | Mixed characteristic, Λ=ℤ/p: top map p·1=0, not bijective. | Retained/none. |
| 575 / 4.1 | Algebraically closed point: H⁰=Λ,H^i=0 for i>0; power map id. | Retained/none. |
| 589 / 4.2 | Corresponding ℙ¹ groups (Λ,0,Λ) on both sides; comparison is iso, transitions top multiplication by p. | Retained/none. |
| 590 / 4.2 | ×2 on ℤ/3 gives 1→2→1; direct limit ℤ/3, whereas quotient by p−1=1 gives 0. | Retained/none. |
| 591 / 4.2 | 1∪α=α; toric O(1) class is fixed in H²(Λ(1)) by field automorphism. | Retained/none. |
| 615 / 5.1 | f=t,c=1: t=0 gives 0≤r; t=1 gives 1>r. ϖ≠0. | Retained/none. |
| 616 / 5.1 | abs(t²)≤r^(2c) iff abs(t)≤r^c; threshold r^c instead gives radius r^(c/2)>r^c for c>0. | Retained/none. |
| 617 / 5.1 | abs(ϖf)≤r^c iff abs(f)≤r^(c−1); unit norm 1 preserves bound. Empty family intersection X. | Retained/none. |
| 631 / 5.2 | f=χ^u,g=χ^u gives error 0; truncated maxima identical. | Retained/none. |
| 632 / 5.2 | r²≤r^(1/2) permits g=0 at c=0; c′>2 yields required r²≤r^(5/2), false. | Retained/none. |
| 633 / 5.2 | (a+bt^(1/p))^p=a^p+b^pt; section degree p in O(pD∞); b≠0 makes nonconstant polynomial, not global scalar on ℙ¹. | Retained/none. |
| 634 / 5.2 | abs(b′−b)<abs(b) implies abs(b′)=abs(b)>0; dropping b instead gives error abs(b), too large. | Retained/none. |
| 648 / 5.3 | O(1) powered gives class p^N>0 in Pic(ℙ²)=ℤ, so nonzero section has nonempty proper zero set. | Retained/none. |
| 649 / 5.3 | f² has twice divisor class; threshold 2c preserves radius r^c, threshold c changes to r^(c/2). | Retained/none. |
| 650 / 5.3 | Seven-ray regular complete fixture has Pic free rank 7−3=4; boundary D₄ has nonzero class, so p^N[D₄]≠0. | Retained/none. |
| 651 / 5.3 | Rank-zero nonzero scalar is a unit, zero set ∅; fails nonempty-hypersurface premise. | Retained/none. |
| 681 / 6.1 | [1,−1](a,a)=0; [1,−1](1,0)=1≠0. | Retained/none. |
| 682 / 6.1 | Two rows applied to (a,b,a,b) yield (a−a,b−b)=(0,0). | Retained/none. |
| 683 / 6.1 | Rows applied to (1,0,0,0) give (1,0), not (0,0). | Retained/none. |
| 684 / 6.1 | m₋−m₊=1−0=1=1·b₊, b₊=1; degree +1. Reversing gives −1. | Retained/none. |
| 685 / 6.1 | Spec ℂ over ℝ: evaluation 1↦[ℂ:ℝ]=2 on ℤ, cokernel ℤ/2. Split Spec k: 1↦1. | Retained/none. |
| 701 / 6.2 | F²=G²=0,FG=1; (aF+bG)(cF+dG)=ad+bc. (2F)(F+G)=2; F²=0. | Retained/none. |
| 702 / 6.2 | Rank N=2, rank Nγ=1, quotient rank 1. Every vector of Nγ projects to 0, which is exceptional. | Retained/none. |
| 703 / 6.2 | det((1,0),(1,2))=2, giving multiplicity 2; rank-zero empty intersection product degree 1. | Retained/none. |
| 717 / 6.3 | Two disjoint fibres class 2F: (2F)(F+G)=2; each contributes 1; support has two components. | Retained/none. |
| 718 / 6.3 | Coincident lines have Z=L, excess O(1)|L; degree of c₁(O(1)|L)[L] is 1, despite dim Z=1 rather than expected 0. | Retained/none. |
| 719 / 6.3 | δ=1 becomes p^(N₁+N₂); p=2,N₁=N₂=1 gives 4, p=3 gives 9. c=0 on ℙ^n,H=O(1) gives 1, also n=0. | Retained/none. |
| 720 / 6.3 | x^p−t point over F_p(t) has degree p; effective zero cycle degree Σm_i[k_i:k]>0; zero cycle degree 0. | Retained/none. |
| 734 / 6.4 | Two fibres on surface: codim 1, dimension 1, components 2; claimed output dimension 1. | Retained/none. |
| 735 / 6.4 | c=0 gives Y=X, Z₀=X over k₀ and dim n; c=1 hypersurface gives n−1. | Retained/none. |
| 736 / 6.4 | Identical lines have c_equations=2,codim=1, excluded for c=2; distinct lines meet at point of codim 2, dimension 0. | Retained/none. |
| 737 / 6.4 | x^p−t irreducible over F_p(t): reduced field of degree p. After root extension: (x−t^(1/p))^p, length p; reduction length 1. | Retained/none. |



### Supplier, ownership and gap audit

All 13 supplier families named in the README were resolved this round. Main copies were used for existing roadmaps; the roadmap service supplied the current heads of new roadmap folders absent from main. The resolver’s three warnings are not missing declarations: `Chow.gysin` is a SchemeAndStackFoundations target, and the two `PerfectoidSpace` names are expressly README-only Checks of PerfectoidTowers.

| Supplier and repository locator | Contract checked / application and boundary |
|---|---|
| `TauCetiRoadmap/AnalyticToricGeometry/README.md:166`, Layer 0 | Integral lattices, salient rational cones, primitive rays, dual semigroups and regular coordinates, finite fans, face localization and complex gluing. The common integral model is an extension assigned to ShimuraCompactifications; this package does not re-plan the parent. |
| `TauCetiRoadmap/ShimuraCompactifications/README.md:403`, C0.1, C0.4–C0.7, C0.9–C0.10, C0.16–C0.18 | Projection/ideal/quotient versus open localization are distinct. Arbitrary-ring chart gluing, regular polynomial–Laurent coordinates and complete-fan properness apply over K°. C0.17’s converse excludes empty source/base, but only its forward properness implication is used here. |
| `TauCetiRoadmap/AdicSpaces/README.md:354`, Layers 2–5 | Affinoid spectra, rational localization, sheafiness and gluing. Ordinary toric Tate charts are strongly noetherian; perfected charts use the perfectoid supplier. |
| `TauCetiRoadmap/AdicSpacesPartII/README.md:7466`, R0.19.1–R0.19.3; :8136 R0.20.1; :8968 R1.3 and R1.6 | Constructible compactness, pro-constructible calculus, completed-colimit criterion, full analytification and properness. Gauss-isometric monomial inclusions detect membership in ϖⁿ lattices at the original level, satisfying the extra colimit hypothesis. |
| `TauCetiRoadmap/AdicSpacesPartIII/README.md:4356`, R2.2–R2.4; :7480 R2.8; :8158 R2.10 | Nonnoetherian rank-one admissible formal models, generic fibres, good reduction and powered rational bounds. Toric models have monomial bases, so flatness/ϖ-torsion-freeness hold. The rank-one base restriction does not discard higher-rank adic points. |
| `TauCetiRoadmap/PerfectoidSpaces/README.md:5423`, P1.30; :6049 P2.1–P2.3; P2.9–P2.12; P3.18/P3.20; P7.1–P7.3, P7.11–P7.15 | Polydiscs and Laurent variants, homogeneous approximation, rational localization/tilting, actual étale sites, chart-dense and residue-field tilde-limits. P7.12 permits arbitrary finite-stage opens; P7.15 uses qcqs locally noetherian finite levels and gives cohomology continuity. Cone extensions are expressly gaps. |
| `TauCetiRoadmap/PerfectoidTowers/README.md:1265`, P8.15; :1575 P8.19 | ℂ_p Frobenius ℙ¹ tower and perfected chart agreement. The actual constant-tower negative control occurs at :1546; the package does not claim it for characteristic p, where the represented-functor notion behaves differently. |
| `TauCetiRoadmap/AdicEtaleGeometry/README.md:3259`, A1.6 | Small étale category, jointly surjective covers on all points, and inverse/direct image functors; native strongly sheafy and generalized presentations are compatible. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:755`, §§0.7, 0.17–0.18, 0.23a, 0.29, 2.1–2.2, 3.4, 4.13, 5.1–5.6 | Dimension and field extension, regular sequences/CM, universal-homeomorphism invariance, relative Frobenius, ordinary cohomology, Picard/excision and Chow operations. At :6818 `Chow.gysin i f` has arbitrary f and regular i; the zero section has normal bundle E, not E∨. Thus coincident replacement equations are in scope. |
| `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1230`, A2.7 | `ampleIntersectionPositive` applies over every field to proper schemes. Effective-cycle positivity is a sum weighted by positive generic lengths; inseparable points contribute their full residue degree. |
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:540`, F.2.3 | Smooth ULA for finite lisse invertible coefficients and coherent cospecialization. Λ=ℤ/ℓᵐ with ℓ≠p is admissible over K°. |
| `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:91`, §1.1; :3125 §6.2; §8.2 | Module/abelian-sheaf cohomology, proper specialization over strictly henselian valuation rings with separably closed fraction field, and proper algebraic comparison. Isometric extensions of algebraically closed rank-one fields induce surjections on their two-point valuation spectra, as required by §6.2’s base-change clause. The extra geometric-morphism/cup interface is declared. |
| `TauCetiRoadmap/WeilConjectures/README.md:1071`, WC.6 | The seven-ray, ten-maximal-cone smooth nonprojective fixture and its fixed-fan Chow presentation. Used here as a Check; the new operational theorem ranges over every complete fan, including singular ones. |

Object-based searches found no second owner of the package’s general toric comparisons. The existing ℙ¹ specialization is now cited. `TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:1720` extends finite-fan schemes to small fans and Berkovich valued comparisons; its :159 imports the same C0.16 carrier. It does not construct this adic unit model or sharp approximation. ClassicalAdicEtaleCohomologyPartII’s framed-torus field-extension contract concerns period cohomology, not these fan-space comparisons. Board design matches are downstream Newton-divisor/weight-monodromy applications or fixed signed fans, not general replacement owners. No fully qualified Lean collision is possible in the empty acceptance file.

| Declared gap | Matching declaration and minimality check | Instance / result |
|---|---|---|
| toric-field-fibres | README:57 and plan gaps[0], ShimuraCompactifications C0.16–C0.18 | Field-fibre normality/integrality and ray primes are not stated in the chart-gluing target. Smoothness is removed and obtained from C0.10. Rank-zero Spec k passes; empty fan excluded. |
| perfected-cone-algebras | README:75 and plan gaps[1], PerfectoidSpaces P1.30; P2.1 | P1.30 gives polydiscs/Laurent variants, not arbitrary rational cone monoids. Lineality supplies invertible characters; the zero-dimensional cone gives K. |
| homogeneous-cone-approximation | README:77 and plan gaps[2], PerfectoidSpaces P2.1 | Explicit inequality, degree, integral f, rational c, p-local ε and ϖ assumptions. P2.1 only covers the polydisc. The positive-ray D=0 example now passes despite nonconstant degree zero. |
| operational-chow-finite-orbits | README:89 and plan gaps[3], SchemeAndStackFoundations 5.1–5.6 | The generic operational ring and split-orbit Kronecker pairing extend the smooth product. Spec ℂ/ℝ gives pairing ×2 and fails the split-stratum premise; Spec k gives ×1. |
| ample-generic-cuts | README:91 and plan gaps[4], SchemeAndStackFoundations 4.13 | Asks for k-defined avoiding cuts of arbitrary projective W, including singular and nonreduced W; existing smooth Bertini and positive degree alone do not supply this exact interface. A curve cut has nonempty dimension 0; d=0 is excluded. |
| geometric-morphism-cup-pullback | README:105 and plan gaps[5], ClassicalAdicEtaleCohomology 1.1 | Extends the existing space/site maps to the constructed geometric morphism, including cup and coefficient-forgetting compatibility. Identity pulls 1∪α to α; cross-characteristic π is not a ringed-space map. |
| split-torus-divisors | README:87 and plan gaps[6], SchemeAndStackFoundations 3.4 | Arbitrary finite-rank Laurent UFD, exact units and native divisor-class/excision bridge. Existing monoid algebra and single-variable Laurent units do not state this full bridge. On G_m, t is a unit and Cl=0; on ℙ¹, div(t)=(1,−1). |

All seven suppliers are named and earlier. Slugs and needs sentences agree between README and plan. Each asks for one coherent mathematical interface with its necessary structure and compatibilities; no unrelated compound gap or unowned gap was found. Their absence as finished implementations is not a finding.

### Pinned definitions and binder audit

| Pinned location | Actual context / implication |
|---|---|
| `Mathlib/Geometry/Convex/Cone/Pointed.lean:33`; `Mathlib/Geometry/Convex/Cone/Basic.lean:298` | PointedCone contains zero; salience is separate. The whole line is pointed but fails salience. |
| `Mathlib/Algebra/MonoidAlgebra/Defs.lean`; `Mathlib/Algebra/MonoidAlgebra/MapDomain.lean:285` | Finite-support convolution and exponent-change ring map are native. χ⁰χ¹=χ¹ and q·0=0 preserve unit/coefficients. |
| `Mathlib/Topology/ContinuousMap/ZeroAtInfty.lean:45` | `ZeroAtInftyContinuousMap` extends ContinuousMap with `Tendsto toFun (cocompact α) (𝓝 0)`. No discrete topology or convolution is bundled; the package supplies both. |
| `Mathlib/RingTheory/Smooth/Basic.lean:111`, :539, :558, :567; `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:59`, :68 | Formal smoothness of polynomial rings; smooth=formally smooth+finite presentation; localization and composition; local scheme property. Finite presentation for finitely many variables is `Algebra.FinitePresentation.mvPolynomial`, `Mathlib/RingTheory/FinitePresentation.lean:189`. |
| `TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean:83`; `Cone/Basic.lean:147` | Fan records finite cones and integral lattice; the package adds nonemptiness. IsToricCone explicitly records salience, so “pointed” is not being misused. |
| `TauCeti/Geometry/Toric/Algebraic/Ray/Primitive.lean:167`; `DualSemigroup/Basic.lean:53`; `DualSemigroup/Finiteness.lean:76` | Primitive generator and dual monoid carry the integral-lattice/cone hypotheses. Primitive v=1 gives order 1 for t; rescaling to 2 would be wrong. |
| `TauCeti/Geometry/Toric/Algebraic/Fan/Scheme.lean:136` | The scheme glues complex affine coordinate rings. It supplies no arbitrary-A carrier for the Layer 0 headlines. |
| `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean:46`; `Principal.lean:126` | Integer Finsupp on codimension-one points; the principal-order constructor explicitly requires integral Noetherian X. |
| `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Sheaf.lean:75`, :82, :250, :565, :642 | Integral, locally Noetherian and codimension-one DVR context for the sheaf; Noetherian instance additionally retained for linear equivalence and transport. No such use is made over arbitrary K°. |
| `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:206`, :231 | isAdic means sheafy and locally affinoid, with open restriction. It does not supply perfectoidness, a tilt, toric models or their comparisons. |

The pins have no actual completed perfected cone algebra, tilt, operational Chow carrier or toric sharp geometric morphism to substitute into the missing headlines. Generic sheaf and scheme carriers do not remove those construction prerequisites. The declaration/signature sweep is vacuous because Suggested.lean declares nothing; no elaboration is claimed.


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

- No Lean build or signature elaboration was run. Suggested.lean has zero declarations, so its declaration-by-declaration `#check` sweep is empty; this is a source/type-shape audit, not an implementation certificate.
- The seven declared supplier extensions remain contracts. In particular, arbitrary-field split-orbit integral Kronecker duality is not proved by the complex-geometry discussion of FS94 alone. The roadmap explicitly assigns the stronger interface to SchemeAndStackFoundations; its eventual proof was not assumed available.
- The downstream consumer packages provide design documents rather than final published section-numbered roadmaps in this checkout. Their dependence on the outputs is visible, but final consumer section locators cannot be certified.
- Ownership beyond the 54 supplied open-folder checkouts was searched through the service’s current index, not by exhaustively reading every open roadmap. Search matches were checked before drawing ownership conclusions.
- Pass b’s source-note diagnosis of a sign misprint in FS94 equation (2.3) is not independently certified: the displayed equation is consistent with local-equation weights. Its external Fulton convention was not part of the supplied source text. The package’s own section-weight formula gives +1 on O(D∞), so no package finding follows.

No cited package source is missing or paywalled in the supplied cache. No additional source fetch or reference request was needed. No instruction from untrusted text was followed.

## Source issues

- **Error** in FS94 at §1 after Corollary 1.2, printed page 4 (FS94 line 132): the source says smooth toric varieties have free Chow groups; it should be restricted to smooth complete toric varieties, since separate rays (1,0),(1,2) give Picard group ℤ/2; affects nothing.
- **Misprint** in FS94 at Proposition 3.1(b), printed page 10 (FS94 line 383): the source says the second cup-product cone has codimension k−p, with k unspecified; it should be codimension q, the degree of the second factor; affects nothing.
- **Misprint** in FS94 at Theorem 3.2, printed page 11 (FS94 line 400): the source says exceptional displacement subspaces lie in the cone-span lattice; it should be the quotient N/N_gamma, as the proof specifies; affects nothing.
- **Misprint** in FS94 at proof of Lemma 3.4, printed page 12 (FS94 line 442): the source says the divisor calculation proves Lemma 3.3; it should be Lemma 3.4, the result being proved; affects nothing.
- **Misprint** in SCH12 at proof of Lemma 5.21, printed page 281 (SCH12 line 1377): the source says multiplying x by its approximate sharp lift gives an element close to one; it should be multiplication by the sharp of the inverse of that lift; affects nothing.
- **Error** in SCH12 at proof of Proposition 7.16, printed page 302 (SCH12 line 2327): the source says bijectivity and residue-field density imply the limit homeomorphism without compactness of X; it should be stated with X quasicompact and quasiseparated, as in the supplier’s corrected criterion; affects nothing.
- **Misprint** in SCH12 at proof of Proposition 8.7, printed page 306 (SCH12 line 2491): the source says a large p-power yields a global regular function; it should be a section of the correspondingly powered divisor line bundle; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "abc9f0dd881849afab445824031f5defb730e303", "job": "RT-AnalyticToricGeometryPartII~2a", "model": "gpt-6-astra", "worker": "chris-31"} -->
