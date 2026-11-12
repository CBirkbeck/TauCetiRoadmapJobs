# Review of SpecialFunctionsOrthogonalPolynomialsGeneral (pull request #2192 at eb5f68e)

**Verdict:** needs changes

## R01 (P3) — "There is no locator" sentences stand in for locators, and three are contradicted by sources (R04, partly repaired)

**Location:** `TauCetiRoadmap/SpecialFunctionsOrthogonalPolynomialsGeneral/README.md` lines 568–569, 805–806, 819, 858, 863–864 and 1005–1007, for example: "There is no locator; the route is Gershgorin and the auxiliary." and "here it is derived from the Pearson equation, and there is no locator for the derivation."
**Claim:** Three of these sentences are false, because sources state the reality of the zeros (8.1), the uniqueness in `favard_bounded` (8.4) and the derivation in 10.1. All six sentences talk about missing citations instead of specifying the mathematics, which the timelessness rule excludes.
**Witness:** Simon1998 line 2349 (Prop. 5.7, p. 52: the zeros are real; 9.1 already cites it). Simon1998 line 236 (Prop. 1.5, p. 6: moments `≤ C Rⁿ n!` give uniqueness). Magnus1993 lines 381–383 (p. 8): `W p′_n = (Ω_n − V)p_n − a_nΘ_n p_{n−1}`, derived from `W w′ = 2Vw`.
**Repair:**
- 4.3: delete "There is no locator: DLMF 18.2.41 only defines `P_z` and states its convergence."
- 8.1, lines 805–806: "The zeros of `p_n` are real (Simon (1998), Proposition 5.7, p. 52) and simple, being the eigenvalues of a Jacobi matrix with nonzero off-diagonal entries (3.5). Route for `L(p_m p_n)`: induction on `min(m, n)` through the recurrence."
- 8.2 auxiliary: replace "There is no locator; the proof applies … and bounds" with "Route: apply … and bound" (using the bound given in R02).
- 8.4 auxiliary: replace "There is no locator; by Markov's inequality" with "Route: by Markov's inequality".
- 8.4 `favard_bounded`: replace the last sentence with "Route: Gershgorin and the auxiliary; uniqueness is also Simon (1998), Proposition 1.5, p. 6, since the moments are at most `(A + 2B)ᵏ`."
- 10.1, lines 1005–1007: "DLMF 18.2.44 records the structure relation as part of its definition of a semi-classical measure. The derivation from the Pearson equation, with `W = π` and `2V = τ − π′`, is Magnus (1995), §3, p. 8; DLMF §18.2(xii) cites Ismail (2009), (3.2.3) and (3.2.10), for 18.2.42–18.2.43." Add to the References: "A. P. Magnus, Painlevé-type differential equations for the recurrence coefficients of semi-classical orthogonal polynomials, *J. Comput. Appl. Math.* 57 (1995), 215–237; arXiv:math/9307218. Page numbers refer to the arXiv version."

## R02 (P3) — The routes added to 8.1 and 8.2 do not close as written

**Location:** README.md lines 805–806: "`L(p_m p_n)` follows from the recurrence by induction on `m + n`"; lines 820–821: "bounds the tails uniformly in `n` by `R^{−j} ∫ x^{2j} dν_n`".
**Claim:** The recurrence step does not lower `m + n`, so an induction on `m + n` does not close. At `j = 0` the stated tail bound does not tend to `0` as `R → ∞`.
**Witness:** Expand `p₂ = (X − α₁)p₁ − β₁p₀` in `L(p₂p₂)`, then expand `X p₂` by the recurrence. This leaves `L(p₁p₃)`, which also has index sum 4. At `j = 0` the bound is `R⁰ ∫ 1 dν_n = ν_n(ℝ)` for every `R`.
**Repair:** 8.1: induct on `min(m, n)`, as in the R01 text. 8.2: "bounds the tails uniformly in `n` by `R^{−j−2} ∫ x^{2j+2} dν_n`". This holds because `|x|^j ≤ |x|^{2j+2}/R^{j+2}` for `|x| ≥ R`; at `j = 0` it gives `R^{−2} ∫ x² dν_n → 0`.

## R03 (P3) — The 10.2 locator repeats DLMF's sentence and its abbreviation

**Location:** README.md lines 1034–1035: "DLMF §18.2(xii), Sheffer polynomials: the Bernoulli polynomials are Sheffer polynomials that are not OP's".
**Claim:** The parenthesis restates the bullet's own claim in DLMF's wording. "OP's" occurs nowhere else in the README and is not defined.
**Witness:** DLMF182 lines 3067–3069 make the same statement in the same words: the Bernoulli and Euler polynomials are Sheffer polynomials that are not OP's.
**Repair:** "(`not_isOrthogonal_bernoulli`; DLMF §18.2(xii))".

## Previous findings

- R01 — repaired: README 111, 166, 241–244, 751, 769 cite "§6.21's `D_n(a) = det (a_(i+j+1))_{i,j<n}`" and its invariance in prose; `Suggested.lean` 439–440 now reads `(Matrix.of fun i j : Fin n => m (i.val + j.val)).det`; the description says "31 definitions".
- R02 — repaired: README 1001 now reads "weights: if `π ≠ 0` and `w ≥ 0` is differentiable on an open interval `(a, b)`", with the `π = τ = 0` Check at 1021–1022.
- R03 — repaired: README 857 now reads "a finite measure `ν` and `M ≥ 0` with `∫ x^{2k} dν ≤ C M^{2k}`", and the Scope table (line 99) adds "`M ≥ 0`".
- R04 — partly repaired: 9.1 (lines 918–923), 10.2, the statement of the 8.2 auxiliary and the 8.1 Gauss bullet (Simon (5.37), p. 56) now have a locator or a statement. 4.3, 8.1, 8.2, 8.4 and 10.1 say "There is no locator" instead (R01 here).
- R05 — repaired: the Laguerre Check at README 468–470, "`B_n = (2n + α + 1)/(n + 1)` … `(−½, 7/4, ¾)`".
- R06 — not repaired: README 1133–1135 still reads "Mathlib pull requests that are prior art: #38496 …, #38485 …, and #39498 …". Withdrawn and not re-raised: the repository README ("Defer to Mathlib") asks for Mathlib pull requests to be cited as prior art, and GeneralizedCohomology on main does so (line 2675).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 7.1 `hankelDet` (new body) | `n = 0, 1, 2`; Gaussian moments at `n = 3`; the former shifted form | Lean `simp` closes `Δ₀ = 1`, `Δ₁ = m₀`, `Δ₂ = m₀m₂ − m₁²`, `Δ₃ = 2`, and `hankelDet m n = D_n(k ↦ m(k − 1))` | holds | none |
| 7.1 route via the §6.21 invariance | Lebesgue on `[−1, 1]`, `n = 2` | `Δ₂ = 2·(2/3) − 0 = 4/3`; `h₀h₁ = 2·(2/3) = 4/3`; ClassicalArithmeticCompletion on main, lines 12093, 12104 | holds | none |
| 3.3 Laguerre Check | `α = ½`, `n = 1` | `(A₁, B₁, C₁) = (−½, 7/4, ¾)` = DLMF189 lines 235–238; `(A₁x + B₁)L₁ − C₁L₀ = x²/2 − 5x/2 + 15/8 = L₂^{(½)}` | holds | none |
| 4.3 `integral_poissonKernel_mul` route | Legendre, `x = 0.3`, `z = 0.5`, `m = 2` | integral of the series, term by term: `−0.0912500000`; `z²P₂(0.3) = −0.09125` | holds; "no locator" sentence | R01 |
| 8.1 Gauss bullet (Simon (5.37)) | `α = 0`, `β = ¼`, `n = 2` | nodes `±½`, weights `½`; moments `1, 0, ¼, 0, 1/16` against the semicircle's `1, 0, ¼, 0, ⅛`: they agree only for `j ≤ 3`; Simon1998 line 2525, p. 56 | holds | none |
| 8.1 first two bullets | `L(p₂p₂)`; reality of the zeros | the recurrence step gives `L(p₁p₃)`, of the same index sum 4; real zeros are Simon1998 line 2349 | statements hold; route and "no locator" wrong | R01, R02 |
| 8.2 auxiliary | `ν_n = (1 − 1/n)δ₀ + (1/n)δ_n`; `ν_n = δ_{1/n}`; `j = 0` | first: `∫x² dν_n = n`, and `∫x dν_n = 1 ↛ 0`, so the hypothesis is needed; second: `n^{−j} → 0^j`; at `j = 0` the bound is `ν_n(ℝ)` | statement holds; bound fails at `j = 0` | R02 |
| 8.4 auxiliary (`M ≥ 0`) | `M = 0`, `δ₀`; `M = 1`, `δ₂`; `M = −1` | `0^{2k} ≤ 0^{2k}`, support `{0}`; `4ᵏ ≤ C` fails; Markov gives `0.25C` and `9.8·10⁻⁴C` at `k = 1, 5`; `M = −1` is now excluded | holds | none |
| 8.4 `favard_bounded` | `α = 0`, `β = ¼` | `A + 2B = 1`, support `[−1, 1]`; moments `≤ 1 ≤ C·Rⁿ·n!` with `R = 1` (Simon1998 line 236, Proposition 1.5) | holds; a locator exists | R01 |
| 9.1 interlacing, `associated_roots_mem_Ioo` | monic Legendre, `N = 3, 4` | `p₃`: `0, ±0.774597`; `p₂^{(1)} = X² − 4/15`: `±0.516398`; `p₄`: `±0.339981, ±0.861136`; `p₃^{(1)} = X³ − (11/21)X`: `0, ±0.723747` | holds; Simon1998 lines 2342–2351 | none |
| 10.1 weight criterion (`π ≠ 0`) | Laguerre `α = ½` (`π = x`, `τ = 3/2 − x`); `π = τ = 0` | `(x^{3/2}e^{−x})′ = (3/2 − x)x^{½}e^{−x}`, boundary terms `0`; `π = 0` is excluded, as in `IsSemiclassical` (Lean line 565) | holds | none |
| 10.1 `structure_relation`, `lowering_raising` | orthonormal Hermite (`W = 1`, `V = −x/2`) | Magnus1993 lines 381–383 with `Ω_n = V`, `Θ_n = −1`, `a_n = √n`: `p′_n = √n p_{n−1}`, matching `He′_n = n He_{n−1}` | holds; a locator exists | R01 |
| 10.2 `not_isOrthogonal_bernoulli` locator | DLMF §18.2(xii) | DLMF182 lines 3067–3069 state the claim; README 1035 repeats that clause | holds; wording | R03 |

The rows for untouched statements stand as in the previous review, of ab9f5aa.

- Source locators checked against the text:
  - Simon1998: Proposition 1.5 (line 236, p. 6); (5.13)–(5.14) and Proposition 5.7 (lines 2342–2351, p. 52), which confirm that his `Q_N` is a multiple of `p_{N−1}^{(1)}`; (5.37) (line 2525, p. 56).
  - DLMF182 lines 2027–2028, 2936–2973 and 3067–3069; DLMF189 lines 235–238.
  - Magnus1993 (arXiv:math/9307218v1) lines 223–224, 267–286, 314–321 and 381–383.
- Library at the pins: a scratch copy of `hankelDet` elaborates, and `simp` closes the five probes in the first row. Mathlib has no Hankel determinant. Tau Ceti has only `TauCeti.sub_nonneg_of_posSemidef_hankel` (`Analysis/Matrix/PosSemidef/Basic.lean` 159), a different statement.
- Cross-roadmap citations: ClassicalArithmeticCompletion §6.21 (main, lines 12091–12104) matches README 109–112, 238–244, 751 and 769. `roadmaps grep hankelDet` finds only this roadmap; `roadmaps resolve` and `roadmaps overlaps` report nothing.
- Overlap check: read LaguerreJacobi, SpecialFunctionsGamma, SpecialFunctionsLegendre, SpecialFunctionsConfluent, SpecialFunctionsAppell (open), and OrthogonalL2Bases, SpecialFunctionsEiLiErfIncompleteGamma, SpecialFunctionsHypergeometric (main). The lists are unchanged since ab9f5aa. Two objects are shared, and this roadmap cites both owners: the Hankel determinant (ClassicalArithmeticCompletion §6.21) and the orthonormal polynomials of a weight (RandomMatrices §8.2).
- Dependency check: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Gate rerun at eb5f68e: every check is `0`, `OK`.
- Elaboration of `Suggested.lean`: 63 `sorry` warnings and nothing else. The file has 63 theorems and 31 definitions, as the description says. It has no section `variable`s, and the only changed declaration, `hankelDet`, keeps its type `(ℕ → ℝ) → ℕ → ℝ`.
- Pull-request text: the title, the Dependencies paragraph, "63 theorems, with the 31 definitions" and the Mathlib prior-art paragraph all match the head.

## Not verifiable

- Ismail (2009), (3.2.3) and (3.2.10): no legal copy found; read only as DLMF182 line 2936 cites them.
- Szegő (1975), Chihara (1978), Andrews–Askey–Roy (1999), Rota–Kahaner–Odlyzko (1973): as in the previous review (no legal copy, or paywalled); this change does not touch their citations.

## Source issues

- none
