# Review of SpecialFunctionsBessel (pull request #1987 at cdb0847)

**Verdict:** needs changes

Full review of the restructured head. Eight findings: three false or unowned statements (R01–R03), one supplier drift (R04), four P3.

## R01 (P1) — 7.2: the derivative recurrence of the Kelvin functions is false for `ν ≠ 0`

**Location:** `TauCetiRoadmap/SpecialFunctionsBessel/README.md`, 7.2, lines 1204–1207: "`√2 f′_ν = f_{ν+1} + g_{ν+1} − (ν/x)(f_ν − g_ν) = −f_{ν−1} − g_{ν−1} + (ν/x)(f_ν − g_ν)` (10.63.2–10.63.3), and the order-zero cases … (10.63.4)".

**Claim:** Both right-hand sides are wrong, and they differ from each other. DLMF 10.63.2 has `+(ν/x) f_ν` and `−(ν/x) f_ν` after division by `√2`. The equation numbers are also off: all four identities are 10.63.2; the order-zero cases are 10.63.3 (`ber`, `bei`) and 10.63.4 (`ker`, `kei`).

**Witness:** `(ber, bei)`, `ν = 1`, `x = 1`: `√2 ber′₁(1) = −0.6741055576`; the README's two forms give `+0.5891615984` and `−1.9373727136`. DLMF-10.63 lines 113–117.

**Repair:** Replace by "`√2 f′_ν = f_{ν+1} + g_{ν+1} + (√2 ν/x) f_ν = −f_{ν−1} − g_{ν−1} − (√2 ν/x) f_ν` (10.63.2), and the order-zero cases … (10.63.3 for `ber`, `bei`; 10.63.4 for `ker`, `kei`)". Both forms give `−0.6741055576` at the witness, and `0.2717851554` for `(ker, kei)` at `ν = 0.7`, `x = 1.1`. Add the witness as a Check.

## R02 (P1) — 6.3: the variation of `t^{−ℓ}` along the stated paths exceeds the bounds 10.17.15 and 10.40.12

**Location:** README 6.3, lines 1098–1110 ("for `0 ≤ ph z ≤ π`, `P(z)` is the ray `z + is`" … "The bounds 10.17.15 and 10.40.12 are stated for these paths"), the Checks at lines 1117–1122, and Scope lines 149–150.

**Claim:** None of the five path families satisfies the bound claimed for it, except on the positive imaginary (for `K`: real) axis. The bounds of DLMF hold for other paths.

**Witness:** `ℓ = 1`. Ray `z + is` at `z = 1`: variation `π/2 = 1.5708 > |z|⁻¹ = 1`. `P(−i)`: `π + 1 = 4.1416 > χ(1) = 1.5708`. `z = −1 − i`: `4.9270 > 2χ(1) = 3.1416`. `K`, `z = i`, ray `z + s`: `1.5708 > 1`.

**Repair:** Use, with the closing arc `|t| = R` and `R → ∞` (its variation is `O(R^{−ℓ})`):
- `R⁺`, `0 ≤ ph z ≤ π`: the radial ray `t = zs`, `s ≥ 1`; variation `|z|^{−ℓ}` exactly.
- `R⁺`, `−π < ph z < 0`: the horizontal ray `t = z + s`, `s ≥ 0`; variation `≤ χ(ℓ)|z|^{−ℓ}` for `Re z ≥ 0` (ratio to the bound at most `1.0` over 21 directions, `ℓ = 1, 2, 3, 5`) and `≤ 2χ(ℓ)|Im z|^{−ℓ}` otherwise (`2.3562 ≤ 3.1416` at `z = −1 − i`).
- `K`: the same rotated by `−π/2`: the radial ray for `|ph z| ≤ π/2`; the vertical ray `t = z ± is` away from the real axis for `π/2 < |ph z| < π`.

`Im t` (respectively `Re t`) is nondecreasing on each. State 10.17.14 and 10.40.11 with the limits of the variations, and replace the Checks at lines 1117–1122: at `z = −i` the horizontal ray gives exactly `χ(ℓ)`.

## R03 (P1) — 5.4 owns DLMF 10.54.4–10.54.5, which are integrals of the Legendre function `Q_n`

**Location:** README 5.4, line 995: "DLMF 10.54.1–10.54.5, 10.55.1 and 10.56.1–10.56.5. 10.54.2–10.54.3 use `P_n(x)`".

**Claim:** 10.54.4 and 10.54.5 are loop integrals of `e^{izt} Q_n(t)`. No supplier provides `Q_n`, and Scope (lines 170–174) excludes the formulas through Legendre functions. The targets have no carrier.

**Witness:** DLMF-10.54 lines 145–186: `𝗃_n`, `𝗁⁽¹⁾_n`, `𝗁⁽²⁾_n` as contour integrals of `Q_n(t)`. SpecialFunctionsLegendre (open), `README.md` lines 1566–1568, assigns the Chapter 10 formulas through Legendre functions to a later roadmap.

**Repair:** In 5.4 write "DLMF 10.54.1–10.54.3"; add 10.54.4–10.54.5 to the excluded list at lines 172–174 and to the Legendre item of "Beyond this roadmap" (lines 1800–1805).

## R04 (P2) — the LaguerreJacobi citations name ids and a declaration that its head does not have

**Location:** README lines 62 ("LaguerreJacobi (its F1–F2)"), 387–394 ("(its F2)", "`Polynomial.shiftedLegendre_eq_jacobi_comp` (its F1)"), 895 ("LaguerreJacobi F1–F2"); the pull request description ("(F2) and the Legendre–Jacobi link (F1)").

**Claim:** At the head of the LaguerreJacobi pull request there is no `F1` or `F2`, and no `Polynomial.shiftedLegendre_eq_jacobi_comp`.

**Witness:** LaguerreJacobi `README.md` at its open head: `### 6.1 Legendre` (line 695), `### 6.2 Gegenbauer` (line 719), and `Polynomial.shiftedLegendre_map_eq_jacobi_comp` (line 702; `Suggested.lean` line 426).

**Repair:** Write "its §§6.1–6.2", "(its §6.2)", "`Polynomial.shiftedLegendre_map_eq_jacobi_comp` (its §6.1)" and "*Needs:* … LaguerreJacobi §§6.1–6.2"; the same in the description.

## R05 (P3) — 5.4: DLMF has no equation 10.55.1, and the continued fraction is not stated

**Location:** README line 995, "10.55.1", under the heading "Lambert's fraction".

**Claim:** DLMF §10.55 contains no numbered equation, only a pointer to another work. The target has no statement.

**Witness:** DLMF-10.55 lines 42–44.

**Repair:** Replace "10.55.1" by the statement: "for `z ≠ 0` and `𝗃_n(z) ≠ 0`, `𝗃_{n+1}(z)/𝗃_n(z) = 1/((2n + 3) z⁻¹ − 1/((2n + 5) z⁻¹ − ⋯))`, the case `ν = n + 3/2` of 10.10.1 (4.5), and the `𝗂⁽¹⁾` analogue from 10.33.1". At `n = 0`, `z = 1`: `1 − cot 1 = 0.3579074`, and four levels of the fraction give `0.35791`.

## R06 (P3) — 8.1 and 8.3 state the parabolic cylinder relations on sectors narrower than they hold

**Location:** README 8.3, lines 1312–1313: "for `|ph z| < π/4`"; 8.1, line 1274: "10.39.3–10.39.4 through `U(a, 2z^{1/2})` on `|ph z| < π/2`".

**Claim:** DLMF states both with corresponding principal values and no sector. Both sides are holomorphic on `|ph z| < π/2` (8.3) and on the slit plane (8.1), so the identities hold there.

**Witness:** 12.7.8–12.7.11 at `z = 1.2 e^{0.4πi}`: all four differences `0` to `10⁻¹⁰`. 10.39.3–10.39.4 at `z = 1.3 e^{0.8πi}`: both differences `0`.

**Repair:** 8.3: "for `|ph z| < π/2`". 8.1: "for `z` in the slit plane".

## R07 (P3) — the renumbering breaks section citations in roadmaps on main, with no mapping

**Location:** README: no former-numbering map. Description: "SpecialFunctionsStruve, SpecialFunctionsConfluent and SpecialFunctionsMathieu cite this roadmap by section number. … their citations are being updated to the new numbers."

**Claim:** Two roadmaps on main cite sections by the former numbers, and the description does not name them. No roadmap SpecialFunctionsMathieu exists on main or among the open pull requests.

**Witness:** `TauCetiRoadmap/SpecialFunctionsHypergeometric/README.md:1131`: "SpecialFunctionsBessel 8.2 … 10.22.49" (here 11.2). `TauCetiRoadmap/SpecialFunctionsAiry/README.md:1635–1639`: "its 4.3", "its 3.1", "its 11.1" (here 8.1, 5.1, 8.2).

**Repair:** Add to the README a table headed "Former numbering | Section", one row per moved section, with at least `3.1 → 5.1`, `4.3 → 8.1`, `8.2 → 11.2`, `11.1 → 8.2`. In the description, name SpecialFunctionsAiry and SpecialFunctionsHypergeometric as citing the former numbers, and drop SpecialFunctionsMathieu or say it is not yet opened.

## R08 (P3) — 10.22.57 is excluded as a Gauss-function formula, but it has none

**Location:** README lines 170–174 and 1800–1805: "the formulas through the Gauss hypergeometric function other than DLMF 10.22.49 and 10.22.64 (… 10.22.56–10.22.58 …)".

**Claim:** The right side of 10.22.57 (the case `b = a` of 10.22.56) is a quotient of Gamma functions. The stated reason does not apply, and no roadmap named there owns it.

**Witness:** DLMF-10.22, equation 10.22.57: four Gamma functions and a power of `a/2`; no `𝐅`.

**Repair:** Write "10.22.56, 10.22.58" in both lists and add 10.22.57 to 11.2 ("10.22.51–10.22.55, 10.22.57, …"), with DLMF's condition `Re(μ + ν + 1) > Re λ > 0`.

## Previous findings

- R01 of the review at `2022935` (the description counted seven suppliers): repaired. The description now reads "The README links into all eight. `Suggested.lean` imports none of them: it imports only Mathlib, `TauCeti.Analysis.SpecialFunctions.BesselI` and `TauCeti.Analysis.SpecialFunctions.RegularizedHypergeometric`."

## Verified sound

Values computed with mpmath at 20 digits; "0" means below `10⁻¹⁰`. `J`, `Y`, `K`, `I` on the right are mpmath's.

| Statement | Instance | Left side | Right side | Result |
|---|---|---|---|---|
| Definitions 10.2.4, 10.27.5 (`besselY`, `besselK` at integers) | `n = 0, 1, −2, 3`; `z = 0.7 + 1.1i` | `deriv` forms of `Suggested.lean` | `Y_n(z)`, `K_n(z)` | differences 0 |
| 1.6 (sampled), `hankelH2_neg` | `ν = 0.3`; `z = 1 + 2i`, `−1 + 0.3i`; control `z = 1 − i` | `H⁽²⁾_ν(−z) + e^{νπi} H⁽¹⁾_ν(z)` | `0`, `0`; control `2.170 + 3.368i` | holds; hypothesis needed |
| `besselK_eq_hankelH1` | `ν = 0.3, 2, 0.2 + 0.5i`; `z = 2, 1.5i, 1 − 2i, −1 − 0.5i`; control `−1 + 0.5i` | `K_ν(z) − ½πi e^{νπi/2} H⁽¹⁾_ν(iz)` | `0`; control `−1.70 − 6.97i` | holds; hypothesis needed |
| 10.5.2, 10.28.2, 10.6.1 for `Y` | `ν = 0.3, 0, −2, 0.2 + 0.5i`; `z = 0.7 − 1.1i` | each side | each side | differences 0 |
| 2.1 (sampled) | 10.8.1–10.8.3, 10.31.1–10.31.3 at DLMF; 10.8.2 at `z = 1` | `0.0882569642` | `Y_0(1)` | agrees |
| 2.2 (sampled), `tendsto_besselY_div_cpow` | `z = 10⁻⁷(1 + i)`; `ν = ½, 2, 0.3 + i` | `−0.5641896`, `−0.3183099`, `−0.04630 + 0.16070i` | `−Γ(ν)/π`: `−0.5641896`, `−0.3183099`, `−0.04628 + 0.16071i` | agrees |
| 2.3 (sampled), 10.47.3 | `n = 1`, `z = 1` | series: `0.3011686789` | `sin 1 − cos 1` | agrees |
| 3.2 (sampled) | 10.49.19 `n = 1`, `z = 1`; 10.50.4 `n = 2`, `z = 2` | `1 + 1 = 2`; `−(¼ − 3/16)` | `2`; `−1/16` | agrees; 10.49–10.53 read at DLMF |
| 4.3 (sampled), `hasSum_besselJ_gegenbauer`, `hasSum_cexp_gegenbauer` | `(ν, u, v, α) = (1, 2, 1, π/3)`, `(−½, 1.2 + 0.4i, 0.3 − 2i, 0.7 + 0.3i)`, `(−2.5, 1.5, 0.7, 0.4)` | `𝐅(ν + 1)(−w²/4) = 0.6690524776` (first) | 45 terms | differences 0 |
| `hasSum_hankelH1_gegenbauer` | `(0.7, 2 + i, 0.5 + 0.4i, 0.9)`, `(0.3 + 0.6i, 1 − 3i, −1.5 + 0.2i, 0.5 + 0.2i)` | `0.136808 − 0.100303i`; `6.0723 + 8.0096i` | 60 terms | differences 0 |
| 4.4 (sampled) | 10.23.12, `z = 0.6 + 0.2i`, `t = 1.7`; `O₁`, `O₂` from 10.23.13 | `1/(t − z) = 0.88 + 0.16i` | series side not recomputed | left side agrees with the Check |
| 4.5 (sampled), `tendsto_convs_besselJ` | `(ν, z) = (½, 1.3)`, `(−5, 1 + i)`, `(0.2 + i, −2 + 0.5i)`, `(0, 1)` | 60th convergent | `J_ν/J_{ν−1}` | differences 0 |
| 5.1 (sampled), `besselY_eq_schlafli`, `besselK_eq_integral`, `besselK_ofReal_eq_positiveAxisBesselK` | `ν = 0.3, 2, 0.3 + 0.2i`; `z = 1.2 + 0.5i`; `x = 1.3` | integrals | `Y_ν(z)`, `K_ν(z)`, `K_ν(x)` | differences 0 |
| 5.2 (sampled) | DLMF 10.9.17–10.9.21, 10.32.12 | Sommerfeld (17–18), Schläfli (19), Hankel (20–21) | README's description | locators agree; no value |
| `besselJ_sq_add_besselY_sq` | `ν = 0.3, 2, 0.3 + 0.2i`; `z = 1.2 + 0.5i` | `J² + Y²` | Nicholson's integral | differences 0 |
| 5.4 (sampled) | DLMF 10.54.4–10.54.5; §10.55 | `Q_n` integrals; no equation | README's "10.54.1–10.54.5, 10.55.1" | R03, R05 |
| `isBigO_besselK_sub_sum` | `ν = 0`, `x = 10`, three terms | `1.79935×10⁻⁵ (1 − 1/80 + 9/12800) = 1.77812×10⁻⁵` | `K_0(10) = 1.77801×10⁻⁵` | agrees; remainder after one term `−0.01186`, within `1/80` |
| 6.3 | R02's instances | variations `1.5708`, `4.1416`, `4.9270` | bounds `1`, `1.5708`, `3.1416` | R02 |
| 7.2 | R01's instance; 10.64.1, 10.66.2 at `n = 0, 1, 2`, `x = 0.8`; `hasSum_kelvinBer` at `ν = 0.3, −1.5, −2`, `x = 1.7` | — | — | R01; the others differ by 0 |
| `kelvinModulus_kelvinPhase` | `ν = ½`, `x√2 = √2` | `1 + π/8 + Arg(1 − e^{−2(1+i)}) = 1.5086751752` | `arg J_{1/2}(√2 e^{3πi/4}) = 1.5086751752` | agrees |
| 8.1 (sampled), `besselJ_eq_kummer` | `ν = 0.3, −0.2 + 0.7i, −1.25`; `z = −0.5 + 0.8i` | `J_ν(z)` | Kummer form | differences 0 |
| 8.3 (sampled) | 12.7.8–12.7.11, `z = 1.2 e^{0.4πi}` | `U(a, z)`, `a = −2, −1, 0, 1` | `K` forms | differences 0; R06 |
| 8.4 (sampled) | 6.7.15–16, 6.10.4–8, 7.6.8–11, 8.6.6, 8.7.4–5, 8.21.16–17 at DLMF | functions and series as the README names them | — | locators agree |
| `airyAi_eq_besselK` | `z = 1`, `1.5 e^{0.6πi}`, `0.7 e^{−0.3πi}` | local `airyAi` | `Ai(z)`; `K_{1/3}` form | differences 0 |
| `isBigO_besselI_debye` | `ν = 10`, `z = 1` | leading term `21.86488` | `I_{10}(10) = 21.89171` | agrees |
| `isBigO_besselI_debye_atTop`, `isBigO_besselK_debye_atTop` | `ν = 1`, `ℓ = 2`; `z = 10, 100, 1000` | bracket remainder times `z²`: `0.0732, 0.0710, 0.0704` (`I`) | `0.0601, 0.0695, 0.0702` (`K`) | bounded |
| 10.3 (sampled), `besselJZero_succ_sub_besselJZero` | gaps minus `π`: `ν = −0.3`, `0.2`, `−0.7`, `−2.5`, `3` | `−0.0223`, `−0.0190`, `+0.0583`, `+0.3505`, `+0.2393` | sign of `\|ν\| − ½` | agrees, negative orders included |
| 10.3, higher monotonicity | `Δ³ j_{1,1}`; control `Δ³ j_{0,1}` | `0.0183415704` | `−0.0142405266` | agrees |
| `isBigO_besselJZero_mcmahon` | `ν = 2`; `m = 5, 20, 80` | `(j − a + 15/(8a)) a³` | `−3.19, −3.17, −3.16` | bounded |
| `integral_besselJ_mul_besselJZero` | `ν = −½`, `l, m ≤ 2` | off-diagonal `−2×10⁻²⁶`; diagonal `0.2026423673` | `½ J′_ν(j)² = 0.2026423673` | agrees |
| `hasProd_besselJ` | `ν = 0.4`, `z = 1 + 0.5i`, 400 factors | product | `Γ(1.4) J_ν(z)/(z/2)^ν` | residual `2×10⁻⁴`, the tail |
| `exists_integral_cpow_mul_exp_mul_besselJ` | `μ = 1.3`, `ν = 0.7`, `a = 1`, `b = 2.5` | `0.2125729798` | `0.2125729798` | agrees, outside the disc |
| `tendsto_integral_besselJ_mul_besselJ` | `(μ, n, a, b) = (½, 1, 2, 1)`, `(½, 1, 1, 1)`, `(−1, 1, 2, 1)` | `0.3093592168`, `−0.5`, `−0.25` | `0.3093592168`, `(−1)¹/2`, `−b/a²` | agrees, pole of `Γ(μ + 1)` included |
| `tendsto_integral_besselJ` | 10.22.43 at `μ = 0` | `Γ(ν/2 + ½)/Γ(ν/2 + ½)` | `1` | agrees |
| `integral_cpow_mul_besselK` | `ν = 0.3 + 0.2i`, `μ = 1.5` | integral | Gamma product | difference 0 |
| `hasSum_planeWave` | `z = 1 + i`, `α = 0.4 + 0.3i`, 40 terms | sum | `e^{iz cos α}` | difference 0 |
| 10.8 | `ν = 1`, `A = B = 1`; `ν = 0`, `A = −1`, `B = 1` | `∫₀¹ t J_1(λ₁t)² dt = 0.1347570620` | norm formula `0.1347570620`; imaginary zero `1.6082794717` | agrees |
| 11.3 | `(a, b, c) = (3, 2, 1)`, `ν = ½` | `(2/π)^{3/2} 6^{−1/2} π/8 = 0.0814337520` | README's value | agrees; see Source issues |

- Source locators checked against the text: the DLMF equations of 46 sections of Chapters 6–10, 12 and 18 (Release 1.2.8), every range the README cites; equation text read for §§10.7–10.11, 10.16, 10.17, 10.21, 10.22, 10.32, 10.37, 10.39–10.41, 10.43, 10.49–10.56, 10.60, 10.61, 10.63–10.66, 10.71, 12.7, 6.7, 6.10, 7.6, 8.6, 8.7, 8.21.
- Library declarations opened at the pins: `Complex.besselJ` and 12 lemmas (`Mathlib/Analysis/SpecialFunctions/Bessel.lean` lines 55–123), `Real.besselI` and 14 lemmas (`TauCeti/Analysis/SpecialFunctions/BesselI.lean` lines 81–315). No pinned declaration of `Y_ν`, `K_ν`, Hankel, spherical or Kelvin functions.
- Cross-roadmap citations resolved: 8 suppliers. AsymptoticExpansions (12 sections), AnalyticNumberTheoryPartI §§2.1a, 3.23b, SpecialFunctionsAiry 1.4, 1.7, 4.1, 8.3, 9.3, SpecialFunctionsParabolicCylinder, SpecialFunctionsEiLiErfIncompleteGamma §4.1, SpecialFunctionsHypergeometric 1.2–1.4 on main; AutomorphicSpectralTheory §0.25 at its open head; LaguerreJacobi fails (R04).
- Gate at `cdb0847`: every rule `0`, `OK`. Dependency check: `depcheck: 253 roadmaps, 2398 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Nothing changed outside the folder.
- `lake env lean` of `TauCetiRoadmap/SpecialFunctionsBessel/Suggested.lean`: 50 warnings, all `declaration uses sorry`, no error. One-tactic probe (`simp`, `rfl`, `norm_num` on each of the 50 theorems): none closes. Elaborated signatures compared with the README: 0 lost binders, generality equal.
- Ownership searched by object across main and the 459 open pull requests (Sturm comparison, Neumann's polynomials, Bickley's function, the Kelvin functions, Dini series, 18.12.4, 18.18.17): no second owner. SpecialFunctionsConfluent cites Sturm comparison here (10.1).
- Overlap check: read SpecialFunctionsConfluent, SpecialFunctionsStruve, SpecialFunctionsLegendre (open), SpecialFunctionsAiry, SpecialFunctionsParabolicCylinder, SpecialFunctionsEiLiErfIncompleteGamma, SpecialFunctionsHypergeometric (main); nothing shared. 10.16.6–10.16.8, 10.39.6–10.39.8, 9.6.21–9.6.24, 12.7.14 are SpecialFunctionsConfluent's; 10.22.2, 10.43.2 SpecialFunctionsStruve's; 10.22.66, 10.22.71–72, 10.43.22 a Legendre roadmap's (10.54.4–10.54.5 belong with them, R03).
- Source independence: 9 passages compared with 1 source (DLMF-Bessel), none shared beyond a 12-word stock phrase on first-neglected-term bounds (6.3); largest share DLMF-Bessel (its equation numbers head every subsection; the six books together have about 285 page locators); contents compared with DLMF Chapter 10: independent (only Layer 3 ↔ §§10.47–10.53 and Layer 7 ↔ §§10.61–10.71 coincide; the other nine layers each draw on several sections of both halves of the chapter). The six books could not be read.

## Not verifiable

- Andrews–Askey–Roy, Beals–Wong, Lebedev, Olver, Temme, Whittaker–Watson: no legal open copy found by the sources service (Wiley returned HTTP 403; the others no source). None of the page, equation or theorem locators into them was checked; this covers the book locators of all 15 sampled targets, including Temme Theorem 9.3 and Andrews–Askey–Roy Theorem 4.15.1 for 10.3.
- DLMF §10.23: the service returned a figure instead of the page. 10.23.3, 10.23.8, 10.23.9 and 10.23.12 were checked by computation only.
- `check_roadmap_topics.py` (description) was not run; the gate's `metadata` rule reports `0`.

## Source issues

- **Error** in DLMF-Bessel at 10.22.74, §10.22(iv), Release 1.2.8: the source says the triple-product integral is zero whenever `A ≤ 0`, for all `Re ν > −½`; it should say `A < 0`, with `A = 0` giving zero only for `Re ν > ½` (half the `A > 0` limit at `ν = ½`, divergent at `ν = 0`); affects a stated result.
- **Error** in DLMF-Bessel at §10.17(iv), the text after 10.17.14, and §10.40(iii), after 10.40.11: the source says the paths of variation must have `|ℑt|` (respectively `|ℜt|`) changing monotonically; it should require `ℑt` (`ℜt`) itself to be monotonic, since no path from the lower half-plane to `+i∞` meets the stated condition, while 10.17.15 covers those sectors; affects a stated result.

## For the human reviewers

- **Not tested.** Wording and page locators were compared with DLMF only. The six books cited (Andrews–Askey–Roy, Beals–Wong, Lebedev, Olver, Temme, Whittaker–Watson) could not be read legally, so parts 1 and 2 of the copyright check were not run against them.
- **Licence.** The README (`## Prior formalization`, lines 1830–1856) and the description name the author's `lean-DLMF` (Apache-2.0, `github.com/bjbraams/lean-DLMF`) as source material; `Suggested.lean` was not compared with that repository.
