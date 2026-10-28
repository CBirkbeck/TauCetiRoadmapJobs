<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1517#issuecomment-6428753634 -->
Red team round 1 pass a (codex) of 899c252

Verdict: needs_changes

1. **F01** (P2) The extension-duality gap does not state its mathematical contract

   **Location:** `packages/CstConjectureForDaggerVarieties/README.md:104`, “with their actual coefficient-field hypotheses, or supply an alternative valid continuous period-linear splitting argument”; also `packages/CstConjectureForDaggerVarieties/design/plan.json`, gap `compact-extension-duality`.

   **Claim:** This sentence specifies the extra functional-analysis theorem needed by §2.9.

   **Witness:** Neither the sequence, its coefficient ring nor its hypotheses are specified. CN25 lines 2439–2444 use a continuous B_dR⁺-linear retraction of the finite-free cohomology inside the quotient by differential images.

   **Exact repair text:** Replace the needs sentence in both files by: “For every smooth quasi-compact dagger X/C under the standing base hypotheses, in the overconvergent de Rham complex used in §2.9, put E_q=RΓ_dR^q/im(d^{q−1}), H_q=H_dR^q(X/B_dR⁺), and Q_q=RΓ_dR^q/ker(d^q); prove that 0→H_q→E_q→Q_q→0 admits a continuous B_dR⁺-linear splitting for every q, with the actual quotient topologies, and that the induced map from the chosen complement to Q_q is a homeomorphism.” State which cochain model is used and its invariance before consuming this contract. This is one concrete input; a proof may use duality or another method.

   **Repair test:** For X a point and q=0, (H_q,E_q,Q_q)=(B_dR⁺,B_dR⁺,0); the retraction is identity. For the split two-term model R→R with zero differential, each sequence is split by identity on its nonzero cohomology. The request now fixes maps and topologies rather than allowing unspecified coefficient hypotheses to exclude the intended application.

2. **F02** (P3) Several Checks restate targets or prescribe proof behaviour

   **Location:** `packages/CstConjectureForDaggerVarieties/README.md:291`, “The identifications are the evaluation pairings and are functorial in M.” The 42 affected bullets are at line 291 and lines 154–155, 183, 211, 263, 305, 357, 385, 413, 427, 495, 540, 554, 570, 586, 602, 616, 632, 670, 684, 698, 742, 773–774, 808, 812, 827, 843, 859, 873, 887, 903, 927, 941, 955–956, 970–971, 987–988 and 1004.

   **Claim:** These bullets are discriminating mathematical Checks.

   **Witness:** Line 291 repeats §0.7's evaluation/functoriality assertion. Lines 632 and 987 prescribe a dependency/proof obligation and evaluate no mathematical input. They distinguish no intended object from a wrong one.

   **Exact repair text:** Move proof obligations and scope reminders into the adjacent prose/API; delete duplicate restatements from Checks. For §0.7 replace its Check with: “For the trivial line and r=0, X_st⁰=Q_p and evaluation identifies each period-Hom with its coefficient ring, sending 1 to 1; the zero map fails this test. For the zero module both Hom modules vanish. For the trivial line at r=1, X_st¹ is the nontrivial extension 0→Q_p·t→X_st¹→C→0, but Hom_VS(X_st¹,B_dR) still has B_dR-rank one.” Supply similarly computed instances wherever a theorem currently has only instructions as Checks.

   **Repair test:** The three replacement outputs are (rank,image of 1)=(1,1), rank 0, and rank 1 respectively. They reject the zero comparison and ordinary unrestricted C-point Hom while retaining the stated natural-Hom theorem.

3. **F03** (P1) The exhaustion argument needs a bounded-below derived category

   **Location:** `packages/CstConjectureForDaggerVarieties/README.md:102`, “countable towers of uniformly bounded complexes”, versus the unrestricted exhaustion in §4.1, lines 790–796.

   **Claim:** The named strict-derived supplier and this gap cover the analytic complexes and countable descent used in Layer 4.

   **Witness:** X=⨿_{m≥0}A^m, with A a dagger annulus and X_n=⨿_{m≤n}A^m, has H_dR^n(X_n)≠0. Amplitudes are unbounded. LocallyAnalyticDistributions §0.0, “Left hearts and strict exactness”, constructs only the bounded strict derived category.

   **Exact repair text:** Extend `gap:strict-countable-derived-limits` in both README and plan: “Construct the bounded-below strict derived category and its compatible left t-structure. For countable towers with a common lower cohomological bound, supply the Roos derived limit, the stated Milnor and six-term sequences, and the truncation compatibility τ≤i Rlim C_n ≅ τ≤i Rlim τ≤i C_n for every integer i.” Retain the existing assertions about products and R^q lim. Cite this extension in §§1.1 and 4.1. A degreewise construction from the bounded result is an acceptable proof, but its truncation compatibility and assembly must be owned. Do not impose a global dimension bound on the roadmap.

   **Repair test:** Each τ≤i RΓ_dR(X_n) has the common amplitude [0,i]; the repaired contract assembles these computations and retains the nonzero n-fold dlog class in every degree n. The original bounded contract cannot contain RΓ_dR(X), whose cohomology is nonzero in arbitrarily high degrees. CN25 lines 348–354 explicitly use bounded-below derived categories; the supplier witness is `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:287`, §0.0, “Left hearts and strict exactness”, which explicitly starts with bounded cochain complexes.

4. **F04** (P1) The cited isocrystal classification has a smaller coefficient field

   **Location:** `packages/CstConjectureForDaggerVarieties/README.md:620`, “VectorBundlesAndIsocrystals VB0, Dieudonné–Manin classification”; also the finite-isocrystal contract at line 88.

   **Claim:** VB0 supplies the decomposition of finite HK modules over the completion of Fⁿʳ for every standing K.

   **Witness:** VB0 fixes residue field F̄_q (`TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:230,300`). Take k=F_p(z)ᵖᵉʳᶠ, K=Frac W(k). Then the completed Fⁿʳ has residue k̄, of transcendence degree one; even its unit line is infinite-dimensional over W(F̄_p)[1/p].

   **Exact repair text:** “For finite Witt isocrystals over arbitrary perfect residue fields, use CrystallineCohomology §CR.4.7, ‘Slope decomposition on the existing isocrystal carrier’; apply its algebraically closed classification over W(k̄)[1/p], identified with the completion of Fⁿʳ. VectorBundlesAndIsocrystals VB0 is used only in its stated local-field coefficient specialization.” Replace the VB0 classification dependency in §2.8 by this owner, and explicitly identify the completed coefficient field and transport its Frobenius before applying the classification. Keep the completion-to-Fⁿʳ comparison supplied by the overconvergent-crystalline-complex contract.

   **Repair test:** For k=F_p(z)ᵖᵉʳᶠ the completed unit module is rank one over W(k̄)[1/p], so CR.4.7 applies and gives the slope-zero block. The same is true for k=F_p. CR.4.7's actual statement permits every perfect k and every finite dimension (`TauCetiRoadmap/CrystallineCohomology/README.md:6530`); VB0's local-field specialization does not cover the first instance. This repoints to an existing owner, rather than asking for duplicate classification.

## Verified sound

The complete README (1,034 lines) and Suggested.lean (58 lines) were read. The README has 44 numbered mathematical targets, with no separate bold target labels. All 44 were tested in the full instance ledger, retained in the scratch notes; sampled rows appear below. The 33 headline entries are marked H in that ledger. There are zero Lean declarations. Source locators verified: 44 principal target entries across three legally cached works, plus convention/contract locators. Supplier citations checked: all seven named roadmap contract groups and all 16 gap entries; 12 advertised pinned declarations were read, and all 55 supplied sibling folders were searched by object. The full Check ledger, retained in the scratch notes, accounts for all 105 bullets: 63 have computations (one has only its algebraic interpretation verified), and 42 are scope reminders, proof instructions or repeated laws identified by R02.

### Sampled adversarial instances

Notation in this audit only: R=B_dR⁺, Q=Q_p, P=Spa(C), D is the dagger disc, A a dagger annulus, U₁=(B_cris⁺)^(φ=p). “H” marks a headline listed in the Suggested.lean module docstring. Every row inherits the README's prime, mixed-characteristic complete discretely valued K, perfect countable residue field, C, separatedness, tautness, countability and natural-topology conventions. Additional hypotheses are recorded in the context column. These are explicit tests, not substitutes for proofs or certifications of the supplier gaps.

| Statement and README line | Context | Instances and computed values on both sides | Result / change | Source verified |
|---|---|---|---|---|
| 0.1 lattice pair, 129 | Finite Fⁿʳ-module, invertible semilinear φ, nilpotent N, full embedded R-lattice | Rank 0: L=0 and L[1/t]=0. Rank 1: L=t^mR, m=−1,0,1, all localize to B_dR, with distinct embedded lattices. Wrong L=0 localizes to 0≠B_dR. | Fullness and embeddedness discriminate; no new defect. | CN25 line 1798 |
| H 0.4 acyclicity criteria and bounded refinement, 215 | General pair; refinement additionally acyclic, slopes [0,r], R^d⊆L⊆t^−rR^d | Trivial M,L=t^−1R: H¹=0, period map onto, admissible sublattice R. L=tR: H¹≠0, map not onto, no admissible sublattice. Slope-one M,r=1,L=R: degree −1, no bounded admissible sublattice; L=t^−1R: degree 0, L′=L. | Acyclic hypothesis necessary and present; bounds retained. | CN25 lines 1821–1832, 1670–1677 |
| H 0.9 reconstruction modulo t^k, 309 | Acyclic bounded pair; k≥2r | r=0: kernel=cokernel=0; k=0: both modules 0. Trivial M,L=R,r=1,k=2: evaluation is multiplication by t on R/t²; kernel=tR/t², cokernel=R/t, killed by t and t² respectively. | Correct weak bounds, including total-function boundaries. | CN25 lines 1913–1946 |
| 1.1 filtered analytic cohomology, 333 | Derived completed comparisons; cohomological image filtration | P: (B⁰,Fʳ⁰,Aʳ⁰)=(R,t^rR,0), image=t^rR. D,i=r=1: (B,F,A)=(0,O(D)/C,O(D)/C); class T maps to dT≠0. Negative degrees all 0. | F and its image separated correctly; derived range R03. | CN25 lines 1954–1981, 2294–2334 |
| 1.3 fundamental square, 389 | i≥0,r≥i; square formed in left heart | P,i=r=0: diagonal Q→Q⊕R, (x,y)↦x−y; kernel={(q,q)}, cokernel=0. Sum sends (1,1) to 2≠0 at p=2 and 3. Dense diagonal c₀→c₀, a_n↦p^na_n, has zero separated cokernel but a nonzero left-heart cokernel. | Difference sign and strict interpretation necessary; no unconditional general comparison asserted. | CN25 lines 2117–2128, 2185–2245 |
| H 2.5 height formula, 558 | Small X,r≥0; strict sign only for bundle H¹ | O: 1−0=rank 1. O(−1): 0−(−1)=rank 1. D,r=1: ht H=0=dim HK¹+0+0. P,r=0: 1=1+0+0. Torsion at x≠∞ has height 0 despite positive curvature. | Strict negativity properly restricted. | CN25 lines 676–687, 878–879, 2367–2381 |
| H 2.8 crystalline splitting, 606 | Quasi-compact X,r≥dim X; completed Fⁿʳ | P,r=0: fibre(1−φ) has (H⁰,H¹)=(Q,0); r=1 gives (U₁,0). D: HK¹=0. Tate-algebra ω=Σp^nT^(p^n−1)dT has coefficients→0 but primitive coefficients 1, so ordinary completed de Rham H¹≠0. | Correct overconvergent carrier; coefficient mismatch R04. | CN25 lines 2394–2423 |
| H 2.9 syntomic splitting, 622 | Quasi-compact,r≥dim; continuous period-linear splitting needed | P at r=0: H_syn⁰=Q=0⊕Q⊕0. D,r=i=1: H_syn¹=O(D)/C=0⊕0⊕P₁. Zero complex splits into 0. | These instances agree; general continuous splitting remains conditional; R01. | CN25 lines 2424–2461 |
| H 3.4 almost proper, 702 | Smooth proper X; arbitrary closed Z | Z=∅: U=X. Z=X: U=∅, all groups 0. P¹ with boundary ∞ or its square-zero thickening: U=A¹ in both cases, dR=(1,0). Resolution only after removing components contained in Z. | Boundary generality and empty cases correct. | CN25 lines 2501–2527 |
| H 3.6 semistable tube complements, 730 | Charts T₁…T_s=π,1≤s≤m≤n; proper smooth generic fibre | m=s: empty intersection boundary is whole model, complement 0; empty union boundary is empty, complement whole generic fibre. P¹,∞: A¹→dagger disc gives dR dimensions (1,0) on both sides; gr⁰ restriction misses (1−πT)^−1. | Unfiltered comparison corrects source overclaim. | CN25 lines 2538–2556; GK04 lines 499–590 |
| H 3.7 projective tubes, 747 | Smooth codimension-c complete intersection, integral models; one sufficiently small bound | f=T,ε=\|π\|: π in,1 out. Unit a: aT same; πT gives full unit disc. ε=\|π\|²: π² in,π out. c=0: intersection complement empty, union complement whole. For f₁=T,f₂=S at (1,π), intersection complement true, union complement false. | Max/min, rescaling and empty-index conventions agree; radius uniformity conditional on gap. | CN25 lines 2557–2573; GK04 line 499; BKV22 lines 1176–1187 |
| 4.1 countable exhaustion, 788 | Specified qc increasing admissible exhaustion; each stage has 3.1 | Constant V: δ(a)_n=a_n−a_(n+1), a_n=−Σ_(k<n)b_k gives δ(a)=b; ker=diagonal V, R¹lim=0. Finite unions of points: lim R^n=∏R. X_n=⨿_(m≤n)A^m: H_dR^n≠0 for all n. | Shift and ordinary-limit assertions agree in tests; unbounded amplitude R03. | CN25 lines 2574–2622 |
| H 4.4 proper-factor étale Künneth, 847 | Y proper smooth,T arbitrary smooth; integral derived tensor | Y=P: Q⊗Hⁱ(T)=Hⁱ(T), Z_p⊗ᴸRΓ(T)=RΓ(T). Y=P¹: Hⁱ(product)=Hⁱ(T)⊕H^(i−2)(T)(−1). T=⨿P gives H⁰=∏Q, no finite-dimensionality of T. | Perfect coefficient is RΓ(Y,Z_p), not RΓ(T,Z_p). | CN25 lines 2673–2699 |
| H 4.7 proper-times-Stein square, 891 | Same Y,S;0≤i≤r; global smallness not required | Y=P,S=⨿P (strict exhaustion by finite unions): degree-zero square ∏Q→∏Q over ∏R→∏R, kernel of difference diagonal ∏Q,cokernel 0; B⁰ not finite. Empty factor gives zero square. | Correctly extends beyond smallness, not finite recovery. | CN25 lines 2713–2724 |
| H 5.3 arithmetic recovery, 945 | X/K with small nonnegative-slope X_C; all i≥0 | P,i=0: smooth Hom(Q,B_st)=Fⁿʳ, Hom_G(Q,B_dR)=K, equal to dual HK and dR. P¹,i=2: dual HK φ=p^−1 and dual Hodge jump −1. D,i=1: both target duals 0 despite H¹_proét≠0. | Correct contravariance, filtration and twist removal. | CN25 lines 2735–2745, 2772–2820 |
| H 5.5 positive crystalline affinoid refinement, 975 | Affinoid,i≥0; additional positivity input; completed coefficients | P,i=0: Hom(Q,B_cris⁺)=B_cris⁺, Fil^kB=t^kR. D,i=1: M=B=0, both Hom targets 0. For i=1, t^−1 lies in t^−1B_cris⁺ but not B_cris⁺; outer sandwich is strictly larger. | Exact positive claim remains conditional, not proved by these tests. | CN25 lines 1889–1895, 1910–1912, 2859–2875 |
| 5.6 recovery information, 992 | Smooth proper X; constant finite Q-functor | Rank d=0,1,2 gives period-Hom ranks 0,1,2. Good-reduction elliptic and Tate elliptic H¹ both rank 2, but monodromy ranks 0 and 1; free extended modules alone forget that distinction. | Does not state an impossibility theorem for enriched sheaves. | CN25 lines 2856–2858, 2870–2872 |


### Lean declaration ledger

| File range | Declarations | Section variables / instances | Computation and outcome |
|---|---:|---|---|
| Suggested.lean, all 58 lines | 0 | No variable, include, definition, instance or theorem blocks | 33 docstring headlines correspond to the 33 H rows in the full instance ledger; 0 actual signatures, 0 dropped hypotheses, 0 one-tactic padding declarations. The namespace is empty. No elaboration is needed or run. |

### Sampled README Checks

| README line / section | Computed result or reason the bullet is not a test | Disposition |
|---|---|---|
| 35 / Conventions | Rank two: Nφ(e₁)=pe₀=pφN(e₁); N(e₁+ue₀)=0, N(e₁−ue₀)=2e₀, nonzero also over Q₂. | Values agree. |
| 38 / Conventions | Identity two-term differential: (H⁰,H¹)=(0,0); zero differential: (K,K). K[−1] lives in degree 1; K[1] in degree −1. | Values agree. |
| 39 / Conventions | BC dimensions/heights: R/t has (1,0), Q has (0,1); height 0 versus 1. | Values agree. |
| 41 / Conventions | S₃: gh(e₁)=e₂,hg(e₁)=e₃; contragredient gh(e₁∨)=e₂∨. The cyclic transposition has square identity. | Values agree. |
| 42 / Conventions | p=2,π²=2: u=2u_π,N(u_π)=−1/2,N(u)=−1. p=3 unramified: N(u)=−1. | Values agree. |
| 291 / 0.7 | No instantiated input or output: scope/proof reminder or a repeated defining law, rather than a discriminating Check. | R02: move to prose or replace with a computed test. |
| 408 / 1.3 | Same square: (c−d)(1,1)=0, (c+d)(1,1)=2≠0. | Values agree. |
| 409 / 1.3 | T:c₀→c₀,T(a)_n=p^na_n: e_n has norm 1 but T(e_n) norm p^−n; range dense proper, separated cokernel 0, left-heart cokernel nonzero. | Values agree. |
| 534 / 2.3 | (i,r)=(0,1): h⁰₀=Qt, rank/height 1; (1,1): h⁰₁=0. Substituting r for i changes 1 to 0 in the first case. | Values agree. |
| 618 / 2.8 | ω coefficient p^n→0, primitive coefficient 1 does not→0; no analytic primitive on closed rigid unit disc. Dagger HK¹=0, whereas the ordinary completed realization has nonzero nonclosed-image H¹. | Values agree. |
| 743 / 3.6 | f=(1−πT)^−1 converges for radius 1<ρ<\|π\|^−1; pole at T=π^−1 prevents extension to A¹. gr⁰ restriction not onto, although both unfiltered dR dimensions=(1,0). | Values agree. |
| 766 / 3.7 | ε=\|π\|²: π² inside and π outside; ε=\|π\|: both inside. | Values agree. |
| 767 / 3.7 | c=0: empty intersection=whole chart, complement ∅; empty union=∅, complement whole chart. | Values agree. |
| 806 / 4.1 | a₀=0,a_n=−Σ_(k<n)b_k gives a_n−a_(n+1)=b_n. Kernel diagonal Q,H⁰=Q,H¹=0; unshifted cone instead H^(−1)=Q. V in degree 1 gives H¹=V. | Values agree. |
| 829 / 4.2 | Underlying algebraic tail tower: lim=0 and coker δ=∏Q/⊕Q; class of all ones is nonzero. A topology on each direct sum is not specified; the asserted left-heart/topological identification is not certified. | Algebraic value only; see Not verifiable. |
| 987 / 5.5 | No instantiated input or output: scope/proof reminder or a repeated defining law, rather than a discriminating Check. | R02: move to prose or replace with a computed test. |


### Conventions, pins, ownership and dependency audit

| Convention / imported carrier | Computed positive and negative controls | Outcome |
|---|---|---|
| Base field and permitted primes | K=Q₂(√2) has e=2 and p≠0; Q₃ has e=1. k=F₂ and k=F_p(z)ᵖᵉʳᶠ are both perfect countable; the second has transcendence degree 1. | Both residue-field cases are permitted; R04 detects the smaller supplier domain. |
| Excluded coefficient/space inputs | In characteristic p, p=0 and p^−1 cannot be the intended eigenvalue; the zero ring has 0=1 and cannot be K. C[ε]/ε² is nonreduced and not smooth; a doubled boundary has the same open complement. | These are excluded by explicit hypotheses, not silently granted comparison. q=1 is not a residue-field cardinality here. Inseparable finite extensions of characteristic-zero K do not occur. |
| VS/TVS versus pointwise Hom | Natural Hom_VS(C,B_dR)=0; a bare Q-linear map C→B_dR can send 1 to 1 after extending a Q-basis. | Natural transformations eliminate this wrong model. Fixed universes do not change this distinction. |
| Reasonable torsion Pairs and qBC | [0→C] gives C, height 0; [C→C] with identity is 0. H¹(O(−1))⊕C⊕Q has height −1+0+1=0 but is not zero. | Height is signed and is not a dimension or a zero-object test. |
| Left heart versus separated quotient | T:c₀→c₀ with T(e_n)=p^ne_n has dense proper image and discontinuous inverse on its image; separated cokernel=0, left-heart cokernel≠0. | Nonclassical cohomology cannot be discarded. |
| Full lattices and tensor signs | L=tR gives dual t^−1R, product lattice R. In degree (1,1), switching dlogT and dlogS negates the product; 2≠0 even at p=2. | Embedded lattices, duality and cohomological signs agree. |

Twelve advertised pinned declarations were located and read at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`:

| Pinned declaration(s) | Repository file / line | What the native definition supplies, and what it does not |
|---|---|---|
| BDeRhamPlus, BDeRham | `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`, `:88` | Adic completion and localization for a commutative, p-adically complete R with p nonunit. For R=F_p, inverting p kills the theta target and completion along its unit kernel is zero. These definitions alone are not a nonzero geometric period field with all required structures. |
| WittVector.Isocrystal, WittVector.isocrystal_classification | `Mathlib/RingTheory/WittVector/Isocrystal.lean:113`, `:180` | Invertible Frobenius-semilinear module; no finiteness, N or filtration field. The theorem assumes algebraically closed residue and finrank=1. A two-dimensional direct sum does not satisfy that theorem's dimension hypothesis. |
| Module.Free | `Mathlib/LinearAlgebra/FreeModule/Basic.lean:43` | Existence of a basis, with no finite-cardinality condition. ⊕_N Z is free but not finite. |
| Module.Finite | `Mathlib/RingTheory/Finiteness/Defs.lean:121` | Finite generation of the top submodule, with no basis or topology. Z/2 is finite over Z but not free; the zero module is both. |
| ModuleCat | `Mathlib/Algebra/Category/ModuleCat/Basic.lean:56` | Bundled algebraic modules and linear maps; no Hausdorffness, locally convex topology or analytic cohomology. |
| CategoryTheory.BicartesianSq | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/BicartesianSq.lean:56` | Both pullback and pushout. The diagonal/difference square of the point satisfies both; strict-topology content still needs the supplied left heart. |
| TauCeti.AdicSpace | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:243` | Full subcategory of sheafy locally affinoid pre-adic spaces, in the next universe. No native dagger cohomology package. |
| TauCeti.FarguesFontaine.spaY, frobeniusHomeomorph | `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Y.lean:116`, `:218` | Open valuation-spectrum subset and Frobenius homeomorphism under perfect-characteristic-p and adic-topology hypotheses. Neither defines coherent modified bundles. |
| TauCeti.FarguesFontaine.spaX | `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.lean:56` | Frobenius-orbit quotient with quotient topology; not the coherent curve and its bundle-cohomology realization. |

Object searches of both pins found no dagger/HK, sympathetic-algebra BC/TVS or geometric semistable-period carriers that would make one of the 33 headlines statable with only simple definitions. Generic complexes, algebraic modules or a categorical bicartesian predicate would be stand-ins. No missing headline or padding finding is raised. There are no Lean declaration names to collide with a sibling, and no section-instance leakage to test by elaboration.

The seven cited roadmap supplier groups were resolved at their current available versions. Main copies were used for AdicSpacesPartII and AdicSpacesPartIV; current new-roadmap heads obtained through the roadmap tool were used for the other five. Individual section/target anchors were read; the table groups repeated citations to the same owner.

| Supplier citation group | Resolved targets and hypothesis audit |
|---|---|
| AdicSpacesPartII R0.5, R0.10–R0.17, R1 | Completed tensors, properness/smoothness/differentials, analytification and rigid–adic comparison exist on main. The completed tensor needs completeness and separation; no C-valued dagger finiteness was inferred. |
| AdicSpacesPartIV F1.7–F1.12,F1.16 | Dagger spaces, completions, differential complexes, finiteness, log forms and tubes exist on main. F1.9's strictness and F1.11's finiteness/Künneth range is restricted; the three C-valued contracts cover the missing range. |
| PadicHodgeTheory §§0.1–0.5,2.7,3.4–3.7,5.2 | Period structures, properRigidLogResolution, filtered modules and fundamental complexes exist. The log-resolution standing C is finite-K; the declared extension is necessary. §3.4 uses filtered degree t_N−t_H and destabilizing degree t_H−t_N; the roadmap distinguishes them. |
| VectorBundlesAndIsocrystals VB0–VB3 | Named bundle, completed-local-ring, HN, finite-BC, Euler-height and torsion-Hom headings exist. VB0's coefficient restriction is R04. At λ=−1, H¹ height −1 agrees; torsion away from ∞ can have height 0 and positive curvature, as stated. |
| LocallyAnalyticDistributions §§0.0–0.2 | Strict categories/left hearts, tensors, compact-type duality and restricted countable-limit results exist. Bounded cochain complexes at §0.0 do not give the bounded-below category needed here: R03. The extension-duality gap's requested output is R01. |
| CohomologyComparisons §§4.8,4.9,4.9a,4.10–4.11 | Algebraic comparison, dual description, analytic HK and proper rigid comparison exist. The exact dagger and log extensions are declared gaps; ordinary proper comparison is not replanned here. |
| ClassicalAdicEtaleCohomology §§1.3–1.4,8.4,9.7 | Analytic sites/coefficient comparison, proper base change/projection and proper traces exist. §8.4's quoted base-change coefficient range does not alone provide the integral p-adic proper-factor input; the declared gap does. |
| Additional repair owner: CrystallineCohomology §CR.4.7 | The target at `TauCetiRoadmap/CrystallineCohomology/README.md:6530` gives arbitrary perfect-residue Witt slope decomposition and arbitrary algebraically closed-residue finite-rank block classification. It precedes VectorBundlesAndIsocrystals in the merge order. |

Ownership was searched by object through `roadmaps grep`, main active/completed roadmaps, board packages and all 55 specifically supplied sibling folders. Relevant nearby work was read at the supplied heads: AdmissiblePairsAndPadicHodgeStructures uses bilattices and group-valued admissible pairs, rather than the unrestricted C-lattice (φ,N) comparison package; CohomologyComparisonsPartII §§5.1–5.3 has proper log-HK/classical syntomic adapters, not model-free analytic dagger complexes; ClassicalAdicEtaleCohomologyPartII's proper integral duality does not supply all the stated general-C projection/coefficient contract. PadicHodgeRegulators consumes classical syntomic interfaces. The generic period/gluing/BC owners remain the named suppliers. Cst's own targets concern the embedded C-lattice modification, its period-Hom calculations and analytic comparison/recovery consequences; no duplicate construction was established. No ownership claim is made about open heads unavailable through the provided copies/tool index.

All 16 gap slugs occur in both the README and the plan's top-level gaps list, with matching supplier and needs text. No supplier is `none`. Their absence as completed supplier theorems is not treated as a finding.

The read-only dependency gate returned:

```text
moved: CstConjectureForDaggerVarieties moved in the merge order from #8 to #204, right after its last supplier CohomologyComparisons (AdicSpacesPartIV, ClassicalAdicEtaleCohomology, LocallyAnalyticDistributions, PadicHodgeTheory, VectorBundlesAndIsocrystals also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 56 roadmaps, 647 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The permitted `moved:` result is not a defect. Internal theorem prerequisites proceed from Layers 0–2 to comparison classes and then limits/recovery; the splitting branch is not an input to the geometric comparison endpoints. R03 and R04 identify inputs not covered at the stated generality even though the graph itself passes.

The diff contains eight files, all under `packages/CstConjectureForDaggerVarieties/` (1,811 insertions, 134 deletions). README/docstrings contain no pull-request numbers or workflow narration. Suggested.lean uses exactly `import Mathlib`, the specified namespace and one module docstring; no set_option, lemma, admitted data, placeholder proposition, catalogue of theorem stubs or algorithm occurs. All three cited works have one manifest key and legal cached text. The 44 principal target-locator entries were checked, with additional convention/contract locators and all three reference versions; the source ledger below separates source errors already avoided by the package from package findings.

## Not verifiable

- Completion of the 16 declared supplier contracts is conditional. This review checks their declarations, hypotheses, examples and ownership; it does not assert proofs of them. R01 concerns the precision of one contract; R03 concerns an uncovered derived-category range. No finding is based merely on an announced gap being absent from today's supplier.
- In particular, the general continuous period-linear splitting in §2.9 and the exact positive crystalline equality in §5.5 are not certified by the source's abbreviated arguments. The package explicitly isolates both. The elementary instances in the ledger are not proofs of either refinement.
- The tail-tower Check at README line 829 has the displayed algebraic lim and R¹lim values. Its identification as a topological/left-heart quotient is not certified here: the direct-sum topology and quotient realization are not specified in that Check.
- No Lean command was run. Suggested.lean has zero declarations, so the requested per-declaration elaborated-signature comparison has zero cases. This pass makes no compilation claim.
- The CN25 journal pagination/version and any later published erratum were not collated; verification uses the explicitly cited author manuscript. GK04 and BKV22 use the recorded arXiv versions. No cited text was unavailable, and no new reference request was needed.
- The unrestricted smooth-dagger C_st and period-recovery conjectures remain unproved here, as they do in the package. Ownership searches cover main, the board, the supplied 55 sibling folders and the available roadmap-tool index, not inaccessible or future work.

## Source issues

These concern the versions identified in sources.toml. Published corrections were not established in this pass.

- **Misprint** in CN25 at Lemma 3.16 proof, printed page 17, CN25 line 791: the source says the final rank comparison gives h<d; it should be h>d, agreeing with the lemma and the preceding reduction; affects the proof.
- **Error** in CN25 at §3.2.6(2), printed page 17, CN25 line 798: the source says Hom between stable bundles equals sections of the slope-difference block without multiplicity; it should be the corresponding direct sum with multiplicity h₁h₂/h_(λ₂−λ₁); affects a stated result.
- **Misprint** in CN25 at §5.1.2, printed page 32, CN25 lines 1633 and 1638: the source says the degree used for nonnegative acyclic slopes is t_N−t_H; it should be t_H−t_N in that slope convention; affects a stated result.
- **Misprint** in CN25 at Lemma 5.4 proof, printed page 33, CN25 line 1675: the source says filtration steps other than zero remain unchanged after modifying step i₀; it should be steps other than i₀ remain unchanged; affects the proof.
- **Misprint** in CN25 at §5.2.1, printed page 34, CN25 line 1718: the source says D_st* is a Frobenius–monodromy module over K; it should be over F, with its de Rham realization over K; affects a stated result.
- **Misprint** in CN25 at Example 5.11, printed page 35, CN25 line 1778: the source says smooth Galois period Hom of X_stʳ is M∨ with unchanged Frobenius; it should be M∨{r}, as in Corollary 5.10; affects a stated result.
- **Misprint** in CN25 at Proposition 5.20 statement, printed page 38, CN25 line 1898: the source says the bounded kernel is taken from the unrestricted B_st eigenspace; it should be taken from the B_st⁺ eigenspace so the positive quotient map is defined; affects a stated result.
- **Misprint** in CN25 at Proposition 5.20 proof, printed page 38, CN25 line 1906: the source says the weakly admissible lattice contains the original acyclic lattice; it should be contained in the original lattice; affects the proof.
- **Misprint** in CN25 at Proposition 5.23 proof diagram, printed page 39, CN25 line 1928: the source says the upper-left source already has a tʳ factor in its quotient coefficients; it should be M∨⊗(B_dR⁺/tᵏ), with multiplication by tʳ belonging to the composite; affects the proof.
- **Misprint** in CN25 at Remark 6.13(i), printed page 42, CN25 line 2089: the source says the proper comparison modification uses unfiltered B_dR⁺ cohomology as lattice; it should be the F⁰ lattice of localized cohomology, as in the preceding proof; affects a stated result.
- **Misprint** in CN25 at Corollary 6.15, equation (6.17), printed page 43, CN25 line 2127: the source says the last arrow adds the two comparison maps after a positive diagonal first arrow; it should be their difference, so the composite is zero; affects a stated result.
- **Misprint** in CN25 at Corollary 6.19, equation (6.20), printed page 43, CN25 line 2137: the source says the upper-left Stein/affinoid group is étale cohomology; it should be pro-étale cohomology, as in Theorem 6.14; affects a stated result.
- **Misprint** in CN25 at Lemma 7.13 proof and Remark 7.14, printed page 49, CN25 lines 2415–2423: the source says the cocycle uses an unlifted basis vector, and the block and unramified-degree indices vary incorrectly; it should be the Frobenius sum of the cocycle lift, indexed by j∈J_i, with unramified degree h_j; affects the proof.
- **Gap** in CN25 at Proposition 7.15 proof, printed page 49, CN25 lines 2439–2444: the source says compact-type reflexivity provides extending continuous B_dR⁺-linear forms and a continuous splitting; it should be justified for these period-module extensions, including their actual coefficient ring and topologies; affects the proof.
- **Misprint** in CN25 at Theorem 8.1(c) proof, printed page 51, CN25 line 2525: the source says filtered logarithmic cohomology is a finite-length B_dR⁺-module; it should be finite free of finite rank; even the degree-zero point gives B_dR⁺, of infinite length; affects the proof.
- **Error** in CN25 at Proposition 8.3 and its follow-up, printed pages 51–52, CN25 lines 2544 and 2552: the source says restriction to a tube complement is a filtered quasi-isomorphism; it should be an unfiltered comparison with a natural inclusion of induced lattices, not equivalence of naive filtered complexes; affects a stated result.
- **Misprint** in CN25 at equation (8.7) and Remark 8.9(iii), printed pages 52–53, CN25 lines 2595 and 2615: the source says the global sequence retains a stage index n and takes limits of equation (6.11); it should be global F with no n, and limits of the stagewise equation (8.8); affects the proof.
- **Error** in CN25 at Lemma 8.13 proof, printed page 54, CN25 line 2693: the source says cohomology on the arbitrary second factor with proper-factor coefficients is perfect; it should be the proper-factor coefficient complex RΓ_ét(Y,Z_p) that is perfect; affects the proof.
- **Misprint** in CN25 at Theorem 9.8 proof, printed page 57, CN25 lines 2824–2828: the source says the general input is a Topological Pair and base-changes the already geometric X to C; it should be a Topological Vector Space and use X directly; affects the proof.
- **Gap** in CN25 at Remark 9.9(ii), printed page 58, CN25 lines 2864–2865: the source says forward-Frobenius positivity gives the exact positive crystalline Hom equality; it should be justified for the restricted natural Hom maps, distinguishing positive crystalline and maximal period rings; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "899c25246436514e95f3b9129b96f93cdb0e5294", "job": "RT-CstConjectureForDaggerVarieties~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
