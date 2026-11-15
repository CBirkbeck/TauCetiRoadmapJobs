# Review of DiophantineApproximationAndTranscendencePartII (pull request #1693 at df8c14a)

**Verdict:** needs changes

## R01 (P3) — Restore the two declared gap identifiers

**Location:** TauCetiRoadmap/DiophantineApproximationAndTranscendencePartII/README.md:69,73: “The required energy/equilibrium extension” and “distinct from any arithmetic rank theorem”.
**Claim:** Previous R01 remains unresolved: the contracts omit both identifiers needed to match the README to the declared design gaps.
**Witness:** packages/DiophantineApproximationAndTranscendencePartII/design/plan.json:2020,2031 records G1 and complex-logarithmic-equilibrium; neither full identifier occurs in the reviewed README. Both occur in packages/DiophantineApproximationAndTranscendencePartII/README.md:69,73.
**Repair:** Replace line 69's introductory clause with “What ClassicalArithmeticCompletion must provide (gap:complex-logarithmic-equilibrium):”, retaining the needs sentence. Append at line 73: “The generalization problem DiophantineApproximationAndTranscendencePartII/G1 asks for exact base-point-sensitive geometric hypotheses and a rank theorem under them. The energy/equilibrium contract supplies no such rank theorem; nothing in Layers 0–5 depends on G1.” These restore both exact matches without changing either mathematical contract or asserting the refuted compact-set bound.

## Previous findings

- R01 — not repaired: README:69 still begins “The required energy/equilibrium extension”; README:73 distinguishes the contracts without naming G1. Both identifiers remain absent.
- R02 — repaired: README:281 uses χ=t+t² and explicitly computes the integral pullback t₁−t₂+t₁²−t₂². The lowest analytic coefficients remain 2 and −2.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.3, revised Check | F=x₁−x₂; χ=t+t²; φ=2z+z²; h=1 | Arithmetic coefficients: 1,−1,1,−1; β=1. Analytic lowest coefficients: 2,−2; modulus 2=2¹. | Integrality and lower bound hold | R02 repaired |
| Energy/equilibrium contract, R01 | Radius-3 circle; singleton | Minimum energies −log 3,+∞; exp(−inf I)=3,0, respectively, equal to capacities. | Normalizations agree; plan identifiers 2, README matches 0 | Restore identifiers |
| G1 distinction, R01 | K=closedDisk(1/2,1/4); p=x; χ=t; φ=8z exp(−20z) | cap K=1/4; denominator log 2>0; norm ≤6exp(−5)<1; numerator 0; constant-germ rank 1>0. | Contract restoration asserts no invalid general theorem | Restore identifier |

The other adversarial rows stand as in the previous review of 24c0576.

- Source checks: revised §1.3 against CDT25 line 620–634, (2.2.1)–(2.2.3), pp.638–639; contract normalization against Saff10 line 272–320 and 377–395. No seeded target has changed.
- Pinned declarations reopened: 2, PowerSeries.subst and PowerSeries.substAlgHom, Mathlib/RingTheory/PowerSeries/Substitution.lean:157,170; substitution direction agrees with the revised Check.
- Supplier sections re-resolved for R01: ClassicalArithmeticCompletion §§6.18,6.19,6.40, at TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:11987,12022,12541 on main; the energy extension remains an explicit contract.
- Validation: all supplied and rerun gate checks pass; targeted build and direct elaboration pass with exactly 2 sorry warnings each; independent #check probes for all 6 declarations pass and agree with README §§0.1–0.2,2.1–2.2, with no missing binders.
- PR text and scope: title, roadmap-summary block and prose agree with the new 983-line folder, 6 added declarations and stated suppliers; 0 removed headings/declarations and 0 outside-folder changes. Worktree remains unchanged.

Dependency-check output:

```text
depcheck: 244 roadmaps, 2206 edges, 0 problem(s)
```

Overlap check: read ProbabilisticAndMetricNumberTheory (interval discrepancy/Koksma owner), ArithmeticDynamics (dynamical measures; no shared changed target), AnalyticNumberTheoryPartIII (no shared changed target), ConformalMappingPartII (ODE continuation and quotient representation owner), DiophantineApproximationAndTranscendence (D-finite theory owner), ClassicalArithmeticCompletion (capacity owner and named energy-extension supplier); the revised polynomial Check introduces no ownership change.

Source independence: changed passages only; 1 passage compared with 1 source, CDT25, with no borrowed expression beyond mathematical notation; largest share CDT25, 48 of 53 source-labelled citations. No layer was added, removed or reordered, so the contents comparison stands from 24c0576.

## Not verifiable

- G1's general compact-set replacement remains unspecified; its previously settled scope decision is not reopened by R01.
- The energy/equilibrium extension is a declared supplier contract, not an implemented theorem verified here; no required source text was inaccessible.

## Source issues

- none

## For the human reviewers

- packages/DiophantineApproximationAndTranscendencePartII/reports/FIX-PKG-DiophantineApproximationAndTranscendencePartII~2.md, F01 reserves the G1 scope decision to a maintainer; packages/DiophantineApproximationAndTranscendencePartII/design/plan.json:2020 still records that obligation.
