# Review of SpecialFunctionsGamma (pull request #2191 at b805908)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `README.md:757–758` "the integrals of `(1/(1 + t) − e^{−t})/t` and of `e^{−t}/(1 − e^{−t}) − e^{−t}/t` are 5.9.14 and 5.9.13 at `z = 1`, with `ψ(1) = −γ`."
- R02 — repaired: `README.md:760–762` "*Needs:* AnalyticNumberTheoryPartI §1.8a; AsymptoticExpansions 4.1; Mathlib `Real.eulerMascheroniConstant_eq_neg_integral_log`, `Real.eulerMascheroniConstant_eq_neg_deriv`, the cotangent partial fractions `cot_series_rep`, …"

## Verified sound

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| 4.4 route: 5.9.14 gives the first integral (R01) | `z = 1` | `∫₀^∞ (1/(1 + t) − e^{−t})/t = 0.57721566490153` / `−ψ(1) = γ = 0.57721566490153` | holds |
| 4.4 route: 5.9.13 gives the third integral (R01) | `z = 1` | `∫₀^∞ (e^{−t}/(1 − e^{−t}) − e^{−t}/t) = 0.57721566490153` / `−ψ(1) = 0.57721566490153` | holds |
| `eulerMascheroni_eq_integrals`, second conjunct from Mathlib's first equality (R02) | by parts on `(0, 1)` and `(1, ∞)` | `∫₀¹ (1 − e^{−t})/t − ∫₁^∞ e^{−t}/t = 0.57721566490153` / `−∫₀^∞ log t · e^{−t} = 0.57721566490153` | holds |
| 5.9.14 `digamma_eq_integral_one_add` | `z = 2`; `z = ½ + 1.3i` | `0.42278433509847`; `0.2340176 + 1.5699058i` / `ψ(2) = 0.42278433509847`; `ψ(z) = 0.2340176 + 1.5699058i` | holds |
| 5.9.13 `digamma_eq_log_add_integral` | `z = ½ + 1.3i` | `log z + ∫ … = 0.2340176 + 1.5699058i` / `ψ(z) = 0.2340176 + 1.5699058i` | holds |
| Scope item 1: 5.4.3 excluded, consumed as SpecialFunctionsParabolicCylinder 6.6(a) over `y²` (`README.md:361–362`) | `y = 0.7`, `y = −2` | `|Γ(0.7i)| = 1.0039138924`, `|Γ(−2i)| = 0.0765948094` / `(π/(y sinh πy))^{1/2}`: same; `|Γ(1 + 0.7i)|²/0.49 = 1.0078431034 = |Γ(0.7i)|²` | holds |
| Scope item 2: 5.15.1 off `Re z > 0`, `hasSum_deriv_digamma` | `z = −½`, `−1.5 + 0.7i`, `−3.2 − 0.4i` | series `8.9348022005`, `0.0330640 − 0.1490862i`, `−0.7865919 − 3.2740678i` / `ψ′`: `π²/2 + 4 = 8.9348022005`, same, same | holds |
| 5.15.1 on `Re z > 0` (ExplicitNumberFields 1.1a, consumed) | `z = 2 + i` | series `0.4630001 − 0.2942335i` / `ψ′(2 + i) = 0.4630001 − 0.2942335i` | holds; not owned here |

All other rows stand as in the previous review, of `5d705b1`.

- Gate: the worker's run reports every check 0, the build included. My run reports the same except `depcheck: NOT IN ORDER`, because the configured order lacks this roadmap. The candidate order lists it at line 277, right after ExplicitNumberFields. The dependency check with the candidate order gives "depcheck: 206 roadmaps, 1899 edges, 0 problem(s)". Nothing changed outside the folder.
- Elaboration: `lake env lean` of `Suggested.lean` gives 73 `sorry` warnings and nothing else. The file has 73 theorems and 6 definitions and is unchanged since `64d932a`, so its signatures stand as checked then.
- Source locators checked against the text, 4: DLMF 5.4.3 (`DLMF` §5.4 line 127), 5.4.7–5.4.10 (lines 250–325, decimal values), 5.4.20 (line 751), and 5.15.1 with `z ≠ 0, −1, −2, …` (§5.15 line 64).
- Seeded sample in the changed passages: 1.2 (its 5.4.3 paragraph) and 7.4 (its route through 5.15.1, `README.md:1070`) have rows above. No other sampled target cites the changed text.
- Pinned Mathlib declarations opened, 4: `Real.eulerMascheroniConstant_eq_neg_integral_log` and `Real.eulerMascheroniConstant_eq_neg_deriv` (`NumberTheory/Harmonic/GammaDeriv.lean:97`, `:92`, namespace `Real`); `cot_series_rep` (`Analysis/SpecialFunctions/Trigonometric/Cotangent.lean:233`, root namespace); `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (`Analysis/Calculus/ParametricIntegral.lean:569`).
- Cross-roadmap citations resolved, 4:
  - SpecialFunctionsParabolicCylinder 6.6(a) `norm_Gamma_one_add_mul_I_sq` on main (`README.md:817`, `Suggested.lean:318`);
  - ExplicitNumberFields 1.1a at its open head (`README.md:1315–1326`, 5.7.6 and 5.15.1 for `Re z > 0`);
  - AnalyticNumberTheoryPartI §1.8a `digamma_eq_integral` on main (`Suggested.lean:559`);
  - AsymptoticExpansions 4.1 on main (`README.md:544`).
- Description, checked against this head:
  - Layer 2's "5.15.1 off `Re z > 0`", the 5.4.3 dependency on SpecialFunctionsParabolicCylinder 6.6(a), "73 theorems, with the 6 definitions" and the **Build.** line all match.
  - No sentence is contradicted and no change is left unstated.
- Overlap check: read SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsStruve, SpecialFunctionsBessel, SpecialFunctionsConfluent, SpecialFunctionsAppell, SpecialFunctionsHypergeometric, SpecialFunctionsAiry, SpecialFunctionsParabolicCylinder and SpecialFunctionsEiLiErfIncompleteGamma.
  - The lists are unchanged since `b0ab817`.
  - Shared objects and their owners:
    - 5.4.3 and 5.8.3: SpecialFunctionsParabolicCylinder 6.6(a);
    - 5.12.3 for complex parameters and 5.13.3: SpecialFunctionsHypergeometric 6.3;
    - 5.5.6 at `n = 3`: SpecialFunctionsAiry 7.1;
    - 5.7.6 and 5.15.1 on `Re z > 0`: ExplicitNumberFields 1.1a.
  - No open pull request changes this roadmap or drops an id it cites.

Remark on untouched text, no change asked: scope item 7 ("DLMF §§5.15–5.16") still covers 5.15.1 on `Re z > 0`, although item 2 now leaves that case to ExplicitNumberFields 1.1a.

## Not verifiable

- DLMF §5.9 (5.9.13, 5.9.14 and 5.9.18, the equations the repaired route names): the sources service resolves `https://dlmf.nist.gov/5.9`, `/5.9.ii` and `/5.9.E13` to the Figure 5.9.1 PDF. R01 rests on the README's numbering (`README.md:728–730`), the docstrings at `Suggested.lean:306` and `:312`, and the values above.
- Widder (1941), Titchmarsh (1939), Andrews–Askey–Roy (1999) and Temme (1996): the change touches none of their passages. They are not verifiable, for the reasons given at `b0ab817` and `64d932a`.

## Source issues

- none
