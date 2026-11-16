# Review of RandomizedSmoothing (pull request #2428 at bbe1599)

**Verdict:** needs changes

Incremental re-review of the 3 lines changed since `7419977`. That change repairs one finding of the previous review (the pull-request link); the other nine passages are unchanged, so they are written again below with the line numbers of this head.

## R01 (P2) — 3.3: the upper Clopper–Pearson bound does not strictly exceed `p` at `p = 1`

**Location:** `TauCetiRoadmap/RandomizedSmoothing/README.md` lines 311–312: "The upper Clopper–Pearson bound, one minus `cpLower α N (N - k)`, exceeds `p` except on an event of `Bin(N, p)`-probability at most `α`."
**Claim:** With "exceeds" strict the statement is false at `p = 1` for every `α < 1`.
**Witness:** `p = 1`, `α < 1`: `K = N` almost surely, the bound is `1 - cpLower α N 0 = 1 - 0 = 1 = p` (line 277), so it fails to exceed `p` with probability `1 > α`.
**Repair:** "The upper Clopper–Pearson bound, one minus `cpLower α N (N - k)`, is at least `p` except on an event of `Bin(N, p)`-probability at most `α`." At `p = 1` this reads `1 ≥ 1`; in general the exceptional event is `{1 - p < cpLower α N (N - K)}` with `N - K ∼ Bin(N, 1 - p)`, which 3.2 bounds by `α`.

## R02 (P3) — 3.2: two Checks contradict Checks of 3.1 and 3.2

**Location:** `README.md` lines 296–298: "`N = 1`: `cpLower α 1 1 = α` for `α ≤ 1`, and the coverage event has probability `p · 1[p < α] ≤ α`" and "`α = 0`: `cpLower 0 N k = 0` for `k ≤ N`, so the event is empty."
**Claim:** The first is false at `α = 1`; the second event is null, not empty.
**Witness:** `α = 1`, `N = 1`, `p = 1/2`: `cpLower 1 1 0 = 1 > p` (line 277), so the event has probability `1`, not `p = 1/2` (line 299 agrees). `α = 0`, `p < 1`: `cpLower 0 N k = 1` for `k > N` (line 278), so the event is `{k | N < k}`.
**Repair:** "`N = 1`, `α < 1`: `cpLower α 1 1 = α`, and the coverage event has probability `p · 1[p < α] ≤ α`." and "`α = 0`: `cpLower 0 N k = 0` for `k ≤ N`, so the event is `{k | N < k}` when `p < 1` and empty when `p = 1`; its probability is `0`."

## R03 (P3) — 1.1: the Check on the indicator of `{0}` fails when `E` is trivial

**Location:** `README.md` line 99: "`f` the indicator of `{0}`: `f = 0` almost everywhere, so `smooth σ f ≡ 0` although `f ≠ 0`."
**Claim:** No hypothesis excludes the trivial space, which the next Check uses.
**Witness:** `E = {0}`: `γ = δ₀`, `f ≡ 1`, `smooth σ f ≡ 1` (the case `c = 1` of line 100).
**Repair:** "For `E` nontrivial and `f` the indicator of `{0}`: `f = 0` `γ`-almost everywhere, so `smooth σ f ≡ 0` although `f ≠ 0`."

## R04 (P3) — 1.2: the route invokes the Neyman–Pearson lemma, which no *Needs:* item or contract supplies

**Location:** `README.md` line 117: "The lower form is the Neyman–Pearson lemma for the pair `γ` and `γ` shifted by `δ`"; line 130: "*Needs:* 1.1; Mathlib `stdGaussian_eq_map_pi_orthonormalBasis`, `gaussianReal`, `cdf`."
**Claim:** The sketch names an input that is neither a target here, a listed supplier, nor a pinned declaration.
**Witness:** MathematicalStatisticsFoundations 6.2 on main owns the lemma (this README, lines 32–33, says so); it is absent from line 130 and from `## Exact supplier contracts`.
**Repair:** Either add "MathematicalStatisticsFoundations 6.2 (generalized lemma)" to line 130 and a `From TauCetiRoadmap.MathematicalStatisticsFoundations` entry to the contracts, or make the route self-contained: "With `h = 1[⟪z, u⟫ ≤ t]`, `r(z) = exp(⟪z, δ⟫ - ‖δ‖²/2)` and `c = exp(t‖δ‖ - ‖δ‖²/2)`, `(g - h)(r - c) ≥ 0` pointwise, so `∫ (g - h) r dγ ≥ c ∫ (g - h) dγ ≥ 0`; and `∫ h r dγ = Φ(t - ‖δ‖)` by reduction to the coordinate along `u`."

## R05 (P3) — Supplier contracts omit the hypotheses of two pinned theorems

**Location:** `README.md` lines 52–55: "`Bin(n, p).real {k | m ≤ k} = I_p(m, n - m + 1)`" and "the Beta cdf is the regularized incomplete Beta function."
**Claim:** Both identities are stated without the hypotheses the pinned declarations carry.
**Witness:** Tau Ceti `TauCeti/Probability/Distributions/Binomial/Tail.lean` line 128: `(hmn : m ≤ n)`; `Distributions/Beta/Cdf.lean` line 136: `(hα : 0 < α) (hβ : 0 < β)`. For `m = n + 1` the second Beta parameter is `0`.
**Repair:** "for `m ≤ n`, `Bin(n, p).real {k | m ≤ k} = I_p(m, n - m + 1)`" and "for positive parameters, the Beta cdf is the regularized incomplete Beta function."

## R06 (P3) — 4.1 promises bounds for `Φ⁻¹ p` without stating them

**Location:** `README.md` lines 353–354: "these bound `Φ⁻¹ p` above and below by finitely many values of `φ`."
**Claim:** No quantifiers, no hypotheses on `p`, no inequality; and the *Needs:* line (364) lists only `Measure.lt_quantile_iff`, which gives the lower bound alone.
**Witness:** `p = 7/10`, grid `0, 1`: `1/2 + φ(1) ≈ 0.742 ≥ p` gives `Φ⁻¹ p ≤ 1` through `Measure.quantile_le_iff` (`TauCeti/Probability/Quantile.lean` line 247), not through `lt_quantile_iff`.
**Repair:** "Hence for `0 = a₀ ≤ a₁ ≤ … ≤ a_n` and `p ∈ (0, 1)`: if `p ≤ 1/2 + Σ_{i=1}^{n} (a_i - a_{i-1}) φ(a_i)` then `Φ⁻¹ p ≤ a_n`, and if `1/2 + Σ_{i=1}^{n} (a_i - a_{i-1}) φ(a_{i-1}) < p` then `a_n < Φ⁻¹ p`." Add `Measure.quantile_le_iff` to line 364. (Second instance: `p = 19/20`, `1/2 + φ(0) ≈ 0.899 < p`, and `1 < Φ⁻¹ p ≈ 1.645`.) Or delete the sentence.

## R07 (P3) — 5.2: the third Check tests nothing and speaks about the README

**Location:** `README.md` lines 413–414: "A selection rule that reads the estimation sample is not covered, and the README does not claim it."
**Claim:** A Check computes a value or a non-example; this one does neither.
**Witness:** A non-example exists: `N = 1`, `α = 3/4`, `A = C (x + σ ω 0)`, `C` a two-class halfspace classifier with `x` on its boundary. `K = 1`, `p̲ = cpLower (3/4) 1 1 = 3/4`, radius `σ Φ⁻¹(3/4) > 0`, yet `P_A(x) = 1/2`.
**Repair:** "Independence of the two samples is needed: for `N = 1`, `α = 3/4`, the class `A = C (x + σ ω 0)` read from the estimation sample, and a two-class halfspace classifier with `x` on its boundary, `K = 1` and `p̲ = 3/4` always, so the radius `σ Φ⁻¹ (3/4)` is always returned while `P_A(x) = 1/2`: the failure event has probability `1 > 3/4`."

## R08 (P3) — `## Conventions` follows the supplier contracts and the build paragraph

**Location:** `README.md` lines 40, 63, 72: `## Exact supplier contracts`, `## How to read the build`, `## Conventions`.
**Claim:** The contracts use `Φ`, `Φ⁻¹` and `Bin(n, p)` (lines 47–53) before Conventions introduces them.
**Witness:** `MathematicalStatisticsFoundations/README.md` on main: Conventions line 108, contracts 162, build 253.
**Repair:** Move lines 72–79 to directly after `## Scope and ownership`.

## R09 (P3) — The description is written for the first head

**Location:** pull-request description: "with the positivity dichotomy"; "and rational certificates"; "Rational bounds for `Φ` and `Φ⁻¹`"; "The numerical checks in Layer 6 were verified to 40 digits."
**Claim:** The head has a trichotomy, no rational certificates or rational bounds, and no Layer 6; the description does not say that `Suggested.lean` states sharpness and the selection stage.
**Witness:** `README.md` line 89 "**Positivity trichotomy.**"; lines 324–337 (3.4: the finite-sum formula and one implication); line 348 "Layer 4: mean-value bounds for the Gaussian cdf"; the last layer is Layer 5.
**Repair:** "…with the positivity trichotomy"; "…the closed form `α^(1/N)` at `k = N`, and lower bounds from one tail evaluation"; "Mean-value bounds for `Φ`, and the error guarantee of the Monte Carlo certification procedure, …"; replace the Layer 6 sentence by "`Suggested.lean` states fourteen theorems, including sharpness of the radius and the guarantee with a selection stage."

## Previous findings

- R01 — not repaired: "one minus `cpLower α N (N - k)`, exceeds `p` except on an event of `Bin(N, p)`-probability at most `α`" (lines 311–312). R01 here.
- R02 — not repaired: "`cpLower α 1 1 = α` for `α ≤ 1`" and "so the event is empty" (lines 296–298). R02 here.
- R03 — not repaired: "`f` the indicator of `{0}`: `f = 0` almost everywhere, so `smooth σ f ≡ 0`" (line 99). R03 here.
- R04 — not repaired: "The lower form is the Neyman–Pearson lemma for the pair `γ` and `γ` shifted by `δ`" (line 117); the *Needs:* line 130 is unchanged. R04 here.
- R05 — not repaired: "`Bin(n, p).real {k | m ≤ k} = I_p(m, n - m + 1)`" with no `m ≤ n` (line 53); line 54–55 unchanged. R05 here.
- R06 — not repaired: "these bound `Φ⁻¹ p` above and below by finitely many values of `φ`" (lines 353–354). R06 here.
- R07 — not repaired: "is not covered, and the README does not claim it" (lines 413–414). R07 here.
- R08 — repaired: "and deterministic certificates, which belong to the RobustnessCertificates roadmap." (line 38); no link, no pull-request number, and the repair introduces no problem.
- R09 — not repaired: `## Conventions` is still at line 72, after `## Exact supplier contracts` (40) and `## How to read the build` (63). R08 here.
- R10 — not repaired: the description still reads "positivity dichotomy", "rational certificates" and "The numerical checks in Layer 6". R09 here.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Scope, line 38 (changed): deterministic certificates belong to RobustnessCertificates | that roadmap's scope at its open head | its README lines 38–39 hand randomized smoothing to RandomizedSmoothing; neither owns the other's objects | citation resolves, by name; single owner each way |
| 2.2 `smoothCertified_of_bounds` (the statement the changed scope sentence delimits) | `pA = 9/10, pB = 1/10`; `pA ≤ pB` | `R = (σ/2)(1.2816 + 1.2816) = 1.2816σ`; `R ≤ 0`, vacuous | holds; probabilistic, not a deterministic certificate |
| 3.3 upper bound (R01) | `p = 1`, `α < 1`; `k = 0` | `1 - cpLower α N 0 = 1 = p` with probability `1`; `1 - α^(1/N)` | false with strict inequality |
| 3.2 Checks (R02) | `α = 1, N = 1, p = 1/2`; `α = 0, p < 1` | event `{0, 1}`, mass `1 ≠ 1/2`; event `{k > N}`, mass `0` | theorem holds, Checks wrong |
| 1.1 Check (R03) | `E = {0}`, `f = 1_{{0}}` | `f ≡ 1`, `smooth σ f ≡ 1`, not `0` | Check false on trivial `E` |
| 1.2 route (R04) | `(g − h)(r − c)` either side of `⟪z,u⟫ = t` | `g − h ≤ 0, r ≤ c`; `g − h ≥ 0, r ≥ c`; product `≥ 0` | direct route closes |
| Contracts (R05) | `m = n + 1` | Beta parameters `(n + 1, 0)`; left side `0`; pin requires `m ≤ n`, `0 < β` | hypotheses missing |
| 4.1 (R06) | grid `0, 1`; `p = 0.7`, `0.95` | `φ(0) = 0.39894`, `φ(1) = 0.24197`, `Φ 1 = 0.84134`; `0.74197 ≥ 0.7`; `0.89894 < 0.95` | inequality holds; consequence unstated |
| 5.2 Check (R07) | `N = 1`, `α = 3/4`, `A` read from `ω` | `K = 1`, `p̲ = 3/4`, radius `0.6745σ`, `P_A(x) = 1/2`; failure probability `1` | non-example exists |

The rows for the statements this change does not touch stand as in the previous review, of `7419977`.

- Change since `7419977`: one sentence of `README.md` (line 38); `Suggested.lean` and `metadata.toml` unchanged; nothing changed outside the folder.
- Library declarations opened at the pins: 4 (Tau Ceti `Binomial/Tail.lean` 128, `Beta/Cdf.lean` 136, `Quantile.lean` 247 and 291).
- Cross-roadmap citations resolved: 2 (RobustnessCertificates at its open head, scope lines 38–39; MathematicalStatisticsFoundations on main, heading order lines 108, 162, 253).
- Dependency check: `depcheck: 242 roadmaps, 2261 edges, 0 problem(s)`; no UPWARD or CYCLE line. RobustnessCertificates is named as the owner of excluded material, not as a supplier.
- Gate: every check passed (the worker's run includes the build). Elaboration of `Suggested.lean`: 14 `sorry` warnings, nothing else.
- Overlap check: read RobustnessCertificates, MathematicalStatisticsFoundations, StandardDistributions; nothing shared (deterministic certificates: RobustnessCertificates; the general Neyman–Pearson lemma: MathematicalStatisticsFoundations 6.2, see R04).
- Source independence: changed passages only: 1 passage compared, it cites no source and shares nothing; largest share CohenRosenfeldKolter2019, 9 of 12 locators, as before; the diff adds, removes and reorders no layer, so the arrangement was not compared again.

## Not verifiable

- Clopper–Pearson, Biometrika 26 (1934), 404–413 (3.2): paywalled, not read; the change does not touch the citation.
- The Provenance statements about the `lean4-mlir` files and their licence (`README.md` lines 449–458): the repository was not read.

## Source issues

- none

## For the human reviewers

- **Scope.** The subject is a certification method from machine learning; its sources are two refereed conference papers (ICML 2019, NeurIPS 2019) and Clopper–Pearson 1934; `metadata.toml` files it under `math.ST`.
- **Licence.** `README.md` lines 449–458 say Layers 1–5 restate a formalization in `brettkoonce/lean4-mlir` (BSD-3, by the pull request's author); the repository and its licence file were not read, and the Lean was not compared with it.
- **Not tested.** Clopper–Pearson 1934 could not be read; wording and arrangement were compared only with the two arXiv texts, in the previous review.
