# Review of GraphReconstruction (pull request #3130 at 0e17b7e)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review, the false exponent identity closing the route of 2.2 (Nash-Williams' lemma), is repaired, and the route's last step was recomputed on the two-edge pair for every `F ≤ G`. The unqualified Tau Ceti name in the Conventions now carries its namespace. There are no findings, no small corrections and no format notes. The five points for the human reviewers stand as before (single-source concentration read through course notes, Kelly's paper not read, the outside Lean developments, the preprint named as context).

## Previous findings

- R01 — repaired: the route of 2.2 now ends "With `e(X) − e(F) = e(G) − e(F)` at `X = G` this is the claim" (README line 310), which is the exponent of the displayed sum at its only surviving term.
- N01 (format note) — repaired: the Conventions now give `SimpleGraph.card_injective_hom_eq_labelledCopyCount` (README lines 51–52), the name at the pin.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 2.2 `nash_williams_lemma`, last step of the route (changed sentence) | `G = P₃ ⊔ K₁`, `H = 2K₂` on 4 vertices; every `F ≤ G` (`⊥`, each single edge, `G`); terms of the sum over `F ≤ X ≤ G` | `F = ⊥`: `10 − 8 = 2 = (−1)²·2`, terms `0, 0, 0, 2`; one edge: `6 − 8 = −2 = (−1)¹·2`, terms `0, −2`; `F = G`: `2 − 0 = 2`, term `2` | true: only `X = G` survives, with sign `(−1)^(e(G) − e(F))`; old identity `e(G) − e(X)` would give `0 ≠ 2` at `F = ⊥` | none |
| Conventions, Copies (changed citation) | declaration opened at the pin | `SimpleGraph.card_injective_hom_eq_labelledCopyCount (F) (G) : Nat.card {φ : F →g G // Injective φ} = G.labelledCopyCount F` | supports the sentence as written | none |

The rows of the previous review, of `b373666`, for the untouched statements (1.0–1.3, 2.0, 2.1, 2.3, 2.4, the arrow counts of the Conventions, Lean against README) stand as written there.

- Change since `b373666`: 5 lines of `TauCetiRoadmap/GraphReconstruction/README.md` (two passages); `Suggested.lean` unchanged; nothing changed outside the folder.
- Source locators checked against the text: 1, the seeded target falling in the change (Lemma 2.26, proof, GardnerBM27Slides lines 640–696: the surviving term carries the exponent `e(G) − e(F)`, as the repaired sentence says).
- Library declarations opened at the pin: Tau Ceti `Combinatorics/SimpleGraph/Counting.lean` 56 (namespace), 116, 131; `Combinatorics/SimpleGraph/Moebius.lean` 51, 58.
- Cross-roadmap citations in the changed passages: none.
- Dependency check: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with seven `sorry` warnings and nothing else. Automatic checks: all passed; none set aside.
- Pull request text: title and description read against this head; no sentence is contradicted and the change needs no mention (the description states the lemma's exponent as `e(G) − e(F)` and names the Tau Ceti file with its declarations).
- Overlap check: read MatchingTheory, CocliquesColouringsAndTheta, GraphColouring, HamiltonianCycles, MatchingPolynomial (scopes as in the previous review; the change adds no object); nothing shared.

Source independence: changed passages only; 2 passages compared with 1 source (GardnerBM27Slides, proof of Lemma 2.26), none shared beyond the forced exponent formula; largest share Bondy–Murty §2.7 as reproduced in GardnerBM27Notes, 11 of 17 locators; no layer added, removed or reordered, so the arrangement was not compared again: independent as in the previous review. The book itself and Kelly1957 were not read.

Research link: The headline targets are the published results of Lovász (1972), Müller (1977) and Nash-Williams (1978) towards the edge reconstruction conjecture, and Kelly's lemma (1957) towards the reconstruction conjecture, both open; rests on the README's references and scope section and on GardnerBM27Notes (Conjectures 2.19, 2.23).

## Not verifiable

- Kelly (1957), p. 961, Lemma 1 and Lemma 2: not read (the journal's host is not one the sources service classifies); untouched by this change.
- Bondy–Murty, *Graph Theory*, §2.7 itself: paywalled; checked only as reproduced in Gardner's notes and slides.
- Lovász (1972), Müller (1977): paywalled, cited for attribution only; Nash-Williams (1978): not looked for.
- Ownership against open pull requests: not re-read at each head; the change introduces no new object.

## Source issues

- none (none new; the seven of the previous review stand)

## For the human reviewers

- **Scope/sources.** 11 of the README's 17 locators point to one textbook section (Bondy–Murty §2.7), read only through R. Gardner's course notes and slides on his own university page (README References); the book was not opened.
- **Licence.** Gardner's notes reproduce the book's numbered statements and quote it; the README cites the book "as reproduced in" them. Whether those notes are an acceptable place to read the book's statements is yours to decide.
- **Not tested.** Kelly (1957) could not be read; its three locators (README, sections 1.1 and 1.2) are unchecked.
- **Reuse.** The README's scope section names two public Lean developments. SamuelSchlesinger/reconstruction-conjecture shows no licence on its front page; its definitions differ in shape from `Suggested.lean`. The formal-conjectures file was not opened.
- **Scope.** The scope section names an unpublished 2026 preprint from google-research as context; no statement rests on it.
