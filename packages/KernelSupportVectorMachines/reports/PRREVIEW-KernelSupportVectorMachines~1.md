# Review of KernelSupportVectorMachines (pull request #3008 at 15050a5)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed at degenerate parameters (`n = 0`, `C = 0`, `r = 0`, `r < 0`, the zero kernel, one-label samples, `σ = 0`) and each proof route was re-derived; the README, `Suggested.lean` and the cited supplier declarations agree. There are three small corrections and one format note, none blocking. Three of the six cited texts could not be read through a legal copy (Mohri–Rostamizadeh–Talwalkar, which carries the largest share of the locators, Steinwart, and Bousquet–Elisseeff); that is left to the human reviewers.

## C01 — The Conventions sentence says that dividing the objective by `2λ` gives Shalev-Shwartz–Ben-David's (15.6), but (15.6) is the undivided objective

In the third bullet of Conventions (README line 57), "Dividing the objective by `2λ` gives Mohri–Rostamizadeh–Talwalkar's `‖w‖²/2 + C Σ ξ_i` … and Shalev-Shwartz–Ben-David's (15.6), p. 207, with the same `λ`" reads as if both forms arise after the division. Shalev-Shwartz–Ben-David's (15.6), p. 207, is `λ‖w‖² + L_S^hinge(w)` with the average hinge loss, which is the roadmap's objective as it stands. A reader matching constants (the `2ρ²/(λm)` of 2.2 against `r²/(λn)`) needs to know that no rescaling of `λ` separates the two.

Smallest change: split the sentence, for example "The objective is Shalev-Shwartz–Ben-David's (15.6), p. 207, with the same `λ`; divided by `2λ` it is Mohri–Rostamizadeh–Talwalkar's `‖w‖²/2 + C Σ ξ_i` …".

## C02 — The first Check of 2.2 takes the linear kernel on `ℝ` with `r = 1`, where the hypothesis `K(x, x) ≤ r²` fails

The Check (README line 351) is offered as an instance of the oracle inequality, whose hypothesis is `K(x, x) ≤ r²` for every `x` of `X`. On `X = ℝ` the linear kernel has `K(x, x) = x²`, unbounded, so the instance as written is outside the theorem. The numbers are right once the space is the bounded one: I recomputed the six expectations (`39/64` three times; `27/32`, `63/128`, `63/128`), the misclassification risks (`3/8`, `9/32`, `159/512`) and the right sides (`359/128`, `231/128`, `565/384`; `17/2`, `9/2`, `19/6`) exactly.

Smallest change: "Linear kernel on `X = [−1, 1]`", as the last Check of 4.1 already does.

## C03 — Jaakkola–Haussler's Def. 1 is a family of classifiers with a general concave potential, not the support vector dual itself

In 1.2 (README line 132), "the dual without offset, in the normalization `C = 1`, is Jaakkola–Haussler, Def. 1, eqs. (1)–(2), p. 2". Their eq. (2) is `J(λ) = −(1/2) Σ λ_i λ_j S_i S_j K(X_i, X_j) + Σ F(λ_i)` on `0 ≤ λ_i ≤ 1` for a continuous concave potential `F` (their text after eq. (2), p. 2); `kernelDual` is the case `F(λ) = λ`. The same holds for the sentence of 1.3 that describes their Lemma 1.

Smallest change: "is the case `F(λ) = λ` of Jaakkola–Haussler, Def. 1, …".

## N01 — One Check of 1.2 reports a run, not a value

"The identity of the route holds exactly for 200 random rational choices …" (README line 193) gives a reader nothing to recompute, and the identity is a polynomial identity that expands in four lines (I expanded it: both sides are `λ‖h‖² + λ‖h_α‖² − 2λ Σ α_i + n⁻¹ Σ ξ_i`). One explicit instance with its two values would serve better; or drop the bullet.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 machine, growth, norm bound | one point `K = 1`, label true, `λ = 1/8, 1`; `n = 0`; `λ = 0` | minimizer `c = 1` (value `1/8`), `c = 1/2` (`3/4`); `n = 0`: objective `λ‖h‖²`, machine `0`; `λ = 0`: every `c ≥ 1` gives `0` | true | none |
| 1.2 without offset, `isMaxOn_kernelDual_iff` | same point: `λ = 1/8` (`C = 4`), `λ = 1` (`C = 1/2`); `n = 0`; zero kernel | `D` max at `α = 1`, `2λD = 1/8` = primal; `α = 1/2`, `2λD = 3/4` = primal; `n = 0`: `0 = 0`; zero kernel: `α ≡ C`, `2λ·nC = 1` = primal | true | none |
| 1.2 four-point Check | `(1,0)+, (0,1)+, (−1,0)−, (1/2,1/2)−`, `λ = 1/4` | `C = 1/2`; `h_α = (3/4, 1/4)`; margins `3/4, 1/4, 3/4, −1/2 ≤ 1`; `D = 2 − 5/16 = 27/16`; primal `11/16 + 5/32 = 27/32` | true | none |
| 1.2 with offset, `isMinOn_softObjective_iff` | four-point sample; one label; zero kernel with `n₊ < n₋` and `n₊ = n₋`; `n = 0` | offsets `b ≤ 1/4, b ≤ 3/4, b ≥ −1/4, b ≥ −3/2` → `[−1/4, 1/4]`; one label: `F = {0}`, `b ≥ 1`, value `0`; zero kernel: `b = −1` resp. `[−1, 1]`, value `2n₊/n` both sides | true | none |
| 1.2 identity of the route | symbolic expansion | both sides `λ‖h‖² + λ‖h_α‖² − 2λΣα_i + n⁻¹Σξ_i` | true | N01 |
| 1.2 source sentence on Jaakkola–Haussler | their Def. 1 | objective has `Σ F(λ_i)`, `F` concave, box `[0, 1]` | imprecise | C03 |
| 1.3 `labelSign_mul_sum_le_loo` | `C = 0`; `m = 0`; `α_t = 0`; `C < 0`; reduced machine at `C = 2/3` on `1, 2` | `C = 0`, `m = 0`: `0 ≤ 0`; `C < 0`: box empty; stationary point `w = 2/3` on `(1/2, 1)`; averaged `λ = 1/4`: `w = 1` | true | none |
| 2.1 `mul_sqrt_mul_norm_svm_sub_sq_le` | `λ = 1/4`: `(3,+)` vs `(−3,+)`; `((1,+),(−1,−))` vs `((2,+),(−1,−))`; `n = 0` | `w = ±1/3`: `1/8·4/9 = 1/18 ≤ 6`; both `w = 1`: `0 ≤ 1/2`; `n = 0`: `0 ≤ 0` | true | none |
| 2.1 `measurable_svm_apply` and the consequence | route re-derived; constants of the supplier bound | `β = r²/(nλ)`, `2nβ = 2r²/λ`, `M = 1 + r/√λ`: the stated deviation term | true | none |
| 2.2 `lintegral_surrogateRisk_svm_le` | four-atom law, `n = 1, 2, 3`, `λ = 1/2, 1/8`; `n = 0`; `r = 0`; `r < 0` | left `39/64 ×3`; `27/32, 63/128, 63/128`; right `359/128, 231/128, 565/384`; `17/2, 9/2, 19/6`; `n = 0`: `1 > 1/2 + 1/64` | true | C02 |
| 2.2 stability constant | derivation from two growth inequalities; `n = 1`, `λ = 1`, labels flipped | `‖Δ‖ ≤ Gr/(λn)`, loss change `≤ G²r²/(λn)`; example `Δ = 1 = Gr/(λn)`, sharp | true | none |
| Conventions, normalisation | objective `/ 2λ` | `‖h‖²/2 + (2λn)⁻¹ Σ hinge`; Shalev-Shwartz–Ben-David (15.6) is the undivided form | unclear | C01 |
| 3.1 `hinge_calibration` | `C(η, u)` on `[−1, 1]` and outside; `η = 3/4, u = 0`; `η ≡ 1/2, h ≡ 0` | `1 + u(1 − 2η)`, min `2 min(η, 1 − η)`; wrong sign: `C ≥ 1`, gap `≥ |2η − 1|`; `1/2 = 1/2`; `marginError` excess `1/2` vs `0` | true | none |
| 3.2 `iInf_surrogateRisk_eq_of_isUniversalKernel` | two points, constant kernel; identity kernel | constants: hinge risk `≥ 1` vs `2R* = 0`; identity kernel: `h = (−1, 1)` risk `0` | true | none |
| 3.2 `tendsto_lintegral_classificationError_svm` | route: `λ_n‖h‖² ≤ ε`, `r²/(λ_n n) ≤ ε`; `λ_n ≤ 0` for small `n` | excess `≤ 3ε` for large `n`; small `n` do not enter the limit | true | none |
| 3.3 `isUniversalKernel_gaussianKernel` | `σ = 0`; `d = 0`; `K = ∅`; two points; feature identity | `σ = 0`: kernel `≡ 1`; `−‖x‖²/2s − ‖y‖²/2s + ⟪x,y⟫/s = −‖x−y‖²/2s`; Gram determinant `1 − q² > 0` | true | none |
| 4.1 `marginError_le_uniform` | stratification constants; `ρ = r`; `r = 0`; `r = −1`; `n = 0`; `δ ≥ 1` | `Σ δ/(2k²) = δπ²/12`; `k ≤ log₂(2r/ρ)`; `ρ = r`: `log 1 = 0`; `r = −1`: `−4 + 0 + 0.83 < 0`; `n = 0`: bound `0 < 1` | true | none |
| 4.1 Check on `[−1, 1]` | sample `1` (true), `−1` (false) | both `a_S(i)` the identity, `γ_S = 1`, bound `4/√2 + √(log(2/δ)/4)` | true | none |

- Source locators checked against the text: 10 (Bartlett–Jordan–McAuliffe preprint: sign convention p. 7, Thm 3 p. 12, Example 4 pp. 19–20; Jaakkola–Haussler: Def. 1 p. 2, Lemma 1 eq. (5) p. 3, App. A eq. (30) pp. 6–7; Shalev-Shwartz–Ben-David: Thm 13.2 p. 174, Cor 13.8 p. 179, (15.6) p. 207, Cor 15.7 p. 208). All agree with the README.
- Library declarations opened at the pins: 32 of Mathlib (among them `Mathlib/Analysis/InnerProductSpace/Reproducing.lean` lines 128, 146, 167, 181, 217, 230, 239, 267, 274, 282, 389; `MeasurableSpace/Constructions.lean` line 516; `Constructions/BorelSpace/Basic.lean` lines 645, 656; `StoneWeierstrass.lean` line 264) and 3 of Tau Ceti (`TauCeti/Analysis/PositiveDefinite/Kernel/Universal.lean` lines 51 and 87; `TauCeti/Analysis/Convex/Differentiability.lean` line 177). All exist with the stated content. Neither library has Gaussian universality, a hinge loss or a support vector machine.
- Cross-roadmap citations resolved: 19 declarations and sections in seven suppliers (StatisticalLearningTheory, ConvexAnalysisAndDuality, KernelsAndSpectralMethods, SupportVectorMachines, ThresholdFunctionsAndMargins at their open heads; MathematicalStatisticsNonparametric 5.8 and MathematicalStatisticsAsymptotic 3.2 on main). The 11 copied definitions agree with their owners' bodies; hypotheses listed in the supplier contracts agree with the signatures.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with 11 `sorry` warnings and nothing else. `#check`-level signatures of all 28 declarations were compared with the README; the three definitions that do not carry `[CompleteSpace H]` (`svmObjective`, `svm`, `cObjective`) do not use it, and every theorem carries it.
- Padding probe: none of the 11 theorems closes with `simp`, `rfl`, `infer_instance`, `exact?` or `simp_all` with the definitions unfolded. The eight headline results of the README are all stated.
- Pull-request text: counts (11 theorems, 17 definitions, 11 copied), the import, the supplier list and the five open dependencies agree with the head; nothing outside the folder is changed.

Overlap check: read SupportVectorMachines, StatisticalLearningTheory, DiscriminantAnalysisAndLogisticRegression, OnlineLearningAndLittlestoneDimension, PACBayesBounds, MathematicalStatisticsNonparametric, MathematicalStatisticsSemiparametric, MathematicalStatisticsAsymptotic; nothing shared. SupportVectorMachines lists the box-constrained dual, and margin, stability and calibration bounds, as not treated; StatisticalLearningTheory has the support vector machine as an example only and puts fast rates on its boundary list; DiscriminantAnalysisAndLogisticRegression excludes hinge losses and margins.

Source independence: 13 passages compared with 3 sources, none shared; largest share Mohri–Rostamizadeh–Talwalkar, 11 of 32 locators, text not readable; contents compared by chapter number of the locators only (Layer 1 ↔ Ch. 5–6 and Jaakkola–Haussler, Layer 2 ↔ Ch. 14 and another book, Layer 3 ↔ none, Layer 4 ↔ Ch. 5): independent.

Research link: Layer 3 states the hinge case of the comparison theorem of Bartlett–Jordan–McAuliffe (2006) and consistency for Steinwart's (2001) universal kernels; Layer 2 the oracle inequality of Shalev-Shwartz–Ben-David (2014) via Bousquet–Elisseeff (2002) stability; 3.3 supplies the universality hypothesis of OptimalTransport 13.4. Rests on the README and the three texts read.

## Not verifiable

- Mohri–Rostamizadeh–Talwalkar, *Foundations of Machine Learning*, 2nd ed.: (5.24), (5.26)–(5.30), (5.33), Thm 5.9, Cor 5.11, (6.13)–(6.15), Thm 6.12, Prop 14.4, Lemma 14.7, Cor 14.8 and their pages. The publisher's page refused the request and the author's page links to a file-hosting copy that the sources service does not accept. The mathematics of 1.2 and 4.1 was re-derived independently.
- Steinwart (2001): Def 4, Prop 8, Cor 10, Example 1, Thm 12 with its remark, Thm 22, Cor 23, and the description of Thm 22 and Cor 23 in 3.2 (offset, covering numbers, constant noise level). The journal's host is not accepted by the sources service and the author's page has no copy.
- Bousquet–Elisseeff (2002), p. 516: the remark that stability with an offset is open. Same host.
- Jaakkola–Haussler was read in the author's PostScript copy by OCR; its page numbers agree with the README, but the PMLR reissue named in the References was not opened.

## Source issues

- none

## For the human reviewers

- **Not tested.** Mohri–Rostamizadeh–Talwalkar carries the largest share of the locators (11 of 32, README References) and could not be read: wording and arrangement were not compared against it.
- **Licence.** Steinwart (2001) and Bousquet–Elisseeff (2002) are in an open-access journal whose host the sources service does not classify; their locators stand unverified.
- **Licence.** Bartlett–Jordan–McAuliffe was read as the 2005 preprint on P. Bartlett's page, which is the version the README cites; the published article numbers its theorems differently.
