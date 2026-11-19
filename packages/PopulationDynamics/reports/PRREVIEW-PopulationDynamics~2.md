# Review of PopulationDynamics (pull request #2513 at bcd1173)

**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 13 lines changed since `61cf2e9`, and the one finding of the previous review is repaired. The rewritten list of equilibria of the competition system in 2.4 is now complete and correct in every case I recomputed (`a b ≠ 1` with an interior, a boundary or an outside intersection; `a b = 1` with disjoint and with coincident lines), and the attribution in 3.1 no longer carries an untraceable year. There are no findings, no small corrections and no format notes; the two facts about scope and source copies from the previous review remain for the human reviewers.

## Previous findings

- R01 — repaired: 2.4 now lists `(0, 0)`, `(K₁, 0)`, `(0, K₂)` "and the points of the quadrant on both lines", with the single point for `a b ≠ 1` and the segment for `a b = 1`, `K₁ = a K₂`.
- N01 — repaired: 3.1 now reads "the law is named after Hardy and Weinberg", with no year.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 2.4 equilibria in the closed quadrant: the three points and the quadrant points on both lines | zero set of the field by cases `x = 0` or `x + a y = K₁`, `y = 0` or `b x + y = K₂` | `x = y = 0`: `(0, 0)`; `x = 0`, second line: `(0, K₂)`; `y = 0`, first line: `(K₁, 0)`; else both lines | holds | none |
| 2.4 single intersection for `a b ≠ 1` | `(K₁, K₂, a, b) = (2, 3/2, ½, 2/5)`; `(1, 1, 3/2, 2)` | `(5/4)/(4/5) = 25/16`, `(7/10)/(4/5) = 7/8`; `(−½)/(−2) = ¼`, `(−1)/(−2) = ½`; both satisfy both line equations | holds | none |
| 2.4 "one of the three points above when one of them is `0`" | `(1, 2, ½, ½)`; general `K₁ = a K₂`; both zero | `x = 0`, `y = (3/2)/(3/4) = 2 = K₂`; `y = K₂(1 − a b)/(1 − a b) = K₂`; both zero forces `a b = 1`, excluded | holds | none |
| 2.4 `a b ≠ 1`, a negative coordinate | `(1, 1, 2, ¼)` | intersection `(−2, 3/2)` lies outside the quadrant; exactly three equilibria, as "points of the quadrant" says | holds | none |
| 2.4 `a b = 1`: disjoint unless `K₁ = a K₂`, then a segment | `(1, 2, 1, 1)`; `(1, 1, 1, 1)`; `(2, 1, 2, ½)` | `a·(b x + y) = x + a y`, so lines are `x + a y = K₁` and `= a K₂`; `1 ≠ 2` disjoint; field at `(½, ½)` and at `(1, ½)` is `(0, 0)`; segment ends `(K₁, 0)`, `(0, K₂)` | holds | none |
| 2.4 "each of the three convergence statements … exclude this last case" | hypotheses of exclusion, coexistence, bistability (README and Lean) | `a K₂ < K₁`, `a K₂ < K₁`, `K₁ < a K₂`: each contradicts `K₁ = a K₂`; the exchanged exclusion case has `K₁ < a K₂` too | holds | none |
| 2.4 second bullet (limit is an equilibrium) against the new segment case | `a b = 1`, `K₁ = a K₂` | `Q/r₂ = 1 − (x + a y)/(a K₂) = P/r₁`: same sign, both coordinates monotone and bounded, limit on the segment or an axis point | consistent | none |
| `tendsto_competition_of_coexistence`, `tendsto_competition_of_bistable` (Lean, cited by the changed text) | limit point against the new README formula | Lean: `((K₁ - a * K₂) / (1 - a * b), (K₂ - b * K₁) / (1 - a * b))`; coexistence gives `a b < 1`, bistable `a b > 1`, both coordinates positive | agree | none |
| 3.1 attribution sentence | reference list | no year claimed; no dangling citation | holds | none |

The rows of the previous review for the untouched statements stand as in that review, of `61cf2e9`.

- Source locators checked against the text: 1 in the changed passages' neighbourhood (T, Theorem 7.4, T line 9755: eventual monotonicity of both components for strictly competitive planar systems, as the second bullet of 2.4 uses it). The diff adds no locator; the rest of the seeded sample falls outside the changed passages and stands as verified at `61cf2e9`.
- Library declarations: the diff cites none; `Suggested.lean` is unchanged since `61cf2e9`.
- Cross-roadmap citations: the diff adds none; the citation resolver reports no cross-roadmap citation unresolved, and the five Lean names it lists are this roadmap's own declarations in the `IsGaltonWatson` namespace.
- Dependency check: `depcheck: 200 roadmaps, 2184 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head. Elaboration of `TauCetiRoadmap/PopulationDynamics/Suggested.lean`: 32 `sorry` warnings and nothing else.
- Pull-request text against this head: the description names the three competition results (exclusion, coexistence, the three-way alternative) and not the list of equilibria or the attribution, so no sentence is contradicted and no change is left unstated; nothing outside the roadmap folder is changed.
- Headline theorems and padding: no statement of `Suggested.lean` changed; the result of the one-tactic probe at `61cf2e9` stands.

Overlap check: read MarkovChainMixing, PointProcesses, HiddenMarkovModels, MarkovChainsAndRenewal, StochasticCalculus, MarkovDecisionProcesses; one shared object, unchanged by this diff: PointProcesses Layer 12 states that the generation sizes of the Hawkes family tree form a Galton–Watson process with Poisson offspring and says it is not a branching-process library, so the general process is owned here and the Poisson family tree there; nothing else shared.

Source independence: changed passages only: 2 passages (the equilibria paragraph of 2.4 and the attribution sentence of 3.1) compared with 1 source (T, Section 7.1, lines 9743–9784, which treats general competitive systems and does not list these equilibria), none shared; largest share PTE, 13 of 51 locators, as at `61cf2e9`; the diff adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: Layer 1 is the second-moment case of the Kesten–Stigum theorem (Lyons and Peres 2016, Section 5.1 and Chapter 12); 3.4 gives the coalescence times of Kingman's coalescent and Watterson's formulas as in Durrett 2008, Chapter 1. It rests on the sources read.

## Not verifiable

- The sentence of "Provenance and prior work" that no entry on the probability theory page of the Isabelle Archive of Formal Proofs concerns branching processes or population genetics: the Archive was not consulted (untouched text, as in the previous review).
- The numbering of the 8 November 2016 version of Lyons–Peres that the README names: only the later authors' version was read in the previous review; not reopened here.

## Source issues

- none

## For the human reviewers

- Scope: several targets are exercises or problems in the cited textbooks (Teschl Problems 1.15 and 7.2; Lyons–Peres Exercises 5.27 and 5.28), and 3.1 is elementary algebra; the sources are refereed textbooks and one expository article (Weiss).
- Licence: Durrett's two books were read from the author's university page and Weiss from the journal's own site, both classed by the reviewer as author-page copies; Teschl was read here in the author's preliminary version on his university page.
