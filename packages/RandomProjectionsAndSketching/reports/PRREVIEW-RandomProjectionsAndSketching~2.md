# Review of RandomProjectionsAndSketching (pull request #2572 at 03644e2)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route of the roadmap was found false, every numerical value printed in a Check was recomputed and agrees, the three sources with locators support the statements at the cited places, and `Suggested.lean` elaborates with `sorry` as its only warning and states every headline theorem. There are four small corrections (a pinned Tau Ceti theorem that already gives the mean half of Hutchinson's lemma in general form and is not cited; the closed list of three entry laws where the route of 2.2 proves more; one sentence about the sign of `g`; the description's list of boundary roadmaps) and two format notes, none blocking. For the humans: Layer 2 rests on Achlioptas' paper, which could not be read legally and is cited without locators, and three constants are derived in the roadmap and not taken from a refereed source.

## C01 — The mean identity of 3.1 is a special case of a theorem Tau Ceti already has at the pin, and the README relates it only to an open roadmap

An implementer of `integral_hutchinson` who reads the scope section is sent to GaussianLinearModels 2.2, which is not on main, and is not told that the library already proves the general statement. At the pin, `TauCeti.integral_inner_toEuclideanLin_sub_integral_eq_trace_mul_covMatrix_map` (`TauCeti/Probability/Moments/Covariance.lean`, line 163) states, for a square-integrable random vector `X` of `EuclideanSpace ℝ ι` and a matrix `B`, that the mean of `⟪B (X − E X), X − E X⟫` is `tr (B · covMatrix (P.map X))`. For independent Rademacher coordinates `E X = 0` and the covariance matrix is the identity, so the mean identity of 3.1 is this theorem after the passage from `Fin n → ℝ` to `EuclideanSpace` and the computation of the covariance; that is real but short work, so the target can stay as the first half of Hutchinson's lemma.

The smallest change: add the declaration to "Already in the libraries" in the scope section and to "From Tau Ceti", and to the `*Needs:*` line of 3.1 as one route for the mean. The paragraph on GaussianLinearModels 2.2 can then say that both statements specialise the same library theorem.

## C02 — The route of 2.2 proves the bound for every symmetric law with unit variance and even moments at most the Gaussian ones, while 2.2 and 2.3 are stated for a closed list of three laws

A consumer with a fourth entry law (the uniform law on `[−√3, √3]`, whose even moments `3^m/(2m + 1)` are `1, 9/5, 27/7, … ≤ (2m − 1)!!`, or the sparse sign law with values `±√s` of probability `1/(2s)` for `1 ≤ s ≤ 3`) cannot use `sign_jl_tail` or `jl_finite_set`, although the route of 2.2 applies word for word: it uses only that odd moments vanish, that `E r² = 1` and that `E r^(2m) ≤ (2m − 1)!!` (lines 206–216; the lower tail needs `E Q² = 1` and `E Q⁴ ≤ 3`, which follow). The predicate `IsJLEntryLaw` is a disjunction of three equalities of measures (`Suggested.lean`, line 85), so a new law means a new theorem.

It would be more useful to state 2.2 under that moment hypothesis (a predicate on `ν`: probability measure, symmetric, variance `1`, `∫ x^(2m) dν ≤ (2m − 1)!!` for all `m`), with the Rademacher and sparse sign laws as the two instances proved in 2.1, and the standard Gaussian as a third instance so that 2.3 is one statement. The present statements are true and are the ones in the literature; this is an offer, and keeping the three-law form with one sentence saying which properties of the laws the route uses would also do.

## C03 — "It is positive exactly for `0 < ε < 3/2`" is true only among `ε > 0`

In the Conventions (line 70) `g(ε) = ε²/2 − ε³/3` is introduced with no restriction on `ε`, and the roadmap does consider `ε ≤ 0` elsewhere (the Check of 1.3, the definition of 5.1). As a statement about the function it is wrong for negative arguments: `g(ε) = ε²(1/2 − ε/3)`, so `g(−1) = 5/6 > 0`, and `g` is positive exactly for `ε < 3/2`, `ε ≠ 0`. Writing "for `ε > 0` it is positive exactly when `ε < 3/2`" makes the sentence true; nothing else depends on it, since every statement that uses `g` assumes `ε > 0`.

## C04 — The description names two boundary roadmaps; the head has a third paragraph, on GaussianLinearModels 2.2

The description says "Two roadmaps on main are boundaries" and lists MathematicalStatisticsHighDimensional and RandomMatrices. The scope section at this head also has a paragraph on GaussianLinearModels 2.2 (the mean of a quadratic form, of which the mean identity of 3.1 is a case), and on the matrix concentration of OperatorTheory/MatrixSpectralStatistics, Part C. Neither is a supplier, so "No roadmap is consumed as a supplier" stays true. A sentence would bring the text up to date: "The mean identity of 3.1 is the case `μ = 0`, `S = 1` of GaussianLinearModels 2.2 (an open roadmap, not consumed); the elementary matrix concentration of OperatorTheory/MatrixSpectralStatistics, Part C, is not used."

## N01 — "(an open roadmap, not on main)" in the scope section dates the text

Line 526 describes the state of another roadmap at the time of writing; once that roadmap merges the sentence is wrong. "GaussianLinearModels states in its 2.2 …; this roadmap does not depend on it" says what is needed.

## N02 — `EuclideanSpace.basisFun` is listed under the wrong file

In "From Mathlib" it stands in the bullet for `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean`; at the pin it is defined in `Mathlib/Analysis/InnerProductSpace/PiL2.lean` (line 782).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `chiSquared_upper_tail` | `k=2,β=2`; `k=0`; `β=1`; `k=50,β=0.8` (outside hypothesis) | `e^-2=0.135 ≤ 2/e=0.736`; `1 ≤ 1`; bound `1`; bound `0.5607` vs `P(χ²₅₀≥40)=0.8432` (fails, as the Check says) | true; side condition needed | none |
| 1.1 `chiSquared_lower_tail` | `k=2,β=1/2`; `β≤0,k≥1`; `k=0`; `k=50,β=1.2` | `0.393 ≤ √e/2=0.824`; LHS `0`; `1 ≤ 1`; bound `0.6428` vs `P(χ²₅₀≤60)=0.8428` | true | none |
| 1.1 route | `s=(1−1/β)/2` | `1−2s=1/β`; `exp(−sβk)(1−2s)^(−k/2)=β^(k/2)e^(−(β−1)k/2)` | equals the stated bound | none |
| 1.2 `gaussian_jl_tail` | `k=40,ε=1/2`; even `k≤200`, `ε=0.01..2.99`; `k=0`; `x=0`; `ε≥3/2` | `0.02533 ≤ 0.37775`; exact tails exceed bound in `0` of 29 900 cases; event prob `1 ≤ 2`; empty event; bound `≥ 2` | true | none |
| 1.2 log estimates | derivative of `ε−log(1+ε)−g` | `ε³/(1+ε) ≥ 0`; `−ε−log(1−ε) ≥ ε²/2 ≥ g` on `(0,1)` | true | none |
| 1.3 `exists_jl_embedding` | `n=100,ε=1/2`; `n=0,1`; `ε≥1`; `ε=3/2`; `ε≤0` | `48 log 100=221.05`; `log n=0`, no pair; zero matrix: `(1−ε)a ≤ 0 ≤ (1+ε)a`; `x/0=0`; false, as the Check says | true; union bound `n(n−1)/n² < 1` | none |
| 2.1 sparse sign law | moments; variant `±1` w.p. `1/6` | total mass `1`; `E r^(2m)=3^(m−1)`: `1,3,9 ≤ 1,3,15`; variant variance `1/3` | true | none |
| 2.2 `sign_jl_tail` | lower-tail inequality on `ε∈(0,1]`, 10⁵ points; `d=1`; variant law | log-difference `/ε³` in `[−1/48, −0.0176]`, series `−ε³/48`; prob `0`; `P(B<20)=0.9786 > 0.378` | true; `E Q⁴ = 3−2∑xⱼ⁴` and `3` | C02 |
| 2.3 `jl_finite_set` | `n=100,ε=1/2,β=1`; `n=0,1`; `β≤0`; `ε=2,n=2,β=4` | `72 log 100=331.57`; RHS `1−0^(−β)∈{0,1}`, `1−1=0`; RHS `≤0`; `k≥−12.48`, `P(χ²₁≤3)=0.9167 < 0.9375` | true; `n(n−1)n^(−2−β) ≤ n^(−β)` | none |
| 3.1 `integral_hutchinson`, `variance_hutchinson` | `[[1,1],[1,1]]`; all-ones `3×3`; `E₁₂` (non-symmetric); diagonal | mean `2`, var `4=2(4−2)`; `12=2(9−3)`; var `1` vs formula `2`; var `0` | true; symmetry needed for variance only | C01 |
| 3.2 `gaussian_trace_estimator_tail` | rank one `M=40,ε=1/2`; `diag(1,−1)`; `M=0`; `tr A=0`; products | `0.0253 ≤ 0.378`; prob `1 > 0.378` without PSD; `1 ≤ 2`; empty; `∏(1−aⱼ) ≥ 1−∑aⱼ`, `∏(1+aⱼ) ≥ 1+∑aⱼ` | true; `g ≥ ε²/6` gives `12ε⁻²log(2/δ)` | none |
| 4.1 `countSketchMatrix` | `h=(1,3,1,2)`, `σ=(1,1,−1,−1)`, `x=1` | rows `(1,0,−1,0),(0,0,0,−1),(0,1,0,0)`; `Sx=(0,−1,1)`, norm² `2` | as stated | none |
| 4.2 `integral_countSketch`, `variance_countSketch` | `x=(1,1)`, `k=1,2`; `σ₄=σ₁σ₂σ₃`, `k=1`; `σ₂=σ₁`; `x=(1,2,3),k=2`; `k=0` | var `4`, `2`; values `16` w.p. `1/4` else `0`: mean `4`, var `48` vs `24`; `4≠2`; `98`; vacuous for `d≥1`, `0=0` for `d=0` | true; hypotheses needed | none |
| 5.1 `IsSubspaceEmbedding` | `I`; `0`; `diag(1,2)`; `√2·I` | `ε≥0`; `ε=1` only; `‖y‖² ≤ y₁²+4y₂² ≤ 4‖y‖²`, fails at `e₂` for `ε<3`; `2‖y‖²` | as stated | none |
| 5.2 `sketch_and_solve` | `S²=[[1,ε],[ε,1]]`, `A=e₁`, `b=e₂`; `S=0,ε=1`; `ε<0` | minimiser `x̃=ε`, `1+ε² ≤ (1+ε)/(1−ε)`, `1.25 ≤ 3`; unbounded, factor `2/0=0`; `1−ε>0` still divides | true | none |
| Scope: sub-gamma comparison | `ε=0.1` | `(√1.2−1)²/4=0.0022774 < g(0.1)/2=0.0023333` | as stated | none |
| Conventions: sign of `g` | `ε=−1` | `g(−1)=5/6>0` | sentence true only for `ε>0` | C03 |

- Source locators checked against the text: 9 (Dasgupta–Gupta Theorem 2.1 p. 61, its proof p. 62, Lemma 2.2 pp. 62–64; Avron–Toledo Lemma 1 p. 2, Lemma 9 p. 6, Theorem 10 p. 6; Woodruff Definition 1 p. 10, Theorem 14 pp. 23–24, Theorem 21 and Corollary 22 pp. 31–32).
- Library declarations opened at the pins: 15 Mathlib (all found at the files cited, except the file of `EuclideanSpace.basisFun`, N02) and 12 Tau Ceti (`chiSquaredMeasure` at `ChiSquared/Basic.lean` 209, `mgf_id_chiSquaredMeasure` 444, `iIndepFun.hasLaw_sum_sq_gaussian` at `Gaussian/ChiSquared.lean` 206, `mgf_inner_toEuclideanLin_stdGaussian` at `Gaussian/QuadraticForm.lean` 93, `integral_pow_rademacherMeasure` at `Rademacher/Basic.lean` 184, the two Wishart trace statistics at `Wishart/Moments.lean` 439 and 451, and the others).
- Cross-roadmap citations resolved: MathematicalStatisticsHighDimensional 1.1, 1.2, 2.4 and RandomMatrices 2.3, 2.4, 2.6 on main (and unchanged in the open revision that touches them); OperatorTheory/MatrixSpectralStatistics Part C on main; GaussianLinearModels 2.2 at its open head.
- Duplication by object: no Johnson–Lindenstrauss, sparse sign law, trace estimator, CountSketch or subspace embedding in the pinned Mathlib or Tau Ceti, on main or in an open roadmap; no chi-squared tail bound in Tau Ceti; the one near match is C01.
- Elaboration: `lake env lean` on `TauCetiRoadmap/RandomProjectionsAndSketching/Suggested.lean`: 12 warnings, all `declaration uses sorry`, no error. The 19 elaborated types were compared with the README statements: binders, strictness of the events and the scope of each `∑` agree; nothing changed.
- One-tactic probe (`simp`, `rfl`, `norm_num`, `positivity` on each of the 12 theorems): none closes. No padding.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line. The README names no roadmap supplier.
- Automatic checks: all passed at this head.

Overlap check: read MathematicalStatisticsHighDimensional (main and its open revision), RandomMatrices (main and its open revision), StandardDistributions, GaussianLinearModels, KalmanFiltering, PoissonApproximation; chi-squared tails are shared in name only (the sub-gamma form is owned by MathematicalStatisticsHighDimensional 1.2, the rate-function form here, and the README says so); the mean of a quadratic form is owned by Tau Ceti at the pin and by GaussianLinearModels 2.2 in general form, with the Rademacher case kept here (C01); nothing else shared.

Source independence: 9 passages compared with 3 sources, none shared beyond formulas; largest share Woodruff2014, 6 of 15 locators; contents compared with Woodruff2014 (§§2.1–2.7): independent (Layer 4 ↔ part of §2.2, Layer 5 ↔ Definition 1 of §2.1 and §2.5, in the opposite order; Layers 1–3 have no counterpart there). Achlioptas' paper, which the route of 2.2 is said to follow, could not be read and was not compared.

Research link: the headline targets are the dimension-reduction lemma of Johnson–Lindenstrauss (1984) in the forms of Dasgupta–Gupta (2003) and Achlioptas (2003), the trace estimators analysed by Avron–Toledo (2011), and the CountSketch moment bound and sketch-and-solve regression of Woodruff (2014), after Thorup–Zhang and Sarlós (2006); README references and the three texts read.

## Not verifiable

- Achlioptas, *Database-friendly random projections* (2001, 2003): the publisher's page is paywalled and no legal copy was found; the attributions in 2.2 ("proves the one-sided forms for unit vectors") and 2.3 (the theorem with `(4 + 2β) log n / g(ε)`) were not checked against the text. The README gives no locator into it. The mathematics of 2.2 and 2.3 was checked independently.
- The attributions without locators to Johnson–Lindenstrauss, Hutchinson, Charikar–Chen–Farach-Colton, Thorup–Zhang and Sarlós were not opened; Woodruff's attribution of Theorem 14 to Thorup–Zhang was read (Woodruff2014 line 837).
- Avron–Toledo: the preprint's numbering was read; its agreement with the Journal of the ACM version was not checked (the README cites the preprint's numbering and says so).
- Dasgupta–Gupta was read through OCR: the displayed formulas of Lemma 2.2 are partly garbled (DasguptaGupta2003 lines 76–83); the exponent `(k/2)(1 − β + ln β)` and the sides `β < 1`, `β > 1` are legible.

## Source issues

- **Gap** in Woodruff2014 at proof of Theorem 21, printed page 32: the source says a minimiser of the sketched problem solves the regression problem of Definition 20, whose factor is `1 + ε` on norms, directly from the `(1 ± ε)` embedding of squared norms; it should be the factor `√((1 + ε)/(1 − ε))`, larger than `1 + ε` for `0 < ε < 1`, or `ε` rescaled by a constant; affects a stated result.
- **Misprint** in Woodruff2014 at proof of Theorem 14, printed page 24: the source says the cross terms of the fourth moment are products of squares indexed by `j₁` and `j′₁` under a sum over `j₁ ≠ j₂`, and calls the last step the sixth inequality; it should be indexed by `j₁` and `j₂`, and the step is the second inequality; affects nothing.

## For the human reviewers

- **Scope.** Three statements are derived in the roadmap and cited to no refereed source: the rate-function chi-squared tails (1.1), the existence theorem for all `ε > 0` (1.3), and the trace-estimator tail with constant `12` (3.2; Avron–Toledo, Theorem 10, has `20`).
- **Licence.** The Dasgupta–Gupta text cited is the Wiley published version hosted on the first author's university page (README references, line 617); whether that hosting is licensed was not settled.
- **Not tested.** Layer 2 (2.2, 2.3) follows Achlioptas' paper, which could not be read legally; wording and attribution were not compared with it. The pull request's description says the author could not confirm a legal copy either.
