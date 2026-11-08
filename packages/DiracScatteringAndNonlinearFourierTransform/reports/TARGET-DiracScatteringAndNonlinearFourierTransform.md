# Triage report — TARGET-DiracScatteringAndNonlinearFourierTransform

Verdict: **design**, roadmap `DiracScatteringAndNonlinearFourierTransform` (the suggested name,
unused by any roadmap, pull request or package). Brief in
`packages/DiracScatteringAndNonlinearFourierTransform/target.md`.

## What was searched

**Board (consolidation).** Every open target and design in the brief was compared by
mathematical object. The only neighbours are `DESIGN-SchrodingerOperatorsAndSpectralTypes`
(#6282: spectral types of an abstract self-adjoint operator, the Laplace–Beltrami operator,
`−Δ + V` on `L²(ℝ^d)` with bounded `V`; its target.md plans no ordinary differential
equation, no Dirac system and no Hardy space; it is a consumer, not an overlap) and the
roadmap pull requests UnboundedOperators (#1027), SpectralQuantumWalks (#258) and
DiscreteQuantumWalks (#259), none of which touches Dirac systems, Hermite–Biehler functions,
scattering functions or the non-linear Fourier transform. No merge.

**Roadmaps on main and at the open heads** (`roadmaps grep`, case-insensitive where useful):
`Dirac system`, `canonical system`, `Krein system`, `non-linear Fourier`, `Hermite–Biehler`,
`de Branges`, `Smirnov`, `outer function`, `SU(1,1)`, `Fatou`, `Hardy space`, `half-plane`,
`Carathéodory`, `Gronwall`, `Picard`, `scattering`. Findings:

- No roadmap mentions Dirac systems, Krein systems, the non-linear Fourier transform,
  Hermite–Biehler functions, de Branges spaces or the Smirnov class. `canonical system` matches
  only linear systems of divisors in algebraic geometry; `SU(1,1)` only
  NoncompactQuantumSymmetry's group-theoretic use; `Carathéodory` only the boundary
  correspondence (ConformalMapping, PlanarTopology) and the measure extension; `outer
  function` nothing relevant; `Fatou` only Fatou's lemma.
- `Hardy space`: OperatorTheory/ToeplitzOperators T1 on main (and #1684) builds the `p = 2`
  Hardy space of the unit disc as the nonnegative-mode subspace, its harmonic-majorant model
  and radial `L²` convergence, and says explicitly that it does not build a general Hardy
  theory; StochasticCalculus (#1030) S6.5.3 owns the disc nontangential maximal function, a
  circle maximal function and the Brownian comparison; NoncommutativeIntegration §7.2 is
  martingale Hardy spaces. No half-plane Hardy space, no `H^∞`, no outer functions, no
  Fatou theorem anywhere.
- `Gronwall`, `Picard`: PDE §6.2 and others consume Mathlib's continuous-time
  Picard–Lindelöf; nobody plans a Carathéodory (integrable-coefficient) theorem.
- UnboundedOperators (#1027) §4.8 UO-D07, read in full: Sturm–Liouville with `L¹_loc`
  coefficients, "local integral-equation existence/uniqueness" for a fixed spectral parameter,
  Weyl's alternative, and the same API for `Ju′ + Vu` with `V ∈ L¹_loc` Hermitian. It never
  states holomorphic dependence on the parameter, scattering functions or anything in Layers
  B–E. The overlap is one lemma seen from two sides; the brief records it as a Check and a
  merge-order decision.
- GlobalHolomorphicFunctions (#992), read by section list: Wirtinger calculus, Runge,
  Weierstrass, Mittag-Leffler, Cousin I. The issue's claim that it supplies bounded holomorphic
  functions on the half-plane is wrong; the brief says so.

**Libraries.** Mathlib `Analysis/ODE/`: `IsPicardLindelof` demands continuity in time; the
Gronwall file is the differential form; no Carathéodory theorem. `TendstoInMeasure` exists
(`MeasureTheory/Function/ConvergenceInMeasure.lean`). No Hardy space, outer function or Fatou
theorem in Mathlib. Tau Ceti `Analysis/Complex/`: Herglotz representation on the disc,
Nevanlinna–Pick representation on the upper half-plane with the Cayley transport of measures
(`Pick/Basic`, `Pick/Nevanlinna`, `Pick/Boundary`), disc Poisson integrals; no Hardy space.

**Sources.** Fetched through the service into the manifest: poltoratski2024 (arXiv:2103.13349
v14, OCR of an image-only scan), mauth2022 (arXiv:2210.12286, the expository account, which is
by Lukas Mauth, not by Poltoratski as the issue says), denisov2006 (the citation string found
no legal source; resolved to arXiv:0908.4049 by web search and fetched under the same key; the
stale `[[missing]]` entry the service wrote was removed), taothiele2012 (arXiv:1201.5129, OCR),
romanov2014 (arXiv:1408.6022), garnett2007 (paywalled, recorded uncertified with its DOI).
Krein 1955, de Branges 1968, Remling 2018 and Coddington–Levinson 1955 were already settled as
waived by the human answer recorded in the manifest and are cited by locator. Locators in the
brief were read in the texts: Poltoratski §1 (line 136–166), §2 (line 170–306), §5 (line
469–586, Theorem 1 at line 579); Mauth §2.1 Lemmas 1–11 (line 359–473, each with a Garnett
page), §2.3 Lemmas 13–19 (line 531–725); Denisov §11 Theorem 11.1 (line 3246–3255), §13
(line 4219–4258); Romanov §0 (line 212–227), Example 1 (line 229–241), Proposition 4 (line
780); Tao–Thiele Lecture 1 Lemma 3 (line 296), Lecture 2 Lemma 6 (line 680) and the remark that
pointwise convergence is open (line 675–677). Denisov's arXiv §§11 and 13 are the published
chapters 12 and 14 Poltoratski cites; the manifest's version note records this.
No `needs-references.toml` is left: every cited text is certified, uncertified by DOI, or waived.

## Why the verdict

- Not a duplicate: no roadmap, pull request, package or library declaration owns any of the
  five layers.
- Not a Part II: nothing on main or in a pull request develops Dirac or canonical systems,
  scattering functions or non-linear Fourier analysis, so there is no base to continue.
- Not a merge: the only board neighbour, SchrodingerOperatorsAndSpectralTypes, shares a
  future consumer relation and the abstract spectral theorem, not a planned object.
- Design: the target is a coherent library (Carathéodory systems with a holomorphic parameter,
  Dirac systems and their SU(1,1) scattering data, the `L²` scattering limit, the non-linear
  Fourier transform) with a headline theorem from a single primary source whose statement and
  setting are certified.

## Generality decisions

Layers A–D are stated for a complex locally integrable potential (the generality of Krein
systems and of the Tao–Thiele model), with the real Dirac system as the case `g = 0`; the
Carathéodory theorem is stated for Banach-space-valued systems on any interval with a
parameter holomorphic on an open set, Mathlib's continuous-time theorem and UO-D07's
fixed-parameter lemma being Checks. The headline theorem stays with real `f`, as the source
proves it. The brief flags that the proof of the headline theorem needs the Krein–de Branges
spectral theory of Dirac systems and half-plane Hardy-space theory, neither planned anywhere,
and recommends the design decide whether to carve each out as a supplier roadmap.

## Suspicious text

None. No fetched text asked for a command, a credential or a change of procedure.

## State of the package folder

The job had run before: the manifest carried the four human-waived entries but the earlier
target.md and report were absent, so both were rewritten from scratch and the six other
sources were re-fetched (from cache). Files written: `target.md`, this report, and the
manifest `sources.toml` (six entries added, locators sharpened); the scratch worklist and the
manifest-editing script stay in the job's scratch directory.
