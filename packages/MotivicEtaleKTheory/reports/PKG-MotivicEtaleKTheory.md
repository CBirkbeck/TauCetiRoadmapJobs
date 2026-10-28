# Package report: MotivicEtaleKTheory

The package expands the accepted design into packages/MotivicEtaleKTheory/README.md, Suggested.lean and metadata.toml. The plan-generated skeleton was compared with the resulting prose: all 27 targets, 49 API facts, 99 accepted target Checks and all seven layers’ examples remain. The transverse-support Check is split between §§5.1 and 5.2; an additional shift negative control appears in §3.3. Each construction has at least three discriminating Checks. The source manifest retains its ten unique keys and their settled access statuses.

The design inputs are unchanged, including design/plan.json: only its top-level gaps were authorized for editing, and no additional gap was necessary. The two existing DifferentialGeometry gaps are quoted with their exact needs in that supplier’s subsection. The package applies the review’s prerequisite corrections in the README; it does not modify the frozen target or supplier arrays in the plan.

## Headline theorem list and statability

This list was saved before writing Suggested.lean. Every entry is **not statable at the pins**; consequently no Lean declaration name is assigned. These are the deep results being tested, not boundary computations.

| Headline | Status and missing carrier |
| --- | --- |
| Integral cubical–simplicial comparison, including supports, coefficients and operations (§§1.3–1.4) | Not statable: face-admissible higher-cycle complexes and shared higher Chow groups. |
| Adams-compatible ordered cube relativity and multiplicative supported pairings (§2.0a) | Not statable: scheme perfect K-spectra, supported face diagrams and Adams operations. |
| Universal integral motivic Chern operations (§2.0b) | Not statable: scheme higher K-groups, higher Chow groups and stabilized classifying sheaves. |
| Rational higher Chern isomorphism, universal-class identification, supports and products (§§2.1–2.4) | Not statable: actual scheme higher K and motivic cohomology carriers. |
| Geometric bifiltered logarithmic comparison and shifted mixed Hodge structure (§3.2) | Not statable: logarithmic sheaves, residue filtration and geometric Betti/de Rham realization. Linear mixed Hodge structures alone do not state this theorem. |
| Small Deligne model and cone deformation retract (§3.3) | Not statable: real Dolbeault complexes with type projections and the Deligne construction; these require a substantial construction, beyond a few simple definitions. |
| Compactification-independent logarithmic Deligne realization (§3.4) | Not statable: SNC compactification diagrams and filtered logarithmic Deligne complexes. |
| Full Deligne product and natural associativity homotopy (§§4.1–4.2) | Not statable: real Dolbeault algebras and their Deligne models. |
| Singular-support semipurity and normalized current criterion (§5.2) | Not statable: geometric Deligne cohomology with supports and the geometric form/cycle-current comparison. |
| Supported cycle-resolution and affine contraction (§5.4) | Not statable: good-position support diagrams and truncated logarithmic total complexes. |
| Universal derived regulator with coherent restriction fibers, pullback and model independence (§§6.1–6.3) | Not statable: integral motivic source, geometric Deligne target and their enhanced restriction diagrams. |
| Independent Beilinson character and identification with regulator composed with higher Chern character (§§7.1–7.2) | Not statable: scheme higher K-groups, universal geometric Deligne Chern classes and the actual realization maps. |
| Multiplicativity on integral higher Chow groups (§7.3) | Not statable: higher Chow groups, geometric Deligne groups, their products and the universal map. |

Suggested.lean contains only import Mathlib, the required explanatory module docstring and namespace TauCetiRoadmap.MotivicEtaleKTheory. It introduces no proxy predicates, assumed comparisons, sorry’d data, scalar replacements, Checks or API catalogue.

## Corrections and unsupported citations

1. Accepted-review F01: add SchemeKTheoryOperations §6.1 to the contract, §2.0a’s Needs and Layer 2 dependencies. The route now names the supported vertex pairing and the several-variable A¹-representability comparison of §6.9. Vertexwise equality alone does not supply the relative operation. All face strata and support complements used there are smooth over the regular base; singular supports themselves need not be smooth. For two line bundles both operations give [LᵃMᵃ]; for two weight-one loops ψ² gives 4 times their product.
2. F02: allocate the common-base total-fiber pairing and its Adams multiplicativity to §2.0a, including the pairings used by ColemanIntegration §§L3.Fa.1 and L3.Fa.3. Its exact-category model and symbol applications retain their owner.
3. F03: add the direct §2.0b prerequisite to §2.4 and consolidate the two SchemeKTheoryOperations entries in §2.1. The coefficient at p=2 is −1, so c₂,₂{2,t}=−{2,t} gives ch₂,₂{2,t}={2,t}.
4. F04: §5.1 tests disjoint supports by the fiber of identity, with product 0. The transverse divisors now have their Check in §5.2: local intersection lengths 1 and 2 give the origin coefficients 1 and 2. Both mathematical examples are retained.
5. F05: define full cubes as Y=X×□ⁿ with product support S=T×□ⁿ at first use and in the consumer contract. Rename the second Gaussian-integer coordinate to s; v=s−i gives v(v+2i)=0. No eigenspace assertion is made for the non-product support {t=2}.
6. Additional mathematical clarification: §3.3 shifts the constructed cochain comparison and its homotopy identities. It does not assert that arbitrary ordinary shifts preserve a real Dolbeault bigrading. The one-dimensional point shifted to odd degree is the negative control. BKK Definitions 5.7–5.10, Proposition 5.12, BKK line 3999–4100 specify the actual domain and comparison.
7. Every definition retains its API and Checks in prose. The four API facts that the design embedded in proof paragraphs (§2.2, two in §3.2, §6.2) also have explicit API bullets. Each API bullet has a literature or supplier locator. No planned qualified name from the design catalogue is asserted as a declaration in Suggested.lean.
8. The accepted design’s PeriodsAndSpecialValues PS.3.2a and KatoEulerSystems §12.1 consumer citations could not be resolved against a supplied readable roadmap: neither roadmap is on main, in the indexed open-head copies, or among this board’s readable package READMEs. Their detailed attribution and the Kato row were omitted; no target, Check or worked example depends on them. ZagierConjecturePolylogarithms M.8 and MixedHodgeModulesAndIrregularHodgeTheory N/logarithmic-filtration were verified in their supplied design READMEs. The resolver does not certify these board design labels, so this check was manual.
9. The design’s final unassigned-interface paragraph was not carried into the README. Its spectral étale/Bott descent, dyadic or normal-ring finite-coefficient comparisons, Kummer gluing and unnamed motivic presentations are not supported by this accepted mathematical scope. The field-diagonal and norm-residue objects have KTheoryFiniteLocalFields §§3.0–3.0a as their owner. No new étale or p-adic theorem is promised because of the package’s historical name.
10. BorelRegulators’ package asks for extra real-descent, finite-transfer and infinitesimal-comparison interfaces in its universal-Deligne gap. This package supplies the accepted embeddingwise universal regulator and its character/product normalization. It does not certify those additional consumer interfaces or their fulfillment. Its explicit arithmetic point-space identification and Borel comparison retain their consumer owner.

## Ownership and duplication sweep

The comparison baseline was main 72d2b66ff21616da10318efb2acda19311dae82a. The manifest and both package Git heads agree on Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Main-roadmap shape was read in TauCetiRoadmap/RealAnalyticGeometry/README.md, TauCetiRoadmap/CompactOperators/README.md and TauCetiRoadmap/SchemeAndStackFoundations/README.md; metadata follows the single-topic main format.

Ownership searches used the roadmaps list/grep/show commands over main and the indexed open heads, and object searches over this board’s package READMEs and Suggested.lean files and both pinned source trees. The separate open-head Lean search found only docstring descriptions of the unavailable motivic/regulator carriers, with no competing declaration. Search families included face-admissible cycles and higher Chow, cubical/mixed cycles, multi-relative K and Adams pairings, higher Chern characters, logarithmic Dolbeault and Deligne models, semipurity, support fibers, universal regulators, Whitney jets and flat ideals. The supplied open-work package files were included, including BorelRegulators, Polylogarithms, ArithmeticKTheory, CohomologyComparisonsPartII, ColemanIntegrationPartII, K2SymbolsBrauerPartII, K3BlochGroups and HabiroCohomologyFoundations. The remaining named open packages were searched by the same objects; no competing construction in them was used as a supplier. Indexed open-head data and board-package data were kept distinct; absence from the index was not interpreted as absence of a supplied board file.

The consumed new-roadmap heads were GeneralAlgebraicKTheory e0552fe, SchemeKTheoryOperations 88dbd5a, KTheoryFiniteLocalFields afe02e8, MotivesAndAlgebraicCycles 79b02f6, ComplexComparisonPartII 2d50a88 and ResolutionOfSingularitiesCharacteristicZero bf45c86. The ownership comparisons used Polylogarithms 4696a1a and ColemanIntegration ae078af. These names are new roadmap folders, rather than revisions used to replace a main supplier. Main suppliers were read from main through the same show command; ComplexManifolds Milestones 1–2 were also read to verify the transported orientation contract. The README’s exact section contracts were checked in these copies, including SchemeKTheoryOperations §§6.1,6.8–6.9, ComplexComparisonPartII §C5.6 and EnhancedDerivedSheaves §E0.6.

No accepted mathematical target was deleted by the package duplication sweep: the accepted design had separated these objects already. The following exclusions were reconfirmed, rather than counted as newly deleted targets:

| Object excluded as a separate construction | Owner consumed, and retained distinction |
| --- | --- |
| Ordinary scheme cycles and weighted pushforward | Mathlib AlgebraicGeometry.AlgebraicCycle and AlgebraicGeometry.AlgebraicCycle.map, Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44,69. Here only the admissible dimension-graded cubical subgroup and its comparison are constructed. |
| Simplicial higher Chow, moving, localization, coefficients, transfers, integral products and motivic-to-K tower | KTheoryFiniteLocalFields §3.0a; no duplicate higher Chow carrier or new tower. |
| Field-diagonal integral Chern map | KTheoryFiniteLocalFields §6.10; §2.0b extends to general schemes and agrees on this field diagonal. |
| Motive-category adapters, representability and relative-cycle specialization | MotivesAndAlgebraicCycles §§4.7–4.8a,4.14,4.17–4.18. |
| Scheme perfect K, supported vertex pairing, Adams/γ theory and degree-zero character | SchemeKTheoryOperations §§2–3,6.1,6.7–6.9,7.1–7.3; §2.0a adds the ordered multi-relative diagram, and §§2.1–2.4 add the higher cycle comparison. |
| General Q/plus/Waldhausen K, localization and product conventions | GeneralAlgebraicKTheory §3.12, §§4.6,4.8,4.14,6.3,7.4–7.7,8.12–8.13. |
| Analytification, geometric de Rham comparison, proper Hodge theory, holomorphic logarithmic comparison and current calculus | ComplexComparisonPartII §§C−1.1,C−1.4,C5.1,C5.3–C5.6,C6.0. MotivesAndAlgebraicCycles §5.7’s unfiltered nonproper de Rham/Betti comparison is its Nori-fiber construction; it is not the smooth Burgos bifiltered resolution or Deligne realization constructed here. |
| Linear pure/mixed Hodge carriers and strictness | Completed/HodgeStructures and the pinned Tau Ceti declarations listed below; §3.2 constructs the geometric filtrations to which they apply. |
| Type decomposition, complex orientation, ∂/∂̄ and exterior calculus | ComplexKahlerGeometry K1–K2 and DifferentialGeometry Layers 0–1,5–9; §3.1 restricts this calculus to the logarithmic image algebra. |
| Resolution, SNC geometry and common refinements | ResolutionOfSingularitiesCharacteristicZero §§5–6 and EtaleCohomologyFoundations §§G.1–G.3. |
| Enhanced derived tensor, fibers, coherent diagrams and descent | EnhancedDerivedSheaves §§0.1–0.4,E0.6,E1.4,E2.6. |
| Dold–Kan equivalence and simplicial-group homotopy comparison | Native CategoryTheory.Abelian.DoldKan.equivalence, plus AlgebraicTopology Stage 8 item 2 for its homotopy interpretation. |
| Explicit Wang/Goncharov currents, shifted comparison complex and Arakelov comparison | Polylogarithms §§5.2–5.12. This roadmap supplies their abstract support resolution and universal comparison, not the explicit analytic regulator. |
| Arithmetic regulator ranks, lattices, Borel comparison and special values | ArithmeticKTheory §§3.2–3.4 and BorelRegulators §§2–6; none is an input here. |

The following notions lie here, below their consumers in the supply order, as in the accepted design: Aₚ, Aₚ,S, Hₚ and their normalized even-degree Green-current criterion move down from Polylogarithms §5.2 into §§5.2–5.3; supported multi-relative cube K, ordered weightwise relativity and its common-base pairing move down from ColemanIntegration §§L3.Fa.1–L3.Fa.3 into §2.0a. No Needs line consumes either later roadmap. There is no additional ownership move. No declaration was assigned another roadmap’s fully qualified name.

## Pinned native audit

At Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44, the defining body is Function.locallyFinsupp X R: it imposes locally finite support and no dimension or face condition. The map at :69 requires QuasiCompact f, dimension weights and residue degrees; properness belongs to the Chow pushforward contract. At Mathlib/Algebra/Homology/HomologicalComplex.lean:59,72, an actual degree-indexed object and differential carry the square-zero law. Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87 localizes integer cochain complexes at quasi-isomorphisms; it is not the enhanced diagram carrier. Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57,261,269 fixes the source-shift-first cone and its two differential formulas. Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean:167 gives an equivalence for an abelian category; it does not identify homotopy groups of arbitrary simplicial groups.

TauCeti/Algebra/Homology/GradedCochainComplex.lean:59 requires an actual graded submodule family, linear differential, degree-one property and square-zero proof. TauCeti/Geometry/Hodge/Structure.lean:62 and Morphism.lean:69 require a conjugation and opposed filtration, and conjugation-equivariant filtration-preserving morphisms. Tate/Basic.lean:43,91,100,111 uses the unscaled integral inclusion and the single type (−p,−p), with filtration cutoff −p. Mixed/Basic.lean:72 specifies rational and complex base-change models and bounded filtrations. Mixed/Strictness.lean:110 proves range(f)∩Fᵖ=f(Fᵖ) for an actual mixed-Hodge morphism. None of these definitions is geometric logarithmic cohomology. A weight-one Tate line has F⁻¹=ℂ,F⁰=0; geometric ℝ(1) additionally marks 2πi.

Both module-path and declaration/body searches were used for missing carriers, not merely this package’s proposed identifiers. The pins contain ordinary cycles and linear Hodge/complex infrastructure, but no shared higher Chow complexes, scheme higher K-spectra, geometric logarithmic Dolbeault sheaves or geometric Deligne regulator on which the listed headlines can be stated. Incidental occurrences of “Deligne” in gamma functions and “regulator” in Dirichlet units or elliptic heights have different objects and domains. Their scalar special cases were not substituted.

## Source audit

All ten citations reuse their established manifest keys. The seven readable works were read in their supplied legal extracted copies at the actual locators, including steps used inside proofs: BFT line 180,266–304,948–963; BF line 381–391,506–552,610–680,705–774,827–842,862–917,919–1045,1440–1463,1539–1553,1619–1630; Levine94 line 407,539,625,655–736,1101–1117,1210–1235,1399–1425,1754–1808,2226–2257; Burgos94 line 102,155–200,316–381; BKK line 3965–4111,4129–4180,4217–4273,4297–4315,4795,4841–4864; DeligneHodgeII line 852–869,988–1006,1044–1058,1142–1167,1217–1255; KLM line 553–570. References use the read preprints’ numbering. No source passage was copied into a deliverable.

BF’s comparison proof explicitly assumes smooth quasi-projective X (BF line 919), despite its broader theorem header. BFT’s explicit-current comparison is projective, whereas its mixed cycle comparison is quasi-projective over any field (BFT line 948,969). Levine94’s direct derived pullback statement is rational (Levine94 line 1794–1799); the integral extension uses the supplier’s integral moving theory. Its iterated-double theorem retains splitting/moving conditions over an infinite field (Levine94 line 1101–1117); arbitrary fields use supplied coprime-degree descent. Its relative Adams discussion alone does not prove the full multiplicative identity (Levine94 line 695–705). BKK Proposition 5.15 has no closedness assumption in the even critical-degree vanishing of its homotopy (BKK line 4142–4148). The raw residue filtration is not identified through blowups: the geometric Hodge comparison uses the shifted cohomological weight and F-filtered refinement maps (DeligneHodgeII line 1147,1223).

Bloch86 §7 remains uncertified for the arbitrary-field universal-class construction and its inverse-cycle identification; BF only provides the read complex-field sketch. Beilinson85 §§1–2 remains an uncertified historical locator; BF supplies the comparison route. Levine98 remains waived chapter-level background and supplies no hidden endpoint proof. No settled text was requested again, no new source was needed and no missing-reference request was created. The manifest’s BKK locator and cited-for entries were expanded to cover the exact Dolbeault domain and shift clarification.

## Adversarial mathematics pass

All computations below are mathematical substitutions into the actual definitions and conventions; no admitted Lean elaboration is used as evidence of truth. All algebraic comparisons retain arbitrary fields, including characteristic 2 and inseparable extensions; the complex realizations require an embedding into ℂ. Fields, regular DVRs and singular/nonreduced supports are tested in their actual domains. Additive complexes have abelian groups; S₃ is used to exclude a false nonabelian extension of Dold–Kan. Negative integer degrees, empty supports, zero coefficient rings and non-product supports are explicit. No finite-residue-cardinality or prime-inversion hypothesis is silently introduced.

The tables use “retain” for a statement whose values agree, and name the repair where one was needed. A target row covers its construction and theorem; separate API rows cover each promised law. The Check table then evaluates every README target Check in order, including the two review additions. The seven layer Examples repeat these same objects and values, as recorded after that table.

| Statement | Instances tried | Computed values on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 normalized cubical definition | point, graph t, double point; n=0,1,2 | C₀(point)=ℤ; Cₙ>0(point)=0; ∂Γₜ=[0], δΓₜ=−[0]; length-two cycle=2 | consistent | retain native subgroup |
| §1.2 mixed complex | (n,m)=(0,0),(1,1), total degree 2 | one and three summands; cross coefficients −1,+1 sum 0; J values −1,+1,−1 | consistent | retain |
| §1.3 integral comparison | point; empty/full support; derived ℤ/2 coefficients | H₀=ℤ and map 1↦1; fibers 0,C; Tor and tensor each ℤ/2 in degrees −1,0 | consistent | retain derived coefficients |
| §1.4 operations | inseparable degree 2; point⊔ℙ¹; two odd classes | transfer after restriction=2 on ℤ; CH¹=0⊕ℤ; exchange sign −1 versus degree-zero +1 | consistent | retain integral supplier input |
| §2.0a cube K/Adams/pairing | n=0,1,2; DVR p=2,3; Gaussian self-product | K₀(k) class k²=2; difference (1,0)=1,(0,1)=−1; ψ² on two loops=4; singular product dimension 1, cotangent 2 | consistent on regular domain | F01,F02,F05 |
| §2.0b universal Chern construction | O(1),O(1)⊕O(−1) on ℙ²; diagonal degrees 1,2,3 | c₂=0,−h²; ch₂=h²/2,h²; diagonal factors 1,−1,2 become 1,1,1 after character factors | consistent | retain c distinct from ch |
| §2.1 higher character | point rank2; ℙ¹; empty and disconnected X | rank2↦2; ch O(±1)=1±h; ∅ gives 0; two ranks remain (2,1) | consistent | consolidate Needs |
| §2.2 comparison and weights | weights0,1,2; unit2; symbol {2,t} | ψ² eigenvalues1,2,4; both characters give unit[2], valuation1; ordered residue[2], reverse−[2] | consistent | explicit inverse/universal API |
| §2.3 supported character | empty/full support; (𝔸¹,0); nodal support | 0≃0 and absolute; raw class(0,t)=−[0], B[t]=+[O₀]; leading cycles(1,1) | consistent | retain suspension dictionary |
| §2.4 product/normalization | ranks2,3; Opoint; p=1,2,3; ξ on ℙ¹ | rank6=2·3; ch Opoint=h; factors1,−1,1/2; ξ²,h² both0 | consistent | F03 direct Chern input |
| §3.1 logarithmic image algebra | punctured disk, empty boundary, two coordinates | d log norm²=dz/z+dbarz/barz; period2πi; residues1,−1; norm⁻² excluded | consistent | retain image, not tensor |
| §3.2 filtered comparison/local estimates | 𝔾m; boundary blowup of torus; flat f at (−2,1) | weight(dlog)=1+1=2; Betti dimensions1,2,1 both choices; combined flat quotient=−e⁻¹ᐟ⁴ log4/2 | consistent | explicit local API |
| §3.3 small Deligne/cone comparison | point twists−1,0,1; norm²; odd shift of point | H⁰=ℝ(−1),ℝ; H¹(weight1)=ℝ; critical differential−2dz∧dbarz; odd one-dimensional Dolbeault shift impossible | consistent after clarification | shift comparison maps only |
| §3.4 independence/descent | identity point; blown-up torus; point⊔ℙ¹ | identity1; periods(2πi,0),(0,2πi) and (2πi)² both choices; H_D⁰=ℝ² | consistent | retain sheafified colimit |
| §4.1 full product | log2 and log norm t; point units; norm² and1 | product=i log2 darg t; swapped negative; point product0; derivative−2dz∧dbarz | consistent | retain four degree cases |
| §4.2 associator | even nonclosed Re z,2,3; point2,3,5 | both bracketings6 Re z, value6 at1; h=0; point bracketings30 | consistent | no closedness added |
| §5.1 support fiber | ∅,X; 0→ℝ[0]; disjoint divisors | fib id=0, fib(C→0)=C; ℝ in degree1; empty-intersection product0 | consistent | F04 separates purity witness |
| §5.2 semipurity/current criterion | crossing/cusp; origin weights1,2; principal t | top groupsℝ²,ℝ; origin H²(weight1)=0,H⁴(weight2)=ℝ; Green−log norm t gives+1 | consistent | transverse coefficients1,2 here |
| §5.3 support resolution | (r,n)=(2p,1),(2p−1,1); nonclosed top form | total degrees2p−1,2p−2; horizontal signs+1,−1; dω evaluated=−2i so top term excludesω | consistent | retain good truncation |
| §5.4 cycle/contraction comparisons | origin/double; point→𝔸¹; total signs | fundamental class coefficients1,2; H¹(weight1)=ℝ on both; n=s=1 gives−1 | consistent | retain integral-cycle source before ℝ |
| §6.1 regulator roof | point m; torsion unit; O(±1) | cycle m↦m; logs of−1,i are0; normalized Chern periods±1, raw±2πi | consistent | retain specified inverses in diagrams |
| §6.2 restriction/fiber map | h=0; nonzero h example; t at origin | image(1,1) has differential(0,0); wrong(1,−1) gives(0,2); raw log class−[0] | consistent | explicit fiber-map API |
| §6.3 pullback/models | point→ℙ¹; unit2 under compatible embeddings; J₁,J₂ | Chern class0 in both targets; unit log2 in both paths; orientations−1,+1 | consistent | retain good-position pullback |
| §7.1 independent character | 2eⁱθ,i; O(a); projections; ℤ and S₃ | logs log2,0; ch=1+a hD; projections at3+4i give3,4i,3; π₀ ℤ versus S₃ | consistent | retain actual classifying model |
| §7.2 Beilinson equality | rank2; point sheaf; unit2,−1; empty/full support | both2,hD,log2,0; weight2 factor−1; supported boundary−1 | consistent | retain universal comparison, not assumption |
| §7.3 integral-source multiplicativity | 2,t and swapped; point2,3; ruling divisors | periods±2πi log2; point degree2 class0; ruling product degree1, doubled2 | consistent | retain proof before rationalization |
| §7.4 normalization witnesses | 1,i,2,3,6,1/2; O(a),tᵃ for a=−1,0,1 | logs0,0,log2,log3,log6,−log2; Chern values−1,0,1; Green coefficient a | consistent | retain as README examples |

API rows follow the bullets within each section; API facts originally embedded in proof paragraphs are included.

| Statement | Instances tried | Computed values on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 API 1: normalization/quotient | constant cube ℤ, n=1 | normalized ker(id)=0; degeneracy quotient ℤ/ℤ=0 | consistent | retain |
| §1.1 API 2: cycle maps and dimension shift | ℙ¹→point; inseparable field degree2 | dimension-drop pushforward0; codimension shift0−1=−1 gives0; finite transfer1↦2 | consistent | retain |
| §1.1 API 3: orientation J | n,m=0,1,2 | J²=1; J₁J₁=1=J₂; δJ₁Γ=+[0]=J₀∂Γ | consistent | retain |
| §1.1 API 4: native generators/projector | point and double point n=0 | native coefficient1 versus2 distinguishes cycles; n=0 projector=id | consistent | retain |
| §1.2 API 1: axes | point n=m=0 | both send1↦1; boundary0↦0 | consistent | retain |
| §1.2 API 2: total universal property | degree2 diagonal | three components (2,0),(1,1),(0,2); componentwise zero gives zero total map | consistent | retain |
| §1.2 API 3: mixed orientation | (1,0),(0,1),(1,1) | multipliers−1,+1,−1; simplex-only degree1 stays+1 | consistent | retain |
| §2.0a API 1: base case/support | n=0,k; empty support | [k²]↦2; empty spectrum has π₀=0; support-forget 0↦0 | consistent | retain |
| §2.0a API 2: maps/pairing/Adams | two line bundles and weight-one loops; identity base map | ψ²([L][M])=[L²M²]=ψ²[L]ψ²[M]; two-loop weights2·2=4; identity unit↦unit | consistent | F01/F02 pairing inputs |
| §2.0a API 3: ordered weightwise relativity | one and two full cube coordinates | difference1−0=1,0−1=−1; ψ²[2]=2[2] both models; ψ²{u,v}=4{u,v}; loop swap−1 | consistent | retain |
| §2.0b API 1: stability/naturality/Whitney | O(1)⊕O(−1), trivial added line | (1+h)(1−h)=1−h²; adding1 leaves total Chern class unchanged | consistent | retain |
| §2.0b API 2: field diagonal | Milnor n=1,2,3 | symbol composite coefficients1,−1,2 in both maps | consistent | retain |
| §2.0b API 3: Newton character | p=1,2,3; zero class | factors1,−1,1/2; factorials1,1,2 nonzero inℚ; c₀(0)=1 whereas ch(0)=0 | consistent | retain |
| §2.1 API 1: components/additivity/pullback | rank2+rank1; point restriction of O(1) | ch₀=3=2+1; positive Chern component restricts0=0 | consistent | retain |
| §2.2 API 1: inverse equals universal | unit2 and ordered {2,t} | both yield[2] of valuation1; symbol class has last-slot residue[2], reverse−[2] | consistent | retain |
| §2.3 API 1: pair maps/naturality | ∅⊂{0}⊂{0,1}; identity | 0↦0; point coordinate r↦(r,0) by both compositions | consistent | retain |
| §2.3 API 2: boundary dictionary | t in K₁; {2,t} in degree2 | B[t]=+1 versus raw−1; uniformizer-last degree2=−B gives+[2] from B=−[2] | consistent | retain |
| §3.1 API 1: restricted Dolbeault calculus | log norm z² | ∂=dz/z, bar∂=dbarz/barz; mixed derivative0=0; conjugation exchanges these | consistent | retain |
| §3.1 API 2: pair pullback | z↦z² and identity | pullback dlog z=2dlog z; two successive squares give4 on both paths | consistent | retain |
| §3.1 API 3: image/injectivity/empty boundary | D=∅; zero restriction of a logarithmic section | algebra E(W); identical functions0 on open give the same0 section; tensor-flat kernel is not retained | consistent | retain |
| §3.2 API 1: monomial flat division | f=e⁻¹/norm z², denominator z²; f=1 negative control | extended jets0; value at1=e⁻¹; 1/z has no finite value at0 | consistent | retain |
| §3.2 API 2: log-power flat estimates | f on coordinate axes; log factor and z barw denominator | all axis jets0; at(−2,1), value−e⁻¹ᐟ⁴ log4/2; exponents0 return f | consistent | retain |
| §3.3 API 1: comparison/naturality/shifts/sums | point p=1; shift comparison; sum of two points | projection after inclusion r↦r; reverse log2+iθ↦log2; shifted identity still1; two copies giveℝ² | consistent | clarify cochain shift |
| §3.3 API 2: exactness/filtered comparison | point direct sum sequence ℝ→ℝ²→ℝ | Deligne degree1 sequence has dimensions1→2→1 and kernel=image dimension1 | consistent | retain |
| §3.3 API 3: critical differential | p=1,x=z barz | ordinary degree0 jumps to2; dD x=−2dz∧dbarz | consistent | retain |
| §3.4 API 1: refinement coherence | point identity; torus refinement loops | all maps1 on point; composed period2πi=direct period2πi | consistent | retain |
| §3.4 API 2: geometric pullback | t↦t² and composition | dlog t↦2dlog t then4dlog t under two maps; composite gives4 | consistent | retain |
| §3.4 API 3: empty/Čech descent | ∅ and two disjoint points | empty complex0; equalizer for disjoint cover isℝ⊕ℝ | consistent | retain |
| §3.4 API 4: sheaf/skeleton universal property | point diagram with constant valueℝ | each comparison sends1 to1; two choices give identical1, zero section gives0 | consistent | retain |
| §4.1 API 1: Leibniz/graded symmetry | x=norm z²,y=1 both weight1 | x•y=−barz dz+z dbarz; derivative−2dz∧dbarz=dD x•y; swapped negative | consistent | retain |
| §4.1 API 2: unit/naturality/high wedge | point1 and log2; pullback t↦t² | 1•log2=log2; pullback log norm t=2log norm t on each path; even scalar2•3=6 | consistent | retain |
| §4.1 API 3: odd critical four terms | log2,log norm t | (log2)/2(dt/t−dbar t/bar t)=i log2 darg t; swapped gives its negative | consistent | retain |
| §5.1 API 1: support enlargement | 0⊂{0,1}⊂{0,1,2} | r↦(r,0)↦(r,0,0); direct r↦(r,0,0) | consistent | retain |
| §5.1 API 2: raw triangle/excision | 0→ℝ[0]; complement unit t | connecting1↦(0,1) in degree1; t↦raw coefficient−1 | consistent | retain |
| §5.1 API 3: support product | V(x),V(x−1); transverse V(x),V(y) | intersection∅ gives0; after semipurity transverse product coefficient1; doubling gives2 | consistent | retain |
| §5.1 API 4: pair coordinates/cocycle iff | f=id and a=b=0; scalar cochain a=1,b=0 in degree0 | zero pair has d=0; d(1,0) second coordinate1≠0 excludes noncocycle; d² second coordinate da−da=0 | consistent | retain |
| §5.2 API 1: Betti local support/type | normal disk dimensions1,2; axes/cusp | relative top groupsℝ in degrees2,4, lower0; axes two lines versus cusp one | consistent | retain |
| §5.2 API 2: multiplicity and detection | two axes and doubled first axis | cycle coordinates(1,1),(2,1); zero iff both coordinates0; nonzero coordinate1 survives generic restriction | consistent | retain |
| §5.2 API 3: principal Green class | f=t,t²,1/t | Green−log norm t,−2log norm t,+log norm t give coefficients1,2,−1 | consistent | retain |
| §5.3 API 1: cycle to supported class | origin cycle and its double | coefficients1↦1 and2↦2; graph boundary coefficient+1 in both | consistent | retain |
| §5.3 API 2: top projection/shift | (r,n)=(2p,1) | class degree2p−1 on both source and H[−2p]; top projection sends1↦1 | consistent | retain |
| §5.3 API 3: forgetting/constant cube | p=0 point; zero support | constant cube1↦1; empty support0↦0; all positive normalized point columns0 | consistent | retain |
| §5.3 API 4: support colimit | two disjoint point supports | r and s extend to(r,s) on union; equal iff differences0 on common union; empty support0 | consistent | retain |
| §6.1 API 1: roof representatives | origin cycle with coefficients1,2; zero lift | projection gives class1,2; adding a boundary changes cohomology by0 | consistent | retain |
| §6.1 API 2: integral source/torsion | integer m; unit i of order4 | m↦m; 4r(i)=r(1)=0 in real vector space so r(i)=0 | consistent | retain |
| §6.1 API 3: degree-zero geometric class | O(1),O(−1) on ℙ¹ | normalized integrals1,−1; raw periods2πi,−2πi | consistent | retain |
| §6.2 API 1: fiber map with homotopy | A=A′=ℤ[0], B=0, B′=(ℤ→ℤ), r=f′=h=1 | map1↦(1,1), d′=(0,0); wrong sign gives(1,−1), d′=(0,2) | consistent | retain |
| §7.1 API 1: character operations | unit2·3; rank2 times rank3; compatible embeddings | log6=log2+log3; rank6=2·3; base change log2=log2 | consistent | retain |
| §7.1 API 2: Chern/exponential class | O(1); log2+2πik; i | Chern integral1; quotient real parts log2,0 independent of branch | consistent | retain |

Conventions and supplier-gap statements have separate witnesses.

| Statement | Instances tried | Computed values on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| Universes and finite components | point⊔ℙ¹, empty scheme, skeleton identity | ranks (1,1), CH¹=0⊕ℤ; empty values0; skeleton identity sends1↦1 | Within a fixed small skeleton; equivalence changes no value | retain |
| Integer motivic reindexing | p=0,a=1; p=1,a=0,1,2,3 | cube degrees−1,2,1,0,−1; negative terms0; degree−1 is never truncated to degree0 | no natural subtraction | retain |
| Derived coefficients | ℤ/2 with ℤ/2; R=0 | H⁻¹=ℤ/2 and H⁰=ℤ/2 versus only H⁰ for ordinary tensor; zero ring gives0 in every degree | Tor retained | retain |
| Cube/simplex orientation and J | graph t, square, simplex1 | ∂Γ=[0], δΓ=−[0]; square coefficients1−1=0; simplex [1]−[0]; J₀,J₁,J₂=1,−1,1 | agrees with BF/BFT transport | retain |
| Mixed versus form totalization | (n,m)=(1,1), (r,n)=(2p,1),(2p−1,1); n=s=1 | mixed cross coefficients−1,+1; form horizontal signs+1,−1; product Koszul−1 | independent signs compatible | retain |
| Shift and pair fiber | 0→ℝ[0]; point comparison shifted1 | nonzero fiber degree1; shifted differential−d; shifted composite remains identity1 | fiber not in degree−1 | retain, clarify Dolbeault shifts |
| Raw and transported boundaries | t in degree1; {2,t} in degree2 | raw(t)=−[0], B(t)=+[O₀]; B{2,t}=−[2], left adapter−B=+[2] | distinguishes raw/right/last-slot | retain |
| Tate marking and parity projection | p=−1,0,1,2,3; z=3+4i | 2πi≠0 so negative power exists; ℝ(1) imaginary; π₀,π₁,π₂ give3,4i,3; adding ℝ(p) changes πₚ₋₁ by0 | kernel exactly complementary Tate line | retain |
| Critical operator/Green sign | norm z² and t | dD norm²=−2dz∧dbarz; dD[−log norm t]=−δ₀; pair Green class+1 | fixes sign and degree | retain |
| Complex orientation and currents | normal disk, ordered two disks, ℙ¹ | periods2πi,(2πi)²; normalized residues+1, exchange−1; normalized c₁ integral1; curve δ₀ factor1 | same marking in each layer | retain |
| Smooth Whitney extension gap | Taylor coefficients1,1,2; coefficients n!; hyperplane parameter | derivatives1,1,4; general (n!)², at m=2,y=π/2 value4; empty jet imposes0 conditions; flat nonzero f(1)=e⁻¹ | extension exists, uniqueness false | gap retained under supplier |
| Flat-ideal real-analytic gap | A=B={0}; A=∅,B=U; coordinate axes | e⁻¹ at1 lies in sum; whole ring=whole ring+0; φ(x)+φ(y) value e⁻¹ at(0,1), excluding intersection | real-analytic domain retained | gap retained under supplier |

## Individual Check computations

| Statement | Instances tried | Computed values on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 Check 1 | On X=𝔸¹, p=1, the graph of t has infinity face 0 and zero face [0], so ∂□[Γ_t]=[0], while δ[Γ_t]=−[0]. | zero/infinity faces [0],0; ∂=[0]−0=[0], δ=−[0] | agrees | retain |
| §1.1 Check 2 | For X=Spec k and p=0 the normalized complex is ℤ in degree 0 and 0 in every positive degree | C₀=ℤ; for n>0, infinity face=id on ℤ so normalized kernel0; raw degenerate termℤ | agrees | retain |
| §1.1 Check 3 | At n=0 the group is the ordinary codimension-p cycle group | n=0 ordinary generator1; double structure length2 has coefficient2 in the sameℤ | agrees | retain |
| §1.1 Check 4 | J₀,J₁,J₂ have values 1,−1,1 | J=(1,−1,1); each double-face coefficient1+(−1)=0 overℤ, including char2 field | agrees | retain |
| §1.1 Check 5 | Set the negative-codimension extension to 0: on a point p=−1 has no generators, and pushforward of the fundamental cycle of ℙ¹ to a point is 0… | p=−1 gives0; ℙ¹ fundamental cycle has image dimension0<1 so pushforward0 | agrees | retain |
| §1.2 Check 1 | In bidegree (1,1), ∂□∂Δ and ∂Δ∂□ have coefficients −1 and +1 in the square of the total differential, hence sum to 0. | cross terms−∂□∂Δ+∂Δ∂□ have coefficients−1,+1, sum0 | agrees | retain |
| §1.2 Check 2 | At (0,0) both axis maps send [V] to [V] | both [V]↦[V]; degree0 diagonal has1 summand, degree2 has3 | agrees | retain |
| §1.2 Check 3 | The orientation multiplier at (1,0),(0,1),(1,1) is −1,+1,−1 | J(1,0)=−1,J(0,1)=1,J(1,1)=−1; alternate n+m sign wrongly gives−1 on simplex axis | agrees | retain |
| §1.3 Check 1 | For p=0 and a point each model has H₀=ℤ and Hₙ=0 for n>0 | each H₀=ℤ,Hₙ>0=0; H₀ comparison sends1↦1 | agrees | retain |
| §1.3 Check 2 | Z=∅ gives fib(id)=0 | Z=∅:fib id=0; Z=X:fib(C→0)=C | agrees | retain |
| §1.3 Check 3 | For a two-term multiplication-by-2 coefficient triangle, derived reduction retains both kernel and cokernel | ℤ/2 derived tensor ℤ/2 gives H⁻¹=ℤ/2,H⁰=ℤ/2; R=0 yields0 in all degrees | agrees | retain |
| §1.4 Check 1 | For 𝔽₂(t)/𝔽₂(t²), flat restriction followed by proper transfer on CH⁰ is multiplication by 2 on ℤ in every model, not identity. | inseparable degree[𝔽₂(t):𝔽₂(t²)]=2, transfer-restriction1↦2≠1 | agrees | retain |
| §1.4 Check 2 | For X=Spec k ⊔ ℙ¹, CH¹(X,0)=0⊕ℤ and CH⁰(X,0)=ℤ² | point CH¹=0, ℙ¹ CH¹=ℤ; CH⁰=ℤ⊕ℤ; two components preserved | agrees | retain |
| §1.4 Check 3 | A square-zero thickening has the same integral cycle generators, and an identity map acts by +1 | square-zero thickening has same integral support generator1; identity coefficient+1; odd swap−1, degree-zero swap+1 | agrees | retain |
| §2.0a Check 1 | At n=0,Y=X,S=X the degree-zero group is K₀(X) | n=0 K₀(k) class[k²]=2; empty support0; leading [O_V] coefficient1 | agrees | retain |
| §2.0a Check 2 | At n=1,Y=X×□,S=Y the face map is the diagonal x↦(x,x) | diagonal1↦(1,1); differences(1,0)↦1,(0,1)↦−1,(1,1)↦0; unit[2] has ψ²=2[2],ψ¹=[2] | agrees | retain |
| §2.0a Check 3 | At n=2,Y=X×□²,S=Y the face-pair diagram has four vertices and total fiber Ω²K(X) | n=2 four face-pair vertices; two successive last-slot residues of {u,v} give1; exchange−1; ψ²=4,ψ¹=1 | agrees | retain |
| §2.0a Check 4 | For X=Spec ℤ_p at every prime p, n=1,Y=X×□,S=Y gives fib(K(Y)→K(X)⊕K(X))≃ΩK(X), hence K₀(Y | K₀(full relative1)=K₁(ℤ_p)=ℤ_p× for p=2,3 as well; difference±1; open cube trivial line ranks(1,1), difference0 | agrees | retain |
| §2.0a Check 5 | On X=S=Y=ℙ² at n=0, put h=1−[O(−1)], so h³=0 | ψ²h=2h−h²,ψ²h²=4h²; eigenvectors1,2h+h²,h² form matrix determinant2; rational h=(2h+h²)/2−h²/2 | agrees | retain |
| §2.0a Check 6 | For X=Spec ℤ[i], the external self-product over ℤ is singular at (1+i,s−i): in ℤ[i,s]/(s²+1), putting v=s−i gives v(v+2i)=0, so this local rin… | π=1+i,π²=2i; relation v²+π²v in m²; local dim1, cotangent dim2; common-base cube regular; two unit ψ² weights multiply2·2=4 | agrees | rename s; regularity domain |
| §2.0b Check 1 | For a unit u in a field, c₁,₁[u]=[u] | c₁,₁[2]=[2], valuation v₂=1; c₀,₀(0)=1 and cₚ>0,₀(0)=0; ch(0)=0 | agrees | retain |
| §2.0b Check 2 | On ℙ², c₂,₀(O(1))=0 whereas ch₂,₀(O(1))=h²/2≠0 | c₂ O(1)=0 but ch₂=h²/2; O(1)⊕O(−1) gives c₂=−h²,ch₂=h² | agrees | retain |
| §2.0b Check 3 | On diagonal Milnor symbols in degrees 1,2,3 the composite symbol-to-K then cₙ,ₙ is multiplication by 1,−1,2 | symbol-to-Chern factors1,−1,2 in n=1,2,3; character factors1,−1,1/2 give total1,1,1 | agrees | retain |
| §2.1 Check 1 | At a point ch₀,₀([k²])=2 and all positive-weight degree-zero components vanish | rank[k²]↦2; CHₚ>0(point,0)=0 | agrees | retain |
| §2.1 Check 2 | On ℙ¹, ch(O(1))=1+h and ch(O(−1))=1−h, so ch(O(1)⊕O(−1))=2, whereas its total Chern class is (1+h)(1−h)=1 because h²=0. | ch O(1)=1+h,ch O(−1)=1−h; sum2; total Chern product1−h²=1 onℙ¹ | agrees | retain |
| §2.1 Check 3 | For X=∅ both source and every summand are 0 | empty source0,target0; disconnected ranks(2,1), distinct from summed3 | agrees | retain |
| §2.1 Check 4 | In positive K-degree, ch₁,₁[2]=[2]≠0 in CH¹(ℚ,1)⊗ℚ: its 2-adic valuation is 1 | ch₁,₁[2]=[2] and v₂=1, excludes positive-degree zero map | agrees | retain |
| §2.2 Check 1 | For weights 0,1,2 the ψ² eigenvalues are 1,2,4, and their pairwise differences are −1,−3,−2 | ψ² eigenvalues1,2,4; differences1−2=−1,1−4=−3,2−4=−2, all nonzero | agrees | retain |
| §2.2 Check 2 | On K₁(k)=k×, ψᵃ[u]=[uᵃ]=a[u], so the diagonal component has weight 1 | ψᵃ[u]=[uᵃ]=a[u]; rank eigenvalue a⁰=1 including a=1 | agrees | retain |
| §2.2 Check 3 | The component of ch(O(1)) on ℙ² in weight 2 is h²/2 | weight2 component of ch O(1) is h²/2, coefficient1/2 not integral | agrees | retain |
| §2.2 Check 4 | Both the inverse cycle map and the universal-class character send [O_point] on ℙ¹ to h in leading weight 1 | both maps send Opoint→h and unit2→[2]; v₂[2]=1 | agrees | retain |
| §2.2 Check 5 | On 𝔾_{m,ℚ}, both the inverse cycle map and the universal-class character send {2}·{t}∈K₂ to the ordered cube product [Γ₂]×[Γ_t]∈CH²(𝔾_m,2)⊗ℚ | both characters send {2,t} to ordered cycle product; last-slot residue[2],v₂=1; reversed−[2],v₂=−1; native B=−[2] | agrees | retain |
| §2.3 Check 1 | Z=∅ gives 0≃0, and Z=X gives the absolute character because the open term is 0. | empty support0≃0; full support absolute because open0 | agrees | retain |
| §2.3 Check 2 | On (𝔸¹,{0}), ∂□Γ_t=[0] | d(Γ_t,0)=([0],t); hence raw [(0,t)]=−[([0],0)] while B[t]=+[O₀] | agrees | retain |
| §2.3 Check 3 | For Z=V(xy)⊂𝔸² the degree-zero leading support cycles have two components, with coefficients (1,1) | axes leading cycle has coefficients(1,1), not one irreducible line; singular support is not regular dévissage input | agrees | retain |
| §2.4 Check 1 | On ℙ¹, [O_point]=1−[O(−1)] and ch=1−(1−h)=h | ch[Opoint]=1−ch O(−1)=1−(1−h)=h | agrees | retain |
| §2.4 Check 2 | For n>0 the factors relating chₚ,ₙ to cₚ,ₙ at p=1,2,3 are 1,−1,1/2 | p=1,2,3 factors(−1)ᵖ⁻¹/(p−1)!=1,−1,1/2; p=2 gives−c₂,₂ | agrees | retain |
| §2.4 Check 3 | The external product of bundles of ranks 2 and 3 has ch₀=6=2·3 | rank external product2·3=6; rank1 factor preserves each component | agrees | retain |
| §2.4 Check 4 | On ℙ¹, put ξ=1−[O(−1)]∈K₀ and h=[point]∈CH¹(ℙ¹,0) | ξ²=0 onℙ¹, chξ=h,h²=0; both product-character sides0 | agrees | retain |
| §3.1 Check 1 | On a punctured disk d log∣z∣²=dz/z+dz̄/z̄ and ∮dz/z=2πi | d log norm z²=dz/z+dbarz/barz; positive circle integral dz/z=2πi | agrees | retain |
| §3.1 Check 2 | If D=∅ the algebra is the smooth forms on W | empty boundary gives E(W); empty W gives0 in every degree | agrees | retain |
| §3.1 Check 3 | Near z=0, log∣z∣² is admitted while ∣z∣⁻² is not a smooth coefficient polynomial in logarithmic generators | log norm z² is a generator; norm z⁻² grows faster than every fixed log polynomial near0, so is excluded | agrees | retain |
| §3.1 Check 4 | The ordered residue of (dz/z)∧(dw/w) at z=w=0 is 1 | ordered residue dlog z∧dlog w=1; swap=−1 | agrees | retain |
| §3.2 Check 1 | For X=𝔾_m⊂ℙ¹, the trivial extension has residues (0,0), so §C5.6 gives H¹=ℂ·dz/z with positive-loop period 2πi | residues0,0 satisfy comparison; period2πi; dlog lies in W₁, cohomology degree1 gives weight1+1=2, type(1,1) | agrees | retain |
| §3.2 Check 2 | Blow up (0,0) in (ℙ¹)² compactifying 𝔾_m² | before/after blowup Betti dimensions1,2,1; periods of dlogs unchanged; boundary components4→5 so residue E₁ diagram differs | agrees | retain |
| §3.2 Check 3 | For a point the only Hodge component is H⁰,⁰=ℂ and the weight is 0 | point H⁰,⁰=ℂ weight0; empty all groups0 | agrees | retain |
| §3.2 Check 4 | On ℂ set f(z)=exp(−1/∣z∣²), f(0)=0 | f/z² has all jets0 at0 and value e⁻¹ at1; f log norm z² also all jets0 | agrees | retain |
| §3.2 Check 5 | With f(z)=1, 1/z has a pole and log∣z∣² diverges at 0 | f=1 gives pole1/z and divergent log at0; all exponents0 give original f | agrees | retain |
| §3.2 Check 6 | On ℂ², f(z,w)=exp(−1/∣zw∣²) off zw=0 and 0 on the axes is flat on their union | at(−2,1), f=e⁻¹ᐟ⁴, log norm z²=log4, z barw=−2; quotient−e⁻¹ᐟ⁴log4/2; axis jets0 | agrees | retain |
| §3.3 Check 1 | For A=ℂ in degree 0, H⁰D(A,0)=ℝ and H¹D(A,1)=ℂ/(2πiℝ)≃ℝ by Re | point p=0:H⁰=ℝ,H¹=0; p=1:H⁰=0,H¹=ℂ/iℝ≃ℝ | agrees | retain |
| §3.3 Check 2 | For the same point and p=−1, F⁻¹A=A, so H⁰ is ℝ(−1) and H¹=0 | point p=−1:F⁻¹=ℂ; H⁰=ℝ(−1),H¹=0 | agrees | retain |
| §3.3 Check 3 | For p=1 and x=∣z∣², ∂∂̄x=dz∧dz̄, hence d_Dx=−2dz∧dz̄ | ∂bar∂(z barz)=dz∧dbarz; critical dD=−2dz∧dbarz | agrees | retain |
| §3.3 Check 4 | The point complex A has its unique type (0,0) | A[1] has one complex dimension in odd degree−1; conjugation pairs off-diagonal types in equal dimensions, impossible in dimension1; shifted comparison itself still exists | agrees | additional shift negative control |
| §3.3 Check 5 | For A=0 every cone term, D term and contraction is 0 | A=0 gives0 throughout; projection∘inclusion r=r; inclusion∘projection sends log2+iθ to log2, difference−iθ | agrees | retain |
| §3.4 Check 1 | An identity refinement acts as 1 on H⁰ of a point and as 0 on the zero complex | identity map point H⁰ sends1→1; zero complex has sole morphism0 | agrees | retain |
| §3.4 Check 2 | For 𝔾_m² and the boundary blowup of (ℙ¹)², the loop periods of dlog x,dlog y are (2πi,0),(0,2πi) in both choices, and the product period is (2… | both choices give loop-period vectors(2πi,0),(0,2πi); product period(2πi)² | agrees | retain |
| §3.4 Check 3 | For a point disjoint from ℙ¹, H_D⁰(−,ℝ(0))=ℝ² | point⊔ℙ¹ weight-zero H⁰=ℝ²; restriction to empty target0 | agrees | retain |
| §4.1 Check 1 | For p=q=1 on 𝔾_m, x=log 2 and y=log∣t∣ give x•y=(log 2)/2·(dt/t−dt̄/t̄)=i log 2 darg t | product=(log2)/2(dt/t−dbar t/bar t)=i log2 darg t; swapped negative | agrees | retain |
| §4.1 Check 2 | On a point log 2•log 3=0 because every one-form is 0 | point one-forms0 so log2•log3=0; weight-zero1•log2=log2 | agrees | retain |
| §4.1 Check 3 | On ℂ, x=∣z∣² and y=1 in weight one have x•y=−z̄ dz+z dz̄ and d_D(x•y)=−2dz∧dz̄, equal to d_Dx•1 | norm z²•1=−barz dz+z dbarz; dD=−2dz∧dbarz=dD(norm z²)•1 | agrees | retain |
| §4.2 Check 1 | For even critical-degree forms both bracketings equal x∧y∧z and h_a=0 | even critical h=0; with Re z,2,3 both bracketings6Re z and value6 at1; dRe z=dx≠0 yet dh+hd=0 | agrees | retain |
| §4.2 Check 2 | For three weight-zero point constants 2,3,5 the bracketings are both 30 | point constants(2·3)·5=30=2·(3·5); odd point triple both0 | agrees | retain |
| §4.2 Check 3 | The dlog x∧dlog y period on the positive product torus is (2πi)² before and after a boundary blowup | product circle period(2πi)² before/after; exchanged circles−(2πi)² in each | agrees | retain |
| §5.1 Check 1 | For Z=∅ the fiber of identity is contractible | empty support:fib id contractible; full support:fib(D→0)=D | agrees | retain |
| §5.1 Check 2 | For the map 0→ℝ[0], the fiber is ℝ in cochain degree 1, not degree −1 | fib(0→ℝ[0]) has ℝ in degree1; second d² component res(dω)−dresω+d²g=0 | agrees | retain |
| §5.1 Check 3 | For {0}⊂{0,1}⊂𝔸¹, degree-two supported coordinates send r↦(r,0), and the direct composite agrees | support {0}→{0,1} sends r→(r,0); composing further inclusions gives same coordinates | agrees | retain |
| §5.1 Check 4 | Classes supported on the disjoint divisors V(x) and V(x−1) of 𝔸²_ℂ multiply into support ∅, whose fiber is that of the identity, so their prod… | V(x)∩V(x−1)=∅ since1∈(x,x−1); product lands in zero fiber and equals0 | agrees | F04 disjoint product |
| §5.2 Check 1 | For X=𝔸², p=1, Z=V(xy), H_D,Z²=ℝ² with [V(x)]+[V(y)]↦(1,1) | axes two irreducible components:H²=ℝ²,class(1,1); cusp one:H²=ℝ,class1; all a<2 groups0 | agrees | retain |
| §5.2 Check 2 | For the origin in 𝔸², p=1 gives H_D,{0}²=0, whereas p=2 gives H_D,{0}⁴=ℝ | origin codim2:H²(weight1)=0,H⁴(weight2)=ℝ; divisor coefficient1 or2 on same line | agrees | retain |
| §5.2 Check 3 | At p=0 and Z=X, H_D,X⁰=ℝ per component and all negative degrees vanish | p=0 full support H⁰=ℝ per component, negative0; empty0; point p=1 full support H¹=ℝ violates vanishing without codim bound | agrees | retain |
| §5.2 Check 4 | Under §5.1’s product, the supported classes of V(x) and V(y) in 𝔸²_ℂ multiply to the origin class with coefficient +1 in H_D,{0}⁴(𝔸²,ℝ(2))=ℝ | k[x,y]/(x,y) has dimension1; k[x,y]/(x²,y) has dimension2; supported product coefficients1,2 | agrees | F04 transverse product moved here |
| §5.2 Check 5 | For f=t on 𝔸¹, the normalized identity is d_D[−log∣t∣]=−δ₀, and (0,−log∣t∣) has class +[0] | dD[−log norm t]=−δ₀; Green pair has coefficient+1; replacing by+log gives−1 | agrees | retain |
| §5.3 Check 1 | At (r,n)=(2p,1) total degree is 2p−1 | total(2p,1)=2p−1,horizontal sign+1; r=2p−1 gives sign−1 | agrees | retain |
| §5.3 Check 2 | For a point and p=0, the normalized cycle-support complex is ℝ in degree 0 and 0 in positive cube degree. | point p=0 normalized H complex degree0ℝ, positive cube degrees0 | agrees | retain |
| §5.3 Check 3 | On ℂ² with p=1, ω=Re(z₁) dz₂∧dz̄₂ belongs to D²(A,1), but d_Dω=(dz₁+dz̄₁)∧dz₂∧dz̄₂/2 is nonzero: its value on (∂ₓ₁,∂ₓ₂,∂ᵧ₂) is −2i | dω=(dz₁+dbarz₁)∧dz₂∧dbarz₂/2; on(∂x₁,∂x₂,∂y₂) equals−2i≠0; good top truncation excludesω | agrees | retain |
| §5.4 Check 1 | At X=𝔸¹, p=1, n=0, the origin cycle maps to the supported class with coefficient 1 | origin1 maps to coefficient1 and double2 maps to2, excludes zero class map | agrees | retain |
| §5.4 Check 2 | At p=1 the map point→𝔸¹ identifies H_D¹=ℝ on both sides | point and𝔸¹:H¹(weight1)=ℝ,H⁰(weight0)=ℝ; positive normalized columns have cohomology0 | agrees | retain |
| §5.4 Check 3 | For n=s=1 the totalized product factor is −1 | total factor(−1)ⁿˢ: n=s=1 gives−1; n=0 or s=2 gives+1 | agrees | retain |
| §6.1 Check 1 | At Spec ℂ, p=n=0, the cycle m maps to m∈ℝ | point weight0 cycle m→m; n>0 source CH⁰(point,n)=0 | agrees | retain |
| §6.1 Check 2 | The empty scheme and zero cycle map to 0 | empty and zero cycle map0; torsion units−1,i map log norm=0 | agrees | retain |
| §6.1 Check 3 | On ℙ¹, r_D(c₁O(1)) integrates to 1 in Tate-normalized degree 2, equivalently raw complex period 2πi | O(1),O(−1) normalized integrals1,−1; raw periods2πi,−2πi | agrees | retain |
| §6.2 Check 1 | Z=∅ gives the zero regulator on the contractible fiber | empty support zero map0; full support absolute; identity homotopy0 | agrees | retain |
| §6.2 Check 2 | For h=0 the pair map is (ra,r′b) | positive h correction gives image(1,1) and differential(0,0); negative gives(1,−1) and differential(0,2) | agrees | retain |
| §6.2 Check 3 | On (𝔸¹,{0}), the open unit t maps to log∣t∣ | raw class(0,log norm t)=−cl0; principal Green pair(0,−log norm t)=+cl0 | agrees | retain |
| §6.3 Check 1 | Pullback of O(1) along a point→ℙ¹ has c₁=0 in CH¹(point,0), and the Deligne class also pulls back to H_D²(point,ℝ(1))=0 | point pullback of c₁O(1)=0 in CH¹(point,0); H_D²(point,ℝ(1))=0 too | agrees | retain |
| §6.3 Check 2 | For k=ℚ and unit 2, base change through either ℚ→ℝ→ℂ or ℚ→ℂ gives log 2 | unit2 has log2 under ℚ→ℝ→ℂ andℚ→ℂ | agrees | retain |
| §6.3 Check 3 | Both axes send the degree-zero point generator to 1 | axes degree0 send1→1; BF transport J₁=−1,J₂=1 on both cycles and totals | agrees | retain |
| §7.1 Check 1 | For u=2eⁱθ, Re(log u)=log 2, independent of θ and of adding 2πi to the logarithm | Re log(2eⁱθ)=log2; add2πik changes real part0; i gives0 | agrees | retain |
| §7.1 Check 2 | For O(a) on ℙ¹ the degree-zero character is 1+a h_D, and the normalized integral of h_D is 1. | ch O(a)=1+a hD, integral hD=1; at a=−1,0,1 coefficients−1,0,1 | agrees | retain |
| §7.1 Check 3 | The zero K-class and the K-groups of ∅ map to 0 | zero K-class and empty groups map0; trivial line maps1 | agrees | retain |
| §7.1 Check 4 | For a number-field embedding and p=j≥1, the point quotient ℂ/ℝ(p) identifies with ℝ(p−1) by πₚ₋₁(z)=(z+(−1)ᵖ⁻¹z̄)/2, the same projection used … | πₚ₋₁(3+4i) for p=1,2,3 is3,4i,3; kernelℝ(p), so added twist changes projection0 | agrees | retain |
| §7.1 Check 5 | For the constant simplicial abelian group ℤ, π₀=H₀=ℤ and all positive homotopy and homology groups are 0 | constantℤ:π₀=H₀=ℤ,higher0; constantS₃ hasπ₀=S₃ nonabelian, outside Dold–Kan | agrees | retain |
| §7.2 Check 1 | At a point in degree 0 both composites send rank 2 to 2 | both maps rank2→2; point-sheaf class→hD with integral1 | agrees | retain |
| §7.2 Check 2 | For K₁(ℂ), the unit 2 has value log 2 on both sides, while −1 has value 0 | unit2→log2,−1→0 by each; positive-degree weight2 coefficient−1 | agrees | retain |
| §7.2 Check 3 | For full support the equality is the absolute one and for empty support both maps are 0 | full support absolute comparison; empty both0; origin raw logarithm boundary−1 | agrees | retain |
| §7.3 Check 1 | On 𝔾_m, the classes of 2 and t in CH¹(−,1) give i log 2 darg t under the product regulator | 2,t product=i log2 darg t with period2πi log2; reverse−2πi log2 | agrees | retain |
| §7.3 Check 2 | The weight-zero cycle 1 preserves each regulator | weight-zero1 acts identically; zero/empty product0; at point H_D²(point,ℝ(2))=0 so regulator of2·3=0 | agrees | retain |
| §7.3 Check 3 | On ℙ¹×ℙ¹, the two ruling divisor classes multiply to the point class, of normalized Deligne degree 1 | ℙ¹×ℙ¹ ruling intersection degree1; doubled ruling gives2 | agrees | retain |
| §7.4 Check 1 | For u=2,v=3 the values are log 2,log 3,log 6=log 2+log 3 | log norm values on2,3,6,1,i,1/2 are log2,log3,log6,0,0,−log2; log6=log2+log3 | agrees | retain |
| §7.4 Check 2 | On 𝔾_m take f=2,g=t | f=2,g=t yields i log2 darg t; period2πi log2 lies in imaginary Tate line | agrees | retain |
| §7.4 Check 3 | For a=−1,0,1 on ℙ¹, normalized Chern integrals are −1,0,1 | a=−1,0,1 give normalized integrals−1,0,1; Green−a log norm t has divisor coefficient a; unit on puncture+a log norm t | agrees | retain |

The supplier Checks and layer Examples were also evaluated individually.

| Statement | Instances tried | Computed values on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| Whitney Check 1 | A={0}, coefficients 1,1,2 and n! | derivatives 0!·1=1,1!·1=1,2!·2=4; general n!·n!=(n!)²; ratio of power coefficients n+1 tends to infinity, radius 0 | Smooth extension need not be analytic | retain |
| Whitney Check 2 | hyperplane x=0, m=2,y=π/2 | prescribed normal derivative (2!)² sin(π/2)=4 | Requires transverse smooth parameters | retain |
| Whitney Check 3 | A=∅,A=U,A={0} | empty imposes 0 equations; A=U extension is f; 0 and e⁻¹ᐟˣ² both have zero jets at0 but values 0,e⁻¹ at1 | No uniqueness assertion | retain |
| Flat-ideal Check 1 | A=B={0}, f=e⁻¹ᐟˣ² | jets at0 all0; value at1=e⁻¹; f=f+0 in the sum ideal | Smooth, rather than analytic, ideal | retain |
| Flat-ideal Check 2 | A=∅,B=U and A=B=U | C∞=C∞+0 and 0=0+0 | Both empty/full directions valid | retain |
| Flat-ideal Check 3 | coordinate axes, φ(x)+φ(y) | flat at origin; decomposition into the two ideals; at(0,1) value e⁻¹≠0 excludes their intersection | Sum is the intended ideal | retain |
| Layer 1 Examples | graph on 𝔸¹, point over𝔽₂, inseparable extension, thickening | boundary+[0]; point H₀=ℤ; degree-two transfer2; thickening same generator1 | Agrees with §§1.1–1.4 | retain |
| Layer 2 Examples | ℙ¹,O(a),1−O(−1); unit2; nodal support | ch=1+a h; ch(1−O(−1))=h; unit valuation1; leading support coordinates(1,1) | Agrees with §§2.0a–2.4 | retain |
| Layer 3 Examples | punctured disk, point weights0,1, torus refinement | period2πi; H⁰(weight0)=ℝ,H¹(weight1)=ℝ; refined torus periods unchanged | Agrees with §§3.1–3.4 | retain |
| Layer 4 Examples | point odd classes; log2 and log norm t | point product0; curve product i log2 darg t, period2πi log2 | Agrees with §§4.1–4.2 | retain |
| Layer 5 Examples | axes, cusp, double divisor, empty/full support | supported top groupsℝ²,ℝ; coefficients1,2; fibers0,D | Agrees with §§5.1–5.4 | retain |
| Layer 6 Examples | unit2, singular-divisor complement, mixed axes | log2; origin raw boundary−1; cube J₁=−1 versus simplex J=1, both transported maps send degree-zero1→1 | Agrees with §§6.1–6.3 | retain |
| Layer 7 Examples | unit2,O(1), two odd curve classes, crossing/cusp | log2, normalized Chern integral1, swapped periods±2πi log2, support ranks2/1 | Agrees with §§7.1–7.4 | retain |

The shift clarification and the review repairs resolve every counterexample found. No change to a theorem’s accepted geometric generality was necessary. Denominators are nonzero: (p−1)!≥1 for p≥1, 2ⁱ−2ʲ≠0 for i≠j, 2πi≠0, and the coordinate denominators are used only off the coordinate hypersurfaces before flat extension. No expression 2p−a is evaluated as natural subtraction. The character and regulator are tied to the specified geometric maps and classifying objects, rather than arbitrary free maps. There is no conclusion included as a hypothesis and no assumed comparison substituted for its proof. Generality in the README is not narrowed by a Lean stand-in: there are no Lean target signatures.

## Elaboration and binder audit

The required lake env lean invocation was run from the pinned content checkout on packages/MotivicEtaleKTheory/Suggested.lean. It exited 0. Output was empty: **0 sorry warnings, 0 other warnings, 0 errors, no other messages**. No TauCeti module is imported, so no targeted module build was necessary. There is no set_option and no data definition with a missing body.

The mechanical declaration enumeration found 0 theorems, 0 definitions, 0 abbreviations, 0 instances and 0 opaque declarations. Thus the required list of #check @name commands is empty. Its import-only scratch binder audit was elaborated once, after the acceptance-file run; it exited 0 with empty output. There are no elaborated statement binders to compare, no hypotheses that silently disappear and no binder corrections to report. The missing geometric carriers, and each omitted headline, are recorded in the module docstring and the table above.

## Dependency and final package checks

The required dependency command was run on the finished packages/MotivicEtaleKTheory/README.md with name MotivicEtaleKTheory, the supplied merge order and --movable. It exited 0 with exactly:

```text
depcheck: 29 roadmaps, 259 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. MotivicEtaleKTheory is in the supplied order after MotivesAndAlgebraicCycles and before its ColemanIntegration and Polylogarithms consumers. The internal Needs graph follows the target order; the direct §2.0b→§2.4 edge and the Layer 4→§5.1 edge have no return path. Supplier gaps are only smooth-whitney-extension and flat-ideal-regular-situation, both for DifferentialGeometry’s Part II section on Whitney jets and flat functions. Neither is claimed to have been fulfilled by this package.

The final citation resolver checks main 72d2b66 and all 331 indexed open heads. It lists None under both “Cross-roadmap citations found nowhere” and “Lean names found nowhere”. Its limitation is stated verbatim: “Lean names outside TauCetiRoadmap were not checked: no pinned Lake packages on this host.” All 19 distinct native backticked identifiers were therefore checked directly in the actual pinned sources, independently of that resolver.

The final coverage audit finds 27 target sections, 49 accepted API facts, 101 target Check bullets and 6 supplier-gap Check bullets, seven layer Examples sections and seven Dependencies sections. Apart from notation-only typography repairs, all accepted target statements occur verbatim except §2.0a’s definition of “full cubes”; the only non-verbatim accepted Checks are the Gaussian coordinate renaming and the split support-product Check. The four originally embedded API entries and §3.3’s shift clarification are recorded above. git diff --check exits 0; a separate scan includes the new files and finds no trailing whitespace. TOML and JSON parse, all ten source keys are unique, and both gap needs occur exactly in their supplier subsection. No README backticked identifier presents an undeclared declaration of this roadmap. Mathematical uses of “current” refer to currents, not temporal status.

The formatting repair replaces seven TeX-style braced indices in five README paragraphs with Unicode notation or prose: the dimension index, the two supported pairing indices, the rational base of the multiplicative group, the component-indexed direct sum, the regular-locus integral and the supported auxiliary-complex index. The integer dimension j=d−p, support conditions, pairing degrees, component indices and normalization factors are unchanged. The README scan finds 0 braced indices, 0 TeX commands or delimiters and 0 dollar delimiters. The repeated dependency check exits 0 with the same output: depcheck: 29 roadmaps, 259 edges, 0 problem(s). Suggested.lean is unchanged, so its elaboration and binder-audit results above still apply.

No newly fetched source, copied extraction, machine path, source-code download, remote write, merge-order edit, pin edit or content-checkout source edit is part of the deliverable. Only the requested package files, source manifest and this report are changed; design/plan.json remains byte-for-byte unchanged. The scratch worklist and generated skeleton are outside the deliverable. No Lean or other long-running process remains.
