# Review of SpecialFunctionsParabolicCylinder (pull request #1801 at 1c58a9d)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/SpecialFunctionsParabolicCylinder/README.md` and `Suggested.lean` at 1c58a9d. The folder changed by 2191 lines since cad1a20, so the review is not incremental. It covers:

- the previous review's seven findings, checked one by one;
- principles;
- the seeded source sample against the cached DLMF texts;
- an adversarial pass, recomputed numerically with a pure-Python implementation of the pinned definitions (series for `u₁`, `u₂`, reciprocal-Gamma `U`, `V`, double-exponential quadrature);
- duplication and ownership against Mathlib 1b1ccf4, Tau Ceti 2fd255d, main (eaf17b1) and the open roadmap pull requests;
- the dependency check;
- elaboration of a probe copy of `Suggested.lean` with `#check @name` for all 82 declarations;
- the one-tactic padding probe.

The gate passes on this head. All findings are P3, and no statement was found false.

**Status of the previous review's findings at this head.**

- **r2 R01 (build, missing import): repaired.** `Suggested.lean` lines 3–5 import `Mathlib`, `TauCeti.Analysis.SpecialFunctions.Erf` and `TauCeti.Analysis.SpecialFunctions.Hermite.Function.Basic`, and `hasSum_regularizedKummer` is deleted. The worker's gate reports `build=0`, and my probe elaborates with exit 0.
- **r2 R02 (six Tau Ceti declarations missing): resolved by the new pin.** At Tau Ceti 2fd255d all six declarations exist:
  - `Complex.hasSum_regularizedHGFun` (`TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean` line 53);
  - `Real.continuous_inv_Gamma` (`Gamma.lean` line 73);
  - `Real.exists_abs_inv_Gamma_le` (`Gamma.lean` line 103);
  - `Real.Gamma_nat_add_half_eq_factorial` (`Gamma.lean` line 142, namespace `Real`);
  - `TauCeti.differentiable_intervalIntegral_mul_cexp_neg_mul` (`TauCeti/Analysis/Complex/LaplaceTransform.lean` line 46);
  - `TauCeti.differentiableOn_integral_mul_cexp_neg_mul` (`LaplaceTransform.lean` line 168).

  How the last one is used is R01 below.
- **r2 R03 (statable headlines absent): repaired.** The file now states:
  - 12.12.1–12.12.4 (lines 471–496);
  - 12.14.13–12.14.14 (lines 556–565);
  - 12.14.17–12.14.23 (lines 567–577).

  The docstring (lines 24–28) explains the unfolded `IsBigO` form.
- **r2 R04 (README form): mostly repaired.**
  - The README now has: `# Roadmap:`, `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` per supplier, `## How to read the build`, `## Layer k` with `### k.n` subsections, `**Checks.**` lists, `### Examples` and `### Dependencies` per layer, `## Downstream consumers` and `## References`.
  - The commit hash is gone, and `### 1.3` and `### 1.6` are kept for QuantumFoundations.
  - The secondary provenance section is allowed by main's README ("Put any file-by-file map in a clearly secondary provenance section").
  - Still open: one Check for `V` (R04) and a broken pointer to the exclusions section (R06).
- **r2 R05 (padding): repaired.** All listed declarations are gone (`hasSum_regularizedKummer`, `parabolicCylinderD_natCast_sqrt_two_mul_im`, the three `repeatedGaussianIntegral` boundary values, `residue_div_sub_eq_numerator` and the integrability and connector lemmas). One remaining case is R05 below.
- **r2 R06 (Gamma product narrowed): repaired.** Lean line 317 reads `(hx : ∀ n : ℕ, x ≠ -(n : ℝ))`, and README line 800 reads "For real `x ∉ {0, −1, −2, …}`". I checked it numerically at x = −1.5 and −0.25 (table). R02 below is a new issue with the same subsection.
- **r2 R07 (no locator for Wronskian constancy and uniqueness): repaired.** README lines 432–434 cite DLMF 1.13.5 (`dlmf113` lines 275–279, Abel's identity) and the uniqueness statement of §1.13(i) (`dlmf113` lines 126–129).

## R01 (P3) — *Needs* lines that do not supply their statements: 8.1 (12.12.2) and 6.1

**Location.**

- `README.md` line 1048: "For `Re a < −½` (12.12.2 …)".
- `README.md` line 1067: "*Needs:* 6.1 and 7.4; Mathlib `MeasureTheory.integral_integral_swap` and the Gamma integral."
- `README.md` lines 729–730: "*Needs:* 2.4 and 3.2; Tau Ceti `TauCeti.differentiableOn_integral_mul_cexp_neg_mul`; Mathlib `Complex.Gamma_eq_integral`."

**Claim.** The listed inputs prove 12.12.1–12.12.4, and they prove 12.5.1 for every `z` with `Re a > −½`.

**Witness.**

- 12.12.2's integrand behaves like `U(a,0) t^{−a−3/2}` at 0 (`U(−0.9+0.2i, 0) ≠ 0`), so it converges only for `Re a < −½`. That set is disjoint from 6.1's `Re a > −½`, so no continuation in `a` connects them.
- The Tau Ceti lemma assumes `‖f t‖ ≤ M` on `[0, ∞)` and gives holomorphy only on `0 < re z`. The kernel `t^{a−½}e^{−t²/2}` is unbounded for `Re a < ½`.

**Repair.**

- In 8.1's *Needs*, add: 4.1 (12.8.1 in the form `U(a, t) = t U(a + 1, t) + (a + 3/2) U(a + 2, t)`, which moves the parameter of 12.12.2 into `Re a > −½`) or 6.3 (12.5.4, valid for `Re a < ½`); and the identity theorem in `a` for 12.12.1, 12.12.3 and 12.12.4 outside `Re a > −½`.
- In 6.1's *Needs*, add Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (entire in `z`) and `MeasureTheory.integral_Ioi_mul_deriv_eq_deriv_mul` (Weber's equation by parts). Either drop the Tau Ceti lemma or restrict it to `Re a ≥ ½`, `Re z > 0`.

**Tested.** I computed 12.12.2 at `a = −0.9+0.2i` along exactly this route (6.1 for `a + 1`, `a + 2`, then 12.8.1). Left side `1.351534805+0.913787589i`, right side `1.351534766+0.913787586i`.

## R02 (P3) — 6.6(a) supports no target, yet the table says the layers need it

**Location.**

- `README.md` lines 89–90: "auxiliary results, which the layers need and which neither Mathlib, Tau Ceti nor a consumed roadmap provides", with the 6.6(a) row at line 96.
- 6.6(a), lines 800–811.
- 6.7's *Needs*, line 888: "3.5, 6.1 and 6.6".
- `Suggested.lean` lines 315–323 (`hasProd_Gamma_norm_quotient`, `norm_Gamma_one_add_mul_I_sq`).

**Claim.** The layers need the 5.8.3 product, its comparison in `x`, and `|Γ(1+iy)|²`.

**Witness.**

- 6.6(c) takes its Gamma bounds from AsymptoticExpansions §8.6 (line 842).
- 6.7 uses the residues of 6.6(b) and the bounds of 6.6(c) (lines 864, 872).
- No *Needs* line names 6.6(a). Its only use is the Example at line 895.
- AsymptoticExpansions (README line 94 at its head) does not own 5.8.3.

**Repair.** Either option fixes it:

- **(a) Delete.** Remove 6.6(a), its table row, the Example at lines 895–896 and the two Lean declarations. List "DLMF 5.8.3 and `|Γ(1 + iy)|²`" under "What it does not own". Edit lines 30, 60 and 125 accordingly.
- **(b) Keep.** Keep 6.6(a) as library material, and replace "which the layers need" for that row with what it is: an owned Gamma identity that AsymptoticExpansions leaves to the special-function roadmaps.

In both cases, write 6.7's *Needs* as "3.5, 6.1, 6.6(b) and 6.6(c)".

## R03 (P3) — 9.5 restates the definition of `w₁`, `w₂`; DLMF 12.14.15–12.14.16 say more

**Location.** `README.md` lines 1194–1196: "The even and odd solutions are `Re(e^{−ix²/4} Γ(½) 𝐌(¼ − ia/2, ½, ix²/2))` and `Re(x e^{−ix²/4} Γ(3/2) 𝐌(¾ − ia/2, 3/2, ix²/2))`."

**Claim.** This is DLMF 12.14.15–12.14.16.

**Witness.**

- `w₁(a, x) = Re u₁(−ia, e^{iπ/4}x)` (line 1177), and `u₁` is pinned as the Kummer form (line 150). Since `(e^{iπ/4}x)² = ix²`, 9.5 holds by unfolding the definition.
- `dlmf1214` lines 805 and 838 state the complex expressions without `Re`, together with the second forms `e^{ix²/4} M(¼ + ia/2, ½, −ix²/2)` and `x e^{ix²/4} M(¾ + ia/2, 3/2, −ix²/2)`.

**Repair.** State it for real `a, x` as an identity in `ℂ`:

```text
w₁(a, x) = e^{−ix²/4} Γ(½) 𝐌(¼ − ia/2, ½, ix²/2) = e^{ix²/4} Γ(½) 𝐌(¼ + ia/2, ½, −ix²/2)
```

State the same for `w₂`, with `x`, `Γ(3/2)`, `¾ ∓ ia/2` and `3/2`. The second equality is 1.4. The two forms are complex conjugates of each other, which proves the reality claimed in 9.1. Its *Needs* line is: 1.4, 2.1 and 9.1.

**Tested.** At `a = 0.3`, `x = 1.1` the two forms differ by 2.2e-16.

## R04 (P3) — `V` has one discriminating Check

**Location.** `README.md` lines 484–491 (3.2 **Checks**). Only "`V(½, z) = √(2/π) e^{z²/4}`" concerns `V`. `D` is an abbreviation of `U`, whose three Checks cover it.

**Claim.** Every definition has at least three discriminating Checks.

**Witness.** Flip the sign of `V`'s `u₂` term. `V(½, z)` is unchanged (computed difference 1.3e-15, since that coefficient contains `Γ(0)⁻² = 0`). But `V′(−½, 0)` becomes `−0.7978845608` instead of `+0.7978845608`.

**Repair.** Add two Checks:

- "`V(−½, 0) = 0` and `V′(−½, 0) = √(2/π)`: the coefficient of `u₁` contains `Γ(0)⁻¹ = 0`. A sign error in the `u₂` term gives `−√(2/π)`."
- "`V(3/2, z) = √(2/π) z e^{z²/4}`: the coefficient of `u₁` contains `Γ(0)⁻² = 0`. With `Γ(¼ − a/2)⁻¹` in place of `Γ(¼ − a/2)⁻²` the value is `−2√2 z e^{z²/4}`."

**Tested.** Both Checks hold: `V′(−½, 0) = 0.7978845608` and the residual is 5.2e-16.

## R05 (P3) — Padding: `parabolicCylinderU_neg_one_half`

**Location.** `Suggested.lean` lines 288–290: "`parabolicCylinderU (-1 / 2) z = exp (-z ^ 2 / 4)`".

**Claim.** It is a headline theorem.

**Witness.**

- `by simpa [parabolicCylinderD, neg_div] using parabolicCylinderD_natCast 0 z` closes it. I tested this in a scratch file importing the built module; the same tactic against `exp (z ^ 2 / 4)` fails with a type mismatch.
- It is also README 3.2's second Check.

**Repair.** Delete it from `Suggested.lean`, and remove its backticked name from README 5.1's first bullet (line 640). The README keeps the statement.

## R06 (P3) — The pointer to the excluded material is wrong

**Location.** `README.md` line 122: "See the last section for these."

**Claim.** The last section discusses the exclusions.

**Witness.** The last section is `## References` (line 1309). The exclusions are discussed in `## Beyond this roadmap (a roadmap for a roadmap; do not implement)` (line 1252), which is followed by `## Prior formalization`.

**Repair.**

- Rename the heading to `## Beyond this roadmap`.
- Delete "Contributors should not attempt it under this roadmap." (line 1255); the scope is already stated at lines 101–120.
- Write line 122 as "See [Beyond this roadmap](#beyond-this-roadmap) for these."

## Verified sound

**Gate and build.**

- The worker's gate at 1c58a9d passes every check, `build=0` included. My rerun of the text gate gives the same result. `git diff --stat origin/main...HEAD` outside the folder is empty.
- I elaborated a probe copy with `#check @name` for every declaration using `lake env lean`: exit 0 in 8 s. The only warnings are 71 `declaration uses sorry` (71 theorems, 11 definitions with real bodies).
- The file has no `variable` or `include`, so no binder can be lost. I compared each elaborated type with its README statement and found the same generality everywhere, including `Re a > −½`, `Re a < ½`, `Re a < −½`, `Re μ > 0`, `Re a ≤ −½ ∧ 0 ≤ t < π/4`, `|arg z| < 3π/4`, `|arg z| < π/4`, `2c ≠ Re A + n`, `x ∉ −ℕ`, `y ≠ 0` and `x > 0`.
- `deriv_parabolicCylinderW_zero_left` elaborates its left side as the derivative of `t ↦ ↑(W(0, εt))`. That equals the coerced real derivative, so it is not a defect.
- The file contains no `set_option`, `lemma`, `#eval` or sorried data.

**Padding probe.** I replaced each `sorry` by `first | rfl | (simp; done) | (simp [the file's definitions in scope]; done) | (norm_num [same]; done) | infer_instance`. It closed 0 of 71. The only one-step consequence found by reading is R05. `differentiable_dawson` follows in one term from `hasDerivAt_dawson`, but SpecialFunctionsEiLiErfIncompleteGamma §11.6 consumes that name, so I left it.

**Dependency check.**

- On this README, `gate --depcheck … --movable` gives `depcheck: 243 roadmaps, 2453 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- On QuantumFoundations' README at its head it reports: `moved: SpecialFunctionsParabolicCylinder moved in the merge order up before QuantumFoundations (supplier of it listed after it); checked as moved`. That is a placement move, not a defect.
- The supplier AsymptoticExpansions is a new-roadmap pull request (head dcc019c). The description names it under "Depends on". Its own suppliers are ZerosOfLFunctions (merge order line 85) and ContourIntegration (Completed), so it can sit before QuantumFoundations (line 210).

**Cross-roadmap citations resolved.**

- **AsymptoticExpansions at dcc019c:**
  - Conventions (`HasAsymptoticExpansion l φ a f := ∀ N, (f − ∑_{n<N} φ n • a n) =O[l] φ N`, as README line 184 restates);
  - §3.3, §4.2 (`hasAsymptoticExpansion_laplace_sector`);
  - §4.3: hypotheses `−π < α₁ < 0 < α₂ < π`, holomorphy, `q = O(e^{σ|t|})`, gluing in `z = e^ζ`; checked for `q_a` with `α₁ = −π/4`, `α₂ = π/4`, `σ = 0`, exponents `s + a + ½` and `Re α₀ > 0 ⇔ Re a > −½`;
  - §8.2 (simple poles, `φ(p) = residue`, iteration), §8.6 (pole-separated bound), §8.7 (`∫Γ(c+iy)w^{−c−iy}dy = 2πe^{−w}`);
  - its Downstream consumers list this roadmap with exactly these sections.
- **ContourIntegration (Completed):** Layer 2 heading at line 158 matches the anchor. `TauCeti.Contour.residue` (`Residue/Basic.lean` line 80), `residue_div_sub_pow_of_analyticAt` (line 467), `residue_eq_of_tendsto_sub_mul` (`SimplePole.lean` line 152) and `classicalResidueTheorem_circle` (`Theorem.lean` line 349) all exist.
- **ZerosOfLFunctions §1.3** (line 469 on main), named through AsymptoticExpansions.
- **Consumers.**
  - QuantumFoundations (its README lines 73, 997–1003) cites "Milestones 1.3 and 1.6"; `### 1.3` and `### 1.6` exist.
  - SpecialFunctionsEiLiErfIncompleteGamma cites §5.1 and §5.3 by anchor and the names `differentiable_dawson`, `hasDerivAt_dawson`, all present. Its local `dawson` and `repeatedGaussianIntegral` (its `Suggested.lean` lines 104–110) have the same bodies under a different namespace, so there is no fully qualified clash and no convention mismatch.

**Ownership.**

- `roadmaps grep` over main and all 472 open heads found no other owner of: parabolic cylinder functions or Weber's equation, Dawson's integral, `Hh_n`, Kummer's equation or transformation for `𝐌`, 13.2.39, the Gamma residues at `−n`, `|Γ(1+iy)|²`, or Mellin–Barnes representations of `U` and `V`.
- RelativisticQuantumFieldTheory consumes Kummer's equation through QuantumFoundations §9.4, which consumes 1.3 here.
- SpecialFunctionsAiry uses Kummer's equation inside a proof route (its README lines 438–440) without owning it. Its review, not this one, should ask it to cite §1.3.
- AnalyticNumberTheoryPartII's Barnes G-function and ConformalMappingPartII share no object.
- No declaration of this `Suggested.lean` carries the fully qualified name of another roadmap's declaration.

**Library declarations opened at the pins.**

- **Mathlib 1b1ccf4:**
  - `RegularizedHypergeometric.lean`: `regularizedHGFunCoeff` (67), `_eq_zero_right` (82), `_add_one` (93, `∀ k ∈ b, k ≠ −n`), `regularizedHGFun` (192), `_zero` (195), `radius_regularizedHGFunSeries_eq_top` (249), `analyticOnNhd_regularizedHGFun_of_card_le` (282), `regularizedHGFun_zero_zero` (414).
  - `Bessel.lean`: `Complex.besselJ` (55).
  - `Gamma/Basic.lean`: `Complex.Gamma_add_one` (312), `Gamma_eq_integral` (319), `Gamma_neg_nat_eq_zero` (344), `Gamma_conj` (356).
  - `Gamma/Beta.lean`: `GammaSeq_tendsto_Gamma` (335), `Gamma_mul_Gamma_one_sub` (398), `differentiable_one_div_Gamma` (543), `Gamma_mul_Gamma_add_half` (580).
  - `Gamma/Deriv.lean`: `tendsto_self_mul_Gamma_nhds_zero` (100). This is the residue at 0 only; nothing at `−n` or for `|Γ(1+iy)|²` exists at either pin, so 6.6(a)–(b) duplicate nothing.
  - `Gamma/Digamma.lean`: `Complex.digamma` (48).
  - `GaussianIntegral.lean`: `Complex.Gamma_one_half_eq` (321), `integral_gaussian_complex` (236).
  - `MellinTransform.lean`: `Complex.VerticalIntegrable` (86). `MellinInversion.lean`: `mellinInv_mellin_eq` (92).
  - `ParametricIntegral.lean`: `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (569). `IntegralEqImproper.lean`: `integral_Ioi_mul_deriv_eq_deriv_mul` (1403). `Prod.lean`: `integral_integral_swap` (481).
  - `CauchyIntegral.lean`: `integral_boundary_rect_eq_zero_of_differentiableOn` (313), `DifferentiableOn.hasFPowerSeriesOnBall` (716). `LocallyUniformLimit.lean`: `TendstoLocallyUniformlyOn.differentiableOn` (136).
  - `Uniqueness.lean`: `eqOn_of_preconnected_of_eventuallyEq` (224).
  - `Hermite/Basic.lean`: `hermite` (48). `Hermite/Gaussian.lean`: `deriv_gaussian_eq_hermite_mul_gaussian` (38).
  - `IteratedDeriv/Defs.lean`: `iteratedDeriv_succ` (306). `Pochhammer.lean`: `ascPochhammer_succ_right` (117).
- **Tau Ceti 2fd255d:**
  - the six names of r2 R02 (above);
  - `TauCeti.hermiteFunction` (`Hermite/Function/Basic.lean` 36: `He_n(x√2)e^{−x²/2}/√(n!√π)`, matching 5.2);
  - `TauCeti.Real.erf`, `erfc` (`Erf.lean` 61, 64);
  - `Polynomial.derivative_hermite`, `hermite_add_two`, `hermite_aeval_neg` (`Hermite/Derivative.lean` 64, 85, 93).
- No pin has parabolic cylinder functions, Dawson's integral, `Hh_n`, Watson's lemma, an asymptotic-expansion API, or the derivative, equation or transformation of `₁F₁`.

**Seeded source sample** (cached DLMF texts):

- **1.1:** consumes Tau Ceti `Complex.hasSum_regularizedHGFun` (`a.card ≤ b.card`, 1 ≤ 1) and Mathlib `regularizedHGFun_zero` (value `C a b 0 = Γ(b)⁻¹`). Supported.
- **1.5:** `dlmf132` lines 278–280 (`𝐌` entire in `z`, `a`, `b`). Supported.
- **3.4:** `dlmf122` lines 534, 557. Checked at n = 0, 1 through the vanishing reciprocal-Gamma coefficient.
- **3.5:** `dlmf122` lines 596, 629, 663, 693, 728, 757. Every sign is as restated, with correlated `±`.
- **4.3:** `dlmf128` lines 308, 336, 363, 390.
- **5.2:** no DLMF locator. It is the bridge from 12.7.2 (`dlmf127` line 95) to Tau Ceti's definition. Supported.
- **6.4:** `dlmf125` lines 236–238 (`a ≠ ½, 3/2, …`, `−π < ph t < π`) and 274 (loop of Fig. 5.9.1). I recomputed the lips `(e^{−iπq} − e^{iπq})∫_r^∞` and the circle parametrization.
- **6.5:** `dlmf125` lines 280–282 and 316–318 (`c > 0`; `1/(i√(2π))` with `dt = i dy`; `1/(2π)` for `V`).
- **7.1:** `dlmf129` lines 76–78; rotation `dlmf24` lines 120–127.
- **7.2:** `dlmf129` lines 117–119.
- **7.4:** no locator of its own. It is 12.9.1–12.9.2 at N = 1, as its *Needs* says; checked numerically.
- **8.1:** `dlmf1212` lines 47–49, 76–78, 106–108, 148–150. The square root in 12.12.4 is confirmed by the value 1 at `a = −½`, `z = 0`.
- **9.1:** `dlmf1214` lines 115, 142, 169, 515.
- **9.4:** `dlmf1214` lines 546, 576, 608–612, 641–651.
- **9.5:** `dlmf1214` lines 805, 838. The README states less than the source (R03).
- **Also checked:**
  - 12.9.3–12.9.4 (`dlmf129` lines 158–160, 193–195);
  - 12.13.1–12.13.5 (`dlmf1213` lines 70–180; `binom(−a−½, m) = (−1)^m(½+a)_m/m!`);
  - 12.14.13–12.14.23 (`dlmf1214` lines 728, 758, 890–1079). "d/dx W(0, ±x)" in 12.14.14 is the derivative of the composite, as README 9.6 reads it: as `x → 0+` the right side tends to `−ε√π/Γ(¼)`, and `W′(0,0) = −√π/Γ(¼)`.
- **Already settled last round** (taken as data): Layers 1–2 (13.2.1, 13.3.15, 13.2.39, 12.4.3–12.4.6, 12.7.12–12.7.13) and 5.4.3, 5.8.3, 7.6.2.

**Adversarial table.** Unless stated, `z = 0.7−0.4i` and `a = 0.3+0.2i`. Residuals are absolute differences between the two sides.

| Statement | Instances | Values (left / right) | Result |
|---|---|---|---|
| 12.2.6 `parabolicCylinderU_zero_right` | `a`; `−3/2`; `−½` | `1.269072498+0.007167538i` / same; `0 / 0` (`Γ(0)⁻¹`); `1 / 1` | holds |
| Check `U′(½,0) = −1` | numerical derivative | `−1.0000000000` | holds; the opposite sign gives `+1` |
| 12.2.10–12.2.12 | `a`, `z` | `0.7978845608` / `√(2/π)`; `2.212761652+0.419333046i` both; upper `0.6946542388−0.2257068443i` both (sign-flipped model `−0.6947+0.2257i`); lower `1.302098867+0.4230775683i` both | holds |
| 3.5 (12.2.15–12.2.20 and the two reciprocal forms) | `a ∈ {a, ±½, ±3/2}`, `ε = ±1` | residuals ≤ 1.2e-14; 12.2.17 at `a = −½`, `−3/2`: left `\|·\| = 2.378`, `1.560`, right `0` | holds; `ha` is necessary |
| 3.4 | n = 0, 1 | `Γ(−n/2)⁻¹` or `Γ(½−n/2)⁻¹` vanishes, leaving `u₁` (even) or `u₂` (odd) | holds |
| 3.6 | `α = 0.7+0.2i`, `β = −0.3+0.5i`, `γ = 0.4−0.1i` | residual 2.0e-9 with `s⁴ = −4α`; 1.35 with `s² = −4α` | holds; hypothesis right |
| 12.8.1, 12.8.2, 12.8.9 (m = 2) | `a ∈ {a, −½, −2}` | ≤ 1.2e-9 | holds |
| 12.7.1–12.7.4 | n = 0..4 | ≤ 8.3e-15; `V(−½,z) = 0.5547701064−0.2864202012i` both | holds |
| Check `F(iy)` | y = 0.8 | `1.247258307i` both | holds |
| 12.7.7, `Hh_n(0)` | n = 0..3 | ≤ 2.3e-15; `Hh_n(0) = 1.2533141, 1, 0.6266571, 0.3333333` both | holds |
| 12.7.5 | x = 0.9 | `0.5649295345` both | holds |
| 5.2 | n = 3, x = 0.6 | `−0.4955243438` both; `Im D_3(√2x) = −4e-16` | holds |
| 12.5.1–12.5.4 | `a ∈ {0.3+0.2i, −0.3+0.5i, 1.7}`; `Re z > 0` cases; `a ∈ {0.2+0.3i, −1.3, −½}` | ≤ 2.4e-5 (endpoint quadrature) | holds |
| 12.5.5 loop, r = 1 | `a ∈ {0.2+0.3i, −1.3}` | ≤ 1.1e-15 | holds; orientation pinned |
| 12.5.6–12.5.7, c = 0.7 | `a ∈ {0.2+0.3i, −1.3, 2.4}` | ≤ 1.3e-15 | holds |
| 12.5.8 residue-corrected | (a, z, c, poles) = (0.6+0.2i, 0.8+0.5i, 0.9, 1), (−1.3+0.2i, ·, 0.45, 2), (−2.7, 0.7−0.6i, 0.2, 3) | 3.0e-13, 3.7e-14, 1.1e-15; with `+Σ` in place of `−Σ` the error is 2.27 | holds; sign pinned |
| 12.5.8 near the edge | `arg z = 2.16`, `−2.14` (κ = 0.39, 0.49) | 6.0e-14, 3.2e-14 | holds |
| 12.5.9 corrected | (−0.6+0.2i, c 0.3, 0.8), (1.3+0.2i, 2 poles), (2.6, 3 poles) | ≤ 1.8e-7 | holds |
| 6.6(b) | n = 0..3; affine n = 0..2 at A = 0.3+0.4i | `1, −1, ½, −⅙`; `−½, ½, −¼` | holds |
| 6.6(c) Check, A = 1 | z = 0.8+0.5i | `−1.00265−0.62666i` / `−√(π/2)z` | holds |
| 5.8.3 product | x = 1.3, −1.5, −0.25; y = 0.7 | `1.673166906`, `16.451369461`, `23.701563554` both | holds (R06 repaired); unused (R02) |
| `\|Γ(1+iy)\|²` | y = 0.7, −2; y = 0 | `0.4938431207`, `0.0234670593` both; at y = 0 the Lean right side is `0/0 = 0`, true value 1 | `hy` needed |
| 7.1 rotated integral | (z, θ) = (0.7−0.4i, 0.5), (−1.2+0.8i, −0.6), (2+i, 0.3) | ≤ 9.4e-8 | holds |
| 12.9.1, N = 2: `\|rem\|·r⁴` | arg 0, 1.2 at r = 4, 6, 8; arg 2.1 at r = 4..12 | 1.58→1.86; 2.32→2.09; 19.7, 2.48, 2.07, 2.04, 2.03 (Stokes term ·r⁴: 5.1, 0.19, 6e-4) | holds |
| 12.9.2, N = 2 | arg 0, 0.5 | 0.42→0.32 | holds |
| 12.9.3 in log coordinates | σ = ±1, Im w = ±π, ±3.5 | ratio to the envelope 0.4–1.8, bounded; with the principal log in place of `w` at ±3.5: 3.6e3→1.8e4, 296→1.5e3 | holds; convention needed |
| 12.9.4 | Im w = 0.9, ±2 | 0.53–2.07, decreasing | holds |
| 7.4 | x = 4, 6, 8 | U ratio 0.962, 0.982, 0.989; V ratio 1.007, 1.003, 1.002 | holds |
| 12.12.1 | (a, μ) = (a, 1.4+0.3i), (−1.7+0.1i, 0.6−0.2i), (−½, 2) | `0.7861865371−0.1763596102i` both; `0.6798290722+0.0482583742i` both; `1 / 1` | holds |
| 12.12.2 (R01) | a = −0.9+0.2i, −1.5, −2.3 | `1.351534805+0.913787589i` / `1.351534766+0.913787586i`; `0.5 / 0.5`; `0.0780789765` both | holds |
| 12.12.3 | (−0.2+0.1i, 0.8), (0.3, 1.5), (−1.2, 0.5) | `1.753331893+0.32181128i` both; `2.4691173842 / 2.4691173844`; `0.9214923223` both | holds |
| 12.12.4 | (0.2+0.1i, 0.6+0.3i), (−1.1, 1.2), (−½, 0) | `5.393251343+4.83162674i` both; `0.7516780306` both; `1 / 1` | holds |
| 12.13.1 | x = 0.6+0.2i, y = 0.5−0.3i | `0.5144502366−0.0068118059i` both | holds |
| 12.13.5 | (a, x, y, t) = (−0.8+0.1i, 0.6, −0.4, 0.5), (−1.5, 0.3, 0.9, 0.3), (−2.5, −0.7, 0.4, 0.6), (−½, 0.4, 0.2, 0.7) | left = README form: `0.8659137548+0.0483133442i`, `0.5119594338`, `−0.8494755959`, `0.9538407962`; DLMF display: `0.90108869+0.03848041i`, `0.53589436`, `−1.24706685`, `0.95384080` | README right; display wrong unless a = −½ |
| 9.1–9.2 | a = 0.3, −1.1, 0; x = 1.1 | `Im` of complex expression ≤ 3.7e-16; ODE residual ≤ 5.2e-10; `−2W₀W₁ = 1.000000000000`; Wronskian `0.99999999999` | holds |
| 12.14.4 and φ₂ | a = 0.3, −1.1 | `0.5001012720` both; `−0.3275942332` both; `ρ = π/8 − φ₂/2` gives `0.2720`, `0.5014` | holds; sign pinned |
| φ₂ Checks | φ₂′(0); parity | `−1.963507` / `−γ − 2 log 2 = −1.963510`; `φ₂(−0.7) + φ₂(0.7) = 0` | holds |
| 9.4 | a = 0.3, x = 1.1 | `w₁ = 1.154128793319` both; `w₂ = 1.146977995301` both | holds |
| 9.5 second form (R03) | a = 0.3, x = 1.1 | the forms differ by 2.2e-16 | source content holds |
| 12.14.13–12.14.14 | x = 0.9, 1.7; ε = ±1 | `W(0, 0.9) = 0.5724433628` both; `d/dx W(0,−x)` at 0.9: `0.4071361509` both | holds |
| 12.14.23, `\|s − S_N\| x^{2N}` | a = 0.3, −0.6; N = 1, 2; x = 4, 5, 6 | 0.448, 0.449, 0.449; 0.961, 0.981, 0.987; 0.587→0.613; 1.30→1.39 | holds |
| V Check (R04) | sign of the `u₂` term flipped | `V(½,z)` unchanged (1.3e-15); `V′(−½,0) = −0.7979` vs `+0.7979` | not discriminating |
| 12.7.1 (R05) | `simpa … using parabolicCylinderD_natCast 0 z` | closes; against `exp (z²/4)` it fails | padding |
| Layer 1 Examples | a = b at a = 0, −1; `𝐌(−1, 0, z)`; Kummer at a = −1 | `aΓ(a+1)⁻¹ = Γ(a)⁻¹` (0 = 0); `−z`; `Γ(b)⁻¹ − bΓ(b+1)⁻¹ = 0` | consistent |
| Layer 7 Examples | a = −3/2; 7.4 at a = −½ | `G ≡ 1`, `(−1)_{2s} = 0`; `F(t) ∼ 1/(2t)` | consistent |

**Conventions pinned by a witness:**

- the argument order `(a, z)`;
- reciprocal Gamma, zero at the poles (12.2.6 at `−3/2`, 12.2.17 reciprocal forms at `a = ∓½`);
- principal powers, with logarithmic coordinates past `±π` (12.9.3 rows);
- `dt = i dy` absorbed into the prefactors (12.5.6, 12.5.8, the residue sign);
- probabilists' `He_n` (`D₂ = (z² − 1)e^{−z²/4}`);
- the correlated `ε` signs (3.5 rows);
- the sign of φ₂ (12.14.4 row);
- the composite-derivative reading of 12.14.14.

## Not verifiable

- Olver (1974), Temme (1996), Whittaker–Watson, Miller (1955): print texts, not read. Every statement the README attributes to them is also in the DLMF sections read above.
- `lean-DLMF`: not opened. It is secondary provenance, and no claim rests on it.
- Ownership against open pull requests was checked through the roadmap index (472 heads, 2026-11-07T22:38:51Z) and the sibling checkouts named in the brief.

## Source issues

- **Error** in dlmf1213 at 12.13.5 (§12.13(i), web page): the source displays the rotational addition theorem with no factor `(cos t)^{−a−½}` before the sum; it should carry that factor, since at `a = −5/2`, `x = −0.7`, `y = 0.4`, `t = 0.6` the displayed side is `−1.2471` against `−0.8495`; affects a stated result.
