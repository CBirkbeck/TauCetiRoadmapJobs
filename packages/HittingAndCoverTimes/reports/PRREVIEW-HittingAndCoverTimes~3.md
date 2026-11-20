# Review of HittingAndCoverTimes (pull request #2796 at 086c437)

**Verdict:** accepted

**Summary.** Accepted: the 5 changed lines repair both small corrections of the previous review (the clause about how the roadmap was written is gone from 1.2, Norris is in the References, and the description now states the Norris citation and the single-vertex case of 1.4), change no statement and introduce nothing false. There are no findings, no small corrections and no format notes. The humans who approve decide the same questions as before: the standing of the unfinished Aldous–Fill monograph as the only locator for 2.1, merging behind three open supplier roadmaps, and that the section of Norris cited for 1.2 has been read against the text by nobody.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.2 `isLeast_meanHittingTime`, whose citation sentence the diff changes | two states, `A = {1}`, `P(0, 0) = P(0, 1) = 1/2`; three states, `0 → 1 → 2` deterministic, `A = {2}`; `P(0, 0) = 1`, `A = {1}` | `h(0) = 1 + h(0)/2` has solutions `2` and `⊤`; least is `2 = Σ k 2^(−k) = E_0 τ_1`. Path: `h = (2, 1, 0)`, unique, equals the step counts. Absorbing: `h(0) = 1 + h(0)` forces `⊤ = E_0 τ_1` | sound; "least" is needed and the Lean set of solutions in `ℝ≥0∞` matches the prose | none |

The rows for the untouched statements stand as in the previous review, of `b90373a`.

- Source locators read against the text in this round: 0; 1 not readable (Norris §1.3, see below). The diff adds no other locator.
- Library declarations opened at the pin: none new; the diff names none. The Lean statement of 1.2 (`TauCetiRoadmap/HittingAndCoverTimes/Suggested.lean` lines 44–50) was read against the README sentence: same hypotheses (countable `S`, any Markov kernel, any `A`), same equations.
- Cross-roadmap citations: the diff adds, removes or changes none.
- The diff touches only `README.md` (3 insertions, 2 deletions: the sentence of 1.2 and one new entry of the References); `Suggested.lean` is unchanged; no file outside the folder changed; no layer added, removed or reordered. No other mention of Norris or of an unopened text remains in the folder.
- Automatic checks at this head: all pass. Dependency check output: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/HittingAndCoverTimes/Suggested.lean`: exit 0, ten `sorry` warnings and nothing else.
- Title and description read against the head: the description now says that 1.2 "cites Norris, *Markov chains*, §1.3, by section only; that locator was not checked against the text" and that 1.4 states the case of one vertex; counts (10 theorems, 15 definitions, 1 structure, 1 instance), suppliers and the Lyons–Peres version (19 August 2026, as in the References) agree with the head. Nothing contradicted, nothing left unstated.

Overlap check: read ElectricalNetworksAndRandomWalks, MarkovChainMixing, MCMCAsymptoticVariance, MarkovChainsAndRenewal (main and its open revision), ComparisonOfMarkovChains, MarkovDecisionProcesses; networks, voltages and the commute time identity are owned by ElectricalNetworksAndRandomWalks, the transition matrix and mixing time by MarkovChainMixing, the fundamental matrix by MCMCAsymptoticVariance, first entrance and return times and Kac's formula by MarkovChainsAndRenewal; mean hitting times and cover times are owned here and by no other. The change moves no ownership; no open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; 2 passages (the citation sentence of 1.2 and the Norris entry of the References) could be compared with 0 sources, the one source they cite not being readable; both are bibliographic (author, title, publisher, section number and the section's subject) and state no passage of the book; largest share Levin–Peres, 14 of 25 locators as counted in the previous review (the diff adds no locator at a claim, only the entry of the References); the diff adds, removes or reorders no layer, so the arrangement stands as compared before: independent.

Research link: Headlines are Matthews' cover time bounds (1988), Tetali's hitting time identity (1991), the cycle identity of Coppersmith, Tetali and Winkler (1993) and the Aldous–Fill mean hitting time formula, the hitting-time tools of the mixing-time literature (Levin–Peres 2017, Chapters 10–11, whose Theorem 10.22 is headline 3.1). Rests on the README and the notes of the sources read.

## Previous findings

The previous review had no findings (R); its two small corrections are accounted for here.

- C01 (Norris locator says the book was not opened; book absent from the References) — repaired: "solution are in J. R. Norris, *Markov chains* (Cambridge University Press, 1997), Section 1.3."; the References now list the book, "Section 1.3 (hitting times and absorption probabilities), cited by section for 1.2". No theorem number was added (it was offered, not required).
- C02 (description predates the Norris citation) — repaired: "the least-solution form of 1.2 cites Norris, *Markov chains*, §1.3, by section only; that locator was not checked against the text. 1.4 records that Lyons and Peres state Proposition 2.20 for a target set".

## Not verifiable

- Norris, *Markov chains*, §1.3 (the locator of 1.2 and the new entry of the References, including the section's subject as the entry gives it): no legal copy could be read. The sources service declined the one address tried, on the Cambridge Statistical Laboratory's site, because the address is not shown to be the author's own page; no other host was tried, and the text is requested from the operator.
- The printed Cambridge University Press edition of Lyons–Peres was not read, and the online version of 19 August 2026 that the References name was not reread in this round (the previous rounds read Proposition 2.20 in the version of 8 November 2016); the diff does not touch it.

## Source issues

- **Misprint** in Levin–Peres (second edition) at Proposition 11.4, printed page 151: the source fixes a subset `A` in the hypothesis and then maximises over all subsets `A` in the conclusion; it should fix no set and define `t_min^A` for every `A`; affects nothing.

## For the human reviewers

- Scope/licence: the only locator for the mean hitting time formula (2.1) is Aldous–Fill, an unfinished monograph that was never published (2.2 and 2.3 also have locators in Levin–Peres); read from the first author's page.
- Suppliers: three suppliers (ElectricalNetworksAndRandomWalks, MarkovChainMixing, MCMCAsymptoticVariance) are open pull requests by the same author; the 12 copied definitions were identical to those heads at the first review and must be compared again if those heads change before merging.
- Not tested: the locator of 1.2 (Norris, §1.3; README lines 104 and 597) was read neither by the author (the description says so) nor by any round of this review; the statement of 1.2 itself was checked by computation.
