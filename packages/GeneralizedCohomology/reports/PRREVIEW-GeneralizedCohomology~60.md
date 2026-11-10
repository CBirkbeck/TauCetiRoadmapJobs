# Review of GeneralizedCohomology (pull request #1807 at 3f935aa)

**Verdict:** needs changes

## R01 (P2) — The gap-chart supplier requires nonempty fibres

**Location.** `TauCetiRoadmap/GeneralizedCohomology/README.md:2453`: “`PartitionOfUnity.gapTrivialization` is the glued trivialization over V_n”; also the supplier contract at line 301.

**Claim.** G3.5 applies this pinned construction to every numerable bundle, but its signature requires both `Nonempty F` and nonemptiness of every fibre. Neither requirement is stated here. This matters because the roadmap includes empty fibres, including in the theorem at `Suggested.lean:155`. The underlying gap partition works without these requirements; the imported glued chart does not.

**Witness.** `TauCeti/Topology/FiberBundle/GapTrivialization.lean:32` and `:73`, confirmed by elaborating `#check @PartitionOfUnity.gapTrivialization`: both nonemptiness instances are arguments. For ∅ → {*} with fibre ∅ and partition (1), V₁ = {*}, but neither instance exists.

**Repair.** State the supplier's hypotheses exactly. Retain the general numerable-bundle target by treating empty F explicitly: the cover implies the total space is empty, and over each V_n use the unique homeomorphism between the empty source and V_n × F. For nonempty F derive fibre nonemptiness from the covering charts and use the pinned construction. When the bundle is presented as an arbitrary projection, state its transport to the total space of its fibres, since the pinned constructor is on `Bundle.TotalSpace`.

**Repair test.** For the singleton partition, the gap weights are φ₁ = 1 and φ_n = 0 for n ≠ 1. The empty-fibre branch supplies a chart over V₁ = {*} and empty charts elsewhere. For a one-point fibre the nonempty branch supplies the identity chart. Both retain the same cover and exhaustion; no paracompactness or nonempty-fibre restriction is added to the general theorem.

## R02 (P3) — The CP⁰ stage contradicts the skeletal example

**Location.** `TauCetiRoadmap/GeneralizedCohomology/README.md:2781`: “the stages give π₀ Map(CP^m, K(ℤ,2)) = H²(CP^m) = ℤ with bijective restrictions”.

**Claim.** The assertion includes m = 0, where both the group and the first restriction map differ from those displayed. The final answer for CP∞ is correct.

**Witness.** CP⁰ is a point: H²(CP⁰;ℤ) = 0. The first restriction is H²(CP¹;ℤ) → H²(CP⁰;ℤ), namely ℤ → 0, which is not injective.

**Repair.** Say that the stage-zero component set is a singleton, the stages m ≥ 1 have component group ℤ, and the restrictions are bijections only between those positive stages. Keep H¹(CP^m;ℤ) = 0 for every m and the conclusion [CP∞,K(ℤ,2)] = ℤ.

**Repair test.** The component tower is 0 ← ℤ ←id ℤ ←id ⋯; its limit is ℤ. The π₁ tower is identically 0, so its lim¹ is 0. This also works for the actual skeletal filtration, which repeats each CP stage in the next odd dimension.

## R03 (P3) — G3.8's new constructions lack discriminating Checks

**Location.** `TauCetiRoadmap/GeneralizedCohomology/README.md:2675`: the three Checks are the connective cover of KU, the connective cover of HA, and “The map `τ_(≥k)E → E` is an isomorphism on π_n for n ≥ k”.

**Claim.** The last bullet repeats the defining property at lines 2577–2578. The first two test connective covers only. There are no discriminating Checks for the separately defined spectral homotopy limit, upper truncation or commutative zeroth Postnikov construction, and fewer than three for the connective cover. The requested rule is per definition, not three bullets per section.

**Witness.** Replacing holim by the ordinary degreewise inverse limit, or assigning P0R = R, changes neither of the first two examples. The third bullet gives no instantiated value to distinguish any model.

**Repair.** Replace the repeated law with a computed example, and supply at least three discriminating Checks for each construction. For example:

- Holim: the constant identity tower HA gives HA; the zero-bonding tower HA gives 0; the ×2 tower Hℤ has π₀ = 0 and π₋₁ = ℤ₂/ℤ ≠ 0. The last excludes an ordinary-limit replacement.
- Cover/truncation: for E = Σ⁻¹Hℤ ∨ Hℤ ∨ ΣHℤ and k = 0 the two sides are Hℤ ∨ ΣHℤ and Σ⁻¹Hℤ; for k = 1 they are ΣHℤ and Σ⁻¹Hℤ ∨ Hℤ; for k = −1 they are E and 0. Retain the KU and HA examples as well.
- Structured P0: P0S ≃ Hℤ with unit 1 ↦ 1; P0(H𝔽₂) ≃ H𝔽₂; for the derived free connective commutative ring on S, P0R ≃ Hℤ[t] and maps to Hℤ are the discrete choices t ↦ a, a ∈ ℤ.

These values test the directions, cutoff, lim¹ shift, ring unit and free-ring mapping property. They belong in the README, not as extra Lean declarations.

## R04 (P3) — Use the prescribed layer headings

**Location.** `TauCetiRoadmap/GeneralizedCohomology/README.md:478`: “## G1. Reduced, relative and multiplicative theories”; likewise lines 732, 2252, 2794 and 3461.

**Claim and witness.** The requested README form uses `## Layer k: <title>`. All five top-level build headings instead use `## Gk.`. The subsection identifiers can remain G1.1, G2.1, etc.

**Repair.** Rename the five headings to `## Layer 1: …` through `## Layer 5: …`, retaining their titles and subsection identifiers. Preserve old heading anchors explicitly if any external link uses them. This is a presentation repair; it changes no dependency or mathematical instance.

## Verified sound

This was a full review of the two files at the specified head, including unchanged passages. The six findings of the preceding review were checked first. The following records tests and source support, not a claim that elaboration proves the mathematics.

### Disposition of the preceding review

| Previous finding | Head passage checked | Disposition |
| --- | --- | --- |
| R01: missing homotopy excision | `Suggested.lean:134`, “the inclusion of pairs (A,C) → (X,B)” in its docstring; README 1051–1056 names the actual theorem and the three small definitions. | Repaired. Native relative homotopy sets are used; m = n = 0 asserts nothing. The missing-suspension explanation now applies only to Freudenthal. |
| R02: unconditional integral Thom comparison | README 3737: “bundles ξ_i carry HA-orientations compatible with the stabilization isomorphisms”. | Repaired. The Check at 3749 distinguishes H₀(MO;ℤ) = ℤ/2 from H₀(BO;ℤ) = ℤ, and includes the valid mod-2 and oriented cases. |
| R03: Hatcher refinement proof overgeneralized | README 2446–2454 replaces that proof by the pinned “countable refinement by gaps”. | The source-proof defect is repaired. The import's missing nonemptiness hypotheses are the separate R01 above; the gap partition itself does remove the second appeal to paracompactness. |
| R04: eight separate Bott equivalences | README 3587: “eightfold stable Bott equivalence ℤ×BO → Ω⁸(ℤ×BO)”. The other three affected passages agree. | Repaired; TopologicalKTheory T7.1 actually supplies this one map and coefficient ring. |
| R05: configuration, Hermite and MU checks | README 4481–4483 computes “π₀ = ℕ²”, the three Hermite functions, and the MU → Hℤ map. | Repaired for these three omissions. Segal projection and fold are now distinguished; their maps are (a,b) ↦ (a,b) and (a,b) ↦ a+b. |
| R06: missing spaces/notation | The affected expressions now read “contribute +1”, “level 0”, “degree −8”, “unit +1”, and use the specified negative generator consistently. | Repaired for the listed occurrences; no repeated finding. |

The earlier settled ownership finding is not re-raised. GeneralizedCohomology is already on main, and the description expressly keeps its generic foundations here; an open new roadmap must cite that earlier owner. It cannot be repaired by making this existing roadmap depend on HigherToposTheory or OperatorKTheory.

### Gate, elaboration, signatures and scope

The recorded push gate passes every reported check, including the targeted module build. I independently elaborated `TauCetiRoadmap/GeneralizedCohomology/Suggested.lean`: exit 0, exactly seven `sorry` warnings and no other warning or error. The file has seven theorem declarations and three small definitions/abbreviations, one module docstring, `import Mathlib` and five used individual Tau Ceti imports; no sorry'd data, `lemma`, `set_option` or roadmap import.

I put `#check @name` for all ten actual declarations into a scratch copy and elaborated it. No needed binder disappeared. In particular, homotopyExcision retains Hausdorffness, the CW structure, both connectivity bounds and the intersection hypothesis; numerableFiberBundle_hurewicz retains its chart family and subordinate partition; homologyComparison retains both extraordinary Eilenberg–Steenrod instances and the arbitrary abelian target; rationalHurewicz retains hconn. Its k = 0 natural-number bounds are 0, so no positive-degree assertion leaks through truncated subtraction. The worker's larger declaration count includes prose tokens; the declaration inventory here is from the Lean file itself.

A separate scratch copy tried `rfl`, `infer_instance`, a closing `simp`, and `assumption` on each of the seven sorried theorems. All seven failed. I also compared the library-near-match leads at the pins: elementary cofibration/fibration facts do not construct the model structure, an adjunction does not establish its unit's weak equivalence, relative-map functoriality does not prove excision, and finite-group torsion lemmas do not supply finiteness of sphere homotopy groups. No padding theorem was found.

Independent dependency-check output:

```text
depcheck: 229 roadmaps, 2151 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. I read all 43 `*Needs:*` entries and the five layer dependency paragraphs. In particular, the axiomatic telescope construction precedes Brown/comparison; G4.0a precedes G4.6 and stable Spin; G5.0's classifier precedes its inverse and Bott supplements; none uses ABS or String coefficients to prove Bott. No declared supplier gaps were present. The diff outside GeneralizedCohomology and the thirteen sibling folders authorized in the brief is empty. No worktree file was changed.

### Headline inventory

| Headline | Acceptance-file treatment |
| --- | --- |
| Kan–Quillen model structure; realization/Sing comparison | `kanQuillen_modelCategory`, `sSetTopAdj_unit_weakEquivalence`; the counit remains CharacteristicClasses C1.2b's. |
| Homotopy excision | `homotopyExcision`, on native based pairs and CW subcomplexes, with the three small definitions it needs. |
| Hurewicz–Dold for numerable bundles | `numerableFiberBundle_hurewicz`; empty fibres are allowed and the theorem is true there. R01 concerns a different imported construction. |
| Arbitrary-CW comparison | `homologyComparison`; the Dᵒᵖ instance has the cohomological boundary and product axiom. |
| Rational Hurewicz | `stableStem_isOfFinOrder` and `rationalHurewicz`; the full stable spectral isomorphism is named as unavailable. |
| Stable spectral model/category; sequential comparison | Named in the module docstring: stable equivalences/localization and sequential spectra are missing. |
| Freudenthal | Named: reduced topological suspension and its homotopy homomorphism are missing. |
| Brown representability | Named: the general CW wedge interface is missing; the native wedge carrier itself is acknowledged. |
| Milnor sequence | Named: the telescope and its actual connecting map are missing, despite the existing algebraic lim/lim¹. |
| Leray–Hirsch/Thom | Named: generalized multiplicative theories, orientations and Thom-space carriers are missing; ordinary singular Thom classes are distinguished. |
| Spanier–Whitehead duality | Named: the stable homotopy category is missing. |

### Seeded source verification

All 15 requested sample sections were inspected against the cached legal texts, including hypotheses and printed-page locators. No additional README locator is labelled unverified; the phrase about an “unverified cofibrancy assumption” is a warning against an invalid proof step, not a source-status flag. References below identify the extracted text by source key and line. Numbering is that of the linked versions, including the 1998 HSS preprint and Schwede's book project.

| Sample | Text inspected and scope of support |
| --- | --- |
| G1.1 | HatcherAT line 594, Chapter 0 p.10, wedge CW cells; line 6977, §2.3 pp.160–161, homological axioms and sums; line 8747, §3.1 p.202, cohomological products. MayConcise line 5802, Ch.18 §1 p.137, pair axioms. The dimension axiom is deliberately omitted, not silently assumed. |
| G1.3 | HatcherAT line 17236, §4.3 p.398, the pair Puppe sequence and 0-cell basepoint; MayConcise line 2478, Ch.8 §4 p.59, mapping cones of general based maps; line 6220, Ch.18 §3 p.147, ordered restriction difference. The arbitrary-space extension is a target, not attributed wholesale to the pair theorem. |
| G1.4 | CohenBMH line 11141 and line 11151, Definitions 10.16–10.17 p.309: spectral cross product and diagonal cup. Commutativity requires commutative multiplication; the README puts graded symmetry into its multiplicative-theory axioms. |
| G1.5 | HatcherAT line 20117, Proposition 4I.1 p.467, suspension splitting for CW inputs. The preceding-group split is essential to injectivity; merely vanishing on the wedge would not give uniqueness. |
| G2.5 | HatcherAT line 15681, Theorem 4.23 and Corollary 4.24 p.360: connected intersection, relative connectivity and the sharp excision/suspension bounds. HSS line 1981, Theorem 4.3.2 p.42: symmetric/sequential Quillen equivalence. SchwedeSymSpec line 926, Example 1.18 pp.19–20: the real/imaginary loop-coordinate construction. General m and commutative-model transport are explicitly additional targets. |
| G2.6 | HSS line 2904 and line 2915, Definition 5.6.1/Proposition 5.6.2 p.61; line 1088, Example 3.1.10 p.23. These support both semistability and the infinite-direct-sum counterexample. |
| G2.9 | MayConcise line 5435, Ch.16 §5 p.128, bar construction, including the nondegenerate identity condition at line 5463; line 8532 and line 8571, Ch.23 §8 pp.200–201, numerable classification and comparison. HatcherVBKT line 905 and line 988, Propositions 1.11/1.14 pp.23/25, complex/oriented clutching. Disconnected-group conjugacy is retained separately. |
| G2.10 | MayConcise line 2181, Ch.7 §4 theorem p.51, numerable local Hurewicz fibrations. The local trivializations provide product fibrations, with no compact-base or nonempty-fibre requirement. Raw mapping-path objects are imported, not re-attributed to May. |
| G3.3 | HatcherAT line 9415, Proposition 3.17 p.217. The finite-dimensional proof and the telescope passage at line 9437 support the stated route; arbitrary dimension is not inferred just from finite skeleta. The extension to arbitrary abelian targets uses the same exact-sequence argument. |
| G3.8 | SchwedeSymSpec line 15660, Theorem 8.1 p.295, right-adjoint connective covers; line 15745, Theorem 8.3 pp.296–297, left-adjoint Postnikov sections and convergence without boundedness. The structured commutative refinement is separately constructed, not claimed to be part of that additive theorem. See the source misprint below and R03 for Checks. |
| G4.1 | HatcherAT line 18645, Theorem 4D.1 p.432, and line 19006, Theorem 4D.8 p.441: fibre-basis classes and the relative ordinary theorem. Ordinary finite generation per degree does not automatically give a finite total basis for a nonconnective theory; the README explicitly assumes the latter and gives its own numerable/Milnor extension route. |
| G5.0 | HatcherVBKT line 98, Introduction p.1: KO sphere coefficients (ℤ/2,ℤ/2,0,ℤ,0,0,0,ℤ). Together with the explicitly constructed 3-connected cover, these give the displayed BSpin table. The text is cited for coefficients, not for the new coherent telescope construction. |
| G5.2 | CohenBMH line 12270, Theorem 10.46 p.339: Atiyah duality for a compact boundaryless smooth manifold and its normal Thom space. The README retains compactness and uses actual normal bundles, without assuming a framing. |
| G5.3 | SchwedeSymSpec line 803, Examples 1.16–1.18 pp.17–19: compatible Thom spaces, actions and multiplication; line 926 gives the MU index adjustment. The arbitrary-diagram version is built with stabilization isomorphisms and a cofinal rank sequence. Its homology claim now explicitly requires compatible orientations. |
| G5.4 | HSS line 3164, Example 6.2.3 p.67, MO as a symmetric Thom ring; SchwedeSymSpec line 803 and line 896, Examples 1.16–1.18 pp.17–20, oriented/spin and complex/quaternionic models and their loop-coordinate correction. These are consistent with the low-rank distinctions and the supplied Bott coefficient normalization. |

Additional headline checks: SchwedeSymSpec line 15467 (Theorem 7.4 p.292, finite/compact/strongly dualizable spectra), line 13539 (Lemma 5.6 p.257, the Milnor sequence); HatcherSSAT line 1946 (Theorem 1.21 p.32, finite sphere homotopy outside the Hopf degree), line 2024 (Proposition 1.22 p.34, stable rational Hurewicz). HoveyGeneralSpectra line 1527 and line 1569 (Definition 7.7 and Theorems 7.8–7.11) supply the general sphere-module stable model under the stated cofibrancy assumptions. ShipleyConvenient line 253, line 265 and line 339 (Proposition 3.1, Theorem 3.2 and Proposition 4.1) distinguish positive module and commutative-algebra models and their underlying cofibrations. Source availability limits are listed below.

### Pinned-library and ownership audit

The following are concrete pinned declarations opened, rather than names inferred from search results. The table records 20 groups of evidence. In library paths, `Mathlib/` and `TauCeti/` denote the respective pinned repositories.

| Pinned file and line | What its definition or theorem supplies; boundary checked |
| --- | --- |
| `Mathlib/AlgebraicTopology/SimplicialSet/CategoryWithFibrations.lean:41`, `:49`, `:72`, `:78` | Boundary/horn generating classes and mono/RLP classes. These are not a `ModelCategory SSet` instance. |
| `TauCeti/AlgebraicTopology/SimplicialSet/WeakEquivalence.lean:61`, `:72` | Realization-detected weak equivalences; two-out-of-three and retract stability are already supplied. |
| `Mathlib/AlgebraicTopology/EilenbergSteenrod.lean:50`, `:69`, `:214`, `:297` | Pretheories, boundary-compatible morphisms, arbitrary coproducts, and extraordinary axioms. No dimension axiom or multiplication is part of the extraordinary class. |
| `Mathlib/Topology/CWComplex/Classical/Basic.lean:135`, `:659` | Cell data and closed subcomplexes. The CW structure alone does not impose Hausdorffness; both CW headline signatures explicitly add it. |
| `TauCeti/Topology/Category/TopPair.lean:48`, `:143` | Nested-subset pairs and maps. The acceptance-file adapters only add the chosen basepoint and specialized inclusions. |
| `TauCeti/AlgebraicTopology/Homotopy/Relative/Basic.lean:302`, `:356`, `:364`, `:376` | Relative cube quotient and induced maps. `Fin i` means relative degree i+1, including the degree-one pointed-set case. |
| `TauCeti/Topology/Homotopy/HurewiczFibration/Basic.lean:58`, `:80`, `:114` | Continuity plus HLP for all test spaces in the chosen universe; product projections are already fibrations. Numerable gluing is additional. |
| `TauCeti/AlgebraicTopology/Homotopy/Hurewicz/Basic.lean:652` | Additive form of π_(n+1) → Hom(R,H_(n+1)(X;R)). This is a homomorphism, not a rational-isomorphism theorem. |
| `TauCeti/Topology/PartitionOfUnity/Gap.lean:66`, `:167`, `:217`, `:416` | Gap, its positivity and continuity, and the cardinality-weighted partition. Empty outside-index supremum is zero. |
| `TauCeti/Topology/FiberBundle/GapTrivialization.lean:32`, `:73`, `:78`, `:118`, `:125` | Chart gluing, exact positive base sets, covering and local finiteness, with the nonemptiness assumptions exposed by R01. |
| `Mathlib/Topology/FiberBundle/Basic.lean:187`; `Mathlib/Topology/FiberBundle/Trivialization.lean:376` | Neither native bundle nor chart definition imposes nonempty model fibre. Thus R01 is a real missing branch, not a contradictory input. |
| `TauCeti/AlgebraicTopology/Homotopy/PointedHomotopyCat.lean:122` | Pointed spaces and pointed-homotopy classes, not a CW-only carrier. |
| `TauCeti/Topology/WedgeSum.lean:78` | Quotient wedge, including a point for an empty family; it does not bundle the general CW structure. |
| `TauCeti/AlgebraicTopology/Spectra/SymmetricSpectrum.lean:92` | Modules over the symmetric sphere monoid; the point-set carrier and function spectrum exist. Stable equivalences are not defined there. Searches of the spectral modules found no completed stable-model theorem. |
| `Mathlib/Geometry/Manifold/Instances/Sphere.lean:90`, `:118`, `:136` | Stereographic formulas contain the factors 2 and 4. At w = 0 the inverse derivative on the orthogonal complement is identity, as G4.0 claims. Using the differently normalized textbook formula would wrongly produce a factor 2. |
| `Mathlib/Geometry/Manifold/WhitneyEmbedding.lean:132` | Smooth Euclidean embedding of a compact Hausdorff manifold with injective differential; the surrounding finite-dimensional manifold assumptions are retained in G5.2. |
| `TauCeti/Geometry/Manifold/TubularNeighborhood/Existence.lean:53` | Whole normal bundle diffeomorphic to a prescribed open neighbourhood for boundaryless finite-dimensional models and Hausdorff second-countable target; no closed-image assumption. |
| `TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/DiscSphere.lean:56` | Closed normal discs/spheres of positive smooth radius when the source is compact. |
| `TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Existence.lean:69` | Smooth fibre metrics with finite-dimensional fibres/model, Hausdorff σ-compact base and the smooth-vector-bundle hypotheses. |
| `TauCeti/Topology/VectorBundle/EulerClass.lean:245` | Singular-cohomological Thom classes, including finite-dimensionality in the predicate. This does not already supply generalized E-orientations. |

Object searches used `roadmaps grep` and `roadmaps show`, the main content checkout, the named open checkouts and the board packages. The objects searched included homotopy excision, Kan–Quillen/Bergner models, spectral homotopy limits, stable Spin classifiers, quaternionic Hopf sphere comparisons, real Hilbert functional calculus and Spanier–Whitehead duality. No different roadmap's fully qualified Lean declaration name was introduced by these ten declarations.

Resolved supplier evidence includes:

| Supplier, repository-relative file | Resolved content |
| --- | --- |
| `TauCetiRoadmap/AlgebraicTopology/README.md:539` and Stages 2–5, 8 | The explicit inventory at 539–560 points to the disk, pair, realization, EM and loop interfaces. Stage 4.4 begins its quotient/suspension material near 869; compact generation is at 1137; realization/CW approximation near 1255–1307; Stage 5's filtration and Serre material near 1356 and 1484; the manifold-duality block is Stage 6; Stage 8 begins at 2476. These remain the ordinary owners. |
| `TauCetiRoadmap/TopologicalKTheory/README.md:769`, `:1421`, `:1792` | Oriented stable Whitney sum, the inverse construction, and the one eightfold Bott equivalence. The finite-stage ε_k normalization is retained by G5.0. |
| `TauCetiRoadmap/CharacteristicClasses/README.md:449`, `:830`, `:953`, `:991`, `:1184`, `:1449`, `:1469`, `:1807` | Numerable joins, realization counit, torus/EM models, ordinary Thom/Gysin and fibrewise embedding, and Spin obstruction. G2.9 extends the group generality, while G4–G5 construct the generalized theory. |
| `TauCetiRoadmap/ComplexKahlerGeometry/README.md:2321` | K7.1 projective charts/orientation; its legacy K numbering is explicitly mapped at line 554. |
| `TauCetiRoadmap/ComplexManifolds/README.md:172`, `:197` | Milestones 1–2, restriction of scalars and canonical real orientation. |
| `TauCetiRoadmap/SmoothBundlesConnections/README.md:421` | B1.4 free proper quotients, principal projections and submersions. |
| `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:881`; `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:356`; `TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md:205` | Real Clifford/Spin data; closed-subgroup Lie structures; Haar normalization and averaging, respectively. |
| `TauCetiRoadmap/SpinGeometry/README.md:450`, `:470`, `:896`, `:944` | Scalar trace and its complexification, explicitly consumed by G5.5; finite Spin frame/cover data. It is not cited as supplying the new stable stabilization maps. |
| `TauCetiRoadmap/GeometricTopology/README.md:788`, `:974`, `:7887` | Collars, uniqueness of tubes, and smooth triangulations. The native existence of tubes is not replanned here. |
| `TauCetiRoadmap/HilbertModules/README.md:179`, `:325`, `:356`, `:705` | H2, H4–H6: adjointable/compact maps, stabilization, continuous fields and regular closed operators. G5.5's real and mixed-Clifford comparisons are explicitly additional. |
| `TauCetiRoadmap/CStarAlgebras/README.md:1110`; `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md:1099` | C5 tensor/cone infrastructure and SA-D15–D17 closed/dense range and nonreal resolvents. |

The two main-roadmap shape examples read were SmoothBundlesConnections and SpinGeometry; GeometricTopology's collars/tubes block was also read. The target retains its API lists, Examples and Dependencies instead of replacing them with a theorem catalogue.

The supplied overlap report concerns this head: no dropped cited IDs, no IDs available only in an open revision, and no unmapped dropped IDs of this folder. Its three conflicting shared-folder heads are #1187, #1808 and #1854. The PR description's shared-folder ordering explicitly says #1807 → #1808 → #1854 → #1187, with each successor rebased, so these are not unannounced conflicts. A fresh unqualified `roadmaps overlaps` also inspected main's older text and found old anchors there; those line numbers and passages do not occur in this head and were not promoted to findings.

The close open roadmaps were checked by object. StableHomotopyKTheory #1227 has an explicit GeneralizedCohomology supplier section for G2–G3 and treats its own later spectral/K-theory comparisons as extensions. TangentialBordism #942, `TauCetiRoadmap/TangentialBordism/README.md:135–138`, leaves universal Thom spectra to this roadmap and owns geometric bordism/Pontryagin–Thom. StringOrientation #948, `TauCetiRoadmap/StringOrientation/README.md:204` and `:312`, consumes the stable Spin/Hopf normalization. HigherToposTheory #1901 still claims Kan–Quillen and Bergner at `TauCetiRoadmap/HigherToposTheory/README.md:37–39` and its F2/F3 targets. This is the previously settled external ownership collision: the existing main roadmap remains the owner, as the description states; the new roadmap must cite it. It is not an upward supplier of this folder. Shared-folder revisions are handled by the stated rebase order, not treated as new suppliers.

### Adversarial computations

The 106 rows cover all 43 numbered target sections, their principal constructions and identities, all seven Lean headlines, the three kept definitions, and every mathematical finding above. A “pass” means the stated hypotheses and convention survive the displayed instance; it is not a substitute for the planned proof. Algebraic cases irrelevant to these topological statements (DVR ramification, inseparability, fans) were not invented as artificial tests. Empty spaces/fibres, zero coefficients, degrees 0/1/2, nonabelian groups, infinite sources and sign changes provide the applicable boundary tests.

| Statement / convention | Instances tried | Values on the two sides or competing models | Result / change |
| --- | --- | --- | --- |
| G1.1 reduced theory and empty wedge | Hℤ, empty family; two S¹ summands | H̃¹(*) = 0 = empty product; H̃¹(S¹∨S¹) = ℤ² = ℤ×ℤ. | Pass; a direct-sum cohomology axiom would fail for infinite families. |
| G1.1 arbitrary wedge and homology | Countably many S¹ | H̃¹ = ∏ℕℤ, containing (1,1,…); H̃₁ = ⊕ℕℤ, which excludes that vector. | Pass; sum/product are distinguished. |
| G1.1 native axioms and theory morphisms | Identity Hℤ; zero theory | Boundary square is δ = δ; all four extraordinary axioms hold with groups 0 in the zero theory. No dimension axiom is required. | Pass; no vacuous coefficient nonzero assumption. |
| G1.2 reduced/unreduced and pairs | ∅, *, S⁰; (D¹,S⁰) | 0 = H̃*(∅₊); H⁰(*) = ℤ⊕0; H⁰(S⁰) = ℤ² = ℤ⊕ℤ; H¹(D¹,S⁰) = ℤ = H̃¹(S¹). | Pass. |
| G1.3 mapping cones | f = id S¹; S¹ → * | C_id is contractible, reduced groups 0; C_(S¹→*) = S², H̃² = ℤ. | Pass; the cone is determined by the actual map. |
| G1.3 ordered MV | Two arcs covering S¹; cover (X,∅) | (a,b) ↦ (a−b,a−b), cokernel ℤ = H¹(S¹); empty-overlap connecting map 0. | Pass. |
| G1.3 cover swap | Generator represented by (1,0) modulo diagonal | Swapping the ordered restriction difference negates the connecting class: +1 ↦ −1. | Pass with the stated normalization. |
| G1.4 external product and twist | S¹∧S¹; S²∧S² | Generator×generator = sphere generator; twist degrees −1 = (−1)¹ and +1 = (−1)⁴. | Pass. |
| G1.4 suspension and unit | Degree-one a and suspension of 1; coefficient 1, zero ring | a×σ1 = −σ(a×1); 1·a = a; over the zero ring both sides are 0. | Pass. |
| G1.5 unique smash lift | X=Y=S¹ | H̃²(T²)=ℤ, H̃²(S¹∨S¹)=0; collapse pullback ℤ→ℤ is degree +1. | Pass; uniqueness also uses splitting in the preceding degree. |
| G1.5 zero-dimensional/disconnected input | X=S⁰; Y=S¹ | H̃¹(X×Y)=ℤ²; wedge restriction projects to one ℤ; its kernel is the other ℤ=H̃¹(X∧Y). | Pass. |
| G1.5 compactification | U=V=ℝ; U=∅ | (ℝ²)⁺ = S² = S¹∧S¹; ∅⁺ is a point and its smash is a point. A disjoint added point leaves ℝ² noncompact. | Pass. |
| G1.6 boundary signs | (D¹,S⁰), a=1; (S¹×D¹,S¹×S⁰), a=x | δ(1·e)=δe; δ(x×e)=−x×δe, while δe·x=−x·δe. | Pass in both left and right action identities. |
| G1.7 sphere shift | Hℤ, n=0,1,2; KU on S¹ | H̃^q(Sⁿ)=ℤ if q=n and 0 otherwise; KU^q(S¹)=KU^q(*)⊕KU^(q−1)(*). | Pass, including S⁰. |
| G1.7 circle multiplication | Augmentation-zero generator ε on S¹ | ε²=0; (a+bε)(c+dε)=ac+(ad+bc)ε in even coefficient degrees. | Pass; no spurious ε² term. |
| Cone/ordinary suspension convention | Two-term cone on the identity of ℤ | Acyclic cone has differential ±1; changing the cone-pair boundary changes σ to −σ. Moving suspension past degree n contributes (−1)^n, giving signs +,−,+ for n=0,1,2. | Pass with the README's fixed comparison; maps, not only abstract groups, are specified. |
| G2.1 Kan–Quillen classes | ∂Δ[1]→Δ[1]; Δ[1]→Δ[0] | First map: two components → one, so cofibration but not weak equivalence. Second: contractible → point is weak equivalence; Δ[1] is not Kan. | Pass; not all weak equivalences are fibrations. |
| G2.1 realization unit headline | Δ[0], Δ[1], simplicial circle | π₀ unit is 1→1; interval higher groups 0→0; circle π₁ map ℤ→ℤ is identity under realization comparison. | Pass; triangle identity gives the proof route once counit is supplied. |
| G2.2 sphere modules/block actions | Sphere levels 0,1,2 | S₀=S⁰, S₁=S¹, S₂=S²; transposition on S₂ has degree −1. Unit action has degree +1. | Pass; trivial permutation actions would fail. |
| G2.3 stable equivalences | λ:F₁S¹→S; Hℤ→0 | λ is stable, with true π₀ ℤ→ℤ; Hℤ→0 sends ℤ→0 and is not stable. | Pass; stable equivalence is not raw-colimit isomorphism. |
| G2.4 shifts/triangles | ΣHℤ; cofiber of 2:Hℤ→Hℤ | π₁ΣHℤ=ℤ=π₀Hℤ, π₀ΣHℤ=0; cofiber has π₀=ℤ/2, π₁=ker2=0. | Pass; homology/cohomology grading and triangle shift agree. |
| G2.4 derived products and modules | ∏Hℤ; unit sphere algebra | π₀∏Hℤ=∏ℤ, not ⊕ℤ; S-modules are spectra and the action of 1 is identity. | Pass. |
| G2.5 suspension adjunction | X=S⁰, E=Hℤ and Σ⁻¹Hℤ | [Σ∞S⁰,Hℤ]=ℤ=π₀Hℤ; [S,Σ⁻¹Hℤ]=0. Shifting source once gives π₁Hℤ=0. | Pass. |
| G2.5 Freudenthal | X=S¹ (k=1); X=S² (k=2) | π₁S¹=ℤ→π₂S²=ℤ is onto; π₂S²=ℤ→π₃S³=ℤ is iso; π₃S²=ℤ→π₄S³=ℤ/2 is onto, not injective. | Pass; endpoint is not overclaimed. |
| `subsetPair`, `subsetPairInclusion` | s=t={*}; empty s; identity inclusion | Based pair is (*,*), all relative sets singleton; no a:s exists when s=∅; identity sends the relative constant class to itself. | Pass; basepoint stays in s and target is (t′,s′). |
| `IsConnectedPair` | (D¹,{0}); (S¹,{*}); (two points,one point) | First is m-connected for every m; second is 0-connected but π₁=ℤ prevents 1-connectivity; third fails the path condition already at m=0. | Pass; π₀ coverage is not lost. |
| `homotopyExcision` | m=n=0; all spaces a point; two discs in S² | Bounds i+1<0 or =0 are false; point maps are singleton bijections. For disc pair C=S¹, m=n=1 and relative degree 2 gives ℤ→ℤ, onto. | Pass; connected intersection excludes the disconnected circle-decomposition trap. |
| G2.5 sphere stem/indices | n=0,1; complex rank1; quaternionic rank1 | π₀S=ℤ, π₁S=ℤ/2; real degrees of Thom fibres are 2 and 4, so loop corrections are 1 and 3. | Pass; rank jumps are not single suspensions. |
| G2.6 semistability | F₁S¹, S, Hℤ | Naive/true π₀: ⊕ℕℤ versus ℤ; ℤ versus ℤ; ℤ versus ℤ. Hℤ's other stable degrees are 0. | Pass. |
| G2.7 HA/represented theories | A=0, ℤ, 𝔽₂; S⁰ | π₀HA=A and π_n=0 for n≠0; H_A⁰(S⁰)=A², reduced value A. A=0 gives the zero spectrum. | Pass; ordinary and reduced values differ. |
| G2.8 Γ/group completion | Finite sets, π₀=ℕ; zero input | Group completion ℕ→ℤ sends n↦n; zero monoid gives 0. Multiplication of cardinalities sends (2,3)↦6. | Pass; additive completion alone would not specify multiplication. |
| G2.8 free commutative algebra/localization | Free algebra on S; invert 2 in Hℤ | π₀ is ℤ[t]; π₀ after inversion is ℤ[1/2], with 2·(1/2)=1. | Pass; integral coefficients have not been silently rationalized. |
| G2.9 classifiers | G=1, ℤ, S¹ | B1≃*, Bℤ≃S¹ with π₁=ℤ, BS¹≃CP∞ with π₂=ℤ and π₁=0. | Pass; treating S¹ as discrete gives the wrong homotopy degree. |
| G2.9 clutching and gauge | G=S₃, C₂; bundle over S¹; trivial bundle over * | Unframed classes are 3 conjugacy classes for S₃ and 2 for C₂; actual gauge transformations over * number 6 and 2. | Pass; gauge maps, components and conjugacy orbits are distinct. |
| G2.10 mapping fibres | id S¹; *→S¹; ∅→S¹; X→* | Fibres respectively contractible, ΩS¹ with π₀=ℤ, empty, and X. | Pass; contraction is not asserted over the target. |
| Hurewicz–Dold headline | Empty fibre; Möbius line; product projection | Empty initial-lift data force empty test source; lift exists uniquely. Product lift (a,t)↦(h(a,t),v(a)) works. Möbius fibre is ℝ despite global twisting. | Pass without compactness or global triviality. |
| G2.11 enriched/diagram models | Discrete one-object category; walking isomorphism | Inclusion has singleton→singleton mapping equivalences and is essentially surjective, but object counts 1→2. | Pass; Dwyer–Kan equivalence is not objectwise isomorphism. |
| G2.11 Joyal/core/marked fibrations | N[1]; groupoid BC₂ | Core of N[1] has two points and no nonidentity edge; core of BC₂ has the nonidentity involution. Over a point Cartesian edges are precisely these equivalences. | Pass. |
| G2.11 Joyal versus Kan weak equivalence | Δ[1]→N(walking isomorphism) | Both realizations contractible, but source has 1→0 Hom empty and target has one inverse arrow. | Pass; not a categorical equivalence. |
| G2.11 straightening/variance | Identity [1]→[1] | Both fibres are *, and transported map *→* is identity. For opposite variance the base arrow is reversed. | Pass for the stated coCartesian/Cartesian conventions. |
| G2.11 coherent pushout | Two intervals glued end-to-start | Simplicial pushout has 2 nonidentity edges; its ∞-categorical colimit Δ[2] has the additional composite 0→2. | Pass; ordinary pushout is not used without localization. |
| G2.11 stability | Spectra; pointed spaces at S⁰ | Σ⁻¹ΣS=S; S⁰→ΩS¹ has 2 source components versus ℤ target components. | Pass; pointed spaces are not declared stable. |
| G2.11 quotients | D=C; D=0; finite spectra modulo rationally zero ones | Quotients 0 and C; π₀ End(S) after killing torsion is colim(ℤ→2ℤ→3ℤ→⋯)=ℚ. | Pass; integral endomorphisms do not survive unchanged. |
| G2.11 Ind/idempotents | Zero stable category; even-Euler finite spectra | Ind(0)=0; χ(S)=1 excludes S from the latter C, while χ(S⊕ΣS)=0 and S is a retract. | Pass; compact need not mean originally representable. |
| G2.11 monoidal/LM/relative adjoints | Unit algebra S; identity base map | LM fibre over S is Mod_S=Sp; extension/restriction along id_R are both identity and unit/counit act as 1. | Pass on unit and variance. |
| G3.1 Brown and disconnected extension | H̃¹ on S¹; H̃⁰ on S⁰ | [S¹,K(ℤ,1)]=ℤ; [S⁰,ΩK(ℤ,1)]=ℤ, whereas a connected representing space would give a singleton on S⁰. | Pass; loop extension is necessary. |
| G3.2 representing spectrum/operations | Hℤ; identity operation; ×2 | Degree-zero maps Hℤ→Hℤ act by n↦n or n↦2n on ℤ; ordinary representing levels K(ℤ,n) have π_n=ℤ. | Pass; maps are not fixed by bare group isomorphisms. |
| G3.3 comparison headline | Identity Hℤ; ×2; infinite disjoint points | Identity induces id on ℤ and ⊕ℤ; ×2 fails the point-isomorphism hypothesis already on ℤ. | Pass, including arbitrary cell sets. |
| G3.3 opposite target | Cochain boundary on (D¹,S⁰) | Homology arrow H_i(X,A)→H_(i−1)(A) becomes H^(i−1)(A)→H^i(X,A); ℤ²→ℤ is the endpoint difference. | Pass; products replace coproducts in the opposite category. |
| G3.4 Milnor and tower sign | Constant ℤ tower; ×2 tower | δ(a)_n=a_n−a_(n+1), kernel diagonal ℤ, cokernel0; for ×2, kernel0 and cokernel ℤ₂/ℤ. | Pass; sign agrees with imported tower algebra. |
| G3.4 factorial telescope | ℤ ←2 ℤ ←3 ℤ ←4 ⋯ | lim=0; lim¹=Ext¹(ℚ,ℤ)≠0; telescope homology colimit is ℚ. | Pass; inverse and direct directions differ. |
| G3.5 increasing open cover | (−n,n) covering ℝ; equal weights 1/2,1/2 | Telescope and union both contractible. Gaps of singletons0, gap of pair1/2, hence φ₂=2·1/2=1. | Pass for the gap weights; no renormalizing denominator needed. |
| G3.5 exhaustion | Weights supported in sizes1 and3, values1/2 each | f=2; f<3 forces some positive weight at index<3 and hence membership in W₂. | Pass; finite unions have the required cover property. |
| G3.5 imported chart | F=∅, B=*; F=* | In both cases φ₁=1 and V₁=*; imported instances exist only in the second case. | R01; explicit empty branch needed. |
| G3.6 phantoms | S_ℚ→ΣHℤ; finite P; HF_p coefficients | Stage groups [S,ΣHℤ]=0, but maps from telescope include Ext¹(ℚ,ℤ)≠0; finite-source phantom group0; finite tower groups give lim¹0. | Pass; no uniqueness inferred from finite stages alone. |
| G3.7 compactness | P=S; P=∨ℕS | [S,∨Hℤ]=⊕ℤ; [∨S,∨Hℤ]=∏_n⊕_mℤ contains the diagonal basis family, absent from ⊕_m∏_nℤ. | Pass; infinite wedge is not compact. |
| G3.7 finite-source formula | X=S⁰, E=Hℤ, degree0/1 | colim π_k E_k=ℤ; colim π_k E_(k+1)=0; these equal π₀E and π₋₁E. | Pass; minus sign in cohomological degree. |
| G3.8 spectral holim | Constant Hℤ; zero bonds; ×2 bonds | π₀=ℤ,0,0 respectively; π₋₁=0,0,ℤ₂/ℤ respectively. | Mathematics passes; add Checks under R03. |
| G3.8 connective/truncated maps | Σ⁻¹Hℤ∨Hℤ∨ΣHℤ, cutoff0 | Cover has degrees0,1; truncation has degree−1. Mapping from cover to truncation has π_j=0 for every j≥0. | Pass; rules out swapped adjoints/cutoff. R03. |
| G3.8 smash connectivity | Σ^aS, Σ^bS; a=−1,b=2 | Smash is Σ^(a+b)S=ΣS, with first nonzero group π₁=ℤ on both sides. | Pass for integer, not just nonnegative, cutoffs. |
| G3.8 structured P0 | S; H𝔽₂; free commutative S-algebra | π₀ values ℤ,𝔽₂,ℤ[t]; maps to Hℤ in the free case are indexed discretely by a∈ℤ. | Pass; add Checks under R03. |
| G3.8 unbounded convergence | E=∨_(j∈ℤ)Σ^jHℤ | Each fixed π_n=ℤ eventually stabilizes in either cutoff tower; lim¹ in that fixed degree is0, so both comparison maps give ℤ→ℤ. | Pass; no bounded-below assumption needed. |
| G3.9 localization/completion | Hℚ; Hℤ; H𝔽₂; p=2,3 | Hℚ completed at p is0; Hℤ gives Hℤ_p; H𝔽₂ is unchanged at2 and becomes0 at3. | Pass; not ordinary tensor completion for arbitrary spectra. |
| G3.10 skeletal mapping | CP⁰, CP¹, CP∞ to K(ℤ,2) | π₀ stages0,ℤ,ℤ; first restriction ℤ→0, later identity; π₁ stages0; limitℤ and lim¹0. | R02 repairs the false stage-zero assertion. |
| G3.10 nonabelian lim¹ | Constant S₃ tower, identity bonds | Choose g_(n+1)=g_n h_n recursively to move h to identity; orbit set has one element, although S₃ has six elements and is nonabelian. | Pass; additive cokernel is used only after abelian comparison. |
| G4.0 quaternionic carrier/charts | HP⁰, HP¹; v=(v₀,0) | HP⁰=*; HP¹ has affine ℍ plus one point; (v₀,0)=(1,0)·v₀ for unit v₀. | Pass; right-action convention matters. |
| G4.0 homogeneous ratio | v_i q and v_k q | (v_i q)(v_k q)⁻¹=v_i v_k⁻¹; reversing order would conjugate the ratio and fail invariance for noncommuting i,j. | Pass. |
| G4.0 dimensions | Sp0,Sp1,Sp2; Grℍ(0,2),Grℍ(1,2) | N(2N+1)=0,3,10; 4r(N−r)=0,4; 1-frame dimension7=S⁷. | Pass at rank0 and1. |
| G4.0 quaternionic orientation | Rank1 and2 | Complex-induced basis (1,i,j,−k) has determinant−1 against direct basis; for two blocks determinant(+1)=(−1)². | Pass; carried into G4.5/G5.0. |
| G4.0 stereographic derivative | w=0, tangent h | Derivative of (4w+(‖w‖²−4)v)/(‖w‖²+4) is h, not 2h; outward-first orientation at −v gives degree−1 before the specified reflection. | Pass at the pin. |
| G4.1 relative Leray–Hirsch | Point/empty base; fibre (D¹,S⁰); X×CP¹ | Groups A shifted by1, 0, and H*(X)⊕H*−2(X), respectively; map sends (a,b) to a+bx. | Pass. |
| G4.1 need for global basis classes | Hopf S¹→S³→S² | Fibre H¹=ℤ, but H¹(S³)=0, so no extending degree-one basis class; the invalid predicted H¹=ℤ is excluded. | Pass; numerability alone is insufficient. |
| G4.2 Thom space | Rank0 over B; rank1 over*; empty B | Th0=B₊, Thℝ=S¹, Th over∅=*; reduced cohomology gives H*(B), shiftedℤ,0. | Pass. |
| G4.3 orientations/Thom iso | Trivial line; Möbius line; zero coefficients | Trivial real line has integral generators±1; Möbius has no coherent integral generator but has unique mod2 class; zero theory has 0→0. | Pass; fibrewise normalization is required. |
| G4.4 Euler/relative square | Trivial positive-rank bundle; TS²; rank0 | Euler0; Euler pairs toχ(S²)=2; rank0 Euler1. Relation u²=e·u gives0 for trivial line, not u²=u. | Pass; positive-rank condition on a nonvanishing section matters. |
| G4.5 complex orientation | Tautological γ and γ* on CP¹ | ⟨c₁γ,[CP¹]⟩=−1, ⟨c₁γ*,[CP¹]⟩=+1; x=e(γ*) therefore maps to +h. | Pass; same sign in MU→Hℤ. |
| G4.5 quaternionic characteristic classes | Rank1 restricted to circle torus | Roots x,−x give c₂=−x²; p₁=−2c₂=2x²; direct-real Euler=−c₂=x². | Pass with (1,i,j,k) orientation. |
| G4.5 projective relation | CP⁰,CP¹; HP¹; real mod2 case | ℤ[x]/(x)=ℤ; ℤ[x]/(x²), |x|2; ℤ[a]/(a²), |a|4; H*(RP¹;𝔽₂)=𝔽₂[t]/(t²). | Pass with the respective orientation hypotheses. |
| G4.6 low-rank GL | k=0,1,2,3,4 | π₁=0,0,ℤ,ℤ/2,ℤ/2; π₃=0,0,0,ℤ,ℤ²; π₀ trivial only at k0. | Pass. |
| G4.6 conjugation and stabilization | Reflection in GL2; Spin3→Spin4→Spin5 | Conjugation sends n↦−n; π₃ maps n↦(n,n)↦2n. Reflection at rank4 swaps (a,b). | Pass; semidirect product is not a direct product. |
| G4.6 disconnected source | S⁰→GL1; clutching over S¹ | Map classes form (ℤ/2)² of size4; bundle classes number2. | Pass; the two constructions are distinguished. |
| G5.0 Spin ranks/classifier | Native Spin0; Spin1; Spin2; stable BSpin | Native Spin0=1, Spin1=C₂, Spin2=S¹; stable π1,2,3=0, π4=ℤ. | Pass; geometric rank0 μ₂ is a separate branch. |
| G5.0 sum orientation coherence | k=0,1,2,3 | ε_k=1,1,−1,−1; ε_k ε_(k+1)(−1)^k=1 in all four cases. | Pass; interleaving sign is retained. |
| G5.0 inverse and obstruction | Oriented Spin ξ; nonoriented Möbius class | w₂(−ξ)=0+0=0 for Spin; formal inverse formula includes w₁² otherwise and cannot be omitted universally. | Pass in the oriented domain. |
| G5.0 coefficient/Hopf normalization | S⁴ and degrees1–8 | BSpin groups0,0,0,ℤ,0,0,0,ℤ; Spin4 ℤ²→Spin5 ℤ is addition; Hopf c₂ pairing+1 on the specified sphere class. | Pass; all-CW statement retains mapping-space lim¹. |
| G5.1 finite duality | S, ΣS, S∨ΣS; E=Σ⁻²Hℤ | Duals S,Σ⁻¹S,S∨Σ⁻¹S; D(ΣS)∧E=Σ⁻³Hℤ=F(ΣS,E). | Pass without connective E. |
| G5.2 Atiyah duality | *, S¹⊂ℝ²; empty manifold | Duals S, S∨S⁻¹,0; Σ⁻²Th(ν_S¹)=Σ⁻²(S²∨S¹)=S∨S⁻¹. | Pass; framing is not assumed generally. |
| G5.3 Thom diagrams | Trivial rank-i bundles over*; empty bases | hocolim Σ⁻ⁱΣ∞Sⁱ=S with π₀ℤ; empty bases yield0. | Pass; coherent stabilization determines maps. |
| G5.3 coefficient hypotheses | MO/ℤ, MO/𝔽₂, MSO/ℤ | Degree-zero pairs: ℤ/2 versusℤ (excluded); 𝔽₂=𝔽₂; ℤ=ℤ. | Prior R02 repaired. |
| G5.4 canonical maps | S→MO→H𝔽₂; MU→Hℤ | π₀ maps ℤ→ℤ/2→𝔽₂ reduce mod2; MU→Hℤ acts ℤ→ℤ by identity and π₂ℤ→0. | Pass. |
| G5.4 real/complex/quaternionic indices | KU degree2; KO degree4,8; quaternionic line | β invertible in KU; a²=4b in KO; [ℍ] forgets to real rank4 and complex rank2. | Pass; realification and complexification are not identity on ranks. |
| G5.5 Clifford generators | Displayed 2×2 e₁,e₂ | e₁²=e₂²=I; e₁e₂=diag(−i,i)=−e₂e₁; grading conjugates each to its negative. | Pass. |
| G5.5 mixed neutral module | Λ(ℝ)=ℝ⊕ℝ | (ε+ι)²=+I, (ε−ι)²=−I, anticommutator0; algebra dimension4=dim M₂ℝ. | Pass; wrong sign generator excluded. |
| G5.5 complexification/real CFC | Orthogonal v,w; z=v+iw; A=ℝ | Hilbert norm√2 versus Taylor norm1; for v+iv both√2. A-module operators reduce to real Hilbert bounded/compact operators. | Pass; √2 bound is attained. |
| G5.5 operator level versus classifier | Level0; real levels1 and4 | Level0 has2 points; ample degree0 classifier has π₀ℤ; π₀K_op,1=KOⁱ(*), i=1, is0, while π₀K_op,4=ℤ. | Pass; reversed degree would give ℤ/2 at1. |
| G5.5 sign coherence | p=q=r=1; general parity | 1+2=2+1≡1; both expressions reduce to pq+pr+qr. | Pass. |
| G5.5 configuration | 2₊, dimensions(1,1); equal nonorthogonal lines | Segal map(1,1)→(1,1); orthogonal fold dimension2, wrong equal-line fold dimension1. | Prior R05 repaired. |
| G5.5 Hermite embedding | h₀,h₁,h₂ | Norm squares1,1,1; parities even,odd,even; ⟨h₀,h₂⟩=0 from 2∫x²e⁻ˣ²−∫e⁻ˣ²=0. | Prior R05 repaired; z→h₂ has correct parity. |
| G5.5 MU orientation | π₀,π₂; γ* over CP¹ | Maps id_ℤ, zero, and pairing+1 respectively; opposite orientation gives−1. | Prior R05 repaired. |
| Stable-stem headline G5.6 | n=0,k=3; n=1,k=4; excluded Hopf degree | π₄S³=ℤ/2 and π₆S⁴=ℤ/2 are torsion; π₃S² containsℤ but k≥n+3 excludes it. | Pass; no positive stable free summand. |
| Rational Hurewicz headline G5.6 | k=0; k=1,X=S¹; k=2,X=S² | Bounds0 give no claim; degree1 mapℤ→ℚ spansℚ; degree2 mapℤ→ℚ has kernel0. At degree3 only surjectivity to H₃S²=0 is asserted. | Pass; Hopf π₃S²=ℤ does not violate an unasserted injection. |
| G5.6 nonabelian degree1 | X=BS₃ and BC₂ | H₁(−;ℚ)=0 in both cases; image span0=whole target; no assertion that π₁ itself is abelian or injects. | Pass. |
| G5.6 stable rational spectral result | E=S, Σ⁻¹Hℤ, H𝔽_p | Rational π₀S=ℚ=H₀(S;ℚ); shifted Hℤ hasℚ in degree−1 on both sides; H𝔽_p rationalizes to0. | Pass; full spectral statement remains in README. |
| G5.7 Borel/coherent families | Trivial torus; free S¹ action on itself; trivial action on* | Bases *, contractible, CP∞ respectively; integral Borel ring of* isℤ[x], |x|2, notℤ alone. | Pass. |
| G5.7 support duality | Compact U; U=ℝ,d=1 | Compact-support cochains equal F(R∧U₊,R); onℝ they areΣ⁻¹R, matchingΣ⁻¹P_R(ℝ), since P_R(ℝ)≃R. | Pass; noncompact support is not omitted. |
| G5.7 sections and extension space | Split triangle; A=0 | Zero connecting map admits constant nullhomotopy and B≃A⊕C; when A=0 the section space is contractible. | Pass; nullhomotopies are data, not a mere equality of classes. |

## Not verifiable

The following source statuses are settled as uncertified. I did not request them again or infer their text from citations:

- ABSClifford, *Clifford modules*, §11, used for the Clifford orientation interfaces. The manifest records the publisher DOI 10.1016/0040-9383(64)90003-5 as paywalled.
- McDuffSegal, *Homology fibrations and the group-completion theorem*, §4, used in G2.8. The manifest records publisher DOI 10.1007/BF01403148 as paywalled.
- SegalCategories, *Categories and cohomology theories*, §§1–4, the Γ-space construction in G2.8. The manifest records publisher DOI 10.1016/0040-9383(74)90022-6 as paywalled.
- JoachimKO, *A symmetric ring spectrum representing KO-theory*, §§2–4, the positive-Ω operator-model comparison. The manifest records publisher DOI 10.1016/S0040-9383(99)00063-4 as paywalled.
- QuillenHA, *Homotopical Algebra*, Chapter II §3, the primary Kan–Quillen theorem in G2.1. The manifest records publisher DOI 10.1007/BFb0097438 as paywalled.

The supplied source inventory records the legal-access attempts and settled status for these five works. The available HSS, May, Schwede, Hatcher, Cohen and other cached texts were used for the comparisons described above. No new source request or manifest edit was made. The review's computed examples and Lean elaboration do not certify the proofs of the proposed large model-category or operator-theoretic constructions; those remain the library-development work described by the roadmap.

## Source issues

- **Error** in HatcherVBKT at Lemma 1.21, printed p.37 (HatcherVBKT line 1471): the source says strict comparison with weights outside a finite set forces its weights positive; it should be require positivity too, since the outside set can be empty; affects the proof.
- **Gap** in HatcherAT at Proposition 3.17, printed p.217 (HatcherAT line 9437): the source says the infinite-dimensional comparison follows by a telescope argument left to the reader; it should be supply that telescope and additivity argument; affects the proof.
- **Misprint** in SchwedeSymSpec at the paragraph after Theorem 8.3, printed p.297 (SchwedeSymSpec line 15771): the source says the comparison target is (n+1)-connected; it should be (n+1)-coconnected; affects nothing.
