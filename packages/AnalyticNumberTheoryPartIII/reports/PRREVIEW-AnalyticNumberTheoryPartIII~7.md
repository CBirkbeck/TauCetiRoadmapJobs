# Review of AnalyticNumberTheoryPartIII (pull request #3027 at 8d0b573)

**Verdict:** accepted

**Summary.** Accepted with no findings. The one change to this roadmap is the new §8.2a, Hadamard's three-circles theorem on an annulus, and it is correct. The inequality, the clause on positivity and convexity, the route through Mathlib's three-lines theorem and all four Checks recompute, Robinson (1944, p. 795) states the theorem, and neither Mathlib nor Tau Ceti has it at the pins. There are two small corrections (a stale citation of "ToeplitzOperators T1" in the Scope, and a `Suggested.lean` docstring that does not account for 8.2a) and one format note, none blocking. One licence question from earlier rounds remains for the human reviewers.

## C01 — The Scope cites "ToeplitzOperators T1", an id that ToeplitzOperators no longer has

Under "Not owned here", line 1500 reads "The Fejér means of circle `L¹` functions and their `L¹` approximation: ToeplitzOperators T1." A reader who follows this finds no T1: ToeplitzOperators, on main and at this head, numbers its material by layers. The Fejér means of circle `L¹` functions and their `L¹` approximation are in its §1.2 (Analytic model, least majorants and uniqueness), README lines 169–172. Write "ToeplitzOperators §1.2".

## C02 — The module docstring of `Suggested.lean` does not account for 8.2a

Lines 43–48 say that the README's remaining targets, which the docstring lists, "are lemmas on the way to these statements, or instances of them". The new 8.2a is in neither the stated nor the listed targets, and it is neither a lemma toward a stated theorem nor an instance of one: nothing in this roadmap uses it, and its consumer is RiemannHypothesisStatementsAndConsequences §3.2a. The README's own account in How to read the build (lines 65–72) is consistent. Either of two edits would do:

- state the three-circles inequality in `Suggested.lean`, as 8.2 is stated; it is statable at the pins with `DiffContOnCl` on the open annulus and the supremum of `‖f‖` over `Metric.sphere z₀ R`;
- add "Hadamard's three-circles theorem of 8.2a, a general target kept in the README" to the docstring's list.

## N01 — Give Robinson's page

8.2a (line 503) and the References (line 1728) cite `robinson1944` as "the theorem of its title". The paper states the classical theorem only in its opening paragraph, p. 795; its own results are the sharp bounds of its Problems A–C for single-valued functions. "p. 795" would be the exact locator.

## Verified sound

| Statement | Instances tried | Values computed (left vs right) | Result | Change |
|---|---|---|---|---|
| 8.2a inequality | `f = z − z₀` at radii 1, 2, 4; `f = (z − z₀)⁻¹`; `f = 0` at `θ = 0` | `θ = ½`: `2` vs `1^{½}·4^{½} = 2`; `1/R₂` vs `exp(−(1−θ)log R₁ − θ log R₃) = 1/R₂`; `0` vs `0¹·0⁰ = 0` | holds, equality cases | none |
| 8.2a positivity and convexity | `f = 0` on annulus, `1` at `z₀`; `M(R₁) = 0`, `θ ∈ (0,1)` | `M ≡ 0` on `[R₁, R₃]`, outside the clause; `0^{1−θ} = 0` forces `M(R₂) = 0`, then identity theorem | clause correctly needs nonvanishing on the annulus | none |
| 8.2a wrong model (exponent linear in `R`) | `f = z − z₀`, radii 1, 2, 4 | exponent `1/3`: `2` vs `4^{1/3} = 1.587` | fails, Check true | none |
| 8.2a route | Mathlib `Hadamard.lean:611` | `l < u`, `DiffContOnCl` on open strip, `BddAbove` on closed strip, bounds on `re = l`, `re = u`; matches README 1535–1538 | holds | none |
| 7.3 Mellin inversion | `f = 1_(0,1]`, `σ = 1`, `T = 10`, `x₀ = 1` | `arctan(10)/π = 0.46827`, limit `½ = (1 + 0)/2` | holds | none |
| 7.4 aliasing bound | `W = ½`, `G = e^{−πiξ}` on `(½, 3/2)`, `t = ½` | `S(½) = −(4/π²)(π²/4) = −1`, `f(½) = 1`; error `2` = `2∫|G| = 2` | equality, constant sharp | none |
| 7.4 realness | same `G`, `t = ¼` | `f(¼) = −2√2 i/π` | non-real, Check true | none |
| 8.1 edge form | `f = 1/s` on `[−1,1]²` | four edges `iπ/2` each; sum `2πi = 2πi·Res₀` | holds | none |
| 8.1a disjointness | `f = 1/s`, `P = {0, 3/10}`, `r = ½` | circle sum `4πi` vs edge expression `2πi` | hypothesis needed | none |
| 8.1b circle sign | `eˢ/(s − ρ₀)`, `ρ₀ = −1 + 1.2i`, `T = 2`, `w = .5 + .5i`, `r = .3` | left `−2.220891 + 1.129016i`, right the same; `−Σ∮` gives `2.08784 − 0.54613i` | holds | none |
| 8.2 extremal | `−2Mw/(R − w)`, `M = R = 1`, `r = ½`, `k = 1, 2, 3` | `|f^{(k)}(r)| = 8, 32, 192`; bound `8, 32, 192` | equality | none |
| 8.3 sample | `(z − 3/10)e^{2z}`, `z₀ = 0`, `R = 1` | `M = log(0.7e²/0.3) = 2.847`; left side `|2| = 2` | consistent | none |
| 9.3 constant | `y ∈ [½, 2]`, `0 < ε ≤ 1` | `2^ε − 1 ≤ ε log 2 · 2^ε ≤ 2ε log 2`; `1 − 2^{−ε} ≤ ε log 2` | `C = 2 log 2` valid | none |
| 9.4 transform | non-symmetric bump, `ε = ½`, `s = 1.3 + 2i` | `0.307724 − 0.328529i` both sides; `mellin ν (s/ε)/s = 0.49617 + 0.09889i`; moduli 0.506, 0.762, 16.4, 1.9·10⁴ | holds | none |
| 9.4 value at 1 | same bump | `dy/y`-mass on `[1, 2]` = `0.70647` | Check true | none |
| 10.1 `+1` term | `a ≡ 1`, `X = 2`, symmetric `ν`, `ε ≤ log₂(3/2)` | `2 − (1 + ½) = ½` vs `CBεX log X = 2Cε → 0` | `+1` needed | none |
| 10.2 Ingham exponent (headline) | `η = 1/log t`, `log x = 100`; `η ≡ ¼` | `min_u(100/u + u) = 20` at `u = 10`; `25 + log 3 = 26.0986` at `t = 3` | holds | none |
| 10.3 (headline) | `K = ℚ`, imprimitive trivial character mod 2 | extra zeros on `Re s = 0`; region has `Re s ≥ 1 − c/log 3 ≥ ½`; `δ_χ = 1` | holds | none |
| 11.1 | `λ`, `μ`, `2^Ω`, `2^ω` | `λ(12) = −1 = λ(4)λ(3)`; `μ(4) = 0 ≠ 1`; `2^{ω(4)} = 2 ≠ 4` | Checks true | none |
| 11.2 `d_z` series (headline) | `z = ½`, `s = 2`; `z = i`, `s = 3` | `√ζ(2) = 1.282550`; `exp(0.184034i) = 0.98311 + 0.18300i` | holds | none |
| 11.3 Ramanujan | `α = .3 + i`, `β = −.2 + .5i`, `s = 2.6 + i`; `τ(n²)` at `s = 3` | Euler product `2.485612 − 0.364635i` = ζ quotient; `1.70729` = `ζ(3)³/ζ(6)` | holds | none |
| 11.4 series | `s = 3`; `φ` at `s = 4` | sums to `2·10⁵`: `1.42031, 1.18156, 0.84634`, ζ quotients equal; `1.11063 = ζ(3)/ζ(4)` | holds | none |
| 13.1 counts (Erdős 392 headline) | `n = 4..10`, `B = n` and `n²` | exhaustive search: `4,4,5,6,7,7`; `2,2,3,3,3,4`; `(16,4) ↦ 2`, `(4,4) ↦ 3` | Checks true | none |
| 13.1 at `n = 100` | `M = L = 2` | `|A₀| = 80`, waste `24.813`, 18 balances as stated, score `55.331`; `log n! + score = 91 log n` | at most 91 factors, true | none |
| 13.2 transfer | `Δ = 2`, `x₀ = 2`, `H = 30`; `Δ ≤ 0` | range `(30 − 4)·2 + 4 = 56`; `Δ ≤ 0`: `(x(1 − 1/Δ), x]` empty for `x ≥ 1` | holds; vacuous for `Δ ≤ 0` | none |
| Scope line 1500 | ToeplitzOperators at main and at this head | 0 matches of `T1`; Fejér means at its §1.2, lines 169–172 | stale id | C01 |
| `Suggested.lean` lines 43–48 | 8.2a against the docstring's two lists | 8.2a in neither; no section here uses it | out of date | C02 |

- Previous review: it raised no findings. Record comparison against the merge base `592bdb1`: 7 layers kept with their titles, 0 headings removed, 1 added (8.2a); `Suggested.lean` unchanged.
- Source locators checked against the text: 51 locators in 11 cached sources (30 line ranges of `kontorovichtao-pntplus`; `platttrudgian2020` 2; `helfgottplatt2013` 2; `oliveiraesilva-herzog-pardi2014` 1; `robinson1944` 1; IEANTN files 15).
- Library declarations opened at the pins: Mathlib `Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'` (`Analysis/Complex/Hadamard.lean:611`). A grep for the complex three-circles theorem finds none in Mathlib or Tau Ceti; Tau Ceti has only Gauss-valuation analogues (`RingTheory/WittVector/GaussValuation.lean:406`, `IntervalRing/Subinterval.lean:87`). No Mathlib or Tau Ceti declaration states a Layer 11 series or the Tauberian theorem of 12.1.
- Cross-roadmap citations: 49 ids in 13 roadmaps resolved at main and at this head. One does not resolve, ToeplitzOperators T1 (C01). The resolver's lead `IsCompletelyAdditive.powOfAdditive_mul` is a proposed name of ProbabilisticAndMetricNumberTheory §0.1a (its README line 263).
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Every supplier is on main. The diff outside the pull request's own folders is empty.
- Elaboration of `Suggested.lean`: 27 "declaration uses `sorry`" warnings and nothing else. A probe copy of the file with `#check @name` for all 35 declarations elaborates without error. There is no `variable` block, and every binder is in its declaration's signature, matching the README's generality.
- Sources manifest: `robinson1944` has no entry in the package's manifest. Its text was read at the AMS Bulletin open archive (publisher-open), recorded only in a probe copy of the manifest, not in the package.

Overlap check: read ZerosOfLFunctions, LFunctions, LiCoefficientsArithmeticFormula, SpecialFunctionsGamma, CircleMethodThreePrimes, RiemannHypothesisStatementsAndConsequences and ArithmeticDirichletSeriesPartII. One object is shared: Hadamard's three-circles theorem, owned here (8.2a) and cited by RiemannHypothesisStatementsAndConsequences §3.2a at this head. LiCoefficientsArithmeticFormula cites 9.1, 9.2 and 10.2–10.3. CircleMethodThreePrimes excludes the ternary Goldbach verifications. Nothing else is shared.

Source independence: 19 passages compared with 11 sources. The only shared run is the 13-word Goldbach predicate (`ieantn-goldbach-vocabulary` line 25), which the mathematics forces. In 8.2a, 6 words are shared with `robinson1944` line 11 ("is a convex function of log"). The largest share of locators is `kontorovichtao-pntplus`, about 42 of 108. Contents compared with `kontorovichtao-pntplus`: independent. Layer 8 joins its §4.1 and §5.3 with IEANTN material and 8.2a; Layer 12 has no counterpart; Layer 13 joins its §8.1 with the IEANTN Goldbach nodes; and the Needs lines of 10.1–10.3 force the order 7, 8, 9 before 10.

Research link: 10.2–10.3 are the contour route from a zero-free region to a prime number theorem with error term, Ingham's theorem as refined by Pintz (Platt–Trudgian 2020, lines 21–56). 13.1 is Erdős problem 392 (Alexeev et al. 2025, §1). 13.2 is Helfgott–Platt's (2013) prime ladder. Titchmarsh Ch. XIV uses 8.2a. This rests on the README and on these sources.

## Not verifiable

- `titchmarsh1986`, Chapters I, III and XIV (11.3, 7.3, 8.3, 10.3, 8.2a): settled as uncertified; not opened.
- `montgomeryvaughan2007`, Chapter 5 §5.1 and Chapter 6 §6.1 (7.3, 8.2, 8.3, 10.2, 10.3): settled as uncertified.
- `brown1967`, Theorem 1 (7.4): uncertified; checked only through `ieantn-brown1967` lines 37–40.
- `dlmf-ch6` 6.2.19, 6.12.5–6.12.8 and §6.16 (7.2, 7.3): the cached text is the chapter's contents page only (lines 58–104).
- `iwanieckowalski2004`, `tenenbaum2015`, `apostol1976`, `hardy1949`, `katznelson2004`: settled as uncertified.

## Source issues

- **Misprint** in kontorovichtao-pntplus at Theorem 9.1.36, p. 84: the source states `ζ(s)³ = ζ(2s) Σ τ(n²) n^{−s}` with no range of `s`; it should carry `Re s > 1`, as its restatement Theorem 9.1.50 (p. 86) does; affects nothing.

## For the human reviewers

- **Licence.** Sections 7.4, 8.1a, 8.1b, 13.1 and 13.2 cite six files of the IEANTN Lean project (stated Apache-2.0, commit `466b41b`). The Goldbach predicates of 13.2 share their one-sentence statements with `ieantn-goldbach-vocabulary` lines 25 and 38, but differ in name and carrier (`ℝ` against `ℕ`).
