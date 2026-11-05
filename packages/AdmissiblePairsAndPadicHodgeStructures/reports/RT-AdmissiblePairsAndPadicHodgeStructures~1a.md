<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1092#issuecomment-6393869076 -->
Red team round 1 pass a (codex) of 57fb70a

Verdict: needs_changes

1. **F01** (P1) Infinite-order scaling does not determine invariant lattices

   **Location:** `packages/AdmissiblePairsAndPadicHodgeStructures/README.md:289`, “acts on it by an infinite-order character”.

   **Claim:** The stated Gamma hypotheses identify every invariant good lattice with the canonical lift of its rational BB flag.

   **Witness:** Let C be an algebraic closure of Q(u), extend u↦2u to γ∈Aut(C), and set R=C[[t]], γ(t)=2t. For K=C^γ and G=GL₂/K, L=R e₁+R(e₂+u t⁻¹e₁) is invariant but noncanonical.

   The extension of u↦2u to C exists by extension of automorphisms to an algebraic closure; it has infinite order on u. The coefficient inclusion K→R is fixed. The character on Kt is 2, of infinite order. The elementary divisors of L relative to R² are (−1,1), so this is in a good GL₂ cell. Its trace filtration is C² for i≤−1, Ce₁ for i=0,1, and 0 for i≥2. Thus its flag is K-rational. Its canonical lift is R t⁻¹e₁+R t e₂. These lattices differ: t⁻¹e₁ belongs to the canonical lift and not to L. Both γ(u/t)=u/t and γ(L)=L hold.

   **Exact repair text:** Replace the abstract fixed-point assertion in §0.5 by: “Put kΓ=C^Gamma and require its coefficient section kΓ→R to be fixed pointwise. Write γ(t)=χ(γ)t. Assume (C⊗_(kΓ) kΓ(χ^m))^Gamma=0 for every nonzero integer m. Under these hypotheses the Gamma-fixed good type-[mu] lattices are exactly the canonical lifts of kΓ-rational flags. Prove the statement by successive congruence quotients, using this vanishing to kill the nonzero-weight lifting parameters. In the p-adic Galois application, take C to be the completed algebraic closure of the complete discretely valued base K0 with perfect residue field, and import the vanishing H⁰(G_K0,C(m))=0 for m≠0 from PadicPeriodRings §2, tateSen_H0; its §4.3 supplies the fixed coefficient embedding K0→B_dR⁺.” Add the displayed lattice as a negative-control Check, and qualify the use of HKI Proposition 3.1.7(2) with its source error below.

   **Repair test:** The counterexample has u⊗t⁻¹≠0 invariant in the m=−1 twist, so it fails the added hypothesis. For a trivial coefficient action and infinite-order χ, each nonzero twist has invariant space 0, recovering the intended formal Laurent-series case.

2. **F02** (P1) The Serre–Tate boundary uses the opposite diagonal data

   **Location:** `packages/AdmissiblePairsAndPadicHodgeStructures/README.md:1934`, “b=diag(p,1) and mu(z)=diag(z^-1,1)”; also lines 1950 and 1529.

   **Claim:** These upper-triangular Borel data give a Serre–Tate family with constant Hodge–Tate flag.

   **Witness:** For the upper root E₁₂, Ad(mu) has weight −1. Thus Fl_[mu^-1] is a point, while Fl_[mu]=B/T≅A¹. Section 8.6 already computes this datum's good admissible H-cell as the single line [e₁].

   Indeed B(R)t^muB(R)/B(R) is a point: t^mu expands the upper root by t⁻¹, so B(R) is contained in its conjugate. Its infinite-level frame torsor has no positive-dimensional Serre–Tate deformation base. The claim has exchanged the two period directions. HKII Remark 9.1.4 repeats precisely these diagonals at HKII line 2503, so the locator does not resolve the contradiction.

   **Exact repair text:** “Use the upper triangular Borel, b=diag(1,p), and mu(z)=diag(1,z⁻¹), in the Tate-twisted ordinary extension normalization. The admissible Hodge cell is A¹, with lattices ⟨e₁,ξ⁻¹(e₂+x e₁)⟩. The Hodge–Tate flag variety is a point. The Serre–Tate deformation chart lies in this ordinary family, and its canonical torus lift is proper although their Hodge–Tate flag images agree.” Apply this correction throughout §11.8 and its example, and explicitly mark the diagonal error in the source citation.

   **Repair test:** Ad(mu) now has upper-root weight +1, so Fl_[mu^-1]=B/T≅A¹ and Fl_[mu]=point. The x=0 torus lift and x=1 ordinary extension have distinct Hodge lattices and the same Hodge–Tate flag, exactly as required. This also agrees with §8.6's b=diag(1,p) computation.

3. **F03** (P2) The exact structures used by G-bilattices are not specified

   **Location:** `packages/AdmissiblePairsAndPadicHodgeStructures/README.md:210` and `:237`, “an exact tensor functor Rep_k G→bilattices”.

   **Claim:** The category defined in §0.1 is already an exact target category, and exactness of its two filtered functors has a fixed meaning.

   **Witness:** For (K,R,R), multiplication by t is an isomorphism on the underlying K-space but has cokernel R/tR on either lattice. Thus underlying-vector-space exactness and lattice exactness differ, even in rank one.

   Neither §0.1 nor §0.2 defines strict morphisms or which sequences are exact. Filtered vector spaces with filtration-preserving maps likewise need their strict exact structure; ordinary exactness after forgetting filtrations would incorrectly accept the G_a example in §0.4. HKI Definition 3.2.1 specifies both lattice strictness and exactness at HKI lines 1109–1113; Definition 3.1.1 and the following paragraph do the same for filtrations at HKI lines 936 and 944–948.

   **Exact repair text:** Add to §0.1: “A bilattice morphism f is strict when f(L_i)=f(V)∩L_i′ for i=1,2. A sequence is exact when its underlying K-vector-space sequence is exact and both lattice sequences are exact; equivalently use the resulting strict exact structure. Tensor and dual use these exact structures.” Add to §0.2: “A filtered morphism is strict when f(F^jV)=f(V)∩F^jV′ for every j. Filtered exactness means exactness at every filtration step, equivalently exactness of the associated graded sequence.” Add the multiplication-by-t example as a negative-control Check.

   **Repair test:** Multiplication by t fails strictness because tR≠K∩R=R. The G_a extension has trace-F⁰ quotient image 0 while the quotient's F⁰ is k, so it fails filtered exactness despite its exact underlying vector-space sequence.

4. **F04** (P3) The BunG contract uses a stale layer and ownership attribution

   **Location:** `packages/AdmissiblePairsAndPadicHodgeStructures/README.md:9`, `:89`, `:342`, `:381` and `:461`; “BG0 / sigma-centralizer-J-b”.

   **Claim:** The sigma-centralizer is in BG0 and BunGAndNewtonStrata owns the listed foundational bundle-stack constructions.

   **Witness:** `TauCetiRoadmap/BunGAndNewtonStrata/README.md:680` places the centralizer in §1.13. Its lines 178, 1387, 1871 and 1933 explicitly import the foundational constructions from VStackSheavesAndLisseCategories §VS4.0.

   **Exact repair text:** Replace every “BunGAndNewtonStrata BG0 / sigma-centralizer-J-b” by “BunGAndNewtonStrata BG1 §1.13 / sigma-centralizer-J-b”. Replace the ownership sentence by: “VStackSheavesAndLisseCategories §VS4.0 owns BunGeometry, BunNewtonGeometry and BunAutomorphisms. BunGAndNewtonStrata §§0.5, 2.3, 3.4 and 3.7 expose their reductive interfaces; its additional Newton classification and arithmetic theory remains there.” Add the direct VS4.0 supplier contract for these imported carriers, retaining the BunG citations for its additional interfaces.

   **Repair test:** The named centralizer anchor occurs under §1.13. VS4.0 explicitly constructs the three named interfaces at `TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md:1115`, `:1125` and `:1134`. Its merge-order position 149 precedes BunG at 241 and this roadmap at 245, so the corrected ownership adds no upward edge.

5. **F05** (P3) Analytic closure has no three discriminating Checks

   **Location:** `packages/AdmissiblePairsAndPadicHodgeStructures/README.md:1840`; the three Checks of §11.1.

   **Claim:** These Checks test the analytic closure defined using actual rigid level quotients.

   **Witness:** The first uses an abstract two-point set without a rigid level; the second repeats the empty-intersection definition; the third states that no finite-union theorem is asserted. None tests the rigid level or field-of-definition conditions.

   **Exact repair text:** Replace the three bullets by: “Take G=G_m, b=1, mu=0, so M_C is the constant diamond Q_p×. At levels K_n=(1+p^n Z_p)×I, n≥2, every quotient point is defined over L. (1) The closure of {1} is {1}, since the intersection of its coset containers 1+p^n Z_p is {1}. (2) The closure of {1,p} is {1,p}, using the union of their two cosets at every level. (3) The closure of 1+p^m Z_p is that entire compact open set: it is already a level-m pullback. These computations hold in both analytic structures, also at p=2.” Keep the empty-intersection convention in the definition and add, separately, that the closure of the empty subset is empty because an empty rigid container exists.

   **Repair test:** The three outputs are respectively one point, two points in different valuation components, and an infinite compact open subset. Every container used is an actual closed rigid subdiamond at the indicated level, rather than a freely stipulated subset.

6. **F06** (P3) Corollary C has the wrong printed page

   **Location:** `packages/AdmissiblePairsAndPadicHodgeStructures/README.md:724` and `packages/AdmissiblePairsAndPadicHodgeStructures/sources.toml:13`; “Theorem B and Corollary C, pp. 5–6”.

   **Claim:** Both results are on pages 5–6 of HKI arXiv v2.

   **Witness:** HKI line 332 marks printed page 8; Corollary C begins at HKI line 347. Theorem B begins at HKI line 204 on printed page 5.

   **Exact repair text:** Replace the combined locator in both files by “Theorem B, p. 5, and Corollary C, p. 8 (arXiv v2; HKI lines 204 and 347)”.

   **Repair test:** Each corrected page contains its named result in the cited version; the source key and version remain unchanged.

7. **F07** (P3) The equal-lattice Check is false in rank zero

   **Location:** `packages/AdmissiblePairsAndPadicHodgeStructures/README.md:228`; “the only filtration jump is zero”.

   **Claim:** Equal lattices always have a filtration jump at zero.

   **Witness:** V=0 and L1=L2=0 are permitted. Every filtration step and every graded piece is 0, so the jump set is empty, not {0}; the elementary-divisor list is empty.

   **Exact repair text:** “For L1=L2 of positive rank, the only filtration jump is zero and every elementary divisor is zero. In rank zero the jump set and elementary-divisor list are both empty.” Retain the ramification calculation following it.

   **Repair test:** Rank zero gives (empty, empty); rank one gives jump set {0} and exponent list [0]; rank two gives jump set {0} and exponent list [0,0].

## Verified sound

Read all 2110 README lines and all 43 Suggested.lean lines at the stated head. Coverage: **78 numbered targets**, **0 Lean declarations**, **157 distinct source-line locators resolved and inspected** across all five cached sources (HKI 33, HKII 117, Scholze 1, LiuZhu 3, BhattHansen 3), **120 README Check bullets inspected and tested in 39 groups**, and **20 named supplier-contract groups checked**. R01–R07 identify failures; the tables below record actual computations rather than treating absence of an elaboration error as truth. Source-locator inspection includes the errors listed below; it does not certify every source assertion.

The 23 headline groups named by the module docstring were compared with the README and pins. Their carriers are not supplied by the pins. No statable headline omission, substitute theorem, padding declaration, sorry'd data, lost instance binder, duplicate fully qualified declaration, or forbidden Lean command was found. There is no declaration on which to run a one-tactic probe or `#check @name`; no Lean process was run. The empty acceptance-test namespace is appropriate at these pins.

### Headline and Lean-context audit

| README headline group | Missing carrier named in Suggested.lean | Declaration / variable / instance context |
| --- | --- | --- |
| §0.4 good-bilattice exactness | Exact tensor category of G-bilattices and its trace functors | Absent; no stand-in |
| §§0.5,5.6 BB recovery and adjoint criterion | Good Grassmannian cells and their BB map | Absent; R01 concerns README truth |
| §1.2 Levi invariance | Connected-linear-group isocrystal category and σ-class quotient | Absent |
| §§1.5–1.6 basic strata and twisting | Relative G-bundle stack, strata, inner-twist functor | Absent |
| §2.3 pointwise Tannakian theorem | Admissible-pair/Hodge categories and realizations | Absent |
| §2.4 basic-pair/Hodge equivalence | Both period-latticed categories and comparison | Absent |
| §2.7 rigidified BKF comparison | Rational rigidified BKF category and modifications | Absent |
| §§3.2–3.3 crystalline realization and openness | Good-reduction pairs, motivic group, crystalline realization | Absent |
| §3.4 two-lattice CM criterion | Period-latticed pairs, rational structures, CM predicate | Absent |
| §§4.5,4.7 relative goodness and lattice–connection equivalence | Relative bilattices and trace functors | Absent |
| §§5.3–5.5 Grassmannian geometry and transversality | Connected-linear-group Grassmannian and BB map | Absent |
| §§6.2–6.4 neutral Tannakian families, reduction, type constancy | Neutral families, tensor realizations | Absent; independent de Rham gap explicit |
| §§6.5–6.8 admissible domains, nonemptiness, connectedness | Admissible-locus diamond and modification map | Absent |
| §6.7 connected product theorem | Locally spatial diamonds and cohomological smoothness | Absent; bare topological products would be a substitute |
| §§7.2–7.6,8.1–8.4 Hodge domains and subgroup loci | Neutral Hodge families, domains, line loci | Absent |
| §§9.2,9.6–9.7 period torsors, duality, connectedness | Doubly framed modifications and both period maps | Absent |
| §9.5 minuscule specialness comparison | Subgroup moduli images in the two structures | Absent |
| §§10.2–10.3 exceptional loci and generic classical points | Represented Hodge loci and actual family group | Absent; Baire alone would be a substitute |
| §11.4 generic-point submersion | Actual period map and motivic reduction | Absent |
| §11.5 general bi-analytic Ax–Lindemann | Infinite-level moduli, level structures, special loci | Absent |
| §11.6 minuscule bi-analytic Ax–Lindemann | Both rigid period towers | Absent |
| §11.7 nonbasic period-image density | Neutral-family frame torsor and flag map | Absent |
| §§12.2–12.5 crystalline-frame and uniformization applications | Variations, crystalline frames, local/global period towers | Absent |

The Lean declaration inventory has zero rows: there are no section variables, definitions, instances, theorems or examples. The only import is `Mathlib`; the namespace is `TauCetiRoadmap.AdmissiblePairsAndPadicHodgeStructures`.

### Pinned inputs, suppliers and ownership

The manifest pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The README's pinned claims were checked against the actual declarations:

| Pinned input | Verified scope and limitation |
| --- | --- |
| `Mathlib/RingTheory/WittVector/Isocrystal.lean:113`, `:132`, `:138`, `:157`, `:172`, `:180` | Isocrystal class has no finite-dimension field; classification requires finrank 1 and algebraically closed characteristic-p coefficient field; standard Frobenius is p^mσ. |
| `Mathlib/RingTheory/Perfectoid/BDeRham.lean:51` and `:75` | Absolute completion requires commutative ring, prime p, p nonunit, p-adic completeness; no perfectoid class or relative geometric DVR conclusion. Characteristic-p input gives zero completion. |
| `Mathlib/Topology/Baire/Lemmas.lean:141`, `:256`; `Mathlib/Topology/Baire/CompleteMetrizable.lean:25` | Countable Baire assertions; closed-cover interior theorem also requires nonempty space. These do not construct the Hodge loci. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean:138` | Known Hopf algebra over a field, finite comodules, universe lift; not reconstruction of an arbitrary neutral category. |
| `TauCeti/Algebra/Coalgebra/Subcomodule/Finite.lean:144`, `:292` | Free coalgebra module over commutative semiring; finite-subcomodule containment and union. Countable exhaustion additionally uses finite algebra generation. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean:101` | Field, commutative Hopf algebra, finitely generated Hopf ideal; exterior-power line, subgroup character and scheme-theoretic stabilizer over all value algebras. |
| `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.lean` and `TauCeti/Geometry/Hodge/Structure.lean` | Topological Frobenius quotient and classical complex Hodge structures, respectively; neither supplies relative period-lattice/moduli categories. |

Object searches covered active and completed roadmaps on main, board packages, the 47 supplied sibling heads, and the roadmap-tool current-head index. The direct supplied-head/main/package scan searched 594 README/Suggested files, including package design folders. Same words in Bloch five-term pairs, tropical reductions and complex Ax–Lindemann concern different objects. The connected-linear-group extensions, admissible-pair categories and their two-period special loci remain owned here. The generic curve, group, Tannakian, rigid-geometry and reductive Grassmannian carriers remain imported. R04 corrects the foundational BunG attribution. No Lean name collision is possible in this empty file.

| Named supplier contract checked | Resolved sections/objects and outcome |
| --- | --- |
| RelativeFarguesFontaine | §§4.10–4.12,6.6–6.9,7.2,7.4,7.6: divisor rings, gluing, exactness and positive-ring torsors; localized-module gap remains explicit. |
| ReductiveGroups | Layers 1,2,3,5,6A,7: representations, Lie/group structure, Chevalley data and Levi/unipotent structure; adjoint/orbit and observable-subgroup gaps remain explicit. |
| BunGAndNewtonStrata | Torsor, isocrystal, Newton/Kottwitz, acceptable/basic, torus, bundle-stack, uniformization and automorphism anchors exist; centralizer layer and foundational ownership need R04. |
| VectorBundlesAndIsocrystals | VB0, VB1, VB2:classification, VB4: full slope classification, tensor signs, bundle/cohomology and slope-zero-local-system inputs have the needed scope. |
| ReductiveGroupsPartII | RG2.0 topology/congruence/open-map anchors and RG2.1 Steinberg anchor exist; quotient topologies are not arbitrary topologies. |
| MotivesAndAlgebraicCycles | §§6.1–6.3,6.8: recognition, generation, subobjects and tensor-Isom torsors; canonical-reduction gap distinct from these inputs. |
| DiamondsAndVStacks | D1,D2,D4,D5,D6 cited anchors: sites, descent, smallness, spatiality, profinite products, diamond functor and seminormal full faithfulness. Analytic vector bundles are not all O-local systems. |
| HeckeStacksAndLocalShtukas | §§HS2.12,HS2.15: reductive admissibility/nonemptiness and period inputs; connected-linear extension remains here. |
| AInfCohomology | §§AI.2.2–AI.2.3: BKF realizations and finite-free classification; rational rigidified modification equivalence remains the declared gap. |
| PadicHodgeTheory | §§2.2–2.3,5.5,7.1,7.4: structural periods, perfect-residue functors, associated lattice and full faithfulness; two stated arithmetic gaps not silently supplied. |
| AdicSpacesPartV | RZ.0–RZ.6 cited anchors: dimension, proper images, irreducibility, rank strata, classical/Gauss/Shilov points, resolution and analytic submersions. Infinite-residue hypothesis retained. |
| PerfectoidSpaces | §§P4.15.6,P6.11: universal perfectoid quotient and strong Zariski closedness; not quotient by an arbitrary ideal without perfectoidization. |
| GeometricSatakeAndFusion | GS0 loop geometry and Schubert-smoothness anchors: reductive Grassmannian, bounds, loop truncation, stabilizers and smoothness. Nonreductive extension remains here. |
| DiamondSixOperations | §§S2.4,S3.2,S4.2,S4.3: connectedness/cohomology, duality and Künneth inputs; the connected product result is proved here. |
| EndoscopicTransferAndUnitaryTraceComparison | §§12.5,12.11: marked Lubin–Tate/Drinfeld towers and dual conventions; inverse-transpose/Tate normalizations inspected. |
| IgusaVarietiesAndTorsionConcentration | Layer IG.1 exists; ordinary elliptic full-tower/unit-root/monodromy extension is declared, not presumed. |
| PerfectoidShimuraVarieties | §§2.2,3.1,3.5: infinite level and period interfaces exist; uniformization over completed unramified reflex field with diagonal quotient remains declared. |
| HilbertModularVarietiesAndShimuraCurves | §§R18.5.7,15,20,21: quaternionic uniformization and its tower/descent interfaces; local inner form and arithmetic quotient retained. |
| AdicSpaces | Layer 6 supplies the sheafed absolute curve, beyond the pin's topological quotient. |
| AlgebraicVectorBundles | L0A–L0C,L2A–L2B supply ordinary tensor/bundle comparisons; period descent remains assigned separately. |

All nine declared gap slugs match between `design/plan.json` and the README, with named earlier suppliers and the hypotheses supplied in the brief. None is unowned, a disguised duplicate, or an undeclared supplied theorem. Compatibility clauses belong to the same requested interface rather than unrelated tasks. They are not package defects.

The read-only dependency command returned:

```text
depcheck: 48 roadmaps, 555 edges, 0 problem(s)
```

There are no UPWARD or CYCLE lines. Independently, all 191 explicit internal section edges among the 78 targets point to earlier sections. The base and inverse period constructions are ordered before their use in connectedness and Ax–Lindemann. No merge-order or tooling file was edited. The design diff changes only the top-level gaps list. The last repair report marks F01–F08 applied and contains no settled “not actionable” finding requiring a re-raise marker.

The requested comparison against `origin/main` lists seven changed files, all inside `packages/AdmissiblePairsAndPadicHodgeStructures/`. No forbidden process narrative, pull-request identifier, algorithm, Lean `lemma`, `set_option`, extra import or admitted data declaration occurs in README/Suggested.lean. This pass wrote only its report and scratch notes.

### Computed target audit

Standing hypotheses are the README conventions. Characteristic-zero group assertions exclude inseparable characteristic-p examples and finite disconnected groups such as S₃ or Q₈; their noncommutative identities were instead tested on connected matrix groups. p=2 and p=3 remain allowed. A uniformizer is a nonzero nonunit: a field or zero ring cannot supply the complete-DVR examples. Empty loci, rank zero, identity maps, nonreduced probes, noncompact parameter sets and disconnected bases are recorded where admitted. There are no natural-number divisions or out-of-range indexed Lean operations in the empty file.

| Target | Instances | Computed values | Result/change |
| --- | --- | --- | --- |
| 0.1 Lattices and bilattices | F₂[[t]], ranks 0,1, exponents −1,0,1, ramification 2 | Empty type at rank 0; trace nonzero iff i+a≤0, jumps 1,0,−1, after ramification 2,0,−2; tR≠R although tK=K. | R03 strictness; R07 rank-zero Check. |
| 0.2 Good G-bilattices | G=1,Gₘ,Gₐ; nonsplit torsor | Types: unique, integer a, only 0 respectively. Unipotent lattice determinant valuation 0, minimum entry −1 gives (−1,1), not good for Gₐ. Quaternion torsor over Qₚ[[t]] has Brauer invariant 1/2; algebraically closed residue excludes it. | R03 exact category. |
| 0.3 Specialization dominance | Unipotent lattice versus split | Actual (1,−1) has first partial sum 1≥0 for Levi (0,0); totals both 0. Split case has equality (0,0). | Dominance correct. |
| 0.4 Exactness criterion for goodness | Unipotent extension; split torus; zero | Trace F⁰ quotient image 0 versus quotient F⁰=k; split case k=k; zero case 0=0. | R03 fixes meaning of exactness. |
| 0.5 Recovery from a filtration | γ(u)=2u,γ(t)=2t; GL₂ types (1,0),(2,0) | u/t invariant; t⁻¹e₁ absent from invariant L but present in canonical lift with the same flag. Root weights −1,0,1 give zero-dimensional fibre; −2,0,2 leave a nonzero lift parameter. | R01 false fixed-point claim. |
| 1.1 G-isocrystals and basic classes | Upper Borel diag(p,1); torus; b=1 | Upper-root slope 1: nonbasic in Borel, basic in torus where Newton is central. Identity slopes all 0. | Ambient basicness correct. |
| 1.2 Levi invariance of B(G) | Borel to Levi | Both classes have slopes (1,0); basicness false in Borel, true in torus. Unipotent classes disappear, centrality need not be preserved backwards. | Correct scope. |
| 1.3 Sigma-centralizer and inner form | Identity; GL₂ diag(p,1); simple slope 1/2 | Centralizer dimensions dim G, 2, 4 respectively. Nonbasic split centralizer is not inner GL₂; basic simple one is D×. | Basic qualifier necessary. |
| 1.4 Bundles for connected linear groups | G=1; slope-zero and negative bundle directions | Bun₁=point; slope-zero adjoint direction has local-system automorphisms. Positive Newton slope gives negative bundle slope and nonzero extension directions. | No nonbasic constant-group replacement. |
| 1.5 Basic-stratum theorem | b=1 versus Borel diag(p,1) | At b=1, U slope 0 and locally H¹=0; at diag(p,1), bundle slope −1 and H¹ can be nonzero. | Basic hypothesis prevents failure. |
| 1.6 Basic twisting of bundle stacks | b=[[1,1],[0,1]],x=diag(2,1); torus slope n | σ_b(x)=[[2,−1],[0,1]]; b⁻¹σ_b(x)=σ(x)b⁻¹=[[2,−2],[0,1]]. Twisting subtracts n; b becomes 0, b⁻¹ becomes −n. | Direction correct. |
| 2.1 Pointwise p-adic Hodge structures | Zero; Tate n=−1,0,1; O(1)⊕O(−1) | Zero pure in each weight; Tate weights 2,0,−2, modified slopes 0; average slope 0 of O(1)⊕O(−1) does not make its slopes (1,−1) pure. | Semistability excludes wrong model. |
| 2.2 Pointwise admissible pairs | b=p⁻ⁿ and lattice tᵃ; rank 0 | Modified slope n−a: 0 when a=n, 1 when n=1,a=0. Rank-zero realizations both 0. | Sign correct. |
| 2.3 Pointwise Tannakian theorems | Unit, zero, additive extension | End(unit)=Qₚ; zero object's group=1; nonzero additive extension can have Gₐ, connected but nonreductive. | No semisimplicity overclaim. |
| 2.4 Basic pairs and Hodge structures | Slopes 0,−1 and tensor square | Separate weights 0,−2, not average −1. Tensor slopes −1−1=−2, weights −2−2=−4. | Grading consistent. |
| 2.5 Mumford–Tate and motivic Galois groups | Unit,Tate,additive extension; character line | Groups 1,Gₘ,Gₐ; nontrivial character line has invariant space 0 but is stable, so invariants alone miss its stabilizer. | Characters necessary and present. |
| 2.6 Invariants and existence | Torus b=p⁻ⁿ,type a; noncentral Borel | n−a=0 gives point; n−a=1 gives empty. Upper Borel root slope 1 violates G-basicness. | Centrality retained. |
| 2.7 Rigidified BKF comparison | Unit quadruple; slopes 0,−1 | Unit (O,O,id,id). Bundles O⊕O(1) have nonzero Hom(O,O(1)); changing β changes rigidification, so forgetting β loses data. | Declared BKF input retained. |
| 3.1 Good reduction and analytic lattices | Split versus t⁻¹ extension; Tate | Canonical lift of jump −1 is tR; split off-diagonal 0 is integral, t⁻¹ is not. | Analytic lift condition substantive. |
| 3.2 Crystalline realization of good reduction | Strict field, unit,Tate | D_cris ranks 1,1; slopes 0,−1; tensor p⁻¹p⁻¹=p⁻². | Perfect-residue hypotheses retained. |
| 3.3 Open Galois image | Unit; cyclotomic image | Image/envelope 1/1 for unit; open subgroup of Zₚ× is open in Qₚ×, Lie dimensions 1=1. | Conditional Serre supplier. |
| 3.4 Two-lattice CM criterion | Unit,Tate,unipotent extension | First two have torus groups and two canonical lattices; nonzero additive extension has Gₐ, not torus, although graded constituents are toric. | Whole group, not semisimplification. |
| 4.1 Rigid analytic subdiamonds | Cusp; square-zero thickening; field extension | u∉L[u²,u³] but in normalization; ε maps to 0 at field points. Finite L′/L gives rigid point; transcendental C-point need not. | Seminormal and field restrictions necessary. |
| 4.2 Coefficient and group local systems | Rank 0; Tate; order-two monodromy p=2,3 | GL₀=1; untwisted invariant sections of Qₚ(1) on arithmetic point=0, associated analytic line rank=1; −1≠1 in Q₂,Q₃. | Neutral versus local-system distinction. |
| 4.3 Closed integrality locus | 0,t⁻¹,z/t; ideals 0,1 | Integral loci whole,empty,{z=0}; quotient by 0 preserves ring, by 1 is zero ring with empty space. | Closed-locus conventions correct. |
| 4.4 Relative bilattices and their type | tᵃ line; z/t family | Jumps −a,a with cancelling Tate factors. At z=0 type (0,0), at z=1 type (1,−1). | No premature constancy. |
| 4.5 Relative goodness and trace exactness | Split and additive bad lattice | Split trace quotient image k=k; bad trace quotient image 0≠k despite tensor compatibility. | R03. |
| 4.6 The trivial-filtration lattice functor | Trivial and shifted filtration | Trivial M₀ has exponent 0; jump 1 gives exponent −1. Supplier connection boundary is −∇. | Associated-lattice ownership retained. |
| 4.7 Smooth rigid lattice–filtration comparison | F¹=F²=span(e₁+ze₂); one-step flag | Derivative e₂ dz is outside F¹, so two-step flag fails; inside F⁰=E for one-step flag, so passes. On a point Ω=0. | Transversality discriminates. |
| 5.1 Non-reductive de Rham Grassmannians | Gₐ,Gₘ | Good Gₐ cell={0}, but t⁻¹ is nonzero in B_dR/B_dR⁺. Gₘ types=Z. | Good locus properly restricted. |
| 5.2 Subgroup immersion criterion | U⊂SL₂; H=1; χ(h)=2 | SL₂/U=A²−{0} quasi-affine not affine; G/1=G affine. zχ(h)=1 gives z=1/2; z=2 gives 4≠1. | Character inverse correct. |
| 5.3 Grassmannian geometry and Schubert loci | GL₂ (1,0),(2,0); torus | Minuscule cell=P¹ closed; closure of (2,0) contains (1,1), so open cell not closed; torus cell=point. | Properness scope correct. |
| 5.4 Faithful-representation cutout | Gₐ t⁻¹ and 0 | Actual first partial sum 1>0 violates zero bound; zero lattice has (0,0) and passes. | Representation bounds exclude wrong model. |
| 5.5 Rigid sources and Griffiths transversality | Classical versus geometric additive point | Good finite-extension invariant point has additive type 0; geometric t⁻¹ is nonzero and not good. | Field assumptions necessary; abstract route needs R01. |
| 5.6 Adjoint-weight BB criterion | Borel weight −2 and inverse +2; GL₂ minuscule | Max weights 0 and 2: first BB isomorphism, second has nonzero fibre parameter. GL₂ weights −1,0,1 pass both. | One-sided bound retained. |
| 6.1 Neutral admissible pairs in families | Two components; rank 0 | Componentwise (0,1) not a single rational map; (1,1) is. Rank-zero datum unique. | Fixed rational datum, not connectedness, explains faithfulness. |
| 6.2 Family Tannakian theorem | Unit on connected/two-component base | End(unit)=Qₚ in neutral category versus Qₚ×Qₚ for unrestricted locally constant data. | Neutrality retained. |
| 6.3 G-families and canonical reduction | Unramified quadratic norm-one torus in SL₂ | Qₚ×/N(F×) has 2 valuation-parity classes, H¹(Qₚ,SL₂)=1, so kernel size 2. | Rational-form pieces necessary. |
| 6.4 Good type over rigid bases | Constant pair; z/t over C | Constant type a stays a. z/t has types (0,0),(1,−1) at 0,1; C is nondiscrete, outside theorem. | Conditional arbitrary-field criterion. |
| 6.5 b-rigidified admissible loci | Torus matching/mismatch; trivial group | Modified slope 0 gives one admissible point; slope 1 gives none; G=1 gives one point type 0. | Inverse type correct. |
| 6.6 Non-emptiness and rigid points | Trivial,torus,nonbasic Borel | Domains point, matching point/mismatching empty; Borel diag(p,1) root slope 1 excludes basic representation claim. | Basicness retained. |
| 6.7 Cohomologically smooth connected products | Connected/disconnected/empty factors | Component counts 1·1=1, 2·1=2, 0·1=0. | Nonempty connected assumptions necessary. |
| 6.8 Geometric connectedness of admissible loci | U=1; torus | Unipotent fibre count 1; matching torus components 1; mismatching space empty. | Nonemptiness retained. |
| 7.1 Neutral Hodge structures in families | Monodromy −1; disconnected base | −1≠1 for p=2,3; neutral rational datum has identity monodromy. Single rational map gives equal component values, not (0,1). | Variations not confused with neutral objects. |
| 7.2 Tannakian structure of Hodge families | Unit,Tate,rank 0 | Groups 1,Gₘ,1 all connected; no positive-rank requirement. | Passes. |
| 7.3 The Hodge period domain | Tate; Borel | Tate n=1 weight −2 and singleton compatible domain; Borel diag(p,1) adjoint slope 1 not central. | G-basic invariant correctly restricted. |
| 7.4 Hodge–Tate loci of lines | Filtration jumps n=−1, a=0,−1 | Fⁿ⊂Fᵃ iff n≥a: false for (−1,0), true for (−1,−1). Matching pure lines equal. | Containment direction correct. |
| 7.5 Rigid closedness of Hodge–Tate loci | [1:0],[1:1]; zero/unit equations | Containing e₁ is c=0: true,false respectively. Zero equation gives whole, unit equation empty. | Closedness direction correct. |
| 7.6 Special Hodge subvarieties | Weights {0,−1,2},{0,1,−2}; torus | Min weights −1,−2,0: first and torus pass Hodge–Tate bound, second fails. | One-sided distinction necessary. |
| 8.1 Hodge loci of sub-isocrystal lines | Tate n=−1,0,1 | Étale exponents −1,0,1; inclusions t⁻¹R⊂R false,R⊂R true,tR⊂R true; matching twist restores equality. | Sign correct. |
| 8.2 Functoriality of admissible loci | Identity; g with σ(g)≠g | Identity g=1 preserves b. b=1 transported to gσ(g)⁻¹≠1, ordinary conjugation would yield 1. | Marked sigma-conjugacy necessary. |
| 8.3 Closed subgroup admissible loci | Norm-one torus; Borel | H¹-kernel size 2. [1:1] is ambient-admissible but not subgroup-admissible for diag(p,1). | No unrestricted ambient intersection. |
| 8.4 Special admissible subspaces | Weights {0,1,−2}; incompatible torus | Max 1 passes Hodge bound; min −2 fails Hodge–Tate bound. Torus modified slope 1 gives empty. | Nonempty and upper bound retained. |
| 8.5 Torus and Lubin–Tate special points | Quadratic F⊂D, ramified/unramified,p=2,3 | dim_F D=2, nonzero vectors invertible; D×/F×=P¹(F), Qₚ dimensions 4−2=2. | Quotient correct. |
| 8.6 Borel and parabolic boundary examples | Borel diag(p,1); GL₃ example | Ambient a≠0, subgroup c=0: [1:0] both,[1:1] ambient only,[0:1] neither. GL₃ determinant valuation 0/minor −1 gives (−1,0,1). | Confirms R02. |
| 9.1 Infinite-level admissible moduli | G=1,compatible Gₘ | Framed moduli point and Qₚ× respectively; simultaneous marking equivalence removes an extra independent frame coordinate. | Markings retained. |
| 9.2 The two period maps | Tate; basic/nonbasic frames | Étale n plus de Rham −n=0; compatible torus fibres Qₚ×. Nonbasic automorphisms have nonconstant directions. | Basicness needed for second rational torsor. |
| 9.3 Functoriality at infinite level | Identity; noncommuting frame changes | Identity preserves markings; g(αh)=(gα)h even when gh≠hg. | Actions commute on opposite sides. |
| 9.4 Hodge and Hodge–Tate special subvarieties | Mirabolic weights {0,1,−2}; dual | Upper bound passes, lower fails; dual {0,−1,2} reverses outcomes. | Special notions differ. |
| 9.5 Comparison of the three special notions | GL₄ diag(t,t,1,1); subgroup; torus | Adjoint weights −1,0,1; subgroup weights subset, both bounds pass; torus weights 0. | Minuscule restriction sound. |
| 9.6 Basic duality | Noncommuting b,x of §1.6; torus | b⁻¹σ_b(x)=σ(x)b⁻¹=[[2,−2],[0,1]]. Torus n↦−n↦n under double duality. | Duality sign correct. |
| 9.7 Geometric connectedness of Hodge domains | Matching/mismatching torus | Inverse domains both singleton or both empty; nonempty component count 1. | Nonemptiness retained. |
| 10.1 Hodge-exceptional and generic loci | Distinct generating maximal tori; constant actual group | Each torus dimension 2<4, generated GL₂ dimension 4. Enlarging a constant actual group artificially does not change monodromy. | Actual generated group used. |
| 10.2 Countable closedness of the exceptional locus | Gₘ Laurent algebra; exterior degree 0; line 1+xᵐ | Span −i≤j≤i has dimension 2i+1; degree-zero stabilizer Gₘ; line 1+xᵐ stabilizer μₘ (m>0). pⁿ→0 shows a noncompact projection can omit a limit. | Countability,characters,compactness meaningful. |
| 10.3 Dense Hodge-generic classical points | Finite and infinite residue field | f=T^q−T has value norm ≤ ∥π∥ on integral L-points, Gauss norm 1; neighborhood  ∥π∥≤∥f∥² excludes those points. Infinite residue avoids finitely many nonzero polynomial zero sets. | Infinite residue essential. |
| 11.1 Analytic Zariski closures | Compatible torus M_C=Qₚ×, A={1},{1,p},∅ | Intersections of shrinking compact-open coset containers give {1},{1,p},∅; empty index family instead gives all Qₚ×. Original third Check computes no value. | R05 inadequate Checks. |
| 11.2 Analytic closedness of special subvarieties | Torus; one-sided mirabolic | Torus flag singleton closed both sides; weights {0,1,−2} satisfy only upper bound. | Direction-specific assertion retained. |
| 11.3 Connected-component formula for closure | A connected inside M₁⊔M₂ | A lies in M₁; empty-index intersection is M₁∪M₂, different when M₂ nonempty. | Whole-ambient alternative retained. |
| 11.4 Generic-point period submersion | GL₂ flag; torus; two components | Full tangent rank 1=dim P¹ versus deficient 0; torus 0=0. Full rank on one component cannot give the other. | Component qualification necessary. |
| 11.5 Bi-analytic Ax–Lindemann theorem | Weights {0,−1,2}; empty family; minuscule | Lower bound passes, upper fails. Empty index gives whole ambient. GL₂ weights −1,0,1 pass both. | General and minuscule claims distinguished. |
| 11.6 Minuscule Ax–Lindemann theorem | [1:c], c∈L outside E; subgroup of GL₄ | X₁−cX₀ defined over L, not E. Restricted weights from (1,1,0,0) remain between −1 and 1 even nonreductively. | Field and general-group hypotheses retained. |
| 11.7 Hodge–Tate period-image density | Actual torus versus enlarged GL₂ | Actual flag dimension=period image dimension=0; enlarged GL₂ flag dimension 1 but group not actual generated group. | Density correctly uses actual group; boundary R02. |
| 11.8 Nonbasic Serre–Tate boundary | Original μ=(−1,0), corrected (0,−1) | Upper-root weights −1,+1. Original Hodge cell point, HT flag A¹; corrected Hodge cell A¹, HT flag point. x=0,1 distinct lattices, same corrected HT flag. | R02. |
| 12.1 Variations of p-adic Hodge structure | Order-two local system; Tate twist | Monodromy −1 nontrivial but weight 0; twist adds Newton slope −n, weight −2n. | Variations retain monodromy. |
| 12.2 Crystalline-frame cover and period map | Rational versus integral torus frames | Fibres Qₚ× versus Zₚ×; quotient Qₚ×/Zₚ×=Z via valuation. | Integral reduction not whole torsor. |
| 12.3 Katz–Igusa obstruction | p=2,3; full versus trivial monodromy | Z₂×,Z₃× infinite nondiscrete; zero-dimensional rigid classical fibres locally discrete. Trivial fibre singleton gives no obstruction. | Ordinary Igusa gap necessary. |
| 12.4 Conditional basic Hodge-type application | Γ=1 and γ≠1 diagonal quotient | Γ=1 gives product; (x,y)∼(γx,γy) for nontrivial Γ though coordinates may differ. | Arithmetic quotient retained. |
| 12.5 Products of Shimura curves | 0,1,2 local factors; quaternion forms | Dimensions 0,1,2. Invariants (∞,p): D=(0,1/2),B=(1/2,0). Diagonal Γ identifies pairs, not each factor separately. | Inner form and quotient correct. |


For p=2,3 and Tate n=−1,0,1, the repeated normalization test gives isocrystal slopes (1,0,−1), bundle slopes (−1,0,1), étale exponents (−1,0,1), de Rham exponents (1,0,−1), weights (2,0,−2), and modified slopes (0,0,0). The noncommuting frame test in §§1.6 and 9.6 pins the direction beyond the torus case. The Borel root computation in R02 is the failed cross-layer normalization.

### README Check ledger

Numbers C1–C4 mean the bullets in their printed order. Values below test all 120 bullets in the 39 Check groups. A compatibility assertion is tested on its displayed object, not counted as a new theorem. R05 identifies bullets that do not supply a mathematical test.

| Section / Checks | Instances and computed results | Outcome |
| --- | --- | --- |
| 0.1 C1–C3 | C1: a=−1,0,1 gives jumps 1,0,−1. C2: ranks 0,1,2 give jump sets ∅,{0},{0}; ramification e=2 sends a=1 to 2. C3: determinant valuation 0 and minimum entry valuation −1 give type (−1,1); subline and quotient exponents 0. | C2 fails in rank 0: R07; others agree. |
| 0.2 C1–C4 | C1: diag(t,1) gives type (1,0), rank 0 gives empty type. C2: Gₐ has cocharacter 0 but its off-diagonal t⁻¹ lattice has GL₂ type (−1,1). C3: Gₘ² exponents (1,−1) are not identified with (−1,1) by a torus Weyl group. C4: quaternion Brauer invariant 1/2 becomes 0 over algebraically closed residue. | Positive, negative, and descent controls discriminate; R03 supplies exact structures. |
| 1.1 C1–C3 | C1: Gₘ b=p has slope 1, central. C2: upper Borel diag(p,1) acts on E₁₂ with slope 1, so is not basic there. C3: b=1 has every slope 0. | Basicness is measured in the specified group. |
| 1.3 C1–C3 | C1: σ(g)=g gives G(Qₚ). C2: slope-1/2 simple GL₂ has centralizer D×, Qₚ-dimension 4. C3: diag(p,1) centralizer Qₚ××Qₚ× has dimension 2≠4. | Nonbasic inner-form claim correctly excluded. |
| 1.4 C1–C3 | C1: one trivial torsor, one arrow. C2: GL₁ bundles are the supplied line bundles O(n). C3: an upper-root bundle O(−1) has nonzero extension classes, whereas its Levi bundle forgets them. | Terminal, compatibility, and nonreductive controls agree. |
| 1.6 C1–C3 | C1: twisting slope m by 0 gives m. C2: m=3,n=1 gives 2. C3: (m−n)+n=m, and noncommuting b,x satisfy b⁻¹σ_b(x)=σ(x)b⁻¹. | Both scalar and noncommutative directions agree. |
| 2.1 C1–C3 | C1: Qₚ(1) has weight −2, lattice t⁻¹R; dual weight 2, lattice tR. C2: zero has no slopes and all realizations 0. C3: O(1)⊕O(−1) has mean 0 but slopes 1,−1. | Purity uses actual slopes. |
| 2.2 C1–C3 | C1: slope 0, L_et=R=L_dR. C2: slopes 1,−1 are not both 0 despite total 0. C3: n=−1,0,1 gives slope 1,0,−1 and de Rham exponents 1,0,−1. | Signs and admissibility agree. |
| 2.4 C1–C3 | C1: weight 0. C2: slope list (0,−1) becomes weights (0,−2). C3: a lattice mixing the two summands is not the direct sum of its slope intersections. | The basic-subcategory condition excludes C3. |
| 2.5 C1–C3 | C1: every tensor automorphism of unit sums is identity. C2: nonzero Tate generator gives Gₘ. C3: [[1,u],[0,1]] preserves e₁ for all u, fixes e₂ iff u=0. | Stable-line and invariant-vector conditions differ. |
| 3.1 C1–C3 | C1: Tate n=1 has canonical L_et=tR, jump −1. C2: unit-by-unit extension parameter 0 passes; t⁻¹ mod R is nonzero and fails analytic lifting. C3: such a nonzero good-reduction extension cannot have two analytic lattices, since its group Gₐ is not a torus. | One analytic lattice is weaker than two. |
| 4.1 C1–C3 | C1: disc dimension 1, finite-extension point dimension 0. C2: coordinate transcendental over L has no finite field of definition. C3: u is absent from L⟨u²,u³⟩ but present in its seminormalization; ε in a square-zero thickening maps to 0 at every geometric point. | Seminormal representative matters. |
| 4.2 C1–C4 | C1: frames GL_n(Λ), with GL₀=1. C2: −1 monodromy differs from 1 at p=2,3. C3: the trivial analytic line maps to the rank-one O-local system. C4: arithmetic O(1) has rank 1 but no invariant basis after finite extension; cyclotomic weight remains 1. | Analytic descent and local freeness differ. |
| 4.4 C1–C3 | C1: a=1 gives first jump −1, second +1. C2: z=0 gives (0,0), z=1 gives (−1,1). C3: multiplication by t shifts the graded piece by C(1); γ(t)=χ(γ)t, so an untwisted identification changes by χ. | Type variation and twist detected. |
| 4.6 C1–C3 | C1: F¹=K gives canonical t⁻¹R. C2: F⁰=K,F¹=0 gives R. C3: a=−1 gives tR, not t⁻¹R. | Lattice exponent is minus the filtration jump. |
| 5.1 C1–C3 | C1: GL₁ recovers the supplied one-leg lattice space. C2: exponents −1,0,1 give three cells, each one flag. C3: t⁻¹ mod R≠0 in Gr_Gₐ, whose good cell contains only 0. | Nonreductive good locus is smaller. |
| 5.3 C1–C3 | C1: torus cell dimension 0. C2: GL₂ type (1,0) flag P¹ has dimension 1, no smaller equal-degree dominant type. C3: (2,0) dominates (1,1): first partial sums 2≥1, totals 2=2. | Minuscule closedness not extended to C3. |
| 6.1 C1–C3 | C1: at one geometric point, unit realizations are Qₚ and Qₚ-breve with comparison 1. C2: nonidentity isocrystal monodromy prevents a fixed global W. C3: on two components, (0,1) cannot be one fixed map; (1,1) can. | Fixed W explains faithfulness even on disconnected bases. |
| 6.3 C1–C3 | C1: constant Tate family's group Gₘ is unchanged by connected base. C2: μ₂ would give a nontrivial finite quotient, ruled out by connectedness, not by the word neutral alone. C3: unramified norm-one torus in SL₂ has H¹=Qₚ×/N(F×) of size 2, while H¹(SL₂)=1. | Kernel-of-torsors control is substantive. |
| 6.5 C1–C3 | C1: b=1 and exponent 0 give modified slope 0. C2: b=p⁻¹ and exponent 0 give modified slope 1 and are excluded. C3: in rank one, rigidifications 1 and p are distinct frames, related by p∈Qₚ×. | Rigidification is retained. |
| 7.1 C1–C4 | C1: unit weight 0. C2: n=1 gives weight −2 and exponent −1. C3: −1 versus +1 monodromy remains distinct in Q₂ and Q₃. C4: a nontrivial G_b(Qₚ)-torsor has no global section although every geometric fibre is nonempty. | Neutrality and variation distinguished. |
| 7.3 C1–C3 | C1: specified torus type has one compatible point. C2: Borel ν=(1,0) gives root weight 1, not central, so no basic domain. C3: ν=−1 gives weight −2, not −1. | Centrality and factor two agree. |
| 7.4 C1–C3 | C1: tⁿR⊂tⁿR is equality. C2: n=−1,a=0 gives false; n=0,a=−1 gives true. C3: for lattice Re₁+tRe₂, the line e₁ is integral but t⁻¹e₂ is not. | Line integrality does not assert integrality of the entire localization. |
| 7.6 C1–C3 | C1: torus flag dimension 0. C2: minimum weight −2<−1 fails. C3: identity GL₂ type (1,0) has weights −1,0,1 and gives the whole domain. | Lower bound is the relevant bound. |
| 8.1 C1–C3 | C1: n=1 has φ=p⁻¹ and L_et=tR, equal to the required tR. C2: swapping e₁,e₂ moves a chosen invariant line; retaining the old line tests a different condition. C3: t⁻¹R⊂R false whereas R⊂R true; matching t⁻¹R⊂t⁻¹R true. | Negative twist must be kept. |
| 8.2 C1–C3 | C1: identity maps L to L. C2: a permutation matrix exchanges line coordinates and the corresponding b-eigenspaces. C3: b_H=1 and σ(g)≠g give gσ(g)⁻¹≠1, unlike ordinary conjugation. | Marked σ-conjugacy necessary. |
| 8.4 C1–C3 | C1: torus adjoint weights all 0. C2: modified slope 1 yields empty locus. C3: weight 2>1 fails the upper bound. | Nonemptiness and bound tested separately. |
| 8.5 C1–C3 | C1: exponent a=1 requires slope −1; slope 0 leaves modified slope −1. C2: dim_Qp D×−dim_Qp F×=4−2=2=dim_Qp P¹(F). C3: a quadratic maximal subfield has F-dimension 2 in D regardless of ramification, including p=2. | Stabilizer and local generality agree. |
| 9.1 C1–C3 | C1: trivial group gives one point. C2: torus flag point but frame fibre Qₚ×. C3: frames 1 and p give distinct moduli points with equal lattice-period target. | Moduli not replaced by their flags. |
| 9.2 C1–C3 | C1: exponents (1,0) versus (−1,0) give opposite flags. C2: nonbasic GL₂ diag(p,1) has rational centralizer dimension 2 rather than 4, and its bundle automorphisms have nonconstant directions. C3: minuscule weights −1,0,1 have BB fibre dimension 0. | Second constant torsor restricted to basic data. |
| 9.3 C1–C3 | C1: identity leaves both frames fixed. C2: torus domain dimension 0, frame fibre Qₚ× still infinite. C3: a basic slope-1/2 GL₂ frame group is D×, not split GL₂(Qₚ). | Inner form retained. |
| 9.4 C1–C3 | C1: torus weights 0 satisfy both bounds. C2: mirabolic weights 0,1,−2 have maximum 1, minimum −2. C3: GL₄ (1,1,0,0) has weights −1,0,1 even on a nonreductive parabolic. | Two notions differ; minuscule does not force reductivity. |
| 10.1 C1–C3 | C1: constant family's pointwise and total groups equal. C2: two distinct conjugate tori generate GL₂ of dimension 4 while each has dimension 2. C3: for one point, the restricted group is exactly its pointwise group. | The converse for arbitrary subdiamonds is correctly avoided. |
| 10.2 C1–C3 | C1: trivial group has no proper stabilizer locus; exceptional set ∅. C2: Laurent span has dimension 2i+1; degree-zero line stabilizer Gₘ; line 1+xᵐ stabilizer μₘ for m>0. C3: two compact parameters give a union of two closed images; pⁿ→0 gives a nonclosed image from discrete N. | Countable exhaustion and compact incidence are different roles. |
| 11.1 C1–C3 | C1: abstract intersection {a}∩{a,b}={a}, but no rigid level supplied. C2: empty intersection equals the universe by definition. C3: no assertion and no value. | R05: all three must be replaced by actual rigid tests. |
| 11.5 C1–C3 | C1: inverse mirabolic weights 0,−1,2 satisfy lower bound −1 but fail upper bound 1. C2: GL₂ weights −1,0,1 satisfy both. C3: empty index intersection includes both components of M₁⊔M₂. | Opposite-special conclusion and empty-index convention agree. |
| 11.6 C1–C3 | C1: X₁−cX₀ vanishes at [1:c]; coefficient ratio c∉E prevents descent to that embedded E-point. C2: GL₄ parabolic inherits weights −1,0,1. C3: torus flag dimension 0, both bounds 0. | Field of definition and nonreductive subgroup generality retained. |
| 12.1 C1–C3 | C1: trivial comparison has both exponents 0. C2: n=1 has weight −2 and comparison exponent −1. C3: order-two character values −1 and neutral character +1 differ, with geometric weight 0 for both. | Geometric fibres do not determine monodromy. |
| 12.2 C1–C3 | C1: a global frame identifies the torsor with base×G_b(Qₚ). C2: valuations on Qₚ× give Z, whereas valuations on Zₚ× are {0}. C3: diag(p,1) has noncentral slope morphism, so the basic construction's hypothesis fails. | Integral frame reduction distinguished from rational cover. |


## Not verifiable

- The nine supplier gaps are contracts, not supplied proofs: `tannakian-canonical-reduction`, `strict-field-serre-openness`, `adjoint-kernel-and-orbit-differential`, `observable-subgroup-embedding`, `basic-hodge-type-uniformization`, `rational-rigidified-bkf-modifications`, `arbitrary-field-full-rank-de-rham`, `ordinary-katz-igusa-monodromy`, and `localized-period-module-descent`. Their declarations, ownership and necessity were checked; the dependent results remain conditional on their delivery. In particular, LiuZhu line 86's finite-Qₚ hypothesis cannot establish the arbitrary-field contract.
- No Lean elaboration or build was run, as required. There are no named declarations, so the requested elaborated-signature comparison has no entries. This does not verify future implementations of the missing carriers.
- Source certification is against the cached arXiv versions explicitly identified by the manifest, not against the differently numbered published articles. No published correction is asserted without evidence. All five directly used texts were legally available; there is no missing-reference request.
- Ownership at the supplied 47 sibling heads, on main/completed, in the board packages, and at the searched supplier heads was checked. No claim is made to have inspected every unrelated open pull request or every proof inside a supplier. The dependency gate checks declared edges; the mathematical audit above additionally checks the consumed interfaces.

## Source issues

- **Error** in HKI at Proposition 3.1.7(2), printed pp. 22–23 (HKI line 1047): the source says infinite-order uniformizer scaling forces invariant lattices to be canonical lifts; it should be supplemented by vanishing of all nonzero twisted coefficient invariants, excluding the invariant u/t counterexample in R01; affects a stated result.
- **Misprint** in HKI at Lemma 4.3.1 proof, printed p. 34 (HKI line 1610): the source says the quotient for M1⊂M2 is M1/M2; it should be M2/M1, as in the next lemma's sequence; affects the proof.
- **Misprint** in HKI at Lemma 4.3.2 proof, printed p. 35 (HKI line 1628): the source says a p-adic Hodge structure of weight λ has bundle slope λ/2; it should be −λ/2 throughout the slope inequalities in the p-adic case; affects the proof.
- **Misprint** in HKI at §4.4 isocrystalline realization formula, printed p. 36 (HKI line 1690): the source says weight w is recovered using Hom from O(w/2) and the isocrystal D_(−w/2); it should be Hom from O(−w/2), tensored with D_(w/2) over its endomorphism division algebra; affects a stated result.
- **Misprint** in HKI at §4.4 weight/slope comparison, printed p. 36 (HKI line 1694): the source says multiplying the isocrystal slope homomorphism by −2 gives the weight homomorphism; it should be multiplication by +2, since the Tate object has slope −1 and weight −2; affects a stated result.
- **Misprint** in HKI at Theorem 5.1.6 proof, printed p. 42 (HKI line 1960): the source says the weight-w summand comes from isocrystal slope −w/2; it should be the summand of slope w/2, giving weight −2 for the slope −1 Tate pair; affects the proof.
- **Misprint** in HKII at §1.1, before Definition 1.1.2, printed p. 5 (HKII line 219): the source says to intersect the closed subset V with C when working on an affinoid open U; it should be V intersect U; affects nothing.
- **Misprint** in HKII at §5.1 observable embedding argument, printed p. 33 (HKII line 1488): the source says G/G′ is quasi-affine for the embedding G into G′; it should be G′/G, consistently with Lemma 5.1.1; affects the proof.
- **Misprint** in HKII at Proposition 6.2.3 proof, printed p. 37 (HKII line 1686): the source says a weight-2ν Hodge structure gives an isocrystal with slope morphism 2ν; it should be slope morphism ν; affects the proof.
- **Gap** in HKII at Theorem 7.2.3 proof, printed p. 42 (HKII line 1938): the source says Liu–Zhu Theorem 3.9 supplies de Rham rigidity over its general p-adic base; it should be supported by an independent arbitrary-perfect-residue-field criterion, since LiuZhu line 86 restricts the base to a finite extension of Qₚ; affects the proof.
- **Error** in HKII at Remark 7.5.3, printed p. 47 (HKII line 2137): the source says ambient admissibility pulls back to subgroup admissibility under every closed inclusion; it should be tested on all subgroup tensor subquotients and the neutral fibre-functor piece; the upper-Borel [1:1] example fails the assertion; affects a stated result.
- **Gap** in HKII at Proposition 7.5.2 proof, printed pp. 47–48 (HKII line 2159): the source says reduction on the whole line Hodge locus directly gives a neutral H-admissible pair; it should be restricted to the neutral kernel-of-H¹ piece; a quadratic norm-one torus in SL₂ has a nontrivial kernel; affects the proof.
- **Misprint** in HKII at Definition 8.4.1, printed p. 52 (HKII line 2347): the source says the conjugating parameter g belongs to Qₚ-breve; it should be g in G(Qₚ-breve), so the displayed σ-conjugation is typed; affects a stated result.
- **Error** in HKII at Remarks 7.5.3 and 9.1.4, printed pp. 47 and 56 (HKII lines 2142 and 2503): the source says upper-Borel b=diag(p,1), μ=(−1,0) gives the Serre–Tate family with constant Hodge–Tate flag; it should be b=diag(1,p), μ=(0,−1) in the matching Tate normalization, as computed in R02; affects a stated result.
- **Error** in HKII at Lemma 9.3.3, printed p. 59 (HKII line 2652): the source says full restricted motivic group characterizes meeting the generic locus for every subdiamond; it should be only the forward implication for general subdiamonds, with equivalence for a point; two exceptional CM tori can jointly generate GL₂; affects a stated result.
- **Misprint** in HKII at Lemma 9.3.5, printed p. 60 (HKII line 2713): the source says weakly Shilov points are defined in Bhatt–Hansen Definition 2.4; it should be Definition 2.5, BhattHansen line 314; Definition 2.4 defines affinoid Shilov points; affects nothing.
- **Gap** in HKII at Lemma 9.3.5 proof, printed p. 60 (HKII line 2734): the source says the residue field is algebraically closed; it should be enough that it is infinite; allowed perfect residue extensions containing Fₚ-bar need not be algebraically closed; affects the proof.
- **Error** in HKII at §10.1 Katz–Igusa discussion, printed p. 64 (HKII line 2885): the source says the rational crystalline-frame cover equals the integral Katz–Igusa tower; it should be the extension of its integral Zₚ× frame reduction to Qₚ×, retaining valuation components indexed by Z; affects a stated result.
- **Misprint** in Scholze at Lemma 7.8 proof diagram, printed p. 45 (Scholze line 2064): the source says the kernel of M0/Fil²→gr⁰M0 is E tensor O-hat(−1); it should be E tensor O-hat(1), as in the preceding exact sequence at Scholze line 2059; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "57fb70aa9c31e8dc0bf5fe2e317f1d23890f6686", "job": "RT-AdmissiblePairsAndPadicHodgeStructures~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
