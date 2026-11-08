# Review of SpecialFunctionsBessel (pull request #1987 at 2736ecb)

**Verdict:** needs changes

Nineteen findings: one P1, six P2 and twelve P3. The push gate fails on three rules (R08–R10). The P1 is a sign error in the plane-wave headline, which comes from Mathlib's normalization of `Polynomial.shiftedLegendre`. The P2s are a double ownership with two roadmaps earlier in the merge order, three statements false or overclaimed as written, a false Check, and a headline that the docstring calls unstatable although it is statable. Every repair below was tested on the instance that refutes the original: numerically in plain Python, and where it touches Lean, by elaborating a scratch copy at the pins.

## R01 (P1) — The plane-wave expansion is false: Mathlib's `shiftedLegendre n` evaluates to `P_n(1 − 2x)`, not `P_n(2x − 1)`

**Location.** README line 443: "`Polynomial.shiftedLegendre` (for `P_n(x) = P̃_n((1 + x)/2)` in Layer 9)". The same convention is used at README line 1294 (9.3) and at `TauCetiRoadmap/SpecialFunctionsBessel/Suggested.lean` line 562 (`hasSum_planeWave`, `.eval ((1 + Complex.cos α) / 2)`).

**Claim.** `∑ (2n + 1) iⁿ 𝗃_n(z) P_n(cos α) = e^{iz cos α}` (10.60.7), with `P_n(x)` read as Mathlib's `shiftedLegendre n` at `(1 + x)/2`.

**Witness.** At the pin, `shiftedLegendre 1 = 1 − 2X` (`Mathlib/RingTheory/Polynomial/ShiftedLegendre.lean:40`). At `(1+x)/2` this is `−x`, not `P₁(x) = x`. At `z = 1`, `α = 0`, the Lean sum is `0.5403 − 0.8415i = e^{−i}`, not `e^{i}`.

**Repair.** Use `(1 − x)/2` everywhere:
- in the Conventions (line 443) and in 9.3 (line 1294), write `P_n(x) = shiftedLegendre n ((1 − x)/2)`;
- in `hasSum_planeWave`, write `.eval ((1 - Complex.cos α) / 2)`.

Tested at `(z, α) = (1, 0)`, `(1.3, 0.7)` and `(2 + 0.5i, 0.4)`: the sum equals `e^{iz cos α}` to 1e−15, and the edited file elaborates. With the fixed convention, the 2.5 auxiliary `C_n^{(1/2)} = P_n` also holds at odd `n`: `C₃^{(1/2)}(0.3) = −0.3825 = P₃(0.3)`, while the old convention gives `+0.3825`.

## R02 (P2) — `K_ν`, `Y_ν` and `I_ν` on the positive axis are already owned by AnalyticNumberTheoryPartI and AutomorphicSpectralTheory, which come earlier in the merge order

**Location.** README lines 209–211: "Those roadmaps should cite these targets … This roadmap keeps the ownership whichever merges first". The same objects appear in `Suggested.lean` lines 336–347 (`besselK_eq_integral`, `besselY_eq_schlafli`) and in README 5.3, real argument (lines 846–854).

**Claim.** This roadmap owns these objects, and the earlier roadmaps should cite it.

**Witness.**
- AnalyticNumberTheoryPartI (#1126, head 8e73fea), §2.1a, README line 1217 and `Suggested.lean` line 626: `besselK` with complex order at `x > 0`, by 10.32.9.
- The same roadmap, §3.23b, line 2697: `Y_ν` by 10.9.7, and the 10.40.2 bounds.
- AutomorphicSpectralTheory (#925, head 723640b), §0.25, line 531: `I_ν`.

Both precede this roadmap in the merge order.

**Repair.** Make the earlier roadmaps the owners of the positive-axis results:
- Add a `### From TauCetiRoadmap.AnalyticNumberTheoryPartI` contract (§2.1a, §3.23b) and a `### From TauCetiRoadmap.AutomorphicSpectralTheory` contract (§0.25).
- Cite them for 10.32.9 at `x > 0`, positivity and decay of `K_ν`, `Y_ν` on `Re z > 0`, and the real-argument bounds of 5.3.
- Keep here only the slit-plane and complex-argument extensions, stated as agreement targets (for example, that `Complex.besselK ν x` equals that roadmap's `besselK ν x` for `x > 0`).
- Delete lines 209–211.

If the intake prefers to move ownership the other way, that is a merge-order change, and this roadmap cannot make it by assertion.

## R03 (P2) — The auxiliary Sturm comparison target is false as written: its exception must hold between the two zeros, not on all of `I`

**Location.** README line 147: "every real solution of `(p v′)′ + q₂ v = 0` has a zero, unless `q₁ = q₂` and `v` is a multiple of `u`".

**Claim.** If the exception fails on `I`, then `v` vanishes strictly between two consecutive zeros of `u`.

**Witness.** Take `I = (0, 4π)`, `p = 1`, `q₁ = 1`, and a continuous `q₂ ≥ 1` equal to 1 on `[0, 2π]` and 2 on `[3π, 4π]`. Let `u = sin`, and let `v` solve the `q₂` equation with `v = sin` on `[0, 2π]`. Then `v` has no zero in `(π, 2π)`, and the exception does not apply.

**Repair.** For consecutive zeros `a < b` of `u`, conclude that `v` has a zero in `(a, b)` unless `q₁ = q₂` on `[a, b]` and `v` is a constant multiple of `u` on `[a, b]`. On the witness, this exception applies on `[π, 2π]`.

## R04 (P2) — 7.5 claims that the `m`th zero of 10.21.53 has the expansion 10.21.50, and drops `ν ≥ 0`

**Location.** README lines 1087–1089: "for `λ > 1`, the `m`th positive zeros of the cross-products 10.21.48, 10.21.49 and 10.21.53 have the expansions 10.21.50".

**Claim.** The expansion holds for the `m`th zero of all three cross-products, under `λ > 1` only.

**Witness.** DLMF §10.21(x) assumes `ν ≥ 0`, `x > 0` and `λ > 1` throughout (`DLMF` line 2251). For 10.21.53 it gives the expansion of the large positive zeros, "not necessarily the `m`th" (line 2433).

**Repair.**
- Add `ν ≥ 0` to 7.5.
- For 10.21.53, state: there is an integer `m₀` (depending on `ν`, `λ`) such that the `(m + m₀)`th positive zero has the expansion 10.21.50 with the coefficients 10.21.54.
- Keep "the `m`th" only for 10.21.48 and 10.21.49, where DLMF line 2316 states it and the zeros are simple.

## R05 (P2) — 1.4 and 1.5 state branch-sensitive formulas on the whole slit plane

**Location.** README line 521 ("DLMF 10.6.1–10.6.10 … on the slit plane"), including "the generalized recurrences 10.6.4–10.6.5 for `f_ν(z) = z^p 𝒞_ν(λ z^q)`". Also README line 534: "`H⁽¹⁾_ν(z̄) = conj H⁽²⁾_ν(z)` (10.11.9)", with no domain.

**Claim.** Both hold at every `z` of the slit plane (10.11.9 at every `z`).

**Witness.**
- 10.6.5 with `λ = −1`, `q = 1`, `p = 0`, `ν = ½`: `J_{1/2}(−z)` jumps from `−0.6714i` to `+0.6714i` across `z = 1`, so `z f′` does not exist there. The right side is `0.0954i`.
- 10.11.9 at `z = −1`: `0.6714i` versus `−0.6714i`.

**Repair.**
- State 10.6.4–10.6.5 for `λ ≠ 0`, on every open set on which `z^q` and `λz^q` avoid `(−∞, 0]`, as 1.6 already does.
- State 10.11.9 for `z ∈ slitPlane`.

The witness points then lie outside the stated domains, and inside them the identities hold. I checked 10.6.4–10.6.5 at `λ = e^{0.3i}`, `q = ½`, `p = 0`, `z = 1 + i`, `ν = ½` and `0.7 + 0.2i` (agreement to 3e−10), and 10.11.9 at `z = 1 + i` and `0.5 − 0.7i`.

## R06 (P2) — A Check of the `b = a` case of 10.22.64 asserts a value for a divergent integral

**Location.** README line 1199: "`∫₀^∞ J_{5/2}(t) J_{1/2}(t) dt = −½`".

**Claim.** This is an instance of 10.22.64 at `b = a`, with value `−½`.

**Witness.** The order `5/2` is not of the form `μ + 2n + 1` with `μ = ½` and `n ∈ ℕ`. The product behaves like `−(2/(πt)) sin² t`, so the integral diverges: its partial integrals are `−1.36` at `R = 400` and `−1.80` at `R = 1600`.

**Repair.** Replace `J_{5/2}` by `J_{7/2}` (`μ = ½`, `n = 1`). Computed: `∫₀^R J_{7/2}J_{1/2} = −0.4952` at `R = 400` and `−0.4988` at `R = 1600`, tending to `(−1)¹/2 = −½`. The companion `J_{6.3}J_{1.3}` (`n = 2`) and the case `μ = ½`, `n = 1`, `a = 2`, `b = 1` (`0.3093592168`) are correct.

## R07 (P2) — The docstring calls 10.10.1 an unstatable headline, but it is statable with Mathlib's `GenContFract`; so is the Fourier–Bessel expansion theorem

**Location.** `Suggested.lean` lines 14–16: "Three headlines cannot be stated at the pins … the continued fractions of 4.1 need `contFrac` of SpecialFunctionsEiLiErfIncompleteGamma §4.1".

**Claim.** 10.10.1 has no carrier at the pins.

**Witness.** The pinned Mathlib has `GenContFract` and `convs` (`Algebra/ContinuedFractions/Basic.lean:109, 320`) and `Stream'.Seq.ofStream` (`Data/Seq/Defs.lean:592`). The statement below elaborates. So does 10.23.20, with `BoundedVariationOn`, `Function.leftLim` and `Function.rightLim`.

**Repair.** In the `Layer 4` section of `Suggested.lean`, state:

```lean
/-- DLMF 10.10.1. -/
theorem tendsto_convs_besselJ {ν z : ℂ} (hz : z ≠ 0) (h : besselJ (ν - 1) z ≠ 0) :
    Tendsto (GenContFract.mk (0 : ℂ) (Stream'.Seq.ofStream fun n : ℕ =>
        (⟨if n = 0 then 1 else -1, 2 * (ν + n) / z⟩ : GenContFract.Pair ℂ))).convs atTop
      (𝓝 (besselJ ν z / besselJ (ν - 1) z)) := by
  sorry
```

Then remove 4.1 from the docstring's list of unstatable headlines.

Also add 10.23.18–10.23.20 in the `Layer 7` section, with `BoundedVariationOn f (Set.Icc a b)` for `0 < a < x < b < 1` and the limit `(Function.leftLim f x + Function.rightLim f x)/2`.

Numerically, 60 levels of the continued fraction give `−0.5144211 − 1.0539424i = J_ν/J_{ν−1}` at `ν = 0.3 + 0.2i`, `z = 1.7 − 0.4i`, and `tan 1.2` at `ν = ½`.

## R08 (P3) — Gate rule `tex`: TeX syntax outside code spans at README lines 977–978

**Location.** README lines 977–978: "using `η = (1 + z²)^{1/2} −" and then "arsinh(1/z)`".

**Claim.** The code span closes properly (gate rule `tex`).

**Witness.** The gate run on this head reports three `tex` hits at lines 977–978. The span breaks across the line, so the scanner reads `^{1/2}` and `e^{ν(η−z)}` as outside code.

**Repair.** Rewrap so that `` `η = (1 + z²)^{1/2} − arsinh(1/z)` `` and `` `e^{ν(η−z)} (z²/(1 + z²))^{1/4}` `` each sit on one line.

## R09 (P3) — Gate rule `statement-hygiene`: `besselY` and `besselK` choose their integer with `h.choose`

**Location.** `Suggested.lean` line 68, "`(-1 : ℂ) ^ h.choose`", and line 86, "`(-1 : ℂ) ^ (h.choose - 1)`".

**Claim.** The definitions are choice-free (gate rule `statement-hygiene`).

**Witness.** The gate reports two P3 hits, at lines 68 and 86.

**Repair.**
- Replace `(-1 : ℂ) ^ h.choose` by `Complex.cos (ν * π)`.
- Replace `(-1 : ℂ) ^ (h.choose - 1)` by `-Complex.cos (ν * π)`.
- Make both `if h :` plain `if`.

At integer `ν = n`, `cos(nπ) = (−1)ⁿ`; checked at `n = −1, 0, 1`. The edited file elaborates.

## R10 (P3) — Gate rule `readme-ids-missing`: `Real.hasDerivAt_rpow_neg_mul_besselI`

**Location.** README lines 133 and 413 name `Real.hasDerivAt_rpow_neg_mul_besselI`. The `#check` list in `Suggested.lean` (lines 612–650) omits it.

**Claim.** Every cited library name is pinned in `Suggested.lean` (gate rule `readme-ids-missing`).

**Witness.** The gate reports one hit. The declaration exists at `TauCeti/Analysis/SpecialFunctions/BesselI.lean:226`.

**Repair.** Add `#check @_root_.Real.hasDerivAt_rpow_neg_mul_besselI` beside the other Tau Ceti names. This elaborates.

## R11 (P3) — Wrong locator in the Layer 2 examples

**Location.** README line 713: "10.12.4 is 10.12.3 at `θ = 0`, `z` arbitrary: `1 = J_0 + 2 ∑ J_{2k}`".

**Claim.** 10.12.4 is 10.12.3 at `θ = 0`.

**Witness.** 10.12.3 at `θ = 0` gives `cos z = J₀ − 2J₂ + 2J₄ − ⋯`, which is 10.12.5 (DLMF 10.12 lines 130–136, 189–192).

**Repair.** Write "10.12.4 is 10.12.2 at `θ = 0`" (or 10.12.3 at `θ = π/2`). Both give `1 = J₀ + 2∑J_{2k}` (checked at `z = 1 + 2i`).

## R12 (P3) — The ranges of 10.32 assigned to 3.1–3.3 misplace the contour integral

**Location.** README line 725 ("10.32.1–10.32.12", in 3.1, finite intervals and half-lines), line 736 ("the corresponding 10.32.13 onward", in 3.2) and line 745 ("10.32.13–10.32.19 not already in 3.2").

**Claim.** The contour integrals of 10.32 start at 10.32.13.

**Witness.** In DLMF §10.32(ii), the contour integral is 10.32.12 (line 485). 10.32.13–10.32.14 are Mellin–Barnes integrals and 10.32.15–10.32.19 are products.

**Repair.** Assign
- 3.1: 10.9.1–10.9.16 and 10.32.1–10.32.11;
- 3.2: 10.9.17–10.9.21 and 10.32.12;
- 3.3: 10.9.22–10.9.30 and 10.32.13–10.32.19.

## R13 (P3) — Owned objects with no definition or no Checks: the Bickley function, `O_n`, `ρ_ν`/`σ_ν`, and the Kelvin phases

**Location.**
- README line 1214 owns "10.43.3–10.43.21", which includes 10.43.11–10.43.17, but never defines the Bickley function `Ki_α`.
- 2.6 (line 705) defines `O_n` without Checks.
- 7.2 (line 1049) defines `ρ_ν(t)`, `σ_ν(t)` without Checks.
- 10.3 has no Checks for the phases pinned at lines 327–334.

**Claim.** Each owned object is specified, with at least three discriminating Checks.

**Witness.** DLMF 10.43.11 defines `Ki_α` by an integral for `Re α > 0` "and by analytic continuation elsewhere" (line 479). The README defines neither `Ki_α` nor its continuation. Sections 2.6, 7.2 and 10.3 have no `**Checks.**` list.

**Repair.**
- In 8.4, define `Ki_α(x) = ∫₀^∞ e^{−x cosh t} (cosh t)^{−α} dt` for `x > 0` and all complex `α` (10.43.12; convergent and entire in `α`). Make 10.43.11 a theorem for `Re α > 0`. Add Checks `Ki₀ = K₀` (10.43.14) and 10.43.16.
- Add Checks for `O_n`: `O₁(t) = t⁻²` and `O₂(t) = t⁻¹ + 4t⁻³` (computed at `t = 1.7`), and 10.23.12 at `z = 0.6 + 0.2i`, `t = 1.7` (`0.88 + 0.16i` on both sides).
- Add Checks for `ρ_ν`: `ρ_{1/2}(t) = πt`, and 10.21.8 at `m = 1`.
- Add Checks for the Kelvin phases: `θ₀(0+) = 0`, and the `ν = ½` value from 10.61.9.

## R14 (P3) — Two owned formulas fall outside the stated domain or route

**Location.**
- README lines 282–283: "Statements are made for `x > 0`; the values at `x ≤ 0` are not used". Yet line 1325 owns "10.61.5–10.61.12", and 10.61.5 is `ber_n(−x) = (−1)ⁿ ber_n x`.
- README line 1304: 10.59.1 is reduced to 10.22.64 "with `b ≥ 0`".

**Claim.** Both are covered by the stated conventions and route.

**Witness.**
- 10.61.5 evaluates `ber_n` at `−x < 0` (DLMF 10.61 line 275).
- 10.22.64 requires `b > 0`. DLMF's own proof of 10.59.1 treats `b = 0` through 10.22.43 (DLMF 10.59 lines 38–48).

**Repair.**
- State 10.61.5 for integer `n` and all real `x`. With the pinned definition, `J_n` is entire, so it holds (`ber_n(−x) = (−1)ⁿ ber_n(x)`). Amend line 282 accordingly.
- In 9.4, take `b > 0` through 10.22.64 and `b = 0` through 10.22.43.

## R15 (P3) — Three Lean statements are narrower than DLMF

**Location.**
- `Suggested.lean` lines 488–490, `tendsto_integral_besselJ {ν : ℝ} (hν : -1 < ν)`.
- Lines 493–496, `integral_rpow_mul_besselK {ν μ : ℝ} (h : |ν| < μ)`.
- Lines 454–457, `besselJZero_spec {ν : ℝ} (hν : -1 < ν)`.

**Claim.** The README's generality equals DLMF's.

**Witness.**
- DLMF gives 10.22.41 for `ℜν > −1` and 10.43.19 for `|ℜν| < ℜμ`. 10.43.19 at `ν = 0.4 + 0.3i`, `μ = 1.1 − 0.5i` gives `0.79721 + 0.60297i` on both sides.
- §10.21(i), line 123, covers all real `ν`.

**Repair.**
- State the first two for complex orders, with `Complex.besselJ` and `Complex.besselK` and the DLMF hypotheses.
- State `besselJZero_spec` for all real `ν`.
- Update the README at lines 1130 and 1215 to match.

## R16 (P3) — Padding in `Suggested.lean`

**Location.**
- Lines 548–550, `sphericalBesselJ_zero`, which README line 1239 cites inside a Check.
- Lines 358–361, `besselJ_one_half`.
- Lines 502–510, `integral_cpow_mul_exp_mul_besselJ`.

**Claim.** These are headline theorems.

**Witness.**
- The first is a special value that mirrors a README Check.
- The second is 10.16.1 at the single order `½`.
- The third follows from `exists_integral_cpow_mul_exp_mul_besselJ` (lines 515–522) through its `EqOn` on `Metric.ball 0 1`.

None of the three closes in one tactic: they are padding by content.

**Repair.**
- Delete the three declarations from `Suggested.lean`.
- In the README, keep the statements as a Check (9.1), an example (4.3) and a step of the 8.2 route, and drop the backticked names at lines 786, 1139 and 1239.

## R17 (P3) — "Downstream consumers" lists this roadmap's own suppliers

**Location.** README lines 1450–1453: "**SpecialFunctionsAiry** relies on this roadmap … **SpecialFunctionsParabolicCylinder** and **SpecialFunctionsEiLiErfIncompleteGamma** rely on it".

**Claim.** These roadmaps consume SpecialFunctionsBessel.

**Witness.** At their heads none of them consumes it. Each defers these relations to "a Bessel-function roadmap" (SpecialFunctionsAiry README lines 1641–1647). All three supply this roadmap, so the listing reads as a cycle.

**Repair.** Delete those two bullets. SpecialFunctionsConfluent (open), which does consume this roadmap, may be named instead.

## R18 (P3) — Pull-request numbers, process narrative and an inaccurate library claim in the README

**Location.**
- README lines 186–211: "Three open roadmap pull requests …", "[#1126]", "[#925]", "[#924]", "whichever merges first".
- Line 237: "Mathlib's open `Complex.besselI` pull request".
- Lines 433–434: "Nothing else in that file concerns this chapter".

**Claim.** The README is timeless and its library claims are exact.

**Witness.**
- The house style forbids pull-request numbers and process words.
- The pinned Mathlib Bessel file also has `Complex.besselJ_neg_comm` (`J_{−n}(x) = J_n(−x)`, line 100), `analyticAt_besselJ` and `analyticAt_besselJ_int`.

**Repair.**
- Name the roadmaps by section only, under the contracts of R02, and drop the coordination narrative.
- Drop "open … pull request".
- List the three omitted Mathlib declarations, or delete the sentence.

## R19 (P3) — Two descriptions in 11.3 do not match the formulas

**Location.** README line 1430, "6.10.4–6.10.8 (… in series of squares of spherical functions)", and line 1433, "8.21.16–8.21.17 (… in series of `𝗃_{2k}`)".

**Claim.** The descriptions match DLMF.

**Witness.**
- 6.10.8 (`Ein`) is linear in `𝗂⁽¹⁾_n(z/2)`, not in squares; 6.10.7 defines `a_n`.
- 8.21.16 (`Si(a, z)`) is a series in `𝗃_{2k+1}`.

**Repair.** Write "6.10.4–6.10.6 in series of squares, 6.10.8 linear in `𝗂⁽¹⁾_n`", and "8.21.16 in `𝗃_{2k+1}`, 8.21.17 in `𝗃_{2k}`".

## Verified sound

**Gate and build.**
- The gate run on this head reproduces the worker's result: FAIL, with `tex = 3`, `statement-hygiene = 2` and `readme-ids-missing = 1`. Every other rule is 0. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`, and nothing outside the folder changes.
- `lake env lean …/Suggested.lean` elaborates with exactly 49 warnings, all `declaration uses 'sorry'`, and no other diagnostics.
- The scratch copy with the repairs of R01, R09 and R10 also elaborates, as do the statements proposed in R07.
- Dependency check: `depcheck: 239 roadmaps, 2349 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.

**Lean form.**
- There is one `import Mathlib` plus two Tau Ceti modules that exist at the pin. There is no `set_option`, no `lemma`, and no sorried data.
- I compared all 85 elaborated signatures with the README statements. None lost a section binder. The casts are as intended: `k / 2` is real division in `hasSum_kelvinBer`, and `(-3 : ℤ)` is a zpow in McMahon.
- One-tactic probe (`rfl`, `simp`, `norm_num`) on all 49 theorems: none closes.

**Library declarations opened at the pins (17).**
- Mathlib `Bessel.lean`, lines 55–141: `besselJ`, `besselJ_def`, `besselJ_neg_int`, `besselJ_int_neg`, `odd_besselJ`, `even_besselJ`, `besselJ_zero`, `two_mul_self_mul_besselJ`.
- Mathlib `RegularizedHypergeometric.lean`: `regularizedHGFunCoeff` (67), `regularizedHGFun` (192), `analyticOnNhd_regularizedHGFun_of_card_le` (282), `regularizedGaussHGFun` (428), `radius_regularizedGaussHGFunSeries_eq_top_of_left` (468).
- Mathlib `ShiftedLegendre.lean:40`; `GenContFract` (`ContinuedFractions/Basic.lean:109`); `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` (`Uniqueness.lean:224`).
- Tau Ceti `BesselI.lean`: lines 81, 92, 102, 129, 150, 164, 210, 226, 237, 315.
- Tau Ceti `hasSum_regularizedHGFun` (`RegularizedHypergeometric.lean:53`), `wronskian_eq_of_hasDerivAt` (`ODE/Wronskian.lean:31`), `TauCeti.Contour.residue` (`Contour/Residue/Basic.lean:80`).
- No complex `besselI`, `besselY`, `besselK`, Hankel, Kelvin, spherical or Gegenbauer function exists at either pin. Tau Ceti's `hankel` (`Fourier/Hardy/Hankel.lean`) is a Hardy-space operator.

**Cross-roadmap citations resolved at the open heads (all present).**
- AsymptoticExpansions (head 1f39e59): Conventions (`HasAsymptoticExpansion`); §§1.5, 4.2, 4.3, 5.4, 5.5, 8.1, 8.2, 8.6, 10.1–10.4, 11.1–11.4; Layer 2. Its §11.4 states only `O(u^{−n})`, as the README says.
- SpecialFunctionsAiry (618ca5a): `TauCeti.airyAi`, `airyBi`, `scorerHi`; §§1.4, 1.7; Layer 4; Layer 9; §9.3. The local `airyAi` copy is character-identical to its `Suggested.lean` lines 64–66.
- SpecialFunctionsParabolicCylinder (4a8c39e): Conventions; §1.3 `regularizedHGFun_kummer_equation`.
- SpecialFunctionsEiLiErfIncompleteGamma (0ac9944): §4.1 `contFrac`, `IsMinimalSolution`, `pincherle`; all 16 named functions, in its Conventions lines 168–177.
- The three suppliers defer the Bessel formulas to this roadmap and consume nothing from it, so there is no cycle.
- SpecialFunctionsConfluent consumes this roadmap and takes 10.16.6–10.16.8 and 10.39.6–10.39.8, consistent with this roadmap's exclusions.
- The ownership comparison with AnalyticNumberTheoryPartI and AutomorphicSpectralTheory used their heads; see R02.

**Sampled locators checked against DLMF text (15 targets).**
- 1.4 (10.6.1–10.6.10): correct.
- 1.5 (10.11.1–10.11.9; 10.11.5 matches `hankelH2_neg`): correct.
- 1.7 (10.25.1–10.25.3, 10.27.1–10.27.7): correct.
- 1.8 (10.27.8 range `−π ≤ ph z ≤ π/2`, 10.28.2, 10.29.1–10.29.5, and the `k = 1` reduction to Tau Ceti's lemma): correct.
- 2.3: correct except R11.
- 2.5 (10.23.8–10.23.9 with "unnecessary when `𝒞 = J`", 18.5.10, 18.12.4; 18.18.17 equivalent via `(ν)_{m+1} = ν(ν+1)_m`): correct.
- 2.6 (10.23.10–10.23.13, `O₀ = 1/t`): correct.
- 3.2: correct except R12.
- 6.1 (10.41.1–10.41.13 with "uniformly for `0 < z < ∞`"; Olver pp. 377–378, corroborated by DLMF 10.41(iv) line 648; DLMF §2.8(ii) indeed defers error bounds to Olver Ch. 10): correct. The README's alternative route for 10.41.12, by parity of `η − z`, `p` and `U_k(−p) = (−1)ᵏU_k(p)`, is valid.
- 7.1 (10.21(i): simplicity, reality for `ν ≥ −1`, `2⌊−ν⌋` complex zeros, 10.21.1): correct.
- 7.3 (10.21.15 `ν ≥ 0`, 10.21.16 `ν > 0`, 10.21.17–10.21.18, 10.21.55): correct.
- 7.5: correct except R04.
- 8.4 (10.43.19 and the excluded 10.43.2, 10.43.22, 10.43.26): correct except R13.
- 10.1 (10.61.1–10.61.12): correct except R14.
- 11.3: correct except R19.
- Also checked: 10.2.1–10.2.6, 10.9.2, 10.9.7, 10.9.17–10.9.30, 10.10.1–10.10.2, 10.17(iii)–(iv), 10.40(ii), 10.22.37, 10.22.41, 10.22.63–10.22.64 (DLMF does state the `b = a` case), 10.59.1, 10.60.7.

**Adversarial table.** Values are computed in double precision from the pinned definitions. Integrals use composite Gauss–Legendre quadrature, and `K` at large argument uses the cosh integral.

| Statement | Instance | Left side | Right side | Result |
|---|---|---|---|---|
| `besselY` def (10.2.3/10.2.4) | `Y_ε(1) − Y₀(1)` over `ε`, central difference | `−1.2019698e−6` (extrapolated) | Check `−1.20197e−6` | holds |
| `besselY` def, sign | `Y_{1/2}(0.8+0.3i)` | `−0.5849283+0.2977076i` | `−(2/(πz))^{1/2}cos z` same | holds; reversed sign gives `+` |
| `J₀(1)`, `Y₀(1)`, `Y₁(1)` Checks | — | `0.7651976866`, `0.0882569642`, `−0.7812128213` | Checks | hold |
| `besselJ_mul_deriv_besselY_sub` | `ν = 0.7`, `z = 1+0.5i`; `ν = 2`, `z = 1.3−0.4i` | `0.5092958−0.2546479i`; `0.4473544+0.1376475i` | `2/(πz)` same | hold |
| `besselY_sub_one_add_besselY_add_one` | `ν = 1.3`, `z = 0.9+0.4i` | `−1.792454+1.933670i` | same | holds |
| `hankelH2_neg` | `ν = 0.3+0.2i`, `z = 1+i`; `z = −1+0.5i` | `−0.1618328−0.0476799i`; `0.2777558+0.1783165i` | same | hold |
| `besselK_eq_hankelH1` | `ν = 0.3+0.1i`, `z = 2i`, `2e^{−0.9πi}`, `1.5`, `0.7−0.2i` | e.g. `−0.8213233−0.3453565i` at `2i` | same (diff ≤ 4e−16) | hold |
| `besselK_eq_hankelH1`, control | `z = −2` (`arg = π`, excluded) | `0.0682−6.9351i` | `0.0682+6.9351i` | fails, as the hypothesis requires |
| `besselI_mul_besselK_add` | `ν = 0.4, 1, −0.6+0.3i`, `z = 1.2−0.7i` | `0.6217617+0.3626943i` | `1/z` same | hold |
| `besselK` def Checks | `K_{1/2}(0.9+0.4i)`; `K₀(1)`, `I₀(1)` | `0.4211130−0.2937676i`; `0.4210244382`, `1.2660658778` | 10.39.2 same; Checks | hold |
| `tendsto_besselY_div_cpow` | `ν = 0.6+2i`, `|z| = 1e−5` | `−0.0334303+0.0156574i` | `−Γ(ν)/π = −0.0334306+0.0156575i` | holds |
| `hasSum_besselJ_generating` | `z = 1.1−0.3i`, `t = 0.7+0.2i` | `0.7106220+0.3094166i` | same | holds |
| `hasSum_besselJ_sq` | `z = 1+2i` | `1 − 3e−15i` | `1` | holds |
| `hasSum_besselJ_gegenbauer` | Check `ν=1, u=2, v=1, α=π/3`; `ν=0.7+0.3i, u=0.5+i, v=3−2i, α=0.4+0.3i` (`|v|>|u|`) | `0.3345262388`; `0.6381297+2.8026783i` | `J₁(√3)/√3`; `𝐅(ν+1)(−w²/4)` same | hold |
| `hasSum_hankelH1_gegenbauer` | `ν=0.7, u=2, v=0.5+0.3i, α=0.4+0.2i` | `0.6082230−0.0837843i` | `H⁽¹⁾_ν(w)/w^ν` same | holds |
| `hasSum_cexp_gegenbauer` | `ν=0.7, v=1.5+0.5i, α=0.3+0.2i` | `0.0531976+0.6695485i` | `e^{iv cos α}` same | holds |
| `besselJ_int_eq_integral` | `n = 2`, `z = 1+i`; `n = −3`, `z = 0.7−0.4i` | `0.0415799+0.2473976i`; `−0.0005186+0.0106831i` | same | hold |
| `besselK_eq_integral` | `ν = 0.3+0.5i`, `z = 1+0.5i` | `0.3311108−0.2204341i` | same | holds |
| `besselY_eq_schlafli` | `ν = 0.4`, `z = 1.2+0.3i`; `ν = 1.6+0.4i`, `z = 0.8+0.6i` | `−0.1531119+0.2341457i`; `−1.1557872+0.5870305i` | same | hold |
| `besselJ_sq_add_besselY_sq` | `ν = ½`, `z = 1`; `ν = 0.3`, `z = 1+0.2i` | `0.6366198`; `0.5877737−0.1101458i` | same (diff 8e−10) | hold |
| `besselJ_one_half` | `z = −1+0.1i` (near cut) | `0.0094924+0.6743902i` | same | holds |
| `besselJ_eq_kummer` | `ν = 0.3`, `z = 1+i`; `ν = −0.8+0.2i`, `z = 0.5−i` | `1.0253730−0.1488605i`; `−0.2266841+1.3606170i` | same | hold; Check `𝐌(1,2,w) = (e^w−1)/w` holds |
| `isBigO_hankelH1_sub_sum`, 5.3 Check | `ν = 0`, `ℓ = 1`, `z = 10i` | `|R⁺₁| = 0.011619` | bound `0.025633` | holds |
| `isBigO_besselK_sub_sum`, 5.1/5.3 Checks | `K₀(10)` | `1.778006232e−5`; remainder ratio after one term `−0.011856` | three terms `1.778118e−5`; first neglected term `−1/80` | hold (sign and size) |
| 5.5 Checks | `x = 1.3` | `I`: `1.188513, 0.797329, 0.242617`; `K`: `0.299575, 0.372547, 0.851398` | Checks | hold |
| `norm_besselJ_le_one`, Check | `ν = ½`, `x = −π/2` | `J = 0.6366198i` | `2i/π` | holds |
| `besselModulus_besselPhase`, Check | `θ_{1/2}(2)` by the pinned integral | `0.4292037` | `x − π/2 = 0.4292037` | holds |
| `isBigO_besselI_debye`, Check | `I₁₀(10)` | `21.89170616` | leading term `21.86488` | holds |
| `debyeU` | `U₁(1)` | `−1/12` | Stirling coefficient | holds |
| `besselJZero_spec`, Checks | `j₀,₁`, `j₁,₁`, `y₀,₁` | `2.4048255577`, `3.8317059702`, `0.8935769663` | Checks | hold |
| `isBigO_besselJZero_mcmahon` | `ν = 0`, `m = 1, 2, 5`: `(j − a − 1/(8a))a³` | `−0.0578, −0.0740, −0.0797` | next coefficient `−124/1536 = −0.0807` | bounded; holds |
| `integral_besselJ_mul_besselJZero` | `ν = 1.5`, `(l,m) = (1,1), (1,2), (2,2)` | `0.0674963`, `−7e−15`, `0.0405248` | `J′²/2` resp. `0` | hold |
| 7.1 Check `I_{−3/2}`, `I_{−5/2}` | grid on `(0, 20)` | one sign change; minimum `0.635 > 0` | Check | holds |
| `integral_rpow_mul_besselK` | `ν = 0.3`, `μ = 1.7`; complex (R15) | `1.054348555`; `0.7972070+0.6029651i` | `2^{μ−2}Γ·Γ` same | hold |
| `integral_cpow_mul_exp_mul_besselJ` | `μ=0.8+0.3i, ν=0.4+0.1i, a=1+0.5i, b=0.6+0.7i` | `0.456026−0.362517i` | same (diff 1e−6) | holds |
| `exists_integral_cpow_mul_exp_mul_besselJ`, Checks | `(1,0,1,2)`; `(1.3,0.7,1,2.5)`; `μ=1.2, ν=0.3, a=1, b=1.5+0.4i` | `0.4472135955`; `0.2125729798`; `0.3769214−0.0732330i` | Pfaff continuation of `𝐅`, same | hold |
| `tendsto_integral_besselJ_mul_besselJ`, Checks | `μ=½, n=1, a=2, b=1`; `b=a`, `J_{7/2}J_{1/2}`; `J_{5/2}J_{1/2}` | `0.309434` at `R=1600`; `−0.4988`; `−1.80` and decreasing | `0.3093592168`; `−½`; Check `−½` | first two hold; third false (R06) |
| `sphericalBesselJ_eq_besselJ` / `𝗒` def | `n = 3`, `z = 0.9+0.2i`; `𝗒₂` at `z = −0.9+0.2i` | `0.0057526+0.0042461i`; `3.662824+2.437131i` | same | hold |
| `modifiedSphericalBesselK` def | `𝗄₀`, `𝗄₁`, `𝗄₂` at `0.8+0.3i` | `0.6532201−0.5056818i`, … | `(π/2)e^{−z}/z`, 10.49.12, `√(π/2z)K_{5/2}` same | hold |
| 9.2 Checks | 10.49.19 at `n=1, z=1`; 10.50.4 at `n=2, z=2`; `𝗃₁(1)` | `2.0000000`; `−0.0625000`; `0.3011686789` | `2`; `−1/16`; Check | hold |
| `hasSum_planeWave` | `z = 1`, `α = 0` | `0.5403023−0.8414710i` | `e^{i} = 0.5403023+0.8414710i` | false (R01); repaired form gives `+0.8414710i` |
| `kelvinBer`/`kelvinBei` def, Checks | `ber 1`, `bei 1`; 10.64.1; 10.63.4; 10.71.5 | `0.9843817812`, `0.2495660400`; `0.9376084768`; `−0.0883116`; `1.0312903` | Checks; integral; `ber₁+bei₁`; `ber²+bei²` | hold |
| `kelvinBer` def, wrong model | 10.61.9 at `x = 1.1` with `e^{πi/4}` | `1.027159` | `−0.005963` | the pinned `e^{3πi/4}` gives `−0.005963`: discriminates |
| `hasSum_kelvinBer` | `ν = 0.4`, `x = 1.3` | `0.3120415371` | same | holds |
| `kelvin_ode` | `ν = 0.6`, `x = 1.4` | residual `4e−8` (difference step) | `0` | holds |
| `airyAi` def, `airyAi_eq_besselK` | `Ai(1)`, `Ai(0)`; `z = 1+i`, `2e^{2.0i}`, `0.5e^{−2.05i}` | `0.1352924163`, `0.3550280539`; `0.0604583−0.1518896i`, … | `3^{−2/3}/Γ(⅔)`; K form same | hold |
| `airyAi_eq_besselK`, control | `z = 2e^{2.3i}` (`|arg| > 2π/3`) | `1.5235−0.0256i` | `−1.4888+0.0416i` | fails, as the hypothesis requires |
| `gegenbauerC` def, Checks | `C₂^{(ν)}`; `C_k^{(1/2)}(0.3)` for `k ≤ 4` | `0.3, −0.365, −0.3825, 0.0729375` | `P_k(0.3)` | holds; see R01 for the Mathlib form |
| `hankelCoeff` def | `a₁`, `a₂` | `(4ν²−1)/8`, `(4ν²−1)(4ν²−9)/128` | 10.17.1 | holds; `2^k` in place of `(−2)^k` flips `a₁` |
| 10.10.1 (R07) | `ν = 0.3+0.2i`, `z = 1.7−0.4i`; `ν = ½`, `z = 1.2` | `−0.5144211−1.0539424i`; `2.5721516` | `J_ν/J_{ν−1}`; `tan 1.2` | hold |

## Not verifiable

- **Watson 1944** (§7.3, §15.27, §18.24). The 2nd edition is in copyright, with no legal open copy, so I did not read it. The facts cited from §15.27 and §18.24 are also stated in DLMF §10.21(i) and 10.23(iii), which I checked.
- **Olver 1997**, Chapter 7 §13 and Chapter 10 Theorem 3.1. These are behind a paywall. The page numbers 377–378 are corroborated by DLMF 10.41(iv), and the deferral by DLMF §2.8(ii). The constant `2 exp(2𝒱(A₁)/u)` in 6.1 is not verified.
- **Nemes 2017** and **Gautschi 1967**. They are cited in References only, at no sampled locator, so I did not fetch them.
- **DLMF §10.23**. The sources service returned only the figure PDF for this page, so I read it directly from dlmf.nist.gov through a fetch tool that paraphrases. The 10.23 checks (2.5, 2.6, R13) therefore rest on a paraphrase, cross-checked numerically.
- **Ownership against open pull requests** was checked for the roadmaps the tools list and the brief's sibling checkouts. I did not search beyond these.

## Source issues

- **Gap** in DLMF at §10.17(iv), 10.17.14–10.17.15 (online): the paths are required to have `|ℑt|` monotone, which no path from `ph z < 0` to `+i∞` can satisfy, yet 10.17.15 gives bounds there; it should require `ℑt` nondecreasing along the path; affects a stated result.
