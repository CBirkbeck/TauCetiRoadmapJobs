# Review of DenoisingDiffusion (pull request #2476 at 5e5e14f)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/DenoisingDiffusion/README.md` line 109 reads "Layer 1 proves the two Gaussian facts that Layers 2 and 4 use: the divergence between isotropic Gaussian laws and the Bayes update."; no new problem introduced.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `## How to read the build`, first sentence (line 109) | each layer's *Needs:* lines against Layer 1 | 2.2 needs 1.1 (line 247), 2.3 needs 1.2 (273), 4.2 and 4.3 need 1.1 (483, 513); 3.1–3.3 (312, 346, 376) name no Layer 1 target | true; agrees with lines 111, 281, 521 | none |
| 1.1 `klDiv_multivariateGaussian_smul_one` (cited by the changed sentence) | `d=1, a=b, u=1, v=2`; `u=v`; `d=0`; sign of the argument | formula `½(½−1+log 2)=0.09657`, direct `½(log 2 + ½ − 1)=0.09657`; `u=v`: `0+‖a−b‖²/(2v)`, the supplier's; `d=0`: `0=0`; `x−1−log x ≥ 0`, so `ofReal` loses nothing | holds | none |

The rows for the untouched statements stand as in the previous review, of `20b3f6b`.

- Incremental re-review of the 2 lines changed since `20b3f6b` (one sentence of the README); changed passages only. No statement, locator, supplier or Lean declaration changed.
- Source locators checked against the text: 0 (the changed sentence carries none; the seeded sample does not fall in it).
- Library declarations opened at the pins: 0 new; `Suggested.lean` line 38 read against README 1.1 (hypotheses `0 < u`, `0 < v`, same formula).
- Cross-roadmap citations resolved: 1 — MathematicalStatisticsNonparametric 1.3 `klDiv_multivariateGaussian` on main (its README line 506).
- Gate at this head: every check passed; no change outside the folder. Dependency check: `depcheck: 238 roadmaps, 2526 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: 24 `sorry` warnings for 24 theorems, no error and no other warning.
- Pull request text read against the head: the title and description agree with it (new roadmap, one roadmap supplier, 24 theorems, 42 declarations); the change since `20b3f6b` alters nothing they state.

Overlap check: read FirstOrderOptimization, MathematicalStatisticsSemiparametric, MathematicalStatisticsFoundations, MathematicalStatisticsHighDimensional; nothing shared (as in the previous review; the change adds no object).

Source independence: changed passages only; 1 passage compared with 0 sources (the changed sentence describes the roadmap's own layer order and has no source counterpart), none shared; largest share HoJainAbbeel2020, 6 of 12 locators; contents not compared again (no layer added, removed or reordered). Robbins1956 could not be read.

Research link: Layers 2 and 4 state the forward process and variational bound of Sohl-Dickstein et al. 2015 and Ho, Jain and Abbeel 2020; Layer 3 is Tweedie's formula (Robbins 1956, Efron 2011) and the score-matching equivalence of Hyvärinen 2005 and Vincent 2011. Rests on the README's references and the five texts read.

## Not verifiable

- Robbins 1956, equations (44)–(46), p. 162 (3.2): the cached text of Robbins1956 is the host's block page; unchanged since the previous review.
- Vincent 2011 in its Neural Computation numbering (3.3): only the technical report was read; the README cites that numbering.

## Source issues

- none

## For the human reviewers

- **Scope.** Layers 2 and 4 rest on two machine-learning conference papers (HoJainAbbeel2020, NeurIPS; SohlDickstein2015, ICML); Layer 3 on journal articles (Efron2011, Hyvarinen2005, Vincent2011) and Robbins1956. README line 528: no roadmap on main consumes this one.
- **Licence.** Efron2011 and Vincent2011 were read from author-hosted copies (a preprint and a technical report); their licence status was not settled.
- **Not tested.** Robbins1956 could not be read; its one locator (3.2) is unchecked. The largest-share source, HoJainAbbeel2020, was read in full in an earlier review.
