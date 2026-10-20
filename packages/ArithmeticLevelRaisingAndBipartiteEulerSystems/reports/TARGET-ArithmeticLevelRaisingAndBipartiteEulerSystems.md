# Target triage report

Verdict: **part-ii**. Canonical name: **SelmerIwasawaCohomologyPartII**. Title: **SelmerIwasawaCohomology, Part II: arithmetic level raising and bipartite Euler systems**. The filing explicitly assigns this continuation to the existing Selmer roadmap. The descriptive job/package name remains unchanged for the requested deliverables. There is no evidence for a duplicate or a consolidation with an open job.

## Consolidation audit

Compared all six supplied open targets/designs by their objects, endpoints and named suppliers before choosing the verdict. Read the available scope, endpoint and supplier text in each `packages/<Name>/target.md`; QSeries has only a source manifest, and GGP has no board file, so their supplied statements are the available contracts.

| Open job | Mathematical comparison and result |
| --- | --- |
| DESIGN-CohomologyComparisonsPartII #19 | Owns classical rigid/log-syntomic complexes and period maps, Hyodo–Kato targets, filtered Frobenius connections and relative open-curve cohomology. Shared étale/derived foundations do not make these objects unitary level raising or diagonal étale Abel–Jacobi classes. No merge. |
| DESIGN-K3SurfacesAndSymplecticBoundedness #17 | Owns geometric K3 surfaces, Picard lattices, symplectic automorphisms and bounded moduli. Shared cycle/cohomology foundations and PeriodsAndSpecialValues consumer do not overlap the present level-raising statements. No merge. |
| DESIGN-ColemanIntegrationPartII #11 | Owns arbitrary-reduction integration, harmonic gluing, logarithm branches and double/triple indices. Its comparison suppliers do not own these Rankin–Selberg reciprocity laws. No merge. |
| DESIGN-QWittVectors #9 | Owns big/q-Witt and arithmetic Λ-ring constructions, completed relative Frobenius and framed difference calculus. Shared arithmetic/cohomology context provides no overlapping structure or theorem. No merge. |
| TARGET-QSeriesPartitionsAndMockModularForms #1 | Owns q-series, partitions, Appell–Lerch sums and mock/harmonic modular transformations. These are distinct from unitary automorphic cohomology, level-raising congruences and Selmer annihilation. No merge. |
| TARGET-GanGrossPrasadConjecturesForClassicalGroups #6 | Owns classical-group restriction multiplicities, packets, distinguished characters, period nonvanishing and period/L-value identities, including filed GGP.8. The present rank-zero proof consumes its definite unitary period input (ltxzz line 6548). Keep that identity there and the cycle/level-raising/reciprocity/rank deductions here. Neither target plans the other's theory after this boundary is imposed. No merge; GGP is an earlier supplier. |

## Existing roadmap and library search

The read-only main checkout is commit `0e8b058a97cc4f9401d2679313e0e937761c1024`. Searched the full available `TauCetiRoadmap/` and `Completed/` trees, the board packages and `merge-order/ORDER.txt` with object/theorem terms: arithmetic level raising, bipartite Euler systems, Rankin–Selberg, LTXZZ, the two theorem numbers, Liu–Tian, Selmer groups, Abel–Jacobi, Shimura varieties, local cohomology and Euler systems. Separately checked both the descriptive proposed name and `SelmerIwasawaCohomologyPartII` for collisions. No existing roadmap/package with either canonical ownership was found. There are no open roadmap PR heads in the supplied inventory.

Relevant positive findings are suppliers or different constructions:

- `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` verifies Tate twists, base change, Künneth, integral/rational realizations, continuous actions, stable lattices, cycle classes, purity and trace at the sections named in the brief. It does not allocate the unitary level-raising/rank endpoints to itself.
- `TauCetiRoadmap/ProfiniteCohomology/README.md` owns continuous cohomology, comparison, transfer and cup operations. `TauCetiRoadmap/Chebotarev/README.md` Layer 10 supplies density/infinitude of prescribed Frobenius classes over arbitrary number fields. These are imports.
- `TauCetiRoadmap/EllipticCurves/README.md` Layer 7 owns general Selmer-structure foundations in its elliptic-curve program; it does not plan the present Rankin–Selberg theorem. Preserve any existing carrier/comparison through the Selmer base.
- `TauCetiRoadmap/JacobianChallenge/README.md` Layers A/F concern divisor classes and the curve-to-Jacobian Abel–Jacobi map. Those are different from the codimension-n cycle-to-Galois-cohomology map here. `TauCetiRoadmap/ModularForms/README.md` has GL₂ degeneracy/old-new theory; that is not the arithmetic singular-cohomology comparison of ltxzz Theorem 6.3.5.
- `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` refers to SelmerIwasawaCohomology §§3.9 and 3.14 for determinant/Selmer-complex use. This corroborates an existing supplier but does not recover its Part II boundary.

The base, ShimuraVarieties, PeriodsAndSpecialValues, EulerSystemsAndKolyvaginSystems and several other named suppliers are absent from the supplied trees. Public GitHub README reads for those first four, and GGP, returned 404. A public repository code search for arithmetic level raising returned unrelated profinite/Chebotarev and modular-form matches. Therefore the filing's report of references in the missing consumer/base could not be independently counted or section-audited. Absence of those artifacts is not permission to re-plan their theory. The brief records exact verified sections where available and marks missing sections explicitly.

Library discovery used GitHub code search for SelmerGroup, SelmerStructure, Shimura, reciprocity, bipartite, Rankin and AbelJacobi, followed by reads at the **pinned commits**. Default-branch search results were treated as discovery only. Also read the complete, nontruncated recursive Git trees at both pins (13,144 Tau Ceti entries; 10,680 Mathlib entries) to check candidate paths.

| Pin | Files actually read and implication |
| --- | --- |
| Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` | `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean` defines `IsDedekindDomain.selmerGroup` through multiplicative classes/valuations. `Mathlib/RepresentationTheory/Homological/ContCohomology/LowDegree.lean` provides continuous-cohomology foundations. Neither owns the requested diagonal class or rank theorems. |
| Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean` supplies explicit 2-descent and its rank bound, including `WeierstrassCurve.Affine.selmerGroup₂`. `TauCeti/AlgebraicGeometry/WeilDivisor/AbelJacobi/Basic.lean` supplies `TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.weightedAbelJacobiClass`, a formal divisor-class map. These do not identify a duplicate. |

Search also found a generic continuous SelmerStructure and a number-field Kummer/Selmer file on the current Tau Ceti branch, but both selected paths returned 404 at the pin. They are not reported as available pinned declarations. Bipartite search hits were graph/quiver theory; reciprocity hits were quadratic/local Artin theory; Rankin hits were unrelated counts. No discovered declaration implements this target. This is a documented search result, not a claim that every file in either library was read.

## Source verification and mathematical decisions

Fetched every mathematical source through the required sources service; the package contains only the manifest, brief and report. Read the resulting numbered extractions directly. All three fetched works are certified legal arXiv copies; no indispensable reference remains missing.

- **ltxzz, arXiv v3:** checked the relevant-representation and coefficient-field definitions, Hypothesis 3.2.10/Proposition 3.2.11, special inert places, §6.1 hypotheses, both rank-parity comparisons, the two explicit reciprocity laws, Definition 8.1.1 and both rank theorems. Principal locators: ltxzz line 124, ltxzz line 1222, ltxzz line 1259, ltxzz line 1293, ltxzz line 5304, ltxzz line 5634, ltxzz line 6037, ltxzz line 6303, ltxzz line 6368, ltxzz line 6568 and ltxzz line 6773. The requested theorem numbers exist in the version read; journal pagination/numbering was not assumed.
- **liu-tian, arXiv v2:** checked §4.1, Assumption 4.1, Definition 4.5 and Theorem 4.7 (liu-tian line 1384, liu-tian line 1407, liu-tian line 1477, liu-tian line 1496). Its odd-degree totally real/quaternionic setup and unramified-map surjectivity are a precursor and an ownership check, not a substitute proof of the unitary endpoints.
- **ltxzz-deformation, arXiv v1:** fetched the separate rigid-deformation paper referenced internally by ltxzz. Read Theorem 3.6.3 and its hypotheses/conclusions (ltxzz-deformation line 1444), and Theorem 4.2.6 (ltxzz-deformation line 1880). The rigid R=T and general deformation theory remain assigned to earlier suppliers; this extension imports them.

The brief makes four consequential distinctions. Coefficient-prime admissibility has seven substantive conditions, separate from auxiliary-place and Satake conditions. The first law includes its explicit Hecke scalar and has an annihilator-exponent equality as a corollary (ltxzz line 6158), whereas the second law gives an inequality (ltxzz line 6303). The general rank theorems retain Hypothesis 3.2.10, while F⁺≠Q is a source-supported specialization and the n=2 refinement has separate hypotheses (ltxzz line 1273, ltxzz line 196). Finally, rank one assumes a nonzero projected diagonal Abel–Jacobi class in a finite multiplicity space, not merely a nonzero L-derivative: the missing bridge is conjectural (ltxzz line 6748, ltxzz line 6790).

## Verdict, ordering and validation

Part II fits the filing's explicit continuation of SelmerIwasawaCohomology; it is not a new independent Selmer foundation. The canonical name is unused in the supplied main/completed tree, PR inventory and board packages. The manifest's roadmap name is synchronized with that verdict while its path stays at the requested job package.

The required direction is existing foundations/base, unitary Shimura theory and GGP → this Part II → PeriodsAndSpecialValues. The merge order has the base and established supplier entries but lacks GGP, the new Part II and the consumer. Exact supplier binding and insertion after the last supplier remain worker/design obligations; this job does not modify the order. No proposed dependency returns from the period or arithmetic derivative applications.

Wrote the brief with the six required sections, exact header fields, own-word statements, explicit source hypotheses and line locators. Checked TOML parsing, required manifest fields, source-line bounds, canonical naming and absence of machine paths. No Lean was written or run, no PR/issue writes were made, and no inputs were edited. The remaining limitation is missing roadmap ownership contracts, recorded in Scope, Suppliers and Risks; the legal mathematical sources themselves are available.
