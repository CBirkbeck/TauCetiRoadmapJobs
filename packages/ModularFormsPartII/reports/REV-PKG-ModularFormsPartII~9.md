<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13003#issuecomment-6902222581 -->
Review (claude) of 9b54779

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the zero-insertion law of §1.2 is a pinned Tau Ceti lemma, restated and not cited

   **Location.** `packages/ModularFormsPartII/README.md:185` (API of §1.2): "For an h-periodic function bounded at `∞`, the coefficients are those of Mathlib's `UpperHalfPlane.qExpansion h`, and replacing h by a multiple `mh` inserts zeros (`a_n` becomes the coefficient of `t^(mn)`)." The law is used again at :605 (§6.3, "an odd period h becomes the even period 2h by inserting zeros"), :915, :922 and :936 (§8.5).

   **Claim.** The bullet is listed as API this roadmap proves; the Tau Ceti contract (:71–77) does not name a supplier for it.

   **Witness.** Pinned Tau Ceti, `TauCeti/NumberTheory/ModularForms/QExpansion/Order.lean:70`: `TauCeti.qExpansion_nat_mul`, for `0 < h`, `0 < m` and g holomorphic, h-periodic and bounded at `∞`: `qExpansion (m * h) g = PowerSeries.expand m (qExpansion h g)`. `#check @TauCeti.qExpansion_nat_mul` elaborates at the pin.

   **Exact repair.**

   - Under "### From Tau Ceti" add: "`TauCeti.qExpansion_nat_mul` (`TauCeti/NumberTheory/ModularForms/QExpansion/Order.lean`): for `h > 0`, `m ≥ 1` and g holomorphic on `ℍ`, h-periodic and bounded at `∞`, the expansion `UpperHalfPlane.qExpansion (m·h) g` is `UpperHalfPlane.qExpansion h g` with its variable replaced by its m-th power."
   - Replace the bullet at :185 by: "For a holomorphic h-periodic function bounded at `∞`, the coefficients are those of Mathlib's `UpperHalfPlane.qExpansion h`; replacing h by a multiple `mh` inserts zeros (`a_n` becomes the coefficient of `t^(mn)`), which is Tau Ceti's `TauCeti.qExpansion_nat_mul`. The same law for the Laurent expansion of a function with a finite principal part is proved here."
   - :178 (`*Needs:*` of §1.2): add "Tau Ceti `TauCeti.qExpansion_nat_mul`". :270 (Layer 1 Dependencies): after "Tau Ceti cusp widths" add ", `TauCeti.qExpansion_nat_mul`". :609 (`*Needs:*` of §6.3): add "§1.2" (its statement uses the law; §8.5 already names §1.2).

   Tested on the instance: `g = Δ`, `h = 1`, `m = 2` gives `expand 2 (Q − 24Q² + ⋯) = q² − 24q⁴ + ⋯`, the expansion the Layer 8 Examples record (:965). The pinned lemma needs holomorphy, which the present bullet omits; the Laurent case is not at the pin (`QExpansion/Laurent.lean` has no rescaling lemma), so it stays a target.

2. **F02** (P3) "leveraging" is the source's section word, used undefined and in a layer heading; "p-scaling" is never defined

   **Location.** `packages/ModularFormsPartII/README.md:529`: "## Layer 5: Leveraging and degree doubling"; :565 "### 5.5 Leveraging contradicts the cubic-logarithmic bound"; also :7, :24, :490, :523 and `packages/ModularFormsPartII/Suggested.lean:37`.

   **Claim.** Every term is the literature's or Mathlib's name for an object, or is defined where it first appears; a layer is named by its mathematics.

   **Witness.** No sentence of the README says what "leveraging" is. CDT25 line 1799 is the heading of the article's §4.3, which uses the same word, and Layer 5 (§§5.1–5.5) covers that subsection: Theorems 4.3.1–4.3.2, (4.3.3), Proposition 4.3.5. "p-scaling" (:3, :245, :531, :541) is likewise only used.

   **Exact repair.**

   - :529 → "## Layer 5: Degree doubling under p-scaling". :565 → "### 5.5 Degree doubling contradicts the cubic-logarithmic bound".
   - :7 "leveraging and degree doubling (Layer 5)" → "degree doubling under p-scaling and its contradiction with the rank bound (Layer 5)". :24 "the leveraging argument" → "the degree-doubling argument of Layer 5". :490 "the group theory behind leveraging" → "the group theory behind the degree doubling of Layer 5". :523 "leveraging uses only levels" → "Layer 5 uses only levels".
   - `Suggested.lean:37` "the leveraging contradiction (README §5.5)" → "the contradiction with the rank bound (README §5.5)". A docstring only; the elaboration is unaffected.
   - Add to "## Conventions", after the bullet on `A = diag(p, 1)`: "p-scaling: for a prime p, the p-scaling of a function f on `ℍ` is `τ ↦ f(pτ) = f(Aτ)`, and the p-scaling of a subgroup H is `H_A = A⁻¹HA ∩ SL₂(ℤ)` (§1.7). If H fixes a weight-zero f, then `H_A` fixes its p-scaling."

   Tested: for `γ′ = A⁻¹γA ∈ H_A`, `Aγ′τ = γAτ`, so `f(Aγ′τ) = f(γAτ) = f(Aτ)`, the first sentence of the proof of §5.2 (:545). No roadmap cites Layer 5 by its heading (the citations on main are W1.2, W1.3, W1.5, W1.6, W1.8, W6.3–W6.5), so the renaming drops no cited id. The order Layer 4 before Layer 5 is forced by the `*Needs:*` line of §5.2 (§4.3) and is not the article's.

3. **F03** (P3) "Worked examples" precedes "Downstream consumers"

   **Location.** `packages/ModularFormsPartII/README.md:1024` "## Worked examples", :1037 "## Downstream consumers", :1041 "## References".

   **Claim.** The closing sections are in the house order.

   **Witness.** `TauCetiRoadmap/ModularForms/README.md` on main: "## Downstream consumers" (:1526), "## Worked examples" (:1549), "## References" (:1585); `TauCetiRoadmap/NoncongruenceModularForms/README.md`: :1858, :1865, :1978, the same order.

   **Exact repair.** Move the block :1037–1039 ("## Downstream consumers" and its paragraph) to immediately before :1024 "## Worked examples". No text changes.

Three findings, all P3; none is mathematical. The three findings of round 8 are repaired. No statement was found false: `Suggested.lean` elaborates with `sorry` as its only warning, no theorem closes under the one-tactic probe, the dependency check reports no problem, and every cross-roadmap citation resolves at the heads read today. I changed no package file and no manifest entry, and fetched no source.

## Verified sound

### Round 8 findings

| Finding | Repaired passage | State |
|---|---|---|
| F01 (P2), SpecialFunctionsTheta section numbers | :97 "§4.2: the theta-constant products … §2.2: Jacobi's quartic identity … §6.1: `λ = k² = (θ₂/θ₃)⁴` … §6.2: λ maps `F = {τ ∈ ℍ : …}` bijectively … §6.4: `F(1/2, 1/2; 1; λ(τ)) = θ₃(τ)²`"; `Suggested.lean:87` "(§6.1, same nome)" | Repaired. At SpecialFunctionsTheta's head (76a507d, unchanged since the repair): §2.2 "Quadratic relations and Jacobi's quartic identity", §4.2 "Products, zeros and theta constants", §6.1 "Modulus, `λ` and Jacobi's inversion" with the three laws, §6.2 "The mapping theorem" with boundary and cusp values, §6.4 the identity on `F + 2n`. All 18 citing passages (:22, :97, :278, :280, :285–287, :296, :302, :304, :332, :334, :336, :342, :344, :359) read against it |
| F02 (P3), Dependencies lines | :270, :359, :486, :581, :678, :851, :972, :1022 | Repaired. Script over the 64 `*Needs:*` lines: every roadmap, gap and Tau Ceti name of a layer's `*Needs:*` lines is on its Dependencies line; three hits are false (the range "§§4.1–4.5" covers 4.3; "Layers 2, 6" covers the cited items; "Tau Ceti cusp widths" names `integerCuspWidth` in words) |
| F03 (P3), `u` in the Layer 6 Examples | :670 "With `u = ∏_{m odd}(1 + q^m)^(−24)` as in §6.8 (not the Fermat coordinate of §6.9), `u^(1/5) = …`" | Repaired; series recomputed below |

Pattern search after the repairs: no other SpecialFunctionsTheta number in the package; no other letter with two meanings in one layer's Examples. The definition of F with `τ ∈ ℍ` agrees with SpecialFunctionsTheta §6.2, whose Check records the junk value `λ(0.3 − 0.8i) = 0`.

### Elaboration, signatures, padding

- `lake env lean` on `packages/ModularFormsPartII/Suggested.lean` from the content checkout: exit 0, 13 warnings, all `declaration uses sorry` (lines 75, 97, 145, 164, 171, 181, 195, 211, 242, 257, 285, 309, 324), no error. Imports `Mathlib` and `TauCeti.NumberTheory.ModularForms.QExpansion.Laurent` (used by four declarations). No `set_option`, `variable`, `lemma`, `#eval`, sorried data or `example`.
- One-tactic probe on a scratch copy, every `sorry` replaced by `first | rfl | (simp; done) | infer_instance | trivial | (constructor <;> simp; done) | (intros; simp_all; done) | sorry`: exit 0 and again 13 `declaration uses sorry`, so all 13 theorems fall back. None restates a definition, mirrors a Check, computes a small value or treats a boundary case.
- `#check @name` for the 22 declarations in the same scratch file: all print; the file has no section variable, so no binder can be lost; the types agree with the README statements (period `h : ℕ` with `0 < h`, `[Γ.FiniteIndex]` on the five theorems that need it, `hneg` on `wohlfahrt_Gamma_le`, `0 < N` on the two span theorems).
- Headlines of the Summary: Wohlfahrt (§1.8), λ covering (§2.2), nonabelian Ihara (§4.1), `R₂N = M₂N` and the rank bound (§6.1), both unbounded-denominator theorems (§§6.3, 6.6), Galois conjugation (§6.5), component congruence and Mason (§§7.11–7.12), quasimodular closure (§8.2), both deficient-place theorems (§§8.6–8.7): stated. Degree doubling and its contradiction (§§5.3, 5.5), three-point solutions (§§7.1–7.2) and the fundamental group (§9.3) are named in the module docstring with reasons that hold at the pins (no continuation of ODE solutions or local monodromy, no regular model of `X(N)`).
- Backticked names of this roadmap's own: 22 in the README, 22 declared, each found in the README.

### Library declarations opened at the pins

A scratch file with `#check @name` for 57 cited names elaborates without error. Among them, Mathlib: `ModularForm.SL_slash`, `OnePoint.IsBoundedAt`, `UpperHalfPlane.IsBoundedAtImInfty`, `CongruenceSubgroup.Gamma0`, `Gamma1`, `IsCongruenceSubgroup`, `Gamma_normal`, `Gamma_zero_bot` (`CongruenceSubgroups.lean:69`, by `rfl`), `Subgroup.isArithmetic_iff_finiteIndex` (`ArithmeticSubgroups.lean:132`), `ModularForm.eta_ne_zero` (`DedekindEta.lean:114`), `logDeriv_eta_eq_E2` (:166), `ModularForm.discriminant_ne_zero` (`Discriminant.lean:123`), `discriminant_qExpansion_coeff_one` (:212), `ModularForm.instGCommRing`, `jacobiTheta_T_sq_smul`, `jacobiTheta_S_smul` (`JacobiTheta/OneVariable.lean:37, 43`), `Derivative.normalizedDerivOfComplex` (`Derivative.lean:39`, `(2πi)⁻¹ · deriv`), `serreDerivativeMF` (:304), `normalizedDerivOfComplex_E₂` (`RamanujanFormula.lean:122`), `Subgroup.goursat_surjective` (`GroupTheory/Goursat.lean:107`), `Chebyshev.theta_le_log4_mul_x` (`Chebyshev.lean:191`), `theta_ge` (:531), `pi_ge` (:842), `IsCoveringMapOn`, `Module.End.IsSemisimple`, `NumberField.FinitePlace`, `NumberField.InfinitePlace.mk`. The instance `HasDetPlusMinusOne` for the image of a subgroup of `SL₂(ℤ)` is found by `inferInstance`. Tau Ceti: `TauCeti.Subgroup.integerCuspWidth` (`Cusps/Basic.lean:170`), `integerCuspWidth_pos` (:176), `CongruenceSubgroup.Gamma_le_Gamma_of_dvd` (`CongruenceSubgroups/Basic.lean:177`), `TauCeti.char_neg_one_of_modFormCharSpace_ne_bot` (`Parity.lean:136`), `TauCeti.tprod_one_add_pow_mul_tprod_one_sub_pow_odd` (`QPochhammer.lean:230`), `laurentQExpansion` (`QExpansion/Laurent.lean:130`), `_of_analyticAt` (:193), `orderTop_` (:235), `_mul` (:288), `_inv` (:377), `_eq_laurentQExpansion_iff` (:450). The 25 Mathlib file paths of the contract exist.

By object: neither pinned library has a Wohlfahrt theorem, a λ function, a weak-form predicate, a geometric level, a vector-valued or quasimodular carrier (searched by word and by object). `QExpansion/MulDiscriminant.lean` treats holomorphic forms on groups between `Γ(N)` and `SL₂(ℤ)`, not §1.4's weak forms on arbitrary finite-index subgroups; `QExpansion/Irregular.lean` is the parity law the proof of §1.1 uses. The one restated lemma is R01.

### Seeded source sample (CDT25; journal page = extraction page + 626)

| Target | Read at | Result |
|---|---|---|
| 1.2 | Theorem 1.0.1, p.627, lines 25–46; Definition 4.2.1(2), p.655, lines 1738–1740; Remarks 6.3.1–6.3.2, pp.685–686, lines 3500–3526 | Supported; the source's contrapositive has rational coefficients with one denominator |
| 1.4 | Lemma 4.2.2, p.655, lines 1747–1754; Lemma 7.4.4, pp.692–693, lines 3900–3910 | Supported |
| 1.6 | Lemma 4.1.4, p.653, lines 1582–1587 | Supported |
| 2.2 | p.628, lines 64–70; Proposition 3.0.1 on p.649 (line 1404), proof from p.650 (line 1423) | Supported |
| 2.4 | §4.2, p.655, lines 1742–1744; p.628, line 68 | `ℚ[λ, 1/λ, 1/(1 − λ)]`, `M₂ = ℚ(λ)`; supported |
| 3.8 | Proposition 3.0.1, pp.649–651, lines 1404–1470; Corollary 2.0.5, p.636, line 489; §6.3, p.685, lines 3489–3499 | Supported; the source prints `log N`, noted in the README |
| 5.4 | (4.3.3), p.657, lines 1831–1846 | Supported: half the index, `> 4N³/π²`, "for `N > 1`" |
| 6.5 | Remark 6.3.2, p.686, lines 3519–3526 | The source uses the Galois action on expansions without proof; the README says "where this fact is used" and proves it |
| 6.6 | Remarks 6.3.1–6.3.2, pp.685–686 | Supported (trace argument at lines 3522–3526) |
| 6.9 | p.628, lines 85–97; §1.1.3, p.631, lines 230–236 | Supported: exponents `1, 2, 4, 8`, the eighth root of `λ/16` |
| 7.7 | Proof of Theorem 7.3.3, pp.690–691, lines 3789–3819 | Supported; the source's rank 6n and irreducibility are corrected here |
| 7.11 | Theorem 7.3.3, pp.690–691, lines 3766–3770 | Supported; "`c = 1` and `h = 2`" is the source's expansion in `exp(πiτ)` |
| 7.12 | Corollary 7.3.4, p.691, lines 3820–3823 | The source concludes that the kernel of ρ contains a principal congruence subgroup without the spanning hypothesis; the README's correction is right (§7.13) |
| 8.2 | Lemma 7.4.4, pp.692–693, lines 3900–3910; Definition 7.4.3, p.692, line 3898 | Supported; factor 2 corrected here |
| 9.3 | Theorem 7.4.10, p.696, lines 4118–4127 | Supported |

No locator is flagged unverified by the author. KSV10 read at Lemma 7 (line 183, p.4), the proof of Proposition 3 with equation (1) (lines 196–261, pp.5–6) and Remark 8 (line 262, p.6). "Wohlfahrt's Theorem 2" is cited through CDT25 line 1943 (p.659), where the source invokes it. The manifest records the three works of the References, one key each.

### Adversarial table

Series in exact rationals to order 15; matrices by hand.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.2 root property; Checks | `(1 − 16t)^(1/16)`; ℓ-adic argument | `C(1/16, 2)·256 = −15/2`; `ℓ^c a` nonzero mod ℓ, its n-th power zero, in the domain `𝔽_ℓ[[t]]` | True |
| §1.3 Checks | `H′`; χ of `η²` | `aa′ + bc′ ≡ aa′ mod 4` on `Γ(2)`, so `H′` is a subgroup of index 2; `gT²g⁻¹ = [[−1, 2], [−2, 3]]`; `(χ(S)χ(T))³ = e^(−πi) = −1 = χ(S)²`; `±1` at `T^m` iff `6 ∣ m` | True |
| §1.4 | `Δ⁻¹`, `m = 1` | `Δ⁻¹·Δ = 1`; `Δ⁻¹ = Q⁻¹ + 24 + 324Q` | True |
| §1.6 | core as finite intersection | each conjugate has level `L(G)`; lcm of equal numbers | True |
| §1.7 Examples | `p = 2`, `B = [[1, 0], [1, 1]]` and `[[2, 1], [1, 1]]` | `CTC⁻¹ = [[−1, 1], [−4, 3]] = A⁻¹[[−1, 2], [−2, 3]]A`; `BT²B⁻¹ = [[−3, 8], [−2, 5]]`, `CT⁴C⁻¹ = [[−3, 4], [−4, 5]]` | True |
| `wohlfahrt_Gamma_le`; KSV10 (1) | `N = 0`; `H′`; `a = 2` | `Γ(0) = ⊥`; `H′` fails `hneg`; `(Tᵗ)⁻¹T^(a−1)Tᵗ = [[a, a − 1], [1 − a, 2 − a]]`, at `a = 2` `[[2, 1], [−1, 0]]`; lower row of M: `(1 − ad, d(2 − ad))` | True |
| §2.1 | η exponents; second-order T law; numerics | `(1/24 + 8/24 − 6/24)·8 = 1`; `x = q − 8q² + 44q³ − 192q⁴ + 718q⁵`; `λ/(λ − 1) = −16q − 128q²`; `ST⁻²S⁻¹ = [[1, 0], [2, 1]]`; SpecialFunctionsTheta's `0.76600 28750… + 0.40978 63252… i` rounds to :296 | True |
| `modularLambda_covering` (§2.2) | boundary of F | `S(−1 + it) = 1/(1 − it)`, at distance 1/2 from 1/2; `λ = 1/(1 − u) ∈ (1, ∞)`; `λ(1 + i) = −1`, `λ((1 + i)/2) = 2` | True |
| §2.3, §2.5 | inverse; cube root | `q = x + 8x² + 84x³ + 992x⁴ + 12514x⁵`, integral through order 15; `x₃ = t − (8/3)t⁴ + (68/9)t⁷` | True |
| §2.4 | generators | `λ⁻¹ = (1/16)q⁻¹ + ⋯`; `j = 256(1 − λ + λ²)³/(λ²(1 − λ)²)` regular off `{0, 1}` | True |
| §2.6 | ODE; identity; `τ₀` | `x(1 − 16x)y″ + (1 − 32x)y′ − 4y`; `(n + 1)²a_{n+1} = 4(2n + 1)²a_n`; `K₀(x(q)) − θ₃²` zero through `q¹⁵`; factor `4i + 1`, `d = 1` | True |
| §2.7 | `γ₂`, `γ₃`, sign | `4·0.8216·1.7725/(1.5016·0.8862) = 4.377`; `172.46/66.82 = 2.581`; `−2(ic)(2i) = 4c` | True |
| §3.2 Check | `Γ₀(3)` | η exponent `(1 − 3)·12/24 = −1`; width 3 at the cusp 0 | True |
| §3.8 | `r = 1 − A/(2N³)`; `r = 0.95`, `N = 2` | `log(1 + A/N³) + log(1 − A/(2N³)) ≈ A/(2N³) ≥ A/(3N³)`; `N·C_B(log N)/N`; `0.95·4.37688/4 = 1.0395` | True |
| `nonabelian_ihara` (§4.1) | projections; `p = 2, 3`; K | normal closure of a transvection is `SL₂(𝔽_p)` (transpositions in `S₃`; order 3 outside `Q₈`); `AgA⁻¹ = [[a, pb], [c/p, d]]`; `Γ(N) ≤ ±K`, `K ≤ Γ(N)`, `−I ∉ Γ(N)` give `K = Γ(N)` | True |
| §5.2 (R02) | p-scaling | `f(pτ) = Σ a_n (q^(1/(Np)))^(np²)`; `Aγ′τ = γAτ` | True |
| §5.4, §5.5 | `N = 2, 3`; `N = 1` | `(64/12)(3/4) = 4 = 48/12`; `(216/12)(3/4)(8/9) = 12 = 144/12`; `(8N³/12)(6/π²) = 4N³/π²`; formula at `N = 1` gives `1/2` | True |
| `boundedDenominatorSpan_eq_congruenceSpan`, `_finrank_le` | both inclusions; `N = 1` | ⊇ with `H = ±Γ(2N)`; ⊆ by §6.4 and §1.8 on `⟨H, Γ′⟩`; `N/(1 − r) = N⁴/B`; `C ≥ 1/log 2` | True |
| `unbounded_denominators` (§6.3; R01) | `f = 0`; odd h; `j^(1/3)Δ` | zero insertion `h ↦ 2h` (pinned lemma); `q^(11k/12)` integral in a period divisible by 24; `1 + 248Q + 4124Q² + 34752Q³` | True |
| `weakForm_galois_conjugate` (§6.5) | `√2Δ⁻¹`; general k | conjugate `−√2Δ⁻¹`; `(fh₀^k)^σ/h₀^k` is supported on multiples of `H/h`, so h-periodic | True |
| `algebraicInteger_unbounded_denominators` (§6.6) | trace matrix | `f_i = Σ_σ σ(α_i)f^σ`, coefficients `Tr(α_i a_n) ∈ ℤ`; `(σ(α_i))` invertible | True |
| §6.8 | Euler's identity; T | `h = x(1 − 16x) = q ∏_{m odd}(1 + q^m)^(−24)` through order 15; `u^(1/5) = 1 − (24/5)q + (348/25)q² − (4544/125)q³ + (52854/625)q⁴`; `u^(1/24) = 1 − q + q² − 2q³ + 2q⁴ − 3q⁵`; `λ(1 − λ) ↦ −λ/(λ − 1)²` under T | True |
| §6.9 | `n = 8, 16, 3` | 2-adic: `1, 1, 2, 1, 2, 2, 3, 1, 2` and `0, −1, −1, −3, −3, −4, −4, −7, −7`; 3-adic: `−1, −2, −4, −5, −6, −8, −9, −10, −13`; `(4 − a)m − v₂(m!) ≥ 1` for `a ≤ 3` | True |
| §7.7 | `F = (1, 0, 0)`, `ρ = 1 ⊕ σ`; two characters | `dim W₁ = 1`; a sum of two components with independent characters spans dimension 2, reducible | True |
| `vectorValued_component_congruence` (§7.11) | `n = 0`; odd k; uniform growth; `λ − √2` | no index; `F = 0`; `Γ(M)`-invariance makes `F_j ∣ g` M-periodic; traces `32x` and `−4` | True |
| `vectorValued_effective_mason` (§7.12), §7.13 | σ; fixed values | `det σ(R) = −6 + 7 = 1`, trace −1; `σ(T) = [[2, 1], [7, 3]]`, `X² − 5X − 1`, `e₊ = 5.19258`, `c = 0.26216`; `(cτ + d)^k ≠ 0` gives `ρ(γ)F = F` | True |
| §7 Examples | `B`; `μ = √2 − 1` | `B = [[−3, −2], [2, 1]]`, `B² = [[5, 4], [−4, −3]]`; `s = 0.5133`, `det ρ(T) = −1`, roots `is ± cos 2πμ`, `1/2 − μ = 0.08579`; `η⁴ = Q^(1/6)(1 − 4Q + 2Q² + 8Q³ − 5Q⁴)` | True |
| `quasiModularWeakAlgebra_differential_closure` (§8.2) | generators | `Df = ϑf + (k/12)E₂f`; `DE₂ = (E₂² − E₄)/12`; `E₂ = DΔ·Δ⁻¹`; `θ_qΔ = 2q² − 96q⁴` | True |
| §8.3, §8.4 | series | `E₀ = (1 − 16x)K₀ + 8∫K₀` through order 15; both sides `1 − 4q + 20q² − 64q³ + 164q⁴ − 392q⁵`; Catalan side and theta quotient both `1 + q − 4q² + 5q³ + 12q⁴ − 42q⁵` | True |
| `congruenceKernel_no_deficient_place` (§8.6) | `k ≤ 0`; another embedding | cusp forms vanish; conjugate form on `Γ(M)` again (rational structure stable); `E₄` excluded by the constant-term clause | True |
| `exists_deficient_finite_place` (§8.7) | `S = ∅`; `ρ = 1 ⊕ σ` | integral everywhere, congruence by the `𝓞_K` form of §7.11, contradiction; `(σ(T)^h − 1)g = 0` with no root-of-unity eigenvalue gives `g = 0` | True |
| §9.3, §9.1 Check | blow-up; `π ∘ ε = id` | `C² = E² = −1`, `C·E = 1`; `π_*ε_* = id` | Consistent |

### Duplication, ownership, overlaps

- Cross-roadmap citations resolved today by heading, and by statement where marked (s): QSeriesPartitionsAndMockModularForms §§5.2 (s), 8.1 (s), 8.4a (s); ModularCurvesPartII §§5.13, 5.14 (s), 6.3–6.5, 8.1 (s), 11.4 (s), 15.2 (s), 15.3 (s), 15.5, 15.6, 15.9, 15.10 (s); DiophantineApproximationAndTranscendencePartII §§4.1 (s), 4.2–4.4, 4.5 (s), 4.6–4.8; AlgebraicModularFormsAndSerreWeights §§1.5, 2.9 (s) and R15.1–R15.2 (the identifier sentence of its introduction); AutomorphicGaloisRepresentations §4.2 (s); GeometryOfNumbersAndQuadraticArithmetic §4.3 (the product and its specialization at its lines 1605–1607); ConformalMappingPartII §§0.3, 0.5, 1.4, 1.8 (s), 5.1, 5.5 (s), 5.8 (s), 9.19 (s); DiophantineApproximationAndTranscendence §§5.2–5.3; EtaleCohomologyFoundations §F.0.2; BelyiMaps Layers 6, 9; FuchsianOrbifolds Layer 2 items 3 (s) and 5, Layer 3 item 5 (s), Layers 4–5, Layer 6 item 1 (s); UniversalCovers (Completed) Stage 2; SpecialFunctionsTheta §§2.2, 4.2, 6.1, 6.2, 6.4 (s).
- ModularForms (main) is cited as Layer 0, Layer 4 and Worked examples, labels its README has since moved; its table of earlier labels (its lines 330–349) maps each to its present place (Tau Ceti parity, Tau Ceti newforms with §4.1, §0.2), so the citations stand. Layer 10 exists under its present name.
- The three declared gaps: same slugs in `design/plan.json` and under "## Exact supplier contracts", each one statement with its hypotheses and a named supplier section. ModularCurvesPartII §11.4 covers `p > 3` for `Γ₀(pⁿM)` only and §5.14 states no cusp rationality, so neither gap asks for what is provided.
- `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id dropped by a revision, no second copy on main.
- NoncongruenceModularForms (main) cites W1.2, W1.3, W1.5, W1.6, W1.8, W6.3–W6.5; all resolve through the former-numbering table (:26–36). It owns the strict form `wohlfahrt_strict` and the triangle-group presentation; this roadmap owns signed Wohlfahrt, as its Scope says (its lines 49–51, 161–163).
- No fully qualified name of `Suggested.lean` occurs in another roadmap: SpecialFunctionsTheta declares `modularLambda` in its own namespace, as a theta quotient.

Overlap check: read HalfIntegralWeightModularForms, DiophantineApproximationAndTranscendencePartII, SpecialFunctionsTheta, QSeriesPartitionsAndMockModularForms, SiegelModularForms, NoncongruenceModularForms, ModularForms, ConformalMappingPartII; λ with its laws, the mapping theorem and the hypergeometric identity are SpecialFunctionsTheta's and imported; the η-quotient presentation, the covering theorem and the integral series form are this roadmap's; geometric level, signed Wohlfahrt and the weak-form unbounded denominators theorem are this roadmap's and the strict level is NoncongruenceModularForms'; the general weak-form carrier, the η multiplier and the expansion with parabolic monodromy are QSeriesPartitionsAndMockModularForms'; holonomic germs and the rank bound are DiophantineApproximationAndTranscendencePartII's; the coverings `F_N` are ConformalMappingPartII's; HalfIntegralWeightModularForms and SiegelModularForms share nothing.

### Supplier order

```text
depcheck: 240 roadmaps, 2264 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. All 64 `*Needs:*` lines read; none cites a later roadmap or one of the never-cite list.

### Shape, style, copyright

- Nine layers, each ending with Examples and Dependencies; 15 definitions with API and at least three Checks; every theorem with hypotheses and a locator. No LaTeX delimiters, pull-request numbers, dates, machine paths or process words (searched). The closing order is R03.
- Arrangement against the contents of CDT25 (§§1–7, subsections 4.1–4.6 and 7.1–7.4): Layer 2 has no counterpart; Layer 3 joins §3 with §4.2; Layers 4 and 5 are §§4.4 and 4.3 in the opposite order, forced by the `*Needs:*` of §5.2; §§2, 5, 6 and 4.5–4.6 are suppliers' material; §7 is split over Layers 7–9. No run of layers maps onto a run of sections in order. The one borrowed heading word is R02.
- Wording: the 15 sampled passages and 7 more (Lemma 4.2.2 against §3.3, Remark 6.3.2 against §6.6, the proof of Theorem 7.3.3 against §7.9, Definition 7.3.1 against §7.3 and its docstring, (4.3.3) against §5.4, Theorem 7.4.10 against §9.3, KSV10 equation (1) against §1.8) set beside the sources. The longest shared run is 7 words, in the statement of §9.3, which the mathematics forces. No table, figure or list is taken over.

Source independence: 22 passages compared with 2 sources (CDT25, KSV10), none shared; largest share CDT25, 63 of 65 parenthesised locators; contents compared with CDT25: independent. Ihara1994 could not be read.

## Not verifiable

- Ihara1994, Theorem 1 and §4 (§9.2): settled as uncertified, cited by locator; not read.
- The proofs behind supplier statements still in open pull requests (DiophantineApproximationAndTranscendencePartII §4.5, ModularCurvesPartII Layer 15, SpecialFunctionsTheta §§6.2, 6.4, AlgebraicModularFormsAndSerreWeights §2.9) belong to those roadmaps' reviews; here they were resolved by heading and statement.
- SpecialFunctionsTheta is not among the names of the job's list of open pull requests; it was read through the roadmaps tool at head 76a507d. Ownership against open pull requests was checked with that tool at the index of 2026-11-15.

## Source issues

Only what was read at the text this round; the other items of the round 8 list were not re-read.

- **Misprint** in CDT25 at proof of Lemma 4.1.7, case (2), p.654: the source says the correcting diagonal is diag(p, 1/p) and the lower row of C is (cp, d); it should be diag(1/p, p) with lower row (c, pd), of determinant one; affects the proof.
- **Error** in CDT25 at the paragraph before Lemma 4.4.4, p.659: the source says reduction modulo p on the signed group has kernel the principal group of level Np; it should also contain elements congruent to −I modulo N; affects the proof.
- **Error** in CDT25 at §4.4, p.658: the source says conjugation by diag(p, 1) maps the signed level-N group with lower-left entry divisible by p to itself; it should map it onto the subgroup with upper-right entry divisible by p; affects the proof.
- **Misprint** in CDT25 at proof of Theorem 4.3.2, p.656: the source says the chosen form lies in the larger field at level 2Np; it should be an element of the field at level 2N outside the congruence field; affects the proof.
- **Error** in CDT25 at Proposition 3.0.1, p.650: the source says the dimension is at most a constant times N³ log N for every N; it should be log(2N), since the bound is zero at N = 1; affects nothing.
- **Error** in CDT25 at (1.0.4), p.629: the source says the function λ(1 − λ)/16 has level the group of matrices with even lower-left entry; it should be the theta group, its conjugate containing S, in the half-period parameter; affects nothing.
- **Error** in CDT25 at (1.1.5), p.631: the source says the squared theta series is a weight-one form for the principal group of level 2; it should carry the quadratic character of conductor 4, since −I lies in that group; affects nothing.
- **Error** in CDT25 at Corollary 7.3.4, p.691: the source says bounded denominators of all components give a congruence kernel of ρ; it should be that a principal congruence subgroup fixes the span of the values; affects a stated result.
- **Gap** in CDT25 at proof of Theorem 7.3.3, p.690: the source says the bundle has rank 6n and may be assumed irreducible; it should work with the continuation space of the one component, of dimension at most n; affects the proof.
- **Error** in CDT25 at §7.4.8, p.695: the source says a non-archimedean deficient place exists whenever the kernel of ρ is not congruence; it should require a noncongruence component with coefficients integral outside finitely many places; affects a stated result.
- **Misprint** in CDT25 at Lemma 7.4.4, pp.692–693: the source says the derivative in the half-period parameter sends Δ to E₂Δ; it should be 2E₂Δ, or the derivative in the full-period parameter; affects nothing.
- **Misprint** in KSV10 at proof of Proposition 3, the line after equation (1), p.6: the source says L is the transpose of T times a power of T times the inverse transpose; it should be the inverse transpose first and the transpose last; affects the proof.

## For the human reviewers

- **Scope.** This roadmap consumes SpecialFunctionsTheta (README :22, :95), another author's open pull request that is not in the merge-order file; its section numbers changed once between review rounds, and the two must merge in that order.
- **Scope.** NoncongruenceModularForms on main names ModularFormsPartII, which is not on main, as a supplier (its README :49, :161, :300).
- **Licence.** CDT25 was read in the authors' offprint, whose pages carry the publisher's notice "Copyright restrictions may apply"; the manifest classes it `author-page`.
- **Not tested.** Ihara1994 (§9.2) is cited by locator only; parts 1 and 2 of the copyright check were not run against it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9b547799549d0490383a325b508c1403344f9f80", "job": "REV-PKG-ModularFormsPartII~9", "model": "fable", "worker": "chris-x82"} -->
