<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13003#issuecomment-6903174366 -->
Review (claude) of 47ad808

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §8.6 uses the rational structure of cusp forms and its Galois stability without a supplier

   **Location.** `packages/ModularFormsPartII/README.md:954` (proof sketch of §8.6): "Its K-coefficient space is the scalar extension of the rational structure … again a cusp form on `Γ(M)` because the rational structure is stable under conjugation." `*Needs:*` at :956; Dependencies at :975.

   **Claim.** Every input of the route is a target here, a named supplier section or a pinned declaration.

   **Witness.** The `*Needs:*` line names AlgebraicModularFormsAndSerreWeights §2.9, AutomorphicGaloisRepresentations §4.2 and ModularForms Layers 0 and 4. §2.9 clears denominators of a form whose coefficients are already rational; none of the four is cited for the fact that cusp forms with coefficients in a subfield are spanned by rational ones, nor for the stability of that structure under conjugation. `TauCetiRoadmap/ModularForms/README.md` (main) owns both: §8.0 (arithmetic forms on `Γ₁(N)` over a characteristic-zero field, compared with the analytic space coefficient by coefficient), §8.1 (rational descent), §8.2 (Galois stability).

   **Exact repair.**

   - :954, replace the sentence "Its K-coefficient space is the scalar extension of the rational structure, so AlgebraicModularFormsAndSerreWeights §2.9 (All-prime bounded denominators, Layer R15.2) gives one denominator." by: "Replace the component f on `Γ(M)` by `f(Mτ)`, a cusp form on `Γ₀(M²) ∩ Γ₁(M) ⊇ Γ₁(M²)` whose coefficients in `exp(2πiτ)` are those of f in `exp(2πiτ/M)`. By ModularForms §§8.0–8.1 the cusp forms on `Γ₁(M²)` with coefficients in a subfield L of `ℂ` are the L-span of those with rational coefficients, so `f(Mτ)` is an `ι(K)`-combination of rational cusp forms, and AlgebraicModularFormsAndSerreWeights §2.9 (All-prime bounded denominators, Layer R15.2) gives one denominator for each."
   - :954, replace "again a cusp form on `Γ(M)` because the rational structure is stable under conjugation" by "again a cusp form on `Γ₁(M²)` after the same substitution, because this rational structure is stable under every automorphism of `ℂ` (ModularForms §8.2)".
   - :956 and :975: "ModularForms Layers 0 and 4" → "ModularForms Layers 0 and 4 and §§8.0–8.2". :11 (Scope): add "arithmetic forms on `Γ₁(N)` with their rational descent and Galois stability (§§8.0–8.2)". :83 (contract): add "§§8.0–8.2 (for `k ≥ 1` and a characteristic-zero field L, the arithmetic forms on `Γ₁(N)` over L, their comparison with the analytic space matching Tate expansions with `UpperHalfPlane.qExpansion 1`, rational descent, and stability of the rational structure under `Aut(ℂ)`)".

   Tested on the instance: `F = √2Δ`, `K = ℚ(√2)`, `M = 1`: the weight-12 cusp forms on `Γ₁(1)` with coefficients in `ι(K)` are `ι(K)·Δ`, `D = 1` clears Δ, and the conjugate `−√2Δ` is again a cusp form. For general M, `A⁻¹[[a, b], [c, d]]A = [[a, b/M], [Mc, d]]` with `A = diag(M, 1)` maps `Γ(M)` onto the matrices with `a ≡ d ≡ 1 mod M` and lower-left entry divisible by `M²`. The cusp forms of §8.6 have even weight at least 2, inside the range `k ≥ 1` of §8.0.

2. **F02** (P3) §6.5 asserts that conjugation keeps the ramification of the cover; BelyiMaps Layer 11 owns that step

   **Location.** `packages/ModularFormsPartII/README.md:631` (proof sketch of §6.5): "the branch locus of `P^σ` over the j-line lies in `{0, 1728, ∞}`, which σ fixes, with the same ramification indices (dividing 2 over 1728 and 3 over 0)". `*Needs:*` at :633.

   **Claim.** As in R01: the step is neither proved as a target nor attributed.

   **Witness.** `TauCetiRoadmap/BelyiMaps/README.md` (main), Layer 11, §11.1 "Galois conjugation of pairs": the conjugate of an algebraic Belyi pair over `ℚ̄` keeps the marked places, the degree, the genus and the three ramification partitions. §6.5 names BelyiMaps Layers 6 and 9 only.

   **Exact repair.**

   - :631, after "(dividing 2 over 1728 and 3 over 0)" insert: ", by BelyiMaps Layer 11, §11.1, applied to the function field of P over `K₀ ⊆ ℚ̄` with `t = j/1728`: conjugating a Belyi pair preserves its degree and its three ramification partitions; an automorphism of `ℂ` acts on P through its restriction to `ℚ̄`".
   - :633 and :681: "BelyiMaps Layers 6, 9" → "BelyiMaps Layers 6, 9 and Layer 11 (§11.1)". :20 (Scope): after "their algebraization (Layer 9)" add "and the Galois conjugation of Belyi pairs with its invariance of the ramification partitions (Layer 11, §11.1)". :87 (contract): add the same clause after "Layer 9 (…)".

   Tested on the weight-zero instance `f = √2 j` on `SL₂(ℤ)`: `P = Y − √2 j` has degree 1 and partitions `(1), (1), (1)` over `0, 1728, ∞`; the conjugate pair has the same degree and partitions, `Γ^σ = PSL₂(ℤ)` and `f^σ = −√2 j`, in agreement with the Example `√2Δ⁻¹ ↦ −√2Δ⁻¹` at :676. BelyiMaps is on main, so the citation is downward.

3. **F03** (P3) the two η product identities behind the product formula of §2.1 are pinned Tau Ceti theorems, not cited

   **Location.** `packages/ModularFormsPartII/README.md:281` (§2.1): "Prove the product formula … by separating even and odd factors of the η products and applying Euler's identity". `*Needs:*` at :283; Tau Ceti contract at :72–79; Dependencies at :362.

   **Claim.** What the pins prove is cited by name (the pattern of round 9's F01, searched in the rest of the package).

   **Witness.** Pinned Tau Ceti, `TauCeti/NumberTheory/ModularForms/DedekindEta.lean`: `TauCeti.ModularForm.eta_two_mul` (:56), `η(2τ) = e^(πiτ/12) η(τ) ∏_{n≥1}(1 + Qⁿ)`, and `TauCeti.ModularForm.eta_div_two` (:75), `η(τ/2) = e^(−πiτ/24) η(τ) ∏_{n≥0}(1 − q^(2n+1))`, both for `Im τ > 0`. These are the separation into even and odd factors.

   **Exact repair.**

   - Under "### From Tau Ceti" add: "`TauCeti.ModularForm.eta_two_mul` and `TauCeti.ModularForm.eta_div_two` (`TauCeti/NumberTheory/ModularForms/DedekindEta.lean`): for `Im τ > 0`, `η(2τ) = exp(πiτ/12) η(τ) ∏_{n≥1}(1 + Qⁿ)` and `η(τ/2) = exp(−πiτ/24) η(τ) ∏_{n≥0}(1 − q^(2n+1))`, with `Q = exp(2πiτ)` and `q = exp(πiτ)`."
   - :281, replace "by separating even and odd factors of the η products and applying Euler's identity" by "from Tau Ceti's `TauCeti.ModularForm.eta_two_mul` and `TauCeti.ModularForm.eta_div_two`, which give `x = q ∏_{n≥0}(1 − q^(2n+1))⁸ ∏_{n≥1}(1 + q^(2n))¹⁶`, and Euler's identity".
   - :283: add "`TauCeti.ModularForm.eta_two_mul`, `TauCeti.ModularForm.eta_div_two`" to the Tau Ceti items. :362: after "Tau Ceti Euler's identity (…)" add ", the η product identities (`TauCeti.ModularForm.eta_two_mul`, `TauCeti.ModularForm.eta_div_two`)".

   Tested: the exponential factors give `8·(−1/24 + 2/12) = 1`, so the prefactor is `q`; Euler's identity at q, `∏(1 + qⁿ)·∏(1 − q^(2n+1)) = 1`, turns `∏(1 − q^(2n+1))⁸ ∏(1 + q^(2n))¹⁶` into `∏((1 + q^(2n))/(1 + q^(2n−1)))⁸`; to first order `(1 − q)⁸ = 1 − 8q`, the coefficient of `x = q − 8q² + ⋯`. No name of this roadmap's own is added, so `Suggested.lean` is unaffected.

Three findings, all P3, none mathematical: three proof steps whose supplier exists (two on main, one at the Tau Ceti pin) and is not named where the step is used. The three findings of round 9 are repaired. No statement was found false. `Suggested.lean` elaborates with `sorry` as its only warning, no theorem closes under the one-tactic probe, the dependency check reports no problem, and every cross-roadmap citation resolves at the heads read today. I changed no package file and no manifest entry, and fetched no source.

## Verified sound

### Round 9 findings

| Finding | Repaired passage | State |
|---|---|---|
| F01 (P3), zero insertion is a pinned lemma | :78 contract bullet "`TauCeti.qExpansion_nat_mul` … Assumed only with these hypotheses"; :187 "For a holomorphic h-periodic function bounded at `∞` … which is Tau Ceti's `TauCeti.qExpansion_nat_mul`"; `*Needs:*` at :180, :612, :920; Dependencies :273, :681, :975 | Repaired. Pin: `QExpansion/Order.lean:70`, hypotheses `0 < h`, `0 < m`, periodic, bounded, `MDiff`. The added Check (:200) recomputed below |
| F02 (P3), "leveraging", "p-scaling" | :532 "## Layer 5: Degree doubling under p-scaling"; :568 "### 5.5 Degree doubling contradicts the cubic-logarithmic bound"; :47 Conventions bullet; `Suggested.lean:37` | Repaired. No "leverag" remains in the README or the Lean file |
| F03 (P3), order of the closing sections | :1027 Downstream consumers, :1031 Worked examples, :1044 References | Repaired |

Adversarial pass on the changed passages: rows 1–4 of the table. Pattern search: R03 is the one further instance of F01's pattern; R01 and R02 came from reading every proof sketch for inputs without a supplier. No other source-heading word is used as a term (CDT's section titles read at CDT25 lines 14–20, 1535–3824).

### Elaboration, signatures, padding

- `lake env lean packages/ModularFormsPartII/Suggested.lean` from the content checkout: exit 0, 13 warnings, all `declaration uses sorry` (lines 75, 97, 145, 164, 171, 181, 195, 211, 242, 257, 285, 309, 324), no error. Imports: `Mathlib` and `TauCeti.NumberTheory.ModularForms.QExpansion.Laurent` (used). No `set_option`, `variable`, `lemma`, `#eval`, `example`, sorried data.
- One-tactic probe on a scratch copy, every `sorry` replaced by `first | rfl | (simp; done) | infer_instance | trivial | (constructor <;> simp; done) | (intros; simp_all; done) | sorry`: again 13 `declaration uses sorry`, so no theorem closes. None restates a definition, mirrors a Check or treats a boundary case.
- `#check @name` for the 22 declarations in the same scratch file: all print and agree with the README (period `h : ℕ` with `0 < h`; `[Γ.FiniteIndex]` on the four theorems of Layers 6 and 8.2; `hneg` on `wohlfahrt_Gamma_le`; `3 ≤ N`, `p.Prime`, `¬ p ∣ N` on `nonabelian_ihara`; `0 < N` on both span theorems). The file has no section variable, so no binder can be lost. Nothing changed since round 9 but one docstring line.
- Headlines of the Summary: Wohlfahrt (§1.8), λ covering (§2.2), nonabelian Ihara (§4.1), `R₂N = M₂N` and the rank bound (§6.1), both unbounded-denominator theorems (§§6.3, 6.6), Galois conjugation (§6.5), component congruence and Mason (§§7.11–7.12), differential closure (§8.2), both deficient-place theorems (§§8.6–8.7): stated. Degree doubling (§§5.3, 5.5), three-point solutions (§§7.1–7.2) and the fundamental group (§9.3) are named in the module docstring with reasons that hold at the pins.
- Backticked names of this roadmap's own: 22 in the README, 22 declared.

### Library declarations opened at the pins this round

Tau Ceti: `TauCeti.qExpansion_nat_mul` (`QExpansion/Order.lean:70`); `laurentQExpansion` (`QExpansion/Laurent.lean:130`, defined as a shift of `qExpansion h (𝕢^k f)` with k the pole order, 0 when the cusp function is bounded or not meromorphic, so it equals `qExpansion h f` for every bounded f, as Conventions says); `laurentQExpansion_of_analyticAt` (:193), `_eq_laurentQExpansion_iff` (:450); `CongruenceSubgroup.Gamma_le_Gamma_of_dvd` (`CongruenceSubgroups/Basic.lean:177`); `Subgroup.integerCuspWidth` and `_pos` (`Cusps/Basic.lean:170, 176`, on subgroups of `GL₂(ℝ)`); `char_neg_one_of_modFormCharSpace_ne_bot` (`Parity.lean:136`); `tprod_one_add_pow_mul_tprod_one_sub_pow_odd` (`QPochhammer.lean:230`). Mathlib: `UpperHalfPlane.qExpansion` (`QExpansion.lean:172`, by `iteratedDeriv` of the cusp function), `Function.Periodic.cuspFunction` (`Periodic.lean:120`), and by `#check`: `Gamma_zero_bot`, `Subgroup.goursat_surjective`, `Chebyshev.pi_ge`, `theta_ge`, `theta_le_log4_mul_x`, `Derivative.normalizedDerivOfComplex_E₂`, `serreDerivativeMF`, `ModularForm.logDeriv_eta_eq_E2`, `jacobiTheta_T_sq_smul`, `jacobiTheta_S_smul`, `Module.End.IsSemisimple`, `IsCoveringMapOn`, `ModularForm.instGCommRing`, `discriminant_qExpansion_coeff_one`, `NumberField.InfinitePlace.mk`.

By object (searched by word in both pinned libraries): no Wohlfahrt theorem, λ function, weak-form predicate, geometric level, vector-valued or quasimodular carrier, deficient place. Examined and distinct: `Subgroup.CompactifiedQuotient.coeffSubfield` (`QExpansion/FunctionField.lean:209`) is the subfield of meromorphic functions on one compactified quotient with coefficients in a subfield, while `M₂N` and `R₂N` are spans inside one Laurent field and `R₂N` belongs to no single curve; their identification for `M₂N` is §5.1 and needs the declared gap. `ModularForm.mulDiscriminant` (`MulDiscriminant.lean:49`) acts on holomorphic forms, not on the weak forms of §1.4. The one uncited pair is R03.

### Seeded source sample (CDT25; journal page = extraction page + 626)

| Target | Read at | Result |
|---|---|---|
| 2.3 | §1.1.3, p.631, CDT25 lines 213–221; (3.0.2), p.650, line 1425 | Supported; the fifth coefficient 12514 is this roadmap's, recomputed |
| 2.4 | §4.2, p.655, lines 1742–1744; (1.0.2), p.628, lines 59–68 | Supported |
| 3.1 | Definition 4.2.1(1), p.655, lines 1734–1737 | Supported |
| 3.3 | Lemma 4.2.2, p.655, lines 1745–1754 | Supported |
| 3.4 | proof of Proposition 3.0.1, pp.650–651, lines 1423–1447; Definition 2.0.4, pp.635–636, lines 467–485 | Supported; the source's span V is replaced by W, as the README says |
| 4.1 | Lemma 4.4.1, pp.658–659, lines 1885–1943 | Supported; the source's signed domain and its claim on conjugation are corrected here |
| 4.2 | Lemma 4.4.4, pp.659–660, lines 1944–1996 | Supported |
| 4.3 | (4.4.9), p.660, lines 2018–2024 | Supported |
| 5.4 | (4.3.3), p.657, lines 1831–1846 | Supported, "for `N > 1`" |
| 6.7 | (1.0.3), pp.628–629, lines 98–105 | Supported: 248, 4124, 34752 |
| 7.3 | Definition 7.3.1, pp.688–689, lines 3663–3687 | Supported; convention `F ∣_k γ = ρ(γ)F` with `(cτ + d)^(−k)` |
| 7.6 | pp.689–690, lines 3725–3763 | Supported; the source's rank 6n is corrected here |
| 7.8 | proof of Theorem 7.3.3, pp.690–691, lines 3789–3819 | Supported; the Wronskian construction is this roadmap's |
| 7.9 | same proof, lines 3803–3816 | Supported: Chudnovsky, Bombieri–André, Katz, then semisimple and quasi-unipotent |
| 8.6 | §7.4.8, p.695, lines 4055–4079 | Supported; the source's exponent `(k − 1 + ε)/2` is equivalent |

No locator is flagged unverified by the author. Also read: Theorem 1.0.1 (p.627, lines 25–46), Lemma 4.2.3 (pp.655–656, lines 1766–1798), Corollary 7.3.4 (p.691, lines 3820–3823); KSV10 Lemma 7 (line 183, p.4), the proof of Proposition 3 with equation (1) (lines 196–261, pp.5–6), Remark 8 (line 262, p.6). The manifest records the three works of the References, one key each.

### Adversarial table

Series in exact rationals to order 12 and matrices, by a script of my own; the other rows by hand. For the sections neither sampled nor touched, the rows of round 9's table carry computed values and were relied on.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.2 zero insertion, new Check (:200) | `f = Q + |Q|²Q̄`, periods 1 and 2 | period 1: cusp function `w + w w̄²`, value 0 and derivative 1 at 0, `∂/∂w̄ = 2ww̄ ≠ 0` off 0, so `deriv` is 1 at 0 and 0 elsewhere, not differentiable at 0: expansion `t`. Period 2: `w² + w²w̄⁴`, derivative 0 at 0, `∂/∂w̄ = 4w²w̄³ ≠ 0`: expansion 0, not `t²` | True; holomorphy is needed |
| §1.2 Laurent zero insertion (:187) | `Δ⁻¹`, `h = 1`, `m = 2` | `1/(1 − 24Q + 252Q²) = 1 + 24Q + 324Q²`; `QΔ⁻¹` bounded, pinned lemma, shift by `q⁻²`: `q⁻² + 24 + 324q²` | True |
| Conventions, p-scaling (:47) | `p = 2`, `H = Γ(2)`; `H = SL₂(ℤ)` | `ATA⁻¹ = [[1, 2], [0, 1]]`, so `T ∈ H_A`; `A⁻¹γA = [[a, b/2], [2c, d]]`, so `SL₂(ℤ)_A = Γ₀(2)` | True |
| §8.5 period change and lcm (:925–926) | `F = Δ`, `r = 2`; `F = G = Δ`, periods 1, 2 | coefficient 2 is `τ(1) = 1`, coefficient 4 is `τ(2) = −24`, odd ones 0; `(c + d)τ(m)` at `q^(2m)` | True with holomorphic components |
| `wohlfahrt_Gamma_le` (§1.8) | `N = 0`; `H′`; KSV10 (1) at `a = 2` | `Γ(0) = ⊥`; `H′` fails `hneg` and `−I ∈ Γ(2) ∖ H′`; `(Tᵗ)⁻¹T Tᵗ = [[2, 1], [−1, 0]]`, printed order `[[0, 1], [−1, 2]]` | True |
| §1.7 Examples | `p = 2`, two cusps | `gT²g⁻¹ = [[−1, 2], [−2, 3]]`; `BT²B⁻¹ = [[−3, 8], [−2, 5]]`; `CT⁴C⁻¹ = [[−3, 4], [−4, 5]]` | True |
| §2.1 product formula (R03) | series; exponents | `x = q − 8q² + 44q³ − 192q⁴ + 718q⁵ − 2400q⁶`; `8(−1/24 + 1/6) = 1` | True |
| `modularLambda_covering` (§2.2) | boundary | `λ(i) = 1/2`; `λ(1 + i) = (1/2)/(−1/2) = −1`; `λ((1 + i)/2) = 1 − (−1) = 2` | True |
| §2.3 | inverse series | `q = x + 8x² + 84x³ + 992x⁴ + 12514x⁵ + 164688x⁶`, integral through order 11; cube root `1 − (8/3)q + (68/9)q²` | True |
| §2.4, §2.6 | `K₀(x(q))` | equals `θ₃²` through `q¹¹` | True |
| §3.1, §3.3 | `Δ⁻¹`, `m = 1` | cleared form 1; `1·Δ⁻¹` has `q`-order −2 | True |
| §3.2 Check | `Γ₀(3)` | η exponent `12/24 − 36/24 = −1`; `[[1, 0], [1, 1]] = [[1, 0], [3, 1]]·[[1, 0], [2, 1]]⁻¹` | True |
| §3.4 | `f = λ − 1/2`, `N = 1` | `16 − (16u − 1/2)/(u − 1/32) = 0`; pole at `u = 1/32 ∈ U₁` with a holomorphic solution | True |
| `nonabelian_ihara` (§4.1) | Goursat; `−I`; c | `AgA⁻¹ = [[a, pb], [c/p, d]]`, in `Γ(N)` since `p ∤ N`; kernel K contains `G ∩ Γ(N)`, hence every conjugate of `T^N`; `Γ(N) ≤ ±K`, `−I ∉ Γ(N)` for `N ≥ 3` | True |
| §4.2 | `T^N` | `c(T^N) = T^(Np) ∈ G`, so the image contains `1 × 1 × U`; common quotient factors through `B/U` | True |
| §4.3 | both inclusions | `ker(f₁, π) = G ∩ Γ(Np)`; `A⁻¹gA = [[a, b/p], [pc, d]]` has lower-left entry divisible by p and `b/p ≡ 0 mod N` | True |
| §5.4 | `N = 1, 2, 3, 4` | formula `1/2, 4, 12, 32`; `4N³/π² = 0.41, 3.24, 10.94, 25.94` | True; `N = 1` split off |
| `boundedDenominatorSpan_eq_congruenceSpan`, `_finrank_le` (§6.1) | both inclusions; `N = 1` | ⊇ with `H = ±Γ(2N)`; ⊆ by §6.4 and §1.8 on `⟨H, Γ′⟩`; `C log(N⁴/B)/N`; `C ≥ 1/log 2` | True |
| `unbounded_denominators` (§6.3) | `f = 0`; weight | `h₀` has weight `0 − 1 = −1`, exponent `1 − 1/12 = 11/12` | True |
| `weakForm_galois_conjugate` (§6.5; R02) | `√2Δ⁻¹` | coefficients `√2·(1, 24, 324)`; conjugate `−√2Δ⁻¹` | True |
| §6.7 | series | `E₄/η⁸ = Q^(−1/3)(1 + 248Q + 4124Q² + 34752Q³)` | True |
| §6.8, §6.9 | roots; valuations | `x(1 − 16x) = q∏_{m odd}(1 + q^m)^(−24)` through order 10; `u^(1/5) = 1 − 24/5 q + 348/25 q² − 4544/125 q³ + 52854/625 q⁴`; `u^(1/24) = 1 − q + q² − 2q³ + 2q⁴ − 3q⁵`; 2-adic: `1, 1, 2, 1, 2, 2, 3, 1, 2` and `0, −1, −1, −3, −3, −4, −4, −7, −7`; 3-adic: `−1, −2, −4, −5, −6, −8, −9, −10, −13`; `C(1/16, 2)·256 = −15/2` | True |
| `IsVectorValuedForm`, §7.3 | sign | `F(γτ) = (cτ + d)^k ρ(γ)F(τ)` is the source's law; at `γ = −I`, `F = (−1)^k F` | Agrees |
| `vectorValued_component_congruence` (§7.11) | `n = 0`; odd k; period h | no index; `F = 0`; `F_j(hτ) = Σ a_n q^(2n)` | True |
| `vectorValued_effective_mason`, §7.13 | σ | `σ(R)² = [[−3, −1], [7, 2]]`, `σ(R)³ = I`, `σ(S)σ(R) = [[2, 1], [7, 3]]`, trace 5, determinant −1 | True |
| §7.9 | supplier | DiophantineApproximationAndTranscendence §5.3 states Chudnovsky's bound `q_s ≤ C^s` for a `ℚ̄(z)`-independent solution; no Bombieri–André or Katz there (the gap) | Consistent |
| `quasiModularWeakAlgebra_differential_closure` (§8.2), §8.1 Checks | `E₂` | `(E₂ ∣[2] S)(τ) = E₂(τ) + 6/(πiτ)`; in `Σ(τ + n)^(k−2) f_k`, growth in n kills `k > 2`, leaving `f₂ = E₂`; `E₂ = DΔ·Δ⁻¹` | True |
| §8.3, §8.4 | series | `E₀ = (1 − 16x)K₀ + 8∫K₀` through order 11; `E₀(x(q)) = 1 − 4q + 20q² − 64q³ + 164q⁴ − 392q⁵`; `ΣC_n²xⁿ = 1 + q − 4q² + 5q³ + 12q⁴ − 42q⁵` | True |
| `congruenceKernel_no_deficient_place` (§8.6; R01) | `k ≤ 0`; another embedding; `√2Δ` | no cusp forms; conjugate `−√2Δ`; `A⁻¹Γ(M)A = Γ₀(M²) ∩ Γ₁(M)` | True; supplier missing (R01) |
| `exists_deficient_finite_place` (§8.7) | `S = ∅`; `ρ = 1 ⊕ σ` | integral everywhere gives congruence, contradicting `hnon`; eigenvalues `e₊^h, e₋^h ≠ 1` give zero σ-part | True |

### Duplication, ownership, overlaps

- Supplier citations resolved today at the heads the roadmaps tool gives, by heading and, where marked (s), by statement: SpecialFunctionsTheta §§2.2, 4.2, 6.1 (s), 6.2 (s), 6.4 (s); QSeriesPartitionsAndMockModularForms §§5.2, 8.1, 8.4a (s); ModularCurvesPartII §§5.13, 5.14 (s), 6.3–6.5, 8.1, 11.4 (s), 15.2 (s), 15.3 (s), 15.5 (s), 15.6, 15.9, 15.10 (s); DiophantineApproximationAndTranscendencePartII §§4.1 (s), 4.2–4.4, 4.5 (s), 4.6–4.8; ConformalMappingPartII §§0.3, 0.5, 1.4, 1.8, 5.1, 5.5, 5.8 (s), 9.19 (s); AlgebraicModularFormsAndSerreWeights §§1.5 (s), 2.9 (s) with the identifiers R15.1–R15.2; AutomorphicGaloisRepresentations §4.2; GeometryOfNumbersAndQuadraticArithmetic §4.3 (the product and its specialization are inside that section, its lines 1606–1608); DiophantineApproximationAndTranscendence §§5.2, 5.3 (s); EtaleCohomologyFoundations §F.0.2; FuchsianOrbifolds Layer 2 items 3 (s) and 5 (s), Layer 3 item 5 (s), Layers 4–5, Layer 6 item 1 (s); BelyiMaps Layers 6, 9; UniversalCovers (Completed) Stage 2 (s).
- ModularForms (main) is cited by Layer 0, Layer 4, Worked examples and Layer 10; its table of earlier labels (its lines 335–350) maps the first three to their present places, so the citations stand.
- The three declared gaps: same slugs in `design/plan.json` and under "## Exact supplier contracts", one statement each with hypotheses and a named supplier section. ModularCurvesPartII §5.14 states no cusp rationality and §11.4 covers `p > 3` for `Γ₀(pⁿM)`; DiophantineApproximationAndTranscendence has neither Bombieri–André nor Katz. None asks for what is provided.
- `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id dropped, no second copy on main.
- NoncongruenceModularForms (main) cites W1.2, W1.3, W1.5, W1.6, W1.8, W6.3–W6.5; all resolve through the former-numbering table (:26–36). Its `Suggested.lean` states `unbounded_denominators` in its own namespace as a transport "from ModularFormsPartII W6.4" for holomorphic forms, and its README (its line 162) assigns the proof to this roadmap: one owner.
- No fully qualified name of `Suggested.lean` occurs in another roadmap (searched nine name patterns over main and the open heads): SpecialFunctionsTheta declares `modularLambda` in its own namespace as a theta quotient, which §2.1 identifies with the η quotient.

Overlap check: read HalfIntegralWeightModularForms, SpecialFunctionsTheta, DiophantineApproximationAndTranscendencePartII, QSeriesPartitionsAndMockModularForms, SiegelModularForms, NoncongruenceModularForms, ModularForms, ConformalMappingPartII (the first and fifth through round 9's reading, their heads not listed as changed); λ with its laws, the mapping theorem and the hypergeometric identity are SpecialFunctionsTheta's; the η-quotient presentation, the covering theorem and the integral series form are this roadmap's; geometric level, signed Wohlfahrt and the unbounded denominators theorem are this roadmap's, the strict level and the transported holomorphic form are NoncongruenceModularForms'; the general weak-form carrier, the η multiplier and expansions with parabolic monodromy are QSeriesPartitionsAndMockModularForms'; the η transformation, arithmetic forms and Galois stability are ModularForms'; holonomic germs and the rank bound are DiophantineApproximationAndTranscendencePartII's; the coverings `F_N` are ConformalMappingPartII's; the other two share nothing.

### Supplier order

```text
depcheck: 238 roadmaps, 2257 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. All 64 `*Needs:*` lines read; none cites a later roadmap or one of the never-cite list. The two citations R01 and R02 add are of roadmaps on main.

### Shape, style, copyright

- Nine layers, each ending with Examples and Dependencies; every defined object (the 11 "Define" sentences, and the objects of §§1.2, 7.6, 7.7, 8.5 and 9.1) has its API and at least three Checks; every theorem has hypotheses and a locator. Closing sections in the house order. No LaTeX delimiters, pull-request numbers, dates, machine paths, HTML anchors or process words (searched in both files).
- Arrangement against the contents of CDT25 (§§1–7; 4.1–4.6; 7.1–7.4, lines 14–20 and the subsection headings): Layer 2 has no counterpart; Layer 3 joins §3 with §4.2; Layers 4 and 5 are §§4.4 and 4.3 in the opposite order, forced by the `*Needs:*` of §5.2 (§4.3 of the README); §§2, 5, 6 and 4.5–4.6 are suppliers' material; §7 is spread over Layers 7–9, two of them from the one subsection 7.4. No run of layers maps one to one onto a run of sections.
- Wording: the 15 sampled passages and 6 more (Theorem 1.0.1 against the docstring of `unbounded_denominators`, Lemma 4.2.3 against §§3.6–3.7, Corollary 7.3.4 against §7.12, §7.4.8 against §8.5, KSV10 Lemma 7 and equation (1) against §1.8) set beside the sources. None follows the source's sentences; the closest is the growth clause of §7.3, a chain of inequalities the mathematics forces. No table, figure or list is taken over.

Source independence: 21 passages compared with 2 sources (CDT25, KSV10), none shared; largest share CDT25, 65 of 67 parenthesised locators; contents compared with CDT25: independent. Ihara1994 could not be read.

## Not verifiable

- Ihara1994, Theorem 1 and §4 (§9.2): settled as uncertified, cited by locator; not read.
- The proofs behind supplier statements still in open pull requests (DiophantineApproximationAndTranscendencePartII §4.5, ModularCurvesPartII Layer 15, SpecialFunctionsTheta §§6.2, 6.4, AlgebraicModularFormsAndSerreWeights §2.9) belong to those roadmaps' reviews; here they were resolved by heading and statement.
- SpecialFunctionsTheta is not among the names of the job's list of open pull requests; it was read through the roadmaps tool. Ownership against open pull requests was checked with that tool at the index of 2026-11-15.
- The `roadmaps resolve` tool reports that Lean names outside the roadmaps were not checked on this host; the library names were checked by `#check` and by reading the pinned files, as listed above.

## Source issues

Only what was read at the text this round.

- **Misprint** in KSV10 at proof of Proposition 3, the line after equation (1), p.6: the source says L is the transpose of T times a power of T times the inverse transpose; it should be the inverse transpose first and the transpose last; affects the proof.
- **Error** in CDT25 at §4.4, p.658: the source says conjugation by diag(p, 1) maps the signed level-N group with lower-left entry divisible by p to itself; it should map it onto the subgroup with upper-right entry divisible by p; affects the proof.
- **Error** in CDT25 at the paragraph before Lemma 4.4.4, p.659: the source says reduction modulo p on the signed group has kernel the principal group of level Np; it should also contain elements congruent to −I modulo N; affects the proof.
- **Error** in CDT25 at Proposition 3.0.1, p.650: the source says the dimension is at most a constant times N³ log N for every N; it should be log(2N), since the bound is zero at N = 1; affects nothing.
- **Error** in CDT25 at (1.1.5), p.631: the source says the squared theta series is a weight-one form for the principal group of level 2; it should carry the quadratic character of conductor 4, since −I lies in that group; affects nothing.
- **Gap** in CDT25 at proof of Theorem 7.3.3, p.690: the source says the bundle has rank 6n and may be assumed irreducible; it should work with the continuation space of the one component, of dimension at most n; affects the proof.
- **Error** in CDT25 at Corollary 7.3.4, p.691: the source says bounded denominators of all components give a congruence kernel of ρ; it should be that a principal congruence subgroup fixes the span of the values; affects a stated result.
- **Error** in CDT25 at §7.4.8, p.695: the source says a non-archimedean deficient place exists whenever the kernel of ρ is not congruence; it should require a noncongruence component with coefficients integral outside finitely many places; affects a stated result.

## For the human reviewers

- **Scope.** This roadmap consumes SpecialFunctionsTheta (README :22, :97), another author's open pull request that is not in the merge-order file; the two must merge in that order.
- **Scope.** NoncongruenceModularForms on main names ModularFormsPartII, which is not on main, as a supplier (its README lines 50, 162, 301) and states a transported `unbounded_denominators` in its own `Suggested.lean` (line 492).
- **Licence.** CDT25 was read in the authors' offprint, whose pages carry the publisher's notice "Copyright restrictions may apply"; the manifest classes it `author-page`.
- **Not tested.** Ihara1994 (§9.2) is cited by locator only; parts 1 and 2 of the copyright check were not run against it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "47ad80879f858f3ba88825139fa3011eda88fd68", "job": "REV-PKG-ModularFormsPartII~10", "model": "fable", "worker": "chris-x79"} -->
