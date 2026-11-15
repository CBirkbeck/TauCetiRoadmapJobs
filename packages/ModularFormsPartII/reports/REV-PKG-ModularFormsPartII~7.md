<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13003#issuecomment-6899516555 -->
Review (claude) of 3697b16

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) The Dependencies line of Layer 5 omits Layer 2

   **Location.** `packages/ModularFormsPartII/README.md:581`: "Layers 1, 3 and 4; ModularCurvesPartII §§5.14, 6.4, 6.5, 8.1; FuchsianOrbifolds Layer 5; Mathlib Chebyshev bounds."

   **Claim.** Layer 5 depends, among this roadmap's layers, on Layers 1, 3 and 4 only.

   **Witness.** README :539, `*Needs:*` of §5.1: "§§1.8, 2.2, 2.4, 3.6, 3.7"; README :563, `*Needs:*` of §5.4: "§§2.2, 3.1". Both name Layer 2 targets directly (the λ covering and the level-two function ring).

   **Exact repair.** Replace "Layers 1, 3 and 4" by "Layers 1–4". Tested on the witness: the eight internal sections named by the five `*Needs:*` lines of Layer 5 (§§1.7, 1.8, 2.2, 2.4, 3.1, 3.6, 3.7, 4.3) then all lie in the listed layers. The other eight Dependencies lines were checked the same way: each lists every layer of this roadmap that its `*Needs:*` lines name.

2. **F02** (P3) One letter is both the product index and the Fermat exponent in §6.9

   **Location.** `packages/ModularFormsPartII/README.md:664`: "For `n ∣ 8`, `u = λ^(1/n) = 16^(1/n) q^(1/n) ∏ ((1 + q^(2n))/(1 + q^(2n−1)))^(8/n)` is a scalar times an integral series".

   **Claim.** The displayed product is the n-th root of λ.

   **Witness.** Read with n fixed, as the exponent `8/n` requires, the product has no index: at `n = 8` it is the single factor `(1 + q¹⁶)/(1 + q¹⁵)`, while `(λ/16)^(1/8) = q^(1/8)(1 − q + 2q² − 3q³ + ⋯)`.

   **Exact repair.** Write the index as m: `u = λ^(1/n) = 16^(1/n) q^(1/n) ∏_{m≥1} ((1 + q^(2m))/(1 + q^(2m−1)))^(8/n)`. Tested at `n = 8`: `∏_{m≥1}(1 + q^(2m))/(1 + q^(2m−1)) = 1 − q + 2q² − 3q³ + 4q⁴ − ⋯`, integral, and its eighth power is `1 − 8q + (16 + 28)q² − ⋯ = 1 − 8q + 44q² − ⋯ = x/q` (§2.1). The same formula in §§2.1, 6.2 and 6.8 already has an index distinct from every parameter.

3. **F03** (P3) Page of CDT Lemma 4.2.3 in §5.1

   **Location.** `packages/ModularFormsPartII/README.md:535`: "(CDT, proof of Theorem 4.3.2, pp.656–657; Lemma 4.2.3, p.656)".

   **Claim.** Lemma 4.2.3 is on p.656.

   **Witness.** CDT25 line 1766: the statement of Lemma 4.2.3 (lines 1766–1771) is wholly on p.655; p.656 begins at CDT25 line 1772 and carries only its proof. README :453 and :461 cite the same lemma as "pp.655–656".

   **Exact repair.** Write "Lemma 4.2.3, pp.655–656", as §§3.6 and 3.7 do. The part §5.1 uses (the rational model of `Y(2N)` with its rational cusp, and `M₂N` as its function field) is in the statement on p.655 and in the proof on p.656 (CDT25 lines 1767 and 1778–1784), so the two-page locator is the exact one.

4. **F04** (P3) A §7.3 API bullet quantifies over an unused subgroup and uses an undefined carrier

   **Location.** `packages/ModularFormsPartII/README.md:710`: "For a finite-index subgroup `Γ′` and `M ≥ 1`, the function `τ ↦ F(Mτ)` is a vector-valued form for `SL₂(ℤ) ∩ diag(M, 1)⁻¹SL₂(ℤ)diag(M, 1)` with the conjugated representation".

   **Claim.** The bullet states a fact about a subgroup `Γ′`, in terms defined in §7.3.

   **Witness.** `Γ′` occurs nowhere else in the bullet. §7.3 (:702) defines vector-valued forms for representations of `SL₂(ℤ)` only, so "a vector-valued form for" a proper subgroup is undefined; and the conjugated representation is not written. §7.11 (:798) relies on this bullet.

   **Exact repair.** Replace the bullet by: "For `M ≥ 1`, the function `τ ↦ F(Mτ)` satisfies `F(Mγτ) = (cτ + d)^k ρ(AγA⁻¹) F(Mτ)` for `A = diag(M, 1)` and every `γ = [[a, b], [c, d]]` in `Γ₀(M) = SL₂(ℤ) ∩ A⁻¹SL₂(ℤ)A`, where `AγA⁻¹ = [[a, Mb], [c/M, d]]`. Inducing from `Γ₀(M)` to `SL₂(ℤ)` as in §7.5, with the representation `γ ↦ ρ(AγA⁻¹)` in place of the trivial one, gives a vector-valued form for `SL₂(ℤ)` that has `τ ↦ F(Mτ)` among its blocks of components; its `ρ(T)` is semisimple, because every parabolic element of `SL₂(ℤ)` is conjugate to `±T^m`." Tested at `M = 2`: `A[[1, 0], [2, 1]]A⁻¹ = [[1, 0], [1, 1]]` and `ATA⁻¹ = T²` are integral, and the automorphy factor is `(c/M)(Mτ) + d = cτ + d`; `[[1, 0], [1, 1]] ∉ Γ₀(2)` gives `[[1, 0], [1/2, 1]]`, not integral, so the subgroup is exactly `Γ₀(M)`.

Four findings, all P3 and none mathematical: a Dependencies line, a clashing index in a formula, a page number, and one API bullet. The four findings of round 6 are repaired. `Suggested.lean` elaborates with `sorry` as its only warning, no theorem closes under the one-tactic probe, the dependency check reports no problem, and every statement I recomputed holds. No package file and no manifest entry was changed; no source was fetched.

## Verified sound

### Round 6 findings

| Finding | Repaired passage | State |
|---|---|---|
| F01 (P2), λ with two owners | Scope (:22): "SpecialFunctionsTheta owns the theta constants `θ₂, θ₃, θ₄` and the modular function λ … Kept here, each in one clause: the η-quotient presentation of λ …"; contract `### From TauCetiRoadmap.SpecialFunctionsTheta` (:95–97); §2.1 (:278) "Prove that on `ℍ` this η quotient is the modular function `λ = (θ₂/θ₃)⁴` of SpecialFunctionsTheta §5.1"; §§2.2, 2.6, 2.7 cite §§5.1–5.3 | Repaired. Each imported statement was found at that roadmap's open head: products and non-vanishing (§2.2), 20.7.5 (§4.1), the three laws, `λ ∉ {0, 1}` and the imaginary axis (§5.1), the bijection of F with boundary and cusp values and 20.11.5 (§5.3); same nome `q = e^{iπτ}` |
| F02 (P3), W6.5 moved | Scope (:26–36): table "Former numbering / Section", seven rows | Repaired. All 63 `W` headings of `design/README.md` compared with the 64 section headings: exactly these seven moved, §3.0 is new without a former id |
| F03 (P3), page of Theorem 5.1.4 | §2.7 (:340): "Theorem 5.1.4, p.668" | Repaired (CDT25 line 2382, p.668) |
| F04 (P3), §7.3 Check | :720: "For `n = 1` and ρ a character of finite order with `ρ(−I) = 1`, the definition gives the holomorphic f … that are weak forms of §1.1 on the kernel of ρ, poles at `∞` allowed" | Repaired; both directions hold since `|f(τ + 1)| = |f(τ)|` for a finite-order character |

The repair's one deviation from round 6 is right: the product formula of §2.1 needs Euler's identity, not the triple product (computed below), and `TauCeti.tprod_one_add_pow_mul_tprod_one_sub_pow_odd` exists at the pin with the cited statement.

### Elaboration, signatures, padding

- `lake env lean` on `packages/ModularFormsPartII/Suggested.lean` from the content checkout: exit 0, 13 warnings, all `declaration uses sorry` (lines 75, 97, 145, 164, 171, 181, 195, 211, 242, 257, 285, 309, 324). Imports: `import Mathlib` and `TauCeti.NumberTheory.ModularForms.QExpansion.Laurent`, used by four declarations. No `set_option`, no sorried data, no `lemma`, no `variable` (so no binder can be lost).
- `#check @name` for all 22 declarations on a scratch copy; each type compared with its README statement and with the supplied elaborated signatures: no difference. `laurentQExpansion` takes a real period; `2 * N` is cast.
- One-tactic probe on all 13 theorems (`first | rfl | simp | infer_instance | trivial | simp [the nine definitions]`): 13 `sorry` remain, none closes. None restates a definition, mirrors a Check or computes a small value.
- Headlines of the Summary against the file: Wohlfahrt, the λ covering, the rank bound, nonabelian Ihara, `R₂N = M₂N`, both unbounded-denominator theorems, Galois conjugation, component congruence, Mason, quasimodular closure and both deficient-place theorems are stated. Degree doubling and leveraging (§§5.3, 5.5), the three-point theorems (§§7.1–7.2) and the fundamental group (§9.3) are named in the module docstring with their reasons, which I accept.
- Every backticked name of this roadmap's own in the README is declared (22 of 22) and every declared name appears in the README.

### Library declarations opened at the pins

By `#check` in one scratch file, 53 names, all present: Tau Ceti `tprod_one_add_pow_mul_tprod_one_sub_pow_odd` (`Analysis/SpecialFunctions/QPochhammer.lean:230`, `‖q‖ < 1 → (∏' n, (1 + q^(n+1))) * ∏' n, (1 − q^(2n+1)) = 1`), `UpperHalfPlane.laurentQExpansion` (`QExpansion/Laurent.lean:130`) with `_of_analyticAt` (:193), `_mul` (:288), `_inv`, `orderTop_` (:235), `_eq_laurentQExpansion_iff`, `Subgroup.integerCuspWidth`, `_pos`, `CongruenceSubgroup.Gamma_le_Gamma_of_dvd`, `char_neg_one_of_modFormCharSpace_ne_bot`; Mathlib `ModularForm.SL_slash`, `OnePoint.IsBoundedAt`, `UpperHalfPlane.IsBoundedAtImInfty`, `atImInfty`, `Gamma0`, `Gamma1`, `IsCongruenceSubgroup`, `Gamma_normal`, `Gamma_zero_bot`, `Subgroup.IsArithmetic`, `isArithmetic_iff_finiteIndex`, `cuspFunction`, `qExpansion`, `ModularForm.eta`, `eta_ne_zero`, `logDeriv_eta_eq_E2`, `discriminant`, `discriminant_ne_zero`, `CuspForm.discriminant`, `discriminant_qExpansion_coeff_one`, `instGCommRing`, `jacobiTheta`, `jacobiTheta_S_smul`, `jacobiTheta_T_sq_smul`, `jacobiTheta₂`, `EisensteinSeries.E2`, `Derivative.normalizedDerivOfComplex`, `serreDerivative`, `serreDerivativeMF`, `normalizedDerivOfComplex_E₂`, `Subgroup.normalCore`, `Subgroup.goursat_surjective`, `Chebyshev.theta_ge`, `theta_le_log4_mul_x`, `pi_ge`, `IsCoveringMapOn`, `MeromorphicAt`, `Module.End.IsSemisimple`, `NumberField.FinitePlace`, `InfinitePlace`, `SlashInvariantForm`, `CuspForm`. The pinned libraries have no Wohlfahrt theorem, λ function, weak-form predicate, vector-valued or quasimodular carrier (searched by object).

### Seeded source sample (CDT25; journal page = extraction page + 626)

| Target | Read at | Result |
|---|---|---|
| 1.4 | Lemma 4.2.2, p.655, lines 1745–1754; Lemma 7.4.4, pp.692–693, lines 3900–3910 | `fΔ^m` holomorphic at the cusps for large m; supported |
| 1.5 | Lemma 4.1.3, p.653, lines 1576–1581 | Source: widths divide N; the README's exact lcm is its own strengthening and holds (stabilizers `E × aℤ`, `E × bℤ`) |
| 1.6 | Lemma 4.1.4, p.653, lines 1582–1587 | Supported |
| 1.7 | Notation 4.1.5, Lemma 4.1.7, pp.653–655, lines 1588–1729 | Supported; the source's second-case matrix is misprinted, as the README says (Source issues) |
| 3.0 | §4.2, p.655, lines 1730–1744 | `ℚ(λ)`-spans inside `ℚ((q^(1/N)))`; supported |
| 3.3 | Lemma 4.2.2, p.655 | Supported; Shimura's theorem there is AlgebraicModularFormsAndSerreWeights §2.9 here |
| 3.6 | Lemma 4.2.3, pp.655–656, lines 1766–1792 | Supported |
| 4.2 | Lemma 4.4.4, pp.659–660, lines 1944–1996 | Supported; the signed reduction kernel is larger than `Γ(Np)`, as the README says |
| 5.1 | pp.656–657, lines 1819–1827; Lemma 4.2.3 | Supported; page slip R03 |
| 5.3 | Theorem 4.3.2, pp.656–657, lines 1816–1830 | Supported; the element is taken at the old level, as the README says |
| 6.9 | p.628, lines 85–97; §1.1.3, p.631, lines 213–221 | Supported: congruence for 8, noncongruence for `n ∉ {1, 2, 4, 8}` |
| 7.14 | Remark 7.2.3, p.688, lines 3617–3653 | Order `k + 1`, `Sym^k`, Stiller and Zagier cited there; supported |
| 8.3 | §7.4.2, p.693, lines 3934–3949 | Series `1 − 4q + 20q² − ⋯` agrees; the source's relation has the wrong sign, as the README says |
| 8.7 | §7.4.8, p.695, lines 4055–4084 | The README's corrected statement; source claim noted under Source issues |
| 9.3 | Theorem 7.4.10, p.696, lines 4118–4133 | Hypotheses and conclusion agree |

No locator is flagged unverified by the author. Also read: Theorem 1.0.1 (line 25), Definition 7.3.1 (3663–3687), Theorem 7.3.3 and Corollary 7.3.4 (3766–3823), Definition 4.2.1 (1734–1740); KSV10 equation (1) and the factorization after it (KSV10 lines 240–258). The manifest records the three cited works, one key each.

### Adversarial table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §2.1 product formula | η exponents; series | `q^((1+8−6)/24·8) = q`; `∏(1 − q^(2n−1))⁸(1 + q^(2n))¹⁶`, Euler turns it into `∏((1 + q^(2n))/(1 + q^(2n−1)))⁸`; coefficients `1, −8, 44, −192, 718, −2400` | True |
| §2.1 η quotient = `(θ₂/θ₃)⁴` on `ℍ` | `τ = 0.3 + 0.8i` | Both `0.7660028750 + 0.4097863253i`; at `τ + 1`: `−0.0508247897 − 1.8402517943i = λ/(λ − 1)`; at `−1/τ`: `0.2339971250 − 0.4097863253i = 1 − λ`; at `2τ`: `−0.0278242 + 0.1029613i` (wrong nome excluded) | True; SpecialFunctionsTheta §5.1 records the same digits |
| `Γ(2)` generation and invariance (§2.1) | `ST⁻²S⁻¹`; `τ/(2τ + 1)` at `0.3 + 0.8i` | `[[0, −1], [1, −2]]·[[0, 1], [−1, 0]] = [[1, 0], [2, 1]]`; `λ = 0.7660029 + 0.4097863i` again; a odd, c even forbids `|a| = |c|`, so the reduction ends at `c = 0` | True |
| `modularLambda_covering` (§2.2) | boundary of D; `Ti`; `−I` | `λ(i) = 0.5`, `λ(1 + i) = −1`, `λ((1 + i)/2) = 2`; `S(−1 + it) = (1 + it)/(1 + t²)` on `|w − 1/2| = 1/2`; `[[1, 0], [2, 1]](−1) = 1`; `λ(Ti) = −1 ≠ 1/2`, `T ∉ Γ(2)` | Range, covering and fibres consistent in both directions |
| §2.3 inverse series | composition | `a₃ = 2·64 − 44 = 84`; `a₄ = 2560 − 1760 + 192 = 992`; `a₅ = 57344 − 59136 + 5808 + 9216 − 718 = 12514` | True |
| §2.6 | ODE; `τ₀ = (8 + 2i)/17`; character | `(n+1)²a_{n+1} = 4(2n+1)²a_n`; `λ(τ₀) = 0.0294373`, `K₀ ≈ 1.00748`, `θ₃(τ₀)² = 1.0074837 + 4.0299349i = (1 + 4i)θ₃(2i)²`; `(−i)(−1/τ − 2)(−iτ) = 2τ + 1`, `χ₋₄(1) = 1` | True near `∞` only, as stated |
| §2.7 | derivative; radii | `λ′(i) = 1.0942198i`, `F₂′(0) = 4.3768792 = Γ(1/4)⁴/(4π²)`; `γ₃ = 2.5810565 > 2.5198421`; punctures 5 ≠ 6, 6 ≠ 12 | True |
| `lambdaField` (§3.0) | `√2`; `N ∣ M` | A constant in `ℚ(s)`, s transcendental over `ℂ`, is rational; `t_N ↦ t_M^(M/N)` sends generator to generator | Definition determines `ℚ(λ)` |
| §3.3 | `f = Δ⁻¹`, `m = 1` | `1 · Δ⁻¹` has `q`-order −2 | True |
| §3.6 | products | Generator × generator on `G ∩ H`, level `lcm` (§1.5); injective endomorphism of a finite-dimensional space is onto | True |
| §1.5, §1.6 | `Γ₀(p) ∩ Γ(2)`; core | Widths `lcm(1, 2) = 2` at `∞`, `lcm(p, 2) = 2p` at `0`; core = finite intersection of conjugates | True |
| §1.7 | `p = 2`, both cases | `[[−1, 2], [−2, 3]] ↦ [[−1, 1], [−4, 3]] = CTC⁻¹`; `[[−3, 8], [−2, 5]] ↦ [[−3, 4], [−4, 5]] = CT⁴C⁻¹`; `diag(p, 1/p)U(x)diag(1/p, p) = U(p²x)` | True |
| `wohlfahrt_Gamma_le` (§1.8) | `N = 0`; KSV10 L at `a = 2` | `Γ(0) = ⊥`; `(Tᵗ)⁻¹T^(a−1)Tᵗ = [[a, a−1], [1−a, 2−a]]`, at 2: `[[2, 1], [−1, 0]]`; printed order gives `[[0, 1], [−1, 2]]` | True |
| `nonabelian_ihara`, §§4.2–4.3 | `c([[1, 0], [6, 1]])`; kernels | `[[1, 0], [3, 1]] ∉ Γ₀(2)`; `ker(f₁, π) = G ∩ Γ(Np)`, `ker f₂ = A⁻¹GA ∩ D`, images `1 × S × 1` and `S × 1 × B` generate | True |
| §5.1, §5.3, §5.4 | `N = 2, 3`; `p`-scaling | Degrees `(64/12)(3/4) = 4`, `(216/12)(3/4)(8/9) = 12`; `t_N(pτ) = t_{Np}^(p²)`; tower law | True |
| `boundedDenominatorSpan_eq_congruenceSpan`, `_finrank_le` | both inclusions; `N = 1` | ⊇: `H = ±Γ(2N)`, weight 0; ⊆: §6.4 then §1.8 on `⟨H, Γ′⟩`; degree 1 needs `C ≥ 1/log 2 = 1.443` | True |
| `unbounded_denominators`, `algebraicInteger_…`, `weakForm_galois_conjugate` | `Δ`; `√2Δ⁻¹`; odd weight | Integral and congruence; conjugate `−√2Δ⁻¹`, period kept; `−I ∈ Γ`, k odd gives `f = 0`; traces of `λ − √2`: `32x`, `−4` | True |
| §6.8, §6.9 | roots; valuations | `u^(1/5) = 1 − 24/5 q + 348/25 q² − 4544/125 q³ + 52854/625 q⁴`; `u^(1/24) = 1 − q + q² − 2q³ + 2q⁴ − 3q⁵`; `n = 8`: `1, 1, 2, 1, 2, 2, 3, 1, 2`; `n = 16`: `0, −1, −1, −3, −3, −4, −4, −7, −7` | True; notation R02 |
| `IsVectorValuedForm`, §§7.11–7.13 | `F = (1, 0, 0)`; σ; `γ = −I` | `σ(R)`: trace −1, det 1, `σ(R)² = [[−3, −1], [7, 2]]`; `σ(T) = [[2, 1], [7, 3]]`, `X² − 5X − 1`; `(−1)^k F = F`; growth uniform in `Re τ` once `Γ(M)` fixes `F_j` | True; bullet R04 |
| §7.14 | `H′`, cusp 1 | `−gT²g⁻¹ = [[1, −2], [2, −3]]`; `B = [[−3, −2], [2, 1]]`, trace −2, `B² = [[5, 4], [−4, −3]]`; Wronskian `∏ i! · h^(k+1)(τ′)^(k(k+1)/2)` | True |
| `quasiModularWeakAlgebra_differential_closure` | generators | `Df = ϑf + (k/12)E₂f`, `DE₂ = (E₂² − E₄)/12`, `E₂ = DΔ·Δ⁻¹`; `E₂ ∣[2] S = E₂ + 6/(πiτ)` | True |
| §8.3, §8.4 | series | `E₀ = 1 − 4q + 20q² − 64q³ + 164q⁴ − 392q⁵`; `(1 − 16x)K₀ + 8∫K₀ = 1 − 4x − 12x²`; `Σ C_n²xⁿ = 1 + q − 4q² + 5q³ + 12q⁴ − 42q⁵`; theta quotient `(4/16q)(4q + 4q²) = 1 + q` | True |
| `HasCuspidalExpansionOver`, §§8.6–8.7 | Δ; `E₄`; `k ≤ 0`; `S = ∅` | `|τ(m)| ≪ m^(11/2+ε)`; `240m³` exceeds `m^(3/2+ε)`; cusp forms of weight ≤ 0 vanish, `C = 0`; bounded on S gives an `𝓞_K`-integral multiple, contradiction by §7.11 | True |
| §9.1 Check, §9.3 | blow-up | `C² = E² = −1`, `C·E = 1`; `π_*ε_* = id` | Consistent |
| Former-numbering table | 63 design headings | 7 moved; NoncongruenceModularForms' "W6.3–W6.5" resolves to §§6.3, 6.4, 6.6 | Consistent |

### Duplication and ownership

- No pinned declaration states any of the 13 theorems or the 9 definitions.
- Cross-roadmap citations resolved now, at main or the supplier's open head: SpecialFunctionsTheta §§2.2, 4.1, 5.1, 5.2, 5.3; FuchsianOrbifolds Layer 2 items 3 and 5, Layers 3–6 and Layer 6 item 1; ConformalMappingPartII §§0.3, 0.5, 1.4, 1.8, 5.1, 5.5, 5.8, 9.19; DiophantineApproximationAndTranscendencePartII §§4.1–4.8; ModularCurvesPartII §§5.13, 5.14, 6.3–6.5, 8.1, 11.4, 15.2, 15.3, 15.5, 15.6, 15.9, 15.10; QSeriesPartitionsAndMockModularForms §§5.2, 8.1, 8.4a; AlgebraicModularFormsAndSerreWeights §§1.5, 2.9 and its identifiers R15.1–R15.2; AutomorphicGaloisRepresentations §4.2; EtaleCohomologyFoundations §F.0.2; DiophantineApproximationAndTranscendence §§5.2–5.3; GeometryOfNumbersAndQuadraticArithmetic §4.3; BelyiMaps Layers 6 and 9 (also at the head of the open revision of BelyiMaps); UniversalCovers Stage 2. ModularForms on main has renumbered: its table of earlier layer labels maps "Layer 0", "Layer 4" and "Worked examples, target η²⁴ = Δ" to their present places, so the citations here stay valid; Layer 10 is the analytic modular curve.
- NoncongruenceModularForms (main) cites this roadmap for W1.2, W1.3, W1.5, W1.6, W1.8 and W6.3–W6.5 and nothing else; all resolve through the table. Its strict Wohlfahrt theorem and its `ModularForm`-carrier statement are its own by its Scope; the fully qualified names differ.
- The three declared gaps are precise, name a supplier and section, and have the same slugs in `design/plan.json` and under `## Exact supplier contracts`.
- `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, no second copy on main.

Overlap check: read HalfIntegralWeightModularForms, SpecialFunctionsTheta, DiophantineApproximationAndTranscendencePartII, QSeriesPartitionsAndMockModularForms, SiegelModularForms, NoncongruenceModularForms, ModularForms, ConformalMappingPartII; λ, its laws, the bijection of the `Γ(2)` region and 20.11.5 are SpecialFunctionsTheta's and are imported, the η-quotient presentation, the covering and the integral series form are this roadmap's; signed Wohlfahrt and the weak-form unbounded denominators theorem are this roadmap's by NoncongruenceModularForms' own Scope; the weak-form carrier and the η multiplier are QSeriesPartitionsAndMockModularForms §§8.1, 5.2; the η transformation is ModularForms'; the rank bound and the coverings `F_N` are the suppliers'.

### Supplier order

```text
depcheck: 246 roadmaps, 2250 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. All 64 `*Needs:*` lines read; none cites a later roadmap or a roadmap of the never-cite list. SpecialFunctionsTheta is another author's open pull request that adds a new roadmap folder, so it may be consumed; it does not cite this roadmap.

### Shape, style, copyright

- Nine layers, each ending with Examples and Dependencies; every definition has its API and at least three Checks; no LaTeX delimiters, pull-request numbers, machine paths, HTML anchors or process words (searched); "lemma" occurs only in "Ihara lemma" and source locators.
- The layers are not the article's sections: CDT §§2, 5 and 6 are suppliers' material, Layer 3 joins CDT §3 with §4.2, Layer 4 (CDT §4.4) precedes Layer 5 (CDT §4.3) because §5.2 needs §4.3 here, and CDT §7 is split over Layers 7–9.
- Wording: the 15 sampled passages and 6 more (Theorem 1.0.1 against §6.3 and its docstring, Definition 7.3.1 against §7.3, Theorem 7.3.3 against §7.11, Lemma 7.4.4 against §8.2, §7.4.8 against §8.5, KSV10 equation (1) against §1.8) set beside the sources: no sentence or proof plan follows a source's wording; the growth clause of §7.3 is a list of hypotheses that can be written one way. No table, figure or list is taken over.

Source independence: 21 passages compared with 2 sources (CDT25, KSV10), none shared; largest share CDT25, 63 of 66 parenthesised locators; contents compared with CDT25: independent. Ihara1994 could not be read.

## Not verifiable

- Ihara1994, Theorem 1 and §4 (§9.2): settled as uncertified, cited by locator; the text was not read.
- The proofs behind the supplier statements still in open pull requests (DiophantineApproximationAndTranscendencePartII §4.5, ModularCurvesPartII Layer 15, SpecialFunctionsTheta §5.3) were resolved by heading and contract sentence; they are those roadmaps' reviews. ConformalMappingPartII is on main.
- Whether SpecialFunctionsTheta merges before this roadmap: it is not in the merge order file.

## Source issues

- **Misprint** in CDT25 at proof of Lemma 4.1.7, case (2), p.654: the source says the correcting diagonal is diag(p, 1/p) and the lower row of C is (cp, d); it should be diag(1/p, p) with lower row (c, pd), of determinant one; affects the proof.
- **Error** in CDT25 at the paragraph before Lemma 4.4.4, p.659: the source says reduction modulo p on the signed group of level N with lower-left entry divisible by p has kernel the principal group of level Np; it should also contain elements congruent to −I modulo N; affects the proof.
- **Misprint** in CDT25 at §7.4.2, p.693: the source says the second elliptic integral equals (16x − 1) times the first minus eight times its integral; it should be (1 − 16x) times the first plus eight times its integral; affects nothing.
- **Error** in CDT25 at §7.4.2, p.693: the source says every even-degree theta monomial is modular for the principal group of level 12; it should exclude monomials such as the product of the second and third constants, which changes sign under T¹²; affects nothing.
- **Misprint** in CDT25 at proof of Theorem 4.3.2, p.656: the source says the chosen form lies in the larger field at level 2Np; it should be an element of the field at level 2N outside the congruence field; affects the proof.
- **Error** in CDT25 at Corollary 7.3.4, p.691: the source says bounded denominators of all components give a congruence kernel of ρ; it should be that a principal congruence subgroup fixes the span of the values; affects a stated result.
- **Error** in CDT25 at §7.4.8, p.695: the source says a non-archimedean deficient place exists whenever the kernel of ρ is not congruence; it should require a noncongruence component with coefficients integral outside finitely many places; affects a stated result.
- **Misprint** in CDT25 at Lemma 7.4.4, pp.692–693: the source says the derivative in the half-period parameter sends Δ to E₂Δ; it should be 2E₂Δ, or the derivative in the full-period parameter; affects nothing.
- **Error** in CDT25 at §4.4, p.658: the source says conjugation by diag(p, 1) maps the signed group of level N with lower-left entry divisible by p to itself; it should map it onto the subgroup with upper-right entry divisible by p; affects the proof.
- **Gap** in CDT25 at proof of Theorem 7.3.3, p.690: the source says the bundle has rank 6n and may be assumed irreducible; it should work with the continuation space of the one component, of dimension at most n; affects the proof.
- **Misprint** in KSV10 at proof of Proposition 3, the line after equation (1), p.6: the source says L is the transpose of T times a power of T times the inverse transpose; it should be the inverse transpose first and the transpose last; affects the proof.

## For the human reviewers

- **Scope.** This roadmap now consumes SpecialFunctionsTheta (README :22, :95), another author's open pull request that is not in the merge order file; the two must merge in that order, or the λ statements return to §2.1.
- **Scope.** NoncongruenceModularForms on main names ModularFormsPartII, which is not on main, as a supplier (its README :49, :161, :300).
- **Licence.** CDT25 was read in the authors' offprint, which carries the publisher's notice "Copyright restrictions may apply"; the manifest classes it `author-page`.
- **Not tested.** Ihara1994 (§9.2) is cited by locator only; parts 1 and 2 of the copyright check were not run against it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3697b167aaca6ccb82c46ce6f0259426fd82f83d", "job": "REV-PKG-ModularFormsPartII~7", "model": "fable", "worker": "chris-x89"} -->
