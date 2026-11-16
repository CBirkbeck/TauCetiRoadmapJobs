# Review of RandomizedSmoothing (pull request #2428 at 3897f41)

**Verdict:** accepted

Incremental re-review of the 61 lines changed since `bbe1599`. No finding.

## Previous findings

- R01 — repaired: "is at least `p` except on an event of `Bin(N, p)`-probability at most `α`: the exceptional event is `{1 - p < cpLower α N (N - K)}` with `N - K ∼ Bin(N, 1 - p)`, which 3.2 bounds" (`README.md` lines 316–318).
- R02 — repaired: "`N = 1`, `α < 1`: `cpLower α 1 1 = α`" and "the event is `{k | N < k}` when `p < 1` and empty when `p = 1`; its probability is `0`" (lines 300–303).
- R03 — repaired: "For `E` nontrivial and `f` the indicator of `{0}`: `f = 0` `γ`-almost everywhere, so `smooth σ f ≡ 0` although `f ≠ 0`" (lines 100–101).
- R04 — repaired: "put `h = 1[⟪z, u⟫ ≤ t]`, `r(z) = exp(⟪z, δ⟫ - ‖δ‖²/2)` … `(g - h)(r - c) ≥ 0` pointwise … The upper form is the lower form for `1 - g` and `-t`" (lines 119–123); the route no longer uses an unlisted input.
- R05 — repaired: "for `m ≤ n`, `Bin(n, p).real {k | m ≤ k} = I_p(m, n - m + 1)`" and "for positive parameters, the Beta cdf is the regularized incomplete Beta function" (lines 62–65).
- R06 — repaired: "if `p ≤ 1/2 + Σ_{i=1}^{n} (a_i - a_{i-1}) φ(a_i)` then `Φ⁻¹ p ≤ a_n`, and if `1/2 + Σ_{i=1}^{n} (a_i - a_{i-1}) φ(a_{i-1}) < p` then `a_n < Φ⁻¹ p`" (lines 359–361); `Measure.quantile_le_iff` added to line 373.
- R07 — repaired: "Independence of the two samples is needed: for `N = 1`, `α = 3/4`, the class `A = C (x + σ ω 0)` read from the estimation sample … the failure event has probability `1 > 3/4`" (lines 422–425).
- R08 — repaired: `## Conventions` is at line 40, before `## Exact supplier contracts` (49) and `## How to read the build` (73).
- R09 — repaired: the description reads "positivity trichotomy", "lower bounds from one tail evaluation", "Mean-value bounds for `Φ`" and "`Suggested.lean` states fourteen theorems, including sharpness of the radius and the guarantee with a selection stage"; no Layer 6 sentence.

No repair introduced a new problem.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 3.3 upper bound (changed) | `p = 1`; `p = 0`; `N = 1, α = 1/2, p = 3/5` | `1 - cpLower α N 0 = 1 ≥ 1`; `1 - α^(1/N) ≥ 0`; `K = 0`: bound `1/2 < 3/5`, probability `2/5 ≤ 1/2` | holds; reduction to 3.2 at `1 - p` correct |
| 3.2 Checks (changed) | `N = 1, α < 1`; `α = 0`, `p < 1` and `p = 1` | `cpLower α 1 0 = 0`, `cpLower α 1 1 = α`, event mass `p · 1[p < α] ≤ α`; `cpLower 0 N k = 0` (`k ≤ N`), `1` (`k > N`), mass `0` | agree with 3.1 Checks and with 3.2 |
| 1.1 Check (changed) | `E = ℝ`; `E = {0}` | `γ{0} = 0`, `smooth ≡ 0`; trivial `E` now excluded and covered by the next Check (`c = 1`) | holds |
| 1.2 route (changed) | sign of `(g − h)(r − c)` on each side of `⟪z, u⟫ = t`; `g ≡ 1/2, t = 0, ‖δ‖ = 1`; upper form via `1 − g`, `−t` | `g − h ≤ 0, r ≤ c`; `g − h ≥ 0, r > c`; `∫ h r dγ = Φ(t − ‖δ‖)`; `Φ(−1) = 0.1587 ≤ 1/2`; `1 − Φ(−t − ‖δ‖) = Φ(t + ‖δ‖)` | route closes from the listed inputs; both forms match `Suggested.lean` lines 41–50 |
| Contracts (changed) | `m = n + 1`; pin signatures | excluded by `m ≤ n`; pin: `(hmn : m ≤ n)`, `(hα : 0 < α) (hβ : 0 < β)` | README equals the pin |
| 4.1 grid bounds (changed) | `n = 0`; grid `0, 1` with `p = 7/10`, `19/20` | `p ≤ 1/2 ⇒ Φ⁻¹ p ≤ 0`; `1/2 + φ(1) = 0.74197 ≥ 0.7`, `Φ 1 = 0.84134`; `1/2 + φ(0) = 0.89894 < 0.95`, `Φ⁻¹(0.95) = 1.6449 > 1` | both implications hold; Check values correct |
| 5.2 non-example (changed) | `N = 1`, `α = 3/4`, `A = C (x + σ ω 0)`, `x` on the boundary | `K = 1`, `p̲ = cpLower (3/4) 1 1 = 3/4 > 1/2`, radius `0.6745σ > 0`, `P_A(x) = P_B(x) = 1/2`, failure mass `1 > 3/4` | genuine non-example; does not contradict `certify_failure_le_of_selection` (there `s` reads `ω₀` only) |

The rows for the statements this change does not touch stand as in the previous review, of `bbe1599`.

- Change since `bbe1599`: 61 lines of `README.md`; `Suggested.lean` and `metadata.toml` unchanged; nothing changed outside the folder.
- Source locators checked against the text: 1 in a changed passage (CohenRosenfeldKolter2019 line 1140, Lemma 4, pp. 12–13; the lemma's statement supports 1.2). Sampled targets touched by the diff: 1.1, 1.2, 3.2, 3.3, 4.1, 5.2.
- Library declarations opened at the pins: 5 (Tau Ceti `Probability/Distributions/Binomial/Tail.lean` line 128, `Distributions/Beta/Cdf.lean` line 136, `Probability/Quantile.lean` lines 247, 291, 377).
- Cross-roadmap citations resolved: 2 (RobustnessCertificates at its open head, `README.md` lines 37–38, which hands randomized smoothing to this roadmap; MathematicalStatisticsFoundations on main). The citation tool lists none unresolved.
- Dependency check: `depcheck: 245 roadmaps, 2287 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: every check passed (the worker's run includes the build). Elaboration of `Suggested.lean`: 14 `sorry` warnings, nothing else. The four binder leads are `[BorelSpace E]` and related instances on `smooth`, `classProb`, `SmoothCertified` and `hitCount`, whose types do not need them; every theorem carries them.
- Pull-request text: title and each sentence of the description read against this head; fourteen theorems counted in `Suggested.lean`; nothing contradicted, nothing left unstated.
- Overlap check: read RobustnessCertificates, MathematicalStatisticsFoundations, StandardDistributions; nothing shared (deterministic certificates: RobustnessCertificates; the general Neyman–Pearson lemma and confidence sets: MathematicalStatisticsFoundations 6.2 and 1.4; quantile, binomial tail and Beta cdf: StandardDistributions, as implemented in Tau Ceti).
- Source independence: changed passages only: 7 passages compared with 1 source (CohenRosenfeldKolter2019, lines 1052–1165), none shared, the proof route of 1.2 differs from the source's; largest share CohenRosenfeldKolter2019, 9 of 12 locators; the diff adds, removes and reorders no layer, so the arrangement was not compared again.

## Not verifiable

- Clopper–Pearson, Biometrika 26 (1934), 404–413 (3.2): paywalled, not read; the change does not touch the citation.
- The Provenance statements about the `lean4-mlir` files and their licence (`README.md` lines 460–469): the repository was not read.

## Source issues

- none

## For the human reviewers

- **Scope.** The subject is a certification method from machine learning; its sources are two refereed conference papers (ICML 2019, NeurIPS 2019) and Clopper–Pearson 1934; `metadata.toml` files it under `math.ST`.
- **Licence.** `README.md` lines 460–469 say Layers 1–5 restate a formalization in `brettkoonce/lean4-mlir` (BSD-3, by the pull request's author); the repository and its licence file were not read, and the Lean was not compared with it.
- **Not tested.** Clopper–Pearson 1934 could not be read; wording and arrangement were compared only with the two arXiv texts, in an earlier review.
