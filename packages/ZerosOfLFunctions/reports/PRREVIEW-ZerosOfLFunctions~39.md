# Review of ZerosOfLFunctions (pull request #1913 at 5cfa90f)

**Verdict:** needs changes

:robot: AI-assisted review (Claude Opus 5.5). Scope: the folder `TauCetiRoadmap/ZerosOfLFunctions/` (README.md, Suggested.lean) at head `5cfa90f6494506c3b118fed28c19fce434c22b3e`, reviewed whole. The gate passes; the mathematics of the README held up under the computed checks below. Three findings, one blocking.

## R01 (P2) — The Weil explicit formula over a number field can be stated at the pins, but only the `K = ℚ` case is

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` lines 59–63 (module docstring): "the explicit formulas 8.3, 8.4 and 8.6 over a general field … are README targets: they are general statements about Tau Ceti's analytic records …, or lemmas on the way to the headlines". Also `README.md` 8.4, line 2168.

**Claim.** The explicit formula is one of the four parts named in the roadmap's title, and README 8.4 states it for every `K`. `Suggested.lean` states only `riemannZeta_weilExplicitFormula` at `K = ℚ`. The docstring gives a reason that does not hold for 8.4. Its statement is about `ζ_K`, not about a general analytic record. It is also not a lemma toward anything: 8.5–8.8 use 8.3, and nothing in the roadmap uses 8.4. So this is a headline theorem that can be stated at the pins and is missing.

**Witness.** The statement below uses the device that `riemannVonMangoldt_heckeLFunction` already uses: zeros of `heckeLFunctionC (1 : PrimitiveRayClassCharacter K).character` on the open strip. It elaborates against the pinned Mathlib and Tau Ceti with only the `sorry` warning.

**Repair.** Add this theorem to the Layer 8 section. It was tested in a scratch module importing `Mathlib`, `TauCeti.NumberTheory.LFunctions.Hecke.Basic`, `…Hecke.Primitive` and `TauCeti.NumberTheory.ArithmeticDirichletSeries.VonMangoldt`, with `open scoped nonZeroDivisors` added. Add that import, and the scoped `nonZeroDivisors`, to the file.

```lean
theorem dedekindZeta_weilExplicitFormula (K : Type*) [Field K] [NumberField K] (φ : ℝ → ℂ)
    (hφ : ContDiff ℝ ∞ φ) (hsupp : HasCompactSupport φ) (hpos : tsupport φ ⊆ Ioi 0) :
    Summable (fun ρ : ℂ ↦ (Ioo (0 : ℝ) 1 ×ℂ univ).indicator (fun ρ ↦
        ((MeromorphicOn.divisor (TauCeti.LFunctions.heckeLFunctionC
          (1 : TauCeti.LFunctions.PrimitiveRayClassCharacter K).character) univ ρ).toNat : ℂ) *
          mellin φ ρ) ρ) ∧
      ∑' ρ : ℂ, (Ioo (0 : ℝ) 1 ×ℂ univ).indicator (fun ρ ↦
        ((MeromorphicOn.divisor (TauCeti.LFunctions.heckeLFunctionC
          (1 : TauCeti.LFunctions.PrimitiveRayClassCharacter K).character) univ ρ).toNat : ℂ) *
          mellin φ ρ) ρ =
        mellin φ 0 + mellin φ 1 + (Real.log |(NumberField.discr K : ℝ)| : ℂ) * φ 1 +
          (2 * π : ℂ)⁻¹ * (∫ t : ℝ,
            ((NumberField.InfinitePlace.nrRealPlaces K : ℂ) * logDeriv Gammaℝ (2 + t * I) +
              (NumberField.InfinitePlace.nrComplexPlaces K : ℂ) * logDeriv Gammaℂ (2 + t * I)) *
            (mellin φ (2 + t * I) + mellin φ (1 - (2 + t * I)))) -
          ∑' 𝔞 : (Ideal (NumberField.RingOfIntegers K))⁰,
            TauCeti.IdealArithmeticFunction.vonMangoldt (K := K) 𝔞 *
              (φ (Ideal.absNorm (𝔞 : Ideal (NumberField.RingOfIntegers K))) +
                φ ((Ideal.absNorm (𝔞 : Ideal (NumberField.RingOfIntegers K)) : ℝ))⁻¹ /
                  (Ideal.absNorm (𝔞 : Ideal (NumberField.RingOfIntegers K)) : ℂ)) := sorry
```

On the open strip these are the zeros of `Λ_K`, with the same multiplicities. README 7.5's own argument applies: the gamma factor has no poles on `Re s > 0`, and 6.5 rules out zeros on the two edges. At `K = ℚ` the statement reduces to `riemannZeta_weilExplicitFormula`: `log |d_ℚ| = 0`, `r₁ = 1`, `r₂ = 0`, and the ideals of `ℤ` are indexed by `n ≥ 1`. The ℚ form can stay as the instance on Mathlib's carriers, as `riemannZeta_zeroFreeRegion` stays beside `heckeLFunction_zeroFreeRegion`. Also:

- In README 8.4, change "At `K = ℚ` this is `riemannZeta_weilExplicitFormula`" to name `dedekindZeta_weilExplicitFormula` for every `K`, with the ℚ form as its instance.
- Remove 8.4 from the docstring's list of README targets and add it to the "Stated here" list. The name occurs in no other roadmap, on main or in an open pull request.

## R02 (P3) — Another open revision of this roadmap conflicts with this one, and no order is stated

**Location.** The pull-request description ("Merge order: no pending supplier."), for `README.md` and `Suggested.lean`.

**Claim.** One other open pull request changes ZerosOfLFunctions, and its head conflicts with this one in both files. The description says nothing about it, so nobody knows which of the two is to be rebased onto the other.

**Witness.** In #1907 ("direct Dirichlet selected-zero interfaces"), `heckeLFunction_zeroFreeRegion` has a different shape: one clause concluding `ρ₁ = ρ₂ ∧ ρ₁.im = 0 ∧ …`. That head also declares `dedekindZeta_zeroFreeRegion`, `riemannVonMangoldt_dedekindZeta`, `completed_orderLE_one`, `gammaLogDerivBound` and `finite_zero_sum_le_logDeriv`, none of which is here.

**Repair.** State in the description which of the two pull requests is rebased onto the other before either merges. After the rebase, do not restate targets that the other one already changes. The README stays free of pull-request numbers.

## R03 (P3) — "Not owned here" names no owner, although roadmaps on main own those items

**Location.** `README.md` lines 86–106. For example: "Weierstrass factorization beyond genus `0` and `1`: elementary factors `E_p` for `p ≥ 2` and Hadamard's theorem beyond order one;"

**Claim.** The scope section should say which roadmap, and which section, takes each deferred item. Several items here have owners on main, but the list does not name them. In addition, 8.9 restates the two-term case of an expansion that a roadmap on main owns, and this is not mentioned.

**Witness.** These sections exist in AnalyticNumberTheoryPartI (on main; listed after this roadmap in the merge order):

| Section | Topic | README line |
| --- | --- | --- |
| §0.6 | Landau–Page | 247 |
| §0.9 | Siegel's theorem | 288 |
| §0.15 | Weierstrass primary factors | 530 |
| §0.23 | finite-order Hadamard | 644 |
| §2.18a | Artin L-functions and Brauer continuation | 1676 |
| §2.49 | effective Chebotarev for Galois `L/F` | 2166 |

SpecialFunctionsEiLiErfIncompleteGamma §8.4 (README line 1062) proves the expansion of `li` from DLMF 6.12.2. That roadmap consumes §§1.2–1.3 of this one (its README lines 347–352), so it cannot be cited here as a supplier.

**Repair.** Name the owners in the bullets:

- "Siegel's theorem (AnalyticNumberTheoryPartI §0.9)"
- "the Landau–Page statement across a family of characters (AnalyticNumberTheoryPartI §0.6)"
- "…Hadamard's theorem beyond order one (AnalyticNumberTheoryPartI §§0.15, 0.23)"
- "Artin L-functions of degree greater than one and Brauer induction (AnalyticNumberTheoryPartI §2.18a), and effective Chebotarev for a nonabelian class (AnalyticNumberTheoryPartI §2.49)"

Also add the bullet "the full asymptotic expansion of `li` (SpecialFunctionsEiLiErfIncompleteGamma §8.4, which consumes §§1.2–1.3 here); 8.9 keeps its two-term case". Do not name AnalyticNumberTheoryPartI §0.34 as the owner of "the nonexistence of exceptional zeros". Its statement is an effective lower bound for `1 − β` uniform in the conductor, which is the open Landau–Siegel problem.

I ran the dependency check on a scratch copy of the README with these mentions added. Result: `depcheck: 236 roadmaps, 2270 edges, 0 problem(s)`.

## Verified sound

**Gate.** I re-ran the gate at 5cfa90f. Every counter is 0: set_option, sorry-data, statement-hygiene, readme-ids-missing, depcheck, outside-folder, stray-files and the rest. Result OK. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.NT"`). No file outside the folder changes.

**Dependency check.** Output: `depcheck: 236 roadmaps, 2270 edges, 0 problem(s)`. No UPWARD or CYCLE line. The suppliers are LFunctions (merge order 27), ClassFieldTheory and ModularForms (on main; ModularForms is used only through Tau Ceti declarations), and the completed ArithmeticDirichletSeries, GlobalNumberFields, NumberFieldArithmetic, Chebotarev and ContourIntegration. No open pull request is a supplier.

**Elaboration.** `lake env lean` on `Suggested.lean` gives 17 `sorry` warnings and nothing else. The file has a single `import Mathlib` plus seven Tau Ceti modules, all used. There is no `variable` block, so no binder can be dropped. I compared all 20 elaborated signatures with their README statements.

**Padding probe.** I ran scratch copies with every `sorry` replaced:

- by `first | simp | rfl | norm_num | infer_instance`: all 17 theorems fail;
- by `exact?`: all 17 fail (no suggestion, or a heartbeat timeout).

No declaration restates a definition, mirrors a Check, or computes a value. The two ζ-instance lemmas, `riemannZeta_zeros_summable_ordinate` and `neg_re_logDeriv_riemannZeta_le`, are not one-tactic consequences of anything at the pins.

**Library names.** All 267 backticked identifiers in the README went through `#check`, with namespace prefixes tried. 211 resolve at the pins. The other 56 are:

- 10 file names, notations and namespaces;
- 3 Perron names, present at Tau Ceti `NumberTheory/ArithmeticDirichletSeries/Perron/Formula.lean:130` and following (not imported by my probe);
- 43 names from the LFunctions roadmap. All are declared in its `Suggested.lean` on main, in the layer cited:
  - `dedekindZetaC` at line 965, Layers 2–3;
  - `heckeLFunctionC_eq` 1587, `partialZeta_eq_sum_heckeLFunctionC` 1620, `completedHeckeLFunction_eq_mellin` 2550 and the `Grossencharacter.*` names, Layers 5–6;
  - `heckeLFunction_ne_zero_of_one_le_re` 2680, `three_four_one_nonneg` 2685, `meromorphicOrderAt_dedekindZetaC_one_add` 2688, Layer 7;
  - `dedekindZeta_logDeriv_eq` 2820 and `dedekindZeta_idealVonMangoldt_nonneg` 2828, Layer 8;
  - the average-coefficient predicate in prose at LFunctions README line 374, Layer 0.

**Declarations opened at the pins.**

| Declaration | File:line | What I checked |
| --- | --- | --- |
| `AnalyticOnNhd.sum_divisor_le` | Mathlib/Analysis/Complex/JensenFormula.lean:389 | its hypotheses `1 ≤ M`, `f c ≠ 0` match 4.3 |
| `ValueDistribution.logCounting` | …/ValueDistribution/LogCounting/Basic.lean:351 | 4.6 |
| `log_counting_zero_sub_logCounting_top` | same file :403 | 4.6 |
| `PhragmenLindelof.vertical_strip` | Mathlib/Analysis/Complex/PhragmenLindelof.lean:275 | 3.2 |
| `Complex.borelCaratheodory` | Mathlib/Analysis/Complex/BorelCaratheodory.lean:109 | 5.5 |
| `DirichletCharacter.completedLFunction` | Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:231 | equals `L · gammaFactor` almost everywhere, so its zeros on the closed strip are the nontrivial zeros |
| Tau Ceti `AnalyticLFunctionData` and its `dual`, `HasDirichletAgreement`, `HasMeromorphicContinuation`, `HasFunctionalEquation` | NumberTheory/LFunctions/Data/Basic.lean:82, 121, 174, 183, 193 | fields match the README's conventions; `degree_pos` |
| `ArithmeticLFunctionData` | Data/Normalization.lean:78 | extends the analytic record, so 2.3 is well typed |
| `NormalizationTranslation` | Data/Normalization.lean:124 | `gammaR_eq` adds `w/2` to the shift, which fixes 2.3's sign |
| `HeckeRing.GL2.Newform.analyticConductorAt`, `analyticConductorAt_eq` | NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean:125, 133 | 2.4 |
| `PrimitiveRayClassCharacter` | Hecke/Primitive.lean:91 | |
| `heckeLFunctionC` | Hecke/Basic.lean:74 | |
| `TauCeti.Real.logIntegral` and its API | Analysis/SpecialFunctions/LogIntegral.lean:141, 180, 277, 321, 92, 102 | 8.5 and 8.9 |
| `TauCeti.primeIdealTheorem` | ArithmeticDirichletSeries/Prime/PrimeIdealTheorem.lean:39 | counts the same thing as `primeIdealCount_effective` |
| `primeCount_primesCongruent_isEquivalent_logIntegral` | Chebotarev/PrimeCounting/PrimesCongruent.lean:50 | same hypotheses as `primeCounting_progression_effective` |
| `IdealArithmeticFunction.vonMangoldt` | ArithmeticDirichletSeries/VonMangoldt.lean:82 | |

**Duplication.** Mathlib has no complex Stirling formula, zero-free region, Hadamard product or effective prime-number theorem. Its `Hadamard.lean` is the three-lines theorem. Tau Ceti has only the qualitative prime ideal theorem and Chebotarev counts.

**Overlaps and ownership.** No id this roadmap cites is dropped by an open pull request, and none of this roadmap's ids that other roadmaps cite is dropped here. AnalyticNumberTheoryPartI (main) consumes 0.1–0.2, 1.2–1.4, 3.3–3.4, Layer 4, 5.2–5.6, 6.2–6.4 (with 6.4d), 7.4 and 8.2–8.8, and all of them exist at this head. I checked the closest open roadmaps: ExplicitZetaBounds, ExplicitNumberFields, ExplicitPrimeCounting and GlobalHolomorphicFunctions (which cites 5.1–5.4 as owned here). Each cites this roadmap as the owner; none owns the same object.

**Sources (seeded sample).**

| Target | Source and locator | Verdict |
| --- | --- | --- |
| 1.2 | `dlmf-5.11` line 104–108 (5.11.1, in the sector `\|ph z\| ≤ π − δ`) and lines 563–569 (§5.11(ii): remainder at most `sec²ⁿ(½ ph z)` times the first neglected term, so `O(1/\|z\|)` uniformly) | supports 1.2 as written |
| 1.3 | `dlmf-5.11` line 488–492 (5.11.9) | supports 1.3 |
| 1.3a | DLMF 5.6.6, fetched from dlmf.nist.gov/5.6 (line 264–266) | supports 1.3a |
| 6.2 | `kadiri2012` line 79–85 (Theorem 1.1, p. 2: regions (1.7) for `\|Im s\| ≥ 1` and (1.8) for `\|Im s\| ≤ 1`, at most one zero, real and simple, for `d_K` large); line 65–73 (§1, (1.5)–(1.6), LMO Lemma 2.3) | matches |
| 7.5 and the Lean docstrings | `bennett2021` lines 83–84 (Corollary 1.2, `q > 1`, `T ≥ 5/7`) and lines 73–76 (the gap in Trudgian's proof); `hasanalizade2022` lines 63–65 (Corollary 1.2, `T ≥ 1`) | match |
| 2.2, 2.3, 2.4, 4.6 | carry pinned declarations rather than texts | checked at the pins above |
| 5.1, 8.9 | give a proof route rather than a locator | routes recomputed (table) |

**Adversarial table.** Values computed on each side. The numbers come from a pure-Python recomputation (Euler–Maclaurin for `ζ`, a sieve to `10⁶`, Simpson's rule for `Li`).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.2 Stirling on `S_δ` | `θ = π/2, π/4, 1/10` crossings of `Im logGamma = π` | `t log t − t − π/4 − 1/(12t)` at `t = 5.539`: 3.142; `θ = π/4`, `r = 4.151`: 3.141; `θ = 1/10`, `r = 12.626`: 3.1414 | sound | none |
| 1.3 vertical strips | expansion of `Re[(s−½) log s − s]` for `σ ∈ [a,b]` | `(σ−½) log\|t\| − π\|t\|/2 + O(t⁻²)`; with `½ log 2π + O(1/\|s\|)`, the error is `O(1/\|t\|)` | sound | none |
| 1.3a `‖Γ(s)‖ ≤ Γ(Re s)` | `Re s = ½, 3/2, 3, −½` | `π/cosh πt ≤ π`; `√π/2 < 1`; `Γ(3) = 2 > 1`; `Γ(−½) = −2√π < 0` (so `0 < Re s` is needed) | sound | none |
| 1.4a symmetric `ζ'/ζ` | `s = 2`, `s = −2` | `s = 2`: both sides `γ + log 2π − 1 = 1.41509` (`−0.56996 + 1.98505`). `s = −2`: left `−0.16482`, right `0.55412` (junk `0` terms), so `ζ(s) ≠ 0` is needed | sound | none |
| 2.1–2.2 conductors | `ζ` on `[−5,5]`; `gammaC = {0}`; `gammaR = {i}` | `\|t\|+3 ≤ ‖s‖+3 ≤ (8/3)(\|t\|+3)`; `3·4 = 12`; factor smallest at `t = −1`; lower bound `max(3, \|t\|+3−M)` | sound | none |
| 2.3 translation | newform weight `k`; `w = 0` | shift `0 ↦ (k−1)/2`; `½ + (k−1)/2 = k/2`; `N^{−s/2}N^{−w/4}` on both sides | sound | none |
| 2.4 newform conductor | `Δ`, `k = 12`, `N = 1` | `(6+3)(7+3) = 90` equals Tau Ceti's value at 6; the value at `½` is `3.5·4.5 = 15.75` | sound | none |
| 3.1 Mellin tail | `R = 0`, `c = α = 1` | `E₁(1) = 0.2194 < e⁻¹ = 0.3679 < Γ(1) = 1` | sound | none |
| 3.4 exponent | `σ = −δ, ½, 1+δ` | `½ + δ`, `¼ + δ/2`, `0` | sound | none |
| 3.5 completed growth | `‖Λ(2m+2i)‖` at `m = 10, 20` | 3.67680 and 13519751.81 (against `π⁻ᵐ(m−1)!` = 3.87493 and 13870661.3) | sound | none |
| 4.3 Jensen, trailing form | `z`, `z/10`, `1 − z/2` | 2 against true 1; 3.32 against 1 (`(R/M)g` gives 2.32); 1.71 against 0 | sound | none |
| 4.4 local count | `ζ` at `T = 0` and `T = √15` | `ζEC(6) = 4π³/63 = 1.96865`, `ζEC(2) = π/3`, bound `2.19`; `ζEC(3) = ζ(3)/(2π)·6 = 1.14788`; `‖Γℝ‖ ≈ 1.57·10⁴` and `‖ζ‖ ≈ 1.22·10⁻⁵` near `−2`; `‖1 − (2+i√15)‖ = 4` | sound | none |
| 4.5 counts | `N(100)`; shift factor | `29`; main term `28.13`; `(T+7/2)/(T+3) ≤ 7/6` | sound | none |
| 4.6 Nevanlinna | `z²(z−3)` with `(r, R) = (2,4), (3,5)`; `1/z` | `1.386 ≤ 1.674`; `3 log(5/3) = 3 log(5/3)`; signed carrier gives `−log(R/r)` | sound | none |
| 5.1 finite-order count | Jensen at `R = 2r`; `A < 0` | `n(r) log 2 ≤ O((2r)^{A+ε})`; constant function, count 0 | sound | none |
| 5.2 `E₁` | `z = −½` | `1 − 1.5e^{−½} = 0.0902 ≤ ½·¼` | sound | none |
| 5.5 Hadamard | `1 − s`; `ξ`; `exp(s)·ζEC` | `a = 0`, `b = −1`; `b = −0.0230957 = −Σ Re 1/ρ`; shifted `b = 0.9769043`, ruled out by the functional equation | sound | none |
| 5.6a summability | first pair of zeros; trivial-zero variant | `2/(1+14.1347²) = 0.00996`; trivial zeros each contribute summand `1`, so that variant diverges; `‖ρ−2‖² ≤ 4(1+γ²)` | sound | none |
| 6.2/6.4 regions | principal characters mod 2 and mod 6; character mod 6 induced from mod 3; nesting factor | `1 − 0.5493/1.7918 = 0.6934`; `log 18 = 2.890`; `log 45.19 = 3.811`; `1 + log(4/3)/log 3 = 1.262 < 1.27` | sound | none |
| 6.4 (4d) discriminant term | `σ = 1.1`, `B = 10⁶` | `−ζ'/ζ(1.1) = 9.44104`; `2Σ_{p^j≤10⁶} log p · p^{−1.1j} = 13.8581 > 10 + 3.85`; `½ϑ(10⁶) = 499242`; `3361` prime, `≡ 1 (mod 1680)` | sound | none |
| 7.5 extra-zero record | `1 + 5·2^{−s} + 2·4^{−s}` | roots at `Re s = 2.189` and `−1.189`; `2^s + 5 + 2^{1−s}` is symmetric under `s ↦ 1 − s` | sound | none |
| 8.3 trivial zeros | `ℚ`, `ℚ(√5)`, `ℚ(i)` at `x = 2` | `c_ℚ = −log 2π = −1.8379`; order `1` at 0; `−log(1 − 1/2) = log 2` | sound | none |
| 8.4 Weil (ℚ and `K`) | contour shift recomputed; `φ = 0` | `Σ m φ̃(ρ) − φ̃(0) − φ̃(1) = (2πi)⁻¹∫_{(2)}(φ̃(s)+φ̃(1−s))Λ'/Λ`; the `½ log\|d_K\|` term gives `log\|d_K\| φ(1)`; at ℚ `−(log π)φ(1)` | sound; the general form is missing from the Lean file | R01 |
| 8.5 PIT | `x = 10`, `x = 10⁶`, `ℚ(i)` | `log 2520 − log 210 = log 12`; `ψ−ϑ = 1102.42 ≤ 137682.4`; `Σ1/k = 78597.11` against `π = 78498`, difference `99.11`; `2 log 2 ≤ 24.19` | sound | none |
| 8.6 Hecke prime side | quartic `χ` mod 5, `φ` supported in `(0.4, 0.6)` | `log 2 · conj(i)/2 = −(i log 2)/2`, against `+` if the conjugate is dropped | sound | none |
| 8.7 ray classes | `(3)∞`; `(4)∞` at `x = 9`; `q = 4` at `x = 20`; thresholds | `1/2`, not `1/3`; `log 21`, `log 63`, `log 15`; `4` against `Li 20/2 = 4.43007`; `log x = 0.696`, `2.496`, `190.868` | sound | none |
| 8.9 `Li` | `x = 10`, `x = 10⁴` | `5.12044 = 4.34294 − 2.88539 + 3.66288`; `159.356` against `117.882` | sound | R03 (owner of the full expansion) |
| `OrderLE` | `exp z²`, `1/Γ`, `1` | `exp(r²−r^{3/2}) → ∞`; `‖1/Γ(−n−½)‖ = Γ(n+3/2)/π`; constant `1` works for every `A` | sound | none |
| `zeroCount` | `z/(z−1)`, `0`, `sin πz` on `ℝ` | `1` (and `divisorCount 0`); `0`; finsum junk value `0` | sound | none |
| `zetaEntireCompletion` | `s = 0, 1` | `0·(−1)·Λ₀ + 1 = 1` at both points | sound | none |
| `dirichletLFunction_convexity` | `q = 1`, `t = 0`; conductor ratio | `ζ(½) = −1.4604` finite; `q(‖½+it+a‖+3)/(q(\|t\|+3)) ∈ [1, 1.5]` | true | none |
| `hadamard_of_orderLE_one`, `zetaEntireCompletion_hadamard` | `exp`; `s` a zero; factor at `ρ = 0` | empty product with `b = 1`; partial products `0`, so `HasProd 0`; `E₁(s/0) = E₁(0) = 1`, `m₀ = 0` | true | none |
| `heckeLFunction_zeroFreeRegion` | `K = ℚ`, `ψ = 1`; `ψ = 1` over `ℚ(√D)`; `n = 0` | becomes the `ζ` region `1 − c/log(\|t\|+3)`; an exceptional zero of `L(χ_D)` is allowed since `ψ² = 1`; no field of degree `0`; the pole at `1` has order `−1` | true | none |
| `riemannZeta_zeroFreeRegion` | real `s ∈ (0,1)`; large `c` | `ζ < 0`; at `c ≥ 3 log 3` the region reaches `−2` (∃ `c`, so harmless) | true | none |
| `dirichletLFunction_zeroFreeRegion` | as for 6.2/6.4 | cap `0.549 < 2.890, 3.811` | true | none |
| `neg_re_logDeriv_riemannZeta_le` | `t → 0`, `δ = 2\|t\|`; `δ ≥ 1` | `1/(4\|t\|)` against `log\|t\| → −∞`, so the threshold is needed; LHS `≤ 0.56996` | true | none |
| `riemannVonMangoldt`, `_heckeLFunction`, `_dirichlet` | `ψ = 1` over ℚ; `q = 1`; HSW constants at `T = 2` | `(T/π) log(T/2πe)` is twice the one-sided count; `23.108n + 4.52 ≤ C · n log 2` | true | none |
| `chebyshevPsi_explicitFormula` | `T ≤ x` | `log²(xT) ≤ 4 log² x`; the near-prime-power term `≤ log x` is absorbed | true | none |
| `primeIdealCount_effective`, `rayClassPrimeCount_effective`, `primeCounting_progression_effective`, `frobeniusPrimeCount_effective_abelian` | `ℚ`; `a = 2` mod 4; `ℚ(i)/ℚ` | `π(x)`; count `1` against `Li x/2` (the unit hypothesis is needed); coefficient `1/2` | true | none |

In 8.7, `c₀ = min(c_n/(2n), 1)/2` does not depend on `K` or `𝔪`, as the uniform-width claim needs. I spot-checked the Provenance against PrimeNumberTheoremAnd at commit `127b50e`: `Complex.Hadamard.hadamard_factorization_of_order` and `EntireOfOrderAtMost.summable_norm_inv_pow_divisorZeroIndex₀` exist without `sorry`, as described.

## Not verifiable

- Davenport, *Multiplicative Number Theory* §§11–20 (`davenport2000`, uncertified, paywalled): locators of 5.5, 6.4, 7.5, 8.2–8.7. I checked the statements mathematically, not against the text.
- Lang, *Algebraic Number Theory*, XVII §3, Theorem 3.1 (`lang1994`, uncertified): 8.4. I recomputed the derivation instead.
- Lagarias–Montgomery–Odlyzko, Lemma 2.3 (`lagarias1979`, uncertified): I read only Kadiri's report of it (`kadiri2012` lines 65–73).
- Titchmarsh (§5.1, §§9.2–9.4, Theorem 9.4), Iwaniec–Kowalski (§§5.1–5.2) and Lagarias–Odlyzko 1977 (Theorems 1.3, 9.2): paywalled books, not read. These three works are also not recorded in the package `sources.toml`. In the other direction, `montgomery-vaughan2006` is recorded there for "6.4d direct Dirichlet exports", but this README does not cite it. These are notes for the manifest; they are not findings against the folder.
- Ownership against open pull requests was checked only for the roadmaps named under Overlaps.

## Source issues

- **Misprint** in kadiri2012 at §1, display (1.6), p. 2: the source reports LMO's whole-strip region as containing no zeros at all; it should except the possible real zero of the box (1.5), or be restricted to heights outside that box; affects nothing.
- **Gap** in trudgian2015 at the proofs of Theorems 1 and 2: one inequality on the auxiliary parameters is argued to be redundant when it is not (bennett2021 lines 73–76; hasanalizade2022 §1); it should be verified for every parameter range used; affects nothing; corrected in print at bennett2021 Corollary 1.2 (Dirichlet case) and hasanalizade2022 Corollary 1.2 (Dedekind case).
