# Review of ZerosOfLFunctions (pull request #1913 at 9b48d25)

**Verdict:** needs changes

:robot: AI-assisted review (Claude Opus 5.5). This is a full review of `TauCetiRoadmap/ZerosOfLFunctions/` at `9b48d25`. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with only `sorry` warnings. Both findings of the previous review are repaired. Two P3 findings remain: a *Needs:* line that the new 8.6 headline makes too coarse, and a pull-request description that names the wrong suppliers. Neither is blocking.

## R01 (P3) — The 8.6 *Needs:* line puts the Weil-formula headline behind 8.5 and 6.3–6.4, and omits two of its inputs

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md` lines 2332–2347. The line begins: "*Needs:* 8.1–8.5, 6.3–6.5, 5.6a, 4.5, 1.5; Arithmetic Dirichlet Series §2.3, … ; for the Weil formula, L-functions Layer 5 `heckeData`, `differentiable_completedHeckeLFunction` …".

**Claim.** Section 8.6 now holds three statements with different inputs:

- the truncated formula for `χ`;
- the estimate of `ψ_K(x, χ)`;
- the headline `heckeLFunction_weilExplicitFormula`.

The shared head of the line makes the Weil formula depend on 8.1, 8.3, 8.5 and the regions 6.3–6.4. Its route (README lines 2327–2330: shift, reflection, Mellin inversion) uses none of them. An implementer of the headline is therefore blocked behind `primeIdealCount_effective` and `heckeLFunction_zeroFreeRegion`.

The line also omits two inputs that the route does use:

- **1.4**, which gives `logDeriv Gammaℝ` at the shifted argument `3 + it` and bounds the horizontal edges. 8.4's own line (README 2220) lists 1.4 item by item.
- **The finite-order lemma** that both parity lemmas take as a hypothesis.

**Witness.** At the Tau Ceti pin, `HeckeCharacter.conductor_ofRayClassCharacter` takes `hη : (ofRayClassCharacter 𝔪 η).IsFiniteOrder`, and `HeckeCharacter.mem_conductor_infinitePart_iff` takes `hχ : χ.IsFiniteOrder`. Only `TauCeti.GlobalNumberFields.HeckeCharacter.isFiniteOrder_ofRayClassCharacter` (`NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:186`) supplies them.

**Repair.**

1. Replace the part of the line before "for its statement" by:

   > *Needs:* for the truncated formula and the estimate of `ψ_K(x, χ)`: 8.1–8.3, the argument of 8.5, 6.3–6.4, 4.5, 1.5, and Arithmetic Dirichlet Series §2.3, at the pin `TauCeti.MultiplicativeIdealWeight.logDeriv_LSeries_eq_neg_tsum_vonMangoldtTransform` for the weight of `χ`, which makes `ψ_K(x, χ)` the summatory function of the coefficients of `−logDeriv (heckeLFunctionC χ.character)` on `Re s > 1`, which the Dedekind identity `TauCeti.hasSum_idealTerm_vonMangoldt` of 8.3 does not give. For the Weil formula: the route of 8.4 with 8.2, 1.4 and 4.5; 5.6a and 6.5 (the zeros of `Λ(χ, ·)` on the open strip); the same Arithmetic Dirichlet Series §2.3 identity for `χ` and `χ⁻¹`; L-functions Layer 5 `heckeData`, `differentiable_completedHeckeLFunction` and `completedHeckeLFunction_one_sub`; Tau Ceti `TauCeti.GlobalNumberFields.HeckeCharacter.isFiniteOrder_ofRayClassCharacter` (the finite-order hypothesis of the next two), `TauCeti.GlobalNumberFields.HeckeCharacter.mem_conductor_infinitePart_iff`, `TauCeti.GlobalNumberFields.HeckeCharacter.conductor_ofRayClassCharacter` and `TauCeti.LFunctions.PrimitiveRayClassCharacter.conductor_character`; Mathlib `mellin`, `mellinInv_mellin_eq`;

   The "for its statement" clause stays as it is.

2. In "From Tau Ceti", in the bullet on the real signs (README lines 337–352), add after `ofRayClassCharacter`: "`TauCeti.GlobalNumberFields.HeckeCharacter.isFiniteOrder_ofRayClassCharacter` (`HeckeCharacter/Basic.lean`: the Hecke character of a ray-class character has finite order, the hypothesis of the two lemmas below)".

**Tested.** I elaborated this example in a scratch module with `lake env lean`. It closes with exactly the four lemmas the repaired line names and gives no error:

```lean
example (K : Type*) [Field K] [NumberField K] (ψ : PrimitiveRayClassCharacter K)
    (w : {w : InfinitePlace K // w.IsReal}) :
    w ∈ ψ.conductor.infinitePart ↔
      (HeckeCharacter.ofRayClassCharacter ψ.conductor ψ.character).infinityType.realParity w = 1 := by
  have h := HeckeCharacter.isFiniteOrder_ofRayClassCharacter ψ.character
  rw [← HeckeCharacter.mem_conductor_infinitePart_iff h,
    HeckeCharacter.conductor_ofRayClassCharacter _ h, ψ.conductor_character]
```

## R02 (P3) — The pull-request description names the wrong suppliers and an outdated list of headlines

**Location.** The pull-request description, outside the generated `merge-order` block. Two sentences are wrong:

- "**Suppliers.** LFunctions, ClassFieldTheory and ModularForms, all on main; no open pull request is a supplier."
- "Suggested.lean states the headline theorems `heckeLFunction_zeroFreeRegion`, … `rayClassPrimeCount_effective` and `frobeniusPrimeCount_effective_abelian`."

**What the head shows.**

- **Suppliers.** The README's `## Exact supplier contracts` (lines 187–534) has sections for Mathlib, Tau Ceti, ArithmeticDirichletSeries, GlobalNumberFields, NumberFieldArithmetic, Chebotarev, LFunctions and ClassFieldTheory. It has none for ModularForms. README line 36 names ModularForms only as a consumer of Tau Ceti's `HeckeRing.GL2.Newform.analyticConductorAt`, and the ModularForms README on main (line 243) takes that declaration from Tau Ceti.
- **Headlines.** Against main, the head adds eight theorems to `Suggested.lean`. The description lists six. It omits `dedekindZeta_weilExplicitFormula` and `heckeLFunction_weilExplicitFormula`, which README lines 13–14 name as end theorems.

**Repair.** Replace the two sentences with:

> **Suppliers.** LFunctions and ClassFieldTheory, and the completed ArithmeticDirichletSeries, GlobalNumberFields, NumberFieldArithmetic, Chebotarev and ContourIntegration (as Tau Ceti realizes them), all on main, with Mathlib and Tau Ceti at the pins; no open pull request is a supplier.

> Suggested.lean adds the headline theorems `heckeLFunction_zeroFreeRegion`, `riemannVonMangoldt_heckeLFunction`, `dedekindZeta_weilExplicitFormula`, `heckeLFunction_weilExplicitFormula`, `riemannZeta_zeros_summable_ordinate`, `neg_re_logDeriv_riemannZeta_le`, `rayClassPrimeCount_effective` and `frobeniusPrimeCount_effective_abelian`.

## Previous findings (review of `6355596`)

- **R01 (P2), the Weil formula for a nontrivial Hecke character — repaired.**
  - `Suggested.lean:364` declares `heckeLFunction_weilExplicitFormula`. Its signature is the proposed text.
  - The docstring's "Not stated here" bullet is gone, and the Layer 8 item of "Stated here" (lines 46–47) names 8.6.
  - README 8.6 (lines 2311–2330) states the shift rule and names the theorem.
  - The *Needs:* line (2337–2347) and "From Tau Ceti" (337–352) cite the parity lemmas.
  - What remains of this area is R01 above.
- **R02 (P3), Mathlib contract — repaired.** README lines 243–248 add `NumberField.discr`, `nrRealPlaces`, `nrComplexPlaces`, `Module.finrank`, `DirichletCharacter.IsPrimitive`, `IsAbelianGalois` and `ConjClasses`, each with the sections that use it.
- **Remark on the Summary — addressed.** Lines 13–14 now list "the Weil explicit formula for both families".

## Verified sound

**Gate.** I re-ran it at `9b48d25`. Every counter is 0 and the result is OK. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`, and the pull request changes nothing outside the folder.

**Dependency check.** Output: `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)`. There is no UPWARD and no CYCLE line. Every supplier is on main (LFunctions, ClassFieldTheory, and the Completed ArithmeticDirichletSeries, GlobalNumberFields, NumberFieldArithmetic, Chebotarev and ContourIntegration). AnalyticNumberTheoryPartI (merge order 50) is a consumer.

**Elaboration.** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` gives 19 `sorry` warnings and nothing else.

- The file has no `variable` block, so no declaration can lose a section binder. I compared each elaborated type with its README statement.
- `ContDiff ℝ ∞` is `↑⊤`, not `ω`.
- `nrRealPlaces K − ψ.conductor.infinitePart.card` never truncates. `infinitePart` is a `Finset {w // w.IsReal}` (`RayClass/Modulus.lean:104`), and `nrRealPlaces` is the cardinality of that subtype.

**Padding probe.** I replaced every `sorry` in a scratch copy by `first | rfl | simp | norm_num | infer_instance | trivial | decide`. All 19 theorems fail with unsolved goals. None is padding.

**Library declarations opened.**

- I elaborated a scratch file of 202 `#check @…` lines with 46 Tau Ceti imports, after building the missing `HeckeCharacter.RealParity` module.
- 201 names resolve as written. `LSeries.wienerIkehara` (README 453) resolves under that section's stated namespace as `TauCeti.LSeries.wienerIkehara` (`LSeries/WienerIkehara/SharpCutoff.lean:300`).
- Statements I compared in detail:

| Declaration (pin) | File:line | What I checked |
| --- | --- | --- |
| `HeckeCharacter.mem_conductor_infinitePart_iff` | Tau Ceti `HeckeCharacter/RealParity.lean:79` | `w ∈ (χ.conductor hχ).infinitePart ↔ χ.infinityType.realParity w = 1`, needs `IsFiniteOrder` (R01) |
| `HeckeCharacter.conductor_ofRayClassCharacter` | `RayClass/Character/Conductor.lean:81` | conductor equality, needs `IsFiniteOrder` (R01) |
| `PrimitiveRayClassCharacter.conductor_character` | `LFunctions/Hecke/Primitive.lean:104` | `ψ.character.conductor = ψ.conductor` |
| `heckeData` (LFunctions `Suggested.lean` on main) | line 1632 | real shifts are `realParity.val`, `Gammaℂ` shift `0` at each complex place, as 8.6 says |
| `RayClassCharacter.toMultiplicativeIdealWeight` | `RayClass/Character/Weight.lean:42, 109` | `0` off ideals prime to `𝔪.support` |
| `heckeLFunctionC` | `LFunctions/Hecke/Basic.lean:74` | `meromorphicContinuation 1` of the unitary-weight series; `MeromorphicNFOn univ` |
| `HasMeromorphicContinuation`, `HasFunctionalEquation`, `dual_completed`, `HasFunctionalEquation.eventuallyEq` | `LFunctions/Data/Basic.lean:183, 193, 147, 269` | fields as README 299–316 and 4.2, 4.4, 5.6 use them |
| `HeckeRing.GL2.Newform.analyticConductorAt_eq` | Tau Ceti `Newforms/AnalyticInvariants.lean` | `N (‖s‖+3)(‖s+1‖+3)` (2.4) |
| `MeromorphicOn.divisor_def` | Mathlib | `if MeromorphicOn f U ∧ z ∈ U then untop₀ else 0` (4.2) |
| `ValueDistribution.logCounting`, `log_counting_zero_sub_logCounting_top` | Mathlib `LogCounting/Basic.lean:351, 99` | `a = 0` gives the positive part; the `D 0 · log r` term is included (4.6) |
| `logDeriv_riemannZeta_one_sub` | Mathlib | hypotheses `∀ n : ℤ, s ≠ n` and `ζ s ≠ 0`, as README 784 says |
| `riemannZeta_ne_zero_of_one_le_re` | Mathlib | no `s ≠ 1` hypothesis; 7.4's confinement route is consistent |
| `exists_differentiableOn_eqOn_exp_comp`, `isOpen_image_…`, `isSimplyConnected_image_…`, `IsOpen.is_const_of_deriv_eq_zero` | Tau Ceti `BranchLogRoot.lean`, `ImageSimplyConnected.lean`; Mathlib | hypotheses match 1.1 |
| `primeCount_eq_primeTheta_div_log_add_integral`, `logIntegral_eq_div_log_sub_add`, `primeCount_primesCongruent_isEquivalent_logIntegral`, `rayClassArtinMap_idealClass` | Tau Ceti | match 8.5, 8.7 and 8.8 |

**Cross-roadmap citations resolved.**

- **LFunctions on main.** All 52 LFunctions names the README consumes (lines 404–405 and 493–523) are declared in LFunctions `Suggested.lean`, including the `Grossencharacter.*` names in its `namespace Grossencharacter` (lines 1754 and 2092). `differentiable_completedHeckeLFunction` (line 1648) and `completedHeckeLFunction_one_sub` (line 1661) carry the hypothesis `χ.character ≠ 1`, as 8.6 assumes.
- **Overlaps.** No id this README cites is dropped by an open pull request, and this pull request drops no id that others cite. #1907 conflicts in both files, and the generated `merge-order` block orders this pull request first.
- **Ownership.**
  - AnalyticNumberTheoryPartI §1.8 on main states a Mestre-form Weil formula. It says outright that "the degree-one specializations use the supplier" (ZerosOfLFunctions 8.2–8.4), so 8.4 and 8.6 have one owner.
  - ExplicitNumberFields (#1944), ExplicitPrimeCounting (#1945) and ExplicitZetaBounds (#1954) cite this roadmap's ids as their supplier and declare none of its theorem names. `roadmaps grep` finds the eight new theorem names only in #1913 and #1907.
- **Provenance row 5.2.** At PrimeNumberTheoremAnd commit `127b50e`, `Complex.weierstrassFactor m z = (1 − z) * exp (partialLogSum m z)` and `partialLogSum m z = −logTaylor (m+1) (−z) = ∑_{j=1}^m z^j/j`. So `m = 1` gives E₁, and neither file contains `sorry`.

**Seeded sample (sources).**

| Target | Source at locator | Result |
| --- | --- | --- |
| 0.4 | definition; quantifiers and API checked (table) | sound |
| 1.1 | pinned declarations above; `exp` is a bijection from `Ω_δ` onto `S_δ`; no nonpositive integer lies in `S_δ` | sound |
| 1.2 | `dlmf-5.11` lines 104–108 (5.11.1 on `\|ph z\| ≤ π − δ`, general log), 563–569 (remainder ≤ `sec^{2n}(½ ph z)` times the first neglected term) | supports `O(1/‖s‖)` with a `δ`-dependent constant; branch agrees on `(1, ∞)` |
| 1.3 | `dlmf-5.11` lines 490–492, 524 (5.11.9, uniform for bounded real `x`) | sound; the `O(1/\|t\|)` remainder re-derived from 5.11.1 |
| 1.4 | `dlmf-5.11` lines 158–160 (5.11.2) | sound |
| 1.4a | Mathlib declarations above | sound |
| 2.4 | `analyticConductorAt_eq` | sound |
| 4.2 | `divisor_def`, record fields | sound |
| 4.6 | `logCounting` definitions | sound |
| 5.2 | Provenance row; no other locator | sound |
| 5.6 | `kadiri2012` lines 230–237 (§2.1.2: `−Re ζ_K'/ζ_K = −∑ Re 1/(s−ρ) + ½ log d_K + Re 1/s + Re 1/(s−1) + Re γ_K'/γ_K`, which agrees with Hadamard exactly when `Re b = −∑ Re 1/ρ`); Davenport uncertified | sound |
| 6.3 | no locator; values in table | sound |
| 6.4 | `kadiri2012` lines 65–73 (§1, (1.5)–(1.6): LMO Lemma 2.3 with `R₄` independent of `K`, `A(χ) = d_K N f(χ)`), lines 79–85 (Theorem 1.1, for 6.2) | sound (see Source issues for (1.6)) |
| 7.4 | Titchmarsh not readable; Mathlib confinement route checked | see Not verifiable |
| 8.7 | Davenport §20 uncertified; pinned counting declarations above | sound |

**Adversarial table** (values computed this round).

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.4 *HasVerticalStripGrowth* | pole at `1+5i`; constant `1`; `exp(−s²)`; sum and product | unbounded as `σ→1` at `t=5`; `C=1, A=0, T₀=0`; `‖exp(−(it)²)‖ = exp(t²)`; exponents `max` and sum | sound | none |
| 1.1 *logGamma* | `θ = π/2, π/4, 0.1`; value at `3` | first `Im = π` at `r = 5.53860, 4.15135, 12.62640` (README 5.539, 4.151, 12.626); `exp(logGamma 3) = 2.000000` | sound | none |
| 1.2 Stirling | §5.11(ii), `n = 1` | `\|R\| ≤ 1/(12‖s‖ sin²(δ/2))` on `S_δ` | sound | none |
| 1.3 strips | `z = σ+it` | `ln\|z\| = ln\|t\| + O(t⁻²)`, `−t arg z = −π\|t\|/2 + σ + O(t⁻²)`; total error `O(1/\|t\|)` | sound | none |
| 1.4 gamma log-derivatives | `s = 2, 3, 1`; pole `−2` | `logDeriv Gammaℝ 2 = −0.860973`, `… 3 = −0.554120`; `logDeriv Gammaℂ 1 = −2.415093 = −γ_E − log 2π`; at `−2` the formula gives `−(log π)/2 ≠ 0` (the junk value) | sound | none |
| 1.4a symmetric form | `s = 2`; `s = −2`; `ψ(i)` | `1.415093` on both sides; `−0.16482` against `0.55412`; `Im ψ(i) = 2.076674` | sound | none |
| 2.4 newform conductor | `Δ`, `k = 12` | `90` at the analytic centre against `15.75` | sound | none |
| 4.2 divisor of `Λ` | `ζ` record at `1` (`U = ∅`, `univ`); at `−2` | `0`, `−1`; `0`; entire completion `−1 + 1 = 0` | sound | none |
| 4.4 local count | `ζ` at `T = 0, √15` | `\|Gammaℝ\| = 2π/(4·10⁻⁴) = 15708`; `\|ζ\| = 0.030448·4·10⁻⁴ = 1.218·10⁻⁵`; `6Λ(3) = 1.147880`; max `1.968652` at `6`; Jensen `2.1942`; `\|ζ\| = 2500.6` and `2499.4` at the two points at distance `4·10⁻⁴` from `1` on the sphere | sound | none |
| 4.6 Nevanlinna | `z²(z−3)`; `1/z` | `1.386 ≤ 1.674`; `3 log(5/3) = 1.5325` on both sides; signed `−log(R/r) < 0` | sound | none |
| 5.2 *E₁* | `z = −½`, `1` | `‖E₁(−½) − 1‖ = 0.09020 ≤ 0.125`; `E₁′(1) = −e` | sound | none |
| 5.6 `Re b` | `zetaEntireCompletion`; `e^s ·`; `χ₄` | `b = −0.288608 − 1 + 1.265512 = −0.023096`; `b + 1 = 0.976904`; `Λ(0) = Λ(1) = 1/2`; `b + conj b = −∑(1/conj ρ + 1/(1−conj ρ))` re-derived at `s = 0` | sound | none |
| 6.3 *IsExceptionalZero* | cap; `ζ` | `c/log q(χ,0) ≤ (log 3/2)/log 3 = 1/2`; empty for `ζ` | sound | none |
| 6.4 region | LMO containment; moduli 2, 6, 6 induced from 3; (4d) | `log q ≥ log A + n log(\|γ\|+2)` with `r₁ + 2r₂ = n` factors; nesting factor `1.2619`; `0.6934`; `log 18 = 2.890`; `log 45.19 = 3.811`; `2∑_{p^j≤10⁶} log p · p^{−1.1j} = 13.8581`; `½ϑ(10⁶) = 499242`; least `D` at `B = 10` is `3361` (`1681 = 41²`) | sound | none |
| 7.4 `riemannVonMangoldt` | `T = 2` | `N(2) = 0`, main term `−0.682`, `\|0.682\| ≤ C log 2` | true | none |
| 8.5 checks | `x = 10`, `10⁶` | `log 12 = 2.4849 ≤ 12.094`; `ψ − ϑ = 1102.42 ≤ 137682.40`; `∑_{k≥2} π(x^{1/k})/k = 99.11` | sound | none |
| 8.6 `heckeLFunction_weilExplicitFormula` | contour; `χ₋₄`; `ℚ(√3)` narrow character; quartic mod 5; parity chain | zero side `= (2πi)⁻¹∫_{(2)} (Λ'/Λ(ψ,s) φ̃(s) + Λ'/Λ(ψ̄,s) φ̃(1−s))`, with no pole term; `log 4 = 1.3863`, `Λ(0) = Λ(1) = 1/2`; `log 12 = 2.4849`, `L(0) = 1/6`, `ψ((1+√3)) = −1 = 0 + (−1)`; `+0.346574i`; chain elaborates | true | R01 (*Needs:* only) |
| 8.7 ray-class count | thresholds `q = 1, 3, 10⁶`; `(4)∞` at `x = 9`; `Li 20/2` | `0.6957`, `2.4958`, `190.868`; `log 21 = 3.0445` against `log 63 = 4.1431`; `log 15 = 2.7081` against `log 5 = 1.6094`; `4.4301`; `x e^{−a√log x} log x = O(x e^{−(a/2)√log x})` | sound | none |
| 8.9 `Li` | `x = 10`, `10⁴` | `5.12044`; `0.7775` against `1.8861`; `159.356` against `117.882` | sound | none |
| `dirichletLFunction_convexity` | `q = 1`, `q = 2`; exponent | `ζ`; vacuous (no primitive character mod 2); `(½+δ)²/(1+2δ) = ¼ + δ/2` | true | none |
| `hadamard_of_orderLE_one` | `ρ = 0`; `s` a zero; `1 − s` | exponent `0`; factor `E₁(1) = 0` makes the product `0 = f s`; `a = 0`, `b = −1` | true | none |
| `zetaEntireCompletion` | `s = 0, 1` | `s(s−1)Λ₀ + 1 = s(s−1)Λ` re-derived; value `1` at both | sound | none |
| `riemannZeta_zeros_summable_ordinate` | first pair | `2/(1 + 14.1347²) = 0.00996`; trivial zeros excluded by the completed carrier | true | none |
| `heckeLFunction_zeroFreeRegion` | `n = 0`; log argument; `ℚ`, `ψ = 1` | vacuous (`finrank ≥ 1`); argument `≥ log 3 > 0`; `ζ` has no zero in the region | true | none |
| `riemannZeta_zeroFreeRegion` | real `s` near `1`; `s = 1` | `ζ < 0` on `(0, 1)`; excluded | true | none |
| `dirichletLFunction_zeroFreeRegion` | mod 2; mod 6 | zeros on `Re s = 0` outside `Re ≥ ½`; double zero needs `c ≥ 2.890 > 0.549` | true | none |
| `neg_re_logDeriv_riemannZeta_le` | `δ ≥ 1`; `\|u\| ≥ 1`; `t → 0` | bounded by `−ζ'/ζ(2) = 0.5700`; `Re 1/(δ+iu) ≤ 1/(2\|u\|)`; `1/(4\|t\|)` | true | none |
| `riemannVonMangoldt_heckeLFunction` | `ψ = 1` against HSW | `hasanalizade2022` line 27 counts `0<β<1`, `\|γ\| ≤ T`; error `0.228(log d + n log T) + 23.108n + 4.520 ≤ C log(AT^n)` since `log(AT^n) ≥ n log 2` | true | none |
| `riemannVonMangoldt_dirichlet` | BMOR; `q = 1` | `bennett2021` lines 83–84 (`q > 1`, `T ≥ 5/7`); `2N(T)` for `ζ` | true | none |
| `chebyshevPsi_explicitFormula` | constant; `T ≤ x` | `−log 2π = −1.8379`; `log x ≤ (1/log 2) x log²x/T`; zeros at `\|γ\| = T` add `O(x log T/T)` | true | none |
| `dedekindZeta_weilExplicitFormula` / `riemannZeta_weilExplicitFormula` | `ℚ(i)`; `ℚ(√5)`; `K = ℚ` | `log 4`; closed strip adds `φ̃(0) > 0`; `−(log π)φ(1)` | true | none |
| `primeIdealCount_effective` | `K = ℚ`, `x = 10` | `π(10) = 4` against `16/3` for Abel of `ψ` | true | none |
| `rayClassPrimeCount_effective` | `(3)∞`; `ℚ(√−5)`, `𝔪 = 1` | `#Cl = 2`; principal split primes `p ≡ 1, 9 (mod 20)` | true | none |
| `primeCounting_progression_effective` | `q = 4`, `a = 2`; `q = 1` | count `1` against `Li x/2` (so `IsUnit` is needed); `π(x)` | true | none |
| `frobeniusPrimeCount_effective_abelian` | `K = L = ℚ`; `ℚ(i)/ℚ`; 8.8 dictionaries at `(8)∞` | `π(x)`; `p ≡ 3 (mod 4)`, `1/2`; `(2/5) = (−2/5) = −1` | true | none |

## Not verifiable

- **Titchmarsh**, *The Theory of the Riemann Zeta-Function*, Theorem 9.4 and §§9.2–9.4 (7.4, in the sample) and §5.1 (3.3–3.4). The manifest does not record it, and I know of no legal open copy. I re-derived the confinement route of 7.4 from the pinned Mathlib declarations instead.
- **Uncertified texts, cited by locator.** Davenport (`davenport2000`: §12 for 5.6, §§15–16, §20 for 8.7), Lagarias–Montgomery–Odlyzko Lemma 2.3 (`lagarias1979`, 6.4; read only through Kadiri's report) and Lang XVII §3 (`lang1994`, 8.4 and 8.6). I re-derived the contour formula of 8.6 instead (table).
- **Not in the manifest.** Iwaniec–Kowalski §§5.1–5.2, Lagarias–Odlyzko 1977 Theorems 1.3 and 9.2 (8.8 remark), and DLMF 5.5.3 and 5.6.6 are cited but not recorded in the package's `sources.toml`. Conversely, `montgomery-vaughan2006` and the locators 5.4.13, 5.5.2 and 5.15.1 are recorded but no longer cited. This is a manifest matter for the worker, not a change to the folder.
- **Ownership against open pull requests** was checked with `roadmaps grep` and `roadmaps overlaps` for #1907, #1944, #1945, #1954 and #2008. It was not checked otherwise.

## Source issues

- **Misprint** in kadiri2012 at §1, (1.6), arXiv v1 p. 2 (lines 71–73): the source says that Lagarias–Montgomery–Odlyzko prove there are no zeros at all in region (1.6); it should say at most one zero there (the possible real zero of (1.5)), since an exceptional zero near 1 lies in (1.6); affects nothing.
