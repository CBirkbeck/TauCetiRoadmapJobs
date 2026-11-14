<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14997#issuecomment-6868924929 -->
Review (codex) of 45195a5

Verdict: needs_changes

1. **F01** (P3) The first comparison map's target is the page object

   **Location:** `packages/SpectralSequencesAndConvergence/Suggested.lean:140`: “the source of the first is the page object”.

   **Claim:** In the displayed span, the first canonical map has the page object as its source.

   **Witness:** `Mathlib/Algebra/Homology/SpectralObject/EpiMono.lean:140` gives its direction. For the stupid filtration of ℤ →(×2) ℤ, at n=0, q=−1, r=2, its source is 0; its target and page object are ℤ.

   **Exact repair:** Replace “the source of the first is the page object” by “the target of the first is the page object”. Keep both displayed arrows and the theorem signature unchanged. `packages/SpectralSequencesAndConvergence/README.md:1091` already correctly calls it the left object.

   **Repair tested:** The first map is `E⁰(⊥ ≤ −1 ≤ 0 ≤ 0) → E⁰(−1 ≤ −1 ≤ 0 ≤ 0)`. Its source is ker(×2:ℤ→ℤ)=0, and its target is ℤ, the native page-2 object at (1,−1). This distinguishes the endpoints before stabilization; it is not a counterexample to the theorem's bounds. At r=3, with a=−2 and b=0, the bounds hold and both objects are 0. The corrected label continues to identify the page at the target. The defect is documentation, not a false Lean theorem.

One finding: P1 = 0, P2 = 0, P3 = 1. The previous convergence-hypothesis finding is repaired. The mathematics and eight Lean theorem signatures survived the checks below; one docstring reverses an endpoint label. No input file was changed.

## Verified sound

### Previous findings and changed passages

The previous review had one package finding, F01 (P2), and no finding marked not actionable. It is **repaired**:

- `packages/SpectralSequencesAndConvergence/Suggested.lean:26`: “`H^n(⊥ ≤ j) ⟶ H^n(⊥ ≤ ⊤)` is an isomorphism, not merely a monomorphism, for every integer `j ≥ b`”. The summary also retains bottom vanishing in degrees n and n+1.
- The comparison bullet at line 29 now says “spectral objects that both have these convergence bounds”.
- The additional repair at lines 145–149 separates the monomorphism criterion for the second page comparison from the isomorphism needed for exhaustion: “neither the monomorphism nor that vanishing suffices for this”.
- `packages/SpectralSequencesAndConvergence/README.md:1116` adds “Here `H^{−1}(j ≤ ⊤) = H^{−1}(K / G_j) = 0` as well”.

Recomputed all four assertions. For K=ℤ[0] and every finite stage G_j=0, the top map is 0→ℤ (mono, not iso), all pages and filtration steps are 0, and their union is 0≠ℤ. Also H⁻¹(K/G_j)=0. The map from the zero filtered complex has page isomorphisms but abutment map 0→ℤ. Both corrected headlines exclude it. Conversely, K=ℤ in degree −1 with G_j=0 has top map 0→0 in degree 0, while H⁻¹(K/G_j)=ℤ. Thus top isomorphism and the single adjacent-degree vanishing are incomparable, while that vanishing implies the weaker mono criterion by the exact sequence. The repaired docstring says exactly this.

Checked the same pattern throughout the package: README:66, 260, 1023, 1060, 1085, 1112, 1173, 1185 and 1272, and all three relevant Lean declaration docstrings. No remaining mono-for-exhaustion substitution was found. R01 is a different endpoint-label error in the same theorem's docstring.

### Coverage and principles

Read all four package inputs, all 31 numbered targets, 31 Checks blocks containing 114 bullets, every Needs clause, and all 11 actual Lean declarations. The supplied scanner's extra “that” declaration is prose, not a declaration. For unchanged nonsampled material, the previous review's computed rows cover all 31 targets; I used those numerical/subobject witnesses, not its unsupported summaries. The seeded targets, headlines and changed passages were checked afresh. Additional controls and the retained prior evidence are recorded below.

The plan develops arbitrary-abelian-category theory. Module, sheaf, finite and quadrant cases are distinguished from it. Countable products/coproducts, exact products, exact sequential colimits, repleteness and module-universe conditions occur where used. No route-specific restriction, prime exclusion, computational algorithm, sorry-defined data, option override, second roadmap copy, upward supply or cycle was found. The two-term computations are mathematical Checks.

The README has the prescribed summary, ownership, conventions, contracts, build explanation, seven layers with examples/dependencies, consumers and references. Definitions have APIs and at least three Checks. The three definitions retained in Lean have real bodies on native carriers. All 11 package declaration names occur in the README. No process residue, pull-request number, local machine path, HTML anchor or forbidden import was found in the package inputs. Aside from R01, the README and Lean statements agree.

### Computed adversarial evidence

Here ℓ is 2 or 3, ℤ^(ℕ) is a direct sum, and comparisons are the indicated canonical maps. The table covers every seeded target, each headline family, all changed assertions and R01. Rows on unchanged nonsampled targets also record the previous round's still-applicable computed controls. No repair is needed in a row unless stated.

| Statement | Instances and computed values on the two sides | Result / change |
| --- | --- | --- |
| 1.1 subquotient presentations | B=4ℤ, Z=ℤ: preimages of 0, 2ℤ/4ℤ, ℤ/4ℤ are 4ℤ, 2ℤ, ℤ. For B=Z both quotient and interval have one subobject. The coordinate-swap marking sends the first axis of ℤ² to the second; the canonical marking fixes it. | The marking is substantive; no change. |
| 1.2 cycle/boundary recursion and vanishing iff | For d₂=×2:ℤ→ℤ, source (Z₃,B₃)=(0,0), target (Z₃,B₃)=(ℤ,2ℤ); quotients are 0 and ℤ/2. For d=0 the pairs are (A,0) at every page. | Incoming/outgoing directions and zero-page criterion agree. |
| 1.3 stabilization | In that example d₂≠0, all dᵣ for r≥3 are 0; both pairs stabilize at 3. At the source, the boundary pair already stabilizes at 2. | Regular and coregular are correctly distinguished. |
| 1.4 limit page | For the filtered identity complex of README:516, Zᵣ=ℓ^(r−1)ℤ and Bᵣ=0. Thus each finite quotient is abstractly ℤ, but ∩Zᵣ=0 and E∞=0. For the ×2 target E∞=ℤ/2; for the zero sequence E∞=0. | An eventual abstract isomorphism type is not the limit construction. |
| 2.1 assignments | Native d₂ takes (1,−1) to (3,−2): total degree 0→1, native filtration 1→3, classical filtration 0→1. Homological (2,1)→(0,2) changes (fil,deg) from (−2,−3) to (0,−2). Taking fil=q would require e=3 at r=2 and e=5 at r=3. | Offsets 0 and 1 and the homological signs agree. |
| 2.2 outgoing bound; Lean:99 | At first-quadrant (1,0), β(2)=3, fil=1, e=0 give r≥2; the r=2 target is (3,−1), a zero object, and dFrom is ℤ→0=0. With e=1 the threshold rises by 1. | Quantifiers and inequality correct. |
| 2.2 incoming bound; Lean:111 | At (1,0), α(0)=−1 gives r≥2; the r=2 source is (−1,1)=0. The identity-complex control has just one nonzero degree-0 position but Zᵣ=ℓ^(r−1)ℤ never stabilizes; adjacent degree 1 has infinite support. | Adjacent-degree support, not support in n alone, controls stabilization. |
| 2.3 page Euler identity | A surjection ℤ/4→ℤ/2 in degrees 1→2 has lengths (2,1), homology lengths (1,0): −2+1=−1=−1+0. Rational ×2 gives −1+1=0 on both pages. | Additivity and signs agree. |
| 3.1 filtration predicates | On ℤ, ℓ-adic steps have union ℤ and intersection 0, but quotient limit ℤℓ≠ℤ. On ℤℓ the quotient limit is ℤℓ. Constant steps X≠0 have union=intersection=X; zero steps have both 0. | Exhaustiveness, separation and completeness differ. |
| 3.2 convergence | Stupid ×2 gives classical E∞ values 0 and ℤ/2, equal to gr H⁰ and gr¹H¹. Zero pages with constant-filtered H⁰=ℤ have gr=0 but intersection ℤ. I=∅ imposes no comparisons. | Weak convergence does not determine or separate H. |
| 3.3 compatibility | One-step ℤ with β=1: page map −1 and abutment map 1 give square composites −1 and 1. Identity gives 1=1, the zero maps 0=0. | The compatibility square excludes unrelated abutment maps. |
| 3.4 finite convergence/Euler | ℤ/4 and (ℤ/2)² both have graded lengths (1,1) and total length 2, but exponents 4 and 2. Zero pages with convergence only in degree 0 and H¹=ℚ give sums 0 and −1. Constant-filtered H⁰=ℚ gives page sum 0 and abutment sum 1. | No splitting claimed; all-degree convergence and finite filtrations matter. |
| 3.5 comparison | ℤ→ℤℓ has identity maps on grᵖ=ℤ/ℓ, but cokernel ℤℓ/ℤ≠0. Constant-filtered ℤ→0 has graded isomorphisms 0→0 but kernel ℤ. A finite filtered identity gives identities on both sides. | Completeness and separation reject both false generalizations. |
| 3.6 dimension and vanishing | Rational ×2 has degree-1 page dimension 1, limit dimension 0 and H¹ dimension 0. Zero differential gives 1=1=1. If all graded pieces vanish, exhaustion and separation make their common filtration step both H and 0. | Inequality, equality criterion and vanishing agree. |
| 3.6 columns, rows, edges and five terms | Graded ℤ/2,ℤ/2 allow nonsplit H=ℤ/4. In the two-row Hopf example d₂:ℤ→ℤ is 1, so kernel=cokernel=0 and (H⁰,H¹,H²,H³)=(ℤ,0,0,ℤ). The five terms give 0→0→0→ℤ→ℤ→0. At m=0 the one-position ℤ example would have consecutive identity maps, composite 1≠0. | Extension ambiguity and m≥1 are necessary and correctly stated. |
| 4.1 spectral-object towers | For ×2 at native (1,−1), Z₃=ker(2)=0. At r=2 repeated outer endpoints give Z₂=ℤ, B₂=0. Finite recipe l=2,r=3 gives (0,0,1,2) and (0,1,2,2); at l=0 there are no positions. | Native offsets and clamping agree with the pin. |
| 4.1 restricted-carrier control | The filtered identity example at README:975 has integer E₂ at (−1,1) and (1,0) both ℤ, with differential an isomorphism. Deleting the negative position would give homology ℤ at (1,0), whereas the recipe's E₃ there is 0. | HasSpectralSequence is indispensable for restriction to ℕ². |
| 4.2 decreasing abutment | n=1 and q=n−p+1 send p=3,4 to q=−1,−2. Images in H¹=ℤ/2 are ℤ/2 and 0. Thus gr³H¹=ℤ/2 occurs at native (3,−2). | Correct decreasing direction and n+1 shift. |
| 4.3 canonical limit comparison | Nonexhaustive K⁻¹→K⁰=id has B∞=0, Bᵗ=ℤ: E∞=ℤ but EInfty=0. The infinite-cycle example has Z∞=Zᵗ=0 although no finite Zᵣ is 0. | Canonical equality conditions are stronger than abstract isomorphism; stabilization is sufficient, not necessary. |
| 4.3 boundary mono and repaired Lean:145 | Vanishing Hⁿ⁻¹(j≤⊤) gives mono by exactness. K=ℤ in degree −1 with all G_j=0 has, at n=0, top 0→0 mono while H⁻¹(j≤⊤)=ℤ. For K=ℤ[0], top 0→ℤ is mono and H⁻¹(j≤⊤)=0, but union F=0≠ℤ. | Mono suffices for the boundary comparison, not exhaustion; repair correct. |
| 4.4 bounds; Lean:150; repaired summary | For stupid ×2 at n=1, a=−2,b=0,q=−2, thresholds are r≥2 and r≥3. Page 2 is ℤ, page 3 is ℤ/2; F³=ℤ/2, F⁴=0. Zero finite stages of ℤ[0] give page=0, top 0→ℤ noniso and nonexhaustion. | Correct theorem excludes the repaired counterexample. |
| R01 endpoint label | For ×2 at n=0,q=−1,r=2: first-map source=ker(2)=0, target=ℤ=page₂. At r=3 with a=−2,b=0: source=target=page₃=0. | Change only “source” to “target”. |
| 4.5 quadrants | First quadrant n=0: a=0,b=1, only position (0,0), E₂=H⁰. At n=−1, a=b=0 forces H⁻¹=0. Third quadrant m=−2: a=−2,b=1, positions (0,2),(1,1),(2,0), each total cohomological degree −2. | Bounds and degree reversal agree. |
| 4.6 comparison; Lean:175 | Identity of stupid ×2 acts as identity on page ℤ and H¹=ℤ/2. Inclusion ℤ[0]→(ℤ→id ℤ) with the nonexhaustive source-degree filtration is pagewise identity but H⁰ map ℤ→0. Its top map ℤ→0 is not iso. | HasConvergenceBounds excludes it; corrected comparison summary agrees. |
| 5.1 classical adapter | Classical E₁ positions (0,0),(1,0) become native page 2 positions (1,−1),(3,−2); d=+2. Classical E₂ values are 0,ℤ/2. One-step filtration gives E₁^(0,q)=H^q(K), other columns 0. | First differential, indexing and functorial adapter agree. |
| 5.2 induced comparison | K⁻¹=ℤ, K⁰=ℤ^(ℕ)⊕ℤ, d(x)=(0,x), source filtration zero: E∞=ℤ^(ℕ)⊕ℤ, gr⁰H⁰=ℤ^(ℕ). Canonical projection has kernel 0⊕ℤ although source and target are abstractly isomorphic. | The canonical-comparison criterion is correctly qualified. |
| 5.3 cohomological bounds/Euler; Lean:194 | Stupid K^m=ℤ for m≥0 has gr^mH^m=ℤ but no uniform filtration-zero stage. For ℚ→2ℚ, page and cohomology sums are 1−1=0 and 0. Over 𝔽₂ both cohomology dimensions are 1 and both sums 0. Native p-only signs would give −2. | Degree-dependent bounds and total-degree signs are correct. |
| 5.4 exhaustive comparison; Lean:224 | Nonexhaustive identity complex is exhaustive in degree 0 only: E∞=ℤ, H⁰=0. ℓ-adic ℤ→ℤℓ has graded identity but cokernel ℤℓ/ℤ, and no zero filtration stage. Stupid ×2 identity satisfies bounds and induces identity on ℤ/2. | The two adjacent-degree requirements exclude the controls. |
| 6.1 exact couple and shift | On ℤ²: i(x,y)=(x,0), j(x,y)=(y,0), k(x,y)=(0,y). Images equal successive kernels; jk(x,y)=(y,0), (jk)²=0, H(E)=0, while i²=i≠0. Shifting native pages by 1 changes e=1 to e=0. | Exactness does not impose i²=0; offset is e−k. |
| 6.2 couple towers | D=ℤ/ℓ², i=ℓ, E=(ℤ/ℓ)², j(x)=(x mod ℓ,0), k(a,b)=ℓb: Z₁=Z₂=E, B₁=B₂=0, d₁=0; Z₃=B₃=first factor and E₃=0. This holds for ℓ=2 and 3. For D=ℤ,i=ℓ,k=0, Zᵣ=ℤ/ℓ and Bᵣ=0. | Exponent r corresponds to page r+1, not r+2. |
| 6.3 adapters | a=(−1,1), b=0,c=(2,−1) give dᵣ degree (r+1,−r), native page r+1. For ×2, degree-1 tower D is 0 for p≥4, ℤ at 3 and ℤ/2 for p≤2; limit 0, colimit ℤ/2. Replacing k by 0 at (1,−1) gives ker k=ℤ but im j=0. | Signs, page shift, abutment and exactness agree. |
| 7.1 lim/lim¹ and completeness | Identity transitions: ker(1−s)=A, coker=0. Zero transitions: 1−s=1, both 0. ×ℓ on ℤ: lim=0, lim¹=ℤℓ/ℤ. Applying the six-term sequence to 0→ℓⁿℤ→ℤ→ℤ/ℓⁿ→0 gives 0→0→ℤ→ℤℓ→ℤℓ/ℤ→0→0. Constant nonzero filtration has lim¹=0 but quotient limit 0. | Difference sign, connecting direction and separation requirement agree. |
| 7.2 repleteness; Lean:250 | Shear compatibility is xₙ−fₙxₙ₊₁=tₙ, exactly (1−s)x=t. Tower ℤ/ℓⁿ has limit ℤℓ with onto projections. The cyclotomic tower in discrete Galois modules has smooth limit 0 and nonzero μℓⁿ, hence projections are not epi. | Categorical repleteness excludes the nonreplete control. |
| 7.2 ML; Lean:261,270 | Identity images stabilize at m=n; zero-transition ℤ/ℓ images stabilize at 0 for m=n+1, giving lim¹=0. ×ℓ on ℤ has images ℓ^(k−n)ℤ strictly decreasing and lim¹=ℤℓ/ℤ≠0. | The predicate is neither vacuous nor eventual epimorphy. |
| 7.3 double tower | For constant ℤ, Q=ℤ, RQ=0 and all three sequence terms are 0. For ×ℓ, Q=0, RQ=ℤℓ/ℤ; ×ℓ on RQ is bijective, so the sequence is 0→0→ℤℓ/ℤ→ℤℓ/ℤ→0. Eventually-zero towers give all terms 0. | Both limit directions and the extension terms agree. |
| 7.4 conditional convergence | Limit step couple: E∞^(0,0)=ℤ, A₀^(+∞)=0, A₁^(+∞)=ℤ, and gr⁰A₁^(+∞)=ℤ. Colimit step couple: E∞^(0,0)=A₀^(−∞)=ℤ. Constant i=1,E=0: E∞=0 but both end objects ℤ. | Limit abutment needs degree n+1; conditional hypotheses exclude the constant couple. |
| 7.4 whole-plane obstruction | For A₀ˢ=∏_(i≥abs(s))k, E∞=RE∞=0, colimit=∏k/⊕k, and all filtration steps equal that nonzero object. Their intersection and W⁰ are ∏k/⊕k, although each graded piece and lim¹ of the constant filtration are 0. | Regularity does not replace W=0. |
| 7.5 complete convergence | ℓ-adic ℤℓ[0] has grᵖH⁰=E∞^(p,−p)=𝔽ℓ for p≥0, intersection 0 and W⁰=0. ℓ-adic ℤ[0] has the same graded pieces but completion ℤℓ≠ℤ. Finite ×2 has H¹=ℤ/2 and W=0. | Completeness and separation are not silently conflated. |

For the categorical extensions I also checked the routes: countable meets use kernels into products, joins use images from coproducts; exact sequential colimits justify the exhaustive comparison; the repleteness shear produces an epimorphic product-difference map; ML reduces to epimorphic stable images and a pro-zero quotient. The two-direction product complex in 7.3 uses exact countable products. In 7.5, exact products commute with cohomology, so invertibility of the complex-level difference induces both required tower vanishings. None assumes the conclusion or imports a later result to prove itself.

### Source sample and exact locators

All 15 seeded targets were inspected. Thirteen have readable supporting material; 3.6 and 4.6 cite only settled uncertified books. A supporting special case is distinguished below from the package's generalization; the independent computations and routes above check the latter.

| Seeded target | Locator read, printed page, and scope check |
| --- | --- |
| 1.2 | stacks-012K line 2612–2624, p.53, construction after Definition 20.1; helle-rognes2024 line 65–70, Lemma 2.2, p.2. Recursive preimages and incoming boundaries agree. The Helle–Rognes differential-index misprint is not inherited. |
| 1.4 | stacks-012K line 2625–2631, Definition 20.2, p.53; helle-rognes2024 line 71–80, Definition 2.3/Remark 2.4, p.2. Stacks explicitly conditions the quotient on existence of meet/join; package separately supplies countable existence and stabilized existence. |
| 2.2 | stacks-012K line 3107–3130, Definition 24.7 and Lemma 24.8, p.64. Regular/coregular directions, boundedness and propagation of zero are correct. The package derives the explicit offset-dependent inequalities. |
| 3.6 | weibel1994 §5.2 and mccleary2001 Ch.2 remain uncertified. Both dimension directions, two-row/column extensions, edge directions and the five-term bound were checked mathematically above. No claim to having read these books. |
| 4.1 | helle-rognes2024 line 291–303 and 334–335, Definition 4.5, Remarks 4.6/4.10, p.6. Kernel/image formulas agree after the page/index dictionary. Finite/natural carriers checked against the pinned recipe and its classes. |
| 4.2 | helle-rognes2024 line 145–152, Definition 3.6, p.3 gives image filtration in exact-couple form. Native abutment and cokernel declarations give the n−p+1 conversion. |
| 4.3 | stacks-012K line 3072–3106, Lemma 24.6, pp.63–64, and line 3144–3151, Lemma 24.10, p.65. Source concerns the canonical filtered-complex subquotient. Package states the spectral-object extension and distinguishes it from arbitrary isomorphisms. |
| 4.6 | weibel1994 Theorem 5.2.12 remains uncertified. Checked the alternative finite-filtration proof route against native page-map propagation, canonical naturality and the cokernel comparison. |
| 5.1 | stacks-012K line 3038–3061, Lemmas 24.3–24.4, pp.62–63. The source's 24.3 assumes countable sums; the package's cited native FirstPage theorem proves the connecting-map statement for arbitrary abelian C, so that assumption is not silently transferred or needed. |
| 5.3 | stacks-012K line 3152–3197, Lemmas 24.11–24.12, pp.65–66; line 3202–3240, Lemma 24.13, pp.66–67. Degreewise finite filtration, finite page support and top cohomology isomorphism agree. Read the proof as well as the statement; package avoids its erroneous boundary-degree step. |
| 6.1 | stacks-012K line 2653–2686, Definition 21.1, Lemma 21.2, Definition 21.3, pp.54–55. Exact couple, derived couple, first-page origin and morphism commutation agree; bigraded carrier belongs to the named supplier. Other cited texts remain uncertified. |
| 6.2 | stacks-012K line 2687–2703, Lemma 21.4 and following remark, p.55; helle-rognes2024 line 136–144, Definition 3.3, Lemma 3.4, Remark 3.5, p.3. Powers, preimage/image directions and differential representative agree. |
| 6.3 | stacks-012K line 2834–2905, §23, pp.58–59. Read the general graded-object construction in Lemma 23.2, which removes the preliminary exact-countable-sum assumption. Spectral-object adapter checked directly at the pin; Weibel 5.9.4 remains uncertified. |
| 7.1 | helle-rognes2024 line 71–93, Definitions 2.3/2.5 and Lemma 2.6, p.2 supports the limit/completeness vocabulary for graded modules. The product-difference carrier is native. The six-term categorical extension is checked by the exact-products kernel/cokernel route; Weibel §3.5 remains uncertified. |
| 7.3 | helle-rognes2024 line 225–229, equation (3.1), p.4, and line 213–214, Lemma 3.15(c). Sequence and direction agree; source is graded modules. General exact-products construction and the added repleteness hypothesis on the projection bullet were checked separately. Boardman 3.4(b) remains uncertified. |

Every cited work has one entry in `sources.toml`; there are ten works, four readable and six settled uncertified. The Helle–Rognes entry retains year 2019, identifies the February 2018 author draft used for line locators and records the previously checked numbering comparison. Bhatt–Scholze and Browning–Sawin explicitly identify their read arXiv versions rather than asserting a journal-numbering comparison. No new source was needed or fetched, and no settled access request was reopened.

### Pinned-library audit and acceptance signatures

Inspected the declarations at the supplied pins, including the entire supplier-name lookup ledger and the contextual definitions/signatures for the potentially overlapping objects. Important witnesses follow; paths name the library repositories, not machine locations.

| Pinned file and line | What it supplies, and what it does not supply |
| --- | --- |
| `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean:36` | Fields `page` and `iso`; morphisms at 51, page functor at 90, homology natural isomorphism at 99. No limit page, cycle/boundary towers or convergent abutment. |
| `Mathlib/Algebra/Homology/SpectralObject/Basic.lean:41`; `Cycles.lean:63`; `Page.lean:65` | Spectral-object cohomology/connecting data, opcycles and four-index E. These are consumed. |
| `Mathlib/Algebra/Homology/SpectralObject/HasSpectralSequence.lean:143,176,214,260,303,394,437` | EInt/natural/finite/homological recipes and genuine existence/quadrant conditions. Finite indices use truncation/clamping. `FirstPage.lean:47` has the first-page property; its instances at 54,59,64 cover the three EInt recipes, not the finite one. |
| `Mathlib/Algebra/Homology/SpectralObject/EpiMono.lean:84,142,148,183,216` | Canonical map directions and endpoint-vanishing criteria. The new boundary-monomorphism criterion is not an existing declaration. This also witnesses R01. |
| `Mathlib/CategoryTheory/Filtration/Basic.lean:44,73,90,145` | Filtration stores a functor into MonoOver; filtered objects/morphisms and strictness. Exhaustion, separation and completeness are not fields. |
| `Mathlib/CategoryTheory/Subobject/Basic.lean:102,292,572`; `Limits.lean:120,314` | Subobjects, inclusion, pullback, kernel and image subobjects. The roadmap uses these carriers, not replacements. |
| `Mathlib/CategoryTheory/ObjectProperty/Kernels.lean:76,123`; `ContainsZero.lean:38`; `Extensions.lean:42` | Closure under arbitrary kernel/cokernel cones, zero and extensions. These support the weak Serre property and its invariance under isomorphism. |
| `Mathlib/CategoryTheory/CofilteredSystem.lean:121,137` | ML is for F:J⥤Type. It is not the arbitrary-abelian image-subobject condition of this package. |
| `Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Basic.lean:126,166`; `Limits/HasExactLimitsOfShape.lean:47` | Exact countable products, AB5 size reduction and exact colimits. `ModuleCat/AB.lean:30,38` has same-universe AB5/AB4Star; `ModuleCat/Projective.lean:60` needs Small R. |
| `Mathlib/Algebra/Category/ModuleCat/EpiMono.lean:67`; `CategoryTheory/Functor/EpiMono.lean:158` | Module forgetful functor preserves epis; faithfulness reflects them via the generated dual instance. The broader-universe repleteness argument respects this distinction. |
| `TauCeti/Algebra/Homology/SpectralSequence/Comparison.lean:32` | Propagates page isomorphisms forward. This is imported, not restated. |
| `TauCeti/Algebra/Homology/SpectralObject/Abutment.lean:44,50,54,76,92,114,123` | Abutment, image filtration, inclusions/transitions, graded cokernel and endpoint criteria. At 71 the inclusion is always mono; its being mono cannot express exhaustion. |
| `TauCeti/Algebra/Homology/SpectralObject/Stabilization.lean:51`; `Comparison.lean:121` | Native page comparison requires endpoint vanishing; abutment comparison requires top vanishing in n−1 and n. New bounds ask for a top isomorphism in n, a genuinely different weaker condition than that pair. |
| `TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:147,191,224,304,409,425`; `FirstPage.lean:89` | Spectral object/map, quotient-cohomology comparison, filtration functor and page/first differential. The latter has no extra sign or countable-sums assumption. |
| `TauCeti/Algebra/Homology/SpectralSequence/Filtered/Convergence.lean:118`; `Exhaustive.lean:200` | Global finite bounds, versus the package's degreewise bounds; module-only exhaustive comparison with upper graded-cohomology vanishing, versus arbitrary abelian C and no such upper bound. |
| `TauCeti/CategoryTheory/Preadditive/TowerDifference.lean:77,122,150,165` | Difference is πₙ−πₙ₊₁fₙ; kernel-limit, naturality and pro-zero invertibility. No generic ML vanishing theorem here. |
| `TauCeti/CategoryTheory/Limits/Replete.lean:91,107,118,357` | Repleteness quantifies over existing limit cones, projection theorem, descent and exact countable products. It does not assert existence or the proposed lim¹ equivalence. |
| `TauCeti/CategoryTheory/Sites/Replete.lean:48`; `TauCeti/Condensed/Light/Replete.lean:45` | Sheaf repleteness has the concrete-category/sheafification/exactness hypotheses stated by its signature; light condensed modules have their native instance. The package explicitly imports these with their hypotheses. |
| `TauCeti/Algebra/Category/ModuleCat/Tower/MittagLeffler.lean:70,83,191` | Underlying-type ML, range formulation and module lim¹ vanishing. Same-name search hit does not duplicate the arbitrary-abelian theorem. |
| `TauCeti/CategoryTheory/GrothendieckGroup/EulerCharacteristic.lean:165`; `Abelian.lean:216` | Bounded cochain Euler engine and additive invariants. Not a spectral-page-to-filtered-homology identity. |

Other supplier identifiers were located in their cited files, including the spectral-object map/naturality APIs, bicomplex sequence, shapes, Artinian chain condition, dFrom/dTo and negOnePow. Object searches found no competing generic cycle/boundary carrier, convergence structure or generic image-tower ML theorem at the pins. Unrelated near-matches about order bounds, spectral spaces and incidence algebras do not state these results.

Ran the required `lake env lean` command on the original package file from the pinned content checkout: **exit 0, eight “declaration uses sorry” warnings, no other diagnostics**. The five imported Tau Ceti modules already had object files; no build was necessary. Appended `#check @name` for every one of the 11 declarations in a scratch copy and elaborated it once: exit 0. Compared every type with the README, including all category, exactness, smallness, page, support and filtration hypotheses; no binder was lost. No package signature changed.

Ran a scratch probe on **all eight** sorried theorems. Each proof tried `simp`, `rfl` and `infer_instance` separately, requiring that the chosen tactic close all goals. All eight failed. The pinned exact-lemma candidates above also do not prove any entire target in one application.

| Theorem at `packages/SpectralSequencesAndConvergence/Suggested.lean` | Probe outcome / substantive work remaining |
| --- | --- |
| line 99, dFrom_eq_zero_of_boundedBelow | No tactic closes; transport support to the outgoing position and propagate vanishing. |
| line 111, dTo_eq_zero_of_boundedAbove | No tactic closes; incoming transport and propagation. |
| line 150, convergence_of_hasConvergenceBounds | No tactic closes; the new boundary criterion and finite abutment filtration are required. |
| line 175, isIso_hom_app_abutment_of_hasConvergenceBounds | No tactic closes; native comparison has stronger top hypotheses. |
| line 194, sum_negOnePow_homology_eq_sum_negOnePow_page | No tactic closes; page evolution and filtered convergence are not the bounded-cochain engine. |
| line 224, isIso_homologyMap_of_isIso_page_of_exhaustive_of_boundedBelow | No tactic closes; arbitrary-abelian exhaustive convergence is needed. |
| line 250, isReplete_iff_countableAB4Star_and_epi_towerDifference | No tactic closes; the shear and kernel-tower arguments are needed. |
| line 270, epi_towerDifference_of_isMittagLeffler | No tactic closes; stable-image reduction in arbitrary abelian C is needed. |

No padding declaration was found. R01 changes none of these outcomes.

### Headline coverage

| README headline family (summary at lines 3–22) | Lean coverage or explicit unavailable carrier |
| --- | --- |
| Bounded stabilization/regularity | Theorems at 99 and 111 give both native differential statements; the recursive tower forms require 1.2. |
| Generic convergence/comparison | Module docstring:38–46 names the missing arbitrary-sequence E∞ and recursive towers. Native comparison instances are at 175 and 224. |
| Vanishing, dimension, Euler, rows/columns, edges, five terms | Docstring:39–46 identifies the missing convergence carrier; the statable filtered-complex Euler headline is at 194. |
| Spectral-object limit and bounded convergence | Predicate at 124 and theorem at 150 give the native statement. General towers require the missing recursive construction. |
| First-/third-quadrant convergence | Docstring:47–52 identifies the missing convergence structure and distinguishes existing native page identifications from it. |
| Finite/cohomologically bounded/exhaustive bounded-below filtered complexes | Native bounds and Euler statements cover the statable forms; docstring:53–57 names the missing nonstabilizing E∞, with the comparison at 224. |
| Exact-couple spectral sequence, towers and identification | Docstring:58–62 identifies missing bigraded/derived couples, owned by StableHomotopyKTheory §7.22. |
| Boardman conditional/complete convergence | Docstring:53–62 names the missing E∞, cycle-tower lim¹ and whole-plane obstruction. |
| Repleteness and ML vanishing | Explicit additional headline bullets at 33–35; theorems at 250 and 270, concrete ML predicate at 261. |

No statable headline was found omitted or replaced by a weakened stand-in. All eight signatures concern the actual roadmap objects.

### Ownership, current citations and dependency order

Read the board package index before making absence claims. The supplied main checkout has no `SpectralSequencesAndConvergence` folder. The overlap record has no second copy, competing head changing this roadmap, dropped cited id or revision-only citation. Used the roadmap service to search main/open work by objects and to read the five closest open heads; read three main roadmap shapes (DerivedModuleAlgebra, StableHomotopyKTheory, EnhancedDerivedSheaves). Re-resolved the cross-roadmap citations against main or the supplied heads, not memory.

| Current roadmap file/locator | Scope and resolution |
| --- | --- |
| `TauCetiRoadmap/StableHomotopyKTheory/README.md:2618`, §7.22 | Owns arbitrary-abelian bigraded exact couples and derived couples. Assembly into Mathlib's spectral-sequence carrier and generic tower comparisons remain here. §§7.21,7.23–7.26 treat spectra and abelian-group homotopy applications; §7.26 begins at 2683. |
| `TauCetiRoadmap/DGFloer/README.md:621`, Layer 1 item 3 | Module filtered-complex adapters and classical/complete convergence, including the native dictionary at 645. This package explicitly owns the arbitrary-abelian extension. Item 2 owns Serre sequences. |
| `TauCetiRoadmap/DerivedModuleAlgebra/README.md:955`, §S.1 | First-quadrant double complexes, their column filtration, edges and five terms. The compatibility table at line 65 maps DoubleComplex.edgeBottom/edgeLeft to §S.1; those supplied scanner warnings are not missing package declarations. |
| `TauCetiRoadmap/AlgebraicTopology/README.md:2145` on main; #1807 §5.0/§6.0; #1808 Stage 5 item 0/Stage 6 item 0 | Main uses native module tower algebra and owns topological/homotopy-square adapters. Both open heads retain module filtered-complex and tower scope; #1808 explicitly uses ℕᵒᵖ⥤ModuleCat R. No competing arbitrary-abelian convergence ownership. |
| `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1294,2035,2083` on main; #1330 and #1630, E2:towers.1/E2.1/E2.2 | Coherent stable towers and derived sheaf limits. Both heads retain those ids and distinguish the sheaf theorem supplied by SchemeAndStackFoundations. The package states no derived sheaf-limit construction. |
| `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:43,593` at #858 | Arithmetic compact-coefficient applications; module tower algebra is imported from DerivedModuleAlgebra. No second generic owner. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4184,4977` | §2.2 is Leray/Čech; §2.17 imports native repleteness and owns the derived-limit theorem for epimorphic abelian-sheaf towers, stated at 4993. |
| `TauCetiRoadmap/ComplexKahlerGeometry/README.md:363,3317` | K8 maps to Layer 8 and owns the Frölicher/geometric adapter, consuming the native filtered-complex construction. |
| `TauCetiRoadmap/MorseTheory/README.md:1419`; `TauCetiRoadmap/HeegaardFloer/README.md:1024` | Morse consumes DGFloer's generic algebra for the critical-band filtration; HeegaardFloer uses filtered module-chain algebra. They are applications, not suppliers of the arbitrary-abelian extension. |

The service's fresh citation run reported no missing cross-roadmap citations. It reported that it did not check library names on its host; I did the pinned local-library audit separately above. No fully qualified name collision with this package's namespace was found.

The declared contract `gap:exact-couple-morphisms` matches in `packages/SpectralSequencesAndConvergence/design/plan.json:1881` and README:340. Its named supplier is StableHomotopyKTheory §7.22. It precisely asks for bigraded D/E maps commuting with i,j,k and their functorial derived-couple maps. The present supplier has the carrier and derived objects but not that morphism API. This is a minimal declared contract, not an unowned prerequisite. After R01 is fixed, acceptance can remain conditional on `exact-couple-morphisms`.

The required dependency command returned:

    depcheck: 240 roadmaps, 2170 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. Read every Needs clause and supplier citation, including the proof-route inputs. The internal direction includes 3.2→1.4/2.1/3.1, 4.4→3.2/3.4/4.3, 5.3→4.4, 6.3→4.1/5.1 and 7.4→6.2/7.1–7.3. No prohibited supplier or circular proof route was found.

Overlap check: read AlgebraicTopology (main, #1807, #1808), EnhancedDerivedSheaves (main, #1330, #1630), ArithmeticGaloisDuality (#858), DerivedModuleAlgebra (main), StableHomotopyKTheory (main); module tower algebra belongs to Tau Ceti, topological adapters to AlgebraicTopology, coherent/sheaf derived limits to EnhancedDerivedSheaves and SchemeAndStackFoundations, double-complex specializations to DerivedModuleAlgebra, exact couples to StableHomotopyKTheory §7.22, and the generic convergence/image-tower extensions to this roadmap. The closest-results/headings list is empty. No conflicting owner of this package's extensions was found.

### Wording, arrangement and reuse

Compared 22 passages with four readable sources: the 13 readable seeded targets, plus 1.1, 2.3, 3.1, 3.2, 4.4, 7.2, 7.4's obstruction example, the Layer 3 circle-method example, and the ML declaration docstring. This includes definitions, remarks, proof routes and Lean prose. Further source witnesses: stacks-012K line 1158–1182, 2349–2368 and 3715–3735; bhatt-scholze2015 line 701–702 and 755–770; helle-rognes2024 line 943–969; browning-sawin2020 line 57–75 and 568–587. Standard names and necessary formulas match; no copied prose, disguised clause-by-clause rewrite, table, figure or exercise list was found. The obstruction example is reindexed, expanded and independently computed, not copied as source expression.

Counted source-key citation occurrences before References, counting one key occurrence rather than each theorem within it: Stacks 42, Helle–Rognes 21, Weibel 11, Boardman 5, Eilenberg–Moore 2, Bhatt–Scholze 2, and McCleary/Massey/Browning–Sawin 1 each: total 86. All ten works are represented in the manifest, including the background Cartan–Eilenberg reference.

Read the Stacks contents at stacks-012K line 7–41. Its §§19–25 order filtrations, spectral sequences, exact couples, differential objects, filtered differential objects, filtered complexes and double complexes; inverse systems are §31. This roadmap inserts a generic convergence layer and a spectral-object layer and puts filtered-complex identification before the exact-couple adapter. There is no one-to-one run with the same order and scope. The dependency edges above force the generic-towers→convergence→spectral-object→filtered-complex direction; 6.3 consumes 4.1/5.1, and conditional convergence consumes the exact-couple adapter and tower theory. The organization is mathematically its own.

Source independence: 22 passages compared with 4 readable sources, no copied expression found; largest share stacks-012K, 42 of 86 source-key citation occurrences; contents compared with stacks-012K: independent. Wording against the six settled uncertified sources was not tested.

## Not verifiable

- `weibel1994`: settled uncertified; §§3.5, 5.2, 5.5 and 5.9, including the sampled consequences, comparison and exact-couple locators, could not be read. Claims were checked independently where possible; book wording and exact locators are not certified.
- `eilenberg-moore1962`: settled uncertified; §7 comparison/complete-convergence text unavailable.
- `boardman1999`: settled uncertified; 3.4(b), Definition 5.10 and Theorems 7.1, 8.2, 8.10, 8.13 were not read directly. Checked the cited readable Helle–Rognes formulations.
- `mccleary2001`: settled uncertified; chapters 2–3, including the sampled consequences, unavailable.
- `massey1952`: settled uncertified; original article unavailable. Checked the readable Stacks exact-couple construction instead.
- `cartan-eilenberg1956`: settled uncertified; Chapter XV background reference unavailable.
- Journal numbering for Bhatt–Scholze and Browning–Sawin was not compared with the read arXiv versions; manifest and README identify the versions whose locators are used. The Helle–Rognes published-version comparison is retained from the previous verified review, not independently repeated here.

These are settled access limitations, not new reference requests or findings. No source was fetched from an unauthorized host. No Lean process remains running.

## Source issues

- **Misprint** in helle-rognes2024 at Lemma 2.2 proof, draft p.2, line 69: the source says the outgoing differential's image is a subobject at its source position; it should be the incoming image, indexed s+r; affects the proof.
- **Misprint** in helle-rognes2024 at Proposition 4.9 proof, draft p.6, line 332: the source says the boundary image has differential index s−r; it should be s+r, as in the proposition; affects the proof.
- **Misprint** in stacks-012K at Lemma 24.11 proof, p.65, line 3162: the source says vanishing of the degree-n filtered term makes the cycle preimage a kernel; it should use the degree-(n+1) term; affects the proof.
- **Misprint** in stacks-012K at Lemma 24.13 proof, p.67, lines 3225–3227: the source says a degree-n preimage is the sum of a differential image in degree n+1 and a kernel; it should use the degree-n filtered term plus the kernel; affects the proof.
- **Error** in stacks-012K at Lemma 24.13 proof, p.67, lines 3229–3232: the source says an H^(n−1) isomorphism identifies internal and ambient boundaries in degree n; it should use injectivity on H^n at the degree-n bound; affects the proof.

For the last error, take K=(ℤ→id ℤ) in degrees n−1,n and L containing only K^n. The H^(n−1) map is 0→0, but internal boundaries are 0 and ambient boundaries intersect L^n in ℤ. Injectivity on H^n fails. The package uses the corrected degree-n condition. None of these source errors is inherited by its theorem signatures.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "45195a5e3d94083ae05fe5330fc287f412ea3529", "job": "REV-PKG-SpectralSequencesAndConvergence~3", "model": "gpt-6-astra", "worker": "chris-8"} -->
