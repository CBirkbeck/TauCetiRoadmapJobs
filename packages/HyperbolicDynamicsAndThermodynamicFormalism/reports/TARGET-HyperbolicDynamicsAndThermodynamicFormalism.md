# Triage report: TARGET-HyperbolicDynamicsAndThermodynamicFormalism

Verdict: **design**, name `HyperbolicDynamicsAndThermodynamicFormalism` (the suggested name, unused
anywhere). The brief is `packages/HyperbolicDynamicsAndThermodynamicFormalism/target.md`; the
manifest is `packages/HyperbolicDynamicsAndThermodynamicFormalism/sources.toml`.

## What I searched

Mathematical objects searched, not only names: hyperbolic sets, Anosov flows and diffeomorphisms,
adapted (Lyapunov) metrics, expansivity, specification, Markov partitions, subshifts of finite
type, Gibbs measures, Kolmogorov–Sinai entropy, topological entropy, variational principle,
pressure, equilibrium states, measures of maximal entropy, SRB measures, upper semicontinuity of
entropy, Newhouse, Abramov, geodesic flows in negative curvature, Liouville measure.

1. **Open targets and designs on the board** (the list in the job). Read in full:
   `TARGET-MathematicalBilliards` (#6012, issue text: convex billiards as twist maps and polygonal
   billiards with their Liouville measure; no hyperbolic sets, no entropy, no pressure);
   `DESIGN-HardSphereDynamicsAndKineticLimits` (`packages/HardSphereDynamicsAndKineticLimits/target.md`:
   hard-sphere flow, Alexander's theorem, Boltzmann–Grad; no hyperbolicity or entropy);
   `DESIGN-DynamicalDegreesOfRationalMaps` (algebraic dynamical degrees). None plans the same
   theory; they share at most an area. No merge.
2. **Roadmaps on main and at the open heads** with `roadmaps grep` for the terms above. Hits and
   what they own:
   - `GeometryOfNumbersAndQuadraticArithmetic` §4.2 (PR #851): Howe–Moore, Moore ergodicity,
     Ratner, and the entropy API `finitePartitionEntropy`, `countablePartitionEntropy`,
     `conditionalPartitionEntropy`, `partitionEntropyRate`, `measureEntropy` for measure-preserving
     maps, plus Kac's lemma and leaf entropies on homogeneous spaces. It owns the measure entropy;
     it does not define topological entropy for general maps, pressure or equilibrium states.
   - `ProbabilisticAndMetricNumberTheory` §§4.1–4.3 (PR #1421): the pointwise Birkhoff theorem
     `birkhoff_pointwise`, `birkhoff_pointwise_ergodic`; §5.2 Shannon entropy.
   - `ArithmeticDynamics` §§2.6–2.7 (PR #1335): comparison of the entropy APIs, h_μ as a
     supremum over finite partitions, conditional entropy against a σ-algebra, chain rule,
     Shannon–McMillan–Breiman, ergodic decomposition with h_μ = ∫ h_{μ_x}, the inequality
     h_μ(T) ≤ `Dynamics.coverEntropy` on compact metric spaces, and (§§2.67, 2.85–2.92) the
     measure of maximal entropy of a rational map of ℙ¹ (Lyubich). It does not state the
     variational principle, pressure, or equilibrium states in general.
   - `OperatorAlgebraDynamics` (main, §D9): mean entropy, pressure and the variational principle
     for *quantum spin systems* on ℤ^ν (Bratteli–Robinson Theorems 6.2.40, 6.2.42). Different
     objects: states on a C*-algebra, not invariant measures of a map.
   - `GeometricTopology` (PR #903) and `TaubesGromov` (main, §TG11.2) mention Anosov torus
     bundles and the matrix (2 1; 1 1) as examples; neither defines an Anosov map.
   - `HamiltonianSystems` (PR #480), `SymplecticGeometry/ConvexityToric` (PR #1651): Hamiltonian
     flows and Liouville measure; `IntegrableSystems`: the geodesic flow as the kinetic
     Hamiltonian flow. No hyperbolicity.
   - `PointProcesses` (PR #417): stationarity, ergodicity and mixing of point processes, with
     "no ergodic theorem proved". `FactorRigidity` (PR #876): mixing of trace-preserving actions.
   - No hit anywhere for "hyperbolic set", "Anosov flow", "equilibrium state" (classical),
     "topological pressure", "variational principle" (classical), "SRB", "Bowen–Ruelle",
     "Markov partition", "specification", "upper semicontinuous entropy", "Newhouse", "Abramov".
3. **Board packages** (`board/packages`, 554 folders, and the four packages of the index file
   `board-packages-index.txt`): no package named for dynamics beyond `ArithmeticDynamics`,
   `ArithmeticDynamicsPartII`, `DynamicalDegreesOfRationalMaps`, `HardSphereDynamicsAndKineticLimits`,
   `IncompressibleFlows` (Navier–Stokes), `OperatorAlgebraDynamics`, `RicciFlow`,
   `BallQuotientsAndComplexHyperbolicLattices`. The folder
   `packages/HyperbolicDynamicsAndThermodynamicFormalism/` existed with an empty `reports/` only.
4. **The pinned Mathlib.** `Mathlib/Dynamics/TopologicalEntropy/{CoverEntropy,NetEntropy,
   DynamicalEntourage,Subset,Semiconj}.lean` (Bowen's spanning and separated-set entropies,
   EReal-valued, uniform-space based); `Dynamics/Flow.lean` (`Flow`, invariance, orbits,
   semiconjugacy, no measure theory); `Dynamics/Ergodic/{Ergodic,Extreme,EmpiricalMeasure,
   Conservative,MeasurePreserving}.lean` (ergodicity, ergodic measures as extreme points,
   Krylov–Bogolyubov); `Dynamics/BirkhoffSum`; `Dynamics/SymbolicDynamics/Basic.lean` (subshifts,
   cylinders, forbidden patterns; no entropy of a subshift); `Dynamics/{Minimal,Transitive}.lean`;
   `Topology/MetricSpace/Holder.lean`; `Geometry/Manifold/VectorBundle/Riemannian.lean`
   (`IsContMDiffRiemannianBundle`); `MeasureTheory/Measure/Prokhorov.lean`. No hyperbolic set, no
   pressure, no measure entropy, no variational principle.
5. **The pinned Tau Ceti.** `Dynamics/Flow/{OfLipschitz,Graph,ConnectingOrbit,Lyapunov,Conjugacy,
   Stable}.lean` (flows of Lipschitz fields, stable sets, Lyapunov functions);
   `Geometry/Manifold/IntegralCurve/{Maximal,Flow,SmoothFlow,SmoothDependence}.lean` (maximal flow
   of a C^r field, group law, completeness on compact manifolds);
   `Geometry/Manifold/Riemannian/Geodesic/Flow.lean` (`contMDiffOn_maximalIntegralCurve_geodesicSpray`,
   the geodesic flow on the tangent bundle); `Riemannian/VolumeDensity`; `Riemannian/Isometry/
   LeviCivita.lean`; `InformationTheory/KullbackLeibler`. Only "entropy" hits are relative entropies
   of matrices and Kullback–Leibler. Nothing on hyperbolicity or thermodynamic formalism.
6. **Supplier roadmaps on main**: `DifferentialGeometry` (Layer 3 flows, Layer 12 metrics),
   `RiemannianGeometry` (R1 curvature, R2 Jacobi fields, R4 Cartan–Hadamard and space forms, unit
   tangent sphere bundle in R4), both consumed by the brief.

## Why the verdict

- Not a duplicate: no roadmap, pull request, package or library declaration defines hyperbolic
  sets, Anosov systems, pressure or equilibrium states; the classical variational principle is
  stated nowhere (ArithmeticDynamics proves only h_μ ≤ h_top and uses Lyubich's measure for
  rational maps; OperatorAlgebraDynamics proves the quantum lattice version).
- Not a Part II: no base roadmap goes in this direction. The entropy foundations are split among
  three roadmaps that are each about something else (homogeneous dynamics, metric number theory,
  arithmetic dynamics); the natural base of a Part II would be none of them.
- Not a merge: MathematicalBilliards and HardSphereDynamics share the area, not the objects.
- So `design`. The brief imports the measure-entropy API from GeometryOfNumbersAndQuadraticArithmetic
  §4.2, the Birkhoff theorem from ProbabilisticAndMetricNumberTheory §§4.1–4.3, and the
  Shannon–McMillan–Breiman theorem, ergodic decomposition with entropy integration and the
  inequality h_μ ≤ h_top from ArithmeticDynamics §§2.6–2.7, all earlier in the merge order
  (lines 67, 256, 318 of `merge-order/ORDER.txt` at the time of this run); the new roadmap goes
  after line 318, directly after ArithmeticDynamics.
- Generality: the filed statement is already general (compact metric spaces, compact manifolds of
  any dimension, hyperbolic sets with Anosov as the case Λ = M). I kept it and made the C²
  hypothesis of the summit explicit as the one the sources prove. Newhouse's theorem is an input
  stated with `sorry`, as filed; the brief says so.

## Sources

Fetched through the sources service; every work has one key.

| key | status | where |
|---|---|---|
| BowenRuelle1975 | certified | Ruelle's IHES publication page (author page); EuDML 142336 gives only metadata |
| BCS2022 | certified | arXiv:1811.02240v2 |
| TsujiiZhang2023 | certified | arXiv:2006.04293v1 (Ann. of Math. 197 (2023), no. 1, 65–158, the issue's second article) |
| Misiurewicz1976 | certified | Numdam, Astérisque 40 |
| Walters1982 | uncertified | Springer DOI, paywalled |
| Bowen1975 | uncertified | Springer DOI, paywalled; a copy on the editor's CPHT page returned 404 |
| BowenWalters1972 | uncertified | Elsevier DOI, paywalled |
| FH2019 | uncertified | EMS Press landing page says a subscription is required (not open access, contrary to the issue form) |
| KatokHasselblatt1995 | uncertified | Cambridge Core, paywalled |
| Newhouse1989 | uncertified | JSTOR, paywalled; no open copy found by search |
| Anosov 1967 | not in the manifest | Math-Net.Ru record Mi tm2795 offers the open 23 MB scan; the service timed out on six attempts over two runs, including on the record page itself (host unreachable from the worker); left to the design |

The three "no licence class" landing-page failures (FH2019, KatokHasselblatt1995, Newhouse1989) I
recorded by hand as `uncertified` with DOI and locator, as the brief directs for paywalled
texts, and removed them from `needs-references.toml`; Bowen1975 was already uncertified in the
manifest and its duplicate missing entry was dropped. There is no open request. The first run
asked for Anosov 1967 after three timeouts and the job was parked; the job was re-run with no
human answer, and three further attempts in this run (the direct full-text URL, the record page,
the Russian-language variant) timed out as well, so Math-Net.Ru is unreachable from the worker
rather than closed. The text is needed only for the geodesic-flow example, which the uncertified
Fisher–Hasselblatt and Katok–Hasselblatt locators also cover, and nothing in the brief depends
on its content; rather than park the job a second time on a network outage, I list it in the
brief among the works the design must record itself (with the AMS 1969 translation as a local
alternative if the operator holds it). The design's own sources pass is the right place to
retry.

Identification of the issue's unnamed "Annals 197 (2023), no. 1, second article": Tsujii and
Zhang, *Smooth mixing Anosov flows in dimension three are exponentially mixing*, pp. 65–158,
whose Definition 3.5 (TsujiiZhang2023 lines 485–495) defines the pressure in the variational
form and ν_{g,F} as the unique equilibrium measure, exactly as the issue describes.

## Second run

The job was re-run on 2026-11-04 after the first run's deliverables stayed unsubmitted. This run
re-checked, against the refreshed pull-request index (453 open roadmap pull requests), the
ownership greps for hyperbolic sets, Anosov systems, equilibrium states and measures, pressure,
the variational principle, measures of maximal entropy, SRB measures, Markov partitions,
expansivity and specification, topological entropy, and Kolmogorov–Sinai entropy: the only
hits remain ArithmeticDynamics (#1335), GeometryOfNumbersAndQuadraticArithmetic (#851) and
OperatorAlgebraDynamics (quantum), plus unrelated uses of the words "pressure", "hyperbolic set"
and "Newhouse" in other areas. The verdict stands. Two corrections were made to the first
run's brief: Mathlib has no `Dynamics.netEntropy`; the separated-set entropy is
`Dynamics.netEntropyEntourage`, identified with `Dynamics.coverEntropy` by
`Dynamics.coverEntropy_eq_iSup_netEntropyEntourage` (checked in the pinned
`Mathlib/Dynamics/TopologicalEntropy/NetEntropy.lean`); and two section numbers I could not verify
in paywalled texts (a Katok–Hasselblatt section for geodesic flows and a Walters section for the
nonexistence remark) were replaced by chapter locators, with Misiurewicz's 1973 example named as
a work the design must settle. Every Mathlib and Tau Ceti name the brief cites was checked
against the pinned sources. The manifest passes `sources check` with no problems.

## Notes for the design

- The largest foundation gap is the stable manifold theorem for hyperbolic sets (needed by every
  route to Bowen–Ruelle) and, depending on the route, either Markov partitions and symbolic
  dynamics for flows or expansivity plus specification. The brief lists both routes and asks the
  design to choose and plan the whole route.
- Nothing suspicious was found in any fetched text or issue; no text asked for any action.

## Third run

The second run finished with its deliverables written, but the worker's round log shows the job
was released afterwards because the worker process had restarted and held no lease; nothing was
refused for content. This run restored the second run's brief, manifest and report to the board
package and re-verified them: the merge-order lines of the three entropy suppliers are unchanged
(67, 256, 318); the ownership greps for Anosov systems, equilibrium states and measures,
topological pressure, the variational principle, hyperbolic sets, SRB measures, Markov partitions
and measures of maximal entropy, against the pull-request index of 2026-11-04T23:43Z, return the
same hits as before (OperatorAlgebraDynamics, quantum; ArithmeticDynamics, Lyubich's measure and
archimedean equilibrium measures of rational maps; GeometricTopology and TaubesGromov, examples
only); the manifest passes `sources check` with no problems. The verdict stands.
One further fetch of Anosov 1967 from Math-Net.Ru timed out as well (the seventh attempt across
three runs); no new request was filed, and the brief's treatment of that text is unchanged.
