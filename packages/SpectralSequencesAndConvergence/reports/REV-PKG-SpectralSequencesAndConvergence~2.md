<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14997#issuecomment-6868296865 -->
Review (codex) of d281c6f

Verdict: needs_changes

1. **F01** (P2) The module summary weakens the top convergence hypothesis

   **Location:** packages/SpectralSequencesAndConvergence/Suggested.lean:25–28: “under bounds on the bottom and a monomorphism condition at the top”; the following comparison bullet says “under the same bounds”.

   **Claim:** Bottom vanishing and top monomorphisms suffice for convergence and for the abutment comparison theorem.

   **Witness:** packages/SpectralSequencesAndConvergence/README.md:1112–1116: take K = ℤ[0], all integer filtration stages zero. Top maps 0 → ℤ are monic; every page and filtration step is zero. The filtration union is 0, not ℤ.

   **Exact repair:** In the convergence bullet, replace “under bounds on the bottom and a monomorphism condition at the top” with “under bounds on the bottom and isomorphisms H^n(⊥ ≤ j) → H^n(⊥ ≤ ⊤) for every integer j ≥ b”. Keep the comparison bullet referring to these corrected bounds. Do not weaken HasConvergenceBounds or change either theorem signature.

   **Repair tested:** In the witness, 0 → ℤ is not an isomorphism, so the corrected hypothesis excludes it. The map from the zero filtered complex to this K gives page isomorphisms 0 → 0 but the nonisomorphism 0 → ℤ on H⁰, also refuting the summary's comparison claim. Conversely, the stupid filtration of ℤ →(×2) ℤ satisfies the actual bounds a = −2, b = 0 in degree 1 and gives stable page ℤ/2. The correction agrees with the definition at Suggested.lean:121–131 and README §4.4. The monomorphism criterion in §4.3 remains valid for its narrower canonical page comparison.

One finding: P2 = 1; P1 = 0; P3 = 0. The earlier metadata finding is repaired. The Lean signatures elaborate and survived the mathematical checks below, but their module summary promises convergence under a strictly weaker hypothesis.

## Verified sound

### Earlier repair and its changed passages

The previous review had one finding, F01 (P3). It is **repaired**.

- packages/SpectralSequencesAndConvergence/sources.toml:43 now says “year = 2019”. Its version note at line 53 identifies the 2 February 2018 draft and the published Documenta Mathematica 24 (2019), 1855–1878.
- packages/SpectralSequencesAndConvergence/README.md:1844–1845 says “Line locators refer to the authors' draft dated 2 February 2018, whose numbering of these items agrees with the published version.”
- Independently read the draft date at helle-rognes2024 line 59 and the publisher footer at helle-rognes2024 (publisher) line 41. Compared every numbered item asserted to retain its number. The draft-to-publisher line pairs are: 65→83, 71→93, 78→100, 81→103, 85→108, 94→118; 104→134, 136→152, 141→158, 143→160, 145→162, 153→174; 163→188, 166→192, 169→195; 185→211, 195→226, 201→234, 226→267; 291→338, 299→347, 334→384, 943→980. These cover the listed definitions, lemmas, remarks, theorems, equation (3.1) and Example 8.1. The expanded numbering claim holds.
- The repair also corrected the analogous Bhatt–Scholze entry. packages/SpectralSequencesAndConvergence/sources.toml:149 explicitly says “its numbering (Definition 3.1.1, Proposition 3.1.10) is used; the journal numbering was not compared.” The recorded year is 2015; the read v2 is dated 17 December 2014 at bhatt-scholze2015 line 5. README:1846–1847 identifies both publication and arXiv version. No claim of journal-numbering verification is made.
- Searched for the same version/year confusion throughout the manifest and references. Browning–Sawin's v3 date is 19 February 2020 at browning-sawin2020 line 5, consistent with the recorded publication year. The six settled uncertified records remain distinguished from readable copies. Keys and the author-recorded access data were retained.

No previous finding was marked not actionable. No maintainer notes were supplied. The mathematical targets were unchanged by the repair. For unchanged, nonsampled statements I used the preceding review's computed rows, not its unsupported summaries; I reread the full package, rechecked the new sample, all signatures, source changes, suppliers and headline claims. R01 is a newly detected inconsistency in unchanged prose.

### Coverage, principles and shape

Read all four package inputs, all 31 numbered targets, their API paragraphs and 31 Checks blocks (114 bullets), every Needs line and all 11 actual Lean declarations. The three retained definitions are BidegreeAssignment, HasConvergenceBounds and IsMittagLeffler. Each has real native data or a concrete predicate, and its README definition has at least three discriminating Checks. The remaining definitions stay in the roadmap with their APIs and Checks.

The package develops general abelian-category theory. Exact products, exact sequential colimits, repleteness, smallness and filtration bounds are included where used. Module, sheaf, quadrant and finite cases are distinguished from the general statements. No route restriction, prime exclusion, computational algorithm, sorry-defined data, set_option, replacement plan of an existing roadmap, upward supply or cycle was found.

The README has the required summary, scope, conventions, supplier contracts, build paragraph, seven mathematical layers, per-layer examples/dependencies, consumers and references. The APIs and Checks use prose. All 11 names attributed to this package are declared in Suggested.lean; library names and explicitly attributed supplier compatibility names were resolved separately. No process residue, machine path, pull-request number or HTML anchor was found in the package inputs.

### Computed adversarial evidence

Here 0 denotes a zero object; ℤ^(ℕ) denotes a direct sum and ∏ denotes a product. Object equalities mean the specified canonical identification, not merely an abstract isomorphism. The table covers all 15 seeded targets, all headline families, R01, and the supporting sign, exactness and completeness controls. The earlier review's additional computed rows for unchanged targets remain applicable.

| Statement | Instances tried and values computed on both sides | Result and change |
| --- | --- | --- |
| 1.1 marked subquotients | For B=4ℤ⊆Z=ℤ, inverse images of 0, 2ℤ/4ℤ, ℤ/4ℤ are 4ℤ, 2ℤ, ℤ. For B=Z the quotient and interval each have one subobject. A coordinate swap of ℤ² sends the first axis to the second, whereas the chosen marking preserves the first. | The marking excludes an arbitrary quotient isomorphism. No change. |
| 1.2 cycle and boundary towers | For d₂:ℤ→ℤ, x↦2x, the source has (Z₃,B₃)=(0,0); the target has (ℤ,2ℤ). Their quotients are 0 and ℤ/2, exactly page 3. For d=0, (Zᵣ,Bᵣ)=(A,0) at every page. | Recursion and both differential-vanishing directions agree. No change. |
| 1.3 stabilization and degeneration | In the ×2 example d₂≠0 and every dᵣ for r≥3 is zero: both surviving tower pairs stabilize at page 3. The source incoming boundary tower already stabilizes at 2. With all differentials zero, every page transport is the starting identification. | Regular and coregular directions are distinct and correctly assigned. No change. |
| 1.4 limit page | For the filtered identity example, at ℓ=2 and ℓ=3, Zᵣ=ℓ^(r−1)ℤ, Bᵣ=0; every quotient is abstractly ℤ but their intersection is 0. Thus E∞=0, not ℤ. For the ×2 target E∞=ℤ/2. | An unmarked eventual isomorphism type does not determine the limit page. No change. |
| 2.1 bidegree assignments | Native page 2 sends (1,−1) to (3,−2). Total degree changes 0→1; native filtration changes 1→3, classical filtration 0→1. Homological (2,1)→(0,2) gives (fil,deg)=(-2,-3)→(0,-2). Wrong fil=q would require e=3 at r=2 and e=5 at r=3. | The stated offsets e=0 and e=1, signs and injectivity laws reject the wrong assignments. No change. |
| 2.2 outgoing bound; Lean:96 | At first-quadrant (1,0), β(2)=3 and e=0 give r≥3−1=2. For r=2 the target is (3,−1), hence the map is ℤ→0 and is zero. Offset e=1 raises the threshold by 1. | The explicit inequality agrees with dFrom. No change. |
| 2.2 incoming bound; Lean:108 | At (1,0), α(0)=−1 gives r≥1−(−1)=2. At r=2 the source is (−1,1), hence 0→ℤ is zero. The infinite-cycle example has only one nonzero position in degree 0 but Zᵣ=ℓ^(r−1)ℤ never stabilizes; degree 1 has infinite support. | The adjacent-degree hypotheses matter. No change. |
| 2.3 Euler propagation | A surjection ℤ/4→ℤ/2 in degrees 1→2 has lengths (2,1), homology lengths (1,0), giving −2+1=−1=−1+0. Over ℚ the ×2 complex gives 1−1=0 on both sides. | Additivity and total-degree signs agree. No change. |
| 3.1 filtration predicates | On ℤ, the ℓ-adic filtration has union ℤ, intersection 0, but quotient limit ℤℓ≠ℤ. On ℤℓ that limit is ℤℓ. Constant filtration on X≠0 has union=intersection=X; zero filtration has both 0. | Exhaustive, separated and complete are not conflated. No change. |
| 3.2 convergence structures | Stupid ×2 filtration has classical E∞ at (0,0) equal to 0 and at (1,0) equal to ℤ/2, matching gr H. Zero pages with constant H⁰=ℤ have gr=0 but intersection ℤ. An empty degree set imposes zero comparisons. | Weak convergence alone neither separates nor determines the abutment. No change. |
| 3.3 compatible morphisms | On a one-step ℤ object with β=1, page map −1 and abutment map 1 give −1 and 1 in the compatibility square. Identity gives 1=1; the two zero maps give 0=0. | The stated square excludes unrelated abutment maps. No change. |
| 3.4 finite filtrations and Euler identity | ℤ/4 and (ℤ/2)² have graded lengths (1,1), total length 2 in both cases, but exponents 4 and 2. Zero pages converging only in degree 0 with H¹=ℚ give page sum 0 versus abutment sum −1. | Finite filtration proves additive identities, not splitting; all-degree coverage is needed for the sum. No change. |
| 3.5 comparison | ℤ→ℤℓ has grᵖ map 1 on ℤ/ℓ for p≥0 but cokernel ℤℓ/ℤ≠0. Constant-filtered ℤ→0 has graded maps 0→0 but kernel ℤ on the abutment. A finite filtered identity has identity maps on both sides. | Completeness and separation reject both false extensions. No change. |
| 3.6 vanishing and dimension | Rational ×2 has degree-1 page dimension 1, limit dimension 0, and H¹ dimension 0; zero differential has all three equal to 1. Exhaustive and separated constant graded-zero filtration forces its common step to be H=0. | Inequality and its equality/vanishing cases agree. No change. |
| 3.6 rows, columns and edges | Graded factors ℤ/2,ℤ/2 admit the nonsplit extension ℤ/4. In the two-row S¹→S³→S² page, d₂:ℤ→ℤ is 1, so kernel=cokernel=0 and (H⁰,H¹,H²,H³)=(ℤ,0,0,ℤ). The five terms become 0→0→0→ℤ→ℤ→0. At m=0 a one-position ℤ page would instead give consecutive identities with composite 1≠0. | Extension ambiguity, arrow directions and m≥1 are correct. No change. |
| 4.1 spectral-object towers | At native (1,−1) in the ×2 example Z₃=ker(2)=0; at page 2 repeated outer endpoints give Z₂=ℤ, B₂=0. For l=2,r=3 the finite recipe yields (0,0,1,2) and (0,1,2,2). For l=0 there are no positions. | Native shift and clamping agree with the pinned recipes. No change. |
| 4.2 decreasing abutment | With n=1, q=n−p+1 sends p=3,4 to q=−1,−2. Images in H¹=ℤ/2 are ℤ/2 and 0; gr³=ℤ/2 occurs at native (3,−2). | Direction and n+1 shift agree in all adapters. No change. |
| 4.3 canonical comparison | For K⁻¹→K⁰ the identity with source filtration zero and target one-step, B∞=0 but Bᵗ=ℤ, so E∞=ℤ while EInfty=0. In the infinite-cycle example Z∞=Zᵗ=0 despite Zᵣ≅ℤ for every finite r. | Comparison hypotheses are substantive; stabilization is not necessary for the canonical identification. No change. |
| 4.4 convergence; Lean:144 | ×2 with n=1,a=−2,b=0,q=−2 gives thresholds r≥2 and r≥3: page 2 is ℤ, page 3 is ℤ/2; F³=ℤ/2 and F⁴=0. | Predicate and theorem give the correct threshold and finite filtration. No change to signatures. |
| R01; 4.4 and 4.6 summaries | K=ℤ[0], G_j=0 for all integer j: every top map is 0→ℤ, mono=true and iso=false; every page=0, union F=0≠ℤ. The map 0→K has page maps 0→0 iso=true, H⁰ map 0→ℤ iso=false. | Refutes the module summary. Replace “monomorphism” by the quantified isomorphism condition. |
| 4.5 quadrant convergence | First quadrant n=0 gives a=0,b=1, only position (0,0), and E₂=H⁰. At n=−1, a=b=0 forces H⁻¹=0. Third quadrant degree −2 has homological positions (0,2),(1,1),(2,0), all total cohomological degree −2. | Signs and empty negative-degree cases agree. No change. |
| 4.6 comparison; Lean:169 | Identity of the stupid ×2 filtration induces identity on page ℤ and H¹=ℤ/2. The filtered inclusion ℤ[0]→(ℤ→id ℤ) induces page identity but H⁰ map ℤ→0; its top comparison ℤ→0 is not iso. | Actual HasConvergenceBounds excludes the bad example. No change to the theorem. |
| 5.1 classical sequence | Classical E₁ at (0,0),(1,0) maps to native page 2 at (1,−1),(3,−2); the differential is +2. Classical E₂ is 0,ℤ/2. A one-step filtration has E₁^(0,q)=H^q(K), other columns zero. | Page offset, native coordinates and first differential are correct. No change. |
| 5.2 induced filtration | K⁻¹=ℤ, K⁰=ℤ^(ℕ)⊕ℤ, d(x)=(0,x), zero source filtration: E∞=ℤ^(ℕ)⊕ℤ and gr⁰H⁰=ℤ^(ℕ). Canonical comparison has kernel 0⊕ℤ, although the objects are abstractly isomorphic. | The canonical-map criterion is stronger than existence of an unmarked isomorphism. No change. |
| 5.3 finite convergence and Euler; Lean:188 | Stupid K^m=ℤ for m≥0 has gr^mH^m=ℤ but no uniform filtration bound across degrees. For ℚ→2ℚ both alternating sums are 1−1=0; over 𝔽₂ the differential is 0 and both homology dimensions are 1, again 0. Using native p alone would give −1−1=−2. | Degreewise bounds and total-degree sign are essential and correct. No change. |
| 5.4 exhaustive comparison; Lean:218 | The identity complex with zero filtration in degree −1 is exhaustive in degree 0 only: E∞=ℤ versus H⁰=0. ℓ-adic ℤ→ℤℓ induces identity graded maps but cokernel ℤℓ/ℤ; the required zero filtration stage does not exist. Identity of stupid ×2 satisfies the bounds and gives identity on ℤ/2. | Exhaustion and lower bounds in the stated adjacent degrees exclude the controls. No change. |
| 6.1 exact couple | On ℤ² use i(x,y)=(x,0), j(x,y)=(y,0), k(x,y)=(0,y). Then im i=ker j=first axis, im j=ker k=first axis, im k=ker i=second axis. jk(x,y)=(y,0), (jk)²=0, H(E)=0, but i²=i≠0. Shifting page origin by 1 changes offset e=1 to 0. | No accidental i²=0 condition; offset is e−k. No change. |
| 6.2 exact-couple towers | D=ℤ/ℓ², i=ℓ, E=(ℤ/ℓ)², j reduction to first factor, k(a,b)=ℓb, for ℓ=2,3. At r=0, (Z₁,B₁)=(E,0); d₁=0 and (Z₂,B₂)=(E,0). Since im i²=0, Z₃=B₃=first factor and E₃=0. | Tower exponents and the r+1 page convention agree. No change. |
| 6.3 couple adapters | a=(−1,1), b=0, c=(2,−1) give dᵣ degree (r+1,−r), native page r+1. For ×2, degree-1 D is 0 at p≥4, ℤ at p=3, ℤ/2 at p≤2; limit=0, colimit=ℤ/2. Replacing k by 0 makes ker k=ℤ while im j=0 at (1,−1). | Couple maps, signs and abutment agree; the zero-map substitute fails exactness. No change. |
| 7.1 difference and completeness | Identity transitions give ker(1−s)=A,coker=0; zero transitions give 1−s=1 and both groups 0. The ℓ tower on ℤ has lim=0, lim¹=ℤℓ/ℤ. For 0→ℓ^nℤ→ℤ→ℤ/ℓ^n→0 the limit sequence is 0→0→ℤ→ℤℓ→ℤℓ/ℤ→0→0. On ℤℓ, lim quotients=ℤℓ and lim¹F=0; constant nonzero F has lim¹F=0 but quotient limit 0. | Difference sign, connecting direction and separation in the completeness converse agree. No change. |
| 7.2 repleteness; Lean:244 | The shear equation x_n=f_n x_(n+1)+t_n is exactly (1−s)x=t. For ℤ/ℓ^n, the limit ℤℓ projects surjectively. The cyclotomic tower in discrete Galois modules has smooth limit 0, so 0→μ_(ℓ^n) is not epi. | Repleteness excludes the intended counterexample; the proof uses categorical epis. No change. |
| 7.2 ML; Lean:255,264 | Identity tower images stabilize at m=n. Zero-transition ℤ/ℓ images stabilize at 0 from m=n+1, with difference=1 and lim¹=0. The ℓ tower on ℤ has images ℓ^(k−n)ℤ strictly decreasing and lim¹=ℤℓ/ℤ≠0. | Predicate is neither “all transitions epi” nor vacuous; vanishing agrees. No change. |
| 7.3 double tower | Constant A^s=ℤ gives Q^s=ℤ,RQ^s=0 and all three nontrivial sequence terms 0. For i=ℓ, Q^s=0,RQ^s=ℤℓ/ℤ, where ×ℓ is invertible; the sequence is 0→0→ℤℓ/ℤ→ℤℓ/ℤ→0. Eventually zero towers give all terms 0. | The two-limit sequence and arrows agree. No change. |
| 7.4 conditional convergence | The limit step couple has E∞^(0,0)=ℤ, A₀^(+∞)=0 and A₁^(+∞)=ℤ; the colimit step couple gives E∞^(0,0)=A₀^(−∞)=ℤ. Constant i=1,E=0 has E∞=0 but both end limits ℤ. | Limit abutment is degree n+1; colimit abutment is degree n. Conditional hypotheses exclude the constant couple. No change. |
| 7.4 whole-plane obstruction | For A₀^s=∏_(i≥abs(s))k, E∞=RE∞=0, but the colimit is ∏k/⊕k and every filtration step equals this nonzero object. Its intersection=W⁰=∏k/⊕k; each graded piece and lim¹ of this constant filtration are 0. | Regularity does not replace W=0. No change. |
| 7.5 complete convergence | ℓ-adic ℤℓ[0] has E∞^(p,−p)=𝔽ℓ=grᵖH⁰ for p≥0, intersection 0 and W⁰=0. ℓ-adic ℤ[0] has the same graded pieces but completion ℤℓ≠ℤ. The finite ×2 example has H¹=ℤ/2 and W=0. | Completeness excludes the false stronger claim; finite specialization agrees. No change. |

For general-category proof routes, checked the extra inputs rather than transferring element arguments silently: the repleteness shear has epimorphic transitions and its projection yields the product difference; stable-image ML towers reduce to epimorphic and pro-zero towers; the double-tower argument uses exact countable products for its two-direction product complex. In complete convergence, exact products commute with cohomology, giving the two vanishing groups from the difference-map isomorphism. These routes consume the declared native APIs and earlier targets. No conclusion is assumed as a hypothesis.

### Source sample and exact locators

All 15 targets in this round's seeded list were inspected. Fourteen have readable supporting passages; §3.5's two cited texts are settled uncertified. Supplemental unavailable locators in otherwise readable targets are listed under Not verifiable. Draft page numbers below are printed numbers, not PDF offsets.

| Seeded target | Readable locator, hypotheses and assessment |
| --- | --- |
| 1.2 Cycle/boundary towers | stacks-012K line 2612–2624, §20, p.53; helle-rognes2024 line 65–70, Lemma 2.2, draft p.2. The inverse-image recursion produces subobjects of the initial page. Incoming-image indexing is corrected in the package; source misprint recorded below. |
| 1.3 Stabilization, regularity, degeneration | stacks-012K line 2634–2637, p.54, and line 3120–3125, Lemma 24.8, p.64. Outgoing versus incoming eventual vanishing matches regular versus coregular; boundedness supplies both. |
| 2.1 Bidegree assignments | stacks-012K line 2981–2992, p.61, and line 3010–3014, Lemma 24.2, p.62. Classical degree (r,1−r) raises total degree by 1. The abstract assignment and native reindexing are expressly the roadmap's generalization. |
| 2.2 Boundedness/stabilization | stacks-012K line 3107–3130, Definition 24.7 and Lemma 24.8, p.64. The support conditions and two vanishing directions agree; the explicit thresholds are derived from the stated assignment laws. |
| 3.2 Convergence structures | helle-rognes2024 line 94–98, Definition 2.7, draft p.2; stacks-012K line 3131–3143, Definitions 24.9 and following discussion, pp.64–65. Helle–Rognes includes exhaustion in weak convergence; the roadmap explicitly distinguishes its convention. |
| 3.4 Finite filtrations | stacks-012K line 3152–3197, Lemmas 24.11–24.12, pp.65–66. Finiteness is in each complex degree, the weak Serre assumption and finite Euler support are retained. Package does not infer splitting of a finite filtration. |
| 3.5 Comparison | Weibel Theorem 5.2.12 and Eilenberg–Moore §7 could not be read. The mathematical completeness/separation and compatible-map claims were tested independently in the table. No certification of these source locators is claimed. |
| 4.1 Spectral-object towers | helle-rognes2024 line 291–303 and line 334–335, Definition 4.5, Remarks 4.6/4.10, draft p.6. Native r is source r+1 and native q is source s−1. Four endpoints and kernel/image formulas agree with the pinned page construction. |
| 5.1 Classical filtered complex | stacks-012K line 3038–3061, Lemmas 24.3–24.4, pp.62–63. The proof of 24.3 uses countable direct sums. The roadmap's arbitrary-abelian construction also has the independently opened Tau Ceti filtered-complex/first-page supply, which removes that restriction; the wider claim is not attributed solely to that proof. |
| 5.2 Induced filtration and limit | stacks-012K line 3062–3106, pp.63–64, and line 3144–3151, Lemma 24.10, p.65. Cycle/boundary equalities characterize the canonical subquotient comparison; they do not characterize existence of any abstract isomorphism. |
| 6.1 Exact-couple sequence | stacks-012K line 2653–2686, Definition 21.1, Lemma 21.2, Definition 21.3, pp.54–55. Exact triangle and derived quotient agree; assembly on the bigrading is a further target using the supplier's fixed degrees. |
| 6.2 Exact-couple towers | stacks-012K line 2687–2703, p.55; helle-rognes2024 line 136–144, Definition 3.3, Lemma 3.4 and Remark 3.5, draft p.3. Image/iterated-kernel formulas agree after the declared page shift. |
| 6.3 Couples of objects/complexes | stacks-012K line 2834–2905, §23, pp.58–59. Lemma 23.2 constructs the graded-category couple without the direct-sum assumption of the introductory discussion; Lemma 23.3 supplies the boundary interpretation. Native degrees checked against the pinned spectral object. |
| 7.2 Epimorphic and ML towers | bhatt-scholze2015 line 701–702 and line 755–770, Definition 3.1.1, Proposition 3.1.10, v2 pp.16–17; stacks-012K line 3715–3735, §31, p.78. Bhatt–Scholze works with replete topoi/sheaves, while Stacks' vanishing statement there is for groups. The package explicitly develops a categorical extension with exact products/repleteness; it does not silently discard these settings. |
| 7.3 Double-tower sequence | helle-rognes2024 line 225–229, equation (3.1), draft p.4; the graded-module setting is stated at line 53–55. The package's exact-countable-products extension includes its product-complex route. Direct Boardman 3.4(b) remains uncertified. |

Also reread the source passages supporting the repaired metadata, the general limit page, filtration completeness, Euler additivity, convergence bounds, conditional convergence and the whole-plane example. Every cited work has one manifest key: ten works, four readable and six settled uncertified. No new source request was made or is outstanding; no manifest entry was rewritten.

### Pinned-library duplication and native definitions

The library checks used Mathlib commit 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti commit 2fd255d997f47c0b5d834ee416c7015d55444ce5. Searched by objects and hypotheses, read the declarations and their surrounding variables, and inspected the near-match leads. Representative decisive openings are listed here; grouped APIs were also checked at their declarations.

| Pinned file and line | Native interface and comparison |
| --- | --- |
| Mathlib/Algebra/Homology/SpectralSequence/Basic.lean:36 | SpectralSequence stores pages and homology-to-next-page isomorphisms, with compatible Hom at 51; it contains no cycle/boundary tower or abutment. pageXIsoOfEq, pageFunctor and pageHomologyNatIso are at 60,90,99. |
| Mathlib/Algebra/Homology/ComplexShape.lean:163 | up' has relation i+a=j, including a=0. No unnecessary nonzero-degree condition is hidden in the exact-couple assembly. |
| Mathlib/Algebra/Homology/SpectralSequence/ComplexShape.lean:36 | Natural and finite restricted shapes occur at 36,47. The HasSpectralSequence vanishing hypotheses prevent deleting a nonzero off-carrier differential. |
| Mathlib/Algebra/Homology/SpectralObject/Basic.lean:41 | H, connecting maps and three exactness fields are actual native data. Page.lean:65 defines the page by short-complex homology; Cycles.lean:59,63 gives cycles and opcycles. |
| Mathlib/Algebra/Homology/SpectralObject/HasSpectralSequence.lean:143 | The E₂ recipe, natural/finite recipes at 176,214, homological recipe at 260, boundary condition at 303 and quadrant classes at 394,437 were read. FirstPage.lean:47,78,114 supplies first-page computations and differentials. |
| Mathlib/CategoryTheory/Filtration/Basic.lean:44 | Filtration is a functor into MonoOver X; FilteredObject at 73 bundles X. It contains no exhaustive, separated or complete axiom. IsStrictHom at 145 is a pullback condition. |
| Mathlib/CategoryTheory/Subobject/Basic.lean:102 | Subobject is the thin skeleton of MonoOver. Lattice.lean:756 gives a lower-interval comparison, not the marked general subquotient transport of §1.1. Image and kernel subobjects are in Limits.lean:120,314. |
| Mathlib/Algebra/Homology/SpectralObject/EpiMono.lean:84 | The four-endpoint isomorphism theorem requires a zero map; the primed endpoint criteria at 183,216 are stronger vanishing cases. They do not state §4.3's top-monomorphism criterion. |
| Mathlib/CategoryTheory/CofilteredSystem.lean:137 | IsMittagLeffler is on a Type-valued functor, using ranges. It is not the package's arbitrary-abelian image-subobject predicate. |
| Mathlib/CategoryTheory/ObjectProperty/Kernels.lean:76 | Kernel/cokernel closure at 76,123, with ContainsZero.lean:38 and Extensions.lean:42, supports the weak Serre formulation; Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean:45 is stronger. |
| Mathlib/CategoryTheory/Functor/EpiMono.lean:158 | Faithful functors reflect monomorphisms; the dual is generated. The priority annotation explains a text-parser miss. ModuleCat/EpiMono.lean:67 gives the cited forgetful preservation of epimorphisms with its universe parameters. |
| TauCeti/Algebra/Homology/SpectralSequence/Comparison.lean:32 | Page isomorphism propagates to later pages; this is not convergence or an abutment comparison. |
| TauCeti/Algebra/Homology/SpectralObject/Abutment.lean:44 | Abutment, image filtration, inclusion and map are at 44,50,54,76. EInftyIsoCokernel at 92 and vanishing/epi criteria at 114,123 give the adapter used here. |
| TauCeti/Algebra/Homology/SpectralObject/Stabilization.lean:51 | Native stabilization requires both endpoint vanishings. Comparison.lean:121 likewise requires top vanishing in n−1,n; it does not supply the new comparison under top isomorphisms in n alone. |
| TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:147 | Spectral object/map and quotient-cohomology comparison at 147,191,224; filtrationFunctor at 304; sequence and first page at 409,425. FirstPage.lean:89 gives the first differential without an extra sign or countable-sums hypothesis. |
| TauCeti/Algebra/Homology/SpectralSequence/Filtered/Convergence.lean:118 | Finite-filtration page/graded comparison uses global bounds; §5.3 permits degree-dependent bounds. Exhaustive.lean:200 is module-only and also assumes upper graded-cohomology vanishing. Both are genuine special cases of the package's kept variants. |
| TauCeti/CategoryTheory/Preadditive/TowerDifference.lean:77 | The difference is 1−s; kernel-limit, naturality and pro-zero invertibility are at 122,150,165. These are imported, not replanned. |
| TauCeti/CategoryTheory/Limits/Replete.lean:91 | IsReplete requires epimorphic projections of existing limit cones; it does not supply existence. Lines 107,118,357 give projections, descent and exact countable products. Explicit countable products remain in the package's theorems. |
| TauCeti/Algebra/Category/ModuleCat/Tower/MittagLeffler.lean:70 | The module predicate uses the underlying-type condition, and line 191 proves module lim¹ vanishing. It does not already prove the arbitrary-abelian theorem. |
| TauCeti/CategoryTheory/GrothendieckGroup/EulerCharacteristic.lean:165 | The bounded-cochain telescoping theorem is an input, not a page-to-filtered-abutment identity. Abelian.lean:216 supplies the additive invariant API. |

The same-name ML search hit is therefore not a duplicate. Other search hits about spectral spaces, order bounds and incidence algebras use different objects. No fully qualified declaration of this package was found in the readable competing roadmap declarations. The two supplied citation warnings concern DoubleComplex.edgeBottom and DoubleComplex.edgeLeft; the main DerivedModuleAlgebra compatibility table at README:65 explicitly maps both to §S.1, and this package attributes them there.

### Ownership, overlap and supplier order

Read the board package index before checking absence. No same-named roadmap exists on the supplied main checkout. The overlap facts show no second copy, competing head changing this roadmap, dropped cited id or citation defined only by an open revision. Read the named open heads using the roadmap service, and searched its main/open corpus by objects, including spectral sequences, exact couples, cycle/boundary towers, double towers, ML and replete abelian categories. Read DerivedModuleAlgebra, StableHomotopyKTheory and EnhancedDerivedSheaves on main for house shape as well as ownership.

| Resolved supplier or closest scope | Ownership and present-head resolution |
| --- | --- |
| TauCetiRoadmap/StableHomotopyKTheory/README.md:2618, §7.22 | Owns arbitrary-abelian bigraded exact couples and derived couples of fixed degrees. This package imports these, owns assembly/towers/comparisons, and declares the morphism gap. §§7.21,7.23–7.26 concern filtered spectra and their homotopy-group applications, not a second generic abelian-category construction. |
| TauCetiRoadmap/DGFloer/README.md:621, Layer 1 item 3 | Module filtered-complex adapters and convergence, with native coordinate (2p+q+1,−p−1). The package keeps the explicitly different arbitrary-abelian extension. Item 2 owns the Serre application. |
| TauCetiRoadmap/DerivedModuleAlgebra/README.md:955, §S.1 | Owns finite double-complex specialization, iterated-cohomology page, edges and five terms; its line-65 compatibility table resolves the two older names. Generic convergent-sequence consequences here do not rebuild that adapter. |
| TauCetiRoadmap/AlgebraicTopology/README.md:2145, §6.0, main; open #1807 and #1808 | Main §6.0 imports native module tower algebra and owns restriction/topological towers and specified homotopy-square maps. Open scopes retain module filtered-complex applications. In #1808, Stage 5.0 explicitly uses complexes of modules; its homological native coordinate (1−2s−t,s−1) agrees with the package's cohomological convention. No head owns the arbitrary-abelian extension here. |
| TauCetiRoadmap/SchemeAndStackFoundations/README.md:4184, §2.2; :4977, §2.17 | Owns Leray/Čech and replete-topos/sheaf applications. §2.17 imports the native category repleteness predicate and supplies derived limits of epimorphic sheaf towers. This package owns the ordinary category-level characterization, not those derived sheaf constructions. |
| TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1294, E2:towers.1; :2035, E2.1; :2083, E2.2 | Coherent stable towers, sheaf Milnor sequences and enhanced derived comparisons. Read main and #1330/#1630: the cited ids remain; line numbers move but scope does not transfer ownership of ordinary abelian image towers. |
| TauCetiRoadmap/ArithmeticGaloisDuality/README.md:43 at #858 | Compact-coefficient arithmetic scope; its module tower supply at lines 593–594 is imported. No competing generic convergence owner. |
| TauCetiRoadmap/ComplexKahlerGeometry/README.md:363 and :3317 | The K8 compatibility mapping leads to Layer 8, whose construction is the Frölicher/geometric adapter. Its underlying filtered-complex supply is distinguished from the general theory here. |

HeegaardFloer and MorseTheory uses were read as examples/consumers, not upward suppliers. The two board packages listed for review, AnalyticNumberTheory and LawrenceVenkateshMethod, do not own this generic interface. No prohibited supplier is consumed. The nearest-results/headings list contains no additional candidates.

The single declared contract, gap:exact-couple-morphisms, occurs with matching slug and supplier in packages/SpectralSequencesAndConvergence/design/plan.json and README:340–345. It specifies bigraded D/E maps of fixed a,b,c commuting with i,j,k, identities/composition and functorial passage to derived couples. StableHomotopyKTheory §7.22 does not yet provide that API. This is a precise, minimal named supplier contract, not an unowned prerequisite or drift finding. Any eventual acceptance remains conditional on it.

The requested dependency check returned exactly:

    depcheck: 240 roadmaps, 2170 edges, 0 problem(s)

No UPWARD, CYCLE or moved line was emitted. Read all Needs clauses, including proof-route inputs. The internal build has explicit edges 3.2→1.4/2.1/3.1, 4.4→3.2/3.4/4.3, 5.3→4.4, 6.3→4.1/5.1 and 7.4→6.2/7.1–7.3. No use of a later theorem as its own prerequisite was found.

Overlap check: read AlgebraicTopology (main, #1807, #1808), EnhancedDerivedSheaves (main, #1330, #1630), ArithmeticGaloisDuality (#858), DerivedModuleAlgebra (main) and StableHomotopyKTheory (main); shared module tower algebra belongs to Tau Ceti, topological tower adapters to AlgebraicTopology, coherent/sheaf derived limits to EnhancedDerivedSheaves and SchemeAndStackFoundations, double-complex specializations to DerivedModuleAlgebra, exact couples to StableHomotopyKTheory §7.22, and the generic convergence/image-tower extensions to this roadmap. No conflicting owner of those extensions was found.

### Headline coverage, elaboration and padding

The headline inventory follows README:3–22 and the repleteness headlines explicitly added in the module summary.

| Headline family | Acceptance-test coverage |
| --- | --- |
| Bounded stabilization and regularity | Suggested.lean:96,108 states the two native differential-vanishing theorems. Tower formulations require the constructed towers of §§1.2–1.4. |
| General convergence and comparison | Suggested.lean:36–43 names the unavailable arbitrary-sequence E∞ carrier and recursive towers. The native spectral-object and filtered-complex comparison statements are at 169,218. |
| Vanishing, dimension, Euler, rows/columns, edges and five terms | Suggested.lean:38–40 identifies their missing convergence carrier. The filtered-complex Euler theorem is stated at 188. |
| Spectral-object towers, limit and bounded convergence | Native convergence is stated at 144 using the real predicate at 121, and comparison at 169. General tower identification uses the unavailable recursive construction. R01 concerns only the inaccurate introductory hypothesis. |
| First-/third-quadrant convergence | Suggested.lean:44–50 names the missing convergence structure and cites the already-native page identifications. No duplicate page-isomorphism theorem is added. |
| Finite, cohomologically bounded and exhaustive bounded-below complexes | Native convergence bounds and Euler cover the statable forms. Suggested.lean:51–55 identifies the missing nonstabilizing E∞ for general exhaustive convergence; its statable comparison is at 218. |
| Exact-couple sequence, towers and identification | Suggested.lean:56–60 names the absent bigraded/derived exact-couple construction, supplied by StableHomotopyKTheory §7.22. No arbitrary Prop or sorry-defined stand-in appears. |
| Boardman conditional and complete convergence | Suggested.lean:51–60 names the missing E∞, cycle-tower lim¹ and whole-plane obstruction. |
| Repleteness and ML vanishing | Suggested.lean:244,264 states both headlines; line 255 defines the image-subobject ML condition concretely. |

Ran the required lake env lean elaboration on the original package Suggested.lean from the pinned content checkout: **exit 0; eight “declaration uses sorry” warnings and no other diagnostics**. The five used Tau Ceti imports already had object files. No build or library change was needed.

Appended #check @name for all **11** actual declarations in one scratch copy and elaborated it successfully. Compared all types with their README statements: category/abelian parameters, grading injections, page inequalities, exact sequential colimits, finiteness and weak Serre assumptions, countable products and repleteness are retained. No section hypothesis disappeared. The supplied scanner's supposed twelfth declaration “that” is docstring prose.

The one-tactic probe was run on every admitted theorem, using separate one-tactic attempts with simp, rfl and infer_instance on a scratch copy. All eight failed to close:

| Theorem (Suggested.lean line) | Probe and exact-lemma audit |
| --- | --- |
| dFrom_eq_zero_of_boundedBelow (96) | No probe closes; the support bound must first be transported through the assignment. |
| dTo_eq_zero_of_boundedAbove (108) | No probe closes; incoming-degree transport is required. |
| convergence_of_hasConvergenceBounds (144) | No probe closes; native endpoint-vanishing stabilization has stronger hypotheses. |
| isIso_hom_app_abutment_of_hasConvergenceBounds (169) | No probe closes; the native comparison requires top vanishing in two degrees. |
| sum_negOnePow_homology_eq_sum_negOnePow_page (188) | No probe closes; the bounded-cochain Euler lemma does not directly compare the spectral page with filtered homology. |
| isIso_homologyMap_of_isIso_page_of_exhaustive_of_boundedBelow (218) | No probe closes; the native exhaustive theorem is module-specific and needs additional upper graded vanishing. |
| isReplete_iff_countableAB4Star_and_epi_towerDifference (244) | No probe closes; the native API supplies one exactness consequence, not this equivalence. |
| epi_towerDifference_of_isMittagLeffler (264) | No probe closes; the existing ML vanishing theorem is for modules, not arbitrary abelian C. |

The relevant exact-library-lemma candidates were opened at the pins, as listed above; none supplies the whole corresponding conclusion in one application. No theorem merely restates a definition, computes a small value, treats a boundary case or mirrors a README Check. No statable headline was found absent or forced through a stand-in. Every import is permitted, and the file has the prescribed namespace, module/individual docstrings and theorem form.

### Wording, arrangement and reuse

Fresh comparison covered 22 passages with the four readable sources: the 14 readable seeded sections, plus §§1.1,1.4,2.3,3.1,4.4,7.4, the Layer 3 circle-method example and the ML declaration's docstring. This includes definition wording, remarks and proof routes. Additional locators include stacks-012K line 1158–1182 and line 2349–2368; helle-rognes2024 line 71–93, line 145–247 and line 943–968; browning-sawin2020 line 57–75 and line 568–587. Standard terms and forced formulas agree; no copied sentence, disguised clause-by-clause passage, source table, figure or exercise list was found. The publication/version additions were also checked against the headers and numbered items.

Counted explicit source-key citations before References, without splitting one citation into its individual theorem numbers: Stacks 42; Helle–Rognes 21; Weibel 11; Boardman 5; Eilenberg–Moore 2; Bhatt–Scholze 2; McCleary 1; Massey 1; Browning–Sawin 1. Total 86.

Read the largest source's contents at stacks-012K line 7–41. Its §§19–25 run through filtrations, spectral sequences, exact couples, differential objects, filtered differential objects, filtered complexes and double complexes; inverse systems are §31. The roadmap has a separate generic convergence layer and spectral-object layer, puts filtered-complex adapters before exact-couple identification, and finishes with conditional convergence. There is no one-to-one matching run. The Needs edges recorded above force the build direction. The arrangement is not the source's chapter sequence with renamed headings.

Source independence: 22 passages compared with 4 readable sources, no copied expression found; largest share stacks-012K, 42 of 86 source-key citation occurrences; contents compared with stacks-012K: independent. Wording against the six settled uncertified sources was not tested.

## Not verifiable

- weibel1994 is settled uncertified: §§3.5,5.2,5.5,5.9, including Definitions 5.2.5/5.2.11, Theorem 5.2.12, the two-row/column exercises, Theorems 5.5.1/5.5.10 and 5.9.1–5.9.4. Mathematical controls were checked independently; exact book text and locators are not certified.
- eilenberg-moore1962 is settled uncertified: §7 comparison/complete convergence text was unavailable.
- boardman1999 is settled uncertified: 3.4(b), Definition 5.10 and Theorems 7.1,8.2,8.10,8.13 were not read directly. The readable Helle–Rognes formulations and their references were checked.
- mccleary2001 is settled uncertified: chapters 2–3, including edge and two-row/column discussions, were not read.
- massey1952 is settled uncertified: the original exact-couple article was not read; the Stacks construction provides an independent readable source.
- cartan-eilenberg1956 is settled uncertified: Chapter XV is background/reference here and was not read.
- Bhatt–Scholze's journal numbering and Browning–Sawin's journal numbering were not compared with the read arXiv versions. Their manifest notes expressly record this limitation; the README identifies the versions whose numbered statements were read.

These are settled access limitations, not new source requests or package findings. No source was obtained from an unclassified or unauthorized host. No package input was changed by this review.

## Source issues

- **Misprint** in helle-rognes2024 at Lemma 2.2 proof, draft p.2 (line 69; publisher p.1856, line 87): the source says the outgoing differential's image lies in its source position; it should be the incoming differential's image, indexed s+r; affects the proof.
- **Misprint** in helle-rognes2024 at Proposition 4.9 proof, draft p.6 (line 332; publisher line 381): the source says the boundary image uses differential index s−r; it should be s+r, agreeing with the proposition's formula; affects the proof.
- **Misprint** in stacks-012K at Lemma 24.11 proof, p.65 (line 3162): the source says vanishing of F^(p+r)K^n forces the cycle preimage to be the kernel; it should use vanishing of F^(p+r)K^(n+1), the target of the differential; affects the proof.
- **Misprint** in stacks-012K at Lemma 24.13 proof, p.67 (lines 3225–3227): the source says a degree-n preimage is a sum involving d(F^(p+r)K^n), in degree n+1; it should use F^(p+r)K^n itself plus the degree-n kernel; affects the proof.
- **Error** in stacks-012K at Lemma 24.13 proof, p.67 (lines 3229–3232): the source says an H^(n−1) isomorphism makes ambient boundaries in the filtered subcomplex internal boundaries; it should use injectivity on H^n with the degree-n bound; affects the proof.

For the last error, take K=(ℤ→id ℤ) in degrees n−1,n and L containing only K^n. Then H^(n−1)(L)→H^(n−1)(K) is 0→0, but internal boundaries are 0 and ambient boundaries intersect L^n in ℤ. Injectivity on H^n fails. The package uses the corrected degree-n condition. None of these source errors is inherited by its mathematical statements.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "d281c6f04ecafa2ce08efe637072e372a3f7a7b4", "job": "REV-PKG-SpectralSequencesAndConvergence~2", "model": "gpt-6-astra", "worker": "chris-6"} -->
