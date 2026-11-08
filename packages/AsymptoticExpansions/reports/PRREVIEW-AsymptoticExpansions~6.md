# Review of AsymptoticExpansions (pull request #1857 at 1f39e59)

**Verdict:** accepted

This is an incremental re-review of the 2 changed lines since d4973cb. The folder diff is one line of `TauCetiRoadmap/AsymptoticExpansions/README.md` (line 156, the **Integrals** convention), and nothing outside the folder changed (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AsymptoticExpansions'` is empty). The two later commits on the branch are empty CI re-runs, and `Suggested.lean` is unchanged since d4973cb. No finding remains, and the gate passes. Source ids `dlmf21` … `dlmf29` are the DLMF section pages §2.1 … §2.9, as in the previous report.

## Previous findings

- R01 — repaired: README lines 155–157 now read "the shape of the `laplace` of Mathlib's Laplace-transform pull request (cited under [Exact supplier contracts](#from-mathlib))". This is the requested wording. The number now appears only in the link at line 246, and the gate reports `prnum=0`.

## Verified sound

**The changed passage (README lines 155–161).**
- The anchor `#from-mathlib` points to the only `### From Mathlib` heading (line 226), which is a subsection of `## Exact supplier contracts` (line 179). That subsection's bullet at lines 246–251 cites the Laplace-transform pull request as a link and states `laplace f s = ∫ t, Complex.exp ((−s) * t) • f t ∂(volume.restrict (Ioi 0))`. The convention's `∫ t in Ioi 0, cexp (−(z * t)) • q t` is the same integral: `∫ t in Ioi 0` is notation for integration against `volume.restrict (Ioi 0)`, and `(−z) * t = −(z * t)` holds by `neg_mul`.
- "Pull request" is still accurate at the pin. A grep of the pinned Mathlib (1b1ccf4b) for `LaplaceConvergent`, `HasLaplace` and `def laplace` finds nothing; its only "Laplace" hit is a Widder bibliography line in `Analysis/Calculus/AbsolutelyMonotone.lean` line 44. Tau Ceti (2fd255d9) has no `laplace` definition either. Its `Analysis/Complex/LaplaceTransform.lean` holds the seven theorems at lines 46–168, three of which are cited at README lines 212–218.
- What depends on the passage is consistent with it:
  - The sentence "integrability of `t ↦ e^{−σt} q t` on `(0, ∞)` for some real `σ`" is the `hint` hypothesis of `hasAsymptoticExpansion_laplace_sector` (`Suggested.lean` line 156).
  - Every Laplace integral in `Suggested.lean` (lines 149, 161, 167, 246, 272–285) has the stated shape. The amplitudes are complex-valued, so `•` and `*` are the same operation.
  - The exclusion of conditionally convergent Laplace integrals (README lines 100–104) is unchanged and still matches.

**Gate and dependencies.**
- The worker's gate at 1f39e59 passes every check (`build=0`, `prnum=0`).
- My own gate run gives the same text-scanner results, except for `depcheck: NOT IN ORDER: AsymptoticExpansions (insert it after its last supplier)`. That is the not-yet-inserted case under the board's own merge order, which the brief says is not a finding.
- `gate --depcheck … --order merge-order-candidate.txt --movable` prints `depcheck: 238 roadmaps, 2343 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. In the candidate order, ZerosOfLFunctions is at line 48 and this roadmap at line 396.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.CA"`), and no stray file.
- No locator in the README is flagged as unverified: a grep for unverified, uncertified, unchecked and unread finds nothing.

**Elaboration.**
- `lake env lean TauCetiRoadmap/AsymptoticExpansions/Suggested.lean` exits 0 in 35 s with 39 warnings, all `declaration uses sorry`, and no other warning or error.
- The file has 13 definitions with real bodies and 39 theorems, and no `set_option`, `lemma`, `#eval`, `#print` or `#synth`.
- The imports are `Mathlib`, `TauCeti.Analysis.Complex.Laurent.Basic` and `TauCeti.Analysis.Contour.Residue.Basic`. Both Tau Ceti oleans are present at the pin.

**`#check @name` sweep.** All 52 `#check` lines in one scratch file (the worker's signature check) elaborate with exit 0 and no error. The output matches `signatures.md`, and no section binder is lost. The file did not change, so the previous comparison with the README stands.

**Padding probe, carried forward.** The previous report tried all 39 theorems with `first | rfl | (simp; done) | infer_instance | (norm_num; done)` and none closed. The file is unchanged since then.

**Library declarations opened at the pin this round.** `Complex.integral_cpow_mul_exp_neg_mul_Ioi` is the real-rate case cited at 4.1. The Tau Ceti theorems in `Analysis/Complex/LaplaceTransform.lean` at lines 46, 94, 113, 119, 130, 148 and 168 include `TauCeti.differentiable_intervalIntegral_mul_cexp_neg_mul`, `TauCeti.integrableOn_mul_cexp_neg_mul` and `TauCeti.differentiableOn_integral_mul_cexp_neg_mul`, as cited at README lines 212–218. The previous report's list of 40 declarations is unchanged.

**Overlaps and ownership.**
- `overlaps.md` reports no other open pull request changing this roadmap, no dropped id this roadmap cites, and no id that only an open revision defines.
- The closest roadmaps by vocabulary are SpecialFunctionsAiry, SpecialFunctionsBessel, SpecialFunctionsParabolicCylinder, SpecialFunctionsConfluent and SpecialFunctionsEiLiErfIncompleteGamma, all of which consume this roadmap.
- `citations.md` finds no cross-roadmap citation unresolved. It lists two Lean names, `Asymptotics.IsAsymptoticScale` and `Asymptotics.HasAsymptoticExpansion` (README lines 1577–1578). These are this roadmap's own notions, declared in `Suggested.lean` lines 42 and 47.
- The change adds no object, so the previous ownership audit stands.

**Remark on untouched text** (not a finding, no change requested): README line 250 says that adopting Mathlib's `laplace` "is a rewrite by definition". Strictly, it takes unfolding `laplace` plus `neg_mul`, because `−(z * t)` and `(−z) * t` are not syntactically equal.

**Adversarial table.** Rows marked (r3) are carried forward from the previous report (PRREVIEW-AsymptoticExpansions r3, at d4973cb) for statements the diff leaves untouched. Rows marked (r6) are computed in this review, for the changed convention and for sampled targets the r3 table did not cover.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| (r6) **Integrals** convention, README 155–161, and its consumer `hint` of 4.2 | `q = 1`, `z = 2`; `q = 1`, `σ`; `q = e^{t²}`; `q = sin t / t`; `(−s)t` against `−(st)` at `s = 2`, `t = 1` | `∫₀^∞ e^{−2t}dt = ½ = 1/z`; `e^{−σt}` integrable iff `σ > 0`, and then `|e^{−zt}| ≤ e^{−σt}` for `Re z ≥ σ`; `e^{−σt+t²}` integrable for no `σ` (excluded, as intended); `sin t/t` absolutely integrable against `e^{−σt}` only for `σ > 0` (the conditional case `σ = 0` is the stated exclusion); `−2 = −2` | consistent with lines 100–104 and 246–251 | none |
| (r6) 1.2 order-symbol Checks | `tanh z/z`; `e^{−z}` on `z = 1 + it`; closed sector; `sin(πn + 1/n)`; `e^z` | `tanh z/z → 1`; `|e^{−1−it}| = e^{−1}`, so not `o(1)` on the open half-plane; `|e^{−z}| ≤ e^{−|z| sin δ} → 0` on `|ph z| ≤ π/2 − δ`; `|(−1)ⁿ sin(1/n)| ≤ 1/|n|`; `(e^z − 1 − z)/z² → ½` | all hold | none |
| (r6) 4.1 `integral_cpow_mul_exp_neg_mul_Ioi_of_re_pos` | `s = 1`, `z = 1 + i`; `s = ½`, `z = 2`; `z = i`; `s = i` | `1/(1+i) = Γ(1)(1+i)^{−1}`; `∫t^{−1/2}e^{−2t} = √(π/2) = Γ(½)2^{−1/2}`; at `z = i`, `t^{−1/2}` is not Lebesgue-integrable, so the Bochner integral is `0 ≠ √π e^{−iπ/4}`; at `s = i`, `t^{i−1}` is not integrable at `0`, so the integral is `0 ≠ Γ(i)z^{−i}` | true; both hypotheses are needed | none |
| (r6) 4.3 `rayLaplace` Check and `hasAsymptoticExpansion_rayLaplace` | `q = t^{−1/2}`, `θ = 3π/4`, `ζ = log R − iπ`; `θ = −3π/4`, `ζ = log R + iπ` | `|Im ζ + θ| = π/4 < π/2`; `e^{ζ+iθ} = Re^{−iπ/4}`, real part `R/√2 > 0`; value `e^{iθ}e^{−iθ/2}Γ(½)(Re^{−iπ/4})^{−1/2} = e^{3iπ/8}e^{iπ/8}√(π/R) = i√(π/R)`; mirror case `−i√(π/R)`; and `Γ(½)e^{−ζ/2} = √π R^{−1/2}e^{±iπ/2}` in both cases | Check and θ-independence hold | none |
| (r6) 4.5 Haar | `Q = 1/(z−1) + 1/z²`, `F = 1/(z−1)`, `c = 2` | `|Q − F| = 1/(4 + τ²)` on `Re z = 2`, integral `π/2`; `q − f = t = o(e^{2t})`; `(Q − F)^{(j)} = (−1)^j(j+1)!z^{−j−2}` is integrable, and `t = o(t^{−m}e^{2t})` | true | none |
| (r6) 7.2 Checks and `norm_bleistein_remainder_le` | `F₀(0)`; `F₁` at `λ = 1`; `f = 1` with `N = 1, C = 0` and with `N = 0, C = 1` | `u = τ²/2` gives `F₀(0) = 2^{λ/2−1}Γ(λ/2)` (`√(π/2)` at `λ = 1`); `F₁ = [−e^{−τ²/2+yτ}]₀^∞ = 1`; `w = τ/√x` gives `∫e^{−x(w²/2−aw)}w^{λ−1}dw = x^{−λ/2}F₀(a√x)`, so remainder `0 ≤ 0` and `x^{−λ/2}F₀ ≤ x^{−λ/2}G₀` (with equality) | true; `λ > 0` is needed for integrability at `0` | none |
| (r6) 10.3 `regularSingular_solution` | `f = g = 0`; `f = 1/z, g = 0`; `g = −2/z²` | `Q = ρ(ρ−1)`: `ρ = 1`, `Q(1+s) = s(s+1) ≠ 0`, `a_s = 0`, `w = z`; `ρ = 0` is excluded by `hres` at `s = 1`, and the log form has `c = 0`, `w = 1`; `Q = ρ²`: `w = 1` and `log z`, Wronskian `1/z ≠ 0`; `Q = (ρ−2)(ρ+1)`: `w = z²`, and `ρ = −1` is excluded at `s = 3` (`z⁻¹` is the 2.7.6 solution with `c = 0`) | true; `hres` is exactly the needed exclusion | none |
| (r6) 11.2 uniqueness and its counterexample | `f = 1`, `g = 0` on `(0, 1)` and on `ℝ` | `Φ = 0`; on `(0,1)`, `ξ = x − c` is bounded and `(e^{x−c} + C sinh x)/e^{x−c} → 1`; on `ℝ`, `ξ → −∞` as `x → −∞`, and `Ae^x + Be^{−x} ∼ e^{x−c}` forces `B = 0`, `A = e^{−c}`; `w₁/w₄ = e^{x−c}/(e^{c−x} + Ce^x) → 0` | true | none |
| (r3) 1.1 Checks | `x⁻ⁿ` along `𝓝[>] 0`; `e^{−x}`; `ψ = 2φ` | ratio `x⁻¹ → ∞`, so not a scale; `e^{−x} = O(x^{−N})` for all `N`; `1 = 1·φ₀ = ½·ψ₀`, and `1·ψ₀ − 1 = 1 ≠ O(x⁻¹)` | all three hold | none |
| (r3) `HasAsymptoticExpansion.unique` | first index `m` with `a_m ≠ b_m` | `φ_m(b_m − a_m) = O(φ_{m+1}) = o(φ_m)`; on the frequent set `φ_m ≠ 0` this forces `b_m = a_m` | true | none |
| (r3) `hasAsymptoticExpansion_inv_pow_iff` | `X` bounded; `f = 1/(z − 1)` | filter `⊥`, both sides true; `zⁿ(f − ∑_{s<n} z^{−s}) → 1 = a_n` for `n ≥ 1`, `a₀ = 0` | true | none |
| (r3) `hasAsymptoticExpansion_of_hasSum` | `f = 1/(z − 1)`, `R = 1` | `∑_{s≥1} z^{−s} = 1/(z − 1)` for `|z| > 1`; remainder `z^{−N}/(1 − z⁻¹) = O(z^{−N})` | true | none |
| (r3) `formalCpow` Checks (1.4) | `r = 1`; `r + r′`; `P = 1 + X`; `ℓ ↦ ℓ + 2πi` | `binomialSeries 1 = 1 + X`; `subst` is a ring map; `subst X = id`; `C(e^{r(ℓ+2πi)}) = e^{2πir}C(e^{rℓ})` | all four hold | none |
| (r3) `laplaceCoeff` (5.4) | `ℓ = log‖p₀‖ + iψ₀` | `exp ℓ = p₀`, so `C(e^{−ℓ})P − 1` has zero constant term | consistent | none |
| (r3) `hasAsymptoticExpansion_laplace_contour` (5.4) | `γ(τ) = τ`, `p = t`, `q = 1`, `μ = λ = 1`, `[θ₁, θ₂] ⊂ (−π/2, π/2)` | `Re(e^{iθ}τ) = τ cos θ > 0`; value `e^{−ζ} = Γ(1)·1·e^{−ζ}` | true | none |
| (r3) same, branch rule | `p = t²` on `γ(τ) = τe^{iω}`, `ω = π/2`, `θ = 0` | `|θ + 2ω| = π > π/2` is excluded; `∫₀^∞ e^{+zτ²}i dτ` diverges | right hypothesis | none |
| (r3) 5.5 docstring claim | `p = t²`, `q = 1` through `0` | two halves with `ω = 0, π`, each `½Γ(½)z^{−1/2}`, sum `√(π/z)` | two 5.4 instances | none |
| (r3) `hasAsymptoticExpansion_stationaryPhase` (6.2(d)) | Fresnel `p = t²`, `q = 1` | tail `≤ 3/(2xT)` uniformly for `x ≥ x₀`; coefficient `½√(π/x)e^{iπ/4}` | true | none |
| (r3) `hasAsymptoticExpansion_fourier` (3.2) | `q = e^{−t}` | tail `≤ 2e^{−T}`; `1/(1 − ix) = ∑ i^{s+1}(−1)^s x^{−s−1}` | true | none |
| (r3) 3.2 Check | `q = sin t/t` | tail `≤ 2/((x − 1)T)` for `x ≥ 2`; `∫₁^∞|q′| = ∞` | DLMF hypothesis weaker, as stated | none |
| (r3) 3.5 | `f = e^{−t²}`, `q = 1` | `√π/(2x) = 𝓜f(1)x⁻¹` | agree | none |
| (r3) 8.2 residue theorem | `F = 1/(t(1 − t))`, `c = ½`, `d = −½` | `2π − 0 = 2π·Res₀` | true | none |
| (r3) 8.5 (2.5.44) | `h = 1/(1 + t)` | all `β_n` are positive integers, so the `log ζ` case of 2.5.43 applies | consistent | none |
| (r3) `exists_norm_Gamma_le` (8.6) | `x = ½`; `x = −½` | `|Γ(½+iy)|² = π/cosh πy ≤ 2πe^{−π|y|}`; `Γ(−½+iy) = Γ(½+iy)/(−½+iy)` | true | none |
| (r3) `integral_Gamma_mul_cpow_neg` (8.7) | `w = 1`; `w = i` | `2π/e`; at `w = i` the integrand grows like `√|y|`, so it is not integrable | `Re w > 0` needed | none |
| (r3) `mellinContOscTop` Checks; `oscTail_spec` at `w = 1` | `e^{iκt}(t⁻¹+t⁻²)`; `e^{iκt²}t⁻³` | `oscTail(z−2)`; `½oscTail((z−3)/2)`; no limit at `w = 1` | hold; `Re w < 1` needed | none |
| (r3) 9.3 | `f = t^{−α}` | Beta integral; `c₁ = 0` | agrees | none |
| (r3) 9.4 remainder order | `α < β`, `α > β` | `O(x^{−n−min(α,β)})` | agrees | none |
| (r3) `exists_volterra_solution` (10.1) | `K = 0`; Picard bound | `h = 0`; `PΦΨⁿ/n!` | true | none |
| (r3) `exists_rankOne_solution` (10.4) | `f = −1 + 2z⁻²`, `g = −z⁻² − 2z⁻³ + z⁻⁴` | `e^{1/z}`, `e^{z+1/z}` both solve it; `a_s = 1/s!` | true | none |
| (r3) 10.5 Fabry | `g₀ = f₀²/4` | `F₀ = 0`, `G₀ = 4g₁ − 2f₀f₁`, `G₁ = 0` | holds | none |
| (r3) 11.3, `exists_caseI_solution` (11.4) | `ψ = 0` | `A_s = 0`, `W = e^{uξ}`; differentiated line `O(u^{1−n})` | true | none |
| (r3) `exists_difference_solution` (12.1) | `w(n+2) − 3w(n+1) + 2w(n)` | `w = 2ⁿ`, `α = 0` | true | none |
| (r3) `sum_Icc_eq_eulerMaclaurin` (13.1) | `f = x⁴`, `[0, 1]`, `m = 2` | `1/5 + 1/2 + 1/3 − 1/30 = 1` | true | none |
| (r3) `sum_Icc_eq_abelPlana` (13.2) | `f = z²`, `n = 2` | `5 = 8/3 + 2 + 1/3` | true | none |
| (r3) `tendsto_sum_mul_log_sub` (13.3) | both constants | `0.24875` and `0.24876` | agree | none |
| (r3) `tendsto_circleLaurentCoeff_sub` (13.6) | `f = 1/(1−z) + 1/(2−z)`, `g = 1/(1−z)` | `f_n − g_n = 2^{−n−1}` (`n ≥ 0`), `0` otherwise | true | none |
| (r3) 7.1 sign of `a` | `α < 0`, `t = 0` | DLMF gives `w = 2a`, the README's signed root gives `0` | README right | source issue (r3) |

**Seeded sample.** None of the sampled targets falls in the changed passage. The rows above give computed values for each of them: 1.1, 1.2, 1.3, 3.2, 4.1, 4.3, 4.5, 5.4, 5.5, 7.2, 8.6, 9.4, 10.3, 10.5 and 11.2. Their DLMF locators were read in the r3 review (`dlmf23`, `dlmf24`, `dlmf25`, `dlmf26`, `dlmf27`, `dlmf28`), and the README text at those locators is unchanged since then.

## Not verifiable

- DLMF §2.10 (`dlmf210`): the cached file is the figure `2.10.F1.pdf`, image-only, and OCR is unavailable on this worker. It is listed in `scratch/needs-references.toml`. No changed passage depends on it, and §2.10 was read on the DLMF site in the r3 review.
- Olver's *Asymptotics and Special Functions*, Wong, Bleistein–Handelsman, Chester–Friedman–Ursell, Handelsman–Lew and Temme are paywalled and were not read. No changed passage cites them.
- The Mathlib pull requests linked at README lines 246–262 were not fetched. The changed line only refers to the first of them. Its absence from the pinned Mathlib was checked by grep, as above.

## Source issues

- none
