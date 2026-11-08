# Review of SpecialFunctionsParabolicCylinder (pull request #1801 at 4a8c39e)

**Verdict:** accepted

This is an incremental re-review of 36 changed lines since 78d0f47 (`TauCetiRoadmap/SpecialFunctionsParabolicCylinder/README.md` +25/−11; `Suggested.lean` unchanged; nothing changed outside the folder). The change rewrites the proof-route paragraphs of 6.1 and 8.1, their *Needs* lines and the Layer 8 Dependencies line, as the previous review proposed.

- Both findings of the previous review are repaired, and the repairs introduce no new problem.
- No statement is false. Every formula the new text invokes was recomputed (table below).
- The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning.

No finding.

## Previous findings

- R01 — repaired: 8.1 lines 1078–1081 now route only 12.12.1 and 12.12.3 through "inserting 6.1 and Fubini for `−½ < Re a`", with the Beta integral and duplication named for 12.12.1 and "the right side of 12.12.3 is 6.1 at parameter `−a`". Lines 1086–1091 give 12.12.4 its own route through 12.2.20 (3.5), 6.1 at `−a`, the change of variables `u = s − r`, `p = sr`, the `λ`-integral and `λ = (e^{2t} − 1)/4`. The *Needs* line (1093–1096) lists 3.5 and the five Mathlib declarations; the Layer 8 Dependencies line (1158) names 3.5 for 12.12.4.
- R02 — repaired: 6.1 lines 730–736 now use the dominating function `(1 + t) t^{Re a−½} e^{−t²/2 + Rt}` "which bounds both the integrand and its `z`-derivative", derive Weber's equation from `I″ − zI′ − (a + ½) I` being the integral of `−∂_t(t^{a+½} e^{−t²/2 − zt})` with vanishing boundary values for `Re a > −½`, and name the duplication formula for matching 3.2. The *Needs* line (738–740) adds `Complex.Gamma_mul_Gamma_add_half`.

## Verified sound

**Gate, build and elaboration.**

- The worker's gate at 4a8c39e passes every check, `build=0` included. My rerun of `gate … --base origin/main` prints `OK` with every counter at 0.
- `git diff --stat origin/main...HEAD` outside the folder is empty; `git diff 78d0f47..HEAD` touches only `README.md`.
- `lake env lean` on `Suggested.lean` exits 0 in 54 s with exactly 70 `declaration uses sorry` warnings and nothing else, on 81 declarations (70 theorems, 11 definitions with real bodies), as at 78d0f47. The file is unchanged, so the `#check @name` comparison of the previous review stands; the worker's `signatures.md` reports 0 declarations with a lost binder. I reread the two statements the changed routes prove: `parabolicCylinderU_eq_integral` (`-1/2 < a.re`, all `z`, Lean line 297) and `parabolicCylinderU_sq_add_sq_eq_integral` (`a.re < 1/2`, left side `U a z ^ 2 + (Complex.Gamma (1/2 − a) * V a z) ^ 2`, Lean line 488), and the identity the new 8.1 route consumes, `parabolicCylinderV_eq_add_rotation` (Lean line 204, both signs through `ε = 1 ∨ ε = −1`). They match README 6.1, 8.1 and 3.5.

**Dependency check.** `gate --depcheck … --movable` prints `depcheck: 238 roadmaps, 2343 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The change adds no supplier citation: 3.5, 4.1, 2.4, 3.2 and 7.4 are this roadmap's own sections, all earlier in the build than 6.1 and 8.1 except 7.4, which 8.1 cited already (convergence at `∞`).

**Library declarations opened at the pin (Mathlib 1b1ccf4)**, each at its file and line, with the hypotheses the routes need:

- `hasDerivAt_integral_of_dominated_loc_of_deriv_le`: `Analysis/Calculus/ParametricIntegral.lean` 569, root namespace; its `h_bound` bounds the derivative, which the repaired dominating function now does.
- `MeasureTheory.integral_Ioi_mul_deriv_eq_deriv_mul`: `MeasureTheory/Integral/IntegralEqImproper.lean` 1403.
- `Complex.Gamma_eq_integral`: `Analysis/SpecialFunctions/Gamma/Basic.lean` 319 (`0 < s.re`), inside `namespace Complex` opened at 141.
- `Complex.integral_cpow_mul_exp_neg_mul_Ioi`: same file, 372 (a `lemma`, same namespace): `∫ t in Ioi 0, t ^ (a − 1) * exp (−(r * t)) = (1/r) ^ a * Gamma a` for `0 < a.re`, real `0 < r`. The 8.1 `p`-integral uses it with `a = ½ − a` (so `Re a < ½`, the theorem's hypothesis) and `r = 1 + 4λ > 0`.
- `Complex.Gamma_mul_Gamma_eq_betaIntegral`: `Gamma/Beta.lean` 124 (`0 < re s`, `0 < re t`), namespace `Complex` opened at 57. For 12.12.1 the arguments are `μ` and `a + ½`, both of positive real part on the Fubini half-plane.
- `Complex.Gamma_mul_Gamma_add_half`: `Gamma/Beta.lean` 580: `Gamma s * Gamma (s + 1/2) = Gamma (2s) * 2 ^ (1 − 2s) * √π`, namespace `Complex` opened at 578.
- `integral_cexp_quadratic`: `Analysis/SpecialFunctions/Gaussian/FourierTransform.lean` 174, declared `_root_` (so the bare name in the README is right): `∫ x, cexp (b x² + c x + d) = (π/−b)^{½} cexp (d − c²/(4b))` for `b.re < 0`. The 8.1 `u`-integral uses `b = −(½ + λ)`, `c = −iz`, `d = 0`.
- `MeasureTheory.integral_integral_swap`: `MeasureTheory/Integral/Prod.lean` 481.

**Sources in the changed passages** (cached DLMF texts; I copied no passage):

- 6.1: 12.5.1 at `dlmf125` line 69, hypothesis `Re a > −½` at line 71.
- 8.1 (the seeded target that falls in the changed passages): 12.12.1 at `dlmf1212` line 47 with `Re μ > 0` at 49; 12.12.2 at 76 with `Re a < −½` at 78; 12.12.3 at 106 with `Re a < ½`, `x > 0` at 108; 12.12.4 at 148 with `Re a < ½` at 150; the Durand (1975) attribution of 12.12.4 at 38–39.
- 3.5, consumed by the new 12.12.4 route: 12.2.20 at `dlmf122` line 757; `Ū = Γ(½ − a) V` at 813, undefined at `a = ½, 3/2, …` at 838.
- 3.2, consumed by the new 6.1 route: 12.2.6 at `dlmf122` line 297–300, 12.2.7 at 327–330, 12.2.8 at 355–358, 12.2.9 at 383–386.

The other seeded targets (1.5, 2.4, 3.3, 3.4, 3.6, 4.2, 5.1, 5.3, 6.2, 6.3, 6.7, 7.1, 7.3, 7.5) are untouched by this change; 2.4 is cited by the new 6.1 text only for the uniqueness statement it already made.

**Cross-roadmap citations.** The change renames no heading and renumbers no section, so the consumers' citations resolve as before: QuantumFoundations (§1.3, §1.6), SpecialFunctionsEiLiErfIncompleteGamma (§5.1, §5.3, `differentiable_dawson`, `hasDerivAt_dawson`), SpecialFunctionsAiry (§1.3, `regularizedHGFun_kummer_equation`). `overlaps.md` lists nothing dropped and no other pull request changing this roadmap; `citations.md` lists no cross-roadmap citation found nowhere (its five Lean-name leads are this roadmap's own definitions and Mathlib's `Asymptotics.HasAsymptoticExpansion`, unchanged since the previous review). Ownership against open pull requests was checked through the roadmap index (466 heads, 2026-11-08T19:43:52Z) for the previous review; the change adds no new object.

**Adversarial table: changed statements, recomputed** with a pure-Python implementation of the pinned definitions (`U`, `V` from the series `u₁`, `u₂` with the 12.2.6–12.2.9 initial values, Lanczos Gamma, trapezoid quadrature in `log t`). Values are left / right unless stated.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 6.1, the integral equals `U` | (a, z) = (0.3+0.2i, 0.7−0.4i); (−0.3+0.5i, −1.1+0.6i) | `0.7073588741+0.1903060173i` both (3.5e-16); `2.0129749521+1.3429974123i` both (3.9e-11, series precision) | holds |
| 6.1 route, Weber's equation | same two points | `I″ − zI′ − (a+½)I` = 3.5e-16, 3.8e-11 | holds |
| 6.1 route, `−∂_t(t^{a+½}e^{−t²/2−zt})` = `(−(a+½)t^{a−½} + z t^{a+½} + t^{a+3/2}) e^{…}` | a = 0.3+0.2i, z = 0.7−0.4i, t = 1.7, central difference | `0.1896444600+0.1095942264i` both (9.6e-12) | holds |
| 6.1 route, `U(a, 0)` by the integral vs 3.2 | a = 0.3+0.2i; −0.3+0.5i | `2^{a/2−¾}Γ(a/2+¼)/Γ(a+½)` = `1.2690724982+0.0071675380i`, `1.2137264568+0.2311346299i`; 3.2 the same (9e-16, 1e-15) | holds; needs duplication |
| 6.1 route, `U′(a, 0)` by the integral vs 3.2 | same | `−2^{a/2−¼}Γ(a/2+¾)/Γ(a+½)` = `−0.8727079545−0.1602834795i`, `−0.3024994632−0.6221193644i`; 3.2 the same (6e-16, 4e-16) | holds |
| `Complex.Gamma_mul_Gamma_add_half` as used | s = a/2+¼ at the two a | `Γ(s)Γ(s+½)` = `2.1467862993−0.7255432531i`, `−0.3714451543−4.5099967358i`; `Γ(2s)2^{1−2s}√π` the same | holds |
| 6.1 route, dominating function | a = 0, R = 1, z = −0.99, t = 3; sup over a grid t ∈ (0, 20], three a, three z with |z| < 1 | `|∂_z F|` = 0.37505; old bound 0.12882 (fails); new bound 0.51530 (holds); sup of ratio to the new bound 0.823 | holds |
| 8.1, 12.12.4 left side vs 12.2.20 product | (a, z) = (0.2+0.1i, 0.6+0.3i); (−1.1, 1.2); (−0.3+0.2i, 0.6+0.3i) | `U² + Ū²` = `5.3932513430+4.8316267403i`, `0.7516780306`, `1.1895523094+0.5471244109i`; `(2/π)Γ(½−a)²U(−a,iz)U(−a,−iz)` the same (3.6e-15, 1e-16, 2.5e-15) | holds |
| 8.1, change of variables `u = s − r`, `p = sr` | s = 1.3, r = 0.4; the (u, p) double integral at (−1.1, 1.2) and (−0.3+0.2i, 0.6+0.3i) | Jacobian `s + r` = 1.7 = `√(u²+4p)`; `(2/π)e^{z²/2}∬ p^{−a−½}e^{−u²/2−p−izu}/√(u²+4p)` = `0.7516780111` (1.9e-8), `1.1896866581+0.5470754344i` (1.4e-4, the `|u|^{−2 Re a}` singularity at u = 0 limits the quadrature) | holds |
| 8.1, `1/√c = π^{−½}∫₀^∞ λ^{−½}e^{−λc} dλ` | c = 2.7 | `0.6085806195` both | holds |
| 8.1, `p`-integral (`integral_cpow_mul_exp_neg_mul_Ioi`) | a = 0.2+0.1i, r = 1+4λ, λ = 0.8 | `1.6257712504+0.8504876464i` both (1.1e-15) | holds |
| 8.1, `u`-integral (`integral_cexp_quadratic`) | λ = 0.8, z = 0.6+0.3i | `1.4723523609−0.1020952494i` both (1.8e-15) | holds |
| 8.1, the `λ`-integral `(2/π)Γ(½−a)∫λ^{−½}(1+4λ)^{a−½}(½+λ)^{−½}e^{z²λ/(1+2λ)}dλ` | the three points | `5.3932512930+4.8316266985i` (6.5e-8, tail truncated at λ = e^{60}); `0.7516780306` (9e-16); `1.1895523094+0.5471244109i` (8.7e-15) | holds |
| 8.1, 12.12.4 right side after `λ = (e^{2t}−1)/4` | the three points | `(2√2/π)Γ(½−a)∫e^{2at+z²tanh t/2}/√(sinh 2t)` = `5.3932513430+4.8316267403i` (1.4e-14), `0.7516780306` (1e-15), `1.1895523094+0.5471244109i` (2e-15) | holds |
| 8.1, 12.12.1 route (6.1, Fubini, Beta, duplication) | (a, μ) = (0.3+0.2i, 1.4+0.3i) | direct `0.7861865371−0.1763596102i`; Beta form `Γ(μ)2^{(μ+a+½)/2−1}Γ((μ+a+½)/2)/Γ(μ+a+½)` the same; right side the same (≤ 2e-15) | holds |
| 8.1, "the right side of 12.12.3 is 6.1 at parameter `−a`" | (a, x) = (0.3, 1.5) | direct `2.4691173843`; `√(π/2) x^{−a−3/2}∫s^{−a−½}e^{−s²/2−xs}ds` = `2.4691173843`; right side `2.4691173844` (1e-10, series precision at t ≤ 3.5) | holds |
| 3.2 initial values used for `Ū` | a = ½, −½ | `V(½, 0)` = `0.7978845557` vs `√(2/π)` = `0.7978845608` (a = ½+10⁻⁸ to avoid the Gamma pole); `V′(−½, 0)` = `0.7978845557` | holds |

**Adversarial table: untouched statements**, carried from the previous reviews (their values; I did not recompute them):

| Statement | Values in r4/r5 | Result |
|---|---|---|
| 3.2 Checks `V(−½, 0)`, `V′(−½, 0)`, `V(3/2, z)` | `0`; `0.7978845608`; `0.5522508725−0.4278495180i` both, wrong model `−1.9576783713+1.5166870514i` (r5) | holds |
| 6.6(a), 5.8.3 | x = 1.3, −1.5, −0.25: `1.673166906`, `16.451369461`, `23.701563554` (r4) | holds |
| 6.7 *Needs*, residues of 12.5.8 | `1, −1, ½, −⅙`; errors ≤ 3.0e-13 (r4) | holds |
| 12.12.2 route via 12.8.1 | a = −1.2+0.3i, −0.8−0.25i: `0.6670339423+0.4412785583i`, `1.2839343555−1.5130244251i`; 12.8.1 residual 9e-16 (r5) | holds |
| 9.5 both forms | `w₁` = `1.154128793319`, `0.738002792173`, `6.465338849007`; `w₂` = `1.146977995301`, `0.636805157853`, `4.582489977666` (r5) | holds |
| 12.2.6, Check `U′(½,0) = −1` | `1.269072498+0.007167538i` both; `−1.0000000000` (r4) | holds |
| 12.2.10–12.2.12 | `0.7978845608`; `2.212761652+0.419333046i`; `0.6946542388−0.2257068443i` (r4) | holds |
| 3.5, 3.4, 3.6 | residuals ≤ 1.2e-14; vanishing coefficient; 2.0e-9 with `s⁴ = −4α` (r4) | holds |
| 12.8.1, 12.8.2, 12.8.9 | ≤ 1.2e-9 (r4) | holds |
| 12.7.1–12.7.4, `F(iy)`, 12.7.7, 12.7.5, 5.2 | ≤ 8.3e-15; `1.247258307i`; ≤ 2.3e-15; `0.5649295345`; `−0.4955243438` (r4) | holds |
| 12.5.1–12.5.9 | ≤ 2.4e-5 (endpoint quadrature); loop ≤ 1.1e-15; lines ≤ 1.3e-15; corrected 12.5.8 ≤ 3.0e-13, 12.5.9 ≤ 1.8e-7 (r4) | holds |
| 6.6(b), 6.6(c), `|Γ(1+iy)|²` | `1, −1, ½, −⅙`; `−1.00265−0.62666i`; `0.4938431207` both (r4) | holds |
| 7.1, 12.9.1–12.9.4, 7.4 | ≤ 9.4e-8; bounded `|rem|·r^{2N}`; ratios 0.962–1.007 (r4) | holds |
| 12.13.1, 12.13.5 | `0.5144502366−0.0068118059i`; README form right, DLMF display wrong unless a = −½ (r4) | holds |
| 9.1–9.4, φ₂, 12.14.13–12.14.14, 12.14.23 | Wronskian `0.99999999999`; `0.5001012720`; `φ₂′(0) = −1.963507`; `0.5724433628`; bounded `|s−S_N|x^{2N}` (r4) | holds |

**Headline theorems and padding.** Unchanged since 78d0f47: the nine milestones of Scope and ownership, stated in `Suggested.lean` as 70 theorems; no declaration was added, so no new padding probe was needed, and no headline was lost.

**Remarks on untouched text** (not findings; the previous review passed them): none new.

## Not verifiable

- Durand (1975), the source DLMF names for 12.12.4 (`dlmf1212` line 39), is a print article I did not read. The 8.1 route for 12.12.4 is not taken from it; it is derived from 12.2.20 and 6.1 and checked above.
- Olver (1974), Temme (1996), Whittaker–Watson and Miller (1955) are print texts the changed passages do not cite anew.

## Source issues

- none
