# Review of SpecialFunctionsAiry (pull request #1928 at 04a2ab2)

**Verdict:** accepted

Incremental re-review of the 88 lines changed since 618ca5a (the head the previous review read). No finding remains, new or carried, and the gate passes.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/SpecialFunctionsAiry/README.md` lines 1634–1639 name SpecialFunctionsBessel as the consumer of 1.7 (its 4.3), of the `J₀` integral of 8.3 (its 3.1) and of the Airy functions (its 11.1). At #1987's head, `TauCetiRoadmap/SpecialFunctionsBessel/README.md` lines 396–408 consume `exp_neg_mul_kummer_two_mul` and the `J₀` integral from here; its 4.3 (line 834) derives `besselJ_eq_kummer` from "SpecialFunctionsAiry 1.7", and its 3.1 (line 765) consumes 10.9.1 from "SpecialFunctionsAiry 8.3". One owner each, in the supply direction.
- R02 — repaired: line 1535, "`U_m(t)` for every `m`, `U_m(−t)` for even `m`, and `V̄_m(t)` for odd `m` solve `d²w/dt² = ¼ m² t^{m−2} w` (9.13.13)". It agrees with DLMF 9.13 (Release 1.2.8) lines 528–531, with the README's `U_m` standing for DLMF's `V_m` at odd `m` (line 1525).
- R03 — repaired: lines 108–110, "**Consumed by RandomMatrices.** This roadmap owns … RandomMatrices §8.4 consumes them from 1.1–1.2, Layer 2, 3.2, 3.4–3.6 and 8.5." No "companion revision", no merge plan; Downstream consumers (line 1630) is timeless. RandomMatrices §8.4 exists on main (its README line 1029).
- R04 — repaired: the "From Tau Ceti" contract (lines 300–302) lists `TauCeti.Contour.argumentPrinciple_nullHomologous` with its file and hypothesis; the 5.3 route (lines 896–899) and *Needs:* (line 915) cite the cycle form. The declaration is at `TauCeti/Analysis/Contour/Argument/Cycle.lean:110` at the pinned Tau Ceti 2fd255d, with hypotheses `IsPiecewiseC1On γ a b`, `γ a = γ b`, `IsNullHomologous γ a b U`, as the README states.
- R05 — repaired: References (lines 1706–1708) pin "Release 1.2.8 of 2026-09-15" and say every equation number and every statement of what DLMF prints refers to it; 7.3 (line 1168) and 9.4 (line 1541) name the release. The cached texts carry "Version 1.2.8; Release date 2026-09-15" (DLMF 9.13 lines 1384–1385, DLMF 9.10 line 940).

## Verified sound

**Gate, dependency check, build, elaboration.**
- Gate re-run at 04a2ab2 with `--build`: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`.
- Dependency check with `--movable` against the merge order: `depcheck: 236 roadmaps, 2261 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpecialFunctionsAiry'` is empty.
- `lake env lean TauCetiRoadmap/SpecialFunctionsAiry/Suggested.lean` exits 0 with 50 warnings, every one "declaration uses `sorry`". The file is unchanged since 618ca5a, so the previous review's signature comparison (83 + 1 declarations), one-tactic probe and headline list stand; the worker's dump of the 84 elaborated signatures reports none that lost a binder.

**The changed passages.**
- Scope table row (line 103) and 8.3 (lines 1354–1356): the `J₀` integral is now owned "for every `a ∈ ℂ`", which is the generality SpecialFunctionsBessel's contract asks for (its README line 406, "for every `z ∈ ℂ`"). Both sides are entire in `a` and the termwise route works for every complex `a`: `∫₀^{2π} cos^{2k} φ dφ = 2π (2k)!/(4^k (k!)²)`, odd powers integrate to zero, and the sum is `∑ (−1)^k (a/2)^{2k}/(k!)²`, the series of `Complex.besselJ 0 a` (`Mathlib/Analysis/SpecialFunctions/Bessel.lean:55`, `besselJ_def` at :59; `analyticOnNhd_besselJ_int` at :116 gives that `J₀` is entire).
- 5.3 route: with `U = ℂ`, `S` the finitely many zeros of `Bi` in the closed truncated sector, and `γ` the boundary (two arcs and two radial segments, piecewise `C¹`, closed, null-homologous since every closed curve in `ℂ` is), the hypotheses of `argumentPrinciple_nullHomologous` hold and its right side is `2πi` times the number of zeros, each with winding number 1. The Rouché step is unchanged.
- 7.3: only the release is added to the erratum sentence; the mathematics (minus sign) is as in the previous review's table.
- 9.4: the solution list (see the table); the 9.13.18 remark now names the release (DLMF 9.13 lines 692–693 print `−(2j−1)π/m ≤ ph z ≤ (2j+1)π/m` at 1.2.8).
- Downstream consumers: the SpecialFunctionsBessel bullet matches its contract item by item (`Ai`, `Bi`, `Hi`, the generalized Airy functions, the connection formulas of 1.4, the Bessel forms of 1.7, the modulus and phase of 4.1, the integrals of 9.3; its README lines 398–401). Its relative link points at a folder that is in the merge order, like the links to the three suppliers; it carries no supply edge (depcheck 0).
- No process word, pull-request number or round label is left in the README (`companion`, `revision`, `pull request`, `#19xx`, `so far`, `removed`: no hits).

**Library declarations opened at the pins** (Tau Ceti 2fd255d, Mathlib per `lake-manifest.json`).
- `TauCeti.Contour.argumentPrinciple_nullHomologous`, `TauCeti/Analysis/Contour/Argument/Cycle.lean:110`.
- `TauCeti.rouche` (`TauCeti/Analysis/Complex/Conformal/Rouche.lean:294`) and `TauCeti.rouche_exists_eq_zero_iff` (:359).
- `Complex.besselJ` (`Mathlib/Analysis/SpecialFunctions/Bessel.lean:55`), `Complex.besselJ_def` (:59), `Complex.analyticOnNhd_besselJ` (:79), `Complex.analyticOnNhd_besselJ_int` (:116).

**Cross-roadmap citations resolved.**
- SpecialFunctionsBessel at #1987's head: 3.1 (line 758), 4.3 (line 826), Layer 11 / 11.1 (lines 1476–1478), the "From SpecialFunctionsAiry" contract (lines 396–408).
- RandomMatrices §8.4 on main 1bea835 (`TauCetiRoadmap/RandomMatrices/README.md:1029`; the Airy kernel and `Ai` at its lines 1034 and 1038). Main still plans them there until the RandomMatrices revision merges after this roadmap; the README here states only the ownership, which is the sanctioned direction (an on-main roadmap cannot cite one that is not on main).
- `scratch/overlaps.md`: no open pull request changes this folder, no cited id is dropped, no id depends on an open revision's numbering. The closest roadmaps in vocabulary are SpecialFunctionsBessel (settled above) and SpecialFunctionsConfluent (a different "second transformation", DLMF 13.2.40 for `U`, as the previous review recorded).
- `scratch/citations.md`: the 18 Lean names found nowhere are this roadmap's own declarations (declared in `Suggested.lean`), two supplier names at open heads (`Asymptotics.HasAsymptoticExpansion` in AsymptoticExpansions, `TauCeti.regularizedHGFun_kummer_equation` in SpecialFunctionsParabolicCylinder §1.3, both resolved by the previous review) and `Complex.Gamma_mul_Gamma_add_third`, declared here (7.1).

**Sources sample.** Only 8.3 of the seeded sample falls in the changed passages; it is checked above and in the table. The other targets of the sample (1.3, 1.6, 1.7, 2.3, 2.4, 3.6, 5.2, 6.1, 6.5, 6.6, 7.1, 7.4, 7.6, 9.3) are untouched since 618ca5a, and the previous review's locator checks of 1.7, 6.1, 6.5, 6.6 and 9.4 stand. Read at this round, DLMF Release 1.2.8 in the sources cache: 9.13 lines 497–531 (9.13.13 and its solution list), 626–657 (9.13.17, even `m`), 659–694 (9.13.18 and its sector), 1384–1385 (release); 9.10 lines 276–280 (9.10.7 with `+ π/4` and no minus sign), 940 (release).

**Adversarial table.** Rows for statements the diff leaves untouched carry the previous report's values (marked "prev."); rows for changed statements are computed here (double precision; series against a 400-point trapezoid rule on the periodic integrand, or exact).

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| 8.3 `J₀(a) = (2π)⁻¹ ∫₀^{2π} e^{ia cos φ} dφ` for every `a ∈ ℂ` | `a = 1 + i`; `2.5 − 0.7i`; `3i`; `−1.3 + 2i`; `0` | series 0.9376084768 − 0.4965299476i / integral same (difference 1.2e−16); −0.1113081712 + 0.3665285794i / same (1.7e−16); 4.8807925859 / same; 1.1620397220 + 1.6432140635i / same; 1 / 1 | holds for complex `a` | — |
| 8.3 the two forms of the `J₀` integral (10.9.1 route in SpecialFunctionsBessel 3.1) | `a = 1 + i` | `π⁻¹ ∫₀^π cos(a cos φ) dφ` 0.9376084768 − 0.4965299476i / `J₀(a)` same; the imaginary part `∫₀^{2π} sin(a cos φ) dφ` vanishes under `φ ↦ φ + π` | holds | — |
| 9.4 solution list of 9.13.13 | `m = 3`: `w(t) = U₃(−t) ∝ Ai(−ct)`, `c = (3/2)^{2/3}`, `c³ = 9/4` | `w″ = c² Ai″(−ct) = −c³ t w = −(9/4) t w` / required `+(9/4) t w` | fails, and the sentence no longer claims it | R02 repaired |
| 9.4 solution list of 9.13.13 | `m = 3`: `U₃(t) ∝ Ai(ct)` (DLMF's `V₃`); `m = 4`: `U₄(±t) ∝ A₂(±√2 t)`, `A₂″(z) = z² A₂(z)` | `(ct)`: `w″ = c³ t w = (9/4) t w`; `(±√2 t)`: `w″ = 2 · 2t² · w = 4t² w = ¼ · 16 · t² w` | holds for every `m` and for even `m` at `−t` | — |
| 9.4 9.13.18 sector | `j = 0` | README `−π/m < ph t < π/m` / DLMF 1.2.8 prints `−(2j−1)π/m ≤ … ≤ (2j+1)π/m`, which at `j = 0` is `π/m ≤ ph ≤ π/m` | README's reading is the recessive sector | R05 repaired |
| 5.3 route via `argumentPrinciple_nullHomologous` | `U = ℂ`, `S` = zeros of `Bi` in `{π/3 ≤ ph z ≤ π/2, r ≤ ∣z∣ ≤ R}`, `γ` the boundary | hypotheses: open `U` ✓, `Bi` entire and nonzero off `S` ✓, meromorphic at `S` ✓, `γ` piecewise `C¹`, closed, misses `S` for generic `r, R` ✓, null-homologous in `ℂ` ✓; conclusion `2πi ∑ 1 · ord = 2πi · #zeros` | holds | R04 repaired |
| 5.3 Checks `β₁`, `β′₁` | `k = 1` | prev.: `β₁` 0.9775448867 + 2.1412907060i (phase 1.14253 ∈ (1.0472, 1.5708)); `β′₁` 0.2149470745 + 1.1006001433i (phase 1.37792) | holds | — |
| 7.3 9.10.7 sign | `x = −8, −10` | prev.: integral 0.0147564 / −0.0150404; README term 0.0191747 / −0.0123989; DLMF 1.2.8 sign −0.0191747 / +0.0123989; error scale `∣x∣^{−9/4}` 0.0093 / 0.0056 | README correct; release now pinned | R05 repaired |
| 1.7 `exp_neg_mul_kummer_two_mul` (now a SpecialFunctionsBessel supplier) | `a = 0.7, x = 1.3`; `2a = −1` | prev.: 1.5637032032 / 1.5637032032; at `2a = −1` left −0.5651591, right 0 | holds with `2a ∉ {0, −1, …}`, the hypothesis #1987 copies (its line 403) | R01 repaired |
| `airyAi_sq_eq_besselJ_integral` | `x ≥ 0`; convergence | prev.: integrand `∼ t^{−1/2} cos(t³/12 + …)`; source condition `x ≥ 0` | holds | — |
| All other rows of the previous report (1.1–9.5, 58 rows) | as there | prev. values unchanged; the statements are untouched by the diff | hold | — |

## Not verifiable

- **Olver (1977a, 1978), Smirnov (1960):** not fetched; the 9.13.13–9.13.18 statements were checked against DLMF 1.2.8, which cites them.
- **DLMF Chapter 10 (10.9.1):** not in the sources cache; the identity consumed by SpecialFunctionsBessel 3.1 was checked by computation above, not against the chapter text.
- **The `lean-DLMF` errata report** named under Prior formalization: not opened; the README cites it as a pointer, not as the source of a statement.
- **Nemes (2017)** journal version: paywalled; arXiv:1606.07961v2 was read by the previous review. Untouched this round.

## Source issues

- **Error** in DLMF at 9.10.7 (§9.10(ii), Release 1.2.8): the source gives the leading term of `∫_{−∞}^x Bi` as `x → −∞` with a plus sign; it should carry a minus sign, since its derivative must reproduce the leading term of 9.7.11 (at `x = −10` the integral is −0.01504); affects a stated result.
- **Misprint** in DLMF at 9.13.18 (§9.13(i), Release 1.2.8): the source gives the recessive sector as `−(2j−1)π/m ≤ ph z ≤ (2j+1)π/m`, a single ray when `j = 0`; it should be `(2j−1)π/m < ph t < (2j+1)π/m`; affects a stated result.
