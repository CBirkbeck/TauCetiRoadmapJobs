# Review of CharacteristicPolynomialsAndStarComplements (pull request #3059 at 84cc630)

**Verdict:** accepted

**Summary.** Accepted. This head makes the one small correction and the two format notes of the previous review, and the 80 changed lines introduce no new defect: the statements they cite were recomputed, the links added resolve to roadmaps on main, and `Suggested.lean` elaborates with `sorry` as the only warning. There are no findings, no small corrections and no format notes. As before, the textbook by Cvetković, Rowlinson and Simić, which carries the largest share of the locators, could not be read, and that is left to the human reviewers.

## Previous findings

The previous review (of `87fae50`) had no finding; its other remarks are accounted for here.

- C01 — repaired: the Mathlib contract no longer lists `eigenvalue_mem_ball` (README line 594) and its `#check` line is gone; 4.4 still cites "his row-sum bound [H, Lemma 2.3, p. 4]" (line 500), which names no library lemma.
- N01 — repaired: 3.3 (lines 340–343) now says the exercise of [BH] states the determinant bound and `E ≤ √(2mn)`, and that `2√m ≤ E` "has no locator in these sources and is proved in the suggested proof below".
- N02 — repaired: Conventions (lines 96–97) now read "as in [BH, §2.5, p. 26], which takes `m < n`; the case `m = n` is admitted here".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.3 `energy_bounds` (locator sentence changed) | `K₂`; `P₃`; `C₄`; empty; the `4m` variant on `K₂` | `2 ≤ 2 ≤ 2`, `√(2+2·1·1) = 2`; `2√2 ≤ 2√2 ≤ √12`, `√4 ≤ 2√2`; `4 ≤ 4 ≤ √32`, `√8 ≤ 4`; `0`; `√(4+2) = √6 > 2` | hold; the `4m` form fails on `K₂` as the text says | none |
| Conventions / 4.1 `Interlaces` with `m = n` (sentence changed) | `{0,0}` in `{1,−1}`; `{1,−1}` in `{1,−1}`; `{2}` in `{2,−1,−1}` | `n − m = 0`: needs `1 ≥ 0 ≥ 1`, false; `1 ≥ 1 ≥ 1`, `−1 ≥ −1 ≥ −1`, true; `2 ≥ 2 ≥ −1`, tight `k = 1` | `m = n` admitted and forces equality; Lean body agrees | none |
| 1.1 copy `lapEigenvalues` (Lean line changed) | compared with the owner's definition on main | same type `Fin (Fintype.card V) → ℝ` and body `(G.isHermitian_lapMatrix ℝ).eigenvalues₀`; owner's `Suggested.lean` line 35, character for character | verbatim copy; `SimpleGraph` resolves to the root structure | none |
| 4.4 graph form (contract entry removed) | `d = 1`; `d = 2`; H Lemma 2.3 | `2 < 2·2`, degree `1 ≥ 1`; `4 < 2·3`, `2 ≥ √2`; the lemma bounds `λ₁(A) ≤ Δ(H)` by a largest-coordinate argument inside its own proof | route needs no Gershgorin lemma | none |

The rows for the untouched statements stand as in the previous review, of `87fae50`.

- Source locators checked against the text: 3 in [H] (Theorem 1.1 at H line 29, p. 1; Lemma 2.2 at H line 121, p. 4; Lemma 2.3 at H line 142, p. 4). The [BH] passages behind the two reworded locators were not read again this round (see below); the new wording says exactly what the previous review recorded from the text.
- Library declarations: all remaining `#check` lines elaborate at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`); `eigenvalue_mem_ball` is named nowhere in the folder.
- Cross-roadmap citations resolved: on main, GraphSpectra 1.2 (with the derivative item, README line 180), 1.7, 1.8, 2.3, 2.6, 3.2, 3.8, 3.9; SpectralGraphBounds 1.1; LaplacianEigenvaluesOfGraphs 1.1; MatchingPolynomial 1.1, 2.2; RandomMatrices 1.2; at open heads, DecisionTreeComplexity 5.1, MatchingTheory 1.1, TuttePolynomialAndArrangements 4.1. The five relative links the change adds point to folders that exist on main.
- Dependency check: `depcheck: 101 roadmaps, 1129 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: 26 `sorry` warnings, no error, no other warning; no `set_option`, the imports are `Mathlib` and one Tau Ceti module.
- Pull request text: the title and description were read against this head; no sentence is contradicted (suppliers on main and open, 26 `sorry`, the pins, the closest roadmaps), and the change removes or adds no section, declaration or supplier.
- Overlap check: read GraphSpectra, MatchingPolynomial, SpectralGraphBounds (main) and the lists of closest open roadmaps (LaplacianSpectraAndSpanningTrees, LineSystemsAndSwitching, RamanujanGraphs, GraphSymmetryAndCayleyGraphs, CocliquesColouringsAndTheta) as in the previous review; the change touches no ownership; shared: Huang's theorem, owner DecisionTreeComplexity 5.1, cited here; nothing else shared.

Source independence: changed passages only; 3 passages compared with 1 source (H) and with the previous review's record of BH, none shared; largest share CRS, 23 of about 52 locators; contents of CRS not read; the change adds, removes or reorders no layer.

Research link: 4.4 rests on Huang (2019), the proof of the sensitivity conjecture (H, read). 4.3 is the star-complement technique and the Bell–Rowlinson multiplicity bound, in current use by Ramezani, Rowlinson and Stanić (2019) and Yang et al. (2022) (arXiv texts read). 4.2 is Haemers's tight interlacing (BH, read).

## Not verifiable

- [BH, Exercise 3.10, p. 65] and [BH, §2.5, p. 26], the two locators whose sentences changed: no legal copy could be fetched this round; the new sentences match what the previous review read in the text (the exercise states the determinant bound and `E ≤ √(2mn)` only; interlacing is defined for `m < n`).
- [CRS] (23 locators), [B], [Ba], [N–P], [St]: not readable, as in the previous review; the misprint the README reports in [St, Theorem 8.14] was checked only arithmetically (the `4m` form gives `√6 > 2` on `K₂`).

Automatic checks set aside as false positives: Mathlib's `Matrix.det_apply'`, which the README cites as a Mathlib lemma and `Suggested.lean` pins with `#check`, was read as a name this roadmap claims to declare.

## Source issues

- none

## For the human reviewers

- **Not tested.** [CRS] carries 23 of about 52 locators and could not be read: its wording and table of contents were not compared with the README. [B], [Ba], [N–P] and [St] were not read either.
- **Scope.** The sources are six textbooks and one refereed article (Huang, Ann. of Math. 2019); [N–P] is cited for one exercise beside [H] in 4.4.
