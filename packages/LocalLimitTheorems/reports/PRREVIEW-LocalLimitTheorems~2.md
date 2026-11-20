# Review of LocalLimitTheorems (pull request #2683 at ff0b1ae)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. The one finding of the previous review is repaired: the lattice local limit theorem for real lattice laws of any span is now a target (1.5) and a statement of `Suggested.lean`, with no centring and no moment hypothesis, and it survived the cases tried (Rademacher with the right and the wrong span, a point mass, a non-zero mean, an infinite second moment). The three earlier small corrections and the format note are repaired too. There are two small corrections and one format note, none blocking; the licence question and the note on what was read are left for the human reviewers as before.

## C01 — The first Check of 1.5 uses `k` for the value of `Sₙ`, and the statement above it now uses `k` for the index of the lattice point.

A reader who puts the Check's `n = 400`, `k = 0` into the statement of 1.5 with `b = 1`, `h = 2` gets `P(S₄₀₀ = 400)`, which is `2⁻⁴⁰⁰`, and not the value `0.3987` printed. The Check (README line 210) writes "`(√n/2) P(Sₙ = k) ≈ n_1(k/√n)` for `k ≡ n mod 2`", so its `k` is the point; the statement (line 193) has `P(Sₙ = n b + h k)`, so the point `0` at `n = 400` is `k = −200`. The numbers are right: `10 · C(400, 200)/2⁴⁰⁰ = 0.39869` against `n_1(0) = 0.39894`. Writing the point with another letter, or "at `n = 400` and the point `0` (that is, `k = −200`)", removes the clash. The second Check, with `b = 0`, `h = 1`, is consistent as it stands.

## C02 — The boundary with MathematicalStatisticsHigherOrderAndResampling §3.1 still speaks only of 1.2, and 1.5 now states a theorem about real lattice laws and their largest span.

The paragraph (README line 418) says that roadmap "states lattice laws on `ℝ` and their characterization by the characteristic function, for every span; 1.2 here, the special case of integer laws […], is only a step of the proof of 1.4". Since this change, 1.5 has real lattice laws of every span among its hypotheses, which is the object that §3.1 defines (a law carried by `a + hℤ`, and its maximal span). Nothing is owned twice: 1.5 writes its two carrier conditions directly on the law of `X 0` and declares no notion of lattice law. One clause saying so ("1.5 states its two carrier conditions on the law directly and uses no definition of that roadmap") would let a reader of either roadmap see where the line runs.

## N01 — Line 11 of `Suggested.lean` has 139 characters; README line 408, edited in the same change, is likewise left unwrapped.

## Previous findings

- R01 — repaired: 1.5 now reads "Prove `localLimit_lattice_real`, the form of 1.4 for real summands", with no centring and no moment assumed; `Suggested.lean` states it; the scope lists five theorems.
- C01 — repaired: the list of library results has "the central limit theorem for independent identically distributed summands, the binomial law"; the integral form for the binomial law is no longer claimed.
- C02 — repaired: the summary has "the rescaled local probabilities `√n · P(Sₙ = k)`, or the densities of `(Sₙ − n m)/√n`, tend to `0` uniformly"; the description of the pull request agrees.
- C03 — repaired: the route of 3.2 has "(`S_ν` has a density, so `X 0` is not a point mass)".
- N01 — repaired: the scope names "MathematicalStatisticsHigherOrderAndResampling, §3.1" without a remark on its state.
- Question on the year 1948 — settled: the references attribute the theorems to "B. V. Gnedenko" with no year.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.5 `localLimit_lattice_real`, statement | Rademacher `b = 1`, `h = 2`, `n = 400`, point `0` (`k = −200`); general mean `m`; `b` replaced by `b + h j` | `10·C(400,200)/2⁴⁰⁰ = 0.398693` against `n_1(0) = 0.398942`; centring `X − m` gives carrier `b − m + hℤ`, same formula; index shifts by `n j` | sound | C01 on the letter `k` |
| 1.5, span hypothesis | Rademacher with `b = 0`, `h = 1`; point mass `δ_c`; `h ≤ 0` | `20·C(400,200)/2⁴⁰⁰ = 0.797386` against `0.398942`, excluded since `1 + 2ℤ` carries it; `δ_c` carried by `c + h'ℤ` for all `h'`; `h ≤ 0` contradicts the span condition (`h' = 1` or `|h|`) | hypotheses exclude each; `0 < h` implied but harmless | none |
| 1.5, route from 1.4 | `Y = (X − b)/h` | `E Y = (m − b)/h`, `Var Y = σ²/h²`; `(k − n E Y)/√n = (n b + h k − n m)/(h√n)`; `n_{σ²/h²}(y/h) = h·n_σ²(y)`; `Y` carried by `c + dℤ` gives `X` carried by `b + hc + hdℤ` | agrees with the statement after division by `h` | none |
| 1.5, infinite second moment and non-integrable `X 0` | total variance and mean | `Var = 0` on both sides, `gaussianPDFReal 0 0 = 0`; statement is `(√n/h)·P(Sₙ = n b + h k) → 0`, which is 1.4 for `Y` | sound | none |
| 1.5 against its source | Durrett's hypotheses | mean `0`, variance in `(0, ∞)`, span `h` the largest, `x ∈ (n b + hℤ)/√n`, `sup |(√n/h) pₙ(x) − n(x)| → 0` (DurrettPTE5 lines 8154–8157, 8193–8203, printed p. 162) | README statement with `m = 0` is the source's | none |
| 1.5 Lean signature against README | elaborated type | carrier `P.map (X 0) {x | ¬∃ j : ℤ, x = b + h * j} = 0`; span `∀ b' h', h < h' → … ≠ 0`; event `∑ = n * b + h * k`; argument `(n*b + h*k − n*P[X 0])/√n` | same generality as the README; no binder lost | none |
| Scope count | theorems and non-targets | five theorems (1.4, 1.5, 2.1, 3.1, 3.2); three non-targets (1.2, 1.3, 2.2) | agrees with the layers | none |

The rows for the untouched statements (1.1 to 1.4, 2.1, 2.2, 3.1, 3.2, the conventions and the Wallis remark) stand as in the previous review, of `98e4695`.

- Source locators read against the text: 1 of 1 in the changed passages (Durrett, the definitions of §3.5 and Theorem 3.5.3, p. 162; DurrettPTE5 lines 8154–8157 and 8193–8203).
- Library declarations opened at the pin: `ProbabilityTheory.IdentDistrib` (`Mathlib/Probability/IdentDistrib.lean`, line 69, with its field `aemeasurable_fst`, line 71, which makes `P.map (X 0)` the law); `iIndepFun` and `gaussianPDFReal` through the elaboration.
- Cross-roadmap references resolved: MathematicalStatisticsHigherOrderAndResampling §3.1 at its open head (it declares `IsLatticeLaw` and two theorems on the characteristic function, no local limit theorem); not a supplier.
- Dependency check output: `depcheck: 191 roadmaps, 2119 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed on this head. Elaboration of `TauCetiRoadmap/LocalLimitTheorems/Suggested.lean`: five `sorry` warnings, nothing else.
- Signatures: `localLimit_lattice_real` compared with 1.5 (row above); the other five declarations are unchanged.
- One-tactic probe on a copy of the file (`simp`, `rfl`, `infer_instance`, `aesop`, `exact localLimit_lattice _ _ _ _`): none closes `localLimit_lattice_real`. No padding; all five README headlines are stated.
- No change outside the roadmap folder. The title and the description of the pull request were read against this head: the description names the real form, the five theorems and the one definition, and agrees with the folder.

Overlap check: read MathematicalStatisticsHigherOrderAndResampling, SeriesOfIndependentRandomVariables, RandomWalkFluctuationTheory (open), MarkovChainsAndRenewal (main); nothing shared as a target. Lattice laws on `ℝ` as a definition and their characterisation by the characteristic function: owner MathematicalStatisticsHigherOrderAndResampling §3.1 (1.5 here declares no such notion; C02). SeriesOfIndependentRandomVariables and RandomWalkFluctuationTheory both list local limit theorems as outside their scope; no open or merged roadmap states a local limit theorem.

Source independence: changed passages only; 4 passages compared with 1 source (the statement, the route and the second Check of 1.5, and the docstring of `localLimit_lattice_real`, against DurrettPTE5 lines 8154–8203), none shared; largest share DurrettPTE5, 7 of 9 locators; the change adds, removes or reorders no layer, so the contents were not compared again (previous result: independent).

Research link: Bobkov–Marsiglietti (2018) take Gnedenko's uniform local limit theorem and the smoothing condition (3.1, 3.2 here) as the starting point for the Rényi-entropy central limit theorem (BobkovMarsiglietti2018 lines 62–70, 146–172); local Edgeworth expansions refine 3.2 (README scope). Rests on the source read and the README.

## Not verifiable

- The attribution of the two local limit theorems to Gnedenko and their presentation in the Gnedenko–Kolmogorov book (cited in prose without a locator): no text read.

## Source issues

- none

## For the human reviewers

- **Licence.** DurrettPTE5 was read from the author's page at Duke University (version of 11 January 2019); its title page says "Copyright 2019, All rights reserved". The host was not in a known licence class and was recorded as an author page.
- **Not tested.** MathematicalStatisticsHigherOrderAndResampling, SeriesOfIndependentRandomVariables and RandomWalkFluctuationTheory were read at their open heads through the roadmap index, not from checked-out files; ownership against other open pull requests was checked by searching the index for the objects.
