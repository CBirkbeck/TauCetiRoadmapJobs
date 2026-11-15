<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13003#issuecomment-6901205097 -->
Review (claude) of 5e81783

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) SpecialFunctionsTheta is cited by section numbers its current head no longer has

   **Location.** `packages/ModularFormsPartII/README.md:97`: "§2.2: the theta-constant products … §4.1: Jacobi's quartic identity … §5.1: `λ = k² = (θ₂/θ₃)⁴` … §5.3: λ maps `F` … bijectively". The same numbers at :22, :278, :280, :285–287, :296, :302, :304, :332, :334, :336, :342, :344, :359, and `packages/ModularFormsPartII/Suggested.lean:86–87` ("SpecialFunctionsTheta (§5.1, same nome)").

   **Claim.** At SpecialFunctionsTheta's head, §2.2 has the theta-constant products, §4.1 the quartic identity, §5.1 λ with its laws, §5.2 Jacobi's inversion, §5.3 the mapping theorem and `F(1/2, 1/2; 1; λ) = θ₃²`.

   **Witness.** SpecialFunctionsTheta README at its open head (76a507d): "### 5.1 Logarithmic derivatives", "### 5.2 Double products", "### 5.3 Power series", "### 4.1 Jacobi's triple product in theta form"; λ is "## Layer 6", §§6.1, 6.2, 6.4. It gives no table of former numbers.

   **Exact repair.** Replace the section numbers as follows, everywhere they cite SpecialFunctionsTheta (the statements imported do not change):

   | Imported statement | Cited as | At the current head |
   |---|---|---|
   | Products of `θ₂, θ₃, θ₄` at `z = 0`, non-vanishing on `ℍ` | §2.2 | §4.2 |
   | `θ₃⁴ = θ₂⁴ + θ₄⁴` | §4.1 | §2.2 |
   | `λ = k²`, `1 − λ = k′²`, holomorphy, `λ ∉ {0, 1}`, the three laws; `λ(it)` real in `(0, 1)`, continuous, limits 0 and 1; Jacobi's inversion; the value at `0.3 + 0.8i` | §5.1 (and "§5.2" for the inversion) | §6.1 |
   | Bijection of `F` onto `ℂ ∖ ((−∞, 0] ∪ [1, ∞))`, boundary values, cusp values | §5.3 | §6.2 |
   | `F(1/2, 1/2; 1; λ(τ)) = θ₃(τ)²` on `F` | §5.3 | §6.4 |

   Line by line: :22 "(§2.2)" → "(§4.2)", "(§4.1)" → "(§2.2)", "(§5.1)" → "(§6.1)", "… boundary and cusp values, and `F(1/2, 1/2; 1; λ(τ)) = θ₃(τ)²` there (§5.3)" → "… boundary and cusp values (§6.2), and `F(1/2, 1/2; 1; λ(τ)) = θ₃(τ)²` there (§6.4)". :97 "§2.2:" → "§4.2:", "§4.1:" → "§2.2:", "§5.1:" → "§6.1:", "(Jacobi's inversion, proved with §5.2 there)" → "(Jacobi's inversion, also §6.1 there)", "§5.3: λ maps" → "§6.2: λ maps", and before "`F(1/2, 1/2; 1; λ(τ)) = θ₃(τ)²` on F" insert "§6.4:". :278 "§5.1" → "§6.1", "(§2.2 there)" → "(§4.2 there)", "§§4.1, 5.1" → "§§2.2, 6.1", "§5.3" → "§6.2". :280 "§§2.2, 4.1, 5.1, 5.3" → "§§2.2, 4.2, 6.1, 6.2". :285, :286, :287, :296 "§5.1" → "§6.1". :302 "§5.3" → "§6.2", "§5.1" → "§6.1". :304 "§§5.1, 5.3" → "§§6.1, 6.2". :332 "§5.3" → "§6.4". :334 "region of SpecialFunctionsTheta §5.3" → "§6.2", "so SpecialFunctionsTheta §5.3 gives" → "§6.4 gives". :336 "§5.3" → "§§6.2, 6.4". :342 and :344 "§§5.1–5.2" → "§6.1". :359 "§§2.2, 4.1, 5.1–5.3" → "§§2.2, 4.2, 6.1, 6.2, 6.4". `Suggested.lean:87` "(§5.1, same nome)" → "(§6.1, same nome)"; a docstring only, so the elaboration is unaffected.

   Tested on the witness: at that head §6.1 states `λ(τ + 2) = λ(τ)`, `λ(τ + 1) = λ(τ)/(λ(τ) − 1)`, `λ(−1/τ) = 1 − λ(τ)`, `λ ∉ {0, 1}`, and its Checks record `λ(0.3 + 0.8i) = 0.76600 28750 45… + 0.40978 63252 79… i` and `λ(1.3 + 0.8i) = −0.05082 47896 57… − 1.84025 17943 33… i`, the digits of the Check at :296; §6.2 states the bijection of `F = {0 < Im τ, |Re τ| < 1, |τ ± 1/2| > 1/2}` with the boundary lines, semicircles and the cusp limits `0, 1, ∞` at `i∞, 0, ±1`; §6.4 states the hypergeometric identity on `F + 2n`; §2.2 states the quartic identity; §4.2 the constants' products and non-vanishing. Its Scope lists the imaginary-axis facts under 6.1 and still does not state the covering theorem, so the ownership split of :22 stands.

2. **F02** (P3) Dependencies lines of Layers 2, 3, 5, 6, 7 and 9 omit suppliers their `*Needs:*` lines name

   **Location.** `packages/ModularFormsPartII/README.md:851`: "Layers 1–3 and 6; DiophantineApproximationAndTranscendencePartII §§4.1, 4.2, 4.5; … UniversalCovers Stage 2; FuchsianOrbifolds Layers 2, 6." Also :359, :486, :581, :678, :1022.

   **Claim.** Each Dependencies line lists what the layer's targets need.

   **Witness.** :704 `*Needs:*` "Mathlib `Module.End.IsSemisimple` … Tau Ceti `TauCeti.char_neg_one_of_modFormCharSpace_ne_bot`"; :784 "gap:udc-bombieri-andre-katz"; :792 Mathlib `ModularForm.discriminant`. Line :851 names neither Mathlib, Tau Ceti nor the gap. This is the pattern of round 7's F01, whose repair added `CongruenceSubgroup.Gamma0` to Layer 5 on this ground.

   **Exact repair.** Append, before the final full stop:

   - Layer 2 (:359): after "Tau Ceti Euler's identity (`TauCeti.tprod_one_add_pow_mul_tprod_one_sub_pow_odd`)" add "and parity (`TauCeti.char_neg_one_of_modFormCharSpace_ne_bot`)".
   - Layer 3 (:486): "; Mathlib `LaurentSeries`, `Subfield.closure` and `CongruenceSubgroup.Gamma`".
   - Layer 5 (:581): after "ModularCurvesPartII §§5.14, 6.4, 6.5, 8.1" add "and gap:udc-rational-cusp-of-twisted-full-level".
   - Layer 6 (:678): "; Mathlib η, Δ, `q`-expansion and congruence-subgroup API, `IsAlgebraic` and `IntermediateField`".
   - Layer 7 (:851): after "DiophantineApproximationAndTranscendence §§5.2–5.3" add "and gap:udc-bombieri-andre-katz"; append "; Mathlib `Module.End.IsSemisimple`, `ModularForm.discriminant` and `ModularForm.discriminant_ne_zero`; Tau Ceti `TauCeti.char_neg_one_of_modFormCharSpace_ne_bot`".
   - Layer 9 (:1022): after "ModularCurvesPartII §§5.13, 6.3 and Layer 11" add "with gap:udc-all-prime-cuspidal-model-of-full-level".

   Tested by script on the 64 `*Needs:*` lines: with these additions every supplier family a layer's `*Needs:*` lines name (Mathlib, Tau Ceti, each roadmap, each gap) occurs on that layer's Dependencies line; Layers 1, 4 and 8 already pass.

3. **F03** (P3) `u` in the Layer 6 Examples is not the `u` of the section just before it

   **Location.** `packages/ModularFormsPartII/README.md:670`: "`u^(1/5) = 1 − (24/5)q + (348/25)q² − (4544/125)q³ + (52854/625)q⁴ − ⋯`: denominators `5, 25, 125, 625`."

   **Claim.** The fifth root of u has this expansion.

   **Witness.** §6.9 (:662–664), the last use before the Examples, sets "`λ = uⁿ`" and "`u = λ^(1/n) = 16^(1/n) q^(1/n) ∏ …`"; its fifth root begins `16^(1/(5n)) q^(1/(5n))`, not `1 − (24/5)q`. The series is that of §6.8's `u = ∏_{m odd}(1 + q^m)^(−24)`.

   **Exact repair.** Begin the bullet "With `u = ∏_{m odd}(1 + q^m)^(−24)` as in §6.8, `u^(1/5) = …`", as Worked example 7 (:1034) does. Tested: `(∏_{m odd}(1 + q^m))^(−24/5) = 1 − (24/5)q + ⋯`, first coefficient `−24/5`, and the second half of the bullet (`u^(1/24) = ∏_{m odd}(1 + q^m)^(−1)`) agrees with this u.

Three findings: one P2 (supplier drift: SpecialFunctionsTheta has renumbered at its open head, so every citation of its sections here now points at the wrong statement) and two P3 (Dependencies lines; one letter with two meanings in the Layer 6 Examples). The four findings of round 7 are repaired. No mathematical statement was found false. `Suggested.lean` elaborates with `sorry` as its only warning, no theorem closes under the one-tactic probe, and the dependency check reports no problem. No package file and no manifest entry was changed; no source was fetched.

## Verified sound

### Round 7 findings

| Finding | Repaired passage | State |
|---|---|---|
| F01 (P3), Layer 5 Dependencies | :581 "Layers 1–4; ModularCurvesPartII §§5.14, 6.4, 6.5, 8.1; FuchsianOrbifolds Layer 5; Mathlib Chebyshev bounds and `CongruenceSubgroup.Gamma0`." | Repaired; §§1.7, 1.8, 2.2, 2.4, 3.1, 3.6, 3.7, 4.3 lie in Layers 1–4. The same pattern elsewhere is R02 |
| F02 (P3), index clash in §6.9 | :664 "`∏_{m≥1} ((1 + q^(2m))/(1 + q^(2m−1)))^(8/n)`"; :654 "`q ∏_{m≥1} ((1 + q^(2m))/(1 + q^m))²⁴`" | Repaired. The same pattern (one letter, two meanings) in the Examples is R03 |
| F03 (P3), page of Lemma 4.2.3 | :535 "Lemma 4.2.3, pp.655–656" | Repaired (CDT25 lines 1766–1771 on p.655, proof from line 1775 on p.656) |
| F04 (P3), §7.3 bullet | :710 "For `M ≥ 1` and `A = diag(M, 1)`, the function `τ ↦ F(Mτ)` satisfies `F(Mγτ) = (cτ + d)^k ρ(AγA⁻¹) F(Mτ)` for every `γ` … in `Γ₀(M)`" | Repaired; recomputed below |

### Elaboration, signatures, padding

- `lake env lean` on `packages/ModularFormsPartII/Suggested.lean` from the content checkout: exit 0, 13 warnings, all `declaration uses sorry` (lines 75, 97, 145, 164, 171, 181, 195, 211, 242, 257, 285, 309, 324). Imports: `import Mathlib` and `TauCeti.NumberTheory.ModularForms.QExpansion.Laurent` (used by `lambdaField`, `congruenceSpan`, `boundedDenominatorSpan`, `weakForm_galois_conjugate`). No `set_option`, `variable`, `lemma`, `#eval`, sorried data.
- One-tactic probe on a scratch copy, every `sorry` replaced by `first | rfl | simp | infer_instance | trivial | aesop`, falling back to `sorry`: 11 theorems fall back, 2 (`modularLambda_covering`, `boundedDenominatorSpan_eq_congruenceSpan`) time out in the probe tactics; none closes. None restates a definition, mirrors a Check or computes a small value.
- `#check @name` for the 22 declarations in the same file; there is no section variable, so no binder can be lost; the supplied elaborated signatures agree with the README statements (period `h : ℕ` with `0 < h`, `2 * N` cast to `ℝ`, `[Γ.FiniteIndex]` present on the five theorems that need it, `hneg` on `wohlfahrt_Gamma_le`).
- Headlines of the Summary: Wohlfahrt (§1.8), λ covering (§2.2), rank bound and `R₂N = M₂N` (§6.1), nonabelian Ihara (§4.1), both unbounded-denominator theorems (§§6.3, 6.6), Galois conjugation (§6.5), component congruence and Mason (§§7.11–7.12), quasimodular closure (§8.2), both deficient-place theorems (§§8.6–8.7) are stated. Degree doubling and leveraging (§§5.3, 5.5), three-point solutions (§§7.1–7.2) and the fundamental group (§9.3) are named in the module docstring with reasons I accept (the pins have no continuation of ODE solutions, no local monodromy, no regular model of `X(N)`).
- Backticked names of this roadmap's own: 22 in the README, 22 declared; the citation resolver lists none as found nowhere.

### Library declarations opened at the pins

Tau Ceti: `tprod_one_add_pow_mul_tprod_one_sub_pow_odd` (`Analysis/SpecialFunctions/QPochhammer.lean:230`, hypothesis `‖q‖ < 1`), `laurentQExpansion_of_analyticAt` (`NumberTheory/ModularForms/QExpansion/Laurent.lean:193`), `orderTop_laurentQExpansion` (:235), `laurentQExpansion_mul` (:288), `laurentQExpansion_inv` (:377), `laurentQExpansion_eq_laurentQExpansion_iff` (:450), `Subgroup.integerCuspWidth` (`Cusps/Basic.lean`), `char_neg_one_of_modFormCharSpace_ne_bot` (`Parity.lean`). Mathlib: `Chebyshev.theta_le_log4_mul_x` (`NumberTheory/Chebyshev.lean:191`), `theta_ge` (:531), `pi_ge` (:842), `Gamma_zero_bot` (`CongruenceSubgroups.lean:69`, by `rfl`), `jacobiTheta_T_sq_smul`, `jacobiTheta_S_smul` (`JacobiTheta/OneVariable.lean:37, 43`), `serreDerivativeMF` (`Derivative.lean:304`), `ModularForm.instGCommRing` (`Basic.lean:561`, needs `Γ.HasDetPlusMinusOne`), `IsCoveringMapOn` (`Topology/Covering/Basic.lean:197`), `isArithmetic_iff_finiteIndex` (`ArithmeticSubgroups.lean:132`), `IsBoundedAtImInfty` (`FunctionsBoundedAtInfty.lean:45`), `Subgroup.normalCore` (`Algebra/Group/Subgroup/Basic.lean:724`), `InfinitePlace` (`InfinitePlace/Basic.lean:56`). The file elaborates, so every name it uses exists.

By object: the pinned libraries have no Wohlfahrt theorem, λ function, weak-form predicate, geometric level, vector-valued or quasimodular carrier. Tau Ceti's `Subgroup.CompactifiedQuotient.laurentQExpansion` (`QExpansion/FunctionField.lean:102`) is the expansion of a meromorphic function on a compactified quotient at a cusp datum, a different carrier from `UpperHalfPlane.laurentQExpansion`; `Data/Rat/BoundedDen.lean` is about rationals in a bounded set. Neither states a target here.

### Seeded source sample (CDT25; journal page = extraction page + 626)

| Target | Read at | Result |
|---|---|---|
| 1.4 | Lemma 4.2.2, p.655, lines 1745–1754; Lemma 7.4.4, pp.692–693, lines 3900–3910 | `fΔ^m` holomorphic at the cusps for large m; supported |
| 1.5 | Lemma 4.1.3, p.653, lines 1576–1581 | Source: widths divide N; the exact lcm here is a strengthening, true by the same stabilizers |
| 1.6 | Lemma 4.1.4, p.653, lines 1582–1587 | Supported |
| 2.1 | (1.0.2), p.628, lines 59–62; §1.1.3, p.631; §7.4.2, p.693, line 3931 | η quotient, product, `q − 8q² + ⋯`, `q = e^{πiτ}`; supported |
| 2.4 | §4.2, p.655, lines 1742–1744; p.628, line 68 | `ℚ[λ, 1/λ, 1/(1 − λ)]`, `M₂ = ℚ(λ)`; supported |
| 2.6 | (1.1.4)–(1.1.5), p.631, lines 246–268; Remark 7.2.3, p.688 | Source says weight one for `Γ(2)`; the character correction here is right (`−I ∈ Γ(2)`) |
| 3.5 | Lemma 4.2.2, p.655, lines 1755–1764; §1.1.6, p.632, lines 275–290 | Supported |
| 4.2 | Lemma 4.4.4, pp.659–660, lines 1944–1996 | Supported; source's kernel claim at line 1945 is on the signed group, corrected here |
| 5.1 | Proof of Theorem 4.3.2, pp.656–657, lines 1819–1830; Lemma 4.2.3, pp.655–656 | Supported |
| 5.5 | Proposition 4.3.5, (4.3.6)–(4.3.7), pp.657–658, lines 1851–1880 | Supported; source has `log N` and the prime number theorem, both noted here |
| 6.3 | Theorem 1.0.1, p.627, lines 25–41; p.628, lines 63–64; §6.3, p.685, lines 3489–3499 | "meromorphic at the cusps" is the weak-form growth clause; supported |
| 6.7 | (1.0.3), pp.628–629, lines 100–116 | Coefficients `248, 4124, 34752`, level 3, `j^(1/3)·Δ`; supported |
| 7.1 | Theorem 7.2.1 and footnote 4, pp.687–688, lines 3588–3613 | Supported; the case `N = 1` (no `F_1`) is handled here by doubling |
| 8.2 | Lemma 7.4.4, pp.692–693, lines 3900–3910; Definition 7.4.3, p.692 | Supported; factor 2 corrected here |
| 9.1 | Theorem 7.4.10, p.696, lines 4118–4127 | Supported |

No locator is flagged unverified by the author. KSV10: Lemma 7 (line 183, p.4), proof of Proposition 3 with equation (1) (lines 196–261, pp.5–6), Remark 8 (line 262, p.6). The manifest records the three cited works, one key each.

### Adversarial table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §7.3 bullet (changed) | `M = 2`, `γ = [[1, 0], [2, 1]]`, `T`, `[[1, 0], [1, 1]]`; `γ_i T^M γ_i⁻¹` | `AγA⁻¹ = [[a, Mb], [c/M, d]]`: `[[1, 0], [1, 1]]`, `T²`, and `[[1, 0], [1/2, 1]]` (not integral); factor `(c/M)(Mτ) + d = cτ + d`; `γT^Mγ⁻¹ = I + M(⋯) ∈ Γ(M) ≤ Γ₀(M)`, so `T^M` fixes every coset and the M-th power is block diagonal; trace 2 kept by conjugation; `X^M` semisimple and X invertible give `X = su` with `u^M = 1`, `u = 1` | True |
| §6.8 product (changed) | Euler's identity | `(1 + q^(2n))⁸(1 − q^(2n−1))⁸ = (1 + q^(2n−1))^(−8)` in the product, total `q ∏(1 + q^(2n−1))^(−24)`; `T`: `λ(1 − λ) ↦ −λ/(λ − 1)²`, not invariant; S fixes it | True |
| §6.9 (changed) | `n = 8`, `16`, `3` | `v₂ = (4 − a)m − v₂(m!)`: `n = 8`: `1, 1, 2, 1, 2, 2, 3, 1, 2`; `n = 16`: `0, −1, −1, −3, −3, −4, −4, −7, −7`; `n = 3`: `v₃ = −m − v₃(m!) = −1, −2, −4, −5, −6, −8` | True |
| §1.3 Checks | `H′`, cusp 1; χ of `η²` | `gT²g⁻¹ = [[−1, 2], [−2, 3]]`, `gT⁴g⁻¹ = [[−3, 4], [−4, 5]]`; `(χ(S)χ(T))³ = e^{−iπ} = −1 = χ(S)²`; image `μ₁₂`; `±1` at `T^m` iff `6 ∣ m` | True |
| §1.2 root property | `(1 − 16t)^(1/16)` | `C(1/16, 2)·256 = −15/2` | True |
| `wohlfahrt_Gamma_le` | `N = 0, 1`; `G = Γ(2)`, `N = 2`; `H′` | `Γ(0) = ⊥`; the conjugates of T generate `SL₂(ℤ)`, so `G = Γ(1)`; `Γ(2) ≤ Γ(2)`; `H′` fails `hneg` and the hypothesis at `N = 2` (`gT²g⁻¹ = [[−1, 2], [−2, 3]] ∉ H′`), and satisfies it at `N = 4` with `Γ(4) ≤ H′` | True |
| §2.1 | η exponents | `(1/2 + 4 − 3)/24 · 8 = 1/2` in Q, so `q¹`; SpecialFunctionsTheta's value at `0.3 + 0.8i` agrees to the 7 digits of :296 | True |
| §2.5, §2.3 | cube root | `1/3·44 − 64/9 = 68/9`; `x₃ = t − (8/3)t⁴ + (68/9)t⁷` | True |
| §2.6 | ODE; `τ₀` | `16x(1 − 16x)y″/256 + (1 − 32x)y′/16 − y/4`, times 16; `(n + 1)²a_{n+1} = 4(2n + 1)²a_n`; `τ₀ = 2i/(4i + 1) = (8 + 2i)/17`, factor `4i + 1` | True |
| §2.7 | `γ₂`, `γ₃`; sign | `4·0.8216·1.7725/(1.5016·0.8862) = 4.377`; `172.46/66.82 = 2.581`; `−2(ic)(2i) = 4c` | True |
| §3.2 Check | `Γ₀(3)` | η exponent `(1 − 3)·12/24 = −1`; `[[1, 0], [3, 1]]·[[1, 0], [2, 1]]⁻¹ = [[1, 0], [1, 1]]` | True |
| §3.5 | `r = 0.95` | `0.95·4.37688/4 = 1.0395 > 1` | True |
| `nonabelian_ihara` | projections; `D = Γ(N) ∩ A⁻¹Γ(N)A` | `A⁻¹[[a, b], [c, d]]A = [[a, b/p], [pc, d]]`; `Γ(N) = (G ∩ Γ(N))(Γ(N) ∩ Γ(p))`; `Γ(N) ≤ ±K`, `K ≤ Γ(N)`, `−I ∉ Γ(N)` give `K = Γ(N)` | True |
| §4.2 | Goursat; `p = 2` | `(1, 1, u)` in the image for `u ∈ U`; common quotient of `B/U`, cyclic of order `p − 1`; trivial at `p = 2` | True |
| §5.4, §5.5 | `N = 2, 3` | `(64/12)(3/4) = 4`; `(216/12)(3/4)(8/9) = 12`; `(8N³/12)(6/π²) = 4N³/π²`; `2^k ≤ (Cπ²/4) log(2N)` | True |
| `boundedDenominatorSpan_eq_congruenceSpan` | both inclusions | ⊇ with `H = ±Γ(2N)` (weight 0, so `−I` acts trivially) and AlgebraicModularFormsAndSerreWeights §2.9; ⊆ by §6.4, then §1.8 on `⟨H, Γ′⟩` | True |
| `unbounded_denominators`, `algebraicInteger_…` | `f = 0`; `j^(1/3)Δ = E₄η¹⁶`; odd k with `−I` | period 3, `Q^(2/3)`·integral, weight 12; `f = −f` | True |
| §6.2 | exponents | `η(τ/2)² = q^(1/12)∏(1 − qⁿ)²`; `q^(1 − 1/12) = q^(11/12) = exp(2πi·11τ/24)` | True |
| `IsVectorValuedForm`, §7.13 | σ; second example | `det σ(R) = −6 + 7 = 1`, trace −1; `σ(T) = [[2, 1], [7, 3]]`, `X² − 5X − 1`; `det ρ(R) = 1/4 + s² − s² + 3/4 = 1`, `det ρ(T) = −1`, roots `is ± cos 2πμ`, `1/2 − μ = 0.08579` | True |
| `vectorValued_component_congruence`, `_effective_mason` | `n = 0`; odd k; growth | no index; `F = 0`; `Γ(M)`-invariance makes `F_j ∣ g` M-periodic, so strip growth is uniform | True |
| §7.10 | weights | `Δ(τ/2) = q∏(1 − qⁿ)²⁴`; `k + k′ − 12·(k + k′)/12 = 0`; even `k′ ∈ {0} ∪ [4, ∞)` reaches every class mod 12 | True |
| `quasiModularWeakAlgebra_differential_closure` | generators | `Df = ϑf + (k/12)E₂f`; `E₂ = DΔ·Δ⁻¹`; `τ⁻²E₂(−1/τ) = E₂ + 6/(πiτ)` | True |
| §8.3, §8.4 | series | `−4(q − 8q²) − 12q² = −4q + 20q²`; `1 + x + 4x² + 25x³`: `−8 + 4 = −4`, `44 − 64 + 25 = 5`; `(n + 1)C_n² = C(2n, n)²/(n + 1)` | True |
| `congruenceKernel_no_deficient_place`, `exists_deficient_finite_place` | `k ≤ 0`; `h ∤ M`; `S = ∅` | cusp forms of weight ≤ 0 vanish; index m in period h is index `mM/h` in period M, constants only; `S = ∅` gives integral coefficients, congruence by §7.11, contradiction | True |
| §9.1 Check | blow-up | `C² = E² = −1`, `C·E = 1` | Consistent |

### Duplication, ownership, overlaps

- Cross-roadmap citations resolved now by heading: QSeriesPartitionsAndMockModularForms §§5.2, 8.1, 8.4a; ModularCurvesPartII §§5.13, 5.14, 6.3–6.5, 8.1, 11.4, 15.2, 15.3, 15.5, 15.6, 15.9, 15.10; DiophantineApproximationAndTranscendencePartII §§4.1–4.8; AlgebraicModularFormsAndSerreWeights §§1.5, 2.9 and identifiers R15.1–R15.2 (its line 18); AutomorphicGaloisRepresentations §4.2; GeometryOfNumbersAndQuadraticArithmetic §4.3 (the `q`-Pochhammer product and `jacobi_product_specialization` are inside it, lines 1606–1608); ConformalMappingPartII §§0.3, 0.5, 1.4, 1.8, 5.1, 5.5, 5.8, 9.19; DiophantineApproximationAndTranscendence §§5.2–5.3; EtaleCohomologyFoundations §F.0.2; BelyiMaps Layers 6, 9; FuchsianOrbifolds Layer 2 items 3 and 5, Layer 3 items 1–5, Layers 4–6 and Layer 6 item 1; UniversalCovers (Completed) Stage 2; ModularForms through its table of earlier layer labels (Layer 0, Layer 4, Worked examples) and present Layer 10. SpecialFunctionsTheta: R01.
- The λ-covering assignment of :7 holds: Completed/ConformalMapping README line 89 and BelyiMaps README lines 192–193.
- NoncongruenceModularForms (main) cites W1.2, W1.3, W1.5, W1.6, W1.8, W6.3–W6.5 of this roadmap; all resolve through the former-numbering table (:26–36).
- SpecialFunctionsTheta's `Suggested.lean` declares `TauCetiRoadmap.SpecialFunctionsTheta.modularLambda` (theta quotient); this package's `TauCetiRoadmap.ModularFormsPartII.modularLambda` is the η quotient, identified with it in §2.1. The fully qualified names differ.
- Declared gaps: three, same slugs in `design/plan.json` and under `## Exact supplier contracts`, each with a supplier and section, each a single precise statement; none asks for what a supplier already states.
- `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id dropped by a revision, no second copy on main.

Overlap check: read HalfIntegralWeightModularForms, SpecialFunctionsTheta, DiophantineApproximationAndTranscendencePartII, QSeriesPartitionsAndMockModularForms, SiegelModularForms, NoncongruenceModularForms, ModularForms, ConformalMappingPartII; λ, its laws, the mapping theorem and the hypergeometric identity are SpecialFunctionsTheta's (§§6.1, 6.2, 6.4) and imported; the η-quotient presentation, the covering and the integral series form are this roadmap's; signed Wohlfahrt and the weak-form unbounded denominators theorem are this roadmap's by NoncongruenceModularForms' Scope; the weak-form carrier and η multiplier are QSeriesPartitionsAndMockModularForms'; the rank bound and the coverings `F_N` are their suppliers'.

### Supplier order

```text
depcheck: 243 roadmaps, 2255 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. All 64 `*Needs:*` lines read; none cites a later roadmap or one of the never-cite list. SpecialFunctionsTheta is another author's open pull request adding a new roadmap folder; it does not cite this roadmap.

### Shape, style, copyright

- Nine layers, each with Examples and Dependencies; definitions with API and at least three Checks; no LaTeX delimiters, pull-request numbers, machine paths or process words (searched).
- The layers are not the article's sections: CDT §§2, 5, 6 are suppliers' material, Layer 3 joins CDT §3 with §4.2, Layer 4 (CDT §4.4) precedes Layer 5 (CDT §4.3) because §5.2 needs §4.3, and CDT §7 is split over Layers 7–9.
- Wording: the 15 sampled passages and 6 more (Theorem 1.0.1 against §6.3 and its docstring, Lemma 4.2.3 against §§3.6–3.7, Remark 6.3.2 against §6.6, Proposition 4.3.5 against §5.5, Theorem 7.4.10 against §9.3, KSV10 equation (1) against §1.8) set beside the sources: no sentence or proof plan follows a source's wording. No table, figure or list is taken over.

Source independence: 21 passages compared with 2 sources (CDT25, KSV10), none shared; largest share CDT25, 63 of 65 parenthesised locators; contents compared with CDT25: independent. Ihara1994 could not be read.

## Not verifiable

- Ihara1994, Theorem 1 and §4 (§9.2): settled as uncertified, cited by locator; not read.
- The proofs behind supplier statements still in open pull requests (DiophantineApproximationAndTranscendencePartII §4.5, ModularCurvesPartII Layer 15, SpecialFunctionsTheta §§6.2, 6.4) were resolved by heading and statement; they belong to those roadmaps' reviews.
- Ownership against open pull requests was checked with the roadmaps tools at the index of 2026-11-15; SpecialFunctionsTheta is not among the 237 names of the job's list and was read through the tool at head 76a507d.

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
- **Error** in CDT25 at (1.0.4), p.629: the source says the function λ(1 − λ)/16 has level the group of matrices with even lower-left entry; it should be the theta group, its conjugate containing S, in the half-period parameter; affects nothing.
- **Error** in CDT25 at (1.1.5), p.631: the source says the squared theta series is a weight-one form for the principal group of level 2; it should carry the quadratic character of conductor 4, since −I lies in that group; affects nothing.
- **Gap** in CDT25 at proof of Theorem 7.3.3, p.690: the source says the bundle has rank 6n and may be assumed irreducible; it should work with the continuation space of the one component, of dimension at most n; affects the proof.
- **Gap** in CDT25 at proof of Theorem 7.2.1, p.687: the source says the pulled-back series is handled by the covering of the plane minus the N-th roots of unity for every N; it should double N when N is 1, where no such covering of the disc exists; affects the proof.
- **Misprint** in KSV10 at proof of Proposition 3, the line after equation (1), p.6: the source says L is the transpose of T times a power of T times the inverse transpose; it should be the inverse transpose first and the transpose last; affects the proof.

## For the human reviewers

- **Scope.** This roadmap consumes SpecialFunctionsTheta (README :22, :95), another author's open pull request not in the merge order file, whose section numbers changed between two review rounds (R01); the two must merge in that order.
- **Scope.** NoncongruenceModularForms on main names ModularFormsPartII, which is not on main, as a supplier (its README :49, :161, :300).
- **Licence.** CDT25 was read in the authors' offprint, which carries the publisher's notice "Copyright restrictions may apply"; the manifest classes it `author-page`.
- **Not tested.** Ihara1994 (§9.2) is cited by locator only; parts 1 and 2 of the copyright check were not run against it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5e817839f5aa4d73134573350281ad0a341dbc48", "job": "REV-PKG-ModularFormsPartII~8", "model": "fable", "worker": "chris-x91"} -->
