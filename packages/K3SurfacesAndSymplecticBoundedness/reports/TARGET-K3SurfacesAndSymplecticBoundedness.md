# TARGET-K3SurfacesAndSymplecticBoundedness triage

Verdict: **design**. Retain **K3SurfacesAndSymplecticBoundedness**. No base or duplicate owner was found. The result is `packages/K3SurfacesAndSymplecticBoundedness/target.md`; legal source records are in `packages/K3SurfacesAndSymplecticBoundedness/sources.toml`. This is an endpoint brief, with no Lean or implementation milestones.

## Ownership search

Searched every supplied active and completed roadmap and every board package, including README and Lean files, for K3/K_3 surfaces, symplectic automorphisms, Picard and Néron–Severi lattices, canonical sheaves, coherent cohomology, smooth proper surfaces, polarization, Hilbert polynomials and moduli boundedness. Inspected `merge-order/ORDER.txt` and the complete package inventory. The supplied open-PR input is empty, so there were no PR heads to inspect.

The relevant existing work is:

- `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, especially §§2.18–2.20, 3.4, 4.14 and 5.8–5.10, owns general coherent duality, intersection/Riemann–Roch, the numerical quotient and Hodge index. Its generic surface theorems are imported, not repeated as new work.
- `TauCetiRoadmap/JacobianChallenge/README.md`, Layers A–E, owns line-bundle classes, proper coherence/base change, the curve Picard construction and abelian varieties. A curve Picard scheme does not already own the K3 relative Picard application.
- `TauCetiRoadmap/AlgebraicVectorBundles/README.md`, L0A–L0C, supplies the sheaf/determinant carriers. `TauCetiRoadmap/StableReduction/README.md`, Layer 2, supplies the positivity/projective conventions identified by scheme foundations.
- `TauCetiRoadmap/IntegralLattices/README.md`, Layers 0–1 and 5–6, and `Completed/IntegralLattices/README.md`, Layers 1–5, own abstract lattice and discriminant theory. The abstract K3 lattice is already planned; its geometric realization as a surface's Picard/cohomology lattice is not. The active roadmap's 4A explicitly sends indefinite rank-at-least-three class-number finiteness to OrthogonalTamagawaAndLatticeMass. Consequently the brief does not promise a new generic lattice-class finiteness theorem here.
- `TauCetiRoadmap/EtaleCohomologyFoundations/README.md`, F.0.3, F.2.1–F.2.2, F.4.0–F.4.6 and §§0.9–0.11, supplies the general integral/rational realization, base-change and cycle-class machinery. K3 ranks and faithfulness remain new geometric statements.
- `TauCetiRoadmap/ComplexCurveModuli/README.md` establishes curve/family carriers and explicitly names ComplexComparisonPartII C−1.1 and C1.9. `TauCetiRoadmap/ComplexKahlerGeometry/README.md`, K3–K5, develops analytic sheaves and Hodge comparisons. Its section label K3 is not a K3-surface predicate.
- `TauCetiRoadmap/AdicSpacesPartIII/README.md` mentions a complex quartic K3 deformation as an algebraization example. This is not ownership of the shared arbitrary-field K3 library. Other K3 hits include lattice examples, a topological index check, section labels and unrelated variable names.

Neither PeriodsAndSpecialValues nor the filed K3/Bloch-group roadmaps is present in the supplied main/completed/package inventory. Their alleged owner references are filing data, not independently verified existing contracts. AbelianSchemesAndArithmeticModuli, AlgebraicModuliForArithmeticGeometry, ComplexComparisonPartII and CrystallineCohomology occur in the merge order but have no supplied roadmap/package artifacts. The brief distinguishes known section contracts from unavailable ones and preserves the filed scheduling constraints without inventing section numbers. The suggested folder name is unused in all supplied roadmap/package namespaces; no open PR reserves it.

The target is a new geometric subject, rather than a continuation of the abstract lattice, curve-moduli or general foundation roadmaps in the same direction. Those remain suppliers. Thus neither `duplicate` nor `part-ii` is appropriate. New K3-specific consequences do not authorize replanning any supplier.

## Pinned library search

Read the pins from `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Used GitHub code search for `K3Surface`, `NeronSeveri`, `symplecticAutomorphism`, `K3`, `canonicalBundle`, `Picard lattice`, `Smooth` and `LineBundleClass`. The specific K3/Néron–Severi/symplectic-automorphism searches produced no owner. Broad K3 hits in Tau Ceti were unrelated variables and roadmap-parser tests. Canonical-bundle hits concerned curves. GitHub's code index follows the default branch, so those results alone were not treated as pinned evidence.

Fetched both full recursive Git trees at the exact pins (neither response was truncated), searched their paths for surface/K3, geometric-integrality, differentials, Picard/cohomology and lattice objects, and read the relevant files at the pins:

| Pinned file | Confirmed reusable material |
| --- | --- |
| `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean` | `AlgebraicGeometry.Smooth`, `SmoothOfRelativeDimension`, composition and base change |
| `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean` | `AlgebraicGeometry.IsProper`, composition and base change |
| `TauCeti/AlgebraicGeometry/Geometrically/Integral.lean` | the native geometrically integral morphism interface |
| `TauCeti/AlgebraicGeometry/Modules/Differentials/Rank.lean` | native relative differentials finite locally free of the smooth relative dimension; the invertible-sheaf specialization here is for dimension one |
| `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean` | `Scheme.Modules.Cohomology`, coefficient functoriality and degree-zero comparison; its description explicitly leaves proper finiteness as later work |
| `TauCeti/AlgebraicGeometry/Cohomology/Module/Basic.lean` | canonical scalar actions on cohomology, with base-ring restriction delegated to its companion module |
| `TauCeti/AlgebraicGeometry/LineBundle/Class.lean` | `TauCeti.AlgebraicGeometry.LineBundleClass`, `mk`, `lift`, isomorphism equality and group operations |
| `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean` | `TauCeti.IntegralLattice`, its integral form and nondegeneracy mixin |

No dedicated geometric K3 declaration was found. These native building blocks are substantial partial supply, not ownership of the target. The search combines indexed mathematical-object queries with exact-pin trees and file reads; it is not a claim to have semantically exhaustively checked every theorem in either library. No Lean command was needed or run.

## Source checks and mathematical decisions

Fetched four texts through the configured sources service, then read the relevant numbered extraction lines myself. The author-hosted Huybrechts draft is expressly a prepublication copy (`huybrechts line 11`); its locators are labelled as draft locators. The arXiv versions read are Rizov v2, Dolgachev–Keum v5 and Keum v9. Published-version numbering is not assumed.

- The arbitrary-field predicate is supported by Chapter 1, Definition 1.1 (`huybrechts line 133`). Remark 1.2 supports projectivity as a consequence (`huybrechts line 147`). Relative smoothness and geometric integrality are retained, including over imperfect fields. A Fermat quartic requires the characteristic exclusion, whereas the smooth-quartic check is field-general (`huybrechts line 160`).
- Coherent base change and the Picard lattice are concrete geometric statements (`huybrechts line 335`, `huybrechts line 13964`). Rank at most 20 in characteristic zero and at most 22 generally are distinct (`huybrechts line 13994`, `huybrechts line 14001`). Lemma 17.2.6 distinguishes bounded-degree rank realization from full integral Picard descent (`huybrechts line 14038`). A rank bound supplies no discriminant bound or finite list of all Picard lattices.
- The full symplectic group can be infinite: Chapter 15, §2.5(i) gives an infinite-order symplectic automorphism (`huybrechts line 12221`), and Keum makes the general warning explicit (`keum line 146`). Polarized automorphism finiteness is sourced separately (`huybrechts line 3372`, `rizov line 615`). Polarizations are classes; an extra chosen line-bundle isomorphism would introduce scalar inertia.
- The constant in endpoint 5 is a mathematical consequence worked out here. Integral geometric `H²` is free of rank 22 (`rizov line 273`). Faithfulness holds in characteristic zero (`rizov line 659`) and every positive characteristic (`keum line 120`). Reduction of `GL_n(ℤ_ℓ)` is injective on a finite subgroup for odd `ℓ`: its kernel has no nonidentity torsion, as the first nonzero `ℓ`-adic term of a matrix is retained on taking a power prime to `ℓ`, while an `ℓ`th power increases its valuation exactly by one. Taking `ℓ=3` except in characteristic three, where `ℓ=5`, gives the displayed bound in all fields after geometric base change. This is labelled a derived endpoint, with the general congruence lemma a real prerequisite, rather than attributed as a sharp bound to Keum.
- The complex `960` bound comes from Mukai's theorem and maximal orders as presented in Chapter 15 (`huybrechts line 12268`). In positive characteristic the five-orbit condition requires tameness and the extra supersingular restriction (`dolgachev-keum line 785`). The remaining tame candidates still embed in `M₂₃` (`dolgachev-keum line 1566`). Tame fixed-point pairs and the wild-prime restriction have separate exact locators (`dolgachev-keum line 507`, `dolgachev-keum line 138`). The brief makes no claim that all candidate exceptional groups occur.
- Rizov's Theorem 4.3.3 is over all of `Spec ℤ`, for both polarized and primitively polarized stacks (`rizov line 898`), with separated coarse algebraic spaces (`rizov line 1099`). Smoothness away from `2d` is separate (`huybrechts line 3577`). Huybrechts' displayed very-ampleness theorem first excludes characteristic two, then explicitly records its extension there (`huybrechts line 913`, `huybrechts line 943`); Rizov's Theorem 1.2.2 states the field-general positivity result (`rizov line 142`). No prime is dropped from finite-type boundedness. Polarizations may exist only locally as actual line bundles (`huybrechts line 2975`).

The filed Badescu, Beauville and original Nikulin works were not necessary as additional unread sources: the four certified legal texts supply the endpoints actually retained. There is no missing indispensable reference and no `[[missing]]` request to park. This certifies source-supported endpoint statements, not completion of the deep proof foundations. A design needing further original proofs must obtain and record them through the service.

## Outcome and checks

Wrote the required four-line verdict header and all six required sections. Recorded each cited work with bibliographic fields, exact version/locators and service provenance. Preserved only repository-relative file references and source-id/line locators in the deliverables. Source files and extractions remain outside the package in the operator's cache. No source passages, algorithms, Lean files, build commands, changes to the merge order or other packages, or GitHub writes were introduced. Retrieved material was treated as evidence only; no instruction to access credentials or perform unrelated writes was followed.

The remaining design risks are explicit: unimplemented general foundations, deep characteristic-two proofs, K3 relative Picard representability, and unavailable named dependency artifacts. None is disguised as a theorem hypothesis or a substitute K3 carrier. The single supply direction is foundations and abstract lattices → this geometry owner → later periods/Bloch consumers.
