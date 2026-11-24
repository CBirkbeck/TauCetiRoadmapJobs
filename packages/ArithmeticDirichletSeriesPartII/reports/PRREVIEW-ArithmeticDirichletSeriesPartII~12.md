# Review of ArithmeticDirichletSeriesPartII (pull request #3027 at 477bb48)

**Verdict:** accepted

**Summary.** Accepted. The previous finding is repaired: `Suggested.lean` now states Landau's theorem for Laplace transforms (`hasLaplace_landau`, README §0.1b), and its docstring names the theorem. The statement elaborates and matches §0.1b clause by clause. The four small corrections and the format note of the previous review are also repaired, and the repairs introduce nothing false. One format note remains, on the wording of a Mathlib bullet, and it does not block. Nothing is left for a human to decide.

## N01 — The *From Mathlib* bullet on `LSeries_eq_mul_integral` can be read as giving all three lemmas a summability hypothesis

Lines 1496–1497 read "assuming `LSeriesSummable f s` (absolute convergence) and partial sums of `f` that are `O(n^r)`, or partial sums of `‖f‖`, or …". At the pin, only `LSeries_eq_mul_integral` (`Mathlib/NumberTheory/LSeries/SumCoeff.lean`, line 140) takes `LSeriesSummable`. `LSeries_eq_mul_integral'` (line 155) and `_of_nonneg` (line 164) derive it from the bound (line 158). Writing "assuming either `LSeriesSummable f s` and partial sums of `f` that are `O(n^r)`, or partial sums of `‖f‖` (or of a nonnegative real `f`) that are `O(n^r)`" would remove the ambiguity.

## Previous findings

- R01 — repaired: `Suggested.lean` line 96 states `hasLaplace_landau`, with a docstring citing Landau (1905), §4, p. 548. Lines 15–16 of the module docstring read "Layer 0 also states … Landau's theorem (README §0.1b)", and README line 264 names the declaration.
- C01 — repaired: the §4.1a *Source* paragraph (line 1023) reads "Mathlib's `LSeries_eq_mul_integral` (with `LSeries_eq_mul_integral'` and `LSeries_eq_mul_integral_of_nonneg`) proves the value … when … the partial sums are `O(n^r)`", with the counterexample. There is a matching bullet under *From Mathlib* (line 1494).
- C02 — repaired: overview line 42 reads "is singular at the real point of its abscissa of convergence when that abscissa is finite".
- C03 — repaired: line 1020 reads "*Needs:* §§0.1, 4.1; Mathlib `LSeriesHasSum`, `summable_norm_iff`, `MeasureTheory.integral_comp_exp_Ioi`, `MeasureTheory.integrableOn_comp_exp_Ioi`; Tau Ceti `TauCeti.summatory`", and line 88 of the diagram reads "§4.1 ─> §4.1a".
- C04 — repaired: the chapter-only citations of Ingham (1932) and of Montgomery–Vaughan (2007), chapter 1, are gone from §0.1b, §4.1a and the references. Line 297 keeps "Montgomery–Vaughan (2007), chapter 15, Lemma 15.1".
- N01 — repaired: line 273 reads "which Tau Ceti proves as `TauCeti.LSeries.landau` (`TauCeti/NumberTheory/LSeries/Landau.lean`)".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
| --- | --- | --- | --- |
| `hasLaplace_landau` (new Lean statement, §0.1b) | `g = e^(2u)`, `A = 3`, `H = 1/(s−2)`, `r = 1` | hypotheses hold (pole `2` lies outside the open ball); `A′ = 2.5`: `∫₀^∞ e^(−0.5t) dt = 2`; `G = 1/(s−2)` on `Re s > 2.5` | holds |
| `hasLaplace_landau`, without the sign hypothesis | `g = sin u`, `A = 0`, `H = 1/(1+s²)`, `r = 1` | other hypotheses hold; for `A′ < 0`, `∫ e^(|A′|t)|sin t| = ∞`, so the conclusion fails; `hg` fails for `sin` | `hg` needed (README Check) |
| `hasLaplace_landau`, degenerate | `g = 0`; `g = e^(−u²)` (abscissa `−∞`) | `F = 0`: `A′ = A − 1`, `G = 0`; entire `F`: `A′ = A − 1`, `G = F` | holds |
| `hasLaplace_landau`, at a pole | `g = 1`, `A = 0` | `F = 1/s` is unbounded near `0`, so no `H` analytic on `B(0,r)` agrees with it: hypothesis fails | consistent |
| `hasLaplace_landau` in Lean | `#check` in a scratch copy; one-tactic probe (`simp`/`rfl`/`aesop`) | elaborated type matches lines 264–268; the probe leaves the goal open | statable, not padding |
| §0.1b locator, Landau (1905) | landau1905 lines 895–963 (pp. 547–548) | general statement for `φ ≥ 0` beyond `x₀`, `∫ φ x^(−s−1)`: the real abscissa is singular (line 963); Taylor/Tonelli proof lines 926–951 | supports §0.1b |
| Overview sentence (C02) | `g = e^(−u²)`; `g = e^(u²)` | abscissa `−∞`, `+∞`; both excluded by "when that abscissa is finite" | true now |
| §4.1a value via substitution (seeded target) | `c 2 = i`, `s = 1` | Mellin: `i∫₂^∞ y^(−2) dy = i/2`; Laplace: `i∫_(log 2)^∞ e^(−t) dt = i/2`; `F(1)/1 = i·2^(−1) = i/2` | holds |
| §4.1a route through `integral_comp_exp_Ioi` | `a = 0`, `G(y) = S_c(y) y^(−s−1)` | `eᵗ G(eᵗ) = S_c(eᵗ) e^(−st) = α(t)e^(−st)`; `Ioi (exp 0) = Ioi 1`; lemma for any normed `E` (line 1086) | route valid |
| §4.1a counterexample to Mathlib's bound | `c n = n^(−1/2)/(log n)²`, `s = 1/2` | `∑ 1/(n log² n) < ∞`; `S_c(10⁷) = 38.30` against `2√N/log²N = 24.34`, ratio `1.57 → 1`; `N^(1/2−r)/log²N → ∞` | not `O(N^r)`, `r < 1/2` |
| *From Mathlib* substitution bullet | `a = 0`, `g(y) = y^(−2)` | `∫₀^∞ eᵗ e^(−2t) dt = 1 = ∫₁^∞ y^(−2) dy`; iff of integrability at line 1165 | matches pin |
| *From Mathlib* `LSeries_eq_mul_integral` bullet (N01) | opened lines 140, 155, 164 | hypothesis `hS : LSeriesSummable` only at 140; 155 derives it (line 158); 164 via 155 | statement true, wording ambiguous |
| §0.1b ↔ `TauCeti.LSeries.landau` (N01 of the previous review) | opened `Landau.lean` line 296 | nonnegative coefficients, finite real abscissa `σ` of absolute convergence ⇒ no analytic extension at `σ` | the Dirichlet case |

The rows of the previous review for untouched statements (§§0.1a, 2.2a, 3.2, 4.1–4.5, 5.1 and the §0.1b proof sketch) stand as in the previous review, of `71bbefa`.

- Change since `71bbefa`: 60 insertions and 24 deletions in `README.md` and `Suggested.lean`. Against the merge base, the head keeps all 6 layers and every id, removes no heading and no declaration, and adds §§0.1b and 4.1a and `hasLaplace_landau`.
- Locators checked against the text: Landau (1905), pp. 547–548 (landau1905 lines 895–963). §4.1a now cites only Mathlib declarations as its source, for the special case, together with its own derivation.
- Library declarations opened at the pins: `MeasureTheory.integral_comp_exp_Ioi` and `integrableOn_comp_exp_Ioi` (`Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean:1157`, `1164`); `LSeries_eq_mul_integral`, `LSeries_eq_mul_integral'` and `LSeries_eq_mul_integral_of_nonneg` (`Mathlib/NumberTheory/LSeries/SumCoeff.lean:140`, `155`, `164`); `TauCeti.LSeries.landau` (`TauCeti/NumberTheory/LSeries/Landau.lean:296`). `MeasureTheory.lintegral_tsum` and `DifferentiableOn.hasFPowerSeriesOnBall` resolve under `#check`.
- Elaboration: `lake env lean` of `Suggested.lean` gives 20 `sorry` warnings (one per theorem) and nothing else. There is no `set_option`, and the imports are `Mathlib` and `TauCeti.Order.Northcott.Basic`. `hasLaplace_landau` sits outside the `E`-sections and loses no binder.
- Dependency check: `depcheck: 132 roadmaps, 1465 edges, 0 problem(s)`, with no upward line and no cycle.
- Gate rerun: every check passes except the edits-outside-folder check (set aside below). With this pull request's own folders excluded, `git diff --name-only origin/main...HEAD` lists no file; 117 files change in all.
- Cross-roadmap citations: the consumers of §§0.1b and 4.1a at this head, PositivityOfDirichletSeriesWithKernels (6.3, 6.4, 6.9) and GeneralizedRiemannHypothesisFromWindowBounds (Layer 1), cite ids that still resolve. No other `Suggested.lean`, open or on main, declares a Laplace form of Landau's theorem.
- Overlap check: read AnalyticNumberTheoryPartI, LiCoefficientsArithmeticFormula, SamplingAndDiscreteFourierAnalysis, ZerosOfLFunctions, SpecialFunctionsGamma, TauberianBoundaryConvergence, AnalyticNumberTheoryPartIII and ProbabilisticAndMetricNumberTheoryPartII. SpecialFunctionsGamma §10.1 states, as an auxiliary result, a different Landau theorem: a measure space, real `s`, a weight nonnegative everywhere, and no Lean statement. The Laplace form with complex `s` is owned here (§0.1b). Nothing else is shared.

Source independence: changed passages only. 6 passages were compared with 2 sources (landau1905 at pp. 547–548, against the §0.1b header, its *Source* paragraph and the `hasLaplace_landau` docstring; the Mathlib docstrings of `SumCoeff.lean` and `IntegralEqImproper.lean`, against the §4.1a *Source* paragraph and the two new *From Mathlib* bullets). None is shared beyond formulas and hypothesis lists that can be written in only one way. The largest share is delange1954, as in the previous review (24 of about 116 locators; this change removes two locators, neither of them delange1954's). The arrangement was not compared, since no layer was added, removed or reordered.

Research link: Delange's Tauberian theorem for poles of integer order (Delange 1954) underlies counts with higher-order poles, such as Wood's totally real abelian counts (Wood 2019, §7) and the Markoff–Hurwitz counts of Gamburd–Magee–Ronan 2019. §0.1b is Landau's 1905 theorem, which Montgomery–Vaughan 2007, Lemma 15.1, apply to one-sided bounds on prime sums. This rests on the README's statement of purpose and on landau1905 as read here.

## Not verifiable

- Montgomery–Vaughan (2007), chapter 15, Lemma 15.1 (§0.1b): no legal open copy; the DOI resolves only to the publisher's paywalled page.

Automatic checks set aside as false positives: when rerun without the list of this pull request's own folders, the check for edits outside the roadmap folder flagged 115 files. Every one lies in a folder this pull request adds or revises, each with its own review.

## Source issues

- none

## For the human reviewers

- none
