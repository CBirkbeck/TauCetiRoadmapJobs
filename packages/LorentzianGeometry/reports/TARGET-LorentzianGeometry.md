# Triage report: TARGET-LorentzianGeometry

Verdict: **design**, name `LorentzianGeometry` (the suggested name, unused anywhere). Brief in
`packages/LorentzianGeometry/target.md`.

## What was searched

Ownership and duplication were checked by mathematical object, not only by name.

- **Board.** `packages/` (555 folders) and the index of packages under review
  (`board-packages-index.txt`): no package on Lorentzian manifolds, causality or relativity
  beyond `RelativisticQuantumFieldTheory` (fixed Minkowski space). `packages/LorentzianGeometry/`
  existed only as an empty folder created for this job.
- **Open targets and designs.** All 38 listed in the brief, by statement. The only one touching
  the same objects is `TARGET-CompressibleEulerEquations` (#6000): it defines the acoustical
  metric `−c² dt² + Σ(dx^i − v^i dt)²`, causal and null vectors, future-directed causal curves
  and domains of dependence *of a C¹ Euler state*, and its own text names "the
  Lorentzian-geometry definitions (Definition #51 of the same series)" as the supplier of
  causal character and null hypersurfaces. That is a supplier–consumer relation, not an overlap:
  this roadmap proves the acoustical form is Lorentzian and records it as an example;
  CompressibleEulerEquations owns everything Euler-specific. `TARGET-RiemannianManifoldsWithConvexBoundary`
  (#6018) and `TARGET-SobolevMapsBetweenManifolds` (#6021) share suppliers (DifferentialGeometry,
  RiemannianGeometry) and nothing else. No merge.
- **Roadmaps on main, completed roadmaps and the 453 open pull requests** through
  `roadmaps grep` for: `Lorentzian (manifold|metric)`, `time[- ]orient`, `null hypersurface`,
  `timelike`, `spacetime`, `pseudo-/semi-Riemannian`, `optical function|acoustical`,
  `inextendib|C⁰-extension`, `null geodesic|null generator`, `characteristic hypersurface`,
  `light cone|achronal|Cauchy horizon|globally hyperbolic|domain of dependence`. Findings:
  - `Completed/HopfRinow` Layer 1 owns the *smooth* nondegenerate (pseudo-Riemannian)
    Levi-Civita supplier (signature locally constant, Koszul construction, Christoffel symbols,
    families and variations) and says LocalVariationalFieldTheory consumes it "for Lorentzian
    metric variation". It is consumed, not re-planned. Its `COMPLETION.md` lists
    `VectorBundle/NondegenerateMetric/{Basic,Musical,Signature,Family}` and
    `CovariantDerivative/LeviCivita/Nondegenerate/{Existence,Christoffel,Regularity}` on Tau Ceti
    main at `daa66339a578`; the pinned Tau Ceti (`358314d4ab97`) does not contain them (listed
    as a risk).
  - `RelativisticQuantumFieldTheory` (#1772): `M = EuclideanSpace ℝ (Fin 4)` with a constant
    form `diag(+1,−1,−1,−1)`, causal Green operators with `J^±` supports, Lorentz spinors.
    `LocalVariationalFieldTheory` (#916): the Lorentzian Klein–Gordon example and LVF6 metric
    variations on fixed `ℝ⁴`. `NoncompactQuantumSymmetry` (#1015): Lorentz and Poincaré group
    representations, the unit hyperboloid. `PositiveMass` (#956): Riemannian initial data, and
    its scope section explicitly excludes spacetime ADM momentum, the dominant energy condition
    and Jang's equation. `RiemannianGeometry` on main R4: the hyperboloid model restricts an
    ambient Lorentz form. None defines a Lorentzian manifold, time orientation, null
    hypersurfaces, optical functions or extensions.
  - `PDE` on main is elliptic/parabolic (Lane A item 7 owns Hölder spaces `C^{k,α}(Ω)`);
    `PseudodifferentialOperators` P1.0/§4.2 owns the smooth principal symbol on `T^*M`;
    `DifferentialGeometry` on main fixes the boundary/corners conventions and Layer 12 metric
    conventions.
- **Pinned Mathlib.** `Mathlib/Geometry/Manifold/Riemannian/*`, `VectorBundle/Riemannian.lean`,
  `CovariantDerivative/{LeviCivita,Metric}.lean` (positive-definite only, `RiemannianMetric.pos`);
  `QuadraticForm/{Signature,Real}.lean` (`sigPos`, `sigNeg`, Sylvester); `IsManifold/InteriorBoundary.lean`,
  `Instances/Real.lean` (half-space, quadrant); `ContMDiffSection`; `Topology/MetricSpace/Holder.lean`;
  `Analysis/ODE/ExistUnique.lean`; `Geometry/Manifold/IntegralCurve/*`. No Lorentz or Minkowski
  declaration exists (the only "Lorentz" hits are unrelated).
- **Pinned Tau Ceti.** `TauCeti/Geometry/Manifold/**` (Riemannian Levi-Civita, geodesics,
  hyperbolic space), `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Real/ThreeOne.lean`
  (`realCliffordForm 3 1`, `Spin(3,1) ≃ SL₂(ℂ)`). No Lorentzian manifold, no nondegenerate
  metric bundle.
- **Merge order.** `ORDER.txt` has no Lorentzian entry; PseudodifferentialOperators is at
  line 9, PositiveMass at 267. The roadmap goes after its suppliers on main and before
  `CompressibleEulerEquations`.

## Why `design`

Not a duplicate: no roadmap, package or library declaration owns any of the ten final targets.
Not a Part II: the target does not continue an existing roadmap in its direction. HopfRinow's
nondegenerate supplier is the closest base, but it is a completed Riemannian roadmap whose
Lorentzian content is one smooth supplier; the target's objects (causal cones, time
orientation, extensions, null hypersurfaces, finite regularity, corners) are a new theory, and
HopfRinow is consumed by name. Not a merge: the only overlapping open target (#6000) declares
this one as its supplier, and merging would put a general Lorentzian library inside an Euler
roadmap, against the "general library" principle.

Generality raised from the filing: dimension `n + 1 ≥ 2` throughout, arbitrary models with
corners (not only boundary), regularity classes `C^∞`, `C^k`, `C^{k,α}` with `C^0` as a
first-class case, and a single signature convention `(−,+,…,+)` with the sign flip to the
field-theory roadmaps recorded as a Check. The four-dimensional and Minkowski statements are
Checks, not targets. Causality theory proper (`I^±`, `J^±`, global hyperbolicity, domains of
dependence, Cauchy horizons) is excluded and named as the natural Part II, since the Annals
papers motivating the target need it next.

## Sources

Recorded in `packages/LorentzianGeometry/sources.toml`. Read legally and cited by line:
`chruscielgrant2012` (arXiv:1111.0400v3), `sbierski2018` (arXiv:1507.00601v2),
`dafermosluk2017` (arXiv:1710.01722v1), `chrusciel2011` (arXiv:1110.6706v1), `galloway2004`
(author page, University of Miami), `luoyu2023` (arXiv:2302.09714, an image-only scan
recognised by OCR), `luoyu2023b` (arXiv:2305.06308), `rodnianskishlapentokhrothman2023`
(arXiv:1912.08478), `an2025` (arXiv:2401.02003), `minguzzi2019cone` (arXiv:1709.06494v4, the
Rev. Math. Phys. companion of the Living Review, used for the `C^{1,1}` and time-orientation
passages), `minguzzi2019` (Living Rev. Relativ. 22 (2019) art. 3; see the note below).
Paywalled, recorded `uncertified` and cited by locator alone: `oneill1983`,
`beemehrlicheasley1996`, `hawkingellis1973`, `wald1984`, `kupeli1987`, `christodoulou2007`.
Every final target is covered by at least one readable source, so nothing is parked on a
missing text and no `needs-references.toml` request is made.

Two corrections to the issue form:

- The form's arXiv id for Chruściel's *Elements of causality theory*, 1110.0214, resolves to an
  unrelated computer-science paper; the notes are arXiv:1110.6706. The manifest key
  `chrusciel2011` records the correct id (the wrong fetch was overwritten under the same key).
- The form's Minguzzi reference is the Living Review (DOI 10.1007/s41114-019-0019-x, open
  access, no arXiv version). The service treats the Springer DOI prefix as paywalled and
  refused it; the publisher's open-access full text is mirrored on INSPIRE, from which the
  manifest records it (`minguzzi2019`, certified, open-repository). An intermediate attempt
  fetched arXiv:1709.06494 under that key; that is a different paper by the same author (the
  Rev. Math. Phys. companion on closed cone structures), now recorded under its own key
  `minguzzi2019cone`, and the metadata of `minguzzi2019` were corrected by hand.
- The five paywalled books (O'Neill, Beem–Ehrlich–Easley, Hawking–Ellis, Wald, Christodoulou)
  could not be resolved by the service to a paywalled landing page it recognises, so it put
  them in the missing list instead of recording them `uncertified` (Kupeli, with a Springer
  DOI, was recorded `uncertified` automatically). Since the issue form directs that they be
  cited by locator only and every target is covered by an open source, they are recorded by
  hand in `sources.toml` as `uncertified` with their locators and known DOIs, and no
  `needs-references.toml` request is left for them.

The Annals articles the form cites by volume only are identified: 198 (2023) no. 1 art. 3 is
Rodnianski–Shlapentokh-Rothman; 201 (2025) no. 3 art. 3 is An; 202 (2025) no. 2 arts. 1–3 are
Dafermos–Luk and Luo–Yu I–II. They enter as motivation (consumers), not as sources of
statements.

## Suspicious text

None. No fetched text contained instructions.
