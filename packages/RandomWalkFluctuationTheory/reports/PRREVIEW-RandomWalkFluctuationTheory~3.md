# Review of RandomWalkFluctuationTheory (pull request #2693 at 9bdfdf4)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the last review, and the pull request's title and description, read sentence by sentence against this head, now agree with it; the one small correction of the previous review (the scope sentence on general step laws and the date of the Lyons–Peres copy) is repaired in the description. There are no findings, no small corrections and no format notes. The three points for the human reviewers stand (classical, textbook-sourced scope; the status of the two source copies).

## Previous findings

- C01 — repaired: the description now reads "the finer theory of walks with general step laws", cites Lyons–Peres as "the corrected and updated edition on the first author's site", and lists `rademacherMeasure` and `hasLaw_randomizedChain` among what Tau Ceti supplies.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 1.2 reflection principle, as the description states it (`a ≥ 0`, `b ≤ a`) | all paths: `n=6,a=2,b=0`; `n=6,a=2,b=2` (`b = a`); `n=5,a=0,b=−3` | `3/32 = 3/32`; `15/64 = 15/64`; `5/32 = 5/32` (symmetry) | holds; description, README 1.2 and the Lean binders (`n a : ℕ`, `b ≤ a`) agree |
| 1.3 ballot theorem, "valid for every `n` and `k`" | all paths: `(n,k) = (0,0), (6,2), (7,3), (5,0), (3,5)` | `0 = 0`; `15/32 = 15/32`; `63/128 = 63/128`; `0 = 0`; `0 = 0` | holds, including `n = 0`, wrong parity and `k > n` |
| 2.1 and 2.2 laws, both `u₂ₖ u₂ₙ₋₂ₖ`; "avoiding zero is the case `k = 0`" | all 64 paths, `n = 3`, `k = 0..3` | last zero `5/16, 3/16, 3/16, 5/16`; time positive the same; products the same; `P(S₁..S₆ ≠ 0) = 5/16 = u₆` | holds; the `k = 0` case is the avoiding-zero identity |
| 3.2 return criterion "for independent steps with any common law on `ℤ^d`" | `μ{1}=2/3, μ{−1}=1/3`, 300 terms exact | `∑ C(2n,n)(2/9)ⁿ = 3.000`, so `ρ = 2/3 < 1` | README 3.2 states it at that generality; description agrees |
| Description: "7 headline theorems … 7 definitions … one Tau Ceti module" | count of declarations and imports in `Suggested.lean` | 7 theorems with `sorry`; `signLaw`, `latticeStepLaw`, `walk`, `IsSimpleRandomWalk`, `IsLatticeWalk`, `lastZero`, `timePositive`; imports `Mathlib` and `TauCeti.Probability.Distributions.Arcsine.Basic` | agrees |

The rows for the untouched statements stand as in the previous review, of `9bdfdf4`.

- The description against the head: every supplier it names is in the README's supplier contracts; its cross-roadmap section numbers resolve on main (StochasticCalculus 1.5, 2.3, 6.2, 6.4; MathematicalStatisticsNonparametric 3.5; StandardDistributions 10.20; MarkovChainsAndRenewal Layers 0 and 2, on main and at the head of its open revision); its Durrett and Lyons–Peres locators are those of the README's References; its out-of-scope list is a subset of the README's; the topic `math.PR` is the one the folder's metadata records. The title describes the change (a new roadmap; nothing removed or renumbered).
- Source locators checked against the text: none new this round (no passage changed). Lyons–Peres pp. 38 and 41 stand as read in the previous review.
- Library declarations: none newly cited; those opened at the pin in the previous review stand.
- Cross-roadmap citations resolved: 7 section or layer ids on main, 1 at an open head; ElectricalNetworksAndRandomWalks' scope sentence excluding infinite networks, recurrence, transience and lattice walks confirmed at its open head.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no upward or cyclic edge.
- Automatic checks: all passed at this head. Elaboration of `TauCetiRoadmap/RandomWalkFluctuationTheory/Suggested.lean`: 7 `sorry` warnings and nothing else. The definitions `lastZero` and `timePositive` carry no measurable-space binder in their elaborated types; they bind their own `Ω` and use no measurability, so no hypothesis is lost.
- No change outside the folder.
- Overlap check: read MarkovChainsAndRenewal, ElectricalNetworksAndRandomWalks, SeriesOfIndependentRandomVariables, MartingaleCentralLimitTheorem, LocalLimitTheorems, DysonBrownianMotion (the last four as read in the previous review; the folder is unchanged); the recurrence criterion for Markov chains through the Green function is owned by MarkovChainsAndRenewal Layer 2 (cited), the Rademacher law by Tau Ceti and StandardDistributions (cited); nothing else shared.

Source independence: changed passages only: the folder has no changed passage, so 0 passages compared; Durrett remains the source with the largest share (29 of 33 locators in the layers) and was not reopened this round; no layer was added, removed or reordered, so the arrangement stands as compared in the first review: independent.

Research link: Durrett (2019), §8.1, derives the Brownian arcsine laws for the last zero and for occupation times from Theorems 4.9.5 and 4.9.6 by Donsker's theorem; Lyons–Peres (2016), Chapter 2, take Pólya (1921) as the model case of recurrence and transience of networks. This rests on the sources read; the README states no research use.

## Not verifiable

- Durrett's text was not reopened this round (it is not among the texts available to this review); no locator into it changed, and the description's Durrett locators are compared with the README's References only.
- The description's account of brute-force checks in Python (path lengths up to 14, `n` up to 5000) is the author's report of their own work; the identities were recomputed here on shorter paths only.
- Pólya 1921: marked in the README as not consulted; attribution only.

## Source issues

- none

## For the human reviewers

- **Scope.** Every headline is a classical result (ballot theorem 1878, Pólya 1921, the discrete arcsine laws), and 29 of the 33 locators in the layers go to one graduate textbook, Durrett §4.9 and §5.4; the README names no current research that uses them.
- **Licence.** Durrett's text is cited from the copy on the author's Duke page; the sources service did not classify that address as an author's page for this roadmap, though two other roadmaps' manifests record the same file as one.
- **Licence.** The Lyons–Peres copy read is the first author's online version dated 8 November 2016 (LyonsPeres line 5); neither the README nor the description now names a version date.
