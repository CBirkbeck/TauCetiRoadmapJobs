# Review of PACBayesBounds (pull request #2754 at ad13116)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed on its degenerate cases (`n = 0`, `δ = 0`, `δ > 1`, `β = 0`, risks in `{0, 1}`, non-integrable integrands, the junk values of `klBin`), every source locator was read at its place in the three sources, every cited library declaration was opened at the pins, and every number printed in a Check was recomputed; all agree. There are three small corrections (two about proof routes, one about a *Needs:* line) and one format note, none blocking. Two facts are left for the human reviewers (the status of one source, and a numerical example shared with a source).

## C01 — The route of 1.2 truncates where no truncation is needed, and the limit it names is not monotone

An implementer following the route of 1.2 (line 120–122) would build a two-sided truncation `max(−K, min(f, K))` and pass to the limit "by monotone convergence"; that family is not monotone in `K`, so the step as written needs dominated convergence, or two successive monotone limits.

The step can be dropped. `TauCeti.ofReal_integral_sub_log_integral_exp_le_klDiv` (`TauCeti/InformationTheory/KullbackLeibler/Variational.lean`, line 202) asks only that `f(·, ω)` be `ρ`-integrable and `exp f(·, ω)` be `π`-integrable. Off the Markov set `F(ω) < 1/δ < ∞`, so the second holds; and where the first fails the Bochner integral is `0`, the case the route already treats. The smallest change: replace "applied to the truncations … by monotone convergence" by "applied to `f(·, ω)` where it is `ρ`-integrable (`exp f(·, ω)` is `π`-integrable because `F(ω) < ∞`)".

## C02 — The *Needs:* line of 2.3 omits the Stirling inputs its route uses

The route of 2.3 (lines 214–216) bounds `ξ(n)` by `e^(1/(12n)) √(πn/2) + 2` "through Stirling's formula", which needs a lower bound for `k!` and `(n − k)!` and an upper bound for `n!`; the *Needs:* line (lines 227–228) lists neither, so an implementer cannot tell whether these are at the pin. They are, in part: `Stirling.le_factorial_stirling` (`Mathlib/Analysis/SpecialFunctions/Stirling.lean`, line 248) is the lower bound; the upper bound `n! ≤ √(2πn)(n/e)ⁿ e^(1/(12n))` is not a named declaration, but follows by telescoping `Stirling.log_stirlingSeq_sdiff_le` (line 103, increments at most `1/(12 n (n+1))`) against `Stirling.tendsto_stirlingSeq_sqrt_pi` (line 211). Add these three names to the *Needs:* line and to the Mathlib contracts, with the words "the upper bound is proved here from them".

## C03 — The Check "never weaker than 3.1" argues only for `q ≤ 1`, and is applied to a `q` that can exceed `1`

In the second Check of 3.2 (lines 296–299) the inequality `Φₐ⁻¹(q) ≤ q + a/8` is derived "for `q ≤ 1`", then used at `q = r(ρ) + (KL(ρ‖π) + log(1/δ))/β`, which is larger than `1` whenever the bound of 3.1 is vacuous. The conclusion is still true: `q ↦ (1 − e^(−aq))/(1 − e^(−a))` is concave with value `1` and slope `a/(e^a − 1) < 1` at `q = 1`, so it is at most `q` for `q ≥ 1` (for `a = 1`, `q = 2`: `1.368 ≤ 2.125`). Add that clause, or restrict the Check to `q ≤ 1`.

## N01 — Two phrases of the scope section date the text

"(an open roadmap, not on main)", twice in Scope and ownership (lines 506 and 511), describes the state of two other roadmaps on the day of writing and will be wrong once they merge. "StatisticalLearningTheory lists PAC-Bayes bounds as outside its scope" and "OnlineConvexOptimization 3.2" say what is needed without it.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 risk, empirical risk | `ℓ θ z = z`, Bernoulli `p`, sample `(1,0,1)`; `n = 0` | risk `p`; empirical `2/3`; `n = 0` gives `0/0 = 0` against risk up to `1` | agrees with Checks; alquier2021 lines 157–163 | none |
| 1.2 change of measure | `δ = 0`; `δ > 1`; `f(·,ω)` not `ρ`-integrable; `f ≡ 1`; two hypotheses `n=10, β=8, δ=1/2` | `δ=0`: `log(1/0)=0`, fails on mass `1/2`; `δ>1`: bound `ofReal δ ≥ 1`; Bochner `0 ≤ KL+log(1/δ)` for `δ ≤ 1`; `cosh 2.4 = 5.557 > 4.451 > cosh 1.6 = 2.577`, `112/1024` | true; `hδ` needed; alquier2021 lines 541–613, catoni2007 lines 707–763 | C01 (route only) |
| 2.1 Hoeffding moment | `n=1`, fair coin, `β=2`; parameter arithmetic | `cosh 1 = 1.5431 ≤ e^(1/2) = 1.6487`; `(n/4)(β/n)²/2 = β²/(8n)` | true; alquier2021 line 187–197 | none |
| 2.2 Catoni moment | `g ≡ 1/2`, `n=1`, `β=1`; Bernoulli; `Φₐ(0), Φₐ(1)` | `Φ₁(1/2)=0.379885`, `exp(−0.120115)=0.88682`; Bernoulli gives `1`; `Φₐ(0)=0, Φₐ(1)=1` | true; catoni2007 lines 576–615 | none |
| 2.3 Maurer | `n=0`; `n=1..8` exact; `μ ∈ {0,1}`; Maurer's bound at `n=7, 8` | `ξ = 2, 5/2, 26/9, 103/32, 2194/625, 1223/324, 472730/117649, 556403/131072`; all `≤ 2√n`; `5.3557 > 5.2915` at 7, `5.5820 ≤ 5.6569` at 8; `klBin μ μ = 0`; `n=0`: `1 > 0` | true for `n ≥ 1`; `hn` needed; maurer2004 lines 21–28, 103–123, 157–158, 339–344 | C02 (Needs only) |
| 3.1 Catoni bound | `n=0`; `β=0`; `δ=1,n=1`; `n=100, δ=0.05`; exact binomial grid | `1 ≤ 0.0693` false; `R ≤ r` fails w.p. `1/2`; `β=48.955`, slack `0.12239`; grid maximum `0.975 δ` at `(n,R,β,δ)=(1,1/40,0.1,1)` | true; alquier2021 lines 534–537, 1662–1665 | none |
| 3.2 Catoni Bernoulli bound | `n=1000, δ=0.01, r=0.2`; `q > 1`; grid | `β=234` minimises over integers: `0.240159`; 3.1 gives `0.248930`, optimum `0.247985`; `q>1` gives right side `>1`; grid max `0.9941 δ` | true; catoni2007 lines 636–647, 1556–1561; alquier2021 lines 1308–1318 | C03 (Check wording) |
| 3.3 Seeger–Maurer | `n=0`; `n=1, r=0`; `R(ρ) ∈ {0,1}`; `n=1000`; two hypotheses `n=20` | `klBin 0 (1/2)=log 2 > 0`; `R ≤ 1−δ/2`; junk `(1−a)log(1−a), a log a ≤ 0`; rhs `0.0087522`, `R ≤ 0.256230`; `e^{20 kl(.15‖.5)}=223.4 > 178.9 > 47.2`, `1351/524288`; grid max `0.5611 δ` | true; maurer2004 lines 430–435; alquier2021 lines 1335–1338 | none |
| 3.4 McAllester | `n=1000`; Pinsker at `(0.2, 0.3)`; `R(ρ)=1`; grid | `0.266152`; `0.025732 ≥ 0.02`; `r(ρ)=1` off a null set; grid max `0.4 δ` | true; alquier2021 lines 1271–1279, 1352–1354 | none |
| 4.1 Gibbs minimiser | two points, `β = log 3`; `β=0`; `n=0` (no `hn` in Lean) | `G=(3/4,1/4)`, `KL=0.13081`, objective `0.36907 = −log(2/3)/log 3`; point mass `0.63093`; `β=0`: `0 < 1/2`; `n=0`: `G=π`, value `0`, others `KL/β > 0` | true, also at `n=0`; alquier2021 lines 645–652; catoni2007 lines 707–717 | none |
| 4.2 oracle in probability | sum of the two uses of 3.1 at `δ/2`; `n=0`, `β=40` and `4` | `β/(8n)+β/(8n)=β/(4n)`, `2 KL/β + 2 log(2/δ)/β`; `1/2 ≤ 0.104` false, `1/2 ≤ 1.04` true | true; alquier2021 lines 1648–1653 | none |
| 4.3 oracle in expectation | `n=0`, two points, `β=4`; route inequality chain | `1/2 ≤ 0.173` false at `n=0`; chain gives `β/(8n) + KL/β` | true; alquier2021 lines 1618–1621 | none |
| Conventions: `klBin` junk values | `b=0`, `b=1`, `a=b∈{0,1}` | `(1−a)log(1−a) ≤ 0`; `a log a ≤ 0`; `0` | as stated; agrees with MathematicalStatisticsNonparametric 1.3 | none |
| Scope: OnlineConvexOptimization 3.2 as a case of 4.1 | uniform prior on finite `Θ` | `∑ q log q + η L·q = β(r(q) + KL(q‖unif)/β) − log|Θ|` | as stated | N01 (wording) |

- Source locators checked against the text: 29 (alquier2021 17, catoni2007 7, maurer2004 5); all found at the stated theorem and page.
- Library declarations opened at the pins: 22 Mathlib (among them `ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc`, `Mathlib/Probability/Moments/SubGaussian.lean` line 851; `Monotone.measure_iUnion`, `Mathlib/MeasureTheory/Measure/Continuity.lean` line 74, no measurability hypothesis; `MeasureTheory.measurePreserving_eval`, `Mathlib/MeasureTheory/Constructions/Pi.lean` line 402) and 3 Tau Ceti (`Variational.lean` line 202, `Tilted.lean` line 72, `Pinsker.lean` line 47); every name and stated hypothesis agrees with the supplier contracts.
- Cross-roadmap citations resolved: MathematicalStatisticsNonparametric 1.3 on main (`klBin`, `klDiv_bernoulliMeasure`, `convexOn_klBin` on `[0,1] × (0,1)`), 3 of 3; the copied `klBin` is identical to main's definition.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/PACBayesBounds/Suggested.lean`: 9 `sorry` warnings and nothing else. All 13 elaborated types compared with the README statements: they agree; `empiricalRisk` uses neither measurable space, so no binder is lost.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: none of the 9 theorems closes; no padding.
- Headlines: change of measure, Maurer's inequality, the two Catoni bounds, Seeger–Maurer, McAllester, the Gibbs minimiser and the two oracle inequalities are all stated in Lean; none is declared not statable.
- Automatic checks: all passed.

Overlap check: read StatisticalLearningTheory, OnlineConvexOptimization, RenyiDivergenceAndPrivacy, LargeDeviations, MathematicalStatisticsNonparametric, MathematicalStatisticsAsymptotic, MathematicalStatisticsHighDimensional; `klBin` and its two facts are owned by MathematicalStatisticsNonparametric 1.3 and cited; the Donsker–Varadhan formula is Tau Ceti's (LargeDeviations cites it too); StatisticalLearningTheory excludes PAC-Bayes bounds and has its own one-line sample mean `empiricalMean`, no theorem shared; OnlineConvexOptimization 3.2 is the finite, uniform-prior case of 4.1 and stays there; nothing else shared.

Source independence: 17 passages compared with 3 sources (12 sampled statements and 5 passages of prose: the bad-event convention, the routes of 1.2, 2.3 and 4.2, the docstring of 3.3), none shared beyond formulas and phrases of six words; largest share alquier2021, 17 of 29 locators; contents compared with alquier2021: independent (Layer 3 draws on its §§2.1.1, 3.2.2, 3.2.3, 3.2.1 in that order, Layer 4 on §§2.1.2, 4.1.2, 4.1.1, and Layer 2 has no counterpart section).

Research link: The headline bounds are those of Catoni (2007), Maurer (2004) and McAllester, in the form surveyed by Alquier (2024), whose §3.3 reports their use for non-vacuous generalization bounds for deep networks (Dziugaite and Roy, 2017); rests on alquier2021 lines 58–59 and 1325–1338 and the README's references.

## Not verifiable

- none: the three cited sources were read in full at their locators (arXiv versions, as the README cites them).

## Source issues

- **Misprint** in alquier2021 at the proof of Theorem 4.2, p. 36: the source says the union bound combines (4.1) with (4.1); it should be (4.1) with (4.2); affects nothing.
- **Gap** in alquier2021 at Theorem 3.3, p. 28: the source says the bound holds with no restriction on the sample size, citing Maurer's Theorem 5; it should carry Maurer's `n ≥ 8` or a proof for `n ≤ 7`; affects a stated result.
- **Misprint** in maurer2004 at §3, p. 7: the source says the empirical mean of a hypothesis is a sum over `m` terms divided by `m`; it should be `n`, the sample size used everywhere else; affects nothing.

## For the human reviewers

- **Scope.** Subject is statistical learning theory (`math.ST`). Sources: an IMS monograph (catoni2007), a survey published in Foundations and Trends in Machine Learning (alquier2021), and maurer2004, an arXiv note in `cs.LG` with no journal reference in the README.
- **Licence.** The first Check of 3.2 (README line 293) uses the numerical instance `n = 1000`, `δ = 0.01`, `r = 0.2`, `β = 234` of catoni2007 line 646–647, cited and recomputed; one instance, no table.
