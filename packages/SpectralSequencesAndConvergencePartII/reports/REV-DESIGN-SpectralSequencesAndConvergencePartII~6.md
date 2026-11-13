<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14773#issuecomment-6866401473 -->
Review (codex) of b088b0e

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) The base is assumed supplied without an eligible supplier or declared gaps

   **Location.** `packages/SpectralSequencesAndConvergencePartII/design/README.md:301`: “Assumed: the cited sections with the statements and hypotheses they have in the base”; supplier list at lines 277–303. `packages/SpectralSequencesAndConvergencePartII/design/plan.json:1419` names the base; line 1493 has `"gaps": []`.

   **Claim.** Twenty sections of SpectralSequencesAndConvergence are ordinary available upstream prerequisites, including the convergence results used by §1.3 and the exact-couple towers used by §6.2.

   **Witness.** `roadmaps show SpectralSequencesAndConvergence` reports “no roadmap SpectralSequencesAndConvergence on main or in an open roadmap pull request”. Its sections exist only in `packages/SpectralSequencesAndConvergence/design/README.md`; `merge-order/ORDER.txt` contains no base entry; the plan declares zero gaps.

   **Why this blocks.** A board design alone is outside the permitted supplier classes. The base's numbered passages do exist, so this is not an invented section or an unowned mathematical construction. However, treating them as unconditional supply bypasses the declared-gap mechanism. The absence of Part II itself from the merge order is explicitly permitted and is not this finding. The mechanical gate's successful result does not establish eligibility of the board-only base.

   **Exact repair.** Retain the base's ownership and its section references. Convert each independently missing base prerequisite into a precise `gap:<slug>` dependency, with the same slug in the README and the top-level plan `gaps`, naming `supplier: SpectralSequencesAndConvergence`, its section, and the exact required statement and hypotheses. Do not combine all twenty sections into an omnibus “provide convergence theory” gap or restate their constructions as Part II targets. Alternatively, ordinary citations become admissible once the base actually enters a permitted earlier supplier class; a sentence promising that it will do so is insufficient.

   For example, §1.3(a)'s finite-filtration input can be recorded as `gap:base-finite-filtered-convergence`, supplier SpectralSequencesAndConvergence, section §5.3, needs: “For a decreasingly filtered cochain complex in an abelian category, finiteness of the filtrations on the terms in degrees n−1, n and n+1 gives strong convergence in degree n, with the induced finite filtration and stabilisation at every position of that total degree.” Use narrower existing pinned or main-roadmap inputs wherever they already supply the required case.

   **Repair test.** On the stupid filtration of `ℤ →(×2) ℤ`, that contract gives `H¹ = ℤ/2`, `F¹H¹ = ℤ/2`, `F²H¹ = 0`, exactly the conclusion consumed by §1.3(a). On the supply witness, replacing its ordinary base prerequisite by this slug makes the requirement an explicit, intake-readable contract; no new owner or reverse dependency is introduced. The other unavailable base inputs need the same individual treatment before acceptance can be conditional on them.

One finding, P2; one blocking finding. The three previous findings are repaired. The remaining issue is the status of the base's supply contracts, not a counterexample to the mathematical targets. This review changes neither the design nor its sources manifest.

## Previous findings, checked first

All locations below are in `packages/SpectralSequencesAndConvergencePartII/design/README.md` unless another file is named.

| Previous finding | Repaired passage | Verification | Status |
| --- | --- | --- | --- |
| F01: omitted prerequisites | §2.3, line 704: “1.5 (finite case, for the total complex), 2.1”; §4.3, line 1119: “base §§1.3, 3.4 (for the two-column sequence)”; §6.2, line 1381: “5.2 (for multiplicativity only)” | These are exactly the assembly, degeneration/finite-filtration and pairing results used. The plan carries the same dependencies. The additional repairs to §§1.1, 2.2, 3.1 and 3.3 resolve respectively HasTotal, natural transformations of derived functors, the derived universal property, and naturality/composition hypotheses. | repaired |
| F02: graded consumer attributed to the ungraded layer | Lines 1425–1431: “are instances of 3.4 … and of 2.6 …; Layer 4 does not state them” | InverseGaloisAndArithmeticFundamentalGroupsPartII #2263, `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md:433`, requests graded, possibly noncommutative Tor through its DGAInfinity contract. Extension of scalars carries graded free modules to graded free modules. The computed specialisations below use §§3.4 and 2.6, without using Layer 4. | repaired |
| F03: finite projective horseshoe already supplied | Lines 262–269 name `TauCeti.ExactStructure.FiniteResolution.horseshoe`; §2.1, lines 623–628, distinguishes its finite object case from unbounded-length resolutions, complexes and the relative form. | Opened `TauCeti/CategoryTheory/Exact/Resolution/Horseshoe.lean:49` and `:235`, and `TauCeti/CategoryTheory/Exact/Projective.lean:218`. The fields give the middle resolution, compatible maps, degreewise splittings and the maximum length bound. | repaired |

None of the previous findings was marked “not actionable in this package”. No maintainer notes were supplied. The earlier review mentioned the base's status only under human-reviewer notes; R01 below is a new finding against the explicit supplier eligibility rule, not a re-raised settled finding.

## Verified sound

### Coverage and principles

Read all 24 targets in the six layers, their API bullets, Checks and Needs lines, the plan, manifest, previous review and repair report. The plan has 89 tests and no forward internal target dependency. Rechecked all changed passages and searched the rest for the repaired patterns: omitted proof inputs, graded versus ungraded scope, and uncited finite-resolution ownership. No further instance of those three patterns was found.

The earlier review contains computed rows for all 24 targets; its unchanged rows were used only where values were recorded. The table below records the seeded targets, the headline results, changed passages and the contract touched by R01. It recomputes the discriminating cases rather than treating successful elaboration as a truth test.

The scope is a general library of abelian-category constructions, with explicit exactness, boundedness and ring hypotheses. No restriction to selected primes, route-specific substitute, algorithm, copied source passage or second plan of an existing roadmap was found. Part II distinguishes its extensions from the base and from existing first-quadrant, finite-resolution and application-specific results. Supplier eligibility has the exception R01. There is no Lean file, sorry'd data or `set_option` in this design submission.

### Source verification

All 11 works cited in the README are recorded once in `sources.toml`: seven certified cached texts and four settled uncertified works. The manifest parses. No source entry was added, removed or rewritten. The following checks use the cached version, with printed page numbers rather than assuming PDF page indices equal printed pages.

| Seeded target | Text and locator read | Hypotheses and support |
| --- | --- | --- |
| 1.3 Convergence | stacks-012K line 3284–3291, Lemma 25.3, p. 68 | Finite antidiagonals, finite abutment filtration and the weak Serre assertion involving all bidegrees agree. The diagonal-only variant correctly requires stabilisation. Half-plane claims cite base §§5.4, 7.5; weibel1994 §5.6 remains uncertified. |
| 1.4 Comparison of totals | stacks-012K line 3293–3315, Lemma 25.4, pp. 68–69 | The source's augmentation comparison is finite-antidiagonal. The README explicitly derives its broader cases from §1.3 rather than attributing that generality to Stacks. |
| 1.5 Acyclic assembly | stacks-012K line 3354–3358, Lemma 26.1, p. 69; line 3433–3438, Lemma 26.4, p. 71 | Right resolutions use the sum total, left resolutions the product total. The source is about abelian groups; the README identifies this restriction and obtains the category-level extension from its named convergence inputs. weibel1994 Lemma 2.7.3 is uncertified. |
| 2.2 Derived functors | stacks-05QI line 2872–3011, Definition 16.2 and Lemmas 16.1–16.7, pp. 57–60 | Additivity, enough injectives, bounded below, and the additional left-exactness assumption for acyclic objects agree. The comparison with Mathlib's classical right derived functors uses the pinned resolution and unit, not a claim that Stacks states that API comparison. |
| 2.3 Cartan–Eilenberg resolutions | stacks-05QI line 3621–3654, Definition 21.1 and Lemma 21.2, pp. 72–73; line 3682–3689 | The injectivity and resolution conditions on horizontal boundaries, cycles and cohomology are present, not just injective columns. Enough injectives and boundedness are retained; the row splittings are justified. |
| 2.4 First hypercohomology sequence | stacks-05QI line 3655–3681, Lemma 21.3, pp. 73–74; grothendieck1957 line 1236–1252, p. 146, and line 1348–1354, p. 148 | First page `R^qF(K^p)`, second page horizontal cohomology, bounded-below input and finite abutment filtrations agree. Resolution independence is not confused with uniqueness of CE resolutions up to double-complex homotopy. |
| 2.6 Right exact and contravariant functors | grothendieck1957 line 1304–1308, p. 147; stacks-05QI line 3449–3478, §19, pp. 68–69 | Grothendieck announces the variants; Stacks supplies the dual resolution setting. The README spells out opposite categories and degree reversal. These passages are not claimed to contain every displayed dual formula verbatim. weibel1994 §5.7 is uncertified. |
| 3.1 Composition criterion | stacks-05QI line 3696–3717, Lemma 22.1, p. 74; grothendieck1957 line 1338–1342, Remarque 1, p. 148 | Equivalence with acyclicity on injectives, and the effacement criterion, have the stated hypotheses. The unit and Kan-extension universal property resolve the direction of the canonical map. Source proof slips are listed below. |
| 3.4 Right exact and mixed composites | weibel1994 §5.8; cartan-eilenberg1956 Ch. XVI | Texts unavailable, settled uncertified. Checked the opposite-category derivation from §§3.1–3.3 and the acyclicity counterexample in the computed table. No claim to have verified their numbering against unread text. |
| 4.1 Balancing Tor | weibel1994 Theorem 2.7.2 | Uncertified. Independently checked the double projective-resolution route against the augmentation theorem in `TauCeti/Algebra/Homology/TotalComplex.lean:596`. The hypotheses do not silently assert right exactness of tensoring with every object. |
| 4.4 Change of rings | stacks-more-algebra line 7135–7140, Example 63.2, p. 154 | Supports the Tor change-of-rings page. The Ext and mixed forms are deductions from the generic composites and the pinned adjunctions. The Tor and extension-of-scalars forms retain commutativity; coextension/Ext allows arbitrary rings. |
| 5.1 Exact-couple pairings | may-primer line 249–287, Proposition 4.1 and Corollary 4.2, pp. 6–7 | The quantifiers in Massey's condition and the derived-pairing equivalence agree, with the positive shift correctly written as m+1 for m≥0. massey1954 remains uncertified. |
| 5.2 Filtered-complex pairings | may-primer line 288–324, Example 4.3 and the filtered-complex construction, pp. 7–8 | Product filtration, pagewise Leibniz rule and compatibility of successive pages agree. The README uses the canonical limit comparison from the base; it does not infer arbitrary algebra laws from a bilinear pairing. mccleary2001 Ch. 2 is uncertified. |
| 5.3 Double-complex pairings | cartan-eilenberg1956 Ch. XV | Uncertified. Recomputed the two differential rules, total-degree Leibniz sign, flip sign and failure of associativity for a bare self-pairing. Only sum totals are asserted here, avoiding infinite convolution on product totals. |
| 6.2 Pages and higher Bocksteins | may-primer line 147–168, Example 2.3, p. 4; hatcher-at line 13330–13337, Proposition 3E.3, printed p. 305 | Higher universal-coefficient sequences agree after cohomological reindexing. Hatcher's finite-generation assumption and the three summand rules are retained. The arbitrary-f statements are proved through the exact-couple towers; they are not attributed to a source stated only for prime coefficients. |

Additional passages read and compared: total signs and products, stacks-012K line 2154–2164 and line 3400–3409; the two first pages, line 3241–3265; horseshoe, stacks-05QI line 3402–3448; the second hypercohomology sequence and acyclic variant, grothendieck1957 line 1264–1299; the complex composite sequence, stacks-05QI line 3718–3730 and grothendieck1957 line 1506–1529; universal coefficients, stacks-more-algebra line 7118–7134 and line 8115–8127; Künneth, line 7399–7422; the Bockstein construction, line 12960–13014 and may-primer line 136–150. Stacks's Künneth statement is for bounded complexes; §4.3 identifies that limitation and gives its bounded-above extension through CE resolutions and a finite-diagonal argument.

### Computed adversarial pass

Here `k = 𝔽_p`. Values on both sides are included; “none” in the last column means no mathematical repair is required by that instance. The supply qualification R01 still applies to the base-dependent rows.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: commuting squares and total sign | Unit square over ℤ; also characteristic 2 | `d(1)=(1,1)`, next maps −1,+1, so `d²(1)=−1+1=0`; unsigned total gives 2 over ℤ. In characteristic 2 both signs coincide and the sum is 0. | Correct sign, including p=2 | none |
| 1.1 totals, sum-to-product map | Staircase with diagonal entries D_p and off-diagonal O_p, p≥0 | Differential component is `y_p=x_p−(−1)^p x_{p+1}`. On finite-support sequences it is bijective: H⁰=H¹=0. On products it is onto with kernel generated by `(1,1,−1,−1,…)`: H⁰=ℤ,H¹=0. Thus the comparison induces `0→ℤ`. | Definitions distinguish sums from products | none |
| 1.2 filtration and flip | One column p=1, differential ×2 | Total differential −2; flipped total +2; flip components +1,−1 give `−2·1=(−1)·2`. Associated graded in degree n is `K^{p,n−p}` with differential `(−1)^p d₂`, exactly the shifted column. | Sign and direction agree | none |
| 1.3 finite convergence and R01's example | Horizontal ℤ →(×2) ℤ; sparse columns 0 and 100; zero complex | H¹=ℤ/2, F¹H¹=ℤ/2,F²H¹=0. With isolated entries in columns 0 and 100 all d_r=0 despite the gap; the asserted count bound is at most 3, not a claim that d₁₀₀ can jump empty columns. Zero complex: every page and abutment 0. | Finite case holds | declare its unavailable base input as in R01 |
| 1.3 weak Serre qualification | ℚ→ℚ/ℤ, class of ℚ-vector spaces | E₁ on total degree 0 is ℚ, but E₁ in position (1,0) is ℚ/ℤ and E₂ at (0,0)=H⁰=ℤ. Neither all-position membership nor stabilisation on page 1 holds. | Both stated qualifications exclude the counterexample | none |
| 1.3 half-plane convergence | Staircase; outgoing d_r from (p,n−p) | Row sequence on sum has E₁=0 and H=0; column sequence on product has E₁^{0,0}=ℤ and H⁰=ℤ. Crossed predictions ℤ for the sum and 0 for the product are false and excluded. Under the regularity criterion the outgoing target is zero once p+r≥p₁(n). | Hypotheses discriminate the totals | none |
| 1.4 comparison | Staircase projected onto column 0 | Map on column E₁ is id_ℤ. Product total H⁰ map is id_ℤ; sum total H⁰ map is `0→ℤ`. The latter lacks the required column half-plane bound. | No overclaim of quasi-isomorphism | none |
| 1.5 acyclic assembly and augmentation | Staircase; horizontal identity complex; a resolution of A | Exact rows give sum-total H=0 but product-total H⁰=ℤ, which is outside the product row hypothesis. Identity complex has kernel=cokernel=0. Augmented resolution has H⁰=A and other H=0 on both sides of `A[0]→I`. | Orientation and hypotheses correct | none |
| 2.1 horseshoe, including repaired finite ownership | `0→ℤ →(×2) ℤ→ℤ/2→0`; zero outer object; length-zero outer resolutions | Outer lengths 0,1 give middle terms ℤ²,ℤ and length 1=max(0,1). Zero outer object gives the other resolution. Projective outer objects give the split middle A⊕C, length 0. | Exactly the pinned finite horseshoe in these cases | none |
| 2.1 relative homotopy correction | Two resolutions ℚ/ℤ→2ℚ/ℤ, shear h⁰=id | Transported differential sends `(u,v)` to `(2u−2v,2v)`; `(0,1/4)` maps to `(1/2,1/2)`, versus `(0,1/2)` without the correction. The corrected maps satisfy the two prescribed endpoint equations. | A mere direct sum differential would fail | none |
| 2.2 derived/classical comparison and degree zero | F=Hom(ℤ/2,−) at ℤ; additive F=−⊗ℤ/2 at ℤ | First F: R⁰=0 and R¹=ℤ/2 on both injective-resolution definitions. Second F: its injective resolution gives R⁰F(ℤ)=0, while F(ℤ)=ℤ/2. | Left exactness is required exactly where stated | none |
| 2.3 CE definition and assembly | Resolve each term of ℤ →(×2) ℤ by ℚ→ℚ/ℤ; compare identity complex | Horizontal cokernels in both rows are 0, so these injective columns do not resolve H¹=ℤ/2. For A→id A, horizontal cohomology is 0 and boundaries/cycles are the appropriate copies of A. | Definition excludes injective-columns-only model | none |
| 2.4 first hypercohomology | Hom(ℤ/2,−), K=(ℤ →(×2) ℤ) in degrees 0,1 | E₁^{0,1}=E₁^{1,1}=ℤ/2, d₁=×2=0; abutment H¹=H²=ℤ/2, as Ext^{n−1}(ℤ/2,ℤ/2). | First page and total degrees agree | none |
| 2.5 second hypercohomology | Same K,F; identity functor on the non-CE columns above | Correct E₂^{0,1}=E₂^{1,1}=ℤ/2. Non-CE row cohomology places a sole ℤ/2 at (1,0) instead of (0,1) for F=id. | Extra CE conditions are necessary | none |
| 2.6 duals and reversal | K=(ℤ →(×2) ℤ) in degrees −1,0; F=−⊗ℤ/2 | Tensor complex has zero differential with L₀=L₁=ℤ/2. Opposite complex lies in degrees 0,1 with H⁰=op(ℤ/2),H¹=0. | Bounded-above becomes bounded-below; degrees match | none |
| 3.1 composition criterion | F=G=Hom_ℤ(ℤ/2,−), I=ℚ/ℤ | FI=ℤ/2; R¹G(FI)=ℤ/2, whereas R¹(GF)(I)=0 since I is injective. With identity functors both sides are X and the comparison is id. | Both positive and negative sides of criterion discriminate | none |
| 3.2 complex composite sequence | Coextension along ℤ/4→ℤ/2 followed by G=id; zero input | For X=ℤ/2[0], E₂^{0,q}=ℤ/2 for q≥0, other columns 0; Ext^q_{ℤ/4}(ℤ/2,ℤ/2)=ℤ/2. Zero input gives zero pages and abutment. | Finite filtration in each degree despite unbounded q | none |
| 3.3 low-degree sequence and repaired naturality inputs | Previous coextension example; identity transformations | Five-term sequence is `0→0→ℤ/2→id ℤ/2→0→ℤ/2`; images equal kernels at all required positions. Identity transformations give id on E₂ and on the abutment. | Edge direction and naturality agree | none |
| 3.4 mixed variance | F=extension ℤ→𝔽₂, G=Hom_𝔽₂(−,𝔽₂), M=𝔽₂; wrong G=Hom_ℤ(−,ℤ) | Correct E₂ has 𝔽₂ at (0,0),(0,1), giving Ext⁰_ℤ=Ext¹_ℤ=𝔽₂. Wrong G has GF=0 but Ext¹_ℤ(𝔽₂,ℤ)=𝔽₂; its required acyclicity fails. | Missing-acyclicity model excluded | none |
| Repaired graded consumer | R̄=R; R̄=k; R=k[t],M=k; K=R[0] | First case: single row Tor^R_p(k,M). Second: single column Tor^R_q(k,M). For k[t], values k in degrees 0,1 and zero above. For K=R[0], E²_{0,0}=M, all other entries 0, abutment M. | §§3.4 and 2.6 supply the generic specialisation | none |
| 4.1 Tor balance | ℤ/4 and ℤ/6 over ℤ; a field; zero ring | Kernel of ×6 on ℤ/4 is {0,2}; kernel of ×4 on ℤ/6 is {0,3}: both Tor₁=ℤ/2. Over a field higher Tor=0 on both sides. Zero ring: only zero modules, both sides 0. | Balance is not confined to prime or flat inputs | none |
| 4.1 degree-zero qualification | R=𝔽₂[x,y]/(x²,y²), X=R/(xy), U⋆V=D(DU⊗DV) | Both derived degree-zero objects for X,k have dimension 1. X⋆k=soc(X) has dimension 2. The map soc(R)=k·xy→soc(X)=k·x⊕k·y is zero; X⋆R→X⋆k is also zero. | README correctly avoids identifying Tor₀ with a non-right-exact bifunctor | none |
| 4.2 universal coefficients | K=ℤ/2[0], M=ℤ/2; unbounded direct sum of shifts; Ext on ℤ →(×2) ℤ | Derived tensor has H⁰=H⁻¹=ℤ/2; Tor₀ and Tor₁ give those two positions. For ⊕_{n∈ℤ}ℤ/2[n], each H^n of the tensor is (ℤ/2)². Contravariant Hom into ℤ gives H¹=Ext¹(ℤ/2,ℤ)=ℤ/2, Hom=0. | One-sided bounds and Ext reversal correct | none |
| 4.3 Künneth, repaired two-column input | K=L=ℤ/2[0]; k over k[ε]/ε²; bounds K≤a,L≤b | First: H⁰=H⁻¹=ℤ/2, E₂=E∞ in columns −1,0. Second: Tor_n(k,k)=k for every n≥0, so two-column collapse is not licensed. In degree n the allowable columns satisfy n−a−b≤p≤0 and summand indices q−b≤i≤a, both finite intervals. | General and hereditary cases distinguished | none |
| 4.4 change of rings | ℤ→ℤ/4, M=N=ℤ/2; identity ring map | E²_{p,q}=ℤ/2 for p≥0,q=0,1. Abutment has ℤ/2 only in degrees 0,1; consequently every d²:(p,0)→(p−2,1), p≥2, is an isomorphism. Identity base change has only q=0 and recovers Tor. | Differential direction and non-flat case correct | none |
| 5.1 Massey conditions | Filtered ℤ →(×2) ℤ; Bockstein of ℤ →(×4) ℤ with f=2 | First pairing: d(1·1)=2 but d(1)·1+1·d(1)=0, so μ₀ fails. Second: d₁=0 gives μ₀ true; μ₁ requires j(c)=1 versus 0, so fails; on the derived couple d₂(1)=1 and μ₀ fails. Thus μ₁⇔derived μ₀ is false⇔false. | Positive index shift and nonexample verified | none |
| 5.2 filtered pairings | 𝔽₂[x,y]/x², degrees 1,2, dx=y, y-adic filtration | d₁(xy^p)=y^{p+1}; homology is 𝔽₂ in degree 0, zero otherwise. Products descend and the derivation rule is satisfied, including characteristic 2. | Canonical multiplicative page construction | none |
| 5.3 double-complex signs and algebra laws | Homogeneous x of degree (p,q), y of (p′,q′); rank-two self-pairing | Multiplying the vertical rule by (−1)^{p+p′} gives coefficients (−1)^p and (−1)^{p+p′+q}, exactly the total Leibniz coefficients. Flip contributes (−1)^{pq′+p′q}. With e²=f,fe=e,ef=f²=0: (ee)e=e but e(ee)=0. | Bare pairings do not imply associativity or a unit | none |
| 6.1 Bockstein construction | ℤ →(×p) ℤ, f=p; A=ℤ×ℤ, f=(p,0), modules supported on first factor | Connecting map sends 1 to [1] and d₁(1)=1. In the second example f is a zero-divisor of A but injective on each term, and the same calculation gives d₁(1)=1. | Termwise injectivity suffices; ring nonzerodivisor not needed | none |
| 6.2 higher pages and stabilisation | ℤ →(×p^s) ℤ, s≥1, f=p; s=1,2 and p=2,3 | For r≤s, E_r⁰=E_r¹=𝔽_p; d_s(1)=1 and E_{s+1}=0. Lift u=1 has du=p^s, w=1, so β_s(1)=1. Bound max(0,s)+1=s+1 is attained. | Higher Bockstein representative is correct | none |
| 6.2 limit and convergence | ⊕_{s≥1}(ℤ →(×p^s) ℤ); ℤ→ℤ[1/p]; ℤ[0] | Direct sum: E_r⁰=⊕_{s≥r}𝔽_p≠0 for every r, E∞⁰=0=localized H⁰. Inclusion: E_r⁰=𝔽_p for every r but localized H⁰=0, and the intersection criterion is 𝔽_p≠0. ℤ[0]: E_r=𝔽_p, filtered H=ℤ[1/p] with steps p^sℤ, separated but incomplete. | Distinguishes stabilisation, weak, ordinary and strong convergence | none |
| 6.2 multiplicativity and degenerate f | ℤ[x]/x² in degree 0, f=p; f=1; f=0 under termwise injectivity | First: every page 𝔽_p[x]/x², d_r=0, matching §5.2. Unit f: M/fM=0, all pages 0, filtration constant on H[1/f]=H and separated only if H=0. f=0 injective forces M=0, so all terms 0. | No division-by-zero or unit exception is hidden | none |

### Pinned library audit

Pins read from `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Searches used the objects as well as declaration names: product totalisation, Cartan–Eilenberg conditions, Tor balance, exact-couple pairings, higher Bocksteins, injective/projective horseshoes and filtered convergence. No second native implementation of the new generic objects was found in the searched pinned homological-algebra and category-theory files.

These are the declarations opened to check the carriers, hypotheses and ownership; file paths are relative to the appropriate library root.

| Pinned file and line | Declaration or content checked | Consequence |
| --- | --- | --- |
| `Mathlib/Algebra/Homology/HomologicalBicomplex.lean:38`, `:150` | `HomologicalComplex₂`, `flip` | Iterated complexes have commuting squares; the total differential supplies the sign. |
| `Mathlib/Algebra/Homology/TotalComplex.lean:46`, `:266`, `:273`, `:349`, `:412` | `HasTotal`, `total`, `ιTotal`, `totalDesc`, `map` | Native sum total and maps; not a native product total. |
| `Mathlib/Algebra/Homology/TotalComplexSymmetry.lean:113` | `totalFlipIso` | Flip comparison is available with the signed total convention. |
| `Mathlib/Algebra/Homology/Bifunctor.lean:83`, `:124` | `mapBifunctorHomologicalComplex`, `mapBifunctor` | Native double-complex and total bifunctor inputs. |
| `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean:36`, `:51`, `:54` | `SpectralSequence`, `Hom`, `Hom.comm` | Page complexes and homology compatibility; this carrier does not itself include an abutment or convergence structure. |
| `Mathlib/Algebra/Homology/CochainComplexOpposite.lean:80`; `Mathlib/Algebra/Homology/Opposite.lean:300` | `CochainComplex.opEquivalence`, `homologyOp` | Opposite-category transport and homology, with the degree reversal used in §2.6. |
| `Mathlib/Algebra/Homology/DerivedCategory/TStructure.lean:201`; `Mathlib/Algebra/Homology/DerivedCategory/Plus.lean:142`, `:155`, `:217`, `:226`, `:280` | `Plus`, single and homology functors, isomorphism criterion, Q and its localisation instance | Bounded-below native derived category and the factorisation input in §2.5. |
| `Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean:47`, `:96`, `:107`, `:156` | Right derived functor, unit, injective-complex isomorphism and natural-transformation action | The repaired §2.2 input exists, with actual injective-complex hypotheses. |
| `Mathlib/CategoryTheory/Functor/Derived/RightDerived.lean:54` | `IsRightDerivedFunctor` | A left Kan-extension universal property, giving the comparison map used by §3.1. |
| `Mathlib/CategoryTheory/Abelian/RightDerived.lean:106`, `:110`; `Mathlib/CategoryTheory/Abelian/LeftDerived.lean:105`, `:109`, `:359` | Classical derived functors, resolution computation, degree-zero comparison | The degree-zero left-derived identification has finite-colimit/right-exactness input; it is not unconditional. |
| `Mathlib/CategoryTheory/Preadditive/Injective/Resolution.lean:43`; `Mathlib/CategoryTheory/Preadditive/Projective/Resolution.lean:41` | Resolution structures | Existing resolution carriers are reused. |
| `Mathlib/CategoryTheory/Preadditive/Injective/Basic.lean:195`, `:280` | `injective_of_adjoint`, `Adjunction.map_injective` | The exact-left-adjoint criterion for preservation of injectives is available. |
| `Mathlib/Algebra/Homology/HomotopyCategory/KInjective.lean:42`, `:134`; `Mathlib/Algebra/Homology/HomotopyCategory/KProjective.lean:42` | K-injective/projective predicates and bounded injective case | No new replacement carrier is claimed. |
| `Mathlib/Algebra/Homology/DerivedCategory/KInjective.lean:41`; `Mathlib/Algebra/Homology/DerivedCategory/DerivabilityStructureInjectives.lean:60` | `Qh_map_bijective`, `exists_quasiIso_injective` | Replacement and comparison inputs exist. |
| `Mathlib/CategoryTheory/Abelian/Injective/Resolution.lean:95`, `:170` | `desc`, `descHomotopy` | Resolution lifting and uniqueness up to homotopy are inputs, not new targets. |
| `Mathlib/CategoryTheory/Monoidal/Tor.lean:44`, `:50`, `:62` | `Tor`, `Tor'`, vanishing for projective variable | Both native one-variable derivations exist; the general balancing isomorphism remains a target. |
| `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118`; `Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:39`; `Mathlib/CategoryTheory/Abelian/Injective/Ext.lean:40` | `Ext`, both `extEquivCohomologyClass` computations | Ext balance is already supplied and correctly kept only as a Check. |
| `Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean:85`, `:399`, `:519`, `:658`, `:878` | Restriction, extension, coextension and the two adjunctions | Extension uses the commutative setting; coextension supports arbitrary rings as stated. |
| `Mathlib/CategoryTheory/Limits/Shapes/Countable.lean:61`, `:108`; `Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Basic.lean:126`; `Mathlib/CategoryTheory/Limits/HasExactLimitsOfShape.lean:47` | Countable (co)products and exactness classes | Existence of products alone is not asserted to give exact products. |
| `Mathlib/Algebra/Category/ModuleCat/AB.lean:30`, `:38` | AB5 and AB4Star instances | These use `ModuleCat.{u} R` for `R : Type u`, matching the README's universe convention. |
| `TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:304`, `:409`, `:425`; `Filtered/Naturality.lean:83`; `Filtered/FirstPage.lean:89` in the same directory | Filtration functor, sequence, first-page comparison, map and differential | Native filtered construction is cited rather than rebuilt. |
| `TauCeti/Algebra/Homology/SpectralSequence/Comparison.lean:32`; `TauCeti/Algebra/Homology/SpectralSequence/Bicomplex.lean:410`, `:442`, `:446` | Page comparison; row/column sequences and first-page identification | First-quadrant native scope is retained in the ownership statement. |
| `TauCeti/Algebra/Homology/TotalComplex.lean:580`, `:596` | `quasiIso_total_map_of_rows`, `quasiIso_totalAugmentation_of_rows` | Existing total comparisons are consumed. |
| `TauCeti/CategoryTheory/Exact/Abelian.lean:166`; `TauCeti/CategoryTheory/Exact/Injective.lean:165`, `:426`; `TauCeti/CategoryTheory/Exact/Projective.lean:218` | Abelian conflations, injectivity/projectivity comparison, one-step horseshoe | Exact-category notions agree with the abelian-category carriers used here. |
| `TauCeti/CategoryTheory/Exact/Resolution/Horseshoe.lean:49`, `:235` | `Horseshoe`, `horseshoe` | Finite projective horseshoe is the repaired existing owner. The complete-resolution horseshoe in `Exact/Resolution/Complete/Horseshoe.lean:201` has different, totally acyclic hypotheses. |
| `TauCeti/Algebra/Homology/Monoidal/KFlat/Basic.lean:89`, `:222`, `:361` | K-flat predicate, tensor preservation of quasi-isomorphisms, bounded-above flat case | Derived tensor uses existing K-flat infrastructure. |
| `TauCeti/Algebra/Homology/Monoidal/Homology/Cross.lean:153`; `TauCeti/Algebra/Homology/Monoidal/Homology/Kunneth/Sequence.lean:729`; `TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:180` | Homology cross product, Künneth short exactness, universal-coefficient exactness | Their projective/hereditary cases remain comparisons, not duplicate general targets. |

### Roadmap ownership, citations and supplier order

Read the board package index before drawing absence conclusions. Used the roadmap registry's `show` and object-based `grep` over main and open heads, and the supplied overlap facts. There is no second copy of this Part II on main, no conflicting open head of it, no dropped cited ID and no citation requiring an unnamed open revision. The supplied third closest-roadmap list is empty.

| Citation or shared object | Current location read | Ownership conclusion |
| --- | --- | --- |
| Base convergence, filtered objects and exact-couple towers | `packages/SpectralSequencesAndConvergence/design/README.md:367`, `:395`, `:446`, `:474`, `:559`, `:592`, `:628`, `:648`, `:672`, `:704`, `:823`, `:963`, `:992`, `:1013`, `:1039`, `:1083`, `:1118`, `:1142`, `:1293`, `:1363` | All twenty section identifiers resolve in the board design. That is not an eligible upstream head: R01. Part II correctly uses the canonical comparison, avoiding the arbitrary-isomorphism issue recorded in the base's review. |
| Generic bigraded exact couples | Main `TauCetiRoadmap/StableHomotopyKTheory/README.md:2618`, §7.22 | Native exact-couple/derived-couple carrier stays there; Part II adds pairings. |
| First-quadrant double complexes and derived tensor | Main `TauCetiRoadmap/DerivedModuleAlgebra/README.md:794`, §0.2; `:955`, §S.1 | Owner of derived tensor and the first-quadrant package. Part II's commuting differential convention is transported by d″=(−1)^p d₂. |
| Object composite-functor sequence | #858, `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:4871`, §D7.1 | Object case supplied there; Part II extends to complexes and adds the composition criterion and variance forms. |
| Graded Tor | #1179, `TauCetiRoadmap/ArithmeticStatisticsPartVIII/README.md:845`, §5.16 and its Tor subsection | Graded, possibly noncommutative results remain there. Part II's Layer 4 is ungraded and uses native commutative-module tensor. |
| Group hyperhomology | #1229, `TauCetiRoadmap/SchemeKTheoryOperations/README.md:2510`, §6.7, sequence at line 2548 | Application owner. #1430, `TauCetiRoadmap/K3BlochGroups/README.md:111`, cites it and owns its bounded-below shift adapter. |
| Singular Künneth | Main `TauCetiRoadmap/AlgebraicTopology/README.md:1888`, §5.1; also read scopes at #1807 and #1808 | Singular-chain application remains AlgebraicTopology's. No generic Tor-balance ownership collision found. |
| Multiplicative Serre | Main `TauCetiRoadmap/DGFloer/README.md:580`, Layer 1 item 2 | Topological Serre construction and its cup-product comparisons remain DGFloer's. |
| Sheaf Leray, Čech, local-to-global and covering sequences | Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4186`, `:4189`, `:4440`, `:4926` | Named targets in §§2.2, 2.7, 2.15 resolve and stay application-specific. |
| Coefficient change | #871, `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:2087`, ALS.1.7 | Its Tor sequence includes geometric base-change inputs and is not reassigned here. |
| Sheaf hypercohomology | #1040, `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:3797` | Bounded sheaf instance is a valid downstream application. |
| Torsion Künneth and universal coefficients | #1087, `TauCetiRoadmap/TorsionCohomologyInfrastructure/README.md:816`, `:844` | Named applications are compatible with Layer 4's general input. |
| Ext change of rings along A→A/x | #1745, `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:657` | Its proof route explicitly uses this spectral sequence; downstream description is accurate. |
| Finite projective resolutions | Main `TauCetiRoadmap/GrothendieckEulerForms/README.md:501`, §3.5 | Finite projective-resolution calculus stays there and in the pinned horseshoe; Part II does not take that ownership. |
| Čech hypercohomology | Main `TauCetiRoadmap/TopologicalSheafCohomology/README.md:164`, §1.4 | Finite-cover/bounded-below sheaf instance, not another owner of the generic construction. |
| Higher derived categories and sheaf enhancements | #2270, `TauCetiRoadmap/DerivedInfinityCategories/README.md:1`; main and #1630, `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1` | Read scopes and ownership. These own higher enhancements and sheaf infrastructure, not the generic classical results newly owned here. |

Overlap check: read SchemeKTheoryOperations, DerivedInfinityCategories, EnhancedDerivedSheaves, AlgebraicTopology (main and both listed open heads), DerivedModuleAlgebra, GrothendieckEulerForms and TopologicalSheafCohomology; owners of shared instances are SchemeKTheoryOperations §6.7 for group hyperhomology, AlgebraicTopology §5.1 for singular Künneth, DerivedModuleAlgebra §§0.2/S.1 for derived tensor/first-quadrant sequences, GrothendieckEulerForms §3.5 and pinned Tau Ceti for finite projective-resolution calculus, and TopologicalSheafCohomology §1.4 for Čech hypercohomology; no common newly owned generic construction with DerivedInfinityCategories or EnhancedDerivedSheaves.

The dependency command was run on the candidate, specified content checkout and specified order. Its complete output was:

```text
candidate: SpectralSequencesAndConvergencePartII is not in the merge order yet; checked as if placed after ArithmeticGaloisDuality (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2170 edges, 0 problem(s)
```

No UPWARD or CYCLE line. All 24 target Needs lines were compared with their statements/routes and the plan. The corrected target dependencies go to earlier targets; there is no new coarse layer cycle. R01 concerns a supplier outside the command's admitted roadmap graph, not an UPWARD/CYCLE diagnostic being suppressed. `roadmaps resolve` found no missing cross-roadmap citation or roadmap-qualified Lean name; it did not check non-roadmap library names, which were inspected at the pins as above.

### Shape, headlines and package-stage checks

The summary, scope, conventions, exact supplier contracts, reading paragraph, six mathematical layers, Examples and Dependencies endings, downstream consumers and references are present. Read DerivedModuleAlgebra, GrothendieckEulerForms and TopologicalSheafCohomology on main for the house form. There is no source-following declaration or chapter-named layer. No process narrative, pull-request number, machine path, HTML anchor, LaTeX delimiter or computational algorithm was found in the target README.

Definition/API blocks have at least three Checks: §§1.1/1.2 have 4/5; §§2.2–2.6 have 4/4/3/3/3; §§3.1/3.2 have 3/3; §§5.1/5.3 have 4/4; §6.1 has 4. Negative controls include a non-CE injective-column model, non-right-exact tensor, a pairing without algebra laws, and a non-convergent Bockstein example. Prospective names in the design plan are not presented as existing Lean declarations in the README. Backticked native names and roadmap target names were resolved to the cited owners.

Headline list from the Summary: total convergence and comparison; acyclic assembly; horseshoe and CE existence; comparison of bounded-below derived functors with classical right derived functors; the two hypercohomology sequences and their variance forms; composition criterion and composite-functor sequence with low-degree sequences; Tor balance; universal-coefficient, Künneth and change-of-rings sequences; pairings and the Leibniz rule; Bockstein pages, higher differentials, limit and convergence.

There is no `Suggested.lean` in this design. The package-stage headline/signature and padding audit therefore has no submitted declarations to probe. In particular, Tor balance and the comparison with classical right derived functors have native carriers at these pins and must not later be omitted merely because convergence carriers are pending. Other non-spectral headlines, such as the composition criterion, require a separate statability assessment when the acceptance file is written; absence of convergence carriers is not a blanket reason to omit them. No package-stage omission is being raised against this design.

Elaboration: **not available (this lane does not elaborate)**. No Lean command, one-tactic probe or `#check @name` elaboration was run. There are zero sorried theorem signatures in the submitted design, so there is no claim of a passing build or of “sorry only” warnings.

### Source independence

Compared the readable portions of twelve sampled targets and eight further passages from §§1.1, 1.2, 2.1, 2.5, 3.2, 4.2, 4.3 and 6.1 with six sources. The other three sampled targets (§§3.4, 4.1, 5.3) cite only settled uncertified texts. No copied sentence, clause-by-clause paraphrase, translated passage, figure, table or exercise list was identified. Formulae, names and the necessary quantifiers of Massey's condition are mathematical expression rather than independent prose reuse. There is no Suggested.lean docstring to compare.

Counted locators before References: stacks-05QI 15, grothendieck1957 14, stacks-012K 11, weibel1994 11, may-primer 10, stacks-more-algebra 7, cartan-eilenberg1956 5, mccleary2001 2, hatcher-at 1, massey1954 1: total 77. The largest source's contents are readable at stacks-05QI line 7–45. The correspondence is §2.1↔source §18, §2.2↔§16, §§2.3–2.5↔§21, §2.6↔§19, §§3.1–3.2↔§22, not a matching run of chapters. Layers 1, 4, 5 and 6 draw on other sources. Dependencies force the substantial build direction: §2.4 needs §§1.2–1.3; §3.2 needs §2.5; §4.4 needs Layer 3; §6.2's multiplication needs §5.2. The individual layer scopes are the constructions needed by those targets.

Source independence: 20 passages compared with 6 sources, no copied expression identified; largest share stacks-05QI, 15 of 77 locators; contents compared with stacks-05QI: independent. Wording and contents of weibel1994, mccleary2001, cartan-eilenberg1956 and massey1954 were not readable and remain untested.

## Not verifiable

- weibel1994 §§1.2, 2.2, 2.7, 5.6–5.8; mccleary2001 Chs. 2 and 10; cartan-eilenberg1956 Chs. XV–XVII; massey1954: settled uncertified texts. Their theorem numbering, printed pages, wording and full hypotheses could not be verified from the texts. They were not fetched or requested again. Independent mathematics checks do not certify an unread locator.
- The base's future admitted version and merge position cannot be certified from its board design. Present section identifiers were checked; the supply defect is R01.
- No Lean elaboration, signature-binder audit or tactic probe is available in this lane, and no Suggested.lean exists. Package-stage acceptance remains to be tested on the actual file.

## Source issues

- **Misprint** in may-primer at Proposition 4.1, printed p. 7: the source says the condition indexed n shifts to the condition indexed n−1 without restricting n; it should restrict the equivalence to n≥1; affects a stated result.
- **Misprint** in may-primer at Example 2.3, printed p. 4: the source says a free integral summand contributes an infinite cyclic group on every mod-p page; it should contribute one copy of the field with p elements; affects a stated result.
- **Misprint** in stacks-05QI at Lemma 18.4, proof, printed p. 65: the source says the residual map uses homotopy index n−1 and reverses a chain-map composition; it should use homotopy index n and composition αⁿ∘d^{n−1}; affects the proof.
- **Misprint** in stacks-05QI at Lemma 22.1, proof, printed p. 74: the source says to evaluate the transformation at the first derived functor's value on an injective; it should evaluate it at the injective object placed in degree zero; affects the proof.

## For the human reviewers

- Not tested: wording and arrangement of weibel1994, mccleary2001, cartan-eilenberg1956 and massey1954 remain unchecked because their manifest status is settled uncertified. The largest-share source, stacks-05QI, and its contents were readable and checked.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b088b0eb766c65e6c627580a510e13ab6b23ef82", "job": "REV-DESIGN-SpectralSequencesAndConvergencePartII~6", "model": "gpt-6-astra", "worker": "chris-8"} -->
