# Review of RandomWalkFluctuationTheory (pull request #2693 at 9bdfdf4)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired. The return criterion of 3.2 is now stated for independent steps with any common law on `ℤ^d`, its new Check (the walk with `μ{1} = 2/3`) was recomputed, and the two small corrections and the format note of that review are also repaired, with the library declarations they name confirmed at the pin. There is one small correction, to the pull request's description, which is not blocking; the three points for the human reviewers stand (classical, textbook-sourced scope; the status of the two source copies).

## C01 — Two sentences of the pull request's description no longer agree with the README

A reader of the description is told two things the head does not say. First, "Out of scope: walks with general step laws (Chung–Fuchs, Sparre Andersen, Spitzer)" stands beside the description's own sentence that the return criterion is "stated for independent steps with any common law on `ℤ^d`"; the README's scope paragraph (line 448) now reads "the finer theory of walks with general step laws", and the description would say the same. Second, the description gives Lyons–Peres as "version of 19 August 2026", a date the References (line 521) no longer carry; the copy on the first author's site that I read is dated 8 November 2016, and in it both parts of Pólya's Theorem are on the pages cited (pp. 38 and 41). Drop the date from the description or give the date of the file read.

The description's list of what Tau Ceti supplies could also name the two declarations the README now cites, `rademacherMeasure` (compared with `signLaw` in 1.1) and `hasLaw_randomizedChain` (named in the route of 3.2 as the route not taken).

## Previous findings

- R01 — repaired: 3.2 now reads "Let the steps `ξ i : Ω → Fin d → ℤ` be independent (`iIndepFun ξ P`) with a common law `μ`", with kernel `κ_μ`; 3.3 and 3.4 use the case `μ = latticeStepLaw d`.
- C01 — repaired: 1.1 has the bullet "its image under the cast `ℤ → ℝ` is `TauCeti.Probability.rademacherMeasure`"; the scope paragraph and the supplier contracts name the law and say why `signLaw` stays on `ℤ`.
- C02 — repaired: the route of 3.2 names `hasLaw_randomizedChain` and says why the finite-path route is followed (almost everywhere measurable steps); the supplier contracts list it with its file.
- N01 — repaired: the two scope bullets no longer say which roadmaps are on main.
- Question on the Lyons–Peres date — repaired in the README (the date is gone from the References); it remains in the description (C01).

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 3.2 return criterion, any step law `μ` on `ℤ^d` (changed) | `μ{1}=2/3, μ{−1}=1/3`; `μ = δ₀`; `μ = δ₁`; `d = 0`; simple walk `d = 1` | sum `3`, `ρ = 1 − 1/3 = 2/3 = 1 − |p − q|`; sum `∞`, `ρ = 1`; sum `1`, `ρ = 0`; one-point lattice: sum `∞`, `ρ = 1`; `∑ u₂ₙ = ∞`, `ρ = 1` | iff holds in both directions; `1/(1−ρ)` Check holds in all five |
| 3.2 new Check (asymmetric walk) | 400 terms of `∑ C(2n,n)(2/9)ⁿ` in exact arithmetic | `3.0000…`; closed form `1/√(1 − 8/9) = 3` | holds; agrees with MarkovChainsAndRenewal's "asymmetric walk transient" |
| 3.2 route and the remark on `hasLaw_randomizedChain` | hypotheses read at the pin; walk as `g = 0`, `f x u = x + u` | theorem asks `∀ i, Measurable (U i)`; update uses `u (n+1)`, `g` uses `u 0`; `ρ.map g = δ₀`, `ρ.map (f x) = κ_μ x` | the remark is accurate; the prefix-law theorem asks only `AEMeasurable (X n)` |
| 1.1 new bullet, `signLaw` against `rademacherMeasure` (changed) | image of `½(δ₁ + δ₋₁)` under the cast | `½ δ₁ + ½ δ₋₁` on `ℝ`, which is `rademacherMeasure_eq` | holds |

The rows for the untouched statements stand as in the previous review, of `480b7ad`.

- Source locators checked against the text: Lyons–Peres, Pólya's Theorem (first part), printed p. 38 (LyonsPeres line 2511) and (second part), printed p. 41 (LyonsPeres line 2672), in the copy dated 8 November 2016 (LyonsPeres line 5). Durrett could not be reopened this round (see below).
- Library declarations opened at the pin: `TauCeti.Probability.rademacherMeasure` and `rademacherMeasure_eq` (`TauCeti/Probability/Distributions/Rademacher/Basic.lean`, lines 31 and 35); `hasLaw_randomizedChain` (`TauCeti/Probability/MarkovChain/Simulation.lean`, line 111); `hasLaw_markovChainLaw_iff_prefixLaw_singleton` (`TauCeti/Probability/Process/MarkovChain.lean`, line 530); `tsum_pow_apply_singleton_self`, `tsum_pow_apply_singleton_self_eq_top_iff`, `ae_infinite_setOf_eq_markovChainLaw_dirac` (`TauCeti/Probability/MarkovChain/Visits.lean`).
- Cross-roadmap citations: the change adds none; a search of the roadmaps on main and the open heads for general random walks on `ℤ^d` and the Chung–Fuchs theorem found no other owner of the criterion for walks.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no upward or cyclic edge.
- Automatic checks: all passed at this head. Elaboration of `TauCetiRoadmap/RandomWalkFluctuationTheory/Suggested.lean`: 7 `sorry` warnings and nothing else; the file is unchanged since `480b7ad`, so the signature comparison and the one-tactic probe of the previous review stand.
- No change outside the folder.
- Overlap check: read MarkovChainsAndRenewal, ElectricalNetworksAndRandomWalks, SeriesOfIndependentRandomVariables, MartingaleCentralLimitTheorem, LocalLimitTheorems, DysonBrownianMotion; the recurrence criterion for Markov chains through the Green function is owned by MarkovChainsAndRenewal Layer 2 (cited; 3.2 is its application to walks with independent steps), the Rademacher law by Tau Ceti and StandardDistributions (now cited); nothing else shared.

Source independence: changed passages only: 6 passages compared with 1 source (Lyons–Peres §2.5), none shared; Durrett, the source with the largest share (29 of 33 locators in the layers), could not be reopened this round, and the changed sentences that cite it restate only the theorem number and page read in the previous review; no layer was added, removed or reordered, so the arrangement stands as compared there: independent.

Research link: Durrett (2019), §8.1, derives the Brownian arcsine laws for the last zero and for occupation times from Theorems 4.9.5 and 4.9.6 by Donsker's theorem; Lyons–Peres (2016), Chapter 2, take Pólya (1921) as the model case of recurrence and transience of networks. This rests on the sources read; the README states no research use.

## Not verifiable

- Durrett, Theorem 5.4.3, p. 289, and (4.9.1), p. 263, were not reopened: the sources service did not accept the Duke address as an author's page this round. The previous review read both at the page, and the change alters neither locator.
- Pólya 1921: marked in the README as not consulted; attribution only.

## Source issues

- none

## For the human reviewers

- **Scope.** Every headline is a classical result (ballot theorem 1878, Pólya 1921, the discrete arcsine laws), and 29 of the 33 locators in the layers go to one graduate textbook, Durrett §4.9 and §5.4; the README names no current research that uses them.
- **Licence.** Durrett's text is cited from the copy on the author's Duke page; the sources service did not classify that address as an author's page for this roadmap, though two other roadmaps' manifests record the same file as one.
- **Licence.** The Lyons–Peres copy read is the first author's online version dated 8 November 2016 (LyonsPeres line 5); the README no longer names a version date, the pull request's description still says 19 August 2026.
