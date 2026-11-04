# Review of NeronModelsAndSemistableAbelianVarieties (pull request #852 at 753e52a)

**Verdict:** needs changes

## R01 (P1) — Required Weil–Deligne supplier targets do not exist

**Location:** TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:535, also 2990 and 3182. The contract names “wd-parameter-operations” and “wd-frobenius-semisimplification”.

**Claim:** SmoothRepresentationsOfLocalGroups SR.5.2 supplies raw parameter operations, nonzero monodromy rescaling and Frobenius semisimplification for the before/after comparisons in §5.3.

**Witness:** TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:4371 supplies the Frobenius-semisimplified functor; line 4393 describes semisimple parameters. Neither named target occurs. The raw unramified parameter F=[[1,1],[0,1]], N=0 is not semisimple.

The supplier was read at its supplied open head through the roadmap service, and the missing labels were searched again there; there is no main copy to substitute. A Check describing semisimplification of an ℓ-adic representation does not supply a general raw Weil–Deligne carrier or the rescaling theorem used for residue-prime realizations. Other roadmaps repeating these citations do not establish ownership. No matching declared gap is available.

**Repair:** retain the raw comparisons, but declare precise supplier gaps, with matching slugs in the plan and README, for the raw carrier and required operations, or cite actual targets of an eligible owner. Specify coefficient fields, finite inertia, q≥2, the nonzero scalar and the input/output normalization. Test the repaired contract on F=[[1,1],[0,1]], N=0, whose semisimplification is (I,0), and on F=diag(5,1), N=E₁₂: diag(2,1) conjugates N to 2N. Both inputs must be admitted.

## R02 (P2) — Excellence unnecessarily narrows the principal reduction theorems

**Location:** TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:1658, 1702, 1730, 2844 and 2906: “Let R be an excellent discrete valuation ring.”

**Claim:** potential semistability, the monodromy/full-level criteria, Néron–Ogg–Shafarevich and good-reduction isogeny invariance are developed only for excellent DVRs.

**Witness:** conrad lines 321, 348–351, 653 and 839 state the relevant reduction theory for a DVR without excellence. Finite separable normalization is finite by the trace-lattice argument; excellence is unnecessary for that step.

This is a loss of the general library required by the brief, not a false assertion on excellent rings. LocalExistence already has the correct arbitrary-DVR scope. The restriction is propagated from §3.10 into the criteria and then used to excuse an absent Lean headline.

**Repair:** state these theorems over arbitrary DVRs, retaining henselian hypotheses where a chosen inertia action is used and the stated henselization descent for the general version. Replace the excellence-dependent normalization explanation with finite separable normalization and its owner/target. Keep excellence for the particular smoothening construction where it belongs. Checks still give a degree-one extension and model Spec R for the zero abelian variety over any DVR; a split Tate curve has nonzero square-zero monodromy; a good model and every isogenous abelian variety have trivial inertia. These computations require no excellence.

## R03 (P2) — GoodIsogeny is statable at the pins but omitted

**Location:** TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/Suggested.lean:35, compared with README §5.2. The docstring excuses omission because the excellent-DVR predicate is unavailable.

**Claim:** the good-reduction isogeny headline cannot be stated against the pins.

**Witness:** TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:56 and :61 supply native isogenies. A scratch definition of existence of a smooth proper geometrically connected group model, followed by GoodIsogeny over an arbitrary DVR, elaborated successfully.

**Repair:** after R02, include a simple good-model predicate with a real body on Over (Spec R), and the isogeny-invariance theorem using AbelianVariety.IsIsogeny. Reuse the model condition already expressed in EquationGoodComparison; do not encode excellence as an arbitrary proposition. The compiled probe quantified explicitly over R, K, the fraction-ring structure, A, B and an isogeny f, and concluded the equivalence of good-model existence. Identity and [p] on a good elliptic curve give (true,true), including inseparable [p]; Tate isogenies give (false,false). No new geometric carrier is needed.

## R04 (P2) — Determinant functors already have an owner

**Location:** TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:3309–3312 and 3325–3328: “This determinant-of-cohomology construction is owned here”.

**Claim:** this roadmap constructs determinants from bounded finite free resolutions, including quasi-isomorphism, exact-sequence and base-change compatibility.

**Witness:** main TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:3172, §5.1, already owns determinants of perfect complexes; lines 3235–3260 give detLine, quasi-isomorphisms, exact sequences, base change and acyclic trivializations over any commutative ring.

**Repair:** import that main-roadmap section and its normalization in the supplier contracts. Keep here the curve-specific perfectness assertions, Mumford isomorphism, discriminant section and valuation comparison. Do not construct a second determinant functor for DVR resolutions. For [R --π→ R] in degrees −1,0 the supplied convention gives generic trivialization coefficient π⁻¹ and canonical section π; the proposed specialization gives exactly those values.

## R05 (P2) — The dependency gate fails, with five identifiable false positives

**Location:** README lines 411, 439, 2469, 2571, 2749, 2809, 3234 and 3323; worker gate rule depcheck.

**Claim:** the gate rejects dependencies on AlgebraicCurves, AlgebraicVectorBundles, LocalFieldsRamification, ProfiniteCohomology and RepresentationTheory as upward edges.

**Witness:** the first four have readable main-roadmap files. README line 411 is a pinned TauCeti/RepresentationTheory/PGroupInvariants.lean reference, not a dependency on an open RepresentationTheory roadmap. The supplied brief permits main roadmaps.

All five failing entries are recorded here; the exact rerun output appears below. These are checker false positives under the supplied ownership rules, not five demonstrated mathematical cycles. Its “not movable” warning is the consequence of treating the main ProfiniteCohomology supplier as its later open revision.

**Repair:** preserve the main/pinned ownership, make the source distinction explicit where needed, and have the worker resolve these classifications and obtain a passing gate. Do not move this roadmap below its consumers or cite the later revisions as suppliers. The recheck must resolve the four names to main and the fifth to the pinned library, yielding no upward edges for these five inputs. No tooling or merge-order file was changed in this review. The gate is still failing, so this report cannot record acceptance.

## R06 (P3) — Layer 4 exports depend on unlisted Layer 5 inputs

**Location:** TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:2660–2680 and 2710–2717, compared with the layer dependencies at 2749.

**Claim:** the §4.14 good-place and two-place exports consume §5.0a–c although Layer 4 is presented as preceding Layer 5 and its dependency summary lists only Layers 1–3.

**Witness:** the good-place characteristic-polynomial interface explicitly needs the finite-étale specialization and Frobenius comparisons of §5.0. The zero graph at good reduction does not itself supply a Frobenius polynomial.

**Repair:** move those exports after §5.0, for example into Layer 6, retaining independent specialization constructions in §4.14; update section references and dependency summaries. This is a layer-order defect, not a demonstrated cycle of individual targets. At two good elliptic places both graph lattices and component maps are zero, while the shared torsion space has dimension two and still needs the two Frobenius actions.

## R07 (P3) — Sampled source locators point to different material

**Location:** TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:2808, 2830 and 3260.

**Claim:** Milne 2008 Proposition 10.20 is on p.52, IV Theorem 3.5 supplies the good-reduction Frobenius identification, and Liu's strict-henselization comparison is in the Introduction on p.51.

**Witness:** milne2008 lines 2109–2111 put Proposition 10.20 on printed p.50; lines 5824–5837 give Frobenius specialization on p.142. liu lines 95–99 discuss strict henselization on printed p.53, in genus two.

**Repair:** cite Milne I Proposition 10.20, p.50, and IV discussion following Corollary 3.6, p.142; use II Theorem 1.1 and its polarization argument, pp.75–77, for the reciprocal-root identity. Correct Liu to p.53 and label its genus-two scope; it cannot alone certify the general elliptic completion assertion. Retain the elliptic primary reference and explicit base-change proof route. On y²=x³−x over F₅, #E=8 and P=X²+2X+5; X²P(5/X)=5P(X). Correcting the locators preserves these formulas.

## R08 (P3) — API and Check names claim declarations absent from Suggested.lean

**Location:** TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:684–702 and 745–761, with the same pattern elsewhere.

**Claim:** backticked names such as NeronMappingProperty.bijective, extend_restrict and extend_identity_test designate this roadmap's API and Checks.

**Witness:** Suggested.lean declares exactly LocalExistence, DedekindExistence and EquationGoodComparison. It has no mapping-property definition, extension API or named Check. The worker's zero name-scan count does not establish the house-style correspondence.

**Repair:** express the nonheadline definitions, API facts and Checks in prose; retain backticked own declaration names only for the definitions and headlines actually kept in Suggested.lean. Do not fill the Lean file with API padding. Also add the required Layer 1 and Layer 6 section comments around the existing theorem groups. Mathematical content and the three existing signatures remain unchanged.

## R09 (P3) — Early Checks repeat the laws rather than discriminate constructions

**Location:** TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:696–702 and 757–761.

**Claim:** the definition checks for the mapping property and extension operation consist largely of failure of surjectivity, restriction after extension, and identities already asserted in the API.

**Witness:** §1.3's three Checks repeat extend_identity, extend_inverse_model and extend_restrict without an instantiated scheme or computed map. §1.1's unnamed nonextendible map does not provide its promised smooth-test witness.

**Repair:** give at least three concrete discriminating Checks per definition. Use Gₘ,R with generic unit π (R×→K× misses π), translation by a nonzero section P on a good elliptic model (0 maps to P, so extension is not restricted to homomorphisms), and two markings id and [-1] (comparison [-1], composite [1]). Keep the identity-base boundary Check, but do not count repeated API sentences as additional examples.

## Verified sound

The full README and Suggested.lean were read, together with the repository writing rules and CONTRIBUTING.md. Main-roadmap examples were read to compare shape. The requested head is present and the diff outside this folder is empty. No copied passage was identified in the readable sources. No computational algorithm target, sorry-defined data, set_option, admitted example, or route restricted to good primes was found. This is a repairable extension of the library; R04 is a duplicate subconstruction, not a reason to reject the whole scope.

**Build and signatures.** Mathlib pin: 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti pin: a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The missing ProjModel import was built first. The required direct Lean elaboration then passed with exactly the three sorry warnings. One scratch copy with #check @name for all three declarations elaborated; the DVR/fraction-ring, normal-stalk/dimension, and minimal-equation assumptions remain in their types. No statement changed. A one-tactic probe of each admitted theorem using simp, rfl and infer_instance failed to close all three; the pinned searches found no single library theorem giving their full conclusions. No padding finding is made. The separate native GoodIsogeny probe also elaborated after building its Isogeny import.

**Headline inventory.** README §§1.7–1.9: local and Dedekind Néron existence, abelian-scheme comparison. Layer 2: identity/component structure and elliptic regular-model comparison. §§3.2–3.14: isogeny invariance of semistability, semistable base change, finite semistable extension, monodromy/full-level criteria, Raynaud extension and uniformization. §§3.8–4.13: Picard–Néron, graph characters, monodromy and component cokernels/pairings, generalized Jacobians and their two-torsion. §§5.0–5.7: good Frobenius/Euler polynomials, NOS, potential good reduction, GoodIsogeny, residue-prime comparison, Ogg–Saito and residual/semistable conductor comparisons. Layer 6: independence and specialization, isogeny/differential interfaces, equation/scheme reduction comparisons, strict compatibility/purity, ordinary-surface and full-level curve consequences.

LocalExistence, DedekindExistence and EquationGoodComparison are stated. The module docstring groups the other geometric headlines by the missing identity, Picard, semiabelian, formal/rigid, general abelian Tate-system and period carriers. Those are substantive missing structures, not grounds for replacing theorems by arbitrary predicates. The exception identified by a successful native-carrier probe is GoodIsogeny, R03.

**Pinned declarations opened by object.** The following are actual source locations, not name-only search results:

| File at pin | Declaration/content inspected | Boundary checked |
|---|---|---|
| TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95, :127, :136 | AbelianVariety, smoothness, geometric connectedness | Native proper geometrically integral group object; sufficient for the good-model predicate. |
| TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:56, :61, :68 | IsIsogeny and finite/surjective characterization | Does not exclude inseparable isogenies. |
| TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/ProjModel.lean:80, :85 | projModelOver and properness | Scheme model exists; smoothness/good-model comparison is not already this declaration. |
| TauCeti/AlgebraicGeometry/Fibers/SchematicDensity.lean:59 | ext_of_genericFiberι_eq | Gives uniqueness from flatness/separatedness, not existence or an arbitrary-j mapping property. |
| TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/Uniqueness.lean:53 | uniqueness of model isomorphisms | Does not construct a Néron model. |
| TauCeti/Algebra/AlgebraicGroup/Connected/GroupScheme.lean:141, :149 | identityComponentSpec | Affine Hopf-algebra scope, not the non-affine identity scheme required here. |
| TauCeti/Algebra/AlgebraicGroup/Connected/ComponentGroup/FiniteEtale.lean:54 | componentGroupScheme | Constant component group over an algebraically closed field; descent still needed here. |
| TauCeti/Algebra/AlgebraicGroup/Torus/CharacterLattice/Functoriality.lean:67 | character functor | Covariance in coordinate Hopf algebras means contravariance in tori. |
| TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Bilinear.lean:96, :103 | discriminant pairing and representative formula | Geometric comparison is new, lattice pairing is imported. |
| TauCeti/LinearAlgebra/IntegralLattice/RankOne.lean:347 | rank-one pairing | Normalization rs/(2m); m=2 gives 1/4, not the graph form [5]'s 1/5. |
| TauCeti/RepresentationTheory/PGroupInvariants.lean:161 | nonzero invariants for a finite p-group | Characteristic p and nonzero representation are essential; arbitrary finite groups fail. |
| TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean:595 | explicitCup11 | Requires the equivariant coefficient pairing; does not identify a geometric extension class. |
| Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:274, :282 | IsMinimal and integrality | The minimality binder in EquationGoodComparison supplies an integral equation. |
| Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:43 | localPolynomial | Good, split, nonsplit and additive branches; finite residue field needed for cardinality interpretation. |

**Ownership and supplier resolution.** Object-based searches used the roadmap service over main/open heads and the board packages, followed by reading relevant supplier sections. Searches for the three fully qualified target names found no other owner. Main copies, rather than proposed revisions of existing roadmaps, were used for existing suppliers. This does not certify every result in every indexed open roadmap; it checks overlap with the objects this folder uses.

| Supplier and resolved location | Consumed contract and conclusion |
|---|---|
| TauCetiRoadmap/SchemeAndStackFoundations/README.md, §§0.12–0.14, 0.20–0.21, 2.6, 3.6, 3.8, 4.7–4.15 (notably lines 1068, 3437, 4905, 5000, 5725) | Henselian bases, coherent finiteness, Picard torsors, differentials, formal algebraization and stable curves. Specialized Néron comparisons remain here. |
| TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md, §§6.1, 7.3, 7.6.1, 7.9 | Artin approximation, relative Picard sheaf and spaceSectionComponentCriterion are present at the open head. |
| TauCetiRoadmap/ComplexComparisonPartII/README.md, C3.2d.2 and C3.2f.1–2 | Relative Picard representability and picardZeroCriterion, including proper flat finite presentation and global-functions/base hypotheses. |
| TauCetiRoadmap/EtaleCohomologyFoundations/README.md:776, :793, :829, :832, F.3a | General-trait inertia, tame character, extension restriction and ramification-index scaling; not limited to finite residue fields. |
| TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:409, §2.2a | Integral/multigraph cycles and forests. Graph objects are imported; toric-character comparison is owned here. |
| TauCetiRoadmap/GraphConnectivityAndFlows/README.md; TauCetiRoadmap/JacobianChallenge/README.md, D–F | Graph infrastructure and smooth-curve Jacobians are distinct from the new semistable Picard comparison. |
| TauCetiRoadmap/ReductiveGroupsPartII/README.md:3800, :4007, :4044, :4054, :4077, :5201 | RG2.3.1 quotients; RG2.3.2 lft torus models and affine/full mapping comparison; RG2.3.7 Lang. Positive-rank split tori are not falsely made quasi-compact. |
| TauCetiRoadmap/StableReduction/README.md, Layers 4–7, especially :550–573 | Resolution/minimal models and curve reduction. §3.10 uses curve existence, not the later curve–Jacobian criterion it helps prove. |
| TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md, A0.1, A1.8, A3, A4.1, A4.4, A4.8, A6.5, A6.10–11 | Abelian schemes; Weil extension; isogenies/Tate systems; polarization, Poincaré reducibility over the original field; degree-2g Frobenius polynomials. |
| TauCetiRoadmap/RigidAnalyticGeometry/README.md, §§6.1–6.2, 8.1–8.3; TauCetiRoadmap/AdicSpacesPartIII/README.md, F0, R2.3 | Rigid/formal carriers and comparison; finite analytic quotients are not claimed to provide the infinite period-lattice quotient. |
| TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md, §§2.1a, 3.1–3.2, 6.1–6.4a, 6.6 | Trait transport, conductors, Tate/Euler and Frattini interfaces. Its repeated missing WD labels do not repair R01. |
| TauCetiRoadmap/PadicPeriodRings/README.md, §§4.1–4.3 | Covariant semistable period functors and p-normalized monodromy. |
| TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md, F.6 | Generic potentially semistable realization; normalization/filtered Raynaud identification assigned here. Valuation 5/e_K convention matches. |
| TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md, P7.1, R07.3.0, R07.4.27 | Finite-extension period comparisons and arithmetic-Frobenius parameter recipe. |
| TauCetiRoadmap/CrystallineCohomology/README.md, CR2.1, CR2.3, CR3.4 | Enhanced crystalline cohomology, smooth formal comparison with stated PD conditions, semilinear Frobenius. |
| TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md, IG2.4, IG2.6, IG2.8 | Hilbertian permanence/full finite-quotient specialization; finitely generated field consequence is actually discussed. |
| TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:3172 | Existing determinant owner: R04. |
| TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:4371 | Semisimplified normalization exists; claimed raw operations do not: R01. |

The new ownership is the geometric Néron, semistable Picard, period/monodromy and reduction-comparison theory, rather than rebuilding supplied curves, tori, abstract Tate representations or integral cycle spaces. No new unreported cross-roadmap convention conflict was found in the explicit arithmetic Frobenius, character-pullback, graph-boundary and monodromy-sign witnesses.

**Seeded source audit: all 15 requested targets.** “Read” below means the text at the locator was opened, including images for scans. “Uncertified” is not a claim of source verification.

| Target | Locator checked and evidence | Outcome |
|---|---|---|
| 1.3 Extension | BLR §1.2 Proposition 2, p.13 | Publisher text unavailable; uncertified. Universal-property deduction checked independently. |
| 2.4 Toric characters | conrad Theorem 3.1, pp.7–8, Proposition 2.16, p.6; SGA 7 I IX 11.6.1 p.456 and 10.4 p.444, scan pages 461 and 449 | Character lattice/duality scope supports claim. |
| 3.3 Identity base change | conrad Theorem 4.4 and Corollary 4.5, pp.10–12; lines 433–437 | Identity-model assertion supported. README correctly adds whole-group smoothness to helper; source error below. |
| 3.8 Picard scheme | conrad Theorem 7.13 and Proposition 7.14, pp.34–35, lines 1460–1499 | Regular proper flat semistable hypotheses and degree-zero identity scheme match. |
| 3.11 Monodromy | conrad Theorem 5.8/proof, pp.20–22, lines 839–907 | Supported with broader DVR generality; README repairs erroneous finite-level inference. |
| 3.13 Raynaud extension | raynaud §4.2 pp.302–305, lines 286–387; Faltings–Chai II §§1–3 pp.33–37 | Raynaud read in positive-residue-characteristic setting. All-characteristic construction still rests on uncertified Faltings–Chai. |
| 4.1 Normalization | SGA 7 I IX §12.3, printed pp.469–473, scan pages 474–478 | Formulas and normalization/torus sequence read directly. |
| 4.2 Characters and cycles | Same SGA pages, particularly 12.3.6–12.3.14; hatcher §2.2 pp.140–141, lines 6081–6107 | Boundary convention and graph characters agree, including loops/multiple edges. |
| 4.8 One node | bgw arXiv:1310.7692v2 §3 pp.9–12, lines 370–475 | Pinching adds one to genus; characteristic ≠2 and separability retained. |
| 4.12 Connecting class | bgw lines 473–475; poonen-schaefer Proposition 10.3, author version dated 10 February 1997, pp.18–20, line 869 onward | Cup-product identification supported; not confused with Picard–Brauer obstruction. |
| 4.13 Stable-family Picard | yuan arXiv:2108.05625v4, p.43 before Lemma 3.4, lines 1423–1436; BLR §9.4 Theorem 1 p.259 | Yuan states required representability/semiabelian conclusion; primary BLR theorem remains uncertified. |
| 5.0b Good Frobenius | milne2008 I Proposition 10.20 p.50, lines 2109–2111; II Theorem 1.1 pp.75–77, lines 3105–3149; IV p.142, lines 5824–5837 | Supports formula and normalization; locator corrections R07. |
| 5.3b Regular elliptic fibre | Silverman IV §§5–6, 8–9; liu Introduction p.53, lines 95–99 | Silverman uncertified; Liu narrower genus-two context and wrong cited page, R07. |
| 5.3e Ogg–Saito | ddt revised 2007 §2.2 Remark 2.14 p.58, lines 2179–2183; liu §2.1 pp.58–59; Saito Theorem 1 | DDT conductor identification read. General Saito theorem inaccessible; not certified from DDT's narrower setting. |
| 6.9 Minimal differential | tate Theorem 4.2, printed pp.42–43, scan pages 10–11 | Integral formal differential with constant coefficient 1, including characteristics 2 and 3, read directly; §2.7 supplies Néron-lattice bridge. |

Additional spot checks read Werner Proposition 5.1, printed pp.212–214 (positive component-pairing sign), Katz–Messing Theorem 1, printed pp.73–74 (cohomological Frobenius comparison), and Knudsen–Mumford I Theorem 1, printed p.25 (determinant functor). SGA, Tate, Werner, Katz–Messing and Knudsen–Mumford are image scans: printed/PDF page locators are used rather than invented extraction line numbers. Source retrieval covered every cited reference-list work, with retries using the same source IDs; retrieval alone is not certification of unsampled locators.

**Gate.** The supplied gate reports zero for all checks except depcheck=5, and overall FAIL. The build is passing. Exact output of the requested movable dependency rerun follows; no tooling or order edits were made.

```text
not movable: NeronModelsAndSemistableAbelianVarieties consumes ProfiniteCohomology (#376) and is consumed by EllipticLegendreCharacterInterfaces (#89), which comes first: moving NeronModelsAndSemistableAbelianVarieties after ProfiniteCohomology would put a supplier after a consumer, a cycle through NeronModelsAndSemistableAbelianVarieties
UPWARD: NeronModelsAndSemistableAbelianVarieties (#48) -> AlgebraicCurves (#226) at README lines [2469, 2749]
UPWARD: NeronModelsAndSemistableAbelianVarieties (#48) -> AlgebraicVectorBundles (#247) at README lines [3323]
UPWARD: NeronModelsAndSemistableAbelianVarieties (#48) -> LocalFieldsRamification (#328) at README lines [2809, 3234]
UPWARD: NeronModelsAndSemistableAbelianVarieties (#48) -> ProfiniteCohomology (#376) at README lines [439, 2571, 2749]
UPWARD: NeronModelsAndSemistableAbelianVarieties (#48) -> RepresentationTheory (#180) at README lines [411]
depcheck: 163 roadmaps, 1199 edges, 5 problem(s)
```

**Computed adversarial pass: 123 rows.** Each row records instantiated objects and values on the relevant sides. Related API laws share the row for their construction; sampled/headline targets and separate comparisons have their own rows. Point counts, torsion matrices modulo 4, finite groups, lattice determinants and normalization ratios were also computed in scratch. These finite tests are witnesses and negative controls, not proofs of the general theorems. Source-dependent cases remain qualified by the source audit.

| Statement or convention | Instances tried | Computed values | Result / change |
|---|---|---|---|
| Conventions: generic restriction and finite type | Identity base; field; zero ring | j=id gives a bijection for every X; a field has dimension 0, not 1; zero ring fails IsDomain | Correct exclusions; the predicate alone is not existence. |
| Conventions: twists and Frobenius | Split Tate curve over residue F₅ | Arithmetic factors (5,1); geometric factors (1/5,1); cohomological factors (1,5) | Correct variance. |
| 1.1 Néron mapping property | Spec R; Gₘ,R with generic unit π | Terminal Hom sets both singleton; Gₘ restriction R×→K× misses π | Property distinguishes the wrong model; R09 concerns the written Checks. |
| 1.1 extension uniqueness and transport API | Identity marking; marking composed with [-1] | Restrict∘extend=id; transporting [-1] twice gives [1] | Correct; generic marking must be retained. |
| 1.2 marked finite-type model | Zero abelian variety; split rank-one torus | Spec R: one component, quasi-compact; lft torus: components indexed by Z, not quasi-compact | Correct distinction from finite-type open subgroup. |
| 1.3 extension | Good elliptic model; translation by a nonzero section P | Extension sends 0 to P; restriction recovers translation, not a homomorphism | Correct; no homomorphism hypothesis on generic maps. |
| 1.3 composition and inverse API | Markings id and [-1] on a good elliptic model | Canonical transition [-1]; reverse composite [1] | Correct; R09 asks for this concrete Check. |
| 1.4 unique marked isomorphism | Same model with markings id and [-1] | Marked comparison [-1], not id; exactly one compatible comparison | Correct. |
| 1.5 group law and homomorphisms | Zero abelian variety; multiplication [2] | Identity/product/inverse all unique on zero object; [2](P+Q)=2P+2Q | Correct; translation in preceding row fails preservation of 0. |
| 1.6 weak model and conversion | Blow up a smooth elliptic surface at (π,t), take smooth locus | Pullback centre along a section is a principal DVR ideal; centre on surface needs two generators | Sections lift; generic identity does not extend back from original model. Correct strict distinction. |
| 1.7 LocalExistence | Dimension 0; good elliptic; split I₅ | Models Spec R, abelian scheme, Néron model with five components; smooth-test restriction bijective | Correct signature; arbitrary DVR retained here. |
| 1.7 excellent construction versus arbitrary-DVR descent | Completion; zero abelian variety over an arbitrary DVR | Generic dimension 0; model Spec R before/after completion, component count 1 | The construction restriction does not restrict LocalExistence. |
| 1.8 abelian-scheme model and good reduction | Good elliptic versus Tate q=π⁵ | Proper model and Φ=0 versus toric identity and Φ=Z/5 | Correct; Weil extension is supplied by A1.8. |
| 1.9 DedekindExistence | Dimension-zero A over an integral Dedekind S | X=S; generic restriction on terminal Hom sets 1→1 | Correct; normality, dimension and Noetherian binders survive elaboration. |
| 1.10 étale/unramified base change | I₅; ramification indices 1 and 2 | At e=1 Φ=Z/5; at e=2 Φ=Z/10 | Étale assertion holds; full ramified analogue is false and not asserted. |
| 1.11 differential lattice and determinant | Dimensions 0,1; Tate curve | ω ranks 0,1; det(0)=R; Tate generator dz/z | Correct; no differential of a constant period parameter. |
| 2.1 identity component | Good elliptic; split I₅ | Identity fibre elliptic, respectively Gₘ; full special fibre has 1, respectively 5 components | Correct distinction between fibre and relative identity model. |
| 2.2 component group and rational count | Nonsplit I₄ and I₅ | Negation-fixed elements {0,2} and {0}; rational counts 2 and 1 | Correct; geometric counts are 4 and 5. |
| 2.3 Chevalley decomposition | Good, split multiplicative, additive elliptic over perfect residue field | (abelian,toric,unipotent) ranks (1,0,0),(0,1,0),(0,0,1) | Correct; perfect-field restriction retained for decomposition. |
| 2.4 toric characters | Gₘ; nonsplit one-dimensional torus; [3] | Lattices Z with action +1 or -1; pullback character map ×3 | Correct contravariance; SGA and Conrad locators read. |
| 2.5 isogeny components | E_q→E_(q³), ord(q)=2 | Z/2→Z/6 sends 0→0,1→3; kernel 0, cokernel Z/3 | Correct; no unjustified exactness of Néron functor. |
| 2.6 reduction filtration | Split I₅ over finite residue F₅ | E/E₀=Z/5; E₀/E₁=F₅×, order 4; formal kernel separate | Correct. |
| 2.7 minimal regular smooth locus | Split I₅; I₀* | Five multiplicity-one I₅ components meet smooth locus; central multiplicity-two I₀* component does not | Correct distinction between regular model and Néron model. |
| 2.8 Kodaira component groups | I₁,I₂,I₅,I₀*,II,III,IV | Φ=0,Z/2,Z/5,(Z/2)²,0,Z/2,Z/3 | Correct geometric groups; rational forms need Frobenius. |
| 2.9 wild elliptic comparison | Type III over Q₂ for y²=x³-x | v(Δ)=6, geometric m=2, conductor 5; tame value 3 for v(Δ) would fail | Wild term retained. |
| 3.1 semistability and henselization | Good, multiplicative, additive elliptic | Semiabelian flags true,true,false; Ga excluded | Correct definition; no global constant-rank torus assumed. |
| 3.2 isogeny invariance | [p] on good elliptic in characteristic p; Tate quotient | Both reductions remain semistable; [p] kernel scheme rank p², not p² geometric points | Correct inseparable scope. |
| 3.3 identity base change | I₅ under e=2; additive-to-good curve | Identity Gₘ→Gₘ; full Φ orders 5→10; additive Ga versus elliptic identity | Correct; semistability essential. |
| 3.3 open-immersion helper | H=Spec R[e]/(e²-e,πe) | Generic H has 1 point; special H has 2; πe=0 with e≠0 | Whole-scheme smoothness excludes source counterexample. |
| 3.4 Tate base change | n=5,e=2; n=1 | Component map r mod 5→2r mod 10, cokernel Z/2; at n=1 source component group 0 | Correct. |
| 3.5 finite-flat filtration | g=2,t=1,a=1; m=2 | Toric/finite/full scheme ranks 2,8,16; Tate ranks 1,3,4 away from residue prime | Correct t+2a finite rank. |
| 3.5 residue-prime control | μ₂ over F₂; ordinary/supersingular elliptic 2-torsion | μ₂ scheme rank 2, geometric points 1; elliptic rank 4, geometric points 2 or 1 | Correct scheme/point distinction. |
| 3.5 invariant finite torsion | Tate ord(q)=2, ℓ=2; ord(q)=1 | Geometric inertia-fixed 2-torsion orders 4 and 2; invariant Tate lattice rank 1 in both | Correct finite-level extra components. |
| 3.5 finite-part corank | Good abelian surface, g=2,t=0,a=2 | Finite Tate rank 4, corank 0; printed 2g−(2t+a)=2 | README has correct t+2a; source misprint recorded below. |
| 3.6 orthogonality | g=2,t=1,a=1 | Full Tate rank 4, finite rank 3, annihilator rank 1=t | Correct; interchanging t and a in finite rank fails generally. |
| 3.7 unipotence | n=5, N=[[0,5],[0,0]] | N(0,1)=(5,0), N²=0, N≠0; rank-zero N=0 | Correct exponent at most two. |
| 3.8 semistable Picard | Smooth elliptic; nodal rational curve; rational tree | Pic⁰=elliptic,Gₘ,0; toric ranks 0,1,0 | Correct over arbitrary residue fields via descent. |
| 3.9 Picard–Néron identity | Regular I₅ versus smooth elliptic | Pic⁰=N⁰; full N has Φ=Z/5 versus 0; unrestricted Pic has degree Z | Correct quotient/degree restriction. |
| 3.10 finite separable extension | Dimension-zero A over any DVR; finite separable degree d | A already good over extension degree 1; normalization rank d, finite without excellence | R02: do not exclude nonexcellent DVRs. |
| 3.10 Jacobian isogeny factor | Elliptic A; zero A | Take C=A, B=0, isogeny degree 1; zero case requires no Bertini curve | Correct; Poincaré reducibility supplier is over original field. |
| 3.11 monodromy criterion | Tate q=π⁵; good curve; ramified quadratic twist at odd residue characteristic | Unipotent nontrivial; identity; eigenvalue -1≠1, respectively | Criterion correct; remove extra excellence in R02. |
| 3.11 fixed-lattice proof control | U=[[1,2],[0,1]] and U² | Fixed Z₂ lattices both Z₂e₁; fixed points modulo 4 have sizes 8 and 16 | README correctly rejects equality of finite-level fixed torsion. |
| 3.12 full-level criterion | Level 2 quadratic twist; Tate q=t³ over C((t)), level 3 | -1≡1 mod 2 but not unipotent; Tate inertia matrix ≡I mod 3 and N≠0 | N≥3 essential; no good-reduction conclusion. |
| 3.13 extension classification | T=0; B=0; dual point P≠0 specializing to 0 | First two Ext groups trivial; class P gives nonsplit extension with split special fibre | Correct need for full dual sheaf rather than special fibre. |
| 3.13 Raynaud extension | Good curve; split Tate q=π⁵, including C((π)) | (T,B,G)=(0,A,A) or (Gₘ,0,Gₘ); completed identity sees no Z/5 components | Correct; all-characteristic source remains uncertified. |
| 3.14 polarized uniformization | Tate q=π⁵; polarization [3] | Y=Z→K× sends 1→q; valuation pairing [5], polarized form [15]>0 | Correct; rank-zero lattice gives good abelian case. |
| 4.1 normalization exact sequence | Rational one-node curve; rational tree; two components meeting twice | Node/vertex scalar quotient Gₘ,0,Gₘ; Jacobian factors all 0 | Exactness agrees with SGA IX12.3. |
| 4.2 boundary and cycle adapters | Edge v→w; loop | ∂e=δw-δv; loop boundary 0; reversing orientation negates column | Correct supplier sign. |
| 4.2 forest/rank/coefficient comparison | Empty graph; two isolated vertices; three parallel edges | (E,V,c,b₁)=(0,0,0,0),(0,2,2,0),(3,2,1,2); b₁+V=E+c | No connectedness or natural-subtraction mistake. |
| 4.2 binary cycles | Two parallel edges; triangle | Integral generators (1,-1),(1,1,1); mod 2 become (1,1),(1,1,1) | Correct coefficient reduction, not a simple-graph replacement. |
| 4.2 weighted form and Gram | Loop length 5; parallel lengths 2,3; three unit edges | Gram [5],[5],[[2,-1],[-1,2]], determinants 5,5,3 | Positive finite discriminants; zero-weight loop gives infinite Z cokernel. |
| 4.2 bipartite double | One loop; directed triangle cycle (1,1,1) | Double loop is one ordinary edge, H₁=0; triangle endpoint pushforwards each (1,1,1)≠0 | Correctly not identified with ordinary cycle space. |
| 4.2 HeckeFamily stability | Parallel edges and diag(1,2) | Cycle (1,-1) maps to (1,-2), total -1≠0 | Explicit stability required; arbitrary operator fails. |
| 4.2 adjoint-induced component map | Forms [2],[6], maps a=1,b=3 | 6xy=2x(3y); induced Z/2→Z/6 is ×3 | Correct dual-map direction. |
| 4.2 Matching | Equal-weight parallel-edge swap; loop weights 2 versus 3 | Cycle generator maps to -1 times itself; group orders 2 and 3 prohibit second matching | Correct; exceptional sets union under composition. |
| 4.3 integral pairing and adjoint | u(y,x)=y₁x₁+2y₁x₂+3y₂x₂ | u((1,0),(0,1))=2; transposed evaluation=0 | Correct nonsymmetric two-lattice direction. |
| 4.3 Weil versus period signs | n=5, v=(0,1); v=(2,3),w=(5,-7) | β=1,α=-1,Nv=(5,0); e(v,w)=-29, e(w,v)=29 | Positive period form, negative Weil-coordinate form. |
| 4.3 finite-flat obstruction | Valuation 5, levels 4,2,1 over residue F₂ | Period classes 1,1,0; Weil classes 3,1,0 | Correct; mod 2 alone cannot detect sign. |
| 4.3 valuation descent | Change π to uπ, u a unit | ord(uπ)=1+0=1; K×/(R×(K×)^m)=Z/m | Correct; no nonexistent algebraic period lattice over incomplete K asserted. |
| 4.4 graph monodromy and subdivision | Two nodes of thickness 2,3; resolution into five unit edges | Gram coefficient 2+3=5 before and 1+1+1+1+1=5 after | Correct thickness and regularity distinction. |
| 4.5 component cokernel | Forms [1],[5],diag(2,2),diag(1,4) | Cokernels 0,Z/5,(Z/2)²,Z/4; latter two both order 4 but not isomorphic | Correct group, not only determinant cardinality. |
| 4.6 obstruction/discriminant pairing | n=5, classes (1,1),(1,2) | Values 1/5,2/5 mod Z; replacing first class by +5 changes value by integer | Positive sign verified in Werner. |
| 4.6 perfectness and degeneracy | n=1; zero-rank lattices; rank-one zero map | First two groups 0, dual maps bijective; zero map has infinite cokernel and is excluded | Correct finite-cokernel hypotheses. |
| 4.7 intersection-matrix comparison | Cycle I₅; rational tree | Degree-zero intersection quotient Z/5; tree quotient 0 | Correct use of supplied numerical Picard group. |
| 4.8 one-node hyperelliptic construction | Squarefree binary quartic, g=1 | Normalization genus 1, pinch of two points adds δ=1, arithmetic genus 2 | Matches BGW; separability and characteristic ≠2 matter. |
| 4.9 generalized Jacobian | Split versus conjugate pair at infinity | Kernel Gₘ versus norm-one torus; dimensions 1+g in either case | Correct non-split form, not always Gₘ over base. |
| 4.10 two-torsion sequence | g=1, characteristic ≠2; characteristic 2 control | Orders Jm[2]=8, μ₂=2, J[2]=4; in characteristic 2 μ₂ has one geometric point | Correct restriction and exact sequence. |
| 4.11 odd-factor torsors | Rational branch point; two conjugate odd factors | Rational branch trivializes W; conjugate factors can trivialize W without an individual rational odd factor | Correct distinction between the two torsors. |
| 4.12 connecting class | W[2] trivial; arbitrary class a with zero input | a cup 0=0 and boundary a=0 when extension splits; boundary 0=0 | BGW/Poonen–Schaefer give the general identification, not Picard–Brauer obstruction. |
| 4.13 stable-family Picard | Smoothing xy=π² versus regular xy=π | Toric ranks special/generic 1/0 in both; first total space singular | Correct fibrewise semiabelian meaning; not a constant-rank global torus. |
| 4.14 specialization datum/laws | g=2,t=1,a=1; good reduction | Dimensions Tᵗ,T⁰,T =1,3,4; good case Tᵗ=Φ=0 and ker sp=T | Correct specialization kernel includes abelian part. |
| 4.14 finite invariants | Tate ord(q)=2 and 1 at ℓ=2 | T^I orders 4 and 2; T⁰ order 2; Φ[2] orders 2 and 1 | Correct exact sequence. |
| 4.14 Frobenius laws | Split Tate at q=5, ℓ=3, t_r=1 versus 0 | Factors (2,1) mod 3; t_r=0 would make Frobenius zero on nonzero toric part | Extra operator hypotheses are substantive. |
| 4.14 good-place and two-place laws | Two good places of an elliptic curve | Both graph lattices 0; shared T has dimension 2; both component maps 0 | Mathematics sound; R06 moves exports after 5.0. |
| 5.0a specialization | Good elliptic, ℓ=3,r=1,2; supersingular p=2 | Generic/special prime-to-p torsion sizes 9,81; p-torsion scheme rank 4 but special points 1 | Correct finite-étale hypothesis. |
| 5.0b Frobenius polynomial | y²=x³-x over F₅; dimension 0 | Point count 8, a=-2, P=X²+2X+5; X²P(5/X)=5P(X); dimension 0 P=1 | Correct arithmetic normalization; R07 fixes locator. |
| 5.0c Euler polynomial | Same F₅ elliptic curve; dual convention | 1+2T+5T² versus 1+(2/5)T+(1/5)T² on homological geometric Frobenius | Correct reciprocal and dual. |
| 5.1 Néron–Ogg–Shafarevich | Good elliptic; split Tate; q=8 at Q₂, level 3 | Full inertia trivial; infinite unipotent; mod-3 inertia trivial despite bad reduction | Whole Tate module essential; R02 restores arbitrary DVR scope. |
| 5.1a potential good reduction | Good curve; Tate curve; y²=x³-x over Q₂ | Inertia image trivial; infinite; finite nontrivial with integral j=1728 | Correct distinction finite versus trivial inertia. |
| 5.2 GoodIsogeny | Identity; [p] on good elliptic; Tate isogeny | Good flags (true,true),(true,true),(false,false); degree [p]=p² even inseparably | Correct theorem, statable with native carriers: R02–R03. |
| 5.3 period normalization transport | q=π⁵,e_K=2, further ramification e=2 | N_K=5,N_p=5/2,N_L=10; 10/4=5/2 | Correct transport; missing generic supplier contract R01. |
| 5.3 raw WD operations | q=5,N=[[0,1],[0,0]],F=diag(5,1) | FNF⁻¹=5N; diag(2,1) conjugates N to 2N | Required nonzero rescaling law; absent named supplier target. |
| 5.3 before/after semisimplification | F=[[1,1],[0,1]],N=0, inertia trivial | F≠I, (F-I)²=0; Frobenius semisimplification Fss=I | Raw input not an object of supplier's stated semisimple-only description: R01. |
| 5.3 cyclotomic period comparison | V=Q_p(1) | φ=p⁻¹σ; N=0; filtration jump -1; arithmetic WD Frobenius q | Correct opposite numerical Sen label +1. |
| 5.3 Raynaud filtered realization | Tate periods 5 and 30 over Q₅, log 5=0 | Both ord=1, full trace 6; log 5=0, log 30=log 6≡5 mod25 | Different Hodge lines; trace does not determine filtration. |
| 5.3 PadicComparison | Good elliptic; split Tate; zero A | Crystalline N=0; semistable N rank 1; zero module dimension 0 | Correct homological dual and full dimension 2g. |
| 5.3a elliptic conductor | Good; split multiplicative; additive with Swan δ | Invariant dimensions 2,1,0; conductor 0,1,2+δ | Correct all-prime conductor convention. |
| 5.3b minimal regular fibre | I₀*, nonsplit I₄ | Geometric m=5,4; Φ orders 4,4; rational nonsplit count 2 | Correct geometric component count; Liu locator mismatch R07. |
| 5.3c Euler characteristic | Smooth elliptic; I₅; I₀* reduced fibre | χ=0,5,6; I₅: 5·2-5=5; I₀*: 5·2-4=6 | Correct difference from number of components. |
| 5.3d determinant/perfectness | Complex [R --π→ R] in degrees -1,0 | det line R; generic acyclic trivialization coefficient π⁻¹; canonical section π | Existing supplier already gives construction: R04. |
| 5.3d discriminant order | Good elliptic; I₅; change integral basis by unit u | Orders 0,5; v(u)=0 so order unchanged; nonminimal scaling changes equation Δ by 12 | Correct curve-specific target retained. |
| 5.3e Ogg–Saito identity | I₅; I₀* tame; y²=x³-x over Q₂ | 5=1+5-1; 6=2+5-1; 6=5+2-1 | Wild contribution necessary; full Saito text not certified. |
| 5.3g values/bounds | Q₂ ramified quadratic twists with a(χ)=2,3 | f=2a(χ)=4,6; universal bound 8, not tame bound 2 | Correct arithmetic tests, source availability noted. |
| 5.3h residual conductor | 11a1 with v₁₁(Δ)=5; ℓ=5,3 | Local exponent 0,1; prime-to-ℓ global conductors 1,11 | Correct actual residual representation versus semisimplification. |
| 5.3i localPolynomial | Good F₅ elliptic; split/non-split multiplicative; additive | 1+2T+5T²; 1-T; 1+T; 1 | Matches pinned definition; infinite residue Nat.card=0 excluded. |
| 5.4 Artin conductor interface | Zero V; mixed g=2,t=1,a=1 | a(0)=0; codim invariants 4-3=1, Swan 0 | Correct. |
| 5.5 semistable conductor | g=0; good elliptic; Tate; g=2,t=2 | Conductors 0,0,1,2 equal toric ranks | Correct; no good-primes-only shortcut. |
| 5.6 bad Euler factor | Split/non-split Tate; g=2,t=1,a=1 | 1-T,1+T; mixed degree 2a+t=3, not 2g=4 | Correct invariant/coinvariant convention. |
| 5.7 residual conductor/component correction | Split I₅ at residual ℓ=5 and 3 | Φ[5] rank 1 gives conductor drop 1→0; Φ[3]=0 gives no drop | Correct dual component dependence. |
| 6.0 independence/specialization | Cover Y²=T at 2 and 1; P=Z₃ | Fibre groups C₂ and trivial; subgroup 3Z₃ has zero mod-3 image, Z₃ surjects | Full finite quotient needed; closed points need not be F-rational. |
| 6.1 monodromy adjoints | Forms [2],[6], f*=1, dual map=3 | 6xy=2x(3y); component map ×3 | Correct variance; no automatic self-adjointness. |
| 6.2 character exact sequence | Split extension Gₘ²→Gₘ; disconnected kernel control [2] | Z→Z²→Z exact for product projection; ×2:Z→Z has cokernel Z/2 | Connected-kernel condition substantive. |
| 6.3 differential base change | Semistable Tate under ramification e=2 | ω_R=R·dz/z, ω_R tensor R'=R'·dz/z=ω_R' | Correct despite component orders 5→10. |
| 6.4 isogeny differential index | [m] on elliptic curve, m unit and m=π | Pullback lattice mRω; cokernel lengths 0 and 1 | Correct injectivity and integral defect. |
| 6.4a connected Kummer | Tate connected model, m=2; additive G_a at p | Multiplicative special kernel μ₂ rank 2 versus generic elliptic rank 4; [p] on Ga=0 | Semiabelian surjectivity does not imply finite-flat total kernel. |
| 6.4b localization | Finite residue and connected group; I₅ component obstruction | H¹(k,N⁰_k)=0; component quotient Z/5 remains | Correct use of Lang; no assertion all local cohomology vanishes. |
| 6.4c isogeny defects | E_q→E_(q³), ord q=2; [2] on Φ=Z/4 | First cokernel Z/3; second kernel and cokernel each order 2 | Correct need for separate kernel and cokernel. |
| 6.4d quotient cotangents | Product B×C; [p] isogeny; q=2,e=1 | Product cotangent ranks dim C,dim B+dim C,dim B; [p] cokernel R/p; 1<1 false | Connected kernel and strict ramification bound retained. |
| 6.5 EquationGoodComparison | y²=x³-x at 5; singular reduction at 2 | Δ=64: unit at 5, nonunit at 2; smooth model/good flags true/false | Native Lean hypotheses agree with prose. |
| 6.6 multiplicative comparison | Split and nonsplit nodes; cusp | Tangent torus Gₘ or nonsplit form; cusp gives Ga, not torus | Correct split criterion and additive exclusion. |
| 6.7 minimal discriminant | I₅; type III at 2 | vΔ=f+m-1=5 and 6 | Consumes Ogg rather than a tame-only table. |
| 6.8 Tamagawa count | Split I₅; nonsplit I₄,I₅ | c=5,2,1; geometric Φ orders 5,4,5 | Correct rational count. |
| 6.9 minimal differential | x=π²x',y=π³y'; p≥5 | Pullback dx/(2y)=π⁻¹ dx'/(2y'); Δ multiplies by π¹² | Correct sign/direction; scaled nonminimal differential outside lattice. |
| 6.9 small-characteristic chart | Characteristic 2, y²+y=x³ | First denominator 2y+1=1; differential dx remains regular | No division by 2; alternate chart covers other cases. |
| 6.10 good abelian Frobenius | y²+y=x³ over F₂, including Q₂(√2) lift | Three points, trace 0, polynomial X²+2; zero B polynomial 1 | Étale/crystalline polynomial agreement has correct sign. |
| 6.10 semistable trace | q=2,d=1,δ=1,-1; d=2,δ=1 | Full traces 3,-3,5; determinants 2,2,4; ker N traces 1,-1,1 | Full trace differs from local Euler trace. |
| 6.10 trace descent | Geometric degree d=1,2 versus d=0 | Residue image d·Ẑ has index 1,2; degree 0 image {0} has infinite index | Correct positive-degree guard. |
| 6.10 purity and exterior powers | Elliptic H⁰,H¹,H²; q=1 control | Ranks 1,2,1, weights 0,1,2; H³=0; q=1 collapses weights | Geometric residue q≥2 essential; trace equality alone insufficient for N. |
| 6.11 ordinary semistability | Good ordinary elliptic; Tate; supersingular elliptic | Multiplicative p-divisible heights 1,1,0; supersingular excluded | Correct ordinary quotient condition. |
| 6.12 ordinary surface filtration | g=2,t=1 and t=2 | Toric, finite, total Tate ranks (1,3,4),(2,2,4); isotropic dimensions ≤2 | Correct mixed and totally toric cases. |
| 6.13 S₅(b) fixed vector | Centralizer of (12)(34)(56); intersection with point stabilizer; C₃ on F₂² | Orders 48 and 8; 2-group fixed-vector theorem applies to 8; C₃ has no nonzero fixed vector | Correct 2-group hypothesis; pinned theorem inspected. |
| 6.14 full-level curve extension | N=3,g=1; N=2 control; genus 0 | GL₂(F₃) order 48≤3⁴=81; level 2 does not force semistability; genus 0 handled separately | Correct finite-level bound and curve–Jacobian interface. |
| Gate and supplier direction | Five flagged suppliers; main versus open revision | Four mathematical suppliers have main files; fifth token is TauCeti library path; checker still reports 5 | R05 records the failing rule and false-positive evidence. |

## Not verifiable

The following limits are not silently converted into successful source checks. The review is finished with a needs-changes verdict; no source manifest or PR file was edited.

- **blr**, Bosch–Lütkebohmert–Raynaud, *Néron Models* (1990): source service resolves the Springer citation only to paywalled material and marks it uncertified. In particular §§1.2–1.4 and §9.4 cannot be certified from the primary text here. Conrad/Yuan provide some independently readable support, not access to BLR.
- **faltings-chai**, *Degeneration of Abelian Varieties* (1990), II §§1–3: service marks the Springer source uncertified. Raynaud's readable §4.2 does not by itself certify every equal-characteristic-zero assertion of §3.13.
- **silverman**, *Advanced Topics in the Arithmetic of Elliptic Curves* (1994), IV §§5–6, 8–9: service marks it uncertified. The numerical tests above are not a replacement for the general classification/completion theorem.
- **saito**, *Conductor, discriminant, and the Noether formula of arithmetic surfaces* (1988), Theorem 1: Project Euclid DOI landing page supplied no PDF; the attempted author-page file was not found. Thus the full general conductor–discriminant statement/proof in §§5.3d–e is not certified.
- **serre1987**, *Sur les représentations modulaires de degré 2*, §4.6 p.207: the source service found no legal text for the citation. Its residual-conductor source locator is not certified.
- **serre-tate**, *Good reduction of abelian varieties* (1968), Theorem 2 p.496 and corollaries: resolver led to JSTOR, without an established open PDF. The exact primary-source assertion about potential good reduction is not certified.
- **serre-topics**, *Topics in Galois Theory*, §3.2: resolver led to the Taylor & Francis book landing page, with no established open text. The independent supplier contract was checked, but this book locator was not.
- **milne-etale**, *Étale Cohomology* (1980), III §4: no legal text returned by the source service. The precise cited Euler-characteristic source remains unread.
- **yuan-zhang-erratum**, erratum to *On the averaged Colmez conjecture* (2023), introduction: Project Euclid supplied no PDF; the attempted Annals PDF URL returned not found. No assertion about its exact correction is certified.
- Other retrieved works outside the seeded sample were not all checked theorem by theorem. In particular, legal retrieval of the period-comparison and automorphy references is not a claim to have verified their complete proofs. The table records the mathematical instances actually tested; the supplier audit records the contracts actually read.

The six unresolved works after the three uncertified books are consolidated in the scratch missing-reference request using their existing IDs. Resolved Conrad and Knudsen–Mumford requests are not left outstanding. No paywall bypass or source reproduction was used.

## Source issues

- **Error** in conrad at Theorem 4.4, printed p.10: the source says smoothness of the identity component suffices for the generic-isomorphism open-immersion conclusion; it should be smoothness of the whole source group scheme; affects a stated result.
- **Misprint** in conrad immediately after Lemma 5.4, printed p.18, line 744: the source says the finite-part corank is 2g−(2t+a)=t; it should be 2g−(t+2a)=t in the semistable case; affects the proof.
- **Error** in conrad in the proof of Theorem 5.8, printed p.21, lines 878–890: the source says equality of fixed rational Tate spaces implies equality of every finite-level fixed torsion group; it should be equality of saturated fixed Tate lattices and their divisible subgroups, with finite component torsion treated separately; affects the proof.

These three source defects are already guarded against by the roadmap. For the first, Spec R[e]/(e²−e,πe) has smooth identity component but a nonflat vertical component. For the second, (g,t,a)=(2,0,2) gives corank 0, not 2. For the third, U=[[1,2],[0,1]] and U² have the same fixed Z₂ lattice but 8 and 16 fixed points modulo 4.
