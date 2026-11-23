# Review of ReinforcementLearningConvergence (pull request #3016 at bb19b18)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or proof route was found false, and every stated theorem survived recomputation at degenerate parameters and against the sources and suppliers. There are two small corrections (two sentences of commentary comparing the roadmap's bounds with the sources') and one format note, none blocking. The locators into Singh–Jaakkola–Littman–Szepesvári could be checked only against the 1998 preprint, whose numbering differs; that is a question for the author and a note for the human reviewers.

## C01 — The comparison with Mei et al.'s Theorem 4 is off by one step in their indexing

In 4.2 (README line 551) the text says that with `c_t` the bound holds for every `t ≥ 1` "and theirs follows from it because `c ≤ c_t`", and then notes that their iterates are indexed from `1`. A reader who carries out the reindexing does not get their statement: their `θ_t` is the iterate after `t − 1` steps, so 4.2 with `c ≤ c_{t−1}` gives `K/(c²(t − 1))` for it (and nothing at their `t = 1`), where Theorem 4 (Mei et al., its text line 2241, eq. (334)) has `K/(c² t)`. At their `t = 2` the two differ by a factor `2`.

The route of 4.2 does give theirs with one more line: `δ_0 ≤ 1/(1 − γ)` and `κ ≤ η(1 − γ)²/2 = (1 − γ)⁵/16 ≤ 1 − γ` (because `Σ_s d^d_μ s = Σ_s μ s = 1` forces `‖d^d_μ/μ‖_∞ ≥ 1`), so `1/δ_0 ≥ κ` and step (4) yields `δ_t ≤ 1/(κ(t + 1))`. Either say that their form follows "with `t − 1` for `t`", or add that line and say `δ_t ≤ 1/(κ(t + 1))` is what gives theirs.

## C02 — The sentence on Bhandari–Russo–Singal's proof does not say what the source does

In 2.2 (README lines 291–292) the text says their proof "uses the bound on `E ‖g_t(θ)‖²` that the pointwise normalization `‖φ s‖ ≤ 1` gives". In arXiv:1806.02450v1, `σ` is the first moment `E ‖g_t(θ⋆)‖` (its text lines 604 and 620), Lemma 5 bounds the first moment `E ‖g_t(θ)‖` by Cauchy–Schwarz with the averaged normalization (lines 620–636), and (15) is then obtained by squaring that bound (lines 637–639). So "`4σ²` in place of `2σ²`" compares two different quantities called `σ²`, and the reader cannot tell that the pointwise normalization is the roadmap's repair, not the source's hypothesis.

Suggested wording: "their (15), p. 14, is a second-moment bound deduced from the first-moment bound of their Lemma 5, with `σ = E ‖g_t(θ⋆)‖`; a second-moment bound of this shape needs the pointwise normalization `‖φ s‖ ≤ 1` and `σ² = E ‖g_t(θ⋆)‖²`, which are the ones used here."

## N01 — A pull-request number in the README

In Scope and ownership (README lines 614–615) StatisticalLearningTheory is cited with "pull request #2515" and a link. Cite it by name and section only ("StatisticalLearningTheory, *Beyond this roadmap*"), as the other suppliers are.

## Questions for the author

- Which copy of Singh–Jaakkola–Littman–Szepesvári has "Appendix B, Lemma 3 and Lemma 4, pp. 302–303; B.1–B.2, pp. 303–304"? The copy on Szepesvári's page (the 1998 preprint, 17 pages) has this material as Appendix A, Observation 1 and A.1–A.2 on its pp. 14–15, with no Lemma 3 or 4; the published article is paywalled. If the References named the URL of the copy used, the locators of 3.1 could be checked.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 contraction, `weightedSq_tdOperator_sub_le` | three-state chain, `d = (8/15, 1/5, 4/15)`, 9 pairs `(γ, λ)`, 125×14 vector pairs; uniform weights, `v = e_1` | `dP = d`; LHS ≤ `κ²`·RHS in all; `κ(9/10, 1/2) = 9/11`; `T_λ V = V`; uniform: `5/12 > 1/3` | holds; stationarity needed | none |
| 1.1 `projectedBellman` | same chain, `Φ` of rank 1, 2 and rank-deficient `((1,2),(1,2),(0,0))` | solvable in all 27 cases; two solutions (free variable 0, 1) give equal `Φθ`; `(1−κ²)‖Φθ−V‖² ≤` least-squares distance; rank of `A_λ` = 1, 2, 1 | holds | none |
| 1.1 factor identity | algebra | `1 − κ² = (1−γ)(1+γ−2λγ)/(1−γλ)²`; `N_λ(1−γP) = 1 − γ(1−λ)N_λP` | agrees with footnote 1 | none |
| 1.2 `tdMatrix_quadratic_ge` | same chain, three `Φ`, `x ∈ {−3..3}^k`; one state; `γ = 0`, `λ = 1` | `xᵀA x ≥ (1−κ)‖Φx‖²` in all; one state `A = (1−γ)/(1−γλ)φ²` (equality); `γ=0` or `λ=1`: `A = ΦᵀDΦ` | holds | none |
| 1.2 off-policy Check | two states, rows `(1/20, 19/20)`, `φ = (1, 2)`, `γ = 9/10` | `A_q = −53/400`; stationary `1711/4000`; `‖Pφ‖²_q = 1521/400 > 5/2` | Check true | none |
| 2.1 `linearTD0_ae_tendsto` | recursion re-derived; `α = 1/2`, `±1` rewards; `d = (0,1)`; `α = 0` | coefficient `2α²B⁴(1+γ)²`; `|θ_{t+1}| ≥ 1/2 − |θ_t|/2`; `A₀ = diag(0, 1−γ)` singular | holds; three controls true | none |
| 2.2 `linearTD0_average_weightedSq_le` | README example, `T = 256`, `γ = 1/2`; `γ = 0`, `T = 64`; rows `(0,1),(1/2,1/2)`, `γ = 3/4`, `T = 1024` (exact moments) | `A₀ = ((3/10,2/15),(2/15,4/15))`, `θ⋆ = (8/7,−11/7)`, `σ² = 32/49`; mean `0.2189 ≤ 0.6173`; `0.3075 ≤ 0.6738`; `0.2144 ≤ 0.9236`; one-step inequality at every step | holds | none |
| 2.2 with `d ≥ 0` only, `P` signed on `d s = 0` rows | algebra | `E ξ'² = ‖Φe‖²_{dP} = ‖Φe‖²_D`; rows with `d s > 0` have `P s s' ≥ 0` from the law | no missing hypothesis | none |
| 2.2 `linearTD0_integral_sq_tendsto` | threshold `α ≤ (1−γ)/(2B²(1+γ)²)` | `−2α(1−γ)+2α²B²(1+γ)² ≤ −α(1−γ)`; `u_{t+1}−ε ≤ (1−cα)(u_t−ε)` | holds | none |
| 2.3 CLT | tabular, `γ = 0`; `α = c/(t+1)`; summable steps | `A₀ = D`, covariance `diag(Var/d s)`; ratio `(t+1)/(c(t+2)) → 1/c ≠ 0`; summable `α` forces `log α_t` convergent | holds; sign `A₀⁻¹Σζ − A₀⁻¹Ση` checked | none |
| 3.1 `ae_frequently_eq_of_explore` | one action, absorbing state; `c = 0` policy; `m = 0` | bound forces `c ≤ 1/|A|`; visit terms `≥ c/2, c/3, …` diverge; absorbing chain: state `0` once | holds; controls true | none |
| 3.1 Q-learning consequence | hypotheses of MarkovDecisionProcesses 6.3 one by one | `α ∈ [0,1]` adapted; `Σα² ≤ π²/6`; `C = rewardBound²`; conditional law `trans s a` | applies | none |
| 4.1 `lipschitzSmoothWith_objective_softmax` | `V''` expansion; logistic bandit; `μ → 2μ`; `A` empty | `8γ²+10γ(1−γ)+3(1−γ)² = γ²+4γ+3 ≤ 8`; `2·√3/18 = 1/(3√3) < 8`; empty `A`: objective `0` | holds | none |
| 4.2 `objective_sub_le_softmaxAscent` | constants; one action; `γ = 0`, one state | `1/κ = 16|S|‖·‖²/(c_t²(1−γ)⁵)`; times `‖1/μ‖/(1−γ)`; one action: LHS `0`; bandit: `16/(c_t² t)` | holds | none |
| 4.2 against Mei Theorem 4 (C01) | their index `t = 2` | roadmap: `K/(c²·1)`; theirs: `K/(c²·2)`; with `1/δ_0 ≥ κ`: `K/(c²·2)` | remark imprecise | C01 |
| 2.2 against Bhandari–Russo–Singal (C02) | their Lemma 5 and (15) | their `σ = E‖g‖`; roadmap `σ² = E‖g‖²`; (15) squares a first-moment bound | remark unclear | C02 |
| Copied definitions (20) | byte comparison with owners | all 20 bodies found verbatim in MarkovDecisionProcesses, MarkovChainsAndRenewal, FirstOrderOptimization (main), PolicyGradientMethods, StochasticApproximationAveraging (heads) | verbatim | none |

- Source locators checked against the text: 12 in Tsitsiklis–Van Roy (pages 679–686, Lemmas 1, 4–6, 9, Theorems 1–3, footnote 1, Section IX), 8 in Bhandari–Russo–Singal v1, 12 in Mei et al. v3; all at the stated place. The 5 into Singh et al. are in "Not verifiable".
- Library declarations opened at the pin: 20 (all those under "From Mathlib" and "From Tau Ceti", including `TauCeti.posSemidef_covMatrix` at `TauCeti/Probability/Moments/Covariance.lean:119` and `map_affine_multivariateGaussian` at `TauCeti/Probability/Distributions/Gaussian/Affine.lean:73`); all exist.
- Cross-roadmap citations resolved: 17 declarations and sections in six suppliers (four on main, two at their open heads); all exist with the hypotheses the README lists.
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: 10 `sorry` warnings and nothing else. `#check @name` on the theorems: no hypothesis or instance lost (the binders reported as dropped are decidability and nonemptiness instances on definitions, as in the owners' files).
- One-tactic probe (`simp`, `rfl`, `infer_instance`, `aesop`) on all 10 theorems: none closes. No padding.
- Headline theorems: the 10 of the README (1.1 ×2, 1.2, 2.1, 2.2 ×2, 2.3, 3.1, 4.1, 4.2) are all stated.
- Pull-request text read against the head: the counts (10 theorems, 27 definitions, 20 copied) and the supplier list agree with the files.

Overlap check: read PolicyGradientMethods, StochasticApproximationAveraging, MultiArmedBandits, MartingaleCentralLimitTheorem, HypergradientsAndBilevelOptimization, MarkovDecisionProcesses, FirstOrderOptimization, MathematicalStatisticsSemiparametric; nothing shared (PolicyGradientMethods leaves the softmax gradient-ascent rate out of scope, StochasticApproximationAveraging leaves multiplicative noise out, MarkovDecisionProcesses leaves function approximation out; StatisticalLearningTheory lists linear temporal differences only under "Beyond this roadmap").

Source independence: 8 passages compared with 4 sources, none shared; largest share Tsitsiklis–Van Roy and Mei et al., about 12 each of about 37 locators; contents compared with Tsitsiklis–Van Roy (Sections I–XI): independent. The published text of Singh et al. could not be read; the comparison used its preprint.

Research link: Layers 1–2 state and sharpen results of Tsitsiklis–Van Roy 1997 and Bhandari–Russo–Singal 2018 on linear temporal-difference learning; Layer 3 the exploration lemma of Singh–Jaakkola–Littman–Szepesvári 2000; Layer 4 Lemma 7 and Theorem 4 of Mei–Xiao–Szepesvári–Schuurmans 2020. Rests on the README's citations and the four texts read.

## Not verifiable

- 3.1, the locators "Appendix B, Lemmas 3 and 4, pp. 302–303; B.1–B.2, pp. 303–304; p. 290" of Singh–Jaakkola–Littman–Szepesvári: the published article is paywalled; the copy read is the 1998 preprint on Szepesvári's page, which supports the content (communicating MDPs, the `c/i` lower bound per visit, `ε = c/n_t(s)`) with another numbering.
- 1.1, the formula of footnote 1 of Tsitsiklis–Van Roy: the extraction keeps only glyph codes at that line; their pattern matches `(1 − λα)/√((1 − α)(1 + α − 2λα))`, and the footnote's place (p. 679) is confirmed.
- Polyak–Juditsky 1992, Bradtke–Barto 1996 and Agarwal et al. 2021 were not opened; the README cites them for attribution only.

## Source issues

- **Gap** in Bhandari–Russo–Singal, arXiv:1806.02450v1, at (15), p. 14: the source says a second-moment bound on the update follows by squaring the first-moment bound of Lemma 5; it should be proved directly, with pointwise feature bound and second-moment `σ²`; affects the proof.
- **Misprint** in Bhandari–Russo–Singal, arXiv:1806.02450v1, at Theorem 2(a), p. 14: the source says the averaged iterate runs over indices `1` to `T`; it should be `0` to `T − 1`, as in its Section 6.1 and the proof on p. 15; affects nothing.

## For the human reviewers

- **Licence / not tested.** The locators of 3.1 point into the published Machine Learning article of Singh et al., which was not readable; only the 1998 preprint on a coauthor's page was read (see "Not verifiable").
