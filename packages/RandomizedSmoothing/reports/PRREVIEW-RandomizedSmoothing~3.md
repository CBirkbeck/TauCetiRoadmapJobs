# Review of RandomizedSmoothing (pull request #2428 at 7419977)

**Verdict:** needs changes

## R01 (P2) — 3.3: the upper Clopper–Pearson bound does not strictly exceed `p` at `p = 1`

**Location:** `TauCetiRoadmap/RandomizedSmoothing/README.md` lines 312–313: "The upper Clopper–Pearson bound, one minus `cpLower α N (N - k)`, exceeds `p` except on an event of `Bin(N, p)`-probability at most `α`."
**Claim:** With "exceeds" strict the statement is false at `p = 1` for every `α < 1`.
**Witness:** `p = 1`, `α < 1`: `K = N` almost surely, the bound is `1 - cpLower α N 0 = 1 - 0 = 1 = p`, so it fails to exceed `p` with probability `1 > α`.
**Repair:** "The upper Clopper–Pearson bound, one minus `cpLower α N (N - k)`, is at least `p` except on an event of `Bin(N, p)`-probability at most `α`." At `p = 1` this reads `1 ≥ 1`; in general the exceptional event is `{1 - p < cpLower α N (N - K)}` with `N - K ∼ Bin(N, 1 - p)`, which 3.2 bounds by `α`.

## R02 (P3) — 3.2: two Checks contradict Checks of 3.1 and 3.2

**Location:** `README.md` lines 297–299: "`N = 1`: `cpLower α 1 1 = α` for `α ≤ 1`, and the coverage event has probability `p · 1[p < α] ≤ α`" and "`α = 0`: `cpLower 0 N k = 0` for `k ≤ N`, so the event is empty."
**Claim:** The first is false at `α = 1`; the second event is null, not empty.
**Witness:** `α = 1`, `N = 1`, `p = 1/2`: `cpLower 1 1 0 = 1 > p` (line 278), so the event has probability `1`, not `p = 1/2` (line 300 agrees). `α = 0`, `p < 1`: `cpLower 0 N k = 1` for `k > N` (line 279), so the event is `{k | N < k}`.
**Repair:** "`N = 1`, `α < 1`: `cpLower α 1 1 = α`, and the coverage event has probability `p · 1[p < α] ≤ α`." and "`α = 0`: `cpLower 0 N k = 0` for `k ≤ N`, so the event is `{k | N < k}` when `p < 1` and empty when `p = 1`; its probability is `0`."

## R03 (P3) — 1.1: the Check on the indicator of `{0}` fails when `E` is trivial

**Location:** `README.md` line 100: "`f` the indicator of `{0}`: `f = 0` almost everywhere, so `smooth σ f ≡ 0` although `f ≠ 0`."
**Claim:** No hypothesis excludes the trivial space, which the next Check uses.
**Witness:** `E = {0}`: `γ = δ₀`, `f ≡ 1`, `smooth σ f ≡ 1` (the case `c = 1` of line 101).
**Repair:** "For `E` nontrivial and `f` the indicator of `{0}`: `f = 0` `γ`-almost everywhere, so `smooth σ f ≡ 0` although `f ≠ 0`."

## R04 (P3) — 1.2: the route invokes the Neyman–Pearson lemma, which no *Needs:* item or contract supplies

**Location:** `README.md` line 118: "The lower form is the Neyman–Pearson lemma for the pair `γ` and `γ` shifted by `δ`"; line 131: "*Needs:* 1.1; Mathlib `stdGaussian_eq_map_pi_orthonormalBasis`, `gaussianReal`, `cdf`."
**Claim:** The sketch names an input that is neither a target here, a listed supplier, nor a pinned declaration.
**Witness:** MathematicalStatisticsFoundations 6.2 on main (`README.md` line 992, `integral_le_of_generalized_neyman_pearson`) owns the lemma; it is absent from line 131 and from `## Exact supplier contracts`.
**Repair:** Either add "MathematicalStatisticsFoundations 6.2 (generalized lemma)" to line 131 and a `From TauCetiRoadmap.MathematicalStatisticsFoundations` entry to the contracts, or make the route self-contained: "With `h = 1[⟪z, u⟫ ≤ t]`, `r(z) = exp(⟪z, δ⟫ - ‖δ‖²/2)` and `c = exp(t‖δ‖ - ‖δ‖²/2)`, `(g - h)(r - c) ≥ 0` pointwise, so `∫ (g - h) r dγ ≥ c ∫ (g - h) dγ ≥ 0`; and `∫ h r dγ = Φ(t - ‖δ‖)` by reduction to the coordinate along `u`."

## R05 (P3) — Supplier contracts omit the hypotheses of two pinned theorems

**Location:** `README.md` lines 53–56: "`Bin(n, p).real {k | m ≤ k} = I_p(m, n - m + 1)`" and "the Beta cdf is the regularized incomplete Beta function."
**Claim:** Both identities are stated without the hypotheses the pinned declarations carry.
**Witness:** Tau Ceti `TauCeti/Probability/Distributions/Binomial/Tail.lean` line 128: `(hmn : m ≤ n)`; `Distributions/Beta/Cdf.lean` line 136: `(hα : 0 < α) (hβ : 0 < β)`. For `m = n + 1` the second Beta parameter is `0`.
**Repair:** "for `m ≤ n`, `Bin(n, p).real {k | m ≤ k} = I_p(m, n - m + 1)`" and "for positive parameters, the Beta cdf is the regularized incomplete Beta function."

## R06 (P3) — 4.1 promises bounds for `Φ⁻¹ p` without stating them

**Location:** `README.md` lines 354–355: "these bound `Φ⁻¹ p` above and below by finitely many values of `φ`."
**Claim:** No quantifiers, no hypotheses on `p`, no inequality; and the *Needs:* line (365) lists only `Measure.lt_quantile_iff`, which gives the lower bound alone.
**Witness:** `p = 7/10`, grid `0, 1`: `1/2 + φ(1) ≈ 0.742 ≥ p` gives `Φ⁻¹ p ≤ 1` through `Measure.quantile_le_iff`, not through `lt_quantile_iff`.
**Repair:** "Hence for `0 = a₀ ≤ a₁ ≤ … ≤ a_n` and `p ∈ (0, 1)`: if `p ≤ 1/2 + Σ_{i=1}^{n} (a_i - a_{i-1}) φ(a_i)` then `Φ⁻¹ p ≤ a_n`, and if `1/2 + Σ_{i=1}^{n} (a_i - a_{i-1}) φ(a_{i-1}) < p` then `a_n < Φ⁻¹ p`." Add `Measure.quantile_le_iff` to line 365. (Second instance: `p = 19/20`, `1/2 + φ(0) ≈ 0.899 < p`, and `1 < Φ⁻¹ p ≈ 1.645`.) Or delete the sentence.

## R07 (P3) — 5.2: the third Check tests nothing and speaks about the README

**Location:** `README.md` lines 414–415: "A selection rule that reads the estimation sample is not covered, and the README does not claim it."
**Claim:** A Check computes a value or a non-example; this one does neither.
**Witness:** A non-example exists: `N = 1`, `α = 3/4`, `A = C (x + σ ω 0)`, `C` a two-class halfspace classifier with `x` on its boundary. `K = 1`, `p̲ = cpLower (3/4) 1 1 = 3/4`, radius `σ Φ⁻¹(3/4) > 0`, yet `P_A(x) = 1/2`.
**Repair:** "Independence of the two samples is needed: for `N = 1`, `α = 3/4`, the class `A = C (x + σ ω 0)` read from the estimation sample, and a two-class halfspace classifier with `x` on its boundary, `K = 1` and `p̲ = 3/4` always, so the radius `σ Φ⁻¹ (3/4)` is always returned while `P_A(x) = 1/2`: the failure event has probability `1 > 3/4`."

## R08 (P3) — A roadmap is cited by pull-request link

**Location:** `README.md` line 39: "`[RobustnessCertificates](https://github.com/TauCetiProject/TauCetiRoadmap/pull/2426)`".
**Claim:** Roadmaps are cited by name, never by pull request, also while they are open.
**Witness:** The link names pull request 2426; it stops pointing at the roadmap once that pull request merges.
**Repair:** "and deterministic certificates, which belong to the roadmap RobustnessCertificates."

## R09 (P3) — `## Conventions` follows the supplier contracts and the build paragraph

**Location:** `README.md` lines 41, 64, 73: `## Exact supplier contracts`, `## How to read the build`, `## Conventions`.
**Claim:** The contracts use `Φ`, `Φ⁻¹` and `Bin(n, p)` (lines 48–54) before Conventions introduces them.
**Witness:** `MathematicalStatisticsFoundations/README.md` on main: Conventions line 108, contracts 162, build 253; 155 of 157 roadmaps on main with both headings use that order.
**Repair:** Move lines 73–80 to directly after `## Scope and ownership`.

## R10 (P3) — The description is written for the first head

**Location:** pull-request description: "with the positivity dichotomy"; "and rational certificates"; "Rational bounds for `Φ` and `Φ⁻¹`"; "The numerical checks in Layer 6 were verified to 40 digits."
**Claim:** The head has a trichotomy, no rational certificates or rational bounds, and no Layer 6; the description does not say that `Suggested.lean` now states sharpness and the selection stage.
**Witness:** `README.md` line 90 "**Positivity trichotomy.**"; lines 325–338 (3.4: the finite-sum formula and one implication); line 349 "Layer 4: mean-value bounds for the Gaussian cdf"; the last layer is Layer 5.
**Repair:** "…with the positivity trichotomy"; "…the closed form `α^(1/N)` at `k = N`, and lower bounds from one tail evaluation"; "Mean-value bounds for `Φ`, and the error guarantee of the Monte Carlo certification procedure, …"; replace the Layer 6 sentence by "`Suggested.lean` states fourteen theorems, including sharpness of the radius and the guarantee with a selection stage."

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 trichotomy, `smooth_trichotomy` | `E` trivial, `f ≡ c`; `f = 1_{{0}}`; halfspace | `smooth = c`; trivial `E` gives `1`, else `0`; `Φ((b − ⟪x,u⟫)/σ) ∈ (0,1)` | holds; Check R03 |
| 1.2 lower and upper forms | halfspace `⟪z,u⟫ ≤ t`; `{⟪z,u⟫ ≥ −t}`; `δ = 0`; `g ≡ 1/2`, `t = 0` | `Φ t → Φ(t − ‖δ‖)`; `Φ t → Φ(t + ‖δ‖)`; hypothesis = conclusion; `Φ(−‖δ‖) < 1/2` | holds, equality attained; Cohen Lemma 4 pp. 12–13 |
| 1.2 direct route (R04) | `(g − h)(r − c)` on both sides of `⟪z,u⟫ = t` | `g − h ≤ 0`, `r ≤ c`; `g − h ≥ 0`, `r ≥ c`; product `≥ 0` | route closes without the general lemma |
| 1.3 probit, `lipschitzWith_probit_smooth` | indicator of `(−∞, 0]` on `ℝ`; `f ≡ 1/2` | `smooth = Φ(−x/σ)`, probit `−x/σ`, slope `1/σ`; probit `0` | holds; Salman Lemma 2 p. 13 (`σ = 1`) |
| 1.3 smoothing, `lipschitzWith_smooth` | same indicator at `x = 0`; `E` trivial | derivative `−1/(σ√(2π))`; constant function | holds, sharp; Salman Lemma 1 has `√(2/π)` |
| 2.1 `classProb`, `SmoothCertified` | `C ≡ A`; `k = 1`; tie `1/2, 1/2`; `R ≤ 0` | `1 > 0` every `R`; no `c ≠ A`; `δ = 0` fails for `R > 0`; vacuous | holds |
| 2.2 `smoothCertified_of_bounds` | `pA ≤ pB`; `pA = 9/10, pB = 1/10`; `‖δ‖ < R` | `R ≤ 0`; `R = 1.2816σ`; `Φ(Φ⁻¹pA − ‖δ‖/σ) > Φ(Φ⁻¹pB + ‖δ‖/σ)` | holds; Cohen Thm 1 p. 4, proof pp. 13–14 |
| 2.2 `smoothCertified_of_lower_bound` | `pB = 1 − pA` | `P_c ≤ 1 − P_A ≤ 1 − pA`; `(σ/2)(Φ⁻¹pA − Φ⁻¹(1 − pA)) = σΦ⁻¹pA` | holds; binary case p. 4 |
| 2.3 `exists_classifier_not_certified` | `(3/4, 1/4)`; `(1/2, 1/4)`; `(2/5, 1/10)`; `pA + pB = 1`; `E` trivial | `k ≥ 2`, crossover `0.6745σ`; `k ≥ 3`; `⌈5⌉ = 5`, `k ≥ 7`; halfspaces meet in a null hyperplane; `‖δ‖ = 0 ≤ R` | holds; class count necessary; `[Nontrivial E]` is implied by `hδ` and `hBA` |
| 2.4 halfspaces | `⟪x,u⟫ < b`; boundary; `(u, b) ↦ (−u, −b)` | `σΦ⁻¹(Φ((b − ⟪x,u⟫)/σ)) = b − ⟪x,u⟫`; `P_A = 1/2`; same distance | holds; Cohen Props 3–5 pp. 17–19 |
| 3.1 `tail`, `cpLower`, `monotone_cpLower` | `k = 0`; `k > N`; `α < 0`; `tail 2 1 (1/2)`, `tail 2 2 (1/2)` | `tail = 1`, `cpLower = 0` (`α < 1`); `tail = 0`, `cpLower = 1` (`α ≥ 0`); all sets empty; `3/4`, `1/4` | holds for every `α` |
| 3.2 `binomial_real_lt_cpLower_le` | `α = 0`; `α = 1`; `N = 1`; `N = 0`; `p = 1` | event `{k > N}`, mass `0`; mass `1[p < 1]`; `p·1[p < α]` for `α < 1`; `cpLower α 0 0 = 0`; empty | theorem holds; Checks R02 |
| 3.3 `cpLower_eq_quantile_betaMeasure` | `k = N`; `N = k = 1` | Beta(`N`, 1) cdf `q^N`, quantile `α^(1/N)`; uniform, `α` | holds |
| 3.3 `cpLower_self` | `α = 0`, `α = 1`, `N = 1`; `(1/20, 10)` | `0`, `1`, `α` on both sides; `0.74113` | holds |
| 3.3 upper bound | `p = 1`, `α < 1`; `k = 0` | bound `1 = p` with probability `1`; `1 − α^(1/N)` | false with strict inequality: R01 |
| 3.4 | `tail 2 2 (1/2)`; `tail 3 3 (1/2)`; `cpLower (1/2) 2 1` | `1/4`, `cpLower (1/4) 2 2 = 1/2`; `1/8`; `1 − 1/√2 = 0.2929` | holds |
| 4.1 mean-value bounds | `a = b`; `a = 0, b = 1`; grid `0, 1` with `p = 0.7`, `0.95` | `0`; `0.24197 ≤ 0.34134 ≤ 0.39894`; `Φ⁻¹(0.7) = 0.524 ≤ 1`, `1 < 1.645` | inequality holds; consequence unstated: R06 |
| 5.1 `certify_failure_le` | `N = 0`; `α = 0`; `C ≡ A`; `1/2 < p̲` | `p̲ = 0`; `p̲ = 0`; `p̲ = α^(1/N) < 1`; `p̲ ∈ (1/2, 1)` so failure ⊂ `{P_A(x) < p̲}` | holds; Cohen CERTIFY, Prop 2 p. 6, proof p. 23 |
| 5.2 `certify_failure_le_of_selection` | `N₀ = 0`; `s` constant; `s` reading `ω` with `N = 1`, `α = 3/4` | reduces to 5.1; same; failure probability `1 > 3/4` | holds for independent `ω₀`; Check R07 |
| 5.3 | `(N, α) = (1, 3/4)`, `(1, 1/2)`, `(10⁵, 10⁻³)` | `3/4 > 1/2`, radius `0.6745σ`; `p̲ ≤ 1/2`; `Φ⁻¹(1 − 6.9075·10⁻⁵) = 3.8115` | holds; Cohen 3.2.2 pp. 5–6 |

- Previous review (R01–R13 at ea14431): all thirteen repaired; `Suggested.lean` lines 93–99 and 142–149 (R01), `README.md` lines 214–217 (R02), 325–355 (R03), 41–62 (R07, R09), 278 (R10), 421–422 (R11), 90 (R13); no change outside the folder (R05).
- Source locators checked against the text: 13 (CohenRosenfeldKolter2019 lines 305, 336, 347, 458–508, 475–493, 1140–1149, 1178, 1232, 1314, 1341, 1380, 1563, 1618; SalmanEtAl2019 lines 715–718, 743–744); all agree with the README.
- Library declarations opened at the pins: Tau Ceti `Measure.quantile` (`TauCeti/Probability/Quantile.lean` 164), `quantile_le_iff` (247), `lt_quantile_iff` (291), `quantile_lt_iff` (377), `quantile_gaussianReal` (`Distributions/Gaussian/Quantile.lean` 57), `binomial_tail_eq_regularizedIncompleteBeta` (`Binomial/Tail.lean` 128), `cdf_betaMeasure_eq` (`Beta/Cdf.lean` 136), `iIndepFun.hasLaw_sum_bernoulli` (`Binomial/Basic.lean` 132); Mathlib `binomial` (`Probability/Distributions/Binomial.lean` 56), `stdGaussian`, `stdGaussian_eq_map_pi_orthonormalBasis` (`Gaussian/Multivariate.lean` 65, 144), `betaMeasure` (`Beta.lean` 132).
- Cross-roadmap citations resolved: MathematicalStatisticsFoundations 6.2 (main, line 972) and 1.4 (line 385); StandardDistributions Layers 1, 7, 13 (main, lines 208, 969, 2239); RobustnessCertificates (open, scope line 37 hands randomized smoothing to this roadmap).
- Dependency check: `depcheck: 241 roadmaps, 2252 edges, 0 problem(s)`. Gate: every check passed, build included.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning. Elaborated signatures compared with the README for all 22 declarations: `smooth`, `classProb`, `SmoothCertified`, `hitCount` lose `[BorelSpace E]`, which their bodies do not use; every theorem carries it. One-tactic probe (`simp`, `rfl`, `infer_instance`, `simp` with the definitions unfolded, `aesop`, one `exact`) on all 14 theorems: none closes.
- Overlap check: read RobustnessCertificates, MathematicalStatisticsFoundations, StandardDistributions, GaussianIsoperimetryAndClusters; the Neyman–Pearson lemma: MathematicalStatisticsFoundations 6.2 (see R04); exact binomial intervals: MathematicalStatisticsFoundations lists them as beyond its scope, owned here; Gaussian enlargement and Bobkov inequalities (GaussianIsoperimetryAndClusters) are different statements from the shift inequality; nothing else shared.
- Source independence: 16 passages compared with 2 sources, none shared; largest share CohenRosenfeldKolter2019, 9 of 12 locators; contents compared with CohenRosenfeldKolter2019 (Sections 3.1–3.2.3, 4, Appendices A–J): independent. Clopper–Pearson 1934 was not read.

## Not verifiable

- Clopper–Pearson, Biometrika 26 (1934), 404–413 (3.2): paywalled, no open copy found; the citation is to the whole paper and attributes only the name of the interval.
- The Provenance statements about the `lean4-mlir` files and their licence (`README.md` lines 450–459): the repository was not read.

## Source issues

- **Misprint** in CohenRosenfeldKolter2019 at Appendix A.0.1, second Claim, p. 15: the source recalls the set `B` with `≤` and opens the computation with the probability of `A`; it should be `≥` and the probability of `B`, as the following lines use; affects nothing.
- **Misprint** in CohenRosenfeldKolter2019 at Appendix C.2, p. 23: the source says the procedure abstains when the lower bound is below one half; it should be at most one half, as the pseudocode on p. 6 has it; affects nothing.

## For the human reviewers

- **Scope.** The subject is a certification method from machine learning; its sources are two refereed conference papers (ICML 2019, NeurIPS 2019) and Clopper–Pearson 1934; `metadata.toml` files it under `math.ST`.
- **Licence.** `README.md` lines 450–459 say Layers 1–5 restate a formalization in `brettkoonce/lean4-mlir` (BSD-3, by the pull request's author); the repository and its licence file were not read, and the Lean was not compared with it.
- **Not tested.** Clopper–Pearson 1934 could not be read; wording and arrangement were compared only with the two arXiv texts.
