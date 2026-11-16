# Review of DiracScatteringAndNonlinearFourierTransform (pull request #2444 at 550224e)

**Verdict:** accepted

No findings.

## Previous findings

- The previous review read this same head (`550224e`) and raised none; the folder is unchanged since (0 lines). Its three earlier repairs (§8.7 Check at README line 2293, §6.8 attribution at line 1916–1919, the description's Dependencies sentence) were re-read and stand.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.1 integral Grönwall | `β = 1_{[0,1]}`, `α = 2`; `β = −1`; `α < 0`, `β = 1` | `u = 2e^{min(t,1)}` attains bound; `1/2 > e^{−1} = 0.368`; `u = αe^t` gives equality for negative `α` | holds | none |
| §1.2 `linear_caratheodory` | `P = t^{−1/2}`; `P = 1/t`; `V = 0`, `λ = −z` | `Y = y₀e^{2√t}`; `Y = ct` non-unique; columns `(cos tz, sin tz)`, `(−sin tz, cos tz)` | holds | none |
| §1.6 holomorphic dependence | `P = 1/(z − t)` on `[0,1]`; Dirac coefficient, `q = 1 + i` | `N(t,0) = z/(z − t)`, pole at `z = t`; Euclidean norm `√2`, row-sum norm `2` | holds | none |
| §1.7 nonlinear Carathéodory | `F = x²`, `x₀ = 1`, `r = 1`; switching field at `τ = 2` | `L = 4`, `m = 1`, `0.1·e^{0.4} = 0.149 ≤ 1`; `(∫m)e⁰ = 1 = r`, two solutions `min(t,1)`, `1 + (t−1)²` | holds | none |
| §2.5 bounded holomorphic functions | `F = e^{−i/z}`; `F = (z−i)/(z+i)` | `|F| = e^{−Im z/|z|²} ≤ 1`, `log|F(i)| = −1 < 0 = P[log|F*|](i)`; `log|F(i)| = −∞ ≤ 0` | holds | none |
| §2.7 Paley–Wiener spaces | `φ = 1_{[−t,t]}`; kernel at `λ`; `E = e^{−itz}` in §6.1's formula | `‖F‖² = 4πt = 2π·2t`; `k_t(λ,λ) = sinh(2t Im λ)/(2π Im λ)`, `t/π` real; kernel `sin(t(w̄ − z))/(π(w̄ − z))` | holds | none |
| §3.1 `existsUnique_diracFundamentalSystem` | `q = 0`; `f = c`, `z = 0`; `q = ic`; `q = 1 + i`, `t = 1` | `M` rotation, `det = 1`; `diag(e^{ct}, e^{−ct})`; `Θ = (cosh, −sinh)`; `M ≈ [[3.5465, −1.3683],[−1.3683, 0.8099]]`, norm `e^{√2}` | holds | none |
| §3.1 Christoffel–Darboux, §3.2 equation for `E` | derivative of `M_λ*ΩM_z`; `E′` from `diracCoeff` | `(z − λ̄)M_λ*M_z`; `E′ = −izE + qE#`; `E_{−q} = D + iB = iẼ_q` | holds | none |
| §4.1 dictionary and concatenation | `a′` from (2.5); `G(t) = D⁻¹G₂DG₁`; `q = 0.7 + 0.4i`, `T = 1.3` | `a′ = qe^{2izt}b#`; `b = e^{2izs}b₂a₁# + a₂b₁`; `a = 1.6014`, `b = 1.0860 + 0.6206i` | holds | none |
| §4.4 `nonlinear_plancherel` | `q = 1_{[0,1]}`; `q = 0.5 + 1.2i` on `[0, 0.7]`; `t = 0` | `1.57067` vs `π/2 = 1.57080`; `1.85804` vs `1.85825`; `y(a − 1) = 0.4853, 0.4987`; `0 = 0` | holds | none |
| §4.2–§4.5 | `q = 1`, `z = ±5i`; Riccati for `r = β/a` | `|a| = 1.0934, |b| = 0.1083`; `|a| = 237.03 < |b| = 2384.6`; `r′ = 2izr + q̄ − qr²` | holds | none |
| §5.4–§5.5 `exists_nonlinearFourier_plancherel` | `q = 1_{[0,1]}`, `T = 0`, `T = 1`; `|ρ₁| = |ρ₂| = 0.999` | `∫|F|² = 2.3924 ≤ ∫−log(1−|F|²) = 3.1413 (π) ≤ 4π`; bound `0` at `T = 1`; `6.2151 = 6.2151` | holds | none |
| §5.4 normalisation Check | `q = 0.3e^{2iξs}1_{[0,400]}`, `ξ = −0.25, −0.5` | `I = 12.5417` (factor `e^{−3.992i}`), `I = 21.7048`; `2π² = 19.7392` between | holds | none |
| §6.1 de Branges space | `E = z + i`; `E = 1` | `K = 2i(w̄ − z)/(2πi(w̄ − z)) = 1/π`, `‖1/π‖² = 1/π`; `0/0` | holds | none |
| §6.4–§6.5 `exists_isSpectralMeasureOf` | `f = 1_{[0,1]}`, `z = i`; `f ≡ 1` | `m(i) = 0.443190i`; `−D/C = 0.591892i`, `−B/A = 0.385819i`; `Im m_T(i) = 0.537329, 0.443190, 0.415910, 0.414219 → √2 − 1` | holds | none |
| §6.5 `IsSpectralMeasureOf` determines `μ` | wrong models `2μ`, `β′ ≠ β` | `(β − β′)Im z + P[μ] = P[μ′]` forces `β = β′` by §2.2's unique `c`; `2dx` gives `Im m = 2 ≠ 1` in free case | holds | none |
| §6.6 `spectralMeasure_isometry`, `spectralMeasure_unique` | free case; `ν = 2dx`; `k_ε = sin(εx)/x` | `∫|F|²dx = ‖F‖²`; `2‖F‖² ≠ ‖F‖²`; zeros `πn/ε` move with `ε`, so `|k_ε|²ν = |k_ε|²μ` gives `ν = μ` | holds | none |
| §6.7–§6.8 `szego_condition` | `q = 0`; `f = 0.7` on `[0, 1.3]` | `0 ≥ −4.3552`; mass `0.537539` (quadrature `0.537539`); `(1/π)∫log w dΠ = −0.918466 ≥ −2.023294`; `klDiv = 0.456005 ≥ 0.158293` | holds | none |
| §7.2 zero localisation | `b_{10i}`, `ε = 1/2`; `ζ = 1 + i` | `|θ′| = 0.2, 0.16, 0.1`; radius `60 > 10`; `(√(1+ε)+1) ≤ 2.415 < 3`; `εb_ζ(i) = √5/5` | holds | none |
| §7.3 Dirac inner functions | free case; `f = c`, `z = 0`; (4.3) from (4.2) at `a = 0` | `∂ₜe^{2itz} = 2ize^{2itz}`; `θ = 1`, `θ̃ = −1`, `f(1 − 1) = 0`; `ζ′ = −f/∂_zθ` | holds | none |
| §8.1 boxes and resonance sets | `γ(1)`; `|γ(p)sin(a + ip)|²` extremes; zero at `s − 2i/t` | `0.742591`; `tanh p` at `sin a = 0`, `coth p` at `cos a = 0`; in `T₀(s,3) ∩ T₁(s,3)` | holds | none |
| §8.6–§8.7 two-term form | `E(z₀) = 0`; `E = 1.25e^{−itz} + 0.75e^{itz}` | `D(·, z₀) = iβE`, `K_t(z₀,z₀) = |β|²/(πy)`, modulus `γ(ty)/√w`; zero height `0.25541`, circle minimum `0.92842` | holds | none |
| §8.9 matching | `w = 0.7`, `w̃ = 0.9`, `ty = 1.5`, `ty′ = 1.52, 1.6` | determinant `2.0820i`, `2.4448i` with `γ(ty)`; `2i` with `γ(ty′)` | holds | none |
| §9.2 subinterval data | `w = 0.7`, `w̃ = 0.9`, `s = 0.3`, `(50, 0.31, 0.03)`, `(60, 0.305, 0.025)` | direct `a = 0.2684837 + 0.9634883i`, closed form equal to `10⁻¹⁵`; `b` likewise; `|a|² − |b|² = 1.0000000000`; single-time determinant `2i` | holds | none |
| §9.3 little time near a point | mean of `Ẽ/E` over a period; `υ = 1`, shift `0.1` | mean of `cot(a + ip)` is `−i`, giving `−iw ± √(w/w̃) sin Φ₀`; `0.000379` at shift, mean `0.000126`, `0` at `p = s` | holds | none |
| §9.4 `IsResonanceFree` | `f ≡ 1`, `t = 5`; `s = 1/2`, `t = 10`; heights `1, 0.99, 0.98` and reflected | zero of `Ẽ` at `−9.0808·10⁻⁵i` vs `−9.0800·10⁻⁵i`; `|E| = 6434.48`; `d₁₃ = 0.0056305 = (d₁₂ + d₂₃)/(1 + d₁₂d₂₃)` both ways; `t ≤ 0` boxes empty or `{s}` | holds | none |
| §9.5 asymptotics | determinant on `ℝ` of the two approximants; free case; `f = c1_{[0,T]}`, `x = 0` | `−2i Im β/√(ww̃) = 2i`, so `Im β = −√(ww̃)`; `α = i`, `β = −i`; `(e^{2cT} + e^{−2cT} + 2)/4 = cosh² cT` | holds | none |
| §9.6 `tendsto_truncation_of_isResonanceFree` | route from §8.7(3) alone; compact support; `F` changed on a null set | `|b/a| < e^{1−2K}`, `|a|²w = 1 + O(η + e^{2−4K})`; denominator `1/w + 1/w̃ + 2 > 0`; conclusion unchanged off a null set | holds | none |

- Source locators: 54 checked against the cached texts (poltoratski2024 25, mauth2022 15, romanov2014 6, denisov2026 3, mnatsakanyan2022 2, denisov2006, taothiele2012 and killipsimon2003 1 each); each supports the statement at its locator, with the constants `π/2`, `4π`, `−2π log 2` attributed to the roadmap's routes as the README says.
- Library: 104 cited declarations resolved by name at the pins, each at the line the README gives (for example Mathlib `IntervalIntegrable.ae_hasDerivAt_integral`, `MeasureTheory/Integral/IntervalIntegral/LebesgueDifferentiationThm.lean` line 67; Tau Ceti `TauCeti.rouche_exists_eq_zero_iff`, `Analysis/Complex/Conformal/Rouche.lean` line 359). Tau Ceti `Analysis/ODE/Caratheodory.lean` line 196–219 asks `‖M t‖ ≤ K` almost everywhere, so §1.2 is not at the pin. No pinned file defines a half-plane Hardy space, Paley–Wiener space, de Branges space or Dirac system.
- Cross-roadmap citations: 6 resolved. AutomorphicSpectralTheory §0.5 and §1.6 at its open head ("0.5 Herglotz representation", `euclidean_paley_wiener`); on main OperatorTheory/UnboundedOperators §4.8 (UO-D07, `J=[[0,−1],[1,0]]`), OperatorTheory/ToeplitzOperators Layers 2–5, StochasticCalculus S6.5, AsymptoticExpansions §10.1.
- Gate, run at this head: every count 0, `OK`; the worker's gate with the targeted build also passes. Dependency check: `depcheck: 256 roadmaps, 2432 edges, 0 problem(s)`; AutomorphicSpectralTheory is line 104 of the merge order, this roadmap line 105. Nothing changed outside the folder.
- Lean: `lake env lean` on `Suggested.lean` gives 9 `sorry` warnings and nothing else. The 19 elaborated signatures agree with the README statements; no binder is lost. One-tactic probe (`simp`, `rfl`, `trivial` on a scratch copy): none of the 9 theorems closes. The 9 headline theorems the README names are the 9 stated.
- Shape: 55 numbered sections, each with at least three Checks; every numeric Check recomputed (table above) agrees to the digits printed.
- Overlap check: read SchattenClassesAndSchurMultipliers, ComplexHessianEquations, SchrodingerOperatorsAndSpectralTypes, AutomorphicSpectralTheory, RelativisticQuantumFieldTheory, PDE, StochasticCalculus, OptimalTransport (and ConformalMappingPartII, BochnerSpaces by object search). Shared objects and owners: subtracted-kernel Herglotz representation, AutomorphicSpectralTheory §0.5 (cited); disc maximal bounds for finite circle measures, StochasticCalculus S6.5 (half-plane form kept here, difference stated in Scope); singular Dirac expressions and limit-point theory, OperatorTheory/UnboundedOperators §4.8 (not consumed, dictionary given). No open pull request changes this roadmap or drops a cited id.
- Source independence: 60 passages compared with 8 sources (the 54 locators and 6 further passages: the Summary, the definitions of §3.3, §6.1 and §9.1, the statement of §9.3, the docstring of `tendsto_truncation_of_isResonanceFree`); a 7-word-run scan of both files against the 8 cached texts finds only formula fragments and titles, none shared; largest share poltoratski2024, 69 of 172 citations; contents compared with poltoratski2024: independent (its §2 spectral measures precede its §5 scattering, here Layers 4–5 precede Layer 6; its §§3–4 follow as Layer 7; its §§6–8 are one Layer 8; Layers 1–2 have no counterpart). garnett2007, coddingtonlevinson1955, debranges1968, remling2018 and krein1955 could not be read.

## Not verifiable

- §1.1 and §1.7 cite only coddingtonlevinson1955 (waived), and §1.2, §1.4–§1.6 cite it beside romanov2014: its locators were not checked.
- §2.5 cites only garnett2007 (uncertified); so do parts of §2.2–§2.4, §2.6 and §2.8: its locators were not checked.
- debranges1968 and remling2018 (waived), cited in §6.1, §6.4 and §6.6: not checked.
- poltoratski2024 line 1253–1347 is garbled OCR: the displays (9.2) and (9.4) were checked through the README's closed forms numerically, not against the print.

## Source issues

- **Error** in poltoratski2024 at (5.5), printed p. 14 (line 545–547): the source says the `L¹(ℝ)` norm of `log|a(t, ·)|` equals the squared `L²(0, t)` norm of the potential; it should be `π/2` times that norm (`1.5707` for `f = 1` on `[0, 1]`); affects a stated result.
- **Error** in mauth2022 at (4), p. 2 (line 206–207): the source says the same Parseval identity with constant `1`; it should be `π/2` times the squared norm; affects a stated result.
- **Error** in poltoratski2024 at Lemma 8, (8.5), printed p. 29 (line 1131–1137): the source says the matched forms keep the factor `γ(ty)` at the new height `y′`; it should be `γ(ty′)`, since (2.2) gives `2i sinh(2ty′)/sinh(2ty)` otherwise; affects a stated result.
- **Error** in mauth2022 at Lemma 45, (58) (line 3264–3268): the source says the matched forms keep `γ(ty)` at height `y′`; it should be `γ(ty′)`; affects a stated result.
- **Misprint** in mauth2022 at Corollary 6, (20) (line 1406) and line 3859–3862: the source says `E(t, z)` is close to a multiple of `e^{itz}`; it should be `e^{−itz}`, as its free case at line 746 shows; affects nothing.

## For the human reviewers

- **Scope.** §9.6 is conditional on resonance-freeness (README line 137–152). mnatsakanyan2022 line 9–13, 135–137 retracts its theorem and reports the same mistake in an earlier version of poltoratski2024; denisov2026 line 211–212 poses almost-everywhere convergence (Q2R) as a question.
- **Scope.** README line 144–146 and 2669–2670 say that the moduli compared in §9 of poltoratski2024 version 14 (Ann. of Math. 2024) do not determine the motion of a resonance, and do not use that step; no cached source says this of version 14.
- **Scope.** §8.6, §8.8, §8.9 and §9.1–§9.3 feed no target of this roadmap (§9.5 uses only §8.7(3)); README line 2659–2660 assigns them to a downstream proof.
- **Not tested.** poltoratski2024, the source with the largest share, is an OCR of an image-only scan; formula lines 1253–1347 are partly garbled, so wording there was compared on the readable words only.
- **Not tested.** garnett2007 (uncertified) and coddingtonlevinson1955, debranges1968, remling2018 (waived) were not read: their 19 citations are untested for wording and support; krein1955 appears only under References.
