# Review of MathematicalStatisticsAsymptotic (pull request #2320 at fb780f9)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `fb780f9`; this round reads the pull request's title and description against the head. Both findings are in the description; the folder's files need no change.

## R01 (P3) — The description names a Mathlib supplier the roadmap does not consume

**Location:** pull request description, **Dependencies**: “From Mathlib: convergence in law and in measure, the central limit theorem, Cramér–Wold, Gaussian measures, `klDiv`, kernels and the decision-theoretic risk API.”

**Claim:** The head consumes no decision-theoretic risk API from Mathlib.

**Witness:** `TauCetiRoadmap/MathematicalStatisticsAsymptotic/README.md:267–305` lists no risk declaration; `Suggested.lean:1162–1170` states the Gaussian-shift minimax bound with `∫⁻` and `K ∘ₘ multivariateGaussian h I⁻¹`, not `minimaxRisk` or `bayesRisk` (`Mathlib/Probability/Decision/Risk/Defs.lean:54, :60`).

**Repair:** Replace the sentence by: “From Mathlib: convergence in law and in measure, the central limit theorem, Cramér–Wold, Gaussian measures, tightness, sub-Gaussian variables, covering numbers and VC dimension, `klDiv` and kernels.”

## R02 (P3) — The description omits Foundations 4.3 from the consumed sections

**Location:** pull request description, **Dependencies**: “the finite-sample vocabulary, stochastic order symbols, Slutsky and contiguity definitions (its 2.4, 4.2 and Layers 8–9).”

**Claim:** The head also consumes Foundations 4.3, and `Suggested.lean` carries a local copy of its information matrix.

**Witness:** `README.md:365–366`: “4.3: the information matrix `(∫ sᵢ sⱼ dP)ᵢⱼ` of a vector score, which this roadmap uses as `fisherInformation` (7.3)”; `Suggested.lean:1030–1033`.

**Repair:** Write “the finite-sample vocabulary, the information matrix, stochastic order symbols, Slutsky and contiguity definitions (its 2.4, 4.2, 4.3 and Layers 8–9).”

## Previous findings

- none: the previous report, of `fb780f9`, listed no finding.

## Verified sound

| Statement | Instances tried | Computed, one side | Computed, other side | Result / change |
|---|---|---|---|---|
| 7.3 `fisherInformation` (Suggested.lean:1032; R02) | `N(θ,1)`, score `x − θ`; constant score `1`; density `2(1+x)⁻³` on `x ≥ 0`, score `(1, x)`, `u = (1, −1)` | Lean body `∫ sᵢ sⱼ dP`: `1`; `1` (uncentred, a covariance would give `0`); `[[1,1],[1,0]]` with junk `0`, `uᵀMu = −1` | Foundations 4.3 formula: `1`; `1`; `[[1,1],[1,0]]`, `−1` | agree with the owner's definition and its negative control; no change |
| 7.5 `lintegral_multivariateGaussian_le_iSup_risk` (Suggested.lean:1162; R01) | `k = m = 1`, `I = A = 1`, `ℓ = x²`; `K` Dirac at `x`; `K` constant `0` | left side `∫ x² dN(0,1) = 1` | `sup_h E_h (X − h)² = 1`; `sup_h h² = ∞` | `1 ≤ 1`, `1 ≤ ∞`; stated without Mathlib's risk API; no change |

The diff changes no statement; the rows for untouched statements stand as in the previous review, of `fb780f9`.

- Folder: 0 lines changed since `fb780f9`; no file changed outside the folder; seeded sample: no changed passage, 0 locators rechecked.
- Description against the head, sentence by sentence: “adds the roadmap” (not on main, 4304 insertions), the nine layer lines against the headings of Layers 1–9, “87 targets are admitted” (87 `theorem`, 87 `sorry` warnings), the supplier paragraph (README.md:32–36, :121), StochasticCalculus §1.2 and §1.4 (README.md:382–390), the Tau Ceti list (a subset of README.md:312–355), the local copies with owner docstrings (Suggested.lean:62–86, :1030), the lean-CKSD differences (README.md:2511–2523): all agree except R01 and R02.
- The four consumer roadmaps are in neither main nor the 474 open pull requests, as the description says (“not yet submitted”).
- Cross-roadmap citations resolved: Foundations 2.4, 4.2, 4.3, 8.1–8.6, 9.1, 9.2 at the head of its open pull request; StochasticCalculus §1.2, §1.4, §1.5, StandardDistributions §5.3 and OperatorTheory/PolarDecomposition PD-C19–PD-C27 on main. 0 unresolved.
- Library declarations opened at the pin: `Mathlib/Probability/Decision/Risk/Defs.lean:47, :54, :60` (`avgRisk`, `bayesRisk`, `minimaxRisk`), used nowhere in the folder.
- Supplier order: `depcheck: 245 roadmaps, 2207 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: the worker's gate at this head passed every check, build included. A local rerun against `origin/main` reports only `depcheck: NOT IN ORDER: MathematicalStatisticsAsymptotic (insert it after its last supplier)`, which the placement rule exempts.
- Elaboration of `TauCetiRoadmap/MathematicalStatisticsAsymptotic/Suggested.lean` with `lake env lean`: exit 0, no error, 87 warnings, all `sorry`. The file is the one the previous reviews probed, so their `#check @name` and padding results stand.

Overlap check: read MathematicalStatisticsFoundations, ProbabilisticAndMetricNumberTheory, PointProcesses, ClassicalErgodicTheory, StandardDistributions, RandomMatrices and OptimalTransport; no passage changed, and the ownership recorded in the earlier reviews stands (Foundations owns the shared statistical definitions and the fixed-space convergence algebra, StandardDistributions the Gaussian projection norm laws); nothing newly shared.

Source independence: changed passages only; 0 passages compared with 0 sources (the folder did not change), none shared; largest share vdv, 82 of 120 locators as counted in an earlier review; no layer added, removed or reordered, so the contents comparison was not repeated.

## Not verifiable

- vdv outside Chapter 20, vdvw, js §2.4 and huber: not readable legally in the earlier reviews; no changed passage cites them, and they were not fetched again.

## Source issues

- none

## For the human reviewers

- Not tested: vdv has the largest locator share; only Chapter 20 was readable in earlier rounds, and the whole-book contents comparison rests on an earlier review.
- Licence: TauCetiRoadmap/MathematicalStatisticsAsymptotic/README.md:2514 and :2541 cite lean-CKSD and Statlib (Apache 2.0), with the QMD definition shaped on `Statlib/Inference/QMD.lean`; neither repository was opened. The description names lean-CKSD only.
- Scope: the four roadmaps named as consumers and as owners of excluded material at README.md:32–34 and :108–114 exist neither on main nor among the open roadmap pull requests.
- Source status: hjort_pollard is a 1993 preprint, arXiv:1107.3806, cited beside a book for §9.6 (README.md:2460, :2562).
