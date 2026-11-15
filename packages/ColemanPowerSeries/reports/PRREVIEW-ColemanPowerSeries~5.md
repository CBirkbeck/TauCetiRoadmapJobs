# Review of ColemanPowerSeries (pull request #1309 at f9fecdf)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `TauCetiRoadmap/DirichletPadicLFunctions/README.md:308` retains “nothing here redefines them”; its supplier contract at :109 consumes ColemanPowerSeries §§2.10–2.10a. The shared natural-parameter smoothing constructions still have one owner.
- R02 — repaired: `TauCetiRoadmap/ColemanPowerSeries/README.md:980` retains “The underlying function is native `eval₂`”; the undeclared label remains absent.
- R03 — repaired: `TauCetiRoadmap/ColemanPowerSeries/README.md:255–257` retains three discriminating relative-basis Checks; :5856–5858 retains the negative dyadic norm, nonfixed scalar and inverse-Frobenius Checks.

## Verified sound

| Statement | Instances tried | Computed values on both sides | Result; change |
|---|---|---|---|
| §1.123 uniform corrected-projector precision, described in `roadmap-summary` | O=ℤ₃, σ=id, f=C(4), r=0,1,2 | Mʳ(f)=C(4), C(64), C(262144); L(f)=1. Differences −3,−63,−262143 have valuations 1,2,3, exactly r+1. | Pass; none |

The remaining adversarial rows stand as in the previous review of `f9fecdf`.

- 🤖 AI review: 0 changed folder lines; 0 changed seeded targets requiring renewed source checks; the title, all quoted description prose and `roadmap-summary` were checked against this head.
- Base comparison: 1 new roadmap folder, 9071 added lines, 0 removed headings or declarations, 6 added Lean declarations, 0 changes outside the folder; no contradictory or omitted material change found in the PR text.
- All 6 declarations were mechanically checked with `#check @name`; no signature changed. The maximal-ideal, adic-topology, residue-Frobenius and continuity hypotheses survive in `correctedNorm_limit`.
- 4 pinned declarations reopened: `Mathlib/RingTheory/Norm/Defs.lean:61,82` (`norm`, `norm_eq_matrix_det`); `Mathlib/RingTheory/PowerSeries/Evaluation.lean:157,161` (`eval₂Hom`, `coe_eval₂Hom`).
- 3 description interfaces resolved at readable heads: IntegralIwasawaTheory §§7.1–7.3; DirichletPadicLFunctions §§1.1–1.2 and its Coleman supplier contract; PhiGammaModulesAndIwasawaCohomology “From analytic roadmaps”. The citation resolver reports 0 unresolved cross-roadmap citations.
- All 4 overlap leads are covered by the former-layer mapping in LocalFieldsRamification #617, `TauCetiRoadmap/LocalFieldsRamification/README.md:274–284`.
- Gate: all counters 0, `OK`; targeted Lake build and direct Lean elaboration passed with only 3 `sorry` warnings; the six-signature probe also passed. Worktree remains clean.

Dependency check output:

```text
depcheck: 245 roadmaps, 2211 edges, 0 problem(s)
```

Overlap check: read DirichletPadicLFunctions, IntegralIwasawaTheory, EulerSystemsCyclotomicMainConjecture, AnticyclotomicLocalUnits and PadicMeasuresIwasawaAlgebras; natural-parameter smoothing belongs to ColemanPowerSeries, Coleman norm/interpolation and odd-prime arithmetic sequences/quotient to IntegralIwasawaTheory, measures and completed-algebra comparisons to PadicMeasuresIwasawaAlgebras, Euler-system applications to EulerSystemsCyclotomicMainConjecture, and height-two anticyclotomic interpolation to AnticyclotomicLocalUnits.

Source independence: changed passages only; 0 roadmap passages compared with 0 sources because the folder diff is empty. Largest share is RJW, 289 of 477 external-source citation paragraphs. No layer was added, removed or reordered, so the arrangement comparison was not reopened; no new wording or reuse requires source comparison.

## Not verifiable

- Coleman, *Division Values in Local Fields*: the previous review's publisher/DOI lookup left it uncertified; §1.123's original §IV, equations (3)–(4), p.103, Proposition 14, p.104 remains uncertified here.
- CoatesSujatha, *Cyclotomic Fields and Zeta Values*, §§2.1–2.4, pp.13–26: the previous publisher lookup remains uncertified; no source text was newly fetched in this zero-line review.
- The previous review's external Lean proof-source compilation limitation remains; this round compiled only the roadmap acceptance file and signature probe.

## Source issues

- none

## For the human reviewers

- none
