# Review of HittingAndCoverTimes (pull request #2796 at b90373a)

**Verdict:** accepted

**Summary.** Accepted: the 24 changed lines repair four of the five remarks of the previous review in full and the fifth in part, change no statement, and introduce nothing false. There are no findings; two small corrections remain (the new citation of Norris in 1.2 says in the roadmap that the book was not opened and is absent from the References; the description still says that 1.2 is "attributed in prose") and no format note. The humans who approve decide the same two questions as before: the standing of the unfinished Aldous–Fill monograph as the only locator for 2.1, and merging behind three open supplier roadmaps.

## C01 — The new locator for 1.2 is a section of a book the README says was not opened, and the book is not in the References

In 1.2 (README lines 103–105) the least-solution theorem now cites "J. R. Norris, *Markov chains* (Cambridge University Press, 1997), Section 1.3, cited here without a theorem number because the text was not opened for this roadmap". An implementer still has no statement to compare with, only a section, and the closing clause describes how the roadmap was written, which a reader a year from now cannot use. The work is also missing from `## References`, where the other three sources are listed with their editions.

This review could not read the book either (see "Not verifiable"), so the section number stands unconfirmed on both sides. The smallest change: delete the clause "cited here without a theorem number because the text was not opened for this roadmap", and add Norris to the References. If the author can open the book, the theorem number should be added; from memory, and unverified, it is Theorem 1.3.5 (the vector of mean hitting times is the minimal non-negative solution of `k_i = 0` on `A`, `k_i = 1 + Σ_{j ∉ A} p_ij k_j` off `A`, on a countable state space), which is the statement of 1.2 with the sum written over all `y` and `h = 0` on `A`.

## C02 — The description's account of 1.2 and of the sources checked predates the Norris citation

The description says "the least-solution form of 1.2 is attributed in prose", and its list of texts against which "locators were checked" has three works. At this head 1.2 cites a fourth, Norris §1.3, and the README says it was not checked against the text. Text that would be right: "the least-solution form of 1.2 cites Norris, *Markov chains*, §1.3, by section only; that locator was not checked against the text". The description also leaves unstated that 1.4 now records that Lyons–Peres state Proposition 2.20 for a target set and that the roadmap states the case of one vertex; one clause would do.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.4 `meanHittingTime_walk_eq_sum`, with the new clause "LP state it for a target set `Z`; here `Z = {z}`" | unit path 0—1—2, `a = 0`, `z = 2`; same path, `a = 1`, `Z = {0, 2}`; `a = z` | grounded Laplacian `[[1, −1], [−1, 2]]`, inverse `[[2, 1], [1, 1]]`, column of 0 is `(2, 1)`: `1·2 + 2·1 = 4 = E_0 τ_2`; set case: `[2]⁻¹ = 1/2`, `2 · 1/2 = 1 = E_1 τ_Z`, not a single-vertex voltage; `0 = 0` | sound; the clause agrees with the source | none |
| 1.2 `isLeast_meanHittingTime`, with the new citation | two states, `A = {1}`, `P(0, 1) = p` | `p = 1/3`: `h(0) = 1 + (2/3) h(0)` gives `3`, the geometric mean; `p = 0`: `h(0) = 1 + h(0)` forces `⊤ = E_0 τ_1` | sound | C01 (locator unread) |
| 4.3 `le_meanCoverTime`, reworded sentence "the bound is the junk product" | `A = ∅`; `|A| = 1` | infimum over no pairs `⊤`; `A.card − 1 = 0` in both cases (truncated subtraction for `∅`), `harmonic 0 = 0`; `⊤ · 0 = 0 ≤` anything, on the lower-bound side of both the display and the Lean statement | sound | none |

The rows for the untouched statements stand as in the previous review, of `60a3301`.

- Source locators read against the text: 1 (Lyons–Peres, Proposition 2.20, version of 8 November 2016 on the first author's site, `LyonsPeres` lines 3019–3022: a vertex `a` and a disjoint set of vertices `Z`, unit current from `a` to `Z`); 1 not readable (Norris §1.3).
- Library declarations opened at the pin: `Matrix.trace`, `Mathlib/LinearAlgebra/Matrix/Trace.lean` line 43, as the corrected contract line says.
- Cross-roadmap citations resolved: MarkovChainsAndRenewal on main, Conventions, the paragraph beginning "On a path X, distinguish the first entrance" (defines `H_A` and the first return); ElectricalNetworksAndRandomWalks 2.1 at its open head defines `groundedLaplacian z` and `voltage a z` at a single ground vertex and proves invertibility on connected networks, as 1.4 uses it.
- The diff touches only `README.md` (15 insertions, 9 deletions); `Suggested.lean` is unchanged; no file outside the folder changed; no layer added, removed or reordered.
- Automatic checks at this head: all pass. Dependency check output: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/HittingAndCoverTimes/Suggested.lean`: exit 0, ten `sorry` warnings and nothing else.
- Title and description read against the head: counts, suppliers and the three checked sources still agree; two omissions, C02.

Overlap check: read ElectricalNetworksAndRandomWalks, MarkovChainMixing, MCMCAsymptoticVariance, MarkovChainsAndRenewal (main and its open revision), ComparisonOfMarkovChains, MarkovDecisionProcesses; networks, voltages and the commute time identity are owned by ElectricalNetworksAndRandomWalks, the transition matrix and mixing time by MarkovChainMixing, the fundamental matrix by MCMCAsymptoticVariance, first entrance and return times and Kac's formula by MarkovChainsAndRenewal; mean hitting times and cover times are owned here and by no other. The change moves no ownership; no open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; 3 passages compared with 1 source (the clause on the set `Z` in 1.4 against Lyons–Peres Proposition 2.20, none shared beyond the name of the identity; the Norris sentence of 1.2 could not be compared, the text not being readable); largest share Levin–Peres, 14 of 25 locators; the diff adds, removes or reorders no layer, so the arrangement stands as compared before: independent.

Research link: Headlines are Matthews' cover time bounds (1988), Tetali's hitting time identity (1991), the cycle identity of Coppersmith, Tetali and Winkler (1993) and the Aldous–Fill mean hitting time formula, the hitting-time tools of the mixing-time literature (Levin–Peres 2017, Chapters 10–11, whose Theorem 10.22 is headline 3.1). Rests on the README and the notes of the sources read.

## Previous findings

The previous review had no findings (R); its three small corrections and two format notes are accounted for here.

- C01 (set version of the hitting time identity) — repaired: "LP state it for a target set `Z`; here `Z = {z}`, the case the voltage of ElectricalNetworksAndRandomWalks 2.1 expresses." Agrees with the source.
- C02 (no locator for 1.2) — partly repaired: "J. R. Norris, *Markov chains* (Cambridge University Press, 1997), Section 1.3, cited here without a theorem number because the text was not opened for this roadmap." Written again as C01 above.
- C03 ("item 3" of MarkovChainsAndRenewal) — repaired: "the Conventions of MarkovChainsAndRenewal (the paragraph on first entrance and first return)", in the Conventions and in the scope section; the paragraph is on main.
- N01 (`Matrix.trace` under the wrong file) — repaired: "`Mathlib/LinearAlgebra/Matrix/Trace.lean`: `Matrix.trace`."
- N02 ("the left side" in 4.3) — repaired: "For `|A| ≤ 1` the bound is the junk product `⊤ · 0 = 0`."

## Not verifiable

- Norris, *Markov chains*, §1.3 (the new locator of 1.2): no legal copy could be read. The sources service declined the one address tried, on the Cambridge Statistical Laboratory's site, because the address does not name the author; no other host was tried. The theorem number offered in C01 is from memory.
- The printed Cambridge University Press edition of Lyons–Peres was not read; Proposition 2.20 was read in the online version of 8 November 2016 on the first author's site, and the page number 48 was not rechecked in this round.

## Source issues

- **Misprint** in Levin–Peres (second edition) at Proposition 11.4, printed page 151: the source fixes a subset `A` in the hypothesis and then maximises over all subsets `A` in the conclusion; it should fix no set and define `t_min^A` for every `A`; affects nothing.

## For the human reviewers

- Scope/licence: the only locator for the mean hitting time formula (2.1) is Aldous–Fill, an unfinished monograph that was never published (2.2 and 2.3 also have locators in Levin–Peres); read from the first author's page.
- Suppliers: three suppliers (ElectricalNetworksAndRandomWalks, MarkovChainMixing, MCMCAsymptoticVariance) are open pull requests by the same author; the 12 copied definitions were identical to those heads at the previous review and must be compared again if those heads change before merging.
- Not tested: the locator of 1.2 (Norris, §1.3) was read neither by the author (README line 105 says so) nor by this review.
