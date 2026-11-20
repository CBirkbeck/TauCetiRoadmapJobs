# Review of GeometricTopology (pull request #1797 at 3c18d43)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, the `n`-component unlink of 4.1 now being `n` round circles, one in each of `n` pairwise disjoint balls, and the unsupported `e^n` lower bound is gone from 4.14, which answers the question that review asked. The repair introduced no new problem and no finding remains. One format note is carried over (a section number in a locator of 5.2), not blocking; three points are left for the human reviewers.

## N01 — One locator in 5.2 still points to the wrong section of Hatcher's notes

In the lens-space item of 5.2 (line 6338) both descriptions of `L_{p/q}` are cited to Section 2.1. The gluing of two solid tori is there (`hatcher-3m` line 1204); the quotient of `S³` by the rotation `(e^{2πi/q}z, e^{2πip/q}w)` is in Section 1.1 (`hatcher-3m` lines 333–335).

## Previous findings

- R01 — repaired: "the `n`-component unlink is a set of `n` round circles, one in each of `n` pairwise disjoint balls" (4.1, lines 1542–1543). No other passage defines the unlink by great circles.
- N01 — not repaired: the lens-space item of 5.2 still cites Section 2.1 for the quotient description; kept above as a format note.
- Question on `e^n` — resolved: 4.14 now reads "The lower bounds `(2^(n−2)−1)/3`, `(2^(n−2)−3)/3` and `2^(n−2)/3` are stated each with its own count convention and threshold"; `e^n` occurs nowhere in the README.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 4.1 `n`-component unlink (changed text) | `n = 0, 1, 2`; Hopf link; Whitehead link | `n=0`: empty link; `n=1`: round circle, the unknot (a great circle lies in a ball); `n=2`: each bounds a disc in its ball, `lk=0`, split; Hopf `lk=±1`, Whitehead nonsplit: both excluded | holds | none |
| 4.1 Check *Unknot framings* against the new definition | great circle disjoint from the unknot | flat discs meet once, `lk=±1`: not in disjoint balls, so no conflict with the unlink | holds | none |
| 4.14 lower bounds (changed text) | `n = 4, 6, 8`; `N₄, N₆, N₈ = 1, 3, 21`; `C₄ = 1`, `C₆ = 5` | `(2^(n−2)−1)/3 = 1, 5, 21`; `(2^(n−2)−3)/3 = 1/3, 13/3, 61/3`; `2^(n−2)/3 = 4/3, 16/3, 64/3`; `N₄<4/3`, `N₆<13/3`, `N₈<64/3`; `3C₄=3`, `3C₆=15`: equalities | holds | none |
| 4.14 odd-word count, cited by the bounds | `m = 0, …, 6` | `3a_m = 2^(m+1) − 2(−1)^m`: `a = 0, 2, 2, 6, 10, 22, 42`, the Check's values; `a_m + a_(m+1) = 2, 4, 8, 16, 32, 64` | holds | none |
| 4.14 growth rates after the removal | liminf, limsup | `liminf ≥ 2` from `6N_n ≥ 2^(n−2) − 1`; `limsup ≤ 512` from `2·512^n`; no remaining sentence claims a rate above 2 from below | holds | none |

The rows of the previous review for the untouched statements stand as in that review, of `6b9e684`.

- Change since `6b9e684`: 5 lines of `README.md` (3 insertions, 2 deletions), two passages; `Suggested.lean` unchanged; nothing changed outside the folder.
- Source locators checked against the text: 1 (`hatcher-3m` lines 333–335 and 1204, for N01); the two changed passages carry no locator and none of the seeded sample falls in them.
- Library declarations opened at the pin: 2, for the unlink (`TauCeti.OrientedPDCode.unlink`, `KnotTheory/PDCode/Basic.lean` line 64, and the empty-word closure, `KnotTheory/BraidWord/PDCode.lean` line 579): diagram-level, consistent with the new sentence, not restated by it.
- Cross-roadmap citations: the change touches none; the citation search over main and the open heads lists nothing unresolved; the supplier contracts are unchanged.
- Uses of the unlink read against the new definition: 4.1 (linking number 0), 4.2, 4.3.4, 4.6 (`P` of the `n`-component unlink), 4.7.8 (all-zero pretzel); all consistent.
- Automatic checks: all passed, the targeted build included. Dependency check, run again: `depcheck: 200 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 34 warnings, all `declaration uses sorry`, for 34 theorems; no `variable`, `set_option`, definition or instance; the file is the one the previous review probed.
- Pull request text: read against this head; no sentence is contradicted, and the two repaired sentences change nothing it describes.

Overlap check: read FourManifolds, KhovanovHomology, HomotopySpheres (main), RibbonKnots, TeichmullerGeometry, PlanarTopology (open), as in the previous review, the change bearing on none of them; shared: Radó's theorem and the two-dimensional Hauptvermutung (owner here, Layer 11.2.1, on main); knots, sliceness and concordance (owner here, RibbonKnots consumes them); path smoothing in `Diff(M)` (owner TeichmullerGeometry §0.2, deferred here). The other open pull request that changes this folder merges with this head without conflict.

Source independence: changed passages only: 2 passages compared, neither carrying a locator or taken from a source (a one-clause definition and a list of three formulas); largest share lickorish1997, 66 of about 600 locators, as in the previous review; no layer added, removed or reordered, so the arrangement was not compared again; the text of lickorish1997 could not be read.

Research link: the end theorems are resolved problems of Kirby's list with their published proofs: Agol–Groves–Manning 2012, Gabai–Meyerhoff–Milley 2009, Li 2011, Kronheimer–Mrowka 2003, Levine 2014, Watanabe 2018, Yazdi 2016, Manolescu 2016; 4.8.3 uses Brittenham–Hermiller 2025. Rests on the README's references and the texts read.

## Not verifiable

- Nothing in the changed passages. The items of the previous review stand: texts recorded as uncertified or not in the cache (Hirsch, Lickorish, Ratcliffe, Haagerup–Munkholm, Monod, Rolfsen and others), Artin's *Theory of braids*, and the tabulated identifications behind Hypotheses 4.4.6, 4.5.5a, 4.5.5b, 4.8.3a and 4.8.3c.

## Source issues

- none

## For the human reviewers

- **Supply.** 4.8.3 consumes the Milnor conjecture "as stated", its proof being CombinatorialHeegaardFloer's, a roadmap that consumes Layer 4 and is no supplier here; the same text is on main. Whether a premise proved downstream is acceptable is yours to decide.
- **Not tested.** `lickorish1997`, the source with the largest share of locators, is uncertified: wording and arrangement were not compared with its text.
- **Licence.** The README links copies the sources manifest does not record: Artin 1947 on a third party's university page (4.2.8), Kauffman's and Friedl's author pages; 4.8.3 and 4.5.5 state braid words and DT codes as printed in Brittenham–Hermiller and the Knot Atlas.
