# Review of HodgeClassesForJacquetLanglands (pull request #2436 at e9118f6)

**Verdict:** accepted

## Previous findings

- R01 — repaired: §5.1 now reads "(IP23, §4.2, p. 23; §12.2.2, pp. 94–96)". §12.2.2 runs from IP23 line 4316 (p. 94) to line 4412 (p. 96), and `h_B` is at line 4409.
- R02 — repaired: §5.4 now reads "(IP23, §11.3, pp. 83–85; Proposition 12.2 and §12.2.3, p. 96; §§12.2.6 and 12.2.10, p. 97)". The page markers confirm each page (IP23 lines 4413, 4445, 4469–4474, 4486–4488).
- R03 — repaired: the summary block now reads "in parallel weight two with ℚ(π) = ℚ it lives in H^{2d}(X₁ × X₂, ℚ)(d)". The prose reads "the parallel weight-two case with `ℚ(π) = ℚ` is a rational Hodge class".
- R04 — repaired: the summary block now reads "on ⋀² in dimension four it includes the inverse of Mathlib's `exteriorPower.hodgeStar` and Tau Ceti's `Orientation.barHodgeStar`". Negating `vol` covers both orientation signs.

## Verified sound

| Statement | Instances tried | Roadmap side | Computed / source side | Result |
| --- | --- | --- | --- | --- |
| Summary / §10.9 weight-two headline | `F` real quadratic, `d=1`; `ℚ(π)=ℚ(√5)` versus `ℚ(π)=ℚ` | rational class only if every `k_v=2` and `ℚ(π)=ℚ`; else `L`-rational in `V₁⊗_L V₂(1)` | IP23 line 166–168 (p. 4): parallel weight two and rational eigenvalues; Künneth at line 4502 (p. 98) | agrees |
| §5.1 `h_B` (locator changed) | `v∈Σ`, `z=i` | `diag(z², zz̄, zz̄)`; at `i`: `diag(−1,1,1)` | `ι′(z)`: `w_{i1}↦w_{i1}z`, `w_{i2}↦w_{i2}z̄` gives `z·z`, `z̄·z`, `z·z̄`; IP23 line 4404, 4408–4409 (p. 96) | agrees |
| §5.4 coefficients (locator changed) | `k_v=2,4,6` | `((k−2)/2,(k−2)/2,−,−)`: `0`, `(1,1,−1,−1)`, `(2,2,−2,−2)` | IP23 line 4440–4442 `(k/2−1,…)` gives the same; Prop. 12.2 at line 4445 (p. 96) gives `ℚ(k)`-form unique up to homothety | agrees |
| §5.4 rational projection | §12.2.6, §12.2.10 | projection to `τ_k^∨⊠τ_k^∨` preserves the rational structure | line 4472–4474: the projection keeps the `ℚ(k)`-structure; line 4488: `V_ρ≃V_k⊠V_k` (p. 97) | agrees |
| §7.1 auxiliary `τ` (locator changed) | `F` real quadratic, `Σ={v₁}` | weight `k_v+1`, character `ξ_E`, antiholomorphic at `Σ`, holomorphic outside | IP23 line 4452–4461: `2^{[F:ℚ]}=4` summands, one with these signs; spans the p. 97 marker at line 4455 | agrees |
| R04: `IsExteriorStar` vs library stars | `vol′=−vol`, `L′=−L`; `k=l=2`, `dim 4` | opposite orientation gives `−L` | `vol′(L′x∧y)=(−1)²vol(Lx∧y)`; Mathlib `hodgeStar` needs bijective `B`, `k+l=finrank` | description agrees |

The rows of the previous review for the untouched statements stand as in the review of `11238e8`.

- Source locators checked against the text: IP23, 8 locators.
  - p. 4: lines 166–168.
  - pp. 94–96: §12.2.2, lines 4316–4412.
  - p. 96: §12.2.3 at line 4413 and Prop. 12.2 at line 4445.
  - pp. 96–97: §12.2.4, lines 4451–4461.
  - p. 97: §12.2.6 at line 4469 and §12.2.10 at line 4486.
  - p. 98: line 4502.

  Both sampled targets in the change, §§5.4 and 7.1, were checked.
- Library declarations opened at the pins: Mathlib `LinearAlgebra/ExteriorPower/HodgeStar.lean:42–48` and Tau Ceti `Analysis/InnerProductSpace/HodgeStar/Complex.lean:126`.
- Cross-roadmap citations resolved:
  - ShimuraVarieties §§4.3, 6.7, 8.5 and 8.6, and AutomorphicFormsOnReductiveGroups §§4.2 and 5.7, at their open heads.
  - AdelicAlgebraicGroups §3.4 on main, at line 3112.
  - All 8 Lean-name leads in `citations.md`: seven are in the ShimuraVarieties README at its head (lines 412, 1180, 1312, 1899, 2478, 2499), and the eighth is this roadmap's `IsExteriorStar.map_similitude`.
  - Every supplier the README names is on main (ComplexKahlerGeometry; GlobalNumberFields and HodgeStructures under `Completed/`) or in the description's depends-on list.
- Gate at e9118f6: every check passed (`set_option=0 … source-material=0 OK`). Dependency check: `depcheck: 251 roadmaps, 2394 edges, 0 problem(s)`.
- Elaboration: `lake env lean Suggested.lean` gives three `sorry` warnings and nothing else. Running `#check @` on all four declarations shows no lost binders. `Suggested.lean` is unchanged since `11238e8`.

Overlap check: I read the scope of MetaplecticAutomorphicForms, AutomorphicLFunctionsAndLocalFactorsPartII, ExceptionalThetaCorrespondencesForG2, EndoscopicTransferAndUnitaryTraceComparison, ShimuraData, ArithmeticLocallySymmetricSpaces and AdelicAlgebraicGroups. The shared objects are unchanged since `11238e8`: the real Weil generator formulas are owned here (§4.2); the `GU` group scheme is owned by AutomorphicLFunctionsAndLocalFactorsPartII §0.0 and used here only in §1.7. `overlaps.md` reports no dropped ids and no conflicting heads.

Source independence: changed passages only. I compared 4 passages (the summary sentence and the §§5.1, 5.4 and 7.1 locator parentheses) with 1 source, IP23. The longest shared run is 3 words ("parallel weight two"), which the statement forces. The largest share of locators is IP23, with 126 of 146 source-id citations. No layer was added, removed or reordered (11 layer headings before and after), so the contents were not compared again: independent, as at `11238e8`.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
