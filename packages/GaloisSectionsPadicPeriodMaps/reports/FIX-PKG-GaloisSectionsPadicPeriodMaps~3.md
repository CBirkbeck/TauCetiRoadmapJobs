# Repair report: GaloisSectionsPadicPeriodMaps

## F01 (P2) — applied

Unqualified split-algebra ratio equivalences → equivalences for nonzero split algebras, and function algebras on nonempty sets, throughout §§6.9 and 8.1. Added the zero-algebra negative control in both sections. Also restricted the disjoint-union weighted-average formula to defined proportions, explaining empty summands by cardinalities. The cardinality definition remains unchanged on arbitrary algebras.

## F02 (P3) — applied

Definition-only passages → prose APIs and three computed Checks each in §§5.1, 7.4, 7.7 and 8.2. Expanded §6.9's three locus entries into membership equivalences. Added existing power-class/Kummer supplier contracts and the base-extension source locator. The four-line test states the necessary common-subobject obstruction without asserting that an arbitrary geometric tuple descends. No acceptance-file padding was added.

## F03 (P3) — applied

The map with fibres 4,0,0,0,0 → the equivariant surjection with fibres 4,1,1,1,1 in §8.1. The source has four fixed points and a regular C₄-orbit; the target has one fixed point and that orbit. Their proportions are 1/2 and 1/5. The unramified quotient makes this a continuous local Galois example.

## F04 (P3) — applied

Proper compactness attributed to §2.11a → proper local-point compactness/product topology from HeightsRationalPointsAndObstructions §§2.3a and 2.11, with local étale charts from §2.11a. Updated the exact contract, §6.3 Needs and Layer 6 dependencies. Added the two-disc cover of P¹(F) and the unbounded sequence in A¹(F) as a computed Check.

## Source verification and repair boundaries

All four findings are supported. The changes are confined to `packages/GaloisSectionsPadicPeriodMaps/README.md`, the existing bs locator in `packages/GaloisSectionsPadicPeriodMaps/sources.toml`, and this report. `packages/GaloisSectionsPadicPeriodMaps/Suggested.lean`, metadata and the design plan are unchanged. No gate failures were supplied separately from the four findings.

| Passage | Evidence opened and mathematical conclusion |
| --- | --- |
| F01, cardinality definition | bs line 2418, Definition 6.8(c), p. 47, especially bs line 2425: the definition compares the small-point count with dim A/(d+1), without a nonzero hypothesis. For A=0 both quantities are zero. |
| F01, ratio domain | bs line 2685, proof of Proposition 6.20, p. 52: the ratio is introduced on nonempty finite G_v-sets. For split A, #Σ_A=dim A; dividing requires this common number to be positive. |
| F02, Hodge pair | bs line 1791, §4.1.2, p. 35, and bs line 1805, §4.1.3: algebra, module, pairing and filtration agree under comparison; bs line 1815 specifies the H⁰_pH-linear pairing and bs line 1821 the fibre pair. |
| F02, comparison and base extension | bs line 1367, Proposition 3.19(1)–(3), p. 27, including the finite-extension square at bs line 1372; bs line 1398, Proposition 3.20, pp. 27–28. Proposition 3.19 was added to the existing bs manifest locator, using the same certified extraction. |
| F02, type-(a) locus | bs line 2451, Proposition 6.9, p. 48, supplies its definition and non-density. The index transport and factor reduction are at bs line 2518, pp. 49–50. No full-monodromy hypothesis enters Proposition 6.9; it enters the finiteness corollary. |
| F02, type-(b) locus | bs line 2544, definition preceding Proposition 6.15, pp. 49–50; bs line 2555, the common filtered subobject condition; bs line 2601, its simultaneous interpretation at all embeddings; bs line 2650, the factor reduction. Separate witnesses at different embeddings do not suffice. |
| F02, local counts | bs line 2729, Remark 6.21, p. 53, distinguishes embedded fields from isomorphism classes and gives the tame counts. LocalFieldsRamification Layer 1 supplies the dyadic square-class count, and Layers 2 and 4 supply unramified extensions and the tame relation. ClassFieldTheory Layer 5 supplies the mixed-characteristic Kummer equivalence. The dyadic cubic count is the same tame degree-three computation, not an extension of the tame quadratic count. |
| F02, locus membership | bs line 2418, Definition 6.8, p. 47, and bs lines 2431–2436: type (a) quantifies a global S-good interpolant; type (b) uses the actual local fibre pair; type (c) uses its coefficient algebra. |
| F03, monotonicity | bs lines 2694–2698, proof of Proposition 6.20, p. 52. The small-source set maps into the small-target set. Equal positive fibres give the cardinality bound after division. The replacement example preserves surjectivity and positivity and violates only equal fibre size. |
| F04, finite-disc route | bs line 2215, Corollary 5.10, and bs line 2222, Remark 5.11, p. 43: discwise finiteness is followed by a finite covering obtained from compactness. HeightsRationalPointsAndObstructions §§2.3a and 2.11 state the proper compact product; §2.11a states étale local inverses. |

The other cached legal texts were also opened: hs line 391 and hs line 416, Theorem 2.1 and Remark (1), pp. 11–12; stoll line 127, §2, p. 4; stix08 line 1089 and stix08 line 1109, Proposition 44 and Theorem 45, p. 22. They require no change for these findings. No source was fetched from an unapproved location, no new work or duplicate key was added to the manifest, and no reference request is outstanding.

The ratio-pattern search covered the conventions, §§6.8–6.9, all of §8.1, and its uses in §§8.4–8.6 and the Layer 8 examples. The trichotomy's cardinality form, including its empty-set case, is preserved. Every family application has nonempty finite base fibre because Y′→Y is a covering. The compactness route was followed through §§7.5 and 7.8; both consume §6.3 and retain projectivity. The definition/API pattern was repaired at all four definitions identified by F02, including their Layer 6 and Layer 8 supplier dependencies.

## Ownership, citations and pinned APIs

For house shape, the main-branch roadmaps `TauCetiRoadmap/AdicEtaleGeometry/README.md`, `TauCetiRoadmap/LocalGaloisGroups/README.md` and `Completed/UniversalCovers/README.md` were read. Existing numbered layers and ownership boundaries were retained.

Cross-roadmap citations were resolved using the roadmap tools and inspected against the available main copies or new-roadmap heads. Existing roadmaps were checked on the supplied content main checkout; revision pull requests were not substituted for them. That checkout has commit c57bdc02fc2a4b1643df71b4a3a14b20fdad247f. The resolver separately identifies its indexed main as 35c9f96 and its open-head index as 2026-10-25T12:29:41Z; its result is a locator inventory, not evidence that those revisions coincide.

| Supplier | Sections inspected for the consumed objects |
| --- | --- |
| AnabelianGeometryAndNonabelianChabauty | §7.1 (NC.6): section classes, point sections, Kummer interpretation and general injectivity criterion. |
| InverseGaloisAndArithmeticFundamentalGroups | §§IG.0.3, IG.1.3: integral/lisse systems and characteristic-zero geometric base change. |
| ArithmeticGaloisRepresentations | §§1.3, 1.12, 2.1: induction, Mackey/restriction and decomposition embeddings. |
| HeightsRationalPointsAndObstructions | §§2.3–2.4, especially §2.3a, §§2.11–2.11a, 3.1–3.5, 3.17d: adelic products, compactness, local charts, torsor descent and modified adeles. |
| PadicHodgeTheory | §§3.3–3.5, 5.1, 5.3, 7.2–7.3, 8.1–8.2: finite-level periods, algebraic-unramified realisation, integral pro-étale coefficients and comparisons. The declared horizontal-period extension remains a gap. |
| CohomologyComparisons | §§6.4–6.7: scalar extension, products, trace-normalised Tate line, duality and Chern classes. |
| MordellLawrenceVenkatesh | §§0.4–0.5, 0.9–0.12, 0.18; §§1.2, 1.4–1.16; §§2.1–2.4, 2.11; §§3.1–3.19, 4.1–4.3; LV.7, LV.8, LV.10, LV.11. Its good-model comparisons retain their original range; the five larger contracts remain explicit gaps. |
| AbelianSchemesAndArithmeticModuli | §§A3.5, A3.7, A4.3–A4.4, A6.30–A6.31: pairings, rank/Hodge sequence, cohomological products and separable Weil restriction. |
| AlgebraicModuliForArithmeticGeometry | §1.3: locally free quotients and flags. |
| AdicEtaleGeometry; AdicSpacesPartII | §§A1.1, A1.3, finite-etale-local-to-global (c); Layer R1: sheafiness, finite étale equivalence and rigid/adic analytification. |
| ComplexComparisonPartII | §§C5.2, C6.0, C6.2: Gauss–Manin, finite CW type and Riemann existence. |
| EtaleDualityAndPerverseSheaves | §0.3, the named smooth-curve Poincaré-duality paragraph, and §0.5: Jacobian/Kummer duality and the alternating cup pairing. |
| ArithmeticGaloisDuality | §R02.3, the Hermite finiteness paragraph: fixed degree and ramification bounds. |
| WeightsInEtaleCohomology | R34.1–R34.2: geometric Frobenius, factor integrality with rationality distinguished, and abelian H¹ weights. |
| ClassFieldTheory | Layer 5, especially the power-class Kummer equivalences; Layers 7 and 11, reciprocity and characters. The new Check uses n=2 or 3 in characteristic zero, including n=p. |
| GlobalNumberFields | Layers 2, 7 and 8: ray-class finiteness, congruence quotients and norm components. |
| LocalFieldsRamification | Layers 0–2 and 4: finite extensions, power classes, unramified quotient and the tame relation. In main, Layer 1 explicitly states eight dyadic square classes. |
| LocalGaloisGroups | Layer 7: topological finite generation and rank [F:ℚₚ]+2 of the full group, distinct from its maximal pro-p quotient. |
| ReductiveGroups | Layers 0 and 3: affine groups, scalars and quotients. |
| Chebotarev | Layers 10, 13–14: density and prime counting. |
| AnalyticNumberTheoryPartI | §0.32: Siegel–Walfisz in its specified range. The stronger least-prime contract remains a declared gap. |

Object searches used `roadmaps grep` across main and the indexed open heads, as well as the board packages. They covered symplectic Hodge pairs, filtered discrete modules, type-(a)/(b) period loci, small-orbit proportions and embedded quadratic/cubic fields. The supplied open-roadmap inventory was included. AdmissiblePairsAndPadicHodgeStructures, PadicHodgeRegulators and PeriodsAndSpecialValues were additionally read for their nearby ownership boundaries: bilattice admissible pairs, regulators and motivic period invariants are different objects. No construction was reassigned. This package continues to own the assembly of the supplied cohomology into its symplectic pairs and its family-dependent interpolation loci. Generic cohomology, Kummer theory, local-field structure and compactness remain with the named suppliers. Searches found no second owner for the repaired package-specific definitions.

The seven existing supplier gaps and their slugs agree between the README and the plan: horizontal-pst-specialisation, model-free-polarised-fibres, model-free-period-maps, symplectic-faltings-finiteness, four-isotropic-lagrangians, kodaira-parshin-local-fibres and linnik-polynomial-least-prime. These findings add no unowned prerequisite: power classes and Kummer equivalences already have the sections named above. No plan field was edited.

The installed library revisions match `lake-manifest.json`: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Native definitions and hypotheses were read at these pins:

| Pinned declaration | File and line; boundary |
| --- | --- |
| Field.absoluteGaloisGroup; Field.absoluteGaloisGroup.map | `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42` and line 87; closure automorphisms and restriction, without decomposition embeddings. |
| ContinuousMonoidHom | `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean:57`; multiplicative map bundled with continuity. |
| ConnectedComponents | `Mathlib/Topology/Connected/Clopen.lean:510`; quotient by connected-component relation, without finiteness. |
| IsDedekindDomain.HeightOneSpectrum.adicCompletion | `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean:603`; completion carrier. |
| LinearMap.IsAlt; LinearMap.Nondegenerate | `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:286` and line 595; diagonal vanishing and left/right separation, without a rank-one target assumption. |
| Matrix.symplecticGroup | `Mathlib/LinearAlgebra/SymplecticGroup.lean:101`; exact form preservation. |
| NumberField.IsCMField; NumberField.IsCMField.ringOfIntegersComplexConj | `Mathlib/NumberTheory/NumberField/CMField.lean:69` and line 236; CM condition and conjugation on integers. |
| IntermediateField | `Mathlib/FieldTheory/IntermediateField/Basic.lean:52`; subalgebra closed under inverses. |
| MulAction.orbit | `Mathlib/GroupTheory/GroupAction/Defs.lean:49`; all translates of a point, without finiteness or nonemptiness of the acted-on type. |
| Nat.forall_exists_prime_gt_and_eq_mod | `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:442`; unit residue class and arbitrary lower bound. |
| hasSum_zeta_four | `Mathlib/NumberTheory/ZetaValues.lean:457`; the natural-indexed real sum has n=0 term 0. |
| TauCeti.Symplectic.groupScheme | `TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean:122`; exact symplectic group, without an extra similitude multiplier. |

Object searches at these pins found BDeRhamPlus and BDeRham (`Mathlib/RingTheory/Perfectoid/BDeRham.lean:75` and line 88), but not the de Rham representation category, arithmetic section/localisation carriers, filtered discrete retwists, family cohomology with its comparisons, or the associated period domains needed for the headline statements. A period ring alone does not supply these structures. The fourteen headline groups remain correctly listed as not statable in the acceptance-file docstring. No weakened substitute or elementary orbit-count theorem was added there.

## Adversarial mathematics pass

The tables record actual boundary calculations; they are tests of the stated mathematics, not substitutes for the source evidence or an independent review. An entry asserting an implication tests both its relevant positive instance and its stated boundary when applicable. All added API assertions and Checks occur in the first table; the second follows the remaining build and its consumers. “Retained” means no edit of that statement, not an assertion that elaboration proves its truth.

| Statement | Instances tried | Computed values on the relevant sides | Result | Change |
| --- | --- | --- | --- | --- |
| §6.9 cardinality definition on A=0 | d=1, A=ℚₚ^∅ | #Σ=0, dim A=0, small count 0; 0≥0 is true, whereas 0≥1/2 is false | Cardinality remains meaningful; ratio does not | Added explicit negative control |
| §§6.9,8.1 split-algebra ratio equivalence | A=ℚₚ; function algebra on a transitive five-point set; nonsplit quadratic field | 1≥1/2 and 1/1≥1/2 are true; 0≥5/2 and 0/5≥1/2 are false; nonsplit field has #Σ=0 but dim A=2 | Both nonzero and split are needed | Repaired all four equivalence occurrences |
| §8.1 weighted average | Orbits of sizes 3 and 4; empty first summand | (3+0)/(3+4)=3/7=(3·1+4·0)/7; with empty first summand, 0/4=0 | Formula agrees when proportions exist; counts handle an empty summand | Restricted formula's domain |
| §5.1 potentially semistable realisation | Elliptic fibre; two elliptic components | (dim H⁰_pst,dim H¹_pst)=(1,2), then (2,4) | Realisation ranks agree with D_pst of the étale pair | Added API and Checks |
| §5.1 de Rham realisation | Two F-components; one elliptic curve over quadratic L/F | Both ranks (2,4); H⁰_dR=F×F has two primitive idempotents, L has one | Equal dimensions do not identify the coefficient algebras | Added API and separate Checks |
| §5.1 comparison/pairing compatibility | Symplectic basis (e,f), also p=2 | Matrix entries (0,1,−1,0) in both realisations after comparison; determinants both 1 | Comparison preserves alternating perfect form | Added API |
| §5.1 Tate-line and Lagrangian filtration | Elliptic fibre | Jumps of H¹: 0,1; target: 1; dim F¹=1; ω(F¹,F¹)=0 | Opposite Tate sign and symmetric pairing fail | Added computed Check |
| §5.1 finite-extension compatibility | E=F; E splitting quadratic L/F | Identity gives (2,4)→(2,4); E⊗_F L=E×E, with H¹ rank 2 over each factor | Ranks and pairings agree after scalar extension | Added API and source Proposition 3.19(3) |
| §6.9 type-(a) membership | Constant elliptic family over quartic L/K with [L_w:F]=4; degree-one base | First global fibre pair is S-good, index 4 and fibre rank 2; second index 1<4 | Global interpolant, not arbitrary local data, is required | Expanded membership equivalence |
| §6.9 type-(b) membership | Same local CM elliptic fibre, coefficient index 4 versus 1 | dim W=dim F¹D_dR(W)=1; 1≥1/2 in both, but index test is true only at 4 | Weight condition alone does not determine membership | Expanded membership equivalence |
| §6.9 type-(c) membership | Degree-one elliptic family; transitive quintic coefficient fibre, d=1 | 1≥1/2 true; 0≥5/2 false | Coefficient algebra controls the condition | Expanded membership equivalence |
| §6.9 three local loci | Constant elliptic family with Y′=Y | Unique coefficient index 1 gives (a)=false, (b)=false, (c)=true at every local point | Distinguishes the three definitions | Added combined Check |
| §7.4 containment in full period locus | Quartic constant non-CM elliptic family | The same S-good pair witnesses Φ₀ in both loci; index 4, ranks (4,8) | Containment preserves the witness | Added API |
| §7.4 monotonicity in S | S containing all bad places; S′=S∪{u} | Required outside-S′ conditions are a subset of those outside S; Φ₀ has membership true→true | Enlarging S retains witnesses | Added API |
| §7.4 automorphism invariance | Identity and central scalar 2 on unfiltered pair | Φ₀ maps to Φ₀; scalar multiplier 4; membership true→true | Retwist isomorphism retains the same global witness | Added API |
| §7.4 containment of actual period images | Constant quartic family | Φ(y)=Φ₀ for every y; global fibre pair gives the same index 4 witness | Actual period value belongs | Added API |
| §7.4 non-density | d=1,r=4; d=1,r=3; d=2,r=4 | Orbit/domain bounds 3<4, 3=3, 10<12 | Strict inequality requires the stated range | Added API and boundary Check |
| §7.4 empty-locus Check | Every coefficient degree ≤3; degree-one constant family | All indices <4; number of possible type-(a) witnesses 0 | Correct empty case | Retained and contrasted with quartic example |
| §7.4 nonempty-locus Check | Non-CM E/K, quartic finite base inert at v, suitable S | Fibre over the degree-four field has rank 2 and is GSp-irreducible; Φ₀ membership true; ambient dimension 4 | An always-empty definition fails | Added Check |
| §7.7 automorphism invariance | Identity and scalar 2 | W maps isomorphically to a dimension-one isotropic line; dim F¹ stays 1; multiplier 4 | Same type-(b) local pair witnesses the retwist | Added API |
| §7.7 actual period containment | Constant CM elliptic family over degree-four local base | Φ(y)=Φ₀; dim W=1, average jump 1; index 4 | Actual local pair witnesses membership | Added API |
| §7.7 non-density/common subobject | Four lines e,f,e+f,e+2f over characteristic zero | Pairwise determinants 1,1,2,−1,−1,1 are nonzero; all pairwise intersections have dimension 0 | No one line meets all four in dimension ≥1/2 | Added API and negative Check |
| §7.7 index-one boundary | Y′=Y, even with a weight-one line | Index 1<4; locus cardinality 0 | Cannot discard the coefficient index | Added Check |
| §7.7 nonempty CM example | E:y²=x³−x at 5; degree-four unramified coefficient field | Affine point counts by x: 1,1,2,2,1; total with infinity 8; a₅=6−8=−2; p∤a₅; i∈ℚ₅; jumps 0,1; dim W=dim F¹W=1 | Ordinary split CM line is a valid stable isotropic witness | Added positive Check |
| §7.7 quantifier order | Four distinct lines versus all four equal e | A separate W_j gives intersection 1 four times; common W does not exist for distinct lines. For equal lines W=e gives 1 four times | One common subobject is essential | Added negative Check; §7.6 positive Check retained |
| §8.1 equal-fibre monotonicity | Identity on a five-orbit; regular C₄-set→point | 0≤0 with fibres 1; 0≤1 with fibre 4 | Valid positive controls | Retained theorem |
| §8.1 unequal positive fibres | Four fixed points plus regular C₄-set→one fixed point plus same orbit | Fibre sizes 4,1,1,1,1; source small count 4 of 8; target 1 of 5; 1/2>1/5 | Surjectivity does not replace equal fibres | Replaced Check |
| §8.1 continuity of replacement | G_F→Ẑ→C₄ | Kernel index 4; regular orbit size 4, fixed orbit size 1 | Actual finite continuous G_F-set | Added exact supplier input |
| §8.2 finiteness/bound | [F:ℚₚ]=1, t=3 | 2³+6³=224; n_v=7,7,11 are each ≤224 | Bound counts embedded fields | Added API |
| §8.2 closure invariance | Isomorphism between two closures, F=ℚ₅ | Three quadratic fields map to three; four cubic fields map to four; 3+4=7 in both | Count independent of closure | Added API |
| §8.2 tame cubic count | q_v=5 and 7 | Tame S₃ permutation relation gives eight labelled transitive actions in each case; division by (3−1)!=2 gives four embedded fields | Normality changes, total does not | Added API and separate Checks |
| §8.2 ℚ₅ Check | Quadratic square classes and nonnormal cubics | Four square classes minus 1 gives 3; cubics 1+3=4; n_v=7. Cubic isomorphism classes: 2; wrong total 5 | Conjugate embedded fields must be distinct | Expanded Check |
| §8.2 ℚ₇ Check | μ₃⊆ℚ₇; power-class dimension 2 over 𝔽₃ | (3²−1)/(3−1)=4 cubic fields, all normal; 3+4=7 | Distinguishes the q≡1 pattern | Added Check |
| §8.2 ℚ₂ Check | Square classes ±1,±2,±5,±10; tame cubics | 8−1=7 quadratics; 1+3=4 cubics; n_v=11. Odd squares are 1 modulo 8 | Wild quadratic contribution changes n_v | Added Check and existing power-class supplier |
| Supplier compactness and §6.3 finite cover | P¹(F), F/ℚₚ finite | Two compact discs: t with |t|≤1, and s=1/t with |s|≤1, s=0 at infinity | Their union covers P¹(F) | Corrected supplier locators and Needs |
| §6.3 nonproper boundary | A¹(F), t_n=p⁻ⁿ, |p|=p⁻¹ | |t₁|=p, |t₂|=p², |t_n|=pⁿ→∞; every finite union of compact discs is bounded | Local charts alone do not give a finite cover | Added Check |

| Statement | Instances tried | Computed values on the relevant sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: weights, Frobenius and reciprocity | ℚₚ⊕ℚₚ(−1); u=4 over ℚ₃ | Jumps 0,1, average 1/2; geometric eigenvalues 1,q; purity weights 0,2. χ_cyc(Art(4))=1/4 | Signs distinguish pure weight 1 from correct jump range | Retained |
| Conventions: monodromy and period direction | p=3, Nf=e, φf=3f; T=[[1,0],[1,1]] | Nφf=3e=pφNf; inverse line (1:−1), forward line (1:1) | Signs and direction agree | Retained |
| §0.1 restriction of section classes | Spec K; inversion extension C₂⋉Ẑ(1) | Singleton→singleton; conjugation by −2 sends 2 to −2 since 2+2(−2)=−2 | Classes, not raw splittings, descend | Retained |
| §0.2 local injectivity | Elliptic curve with full 2-torsion; real connected component | Four p-adic torsion points give four classes; two real points in one component give one class | Finite p-adic hypothesis matters | Retained |
| §0.3 Selmer/localisation | Spec K; empty real point set | Selmer cardinality 1 and unique localisation; empty local image forces Selmer cardinality 0 | All places are imposed | Retained |
| §0.4 modified adeles/finite descent | Spec K; real elliptic curve with two components | Modified carrier cardinality 1 for Spec K; real factor cardinality 2 for the curve | Correct imported quotient | Retained |
| §0.5 Harari–Stix | Rational point of Spec K; unit 1 of G_m | Fibre torsor class matches at every place; one point section supplies one global witness | Nonproper case remains included in (a) | Retained |
| §1.1 symplectic pairs and Σ | Zero module; ℚₚ[ε]/ε²; nonsplit quadratic field | Rank-zero pairing is perfect into rank-one line; nilpotent algebra has dim 2 but #Σ=1; nonsplit field dim 2 but #Σ=0 | Neither splitness nor rank-one target follows from perfectness alone | Retained |
| §1.2 fibre pair | Degree-two connected finite base; split two-point base | Both H⁰ ranks 2 and H¹ ranks 4 for elliptic fibres; actions respectively transitive and trivial on two coefficient points | Galois algebra, not ranks alone, determines fibre data | Retained |
| §1.3 relative pair | Spec F; single elliptic family | R⁰ rank 1, R¹ rank 2; fibre polarisation pairing values 1,−1 | Relative construction recovers fibre structure | Retained |
| §1.4 pair of a section | Constant elliptic family | For every s the pair has ranks (1,2) and the same constant representation; conjugation does not change the class | Section pullback is isomorphism-class invariant | Retained |
| §1.5 local-system restriction | Rational point; constant rank-two local system | Both restricted/fibre representations have the same two-dimensional action; on the unit, both have dimension 1 and trivial action | Tensor and fibre comparison agree | Retained |
| §1.6 local pair interpolation | Rational point section | Global fibre restriction and local fibre have ranks (1,2) and pairing matrix [[0,1],[−1,0]] | Pairing is transported with the representation | Retained |
| §1.7 adelic locus | Constant family; empty adelic carrier | Every adelic point has the same global pair; when carrier is empty locus cardinality 0 | One global pair precedes the place quantifier | Retained |
| §1.8 Selmer inclusion | Rational section; empty local point set | loc_v κ(y)=y and its fibre pair witnesses membership; empty target gives image cardinality 0 | Inclusion is independent of good reduction | Retained |
| §2.1 filtered category, functors and full faithfulness | Unit; Tate line; index-two induction; zero | End(1)=ℚₚ; Hom(1,ℚₚ(1))=0 by valuations; φ on Tate basis p⁻¹, jump −1; induced dimensions 2 and tensor-square 4; End(0)=0 | φ, scalar twisting and lax monoidality are necessary | Retained |
| §2.2 algebraic automorphisms/retwist | D=0; ordinary plane; scalar 2 and diag(2,3) | Aut(0)=1, Aut^GSp(0)=G_m; ordinary centralizer dimension 2; multipliers 4 and 6 | Multiplier is retained even in rank zero | Retained |
| §2.3 orbit criterion | Split torus on P¹(ℚₚ) | Orbits {0},{∞},ℚₚ×: three retwist classes; scalar acts trivially | Both directions match filtration transport | Retained |
| §2.4 dimension bounds | Ranks 0,1; symplectic ranks 0,2 | Aut dimensions 0≤0, 1≤1; similitude dimensions 1≤1 and 2≤4 in ordinary example | Zero and positive rank use correct bounds | Retained |
| §3.1 conjugate places | ℚ; ℚ(i) at 2,3,5 | All ℚ primes fixed; over 2 one ramified fixed prime, over 3 one inert fixed prime, over 5 two exchanged primes | Self-conjugacy includes ramified nonsplit primes | Retained |
| §3.2 conjugate weights | Finite character; χ_cyc⁻¹ | 0+0=0; 1+1=2 | Self-conjugate ℚₚ-valued characters have even purity weight | Retained |
| §3.3 finite-order factor | χ=χ_cyc⁻¹, n=2 | χ·χ_cyc^(n/2)=1; local finite factor has order 1 | Exponent sign agrees | Retained |
| §3.4 weighted average | Elliptic H¹ over degree-one and degree-two extensions; V=0 | Sums 1=1·1·2/2, 2=1·2·2/2, 0=0; zero-rank average undefined | Weighted identity includes zero without division | Retained |
| §4.1 horizontal transport and point-fibre input | Polyannulus dimension 0; base Tate lattice; z²=t over ℚ₃ | q=s=id; χ∘q∘s=χ; fibres at t=1,2 have respectively two fixed points and one two-orbit | Point fibre cannot forget its section | Retained |
| §4.2 polydisc reduction | Residues of two points 0,1 over 𝔽₂ | Available third residues: 0 over 𝔽₂, at least 2 over 𝔽₄ and 6 over 𝔽₈; gcd(2,3)=1 | Two extensions recover full equivariance | Retained |
| §4.3 transport identity/cocycle | Constant rank-two pair, three centres | Each transport is I₂; I₂I₂=I₂ | Compatibility and uniqueness fix the map | Retained |
| §4.4 period control of D_pst | Constant smooth proper family; i=0 elliptic fibre | D_pst rank constant 1 in degree zero; transport on it is 1 | Model-free statement does not assert constant filtration | Retained |
| §4.5 local representation control | Centre and transported line | At centre M(Φ₀)=H_pH; for T=[[1,0],[1,1]] pulled-back line is (1:−1) | Actual period values give the required representation class | Retained |
| §5.2 Lagrangian retwist | Elliptic plane; Φ=span(e₁,f₁) in a symplectic four-space | Elliptic dim F¹=1 and ω(F¹,F¹)=0; four-space Φ has dim 2 but ω(e₁,f₁)=1 | Half-dimension alone is insufficient | Retained |
| §5.3 period diagram | Constant elliptic family; centre | Φ(y)=Φ₀, M(Φ₀)=H_pH with ranks (1,2); both paths give same pair | Uses inverse on essential image only | Retained |
| §5.4 decomposition | Closed component degrees 1 and 2, d=1 | Domain dimension 1·1+2·1=3; degree-one/two H¹ ranks 2 and 4 over F | Each factor uses its own residue field | Retained |
| §6.1 S-goodness | ℚₚ⊕ℚₚ(−1); H¹(E)(1); (A,0) | First weights 0,2 with jumps 0,1; second purity −1 and jumps −1,0; zero degree-one module imposes only ramification on A | Purity is separate from Hodge range | Retained |
| §6.2 local LV locus | Constant elliptic family | Every y has same S-good interpolant of ranks (1,2), so locus is all Y(F) | Finiteness requires extra geometry | Retained |
| §6.3 period locus criterion | Constant d=1 family; proper versus affine line | Constant period image dimension 0<1; P¹(F) admits two compact discs; affine values pⁿ unbounded | Density and finite covering are distinct inputs | Added compactness Check and supplier locator |
| §6.4 adelic interpolants S-good | Global elliptic fibre, S suitable | At every place above p, jumps 0,1; at good outside-S places both eigenvalues have purity weight 1 | Same global pair has all required restrictions | Retained |
| §6.5 rational inclusion | One rational fibre; empty Y(K) | The fibre interpolates its own image; empty image cardinality 0 | No rational-point finiteness assumed | Retained |
| §6.6 forgetting pairing | d=1; two nonisomorphic absolutely irreducible planes, c=2 over ℚ₃ | In rank 2 line is ∧²V; in rank 4 b=a₁²=2a₂² would make 2 a square, contrary to residue 2 modulo 3 | Pairing carries extra data in higher rank | Retained |
| §6.7 coefficient points | Degree-four closed point; nonsplit coefficient field | Split H⁰ has four evaluation maps in one orbit, index 4; nonsplit quadratic ℚₚ-algebra has no ℚₚ-points | Geometric finite-base points differ from geometric algebra points of an arbitrary algebra | Retained |
| §6.8 trichotomy | Σ singleton; Σ empty; d=m=1, #Σ=4, small count s | Singleton gives 1≥1/2; empty gives 0≥0. Weight inequality 2≤s implies s≥2=4/(1+1) | Cardinality argument includes the degenerate case | Retained |
| §7.1 local class sets | δ=1,d=1; incompatible discrete data | B=2; qualifying elliptic class contributes one orbit; incompatible class contributes zero | Does not turn every class into a period point | Retained |
| §7.2 finiteness hypotheses | Unipotent matrices ρ_λ=[[1,λ],[0,1]] | det=1, Frobenius polynomial (X−1)², stable isotropic line dimension 1 | Infinite extension families are excluded by GSp-irreducibility | Retained |
| §7.3 orbit non-density | d=1,r=3,4; d=2,r=4 | Bounds 3=3, 3<4, 10<12 | Weil restriction and threshold matter | Retained; recomputed for §7.4 |
| §7.5 finite type-(a) locus | Empty Y(F); nonempty proper curve with N discs | Empty locus cardinality 0; otherwise #locus≤sum of N finite disc counts | Compactness supplies finite N | Dependency corrected through §6.3 |
| §7.6 factor type-(b) condition | Four distinct plane lines; four copies of e | Distinct: common W impossible since dim(e∩f)=0; equal: W=e, intersections all 1≥1/2 | Common isotropic witness is necessary | Retained; recomputed for §7.7 |
| §7.8 finite type-(b) locus | Empty Y(F); finite disc cover | Cardinality 0 when empty; otherwise bounded by finite sum of disc counts | Uses compactness after non-density | Dependency corrected through §6.3 |
| §8.1 remaining orbit tests | Trivial set; five-orbit; regular S₃; S₃/C₂ | Ratios 1,0,0,1; the last orbit has size 3 and regular orbit size 6 | Uses full group orbits | Retained |
| §8.3 torsion bound | g=2,k=5,q_v=7; k=1 | gcd(5,6)=gcd(5,48)=gcd(5,342)=1; bound 7·25=175≤625. At k=1, module cardinality 1≤n_v | Pairing-line invariants vanish in the stated range | Retained |
| §8.4 type-(c) exclusion | g=2,q_v=5,q=83,k=41,n_v=7 | d_q=123; 82≥63; estimate 63/13448<1/124 since 7812<13448; dual Frobenius 5⁻¹=33 mod 41 | Strict inequality and sign agree | Retained |
| §8.5 auxiliary prime choice | q_v=2,n_v=11; q=11 and q=107 | Forbidden odd primes 3,7; q=11 satisfies avoidance but 10<99; q=107 has k=53, 106≥99, and q≡3 mod 4, 2 mod 3, 2 mod 7 | Prime 11 is only an avoidance example, not the required family parameter | Retained |
| §8.6 parameter comparison | g=3,q=11,23; residue cardinality 13 for q=23 | d_11=25,d_23=55; q−1=10 has divisor 5 whose residue orders are ≤4, failing the old threshold 8; ord_11(13)=10>7 | Numerical comparison keeps the two different ranges | Retained |
| §9.1 finite local LV locus | Empty Y(F); type decomposition with finite counts a,b and empty c | Empty case 0; in general #LV≤a+b+0 | Choice of q precedes use of the trichotomy | Retained |
| §9.2 Mordell consequence | Empty local curve; genus-one positive-rank boundary | Empty target gives #Y(K)=0; in genus one the multiples nP are infinitely many distinct points | Genus≥2 remains essential | Retained |
| §9.3 self-conjugate Selmer image | ℚ(i) at 3 and 5 | One fixed prime at 3 qualifies; two exchanged primes at 5 do not | No CM-free hypothesis is inserted here | Retained |
| §9.4 Theorem A | K=ℚ at 2 and 3 | CM subfield count 0, so the self-conjugacy condition is true at both places | Every finite place remains covered | Retained |
| §9.5 Theorem B | Empty adelic locus; rational point witness | Empty projection and empty Selmer-localisation image both have cardinality 0; a rational witness maps to the same one local point on both sides | Harari–Stix projection equality gives the same finiteness claim | Retained |
| §9.6 obstruction comparison | Place above 2; no CM subfield | Friendly-prime hypothesis in the old range is false; self-conjugacy in the new range is true | General endpoint retains the places excluded by the comparison method | Retained |

All new uses of division have positive denominators: #Σ>0, d+1>0, finite field-extension degrees 2,3,4>0, and t=[F:ℚₚ]+2≥3. The zero algebra is included only in the cardinality form. Equal characteristic and nonreduced coefficient algebras are not silently admitted into field-extension or p-adic comparison statements. The four-line computations are in characteristic zero, including over extensions of ℚ₂; reduction modulo 2 is not used. The quadratic-field H⁰ Check uses structural composition of an L-scheme over F, not Weil restriction of the variety.

## Mechanical checks and maintainer consequences

- Required elaboration of `packages/GaloisSectionsPadicPeriodMaps/Suggested.lean`, from the pinned content checkout with the required absolute file argument: exit 0, no output and no warnings. No Tau Ceti object build was needed: the only import is `import Mathlib`.
- Mechanical declaration inventory: zero declarations, zero `#check @name` requests, zero sorried theorems/data definitions, and zero declaration binders to compare with the README. The separate signature scratch module, containing the single import and the empty request list, was elaborated once: exit 0, no output and no warnings. No binders or Lean names changed.
- The fourteen headline groups in the module docstring were compared with the README; the repairs affect their auxiliary APIs and Checks, not their hypotheses or missing carriers. The file remains the honest empty acceptance test at these pins.
- The required dependency command was run with the supplied configuration, absolute README and order arguments, name GaloisSectionsPadicPeriodMaps and `--movable`. Exit 0; its complete output was:

```text
depcheck: 51 roadmaps, 596 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

- Citation resolver: exit 0; no cross-roadmap citations found nowhere and no Lean names found nowhere. Its stated inability to inspect pinned Lake packages was handled by the direct pinned-file audit above.
- `git diff --check`: exit 0, no output. The source manifest retains four unique certified source IDs and valid TOML; the plan remains unchanged. No separate gate failure needed repair.

No downstream declaration name changed or disappeared. Other roadmaps need no rename, merge-order edit or scope change for these findings. The existing seven supplier gaps remain visible and necessary; this report does not certify them as delivered. No commit, push or external write was performed. A fresh independent review remains the next acceptance step.
