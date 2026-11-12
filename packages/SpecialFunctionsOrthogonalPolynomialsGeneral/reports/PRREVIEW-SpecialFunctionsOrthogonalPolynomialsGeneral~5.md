# Review of SpecialFunctionsOrthogonalPolynomialsGeneral (pull request #2192 at acaee4a)

**Verdict:** accepted

## Previous findings

- R01 — repaired: the 4.3 sentence is deleted. README 804–806 now reads "The zeros of `p_n` are real (Simon (1998), Proposition 5.7, p. 52) and simple…", and 858 and 863 read "Route:". Line 864 cites "Proposition 1.5, p. 6", 1007–1008 cite "Magnus (1995), §3, p. 8", and Magnus is listed in the References (1170).
- R02 — repaired: README 806 reads "induction on `min(m, n)` through the recurrence". README 821 reads "`R^{−j−2} ∫ x^{2j+2} dν_n`, since `|x|^j ≤ |x|^{2j+2}/R^{j+2}` for `|x| ≥ R`".
- R03 — repaired: README 1035 reads "(`not_isOrthogonal_bernoulli`; DLMF §18.2(xii))". "OP's" no longer occurs anywhere in the README.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 4.3 `integral_poissonKernel_mul` (the locator sentence is deleted) | Legendre, `x = 0.5`, `z = 0.4`, `m = 1`; series of 80 terms, Simpson rule | `∫ P_z(x, y) P₁(y) dy = 0.20000000`; `z P₁(0.5) = 0.2`; DLMF182 line 2826 defines `P_z` | holds | none |
| 8.1 `L(p_m p_n) = δ_{mn} β₁⋯β_n`, by induction on `min(m, n)` | `α_n = n`, `β_n = n + 1`, `m, n ≤ 4` | `L(p_m p_n)` = diag(1, 2, 6, 24, 120) = `β₁⋯β_n`, off-diagonal 0; the step `L(p₂p₂)` reduces to terms of minimum index ≤ 1: `6 = 6` | holds | none |
| 8.1 real and simple zeros (Simon Prop. 5.7) | the same recurrence, `p₄ = X⁴ − 6X³ + 2X² + 17X − 4` | zeros `−1.49268, 0.233198, 2.332149, 4.927333`, distinct, with sum `6 = α₀ + ⋯ + α₃`; Simon1998 line 2349, p. 52 | holds | none |
| 8.2 auxiliary, tail bound `R^{−j−2} ∫ x^{2j+2} dν_n` | `ν = N(0, 2)` and `N(0, 1.5)`, `R = 3`, `j = 0, 1` | `j = 0`: `0.03389 ≤ 0.22222` and `0.01431 ≤ 0.16667`; `j = 1`: `0.11893 ≤ 0.44444` and `0.04865 ≤ 0.25`; at `j = 0` the bound is `2/R² → 0` | holds | none |
| 8.4 auxiliary, Markov route | `M = 1`, `ε = 1`, `C = 1`, `k = 1, 5`; `M = 0` | `(M/(M + ε))^{2k} = 0.25` and `9.8·10⁻⁴`; at `M = 0` the bound is `0` for every `k ≥ 1` | holds | none |
| 8.4 `favard_bounded` with Simon Prop. 1.5 | `α_n = 1`, `β_n = 1` (`A = B = 1`); `α = 0`, `β = ¼` | moments `1, 1, 2, 4, 9, 21 ≤ 3ᵏ`, spectrum `[−1, 3] ⊂ [−3, 3]`; semicircle moments `1, 0, ¼, 0, ⅛ ≤ 1`; Simon1998 line 238: `|γ_n| ≤ C Rⁿ n!` | holds | none |
| 10.1 Magnus locator, `W = π`, `2V = τ − π′` | Laguerre `α = ½` (`π = x`, `τ = 3/2 − x`) | `W = x`, `2V = ½ − x`; at `x = 0.7`, `x w′ = −0.083095 = (½ − x) w`; monic `x p₄′ = 4p₄ + 18p₃`; Magnus1993 lines 221, 263, 381–383 | holds | none |
| 10.2 `not_isOrthogonal_bernoulli` (the locator is now DLMF §18.2(xii)) | `x B₁`, `x B₂`, `x B₃` in the Bernoulli basis | `x B₃ = B₄ + ½B₃ + ¼B₂ − (1/120)B₀`; the nonzero `B₀` term rules out a three-term recurrence; DLMF182 lines 3067–3069 | holds | none |

The rows for untouched statements stand as in the previous review, of eb5f68e.

- Source locators checked against the text: Simon1998 (arXiv:math-ph/9906008v1), Proposition 1.5 (lines 236–239, p. 6) and Proposition 5.7 (line 2349, p. 52). Magnus1993 (arXiv:math/9307218v1), (9) (line 221, p. 5), (11) (line 263, p. 7) and the §3 relations (lines 381–383, p. 8). DLMF182, lines 2027–2028, 2826, 2936, 2943–2973 and 3067–3069.
- The 8.2 route bounds only the tails of `ν_n`. The tail of `μ` obeys the same bound, because weak convergence and monotone convergence give `∫ x^{2j+2} dμ ≤ sup_n ∫ x^{2j+2} dν_n`. The route needs no change.
- `Suggested.lean` is unchanged since eb5f68e (`git diff --stat` is empty), so its elaborated signatures stand as checked there. Elaborating it at this head gives 63 `sorry` warnings and nothing else. It has 94 declarations (63 theorems, 31 definitions), as the description says.
- Gate rerun at acaee4a: every check is `0`, `OK`. Dependency check: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD or CYCLE line. There are no changes outside the folder.
- Overlap check: read LaguerreJacobi, SpecialFunctionsGamma, SpecialFunctionsLegendre, SpecialFunctionsConfluent and SpecialFunctionsAppell (open), and OrthogonalL2Bases, SpecialFunctionsEiLiErfIncompleteGamma and SpecialFunctionsHypergeometric (main). Searches for Favard, semi-classical, Sheffer and Poisson kernel find no other owner. OrthogonalL2Bases (main, line 118) and LaguerreJacobi (line 74) both exclude Favard. The shared objects stay with the owners this roadmap cites: ClassicalArithmeticCompletion §6.21 and RandomMatrices §8.2.
- Pull-request text: the title, the layer list, "63 theorems, with the 31 definitions" and the Build paragraph match this head. The change touches nothing that the description describes.

## Not verifiable

- Ismail (2009), (3.2.3) and (3.2.10): no legal copy found; read only as DLMF182 line 2936 cites them.
- Magnus (1995), the *J. Comput. Appl. Math.* version: paywalled. I read the arXiv version, whose page numbers the README says it uses.

## Source issues

- none
