# Review of SequentialAnalysis (pull request #3001 at a6d0f09)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and worked value was recomputed (Wald's two identities, the exit-time tail, the exponential identity, the likelihood ratio identity, termination, the threshold inequalities and both sample-size bounds, each at its degenerate parameters) and all agree with the text and with `Suggested.lean`, which elaborates with `sorry` as its only warning. There are two format notes and no small correction. Left for a human: the locators into Ferguson and into Polyanskiy–Wu could not be read through a legal channel here, so the citations of Layer 3 and of the Checks of 1.1 are unverified.

## N01 — Two Radon–Nikodym declarations are listed under the wrong Mathlib file

In "From Mathlib" (README line 544–546), `Measure.rnDeriv` and `Measure.rnDeriv_lt_top` are attributed to `Mathlib/MeasureTheory/Measure/Decomposition/RadonNikodym.lean`; at the pin both are in `Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean` (lines 80 and 384). `withDensity_rnDeriv_eq` (line 58) and `inv_rnDeriv` (line 286) are in `RadonNikodym.lean` as stated. Moving the two names to the `Lebesgue.lean` group, next to `rnDeriv_eq_zero`, would fix it.

## N02 — The page range of the converse differs between the README and the Lean docstring

3.4 cites the converse part of the proof of Polyanskiy–Wu, Theorem 16.4, at pp. 323–324 (README line 395); the docstring of `ofReal_klBin_le_lintegral_mul_klDiv` gives p. 323 (`Suggested.lean` line 190). One of the two would be used in both places.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 `wald_equation` | Bernoulli `p=1/2`, `τ` = first `Sₙ=2`; fair ±1, `τ` = first passage to 1; `τ=0`; `ℱ i=σ(X 0..X i)`, `τ=1{X 0=1}` | `E[τ]=r/p=4`; LHS 1 vs RHS `(∞).toReal·0=0`; 0=0; LHS 1/2 vs RHS 0 with independence hypothesis failing | true; each hypothesis needed |
| 1.2 `wald_second_identity` | fair walk, exit from (−2,3); `X=1`, `τ=2`; first passage to 1 | exit probs 3/5, 2/5; `E[S_τ²]=12/5+18/5=6=E[τ]=2·3`; centred 0=0, uncentred 4 vs 2; 1 vs 0 | true |
| 2.1 `exitTime` | `0∉(a,b)`; `b≤a`; `X=0`, `a<0<b` | `S₀=0` already outside, so `τ=0`; `τ=⊤` | definition is the intended one |
| 2.1 `exists_measureReal_lt_exitTime_le` | fair walk on (−2,2), `n=2k` and `2k+1`; `X=0`; block bound | `P(τ>2k)=2^(−k)`; `√2·2^(−(2k+1)/2)=2^(−k)` equality at odd `n`; `P(τ>n)=1`; `ρ^(k⌊n/k⌋)≤ρ^(n−k)` | true; nondegeneracy needed |
| 2.2 `wald_exponential_identity` | steps +1 (2/3), −1 (1/3), (−2,2), `e^θ=3/4`; `θ=0`; `0∉(a,b)`; Cauchy, `θ=1` | `φ=1/2+4/9=17/18`; exits `(1/4)/(145/324)=81/145` and `(16/81)/(145/324)=64/145`, sum 1; `P(τ<⊤)=1`; `M₀=1`; `mgf=0`, LHS 0 | true (tilted law not a.s. zero, so tilted exit a.s.) |
| 2.2 other `φ` values | `e^θ=1/5, 1/2, 2` | `2/15+5/3=9/5`; `1/3+2/3=1`; `4/3+1/6=3/2` | Check values correct |
| 3.1 `obsFiltration` | `n=0`; against `Filtration.piLE` | empty supremum = `⊥`; `piLE n` contains coordinate `n` | as described |
| 3.1 `infinitePi_inter_ne_top_eq_setLIntegral` | `P(1)=1/2`, `Q(1)=1/4`, `τ` = first 1; `Q=δ₀`; `P=δ₀`, `Q=δ₁`, `τ=1`; `τ=0`; `τ=⊤` | `f=(3/2,1/2)`, `∑(1/4)(3/4)^(n−1)=1=Q^∞(τ<⊤)`; 0=0 though `Q^∞(univ)=1`; 1 vs 0; 1=1; 0=0 | true; `Q≪P` and the cut to `{τ<⊤}` needed |
| 3.2 `exists_measureReal_lt_sprtTime_le` | `P=(2/3,1/3)`, `Q=(1/3,2/3)`, `a=−log 2`, `b=2 log 2`; `P=Q`; `P=δ₀`, `Q=δ₁`; nondegeneracy argument | survive two steps: `(1/3)(2/3)=2/9` under both; increment 0 a.e.; `f∈{0,1}` a.e. forces `P(f=1)=∫f=1`, so `P=Q` | true |
| 3.3 `exp_mul_measureReal_sprtReject_le` | same laws; `b=log 3`; `a<b<0`, `0<a<b`, `b=0`, `a=0`; `a=b=0`; `P=(1/2,1/2)`, `Q=δ₀`; `P=δ₀`, `Q=(1/2,1/2)`, `L=2 log 2` | `α=(1−2)/(1−8)=1/7`, `β=1−4/7=3/7`; `4/7=4/7`, `3/7=3/7`; `3/7<4/7`; `(α,β)=(1,0),(0,1)` satisfy both; `1≤0` fails; `e^(1/2)≤1` fails; `β=h₀=1/3>1/4` | true; both absolute continuities and `a<b` needed |
| 3.4 `klBin` | against MathematicalStatisticsNonparametric 1.3 | bodies identical character for character; namespaces differ | no name clash |
| 3.4 `ofReal_klBin_le_lintegral_mul_klDiv` | same test, accept event; laws exchanged; `P=Q`; `E_P[τ]=0`; `D=∞`; `Q^∞ E=0` | `E_P[τ]=(4/3)/(7/9)=12/7`, `klBin(6/7,3/7)=(4/7)log 2=(12/7)(1/3)log 2`; `(5/7)log 2=(15/7)(1/3)log 2`; 0≤0; `τ=0`, `E∈{∅,univ}`, 0≤0; RHS ∞; junk value ≤0 | true |
| 3.5 `lintegral_sprtTime_mul_klDiv_le` | same test, `c=log 2`; `c−a<0`; `P=Q`; `P≪Q` or `Q≪P` dropped | `(4/7)log 2≤2 log 2`, `(5/7)log 2≤3 log 2`; `a>c≥0` gives `τ=0`; `∞·0=0`; then `D=∞`, `E[τ]≥1`, bound fails | true; hypotheses needed |
| Conventions: junk values | `stoppedValue` on `τ=⊤`; `llr` where `f∈{0,∞}`; `klDiv` | `u (⊤).untopA`; `log (f).toReal=0`; `∞` unless `μ≪ν` and `llr` integrable | text matches the pin |

- Source locators checked against the text: 6 of 14 (all of Durrett: Theorem 2.6.2 p. 92, proof of 2.6.3 p. 93, Theorem 4.8.6 p. 257, proof of 4.8.7 p. 258, Exercises 4.8.4 p. 261 and 4.8.8 p. 262; Durrett2019 lines 4793, 4862–4867, 12547, 12568–12572, 12740, 12774).
- Library declarations opened at the pin: 38 Mathlib (among them `hittingAfter` HittingTime.lean:66, `Adapted.isStoppingTime_hittingAfter` :413, `stoppedValue` Stopping.lean:803, `llr` LogLikelihoodRatio.lean:37, `exp_llr_of_ac'` :59, `klDiv` KullbackLeibler/Basic.lean:56, `iIndepFun.indep_comap_natural_of_lt` BorelCantelli.lean:44, `Martingale.stoppedValue_min_ae_eq_condExp` OptionalSampling.lean:194, `Filtration.piLE` Filtration.lean:490) and 2 Tau Ceti (`Adapted.measurable_stoppedValue` StoppedValue.lean:71, `pi_withDensity` PiWithDensity.lean:80); one file attribution off (N01).
- Cross-roadmap citations resolved: RuinTheory 2.2 `martingale_exp_mul_sum_div_prod_mgf` at its open head (hypotheses as quoted in the contract) and 3.2; MathematicalStatisticsNonparametric 1.3 `klBin`, `ofReal_klBin_le_klDiv` on main; StochasticCalculus §2.3 on main (items as described, indexed from 1, stopped value assumed integrable); the boundary statements about HypothesisTestingExponents, OptimalStopping, BestArmIdentification 5.1 and RuntimeAnalysisOfEvolutionaryAlgorithms.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line. RuinTheory is an open pull request that adds a new roadmap; MathematicalStatisticsNonparametric is on main.
- Elaboration: `Suggested.lean` elaborates with nine `sorry` warnings and nothing else; single `import Mathlib`, no `set_option`, no sorry'd data. The elaborated types of the 15 declarations were compared with the README statements; `exitTime` does not carry `[MeasurableSpace Ω]`, which its body does not use.
- One-tactic probe (`rfl`, `simp`, `infer_instance` on a probe copy of the file): none of the nine theorems closes. Headlines: all nine README headline theorems are stated; none is declared not statable.
- Duplication: no Wald identity, exit-time tail, sequential test or stopped likelihood ratio in the pinned Mathlib or Tau Ceti, on main, or in the open roadmaps searched by object.
- Automatic checks: all passed on this head.

Overlap check: read RuinTheory, HypothesisTestingExponents, OptimalStopping, MarkovChainsAndRenewal, SeriesOfIndependentRandomVariables, StochasticCalculus, MathematicalStatisticsNonparametric, MathematicalStatisticsFoundations; shared objects: the exponential martingale (owner RuinTheory 2.2, cited), `klBin` and its data-processing bound (owner MathematicalStatisticsNonparametric 1.3, cited), gambler's-ruin exit probabilities and optional sampling under a vanishing tail (owner StochasticCalculus §2.3, used only in Checks and inside the route of 2.2); nothing owned twice.

Source independence: 8 passages compared with 1 source (Durrett2019: the statements of 1.1, 1.2, 2.2, the routes of 1.1 and 2.1, two docstrings, the conventions on filtrations), none shared; largest share Durrett2019, 6 of 14 locators; contents compared with Durrett2019: independent (Layers 1 and 2 each draw on both §2.6 and §4.8, Layer 3 on neither). Ferguson and Polyanskiy–Wu could not be read, so wording and arrangement were not compared with them.

Research link: Layer 3 states the non-asymptotic ingredients (threshold inequalities, both sample-size bounds) of the sequential exponent trade-off of Polyanskiy and Wu 2025, Theorem 16.4, and names the Wald–Wolfowitz optimality theorem as untreated; rests on the README (3.5 and its scope section), not on a source read here.

## Not verifiable

- Ferguson, *Optimal Stopping and Applications*, §3.3 Theorem 4, Remark 1, Example 3 (1.1 and its Checks): the sources service declined the author's-page address the README gives; no other legal copy was sought.
- Polyanskiy–Wu, (16.13)–(16.14), Theorem 16.4 and its proof, pp. 320–324 (3.1, 3.3, 3.4, 3.5): the service declined the author's-page address, and the DOI resolves to a publisher page that is not open. The sampled targets 3.1–3.5 are therefore verified mathematically (table above) but not against their locators; 3.2 cites no source.
- Durrett was read from the copy of the author's-page PDF that the sources service already holds for another roadmap.

## Source issues

- **Misprint** in Durrett2019 at Exercise 4.8.8, p. 262: the source says the stopped process is the martingale stopped at a time written `T`, which is not defined there; it should be the exit time `τ` just introduced; affects nothing.
- **Misprint** in Durrett2019 at §4.8.1, "Quadratic martingale", p. 257: the source says `Sₙ − nσ²` is a martingale for mean-zero steps of variance `σ²`; it should be `Sₙ² − nσ²`; affects nothing.
- **Misprint** in Durrett2019 at the proof of Theorem 4.8.7(b), p. 258: the source says the mean of `N ∧ N` increases to the mean of `N`; it should be `N ∧ n` as `n → ∞`; affects nothing.

## For the human reviewers

- Not tested: Polyanskiy–Wu (5 of 14 locators, all of Layer 3) and Ferguson (3 locators) could not be read legally here; their locators, wording and arrangement were not compared with the README.
- Licence: Ferguson's *Optimal Stopping and Applications* is cited from the author's UCLA page (README line 593); I found no publisher for it, so its publication status is unsettled.
- Scope: 1.2 and 2.2 cite textbook exercises (Durrett, Exercises 4.8.4 and 4.8.8) for their statements, each in a wider form with a complete route in the README; no refereed source is cited for the wider forms.
