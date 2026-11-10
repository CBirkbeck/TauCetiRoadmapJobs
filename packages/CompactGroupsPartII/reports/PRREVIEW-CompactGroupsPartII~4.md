# Review of CompactGroupsPartII (pull request #1047 at e899a9d)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/`
**Verdict:** needs changes

:robot: Independent AI review. Five findings, three blocking (P2). This is a full review of the unchanged head, not an incremental endorsement of the previous review.

**Previous findings, checked first.** Previous R01 is **not repaired**: `TauCetiRoadmap/RepresentationTheory/README.md:52–53` still says “global forms and representation rings”; lines 100–102 still attribute dominant-integral classification to the highest-weight roadmap. It is R04 below. Previous R02 is **not repaired**: the description's `roadmap-summary` block still says “the representation ring of a compact connected group with its restriction to a maximal torus”. It is R05 below. The author's later paragraphs acknowledge both discrepancies but do not repair the index or generated block. The earlier namespace and section-comment repairs remain present: `ContRepresentation.gramOperator` at the roadmap's line 161 and “Layer 4: characters of arbitrary products” at `Suggested.lean:139`. No supplied repair report marks these findings not actionable.

Unless another path is given, README locations below refer to `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/README.md`.

## R01 (P2) — Consume the categorical comparison already owned by the base roadmap

**Location.** README:299–307: “Construct the equivalence between finite-dimensional continuous complex actions and the full subcategory of `FDRep ℂ G` with continuous parameter maps.”

**Claim.** Section 0.1 makes the forgetful comparison, continuous/algebraic intertwiners, and irreducibility comparison new construction targets.

**Witness.** `TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md:149–153` already owns these comparisons. At the pin, `TauCeti/RepresentationTheory/Continuous/Intertwining.lean:69,111,118,155` supplies the Hom equivalence, identity/composition laws and equivalence comparison.

**Repair.** Delete the overlapping construction obligations from §0.1 and cite the base roadmap's “What is not consumable, and is a build item here” comparison targets in Scope and the supplier contracts. Cite `ContRepresentation.intertwiningMapEquiv`, its identity/composition laws, and `ContRepresentation.nonempty_equiv_iff`; cite `FDRep.ofShrink`, `FDRep.ofShrinkEquiv`, and `FDRep.character_ofShrink` in `TauCeti/RepresentationTheory/FDRep/Basic.lean:314,320,343`. If a tensor/dual coherence extension remains, specify only that additional comparison and its difference from the base contract. The existing witness is preserved: on trivial ℂ the native Hom map sends 2I and 3I to themselves and their composite to 6I, and shrinking preserves the C₃ character value ω. There is no need to reconstruct those maps.

## R02 (P2) — Import the Hilbert-basis countability criterion from its owner on main

**Location.** README:617–621: “build the Hilbert-basis countability bridge here: a complex Hilbert space with a Hilbert basis indexed by I is separable iff I is countable.”

**Claim.** Section 3.1 owns the general Hilbert-space criterion; Scope:72–73 expressly avoids a BanachSpaceTheory supplier.

**Witness.** `TauCetiRoadmap/BanachSpaceTheory/README.md:840–843`, on main, already requires the same iff for complete real or complex inner-product spaces, with the same separated-unit-vector and finite-sum proof.

**Repair.** Cite BanachSpaceTheory B5 in Scope, the supplier contracts and §3.1's Needs; delete the general criterion as a local construction. Keep the compact-group Peter–Weyl application, countability of its block index and the product-group examples here. This uses an owner already on main. The imported criterion gives separable = countable = true for the empty basis and for ℓ²(ℕ), and both false for ℓ²(J) with uncountable J; distinct coordinate vectors still have squared distance 2. The replacement supplies exactly the generality consumed here.

## R03 (P2) — Resolve the compact cocharacter theorem removed by the open supplier revision

**Location.** README:1006–1008: “LieHighestWeight Layer 10: for a simply connected compact semisimple group the cocharacter lattice of a maximal torus is the coroot lattice Q∨.”

**Claim.** The equality Y = Q∨ is supplied, so the character/weight-lattice bijection at lines 1034–1039 needs no local proof.

**Witness.** Open #1797, `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:107–123`, explicitly excludes the compact-group theorem including Y = Q∨; Layer 10:1483–1609 retains algebraic affine geometry, without a replacement compact-period owner.

**Repair.** Resolve that dropped contract before relying on it: retain it with an identified owner in the supplier revision, or move its compact-group proof to §6.5 and update the supplier references at lines 46–48, 274–277, 1006–1008 and 1034–1039. The latter proof can integrate the pinned fundamental highest-weight modules on the supplied simply connected compact group, restrict their top lines to the torus, and use ConvexityToric T1: every y in Y pairs integrally with the fundamental weights, so Y is contained in their integral dual Q∨; T1's coroot circles give the reverse inclusion. This is the route in Knapp2021 Theorem 5.107, p.334, line 14142. Test the hypothesis: for SU(2), in units H = diag(i,−i), Y = Q∨ = ℤH; for SO(3), Y = (1/2)ℤH strictly contains Q∨. Do not replace the missing contract by an unrestricted algebraic root-datum identification.

Main still contains the consumed theorem at `LieHighestWeight/README.md:1705–1714`, and #1220 retains it at lines 2763–2772. This is prospective supplier drift under the brief's open-revision rule, not a claim that it is absent on main. The description's sentence “if #1797 merges first, §6.5 has to state it or cite its new owner” identifies the problem but does not settle it. The overlap tool's empty dropped-id list misses this content deletion under a surviving Layer 10 number.

## R04 (P3) — Correct the family index's scope and supplier descriptions

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md:52–53`: “global forms and representation rings”; lines 100–102: “the highest-weight roadmap's dominant integral classification”.

**Claim.** These describe this roadmap and the inputs to its global-form layer.

**Witness.** The roadmap's README:56–61 excludes construction of a representation ring; lines 270–279 use ConvexityToric T1, a compact cocharacter comparison, pinned highest-weight declarations, and OperatorIdeals Part C.

**Repair.** Replace “representation rings” with “their formal characters”. Rewrite the supplier line to name LieGroups' compact structure, tori and covers, ConvexityToric's period dictionary, the pinned semisimple highest-weight theory and OperatorIdeals' Hilbert–Schmidt theory; name the final owner of Y = Q∨ after R03 is resolved. This matches the actual carriers: §6.7 constructs a basis of ℤ[X]^W, whereas TopologicalKTheory T6 owns R(G). Previous R01 remains outstanding.

## R05 (P3) — Regenerate the stale roadmap-summary block

**Location.** PR description, generated block `roadmap-summary`: “the representation ring of a compact connected group with its restriction to a maximal torus”; “the highest-weight roadmap's dominant integral classification”.

**Claim.** The generated summary says these are the roadmap's scope and supplier route.

**Witness.** README:56–61 builds no Grothendieck ring; §§6.5–6.7 instead construct finite-cover descent, dominant-character classification and a basis of Weyl-invariant formal characters. README:274–277 takes semisimple highest-weight theory from pinned declarations.

**Repair.** Regenerate `roadmap-summary` to describe those three results and their actual suppliers, incorporating the resolution of R03. Preserve the correct author-written distinction between formal characters and TopologicalKTheory's representation ring. Check that the block and the author's scope paragraph describe the same carrier and source of highest-weight classification. Previous R02 remains outstanding.

## Verified sound

**Scope and mechanical checks.** Read all 1,425 README lines and all 273 Lean lines, plus the changed family-index entries. Read the repository's Writing a roadmap checklist and CONTRIBUTING, and compared the main CompactGroups, ConvexityToric and OperatorIdeals roadmaps. The head and both library checkouts match their pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Git's change list contains only the two reviewed files and the authorized family index. The worktree was clean before and after this review. No PR file or source manifest was changed.

The worker's gate at this exact head passes every check, including statement hygiene, imports, source-material scanning, dependencies and the targeted build (`build=0`). There are no gate failures to report. Independently ran the requested candidate-order dependency check:

```text
depcheck: 228 roadmaps, 2122 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. This checks the declared graph; it does not detect the duplicate ownership or prospective supplier deletion in R01–R03. Each Needs line was also read: no smooth-vector or locally convex result is used to prove the Banach density theorem, and TopologicalKTheory's representation ring is not an input to formal-character descent.

**Lean and padding.** Direct `lake env lean` elaboration succeeded with exactly 13 `sorry` warnings and no other diagnostics. A scratch copy with `#check @name` for each declaration produced all 16 signatures. The 13 theorem signatures retain the hypotheses their statements need: compactness/Hausdorffness where used, complete Banach coefficients and orbit continuity for density, Borel measure for L², and continuity/unitarity for the SU(2) actions. `compactCharacter` retains only CommGroup and TopologicalSpace: its actual body simply composes a native continuous circle character with inclusion into ℂ, so the omitted compactness, Hausdorffness and topological-group binders are unnecessary. The two G-finite definitions retain their field-general, topology-free binders. No signature repair is needed.

For each of the 13 admitted theorems, a scratch copy tried `simp`, `rfl`, `infer_instance`, and `exact?` restricted to closing the goal, then fell back to `sorry`. It finished with zero errors and 13 `sorry` warnings; extra unused/unreachable-tactic warnings belong only to that probe. No target closed. Reading the near-match candidates also found no one-lemma proof of a headline: scalar Schur does not itself give the unique positive real scalar, and Mathlib's circle/finite-torus Fourier bases do not give the arbitrary compact-abelian basis. No padding finding is supported.

**Headline coverage.** The README's major conclusions are invariant-metric classification (§§1.2–1.3), Banach G-finite density (§2.1), the four-way countability criterion (§3.1), finite-coordinate/product duality (§4.1), the scalar-character classification and Fourier basis/density (§5.1), dominant-character classification and the Weyl-invariant formal-character basis (§§6.5–6.7), genuine U(2) weight recognition (§6.9), and SU(2) multiplicity/faithfulness classification and realization (§7.1). Thirteen signatures cover the statable scalar, Banach, countability, product, Fourier, U(2) and SU(2) conclusions. The docstring names the missing unitary isotypic tensor decomposition, general continuous-kernel operator and compact-root/positive-system/central-cover/formal-character constructions. These are substantial constructions rather than free predicates. The finite-support functions in the U(2) and SU(2) signatures are tied to traces of actual representations, not arbitrary algebraic substitutes.

**Source sample, freshly checked.** There are 15 requested sampled targets. Thirteen are supported by explicit native/supplier deductions and/or readable source passages; §§4.1 and 5.1 have unreadable Conway locators, while their proposed deductions were checked independently. All 15 appear individually in this table. No README locator is marked unverified; Conway alone is marked uncertified. Fetches used the sources service without a manifest argument, so no manifest was edited.

| Sampled target | Text opened at its locator, hypotheses and outcome |
| --- | --- |
| §0.1 finite-dimensional comparison | Mathlib `Topology/Algebra/Module/FiniteDimension.lean:287` gives continuity for finite-dimensional Hausdorff domain over a complete nontrivially normed field. ℂ satisfies this. The stronger existing Tau Ceti comparison is R01. |
| §0.2 continuous kernels | OperatorIdeals Part C:530–563 gives arbitrary-index ℓ² columns, reconstruction and norm/energy identities; Tau Ceti `HilbertSchmidt/Basic.lean:88` and `Columns.lean:105,138` give the native carriers. Finite regular μ and uniform finite-rank-kernel approximation justify the claimed extension without separability. This is explicitly a deduction, not an attributed textbook theorem. |
| §1.1 Gram forms | Mathlib `Analysis/InnerProductSpace/Dual.lean:67,136` gives conjugate-linear Riesz duality; the adjoint equations give the self-adjoint comparison. Finite dimension supplies continuity/completeness. The roadmap correctly places T in the second inner-product slot. |
| §1.2 scalar metrics | Knapp2021 Proposition 4.8 and Corollary 4.9, printed p.240, lines 10109–10120: finite-dimensional complex irreducibles and scalar commutant. The eigenvalue proof uses no compactness. Real positivity and uniqueness are deductions using a nonzero vector. |
| §1.3 multiplicity metrics | Same Knapp2021 locator: zero Homs between inequivalent irreducibles and scalar diagonal Homs give matrix multiplicity blocks. The chosen unitary decomposition is essential for the adjoint and positive-definite comparisons. |
| §2.1 Banach density | Opened native integrated-action definition/formula, bound, left covariance and net convergence at `Continuous/Integrated/Basic.lean:144,181,191,211,437`, plus `Compact/RepresentativeDensity.lean:139`. They allow strong continuity and arbitrary compact Hausdorff groups. The ε/2 approximation argument adds exactly finite orbit span. |
| §3.1 countability | Etingof2024 §37.1, printed p.199, lines 5–12, and Theorem 37.5, p.202, lines 150–157, explicitly assume a countable base. The README accurately limits that citation and derives the converse from general Peter–Weyl separation. General Hilbert-basis ownership is R02. |
| §4.1 product characters | Conway1990 VII.9 Exercise 11 is uncertified. Native small-arc/no-small-subgroup and compact-dual-discreteness arguments support the proposed proof, including nonabelian factors in the finite-coordinate lemma. |
| §5.1 compact abelian Fourier | Conway1990 VII.9 Exercises 8–10 are uncertified. Native dimension-one irreducibility, general Peter–Weyl and inverse-character reindexing supply the route; the coefficient sign was recomputed. |
| §6.1 torus weights | Deduction from §5.1 and native complete reducibility; Knapp2021 Lemma 5.106, p.334, lines 14135–14141 also confirms decomposition into actual torus characters. The natural coefficients are weight-space dimensions and recover trace multiplicities. |
| §6.3 real complexification | `TauCeti/Geometry/Hodge/Conjugation.lean:106,118,137` gives conjugation, its pure-tensor value and the conjugate-eigenvalue comparison. Taking simultaneous eigenspaces sends χ to χ⁻¹ because values lie on the circle. |
| §6.4 left Weyl action | The quotient action is an explicit deduction from conjugation and abelianness of T; LieGroups Layer 6 supplies the geometric/root Weyl comparison. The inverse in χ(n⁻¹tn) gives the stated left action. |
| §6.5 cover and dominance | Knapp2021 Theorem 4.29, pp.250–251, lines 10549–10581 proves the closed commuting product. Proposition 4.58, pp.264–265, lines 11115–11136 gives analytic integrality; Proposition 4.59, p.265, lines 11137–11149 gives the coroot pairing. Theorem 5.107, p.334, lines 14142–14152 covers simply connected semisimple groups. Theorem 5.110's proof, p.336, lines 14228–14247 uses the universal cover ℝ^r × K_der,sc; period descent first quotients the central ℝ^r to Z(K)^0, yielding the roadmap's finite cover. R03 concerns ownership, not truth. |
| §6.7 restriction | Knapp2021 Theorem 5.110, pp.335–336, lines 14203–14227 supplies classification, not by itself the integral-basis assertion. The README additionally uses the pinned orbit-sum expansion; its leading coefficient is 1 and lower dominant weights form a finite set. This supports the stated unitriangular deduction. |
| §6.9 U(2) recognition | Knapp2021 Theorem 5.110 at the same locator supplies exhaustion; native `SU2/Weight.lean:134` gives strings with weights 2i−d. Central exponent a+b and highest weight a−b descend because their difference is 2b. Telescoping gives exactly the two stated conditions, including negative determinant powers and zero dimension. |

**Pinned declarations and duplication audit.** Searched by objects in Mathlib, Tau Ceti, roadmaps on main, board packages, and the available open heads, using both `rg` and `roadmaps grep/show`. The native audit searched 75 backticked supplier names; the material matches listed below were opened at their pins rather than accepted by spelling alone. The following opened declarations fix the material inputs (paths below are paths within the named library, not newer online versions):

| Pin and file | Declarations read and relevant boundary |
| --- | --- |
| Mathlib `RepresentationTheory/Continuous/Basic.lean:55,81`; `RepresentationTheory/Irreducible.lean:29,91` | `ContRepresentation` has `toMonoidHom : G →* (V →L[R] V)` and no parameter continuity. `ContIntertwiningMap` carries the commuting equation. `IsIrreducible` is `IsSimpleOrder`; the commutative, algebraically closed finite-dimensional case has dimension 1. |
| Mathlib `Analysis/InnerProductSpace/l2Space.lean:376`; `MeasureTheory/Function/ContinuousMapDense.lean:366`; `Topology/Algebra/InfiniteSum/ENNReal.lean:568` | `HilbertBasis.repr` is a linear isometry equivalence to ℓ²; `ContinuousMap.toLp_denseRange` needs finite weakly regular measure and p ≠ ∞; `Summable.countable_support_ennreal` takes finite extended total mass. |
| Mathlib `Topology/Algebra/PontryaginDual.lean:40,87` | Dual = continuous homomorphisms to Circle; compact domain gives discrete dual. The file does not provide arbitrary-product duality. |
| Mathlib `Analysis/Fourier/AddCircle.lean:244,410`; `AddCircleMulti.lean:46,133,270` | `span_fourier_closure_eq_top`, `fourierBasis`, `mFourierSubalgebra_closure_eq_top`, `mFourierBasis`: circle or finite torus, not arbitrary compact abelian groups. These near-matches do not duplicate §5.1. |
| Tau Ceti `RepresentationTheory/Continuous/Intertwining.lean:69,111,118,155`; `FDRep/Basic.lean:314,320,343` | The actual forgetful/restoration maps and character-preserving object transport: R01. |
| Tau Ceti `RepresentationTheory/Compact/Haar.lean:93,97,114`; `Compact/Unitarizable.lean:122,241`; `Compact/UnitaryModel.lean:88` | `haarProb`, normalization, mass 1; `gramOperator`, `isUnitarizable`, `exists_isUnitary_congr`. Gram averaging even works on complete Hilbert spaces; the roadmap consumes the finite-dimensional case. |
| Tau Ceti `RepresentationTheory/Continuous/OrthogonalDecomposition.lean:192`; `Continuous/Schur.lean:86`; `Continuous/Unitary/Equivalence.lean:51` | Orthogonal irreducible decomposition; scalar Schur; isometric equivalence for finite-dimensional irreducible source. §7.1 separately constructs the general polar-factor comparison rather than applying the irreducible theorem to a reducible action. |
| Tau Ceti `RepresentationTheory/Compact/SchurOrthogonality.lean:104,122`; `Compact/MatrixCoefficient.lean:72`; `Compact/PeterWeyl.lean:137,214,670,677,713,723` | Unit irreducible hypotheses; matrix-coefficient L² representatives; native models, skeleton, quotient classes, chosen models and identified basis. No countability or separability restriction. |
| Tau Ceti `RepresentationTheory/Compact/Character/Basis.lean:186,347,357`; `Compact/FourierPeterWeyl.lean:123,147`; `Analysis/Fourier/AddCircle.lean:364` | Character basis is on central L²; inverse-map comparison and the −n coefficient index are explicit. `fourierPontryaginDualEquiv` is on the additive circle with multiplicative tag, transported to Circle through `AddCircle.homeomorphCircle`. |
| Tau Ceti `RepresentationTheory/Compact/FrobeniusSchur/InvariantForm.lean:132,145`; `StructureMap.lean:132` | The ±1 form/structure-map results require unitary irreducibility; these are supplier facts, not reconstruction targets here. |
| Tau Ceti `Geometry/Lie/Subgroup/Torus.lean:82,88,241`; `Subgroup/Weyl/Finite.lean:194` | `IsTorus` has compactness, connectedness, commutativity; `IsMaximalTorus` is maximality. No Lie structure or closedness field is silently supplied by these definitions. The finite-dimensional Lie context supplies the circle product and finite normalizer quotient. |
| Tau Ceti `Algebra/Lie/Weights/WeightLattice.lean:188`; `Integrality.lean:202`; `HighestWeight/Basic.lean:286`; `Verma.lean:525`; `FiniteDimensional.lean:136`; `Existence.lean:234` | Integral weights, coroot integrality, natural simple-coroot values, actual irreducible quotient and finite-dimensional existence/classification. Apply to the complexified derived Killing algebra, not all of gl₂. |
| Tau Ceti `Algebra/Lie/Weights/FormalCharacter.lean:151,451,498`; `HighestWeight/OrbitSum.lean:89` | Lie-algebra formal character, tensor identity, Weyl invariance, leading orbit sum plus lower terms. These are distinct from the actual torus-character carrier and descent comparison of Layer 6. |
| Tau Ceti `RepresentationTheory/SU2/TorusConjugacy.lean:153`; `SU2/Weight.lean:134`; `SU2/Exhaustion.lean:97,298` | Torus conjugacy, weights 2i−d, standard symmetric-power model and unique irreducible exhaustion. The monomial model is not silently treated as unitary. |

**Resolved roadmap ownership.** Main citations were rechecked against main `8101f2c`. `roadmaps resolve` reports no cross-roadmap citation found nowhere; its output explicitly says it did not check library names on that service host, so the local pinned audit above supplies that evidence. The overlap list reports no competing edit to this folder and no dropped numbered identifier; R03 records the manually verified content-level exception.

| Cited roadmap/section | File and lines checked; ownership outcome |
| --- | --- |
| CompactGroups, Layers 0–6 and engine | `TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md:149–153,214–268,320–334` and engine targets: native analytic/SU(2) inputs are consumed; §0.1 comparison overlap is R01. |
| OperatorIdeals Part C | `TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md:530–585`: generic Hilbert–Schmidt columns and compactness. §0.2 adds the integral-kernel norm and adjoint comparison. |
| LieGroups Layers 0, 2–5, 5A, 6, 7 | `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:252–299,356–463,641–672,750–786,883–890`: exponential, smoothness, differentiation/integration/covers, compact splitting, real roots and compact semisimple integration. No group complexification or Borel–Weil input is needed here. |
| ConvexityToric T1 | `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:32–51`: 2π periods, actual characters, coroot-circle calibration and finite-index isogeny comparison. The U(2) coupling agrees. |
| LieHighestWeight Layers 7, 9, 10 | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:931,1432,1705–1714`: algebraic centers/reductive comparison are excluded owners, while the compact Y = Q∨ theorem is an input. Checked #1220:2763–2772 and #1797:107–123,1483–1609; R03 records the removed input. |
| BanachSpaceTheory B5 | `TauCetiRoadmap/BanachSpaceTheory/README.md:800–860`: main already owns the general Hilbert countability bridge; R02. |
| Completed/OrthogonalL2Bases Part B; CharacterTheory Layers 0–4 | `Completed/OrthogonalL2Bases/README.md:64–111` and Part B; `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:26–52` and Layers 0–4: generic weighted basis assembly and finite-group character theory are excluded owners. |
| CharacteristicClasses C5.1; TopologicalKTheory T6 | `TauCetiRoadmap/CharacteristicClasses/README.md:1344–1362`; `TauCetiRoadmap/TopologicalKTheory/README.md:1202–1240`: invariant polynomial restriction and representation-ring construction remain with those owners. T6's Banach density gap matches the theorem here. |
| AutomorphicFormsOnReductiveGroups §§2.1,2.7, open #1037 | `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:54,302–325,488` onward: topology-free/Banach inputs are requested, locally convex and complex smooth-topology extensions owned there. No duplicate Banach construction. |
| SmoothBanachRepresentations §4.1, open #1145 | `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/README.md:319–342`: real smooth-topology comparison consumes complex density and complexification; not a supplier to generic Banach density. |
| NoncompactQuantumSymmetry, open #1015 | `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:129–156,193–194`: native compact theory and the Banach gap are inputs; arbitrary-Hilbert decomposition/smooth-domain work is different. No shared ownership of the finite-dimensional metric or product-dual targets found. |

**Adversarial mathematics.** The rows below were recomputed for this review, not copied as certification from the previous report. They cover all numbered target sections, their defining maps/conventions and principal API assertions, the 13 Lean headlines and every mathematical target touched by a finding. Finite examples test the formulas and hypotheses; the source and proof-route audits above address generality. “Keep” requests no change; ownership changes refer to the numbered findings.

| Statement | Instances tried | Computed values on the two sides / negative control | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: irreducibility | trivial action on 0, ℂ, ℂ² | subspace lattice sizes 1, 2, more than 2; irreducible = false, true, false | nonzero condition retained | Keep |
| Conventions: coefficient versus trace | scalar i on ℂ; S₃ rotation by 2π/3 | ⟨i,1⟩ = −i versus trace i; rotation coefficient at e₁ = −1/2 versus identity 1; zero vector gives 0 | sign fixed | Keep |
| Conventions: permutation matrices | σ=(12), τ=(23) | nσnτ e₁=e₂; nτnσ e₁=e₃; inverse conjugation gives diagonal entry tσ(j) | right-to-left convention consistent | Keep |
| §0.1 Hom equivalence, identities and composition | trivial ℂ; maps 2I,3I | forget/restore(2I)=2I; composite =6I on both sides; id=I | correct existing object | R01: consume |
| §0.1 characters, tensor and dual | C₃ scalar ω; zero space | tensor trace ω²; dual trace ω⁻¹=ω²; original trace ω; zero trace 0 | comparisons distinguish dual | R01: retain only additional coherence |
| §0.2 kernel energy and norm | two points, mass 1/2 each, k=1 | operator is averaging projection; energy 1; kernel integral 4/4=1 | equal | Keep |
| §0.2 adjoint and linearity | k₁₂=i only; scale by 2 | A₁₂=i/2; A†₂₁=−i/2; energy=1/4=kernel L²²; scaled energy=1 | adjoint differs from transpose | Keep |
| §0.2 a.e. kernel and zero measure | μ=0, k=1; k=0 | A=0, energy=0, integral=0 in both cases; k=1 is not zero as continuous function | no unjustified injectivity | Keep |
| §0.2 convolution specialization | C₂ probability, f=1; f=indicator(identity) | A is averaging, energy=1=‖f‖₂²; for indicator A=I/2, energy=2/4=1/2 | normalization correct | Keep |
| Layer 0 supplied normalization examples | C₃; SU(2) constant integrand | diagonal character pairing 1; off-diagonal (1+ω+ω²)/3=0; (1/(2π))·4·(π/2)=1 | equal | Keep |
| §1.1 Gram representation and real linearity | T=2I on ℂ; T+I | h(1,i)=2i; h(1,1)=2; (T+I) gives 3i=2i+i; multiplying T by i destroys self-adjointness | real-linear domain appropriate | Keep |
| §1.1 strict positivity iff | T=0,2I; zero space | at 1: 0 fails >0; 2 passes; on 0 both form positivity and operator condition are vacuous | both directions agree | Keep |
| §1.1 invariance iff commutation | diag(1,2); trivial and axis-swap action | trivial commutator 0; swap gives h(e₂,e₂)=2 versus h(e₁,e₁)=1 and nonzero commutator | unitarity and invariance distinguished | Keep |
| §1.2 positive scalar headline | irreducible ℂ, T=2I; trivial ℂ²; 0 | unique c=2; diag(1,2) is nonscalar but reducible; all scalars agree on 0 but irreducibility fails | headline true on tests | Keep |
| §1.2 metric isometry and inverse | h₂=4h₁ | map I/2 gives h₂(v/2,v/2)=h₁(v,v); inverse 2I; map 2I would give 16h₁ | direction correct | Keep |
| §1.2 nonunitary transport | C₂ involution [[1,1],[0,−1]] | averaged Gram =[[1,1/2],[1/2,3/2]]; π†Tπ=T; π†π differs from I | chosen unitarization is needed | Keep |
| §1.3 commutant blocks and multiplication | two copies of one irreducible; inequivalent C₂ signs | multiplicity algebra M₂(ℂ); E₁₂E₂₁=E₁₁, reverse E₂₂; between opposite signs 2f=0 forces f=0 | matrix rather than scalar freedom | Keep |
| §1.3 positivity and inversion | A=diag(1,2); empty decomposition | positive eigenvalues 1,2; inverse diag(1,1/2); empty product/form has one value | zero case consistent | Keep |
| §1.3 coordinate change and adjoint | U=diag(1,i), A=[[1,1],[1,2]] | UAU†=[[1,−i],[i,2]]; opposite U†AU=[[1,i],[−i,2]]; det=1, trace=3; E₁₂†=E₂₁ | orientation fixed | Keep |
| Layer 1 finite Haar average | C₃ trivial action | normalized sum h versus unnormalized 3h; |C₃|=3≠0 | factor necessary | Keep |
| §2.1 IsGFinite definition | 0; nonzero trivial vector over 𝔽₂; two circle modes; ℤ shift | orbit-span dimensions 0,1,2,∞ respectively | positive and negative examples | Keep |
| §2.1 submodule API and equivariant map | v in mode 0, w in mode 1; zero equivariant map | dim span(v+w)=2≤1+1; 0·v has dimension 0; image under zero map has dimension 0≤2; translating preserves dimensions | inclusions and invariance correct | Keep |
| §2.1 Banach density headline | 0; rotations on C(S¹); ℤ on ℓ²(ℤ) | zero closure=0; character polynomials dense; every nonidentity rotation has ‖R−I‖=2; shift δ₀ has infinite span outside compact hypothesis | strong continuity not norm continuity | Keep |
| §2.1 integrated covariance | S₃, f=6δ_(23), h=(12) | Tf=π(23); π(h)Tf=π(123); reverse order gives π(132) | nonabelian order correct | Keep |
| §2.1 mass and error estimate | trivial action; v≠0; Cπ=2, ‖v‖=3 | mass 1 gives v, mass 2 gives 2v; δ=ε/12 gives Cπδ‖v‖=ε/2; plus ε/2 totals ε | normalization and denominator valid | Keep |
| §2.1 compact-set convergence/naturality | Q={v,w}; intertwiner 2I | eventual maximum of two errors <ε; 2I(Tf v)=Tf(2v)=2Tf v; finite-net error ≤Cδ+δ+point error | finite-net refinement valid | Keep |
| §3.1 general Hilbert countability iff | empty basis; ℕ; uncountable J | separable/countable = true/true, true/true, false/false; distinct vectors have distance²=2 | correct but owned elsewhere | R02: consume B5 |
| §3.1 two Lean headlines and metrization | trivial G; C₃; Circle^J uncountable | dual sizes 1,3,uncountable; L² separable true,true,false; second countability and metrizability same truth values | both directions consistent | Keep |
| §3.1 Borel versus cylinder σ-algebra | empty J; Circle²; uncountable J | empty product has 2 measurable sets; arc cylinder measurable; complement of identity depends on all J, versus ≤ℵ₀ coordinates for cylinder-measurable sets | full Borel convention necessary | Keep |
| §3.1 per-vector support | one coordinate character; ℓ² sequence 2^−(n+1) | support size 1; infinite countable support with sum of squares 1/3; no uncountable positive summands of finite sum | no global separability inference | Keep |
| §4.1 finite-coordinate factorization | empty product; Circle² exponents (1,−1); S₃×C₃ | 1=empty product; at (i,−1), −i= i·(−1)⁻¹; at ((12),generator), −ω=−1·ω | nonabelian factors allowed | Keep |
| §4.1 direct sum equivalence/inverses | coordinate exponents (1,−1) | restrictions recover 1 and −1; reconstruction gives −i; zero family evaluates 1; swapping factors swaps labels | generator equation determines map | Keep |
| §4.1 uniqueness of circle multi-index | integer n=−1 versus 1 at i | i^−1=−i differs from i; all-zero indices give 1; coordinate restriction detects every nonzero exponent | negative powers/empty support covered | Keep |
| §4.1 topology distinction | coordinate χn on Circle^ℕ | each fixed-coordinate restriction eventually 1; χn(constant −1)=−1 for every n; discrete-dual distance from identity never becomes 0 | three topologies distinguished | Keep |
| §5.1 scalar-class bijection | C₃ scalars 1,ω,ω²; zero and trivial ℂ² | three 1-dimensional classes with those scalar values; dimensions 0 and 2 fail irreducibility | actual action pins equivalence | Keep |
| §5.1 compactCharacter API | χ(i)=i, ψ=χ⁻¹ | cχcψ(i)=i(−i)=1=c1(i); conjugate cχ(i)=−i=cχ⁻¹(i) | native inclusion/multiplication correct | Keep |
| §5.1 uniform density headline | trivial group; C₃ | span dimension 1=C(G) dimension 1; C₃ character matrix rank 3=C(G) dimension 3 | finite tests pass | Keep |
| §5.1 Fourier basis headline and sign | Circle at i; C₃ | χ scalar coefficient −i but Fourier vector i; coefficient model χ⁻¹ gives i; C₃ off-diagonal pairing 0, diagonal 1 | exact vectors normalized | Keep |
| §5.1 Fourier coordinates/Parseval/L² expansion | f=cχ+2cψ, χ≠ψ; f=0 | coordinates 1,2; norm²=1+4=5; zero support/norm 0; reconstruction cχ+2cψ=f | no pointwise convergence used | Keep |
| §6.1 weight spaces and finite decomposition | Circle z⁻¹; trivial ℂ²; 0 | weights −1 with dim1; 0 with dim2; empty; direct-sum dimensions 1,2,0 | actual torus weights | Keep |
| §6.1 formal-character API and realization | χ⊕χ⁻¹; χ⊗χ⁻¹; −e⁰ | at i trace i−i=0, ch=t+t⁻¹; tensor ch=1 and trace1; −e⁰ cannot have dimension −1 | both realization directions | Keep |
| §6.1 trace uniqueness | C₃ Fourier coefficient of χ in χ+2χ² | pairings yield 1 and 2 using 1+ω+ω²=0; hence multiplicities uniquely 1,2 | orthogonality identifies coefficients | Keep |
| §6.2 period map and integrality iff | Circle χ=zⁿ; half-integer functional | ℓχ(2π)=2πn, exp(iℓχ(2π))=1; half functional gives exp(iπ)=−1 | period condition excludes wrong model | Keep |
| §6.2 rank, sign and additivity | rank0; Circle² (1,−1); n=−1 at π/2 | X=0; character value −i; λ=iℓ gives −i versus exp(−π/2) if i omitted; χmχn gives m+n | normalization agrees with T1 | Keep |
| §6.3 conjugation and opposite weights | real rotation plane, v=e₁−ie₂, angle π/2 | Rv=iv; Rcv=−i cv; c(iv)=−i cv; c²v=v; both weight dimensions1 | semilinearity and inverse label correct | Keep |
| §6.3 zero-weight real structure | trivial real line | c(1)=1, c(i)=−i; fixed set ℝ, not all ℂ | involution alone not identity | Keep |
| §6.4 quotient action and left composition | representative n versus nt₀; SU(3) s₁,s₂ | same conjugation because t₀ commutes with T; s₁s₂·e₁=e₂ versus s₂s₁·e₁=e₃ | inverse conjugation order correct | Keep |
| §6.4 fixed ring and orbit sums | SU(3) weight (1,1,0); zero weight | orbit has 3 distinct weights, each coefficient1; zero orbit sum1 rather than |W|=6 | stabilizers not double-counted | Keep |
| §6.5 closed product and cover | Circle; SO(3); U(2) | Lie dimensions 1+0=1, 0+3=3, 1+3=4; finite kernel sizes1,2,2 | no central/derived direct-product claim | Keep |
| §6.5 kernel-character descent | U(2) covering pairs (q,a)=(1,1),(0,1) | kernel scalar (−1)^(q−a)=+1,−1; only first descends | finite-kernel condition essential | Keep |
| §6.5 differential/coroot/dominance | SU(2), n=1,−1,1/2 | H=−i diag(i,−i)=diag(1,−1); α(H)=2; λ(H)=n; dominant iff n≥0 when integral; n=1/2 gives iπ at period | signs and integrality correct | Keep |
| §6.5 Y=Q∨ and actual weight lattice | SU(2); SO(3) | Y=ℤH versus (1/2)ℤH; allowed highest integers ℤ versus 2ℤ; quotient index2 | true with simply connected hypothesis | R03: resolve supplier |
| §6.5 center retained / torus case | U(2) weight (a,b); pure torus rank r | (q,a′)=(a+b,a−b); q−a′=2b; derived roots empty for torus, every χ∈ℤ^r dominant | no semisimple substitution for gl₂ | Keep |
| §6.6 highest-weight descent/exhaustion | SU(2) weights1,2; Circle weights0,1 | −I acts −1,+1, so only2 descends to SO(3); both circle derived weights0 but values at i are1,i | central character determines lift | Keep |
| §6.6 maps, tensors and duals | U(2) standard and dual; intertwiner2I | kernel scalar+1 for (1,1) and (−1,1); product scalar1; descended/pulled-back map2I | inverse constructions tested | Keep |
| §6.6 central twist distinction | U(2) highest weights (1,0),(2,1) | same derived weight1; central i versus i³=−i | full character required | Keep |
| §6.7 invariance and equivalence detection | SU(2) Sym²; Circle scalar characters | t²+1+t⁻² invariant under inversion; circle t and t⁻¹ differ at i: i versus −i | restriction retains representation data | Keep |
| §6.7 orbit triangularity and ℤ-basis | SU(2) χ₂ and χ₀; rank0; Circle | χ₂=m₂+m₀, χ₀=m₀, triangular determinant1; trivial basis{1}; torus basis{tⁿ} | integral basis, not positive cone | Keep |
| §6.7 positive-cone negative control | t²+t⁻² | torus coefficients1,1; irreducible coordinates χ₂−χ₀ have coefficient−1 at χ₀ | does not overclaim positivity | Keep |
| §6.8 U(n) lattice congruence | U(3) λ=(2,1,−1); fundamental (1,0),q=0 | q=2; a=(1,2), weighted sum5≡2 mod3; forbidden pair has kernel scalar ζ⁻¹≠1 | central gluing retained | Keep |
| §6.8 symmetric Laurent generators and small rank | U(2), U(1), U(0) | (t₁t₂)(t₁t₂)⁻¹=1; U(1) ring ℤ[t,t⁻¹]; U(0) ring ℤ and scalar-circle map constant | inverse determinant/zero rank covered | Keep |
| §6.9 U(2) iff: constructive direction | weights (2,0),(1,1),(0,2), values1,2,1 | outward differences1,1; reconstruction Sym²⊕det gives1,2,1; dimension3+1=4=Σf | telescoping works | Keep |
| §6.9 U(2) iff: negative control | weights (1,−1),(−1,1) only | symmetry holds; at (0,0), inequality is0≥1 false; formal multiplicity−1 | symmetry alone insufficient | Keep |
| §6.9 negative twists and zero | f=δ_(−1,−1); f=0 | det⁻¹ at diag(i,−1) equals i; zero has n=0, trace0, both conditions0=0/0≥0 | negative exponent bases nonzero | Keep |
| §7.1 uniqueness/realization headlines | m₁=2; m=0 | dimension2·2=4, trace at1=4, trace at−I=−4; zero dimension/trace0 | complex multiplicities match signatures | Keep |
| §7.1 symmetric-power kernels | d=0,1,2; z=i and z=−1 | d1 eigenvalues(−i,i), d2(−1,1,−1); at−1: (−1,−1) versus(1,1,1); kernels G,{I},{±I} | parity criterion correct | Keep |
| §7.1 sum faithfulness and partitions | n=0,1,2,3,4; Sym¹⊕Sym¹ | faithful counts0,0,2−1=1,3−2=1,5−2=3; double standard kernel{I}∩{I}={I} | even part means odd highest weight | Keep |
| §7.1 unitary conjugacy and smooth embedding | intertwiner2I between identical unitary models; standard SU(2) | polar factor (T†T)^(1/2)=2I, normalized intertwiner I; standard derivative kernel0, trivial action derivative kernel su₂ | polar normalization and injectivity distinguished | Keep |

The table has 68 rows. The zero-dimensional and empty-index tests were kept distinct: a zero representation is not irreducible, whereas the trivial group has one irreducible character and one-dimensional Haar L². No counterexample to a headline theorem was found. R01–R03 concern ownership and supply; R04–R05 concern descriptions, not different mathematical formulas.

## Not verifiable

- Conway1990, *A Course in Functional Analysis*, second edition (1990), VII.9, Exercises 8–11, cited for §§4.1 and 5.1. The sources service tried DOI 10.1007/978-1-4757-4383-8 and returned `uncertified` because it resolves only to a paywalled publisher. No legal text was available to check exercise numbering, printed pages or exact hypotheses. The README already labels it locator-only; no new request or manifest edit was made. The separate mathematical deductions and examples are recorded above.

## Source issues

- **Gap** in Knapp2021 at Proposition 4.67, printed p.267: the source says the index formula follows immediately from torus centrality and analytic integrality; it should be justified by extension of finite-kernel characters to the covering torus, giving both index bounds; affects the proof; corrected in print at the digital second edition's corrections, pp.814–815 (Knapp2021 line 34709).
