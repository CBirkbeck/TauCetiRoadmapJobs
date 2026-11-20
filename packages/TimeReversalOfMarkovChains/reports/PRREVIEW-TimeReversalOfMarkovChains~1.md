# Review of TimeReversalOfMarkovChains (pull request #2788 at 456c48b)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or worked example was found false, and the nine headline theorems of `TauCetiRoadmap/TimeReversalOfMarkovChains/Suggested.lean` agree with the README and elaborate with `sorry` as the only warning. There are two small corrections (Mathlib already gives the value of a posterior at an atom, through `Measure.condKernel_apply_of_ne_zero`, which 1.3 does not cite; one Check of 4.1 gives the wrong reason for a correct value) and one format note, none blocking. Two facts about the scope are left for the human reviewers.

## C01 — Mathlib already evaluates the posterior at a point of positive mass, on every set, so 1.3 is a short corollary of a lemma it does not cite

Section 1.3 and the scope paragraph compare the target only with `posterior_eq_withDensity_of_countable` and say the new content is "the value at a single point of positive mass for any standard Borel `Ω`". At the pin, `ProbabilityTheory.posterior κ μ` is by definition `((μ ⊗ₘ κ).map Prod.swap).condKernel` (`Mathlib/Probability/Kernel/Posterior.lean`, line 70), and `MeasureTheory.Measure.condKernel_apply_of_ne_zero` (`Mathlib/Probability/Kernel/Disintegration/StandardBorel.lean`, line 389) states, for measurable singletons and `ρ.fst {x} ≠ 0`, that `ρ.condKernel x s = (ρ.fst {x})⁻¹ * ρ ({x} ×ˢ s)` for every set `s`, with no countability. On a scratch copy, unfolding `posterior`, rewriting with that lemma and simplifying `fst` of the swapped product reduces `posterior_apply_singleton_eq_div` to the mass of the rectangle `{ω} ×ˢ {x}` under `μ ⊗ₘ κ`, which is `Measure.compProd_apply_prod` and `lintegral_singleton`.

The statement is true and worth keeping as the form consumers use. The smallest repair is to cite `Measure.condKernel_apply_of_ne_zero` in the route and *Needs* of 1.3 and in the Mathlib paragraph of the scope section, and to say that 1.3 is its specialisation to posteriors and singletons (the library form also gives `(κ†μ) x s` for every measurable `s`, which 2.1 could use).

## C02 — In the last Check of 4.1 the value `(p(0) ᵥ* Q̂)₁ = 0` does not come from the vanishing of row 1

The Check (line 443) says "division by zero makes row `1` of `reversedRate` zero, so `(p(0) ᵥ* Q̂)₁ = 0`". Component `1` of the row vector `p(0) ᵥ* Q̂` is `Σᵢ pᵢ(0) Q̂ᵢ₁`, the column `1` of `Q̂` weighted by `p(0) = δ₀`, so it equals `Q̂₀₁ = p₁(0) Q₁₀ / p₀(0) = 0 · 1 / 1 = 0`; row `1` enters only through `p₁(0) Q̂₁₁ = 0 · Q̂₁₁`, whatever `Q̂₁₁` is. Both values in the Check (`0` on one side, `−1` on the other) are right, and the conclusion that positivity is needed stands; only the reason is misattributed, and a reader could conclude that the failure is an artefact of Lean's `x / 0 = 0`, which it is not. Replace the clause by "`(p(0) ᵥ* Q̂)₁ = Q̂₀₁ = p₁(0) Q₁₀ / p₀(0) = 0`".

## N01 — The title line writes "markov" in lower case

`# Roadmap: time reversal of markov chains`: the proper name would be capitalised ("time reversal of Markov chains").

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 path law and marginals | `{0,1}`, `μ=(1/2,1/2)`, rows `(1/2,1/2)`,`(1/4,3/4)`; `T=0` | `μP=(3/8,5/8)`; column product `(1/2,1/2)`; `T=0` gives image of `μ` | Checks true |
| 1.2 `chainPath_map_reverseIndex` | same chain, `T=1`; `μ=δ₀`, identity kernel; `μ=0`; `T=0` | reversed masses `1/4,1/8,1/4,3/8` both sides; shifted prior row `(6/11,5/11)`, mass `9/44≠1/4`; null point irrelevant; `0=0` | true |
| 1.2 uniqueness bullet | against `ae_eq_posterior_of_compProd_eq`, DenoisingDiffusion 4.1 | hypothesis there is `qₜ ⊗ₘ rev t`, same as here | consistent |
| 1.3 `posterior_apply_singleton_eq_div` | rectangle `{x}×{ω}`; example of 1.1; mass `0` at `x` | `(κ∘ₘμ){x}·(κ†μ)x{ω} = μ{ω}κω{x}`; rows `(2/3,1/3)`,`(2/5,3/5)`; `0/0=0` vs probability | true; C01 |
| 2.1 `chainPath_map_reverseIndex_of_invariant` | 3-cycle uniform; biased 3-cycle `2/3,1/3`; two-state `π=(1/3,2/3)`; two-cycle from `δ₀` | reversed cycle `0→2→1→0`; probabilities exchanged; `π₀κ₀₁=π₁κ₁₀=1/9`; reversed path `(1,0)` | true; invariance needed |
| 2.2 `isReversible_iff_invariant_and_ae_eq_posterior` | `π=0`; 3-cycle; two-state chain | both sides true; `1/3≠0` so not reversible and `κ†π≠κ`; `κ†π=κ` | true both directions |
| 2.2 `isReversible_iff_map_reverseIndex_eq` | `T=0` 3-cycle; two-cycle `π=δ₀`, `T=2`; two-state `T=2` | `T=0` law fixed, chain not reversible; path `(0,1,0)` fixed, `A={0},B={1}` gives `1≠0`; `2/27=2/27` | true; `T≥1`, invariance needed |
| 3.1 propagator, forward/backward, identification | constant `Q`; `Q=β(J−nI)`; row/column convention against DiracScattering 1.3 | `(J/n)(J−nI)=0`, `K(J−nI)=−nK`; `N(t,r)N(r,s)v = vP(s,r)P(r,t)`; backward `−N(t,s)A(s)v = v(−Q(s)P(s,t))` | consistent |
| 3.2 `eq_vecMul_propagator` | `a=b`; `a>b`; `S` empty; `Q=[[1,0],[1,0]]`, `q=(1,1)` | `p a = p a ᵥ* 1`; vacuous; trivial; `‖Q‖=1`, `qQ=(2,0)` | true |
| 3.3 `propagator_mem_rowStochastic` | `Q=[[−1,1],[1,−1]]`, `s=1,t=0`; Metzler `[[−1,1],[0,−1]]` | entry `(1−e²)/2≈−3.19`; row sums `2/e`, `1/e` | true; hypotheses needed |
| 4.1 `isQMatrix_reversedRate_and_hasDerivWithinAt` | general identity; 3-state stationary; birth–death; worked example; point mass at `s=T` | `(pQ̂)ᵢ=−(pQ)ᵢ`; `Q̂=[[−2,0,2],[1,−1,0],[1/2,1/2,−1]]`; `4/7=4/7`, `2/7=2/7`; row sum `−3/5`; `0` vs `−1` | true; C02 |
| 4.2 `reversedTransition_forward_and_mem_rowStochastic` | `v=u`; derivative term by term; row sums; `u=T` | `δᵢⱼ`; diagonal terms `±pⱼQⱼⱼPⱼᵢ` cancel, rest equals `(RQ̂)ᵢⱼ pᵢ`; `(pP)ᵢ/pᵢ=1` | true |
| Worked example | `p(0)=(1/2,1/3,1/6)`, `e^(−3T)=1/2` | `p(T)=(5/12,1/3,1/4)`; rows at `s=0`: `(−7/5,4/5,3/5)`,`(5/4,−2,3/4)`,`(5/3,4/3,−3)`; at `s=T`: `(−1,2/3,1/3)`,`(3/2,−2,1/2)`,`(3,2,−5)` | all values agree |

- Source locators checked against the text: 9 (LPW §1.6, (1.29)–(1.31) p. 13, Example 1.22, (1.32), Proposition 1.23 p. 14; CampbellEtAl2022 Proposition 1 p. 4, §4.1 pp. 4–5, Appendix A pp. 15–16, Appendix B.1 pp. 16–17); all support the statements as cited.
- Library declarations opened at the pins: 27, among them `posterior` (`Posterior.lean` 70), `compProd_posterior_eq_map_swap` (81), `ae_eq_posterior_of_compProd_eq` (113), `posterior_comp_self` (125), `posterior_posterior` (177), `Kernel.Invariant` and `Kernel.IsReversible` (`Invariance.lean` 39, 58, 63), `Matrix.rowStochastic` (`Stochastic.lean` 43), `ODE_solution_unique_of_mem_Icc_right` (`ExistUnique.lean` 194), `TauCeti.dysonSeries`, `hasDerivAt_dysonSeries`, `eq_mul_dysonSeries`, `eq_of_hasDerivAt_mul`, `eq_dysonSeriesLeft_apply` (`DysonSeries.lean` 152, 200, 234, 143, 328), `markovChainLaw` (`MarkovChain.lean` 161).
- Cross-roadmap citations resolved: 17 (DenoisingDiffusion Conventions, 2.2, Layer 4, 4.1; DiracScatteringAndNonlinearFourierTransform 1.2, 1.3; MarkovChainsAndRenewal Layer 3 item 1 on main; ContinuousTimeMarkovChains 1.1, 1.3, 2.1, 4.3, 5.1, 5.2 and its scope; SimulatedAnnealing 2.1; MarkovChainMixing 3.2; HiddenMarkovModels 3.2; ScoreBasedDiffusion Layer 3). `IsMetzler`, `IsQMatrix`, `pathEval`, `reverseIndex` agree character for character with their originals.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: nine `sorry` warnings, nothing else. Elaborated signatures compared with the README: the binders reported as dropped are the two `omit` lines (1.3 and the path-law criterion of 2.2, which the README states on every measurable space) and unused section variables of definitions; nothing changed.
- One-tactic probe on a scratch copy (`simp`, `rfl`, `simp` with the definitions unfolded): none of the nine theorems closes.
- Dependency check: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`; no UPWARD or CYCLE line. ContinuousTimeMarkovChains is an open pull request that adds a new roadmap, named in the description.
- Duplication by object: no roadmap, open or on main, states the posterior form of the reverse Markov property, the reversibility criteria of 2.2, or a propagator for time-dependent rate matrices; Mathlib has no equivalence of `Kernel.IsReversible` with swap invariance or with the posterior.
- Pull-request text read against the head: counts (9 theorems, 10 definitions, 1 instance, one Tau Ceti import), suppliers and scope agree with the folder.

Overlap check: read ContinuousTimeMarkovChains, LogSobolevForMarkovChains, ScoreBasedDiffusion, MCMCAsymptoticVariance, OrnsteinUhlenbeckSemigroup, DenoisingDiffusion, MarkovDecisionProcesses, MarkovChainsAndRenewal; shared objects: the reverse Markov property of the Gaussian noising chain and the path maps (owner DenoisingDiffusion, cited here, the general statement owned here); Q-matrices and constant-rate theory (owner ContinuousTimeMarkovChains, which excludes time-dependent rates); invariance and detailed balance formulas (owner MarkovChainsAndRenewal); nothing owned twice.

Source independence: 9 passages compared with 2 sources, none shared; largest share LPW, 5 of 9 locators; contents compared with LPW: independent (the roadmap's Layers 1–2 draw on the single section 1.6 and order reversal before reversibility; Layers 3–4 are not in it).

Research link: Layer 4 is the forward-equation form of the reverse-rate formula of Campbell, Benton, De Bortoli, Rainforth, Deligiannidis and Doucet (2022, Proposition 1), the basis of continuous-time discrete-state diffusion models; Layers 1–2 generalise the time reversal of Levin–Peres (2017, §1.6). Rests on the README's references and both texts as read.

## Not verifiable

- Bratteli–Robinson, *Operator Algebras and Quantum Statistical Mechanics 1*, Theorem 3.1.33: named in the References as the citation of Tau Ceti's Dyson-series module, with no locator used by this roadmap; the book was not read (no open copy sought, no statement here depends on it).

## Source issues

- none

## For the human reviewers

- Scope: Layers 3–4 assume a finite state set and rates continuous on all of `ℝ` (README Conventions, line 63), while the cited propagator of DiracScatteringAndNonlinearFourierTransform 1.3 is for integrable coefficients; the README lists infinite state spaces as out of scope.
- Scope: the general-space reverse Markov property (1.2), the criteria of 2.2 and Layer 3 carry no source locator for the general statement; the README calls them classical and "proved here" (References, line 682), citing LPW only for finite chains.
