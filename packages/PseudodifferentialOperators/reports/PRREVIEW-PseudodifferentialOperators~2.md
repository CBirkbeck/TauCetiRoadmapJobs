# Review of PseudodifferentialOperators (pull request #952 at b09a45c)

**Verdict:** needs changes

## R01 (P1) — The supplier graph still has reciprocal edges

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:90`: “K5a's distributional action and Laplace analysis consume the differential-operator core; P1.1 and P2–P7 consume K5a's analytic scale.”

**Claim:** Interleaving these layers provides an admissible supplier order.

**Witness:** Main `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1650` consumes PDO P1.0 and supplies the analysis consumed by PDO P1.1 onward at line 1663: PDO→CKG→PDO. Main `TauCetiRoadmap/RiemannianGeometry/README.md:144` supplies another return edge.

The latter roadmap consumes P1 while this README consumes its R4.7 quotient construction at line 1634. Both are roadmap-level cycles, even though some individual layers could be interleaved. The mechanical check below does not expose these main-branch return edges.

**Exact repair:** Transfer the differential/jet/formal-adjoint floor to an earlier, explicitly scoped Part II owner, and update the contracts of its consumers. CKG, RiemannianGeometry and PDO must consume that owner; PDO can then consume CKG analysis and Riemannian quotient geometry. Do not reconstruct K5a here. On the exhibited graph this gives core→CKG, core→RiemannianGeometry, core→PDO, CKG→PDO and RiemannianGeometry→PDO, with no return edge. This is the unresolved previous R02; no supplied repair report marks it settled.

## R02 (P1) — The closed-form prerequisite is still outside the declared supplier graph

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:138`: “Required OperatorTheory extension: closed forms and Friedrichs realization”; line 149: “These are prerequisite contracts, not supplied declarations.”

**Claim:** The announced extension can supply the representation/Friedrichs theorem used at lines 1653–1661 and 1694–1696.

**Witness:** At main 9c6e95d, `TauCetiRoadmap/OperatorTheory/` has no UnboundedOperators folder or closed-form representation target. The supplied open revision has UO-D06 at `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:172`. No matching plan gap exists.

The new wording correctly admits the absence, but prose alone does not register a supplier gap. The open revision of an existing roadmap cannot replace its main contract under this review's rules. The pins supply partial operators and spectral tools, not this construction.

**Exact repair:** Register minimal, precise OperatorTheory-owned gaps for (i) the semibounded closed Hermitian-form representation on a densely and continuously injected complete form domain, with the displayed graph characterization and uniqueness, and (ii) its Friedrichs completion comparison for a densely defined semibounded symmetric operator. Give each the same slug in the plan and the README's exact supplier contracts; include the real/complex scope and shift independence needed here. Alternatively name an available earlier owner. Test the contracts on q(u,v)=conj(u)v with j=id: A=id for both shifts 1 and 2; on the circle energy form: A=−∂², domain H², eigenvalues 0,1,4 at k=0,1,2. The geometric comparisons remain here. Previous R03 is only partly repaired.

## R03 (P2) — Declaring shared interpolation objects has not removed the second owner

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:22`: “P5's compatible couples, strip quotient and K-method are generic constructions”; construction targets remain at lines 955–1002.

**Claim:** These are the single common interpolation objects consumed by NoncommutativeIntegration.

**Witness:** The supplied NoncommutativeIntegration head still constructs the same objects in `TauCetiRoadmap/NoncommutativeIntegration/README.md:425` (couples), line 451 (strip quotient), and line 491 (real method); it does not import P5.

**Exact repair:** Complete the ownership transfer: retain generic interpolation in this earlier roadmap and have the later NoncommutativeIntegration sections consume it, retaining only their additional upper-method, duality and noncommutative comparisons. A common earlier owner is also possible. Do not introduce an upward dependency on NoncommutativeIntegration. The common scalar-couple test must give K(t,1)=min(1,t), complex norm 1, and real (1/2,2) norm √2 in both consumers. The new scope paragraph acknowledges the overlap but does not eliminate it; previous R04 is partly repaired.

## R04 (P3) — Several headline blocks still have no claim-level locator

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:668`: “the Schwartz kernel theorem”; lines 955–1024, 1156–1174, 1403–1554, 1587–1604 and 1631–1710 have further examples.

**Claim:** The references let an implementer identify the theorem and its exact hypotheses.

**Witness:** The kernel theorem's nearby Taylor (1.1)–(1.4) locator covers Fourier quantization, not the kernel correspondence. Generic interpolation, product index and transplantation have no theorem/page locator. The two Mark courses still have no identifiable edition or exercises.

**Exact repair:** Attach exact legal-source theorem/section and page locators to each definition/API and theorem group, including P1's ideal-square, jet and Bochner results, the sampled blocks identified below, and the course exercises. Record the works under stable keys in sources.toml; distinguish the version actually read. For example, Taylor I.(2.5)–(2.7), p. 8 supports the ordered composition formula, while BDH v2 Proposition 5.1, pp. 13–14 supports the Euclidean normal-topology pullback. Neither licenses unrelated claims. Retest on the identity kernel δ on the diagonal and on the scalar interpolation norms 1 and √2, then verify the general hypotheses against the selected source. Previous R06 is partly repaired.

## R05 (P3) — Shared Check lists still leave individual definitions under-tested

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:617`–623 and 1139–1148: the homogeneous/cutoff and Hölder/Zygmund lists.

**Claim:** Each definition has at least three discriminating Checks.

**Witness:** The first list has two homogeneous-symbol bullets and one cutoff bullet. The second has two little-Hölder bullets, one Zygmund-weight bullet and an Ehrling theorem test. Group totals do not meet the per-definition requirement.

**Exact repair:** Give each object three separate positive/negative Checks. For a cutoff, test a genuine smooth transition with values 0, 1/2, 1; reject the discontinuous step despite its endpoint values; reject a smooth overshooting transition despite its endpoints. For Zygmund norms, test a constant in the low block, a unit block at j=2 (weights 1 and 4 for r=0,1), and δ₀ on ℝ (dyadic sizes proportional to 2^j, bounded after weight 2^(−j), unbounded at r=0). Include a third homogeneous-symbol test that separates positive homogeneity from unjustified parity, e.g. |ξ| has degree 1 but takes value 1 at both ±1. These supply discriminating computations without adding Lean padding. Previous R07 is partly repaired.

## Verified sound

This is an independent AI review of the full specified folder. No pull-request file was edited, no comment posted, and no approval or merge performed. The findings are repairable.

**Previous findings, checked against this head.** The quotations below are from the repaired README or Lean file, not from a proposed future repair.

| Previous finding | Passage at this head | Disposition |
|---|---|---|
| R01, cutoff adjoints | README:1532–1533, “The cutoff construction asserts oddness and norm convergence of D_ε; it does not assert formal self-adjointness.” | Repaired. The false equality is removed; lines 1569–1575 retain the computed 2 versus 0 counterexample. The block-index comparison needs oddness and norm convergence. |
| R02, supplier cycle | README:90–91, “consume the differential-operator core” and “consume K5a's analytic scale” | Not repaired; current R01. |
| R03, unavailable UO-D06 | README:149, “prerequisite contracts, not supplied declarations” | Partly repaired: accurate disclosure and mathematical contract, but no registered gap; current R02. |
| R04, interpolation duplication | README:24, “They are the common interpolation objects” | Partly repaired: ownership intention stated, second construction persists; current R03. |
| R05, missing Borel headline | Suggested.lean:184, `theorem exists_asymptoticSum` | Repaired. Antitone orders, limit −∞ and actual remainder symbols occur in the elaborated signature. |
| R06, locators | README:589, “Chapter 2, Proposition 2.3 and (2.55)–(2.57), pp. 39–40” | Partly repaired: Borel and several Taylor/BDH claims now have checkable locators; current R04 lists the remaining omissions. |
| R07, roadmap shape | README:1, “# Roadmap: pseudodifferential operators and elliptic analysis on bundles”; all nine layers now end in Examples/Dependencies. | Partly repaired: 35 Checks lists and 33 Needs lines, but not three Checks per definition; current R05. |
| R08, names/docs/order | Suggested.lean:110, “Layer 2: Symbols and asymptotic expansions”; README:582 names `exists_asymptoticSum`. | Repaired. All 22 explicit declaration names occur in README, each declaration has a docstring, and Lean layers occur in README order. |
| R09, acceptance padding | Suggested.lean:11, “Calderón–Vaillancourt theorem (P3/P5)” ends the statable inventory. | Repaired. The two pointwise derivation helpers and ordinary Fredholm-path declaration are absent; their README API remains. No replacement padding was found. |

**Mechanical checks.** HEAD is b09a45c64e42af12c2bb0d041cae047192091f80. The diff outside this folder is empty. The worker's gate reports all checks passing, including the targeted module build, import/form scans, metadata and stray-file checks. I reran the prescribed dependency check; its complete output was:

```text
depcheck: 207 roadmaps, 1425 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. R01 records the independently resolved return edges that this output misses. The merge order places PDO after KacMoody, LefschetzPencilsAndVanishingCyclesPartII, VonNeumannAlgebras, EllipticCohomology, StringOrientation and SmoothBundlesConnections. Main suppliers were checked as main, rather than silently replaced by revisions.

The prescribed `lake env lean` on Suggested.lean exited 0 with eight sorry warnings and no other diagnostics. One scratch copy printed `#check @name` for all 22 explicit declarations and exited 0. The four geometric theorems retain finite dimension, Hausdorffness, second countability and boundarylessness. The two operator theorems retain finite-dimensional complex fibers, completeness and the appropriate compact-support/uniformity hypothesis. The summation theorem retains Antitone and Tendsto atBot; the inverse theorem retains ellipticity and excludes ξ=0 in both inverse equations. Definitions legitimately drop unused completeness/second-countability assumptions; no headline acquired an unintended missing hypothesis. No signatures were changed.

All eight admitted theorems were tested with the single-tactic alternatives simp, rfl and infer_instance in a scratch copy, with each branch required to close the goal. None closed. Pinned-definition inspection found no one-library-lemma proof of a remaining full headline. This tests padding and elaboration, not the truth of an admitted theorem.

No sorry'd data, set_option, free-Prop substitute, arbitrary-operation stand-in, route-specific restriction, computational deliverable, or copied source passage was found in the reviewed text. The full calculus is new relative to main; the overlap requiring repair is R03, not a reason to reject the entire scope. Main HopfRinow and Completed/OrthogonalL2Bases were read as shape/API examples, alongside the substantive supplier roadmaps.

**Headline inventory and acceptance coverage.**

| README headlines | Acceptance status |
|---|---|
| P1 ideal-square/cotangent, global real and complex derivation dictionaries | Four real scalar headlines are stated; the complex module/dictionary is identified in the docstring as lacking its smooth complex-function/module infrastructure. |
| P1 jets, differential symbols, Bochner decomposition and Peetre | Named as not statable on the missing bundle-operator/distribution carriers. |
| P2 Borel summation and classical principal terms | Summation is now stated; the inverse principal-symbol headline is stated in Layer 6. |
| P3 quantization and manifold Schwartz kernel theorem | Actual quantization is defined for the mapping headlines; the manifold kernel theorem is named as lacking bundle tests/distributions and density duals. |
| P4 composition, adjoints, global quantization | Global classes are explicitly unavailable at the pins; the README retains their construction and exact formulas. |
| P5 all-order Sobolev and uniform order-zero estimates; interpolation/Besov/Zygmund comparisons | Both Euclidean operator headlines are stated on native Bessel spaces; missing interpolation/bundle Besov/Zygmund carriers are named. |
| P6 parametrices, distributional elliptic regularity, Fredholmness and solvability | Global bundle Sobolev/operator carriers are identified as missing; no scalar stand-in replaces these results. |
| P7 powers/domains, equivariant product index, elliptic-complex Hodge theory | All are named as not statable without bundle scales and self-adjoint realizations. |
| P7a finite-deck isospectrality; P8 wavefront detection and distribution operations | Missing manifold distribution/spectral carriers are named. |

No further definitely statable missing headline was established. In particular, the new Borel statement needs only the existing Symbol carrier, and now has its full quantifiers.

**Pinned-library audit.** Mathlib pin 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti pin a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. These are 17 groups of declarations/definitions opened at those pins; paths are relative to their library repositories.

| File and line | Object checked and scope |
|---|---|
| Mathlib/RingTheory/Ideal/Cotangent.lean:40,52,59,67 | Ideal.Cotangent, toCotangent, mem_toCotangent_ker, toCotangent_eq_zero: algebraic quotient/kernel, not geometric cotangent identification. |
| Mathlib/Geometry/Manifold/VectorBundle/ContMDiffSection.lean:135,378,395 | ContMDiff.smul_section and the native scalar module: smooth multiplication and base-field action, not the requested C∞-function-module dictionary. |
| TauCeti/Geometry/Manifold/DerivationBundle.lean:106,163,193,368 | The four chart/Hadamard helpers named by P1 exist and are private; exposing them is accurately scoped. |
| Same file:309,351,446,468 | Germ invariance, differential naturality, pointDerivationEquivTangentSpace and inverse law: finite-dimensional Hausdorff real manifold, interior point; not global-field smoothness. |
| Mathlib/Geometry/Manifold/VectorField/LieBracket.lean:481,998 | mlieBracket_smul_right and ContDiff.mlieBracket_vectorField supply the stated smooth bracket rules. |
| Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:359 | CovariantDerivative.leviCivitaConnection is the native positive-metric connection used through HopfRinow. |
| Mathlib/Analysis/FunctionalSpaces/BesselPotentialSpace.lean:47,250,265,279,299 | BesselPotentialSpace stores distribution and Lp data plus their Bessel equality; toLpₗᵢ, completeness and MemSobolev conversion exist. The Hilbert instance additionally requires an inner-product fiber. |
| Mathlib/Analysis/Distribution/Sobolev.lean:222 | memSobolev_iff_exists_smulLeftCLM_fourier uses a complete complex inner-product fiber and p=2. |
| TauCeti/Analysis/Sobolev/RellichKondrachov.lean:141 | W1p0.isCompactOperator_valueL is zero-boundary compactness, bounded domain and finite p; it is not unrestricted extension/Rellich. |
| TauCeti/Analysis/Sobolev/W1p/Extension.lean:255,299 | W1p0.norm_extendByZeroL and hasWeakFDerivOn_indicator retain zero-boundary hypotheses. |
| Mathlib/Analysis/FunctionalSpaces/SobolevInequality.lean:601 | eLpNorm_le_eLpNorm_fderiv_of_eq: compact C¹ support, finite-dimensional fibers, positive base dimension and reciprocal-exponent equation; closed-base lower-order term is additional work. |
| Mathlib/Analysis/Normed/Operator/Fredholm/Open.lean:89,97,104 | IsFredholm.eventually_nhds_index_eq, index_continuousAt and index_continuousOn_isFredholm supply ordinary local index constancy. |
| TauCeti/Analysis/Fredholm/SmallPerturbation.lean:243 | IsFredholm.exists_pos_isFredholm_and_index_eq_of_norm_sub_lt supplies the norm-ball comparison. |
| TauCeti/Analysis/InnerProductSpace/Spectrum.lean:119,145; Mathlib/Analysis/InnerProductSpace/Spectrum.lean:93 | Compact symmetric eigenbasis, injective/nonzero variant and conjugate eigenvalue equality. They do not supply an unbounded H² domain theorem. |
| Mathlib/Analysis/Complex/Hadamard.lean:612 | norm_le_interp_of_mem_verticalClosedStrip': ordered strip, holomorphy/closed continuity, boundedness and boundary bounds; no compatible-couple space is constructed there. |
| Mathlib/RepresentationTheory/Induced.lean:155; TauCeti/RepresentationTheory/Induction/Permutation.lean:166 | Rep.indResAdjunction and TauCeti.indTrivialIso. The latter's generator formula uses x⁻¹; identity-coset evaluation agrees with the left-coset convention. |
| Mathlib/Analysis/Distribution/Distribution.lean:79 | Schwartz kernel theorem appears as a future development, not a supplied theorem. Native distributions use real test functions with locally convex convergence; complex density/bundle comparisons remain explicit supplier work. |

Object searches included symbol estimates, wavefronts, kernels, compatible couples, K-functionals, cotangents/derivations, Bochner connections and closed-form/Friedrichs operators in both pins; main/open roadmap searches used the roadmap grep/show tools; board package plans/READMEs were searched too. No second fully qualified acceptance declaration was found outside this roadmap's own checkout. The resolver's initial two leads are not findings: Symbol.HasCompactSpatialSupport is declared here, and Gassmann.almostConjugate_iff_permutation_equiv is an InductionRestriction roadmap target, not a claimed pinned theorem.

**Resolved cross-roadmap contracts (14 groups).** Main references below use main 9c6e95d; supplied open heads are identified as such. Reading a revision for ownership does not make it an authorized supplier.

| Contract | Resolved location and result |
|---|---|
| DifferentialGeometry Layers 0–1,5 | Main TauCetiRoadmap/DifferentialGeometry/README.md:268,311,503–533: forms, exterior derivative, integration and densities. |
| SmoothBundlesConnections B2–B4 | Supplied head TauCetiRoadmap/SmoothBundlesConnections/README.md:518–727 and B3–B4: complexification, bundle operations, metrics, L², connections. Earlier in the merge order. |
| ComplexKahlerGeometry K5a | Main TauCetiRoadmap/ComplexKahlerGeometry/README.md:570,626–726,800–865 and 984–1084: density/tests/distributions, p=2 scale, coordinate/multiplier bounds and Laplace/Hodge contracts. Reciprocal supply remains R01. |
| PDE A.3–A.7, B.8–B.10 | Main TauCetiRoadmap/PDE/README.md:234–278: scalar weak/Bessel comparisons, embeddings/extension, Hölder, maximal/CZ/Mihlin and operator interpolation. Generic interpolation spaces are distinct from its Riesz–Thorin/Marcinkiewicz targets. |
| HopfRinow Layer 1 | Main TauCetiRoadmap/HopfRinow/README.md:8–14 and Layer 1: positive Levi–Civita connection and regularity, with separate nondegenerate extensions. |
| RepresentationTheory/CompactGroups Layers 0–3 | Main TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md:60–64 and its first four layers: probability Haar, averaging, complete reducibility and Schur. |
| TopologicalKTheory T6.1–T6.2 | Main TauCetiRoadmap/TopologicalKTheory/README.md:961–1006: strong L² section actions and independent SplitK0 of genuine continuous representations with external tensor products. No index theorem is used to prove the analytic product index. |
| VonNeumannAlgebras V2 | Supplied head TauCetiRoadmap/VonNeumannAlgebras/README.md:554–570: completed Hilbert tensors and scalar L² products. The finite-rank external-bundle adapter here is additional work; compact Riemannian volumes are σ-finite. |
| RiemannianGeometry R4.7/R7 | Main TauCetiRoadmap/RiemannianGeometry/README.md:144–149,750–756 and R7: general free properly discontinuous isometric quotients exist, without constant-curvature restriction. The return dependency is R01. |
| OperatorTheory extension | Main absent; supplied revision TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:172–220 has the intended form theorem. Availability, not the scalar graph equation, is R02. |
| InductionRestriction Layer 2.1 | Main TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:370–378 and Suggested.lean:728: almost-conjugacy/permutation equivalence, consuming the pinned induction tools. |
| NoncommutativeIntegration §§2.2–2.4 | Supplied head TauCetiRoadmap/NoncommutativeIntegration/README.md:423–502: duplicate generic constructions, R03. |
| LieGroupoidsPoisson G1.1; ContactGeometry CG5 | Supplied TauCetiRoadmap/LieGroupoidsPoisson/README.md:345,1091; main TauCetiRoadmap/SymplecticGeometry/ContactGeometry/README.md:207–209,275–278: consumers of section modules and first jets. |
| IndexTheory I2/I4; FuchsianOrbifolds L9 | Supplied TauCetiRoadmap/IndexTheory/README.md:63,230,432–480 and TauCetiRoadmap/FuchsianOrbifolds/README.md:152,1457–1459: consumers of the analytic product and normalized finite-deck transplantation. |

The board's QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups design G15 records a needed kernel identification, not a competing completed generic theorem. The kernel calculus is appropriately owned here. No ownership transfer was actually made by this read-only review. RQFT references are addressed under Not verifiable.

**Seeded source sample: all 15 requested targets.** No additional locator is explicitly flagged unverified in the README. The following distinguishes what the source actually supplies from added localization/bundle arguments. Source line numbers refer to the sources-service extractions, not web search snippets.

| Target | Locator and text read | Result |
|---|---|---|
| 2.1 Local and uniform symbols | Taylor I.(1.15), p. 5; taylor line 151 | Uniform estimates and Japanese bracket match. The local compact-x variant is the stated localization, not Taylor's uniform hypothesis silently dropped. |
| 2.2 Classical expansions and Borel summation | Taylor I.(1.17), p. 5, taylor line 157; Melrose Ch. 2, Proposition 2.3 and (2.55)–(2.57), pp. 39–40, melrose line 420 through line 523 | Numbering, remainder indexing and cutoff estimates match. Melrose proves uniform orders m−j; the README explicitly supplies the compact-exhaustion, variable-order and compact-parameter diagonal argument. |
| 3.1 Oscillatory integrals and kernel theorem | Taylor I.(1.1)–(1.4), pp. 3–4; taylor line 80 | Fourier sign/rescaling and polynomial quantization match. This locator does not prove the full kernel theorem: R04. |
| 4.1 Composition and adjoints | Taylor I.(2.3), p. 7 and (2.5)–(2.7), p. 8; taylor line 237 through line 279 | Ordered coefficients and adjoint correction match after D=−i∂. The README avoids the matrix reordering error in the source's subsequent (2.9). |
| 5.3 Interpolation/Bessel/Besov | No exact external locator for the new interpolation-space constructions | Native three-lines input verified. Scalar norm computations below do not replace a source: R04. |
| 5.4 Hölder/Zygmund/little Hölder | Taylor I.(3.32)–(3.34), p. 12; taylor line 444 | Euclidean Zygmund identification and real-order shift match. Little Hölder, bundle comparisons and Ehrling have no exact locator here: R04. |
| 5.5 Smoothing and compact equivariance | No exact external locator | Mapping/Rellich and Haar inputs resolve; the new claims remain without their own locator: R04. |
| 6.1 Ellipticity/parametrices | Taylor I.(4.1)–(4.6), pp. 13–14; taylor line 475 | Uniform inverse hypothesis and two-sided smoothing remainder match. Compact-x localization is distinguished from a global uniform estimate. |
| 6.2 Regularity/solvability | Taylor I.(4.6)–(4.11), pp. 14–15; taylor line 502 through line 525 | Sobolev gain and local regularity match after using the declared finite-negative-order distribution input. Global bundle Fredholm/solvability, Schauder and nonlinear course claims need further locators. |
| 7.1 Powers/domains | Grubb–Hansen Definition 2.1/§4 and Seeley pp. 288–307 | Fetches did not yield readable texts. Spectral and resolvent models computed below; source generality not certified. |
| 7.2 Equivariant product index | No exact external locator | Sign, norm-error scaling, axis cutoffs, repaired adjoint issue and kernel dimensions checked; source not certified: R04. |
| 7.3 Elliptic complexes | No exact external locator | Common-order symbol exactness and zero-complement convention tested; source not certified: R04. |
| 8.1 Quotients/scalar realization | No exact external locator | R4.7/K5a inputs resolve; the form prerequisite remains R02. Course/source provenance not certified. |
| 8.2 Normalized pullback/transplantation | No exact external locator | IR and native Frobenius inputs resolve; degree-four normalization and S₃ tested. The analytic transplantation theorem needs a locator: R04. |
| 9.1 Wavefront detection/regularity | Taylor I.Proposition 7.3, Corollary 7.4 and (7.7), p. 22; taylor line 781 through line 799 | Pseudolocality and characteristic-set inclusion match; the stated local distribution and bundle transport supply the passage from the source's Euclidean H^(−∞) setting. |

Additional verified locators: Taylor I.(1.21)–(1.28), pp. 6–7 (taylor line 193), supports off-diagonal smoothness and amplitude reduction; I.(3.1), p. 9 (line 320), supports uniform order-zero boundedness; I.(3.28),(3.31), p. 12 (lines 433,440), supports Sobolev shifts. BDH arXiv:1409.7662v2 Theorem 4.6, p. 13 (bdh line 500), Proposition 5.1, pp. 13–14 (line 519), Theorem 6.1, p. 21 (line 914), and Theorem 6.3, pp. 21–22 (line 941) support the Euclidean normal-topology tensor, pullback, product and proper-pushforward assertions with the fixed-cone correction described below. The manifold/bundle version is explicitly additional localization work. These are the cited preprint's numbers.

**Computed adversarial pass (201 rows).** Each row records a recomputed instance, not a proof of the universal statement. The previous table was used as a checklist, and its obsolete verdicts were replaced after evaluating this head; new remainder, cutoff, parameter, group-action and definition tests are included. Angular-frequency and bilinear-distribution conventions are used throughout. “Pass” refers only to the displayed instance. Source certification is separately limited by the table above.

| Statement | Instance tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| Scope: positive versus zero dimension | A point; ℝ | T*point=0; T*ℝ=ℝ; no nonzero covector on the point | Pass; do not infer rank equality in dimension 0. |
| Compactness scope | Translation of a fixed L² bump on ℝ | Norms stay 1; disjoint translates have distance √2 | Pass; no whole-space Rellich asserted. |
| Fourier conversion | ξ=2πζ, u=e^(−πx²) | (2π)^−1 dξ=dζ; phases both e^(2πixζ) | Pass. |
| Derivative symbol | u=e^(ixξ) | ∂u=iξu; Du=ξu | Pass; opposite Fourier sign fails. |
| Geometric/Fourier adjoint | ∂ and ∂² | Geometric adjoint symbols −ξ, ξ²; Fourier symbols −iξ, −ξ² | Pass: conjugate σ_F agrees. |
| Matrix commutator order | A=e12, B=e21; P=AD, Q=BD | [A,B]=diag(1,−1); commutator symbol ξ²diag(1,−1) | Pass: order need not drop. |
| Vanishing ideal | x=0, f=1,x,x² | Values 1,0,0; membership false,true,true | Pass. |
| Ideal square iff | Same functions | (f(0),f′(0))=(1,0),(0,1),(0,0); square membership false,false,true | Pass in both directions on controls. |
| Ideal square in dimension 0 | Discrete base at x | I_x²=I_x (multiply by 1 off x); df=0 | Pass, including disconnected bases. |
| Cotangent equivalence | ℝ at 0, classes x and x² | [x]↦dx with dx(1)=1; [x²]↦0 | Pass; zero map ruled out. |
| Cotangent pullback | y=2x | d(y∘f)=2dx; f*dy=2dx | Pass. |
| Smooth section module | f=2+x, s=(x,1), x=3 | (fs)(3)=(15,5)=5·(3,1) | Pass; base-field action alone is insufficient. |
| Scalar tower | a=2, f(3)=5, s(3)=1 | a(fs)=10=(af)s | Pass. |
| First jet | f=1,x,x² at 0 | j¹ values (1,0),(0,1),(0,0) | Pass; value-only model fails on x. |
| First-jet exact sequence | Trivial rank-r bundle on ℝⁿ | Dimensions nr,(n+1)r,r; kernel of projection has dimension nr | Pass, including n=0 or r=0. |
| Jet frame transition | e′=e^x e, section component u | u′(0)=u(0); derivative component u_x(0)−u(0) | Pass; purely diagonal transition is wrong. |
| Connection splitting | ∇=d+a dx on a line | Covariant jet derivative u′+au; changing a→b adds (b−a)u | Pass. |
| Point derivation | D=∂, f=x² at x=3 | Df=6=df(1) | Pass; this is README API, no longer an acceptance declaration. |
| Global field smoothness | D=x∂ and D=0 | Fields x and 0; derivatives 1 and 0 | Pass; no continuity hypothesis on D used. |
| Field scalar linearity | f=2+x, D=∂, x=3 | field(fD)=5=f(3)field(D) | Pass. |
| Derivation bracket | X=x∂, Y=∂, test f=x | [X,Y]f=−1; vector bracket=−∂ | Pass. |
| Complex scalar convention | z=i, w=i | zw=−1; conjugation gives (−i)(−i)=−1 | Pass. |
| Complexified field dictionary | X=∂, Y=2∂, u=x, v=3x | δ(u+iv)=−5+5i on both formulas | Pass; sign of −Yv is discriminating. |
| First-order splitting | D=x∂+3, f=x² | Df=5x²; Xf+fD1=2x²+3x² | Pass. |
| Splitting negative control | D=∂², f=g=x | [[D,M_x],M_x]=2id≠0 | Pass: excluded by hypothesis. |
| Order filtration | ∂² and multiplication | Triple commutator=0; double commutator=2id; multiplication has first commutator 0 | Pass. |
| Higher-jet factorization | ∂² on ℝ at 0 | j²f=(f,f′,f″); output f″; x³ gives 0 | Pass. |
| Principal-symbol factorial | P=∂², f=x | [[P,x],x]=2; (1/2!)·2=1=σ_geom(P)(dx) | Pass. |
| Composition symbol | ∂∘∂ | (iξ)²=−ξ²=σ_F(∂²) | Pass. |
| Order-zero symbol | Multiplication by matrix A | σ(A)=A, independent of ξ | Pass. |
| Rough Laplacian energy | Circle u=sin x, flat line | ∫u(−u″)=π=∫(u′)²; symbol ξ² | Pass. |
| Laplace positive rescaling | 3(−∂²) | Fourier symbol 3ξ², c=3>0; negative rescaling gives −3ξ² | Pass; wrong sign excluded. |
| Dirac anticommutator | D=∂ on real line | αβ+βα=2αβ; D*D=−∂² | Pass. |
| Bochner connection | −∂²+b∂+c on line | Connection d−b/2; zeroth remainder c−b′/2+b²/4 | Pass by expansion. |
| Noncanonical density Check | w=e^(sin x) | ∂*=−∂−cos x; connection d+(cos x)/2; metric defect cos x | Pass: canonical-density condition matters. |
| Curl symbol | ξ=e1, v=e2 in ℝ³ | iξ×v=ie3; ξ-parallel v=e1 gives 0 | Pass; curl is not elliptic on all vectors. |
| Peetre local versus global order | Disjoint copies of ℝ, D=∂^j on component j | Orders j; each compact meets finitely many components | Pass for stated continuous-local version; no global bound follows. |
| Symbol local bound | a=x, order 0 | On K=[−R,R], sup \|a\|=R; sup over all x=∞ | Pass; IsUniform excludes it. |
| Symbol order | a=ξ | \|ξ\|≤〈ξ〉; sup \|ξ\|=∞ | Pass: S¹, not S⁰. |
| Symbol differentiation | a=ξ² | ∂ξa=2ξ, ∂ξ²a=2, ∂ξ³a=0 | Pass: losses 1,2,3. |
| Symbol product | a=ξ, b=ξ² | ab=ξ³, order 1+2=3 | Pass. |
| Smoothing ideal | a=e^(−ξ²), b=ξ² | ξ^N ab→0 for every N; derivatives polynomial times Gaussian | Pass. |
| Homogeneous symbol | a=ξ², t=2, ξ=1 | a(2)=4=2²a(1); degree-1 alternative gives 2 | Pass. |
| Homogeneous zero convention | Order −1 term 1/\|ξ\| off zero | a(0)=0 by convention; a(2ξ)=a(ξ)/2 | Pass; no smoothness at 0 asserted. |
| Frequency cutoff | ‖ξ‖=0,1,2 | Values 0,0,1 | Pass; constant zero/one each violates one condition. |
| Classical remainder at N=0 | a=1, a₀=1 off zero | Empty sum=0; r₀=1 | Pass. |
| Classical cutoff remainder | Same a, N=1 | r₁=1−χ, compactly supported in frequency | Pass: smoothing. |
| Uniqueness of homogeneous term | ξ=tη, η≠0; difference lower by one | t^m c bounded by Ct^(m−1) forces c=0 as t→∞ | Pass; coefficient uniquely determined. |
| Cutoff independence | χ₁,χ₂ both 1 at infinity | (χ₁−χ₂)a_j has bounded frequency support away from 0 | Pass: all weighted seminorms finite. |
| Classical exponent classes | 1+〈ξ〉^(−1/2) | Remainder after degree 0 is ∼\|ξ\|^(−1/2), not O(\|ξ\|^−1) | Pass: not classical order 0 in integer steps. |
| Borel summation | a₀=1, later terms 0 | b=1; r₀=1, r_N=0 for N≥1 | Pass; the full headline is now in Suggested.lean. |
| Compact-support predicate | a=χ(x)ξ; a=1 | First has support supp χ; second needs all ℝⁿ | Pass; second excluded for n>0. |
| Elliptic inverse symbol | a_m=ξ² id, ξ=2 | a_m=4, b=1/4; both products=1 | Pass. |
| Ellipticity negative control | diag(ξ²,0) | Determinant 0 at ξ=1; no two-sided inverse | Pass. |
| Ellipticity rank caveat | n=0, V=ℂ, W=0 | Nonzero-covector quantifier empty; ranks 1≠0 | Pass: README correctly limits rank equality to positive dimension. |
| Quantization integral | a=1, u=e^(−πx²), x=0 | Integral ∫e^(−πζ²)dζ=1=u(0) | Pass; zero operator excluded. |
| Quantization integrability | a of order m, u Schwartz | Integrand norm ≤C〈ζ〉^m·C_N〈ζ〉^−N; integrable for N>m+n | Pass; N chosen after m,n. |
| Quantization smoothness | a=1, same u | First derivative −2πx e^(−πx²); kth derivatives polynomial times u | Pass. |
| Quantization n=0 | One-point Euclidean space | Fourier transform=id; integral=a(0,0)u(0) | Pass; no division by dimension. |
| Schwartz-to-Sobolev | Gaussian, any real s | Weighted square integral ∫(1+ζ²)^s e^(−2πζ²)dζ<∞ | Pass. |
| Compact-x Sobolev mapping | a=χ(x), m=0 | At χ=0, output 0 and every H^s norm 0; general comparison pairs output with φ as ∫φχu | Pass; actual pairing ∫φχu, with no conjugate. |
| Uniform order-zero mapping | a=2id | T=2id, operator norm 2; pairing 2∫φu | Pass; no compact-x support required. |
| Schwartz kernel correspondence | Identity; zero map | Kernels δ_(x=y); 0. Pairings ∫φu;0 | Pass; identity kernel is not smooth on diagonal. |
| Off-diagonal kernel | Identity; Gaussian multiplier | δ vanishes off diagonal; Gaussian kernel smooth everywhere | Pass. |
| Amplitude reduction | a(x,y,ξ)=yξ in dimension 1 | Op(a)=D(xu)=xDu−iu; left symbol xξ−i | Pass: derivative correction −i. |
| Proper support | δ_(x=y); kernel 1 on ℝ² | Diagonal projections proper; support projection of 1 has noncompact fibers | Pass; smooth kernel alone insufficient. |
| Distribution transpose | ∂ with compact tests | ⟨∂δ,φ⟩=−φ′(0); transpose=−∂ | Pass. |
| Composition expansion | a=ξ, b=x | a#b=xξ−i; D(xu)=xDu−iu | Pass. |
| Adjoint expansion | a=xξ | Op(a)*=xD−i; symbol xξ−i | Pass; principal adjoint alone misses order 0. |
| Matrix subprincipal commutator | a=ξI+A, b=ξB, [A,B]≠0 | Leading commutator 0; next term ξ[A,B] | Pass: README retains it. |
| Scalar Poisson formula | a=ξ², b=x | [D²,x]=−2iD; (1/i)∂ξa∂xb=−2iξ | Pass. |
| Coordinate-change Check | y=e^x, u=x | −∂x²u=0; pulled-back −y²∂y²(log y)=1 | Pass: difference ∂x is order 1. |
| Principal-symbol exact sequence | −∂² and −∂²+∂ | Both principal symbol ξ²; difference iξ order 1 | Pass; equality modulo smoothing would fail. |
| Differential inclusion | ∂²+2∂+3 | Polynomial −ξ²+2iξ+3; quantization exactly ∂²+2∂+3 | Pass. |
| Exponential recovery | a=xξ−i | e^(−ixξ)Op(a)e^(ixξ)=xξ−i | Pass for full quantization. |
| Output-support iff | a=χ(x) | Op(a)f=χf; outside supp χ all outputs 0; at χ≠0 a local test detects it | Pass in both directions. |
| Square partition | χ₁=cos θ, χ₂=sin θ locally | χ₁²+χ₂²=1; χ₁+χ₂ can be √2 | Pass; ordinary partition is not the same formula. |
| Uniform versus local L² | a=x, input bump translated by R | Input norm 1; output norm grows like R | Pass: local symbol bound does not imply global boundedness. |
| Native Bessel frequency | Angular ξ=2π, order t=1 | Native weight √2; angular 〈ξ〉=√(1+4π²) | Pass: equivalent norms, not equality. |
| W^(k,p) endpoints | f=\|x\| with a cutoff | Weak first derivative sign x; L∞ derivative norm 1; smooth approximants cannot converge in derivative L∞ norm | Pass: no smooth norm density at p=∞. |
| Interval derivative domain | f=1 on (0,1) | H¹ norm 1, Df=0, nonzero trace | Pass: lies in H¹, not H¹₀. |
| Interval L² unboundedness | fλ=cλe^(λx), normalized in L² | ‖fλ‖₂=1; ‖Dfλ‖₂=λ | Pass. |
| Interval closed graph | f_j→f, f′_j→g in L²; test φ | ∫gφ=lim∫f′_jφ=−∫fφ′ | Pass: g=f′ weakly. |
| Closed-base GNS lower term | u=1 on unit-volume compact base | ‖u‖_q=1, ‖∇u‖₁=0, ‖u‖₁=1 | Pass: lower-order term necessary. |
| p=1 subcritical embedding | n=3,r=1 | q*=3/2; concentration scaling ‖uε‖_(W¹,¹)∼1, ‖uε‖_q∼ε^(3/q−2) | Pass: critical bounded, subcritical decays. |
| p=1 critical noncompactness | uε(x)=φ(x/ε), k=n | Top L¹ derivative norm constant; sup norm=1, support→point | Pass: bounded in W^(n,1), no C⁰ compactness. |
| p=1 dimension-one critical | AC function u | \|u(x)−u(y)\|≤∫_[x,y]\|u′\|; bumps can keep height 1 while width→0 | Pass: continuous representatives, not uniform equicontinuity. |
| Supercritical compact embedding | k−l>n at p=1 | Rescaled unit top-derivative bump has C^l size ε^(k−l−n)→0 | Pass on concentration control. |
| Fixed-p compact embedding | k>l, normalized frequency N on circle | W^k norm∼1, W^l norm∼N^(l−k)→0, including p=∞ | Pass. |
| Bilinear density duality | f=i, dual test g=1 on volume 1 | ∫gf=i; Hermitian pairing ⟨i,1⟩=−i | Pass: Riesz comparison is conjugate-linear. |
| Complex interpolation definition | Couple (ℂ,ℂ), value z | Infimum boundary norm=\|z\|; Gaussian strip families approach it | Pass; duplicate owner R03. |
| Interpolation exponents | s₀=0,s₁=2,p₀=2,p₁=4,θ=1/2 | sθ=1; 1/pθ=3/8, pθ=8/3 | Pass. |
| Real K-functional | Equal scalar norms, z=1 | K(t,1)=min(1,t); at t=1 value 1, not 2 | Pass; duplicate owner R03. |
| Real interpolation norm | Same couple, θ=1/2,q=2 | Squared norm ∫₀¹1 dt+∫₁∞t^−2dt=2; q=∞ norm=1 | Pass: equivalent norms, not equal to the original for finite q. |
| Dyadic Besov norm | Single block j=J, Lp norm 1 | B^s_(p,q) norm=2^(Js) for every q; analysis/reconstruction returns the block | Pass. |
| Besov inclusions | Single block as above | Lower/upper sequence controls both 2^(Js) | Pass; does not assert arbitrary-q equality with H^(s,p). |
| Integer Bessel/weak comparison | u=e^(ikx) locally/on circle | Derivative factors k^j; Bessel factor (1+k²)^(k_order/2) | Pass: equivalent finite derivative norms. |
| Coordinate-change hypothesis | φ(x)=2x | Pullback Lp factor 2^(−n/p); inverse factor 2^(n/p) | Pass. |
| Shear Check | φ(x,y)=(x,y+x³), translated bump near x=R | det dφ=1, L² norm unchanged; ∂x gains 3x²∂y and H¹ norm grows ∼R² | Pass. |
| HLS exponent | n=3,p=2,δ=1 | 1/q=1/2−1/3=1/6; q=6 | Pass. |
| Compact Sobolev margin | p=q=2, order gain δ>0, mode N | Norm ratio ∼N^−δ→0; δ=0 ratio 1 | Pass: strict margin matters. |
| General-p critical exponent | n=4,k−l=1,p=4 | rp=n; formula denominator n−rp=0 | Pass: roadmap switches to finite q, never divides by zero. |
| Morrey exponent | n=3,k=2,p=2 | k−n/p=1/2, hence C^(0,1/2) | Pass. |
| Integer Morrey boundary | n=2,k=2,p=2 | k−n/p=1; permitted C^(0,β), β<1, not asserted C¹ | Pass. |
| W^(k,∞) | k=1, f=\|x\| | Lipschitz constant 1; not C¹ at 0 | Pass: C^(0,1), not C¹. |
| Zygmund/Hölder | u=χ\|x\|^α, 0<α<1 | Local α-Hölder quotient at (0,h)=1; dyadic sizes O(2^−jα) | Pass. |
| Little Hölder exclusion | Same u | Small-scale modulus limit=1≠0; smooth u has limit 0 | Pass. |
| Product/algebra estimates | Constant unit sections, volume 1 | Product norm=1, product of norms=1 | Pass; general estimate still needs its stated regularity margin. |
| Ehrling | Circle mode N, k>l | N^l≤εN^k+Cε; finite supremum of N^l−εN^k | Pass. |
| Smoothing compactness | Circle multiplier e^(−k²) | H^s→H^t singular values e^(−k²)〈k〉^(t−s)→0 | Pass. |
| Negative-order compactness | Multiplier 〈k〉^−1 | H^s→H^s singular values→0 | Pass on compact base. |
| Group averaging | Q=Z/2, matrix swap action | Average diag(1,0) becomes (1/2)I; invariant I stays I | Pass, normalized Haar essential. |
| Parametrix and uniform inverse | a(x,ξ)=e^(−x²)〈ξ〉^m | Locally inverse e^(x²)〈ξ〉^−m; no uniform x-bound | Pass: local ellipticity alone not uniform. |
| Parametrix remainder | P=1−∂² on circle, Q multiplier (1+k²)^−1 | PQ=QP=I, remainders 0 | Pass. |
| Local elliptic gain | P=1−∂², Fourier coefficient u_k | (Pu)_k=(1+k²)u_k; H^s(Pu) norm=H^(s+2)(u) in angular spectral norm | Pass. |
| A priori lower term | P=−∂², u=1 | Left norm>0, Pu=0, lower-order norm>0 | Pass: lower term cannot be omitted globally. |
| Kernel-orthogonal estimate | Same P, mean-zero modes k≠0 | k²≥1; ‖u‖₂≤‖Pu‖₂ | Pass. |
| Cokernel and solvability | Circle −∂², forcing f=1 versus sin x | ∫1=2π violates compatibility; −∂²sin x=sin x | Pass. |
| Index independence | Circle −∂² on each Sobolev scale | dim ker=dim coker=1, index=0 for every s | Pass. |
| Schauder localization | −∂²u=χ\|x\|^α near 0 | u=−\|x\|^(α+2)/((α+1)(α+2)) near 0 has two extra Hölder derivatives | Pass. |
| d ellipticity | ξ=1 in n=1; ξ=e1 in n=2 | Map ℂ→ℂ is i; map ℂ→ℂ² has rank1<2 | Pass. |
| Nonlinear bootstrap | n=4,p=3, quadratic RHS | Sobolev exponent 12; product exponent 6; W¹,⁶ Hölder exponent 1/3 | Pass: the stated bootstrap gains regularity. |
| Spectral powers | L=1−∂², k=0,1,2 | Eigenvalues 1,2,5; L^(s/2) multipliers 1,2^(s/2),5^(s/2) | Pass. |
| Power domains and inverse | s=2,t=2, mode k | (1+k²)(1+k²)^−1=1; domain shift H²→H⁰ | Pass. |
| Positive lower bound | A=L versus A=−∂² | Smallest eigenvalues 1 versus 0; inverse multiplier at k=0 is 1 versus undefined | Pass: strict positivity is required. |
| Parameter resolvent homogeneity | Principal ξ²−λ; scale t=2 | (4ξ²−4λ)^−1=¼(ξ²−λ)^−1 | Pass for differential leading term; weak-parametric source unverified. |
| Matrix powers | Principal diag(1,4), z=1/2 | Power diag(1,2), square diag(1,4) | Pass. |
| Finite spectral cutoffs | L circle, bound 5 | Modes k=−2,−1,0,1,2: five eigenvectors | Pass; includes multiplicity. |
| Product spectral cutoff | λ=1+k², μ=1+l², R=1 | λ+μ−1≤1 iff (k,l)=(0,0) | Pass. |
| Equivariant local constancy | Constant id on trivial ℂ representation | Kernel=cokernel=0; virtual index=0 along path | Pass; native ordinary helper is consumed, no longer a Lean target. |
| Order normalization | Scalar principal p=2ξ | p(p*p)^−1/2\|ξ\|=ξ; both squared norms ξ² | Pass. |
| Product symbol sign | Scalar p=q=1 | A=[[1,−1],[1,1]], A*A=2I; plus sign instead gives off-diagonal 2 | Pass. |
| Product symbol axes | ξ=0,η=1 and ξ=1,η=0 | A=[[0,−1],[1,0]] or I; both squares I | Pass; axis nonsmoothness still needs cutoff. |
| Cutoff ellipticity | t=\|ξ\|²/ρ²≤1/2 | 1−t≥1/2, other χ=1; square lower bound ≥ρ²/2 | Pass. |
| Hilbert tensor norm | Unit modes u,v | ‖u⊗v‖=1=‖u‖‖v‖; product L² norm=1 | Pass. |
| Product connection Laplacian | Modes (k,l) | (1+k²)+(1+l²)−1=1+k²+l² | Pass; missing −1 would give 2 at (0,0). |
| Product graph/H¹ domain | Scalar Dirac factors | Graph weight²=1+k²+l²=product H¹ weight² | Pass; individual graph weights only 1+k² or 1+l². |
| Graded square | Odd matrices anticommuting with grading | For scalar factor values 3,4, D²=25I=9I+16I; graded cross term 12−12=0 | Pass; ungraded sum retains 2D_PD_Q. |
| Residual cutoff error | High mode product eigenvalue λ>R² | L²/H¹ ratio λ^−1/2<1/R | Pass. |
| Modified symbol order bound | Removed region | \|ξ\|≤Cερ; bounded part divided by 〈(ξ,η)〉≤C/R≤Cε | Pass for stated base-derivative estimate. |
| Modified adjoint blocks | P=e^(ix)D_x, mode (3,16), ε=1/4,R=4 | Proposed reverse coefficient 2; true adjoint coefficient 0 | Pass as a negative Check: the repaired text no longer asserts adjoint equality. |
| Fredholm approximation | Finite matrix I+εB, ε‖B‖<1 | Invertible, kernel/cokernel 0; index 0=ind I | Pass for openness principle. |
| Product kernel formula | P:ℂ²→ℂ rank0, Q:ℂ→ℂ² rank0 (point bases) | Even kernel 2·1+1·2=4; odd cokernel1·1+2·2=5; index −1=(2−1)(1−2) | Pass in zero-dimensional rectangular case. |
| Elliptic complex Hodge | Symbol Koszul complex at ξ=e1 | Contraction/wedge anticommutator=I; symbol cohomology=0 | Pass. |
| Zero kernel complement | Zero-dimensional zero operator | Complement=0; Green operator=0 | Pass; no first positive eigenvalue is demanded. |
| Finite free action | Circle rotation by 2π/h | Orbit size h; quotient length2π/h, no stabilizer | Pass. |
| Left action convention | Nonabelian Q, function δ_e | q·(r·δ_e)=δ_(qr)=(qr)·δ_e | Pass; inversion is essential. |
| Covering normalization | Constant f=1, circle h-cover | Pullback norm²=2π=h·(2π/h); normalized norm²=2π/h | Pass. |
| Laplacian transport | Quotient mode e^(ihkx) lifted | Both Laplacians give h²k² times the same function | Pass. |
| H²/domain transport | Invariant circle Fourier modes | Only indices divisible by h; both domain weights (1+h²k²)² | Pass. |
| Closed-form/Friedrichs contract | j=id, q=inner | Representing equation gives A=id; any shift gives same A | Mathematical control passes; unregistered supplier contract R02. |
| Form transport | Same normalized quotient mode | q_X(Jf,Jf)=h²k²‖f‖²=q_Y(f,f) | Pass. |
| Frobenius identification | Q=S3, H=< (12) >, trivial eigenspace | Invariants dimension1; equivariant maps from ℂ[Q/H] dimension1 | Pass. |
| Almost-conjugacy test | Q=S3, H=< (12) >, K=< (23) > | Class counts (identity,transpositions,3-cycles)=(1,1,0) for both | Pass; normalized quotient spectra agree. |
| Wavefront definition | Smooth u=1; δ₀ on ℝ | WF(1)=∅; WF(δ₀)={(0,ξ):ξ≠0}, Fourier transform of δ₀=1 | Pass. |
| Conormal delta | δ(x1) in ℝ² | WF={(0,x2;ξ1,0):ξ1≠0} | Pass; not all covectors over the support. |
| WF frame/cutoff invariance | Multiply δ₀ by smooth a with a(0)=2 | Result2δ₀, same nonempty WF; a(0)=0 gives0 | Pass; equality needs invertible frame. |
| WF closed/conic/projection | δ₀ | Positive scaling retains nonzero fiber; base projection={0}=singular support | Pass. |
| WF sum and conjugation | δ₀+(−δ₀); δ₀ real | Sum WF=∅⊂WFδ₀; conjugation reflects a symmetric fiber | Pass; inclusion not equality for sums. |
| Pseudolocality | P=∂, u=δ₀ | Fourier transform iξ; WF unchanged | Pass. |
| Microlocal ellipticity | P=1−∂², u=δ₀ | WF(Pu)=WF(u); characteristic set empty | Pass. |
| Sobolev WF shift | δ₀ in dimension1 | ∫〈ξ〉^(2s)dξ finite iff s<−1/2; derivative threshold s<−3/2 | Pass: order shift1. |
| Pullback normal set | Inclusion 0→ℝ; submersion (x,y)→x | First normal set all nonzero covectors at0; second empty | Pass; δ₀ restriction excluded, submersion pullback allowed. |
| Pullback covector direction | f(x)=2x, u=δ₀ | f*δ₀=½δ₀; covector map η→2η | Pass; scalar amplitude and covector direction distinct. |
| Pullback composition | f(x)=2x,g(x)=3x | (g∘f)*δ₀=⅙δ₀=f*(⅓δ₀) | Pass. |
| Tensor WF zero factors | δ₀⊗1 on ℝ² | WF={(0,y;ξ,0):ξ≠0}; second zero covector is necessary | Pass. |
| Product criterion | u=v=δ₀; u=1,v=δ₀ | First has opposite ξ and −ξ, criterion fails; second WF(1)=∅ and product=δ₀ | Pass; criterion is sufficient, not claimed necessary. |
| Diagonal restriction failure | δ_(x=y), pullback by x↦(x,x) | Normal covectors (ξ,−ξ) annihilate (v,v):0 | Pass: excluded. |
| Pushforward density | f(x)=2x, u=δ₀ | f_*δ₀=δ₀; test pairing φ(0)=φ(f(0)) | Pass; differs from pullback factor½. |
| Pushforward critical term | Constant f:ℝ→ℝ, smooth compact density integral1 | WF(u)=∅, f_*u=δ₀ with full nonzero fiber | Pass: zero-covector term is indispensable. |
| Pushforward properness | Projection ℝ²→ℝ with u=1 dxdy | Fiber integral∞, map not proper on support | Pass: excluded. |
| Pushforward identity/composition | Point mass δ_x, maps f,g | Both sides δ_(g(f(x))); identity returns δ_x | Pass. |
| Fixed support/cone continuity | Constant map, densities supported in fixed compact C | Output coefficient ∫u is continuous; target cone full fiber if C nonempty | Pass; target cone must use fixed C. |
| Normal topology tensor/product | One factor fixed smooth1 | Product map u↦u, seminorm values identical | Pass on control; full hypocontinuity is source-supported. |
| Source control: Taylor heat-integral sign | Laplacian eigenvalue −1 | Inverse eigenvalue −1; integral of e^(−t) over t>0 is +1 | Source misprint; use negative integral. |
| Source control: Taylor commutator order | p₁=sin x, p₂=ξ², m₁=0,m₂=2 | Leading commutator 2iξ cos x has order1; printed m₁+m₁−1 gives −1 | Source misprint; use m₁+m₂−1. |
| Source control: Taylor matrix bracket | p₁=p₂=ξ(A+sin x B), A=e12,B=e21 | Actual commutator0; reordered expression at x=0 is −iξ diag(1,−1), not order0 | Source error; README's ordered formula avoids it. |
| Source control: Taylor local output order | P=∂, u=1_[0,1], cutoff near0, s=0 | u∈L²; localized Pu=δ₀∈H^−1 but not H⁰ | Source misprint; output order s−m. |
| CoordinateSpace/coordinateDeriv | n=0; n=1, f(x)=x³, x=2 | Fin 0 has no derivative index; empty derivative gives f. At n=1 lengths 0,1,2,3 give 8,12,12,6 | Pass; lists avoid out-of-range coordinates. |
| Mixed derivative order | a(x,ξ)=x²ξ³ at (2,3), one x and one ξ derivative | ∂x∂ξ a=6xξ²=108=∂ξ∂x a | Pass on smooth symbols. |
| Native carrier zero fiber | V=W=0 | Coefficient, every derivative, quantization and both inverse equations are 0=0 | Pass; the identity on the zero space is zero. |
| Borel repeated orders | Orders 0,0,−1,−2,…; terms 1,2,0,… | Sum b=3; remainders at N=0,1,2 are 3,2,0 in orders 0,0,−1 | Pass; strict decrease is not required. |
| Borel compact parameter | t∈[0,1], a₀=t, a₁=2t, later 0; same orders | b(t)=3t; remainders 3t,2t,0; suprema 3,2,0 | Pass; one choice works for all t. |
| Borel limit hypothesis | All orders 0, all terms 0 | Both b=0 and b=1 have order-zero remainders; their difference 1 is not smoothing | Pass: this sequence fails Tendsto atBot; uniqueness needs that hypothesis. |
| Homogeneity parity | a(ξ)=abs ξ, degree 1 in dimension 1 | a(−1)=1 and a(1)=1; a(2)=2. Odd parity would demand −1 at −1 | Valid positive-homogeneous example; add Check in R05. |
| FrequencyCutoff positive model | η(t)=exp(−1/t) for t>0, otherwise 0; χ=η(r²−1)/(η(r²−1)+η(4−r²)) | At r=1,√(5/2),2: 0,1/2,1; denominator positive everywhere | Valid smooth transition; add Check in R05. |
| FrequencyCutoff wrong models | Step at r=3/2; smooth cutoff with peak 2 | Step has endpoint values 0,1 but jump 1; overshoot has supremum 2>1 | Both excluded; separate Checks in R05. |
| Zygmund additional controls | Low-block constant; δ₀ on ℝ with nonzero annular block | Constant norm 1; δ block norm c·2^j, weighted at r=−1 gives c, at r=0 diverges | Supplies the missing controls in R05. |
| Interpolation asymmetric endpoint | Second scalar norm doubled; θ=1/4, z=1 | Complex norm 2^(1/4); reversing endpoints gives 2^(3/4) | Pass; neither equals real-method √2. |
| Besov coefficient index | N=3 unit weighted coefficients | ℓ¹ norm 3; ℓ∞ norm 1 | Pass; q cannot be erased. |
| Weighted-circle Bochner | Density exp(sin x), D=∂, x=0 | D*D=−∂²−cos(x)∂; connection coefficient 1/2; derivative of unit norm 0 versus 1 | Pass; excluded from canonical-density metric conclusion. |
| Product matrix at supplied Check | ξ=3,η=4 | [[3,−4],[4,3]]*A=25I; wrong upper-right +4 gives off-diagonal 24 | Pass. |
| Product dimensions at supplied Check | Factor (kernel,cokernel)=(2,1),(3,2) | Even 2·3+1·2=8; odd 1·3+2·2=7; difference 1 | Pass: equals (2−1)(3−2). |
| Cutoff counterexample arithmetic | ε=1/4,R=4; modes (2,16),(3,16) | 16/65<1/4; 144/265>1/2; radii >8. Cutoffs 0,1; reverse coefficients 0,2 | Pass as a negative Check; no self-adjointness of D_ε is claimed. |
| Nonabelian left action | Q=S₃, q=(12),r=(23), f=δ_e | q·(r·f)=δ_(123); (qr)·f=δ_(123). Using f(qx) gives δ_(132) instead | Pass; action composition, unlike character values alone, detects inversion. |
| S₃ coset character | H=〈(12)〉, K=〈(23)〉 | Both characters on identity/transposition/3-cycle are 3,1,0 | Pass; conjugate subgroups give equal multiplicities. |
| Circle quotient degree four | d=4, j=1 | J factor 1/2; squared norm π/2 on each side; eigenvalue 16 on each side | Pass; factor 1/4 would give norm π/8 on the cover. |
| Form shift independence/zero space | q=inner, j=id, shifts 1,2; H=0 | Graph h=u gives A=id in both shifts; for H=0, dom A={0}, A=0 | Mathematical contract passes; registration remains R02. |
| Supplier cycle control | Edges PDO→CKG and CKG→PDO | Path length 2 returns to PDO; moving core leaves no return along this path | Fail R01; proposed ownership transfer removes the exhibited cycle. |
| Source fixed support control | Constant map, C nonempty compact; u=0 versus integral-one smooth u | Varying-support cone empty versus full target fiber; fixed-C cone full for both | BDH continuity target must use fixed C. |
| Source cutoff support control | f=id on ℝ, C=ℝ | Proper f; χ=1 on C forces supp χ=ℝ, not compact | Source proof needs a cutoff on the relevant compact K, not all C. |

## Not verifiable

- **grubb:** Distributions and Operators, chapter 8. Both university author PDF hosts, web.math.ku.dk and www.math.ku.dk, timed out through the sources service. The author's course page identifies the notes, but their coordinate/global bundle and Fredholm text was not read.
- **grubb_hansen:** Complex powers of resolvents of pseudodifferential operators, Definition 2.1 and §4. Both author PDF hosts timed out. The proposed r=1/λ seminorm convention and frequency-order increase were not certified against the definition. Spectral examples do not resolve this source question.
- **seeley:** Complex powers of an elliptic operator (1967), pp. 288–307. Bibliographic/DOI lookup reached an AMS book landing page without readable text; the service's arXiv search returned HTTP 429. Web search did not establish an accessible legal original. No claim is made to have checked its contour/domain proof.
- **mark_index, mark_riemann:** Thomas Mark's Index Theory and Math 240 Riemannian Geometry are not identified by year/version, exercise or page. Sources-service and author/course searches yielded no identifiable matching text. Their exercise provenance and the uncited jet/Bochner/endpoint claims are not source-certified.
- **pde_discussion:** The cited public Zulip URL was fetched, but pde_discussion line 5 through line 17 contains only the loading/error shell. No discussion content was verified; this is design context, not a mathematical source.
- The exact RQFT5/RQFT6 downstream text was not checked: no RQFT files were supplied and the roadmap is absent from the available main checkout. Ownership was checked against the supplied open heads and accessible board packages; unprovided open files were not sought or certified.
- The blocks marked without locators in the seeded table remain uncertified against an external source even where their mathematics and inputs passed the displayed tests. The finite computations establish witnesses and negative controls, not general proofs.

All nine referenced works/context sources were attempted. The three readable mathematical texts were checked at the listed locators. The unavailable texts and the empty Zulip extraction are collected in needs-references.toml. This review is complete; it is not parked awaiting those texts. No roadmap sources manifest was edited.

## Source issues

- **Misprint** in taylor at I.(1.14), printed p. 5: the source says integrating its positive-time heat semigroup gives the inverse of its nonpositive Laplacian; it should be the negative inverse, since the mode with Laplacian eigenvalue −1 gives integrals +1 versus inverse −1; affects the proof.
- **Misprint** in taylor at I.(2.8), printed p. 8: the source says the commutator order is m₁+m₁−1; it should be m₁+m₂−1; affects a stated result.
- **Error** in taylor at I.(2.9), printed p. 8: the source says commuting matrix-valued full symbols permit the scalar reordered derivative bracket; it should be the ordered derivative-product difference unless the relevant derivative factors commute; affects a stated result.
- **Misprint** in taylor after I.(3.37), printed p. 13: the source says the first localized output term belongs to H^(s,p); it should be H^(s−m,p), using the cited order-m mapping theorem; affects the proof.
- **Misprint** in bdh at Theorem 6.3, preprint printed p. 22: the source says the fixed target cone uses the varying input support; it should be defined using the fixed proper-support set C for continuity on one target space; affects a stated result.
- **Error** in bdh at the proof of Theorem 6.3, preprint printed p. 22: the source says to use a compactly supported cutoff equal to one on C; it should be equal to one near the relevant compact preimage K, since properness permits noncompact C; affects the proof.
