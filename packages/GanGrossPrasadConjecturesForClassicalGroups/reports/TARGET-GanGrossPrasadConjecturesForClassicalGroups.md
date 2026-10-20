# Triage report: TARGET-GanGrossPrasadConjecturesForClassicalGroups

Verdict: **design**. Retain `GanGrossPrasadConjecturesForClassicalGroups`; base and duplicate owner are none. No available roadmap, package or pinned-library declaration owns the combined restriction, packet-selection and global period endpoints. The existing orthogonal and reductive roadmaps supply foundations and expressly stop before this automorphic subject, so this is not their Part II. No open roadmap PR heads were supplied.

## Consolidation before ownership

Compared all six other open jobs by mathematical objects and, where available, read their complete target files:

| Open job | Comparison and decision |
| --- | --- |
| DESIGN-K3SurfacesAndSymplecticBoundedness | Geometric K3 surfaces, Picard lattices, symplectic automorphisms and moduli. Its word “symplectic” denotes an action on a canonical form, not local symplectic/metaplectic restriction. No overlap. Read `packages/K3SurfacesAndSymplecticBoundedness/target.md`. |
| DESIGN-ColemanIntegrationPartII | Curve primitives, harmonic gluing, double/triple indices, branch and trace descent. Its period/regulator applications do not own automorphic periods or classical-group packets. No overlap. Read `packages/ColemanIntegrationPartII/target.md`. |
| TARGET-ArithmeticLevelRaisingAndBipartiteEulerSystems | Unitary Shimura cycles, diagonal Abel–Jacobi classes and explicit reciprocity leading to Selmer rank theorems. It shares unitary groups and possible automorphic suppliers but does not own local distinction or the automorphic period identity. Keep separate and allow a one-way consumer relation. No target file was supplied; comparison uses the full filed statement. |
| DESIGN-QWittVectors | Arithmetic Lambda-rings, q-Witt operations and framed difference calculus. No shared models, statements or relative representation theory. Read `packages/QWittVectors/target.md`. |
| TARGET-QSeriesPartitionsAndMockModularForms | q-series identities, partitions, mock modular forms and completions. Jacobi theta phenomena do not mean Fourier–Jacobi restriction models. No target file was present; compared the filed statement and package inventory. |
| TARGET-CohomologyComparisonsPartII | Syntomic/rigid/de Rham comparisons, open-curve residue and evaluation interfaces. General cohomological input for arithmetic applications does not overlap automorphic restriction and period identities. No target file was present; compared the filed statement and package inventory. |

Also inspected the available `packages/ArithmeticDynamics/README.md` and `packages/ErdosProgressionPowers/README.md`; dynamical heights/orbits and progression-power Diophantine results do not overlap. Therefore no `merge-into` verdict is warranted.

## Roadmap and library search

Searched recursively through active `TauCetiRoadmap/`, `Completed/` and all board packages for Gan/Gross/Prasad, GGP.8, Vogan packets, Ichino–Ikeda, Bessel models, Fourier–Jacobi models, distinguished characters, restriction problems, Langlands parameters, automorphic representations, Weil representations, local root numbers and multiplicity one. Broader matches concerned classical groups, ordinary modular forms, geometric representation categories or unrelated meanings of multiplicity. GeometricRepresentationCategories concerns affine Lie-algebra modules and coherent transport, rather than admissible representations of local classical groups.

Read the scope and relevant layers of `TauCetiRoadmap/OrthogonalSpinGroups/README.md`, `TauCetiRoadmap/ReductiveGroups/README.md`, `TauCetiRoadmap/GlobalNumberFields/README.md` and `Completed/RestrictedProducts/README.md`. OrthogonalSpinGroups owns arbitrary-form O/SO and adelic interfaces but excludes automorphic and Weil representations. ReductiveGroups owns general algebraic-group theory. GlobalNumberFields owns the number-field/adelic and character bases. RestrictedProducts explicitly leaves Tamagawa measures and spectral theory elsewhere. None is a duplicate owner; their exact import layers are in the brief.

The manifest pins Mathlib to `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti to `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Used GitHub code search for GGP/packet terms and representation/intertwining objects, then inspected both complete, nontruncated Git trees at those exact commits. Code-search hits on default branches were only discovery aids. Read the actual pinned files:

- `Mathlib/RepresentationTheory/Intertwining.lean`: `Representation.IsIntertwiningMap`, `Representation.IntertwiningMap` and their elementary linear-map structure. These are usable carriers, not local multiplicity-one or packet theorems.
- `TauCeti/RepresentationTheory/Spin/Representation.lean`: `TauCeti.spinRep`, `TauCeti.pinRep` and the exterior-model Clifford action. These are algebraic Spin representations, not oscillator or local automorphic representations.
- `TauCeti/LinearAlgebra/UnitaryGroup.lean`: `Matrix.specialUnitaryGroup.star_eq_adjugate`. A matrix identity, not arbitrary-inner-form unitary packet theory.

No GGP owner was discovered. This is an evidence-based negative search, not a claim that every declaration in either library was individually audited. The suggested folder name was unused before this job created its package.

## Supply direction and absent inputs

Read `merge-order/ORDER.txt`. AutomorphicLFunctionsAndLocalFactors, AutomorphicGaloisRepresentationsPartII, SelmerIwasawaCohomology, the smooth-representation and automorphic-spectrum suppliers, EndoscopicTransferAndUnitaryTraceComparison and MetaplecticAutomorphicForms have order entries. Their roadmap texts are absent from the supplied main checkout and packages. PeriodsAndSpecialValues is absent too, and neither it nor the new GGP roadmap has an order entry. Public-main reads of the three filed supplier README paths and the consumer README path all returned 404.

Consequently the claimed consumer reference to GGP.8 is preserved as a filed requirement, not independently certified. The brief names verified sections for available foundations and marks unavailable automorphic sections unresolved. Placement must follow the last actual supplier and precede PeriodsAndSpecialValues. The Selmer reservation is respected without manufacturing a mathematical Selmer dependency. No order file or other package was edited. Missing roadmap contracts do not authorize replacement plans or return edges from consumers.

## Source verification and mathematical decisions

Fetched eight works exclusively through the sources service and read the cited lines myself. Seven are certified open-repository copies; Ichino–Ikeda is a certified copy on Ikeda's Kyoto author page. The DOI-first Ichino–Ikeda lookup returned uncertified, then the author copy resolved the needed text. No indispensable source remains unread, so there is no outstanding missing-reference table.

The source manifest now uses version-specific verified locators. In particular, bplzz v3 has Theorems **1.8 and 1.10**, rather than the older numbers mentioned in bpcz. Gan–Ichino's result is **Theorem 1.3**, Corollary 1.4 and Proposition 9.3; Sun–Zhu's restriction results are **Theorems B and C**; Sun's Fourier–Jacobi result is **Theorem B**, not Theorem A; Waldspurger's result is **Theorem 1**, not an invented numbered section or corollary. Corrected the service's Ichino–Ikeda author spelling and publication year. Kept service provenance, hashes and access classifications intact. No source files or passages were copied into the repository.

The main mathematical distinctions shaping the brief are:

- GGP's relevance condition permits arbitrary ambient forms and larger codimensions; it does not mean all groups must be split. Source: ggp line 229, ggp line 255. The archimedean Hom convention uses continuous maps and completed tensor products: ggp line 2059.
- The local assertion selects one representation across relevant inner forms in a **generic packet**, with a specified enhancement. Epsilon-factor, determinant and splitting-character corrections matter: ggp line 728, ggp line 780, ggp line 2440, ggp line 2467. Gan–Ichino supplies the nonarchimedean characteristic-zero unitary generic cases, including larger codimensions: gan-ichino line 19, gan-ichino line 141, gan-ichino line 2494.
- General global GGP requires both local distinction and a central value, with source hypotheses on cuspidal multiplicity and temperedness: ggp line 3044, ggp line 3175. These are conjectural endpoints, not proof premises for GGP.8.
- The proved unitary nonvanishing statement ranges over Hermitian spaces; it is not a theorem on any prescribed inner form. bpcz line 93 defines the allowable endoscopic parameters, and bpcz line 124 gives the equivalence.
- GGP.8 is exactly the everywhere-tempered cuspidal unitary theorem, with Tamagawa normalization and completed local/global factors: bpcz line 148, bpcz line 179, bpcz line 188. Endoscopic base change is allowed, so the component-group factor is variable; bpcz line 194 singles out 1/4 only in the stable case. This is stronger than imposing an auxiliary supercuspidal place but does not remove temperedness.
- The orthogonal identity remains a named conjectural proposition at the generality of the cited formulation. Its almost-local-generic condition is not silently replaced by a proved equivalence with temperedness: ichino-ikeda line 245, ichino-ikeda line 262, ichino-ikeda line 395.

The brief keeps the full classical-family statement layer and source-certified theorem cases separate. It does not purport to survey every subsequent result. General trace-formula foundations are an upstream ownership risk, not an invitation to plan an algorithm or bypass them with certificates.

## Deliverables and checks

Produced `packages/GanGrossPrasadConjecturesForClassicalGroups/target.md`, this report, and `packages/GanGrossPrasadConjecturesForClassicalGroups/sources.toml`. Kept a scratch worklist. Checked the four-line verdict header, required sections, manifest schema and required fields, source-line references, relative file references and allowed changed-file scope. No Lean, dependency updates, repository code, GitHub writes or detailed implementation plan were produced. Source certification confirms legal access and provenance; mathematical hypotheses were checked against the cached texts.

No suspicious instruction-bearing passage was encountered in the searched material. All fetched material was treated as data.
