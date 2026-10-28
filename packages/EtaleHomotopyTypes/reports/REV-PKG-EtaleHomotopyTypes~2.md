<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1304#issuecomment-6396969891 -->
Review (codex) of f0dd15c

Verdict: needs_changes

1. **F01** (P2) The simplicial-model gap duplicates an existing owner

   **Location:** packages/EtaleHomotopyTypes/README.md:93 and packages/EtaleHomotopyTypes/design/plan.json, gap kan-quillen-simplicial. The request begins: “Prove the simplicial model axiom for the §G2.1 mapping objects”.

   **Claim:** GeneralizedCohomology must add a missing compatibility theorem for the Cartesian Kan–Quillen mapping objects.

   **Witness:** TauCetiRoadmap/BordismFormalGroups/README.md:1571–1574 already requires the Cartesian Kan–Quillen monoidal model axiom. Tensor–Hom adjunction turns its pushout-product lifting property into precisely this mapping-space axiom.

   **Exact repair:** Delete this gap from the README and the plan’s top-level gaps list. Extend the existing BordismFormalGroups §F6.5 contract to import its fixed-base monoidal model axiom, alongside GeneralizedCohomology §G2.1’s mapping objects. Replace every use of gap:kan-quillen-simplicial by those supplied inputs. State the tensor–Hom adjunction specialization in the consuming proof route. Keep the separate properness gap.

   **Test of repair:** For i:∂Δ¹→Δ¹ and p:BC₂→*, the induced map is (BC₂)^Δ¹→(BC₂)²; the loop fiber has two components. Lifting against a horn is adjoint to lifting p against the pushout product of i with that horn, a trivial cofibration by the supplied axiom. Replacing i by an endpoint inclusion gives evaluation with contractible fibers. The imported axiom gives both required conclusions without a second supplier target.

2. **F02** (P2) The compactification contract drops quasi-projectivity

   **Location:** packages/EtaleHomotopyTypes/README.md:139, repeated in §3.9a at lines 592 and 600: “projective SNC compactification for finite-type schemes over a field”.

   **Claim:** ResolutionOfSingularitiesCharacteristicZero §§5.1–5.2 and 6.1–6.2 supply a projective compactification route for the full finite-type range needed by the characteristic-zero product theorem.

   **Witness:** TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:760,772 requires quasi-projectivity. The smooth affine line with doubled origin is finite-type but cannot embed openly in a separated projective scheme.

   **Exact repair:** State the supplier’s actual scopes: §6.1 is reduced quasi-projective projective closure; §6.2 is smooth quasi-projective SNC compactification. Remove the inference that arbitrary finite-type schemes admit projective compactifications. For the general input in §3.9a, cite the supplier’s §5.5 local-isomorphism-compatible resolution of arbitrary reduced finite-type schemes, together with the principalization/boundary refinements actually used. Make the deduction of the strong-desingularizability premise of SGA1 XIII Proposition 4.6(a) an explicit target of that proof route, with its full finite-type scope. Update the contract and Needs line accordingly. Do not restrict §3.9a or §3.9c to quasi-projective varieties.

   The distinction is substantive: SGA1 line 12286 requires strong desingularizability of finite-type schemes over the algebraic closure, not just of the particular two product factors. The supplier’s general-resolution statement is at §5.5, line 720; it expressly does not infer projectivity.

   **Test of repair:** On the doubled-origin line, the general smooth resolution can be the identity; no projective open embedding is asserted. On Gₘ, §6.2 still gives ℙ¹ with boundary {0,∞}. Thus the repair preserves the valid quasi-projective example and removes the false general compactification claim while retaining the general product theorem.

3. **F03** (P3) The stabilizer theorem’s page range misses its statement

   **Location:** packages/EtaleHomotopyTypes/README.md:455: “Theorem A.13(b), pp. 861–862”.

   **Claim:** Those printed pages locate the relative stabilizer quotient theorem.

   **Witness:** SS line 1743 starts A.13(b) on printed page 860; SS lines 1755–1786 place its proof on page 861. Page 862 concerns classifying spaces.

   **Exact repair:** Replace the page range by “pp. 860–861”; keep SS line 1743. The mathematics is unchanged. For BC₃→BS₃ over BC₂, the stabilizer preimage is S₃: its three nontrivial homomorphisms form one orbit and the zero homomorphism another, giving the asserted two unpointed classes.

Three findings: two P2 blockers and one P3 locator correction. The end theorems need not be narrowed. The blockers concern duplicated ownership of a supplier axiom and an overstated resolution/compactification contract. The author’s four package files were left unchanged.

## Verified sound

The complete 985-line README, all 58 numbered target subsections, all 28 Checks blocks, Suggested.lean, metadata.toml, sources.toml and the top-level gap list were read. The previous review and repair report were checked finding by finding. The earlier review’s computed rows were used only for unchanged material; changed constructions, new supplier contracts and every seeded target were examined again. The computations below record the principal tests, rather than treating successful Lean elaboration as evidence of truth.

### Previous findings

“Repaired” below concerns the original defect. New defects discovered by looking for the same pattern are separately numbered above.

| Previous finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01, unowned G1–G7 | Repaired | README:53: “What AdicSpacesPartII must provide (gap:pro-universe-extension)”. All 24 surviving gaps have named suppliers and matching plan entries; G1–G7 are absent from the editable gaps list. §§0.3, 2.3, 3.4–3.5, 3.8 and 6.9 own the formerly displaced constructions. |
| F02, input theorem in acceptance file | Repaired | Suggested.lean:7: “None is statable at these pins: each requires one of the missing carriers listed below.” finiteAbelianHigherLimits is absent; §2.2 retains the mathematical theorem. |
| F03, rebuilt ordinary completion | Repaired | README:473: “define its profinite completion Ĝ as lim_i”. The factors are native ProfiniteGrp.profiniteCompletion objects, and targets use native finite-quotient presentations. The ×2 tower computation below distinguishes this additional pro-group theorem from ordinary completion. |
| F04, redundant foundational requests | Partly repaired | README:89: “Section G2.1 supplies the unpointed Kan–Quillen model”. Abelian derived functors, direct local coefficients and smooth charts now import their actual owners. The remaining simplicial-axiom request duplicates a different main-roadmap owner: R01. |
| F05, compound/vague contracts | Repaired | README:123: “Section 2.15 supplies continuity of abelian sheaf cohomology for qcqs inverse systems with affine transitions and compatible coefficient sheaves.” The 24 individual gap sentences have exact matching records. Generic rectification is imported at line 97; the elementary-fibration request is a carrier, not an existence theorem. |
| F06, garbled object names | Repaired | README:225: “A pro-covering is a pro-morphism isomorphic to a levelwise simplicial covering”. The definition, pullback construction, §§3.6–3.7 and §6.3 now refer to their actual objects. |
| F07, incorrect text/declaration locators | Repaired | README:493 identifies “IEt line 599”; §3.4 separates IEt lines 271 and 331; §3.5 separates SS lines 228 and 373. The named pin locations were opened. The additional sampled page-range defect is R03. |
| F08, scheme generality attributed to a variety theorem | Repaired | README:604: “the extension to the stated noetherian schemes is a target here”. SS’s narrower variety statement is distinguished from the proposed general proof using the pro-universal cover. AM remains explicitly uncertified. |
| F09, bundled product/effacement dependencies | Repaired | README:590,602,618 now has “Finite étale product formula”, “Finite effacement and profinite detection”, and “Products of raw K(π,1) varieties”. Each has one Needs line. The new audit of the first route gives R02. |
| F10, irrelevant arithmetic Check | Repaired | README:669: “an open subgroup of index 2, and is not surjective”. The ℚ(i)/ℚ example now tests the claimed arithmetic image; the torus product example lives in §3.9a. |
| F11, needless reindexing for finite fibers | Repaired | README:39: “Neither needs surjective transitions or a directed-preorder presentation”. Mathlib’s two cofiltered-category compactness theorems supply §2.2 directly. General rigid refinements are not asserted to have finite fibers. |
| F12, injective resolutions treated as data | Repaired | README:370: “assume injective resolutions exist”. The pinned class is Prop-valued; additivity and limit existence are retained. The positive-degree assertion excludes degree zero. |
| F13, ambiguous degreewise finiteness | Repaired | README:900: “finite-dimensional for every cohomological degree m”. This concerns the entire simplicial object or a specified simplicial grade, as in §6.8, rather than each scheme level separately. |
| F14, unstated analytic hypercover theorem | Repaired | README:803 allows “arbitrary locally finite-type pieces”. §5.2 has this analytic domain; §5.3b states the augmented descent theorem and §6.7 applies it in each simplicial degree. Infinite pieces and degree-zero coverage have explicit controls. |

No finding was marked “not actionable in this package” in the repair report, so no settled finding is being reopened. Frozen design annotations outside the authorized top-level gaps list were not mistaken for new package contracts.

### Principles and shape

The package retains all primes, arbitrary raw locally constant abelian coefficients, nonsurjective transition maps, arbitrary small cofiltered indices and nonreduced étale inputs. It distinguishes raw, strict and p-profinite homotopy theories, continuous cohomology from materialized cohomology, and the slice of the homotopy category from a homotopy-coherent slice. No algorithm, copied source passage, admitted data definition, free placeholder predicate or set_option was found.

Every numbered target has one Needs line; every definition block has a prose API and at least three Checks. The seven layers each end in Examples and Dependencies. Metadata is the single math.AG topic. The sources manifest contains 12 unique lifetime keys. The README shape was compared with the main-branch AlgebraicTopology, GeneralizedCohomology and ProfiniteProPGroups roadmaps. Existing work is imported, with the exception in R01. R02 is a repairable supplier overclaim, not grounds to reject the roadmap’s scope.

### Seeded source audit

The 15 requested targets were all audited. Eleven have readable source text supporting the sampled mathematics; four depend for their requested published locator on settled, unavailable FGV text. Those four received independent mathematical checks but not textual certification. No source was fetched or manifest entry altered.

| Sampled target | Text opened and exact scope | Result |
| --- | --- | --- |
| 1.3 Coverings under homotopy equivalence | SS Lemma A.3, p. 854, SS lines 1484–1490: connected pointed pro-spaces, weak equivalence, pullback equivalence of covering categories. | Supports the theorem, including morphisms of coverings. |
| 2.2 Vanishing of profinite derived limits | SS Lemma A.7, pp. 856–857, SS lines 1573–1601: finite groups over a small cofiltered category; positive derived degrees, including the nonabelian first limit. Its proof uses compact compatible fibers. | No hidden surjectivity or countability assumption. The abelian degree-zero exclusion is correct. |
| 2.5 Monodromy on pointed mapping classes | SS Lemma A.9, p. 859, SS lines 1675–1680; Lemma A.12, p. 860, SS lines 1713–1732. | Endpoint-preserving transport and conjugation direction agree with the S₃ witness. |
| 2.10 Stabilizer quotient | SS Theorem A.13(b), p. 860, SS lines 1736–1753; proof p. 861, lines 1756–1786. | Hypotheses and stabilizer preimage correct; page range R03. |
| 3.7 Galois-equivariant geometric cohomology transport | SS Proposition 2.3, p. 824, SS lines 288–316. All abelian groups A, varieties over k, isomorphism over the field’s raw type. | Correct Galois-equivariant comparison. The package uses the Galois cover tower and cohomological continuity, not descent of arbitrary infinite torsors. |
| 3.9c Products of raw K(π,1) varieties | SS Lemma 2.7(b), p. 827, SS lines 414–432; its product input SGA1 XIII Proposition 4.6, p. 310, SGA1 lines 12282–12294. | Characteristic zero, geometric connectedness/unibranchness and finite products agree. Empty product follows from the field BG case. Its resolution route has R02. |
| 4.2 Pointed lifts of arithmetic isomorphisms | SS Proposition 2.4(a), p. 825, SS lines 329–341, and A.13(a), SS lines 1741–1742,1783–1786. | Source does not require geometric unibranchness of X; package retains that generality. |
| 4.6 Open-image orbit bijection | SS Corollary 2.6, p. 826, SS lines 391–400. | Continuous open-image condition and strong center-freeness are present; conjugation preserves openness. |
| 5.3a Betti descent for smooth surjections | FGV Example A.10, p. 311, settled uncertified. Read the actual Orbifolds and ComplexComparisonPartII inputs instead. | Text not certified; local analytic sections, numerability and the Čech computation support the proposed route. |
| 6.1 p-finite spaces | BHH Definition 7.3.1, p. 68, BHH lines 2427–2434; Propositions 7.3.4 and 7.3.6, pp. 69–70, lines 2454–2498. | Finite component set, finite p-group homotopy and finite truncation bound agree. |
| 6.3 Model for homotopy-coherent p-profinite types | BHH Theorem 7.1.2, p. 63, BHH lines 2226–2227; Corollary 7.3.8, p. 71, lines 2511–2512. | The coherent localization identifies Pro of p-finite spaces, including mapping spaces, not merely Pro of a homotopy category. |
| 6.4 Materialized p-completed étale type | FGV (A.9), pp. 307–309, settled uncertified. | Definition and counterexample to unrestricted materialization comparison tested; requested text unavailable. |
| 6.5 Finite-type materialization comparison | DAG13 Definition 3.3.2 and Proposition 3.3.8, p. 83, DAG13 lines 3708–3711,3736–3737; Corollary 3.4.10, pp. 91–92, lines 4134–4141; Theorem 3.4.12, p. 92, lines 4146–4150. | Requires the unit Fₚ→H⁰ to be an isomorphism, H¹=0 and finite dimension in every higher degree. No boundedness in cohomological degree is inferred. |
| 6.6 Componentwise p-completed realization | FGV pp. 307–310 and 312–315, settled uncertified. | Specified simplicial grading and componentwise coproduct tested; textual locator unavailable. |
| 6.7 Betti–étale comparison zigzag | FGV pp. 309–310, settled uncertified. | The rigid-hypercover diagram and all arrow domains were checked; the printed zigzag was not read. |

All other repaired locators and proof inputs were examined in the available texts: I01 lines 281–307,340–356,412–434,637–669,1658–1699; IStr lines 494–539; IEt lines 271,331–333,594–642,740–810; IC lines 170–245; SS lines 225–485,1450–1652,1827–1865; and SGA1 lines 12195–12322. IStr’s correction is used rather than the invalid simultaneous-level argument in I01. The native cohomology and ordinary-topology suppliers supply the additional hypotheses expressly listed by the package.

### Computed adversarial pass

Notation: Cₙ is the cyclic group of order n; B denotes the classifying space; “point” has one component and zero positive homotopy. Calculations use the raw, completed or materialized object explicitly indicated. They are tests, not replacements for the eventual general proofs. Untouched theorem proofs are not claimed to have been formalized.

| Statement | Instances tried | Values on the two sides / wrong-model value | Result and change |
| --- | --- | --- | --- |
| Conventions: conjugation and composition | S₃, α=(123), β=(12), γ=(12) | α γ α⁻¹=(23); β(23)β⁻¹=(13); βα=(23) gives (13). α⁻¹ γ α=(13), not (23). | Agrees with the supplier’s edge order and the package’s target action. |
| 0.1 pro-local systems and coefficient convention | Circle with trivial/sign ℤ; point; two points | Sign differential is −2, giving H⁰=0,H¹=C₂; trivial differential 0 gives ℤ,ℤ. Component counts are 1 and 2. | Nontrivial monodromy and empty/disconnected carriers are distinguished; direct coefficients are not replaced by a dual. |
| 0.2 raw versus strict model | K=∏ₙ≥1 K(ℤ,n)→(PₘK)ₘ | For fixed i, pro-πᵢ is eventually constant ℤ on both sides. At stage m, π_(m+1) is ℤ→0. | Raw equivalence need not be a levelwise weak equivalence. |
| 0.3 properness/fibration route | Double cover of S¹, pulled back along S¹×K(ℤ,2)→S¹ | Pullback π₁=2ℤ and π₂=ℤ; the product of the cover with K(ℤ,2) has the same groups. | Correct levelwise pullback test; IStr’s intervening pro-isomorphism remains necessary. |
| 0.4 pointed detection | Identity circle; BC₂→BS₃ | First π₁ map is id:ℤ→ℤ; second has image order 2 in a group of order 6. | Isomorphism criterion accepts the first and rejects the second. |
| 0.5 local-coefficient detection | S¹→*; BC₃→* tested only at F₂ | H¹(S¹,ℤ)=ℤ versus 0. BC₃ and point have F₂-cohomology (F₂,0,…), but π₁=C₃ versus 1. | Both π₁ and the stated coefficient range matter. |
| 1.1 pro-covering definition | Identity, double cover of circle; Sing(S¹)→* | Fibers/deck groups: 1/1 and 2/C₂. The last map has many paths with the same initial vertex. | Vertex-unique lifting excludes a general Kan fibration. |
| 1.2 subgroup-cover representation | Subgroups ℤ,2ℤ,0 of ℤ; degree-3 and degree-4 maps | Covering degrees 1,2,∞. Degree 3 has 3ℤ⊄2ℤ, so no pointed lift; degree 4 has a unique pointed lift. | Both directions of the lifting criterion tested. |
| 1.3 covering-category invariance | Connected circle model and its one-type; subgroup nℤ, n≥1 | Fiber index n on both sides; deck endomorphisms Cₙ on both sides. For 0 subgroup, degree ∞ on both sides. | Checks objects and morphisms, not just cardinality of objects. |
| 1.4 coverings are fibrations | Double circle cover; Sing(S¹)→* | Discrete covering fiber has 2 points; every simplex lift with its chosen vertex is unique. The non-cover has multiple such lifts. | Correct implication; no false converse. |
| 1.5 homotopy-isomorphism base change | Identity of circle pulled back through degree 2 | Lift is identity of the covering circle; H¹ map ℤ→ℤ is +1. Deck rotation also acts by +1. | Cohomological comparison is deck-equivariant. |
| 1.6 classifying pro-space | Constant Cₚ; tower C_(pʳ), p=2,3 | Constant replacement has π₁=Cₚ, higher 0; finite predecessor product has p^(n+1) elements. Tower retains pro-π₁=(C_(pʳ)); its limit is ℤₚ. | Pro-system is not replaced by the constant abstract limit. |
| 1.7 full faithfulness | Hom(C₂,S₃) | Four homomorphisms: zero and three transpositions; four pointed BG classes. | Nonabelian target distinguishes pointed from outer maps. |
| 1.8 maps into BG | S¹→BC₃; S²→BG | First pointed set has 3 elements = Hom(ℤ,C₃); second has 1 = Hom(1,G). | Higher source cells do not create maps into a one-type. |
| 1.9 first classifying morphism | Point, circle, S² | Higher groups of first two vanish and classifying map is an isomorphism; S² has π₂=ℤ whereas Bπ₁(S²)=*. | Both directions of raw K(π,1) recognition tested. |
| 2.1 materialization | Discrete diagram *→{0,1}, value 0; constant two-point space | Cosimplicial degree 0 has 2 tuples; Tot₁ and holim have 1 compatible tuple. Constant materialization has 2 components. | Product of degrees is not partial totalization. |
| 2.2 derived limits | C₂ with identity or zero transitions; C_(pʳ); C₂^F over finite F⊂ℝ; ℤ with ×2 | Constant lim=C₂; zero-transition lim=0; all finite examples have positive derived limits 0. C₂^F limit=C₂^ℝ, with positive derived limits 0. Infinite ℤ tower has lim=0, lim¹=ℤ₂/ℤ, with nonzero [1/3]. | Positive degree, finiteness and arbitrary cofiltered indexing all exercised. |
| 2.3 homotopy groups of materialization | B(C_(pʳ)), p=2,3; B(ℤ ←×2 ℤ) | First π₀=1,π₁=ℤₚ,πₙ=0 for n≥2; second π₀=ℤ₂/ℤ, not a singleton. | Profinite hypothesis prevents the disconnected counterexample. |
| 2.4 relative cylinder | Two marked vertices, with and without a third vertex | Over each mark the fiber is point; over the third it is Δ¹ with two vertices and one nonidentity edge, without an inverse edge. | Projection is a weak equivalence but not a Kan fibration. Source error is not imported. |
| 2.5 monodromy | BC₂→BS₃; S¹→BC₃ | S₃ permutes the 3 nonzero maps transitively. C₃ conjugation fixes each of the 3 cyclic maps. | Right conjugation convention agrees in nonabelian and abelian cases. |
| 2.6 absolute orbit bijection | BC₂→BS₃ | Four pointed classes split into orbit sizes 1 and 3, giving two unpointed classes. | Quotient is essential. |
| 2.7 isomorphism lifting | BC₂ and BC₃ self-equivalences | Pointed automorphism counts 1 and 2; conjugation is trivial, so unpointed counts also 1 and 2. | Unpointed isomorphisms have pointed lifts. |
| 2.8 relative pointed surjection | BC₃→BS₃ over sign BS₃→BC₂, source structural map zero | Hom(C₃,S₃) has 3 maps, all over BC₂; full conjugation has 2 orbits. | Forgetful map 3→2 is surjective, not injective. |
| 2.9 relative isomorphisms | BS₃ over its sign map | Six inner automorphisms, all over BC₂, give one unpointed automorphism class. | Isomorphism lifting retained. |
| 2.10 stabilizer quotient | Same BC₃/BS₃/BC₂ model | S_X=C₂, Δ_XY=S₃; quotient has 2 classes. Kernel A₃ conjugation fixes all 3 maps. | The full stabilizer preimage, rather than only the kernel, is necessary; R03 is only a locator change. |
| 3.0a pro-group completion | 1,ℤ,S₃; ℤ ←×2 ℤ | Completions 1,ℤ̂,S₃. The tower’s abstract limit is 0; completed limit ∏_(ℓ odd)ℤ_ℓ. Maps to C₃ number 3 on both correct sides, versus 1 from completion of the abstract limit. | Additional pro-group universal property is substantive. |
| 3.1 rigid covers | Spec ℂ; identity cover of A¹ at geometric points 0,1 | Point neighborhood gives one component. Rigid indexing keeps distinct pointed copies at 0 and 1, while the underlying unmarked identity cover is one connected scheme. | Markings and connected components cannot be discarded. |
| 3.2 rigid hypercovers | Quadratic étale cover Spec L→Spec k; empty degree zero | U₁=Spec(L⊗ₖL) has 2 copies of Spec L. Empty U₀ has 0 points over a base with 1 component. | Matching at degree zero is necessary. |
| 3.3 raw étale type | Spec ℂ, Spec F_q, simplicial BCₚ, dual point | Types *,Bℤ̂,BCₚ,*; π₁=1,ℤ̂,Cₚ,1. Taking only X₀ gives π₁=1 for BCₚ. | All simplicial directions and nilpotent invariance retained. |
| 3.4 arbitrary coefficient comparison | Spec ℂ with A; Spec ℝ with ℤ or C₂ | Complex point: H⁰=A,higher 0. Real point: integral H¹=0,H²=C₂; mod 2, Hⁿ=C₂ for every n≥0 on both group and étale sides. | Non-torsion coefficients are not silently narrowed to finite ones. |
| 3.5 raw/finite π₁ and fields | ℂ,ℝ,F_q; square-zero ℂ thickening | Raw finite-quotient pro-groups represent 1,C₂,ℤ̂,1; completion gives the same profinite groups. Field higher raw groups vanish. | Field BG and reduction agree. |
| 3.6 finite étale base change | Spec ℂ→Spec ℝ; two points over ℂ | First is the contractible C₂-cover of BC₂; its self-pullback has 2 components. Second has 2 components on each side of the pro-covering comparison. | Cover degree and deck action agree. |
| 3.7 geometric transport | Identity of Gₘ/ℝ, A=C₃ | Geometric H¹=C₃; conjugation acts by −1=2. The comparison sends 1→1; both composites send 1→2. | Galois equivariance has a nontrivial sign test. |
| 3.8 elementary fibrations | Gₘ and A¹ over ℂ; proposed P¹ with no boundary | Kernels ℤ̂(1) and 0. Empty boundary leaves P¹, which is not affine and has nonzero higher étale homotopy. | Required affine complement excludes the false example. |
| 3.9a finite étale product | Gₘ²/ℂ; Y×Spec k; Spec ℝ×_ℝSpec ℝ | Groups ℤ̂²,π₁(Y),C₂. Fiber product in last case is diagonal order 2, while direct product has order 4. | Formula passes; compactification route requires R02. |
| 3.9b effacement and detection | Separably closed point, its dual point, P¹; BC₃→* at F₂ | First two have zero positive constant cohomology. H²(P¹,C₂)=C₂ survives every surjective finite étale cover. BC₃ has F₂-cohomology (F₂,0,…) but wrong π₁. | Surjectivity of killing cover and all stated detection hypotheses are retained. |
| 3.9c raw products | Empty product; Gₘ; Gₘ² under exponent-p cover, p=2,3 | Empty product is BG_k with higher π=0. Torus mod-p Betti dimensions are 1,2,1; pullback multiplies H¹ by p=0 and H² by p²=0. | Nonzero H² before pullback is consistent with K(π,1) effacement. |
| 4.0a center-free/outer-map definitions | 1,S₃,ℤ₂; sections C₂→C₂² over second projection | Centers 1,1,ℤ₂, but open A₃⊂S₃ has center C₃. There are exactly two sections (0,t),(t,t); (t,0) is not over the base. | Strong center-freeness excludes S₃; structural equation excludes the wrong relative map. |
| 4.0b arithmetic image | Separable degree d; purely inseparable extension; ℚ(i)/ℚ | Image indices d,1,2, respectively. The last is proper but open. | Open does not mean surjective. |
| 4.1 pointed arithmetic lift | Spec ℂ→Gₘ | Hom(1,ℤ̂) has one element; connectedness gives one unpointed class. | Correct existence, with the actual field structural map. |
| 4.2 arithmetic isomorphism lift | Identity of Gₘ/ℝ | Geometric π₁ map is +1 on ℤ̂(1); arithmetic C₂ map is identity; forgetting gives the identity class. | Required pointed lift remains an isomorphism. |
| 4.3 geometric orbit surjection | Sections of ℤ̂(1)⋊C₂→C₂ | Sections indexed by a∈ℤ̂; geometric conjugation sends a to a+2b, leaving two classes ℤ̂/2ℤ̂. | Surjection does not assume the stronger center-free conclusion. |
| 4.4 arithmetic orbit bijection | Gₘ/ℂ; abstract BC₃/BS₃ over BC₂ | G_ℂ=1 satisfies the hypothesis. In the second model, kernel quotient has 3 elements and full quotient 2; C₂ fails strong center-freeness. | Negative control explains the extra hypothesis. |
| 4.5 outer π₁ map | z↦z² and constant 1 on Gₘ/ℂ | Induced maps on ℤ̂ are ×2 and 0; outer Hom parameters are 2 and 0. | Actual scheme map and classifying map agree. |
| 4.6 open-image restriction | Powers 1,2,3 and constant 1 on Gₘ | Indices 1,2,3,∞; first three open, zero image not open. | Restriction excludes a real map class, including at small primes. |
| 4.7 product mapping theorem | z↦(z²,z³); empty source | Parameter (2,3)∈ℤ̂² projects to exactly 2 and 3. Empty-source Hom sets have sizes 1=1×1. | Product and empty-source cases agree. |
| 5.1 algebraic evaluation | T=point,∅,[0,1]; A¹,Gₘ,dual point | Point evaluations give ℂ. Empty T gives one morphism to each X. In C([0,1],ℂ), 1+t has inverse 1/(1+t); t is not a unit. Nilpotent ε must map to 0. | Zero ring, denominator and nonreduced controls pass. |
| 5.2 Betti realization | A¹_ℂ, BCₚ, ∐_ℕ Spec ℂ | Types are contractible, π₁=Cₚ, and discrete ℕ. Discrete A¹ points instead have one component per complex number; X₀ of BCₚ is point. | Analytic and discrete realizations are not conflated. |
| 5.3a smooth Čech descent | Two points→point; A¹→point; id Gₘ; ∅→point | Čech sizes 2,4,8; affine terms ℂ^(n+1). First two diagonals contractible; identity gives id on ℤ. Empty augmentation has 0 versus 1 components. | Surjectivity/local sections indispensable; FGV text unavailable. |
| 5.3b analytic hypercover descent | Infinite points→point; node xy=0; dual point | Infinite Čech terms ℕ^(n+1) form a contractible nerve. Node is contractible with tangent dimension 2; dual point has point singular type. | Infinite pieces, singularity and nilpotents fit the stated domain. |
| 6.1 p-finite definition | ∅,2 points,BCₚ,BC_q(q≠p),∏ₙ≥1 K(Fₚ,n) | First component counts 0,2; cyclic orders p,q. Last has πₙ=Fₚ in every n≥1. | First three accepted; wrong prime and missing truncation rejected. |
| 6.2 completion universal property | BC_q(q≠p),2 points,discrete ℕ | Completed objects are point,2 points,profinite completion of ℕ. Materialized last component set is βℕ, containing free ultrafilters. | Completion need not preserve an infinite discrete set as a constant object. |
| 6.3 coherent model comparison | BC_q(q≠p) mapping to BCₚ | Map(BC_q,BCₚ) has one component and π₁=Cₚ, exactly Map(*,BCₚ)=BCₚ. | A single homotopy-class element would lose the required mapping space. |
| 6.4 materialized p-type | Spec ℂ,BCₚ,ungraded countably many points | First H⁰=Fₚ; second H¹=Fₚ. A function on βℕ supported at one free ultrafilter is nonzero but restricts to 0 on ℕ. | Continuous pro-cohomology is not all ordinary cohomology of materialization. |
| 6.5 finite-type comparison | K(Cₚ,2); BCₚ, p=2,3 | First H⁰=Fₚ,H¹=0,H²=Fₚ and unit sends 1→1. BCₚ has H¹=Fₚ≠0, outside the sufficient criterion. | No converse claiming all successful materializations satisfy these hypotheses. |
| 6.6 graded completion | ℕ copies of Spec ℂ; one grade; no grades | Graded result is discrete ℕ, H⁰=∏_ℕ Fₚ,higher 0. One grade preserves its type; no grades gives empty. | Grade-merging face maps do not satisfy the fixed grading hypothesis. |
| 6.7 comparison zigzag | Point; finite labeled points; simplicial BCₚ | Point H⁰ map 1→1; labels preserved; both BCₚ endpoints have π₁=Cₚ and H¹ map identity. | Using only scheme level 0 would give Fₚ→0 and fail. |
| 6.8 mod-p comparison | P¹_ℂ; simplicial BCₚ | P¹ homology/cohomology dimensions 1,0,1 for p=2,3. BCₚ has H¹=Fₚ despite X₀ being a point. | Finiteness/connectivity conditions concern the full simplicial object. |
| 6.9 semilinear naturality | Complex conjugation on Gₘ; composite σ∘τ | i↦−i; positive loop has degree −1 on ℤ̂(1), nontrivial also on ℤ₂(1). Composite sends z to σ(τ(z)). | Sign and composition order agree through the comparison and strictification. |

### Supplier-gap tests

All 24 slugs have the same supplier and needs sentence in the README and plan. None has supplier “none”. The requested additional scope is precise; R01 is the one identified minimality failure. The remaining requests were compared with the named suppliers and pinned APIs, subject to the unavailable board heads listed below.

| Gap | Instances and computed values on both sides | Audit result |
| --- | --- | --- |
| pro-universe-extension | Constant two-point simplicial set has 4 self-maps before and after enlargement. | Full faithfulness, not mere existence of lifted objects, is requested. |
| pro-cofinal-invariance | Tail n≥3 of C_(2ⁿ): limit ℤ₂ and 2 maps to C₂, equal to the whole tower. | Correct inverse cofinal direction. |
| pro-cofinite-reindexing | Finite subsets F⊂ℝ have 2^card(F) predecessors, hence 1,2,4 for sizes 0,1,2; limit of C₂^F is C₂^ℝ. | Cofinite is not confused with countable. |
| pro-level-representations | Constant fork C₂→S₃ taking the generator to (12) or (23) has the same two maps in a one-stage level representation. | Finite loopless diagrams; arbitrary action diagrams are not requested. |
| pro-monomorphism-presentations | C₂↪S₃ has kernel 1, image order 2, index 3 on both pro and level presentations. | Injectivity does not assert normality. |
| simplicial-postnikov | P₀S²=P₁S²=*; π₂P₂S²=ℤ; P₁BC₂ has π₁=C₂ and higher groups 0. | n=0,1,2 covered. |
| simplicial-local-whitehead | S²→* has equal π₁=1 but integral H² values ℤ and 0; identity circle preserves sign H¹=C₂. | Local cohomology distinguishes a false equivalence. |
| simplicial-moore-postnikov | Pull back the path fibration of K(ℤ,2) along S²: degree 1 gives obstruction 1∈ℤ; degree 0 gives 0 and a lift. | Both obstruction outcomes and actual local coefficients retained. |
| simplicial-covering-classification | Circle subgroups ℤ,2ℤ,0 give covering indices 1,2,∞ on both simplicial and topological sides. | Ordinary-cover supplier does not already give the full simplicial comparison. |
| local-coefficient-representability | Circle with trivial ℤ has H¹=ℤ; sign ℤ has H¹=C₂. Twisted section classes have the same integer/two-class sets. | Nontrivial monodromy differentiates the generic ordinary constant-coefficient theorem. |
| reedy-homotopy-limits | Diagram *→{0,1} has 2 degree-zero tuples but 1 compatible totalization point, equal to holim. | Projection compatibility is material. |
| nonabelian-lim1 | Constant C₂⊂S₃: sizes 2→6→3→1→1; coset-map fibers have size 2. | Pointed-set exactness works without normality. |
| bk-homotopy-limit-spectral-sequence | Constant BC₂ gives E₂⁰,¹=C₂ and E₂¹,¹=*. Tower B(ℤ ←×2 ℤ) gives E₂¹,¹=ℤ₂/ℤ with [1/3]≠0. | Fringe retained; BK text remains uncertified. |
| bk-tower-convergence | Constant S¹ gives π₁Tot=ℤ=E₂⁰,¹, π₀Tot=1; infinite-group tower has nonzero diagonal term and disconnected Tot. | Convergence is separate from construction of E₂. |
| multisimplicial-diagonal | Rows Sing(ℂ^(n+1))→* have positive π=0 and one component; diagonal also contractible. Identity BCₚ diagonal retains π₁=Cₚ. | Iterated diagonal has the intended range. |
| kan-quillen-properness | Whisker attachment to S¹ preserves π₁=ℤ; pullback of identity through the double cover preserves the subgroup 2ℤ on both sides. | Missing properness is distinct from the enrichment axiom. |
| kan-quillen-simplicial | Boundary inclusion gives loop fiber with 2 components for BC₂; endpoint inclusion gives contractible fiber. | R01: this is the supplied Cartesian monoidal axiom by adjunction. |
| surjective-nerve-fibration | C₄→C₂ gives 2 lifts of each edge; C₂↪S₃ gives 0 lifts of edge (123). | Groupoid nerves being Kan does not already give this map criterion. |
| coherent-pro-category | Terminal category gives one pro-object up to equivalence and one-point mapping space. | Requested coherent completion differs from ordinary Pro. |
| coherent-pro-mapping | Constant BC₂ to BC₂: mapping space has 2 components, each π₁=C₂; limit-colimit formula gives the same space. | A two-element discrete Hom set loses data. |
| coherent-pro-universes | Same example under universe enlargement retains 2 components with π₁=C₂ each. | Mapping spaces, not just object cardinalities, must be preserved. |
| topological-hypercover-realization | Nonempty Čech covers have degrees 2,4,8 or ℕ^(n+1), and contractible diagonal; empty degree zero has 0 components versus target’s 1. | No finite-piece assumption; generic cohomological descent alone is insufficient. |
| connected-etale-components | Two copies of Spec ℂ have open singleton components. In Spec(∏_ℕF₂), a free-ultrafilter component is a singleton but not open. | Local noetherianity cannot be removed silently. |
| elementary-fibration-carrier | Gₘ⊂P¹ and A¹⊂P¹ have boundary sizes 2 and 1, with affine complements; empty boundary leaves nonaffine P¹. | Carrier request has positive and negative examples; no geometric existence claimed. |

### Pinned-library audit

The manifest pins checked were Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The following declarations were opened at those pins, including their variable blocks and defining bodies. Searches used objects and operations, not only proposed declaration names.

| Pinned declaration(s) | File and line | Scope established by reading |
| --- | --- | --- |
| SSet | Mathlib/AlgebraicTopology/SimplicialSet/Basic.lean:33 | Presheaf carrier on the simplex category; no pro-local-system structure. |
| SSet.KanComplex; hornFilling | Mathlib/AlgebraicTopology/SimplicialSet/KanComplex.lean:40,45 | Fibrancy predicate and positive-dimensional horn filling; no pro-space model. |
| HomotopicalAlgebra.ModelCategory | Mathlib/AlgebraicTopology/ModelCategory/Basic.lean:43 | Abstract model axioms with finite limits/colimits; not chosen functorial factorizations. |
| TopCat.toSSet; toSSetObjEquiv; SSet.toTop; sSetTopAdj; toSSetIsoConst | Mathlib/AlgebraicTopology/SingularSet.lean:50,56,65,73,97 | Singular simplices use the explicit universe lift. The constant comparison’s binder is “[TotallyDisconnectedSpace X]”, with no compactness or nonemptiness assumption. |
| CategoryTheory.Functor.diag; uncurry | Mathlib/CategoryTheory/Products/Basic.lean:292; Mathlib/CategoryTheory/Functor/Currying.lean:37 | Ordinary categorical diagonal/uncurrying, not homotopy invariance of diagonals. |
| Scheme.smallEtaleTopology | Mathlib/AlgebraicGeometry/Sites/Etale.lean:50 | Native small étale site. |
| Sheaf.H | Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56 | Body is Ext from the constant integral sheaf; the preceding binders require HasSheafify and HasExt. |
| ContinuousMap.compRightAlgHom; evalAlgHom | Mathlib/Topology/ContinuousMap/Algebra.lean:700,853 | Continuous precomposition and evaluation with the stated topological semiring/algebra structures; not analytification. |
| CategoryTheory.Ind | Mathlib/CategoryTheory/Limits/Indization/Category.lean:70 | Shrunk-hom full subcategory of ind-objects with its stated universe sizes; not a ready-made arbitrary-universe homotopy-coherent Pro carrier. |
| Functor.rightDerived | Mathlib/CategoryTheory/Abelian/RightDerived.lean:108 | Additive functor and injective-resolution existence; no nonabelian lim¹. |
| HasInjectiveResolutions | Mathlib/CategoryTheory/Preadditive/Injective/Resolution.lean:70 | “class HasInjectiveResolutions : Prop”; field asserts existence for each object. It is not chosen resolution data. |
| Limits.lim; Functor.additive_of_preserves_binary_products | Mathlib/CategoryTheory/Limits/HasLimits.lean:555; Mathlib/CategoryTheory/Preadditive/AdditiveFunctor.lean:231 | Limit-existence binder and additive-functor hypotheses retained. |
| ProfiniteGrp.profiniteCompletion; ProfiniteCompletion.homEquiv; adjunction | Mathlib/Topology/Algebra/Category/ProfiniteGrp/Completion.lean:191,205,215 | Ordinary group completion, continuous-target universal property and adjunction. These are imported in §3.0a. |
| ProfiniteGrp.toFiniteQuotientFunctor; continuousMulEquivLimittoFiniteQuotientFunctor | Mathlib/Topology/Algebra/Category/ProfiniteGrp/Limits.lean:48,138 | Finite-quotient diagram and topological multiplicative equivalence to its limit. |
| nonempty_sections_of_finite_cofiltered_system | Mathlib/CategoryTheory/CofilteredSystem.lean:79 | Small cofiltered-or-empty category; finite nonempty fibers. Surjective transitions are not required. |
| TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system | Mathlib/Topology/Category/TopCat/Limits/Konig.lean:126 | Compact Hausdorff, nonempty objects and continuous diagram, also allowing empty indexing category. |
| TauCeti.LocalCoefficientSystem; pullback; pullbackIdIso; pullbackCompIso; transport | TauCeti/AlgebraicTopology/LocalCoefficient.lean:43,75,102,136,252 | Body “FundamentalGroupoid X ⥤ ModuleCat.{w} R”. It imposes neither finite fibers, finite monodromy nor reflexivity. |
| LocalCoefficientSystem.twistedCochainComplex; twistedCohomology | TauCeti/AlgebraicTopology/Cohomology/Twisted/Basic.lean:79,84 | Body “L.twistedChainComplex.linearYonedaObj k M”: Hom from twisted chains. It does not itself identify arbitrary direct L-valued cochains with this dual convention. |
| TauCeti.exists_forall_map_eq_of_compact_t2; exists_forall_map_eq_of_finite | TauCeti/Topology/Compactness/InverseSystem.lean:78,96 | Directed-preorder versions; compact Hausdorff/nonempty or finite/nonempty, without surjective transitions. |
| ProfiniteCompletion.etaFn_bijective_of_finite; continuousMonoidHomEquiv | TauCeti/Topology/Algebra/Group/Profinite/Completion.lean:68,179 | Finite-group unit bijection and continuous-target universal property, allowing the larger target universe. |
| TauCeti.IsTopologicallyFinitelyGenerated | TauCeti/Topology/Algebra/Group/Generation.lean:73 | Finset-generated subgroup has topological closure ⊤; this is not abstract finite generation. |
| IsProP.exists_continuousMulEquiv_pi_padicInt_prod_pi_zmod | TauCeti/Topology/Algebra/Group/Profinite/ProP/StructureTheorem.lean:59 | Prime, compact totally disconnected topological commutative group, pro-p predicate and topological finite generation. Includes rank 0 and trivial finite factor. |

No new definition duplicates these native objects. In particular the ordinary completion and compatible-family results are cited rather than re-planned. A larger abstract inverse limit is not confused with the native profinite object. Native declarations may have implementation options internally; the prohibition was checked on this package’s Suggested.lean, which has none.

### Supplier resolution, ownership and order

Existing roadmaps were checked on content main 5f173a7b9ac37eb6b62d01eb3db5047b92d19363; new roadmaps were read at the supplied open heads through the roadmap service. All cross-roadmap citations, including each Needs line and the downstream names, were resolved. The following are the concrete ownership checks; line numbers refer to the supplier README itself, not a saved service header.

| Supplier | Resolved section and evidence |
| --- | --- |
| AdicSpacesPartII | §R0.19.9, TauCetiRoadmap/AdicSpacesPartII/README.md:7793–7830: Ind-opposite Pro carrier, stage Hom formula/naturality, finite limits and cofiltered flattening. The five extra universe/reindexing/presentation requirements are explicitly declared gaps. |
| PerfectoidSpaces; DiamondsAndVStacks | §P6.10, TauCetiRoadmap/PerfectoidSpaces/README.md:14654; §D0.13, TauCetiRoadmap/DiamondsAndVStacks/README.md:1255: bounded presentations use the same carrier and count morphisms in the small presentation. |
| AlgebraicTopology | Stage 6.1 at TauCetiRoadmap/AlgebraicTopology/README.md:1011 and Stage 8: ordinary direct local coefficients, homotopy/Whitehead/obstruction/representability interfaces. Their existing scope does not erase the explicit simplicial/Postnikov and nonabelian-limit requests. |
| Completed/UniversalCovers | Stage 2 at Completed/UniversalCovers/README.md:98; Stages 3–4: pointed connected ordinary coverings/subgroups, unpointed conjugacy and higher homotopy. |
| GeneralizedCohomology | G2 item 1 at TauCetiRoadmap/GeneralizedCohomology/README.md:213–242: unpointed/pointed Kan–Quillen, mapping objects and realization–Sing comparison. Properness is not stated there. R01 resolves the additional simplicial axiom to BordismFormalGroups. |
| BordismFormalGroups | §F6.5 at TauCetiRoadmap/BordismFormalGroups/README.md:1571–1574 supplies the fixed Cartesian monoidal axiom. The coherent model-diagram block at lines 2005–2034 includes Kan-complex diagrams, restrictions and group diagrams. Generic rectification is correctly imported. |
| StableHomotopyKTheory | §§1.19–1.23 and 1.28–1.34, TauCetiRoadmap/StableHomotopyKTheory/README.md:304,412 onward: coverings/realization, translation categories, BG/EG, π₁, groupoid Kan nerves. Edge(gh) follows edge(h) then edge(g); the S₃ computation matches. The nerve-map fibration criterion is separately declared. |
| Orbifolds | O4 item 3/O4-N at TauCetiRoadmap/Orbifolds/README.md:314–327: numerable smooth-surjection Čech descent and its singular adapter. The smooth quasi-projective complex application checks the required hypotheses. |
| EnhancedDerivedSheaves | §§E0.2–E0.5 and E0.8, TauCetiRoadmap/EnhancedDerivedSheaves/README.md:191 onward; E2.6 at line 2293: coherent categories, spaces, size/limits, matching maps and uniformly bounded-below cohomological descent. A cohomological descent theorem is not topological realization descent. The generic coherent Pro requests are not covered by the stable-category Ind discussion in BordismFormalGroups. |
| SchemeAndStackFoundations | §§0.9–0.12 at TauCetiRoadmap/SchemeAndStackFoundations/README.md:848,878,969; §§2.10,2.15 at lines 3631,3867: affine-transition approximation, geometric unibranchness, étale neighborhoods, sites and cohomological continuity. The latter’s qcqs/compatible-coefficient assumptions are retained. |
| EtaleCohomologyFoundations | F.0.2, F.0.4, F.0.A2, F.2.6 at TauCetiRoadmap/EtaleCohomologyFoundations/README.md:200,248,368,645: finite-cover Galois category, topological invariance, arithmetic sequence and finite-coefficient Künneth with Tor/invertibility qualifications. |
| ComplexComparisonPartII | C−1.1 at TauCetiRoadmap/ComplexComparisonPartII/README.md:699–779, including .complexPoints, .fibreProduct, .etaleLocalIso and .smooth at lines 753–755. C5.1/C6.1–C6.3 at lines 2337,4047,4137,4168 supply the respective sheaf–singular, finite-cover and finite-coefficient comparisons. Full locally finite-type analytification allows infinite hypercover pieces. |
| ResolutionOfSingularitiesCharacteristicZero | §§5.1–5.2,5.5,6.1–6.2 at TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:672,682,718,758,770. The actual hypotheses establish R02; the general resolution target exists and supplies the repair route. |
| ProfiniteProPGroups | Layers 0,3,4 at TauCetiRoadmap/ProfiniteProPGroups/README.md:125 onward,642 onward: quotient/completion, pro-p structure and the native generation interfaces. No second group structure theorem is needed. |

The four supplied citation-resolver leads were false positives: three analytification names are actual APIs in ComplexComparisonPartII §C−1.1, and sources.toml is a filename, not a declaration. Supplier claims were checked in their files rather than accepting the resolver as a verdict.

Object-based searches used the required roadmaps grep service over main and the indexed open roadmap heads, and rg over local packages and both pinned libraries. Search families included pro-simplicial sets, raw étale types, rigid hypercovers, finite derived limits, group completion, cofinite presentations, local coefficients, Postnikov/Whitehead towers, Kan–Quillen compatibility, coherent Pro, topological hypercovers, materialization and rectification. The board-package index was read before any ownership conclusions. Five additional board-head READMEs were readable and searched: AnalyticNumberTheory at 310e834, ArithmeticStatistics at 357e723, AutomorphicCongruences at 08f531f, KatoEulerSystems at a3ba9c5 and LogicAndDefinabilityInNumberTheory at d36cfa5. No competing construction from these searches changes the identified ownership; the fifteen unavailable heads limit this conclusion as stated below.

AnabelianGeometryAndNonabelianChabauty §§1.5–1.6, TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:3263–3292, also plan the raw type/comparison and recognition used by its applications. That roadmap is later in the merge order. This package is the earlier owner of the general constructions in §§3.3–3.5,1.9,3.9b; record the ownership move to this package and have the later roadmap consume these sections. This is the permitted removal of an upward dependency, not a citation of the later construction as an input. The geometric-neighborhood existence work remains there.

InverseGaloisAndArithmeticFundamentalGroups is likewise a later consumer of the relative fundamental-group interface. MotivicEtaleKTheory’s motivic realization is distinguished from this raw construction. The local board designs for EllAdicHomotopyTypesAndWeights and ArithmeticKTheoryPartII exist and use this package’s raw/completed comparison interfaces; neither was reported absent because the open-roadmap show service did not expose it. No own fully qualified declaration is introduced in Suggested.lean, so there is no Lean name collision.

The prescribed dependency command was run with this README, name EtaleHomotopyTypes, the supplied ORDER.txt and --movable. Exit 0; complete output:

    depcheck: 51 roadmaps, 589 edges, 0 problem(s)

There is no UPWARD, CYCLE or moved line. Every direct internal Needs edge was also read: the split §§3.9a–3.9c and §§5.3a–5.3b remove the former coarse dependencies. The 24 declared gaps are contracts, not unowned prerequisites. Neither the merge order nor any supplier file was edited.

### Headline inventory, Lean and padding

The following README headlines were compared with the module docstring and pinned carriers:

| README headlines | Why no acceptance signature can presently be written without constructing a missing carrier |
| --- | --- |
| §§0.2–0.5: Isaksen model, properness/strong fibrations, pointed and local-coefficient detection | Homotopy pro-local systems and their model/homotopy categories are not supplied at the pins. |
| §§1.2–1.5: subgroup covers, covering invariance/fibrations, equivariant base change | Native pro-coverings and their derived comparison objects are missing. |
| §§1.7–1.9: full faithfulness, maps into classifying pro-spaces, raw K(π,1) recognition | Pro-classifying spaces and raw homotopy-group carrier are missing. |
| §§2.1–2.3: derived materialization and its homotopy groups; nonabelian derived-limit vanishing | Unstable derived limit and nonabelian derived-limit carriers are missing. Ordinary abelian finite derived-limit vanishing is an input target, not a replacement headline. |
| §§2.6–2.10: absolute/relative orbit bijections and pointed isomorphism lifts | Pro-space homotopy categories and materialized transport are missing. |
| §3.0a: continuous profinite completion of a general pro-group | Native ordinary group completion exists; the general pro-group carrier and its full size/comparison interface do not. |
| §§3.4–3.6: arbitrary local coefficients, raw/finite π₁, field BG, finite étale base change | Rigid étale type and its comparison functors are missing. |
| §§3.7–3.8: Galois-equivariant transport and elementary-fibration sequence | The raw type, cover tower and homotopy-fiber comparison are missing. |
| §§3.9a–3.9c: finite étale product, profinite detection/effacement, raw products | Finite-étale fiber-functor fundamental group and raw homotopy carriers are missing. |
| §§4.0b–4.7: open arithmetic image, lifting/orbit/outer-map/open-image/product theorems | Scheme fundamental group, arithmetic structural maps and raw homotopy category are missing. |
| §§5.1,5.3a–5.3b: algebraic evaluation, smooth Čech and étale hypercover descent | Analytification/analytic-points functor and its diagonal Betti realization are missing. Arbitrary topological diagrams would change the statements’ objects. |
| §§6.2–6.3: completion universal property and coherent model comparison | Homotopy-coherent p-finite category and its Pro completion are missing. |
| §§6.5–6.9: finite-type materialization, graded realization, Betti–étale zigzag, mod-p comparison and automorphism naturality/strictification | Completion/materialization, rigid étale and analytic realizations, and coherent action objects are missing. |

Every item is named in Suggested.lean’s module docstring with its missing carrier. No statable omitted headline or forced stand-in was identified. The file is 70 lines, with exactly one import Mathlib, one module docstring, the required namespace and no declarations.

The prescribed lake env lean command was run on the actual Suggested.lean from the pinned content checkout, using the absolute input path required by the brief. It completed with exit 0 and empty output: no errors and no warnings, including no sorry warnings. No TauCeti import required an object-file build.

The declaration/signature inventory is empty. Consequently there are zero #check @ownName probes, zero lost-variable candidates and zero sorried theorems to test with simp, rfl, infer_instance or a single library lemma. This is an empty acceptance inventory for documented missing carriers, not evidence obtained by proving padding. The worker’s Unknown identifier lack error comes from two spurious #check @lack commands generated from docstring prose; it is not an elaboration failure of Suggested.lean. No test or package file was changed to accommodate that extractor.

## Not verifiable

- FGV remains settled uncertified. Appendix A.2.1–A.2.3, (A.9), Example A.10 and the stated pages for §§5.3a,6.4,6.6–6.9 could not be read legally from the supplied cache. The printed page/number/hypothesis checks for those locators are not certified. No renewed request was made.
- BK remains settled uncertified. XI 5.2, XI 7.1, IX 5.1 and IX 5.4 are cited as specified, without claiming to have checked their text. SS’s use of them and the distinct spectral-sequence/convergence contracts were read and tested.
- AM remains settled uncertified. Theorems 4.3 and 11.1 were not read. In particular the general noetherian-scheme extension in §3.9b is a proposed proof, not an assertion that SS states it.
- Fr remains settled uncertified. Proposition 5.9 and Theorem 11.5 were not read directly. IEt’s explicit uses and the supplied comparison interfaces were checked.
- Fifteen board-package READMEs returned HTTP 404 at the exact supplied commits: ArithmeticLocallySymmetricSpacesPartII (84a41ac), CompletedCohomologyAndLocalGlobalCompatibilityPartII (948c94c), CrystallineCohomologyPartII (84ea77e), EndoscopicTransferAndUnitaryTraceComparisonPartII (80a66cc), HigherHidaAndColemanTheory (da88512), LawrenceVenkateshMethod (9ee7ac3), OrdinaryAutomorphicFormsAndModularityLiftingPartII (7e88c38), PELModuliPartII (d4bb48d), PadicHodgeTheoryPartII (6502997), PadicLocalLanglandsForGL2QpPartII (3e0777d), RealSurfacePeriodIndex (875bca4), SchemeAndStackFoundationsPartII (accb0a0), ShimuraVarietiesPartII (57dc0a4), VStackSheavesAndLisseCategoriesPartII (0987ba7), VectorBundlesAndIsocrystalsPartII (b58d862). Ownership against those particular package versions was not checked. This does not imply that any package is absent. The five readable board heads and indexed roadmap repository heads were searched separately.
- Some displayed formulas in the SGA1 extraction are damaged. No claim of a source error was made from those ambiguous glyphs; Proposition XIII 4.6’s hypotheses and conclusion at SGA1 lines 12282–12294 were readable.

There are no newly missing source requests. The four uncertified lifetime keys were retained, rather than renamed or reopened.

## Source issues

- **Error** in SS at Appendix A.2.3, printed p. 858 (SS line 1652): the source says the relative-cylinder projection is a trivial fibration; it should be a weak equivalence, since a third unmarked point has non-Kan interval fiber; affects a stated result.
- **Misprint** in SS at the proof of Theorem A.8, printed p. 857 (SS line 1619): the source labels the product over chains as partial totalization; it should be the cosimplicial degree, with partial totalization imposing simplex maps and compatibility; affects the proof.
- **Misprint** in SS at the proof of Theorem A.13, printed p. 861 (SS line 1782): the source uses basepoint x for the loop group of Y; it should use y; affects nothing.
- **Gap** in SS at the proof of Proposition 2.4(c), printed p. 825 (SS line 365): the source asserts openness of the arithmetic image without an argument there; it should justify openness using finitely many geometric components and the open stabilizer of one component; affects the proof.
- **Error** in I01 at the proof of Proposition 17.1, preprint pp. 32–33 (I01 line 1658; correction identified at IStr line 538): the source uses an invalid simultaneous-level presentation in the properness argument; it should retain the intervening pro-isomorphism and use the corrected level argument; affects the proof.
- **Misprint** in DAG13 at the proof of Proposition 3.3.10, printed p. 84 (DAG13 line 3748): the source calls K(ℤ,1), K(ℤₚ,1) and K(ℤₚ/ℤ,1) simply connected; it should call them connected, retaining the trivial action in this abelian extension; affects nothing.
- **Misprint** in DAG13 at Theorem 3.4.12, printed p. 92 (DAG13 line 4146): the source introduces a characteristic-p field k unused in the statement; it should omit that clause; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f0dd15c618a38e5c1f736ec2c90432298e582fc5", "job": "REV-PKG-EtaleHomotopyTypes~2", "model": "gpt-6-astra", "worker": "chris-12"} -->
