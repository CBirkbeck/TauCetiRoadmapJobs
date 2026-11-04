<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1304#issuecomment-6399499648 -->
Review (codex) of 6b61554

Verdict: needs_changes

1. **F01** (P1) The cited topology section does not supply the fiber exact sequence

   **Location:** `packages/EtaleHomotopyTypes/README.md:587`: “AlgebraicTopology Stage 8 (homotopy-fiber exact sequence)”; repeated in the Layer 3 dependencies at line 642.

   **Claim:** The ordinary homotopy-fiber exact-sequence input to §3.8 is supplied by AlgebraicTopology Stage 8.

   **Witness:** `TauCetiRoadmap/AlgebraicTopology/README.md:1610` states the sequence for based NDR/cofibration pairs; line 110 assigns fibration LES ownership elsewhere. `TauCetiRoadmap/StableHomotopyKTheory/README.md:565` explicitly supplies the homotopy-fiber sequence.

   **Exact repair:** Extend the existing StableHomotopyKTheory contract to import §§2.3–2.6: strict-fiber/homotopy-fiber comparison with the Serre/Hurewicz distinction, boundary maps, exactness and the low-degree action. Name GeneralizedCohomology §G2.10 for the mapping-path carrier used by those sections. Replace the incorrect parenthetical in §3.8 and Layer 3's dependencies by these actual suppliers; retain AlgebraicTopology Stage 8 only for its Kan/cubical homotopy comparison where needed. In the route, distinguish this ordinary input from the étale pro-fiber comparison and passage through the cover tower, which remain §3.8's target, supported by SS's proof and the explicitly uncertified Friedlander locator. No additional generic LES target or gap is needed.

   The supplier copies were checked at main or the indexed new-roadmap head. StableHomotopyKTheory precedes this package in the merge order. Its §§2.4–2.6 state precisely the boundary, exactness and pointed-set action missing from the cited Stage 8. GeneralizedCohomology §G2.10's mapping-path and LES comparison is at `TauCetiRoadmap/GeneralizedCohomology/README.md:555` and line 621. The richer open revision of the existing DGFloer roadmap was not substituted for its main copy.

   **Repair test:** For the based map *→BS₃, the homotopy fiber has the homotopy type of the discrete six-element S₃. The relevant segment is 1→S₃→S₃→1, with boundary the identity and the regular S₃ action; the fiber end is a pointed set. For id:BS₃→BS₃ the fiber has one component and the boundary is trivial. These are the actual fiber statements of the replacement supplier. The étale product fibration Gₘ×Y→Y still gives kernel ℤ̂(1) and the split sequence when Y is raw K(π,1); its general boundary term π₂(Y) is retained. This is supplier drift under the review's P1 rule, not a claim that §3.8's mathematical conclusion is false.

2. **F02** (P3) The completion test family is small, not finite

   **Location:** `packages/EtaleHomotopyTypes/README.md:852`: “Take the BHH finite test set K_p”.

   **Claim:** The displayed family of all finite discrete spaces, BCₚ and K(Cₚ,n) for every n≥2 is a finite set.

   **Witness:** BHH line 2437, Definition 7.3.2, internal p. 69, specifies a small set of representatives. The objects K(Cₚ,n) have different nonzero homotopy degrees for every n≥2.

   **Exact repair:** Replace “finite test set” by “small set of p-finite test objects”; keep every finite discrete space and every n≥2. No theorem or coefficient range changes.

   **Repair test:** For p=2 or 3, K(Cₚ,2) has (π₂,π₃)=(Cₚ,0), whereas K(Cₚ,3) has (0,Cₚ), so even these two tests are distinct. More generally, bounding the test degrees by N misses K(Cₚ,N+1)→*: maps into the listed tests of degree at most N agree, but H^(N+1) is Cₚ versus 0. The proposed wording retains the unbounded family and avoids that interpretation.

Two findings: one P1 supplier-attribution defect and one P3 terminology correction. The three preceding findings are repaired. No counterexample to a headline theorem was found. The package's scope remains repairable; no narrowing of its theorems is requested.

## Verified sound

### Previous findings, checked before the new pass

The preceding review's active findings were F01–F03. None was marked not actionable in this package. Each repair was verified against its cited source or supplier, and the same patterns were searched throughout the package.

| Previous finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01: duplicate simplicial-model gap | Repaired | README:95: “Section F6.5 supplies the monoidal model axiom for the fixed Cartesian Kan–Quillen base”. The old gap is absent from both README and the plan's top-level gaps. BordismFormalGroups:1571–1574 supplies this axiom; GeneralizedCohomology:213–242 supplies the model and mapping objects. The new tensor–Hom argument and its boundary/endpoint examples are checked below. Properness remains a separate gap. |
| F02: general projective compactification overclaim | Repaired | README:137: “Section 5.5 supplies local-isomorphism-compatible resolution of arbitrary reduced finite-type schemes”. README:593: “No reducedness, separatedness or quasi-projectivity is imposed on T.” The route first reduces T and uses general resolution; projective closure and SNC compactification are restricted to their actual quasi-projective scopes. The full finite-type strong-desingularizability deduction is now an explicit target. Its SGA5 definition remains uncertified; that limitation is not a claim to have verified its unavailable text. |
| F03: A.13(b) page range | Repaired | README:454: “Theorem A.13(b), pp. 860–861; SS line 1743”. The same correction occurs at lines 438 and 446. SS line 1743 is the statement on printed p. 860; lines 1756–1786 are the proof on p. 861. The orbit calculation is 3 homomorphisms total, with orbit sizes 1 and 2, as the repair report correctly clarifies. |

The changed supplier paragraphs, §0.2 argument/Check, §3.9a statement/route/Checks, §§2.8–2.10 locators, §6.2 Needs line and layer dependency lists were reviewed again. The earlier review has computed rows for every numbered target and for the surviving gap contracts. Only those computed rows were relied on for unchanged, unsampled material; its blanket assurances about supplier citations were not inherited. R01 comes from resolving those citations afresh.

### Principles, shape and coverage

Read all 990 README lines, all 58 numbered targets and their 58 Needs lines, all 28 Checks blocks, the complete acceptance file, metadata, sources manifest and top-level gap records. The seven layers have Examples and Dependencies endings. Definition blocks have prose APIs and at least three Checks; the Checks were compared with their section's formulas. Shape was compared with main's AlgebraicTopology, GeneralizedCohomology and BordismFormalGroups.

The raw theory retains arbitrary abelian local coefficients, arbitrary small cofiltered indexing, nonsurjective transitions, nonreduced schemes and all primes in its characteristic-zero claims. Strict, raw and coherent p-profinite homotopy theories are kept distinct. Relative morphisms are explicitly in a slice of the homotopy category. No route-specific exclusion, computational algorithm, copied source passage, admitted data, empty predicate or `set_option` was found. Metadata is `topic = "math.AG"`. The manifest parses with 13 distinct lifetime source keys; no entry was changed or added during this review.

### Seeded source audit

All 15 requested targets were examined. Thirteen have readable supporting text; §5.1 and §5.3b have only the settled uncertified FGV locator. Additional unavailable secondary/primary inputs are distinguished below. Page numbers for I01, IC and BHH use the versions specified by the package, not journal pagination.

| Target | Text actually opened; hypothesis and locator check | Outcome |
| --- | --- | --- |
| 0.1 Homotopy pro-local systems | I01 lines 281–342, §§4–5, preprint pp. 6–8: local systems are represented at a stage with filtered pullback Hom sets; Π₁ is group-valued and Πₙ abelian for n≥2. Lines 574–587, Corollary 7.5, pp. 12–13, support the pointed comparison. | Supports the construction and coefficient convention. |
| 0.5 Local-coefficient detection | I01 lines 1658–1695, Proposition 18.4 and proof, pp. 34–35, continuing on p. 36. The π₀, Π₁ and all-local-system cohomology requirements are separate. | The README retains all three conditions and the filtered-colimit interpretation. |
| 1.9 First classifying morphism | SS lines 1953–1964, Definition A.17 and Corollary A.18, printed p. 866. Connected pointed input; the class corresponds to id on π₁. | Both directions of recognition and the actual classifying map agree. |
| 2.3 Profinite pro-space homotopy groups | SS lines 1611–1638, Theorem A.8 and proof, pp. 857–858. π₀ is terminal and every positive homotopy pro-group is profinite; no uniform Postnikov bound. | Statement supported. The corrected totalization route is appropriate; BK's quoted convergence theorems remain unread. |
| 2.4 Endpoint-preserving cylinder | SS lines 1648–1654, Appendix A.2.3, p. 858. The source's fibration assertion fails on the explicit third-vertex test. | The package correctly states a weak equivalence and a relative cylinder; source error recorded below. |
| 2.7 Pointed isomorphism lifts | SS lines 1693–1701, Corollary A.11 and proof, p. 859. The proof lifts the specified isomorphism, not merely some isomorphism. | Supports the stronger map-specific phrasing. Pointed reflection of equivalences does not require a new connectedness hypothesis on the source. |
| 2.8 Relative pointed surjection | SS lines 1736–1742 and 1773–1780, Theorem A.13(a), pp. 860–861. Path-connected Y and B and surjective materialized π₁ are explicit. | Correct slice convention and hypotheses. |
| 2.9 Relative isomorphisms lift | SS lines 1783–1786, Theorem A.13(a)'s final argument, p. 861. | Correctly reflects the lifted map's invertibility, including the inverse triangle. |
| 2.10 Stabilizer quotient | SS lines 1743–1753 and 1781–1786, Theorem A.13(b), pp. 860–861. | Uses the full preimage of the structure-map stabilizer, not just the geometric kernel. |
| 3.8 Elementary fibrations | SS lines 433–462, Proposition 2.8 and its proof, pp. 827–828: smooth characteristic-zero elementary fibration, affine geometric fibers, finite-Galois cover tower, all primes and higher-group comparison. | The proof contains the long exact sequence beyond the proposition's K(π,1) conclusion. Fr 11.5 itself is unread. R01 concerns the separate topology supplier attribution. |
| 4.5 Outer fundamental-group map | SS lines 329–390, Proposition 2.4, subsequent completion discussion and Corollary 2.5, pp. 825–826. | Target geometric unibranchness, geometric connectivity and strong center-freeness are retained; source need not be geometrically unibranch. |
| 4.7 Maps into products | SS lines 467–490 and the continuation on p. 829, Lemma 2.9, pp. 828–829. | Characteristic zero, strong center-freeness, both target hypotheses and disconnected-source reduction agree. |
| 5.1 Algebraic evaluation | FGV Lemma A.7, p. 306, and Definition A.8, p. 307: settled uncertified. | No textual certification. The evaluation, gluing, zero-ring and unit examples were checked mathematically. |
| 5.3b Analytic hypercover descent | FGV Appendix A.2.3, pp. 309–310: settled uncertified. | No textual certification. The locally finite-type analytic domain, finite matching products and local sections resolve through the actual ComplexComparisonPartII contract and the declared realization gap. |
| 6.2 p-profinite completion | IC lines 185–190, 198–235, Theorem 2.2, Definition 3.1 and Theorem 3.3, pp. 4–5; BHH lines 2437–2438, 2480–2512, Definition 7.3.2, Proposition 7.3.6 and Corollaries 7.3.7–7.3.8, pp. 69–71. | Supports test-object localization, nilpotent fibrant objects and coherent p-finite Pro comparison. R02 corrects the family cardinality. FGV's additional locator remains unread. |

For the repairs, also opened I01 lines 1527–1557 for the tensor–Hom/pushout-product argument; I01 lines 1563–1590 and IStr lines 494–539 for properness and its correction; SGA1 lines 12282–12299 for XIII Proposition 4.6(a), printed p. 310. SGA1 explicitly requires strong desingularizability of finite-type schemes through the dimension bound; it does not assert general projective compactification. For the finite-type headline, DAG13 lines 3708–3737 and 4134–4150 retain the H⁰ unit, H¹ vanishing and finite dimension in every degree.

### Computed adversarial table

These are explicit mathematical tests, not claims that the eventual proofs are formalized. Cₙ is cyclic of order n. Ordinary group limits, pro-groups and coherent mapping spaces are distinguished. The table covers the sampled targets, headlines and every finding/repair target. The other unchanged definition/API targets retain the earlier review's computed rows, which were read and checked against the unchanged wording.

| Statement | Instances tried | Values computed on both sides, or rejected model | Result / change |
| --- | --- | --- | --- |
| Conjugation, path order and coefficients | S₃ with α=(123), β=(12); circle sign/trivial ℤ | α(12)α⁻¹=(23), then β(23)β⁻¹=(13); conjugation by βα gives (13). Sign differential −2 gives H⁰=0,H¹=C₂; trivial differential 0 gives ℤ,ℤ. | Agrees with StableHomotopyKTheory's edge(gh) order and the direct-coefficient supplier. |
| 0.1 Pro-local systems | Constant point, circle and two points | Positive homotopy: 0 for point; π₁=ℤ, higher 0 for circle. Two-point π₀ has cardinality 2; deleting one gives cardinality 1. | One basepoint does not detect another component; sign transport sends 1 to −1 rather than 1. |
| 0.2 Raw model versus strict | K=∏ₙ≥1 K(ℤ,n) and its Postnikov tower | For fixed i, pro-πᵢ eventually equals ℤ on both sides. At stage m the (m+1)-group is ℤ→0. | Raw equivalence does not assert a strict equivalence. |
| 0.2 Repaired simplicial axiom | ∂Δ¹→Δ¹ versus an endpoint, target BC₂ | Boundary mapping fiber is discrete C₂, with 2 components. Endpoint mapping fiber has 2 objects and 4 arrows, one between each ordered pair, hence π₀=1 and higher π=0. | Tensor–Hom imports the existing axiom; the first map is not trivial, the second is. |
| 0.3 Properness | Identity pulled back through the double circle cover; product pullback with K(ℤ,2) | Identity pullback induces id on 2ℤ. Product pullback and product model both have π₁=2ℤ, π₂=ℤ. | No simultaneous favorable level presentation is inferred; IStr repair retained. |
| 0.4 Pointed detection | Identity circle; S²→*; BC₂→BS₃ | π₁ identity is ℤ→ℤ; sphere π₂ is ℤ→0; group map has image order 2 in order 6. | Accepts the first, rejects the latter two. |
| 0.5 Local detection | Circle→point; BC₃→* at F₂ | Circle H¹: ℤ versus 0. BC₃ and point have F₂-cohomology (F₂,0,…), but π₁ values C₃ and 1. | Full criterion has neither a missing π₁ condition nor a single-prime substitute. |
| 1.2 Subgroup-cover representability | ℤ, 2ℤ and 0 in circle π₁; maps of degrees 3 and 4 | Cover degrees 1,2,∞. 3ℤ is not contained in 2ℤ, so 0 pointed lifts; 4ℤ is contained, so 1 pointed lift. | Both implications and infinite-index range pass. |
| 1.3 Covering equivalence | Circle and its one-type; subgroup nℤ | Fiber size n and deck group Cₙ on both sides; subgroup 0 has infinite fiber on both sides. | Checks covering morphisms as well as objects. |
| 1.4 Coverings are fibrations | Double circle cover; Sing(S¹)→* | Cover fiber has 2 points and one simplex lift per chosen vertex. The second map admits multiple paths with the same starting vertex. | The converse is not asserted. |
| 1.5 Equivariant base change | Identity circle map pulled to degree-2 cover | Lift is identity; H¹ map is +1:ℤ→ℤ. Deck rotation also gives +1, so both composites give +1. | Deck-equivariant existence, without false uniqueness. |
| 1.7 Full faithfulness | C₂→S₃ | Hom set has 4 elements: trivial map and 3 transposition images; pointed BG map set also has 4. | Nonabelian target distinguishes pointed from outer maps. |
| 1.8 Maps into BG | S¹→BC₃; S²→BG | Pointed map counts 3=Hom(ℤ,C₃) and 1=Hom(1,G). | Higher source homotopy creates no extra classes into a one-type. |
| 1.9 Classifying morphism | Point, circle, S² | First two have πₙ=0 for n≥2 and classifying equivalences. S² has π₂=ℤ, whereas Bπ₁(S²)=* has π₂=0. | Both directions of recognition tested. |
| 2.1 Materialization | Constant two points; diagram *→{0,1} with image 0 | Constant Mat has 2 components. Diagram has 2 independent degree-zero choices but exactly 1 compatible totalization point. | Corrects the source's partial-totalization notation. |
| 2.2 Derived limits | Constant C₂, zero-transition C₂, finite-subset diagram C₂^F; ℤ with ×2 | Limits are C₂,0,C₂^ℝ, respectively; positive derived limits are 0. Integer tower has lim=0 and lim¹=ℤ₂/ℤ, with [1/3] nonzero. | Finiteness matters; neither countability nor surjective transitions is imposed. |
| 2.3 Profinite materialization | B(C_(pʳ)), p=2,3; B(ℤ←×2ℤ) | Finite-group tower: π₀=1,π₁=ℤₚ,higher 0. Integer tower: π₀=ℤ₂/ℤ, not 1. | Profinite hypothesis separates the countermodel. |
| 2.4 Relative cylinder | Two marks; two marks plus one unmarked vertex | First cylinder has 2 vertices. Second is two isolated vertices plus Δ¹: 3 components, with a directed edge lacking an inverse. Projection has 3 components on both sides but a non-Kan interval fiber. | Weak equivalence, not generally fibration. |
| 2.6 Absolute monodromy quotient | BC₂→BS₃ | Pointed maps 4; orbit sizes 1 and 3; unpointed maps 2. | Quotient gives 2=2. |
| 2.7 Isomorphism lifting | Self-equivalences of BC₂ and BC₃ | Automorphism counts 1 and 2; inner actions trivial; unpointed counts also 1 and 2. | Every isomorphism class has the required lift. |
| 2.8 Relative surjection | BC₃→BS₃ over sign BS₃→BC₂, trivial source structure | All 3 homomorphisms land in A₃; conjugation has 2 orbits. | Forgetful map 3→2 is surjective, not injective. |
| 2.9 Relative isomorphisms | BS₃ with its sign structure | Six inner automorphisms preserve sign and become one unpointed identity class. Each inverse again preserves sign. | Lift stays invertible in the relative category. |
| 2.10 Relative stabilizer | Same BC₃/BS₃/BC₂ diagram | S_X=C₂ and Δ_XY=S₃; full quotient has 2 elements. Kernel A₃ fixes all 3 maps. | Full stabilizer preimage is essential; repaired pages correct. |
| 3.0a Pro-group completion | Constant 1,ℤ,S₃; tower ℤ←×2ℤ | Completions 1,ℤ̂,S₃. Tower's completed limit is ∏_(ℓ odd)ℤ_ℓ, with 3 maps to C₃; pro-Hom also has 3. Completing its abstract limit 0 gives only 1. | Substantive pro-level adapter; native ordinary completion is reused. |
| 3.4 Coefficient comparison | Complex point with A; real point with ℤ and C₂ | Complex H⁰=A,higher 0. Real integral H¹=0,H²=C₂; mod-2 Hᵐ=C₂ for every m≥0 on group and étale sides. | Arbitrary constant coefficients remain present. |
| 3.5 Raw/finite groups and fields | ℂ,ℝ,F_q; complex dual point | Groups 1,C₂,ℤ̂,1; all field higher raw groups vanish. Completion preserves these finite-quotient pro-groups. | Nilpotent invariance and field BG agree. |
| 3.6 Finite-cover base change | Spec ℂ→Spec ℝ and its self-pullback | Contractible degree-2 cover of BC₂; self-pullback has 2 components on both scheme and pro-cover sides. | Degree and deck action retained. |
| 3.7 Galois cohomology transport | Identity Gₘ/ℝ with C₃ coefficients | Geometric H¹=C₃; conjugation sends 1 to −1=2. Comparison sends 1 to 1; both equivariance composites give 2. | Actual action, not an abstract group isomorphism. |
| 3.8 Elementary-fibration sequence | Gₘ and A¹ over ℂ; product Gₘ×Y→Y | Geometric π₁ kernels ℤ̂(1) and 0. For the product with raw K(π,1) base, π₁ total is ℤ̂(1)×π₁Y and projection kernel ℤ̂(1). P¹ with empty boundary is not affine. | Mathematical sequence passes; supplier repair R01. |
| 3.8 Ordinary fiber input / R01 | *→BS₃ and id:BS₃→BS₃ | First fiber has 6 components and boundary S₃→S₃ is id; second fiber has 1 component and boundary is trivial. | Explicit replacement supplier handles fiber exactness and the action, not only based pairs. |
| 3.9a Finite étale products | Gₘ²/ℂ; Y×Spec k; Spec ℝ×_ℝSpec ℝ | Groups ℤ̂²; π₁Y via g↦(g,p(g)); diagonal C₂ of order 2. Ordinary direct product in the last case would have order 4. | Arithmetic fiber product is essential. |
| 3.9a General resolution repair | Doubled-origin line; Gₘ; empty and dual point | Doubled line has 2 DVR extensions and identity resolution with 0 exceptional components; a projective open embedding would allow at most 1 extension. Gₘ⊂P¹ has 2 boundary points. Empty reduction stays empty; dual point reduces to 1 smooth point with 0 boundary components. | General resolution is separated from quasi-projective compactification; no dense-open smooth resolution of a generically nonreduced scheme is asserted. |
| 3.9b Effacement and detection | Separably closed point/dual point; P¹; BC₃→* at F₂ | First two have positive cohomology 0. P¹ has H²(C₂)=C₂ surviving every surjective finite étale cover. BC₃'s F₂-cohomology agrees with point but π₁ does not. | Surjectivity, all finite local systems and profinite homotopy scope retained. |
| 3.9c Raw products | Empty product; Gₘ², exponent-p pullback | Empty product is BG_k with higher π=0. Torus Fₚ-cohomology dimensions 1,2,1; pullback on H¹ multiplies by p=0 and H² by p²=0, for p=2,3. | Nonzero H² before pullback is consistent with raw K(π,1). |
| 4.0a–4.0b Arithmetic adapters | S₃, open A₃; separable/purely inseparable field extensions | Centers 1 and C₃, so S₃ is not strongly center-free. Arithmetic image indices are [k′:k] for finite separable k′/k and 1 for purely inseparable extensions; ℚ(i)/ℚ gives 2. | Center-free is insufficient; open image is not surjectivity. |
| 4.1 Pointed arithmetic lifting | Spec ℂ→Gₘ | Hom(1,ℤ̂) has 1 element; unpointed map set has 1 element. | Correct existence case. |
| 4.2 Arithmetic isomorphism lifts | Identity Gₘ/ℝ | +1 on geometric ℤ̂(1), id on arithmetic C₂; forgetting is still identity. | Relative lift remains an isomorphism. |
| 4.3 Geometric quotient surjection | Sections of ℤ̂(1)⋊C₂→C₂ | Sections indexed by a∈ℤ̂; geometric conjugation changes a by 2b, leaving 2 classes. | Keeps the geometric action without assuming the stronger bijection theorem. |
| 4.4 Arithmetic orbit bijection | G_ℂ=1; negative abstract BC₃/BS₃ model over BC₂ | Trivial base is strongly center-free. For C₂ base, geometric quotient has 3 elements and unpointed set 2. | Negative model fails the required hypothesis. |
| 4.5 Outer π₁ map | z↦z² and z↦1 on Gₘ/ℂ | Induced maps on ℤ̂ are ×2 and 0; outer classes are respectively 2 and 0. | Scheme map and homotopy-induced outer class agree. |
| 4.6 Open-image restriction | Powers 1,2,3 and constant map on Gₘ | Image indices 1,2,3,∞; first three open, zero subgroup not open. | Correct topological predicate. |
| 4.7 Product mapping | z↦(z²,z³); empty source | Pair (2,3)∈ℤ̂² projects to exactly 2 and 3. Empty-source cardinalities 1=1×1. | Actual projection bijection and disconnected boundary case pass. |
| 5.1 Evaluation | T=point,∅,[0,1]; X=A¹,Gₘ,dual point | Point/A¹ gives ℂ on both sides; empty T gives singleton Hom sets from the zero ring. 1+t has inverse 1/(1+t), while t vanishes at 0 and is not a unit. ε maps to 0 in C(T,ℂ). | Denominators and nonreduced test agree; FGV text unavailable. |
| 5.3a Smooth Čech descent | Two points→point; A¹→point; empty→point | Čech sizes 2,4,8; first two diagonals contractible. Empty augmentation gives 0 versus 1 components. | Surjectivity/local sections matter. |
| 5.3b Analytic hypercovers | ℕ points→point; nodal xy=0; dual point | Terms ℕ^(n+1), contractible diagonal. Node has π₀=1,higher π=0,tangent dimension 2. Dual point has one analytic point. | Infinite, singular and nonreduced pieces fit the stated domain. |
| 6.2 Completion / R02 | BC_q with q≠p; two points; K(Cₚ,2),K(Cₚ,3) | First completes to point; Map(BC_q,BCₚ)≃BCₚ=Map(*,BCₚ). Two points stay two. The Eilenberg–MacLane tests have (π₂,π₃)=(Cₚ,0),(0,Cₚ). | Universal property passes; the test family must remain unbounded and small. |
| 6.3 Coherent model comparison | Same BC_q→BCₚ mapping space | One component with π₁=Cₚ on both sides; the homotopy-category Hom set alone has only 1 element. | Mapping spaces cannot be replaced by sets of classes. |
| 6.5 Finite-type materialization | K(Cₚ,2), BCₚ, p=2,3 | First has H⁰=Fₚ,H¹=0,H²=Fₚ and comparison 1↦1. Second has H¹=Fₚ≠0. | Sufficient criterion accepts first; no necessity claim for every successful comparison. |
| 6.6 Graded realization | ℕ grades of points; one grade; no grades | Ordinary graded type ℕ has H⁰=∏ℕFₚ, H₀=⊕ℕFₚ. One grade keeps its type; no grades gives ∅. Ungraded completion instead materializes to βℕ. | Products/sums and completion order are distinct. |
| 6.7 Comparison zigzag | Point, labeled two points, simplicial BCₚ | Point cohomology map sends 1↦1; labels remain 2; BCₚ endpoints both have π₁=Cₚ, not 0 of X₀. | Actual maps retain labels and all simplicial directions. |
| 6.8 Mod-p comparison | P¹_ℂ and simplicial BCₚ | P¹ mod-p homology/cohomology dimensions 1,0,1, for p=2,3. BCₚ has H¹=Fₚ although its degree-zero scheme is a point. | Hypotheses concern total cohomological degrees. |
| 6.9 Automorphism naturality | Conjugation on Gₘ; σ∘τ on points | i↦−i; positive loop has degree −1, also nontrivial on ℤ₂(1). Composite sends z↦σ(τ(z)). Two constant labels remain fixed. | Sign, composition and equivariant comparison retained. |

The convention tests also cover rank/degree zero where applicable, empty inputs, identity maps, p=2 and 3, positive-characteristic fields, inseparability, nilpotents, nonabelian groups and non-finite/noncompact substitutes. No division by zero, natural-subtraction artifact or finite-degree cutoff was introduced. Conditions on schemes, coefficients, connectedness and universes are in the statements or standing conventions; there are no Lean binders that could silently drop them.

### Declared gaps

All 23 gap slugs occur once as a named supplier contract and have exactly matching `needs`, supplier and section records in `design/plan.json`. None is unowned. The removed `kan-quillen-simplicial` gap occurs in neither active list. The existing gaps are not findings.

Minimality was compared with the actual supplier scopes: Ind-opposite Pro does not provide the five requested larger-universe/cofinal/presentation results; ordinary CW and coefficient theory does not by itself supply the specified simplicial and unstable-limit interfaces; the monoidal model axiom does not assert properness; groupoid nerves being Kan does not state the surjective-homomorphism fibration criterion; ordinary Ind and stable-category enhancements do not provide the three coherent Pro contracts; bounded-below sheaf descent does not state topological hypercover realization; finite étale components do not cover every separated étale neighborhood; and the elementary-fibration carrier is distinct from existence of geometric neighborhoods. The precise sentences and the prior review's computed contract rows were checked, including n=0,1,2 Postnikov truncations, sign-system H¹=C₂, arbitrary finite-subset indices and the nonnormal C₂⊂S₃ coset test (cardinalities 2→6→3→1→1).

### Pinned-library evidence

Main read for this round is `ce9dea7a6e8c6f35d1d2994a627dd3946a310bd9`. Actual dependency checkouts agree with the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following declarations, bodies and relevant variable blocks were opened at those pins.

| Declaration(s) | File and line at the pin | Scope verified |
| --- | --- | --- |
| `SSet`; `SSet.KanComplex`; `hornFilling` | `Mathlib/AlgebraicTopology/SimplicialSet/Basic.lean:33`; `Mathlib/AlgebraicTopology/SimplicialSet/KanComplex.lean:40` and 45 | Body `SimplicialObject (Type u)`; native horn-fibrancy predicate, not a pro-model construction. |
| `HomotopicalAlgebra.ModelCategory` | `Mathlib/AlgebraicTopology/ModelCategory/Basic.lean:43` | Finite limits/colimits, CM2–CM5 and factorization existence; no chosen functorial factorization. |
| `TopCat.toSSet`, `toSSetObjEquiv`, `SSet.toTop`, `sSetTopAdj`, `toSSetIsoConst` | `Mathlib/AlgebraicTopology/SingularSet.lean:50`, 56, 65, 73, 97 | Explicit simplex universe lift. Constant comparison has `[TotallyDisconnectedSpace X]`; no compactness or nonemptiness assumption. |
| `CategoryTheory.Functor.diag`, `uncurry` | `Mathlib/CategoryTheory/Products/Basic.lean:292`; `Mathlib/CategoryTheory/Functor/Currying.lean:37` | Ordinary diagonal and uncurrying; no diagonal weak-equivalence theorem is contained in these definitions. |
| `Scheme.smallEtaleTopology`; `Sheaf.H` | `Mathlib/AlgebraicGeometry/Sites/Etale.lean:50`; `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:52` and 56 | Native site; H is Ext from the constant integral sheaf, with HasSheafify and HasExt binders. |
| `ContinuousMap.compRightAlgHom`, `evalAlgHom` | `Mathlib/Topology/ContinuousMap/Algebra.lean:700` and 853 | Precomposition and evaluation on continuous-function algebras; topological algebra assumptions, no analytification functor. |
| `CategoryTheory.Ind` | `Mathlib/CategoryTheory/Limits/Indization/Category.lean:70` | Shrunk-hom full subcategory of ind-objects, with its specified object/Hom universes; no supplied coherent Pro completion. |
| `Functor.rightDerived`; `HasInjectiveResolutions` | `Mathlib/CategoryTheory/Abelian/RightDerived.lean:58` and 108; `Mathlib/CategoryTheory/Preadditive/Injective/Resolution.lean:70` | Abelian/additive formalism; resolution class is Prop-valued existence, not chosen data. |
| `Limits.lim`; `Functor.additive_of_preserves_binary_products` | `Mathlib/CategoryTheory/Limits/HasLimits.lean:550` and 555; `Mathlib/CategoryTheory/Preadditive/AdditiveFunctor.lean:231` | Limit-existence binder; binary-product and zero-map preservation give additivity. |
| `ProfiniteGrp.profiniteCompletion`, `ProfiniteCompletion.homEquiv`, `adjunction` | `Mathlib/Topology/Algebra/Category/ProfiniteGrp/Completion.lean:191`, 205, 215 | Ordinary group completion and continuous-target adjunction. |
| `toFiniteQuotientFunctor`, `continuousMulEquivLimittoFiniteQuotientFunctor` | `Mathlib/Topology/Algebra/Category/ProfiniteGrp/Limits.lean:48` and 138 | Open-normal finite-quotient presentation and topological group equivalence with its limit. |
| `nonempty_sections_of_finite_cofiltered_system` | `Mathlib/CategoryTheory/CofilteredSystem.lean:79` | Nonempty finite fibers, cofiltered-or-empty category, arbitrary declared universes; no surjectivity requirement. |
| `TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system` | `Mathlib/Topology/Category/TopCat/Limits/Konig.lean:126` | Nonempty compact Hausdorff fibers and continuous maps; empty index permitted. |
| `TauCeti.LocalCoefficientSystem`, pullbacks, transport | `TauCeti/AlgebraicTopology/LocalCoefficient.lean:43`, 75, 102, 136, 252 | Body `FundamentalGroupoid X ⥤ ModuleCat R`; no rank, finiteness or reflexivity condition. |
| `twistedCochainComplex`, `twistedCohomology` | `TauCeti/AlgebraicTopology/Cohomology/Twisted/Basic.lean:79` and 84 | Body applies `linearYonedaObj` to twisted chains. It does not identify arbitrary direct coefficients with their double dual. |
| `exists_forall_map_eq_of_compact_t2`, `exists_forall_map_eq_of_finite` | `TauCeti/Topology/Compactness/InverseSystem.lean:78` and 96 | Directed-preorder versions; compact Hausdorff or finite nonempty fibers, no surjective-transition assumption. |
| `ProfiniteCompletion.etaFn_bijective_of_finite`, `continuousMonoidHomEquiv` | `TauCeti/Topology/Algebra/Group/Profinite/Completion.lean:68` and 179 | Finite-group unit bijection and continuous-target property across target universes. |
| `TauCeti.IsTopologicallyFinitelyGenerated` | `TauCeti/Topology/Algebra/Group/Generation.lean:73` | Finite subset generates a dense subgroup; not abstract finite generation. |
| `IsProP.exists_continuousMulEquiv_pi_padicInt_prod_pi_zmod` | `TauCeti/Topology/Algebra/Group/Profinite/ProP/StructureTheorem.lean:53` and 59 | Prime, compact totally disconnected commutative topological group, pro-p and topological finite-generation assumptions. |

Object searches over both entire pins found no native pro-local-system, rigid-hypercover, p-profinite homotopy, nonabelian derived-limit or scheme-analytification carrier that would make an omitted headline immediately statable. Ordinary group completion, finite quotients, local coefficients, singular sets and sheaf cohomology are correctly consumed rather than reconstructed.

### Supplier resolution, ownership and direction

The roadmap service was used to read suppliers at main or indexed new-roadmap heads and to search objects across main and all 363 indexed open roadmap pull requests. Broad searches were followed with an untruncated focused search, including pro-local systems, rigid/pro-simplicial types, coherent Pro, cofinite presentations, derived limits, p-profinite types, hypercovers, monoidal axioms and resolution. Existing-roadmap revisions were not treated as new suppliers. The board package index was read first; local packages and the four readable indexed board-head READMEs were searched separately.

| Supplier | Resolved consumption in its README |
| --- | --- |
| AdicSpacesPartII | `TauCetiRoadmap/AdicSpacesPartII/README.md:7793`, §R0.19.9: Ind-opposite carrier, Hom formula, stage representatives/naturality, finite limits and cofiltered flattening. |
| PerfectoidSpaces; DiamondsAndVStacks | `TauCetiRoadmap/PerfectoidSpaces/README.md:14654`, §P6.10; `TauCetiRoadmap/DiamondsAndVStacks/README.md:1255`, §D0.13: one bounded-presentation carrier, with all arrows counted. |
| AlgebraicTopology | `TauCetiRoadmap/AlgebraicTopology/README.md:1011`, Stage 6.1: arbitrary direct local cochains; Stage 8 at 1602, Kan comparison at 1654, Whitehead at 1700, obstruction theory at 1870. R01 distinguishes pair exactness from fiber exactness. |
| Completed/UniversalCovers | `Completed/UniversalCovers/README.md:98`, Stages 2–4: subgroup classification, pointed/unpointed distinction, deck normalizer quotient, covering-induced higher homotopy. |
| GeneralizedCohomology | `TauCetiRoadmap/GeneralizedCohomology/README.md:213`, G2.1: Kan–Quillen/pointed model, mapping objects, realization–singular comparison. G2.10 provides the proposed R01 replacement's mapping-path input. |
| BordismFormalGroups | `TauCetiRoadmap/BordismFormalGroups/README.md:1571`, F6.5 fixed Cartesian monoidal model axiom; 2005–2034 coherent model diagrams, including Kan-complex and group-indexed instances with restrictions and unit/counit. |
| StableHomotopyKTheory | `TauCetiRoadmap/StableHomotopyKTheory/README.md:304`, §§1.19–1.23; 412 onward, §§1.28–1.34: coverings, translation categories, nerves and the edge-composition convention. §§2.3–2.6, 538–577, resolve R01. |
| Orbifolds | `TauCetiRoadmap/Orbifolds/README.md:314`, O4 item 3/O4-N: numerable-submersion Čech descent by actual local sections and partitions of unity. |
| EnhancedDerivedSheaves | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:191`, E0.2–E0.5; 376, E0.8: coherent and size infrastructure, including its express imports from BordismFormalGroups. E2.6 at 2293 includes degree-zero matching and uniformly bounded-below sheaf descent. |
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:848`, §§0.9–0.12: approximation, unibranchness, neighborhoods; 3631, §2.10 site comparison; 3867, §2.15 qcqs affine-transition cohomology continuity with compatible sheaves. |
| EtaleCohomologyFoundations | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:200`, F.0.2 finite-cover Galois categories; F.0.4 at 248 topological invariance; F.0.A2 at 368 arithmetic sequence; F.2.6 at 645 finite-coefficient Künneth with Tor/invertibility conditions. |
| ComplexComparisonPartII | `TauCetiRoadmap/ComplexComparisonPartII/README.md:699`, C−1.1; locally finite-type functor and APIs at 749–755, including infinite gluing, finite products, nilpotents, étale local isomorphisms and smooth charts. C5.1 at 2337 and C6.1–C6.3 at 4047,4137,4168 provide coefficient, finite-cover and Artin comparisons. |
| ResolutionOfSingularitiesCharacteristicZero | `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:672`, §§5.1–5.4; §5.5 at 718; §§6.1–6.2 at 758,770. General reduced resolution is distinct from reduced quasi-projective closure and smooth quasi-projective SNC compactification. |
| ProfiniteProPGroups | `TauCetiRoadmap/ProfiniteProPGroups/README.md:125`, Layer 0 completion/compactness; Layer 3 at 306 pro-p structure; Layer 4's abelian structure block at 642. Native declarations are named, not new constructions here. |

The resolver's four unresolved-name leads were checked: three are genuine future API names in ComplexComparisonPartII C−1.1, at lines 753 and 755, not asserted pinned declarations. `sources.toml` is a filename. The resolver reported no missing cross-roadmap name; R01 demonstrates why existence of a section alone does not certify the attributed theorem.

AnabelianGeometryAndNonabelianChabauty's open README still states raw types/comparison at §§1.5–1.6 (`TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:3263`) and the elementary-fibration pro-sequence at §1.10 (3611). It is later in the merge order. Record the ownership move of these general constructions to this package's §§1.9,3.3–3.5,3.8–3.9b; the later roadmap consumes them and retains its geometric/application work. This uses the brief's permitted ownership move, not an upward supplier citation. InverseGaloisAndArithmeticFundamentalGroups is likewise a later consumer. EllAdicHomotopyTypesAndWeights and ArithmeticKTheoryPartII have readable local design READMEs, covering respectively coefficient-form/weight constructions and graded spectrum/action applications; they were not treated as nonexistent when the roadmap service did not expose their folders. MotivicEtaleKTheory's indexed head was inspected; its cycle/Deligne/motivic work does not supply a second raw pro-space model. No own Lean declaration exists here, so no fully qualified name collision is possible.

The exact required dependency command completed with exit 0. Complete output:

    depcheck: 52 roadmaps, 591 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. ORDER places StableHomotopyKTheory at 4, ResolutionOfSingularitiesCharacteristicZero at 6, ComplexComparisonPartII at 43 and this roadmap at 44; the named consumers occur at 50,197,198 and 222. R01's replacement suppliers are already permissible. Internal Needs lines were read individually; no backward target edge or coarse layer cycle was found. No merge-order or supplier file was edited.

### Headline inventory, elaboration and padding

| Headline theorems in README | Missing carrier identified in Suggested.lean's module docstring |
| --- | --- |
| §§0.2–0.5: Isaksen model, properness/strong fibrations, pointed/local detection | Pro-local systems, cohomology and pro-space model/homotopy categories. |
| §§1.2–1.5: subgroup covers, covering invariance/fibrancy, equivariant base change | Pro-coverings and their derived comparison objects. |
| §§1.7–1.9: BG full faithfulness, representability and raw K(π,1) recognition | Classifying pro-spaces and raw homotopy groups. |
| §§2.1–2.3: derived materialization, nonabelian finite derived-limit vanishing, homotopy-group comparison | Unstable materialization and nonabelian derived-limit carriers. The statable abelian input is not a replacement headline. |
| §§2.6–2.10: monodromy orbits and absolute/relative isomorphism lifting | Pro-space homotopy categories and materialized transport. |
| §3.0a: continuous completion universal property for pro-groups | General pro-group carrier and its unit/comparison interface; native ordinary completion alone is insufficient. |
| §§3.4–3.8: coefficients, raw/finite groups, fields, finite-cover base change, Galois transport and elementary-fibration sequence | Rigid étale type, cover tower and fiber comparison. |
| §§3.9a–3.9c: finite étale product, profinite detection, effacement and raw products | Scheme fiber-functor fundamental group and raw type. |
| §§4.0b–4.7: open arithmetic image, lifts, orbit/outer-map/open-image and product results | Scheme fundamental group, arithmetic structural maps and raw homotopy category. |
| §§5.1,5.3a–5.3b: algebraic evaluation and scheme descent | Scheme analytification/analytic-points functor and diagonal Betti realization. |
| §§6.2–6.3: completion universal property and model comparison | Coherent p-finite category and its Pro construction. |
| §§6.5–6.9: finite-type/graded materialization, Betti–étale zigzag, mod-p comparison and automorphism naturality/rectification | Coherent completion/materialization, rigid/analytic realization and action carriers. |

All these headlines are named with missing carriers in the module docstring. None is forced through a free predicate, a shortened theorem, a heavy admitted definition or a stand-in. The newly explicit strong-desingularizability adapter is a proof input, not a surrogate acceptance headline.

Ran `lake env lean` on the actual `packages/EtaleHomotopyTypes/Suggested.lean` from the required pinned content checkout: exit 0, empty output, no errors and no warnings. There is exactly one `import Mathlib`, no TauCeti import requiring a build, one module docstring and the required namespace.

Mechanically removed comments and enumerated declarations: zero definitions, instances, opaques or theorems. A scratch copy with the resulting zero `#check @name` probes was elaborated successfully, exit 0 and empty output. Thus there are zero inferred binder types to compare, zero lost-hypothesis candidates and zero sorried theorems for the one-tactic probe. No padding deletion is needed. The acceptance file's empty theorem inventory is justified by its actual missing carriers; elaboration is not offered as evidence of their mathematical truth.

## Not verifiable

- FGV remains settled uncertified: Lemma A.7, Definition A.8, Appendix A.2.1–A.2.3, Example A.10 and the graded/action applications. Its numbering, pages and exact hypotheses could not be certified from text; in particular the sampled §§5.1 and 5.3b are not text-verified.
- BK remains settled uncertified: XI 5.2, XI 7.1, IX 5.1 and IX 5.4. SS's invocation and the separate spectral-sequence/convergence contracts were read; the book's text was not.
- AM remains settled uncertified: Theorems 4.3 and 11.1. The general noetherian-scheme effacement extension is a target with a proposed route, not a claim that SS's variety statement already proves it.
- Fr remains settled uncertified: Proposition 5.9 and Theorem 11.5. SS's use of the all-prime fibration theorem was read, but the primary text was not.
- SGA5 remains settled uncertified: Exposé I §3.1.5. SGA1's required premise is readable; the definition itself and therefore the exact source-level content of the new strong-desingularizability adapter are not text-certified.
- Fifteen board-package README requests returned HTTP 404 at the exact supplied heads: ArithmeticLocallySymmetricSpacesPartII `c1b8f80`; CompletedCohomologyAndLocalGlobalCompatibilityPartII `777a863`; CrystallineCohomologyPartII `84ea77e`; EndoscopicTransferAndUnitaryTraceComparisonPartII `78eadae`; HigherHidaAndColemanTheory `519048f`; LawrenceVenkateshMethod `9ee7ac3`; OrdinaryAutomorphicFormsAndModularityLiftingPartII `7e88c38`; PELModuliPartII `d4bb48d`; PadicHodgeTheoryPartII `6502997`; PadicLocalLanglandsForGL2QpPartII `3e0777d`; RealSurfacePeriodIndex `875bca4`; SchemeAndStackFoundationsPartII `accb0a0`; ShimuraVarietiesPartII `57dc0a4`; VStackSheavesAndLisseCategoriesPartII `0987ba7`; VectorBundlesAndIsocrystalsPartII `b58d862`. Ownership against those specific package versions was not checked. Four exact heads were readable and searched: AnalyticNumberTheory `310e834`, AutomorphicCongruences `08f531f`, KatoEulerSystems `0590194`, LogicAndDefinabilityInNumberTheory `888e10d`. No absence conclusion was drawn from a 404.
- Ownership against named open pull requests was checked through the supplied service's indexed README/Lean contents, not through independently supplied sibling checkouts. No additional unavailable heads were sought outside that index.
- Some SGA1 display glyphs are extraction-damaged; no error was inferred from those glyphs. XIII Proposition 4.6's hypotheses and conclusion were readable.

No settled source was requested again, and there is no new missing-reference request. The author files and sources manifest were left unchanged.

## Source issues

- **Error** in SS at Appendix A.2.3, printed p. 858 (SS line 1652): the source says the relative-cylinder projection is a trivial fibration; it should be a weak equivalence, since an unmarked third vertex has non-Kan interval fiber; affects a stated result.
- **Misprint** in SS at the proof of Theorem A.8, printed p. 857 (SS line 1619): the source labels a product over index chains as partial totalization; it should label the cosimplicial degree and impose simplex-map compatibility in partial totalization; affects the proof.
- **Misprint** in SS at Appendix A.2.3, printed p. 858 (SS line 1662): the source numbers the two transported basepoints with indices one and two; it should use zero and one, matching the following path's endpoints; affects nothing.
- **Misprint** in SS at the proof of Theorem A.13, printed p. 861 (SS line 1782): the source attaches the source basepoint to the loop group of the target; it should use the target basepoint y; affects nothing.
- **Error** in I01 at the proof of Proposition 17.1, preprint pp. 32–33 (I01 line 1568): the source uses a simultaneous favorable level presentation in the properness argument; it should insert an intervening pro-isomorphism before the levelwise properness argument; affects the proof; corrected in print at IStr, proof of Theorem 4.15 and Remark 4.16 in the cited preprint, pp. 11–12, published Remark 4.14.
- **Misprint** in DAG13 at the proof of Proposition 3.3.10, printed p. 84 (DAG13 line 3748): the source calls its three degree-one Eilenberg–MacLane spaces simply connected; it should call them connected, with trivial action for this abelian extension; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "6b61554024aaa094ee3775ff2cdef4fb2564580b", "job": "REV-PKG-EtaleHomotopyTypes~3", "model": "gpt-6-astra", "worker": "chris-20"} -->
