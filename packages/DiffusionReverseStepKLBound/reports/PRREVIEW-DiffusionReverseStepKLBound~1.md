# Review of DiffusionReverseStepKLBound (pull request #2863 at ec63c12)

**Verdict:** needs changes

**Summary.** Needs changes, for one sentence: the second route offered for 1.2 tilts the Gaussian `N(b, σ²)` by the log-likelihood ratio with the wrong sign, which gives `N(2b − a, σ²)` and not `N(a, σ²)`; the repair is one word. The four stated theorems (1.1, 1.2, 1.3, 2.1) were re-derived and hold as stated in the README and in `Suggested.lean`, every printed number was recomputed and agrees, and every supplier citation resolves. There are no small corrections and one format note. Whether a one-step bound that no refereed source states, and that the README itself calls uninformative when summed, is in the project's scope is left to the human reviewers.

## R01 (P2) — In the second route of 1.2, `N(a, σ²)` is the tilt of `N(b, σ²)` by the negative of the affine function named, not by that function

An implementer who takes the route through `TauCeti.klDiv_tilted_eq_boltzmannEntropy` as written tilts by the wrong function and gets a reference measure that is not `N(a, σ²)`, with a normalising constant that is not `1`. The sentence, in the route of 1.2 (README line 135): "Equivalently, `N(a, σ²)` is the tilt of `N(b, σ²)` by that affine function, whose exponential has integral `1`". The affine function of the paragraph is `ℓ(y) = (‖y − a‖² − ‖y − b‖²)/(2σ²)`, the log-likelihood ratio of `N(b, σ²)` against `N(a, σ²)`, so `dN(a)/dN(b) = exp(−ℓ)`. Tilting `N(b, σ²)` by `ℓ` gives the density proportional to `exp((‖y − a‖² − 2‖y − b‖²)/(2σ²))`, which is `N(2b − a, σ²)`, and `∫ exp ℓ dN(b, σ²) = exp(‖a − b‖²/σ²)`. For `d = 1`, `σ = 1`, `b = 0`, `a = 1`: `ℓ(y) = 1/2 − y`, the tilt is `N(−1, 1)`, and the integral is `e`.

Smallest change: "is the tilt of `N(b, σ²)` by the negative of that affine function, whose exponential has integral `1` against `N(b, σ²)`". With `f = −ℓ` the Tau Ceti identity then gives `klDiv ν N(a) = klDiv ν N(b) + ∫ ℓ dν = klDiv ν N(b) + ‖a − b‖²/(2σ²)`, as stated. The statement of 1.2, its first route through Csiszár's identity and its Checks are not affected.

## N01 — Three Tau Ceti names are cited without their namespace

`multivariateGaussian_eq_withDensity`, `multivariateGaussianPDFReal_def` and `map_affine_multivariateGaussian` live in `TauCeti.Probability` at the pin, while the other Tau Ceti names in the same `*Needs:*` lines carry their prefix; writing them in full would let a reader search for all of them the same way.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `klDiv_withDensity_le_relativeFisherInformation` | `μ = N(c, σ²)`, `C = σ²`, `h` exponential-affine (unbounded) | left `‖m‖²/(2σ²)`; Fisher `‖m‖²/σ⁴`; right `(σ²/2)·‖m‖²/σ⁴ = ‖m‖²/(2σ²)` | equality | none |
| 1.1, `C ≤ 0` | `C < 0`, `d ≥ 1`; `C = 0`; `d = 0` | `C < 0`: hypothesis false for every `μ` (test `f` with nonvanishing gradient); `C = 0`: `μ` Dirac, `h = 1`, `0 ≤ 0·I = 0` | holds | none |
| 1.1 route | truncation `f_n = ψ_n(√h) χ(·/n)` | `‖∇f_n‖₂ ≤ ‖∇√h‖₂ + ‖∇χ‖_∞/n`; Fatou on `u log u + 1/e`; limit `2C∫‖∇√h‖² = (C/2) I` | sound | none |
| 1.2 `klDiv_multivariateGaussian_eq_add` | `ν = (N(−1,1) + N(1,1))/2`, `σ = 1`, `a ∈ {0, 1, −0.3}` | `0.163169`, `0.663169`, `0.208169`; differences `0.5`, `0.045` | identity holds | none |
| 1.2, singular `ν`; `d = 0` | `ν` not a.c.; point space | both sides `∞`; both sides `0` | holds | none |
| 1.2 second route | `d = 1`, `σ = 1`, `b = 0`, `a = 1` | tilt of `N(0,1)` by `ℓ = 1/2 − y` is `N(−1,1)`, `∫ exp ℓ = e`; by `−ℓ` it is `N(1,1)`, integral `1` | sentence false | R01 |
| 1.3 `klDiv_tilted_multivariateGaussian_le` | `f = −λy²/2`, `λσ² = 1, 0.1, 0.01` | left `0.096574`, `0.0022005`, ratio `0.49834`; right `0.25`, `0.0045455` | holds | none |
| 1.3, concave side | `f = +λy²/2`, `λσ² = 0.5, 0.9, 0.99` | ratios `0.6137`, `0.8268`, `0.9631` (limit `1`) | holds, constant sharp | none |
| 1.3, hypotheses | `exp f` not integrable; `L = 0`; no first moment | zero measure: left `1`, right `0` (so `hexp` needed); affine `f`: `0 ≤ 0`; right side `∞` when `L > 0` | hypotheses used | none |
| 1.3 route | `c = a + σ²∇f(b)` | `log dν/dN(c) = f − ⟪∇f(b), y⟫ + const`; `∇ log h = ∇f − ∇f(b)`; LSI constant `σ²` from `κ = 1/σ²` | sound | none |
| `scoreLip` | `(R, a) = (1, .5), (2, .5), (1, .9), (0, .7), (R, 1)` | `2`, `6`, `80`, `10/3`, junk `0` | Checks true | none |
| 2.1 `klDiv_reverseStep_le`, constants | Bayes levels at `t − 1`, `t` | `m = √α_t`; `v = 1 − ᾱ_t − α_t(1 − ᾱ_{t−1}) = β_t`; mean term `β_t/(2(1 − ᾱ_t))`; first term `d v² L²/2` | matches statement | none |
| 2.1, Dirac data | `β₁ = 0.3`, `β₂ = 0.05`, `t = 2` | `u = 0.175439`; left `0.006194`; bound `0.015389`; ratio at `u = 0.01`: `0.49341` | holds | none |
| 2.1, data at `±1`, `d = 1`, ideal predictor | `β ≡ 0.1`; `β = (0.5, 0.02)`; `t = 2` | left `0.12824`, bound `39.506`; left `1.6387·10⁻⁴`, bound `8.3299·10⁻⁴` | holds, numbers true | none |
| 2.1, grid of the numerical Check | 5 data laws × 4 schedules × `t ∈ {2,3,5,10}` (exact mixture kernels) | worst ratio `0.48157` (Dirac, `0.3` then `0.01`, `t = 10`); mean formula error `< 10⁻¹⁴`; averaged variance `≤ 0.9854 v` | holds | none |
| 2.1, `t = 1` and `d = 0` | Dirac data, `d ≥ 1`, `t = 1`; `d = 0` | left `∞`, right `0` (so `t ≥ 2` needed); both sides `0` | Checks true | none |
| Downstream consumers, sizes | linear schedule `10⁻⁴ … 0.02`, `T = 1000`, `d = R = 1` | step-2 term `7.1892·10⁷`; constant schedule `≈ d R⁴/(2β²)` | true | none |
| Lean ↔ README | elaborated types of the 14 declarations | `↑L`, `↑d` casts as intended; no binder lost; 8 copied definitions identical to their owners' bodies | agree | none |

- Source locators checked against the text: 0 (the README has none; every target is "Proved here").
- Library declarations opened at the pins: 9 in Tau Ceti (`ChainRule.lean:125`, `ChangeOfReference.lean:73`, `InternalEnergy/Basic.lean:316` and `:378`, `Gaussian/Density.lean:95` and `:265`, `Gaussian/Affine.lean:73`, `Chi/Gaussian.lean:88`, `ChiSquared/Basic.lean:344`) and 11 in Mathlib (`KullbackLeibler/Basic.lean:56` and `:82`, `Tilted.lean:46` and `:125`, `WithDensity.lean:563`, `Convex/Strong.lean:167`, `MapComap.lean:74`, `MeasureCompProd.lean:182`, `DominatedConvergence.lean:58`, `Lebesgue/Add.lean:237`, `SmoothTransition.lean:147`).
- Cross-roadmap citations resolved: DenoisingDiffusion 1.1, 1.2, 2.1, 2.2, 3.1, 4.2, 4.3 and its scope (main); MathematicalStatisticsNonparametric 1.3 (main); ScoreBasedDiffusion 2.1, 2.2, 3.1 and LogConcaveFunctionalInequalities Conventions, 1.1–1.3, 2.3, 4.2 (open heads); DifferentialEntropyAndEntropyPower 1.3, DiffusionODESamplerGuarantee scope, RandomMatrices 2.2.
- Dependency check: `depcheck: 172 roadmaps, 1998 edges, 0 problem(s)`; no UPWARD or CYCLE line. The two suppliers still in pull requests (ScoreBasedDiffusion, LogConcaveFunctionalInequalities) each add a new roadmap folder and are named in the description.
- Elaboration of `Suggested.lean`: four `sorry` warnings, nothing else. One-tactic probe (`rfl`, `simp`, `infer_instance`) closes none of the four theorems. No pinned library file states a logarithmic Sobolev inequality.
- The worker's automatic checks all passed on this head; no change outside the roadmap folder.
- Pull request text read against the head: no sentence contradicted; counts (4 theorems, 10 definitions, 8 copied) and all quoted numbers agree.

Overlap check: read ScoreBasedDiffusion, DifferentialEntropyAndEntropyPower, LogConcaveFunctionalInequalities, OrnsteinUhlenbeckSemigroup, DiffusionODESamplerGuarantee, DenoisingDiffusion, MathematicalStatisticsFoundations, MathematicalStatisticsSemiparametric; nothing shared. The copied definitions are owned by DenoisingDiffusion and LogConcaveFunctionalInequalities and are cited as such; the extension of the inequality inside the route of LogConcaveFunctionalInequalities 4.2 is not a statement there, and DifferentialEntropyAndEntropyPower 1.3 needs a second moment and is in `EReal`, so 1.1 and 1.2 have this roadmap as their only owner.

Source independence: 0 passages compared with 0 sources, since the README has no source locator and the three references (Gross 1975, Csiszár 1975, Ho–Jain–Abbeel 2020) are attributions whose texts were not opened; largest share: none, 0 of 0 locators; contents comparison not applicable.

Research link: none found beyond attribution. The README (summary, 1.1, Conventions, References) places the model kernel and schedule in Ho, Jain and Abbeel 2020 and the tools in Gross 1975 and Csiszár 1975; it cites no published result that states or uses the one-step bound. Flagged to the human reviewers.

## Not verifiable

- The attributions to Gross 1975, Csiszár 1975 and Ho, Jain and Abbeel 2020 (the noise-prediction form of the mean, the linear schedule from `10⁻⁴` to `0.02`): given without locators; the texts were not opened, and no stated result rests on them.

## Source issues

- none

## For the human reviewers

- Scope: all four targets are marked "Proved here"; no refereed source is cited for the headline 2.1 (README References: three attributions, no locators), and the description says the statements were fixed by an AI-written specification.
- Scope: the README says (Downstream consumers) that the bound summed over the chain is uninformative for schedules in common use and that no roadmap consumes this one.
- Not tested: with no source locator in the README, the wording and arrangement comparisons had no source text to be made against.
