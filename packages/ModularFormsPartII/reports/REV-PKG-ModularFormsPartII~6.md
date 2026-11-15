<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13003#issuecomment-6895512264 -->
Review (claude) of 5b5a181

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The modular λ function has a second owner in an open roadmap

   **Location.** `packages/ModularFormsPartII/README.md:7`: "This roadmap owns: … the modular λ function, its covering theorem, … and Jacobi's hypergeometric identity with its character (Layer 2)"; §2.1 (:258–262), §2.2 proof sketch (:283), §2.6 (:311–317), §2.7 proof sketch (:323).

   **Claim.** This roadmap is the single owner of λ, of `λ = (θ₂/θ₃)⁴`, `1 − λ = (θ₄/θ₃)⁴`, `λ(τ + 1) = λ/(λ − 1)`, `λ(−1/τ) = 1 − λ`, `λ ∉ {0, 1}`, of the bijection of the `Γ(2)` fundamental region, and of `₂F₁(1/2, 1/2; 1; λ) = θ₃²`.

   **Witness.** The open pull request that adds SpecialFunctionsTheta (another author) states the same objects. `TauCetiRoadmap/SpecialFunctionsTheta/README.md:135–136`: it "owns … the modulus `k`, the modular function `λ`"; :630 gives holomorphy, `λ ∉ {0, 1}` and the three transformation laws; :674 maps the `Γ(2)` region bijectively onto the doubly slit plane; :669 is the hypergeometric form; `Suggested.lean:195` declares `modularLambda`. This README names that roadmap nowhere.

   **Exact repair.** Cite, do not restate; the fully qualified Lean names already differ, so `Suggested.lean` keeps its definition and only its docstring changes.

   1. In `## Scope and ownership`, remove "the modular λ function" and "Jacobi's hypergeometric identity" from the owned list as stated, and add an import bullet: SpecialFunctionsTheta §4.1 owns Jacobi's quartic identity `θ₃⁴ = θ₂⁴ + θ₄⁴`; §5.1 owns `λ = k² = (θ₂/θ₃)⁴`, `1 − λ = (θ₄/θ₃)⁴`, holomorphy, `λ ∉ {0, 1}`, `λ(τ + 2) = λ`, `λ(τ + 1) = λ/(λ − 1)`, `λ(−1/τ) = 1 − λ` and the behaviour of `λ(it)`; §5.3 owns the bijection of `{|Re τ| < 1, |τ ± 1/2| > 1/2}` onto `ℂ ∖ ((−∞, 0] ∪ [1, ∞))` with its boundary and cusp values, and `F(1/2, 1/2; 1; λ(τ)) = θ₃(τ)²` there. State what stays here in one clause each: the η-quotient presentation with its integral `q`-product, `Γ(2)`-invariance, the covering theorem and deck group, and the integral series, character and monodromy of §2.6.
   2. Add `### From TauCetiRoadmap.SpecialFunctionsTheta` to the supplier contracts with those sections and the convention check that its nome is `exp(πiτ)`, the `q` of this roadmap.
   3. §2.1: keep the definition of `modularLambda` and the product formula; replace "Prove … the theta formulas … Prove `λ(τ + 1) = …`, `λ(−1/τ) = …` … omits `0` and `1`" by one target, "the η quotient equals SpecialFunctionsTheta §5.1's λ on `ℍ`", from which the laws are imported; keep `Γ(2)`-invariance as the consequence proved here. Update the API bullets and the `*Needs:*` line (add SpecialFunctionsTheta §§4.1, 5.1; the triple-product citation is then needed only for the product formula).
   4. §2.2 proof sketch: take the bijection on the fundamental region and the boundary correspondence from SpecialFunctionsTheta §5.3 instead of re-proving them; §2.7: take "λ is real and decreasing on the imaginary axis" from §§5.1–5.2 there.
   5. §2.6: cite SpecialFunctionsTheta §5.3 for the identity and keep as this roadmap's target the integral series form `K₀(λ/16) = θ₃²` with `K₀ = Σ C(2n, n)² xⁿ`, the character `χ₋₄(d)`, the differential equation and the monodromy.

   **Repair tested.** On a scratch copy with the Scope bullet and the §2.1 `*Needs:*` entry added, the dependency check still prints `depcheck: 245 roadmaps, 2238 edges, 0 problem(s)` and `roadmaps resolve` finds every citation. The two definitions agree on the instances I computed: the η quotient at `τ = i` is `16 · 0.0312498 = 0.49999` against `λ(i) = 1/2` there (:639 of that README), and `(θ₂/θ₃)⁴ = 16q(1 + q² + ⋯)⁴/(1 + 2q + ⋯)⁴ = 16q − 128q² + ⋯`, the expansion of §2.1.

2. **F02** (P3) The id W6.5 that a roadmap on main cites now holds another target

   **Location.** `packages/ModularFormsPartII/README.md:603` and :611: "### 6.5 Galois conjugates of weak forms with algebraic coefficients", "### 6.6 Algebraic-integer Fourier coefficients".

   **Claim.** The ids other roadmaps cite are unchanged in number and content (the round-6 repair report says so for W6.3–W6.5).

   **Witness.** `TauCetiRoadmap/NoncongruenceModularForms/README.md:302–304` on main: "W6.3–W6.5 (integral, rational and number-field unbounded denominators for weak forms)"; also :161, :1579, :1588, :1799. Here §6.5 is Galois conjugation and the number-field theorem is §6.6. `design/README.md:1024` has W6.5 as the algebraic-integer target.

   **Exact repair.** Add a former-numbering table to `## Scope and ownership` (header "Former numbering | Section"), one row per moved id: W2.3 → §2.4; W2.4 → §2.3; W6.5 → §6.6; W6.6 → §6.7; W6.7 → §6.8; W6.8 → §6.9; W7.4 → QSeriesPartitionsAndMockModularForms §8.4a. Tested on the witness: "W6.3–W6.5" then resolves to §§6.3, 6.4 and 6.6, the integral, rational and number-field theorems, and W1.2, W1.3, W1.5, W1.6, W1.8 and W6.3–W6.4 already agree with §§1.2, 1.3, 1.5, 1.6, 1.8, 6.3, 6.4. This is not the map round 5 asked for and the repair declined: that one concerned §§2.3–2.4, which nobody cites; W6.5 is cited on main.

3. **F03** (P3) Page of CDT Theorem 5.1.4

   **Location.** `packages/ModularFormsPartII/README.md:321`: "(CDT, Example 5.1.22, p.673; Theorem 5.1.4, pp.667–668)".

   **Claim.** The theorem is on pp.667–668.

   **Witness.** CDT25 line 2382: Theorem 5.1.4, with (5.1.5) and (5.1.6), is wholly on p.668 (the page headed 668 starts at CDT25 line 2346). Page 667 (CDT25 line 2305) only mentions it in the section introduction.

   **Exact repair.** Write "Theorem 5.1.4, p.668". Example 5.1.22, p.673, is correct (CDT25 line 2738).

4. **F04** (P3) A Check of §7.3 names the wrong class

   **Location.** `packages/ModularFormsPartII/README.md:699`: "For `n = 1` and ρ a character of finite order, the definition gives the classical forms on `SL₂(ℤ)` with that character."

   **Claim.** One-dimensional vector-valued forms are the classical forms with a finite-order character.

   **Witness.** `n = 1`, `ρ = 1`, `k = −12`, `F = Δ⁻¹` satisfies §7.3 (`|Δ⁻¹| ≤ A exp(2π Im τ)` on strips) and is not a modular form; and the character of `η²` has `χ(−I) = −1` (§1.3), which `ρ(−I) = 1` excludes.

   **Exact repair.** "For `n = 1` and ρ a character of finite order with `ρ(−I) = 1`, the definition gives the weak forms of §1.1 on `SL₂(ℤ)` with that character, poles at `∞` allowed: `Δ⁻¹` with `ρ = 1`, `k = −12` qualifies, and a definition demanding boundedness would reject it." Tested on the witness: `Δ⁻¹` is then inside the stated class, and `η⁴` (`ρ(−I) = 1`, the Layer 7 example) still is.

Four findings: one P2 (an object with two owners among the open roadmaps) and three P3 (a moved id that a roadmap on main cites, a locator, a Check). The four findings of round 5 are repaired. `Suggested.lean` elaborates with `sorry` as its only warning, no theorem closes under the one-tactic probe, and the dependency check reports no problem. No package file was changed and no source was fetched.

## Verified sound

### Round 5 findings

| Finding | Repaired passage | State |
|---|---|---|
| F01 (P2), statable headlines absent | `Suggested.lean` now states `wohlfahrt_Gamma_le`, `weakForm_galois_conjugate`, `quasiModularWeakAlgebra_differential_closure`, `congruenceKernel_no_deficient_place`, `exists_deficient_finite_place`, and also `boundedDenominatorSpan_eq_congruenceSpan` and `boundedDenominatorSpan_finrank_le` on Tau Ceti's `TauCeti.UpperHalfPlane.laurentQExpansion` | Repaired, and extended: §6.1 is no longer listed as not statable |
| F02 (P3), divide for multiply | README :410: "Multiplying by the integral Laurent series `Δ^(−m)` … recovers f with the same denominator" | Repaired |
| F03 (P3), split on c | README :231: "Split according to whether p divides a", with the two matrices C, and the example at :248 | Repaired |
| F04 (P3), §2.4 before its prerequisite | README :287 "2.3 Integral λ reparametrization", :295 "2.4 The level-two function ring"; `*Needs:* §§1.1, 2.2, 2.3` | Repaired; the numbering map it asked for is taken up, for the id that is cited, in R02 |

### Elaboration, signatures, padding

- `lake env lean` on `packages/ModularFormsPartII/Suggested.lean`, run from the content checkout: exit 0, 13 warnings, all `declaration uses sorry` (lines 75, 94, 142, 161, 168, 178, 192, 208, 239, 254, 282, 306, 321). No `lake build` was needed. Imports: `import Mathlib` and `TauCeti.NumberTheory.ModularForms.QExpansion.Laurent`, which is used. No `set_option`, no sorried data, no `lemma`.
- `#check @name` for all 22 declarations on a scratch copy; each type compared with its README statement. No section variable is used, so no binder can be lost. Generality agrees: §3.2 and `boundedDenominatorSpan` both ask for `−I ∈ H` and every conjugate of `T^(2N)`; §8.6 and the Lean both quantify over every number field with an embedding.
- One-tactic probe on all 13 theorems (`first | rfl | simp | infer_instance | trivial | simp [the nine definitions]`): none closes. None restates a definition, mirrors a Check or computes a small value.
- Headlines of the Summary against the file: Wohlfahrt (§1.8) stated; λ covering (§2.2) stated; rank bound stated unconditionally; nonabelian Ihara (§4.1) stated; `R₂N = M₂N` (§6.1) stated; the two unbounded-denominator theorems (§§6.3, 6.6) and Galois conjugation (§6.5) stated; component congruence and Mason (§§7.11–7.12) stated; quasimodular closure (§8.2) and both deficient-place theorems (§§8.6–8.7) stated. Not stated, each named in the module docstring with its reason: degree doubling and leveraging (§§5.3, 5.5: their hypothesis is refuted, respectively their conclusion given, by the stated equality), the three-point theorems (§§7.1–7.2: no continuation or local monodromy of complex linear ODE at the pins) and the fundamental group (§9.3: no regular model of `X(N)`). I accept the three reasons.
- Every backticked name of this roadmap's own in the README is declared in the file, and every declared name appears in the README (22 of 22).

### Library declarations opened at the pins

Mathlib: `CongruenceSubgroup.Gamma_zero_bot` (`NumberTheory/ModularForms/CongruenceSubgroups.lean:69`, `Gamma 0 = ⊥`); `IsCongruenceSubgroup` (:164, `∃ N ≠ 0, Gamma N ≤ Γ`, no `−I`); `IsCoveringMapOn` (`Topology/Covering/Basic.lean:197`); `Derivative.normalizedDerivOfComplex` (body `(2πi)⁻¹ * deriv (F ∘ ofComplex) z`, so it is D and not `θ_q`); `Derivative.normalizedDerivOfComplex_E₂` (`= 12⁻¹ • (E2² − E₄)`); `EisensteinSeries.E2 : ℍ → ℂ`; `NumberField.InfinitePlace.apply` (`InfinitePlace/Basic.lean:99`, `mk φ x = ‖φ x‖`, the modulus and not its square); and by `#check`: `ModularForm.eta_ne_zero`, `logDeriv_eta_eq_E2`, `discriminant`, `discriminant_ne_zero`, `CuspForm.discriminant`, `discriminant_qExpansion_coeff_one`, `instGCommRing`, `jacobiTheta_S_smul`, `jacobiTheta_T_sq_smul`, `jacobiTheta₂_functional_equation`, `serreDerivative`, `serreDerivativeMF`, `Subgroup.normalCore`, `Subgroup.goursat_surjective`, `Chebyshev.theta_ge`, `theta_le_log4_mul_x`, `pi_ge`, `ModularForm.SL_slash`, `OnePoint.IsBoundedAt`, `Subgroup.isArithmetic_iff_finiteIndex`, `Gamma_normal`, `FinitePlace`. Tau Ceti: `QExpansion/Laurent.lean` (definition of `laurentQExpansion` read; `_of_analyticAt`, `_mul`, `_inv`, `orderTop_`, `_eq_laurentQExpansion_iff` by `#check`); `CongruenceSubgroup.Gamma_le_Gamma_of_dvd` (`CongruenceSubgroups/Basic.lean:177`); `TauCeti.Subgroup.integerCuspWidth` and `_pos` (`Cusps/Basic.lean:170, 176`); `TauCeti.char_neg_one_of_modFormCharSpace_ne_bot` (`Parity.lean:136`). All 39 exist as cited.

### Seeded source sample (CDT25, journal page = extraction page + 626)

| Target | Read at | Result |
|---|---|---|
| 1.1 | Thm 1.0.1, p.627, CDT25 line 25; Def 7.4.3, p.692, line 3898 | Meromorphy at the cusps is the source's description; supported |
| 2.2 | p.628, lines 63–70; p.650, lines 1433–1440 | `Y(2) ≅ ℙ¹ ∖ {0, 1, ∞}`, étale covers; supported |
| 2.7 | Ex 5.1.22, p.673, line 2738; Thm 5.1.4, p.668, line 2382 | Supported; page slip R03 |
| 3.4 | pp.650–651, lines 1423–1447; (3.0.5), line 1457 | Source uses V; the README's W and its reason are its own; supported |
| 5.1 | pp.656–657, lines 1819–1827 | Intersection used; the linear-disjointness argument is the README's |
| 5.2 | Thm 4.3.1, p.656, line 1810; (4.4.9)–(4.4.10), p.660, lines 2024–2027 | Supported |
| 5.5 | Prop 4.3.5, (4.3.6)–(4.3.7), pp.657–658, lines 1851–1880 | Supported; Chebyshev replaces the prime number theorem |
| 6.2 | p.628, lines 63–64 | The factor `(λ/16η(τ/2)²)^k`; supported |
| 6.3 | Thm 1.0.1, line 25; §6.3, p.685, line 3489 | Hypotheses agree: integral power series, any integral weight, meromorphic cusps |
| 6.4 | pp.627–628, lines 42–46 | Supported |
| 6.7 | (1.0.3), pp.628–629, lines 100–116 | Coefficients, level 3 and the `j^(1/3)Δ` device agree |
| 7.3 | Def 7.3.1, pp.688–689, lines 3678–3687 | Growth clause "for all `a < b`, `C > 0`" agrees |
| 7.10 | p.690, lines 3779–3788 | Same factor and `12 ∣ k + k′` |
| 7.11 | Thm 7.3.3, p.690, lines 3766–3770 | Source: `ℤ[[q]]`, `q = exp(πiτ)`; the README's c and h are its generalisation |
| 7.12 | Cor 7.3.4, p.691, lines 3820–3823 | Source concludes `ker ρ ⊇ Γ(N)`; the README corrects it (Source issues) |

No locator is flagged unverified by the author. Also read for the repaired text: Def 4.2.1 and Lemma 4.2.2 (lines 1734–1764), Lemma 4.2.3 (1766–1798), Lemma 7.4.4 (3895–3910), §7.4.8 (4042–4084). The manifest records the three cited works, one key each.

### Adversarial table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `wohlfahrt_Gamma_le` (§1.8) | N = 0; `G = SL₂(ℤ)`; hypothesis `−I` | `Γ(0) = ⊥ ≤ G`. Without `−I` it still holds: in `SL₂(ℤ/4)` the conjugates of `I + 2e₁₂` are `I + 2n`, n ∈ {`e₁₂`, `e₂₁`, `I + e₁₂ + e₂₁`}, spanning all of `sl₂(𝔽₂)`, so the normal closure of `T^N` maps onto each kernel `Γ(N)/Γ(Nν)` | True. `−I` is not needed for truth but is this roadmap's boundary: the form without it is `wohlfahrt_strict` of NoncongruenceModularForms on main; no change |
| `modularLambda`, `modularLambda_covering` (§§2.1–2.2) | τ = i; `Ti`; `−I` | Product at `q = e^(−π) = 0.0432139`: `0.0432139 · 0.72359 · 0.99938 = 0.0312498`, times 16 is `0.49999`. `λ(Ti) = (1/2)/(−1/2) = −1 ≠ 1/2` and `T ∉ Γ(2)`. `−I ∈ Γ(2)` fixes i | Both directions of the fibre statement consistent; ownership R01 |
| §2.7 | `F₂(0)`, `F₂′(0)`, radii | `1 − 2·(1/2) = 0`; `−2(ic)(2i) = 4c > 0`; `Γ(1/4)⁴/(4π²) = 172.79/39.478 = 4.3769 > 4`; `Γ(1/6)³/(12π^(3/2)) = 172.47/66.82 = 2.581 > 2.5198`; punctures 5 ≠ 6 at N = 4, 6 ≠ 12 at N = 5 | Sound |
| `lambdaField`, `congruenceSpan`, `boundedDenominatorSpan` (§§3.0–3.2) | N = 1; `√2`; `Γ₀(3)` | Generator `16(q − 8q² + 44q³) = 16q − 128q² + 704q³`. `⟨Γ₀(3), Γ(2)⟩ ∋ T, [[1,0],[3,1]]·[[1,0],[2,1]]⁻¹ = [[1,0],[1,1]]`, so it is `SL₂(ℤ)` and the Hauptmodul (degree 1 on a degree-4 cover) is excluded | Definitions determine `ℚ(λ)`, `M₂N`, `R₂N` |
| §3.4 | N = 1, `f = j`; `f = λ − 1/2` | `256·(3/4)³/(1/16) = 1728 = j(i)`; `16/(16u − 1/2) = 1/(u − 1/32)`, apparent pole inside `U₁` | Sound |
| `boundedDenominatorSpan_eq_congruenceSpan` (§6.1) | both inclusions | ⊆: such f is congruence by §6.4; `⟨H, Γ′⟩` is congruence, contains `−I` and the conjugates of `T^(2N)`, so contains `Γ(2N)` by §1.8. ⊇: `H = ±Γ(2N)`, weight 0 so `−I` acts trivially | True |
| `boundedDenominatorSpan_finrank_le` | N = 1, 2, 3 | Degrees 1, 4, 12 against `1.5·N³ log(2N)` = 1.04, 16.6, 72.6; in general `(2N)³/12 ≤ (2/3)N³` | True with C = 1.5; `FiniteDimensional` stated, so `finrank = 0` cannot satisfy it |
| §5.1, §5.2, §5.5 | N = 1, p = 3; N = 2, p = 3; X = 100 | `[M₆ : M₂] = (216/12)(3/4)(8/9) = 12`; `q^(1/2) ↦ q^(3/2) = (q^(1/6))⁹`; `f(Aγ′τ) = f(γAτ)` for `γ′ = A⁻¹γA`; `2²³ ≈ 8.4·10⁶` against `(Cπ²/4)(log 2N₀ + 139)` | Sound |
| §6.2 | `h₀` | `q^(1 − 1/12)(1 − 8q)(1 + 2q) = q^(11/12)(1 − 6q + ⋯)`; weight `0 − 1 = −1`; `exp(2πi·11τ/24)` has period 24 | Sound |
| `unbounded_denominators`, §6.4 | `f = Δ`; `(1 − 16x)^(1/3)`; `Δ⁻¹/2` | Integral, congruence. Coefficient `−16/3`: not integral, and the cover is noncongruence (3 ∉ {1, 2, 4, 8}). `2·Δ·(Δ⁻¹/2) = 1` | Consistent in both directions |
| §6.7 | `E₄/η⁸` | `240 + 8 = 248`; `2160 + 1920 + 44 = 4124`; `6720 + 17280 + 10560 + 192 = 34752` | Agrees with (1.0.3) |
| `weakForm_galois_conjugate` (§6.5) | `√2Δ⁻¹`; odd k with `−I ∈ Γ`; arbitrary σ | Coefficients `√2·(1, 24, 324)`, conjugate `−√2Δ⁻¹`, period 1 kept. Odd weight: reduce by `η^(2k)`, integral in `q^(1/12)`. The conjugate cover is branched over `{0, 1728, ∞}` with indices dividing 3 and 2 | True; the cusp is moved to `∞` by a conjugation, which keeps the period |
| `IsVectorValuedForm` (§7.3) | `F = 1`; `Δ⁻¹`; `η²` character | Satisfied; satisfied (not a modular form); excluded by `ρ(−I) = 1` | Definition sound; Check wording R04 |
| §7.10 | k = 2 | `k′ = 10`, exponent 1, weight `2 + 10 − 12 = 0`; `λ/(16Δ(τ/2)) = 1 + (24 − 8)q + ⋯` | Sound |
| `vectorValued_component_congruence` (§7.11) | h even, h odd | `F(hτ/2)`: `exp(2πi(hτ/2)/h) = exp(πiτ)`; `F(hτ)`: `exp(2πiτ) = q²` | Reduction to the source's `ℤ[[q]]` correct |
| `vectorValued_effective_mason` (§§7.12–7.13) | `ρ = 1 ⊕ σ`, `F = (1, 0, 0)`; n = 0 | `σ(R)`: trace −1, det `−6 + 7 = 1`; `σ(T) = [[2,1],[7,3]]`, trace 5, det −1. `(cτ + d)^k(ρ(γ)F − F) = 0` | True; the kernel form is false |
| `quasiModularWeakAlgebra_differential_closure` (§8.2) | `Γ = SL₂(ℤ)` | `DΔ = E₂Δ` with `D = (2πi)⁻¹d/dτ` at the pin; `E₂ = DΔ·Δ⁻¹` with `Δ, Δ⁻¹` weak forms on every Γ; `Df = ϑf + (k/12)E₂f` | True; finite index is not needed (a note, no change) |
| `HasCuspidalExpansionOver`, `congruenceKernel_no_deficient_place` (§§8.5–8.6) | Δ; `E₄`; odd k; k ≤ 0; second embedding | `24 ≤ 2·2^5.5 = 90.5`; `240m³ > m^(3/2+ε)`; `F = 0`; no cusp forms; the conjugate is again a cusp form on `Γ(M)` | True; the zero constant term is essential |
| `exists_deficient_finite_place` (§8.7) | S = ∅; `ρ = 1 ⊕ σ` | S = ∅ makes the coefficients integral, §7.11 over `𝓞_K` contradicts the hypothesis; eigenvalues `5.19258, −0.19258` are no roots of unity, so the σ-part vanishes | True |
| `nonabelian_ihara`, `algebraicInteger_unbounded_denominators` | unchanged since round 5 | Round 5 rows carry computed values (index 3 at N = 3, p = 2; trace matrix `diag(2, 4)`) | Relied on |
| §1.7 example | p = 2, both matrices B | `[[−1,2],[−2,3]] ↦ [[−1,1],[−4,3]] = CTC⁻¹`; `[[−3,8],[−2,5]] ↦ [[−3,4],[−4,5]] = CT⁴C⁻¹`; `ct + s = d(as − cpr) = d` | Repair of F03 correct |

### Duplication and ownership

- Against the pins: the 22 declarations and the near-match list; no pinned declaration states any of the 13 theorems.
- NoncongruenceModularForms (main) states `wohlfahrt_strict` and a `ModularForm`-carrier `unbounded_denominators`, and at its README :49 and :161 assigns the signed Wohlfahrt theorem and the weak-form theorem to this roadmap. One owner each; the fully qualified names differ.
- Other objects searched over main and the open heads (`roadmaps grep`): quasimodular (one passing remark in EllipticPeriods), vector-valued modular forms and weakly holomorphic forms (QSeriesPartitionsAndMockModularForms, cited in Scope), nonabelian Ihara and unbounded denominators (no other owner).
- Every supplier section cited resolves at main or at the supplier's open head: ConformalMappingPartII §§0.3, 0.5, 1.4, 1.8, 5.1, 5.5, 5.8, 9.19; DiophantineApproximationAndTranscendencePartII §§4.1–4.8; ModularCurvesPartII §§5.13, 5.14, 6.3–6.5, 8.1, 11.4, 15.2, 15.3, 15.5, 15.6, 15.9, 15.10; QSeriesPartitionsAndMockModularForms §§5.2, 8.1, 8.4a; AlgebraicModularFormsAndSerreWeights §§1.5, 2.9; AutomorphicGaloisRepresentations §4.2; EtaleCohomologyFoundations §F.0.2; DiophantineApproximationAndTranscendence §§5.2–5.3; GeometryOfNumbersAndQuadraticArithmetic §4.3 (the triple product is in that section, under its heading on Oppenheim and Duke); FuchsianOrbifolds Layers 2–6; BelyiMaps Layers 6, 9; UniversalCovers Stage 2; ConformalMapping Layer 4.
- The three declared gaps are precise, name a supplier and section, and have the same slugs in `design/plan.json` and under `## Exact supplier contracts`.
- `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, no second copy on main.

Overlap check: read HalfIntegralWeightModularForms, DiophantineApproximationAndTranscendencePartII, QSeriesPartitionsAndMockModularForms, SiegelModularForms, SpecialFunctionsTheta, NoncongruenceModularForms, ModularForms, ConformalMappingPartII; the modular λ function, its transformation laws and Jacobi's hypergeometric identity are shared with SpecialFunctionsTheta and have two owners (R01); signed Wohlfahrt and the weak-form unbounded denominators theorem are shared with NoncongruenceModularForms, owner this roadmap by that roadmap's own Scope; the weak-form carrier is QSeriesPartitionsAndMockModularForms §8.1's; the holonomy bound and the coverings `F_N` are the suppliers'.

### Supplier order

```text
depcheck: 245 roadmaps, 2238 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. All 64 `*Needs:*` lines read; none cites a later roadmap or a roadmap of the never-cite list.

### Shape, style, copyright

- Nine layers, each ending with Examples and Dependencies. Every definition has an API and at least three Checks (`IsWeakForm` 5, bounded denominators 5, level 5, `modularLambda` 4, `lambdaField` 4, `congruenceSpan` 4, `boundedDenominatorSpan` 5, `IsVectorValuedForm` 5, `L_ρ` 4, `W_j` 4, `weakFormAlgebra` 3, `quasiModularWeakAlgebra` 4, `HasCuspidalExpansionOver` 4, deficiency 4, cuspidal model 5). No LaTeX delimiters, pull-request numbers, machine paths, HTML anchors or process words; "lemma" occurs only in "Ihara lemma" and source locators.
- The layers are not the article's sections: Layer 3 joins CDT §3 with §4.2, Layer 4 (CDT §4.4) precedes Layer 5 (CDT §4.3) because §5.2 needs §4.3 here, and CDT §7 is split over Layers 7–9.
- Wording: 14 passages set beside CDT25 (the 15 sampled locators and Lemma 7.4.4, §7.4.8, Definition 4.2.1); no sentence or proof plan follows the source's wording, and no table, figure or list is taken over.

Source independence: 14 passages compared with 1 source (CDT25), none shared; largest share CDT25, 63 of 66 parenthesised locators; contents compared with CDT25: independent. KSV10 was not re-read this round (round 5 read it); Ihara1994 could not be read.

## Not verifiable

- Ihara1994, Theorem 1 and §4 (§9.2): settled as uncertified, cited by locator; the text was not read.
- The internal consistency of the supplier statements that are still in open pull requests (the rank bound of DiophantineApproximationAndTranscendencePartII §4.5, the mean growth of ConformalMappingPartII §9.19, ModularCurvesPartII Layer 15) was resolved by heading and contract sentence only; their proofs are those roadmaps' reviews.
- Whether SpecialFunctionsTheta will merge before this roadmap: it is another author's open pull request and is not in the merge order file.

## Source issues

- **Misprint** in CDT25 at proof of Theorem 4.3.2, p.656: the source says the chosen form lies in the larger field at level 2Np; it should be an element of the field at level 2N outside the congruence field; affects the proof.
- **Error** in CDT25 at Corollary 7.3.4, p.691: the source says bounded denominators of all components give a congruence kernel of ρ; it should be that a principal congruence subgroup fixes the span of the values; affects a stated result.
- **Error** in CDT25 at §7.4.8, p.695: the source says a non-archimedean deficient place exists whenever the kernel of ρ is not congruence; it should require a noncongruence component with coefficients integral outside finitely many places; affects a stated result.
- **Misprint** in CDT25 at Lemma 7.4.4, pp.692–693: the source says the derivative in the half-period parameter sends Δ to E₂Δ; it should be 2E₂Δ, or the derivative in the full-period parameter; affects nothing.
- **Misprint** in CDT25 at Proposition 3.0.1, p.650: the source says the dimension is at most a constant times N³ log N for all N; it should be log(2N), the printed bound being 0 at N = 1; affects a stated result.
- **Error** in CDT25 at (1.0.4), p.629: the source says the function has level Γ₀(2); it should be the theta group, since translation by one changes its sign in the half-period parameter; affects nothing.
- **Error** in CDT25 at §4.4, p.658: the source says conjugation by diag(p, 1) maps the signed group of level N with lower-left entry divisible by p to itself; it should map it onto the subgroup with upper-right entry divisible by p; affects the proof.
- **Gap** in CDT25 at proof of Theorem 7.3.3, p.690: the source says the bundle has rank 6n and may be assumed irreducible; it should work with the continuation space of the one component, of dimension at most n; affects the proof.

## For the human reviewers

- **Scope.** Completed/ConformalMapping (README :89) and BelyiMaps (README :192–193) on main assign the λ function to the ModularForms family; the open SpecialFunctionsTheta (README :135–136) claims it. Which roadmap owns λ is a decision between two authors (R01).
- **Scope.** NoncongruenceModularForms on main names ModularFormsPartII, which is not on main, as a supplier (its README :300–308).
- **Licence.** CDT25 was read in the authors' offprint, which carries the publisher's notice "Copyright restrictions may apply"; the manifest classes it `author-page`.
- **Not tested.** Ihara1994 (§9.2) is cited by locator only; parts 1 and 2 of the copyright check were not run against it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5b5a1815b193f1d3b9847f38a31ba25ca8878cda", "job": "REV-PKG-ModularFormsPartII~6", "model": "fable", "worker": "chris-x52"} -->
