<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1138#issuecomment-6398447516 -->
Review (codex) of c43dec3

Verdict: needs_changes

1. **F01** (P1) Geometric-point bounds do not define the claimed reduced functor

   **Location.** `packages/HeckeStacksAndLocalShtukasPartII/README.md:343`, also lines 344, 358 and 364: “functor X_≤μ(b)(R) of modifications … at every geometric point x of Spec R”.

   **Claim.** The pointwise condition defines the spherical functor on equal-characteristic test algebras, and this is the reduced locus and the hyperspecial specialization of the scheme-theoretic graph pullback. Only the mixed-characteristic branch restricts test algebras to perfect ones.

   **Witness.** Take R=k[ε]/ε², G=GL₂, b=1, μ=0, g=1+εt⁻¹E₁₂. Then σ(g)=1 and r_b(g)=1−εt⁻¹E₁₂∉GL₂(R[[t]]), although every geometric fibre has position 0. Zhu's test algebra is perfect: zhu17 line 2114.

   **Exact repair and test.** In equal characteristic define the scheme-theoretic relative-position graph pullback and then its reduction. Describe its geometric field points by the displayed relative-position criterion; do not assert that this criterion alone describes its points on arbitrary nonreduced algebras. Retain Zhu's pointwise description on perfect algebras in the perfect branch. Make the same distinction in the first API bullet, the hyperspecial comparison and the d=1 comparison in §3.5.

   Add the witness as a negative-control Check. Its coset is nontrivial because its t⁻¹ coefficient is ε≠0, and faithful flat base change cannot kill ε. It satisfies the proposed pointwise condition but fails the zero-position graph condition, which requires r_b(g)∈GL₂(R[[t]]). The repaired definition rejects it; g=1 satisfies both conditions. This changes the functor description, not the intended geometric dimension theorems.

2. **F02** (P2) The extended semi-module API omits cyclicity

   **Location.** `packages/HeckeStacksAndLocalShtukasPartII/README.md:637`: “Equality in the upper bound everywhere on A.”

   **Claim.** This API bullet asserts equality for an extended semi-module without a cyclicity hypothesis, although line 626 defines cyclicity by exactly that extra condition.

   **Witness.** In vie06 Example 3.5, PDF p. 4 (line 152), m=4, h=5, B={−2,−1,2,5,6}, A=B+5ℕ and φ(−1)=0, but max{n≥0:3−5n∈A}=1.

   **Exact repair and test.** Replace the bullet by the characterization: the extended semi-module is cyclic if and only if equality holds at every a∈A. Keep general extended semi-modules in §§2.3–2.5; do not restrict the stratification to cyclic types. Add the displayed noncyclic example as a Check, with μ=(0,0,0,2,2). Here ΣB=10=5·4/2; the five sequences start at −2,2,5,4,−1 and have initial φ-values 0,0,2,2,0. The last sequence continues 6,11,16,…, while the others advance by 5. They satisfy the extended conditions. At −1 the repaired characterization says noncyclic because 0<1. The existing (h,m)=(2,1), A=ℕ example remains cyclic.

3. **F03** (P3) The Levi-position definitions lack their API and third Check

   **Location.** `packages/HeckeStacksAndLocalShtukasPartII/README.md:837`, and lines 854–857: “Let S_M(μ,κ_M(b)) be the finite set … Put d(μ,μ_M)=dim(N(L)t^(μ_M)K/K∩Gr_μ).”

   **Claim.** This section defines its indexing set and intersection dimension, but has no API list and only two Checks. Both Checks make both Newton correction terms zero.

   **Witness.** For GL₂, M=T, μ=(1,0), b=diag(1,t), μ_M=(0,1): d=0, 〈ρ,ν_M−ν_G〉=−1 and 〈2ρ_N,ν_M〉=−1. The fibre dimension is 0−1−(−1)=0.

   **Exact repair and test.** Add the definition API in prose: the occurrence-and-integral-κ membership criterion and finiteness of S_M; the dimension of the specified intersection, including −∞ when empty; and invariance of d when the Levi point is changed within its K_M orbit. These are the local uses of the imported intersection geometry, not a second construction of that geometry. Add the witness as the third Check. Omitting the first Newton correction would give 1 instead of 0. The text at ham15 Definition 2.7 and Proposition 2.9, PDF p. 5 (lines 178–204), supports this API and the corrected value.

4. **F04** (P3) Three sampled passages have inaccurate locators

   **Location.** `packages/HeckeStacksAndLocalShtukasPartII/README.md:280`, 1042–1043 and 1480; `packages/HeckeStacksAndLocalShtukasPartII/sources.toml:47`. The first locator says “§2.2, (2.1)–(2.2), p. 5”; the last says “Definition 3.3 … he21, §6.1, p. 12”.

   **Claim.** These are exact equation, definition and page locators.

   **Witness.** he21 line 201 labels (2.1); line 208 is unnumbered. he21 line 488 begins §6.1 on p. 13. ghn15 line 390 heads §3.3. vie14 line 713 starts Proposition 5.5 on p. 1026.

   **Exact repair and test.** Cite he21 §2.2, equation (2.1) and the subsequent unnumbered definitions, p. 5; cite vie14 Proposition 5.5 and Corollary 5.6, pp. 1026–1028; and cite ghn15 §3.3, PDF p. 10, together with he21 §6.1, p. 13. Correct the existing ghn15 manifest locator in place when applying the fix; do not create a second key. The he21 page images confirm the numbering and the p. 13 heading. The mathematical formulas at these corrected locations agree with the package.

5. **F05** (P3) A Check retains revision language

   **Location.** `packages/HeckeStacksAndLocalShtukasPartII/README.md:1259`: “the repaired lower-bound difference”.

   **Claim.** The Check describes a revision rather than stating the calculation timelessly, contrary to the required house style.

   **Witness.** For its unitary A₂ instance, λ=ω₁∨, λ_w^♭♭=ω₂∨ and ρ_J∨=η_J∨=ω₁∨. The difference is ω₂∨−(−ω₁∨)=ω₁∨+ω₂∨; no reference to a repair is mathematical data.

   **Exact repair and test.** Delete “repaired”, leaving “the lower-bound difference”. Retain the equation: both sides are α₁∨+α₂∨ in this instance.

Five findings: two blocking mathematical findings (one P1, one P2) and three P3 findings. All six findings of the preceding review are repaired. None of the findings below re-raises a finding marked not actionable. The package is repairable within its existing scope.

## Verified sound

The review read all 47 numbered targets across nine layers, all Needs paragraphs, the 13 declared contracts and the complete Lean file. It checked the six repairs first, reopened all 15 seeded source targets, and then checked the changed passages and recurring patterns throughout the package. Earlier computed rows were used only for unchanged passages; sections absent from that table, including §§0.5, 2.4, 3.5 and 6.2, were examined directly. The table below records concrete calculations for the sampled targets, the headline results, all findings and the shared conventions. This is evidence about the statements and interfaces, not a claim that the planned deep proofs have been formalized.

### Previous findings, checked individually

| Earlier finding | Repaired passage and verification | Status |
|---|---|---|
| F01, nonexistent continuations | README:28, “The scope excludes connected and irreducible components of these loci”; downstream text at :1749 describes applications without inventing owners. Searches find none of the three continuation names or “continuation” in the reviewed README. | Repaired |
| F02, Newton-cell/ADLV ownership | README:1077, “dim X_w(b)=ℓw−〈2ρ,ν_b〉−c_[b],w”; :1087, “the comparison involving X_w(b) is constructed here after §0.5.” The old gap slug is absent; §4.6 consumes §4.3. | Repaired |
| F03, duplicate/vague seed coefficient | README:219, “The positive twisted-Coxeter comparison needed for the basic seed belongs to §7.4 here.” The generic cocenter gap ends with degree recursion; §7.4 states its coefficient inequality and includes gap:demazure-product in Needs. | Repaired |
| F04, pinned inversions | README:102 names `TauCeti.inversions`, followed by `TauCeti.isLeast_ncard_inversions` and `TauCeti.ncard_inversions_mul_le`; :149 specifies inversion count in ℤ. All three declarations were opened at the pin. | Repaired |
| F05, F-simple versus absolutely simple | README:1705, “Since G is F-simple, σ permutes the irreducible components transitively”. The proof applies positivity to λ^♦ and the new restriction-of-scalars Check computes (1/2,1/2). | Repaired |
| F06, style | Lean's formerly overlong sentence is wrapped: “loci, the affine apartment and Iwahori–Weyl interface, and compatible original-group”. Maximum line length is 86; GS2 citations use the roadmap name and target; the redundant hn14 sentence is gone. | Repaired |

The first two mathematical findings here occur in previously unsampled portions of the point-functor/API specifications. They do not invalidate the specific repairs above. No new unnamed owner, mixed-characteristic equidimensionality assertion, unnormalized cocenter degree or unaveraged F-simple positivity claim was found.

### Seeded source sample

All 15 targets were read at their locators. There are no author-flagged unverified locators. Cached legal texts suffice; no source fetch, duplicate manifest key or missing-reference request was needed. Page images of he21 pp. 5, 7, 10–13 resolved its OCR-damaged formulas and diagrams.

| Target | Text, page and hypotheses checked | Outcome |
|---|---|---|
| 0.1 | he21 §2.2, p. 5, line 190; he14 Definition 1.1, p. 372, line 208. The abstract-group version follows from the displayed conjugation identity and σ(I)=I. | Correct point-set construction; no normality required. |
| 0.2 | he21 §2.2, p. 5, lines 199–208: unique normal form, σ⁻¹(y)x, F-split defect and minus-Newton convention. | Formula correct; equation-number repair R04. |
| 3.2 | ham15 after Proposition 2.10, PDF pp. 6–7, lines 244–269; ghnerr Proposition 0.0.1, p. 1, lines 16–25; zhu17 §3.1.2, pp. 456–457, lines 2163–2189. | Nonempty fixed ambient κ-piece and separate perfect comparison retained; corrected characteristic condition retained. |
| 3.3 | ckv15 Lemma 3.1.1 and proof, PDF pp. 20–21, lines 924–947; zhu17 line 2183. | Superbasic, unramified, F-simple adjoint, h≥2 and integral component conditions retained. |
| 3.4 | ham15 Definitions 2.5/2.7, Lemma 2.8, Proposition 2.9, PDF pp. 4–6, lines 162–206; zhu17 lines 2163–2180. | b basic in M, κ-indexing and both correction terms correct. R03 concerns API/Checks. Source proof has slips recorded below. |
| 3.5 | zhu17 Proposition 3.3, diagrams (3.1.4)–(3.1.5), pp. 457–458, lines 2195–2223. | Modification arrows, ordered composition and σ_E endpoint agree. Perfect test-algebra qualification is essential; d=1 must inherit R01's corrected classical description. |
| 4.1 | he21 Theorem 4.4, p. 7, lines 278–284; he14 Theorem 7.1, pp. 389–390, lines 877–890. | Exact special-parahoric criterion uses both integral κ and rational Newton bound. He14's basic-Levi presentation is not mistaken for its general reformulation. |
| 4.2 | mv20 Definition 3.1, PDF p. 5, lines 247–267; vie14 Proposition 5.5/Corollary 5.6, pp. 1026–1028, lines 713–778. | Greatestness and equality on Bruhat closure verified. Equal-characteristic geometry is separated from numerical transfer; R04 adjusts page range. |
| 4.6 | mv20 Theorem 3.16(3), Corollary 3.17, PDF pp. 8–9, lines 418–459; he21 Theorem 4.1, p. 7, lines 267–269. | Known lower endpoint required; equidimensionality/closures restricted to equal characteristic. |
| 4.7 | he21 Theorem 4.2 and proof, p. 7, lines 273–293; §4.4, p. 8, lines 297–302. | Closure bars checked visually; x t^λ and the specified dominant-chamber rotation agree. |
| 6.1 | he21 Proposition 5.6, p. 10, line 369; gh10 Proposition 2.5.2, PDF pp. 6–8, line 224. | Ordinary and Demazure endpoints, surjectivity and respective half/full length deficits agree. |
| 6.2 | he21 §5.4, pp. 11–12, lines 410–461 and page images. | All five diagrams, both restrictions and both forgetful maps agree; σ labels survive to the terminal rotation. |
| 6.3 | he21 §5.4, pp. 11–12, lines 429–473 and page images. | N₁, N₂ and their sum checked. Package explicitly owns the bounded-model argument used before taking dimensions. |
| 7.1 | ghn15 §3.3, PDF p. 10, lines 390–404; he21 §6.1, p. 13, lines 488–498 and page image. | Conjugation and inclusion direction correct. R04 fixes two labels. |
| 8.3 | ghn15 Theorem B, PDF p. 3, lines 119–122, and Proposition 3.6.5 proof, p. 15, lines 575–581; ghnerr; he15 Theorems 2.27/2.31, pp. 37/39, lines 1482/1552; he14 Theorem 12.1, p. 401, line 1311. | Basic case does not require a strict λ-gap. λ=0 and component-permuting Frobenius treated separately. |

The new §4.3 was also checked against mv20 Definition 3.3 (line 281), Corollary 3.6 (line 316), Theorem 3.10 (line 358), Corollaries 3.11–3.12 (lines 370–381) and he15 Theorem 2.23 (line 1373). Its quotient normalization, minimum component codimension and equal-characteristic equidimensionality equivalence agree. The new §7.4 coefficient statement was checked against he14 Proposition 11.6 (line 1244), including J=S, y=1, γ≠0 and twisted support; its zero-translation branch correctly uses finite Lang theory instead. Page images of he14 pp. 399–401 confirm the printed slips recorded below. For the reversed membership at line 1263, the minimal representative has no left descent in δ⁻¹(J₁); in A₂, J₁={s₁} and x₁=s₂ have descent set {s₂}, outside J₁.

### Adversarial calculations

Here −∞ is the empty dimension/zero-polynomial degree, and α∨=2ω∨ in A₁. Matrices act on columns and permutation products compose right to left. “Keep” means the computed instance agrees with the stated hypotheses and conclusion. The R01 and R02 repairs were tested on the same instances that refute the original wording.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Conventions: apartment and virtual dimension | A₁, w=s t^(nα∨), b=1, n=1,2 | Base (−1,0) maps to (2n,2n+1); lengths 3,5; η-length 1; d=2,3 | Consistent across §§0.2, 8.2–8.4 | Keep |
| Conventions: arithmetic/geometric Frobenius | A¹, q=2,3 | H²_c trace 2,3 geometrically and 1/2,1/3 arithmetically; H¹_c=0 | Trace and point conventions distinct | Keep |
| RG2.4 translation bridge | GL₂ diag(t,1), diag(t²,1), inverses | Labels here (1,0),(2,0), supplier labels (−1,0),(−2,0); κ=1,2 versus −1,−2; inverse Newton tuples (0,−1),(0,−2) | Arithmetic representatives retained | Keep |
| 0.1 cosets | S₃, I=1, b=(12), g=(123); I=〈(12)〉 | g⁻¹bg=(13)≠(12); r_b(gi)=i⁻¹r_b(g)i gives the same double-coset membership | Noncommutative and nonnormal cases valid | Keep |
| 0.1 boundaries | Trivial H; I=H; cyclic H with σ=id | Quotient/locus cardinalities 1/1; for I=1, b=1, w≠1 cardinality 0; r_b(g)=b for every g in the cyclic case | Both membership directions hold | Keep |
| 0.2 virtual dimension | GL₂ t^(1,0) ordinary; s t^(1,0) basic; unitary A₂ x=s₁,y=s₂ | (1+0)/2−1/2=0; (2+1−1)/2=1; σ⁻¹(s₂)s₁=1 versus s₂s₁ of length 2, changing d by 1 | Defect and σ inverse necessary | Keep; R04 locator |
| 0.3 shrunken condition | A₁ intervals; A₂ λ=6ω₁∨ | (−1,0) excluded, (0,1) included; endpoints 0,−1 not removed. λ−2ρ∨=2α₁∨ but α₂(λ)=0 | Large λ alone insufficient | Keep |
| 0.4 exact/bounded | G_m, b=t, μ=0; GL₂ b=1, μ=(1,−1) | κ 1≠0 gives empty; identity has position 0≤μ but 0≠μ | Exact and closed union differ | Keep |
| 0.4 nonreduced domain | GL₂ over k[ε]/ε², g=1+εt⁻¹E₁₂ | At every field point r=1 and Inv=0; over R, r=1−εt⁻¹E₁₂ has nonzero negative coefficient and fails the zero Schubert bound | Pointwise functor differs | R01 |
| 0.4 zero algebra/perfect domain | Spec(0); k[ε]/ε² in characteristic 2 or 3 | Sheaf value at ∅ is singleton; ε²=ε³=0 although ε≠0, so Frobenius is not injective | Empty geometry is not empty on every test algebra | Keep |
| 0.5 geometric dimension | (A¹)^perf; split torus b=1, μ=0; empty mismatch | Dimensions 1=1 before/after perfection; infinite discrete lattice has dimension 0; mismatch dimension −∞ | No global finite-component or finite-type claim used | Keep |
| 0.6 framing | S₃ b=(12), h=(123) | b′=hbh⁻¹=(23); (hg)⁻¹b′(hg)=g⁻¹bg; h⁻¹bh=(13) is the wrong transport | Direction fixed | Keep |
| 1.1 minimal classes | GL₂ t^(1,0); finite A₁ s | 1−〈(1,0),(1,−1)〉=0; 1−0=1; mismatched κ gives −∞ | Class and dimension agree | Keep |
| 1.2 geometric reduction | A₁ s₀s₁s₀, basic and straight nonbasic b | Basic: 1+max(−∞,1)=2; nonbasic: 1+max(0,−∞)=1; two empty branches give −∞ | Recurrence handles emptiness | Keep |
| 1.3 class polynomials | Same A₁ word | T_w≡zT_(s₁s₀)+T_s₁; basic (3+1+0)/2=2; nonbasic (3+2+1)/2−2=1; zero coefficient has degree −∞ | Normalized z-degree agrees with geometry | Keep |
| 1.4 advantage; 4.5 mutual advantage | D_w=3,D_v=2,d_w=4,d_v=3; identity relation | Differences −1=−1; length correction 1=3−2; identity correction 0 | Addition/transitivity and mutual equality have the stated direction | Keep |
| 2.1 semi-modules | (h,m)=(2,1), A=ℕ, 1+ℕ, evens, ∅; h=1 | B={0,1}, sum 1; shift sum 3 normalizes by −1; evens fail +1; ∅ has zero residue representatives; h=1 gives ℕ | Nonemptiness and gcd conditions discriminate | Keep |
| 2.2 cyclic extended type | (2,1), A=ℕ | φ(a)=floor((a+1)/2); φ(0)=0,φ(1)=1; upper bounds 0,1; V=∅ | Existing positive example is cyclic | Keep |
| 2.2 noncyclic type | (5,4), B={−2,−1,2,5,6}, μ=(0,0,0,2,2) | ΣB=10; initial values 0,0,2,2,0; φ(−1)=0 while upper bound is 1 (3,−2∈A; −7∉A) | Unqualified API equality false | R02 |
| 2.3 lattice assignment | Standard (2,1) lattice; b↦tb | t⁻ⁿbσ(e_a)=e_(a+1−2n), hence φ=floor((a+1)/2); tb raises φ by 1; index shift raises determinant component by 1 | Divisibility and volume signs agree | Keep |
| 2.4 charts | (2,1), μ=(0,1); perfection of a one-dimensional chart | V=∅, A^V=A⁰ has dimension 0; A¹ and its perfection both have dimension 1 | Geometric model, not set cardinality, supplies dimension | Keep |
| 2.5 superbasic formula | (h,m,μ)=(2,1,(0,1)), (2,1,(−1,2)), (3,4,(0,0,4)) in increasing convention | 1/2−1/2=0; 3/2−1/2=1; 4−(3−1)/2=3 | Central shifts and defect agree | Keep |
| 3.1 Lang correction | GL₂ slopes (2,0),(0,2); N=1 | Root minima 0,−2 equal 〈ρ,ν_M−ν_G〉=0,−2; empty-root sum 0 and point map dimension shift 0 | Correction sign fixed | Keep |
| 3.1 filtration | GL₃ upper unipotent, p=2,3 | [1+E₁₂,1+E₂₃]=1+E₁₃≠1; graded quotients G_a² and G_a; u²−u has derivative 1 in characteristic 2 | Whole-group logarithm not substituted | Keep |
| 3.2 adjoint components | GL₂→PGL₂; adjoint identity | κ map sends 0 and 2 to 0 mod 2; fixed ambient pieces compare individually; adjoint map on labels is identity | Global injectivity not inferred | Keep |
| 3.3 superbasic reduction | GL₂ m=1,2; ordinary class; h=1 | gcd(1,2)=1 and defect 1; m=2 gives t·1 in a torus Levi; ordinary J_b/Z(G) has split rank 1, superbasic quotient rank 0; GL₁ defect 0 | Basic and superbasic distinct | Keep |
| 3.4 Levi formula | M=G; GL₂ M=T, b=1, μ=(1,−1), μ_M=0 | Identity correction 0; torus term 0+d=1 with d=1 | Stated formula valid | Keep |
| 3.4 nonzero corrections | GL₂ μ=(1,0), b=t^(0,1), μ_M=(0,1); b=t^(1,0) | First: d=0, reorder=−1, root term=−1, total 0; second: d=1, reorder=0, root term=1, total 0 | Detects omission/sign errors beyond existing Checks | R03 |
| 3.5 iterated locus | d=1; torus bounds 1,2; GL₂ two minuscule bounds | One modification gives r_b itself; torus endpoint 1+2=3, fibre dimension 0; GL₂ endpoint (1,1) has fibre dimension 1, not 0 | Endpoint and ordering matter | Keep with R01 domain distinction |
| 3.6 ordered norm | d=1,2,3; U=[[1,1],[0,1]], V=[[1,0],[1,1]] | UV=[[2,1],[1,1]], VU=[[1,1],[1,2]]; over F₂ diagonals are (0,1) versus (1,0); τ_i=σ⁻ⁱτ₀ selects UV in degree 3; defect stays 1 | Order and embedding cycle discriminate | Keep |
| 3.7 convolution fibres | GL₂ bounds (1,0),(1,0) | Top endpoint (2,0): 0; endpoint (1,1): P¹, dimension 1=〈ρ,(1,−1)〉 | Exact endpoint required | Keep |
| 3.8 spherical/iterated dimension | GL₂ minuscule basic; b=1, μ=(1,−1); determinant mismatch; iterated total (2,0), b=t·1 | Values 0,1; mismatch gives −∞ despite expression 1/2; iterated value 〈ρ,(1,−1)〉=1 | Nonemptiness qualification essential | Keep |
| 3.9 upper bound | GL₂ straight ordinary translation; finite A₁ s | Actual and virtual 0=1/2−1/2; 1=(1+1)/2 | Minus-Newton normalization correct | Keep |
| 4.1 nonemptiness | GL₂ λ=(1,0), ν=(1/2,1/2) and (2,−1); G_m mismatch | κ=1 in both GL₂ cases; differences α∨/2 and −α∨ give yes/no; torus κ 0≠1 gives no | Both invariants needed | Keep |
| 4.2 greatest class | Length-zero τ; GL₂ t^(1,0); s t^(1,0) | τ-cell gives [τ]; translation gives ν=(1,0); last cell's greatest is ordinary, with basic ν=(1/2,1/2) smaller in κ=1 | Greatest does not itself assert saturation | Keep; R04 locator |
| 4.3 cell comparison | GL₂ w=s t^(1,0), basic and ordinary; truncation n=1,2 | Basic dim_I=1, c=1, quotients 5−4=9−8=1; ordinary dim_I=2,c=0, quotients 6−4=10−8=2; ADLV dimensions 2−0−1=2−1−0=1 | New normalization consistent | Keep |
| 4.3 boundaries | G_m w=1, b=1 or t | At 1: dim X=dim_I N=0, c=0; at t: no points, no finite minimum codimension | No empty-stratum subtraction | Keep |
| 4.4 cordiality | w=1, GL₂ t^(1,0), A₁ s | Length differences 0,1,0 equal Newton-minus-defect values 0,1,0 | Equivalent generic dimension equality | Keep |
| 4.6 saturation | GL₂ s t^(1,0); torus | Ordinary and basic dimensions 1,1; chain length (1+1−0)/2=1; codimensions 0,1; torus interval length 0 | Known basic seed supplies lower endpoint | Keep |
| 4.7 translation family | GL₂ x=s, λ=(1,0); A₁ λ=0,x=s | 2−1=1−0; 1−1=0−0; identity cell disjoint from IsI but contained in its closure | Generic class/closure agree | Keep |
| 5.1 double-flat | Split A₁ λ=2ω∨ and ω∨, y=s | First gives 0; second gives ω∨ in odd coroot coset, not clipped value 0 | Integral lattice retained | Keep |
| 5.1 twisted double-flat | Unitary A₂ λ=ρ∨, y=s₁; λ=ω₁∨ | Corrections 2ω₁∨; first λ^♭♭=ω₁∨, lower difference α₁∨, λ−λ^♭♭=ω₂∨∉Q∨; second λ^♭♭=ω₂∨ and lower difference ω₁∨+ω₂∨=α₁∨+α₂∨ | No unconditional upper bound; last equation correct | Keep mathematics; R05 wording |
| 5.2 factorization | Split A₁ x=y=s, λ=2ω∨ | β=γ=2ω∨; w₁=s t^ω∨, w₂=t^ω∨s; product t^(−2ω∨), lengths 2+0=2; a=1 | Product and auxiliary lattice agree | Keep |
| 5.2 twisted factorization | Unitary A₂ x=y=s₁, λ=ρ∨ | x′=s₂,z=s₁,y′=1; γ=ω₁∨; w₁=t^ω₂∨, w₂=t^(−ω₁∨+ω₂∨); length 2+2=4; a=s₂*s₂=s₂ | Star, not ordinary product | Keep |
| 6.1 endpoint maps | u=1; u=v=s; twisted A₂ u=s₁,v=s₂ | Identity intermediate flag yields fibre point; ordinary s²=1 fibre A¹ and star endpoint s fibre G_m both dimension 1; vσ(u)=1≠s₂s₁ | Map and rotation directions agree | Keep |
| 6.2 chain spaces | Split A₁ factorization; unitary A₂ factorization | A=1,B=t^ω∨s in A₁; Bσ(w₁)=t^(2ω∨). In A₂, A=s₁,B=t^ω₁∨s₁; Bσ(w₁)=s₁t^ω₂∨=σ(s₂t^ω₁∨); A*σ(s₂)=s₁=σ(a) | Both restricted endpoints match diagram | Keep |
| 6.3 chain dimensions | Same split and unitary instances | Split N₁=N₂=0. Unitary N₁=(1+2−3)/2=0, N₂=1+1−1=1; d_w−d_target=(6−4)/2=1 | N₁+N₂ equals virtual difference | Keep |
| 6.4 cordial reduction | Same instances, b=1 in unitary case | Split support ∅⊇∅; unitary target support_σ(s₂)=S, target dimension 2 and correction 1 give lower bound 3=d_w | Reduced target need not be shrunken | Keep |
| 7.1 P-alcoves | J=S; split A₂ x=s₁,y=s₂,λ=2ρ∨ | N_J=1 gives 1⊂1; correct conjugation t^(2,2)s₂s₁ versus wrong t^(0,−2)s₂s₁ | Conjugator and inclusion correct | Keep; R04 locator |
| 7.2 Levi obstruction | GL₂ diagonal torus, ordinary b; J=S | Levi κ values (1,0),(0,1) both map to group κ=1; J=S reduces to equality of group κ | Nonbasic fibre is not a singleton | Keep |
| 7.3 proper support | A₁ t^(nα∨), n=1,2 | Basic ν=0: strict gaps nα∨, empty support, empty locus; ν=nα∨: gap 0, dimension 2n−2n=0 | Strictness necessary | Keep |
| 7.4 seed and positivity | A₁ γ=0,a=s,q=2; γ=α∨; A₂ γ=0,a=s₁s₂ | P¹(F₄) minus P¹(F₂) has 5−3=2 points, dimension 1; positive-γ coefficient 1 has degree 0 and gives dimension 2; A₂ dimension 2 despite an α₂-strip (−1,0) | Nonshrunken seed actually supplied | Keep |
| 7.4 twisted cocenter | Unitary A₂, σ(s₁)=s₂ | [T_s₁,1]_σ=T_s₁−T_s₂≠0 in algebra, zero in cocenter; ordinary commutator 0; coefficients of T₁ and −T₁ are 1 and −1 | Twisted relation and positive cone distinguished | Keep |
| 7.5 image comparison | G_m, q=2, ζ³=1; GL₂ torus | (1,1)∼(ζ,ζ) both map to 1; wrong (ζ,1) maps to ζ²≠1; fixing κ_M=(1,0) selects one of two ordinary Levi classes | Quotient map and matching index correct | Keep |
| 7.6 Newton interval | GL₂ a=s, γ=(1,0) | Basic≤ordinary in κ=1, dimensions 1=1; κ=0 excluded | Uses an established lower endpoint | Keep |
| 8.1 nonemptiness iff | PGL₂ b=1, s t^(nα∨) versus t^(nα∨), n=1,2 | Same κ and positive gap; support {s} gives nonempty, support ∅ gives empty | Both directions tested | Keep |
| 8.2 dimension | Previous rank-one family; unitary A₂ example | Dimensions 2,3; unitary λ^♦=ρ∨, (λ^♭♭)^♦=ρ∨/2 and (4+2)/2=3 | Matches independent upper bound | Keep |
| 8.3 basic specialization | A₂ w₀, λ=0; quadratic Res PGL₂ | (3+3)/2=3 while strict gap is 0; component vector (1,0) averages to (1/2,1/2), both positive | Repair uses F-simplicity correctly | Keep |
| 8.4 large range | A₁ λ=α∨; A₂ λ=6ω₁∨; unitary J={s₁} | A₁ λ=2ρ∨ gives dimension 2; A₂ excess 2α₁∨ but α₂(λ)=0; unitary 2ρ∨−2ω₁∨=2ω₂∨ dominant | Bound and shrunkenness independent | Keep |
| Gaps: root combinatorics | s*s; A₂ w₀,y=s₁s₂; rank 0 | s*s=s, 1=1+0; inversions of y⁻¹={α₁,α₁+α₂}, ℓ(w₀y)=1=3−2; rank zero 0=0−0; failed sign at w=1,y=s would give 1=−1 | Pinned API is not the requested cancellation theorem | Keep gaps |
| Gaps: reduction/minima | Affine A₁ s₀s₁s₀; t^(α∨) | Reduction length 3→1; straight translation length 2 and finite factor length 0; μ=0 and α∨ give distinct terminal minima s₁,s₀ | Input-dependent Coxeter minimum retained | Keep gaps |
| Gaps: subtraction/purity/cocenter | A₁ successive ω∨; GL₂ basic≤ordinary; A₁ cocenter | (2ω∨−_domω∨)−_domω∨=0; chain length/codimension 1=1; coefficients z,1 have degrees 1,0 | Contracts have concrete nontrivial content | Keep gaps |

The inadmissible values q=1, d=0 and a nonperfect test algebra in the mixed-characteristic functor are excluded explicitly. Rank zero, zero test algebra, empty strata, p=2 and p=3, nonsplit Frobenius, nonnormal subgroups and a nonreduced equal-characteristic test algebra were tested above. No division by zero or natural-number subtraction was found. The last test exposes R01 rather than being silently excluded.

### Library and ownership audit

The content checkout's HEAD equals its `origin/main`, commit `1ce5c4f`. The manifest pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following 14 consumed declarations were opened in those checkouts, with their hypotheses:

| Pinned file | Declaration and actual content |
|---|---|
| `Mathlib/GroupTheory/DoubleCoset.lean:37` | `DoubleCoset.doubleCoset`: body `s * {a} * t`; arbitrary sets, no normality. |
| `Mathlib/GroupTheory/DoubleCoset.lean:44` | `DoubleCoset.mem_doubleCoset`: existence of the two factors. |
| `Mathlib/GroupTheory/DoubleCoset.lean:51` | `DoubleCoset.doubleCoset_eq_of_mem`: subgroup hypotheses H,K; equal double cosets after changing representative. |
| `Mathlib/GroupTheory/Coset/Defs.lean:66` and :71 | `QuotientGroup.leftRel`, `QuotientGroup.leftRel_apply`: subgroup orbit relation, equivalent to x⁻¹y∈I; no quotient-group law. |
| `Mathlib/Data/Finset/Defs.lean:75` | `Finset`: multiset with `Nodup`; no boundedness or nonemptiness of a subset of ℤ is supplied. |
| `TauCeti/GroupTheory/DoubleCoset/Basic.lean:100` | `DoubleCoset.mul_mem_doubleCoset_iff`: b∈H is required; no normality. |
| `TauCeti/GroupTheory/Coxeter/Parabolic.lean:101` and :233 | `CoxeterSystem.parabolic` is the subgroup closure of the chosen simple reflections; `IsMinimalCosetRep` says ℓu≤ℓ(uv) for every v in that parabolic. |
| `TauCeti/GroupTheory/Coxeter/Parabolic.lean:280` and :330 | `length_mul_of_isMinimalCosetRep`, `existsUnique_isMinimalCosetRep_mul`: additive length and unique factorization w=uv, with u minimal in its right parabolic coset. No finite-parabolic assumption. |
| `TauCeti/LinearAlgebra/RootSystem/Inversions/Basic.lean:50` | `TauCeti.inversions`: positive indices whose images are not positive. |
| `TauCeti/LinearAlgebra/RootSystem/Inversions/Length.lean:148` and :172 | `isLeast_ncard_inversions`, `ncard_inversions_mul_le`: least word length and subadditivity; finite indices, reduced crystallographic pairing, characteristic-zero domain at :82–85. |

For headline statability, also opened `Mathlib/AlgebraicGeometry/Scheme.lean:40` (locally affine locally ringed space, without built-in separation, finite type or moduli structure) and `Mathlib/RingTheory/WittVector/Isocrystal.lean:113` (a Witt-fraction-field module with semilinear Frobenius equivalence, not a reductive-group ADLV). Object searches for affine flags, Iwahori groups, Kottwitz invariants, affine Deligne–Lusztig loci, Demazure products, cordiality and extended semi-modules found no such geometric carriers at the pins. Hits concerning finite GL₂ representations and braid-matrix Hecke relations are different objects.

`roadmaps list` and object-based `roadmaps grep` searched the 362 indexed open heads and main. The board package index was read before the ownership audit. All 19 indexed board heads were also searched: four have package READMEs and the other fifteen have design READMEs instead. The latter were located at their supplied heads after the package README returned 404. Searches of these and the local board packages found no competing owner of these ADLV dimension constructions. PELModuliPartII describes proposed finite unitary incidence work, and PadicHodgeTheoryPartII uses a component application; neither constructs this package's general ADLV dimension theory. SchubertGeometry's open revision mentions a Demazure product, but its main copy does not supply that extension, so the revision is not used as a dependency. Class-polynomial matches in complex multiplication are unrelated.

The base `HeckeStacksAndLocalShtukas` at head `48d21c7` was read: HS0–HS4 owns Hecke stacks, towers and their cohomology, not these classical/perfect ADLV dimensions. The introduction correctly records that boundary. Its appearances here are context and downstream requirements, not upward supply. No existing roadmap is re-planned and no Lean declaration name collides, since this Lean file declares none.

### Resolved supplier citations and direction

Every supplier citation was resolved again, rather than inherited from the previous report. The resolved locations are:

| Supplier and version | Sections/targets opened and comparison |
|---|---|
| `TauCetiRoadmap/ReductiveGroupsPartII/README.md`, head `1383569` | RG2.0.4; RG2.1 apartment/root and arithmetic interfaces; RG2.3 parahoric-subgroup, associated-parahorics, lang-theorem, lang-for-pro-algebraic-groups; RG2.4 iwahori-weyl-group, affine-tits-system, length-and-bruhat-order, kottwitz-quotient, iwahori-bruhat-decomposition, simple-cell-multiplication, dominant-coinvariant-cocharacters, translation-length-formula, dominant-normal-form. Its inverse-Kottwitz translation label is explicitly transported in this package. |
| `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md`, main | Layers 3 and 4 supply Coxeter/chamber/longest-element theory; Layer 6 supplies numbered integral root data. The opening lattice boundary is not mistaken for absence of the later explicit Layer 6. |
| `packages/RootSystemsPartII/design/README.md` | RS2.1, integral-order is present, with the flipped coroot cone and retained lattice. The citation resolver's missing-roadmap lead is a false positive for this board design. |
| `TauCetiRoadmap/BunGAndNewtonStrata/README.md`, head `0d1e747` | §§0.5–0.6; 1.7–1.8; 1.10–1.11; 1.13–1.15; 1.18; 1.21; 1.27; 1.30; 1.43; 1.45 all present under the cited names. Checked arithmetic κ, split-rank defect, ordered norm and all-Levi Newton comparison. §1.43 is p-adic only, as the package expressly says. |
| `TauCetiRoadmap/GeometricSatakeAndFusion/README.md`, head `0652974` | GS0 perfect-model-and-etale-comparison, equal-characteristic-schubert-models, parahoric-ind-projectivity, flag-incidence-correspondences and flag-convolution-fibres; GS1 semi-infinite-affineness; GS2 convolution-diagram and rational-special-fibre-convolution. Exact-endpoint semismallness and both flag lower bounds are stated there. GS1's split Borel result does not already supply the requested general-Levi result. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, main | §0.7 fibre_dimension_formula and local dimension; §0.9 limits; §§0.23–0.26 universal homeomorphisms/perfection/pfp models; Layer 1 algebraic spaces, torsors and descent. Finite-type and bounded-model hypotheses retained here. |
| `TauCetiRoadmap/TraceFormula/README.md`, head `4bd7237` | Layer 11 separated finite-type Grothendieck–Lefschetz with constructible finite-Tor coefficients and all positive Frobenius powers; rational realization belongs to its cited family. Arithmetic σ is not used in place of geometric trace Frobenius. |
| `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md`, head `1383569` | SR.1.5 iwahori-matsumoto, split equal-parameter relation (U_s−q)(U_s+1)=0. The normalization T_s=v⁻¹U_s gives T_s²=(v−v⁻¹)T_s+1; the generic twisted cocenter remains an explicit extension contract. |

The 13 gap slugs, suppliers and needs sentences match between the README and `design/plan.json`, after whitespace normalization. All references to gap slugs are declared. The contracts keep the group/field hypotheses, the integral lattice or κ fibre, the normalized degree, and the equal-characteristic restriction where needed. The superseded ADLV-dimension gap is absent. The general cocenter contract does not request §7.4's seed coefficient. No gap has supplier `none`. Absence of these contracted extensions from their suppliers is not a finding.

Two inherited cross-supplier concerns remain contracts rather than new findings against this package: RootSystemsPartII's design routes affine extensions toward a separate proposed direction, and GS0 mentions a Demazure product from RG2.4. This package explicitly declares its six RootSystemsPartII extension gaps, including the Demazure product; it does not pretend RG2.4 already supplies that product. It owns the geometric comparisons after constructing its own ADLVs.

The required dependency command, with this package name, supplied order and `--movable`, exited 0:

```text
depcheck: 52 roadmaps, 588 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The local target order was also read: §3.8 states the GL-first, then restriction-of-scalars, then general-group order; §4.6 follows the local §4.3 comparison; the two correspondences precede the final theorem. No new supply cycle was found.

### Headline coverage, Lean and shape

The README headline results are: minimal-class nonemptiness/dimension (§1.1); geometric reduction (§1.2); dimension equals class-polynomial degree (§1.3); superbasic chart and GL dimensions (§§2.4–2.5); twisted Lang and Levi comparisons (§§3.1, 3.4); norm and iterated/single spherical dimensions (§§3.6–3.8); spherical nonemptiness (§4.1); the virtual upper bound (§3.9); generic Newton class and dimension (§§4.2–4.3); cordial saturation and translation-family cordiality (§§4.6–4.7); two-correspondence reduction (§6.4); Levi obstruction and image comparison (§§7.2, 7.5); the nonshrunken basic seed (§7.4); and the final shrunken, basic and large-translation theorems (§§8.1–8.4).

Each appears in the module docstring with the missing geometric carrier/interface. None can be stated on the pinned carriers with only a few simple definitions. In particular, a set of group cosets cannot substitute for the scheme/perfect-space dimension theorem. There is no missing statable geometric headline and no stand-in.

The required `lake env lean` elaboration of `packages/HeckeStacksAndLocalShtukasPartII/Suggested.lean`, invoked with its absolute filename from the supplied content checkout, exited 0 with no diagnostics. There are zero definitions, instances, structures and theorems, so the mechanical declaration scan produces zero `#check @name` commands and zero one-tactic probes. No binder can disappear and no signature changed. There are no `sorry` warnings because there are no declarations. No TauCeti import or targeted build is needed. The file has exactly one `import Mathlib`, one module docstring and the required namespace, with no `set_option`, sorry'd data or padding.

README shape was compared with main's SchemeAndStackFoundations and RootSystems. All nine layers end with Examples and Dependencies; numbered targets carry sources and Needs paragraphs. The introduced major definitions have API lists and at least three Checks except for the local definitions identified in R03. Metadata parses as `topic = "math.AG"`; the manifest parses with schema `tauceti-roadmap-sources/v1`, 15 distinct certified keys and 15 available legal cached texts. No copied source passage, executable algorithm, route-specific prime restriction or process identifier was found in the reviewed package. The characteristic restrictions describe initial proofs alongside explicit general targets, rather than dropping excluded primes.

## Not verifiable

- No required source was inaccessible. The he21 OCR issues were resolved using its cached page images, including the closure bars and the five chain diagrams.
- This review does not independently certify every internal proof in a cited article. In particular, it checks the statement and local induction used from he14 Proposition 11.7, not its separate He–Yang reference. No unsupported claim about that reference is made.
- The declared supplier extensions remain future contracts. Their implementations are not present and were not represented as already proved. This verdict does not ask for another source or human input before the two mathematical repairs can be applied.

## Source issues

- **Error** in ghn15 at Proposition 2.2.1, PDF p. 6: the source says the full adjoint flag map is an immersion and its component map is injective; it should be componentwise isomorphism, with a separate component-injectivity condition for immersion; affects a stated result; corrected in print at ghnerr, Proposition 0.0.1, p. 1.
- **Error** in ghn15 at Proposition 3.5.1, PDF p. 13: the source says every group σ-class meets a standard Levi in at most one Levi σ-class; it should be restricted to basic group classes; affects a stated result; corrected in print at ghnerr, Proposition 0.0.2, p. 2.
- **Misprint** in ham15 at the proof of Proposition 2.9(2), arXiv v2, PDF p. 6: the source says the first two dimension equalities subtract the Newton-reordering pairing; it should be added, as in Lemma 2.4 and the final equality; affects the proof.
- **Misprint** in ham15 at the proof of Proposition 2.9(4), arXiv v2, PDF p. 6: the source says the dimension is the supremum of the Levi ADLV dimensions alone; it should be the supremum of their inverse-image stratum dimensions before applying part (3); affects the proof.
- **Misprint** in he14 at Proposition 11.6, p. 399: the source says the support condition concerns an undefined v; it should be the finite factor x; affects nothing.
- **Misprint** in he14 at the proof of Proposition 11.6, p. 399: the source says the new factor x′ has ordinary support J after proving equality of twisted supports; it should be σ-saturated support; affects the proof.
- **Misprint** in he14 at the proof of Proposition 11.6, p. 399: the source says a left descent of the minimal left-parabolic representative lies in δ⁻¹(J₁); it should be a descent in J outside δ⁻¹(J₁); affects the proof.
- **Misprint** in he14 at the proof of Proposition 11.6, p. 400: the source says the induction uses a right reflection s_i after the preceding expression used s_δ(i); it should be s_δ(i); affects the proof.
- **Error** in he14 at Proposition 11.7, p. 400: the source says one fixed pair (J,c) works for every allowed μ and finite Coxeter word; it should be a pair allowed to depend on the input; affects a stated result.
- **Misprint** in he14 at §11.3, p. 400: the source says the chosen dominant cocharacter is λ but immediately uses γ in its place; it should be named γ consistently; affects nothing.
- **Misprint** in he14 at §11.3, p. 401: the source says Proposition 11.7 reduces t^γa, although a need not be Coxeter; it should be t^γw, the Coxeter factor chosen immediately before and used in (c); affects the proof.
- **Misprint** in he21 at §6.2, p. 13: the source says the P-alcove conjugator is σ⁻¹(y); it should be the left normal-form factor x, as the displayed conjugation and ghn15 Lemma 3.6.3 require; affects the proof.
- **Gap** in he21 at §6.3, p. 14: the source says He15 Theorem 2.27 gives basic nonemptiness of the reduced target without checking shrunkenness; it should be justified by a basic seed valid without shrunkenness; affects the proof.
- **Misprint** in zhu17 at (3.1.3), p. 455, and Theorem 3.1, p. 456: the source says the dimension expression applies without a nonemptiness qualification; it should be restricted to nonempty loci, since GL₂ with b=1 and μ=(1,0) is empty despite expression 1/2; affects a stated result.
- **Misprint** in zhu17 at §3.1.3, p. 458: the source says τ_i=σ^iτ₀ while its following identifications and ordered norm use σ^i from factor i to factor zero; it should be τ_i=σ^−iτ₀ with those formulas; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c43dec342120a8463666753bea644eaef9e248c3", "job": "REV-PKG-HeckeStacksAndLocalShtukasPartII~3", "model": "gpt-6-astra", "worker": "chris-22"} -->
