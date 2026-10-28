<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1517#issuecomment-6399246112 -->
Review (codex) of 3a24c2b

Verdict: needs_changes

1. **F01** (P2) Specify the shifted cone in the derived-limit contract

   **Location:** `packages/CstConjectureForDaggerVarieties/README.md:102`; matching `gaps` entry in `packages/CstConjectureForDaggerVarieties/design/plan.json:2812`: “the Roos derived limit as the cone of 1−shift on the product”.

   **Claim:** This specifies the derived-limit model used for the degree-preserving descent and Milnor sequences of §§4.1–4.3. The cohomological shift is missing. The roadmap explicitly uses cohomological indexing at README:25,38.

   **Witness:** For the constant tower Q_p[0], δ(a)_n=a_n−a_(n+1) is onto with kernel Q_p. Cone(δ) has H⁻¹=Q_p and H⁰=0; the asserted limit has H⁰=Q_p and H⁻¹=0.

   The pinned `CochainComplex.mappingCone` has source degree i+1 and target degree i: `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57,65`. The existing module analogue explicitly uses Cone(δ)[−1], `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1578`. README:805,827 therefore cannot serve as Checks of the unshifted construction. This is a precision defect in the new contract, not a finding that its supplier has not implemented the contract.

   **Exact repair:** In both occurrences of this gap's needs sentence specify the homotopy fibre `Cone(1−shift)[−1]`. State that for towers concentrated in degree zero its Roos complex is `[∏V_n → ∏V_n]` in degrees 0,1. Add the constant Q_p[0] calculation as the shift Check. Keep the supplier, generality, exact-product requirements and Milnor sequences.

   **Repair test:** A continuous section of δ is b↦a with a₀=0 and a_n=−Σ_(k<n)b_k. Thus the corrected complex has (H⁰,H¹)=(Q_p,0). Applied to a constant V[−1], it has H¹=V, agreeing with the disc group in README:827. No finite-dimensionality or Mittag–Leffler assumption was introduced.

2. **F02** (P3) The tube API uses undefined extrema for the empty index set

   **Location:** `packages/CstConjectureForDaggerVarieties/README.md:760`: “their complements are {max_j|f_j|>ε} and {min_j|f_j|>ε} respectively”.

   **Claim:** These formulas describe the intersection and union complements for the construction, which expressly permits c=0 at README:751,767. Finite real minima and maxima require a nonempty indexing set; no extended-real convention is given.

   **Witness:** On a nonempty chart with c=0, the intersection complement is ∅ and the union complement is the whole chart. Both displayed extrema are undefined; taking an empty minimum to be 0 incorrectly makes the union complement empty.

   **Exact repair:** Write the intersection complement as `{x | ∃ j, |f_j(x)|>ε}` and the union complement as `{x | ∀ j, |f_j(x)|>ε}`. Either delete the extrema formulas or explicitly restrict them to c>0. Keep the existing empty-index Check.

   **Repair test:** At c=0 the existential is false and the universal true, giving precisely ∅ and the whole chart. For f=T, ε=|π|, T=1 satisfies both one-equation formulas; for πT it satisfies neither. Thus the repair also preserves the two rescaling Checks.

## Verified sound

Reviewed on 2026-10-25. Two findings, one blocking (P2), one nonblocking (P3). The four package inputs were read without modification; within the package, only the review deliverables were written. No source-manifest addition was necessary.

All 44 numbered subsections, 44 Needs lines, six layer dependency paragraphs, conventions, definition APIs and Checks were read. All 15 newly seeded targets were checked against the cached source text, including theorem numbers, manuscript pages, hypotheses and proof steps used. There are no author-flagged unverified locators. The prior review's 118 computed rows cover its unchanged targets and APIs; those rows, rather than its summary assertions, were used for unchanged material. Changed passages and the new sample were checked afresh. The table below includes every headline, the sample and the findings; it does not reproduce a second per-API ledger.

No route-specific restriction on primes, computational algorithm, copied source exposition, wholesale re-planning of a readable roadmap, admitted data, `set_option`, or cyclic supply was found. In particular p=2 is retained, the general countable perfect residue-field setting is retained, and the unrestricted conjectures are distinguished from the conditional equivalence theorem and proved geometric classes. Finite adversarial examples supplement the source and interface checks; they are not proofs of the unimplemented theorems.

### Finding-by-finding verification of the previous repair

The previous findings are F01–F07. None was marked not actionable in the repair report, so there are no settled findings being re-raised.

| Previous finding | Repaired passage in `packages/CstConjectureForDaggerVarieties/README.md` | Status and verification |
|---|---|---|
| F01, bounded refinement | :219: “For an acyclic pair (M,L) and r≥0” | Repaired. Acyclicity is also explicit in the arithmetic gap (:80) and counterpart. For φ=p,L=R,r=1 the degree −1 excludes the old counterexample; L=t⁻¹R gives degree 0. The other sublattice uses (:301,315) retain acyclicity through their statement. |
| F02, duplicate Hom gap | :94: “vanishing of natural VS Ext¹”; :307: “VS Hom vanishing from torsion period modules” | Repaired. The pre-existing torsion Hom theorem is cited directly in :88,307,321,972,989; the gap retains Ext¹, rank-equals-height and VS/TVS comparison. The same correction is in the plan. R/t and R/t² both have natural Hom to B equal to zero. |
| F03, derived limits | :102: “for countable towers of uniformly bounded complexes”; :830: “Milnor sequences, the six-term lim/R¹lim sequence” | Partly repaired. The missing supplier and general hypotheses are now declared identically in both places and used throughout Layer 4. The new model omits [−1], as R01 shows. This does not renew the old claim that the prerequisite is unowned. |
| F04, crystalline realization | :112: “a functorial overconvergent log-crystalline complex RΓ_cris(X)”; :620: “the overconvergent-crystalline-complex contract” | Repaired. A separate gap is a valid repair. It includes Frobenius, completion map, completed-unramified comparison and the distinction from ordinary completed crystalline cohomology. At a point the derived eigenspace is Q_p or U₁; on a dagger disc HK¹=0. |
| F05, geometric compound gap | :66: “finite-dimensional de Rham cohomology over C”; :78: “whose reduced inverse image of Z is a strict normal crossings divisor” | Repaired. Finiteness, strictness/Künneth, tube comparisons and proper-pair resolution have separate named contracts and matching plan entries. The new hypotheses list the three finite-cohomology classes, proper nowhere-dense pair, local tube charts, codimension and common radius. The consumers :374–387,445,680–686,714,745,776 use them. |
| F06, qBC degree | :533: “negative-curvature piece Hⁱ_proét(X,Q_p(r))”; :534: “at (i,r)=(0,1) the triple is (0,0,Q_p(1))” | Repaired. On P¹, i=0,r=1 gives height 1, while i=r=1 gives zero. Other degree-r formulas are genuinely degree-r assertions. |
| F07, tube API/Checks | :755: “The tube Z(ε) has the following API”; :767: “the empty union of tubes is empty” | Repaired as to the missing API and test count: four API bullets and four computed Checks were added. Unit/nonunit rescaling and monotonicity compute correctly. R02 is the empty-extremum defect introduced in the new API. |

The other repair changes were also checked: cup products in the analytic contract (:110) support the route in §3.2; §5.2 now owns its strict Čech presentations instead of attributing them to an unstated contract; §3.4 obtains smallness from the proper log comparison. The module docstring's new crystalline-realization description agrees with §2.8. Pattern searches found no additional missing acyclicity in bounded sublattice uses, no surviving duplicated torsion-Hom gap clause, and no surviving degree-r substitution for §2.3's degree i.

### Seeded source checks

All pages here are those of the versions recorded in `sources.toml`, not substituted journal pages. CN25 is the 61-page CN5 author manuscript; GK04 is arXiv v1; BKV22 is arXiv v2. These are the only three works cited by the package.

| Target | Text opened | Support and qualifications |
|---|---|---|
| 0.2 bundle of a filtered module | CN25 line 1798 and CN25 line 1803, §5.3.1, p.36 | Finite (φ,N)-module, embedded full de Rham lattice, two specified restrictions and the section kernel. The negative degree of tR is consistent. |
| 0.5 bounded eigenspaces and period kernels | CN25 line 1833 and CN25 line 1846, Remark 5.16, pp.36–37; CN25 line 1870, Proposition 5.18, p.37 | Slopes [0,r], both lattice bounds, every denominator level k≥0, common kernel tʳV_st and finite-BC height dim M. The roadmap correctly uses B_st⁺ for the positive quotient. |
| 0.8 Hom from an acyclic kernel | CN25 line 1896, Proposition 5.20 and Remark 5.21, p.38; CN25 line 921, Lemma 3.26(i), p.19 | Acyclicity and bounds retained; Hom and Ext into B_dR are natural VS operations. The roadmap corrects the source's lattice-inclusion direction and unrestricted B_st typo. |
| 1.2 small dagger varieties | CN25 line 2289 and CN25 line 2302, §7.2, p.46 | Small means finite free Bⁱ in every degree; the three example classes are listed. The naive-interior terminology is tied to the source footnote through the exact supplier contract, not equated with arbitrary interiors. |
| 1.4 twist invariance and reduction | CN25 line 2200 and CN25 line 2229, Remark 6.23(ii)–(iii), pp.44–45 | Fixed i and all r≥i; quotient HK⊗C and the corresponding de Rham quotient agree. Surjectivity induction requires every preceding degree. |
| 1.5 Stein/affinoid diagram | CN25 line 2098, Theorem 6.14, p.43 | Smooth Stein or affinoid, r≥0, strict rows and vertical maps, Fréchet/LB distinction, p⁻ʳ normalization and φ=p^(r−1) kernel. Ω⁻¹ and the r=0 exponent are explicitly addressed. |
| 2.2 kernels and cokernels | CN25 line 2325, equation (7.6), p.47; CN25 line 2335, Lemma 7.7, p.47 | Smallness and i≤r; image filtration, current-degree cokernel and preceding-degree kernel. Source page range in the README includes the actual page. |
| 2.3 qBC filtration | CN25 line 2350 and CN25 line 2356, Corollary 7.9(i) and proof, p.47 | Positive, torsion-Pair and negative associated graded pieces have indices i−1,i,i. No canonical direct-sum splitting is asserted. |
| 3.2 products | CN25 line 2466 and CN25 line 2473, Theorem 8.1(a), p.50 | Both factors small and acyclic in every degree. Künneth identifies punctured bundles; lattice containment gives a torsion cokernel at ∞. |
| 3.3 algebraic analytifications | CN25 line 2489, Theorem 8.1(b) proof, pp.50–51 | Smooth algebraic variety, admissible algebraic pair and HK GAGA; analytic filtration can enlarge the lattice. Properness is not imposed. |
| 3.6 semistable tube complements | CN25 line 2538, Proposition 8.3, pp.51–52; GK04 line 499, Proposition 3.7, pp.14–16; GK04 line 556, Corollary 3.8(a),(c), p.16 | Local semistable coordinates and intersection/union alternatives match. GK04 supports unfiltered de Rham invariance; the roadmap correctly rejects CN25's filtered-complex overclaim. Proper generic fibre is retained for the slope conclusion. |
| 4.4 proper-factor étale Künneth | CN25 line 2673, Lemma 8.13, equations (8.14)–(8.15), p.54 | Y proper, T arbitrary smooth rigid, integral derived tensor and rational finite-degree sum. Perfection is correctly assigned to Y. |
| 5.2 arithmetic torsion vanishing | CN25 line 2772 and CN25 line 2783, Lemma 9.6, pp.56–57; CN25 line 2814, §9.1.3, p.57 | Natural continuous Galois Hom, truncated de Rham Čech cocycles, density and extension from quasi-compact to other small acyclic cases. No finite-BC hypothesis on the full error term is invented. |
| 5.4 geometric recovery | CN25 line 2821 and CN25 line 2829, Theorem 9.8 and proof, pp.57–58 | Small acyclic X/C, actual TVS functor, dense finite-torsion pieces, dual period modules. No Galois input or recovery of omitted operators is asserted. |
| 5.6 recovery scope | CN25 line 2856 and CN25 line 2870, Remark 9.9(i),(iii), p.58 | Proper cohomology supplies only a constant finite-dimensional functor; extended free modules retain rank. Sheafified recovery remains a research statement. |

Additional changed-source checks: CN25 line 1670 and CN25 line 1918 impose the acyclicity used by F01; CN25 line 921 and CN25 line 939 support the remaining natural-period-Hom contract; CN25 line 2394 and CN25 line 2402 support F04's realization; BKV22 line 1176 and BKV22 line 1184, §4 p.26, support the tube definition and integral transition functions in F07. No extra source fetch was needed.

### Computed adversarial table

Notation: R=B_dR⁺, B=B_dR, U₁=(B_cris⁺)^(φ=p), D a dagger disc. Formal defect rows test the exact-sequence algebra; they do not posit a geometric variety realizing an arbitrary negative bundle. “Retain” means the displayed test needs no package change.

| Statement | Instances tried | Values computed on both sides | Result | Change |
|---|---|---|---|---|
| Coefficient and smoothness conventions | Q₂, Q₃, Q₂(√2), F₂((z)), C[ε]/ε² | First three have char 0; fourth has char 2 and is excluded. The thickening has ε²=0, ε≠0, dε≠0, unlike Ω¹ of the point, and is nonsmooth. | Correct domain; no good-prime restriction. | Retain |
| Monodromy, twist, degree and dual signs | φ=diag(1,p), Ne₁=e₀; Newton-zero lines with L=tᵐR, m=−1,0,1 | Nφe₁=pe₀=pφNe₁; N(e₁+ue₀)=0; wrong sign gives 2e₀ even at p=2. Degrees are 1,0,−1. Dual jump of 1 is −1. | Conventions distinguish wrong models. | Retain |
| Square sign, shift, Galois dual order | Point; K→K with d=1 or 0; S₃ permutation action | v(u(1))=1−1=0 versus wrong sum 2. Identity complex H=(0,0), zero differential H=(K,K) in degrees 0,1. gh(e₁)=e₂, hg(e₁)=e₃; inverse in the dual preserves the first order. | Correct. | Retain |
| 0.1 embedded lattice | M=0; line with tᵐR; line with zero lattice | Localization is 0; B for every m; 0≠B for the false lattice. Tensor tR⊗t⁻¹R=R and dual (tR)∨=t⁻¹R. Maps 1,p compose to p; p,p to p². | Full embedding, maps and API distinguish zero/rescaled data. | Retain |
| 0.2 gluing | Trivial line L=R,tR,t⁻¹R; zero | Bundles O,O(−1),O(1),0; H⁰=Q_p,0,U₁,0; completed restrictions R,tR,t⁻¹R,0. Punctured restriction of all three lines is B_e. | Both defining restrictions and kernel agree. | Retain |
| 0.3 predicates | O,O(−1),O(1),0; tensor O(1)⊗O(2) | Acyclic true,false,true,true; weakly admissible true,false,false,true. Tensor O(3) has H¹=0. | Both directions and rank zero distinguished. | Retain |
| 0.4 cohomological criteria | O,O(1),O(−1) | H¹=0,0,C/Q_p; admissible sublattice exists in R,t⁻¹R and not tR. O(−1) has finite V=0 but nonzero cokernel, so finite sections alone do not suffice. | Equivalences retain both conditions. | Retain |
| 0.4 repaired bounded refinement | r=1,φ=p,L=R or t⁻¹R; φ=1,L=t⁻¹R; r=0; zero | First degree 0−1=−1, excluded by acyclicity. Second degree 1−1=0, L′=L. Third choose L′=R⊂t⁻¹R, degree 0. At r=0 slopes 0 and L′=L; zero gives L′=0. | F01 repaired without restricting generality. | Retain |
| 0.4 arithmetic counterpart and no-modification Check | φ=p,Fil⁰=M,Fil¹=0; slopes 0,1 with Ne₁=e₀,L=M⊗R | First t_H−t_N=−1, not acyclic. Second exp(uN) preserves R-lattice and gives O⊕O(−1); H¹=C/Q_p≠0. | New hypothesis and Check agree with bounds [0,r]. | Retain |
| 0.5 bounded kernel | M trivial,L=R,r=0 or 1; r=1,k=0 or 1 | r=0: X=V=Q_p, quotient 0. r=1: X=U₁, V=Q_pt, quotient C. k=1 quotient t⁻¹R/tR has length 2 but kernel remains Q_pt. | Positive ring and common-kernel assertion correct. | Retain |
| 0.5 upper-bound negative control | M trivial,L=t⁻¹R,r=0 | L⊆R is false although E=O(1) is acyclic. For the horizontal block at r=1, e₁+ue₀ lies in X, whereas e₁−ue₀ has N=2e₀. | Bounds and monodromy law independently tested. | Retain |
| 0.6 generation | Newton slope 0 at r=0; slope 1 at r=1 and r=0 | R-spans Re,Re,0 respectively; the last is outside [0,r]. A lift of 1 under θ:U₁→C generates the trivial line modulo t. | Slope hypothesis prevents failure. | Retain |
| 0.7 eigenspace Hom | M=0; slope-zero line,r=0; slope-one line,r=1 | Hom(0,B)=0; Hom(Q_p,B)=B; Hom(Q_pe,B)=Be∨, ranks 0,1,1=dim M. Corresponding B_st values have the same ranks. | Dual, height and source category match. | Retain |
| 0.8 acyclic-kernel Hom | M trivial,r=1,L=R or t⁻¹R | V=Q_pt or U₁. Quotients X/V=C or 0. Natural Hom(C,B)=Ext¹(C,B)=0, so Hom(V,B)=B in either case; B_st rank also 1. | F02 import and remaining Ext contract sufficient. | Retain |
| 0.9 truncated recovery | Trivial M,L=R,r=1,k=2; r=0,k=1 or 0 | Evaluation on basis t is multiplication t:R/t²→R/t². Kernel tR/t² and cokernel R/t are killed by t. r=0 gives identity on C or 0→0. | Bounds tʳ,t²ʳ hold; finite-level isomorphism would fail. | Retain |
| 1.1 filtered group versus image | Point r=0,1; disc i=r=1; degree −1 | Point (F,B,Fil,A)=(tʳR,R,tʳR,0). Disc (O(D)/C,0,0,O(D)/C), with [T]↦dT≠0. Negative degree all 0. | Image and group cannot be conflated. | Retain |
| 1.2 smallness and new finiteness contract | Point, disc, naive open disc, A¹ᵃⁿ, G_mᵃⁿ, countably many points | De Rham ranks (1,0),(1,0),(1,0),(1,0),(1,1); infinite union has arbitrarily many independent B⁰ coordinates. HK and R ranks agree in the finite cases. | Listed classes and all-degree condition correct. | Retain |
| 1.3 fundamental square | Point; replace H=Q_p by 0; dense diagonal on c₀ | Actual v(q,f)=q−f has kernel diagonal Q_p and is onto. Replacing H by 0 loses that kernel. x_n↦pⁿx_n has dense proper image: y_n=pⁿ has preimage (1,1,…)∉c₀. | Bicartesian and left-heart conditions are substantive. | Retain |
| 1.4 twist invariance and induction | Point i=0,r=0→1; formal preceding defect C/Q_p | H changes Q_p→Q_pt, F changes R→tR; X quotient U₁/tQ_p=C equals B/tB=C. Preceding zero cokernel gives zero next kernel; C/Q_p gives a nonzero next kernel. | All preceding surjectivities are necessary to the route. | Retain |
| 1.5 Stein/affinoid diagram | Point r=0; disc r=1; annulus r=1 | Point φ=p⁻¹ kernel=0, Ω⁻¹=0. Disc top H¹=O/C and bottom exact forms=dO, [T]↦dT. Annulus HK¹ has φ=p; kernel at φ=1 is 0 and dlog T survives. | Integer r−1 and p⁻ʳ normalization consistent. | Retain |
| 1.6 elementary comparison | Proper point; disc i=r=1 | Point A=0 and horizontal identities injective. Disc H→X and F→B are maps O/C→0, both onto with kernel O/C. | Both distinct bicartesian cases pass. | Retain |
| 2.1 failure bundles | Point r=0 or 1; zero HK | (φ,L)=(1,R),(p⁻¹,tR) both yield O and (h⁰,h¹)=(Q_p,0). Lattice-only twist yields O(−1),(0,C/Q_p). Zero yields (0,0). | Simultaneous twist is indispensable. | Retain |
| 2.2 kernel/cokernel | Point i=r=0; disc i=r=1; formal preceding O(−1) | Point reduced map Q_p⊕R→R has (ker,coker)=(Q_p,0); disc reduced map 0→0 has (0,0). Formal preceding H¹=C/Q_p contributes the same left kernel. | Degree and map direction correct. | Retain |
| 2.3 repaired qBC filtration | P¹ (i,r)=(0,1),(1,1); disc (1,1); point (0,0) | Graded triples (0,0,Q_p(1)),(0,0,0),(0,O/C,0),(0,0,Q_p); heights 1,0,0,1. | F06 repaired; torsion need not be finite BC. | Retain |
| 2.4 two failure terms | Point/disc; formal h¹_(i−1)=C/Q_p,h¹_i=0 | Actual sequences reduce to a diagonal kernel or identity O/C→O/C. Formal case has nonzero left kernel despite zero right cokernel. | Both defects retained in iff. | Retain |
| 2.5 signed height | Point; disc; E_r=O(−1),E_(r−1)=0; torsion away from ∞ | 1=1+0+0; 0=0+0+0; 0=1+0−1. H¹(O(−1)) has height −1. Torsion sheaf has height 0 but positive curvature. | Sign and vector-bundle restriction correct. | Retain |
| 2.6 degreewise criteria | Point r=0; disc r=1; formal E_r=O(−1) | First two defects (0,0), heights 1=1 and 0=0. Formal case height deficit −1 and adjacent syntomic positive piece C/Q_p. | Adjacent syntomic term detects right failure. | Retain |
| 2.7 all-degree equivalence | Point/disc; formal defect h¹_2=C/Q_p | Point/disc all defects 0. Formal example passes degree 0 but fails degree-2 height and degree-3 positive-piece conditions. | All-degree quantifiers retained. | Retain |
| 2.8 repaired crystalline splitting | Point r=0,1; dagger/rigid closed disc; identity complex | Eigenspace cohomology Q_p or U₁ in degree 0, higher 0. Dagger HK¹=0. Rigid ω coefficients pⁿ→0 but primitive coefficients 1 do not; ω is in the closure of exact forms. Identity complex has cohomology 0. | New realization contract separates the wrong completed model. | Retain |
| 2.9 syntomic splitting | Point; disc r=1; split R²→R | Pieces (Q_p,0,0) or (0,0,O/C), up to the displayed order. Sections y↦(0,y) and y↦(y,y) differ. | Noncanonical assertion is essential; duality gap retained. | Retain |
| 3.1 nonnegative de Rham slopes | Point, disc, countably many points | Bundles O or 0 have slopes {0} or ∅; infinite union fails finite B⁰ rank. | Predicate includes smallness. | Retain |
| 3.2 product and new Künneth input | Two annuli; point×point; empty factor | Ranks (1,2,1),1,0. φ(dlog T)=p dlog T and φ(dlog T∧dlog S)=p² times the wedge. Torsion cokernel at ∞ has H¹=0 on either route. | Multiplicative HK comparison and containment suffice. | Retain |
| 3.3 analytification | A¹,G_m,P¹,empty | Ranks (1,0),(1,1),(1,0,1),0. G_m has Newton/Hodge (1,1), algebraic bundle O; lattice enlargement preserves H¹=0. | Nonproper inputs included without algebraic/pro-étale identification. | Retain |
| 3.4 proper pairs and resolution gap | P¹ with boundary ∅,∞,P¹, doubled ∞; surface with point boundary | Complements P¹,A¹,∅,A¹ have ranks (1,0,1),(1,0),0,(1,0). Blowing up a surface point replaces codimension 2 by a divisor while preserving U. | Nowhere density after discarding components; reduction of boundary sound. | Retain |
| 3.5 discrepancy | Empty boundary; P¹ minus ∞, i=r=1 | Empty-boundary complexes are cones of identities, hence 0. A¹ has algebraic étale H¹=0, analytic pro-étale H¹=O(A¹)/C; logarithmic filtered H¹=0 and naive filtered H¹=O(A¹)/C. | Same discrepancy on both sides. | Retain |
| 3.6 semistable tubes | P¹/infinity; m=s, intersection or union | A¹ and dagger disc both H_dR=(K,0). Empty intersection removes everything, groups 0; empty union removes nothing, proper cohomology remains. | Correct coordinate and empty-set conventions. | Retain |
| 3.6 filtered negative control | f(T)=(1−πT)⁻¹ | On a disc, coefficients πⁿ converge for 1<ρ<|π|⁻¹; on A¹ the denominator at T=π⁻¹ is 0. Thus gr⁰ restriction is not onto although unfiltered H_dR=(K,0) on both. | Source overclaim correctly avoided. | Retain |
| 3.7 radius and Čech hypotheses | P¹ boundary point; smooth full intersection with a singular partial hypersurface | First complement has H_dR=(K,0) for sufficiently small tubes. A cuspidal cubic cut by a transverse line away from its cusp has smooth zero-dimensional total intersection but a partial hypersurface with tangent dimension 2 instead of 1. | Full smoothness does not replace the common Čech contract. | Retain |
| 3.7 new tube API | f=T,aT,πT; |a|=1; ε=|π| or |π|² | First two tubes {|T|≤|π|} exclude 1. Third is {|T|≤1} and includes 1. Radius |π|² includes π² but excludes π; radius |π| includes both. | Transition units and monotonicity pass. | Retain |
| 3.7 empty-extrema formula | c=0 on a nonempty chart | Defined intersection complement ∅, union complement whole chart; max/min expressions undefined. Corrected ∃ gives false and ∀ gives true. | New API needs an empty-index convention. | R02 |
| 4.1 exhaustion | Constant point/disc; finite-point exhaustion; subsequence 2n | Constant limits Q_p,R or O/C; lim¹=0. Growing points give products ∏Q_p,∏R, not direct sums. Disc F=O/C while Fbar=0. Even subsequence gives the same compatible sequences. | Global groups not defined as ordinary limits without descent. | Retain, subject to R01 |
| New Roos model and 4.2 shift | Constant Q_p[0]; constant V[−1] | Unshifted Cone(δ): H⁻¹=Q_p,H⁰=0; corrected fibre: H⁰=Q_p,H¹=0. For V[−1] the corrected nonzero group is H¹=V. | Contract and Milnor grading disagree as written. | R01 |
| 4.2 obstruction sequence | Constant O(D)/C; tail V_n=⊕_(j≥n)Q_p | Constant δ has the finite-partial-sum section, lim=O/C, lim¹=0. Tail lim=0, lim¹=∏Q_p/⊕Q_p with [(1,1,…)]≠0. Correct Milnor term is one degree later. | Obstruction cannot be suppressed generally. | Retain after R01 |
| 4.3 de Rham criterion | Disc i=r=1; point | Disc A=O/C,H/A=0; point A=0,H/A=Q_p. Constant towers have lim¹=0 for all these values; finite-BC quotients have heights 0,1. | Quotient direction and BC scope correct. | Retain after R01 |
| 4.4 proper étale Künneth | Y=point; Y=T=P¹; T=countably many points | Point tensor is identity. P¹×P¹ ranks (1,0,2,0,1). For Y=point,T infinite discrete, H⁰(T,Z_p)=∏Z_p is not perfect. | Perfection belongs only to proper Y. | Retain |
| 4.5 proper×Stein limits | Y=point or P¹, S an open disc | Proper coefficients Q_p in degree 0 and Q_p(−1) in degree 2; each lim¹ is a finite sum of zero Stein terms, hence 0. | No termwise completion isomorphism needed. | Retain after R01 |
| 4.6 pro-étale Künneth | P¹×open disc; two open discs | With V=H¹(S,Q_p), both sides give Q_p,V,Q_p(−1),V(−1). For two discs, d(TS)=S dT+T dS is not a sum of pulled-back one-variable forms. | Proper-factor formula passes; wider formula fails. | Retain |
| 4.7 global diagram | Point×disc i=r=1; P¹×disc i=r=2 | First H=F=O/C,X=B=0, exact identity. Second proper contribution has X=U₁,Fil=tR; kernel Q_pt and quotient R under the difference map. | Stable range and twists agree. | Retain after R01 |
| 5.1 differential vanishing | Disc i=1, i=0, finite L/K | [T]≠0 in O(D)/K. Each continuous G_L-map on [T]⊗C is 0; density makes the completed map 0. i=0 error term is 0. | Continuity and finite-extension quantifier retained. | Retain |
| 5.2 torsion-kernel vanishing | Point; disc i=r=1; R/t and t⁻¹R/tR | A=0 or O/C≠0, but period Hom is 0 in both. Truncation lengths 1,2 both give Galois Hom 0. | Infinite error term is not replaced by finite BC. | Retain |
| 5.3 arithmetic recovery | Point; P¹ degree 2; disc degree 1 | Point outputs Fⁿʳ,K of rank 1. Q_p(−1) dual gives φ=p⁻¹ and filtration jump −1. Disc outputs 0=dual HK¹=dual H¹_dR. | Arithmetic duals and filtration correct. | Retain |
| 5.4 geometric recovery | Constant Q_p^d, d=0,1,2; disc H¹ | Hom_TVS values B_st^d,B^d, ranks 0,1,2. Disc maps vanish; both extended dual targets are 0. | Actual functor and extended outputs used. | Retain |
| 5.5 positive crystalline refinement | Point i=0; annulus i=1; sandwich alone | Hom=B_cris⁺ or B_cris⁺e∨. Annulus Fil^(1+k)=tᵏB. Candidate t⁻¹ lies in the outer bound but not B_cris⁺. | Examples pass; separate positivity contract is indispensable. | Retain |
| 5.6 information retained | Proper constant ranks 0,1,2; Tate and good elliptic curves | Extended Hom ranks 0,1,2. Both elliptic H¹ groups have height 2, but monodromy ranks 1 and 0. | Rank does not recover omitted arithmetic operators. | Retain |

The remaining unchanged API computations in the earlier table were also compared with the present text: identity, zero and scalar-p morphisms; lattice tensor/dual; decreasing image filtrations; negative-degree zero; canonical qBC quotient maps; and cofinal exhaustion maps. None was weakened by the repairs. Every definition now has an API and at least three discriminating Check bullets, counting the four newly added tube Checks. R02 concerns one new API formula, not a missing test count.

### Pinned declarations and statability

Content main is `794d0fcddfd32a8c6bb445faa33347cc578f43b0`. The manifest pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following native declarations were opened at those pins, rather than inferred from a newer library or the citation resolver.

| Declaration, file and line | What the native definition supplies; distinguishing computation |
|---|---|
| `BDeRhamPlus`, `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`; `BDeRham`, :88 | Theta-kernel completion after inverting p, and localization at completed generators. Binders :51 require a commutative ring, prime p, p nonunit and p-adic completeness. At R=F_p the localization target is zero, theta kernel is the unit ideal, and both completions/localizations are zero. These carriers alone do not supply geometric Fontaine fields and their natural topologies. |
| `WittVector.Isocrystal`, `Mathlib/RingTheory/WittVector/Isocrystal.lean:113` | Module structure plus a Frobenius-semilinear equivalence. No finite-dimensionality, N, filtration or descent field. An infinite direct sum of unit blocks admits this structure. The README's :112 locator is the adjacent docstring end. |
| `WittVector.isocrystal_classification`, same file :180 | Requires algebraically closed characteristic-p residue field and finrank 1. The conclusion is one integer-slope standard block. It is not a rank-two classification or analytic HK construction. |
| `Module.Free`, `Mathlib/LinearAlgebra/FreeModule/Basic.lean:43`; `Module.Finite`, `Mathlib/RingTheory/Finiteness/Defs.lean:121` | Existence of a basis versus finite generation of the top submodule. The direct sum of countably many copies of a field is free but not finite. The roadmap keeps both conditions. |
| `ModuleCat`, `Mathlib/Algebra/Category/ModuleCat/Basic.lean:56,94` | Bundles a carrier, additive group and module; morphisms are linear maps. It has no topology, complete/Hausdorff condition, period action or natural-transformation datum. |
| `CategoryTheory.BicartesianSq`, `Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/BicartesianSq.lean:56` | Extends both pullback and pushout predicates. The point square has diagonal kernel Q_p and cokernel 0; changing its upper-left corner to zero breaks the pullback. Strict left-heart realization is additional supply. |
| `TauCeti.AdicSpace`, `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:243`, with `PreAdicSpace.isAdic` at :206 | Full subcategory of sheafy locally affinoid pre-adic spaces. It does not assert separatedness, tautness, smoothness, countability or a dagger structure. These cannot be omitted by choosing this carrier. |
| `TauCeti.FarguesFontaine.spaY`, `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Y.lean:116`; `frobeniusHomeomorph`, :218 | Open valuation subset where p and [ϖ] do not vanish, and Frobenius pullback homeomorphism under the stated perfect-ring/adic hypotheses. At ϖ=0 the subset is empty. These are not the coherent curve or its period-modification theory. |
| `TauCeti.FarguesFontaine.spaX`, `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.lean:56` | Topological quotient by the cyclic group generated by Frobenius, with its quotient topology. At ϖ=0 it is empty. No coherent structure sheaf, completed local-ring theorem or HK realization is supplied by this definition. |
| `CochainComplex.mappingCone`, `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57,65` | Cone degree i contains source degree i+1 and target degree i. For δ on a constant degree-zero tower it has H⁻¹=ker δ, yielding R01. |

Object searches across both pinned source trees for dagger spaces, analytic HK, semistable/crystalline period objects, sympathetic algebras, Banach–Colmez and qBC carriers found no native carriers supporting these analytic headline signatures. Generic cochains, modules, isocrystals and the geometric topological quotient do not suffice. No fully qualified declaration collision is possible in this package's empty namespace.

The README's 33 deep theorem targets, all explicitly named in the module docstring, are:

- Layer 0: cohomological acyclicity criteria (§0.4), lattice generation (§0.6), eigenspace Hom (§0.7), acyclic-kernel Hom (§0.8), truncated period reconstruction (§0.9).
- Layer 1: twist invariance/surjectivity reduction (§1.4), Stein/affinoid diagram (§1.5), proper/Stein/affinoid bicartesian comparison (§1.6).
- Layer 2: kernel/cokernel descriptions (§2.2), canonical qBC filtration (§2.3), two-defect sequence (§2.4), signed height formula (§2.5), degreewise comparison criteria (§2.6), equivalence of all-degree properties (§2.7), crystalline splitting (§2.8), syntomic decomposition (§2.9).
- Layer 3: product slopes (§3.2), algebraic analytifications (§3.3), almost proper varieties (§3.4), logarithmic/naive discrepancy (§3.5), semistable tube complements (§3.6), projective tubular complements (§3.7).
- Layer 4: inverse-limit obstruction (§4.2), de Rham lim¹ criterion (§4.3), proper-factor étale Künneth (§4.4), proper-times-Stein lim¹ vanishing (§4.5), pro-étale Künneth (§4.6), fundamental diagram (§4.7).
- Layer 5: differential error vanishing (§5.1), arithmetic torsion vanishing (§5.2), arithmetic recovery (§5.3), geometric recovery (§5.4), positive crystalline affinoid recovery (§5.5).

For Layer 0 the missing objects are the geometric coherent curve, semistable period structures and natural VS period Hom; Layers 1–3 need actual dagger/analytic cohomology and filtered/qBC realizations; Layer 4 needs analytic étale/pro-étale cohomology and its strict derived descent; Layer 5 needs those cohomologies with the stated Galois or natural TVS structure. Each docstring item identifies its particular missing carrier. None can be made statable by adding only a few simple definitions on the native carriers. The general C_st and recovery conjectures are not passed off as proved headlines; §5.6 is explanatory scope, not a missing deep theorem.

`lake env lean <absolute Suggested.lean path>` was run from the pinned content checkout, exactly as requested. It exited 0 with no output and no warnings. There is one `import Mathlib`, one module docstring and an empty namespace; no TauCeti import or targeted build was needed. There are zero named declarations and zero sorried theorems. Consequently the `#check @name` binder audit and one-tactic padding probe have zero subjects; no signature comparison or padding test was skipped on an existing declaration. An empty file is justified here by the missing real carriers, not by substituting free predicates or generic algebraic conclusions.

### Ownership, supplier contracts and order

Read-only `roadmaps list`, `roadmaps grep` and `roadmaps show` were used against the 363-head index of 2026-10-25T14:39:16Z and main. Object searches covered natural VS/TVS Hom, qBC/Pair objects, finite BC, period eigenspaces and modifications, dagger cohomology, tube invariance, crystalline/HK comparisons, Roos/Milnor limits and analytic resolution. Searches were rerun with sufficient output limits to include main and later heads. The four accessible indexed board packages were also searched in README and Lean. The package's constructions specialize the supplied finite module/curve/BC framework to embedded C-lattices and analytic cohomology; no competing owner of this complete library was found in the readable material.

These citations were resolved afresh. File lines below refer to the actual roadmap file, excluding the tool's display header.

| Supplier and reviewed revision | Resolved file/sections and boundary |
|---|---|
| AdicSpacesPartII, main | `TauCetiRoadmap/AdicSpacesPartII/README.md:2759` R0.5 completed Banach tensor; :4204,4545,4824,4990,5452,5617,5987,6681 R0.10–R0.17 morphisms/differentials/smoothness; :8427,8968,9806 R1 analytification and rigid–adic comparison. These are imported geometry, not new targets here. |
| AdicSpacesPartIV, main | `TauCetiRoadmap/AdicSpacesPartIV/README.md:4238,4515,4662` F1.7–F1.9 dagger geometry, comparison and forms; :5006 strict differentials; :5850 finiteness and :5880 Künneth; :5897 F1.12 log complexes; :6460 F1.16 tubes. Strictness uses a discretely valued base and finite-cohomology assumptions; Künneth is quasi-compact mixed-characteristic. The C extensions are genuine contracts. The semistable-stratum tube invariance at :5723 is not the horizontal-boundary complement comparison of §3.6. |
| PadicHodgeTheory, new roadmap head `4c4f1e8` | `TauCetiRoadmap/PadicHodgeTheory/README.md:134,163,192,263` §§0.2–0.5 periods, topology, t, positive crystalline and semistable embedding; :699,725,747,772 §§3.4–3.7 arithmetic coefficients/descent/fundamental complex; :1003 §5.2 Robba modification and degree sign. The horizontal generator e₁+ue₀ and dual/twist conventions agree. :607 owns `properRigidLogResolution`; :24 restricts its standing K to finite K/Q_p. The new resolution contract extends that coefficient range. |
| VectorBundlesAndIsocrystals, new roadmap head `c380d7d` | `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:224` VB0 coefficient blocks; :415 VB1 annuli; :568 tensor functor, :600 slope cohomology, :670 completed local rings, :771 HN; :1116,1126 VB2 geometric classification/Hom/Ext; :1425 sympathetic category, :1537 curvature heart, :1607 Le Bras, :1687 Euler height, :1725 period calculus, :1741 finite-length equivalence, :1751 torsion VS Hom. Finite BC and existing torsion vanishing are imported. Natural Ext/rank/TVS, reasonable Pairs/qBC and period-lattice gluing remain stated extensions. |
| LocallyAnalyticDistributions, new roadmap head `3a4526a` | `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:258` ordinary limits; :273 left hearts and strict derived categories; :285 tensors/density; :442 §0.2 finite-dimensional-ML cohomology theorem; adjacent §0.2 compact-type duality and open mapping. Its existing theorem requires Fréchet complexes, strict Roos surjectivity and finite-dimensional ML cohomology; it does not supply the new unrestricted strict-category contract. R01 fixes the latter's normalization. |
| CohomologyComparisons, new roadmap head `a99732e` | `TauCetiRoadmap/CohomologyComparisons/README.md:870` §4.8 algebraic comparison, :884 §4.9 dual Hom, :894 §4.9a analytic HK, :910,922 §§4.10–4.11 proper comparison over K/C with induced filtration. §4.9a distinguishes overconvergent models from ordinary nonproper crystalline cohomology. The new dagger crystalline complex and general TVS/filtered analytic extensions are not supplied by those proper statements. |
| ClassicalAdicEtaleCohomology, new roadmap head `dfcb6b7` | `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:278,373` §§1.3–1.4 coefficients/descent; :3891 §8.4 base change/projection; :4683 §9.7 traces. The coefficient conditions on existing base change do not give the requested integral p-adic proper-factor statement without the named extension. |
| DerivedModuleAlgebra, main; ownership comparison only | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1403,1542,1573` module/abelian-group towers, Milnor sequences and shifted-cone derived limits. These are algebraic categories, not the locally convex left heart. No duplicate strict-topological limit target or new upward dependency is needed. Its shift convention supplies a second check of R01. |
| CohomologyComparisonsPartII, new roadmap head `8858e49`; ownership comparison only | `TauCetiRoadmap/CohomologyComparisonsPartII/README.md:3–19` assigns classical rigid/log-syntomic producers and relative filtered connections. It does not duplicate this package's analytic qBC defect, slope-class and geometric TVS recovery targets. Its cochain convention at :27 likewise uses cone[−1]. No dependency on this roadmap is introduced. |

Main-branch AdicSpacesPartII and AdicSpacesPartIV were also read as house-shape references. All six layers have Examples and Dependencies; definition APIs and Checks remain in prose. The package has no own backticked declaration names requiring absent Lean counterparts.

All 16 slugs match the README and top-level plan gaps exactly, including supplier and needs text; none has supplier `none`. The following is the minimality audit, not a demand that an announced supplier contract already be implemented:

| Gap(s) | Additional obligation checked |
|---|---|
| `dagger-de-rham-finiteness-over-c` | Three explicitly enumerated C-valued finite-cohomology classes, extending AdicSpacesPartIV's discretely valued range. Point/disc ranks (1,0); infinite discrete union excluded. |
| `dagger-strictness-kunneth-over-c` | C-valued strict differentials and the finite-cohomology cup-product Künneth interface used by §§1.5,3.2. Two annuli give (1,2,1); the infinite-union tensor misses the identity matrix and is outside the requested finite range. |
| `geometric-finiteness-tubes` | The two precise horizontal-boundary/projective tube-complement comparisons over K and C, with codimension and common Čech radius. The existing vertical-stratum tube theorem is different. No equality of filtrations is requested. |
| `proper-pair-resolution-over-c` | Existing proper-pair resolution extended from finite K/Q_p to the specified countable perfect residue-field setting; the nowhere-dense boundary is retained. |
| `bounded-arithmetic-filtration` | Acyclic smooth-Galois reconstruction and bounded weakly admissible subfiltration. The supplier's admissible representation case does not already cover arbitrary acyclic modules. |
| `positive-crystalline-hom` | Positivity for the restricted natural Hom maps after completed unramified extension; the weaker t⁻ʳ sandwich is insufficient. |
| `galois-period-hom-vanishing` | Continuous vanishing over every finite L/K for the specified general K and finite period truncations; topology and twists retained. |
| `period-lattice-gluing` | Effective punctured-period/full-lattice gluing and identification with bounded simultaneous eigenspaces, beyond the supplied annular and completed-ring interfaces. |
| `qbc-pairs` | TVS, reasonable Pairs, canonical qBC filtration, density and countable BC limit vanishing, beyond finite BC. |
| `natural-period-hom` | Natural Ext¹ vanishing, rank-equals-height and VS/TVS comparison. The already supplied torsion Hom-vanishing clause has been removed. |
| `strict-countable-derived-limits` | General strict-category/left-heart countable derived limits. Correctly owned and additional to algebraic or finite-dimensional-ML results; the model requires R01. |
| `compact-extension-duality` | Continuous period-linear extension/splitting with actual coefficient hypotheses, beyond ordinary finite-K compact-type duality. It is used only by §2.9. |
| `analytic-syntomic-descent` | Model-free dagger HK, filtered B_dR⁺/syntomic complexes, cup products, topologies, stable-range period map and exhaustion descent beyond the proper rigid interface. |
| `overconvergent-crystalline-complex` | Actual dagger crystalline complex, completion map and completed-unramified comparison, not ordinary completed nonproper crystalline cohomology. |
| `geometric-log-periods` | C-valued algebraic/HK GAGA and proper logarithmic sequence with the map to the naive filtration. |
| `proper-rigid-integral-etale` | Perfect integral proper-factor complex and p-adic proper base change/realization, beyond the supplier's stated finite-coefficient ranges. |

The dependency checker was run against the unchanged README and merge order. Its complete output was:

    moved: CstConjectureForDaggerVarieties moved in the merge order from #8 to #204, right after its last supplier CohomologyComparisons (AdicSpacesPartIV, ClassicalAdicEtaleCohomology, LocallyAnalyticDistributions, PadicHodgeTheory, VectorBundlesAndIsocrystals also came after it); checked as moved (the worker moves it there when it submits)
    depcheck: 52 roadmaps, 589 edges, 0 problem(s)

There is no UPWARD or CYCLE line. The permitted move is not a finding and the order file was not edited. All consumed new roadmaps are new folders, rather than progress revisions of existing roadmaps. Existing AdicSpacesPartII/IV are cited at main. Local Needs edges follow the build: filtered modules → square → qBC defects → geometric cases → exhaustion/recovery; the crystalline/syntomic splitting branch and the positive crystalline refinement remain separate extra obligations.

The citation resolver reports no unresolved cross-roadmap citation or own Lean name. Its default external-library scan was unavailable, so that part was replaced by the direct pinned-source inspection above, not counted as resolver evidence.

## Not verifiable

All three cited mathematical texts were readable in their recorded legal caches. No new `needs-references.toml` request was needed. Journal pagination was not independently collated; the package explicitly cites the author/arXiv versions and records that boundary. No published correction of the source issues below was verified.

The board index was read before ownership claims. README and Suggested.lean requests at each of these exact indexed heads returned HTTP 404. Their contents, competing ownership and declarations could not be checked. This is not a claim that those roadmaps do not exist, and is not counted as a package defect.

| Board package | Indexed head | Outcome for both files |
|---|---|---|
| ArithmeticLocallySymmetricSpacesPartII | `c1b8f80` | HTTP 404 |
| CompletedCohomologyAndLocalGlobalCompatibilityPartII | `777a863` | HTTP 404 |
| CrystallineCohomologyPartII | `84ea77e` | HTTP 404 |
| EndoscopicTransferAndUnitaryTraceComparisonPartII | `80a66cc` | HTTP 404 |
| HigherHidaAndColemanTheory | `519048f` | HTTP 404 |
| LawrenceVenkateshMethod | `9ee7ac3` | HTTP 404 |
| OrdinaryAutomorphicFormsAndModularityLiftingPartII | `7e88c38` | HTTP 404 |
| PELModuliPartII | `d4bb48d` | HTTP 404 |
| PadicHodgeTheoryPartII | `6502997` | HTTP 404 |
| PadicLocalLanglandsForGL2QpPartII | `3e0777d` | HTTP 404 |
| RealSurfacePeriodIndex | `875bca4` | HTTP 404 |
| SchemeAndStackFoundationsPartII | `accb0a0` | HTTP 404 |
| ShimuraVarietiesPartII | `57dc0a4` | HTTP 404 |
| VStackSheavesAndLisseCategoriesPartII | `0987ba7` | HTTP 404 |
| VectorBundlesAndIsocrystalsPartII | `b58d862` | HTTP 404 |

The readable indexed board heads were AnalyticNumberTheory `310e834`, AutomorphicCongruences `08f531f`, KatoEulerSystems `0590194` and LogicAndDefinabilityInNumberTheory `888e10d`. Both files were read/searchable at each head; the object searches found no competing analytic qBC or C-lattice recovery ownership. Searches of open roadmap heads and main were also completed as described above. No unread board head is silently included in that clean ownership result.

## Source issues

These are issues encountered in the source passages opened in this round. They are distinct from package findings: the roadmap already corrects or explicitly contracts for them. The earlier review contains additional errata from other passages.

- **Misprint** in CN25 at Lemma 5.4 proof, printed p.33, CN25 line 1675: the source says unchanged filtration steps are those indexed differently from zero; it should be indices different from the selected positive index i₀; affects the proof.
- **Misprint** in CN25 at Remark 5.19, printed p.38, CN25 line 1888: the source says the same exponential gives the forward horizontal map and its reverse; it should be the inverse exponential for the reverse direction; affects a stated result.
- **Misprint** in CN25 at Proposition 5.20, printed p.38, CN25 line 1898: the source says unrestricted semistable invariants map into the positive de Rham quotient; it should be positive semistable invariants, as in the following exact sequence; affects a stated result.
- **Misprint** in CN25 at Proposition 5.20 proof, printed p.38, CN25 line 1906: the source says the weakly admissible lattice contains the original lattice; it should be contained in it; the trivial line with lattice t⁻¹R distinguishes the directions; affects the proof.
- **Misprint** in CN25 at Proposition 5.23 proof diagram, printed p.39, CN25 line 1928: the source says the left evaluation source uses tʳR/tᵏ; it should be R/tᵏ, as required by the subsequent multiplication-by-tʳ composite; affects the proof.
- **Misprint** in CN25 at Corollary 6.15, equation (6.17), printed p.43, CN25 line 2127: the source says the diagonal comparison is followed by a sum; it should be followed by a difference, whose value at (1,1) is zero; affects a stated result.
- **Misprint** in CN25 at Corollary 6.19, diagram (6.20), printed p.43, CN25 line 2137: the source says the upper corner is étale cohomology for Stein and affinoid dagger spaces; it should be pro-étale cohomology, including the nonzero disc differential contribution; affects a stated result.
- **Error** in CN25 at Theorem 8.1(c) proof, printed p.51, CN25 line 2525: the source says the logarithmic filtered cohomology group has finite B_dR⁺ length; it should be a finite free lattice, already R at the degree-zero point; affects the proof.
- **Error** in CN25 at Proposition 8.3 and its application, printed pp.51–52, CN25 line 2544 and CN25 line 2552: the source says the tube restriction is a filtered quasi-isomorphism; it should be an unfiltered quasi-isomorphism compatible with a filtration map; the affine-line/disc gr⁰ test fails; affects a stated result.
- **Gap** in CN25 at Proposition 8.4 proof, printed p.52, CN25 line 2565: the source says smooth intersection of c hypersurfaces supplies c normal disc coordinates; it should be accompanied by codimension c; a repeated hypersurface has the wrong normal dimension; affects the proof.
- **Gap** in CN25 at Proposition 8.4 union argument, printed p.52, CN25 line 2569: the source says the full-intersection comparison and Čech descent give the union result; it should be accompanied by comparisons on all required partial intersections at a common radius; affects the proof.
- **Error** in CN25 at Lemma 8.13 proof, printed p.54, CN25 line 2693: the source says cohomology over arbitrary T of the proper-factor complex is perfect; it should be the proper-factor complex itself that is perfect; infinitely many points disprove the former; affects the proof.
- **Misprint** in CN25 at Theorem 9.8 proof, printed p.57, CN25 line 2827: the source says X_C for a space already defined over C; it should be X without another base change; affects nothing.
- **Gap** in CN25 at Remark 9.9(ii), printed p.58, CN25 line 2865: the source says Frobenius-iterate de Rham positivity gives the exact positive crystalline lattice; it should be accompanied by the precise intersection criterion and compatibility with completed coefficient extension; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3a24c2b75c0ffb636546ff3fff54b6dc7c05105c", "job": "REV-PKG-CstConjectureForDaggerVarieties~2", "model": "gpt-6-astra", "worker": "chris-22"} -->
