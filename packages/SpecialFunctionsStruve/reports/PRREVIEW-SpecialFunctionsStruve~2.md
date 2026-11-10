# Review of SpecialFunctionsStruve (pull request #2129 at e5efb18)

**Verdict:** needs changes

There are four findings: two P1, two P3.

- **Gate:** it fails on one forbidden import, which breaks the build (R01) and the import rule (R02).
- **False headline:** DLMF 11.11.8 is false for `0 < λ < 1` near the negative `ν`-axis, and the roadmap copies it into the README and `Suggested.lean` (R03).
- **Narrowed statement:** 11.10.4 drops a case that DLMF states (R04).

All thirteen findings of the previous review are repaired (see *Verified sound*). Every other sampled target and every other headline was recomputed and holds. That includes the new Hankel and Laplace representations of `S_{μ,ν}`, 11.6.6 with the power-series coefficients, and 11.11.17 for complex `ν`.

## R01 (P1) — Gate `build`: `Suggested.lean` imports another roadmap's module

**Location.** `TauCetiRoadmap/SpecialFunctionsStruve/Suggested.lean` line 5: `public import TauCetiRoadmap.SpecialFunctionsHypergeometric.Suggested`. It is used only by `lommelCapitalS_eq_laplace` (lines 290–296); the module docstring mentions it at lines 17–19.

**Claim.** The pull request description says: "`Suggested.lean` compiles at the pins of main with `sorry` as the only warning (26 headlines)".

**Witness.** `lake env lean` fails with "unknown module prefix 'TauCetiRoadmap'", and the gate build fails with "bad import". The branch (base `641eaf3`) has no SpecialFunctionsHypergeometric folder. The import rule forbids roadmap modules even after a rebase.

**Repair.** Delete line 5, then do one of the following:

- **(a)** Delete `lommelCapitalS_eq_laplace`. It is an auxiliary representation, not a headline. Remove its backticked name from README line 801 and the SpecialFunctionsHypergeometric clause from the docstring.
- **(b)** Keep it, but use local copies of SpecialFunctionsHypergeometric's `eulerIntegral`, `IsEulerContinuation`, `regularizedGaussHypergeometric` and `gaussHypergeometric`. Put them in the "Local copies" section, as is already done for `besselY`, and point the theorem at the local `gaussHypergeometric`.

Both were tested on scratch copies:

- (a) gives 25 `sorry` warnings and no error;
- (b) gives 26 `sorry` warnings and no error.

Also correct the description's "Build" and import sentences.

## R02 (P3) — Gate `imports`: the same line

**Location.** `Suggested.lean` line 5 (gate rule `imports`).

**Claim.** `Suggested.lean` imports only `Mathlib` and individual `TauCeti.*` modules.

**Witness.** `gate.md` lists `public import TauCetiRoadmap.SpecialFunctionsHypergeometric.Suggested` (line 5) as the single `imports` failure.

**Repair.** The same as R01. Line 4 (`TauCeti.Analysis.SpecialFunctions.RegularizedHypergeometric`) exists at the pin and stays.

## R03 (P1) — DLMF 11.11.8 is false for `0 < λ < 1` near the negative axis, and `isBigO_angerWeberA_scaled` states it

**Location.**

- README lines 983–984: "DLMF 11.11.8–11.11.9: for fixed `λ > 0`, `𝐀_ν(λν) ∼ π⁻¹ ∑ₖ (2k)! a_k(λ) ν^{−2k−1}` as `ν → ∞` in `|ph ν| ≤ π − δ`".
- README lines 1012–1013 (the rotation of the path extends the expansion to `|ph ν| ≤ π − δ`).
- `Suggested.lean` lines 334–340.

**Claim.** For every `λ > 0`, `δ ∈ (0, π)` and `N`, the remainder is `O(ν^{−2N−1})` along `sectorAtTop (π − δ)`.

**Witness.** At `λ = 0.1`, `δ = 0.2`, `ν = 20e^{2.9i}`, the Lean definition gives `|𝐀_ν(λν)| = 3.79 × 10⁹` (`|J_ν(λν)/sin νπ| = 3.79 × 10⁹`, `|𝐉_ν(λν)/sin νπ| = 0.0145`); the series gives `0.0145`. Along that ray: `3.7 × 10⁴`, `3.8 × 10⁹`, `4.5 × 10¹⁴` at `|ν| = 10, 20, 30`.

**Why (mechanism).** For `0 < λ < 1`, the substitution `u = λ sinh t + t` has square-root branch points at `u = −μ(λ) ± πi`, and `−μ(λ) > 0` (it is 1.998 at `λ = 0.1`). So AsymptoticExpansions 4.3 cannot rotate the path past `|ph u| = π/2 − θ(λ)`, where `θ(λ) = arctan(−μ(λ)/π)`. Beyond `|ph ν| = π − θ(λ)` the branch-point term dominates. Its growth rate on that ray is `|ν|(−μ cos ψ − π|sin ψ|)` with `ψ = π − ph ν`, which is `1.19|ν|` here.

More values, each against the series:

| λ, ph ν | value (fails) | value (holds) |
|---|---|---|
| `λ = 0.7` | `ph 3.12`: `|𝐀| = 2.09` vs `0.0094` | `ph 2.9`: agrees to `2 × 10⁻⁶` |
| `λ = 0.3` | `ph 2.9`: `|𝐀| = 3.13` vs `0.0122` | `ph 2.6`: agrees to `2 × 10⁻⁸` |

**Repair.** In 8.3, state 11.11.8 in `|ph ν| ≤ π − θ(λ) − δ`, with:

- `θ(λ) = arctan(−μ(λ)/π)` for `0 < λ < 1` (`μ(λ)` of 11.11.12);
- `θ(λ) = 0` for `λ ≥ 1`, where the critical values `±i(y + λ sin y)` are imaginary and DLMF's sector is right.

Replace the route sentence by: rotation up to the branch points `−μ(λ) ± πi`.

In Lean, use the filter

`sectorAtTop (π - max 0 (Real.arctan ((Real.log ((1 + √(1 - lam ^ 2)) / lam) - √(1 - lam ^ 2)) / π)) - δ)`

This was tested on a scratch copy:

- it elaborates;
- in Lean, the `max` is `0` at `λ = 2` (proved there);
- at `λ = 0.1` the sector ends at `2.575 − δ`, which excludes the refuting ray;
- the included rays above agree with the series.

Add `λ = 0.1`, `ν = 20e^{2.9i}` as a negative-control Check.

## R04 (P3) — 11.10.4 drops DLMF's case `Re z = 0`, `Re ν > 0`

**Location.**

- README line 860: "DLMF 11.10.4: `𝐀_ν(z) = π⁻¹ ∫₀^∞ e^{−νt − z sinh t} dt` for `Re z > 0`, absolutely convergent".
- `Suggested.lean` lines 305–308 (`hz : 0 < z.re`).

**Claim.** This is 11.10.4 with its hypotheses.

**Witness.** DLMF §11.10 (cached text, line 228) also states 11.10.4 for `Re z = 0`, `Re ν > 0`, where it converges absolutely. Lean definition = integral at `(z, ν) = (2i, 0.7)`: `0.0680813748 − 0.1305948462i`; at `(−1.5i, 1)`: `0.1044051261 + 0.1239113116i`.

**Repair.** Add "and for `Re z = 0`, `Re ν > 0`" in 7.1. In Lean, use `(hz : 0 < z.re ∨ (z.re = 0 ∧ 0 < ν.re))`, which elaborates (tested together with R01(a) and R03: 25 `sorry` warnings, no error).

## Verified sound

### The previous review's findings, at this head

- **R01 (P1), the false Layer 7 example: repaired.** README line 936 now reads "`𝐀_{−1/2} = −Y_{1/2} − 𝐄_{1/2}`; at `z = 1` both sides are `0.33159 13253 78…`". I computed `0.33159132538` on both sides.
- **R02 (P2), 11.11.17 for real `ν` only: repaired.**
  - Lean lines 344–347 use `p : ℂ × ℂ` with `comap Prod.fst (sectorAtTop (π - δ)) ⊓ 𝓟 {p | ‖p.2‖ ≤ M}`.
  - README lines 1029–1036 and 1094–1096 send `π ≤ |ph ν| ≤ 2π − δ` to "Beyond".
  - The new contour route (lines 1048–1053) is sound: on `Im t = −ph ν`, `ν sinh t ≈ |ν|e^{Re t}/2`.
- **R03, gate `tex`: repaired** (`tex=0`).
- **R04, gate `readme-ids-missing`: repaired** (`#check @_root_.…` lines 54–66; the gate shows 0).
- **R05, padding: repaired.**
  - The three padding declarations are deleted.
  - `struveScaledCoeff` and `angerScaledCoeff` are now used by `isBigO_struveK_scaled` and `isBigO_angerWeberA_scaled`.
- **R06, unused definitions: repaired.** `hankelH1`/`hankelH2` are gone, and `lommelCapitalSFormula` calls `lommelSmallS` (lines 117–119).
- **R07, Lean names missing from the README: repaired.** Each of the 42 declarations of `Suggested.lean` occurs in the README (*Suggested names* lines; `lommelCapitalSFormula` at line 155; the coefficients at lines 197–199).
- **R08, the missing Tau Ceti contract: repaired** (README lines 275–279; the *Needs* of 1.1 and 7.2).
- **R09, AsymptoticExpansions 4.3 never cited: repaired.** It is in the contract (lines 261–262), in the *Needs* of 4.1, 6.3, 8.1 and 8.3, and in the Dependencies of Layers 4, 6 and 8.
- **R10, 11.9.9 without a route: repaired, by a different route** (Hankel and Laplace representations, lines 795–826). It is verified below.
- **R11, supplier locators: repaired, all six items.**
  - Airy 6.1–6.2 (lines 237–240, 1067).
  - EiLiErf 11.4 (line 251).
  - SpecialFunctionsBessel 1.2 in the *Needs* of 1.1 (line 348).
  - SpecialFunctionsBessel 3.1 in the *Needs* of 4.3 (line 652) and in the Layer 4 Dependencies.
  - SpecialFunctionsBessel 8.4 in the Layer 5 Dependencies (line 739).
  - SpecialFunctionsBessel 2.2, 2.6 in the *Needs* of 6.2 (line 787).
- **R12, "Variation of parameters": repaired.** It is now "Superposition" (lines 95, 357). Line 811 uses "variation of parameters" in its proper sense.
- **R13, the 11.11.18 witness: repaired** ("at `ν = 20 e^{0.3i}`", line 1040). I recomputed the ratio: `|·| = 2.80 × 10⁶`.

### Gate, build and dependency check

- **Gate.** It fails only on `imports=1` and `build=3` (R01, R02); every other scanner is `0`, and the pull request changes nothing outside the folder.
- **Build.** Removing the roadmap import and `lommelCapitalS_eq_laplace` gives 25 `sorry` warnings and nothing else.
- **Dependency check.** The output of `gate --depcheck … --pr 2129` is `depcheck: 233 roadmaps, 2091 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line.
- **Suppliers.** SpecialFunctionsAiry, SpecialFunctionsEiLiErfIncompleteGamma, SpecialFunctionsHypergeometric, AsymptoticExpansions and ZerosOfLFunctions are on main. SpecialFunctionsBessel is an open pull request that adds a new folder, and the description's `depends-on` block names it.

### Signatures and padding

- **Signatures.** I elaborated `#check @…` for all 41 remaining declarations together with the 13 pinned names and compared each type with the README. The file has no `variable` block, so no binder is lost; every theorem carries the README's hypotheses, apart from R03 and R04.
- **Padding probe.** Every `sorry` was replaced by `first | rfl | (simp; done) | (fun_prop; done) | (norm_num; done) | (simp [all definitions]; done) | sorry`. All 25 statements stay open.

### Library declarations opened at the pins (19)

**Mathlib `Analysis/SpecialFunctions/Bessel.lean`:**

- `besselJ` (55)
- `besselJ_def` (59)
- `besselJ_int_neg` (62)
- `analyticOnNhd_besselJ` (79)
- `two_mul_self_mul_besselJ` (123)

**Mathlib `Analysis/SpecialFunctions/RegularizedHypergeometric.lean`:**

- `regularizedHGFunCoeff` (67)
- `regularizedHGFun` (192)
- `radius_regularizedHGFunSeries_eq_top` (249)
- `analyticAt_regularizedHGFun_of_card_le` (287)

**Elaborated with their types:**

- `Gamma_add_one`
- `Gamma_mul_Gamma_add_half`
- `Gamma_mul_Gamma_one_sub`
- `Gamma_ne_zero`
- `differentiable_one_div_Gamma`
- `integral_boundary_rect_eq_zero_of_differentiableOn`

**Other Mathlib declarations:**

- `Real.sqrt_eq_zero'` (`Analysis/Real/Sqrt.lean` 267)
- `Real.arctan_zero`, `Real.arctan_strictMono` (`Trigonometric/Arctan.lean` 169, 172)

**Tau Ceti:** `Complex.hasSum_regularizedHGFun` (`TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean` 53).

### Cross-roadmap citations resolved (40)

**SpecialFunctionsBessel (open head):**

- its Conventions (the names of `citations.md`: `besselY`, `hankelH1/2`, `besselI`, `besselK`, `sphericalBesselJ`, `modifiedSphericalBesselI1`, `Real.debyeU`);
- sections 1.1, 1.2, 1.3, 1.4 (10.6.1–10.6.7), 1.7, 1.8, 2.2, 2.4 (10.23.1–10.23.5), 2.6 (10.23.15), 3.1 (10.9.2, 10.9.4, 10.9.6–10.9.7, 10.32.2), 4.3, 5.1, 5.2, 6.1 (real `ν` only: so the complex-`ν` Debye leading term of 4.3 is correctly this roadmap's), 8.1 (10.22.1), 8.2 (10.22.43–10.22.44), 8.4 (10.43.1), 9.1, 9.2;
- it defers 10.22.2 and 10.43.2 to this roadmap.

**SpecialFunctionsHypergeometric (main):** its Conventions (`gaussHypergeometric`), 1.2, 1.3, 1.4, 3.1, and 5.1 (15.8.2 on `−z ∈ slitPlane`).

**AsymptoticExpansions (main):**

- its Conventions, and sections 1.5, 4.2, 4.3, 5.1, 5.2, 5.4, 5.5, 6.2, 8.2, 8.6;
- the seven Lean names it lists.

**Other suppliers on main:**

- SpecialFunctionsAiry: its Conventions, 6.1, and 6.2 (9.12.6);
- SpecialFunctionsEiLiErfIncompleteGamma: its Conventions and 11.4;
- ZerosOfLFunctions: 1.2 and 1.3.

**Local copies.** `besselY`, `besselI`, `scorerHi`, `fresnelC` and `fresnelS` are character for character the suppliers' definitions. The open AsymptoticExpansions revision changes none of the cited sections, and `overlaps.md` lists nothing.

### Duplication and ownership

- No Struve, Lommel, Anger, Weber or Anger–Weber object exists in the pinned Mathlib or Tau Ceti.
- None exists in any roadmap on main or open pull request either (`roadmaps grep` for `struve`, `lommel`, `angerJ`/"Anger–Weber", `weberE`). The only hits are SpecialFunctionsBessel's deferrals to this roadmap and an unrelated "Weber's equation" in SpecialFunctionsParabolicCylinder.

### Sources

I read DLMF §§11.2, 11.4, 11.5, 11.6, 11.7, 11.9, 11.10, 11.11, 10.22 and 10.43 (Release 1.2.8 of 2026-09-15, as cited) through the sources service. For the fifteen sampled subsections I compared every formula number, hypothesis, sector and coefficient:

- 1.1, 1.2 (11.2.1–11.2.17);
- 3.1 (11.5.1–11.5.7);
- 4.2 (11.6.3–11.6.5);
- 5.1 (11.7.1–11.7.6, 10.22.2, 10.43.2);
- 5.3 (11.7.13–11.7.16);
- 6.1–6.3 (11.9.1–11.9.9);
- 7.1–7.3 (11.10.1–11.10.31);
- 8.1–8.3 (11.11.1–11.11.15).

Agreement is everywhere except R03 and R04. The README flags no locator as unverified. Its added hypotheses each exclude a pole or a 0/0: 10.22.2 and 10.43.2 at `ν = −3/2` (below), 11.4.18, and 11.9.7 at `μ ∈ {−1, −2, …}`.

### Adversarial table

All values are double precision, computed from the Lean definitions transcribed literally: the `𝐅₁₂` and `₀F₁` series, `Y_ν` and `𝐀_ν` by their case splits, and `𝐉`, `𝐄` by Gauss–Legendre quadrature. "res" is a residual.

| Statement | Instances and values | Result |
|---|---|---|
| 1.1 Checks | `𝐇₀(1) = 0.56865662705`, `𝐋₀(1) = 0.71024318594`, `𝐇₁(1) = 0.1984573362`, `𝐇_{0.3}(2+i) = 1.0479605148 + 0.22137059751i`, `𝐊₀(1) = 0.48039966283`, `𝐌₀(1) = −0.55582269181` | as README |
| `𝐋_ν = −ie^{−iνπ/2}𝐇_ν(iz)` | `ν = 0.3`, `z = 0.7+0.4i`: both `0.28667885554 + 0.25469099348i` | holds |
| `struveH_ode` | `(0.3+0.2i, −1+0.5i)`: both `−0.10284272 − 0.43376522i`; `(−3/2, 2−i)`: lhs `1.1 × 10⁻⁹`, rhs `0`; `(2, −2+0.1i)`: both `−0.42441318 + 0.02122066i` | holds, also where `1/Γ(ν+½) = 0` |
| `struveH_half`, 2.1 Checks | `z = 1, −1+0.5i, 0.3−2i`: `0.36678569278`, `−0.25428467184 − 0.36298315905i`, `−0.71046158836 − 1.4054502011i` on both sides; `𝐇_{−1/2}(1) = 0.67139670714`, `𝐋_{1/2}(1) = 0.43331565379`, `𝐇_{1/2}(3) = 0.91670768676` | holds |
| `struveH_relative_bound` | `ν = 0`, `z = 1`, `d = 3/2`: `|ϑ| = 0.1067562590 < 0.1209069419`. Printed 11.4.15 at `ν = 1000`, `|z|²/4 = |ν+3/2|`: `ϑ = 1.02944` > printed `0.66667`, < corrected `1.14552` | correction right |
| `struveH_recurrence` | `(0.3+0.2i, −1+0.5i)`: both `0.29582727708 + 0.37707989822i`; `(−3/2, 2+i)`: both `0.87935131088 − 0.1815546866i`; `(0, 1)`: both `0.63661977237 = 2/π` | holds at a pole of `Γ` |
| `struveH_eq_integral` | `(0.3, −1+0.5i)`: both `−0.4817337314 − 0.2231595208i`; `(−0.3+i, 2+i)`: both `0.7318264102 + 0.3363024547i`; `(0.4+0.3i, 1.5−0.7i)`: both `0.7922677456 − 0.5065908943i` | holds |
| `struveK_eq_integral`, 11.5.3 | `(−1, 1)`: both `−0.34305038513`; `(3.2, 0.5−3i)`: `−0.28168795457 − 0.10905547729i` vs `−0.28168795456 − …`; `(−2.5+i, 1+2i)`: both `−0.53221748841 − 0.3828890287i`; `𝐊₀(10)` by 11.5.3: `0.063072516404` | holds for every `ν` |
| 3.2 Example (11.5.4) | `ν = ½`, `z = 1`: both `−0.50435923446` | holds |
| `struveH_mellinBarnes` | `(ν, x, c) = (3, 1.2, −0.4)`: lhs `−0.57785365i`, rhs `−0.57785366i` | holds |
| `isBigO_struveK_sub_sum` | `𝐊₀(10) = 0.0630725164` between `0.0630253575` and `0.0630826532` (two, three terms) | sign statement holds |
| 4.2 Check | `∫₀^8 𝐌₀ + (2/π)(ln 16 + γ) = 0.0054568877425`, first term `0.0049735919716` | as README |
| `struveScaledCoeff` vs 11.6.8 | exact rationals, `λ = 2`: `1, 1/2, 1/4, 1/16, −7/128` from both; `λ = 3/7`: all five equal | equals 11.6.8 |
| `isBigO_struveK_scaled` | `λ = 2`, remainder over next term, `N = 1, 2, 3`: `ν = 30`: `1.034, 1.021, 0.839`; `ν = 60`: `1.017, 1.012, 0.932`; `ν = 60e^{i}`: `1.0089−0.0142i, 1.0072−0.0098i, 0.973+0.057i`; `ν = 60e^{−1.2i}`: `1.0059+0.0157i, 1.0052+0.0112i, 0.986−0.060i` | holds |
| `struveL_isEquivalent_besselI` | `λ = 2`: `𝐋/I = 0.99986533, 0.99999995, 1.0000000` at `ν = 10, 20, 40`; `ν = 40e^{1.3i}`: `1.000008 − 0.000042i`; `λ = ½`: `0.9535 − 0.2231i`, `1.0695 − 0.0590i` at `ν = 20e^{−i}, 40e^{−i}` | tends to `1` |
| `hasDerivAt_besselJ_struveH` | `(0.3+0.2i, −1+0.5i)`: both `−0.0586268365 + 0.300173363i`; `(1.5, 2+i)`: both `1.29162197 + 1.82740036i`; `(−2.3+0.4i, 0.7−1.2i)`: both `−1.26564315 − 0.444924679i`. At `ν = −3/2` the bracket is `0.63661977237` | holds; hypothesis needed |
| 11.7.6 | `ν = 0.3+0.2i`, `z = −1+0.5i`: README form res `4.5 × 10⁻¹³`, DLMF's printed form res `0.342` | README form right |
| `integral_struveH_mul_struveH` | `μ = ν = ½`: right side `√π/(2Γ(3/2)) = 1`, left side `(2/π)∫₀^∞(1−cos t)²t⁻² dt = 1`; `μ = 3`, `ν = −2`: the integrand is `∼ c t^{1/2} cos(t − φ)` | holds; DLMF's hypothesis insufficient |
| 5.3 | 11.7.13 at `a = 2`: both `0.13700342101` | holds |
| 6.1 Checks | `s_{.5,.2}(1.3) = 0.58290015167`, `S_{.5,.2}(1.3) = 0.83162460055`, `S_{0,0}(1) = 0.75461002577 = (π/2)𝐊₀(1)`, `S_{−1,0}(1) = 0.4422364520`, `S_{2,1}(2) = 2`, `S_{1,0} = 1` | as README |
| `differentiable_lommelCapitalS` | `S_{−1+h,0}(1)` at `h = 10⁻³, −10⁻³, 10⁻³i`: `0.442493161`, `0.441979872`, `0.442236388 + 0.000256649i` around `0.442236452` | removable |
| `lommelCapitalS_ode` | `(0.5+0.3i, 0.2, 1.3+0.4i)`: both `0.7827281 − 0.0446416i`; doubly exceptional `(−1, 0, 1.2+0.3i)` via the Laplace form: both `0.5767012687 − 0.3075740099i`; `(0.3, 0.3, −1+0.5i)`: both `−0.2766431 − 0.8825283i` | holds |
| 6.2 | 11.9.7 and 11.9.8 at `(0.5, 0.2, 1.3)`: both `0.58290015167` | holds |
| Laplace representation (6.3) | `(μ, ν, z)` = `(0.3+0.1i, 0.2, 1.5+0.5i)`: `0.6510757496 − 0.081095006i` both (README Check); `(−1, 0, 1)`, `(2, 1, 2)`, `(1.7, −0.4+0.3i, 0.8−0.6i)`, `(−2.5, 0.5+0.2i, 2)`, `(0.3, 0.3, 1.2+0.4i)`, `(−3, 2, 1.5)`, `(0.5, 0.2, 1.3)`: `|R − S| ≤ 2 × 10⁻⁹` | holds at all parameters |
| Hankel representation (6.3) | `(0.2, 0.3, 2)`: both `0.53377778818`; variation of parameters `s = 1.1233236368` on both sides | holds |
| `isBigO_lommelCapitalS_sub_sum` | remainder over next term, `N = 1, 2, 3`, `z = 40e^{0.6i}`: `(0.3+0.1i, 0.2)`: `0.9986, 0.9953, 0.9897`; `(−1, 0)`: `0.9962, 0.9912, 0.9839` (the `|z| = 20` values are further from `1`) | holds |
| 7.1 Checks | `𝐉_{1/2}(1) = 0.85516530968`, `𝐄_{1/2}(1) = 0.09950754264`, `𝐀_{1/2}(1) = 0.18376860254`, `𝐀₀(1) = 0.24019983142 = 𝐊₀(1)/2`, `𝐀₁(1) = 0.14678469362` (= the integral) | as README |
| `differentiable_angerWeberA` | `𝐀_{1∓10⁻⁶}(1) = 0.14678475461, 0.1467846332` around `0.14678469362` | the cases glue |
| `angerWeberA_eq_integral` | `(2, 1.3)`: `0.093581260282` vs `0.093581260283`; `(−3, 0.8)`: both `10.660330748`; on `Re z = 0` (R04): `(0.7, 2i)`: both `0.0680813748 − 0.1305948462i`; `(1, −1.5i)`: both `0.1044051261 + 0.1239113116i` | holds; narrowed (R04) |
| `angerJ_eq_besselJ_add` | `𝐉₂(1.3) = J₂(1.3) = 0.18302669877`; `𝐉₋₃(−1+0.5i) = J₋₃ = 0.0066844974 − 0.0269712100i`; `ν = 0.3+0.5i`: both `0.49000880214 − 0.52176518596i` | holds at integers |
| 7.2 | `𝐄₀(1) = −0.56865662705`, `𝐄₁(1) = 0.43816243617 = 2/π − 𝐇₁(1)`, `𝐉_{0.3}(0) = 0.85839369133`; 11.10.17: both `0.90475169903`; 11.10.18: both `−0.16315998701` | holds |
| Layer 7 Example | `𝐀_{−1/2}(1) = 0.33159132538 = −Y_{1/2}(1) − 𝐄_{1/2}(1)` | holds |
| `angerJ_neg_half` | `z = 1`: `0.09950754264`; `−1+0.5i`: `0.9151680458 + 0.0057784949i`; `0.3−2i`: `1.112451701 + 1.584522631i`; `−3−0.1i`: `0.1509240148 − 0.0490360309i`; both sides at each | holds on the slit plane |
| 8.1 (11.11.4) | `ν = 0.3+0.2i`, `z = 40e^{0.8i}`, remainder over next term, `N = 2, 3, 4`: `0.963+0.010i`, `1.014−0.140i`, `0.934+0.021i` | holds |
| 8.2 (11.11.5) | bracket error × `|ν|²` at `ν = 40.5`, `½+10i`, `40e^{i}+½`: `0.978, 0.954, 0.986` | bounded; no correction needed |
| `isBigO_weberE_large_order` | error × `|ν|²/e^{π|Im ν|}`: `0.2385, 0.514, 0.2464`; DLMF's form at `½+10i`: `1.05 × 10¹³` | corrected form bounded |
| `angerScaledCoeff` vs 11.11.9 | exact rationals, `k ≤ 3`, at `λ = 7/10, 2, 1/3`: all equal | equals 11.11.9 |
| `isBigO_angerWeberA_scaled` (R03) | `λ = 0.1`, `ph 2.4`, `|ν| = 20`: `−0.0106711 − 0.0097706i` vs `−0.0106707 − 0.0097709i`; `ph 2.9`: `|𝐀| = 3.7 × 10⁴, 3.8 × 10⁹, 4.5 × 10¹⁴` vs `≈ 0.01`; `λ = 0.7`, `ph 3.12`: `2.09` vs `0.0094`; `λ = 1`, `ph 3.0`: `|J/sin|` falls from `4.9 × 10⁻³` to `4.7 × 10⁻⁴` (`|ν| = 10 → 15`) | false for `λ < 1` |
| `isBigO_angerWeberA_transition` | error × `|ν|` at `|ν| = 100, 400, 1600`, `a = 1+i`: `0.0399, 0.0405, 0.0407` (`ph 0`, `1.0`), `0.0401, 0.0405, 0.0407` (`ph 1.4`); `a = −2`: `24.9, 23.0, 22.4` (`ph 0`), `24.2, 22.8, 22.3` (`ph 1.0`), `23.5, 22.6, 22.2` (`ph 1.4`) | bounded for complex `ν` |
| 8.4 Checks | `Hi(0) = 0.40995108496 = 2/(3^{7/6}Γ(⅔))`; `𝐀_{−10}(10) = 0.23669402848`, leading term `0.23974084887` | as README |
| `angerJ_self_isEquivalent` | `ν = 100`: ratio `0.999971`; `ν = 20e^{0.3i}`: `−1.426 × 10⁶ − 2.406 × 10⁶ i`; `ν = 10e^{0.3i}`: `−383.7 + 147.9i` | holds for real `ν` only, as stated |

## Not verifiable

- **Secondary sources not fetched.** Watson (1944), Olver (1974/1997), Babister (1967), Dingle (1973) and Nemes (2014b, c) were not fetched. The README cites them only in References, and no sampled statement depends on a locator into them. I could not see how Nemes treats 11.11.8 for `λ < 1`: R03 rests on the computation from the Lean definition alone.
- **Not recomputed this round:**
  - 11.6.5 at `|ν| = 300` (the double-precision `Γ` overflows);
  - 11.7.9–11.7.11 (oscillatory);
  - 11.11.17 at `|ph ν| ≥ π/2`, which needs the contour of 8.4.

  The previous review's values cover them.
- **Precision.** All numerics are double precision, so agreement is about 10 digits for small parameters and less where noted. The magnitudes in R03 differ by eleven orders and are not affected.

## Source issues

- **Error** in DLMF §11.11 at 11.11.8, online section 11.11(iii): the source says the expansion of `𝐀_ν(λν)` holds for every fixed `λ > 0` in `|ph ν| ≤ π − δ`; it should be `|ph ν| ≤ π − arctan(−μ(λ)/π) − δ` for `0 < λ < 1`; affects a stated result.
- **Misprint** in DLMF §10.22 at 10.22.2 and §10.43 at 10.43.2: the source excludes only `ν = −½`; it should exclude `ν + ½ ∈ {0, −1, −2, …}`, where `Γ(ν + ½)` has a pole and the bracket is nonzero (`2/π` at `ν = −3/2`); affects nothing.
- **Error** in DLMF §11.4 at 11.4.15: the source puts the `−1` inside the exponential; it should be `(2/3)(exp(¼|z|²/|ν₀ + 3/2|) − 1)`; affects a stated result.
- **Misprint** in DLMF §11.4 in the sentence after 11.4.15: the source lists `|ν + 3/2|`, `|ν + 5/2|`, `|ν + 9/2|`, …; it should be `|ν + 3/2|`, `|ν + 5/2|`, `|ν + 7/2|`, …; affects nothing.
- **Error** in DLMF §11.7 at 11.7.6: the source gives the last numerator as `(½z²)^{ν+1}`; it should be `z^{2ν+2}/2^{ν+1}`, which differs for principal powers where `|ph z| > π/2`; affects a stated result.
- **Gap** in DLMF §11.7 at 11.7.12: the source requires only `Re(μ + ν) > 0`; it should also require `Re μ > −3/2` and `Re ν > −3/2` (the integral diverges at `μ = 3`, `ν = −2`); affects a stated result.
- **Error** in DLMF §11.11 at 11.11.6: the source puts `O(ν⁻²)` inside the bracket for complex `ν`; it should be `O(e^{π|Im ν|} ν⁻²)`; affects a stated result.
- **Error** in DLMF §11.11 at 11.11.18–11.11.19: the source states them for `ν → ∞` in `|ph ν| ≤ π − δ`; they hold only for real `ν → +∞`, since off the axis `sin(πν) 𝐀_ν(ν)` dominates; affects a stated result.
