# Triage report: TARGET-DimerModelsAndLozengeTilings

Verdict: **design**, name `DimerModelsAndLozengeTilings`, no base, no owner. The brief is
`packages/DimerModelsAndLozengeTilings/target.md`; the manifest is
`packages/DimerModelsAndLozengeTilings/sources.toml`.

An earlier run of this job had written the same deliverables; they were lost when the board
checkout was reset, so this run redid the searches and the fetches (the source texts were still
in the cache) and rewrote the files.

## Consolidation against the board

Every open target and design listed in the job was compared by mathematical object.

- `DESIGN-ConstructiveFieldTheoryPhi4` (#6086): lattice φ⁴ and Ising measures in finite volume
  with free boundary, correlation inequalities, the free-boundary infinite-volume state. Its
  brief (`packages/ConstructiveFieldTheoryPhi4/target.md`, "Consumers" list) already names this
  target and records that only the vocabulary of translation-invariant infinite-volume measures
  on a product space is shared and no theorem is. Agreed: Phi4 has no Gibbs specification, no
  ergodicity, no dimers. Not a merge; the abstract ergodic layer of target 4 is offered to it as
  a consumer.
- `TARGET-HardSphereDynamicsAndKineticLimits` (#6008): deterministic hard-sphere flow and the
  Boltzmann–Grad limit; no lattice, no Gibbs measures. No overlap.
- Nothing else on the board (number theory, geometry, operator algebras, PDE targets) touches
  tilings, matchings, Gibbs measures or ergodic ℤ²-actions.

## Ownership searches

`roadmaps grep` over main and all 449 open pull requests, case-insensitive, fixed strings:

| pattern | result |
| --- | --- |
| dimer, lozenge, Sheffield, Okounkov | no match anywhere |
| Kasteleyn | only the Potts–Fortuin–Kasteleyn identity in `TemperleyLiebOperatorAlgebras` (PR #867): unrelated |
| height function | Morse-theoretic, adelic and Newton-polygon height functions only |
| perfect matching | `GraphConnectivityAndFlows` (main, Section 6.7: finite bipartite multigraph matchings, regular bipartite decomposition), `KhovanovHomology`, `SchurWeyl` (Brauer diagrams), `GeometricTopology` (PD codes): none on lattices or infinite graphs |
| Gibbs measure | `PDE` (PR #93, line 107): the two-dimensional stochastic quantisation measure only |
| determinantal | `RandomMatrices` (main) Layer 8.3: determinantal point processes from continuous kernels on ℝ and ℂ; `PointProcesses` (PR #417, lines 95–98) explicitly excludes determinantal processes and (lines 106–111) infinite-volume Gibbs processes and ergodic theorems for group actions |
| ergodic | `VonNeumannAlgebras`, `GeometryOfNumbersAndQuadraticArithmetic`, `PointProcesses` (stationarity and ergodicity as `ErgodicVAdd`, no theorem), `RandomGraphs`, `ArithmeticDynamics`: none on Gibbs measures |
| hexagonal / honeycomb / tiling | `TensorProductCombinatorics` (honeycombs in the Knutson–Tao sense, puzzles as triangle tilings): a different object |

Main roadmaps and `Completed/` listings were scanned by name: `GraphConnectivityAndFlows`,
`RandomMatrices`, `MarkovChainsAndRenewal`, `StandardDistributions`, `AmenableGroups`,
`Exchangeability` (completed) are the nearest; none defines lattice Gibbs measures, height
functions or dimers. `StandardDistributions` has the regularised incomplete beta function; the
"incomplete beta kernel" of the target is a different object (a contour integral on ℤ⁴) and
does not use it.

The packages-under-review index (`board-packages-index.txt`: AnalyticNumberTheory,
AutomorphicCongruences, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) contains
nothing related.

Libraries at the pin:

- Mathlib: `SimpleGraph.Subgraph.IsPerfectMatching`; `Ergodic` for a single map with
  `Ergodic.iff_mem_extremePoints` (`Dynamics/Ergodic/Extreme.lean`); `ErgodicSMul`/`ErgodicVAdd`
  for group actions (`Dynamics/Ergodic/Action/`); Birkhoff sums; conditional expectation;
  Krein–Milman. No Gibbs specifications, no lattice models.
- Tau Ceti: `Probability/Ergodic/` (invariant σ-algebra, mean ergodic theorem for one
  measure-preserving map, from `Exchangeability`), `Probability/DeFinetti/`; the only "gibbs"
  hits are Gibbs variational principles for tilted measures in information theory. No dimers,
  Kasteleyn or height functions.

Conclusion: nothing owns the target; it is neither a duplicate nor a Part II. No existing
roadmap develops lattice statistical mechanics, so there is no base to continue.

## Generality and shape of the brief

The filed statement is the hexagonal-lattice uniform case. The sources (kos2006 Section 2.2,
kenyon2009 Section 5) state the Gibbs/ergodic layer for perfect matchings of any periodic
bipartite graph with periodic positive weights at no extra cost, so the brief asks for that
layer in that generality and keeps the combinatorial layers (height functions, slopes,
Kasteleyn on simply connected domains, the kernel) on the hexagonal lattice, where faces are
explicit. The general planar Kasteleyn theorem and domino tilings are excluded because Mathlib
has no planar graph theory; they are named as Part II material.

Two points of the filed statement were sharpened after reading the sources:

- kenyon2009 Theorem 6 (line 836–839) states uniqueness of the ergodic Gibbs measure for every
  slope admitting a translation-invariant measure; kos2006 Theorem 2.1 (lines 217–220) and
  gorin2021 Theorem 13.12 restrict uniqueness to interior slopes, and sheffield2005 Theorem 9.5.1
  classifies the boundary. On an open edge of the slope triangle the tilings are frozen into
  rows whose heights form an arbitrary `{0,1}`-sequence, every completion set is a singleton,
  so every shift-ergodic measure of the right density on `{0,1}^ℤ` is an ergodic Gibbs measure
  of that slope: uniqueness fails, as the filed statement says, and target 8 states this with a
  concrete pair of measures.
- The explicit determinantal description (aggarwal2023 equation (1.2), from
  okounkov-reshetikhin2003 Theorem 2) is tied to the torus limit (gorin2021 Theorem 4.11 and
  Corollary 13.14, kos2006 Theorem 4.3) rather than to Schur processes, which the library does
  not have; the identification `μ_ξ = μ_{s,t}` rests on Sheffield's uniqueness or full torus
  convergence, and the brief asks the design to choose.

## Sources

Fetched through the sources service and certified (open repository or author page):
aggarwal2023 (arXiv 1907.09991v4), sheffield2005 (arXiv math/0304049v3), kos2006 (arXiv
math-ph/0311005v1), kenyon2009 (arXiv 0910.3129v1), okounkov-reshetikhin2003 (arXiv
math/0107056v3), cohn-kenyon-propp2001 (arXiv math/0008220v3), kenyon1997 (Numdam), gorin2021
(the author's pre-publication copy on their Berkeley page, which states it is free to view and
download for personal use). Every locator in the brief was read in these texts.

Paywalled, recorded as `uncertified` with DOI and locator: thurston1990 (JSTOR; the DOI landing
page answers 403) and georgii2011 (de Gruyter). The service could not classify either host, so
the two entries were written by hand with `licence_class = "none"` and `status = "uncertified"`,
and the `[[missing]]` tables it had produced were dropped, since uncertified citations are
settled and must not be requested. Nothing in the brief depends on their text: gorin2021 Theorem
1.4 gives Thurston's criterion with proof, and sheffield2005 Lemmas 3.2.1–3.2.5 restate the
Georgii results. `sources check` reports no problems.

No fetched text contained instructions; nothing suspicious to report.

## Why `design`

The target is a coherent new library (configuration spaces of matchings, Gibbs measures,
ergodic ℤ²-actions, height functions, Kasteleyn determinants, the explicit kernel) with a
single headline family of theorems (existence, Sheffield uniqueness, the determinantal
description) and a named consumer (Aggarwal's universality theorem). It builds on Mathlib alone,
optionally on `GraphConnectivityAndFlows` (main), and on no open pull request, so it can enter
the merge order anywhere. The main risk for the design is the depth of Sheffield's uniqueness
proof and the asymptotic analysis behind the kernel; both are flagged in the brief.
