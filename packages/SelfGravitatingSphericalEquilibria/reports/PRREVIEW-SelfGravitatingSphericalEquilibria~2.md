# Review of SelfGravitatingSphericalEquilibria (pull request #2948 at c55f9f8)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired. The finite-radius theorem (3.1) and the mass–radius relation (4.2) are now stated for `n < 5`, in the README and in `Suggested.lean`, and the new route for `1 < n < 5` (the virial identity with boundary terms and two decay estimates) was recomputed step by step and is correct. There are no findings, no small corrections and no format notes. As before, the lecture notes of Pols and Reall could not be read through the sources service, so a human should confirm the two author pages and the scope questions listed at the end.

## Previous findings

- R01 — repaired: 3.1 reads "For `0 ≤ n < 5`, `laneEmden_exists_zero`: a solution on `[0, ∞)` has a zero `ξ₁ > 0`"; 4.2 reads "For `0 < n < 5`, `polytrope_mass_radius`"; both Lean hypotheses are `n < 5`; the scope sentence is gone.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 3.1 step 1 (limit) | `L > 0` | `μ ≥ Lⁿξ³/3`, `θ' ≤ −Lⁿξ/3`, `θ ≤ 1 − Lⁿξ²/6 < 0` for large `ξ` | sound |
| 3.1 step 2 (identity with boundary terms) | general `n`; `n = 5` explicit solution; `θ(ξ₁) = 0` | `(n+1)W = 3J − ξ³θ^(n+1)`, `J = θμ + I`, `W = μ²/(2ξ) + I/2`, so `(3 − (n+1)/2) I = (5−n)I/2`; at `n = 5`: `ξ³θ⁶(ξ²/3 − θ⁻² + 1) = 0`; at a zero: `(5−n)W = 3μ²/ξ₁` | sound; agrees with 3.2 and 2.3 |
| 3.1 step 3 (estimates) | `T → ∞`; `n > 1` | `θ(ξ) ≥ μ(ξ)/ξ`; `μ ≥ ξ³θⁿ/3`; `(θ^(1−n))' = (n−1)θ^(−n)μ/ξ² ≥ (n−1)ξ/3`; `θ^(1−n) ≥ 1 + (n−1)ξ²/6` | sound |
| 3.1 step 4 (contradiction) | exponents; `n = 3`, `n → 5` | `1 − 4/(n−1) = 3 − 2(n+1)/(n−1) = (n−5)/(n−1)`; `n = 3`: `−1`; `n = 5`: `0` (no decay, as it must be) | sound for `1 < n < 5` |
| 3.1 coverage of `[0, 5)` | `n = 0`; `(0, 3)`; `(1, 5)` | 2.1; first route; second route; union `[0, 5)`; overlap `(1, 3)` | complete |
| `laneEmden_exists_zero` (Lean) | `n = 5`; `n = 0` | `n = 5` excluded by `n < 5` (2.3 positive); `n = 0`: `ξ₁ = √6`, positive on `[0, √6)` | agrees with README |
| 4.2 and `polytrope_mass_radius` for `n < 5` | `n = 3`; `3 < n < 5` | `α² = Kρc^(−2/3)/(πG)`, `M = 4πρcα³ω = 4ωK^(3/2)/(√π G^(3/2))`, `R^0 = 1`; exponent `(3−n)/n < 0` with `R > 0`, `C > 0` | sound; new Check true |
| Summary, "for `n > 1` both come from a virial identity" | at a zero | identity of step 2 with `θ(ξ₁) = 0` gives `(5−n)W = 3μ(ξ₁)²/ξ₁` | consistent with 3.1–3.3 |

The rows for the untouched statements stand as in the previous review, of `4ccad93`.

- Source locators checked against the text: 0 new; the changed passages add no locator (Ramming–Rein Lemma 3.1 and Theorem 4.2 were read in the previous review; the added clause only limits their use to `n < 3`, which that review computed).
- Library declarations opened at the pin: 5, all present where the README names them: `intermediate_value_Icc'` (`Mathlib/Topology/Order/IntermediateValue.lean:593`), `intervalIntegral.integral_mul_deriv_eq_deriv_mul_of_hasDerivAt` (`Mathlib/MeasureTheory/Integral/IntervalIntegral/IntegrationByParts.lean:110`), `intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le` (`Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1140`), `Real.hasDerivAt_rpow_const` (`Mathlib/Analysis/SpecialFunctions/Pow/Deriv.lean:452`), `antitoneOn_of_deriv_nonpos` (`Mathlib/Analysis/Calculus/Deriv/MeanValue.lean:482`); their hypotheses fit the uses in 3.1 (continuity on the closed interval, derivative in the interior, `θ > 0` for the real power).
- Cross-roadmap citations: none added or changed.
- Automatic checks: all passed at this head; the dependency check prints `depcheck: 170 roadmaps, 1983 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (15 theorems); the elaborated types of the two changed theorems carry `0 ≤ n → n < 5` and `0 < n → n < 5` and agree with 3.1 and 4.2.
- One-tactic probe: not run again; the two changed theorems only had a hypothesis weakened (`n < 3` to `n < 5`), and the previous probe closed neither.
- Headline theorems: unchanged list, all stated; the two revised ones are stated at the README's generality.
- Pull request text: title and description agree with this head (zero for `0 ≤ n < 5`, mass–radius for `0 < n < 5`, the route of 3.1 for `3 ≤ n < 5` named among the statements proved in the README).

Overlap check: read NBodyProblemAndCentralConfigurations, PDE, CompressibleEulerEquations; nothing shared (a search of all open heads and main for the Lane–Emden equation finds this roadmap only).

Source independence: changed passages only; 3 passages compared with 1 source (RR, as read in the previous review), none shared, the new route being the roadmap's own argument; largest share PO, about 14 of 24 locators, contents not readable; no layer added, removed or reordered.

Research link: The finite-radius lemma is Ramming and Rein (2012) on compact support of self-gravitating equilibria, and Buchdahl's inequality is the starting point of Andréasson (2007) on sharp bounds for `2m/r`; this rests on the README's references and on those two texts.

## Not verifiable

- PO (Pols, *Stellar Structure and Evolution*, 2011): not readable through the sources service (the author's page was refused in the previous review); the Table 4.1 entry `z₃ = 6.89685` quoted in the Check of 3.1 and the locator of 4.2 were not read. The mathematics was recomputed.
- HR (Reall, *Black Holes*, 2024): as in the previous review; untouched by this change.

## Source issues

- none

## For the human reviewers

- **Not tested.** PO has the largest share of the locators (about 14 of 24) and its text and table of contents could not be read: wording and arrangement were not compared with it.
- **Licence.** PO and HR are lecture notes on personal directories of their authors' institutions (`~onnop` at Radboud, `hsr1000` at DAMTP); the service could not classify either as an author page.
- **Scope.** PO and HR are unpublished lecture notes; RR and AN are cited as arXiv preprints (arXiv:1203.2590v1, arXiv:gr-qc/0702137v2). The README cites no journal article or published book.
