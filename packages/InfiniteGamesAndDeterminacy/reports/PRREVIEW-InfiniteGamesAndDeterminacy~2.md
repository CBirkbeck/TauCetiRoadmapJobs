# Review of InfiniteGamesAndDeterminacy (pull request #2875 at dfa76d8)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, and the rewritten Pointclasses item of the Conventions now says only true things (every open subset of `ℕ → X` is a countable union of clopen sets, so 3.1 and 3.2 each contain closed and open determinacy), which was recomputed by hand and in Lean at the pin. There are no findings, no small corrections and no format notes. Moschovakis's book still could not be read through a legal channel, so what the new text says about its p. 220, and the wording and arrangement against that book, are left to the human reviewers.

## Previous findings

- R01 — repaired: "For every `X`, an open set `U` is still the union of the clopen sets `Fₙ` of the `x` with `PiNat.cylinder x n ⊆ U`, so it is a countable union of closed sets".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions, Pointclasses: `ℕ → X` not separable for uncountable `X` | cylinders of length 1 at `x`, `y` with `x 0 ≠ y 0` | `cylinder x 1 = {z : z 0 = x 0}`; disjointness proved in Lean at the pin; one nonempty open set per letter, uncountably many | true | none |
| Conventions, Pointclasses: open `U` is `⋃ Fₙ`, `Fₙ` clopen | `U = ∅`; `U = univ`; `U = {f 0 ≠ f 1}`, `X` uncountable; general `U` in Lean | All `Fₙ = ∅`; `F₀ = univ`; `F₀ = F₁ = ∅`, `F₂ = U`. Lean: `Fₙ` closed, `Fₙ` open, `U = ⋃ Fₙ`, no countability used | true | none (repairs R01) |
| "3.1 contains 1.2 (a constant family)" | `F i = A` closed | `⋃ i, A = A` (`Set.iUnion_const`); 1.2 derived from the statement of 3.1 in Lean | true | none |
| "3.1 contains the open determinacy of 1.3" | open `U`, family `Fₙ` | `Fₙ` closed and `U = ⋃ Fₙ` as above, so 3.1 applies | true | none |
| "and so does 3.2" (closed and open sets are `Gδ`) | closed `C = {f 0 = f 1}`; open `A`; Lean for both | `C = (F₂)ᶜ` with `F₂` for `Cᶜ`, open; `IsOpen.isGδ` and `IsClosed.isGδ` (metrizable `ℕ → X`) give 1.2 and open determinacy from the statement of 3.2 | true | none |
| "1.2 is a step of the route of 3.1, the shift lemma one of the route of 3.2, open determinacy from 1.2 and the shift lemma with no ordinals" | the routes and Needs lines of 1.3, 3.1, 3.2 | 3.1 needs 1.1, 1.2 and ordinals; 3.2 needs 1.3, 3.1; 1.3 uses 1.2, the shift lemma and continuity of the tail map only | agrees with the layers | none |

The rows of the previous review, of `ca04e29`, for the statements the change does not touch (1.1, 1.2, 1.3, 2.1, 3.1, 3.2, 4.1–4.4) stand as they are there.

- Source locators checked against the text: 0 new (the change replaces one citation of Moschovakis, p. 220, by two, unread); Marker compared at Marker2002 lines 239–241, 425 and 650 for the same facts in metric spaces.
- Library declarations opened at the pin: `PiNat.cylinder` (`Mathlib/Topology/MetricSpace/PiNat.lean:117`), `PiNat.self_mem_cylinder` (135), `PiNat.mem_cylinder_iff_eq` (137), `PiNat.isOpen_cylinder` (352), `PiNat.isTopologicalBasis_cylinders` (356); `IsOpen.isGδ`, `IsClosed.isGδ` and `Set.iUnion_const` used in the probe.
- Cross-roadmap citations: the change adds none; the section numbers it cites (1.2, 1.3, 3.1, 3.2) exist with the stated content.
- Automatic checks: every one passes at this head; no file changed outside the folder.
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`; no supplier roadmap is cited.
- Elaboration: `Suggested.lean` (unchanged since `ca04e29`) elaborates with ten `sorry` warnings and nothing else. A probe copy with seven proved examples (the six rows above) elaborates without error.
- The pull request's title and description: no sentence is contradicted by this head; the change adds a remark to the Conventions and alters no statement, section, declaration or supplier that they describe.

Overlap check: read BorelEquivalenceRelations, RegretMinimizationAndEquilibria, CountableStructureSpaces (main) and ExtensiveFormGames, PotentialGamesAndPriceOfAnarchy, KakutaniFixedPointAndContinuousGames, CooperativeGames (open) as in the previous review; nothing shared, and the change adds no object.

Source independence: changed passages only; 1 passage compared with 1 source (Marker, lines 239–241, 425, 650), none shared; largest share Moschovakis, 26 of 38 citations; contents not compared again (no layer added, removed or reordered), and Moschovakis's text and table of contents could not be read.

Research link: The Gale–Stewart (1953) and Wolfe (1955) theorems and Banach's theorem on the Banach–Mazur game are the base of the determinacy theory that Martin's Borel determinacy and projective determinacy extend; Marker's Theorem 6.21 uses Layer 4 for the Baire property of projective sets. Rests on the README's references and Marker §6.

## Not verifiable

- The two new citations of Moschovakis, p. 220, in the Pointclasses item (that the book names the two classes by their definitions for every `ℕ → X`, and that a remark in parentheses there says an open set need not be a countable union of closed sets): the book could not be read; the sources service again refused the cited address as not shown to be the author's page. The mathematics of the item does not depend on them.
- All other locators into Moschovakis, as in the previous review.

## Source issues

- none

## For the human reviewers

- **Not tested.** Moschovakis's book carries 26 of the 38 source citations and could not be read: wording and arrangement were compared with Marker only. Sections 1.2–1.3, 3.1–3.2 and 4.2–4.4 cite its §6A theorems and exercises.
- **Licence.** The README cites Moschovakis's book from `www.math.ucla.edu/~ynm/lectures/dst2009/`; the service could not classify that host as the author's page. A human can confirm whether it is.
- **Scope.** Three statements (2.1 for every `X` with two elements; 4.2 and 4.4 for uncountable discrete `X`) are wider than the two sources opened by the author, with routes written in the README; Oxtoby (1957) is named for the general case but was not opened.
- **Not tested.** README line 73 says a parenthetical remark on Moschovakis's p. 220 is false in `ℕ → X`. The mathematics is right (Lean probe); whether the book says this was not checked, and if so it is an erratum to record.
