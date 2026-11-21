# Review of DiffusionReverseStepKLBound (pull request #2863 at 3ccd4c5)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review, the wrong sign of the tilt in the second route of 1.2, is repaired, and the sentence now agrees with the Tau Ceti identity it invokes (recomputed below); the namespace note is also taken up. The change touches no statement, and it introduced no new problem; there are no small corrections and no format notes. The two scope questions of the previous review (no refereed source states the one-step bound; the README itself calls the summed bound uninformative) remain for the human reviewers.

## Previous findings

- R01 — repaired: "`N(a, σ²)` is the tilt of `N(b, σ²)` by the negative of that affine function, whose exponential has integral `1` against `N(b, σ²)`" (README line 137). Recomputed: true.
- N01 — repaired: the three names now read `TauCeti.Probability.multivariateGaussian_eq_withDensity`, `TauCeti.Probability.multivariateGaussianPDFReal_def`, `TauCeti.Probability.map_affine_multivariateGaussian` throughout the README and the module docstring.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.2 second route, tilt (changed) | general `a`, `b`, `σ`; `d = 1`, `σ = 1`, `b = 0`, `a = 1` | `dN(a)/dN(b) = exp(−ℓ)`; `−ℓ = y − 1/2`; `∫ exp(−ℓ) dN(0,1) = e^{1/2}·e^{−1/2} = 1`; tilt density `∝ exp(−y²/2 + y)`, i.e. `N(1,1)` | sentence true | none |
| 1.2 second route, identity (changed) | `klDiv_tilted_eq_boltzmannEntropy` with `m = N(b)`, `f = −ℓ`, `μ = ν` probability | right side `Ent − ∫(−ℓ)dν + 1·log 1 + 1 − 1 = klDiv ν N(b) + ∫ℓ dν`; `∫ℓ dν = ℓ(b) = ‖a − b‖²/(2σ²)` | equals the statement of 1.2 | none |
| 1.2 second route, hypotheses of the identity | `N(b)` σ-finite, nonzero; `exp(−ℓ)` integrable under `N(b)`; `−ℓ` affine, `ν` with first moment | integral `1`; `−ℓ` integrable against `ν`; `EReal` identity passes to `ℝ≥0∞` since `‖a − b‖²/(2σ²)` is finite | hypotheses met | none |
| 1.2 statement (cited by the changed text) | `ν = N(b, σ²)` | left `‖a − b‖²/(2σ²)`; right `0 + ‖a − b‖²/(2σ²)` | holds | none |
| Lean ↔ README | elaborated file at this head | only the module docstring changed; the 14 declarations are textually unchanged | agree | none |

The rows for the untouched statements (1.1, 1.3, `scoreLip`, 2.1 and its Checks) stand as in the previous review, of `ec63c12`.

- Source locators checked against the text: 0 (the README has none; every target is "Proved here"; the seeded sample 1.1, 1.2, 1.3, 2.1 has no locator to verify).
- Library declarations opened at the pin: 7 in Tau Ceti (`Gaussian/Density.lean:95` and `:265`, `Gaussian/Affine.lean:73`, each inside `namespace TauCeti.Probability`; `InternalEnergy/Basic.lean:316` and `:378`, `ChangeOfReference.lean:73`, `ChainRule.lean:125`, each inside `namespace TauCeti`); `Chi/Gaussian.lean:88` and `ChiSquared/Basic.lean:344` confirmed in `TauCeti.Probability`.
- Cross-roadmap citations of the changed passages resolved: MathematicalStatisticsNonparametric 1.3 and DenoisingDiffusion 1.2, 2.1, 3.1, 4.3 (main); LogConcaveFunctionalInequalities 1.1, 2.3 and ScoreBasedDiffusion 2.1, 2.2, 3.1 (open heads).
- Dependency check: `depcheck: 172 roadmaps, 1998 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: four `sorry` warnings (lines 93, 102, 111, 134), nothing else. No statement changed, so the one-tactic probe of the previous review stands.
- The automatic checks all pass on this head; no change outside the roadmap folder.
- Pull request text read against this head: no sentence contradicted (the description does not describe the second route's sign or the unqualified names), and the change removes or adds no section, declaration or supplier.

Overlap check: read ScoreBasedDiffusion, DifferentialEntropyAndEntropyPower, LogConcaveFunctionalInequalities, OrnsteinUhlenbeckSemigroup, DiffusionODESamplerGuarantee, DenoisingDiffusion, MathematicalStatisticsFoundations, MathematicalStatisticsSemiparametric (scopes as read in the previous review; the change touches no ownership and no open pull request changes this roadmap or drops an id it cites); nothing shared.

Source independence: changed passages only; 0 passages compared with 0 sources, since the changed passages and the README carry no source locator; largest share: none, 0 of 0 locators; contents comparison not applicable (the change adds, removes or reorders no layer).

Research link: none found beyond attribution. The README (summary, 1.1, Conventions, References) places the model kernel and schedule in Ho, Jain and Abbeel 2020 and the tools in Gross 1975 and Csiszár 1975; it cites no published result that states or uses the one-step bound. Flagged to the human reviewers.

## Not verifiable

- The attributions to Gross 1975, Csiszár 1975 and Ho, Jain and Abbeel 2020: given without locators; the texts were not opened, and no stated result rests on them.

## Source issues

- none

## For the human reviewers

- Scope: all four targets are marked "Proved here"; no refereed source is cited for the headline 2.1 (README References: three attributions, no locators), and the description says the statements were fixed by an AI-written specification.
- Scope: the README says (Downstream consumers) that the bound summed over the chain is uninformative for schedules in common use and that no roadmap consumes this one.
- Not tested: with no source locator in the README, the wording and arrangement comparisons had no source text to be made against.
