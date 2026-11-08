# Review of SpecialFunctionsParabolicCylinder (pull request #1801 at 78d0f47)

**Verdict:** needs changes

This is an incremental re-review of 87 changed lines since 1c58a9d (`TauCetiRoadmap/SpecialFunctionsParabolicCylinder/README.md` +54/−33, `Suggested.lean` −4; nothing changed outside the folder).

- All six findings of the previous review are repaired.
- Two of the repairs added new proof-route text, in 6.1 and 8.1, and both new paragraphs contain a defect. These are the two findings below, both P3.
- No statement is false.
- The gate passes.

## R01 (P3) — The 8.1 route does not reach 12.12.4: its left side contains `V`, which 6.1 does not represent

**Location.** `README.md` lines 1074–1075: "The proof route: 12.12.1, 12.12.3 and 12.12.4 by inserting 6.1 and Fubini for `Re a > −½`, then the identity theorem in `a`". Also line 1081: "*Needs:* 4.1, 6.1 and 7.4; Mathlib `MeasureTheory.integral_integral_swap`, the Gamma integral and the identity theorem."

**Claim.** Inserting 6.1, then Fubini, proves 12.12.4.

**Witness.** The left side of 12.12.4 is `U(a, z)² + Ū(a, z)²`, where `Ū = Γ(½ − a) V(a, z)`, and 6.1 represents only `U`. At `a = 0.2+0.1i`, `z = 0.6+0.3i` the 6.1 integral gives `U = 0.8269723044−0.2172531994i`. It cannot give `V = 0.9375362188+0.0714360388i`. Turning `Ū` into values of `U` needs 12.2.20, which is in 3.5, and the *Needs* line does not list 3.5.

**Repair.**

1. Replace the first sentence of the route paragraph with: "The proof route: 12.12.1 and 12.12.3 by inserting 6.1 and Fubini for `−½ < Re a`, then the identity theorem in `a`. 12.12.1 also uses the Beta integral and the duplication formula; the right side of 12.12.3 is 6.1 at parameter `−a`."
2. Add, for 12.12.4: "12.2.20 (3.5) gives `U(a, z)² + Ū(a, z)² = (2/π) Γ(½ − a)² U(−a, iz) U(−a, −iz)` for `Re a < ½`. Insert 6.1 with parameter `−a` in both factors; this is valid on the whole half-plane `Re a < ½`, so no continuation in `a` is needed. Change variables to `u = s − r`, `p = sr`, with `ds dr = du dp/√(u² + 4p)`. Write `1/√(u² + 4p) = π^{−½} ∫₀^∞ λ^{−½} e^{−λ(u² + 4p)} dλ` and apply Fubini. The `p`-integral is a Gamma integral and the `u`-integral is a Gaussian. Finally put `λ = (e^{2t} − 1)/4`."
3. Write the *Needs* line as: "3.5, 4.1, 6.1 and 7.4; Mathlib `MeasureTheory.integral_integral_swap`, `Complex.integral_cpow_mul_exp_neg_mul_Ioi`, `integral_cexp_quadratic`, `Complex.Gamma_mul_Gamma_eq_betaIntegral`, `Complex.Gamma_mul_Gamma_add_half` and the identity theorem." All five Mathlib declarations exist at the pin (see Verified sound).

**Tested.** I checked the product identity and the intermediate `λ`-integral `(2/π) Γ(½ − a) ∫₀^∞ λ^{−½} (1 + 4λ)^{a−½} (½ + λ)^{−½} e^{z²λ/(1+2λ)} dλ`.

| `(a, z)` | `U² + Ū²` | product identity, error | `λ`-integral, error |
|---|---|---|---|
| `(0.2+0.1i, 0.6+0.3i)` | `5.3932513430+4.8316267403i` | 1.1e-14 | 1.9e-14 |
| `(−1.1, 1.2)` | `0.7516780306` | 1.6e-15 | 6.7e-16 |
| `(0.4, −0.5+0.2i)` | `70.2911071466−5.8958612769i` | 3.0e-14 | — |
| `(−½, 0)` | `1` | 4.4e-16 | — |

The substitution `λ = (e^{2t} − 1)/4` turns the integrand into `√2 e^{2at + z² tanh t/2}/√(sinh 2t) dt`, which is 12.12.4.

## R02 (P3) — The 6.1 route: the dominating function does not bound the `z`-derivative, and matching 3.2 needs the duplication formula

**Location.** `README.md` lines 730–736: "by differentiation under the integral sign with the dominating function `t^{Re a−½} e^{−t²/2 + Rt}` for `|z| < R`; it solves Weber's equation, by two integrations by parts in `t`; and its value and derivative at `z = 0` are Gamma integrals equal to those of 3.2". The *Needs* line omits the duplication formula.

**Claim.** The stated function is the dominating function for `hasDerivAt_integral_of_dominated_loc_of_deriv_le`, and the inputs listed in *Needs* identify the Gamma integrals with 3.2.

**Witness.**

- The lemma bounds `‖F' x a‖`, the derivative (Mathlib `Analysis/Calculus/ParametricIntegral.lean` line 572). At `a = 0`, `R = 1`, `z = −0.99`, `t = 3` the `z`-derivative has modulus `0.37505`, but the stated bound is `0.12882`.
- The integral gives `U(a, 0) = 2^{a/2−¾} Γ(a/2+¼)/Γ(a+½)`. That equals 3.2's `√π 2^{−a/2−¼}/Γ(¾+a/2)` only by duplication.

**Repair.** Write the route as: "the right side is entire in `z`, by differentiation under the integral sign with the dominating function `(1 + t) t^{Re a−½} e^{−t²/2 + Rt}` for `|z| < R`, which bounds both the integrand and its `z`-derivative. Write `I(z)` for the integral. It solves Weber's equation, because `I″ − zI′ − (a + ½) I` is the integral of `−∂_t(t^{a+½} e^{−t²/2 − zt})`, whose boundary values vanish for `Re a > −½`. Its value and derivative at `z = 0` are Gamma integrals, and the duplication formula turns them into those of 3.2." Then add `Complex.Gamma_mul_Gamma_add_half` to the *Needs* line.

**Tested.**

- **Repaired bound.** At the witness point it is `4 × 0.12882 = 0.51530 ≥ 0.37505`.
- **Integration by parts.** `I″ − zI′ − (a + ½) I` is `2.8e-16` at `(a, z) = (0.3+0.2i, 0.7−0.4i)` and `3.4e-13` at `(−0.3+0.5i, −1.1+0.6i)`. The pointwise exact-derivative identity holds to `4e-11` at `t = 1.7`.
- **Values at `z = 0`.**
  - `U(a, 0)`: the integral gives `1.2690724982+0.0071675380i`, equal to 3.2's value.
  - `U′(a, 0)`: `−0.8727079545−0.1602834795i` on both sides.
  - Duplication at `a = 0.3+0.2i`: `Γ(a+½) = 1.0935335478−0.2072318785i` on both sides.

## Previous findings

- R01 — repaired: 8.1 now routes 12.12.2 through "`U(a, t) = t U(a + 1, t) + (a + 3/2) U(a + 2, t)` (12.8.1, from 4.1), insert 6.1 for `a + 1` and `a + 2`", and *Needs* lists 4.1. 6.1's *Needs* lists the two Mathlib lemmas and drops Tau Ceti's bounded-kernel lemma. The new route text has the defects in R01 and R02 above.
- R02 — repaired: option (b). Lines 100–103 now read "It also owns, as library material on `Γ` that no layer here uses and that AsymptoticExpansions leaves to the special-function roadmaps, the product … (6.6(a))". 6.7's *Needs* is "3.5, 6.1, 6.6(b) and 6.6(c)". The summary, scope item 6 and Dependencies are updated to match.
- R03 — repaired: 9.5 now states both forms as identities in `ℂ` for real `a, x`, derives the second from 1.4, and its *Needs* is "1.4, 2.1 and 9.1".
- R04 — repaired: 3.2 adds "`V(−½, 0) = 0` and `V′(−½, 0) = √(2/π)`" and "`V(3/2, z) = √(2/π) z e^{z²/4}`" with their wrong models (values below).
- R05 — repaired: `parabolicCylinderU_neg_one_half` is deleted from `Suggested.lean`, and 5.1's first bullet carries no Lean name. No roadmap on main or at an open head cites the name.
- R06 — repaired: line 126 reads "See [Excluded material](#excluded-material) for these", and the heading is now `## Excluded material`. "Contributors should not attempt it" is gone.

## Verified sound

**Gate, build and elaboration.**

- The worker's gate at 78d0f47 passes every check, `build=0` included. My rerun of `gate … --base origin/main` also prints `OK`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `lake env lean` on `Suggested.lean` exits 0 in 8.8 s. Its only warnings are 70 `declaration uses sorry` (70 theorems and 11 definitions with real bodies, 81 declarations in all).
- A probe copy with `#check @name` for all 81 declarations also exits 0.
- The file has no `variable`, `include`, `set_option`, `lemma`, `#eval` or `#print`, so no binder can be lost. The only Lean change is the deletion. I compared the elaborated types of the statements whose README text changed with the README:
  - `parabolicCylinderU_eq_integral`: `-1/2 < a.re`, all `z`;
  - the four 12.12 statements: `0 < μ.re` for 12.12.1; `a.re < -1/2` for 12.12.2; `a.re < 1/2` and `0 < x` for 12.12.3; `a.re < 1/2` and the integrand `cexp (2*a*t + z^2*tanh t/2)/√(sinh (2t))` for 12.12.4;
  - `hasProd_Gamma_norm_quotient` (`∀ n, x ≠ -n`) and `norm_Gamma_one_add_mul_I_sq` (`y ≠ 0`).

  They match the README.

**Dependency check.** `gate --depcheck … --movable` prints `depcheck: 237 roadmaps, 2420 edges, 0 problem(s)`, with no UPWARD or CYCLE line.

**Cross-roadmap citations of the changed text.**

- AsymptoticExpansions at its head:
  - line 94–95 lists "Gamma-function identities such as the product formula DLMF 5.8.3" under what it does not own;
  - lines 1532–1536 say this roadmap "keeps its particular Barnes kernels and the Gamma product identities".

  This supports the new sentence at README lines 100–103.
- `roadmaps grep` for `5.8.3`, `πy/sinh`, `hasProd_Gamma`, `norm_Gamma…sq` over main and the 470 open heads finds no other owner.
- `roadmaps grep` for `parabolicCylinderU_neg_one_half` and for this README's old anchor finds no citation. The two `#beyond-this-roadmap…` hits in SpecialFunctionsEiLiErfIncompleteGamma (its README lines 124, 1608) are that roadmap's own in-page anchors.
- The consumers' citations still resolve:
  - QuantumFoundations cites §1.3 and §1.6;
  - SpecialFunctionsEiLiErfIncompleteGamma cites §5.1 and §5.3 and the names `differentiable_dawson` and `hasDerivAt_dawson` (Lean lines 241, 244);
  - SpecialFunctionsAiry cites §1.3 and `regularizedHGFun_kummer_equation` (Lean line 56).
- `overlaps.md` lists nothing dropped and no other pull request changing this roadmap.

**Library declarations opened at the pins (Mathlib 1b1ccf4).**

- `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (`Analysis/Calculus/ParametricIntegral.lean` 569, `h_bound` at 572).
- `MeasureTheory.integral_Ioi_mul_deriv_eq_deriv_mul` (`MeasureTheory/Integral/IntegralEqImproper.lean` 1403).
- `MeasureTheory.integral_integral_swap` (`MeasureTheory/Integral/Prod.lean` 481).
- `Complex.Gamma_eq_integral` (`Analysis/SpecialFunctions/Gamma/Basic.lean` 319).
- `Complex.integral_cpow_mul_exp_neg_mul_Ioi` (same file, 372, namespace `Complex`, `0 < a.re`, real `r > 0`).
- `Complex.Gamma_mul_Gamma_eq_betaIntegral` (`Gamma/Beta.lean` 124).
- `Complex.Gamma_mul_Gamma_add_half` (`Gamma/Beta.lean` 580).
- `integral_cexp_quadratic` (`Analysis/SpecialFunctions/Gaussian/FourierTransform.lean` 174, `b.re < 0`, complex `c d`).
- `integral_gaussian_complex` (`Gaussian/GaussianIntegral.lean` 236).

Neither pin has DLMF 5.8.3 or `|Γ(1+iy)|²` as a declaration. Remark on untouched text, not a finding: Tau Ceti `TauCeti/Probability/Distributions/Logistic/Transforms.lean` (lines 263–283) derives `Γ(1 − ist)Γ(1 + ist) = πst/sinh(πst)` inside the proof of `charFun_logisticMeasure`. It does so from `Complex.Gamma_add_one` and reflection, as a `have`, so 6.6(a) duplicates no named lemma.

**Sources in the changed passages** (cached DLMF texts; I copied no passage):

- 5.1: 12.7.1–12.7.4 at `dlmf127` lines 71, 95, 127, 181.
- 6.1: 12.5.1 at `dlmf125` line 69, with hypothesis `Re a > −½` at line 71.
- 8.1:
  - 12.12.1–12.12.4 at `dlmf1212` lines 47–49, 76–78, 106–108, 148–150;
  - the Nicholson-type label and the Durand (1975) attribution of 12.12.4 at lines 134, 38–39;
  - 12.8.1 at `dlmf128` lines 62–63.
- 9.5: 12.14.15–12.14.16 at `dlmf1214` lines 805, 838, both with unregularized `M = Γ(b)𝐌`, as the README's `Γ(½)𝐌` and `Γ(3/2)𝐌` render. Kummer's transformation 13.2.39 is at `dlmf132` lines 1531–1532.
- The repair of R01 uses 12.2.20, at `dlmf122` line 757, owned by README 3.5 as `parabolicCylinderV_eq_add_rotation`.

Seeded-sample targets outside the changed passages (1.5, 2.2, 2.4, 3.4, 4.1–4.3, 5.2, 5.3, 6.5, 7.1, 9.1, 9.4) are untouched and were verified in the previous review.

**Headline theorems.** These are unchanged: the nine milestones of Scope and ownership, stated in `Suggested.lean` as 70 theorems. The only Lean change removes padding (r4 R05); the README keeps that statement in 5.1 and as a 3.2 Check. No headline was lost, and no new declaration needs a padding probe.

**Adversarial table: changed statements, recomputed** with a pure-Python implementation of the pinned definitions (series for `u₁`, `u₂`, reciprocal-Gamma `U` and `V`, double-exponential quadrature).

| Statement | Instances | Values (left / right) | Result |
|---|---|---|---|
| 3.2 Check `V(−½, 0)`, `V′(−½, 0)` | sign of `u₂` term flipped | `0`; `0.7978845608` / `√(2/π) = 0.7978845608`; flipped model `−0.7978845608` | holds, discriminating |
| 3.2 Check `V(3/2, z)` | z = 0.7−0.4i, −1.2+0.5i; `Γ(¼−a/2)⁻¹` model | `0.5522508725−0.4278495180i` both (6.2e-16); 1.0e-15; wrong model `−1.9576783713+1.5166870514i` = `−2√2 z e^{z²/4}` (8.0e-16) | holds, discriminating |
| 5.1 `U(−½, z)` (name removed) | statement unchanged | r4: closes from `parabolicCylinderD_natCast 0` | prose only |
| 6.1 route | (0.3+0.2i, 0.7−0.4i), (−0.3+0.5i, −1.1+0.6i) | `I″−zI′−(a+½)I` = 2.8e-16, 3.4e-13; `U(a,0)` integral `1.2690724982+0.0071675380i` = 3.2; `\|∂_zF\|`/bound at t = 3: 2.91 | statement holds; R02 |
| 6.6(a) recast as owned library material | r4 values | 5.8.3 at x = 1.3, −1.5, −0.25: `1.673166906`, `16.451369461`, `23.701563554` both (r4) | holds, unused, now declared so |
| 6.7 *Needs* | 6.6(b), 6.6(c) only | residues `1, −1, ½, −⅙`; corrected 12.5.8 errors ≤ 3.0e-13 (r4) | consistent |
| 12.12.1 route (6.1, Fubini, Beta, duplication) | (0.3+0.2i, 1.4+0.3i), (−0.2+0.1i, 0.6−0.2i) | direct = Beta form = right side: `0.7861865371−0.1763596102i`; `1.6741833270+0.5127428520i` | holds |
| 12.12.2 route via 12.8.1 | a = −1.2+0.3i, −0.8−0.25i | direct `0.6670339423+0.4412785583i`, route same (5.0e-16), right side same; `1.2839343555−1.5130244251i` (3.9e-15); 12.8.1 residual 9e-16 | holds |
| 12.12.3 route (6.1 at a and −a) | (0.3, 1.5), (−0.2+0.1i, 0.8) | direct = after-Fubini form = right side: `2.4691173844`; `1.7533318928+0.3218112799i` | holds |
| 12.12.4 | as in R01; also third-order equation `y‴ = (z²+4a)y′ + zy` for the integral | Nicholson side agrees to ≤ 4.5e-9; the 6.1 integral gives `U`, not `V`; product and `λ` forms ≤ 3.0e-14; equation residual 3.5e-10, 6.3e-10 | statement holds; R01 |
| 9.5 both forms | (a, x) = (0.3, 1.1), (−1.1, 0.7), (2, 1.9) | `w₁` = `1.154128793319`, `0.738002792173`, `6.465338849007`; `w₂` = `1.146977995301`, `0.636805157853`, `4.582489977666`; definition, first and second forms agree within 2.7e-15; conj(first) − second = 0 | holds |
| Excluded-material pointer | anchor | `## Excluded material` exists at line 1277, and the link resolves | holds |

**Adversarial table: untouched statements**, carried from the previous review at 1c58a9d (its values; I did not recompute them):

| Statement | Values in r4 | Result |
|---|---|---|
| 12.2.6, Check `U′(½,0) = −1` | `1.269072498+0.007167538i` both; `−1.0000000000` | holds |
| 12.2.10–12.2.12 | `0.7978845608`; `2.212761652+0.419333046i`; upper `0.6946542388−0.2257068443i` | holds |
| 3.5, 3.4, 3.6 | residuals ≤ 1.2e-14; vanishing coefficient; 2.0e-9 with `s⁴ = −4α` | holds |
| 12.8.1, 12.8.2, 12.8.9 | ≤ 1.2e-9 | holds |
| 12.7.1–12.7.4, `F(iy)`, 12.7.7, 12.7.5, 5.2 | ≤ 8.3e-15; `1.247258307i`; ≤ 2.3e-15; `0.5649295345`; `−0.4955243438` | holds |
| 12.5.1–12.5.9 | ≤ 2.4e-5 (endpoint quadrature); loop ≤ 1.1e-15; lines ≤ 1.3e-15; corrected 12.5.8 ≤ 3.0e-13, 12.5.9 ≤ 1.8e-7 | holds |
| 6.6(b), 6.6(c), `\|Γ(1+iy)\|²` | `1, −1, ½, −⅙`; `−1.00265−0.62666i`; `0.4938431207` both | holds |
| 7.1, 12.9.1–12.9.4, 7.4 | ≤ 9.4e-8; bounded `\|rem\|·r^{2N}`; ratios 0.962–1.007 | holds |
| 12.13.1, 12.13.5 | `0.5144502366−0.0068118059i`; README form right, DLMF display wrong unless a = −½ | holds |
| 9.1–9.4, φ₂, 12.14.13–12.14.14, 12.14.23 | Wronskian `0.99999999999`; `0.5001012720`; `φ₂′(0) = −1.963507`; `0.5724433628`; bounded `\|s−S_N\|x^{2N}` | holds |

## Not verifiable

- Durand (1975), the source DLMF names for 12.12.4 (`dlmf1212` line 39), was not read; it is a print article. The route proposed in R01 is not taken from it: I derived it from 12.2.20 and 6.1 and checked it numerically.
- Olver (1974), Temme (1996), Whittaker–Watson and Miller (1955) are print texts the changed passages do not cite anew.
- I checked ownership against open pull requests through the roadmap index (470 heads, 2026-11-08T11:58:47Z) and the AsymptoticExpansions head; nothing else was needed for the changed passages.

## Source issues

- none
