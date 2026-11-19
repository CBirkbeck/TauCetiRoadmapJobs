# Review of RandomProjectionsAndSketching (pull request #2572 at 03644e2)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the last review of this head, which had no findings, and this round read the pull request's title and description against the head and found no sentence that the head contradicts in a way that touches a stated result. The description now names the third and fourth boundary roadmaps, which repairs the earlier point about it. There are four small corrections (three carried from the last review, since the README did not change, and one new one on the description's sample bound for the trace estimator) and two format notes, none blocking. For the humans: Layer 2 rests on Achlioptas' paper, which could not be read legally, and three constants are derived in the roadmap and not taken from a refereed source.

## C01 — The description says the mean identity of 3.1 is a case of a Tau Ceti theorem; the README still relates it only to an open roadmap

The description now reads "both are cases of a Tau Ceti theorem on the mean of a quadratic form (`TauCeti.integral_inner_toEuclideanLin_sub_integral_eq_trace_mul_covMatrix_map`)". That is correct at the pin (`TauCeti/Probability/Moments/Covariance.lean`, line 163: for a square-integrable `X` in `EuclideanSpace ℝ ι` and a matrix `B`, the mean of `⟪B (X − E X), X − E X⟫` is `tr (B · covMatrix (P.map X))`). The README does not mention it: the scope section (lines 526–531) sends an implementer of `integral_hutchinson` to GaussianLinearModels 2.2 only, and neither "Already in the libraries", "From Tau Ceti" nor the `*Needs:*` line of 3.1 names the declaration. A reader of the README alone is not told that the library already has the general statement.

The smallest change: add the declaration to "Already in the libraries" and to "From Tau Ceti", and to the `*Needs:*` line of 3.1 as one route for the mean; the paragraph on GaussianLinearModels 2.2 can then say that both statements specialise it.

## C02 — The description states the sample bound `M ≥ 12 ε⁻² log(2/δ)` without the range `0 < ε < 1` that the head gives it

The description says of the trace-estimator tail: "It implies the (ε, δ) guarantee for `M ≥ 12 ε⁻² log(2/δ)`, where Avron–Toledo, Theorem 10, needs `20`." The head (3.2, lines 318–322) derives this "for `0 < ε < 1`, since then `g(ε) ≥ ε²/6`", and the restriction is needed for the implication: `g(ε) ≥ ε²/6` holds exactly for `ε ≤ 1`. At `ε = 1.2`, `δ = 0.1` the condition gives `M ≈ 24.96`, and the bound is `2 exp(−24.96 · 0.144/2) ≈ 0.33 > 0.1`. Writing "for `0 < ε ≤ 1` and `M ≥ 12 ε⁻² log(2/δ)`" makes the sentence agree with the head.

## C03 — The route of 2.2 proves the bound for every symmetric law with unit variance and even moments at most the Gaussian ones, while 2.2 and 2.3 are stated for a closed list of three laws

Carried from the last review; the text is unchanged. The route (lines 205–216) uses only that odd moments vanish, `E r² = 1` and `E r^(2m) ≤ (2m − 1)!!`, yet `IsJLEntryLaw` (`Suggested.lean`, line 85) is a disjunction of three equalities of measures, so a fourth law (uniform on `[−√3, √3]`, even moments `3^m/(2m + 1)`: `1, 9/5, 27/7 ≤ 1, 3, 15`) needs a new theorem. It would be more useful to state 2.2 under that moment hypothesis with the three laws as instances; keeping the three-law form with one sentence saying which properties the route uses would also do. The present statements are true; this is an offer.

## C04 — "It is positive exactly for `0 < ε < 3/2`" is true only among `ε > 0`

Carried; line 70 is unchanged. `g(ε) = ε²(1/2 − ε/3)`, so `g(−1) = 5/6 > 0`, and the roadmap does consider `ε ≤ 0` elsewhere (the Check of 1.3, the definition of 5.1). "For `ε > 0` it is positive exactly when `ε < 3/2`" makes the sentence true; no statement depends on it.

## N01 — "(an open roadmap, not on main)" in the scope section dates the text

Line 526, unchanged. "GaussianLinearModels states in its 2.2 …; this roadmap does not depend on it" says what is needed and stays true after that roadmap merges.

## N02 — `EuclideanSpace.basisFun` is listed under the wrong file

In "From Mathlib" (line 574) it stands in the bullet for `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean`; at the pin it is defined in `Mathlib/Analysis/InnerProductSpace/PiL2.lean`.

## Previous findings

- The previous report, of this same head, had no findings (no R01); it had four small corrections and two format notes, accounted for here.
- Earlier C01 (Tau Ceti theorem for the mean of 3.1 not cited) — partly repaired: the description names the declaration; the README, unchanged, does not. Written again as C01.
- Earlier C02 (closed list of three entry laws) — not repaired: `IsJLEntryLaw` is unchanged. Written again as C03.
- Earlier C03 (sign of `g`) — not repaired: "It is positive exactly for `0 < ε < 3/2`" stands. Written again as C04.
- Earlier C04 (description named two boundary roadmaps only) — repaired: the description now has "The mean identity of 3.1 is the case `μ = 0`, `S = 1` of GaussianLinearModels 2.2 … Part C, is a further boundary. None is a supplier."
- Earlier N01, N02 — not repaired: written again under the same numbers.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Description: mean of 3.1 as a case of the Tau Ceti covariance theorem | `A = [[1,2],[3,4]]`, Rademacher `z`; `A = [[1,1],[1,1]]` | `E zᵀAz = 1 + 4 + 5·E z₁z₂ = 5 = tr A`; library side `E z = 0`, covariance `I`, `tr(A·I) = 5`; second: `(z₁+z₂)² ∈ {4,0}`, mean `2 = tr A` | true | C01 (README does not cite it) |
| Description: `(ε, δ)` guarantee for `M ≥ 12 ε⁻² log(2/δ)` (3.2) | `ε = 1/2, δ = 0.1`; `ε = 1`; `ε = 1.2, δ = 0.1` | `M = 143.8`, bound `2e^(−5.99) = 0.005 ≤ 0.1`; `g(1) = 1/6 = ε²/6`, bound `= δ`; `M = 24.96`, `g = 0.144 < 0.24`, bound `0.33 > 0.1` | true for `ε ≤ 1` only, as the head says | C02 |
| Description: counts of `Suggested.lean` | the file at this head | 12 theorems, each `sorry`; 7 definitions with bodies; imports `Mathlib` and the two Tau Ceti modules named | as described | none |
| Description: boundary and supplier sentences | README scope and contracts | MathematicalStatisticsHighDimensional 1.1, 1.2, 2.4 and RandomMatrices 2.3, 2.4, 2.6 on main; MatrixSpectralStatistics Part C on main; GaussianLinearModels 2.2 at its open head (`∫ ⟪μ + ε, A(μ + ε)⟫ = tr(A S) + ⟪μ, A μ⟫`); no `From TauCetiRoadmap` contract | as described | none |

The rows for the statements of the folder stand as in the previous review, of `03644e2`: no statement changed.

- Incremental re-review of 0 changed lines in the folder; no file changed outside the folder.
- Title and description read sentence by sentence against the head: the five "What it asks for" bullets, the supplier lists, the "Not treated here" list, the references and the derived-constants list agree with the README and `Suggested.lean`, except C02.
- Library declarations opened at the pin this round: 1 (`TauCeti.integral_inner_toEuclideanLin_sub_integral_eq_trace_mul_covMatrix_map`, `TauCeti/Probability/Moments/Covariance.lean` line 163).
- Cross-roadmap citations resolved again: 8 (the seven section citations on main and GaussianLinearModels 2.2 at its open head).
- Source locators: none reopened; the 9 of the previous review stand, and its two source issues (Woodruff2014, proofs of Theorems 21 and 14) stand as reported there.
- Elaboration: `lake env lean` on `TauCetiRoadmap/RandomProjectionsAndSketching/Suggested.lean`: 12 warnings, all `declaration uses sorry`, no error.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head.

Overlap check: read MathematicalStatisticsHighDimensional, RandomMatrices, GaussianLinearModels (scope and the cited sections; StandardDistributions, KalmanFiltering and PoissonApproximation as in the previous review); chi-squared tails are shared in name only (sub-gamma form owned by MathematicalStatisticsHighDimensional 1.2, rate-function form here); the mean of a quadratic form is owned by Tau Ceti at the pin and by GaussianLinearModels 2.2 in general form, with the Rademacher case kept here (C01); nothing else shared.

Source independence: changed passages only: 0 passages compared, since the folder did not change; as in the previous review, 9 passages compared with 3 sources, none shared beyond formulas; largest share Woodruff2014, 6 of 15 locators; contents compared with Woodruff2014: independent. Achlioptas' paper could not be read and was not compared.

Research link: the headline targets are the dimension-reduction lemma of Johnson–Lindenstrauss (1984) in the forms of Dasgupta–Gupta (2003) and Achlioptas (2003), the trace estimators analysed by Avron–Toledo (2011), and the CountSketch moment bound and sketch-and-solve regression of Woodruff (2014), after Thorup–Zhang and Sarlós (2006); README references and the three texts read.

## Not verifiable

- Achlioptas, *Database-friendly random projections* (2001, 2003): no legal copy found; the attributions in 2.2 and 2.3 were not checked against the text (the README gives no locator into it).
- The attributions without locators to Johnson–Lindenstrauss, Hutchinson, Charikar–Chen–Farach-Colton, Thorup–Zhang and Sarlós were not opened.
- Avron–Toledo: the agreement of the preprint's numbering with the Journal of the ACM version was not checked.
- The description's account of the author's numerical checks and of how the draft was produced cannot be checked from the head.

## Source issues

- none

## For the human reviewers

- **Scope.** Three statements are derived in the roadmap and cited to no refereed source: the rate-function chi-squared tails (1.1), the existence theorem for all `ε > 0` (1.3), and the trace-estimator tail with constant `12` (3.2; Avron–Toledo, Theorem 10, has `20`).
- **Licence.** The Dasgupta–Gupta text cited is the Wiley published version hosted on the first author's university page (README references, line 617); whether that hosting is licensed was not settled.
- **Not tested.** Layer 2 (2.2, 2.3) follows Achlioptas' paper, which could not be read legally; wording and attribution were not compared with it. The description says the author could not confirm a legal copy either.
