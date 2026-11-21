# Review of PeriodicNonnegativeMatrices (pull request #2925 at 9542da7)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, and no finding remains. The docstring of `period` and the module docstring of `Suggested.lean` now restrict the closed-walk description of the period to entrywise nonnegative matrices, the README does the same in its Conventions and in 1.1 and records the `1 × 1` matrix `(−1)` as a Check, and the two new Checks were recomputed and are true. There are no small corrections and no format notes. Brouwer–Haemers, the source with the larger share of the locators, still could not be read through a channel the project accepts, so its eight locators remain unverified and the status of that copy is for a human to settle.

## Previous findings

- R01 — repaired: the docstring of `period` now reads "For an entrywise nonnegative `A` this is the gcd of the lengths of the closed walks at `i` in the quiver of positive entries"; README 1.1 and Conventions agree, and `(−1)` is a Check.
- C01 — repaired: the Check of 1.3 now says a primitive matrix "has no cyclic labelling by `ZMod 2`", with `[[1, 1], [1, 0]]`, whose loop would force `c 0 = c 0 + 1`; it fails for a matrix of even period.
- N01 — repaired: the README no longer names a Mathlib pull request or a file in it; 1.1 keeps only the identification with the vertex period of `Matrix.toQuiver A` for nonnegative `A`, and the scope paragraph is gone.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `period` (docstrings, README 1.1, Conventions) | `(−1)`; `[[0,1],[1,0]]`; `1×1` zero; `k = 0` | `(−1)`: no arrow, quiver gcd 0; `(−1)^k > 0` iff `k` even, `setGcd {2,4,…} = 2`. Swap: 2 and 2. Zero: `setGcd ∅ = 0`. `k = 0` excluded by `0 < k` | the two descriptions are now equated only under nonnegativity, the hypothesis of the Mathlib lemma | none |
| New Check of 1.1, `(−1)` | `A = (−1)` on one index | `Matrix.toQuiver A` has an arrow only when `0 < A i j`: none; `period A 0 = 2` | true; separates the definition from the quiver period | none |
| New Check of 1.3 against `dvd_period_iff` | `[[1,1],[1,0]]`, `m = 2`; `[[0,1],[1,0]]`, `m = 2` | `A² = [[2,1],[1,1]] > 0`, primitive, period 1; `0 < A 0 0` forces `1 = 0` in `ZMod 2`: no labelling, `2 ∤ 1`. Swap: labelling `(0,1)` exists, `2 ∣ 2` | true, and it fails for period 2, so it tests the period | none |
| Conventions, closed walks and powers | `A` nonnegative, `k ≥ 1`; `A = (−1)`, `k = 2` | lemma: `0 < (A^k) i i` iff a path `i → i` of length `k`, under `∀ i j, 0 ≤ A i j`; `(−1)`: `(A²) 0 0 = 1 > 0`, no path | the added hypothesis is exactly the lemma's | none |

The rows for the statements the change does not touch stand as in the previous review, of `60d7b18`; no Lean statement changed (docstrings only).

- Source locators checked against the text: 3 in Boyle, where the changed passages touch them (Definition 3.1 and the remark after it, Definition 3.2 and the following paragraph, p. 3, Boyle lines 121–143; Proposition 3.3, p. 4, Boyle line 173); the 8 locators into Brouwer–Haemers were again not read.
- Library declarations opened at the pin: `Matrix.pow_apply_pos_iff_nonempty_path`, `Mathlib/LinearAlgebra/Matrix/Irreducible/Defs.lean`, line 116, with hypothesis `hA : ∀ i j, 0 ≤ A i j` and `k : ℕ` unrestricted.
- Cross-roadmap citations: none added or changed; the citation of MarkovChainsAndRenewal, Layer 3, in the scope section is unchanged, and the removed paragraph was the only other mention.
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: 13 warnings, each `declaration uses sorry`, no error; the elaborated signatures are those of the previous head.
- The pull request's title and description against this head: they already say that the period of 1.1 is the quiver period for a nonnegative matrix and that the two can differ with a negative entry; nothing in them names what the change removed. No change outside the folder.
- Headline theorems: the 13 of the README, all stated, as before; the change adds or removes none.

Overlap check: read SpectralGraphBounds, StronglyRegularAndMooreGraphs, MatchingPolynomial, ExpanderConstructions, GraphColouring, and also ClassicalErgodicTheory, KernelsAndSpectralMethods, MarkovChainMixing and MarkovChainsAndRenewal, as in the previous review; nothing shared. EquiangularLinesAndTwoGraphs, new among the closest by vocabulary, was searched for the period of a matrix, cyclic classes and the peripheral spectrum: nothing shared. The change adds no object.

Source independence: changed passages only: 5 changed passages compared with 1 source (Boyle, lines 118–143 and 173), none shared (the `(−1)` and `ZMod 2` Checks and the nonnegativity clauses have no counterpart there); largest share Brouwer–Haemers, 8 of 14 locators, whose text and table of contents could not be read; the change adds, removes or reorders no layer, so the arrangement was not compared again.

Research link: rests on the README. The cyclic classes of 1.3 are the spectral decomposition of irreducible subshifts of finite type (ClassicalErgodicTheory §8.4 item 3); Layers 2 and 3 are the Perron–Frobenius statements of Brouwer–Haemers, Spectra of Graphs (Springer), Theorem 2.2.1 and Proposition 3.4.1, as the README cites them, used throughout spectral graph theory.

## Not verifiable

- Brouwer–Haemers, *Spectra of Graphs*: §2.2 and Theorem 2.2.1 (iii) with its proof, pp. 29–31, and §3.4 with Proposition 3.4.1, p. 46 (cited in 1.1, 1.3, 1.4, 2.1, 2.2, 3.1, 3.2, 3.3). The sources service again did not accept the cited host as an author's page, and the published book is behind a paywall; not read.

## Source issues

- none

## For the human reviewers

- **Not tested.** Brouwer–Haemers carries 8 of the 14 locators (README, References, lines 590–594); its text and table of contents were not read, so wording and arrangement were not compared with it.
- **Licence.** The README cites Brouwer–Haemers from a file on a page it attributes to the first author (README, line 591); the sources service could not classify that host. The published book is Springer, Universitext.
- **Scope.** The second source, Boyle's notes (README, lines 595–597), is an unpublished seven-page course text on its author's page; it carries the locators of 1.2–1.4 and part of 2.1–2.2. The statements are standard Perron–Frobenius theory.
- **Scope.** The hypothesis `2 ≤ period A i` of `peripheral_spectrum` is, by the README's own account (lines 297–300), unused by the route and present only because the case `d = 1` belongs to ClassicalErgodicTheory §8.6 item 1, a roadmap that is still an open pull request.
