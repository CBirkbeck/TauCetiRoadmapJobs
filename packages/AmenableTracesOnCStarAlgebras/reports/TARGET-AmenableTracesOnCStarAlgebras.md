# TARGET-AmenableTracesOnCStarAlgebras: triage report

Verdict: `design`, name `AmenableTracesOnCStarAlgebras` (the suggested name, unused by any roadmap,
pull request or package).

This is the second run of the job. The first run did the searches below, fetched the open
sources, and stopped with a references request for four paywalled texts. A human waived all four
(`connes1976`, `brown-ozawa2008`, `paulsen2002`, `pedersen2018`); they are now settled in the
manifest and cited by locator. This run re-recorded the four open sources in the manifest (same
hashes as before, so the line numbers quoted in `target.md` are unchanged), re-read every quoted
passage, re-checked the supplier sections, re-ran the ownership searches and wrote the brief.

## What was searched

- **Open targets and designs on the board.** Compared the statement with every open target listed
  in the brief by object. The only operator-theoretic one is
  `TARGET-SchattenClassesAndSchurMultipliers` (#6019: Schatten classes, Hilbert–Schmidt kernels,
  Schur multipliers), which shares the Hilbert–Schmidt norm as a tool and nothing else. No open
  target or design (including `DESIGN-RationalAnalyticPrismatization` and
  `TARGET-BallQuotientsAndComplexHyperbolicLattices`) plans tracial states, amenable traces,
  hypertraces or quasidiagonal traces. No merge.
- **Roadmaps on main, open pull requests, board packages** (`roadmaps grep`, case-insensitive):
  `amenable trace`, `hypertrace`, `quasidiagonal`, `tracial state`, `Kadison–Schwarz`,
  `Stinespring`, `Schafhauser`, `Tikuisis`, `Connes–Kirchberg`, `Hulanicki`, `Rosenberg`,
  `Powers–Størmer`. Findings:
  - "amenable trace" and "quasidiagonal trace" occur nowhere on main or in any open pull request.
  - "hypertrace" occurs only in VonNeumannAlgebras (#889) V13b, for finite von Neumann algebras
    on `B(L²M)` (README line 3858), and in its consumers Subfactors (#874) and FactorRigidity
    (#876), which cite V13's hypertraces for von Neumann algebras. None defines an amenable
    trace on a C*-algebra.
  - "quasidiagonal" is owned at the algebra level by CStarAlgebras (#860) C8 (Voiculescu,
    u.c.p.-maps-to-matrices criterion) and used by CStarClassification (#863) CL5; no roadmap
    defines quasidiagonal traces.
  - "tracial state" occurs as a definition in VonNeumannAlgebras V5 (`tracialState_unique` on
    factors, `M_n` with `tr/n`), as the canonical trace on `C*_r(Γ)` in OperatorAlgebraDynamics
    #1137 D2.FreeGroups (`reducedFreeGroup_trace_unique`), as trace spaces of AF algebras in
    CStarClassification CL3.4–3.5, and in FreeProbability, TypeAHeckeAlgebras,
    TemperleyLiebOperatorAlgebras, NoncommutativeIntegration as a hypothesis. None develops
    approximation properties of traces.
- **Libraries.** Mathlib has `CompletelyPositiveMap` (`A →CP B`, order-only morphism class),
  `PositiveLinearMap` with `PositiveLinearMap.GNS`, `CStarMatrix` and `Matrix.trace`; it has no
  tracial-state structure on C*-algebras and nothing on amenable traces. Tau Ceti's
  `Analysis/CStarAlgebra` folder holds character-space measures and unitary characters only.
- **Merge order.** VonNeumannAlgebras is at line 5, CStarClassification at 217, FactorRigidity at
  219; CStarAlgebras and OperatorAlgebraDynamics are not in `ORDER.txt` (another author's pull
  request and a roadmap on main). The new roadmap belongs after CStarClassification.
- **Supplier sections re-checked at the open heads** (readme copies of 2026-11-04): CStarAlgebras
  C3–C9 (Schwarz inequality and multiplicative domains in C4, quasidiagonality in C8, local
  reflexivity in C9); VonNeumannAlgebras V0 (GNS), V5 (`tracialState_unique`), V13a/V13b
  (hypertraces, Powers–Størmer, Følner criterion, semidiscrete iff injective);
  CStarClassification CL3.4–3.5 (traces of AF algebras, UHF unique trace); OperatorAlgebraDynamics
  D2, D6 and #1137 D2.FreeGroups; AmenableGroups Layer 5 (`amenable_iff_hasFoelnerSets`);
  FactorRigidity Layer 1.3 (`L²(M) ≺ coarse(M)` iff amenable, through V13b).

## Why `design` and not `part-ii` or `duplicate`

- Nothing owns the target: no definition of amenable, quasidiagonal or uniform amenable traces,
  no hypertrace at the C*-level, no nuclear/exact characterisation, no permanence results.
- The target was filed as continuing OperatorAlgebraDynamics, but that roadmap's tracial content
  is a hypothesis for KMS states and group traces, not approximation theory; the target does not
  start where OperatorAlgebraDynamics stops. It is closer to a continuation of CStarAlgebras
  C6–C8 (Brown–Ozawa chapters 6–7 follow chapters 2–5 of the same book), but it equally rests on
  VonNeumannAlgebras V13b (hypertraces, injectivity) and CStarClassification CL3, and
  CStarAlgebras is itself still an open pull request by another author. A Part II of
  CStarAlgebras would misplace a roadmap whose three suppliers are peers. Hence a new roadmap with
  the filed name.

## Generality

Brown's memoir (`brown2006`), the only fully readable primary source, assumes `A` separable and
unital (line 358). The brief states the roadmap for arbitrary C*-algebras with nets, derives
sequences from separability and u.c.p. maps from unitality, and handles nonunital `A` by Brown's
Proposition 3.5.10; the separable unital statements become Checks. The exact-case theorem is
stated with injectivity of `π_τ(A)''` in general and hyperfiniteness under separability, because
VonNeumannAlgebras defines hyperfiniteness only for separable predual and the general exact
statement is in the paywalled `kirchberg1993`. The group example is stated for arbitrary discrete
groups.

## Sources

Recorded in `packages/AmenableTracesOnCStarAlgebras/sources.toml`:

- `brown2006` (arXiv:math/0304009v2), `schafhauser2020` (arXiv:1807.07381v2),
  `tikuisis-white-winter2017` (arXiv:1509.08318v2): certified, open repository, fetched through
  the sources service. Every locator in `target.md` was read in these texts in this run
  (Definitions 3.1.1, 3.2.1, 3.3.1, Theorems 3.1.6, 3.1.7, 4.2.1, Propositions 3.1.2, 3.3.2,
  3.5.1–3.5.12, 4.1.1–4.1.3, 4.3.7, Corollary 4.3.6 of `brown2006`; the introduction and Theorems
  A and B of `schafhauser2020`; Theorem A, Definitions 1.1–1.2, Proposition 1.4 and Remark 1.5 of
  `tikuisis-white-winter2017`).
- `kirchberg1993`: the DOI resolves only to Springer; recorded uncertified, cited by locator.
  Settled; not requested.
- `connes1976`, `brown-ozawa2008`, `paulsen2002`, `pedersen2018`: waived by a human after the
  first run's request; cited by locator. None is needed for a statement of the brief: every
  statement is located in the three certified texts, and the von Neumann results of Connes are
  consumed from VonNeumannAlgebras V13b.

No `needs-references.toml` was written in this run: nothing the brief cites is unsettled.

## Suspicious text

None. No fetched text contained instructions.

## Files written

- `packages/AmenableTracesOnCStarAlgebras/target.md`
- `packages/AmenableTracesOnCStarAlgebras/reports/TARGET-AmenableTracesOnCStarAlgebras.md`
- `packages/AmenableTracesOnCStarAlgebras/sources.toml` (the four open sources re-recorded by
  the sources service alongside the four waived entries)
- scratch: `worklist.md`
