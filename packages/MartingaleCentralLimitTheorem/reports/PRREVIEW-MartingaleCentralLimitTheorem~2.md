# Review of MartingaleCentralLimitTheorem (pull request #2685 at 985ee7c)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, since the three supplier citations into MarkovChainsAndRenewal now name layer and subject and resolve both on main and at the head of that roadmap's open revision, and the repair introduced no new problem. The new sentence identifying Mathlib's counting-measure irreducibility with the supplier's was checked against the definition at the pin and is true. One small correction is carried over (existence of a solution of the Poisson equation is still handed to a roadmap that is not named) and there is one format note; neither blocks. For the human reviewers, the questions of the previous review stand: headline theorems 1.3 and 2.3 carry attributions without locators.

## C01 — Existence of a solution of the Poisson equation is still "left to other roadmaps" with no roadmap named

The last bullet under "Left to other roadmaps" (`TauCetiRoadmap/MartingaleCentralLimitTheorem/README.md`, lines 448–451) is unchanged: it assigns existence and uniqueness of `g` to "the theory of the asymptotic variance of Markov chain Monte Carlo", which no roadmap on main or open owns, so a reader who has `f` but no `g` cannot apply 4.1 and has nowhere to look. On a finite irreducible chain existence is short: harmonic functions are constant, so `I − P` has rank `|S| − 1`, and its range lies in `{h : E_π h = 0}` because `π (I − P) = 0`, hence equals it. Would you either add this to 4.1 (every `f` has a solution, unique up to a constant), keeping the autocovariance, spectral and Peskun material outside, or move the bullet to "Outside the scope"? The pull request description has the same sentence ("left to a roadmap on the asymptotic variance of Markov chain Monte Carlo") and would follow.

## N01 — One line of the route of 4.1 runs to 111 characters

Line 378 (the clause ending "`E_π h = E_π[g²] − E_π[(P g)²]` by") was not rewrapped after the citation was reworded; the rest of the file stays within 100.

## Previous findings

- R01 — repaired: "MarkovChainsAndRenewal Layer 2, class properties and occupation frequencies (items 3 and 4; 2.3 and 2.4 in the sectioned numbering), and Layer 3, invariant probabilities (item 2; 3.2)"; the description names the open revision.
- C01 — repaired: "an almost everywhere strongly measurable, almost everywhere invariant function into a nonempty metrizable space is almost everywhere constant", which is the lemma at the pin.
- C02 — not repaired: "belong to the theory of the asymptotic variance of Markov chain Monte Carlo, not to this roadmap; 4.1 takes a solution `g` as a hypothesis". Written again as C01 above.
- N01 — repaired: "`Kernel.IsIrreducible Measure.count κ` is that roadmap's irreducibility (every pair of states communicates): a set has positive counting measure exactly when it is nonempty."
- N02 — repaired: "*Needs:* Mathlib `MeasureTheory.condExp`. (Durrett's induction on `N`.)"
- N03 — repaired: "Cited for attribution." and "Cited for attribution, as Durrett attributes them."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 4.1 Gordin (cited by every changed supplier passage) | two-state `p = 1/3`, `q = 1/2`, `f = 1_a` | `π = (3/5, 2/5)`; `pq(2−p−q)/(p+q)³ = (1/6)(7/6)(216/125) = 42/125` | agrees with the Check; statement untouched by the diff | none |
| New sentence of 4.1: count-irreducibility = communication of every pair | flip chain; the reducible three-state chain of the Check; a nonempty `A` | flip: `κ⁰(a,{a}) = 1`, `κ¹(a,{b}) = 1`; reducible: `κⁿ(a,{b}) = 0` for all `n` with `count{b} = 1`; `count A > 0` iff some `y ∈ A`, then `κⁿ(x,A) ≥ κⁿ(x,{y})` | equivalent; both definitions allow `n = 0` | none |
| Supplier citations (previous R01) | main; head of the open revision | main: Layer 2 item 3 (line 211), item 4 (line 221), Layer 3 item 2 (line 239); revision: `2.3 Class properties`, `2.4 Occupation frequencies`, `3.2 Invariant probabilities and Kac's formula` | resolve in both | none |
| Gloss of `Ergodic.ae_eq_const_of_ae_eq_comp_ae` (previous C01) | hypotheses at the pin | `AEStronglyMeasurable g μ`, `g ∘ f =ᵐ[μ] g`, `[MetrizableSpace X] [Nonempty X]`, conclusion `∃ c, g =ᵐ[μ] const α c` | gloss matches | none |
| 1.2 Dvoretzky, *Needs:* line | the statement's objects | events adapted to one filtration, `𝒢₀`-measurable `δ`; no array, no martingale difference | 1.1 rightly dropped; Durrett-PTE5 line 19025 unchanged | none |
| Poisson equation (C01) | finite irreducible chain | `ker(I − P)` = constants, so rank `|S| − 1`; range `⊆ {E_π h = 0}`, of the same dimension | every `f` has a solution, unique up to a constant | C01 |

The rows for the untouched statements (1.1, 1.3, 2.1, 2.2, 2.3, 3.1, 3.2) stand as in the previous review, of `062c1b4`.

- Source locators checked against the text: 2 in the changed passages (Durrett-PTE5 line 19025, Lemma 8.2.7; line 19256, Example 8.3.4); both as cited.
- Library declarations opened at the pin: 3 (`ProbabilityTheory.Kernel.IsIrreducible`, `Mathlib/Probability/Kernel/Irreducible.lean` line 56; `Ergodic.ae_eq_const_of_ae_eq_comp_ae`, `Mathlib/Dynamics/Ergodic/Function.lean` line 107; `Ergodic.ae_eq_const_of_ae_eq_comp₀`, same file, line 71).
- Cross-roadmap citations resolved: 3 into MarkovChainsAndRenewal, each on main and at the head of its open revision.
- Dependency check: `depcheck: 185 roadmaps, 2062 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean` with `lake env lean`: `sorry` the only warning (5 theorems). The diff touches no Lean file, so signatures and the one-tactic probe stand as in the previous review.
- Pull request text read against the head: no sentence contradicted; it states the citation by layer and subject and names the open revision of MarkovChainsAndRenewal.

Overlap check: read SeriesOfIndependentRandomVariables, MarkovChainsAndRenewal (main and its open revision), LocalLimitTheorems, MarkovChainMixing, Exchangeability, StochasticCalculus as in the previous review, and MarkovChainsAndRenewal again at both heads; nothing shared (the occupation ergodic theorem and the stationary law are owned by MarkovChainsAndRenewal and cited).

Source independence: changed passages only; 3 passages compared with 1 source (Durrett-PTE5), none shared; largest share Durrett-PTE5, 9 of 9 locators; the diff adds, removes and reorders no layer, so the arrangement was not compared again (independent in the previous review).

Research link: the headline targets are the theorems of McLeish (1974), Brown (1971), Billingsley (1961), Ibragimov (1963) and Gordin (1969), as the README's References and Durrett-PTE5 §8.2–8.3 (lines 19112, 19130) attribute them; the README's scope names Markov chain Monte Carlo asymptotic variance as the consuming theory.

## Not verifiable

- McLeish (1974), Brown (1971), Hall and Heyde (1980): attributions of 1.3, 2.2 and 2.3 without locators; not readable in the previous review and not tried again, since the change does not bear on them.
- Billingsley (1961), Ibragimov (1963), Gordin (1969): attributed through Durrett; the papers themselves were not opened.

## Source issues

- none

## For the human reviewers

- Licence: the only text read is Durrett's fifth edition as posted on the author's Duke page (the cited `services.math.duke.edu` address redirects to `sites.math.duke.edu`); classed as an author page.
- Not tested: headline theorems 1.3 and 2.3 and the comparison 2.2 have no source locator; McLeish, Brown and Hall–Heyde were read neither by the author nor in review. The routes given were checked step by step in the previous review.
- Scope: the pull request description states that the roadmap was drafted and reviewed with AI assistance and that the author has read it and takes responsibility.
