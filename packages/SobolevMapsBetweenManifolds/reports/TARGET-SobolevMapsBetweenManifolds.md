# Triage report: TARGET-SobolevMapsBetweenManifolds

Verdict: **design**, name `SobolevMapsBetweenManifolds`, no base, no owner. The brief is
`packages/SobolevMapsBetweenManifolds/target.md`; the manifest is
`packages/SobolevMapsBetweenManifolds/sources.toml`.

## What I searched

- **Open targets and designs on the board.** Every statement in the brief's list, by object.
  The only one sharing objects is `DESIGN-QuasiregularMaps` (#6283): its `target.md` defines
  quasiregular maps on top of `W^{1,n}_loc(M, N)`, `Df`, `‖Df‖`, `J_f` and Hadamard's
  inequality and says in its Scope that it does not plan them but imports them from this
  target (#6021) by name and section. That is a consumer, not an overlap, so there is no
  merge. `DESIGN-RiemannianManifoldsWithConvexBoundary`, `DESIGN-LorentzianGeometry`,
  `TARGET-Varifolds` and `TARGET-YangMillsConnectionsAndCaloricGauge` share suppliers or an
  area (manifolds, Sobolev sections, GMT) but none plans Sobolev maps with manifold targets.
- **Roadmaps on main and open pull requests**, with `roadmaps grep` for: "Sobolev map",
  "between manifolds", `W^{1,p}_loc(M, N)` patterns, "weak differential", "harmonic map",
  "Nash embedding", "quasiconformal", "quasiregular", "Lusin", "Hadamard inequality", and
  fixed strings `W^{1,p}(M`, `W^{1,2}(M`, `_loc(M`. Findings:
  - PDE on main, Lane A: scalar `W^{k,p}(Ω)` on Euclidean domains, no local spaces, no change
    of variables, no manifold targets (`TauCetiRoadmap/PDE/README.md`, Lane A items 1–7).
  - GeometricCurrents on main, G6: defines scalar `W^{j,p}_loc(Ω)` by restriction to
    relatively compact opens, with finite-cover gluing. Supplier for the scalar local carrier.
  - GeometricMeasureTheory on main, G2: area and coarea formulas, `LinearMap.normDet` as the
    only geometric Jacobian. Supplier.
  - DifferentialGeometry on main: Layer 2 orientations (`OrientationLift`,
    `Manifold.Orientation`), 5 integration of top forms, 10.2 `IsNullSet` through charts,
    12.4 `riemannianVolumeForm`, density and the bridge to `TauCeti.riemannianVolume`; the
    convention that no measurable structure is installed on manifolds. Supplier.
  - RiemannianGeometry on main: curvature, Jacobi fields, immersions; R6 mentions relating
    chart Lebesgue nullity to the canonical density for focal sets. Noted for one-owner
    coordination of the null-set lemma. PR #1683's "C¹ map between manifolds of the same
    dimension" is a Sard application, not a Jacobian definition.
  - PseudoholomorphicCurveAnalysis (PR #1793): PH1.1 defines a planar vector-valued
    `MemWkpLoc` on open subsets of `ℂ` with composition and change of variables for
    `kp > 2` (PH1.2), and PH4.1 defines `W^{k,p}_loc(Σ, M)` for maps from a surface with
    isothermal charts, `k ≥ 1`, `kp > 2`, with a weak differential. This is a sibling special
    case (dimension two, isothermal charts, Morrey regime) and not the general theory with
    arbitrary `m`, all `p ≥ 1`, metrics and Jacobians; recorded as a Check target for
    reconciliation.
  - TeichmullerGeometry (PR #1169) §7.4: quasiconformal maps as `W^{1,2}_loc` homeomorphisms
    of planar domains with the Beltrami equation and chart invariance on Riemann surfaces.
    Two-dimensional sibling, not an owner.
  - SobolevDifferentialForms (PR #1609) §4.1 and SobolevPolynomialApproximation (PR #1612)
    §2.1: pullback and composition with `C¹`/`C^k` diffeomorphisms with globally bounded
    derivatives on Euclidean domains, for forms resp. scalar `W^{k,p}`. Global special cases
    of chain rule (a); neither is on main or in the merge order; both name `W1p.compL`,
    which is not in the pin.
  - SpectralManifolds, ComplexKahlerGeometry K5a, PseudodifferentialOperators P5,
    PositiveMass: Sobolev spaces of sections of bundles over manifolds (linear targets).
    Different objects.
  - No roadmap, pull request or package defines `W^{1,p}_loc(M, N)` for manifold targets in
    general dimension, the chart-independent weak differential, `‖Df‖`, or the Jacobian
    `J_f` with `(Df)^* vol_N = J_f vol_M`. `roadmaps grep 'SobolevMapsBetweenManifolds'` finds
    no roadmap already naming it; only the QuasiregularMaps design on the board does.
- **Board packages** (`packages/`, the under-review index): no package named for Sobolev
  maps; `packages/QuasiregularMaps/target.md` is the consumer above; `packages/PDE`,
  `packages/CalibratedGeometry` hold only reports and manifests.
- **Merge order** (`merge-order/ORDER.txt`): PDE, DifferentialGeometry, RiemannianGeometry,
  GeometricMeasureTheory, GeometricCurrents and SuccessiveMinima are on main and not in the
  order; CalibratedGeometry sits at 214; QuasiregularMaps is a design and not yet placed.
  All suppliers being on main, the new roadmap can enter anywhere before QuasiregularMaps.
- **Pinned libraries.** Tau Ceti: `TauCeti/Analysis/Sobolev/W1p/Basic.lean` (`W1p` is
  scalar, on an open subset of a finite-dimensional inner product space, global `L^p`),
  `WeakDeriv/Basic.lean` (`HasWeakFDerivOn` is vector-valued), `W1p/ChainRule.lean`
  (`W1p.hasWeakFDerivOn_comp`: scalar Lipschitz `C¹` function, `p ≠ ∞`), `Wkp/Basic.lean`
  (scalar higher order), `W1p/Morrey.lean`; no `compL`, no change of variables, no local
  class. `Geometry/Manifold/Orientation.lean` (`Orientable` via `IsOrientedAtlas`);
  `Geometry/Manifold/Riemannian/VolumeDensity/*` (`riemannianVolume`,
  `chartRiemannianVolume`, `chartVolumeDensity`, `chartVolumeDensity_changeChart`,
  `chartVolumeDensity_eq_abs_det_mul_of_inner_mfderiv`); no `IsNullSet`, no
  `riemannianVolumeForm`, no `OrientationLift`. Mathlib: `IsRiemannianManifold`,
  `IsSmoothEmbedding`, `exists_embedding_euclidean_of_compact`, `mfderiv`,
  `LinearMap.normDet` with `normDet_eq_abs_det`, the Jacobian change of variables
  (`lintegral_image_eq_lintegral_abs_det_fderiv_mul`); no determinant Hadamard inequality
  (only the Hadamard product). SuccessiveMinima 0.1.2 on main plans the Gram–Hadamard bound;
  Completed/HeightsAndUnits has an `ℓ¹` variant.
- **Consumers named by the filer.** CalibratedGeometry (#946) and VariationalMethods (#1028)
  READMEs at their heads mention Sobolev spaces only through PDE Lane A's scalar spaces and
  bundle Sobolev spaces; neither refers to manifold-valued Sobolev maps. Recorded as possible
  later consumers only.

## Why the verdict

Nothing on main, at the open heads, on the board or in the pins owns the objects: the
continuous class `W^{1,p}_loc(M, N)` in general dimension with its chart independence, the
a.e. weak differential as a field between tangent spaces, its operator norm, the Jacobian
through volume forms and its measure. The nearest work is a dimension-two,
isothermal-chart, `kp > 2` sibling (PH4.1) and two-dimensional quasiconformal maps
(TeichmullerGeometry §7.4), both narrower and neither a base the target continues; so not
`part-ii`. The QuasiregularMaps design explicitly waits for this carrier; so not a merge. A
new roadmap, `design`, with the suggested name, which no roadmap, pull request or package
uses.

## Generality decisions

- Chain rule (a) is stated for `C¹` diffeomorphisms and local diffeomorphisms, not `C^∞`.
- The pullback measure `f^* vol_N = J_f vol_M` is locally finite only when `J_f ∈ L¹_loc`,
  which Hadamard gives for `p ≥ n`; the filed unconditional wording was corrected.
- The continuous chartwise class is kept as the core, since consumers need continuous maps
  and the chartwise definition needs continuity; the embedding-defined class for measurable
  maps (Hajlasz2009 line 28) is added as an owned definition with its equivalence for
  continuous maps (T5) and the independence of the embedding as a stated target (T7),
  because the library's harmonic-map users need discontinuous Sobolev maps.
- Nash's theorem is not planned: isometry of the embedding is a hypothesis.

## Sources

Fetched through the sources service into `packages/SobolevMapsBetweenManifolds/sources.toml`:

- `HeikkilaPankka2025`, arXiv 2302.11440v2, certified (open repository). Read lines 15–35
  (definition of quasiregular maps through `W^{1,n}_loc(M, N)`), 1234–1262 and 1318–1339
  (Appendix B, the embedding description through a Nash embedding).
- `Hajlasz2009`, from the author's University of Pittsburgh page, certified (author page).
  Read lines 15–32 (embedding definition of `W^{1,p}(M, N)`) and 120–140 (§2, Theorem 2.1).
  The first service call with the plain citation found no legal source; the second, with the
  author-page URL and `--licence-class author-page`, succeeded. Authors, title, year and venue
  were filled in by hand since the URL carried no metadata.
- `MartioRickmanVaisala1969`, Annales Fennici Mathematici open site, certified
  (institutional). Read lines 124, 332–340, 409–420.
- `Bethuel1991`: the Project Euclid PDF and landing page both returned a bot-protection
  page to the service (a 5-line stub). I changed the entry's status to `uncertified` with a
  note and removed the cache fields that pointed at the stub; the DOI and locator stay.
- `Ziemer1989`, `Mazya2011`, `Rickman1993`, `Lee2012`: paywalled Springer DOIs, recorded
  `uncertified` with locators.
- Not recorded: Evans–Gariepy (duplicates Ziemer's chain rule, paywalled), HKST (metric
  targets, out of scope), Nash 1956 (not needed; JSTOR only). The service had written
  `[[missing]]` entries for Hajłasz, Nash and Martio–Rickman–Väisälä before the successful
  or withdrawn attempts; all three are resolved, so `needs-references.toml` was removed and
  no human request is open.

## Notes

- A previous run of this job had written the deliverables; they were lost when the board
  checkout was reset, and only its worklist survived in scratch. Every finding above was
  re-verified in this run against the files named.
- No fetched text contained instructions; nothing suspicious to report.
