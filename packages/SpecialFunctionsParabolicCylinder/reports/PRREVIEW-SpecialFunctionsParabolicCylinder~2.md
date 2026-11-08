# Review of SpecialFunctionsParabolicCylinder (pull request #1801 at cad1a20)

**Verdict:** needs changes

Full re-review of `TauCetiRoadmap/SpecialFunctionsParabolicCylinder/README.md` and `Suggested.lean` at cad1a20 (356 changed lines since d76fe7a, so not incremental): the previous review's eight findings checked one by one, then principles, the seeded source sample against the DLMF text (sources service), an adversarial pass with computed witnesses, the duplication and ownership audit against the pinned Mathlib (f6090c7) and Tau Ceti (358314d), main and the open roadmap pull requests (index of 2026-11-05), the dependency check, elaboration of a probe copy of `Suggested.lean` with `#check` lines, and the one-tactic padding probe. The gate at this head fails (`imports=1`, `build=3`); both failures are R01.

**Status of the previous review's findings at this head.**

- r1 R01 (build, missing import) — **not repaired**: `Suggested.lean` line 4 still imports `TauCeti.Analysis.SpecialFunctions.RegularizedHypergeometric`, line 46 still uses `Complex.hasSum_regularizedHGFun`. R01 below.
- r1 R02 (seven Tau Ceti citations that do not exist at the pin) — **not repaired**: README lines 33, 155–158, 164–166, 178–185, 329–333, 361–363 unchanged in substance. R02 below.
- r1 R03 (Kummer's equation had two owners) — **resolved from the other side**: QuantumFoundations at the head of its pull request now consumes "SpecialFunctionsParabolicCylinder Milestones 1.3 and 1.6" (its README lines 26, 71, 993–999) and its `Suggested.lean` no longer declares `regularizedHGFun_kummer_equation`. This roadmap is the single owner; the renamed Lean declaration (line 53) carries no clash. Not a finding, with one consequence recorded under R04.
- r1 R04 (vertical Gamma decay re-planned) — **repaired**: README lines 115–121 and 610–627 consume ZerosOfLFunctions §1.3 (resolved on main, `TauCetiRoadmap/ZerosOfLFunctions/README.md` line 469, the uniform `log ‖Γ(σ + it)‖` asymptotic for `σ` in a compact interval); 6.6(a) is restated as the product identity, its comparison in `x`, the value `|Γ(1 + iy)|²`, and the pole-separated corollary with its own `*Needs:*`; `exists_norm_Gamma_le_on_vertical` is deleted.
- r1 R05 (README not in TauCetiRoadmap form) — **not repaired**: title, section names, milestone numbering, one `*Needs:*` per milestone, no Checks lists (only a "Normalization checks" paragraph at lines 416–420). R04 below.
- r1 R06 (gate `tex`) — **repaired**: the three displays are top-level fenced blocks (lines 274–277, 283–288, 312–316), the loop integral is one code span (line 576); the gate reports `tex=0`.
- r1 R07 (locators) — **repaired in substance**: Milestone 7 cites DLMF 2.4.1 and 2.3.8 (lines 739, 748), 1.2 cites 13.3.15 (which is the derivative of `M`, `dlmf133` line 468; the previous review's "13.3.22" was the formula for Kummer's `U`, so the author's locator is the right one), 1.5–1.6 cite §13.2(i), 2.5 cites 12.2.2–12.2.3, 6.6(a) cites 5.8.3, 5.4.3–5.4.4 and 5.11.9. The Wronskian constancy and uniqueness of 2.4 received a proof route instead of a locator: R07 below.
- r1 R08 (padding) — **partly repaired**: `dawson_zero`, `exists_norm_Gamma_le_on_vertical`, `verticalIntegrable_Gamma` and `normalized_parabolicCylinderU_sub_one` are gone; the rest remains. R05 below.

## R01 (P1) — The build fails: an import that does not exist at the pinned Tau Ceti

Location: `TauCetiRoadmap/SpecialFunctionsParabolicCylinder/Suggested.lean` line 4, `import TauCeti.Analysis.SpecialFunctions.RegularizedHypergeometric`; line 46, the proof term `Complex.hasSum_regularizedHGFun (by simp) z`.

Claim: the file builds against the pinned libraries.

Witness: at the pinned Tau Ceti (358314d in `lake-manifest.json`) there is no file `TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean` and no declaration `hasSum_regularizedHGFun` anywhere in the tree (checked by listing and by grep at the pin); the worker's gate reports `imports=1`, `build=3`, "bad import". Unchanged since d76fe7a.

Repair (tested): delete line 4 and delete `hasSum_regularizedKummer` (lines 43–46). A scratch copy with line 4 removed and that one proof replaced by `sorry` elaborates with `lake env lean` in 40 s with `sorry` the only warning (83 warnings, one per sorried theorem; 95 declarations; every `#check @name` printed), so nothing else in the file depends on the missing module. Milestone 1.1 then takes the Mathlib route at the pin: `Complex.regularizedHGFun` is the sum of `regularizedHGFunSeries` (`Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean` lines 156–172), `radius_regularizedHGFunSeries_eq_top` (line 229, hypothesis `a.card ≤ b.card`) gives infinite radius, and `FormalMultilinearSeries.hasSum` with `ofScalars_apply_eq` gives the `HasSum` of `regularizedHGFunCoeff {a} {b} n * z ^ n`.

## R02 (P2) — Supplier drift: six Tau Ceti declarations and two files cited as existing do not exist at the pin

Location: `README.md` line 33 ("Tau Ceti's existing `TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`"), lines 154–158 (`Complex.hasSum_regularizedHGFun`, linked to Tau Ceti's `main` on GitHub), lines 164–166 (`Real.continuous_inv_Gamma`, `Real.exists_abs_inv_Gamma_le`, `Real.Gamma_nat_add_half_eq_factorial`), lines 178–185 (`TauCeti/Analysis/Complex/LaplaceTransform.lean`, `TauCeti.differentiable_intervalIntegral_mul_cexp_neg_mul`, `TauCeti.differentiableOn_integral_mul_cexp_neg_mul`), lines 329–333 and 361–363 (Milestone 1.1 and its `*Needs:*`, "Tau Ceti's `Complex.hasSum_regularizedHGFun`"); Milestone 7's `*Needs:*` line 752 ("the existing Laplace API").

Claim: "Consume these; do not rebuild them" (line 145).

Witness: at the pin, `TauCeti/Analysis/SpecialFunctions/Gamma.lean` has one declaration, `Real.measurable_Gamma` (line 35); `TauCeti/Analysis/Complex/` has no `LaplaceTransform.lean`; a grep of the whole pinned tree for the six names finds nothing. The worker's citation check lists the same six names as found nowhere. Unchanged since d76fe7a.

Repair: delete the citations and the GitHub links to Tau Ceti's `main`. For the series and special values cite Mathlib at the pin instead: `Real.Gamma_nat_add_half` (`Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean` line 342), `Complex.differentiable_one_div_Gamma` (`Gamma/Beta.lean` line 521), `Complex.Gamma_one_half_eq` (`GaussianIntegral.lean` line 322). The differentiability and tail estimates of Laplace integrals that Milestones 6.1, 7 and 8 use become targets of Milestone 7 (state them with their hypotheses: kernel locally integrable on `(0, ∞)`, `e^{−σt}`-integrable tail, parameter in `Re z > σ`, holomorphy in the parameter by dominated differentiation), consumed by 6.1 and 8.1.

## R03 (P2) — Statable headline formulas are absent from `Suggested.lean`, and the docstring names nothing as not statable

Location: `Suggested.lean` lines 7–23 (module docstring) and 607–623 (Milestone 9), 625–665 (Milestone 10); README lines 848–870 (12.12.1–12.12.4), 952–960 (12.14.13–12.14.14), 962–971 (12.14.17–12.14.23).

Claim: the file states the roadmap's end theorems against the pinned APIs (the "What this roadmap owns" table, lines 78–89, lists 12.12.1–12.12.4 and 12.14.1–12.14.23 among them).

Witness: no declaration of the file mentions any of 12.12.1–12.12.4 (the whole of Milestone 9.1), the Bessel cases 12.14.13–12.14.14, or the large-`x` expansion 12.14.17–12.14.23 (Milestone 10.7); the docstring does not say they are not statable. They are statable: `parabolicCylinderU`, `parabolicCylinderW`, `gammaHalfPhase` are defined in the file, `Complex.besselJ` is at the pin (`Mathlib/Analysis/SpecialFunctions/Bessel.lean` line 55), and the Bochner integral over `Ioi 0`, `Gamma` and `IsBigO` at `atTop` are Mathlib. Tested: a scratch copy with the three statements below appended elaborates with `sorry` the only warning.

Repair: add (at least) these, with their README hypotheses, and say in the docstring which headline formulas, if any, remain unstated and why:

```lean
/-- DLMF 12.12.1. -/
theorem integral_exp_mul_cpow_mul_parabolicCylinderU (a : ℂ) {μ : ℂ} (hμ : 0 < μ.re) :
    (∫ t in Ioi (0 : ℝ), exp (-(t : ℂ) ^ 2 / 4) * (t : ℂ) ^ (μ - 1) * parabolicCylinderU a t) =
      Real.sqrt π * (2 : ℂ) ^ (-(μ + a + 1 / 2) / 2) * Gamma μ / Gamma ((μ + a + 3 / 2) / 2) := sorry

/-- DLMF 12.14.13, upper sign. -/
theorem parabolicCylinderW_zero_left {x : ℝ} (hx : 0 < x) :
    (parabolicCylinderW 0 x : ℂ) = (2 : ℂ) ^ (-(5 / 4 : ℂ)) * Real.sqrt (π * x) *
      (besselJ (-1 / 4) (x ^ 2 / 4) - besselJ (1 / 4) (x ^ 2 / 4)) := sorry

/-- DLMF 12.14.17–12.14.23: the expansion of `s = e^{−iω}(√(x/2k) W(a,x) + i √(kx/2) W(a,−x))`. -/
theorem isBigO_parabolicCylinderW_large (a : ℝ) (N : ℕ) :
    let k := Real.sqrt (1 + Real.exp (2 * π * a)) - Real.exp (π * a)
    (fun x : ℝ => exp (-((x ^ 2 / 4 - a * Real.log x + π / 4 + gammaHalfPhase a / 2 : ℝ) : ℂ) * I) *
        (Real.sqrt (x / (2 * k)) * parabolicCylinderW a x +
          I * Real.sqrt (k * x / 2) * parabolicCylinderW a (-x)) -
      ∑ r ∈ Finset.range N, (-I) ^ r * (ascPochhammer ℂ (2 * r)).eval (1 / 2 + I * a) /
        (2 ^ r * (r ! : ℂ) * (x : ℂ) ^ (2 * r)))
      =O[atTop] fun x : ℝ => x ^ (-(2 * N : ℝ)) := sorry
```

12.12.2–12.12.4 and 12.14.14 are stated the same way (12.12.4 with `Gamma (1/2 - a) * parabolicCylinderV a z` for `Ū`, as the README pins it).

## R04 (P3) — The README is not in TauCetiRoadmap form (re-raised from r1 R05; the mathematics is sound)

Location: `README.md` line 1 (`# Parabolic cylinder functions`), lines 40, 113, 143, 255 (`## Scope and completion criterion`, `## Ownership and dependencies`, `## Mathlib and Tau Ceti inventory`, `## Conventions (pinned)`), lines 216–253 (`## Prior formalization`, "checked at commit `451f12a`", GitHub links), lines 325–975 (`## Milestone k` with numbered items and one `*Needs:*` line per milestone), lines 977–996 (`## Beyond this roadmap (a roadmap for a roadmap; do not implement)`, "Contributors should not attempt it"); `Suggested.lean` lines 10–13 and 22 ("not exhaustive", "contributors and reviewers converge", "allowed in this human-owned roadmap library").

Claim: the file is a roadmap in the repository's form.

Witness: the required shape (project README, "Writing a roadmap") is `# Roadmap: <title>`, `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` (per supplier: `From Mathlib`, `From Tau Ceti`, `From TauCetiRoadmap.ZerosOfLFunctions`, `From TauCetiRoadmap.ContourIntegration`), `## How to read the build`, `## Layer k` with `### k.n` prose subsections each ending in its own `*Needs:*` line, a `**Checks.**` list of at least three discriminating tests per definition, `### Examples` and `### Dependencies` per layer, `## Downstream consumers`, `## References`. Here the ten definitions (`u₁`, `u₂`, `U`, `V`, `D`, `F`, `Hh_n`, `B`, `W`, `φ₂`) have no Checks list (the "Normalization checks" paragraph at lines 416–420 covers `U`, `V`, `D` only and is not per definition); each milestone has a single `*Needs:*` covering targets with different needs (defect class 11: for example line 721 covers steps 1–7 of Milestone 6, whose needs range from Gaussian integrability to the residue theorem); a commit hash and process language ("do not implement", "allowed in this human-owned roadmap library") are not timeless.

Repair: rewrite in the shape above keeping every statement: one layer per milestone, each theorem a `### k.n` paragraph with its hypotheses, locator and `*Needs:*`; per definition the API bullets and three Checks, for example for `U`: `U′(½, 0) = −1` (the opposite sign of the `u₂` coefficient gives `+1`), `U(−3/2, z) = z e^{−z²/4}` (the even coefficient vanishes because `Γ(0)⁻¹ = 0`), and `D₂(z) = (z² − 1) e^{−z²/4}` (the physicists' Hermite convention would give `4z² − 2`); for `W`: `−2 W(a,0) W′(a,0) = 1` at `x = 0`, the `a = 0` Bessel value, and the sign of `W′(a, 0)`. QuantumFoundations §9.4 cites "SpecialFunctionsParabolicCylinder Milestones 1.3 and 1.6" for Kummer's equation and the polynomial cases: keep those two targets numbered `### 1.3` and `### 1.6` so that citation keeps resolving. Replace the `lean-DLMF` provenance table by a sentence in `## References` without a commit hash, and move "Beyond this roadmap" into `## Scope and ownership` as what is not owned. Rewrite the Lean docstring in the "<title>: target signatures" form (states the headline theorems against the pinned APIs; names what is not statable).

## R05 (P3) — Padding in `Suggested.lean` (re-raised from r1 R08, partly repaired)

Location: `Suggested.lean` lines 43–46 `hasSum_regularizedKummer`; 255–256 `parabolicCylinderD_natCast_sqrt_two_mul_im`; 278–279 `hasDerivAt_repeatedGaussianIntegral_zero`; 286–287 `repeatedGaussianIntegral_one`; 295–297 `repeatedGaussianIntegral_zero_right`; 362–365 `residue_div_sub_eq_numerator`; and the API block 269–271, 329–331, 425–427, 461–477, 534–538 (`integrableOn_repeatedGaussianIntegral`, `integrableOn_parabolicCylinderU_cos_integrand`, `verticalIntegrable_Gamma_mul_cpow_neg`, `tendsto_integral_barnes_kernel_horizontal`, `integrable_parabolicCylinderU_barnes_kernel`, `integrable_parabolicCylinderV_barnes_kernel`, `integrableOn_parabolicCylinderU_rotated_integrand`).

Claim: the file states the headline theorems.

Witness: `residue_div_sub_eq_numerator` is closed in the file by one `simpa` from `TauCeti.Contour.residue_div_sub_pow_of_analyticAt` (`TauCeti/Analysis/Contour/Residue/Basic.lean` line 477); `hasSum_regularizedKummer` is a library fact (R01); `_zero`, `_one`, `_zero_right` are the `n = 0`, `n = 1` cases and the value at `0` of neighbouring statements (README 5.3 bullets 2–4); `parabolicCylinderD_natCast_sqrt_two_mul_im` mirrors the README Check "`D_n(√2 x)` is real" (line 514) and follows from `parabolicCylinderD_natCast`; the seven integrability and connector lemmas are the API of Milestones 5.3, 6.3, 6.6(c–d) and 8.1. The one-tactic probe (`first | rfl | simp [the file's definitions] | infer_instance` on every sorried theorem) closes none of the 83, so the padding is by shape, not by triviality. The file keeps 95 declarations.

Repair: delete the listed declarations from `Suggested.lean`; the README keeps each as an API bullet or a Check. Keep the Weber equation, Wronskians, uniqueness, the definitions, the connection formulas, the recurrences and iterated derivatives, the Hermite, Dawson, `erfc` and `Hh_n` identities, the Laplace, cosine and Barnes representations with their residue-corrected forms, positivity, the Gamma product and strip bound, the residue shifts, Watson's lemma, 12.9.1–12.9.4, the recessive solution, 12.13.1, 12.13.5 and the `W` theorems, plus the end formulas of R03.

## R06 (P3) — The Gamma product identity is narrowed below its source

Location: `README.md` lines 599–603 ("For `x > 0`, prove convergence and the modulus identity DLMF 5.8.3"); `Suggested.lean` lines 339–342, `hasProd_Gamma_norm_quotient {x : ℝ} (hx : 0 < x)`.

Claim: the identity `∏_{k≥0} (1 + y²/(x + k)²) = Γ(x)²/|Γ(x + iy)|²` is stated for `x > 0`.

Witness: DLMF 5.8.3 states it for every real `x ≠ 0, −1, −2, …` (`dlmf58` lines 106–108), and the Euler-limit proof the README names (`GammaSeq_tendsto_Gamma`, `Gamma/Beta.lean` line 334) is the same for every such `x`: no factor of the product vanishes and `Γ(x) ≠ 0`.

Repair: state it for `x` not a nonpositive integer (Lean hypothesis `(hx : ∀ n : ℕ, x ≠ -(n : ℝ))`, README "for real `x ∉ {0, −1, −2, …}`"); keep the comparison in `x` for `0 < x ≤ x′`, where monotonicity of the factors needs positivity.

## R07 (P3) — Wronskian constancy and initial-value uniqueness carry no locator

Location: `README.md` lines 383–395 (Milestone 2.4: "The Wronskian of any two solutions of DLMF 12.2.2 is constant", "A solution with `f 0 = 0` and `deriv f 0 = 0` is `0`"; "For the equation and normalized solutions, see DLMF §12.2(i) and 12.7.12–12.7.13").

Claim: every theorem has a locator.

Witness: §12.2(i) and 12.7.12–12.7.13 (`dlmf122` lines 101–140, `dlmf127` lines 449–481) state the equation and the Kummer forms of `u₁`, `u₂`; neither states Abel's identity or uniqueness. The paragraph gives a proof route (Taylor coefficients `(n + 2)(n + 1)c_{n+2} = a c_n + c_{n−2}/4`, which I recomputed from `w″ = (z²/4 + a) w`) but no source.

Repair: cite DLMF §1.13(i): 1.13.5 for the constancy of the Wronskian (`𝒲 = c e^{−∫f}` with `f = 0` here; `dlmf113` line 279) and the uniqueness statement of the same subsection (`dlmf113` line 128, a solution is unique when `w` and `w′` are prescribed at a point), or Olver, *Asymptotics and Special Functions*, Chapter 5 §1.

## Verified sound

**Gate and build.** Worker's gate at cad1a20: `set_option=0 … sorry-data=0 sorry-examples=0 … imports=1 … tex=0 … depcheck=0 … stray-files=0 outside-folder=0 … build=3 FAIL` (R01 only). `git diff --stat origin/main...HEAD` outside the folder: nothing. Probe elaboration of the file with line 4 removed and line 46 sorried: exit 0, 40 s, `sorry` the only warning (83), all 95 `#check @name` lines printed; the file uses no section `variable`s, so no binder can be lost, and each elaborated type was compared with its README statement (agreement in every case; the generality of README and Lean is the same, including the hypotheses `Re a > −½`, `Re a < ½`, `|arg z| < 3π/4`, `|arg z| < π/4`, `0 < c`, `2c ≠ Re A + n`, `Re a ≤ −½`, `0 ≤ t < π/4`).

**Dependency check** (`gate --depcheck … --movable`): `depcheck: 229 roadmaps, 2154 edges, 0 problem(s)`; no UPWARD or CYCLE line. This roadmap is line 380 (last) of the merge order; its suppliers are ZerosOfLFunctions (line 79, on main, §1.3 "Vertical strips" at README line 469 with exactly the statement the README quotes) and ContourIntegration (Completed; `Completed/ContourIntegration/README.md` line 158, "Layer 2: residues, the Cauchy primitive, and the classical residue theorem", the anchor the README links). Both links resolve.

**Ownership.** `roadmaps grep` over the open pull requests and main for parabolic cylinder functions, Weber's equation, Watson's lemma, Dawson's integral, Mellin–Barnes integrals, Kummer's equation and transformation, `regularizedHGFun`: no other owner (IncompressibleFlows' `parabolicCylinder` is a space-time cylinder); QuantumFoundations consumes Milestones 1.3 and 1.6 from here and declares no Kummer statement; no declaration of this `Suggested.lean` carries the fully qualified name of a declaration in another roadmap. The sibling checkouts named in the brief were covered by that index.

**Library declarations opened at the pins** (Mathlib f6090c7, Tau Ceti 358314d): `regularizedHGFunCoeff` (`Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean` line 67, `(a)_n/(n!·∏Γ(b+n))`), `regularizedHGFunCoeff_eq_zero_right` (81), `regularizedHGFunCoeff_add_one` (92, hypothesis `∀ k ∈ b, k ≠ −n`, as Milestone 1.3 says), `regularizedHGFun_zero` (175), `radius_regularizedHGFunSeries_eq_top` (229), `analyticOnNhd_regularizedHGFun_of_card_le` (257), `regularizedHGFun_zero_zero` (345); `Complex.Gamma_neg_nat_eq_zero` (`Gamma/Basic.lean` 439), `Gamma_conj` (356), `GammaIntegral_convergent` (87); `GammaSeq_tendsto_Gamma` (`Gamma/Beta.lean` 334), `Gamma_mul_Gamma_one_sub` (397), `differentiable_one_div_Gamma` (521), `Gamma_mul_Gamma_add_half` (558); `GammaIntegral_eq_mellin`, `tendsto_self_mul_Gamma_nhds_zero` (`Gamma/Deriv.lean` 48, 102); `Complex.Gamma_one_half_eq`, `Real.Gamma_nat_add_half`, `integral_gaussian_complex` (`Gaussian/GaussianIntegral.lean` 322, 342, 237); `Complex.digamma` (`Gamma/Digamma.lean` 48); `Complex.besselJ` (`Bessel.lean` 55); `Complex.VerticalIntegrable` (`MellinTransform.lean` 85); `mellinInv_mellin_eq` (`MellinInversion.lean` 92); `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (`ParametricIntegral.lean` 286); `integral_boundary_rect_eq_zero_of_differentiableOn` (`CauchyIntegral.lean` 293); `Polynomial.hermite` (`Hermite/Basic.lean` 48), `deriv_gaussian_eq_hermite_mul_gaussian` (`Hermite/Gaussian.lean` 40). Tau Ceti: `TauCeti.Real.erfc` (`Erf.lean` 54), `hermiteFunction` (`Hermite/Function/Basic.lean` 38), `Polynomial.derivative_hermite_succ`, `hermite_add_two`, `hermite_aeval_neg` (`Hermite/Derivative.lean` 54, 95, 106), `TauCeti.Contour.residue_div_sub_pow_of_analyticAt` (`Residue/Basic.lean` 477), `residue_eq_of_tendsto_sub_mul` (`Residue/SimplePole.lean` 39), `Real.measurable_Gamma` (`Gamma.lean` 35); the three imported modules have object files. The eight names of R01–R02 are the only citations that fail.

**Seeded source sample** (DLMF through the sources service; `dlmf58`, `dlmf76`, `dlmf113` fetched this round):

- "What this roadmap owns" table: 12.2.1–12.2.2 (`dlmf122` 103, 136), 12.2.6–12.2.9 (300, 330, 358, 386: the reciprocal-Gamma initial values pinned at README lines 283–288 agree sign by sign), 12.2.10–12.2.12 (431, 460, 486), 12.2.13–12.2.14 (532, 555), 12.2.15–12.2.20 (594–755: every sign and exponent as the README restates them), 12.2.21 (811) and the note that `Ū` is undefined at `a = ½, 3/2, …` (838); 12.4.1–12.4.6 (`dlmf124` 44–190); 12.5.1–12.5.9 with their conditions `Re a > −½`, `|ph z| < π/2, Re a > −½`, `|ph z| < π/2, Re a > −3/2`, `Re a < ½`, `a ≠ ½, 3/2, …`, `c > 0`, `a ≠ −½, −3/2, …, |ph z| < 3π/4`, `a ≠ ½, 3/2, …, |ph z| < π/4` (`dlmf125` 67–414); 12.7.1–12.7.7 and 12.7.12–12.7.13 (`dlmf127` 69–481); 12.8.1–12.8.12 (`dlmf128` 60–388); 12.9.1–12.9.4 with the sectors and the constants `±i√(2π)Γ(½+a)⁻¹e^{∓iπa}`, `±iΓ(½−a)⁻¹` (`dlmf129` 74–191); 12.12.1–12.12.4 with `Re μ > 0`, `Re a < −½`, `Re a < ½, x > 0`, `Re a < ½` (`dlmf1212` 45–146); 12.13.1–12.13.5 (`dlmf1213` 68–176; the binomial coefficients `binom(−a−½, m)` and `binom(a−½, m)` equal the README's `(−1)^m(½+a)_m/m!` and `(−1)^m(½−a)_m/m!`); 12.14.1–12.14.19 and 12.14.23 (`dlmf1214` 113–1077).
- "What it does not own": 12.13.6 uses complex `erfc` (`dlmf1213` 211); the modulus and phase functions are 12.2.22–12.2.23 (`dlmf122` after 845). Consistent.
- "The boundary in one sentence" and "Targets not supplied by the consumed APIs": consistent with the pins except R02 (the Laplace-transform items are claimed as consumed but do not exist).
- Kummer: 13.2.1 (`dlmf132` 116), 13.2.3–13.2.5 and the polynomial remark (218–316), 13.2.39 (1529), 13.3.15 (`dlmf133` 468). Watson: 2.3.7–2.3.8 (`dlmf23` 323, 363), 2.4.1 with "the same conditions on q(t)", `Re λ > 0`, `|ph z| ≤ π/2 − δ`, principal powers, and the path rotation (`dlmf24` 81–128). Gamma: 5.4.3–5.4.4 (`dlmf54` 127, 160), 5.8.3 (`dlmf58` 106–108), 5.11.9 (`dlmf511` 490), 7.2.5 (`dlmf72` 277), 7.6.2 (`dlmf76` 98–99).

**Adversarial table** (values computed on each side this round).

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| `U(a,0)`, `U′(a,0)` (12.2.6–7) and the pinned signs | `a = ½`; `a = −3/2` | `U′(½,0) = −√π·2⁰/Γ(½) = −1` (opposite sign of the `u₂` coefficient gives `+1`); `U(−3/2,0)`: `Γ(0)⁻¹ = 0`, Lean RHS `√π/(2^{−½}·0) = 0` | sound |
| 12.2.12 lower sign, Lean `I·exp(−Iπ(a/2+¼))` | `z = 0` | `−i A(a)B(−a) − B(a)A(−a) = i sin(π/4−πa/2) + sin(π/4+πa/2) = i e^{−iπ(a/2+¼)}` using `Γ(¼−a/2)Γ(¾+a/2) = π/sin(π(¼−a/2))` | sound |
| 12.2.17 upper sign | `z = 0` | LHS `√2π·2^{a/2−¼}/Γ(¾−a/2)`; RHS `2cos(πa/2−π/4)Γ(½+a)√π2^{−a/2−¼}/Γ(¾+a/2)`; ratio `= π sin(π/4+πa/2)/(π cos(πa/2−π/4)) = 1` by duplication and reflection | sound |
| 12.2.19 | `z = 0`, upper | both sides `(1 − i e^{iπa})U(a,0)` (`e^{iφ}(e^{iφ}+e^{−iφ}) = e^{iπa−iπ/2}+1`) | sound |
| 12.2.16 | `a = ½` (`V` even); `a = −½` (`V` odd) | `0·U + 1·V(½,0) = V(½,0)`; `0 − V(−½,z) = V(−½,−z)` | sound |
| 12.2.1 reduction (M3.6) | symbolic | `g″ = s²(t²/4 + A)f`, `s²t²/4 = −α(z+β/2α)²`, `s²A = β²/4α − γ`; sum `−(αz²+βz+γ)`; with `s² = −4α` instead the `z²` coefficient would be `4α²` | sound (the `s⁴` hypothesis is the right one) |
| Kummer equation, termwise (M1.3) | coefficient of `z^k`; `b + k = 0` | `(k+1)(b+k)c_{k+1} − (a+k)c_k = 0`; at `b+k=0`: LHS `0`, `c_k = (a)_k/(k!Γ(0)) = 0` | sound |
| Polynomial case (M1.6) | `k > n`; `b = −N` | `(−n)_k = 0`; `c_k = 0` for `k ≤ N` (`regularizedHGFunCoeff_eq_zero_right`), sum finite | sound |
| Derivative (M1.2) from 13.3.15 | general | `(a/b)M(a+1,b+1)/Γ(b) = (a/b)Γ(b+1)𝐌(a+1,b+1)/Γ(b) = a𝐌(a+1,b+1)` | sound |
| 12.7.4 (Dawson) | small `z` | `V′(−½,0) = π2^{½}/(Γ(½)³) = √2/√π`; `(2/√π)F(z/√2) ≈ √2 z/√π` | sound |
| `F′ = 1 − 2zF` | from 7.2.5 | `F = e^{−z²}G`, `G′ = e^{z²}` ⇒ `F′ = −2zF + 1` | sound |
| 12.7.7 vs 12.7.5 | `n = 0` | `∫₀^∞ e^{−(z+t)²/2}dt = √(π/2) erfc(z/√2)` | sound |
| `Hh_n(0)` | substitution `u = t²/2` | `∫₀^∞ tⁿe^{−t²/2}dt = 2^{(n−1)/2}Γ((n+1)/2)` | sound |
| Hermite–Gaussian Fourier identity (M9.3) | `m`-fold `d/dy` of `√(2π)e^{−y²/2}` | `∫ sᵐe^{−s²/2−iys}ds = (−i)ᵐ√(2π)He_m(y)e^{−y²/2}`, so `D_m(y) = e^{y²/4}iᵐ/√(2π)·∫` | sound |
| Bound `|D_m(y)|/m! ≤ e^{y²/4}2^{−m/2}/Γ(m/2+1)` | `∫|s|ᵐe^{−s²/2} = 2^{(m+1)/2}Γ((m+1)/2)`; `m! = 2ᵐΓ((m+1)/2)Γ(m/2+1)/√π` | `e^{y²/4}2^{m/2}Γ((m+1)/2)/(√π m!) = e^{y²/4}2^{−m/2}/Γ(m/2+1)` | sound |
| `Σ (u/√2)ᵐ/Γ(m/2+1) ≤ 2e^{u²/2}` | even/odd split | even `Σ(u²/2)ʲ/j! = e^{u²/2}`; odd with `Γ(j+3/2) = (2j+1)!!√π/2^{j+1}` and 7.6.2: `e^{u²/2}erf(u/√2) ≤ e^{u²/2}` | sound |
| Tail majorant | `x > 0`; `x = 0` | `u^{Re a−½}e^{−xu}` integrable at `∞` iff `x > 0` or `Re a < −½` | sound, matches the stated endpoint cases |
| 12.13.5 with `(cos t)^{−a−½}` | `a = −½`; `a = −3/2`; `a = −5/2`, `y` free | factor `1`: exponents agree; `LHS = e^{−X²/4}cos t(x + y tan t)`, DLMF RHS `e^{−X²/4}(x + y tan t)`; `LHS = (X²−1)e^{−X²/4}`, DLMF RHS `(X²−1)e^{−X²/4}/cos²t` | README's factor correct; DLMF display in error (Source issues) |
| 12.8.1 in Whittaker form (M4.4) | `a = −ν−½` | `zD_ν − D_{ν+1} − νD_{ν−1} = −(D_{ν+1} − zD_ν + νD_{ν−1})` | sound |
| 12.8.9 ⇒ 12.7.6 | `a = ½`, `m = n` | `(½+a)_m = (1)_n = n!` | sound |
| 12.9.1 from Watson on rotated rays (M8.1) | `μ = 1`, `λ = a+½`, `ζ = ze^{iθ}` | `c_{2s} = e^{iθ(a+½)}(−1)ˢe^{2iθs}/(2ˢs!)`, odd `c` zero; `Γ(2s+a+½)c_{2s}ζ^{−(2s+a+½)} = (−1)ˢ(½+a)_{2s}z^{−a−½}/(s!(2z²)ˢ)`, phases cancel since `arg z + θ ∈ (−π, π)` | sound |
| 12.9.3–12.9.4 constants and strips | DLMF text | `C_U = σi√(2π)Γ(½+a)⁻¹e^{−σiπa}`, `C_V = σiΓ(½−a)⁻¹`; strips `π/4+δ ≤ σ·ph z ≤ 5π/4−δ`, `−π/4+δ ≤ σ·ph z ≤ 3π/4−δ` | sound |
| Barnes residue `R_n` | pole `t₀ = (A+n)/2` | `Γ(A−2t) ≈ (−1)ⁿ/(n!(−2)(t−t₀))`, residue `(−1)^{n+1}Γ(t₀)2^{t₀}z^{A+n}/(2n!)` | sound |
| Pole count `⌈2c − Re A⌉₊` | `2c − Re A = 2.5`; `≤ 0` | poles `n = 0,1,2`, `⌈2.5⌉ = 3`; `⌈·⌉₊ = 0` | sound |
| Residue-shift sign and prefactor | `dt = i dy` | `∫_{c₂}dy − ∫_{c₁}dy = 2π·Res`; `U = pref·((1/2π)∫_c dy − ΣR_n)` | sound |
| Barnes kernel decay | `|y| → ∞` | `e^{−π|y|/2}·e^{−π|y|}·e^{2|y||arg z|}` ⇒ `κ = 3π/2 − 2|arg z|`; with `cos πt` (`~e^{π|y|}/2`) `κ = π/2 − 2|arg z|` | sound |
| 6.6(a) comparison and reflection value | `0 < x ≤ x′`; `y ≠ 0` | each factor `1 + y²/(x+k)² ≥ 1 + y²/(x′+k)²`; `|Γ(1+iy)|² = y²·π/(y sinh πy) = πy/sinh πy`; at `y = 0` Lean's RHS would be `0/0 = 0 ≠ 1`, so `hy` is needed | sound |
| Strip bound from ZerosOfLFunctions §1.3 | `|y| ≥ 1`; `|y| ≤ 1` | `|Γ| ≤ C′|y|^{x−½}e^{−π|y|/2} ≤ C(1+|y|)^K e^{−π|y|/2}` with `K ≥ v−½`; bounded part compact and pole-free | sound |
| Mellin inversion constant | `ds = i dy` | `(1/2πi)∫Γ(s)w^{−s}ds = e^{−w}` ⇒ `∫Γ(c+iy)w^{−c−iy}dy = 2πe^{−w}` | sound |
| 12.14.3 | `x = 0` | `−2W(0)W′(0) = 2·2^{−3/4}·2^{−1/4}·1 = 1` | sound |
| 12.14.11 | from `w″ + (x²/4 − a)w = 0` | `α_{n+2} = aα_{n+1} − (n+1)(2n+1)α_n/2` | sound |
| 12.14.7 phase | derivative in `a` | `d/da arg Γ(½+ia) = Im(iψ(½+ia)) = Re ψ(½+ia)`, `Γ(½) > 0` | sound |
| 12.12.1 | `a = −½` | both sides `2^{μ/2−1}Γ(μ/2)` (duplication) | sound |
| 12.12.2 | `a = −3/2` | `∫te^{−t²}dt = ½`; `2^{−½}cos(−π/4) = ½` | sound |
| Watson hypotheses | `N = 0`; sector | `q = O(t^{Re λ/μ − 1})` integrable at `0` since `Re λ > 0`; `Re z ≥ |z| sin δ → ∞` so `Re z > σ` eventually | sound |
| `deriv^[2]` junk values | entire `f`; `W` | `deriv f` entire, so `deriv^[2]` is the second derivative; `W` is the real part of an entire function of `x` | sound |
| Lean 12.5.6 constant vs DLMF `1/(i√(2π))` | `dt = i dy` | `(1/(i√2π))·i∫dy = (1/√2π)∫dy` | sound |

**Conventions pinned by a witness:** argument order `(a, z)`; `Γ(s)⁻¹ = 0` at poles (12.2.6 at `a = −3/2`, 12.7.4 at `a = −½`); principal `cpow` with logarithmic coordinates where 12.9.3 crosses the negative axis; `dt = i dy` absorbed in each prefactor (12.5.6, the residue shift, Mellin inversion); `He_n` probabilists' (`D₂ = (z²−1)e^{−z²/4}`); the `ε = ±1` sign convention of the connection formulas (12.2.12 both signs at `z = 0`).

## Not verifiable

- `lean-DLMF` at commit `451f12a` (README lines 216–253): not opened; secondary provenance, no mathematical claim rests on it.
- Olver (1974), Temme (1996), Whittaker–Watson, Miller (1955): print texts not read; every statement the README attributes to them is also in the DLMF sections read above.
- The sources service recorded `dlmf58`, `dlmf76` and `dlmf113` in the board package's `sources.toml` when it fetched them (its own behaviour); no file of the pull request was changed.

## Source issues

- **Error** in dlmf1213 at 12.13.5, line 176: the source displays the rotational addition theorem without a factor `(cos t)^{−a−½}` in front of the sum; it should carry that factor (at `a = −3/2`, `y` arbitrary, the left side is `cos t` times the displayed right side; at `a = −5/2` it is `cos² t` times it); affects a stated result.
