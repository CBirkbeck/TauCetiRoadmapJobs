# Review of HousingMarketsAndAssignmentGames (pull request #2912 at 9d4ec25)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of the three layers was recomputed at its degenerate inputs (empty sides, one pair with a negative value, rectangular markets) and by exhaustive search on small cases, every locator into Karlin–Peres was read at the text, and the extension from the source's square nonnegative case to real values and rectangular markets holds as stated. There is one format note, not blocking. Three points are left for the human reviewers: the single textbook source, the redistribution notice on its PDF, and the dependency on a supplier roadmap that is itself still an open pull request.

## N01 — Step 1 of the route of 1.2 is worded as a loop and keeps the source's letters

In step 1 of the route of 1.2 (README line 117) the construction is introduced with "While `Sₖ` is nonempty", with the source's `Sₖ`, `Cₖ` and its order of clauses (KarlinPeres2017 lines 8478–8487). The content is the recursion the mathematics forces and no run of words is shared, so nothing is wrong; it would read more as a definition, and less as the source's procedure, if stated as one: "define `Sₖ` and `Cₖ` by recursion: `S₁ = ι`, `Cₖ` is the set of periodic points of the map sending `i ∈ Sₖ` to the owner of its favourite house in `Sₖ`, and `Sₖ₊₁ = Sₖ \ Cₖ`".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `WeaklyBlocks`, `IsInStrictCore` | empty type; one agent; 3-agent market of the Check; 2 agents both ranking `a` first | 3-agent: strict core `{swap a b}`, core by strict improvement has 2 elements (swap, 3-cycle); 2-agent swap blocked by `{a}` with identity | agrees with README and KarlinPeres2017 line 8473 | none |
| 1.2 `existsUnique_isInStrictCore` | all markets on 0, 1, 2, 3 agents (1, 1, 4, 216) | strict core has exactly one element in each; 0 failures | true | none |
| 1.3 `isInStrictCore_iff_exists_round` | all 222 markets, every permutation, every `r` with values below `n`; the control `r a = r c = 0`, `r b = 1` | both directions agree, 0 failures; control: `r (π a) = 1 ≠ 0`, second condition holds, 3-cycle not in strict core | true; first condition needed | none |
| 1.4 `not_prefers_of_isInStrictCore` | all 216 markets × 3 agents × 6 reports; two-agent control with `b`'s ranking changed | 0 violations; control: `π' a = b` preferred to `π a = a`, hypothesis fails for `b ≠ ℓ` | true; route's induction checked by hand | none |
| 2.1 definitions | `v = 5`, `v = −1` (1×1); `u = p = 3` at `v = 5`; empty `ι` | value 5 and 0; `−1`: only core outcome empty matching, `u = p = 0`; total 6 > 5 not an outcome; empty `ι`: value 0 | definitions determine the object | none |
| 2.2 `isCoreOutcome_iff` | `[[3,1],[2,2]]`; values 4, 3 for one house; `v = −1`; empty `ι` | weights 5 vs 3; min covers `u₁+p₁=3`, `u₂+p₂=2`, `\|u₁−u₂\|≤1`; `3 ≤ p ≤ 4`; empty: `p = 0` both sides | both directions hold; proof steps 1–3 checked | none |
| 2.3 `exists_isCoreOutcome` | `v = −1` with full and empty matching; no buyers | full matching weight −1 < 0, not largest, carries none; empty carries `u = p = 0` | true; hypothesis needed | none |
| 3.1 `isWalrasianEquilibrium_iff` | price 5/2 and 3 in the 4, 3 market; `v = 0` at price −1; unsold house at price 10 | 5/2: `3 ≤ 5/2` fails; 3: holds, `u = (1, 0)`; −1 and 10 each fail exactly one clause | iff holds; each clause needed | none |
| 3.2 `IsMinCover.sup_inf` | covers `((1,0),(2,2))`, `((0,1),(3,1))` of `[[3,1],[2,2]]` | `((1,1),(2,1))` and `((0,0),(3,2))`: covers of total 5; `((1,1),(3,2))` total 7 | true; mixed sup/inf needed | none |
| 3.3 buyer-optimal point | all matrices with entries in `{−1,…,3}`, sizes `m, n ≤ 3`, `m + n ≤ 5`, empty sides included; every matching of largest weight (51861 pairs) | `(M, ū, v i j − ū i)` is a core outcome in all 51861; upper bound `u i ≤ ū i` by weak duality by hand | true | none |
| 3.3 seller-optimal point | same 51861 pairs | `(M, v i j − p̄ j, p̄)` is a core outcome in all; `[[3,1],[2,2]]`: `p̄ = (3,2)`, `u = (0,0)` | true | none |
| 3.3 control, wrong matching | `v = −1`, full matching | formula gives `−1 − 0 = −1`, not a core price (prices are `{0}`) | hypothesis `IsMaxWeightMatching` needed | none |
| Claim 17.2.8 through the padding `N = ι ⊕ κ` | read at KarlinPeres2017 lines 14166–14188; padding checked by hand | value of `w` equals value of `v`; dummy payoffs 0 in every minimum cover; zeroed row of `w` is padding of `Function.update v i 0` | source's square nonnegative hypothesis met by `w` | none |
| VCG remark in the scope section | pivot and payment computed symbolically | payment `= value(v₋ᵢ) − (value(v) − v i j) = v i j − ū i`; unmatched: `value(v₋ᵢ) = value(v)`, payment 0 | true | none |
| 1.2 route, step 1 (N01) | compared with KarlinPeres2017 lines 8478–8487 | same recursion and letters; longest shared run under 6 words | forced by the mathematics | format note |

- Source locators checked against the text: 19 (§10.4, Lemma 10.4.1 (1), (2), Remark 10.4.2, Exercise 10.13, Notes p. 187; Theorem 17.1.1, Remarks 17.1.2, Remark 17.1.3, Definition 17.2.1, Lemmas 17.2.2, 17.2.4 with (17.4), Corollary 17.2.5, Theorem 17.2.6 with (17.5), (17.6), Claim 17.2.8, Corollary 17.2.9, §17.2.2, Definition 17.5.1, Proposition 17.5.2, Notes pp. 309–310); all on the printed pages given.
- Library declarations opened at the pin: 16, all present in the files the README names (`PEquiv` at `Mathlib/Basic/PEquiv.lean:54`, `Finite.exists_ne_map_eq_of_infinite` at `Mathlib/Data/Fintype/Pigeonhole.lean:75`, `IsCompact.exists_isMinOn` at `Mathlib/Topology/Order/Compact.lean:255`, `Metric.isCompact_of_isClosed_isBounded` at `Mathlib/Topology/MetricSpace/Bounded.lean:320`, `IsGreatest.csSup_eq` at `Mathlib/Order/ConditionallyCompletePartialOrder/Basic.lean:71`, and the rest); no housing-market or assignment-game object in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved at the open heads: MinimumCostFlowsAndWeightedBipartiteMatching 2.2 (`matchingWeight`, `IsWeightCover`, `egervary`: the README's contract and the two copied definitions agree character for character with that head, and its scope lists cores and prices of assignment games as not treated); CooperativeGames 2.1 and its scope line on assignment games; MechanismDesign 3.3 (`clarkePivot`, `vcgPayment`).
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`; no UPWARD or CYCLE line. The only roadmap supplier is a new roadmap in an open pull request.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: nine `declaration uses sorry` warnings, nothing else. Signatures compared with the README by `#check`-style listing: the definitions drop only instances their bodies do not use; all nine theorems carry `[Fintype ι]` (and `[Fintype κ]` in Layers 2 and 3).
- One-tactic probe (`rfl`, `simp`, `infer_instance`, unfolding with `simp`, `aesop`) on a copy of the file: none of the nine theorems closes. No padding.
- No change outside the roadmap folder; no `set_option`, no sorry'd data, a single `import Mathlib`.
- Overlap check: read MechanismDesign, GeneralEquilibriumTheory, FairDivision, ExtensiveFormGames, CooperativeGames (and MatchingTheory, MinimumCostFlowsAndWeightedBipartiteMatching); nothing shared beyond the weight of a matching and weighted covers, owned by MinimumCostFlowsAndWeightedBipartiteMatching 2.2 and cited. GeneralEquilibriumTheory's Walrasian equilibrium is that of an exchange economy with divisible goods, a different object in a different namespace.

Source independence: 19 locators and 6 further passages (Conventions on source conventions, route of 1.2, route of 1.4, route of 2.2, route of 3.3, three docstrings) compared with 1 source, none shared; largest share KarlinPeres2017, 22 of 22 locators; contents compared with KarlinPeres2017: independent (Layer 1 ↔ §10.4; Layer 2 ↔ §17.1 with §17.5; Layer 3 ↔ §17.2; the source's order 17.1, 17.2, 17.5 is not kept, §§17.3, 17.4, 17.6 are not used, and Layer 3's dependence on Layer 2 forces the order).

Research link: The headline targets are the theorems of Shapley and Shubik (1971) on the core of the assignment game, of Shapley and Scarf (1974) on housing markets with Gale's top trading cycles, and of Demange (1982) and Leonard (1983) on the buyer-optimal core point, as attributed in the README's references and in KarlinPeres2017, Notes to Chapters 10 and 17.

## Not verifiable

- The papers of Shapley–Shubik, Shapley–Scarf, Demange and Leonard: the README gives no locator into them and none was read; the attributions were checked only against Karlin–Peres's Notes.
- The description's counts of the author's own exhaustive checks (four-agent markets, 1360 and 4458 value matrices) were not repeated at those sizes; the statements were checked independently at the sizes in the table.

## Source issues

- **Gap** in KarlinPeres2017 at Lemma 10.4.1 (2), proof, printed page 186: the source says the agents of earlier cycles prefer their offices, so a misreport cannot win one of them; it should also argue that those cycles receive the same offices whatever the deviating agent reports; affects the proof.

## For the human reviewers

- Scope: every locator is into one textbook, Karlin and Peres, *Game Theory, Alive* (2017); the primary papers (1971, 1974, 1982, 1983) are named without locators (README, References). The uniqueness in 1.2 is an exercise in the source; 1.3 is the roadmap's own.
- Licence: the PDF read is on A. R. Karlin's page and each page carries the notice "Licensed to AMS", with possible restrictions on redistribution (KarlinPeres2017 line 10). It was read as an author's page; no passage is reproduced.
- Merge order: the only roadmap supplier, MinimumCostFlowsAndWeightedBipartiteMatching, is a new roadmap in an open pull request by the same author; `Suggested.lean` lines 39–46 copy its two definitions verbatim, so that pull request must merge first and unchanged in 2.2.
