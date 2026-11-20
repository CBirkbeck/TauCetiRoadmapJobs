# Review of RandomWalkFluctuationTheory (pull request #2693 at 480b7ad)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason: the return criterion of 3.2 is stated only for the simple lattice walk, although its cited source and its own route prove it for every step law on `ℤ^d`; the repair is a change of hypothesis in one section. Every other statement, Check and locator I tested holds: the seven Lean headlines were confirmed by exhaustive enumeration or exact computation, and all Durrett and Lyons–Peres locators were read at the page. There are two small corrections and one format note, none blocking, and three points for the human reviewers (the classical, textbook-sourced scope; the status of the two source copies).

## R01 (P2) — The return criterion of 3.2 is narrowed to the simple lattice walk, while the source and the route give it for every step law on `ℤ^d`

A consumer who needs the criterion for any other walk on `ℤ^d` (the asymmetric nearest-neighbour walk that MarkovChainsAndRenewal Layer 2 classifies, a lazy walk, a walk with a different finite step set) cannot use 3.2, and would have to prove the same identification of the path law a second time; a general library states it once. The text itself records the narrowing, in 3.2 (README lines 294 and 301–302): "under `IsLatticeWalk d P ξ` with `d ≥ 1`" and "(there for every random walk on `ℝ^d`)".

How I know that nothing in 3.2 uses the step law. Durrett, Theorem 5.4.3, p. 289, is stated for any random walk. The route of 3.2 uses only independence and a common law of the steps: `TauCeti.Probability.hasLaw_markovChainLaw_iff_prefixLaw_singleton` (`TauCeti/Probability/Process/MarkovChain.lean`, line 530) holds for every Markov kernel on a countable space with measurable singletons, and `ProbabilityTheory.Kernel.tsum_pow_apply_singleton_self_eq_top_iff` and `ProbabilityTheory.Kernel.ae_infinite_setOf_eq_markovChainLaw_dirac` (`TauCeti/Probability/MarkovChain/Visits.lean`, lines 266 and 235) hold for every Markov kernel with measurable singletons. An instance the general statement decides and 3.2 does not: on `ℤ` with `P(ξ = 1) = 2/3`, `P(ξ = −1) = 1/3`, `∑ₙ P(Sₙ = 0) = ∑ₙ C(2n, n)(2/9)ⁿ = 1/√(1 − 8/9) = 3`, so the return probability is `1 − 1/3 = 2/3 < 1`.

The smallest change: state 3.2 for steps `ξ i : Ω → Fin d → ℤ` that are independent (`iIndepFun ξ P`) with a common law `μ` (`HasLaw (ξ i) μ P`, `μ` a probability measure), with the translation kernel `x ↦ μ` shifted by `x`; both conclusions and the Check stay as they are, and 3.3 and 3.4 apply it at `μ = latticeStepLaw d`. Nothing in `Suggested.lean` changes. If one predicate "independent steps with law `μ`" is introduced for this, `IsSimpleRandomWalk` and `IsLatticeWalk`, which have the same two fields, would be its two instances; that part is an offer, not a requirement.

## C01 — The fair-sign law `signLaw` is Tau Ceti's Rademacher law on another carrier, and the README does not say so

A reader of "Scope and ownership" is told which library objects are used, and finds no mention of `TauCeti.Probability.rademacherMeasure` (`TauCeti/Probability/Distributions/Rademacher/Basic.lean`, line 31), the law with mass `1/2` at `−1` and at `1` on `ℝ`, with its masses, moments and characteristic function; StandardDistributions lists the same law among its discrete families. `signLaw` is that law on `ℤ`, and keeping it on `ℤ` is reasonable (the parity and counting arguments of Layers 1 and 2 are integer statements), but a kept variant should say in one clause how it differs. Add to the libraries paragraph of "Scope and ownership" that `signLaw` is the integer-valued form of `rademacherMeasure`, and record the comparison (the image of `signLaw` under the cast `ℤ → ℝ` is `rademacherMeasure`) as an API bullet of 1.1, so that results about real Rademacher sums and results here can be passed across.

## C02 — The first claim of 3.2 is close to a pinned theorem that the README does not cite

The route of 3.2 identifies the path law of the walk through finite-path masses. Tau Ceti already proves that a chain driven by independent noise with a common law has the law `markovChainLaw`: `TauCeti.Probability.hasLaw_randomizedChain` (`TauCeti/Probability/MarkovChain/Simulation.lean`, line 111), with initial sampler `g` and update `f`. The walk is the case `g = 0`, `f x u = x + u`, for every step law; it differs from 3.2 only in that it asks the noise variables to be measurable (not almost everywhere measurable) and consumes them from index `1`, so an index shift and a measurable modification are needed. The supplier contracts and the libraries paragraph of "Scope and ownership" should name it, either as an input of the route or with the one clause saying why the finite-path route is preferred.

## N01 — Two scope bullets describe the state of other roadmaps at the time of writing

"a roadmap not on main" (ElectricalNetworksAndRandomWalks) and "an open roadmap, not on main" (BernoulliPercolation), in "Scope and ownership", become false when those roadmaps merge. The boundary each bullet draws does not need the clause; "This roadmap does not depend on that one" already says what matters.

## Questions for the author

- The References give Lyons–Peres in "the corrected and updated edition … (version of 19 August 2026)". The copy I could read from the first author's site is dated 8 November 2016; in it Pólya's Theorem (first part) is on p. 38 and (second part) on p. 41, in §2.5, as cited. Is the 2026 date that of the file you read, and are the page numbers unchanged there? I could not open a copy with that date.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 1.1 binomial law, `u₂ₙ = C(2n,n)/4ⁿ` | `n = 1, 2, 3`; odd times | `u₂ = 1/2`, `u₄ = 3/8`, `u₆ = 5/16`; `u₃ = 0`; Durrett (4.9.1) p. 263 read | holds |
| 1.1 definitions `signLaw`, `walk`, `IsSimpleRandomWalk` | mass; variant without `½`; `walk ξ 0` | mass `1`; variant mass `2`; empty sum `0`; a.e.-measurable steps: events differ from measurable ones by null sets | determines the object |
| 1.2 reflection (`measure_exists_le_walk_and_walk_eq`) | all paths, `n ≤ 10`, `0 ≤ a ≤ n+1`, every `b ≤ a` | 0 mismatches; `n=4,a=1,b=0`: `1/4 = 1/4`; `b=2`: `1/4` vs `3/8` (hypothesis needed); `a=0`: symmetry | holds; Durrett Thm 4.9.1 p. 263 is `a ≥ 1`, `b < a` |
| 1.2 law of the maximum | `n ≤ 10`, `0 ≤ a ≤ n+1` | 0 mismatches; `n=4,a=1`: `5/8 = 5/16 + 5/16` | holds |
| 1.3 ballot (`natCast_mul_measure_forall_pos_and_walk_eq`) | all paths, `n ≤ 12`, `0 ≤ k ≤ n+2`, incl. `n = 0`, `k = 0`, `k > n`, wrong parity | 0 mismatches; `n=5`: `3/32, 5/32` and `1/16, 5/16`; `n=0,k=0`: `0·1 = 0·1` | holds; Durrett Thm 4.9.2 pp. 263–264 |
| 1.4 avoiding zero and first return | `n = 0..6`; horizon 3; `R = 2,4,6,8` | avoid `= u₂ₙ` all `n`; `2P(pos) = u₂ₙ` fails only at `n=0` (`2 ≠ 1`); nonneg `= u₂ₙ`; horizon 3: `1/2` vs `0`; `P(R=2n)`: `1/2, 1/8, 1/16, 5/128` | holds; Lemma 4.9.3 p. 264, (4.9.2) pp. 264–265 |
| 2.1 last zero (`measure_lastZero_eq`) | all paths `n ≤ 6`, `0 ≤ k ≤ n`; `n=1,k=2` | 0 mismatches; `n=2`: `3/8, 0, 1/4, 0, 3/8`; `P(L₁₄ ≤ 7) = 1/2`; `k>n`: `0` vs `3/8` | holds; Lemma 4.9.4 p. 265 |
| 2.2 time positive (`measure_timePositive_eq`) | all paths `n ≤ 6`; wrong variant (count of `S_k > 0`) | 0 mismatches, always even; variant at `n=2`: `3/8, 3/16, 1/8, 1/8, 3/16` (differs) | holds; definition matches Durrett Thm 4.9.6 p. 266 |
| 2.3 arcsine limit (`tendstoInDistribution_arcsine`) | `x = 1/4`, `n = 50, 500, 5000`; `n = 4`; unimodality `n < 40` | cdf `1/3`; `0.33518, 0.33425, 0.33343`; `35/128, 5/32, 9/64, 5/32, 35/128`; max atom `u₂ₙ → 0` so singletons and end intervals converge | holds; Thm 4.9.5 pp. 265–266 for `0<a<b<1` |
| 3.1 lattice step law and return formula | `d = 0, 2, 3, 4`; variant `d⁻¹`; exact dynamic programming, `2n ≤ 8` | `d=0`: zero measure; variant mass `2`; `d=2`: `1/4, 9/64`; `d=3`: `1/6, 5/72`; multinomial formula equal for `d=2,3,4` | holds; Durrett Example 5.4.2 p. 288, pp. 289–290 |
| 3.2 return criterion | `ρ = 1` and `ρ < 1`; asymmetric walk `p = 2/3` | sum `= 1/(1−ρ) ≥ 1`; asymmetric: sum `3`, `ρ = 2/3` (not covered by 3.2 as stated) | true as stated; narrowed (R01); Thm 5.4.3 p. 289 |
| 3.3 recurrence, `d = 2` (`ae_frequently_walk_eq_zero_two`) | `2n ≤ 8`; partial sums `N = 10, 100, 1000` | `P(S₂ₙ=0) = u₂ₙ²` exactly; sums `1.822, 2.535, 3.265` against `(log N)/π` | holds; Thm 5.4.4 p. 289; Lyons–Peres p. 38 |
| 3.4 transience, `d ≥ 3` (`measure_exists_walk_eq_zero_lt_one`) | `d=3` factorisation `2n ≤ 8`; `n·max weight`, `n ≤ 300`; sum over `2n < 500`; `d>3` comparison by holding times of mean `d/3` | factorisation exact; `0.8252 < 0.83`; `1.48686`, so `ρ ≥ 0.327`; comparison constant `d/3` re-derived | holds; Durrett p. 290; Lyons–Peres p. 41 |

- Source locators checked against the text: every Durrett locator the README gives (29 mentions, pp. 262–267 and 288–290) and 2 in Lyons–Peres (pp. 38 and 41, in a copy dated 8 November 2016); Pólya 1921 is attribution only and was not opened.
- Library declarations opened at the pins: 15 in Mathlib and 9 in Tau Ceti, all found in the files the supplier contracts name, with the stated hypotheses; two further Tau Ceti declarations found by object (`rademacherMeasure`, `hasLaw_randomizedChain`; C01, C02).
- Cross-roadmap citations resolved: MarkovChainsAndRenewal Layers 0 and 2 (on main, same layer numbers in its open revision), StochasticCalculus 1.5, 2.3, 6.2, 6.4, MathematicalStatisticsNonparametric 3.5, StandardDistributions 10.20 and its exclusion of Brownian arcsine theorems, the scope lines of ElectricalNetworksAndRandomWalks and BernoulliPercolation at their open heads.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no upward or cyclic edge; the roadmap names no roadmap as a supplier.
- Elaboration of `TauCetiRoadmap/RandomWalkFluctuationTheory/Suggested.lean`: 7 `sorry` warnings and nothing else. Elaborated types of all 14 declarations compared with the README statements: equal; `lastZero` and `timePositive` bind their own `Ω` and need no measurable structure, so nothing was lost.
- One-tactic probe on a scratch copy (`simp`, `rfl`, `infer_instance`, `norm_num` and `simp` with the definitions unfolded): none of the 7 theorems closes. No padding; all 7 README headlines are stated, none through a stand-in.
- No change outside the folder; no `set_option`, no sorried data, imports are `Mathlib` and one existing Tau Ceti module.
- Overlap check: read MarkovChainsAndRenewal, ElectricalNetworksAndRandomWalks, LocalLimitTheorems, PopulationDynamics, MartingaleCentralLimitTheorem; the recurrence criterion through the Green function and the walk on `ℤ` are owned by MarkovChainsAndRenewal Layer 2 (cited, not restated); the Rademacher law is owned by StandardDistributions and Tau Ceti (C01); nothing else shared.

Source independence: 14 passages compared with 2 sources, none shared beyond formulas and runs of at most 5 words; largest share Durrett, 29 of 33 locators in the layers; contents compared with Durrett: independent (three layers against two sections, §4.9 and the first three pages of §5.4; the order 1.2 → 1.3 → 1.4 → 2.1 → 2.3 is forced by the `*Needs:*` lines, 2.2 is placed before the limit unlike the source, and the law of the maximum, the Markov-chain form of 3.2 and the Green-sum comparison of 3.4 are not in the source).

Research link: Durrett (2019), §8.1, derives the Brownian arcsine laws for the last zero and for occupation times from Theorems 4.9.5 and 4.9.6 by Donsker's theorem; Lyons–Peres (2016), Chapter 2, take Pólya (1921) as the model case of recurrence and transience of networks. This rests on the sources read; the README states no research use.

## Not verifiable

- The Lyons–Peres version of 19 August 2026 named in the References: the copy readable from the first author's site is dated 8 November 2016; the two locators agree with it.
- Pólya 1921: the README marks it as not consulted; it is cited for attribution only and was not read.
- Ownership against open pull requests was checked through the search over open heads; none of the five closest open roadmaps was available as a checkout, so they were read through that tool only.

## Source issues

- **Misprint** in Durrett at proof of Theorem 4.9.2, p. 263: the source says the paths from (1,1) to (n,x) that vanish somewhere "the number" of paths from (1,−1), with no verb; it should be "is equal to the number"; affects nothing.
- **Misprint** in Durrett at proof of Theorem 4.9.5, p. 266: the source says the step function is n times the probability that the last zero equals k; it should be that it equals 2k; affects nothing.
- **Misprint** in Durrett at Example 5.4.2, p. 288: the source says "Markov pfroperty"; it should be "Markov property"; affects nothing.

## For the human reviewers

- **Scope.** Every headline is a classical result (ballot theorem 1878, Pólya 1921, the discrete arcsine laws), and 29 of the 33 locators in the layers go to one graduate textbook, Durrett §4.9 and §5.4; the README names no current research that uses them.
- **Licence.** Durrett's text was read from the copy on the author's Duke page, which the sources service did not classify for this roadmap; two other roadmaps' manifests record the same file as an author's page.
- **Licence.** The Lyons–Peres copy read is the first author's online version dated 8 November 2016, not the 19 August 2026 version the README names.
