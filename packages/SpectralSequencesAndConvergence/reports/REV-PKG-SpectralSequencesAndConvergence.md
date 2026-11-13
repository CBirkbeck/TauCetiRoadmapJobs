<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14997#issuecomment-6867449319 -->
Review (codex) of fb054d9

Verdict: needs_changes

1. **F01** (P3) Correct the Helle–Rognes publication year and identify the version read

   **Location:** `packages/SpectralSequencesAndConvergence/sources.toml:43`, `year = 2024`; the entry at lines 39–53 has no version note.

   **Claim:** The recorded work is a 2024 publication, with the cited numbering supplied by the recorded author-page copy.

   **Witness:** Author draft: `helle-rognes2024 line 59`, dated 2018. Publisher extraction: `helle-rognes2024 line 41`, Documenta Mathematica 24 (2019), 1855–1878. Neither version is dated 2024.

   **Exact repair:** Keep the immutable key `helle-rognes2024`. Set `year = 2019`, add the journal citation to the reference, and add a version note identifying the cached author draft dated 2 February 2018 as the version used for README line locators. Preserve its recorded URL, hash and access information. For example: “Published in Documenta Mathematica 24 (2019), 1855–1878. README line locators refer to the author draft dated 2 February 2018; Lemma 2.2, Theorems 3.9–3.10, equation (3.1), and Example 8.1 retain those numbers in the published version.”

   **Repair verification:** The author draft has Theorems 3.9–3.10 at lines 163–168 and equation (3.1) at lines 225–229. The publisher extraction has those same numbers at lines 188–194 and 264–267, respectively, and Example 8.1 at line 980. Thus correcting the year and describing the version preserves the verified mathematical locators. Publication metadata also appears in the [publisher copy](https://ems.press/content/serial-article-files/26495).

One P3 finding; no P1 or P2 findings. The mathematical statements tested below survived the adversarial pass. The original Lean file elaborates, and the dependency check passes. This is not an acceptance: the source record needs the repair below.

## Verified sound

### Coverage and principles

Read all four package inputs, all 31 numbered targets, all 31 Checks blocks (114 bullets), all supplier contracts and dependency lines, and all 11 actual Lean declarations. No previous package review or maintainer notes were supplied. Read the board package index before the ownership audit. There is no `SpectralSequencesAndConvergence` folder on the supplied main checkout, and the overlap report identifies no competing head changing this roadmap, dropped cited id, or id supplied only by an open revision.

The scope is a general theory in abelian categories, with additional exactness, products, coproducts and repleteness assumptions placed where used. Module and first-quadrant specializations are distinguished from the general constructions. No route-specific prime restriction, computational algorithm, sorry-defined data, `set_option`, second plan of an existing roadmap, upward supplier edge or cycle was found. The declared exact-couple morphism gap has a named owner and matching text in the README and plan.

The README has the requested summary, ownership, conventions, contracts, build explanation, seven layers, examples and dependencies for every layer, consumers and references. Each numbered target has at least three Checks; the defining paragraphs retain their prose API. All 11 locally attributed Lean names are declared in `Suggested.lean`. Formula variables, library identifiers and explicitly attributed supplier compatibility names were kept separate when resolving backticks. No pull-request numbers, machine paths, hand-off narrative or HTML anchors occur in the roadmap inputs.

### Computed adversarial table

The table records the seeded targets, every summary headline, the supporting definitions and the main convention checks. A zero object is denoted 0; equality of categorical objects below means the specified canonical identification. Each row records actual values, including controls that reject an incorrect hypothesis or convention. The remaining API clauses were checked against their constructions, especially preimage/image adjunctions, exactness, composition and restriction of the degree set.

| Statement | Instances and computed values on the two sides | Result / change |
| --- | --- | --- |
| 1.1 marked subquotient presentation | For A=ℤ, B=4ℤ, Z=ℤ, inverse images of 0, 2ℤ/4ℤ, ℤ/4ℤ are 4ℤ, 2ℤ, ℤ. For X=0, B=Z and the interval has one element. Swapping coordinates of ℤ² sends the first axis to the second; the canonical marking sends it to itself. | Order correspondence and marking distinction hold; no change. |
| 1.1 nested transport | With B=8ℤ in Z=ℤ, take I=0, I′=4ℤ/8ℤ, K′=2ℤ/8ℤ, K=ℤ/8ℤ. Direct and two-stage transport both give denominator 4ℤ, numerator 2ℤ, and quotient ℤ/2. | Naturality test holds. |
| 1.2 cycle/boundary recursion | For d₂:ℤ at (0,1) →ℤ at (2,0), x↦2x, source (Z₃,B₃)=(0,0), target (ℤ,2ℤ); quotients are 0 and ℤ/2, exactly page 3. For d=0, every pair is (A,0). | Both directions of the vanishing criteria hold on these controls. |
| 1.3 stabilization and degeneration | In that example d₂≠0 and dᵣ=0 for r≥3. Stabilization begins at 3 at both nonzero page-2 positions; source incoming maps already vanish at 2. Zero differentials from the starting page give identity transports and degeneration there. | Regular/coregular directions are not interchanged. |
| 1.4 general limit page | For the filtered identity complex in 1.4 and ℓ=2 or 3, Zᵣ(0,0)=ℓ^(r−1)ℤ, Bᵣ=0: every quotient is isomorphic to ℤ, whereas intersection Zᵣ=0 and E∞=0. At the target of ×2, E∞=ℤ/2. | Limit page is not defined by abstract stabilization of isomorphism types. |
| 2.1 assignments | At native (1,−1), page 2 goes to (3,−2): total degree 0→1; E₂ filtration coordinate 1→3, rise 2; classical coordinate 0→1, rise 2−1. For homological (2,1)→(0,2), (fil,deg) changes (−2,−3)→(0,−2). | e=0 and e=1 assignments have the advertised signs. |
| 2.1 wrong assignments | Choosing fil=q on cohomological pages gives rises −1 at r=2 and −2 at r=3. These would require e=3 and e=5, so no fixed e works. Choosing (fil,deg)=(p,p) sends (0,0) and (0,1) both to (0,0). | Both wrong models fail a stated law. |
| 2.2 outgoing bound / Lean line 96 | In a first quadrant at (1,0), n=1, use β(2)=3. Bound is r≥3−1=2; at r=2 the target is (3,−1), whose object is 0, hence dFrom=0. With page offset 1 the same inequality adds exactly 1. | Computed endpoint agrees with the signature. |
| 2.2 incoming bound / Lean line 108 | Use α(0)=−1 at (1,0): r≥1−(−1)=2. At r=2 the source is (−1,1), so dTo=0. For the infinite-cycle example, degree 0 has one nonzero position but Zᵣ=ℓ^(r−1)ℤ never stabilizes; degree 1 has infinitely many nonzero positions. | Adjacent-degree finiteness, not finiteness in the tested degree alone, is used. |
| 2.3 page Euler characteristic | ℤ/4→ℤ/2 surjective in total degrees 1→2 gives lengths (2,1) before and (1,0) after: −2+1=−1=−1+0. Over ℚ, ×2 gives −1+1=0=0. For 0→k→k^(ℕ)→k^(ℕ)→0, finrank gives 0 versus 1+0. | Additivity/finite-dimensionality control is substantive. |
| 3.1 filtration predicates | On ℤ with ℓ-adic filtration: union=ℤ, intersection=0, quotient limit=ℤℓ≠ℤ. On ℤℓ the quotient limit is ℤℓ. Constant nonzero filtration has union=X and intersection=X; zero filtration has union=0 and intersection=0. | Exhaustive, separated and complete are distinguished. |
| 3.1 finite filtration and extension | ℤ/4 with F¹=2ℤ/4 has graded pieces (ℤ/2,ℤ/2), as does (ℤ/2)² filtered by a summand. Underlying exponents are 4 and 2, so the objects differ although graded pieces agree. Identity filtered morphisms induce 1 on both pieces and on the object. | Five-lemma assertion concerns a compatible map, not reconstruction from unmarked pieces. |
| 3.2 convergence structures | Stupid filtration of ℤ→2ℤ has E∞^(0,0)=0, E∞^(1,0)=ℤ/2, and exactly the corresponding graded pieces of H¹=ℤ/2. The zero sequence with constant H⁰=ℤ has all graded pieces 0, hence weak convergence but intersection ℤ≠0. With I empty there are zero β obligations. | Weak/ordinary/strong and degree restriction are separated correctly. |
| 3.3 morphisms | On the one-step ℤ example with β=1, page map −1 and abutment map 1 give β′E∞(f)=−1 but gr(h)β=1. Identity gives 1=1; the pair of zero maps gives 0=0. | Compatibility excludes an arbitrary unrelated abutment map. |
| 3.4 finite convergence / Euler identity | Two graded factors ℤ/2 give length 2 for both ℤ/4 and (ℤ/2)². Zero pages and H¹=ℚ, converging only in I={0}, give page sum 0 versus abutment sum −1. Zero pages with constant H⁰=ℚ give 0 versus 1. | Both global degree coverage and finite filtrations are necessary as stated. |
| 3.5 comparison | ℤ→ℤℓ has identity grᵖ=ℤ/ℓ for p≥0 but nonzero cokernel ℤℓ/ℤ; the source is incomplete. The constant-filtration ℤ→0 has page maps 0→0 isomorphisms but abutment kernel ℤ. A finite filtered identity gives identical graded and abutment maps. | Completeness and separation controls reject the false stronger theorem. |
| 3.6 vanishing and dimension | In the rational ×2 example, total-degree-1 page dimension is 1, limit dimension 0, abutment dimension 0. With zero differential all three are 1. When all graded pieces vanish, exhaustive and separated force the common filtration step to be both H and 0. | Inequality, equality criterion and vanishing agree. |
| 3.6 two columns and two rows | Two columns ℤ/2,ℤ/2 permit 0→ℤ/2→ℤ/4→ℤ/2→0, with no splitting. For the two-row S¹→S³→S² page, d₂:ℤ→ℤ is 1; its kernel and cokernel are 0, so (H⁰,H¹,H²,H³)=(ℤ,0,0,ℤ). | Sequence directions and extension ambiguity agree. |
| 3.6 edges and five terms | For that same page, the five terms are 0→0→0→ℤ→ℤ→0 with middle differential 1. With only E₂^(0,0)=ℤ, setting m=0 would place ℤ→H⁰→ℤ with both maps 1; their composite is 1≠0. | The restriction m≥1 excludes the failure. |
| 4.1 spectral-object towers | For the stupid ×2 complex, native (1,−1) has Z₃=ker(2:ℤ→ℤ)=0. At page 2, four indices have repeated outer endpoints, giving Z₂=all and B₂=0. Finite recipe l=2,r=3 gives (0,0,1,2) and (0,1,2,2); l=0 gives no positions. | Clamping and first-page values agree. |
| 4.1 restricted natural positions | The identity-complex control has native page-2 objects ℤ at (−1,1) and (1,0), with d₂ an isomorphism. Removing (−1,1) would make homology at (1,0) be ℤ; the page recipe instead gives 0 on page 3. | The stated HasSpectralSequence hypothesis excludes this attempted restriction. |
| 4.2 decreasing abutment | At n=1 the rule q=n−p+1 sends p=3,4 to q=−1,−2. Their images in H¹=ℤ/2 are ℤ/2 and 0; gr³=ℤ/2 lies at native (3,−2). Using q=p would give an increasing family. | Shift by n+1 and direction are correct. |
| 4.3 canonical subquotient | For K⁻¹→K⁰ the identity, with FᵖK⁻¹=0 and the one-step filtration on K⁰, B∞=0, Bᵗ=ℤ, E∞=ℤ and EInfty=0. In the infinite-cycle control Z∞=Zᵗ=0 although every Zᵣ≅ℤ. | Comparison is not asserted to be an isomorphism without its hypotheses. |
| 4.4 convergence bounds / Lean lines 121,144 | For ×2, n=1,a=−2,b=0,q=−2 gives lower bounds r≥2, r≥3; native page 2 is ℤ and page 3 is ℤ/2. F³=ℤ/2,F⁴=0. With all finite stages 0 and K=ℤ[0], top maps 0→ℤ are mono but not iso; abutment filtration remains 0. | Top isomorphism, rather than mono alone, is needed for exhaustiveness. |
| 4.5 quadrants | First quadrant n=0 gives a=0,b=1 and only (0,0), whose E₂ equals H⁰. For n=−1, a=b=0 forces H⁻¹=0. Third quadrant m=−2 gives a=−2,b=1 and homological positions (0,2),(1,1),(2,0); each has cohomological degree −2. | Degree signs, empty negative degree and endpoint bounds agree. |
| 4.6 comparison / Lean line 169 | The filtered inclusion ℤ[0]→(ℤ→id ℤ) in degrees −1,0 induces page identity ℤ→ℤ but H⁰ map ℤ→0. The target top map is ℤ→0, failing HasConvergenceBounds. With identity on the stupid ×2 complex, page and abutment maps are respectively 1ℤ and 1_(ℤ/2). | General comparison excludes the false control. |
| 5.1 classical adapter | Classical E₁ at (0,0),(1,0) becomes native page 2 at (1,−1),(3,−2); differential is +2. E₂ is 0,ℤ/2. The one-step filtration of K has E₁^(0,q)=H^q(K) and all other terms 0. | Offset, total degree and first differential agree with the pinned construction. |
| 5.2 induced comparison | For K⁻¹=ℤ, K⁰=ℤ^(ℕ)⊕ℤ, d(x)=(0,x), and zero source filtration, E∞=ℤ^(ℕ)⊕ℤ and gr⁰H⁰=ℤ^(ℕ). The canonical map has kernel 0⊕ℤ≠0 even though the two objects are abstractly isomorphic. | Canonical equality criterion is not confused with existence of some β. |
| 5.3 convergence and Lean Euler line 188 | Degreewise stupid filtration of K^m=ℤ for m≥0 gives gr^mH^m=ℤ with no uniform zero stage. For ℚ→2ℚ both alternating sums are 1−1=0; over 𝔽₂ both H⁰,H¹ are 𝔽₂ and again 1−1=0. At native positions the incorrect sign (−1)^p gives −1−1=−2. | Degreewise finiteness and signs in the Lean statement are correct. |
| 5.4 exhaustive bounded-below / Lean line 218 | The nonexhaustive identity-complex control is exhaustive on K⁰ but not K⁻¹: E∞=ℤ versus H⁰=0. For ℓ-adic ℤ→ℤℓ, all graded maps are 1_(ℤ/ℓ), but cokernel on H⁰ is ℤℓ/ℤ≠0 and neither filtration is bounded below. Identity of the stupid ×2 filtration satisfies a=−2 and gives H¹ map 1. | The two exhaustiveness degrees and two bounded-below degrees match the signature. |
| 6.1 exact couple and page shift | On ℤ², i(x,y)=(x,0), j(x,y)=(y,0), k(x,y)=(0,y): im i=ker j=first axis; im j=ker k=first axis; im k=ker i=second axis. jk(x,y)=(y,0), (jk)²=0, H(E,jk)=0 but i²=i≠0. For k=1, offset e=1 becomes 0 and filtration rise is r. | Exactness does not accidentally impose i²=0; offset is e−k. |
| 6.2 exact-couple towers | With D=ℤ/ℓ², i=ℓ, E=(ℤ/ℓ)², j reduction into first factor, k(a,b)=ℓb: d₁=0, Z₂=E, B₂=0. At the next step im i²=0, Z₃=first factor and B₃=first factor, so E₃=0. At r=0 the formulas give Z₁=E,B₁=0. | Exponent r, not r+1, computes Z_(r+1). Tested at ℓ=2 and 3. |
| 6.3 spectral-object exact couple | a=(−1,1), b=0, c=(2,−1) gives dᵣ degree (r+1,−r), exactly native page r+1. For ×2 the total-degree-1 D tower is 0 for p≥4, ℤ at p=3, ℤ/2 for p≤2; its limit is 0, colimit ℤ/2 and image filtration jumps at p=3. Replacing k by 0 gives ker k=ℤ≠0=im j at (1,−1). | Couple, page and abutment conventions agree. |
| 7.1 lim and lim¹ | Constant identity tower has kernel(1−s)=A, cokernel=0. Zero transitions give 1−s=1 and both groups 0. Multiplication by ℓ on ℤ gives lim=0, lim¹=ℤℓ/ℤ. For 0→ℓ^nℤ→ℤ→ℤ/ℓ^n→0 the six-term sequence becomes 0→0→ℤ→ℤℓ→ℤℓ/ℤ→0→0. | Difference sign and boundary orientation are consistent. |
| 7.1 completeness | For ℤℓ with F^n=ℓ^nℤℓ, lim quotients=ℤℓ and lim¹F=0; for ℤ, lim quotients=ℤℓ and lim¹F=ℤℓ/ℤ. Constant F^n=X has lim¹F=0 but meet X, so its quotient limit is 0 rather than X. | The converse includes separation. |
| 7.2 repleteness / Lean line 244 | In the shear construction, compatibility is x_n=f_n x_(n+1)+t_n, exactly (1−s)x=t. For the quotient tower ℤ/ℓ^n, lim=ℤℓ and every residue projection is onto. For the cyclotomic tower in discrete Galois modules, smooth ℤℓ(1)=0, so projection to μ_(ℓ^n) is 0→nonzero. | The repleteness predicate rejects the nonreplete category; proof uses categorical epimorphisms. |
| 7.2 Mittag–Leffler / Lean lines 255,264 | Zero-transition ℤ/ℓ has stable images 0 from m=n+1 and difference=1, hence lim¹=0. Multiplication-by-ℓ tower on ℤ has images ℓ^(k−n)ℤ, strictly decreasing, and lim¹=ℤℓ/ℤ≠0. Identity tower stabilizes already at m=n. | The predicate is weaker than eventually epimorphic transitions and excludes the required counterexample. |
| 7.3 double tower | Constant A^s=ℤ gives Q^s=ℤ,RQ^s=0 and exact sequence 0→0→0→0→0. For i=ℓ, Q^s=0,RQ^s=ℤℓ/ℤ, with transition ×ℓ bijective; the sequence is 0→0→ℤℓ/ℤ→ℤℓ/ℤ→0. An eventually zero tower gives all three terms 0. | Countable exact products suffice for the two-direction product complex; no elementwise epimorphism assumption is smuggled in. |
| 7.4 conditional convergence degree shift | The limit step couple has E∞^(0,0)=ℤ, A₀^(+∞)=0, A₁^(+∞)=ℤ; gr⁰A₁^(+∞)=ℤ. The colimit step couple instead has E∞^(0,0)=ℤ=A₀^(−∞). The constant i=1,E=0 couple has zero pages but A_n^(±∞)=ℤ, so neither conditional hypothesis holds. | Limit abutment must be n+1; colimit abutment must be n. |
| 7.4 whole-plane obstruction | For A₀^s=∏_(i≥|s|)k, E∞=0 and RE∞=0, while A₀^(−∞)=∏k/⊕k and every filtration step is that quotient. Thus meet=∏k/⊕k=W⁰≠0, but every graded piece and lim¹ of the constant filtration are 0. | W=0 cannot be omitted or replaced by regularity. |
| 7.5 complete convergence | ℓ-adic ℤℓ[0] gives E∞^(p,−p)=𝔽ℓ for p≥0, grᵖH⁰=𝔽ℓ, intersection 0 and W⁰=0. ℓ-adic ℤ[0] has the same graded values but completion ℤℓ≠ℤ. The finite ×2 complex gives H¹=ℤ/2 and W=0. | Complete and finite cases agree with the earlier layers; incomplete control is excluded. |

For 7.2 the forward proof of the repleteness characterization was also checked without interpreting an epimorphism as elementwise surjectivity: each shear transition is an epimorphism, and its limit projection followed by the split projection to the product is precisely the difference map. For 7.3, taking limits in the other order identifies the image diagram with a cofinal reindexing of A; the product double complex has no degree-two contribution in that order. For 7.5, exact products commute with cohomology, so invertibility of the difference map on the product complex gives both vanishing groups required for conditional convergence. These steps justify the general-category extensions of the module sources.

### Seeded source sample

Line references without a version qualifier below use the original supplied cache extractions. The publisher copy of Helle–Rognes is additionally identified where used; it does not replace the author-draft line numbering. Six works remain settled as uncertified; their contents were not guessed and no replacement request was made.

| Seeded target | Locator read and assessment |
| --- | --- |
| 1.1 Subquotient presentations | `stacks-012K line 2614–2619`, §20, p.53, and `helle-rognes2024 line 68–70`, Lemma 2.2, p.2: subobjects lift through the quotient. The roadmap explicitly retains the marking, with a nontrivial swap control. |
| 2.1 Bidegree assignments | `stacks-012K line 2981–2992`, p.61, and lines 3010–3014, Lemma 24.2, p.62: total degree p+q and differential (r,1−r). The abstract assignment is the roadmap's stated generalization, with native/homological witnesses. |
| 2.2 Boundedness and stabilisation | `stacks-012K line 3107–3130`, Definition 24.7 and Lemma 24.8, p.64: both directions of boundedness and regular/coregular implications agree. The roadmap supplies its explicit threshold calculation rather than attributing that exact formula to the source. |
| 2.3 Euler characteristics of pages | `stacks-012K line 1158–1182`, Definition 10.1 and Lemma 10.3, pp.23–24; lines 3185–3197, proof of Lemma 24.12, p.66: finite even/odd sums, weak Serre closure and the page-step identity. The finite total-degree regrouping is valid for a general bidegree assignment. |
| 3.2 Convergence structures | `helle-rognes2024 line 94–98`, Definition 2.7, p.2, and `stacks-012K line 3131–3143`, Definition 24.9, pp.64–65. The conventions explicitly disclose both differences: exhaustiveness in Helle–Rognes weak convergence, and canonical comparisons/regularity in Stacks. Weibel Definition 5.2.11 is uncertified. |
| 3.5 The comparison theorem | Weibel Theorem 5.2.12 and Eilenberg–Moore §7 are uncertified. Independently checked the stated route: rebasing, compatible graded maps, finite induction, exact sequential colimits and completeness. No claim of reading those two source proofs. |
| 3.6 Consequences | Weibel §5.2 exercises and McCleary Ch.2 are uncertified. The explicit two-row, two-column, dimension and five-term computations above independently check the formulations. |
| 4.2 The abutment as a decreasingly filtered object | `helle-rognes2024 line 145–152`, Definition 3.6, p.3, gives the image filtration. The precise n−p+1 adapter is checked against Tau Ceti's `abutmentFiltration` and `EInftyIsoCokernel`, not attributed verbatim to Helle–Rognes. |
| 4.6 Naturality and comparison | Weibel Theorem 5.2.12 is uncertified. Opened the pinned comparison and map declarations and checked the weaker top hypothesis by the stated finite-filtration argument. |
| 5.1 Classical filtered complex | `stacks-012K line 3038–3061`, Lemmas 24.3–24.4, pp.62–63. Lemma 24.3 as printed assumes countable direct sums; the roadmap's unrestricted first-differential assertion is independently supplied by Tau Ceti, which has no such assumption. No unsupported removal of that source hypothesis. |
| 5.4 Exhaustive bounded-below convergence | Weibel Theorem 5.5.1 is uncertified. `stacks-012K line 3202–3240`, Lemma 24.13, pp.66–67, is correctly labelled as the different cohomological-bounds variant. The independent route uses exact sequential colimits in the specified adjacent degrees. |
| 6.1 Spectral sequence of an exact couple | `stacks-012K line 2653–2686`, Definitions 21.1,21.3 and Lemma 21.2, pp.54–55. Morphisms, derived E=H(E,jk), and assembly of pages are present. Weibel 5.9.1–5.9.3 and Massey are uncertified. Ownership of the couple itself is left to StableHomotopyKTheory. |
| 6.2 Exact-couple towers | `stacks-012K line 2687–2703`, Lemma 21.4, p.55; `helle-rognes2024 line 136–144`, Definition 3.3, Lemma 3.4 and Remark 3.5, p.3. The r versus r−1 conventions agree after translating page r+1; the explicit ℤ/ℓ² control detects the possible slip. |
| 6.3 Couples of spectral objects/complexes | `stacks-012K line 2834–2905`, §23, pp.58–59, constructs the filtered differential-object sequence. The exact-couple identification also cites uncertified Weibel 5.9.4. Independently checked all three maps and their degrees against the spectral object's exact sequence. |
| 7.3 Double-tower sequence | `helle-rognes2024 line 225–229`, equation (3.1), p.4, contains exactly the displayed three-term extension. The source works with graded modules (lines 53–55); the roadmap separately supplies the product-double-complex route for CountableAB4Star. Boardman 3.4(b) itself is uncertified. |

Further source comparisons covered the convergence dictionary, 1.2–1.4, 3.1/3.4, 4.1/4.3–4.5, 5.2–5.3, 7.1/7.2/7.4, the Layer 3 geometric-circle-method example, and the Mittag–Leffler docstring. In particular, `browning-sawin2020 line 57–75` (Theorem 1.1) and lines 568–587 (Theorem 2.7) have the advertised finite filtration support, (r,1−r) differential, degree-range abutment and odd-page vanishing. `bhatt-scholze2015 line 701–702` and lines 755–770 support the replete-topos specialization; the roadmap does not claim their Proposition 3.1.10 states the converse for all abelian categories.

### Pinned library and duplication audit

The pins read from the content manifest were Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Searches used objects and hypotheses as well as names: spectral-sequence pages and homology, filtered objects, quotient presentations, image towers, difference maps, repleteness, exact products and Mittag–Leffler conditions. The following are the material native interfaces opened and compared; paths are relative to their library repositories.

| Pinned file and line | Declaration/interface and conclusion of comparison |
| --- | --- |
| `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean:36` | `SpectralSequence` has `page` and `iso`; line 48 gives its compatible `Hom`. It has no abutment or cycle/boundary towers. `pageFunctor`, `pageHomologyNatIso`, `pageXIsoOfEq` occur at 90,99,60. |
| `Mathlib/Algebra/Homology/ComplexShape.lean:163` | `up' a` has relation i+a=j, including a=0. The exact-couple assembly is not accidentally restricted to nonzero degree vectors. |
| `Mathlib/Algebra/Homology/SpectralSequence/ComplexShape.lean:36` | `spectralSequenceNat`; line 47, `spectralSequenceFin`. These are restricted shapes, not a license to discard nonzero off-carrier differentials. |
| `Mathlib/Algebra/Homology/SpectralObject/HasSpectralSequence.lean:67` | `SpectralSequenceDataCore`, the four recipes, `HasSpectralSequence` at 303, `IsFirstQuadrant` at 394 and `IsThirdQuadrant` at 437. The quadrant vanishing fields yield the bounds computed above. |
| `Mathlib/Algebra/Homology/SpectralObject/FirstPage.lean:47` | `HasFirstPageComputation`; the EInt recipes have the first-page instances. Registering the finite-recipe instance in 4.1 is an additional target. |
| `Mathlib/CategoryTheory/Filtration/Basic.lean:44` | Native `Filtration` consists of `toMonoOver : I ⥤ MonoOver X`; `FilteredObject` at 73 adds the underlying X. Neither includes exhaustion, separation or completeness. |
| `Mathlib/Algebra/Homology/SpectralObject/EpiMono.lean:84` | `isIso_map_fourδ₄Toδ₃` has a zero-map hypothesis. The primed vanishing criteria at 183 and 216 are sufficient special cases; they are not the new top-monomorphism criterion of 4.3. |
| `Mathlib/CategoryTheory/CofilteredSystem.lean:121` | The variable is `F : J ⥤ Type v`; `Functor.IsMittagLeffler` at 137 is a range condition on types. It does not duplicate the new image-subobject predicate for arbitrary abelian C. |
| `Mathlib/CategoryTheory/ObjectProperty/Kernels.lean:76` | `IsClosedUnderKernels` and `IsClosedUnderCokernels` at 123 use categorical kernels/cokernels. Together with `ContainsZero` and extensions they support the weak-Serre argument, including invariance under isomorphism. |
| `Mathlib/CategoryTheory/Functor/EpiMono.lean:158` | `reflectsMonomorphisms_of_faithful` is an instance with a generated dual. The README citation is valid despite the simple text-inventory parser not detecting the priority annotation. |
| `Mathlib/Algebra/Category/ModuleCat/EpiMono.lean:67` | `forget_preservesEpimorphisms` has the claimed module-carrier universe generality. |
| `TauCeti/Algebra/Homology/SpectralSequence/Comparison.lean:32` | `Hom.isIso_hom_f_of_le` propagates a page isomorphism to later pages; it does not supply convergence. |
| `TauCeti/Algebra/Homology/SpectralObject/Abutment.lean:44` | `abutment`, the image filtration, inclusion/map, `EInftyIsoCokernel` at 92, and endpoint vanishing criteria at 114 and 123 supply the stated adapter. |
| `TauCeti/Algebra/Homology/SpectralObject/Stabilization.lean:51` | `spectralSequencePageXIsoEInfty` assumes both endpoint vanishings. The package replaces the top vanishing with a weaker mono/isomorphism condition. |
| `TauCeti/Algebra/Homology/SpectralObject/Comparison.lean:121` | `isIso_hom_app_abutment_of_isIso_page` requires top vanishing in n−1,n. It is not the package's comparison with top isomorphism in n alone. The naturality statement is at line 78. |
| `TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:304` | `filtrationFunctor`; `spectralObject` at 147, `spectralObjectMap` at 191, `spectralObjectHIsoCokernel` at 224, `spectralSequence` at 409 and first-page cokernel comparison at 425. These are imported, not reconstructed. |
| `TauCeti/Algebra/Homology/SpectralSequence/Filtered/FirstPage.lean:89` | `spectralSequence_first_page_d_eq` supplies the first connecting differential without an additional sign or countable-sums hypothesis. |
| `TauCeti/Algebra/Homology/SpectralSequence/Filtered/Convergence.lean:118` | `filtrationSpectralSequencePageXIsoGradedOfFinite` has global filtration bounds; 5.3 permits bounds depending on the complex degree. |
| `TauCeti/Algebra/Homology/SpectralSequence/Filtered/Exhaustive.lean:200` | `isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive` is for modules and requires vanishing graded cohomology beyond an upper index. Neither restriction appears in the package's stated general-category comparison. |
| `TauCeti/CategoryTheory/Preadditive/TowerDifference.lean:77` | `towerDifference=1−s`; kernel-limit comparison at 122, naturality at 150, pro-zero invertibility at 165. The native results do not already state the new repleteness equivalence or general ML vanishing. |
| `TauCeti/CategoryTheory/Limits/Replete.lean:91` | `IsReplete` asks for epimorphic projections of existing limit cones, without asserting limit existence. `epi_π_app` at 107, descent at 118 and exact countable products at 357 agree with the contracts. |
| `TauCeti/Algebra/Category/ModuleCat/Tower/MittagLeffler.lean:70` | Module ML is the underlying-type predicate; `subsingleton_limOne_of_isMittagLeffler` at 191 is a module theorem. The package keeps it as a specialization Check. |
| `TauCeti/CategoryTheory/GrothendieckGroup/EulerCharacteristic.lean:165` | `sum_negOnePow_X_eq_sum_negOnePow_homology` is the bounded cochain telescoping engine. It does not identify a spectral-sequence page sum with a filtered abutment. |

The library near-match report was treated as leads. Its same-name Mittag–Leffler hit is a different carrier. Its unrelated order-theoretic boundedness, spectral-space and incidence-algebra results are not duplicates. No fully qualified declaration of this package was found in the other readable roadmap Lean files.

### Cross-roadmap ownership and supplier order

Read scopes and relevant targets on main, and the specified open heads through `roadmaps show`; ran `roadmaps grep` for the shared objects. Main examples used for house shape were DerivedModuleAlgebra, StableHomotopyKTheory and EnhancedDerivedSheaves.

| Roadmap/location resolved | Ownership conclusion |
| --- | --- |
| `TauCetiRoadmap/StableHomotopyKTheory/README.md`, §7.22, heading at line 2618 | Owns bigraded exact couples and derived couples in an abelian category. The package imports them, adds assembly/towers/comparisons, and declares the missing morphism contract. Sections 7.21,7.23–7.26 concern spectra; their Boardman specialization is not a competing general abelian-category construction. |
| `TauCetiRoadmap/DGFloer/README.md:621`, Layer 1 item 3 | Owns module-complex adapters and classical/complete convergence, including the exact native coordinates. Its cohomological coordinates agree with (2p+q+1,−p−1). The package's variant is for arbitrary abelian C with the stated exactness assumptions. Item 2 owns Serre spectral sequences. |
| `TauCetiRoadmap/DerivedModuleAlgebra/README.md:955`, §S.1 | Owns the double-complex specialization, iterated-cohomology page, edges and five terms. The generic consequences here do not rebuild the double-complex construction. Its compatibility table at line 65 explicitly maps `DoubleComplex.edgeBottom` and `DoubleComplex.edgeLeft` to §S.1. Both citation-tool warnings are therefore false leads. |
| `TauCetiRoadmap/AlgebraicTopology/README.md:2145`, §6.0 and supplier contracts | Module tower algebra is now imported from Tau Ceti; the remaining targets are specified-homotopy-square maps and topological tower adapters. The package also cites Tau Ceti's module algebra directly, and owns only the general abelian-category extension. Read the same scope at #1807 and #1808; neither owns that extension. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4977`, §2.17 | Owns replete-topos applications and derived limits of epimorphic sheaf towers. The native category-level `TauCeti.IsReplete` is explicitly imported there; the package adds the category-level lim¹ characterization, not a second topos predicate or derived limit. |
| `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1294`, E2:towers.1; 2035, E2.1; 2083, E2.2 | Coherent/derived towers, sheaf Milnor sequences and enhanced comparisons are separate from the package's ordinary image-tower algebra. Read main and scopes/relevant headings at #1330 and #1630; the cited ids remain present. |
| `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:43` at #858 | Owns compact-coefficient and arithmetic applications. Its tower input at lines 594ff is supplied module algebra, not an independently owned arbitrary-abelian convergence theory. |

The board's two listed packages under review are AnalyticNumberTheory and LawrenceVenkateshMethod; neither is a missing candidate owner for these foundational constructions. The nearest-results/headings list is empty. No prohibited roadmap is consumed. All substantive proof suppliers are pinned APIs, main roadmaps or the explicitly declared contract.

`gap:exact-couple-morphisms` is precise and minimal: fixed a,b,c; bigraded D/E maps commuting with i,j,k; identity, composition and functorial derivation. `packages/SpectralSequencesAndConvergence/design/plan.json` and README lines 339–345 use the same slug and supplier, StableHomotopyKTheory §7.22. That section does not already state this morphism API. Its present absence is an authorized supplier gap, not a finding.

Dependency-check output:

```text
depcheck: 240 roadmaps, 2170 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was emitted. In particular the mathematical layers progress from marked quotients to towers/limit pages, assignments, convergence, spectral-object adapters, filtered-complex adapters, exact-couple identifications and conditional convergence. Layer 7 uses 6.3; 6.3 uses 4.1 and 5.1; 5.3 uses 4.4; 4.4 uses 3.2/3.4 and 4.3; 3.2 uses 1.4/2.1/3.1. The order is forced by named inputs rather than a source's table of contents.

Overlap check: read AlgebraicTopology (#1807, #1808 and main), EnhancedDerivedSheaves (#1330, #1630 and main), ArithmeticGaloisDuality (#858), DerivedModuleAlgebra (main), StableHomotopyKTheory (main); shared module tower algebra is Tau Ceti's, topological tower adapters are AlgebraicTopology's, coherent/sheaf derived limits are EnhancedDerivedSheaves/SchemeAndStackFoundations's, double-complex specializations are DerivedModuleAlgebra's, exact couples are StableHomotopyKTheory §7.22's, and generic convergence/image-tower extensions are this roadmap's. No competing owner of those extensions was found.

### Headline coverage and Lean acceptance test

The headline list below follows the README Summary, lines 3–22, and the additional repleteness results expressly listed as headlines in the module docstring. The intermediate double-tower sequence in 7.3 is reviewed mathematically above; the summary's end theorem is its application to conditional convergence.

| Headline family | Status against the pins |
| --- | --- |
| Bounded stabilization and regularity | The two differential-vanishing signatures at Lean lines 96 and 108 state the native part. Tower/limit-page formulations require 1.2–1.4. |
| General comparison and convergence structures | Named at Lean lines 36–43 as unavailable because arbitrary spectral sequences lack constructed cycle/boundary towers and E∞. Native spectral-object and filtered-complex comparisons are stated at 169 and 218. |
| Vanishing, dimension, Euler, two-row/two-column, edges and five terms | General convergence consequences are named at lines 38–40 with the same missing carrier. The degreewise finite filtered-complex Euler headline is stated at 188. |
| Towers/limit page of spectral objects and convergence bounds | Tower identifications need 1.2–1.4. The canonical native map-isomorphism and vanishing statement is at 144, using the real predicate at 121, and comparison at 169. These mention the actual spectral object and its canonical maps. |
| First-/third-quadrant convergence | Named at lines 44–50 as missing convergence structures; the native page-object identifications are correctly attributed to existing recipes and isomorphisms rather than restated. |
| Finite/cohomologically bounded and exhaustive bounded-below filtered complexes | Finite/cohomological bounds are expressed by the native spectral-object headline and the filtered Euler theorem. General exhaustive convergence needs the nonstabilizing E∞ construction and is named at lines 51–55. Its comparison is stated at 218. |
| Exact-couple spectral sequences, towers and identifications | Named at lines 56–60 as lacking the bigraded exact-couple/derived-couple construction, supplied by StableHomotopyKTheory §7.22. No free Prop or placeholder sequence substitutes for it. |
| Boardman and complete convergence | Named at lines 51–60 as lacking the constructed arbitrary E∞, cycle-tower lim¹ and whole-plane obstruction of the exact couple. |
| Repleteness characterization and ML vanishing | Stated at lines 244 and 264, with a real image-subobject ML predicate at 255. These are stronger/general-category variants of the supplied specialization theorems. |

Ran `lake env lean` on the original `Suggested.lean` from the pinned content checkout. Exit status 0; the only diagnostics were eight “declaration uses sorry” warnings. All five individual Tau Ceti imports already had usable object files, so no build was needed. There is one `import Mathlib`, no other Mathlib submodule import, and every Tau Ceti import is used.

On a scratch copy, attempted `simp`, `rfl` and `infer_instance` as single-tactic proofs of **all eight** sorried theorems. None closed. The failure sites were the proof bodies corresponding to original lines 101,113,160,175,207,235,249,267. Compared the material exact-lemma candidates at the pins: page-isomorphism propagation, stronger endpoint-vanishing comparison, module-only exhaustive comparison, bounded-cochain Euler–Poincaré and module-only ML vanishing. None supplies an entire stated theorem in one application. No theorem is a boundary computation, a restated definition or a README Check.

Independently appended `#check @...` for all **11** declarations to a separate scratch copy and elaborated it successfully. The three definitions retain their category/abelian and indexing parameters; the eight theorems retain all their explicit bounds, page hypotheses, finiteness/Serre hypotheses, exact sequential colimits, countable products and repleteness assumptions. No binder repair is required. The supplied scanner's alleged twelfth declaration `that` comes from prose in the module docstring and is not a declaration or an error in the original file.

### Wording, arrangement and reuse

Compared 28 distinct package passages with four readable sources: the 26 numbered passages 1.1–1.4, 2.1–2.3, 3.1–3.2, 3.4, 4.1–4.5, 5.1–5.4, 6.1–6.3 and 7.1–7.4, plus the Layer 3 circle-method example and the ML docstring. Comparisons used the specific locators above and the additional locators read for the further-source pass. Mathematical formulae and standard names coincide where required; no copied prose, clause-by-clause disguised passage, table or figure was found. The whole-plane example is recast as an algebraic exact couple and independently computes the degree shift, cycle lifetime and obstruction; no source table or list of exercises was imported.

For source share, counted explicit source-key citation occurrences before References, including inline proof citations: Stacks 42, Helle–Rognes 21, Weibel 11, Boardman 5, Eilenberg–Moore 2, Bhatt–Scholze 2, McCleary 1, Massey 1 and Browning–Sawin 1, total 86. This counting unit does not count the reference-list entry again or split a citation with several theorem numbers into several occurrences.

Opened the largest source's contents at `stacks-012K line 7–35`: filtrations §19, sequences §20, couples §21, differential objects §22, filtered differential objects §23, filtered complexes §24, double complexes §25, with towers in §31. There is no one-to-one run matching the roadmap: its convergence layer separates generic filtered-abutment structures from filtered-complex construction; spectral objects form a separate adapter layer; exact couples follow those adapters to prove identification, rather than preceding filtered complexes as in Stacks. The concrete dependency lines cited above explain that order. Helle–Rognes's §2/§3/§4 order likewise does not determine these seven layers.

Source independence: 28 passages compared with 4 sources, no copied expression found; largest share stacks-012K, 42 of 86 source-key citation occurrences; contents compared with stacks-012K: independent. Wording against the six settled uncertified books/articles was not tested.

## Not verifiable

- `weibel1994`: settled uncertified; did not read Definitions 5.2.5/5.2.11, Theorem 5.2.12, the §5.2 exercises, Theorems 5.5.1/5.5.10, §§3.5/5.9. The mathematical statements were independently tested, but their exact book locators and wording are not certified here.
- `eilenberg-moore1962`: settled uncertified; §7 comparison and complete convergence source text was unavailable.
- `boardman1999`: settled uncertified; 3.4(b), Definition 5.10 and Theorems 7.1,8.2,8.10,8.13 were not read directly. Helle–Rognes's displayed sequence, theorem formulations and citations were read.
- `mccleary2001`: settled uncertified; chapters 2–3 and the particular edge/two-row/two-column source passages were not read.
- `massey1952`: settled uncertified; original exact-couple article not read. Stacks supplies a readable independent construction.
- `cartan-eilenberg1956`: settled uncertified; Chapter XV is reference/background only here and was not read.

All ten cited works have a manifest entry. No source request remains outstanding. The publisher retrieval for the existing Helle–Rognes key succeeded after classifying EMS as a legal open publisher. The original source manifest and all mathematical package inputs were preserved.

## Source issues

- **Misprint** in helle-rognes2024 at Lemma 2.2 proof, draft p.2 (line 69; publisher p.1856, line 87): the source says the outgoing differential's image is a subobject at its source; it should be the incoming differential's image, indexed s+r; affects the proof.
- **Misprint** in helle-rognes2024 at Proposition 4.9 proof, draft p.6 (line 332): the source says the boundary image uses differential index s−r; it should be s+r, as in the proposition's preceding formula; affects the proof.
- **Misprint** in stacks-012K at Lemma 24.13 proof, p.67 (lines 3225–3227): the source says a degree-n preimage is the sum of an image in degree n+1 and a degree-n kernel; it should be F^(p+r)K^n plus that kernel; affects the proof.
- **Error** in stacks-012K at Lemma 24.13 proof, p.67 (lines 3229–3232): the source says an isomorphism on H^(n−1) makes ambient boundaries in F^aK^n boundaries inside F^aK; it should use injectivity on H^n, with the degree-n bound; affects the proof.

For the last error, take K=(ℤ→id ℤ) in degrees n−1,n and the subcomplex L consisting only of its degree-n term. H^(n−1)(L)→H^(n−1)(K) is 0→0, an isomorphism; d(L^(n−1))=0 while im(d_K)∩L^n=ℤ. Injectivity of H^n(L)→H^n(K) fails, exactly as the corrected argument needs. The roadmap uses that corrected degree-n condition in 4.3–4.4 and does not inherit the error. For the preceding misprint, replacing the image term by F^(p+r)K^n restores the degree and the preimage identity before quotienting by F^(p+1).

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "fb054d92a4d27bbca95fa3d3da48223918fe572c", "job": "REV-PKG-SpectralSequencesAndConvergence", "model": "gpt-6-astra", "worker": "chris-8"} -->
