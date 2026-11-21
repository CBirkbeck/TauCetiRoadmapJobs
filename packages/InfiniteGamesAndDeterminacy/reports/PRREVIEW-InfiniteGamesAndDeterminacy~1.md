# Review of InfiniteGamesAndDeterminacy (pull request #2875 at ca04e29)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding: the Conventions assert that for uncountable `X` an open subset of `ℕ → X` need not be a countable union of closed sets, which is false for every discrete `X` (each open set is a countable union of clopen sets). Every theorem, route and Check was recomputed and no other defect was found; there are no small corrections and no format notes. Moschovakis's book, which carries about two thirds of the locators, could not be read through a legal channel the sources service accepts, so its locators are unverified and the comparison of wording and arrangement against it is left to the human reviewers.

## R01 (P2) — In `ℕ → X` with `X` discrete every open set is a countable union of closed sets, so the reason the Conventions give for stating the two classes separately is false

The Pointclasses item of the Conventions (README line 67) says: "When `X` is uncountable, `ℕ → X` is not separable and an open set need not be a countable union of closed sets (Moschovakis, p. 220), so the two classes are stated separately." The first half is true; the second is not. An implementer reading it will believe that open determinacy (1.3) is independent of Wolfe's theorem (3.1) for uncountable `X`, and a reader will take away a false fact about the space.

For open `U` put `Fₙ = {x : PiNat.cylinder x n ⊆ U}`. Two sequences that agree below `n` have the same cylinder of length `n`, so `Fₙ` and its complement are both unions of cylinders of length `n`: `Fₙ` is clopen. Cylinders form a basis, so `U = ⋃ₙ Fₙ`. No countability of `X` is used (the space is metrizable, and this is the usual argument there). The closedness of `Fₙ` was also checked in Lean at the pin, for an arbitrary discrete `X`, with `PiNat.mem_cylinder_iff_eq` and `PiNat.isOpen_cylinder`. For example, with `X` uncountable and `U` the set of sequences with `f 0 ≠ f 1`, already `F₂ = U`.

The smallest repair is to replace the clause by what is true: that `ℕ → X` is not separable when `X` is uncountable, so it is not one of the book's product spaces and the classes are named here directly by their definitions; that every open set is nevertheless a countable union of clopen sets (the `Fₙ` above), so 3.1 contains open determinacy; and that `Π⁰₂` is the dual class, reached from 3.1 through the shift lemma. No theorem statement changes.

## Questions for the author

- What does Moschovakis say at p. 220 that the Pointclasses item cites? I could not open the book (see below). If the page only says that the space is not separable, or not one of the book's product spaces, the locator can stay on the corrected sentence of R01; if it is cited for the false clause, it should go.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `history`, `play`, winners, `IsDetermined` | `X` empty; one point; `Bool` with `f 1 = true`; `f 2 = f 1`; counts for `k = 1..4`; `decide` on two plays | Empty: no strategy, ∅ undetermined. Counts 3, 16−3²=7, 256−7²=207, 65536−207²=22687. Lean plays `[0,10,2,30]` as expected. Marker Defs 6.1–6.3 match. | sound | none |
| 1.2 closed determinacy | `X` empty; constant-false set; copying set; wrong model: drop `Nonempty` | Empty `X`: ∅ closed, undetermined, so hypothesis needed. II wins constant-false by `true` at 1. Marker Thm 6.4 p. 55 states it for nonempty `X`. | sound | none |
| 1.3 shift lemma | `X` empty; `A = {f 0 = true}`; direction of the role swap | Empty: hypothesis false, vacuous. I wins `B` ⇒ II wins `Aᶜ`; II wins `B` ⇒ I wins `Aᶜ` (first move wasted, `τ []` exists). | sound | none |
| 1.3 open determinacy | open `A`: complement closed, tail preimage closed | `(Aᶜ)ᶜ = A` determined from 1.2 and shift. Also follows from 3.1 by `U = ⋃ Fₙ` (R01). Marker Ex. 6.5 p. 55. | sound | none |
| 2.1 non-determined set | `X` empty, one point, `Bool`, general `x ≠ y`; later stages against earlier `b_ξ` | One point: all determined. `b_ξ ∉ A` since every later `a_η` avoids it. Pull-back: simulated `X`-play maps to the `Bool` play. Marker Ex. 6.8 is for `ℕ`. | sound | none |
| 3.1 Wolfe, countable unions of closed sets | eventually-false set on `Bool`; `F` constant; route's two cases (stay in tree, or reach earlier `W`) | II wins eventually-false by always `true`. Outside the limit, closed determinacy gives II an exit from each tree outside the limit. | sound (source unread) | none |
| 3.2 `IsGδ` | empty family (whole space); infinitely-many-`true` set | `IsGδ` at the pin allows `T = ∅`; complement ∅ is a union of closed sets. I wins by always `true`. | sound (source unread) | none |
| Conventions, Pointclasses | uncountable `X`, `U = {f 0 ≠ f 1}`; general open `U` | `Fₙ` clopen (Lean, pin), `U = ⋃ Fₙ`; claim "need not be a countable union of closed sets" false | false sentence | R01 |
| 4.1 `concatMoves`, `banachMazurPayoff` | moves `(i, [0..i−1])`; `f 1 = true` on `Bool` | Lean `decide`: first 12 letters `0,1,0,2,0,1,3,0,1,2,4,0`, equal to block concatenation. I opens `[false, true]`. Marker p. 58 matches. | sound | none |
| 4.2 II wins iff meagre | `X` empty; one point; eventually-false set; uncountable `X` route (maximal incompatible families) | Empty: ∅ meagre, no strategy, so `Nonempty` needed. Density of `Gₖ` by maximality rechecked; points of `⋂ Gₖ` are `τ`-plays. Marker 6.19 p. 59. | sound | none |
| 4.2 I wins iff some cylinder minus `A` meagre | `X` empty; `n = 0`; opening block incompatible with, extending, or a prefix of `w`; 256 three-letter sets | Empty: both sides false. `cylinder x 0 = univ`. All three opening cases give a `σ`-play or leave the cylinder. 255 won by I, ∅ by II. Marker 6.20. | sound | none |
| 4.3 Baire property ⇒ determined | `X` empty; `U = ∅`; `U ≠ ∅`; complement of a point | Empty: ∅ Baire-measurable, undetermined. `U = ∅`: `A` meagre, II. Else cylinder `N ⊆ U`, `N \ A ⊆ U \ A` meagre, I. | sound (source unread) | none |
| 4.4 determinacy ⇒ Baire property | `X` empty; family without closure under `B \ U`; `N \ (A \ U) = (N \ A) ∪ (N ∩ U)`; disjoint-union lemma | Empty: hypotheses force `Λ = ∅`. Singleton `{C ∪ S}` satisfies `hdet`, fails conclusion. `N ⊆ U` meagre contradicts Baire. Marker 6.21 uses the same two properties. | sound | none |

- Source locators checked against the text: 12 in Marker (Definitions 6.1–6.3 p. 54–55, Theorem 6.4, Exercises 6.5, 6.8 p. 55, the game p. 58, Lemmas 6.19, 6.20 p. 59, Theorem 6.21 p. 60, topology p. 55); 0 of 25 in Moschovakis.
- Library declarations opened at the pin: 22, all present where cited (for example `PiNat.cylinder` at `Mathlib/Topology/MetricSpace/PiNat.lean:117`, `IsMeagre` at `Mathlib/Topology/GDelta/Basic.lean:293`, `BaireMeasurableSet.iff_residualEq_isOpen` at `Mathlib/Topology/Baire/BaireMeasurable.lean:180`, `not_isMeagre_of_isOpen` at `Mathlib/Topology/Baire/Lemmas.lean:200`, `Descriptive.tree` at `Mathlib/SetTheory/Descriptive/Tree.lean:32`); `BaireSpace (ℕ → X)` is found by instance search for discrete `X`.
- Cross-roadmap citations resolved: BorelEquivalenceRelations (introduction, line 70, and out-of-scope list, line 683, on main), NoncompactQuantumSymmetry M1.BorelRealization (lines 1140, 1183–1184 on main), InfinitaryLogic (completed); Tau Ceti `TauCeti/ModelTheory/BackAndForth/Game/Finite.lean`, `Infinite.lean` and `TauCeti.banachMazurDist` exist.
- Duplication by object: no Gale–Stewart game, payoff-set determinacy or Banach–Mazur game in the pinned Mathlib (its `SetTheory.PGame` is combinatorial games) or Tau Ceti, on main, or at any open head searched.
- Dependency check: `depcheck: 172 roadmaps, 1999 edges, 0 problem(s)`; no supplier roadmap is cited. No change outside the folder.
- Elaboration: `Suggested.lean` elaborates with ten `sorry` warnings and nothing else; all binders are explicit and each elaborated signature matches its README statement. One-tactic probe (`simp` with the definitions unfolded) closes none of the ten theorems.
- Headline theorems (closed and open determinacy, a non-determined set, Wolfe's two statements, Banach's two equivalences, the two Baire-property theorems): all stated in `Suggested.lean`; none absent, none through a stand-in.
- The pull request's title and description agree with the head (a new roadmap, 10 theorems, 7 definitions, no supplier roadmap).

Overlap check: read BorelEquivalenceRelations, RegretMinimizationAndEquilibria, CountableStructureSpaces (main) and PotentialGamesAndPriceOfAnarchy, KakutaniFixedPointAndContinuousGames, CooperativeGames (open, by search); nothing shared. BorelEquivalenceRelations places infinite games outside its scope; the game-theory roadmaps concern finite or continuous strategic games.

Source independence: 10 passages compared with 1 source (Marker), none shared; largest share Moschovakis, 25 of 37 citations; contents not compared with Moschovakis, whose text and table of contents could not be read. The four layers do not follow Marker's §6 (which has no Wolfe theorem and passes through Borel determinacy and perfect-set games).

Research link: The Gale–Stewart (1953) and Wolfe (1955) theorems and Banach's theorem on the Banach–Mazur game are the base of the determinacy theory that Martin's Borel determinacy and projective determinacy extend; Marker's Theorem 6.21 uses Layer 4 for the Baire property of projective sets. Rests on the README's references and Marker §6.

## Not verifiable

- All 25 locators into Moschovakis, *Descriptive Set Theory*, 2nd ed. (§6A pp. 218–227, §6H notes 1–3, §7F pp. 341–342, Exercise 2H.6 p. 83, pp. 218–220 in the Conventions): the sources service refused the cited URL (it could not confirm it is the author's own page) and the publisher's page is in no licence class. The text has been requested.
- Of the sampled targets, 3.1, 3.2 and 4.3 cite Moschovakis only (Theorem 6A.3, Corollary 6A.5, Exercise 6A.16): their mathematics was re-derived, their locators were not checked.
- The primary papers of Gale–Stewart, Wolfe and Oxtoby: the README gives no locator into them and says they were not opened.

## Source issues

- **Misprint** in Marker2002 at Definition 6.1, p. 54: the source says that after Player II's second move Player II replies with the strategy's value; it should be Player I who replies; affects nothing.
- **Gap** in Marker2002 at Lemma 6.20 (proof), pp. 59–60: the source lets Player II copy Player I's strategy without treating an opening move that does not extend Player I's first move η; it should treat openings incompatible with, or shorter than, η separately; affects the proof.
- **Misprint** in Marker2002 at Lemma 6.20 (proof, last line), p. 60: the source concludes with the cylinder of σ minus A; it should be the cylinder of η minus A; affects nothing.
- **Misprint** in Marker2002 at Theorem 6.21 (proof), p. 60: the source cites 6.20 for "II wins implies meagre" and for "II does not win", and 6.19 for the cylinder statement; the two lemma numbers should be exchanged throughout; affects nothing.
- **Misprint** in Marker2002 at Theorem 6.21 (proof), p. 60: the source defines U as the union of the cylinders minus A and then U minus A as the union of the cylinders; it should be the reverse; affects nothing.

## For the human reviewers

- **Not tested.** Moschovakis's book carries 25 of the 37 source citations and could not be read: wording and arrangement were compared with Marker only. Sections 1.2–1.3, 3.1–3.2 and 4.2–4.4 cite its §6A theorems and exercises.
- **Licence.** The README cites Moschovakis's book from `www.math.ucla.edu/~ynm/lectures/dst2009/`; the service could not classify that host as the author's page. A human can confirm whether it is.
- **Scope.** Three statements (2.1 for every `X` with two elements; 4.2 and 4.4 for uncountable discrete `X`) are wider than the two sources opened by the author, with routes written in the README; Oxtoby (1957) is named for the general case but was not opened.
