# Triage report: TARGET-ConstructiveFieldTheoryPhi4

Verdict: **design**, name `ConstructiveFieldTheoryPhi4`, no base, no owner. The brief is
`packages/ConstructiveFieldTheoryPhi4/target.md`; the manifest is
`packages/ConstructiveFieldTheoryPhi4/sources.toml`.

## Consolidation against the open board

Every open target and design was compared by object (lattice spin measures, correlation
inequalities, infinite-volume Gibbs states, infrared bounds, random fields indexed by test
functions, Gaussian processes, scaling limits).

- `TARGET-DimerModelsAndLozengeTilings` (#6003): Gibbs measures for a hard-constraint dimer
  model on the hexagonal lattice, height functions, determinantal kernels. It shares the
  vocabulary of translation-invariant measures on a product space over `ℤ²` and nothing else:
  no correlation inequality, no spin measure, no scaling limit of fields. Not a merge.
- `TARGET-GaussianIsoperimetryAndClusters` (#6007): the Gaussian measure on `ℝⁿ` and geometric
  measure theory. Different objects. Not a merge.
- `TARGET-HardSphereDynamicsAndKineticLimits`, `TARGET-YangMillsConnectionsAndCaloricGauge`,
  `TARGET-HyperbolicDynamicsAndThermodynamicFormalism`: no shared object (the last uses
  "Gibbs" for equilibrium states of flows).
- All other open targets and designs are algebraic, arithmetic or geometric and share no object.

## Is it planned already?

Searched with `roadmaps grep` over the 446 open pull requests and main for: Ising (word), Griffiths,
FKG, Lebowitz, infrared bound, Gibbs state/measure, Schwinger, Wick, generalised Gaussian,
Kolmogorov extension, random field, Griffiths–Simon, Aizenman, Duminil-Copin, Fröhlich, Glimm,
lattice approximation, Peierls, reachable, Gaussian free field. Findings:

- No roadmap defines lattice φ⁴ or Ising measures, their correlation inequalities, the
  free-boundary infinite-volume state, the infrared bound, or reachable fields.
- `TauCetiRoadmap/RelativisticQuantumFieldTheory` (PR #1772, kim-em) owns the axiomatic and
  perturbative side: Schwinger distributions as test functionals, Osterwalder–Schrader
  reconstruction (RQFT7.OSConstruction, README lines 3346–3520), the free Euclidean Schwinger
  distributions in `d = 4` with their Wick identities (RQFT7.FreeReflection, lines 3481–3490),
  and it explicitly refuses functional measures (line 76). The new roadmap's objects are
  measures on finite-dimensional spaces and families of finite-dimensional laws, so the two are
  complementary; the only contact is the `d = 4` free covariance, recorded as a Check.
- `TauCetiRoadmap/PDE` (PR #93, kim-em) mentions the two-dimensional stochastic quantisation
  equation with its Wick renormalisation and Gibbs measure (README line 107): the continuum
  Φ⁴₂ measure by SPDE methods, not the lattice. Left with PDE, recorded as a boundary.
- `TauCetiRoadmap/OperatorAlgebraDynamics` (PR #1137, kim-em) D9 builds quantum spin systems,
  finite-volume Gibbs states and KMS states (README lines 2676–2810), including the Ising chain
  as an example of a quantum interaction. Operator-algebraic, not classical measures.
- `TauCetiRoadmap/QuantumFoundations` (PR #1771) cites Mathlib's Kolmogorov extension on
  standard Borel spaces for countable tensor products (README line 1030); not an owner.
- `TauCetiRoadmap/StandardDistributions` (main) owns multivariate Gaussians and the Wick–Isserlis
  mixed-moment theorem (README line 605). Supplier.
- `TauCetiRoadmap/StochasticCalculus` (PR #1030, merge order line 199) owns Gaussian processes
  indexed by time and Brownian motion, using the Tau Ceti countable projective limit (README
  lines 120–126, 934–945). Pattern supplier.
- Mathlib (pinned) has projective families and uniqueness of projective limits, the infinite
  product measure and Ionescu-Tulcea, `IsGaussianProcess`, Portmanteau, Prokhorov,
  Lévy–Prokhorov, Cramér–Wold and the Kolmogorov–Chentsov condition; it lacks the Kolmogorov
  extension theorem for an uncountable index set. Tau Ceti has
  `TauCeti.Measure.exists_isProjectiveLimit_of_countable` and the `ℕ`-indexed version
  (TauCeti/MeasureTheory/Measure/ProjectiveLimit/). No Tau Ceti declaration mentions Ising,
  Gibbs or Griffiths.
- The board packages index lists four packages under review (AnalyticNumberTheory,
  AutomorphicCongruences, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory); none is
  related. The folder `packages/ConstructiveFieldTheoryPhi4` existed only as this job's empty
  shell. No roadmap, pull request, package or merge-order line uses the name.

So nothing owns the target: `design`, not `duplicate`, and no roadmap to continue as a Part II.

## Generality

The filed wording is kept except where the sources are more general or the wording overclaims:

- Couplings: arbitrary symmetric `J ≥ 0` on a finite set for the measures and inequalities
  (as in Sokal and Peled–Spinka), nearest-neighbour for reflection positivity and the
  triviality statement.
- Single-site measures: an "admissible" class (`∫ exp(cφ²) dρ < ∞` for all `c`) for the
  definitions, FKG and finiteness; even measures for Griffiths; the Griffiths–Simon class for
  Lebowitz, the Gaussian inequality and the summit statement.
- Reachability is parametrised by the class of single-site measures. With Aizenman and
  Duminil-Copin's class (φ⁴ and Ising) the Gaussian free field is not known to be reachable in
  `d = 4` (their text says the limiting covariance is not identified, lines 192–198), so the
  filed "Gaussian free field as a reachable field" is only honest for the Gaussian class
  `ρ_{0,b}`; the brief states it that way, with the massive field in all `d ≥ 1` and the massless
  field in `d ≥ 3` as a Check.
- "Existence and uniqueness of the infinite-volume free-boundary state below the critical
  point" is split: existence and uniqueness of the monotone limit hold for all `β`; uniqueness of
  the Gibbs measure below `β_c` is a separate statement (Lebowitz–Martin-Löf for Ising, open
  source; for the Griffiths–Simon class only quoted in Aizenman–Duminil-Copin).
- The marginal-triviality theorem and its Griffiths–Simon extension are summit statements with
  `sorry`, as the issue asks and as the board does for other summit statements.

## Sources

Fetched through the sources service. Certified: Aizenman–Duminil-Copin (arXiv v4; the Annals
version is cited, numbering checked against the text: Definition 1.1, Theorem 1.2, Definition
2.1, Section 5, Theorem 7.1), Sokal 1982 (Numdam), Peled–Spinka (arXiv), Duminil-Copin's
lecture notes (arXiv), Simon's Twelve Tales (arXiv), Fröhlich 1982 (IHES preprint P/81/41;
OCR with missing displays, version note recorded). Uncertified by locator: Griffiths–Simon 1973,
Aizenman 1982, Fröhlich–Simon–Spencer 1976 (their open Project Euclid pages answered the
service with a bot-protection page, so the DOI-based uncertified entries were restored),
Glimm–Jaffe, Simon 1974 (recorded by hand with its DOI after the service could not classify the
publisher host), Fernández–Fröhlich–Sokal, Friedli–Velenik (the authors' free preprint site
and the Geneva archive refused the service; recorded by hand as uncertified with the published
DOI). Two intermediate fetches that had recorded bot-protection or access-denied pages as
certified texts were corrected. `needs-references.toml` was removed: every unreadable text is
a paywalled publication now settled as uncertified, and open substitutes cover the statements.

## Why this verdict

The target is a coherent, unowned theory with a clear supplier (StandardDistributions, Mathlib
and Tau Ceti probability) and clear consumers (a future triviality roadmap, lattice statistical
mechanics, RQFT's Euclidean side). It is not a continuation of any roadmap, so not a Part II.
The main risk is that proof-level sources for the Griffiths–Simon class are paywalled or
blocked; the brief tells the design how to proceed on Ising and φ⁴ from the open texts and
what to keep as hypotheses until a human supplies copies.

Nothing read during the job asked for commands, credentials or changes of procedure.
