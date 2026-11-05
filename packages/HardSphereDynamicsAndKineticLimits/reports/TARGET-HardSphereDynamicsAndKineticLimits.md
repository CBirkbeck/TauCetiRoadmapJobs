# TARGET-HardSphereDynamicsAndKineticLimits: triage report

Verdict: `design`, name `HardSphereDynamicsAndKineticLimits` (the suggested name, unused anywhere).
Brief: `packages/HardSphereDynamicsAndKineticLimits/target.md`.
Manifest: `packages/HardSphereDynamicsAndKineticLimits/sources.toml` (nine entries, three certified).

## What I searched

**Consolidation against the open board.** I compared the target with every open target and design
listed in the brief by object. The only neighbour is `TARGET-MathematicalBilliards` (#6012): a single
point particle reflecting in a strictly convex planar table, with the billiard ball map on the phase
cylinder. The hard sphere system is N spheres on a torus (or ℝ^d) with pairwise specular scattering,
an a.e.-defined measure-preserving flow in dimension 2dN, equilibrium measures and a kinetic limit.
The two share no structure, no statement and no supplier beyond Mathlib; the classical reduction of
two hard discs to a dispersing billiard is a theorem neither target states. No merge.
`DESIGN-ConstructiveFieldTheoryPhi4` (#6086) and `DESIGN-DimerModelsAndLozengeTilings` (#6096) are
lattice statistical mechanics and share only the words "Gibbs measure"; their Gibbs measures are
lattice spin measures, not phase-space densities. `TARGET-HyperbolicDynamicsAndThermodynamicFormalism`
(#6010) is about Anosov flows on compact manifolds; the hard sphere flow is neither smooth nor
everywhere defined. No overlap.

**Ownership.** `roadmaps grep` (main plus all open pull requests) for `hard sphere`, `Boltzmann–Grad`,
`Lanford`, `BBGKY`, `kinetic theory`, `Boltzmann equation`: no match anywhere. `specular`,
`billiard`, `elastic collision`, `collision`: only unrelated uses (RestrictedThreeBody's collision-free
Kepler domain, naming collisions). `Liouville`: the complex-analytic theorem in PDE and others, the
Liouville/Jacobian formula in IncompressibleFlows Layer 3, Liouville's theorem for smooth
Hamiltonian flows in HamiltonianSystems Layer 2. `grand canonical`, `Gibbs measure`, `empirical
measure`: OperatorAlgebraDynamics and AnalyticNumberTheoryPartII (KMS and quantum Gibbs states),
ProbabilisticAndMetricNumberTheory and ArithmeticStatisticsPartV (empirical measures of sequences),
none of them phase-space objects. The board package index lists four packages under review
(AnalyticNumberTheory, AutomorphicCongruences, LawrenceVenkateshMethod,
LogicAndDefinabilityInNumberTheory), none related. The board folders `HamiltonianSystems`,
`IncompressibleFlows`, `PointProcesses` hold only review reports; the roadmaps themselves live in
pull requests #480, #237, #417, which I read through `roadmaps show`.

**Libraries at the pin.** Mathlib has `UnitAddTorus` as `Fin d → UnitAddCircle` with a normed
group structure, a Haar probability measure, the measure-preserving identification with a
fundamental cell and multidimensional Fourier series (`Mathlib/Analysis/Fourier/AddCircleMulti.lean`);
`Flow` (everywhere-defined continuous flows); ODE uniqueness (`ODE_solution_unique`);
`Measure.toSphere` for polar integration; `poissonMeasure`, `gaussianReal`. Tau Ceti has
`flowOfLipschitz` and a `Dynamics/Flow` folder (conjugacy, Lyapunov, stable sets), the empirical
measure of a finite population (`Probability/Process/EmpiricalMeasure.lean`), Poisson and Gaussian
distribution folders, and an ergodic-theory folder (Koopman, mean ergodic theorem). Nothing on hard
spheres, specular reflection, a.e.-defined flows, or kinetic equations. The `SymplecticForm`
declarations HamiltonianSystems compares with are in `Geometry/Symplectic`; `hamiltonianFlow` itself
is not at the pin, which HamiltonianSystems' README already records.

## What I found in the sources

GST2013 (arXiv:1208.5753v2) proves the finite-N Alexander theorem as Proposition 4.1.1 (line 862)
from Lemma 4.1.1 (line 867), on ℝ^d, and attributes the statement to Lanford's Proposition 4.3 and
the full proof to Alexander's infinite-system paper (line 855). It gives the scattering law (4.1.2)
at lines 843–847, the Liouville equation with its boundary condition (4.2.1) at lines 911–918, the
marginals (4.2.2)–(4.2.3) at lines 929–937, the weak formulation at lines 941–958, the informal
Lanford statement as Theorem 4 (line 668) and the precise one as Theorem 8 (line 2069). Its only
remark on the torus is a one-line outlook (line 5430). BGSS2023 (arXiv:2008.10403v2) sets the model
on 𝕋^d, d ≥ 2 (line 119), gives the specular boundary condition (1.1.4) at line 152, the grand
canonical phase space at lines 161–166, the measure (1.1.6) at line 170, the scaling μ_ε = ε^{−(d−1)}
at lines 212–217, the correlation functions (1.1.10) at line 270, the Boltzmann equation (1.2.1)
at line 293, Lanford's theorem for the grand canonical measure as Theorem 1 (line 316), the empirical
measure (1.2.4) at line 325, and the law of large numbers as Corollary 1.2.1 (line 344) with a
variance proof (lines 352–371) that uses only the correlation functions. DengHaniMa2024
(arXiv:2408.07818v3) defines the dynamics as conditions on paths (Definition 1.1, line 140) with
left-continuous velocities (line 166), on ℝ^d, and states its long-time theorem as Theorem 1
(line 291).

So the model exists at two generalities, ℝ^d and 𝕋^d, and the brief owns both with the torus as
the primary instance (the filed wording and the one on which the grand canonical measure
normalises). The filed statement is otherwise at the sources' generality; no special case was
promoted. One convention conflict was found and recorded: the one-sided continuity of velocity
paths (issue form right-continuous, DengHaniMa2024 left-continuous, GST2013 and BGSS2023 marginals
left-continuous in time).

## Why `design`

Nothing owns any piece of the target: not a roadmap, not a pull request, not a package, not the
libraries. It continues no existing roadmap: HamiltonianSystems stops at smooth Hamiltonian flows,
IncompressibleFlows at smooth divergence-free fields and DiPerna–Lions transport, PointProcesses at
point processes without dynamics. So it is neither a duplicate nor a Part II. It is a new roadmap
with three open pull requests of other authors as suppliers (consumed at their heads) and
StandardDistributions on main. It is not placed in `merge-order/ORDER.txt` after any supplier,
since none of its suppliers is in that order; it goes at the end.

## Sources and the manifest

Fetched through the service: GST2013, BGSS2023, DengHaniMa2024 (certified, arXiv). Recorded
uncertified by the service (paywalled Springer DOIs): Lanford1975, CIP1994, Spohn1991. Two open
Project Euclid papers, Alexander1976 and Uchiyama1988, could not be read: on every attempt
(DOI, landing page, `.full` page, `.pdf` link) projecteuclid.org answered the service with an
Incapsula bot-protection page, which the service stored as a one-line "certified" text. I corrected
both manifest entries by hand to `uncertified` with a `version_note` explaining the block and
removed the fetch record of the block page; Uchiyama's entry also lacked authors, title and year,
which I added. Alexander's thesis exists on eScholarship (a legal institutional copy) but answered
HTTP 403 to the service; I recorded it by hand as `uncertified`. None of the three is needed:
GST2013 Proposition 4.1.1 proves the finite-N theorem in full, BGSS2023 states it on the torus, and
Uchiyama is a secondary exposition of Lanford's theorem, which the roadmap only states. I therefore
left no request in `needs-references.toml` (the service's two provisional entries, for Uchiyama and
the thesis, were removed once both were settled as uncertified citations). If a human can supply
the Project Euclid texts or the thesis through another legal route, the design can certify them,
but the design does not wait for them.

Nothing suspicious was found in any fetched text.

## Files written

- `packages/HardSphereDynamicsAndKineticLimits/target.md`
- `packages/HardSphereDynamicsAndKineticLimits/sources.toml` (service plus the hand corrections above)
- `packages/HardSphereDynamicsAndKineticLimits/reports/TARGET-HardSphereDynamicsAndKineticLimits.md`
