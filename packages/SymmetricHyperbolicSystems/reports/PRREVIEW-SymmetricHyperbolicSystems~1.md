# Review of SymmetricHyperbolicSystems (pull request #2246 at c626af6)

**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/Suggested.lean:118`: "`(hc : ∀ t x (ω : EuclideanSpace ℝ (Fin n)), ‖ω‖ ≤ 1 → ∀ ξ : Fin N → ℝ,`"

**Claim:** `open scoped ContDiff` (line 34) makes `ω` a notation token, so the binder does not parse, `eq_zero_of_isClassicalSolution_of_cone` is not declared, and the targeted build fails.

**Witness:** Gate and `lake env lean`: "118:17: unexpected token 'ω'; expected '_' or identifier". The cause is `Mathlib/Analysis/Calculus/ContDiff/FTaylorSeries.lean:118`, `scoped[ContDiff] notation3 "ω" => (⊤ : WithTop ℕ∞)`.

**Repair:** Rename the binder in lines 118–119: `(hc : ∀ t x (w : EuclideanSpace ℝ (Fin n)), ‖w‖ ≤ 1 → ∀ ξ : Fin N → ℝ, |ξ ⬝ᵥ ((∑ j, w j • S.A j t x) *ᵥ ξ)| ≤ c * (ξ ⬝ᵥ (S.A0 t x *ᵥ ξ)))`. Tested: with this change the file elaborates, and `sorry` is the only warning.

## R02 (P2) — §7.1 plans to prove a smooth square root that the pinned Tau Ceti already proves

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md:169–171`: "Section 7.1 follows the same route at every positive definite matrix and identifies the result with `CFC.sqrt`. No other Tau Ceti material is consumed". Also §7.1 (lines 659–694), summary line 20 and `Suggested.lean:312`.

**Claim:** Tau Ceti already proves that `CFC.sqrt` is `C^k` on positive definite matrices. The README's inverse-function-theorem route (spectral theorem, local inverse, identification with `CFC.sqrt`) reproves it, and the summary claims it as this roadmap's reusable material.

**Witness:** `TauCeti/Analysis/Matrix/Exponential/Log.lean:106` proves `Matrix.contDiffOn_sqrt : ContDiffOn 𝕜 k CFC.sqrt {P | P.PosDef}` for every `k : ℕ∞ω`; line 98 proves `Matrix.contDiffOn_rpow`. `contDiff_sqrt_comp` follows in six lines via `(Matrix.contDiffOn_sqrt (𝕜 := ℝ)).comp_contDiff` through `Matrix.ofLinearEquiv ℝ` (tested).

**Repair:**
- Under "From Tau Ceti", cite `Matrix.contDiffOn_sqrt` and `Matrix.contDiffOn_rpow` (`TauCeti/Analysis/Matrix/Exponential/Log.lean:106,98`), and drop `sqrtNearOne` as the model proof.
- Replace §7.1's first paragraph with: "The square root and `P ↦ P ^ (−1/2 : ℝ)` are `C^k` on the positive definite matrices for every `k` (Tau Ceti `Matrix.contDiffOn_sqrt`, `Matrix.contDiffOn_rpow`)."
- Keep the bounded-derivatives statement as §7.1's target. Its proof: the iterated derivatives are bounded on the compact set `{T symmetric : c ≤ T ≤ Λ}`, then apply `norm_iteratedFDeriv_comp_le`.
- Delete `contDiff_sqrt_comp` from `Suggested.lean`, or replace it with the bounded-derivatives statement.
- Remove "the smooth dependence of the positive square root … (§7.1)" from the summary's reusable material.
- Update the description's Layer 7 line to match.

## R03 (P2) — The §3.1 restriction bound fails in the max norm by a factor of `N`

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md:376–378`: "has `‖f ∘ gridPoint h‖²_h ≤ (2R + 2)ⁿ sup‖f‖²` for `0 < h ≤ 1`"

**Claim:** The Conventions (lines 54–57) make `‖·‖` on `Fin N → ℝ` the max norm, and `|v|² ≤ N‖v‖²`. The bound is therefore false for `N ≥ 2`. The Conventions' list of what constants depend on (lines 111–113) also omits `N`, which §5.1's `C_α` needs when it turns entrywise derivative bounds into quadratic-form bounds.

**Witness:** `n = 1`, `N = 3`, `R = 1`, `h = 1/100`, `f = (1,1,1)` on `[−1,1]` and `0` outside. Left side: `0.01 · 201 · 3 = 6.03`. Right side: `4 · 1 = 4`.

**Repair:** Write `‖f ∘ gridPoint h‖²_h ≤ (2R + 2)ⁿ sup_x |f x|²` with `|·|` the Euclidean norm (equivalently `N (2R + 2)ⁿ sup‖f‖²` in the max norm). Add "on `N`" to the Conventions' list of dependencies of constants.

## R04 (P3) — Energy conservation does not follow from the stated energy estimate

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md:335–336`: "`K = 0` and the energy `∫⟪A⁰u, u⟫` is conserved (apply the estimate forward and, by time reversal, backward)". Also lines 330–331: "energy conservation in both time directions".

**Claim:** The estimate keeps the factor `e^{(κ+1)t/λ}` even when `F = 0`. Applied forward and backward it gives `e^{−t/λ}E(0) ≤ E(t) ≤ e^{t/λ}E(0)`, not `E(t) = E(0)`.

**Witness:** `A⁰ = 1`, `Aʲ = 0`, `B = 0`, `F = 0`, `λ = 1`, `κ = 0`. Both inequalities allow `E(1) = 2E(0)`, since `2 ≤ e` and `1 ≤ 2e`.

**Repair:** Add to §2.3 the integrated energy identity: for a classical solution vanishing outside a bounded set, `∫⟪A⁰u,u⟫(t) − ∫⟪A⁰u,u⟫(0) = ∫₀ᵗ ∫ (⟪Ku,u⟫ + 2⟪F,u⟫) dx ds` (this is §2.1 integrated, with the divergence terms vanishing). Derive conservation from it when `K = 0` and `F = 0`, and cite it in the Check and in the time-reversal sentence.

## R05 (P3) — No target has a source locator

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md`, §1.1–§7.3. The only locator is in the summary (lines 9–10): "F. John, *Partial Differential Equations*, Ch. 5, §3 (a) and (b)".

**Claim:** None of the 15 sampled targets (1.1, 1.2, 2.3, 3.2, 3.3, 4.1, 4.2, 4.3, 5.1, 5.2, 6.1, 6.2, 6.3, 7.1, 7.2) has a locator. Friedrichs 1954, Lax 1954, Rauch 2012 and Courant–Friedrichs–Lewy 1928 are not cited at any claim.

**Witness:** Searching the README for `Thm|Theorem|Lemma|p\. ` matches only lines 9 and 741.

**Repair:** Put locators at the claims. For example:
- §4.2 CFL condition: "(Courant–Friedrichs–Lewy 1928, Part II §2, pp. 61–62)", which contains the domain-of-dependence argument.
- §2.2, §2.3 and Layers 4–6: John 1982, Ch. 5 §3 (a) and (b), with pages.
- The positive-weights lemma and existence: Friedrichs 1954, with section and page.
- §4.1: Lax 1954, with page.
- Delete any reference that is cited at no claim.

## R06 (P3) — §1.2 Check is false for `λ > 1`

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md:244–245`: "With `λ > 0` the predicate is satisfiable and not vacuous: `A⁰ = 1`, `Aʲ = 0`, `B = 0` satisfies it, and `A⁰ = 0` does not."

**Claim:** `A⁰ = 1` satisfies `IsSymmetricHyperbolic S λ` only for `0 < λ ≤ 1`.

**Witness:** `λ = 2`, `N = 1`, `ξ = 1`: the condition `2 · 1 ≤ 1` is false.

**Repair:** "`A⁰ = 1`, `Aʲ = 0`, `B = 0` is symmetric hyperbolic with constant `λ` exactly when `0 < λ ≤ 1` (test `ξ = e₁`, `N ≥ 1`); `A⁰ = 0` is not, for any `λ > 0`."

## R07 (P3) — Three definitions have fewer than three Checks

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md:434–437` (`interp`: 2 Checks), `467–470` (`friedrichsStep`, `friedrichs`: 2 Checks), `712–713` (`invSqrtA0`, `normalize`: 1 Check).

**Claim:** Each definition needs at least three discriminating Checks.

**Witness:** §3.3, §4.1 and §7.2 list 2, 2 and 1 `**Checks.**` bullets respectively.

**Repair:** Add these (values computed):
- §3.3: "`n = 2`, `v = δ₀`, `x = (h/2, h/2)`: `interp h v x = 1/4`; piecewise-linear interpolation on the two triangles of the cell gives `1/2` or `0`."
- §4.1: "`n = N = 1`, `A¹ = 0`, `B = 0`, `F = 0`, `v = δ₀`: `Q v = ½(δ₁ + δ₋₁)` and `‖Q v‖²_h = h/2`; without the averaging term the step returns `δ₀`."
- §7.2: "`n = N = 1`, `A⁰ = e^{2t}`, `A¹ = 0`, `B = 0`: `P = e^{−t}`, `B' = P A⁰ ∂ₜP = −1`, and `v = eᵗu` solves `∂ₜv − v = e^{−t}F`; the wrong model `B' = P B P` gives `0`."
- §7.2: "`A⁰ = λ·1` constant: `Aʲ' = Aʲ/λ` and `B' = B/λ`."

## R08 (P3) — The README is missing required sections, and a layer title differs from `Suggested.lean`

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md`: Layers 1–7 end with `### Dependencies` and have no `### Examples`; there is no `## Downstream consumers` before `## References` (line 736). `Suggested.lean:258`: "## Layer 6: existence and convergence for `A⁰ = 1`".

**Claim:** Every layer needs `### Examples` before `### Dependencies`, and the README needs `## Downstream consumers`. The Lean section comment must carry the README's layer title.

**Witness:** README line 589 reads "## Layer 6: passage to the limit for `A⁰ = 1`". The README's heading list contains no `Examples` or `Downstream consumers` heading.

**Repair:**
- Add `### Examples` to each layer, for example: Layer 2, transport and the one-dimensional wave system; Layer 4, Lax–Friedrichs; Layer 7, `A⁰ = diag(1,4)`.
- Add a `## Downstream consumers` section.
- Rename the Lean comment to `/-! ## Layer 6: passage to the limit for `A⁰ = 1` -/`.

## R09 (P3) — README and Lean disagree on the hypotheses of the energy estimate

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md:319`: "**Energy estimate.** If moreover `u` vanishes outside a bounded set" — compared with `Suggested.lean:143–155`.

**Claim:** "Moreover" carries over the uniqueness hypothesis "the `Aʲ` are bounded" (line 315), which `integral_dotProduct_A0_le` does not assume. The Lean assumes `hFc : ContinuousOn (uncurry F) (Icc 0 T ×ˢ univ)`, which the README does not state.

**Witness:** The elaborated `@integral_dotProduct_A0_le` has no bound on `S.A j`, and it does have `hFc`.

**Repair:** "**Energy estimate.** If `A⁰` and `Aʲ` are `C¹`, `B` is continuous, `F` is continuous on `[0,T] × ℝⁿ`, `u` vanishes outside a bounded set of `[0,T] × ℝⁿ` and … (no bound on the `Aʲ` is needed), then …"

## R10 (P3) — §2.1 *Needs:* line cites a product rule for the wrong kind of space

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md:274`: "*Needs:* §1.2; Mathlib's product rule for `inner`."

**Claim:** The identity is stated with `⬝ᵥ` on `Fin N → ℝ`, which carries the max norm and is not an inner product space, so `HasFDerivAt.inner` does not apply.

**Witness:** `Mathlib/Analysis/InnerProductSpace/Calculus.lean:99`, `HasFDerivAt.inner`, requires `[InnerProductSpace 𝕜 E]`, and `Fin N → ℝ` has no such instance.

**Repair:** "*Needs:* §1.2; Mathlib's `ContinuousLinearMap.hasFDerivAt_of_bilinear` (`Mathlib/Analysis/Calculus/FDeriv/Bilinear.lean:120`) applied to `dotProduct` and `mulVec`."

## R11 (P3) — §6.2's extension to `t < 0` uses `G` and `wᵢ` where they are undefined

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md:628–629`: "The extension has continuous partial derivatives `∂ₜ = G` and `∂ᵢ = wᵢ` on the open slab `(−∞, T + 1) × ℝⁿ`"

**Claim:** §6.1 gives `G` and `wᵢ` only on `[0, T+1]`. For `t < 0` the extension `u₀ + t G(0,·)` has `∂ₜ = G(0,·)` and `∂ᵢ = ∂ᵢu₀ + t ∂ᵢG(0,·)`.

**Witness:** `n = N = 1`, `A¹ = 1`, `B = F = 0`: `G(0,·) = −u₀'`, and at `t = −1` the extension has `∂ₓ = u₀' + u₀''`, while `w` at `t = −1` is undefined.

**Repair:** "For `t < 0` put `G(t,·) = G(0,·)` and `wᵢ(t,·) = ∂ᵢu₀ + t ∂ᵢG(0,·)`. Both are continuous across `t = 0` because `wᵢ(0,·) = ∂ᵢu₀`, and the extension has partial derivatives `∂ₜ = G` and `∂ᵢ = wᵢ` on `(−∞, T+1) × ℝⁿ`."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 `contDiffOn_one_of_hasDerivAt_single` | `f = x₁x₂`; `f = x₁x₂/(x₁²+x₂²)`; `ι = ∅` | `g = (x₂, x₁)`, `fderiv v = x₂v₁ + x₁v₂`; `∂₁f(0,x₂) = 1/x₂`, `f(t,t) = ½ ≠ f(0)`; `ι = ∅`: one-point domain | holds; continuity needed | none |
| §1.2 `IsSymmetricHyperbolic`, `apply`, `IsClassicalSolution` | transport; wave `n = 1`; Jordan block; `λ = 2`, `A⁰ = 1` | `−au₀' + au₀' = 0`; eigenvalues `±1`; `A⁰A¹ = [[0,a],[0,b]]` symmetric iff `a = 0`; `2 ≤ 1` false | Check false for `λ > 1` | R06 |
| §2.1 energy identity, `K = ∂ₜA⁰ + Σ∂ⱼAʲ − B − Bᵀ` | product rule recomputed; Jordan block, `u = (1, x)` | `−2⟪Bu,u⟫ = −⟪(B+Bᵀ)u,u⟫`; `∂ₓ⟪A¹u,u⟫ = 1` vs `2⟪A¹∂ₓu,u⟫ = 2` | holds; symmetry needed | R10 |
| §2.2 `eq_zero_of_isClassicalSolution_of_cone` | transport `a = 1`, `R = 1`, `supp u₀ = (−2,−1)`; `c = 1`; `c = ½`, `t = ½`; `n = 0` | `(t−2, t−1) ∩ (t−1, 1−t) = ∅`; `c = ½` not a speed, overlap `(−0.75, −0.5)`; `n = 0`: ODE uniqueness | holds; speed sharp | R01 (parse) |
| §2.3 `eqOn_of_isClassicalSolution` | `n = 2`, `M = 1`, `λ = 1`; `N = 0`; `M < 0` | speed `√n M/λ`: `|ω₁a₁ + ω₂a₂| ≤ √2`; `N = 0` trivial; `M < 0` forces `ξ = 0` | holds | none |
| §2.3 `integral_dotProduct_A0_le` | `B = −β·1`; `κ = 0`, `F = 0`; `u = 1` without the support hypothesis | `e^{2βt}E₀ ≤ e^{(2β+1)t}E₀`; bound `e^{t}E₀`, so no conservation; `∫` of a non-integrable function returns junk `0` | holds; Check fails | R04, R09 |
| §3.1 grid toolkit | `⟪D₊δ₀, δ₀⟫_h`; Leibniz with `a = j`, `v = δ₁`; restriction with `N = 3`, `R = 1`, `h = 0.01` | `−1 = −1`; `h⁻¹ = h⁻¹` (wrong shift gives `0`); `6.03` vs `4` | restriction bound fails | R03 |
| §3.2 `dotProduct_self_le_sum_gridNormSq` | `n = 1`, `δ₀`; `n = 2`, `δ₀`; `n = 0` | `1 ≤ h + 2/h`; `1 ≤ h² + 4 + 4/h²`; `|v|² ≤ |v|²` | holds | none |
| §3.3 `interp`, `norm_interp_sub_le` | `n = 1`, `δ₀`; `n = 2`, `v = j₁j₂`; `n = 0`; `x = (h/2, h/2)` | hat function, Lipschitz constant `1/h`; `x₁x₂/h²`; `x = y` gives `0 ≤ 0`; value `¼` | holds | R07 |
| §4.1 `friedrichsStep`, `friedrichs` | Lax–Friedrichs `n = 1`; `μa = 1`; Taylor expansion | `½(1−μa)u_{j+1} + ½(1+μa)u_{j−1}`; `u_{j−1}`, exact; `Qv = v − kΣAⁱ∂ᵢv + k(F − Bv) + O(h²)` | holds | R07 |
| §4.2 `dotProduct_sum_mulVec_le` | weights `2, −1`, `v = (1, −1)`; `W = (½, ½)`, `v = (1, 3)` | `9 > 1` (positivity needed); `4 ≤ 5` | holds | none |
| §4.2 `sqrt_gridNormSq_friedrichsStep_le` | `L = M = 0`; `n = 1`, `A = 0`, `v = δ₀`; `n = 0` (junk `(2·0)⁻¹ = 0`) | `‖Qv‖ ≤ ‖v‖`; `h/2 ≤ h`; `Qv = k(F − Bv)` still within the bound | holds | none |
| §4.3 stability | discrete Grönwall | `aₘ ≤ (1+kc)ᵐa₀ + kΣ(1+kc)^{m−1−l}f_l ≤ e^{cmk}(a₀ + kΣf_l)` | holds | none |
| §5.1 difference identity | `n = 1`, `α = 1`, `A(x) = x` | `D₊(A D₀v)(j) = A(j+1) D₀D₊v(j) + 1·D₀v(j)` | holds | none |
| §5.2 uniform bounds | constant coefficients; `r = 0` | `‖D^α uᵐ‖ ≤ ‖D^α u⁰‖`; `r = 0` still needs the Lipschitz constant `L`, so order `max(r,1)` | holds; constants depend on `N` | R03 |
| §6.1 compactness | support bookkeeping, `h ≤ 1` | `R + mh + 2h ≤ R + (T+1)/μ + 2 = R₁` | holds | none |
| §6.2 `exists_isClassicalSolution_of_A0_eq_one` | transport `a = 1`, `μ = 1`; extension to `t = −1` | exact at grid points; `∂ₓ = u₀' + u₀''`, while `w` is undefined there | holds; gap in the proof route | R11 |
| §6.3 `tendsto_friedrichs` | `T = 0`; `T < 0`; `k = μh` | `m = 0` only, error `0`; vacuous; local error `O(h²)`, global `O(h)` | holds | none |
| §7.1 `contDiff_sqrt_comp` | `[[2,1],[1,2]]`; `N = 1`, `A = t²`; pinned Tau Ceti | `(½[[√3+1, √3−1],[√3−1, √3+1]])² = [[2,1],[1,2]]`; `|t|` not `C¹`; six-line proof from `Matrix.contDiffOn_sqrt` | holds; duplicates the pin | R02 |
| §7.2 `normalize`, `isClassicalSolution_normalize_iff` | `A⁰ = diag(1,4)`; `N = 1`, `A⁰ = e^{2t}` | `A¹' = diag(1, ¼)`, `B' = 0`, least speed `1` in both systems; `B' = −1`, `∂ₜv − v = e^{−t}F` | holds | R07 |
| §7.3 `exists_isClassicalSolution` | `A⁰ = diag(1,4)`, `A¹ = 1`, `supp u₀ ⊆ [−1,1]` | supports `[t−1, t+1]` and `[t/4−1, t/4+1]`, inside `|x| ≤ 1 + t` | holds | none |

- Gate: `build=2 FAIL` (R01); the other 27 checks report 0. `lake env lean` on a copy with `ω → w`: 0 errors, 13 `sorry` warnings.
- Binders: `#check @` of all 29 declarations elaborated in one file. No section binder is lost, and the README matches every elaborated type except R09.
- Padding probe: on all 13 theorems, `first | rfl | simp | infer_instance | positivity | aesop` closes none, and neither does `exact?`.
- Library declarations: 33 Mathlib names in the supplier contracts elaborate at `1b1ccf4`, and all 24 file:line locators match. Tau Ceti `SquareRoot.lean:80,88` match at `2fd255d`. `Log.lean:98,106` were found (R02).
- Dependencies: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`. `git diff --stat origin/main...HEAD` shows nothing outside the folder.
- Cross-roadmap citations resolved: PDE Layer 8 (Strichartz, on main) and OneParameterSemigroups (Completed, on main). Ownership against the 437 open pull requests was checked by `roadmaps grep`.
- Overlap check: read PDE, YangMillsConnectionsAndCaloricGauge and QuaternionicAnalysis, plus RelativisticQuantumFieldTheory §1.2 and OptimalTransport §6B; nothing shared. RelativisticQuantumFieldTheory §1.2 owns only the Klein–Gordon Cauchy theory.
- Sources: CFL1928 (GDZ open scan): Part II §2, pp. 61–62 (CFL1928 lines 1197–1237) gives the domain-of-dependence condition. No README locator exists to check against it (R05).

## Not verifiable

- John1982 (F. John, *Partial Differential Equations*, 4th ed., Springer): DOI prefix 10.1007 is paywalled; the summary's locator "Ch. 5, §3 (a), (b)" is unchecked.
- Friedrichs1954 (Comm. Pure Appl. Math. 7, 345–392): Wiley returned HTTP 403, and no open copy was found.
- Lax1954 (Comm. Pure Appl. Math. 7, 159–193): Wiley returned HTTP 403, and no open copy was found.
- Rauch2012 (AMS Graduate Studies in Mathematics 133): no open copy was found.

## Source issues

- none
