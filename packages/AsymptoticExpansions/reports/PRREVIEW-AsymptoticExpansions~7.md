# Review of AsymptoticExpansions (pull request #2113 at 3d73056)

**Verdict:** accepted

This is a full review of `TauCetiRoadmap/AsymptoticExpansions/` at 3d73056. Pull request #1857 was squash-merged into main as cbe6674f. Against main, this folder's diff is two hunks of `README.md`:
- the sign of `q_s` in the Layer 3 example (lines 528–530);
- the choice of `δ` in 8.5 (lines 1037–1041).

`Suggested.lean` and `metadata.toml` are unchanged. Nothing outside the folder changed: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AsymptoticExpansions'` is empty.

Both corrections are right and agree with DLMF. I reviewed the whole roadmap again (sample, adversarial pass, Lean, suppliers, ownership) and found nothing to change.

## Previous findings

The previous review (r6, of #1857 at 1f39e59) had no open finding. Its one carried finding, R01 of r5 (a pull-request number in the **Integrals** convention), was repaired then. That passage (README 155–157) is unchanged, and the gate still reports `prnum=0`.

## Verified sound

### The two corrections

**Layer 3 example (README 528–530): repaired correctly.**
- **What DLMF prints.** 2.11.3 gives `q₁ = −2t/(t²+1)²`, `q₂ = 24(t³ − t)/(t²+1)⁴` and `q₃ = −240(3t⁵ − 10t³ + 3t)/(t²+1)⁶`. I read §2.11(i) on the DLMF site, because the cached copy is the figure 2.11.F1.pdf.
- **The derivatives.** From `q = (1+t²)⁻¹ = (2i)⁻¹((t−i)⁻¹ − (t+i)⁻¹)`:
  - `q′ = −2t/(1+t²)²`;
  - `q‴ = 24t(1 − t²)/(1+t²)⁴`;
  - `q⁽⁵⁾ = −240(3t⁵ − 10t³ + 3t)/(1+t²)⁶`.
- **The match.** So `q₁ = q′`, `q₂ = −q‴` and `q₃ = q⁽⁵⁾`, which is exactly the new `(−1)^{s+1} q^{(2s−1)}`. The old unsigned form fails at `s = 2`: `q‴(2) = −144/625`, while `q₂(2) = +144/625`.
- **Independent derivation from 3.2.**
  - The endpoint expansion gives `∫₀^π e^{imt} q dt ∼ Σ_s (i/m)^{s+1} (q^{(s)}(0) − (−1)^m q^{(s)}(π))`.
  - `q` is even, so its odd derivatives vanish at `0`.
  - The real part of `(i/m)^{2k}` is `(−1)^k m^{−2k}`.
  - Together these give `(−1)^m Σ_k (−1)^{k+1} q^{(2k−1)}(π) m^{−2k}`, which is 2.11.2 with the new `q_s`.
- **Numerically** (Simpson's rule, 2·10⁵ panels):
  - at `m = 40`, the integral is `−3.32191183729·10⁻⁵`;
  - three terms of the corrected series miss it by `3.5·10⁻¹⁴`;
  - two terms with the old signs miss it by `3.7·10⁻⁸`, which is the size of the wrong `2q₂(π)m⁻⁴`;
  - at `m = 10` both miss by `7.1·10⁻⁵ = (π/2)e^{−10}`. This is the exponentially small contribution of the pole at `t = i`, which no power of `m⁻¹` captures.

**8.5 (README 1035–1041): repaired correctly.**
- **What DLMF says.** DLMF 2.5.43 (`dlmf25` lines 1634–1682) has two residue sums:
  - one over `Re β₀ ≤ Re z ≤ 1` for `𝓜h₂`;
  - one over `1 < Re z < l` for `𝓜h`.

  The integral is taken on `Re z = l − δ`, with `l ≥ 2` an arbitrary integer and `δ` "an arbitrary small positive constant" (line 1680).
- **Why the old text overclaimed.** A pole with `l − δ ≤ Re z < l` is counted in the second sum but not crossed by the shift, so "every `δ ∈ (0, 1)`" was too strong.
- **Why the new text is right.** The new condition (no pole on the line, every pole of the sums strictly to its left) is exactly what the residue theorem needs.
  - For `δ < 1` the line lies in `(l − 1, l) ⊂ (1, l)`, so it misses the poles `1, 2, …` of `Γ(1 − z)`.
  - Only finitely many `β_n` have `Re β_n < l`, because `Re β_n → ∞` is assumed (README 1036). So admissible `δ` exist, and every sufficiently small `δ` is admissible.
- **The pull request's counterexample holds.**
  - Take `h = t^{−3/2}` on `(1, ∞)` and `h = 0` on `(0, 1]`. It satisfies 2.5.18 with `κ = 0`, `β₀ = 3/2`, `b₀ = 1`, and 2.5.20 for every `c`.
  - Its transform is `𝓜h(z) = 1/(3/2 − z)`.
  - For `l = 2` and `δ = ½`, the line `Re z = 3/2` passes through the pole, where `y ↦ 1/(−iy)` is not integrable.
- **The repaired statement on this `h`.** With admissible `δ` it gives `𝓛h(ζ) = 2 − 2√π ζ^{1/2} + 2ζ + O(ζ²)`:
  - the residue at `3/2` is `Γ(−½)ζ^{1/2}`;
  - `𝓜h(1) = 2` and `𝓜h(2) = −2`.

  Numerically:
  - `𝓛h(0.01) = 1.6654760` against the three terms' `1.6655092`. The difference `−3.33·10⁻⁵` is the next term `(−ζ)²/2 · 𝓜h(3) = −ζ²/3`.
  - At `ζ = 0.001` the difference is `−3.33·10⁻⁷`.
- **What else depends on it.** The README's 2.5.44 form (truncations `Re β_n < L + 1` and `n < L`, remainder `O(ζ^L)`) is unaffected. No roadmap on main or in an open pull request cites 8.5, 2.5.43–2.5.44 or the 2.11 example (`roadmaps grep`), so the change breaks no consumer.

### Seeded sample: the 15 targets and their locators

The package `sources.toml` records only `dlmf28` and `dlmf210`. I fetched the other DLMF Chapter 2 section pages (DLMF 1.2.8, release 2026-09-15) through the sources service into a scratch manifest, under the ids `dlmf21` … `dlmf29` that earlier reports used. The line numbers below refer to those extractions.

| Target | README locator | Source at that locator | Result |
|---|---|---|---|
| 1.6 Borel–Ritt | 2.1.17; §2.1 in the scope list, §2.1(iii) in the Lean docstring | `dlmf21` lines 628–642: for any coefficients there are infinitely many analytic functions with the expansion in any unbounded sector of finite angle; 2.1.17 gives the null expansions in `\|ph z\| ≤ π/2 − δ` | supports `θ ∈ (0, π)`; sectors are kept inside the slit plane because `f : ℂ → ℂ` |
| 2.1 inversion | 2.2.1–2.2.2 | `dlmf22` lines 49–83 | matches; the README asks for continuity on `[a, ∞)`, which the root claim for every `y > f(a)` needs (Source issues) |
| 3.2 Fourier endpoints | 2.3.4–2.3.6 | `dlmf23` lines 174–251: finite `[a, b]`; `b = ∞` under uniform convergence of each `∫ e^{ixt} q^{(s)}`; remainder `x^{−n} 𝒱_{a,b}(q^{(n−1)}) = x^{−n} ∫\|q^{(n)}\|` | matches |
| 3.3 Watson | 2.3.7–2.3.8; Bleistein–Handelsman §4.1 | `dlmf23` lines 318–365; line 404 points to Bleistein–Handelsman §4.1 for general powers | matches; absolute convergence is the stated exclusion (README 100–104) |
| 3.5 general kernels | 2.3.10–2.3.12 | `dlmf23` lines 450–551: `f`, `q` piecewise continuous, `\|f\| ≤ A e^{−at^κ}`, `q = O(e^{bt^κ})` | the README weakens piecewise continuity to local integrability, and the proof survives (table row) |
| 4.3 rotation | §2.4(i), second paragraph | `dlmf24` lines 120–128 | matches; the substrip `−α₂ − π/2 < Im ζ < −α₁ + π/2` is DLMF's sector in logarithmic coordinates |
| 5.1 coefficients | 2.3.15–2.3.17 | `dlmf23` lines 713–781 | `b₀`, `b₁`, `b₂` recomputed from `laplaceCoeff` (table row) |
| 5.4 contour | 2.4.10–2.4.13 | `dlmf24` lines 443–575: (a) `Re λ > 0`, `μ > 0`, `p₀ ≠ 0`; (b) `θ₂ − θ₁ < π`, uniform absolute convergence; (c) positivity bounded away from `0`; branch rule 2.4.13 | (b), (c) and 2.4.13 are `hconv`, `hpos`, `haway` and `hbranch` |
| 6.1 Fourier–Watson | 2.3.20 | `dlmf23` lines 883–924 | matches; complex exponents are covered by `∫₀^∞ e^{ixt} t^{α−1} dt = Γ(α) e^{iπα/2} x^{−α}` (`0 < Re α < 1`) and integration by parts |
| 8.5 small parameter | 2.5.37–2.5.44 | `dlmf25` lines 1408–1692 | see above |
| 8.7 Cahen–Mellin | none; the route goes through `mellinInv_mellin_eq` and `Complex.GammaIntegral_eq_mellin` | — | checked by computation (table row) |
| 10.1 Volterra | Olver (1997), Ch. 6 §10 | paywalled | Not verifiable; checked by computation |
| 10.4 rank one | 2.7.7–2.7.18 | `dlmf27` lines 321–693 | `hμ` and `ha` of `exists_rankOne_solution` are 2.7.10–2.7.11 term for term; sectors 2.7.15–2.7.16; DLMF's "one of `f₀, g₀, g₁` nonzero" follows from `λ₁ ≠ λ₂` |
| 12.1 difference eqs | 2.9.3–2.9.8 | `dlmf29` lines 135–318 | `hα` and `ha` of `exists_difference_solution` are 2.9.6–2.9.7 term for term (`range (r + 2)` is `q = 0, …, r + 1`); recessive/dominant clause at lines 311–318 |
| 13.5 entire functions | 2.10.19–2.10.24 | DLMF §2.10(iii), read on the site (the cached `dlmf210` is the figure 2.10.F1.pdf) | `exp(3x^{1/3})/(2π√3 x^{1/3})` matches; DLMF's route uses 5.11.7, the exponential of ZerosOfLFunctions §1.2's 5.11.1 |

### Adversarial table (all rows computed in this review)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Layer 3 example, `q_s` (changed) | `s = 1, 2, 3`; `t = 2`; `m = 10, 20, 40` | `q₁ = q′`, `q₂ = −q‴`, `q₃ = q⁽⁵⁾`; `q‴(2) = −0.2304`, `q₂(2) = 0.2304`; errors `7.1·10⁻⁵` (the `e^{−m}` term), `3.2·10⁻⁹`, `3.5·10⁻¹⁴` (old signs: `3.7·10⁻⁸` at `m = 40`) | new form true, old false | none |
| 8.5 choice of `δ` (changed) | `h = t^{−3/2}·1_{t>1}`, `l = 2`, `δ = ½` and `δ = ¼`; `ζ = 10⁻², 10⁻³` | pole at `3/2` on the old line; with `δ = ¼`, residue `−2√π ζ^{1/2}`; `𝓛h(0.01) − (2 − 0.35449 + 0.02) = −3.33·10⁻⁵ = −ζ²/3` | new form true, old ill-posed | none |
| 1.1 `HasAsymptoticExpansion.unique` | first `m` with `a_m ≠ b_m`; `X = {c}` | `φ_m(b_m − a_m) = O(φ_{m+1}) = o(φ_m)`, and frequent `φ_m ≠ 0` forces equality; on `𝓝[{c}] c` every `(z−c)ⁿ`, `n ≥ 1`, vanishes, so `hne` is needed | true | none |
| 1.3 `hasAsymptoticExpansion_inv_pow_iff` | `X` bounded; `f = 1/(z−1)` | filter `⊥`, both sides true; `z⁰f → 0 = a₀`, `zⁿ(f − Σ_{1≤s<n} z^{−s}) = z/(z−1) → 1 = a_n`; `⇒` uses `N = n + 1` and `zⁿ O(z^{−n−1}) → 0` | true | none |
| 1.3 `hasAsymptoticExpansion_of_hasSum` | `f = 1/(z−1)`, `R = 1` | tail `z^{−N}/(1 − z⁻¹) = O(z^{−N})` | true | none |
| 1.4 `pow_mul`, `pow_inv` | `f = g = 1/(1−w)`; `f = 1 − w` | `[Xᵏ](Σ Xʲ)² = k + 1`, the coefficients of `(1−w)⁻²`; `(1 − X)⁻¹ = Σ Xᵏ` | true | none |
| 1.4 `pow_subst` | `H = e^σ`, `σ∘y = w + w²` | `e^{w+w²} = 1 + w + (3/2)w² + …`; `exp.subst (X + X²) = 1 + X + (3/2)X² + …` | true | none |
| 1.4 `pow_substInv` | `H = σ + σ²`, `H(y) = w` | root `(−1 + √(1+4w))/2 = w − w² + 2w³ − 5w⁴ + …`, the inverse of `X + X²`; the root tending to `−1` is excluded by `hσ`, `hy` | true; branch rule needed | none |
| 1.4 `formalCpow` | pin `binomialSeries`; `P = 1 + X`; `ℓ ↦ ℓ + 2πi`, `r = ½` | `binomialSeries ℂ r = mk (Ring.choose r n • 1)`; `formalCpow 0 r (1 + X) = binomialSeries ℂ r`; factor `e^{πi} = −1` | Checks hold | none |
| 1.5 `isBigO_deriv_of_isBigO_sector` | `f = z^ν`; `θ′ < 0` | `\|f′\| = \|ν\| \|z\|^{ν−1}`; empty closed subsector, conclusion trivial | true | none |
| 1.6 `exists_hasAsymptoticExpansion_sector` | boundary rays `\|arg z\| = θ` | build `f` on `\|arg z\| < θ″` with `θ < θ″ < π`; its closed subsector `\|arg z\| ≤ θ` contains the rays | true | none |
| 2.1 inversion | `f = x + log x` on `[1, ∞)` | root for `y > 1`; `x(y) = y − log y + o(1) ∼ y` | true | none |
| 2.3 `reversionCoeff` | `f = x + f₀ + f₁/x` | resubstitution `x = y − f₀ − f₁/y − f₀f₁/y² + O(y⁻³)`; `½[X³](1 + f₀X + f₁X²)² = f₀f₁` | Checks hold | none |
| 3.2 | `q = e^{−t}`, `[0, ∞)` | `Σ (−1)^s (i/x)^{s+1} = i/(x + i) = 1/(1 − ix)`, the exact value | true | none |
| 3.3 / 4.2 | `q = 1/(1+t)`; `q = t^{−1/2}` | `Σ (−1)^s s! x^{−s−1}`; `√π z^{−1/2}` exact | true | none |
| 3.5 | `f = e^{−t²}`, `q = 1`, `κ = 2`; local integrability only | `√π/(2x) = 𝓜f(1) x⁻¹`; remainder `≤ C x^{−Re α_N} ∫\|f(u)\| u^{Re α_N − 1}` near `0`, exponentially small on `[ε, ∞)` once `a x^κ > b` | true | none |
| 4.1 `integral_cpow_mul_exp_neg_mul_Ioi_of_re_pos` | `s = 1`, `z = 1 + i`; `z = i` | `(1+i)⁻¹`; at `z = i`, `t^{−1/2}e^{−it}` is not integrable (Bochner value `0 ≠ √π e^{−iπ/4}`) | true; `Re z > 0` needed | none |
| 4.3 `rayLaplace` | `q = t^{−1/2}`, `θ ∈ (−π, π)`; `\|θ − θ′\| ≥ π` | `e^{iθ} e^{−iθ/2} Γ(½) e^{−(ζ+iθ)/2} = Γ(½) e^{−ζ/2}`, because the principal log of `e^{ζ+iθ}` is `ζ + iθ` on `S_θ`; the strips are disjoint, so `EqOn` is vacuous there | Check holds | none |
| 4.4 | `Q = z^{−α}` | inverse `t^{α−1}/Γ(α)`, `c₀ = 1/Γ(α)` | true | none |
| 5.1 `laplaceCoeff` | `[X^s] Q P^{−(λ+s)/μ}`, `s = 0, 1, 2` | `q₀/(μp₀^{λ/μ})`; `p₀^{−(λ+1)/μ}(q₁/μ − (λ+1)p₁q₀/(μ²p₀))`; `p₀^{−(λ+2)/μ}(q₂/μ − (λ+2)(p₁q₁ + p₂q₀)/(μ²p₀) + (λ+2)(λ+μ+2)p₁²q₀/(2μ³p₀²))`, all equal to 2.3.17 | true | none |
| 5.2 `hasAsymptoticExpansion_laplace_method` | `p = t²`, `q = 1` | `½√(π/x) = Γ(½)·½·x^{−1/2}` | true | none |
| 5.4 `hasAsymptoticExpansion_laplace_contour` | `p = t²`, `q = 1`, `θ = 0`; `ψ = π/8`; `ψ = π` | `ψ₀ = 0`, `b₀ = ½`, `I = ½√(π/z)`; `ps₀ = 1`, `ψ₀ = −2π`, `b₀ = ½e^{πi} = −½`, `I = −½√(π/z)` | branch rule correct | none |
| 6.1 `hasAsymptoticExpansion_fourier` | `q = e^{−t}` | `Σ i^{s+1}(−1)^s x^{−s−1} = −Σ (ix)^{−s−1}`, the expansion of `(1 − ix)⁻¹` | true | none |
| 6.2 `isBigO_stationaryPhase_remainder` | `p = t` on `[0, 1]`, `q = 1` | `i/x − e^{ix}(i/x) = (e^{ix} − 1)/(ix)` exactly | true | none |
| 6.2 `hasAsymptoticExpansion_stationaryPhase` | Fresnel, `p = t²` | `P₀ = 1/(2t) → 0`; `½√(π/x) e^{iπ/4}`; `b_s = 0` for `s ≥ 1` | true | none |
| 7.2 `bleisteinF` Checks | `F₀(0)`; `F₁` at `λ = 1` | `2^{λ/2−1}Γ(λ/2)` (`√(π/2)` at `λ = 1`); `F₁ = [−e^{−τ²/2+yτ}]₀^∞ = 1` | true | none |
| 7.3 `exists_cubic_normal_form` | `t³/3 − αt`; `t³/3 + α²t` | `w = t`, `ζ = α`, `η = 0`, `hmix = −1`, `h₃ = 2`; second: `hmix = 0`, outside the hypotheses (critical points `±iα`) | true | none |
| 8.2 `integral_vertical_sub_eq_two_pi_mul_sum_residue` | `F = 1/(t(1−t))`, `c = ½`, `d = −½` | `∫ dy/(¼ + y²) = 2π`; left line `0`; `2π − 0 = 2π·1` | true | none |
| 8.3 Checks | `e^{−t}`; `oscTail κ 1` | `Γ`, residue `(−1)^k/k!` at `−k`; `i e^{iκ}/κ = −e^{iκ}/(iκ)`, while `∫₁^T e^{iκu} du` has no limit | true | none |
| 8.6 `exists_norm_Gamma_le` | `x = ½` | `\|Γ(½+iy)\|² = π/cosh πy ≤ 2π e^{−π\|y\|}`: `K = 0`, `C = √(2π)` | true | none |
| 8.7 `integral_Gamma_mul_cpow_neg` | `w = 1`; `w = i` | Mellin inversion of `e^{−x}` with `ds = i dy`: `2π e^{−w}`, so `2π/e` at `w = 1`; at `w = i` the integrand is `∼ √(2π) \|y\|^{c−½}` as `y → +∞`, not integrable | true; `Re w > 0` needed | none |
| 9.1 | `α = β = ½`, `x = 1` | `∫ t^{−1/2}(1+t)⁻¹ dt = π = Γ(½)²/Γ(1)` | true | none |
| 9.2 `stieltjes_eq` | `n = 1` | `1/(t+z) = 1/z − t/(z(t+z))` gives `a₀π z^{−α}/sin πα + 𝓜f(1)/z − z⁻¹∫ τ f₁/(τ+z)`, and `∫₀^∞ f₁ = mellinContAtTop f a (k+α) 1 1` | true | none |
| 10.1 `exists_volterra_solution` | `K = 0`; integrability | `h = 0 ≤ PΦe^Ψ`; `\|K(J + ψh)\| ≤ P(x)(Q\|J\| + PQ\|ψ\| Φ e^Ψ)` is integrable on `(x, ∞)`, since `Φ` and `Ψ` decrease | consistent | none |
| 10.3 `regularSingular_solution` | `f = 0`, `g = −2/z²` | roots `2, −1`; `ρ = 2` gives `z²`; `ρ = −1` is excluded by `hres` at `s = 3` | true | none |
| 10.4 `exists_rankOne_solution` | README example | `e^{1/z}` and `e^{z+1/z}` solve it; 2.7.11 gives `−s a_s = (s² − s − 1)a_{s−1} + (2 − 2s)a_{s−2} + a_{s−3}`, so `a₁ = 1`, `a₂ = ½`, `a₃ = 1/6`; `W″ + (e^ζ f − 1)W′ + e^{2ζ} g W = 0` re-derived from `W(ζ) = w(e^ζ)` | true | none |
| 10.5 Fabry | general | `u = w(t²)` satisfies `u″ + (2tf − 1/t)u′ + 4t²g u = 0`; with `u = e^{−f₀t²/2}W` this gives `F = 2t(f − f₀) − 1/t` and `G = 4t²(g − ½f₀f + ¼f₀²)`; `F₀ = 0`, `G₀ = 4g₁ − 2f₀f₁`, `G₁ = 0` | true | none |
| 11.1 `liouvilleGreen_recessive` | `f = 1`, `g = 0` | `Φ = 0`, `ε = 0`, `w = e^{−(x−c)}` | true | none |
| 11.4 `exists_caseI_solution` | `ψ = 0`, `A_s = C_s` constants | `W = (1 + C₁/u + … + C_{n−1}/u^{n−1}) e^{uξ}` meets both uniform estimates | true | none |
| 12.1 `exists_difference_solution` | `w(n+2) − 3w(n+1) + 2w(n)`; the `g(n) ≠ 0` counterexample | `ρ = 1, 2`, `α = 0`; every `a_s`, `s ≥ 1`, is `0` (the `a₀` term carries `Ring.choose 0 (s+1) = 0`); counterexample: `w(2) = 0` for every solution, so there is no constant tail | true; `hgne` needed | none |
| 13.1 `sum_Icc_eq_eulerMaclaurin` | `f = x²`, `[0, 1]`, `m = 1` | `1/3 + 1/2 + 1/6 = 1` | true | none |
| 13.2 `sum_Icc_eq_abelPlana` | `f = z²`, `a = 0`, `n = 2` | `8/3 + 2 + 1/3 = 5` | true | none |
| 13.3 `tendsto_sum_mul_log_sub` | `n = 20000` | `0.24875450` against `1/12 − ζ′(−1) = 0.24875448` | true | none |
| 13.5 | Laplace at `t₀ = x^{1/3}` | `e^{3t₀}(2πt₀)^{−3/2} √(2πt₀/3) = e^{3t₀}/(2π√3 t₀)` | matches 2.10.24 | none |
| 13.6 `tendsto_circleLaurentCoeff_sub` | `f − g = 1/(2−z)`, `r = 1` | `f_n − g_n = 2^{−n−1}` for `n ≥ 0` and `0` for `n < 0`, both `→ 0` | true | none |

### Lean

- **Elaboration.** `lake env lean TauCetiRoadmap/AsymptoticExpansions/Suggested.lean` exits 0. Its 39 warnings are all `declaration uses sorry`, and there is nothing else.
- **File contents.**
  - 13 definitions with real bodies and 39 theorems.
  - Imports: `Mathlib`, `TauCeti.Analysis.Complex.Laurent.Basic` and `TauCeti.Analysis.Contour.Residue.Basic`.
  - No `set_option`, `lemma`, `#eval`, `#print` or `#synth`.
- **`#check @name` sweep.** I appended all 52 `#check @name` lines to a scratch copy, and it elaborates with exit 0. The types match `signatures.md`. Only the `Expansions` section has variables. `HasAsymptoticExpansion` and `HasAsymptoticExpansion.unique` keep all six, and `IsAsymptoticScale` keeps the three its type uses (it does not mention `E`), so no binder is lost. I compared each type with its README statement; nothing changed.
- **Padding probe.** I replaced each of the 39 theorem bodies with `first | rfl | (simp; done) | infer_instance | (norm_num; done) | (exact le_rfl) | sorry`. All 39 `sorry` warnings remain, so no statement closes in one tactic.
- **Headline theorems.** They follow the scope items 1–13, and each layer's principal result is stated:
  - Layer 1: `HasAsymptoticExpansion.unique`, `hasAsymptoticExpansion_inv_pow_iff`, the four 1.4 theorems, Ritt's theorem and Borel–Ritt.
  - Layer 2: `hasAsymptoticExpansion_reversion`.
  - Layers 3–4: `hasAsymptoticExpansion_laplace_sector` (with 3.3 as its restriction), the rotated-ray pair and `exists_inverseLaplace_hasExpansion`.
  - Layer 5: `hasAsymptoticExpansion_laplace_method` and `hasAsymptoticExpansion_laplace_contour`.
  - Layer 6: `hasAsymptoticExpansion_fourier` and both stationary-phase theorems.
  - Layer 7: `norm_bleistein_remainder_le` and `exists_cubic_normal_form`.
  - Layer 8: the line shift, the Gamma bound, Cahen–Mellin, `mellinContAtZero_spec`, `oscTail_spec` and `exists_entire_mellinContOscTop`.
  - Layer 9: `stieltjes_eq`.
  - Layers 10–12: one solution theorem per equation type.
  - Layer 13: Euler–Maclaurin, Abel–Plana, the Glaisher constant and Darboux.

  The module docstring names Handelsman–Lew (8.4) as not statable (no carrier for the truncations 2.5.21–2.5.24 or Table 2.5.2) and 5.5 as two instances of 5.4. The README targets without a Lean statement are variants, corollaries or examples of stated headlines:
  - 3.1–3.5;
  - 4.5, a Riemann–Lebesgue consequence of 4.4;
  - 9.3–9.4, companions of 9.2;
  - 12.2, the coincident-root case of 12.1;
  - 13.4–13.5.

### Library declarations opened at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9, unchanged since r6): 50

- **Mathlib: 38 names by `#check` (exit 0).** `Complex.Gamma`, `Complex.GammaIntegral_eq_mellin`, `Complex.VerticalIntegrable`, `Complex.betaIntegral`, `Complex.digamma`, `Complex.integral_cpow_mul_exp_neg_mul_Ioi`, `Complex.tanh`, `Finset.sum_range_by_parts`, `HasFPowerSeriesAt.isBigO_sub_partialSum_pow`, `HasStrictDerivAt.to_localInverse`, `HasStrictFDerivAt.implicitFunction`, `IsPicardLindelof`, `MellinConvergent`, `ODE_solution_unique`, `PowerSeries.binomialSeries`, `PowerSeries.subst`, `PowerSeries.substInvOfIsUnit`, `Real.eulerMascheroniConstant`, `Real.integral_rpow_mul_exp_neg_mul_Ioi`, `Real.tendsto_harmonic_sub_log`, `Ring.choose`, `Stirling.factorial_isEquivalent_stirling`, `bernoulli`, `bernoulliFun`, `bernoulliFun_eq_integral`, `hasDerivAt_bernoulliFun`, `mellin`, `mellinInv`, `mellinInv_mellin_eq`, `mellin_differentiableAt_of_isBigO_rpow`, `norm_le_gronwallBound_of_norm_deriv_right_le`, `periodizedBernoulli`, `riemannZeta`, `riemannZeta_one_sub`, `tendsto_integral_exp_inner_smul_cocompact`, `descPochhammer`, `circleIntegral`, `eVariationOn`.
- **Mathlib: opened in source.**
  - `Complex.integral_cpow_mul_exp_neg_mul_Ioi` (`Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean` line 372) has a real rate `r`, as README 236–237 says.
  - `PowerSeries.binomialSeries` (`Mathlib/RingTheory/PowerSeries/Binomial.lean` line 47) is `mk fun n => Ring.choose r n • 1`.
  - `Mathlib/Analysis/SpecialFunctions/Stirling.lean` treats `n!` only.
- **Tau Ceti: 6 names by `#check`.** `TauCeti.Contour.residue`, `TauCeti.circleLaurentCoeff`, `TauCeti.circleLaurentCoeff_add`, `TauCeti.circleLaurentCoeff_eq_of_differentiable_on_annulus_off_countable`, `TauCeti.circleLaurentCoeff_sub_zpow_smul`, `TauCeti.norm_circleLaurentCoeff_le`.
- **Tau Ceti: 6 in source.**
  - `TauCeti.integral_rpow_mul_one_add_rpow` (`Analysis/SpecialFunctions/Beta.lean` line 456: `∫ x in Ioi 0, x^(a−1)(1+x)^(−(a+b)) = beta a b` for `0 < a, b`).
  - `TauCeti.differentiable_intervalIntegral_mul_cexp_neg_mul`, `TauCeti.integrableOn_mul_cexp_neg_mul` and `TauCeti.differentiableOn_integral_mul_cexp_neg_mul` (`Analysis/Complex/LaplaceTransform.lean` lines 46, 119, 168, for bounded `f`; their object file is not built at the pin, so I read them in source).
  - `TauCeti.wronskian_eq_of_hasDerivAt` (`Analysis/ODE/Wronskian.lean` line 31).
  - `TauCeti.IsFrobeniusIntegrableAt` (`Analysis/ODE/Frobenius.lean` line 94).
- **Absence claims, by grep of both pins.** There is no Euler–Maclaurin formula, Abel–Plana formula, Watson's lemma, vertical-strip bound for `Γ` or `laplace`. `IsAsymptoticScale` and `HasAsymptoticExpansion` occur nowhere at either pin; `citations.md` lists them, and they are this roadmap's own notions (`Suggested.lean` lines 42, 47).

### Suppliers, gate and dependency check

- **ZerosOfLFunctions on main.** §1.2 is 5.11.1 on `S_δ` and §1.3 is 5.11.9, uniform for `σ` in compact intervals. The anchors `#12-stirling-on-the-sector` and `#13-vertical-strips` match the headings. 8.6 and 13.5 consume exactly these.
- **ContourIntegration.** `Completed/ContourIntegration/README.md` is on main.
- This roadmap is already on main, and both its suppliers are on main, as required.
- **Dependency check.** `gate --depcheck … --order …/ORDER.txt --movable` prints `depcheck: 236 roadmaps, 2263 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Gate.**
  - The worker's gate at 3d73056 passes every check, including `build=0`.
  - My own run prints `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
  - The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.CA"`).
- **Overlaps.** `overlaps.md` reports no other open pull request changing this roadmap, no dropped id cited here, and no id defined only by an open revision. This pull request renames or drops no id.

### Ownership

- **The two notions.** `roadmaps grep 'def (IsAsymptoticScale|HasAsymptoticExpansion)'` finds them only in this roadmap (main and this head). The closest open roadmaps (SpecialFunctionsAiry #1928, SpecialFunctionsBessel #1987, SpecialFunctionsConfluent #1995, SpecialFunctionsHypergeometric #2089) and SpecialFunctionsEiLiErfIncompleteGamma on main cite this roadmap's sections (for example Airy README 595, 1512) and do not restate the methods.
- **Euler–Maclaurin.** ExplicitZetaBounds (#1954, open) states a Banach-valued Euler–Maclaurin formula (its 0.5a), and its scope names this roadmap's §13.1 as the real-valued case. This roadmap is on main and so is the earlier owner, so any narrowing is that pull request's to make; nothing changes here.

## Not verifiable

- **10.1, Olver (1997), Chapter 6 §10.** The book is paywalled and I did not read it. The statement was checked only by computation (table row).
- **8.7 cites no source.** It is the Mellin inversion of `𝓜(e^{−t}) = Γ` continued in `w`, built from pinned declarations and 8.6, and it was checked by computation (table row).
- **DLMF §2.10 and §2.11.** The sources service resolves both pages to figure PDFs (2.10.F1, 2.11.F1), which are image-only, and OCR is not installed on this worker. I read 2.10.19–2.10.24 and 2.11.1–2.11.3 on the DLMF site pages instead. The worker's list of missing texts already names `dlmf210`.
- **Other books.** Bleistein–Handelsman, Wong, Chester–Friedman–Ursell, Handelsman–Lew and Temme are paywalled and were not read. The 3.3 generalization rests on DLMF's own pointer (`dlmf23` line 404).

## Source issues

- **Gap** in dlmf22 at 2.2.1–2.2.2 (§2.2): the source says `f` is continuous and strictly increasing for `a < x < ∞`, then asserts a root in `(a, ∞)` for every `y > f(a)`; it should be continuity on `[a, ∞)`, since `f(a) < f(a+)` leaves every `y` in `(f(a), f(a+)]` without a root; affects a stated result.
