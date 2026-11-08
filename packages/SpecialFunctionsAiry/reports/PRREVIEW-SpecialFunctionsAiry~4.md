# Review of SpecialFunctionsAiry (pull request #1928 at 618ca5a)

**Verdict:** needs changes

## R01 (P2) — Two owners: Kummer's second transformation and the `J₀` Bessel integral are planned again by SpecialFunctionsBessel

- **Location.**
  - `TauCetiRoadmap/SpecialFunctionsAiry/README.md` line 96: "Kummer's second transformation `e^{−x} 𝐌(a, 2a, 2x) = Γ(a + ½) Γ(2a)⁻¹ 𝐅(a + ½, x²/4)` | 1.7".
  - Line 103: "The Bessel integral `J₀(a) = (2π)⁻¹ ∫₀^{2π} e^{ia cos φ} dφ` | 8.3".
  - Owned in 1.7 (line 457, `exp_neg_mul_kummer_two_mul`) and 8.3 (line 1351).
- **Claim.**
  - The open roadmap SpecialFunctionsBessel (#1987) plans both identities again.
  - It proves the first from the same Kummer equation (SpecialFunctionsParabolicCylinder §1.3).
  - It also consumes this roadmap, so the later roadmap in the supply direction re-plans what the earlier one owns.
  - Its `besselJ_eq_kummer` is this roadmap's 1.7 at `a = ν + ½`, `x = iz`, multiplied by `(z/2)^ν Γ(2ν+1)/Γ(ν+1)` (Mathlib `Complex.besselJ_def`), with the same hypothesis `2a ∉ {0, −1, −2, …}`.
- **Witness.** At the head of #1987, `TauCetiRoadmap/SpecialFunctionsBessel/README.md` has:
  - lines 789–790: 10.16.5 and 10.39.5 (`besselJ_eq_kummer`, its `Suggested.lean` line 364);
  - lines 725–726 and 753: 10.9.2, with 10.9.1 as its `n = 0` case;
  - lines 379–384: its "From SpecialFunctionsAiry" contract.
- **Repair.** Give each identity one owner, in the direction #1987 already uses (this roadmap supplies SpecialFunctionsBessel):
  - Keep `exp_neg_mul_kummer_two_mul` (1.7) and the `J₀` integral (8.3) here.
  - Under Downstream consumers, replace "A Bessel-function roadmap (DLMF Chapter 10)" (line 1629) by SpecialFunctionsBessel. Name its 4.3 (10.16.5 and 10.39.5 from 1.7) and its 3.1 (10.9.1 from 8.3) as consumers.
  - #1987 then derives 10.16.5 and 10.39.5 from 1.7 instead of from Kummer's equation, and cites 8.3 for 10.9.1.
  - **Alternative.** Place SpecialFunctionsBessel Layers 1–10 before this roadmap and its Layer 11 (the only part that consumes this roadmap) after it. Then cite its 3.1 and 4.3 here, and delete rows 96 and 103 and the two auxiliary targets.
  - **Tested on the instance.** With `a = ν + ½` and `x = iz`, 1.7 gives `e^{−iz} 𝐌(ν+½, 2ν+1, 2iz) = Γ(ν+1)/Γ(2ν+1) · 𝐅(ν+1, −z²/4)`. Multiplied by `(z/2)^ν Γ(2ν+1)/Γ(ν+1)`, that is #1987's statement. Numerically, at `a = 0.7`, `x = 1.3` both sides of 1.7 are `1.5637032032`.

## R02 (P2) — 9.4: `U_m(−t)` solves 9.13.13 only for even `m`

- **Location.** `TauCetiRoadmap/SpecialFunctionsAiry/README.md` line 1531: "`U_m(t)`, `U_m(−t)` and, for odd `m`, `V̄_m(t)` solve `d²w/dt² = ¼ m² t^{m−2} w` (9.13.13)".
- **Claim.** The sentence asserts that `U_m(−t)` is a solution for every `m ≥ 3`. For odd `m`, `t^{m−2}` is odd, so `U_m(−t)` solves the equation with the opposite sign, which is 9.13.17's sign.
- **Witness.**
  - At `m = 3`, `U₃(t)` is a multiple of `Ai((3/2)^{2/3} t)`, so `w(t) = U₃(−t)` has `w″ = −(9/4) t w`.
  - DLMF-9.13 lines 528–531 list `U_m(−t)` as a solution only when `m` is even, and `V_m`, `V̄_m` when `m` is odd.
- **Repair.** Write: "`U_m(t)` for every `m`, `U_m(−t)` for even `m`, and `V̄_m(t)` for odd `m` solve `d²w/dt² = ¼ m² t^{m−2} w` (9.13.13)".
  - **Tested.** At `m = 3` the corrected sentence no longer covers `U₃(−t)`.
  - At `m = 4`, `U₄(−t)` solves 9.13.13, because `t²` is even.

## R03 (P3) — The RandomMatrices hand-over is written as a merge plan, and that plan fails the dependency check

- **Location.** `TauCetiRoadmap/SpecialFunctionsAiry/README.md`:
  - lines 108–112: "RandomMatrices §8.4 on main plans to build the Airy function … A companion revision of RandomMatrices replaces the plan in §8.4 by citations of these subsections, and the two merge together."
  - line 1625: "in the companion revision named under Scope and ownership".
- **Claim.**
  - This is process narrative. Once both pull requests merge, "on main plans to build" is false, and "companion revision" names a pull request.
  - The plan itself cannot be carried out. RandomMatrices is on main, and a roadmap on main cannot cite a roadmap that is only in the merge order. #1971 can therefore merge only after this roadmap is on main, not together with it.
- **Witness.**
  - The dependency check on RandomMatrices at #1971's head (5d55d20) reports `UPWARD: RandomMatrices (on main) -> SpecialFunctionsAiry (#396) at README lines [1044, 1049, 1100]`.
  - Main's RandomMatrices shows only its existing StochasticCalculus line.
- **Repair.**
  - Replace lines 108–112 by a timeless statement: "This roadmap owns the Airy function, Airy's equation, the decay of `Ai`, its integral representations, its expansions on the real line and the Airy kernel `K_Ai`; RandomMatrices §8.4 consumes them from 1.1–1.2, Layer 2, 3.2, 3.4–3.6 and 8.5."
  - Delete "in the companion revision named under Scope and ownership" at line 1625.
  - In the pull-request description, order #1971 after this pull request.
  - **Tested.** The only failing edge of #1971 is RandomMatrices → SpecialFunctionsAiry. It is flagged because SpecialFunctionsAiry is in the merge order rather than on main, so it goes away once this roadmap merges.

## R04 (P3) — 5.3: the argument principle is cited in its disc form, and no supplier contract lists it

- **Location.** `TauCetiRoadmap/SpecialFunctionsAiry/README.md`:
  - line 895: "The proof route is the argument principle on truncated sectors";
  - lines 911–912: *Needs:* "… `TauCeti.Contour.argumentPrinciple_divisor`";
  - the "From Tau Ceti" contract (lines 285–301) lists only Rouché's theorem.
- **Claim.**
  - `argumentPrinciple_divisor` integrates over a circle `C(c, R)`, but the route integrates over the boundary of a truncated sector.
  - Tau Ceti has the cycle form at the pin.
  - Whichever form is used, it is missing from the Exact supplier contracts.
- **Witness.**
  - `TauCeti/Analysis/Contour/Argument/Divisor.lean:62` states `circleIntegral (logDeriv f) c R = 2πi ∑ᶠ divisor`.
  - `TauCeti/Analysis/Contour/Argument/Cycle.lean:110`, `argumentPrinciple_nullHomologous`, takes a piecewise-C¹ closed null-homologous curve.
- **Repair.** Either:
  - cite `TauCeti.Contour.argumentPrinciple_nullHomologous` in the 5.3 route and *Needs:*, and add it to the "From Tau Ceti" contract next to `TauCeti.rouche`; or
  - keep the disc form, list it in the contract, and rewrite the route as follows: count all zeros in `|z| < R`, subtract the real zeros of 5.2, and halve by the conjugate symmetry of 1.6.
  - **Tested.** The boundary of `{π/3 < ph z < π/2, r < |z| < R}` is a closed, piecewise-C¹ curve, null-homologous in ℂ, which is exactly the hypothesis of the cycle form.

## R05 (P3) — The DLMF release is not pinned, although the README states what DLMF prints

- **Location.** `TauCetiRoadmap/SpecialFunctionsAiry/README.md`:
  - line 1165: "(DLMF 9.10.7 prints a plus sign; …";
  - line 1537: "DLMF prints the lower end of the sector as `−(2j − 1)π/m`";
  - References, line 1697: "NIST *Digital Library of Mathematical Functions*, Chapter 9 (F. W. J. Olver), <https://dlmf.nist.gov/9>".
- **Claim.** DLMF is revised between releases. A statement about its printed text, or an erratum against it, can be checked only against a named release.
- **Witness.**
  - DLMF-9.7 lines 737–744 and 925–937 record that release 1.0.17 changed the bounds of §§9.7(iii)–(iv), which 3.5 states.
  - The text read here is Release 1.2.8 of 2026-09-15 (DLMF-9.12 lines 1383–1384).
- **Repair.** Cite "Release 1.2.8 of 2026-09-15" (or the release the locators were taken from) in References, and state the 9.10.7 and 9.13.18 corrections against that release.
  - **Tested.** At 1.2.8, 9.10.7 carries `+` (DLMF-9.10 line 278) and 9.13.18 has `−(2j−1)π/m` (DLMF-9.13 line 693).

## Status of the previous review's findings (0223c33)

| Previous | Status at 618ca5a | Evidence |
|---|---|---|
| R01 RandomMatrices second owner | partly repaired | Lines 108–112 now hand the objects over. #1971's RandomMatrices cites 1.1–1.2, Layer 2, 3.2, 3.4, 3.6 and 8.5 (its README lines 176–183 and 1041–1050), but it fails the dependency check if merged together with this pull request (R03). |
| R02 headlines absent | repaired | The file now states `norm_airyRemainderAi_le` and `norm_airyRemainderAiDeriv_le` (all four regimes through `airyRemainderBound`), `airyBiComplexZero_spec`, `scorerGi_real_zeros`, `isBigO_scorerGi_sub_sum` and `isBigO_scorerHi_neg_sub_sum`. Every definition is used by a statement. |
| R03 gate `tex` | repaired | `tex=0` |
| R04 gate `readme-ids-missing` | repaired | `readme-ids-missing=0`. The seven own names are gone or declared, and the library names are pinned by `#check @_root_…`. |
| R05 padding | repaired | The seven declarations are deleted, and the 1.1 Check names no Lean declaration. |
| R06 module docstring | repaired | Retitled. It states the headline theorems and names 9.10.15–9.10.16 at complex `p` as not statable, with the missing `upperIncompleteGammaLog`. |
| R07 Kummer's equation | repaired | A "From SpecialFunctionsParabolicCylinder" contract is added, and 1.7 cites §1.3. |
| R08 Checks | repaired | 14 `**Checks.**` lists, including 3.1, 3.5, 4.1, 5.2–5.3, 6.1, 7.8, 8.5, 9.1, 9.4 and 9.5. |
| R09 `β_k` well defined | repaired | The tie-break by phase is in the Conventions. Moduli are nondecreasing, and strictly increasing only from some index on. |
| R10 generality | repaired | Layer 9 now has `hn : 1 ≤ n`, with `n = 0` as a Check, and 7.6 states the lower side through `conj ∘ f`. |
| R11 finite-part convention | repaired | Both logarithm conventions are named in 9.5. |
| R12 locators | repaired | Nemes is cited by Propositions B.1, B.3 and B.4 with arXiv:1606.07961, and "DLMF 5.5.6 with `n = 3`". |

## Verified sound

**Gate, dependency check, build.**
- **Gate** at 618ca5a, re-run here: `set_option=0 … readme-ids-missing=0 … depcheck=0 … stray-files=0 … outside-folder=0 … OK`.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpecialFunctionsAiry'` is empty.
- **Dependency check** of this README: `depcheck: 238 roadmaps, 2343 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Elaboration:** `lake env lean TauCetiRoadmap/SpecialFunctionsAiry/Suggested.lean` exits 0 with 50 warnings, all "declaration uses `sorry`". The 29 `#check` lines all resolve.
- **Signatures:**
  - The file has no `variable`, `include`, `set_option` or `lemma`.
  - On a scratch copy, `#check @` elaborated 83 of the 84 declarations. The 84th, `reidAiryB0`, failed only because my scratch script cut its name; its signature is in the worker's dump.
  - Each type matches its README statement. Casts: `4 * ↑k − 1` is real, `zpow` is used in the sector bounds, and `((3k)! : ℂ)` in 6.6.
  - The junk branches of `airyRemainderBound` are unreachable: `sin((3/2) arg z) = 0` only at `|arg z| = 2π/3` (its own branch), and `cos = 0` only at `|arg z| = π` (excluded).
- **One-tactic probe** on a scratch copy:
  - `unfold airyAi; fun_prop` fails: Mathlib has only `AnalyticAt` `fun_prop` lemmas for `regularizedHGFun` (`RegularizedHypergeometric.lean:296`). The same holds for `airyBi`.
  - `simp [Real.airyAi, airyAi, Complex.ext_iff]` leaves the imaginary-part goal for `ofReal_real_airyAi`.
  - No declaration restates a definition, mirrors a Check or computes a small value.

**Headline theorems (README Scope items 1–9).**
- **Stated:**
  - Layer 1: entire, Maclaurin series, equation, basis, Wronskian, 9.2.10, reality, 9.6.6, Kummer's second transformation, 9.6.25;
  - Layer 2: 9.5.4, 9.5.1, 9.5.8;
  - Layer 3: 9.7.5, 9.7.7, 9.7.9, 9.7.17 in all regimes, the real sign of `R_n`, the recessive solution;
  - Layer 4: 9.8.14, 9.8.1, 9.8.20;
  - Layer 5: `a_k`, the phases at the zeros, the complex sector, the `β_k` enumeration, the `a_k` expansion;
  - Layer 6: `Hi` entire, its equation and series, 9.12.24, 9.12.25, 9.12.27, the energy, the real zeros;
  - Layer 7: triplication, 9.10.15 for real `p`, 9.10.17, Sokhotski–Plemelj, the incomplete limit;
  - Layer 8: product uniqueness, 9.11.3, the `Ai²` integral, the kernel;
  - Layer 9: 9.13.1, 9.13.8, the integral of `A_n`, 9.13.9, 9.13.34.
- **Not statable, and named in the docstring:** 9.10.15–9.10.16 at complex `p`. `upperIncompleteGammaLog` occurs nowhere in the pinned Tau Ceti.

**Library declarations opened at the pins** (Tau Ceti 2fd255d; Mathlib per `lake-manifest.json`).
- **Tau Ceti:**
  - `Real.besselI` (`TauCeti/Analysis/SpecialFunctions/BesselI.lean:81`, the real part of `(x/2)^ν 𝐅(ν+1, (x/2)²)`), `Real.besselI_eq_rpow_mul` (:92), `Real.hasSum_besselI` (:102);
  - `Complex.hasSum_regularizedHGFun` (`RegularizedHypergeometric.lean:53`);
  - `TauCeti.regularizedGamma` (`IncompleteGamma.lean:120`);
  - `TauCeti.wronskian_eq_of_hasDerivAt` (`Analysis/ODE/Wronskian.lean:31`);
  - `TauCeti.rouche` (`Analysis/Complex/Conformal/Rouche.lean:294`), `TauCeti.rouche_exists_eq_zero_iff` (:359);
  - `TauCeti.Contour.argumentPrinciple_divisor` (`Analysis/Contour/Argument/Divisor.lean:62`), `argumentPrinciple_nullHomologous` (`Argument/Cycle.lean:110`);
  - `TauCeti.Contour.HasCauchyPVAt` (`Analysis/Contour/Cauchy/PrincipalValue/Basic.lean:126`). It covers contour integrals over compact parameter intervals only, so the half-line Sokhotski–Plemelj target of 7.6 does not duplicate it.
- **Mathlib:**
  - `regularizedHGFunCoeff` (`Analysis/SpecialFunctions/RegularizedHypergeometric.lean:67`), `regularizedHGFunCoeff_add_one` (:93), `regularizedHGFun` (:192), `regularizedHGFun_zero` (:195), `analyticOnNhd_regularizedHGFun_of_card_le` (:282);
  - `integral_rpow_mul_exp_neg_rpow` (`MeasureTheory/Integral/Gamma.lean:26`);
  - `mellinInv_mellin_eq` (`Analysis/MellinInversion.lean:92`);
  - `integral_integral_swap` (`MeasureTheory/Integral/Prod.lean:481`);
  - `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (`Analysis/Calculus/ParametricIntegral.lean:569`);
  - `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` (`Analysis/Analytic/Uniqueness.lean:224`);
  - and the 29 `#check`-pinned names of `Suggested.lean`.
- **Duplication grep:** there is no Airy or Scorer function, no Gauss multiplication formula and no Sokhotski–Plemelj formula in either pinned library.

**Cross-roadmap citations resolved.**
- **AsymptoticExpansions** at #1857 (1f39e59): the Conventions (`Asymptotics.HasAsymptoticExpansion`), §1.5, Layer 2, §§3.1, 3.2, 4.2, 4.3, 8.2, 8.6 (`exists_norm_Gamma_le`) and 10.2 (unique holomorphic solution on every disc, hence entire) exist and say what is used.
- **SpecialFunctionsParabolicCylinder** at #1801 (4a8c39e): §1.3 states `regularizedHGFun_kummer_equation` for all `a, b, z`, in namespace `TauCeti`.
- **SpecialFunctionsEiLiErfIncompleteGamma** at #1924 (0ac9944): §1.5 has `upperIncompleteGammaLog`, `upperIncompleteGammaLog_log`, and holomorphy in `w`.
- **RandomMatrices:** §8.4 on main (54fc140) and at #1971; see R03.
- **Ownership against open pull requests:**
  - Checked with `roadmaps grep` over main and all 466 open heads for Airy and Scorer functions, Gauss multiplication/5.5.6, Sokhotski–Plemelj, Kummer's second transformation/13.6.9, and the `J₀` integral/10.9.1.
  - Only SpecialFunctionsBessel overlaps (R01).
  - SpecialFunctionsConfluent (#1995): its "Kummer's second transformation" (its 2.3, `kummerU_eq_cpow_mul_kummerU`) is DLMF 13.2.40 for `U`, a different identity. It consumes `Ai`, `Bi` from here.
  - `roadmaps overlaps`: no pull request changes this folder, and no cited id is dropped.

**Sources sample.** DLMF Release 1.2.8 was read at dlmf.nist.gov, and Nemes at arXiv:1606.07961v2; square roots, checked in context, are dropped by the text extraction.

| Target | Locator checked | Result |
|---|---|---|
| 1.7 | 9.6.6–9.6.14, 9.6.25–9.6.26 (DLMF-9.6 lines 296, 331, 366, 401, 461, 485, 516, 547, 578, 974, 1004) | matches. `|ph z| < 2π/3` is the README's own restriction and is needed for `(ζ/2)^{1/3} = 3^{−1/3} z^{1/2}`. |
| 3.4 | 9.7.9–9.7.14 (DLMF-9.7 lines 491–681), all in `|ph z| ≤ 2π/3 − δ` | matches, including `∓(i/2) ln 2` and `e^{∓πi/6}` in 9.7.14 |
| 3.5 | §9.7(iii) (lines 750–766), 9.7.15–9.7.16 (770–809), 9.7.17 (887–953), 9.7.18–9.7.19 (981–1016); Nemes2017 Propositions B.1, B.3, B.4 (lines 1734, 1833, 1990) | matches. `n ≥ 0`, `σ = 1/6` for `R_n`; `n ≥ 1`, `σ = 0` for `S_n`; `n ≥ 0` for `Bi`, `n ≥ 1` for `Bi′`; the 9.7.9–9.7.12 sign rule. |
| 4.1 | 9.8.3, 9.8.7, 9.8.14 (DLMF-9.8 lines 142–145, 286–289, 555–563); branches `θ(0) = −φ(0) = π/6` (lines 362–364) | matches |
| 5.3 | §9.9(i) (DLMF-9.9 lines 90–102) | matches. The tie-break is the README's own; the route's tool is R04. |
| 5.4 | 9.9.6–9.9.21 (lines 336–754) | matches. All 20 printed rationals `T_n`, `U_n`, `V_n`, `W_n` equal the README's. |
| 6.1 | 9.12.1–9.12.3 (DLMF-9.12 lines 84–159), 9.12.20 (847) | matches |
| 6.5 | 9.12.19–9.12.21 (815–884), 9.12.24 (995–1029) | matches. The sector `|ph(−z)| < 2π/3` is the README's own (Source issues). |
| 6.6 | 9.12.25–9.12.31 (1064–1296) | matches. 9.12.29 is stated in `|ph z| ≤ π − δ`, as in the source. |
| 6.7 | §9.12(ix) (1365–1372) | matches, including the zero `0.60907 54170` of `Gi′` |
| 7.2 | 9.10.1–9.10.3, 9.10.11–9.10.12 (DLMF-9.10 lines 72–135, 428–467) | matches |
| 7.7 | 9.10.22 (lines 887–891), `n = 1, 2, …` | matches |
| 8.2 | 9.11.5–9.11.14 (DLMF-9.11 lines 248–517), "any solutions of (9.2.1)" | matches |
| 9.1 | 9.13.1–9.13.5, 9.13.8 (DLMF-9.13 lines 69–231, 316–318) | matches; `n ≥ 1` as in the source |
| 9.4 | 9.13.13–9.13.24 (lines 497–852); solution list (lines 528–531) | 9.13.15–9.13.24 match. The 9.13.13 solution list does not (R02); the 9.13.18 sector is corrected (Source issues). |

**Adversarial table.** Values come from my own Maclaurin-series and quadrature code (double precision; 80-digit `Decimal` for the 9.10.7 integral), or are exact.

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| 1.1 pinned `Ai`, `Bi` | `z = 1` | `Ai(1)` 0.1352924163 / DLMF 0.13529 24163; `Bi(1)` 1.2074235950 / 1.20742 35950 | holds | — |
| 1.1 Checks | `z = 0` | `M(0) = 2Ai(0)` 0.7100561078; `N(0) = −2Ai′(0)` 0.5176388076; `Bi(0)/Ai(0) = √3` | holds | — |
| `eq_airy_combination` | `w = Ai`; value and derivative at 0 | `(c₁, c₂) = (π𝒲, 0) = (1, 0)`; at 0, `π w(0)(Ai(0)Bi′(0) − Ai′(0)Bi(0)) = w(0)` | holds | — |
| `wronskian_airyAi_airyBi` | `z = 1 + i` | 0.3183098862 + 4e−17 i / `1/π` 0.3183098862 | holds | — |
| 1.3 9.2.8–9.2.9 | via 9.2.11 | `½e^{−πi/3} · i/π = e^{πi/6}/(2π)`; `¼(−2i/π) = 1/(2πi)` | holds | — |
| `airyBi_eq_airyAi_rotations` | `z = 1`, `0.5 + 0.7i` | 1.2074235950 / 1.2074235950; 0.7618369246 + 0.3192654318i / same | holds | — |
| 1.4 9.2.14–9.2.15 | `z = 0`, derivative | `2cos(π/3)Ai(0) = Ai(0)`; `2cos(π/6)Ai(0) = Bi(0)`; `−Bi′(0) = √3 Ai′(0)` | holds | — |
| `airyAi_neg_eq_besselJ` | `z = 2` | `Ai(−2)` 0.2274074282 / `(√2/3)(J_{1/3} + J_{−1/3})(ζ)` 0.2274074282 | holds | — |
| `exp_neg_mul_kummer_two_mul` | `a = 0.7, x = 1.3`; `a = −½, x = 1` | 1.5637032032 / 1.5637032032; at `2a = −1` the left side is −0.5651591, while the right side is 0 under `Γ(−1) = 0` | holds; hypothesis needed | R01 |
| `airyBi_eq_kummer` | `z = 1` | 1.2074235950 / 1.2074235950 | holds | — |
| `airyAi_eq_ray_integral`, 9.5.5 | `z = 0` | `(2πi)⁻¹(e^{πi/3} − e^{−πi/3}) 3^{−2/3}Γ(⅓)` = 0.3550280539 = `Ai(0)`; `(2π)⁻¹ · 3 · 3^{−2/3}Γ(⅓) = 3^{−1/6}/Γ(⅔)` | holds | — |
| 2.3 `∫₀^∞ Ai = ⅓` | Fubini route | `(√3/2π) · 3^{1/3}Γ(4/3) · 3^{−1/3}Γ(⅔) = ⅓` | holds | — |
| `airyAi_laplace_integral`, `Ai′` form | `ζ → ∞`; exactness | leading terms `e^{−ζ}/(2√π z^{1/4})` and `−z^{1/4}e^{−ζ}/(2√π)`; the `Ai′` form is DLMF 10.32.8 at `ν = ⅔` with `Ai′ = −(z/(π√3))K_{2/3}(ζ)` | holds | — |
| 3.1 `u_k`, `v_k` | `k = 1, 2` | `u₁ = 15/216 = 5/72`; `u₂ = (693/1296)(5/72) = 385/10368`; `v₁ = −7/72`; `χ(0), χ(1), χ(2) = 1, π/2, 2` | holds | — |
| `airyRemainderAi_real_eq` | `x = 1, 2, 4`, `n = 1` | `R₁` −0.06587 ∈ [−0.10417, 0]; −0.02971 ∈ [−0.03683, 0]; −0.01191 ∈ [−0.01302, 0] | holds | — |
| `isBigO_airyBi_sub_sum` | value of `ζ` at `z e^{∓2πi/3}` | `ζ ↦ −ζ`; `(z e^{∓2πi/3})^{1/4} = e^{∓πi/6} z^{1/4}`, so `e^{∓πi/6}` cancels and the halves add | holds | — |
| `norm_airyRemainderAi_le`, `…Deriv_le` | `5e^{1.0i}` (n = 0); `8e^{1.2i}` (n = 2); `6e^{2.3i}` (n = 3); `3e^{2.9i}` (n = 2) | `|R₀|` 0.9988 ≤ 1; `|R₂|` 1.650e−4 ≤ 1.676e−4; `|R₃|` 4.77e−5 ≤ 3.48e−4; `|S₂|` 8.46e−2 ≤ 1.14e−1 (32 cases tried, all hold) | holds | — |
| 3.5 orders for `p`, `q`, `p̃`, `q̃` | sign patterns | `P`: + − + …; `Q`: + − …; `Q′`: − + …; `P′`: + + − + (`−v₂ = 455/10368 > 0`), so `N ≥ 1` for `p̃` | holds | — |
| 3.5 `S₀` Check | large `x` | `S₀ = 1 + 7/(72ζ) + O(ζ^{−2}) > 1 = m₀(0, x)|v₀|` | holds | — |
| 3.6 tail bound | `x = 0.01, 0.5, 1, 2, 4, 6` | `−Ai′ / √x Ai`: 0.2588/0.0352; 0.2249/0.1638; 0.1591/0.1353; 0.05309/0.04939; 1.959e−3/1.903e−3; 2.477e−5/2.437e−5 | holds | — |
| `airy_modulus_phase_deriv`, 4.1 Checks | `x = 0` | `sin φ(0) = Ai′(0)/N(0) = −½`; `5π/6` gives `+½` | holds | — |
| 4.3 9.8.13 | `x = 0` | `4 · 0.355028 · 0.258819 · sin(π/3) = 0.318310 = 1/π` | holds | — |
| 4.3 9.8.17–9.8.18 | algebra | `N sin(θ − φ) = −Mθ′`, `N cos(θ − φ) = M′`; `M″ = xM + Mθ′² = xM + 1/(π²M³)` | holds | — |
| `airyModulus_sq_expansion` | `x = −5`; `c₂`, `d₂` | `π√5 M²` 0.99877 / `1 − 5/(32 · 125)` 0.99875; `c₂ = (a₁² − a₂)/(−3) = 1105/6144`; `d₂ = −1463/6144` | holds | — |
| `airyAiZero_spec`, `airyPhase_airyAiZero` | `k = 1` | `a₁` −2.3381074105, `a′₁` −1.0187929716, `b₁` −1.1737132227, `b′₁` −2.2944396826 (Newton) = DLMF Table 9.9.1; first multiples π, 0, π/2, π/2 | holds | — |
| `airyBiComplexZero_spec` Checks | `k = 1` | `β₁` 0.9775448867 + 2.1412907060i (phase 1.14253); `β′₁` 0.2149470745 + 1.1006001433i (phase 1.37792); both in `(π/3, π/2)` | holds | R04 (route) |
| `airyAiZero_expansion` | `T₁`, `V₁`, `β₁` | `(3/2)T₁ − c₁ = 0` gives 5/48; `V₁ = T₁/4 + a₁/2 = 5/48`; `e^{πi/3}T(τ₁)` with two terms is 0.978 + 2.143i | holds | — |
| 6.1 Checks | `Hi(0)`; zero of `Gi′` | `Hi(0)` 0.4099510850 / `2Gi(0)` 0.4099510850; Newton gives `Gi′(0.6090754171) = 0` | holds | — |
| 6.1 9.12.3 | `w = c Hi(cz)`, `c³ = 1` | `w″ = c³ Hi″(cz) = zw + 1/π` | holds | — |
| 6.3 9.12.12–9.12.14 | `z = 0`, derivative | `cos(π/3)Hi(0) = Gi(0)`; `Ai(0) = (√3/2)Hi(0)`: 0.355028 / 0.355028 | holds | — |
| `scorerHi_mellin_barnes` | residues; growth | `Res_{s=n}Γ(−s) = (−1)^{n+1}/n!` gives `∫ dy = 2π² 3^{2/3} Hi(z)`; decay `e^{−2π|y|/3}` against growth `e^{|y| |ph(−z)|}` | holds | — |
| `isBigO_scorerGi_sub_sum`, `isBigO_scorerHi_neg_sub_sum` | 9.12.27 at `−z` | `−(π(−z))⁻¹ ∑(3k)!/(k!(3(−z)³)^k) = (πz)⁻¹ ∑(3k)!/(k!(−3z³)^k)` | holds | — |
| `hasDerivAt_scorerGi_energy`, `scorerGi_real_zeros` | `E′`; `E` at `+∞` | `E′ = 2Gi′(xGi − 1/π) − Gi² − 2xGiGi′ + 2Gi′/π = −Gi²`; `E ∼ 1/(π²x) → 0⁺`, so `E > 0` | holds | — |
| `Complex.Gamma_mul_Gamma_add_third` | `z = 0.4`; `z = ⅓`; poles `0, −⅓, −⅔` | 2.6737296607 / 2.6737296607; `Γ(⅓)Γ(⅔) = 2π/√3`; both sides 0 at the poles (`Γ(0) = Γ(−1) = Γ(−2) = 0`) | holds | — |
| 7.2 9.10.1–9.10.3 | `z = 0`, derivatives | `π(Ai(0)Bi′(0) − Ai′(0)Bi(0))/3 = ⅓`; derivatives `−Ai`, `Ai`, `Bi`; both forms of 9.10.3 vanish at 0 | holds | — |
| 7.3 9.10.7 | `x = −8, −10` | integral 0.0147564 / −0.0150404; README term 0.0191747 / −0.0123989; DLMF sign −0.0191747 / +0.0123989; scale `|x|^{−9/4}` 0.0093 / 0.0056 | README correct | R05, Source issues |
| `airyAi_neg_laplace` | `p = 3`, `p = 2`, `p → 0⁺` | 0.1414208560 / 0.1414208560; 0.2157432086 / 0.2157432097 (quadrature cut at `t = 9`); limit `⅔` = 9.10.11 | holds | — |
| `airyAi_mellin` | `α = 1, 2` | `⅓`; `Γ(2)/(3^{4/3}Γ(4/3))` 0.2588194038 = `−Ai′(0)`, since `∫ t Ai = ∫ Ai″` | holds | — |
| `tendsto_cauchyIntegral_Ioi` | sign; `f = 0` | `Im (s − s₀ − iη)⁻¹ = η/((s−s₀)² + η²) → πδ`; `f = 0` gives `L = 0` | holds | — |
| 7.7 9.10.22 | `n = 1, 2, 3` against the Taylor coefficients of 9.10.15 at `p = 0` | `⅔`; `3^{−1/3}/Γ(⅓)` both ways; `−3^{−5/3}/Γ(5/3)` both ways | holds | — |
| `tendsto_incompleteAiryAi`, 7.8 Checks | `Ai(0, 0)` | ray value 0.1775140269 + 0.1024877712i / `e^{πi/6}Ai(0)/√3` same | holds | — |
| 8.1 9.11.2 | `W(u², uv, v²) = 2W(u, v)³` | `2/π³` | holds | — |
| 8.2 9.11.5–9.11.14 | differentiate each | all ten reduce to the integrand by `f″ = zf`; e.g. 9.11.10: `(3/5)(zf′g′ + z²fg) + (2zf′g′ − 3z²fg)/5 = zf′g′` | holds | — |
| `airyAi_sq_eq_integral` | `x = 0, −1.5, 1` | 0.1260449190 / 0.1260449179; 0.2155341700 / 0.2155341690; 0.0183040379 / 0.0183040367 (tail beyond argument 8 dropped) | holds | — |
| 8.3 9.11.4 | `z = 0, 1, −2` | 0.5041796762 / 0.5041796762; 1.4761757756 / 1.4761757756; 0.2217075624 / 0.2217075624 | holds | — |
| `airyAi_sq_eq_besselJ_integral` | convergence; `x ≥ 0` | integrand `∼ t^{−1/2} cos(t³/12 + …)`, so the improper integral converges; source condition `x ≥ 0` (DLMF-9.11 line 161) | holds | R01 (`J₀`) |
| 8.4 9.11.15, 8.5 Check | `α = 1` | 0.0669874838 / `Ai′(0)²` 0.0669874838 | holds | — |
| `airyKernel_eq_of_ne` | sign; diagonal | `∂_t(Ai(x+t)Ai′(y+t) − Ai′(x+t)Ai(y+t)) = (y − x)Ai(x+t)Ai(y+t)`; diagonal `Ai′² − xAi² > 0` | holds | — |
| `generalizedAiryA_ode`, `generalizedAiry_wronskian` | `n = 1` at 0.8; `n = 2` at 0.7 | `A₁` 0.1698463174 = `Ai(0.8)`, `B₁` 1.0424221712 = `Bi(0.8)`; Wronskian 0.2250790790 / `(2/π) · ½ · sin(π/4)` 0.2250790790; `A₂″` 0.0765126 / `z²A₂` 0.0765126 | holds | — |
| 9.2 reflection, rotations | `n = 2`, `z = 0.9`; values at 0 | `A₂(−0.9)` 0.4858161696 / `B₂(0.9)/2` 0.4858161696; `(e^{−πip} + e^{πip})/(2cos pπ) = 1`; `i(−2i sin pπ)/(2p^{1/2} sin pπ) = p^{−1/2}` | holds | — |
| `generalizedAiryA_eq_integral` | residue series; `n = 1` | `(π/sin pπ)(𝐅(1−p, c) − c^p 𝐅(1+p, c))` gives the 9.1 series; `n = 1` gives `π⁻¹√(x/3)K_{1/3}(ζ)` (9.6.1, DLMF-9.13 line 183) | holds | — |
| `isBigO_generalizedAiryA_sub` | `n = 1` | `√(1/(3π)) sin(π/3) = 1/(2√π)` | holds | — |
| 9.4 `U_m(−t)` | `m = 3`, `m = 4` | `m = 3`: `w = U₃(−t)` gives `w″ = −(9/4)tw` against the required `+(9/4)tw`; `m = 4`: `t²` is even, so it holds | false for odd `m` | R02 |
| 9.4 `W_m`, Checks | solve 9.13.23–9.13.24; `m = 3`; `α = 0` | `U₁ = Γ(1 − 1/m)𝐅(1 − 1/m, −x^m/m²)` and `U₂ = Γ(1 + 1/m) x 𝐅(1 + 1/m, −x^m/m²)` give the README's `W_m`; `(3/2)^{4/3}(3/2)^{2/3} = 9/4`; `U₁(x, 0) = cos x`, `U₂(x, 0) = sin x` | holds | — |
| `reidAiry_connection_sum`, 9.5 Checks | path bookkeeping; `p = 1, 3` | the rays cancel in pairs and the arcs give the clockwise circle, `−B₀`; `B₀(z, 1) = 1`, so `A₁ + A₂ + A₃ = −1`; `B₀(z,0) − zB₀(z,2) + 2B₀(z,3) = 0 − z² + z²` | holds | — |

## Not verifiable

- **Nemes (2017), *Acta Appl. Math.* 150:** the journal version is behind a paywall. I read arXiv:1606.07961v2, which the README cites.
- **Not fetched:** Olver (1974), Vallée–Soares (2004), Laurenzi (1993), Reid (1972, 1995), Drazin–Reid (1981), Swanson–Headley (1967), Olver (1977, 1978) and Smirnov (1960). Every statement the README draws from them is a DLMF formula, and was checked against DLMF.
- **DLMF Figures 9.13.1–9.13.2:** images, not read; 9.5 is outside the sample. 9.13.30 (DLMF-9.13 lines 1133–1141, `B₁(z, 0) = π Hi(z)`) fixes `ℐ₁` as the ray from `0`.

## Source issues

- **Error** in DLMF at 9.10.7 (§9.10(ii), Release 1.2.8): the source gives the leading term of `∫_{−∞}^x Bi` as `x → −∞` with a plus sign; it should carry a minus sign, since its derivative must reproduce 9.7.11 (at `x = −10` the integral is −0.01504); affects a stated result.
- **Misprint** in DLMF at 9.13.18 (§9.13(i)): the source gives the recessive sector with lower end `−(2j−1)π/m`, a single ray when `j = 0`; it should be `(2j−1)π/m < ph t < (2j+1)π/m`; affects a stated result.
- **Gap** in DLMF at 9.12.24 (§9.12(vii)): the source states the Mellin–Barnes integral for `Hi` with only a contour condition and no sector; it converges and holds for `|ph(e^{πi}z)| < 2π/3`; affects nothing.
- **Gap** in DLMF at 9.13.22–9.13.24 (§9.13(i)): the source relates Smirnov's functions to `W_m` for every positive integer `α`; `W_m` exists only for even `m = α + 2`, so only even `α`; affects nothing.
- **Gap** in DLMF at 9.13.27 (§9.13(ii)): the source defines `B_k(z, p)` for all integers `p`; since `ℐ₁` starts at `0` (9.13.30), the integral diverges there for `p ≥ 1`; it should restrict to `p ≤ 0` or define a finite part; affects nothing.
