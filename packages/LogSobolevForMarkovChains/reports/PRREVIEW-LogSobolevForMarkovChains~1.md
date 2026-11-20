# Review of LogSobolevForMarkovChains (pull request #2737 at a58a4f2)

**Verdict:** needs changes

**Summary.** Needs changes, for one sentence: the Examples line of Layer 3 says the mixing bound 3.3 gives a time of order `(n/4) log n` on the cube, while with this roadmap's constants it gives `(n/2) log(n log 2) + cn`, and the lazy walk is not mixed at `(n/4) log n`. Every stated theorem, definition and Check was recomputed and found correct, the source locators agree with the texts, and `Suggested.lean` elaborates with `sorry` as its only warning. There are two small corrections and two format notes, none blocking; the human reviewers are asked to note that 14 of the 15 locators point into an unfinished draft monograph.

## R01 (P2) — With the constants of 2.3, the bound of 3.3 on the cube is `(n/2) log(n log 2) + cn`, not of order `(n/4) log n`

In the Examples of Layer 3 (README line 381): "the cube, for which 3.3 gives a time of order `(n/4) log n` with the constants of 2.3". A reader takes this as the leading term of the time at which the lazy walk is close to uniform, and that is false: the lazy walk on the `n`-cube has its total variation cutoff at `(n/2) log n` (each coordinate agrees with the start with probability `(1 + e^(−t/n))/2`), so at `(n/4) log n` it is still far from uniform.

The computation: 2.3 gives `α = 1/(2n)` and `γ = 1/n`, and `π(x) = 2^(−n)`, so the time of 3.3 is `log(n log 2)/(4α) + c/γ = (n/2) log(n log 2) + cn`. The Check of 3.3 for `n = 3` agrees with this (`(3/2) log(3 log 2) + 3 ≈ 4.098`) and so contradicts the Examples line, which would give `(3/4) log 3 ≈ 0.82` for the first term. The constant `1/4` is that of Aldous and Fill, Example 37, for the walk that flips a uniform coordinate, which the Check of 2.3 already notes moves twice as fast (`α = 1/n`).

Smallest change: replace `(n/4) log n` by `(n/2) log n` (or by the exact `(n/2) log(n log 2) + cn`).

## C01 — Chen, Liu and Saloff-Coste state the constant of the redrawing chain but do not prove it

In 2.2 (line 191) the first item cites "Example (E6), p. 242, for every positive law on a finite set, proved there by reduction to the two-point space". At that locator (ChenLiuSaloffCoste lines 156–160) the value `(1 − 2μ*)/log(1/μ* − 1)` is stated for an arbitrary positive law, with the remark that the proof goes by reduction to the two-point example and a reference to three other papers; no proof is given there. Since 2.2 offers no route of its own for more than two states, an implementer is sent to a page that has no argument. The statement itself is right (recomputed for the laws `(1/3, 1/3, 1/3)`, `(0.2, 0.3, 0.5)` and `(0.1, 0.2, 0.3, 0.4)`: `0.480898`, `0.432809`, `0.364096`, equal to `c(π_min)`).

Would read correctly as "stated there, with the proof (by reduction to the two-point space) referred to the literature", together with either a locator for the proof in Diaconis and Saloff-Coste (which Aldous and Fill, Example 30, cite for it) or two lines of route for the reduction.

## C02 — The facts of 3.1 on `exp(t(P − I))` are the case `Q = P − I` of a theorem ContinuousTimeMarkovChains owns, and the scope paragraph says none is stated

Scope and ownership says of ContinuousTimeMarkovChains (line 414): "This roadmap defines `H_t` for `Q = P − I` only and states none of those theorems". But 3.1 (lines 278–279) states, and the routes of 3.2 and 3.3 use, that for `t ≥ 0` the entries of `H_t` are nonnegative and its rows sum to `1`, and that `H_(s+t) = H_s H_t`: this is ContinuousTimeMarkovChains 1.3 (stochasticity of `exp(tQ)` for a Q-matrix, with 1.2 for nonnegativity) at `Q = P − I`. The mathematics is right and the three-line argument given is sound; the sentence of the scope paragraph is what does not match.

Would be settled either by saying in the scope paragraph that 3.1 proves the special case `Q = P − I` directly because this roadmap does not depend on that one, or by citing ContinuousTimeMarkovChains 1.2 and 1.3 for those facts.

## N01 — Status words in the text

"an open roadmap, not on main" (Scope and ownership, three times; supplier contracts, "as they stand in its open version") and "Named for attribution; not consulted" (References) describe the state of the repository and of the drafting; they will be out of date once the supplier merges. The citations by roadmap and section carry the information without them.

## N02 — Two Checks report experiments rather than values

The last Check of 2.3 ("random reversible factors … agree to `10⁻⁶`") and the last of 3.2 ("no `f` … was found") give nothing a reader can recompute. A fixed instance with its two values would do the same work (for example the factors and weights of one `2 × 3` product, with both sides of the identity).

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 `funEntropy` | indicator of mass `1/2`; constant `2`; point mass | `(log 2)/2 = 0.3466`; `4 log 4 − 4 log 4 = 0`; `0` | agrees with Checks; factor 2 against Aldous–Fill (52) confirmed |
| 1.2 `logSobolevConstant`, `2α ≤ γ` | one state; point mass; two states `κ = (0.3, 0.1)`, `π = (1/4, 3/4)`; uniform redraw | `0 ≤ 0`; `0 ≤ 0`; `2α = 0.3641 < 0.4`; `1 = 1` | holds; expansion `Ent((1+εg)²) = 2ε²Var g + O(ε³)` rechecked |
| 2.1 `twoPointConstant` | `p = 0, 1, 1/2, 1/4, 1/3, 1/10, 0.49` | `0, 0, 1/2, 0.4551, 0.4809, 0.3641, 0.49993` | agrees |
| 2.1 `logSobolevConstant_bool` | non-stationary `π = (0.3, 0.7)`, `κ = [[.2,.8],[.5,.5]]`; point mass; identity kernel | minimisation `0.663173`, formula `0.663173`; `0 = 0`; `0 = 0` | holds |
| 2.1 route (maximiser) | `π₀ = 0.3`, `x = 2π₀π₁/(1−2π₀)` | `Ent/Var = 2.118245 = 1/c(0.3)`; nearby `x` give `≤ 2.11802` | agrees |
| 2.2 `logSobolevConstant_const` | three laws above; `(1/4, 3/4)`; uniform two points; one state; `π = (0, .3, .7)` | `0.480898`, `0.432809`, `0.364096`; `0.45512`; inf `→ 0.5` not attained; `0 = c(1) = 0`; positivity needed | holds |
| 2.2 `twoPointConstant_mul_spectralGap_le` | `π_min = 0`; one state; two states | `0 ≤ α`; `0 ≤ 0`; equality `γ c(π₀)` | holds; needs only `c, γ ≥ 0` and the definition of `γ` |
| 2.3 `coordinateKernel`, tensorization | non-reversible factors on `2 × 3`, non-stationary laws, `w = (0.8, 1.7)`; empty `ι`; `w = (1, 0)`; point-mass factor | `0.36585651` both sides; `0 = 0`; `0 = 0`; `α₁/2` against `0` (hypothesis needed) | holds without reversibility or stationarity, as stated |
| 2.3 cube Check | `n` general, `n = 2` | `α = 1/(2n)`, `γ = 1/n`; `1/4` | agrees; MarkovChainMixing 5.3 walk is this kernel |
| 3.1 `heatSemigroup`, `weightedLpNorm` | redrawing chain; one state | `H_t = e^(−t) I + (1 − e^(−t)) Π`, distance `e^(−t)(1 − π(x))`; `H_t = 1` | agrees |
| 3.2 Gross | `c ≤ 0`; one state; absorbing point mass; uniform two-point, `q = 4`, `ρ² = 1/3`; `c = 1.2α` | only `q = 2`; left side true, `α = 0`; same; `1 + 2b² + b⁴/9 ≤ (1+b²)²`, max ratio `1.0` over 2·10⁵ samples; ratio `1.0100 > 1` | iff holds; `F′(0) = c Ent(f²) − E(f)` rederived; (57) with `u = 1/(2c)` matches |
| 3.3 mixing bound | redraw `ε = 1/100` at heavy state; identity kernel; cube `n = 3`, `c = 1`; path, `c = −2`; three uniform points | bound `0.00618 < 0.01`; `2/3 > 1/2`; `t = 4.098`, distance `0.187 ≤ 0.5`; distance `19.05`–`19.82 > 10.04`; `0.635 e^(−c) < 1.359 e^(−c)` | holds; each hypothesis needed |
| Layer 3 Examples (R01) | cube, constants of 2.3 | `(n/2) log(n log 2) + cn`; README says `(n/4) log n` | false sentence |
| 2.2 citation (C01) | ChenLiuSaloffCoste lines 156–160 | value stated, proof referred elsewhere | attribution corrected |

- Source locators checked against the text: 14 in AldousFill ((52), (53), Lemma 22, Theorem 24 with (57), Lemma 25, Theorem 26(a), (3), Examples 28, 29, 30, 37, Corollary 31, Lemma 35, Theorem 36) and 1 in ChenLiuSaloffCoste (Example (E6), printed p. 242); all at the stated places.
- Library declarations opened at the pins: 20 (among them `Kernel.IsReversible` at `Mathlib/Probability/Kernel/Invariance.lean:58`, `Kernel.ofFunOfCountable` at `Mathlib/Probability/Kernel/Basic.lean:237`, `Measure.pi_singleton` at `Mathlib/MeasureTheory/Constructions/Pi.lean:299`, `Real.inner_le_Lp_mul_Lq` at `Mathlib/Analysis/MeanInequalities.lean:920`, `hasDerivAt_exp_smul_const` at `Mathlib/Analysis/SpecialFunctions/Exponential.lean:382`, `TauCeti.klDiv_eq_ofReal_sum_log_singleton` at `TauCeti/InformationTheory/KullbackLeibler/Finite.lean:53`, `Kernel.toMatrix` at `TauCeti/Probability/Kernel/Matrix.lean:44`); all exist with the stated content. No logarithmic Sobolev or hypercontractivity declaration at either pin.
- Cross-roadmap citations resolved: MarkovChainMixing Conventions, 2.1, 2.4, 5.3 at its open head (the two copied definitions are identical to its `Suggested.lean`); MarkovChainsAndRenewal Layer 3 items 1 and 5 on main; RandomMatrices 2.2 on main; BooleanFunctionAnalysis 4.1, 4.2 and ContinuousTimeMarkovChains 1.2, 1.3 at their open heads.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: seven `sorry` warnings, nothing else. `#check` types of the 15 declarations compared with the README: the six definitions that lose `[MeasurableSingletonClass S]` do not mention it in their types; nothing changed.
- One-tactic probe on a copy: none of the seven theorems closes by `simp` with the definitions unfolded, `rfl`, `le_rfl`, `positivity` or `norm_num`. No padding found. Headline theorems of the README (both comparisons, two points, redrawing chain, tensorization, Gross, mixing): all seven stated.

Overlap check: read MarkovChainMixing, MCMCAsymptoticVariance, SimulatedAnnealing, ContinuousTimeMarkovChains, ElectricalNetworksAndRandomWalks (open) and MarkovChainsAndRenewal (main); the third list is empty. Dirichlet form, spectral gap, Poincaré inequality: owner MarkovChainMixing 2.4, cited here. Stochasticity of `exp(tQ)`: owner ContinuousTimeMarkovChains 1.2–1.3 (C02). The logarithmic Sobolev constant, entropy functional and Gross's theorem have no other owner; MarkovChainMixing and BooleanFunctionAnalysis each exclude them.

Source independence: 8 passages compared with 2 sources, none shared; largest share AldousFill, 14 of 15 locators; contents compared with AldousFill Section 4 (4.1 definition and Lemma 22, 4.2 hypercontractivity, 4.3 exact values, 4.4 products, 4.5 comparison): independent (Layer 2 merges 4.3 and 4.4, Layer 3 is 4.2 moved last, 4.5 is out of scope).

Research link: the constant and Gross's equivalence for finite chains are those of Diaconis and Saloff-Coste (1996), after Gross (1975); exact constants are the subject of Chen, Liu and Saloff-Coste (2008). Rests on the README's references and ChenLiuSaloffCoste Section 1.

## Not verifiable

- Diaconis and Saloff-Coste (1996): no legal copy reachable (the Project Euclid page offered no PDF); the attribution of the weighted product lemma in 2.3 and of the finite-chain form of Gross's theorem in 3.2 was not checked. No locator into it is cited.
- Gross (1975): named for attribution only; not read.
- AldousFill line 984, the hypothesis line of Theorem 26(a): the recognised text is unreadable there; the conclusion and the time threshold (lines 985, 990–994) were read and agree with 3.3, but whether the source writes `c ≥ 0` or `c > 0` was not seen. The statement of 3.3 was verified independently.

## Source issues

- **Gap** in ChenLiuSaloffCoste at Example (E6), printed p. 242: the source says the constant is one minus twice the least mass over the logarithm of its odds ratio, for every positive law; it should be read as the limit one half when two equal points give zero over zero; affects nothing.

## For the human reviewers

- Scope: 14 of the 15 locators point into AldousFill, an unfinished draft chapter (May 1999, with the authors' working notes) on an author's page; the refereed primary source, Diaconis and Saloff-Coste (1996), is named in the References as not consulted.
