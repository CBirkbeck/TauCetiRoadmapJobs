# Review of SpecialFunctionsParabolicCylinder (pull request #1801 at d76fe7a)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/SpecialFunctionsParabolicCylinder/README.md` and `Suggested.lean` at d76fe7a: principles, the seeded source sample against the DLMF text (read through the sources service), an adversarial pass over every statement with computed witnesses, a duplication and ownership audit against the pinned Mathlib and Tau Ceti, main and the open roadmap pull requests, the dependency check, elaboration of a probe copy of `Suggested.lean`, and the one-tactic padding probe. The gate at this head fails (`imports`, `build`, `tex`); its failures are R01 and R06.

## R01 (P1) — The build fails: an import that does not exist at the pinned Tau Ceti

Location: `TauCetiRoadmap/SpecialFunctionsParabolicCylinder/Suggested.lean` line 4, `import TauCeti.Analysis.SpecialFunctions.RegularizedHypergeometric`; line 46, the proof term `Complex.hasSum_regularizedHGFun (by simp) z`.

Claim: the file builds against the pinned libraries.

Witness: the pinned Tau Ceti (358314d, `lake-manifest.json`) has no file `TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean` and no declaration `hasSum_regularizedHGFun` anywhere; the gate's targeted build exits with "bad import". The pull-request description itself says the file was built against a later Tau Ceti.

Repair: delete the import at line 4 and the declaration `hasSum_regularizedKummer` (lines 43–46; see R08). If the series statement is to stay in the README (Milestone 1.1), derive it from Mathlib at the pin: `Complex.regularizedHGFun` is `(regularizedHGFunSeries a b).sum z` (`Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean` lines 156–172), `Complex.radius_regularizedHGFunSeries_eq_top` (line 229) gives infinite radius, `FormalMultilinearSeries.hasSum` (`Mathlib/Analysis/Analytic/ConvergenceRadius.lean` line 457) gives the `HasSum`, and `FormalMultilinearSeries.ofScalars_apply_eq` (`Mathlib/Analysis/Analytic/OfScalars.lean` line 122) identifies the terms with `regularizedHGFunCoeff {a} {b} n * z ^ n`. Tested: a scratch copy with line 4 removed and that proof replaced by `sorry` elaborates under `lake env lean` with `sorry` as the only warning (99 declarations, 7 s with cached object files), so nothing else in the file depends on the missing module.

## R02 (P2) — Supplier drift: six Tau Ceti declarations and one file cited as existing do not exist at the pin

Location: `README.md` lines 31–32 ("Tau Ceti's existing `TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`"), 137 (`Complex.hasSum_regularizedHGFun`), 147–148 (`Real.continuous_inv_Gamma`, `Real.exists_abs_inv_Gamma_le`, `Real.Gamma_nat_add_half_eq_factorial`), 160–166 (`TauCeti/Analysis/Complex/LaplaceTransform.lean`, `TauCeti.differentiable_intervalIntegral_mul_cexp_neg_mul`, `TauCeti.differentiableOn_integral_mul_cexp_neg_mul`), and Milestone 1.1 (line 310, "Specialize Tau Ceti's `Complex.hasSum_regularizedHGFun`").

Claim: these are consumed, "do not rebuild them".

Witness: at the pinned Tau Ceti, `TauCeti/Analysis/SpecialFunctions/Gamma.lean` contains one declaration, `Real.measurable_Gamma` (line 35); `TauCeti/Analysis/Complex/` has no `LaplaceTransform.lean`; a search of the whole pinned tree for `regularizedHGFun`, `cexp_neg_mul` (other than the Bochner Gaussian lemmas) and the three `Real.*Gamma*` names finds nothing. The README links them to Tau Ceti's `main` on GitHub, not to the pin.

Repair: remove the seven citations. Milestones 6.1, 7 and 8 then need the differentiability and tail estimates of Laplace integrals with measurable bounded kernels as targets of this roadmap (state them in Milestone 7 as the general infrastructure, with their hypotheses: kernel locally integrable on `(0, ∞)`, `e^{−σt}`-integrable tail, parameter in `Re z > σ`), and Milestone 1.1 takes the Mathlib route of R01. For the special-value arguments cite Mathlib's `Real.Gamma_nat_add_half` (used at the pin in `TauCeti/Probability/Distributions/Gaussian/Moments.lean` line 133) and `Complex.differentiable_one_div_Gamma` instead of the three nonexistent real lemmas.

## R03 (P2) — Kummer's equation for `regularizedHGFun` has another owner

Location: `README.md` line 317 (Milestone 1.3); `Suggested.lean` lines 52–54, `regularizedHGFun_singleton_kummer_equation`.

Claim: this roadmap owns "Kummer's differential equation for `regularizedHGFun`" (line 191, "Targets not supplied by the consumed APIs").

Witness: QuantumFoundations §9.4 (open pull request adding a new roadmap folder, by another author) plans the same object with the same statement: `TauCetiRoadmap/QuantumFoundations/Suggested.lean` lines 139–143, `regularizedHGFun_kummer_equation (a b z : ℂ) : z * deriv (deriv (fun w => Complex.regularizedHGFun {a} {b} w)) z + (b - z) * deriv … - a * … = 0`, and its README §9.4 "Prove `regularizedHGFun_kummer_equation` … for all `a, b, z`". RelativisticQuantumFieldTheory (README lines 3629–3645) already consumes that section for the Kummer equation. Two open pull requests building one object is the "two owners" defect.

Repair: add `From TauCetiRoadmap.QuantumFoundations` to the supplier contracts, citing §9.4 for Kummer's equation of `𝐌(a, b, ·)` for all parameters; delete Milestone 1.3 and `regularizedHGFun_singleton_kummer_equation`; keep 1.2 (derivative), 1.4 (Kummer's transformation), 1.5 and 1.6, which QuantumFoundations does not state, and derive the Weber equation of `u₁`, `u₂` (Milestone 2.3) from the cited equation plus 1.2.

## R04 (P2) — The vertical Gamma decay on strips is planned again instead of imported

Location: `README.md` lines 515–531 (Milestone 6.6(a), "Deduce the following uniform bound … `|Γ(x + iy)| ≤ C (1 + |y|)^K exp(−π|y|/2)` … all heights on a positive closed strip, all heights on a fixed line, `|y| ≥ 1` on any bounded real strip"); `Suggested.lean` lines 349–360, `exists_norm_Gamma_le_on_strip`, `exists_norm_Gamma_le_on_vertical`.

Claim: "the vertical Gamma decay estimates … are not supplied by the consumed APIs" (line 193) and are built here from `GammaSeq_tendsto_Gamma`.

Witness: ZerosOfLFunctions §1.3 "Vertical strips" (at the head of its open pull request, README lines 468–475) is the target `log ‖Γ(σ + it)‖ = (σ − 1/2) log |t| − π|t|/2 + log(2π)/2 + O(1/|t|)` uniformly for `σ` in every compact interval as `|t| → ∞` (DLMF 5.11.9), with §1.2 the Stirling expansion on sectors. ZerosOfLFunctions is line 78 of the merge order, this roadmap line 378; AnalyticNumberTheoryPartII §4.3b already cites "ZerosOfLFunctions Layer 1 supplies, for every compact real interval …" as the owner. The uniform bound of 6.6(a) for `|y| ≥ 1` is that statement exponentiated; only the pole-separated bounded-height part is new.

Repair: add `From TauCetiRoadmap.ZerosOfLFunctions` to the supplier contracts citing §1.3 (and §1.2 if the sector form is used); restate 6.6(a) as: the product identity and its comparison in `x`, the value `|Γ(1 + iy)|² = πy/sinh(πy)`, and the corollary "for `u ≤ v`, `η > 0` there are `C, K` with the displayed bound", with `*Needs:* ZerosOfLFunctions §1.3; Mathlib Gamma recurrence; compactness of the pole-separated bounded region`. Delete `exists_norm_Gamma_le_on_vertical` from `Suggested.lean` (a corollary of the strip bound) and keep the strip bound only if it is kept as a stated corollary.

## R05 (P3) — The README is not in TauCetiRoadmap form; definitions have no Checks and targets no `*Needs:*` lines

Location: `README.md` line 1 (`# Parabolic cylinder functions`), lines 39, 103, 125, 236 (sections "Scope and completion criterion", "Ownership and dependencies", "Mathlib and Tau Ceti inventory", "Conventions (pinned)"), lines 306–830 (`## Milestone k` with numbered items).

Claim: the file is a roadmap in the repository's form.

Witness: the required shape (project README, "Writing a roadmap"; the brief's section "The README in TauCetiRoadmap form") is `# Roadmap: <title>`, `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k: <title>` with `### k.n` prose subsections each ending in a `*Needs:*` line, a `**Checks.**` list of at least three discriminating tests per definition, `### Examples` and `### Dependencies` per layer, `## Downstream consumers`, `## References`. Here no definition (`u₁`, `u₂`, `U`, `V`, `D`, `F`, `Hh_n`, `B`, `W`, `φ₂`) has a Checks list, no target has a `*Needs:*` line (so the dependency check has nothing to read: "236 roadmaps, 2072 edges, 0 problem(s)" for this roadmap means zero edges), and the two cross-roadmap suppliers of R03 and R04 have no contract section to live in.

Repair: rewrite in the shape above, keeping the mathematics (which is sound, see below): one layer per milestone, each theorem as a `### k.n` paragraph with its hypotheses and locator and a `*Needs:*` line; for each definition the API bullets and at least three Checks, for example for `U`: the value `U(a, 0)` of DLMF 12.2.6 at `a = −½` (equal to `1`), the Hermite case `U(−3/2, z) = z e^{−z²/4}`, and the negative control that the sign of the `u₂` coefficient is fixed by `U′(−½, 0) = 0`, which the opposite sign `+√π 2^{−(a/2−¼)} Γ(¼ + a/2)⁻¹` fails (it gives `U′(−½, 0) = −2·(−√π/Γ(0))`, not `0`, after the `Γ(0)⁻¹ = 0` check is removed by taking `a = ½`: then `U′(½, 0) = −√π/Γ(½) = −1`, while the wrong sign gives `+1`). Rename the Lean section comments to `/-! ## Layer k: <title> -/` to match.

## R06 (P3) — Gate `tex`: 46 TeX-style powers read as prose

Location: `README.md` lines 254–258, 263–269, 292–297 (fenced `text` blocks indented inside list items) and 493–494 (a code span broken over two lines).

Claim: the formulas are in code blocks and code spans.

Witness: the gate's `tex` scanner reports 46 hits of `^{` at those lines; the fences are indented two spaces inside bullet items and the loop-integral span opens on line 493 and closes on 494, which the scanner does not treat as code.

Repair: move each of the three displays to a top-level fenced block (or an indented code block at column 4 after a blank line), and put `L_r(a, z)` on one line in one code span, or in a fenced block; rerun the gate until `tex=0`.

## R07 (P3) — Locators: Watson's lemma in a sector is DLMF 2.4.1, not §2.3; several targets carry no locator

Location: `README.md` line 855 ("§2.3 (F. W. J. Olver, R. Wong)") and Milestone 7 (lines 629–648); Milestones 1.2, 1.5, 1.6, 2.2, 2.4, 2.5 and 6.6(a) (lines 315, 323, 326, 337, 342, 347, 515) have no locator.

Claim: Milestone 7 is sourced in DLMF §2.3.

Witness: DLMF §2.3(ii), equations 2.3.7–2.3.8, is the real form `x → +∞` (dlmf23 lines 321–365); the complex form "as `z → ∞` in the sector `|ph z| ≤ ½π − δ`" with `Re λ > 0` is DLMF 2.4.1 in §2.4(i) (dlmf24 lines 81–118), and the same subsection (lines 120–127) gives the rotation of the integration path that Milestone 8.1 uses. The derivative formula of 1.2 is DLMF 13.3.22; 12.4.3–12.4.6 are cited for the series (correct, verified) but the Wronskian and uniqueness statements of 2.4 and the rotations of 2.5 cite nothing.

Repair: cite DLMF 2.4.1 for Milestone 7.2 and 2.3.8 for 7.3, DLMF 13.3.22 for 1.2, and give each of the other listed targets a locator (DLMF §12.2(i) and 12.7.12–12.7.13 for the Weber-equation facts; a textbook section for the Wronskian constancy and uniqueness, for example Olver, *Asymptotics and Special Functions*, Chapter 5 §1).

## R08 (P3) — Padding in `Suggested.lean`

Location: `Suggested.lean` lines 43–46 `hasSum_regularizedKummer`; 241–242 `dawson_zero`; 255–257 `parabolicCylinderD_natCast_sqrt_two_mul_im`; 278–280 `hasDerivAt_repeatedGaussianIntegral_zero`; 286–288 `repeatedGaussianIntegral_one`; 295–298 `repeatedGaussianIntegral_zero_right`; 356–360 `exists_norm_Gamma_le_on_vertical`; 367–371 `residue_div_sub_eq_numerator`; 430–432 `verticalIntegrable_Gamma`; 558–563 `normalized_parabolicCylinderU_sub_one`; and the API-lemma block 269–272, 329–332, 470–487, 543–548 (`integrableOn_*`, `integrable_*_barnes_kernel`, `tendsto_integral_barnes_kernel_horizontal`).

Claim: the file states the roadmap's headline theorems.

Witness (one-tactic probe on a scratch copy): `dawson_zero` closes by `simp [dawson]`; `residue_div_sub_eq_numerator` is already closed in the file by one `simpa` from `TauCeti.Contour.residue_div_sub_pow_of_analyticAt`; `hasSum_regularizedKummer` is a library term (R01). The others restate a boundary case of a neighbouring statement (`_zero`, `_one` are the `n = 0`, `n = 1` cases of `_succ` and `_add_two`), mirror a README Check (reality of `D_n(√2 x)`, the value `Hh_n(0)`), are corollaries (`_on_vertical`, `verticalIntegrable_Gamma`), rearrange M4.1 (`normalized_…_sub_one` is `parabolicCylinderU_recurrence` multiplied by `e^{z²/4} z^{a−½}`), or are integrability lemmas of the API. The file has 99 declarations and reads as an API catalogue.

Repair: delete the listed declarations from `Suggested.lean`; the README keeps each as an API bullet or a Check. The headline set to keep is: the Weber equation and Wronskian of `u₁, u₂` and the uniqueness theorem, the definitions of `U`, `V`, `D`, `W` and their initial-value factors, the Wronskians and connection formulas, the recurrences and iterated-derivative formulas, the Hermite, Dawson, `erfc` and `Hh_n` identities, the Laplace, cosine, straight-line and Barnes representations with their residue-corrected forms, positivity, Watson's lemma, 12.9.1–12.9.4, the recessive-solution theorem, 12.12.1–12.12.4, 12.13.1–12.13.5, and 12.14.3–12.14.4 with the phase identity.

## Verified sound

**Gate and build.** The worker's gate: `set_option=0 … sorry-data=0 … imports=1 … tex=46 … build=3 FAIL`. Probe elaboration of the file with the missing import removed and one proof sorried: exit 0, `sorry` the only warning, every `#check @name` printed (99 signatures compared with the README; the Lean generality equals the README's in every case checked below, no section variable is lost since the file uses none).

**Dependency check** (`gate --depcheck … --movable`): `depcheck: 236 roadmaps, 2072 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap is line 378 of the merge order (last); its only cross-roadmap citation is ContourIntegration (Completed), resolved: `Completed/ContourIntegration/README.md` has "Layer 2: residues, the Cauchy primitive, and the classical residue theorem" (line 158), and the pinned Tau Ceti has `TauCeti.Contour.residue` (`Residue/Basic.lean` line 80), `residue_div_sub_pow_of_analyticAt` (line 477), `residue_eq_of_tendsto_sub_mul` (`SimplePole.lean` line 150).

**Library declarations opened at the pins** (Mathlib f6090c7, Tau Ceti 358314d): `Complex.regularizedHGFun`, `regularizedHGFunCoeff`, `regularizedHGFunSeries`, `regularizedHGFun_zero`, `radius_regularizedHGFunSeries_eq_top`, `analyticOnNhd_regularizedHGFun_of_card_le`, `regularizedHGFun_zero_zero` (`RegularizedHypergeometric.lean` 67, 156, 172, 175, 229, 257, 345); `Complex.besselJ` (`Bessel.lean` 55, `(x/2)^a · ₀F̃₁(a+1; −(x/2)²)`, the standard `J_a`); `Complex.digamma` (`Gamma/Digamma.lean` 48, `logDeriv Gamma`); `Complex.Gamma_mul_Gamma_one_sub`, `Gamma_mul_Gamma_add_half`, `GammaSeq_tendsto_Gamma`, `differentiable_one_div_Gamma` (`Gamma/Beta.lean` 397, 558, 334, 521); `Complex.Gamma_one_half_eq` (`GaussianIntegral.lean` 322, value `π^(1/2 : ℂ)`); `Gamma_eq_integral`, `Gamma_add_one`, `Gamma_conj`, `GammaIntegral_convergent` (`Gamma/Basic.lean` 319, 312, 356, 87); `GammaIntegral_eq_mellin`, `tendsto_self_mul_Gamma_nhds_zero` (`Gamma/Deriv.lean` 48, 102); `mellinInv_mellin_eq` (`MellinInversion.lean` 92), `Complex.VerticalIntegrable`, `MellinConvergent` (`MellinTransform.lean` 85, 44); `integral_boundary_rect_eq_zero_of_differentiableOn` (`CauchyIntegral.lean` 293); `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (`ParametricIntegral.lean` 286); `integral_gaussian_complex` (`GaussianIntegral.lean` 237); `Polynomial.hermite` (`Hermite/Basic.lean` 48, probabilists' `He_n`), `deriv_gaussian_eq_hermite_mul_gaussian` (`Hermite/Gaussian.lean` 40); Tau Ceti `TauCeti.Real.erf`, `erfc` with derivatives, parity and monotonicity (`Erf.lean` 51–136), `TauCeti.hermiteFunction n x = He_n(x√2) e^{−x²/2}/√(n!√π)` (`Hermite/Function/Basic.lean` 38–40), `Polynomial.derivative_hermite`, `hermite_add_two`, `hermite_aeval_neg` (`Hermite/Derivative.lean` 74, 95, 106). All as the README describes, except the seven of R02.

**Ownership.** Searched main, the open roadmap pull requests and the sibling checkouts by object (parabolic cylinder functions, Weber's equation, Kummer's equation and transformation, Watson's lemma, Mellin–Barnes integrals, Dawson's integral, repeated Gaussian integrals, vertical Gamma bounds, exponential Mellin inversion). Parabolic cylinder functions, Dawson's integral, `Hh_n`, Watson's lemma and the Barnes machinery have no other owner (IncompressibleFlows' `parabolicCylinder` is a space-time cylinder). AutomorphicSpectralTheory §0.26–0.28 defines Whittaker `M`, `W` through `regularizedHGFun` and proves the Whittaker equation on `y > 0`, a different object. The two overlaps found are R03 and R04. No declaration of `Suggested.lean` carries the fully qualified name of a declaration in another roadmap.

**Seeded source sample** (DLMF read through the sources service, ids `dlmf122`, `dlmf124`, `dlmf125`, `dlmf127`, `dlmf128`, `dlmf129`, `dlmf1212`, `dlmf1213`, `dlmf1214`, `dlmf132`, `dlmf72`, `dlmf23`, `dlmf24`, `dlmf54`, `dlmf511`, `dlmf1210`):

- "What this roadmap owns" table: 12.2.1–12.2.23 (`dlmf122` lines 101–895), 12.4.1–12.4.6 (`dlmf124` 46–192), 12.5.1–12.5.9 (`dlmf125` 67–420), 12.7.1–12.7.7 and 12.7.12–12.7.13 (`dlmf127` 69–483), 12.8.1–12.8.12 (`dlmf128` 60–390), 12.9.1–12.9.4 (`dlmf129` 74–195), 12.12.1–12.12.4 (`dlmf1212` 45–150), 12.13.1–12.13.6 (`dlmf1213` 68–215), 12.14.1–12.14.23 (`dlmf1214` 113–1079): every statement, sign and hypothesis the README restates agrees with the text (12.5.2–12.5.3 need `|ph z| < π/2`, which the README writes as `Re z > 0`; 12.5.8–12.5.9 are stated by DLMF on the separating contour for `a ≠ −½, −3/2, …`, respectively `a ≠ ½, 3/2, …`, which the README's residue-corrected forms reproduce; 12.13.5 has `Re a ≤ −½, 0 ≤ t ≤ π/4` as the README says; 12.12.4 is stated with `Ū`, and DLMF 12.2(vi), line 838, leaves `Ū` undefined at `a = ½, 3/2, …` as the README notes).
- "What it does not own": 12.13.6 uses complex `erfc` (`dlmf1213` 213) and 12.2.22–12.2.23 are the modulus and phase functions (`dlmf122` 847–895), consistent with the exclusions.
- "The boundary in one sentence" and "Targets not supplied by the consumed APIs": consistent with the pins except R03 and R04.
- Kummer's equation 13.2.1 and transformation 13.2.39 (`dlmf132` 118, 1531) ✓; Watson's lemma 2.3.7–2.3.8 real, 2.4.1 complex (R07); `|Γ(½ + iy)|² = π/cosh(πy)` and `|Γ(iy)|² = π/(y sinh πy)` (`dlmf54` 129, 162), from which `|Γ(1 + iy)|² = πy/sinh(πy)` follows by the recurrence ✓.

**Adversarial table.** Values computed on each side.

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| `u₁` series 12.4.3 vs Weber's equation | `k = 1, 2`; `z → 0` | series `1 + (a+½)z²/2 + …`, times `e^{−z²/4}`: `1 + (a/2)z² + …`; `u₁″(0) = a = (0 + a)·u₁(0)` | sound |
| Wronskian `u₁u₂′ − u₁′u₂ = 1` | `z = 0` | `1·1 − 0·0 = 1`; constant since the equation has no first-order term | sound |
| `U(a,0)` 12.2.6, Lean `parabolicCylinderU_zero_right` | `a = −½`; `a = −3/2` (pole) | `√π 2^0/Γ(½) = 1`; at `a = −3/2`: `Γ(0)⁻¹ = 0`, Lean RHS `√π/(2^{−½}·0) = 0` | sound (totalised) |
| `𝒲{U,V} = √(2/π)` 12.2.10 | `z = 0`, general `a` | `−2U(0)… `: `√2 π^{3/2}[sin²(π/4 − πa/2) + sin²(π/4 + πa/2)]/π² = √(2/π)` | sound |
| `𝒲{U(a,z),U(a,−z)}` 12.2.11 | `z = 0` | `−2U(0)U′(0) = 2π 2^{−a}/(Γ(¾+a/2)Γ(¼+a/2)) = √(2π)/Γ(½+a)` by duplication | sound |
| 12.2.12, both signs, Lean sign `−I·exp(Iπ(a/2+¼))` | `z = 0`, upper sign | `−i sin(π/4 − πa/2) + sin(π/4 + πa/2) = −i cos(π/4+πa/2) + sin(π/4+πa/2) = −i e^{iπ(a/2+¼)}` | sound |
| 12.2.17 reciprocal form at a Gamma zero | `a = −n − ½` | LHS `0`; RHS `e^{iπ(n+1)/2} + (−1)^n e^{−iπ(n+1)/2} = 0` using 12.2.13 | sound; exclusion for the Gamma-multiplied form needed |
| 12.2.18 reciprocal form | `a = n + ½` | LHS `0`; RHS `U(−a, ±iz)[e^{∓iπ(n/2+½)} + (−1)^n e^{±iπ(n/2+½)}] = 0` | sound |
| 12.2.1 reduction (M3.6) | symbolic | `g″ = s²(t²/4 + A)f`, `s²t²/4 = −α(z + β/2α)²`, `s²A = β²/4α − γ`; sum `−(αz² + βz + γ)` | sound |
| Rotations M2.5, M3.7 | `f(iz)`, `f(e^{iπ/4}z)`, `U(ia, ze^{−iπ/4})` | parameter `−a`; `w″ + (z²/4 − a)w = 0` with parameter `a` from `∓ia`; `f″ = (−z²/4 + a)f` | sound |
| 12.8.2, 12.8.3 | `a = −½` | `U′ + (z/2)U = 0`; `U′ − (z/2)U + U(−3/2,z) = −z e^{−z²/4} + z e^{−z²/4} = 0` | sound |
| 12.8.5–12.8.7 | `a = ½` (`V(½) = √(2/π)e^{z²/4}`, `V(3/2) = z V(½)`) | each identity `0 = 0` | sound |
| 12.8.9–12.8.12 | `m = 1` | reduce to 12.8.2, 12.8.3, 12.8.7, 12.8.6 with `(−1)(½±a)_1` | sound |
| Whittaker recurrences M4.4 | `a = −ν − ½` | `D_{ν+1} − zD_ν + νD_{ν−1} = −(12.8.1)`; `D_ν′ + (z/2)D_ν − νD_{ν−1} = 12.8.2` | sound |
| 12.7.4 Dawson case | all `z`; `z = 0` | `g = (2/√π)e^{z²/4}F(z/√2)` satisfies `g″ = (z²/4 − ½)g` (computed with `F′ = 1 − 2zF`); `g(0) = 0 = V(−½,0)` (`Γ(0)⁻¹`), `g′(0) = √2/√π = V′(−½,0)` | sound |
| 12.7.7 and `Hh_n(0)` | `n = 0`; general | `U(½,z) = e^{z²/4}Hh₀(z)` from 12.5.1; `Hh_n(0) = 2^{(n−1)/2}Γ((n+1)/2)/n!`, `n = 0`: `√(π/2)` | sound |
| `Hh` recurrences | `n = 1`; general by parts | `Hh₁ = e^{−z²/2} − zHh₀`; `(n+2)!Hh_{n+2} = (n+1)!(Hh_n − zHh_{n+1})` | sound |
| 12.7.6 from 12.8.9 | `a = ½`, `m = n` | `(d/dx)^n(e^{x²/4}U(½,x)) = (−1)^n n! e^{x²/4}U(n+½,x)` | sound |
| Hermite bridge M5.2 | real `x` | `D_n(√2x) = e^{−x²/2}He_n(√2x)`; divide by `√(n!√π)` = Tau Ceti's definition | sound |
| 12.5.2 | `a = ½`, real `z` | `∫t^{−½}e^{−t}/(z²+2t)dt = πe^{z²/2}erfc(z/√2)/(√2 z)`; gives `√(π/2)e^{z²/4}erfc(z/√2)` | sound |
| 12.5.4 | `a = −½` | `√(2/π)e^{z²/4}·√(π/2)e^{−z²/2} = e^{−z²/4}` | sound |
| 12.5.5 loop, README's lips and circle | `a = −½` (`q = −1`); `Re q > −1`, `r → 0` | lips cancel, circle `2πi`, `U = e^{−z²/4}`; `(e^{−iπq} − e^{iπq})/(2πi)·Γ(½−a) = 1/Γ(½+a)` recovers 12.5.1 | sound |
| 12.5.6, 12.5.7 | `a = −½, z = 0`; `a = ½` | `∫_{c+iℝ}e^{t²/2}dt = i√(2π)`, `U = 1`; two lines each `√(2π)e^{z²/2}`, `V = √(2/π)e^{z²/4}` | sound |
| Barnes residue `R_n` and the `−½` factor | pole `t₀ = (A+n)/2` | `Γ(A − 2t) ~ (−1)^n/(n!·(−2)(t − t₀))`, residue `(−1)^{n+1}/(2n!)` | sound |
| Residue-corrected 12.5.8 sign; `integral_vertical_sub_eq_residue` | strip `c₁ < Re p < c₂` | `∫_{c₂}dt − ∫_{c₁}dt = 2πi Res`; with `dt = i dy`: `∫_{c₂}dy − ∫_{c₁}dy = 2π Res`; so `∫_{c₀} = ∫_c − 2πi ΣRes` and `U ∝ ∫_c/(2π) − ΣR_n` | sound |
| pole count `Finset.range ⌈2c − Re A⌉₊` | `2c − Re A ∉ ℕ` (hypothesis `havoid`), `2c < Re A` | `n < 2c − Re A ⇔ n < ⌈2c − Re A⌉`; `⌈negative⌉₊ = 0` | sound |
| `hasSum_residues_of_integral_vertical_tendsto_zero` | decreasing lines `c(n+1) < Re p_n < c n` | `∫_{c0} − ∫_{cN} = 2πΣ_{n<N}`, limit `2πΣ` with `hlim`, `Summable` | sound |
| Barnes kernel rate | `|y| → ∞` | `e^{−π|y|/2}·e^{−π|y|}·e^{2|y||arg z|}` → `κ = 3π/2 − 2|arg z|`; with `cos πt`: `+π|y|` → `π/2 − 2|arg z|` | sound |
| Mellin inversion M6.6(c) | real `w` | `(1/2πi)∫Γ(s)w^{−s}ds = e^{−w}`, `ds = i dy` gives `2πe^{−w}` | sound |
| 12.9.1–12.9.4 constants | DLMF text | `C_U = ±i√(2π)Γ(½+a)⁻¹e^{∓iπa}`, `C_V = ±iΓ(½−a)⁻¹`, strips `π/4+δ ≤ ±ph z ≤ 5π/4−δ`, `−π/4+δ ≤ ±ph z ≤ 3π/4−δ` | sound |
| 12.12.1 | `a = −½` | `2^{μ/2−1}Γ(μ/2)` both sides (duplication) | sound |
| 12.12.2 | `a = −3/2` | `∫te^{−t²}dt = ½`; `2^{−½}cos(−π/4) = ½` | sound |
| 12.12.3 | `a = −½` | `∫e^{−t²/2}/(x²+t²)dt = (π/2x)e^{x²/2}erfc(x/√2)` both sides | sound |
| 12.13.1–12.13.4 | Taylor series of `e^{∓x²/4}U`, `V` via 12.8.9–12.8.12 | exact term-by-term agreement; entire in `y` | sound |
| 12.13.5 with `(cos t)^{−a−½}` | `a = −3/2, x = 1, y = 0`; `a = −5/2` | LHS `cos t·e^{−cos²t/4}`, DLMF RHS `e^{−cos²t/4}`; `a = −5/2`: LHS `= cos²t ×` DLMF RHS | README's added factor correct; DLMF display in error (Source issues) |
| 12.14.1–12.14.3 | `x = 0` | `−2W(0)W′(0) = 2·2^{−3/4}·2^{−1/4} = 1` | sound |
| rotated solutions in `W` | `z = e^{iπ/4}x` | `d²/dx² = i d²/dz²`, `i(iz²/4 − ia) = −x²/4 + a`; initial values `(1,0)`, `(0,1)` | sound |
| 12.14.11 recurrences | coefficient of `x^{2n+2}` | `α_{n+2} = aα_{n+1} − (n+1)(2n+1)α_n/2`, `β_{n+2} = aβ_{n+1} − (n+1)(2n+3)β_n/2` | sound |
| 12.14.13–12.14.14 | `x → 0⁺` | `W(0,0) = 2^{−½}√π/Γ(¾)` both ways via `Γ(¼)Γ(¾) = π√2`; `W′(0,0) = −√π/Γ(¼)` | sound |
| 12.14.17–12.14.18, 12.14.23 | `s = e^{−iω}(A + iB)` | `s₁cos ω − s₂ sin ω = A`, `s₁ sin ω + s₂ cos ω = B`; series `Σ(−i)^r(½+ia)_{2r}/(2^r r! x^{2r})` matches `dlmf1214` 1079 | sound |
| M8.5 recessive solution | any `a` | `V(a,x) ~ √(2/π)x^{a−½}e^{x²/4}`, modulus `→ ∞` for every complex `a` | sound |
| Watson hypotheses (M7) | `N = 0` | `q = O(t^{Re λ/μ − 1})`, integrable at `0` since `Re λ > 0`; tail `e^{−σt}` integrable; sector eventually in `Re z > σ` | sound |
| `deriv^[2]` junk | `Differentiable ℂ f` | entire ⇒ `deriv f` entire, so `deriv^[2]` is the true second derivative; on `ℝ`, `W` is a real part of entire functions | sound |

**Conventions pinned by a witness:** argument order `(a, z)`; `Γ(s)⁻¹ = 0` at poles (checked at `a = −½` in 12.7.4 and in `parabolicCylinderU_zero_right`); principal `cpow` (12.9.3 strips cross the negative axis, so the logarithmic coordinates `z = exp w` are the right choice there); `dt = i dy` absorbed in each prefactor (checked in 12.5.6 and in the residue shift); `He_n` probabilists' (Mathlib's `hermite`, `He_2 = X² − 1`).

## Not verifiable

- `lean-DLMF` at commit `451f12a` (README lines 199–234): the provenance map was not opened; it is secondary and carries no mathematical claim.
- Olver, *Asymptotics and Special Functions* (1974), Temme (1996), Whittaker–Watson, Miller (1955): print texts not read; every statement attributed to them in the README is also in the DLMF sections read above.
- The sources service recorded the DLMF entries it fetched in the board package's `sources.toml` (its own behaviour); no file in the pull request was changed.

## Source issues

- **Error** in DLMF (dlmf1213) at 12.13.5, line 178: the source displays the rotational addition theorem without the factor `(cos t)^{−a−½}` in front of the sum; it should carry that factor (the `a = −3/2`, `y = 0` instance gives `cos t · e^{−cos²t/4}` against `e^{−cos²t/4}`); affects a stated result.
