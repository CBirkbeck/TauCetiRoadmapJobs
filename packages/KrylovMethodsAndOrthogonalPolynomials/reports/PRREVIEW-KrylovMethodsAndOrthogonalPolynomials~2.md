# Review of KrylovMethodsAndOrthogonalPolynomials (pull request #3019 at 774a6ab)

**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 126 lines changed since `527de8b`, and the one finding of the previous review is repaired. 1.1 now names Tau Ceti's diagonal measure and SelfAdjointSpectralTheory SA-B21, SA-B31 as owners of the general object and states the comparison (`spectralMeasure_eq_map_diagMeasure`), which elaborates at the pins and was recomputed on the README's three examples; the dropped hypotheses `0 < k` of 2.4 and 3.1 were checked at `k = 0`. There is no small correction and one format note, not blocking. Two points remain for the human reviewers (the recurrence targets of 3.2 and 4.4 against the rule on algorithms, and one source on an unclassified host).

## N01 — The module docstring of `Suggested.lean` still says the headline theorems are stated "against the pinned Mathlib"

Since `spectralMeasure_eq_map_diagMeasure` is stated against Tau Ceti's `ContinuousLinearMap.diagMeasure` and the file imports one Tau Ceti module, "against the pinned Mathlib and Tau Ceti" (line 7) would agree with the docstring's own last sentence.

## Previous findings

- R01 — repaired: "The scalar spectral measure of an operator at a vector is Tau Ceti's `ContinuousLinearMap.diagMeasure` … 1.1's spectral measure is the matrix case"; 1.1 states `spectralMeasure_eq_map_diagMeasure`; "From Tau Ceti" lists the three declarations used.
- C01 (small correction) — repaired: 2.4 reads "For `k ≤ g` and `z ∈ ℂ` with `monic μ k (z) ≠ 0`"; the Gauss-remainder clause of 3.1 is unconditional, "for `k = 0` the sum is empty"; both Lean statements follow.
- N01 (format note) — repaired: "Every finite measure on `ℝ` with finite support … is a spectral measure, of `A = diag(t_l)` and `b_l = √w_l`".
- N02 (format note) — repaired: "For outliers below (`0 < t ≤ a`) the factor is `c/t − 1`", with the route's remark that the factor of `t = 0` is `1`.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `spectralMeasure_eq_map_diagMeasure` | `diag(1,2,4)`,`(1,1,1)`; `((2,i),(−i,2))`,`(1,0)`; `1 ⊕ ((2,i),(−i,2))`,`(1,1,0)`; `b = 0`; empty `ι` | `δ₁+δ₂+δ₄` both sides; eigenvector `(i,1)/√2` gives `δ₁/2+δ₃/2`, moments `1,2,5,14`; `(3/2)δ₁+(1/2)δ₃`; `0 = 0`; `0 = 0` | holds | none |
| 1.1 comparison, Lean form | `#check`; map measurable (`fun_prop`); normality instance derived from `hA` in a probe copy; `simp`, `rfl` probes | type is `spectralMeasure hA b = Measure.map (fun z => (↑z).re) (…diagMeasure (toLp 2 b))`; map is not the junk `0`; probes do not close | not padding | none |
| 2.4 `sum_christoffelNumber_div_eq_convs` at `k = 0` | `k = 0 < g`; `k = g = 0` (`b = 0`) | empty sum `0`; `(jFraction α β z).convs 0 = 0` (closed by `simp` in a probe copy), so `μ(ℝ)·0 = 0`; `μ = 0`, `∫ (z−x)⁻¹ dμ = 0` | holds | none |
| 3.1 `IsCGIterate.lanczos`, Gauss clause at `k = 0` | `diag(1,2)`,`(1,1)`,`x₀ = 0`; general | `x = x₀` (Krylov space `⊥`); `‖e₀‖_A² = 1 + 1/2 = 3/2 = ∫ λ⁻¹ dμ − 0`; in general `r₀* A⁻¹ r₀` both sides; elaborated conjunction parses as five clauses | holds | none |
| 4.3 outlier factors | `0 < t ≤ a`; `t = −1, a = 1, c = 9`; `t = 0`; non-eigenvalue `t = c`, `t = (a+c)/2` | `max = c/t − 1 ≥ a/t − 1`; `10`; Lean factor `max(1,1) = 1 ≥ q`; `1 − 1/κ ≥ q`; `(κ−1)/(κ+1) ≥ q`: adding a point never lowers the bound | holds | none |
| Scope: finite measures are spectral measures | `Σ w_l δ_(t_l)`, `A = diag(t_l)`, `b_l = √w_l`, one `w_l = 0` | atom at `t_l` of mass `|b_l|² = w_l`; zero weight gives no atom | holds | none |

The rows of the previous review for the untouched statements stand as in the previous review, of `527de8b`.

- Source locators checked against the text: 0 new (the changed passages carry no source locator; the comparison, the `k = 0` cases and the scope sentence are proved in the README).
- Library declarations opened at the pin: 16 by `#check` (Tau Ceti `ContinuousLinearMap.diagMeasure`, `integral_diagMeasure_eq_inner_cfc`, `diagMeasure_real_univ` in `TauCeti/Analysis/InnerProductSpace/BorelCalculus/DiagonalMeasure.lean`, lines 66, 81, 95; Mathlib `Matrix.toEuclideanCLM` (a star-algebra equivalence), `Matrix.isHermitian_iff_isSelfAdjoint`, `IsSelfAdjoint.isStarNormal`, `AlgEquiv.spectrum_eq`, `Matrix.IsHermitian.spectrum_eq_image_range`, `cfc_congr`, `cfc_polynomial`, `MeasureTheory.integral_map`, `Lagrange.basis`, `GenContFract.zeroth_conv_eq_h`); all exist with the stated content.
- Cross-roadmap citations resolved: SelfAdjointSpectralTheory SA-B21 (README line 334) and SA-B31 (line 363) on main; SpecialFunctionsOrthogonalPolynomialsGeneral 5.1, 5.3, 9.2 on main; all say what the README attributes to them.
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: every check passed on rerun; elaboration of `Suggested.lean`: 17 `sorry` warnings and nothing else; `#check @name` on the three changed theorems, each agrees with its README statement.
- Pull request text: the description states the comparison, the Tau Ceti import, 17 theorems and 24 definitions, and the dropped hypotheses; all agree with the head. No file changed outside the folder.
- Overlap check: read IterativeMethodsForLinearSystems, EigenvalueIterations, HankelFormsAndRealMomentProblems, SpecialFunctionsOrthogonalPolynomialsGeneral and OperatorTheory/SelfAdjointSpectralTheory for the changed passages; shared: the scalar spectral measure of a vector, owner Tau Ceti and SelfAdjointSpectralTheory, now cited with 1.1 kept as the matrix variant and compared.
- Source independence: changed passages only; 3 passages compared with 1 text (the docstrings of Tau Ceti's `DiagonalMeasure.lean`), none shared beyond the formula; largest share Meurant–Strakoš, 6 of 19 locators, as in the previous review; no layer added, removed or reordered, so the arrangement was not compared again. Hestenes–Stiefel could not be read.
- Research link: Layers 2–3 are the Lanczos–Gauss quadrature dictionary on which Meurant–Strakoš (2006) base the analysis of Lanczos and conjugate gradients; 4.2 is Greenbaum's (1979) worst-case theorem as surveyed by Liesen–Tichý (2004); 5.1 is the Kaniel–Paige–Saad bound (Saad 2011). Rests on the README's sources and the texts read.

## Not verifiable

- Hestenes–Stiefel (1952), Theorem 6:1 and (6:1), p. 416; §14, (14:3)–(14:4), pp. 427–429: as in the previous review, the NIST archive's host is in no class the sources service reads; not looked for elsewhere.
- Greenbaum (1979), Kaniel (1966) and Paige's thesis: attributed in prose without locators, not read.

Automatic checks set aside as false positives: none (every check passed).

## Source issues

- none

## For the human reviewers

- **Scope.** 3.2 defines the Hestenes–Stiefel recurrence as an iterated map (`hsStep`, `hsIterate`) and 4.4 the three-term Chebyshev recurrence, and proves what their values are; IterativeMethodsForLinearSystems lists this equality as outside its scope. Whether such targets fall under the rule against algorithms is yours to decide.
- **Licence.** Hestenes–Stiefel (1952) is cited from the NIST archive (`nvlpubs.nist.gov`), a host the sources service could not classify; its five locators were not checked.
