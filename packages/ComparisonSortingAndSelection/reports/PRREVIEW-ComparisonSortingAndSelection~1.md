# Review of ComparisonSortingAndSelection (pull request #2522 at c77dad1)

**Verdict:** needs changes

**Summary.** Needs changes, for one sentence: the proof route of the standard-form theorem (4.4) justifies the invariance of the depth by a claim that is false, although the theorem and the invariance of the depth are both true. Every stated result, Check and worked value was recomputed and holds; every locator into the three open sources was read and supports the statement as written; `Suggested.lean` elaborates with `sorry` as the only warning and no statement closes in one tactic. There are no small corrections and one format note. The human reviewers are asked two questions, on scope (the sources are lecture notes and web pages) and on licences.

## R01 (P2) — The route of 4.4 says a standardising step keeps "the pairs of positions that share a wire"; it does not, and the depth is preserved for a different reason

An implementer who takes the sentence as the invariant to prove will fail: it is false. In the route of 4.4 (README line 458): "Each step keeps the length and the pairs of positions that share a wire, hence the depth". Take the network `(0,1), (2,1), (1,3)` on four wires followed by the five-comparator sorting network of the first Check of 4.1; the whole sorts `Bool`. The first non-standard comparator is `(2,1)`; the step replaces it by `(1,2)` and exchanges wires `1` and `2` afterwards, so the third comparator `(1,3)` becomes `(2,3)`. Before the step, positions one and three share wire `1`; after it, `(0,1)` and `(2,3)` share none (the same happens with two later positions). The depth is `6` before and after.

The depth is kept because, immediately after the comparator `(i, j)`, wires `i` and `j` have the same depth, so exchanging the two wires in all later comparators exchanges the two wire depths from then on and leaves the largest value unchanged. The smallest change is to replace the clause, for example: "Each step keeps the length; it keeps the depth as well, since after the comparator the wires `i` and `j` have equal depth, so exchanging them in the later comparators only exchanges the depths of these two wires." The statement `Network.exists_isStandard_sorts` needs no change (the full reduction was run on 3000 random networks on two to five wires: length and depth unchanged, sorting preserved, every time).

## N01 — The citation of Erickson's notes could say which files were read

The references give the site and "the revision marked Fall 2013"; the two files that carry that mark and these section numbers are `notes/12-lowerbounds.pdf` and `notes/13-adversary.pdf` on that site (their footers are dated 2018). Naming them would let a reader reach §12.5 and §13.7 directly.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2 complexity: uniqueness; least depth iff `A` nonempty | `A = ∅`; all rankings with every output correct; sorting `n = 2` | `∅`: second clause fails for all `v`; trivial problem: `0`; leaf on `n = 2`: one output, two rankings | holds | none |
| 1.3 Kraft sum, worst-case and average bounds | leaf with `|A| = 2`; 3-item tree costs `2,2,3,3,3,3`; `A = ∅`; `|A| = 1` | sum `2` without injectivity; `2/4 + 4/8 = 1`; max `3 = clog 6`; `16 ≥ 15.51`; `0 ≤ 0` | holds | none |
| 2.1 sorting lower bounds (headline) | `n = 0..6`; `n = 3` average; Stirling consequence | `clog n!` = `0,0,1,3,5,7,10` (evaluated in Lean); `16/6 ≈ 2.667 ≥ 2.585`; `log n! ≥ n log n − n` | holds | none |
| 2.2 binary insertion; `n ≤ 5` | `n = 0..5`; five-item route | sums `0,0,1,3,5,8` (Lean); merge insertion `3 + 2 + 2 = 7 = clog 120` | holds | none |
| 2.3 merging | `(m,k) = (2,1), (0,k), (0,0), (2,4)`; `k = m = 1..5` | 3 admissible rankings; `clog C(2m,m)` = `1,3,5,7,8` vs `2m − 1` = `1,3,5,7,9`; `clog 15 = 4 < 5`; `2·0 − 1 = 0` | holds | none |
| 3.1 one rank needs `n − 1`; minimum | `n = 0, 1, 4`; `k ≥ n`; class-moving argument | rank of output shifts by class size `≥ 1`; `n = 0`: no tree; `k ≥ n ≥ 1`: hypothesis unsatisfiable; rank 1, `n = 4`: `4` | holds | none |
| 3.2 minimum and maximum (headline) | `n = 1..6`; floor variant at `n = 3`; route count | `(3n+1)/2 − 2` = `0,1,3,4,6,7` (Lean); floor gives `2`; `⌊n/2⌋ + 2(⌈n/2⌉ − 1)` equals it for both parities | holds | none |
| 3.3 second smallest (headline) | `n = 2..6, 8`; `n = 1` | `n + clog n − 2` = `1,3,4,6,7`, `9` (Lean); `n = 1`: no item of rank 1 | holds | none |
| 4.1 networks, sorting, depth | four-wire network; `(2,0)`; `(0,2)`; `(0,0),(0,0)` | depth `3`, `(3,1,2,0) ↦ (0,1,2,3)`, sorts all 16 inputs (Lean); `(5,6,7) ↦ (7,6,5)`; depth `2` on one wire | holds | none |
| 4.2 zero–one principle (headline) | `(0,2)` on `(2,0,1)`; non-monotone map | output `(1,0,2)`; threshold input `(1,0,1)` fixed, unsorted; swap map: `(0,1)` vs `(1,0)` | holds | none |
| 4.3 size and depth bounds | `n = 0, 2, 4, 16`; non-standard `(1,0),(0,1)` | bounds `0`; `1,1`; `5,2`; `clog 16! = 45`; dependence set `≤ 2^d`; tree output `σ⁻¹` | holds | none |
| 4.4 standard form | `(1,0),(0,1)`; `(1,0)`; `(0,0)` on one wire; 3000 random networks | becomes `(0,1),(0,1)`, length 2, depth 2; lengths `1 > 0` on one wire; depth and sorting preserved | statement holds; one route sentence false | R01 |
| 4.5 odd–even merge sort | `k = 0..7` built from the recursion; `k ≤ 4` on all 0–1 inputs | sizes `0,1,5,19,63,191,543,1471`; depths `0,1,3,6,10,15,21,28`; merge sizes `1,3,9,25,65`; both equations hold; sorts | holds | none |
| 5.1 exchanges and inversions | `(0,1),(1,2)` on `(1,0,0)`; `(0,2)` on `(2,1,0)`; tie `(1,1)` | 2 exchanges = 2 inversions (Lean); one exchange removes three; no exchange, no inversion | holds | none |
| 5.2 decreasing input (headline) | `(0,1),(1,2)`; `(0,2)`; `n ≤ 1`; prefix-count rule | `(2,1,0) ↦ (1,0,2)`, `(1,1,0) ↦ (1,0,1)`; `P'_{i+1} = max(P_i, P_{i+2} − 1)` in all three cases | holds | none |
| 5.3 odd–even transposition (headline) | `n = 0..8`; `n = 4, 5` on the decreasing input | lengths `0,0,1,3,6,10,15,21,28 = C(n,2)`; depths `0,0,1,3,4,5,6,7,8`; 6 and 10 exchanges; output sorted (Lean) | holds | none |

- Source locators checked against the text: 23 (Erickson12 lines 59–69, 184–188, 212–261, 262–300; Erickson13 lines 210–263, 352–354; CMU451L5 lines 40–43, 108–110, 131; CMU451L6 lines 132–140, 147–163, 181–197, 202–204, 235; LangNetworks lines 27–57; LangZeroOne lines 49–97; LangOEM lines 11, 19–65; LangOETS lines 15–39).
- Library declarations opened at the pins: 20 in Mathlib (among them `InformationTheory/Coding/Kraft.lean` line 43, `Data/Nat/Log.lean` lines 334, 386, 425, 440, `Analysis/SpecialFunctions/Stirling.lean` line 265, `Analysis/Convex/Jensen.lean` line 72, `Data/Fin/Tuple/Sort.lean` lines 84, 99, 154, `Data/Fin/Rev.lean` line 40, `Order/MinMax.lean` line 134) and 6 in Tau Ceti (`Data/Finset/Inversions.lean` lines 58, 62, 72; `GroupTheory/Perm/Coxeter.lean` lines 43, 195, 206); all exist with the stated content.
- Cross-roadmap citations: one (ComputabilityTheory, on main, as a boundary only); no supplier roadmap. Dependency check: `depcheck: 200 roadmaps, 2183 edges, 0 problem(s)`.
- Elaboration: `Suggested.lean` elaborates, 22 `sorry` warnings and nothing else; one import of `Mathlib` and one Tau Ceti module, no `set_option`, no sorry'd data.
- One-tactic probe on a scratch copy (`simp`, `rfl`, `decide`, `omega`, `trivial`, anonymous constructor): none of the 22 theorems closes. The elaborated signatures were compared with the README statements: same generality, no lost binder.
- Duplication: no comparison tree, comparator network or zero–one principle in the pinned Mathlib or Tau Ceti, on main, or at the open heads searched by object.
- Overlap check: read PseudolineArrangementsAndOrientedMatroids, BooleanFunctionAnalysis, ComputabilityTheory; nothing shared (the first owns reduced words of `Fin.revPerm` as wiring diagrams and cites the same Tau Ceti Coxeter identity; the second excludes decision trees).
- Automatic checks: all passed at this head.

Source independence: 12 passages compared with 8 source texts (3 works), none shared; largest share Lang's pages, 8 of 25 locators; contents compared with Lang's sequence of pages and with Erickson12: independent (4.3, 4.4 and Layer 5 have no counterpart in Lang and odd–even transposition is placed after merge sort; 1.2, 2.2, 2.3, 3.3 have none in Erickson, and the order trees, counting, sorting is forced by the *Needs:* lines of 1.3 and 2.1).

Research link: the headline targets are the classical results of Ford and Johnson (1959), Kislitsyn (1964), Batcher (1968) and de Bruijn (1974), as the README's references name them. The README names no current line of research that uses them; scope flagged to the human reviewers.

## Not verifiable

- Knuth, *The Art of Computer Programming*, Volume 3, §5.3.2 and §5.3.4 (cited as "compare" in 2.3 and 4.4): no legal open copy; not read.
- The papers of Batcher, de Bruijn, Ford and Johnson, and Kislitsyn: listed as attributions without locators; not read. Batcher's authorship is confirmed by LangOEM line 11 and Kislitsyn's by CMU451L6 line 235; the attributions to Ford and Johnson (2.2) and to de Bruijn (5.2) were not checked.
- Two exact values quoted in Checks of 2.3, merging five with five equal to `9` and two with four equal to `5`: the first follows from the theorem of 2.3, the second was not recomputed by exhaustive search here.
- Ownership against open pull requests was checked through the search over their heads, not by reading each roadmap.

## Source issues

- **Misprint** in CMU451L6 at §6.4, printed page 31: the source says the low-order term is `1.433n` one line after writing `1.443n`; it should be `1.443n` (`lg e ≈ 1.4427`); affects nothing.
- **Misprint** in CMU451L6 at §6.4.2, printed page 32: the source says there are `n` possible answers for the location of the minimum element, in the section on the maximum; it should be the maximum element; affects nothing.

## For the human reviewers

- **Scope.** Every locator goes into lecture notes (Erickson; CMU 15-451, which name no author) or web pages (Lang). The refereed papers and Knuth §5.3 are cited without locators and were not consulted. The subject is textbook material; the README names no later theory using it.
- **Licence.** Erickson's notes carry a Creative Commons non-commercial share-alike licence (Erickson12 line 50); Lang's pages and the CMU notes state none. Only locators and restated facts are used; no table, figure, exercise list or program is taken over.
