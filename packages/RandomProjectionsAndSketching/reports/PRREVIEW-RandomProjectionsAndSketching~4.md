# Review of RandomProjectionsAndSketching (pull request #2572 at 03644e2)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the last review of this head, which had no findings, and the title and description, read sentence by sentence against the head, contain nothing the head contradicts. The one point the last review raised about the description (the sample bound for the trace estimator stated without its range) is repaired. Three small corrections and two format notes remain, all about README text that did not change, none blocking. For the humans: Layer 2 rests on Achlioptas' paper, which could not be read legally, and three constants are derived in the roadmap and not taken from a refereed source.

## C01 — The description says the mean identity of 3.1 is a case of a Tau Ceti theorem; the README relates it only to an open roadmap

The description reads "both are cases of a Tau Ceti theorem on the mean of a quadratic form (`TauCeti.integral_inner_toEuclideanLin_sub_integral_eq_trace_mul_covMatrix_map`)", which is correct at the pin (`TauCeti/Probability/Moments/Covariance.lean`: for a square-integrable `X` in `EuclideanSpace ℝ ι` and a matrix `B`, the mean of `⟪B (X − E X), X − E X⟫` is `tr (B · covMatrix (P.map X))`). The README does not mention it: the scope section (lines 526–531) sends an implementer of `integral_hutchinson` to GaussianLinearModels 2.2 only, and neither "From Tau Ceti" nor the `*Needs:*` line of 3.1 (lines 299–300) names the declaration. A reader of the README alone is not told that the library already has the general statement.

The smallest change: name the declaration in "From Tau Ceti" and in the `*Needs:*` line of 3.1 as one route for the mean; the paragraph on GaussianLinearModels 2.2 can then say that both statements specialise it.

## C02 — The route of 2.2 proves the bound for every symmetric law with unit variance and even moments at most the Gaussian ones, while 2.2 and 2.3 are stated for a closed list of three laws

Carried; the text is unchanged. The route of 2.2 uses only that odd moments vanish, `E r² = 1` and `E r^(2m) ≤ (2m − 1)!!`, yet `IsJLEntryLaw` (`Suggested.lean`, line 85) is a disjunction of three equalities of measures, so a fourth law (uniform on `[−√3, √3]`, even moments `3^m/(2m + 1)`: `1, 9/5, 27/7` against `1, 3, 15`) needs a new theorem. Stating 2.2 under the moment hypothesis with the three laws as instances would be more useful; one sentence saying which properties the route uses would also do. The present statements are true; this is an offer.

## C03 — "It is positive exactly for `0 < ε < 3/2`" is true only among `ε > 0`

Carried; line 70 is unchanged. `g(ε) = ε²(1/2 − ε/3)`, so `g(−1) = 5/6 > 0`, and the roadmap does consider `ε ≤ 0` elsewhere (the Check of 1.3, the definition of 5.1). "For `ε > 0` it is positive exactly when `ε < 3/2`" makes the sentence true; no statement depends on it.

## N01 — "(an open roadmap, not on main)" in the scope section dates the text

Line 526. "GaussianLinearModels states in its 2.2 …; this roadmap does not depend on it" says what is needed and stays true after that roadmap merges.

## N02 — `EuclideanSpace.basisFun` is listed under the wrong file

In "From Mathlib" (line 574) it stands in the bullet for `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean`; at the pin it is defined in `Mathlib/Analysis/InnerProductSpace/PiL2.lean`.

## Previous findings

- The previous report, of this same head, had no findings (no R01); its four small corrections and two format notes are accounted for here.
- Earlier C01 (Tau Ceti theorem for the mean of 3.1 not in the README) — not repaired: the README is unchanged. Written again as C01.
- Earlier C02 (description's sample bound without its range) — repaired: the description now has "for `M ≥ 12 ε⁻² log(2/δ)` for `0 < ε < 1`", as lines 321–322 of the README.
- Earlier C03 (closed list of three entry laws) — not repaired: `IsJLEntryLaw` is unchanged. Written again as C02.
- Earlier C04 (sign of `g`) — not repaired: "It is positive exactly for `0 < ε < 3/2`" stands. Written again as C03.
- Earlier N01, N02 — not repaired: written again under the same numbers.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Description: `(ε, δ)` guarantee for `M ≥ 12 ε⁻² log(2/δ)`, `0 < ε < 1` (3.2) | `ε = 1/2, δ = 0.1`; boundary `ε = 1` | `M = 48·log 20 = 143.8`, `g = 1/12`, bound `2e^(−5.99) = 0.005 ≤ 0.1`; `g(1) = 1/6 = ε²/6`, bound `2e^(−M/12) = δ` | true on the stated range; agrees with README lines 321–322 | none (earlier C02 repaired) |
| Description: mean of 3.1 as a case of the Tau Ceti covariance theorem | `A = [[1,2],[3,4]]`, Rademacher `z` | `E zᵀAz = 1 + 4 + 5·E z₁z₂ = 5 = tr A`; library side: mean `0`, covariance `I`, `tr(A·I) = 5` | true | C01 (README does not cite it) |
| Description: Hutchinson variance, symmetric `A` (3.1) | `A = [[1,1],[1,1]]` | `zᵀAz ∈ {4, 0}`, variance `4`; formula `2(4 − 2) = 4` | agree | none |
| Description: counts of `Suggested.lean` | the file at this head | 12 theorems, 12 `sorry` warnings; 7 definitions with bodies; imports `Mathlib` and the two Tau Ceti modules named | as described | none |
| Description: finite-set bound (2.3) | union bound | per pair `2n^(−(2+β))`, `n(n−1)/2` pairs: `n(n−1)n^(−(2+β)) ≤ n^(−β)` | as README lines 234–242 | none |

The rows for the statements of the folder stand as in the previous review, of `03644e2`: no statement changed.

- Incremental re-review of 0 changed lines in the folder; no file changed outside the folder.
- Title and description read against the head: the five "What it asks for" bullets (1.1–1.3, 2.1–2.3, 3.1–3.2, 4.1–4.2, 5.1–5.2), the supplier lists, the boundary paragraphs, the "Not treated here" list, the references and the derived-constants list agree with the README and `Suggested.lean`; the change is described as adding a new roadmap, which it is (833 insertions, no deletion, nothing outside the folder).
- Library declarations opened at the pin this round: 1 (`TauCeti.integral_inner_toEuclideanLin_sub_integral_eq_trace_mul_covMatrix_map`, `TauCeti/Probability/Moments/Covariance.lean`).
- Cross-roadmap citations resolved again: 8 (MathematicalStatisticsHighDimensional 1.1, 1.2, 2.4 and RandomMatrices 2.3, 2.4, 2.6, on main and at the head of the open revision of both, which keeps these numbers; OperatorTheory/MatrixSpectralStatistics Part C on main; GaussianLinearModels 2.2 at its open head, `tr (A S) + ⟪μ, A μ⟫`).
- Source locators: none reopened; the 9 of the earlier full review stand.
- Elaboration: `lake env lean` on `TauCetiRoadmap/RandomProjectionsAndSketching/Suggested.lean`: 12 warnings, all `declaration uses sorry`, no error.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head.

Overlap check: read MathematicalStatisticsHighDimensional, RandomMatrices, GaussianLinearModels (the cited sections, on main and at the open heads; StandardDistributions, KalmanFiltering and PoissonApproximation as in the earlier review); chi-squared tails are shared in name only (sub-gamma form owned by MathematicalStatisticsHighDimensional 1.2, rate-function form here); the mean of a quadratic form is owned by Tau Ceti at the pin and by GaussianLinearModels 2.2 in general form, with the Rademacher case kept here (C01); nothing else shared.

Source independence: changed passages only: 0 passages compared, since the folder did not change; as in the earlier full review, 9 passages compared with 3 sources, none shared beyond formulas; largest share Woodruff2014, 6 of 15 locators; contents compared with Woodruff2014: independent. Achlioptas' paper could not be read and was not compared.

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
