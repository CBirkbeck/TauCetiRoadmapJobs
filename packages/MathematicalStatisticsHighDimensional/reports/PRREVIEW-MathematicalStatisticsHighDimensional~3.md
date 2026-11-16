# Review of MathematicalStatisticsHighDimensional (pull request #2396 at fd782b0)

**Verdict:** accepted

Incremental re-review of the 57 lines changed since `3d248d3`. No finding.

## Previous findings

- R01 — repaired: "with probability at least `1 - c₁ exp(-c₂n min(1, νδ², ν²δ²))`" in `README.md` 8.2, and `min 1 (min (ν * δ ^ 2) (ν ^ 2 * δ ^ 2))` in `spiked_leading_eigenvector`; route and both negative controls recomputed below.
- R02 — repaired: three `designCol` Checks under Conventions; a third Check each for the Akaike selector (`Y² > 8` at `σ = 2`), the Schwarz selector (tie at `log 100`), `supportPattern` and `glassoObjective`; each recomputed below.
- R03 — repaired: the Akaike entry is gone from "Also cited"; the list keeps Bickel–Levina and Candès–Plan, both cited in the text.
- R04 — repaired: "Parts of Layers 1–8 are formalized in `CKSD/Nonparametric/` of".
- R05 — repaired: "Assouad's lemma); Tau Ceti `etvDist_sq_le_two_mul_klDiv`; Mathlib `minimaxRisk`, `Kernel.deterministic`."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 8.2 `spiked_leading_eigenvector`, statement | `p = 2, n = 3, δ = 1`, `ν → ∞`; `ν → 0`, `nν² → ∞`; `ν = 1, δ = 1/2` | exponent `3·min(1, ν, ν²) = 3`, bound `c₁e^{-3c₂}` constant against failure `≳ ν⁻³`; exponent `nν²` matches the true rate; `min(1/2, 1/4) = min(1, 1/4, 1/4) = 1/4` | holds | none |
| 8.2, reduction to `δ ≤ √2`, `c₀√(…) < √2` | unit `θ̂`, `θ*`, `ρ = ⟪θ̂, θ*⟫ ≥ 0` | `‖θ̂ - θ*‖² = 2 - 2ρ ≤ 2`; then `√(p/(nν))` and `√(p/n)/ν` are both `≤ √2/c₀` | holds | none |
| 8.2, `‖P‖ ≤ ν/4` | `‖P‖ ≤ ν\|a\| + 2√ν‖v‖ + ‖W‖` at `δ ≤ √2` | `ν/32 + νδ/32 + νδ/128 ≤ 0.0865ν`; remainder `3C·(√2/c₀)ν ≤ 0.16ν` once `c₀ ≥ 27C` | holds | none |
| 8.2, residual and final bound | `(I - θ*θ*ᵀ)Pθ* = √ν(I - θ*θ*ᵀ)v + (I - θ*θ*ᵀ)Wθ*` | spike term vanishes; `(2√2/ν)(√ν‖v‖ + ‖W‖) ≤ 4√2·C√(((ν+1)/ν²)(p/n)) + (3·2√2/128)δ`, and `0.0663δ ≤ δ` | holds | none |
| 8.2, the three exponents | net of `5^p` points, `t = C'√(p/n) + s`, `p < n`; 1.3 with `t = √n·min(1, cνδ)` | `min(t, t²) ≥ (C'p/n + min(s, s²))/2`; `√ν δ ≥ min(1, νδ²)` in both cases `√ν δ ≥ 1`, `< 1`; `ε ≤ 2C` so `3max(ε, ε²) ≤ 3(1 + 2C)ε` | each dominates `c·n·min(1, νδ², ν²δ²)` | none |
| 8.2, Check "large `ν`" | Gaussian `ξ`, `ν ≥ 1`; hypothesis at `p = 2, n = 3`; angle `70°` | `P(\|ξ\| ≤ 1/ν) ≥ 2φ(1)/ν = 0.484/ν`, cube `0.113ν⁻³ ≥ 0.1ν⁻³`; `(ν+1)/ν²·(2/3) ≤ 1/128` for `ν ≥ 87`; `2 sin 35° = 1.147 > 1 + o(1)` | holds | none |
| 8.2, Check "small `ν`" | `p = 2`, `δ = 1` | hypothesis reads `nν² ≥ 256(ν + 1)`; printed exponent `n·min(√ν, ν) = nν`; ratio `exp(nν(c₂ - cν)) → ∞` | holds | none |
| 8.2, "the two exponents agree when `ν ≥ 1` and `√ν δ ≤ 1`" | both sides | printed `min(√ν δ, νδ²) = νδ²`; stated `min(1, νδ², ν²δ²) = νδ²` since `νδ² ≤ 1`, `ν²δ² ≥ νδ²` | holds | none |
| `designCol` Checks | `X = [[1,2],[3,4]]`; `X = [[2,1]]` | `X_1 = (2, 4)`; `(1 + 9)/2 = 5`; `2y/1 = 2y`; agrees with `Suggested.lean` line 93 | holds | none |
| 4.2 new Checks | `σ = 2`, `S₁ = ⊥`, `S₂ = ℝ`, `n = 1`; `n = 100`, `σ = 1` | `AIC₁ = Y²/4`, `AIC₂ = 0 + 2`, larger iff `Y² > 8`; `BIC₁ - BIC₂ = ‖P_{S₂}Y‖² - log 100 = 0`, smallest index | holds | none |
| 7.2, 7.4 new Checks | `[[2,-3],[0,5]]`; `Σ̂ = I₂`, `λ = 1`, `Θ = 2I₂` | pattern `[[1,1],[0,1]]`, transpose differs; `tr = 4`, `log det = log 4`, `F = 2.6137 > 2` | holds | none |
| 5.3 `*Needs:*` | pinned declaration | `etvDist_sq_le_two_mul_klDiv` at `TauCeti/InformationTheory/KullbackLeibler/Pinsker.lean:149` | present | none |

The rows for untouched statements stand as in the previous review, of `3d248d3`.

- Library declarations opened at the pin: 2 (`etvDist_sq_le_two_mul_klDiv`, above; `TauCeti.exists_finset_isCover_sphere`, `TauCeti/Analysis/Normed/Module/CoveringNumber.lean:168`).
- 8.2's inputs resolved in this README: 1.3 products (`isSubexponential_mul_sub`), 1.3 operator norm (`‖·‖ ≤ 3 max(ε, ε²)`, `ε = CK²(√p + t)/√n`, probability `1 - 2exp(-ct²)`), 8.1 (`√2‖(I - θ*θ*ᵀ)Pθ*‖/(ν - 2‖P‖)`).
- Elaboration of `Suggested.lean` at the pins: exit 0, 76 `declaration uses sorry` warnings and no other. `#check @spiked_leading_eigenvector` on a scratch copy: every binder of the README statement is in the type (`p < n`, the `1/128` condition, `0 < δ`, independence, proxies, isotropy); the bound reads `min 1 (min (ν * δ ^ 2) (ν ^ 2 * δ ^ 2))`.
- Gate at `fd782b0`: every check passes, build included. Dependency check: `depcheck: 256 roadmaps, 2429 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Pull request text against this head: the "Correction to a source" paragraph gives the exponent `n min(1, νδ², ν²δ²)` as the head does; "Parts of Layers 1–8" matches the README; 76 theorems counted; suppliers unchanged.
- Overlap check: the change adds no object and no supplier; read MathematicalStatisticsNonparametric, MathematicalStatisticsFoundations, RandomMatrices as in the previous review; nothing newly shared (owners as recorded there: soft thresholding Nonparametric 6.4, sparsity vocabulary Foundations 9.3, sub-exponential variables and Bernstein RandomMatrices §2.1).
- Source independence: changed passages only; 0 passages compared with 0 sources (the one source the changed passages cite, Wainwright2019, is not readable; the new route and Checks of 8.2 carry no source locator beyond Cor 8.7 and (8.21)); largest share Wainwright2019, 20 of about 74 locators; no layer added, removed or reordered, so the arrangement was not compared again.
- Remark, untouched text: 8.2's route says 1.3 is applied "at `ε ≤ 1`"; with `p < n` and `t ≤ √n` one has `ε ≤ 2C`, which gives the same bound.

## Not verifiable

- Wainwright2019, Cor 8.7, p. 245 (publisher page only; the sources service found no legal copy): whether the printed exponent is `n min(√ν δ, νδ²)`, as the README now says when it corrects it, and whether the printed condition is `((ν + 1)/ν²)(p/n) ≤ 1/128` or its square root.
- Wainwright2019, (8.21), p. 246: the printed decomposition of `Σ̂ - Σ`; the README's decomposition was recomputed from the model.

## Source issues

- none

## For the human reviewers

- **Not tested.** Wainwright2019 has the largest share of the locators (20 of about 74) and could not be read: the wording was not compared with it, and its table of contents only through the chapter numbers of the locators.
- **Not tested.** `README.md` 8.2 and the pull request description say that Wainwright's Cor 8.7 prints a false exponent. The exponent as reported is false (the Checks of 8.2); that the book prints it could not be read.
- **Licence.** Johnstone2017 is an unpublished book manuscript (draft of August 9, 2017), read from the author's page; `README.md` 5.1 and 5.3 cite it by equation and page.
- **Licence.** `README.md`, "Prior formalization", maps the layers to files of the author's lean-CKSD repository (Apache 2.0); `Suggested.lean` was not compared with that repository.
