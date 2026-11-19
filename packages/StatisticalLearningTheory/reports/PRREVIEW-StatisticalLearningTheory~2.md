# Review of StatisticalLearningTheory (pull request #2515 at 0a66c85)

**Verdict:** accepted

**Summary.** Accepted: this head repairs both findings of the previous review (the realizable negative control of 3.1 and the missing headline statements), and a fresh pass over every statement found nothing false. All 49 Lean statements elaborate with `sorry` as the only warning, each was recomputed at small cases, and the source locators that could be read (Devroye–Györfi–Lugosi, Dwork–Roth, Hardt–Recht, Lipton–Wang–Smola) are at the stated pages. There are two small corrections and two format notes, none blocking. Two points are left to the human reviewers: the most-cited source (Mohri–Rostamizadeh–Talwalkar) could not be read, and the Lean file was not compared with the author's earlier formalization.

## C01 — The proof route of 3.4 points at the finite-dimensional lower bound, and the infinite-dimensional one it needs assumes measurable singletons that 3.4 does not

The route of 3.4 (line 729) says realizable learnability with infinite dimension "contradicts 3.3 with `d` larger than `m(ε, δ)/c · ε`". The sample-complexity bound of 3.3 is stated for `vcDim H = d` finite, so it does not apply to a class of infinite dimension; the input is the third bullet of 3.3 (which itself says "3.4 uses it"). That bullet, and `exists_lintegral_classificationError_ge_of_vcDim_eq_top`, assume `MeasurableSingletonClass X`, while 3.4 and `vcDim_lt_top_iff_isPACLearnable` do not, so an implementer who follows the route is one hypothesis short.

The theorem is true as stated: the members are measurable and separate the shattered points, so a law supported on `K` shattered points gives every member its discrete error, and the outer probability of a set of samples is at least its discrete mass; with a uniform random labelling `E R ≥ (1 - n/K)/2`, which contradicts learnability at `ε = δ = 1/8`. The smallest change is to name the infinite-dimension bullet in the route and add one sentence saying that for rules with values in a class of measurable classifiers the argument needs no measurable singletons.

## C02 — The forest example of Layer 6 says consistency is "covered by 5.3", and 5.3 says it is not a target

The Example of Layer 6 (line 1214) reads "bootstrap aggregation of response-independent trees is covered by 5.3 for consistency". Section 5.3 (line 1000) now says that consistency of a particular forest is the verification of Stone's three conditions "and is not a target here". The example predates that sentence. Say instead that such forests are local weight estimates in the sense of 5.3, so that Stone's theorem applies once its conditions are verified.

## N01 — The closing section header of `Suggested.lean` has only `#check` lines under it

"Supplier declarations named in the README" heads no declaration; the lines could sit under a plain comment, or the header could go.

## N02 — Three layer titles in `Suggested.lean` differ from the README

Layer 2 ("symmetrization and Rademacher averages"), Layer 3 ("combinatorial capacity and PAC learnability") and Layer 8 ("fairness criteria and distribution shift") against the README's "Rademacher averages", "VC dimension and PAC learnability" and "fairness and distribution shift".

## Questions for the author

- 1.4 says Mohri–Rostamizadeh–Talwalkar's statement of Thm 4.7 "omits the hypothesis" `P(h(X) = 0) = 0`. As I recall, that text fixes a convention for the sign at `0` under which no such hypothesis is needed, so the difference would be one of convention rather than an omission. I could not open the book (the publisher's page refused the request and the file linked from the author's page could not be fetched).
- `tendsto_lintegral_weightEstimate_sub_sq` is stated on an arbitrary metric space with its Borel σ-algebra, while 5.3 writes `‖X_i - X‖`. On a non-separable space the distance need not be measurable on the product. Is a separable (or normed, second-countable) space intended? I did not construct a counterexample.

## Earlier findings

- R01 (false negative control in 3.1): repaired. The Check now uses "`X` uniform on `(-1, 0)` and `Y = true`", where the member with threshold `t` errs with probability `-t`; infimum `0`, not attained.
- R02 (statable headlines absent, docstring silent): repaired. `empiricalRademacherComplexity_le_massart`, `finiteClass_deviation`, `exists_lintegral_classificationError_ge_of_vcDim_eq_top`, `nearestIndex`, `nnRule` and `tendsto_integral_classificationError_nnRule` are stated, and the module docstring lists thirteen groups of unstated bold headlines with what each lacks.
- C01 (Azuma): repaired, 7.3 now cites `ProbabilityTheory.measure_sum_ge_le_of_hasCondSubgaussianMGF`, which elaborates at the pin. C02 (sharpness of 3.5): repaired, majority rule with `n = 3`, `p = 0.6`, error `0.4704`. C03 (ties): repaired, index tie-breaking attributed to the source at §5.1, §6.7 and Ch. 11. C04: repaired. C05: repaired, Thm B.1, p. 267 cited. C06: repaired, the item is dropped. C07: repaired, both docstrings mark the sanity checks. C08: repaired in the scope and in 5.3 (one sentence in the Layer 6 examples remains, C02 above). C09: repaired.
- N01: the four own declarations are gone from the `#check` block (the header remains, N01 above). N02: repaired. N03 (paper locators): not taken, the README says paper results are derived in the routes. N04: repaired, the synopsis is linked.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 ERM inequality (sampled) | chain `R t₀ ≤ Rn t₀ + D ≤ Rn t + ε + D ≤ R t + 2D + ε`; `n = 0` | junk mean `0`; source Lemma 8.2 at p. 126 has the `ε = 0` form | holds; marked sanity check |
| 1.2 Bayes rule, plug-in (sampled) | `η(x) = x`, `η̂ = η + 0.1`; `η ≡ 1/2 ± δ/2` | excess `0.25 − 0.24 = 0.01 ≤ 0.04`; excess `δ`, `C ≥ 2/δ`, bound `≥ 4δ`; Thm 2.1 p. 10, Thm 2.2 p. 16 | holds |
| 1.3 proper losses | `p = (.5,.3,.2)`, `q = (.2,.5,.3)` | `1.25346 = 1.02965 + 0.22381`; Brier `0.09 + 0.04 + 0.01 = 0.14` | holds |
| 1.4 calibration, Zhang (sampled) | hinge, squared hinge at `η = 0.8`; `h ≡ 0`, `η ≡ 1/2`; wrong-sign `u` | gaps `1 − 0.4 = 0.6`, `1 − 0.64 = 0.36`; `c = 1/2` both; tie: `1 − 1/2` vs `0`; `C(η,u) − Φ(0) ≥ (η − ½)(Φ(−u) − Φ(u)) ≥ 0` | holds with tie hypothesis |
| 2.1 complexity, contraction, Massart (sampled) | empty class; `n = 0`; `L = 0` with unbounded class; `{e₁, e₂}`, `n = 2`; `|T| = 1` | `⊥`; `0`; `0 ≤ 0·⊤ = 0`; `1/4 ≤ 0.589`; `0 ≤ 0` | holds |
| 2.2 kernel ball | `n = 1, K = 2, B = 3`; Gaussian, two points; `n = 0` | `3√2` both; `(1.6540 + 1.1244)/4 = 0.6946 ≤ 0.7071`; `0 ≤ 0` | holds |
| 2.3 Rademacher bound | one-member class; `δ/2` split; bounded differences `1/n` | Hoeffding; `√(log(2/δ)/(2n))` per side; three uses give `3√(…)` | holds |
| 2.4 finite classes, hold-out | `t = √(log(2N/δ)/(2l))`; `N = 0`; `n = 0` | `2N e^{−2lt²} = δ`; event empty; bound `2N ≥ 1` | holds |
| 3.1 definitions, Checks | `{h, ¬h}` one point; thresholds `t < 0`, `X ~ U(−1,0)`; finite class | `(1 + 0)/2`; errors `−t`, inf `0` not attained; `2|H|e^{−nε²/2} ≤ δ` at stated `m` | holds |
| 3.2 upper bounds (sampled) | `d = 0`; `n ≥ 2, v ≥ 1`; `n = 0` | one member, error `0`; `log 2 ≤ v log n`; threshold `> 0` excludes `n = 0` | holds; Anthony–Bartlett not read |
| 3.3 lower bounds (sampled) | `n = 0`; three members, `d = 1`; `K` shattered points | point mass gives error `1`; two agree at `y`, differ at `y'`; `log 100 > 1`; `E R ≥ (1 − 1/K)^n/2 > 1/(2e) − δ` | holds; Thm 14.1 p. 235, 14.3 p. 239, 14.5 p. 240 |
| 3.4 fundamental theorem (sampled) | no measurable singletons; `ε = δ = 1/8` | outer probability `≥` discrete mass on separated shattered points; `E R ≤ 1/4 < (1 − n/K)/2` | holds; C01 |
| 3.5 no free lunch | majority rule `n = 3, p = 0.6`; finite `X` | `q = 0.648`, error `0.4704`; `q(1−p) + (1−q)p − ½ = −2(q−½)(p−½)`; Thm 7.1 p. 112 | holds |
| 4.1 margin bound | `u = ρ/2, −ρ`; label signs | ramp `1/2`, `1`; `σ_i y_i` equidistributed, complexity on features | holds |
| 4.2 stability (sampled) | `n = 1, β = M`; two minimizers; non-symmetric rule | `c = 2β + M/n`, deviation `(2nβ + M)√(log(1/δ)/(2n))`; `‖Δ‖ ≤ Gr/(nλ)`; Prop 7 p. 112, Thm 4 p. 113 | holds; Mohri not read |
| 4.3 kernel ridge | `n = 1, K = 1`; `m = 3, n = 100`; expectation form; Sobolev `n = 5, 100` | `y/(1 + 2λ)`; `0.24 = 0.24`; bias² `≤ ‖f − f*‖² + 2λR²`, variance `≤ R²δ²/32`; `0.4937`, `0.4093` | holds |
| 5.1 split conformal (sampled) | `n = 9, α = .1`; `n = 4, α = .25`; `n = 1, α = .25`; `k = n + 1` | `k = 9`, `0.9`; `k = 4`, `0.8`; `k = 2`, `⊤`; `α < 1/(n+1)` so upper bound `> 1` | holds |
| 5.2 Cover–Hart, 1-NN limit (sampled) | `η ≡ 0.2`; `η ∈ {.1,.3}`; `Y ⊥ X`; `d = 0`; atom with ties | `0.2 ≤ 0.32 = 0.32 ≤ 0.4`; `0.30 < 0.32`; `2p(1−p)` every `n`; (3.1) p. 22, Thm 5.1 p. 70, 5.4–5.6 pp. 73–75, 6.4 p. 101 | holds |
| 5.3 Stone | probability weights; bounded `g` | `max w ≤ √(∑w²)`, `∑w² ≤ max w`; monotone convergence | holds |
| 5.4 `k`-means | `k = 0`; `d = 0`; `m_k = m_{k−1}` | both sets empty; `{pt}`; second minimizer contradicts uniqueness | holds |
| 6.1 pruning (sampled) | `node 5 (leaf 2) (leaf 1)`, `α = 1, 2`; negative costs; nesting | `5 < 6`; `7 = 7`; `opt_{α'} ≥ opt_α + (α' − α)` per child, two children | holds; source not read |
| 6.2 impurity | Gini, misclassification at `(.9,.1)`, `(.6,.4)` | `0.375 − 0.33 = 0.045`; `0.25 − 0.25 = 0` | holds |
| 6.3 boosting descent (sampled) | `r = (1,2)`, `h = (1,.3)`, `ν = ½`; `r 0 = 0`, `γ > 1` | `cos = 1.6/2.3345 = 0.6854`, factor `0.6477`; `0 ≤ 0` | holds |
| 6.4 ensemble variance | `B = 2, 5`, `σ² = 2`, `ρ = .3` | `1.3`, `0.88` | holds |
| 6.5 AdaBoost | `T = 0`; `ε = (.25,.1667,.1)`; `γ = .3, ρ = .29`; `ρ = γ → 0` | `1 ≤ 1`; `0.866·0.745·0.6 = 0.387 ≤ 0.513`; `u = e^{−0.0221} = 0.978`; `log u ≈ −(4/3)γ⁴` | holds |
| 7.1 definitions, post-processing, groups (sampled) | `k = 0`; `δ ≥ 1`; `ε < 0` | `D = D'`; trivial; chain still valid; Def 2.4 p. 17, Prop 2.1 p. 19, Thm 2.2 p. 20 | holds |
| 7.2 mechanisms (sampled) | Gaussian `ε = .5, δ = 10⁻³`; `ε = 10, δ = .1`; exponential on 3 outputs; `|R| = 1` | `c = 3.7765`, `δ(ε) = 1.035·10⁻⁴ − 1.003·10⁻⁴ ≈ 3·10⁻⁶`; `0.4909 − 0.0853 = 0.406 > 0.1`; ratio `1.789 ≤ e`; Thm 3.6 p. 32, 3.10 p. 38, 3.11 p. 39, 3.22 p. 53 | holds |
| 7.3 basic composition | `min(1, e^{ε₂}g + δ₂)` | `≤ e^{ε₁+ε₂}∫g + δ₁ + δ₂`; Thm 3.16 p. 43, Thm B.1 p. 267 (equal parameters there) | holds |
| 7.4 randomized response, contraction | `ε = .5, 1`, `δ₁` vs `δ₋₁`; `n = 1, 2` at `ε = 1` | `2ρε = 0.245, 0.924 ≤ 1.68, 11.8`; ratios `4`, `4.683`; `tvDist ∈ [0, 2]` at the pin | holds |
| 7.5 minimax rates | `n = 10, ε = 1`; `n = 100, ε = .1`; `n = 1, ε = 1` | `0.18`; `0.09`; `min(1, 2) = 1`; smaller mechanism class only raises the infimum | holds |
| 7.6 sparse vector | `k = 5, β = .1`; `k = 1`; "no halt" outcome | `α = 36.84`; `23.97`; `(β/2k)² + β/2 ≤ β`; shift `t ↦ t + 1` gives `e^{ε/2}`; Thm 3.23 p. 57, 3.24 p. 59 | holds |
| 8.1 fairness | `S = Y`; `S = A`, rates `.8, .4`; `S ⊥ (A,Y)` | `g = id`; sufficiency only; `ν₀ + p_a(ν₁ − ν₀)` equal in `a` forces `ν₁ = ν₀` | holds |
| 8.2 shift, adaptation, weights | thresholds `½`, `−1` at `δ₀`, `δ₁`; `B = 1, n = 100, δ = .05`; empty `H` | divergence `2`; `0.2716 + 0.0246 = 0.296`; `h ∈ H` excludes it | holds; sources not read |
| 8.3 label shift (sampled) | `K = 2`, `pS = (.5,.5)`, `pT = (.8,.2)`; non-integrable `q` | `C = [[.45,.1],[.05,.4]]`, `Cw = (0.76, 0.24)`; `B = univ` forces integrability | holds; Lipton–Wang–Smola Lemma 1 read |

- Source locators checked against the text: 38 (Devroye–Györfi–Lugosi 20, Dwork–Roth 14, Hardt–Recht 3, Lipton–Wang–Smola 1), all at the stated printed pages.
- Library declarations opened at the pin: Mathlib `tvDist` (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean` line 62, values in `[0, 2]`), `variance_sum` (`Mathlib/Probability/Moments/Variance.lean` line 295); Tau Ceti McDiarmid lines 351 and 383, Bernstein line 173, `orderStatistic` line 53, `empiricalMeasure` line 354, Laplace conventions; the 38 `#check` lines of the file all resolve.
- Cross-roadmap citations resolved on main: 10 (Asymptotic 3.2, 3.3, 3.5; Nonparametric 1.4, 2.2, 5.6, 5.8; Foundations 8.5, 9.1; RegretMinimizationAndEquilibria 1.2); the two local copies agree with the owner's definitions character for character.
- Elaboration: `Suggested.lean` gives 49 `sorry` warnings and nothing else; no `set_option`, no sorry'd data. `#check @name` for all 97 declarations elaborated on a copy; every binder is in the declaration's own signature and the section variables hold only types and `MeasurableSpace X`; nothing changed.
- One-tactic probes on a copy: `variance_ensembleAverage` by `simp`, `brierScore_sub_eq` by `grind`, the last Cover–Hart inequality by `nlinarith` with nonnegativity: none closes. The two statements that do close in one tactic are marked as sanity checks in their docstrings.
- Dependency check: `depcheck: 200 roadmaps, 2190 edges, 0 problem(s)`; no change outside the roadmap folder.
- Automatic checks: one failed (a section header with no declaration under it), kept as N01.
- Pull-request text read against the head: 49 admitted theorems, eight layers, suppliers and ownership as stated; nothing to correct.

Overlap check: read KernelsAndSpectralMethods, MultiArmedBandits, MathematicalStatisticsHigherOrderAndResampling, RandomizedSmoothing, TopologicalDataAnalysis, MathematicalStatisticsNonparametric, MathematicalStatisticsAsymptotic, MathematicalStatisticsHighDimensional; kernel ridge regression and its risk bounds are handed to this roadmap by KernelsAndSpectralMethods and owned here; VC theory of set families stays with Asymptotic 3.5, regression consistency and the representer theorem with Nonparametric 5.6 and 5.8; Hedge with RegretMinimizationAndEquilibria 1.2; nothing has two owners. Ownership against open pull requests was checked by searching their heads for the objects (Rademacher complexity, PAC learnability, differential privacy, conformal prediction, AdaBoost, `k`-means, label and covariate shift).

Source independence: 16 passages compared with 4 sources, none shared beyond formulas and statements of a dozen words; largest share Mohri–Rostamizadeh–Talwalkar, 23 of about 107 locators, whose text could not be read; contents compared through the chapter numbers cited (Layer 1 ↔ Ch. 4; Layer 2 ↔ Ch. 3, 5, 6, 7; Layer 3 ↔ Ch. 2, 3; Layer 4 ↔ Ch. 5, 14; Layer 6 ↔ Ch. 7) and against the read contents of Devroye–Györfi–Lugosi (Layer 1 ↔ Ch. 2, 8; Layer 3 ↔ Ch. 7, 14; Layer 5 ↔ Ch. 3, 5, 6) and Dwork–Roth: independent.

Research link: The headline targets are the distribution-free learning results that the README's paper sources prove or build on: Zhang (2004) on surrogate consistency, Duchi–Jordan–Wainwright (2013) on local-privacy minimax rates, Ben-David et al. (2010) on domain adaptation, Lei et al. (2018) on conformal inference, Lipton–Wang–Smola (2018) on label shift; rests on the README and on the last as read.

## Not verifiable

- Mohri–Rostamizadeh–Talwalkar (sampled 1.4, 2.1, 3.2, 3.3, 4.2): the publisher's page refused the request and the file linked from the author's page could not be fetched.
- Anthony–Bartlett (sampled 3.2, 3.3, 3.4), Vapnik, Schölkopf–Smola, Boucheron–Lugosi–Massart, Koltchinskii (sampled 2.1, 3.2, 3.4): paywalled; no legal copy found.
- Breiman–Friedman–Olshen–Stone (sampled 6.1): paywalled.
- Quiñonero-Candela et al. (sampled 8.3): paywalled.
- Vovk–Gammerman–Shafer 2005 (sampled 5.1): paywalled; the coverage statement was recomputed, and Lei et al. was read in the previous round.
- Wainwright, Cucker–Zhou, Linder in Györfi (ed.), Pollard 1981, Ben-David et al. 2010, Zhang 2004: not in the sample and not fetched.

## Source issues

- none

## For the human reviewers

- **Not tested.** The source with the largest share of locators (Mohri–Rostamizadeh–Talwalkar, 23 of about 107) could not be read: its wording was not compared, and its arrangement only through the chapter numbers the README cites.
- **Licence.** The README (section "Prior formalization") and the description name an earlier formalization by the author (lean-CKSD, `CKSD/Learning/`, Apache 2.0) and say no code is copied; `Suggested.lean` was not compared with that repository.
