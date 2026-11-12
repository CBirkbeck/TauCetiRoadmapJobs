# Review of SpecialFunctionsOrthogonalPolynomialsGeneral (pull request #2192 at 018e250)

**Verdict:** needs changes

## R01 (P2) — 10.3 narrows DLMF's monotonic-weight theorem to bounded intervals

**Location:** `TauCetiRoadmap/SpecialFunctionsOrthogonalPolynomialsGeneral/README.md` lines 986–989: "let `a < b` be finite and `w ≥ 0` nondecreasing on `[a, b]`"; `Suggested.lean` lines 619–627 (`Set.Icc a b`, `a b : ℝ`).
**Claim:** Scope (line 80) claims ownership of "the monotonic-weight statement of §18.2(xii)". DLMF requires only `b < ∞`, and its own example, DLMF 18.14.8 (Laguerre on `[0, ∞)`), is a half-line case. Neither 10.3 nor its mirror sentence covers it.
**Witness:** DLMF182 lines 3093–3101 assume only `b < ∞` and `w` nondecreasing, and name 18.14.3_5 and 18.14.8 at `α = 0` as special cases. DLMF1814 lines 392–396: `e^{−x/2} |L_n(x)| ≤ L_n(0)` for `0 ≤ x < ∞`.
**Repair:** README 10.3: "let `b` be finite, `I` an interval with greatest point `b` (`I = [a, b]` or `I = (−∞, b]`) and `w ≥ 0` nondecreasing on `I`, giving an orthogonality measure `w(x) dx` on `I`. For every orthogonal system, `√w(x) |p_n(x)| ≤ √w(b) |p_n(b)|` for `x ∈ I`. The mirror statement holds for nonincreasing `w` on an interval with least point `a`." Add the Check "`w = e^{−x}` on `[0, ∞)` (mirror): `e^{−x/2} |L_n(x)| ≤ 1`, DLMF 18.14.8 at `α = 0`." Lean (elaborates at the pins):
```lean
theorem sqrt_weight_mul_abs_le {s : Set ℝ} (hs : s.OrdConnected) {b : ℝ} (hb : IsGreatest s b)
    {w : ℝ → ℝ} (hw : MonotoneOn w s) (hw0 : ∀ x ∈ s, 0 ≤ w x) (hwm : Measurable w)
    (hμ : IsOrthogonalityMeasure ((volume.restrict s).withDensity fun x => ENNReal.ofReal (w x)))
    {p : ℕ → ℝ[X]}
    (hp : IsOrthogonal ((volume.restrict s).withDensity fun x => ENNReal.ofReal (w x)) p)
    (n : ℕ) {x : ℝ} (hx : x ∈ s) :
    Real.sqrt (w x) * |(p n).eval x| ≤ Real.sqrt (w b) * |(p n).eval b|
```

## R02 (P2) — The Hankel determinant of a sequence is owned by ClassicalArithmeticCompletion §6.21 on main and is defined again here

**Location:** README.md line 705: "Define `hankelDet m n = Δ_n` and `hankelDet' m n = Δ′_n` for a sequence `m`"; lines 157–158 (Conventions); route lines 715–717; `Suggested.lean` lines 438–440.
**Claim:** A roadmap on main already owns the determinant of the Hankel matrix of a sequence over a commutative ring, with the monic-basis-change invariance that 7.1's route (`Δ_n = ∏ h_k`) needs. Two owners of one carrier, and README line 37 says the roadmap consumes no other roadmap.
**Witness:** `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md` on main, line 12093: `D_n(a) = det(a_(i+j+1))_{i,j<n}`, `D₀ = 1`; line 12104: "invariance under monic basis change … of the moment matrix".
**Repair:** In Scope, "What it does not own", add: "The Hankel determinant of a sequence over a commutative ring and its invariance under a monic change of basis (ClassicalArithmeticCompletion §6.21, with the shifted entries `a_(i+j+1)`); here `hankelDet m n` is that determinant for `a_(k+1) = m_k`, DLMF's unshifted `Δ_n` (18.2.27)." Add "ClassicalArithmeticCompletion §6.21" to 7.1's *Needs:* and to the supplier contracts, and change line 37 to "It consumes ClassicalArithmeticCompletion §6.21." The `hankelDet` docstring in `Suggested.lean` gets the same clause.

## R03 (P3) — `associated_roots_mem_Ioo` carries a variable and a hypothesis that constrain nothing

**Location:** `Suggested.lean` lines 524–526: "`{k j N : ℕ} (hkj : k + j ≤ N)`"; README.md line 857: "for `μ` concentrated on `[a, b]` and `k + j ≤ N`".
**Claim:** `N` occurs nowhere else in the statement. So `hkj` holds with `N := k + j` and the hypothesis is empty. `N` belongs to the route (the size of `J_N`), not to the statement.
**Witness:** Instantiating `N := k + j` discharges `hkj` by `le_rfl` for every `k`, `j`. The conclusion `x.im = 0 ∧ x.re ∈ Ioo a b` does not mention `N`.
**Repair:** Lean: `(hab : ∀ᵐ x ∂μ, x ∈ Set.Icc a b) (k j : ℕ) {x : ℂ} (hx : …) :` without `N` and `hkj` (elaborates). README: "for `μ` concentrated on `[a, b]` and all `k`, `j`, the zeros of `q_j^{(k)}` … are real and lie in `(a, b)`: with `N = k + j`, they are the eigenvalues of …".

## R04 (P3) — README and Lean disagree on three targets

**Location:** README.md lines 634–635 (5.6, "or `y ≤ x` for `μ`-a.e. `x`") vs `Suggested.lean` line 396; README line 799 (8.4, "`0 < β_{n+1} ≤ B²`") vs line 489 (`hB : 0 ≤ B`); README line 819 (8.5, "`𝕜 = ℝ, ℂ`") vs lines 503–506 (`Lp ℝ 2 μ`).
**Claim:** The Lean statements of 5.6 and 8.5 are narrower than the README's. The README's 8.4 omits `B ≥ 0`, which the Lean carries, and without it the README statement is false.
**Witness:** 8.4 with `α = 0`, `β = 1/4`, `A = 0`, `B = −1`: `β ≤ B² = 1`, yet `[−(A + 2B), A + 2B] = [2, −2]` is empty. DLMF182 line 1550: kernel polynomials for `y ∉ (a, b)`, both sides.
**Repair:** README 8.4: "if `|α_n| ≤ A`, `B ≥ 0` and `0 < β_{n+1} ≤ B²`". Lean 5.6: `(hy : (∀ᵐ x ∂μ, x ≤ y) ∨ ∀ᵐ x ∂μ, y ≤ x)`. Lean 8.5: `{𝕜 : Type*} [RCLike 𝕜] … (f : Lp 𝕜 2 μ) : ∃ g : ℕ → Lp 𝕜 2 μ, (∀ n, (g n : ℝ → 𝕜) =ᵐ[μ] fun x => algebraMap ℝ 𝕜 ((orthonormal μ n).eval x)) ∧ HasSum (fun n => (∫ x, algebraMap ℝ 𝕜 ((orthonormal μ n).eval x) * (f : ℝ → 𝕜) x ∂μ) • g n) f`. Both elaborate at the pins.

## R05 (P3) — The first Check of 4.3 is false outside `[−1, 1]`

**Location:** README.md lines 532–533: "`|P_n| ≤ 1` and `h_n = 2/(2n + 1)` give the hypothesis for every `|z| < 1`."
**Claim:** `integral_poissonKernel_mul` quantifies over every real `x`, and `|P_n(x)| ≤ 1` holds only on `[−1, 1]`. Outside that interval the hypothesis fails for some `|z| < 1`.
**Witness:** `x = 2`, `z = 0.9`, `m = 0`: the `n`-th term is at least `0.9ⁿ |P_n(2)|`, and `|P_40(2)| = 6.97·10²¹`, `|P_n(2)|^{1/n} → 2 + √3`. Since `0.9(2 + √3) > 1`, the series diverges.
**Repair:** "… give the hypothesis for `x ∈ [−1, 1]` and every `|z| < 1`; for `|x| > 1` it needs `|z| (|x| + √(x² − 1)) < 1`."

## R06 (P3) — `moment` restates Mathlib's `ProbabilityTheory.moment`

**Location:** `Suggested.lean` lines 90–92: "`def moment (μ : Measure ℝ) (n : ℕ) : ℝ := ∫ x, x ^ n ∂μ`"; README.md line 304.
**Claim:** The pinned Mathlib defines the moments of a measure. The roadmap's definition is that one with `X = id`.
**Witness:** `Mathlib/Probability/Moments/Basic.lean` line 56: `moment X p μ := μ[X ^ p]`. On a probe copy, `moment μ n = ProbabilityTheory.moment id n μ` closes by `rfl`.
**Repair:** Delete `def moment`. Write `ProbabilityTheory.moment id k μ` in `hankelDet_pos`, `normSq_monic_eq`, `eval_monic_eq_det`, `alpha_beta_eq_hankel`, `exists_measure_iff_hankelDet_pos`, `aeval_associated`, `convs'_jFraction` and `markov` (tested on `hankelDet_pos`). README 2.1: "the moments `ProbabilityTheory.moment id n μ = ∫ xⁿ dμ` (Mathlib)". Add the name to "From Mathlib".

## R07 (P3) — Theorems without a locator (R12 of the previous review, not repaired)

**Location:** README.md 8.1 (lines 743–751), 8.3 (lines 783–784), 8.4 first two bullets (lines 797–802), 9.1 Casoratian and `associated_roots_mem_Ioo` (lines 854–862), 1.1 targets (lines 249–261), 5.3 (lines 595–597), 10.2 ("See Rota, Kahaner and Odlyzko (1973)", line 971).
**Claim:** These targets have no theorem or page locator at the claim. 9.3 attributes locally uniform convergence to DLMF 18.2.38, which states only a pointwise limit.
**Witness:** 8.3 cites no source at all. DLMF182 lines 2591–2595: 18.2.38 is `lim F_n(z)` for `z ∈ ℂ \ [a, b]`, with no uniformity. DLMF182 lines 1731–1732 state both claims of 5.3.
**Repair:** 8.3: "(Simon 1998, Theorem 1, p. 4; arXiv math-ph/9906008)". 5.3: "(DLMF §18.2(vi))". 9.1 Casoratian: "(Simon 1998, (2.8)–(2.11), pp. 20–21, in orthonormal form)". 9.3: "DLMF 18.2.38 (pointwise); the locally uniform form follows by the route". For 8.1, 8.4, 1.1 and 10.2, add a theorem-number locator read against a legal text, and add Simon (1998) to the References.

## R08 (P3) — Three definitions still have two Checks (R11 of the previous review, partly repaired)

**Location:** README.md 1.1 Checks (lines 267–269, `bwdDiff`), 2.1 Checks (lines 322–326, `IsOrthogonalityMeasure`, `moment`, `pairing`), 2.2 Checks (lines 341–343, `monic`).
**Claim:** Each definition needs at least three Checks, one of which excludes a plausible wrong definition. These have two, and the 2.2 Checks are only computed values.
**Witness:** 1.1 lists `∇²` and the two Pochhammer differences, and nothing separates `∇` from `Δ`. 2.2 lists Lebesgue and `δ₀ + δ₁` values only.
**Repair:** 1.1: "`∇ x² = 2x − 1`, while `Δ x² = 2x + 1`: the shift direction is fixed." 2.1: "The Cauchy measure `dx/(π(1 + x²))` has infinite support but `x²` is not integrable, so it is not an orthogonality measure." 2.2: "Gram–Schmidt without the division by `⟨monic μ k, monic μ k⟩` gives `X² − 2/3` for Lebesgue measure on `[−1, 1]`, with `∫ (x² − 2/3) dx = −2/3 ≠ 0`."

## R09 (P3) — 9.3's route re-derives a pinned Tau Ceti theorem

**Location:** README.md lines 901–906: "so they converge weakly to `μ` (Weierstrass, Mathlib `polynomialFunctions_closure_eq_top`)".
**Claim:** The pinned Tau Ceti proves that probability measures whose moments converge to those of a compactly supported limit converge weakly to it. Applied to the normalized Gauss measures, that is exactly this step. It is absent from 9.3's *Needs:* line and from the Tau Ceti contracts.
**Witness:** `TauCeti/Probability/Moments/WeakConvergence.lean` line 139: `MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_integral_pow` (compact `K`, `μ Kᶜ = 0`, eventually integrable monomials, moment convergence ⇒ `Tendsto μs l (𝓝 μ)`).
**Repair:** Replace the parenthesis by "(Tau Ceti `MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_integral_pow` applied to `μ₀⁻¹ gaussMeasure μ n` and `μ₀⁻¹ μ`)". Put this name in 9.3's *Needs:* line, and add the file to "From Tau Ceti".

## R10 (P3) — Pull-request numbers and a changeable status in the README

**Location:** README.md lines 1057–1059: "Closed, unmerged Mathlib pull requests are prior art: #38496 (…), #38485 (…), and #39498 (…)."
**Claim:** The README must not cite pull requests by number or record their status, which can change.
**Witness:** The same three numbers appear in the description, which is where process information belongs.
**Repair:** Delete the paragraph. The `lean-DLMF` provenance map stays.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `bwdDiff_iter_eq_sum`, `fwdDiff_descPochhammer`, `bwdDiff_ascPochhammer`, `sum_range_mul_fwdDiff` (sample) | `n = 2`; `k = 1`, general `k`; general `N` | `f(x) − 2f(x−h) + f(x−2h)` both; `Δ(x²−x) = 2x`; factors `(x+1)−(x−k) = k+1`, `(x+k)−(x−1)`; summands telescope to `f(N+1)g(N+1) − f(0)g(0)` | holds; DLMF181 lines 146–160 match the definitions | R07, R08 |
| 1.2 `imCentralDiff_natDegree_leadingCoeff`, `imCentralDiff_map_real` | `x`, `x²`, `x³`, `1` | `1`, `2x`, `3x² − 1/4`, `0`; odd powers of `i/2` divided by `i` are real; DLMF181 line 164 `(f(x+i/2) − f(x−i/2))/i` | holds | none |
| 2.1 orthogonality measures (sample) | `δ₀ + δ₁`; Charlier `a = 1`; Lebesgue on `[−1, 1]` | `X(X−1)` has pairing `0` on two points; DLMF182 lines 169–171 (18.2.1_5), 322 (18.2.4), 368–374 (18.2.4_5) match the hypotheses | holds | R06, R08 |
| 2.2 `monic_monic`, `pairing_monic_eq_zero`, `eq_monic`, `eval_monic_eq_zero_of_mem_support` | `μ = 0`, `n = 1`; Lebesgue; `δ₀ + δ₁`, `N = 1` | `X`; `X² − 1/3`, `X³ − 3X/5`; Gram–Schmidt `c₀ = 1/2`, `c₁ = 1` gives `X² − X`, zero at `0, 1` | holds | R08 |
| 2.3 `isOrthogonal_iff`, `orthonormal_spec`, `eq_sum_pairing` | Legendre `P₂`; `q = 0` | `h₂ = 2/5`, `k₂ = 3/2`, `k̃̃₂ = −1/2`; `orthonormal μ 1 = √(3/2) X`; `q = 0` gives sum `0` | holds | none |
| 3.2 `X_mul_eq_recurrence`, `recB_eq_coeff`, `sum_recB`, `recA_mul_recC_pos` | weight `eˣ` on `[0, 1]`; coefficient of `xⁿ⁻¹` | `b₀ = 0.5819767069 = −k̃₁/k₁`; `c_n h_{n−1} = a_{n−1} h_n`; DLMF 1.2.8 still prints `+` (DLMF182 line 983) | corrected sign holds | none |
| 3.3 first form (sample) | Legendre `n = 1` | `A₁ = 3/2`, `C₁ = 1/2 = (A₁/A₀)(h₁/h₀) = (3/2)(1/3)`; `A₀A₁C₁ = 3/4 > 0`; DLMF182 lines 805–811, 887–889 | holds | none |
| 3.4 `monic_eq_monicThreeTerm`, `X_mul_orthonormal`, `orthonormal_eq_gramSchmidtNormed` | Lebesgue (exact); `eˣ` on `[0, 1]` | `β₁ = 1/3`, `β₂ = 4/15`; `α₁ = 0.4848434409`, `β₁ = 0.0793264058` by Gram–Schmidt and by 18.2.30 | holds | none |
| 3.5 `charpoly_jacobiMatrix` (sample) | `n = 1, 2`; transpose | `X − b₀`; `(X−b₀)(X−b₁) − a₀c₁`; Lean entries match DLMF182 line 1742; transpose needs `c₁ = a₀` | holds | none |
| 4.1 `cdKernel_eq`, `cdKernel_self` | monic Legendre `n = 3`, `x = 0.3`, `y = −0.7`; Legendre `n = 1` | `−91887/320000 = −0.287146875` on both sides (exact); `(1 + 3xy)/2` both | holds | none |
| 4.2 kernel property (sample) | `n = 0`; DLMF182 line 1450 | `K₀ = 1/μ(ℝ)`, projection is the mean; both DLMF cases are stated, with `f ∈ L²` | holds | none |
| 4.3 `integral_poissonKernel_mul` (sample) | Mehler at `(0.3, −0.7, 0.4)`; Legendre `x = 2`, `z = 0.9` | `0.9342031102` by series and closed form; `|P_n(2)|^{1/n} → 3.732`, so the terms diverge | theorem holds; Check false off `[−1, 1]` | R05 |
| 5.1 `zeros_spec`, `zeros_mem_Ioo` (sample) | Lebesgue `n = 2`; `eˣ` `n = 1`; `δ₀ + δ₁` | `±1/√3`; `0.5819767069 ∈ (0, 1)`; zeros `0, 1` on the support (negative control); DLMF182 lines 1712, 1729–1730 | holds | none |
| 5.2 `gauss_quadrature`, `christoffelNumber_eq` | `eˣ` on `[0, 1]`, `n = 4` | weights `0.2069535163, 0.4811710821, 0.6261768038, 0.4039804260` by 18.2.37 and `1/K₃`; `x⁷`: `0.3054900369` both; `x⁸`: `0.2743615` vs `0.2743242` | holds | none |
| 5.3 `zeros_interlace`, `exists_zero_between` (sample) | Legendre `P₂`, `P₃` | `−0.7746 < −0.5774 < 0 < 0.5774 < 0.7746`; DLMF182 lines 1731–1732 state both claims | holds | R07 |
| 5.4 Jacobi matrix and zeros (sample) | Lebesgue `n = 2` | `J₂ = ((0, 1/√3), (1/√3, 0))`, eigenvalues `±1/√3` = roots of `X² − 1/3`; DLMF182 line 1761 | holds | none |
| 5.5 `discr_eq_prod`, `discr_pos` | `He₂…He₅`; `n = 0, 1` | `4, 108, 27648, 86400000 = ∏ jʲ`; Mathlib cubic formula gives `108`; `discr_C`, `discr_of_degree_eq_one` give `1 = c⁰` | holds | none |
| 5.6 `isOrthogonal_kernelPolynomial`, `kernelPolynomial_mul_sub` | Lebesgue `y = 1`, `y = 0` | `(y − x) q_m` has degree `≤ n` and vanishes at `y`; `q₁(·; 0) = 1/2`, degree `0` (control) | holds; Lean one-sided | R04 |
| 6.1 `monic_comp_neg`, `monic_even_odd`, `monic_even_odd_two_sq_sub_one` | Lebesgue; `n = 0, 1`; `He₂` | `r₁ = X − 1/3`, `s₁ = X − 3/5`; `μ.map(2x²−1)` has mean `−1/3`, `r = (X + 1/3)/2`, `r(2X²−1) = X² − 1/3`; `(−2)L₁^{(−1/2)}(x²/2) = x² − 1` | holds | none |
| 7.1 `hankelDet_pos`, `normSq_monic_eq`, `eval_monic_eq_det`, `alpha_beta_eq_hankel` (sample) | `eˣ` on `[0, 1]`; `δ₀ + δ₁`; `Δ′` at `n = 1, 2` | `h = 1.7182818285, 0.1363051216, 0.0091483494` both ways; 18.2.29 at `0.37`: `0.02123648015763` both; `Δ = 2, 1, 0`; Lean `Δ′` = DLMF182 line 2194 | holds | R02, R06 |
| 8.1 functional of a recurrence (sample) | `α = 0`, `β = 1/4` | semicircle moments `1, 1/4, 1/8`: `∫ p₂² = 1/8 − 1/8 + 1/16 = 1/16 = β₁β₂` | holds; no locator | R07 |
| 8.2 `favard` (sample) | four formula pairs | DLMF182 lines 2015–2023 list the pairs as in README; lines 727–728 cite Chihara p. 21, Szegő §3.2 under §18.2(iv) | holds | none |
| 8.3 `exists_measure_iff_hankelDet_pos` | `m = 0`; Gaussian; two points | `Δ₁ = 0` and only `μ = 0` fits (both sides false); `Δ₃ = 2`; `Δ₃ = 0`; Simon1998 line 162 states it | holds | R07 |
| 8.4 `favard_bounded`, `eq_smul_of_monic_eq` | `β = 1/4`; `B = −1` | Gershgorin `|α_k| + √β_k + √β_{k+1} ≤ A + 2B = 1`; `B = −1` gives empty interval in README form | Lean holds; README misses `B ≥ 0` | R04 |
| 8.5 `hasSum_orthonormal_expansion` (sample) | Tau Ceti contract; DLMF 18.2.24 | `orthogonal_span_range_bareNormalizedLp_eq_bot` is `𝕜`-general with the same `hexp`; DLMF uses `|λ_n|²` | holds over `ℝ`; narrower than README | R04 |
| 9.1 `aeval_associated`, `associated_roots_mem_Ioo`, Casoratian | `eˣ`, `z = 2 + i/2`, `n = 0…3`; `n = 1` | `1`, `1.5151565591 + 0.5i`, `1.9594318163 + 1.5088367876i`, `2.0888262172 + 3.2120185151i` both sides; `W_n = β_n W_{n−1}`, `W₁ = β₁` | holds; `N` empty | R03, R07 |
| 9.2 `convs'_jFraction` (sample) | `eˣ`, `z = 2 + i/2`, `n + 1 = 4` | `0.6389990416 − 0.2410064077i` by `convs'` tail evaluation, `p₃^{(1)}/p₄` and `μ₀⁻¹ Σ wᵢ/(z − xᵢ)`; DLMF182 line 2520 | holds | none |
| 9.3 `markov` (sample) | `eˣ`, `z = 2 + i/2`; Lebesgue `z = 2` | limit `0.6389985876 − 0.2410064428i`; `F₁ = 1/2`, `F₂ = 6/11`, limit `½ log 3 = 0.5493061443`; `resolvent a x = (x − a)⁻¹` | holds | R07, R09 |
| 10.1 `structure_relation`, `lowering_raising` | Jacobi Pearson; Laguerre `α = 1/2`; Freud `e^{−x⁴}` | `(πw)′ = w((b−a) − (a+b+2)x)`; `x p₄′ = 4p₄ + 18p₃`; `p₅′ = 5p₄ + 0.7553715733 p₂ = 5p₄ + 4β₃β₄β₅ p₂`, other coefficients `0` | holds | none |
| 10.2 `isSheffer_iff`, `isSheffer_bernoulli`, `not_isOrthogonal_bernoulli` | `B₀…B₄`; Mathlib `bernoulli` | forced `α = 1/2`, `β = 1/12, 1/6, 1/4`; constant term `−1/24 ≠ B₄(0) = −1/30`; `f = t/(eᵗ − 1)` with `B₁ = −1/2` | holds | R07 |
| 10.3 `sqrt_weight_mul_abs_le` | `eˣ` `[0,1]`, `(1+x)²` `[−1,1]`, `√(x+0.1)` `[0,2]`, `n = 1…5`; Laguerre | maximum at `b` in all 15 cases (grid `2·10⁴`); DLMF allows `a = −∞` (18.14.8) | holds; too narrow | R01 |

- Previous review: R01–R10, R13 and R14 repaired. Passages checked: README lines 102–106 (R01), 645–647 (R02), 672–675 (R06), 867–868 (R07), 931–932 and 173–176 (R08), 1038–1039 (R09), 878–880 and 213–215 (R10); `Suggested.lean` lines 10–14 with `## Layer` comments (R03), the four padding declarations deleted (R04), lines 145–146 (R05), 94 of 94 docstrings (R13); the description's "62 theorems, with the 32 definitions" (R14). R11 is partly repaired (R08 here) and R12 is not repaired (R07 here).
- Source locators checked against the text: DLMF §18.1(i) (3 definitions); all 60 distinct DLMF 18.2.x labels the README cites exist in Release 1.2.8; the statements of §18.2(iv) Remarks, (vi), (vii), (viii), (x) and (xii); DLMF 3.5.18, 18.14.3_5 and 18.14.8; Simon (1998) Theorem 1.
- Library declarations opened at the pins: Mathlib `ForwardDiff.lean` 137, 165, 275; `Resultant/Basic.lean` 934–1014; `ResolventTransform.lean` 108; `Spectrum/Basic.lean` 80; `Measure/Support.lean` 59; `Moments/Basic.lean` 56; `ContinuedFractions/Basic.lean` 328–339; `Analysis/Matrix/Spectrum.lean` 157, 161; `Gershgorin.lean` 30; `Weierstrass.lean` 55; `GramSchmidtOrtho.lean` 238; `Substitution.lean` 567, 589; `Polynomial/Sequence.lean` 199; `ChebyshevGauss.lean` 109. Tau Ceti: `PolynomialCompleteness.lean` 51, 165; `WeightedOrthogonalBasis.lean` 193, 225; `Determinacy.lean` 246; `Hermite/GeneratingFunction.lean` 80; `Gaussian/Hermite/Basis.lean` 138; `WeakConvergence.lean` 139; `ResolventTransform/` (4 files).
- Cross-roadmap citations resolved: RandomMatrices §8.2 (main, line 1160) owns the weight case, which this roadmap cites and generalizes. Overlap check: read LaguerreJacobi, SpecialFunctionsGamma, SpecialFunctionsLegendre, SpecialFunctionsConfluent, SpecialFunctionsAppell (open) and OrthogonalL2Bases, SpecialFunctionsHypergeometric, SpecialFunctionsEiLiErfIncompleteGamma (main); none of them shares an object (LaguerreJacobi line 71 and OrthogonalL2Bases line 118 exclude the general theory). By object search: the Hankel determinant is owned by ClassicalArithmeticCompletion §6.21 on main (R02).
- Dependency check: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Gate rerun at 018e250: every check 0, `OK`.
- Elaboration of `Suggested.lean`: 62 `sorry` warnings and nothing else. `#check @` of all 94 declarations: no lost binder, and every signature matches its README statement except where R03 and R04 apply. The five repair signatures above elaborate.
- One-tactic probe on a copy: `fwdDiff_descPochhammer` (`grind`, `simp`), `bwdDiff_ascPochhammer` (`simp`) and `sum_range_mul_fwdDiff` (`simp`) do not close; `moment = ProbabilityTheory.moment id` closes by `rfl` (R06). Pull-request title and description read against the head: no sentence contradicted.

## Not verifiable

- Szegő, *Orthogonal Polynomials* (§§3.2–3.4, Theorem 7.2): no legal copy found; Theorem 7.2 was read only as DLMF §18.2(xii) reports it.
- Chihara, *An Introduction to Orthogonal Polynomials* (p. 21; Ch. III, Theorem 4.3): no legal copy found.
- Andrews, Askey and Roy, Theorems 5.4.2–5.4.3: no legal copy found; read only as DLMF §18.2(vi) cites them.
- Rota, Kahaner and Odlyzko (1973): the DOI resolves only to a paywalled page (uncertified).
- Ismail (2009) and Gautschi (2004): not read; cited only by DLMF or under Beyond.
- The 6.1 Checks for `e^{−x⁴}` and `(1 − x²)^{0.3}(1 + x²)`: not recomputed.

## Source issues

- **Misprint** in DLMF (Release 1.2.8) at 18.2.11_1, §18.2(iv): the source gives the partial sum of `b_j` up to `n` as `k̃_{n+1}/k_{n+1}`; it should be the negative of that, by telescoping 18.2.11 with `k̃₀ = 0`; affects a stated result.
- **Misprint** in DLMF (Release 1.2.8) at §18.2(iv), Remarks: the source spells "relation" as "realtion" in "orthogonality realtion (18.2.4_5)"; it should read "relation"; affects nothing.
