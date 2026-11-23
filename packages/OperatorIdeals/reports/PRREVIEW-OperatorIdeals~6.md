# Review of OperatorIdeals (pull request #2614 at 5d7b59d)
Folder: `TauCetiRoadmap/OperatorTheory/OperatorIdeals/`
**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, OI-A40 now assumes a normed source for both of its clauses, as the pinned declarations do, and the lower bound of OI-B91 carries the same hypothesis. The three small corrections and the format note of that review are repaired as well, and the repairs introduce no new problem. There is one format note, not blocking; the humans have the roadmap's status and a provenance question to decide.

## N01 — OI-A40 does not say that the coercivity constants are nonnegative

In OI-A40 (§A4, line 330) "the constants `s`" are unrestricted. When `E` has rank at most `n` there are no `n + 1` linearly independent vectors, the set of constants is empty, and among all real numbers an empty set has no least upper bound, while `aₙ(T) = 0`. The pinned `TauCeti.hasMinMaxLowerBound_iff_forall_isLUB` takes `s` in `ℝ≥0`, where the supremum of the empty set is `0`. Writing "the constants `s ≥ 0`" would cover this case.

## Previous findings

- R01 — repaired: "For a normed space `E` and a seminormed space `F`, on a pair `(E, F)` with the property of OI-A38, `aₙ(T)` is the least upper bound …; and this least-upper-bound property … characterizes the pairs".
- C01 — repaired: the Checks of §A1 (line 206) and §A6 (line 435) now open "Over `ℝ` or `ℂ`".
- C02 — repaired: OI-B55 reads "from a finite-dimensional inner product space `E` into a Hilbert space `F`", the hypotheses of the declaration it names; the description says "the target is any Hilbert space".
- C03 — repaired: the description says "The other 49 declarations of the `Suggested.lean` on main, from `singularValue` and `kyFanGauge` to `tsum_energy_isometryFamily_comp`, are removed", and accounts for `columns` and `gauge_blockSum_le`.
- N01 — repaired: OI-C15 says "with no completeness of `F` or `G`", OI-C18 "neither completeness of `F` or `G` nor finite energy is needed"; the clause of OI-B90 is removed (it was not in the item on main).

## Verified sound

| Statement | Instances tried | Values computed, each side | Result |
| --- | --- | --- | --- |
| OI-A40, both clauses | `ℝ² → ℝ²`, `diag(3, 1)`, `n = 0, 1`; `E = 𝕜²` with seminorm `|x₁|`; `E = 0`, `n = 0` | sup of constants `3 = a₀`, `1 = a₁`; seminormed pair now excluded; `E = 0`: empty set, sup in `ℝ≥0` is `0 = a₀` | holds; pinned section has `[NormedAddCommGroup E]`, `F` seminormed (N01 for real `s`) |
| OI-B91, lower bound | `(3,1,0,…)`, `(2,2,0,…)` | merge `(3,2,2,1,0,…)`; `a(T₁ ⊕ T₂)` = same | holds; pinned lower bound has normed `E₁`, `E₂`, seminormed targets, two OI-A38 hypotheses |
| OI-B55 | identity of `𝕜²`, standard and rotated basis | energy `1 + 1 = 2` in both; `‖id‖_F² = 2` | holds; pinned lemma has `[FiniteDimensional 𝕜 E]`, `[CompleteSpace F]` |
| OI-B90 | diagonal `1/(n+1)` on `ℓ²` | `∑ aₙ² = π²/6 = E_b` | holds; pinned: `E` complete, `F` inner product; the inequality lemma takes a Hilbert basis of `E` |
| OI-C15 | `U : 𝕜 → 𝕜²` the inclusion, `T = id` of `𝕜` | `E_b(UT) = 1 = E_b(T)` | holds; pinned energy form has no `CompleteSpace` binder |
| OI-C18 | two coordinate projections of `𝕜²`, `T = id` | `1 + 1 = 2 = E_b(id)` | holds; pinned form has no `CompleteSpace` binder |
| §A1 Check | `diag(3, 1)` over `ℝ` | `(3, 1, 0, …)`; Frobenius distance would give `√10` | true over `ℝ`, `ℂ` as now stated |
| §A6 Check | `d = (1, −2)`, `𝕜³ → 𝕜²` over `ℝ` | `(2, 1, 0, …)`, `a₀ = ‖D‖ = 2` | true as now stated |

The rows for the untouched statements stand as in the previous review, of `3cb0a14`.

- Library declarations opened at the pin: `TauCeti/Analysis/OperatorIdeal/ApproximationNumber/MinMax.lean` lines 417–448 (the two declarations of OI-A40), `BlockSum.lean` lines 72–154 (the three of OI-B91), `TauCeti/Analysis/InnerProductSpace/HilbertSchmidt/Basic.lean` lines 136 and 196 (OI-B55), `ApproximationNumber/HilbertSchmidt.lean` lines 63–207 (OI-B90), `HilbertSchmidt/Isometry.lean` lines 50–67 (OI-C15), `HilbertSchmidt/Pythagoras.lean` lines 37–62 (OI-C18).
- Record: the change touches the wording of six items and two Checks; no id, heading or *In Tau Ceti* line is added or removed. The clause dropped from OI-B90 is not in main's item.
- Source locators: the changed passages carry none; the seeded sample (the three ownership paragraphs of Scope) does not fall in them.
- Cross-roadmap citations: none in the changed passages; the worker's resolver lists none missing.
- Pull request text: the description's sentences on OI-A40, OI-B91, OI-B55 and `Suggested.lean` agree with this head; main's `Suggested.lean` does declare `columns` and `gauge_blockSum_le`, the latter with the statement of the §B6 target. The diff against the base touches only this folder's two files.
- Dependency check: `depcheck: 133 roadmaps, 1479 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives one warning, "declaration uses `sorry`" (line 48), and the `#check` outputs; the file is unchanged since `3cb0a14`, with a single `import Mathlib`, nine `TauCeti.*` imports and no `set_option`.
- The automatic checks all pass on this head.

Overlap check: read SNumbers (main and its open revision), SchattenClassesAndSchurMultipliers, Majorization, EigenvalueAndSingularValueInequalities, NoncommutativeGeometry; approximation numbers, Ky Fan gauges, symmetric gauges and Schatten families: OperatorIdeals; the other s-number sequences: SNumbers; finite-dimensional Ky Fan sums and unitarily invariant seminorms: Majorization; nothing has two owners (the change moves no ownership).

Source independence: changed passages only: 8 passages compared with 1 source (Ull24, which has no passage on coercivity constants, block sums, Hilbert–Schmidt energy or isometric invariance), none shared; largest share Pietsch's two books, 8 of 36 citations, which could not be read; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Part A is the approximation-number theory in which s-number research is stated (Ullrich 2024, Ull24 §1); Part B's Schatten and trace-class families are consumed by NoncommutativeGeometry, NoncommutativeIntegration, VonNeumannAlgebras and SchattenClassesAndSchurMultipliers. Rests on Ull24 and the README's Downstream consumers.

## Not verifiable

- Pietsch, *Operator Ideals* (Thm 11.11.3) and *Eigenvalues and s-Numbers* (Ch. 2): no legal copy found; locators not checked.
- Gohberg and Kreĭn (Ch. II; Ch. III, p. 71 and relation (3.12), p. 76), Simon, *Trace Ideals* (Ch. 2), Reed and Simon I (Thm VI.22), Mirsky (1960), Horn and Johnson (Thm 4.2.6): no open copy; locators not checked.
- Bhatia, *Matrix Analysis*, and Eckart and Young (1936): settled as uncertified (paywalled).

## Source issues

- none

## For the human reviewers

- Status: every item of Parts A–C names realising Tau Ceti declarations at the pin except two targets (OI-B72 in arbitrary universes, README line 772; the block bounds for every family, line 924). Whether the roadmap stays open is yours.
- Licence: `Suggested.lean` line 2 carries "Copyright (c) 2026 Kitware, Inc.", as on main; the README's Provenance section names an Apache-2.0 implementation in AIQ-Kitware/aiq-dkps-formalization. The one stated theorem was not compared with that repository.
- Not tested: Pietsch's two books, the most-cited source, and Gohberg–Kreĭn could not be read, so wording and arrangement were not compared with them.
