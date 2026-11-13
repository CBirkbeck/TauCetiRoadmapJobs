<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13813#issuecomment-6861620871 -->
Review (codex) of 10d27c0

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) The global Euler theorem needs convergence in every degree

   **Location.** `packages/SpectralSequencesAndConvergence/design/README.md:699` and `:708`; `packages/SpectralSequencesAndConvergence/design/plan.json:649`, `:652`, `:654`. The Euler clause starts: “Under a finite filtration in every degree and finitely many nonzero positions on page `r`”.

   **Claim.** The preceding hypothesis is weak convergence in a single degree `n`. The Euler clause adds finite filtrations in every degree but does not add weak convergence in every degree. The plan explicitly retains “weak convergence in degree n” and adds only the invariant's hypotheses for the Euler identity. These premises do not relate the other abutment degrees to the pages. This matters because §3.2 explicitly permits changing the abutment outside the convergence range.

   **Witness.** Over ℚ, take zero pages, `I={0}`, `H⁰=0`, `H¹=ℚ`, all other H zero, and `F⁰H=H,F¹H=0`. Weak convergence holds in I; every filtration is finite. With dimension, the abutment sum is −1; the page sum is 0.

   Here extend each filtration constantly for `p≤0` and by zero for `p≥1`. Use finite-dimensional vector spaces as P and dimension, valued in ℤ, as v. Thus even both Euler sums have finite support. Alternatively, putting ℚ in every positive abutment degree also refutes the claimed finiteness of the nonzero abutment degrees. The local hypothesis in degree 0 remains unchanged in both examples. The cited Stacks result has an actual filtered complex and establishes convergence in all degrees before its Euler conclusion: stacks-012K line 3152–3158 and line 3175–3197, Lemmas 24.11–24.12, printed pp. 65–66.

   **Exact repair.** Start the Euler bullet with: “Suppose the spectral sequence converges weakly to H in every total degree, every Hⁿ has a finite filtration, and page r has finitely many nonzero positions, all in P. Then …”. Add the all-degree convergence hypothesis to the global clause and its hypotheses in plan target 3.4. Keep the local vanishing and Serre-class assertions local. Add the witness above as a negative-control Check explaining why convergence in a proper range does not determine the global Euler sum.

   **Repair tested.** The witness fails the new premise at degree 1: its zero limit page cannot identify with `gr⁰H¹=ℚ`. With a constant page having ℚ at `(0,1)` only and the same H, all-degree convergence holds and both sums are −1. With zero pages and all-degree convergence, each finite filtration has zero graded pieces, forcing every Hⁿ=0; both sums are 0. Finite page support and all-degree convergence likewise imply finite abutment support.

One finding, P2 (one blocking). The five previous findings are repaired. The new finding concerns the scope of convergence in the global Euler theorem, not any of those repairs. No design file or source-manifest entry was changed.

## Verified sound

**Previous findings, checked first.** None was marked not actionable. The repaired passages below were read in both the README and the corresponding plan target; the witnesses were recomputed.

| Previous finding | Status; repaired passage in the current README | Verification |
|---|---|---|
| F01, limit degree | Repaired. `:1483–1485`: “converges strongly in total degree `n` to `H^n := A_{n+1}^{+∞}`”, with `F^s=ker(A_{n+1}^{+∞}→A_{n+1}^s)` and `RA_{n+1}^{+∞}≅W^{n+1}`. | The limit step has `E∞⁰⁰=ℤ`, `A₀⁺∞=0`, `A₁⁺∞=ℤ`, `F⁰=ℤ,F¹=0`. The opposite step has `A₀⁻∞=ℤ` and the same graded piece without a degree shift. The amended half-plane test uses degrees n,n+1. |
| F02, restricted recipes | Repaired. `:837–860`: natural positions assume `X.HasSpectralSequence coreE₂CohomologicalNat`; the finite clause uses `SpectralObject C (Fin (l+1))`, clamped endpoints and a new first-page computation instance. | At l=2,r=3 the endpoints are `(0,0,1,2)` and `(0,1,2,2)`. At r=2 they are `(q,q,q+1,q+1)`. The crossing-boundary example still has restricted homology ℤ versus proposed next-page object 0, and now fails the explicit class hypothesis. |
| F03, identity marking | Repaired. `:364–367`: “with `e` the canonical identification … is the identity presentation”. | Canonical marking fixes both axes in ℤ²; swap marking exchanges them. The new Check at :378 distinguishes them. |
| F04, impossible zero-term Check | Repaired. `:1144–1150`: “Each `K^m` is finitely filtered … but no single `p` has `F^p K = 0`”. | For m≥0, `H^m(F^sK)=ℤ` exactly for s≤m, cutoff m+1; for m<0 it is zero. At n=−1,0,3, the bounds `(p₁,p₀)=(-1,1),(0,2),(3,5)` work. No uniform upper cutoff exists. Zero terms have the unique zero filtration. |
| F05, odd pages | Repaired. `:808–811`: “this does not assert degeneration (1.3) at an odd page”. | With ℤ at (0,1),(2,0), d₁=0 and d₂=id, `E₁=E₂≠0`, `E₃=0`, and every odd differential is zero. |

The pattern pass covered every occurrence of identity presentations, markings, the four spectral-object recipes, negative/cohomological degrees, the two conditional abutments, half-plane criteria, zero terms, degreewise finiteness and odd-page vanishing. The limit shift is propagated through Conventions, the definition/API of plan target 7.4 and its tests. Target 7.5 still uses the unshifted colimit branch. No recurrence of the five repaired defects was found. The global-versus-local distinction was also tested outside the changed passages and produced R01.

**Coverage and principles.** Read all 31 target statements, their hypotheses, APIs and tests in plan.json and the complete README. There are seven layers, 31 Needs lines, 105 README Check bullets, seven Examples subsections and seven Dependencies subsections. The plan and manifest parse. The design has no declared gaps. Maintainer notes: none.

The generality is arbitrary abelian categories, with countable products, coproducts, exact sequential colimits and repleteness imposed where used. The module and geometric instances are distinguished from that general theory. No route-specific restriction, algorithmic deliverable, forbidden supplier, second roadmap copy, sorry'd data, set_option, HTML anchor, machine path or review/PR narrative was found in the design. The required shape is present. Definition blocks have APIs and at least three Checks. The two inherited unresolved-name leads are supplier names, resolved below. Proposed API names in the plan are not represented as declarations of an absent Lean file.

Read the main roadmaps DerivedModuleAlgebra, EnhancedDerivedSheaves and StableHomotopyKTheory for shape and scope. The dependency order is mathematical: 3.2 needs 1.4/2.1/3.1; 4.4 needs 3.2/3.4/4.2/4.3; 5.3 needs 4.4/5.1/5.2; 6.3 needs 4.1/5.1/6.1/6.2; and 7.5 needs 5.1/5.2/6.3/7.1/7.2/7.4. These dependencies account for the construction order without following a source's chapters.

**Seeded source verification.** All 15 seeded targets were examined. Thirteen have readable supporting locators; the direct citations for 3.5 and 4.6 are settled uncertified, so their exact source text and numbering remain unverified. No additional author-flagged unverified locator was found. The table distinguishes source statements from the roadmap's categorical extensions.

| Target | Locator read and printed page | Result |
|---|---|---|
| 1.1 | stacks-012K line 2614–2619, §20, p. 53; helle-rognes2024 line 68–70, Lemma 2.2 proof, p. 2 | Subquotient correspondence is the input used there. Arbitrary marked presentations and the identity marking are the roadmap's explicit general formulation. |
| 1.4 | stacks-012K line 2625–2631, Definition 20.2, p. 53; helle-rognes2024 line 71–77, Definition 2.3, p. 2 | Limit is the infinite-cycle/boundary quotient; Stacks requires existence. The countable kernel/product and image/coproduct constructions justify existence here. |
| 2.1 | stacks-012K line 2981–2992, §24, p. 61; line 3010–3014, Lemma 24.2, p. 62 | Filtration degree, total degree and differential `(r,1−r)` agree. Native, finite and homological translations were checked against the pin. |
| 2.2 | stacks-012K line 3107–3130, Definition 24.7/Lemma 24.8, p. 64 | Both boundedness directions and regular/coregular implications agree. The quantitative bound is derived using the outgoing and incoming coordinates. |
| 2.3 | stacks-012K line 3185–3195, Lemma 24.12 proof, p. 66 | The finite even/odd page calculation supports this page-step identity. Its extension to a weak Serre class and additive invariant retains the needed exactness hypotheses. |
| 3.1 | stacks-012K line 2349–2368, Definition 19.1, p. 48; helle-rognes2024 line 81–93, Definition 2.5/Lemma 2.6, p. 2 | Filtrations and finite/exhaustive/separated predicates agree. The different completeness terminology is explicitly translated by Conventions and 7.1. |
| 3.3 | stacks-012K line 3055–3061, Lemma 24.4, p. 63 | Source proves filtered-complex naturality. The abstract category is constructed here from the stated compatibility square, whose identity/composition laws check directly. |
| 3.5 | weibel1994 Theorem 5.2.12; eilenberg-moore1962 §7 | Settled uncertified. The finite induction and complete/exhaustive comparison route were checked independently, including failure without completeness. |
| 4.3 | stacks-012K line 3072–3106 and 3144–3151, Lemmas 24.6/24.10, pp. 63–65 | Canonical subquotient, rather than arbitrary isomorphism, is the relevant comparison. Endpoint hypotheses were checked using spectral-object exactness. |
| 4.6 | weibel1994 Theorem 5.2.12 | Settled uncertified. The deduction from 3.5 and naturality at the pin is valid under 4.4's hypotheses; the pin's stronger endpoint vanishing implies them. |
| 5.1 | stacks-012K line 3038–3061, Lemmas 24.3/24.4, pp. 62–63 | Source's 24.3 has countable direct sums; the arbitrary-category statement here is independently supplied by Tau Ceti's first-page differential theorem. Sign and page shift agree. |
| 6.1 | stacks-012K line 2653–2686, Definition 21.1/Lemma 21.2/Definition 21.3, pp. 54–55 | Derived couple and sequence formation agree. The exact-couple carrier/derivation are imported from StableHomotopyKTheory §7.22. |
| 6.2 | stacks-012K line 2687–2703, Lemma 21.4 and remark, p. 55; helle-rognes2024 line 136–144, Definition 3.3/Lemma 3.4, p. 3 | Preimages, images and lift formula agree after reversing filtration indexing. r versus r+1 is tested below. |
| 6.3 | stacks-012K line 2834–2905, §23, pp. 58–59 | Supports the filtered-differential-object instance, including boundary differential. General spectral objects use their native exact sequences; Weibel 5.9.4 remains uncertified. |
| 7.2 | bhatt-scholze2015 line 701–702 and 755–770, Definition 3.1.1/Proposition 3.1.10, pp. 16–17; stacks-012K line 3715–3735, Definition 31.2/Lemma 31.3, p. 78 | Topos and abelian-group scope is accurately labelled. The arbitrary-abelian-category equivalence has its own shear/kernel proof. The exact-products warning is present at Stacks line 3722. |

Additionally checked the repaired 4.1 against helle-rognes2024 line 291–303 and 334–335 (Definition 4.5, Remarks 4.6/4.10, p. 6) and the native recipes; the repaired 7.4 against line 113–114, 145–178 and 185–247 (pp. 2–5), including the degree of γ in the proof; and the odd-differential example against browning-sawin2020 line 57–75 and 568–587. The source's circle-method hypotheses are not proposed as this roadmap's general theorem. All ten referenced works already have manifest entries; no new source fetch or manifest edit was required.

**Adversarial computations.** Read every statement and Check. For unchanged material, the previous round's computed rows were retained as evidence only where they actually supplied values; those rows are supplemented here by fresh range, boundary, degree and marking computations. The table includes all seeded targets, the headline families and the changed passages. Equality of computed values is evidence on the stated instances, not a claim of formal proof. R01 supersedes the previous global-Euler row, which implicitly assumed all-degree convergence.

| Statement | Instances tried | Computed sides/values | Result; change |
|---|---|---|---|
| 1.1 correspondence, identity and naturality | ℤ/4 inside ℤ; zero; axes of ℤ² | `0≤2ℤ/4≤ℤ/4` lifts to `4ℤ≤2ℤ≤ℤ`; B=Z gives one point; canonical preimage fixes axes, swap sends horizontal to vertical; nested preimages compose | Holds with repaired marking |
| 1.2 towers, rebasing | d₂=×2; zero pages | Source `(Z₃,B₃)=(0,0)`; target `(ℤ,2ℤ)`; rebasing target at 3 gives `(ℤ/2,0)`; zero pages give `(0,0)` | Holds |
| 1.3 stabilisation and degeneration | ×2 sequence; zero differentials | Nonzero d₂ kills source and yields target ℤ/2; all later differentials 0; source entering d₂=0 but leaving d₂≠0 | Stabilises at 3, not 2; regular/coregular distinguished |
| 1.4 limit page and vanishing | ℓ-adic two-term example for ℓ=2,3; zero | `Z₁=ℤ,Z₂=ℓℤ,Z₃=ℓ²ℤ`; meet 0, boundaries 0; every Eᵣ≅ℤ but E∞=0; zero pages yield 0 | Limit is not an eventually chosen isomorphism class |
| 2.1 assignment conventions | r=2,3; homological r=2; empty Fin 0 | Cohomological `(Δfil,Δdeg)=(2,1),(3,1)`; native classical `(1,1),(2,1)`; homological negation gives `(2,1)`; Fin 0 has empty image | Holds; offsets 0 and 1 distinguished |
| 2.1 injectivity | `(p,p+q)` and `(p,p)` | First inverse `(s,n)↦(s,n−s)`; second sends (0,0),(0,1) both to (0,0) | Wrong assignment excluded |
| 2.2 bounds | first quadrant, (1,0); shrinking ℓ-adic cycles | Outgoing fil `f+r−e≥β(n+1)`; incoming `f−r+e≤α(n−1)`; α=−1,β=n+1 gives `r≥max(p+1,q+2)`; (1,0) stable at 2; ℓ-adic cycles never constant | Holds; own-degree finite support is insufficient |
| 2.3 page Euler identity | ℤ/4→ℤ/2 onto; ×2 over ℚ; infinite dimension | Lengths `−2+1=−1=−1+0`; dimensions `−1+1=0=0`; unrestricted finrank gives `0≠1+0` | Additivity on P is essential |
| 3.1 filtration predicates and extensions | ℓ-adic ℤ,ℤℓ; constant/zero; ℤ/4 and split ℤ/2² | Completion ℤℓ≠ℤ, but completion of ℤℓ is itself; constant meet X, zero join 0; both finite examples have graded ℤ/2,ℤ/2 but different groups | Holds; graded pieces alone do not identify the object |
| 3.2 range and convergence | ×2 filtered complex; zero pages/constant ℤ; I empty | `E∞¹⁰=gr¹H¹=ℤ/2`; zero pages have gr=0 but meet ℤ; empty I imposes no equations | Holds; outside-I changes are permitted |
| 3.3 compatibility | (−1,id), identity, zero pair | Compatibility sides −β and β on ℤ; identity β=β; zero 0=0; composition gives `β″gf=gr(kh)β` | Holds |
| 3.4 local finite consequences | ℤ/4 and split group; zero graded pieces | Length `2=1+1` in both; finite endpoints and zero graded pieces force H=0 | Holds in the degree of convergence |
| 3.4 global Euler and support | Zero E; I={0}; H¹=ℚ; then Hᵐ=ℚ for every m>0 | First example: page sum 0, abutment sum −1. Second: page support empty, abutment support infinite | Fails; R01 adds all-degree weak convergence |
| 3.4 repaired Euler | Constant page ℚ at (0,1), H¹=ℚ | Page sum −1; abutment sum −1; global β identifies ℚ with gr⁰H¹ | Repair passes |
| 3.5 comparison | ℤ→ℤℓ; constant ℤ→0; finite filtered identity | Same graded ℤ/ℓ but non-surjective inclusion; zero graded pieces but kernel ℤ; finite identity has kernel=cokernel=0 at each induction step | Strong/finite hypotheses discriminate |
| 3.6 consequences | Hopf pages; two ℤ/2 pieces; forbidden m=0; ×2 over ℚ | Hopf d₂=id gives H¹=H²=0,H⁰=H³=ℤ; length 2 permits ℤ/4 or split group; at m=0 successive identity edges have composite id≠0; dimension drops 1→0 | Holds with m≥1 and convergence in the stated degrees |
| Layer 3 odd pages | ℤ at (0,1),(2,0), d₁=0,d₂=id | E₁=E₂≠0,E₃=0; all odd differentials 0 | Repaired: adjacent-page equality, not degeneration |
| 4.1 integer/restricted towers | ×2; crossing-boundary acyclic complex | Integer Z₃ at (1,−1)=ker(×2)=0; boundary-crossing restricted H(page 2) at (1,0)=ℤ versus recipe page 3=0; class obstruction H⁰(1≤2)=ℤ | Revised natural-position hypothesis excludes failure |
| 4.1 finite recipe | l=2,r=2,3; l=0,1 | At r=3: `(0,0,1,2)`,`(0,1,2,2)`; r=2: `(q,q,q+1,q+1)`; top-row B₃=0; l=0 no positions; l=1 endpoints `(0,0,1,1)` on every page | Clamping and first-page instance correct |
| 4.1 homological recipe | (p,q)=(1,0),r=3 | n=−1, endpoints `(−1,0,1,2)`; cycle map `H⁻¹(0≤1)→H⁰(−1≤0)` | Both degree negation and coordinate negation retained |
| 4.2 abutment indexing | ×2; first quadrant | Native `F³H¹=ℤ/2,F⁴H¹=0`, graded piece at (3,−2); classical graded piece at (1,0); quadrant F⁰=Hⁿ,Fⁿ⁺¹=0 | Shift n+1 agrees |
| 4.3 comparison and stability | Nonexhaustive acyclic complex; ×2; ℓ-adic complex | First: E∞=ℤ,grH=0,B∞=0,Bᵗ=ℤ; ×2 bound max(2,3)=3; ℓ-adic Z∞=Zᵗ=0 although each Zᵣ≠0 | Canonical subquotient and sufficient bounds correct |
| 4.3 continuity | Identity complex in degrees n−2,n−1, finite steps only in n−1 | Colimit comparison ℤ→0 is epi, not mono; boundary images in degree n and their join both 0 | Epimorphism suffices; no exact-colimit premise added |
| 4.4 local convergence | a≤q<b; q<a; q≥b; ×2 | `max(q−a+2,b−q+1)≤b−a+1`; q<a gives Hⁿ(q≤q+1)=0; q≥b gives zero limit after q−a+2; ×2 a=−2,b=0 gives F²=H¹,F⁴=0 | Holds |
| 4.5 quadrants | n=0,n<0; third-quadrant m=−2 | n=0 has only E₂⁰⁰=H⁰; n<0 gives Hⁿ=0; third quadrant a=−2,b=1 and positions (0,2),(1,1),(2,0) | Holds |
| 4.6 naturality/comparison | Identity; finite complexes | Page and abutment maps id; endpoint outer groups 0 force kernel=cokernel=0 for Hⁿ(⊥≤j)→Hⁿ(⊥≤⊤) | Native comparison is included with stronger hypotheses |
| 5.1 classical sign/page | ×2; trivial filtration | Classical (0,0),(1,0) map to native (1,−1),(3,−2), d₁=+2, H¹=ℤ/2; trivial filtration has only p=0 and all dᵣ=0 | Holds |
| 5.2 canonical comparison | ℤ^(ℕ)⊕ℤ with extra acyclic summand | E∞=ℤ^(ℕ)⊕ℤ≅H⁰=ℤ^(ℕ), but canonical comparison kernel=0⊕ℤ; B∞=0,Bᵗ=0⊕ℤ | Arbitrary β is correctly distinguished |
| 5.3 cohomological bounds | Degreewise finite d=0 complex; zero terms; shrinking example | n=0,3: E₁ⁿ⁰=grⁿHⁿ=ℤ, cutoff n+1; n<0: Hⁿ=0; no global cutoff; shrinking example H¹(FˢK)=ℓˢ⁻¹ℤ≠0 | Repair holds; neighboring-degree premise needed |
| 5.4 exhaustive bounded-below | ℓ-adic ℤ; nonexhaustive acyclic complex; bounded example | ℓ-adic F⁰H⁰=ℤ but no upper zero step; acyclic example E∞=ℤ,H⁰=0; bounded example union F=H and Fᵖ⁰H=0 | Route and necessary hypotheses consistent |
| 6.1 exact couple/page shift | D=E=ℤ²; k=1 page shift | im i=ker j=horizontal, im j=ker k=horizontal, im k=ker i=vertical; jk(x,y)=(y,0), H=0; shifted rise r+1−1=r | Correct degree and offset e−k |
| 6.2 exact-couple towers | Bockstein ℤ; D=ℤ/ℓ², ℓ=2,3 | Bockstein Bᵣ=0,Zᵣ=ℤ/ℓ; torsion couple d₁=0,Z₂=(ℤ/ℓ)²,Z₃=ℤ/ℓ⊕0,d₂(b)=b in first coordinate | r versus r+1 distinguishes wrong formula |
| 6.3 identification | ×2 filtered complex | k degree (2,−1); dᵣ degree (r+1,−r); degree-1 D tower 0 for p≥4,ℤ at 3,ℤ/2 for p≤2; lim=0,colim=ℤ/2; replacing k by 0 gives ker k=ℤ≠im j=0 | Native shift and exactness correct |
| 7.1 limits/completeness | Identity, ×ℓ, zero transitions | `(lim,lim¹)=(A,0),(0,ℤℓ/ℤ),(0,0)` respectively; partial-sum calculation `(1−s)σ=−inclusion`, `(1−s)(Δc−σ)=inclusion` | Holds; complete filtration gives a section |
| 7.2 equivalence and ML | Shear tower; kernel tower; finite groups | Shear compatibility first component `fₙxₙ₊₁+xₙ−fₙxₙ₊₁=xₙ`; converse six-term tail `lim F→F₀→lim¹K=0`; stable-image quotient has lim=lim¹=0 | Both implications use the named hypotheses |
| 7.2 nonreplete control | Discrete Galois modules μℓⁿ | Finite transitions onto; smooth vectors in ℤℓ(1)=0 because `(χ(g)−1)x=0` forces x=0; projection 0→μℓ not epi | Repleteness is substantive |
| 7.3 double tower | Identity, ×ℓ, eventually zero | Identity/all-zero: three terms 0; ×ℓ: `0→0→ℤℓ/ℤ→ℤℓ/ℤ→0`, transition ×ℓ invertible | Holds |
| 7.4 limit theorem and half-plane | Repaired step couple | E∞⁰⁰=ℤ,A₀⁺∞=0,A₁⁺∞=ℤ; F⁰=ℤ,F¹=0; RE∞=RA₁⁺∞=W¹=0; n=0,s₁=0 kills E in degrees 0,1 for s>0 | Degree-shift repair holds |
| 7.4 colimit theorem and half-plane | Opposite step; identity D,E=0 | Opposite step A₀⁻∞=ℤ,gr⁰=ℤ,E∞⁰⁰=ℤ,W⁰=0; identity couple lim=colim=ℤ but E∞=0 | Colimit unshifted; conditional premises exclude identity counterexample |
| 7.4 nonzero obstruction | Product-tail couple | d₁ and d₃ pair s=−1 with 0, and −2 with 1; E∞=RE∞=0; colim=∏k/⊕k; constant filtration has lim¹=0 and meet=W⁰=∏k/⊕k≠0 | Weak convergence does not imply strong; both degree-0 half-plane tests fail |
| 7.5 complete convergence | ℓ-adic ℤℓ versus ℤ | Both have E∞ᵖ,⁻ᵖ=ℤ/ℓ for p≥0; ℤℓ is complete with W=0, ℤ completes to ℤℓ≠ℤ; exact products carry invertible 1−s on complexes to invertible 1−s on cohomology | Complete-case route and unshifted total degree hold |

**Pinned library audit.** The baseline pins agree with lake-manifest.json: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Searched the pinned sources by page fields, kernel/image operations, filtrations, towers, convergence predicates and repleteness, and located the cited declaration names. The following principal declarations and signatures were opened; names sharing a namespace/file were resolved there rather than inferred from current upstream.

| File at the pin | Declarations and scope checked |
|---|---|
| `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean:36,51,60,90,99,109,118,128` | SpectralSequence, Hom, pageXIsoOfEq, pageFunctor, pageHomologyNatIso and the cohomological carriers. The carrier fields are pages and adjacent homology isomorphisms; no abutment/convergence field. |
| `Mathlib/Algebra/Homology/ComplexShape.lean:163`; `Mathlib/Algebra/Homology/SpectralSequence/ComplexShape.lean:36,47` | up′ has relation i+a=j, including a=0; natural and finite shapes use integer coordinate equations. No natural-subtraction junk values are used in the stated translations. |
| `Mathlib/Algebra/Homology/SpectralObject/HasSpectralSequence.lean:67,143,176,214,260,303,347,356,394,402,406,437`; `FirstPage.lean:47,54,59,64,78` | Four recipes, native carriers/endpoints, HasSpectralSequence and quadrant classes, HasFirstPageComputation, first-page isomorphism. The finite first-page instance is genuinely additional work. |
| `Mathlib/Algebra/Homology/SpectralObject/Basic.lean:41,63,122`; `Cycles.lean:59,63`; `Page.lean:65`; `SpectralSequence.lean:479,488`; `EpiMono.lean:191,224` | Spectral-object cohomology, connecting maps, exactness, cycles/opcycles/page and page comparisons. |
| `Mathlib/CategoryTheory/Filtration/Basic.lean:44,73,90,145` | Filtration's underlying data is `toMonoOver : I ⥤ MonoOver X`; FilteredObject, Hom and IsStrictHom are supplied. Exhaustiveness, separation and completeness are not fields. |
| `Mathlib/CategoryTheory/Subobject/Basic.lean:102,292,572`; `Limits.lean:120,314`; `ArtinianObject.lean:55,69` | Subobject, ofLE, pullback, kernel/image subobjects and Artinian chain stabilisation. |
| `Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Basic.lean:99,126,152,166`; `Mathlib/Algebra/Category/ModuleCat/AB.lean:28,38`; `Projective.lean:60` | AB4Star, CountableAB4Star, AB5 and shrinking; module universe hypotheses and Small-dependent enough projectives. |
| `Mathlib/Algebra/Category/ModuleCat/EpiMono.lean:67`; `Mathlib/CategoryTheory/Functor/EpiMono.lean:158` | Forget preserves epis in every module universe; faithful reflection has the generated dual instance. The latter name is not missing merely because a simple declaration-name parser misses the priority annotation. |
| `TauCeti/CategoryTheory/Limits/Replete.lean:91,97,107,118,357`; `TauCeti/CategoryTheory/Sites/Replete.lean:48` | IsReplete, types, all limit projections, descent along functors, exact countable products, and sheaf repleteness with its concrete-category hypotheses. The lim¹ characterisation is additional. |
| `TauCeti/Algebra/Homology/SpectralObject/Abutment.lean:44,50,54,76,92,114,123`; `Stabilization.lean:45,51` | abutment, image filtration and maps, EInftyIsoCokernel, zero/full criteria, EInfty and stable-page comparison. |
| `TauCeti/Algebra/Homology/SpectralSequence/Comparison.lean:32`; `TauCeti/Algebra/Homology/SpectralObject/Comparison.lean:42,78,121` | Later-page isomorphism propagation; naturality of the stable comparison; finite endpoint comparison with both adjacent cohomological degrees. |
| `TauCeti/Algebra/Homology/SpectralObject/SpectralSequenceMap.lean:64,230`; `Map.lean:106,223,284` | Page maps, spectralSequenceMap, EMap and opcycles maps. |
| `TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:147,191,304,409,425`; `Naturality.lean:83`; `FirstPage.lean:89` | Filtered spectral object, sequence, filtration functor, first-page quotient comparison and differential, with their actual native indexing. |
| `TauCeti/Algebra/Homology/SpectralSequence/Filtered/Stabilization.lean:44,60,83`; `Convergence.lean:51,91,118`; `Comparison.lean:70`; `Exhaustive.lean:102,177,200` | Finite comparisons and module-only exhaustive results. The exhaustion lemma needs exhaustion in Kⁿ only; the design's stronger convergence result is not attributed to that lemma alone. |
| `TauCeti/Algebra/Homology/SpectralSequence/Bicomplex.lean:410,497` | Row-filtration sequence and stable comparison are instances, not rebuilt here. |
| `TauCeti/CategoryTheory/Preadditive/TowerDifference.lean:77,122,150,165`; `TauCeti/Algebra/Category/ModuleCat/Tower/Basic.lean:174`; `MittagLeffler.lean:70,191` | Difference map, kernel limit, naturality, pro-zero inverse; module lim¹ and ML vanishing. The abstract cokernel construction extends the module statement. |
| `Mathlib/Algebra/Homology/EulerCharacteristic.lean:56,154`; `TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean:216`; `EulerCharacteristic.lean:165` | Euler signs, homology Euler characteristic, additive invariants and finite-interval Euler engine. Regrouping by total degree supplies the engine's complex; it does not remove R01's abutment hypothesis. |

**Ownership and resolved cross-roadmap citations.** Read the supplied board-package index before checking absence on main. Main has no SpectralSequencesAndConvergence folder. Used `roadmaps show`, `roadmaps grep` and `roadmaps resolve`; searched the named objects rather than just proposed declarations. The fresh resolve reports no unresolved roadmap citation or Lean name; its disclaimer that pinned Lake packages were not searched is covered by the direct audit above. The overlap file has no conflicting head, dropped cited id or revision-only cited id.

| Roadmap/head | Resolution and ownership |
|---|---|
| StableHomotopyKTheory, main | `TauCetiRoadmap/StableHomotopyKTheory/README.md:2618` (§7.22) supplies arbitrary-abelian-category exact couples and derived degrees a,b−a,c. `:2683` (§7.26) owns tower-of-spectra Boardman applications. Unlike the previous review's context, this supplier is now on main. The design builds its general convergence language and native-carrier identification, not another derived-couple carrier. |
| DGFloer, main | `TauCetiRoadmap/DGFloer/README.md:621` (Layer 1 item 3) supplies module filtered-complex classical/complete convergence and exactly the native reindexing used here. Item 2 supplies Serre instances. |
| AlgebraicTopology, main, open #1807/#1808 | Main `TauCetiRoadmap/AlgebraicTopology/README.md:879` maps old Stage 6 item 0 to §6.0; `:2145` imports module tower algebra and builds restriction/homotopy-square maps. Read both open scopes and tower passages; their module/topological scope is not a second arbitrary-abelian-category convergence theory. |
| DerivedModuleAlgebra, main | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:65` explicitly lists DoubleComplex.edgeBottom and DoubleComplex.edgeLeft; `:955` (§S.1) states first-quadrant double-complex convergence, edges, five-term sequence and classical bound. These resolve the two supplied name leads. Module tower algebra is imported from Tau Ceti. |
| EnhancedDerivedSheaves, main and open #1330/#1630 | Read Scope and ownership, E2:towers and the replete-topos boundary. Main `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:16,27,45` owns enhanced derived/sheaf limits and imports SchemeAndStackFoundations §2.17's epimorphic sheaf-tower result. Open #1630 retains this boundary at :16,28,62; #1330 at :16,27,45. No duplicate ownership of arbitrary spectral-sequence convergence was found. |
| ArithmeticGaloisDuality, open #858 | `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:3,42` owns compact/continuous arithmetic cohomology and duality, using supplied module towers and spectral-sequence instances. No generic convergence carrier. |
| Other main instance owners | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4184,4977` resolves §§2.2/2.17; `TauCetiRoadmap/ComplexKahlerGeometry/README.md:366,3317` resolves K8→Layer 8 and its Frölicher adapter. HeegaardFloer :1028 and MorseTheory :1421 concern filtered module/topological instances. |
| Board packages at the listed heads | Read AnalyticNumberTheory #123 (`packages/AnalyticNumberTheory/README.md:3`, 310e834), LawrenceVenkateshMethod #345 (`packages/LawrenceVenkateshMethod/design/README.md:3`, 9ee7ac3), and LogicAndDefinabilityInNumberTheory #164 (`packages/LogicAndDefinabilityInNumberTheory/README.md:5`, 96394e9). They own navigation, no independent layers, and logic/definability respectively; no spectral-sequence, exact-couple, lim¹ or repleteness ownership appears. |

Overlap check: read AlgebraicTopology (main, #1807, #1808), EnhancedDerivedSheaves (main, #1330, #1630), ArithmeticGaloisDuality (#858), DerivedModuleAlgebra (main), and StableHomotopyKTheory (main); exact-couple data/derivation belong to StableHomotopyKTheory, module towers to Tau Ceti with AlgebraicTopology adapters, double-complex instances to DerivedModuleAlgebra, enhanced/topos limits to EnhancedDerivedSheaves and SchemeAndStackFoundations, arithmetic instances to ArithmeticGaloisDuality. This design owns the general page/convergence structures and the stated abelian-category extensions. The third closest-roadmap list was empty.

**Supplier order.** Read all supplier contracts and all Needs lines. No forbidden, upward or cyclic supply was found. No absent prerequisite is presented as a supplied declaration. No gaps are declared. The required dependency command returned:

    candidate: SpectralSequencesAndConvergence is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
    depcheck: 240 roadmaps, 2177 edges, 0 problem(s)

There was no UPWARD or CYCLE line. The placement differs from the previous round's output; the gate's current placement is reported here without changing ORDER.txt.

**Headline coverage, padding and Lean.** The Summary's headline families are: bounded/regular stabilisation (§2.2); page and abutment Euler identities and finite consequences (§§2.3,3.4); comparison (§3.5); vanishing/dimension/edge/five-term/two-row/two-column consequences (§3.6); spectral-object tower and limit identifications, range and quadrant convergence and comparison (§§4.1,4.3–4.6); filtered-complex convergence (§§5.3–5.4); exact-couple sequence, towers and identification (§§6.1–6.3); repleteness/ML and Boardman/complete convergence (§§7.2,7.4–7.5).

This is a design submission and has no Suggested.lean. Consequently there are zero sorried declarations to probe, no Lean import/namespace/header or section-variable scope to compare, and no package headline-coverage claim to certify. Missing-package-file and padding findings are not inferred from that absence. Backticked names attributed to existing APIs were resolved; the README does not claim undeclared local headline names. Elaboration and mechanical #check comparison: **not available (this lane does not elaborate; no Suggested.lean)**. The one-tactic probe is not applicable, not passed. No Lean process was started. The package must state its statable headlines on the native carriers and explain genuinely missing carriers in its module docstring; a missing exact-couple carrier does not justify a weakened substitute.

**Source wording, arrangement and reuse.** Compared the thirteen seeded passages with readable source support and thirteen further passages: 1.2, 1.3, 3.2, 3.4, 4.1, 4.2, 4.4, 5.2, 5.3, 7.1, 7.3, 7.4 and Layer 3's circle-method example. These span four readable sources. Standard formulas, short mathematical terminology and unavoidable hypotheses were distinguished from expression. No copied prose, clause-by-clause paraphrase, table, figure or exercise collection was found. The product-tail example states its algebraic calculations in the roadmap's own form and cites Example 8.1.

Counted explicit keyed citation occurrences before References: Stacks 38; Helle–Rognes 21; Weibel 10; Boardman 5; Eilenberg–Moore 2; Bhatt–Scholze 2; Browning–Sawin 1; McCleary 1; Massey 1: 81 total. Stacks' contents at stacks-012K line 7–41 put filtrations before spectral sequences, exact couples, differential objects, filtered differential objects, filtered complexes, double complexes and inverse systems. Here §24's material is split across Layers 2,3,5, spectral objects have their own Layer 4, and exact couples follow filtered complexes for the identification in 6.3. There is no one-to-one consecutive chapter mapping. Helle–Rognes's interchange theorem and its right/left Cartan–Eilenberg development are not adopted as the plan's arrangement.

Source independence: 26 passages compared with 4 readable sources; no copied expression or reused source artifact found; largest share stacks-012K, 38 of 81 explicit keyed citation occurrences; contents compared with stacks-012K: independent. The six settled uncertified works were not textually compared.

## Not verifiable

- weibel1994, boardman1999, eilenberg-moore1962, mccleary2001, massey1952 and cartan-eilenberg1956 remain settled uncertified. Their text, exact page numbering and wording were not checked or requested again. In particular, 3.5 and 4.6's direct source verification is unavailable. Their mathematical routes and native inputs were checked separately.
- Lean elaboration, elaborated binder scope and one-tactic probes are unavailable in this design lane. No Suggested.lean exists and no Lean process was started.
- Cached legal versions were read, not separate published editions. The manifest records the Browning–Sawin preprint/journal numbering limitation. The general-abelian-category extensions are checked mathematical routes, not claims that the module/topos sources state that generality verbatim.
- Additional typographical slips below are visible in the supplied line-numbered extractions. PDF rasterization utilities were unavailable, so their typeset appearance was not independently inspected.

## Source issues

- **Misprint** in stacks-012K at Lemma 24.13, proof of (24.6.2), printed p. 67 (line 3229–3232): the source says degree-n−1 cohomology isomorphism gives the boundary equality; it should be degree-n injectivity with the corresponding bound; affects the proof.
- **Misprint** in stacks-012K at Lemma 24.11, proof of (24.6.1), printed p. 65 (line 3162): the source says vanishing of the filtration step in degree n yields the cycle equality; it should be vanishing in degree n+1; affects the proof.
- **Misprint** in stacks-012K at Lemma 24.13, proof of (24.6.1), printed p. 67 (line 3225–3226): the source says to add the differential image of the degree-n filtration term to degree-n cycles; it should be the degree-n filtration term itself; affects the proof.
- **Misprint** in helle-rognes2024 at Lemma 2.2, proof, printed p. 2 (line 69): the source says the image of the differential leaving s is a subobject at s; it should be the image of the differential entering s from s+r; affects the proof.
- **Misprint** in helle-rognes2024 at Proposition 4.9, proof, printed p. 6 (line 332): the source says the relevant image differential starts at s−r; it should start at s+r, as in the proposition's statement; affects the proof.

The first slip was recorded in the previous round and rechecked: `(0→ℤ)⊂(ℤ→id ℤ)` gives identical degree-0 cohomology, but in degree 1 the subcomplex has boundaries 0 and `im d∩F=ℤ`. None of these source slips is used as a roadmap formula. The roadmap uses the correct neighboring degree, boundary hypothesis and entering-differential convention.

## For the human reviewers

- Six works remain explicitly uncertified in `packages/SpectralSequencesAndConvergence/sources.toml`; their wording and exact numbering were not checked. The largest-share source, stacks-012K, was readable and its contents were compared.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "10d27c0865bfac0dc8e764eea0832b28c624c6db", "job": "REV-DESIGN-SpectralSequencesAndConvergence~7", "model": "gpt-6-astra", "worker": "chris-32"} -->
