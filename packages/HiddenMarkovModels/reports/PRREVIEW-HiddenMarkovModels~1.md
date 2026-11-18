# Review of HiddenMarkovModels (pull request #2495 at bac6187)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed, on the README's four small models and on some 7000 random models with zero probabilities in exact arithmetic, and all 30 locators into van Handel's notes were read against the text; the statements, their hypotheses and the worked values all hold. There is one format note (two primary sources named in prose but missing from the References), none blocking. For the humans: Rabiner 1989 is paywalled and its equation numbers were not checked, and the source cited most is a set of unpublished lecture notes.

## N01 — Baum–Petrie–Soules–Weiss and Dempster–Laird–Rubin are named in 5.1 and 5.3 but are not in the References

The sentences "The inequality goes back to Baum, Petrie, Soules and Weiss" (5.1, line 812) and "the EM algorithm of Dempster, Laird and Rubin" (5.3, line 935) attribute the two results of Layer 5 to papers the reference list does not contain, so the only locators for Baum's inequality and for monotonicity are a tutorial and lecture notes. Adding the two entries (L. E. Baum, T. Petrie, G. Soules, N. Weiss, Ann. Math. Statist. 41 (1970), 164–171; A. P. Dempster, N. M. Laird, D. B. Rubin, J. Roy. Statist. Soc. Ser. B 39 (1977), 1–38), with a theorem locator in the first if the author has the text, would give Layer 5 a refereed primary source. I did not open either paper.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `jointDensity`, `HMM`, `ofPMF` | `E`, `y=(a,a,b)`, paths `(0,0,0)`, `(0,1,1)`; sum over 8 paths; sum over all `x`, `y` | `81/2048`, `27/2048`; old-state variant gives `81/2048` on second path; `15/128`; total `1` | agrees with README | none |
| 1.2 `pairKernel`, `jointLaw`, `jointLaw_map_states`, `jointLaw_map_prefix` | `E` from `(0,a)`; frozen model; `trans²` row 0 | masses `9/16, 3/16, 1/16, 3/16`; `7/10` vs `1/2`; `5/16` vs `1/4`; `(5/8, 3/8)` | agrees; Tau Ceti lemmas exist with stated hypotheses | none |
| 1.3 `jointLaw_prefix_apply` | `B` a singleton in `E`; `B = univ`; `n = 0` | `81/2048`; `init·∏trans` since each `dens s` integrates to `1`; `init s·∫_C dens s` | agrees; σ-finite hypothesis present in Lean | none |
| 2.1 `forward`, `likelihood`, `forward_eq_tsum`, `likelihood_eq_matrix`, `jointLaw_map_obs` | `E` along `(a,a,b)`; 3000 random models, `n ≤ 3` | forward `(3/8,1/8)`, `(15/64,3/64)`, `(3/64,9/128)`; likelihoods `1/2, 9/32, 15/128`; path sum equals likelihood in all 3000; wrong order `5/16` | agrees | none |
| 2.2 `filter_succ`, `likelihood_eq_prod_normalizer` | `E`; random models with zero likelihood; `S = ℕ` example with likelihood `⊤` | filters `(3/4,1/4)`, `(5/6,1/6)`, `(2/5,3/5)`; normalizers `1/2, 9/16, 5/12`, product `15/128`; `⊤` case: left `1`, right `0`; product `⊤·0 = 0` vs `⊤` | holds with `≠ ⊤`; fails without, as README says | none |
| 2.3 `condDistrib_state_eq_filter`, `condDistrib_state_eq_predict` | `E` given `(a,a)`; `k = 0, 1` | `(15/64)/(9/32) = 5/6`; prediction `2/3`; next observation `7/12`; one step earlier `5/8` | agrees; `Nonempty S` in signature; reduction to σ-finite `ref` checked (`{dens s > 1/k}` has finite measure) | none |
| 3.1 `backward`, `tsum_forward_mul_backward` | `E`, `(t,k) = (0,2), (1,1)`; all `t ≤ n` on 3000 random models | `(1/4, 3/16)`, `(3/8, 5/8)`; `3/8·1/4 + 1/8·3/16 = 15/128`; identity exact in every random case | agrees | none |
| 3.2 `smooth`, `smoothPair`, three `condDistrib` statements | `E`, `n = 2`; frozen model; `t > n`; enumeration of path marginals on random models | `(4/5,1/5)`, `(3/4,1/4)`, `(2/5,3/5)`; pair rows `(27/40,1/8)`, `(3/40,1/8)`; `27/80`; `t>n`: `(15/32,3/32)`; marginals equal `smooth` | agrees; `t ≤ n`, `t < n` in Lean | none |
| 4.1 `viterbi`, `viterbi_eq_iSup`, `viterbiLog_eq` | `E`; max over paths on random models; `S = ℕ` with supremum `⊤` | `(3/8,1/8)`, `(27/128,3/128)`, `(81/2048,81/2048)`; old-state variant `9/128`; `max viterbi n = max jointDensity` in all cases; terms `2^(s−1)` unbounded | agrees | none |
| 4.2 `IsViterbiPath.isGreatest`, `exists_isViterbiPath`, `isViterbiPath_of_isGreatest` | `E`, `U`, dead-end `D` along `(a,b)`, three-state model, 3000 random models | `E`: `(0,0,0)`, `(0,0,1)`; `U`: all four; `D`: `(0,0)`, `(0,1)`, and `(1,0)` a maximizer that is not one; three-state: only `(0,0)`; random: Viterbi paths = maximizers when max `> 0` | agrees; positivity hypothesis necessary | none |
| 5.1 `auxiliary`, `auxiliary_sub_le` | `E`, its update; `U` with `M'` killing all paths; random competitor models | `−0.436470`, `−0.400776`; without hypothesis left `log 2 = 0.693` > right `0.347`; inequality held in every random case with hypothesis | agrees | none |
| 5.2 `transCount`, `emitCount`, `IsBaumWelchStep`, `auxiliary_le_of_isBaumWelchStep` | `E`; `U` along `(a,a)`; random models with zero rows and arbitrary fill-in rows | counts `(21/20,1/2;1/10,7/20)`, `(31/20,2/5;9/20,3/5)`; update `(4/5,1/5)`, `(21/31,10/31)`, `(2/9,7/9)`, `(31/39,8/39)`, `(3/7,4/7)`; update keeps paths and beats every path-keeping competitor | agrees | none |
| 5.3 `likelihood_le_of_isBaumWelchStep` | `E`; `U`; 3000 random models; 1154 with equal likelihoods | `15/128 → 501892/2906631`; `1/4 → 1`; never decreased; in all 1154 equality cases the model is its own update; `dens = 2` model: `2^(n+1) → 1` | agrees; `ofPMF` hypothesis necessary | none |
| 6.1 `tsum_abs_bind_sub_le` | two-state extremal example; `ε = 0, 1`; 4000 random kernels | left `2(1−ε)` = right; `ε = 1` both `0`; no random violation | agrees; sharp | none |
| 6.2 `tsum_abs_filter_sub_le` | README two-state model; upper-bound counterexample; 4000 random mixing models with vanishing densities, `0 ≤ l ≤ k ≤ 4` | distances `2, 18/35, 162/1457, 1458/63539` below `9/2, 5/2, 25/18, 125/162`; without upper bound `200/109 > 38/81`; no random violation; reweighting constant `sup β / inf β` proved by hand | agrees; all four likelihood hypotheses needed | none |

- Source locators checked against the text: 30 of 30 into van Handel 2008 (Definitions 1.6, 1.9, 2.8, 2.11; Lemmas 1.8, 5.2, 5.3, 6.10; Theorems 2.7, 2.9, 2.12, 2.14, 3.2, 3.6, 4.5, 5.4; Corollaries 2.10; Proposition 6.11; Algorithms 3.1, 3.4; Sections 3.1, 3.2, 5.2); 0 of 12 into Rabiner 1989.
- Library declarations opened at the pins: 41 Mathlib and Batteries declarations in the files the README names (for example `condDistrib_ae_eq_of_measure_eq_compProd` at `Mathlib/Probability/Kernel/CondDistrib.lean:164`, `posterior_eq_withDensity_of_countable` at `Mathlib/Probability/Kernel/Posterior.lean:297`, `ENNReal.mul_iSup` at `Mathlib/Basic/ENNReal/Inv.lean:816`); 9 Tau Ceti declarations (`Kernel.ofPMF` at `TauCeti/Probability/Kernel/PMF.lean:44`, `markovChainLaw` and six lemmas at `TauCeti/Probability/Process/MarkovChain.lean:161–437`). All present with the hypotheses the README states.
- Cross-roadmap citations resolved on main: 4 of 4 (MarkovChainsAndRenewal Layer 3 item 5; MathematicalStatisticsSemiparametric Layer 7, whose inequality assumes positive densities; StandardDistributions §5.4; MarkovDecisionProcesses scope).
- Duplication by object: no hidden Markov model, forward or Viterbi recursion, Baum–Welch update, minorization contraction or filter stability in the pinned Mathlib or Tau Ceti, on main, or in the open roadmap pull requests searched.
- Dependency check: `depcheck: 217 roadmaps, 2335 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/HiddenMarkovModels/Suggested.lean` under the defaults: 24 `sorry` warnings, nothing else. Elaborated types of all 45 declarations compared with the README statements: every instance and hypothesis is carried; nothing changed.
- Padding probe: none of the 24 theorems closes by `rfl`, `simp` or `infer_instance`. Headline theorems of the README: all are stated in the Lean file; none is declared not statable.
- Automatic checks: all passed. Pull request title and description agree with the head (new roadmap, 24 theorems, suppliers as listed).

Overlap check: read PointProcesses, MultiArmedBandits, ClassicalErgodicTheory, MarkovDecisionProcesses, DenoisingDiffusion, MathematicalStatisticsSemiparametric (and MarkovChainsAndRenewal, which is cited); nothing shared. The general EM inequality stays with MathematicalStatisticsSemiparametric Layer 7 for positive densities; Layer 5 here states the hidden-Markov case with zero probabilities, which that inequality does not cover, and says so in its scope.

Source independence: 21 passages compared with 1 source (van Handel 2008: the 15 sampled sections at their locators and 6 further passages — the definition of a model, the routes of 5.2, 6.1 and 6.2, the backtracking rule of 4.2, the docstring of `tsum_abs_filter_sub_le`), none shared beyond standard terms; largest share van Handel 2008, 30 of 42 locators; contents compared with van Handel 2008: independent (Layers 2 and 3 split its Chapter 2 and Section 3.1 by subject, Layer 5 precedes Layer 6 where its Chapter 6 follows Chapter 5, its Chapters 4 and 7 are unused). Rabiner 1989 could not be read.

Research link: Layers 2 and 6 are the inputs to consistency of the maximum likelihood estimator and to uniform-in-time bounds for particle filters (van Handel 2008, §5.3 and Ch. 7); Layer 5 is the theorem of Baum, Petrie, Soules and Weiss (1970) and the hidden-Markov case of Dempster, Laird and Rubin (1977). Rests on the README and van Handel 2008.

## Not verifiable

- Rabiner 1989, all 12 equation locators ((12)–(15), (18)–(21), (23)–(27), (30)–(42), (91)–(103), (105a)–(105c)) and the remark on equation (41) in the Checks of 5.1: the article is behind the publisher's paywall (looked at the DOI's landing page only); every statement they accompany was verified independently by computation and against van Handel 2008.

## Source issues

- **Gap** in vanHandel2008 at Theorem 5.4, proof, printed page 71: the source says the reweighting bound with constant sup β / inf β follows as in step 2 of the proof of Theorem 4.5, which yields twice that constant; it should be derived using that the two measures have equal mass, which gives the stated constant; affects the proof.

## For the human reviewers

- Scope: the source with the largest share (30 of 42 locators) is van Handel's 2008 Princeton lecture notes, unpublished; the other is a tutorial article (Proc. IEEE 1989). The refereed primary papers are named in 5.1 and 5.3 but not in the References.
- Licence: van Handel's notes were read from the author's Princeton course page, which I classed as an author page; no licence is stated in the file.
- Not tested: Rabiner 1989 could not be read legally, so wording and equation numbers were not compared with it (12 of 42 locators).
