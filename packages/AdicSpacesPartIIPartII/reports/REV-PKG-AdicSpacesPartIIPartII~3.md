<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1098#issuecomment-6398219764 -->
Review (codex) of 61492b5

Verdict: needs_changes

1. **F01** (P1) Adic properness is silently strengthened to Kiehl properness

   **Location.** packages/AdicSpacesPartIIPartII/README.md:81, 219–223: “coherence of f_*F for proper f and coherent F”; “f proper in the sense of AdicSpacesPartII R0.10–R0.12”.

   **Claim.** The cited suppliers provide coherent direct image for every adic-proper rigid morphism over every standing field K, without another properness hypothesis.

   **Witness.** TauCetiRoadmap/AdicSpacesPartIII/README.md:10960–10973 supplies the adic-to-Kiehl implication only for discretely valued K; for general K it explicitly assumes IsKiehlProper. K = ℂ_p is allowed here and is nondiscrete.

   **Evidence.** RigidAnalyticGeometry §7.4, README.md:642–647, assumes Kiehl-properness. AdicSpacesPartIII R3.6, README.md:10727–10753, repeats that assumption over each affinoid base and explicitly distinguishes it from adic properness. AdicSpacesPartII R1.7, README.md:9984–10007, does not supply the missing unrestricted converse either. Thus §0.4's indicated proof consumes a stronger theorem than these owners state. The defect is an undeclared supplier extension, not a counterexample to proper-image closedness.

   **Exact repair.** Keep §0.4 over all the standing fields. In the existing AdicSpacesPartIII supplier subsection and the plan's top-level gaps, add one gap, for example gap:adic-proper-kiehl-proper, supplier AdicSpacesPartIII, section R3.6, with this single contract:

   For every complete nontrivially valued rank-one nonarchimedean field K, every K-affinoid algebra A and every adic-proper morphism f : X → Spa(A,A°) of rigid K-spaces, f is Kiehl-proper: X has finite affinoid open covers (V_i) and (U_i) with V_i relatively compact in U_i over A for each i.

   Restate the existing coherent-direct-image contract with its actual Kiehl-proper hypothesis, and cite this new gap in §0.4's Needs. Do not narrow the roadmap to discretely valued fields.

   **Repair test.** For P¹ over ℂ_p, the two unit discs in T and T⁻¹ cover P¹; the two discs of radius abs(p)⁻¹ also cover it. In each outer chart the scaled coordinate pT, respectively p/T, has supremum abs(p) < 1 on the inner disc. These are the required relatively compact inclusions even though ℂ_p is nondiscrete. H⁰(P¹,O) = ℂ_p; both the image and the support are the one-point base. The repair assigns the missing general implication to a named owner while preserving this instance.

2. **F02** (P2) The group identity theorem uses nonarchimedean charts over arbitrary normed fields

   **Location.** packages/AdicSpacesPartIIPartII/README.md:966–972: “Let E ⊆ C be complete nontrivially normed fields of characteristic 0”; “choose a chart of G(E) at 1 coming from a polydisc neighbourhood”.

   **Claim.** The group consequence is stated at the same all-complete-normed-field generality as the scalar theorem, using §§6.2–6.3 to construct the requisite compatible charts.

   **Witness.** E = ℝ, C = ℂ, G = G_m and K₀ = ℝ_{>0} satisfy §6.5. Sections 6.2 and 6.3, README.md:908 and 923, explicitly require nonarchimedean fields; their rigid charts do not apply.

   **Evidence.** This is not a lost Lean binder: the scalar Lean theorem has the intended generality. The missing interface is the analytic structure on algebraic G(F) and its compatibility with E ⊆ C in the archimedean case. The module docstring correctly declines to encode that interface. ReductiveGroupsPartII RG2.0.2, smooth-group-analytic-charts, does construct algebraic group charts for locally compact characteristic-zero fields, including ℝ and ℂ, but it is a later consumer, not an available upward supplier.

   **Exact repair.** Preserve the scalar and group conclusions over complete nontrivially normed characteristic-zero fields. Extend Layer 6 with a named algebraic-point atlas target: for a smooth finite-type algebraic group G over such an F, construct the analytic atlas on G(F) from smooth algebraic local coordinates and the native analytic inverse theorem; prove that F-defined charts commute with complete isometric field extension. In the nonarchimedean case compare this atlas with §6.3's rigid atlas. Use this target in §6.5, update its Needs and Layer 6 Dependencies, and record that ReductiveGroupsPartII's locally compact group charts are a specialization consumed downstream. Do not cite that later roadmap as a supplier.

   **Repair test.** For G_m at 1, z ↦ z − 1 gives a complex chart whose intersection with ℝ× is a real interval about 0; K₀ contains such an interval. For GL₂, the four entries of g − I give the same compatibility, with determinant nonzero on a sufficiently small neighbourhood. For a finite étale group the identity chart has dimension 0 and one point. These tests cover both archimedean fields and the zero-dimensional case without invoking a rigid space over ℝ.

3. **F03** (P3) The repaired Layer 4 dependency is still printed in reverse build order

   **Location.** packages/AdicSpacesPartIIPartII/README.md:679–681: “by §4.3(2) each generic point has exactly one preimage”; “*Needs:* §4.1; §4.3”.

   **Claim.** The numbered subsections follow the build order promised in How to read the build.

   **Witness.** The internal edge is 4.2 → 4.3, with 4.3 starting at line 691. The repaired graph is acyclic, but this prerequisite is later than its consumer.

   **Exact repair.** Put the four-characterizations theorem before the dependent Shilov finiteness and boundary API, renumber the two subsections and update references throughout. Its statement already phrases the generic-specialization condition directly, so it does not need the Shilov definition first. Alternatively retain the definition first but move its dependent theorem/API into a subsequent numbered subsection. Do not restore the former reverse Needs edge.

   **Repair test.** For the disc, the characterization first computes sp⁻¹((0)) = {η}; the following API then deduces that the Shilov set has cardinality 1. For XY = c it computes singleton fibres over (X) and (Y), then cardinality 2. The resulting supply order is reduction → characterizations → Shilov API → weakly Shilov → residue criterion. Round-2 F04's two cycles are repaired; this finding concerns the remaining ordering.

4. **F04** (P3) The Banach spectrum has an existing owner missing from the contracts

   **Location.** packages/AdicSpacesPartIIPartII/README.md:693–699: “the seminorm |·|_x lies in the Shilov boundary of the Banach K-algebra A”; “Compare the rank-one multiplicative seminorms with the Banach spectrum”.

   **Claim.** The specified inputs suffice to state the fourth characterization and its comparison, while the supplier table lists only AdicSpacesPartIII R2.2–R2.5 and R3.1–R3.3, R3.6.

   **Witness.** TauCetiRoadmap/AdicSpacesPartIII/README.md:12470–12510, R3.9, owns Huber.GelfandSpectrum, its bounded multiplicative seminorms, topology and spectral maximum. No R3.9 citation occurs in this package.

   **Exact repair.** Import AdicSpacesPartIII R3.9 by name in Scope and ownership, Exact supplier contracts and §4.3's Needs. Specify the comparison's source as the rank-one locus of Spa(A,A°) and its target as the supplied Banach spectrum. State the Shilov boundary convention there as the smallest closed subset on which every spectral supremum is attained. Keep the affinoid boundary characterization as this roadmap's theorem; do not reconstruct the ambient spectrum or acquire it from a later consumer.

   **Repair test.** For K⟨T⟩, the norming boundary is {η} and the spectral norm of p + T² is 1. For K[ε]/ε², every multiplicative seminorm gives ε value 0 although its Banach norm can be 1; the spectrum is that of K. For the zero algebra the spectrum and boundary are empty and the spectral supremum is 0. These distinguish the supplied spectrum from the ambient norm and cover the empty case.

Four findings: one P1, one P2 and two P3. The two blocking findings concern a missing properness comparison in the supplier contract and a group-manifold construction used beyond its stated field hypotheses. They do not refute the three Lean headline statements. All seven findings of round 2 were repaired as requested; the remaining Layer 4 ordering issue is distinguished below from the cycles that were repaired.

## Verified sound

### Review coverage and previous repairs

Read all four package files, the four declared plan gaps, the previous review and its repair report. Reviewed all 38 numbered subsections in seven layers, including definitions, API bullets, proof inputs, Checks and worked examples. Recomputed the repaired passages and searched the remaining text for the same patterns. The earlier table was used only for rows with explicit computed values; its unsupported summaries were reviewed afresh. No package source file was edited.

| Round-2 finding | Status | Repaired passage and verification |
|---|---|---|
| F01 | repaired | README:113 says “Extend its §§7.5–7.6 marked strong resolution functor from reduced to generically reduced”; :115 separately says “Provide a countable totally ordered set of invariant values”. Both slugs and exact sentences match plan.json. The reduced cusp family needs countable synchronization; the quasi-compact embedded-nilpotent example needs the generically reduced extension. |
| F02 | repaired | README:29 says “Write dim X = topologicalKrullDim”; :173 says “Prove the comparisons”. The local minimum remains a definition, global dimension is imported from AdicEtaleGeometry A2.6, and the product and empty-space computations give 1 and ⊥ on both sides. |
| F03 | repaired | Needs at :655 and :699 cite “AdicSpacesPartIII R2.4–R2.5” without the global gap. The gap remains at :758; :856 and :957 use the exact resolution and quotient slugs. Affinoid reduction and global formal realization are separated. |
| F04 | repaired | Needs :681 includes “§4.3”; :699 has no §4.2. The open-invariance consequence now begins at :753, after the residue criterion. The internal graph has no cycle. R03 records only the remaining presentation order. |
| F05 | repaired | :171 begins “Use the following local-dimension convention”; :353 cites CONRAD99 lines 653–655 for irreducible dimension; :420 cites lines 801–805 with the algebraically closed qualification. :865 cites “HK2 line 2708”; :259 uses “Layers 3–4”. Manifest coverage and reference page lists include the formerly omitted sections/pages. |
| F06 | repaired | Summary :3 names “Gauss-point closure of rational polydisc points over infinite residue fields”. Suggested.lean:17–19 names “Connectedness of the resolution” and “the group form of subfield detection on G(C)” and identifies their missing carriers. No substitute theorem was added. |
| F07 | repaired | README:918 now requires “0 < |c| < 1”. At c = p the radius is 1/p and every point has abs(T) = 1; at radius 1, T = 0 is included and is outside G_m. |

The earlier naming finding F12, recorded as not actionable in the previous review chain, remains settled; its reason was not overturned. None of R01–R04 re-raises a finding marked not actionable.

The four declared gaps are precise, owned and minimally different from the existing suppliers. The plan and README sentences match exactly. They are contracts, not findings:

| Slug | Owner and section | Checked distinction and computed test |
|---|---|---|
| formal-affinoid-localization | AdicSpacesPartIII R2.4–R2.5 | Finite/quasi-compact formal realization is supplied; prescribed affinoid realization in a quasi-separated quasi-paracompact X with the specified reduction homeomorphism is the extension. On the disc the kernel K°°/ϖ consists of nilpotents, giving the same prime spectrum; for dual numbers both reductions have one prime. |
| generically-reduced-functorial-resolution | ResolutionOfSingularitiesCharacteristicZero §§7.5–7.6 | Existing qeResolution assumes reduced. For A = K⟨x,y⟩/(y²,xy), A[1/x] has y = 0; at the origin Krull dimension is 1 and cotangent dimension 2. The blow-up has x-chart K⟨x⟩ and empty y-chart, preserving the regular complement. |
| countable-resolution-invariants | ResolutionOfSingularitiesCharacteristicZero §§7.5–7.6 | Regular-map functoriality alone does not specify a common countable label set. For y² = x^(2n+1), n = 0,1,2, the displayed towers have lengths 0,1,2; the disjoint family has no uniform finite bound. |
| represented-smooth-homogeneous-quotient | ReductiveGroups Layer 3 | Representability is supplied; smoothness/surjectivity of the represented map is not stated there. GL₂/B has dimension 4 − 3 = 1; G_m/μ₂ has derivative 2t ≠ 0 in characteristic zero, whereas μ₂ is non-smooth in characteristic 2. |

### Principles and shape

This extends AdicSpacesPartII R0–R1 rather than replacing it. It does not recreate the coherent, formal, scheme-resolution or diamond libraries. Nonarchimedean K need not be discrete, locally compact, perfect or characteristic zero except where explicitly required. The imperfection and nonreduced negative controls are retained. No computational algorithm, copied source passage, sorry'd data, set_option, admitted example, free predicate stand-in or root Tau Ceti import was found.

Read the main-branch shapes of RigidAnalyticGeometry, StableReduction and SchemeAndStackFoundations. The package has the required Summary, ownership, conventions, exact contracts, build paragraph, layers, examples, dependencies, downstream consumers and references. Every theorem has a locator; every numbered target has Needs. There are 14 definition/API subsections, all with at least three discriminating Checks:

| Section | 0.1 | 0.2 | 1.1 | 1.3 | 1.4 | 2.1 | 2.3 | 3.1 | 4.1 | 4.2 | 4.4 | 5.1 | 5.2 | 6.3 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Check bullets | 4 | 6 | 5 | 5 | 6 | 5 | 5 | 4 | 5 | 5 | 4 | 4 | 5 | 5 |

### Seeded source sample: all 15 targets

Seven legal cached texts were read. All source numbers below refer to the exact versions recorded by the manifest, not to remembered published numbering. The two explicitly uncertified works remain settled and unread, as detailed under Not verifiable. There are no other author-flagged unverified locators.

| Target | Text and exact locator read | Hypotheses and support |
|---|---|---|
| 1.2 Conrad's characterization | CONRAD99 line 459, Theorem 2.1.2, author pp. 10–11; proof through line 494 | Reduced X,Y, finite map, normal Y, nowhere density on both sides, and isomorphism off Z are all present. The non-normal locus as cokernel support is at line 469. Extra vertical components are correctly excluded. |
| 1.5 Proper closed subsets | CONRAD99 line 658, Lemma 2.2.3, author p. 14; proof through line 672 | Nonemptiness is essential. Both equivalences and the nonempty-open criterion are supported. No geometric irreducibility or reducedness was silently added. |
| 1.6 Full dimension | CONRAD99 line 725, Corollary 2.2.7, author p. 15; HK2 lines 2627–2629, proof of Theorem 9.1.3, p. 58 | Conrad supports equality for irreducible full-dimensional analytic subsets. The one-point local-dimension and connected-component versions are deductions from §1.5, not additional quotations. HK2 uses the latter. |
| 2.4 Smooth stratification | HK2 lines 2581–2583, proof of Theorem 9.1.3, p. 57; BH22 lines 346–352, Corollary 2.10, p. 8 | HK2 uses characteristic zero. The package's perfect-field extension is its own reduced-singular-locus induction using §2.2. Finite dimension, reduced successive loci and the bound d+1 are explicit; non-quasi-compactness does not invalidate the integer bound. |
| 3.1 Finite-extension points | HK2 lines 691–694, Definition 2.2.1(1), p. 15 | HK2 defines the relation for diamonds over a finite extension of ℚ_p. The package explicitly owns the analogous rigid/functor construction for general K; finite residue fields and amalgamation supply its wider proof. It does not claim HK2 states that wider carrier. |
| 3.2 Point classes | HK2 lines 699–705, Remark 2.2.2, p. 15; lines 1458–1464, Example 5.0.5, p. 32 | The classical-image bijection and naturality match the source's rigid case; the package proves the general rigid statement directly. The G_a affine-Grassmannian example has only the zero rigid analytic point; it is not a claim that all geometric points are finite-extension points. |
| 3.3 Polydisc point topology | HK2 lines 2723–2728, proof of Lemma 9.3.5, p. 60 | The source identifies the rational-point topology with the usual complete metric topology in its field setting. The broader complete-field result has a valid explicit ultrametric argument: weak rational inequalities are locally preserved, not merely preimages under ordinary real-continuous functions. |
| 4.1 Canonical reduction | BH22 lines 235–252, Proposition 2.2 proof, p. 6 | The open bounded model and universal homeomorphism of special fibres are present, including the nilradical computation. The map's direction and functorial square agree. This individual affinoid model needs no global localization gap. |
| 4.2 Shilov points | BH22 line 310, Definition 2.4, p. 7, and lines 235–294, Proposition 2.2, pp. 6–7 | Rank one, generic reduction, singleton full fibre and Banach Shilov boundary agree. Finiteness follows from finitely many generic points. The proper dependency is the characterization before its API (R03); the Banach carrier should cite R3.9 (R04). |
| 4.5 Secondary residue bound | POINEAU13 lines 182–184, Notations, printed p. 271; BH22 line 329, Proposition 2.9, p. 8 | Poineau gives s(x)+t(x) ≤ local dimension; t(x) ≥ 0 gives the claimed s(x) bound. Rank one and the secondary, rather than completed, residue field are retained. The proof uses nonzero denominators in residue approximations. |
| 4.7 Avoidance | BH22 lines 346–352, Corollary 2.10, p. 8; HK2 lines 2710–2718, Lemma 9.3.5, p. 60 | The reducedness condition for regularity and nowhere density for avoidance are retained. HK2 applies it to exceptional subsets. Each weakly Shilov point avoids each nowhere dense closed subset, so avoidance of their union requires no countability argument. |
| 5.2 Marked blow-ups | TEMKIN12 lines 430–479, §§2.2.1–2.2.7, pp. 10–11; lines 1534–1550, §5.3.2 and Remark 5.3.1, pp. 33–34 | Centres are retained; only empty centres are contracted. The total order, successor maps, local finite trivial extensions and terminal object match the hypersequence construction. A nonempty Cartier centre remains marked. |
| 5.4 Resolution properties | TEMKIN12 lines 1563–1575, Theorem 5.3.2, p. 34; HK2 lines 1598–1606, §5.3, p. 35, and line 2708, §9.3, p. 60 | Proper smooth resolution and functoriality are supported. Connectedness in the irreducible case is also proved via the dense connected smooth locus. Arbitrary T is reduced before resolution; no birational regular cover of a generically nonreduced T is asserted. |
| 6.1 Constant rank | HK2 lines 2602–2607, proof of Theorem 9.1.3, p. 58; SCHNEIDER11 §5, Corollary 5.8/Proposition 5.9, p. 33, and §9, Proposition 9.3, p. 58 | HK2 uses p-adic constant rank; it does not itself state the all-complete-field theorem. The wider route uses native analytic inversion and coefficient uniqueness. Schneider's exact text is uncertified; the native hypotheses were independently opened. The locally constant-rank hypothesis, characteristic zero and chart inverses are present. |
| 6.2 Rational polydisc charts | HK2 lines 2723–2728, proof of Lemma 9.3.5, p. 60; SCHNEIDER11 Proposition 5.9, p. 33 | HK2 uses a rational smooth chart. The package's nonarchimedean arbitrary-field route uses the supplied étale local presentation and native analytic inverse, then shrinks within convergence. Schneider remains uncertified. Rationality and strictly positive small radius are correctly retained. |

Also reopened all repaired locators: CONRAD99 lines 274–286 (Lemma 1.1.5, pp. 6–7), 406–417 (Corollary 1.2.3, p. 9), 435 (Lemma 2.1.1), 451–458 (nowhere density), 528–548 (components), 639–655 (irreducible dimension), and 801–805 (algebraically closed connected-complement argument); CONRAD10 lines 154–161 (Theorem 2.1.1, p. 4) and 189–215 (Lemma 2.1.3, pp. 4–5); CONRAD06 lines 1937–1960 (Definition 4.1.1 and properties, pp. 1096–1097); TEMKIN12 lines 99–122 (Theorem 1.2.1 and Remark 1.2.2, p. 3), 734–745 (local formal smoothness, p. 16), and 1504–1521 (Theorem 5.2.2, p. 33); POINEAU13 lines 705–717 (Lemma 4.4, p. 284), 857–878 (Corollary 4.15, pp. 287–288) and 893–898 (Corollary 4.18, p. 288). The unique-component hypothesis for the latter is established in §4.6 using the residue bound. HK2 lines 2730–2735 use an algebraically closed residue field; §3.4's stated proof correctly generalizes this to an infinite residue field.

### Adversarial computations

The entries below give actual values or sets, rather than treating a successful sorry elaboration as mathematical evidence. They cover all sampled targets, the headlines, every finding and additional negative controls; the complete subsection ledger was saved separately in the review scratch work. Field characteristic, completeness, reducedness, rank, rationality, separation and finiteness assumptions were checked against both statements and routes. Degeneracies irrelevant to a target were not imposed on it: for example q = 1 is not the cardinality of a residue field, and a zero ring is not an instance of NontriviallyNormedField.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| 0.2 Local/global dimension | Dⁿ for n=0,1,2; point ⊔ disc; empty space; higher-rank coefficient ring | Local dimensions of Dⁿ are 0,1,2; global values are 0,1,2. Product has local values 0 and 1, both sup and global dimension 1. Empty sup and ring/global dimension are ⊥. Spa(K,K⁺) with rank-two K⁺ has topological dimension 1 versus ring dimension 0 and is outside the comparison. | Imported global notion and local comparison agree; no tangent-dimension substitute. | none |
| 0.3 Nowhere-density equivalences | V(T) in disc; one axis in XY=0; ∅ | For disc: local dimensions 0<1 and (T) is in no minimal prime. For the axis: at a nonintersection point 1=1, and its defining ideal is a minimal prime; it contains an open subset. For ∅ all five conditions hold vacuously. | Both directions discriminate correctly. | none |
| 0.4 Proper images and direct-image support | Identity, empty source, P¹ over ℂ_p | Image/support are X/X, ∅/∅ and {pt}/{pt}; H⁰(P¹,O)=ℂ_p. Inner/outer chart radii 1 and abs(p)⁻¹ yield scaled-coordinate sup abs(p)<1. The cited general-field theorem additionally requires Kiehl-properness. | Mathematical examples pass; supplier domain is too small. | R01 |
| 1.1 Normalization and universal property | Cusp, crossing, dual numbers, normal field, empty space | Cusp A=K⟨t²,t³⟩, B=K⟨t⟩=A+At, t integral and t∉A; one point over cusp. Crossing normalizes to two discs with fibre size 2 at origin. Dual numbers normalize to K; field map is identity; empty stays empty. | Normal reduced source, finite fibres and reduction are distinguished; dominance excludes an arbitrary choice of branch. | none |
| 1.2 Characterization in both directions | Cusp normalization; disc plus extra point; one axis into crossing | Cusp: cokernel support={0}, both inverse-image and target closed sets have dimension 0<1. Extra-point map: inverse image includes an open point component, so nowhere density fails. Axis map: omitted other axis has dimension 1 and interior. | Both density hypotheses are necessary and correctly present. | none |
| 1.4 Global components versus branches | Crossing; integral nodal cubic; two disjoint discs | Crossing: 2 global irreducible components, 1 connected component, normalization 2 components. Integral nodal cubic: 1 global component, 2 local branches, normalization points t=±1 over node with x=t²−1=0 and y=t(t²−1)=0. Two disjoint discs: locally one branch, globally 2 components. | Source's false local/global converse is not inherited. | none |
| 1.5 Irreducibility iff no proper decomposition | Disc; crossing; empty space | Disc proper Zariski sets have dimension 0<1 and empty interior. Crossing=V(X)∪V(Y), both proper; each axis has a nonempty open part. Empty space has no nonempty open, making the binary criterion vacuous, but is excluded. | Both implications and nonempty convention agree. | none |
| 1.6 Full-dimension closed subsets | Bidisc; point; disconnected smooth space | V(XY) has dimension 1<2. In Spa L a nonempty Z has local dimension 0=0 and equals X. In D⊔D, a connected closed full-dimensional disc has dimension 1=1 and equals its component. A proper closed subdisc has dimension 1 but is not Zariski closed. | Correct local rather than global component criterion. | none |
| 1.7 Bounded Riemann extension | 1/T on punctured disc; t=Y/X on punctured cusp; idempotents | At T=πⁿ, abs(1/T)=abs(π)⁻ⁿ is unbounded. Cusp t has abs(t)≤1 but t∉K⟨t²,t³⟩. An idempotent takes values 0,1 and remains idempotent after extension. | Boundedness and normality exclude the respective failures. | none |
| 1.8 Connected complements | Punctured disc, node, crossing, field point | Disc minus 0 has 1 component. Nodal cubic minus node is normalized by the analytic line minus {−1,1}, with 1 component. Crossing minus origin has 2; it is not irreducible. Spa L minus ∅ has 1. | No geometric connectedness needed; irreducibility cannot be replaced by connectedness alone. | none |
| 2.1 Singular locus | Cusp, crossing, polydisc, double point | Cusp/crossing singular set={origin}; on their punctured branches tangent and local dimensions are 1=1. Polydisc singular set=∅. Double point has tangent dimension 1>0 and singular set all of X. | Reducedness is essential to nowhere density. | none |
| 2.2 Smooth versus regular | Purely inseparable field extension; point over perfect field | K=𝔽_p((u)), L=K(u^(1/p)): dim L=0, Ω_(L/K) has dimension 1; L⊗_K L=L[ε]/εᵖ, so not geometrically regular. For Spa K, Ω=0, completion=K, dimension=0. | Perfectness prevents the counterexample. | none |
| 2.4 Reduced smooth strata | Cusp; plane plus transverse line; reduced point; ∅ | Cusp dimensions 1→0→⊥, two strata. Plane plus transverse line dimensions 2→0→⊥, with singular set their intersection point. Reduced point 0→⊥; ∅ has no strata. An unreduced double point would keep its singular locus equal to itself. | Reduction and finite-dimension bound discriminate correctly, including non-pure dimension. | none |
| 3.1 Field-valued point classes | Finite L/K; purely inseparable finite L/K; constant two-element functor | A finite Galois L/K gives [L:K] embeddings into a splitting field but one class for its single image point. A purely inseparable extension has one embedding, still one image class. Constant two-element functor yields exactly two classes, not one. | Extension amalgamation does not collapse different images or require separability. | none |
| 3.2 Classical images | T²−p for p=2,3; transcendental integral element; G_a,G_m examples | Residue degree of T²−p is 2, abs(T)=p^(−1/2); one classical image class. A transcendental element has infinite residue degree and is not classical over ℚ_p. G_a example has 1 rigid point, while G_m lattice classes include distinct exponents 0 and 1. | Finite-extension classes differ from rational points and arbitrary geometric points. | none |
| 3.3 Polydisc rational topology | Ball of radius abs(π)^k; ℚ₂ and ℚ₃; n=0 | Rational trace equals the metric ball and is open and closed. At η, abs(Tᵖ−T)=1, whereas at a∈ℤ_p it is ≤1/p. At T=√p, abs(T²−p)=0, whereas for a∈ℤ_p its value is 1 or 1/p, both >p⁻². For n=0 both spaces are one point. | Weak inequalities are open on the trace; finite-residue nonclosure claim is not made. | none |
| IsUnitGaussPoint definition | η, evaluation at 0, smaller radius, zero series | At unit η, abs(T)=abs(1)=1. At evaluation 0, abs(T)=0<abs(π), contradicting the Gauss comparison 1>abs(π). At radius abs(c)<1, T≤c holds but Gauss norms give 1>abs(c). Zero/one comparisons give 0≤1 true and 1≤0 false. | Fixes the valuation class and unit radius; wrong models fail. | none |
| 3.4 Gauss closure headline | Infinite residue; 𝔽₂,𝔽₃; n=0,1,2 | After denominator normalization, abs(g(η))=1 and ḡ≠0; choosing ḡ(ā)≠0 gives abs(g(a))=1 and abs(f_i(a))≤1. Over 𝔽_q, abs(T^q−T)_η=1 but rational evaluations <1. D⁰ has one point; Gauss residue transcendence degrees for D⁰,D¹,D² are 0,1,2. | Nonzero denominator and residue infinitude are exactly what the proof uses. | none |
| 4.1 Reduction and specialization square | Disc, annulus, square map | Disc: sp(η)=(0), sp(a)=(T−ā); 0 and π have the same specialization (T). For XY=c the boundary values (1,abs(c)) and (abs(c),1) specialize to (Y) and (X). For S↦T² and a, both square routes give (S−ā²). | Contravariant directions agree; sp is not injective. | none |
| 4.2 Shilov API | Disc, annulus, finite extension, zero algebra | Shilov cardinalities are 1,2,1,0. For p+T² on the disc, spectral supremum=Gauss value=1. Minimal-prime counts are respectively 1,2,1,0. | Values pass; characterization must precede this API. | R03 |
| 4.3 Characterizations and Banach comparison | Disc generic/rational points; dual numbers; zero algebra | Generic specialization fibre={η}; rational specialization fibre is a whole residue disc. For A=K[ε]/ε², A°=K°+Kε and every πⁿA° contains Kε, so separated completion kills ε and gives K°. In the reduction π=0, so completing that ring cannot give K°. The zero algebra has no rank-one point or seminorm. | Corrects the source's reduction-ring error; missing ambient-spectrum citation is R04. | R04 |
| 4.5 Abhyankar bound | D² unit Gauss; irrational radius; classical point | Secondary residue fields at unit Gauss give K̃(T₁,T₂), trdeg 2≤2. Irrational-radius disc point: 0<1. Classical finite-extension point: 0≤local dimension, with equality on Spa L. | Value-group rank contribution is not confused with residue transcendence. | none |
| 4.6 Maximal-residue criterion | Unit Gauss, type 3, isolated point; open restriction | Disc Gauss: 1=1; type 3: 0≠1; isolated point in point⊔disc: 0=0 despite global dimension 1. Open restriction preserves H(x) and local dimension, so both integers remain unchanged. | Criterion and moved open-invariance consequence agree. | none |
| 4.7 Avoidance and regularity | Closed disc points; cusp; nonreduced point | Disc point has secondary trdeg 0<1, so cannot equal a weakly Shilov point. In reduced cusp, singular set has dimension 0<1 and contains no weakly Shilov point. Dual-number space has its unique Shilov point singular, so dropping reducedness is false. For any family Z_i, each intersection with the weakly Shilov set is empty, hence so is their union's intersection. | Reducedness and nowhere density retained; arbitrary-family avoidance is not a Baire shortcut. | none |
| 5.1 Blow-up construction and universal property | Unit/zero ideals, Cartier centre, bidisc origin | Blow-up of unit ideal=id; zero ideal gives empty Proj; (T) gives an isomorphism but retains nonempty centre. Bidisc origin has exceptional fibre P¹. Restriction off origin makes the centre empty. | Units and nonunits are not reversed; properness does not imply all blow-ups are surjective. | none |
| 5.2 Markings, pullback and hypersequences | Length 0; one Cartier stage; translation; cusp family | Length-0 and one-Cartier-stage composites are both id but marked lengths are 0 and 1. Pullback of centre (1,0) under translation by (1,0) is (0,0). Exponents 1,3,5 resolve in 0,1,2 displayed steps. Quasi-compact opens meet finitely many disjoint components, giving a finite maximum there only. | Markings and local stabilization exclude the wrong unmarked or merely countable model. | none |
| 5.3 Functorial rigid resolution | Cusp, smooth/empty space, embedded nilpotents, double point | Cusp chart x=u²,y=u³ is smooth after 1 blow-up. Smooth and empty inputs use 0 stages. K⟨x,y⟩/(y²,xy) blows up to x-chart K⟨x⟩ plus empty y-chart. K[ε]/ε² is generically nonreduced and has no dense open isomorphic to a regular source. | Both declared resolution gaps are used with their correct domains; reduction is necessary for the last cover. | none |
| 5.4 Connected resolution and cover headline | Cusp, crossing, integral node, double point | Cusp resolves to 1 connected disc; crossing to 2 disjoint discs; integral node's normalization is connected with 2 points over node. Reduction of double point gives a proper map of one underlying point onto one point. Zero-ideal blow-up instead has 0 points and is not a cover. | Irreducibility and reduction give exactly the advertised distinctions. | none |
| 6.1 Analytic constant-rank headline | (x,y)↦(x,x²); square at 0; char-p Frobenius; dimension 0 | ψ(u,v)=(u,v−u²) yields ψf=(x,0), rank 1. Square has ranks 0 at 0 and 1 nearby, so hypothesis fails. Tᵖ in char p has rank 0 but πⁿ↦π^(np)≠0, excluded by CharZero. m=n=k=0 gives empty coordinate tuples on both sides. | Centred projection, rank neighbourhood and analytic inverse conditions are correct. | none |
| 6.2 Rational polydisc charts | G_m at 1; dimension 0; non-rational residue L | Radius abs(p)<1 implies abs(T)=1; radius 1 includes 0, radius 0 is not a positive-dimensional neighbourhood. Rational dimension-zero chart is Spa F. A centred F-chart would have residue F, not L≠F. | Corrected radius and rationality assumptions withstand the negative controls. | none |
| 6.3 Rational-point manifolds | ℚ_p disc; finite extension; ℂ_p; empty/point | ℤ_p has dimension 1 over ℚ_p; O_(ℚ_p(√p)) has dimension 1 over that extension and 2 over ℚ_p. ℂ_p has dimension 1 over itself and infinite vector-space dimension over ℚ_p. Empty and point have empty and singleton 0-dimensional charts. | No illicit finite scalar restriction, Hausdorff or second-countability assumption; archimedean construction missing only where §6.5 uses it. | R02 |
| 6.4 Submersions and orbit maps | Projection; GL₂/B; G_m/μ₂; S₃/C₂ | Projection sends (u,v)↦u, rank 1. At [1:0], orbit coordinate c/a has derivative δc. y=p in G_m/μ₂ needs √p to lift, yet g↦pg² has derivative 2p≠0, also for p=2. S₃/C₂ has 3 points, fibres of size 2, tangent map 0→0 surjective. | Does not assume quotient surjectivity on F-points or commutativity of G. | none |
| 6.5 Scalar germ headline | E⊆C, polynomial z(z−a) with a∉E; m=0 | Mixed derivative at 0 is α!c_α; in characteristic zero α!≠0, so vanishing gives c_α=0. Polynomial's E-zero set near 0 is just {0}, not a neighbourhood. For m=0 both assertions are f(0)=0. | Genuine identity theorem on native analytic germs, not algebra on arbitrary predicates. | none |
| 6.5 Group consequence | ℝ⊆ℂ, G_m, positive subgroup; GL₂; finite group | Chart z−1 sends the real slice to ℝ near 0 and 1+iδ to iδ≠0. GL₂ chart has 4 real coordinates inside 4 complex coordinates; finite-group chart has 0 coordinates. These are algebraic-point analytic charts; §§6.2–6.3 only construct their nonarchimedean counterparts. | Claim needs the broader atlas interface. | R02 |

### Lean acceptance test, signatures and padding

The headline inventory from the Summary and deep layer targets is: proper images and nowhere density; finite normalization and global components; Riemann extension and connected complements; regular/smooth loci and finite stratifications; Gauss-point closure; Shilov characterizations, maximal secondary residue transcendence and avoidance; rigid blow-ups and functorial resolution; connectedness of an irreducible resolution; rational polydisc charts and point manifolds; analytic constant rank and submersions; and subfield detection in coordinates and on G(C).

Three headlines are statable on the pinned native carriers and are present: gaussPoint_mem_closure_rationalPoints, analytic_constantRank and analytic_germ_eq_zero_of_subfield. The sole additional definition, IsUnitGaussPoint, has a real body fixing the native valuation class and is necessary for the first statement. The module docstring names all the other groups of headlines and their missing rigid/affinoid/coherent/morphism/point-atlas carriers, including resolution connectedness and the group consequence. A few words of a source alone would not supply those missing native structures. No statable headline was found absent and no headline was forced through a stand-in.

Ran the prescribed lake env lean command on the original packages/AdicSpacesPartIIPartII/Suggested.lean from the pinned content checkout, with its absolute input path. It exited 0. The complete diagnostics were three “declaration uses sorry” warnings at lines 49, 66 and 98. No TauCeti object file was missing, so no build was needed.

Appended #check @ for all four declarations to one scratch copy and elaborated it once. All four types retained the expected binders; no author file or signature changed:

| Declaration | Explicit hypotheses and conclusion checked |
|---|---|
| IsUnitGaussPoint | Nontrivially normed ultrametric nonarchimedean field, dimension n and native closed-polydisc point; equivalence of every valuation comparison with the unit Gauss-norm comparison. Completeness is unnecessary for this predicate. |
| gaussPoint_mem_closure_rationalPoints | Complete K and infinite native residue quotient are present; n is arbitrary, including 0; the base Spa point is retained; existence of the specified η and closure of its actual evaluation-point range are both asserted. |
| analytic_constantRank | Complete characteristic-zero field, m,n,k, both rank bounds, native analytic manifold structures, analytic germ and eventual derivative rank are in scope. The result supplies centred open partial homeomorphisms, analytic maps and inverses, MapsTo, and the exact first-k-coordinate formula with a valid Fin m index. |
| analytic_germ_eq_zero_of_subfield | Both complete characteristic-zero normed fields, NormedAlgebra E C and actual AnalyticAt C germ are retained. The same fixed algebraMap gives the E-point restriction; the conclusion is eventual vanishing on C^m. NormedAlgebra between these fields supplies an isometric embedding. |

In the elaborated types, ω prints as the top of ℕ∞ω, the analytic order, not the distinct smooth order ∞. Analyticity at a supplies a neighbourhood of analyticity; mfderiv's total-function zero at a nondifferentiable point does not vacuously satisfy this theorem. Its ranges are subspaces of finite-dimensional tangent models, so Module.finrank's infinite-dimensional fallback is not being used.

For each of the three sorried theorems a scratch probe attempted, with failure backtracking, one tactic at a time: simp (required to close), rfl, infer_instance, and exact? searching a single library proof. All three probes failed to close and the probe file exited nonzero with unsolved goals; the original file still elaborated. The opened definitions and library object searches likewise show that these are neither definition restatements, individual Checks, small computations nor boundary-only theorems. No padding finding.

### Pinned-library and ownership audit

The inspected pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, matching lake-manifest.json and the two dependency checkout HEADs. Paths below are relative to the respective pinned library source roots.

| Opened declaration or object | File and line at the pin | Interface and limit checked |
|---|---|---|
| Ideal.radical; minimalPrimes | Mathlib/RingTheory/Ideal/Operations.lean:799; Mathlib/RingTheory/Ideal/MinimalPrime/Basic.lean:62 | Radical by powers; minimal primes over the zero ideal. These already own the algebraic vocabulary. |
| PrimeSpectrum; MaximalSpectrum; Ideal.height | Mathlib/RingTheory/Spectrum/Prime/Defs.lean:34; Mathlib/RingTheory/Spectrum/Maximal/Defs.lean:27; Mathlib/RingTheory/Ideal/Height.lean:35 | Ideals with the actual prime/maximal predicates; height takes the infimum over minimal primes. No adic or coherent geometry is supplied by these types. |
| IsLocalRing; IsRegularLocalRing; IsIntegrallyClosed | Mathlib/RingTheory/LocalRing/Defs.lean:30; Mathlib/RingTheory/RegularLocalRing/Defs.lean:51; Mathlib/RingTheory/IntegralClosure/IntegrallyClosed.lean:74 | Local rings include Nontrivial; regular local rings include Noetherianity; integrally closed alone does not assert the roadmap's local domain normality. The roadmap supplies that domain condition in its convention. |
| Module.Flat; Algebra.trdeg | Mathlib/RingTheory/Flat/Basic.lean:113; Mathlib/RingTheory/AlgebraicIndependent/Basic.lean:45 | Tensor-injectivity predicate; cardinal-valued supremum of algebraically independent subsets. Neither is replaced by a new roadmap carrier. |
| ringKrullDim; topologicalKrullDim | Mathlib/RingTheory/KrullDimension/Basic.lean:26,38; Mathlib/Topology/KrullDimension.lean:37 | Dimension lives in WithBot ℕ∞; the zero-ring/empty-space bottom is not a natural zero. |
| topologicalKrullDim_eq_iSup_of_isOpenEmbedding | TauCeti/Topology/KrullDimension.lean:53 | Supremum formula for an open cover; the covering hypothesis is explicit. |
| IsPreconnected; IsConnected; ConnectedComponents | Mathlib/Topology/Connected/Basic.lean:50,55; Mathlib/Topology/Connected/Clopen.lean:510 | Native definition is “s.Nonempty ∧ IsPreconnected s”; thus the empty case is excluded from connectedness. |
| HasFPowerSeriesOnBall; AnalyticAt; AnalyticOnNhd | Mathlib/Analysis/Analytic/Basic.lean:74,110,120 | Actual convergent-series predicates; no arbitrary Prop field stands in for analyticity. |
| AnalyticAt.hasStrictFDerivAt | Mathlib/Analysis/Calculus/FDeriv/Analytic.lean:141 | Analyticity supplies a strict derivative with the relevant completeness assumptions. |
| HasStrictFDerivAt.toOpenPartialHomeomorph | Mathlib/Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean:117 | Invertible strict derivative gives a local topological inverse. |
| OpenPartialHomeomorph.hasFPowerSeriesAt_symm | Mathlib/Analysis/Analytic/Inverse.lean:656 | Analytic inverse under an invertible linear coefficient; not a theorem about arbitrary homeomorphisms. |
| ChartedSpace; IsManifold | Mathlib/Geometry/Manifold/ChartedSpace.lean:141; Mathlib/Geometry/Manifold/IsManifold/Basic.lean:777 | IsManifold extends HasGroupoid for the selected differentiability order. It does not include Hausdorffness or second countability. |
| mfderiv; ContMDiffAt; ContMDiffOn; TangentSpace | Mathlib/Geometry/Manifold/MFDeriv/Defs.lean:336; Mathlib/Geometry/Manifold/ContMDiff/Defs.lean:181,200; Mathlib/Geometry/Manifold/IsManifold/Basic.lean:1033 | Derivative is total; the headline's analytic-neighbourhood hypothesis prevents misuse of its fallback. Tangent models are finite-dimensional in that signature. |
| Manifold.IsSubmersionAt; Manifold.IsImmersionAt | Mathlib/Geometry/Manifold/Submersion.lean:171; Mathlib/Geometry/Manifold/Immersion.lean:190 | Native local projection/inclusion predicates, not an existing analytic constant-rank theorem or a derivative-rank criterion. |
| Module.finrank; Matrix.rank; Matrix.det | Mathlib/LinearAlgebra/Dimension/Finrank.lean:61; Mathlib/LinearAlgebra/Matrix/Rank.lean:132; Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:63 | finrank uses Cardinal.toNat; it can be zero for infinite rank. Here all relevant spaces are finite-dimensional over fields. Matrix rank is the range rank and det is the alternating determinant. |
| NormedAlgebra; norm_algebraMap'; algebraMap_isometry | Mathlib/Analysis/Normed/Module/Basic.lean:271,300,352 | Field algebra maps preserve norms and distances. Completeness of E then gives closed image; no arbitrary embedding is substituted. |
| MvPolynomial.funext; MvPowerSeries.gaussNorm | Mathlib/Algebra/MvPolynomial/Funext.lean:82; Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean:57 | Polynomial uniqueness requires an infinite integral domain. The Gauss supremum needs bounded weighted coefficients, supplied by restrictedness here. |
| BaireSpace.of_completelyPseudoMetrizable | Mathlib/Topology/Baire/CompleteMetrizable.lean:25 | Complete-metrizable spaces are Baire; no compactness hypothesis is needed for O_Lⁿ. |
| IsPowerBounded; powerBoundedSubring; topologicallyNilpotentIdeal | TauCeti/RingTheory/Huber/PowerBounded.lean:117,433,494 | Bounded powers and the nilpotent ideal in the power-bounded ring do not assume reducedness. |
| weightedRestrictedSubring; spa; closedPolydisc | TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Basic.lean:709; TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean:101; TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Basic.lean:72 | Actual restricted-series ring and valuation-spectrum subset; closedPolydisc is not a global rigid-space category. |
| classicalPoint; classicalPoint_vle; classicalPoint_injective_of_isField | TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Basic.lean:148,156,182 | Evaluation-point construction and comparison, with completeness/Hausdorff and coordinate power-boundedness; field specialization gives injectivity. |
| IsRestricted.gaussNorm_mul | TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:241 | Multiplicativity requires positive polyradii and multiplicative coefficient norm; unit radii satisfy both. |
| restrictedMvPowerSeriesGaussEquiv | TauCeti/RingTheory/Huber/Restricted/GaussNorm.lean:80,87 | Equivalence to the Gauss-normed carrier preserves the underlying series. |
| gaussPoint and its comparison | TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/GaussPoint.lean:236,251,269 | Existing centred Gauss point is one-variable, with the specified radius and distinction from evaluation. The new theorem is finite-variable closure, not a duplicate of this construction. |
| AdicSpace | TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:243 | The native category is the full subcategory of sheafy locally affinoid pre-adic spaces. It supplies neither the required rigid finite-type/smooth morphism interface nor the rational-point atlas. |

Object searches included restricted Gauss norms and evaluation, valuation comparisons, coherent ideals, normalization, components, regular maps, dimensions, analytic chart predicates, derivative ranks, Shilov/Berkovich spectra, blow-ups and resolution. There is no pinned analytic constant-rank theorem or rigid Shilov/resolution interface that would delete one of the kept Lean headlines. The generic Banach spectrum is a roadmap-owned prerequisite, handled in R04. A fully qualified name search through the indexed roadmap Lean files found no declaration collision with any of this package's four declarations.

Main was checked at content HEAD c57bdc02fc2a4b1643df71b4a3a14b20fdad247f, equal to origin/main, not against the stale local branch label. The roadmap tool's indexed main was 35c9f96; the seven cited main-supplier READMEs had no diff from that indexed snapshot. All cross-roadmap citations were reopened this round. The following are actual resolved owners, not inferred from similarly named files:

| Roadmap citation | Resolved location | Ownership boundary checked |
|---|---|---|
| RigidAnalyticGeometry §§1.1–1.3, 2.1–2.3, Layers 3–4, 6.2, 7.3–7.4, 8.1–8.3 | TauCetiRoadmap/RigidAnalyticGeometry/README.md; Layers 3–4 at :398, §7.4 at :640, analytification/comparisons at :690–738 | Affinoid algebra, all-characteristic excellence, reduced restriction, canonical reduction and rigid/classical comparison are imported. Proper coherence has the restriction in R01. |
| AdicSpacesPartII R0.6–R0.17 and R1.1–R1.9 | TauCetiRoadmap/AdicSpacesPartII/README.md; relative analytification :8542, local comparison :9575, rigid comparison :9806, properness comparison :9984, identity principle :10509 | Relative analytification is over an affinoid Spec A, not just finite-type K-schemes. Properness directions are not silently interchangeable. |
| AdicEtaleGeometry A2.6 | TauCetiRoadmap/AdicEtaleGeometry/README.md:7403–7455 | Defines global topological dimension and pure dimension; gives the classical local-ring criterion. The package now owns only the local definition and comparison. |
| AdicSpacesPartIII R2.2–R2.5 | TauCetiRoadmap/AdicSpacesPartIII/README.md:4356,4615,4986,5342; formal realization :5603–5628 | Arbitrary rank-one formal foundations and finite formal-open realization exist. The specified global quasi-paracompact extension remains a declared gap. |
| AdicSpacesPartIII R3.1–R3.3, R3.6 | TauCetiRoadmap/AdicSpacesPartIII/README.md:9136,9594,9870,10472; coherent ideals :9960; proper theorem :10727 | Coherent modules, finite algebras and closed subspaces are existing owners. Radical/topological geometry is the added work. The missing properness bridge is R01. |
| SchemeAndStackFoundations §§0.3, 0.21, 4.11 | TauCetiRoadmap/SchemeAndStackFoundations/README.md:551,1394,5528 | Relative Proj, excellent rings/regular maps and modifications, without constructing another scheme blow-up library here. |
| StableReduction Layer 4 | TauCetiRoadmap/StableReduction/README.md:468–473 | Rees-algebra scheme blow-ups, universal property and flat base change; rigid relative analytification is the extension. |
| ReductiveGroups Layer 3 | TauCetiRoadmap/ReductiveGroups/README.md:234 | Represented fppf quotients, without the missing smoothness theorem. The named quotient gap is justified. |
| ResolutionOfSingularitiesCharacteristicZero §§7.1, 7.5–7.8, open head | TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:841,966,981,997,1017 | Reduced quasi-excellent scheme resolution and regular-map functoriality exist. §7.8 resolves Spec A algebraically; rigid gluing and analytification belong here. The two resolution gaps are genuine extensions. |
| DiamondsAndVStacks D6.4–D6.5, D6.9, open head | TauCetiRoadmap/DiamondsAndVStacks/README.md:9217,9298,9758; resolution application :9817–9833 | Finite-point/diamond comparison and affinoid analytified resolution are downstream uses, not prerequisites for the global rigid construction. |
| ReductiveGroupsPartII RG2.0.2, open head | TauCetiRoadmap/ReductiveGroupsPartII/README.md:591; chart construction :641–665 | Locally compact algebraic group charts and Haar Jacobians. It is later; the broader atlas required by R02 must be owned here and consumed there. |
| AbelianSchemesAndArithmeticModuliPartII B2.10, open head | TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:1424 | Real finite-Cᵏ and analytic rank/fibre applications; the general analytic theorem here can supply the real-analytic specialization. |
| LieGroupoidsPoisson G0.1, open head | TauCetiRoadmap/LieGroupoidsPoisson/README.md:251–264, within numbered item 1 of G0 | Owns real smooth constant rank. That is not a pre-existing arbitrary-complete-field analytic theorem. |
| AdmissiblePairsAndPadicHodgeStructures, open head and board context | TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/README.md, rigid-geometry dependency and Layers RZ.0–RZ.6 | Hodge-theoretic bi-analytic Ax–Lindemann consumes these geometric inputs. No reverse dependency is introduced. |
| TropicalAndBerkovichArithmetic, ownership search | TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:1860, §4.5 | Shilov relative multiplicities are a later application. Its generic spectrum references also lead back to AdicSpacesPartIII R3.9. |

The roadmap tools searched the 362 indexed open heads and main by object, and the local board packages were searched separately. The board-package index was read before making ownership claims. Five additionally readable indexed board-head READMEs—AnalyticNumberTheory, ArithmeticStatistics, AutomorphicCongruences, KatoEulerSystems and LogicAndDefinabilityInNumberTheory—had no relevant construction overlap. The other fifteen supplied board-head paths could not be read, as recorded below; their absence was not inferred from this checkout.

This package remains the earlier owner of global rigid normalization/component geometry, weakly Shilov point geometry, marked global rigid resolution, and the general analytic normal form and subfield theorem. The noted overlaps either concern already imported underlying carriers or later specialized applications. R02 proposes moving the general algebraic-point chart interface here, not an upward import.

### Supplier direction

Read every Needs line and supplier citation. The explicit internal section graph is acyclic; its single forward reference is §4.2 to §4.3 (R03). The general properness and archimedean-chart dependencies are the semantic coverage defects R01–R02; a textual resolver cannot detect them.

The prescribed dependency check exited 0 and reported exactly:

    moved: AdicSpacesPartIIPartII moved in the merge order from #9 to #11, right after its last supplier AdicEtaleGeometry (AdicSpacesPartIII also came after it); checked as moved (the worker moves it there when it submits)
    depcheck: 51 roadmaps, 585 edges, 0 problem(s)

No UPWARD or CYCLE line. This movement is allowed by the brief; the merge-order file was not edited. The citation resolver reported no cross-roadmap citations or roadmap Lean names found nowhere. Library names were checked independently at the pins, as listed above.

## Not verifiable

- SCHNEIDER11 is settled as uncertified and paywalled. Its exact text for the coefficient-radius statement, tangent/point-manifold conventions and §§6.1–6.3, 6.5 was not read. Recorded locators are §5, Corollary 5.8 and Proposition 5.9, p. 33; §9, Lemma 9.2, Proposition 9.3 and Remark 9.4, pp. 56–59; and §§7–9, pp. 45–61. The native analytic inverse statements were read separately. No new request was made.
- ANDRE74 is settled as uncertified and paywalled. The original pp. 297–307 were not read; the localization step and its use at the stated generality were checked in TEMKIN12 lines 734–745. No new request was made.
- For each row below, the supplied board-head request for packages/<Name>/README.md returned HTTP 404. Ownership at that exact board head could not be certified. This does not assert that the package is absent; local packages and the separate indexed content-roadmap heads were still searched.

| Board package | Supplied head |
|---|---|
| ArithmeticLocallySymmetricSpacesPartII | 84a41ac |
| CompletedCohomologyAndLocalGlobalCompatibilityPartII | 948c94c |
| CrystallineCohomologyPartII | 84ea77e |
| EndoscopicTransferAndUnitaryTraceComparisonPartII | 80a66cc |
| HigherHidaAndColemanTheory | da88512 |
| LawrenceVenkateshMethod | 9ee7ac3 |
| OrdinaryAutomorphicFormsAndModularityLiftingPartII | 7e88c38 |
| PELModuliPartII | d4bb48d |
| PadicHodgeTheoryPartII | 6502997 |
| PadicLocalLanglandsForGL2QpPartII | 3e0777d |
| RealSurfacePeriodIndex | 875bca4 |
| SchemeAndStackFoundationsPartII | accb0a0 |
| ShimuraVarietiesPartII | 57dc0a4 |
| VStackSheavesAndLisseCategoriesPartII | 0987ba7 |
| VectorBundlesAndIsocrystalsPartII | b58d862 |

No directly cited unsettled source was unread. Works cited only inside the sources were not separately fetched. All nine manifest keys retain their recorded statuses and hashes; no source entry was added or rewritten.

## Source issues

- **Misprint** in HK2 at §1.1, p. 5 (line 219): the source says a closed subset meets C in the local vanishing locus; it should be its intersection with the affinoid open U; affects nothing.
- **Misprint** in HK2 at proof of Theorem 9.1.3, p. 58 (line 2600): the source says the orbit is an element of V(C); it should be a subset of V(C); affects nothing.
- **Error** in CONRAD99 at §2.2, author p. 14 (lines 648–649): the source says an irreducible analytic stalk is equivalent to a unique global component through the point; it should be only the forward implication, since an irreducible nodal cubic has two local branches; affects a stated result.
- **Misprint** in CONRAD99 at proof of Corollary 2.2.6, author p. 15 (lines 712–714): the source says the chosen components contain U; it should be the components that meet U; affects the proof.
- **Error** in CONRAD99 at proof of Corollary 2.2.6, author p. 15 (lines 714–717): the source says an arbitrary analytic subset containing U is a union of components; it should be the minimal closed subspace containing U, whose minimality supplies the reverse inclusion; affects the proof.
- **Misprint** in BH22 at Proposition 2.2, proof of (1) ⇒ (2), p. 6 (lines 266–270): the source says the localized canonical reduction is a rank-one valuation ring with pseudo-uniformizer t; it should localize A° and use its separated t-adic completion for the completed valuation ring; affects the proof.
- **Misprint** in POINEAU13 at Remark 4.3, printed p. 283 (lines 698–700): the source says an Abhyankar point of an irreducible analytic space belongs to no analytic closed subset; it should exclude only proper analytic closed subsets; affects a stated result.

The package already avoids these source issues: it distinguishes local branches from global components, uses the power-bounded ring before completion, and requires proper or nowhere dense closed subsets. No published correction was established in this review.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "61492b571d305eb9cae2a83938bfe7dd897306cc", "job": "REV-PKG-AdicSpacesPartIIPartII~3", "model": "gpt-6-astra", "worker": "chris-12"} -->
