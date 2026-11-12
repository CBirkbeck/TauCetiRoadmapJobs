# Review of SpecialFunctionsGeneralizedHypergeometric (pull request #2136 at 0914cdb)

**Verdict:** needs changes

The push gate fails on this head: `imports=1` (R02) and `readme-ids-missing=2` (R03). The mathematics holds up well. Every statement I tested numerically is true, and every Check reproduces except one digit (R10). The README also finds and repairs two real defects in DLMF itself (see Source issues). The blocking problem is the selection in `Suggested.lean`. Statable headlines are missing while padding is present (R01, R04).

## R01 (P2) — Statable headlines are missing from `Suggested.lean`

**Location.** `TauCetiRoadmap/SpecialFunctionsGeneralizedHypergeometric/Suggested.lean` lines 10–14: "the series `H` of 16.11.2 with 16.11.6, the cubic transformation 16.6.2, Nørlund's expansion 16.10.2 and the large-parameter expansion 16.11.10, whose statements have the same shape as the ones given."

**Claim.** The module docstring may leave out only a headline that cannot be stated at the pins, and it must name the carrier that is missing. "Same shape as the ones given" says the opposite: these statements use carriers the file already has.
- 16.11.6 is the convergent expansion at `∞`. Layer 5 is built to reach it, and 16.8.8–16.8.9 are derived from it.
- 16.6.2, 16.10.2 and 16.11.10 are the companions of the stated 16.6.1, 16.10.1 and 16.11.11.

The list is also incomplete. The solution property of 16.8.6 (README 3.3, `solution_16_8_6`) is absent and not named. So are 16.3.2–16.3.4 for general `n`, 16.4.12 and 16.8.4–16.8.5.

**Witness.** In a scratch copy of the file, the two signatures below elaborate with `sorry` as the only warning. Numerically, 16.11.6 matches at `z = −3 + i` and `2.5 − 0.7i` to 10⁻²⁰, and 16.6.2 matches at three points of `‖z‖ < ½` to 10⁻²⁶ (see the table).

**Repair.**
- State 16.11.6 and 16.6.2 (tested signatures below), 16.10.2 (on `‖ζ − 1‖ < 1`, `z.re < 1/2`, `p = q + 1`) and 16.11.10 (`p = q + 1`, `1 − z ∈ slitPlane`, `r → ∞`).
- State the solution property of 16.8.6, or drop its README name (R03).
- Rewrite the docstring sentence so that it lists only what cannot be stated, each with its missing carrier. If nothing remains, delete it.

```lean
theorem generalizedHypergeometric_cubic_16_6_2 {a b : ℂ} (hb : ∀ k : ℕ, b ≠ -k)
    (hb' : ∀ k : ℕ, a - b + 3 / 2 ≠ -k) {z : ℂ} (hz : ‖z‖ < 1 / 2) :
    pFq {a, 2 * b - a - 1, 2 - 2 * b + a} {b, a - b + 3 / 2} (z / 4) =
      (1 - z) ^ (-a) * pFq {a / 3, a / 3 + 1 / 3, a / 3 + 2 / 3} {b, a - b + 3 / 2}
        (-27 * z / (4 * (1 - z) ^ 3)) := sorry

theorem regularizedGeneralizedHypergeometric_eq_balancedH {q : ℕ} (a : Fin (q + 1) → ℂ)
    (b : Multiset ℂ) (hb : Multiset.card b = q) (ha : ∀ j, ∀ k : ℕ, a j ≠ -k)
    (haa : ∀ i j, i ≠ j → ∀ n : ℤ, a i - a j ≠ n) {z : ℂ} (hz : -z ∈ slitPlane)
    (hz₁ : 1 < ‖z‖) :
    (∏ j, Gamma (a j)) * 𝐅 (Finset.univ.val.map a) b z =
      ∑ m, ∑' k : ℕ, (-1) ^ k / (k ! : ℂ) * Gamma (a m + k) *
        (∏ l ∈ Finset.univ.erase m, Gamma (a l - a m - k)) *
          (b.map fun x => (Gamma (x - a m - k))⁻¹).prod * (-z) ^ (-a m - k) := sorry
```

## R02 (P3) — `Suggested.lean` imports another roadmap's module (gate `imports`)

**Location.** `Suggested.lean` line 4: `public import TauCetiRoadmap.SpecialFunctionsHypergeometric.Suggested`.

**Claim.** The file may import only `Mathlib` and individual `TauCeti.*` modules, so the gate refuses it. Three theorems use the import: `regularizedGeneralizedHypergeometric_pair_singleton`, `gaussHypergeometric_sq_clausen` and `hasSum_gaussHypergeometric_sq`.

**Witness.** The gate rerun on this head reports "found: … `public import TauCetiRoadmap.SpecialFunctionsHypergeometric.Suggested` (line 4)".

**Repair.**
1. Delete line 4.
2. Delete `regularizedGeneralizedHypergeometric_pair_singleton` from the Lean file; README 1.2 keeps the target. The docstring then says that it cannot be stated at the pins because `Complex.regularizedGaussHypergeometric` is not in Tau Ceti.
3. Restate 16.12.2 and 16.12.3 with this roadmap's own function: `pFq {a, b} {a + b + 1 / 2} z ^ 2` and `(pFq {a, b} {c} z ^ 2)`.

I tested these edits on a scratch copy: it elaborates with exit 0 and `sorry` as the only warning. Then correct the pull-request description's sentence "`Suggested.lean` imports Mathlib, Tau Ceti and SpecialFunctionsHypergeometric's `Suggested.lean`": the head imports no `TauCeti` module directly.

## R03 (P3) — The README and `Suggested.lean` name different declarations (gate `readme-ids-missing`)

**Location.** The README backticks ten names as declarations of its own, but `Suggested.lean` declares none of them:
- `generalizedHypergeometric_cubic_16_6_2` (6.1);
- `regularizedGeneralizedHypergeometric_eq_balancedH` and `hasSum_balancedH` (5.3);
- `partialSum_eq_reversed_16_2_4` (1.5);
- `solution_16_8_6` (3.3);
- `regularizedHGFun_three_term_16_4_12` (4.4);
- `IsWellPoised`, `IsVeryWellPoised` and `IsBalanced k` (4.1);
- `bilateralHypergeometric` (4.5).

The gate catches only the first two.

**Claim.** A backticked name of this roadmap's own claims that `Suggested.lean` declares it. In the other direction, every Lean name must appear in the README. 22 of the 56 Lean declarations are named nowhere in it, for example:
- `regularizedHGFun_watson`, `regularizedHGFun_whipple`, `regularizedHGFun_rogersDougall`;
- `terminatingSum_whipple_4F3`, `terminatingSum_whipple_7F6`;
- `wronskian_solution_16_8_7`, `tendsto_integral_inverseLaplace_16_5_4`, `hasSum_gaussHypergeometric_sq`, `isBigO_generalizedHypergeometric_shift`;
- both `tendsto_generalizedHypergeometric_confluence_*`, both `thetaShift_regularizedGeneralizedHypergeometric_*`, and `regularizedGeneralizedHypergeometric_zero_one_mul`.

`…_shift_top` and `…_16_4_13` appear only elided.

**Witness.** The gate lists `generalizedHypergeometric_cubic_16_6_2` and `regularizedGeneralizedHypergeometric_eq_balancedH`. A scan of every backticked identifier against the Lean declarations gives the rest.

**Repair.**
- R01 declares the 16.6.2 and 16.11.6 names.
- For the other eight, state the fact in prose without the name. No headline needs those definitions, since the Lean sums write their parameters out.
- Name each Lean declaration that remains after R04 in full, at its README target.

## R04 (P3) — Padding in `Suggested.lean`

**Location and claim.** These declarations are not headlines:
- `gammaProd_mul_regularizedHGFunCoeff` restates Mathlib's `regularizedHGFunCoeff` (`Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean:67`) through `Complex.Gamma_add_nat_div_Gamma_eq` (`Gamma/Beta.lean:481`).
- `hasSum_regularizedHGFun_of_norm_lt_one` is library API. The one-tactic probe needed eight lines, because the scratch proof rests on Mathlib's `radius_regularizedHGFunSeries_eq_top` and `radius_regularizedHGFunSeries_ge_one` (`RegularizedHypergeometric.lean:249`, `:319`) and `FormalMultilinearSeries.hasSum`, as Tau Ceti's `Complex.hasSum_regularizedHGFun` does for `p ≤ q` (`TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean:53`).
- `regularizedGeneralizedHypergeometric_eq_regularizedHGFun` restates the definition: for `p ≤ q` it is the `if_neg` branch, and for `p = q + 1` it is the `choose_spec` on the disk.
- `regularizedGeneralizedHypergeometric_singleton_zero` is the boundary case `q = 0`.
- `terminatingSum_dixon_odd` is the degenerate (vanishing) case.
- `sum_lerch` is a finite telescoping identity.
- `iterate_theta_eq_16_3_5`, `deriv_wronskian_eq` and `exists_eq_sum_of_wronskian_ne_zero` are statements about arbitrary functions. The roadmap's own instance is `wronskian_solution_16_8_6`.
- `tendsto_integral_exp_mul_cpow_neg` is about `Γ` alone.
- `hasSum_dougall_bilateral` is the supplier's `hasSum_dougall` (SpecialFunctionsHypergeometric 4.2, 15.4.25) multiplied by `Γ(c)Γ(d)/(Γ(a)Γ(b))`, plus reflection.

**Witness.** The scratch proof of `hasSum_regularizedHGFun_of_norm_lt_one` elaborates (exit 0). For the others, compare each statement with its definition or supplier line cited above.

**Repair.** Delete them from `Suggested.lean`; the README keeps every statement. `pochZ` is then unused, so delete it too.

## R05 (P3) — 16.4.15 is stated only for `f = −n`

**Location.** README 4.4: "16.4.15 (Whipple's `₇F₆ → ₄F₃`) when the right side terminates, `f = −n`"; `terminatingSum_whipple_7F6`.

**Claim.** DLMF-16.4 line 794 gives 16.4.15 whenever the right-hand series terminates and the left converges. The cases `d`, `e` or `f = −n` reduce to `f = −n` by symmetry. The case `a − b − c + 1 = −m` does not: there the left side is an infinite series. The roadmap neither states this case nor puts it under Beyond, which excludes only the second term of the non-terminating case.

**Witness.** `(a, b, c, d, e, f) = (1.3, 1.5, 1.8, 0.2, 0.3, 0.25)` gives `a − b − c + 1 = −1` and convergence exponent `4a + 4 − 2(b + c + d + e + f) = 1.1 > 0`. Both sides equal `1.07545 73418 14…`.

**Repair.** Add the case `a − b − c + 1 = −m`. The left side is Mathlib's series at `1` under `Re(b + c + d + e + f − 2a) < 2`, and the right side is a finite sum.

## R06 (P3) — 16.12.3: the hypothesis `c ∉ ½ + ℤ` excludes valid parameters

**Location.** README 6.3: "and `c ∉ ½ + ℤ` (so that `3/2 − k − c ≠ 0, −1, …`)"; Lean hypothesis `hc''` of `hasSum_gaussHypergeometric_sq`.

**Claim.** The hypothesis `2c − 1 ∉ {0, −1, …}` already excludes `c = ½ − m`. So `hc''` excludes only `c = 3/2, 5/2, …`. There `3/2 − k − c = −k − m`, and `(−k − m)_j ≠ 0` for every `j ≤ k`, so the sum is defined and the identity holds.

**Witness.** At `(a, b, z) = (0.3, 0.45, 0.4)`, both sides equal `1.08786 26121 2456` at `c = 3/2` and `1.04943 87383 3283` at `c = 5/2`.

**Repair.** Delete `hc''` and the parenthetical. The remaining hypotheses keep every denominator nonzero.

## R07 (P3) — 16.8.11: the README and the Lean disagree, and the README's condition varies along the limit

**Location.** README 7.1: "`|z| < |sin(ph β)|` when `p = q + 1` and `π/2 ≤ |ph β| ≤ π − δ`". In `tendsto_generalizedHypergeometric_confluence_bottom`, `h : Multiset.card a ≤ Multiset.card b`.

**Claim.**
- The Lean states `p ≤ q`, while the README claims `p ≤ q + 1`.
- For a limit taken along the sector, the condition on `z` cannot depend on `ph β`, which varies. From `|β + k| ≥ |Im β|`, the uniform condition is `‖z‖ < 1` together with `‖z‖ < sin δ` when `δ < π/2`.

**Witness.** With `p = 1`, `q = 0`, `a = 0.7` and `z = 0.5`, take `β = −2000 + 1500i` (`|sin ph β| = 0.6`). Then `₁F₁(a; β; βz) = 1.62481…`, against the limit `(1 − z)^{−a} = 1.62450…`.

**Repair.** State the `p = q + 1` case along `Bornology.cobounded ℂ ⊓ 𝓟 {β | |arg β| ≤ π − δ}` with `‖z‖ < 1` and `δ < π / 2 → ‖z‖ < Real.sin δ`, in the README and in the Lean.

## R08 (P3) — "The certificate is part of the target"

**Location.** README lines 626, 633, 635 (4.2), 671 (4.3), 720 (4.4) and 929 (6.3).

**Claim.** Each of these sentences makes a WZ or Zeilberger certificate part of a target. House style excludes certificates, and a proof sketch names a route without making it mandatory.

**Repair.** Keep "by a WZ pair in `n`" (or "by a recurrence in `k`") as the route, and delete the six clauses about the certificate.

## R09 (P3) — Definitions with fewer than three Checks

**Location.** 1.2 defines `IsPrincipalContinuation`, `regularizedGeneralizedHypergeometric` and `generalizedHypergeometric` and gives two Checks for all three. The classes of 4.1 and the bilateral function of 4.5 have no Checks.

**Repair.** Add discriminating Checks. For example:
- 1.2: Mathlib's `regularizedHGFun {1} 0` equals `1/(1 − z)` on the disk but is the divergent `tsum` value `0` at `z = −2`, so it is not a principal continuation, while `z ↦ 1/(1 − z)` is.
- 4.1: the `₇F₆` of 16.4.10 is very well-poised and 2-balanced. Dixon's `₃F₂` of 16.4.4 is well-poised but, for generic parameters, not very well-poised.
- 4.5: 16.4.17 at `b = d` gives `₁H₁(a; c; 1) = 0` for `Re(c − a) > 1`, while the sum over `k ≥ 0` alone is `(c − 1)/(c − a − 1)`. This excludes a one-sided definition.

## R10 (P3) — 1.2 Check: the last digit is wrong

**Location.** README 1.2, Checks: "`𝐅({0.3, 0.5, 0.7}; {−1, 1.9}; 0.4) = 0.01009 18376 68…`".

**Witness.** Summing the series of 16.2.5 to 3000 terms at 40 digits gives `0.01009 18376 69241 7…`.

**Repair.** Write `0.01009 18376 69…`.

## R11 (P3) — Four inaccurate sentences in the README

**(a) Conventions, lines 167–168.** "…the principal branch is the polynomial on the cut plane, and its values at `z = 1` and on the cut are those of Mathlib's series." The definition (line 163; Lean line 57) gives `0` off the cut plane. For `a = {−1, 2}`, `b = {1}` and `z = 1`, the polynomial is `−1` and `𝐅` is `0`.
Repair: "the polynomial's values at `z = 1` and on the cut are Mathlib's series there; `𝐅` itself is the junk `0` there."

**(b) Line 94.** "its Layers 1–5 for every formula of DLMF Chapter 15": SpecialFunctionsHypergeometric covers Chapter 15 in Layers 1–9 (quadratic in 7, cubic in 8, products in 9.3). Repair: write "Layers 1–9".

**(c) Line 1034.** "are still `sorry`" is process wording. Repair: delete the sentence.

**(d) Supplier contracts.** Two names need qualifying:
- `hasSum_multichoose_mul_geometric_complex_of_norm_lt_one` is `TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one` (`TauCeti/Analysis/Analytic/Binomial.lean:46`).
- `one_div_one_sub_cpow_hasFPowerSeriesOnBall_zero` is `Complex.one_div_one_sub_cpow_hasFPowerSeriesOnBall_zero` (`Mathlib/Analysis/Analytic/Binomial.lean:154`).

## Verified sound

**Gate and build.**
- The gate rerun on 0914cdb fails on `imports=1` and `readme-ids-missing=2`; every other scanner reports `0`.
- The bare rerun's `depcheck: NOT IN ORDER` is the default-order artifact for a new roadmap. With the job's candidate order the dependency check gives `depcheck: 236 roadmaps, 2133 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The roadmap sits at line 404 of the order. Its suppliers are SpecialFunctionsHypergeometric, ZerosOfLFunctions and AsymptoticExpansions, all on main.
- `lake env lean` on `Suggested.lean` exits 0 in 11 s with 56 warnings, all "declaration uses `sorry`".
- The pull request changes nothing outside the folder. `metadata.toml` is accepted by the gate (`metadata=0`, `stray-files=0`).

**Lean form.**
- There is no `set_option`, no `lemma` and no `sorry`'d data. The eight `def`s have real bodies.
- There are no section `variable`s; every binder is explicit.
- I put `#check @…` for all 64 declarations in one scratch file and compared each elaborated type with its README statement. Casts are as intended: `↑q * (↑q - 1) / 2 : ℂ` in `wronskian_solution_16_8_6`, and `-↑k / 2` in `hasSum_gaussHypergeometric_sq`. Nothing changed.

**Library declarations at the pins.**
- All 38 Mathlib names in the supplier contracts resolve by `#check` at Mathlib `1b1ccf4b`. I opened `RegularizedHypergeometric.lean:67` (coefficient), `:192` (`regularizedHGFun` is `FormalMultilinearSeries.sum`), `:201`, `:249`, `:302`, `:319`, `:342`, `:414`; `Gamma/Beta.lean:481`; and `Analytic/Binomial.lean:154`.
- Tau Ceti at `2fd255d9`: `RegularizedHypergeometric.lean:53`, `Analytic/Binomial.lean:46`, `Contour/Residue/Basic.lean:80` (`TauCeti.Contour.residue`).
- Neither library has Pfaff–Saalschütz, Dixon, Watson, Whipple, Thomae, Clausen, Hankel's line integral or an order-`n` Abel identity. Grep finds Tau Ceti's Jacobi formula for derivations (`RingTheory/Derivation/Determinant.lean:49`), which is not the same result.

**Cross-roadmap citations resolved on main** (the README line it cites is given first, then the Lean line):
- SpecialFunctionsHypergeometric:
  - Conventions;
  - 1.2–1.4 (`regularizedGaussHypergeometric_eq_regularizedGaussHGFun`, 376 / 105);
  - 4.2 (`ordinaryHypergeometric_one` 633 / 215, `ordinaryHypergeometric_neg_nat_one` 639 / 226, `hasSum_dougall` 641 / 230, Carlson lemma 664);
  - 4.3;
  - 5.1 (`regularizedGaussHypergeometric_euler`, 708 / 263);
  - 6.3 (the Mellin–Barnes integral of `(1 + u)^{−a}`, 852–853, matched to the base case of 5.2 by `s = −σ′ − iy`);
  - 7.3 (`gaussHypergeometric_half` 923 / 409; 15.4.30 at 925).
- ZerosOfLFunctions §1.2 (README line 510) and §1.3 (line 520).
- AsymptoticExpansions 8.2 (`integral_vertical_sub_eq_two_pi_mul_sum_residue`, Suggested 407), 8.6 (`exists_norm_Gamma_le`, 419) and 8.7 (`integral_Gamma_mul_cpow_neg`, 424). These are unchanged at the head of AsymptoticExpansions' open revision.
- The overlaps tool reports nothing dropped or changed.

**Ownership against open pull requests** (checked with `roadmaps grep` and `roadmaps show`):
- SpecialFunctionsConfluent sends the non-terminating `₂F₀` to "a roadmap for Chapter 16". That matches this roadmap's Beyond section and Downstream consumers.
- SpecialFunctionsStruve leaves `pFq` beyond Mathlib's series to Chapter 16. Its `₁F₂` is Mathlib's series, which is `𝐅` here by 1.3.
- SpecialFunctionsBessel and SpecialFunctionsLegendre state no Chapter 16 formula.
- Abel's identity is owned for second-order equations by SpecialFunctionsHypergeometric 3.1 and SpecialFunctionsLegendre 1.3. AsymptoticExpansions Layer 10 is second order only. The order-`n` version here has no other owner.

**Source sample.** I checked all 15 seeded targets against DLMF Release 1.2.8 of 2026-09-15, the release the README names; the formulas were read from the TeX alttext.
- 1.2: 16.2(iii) and 16.5.2. DLMF-16.5 line 258 extends 16.5.2 to `p = q + 1`.
- 1.3: 16.2.1 and 16.2.5.
- 1.5: 16.2.3 (DLMF-16.2 line 276) and 16.2.4.
- 1.6: DLMF-16.2 lines 211–218.
- 2.2: 16.3.6–16.3.7, and the first-order relations from 16.3.3–16.3.4 at `n = 1`.
- 3.1: 16.8.1 and the definition of a regular singularity (DLMF-16.8 lines 96–99).
- 3.2: 16.8.3–16.8.5, and the order `max(p, q + 1)` (line 265).
- 3.3–3.4: 16.8.6 and 16.8.7, with their hypotheses (lines 270, 317).
- 4.1: 16.4.1, 16.4.2 and 16.4.2_5.
- 4.2: 16.4.3, 16.4.5, 16.4.6 at `a = −n`, 16.4.8, 16.4.9 at `d = −n`, 16.4.10.
- 4.4: 16.4.11 (conditions at line 624), 16.4.12–16.4.15.
- 5.2: 16.5.1 with both contours (DLMF-16.5 lines 101–114).
- 6.1: 16.6.1–16.6.2.
- 6.2: 16.10.1, and 16.10.2 with its convergence region (DLMF-16.10 lines 110–111).

Every theorem number and hypothesis matches, apart from R05 and R07. The README does not flag any locator as unverified.

**Adversarial table.** I computed it with mpmath at 20–40 digits. "both" means the two sides agree to the digits shown.

| Statement | Instances | Values (left / right) | Result |
|---|---|---|---|
| 1.2 Check 1 (`𝐅` vs `F/∏Γ`) | `a = {0.3,0.5,0.7}`, `b = {−1,1.9}`, `z = 0.4` | series `0.0100918376692…`, first two coefficients `0`; `F = 0` (junk Γ(−1)) | holds; digit (R10) |
| 1.2 Check 2, 1.4 conjugation | same `a`, `b = {1.2,1.9}`, `z = 2 ± i` | `1.0554948230021 ± 0.1203805941814 i` | holds |
| Layer 1 Examples | `z = 2 + i`, `−3` | `1.05549482300 + 0.12038059418 i`; `0.913947180866` | match README |
| 1.2 shift relations | random complex parameters, `(p,q) = (2,1), (3,2), (2,2)`; `z = 0.3 + 0.2i` | `|lhs − rhs| ≤ 5·10⁻³¹` | holds |
| 1.2 Euler integral, `p = q + 1` off the disk | `a₀ = 0.3`, `b₀ = 1.2`, `a = {0.5,0.7}`, `b = {1.9}`, `z = 2 + i` | `1.195265157 + 0.136321587 i` / `1.195265112 + 0.136321587 i` | holds (quadrature 4·10⁻⁸) |
| 1.3 at `z = 0` | Mathlib `regularizedHGFun_zero` | `C a b 0 = 1/∏Γ(b)` | holds |
| 1.5 16.2.3 | random complex, `(p,q) ∈ {(1,0),(2,1),(0,2),(2,3)}`, `m = 4` | `|diff| ≤ 3·10⁻³⁰` | holds |
| 1.5 16.2.4 | `(1,0)`, `(2,1)`, `m = 4` | `|diff| ≤ 5·10⁻³⁰` | holds |
| 1.6 trichotomy | `γ = 0.4` at `z = −1`; `γ = −0.5` at `z = −1`; `γ = −1.2` at `z = i` | partial sums `0.9915764 → 0.9915773`; `0.6810 → 0.6860` (oscillating); `|term_4000| = 3.30` | as stated |
| 2.2 16.3.7 | `(0.3,0.4,0.5,1.6,1.2)`, `z = 0.37`, `2 + i` | residuals `−2.6·10⁻¹⁷`, `1.1·10⁻¹⁶` (double-precision inputs) | holds |
| 2.2 bottom relation at `z = 0` | `(b₀ − 1)/Γ(b₀)` vs `1/Γ(b₀ − 1)`, including `b₀ = 1` | equal (`0 = 0`) | holds |
| 3.2 `α_q`, `β_q` | expanded by `ϑᵏ = Σ S(k,j) zʲ Dʲ` | `β_q = q(q−1)/2 + Σb`; `α_q = −(q(q+1)/2 + Σa)`, `−1`, `0` | holds; `q = 1` gives the Gauss equation |
| 3.3 Wronskian 16.8.6 | `a = {0.3,0.55,0.8}`, `{0.3,0.55}`, `{0.3}`; `b = {0.4,0.75}`; `z = 0.37`; numerical determinant | `−1.41310431659`, `−0.644487583768`, `−0.445169699778` / closed form, same | holds |
| 3.3 at `q = 0` | `W = 𝐅({a}; ∅)` | `(1 − z)^{−a}` both | holds |
| 3.4 Wronskian 16.8.7 | `a = {0.3, 0.55+0.2i, 0.8}`, `b = {1.4,1.9}`; `z = −3+i`, `2−1.5i`, `0.5+0.4i` | `W/form = 0.05125` at all three | nonzero constant |
| 4.1 Lerch | `a = 0.3+0.2i`, `c = 1.7−0.4i`, `n = 5` | `|diff| 5·10⁻³²` | holds |
| 4.2 16.4.3 Check | `(1, ½, ½, 3/2)`, `d = −½` | `4/3` both | holds |
| 4.2 16.4.5 Check | `n = 2`, `b = c = −2` | `−6` both (by hand) | holds |
| 4.2 16.4.10 Example | `n = 3`, `(1.3,0.4,0.5,0.3)`, `f = 5.4` | `1.0361158443207` both | holds |
| 4.3 claim: 16.4.7 at `c = −n` is not 16.4.8 | `a = d = ½` and `(0.3, 1.4)`; `n = 0, 1, 2` | `n = 1`, `a = d = ½`: `4/3` vs `8/3` | README correct |
| 4.3 16.4.4 | Check `(0.4, −0.3, 0.2)`; regularized at `(0.7+0.3i, −0.2+0.1i, 0.1−0.4i)` | `0.986538134921` both; `|diff| 2·10⁻³¹` | holds |
| 4.3 16.4.6 | Check `(0.3,0.5,0.9)`; regularized complex | `1.171017670070` both; diff `0` | holds |
| 4.3 16.4.7 | Check `(0.3,0.8,1.4)`; regularized complex; `d = 10⁻¹²` | `1.233508789589` both; `5·10⁻⁴¹`; `0.207710883321 + 0.041259857528 i` both | holds, also at a bottom pole |
| 4.3 16.4.9 | Check `(1.3,0.4,0.5,0.3)`; regularized complex | `1.039621674495` both; `5·10⁻⁴¹` | holds |
| 4.4 16.4.11 | Check; regularized complex | `1.046642322110` both; `2·10⁻⁴¹` | holds |
| 4.4 16.4.12, 16.4.13 | Check parameters; 16.4.13 at `z = 0.6` | residuals `10⁻²⁷`, `0`; `0.0458148` | holds at `1`, fails at `0.6` (as the Check says) |
| 4.4 16.4.14 Check | `n = 3`, `f = −3.6` | `1.032015061693` both | holds |
| 4.4 16.4.15 | Example `n = 2`; case `a − b − c + 1 = −1` | `0.999443560621` both; `1.075457341814` both | holds; second case missing (R05) |
| 4.5 16.4.17 | `(0.3+0.1i, −0.4+0.2i, 1.7−0.3i, 1.2+0.5i)` | `1.1307261 + 0.4435326 i` both (to 10⁻⁹) | holds |
| 5.1 16.5.3 | `p = q = 0`: `a₀ = 0.7+0.2i`, `z = 0.5+2i`; `p = q = 1`: `z = −2+0.5i` | `0.32753999 + 0.32622089 i` both; `0.885764727128 + 0.033270726533 i` both | holds |
| 5.1 Hankel's integral | `c = 1`, `b = 1.7+0.3i`, `T = 400` | `1.1377698 − 0.0743747 i` vs `1/Γ(b) = 1.1377792 − 0.0743397 i` | converging |
| 5.2 16.5.1 Checks | `σ = −0.3`, `p = q + 1` and `p = q` | `0.843329228800777` both; `0.578540704345998` both | holds |
| 5.3 16.8.8 Checks | four points of the Check | `|diff| ≤ 10⁻¹⁹` | holds |
| 5.3 16.11.6 | `z = −3+i`, `2.5−0.7i` | `|diff| ≤ 10⁻²⁰` | holds (R01) |
| 5.3 16.8.9 Checks | `(−4+i, 0.5+0.3i)`, `(5+2i, 1+i)` | `|diff| ≤ 2·10⁻²⁰` | holds |
| 5.3 16.8.9 off `centeredDomain` | `q = 0`, `a = ½`, `(3+i, 2i)` | `0.27232873955 + 1.15360305297 i` vs its negative | README correct |
| 6.1 16.6.1 | Example `z = 0.9i`; Check `z = −2.5`, `b = 0.45+0.2i` | `0.94124197785 + 0.13260292775 i` both; `0.79279 − 0.11267 i` vs `0.71861 − 0.02845 i` | holds in the disk, fails outside |
| 6.1 16.6.2 | preimages of `(1,∞)`; three points of `‖z‖ < ½` | minimum modulus `0.5000083` (`s = 1.0001`); `|diff| ≤ 1.5·10⁻²⁶` | `‖z‖ < ½` is right |
| 6.2 16.10.1 Check | `α = 0.7`, `β = 1.3`, `γ = 0.4`, `b = 1.6`; three `(z, ζ)` | `12.4611918612`; `−0.135803789514`; `0.220544039 + 0.037247939 i` (both) | holds |
| 6.2 16.10.2 | `a = {0.3,0.7}`, `b = {1.4}`, `z = 0.45+1.5i`, `ζ = 1.8+0.3i` | `0.83375663014 + 0.21498797211 i` both | holds (R01) |
| 6.3 16.12.1, 16.12.2 | the printed Checks and Example | `9.69461762548 − 20.11750813820 i`; `20.203540218799`; `0.72386838517 + 0.56286644377 i` | holds |
| 6.3 16.12.3 | `(0.3, 0.45, c, 0.4)`, `c = 0.9, 1.5, 2.5` | `1.15844435764`; `1.08786261212`; `1.04943873833` (both) | holds (R06) |
| 7.1 16.8.10 | `a = 0.7`, `b = 1.3`, `z = 1.5−0.5i`, `α = −2000+300i` | `2.344385 − 0.839372 i` → `2.344906 − 0.840063 i` | converging |
| 7.1 16.8.11 | `β = 300+100i`; `p = 1`, `q = 0`, `β = −2000+1500i` | `2.343921 − 0.834659 i` → `2.344906 − 0.840063 i`; `1.6248144` → `1.6245048` | converging (R07) |
| 7.2 16.11.11 | `p = 1`, `q = 2`, `m = 2`, `z = 2+i`, `r = 50, 100, 200` | `|F − partial|·r² = 2.33, 2.41, 2.46` | bounded |

## Not verifiable

- Andrews–Askey–Roy, Bailey 1935, Luke 1969 and Petkovšek–Wilf–Zeilberger are listed under References but cited at no claim. I did not open them, and no sampled locator depends on them.

## Source issues

- **Error** in DLMF Release 1.2.8 at 16.4.8 (§16.4(ii), DLMF-16.4 line 448): the source says 16.4.8 is 16.4.7 at `c = −n`; it should be a separate terminating sum, since 16.4.7's right side at `c = −n` is 16.4.8's times `1 + sin(πa)/sin(πd)` (`n = 0`, `a = d = ½`: 2 versus 1); affects nothing.
- **Error** in DLMF Release 1.2.8 at 16.8.9 (§16.8(ii), DLMF-16.8 lines 393–394): the source says `|z − z₀| > max(|z₀|, |z₀ − 1|)` and `|ph(z₀ − z)| < π` suffice; it should be restricted to the component containing `z₀ − t` for large `t`, since `q = 0`, `a = ½`, `(z, z₀) = (3 + i, 2i)` gives minus the principal branch; affects a stated result.
