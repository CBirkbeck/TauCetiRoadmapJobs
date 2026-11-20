# Review of EntropyAndSourceCoding (pull request #2719 at 2d8993b)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the previous review, and the one small correction that review left, on the pull request description, is repaired: the description now names the strong subadditivity and Shearer inequality of ClassicalErgodicTheory §4.6 and says how 1.1 and 1.2 differ. The title and description were read sentence by sentence against this head and nothing in them is contradicted or left unstated. No findings, no small corrections, no format notes. The six Polyanskiy–Wu locators are still unread, and the same questions of scope and licence are left to the human reviewers.

## Previous findings

- C01 — repaired: the description now reads "the strong subadditivity and finite-set Shearer inequality of ClassicalErgodicTheory §4.6 for the window labels of a group action (1.1 and 1.2 here are for an arbitrary finite family of finite-valued labels)", as README lines 516–519 do.

(The previous review had no finding R01, R02, …; its only remark was C01.)

## Verified sound

The folder's diff changes no statement; the rows are for statements the description cites, recomputed at this head.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.2 strict bound, description's "the law `(1, 0)` shows the hypothesis is needed" | two symbols, law `(1, 0)`, `D = 2` | `H = 0`; two distinct non-prefix words have length ≥ 1, so `L* = 1`; `L* log 2 = log 2 = H + log 2` | non-strict bound holds with equality, strict fails without positivity: sentence true | none |
| 2.1/2.2, "the empty word is allowed for a one-symbol source" | one symbol, `c = []` | injective; `{[]}` prefix-free; `L* = 0`, `H = 0`; `0 ≤ 0 ≤ log D` | true | none |
| 1.2 counting form, "for `k ≥ 1`" | `k = 0`, `T = ∅`, one set; `k = 1`, `T = ∅`; empty index type, `m = 0`, `T = {()}` | `0^0 = 1 > 0`; `0 ≤ 0`; `1 ≤ 1` (empty product) | fails only at `k = 0`, as stated | none |
| 1.3 Fano, description's formula | `|A| = 1`; fair bit `X`, constant `Y` and `g` | `0 ≤ 0 + 0·log 0 = 0`; `log 2 ≤ h(1/2) + (1/2) log 1 = log 2` | holds, with equality in the second | none |
| 3.1 typical set, "words with a letter of probability zero are never typical" | a word with one letter of mass `0` | product `= 0 < exp(−n(H + ε))` | excluded by the lower bound of the definition: true | none |
| Description's count "15 headline theorems … 9 definitions", "imports only `Mathlib`" | `Suggested.lean` at this head | 15 `theorem`, 9 `def`, each `def` with a body; one import line | true | none |

The rows for the untouched statements stand as in the previous review, of `2d8993b`.

- Description against the head: every locator it lists (Polyanskiy–Wu 1.6, 1.8 with (1.18), 3.12 with (3.18), 10.9, 10.10, Remark 10.4; Gallager 2.3.1, 2.5.1, 2.6.1, 2.7.1, 2.7.3, Lemmas 2.5.1–2.5.4, §2.5.3, (2.25)–(2.26); MacKay 4.1, (4.18)–(4.19); Galvin 2.8, 2.9) occurs in the README; the README has no locator the description omits.
- Cross-roadmap citations resolved again: 7 (ProbabilisticAndMetricNumberTheory §5.1a at README line 6741 with its three named targets and §5.2, MathematicalStatisticsNonparametric §2.4 at line 670, GeometryOfNumbersAndQuadraticArithmetic §4.2, all on main; ArithmeticDynamics §2.7, ClassicalErgodicTheory §4.6 at lines 1269–1274, MeansMajorizationAndDiscreteInequalities §5.4, ComparisonSortingAndSelection §1.3, all at their open heads and none on main, as the description says).
- Source locators checked against the text this round: 0 (no passage changed).
- Dependency check: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`; the only supplier roadmap is on main.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: 15 `sorry` warnings, nothing else.
- No file outside the roadmap folder is changed.
- Overlap check: read DifferentialEntropyAndEntropyPower (differential entropy only, which this roadmap's scope excludes; nothing shared) and ClassicalErgodicTheory §4.6 again (window labels of a group action, owner ClassicalErgodicTheory; the general finite-family form of 1.1 and 1.2 is owned here, and both README and description say so); ComparisonSortingAndSelection, SeriesOfIndependentRandomVariables, ImportanceSamplingAndVarianceReduction and AlgebraicCodingTheory stand as read in the earlier reviews; nothing else shared.

Source independence: changed passages only; the folder has no changed passage, so 0 passages compared this round; largest share Gallager, 11 of 21 locators; no layer added, removed or reordered, so the arrangement stands as compared before (independent). Polyanskiy–Wu could not be read.

Research link: Shearer's lemma (Chung, Graham, Frankl, Shearer 1986) is the tool of the entropy counting method surveyed in Galvin 2014 (§§3–4, graph-copy counts); Fano's inequality underlies minimax lower bounds as in MathematicalStatisticsNonparametric §2.4. Rests on Galvin's text and the README's scope section.

## Not verifiable

- Polyanskiy–Wu, Theorems 1.6 (p. 16), 1.8 with (1.18) (p. 18), 3.12 with (3.18) (p. 57), 10.9 part 2 (pp. 207–208), 10.10 (p. 209) and Remark 10.4 (p. 208): not read, as in the previous reviews; nothing changed at these locators.
- The description's account of the author's brute-force checks (instance counts, ranges of `n`) cannot be reproduced from the pull request; no statement of the roadmap rests on it.

## Source issues

- none

## For the human reviewers

- **Scope.** The headline theorems are textbook results (Shannon 1948, Kraft 1949, Huffman 1952, Fano 1961, Shearer 1986); the sources are two textbooks, course notes and a tutorial preprint (README References).
- **Licence.** The MacKay copy on the author's page carries the notice that on-screen viewing is permitted and printing is not (MacKay line 5).
- **Not tested.** Polyanskiy–Wu (6 of 21 locators) could not be read: wording and locators were not compared with it. The source with the largest share, Gallager, was read.
