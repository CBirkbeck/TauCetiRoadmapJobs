# Review of CooperativeGames (pull request #2492 at 14648b3)

**Verdict:** accepted

**Summary.** Accepted on an incremental re-review of the 8 lines changed since `bf2aa32`: the one sentence of 6.2 that was false by a factor of two now gives the correct range of the marginal contributions, and its new two-coordinate example was recomputed and is right. No finding; one small correction (five named results still have no reference) and two format notes are carried over, none blocking. The questions of licence class and scope for the human reviewers stand as before.

## C01 — Weber's inclusion, Ichiishi's converse, Young's characterization, the Banzhaf value and the Harsanyi dividends are named after their authors and have no entry in the References

A reader cannot check that 4.5 is Young's theorem, or 2.4 Weber's, because the only locator at those places is "proved here" (2.3 line 365, 2.4 line 382, 4.5 line 759), and the References (lines 1050–1068) list none of these authors; Bondareva is named in the title of Layer 3 and cited only through Nisan et al. and Shapley. The statements themselves were checked through their proof sketches in the previous review and are untouched.

The smallest change is to add the bibliographic entries and one clause at each place saying how the statement here differs from the original. The usual references are Weber 1988 (*Probabilistic values for games*), Ichiishi 1981 (J. Econom. Theory 25), Young 1985 (Internat. J. Game Theory 14), Bondareva 1963 (Problemy Kibernetiki 10), Banzhaf 1965 and Harsanyi 1963; I did not open these, so the theorem numbers are for the author to supply.

## N01 — The `## Provenance` section describes demonstration scripts of an external repository

It is the one passage of the README that is not about the mathematics and will date; it would sit better in the pull request description, where the same information already is.

## N02 — The module docstring of `Suggested.lean` lists some twenty supplier names that the file does not use

Only `TauCeti.IsSubmodular` occurs in a statement; the list repeats the README's supplier contracts and would be shorter as a pointer to them.

## Previous findings

The previous report had no finding (no R item); its small corrections and format notes are accounted for here.

- C01 (range in 6.2) — repaired: "with `a = −ω` and `b = ω`, where `ω` is the oscillation of `f` on the points `S.piecewise x x₀` … `b − a` is twice the oscillation". The repair introduces no new problem.
- C02 (missing references) — not repaired: the References still list only Maleki et al., Nisan et al., Shapley (three), Štrumbelj–Kononenko, Sundararajan–Najmi. Written again as C01 above.
- N01 (Provenance section) — not repaired: lines 1038–1048 unchanged. Written again as N01.
- N02 (supplier list in the module docstring) — not repaired: `Suggested.lean` is unchanged. Written again as N02.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 6.2, range of the marginal contributions of the baseline game (changed sentence) | the README's example: `f(x₀1,x₀2) = f(x1,x2) = 0`, `f(x1,x₀2) = f(x₀1,x2) = 1`; `f` constant | game `v ∅ = 0, v{1} = v{2} = 1, v{1,2} = 0`; marginals of 1: `1` at `∅`, `−1` at `{2}`; `ω = 1`, so `b − a ≥ 2 = 2ω`. Constant `f`: `ω = 0`, `a = b = 0` | true; general case: marginal `= f(p) − f(q) ∈ [−ω, ω]` |
| 6.1 Hoeffding bound, applied with the new `a = −ω`, `b = ω` (cited by the changed sentence) | same example, `m = 1`, `ε = 1`; the former range `b − a = ω = 1` | Shapley value of 1 is `(1 − 1)/2 = 0`; every sample deviates by `1`, fraction `1`; bound `2·exp(−2/4) ≈ 1.21 ≥ 1`. Former range: `2·exp(−2) ≈ 0.27 < 1` | true with the new range; the old sentence would have been refuted |
| 6.2 two-coordinate formula against the example | same example | `((1 − 0) + (0 − 1))/2 = 0`; sum of both values `0 = f x − f x₀` | agrees with completeness |

The rows for the untouched statements stand as in the previous review, of `bf2aa32`.

- Changed passages read: 1 (6.2, lines 1002–1009); statements changed: none; `Suggested.lean` unchanged; no file changed outside the folder.
- Source locators: the changed passage keeps its one locator (Sundararajan and Najmi 2020, Section 2.3, equation (3)), checked in the previous review; the added text is commentary "proved here" with no new locator.
- Dependency check: `depcheck: 214 roadmaps, 2294 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head; none set aside.
- Elaboration of `TauCetiRoadmap/CooperativeGames/Suggested.lean`: 22 `sorry` warnings and nothing else.
- Pull request text: title and description read against the head; nothing in them describes the changed sentence, and the counts they give (22 theorems, 10 definitions, the suppliers) still hold.
- Overlaps: no other open pull request changes this roadmap, none drops an id it cites.

Overlap check: read RegretMinimizationAndEquilibria (the only close roadmap listed; open lists empty); nothing shared, as in the previous review (noncooperative games are its scope; submodularity is owned by GraphConnectivityAndFlows 4.1 and consumed through Tau Ceti).

Source independence: changed passages only; 1 passage compared with 1 source (SN19, Section 2.3), none shared: the added sentence and its example are the roadmap's own and occur in no cited source; largest share ShapleyP295, 7 of 28 locators; no layer added, removed or reordered, so the arrangement was not compared again (previous result: independent).

Research link: Layers 2–4 state the results of Shapley 1953 (value), Bondareva 1963 and Shapley 1967 (balancedness), Shapley 1971 (cores of convex games); Layer 6 is the estimator analysed by Štrumbelj–Kononenko 2010 and Maleki et al. 2013 and the baseline attribution of Sundararajan–Najmi 2020. Rests on the README's references and the texts read.

## Not verifiable

- The attributions to Weber, Ichiishi and Young (2.3, 2.4, 4.5): the README cites no text for them and none was opened.

## Source issues

- none (no source was reopened in this re-review; the item on Nisan et al., Definition 15.25 and Theorem 15.26, recorded by the review of `bf2aa32`, stands)

## For the human reviewers

- **Licence.** The three RAND papers (ShapleyP295, ShapleyRM4571, ShapleyRM4601) were read, in the previous review, from Internet Archive snapshots of RAND's own freely downloadable PDFs and classed publisher-open.
- **Licence.** Nisan et al. (AGT) was read, in the previous review, from a copy on a university course page, classed institutional.
- **Scope.** All statements are over `ℝ` (README line 49 excludes other ordered fields), although the suppliers `TauCeti.IsSubmodular` and Tucker's lemma are stated over general ordered fields and Layers 1, 4 and 5 use no analysis.
- **Scope.** Layer 6 rests on two arXiv preprints and one journal article from machine learning (MTH+13, SK10, SN19); the README's Provenance section ties it to the author's own repository.
