# Review of ArtinAlgebras (pull request #2190 at 39f4690)
Folder: `TauCetiRoadmap/RepresentationTheory/ArtinAlgebras/`
**Verdict:** accepted

No findings.

## Previous findings

Ids refer to `packages/ArtinAlgebras/reports/PRREVIEW-ArtinAlgebras~13.md`.

- R01 — repaired: “Over a field the existence theorems are Tau Ceti's `ModuleCat.exists_isAlmostSplit_arTranslate` and `ModuleCat.exists_isAlmostSplit_of_not_injective`, their case `R = k`, both of which QuiverRepresentations 6E consumes.” (README.md:1015–1017)

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 4.3 consumer clause (changed) against QuiverRepresentations 6E on main (7342e8f) | 6E → §6.3 (line 870); §6.3, lines 945–948; Tau Ceti contract, lines 376–377 | pinned existence theorems §6.3 cites: 2 of 2 (line 945, line 947); head says “both”: 2; the replaced text said “the first”: 1 | agrees | none |
| 4.3 `exists_isAlmostSplit` at `R = k` against `ModuleCat.exists_isAlmostSplit_arTranslate` | `kQ`, `Q = 1 → 2`, `M = S₁`; `A = k` | both give `0 → S₂ → P₁ → S₁ → 0`, `τ S₁ = S₂`, middle term of dimension 2; `A = k`: every module projective, both vacuous | field case is `R = k` | none |
| 4.3 `exists_isAlmostSplit_of_not_injective` at `R = k` against `ModuleCat.exists_isAlmostSplit_of_not_injective` | `k[ε]/ε²`, `N = k`; `kQ`, `N = S₂`; `A = k` | `0 → k → k[ε]/ε² → k → 0` from both; `0 → S₂ → P₁ → S₁ → 0`; `A = k`: every module injective, both vacuous | field case is `R = k`; Tau Ceti's finiteness of `E`, `M` automatic in `FGModuleCat` | none |

The rows for untouched statements stand as in the previous review, of `172ba68`.

- Source locators checked against the text: 0. The changed sentence carries no locator; its paragraph's [ARS, Thm. V.1.15, p. 145] is under Not verifiable. Of the seeded sample only 4.3 falls in the change.
- Library at the pins, 2 declarations opened: Tau Ceti `ModuleCat.exists_isAlmostSplit_arTranslate` and `ModuleCat.exists_isAlmostSplit_of_not_injective` (`Algebra/Category/ModuleCat/AuslanderReiten/Sequence.lean:70`, `:110`), over `[Field k] [FiniteDimensional k A]` with `Module.Finite` terms.
- Cross-roadmap citation resolved on main (7342e8f): QuiverRepresentations 6E → §6.3, which consumes both theorems. No open pull request changes QuiverRepresentations. Remark, no change asked here: QuiverRepresentations lines 80–81 still say ArtinAlgebras lists it as a supplier; this head's “From other roadmaps” is “None.”
- Gate: the worker's gate passes (`build=0`). A hand run gives every check 0 except `outside-folder` for `TauCetiRoadmap/RepresentationTheory/README.md`, the family index, which is this pull request's own file and is unchanged since `172ba68`. No other file outside the folder changes.
- Elaboration: `lake env lean Suggested.lean` gives 26 `sorry` warnings and nothing else; `Suggested.lean` is unchanged since `172ba68`. The elaborated types of `exists_isAlmostSplit` and `exists_isAlmostSplit_of_not_injective` keep `R`, `[IsArtinianRing R]` and `[Module.Finite R A]`.
- Dependency check: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Pull request text against the head: the commit counts hold (six, five, twelfth `172ba68`, thirteenth `39f4690`); “§4.3 now says that QuiverRepresentations 6E consumes both pinned existence theorems” matches README.md:1017; “26 `sorry` warnings and no other messages” matches the elaboration.
- Overlap check: read QuiverRepresentations (main: scope lines 50–56 and 78–81, §6.3); a search for almost-split existence over main and the 439 open heads hits only ArtinAlgebras and QuiverRepresentations, none of RepresentationTheory (#1047, #1220, #1775, main), GrothendieckEulerForms (main), GeneralAlgebraicKTheory (#1212). Existence over a field is Tau Ceti's, consumed by both; nothing shared.

## Not verifiable

- [ARS] (Cambridge Studies in Advanced Mathematics 36; no open copy, and the package has no sources manifest recording one): Thm. V.1.15, p. 145, in the paragraph of the changed sentence.

## Source issues

- none
