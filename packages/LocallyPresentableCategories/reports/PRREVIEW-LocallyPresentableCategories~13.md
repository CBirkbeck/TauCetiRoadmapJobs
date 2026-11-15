# Review of LocallyPresentableCategories (pull request #1926 at a051ce9)

**Verdict:** accepted

No findings. Incremental re-review of the 15 lines of `TauCetiRoadmap/LocallyPresentableCategories/README.md` changed since `7c83474`.

## Previous findings

- R01 — repaired: README lines 81–86, "are ModelCategories' (§1.2, §1.3, §§1.4–1.5, §5.1 and Layer 6)", "PresentableInfinityCategories (Layer 1) and AccessibleInfinityCategories (§4.1)"; lines 987–988 name ModelCategories; the folder and the description no longer mention HigherToposTheory.
- R02 — repaired: description, *Review*: "Theorem 1.66 (cited for the right-adjoint half of 1.4 only)", as README 1.4 and the `isRightAdjoint_iff` docstring cite it.
- R03 — repaired: description, *Sources*: the Kelly bullet has "§3.5 (pp. 44–45)" and "the definition on p. 120 (§6.3)", the Wilson bullet "§1", and "Makkai–Paré 1989: ch. 5" is under "Cited by locator only".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.3 `isLocallyPresentable_iff_isAccessibleCategory_and_hasLimits`, against ModelCategories §1.2.1 (Lurie's four conditions), which the changed Scope bullet cites | `Type w`; `(Type w)ᵒᵖ`; discrete category on 2 objects; `Type (w+1)` at universe `w` | `Type w`: presentable, accessible, complete, Lurie (1)–(4) hold. `(Type w)ᵒᵖ`: complete, not accessible, Lurie (3) fails: all false. Discrete 2: accessible, no terminal and no initial object: all false. `Type (w+1)`: not locally `w`-small: all false | sound; the two statements are distinct characterisations of the same Mathlib carrier and agree on all four | none |

The diff changes no statement. The rows for the other statements stand as in the previous review, of `7c83474`.

- **Change and gate.** The folder changed by 15 lines of `README.md` (8 insertions, 7 deletions); `Suggested.lean`, `metadata.toml`, `lake-manifest.json` and the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`) are unchanged. `git diff --stat origin/main...HEAD` outside the folder is empty, as the description says. The gate, rerun on `a051ce9`, gives 0 on every check and `OK` (the worker's gate also gives `build=0`). `lake env lean` on `TauCetiRoadmap/LocallyPresentableCategories/Suggested.lean` exits 0 with 27 warnings, all `sorry`, and no error.
- **Dependency check.** `depcheck: 245 roadmaps, 2229 edges, 0 problem(s)`: no UPWARD or CYCLE line. The roadmap is line 412 of the merge-order candidate.
- **Cross-roadmap citations of the changed passages resolved (8).** ModelCategories at `ac5fe3a`: §1.2 (1.2.1, Lurie's four conditions for `IsLocallyPresentable`, README line 237), §1.3 (weakly saturated classes), §1.4 (1.4.1, the small object argument in a locally presentable category) and §1.5, §5.1 (5.1.1, accessible subcategories of a presentable category), Layer 6 (combinatorial model categories). PresentableInfinityCategories at `7e04598`: Layer 1 (§1.1 presentable ∞-categories). AccessibleInfinityCategories at `7e04598`: §4.1 (accessible ∞-categories and functors). On main `2248bbb`: EnhancedDerivedSheaves §E0.8 (line 376) and Layer E5:presentability (line 174), BordismFormalGroups §F6.5 (line 1526). `roadmaps show HigherToposTheory` still prints that no such roadmap exists; the head no longer cites it.
- **Downstream consumers, lines 987–988.** ModelCategories' supplier contracts list `IsCardinalPresentable`, `IsCardinalLocallyPresentable`, `IsCardinalAccessibleCategory` and `IsLocallyPresentable` under "From Mathlib" and "None" under "From TauCetiRoadmap"; its §1.2.1 defines presentable as Mathlib's `IsLocallyPresentable.{w}`. The sentence is accurate, and no supplier edge arises in either direction.
- **Library declarations opened (2).** `CategoryTheory.IsLocallyPresentable` and `CategoryTheory.IsAccessibleCategory`, `Mathlib/CategoryTheory/Presentable/LocallyPresentable.lean` lines 80 and 87 at the pin: existence of a regular `κ : Cardinal.{w}` with the `κ`-indexed class; the instance from locally presentable to accessible is at line 97.
- **The description against the head.** The Scope paragraph names ModelCategories (§§1.2–1.5, §5.1, Layer 6), PresentableInfinityCategories, AccessibleInfinityCategories, EnhancedDerivedSheaves and BordismFormalGroups as the README does. "Nothing outside the folder changes", "27 headline theorems", the pins, the three "Not stated" items and "Nothing is consumed from another roadmap" match the head. The seeded sample falls in no changed passage, and the diff touches no source locator.
- **Overlap check:** read ModelCategories (`ac5fe3a`), AccessibleInfinityCategories, PresentableInfinityCategories and PresheavesAndCompletions (`7e04598`) and OrthogonalFactorization (unchanged since the previous review); nothing shared. ModelCategories states that completeness of presentable categories is not used there and plans none of targets 1.1–1.8; the two ∞-categorical roadmaps use the 1-categorical carriers in Checks only. `overlaps.md` lists no other pull request changing this roadmap, no dropped id, no revision-only id and no second copy.
- **Source independence:** changed passages only: 3 passages compared (README lines 81–83, 84–87, 987–988) with 0 sources, since none carries a source locator; set beside the headings of ModelCategories §§1.2–1.5, §5.1 and Layer 6 they share standard names only. Largest share Kelly (TAC Reprints 10), 40 of 106 locator tokens, as counted at `7c83474`; the arrangement was not compared again, since no layer was added, removed or reordered.

## Not verifiable

- Adámek–Rosický 1994: Theorems 1.46, 1.66, 2.26, Corollary 2.47, Definition 3.34 and Theorem 3.36, which the description lists as unchecked. The book is paywalled and not in the sources cache.
- Makkai–Paré 1989, ch. 5: AMS Contemp. Math. 104 is paywalled and not in the cache.
- Gabriel–Ulmer 1971, Satz 7.13, and Adámek–Borceux–Lack–Rosický 2002, Theorems 2.4 and 5.5: paywalled, not re-fetched, as in the previous reviews.

## Source issues

- none

## For the human reviewers

- Not tested: Adámek–Rosický 1994 (paywalled, unread) carries 22 of 106 locator tokens, the second-largest share after Kelly's 40. Its theorem numbers in 1.1–1.5, 2.1, 3.2 and 3.5 rest on the author's citation, and the description asks a reader of the book to check them.
