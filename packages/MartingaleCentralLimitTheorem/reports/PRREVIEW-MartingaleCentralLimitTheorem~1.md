# Review of MartingaleCentralLimitTheorem (pull request #2685 at 062c1b4)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason only: the three supplier citations into MarkovChainsAndRenewal that carry Gordin's theorem (4.1) use item numbers that the open revision of that roadmap replaces by section numbers, so they stop resolving when it merges. The mathematics stood up to the adversarial pass: every statement, route and Check was recomputed and none failed, the Durrett locators are exact, and `Suggested.lean` elaborates with `sorry` as its only warning. There are two small corrections and three format notes, none blocking. For the human reviewers: the two headline theorems that Durrett does not contain (1.3 and 2.3) carry attributions without locators, and neither the author nor this review could open McLeish or Brown.

## R01 (P2) — The citations "MarkovChainsAndRenewal Layer 2, items 3 and 4, and Layer 3, item 2" name ids that the open revision of that roadmap drops

The route of 4.1 rests on these three items (the *Needs:* line of 4.1, line 403; the route, lines 376–378; the Dependencies of Layer 4, line 415; the supplier contract, lines 508–514). On main they resolve: Layer 2 item 3 (class properties, an irreducible recurrent chain reaches every state, a finite closed class is positive recurrent), Layer 2 item 4 (`V_y(n)/n → 1{H_y < ∞} r_y`), Layer 3 item 2 (`π{x} = 1/m_x`). The open pull request #2605 ("Template update: MarkovChainsAndRenewal") rewrites that README into numbered subsections: at its head the same statements are `### 2.3 Class properties`, `### 2.4 Occupation frequencies` and `### 3.2 Invariant probabilities and Kac's formula`, the numbered items are gone, and its text gives no old-to-new numbering. Once it merges, "Layer 2, item 4" points at nothing and an implementer of 4.1 cannot follow the contract by its id.

The smallest change: cite each statement so that it resolves in both texts, by layer and subject (for instance "MarkovChainsAndRenewal Layer 2, class properties and occupation frequencies (items 3 and 4; 2.3 and 2.4 in the sectioned numbering), and Layer 3, invariant probabilities (item 2; 3.2)"), in the four places above, and name #2605 in the pull request description as the revision whose numbering is also cited. The contract's prose descriptions of the three statements are correct as they stand and need no change.

## C01 — The supplier contract describes `Ergodic.ae_eq_const_of_ae_eq_comp_ae` with the hypotheses of a different lemma

In the Mathlib contract (lines 485–487) the lemma is glossed as "an almost everywhere invariant function into a countably separated space is almost everywhere constant". At the pin, `Ergodic.ae_eq_const_of_ae_eq_comp_ae` (`Mathlib/Dynamics/Ergodic/Function.lean`, line 107) takes an a.e. strongly measurable function into a nonempty metrizable space; the countably separated, null-measurable version is `Ergodic.ae_eq_const_of_ae_eq_comp₀` (same file, line 71). Both apply to the real-valued conditional expectation of 3.2, so the route is unaffected; the gloss should read "an a.e. strongly measurable, a.e. invariant function into a nonempty metrizable space is a.e. constant".

## C02 — Existence of a solution of the Poisson equation is "left to other roadmaps", but no roadmap is named, and without it 4.1 gives no central limit theorem for a given `f`

The last bullet under "Left to other roadmaps" (lines 444–447) assigns existence and uniqueness of `g` to "the theory of the asymptotic variance of Markov chain Monte Carlo"; no roadmap on main or open owns it (MarkovChainMixing lists the Markov chain central limit theorem as outside its scope, README line 727 at its head). A reader who has `f` but no `g` cannot apply 4.1. On a finite irreducible chain existence is two lines: harmonic functions are constant, so `I − P` has rank `|S| − 1`, and its range lies in `{h : E_π h = 0}` because `π (I − P) = 0`, hence equals it. Would you add this as a statement of 4.1 (every `f` has a solution, unique up to a constant, so the theorem holds for every `f`), keeping the autocovariance, spectral and Peskun material outside the scope? Otherwise move the bullet to "Outside the scope", since no other roadmap is named.

## N01 — 4.1 does not say that its irreducibility is the supplier's

4.1 assumes Mathlib's `Kernel.IsIrreducible Measure.count κ`; MarkovChainsAndRenewal on main (Layer 2, item 1) defines irreducibility as communication of every pair. On a finite space with measurable singletons the two agree (a set has positive counting measure iff it is nonempty, and both allow `n = 0`), but the route of 4.1 uses the agreement silently; one clause in its *Needs:* line would record it.

## N02 — The *Needs:* line of 1.2 lists 1.1

Dvoretzky's inequality (line 128) is about events adapted to one filtration and uses nothing of martingale difference arrays; listing 1.1 puts an unrelated definition in front of it.

## N03 — Three reference entries describe how the text was drafted

"Attributed in prose only; no locator is given" (lines 525, 528) and "not consulted" (line 533) are remarks about the drafting; "cited for attribution" says the same without it.

## Questions for the author

- 1.3, 2.2 and 2.3 are stated with attributions and no locator. From memory, 1.3 is McLeish's Theorem (2.3) and 2.3 is Hall and Heyde's Corollary 3.1 with a constant limit; can you supply and check the locators? I could not: Project Euclid's pages for McLeish (1974) and Brown (1971) offered no readable file here, and Hall and Heyde has no open copy.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 `IsMartingaleDiffArray` | Rademacher rows; entry centred given `ℱ n (j+1)`; coarser filtration; predictable stopping | tower: `E[X|𝒢_j] = E[E[X|ℱ_j]|𝒢_j] = 0`; wrong variant forces `X = 0`; `1{j<τ}` pulls out | holds; wrong variant excluded by Check 2 | none |
| 1.2 Dvoretzky | `N = 1`; independent events, trivial `𝒢₀`, `δ = Np` | `P(A₁|𝒢₀) ≤ δ + 1{P(A₁|𝒢₀) > δ}`; right side `Np ≥ 1 − (1−p)^N` | matches Durrett-PTE5 line 19025 | N02 |
| 1.3 McLeish | `r(x)` bound; stopped product; length-one rows `ε₀`; the `2n`-row counterexample; `σ² = 0`; empty rows | `|r| ≤ |x|³/(3(1−|x|)) ≤ ⅔|x|³`; `|T|² ≤ e^{t²(σ²+1)}(1+t² max²)`; entry mean `1/n − 1/n = 0`; `P ≤ 1/n`; `E max² ≥ n → ∞`; limit `N(−1,1)` | route closes; each hypothesis shown needed | none |
| 2.1 Lindeberg ⇒ maxima | Rademacher; length-one `ε₀` | sums vanish iff `ε√n ≥ 1`; sum `= 1` for `ε < 1`, max `= 1` | holds; Durrett-PTE5 lines 19070–19085 with fixed `ε` | none |
| 2.2 squares vs conditional variances | `X = ε₀ξ`, `ξ² ∈ {0,2}` | `V = 1`, Lindeberg sum `1` for `ε < √2`, squares `2` or `0`; stopped second moment `≤ ε²c`; `E∑_{j<τ} X̂² ≤ δ` | route closes; counterexample correct | none |
| 2.3 conditional-variance CLT | Bernoulli(`1/n`) rows; non-`L²` length-one row; `σ² = 0`; stopped maxima | variances `1 − 1/n`; Lindeberg `(1−1/n)² → 1`; junk `condExp = 0` gives both hypotheses; `E max² ≤ σ² + 1` | holds; Lean = README (`hL2`, `ε < |X|`) | none |
| 3.1 `√n` form | array `X j/√n`; i.i.d.; bounded transforms | row variance `n⁻¹∑E[X_j²|ℱ_j]`; Lindeberg expectation is hypothesis 2; sum `0` once `ε√n > B` | reduces to 2.3; Durrett-PTE5 line 19088 has `σ² > 0`, functional | none |
| 3.2 Billingsley–Ibragimov | mixture `ξε_j`; `X ≡ 0`; one-sided, arbitrary `ℱ` | `E X₀² = 5/2`; fourth moments `51/2` vs `75/4`; `P(max > ε√n) ≤ ε⁻²E[X₀²; X₀² > ε²n]`; `E max²/n ≤ E X₀²` | holds via 1.3 and natural filtration | C01 |
| 4.1 Gordin, finite chains | two-state `p=1/3,q=1/2`; period-two four-state; flip chain; reducible three-state; `g + c` | `π=(3/5,2/5)`, `g=(12/25,−18/25)`, `σ²=42/125`; `σ²=1.45806`, `n⁻¹Var=1.45469` at 400; `0`; `1/2` with fourth moment `3/2 ≠ 3/4` | all Checks reproduced exactly; wrong model `E_π(g−Pg)²` gives `1` on flip chain | R01, C02, N01 |
| Irreducibility convention | `Kernel.IsIrreducible Measure.count κ` vs communication | `∃ n : ℕ, (κ^n) a A > 0` for `count A > 0`; `n = 0` allowed; absorbing state fails it | equivalent on finite `S` | N01 |
| Supplier items (R01) | main vs head of #2605 | main: Layer 2 items 3, 4, Layer 3 item 2 present; head: `2.3`, `2.4`, `3.2`, no items, no map | ids dropped | R01 |

- Source locators checked against the text: 8 of 8 into Durrett-PTE5 (p. 397 line 18887; Thm 8.2.4 line 18952; Lemma 8.2.7 line 19025; (8.2.3) lines 19019, 19070; Thm 8.2.8 line 19088; Thm 8.3.1 line 19107; Thm 8.3.2 line 19136; Example 8.3.4 line 19256); printed pages agree.
- Library declarations opened at the pins: 17 (Mathlib: `TendstoInMeasure` ConvergenceInMeasure.lean:57, `TendstoInDistribution` ConvergenceInDistribution.lean:64, `tendstoInDistribution_of_tendstoInMeasure_sub` :192, `TendstoInDistribution.of_tendsto_charFun` LevyConvergence.lean:230, `gaussianReal_zero_var` Gaussian/Real.lean:227, `charFun_gaussianReal` :481, `HasLaw` HasLaw.lean:39, `tendstoInDistribution_inv_sqrt_mul_sum_sub` CentralLimitTheorem.lean:122, `Ergodic` Ergodic.lean:49, `Ergodic.ae_eq_const_of_ae_eq_comp_ae` Function.lean:107, `Kernel.Invariant` Invariance.lean:39, `Kernel.IsIrreducible` Irreducible.lean, `Filtration.piLE` Filtration.lean:490; Tau Ceti: `markovChainLaw` Process/MarkovChain.lean:161, `condExp_shift_iterate_markovChainLaw` MarkovChain/MarkovProperty.lean:157, `tendsto_integral_abs_birkhoffAverage_sub_condExp` Ergodic/CondExpProjection.lean:169). No martingale central limit theorem, Lindeberg condition or Dvoretzky inequality at either pin.
- Cross-roadmap citations resolved: MarkovChainsAndRenewal Layer 2 items 3, 4 and Layer 3 item 2 (main: present; open revision: R01); MathematicalStatisticsAsymptotic 1.2 (main, `tendstoInDistribution_sum_of_lindeberg`, independent rows, multivariate: not restated); MarkovChainMixing 6.3, 6.4 and its scope line (open head: present, not depended on).
- Dependency check: `depcheck: 191 roadmaps, 2119 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean` with `lake env lean`: `sorry` the only warning (5 theorems). `#check @name` on all 6 declarations: each keeps `m`, `μ`, the probability instances and its hypotheses; types agree with the README statements.
- One-tactic probe on the 5 theorems (`simp_all`, `rfl`, `infer_instance`, `constructor <;> simp_all`): none closes. No padding; the 5 headline theorems (1.3, 2.3, 3.1, 3.2, 4.1) are all stated and none is forced through a stand-in.
- Pull request text read against the head: no sentence contradicted; it states that the roadmap is new, its suppliers and its 6 declarations.
- Duplication audit by object over the roadmaps on main and the open heads (martingale difference, McLeish, conditional Lindeberg, Gordin, Poisson equation of a chain): no other owner.

Overlap check: read SeriesOfIndependentRandomVariables, MarkovChainsAndRenewal (main and its open revision), LocalLimitTheorems, MarkovChainMixing, MathematicalStatisticsHigherOrderAndResampling, Exchangeability, StochasticCalculus; nothing shared (the Lindeberg–Feller theorem for independent rows is owned by MathematicalStatisticsAsymptotic 1.2 and cited; the occupation ergodic theorem and stationary law by MarkovChainsAndRenewal and cited).

Source independence: 10 passages compared with 1 source, none shared; largest share Durrett-PTE5, 9 of 9 locators; contents compared with Durrett-PTE5 §8.2–8.3: independent (Layer 1 and 2.2 have no counterpart there, the embedding theorems 8.2.1–8.2.3 and Theorem 8.3.2 are not used, and the order 2.3 → 3.1 → 4.1 is forced by the *Needs:* lines of 3.1 and 4.1). McLeish, Brown, Hall and Heyde could not be read.

Research link: the headline targets are the theorems of McLeish (1974), Brown (1971), Billingsley (1961), Ibragimov (1963) and Gordin (1969), as the README's References and Durrett-PTE5 §8.2–8.3 (lines 19112, 19130) attribute them; the README's scope names Markov chain Monte Carlo asymptotic variance as the consuming theory.

## Not verifiable

- McLeish (1974), attribution of 1.3: the DOI's Project Euclid page offered no readable file; the README gives no locator into it.
- Brown (1971), attribution of 2.3: same.
- Hall and Heyde (1980), attributions of 2.2 and 2.3: a book with no open copy; no locator given.
- Billingsley (1961), Ibragimov (1963), Gordin (1969): attributed through Durrett (Durrett-PTE5 lines 19112, 19130, bibliography lines 22383, 22497, 22533, which agree with the README's entries); the papers themselves were not opened.

## Source issues

- **Misprint** in Durrett-PTE5 at Theorem 8.2.3, p. 397: the source says both hypotheses carry the label (i); it should be (i) for the conditional variances and (ii) for the bound on the entries; affects nothing.
- **Misprint** in Durrett-PTE5 at Remark 8.2.1, p. 398: the source says that for independent rows Theorem 8.2.4 reduces to the martingale central limit theorem; it should be the Lindeberg–Feller theorem; affects nothing.
- **Misprint** in Durrett-PTE5 at the end of the proof of (8.2.3), p. 401: the source says the proof of "(e)" is complete, a label that appears nowhere in the argument; it should be (8.2.3); affects nothing.
- **Misprint** in Durrett-PTE5 at Example 8.3.4, p. 405: the source bounds the squared `L²` norm of the conditional expectation by the sup norm of `f` times a sum of squared total variation distances; it should be the square of the sup norm; affects nothing.

## For the human reviewers

- Licence: the only text read is Durrett's fifth edition as posted on the author's Duke page (the cited `services.math.duke.edu` address redirects to `sites.math.duke.edu`); I classed it as an author page.
- Not tested: headline theorems 1.3 and 2.3 and the comparison 2.2 have no source locator; McLeish, Brown and Hall–Heyde were read neither by the author (README lines 525–528) nor here. The routes given were checked step by step instead.
- Scope: the pull request description states that the roadmap was drafted and reviewed with AI assistance and that the author has read it and takes responsibility.
