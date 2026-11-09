# Review of ZerosOfLFunctions (pull request #1913 at 3996b81)

**Verdict:** needs changes

Five findings, all P3: four sit in the README text and one is the merge order with pull request #1907. None of them makes a statement false. The gate passes, `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` elaborates with `sorry` as the only warning, and the dependency check reports no problem.

## R01 (P3) — Twenty L-functions declaration names that the L-functions roadmap does not declare

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md` lines 449–481 ("From TauCetiRoadmap.LFunctions"), plus line 365 and the *Needs:* lines at 1012, 1036, 1461, 1549, 1731, 1756–1766, 2183 and 2279. Example quote: "Layer 5: `heckeLFunctionC_eq` …, `partialZeta_eq_sum_heckeLFunctionC`, … `heckeRootNumber`, `norm_heckeRootNumber`, `completedHeckeLFunction_one_sub` …".

**Claim.** The contract presents the following as the L-functions roadmap's own declarations, consumed by name:
- `heckeRootNumber`, `norm_heckeRootNumber`
- `completedHeckeLFunction_one_sub` and its `_eventuallyEq` form
- `heckeLFunctionC_eq`, `partialZeta_eq_sum_heckeLFunctionC`, `heckeLFunction_ne_zero_of_one_le_re`
- `meromorphicOrderAt_dedekindZetaC_one_add`, `meromorphic_dedekindZetaC`, `meromorphic_completedDedekindZeta`
- `meromorphicOrderAt_completedDedekindZeta_zero`/`_one`, `analyticAt_completedDedekindZeta`
- `dedekindZetaData_hasContinuation`, `dedekindZetaData_hasFunctionalEquation`
- `partialZeta_eq_lSeries`, `sum_partialZeta`
- `Grossencharacter.heckeMellinConstant`, `Grossencharacter.heckeMellinTotal_sub_const_isBigO`
- `three_four_one_nonneg`

**Witness.** On main (3090489), an exact search of `TauCetiRoadmap/LFunctions/README.md` finds none of these 20 names, and neither does the pinned Tau Ceti. The mathematics is there unnamed: Layer 5 gives `Λ(χ,s) = W(χ) Λ(χ⁻¹,1-s), |W(χ)| = 1`.

**Repair.** Cite each item by the statement and layer the supplier gives, or by the name the supplier actually declares:
- **Layer 2:** "convergence on `Re s > 1` and the sum over ray classes" replaces `partialZeta_eq_lSeries` and `sum_partialZeta`.
- **Layer 3:**
  - Its bullet list replaces the six undeclared Dedekind names: meromorphic continuation, simple poles of the completed function at `0` and `1`, analyticity elsewhere, `Λ_K(1−s) = Λ_K(s)` as germs, and the card `dedekindZetaData`.
  - Keep the names Layer 3 does declare: `analyticAt_dedekindZetaC`, `meromorphicOrderAt_dedekindZetaC_one`, `tendsto_sub_one_mul_dedekindZetaC`, `completedDedekindZeta_one_sub`, `tendsto_sub_one_mul_completedDedekindZeta`, `tendsto_mul_completedDedekindZeta_zero`.
- **Layer 5:**
  - "agreement with the norm-regrouped series on `Re s > 1`" replaces `heckeLFunctionC_eq`.
  - "the orthogonality reconstruction `#Cl_𝔪 · ζ(s,c) = ∑_χ conj χ(c) L(s,χ)`" replaces `partialZeta_eq_sum_heckeLFunctionC`.
  - "the functional equation `Λ(χ,s) = W(χ)Λ(χ⁻¹,1−s)`, `|W(χ)| = 1`, and the germ equation of Layer 3 for the trivial character" replaces the root-number and `completedHeckeLFunction_one_sub` names.
- **Layer 6:** "(8.4), with exponential decay of `heckeMellinTotal` to its constant term" replaces the two undeclared `Grossencharacter` names.
- **Layer 7:**
  - "a nontrivial primitive finite-order Hecke L-function has no zero on `Re s = 1`" replaces `heckeLFunction_ne_zero_of_one_le_re`.
  - "`dedekindZetaC K` has order `0` at `1 + it` for `t ≠ 0`" replaces `meromorphicOrderAt_dedekindZetaC_one_add`.
- **Line 365:** drop `three_four_one_nonneg`. Tau Ceti's `TauCeti.LSeries.threeFourOneCombination_nonneg` is already named there.

Test: after the edit, every backticked name in the L-functions subsection occurs in `TauCetiRoadmap/LFunctions/README.md` on main.

## R02 (P3) — Open pull request #1907 also revises this roadmap, and no order is stated

**Location.** The pull-request description: "Merge order: no pending supplier." Nothing there mentions #1907.

**Claim.** This pull request can merge independently of other work on this roadmap.

**Witness.** The overlap check reports that #1907 (head 123254c) conflicts with this head in `README.md` and `Suggested.lean`. #1907 adds §6.4a, `completed_orderLE_one`, `gammaLogDerivBound`, `finite_zero_sum_le_logDeriv`, `dedekindZeta_zeroFreeRegion` and `riemannVonMangoldt_dedekindZeta`; this head has none of them.

**Repair.** State in the description which pull request lands first and that the other one rebases on it. The rebased one should list what it keeps or drops from the other: §6.4a and the five declarations above. This head already covers the Dedekind cases through `heckeLFunction_zeroFreeRegion` and `riemannVonMangoldt_heckeLFunction` at the trivial character.

## R03 (P3) — Two sampled theorems, 3.4 and 4.4, carry no locator

**Location.**
- README 3.4, lines 1112–1131: "Then for every `δ > 0` … there is `C` with `‖poleClearedContinuedL d P s‖ ≤ C …`". The section cites no source; Iwaniec–Kowalski §5.2 is cited only in 3.3.
- README 4.4, lines 1264–1274: "the number of zeros of *entireCompletion* in `closedBall (1/2 + iT) 1` is `O(log analyticConductorAt d (iT))`". There is a route but no source.

**Claim.** Each is a standard theorem stated without a locator.

**Witness.** The README's own shape rule requires "every claim its locator". The `Suggested.lean` docstring of `dirichletLFunction_convexity` does cite Titchmarsh §5.1 and Iwaniec–Kowalski §5.2 for the same bound.

**Repair.**
- 3.4: add "(Iwaniec–Kowalski §5.2; Titchmarsh §5.1 at `K = ℚ`)" at the strip bound.
- 4.4: add the local zero count of Iwaniec–Kowalski §5.3 (Proposition 5.7 (1) in the edition cited; this review could not read that text, so confirm the number) and Davenport §16 for the Dirichlet case.

## R04 (P3) — A Check in 6.2 uses the wrong threshold

**Location.** README line 1588: "an uncapped constant with `c/log 3 ≥ 1` would put `0` in the region".

**Claim.** `c ≥ log 3` puts `s = 0` into the region of the principal character modulo `2`.

**Witness.** That character is imprimitive, so its region uses `q (|Im ρ| + 3) = 6` at `ρ = 0`. At `c = log 3` the region is `Re s ≥ 1 − log 3/log 6 ≈ 0.387`, excluding `0`. The 6.4 Check (line 1742) uses `log 6`.

**Repair.** Replace `c/log 3 ≥ 1` by `c/log 6 ≥ 1` (that is, `c ≥ log 6 ≈ 1.792`). Test: `1 − log 6/log 6 = 0`, so `0` is then in the region.

## R05 (P3) — A Check in 1.6 is ill-typed and tests nothing

**Location.** README line 877: "a statement of the form `continuedL d s ↔ continuedL d (1 − s)` fails at the quartic character modulo `5`."

**Claim.** This Check is meant to separate the functional equation against `d.dual` from one against `d` itself.

**Witness.** `continuedL d s` is a complex number, so `↔` between two of them is not a statement. The bullet computes no value, and a definition that wrongly used `d` in place of `d.dual` would pass it.

**Repair.** Replace it with a computed separation:
- For the quartic character `χ` modulo `5` with `χ(2) = i`, the coefficient at `2` is `i` for `d` and `conj i = −i` for `d.dual`, so `d.dual ≠ d`.
- The coefficient at `2` of the right side of the 1.6 equation is therefore that of `χ⁻¹`. An equation written against `d` would need `i = −i` there.

## Verified sound

**Gate and build.**
- The worker's gate reports every check passed.
- `lake env lean` on `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0 in 7 s with 17 warnings, all "declaration uses `sorry`" (lines 99–350).
- Dependency check output: `depcheck: 236 roadmaps, 2264 edges, 0 problem(s)`.
- The suppliers (LFunctions, ClassFieldTheory, ModularForms and the completed ArithmeticDirichletSeries, GlobalNumberFields, NumberFieldArithmetic, Chebotarev and ContourIntegration) are all on main. None is on the never-cite list.

**Signatures.** The file has no `variable` block. All 20 elaborated types were compared with their README statements and match in generality:
- 6.4 and 7.5 are stated in the coordinate `|d_K| 𝔑𝔣 (|t|+3)^n`, which 6.4 explains;
- 8.8 is stated for `K L : Type*`, while the reciprocity supplier is stated for `Type` (the transport is noted in 8.8).

**Padding probe.** Each of the 17 `sorry` bodies was replaced, in a scratch copy, by `first | rfl | (simp; done) | (norm_num; done) | infer_instance | exact?`. Thirteen fail with "`exact?` could not close the goal" and four hit the heartbeat limit. Nothing closes, so no declaration is padding.

**Headline theorems.** The summary's end theorems are each stated:
- `heckeLFunction_zeroFreeRegion`, which covers ζ_K at `ψ = 1`;
- `riemannVonMangoldt_heckeLFunction`;
- `primeIdealCount_effective`;
- `rayClassPrimeCount_effective`;
- `frobeniusPrimeCount_effective_abelian`;
- Hadamard's theorem, as `hadamard_of_orderLE_one`.

The docstring names what cannot be stated at the pins: the completed Dedekind and Hecke functions, and the exceptional-zero terms.

**Library declarations opened at the pins.** About 200 cited names were checked with one `#check` file (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`), and all of them elaborate. The ones whose statements were read:
- `TauCeti/NumberTheory/LFunctions/Data/Basic.lean:183–196`: `meromorphicOrderAt_eq` holds only at polar points and `analyticAt` off them, which is exactly what 0.2 and 4.2 use.
- `LFunctions/Hecke/Basic.lean:74` and `Analysis/Meromorphic/Continuation.lean:72`: the continuation is `0` when none exists, as the docstring says.
- `Hecke/Primitive.lean:91,175`.
- `Data/Normalization.lean:124–141`: the analytic shifts are the arithmetic shifts plus `w/2`, which confirms 2.3.
- `ModularForms/Newforms/AnalyticInvariants.lean:125` (2.4).
- `Analysis/SpecialFunctions/LogIntegral.lean:141, 180, 277, 321`: the 8.9 target is not already at the pin.
- `Chebotarev/PrimeCounting/VonMangoldt.lean:177`.
- The full statements of `argumentPrinciple_nullHomologous`, `windingNumber_comp_eq_integral_logDeriv`, `heckeLFunctionC_eq_primitive`, `rayClassArtinMap_idealClass`, `hasSum_idealTerm_vonMangoldt`, `primeIdealTheorem` and `primeCount_primesCongruent_isEquivalent_logIntegral`.
- Mathlib `Gamma/Digamma.lean:50–124` and `LSeries/RiemannZetaLogDeriv.lean:35`. Mathlib has no digamma asymptotic, ζ zero-free region, Hadamard product or explicit formula, so no headline is duplicated.

**Cross-roadmap citations resolved on main.**
- Arithmetic Dirichlet Series §§2.3, 4.2, 4.3, 5.2, 6.1–6.4, 10.1, 10.2 (README lines 168–400); the names are realized at the pin, for example `truncatedPerronKernel_one` in `Perron/Basic.lean`.
- Global Number Fields Layers 2, 3E and 9 (lines 279, 393, 508).
- Number Field Arithmetic §2.3 (line 647).
- Chebotarev Layers 2, 11, 13 and 14 (lines 175, 425, 593, 612).
- Class Field Theory Layer 12 (lines 1724, 1752–1757).
- L-functions Layers 0, 2, 3, 5, 6 and 7, apart from the names in R01.
- AnalyticNumberTheoryPartI on main cites §§0.1–8.8 of this roadmap. They all still resolve, and this head drops no id (the overlap report confirms it).

**Ownership against open pull requests.**
- Read for ownership: AnalyticNumberTheoryPartIII (its head path is in the brief), and ExplicitZetaBounds, ExplicitPrimeCounting and ExplicitNumberFields (through `roadmaps show`).
- All four cite this roadmap for the qualitative statements and own only explicit-constant versions, so there is no second owner. AnalyticNumberTheoryPartIII cites §§3.4, 4.3, 6.2–6.5, 7.1, 7.2, 8.5 and 8.6, all present.
- The revision of Chebotarev (#1187) was not checked.

**Sampled locators.**
- `kadiri2012` line 79–85, Theorem 1.1, matches 6.2: (1.7) for `|Im s| ≥ 1` and (1.8) for `|Im s| ≤ 1`, with the zero simple and real.
- `kadiri2012` lines 65–73 match the report of Lagarias–Montgomery–Odlyzko Lemma 2.3 used in 6.4.
- `kadiri2012` lines 230–237 (§2.1.2) give the explicit formula of 6.4d, with the signs checked.
- `dlmf5` lines 104–108 (5.11.1), 158–160 (5.11.2), 488–492 (5.11.9) and 563–569 (§5.11(ii)) match 1.2–1.5.
- DLMF 5.5.3 and 5.6.6 (the latter with `x > 0`), read at dlmf.nist.gov, match 0.1 and 1.3a.
- `bennett2021` line 83–84 (Cor. 1.2: `q > 1`, `T ≥ 5/7`, `0.247 log qT + 6.894`) and lines 73–76 (the gap in Trudgian) match 7.5.
- `hasanalizade2022` lines 63–65 (Cor. 1.2: `T ≥ 1`, `0.228(…) + 23.108 n_K + 4.520`) and lines 40–41 match 7.5.
- `trudgian2015` lines 19–27 (Theorems 1 and 2) match 7.5.
- PrimeNumberTheoremAnd at 127b50e: `Kadiri.kadiri_thm_3_1_q1_functional_eq` has the four hypotheses of 1.4a and the rearranged symmetric form, with no `sorry`; `riemannZeta.N` sums over `Ioo 0 T`, as the Provenance section says.

**Adversarial table.** Values were recomputed by hand and in plain Python.

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| 0.2 entire completion, `zetaEntireCompletion` | `s = 0, 1`; symmetry; algebra | `s(s−1)(Λ₀ − 1/s − 1/(1−s)) = s(s−1)Λ₀ + 1`; value `1` at `0` and `1` against the raw product `0`; `(1−s)(−s) = s(s−1)` | holds |
| 1.4 digamma and `logDeriv Gammaℝ/ℂ` | `s = 1`; DLMF 5.11.2 | `Gammaℝ = π^{−s/2}Γ(s/2)` gives `−(log π)/2 + ψ(s/2)/2`; `logDeriv Gammaℂ 1 = −γ − log 2π = −2.4151` | holds |
| 1.4a symmetric `ζ'/ζ` | `s = 2`; `s = −2`; `ψ(i)` | `−0.56996 + 1.98505 = 1.41509`, and `log π − ψ(1)/2 − ψ(−½)/2 = 1.14473 + 0.28861 − 0.01825 = 1.41509`; at `−2` the junk gives `−0.16482` against `0.55412`; `Im ψ(i) = 2.0767` | holds; the Checks are right |
| 1.6 `invGammaFactor`, `continuedL` | `ζ` at `0` and `−2`; the record `1/((s−2)(s+1))` | `ζ(0) = −½` against the raw quotient `x/0 = 0`; `Λ(−2) = Λ(3) ≈ 0.191 ≠ 0`; `F(1−s) = F(s)`, and at `s = 2` the junk values give `1` against `0`; `‖1/Gammaℝ(−2n−1)‖ = π^{−n−3/2}Γ(n+3/2)` | holds; Check 4 is R05 |
| 2.1–2.5 conductors | `ζ`, `ℚ(i)`, `χ₋₄`, `Δ` | `‖½‖ + 3 = 7/2`; `4·3·4 = 48`; `4·(1+3) = 16`, or `4` without `𝔑𝔣`; `(6+3)(7+3) = 90` against `3.5·4.5 = 15.75`; the Tau Ceti shift direction confirmed | holds |
| 3.1 tail estimate | `R = 0`, `c = α = 1`; `ζ` at `2m` | `E₁(1) = 0.2194 < e^{−1}`; the substitution gives `c^{−(R+1)/α}Γ((R+1)/α)/α`; `exp(sin πs)` has `log‖·‖ = cosh πt` | holds |
| 3.3–3.4 convexity exponent | `σ = 1+δ, −δ, ½` | exponents `0`, `½ + δ`, `¼ + δ/2`; each `Gammaℝ` gives `(1+2δ)/2 · log|t|` and each `Gammaℂ` gives `(1+2δ) · log|t|`, total `(n/2)(1+2δ)` | holds; locator is R03 |
| 3.5 strip growth | `‖Λ(2m+2i)‖` | `3.67680` at `m = 10` and `13519751.81` at `m = 20`, against `π^{−m}(m−1)! = 3.87` and `1.39·10⁷` | holds |
| 4.1 two counts | `z(z−1)`; `z/(z−1)`; `1/z`; `sin πz` | `2`; `1` against a signed count of `0`; `(−1).toNat = 0`; the finite-sum junk `0` against `1` | holds |
| 4.4 local count | the discs | `1.5 + 1 = 2.5 ≤ 3`; `Re ∈ [−2, 6]`; `log(4/3) = 0.288`; `‖L(2+iT)‖ ≥ ζ_K(4)/ζ_K(2) ≥ ζ(2)^{−n}` | holds; locator is R03 |
| 4.6 Nevanlinna | `z²(z−3)` | `∫₂⁴ n/t = 2 log 1.5 + 3 log(4/3) = 1.674 ≥ 1.386`; `3 log(5/3)` on both sides | holds |
| 5.2 `E₁` | `z = −½`, `1`, `0` | `‖E₁ − 1‖ = 0.0902 ≤ 0.125`; `E₁'(1) = −e`; `E₁ = 1 − z²/2 + O(z³)` | holds |
| 5.6 `Re b` | `zetaEntireCompletion`; `e^s·ξ`; `χ₄` | `B = −0.0230957 = −∑Re(1/ρ)`; `f(0) = 1` against `f(1) = e`; `Λ(χ₄,0) = Λ(χ₄,1) = ½`; the derivation `b + b̄ = −∑(1/ρ̄ + 1/(1−ρ̄))` redone | holds |
| 5.6a / `riemannZeta_zeros_summable_ordinate` | the first zero pair; trivial zeros | `2/(1 + 14.1347²) = 0.00996`; `Λ(−2) ≠ 0`, so the divisor there is `0` | holds |
| 6.1 3-4-1 | `‖z‖ = 1`; `(3)∞` over `ℚ` | `3 + 4 cos θ + cos 2θ = 2(1 + cos θ)² ≥ 0`; the missing term at `s = 2` is `log 3/8 = 0.137` | holds |
| 6.2 region constant | principal character mod `2` | `(log 3/2)/log 3 = ½`; `0` enters at `c ≥ log 6 = 1.792`, not at `log 3 = 1.099` | Check 2 is wrong (R04) |
| 6.4 Hecke and Dirichlet regions | nesting; mod `6` principal; mod `6` induced from mod `3` | `1 + log(4/3)/log 3 = 1.262`; `log 18 = 2.890`; `π/log 2 = 4.532`, `log 45.19 = 3.811`; region at `q = 2` is `0.6934`; `log 2/3 = 0.2310` | holds |
| 6.4d / `neg_re_logDeriv_riemannZeta_le` | `δ ≥ 1`; `t → 0`; `t₀ ∈ (1, 14)` | LHS `≤ |ζ'/ζ(2)| = 0.570` and `−1/(1+δ−β) > −1`, so `C ≥ 1.57/log t₀`; `δ/(δ²+4t²) = 1/(4|t|)` at `δ = 2|t|`; the zero clause is empty below `14.13` | holds |
| 7.1 `rectBoundary` | `[0,1]²`; `f = z` on `[−1,1]²` | winding numbers `1` and `0`; `θ₀ = −3π/4`, `θ₄ = 5π/4`, variation `/2π = 1`, endpoint `5/8` | holds |
| 7.3 `S(T)` | `Re ζ(2+it)`; `T → 0⁺` | `≥ 2 − ζ(2) = 0.355`; `arg(−½ + iT) → π` gives `S → −1`, and `0 = 0 + 1 − 1` | holds |
| 7.4 / `riemannVonMangoldt` | `T = 2`, `T = 100` | `(1/π)log(1/πe) = −0.683` against `N = 0`; `28.13 + 7/8 ≈ 29 = N(100)` | holds |
| 7.5 / `riemannVonMangoldt_heckeLFunction`, `_dirichlet` | `ℚ`, `ψ = 1`, `T = 100`; `ζ(s)(1 + 5·2^{−s} + 2·4^{−s})` | `N± = 58` against `56.25`; roots `x = −0.2192, −2.2808` give `Re s = 2.19, −1.19`; the functional equation of that record checked | holds |
| 8.3 / `chebyshevPsi_explicitFormula` | `ℚ`, `ℚ(√5)`, `ℚ(i)` | `c_ℚ = −log 2π = −1.8379`; residue `c_K − r log x` at `0`; `L(0,χ₅) = 0`, `ζ_{ℚ(i)}(0) = −¼`; trivial zeros give `−log(1 − 1/x) = log 2` at `x = 2` | holds |
| 8.4 / `riemannZeta_weilExplicitFormula` | contour shift redone; `φ = 0` | reflection gives `(2πi)⁻¹∫_{(2)}(Λ'/Λ)(φ̃(s) + φ̃(1−s))`; `φ̌` has transform `φ̃(1−s)`; the `−(log π)φ(1)` term confirmed; both sides `0` at `φ = 0` | holds |
| 8.5 / `primeIdealCount_effective` | `x = 10`, `10⁶`; `ℚ(i)` | `log 2520 − log 210 = log 12 ≤ 12.094`; `1102.42 ≤ 137682.4`; Abel sum `78597.11 − 78498 = 99.11`; `2 log 2 ≤ 24.19` | holds |
| 8.6 Hecke instance | quartic `χ` mod `5`, `χ(2) = i` | the `φ̌` term is `log 2·(−i)/2 = −0.347i`, against `+0.347i` with `χ` | holds |
| 8.7 / `rayClassPrimeCount_effective`, `primeCounting_progression_effective` | width; `(4)∞` at `x = 9`; `q = 4` at `x = 20` | `T² − qT − 3q ≥ 0` gives `log x = 0.696, 2.496, 190.868`; `log 21`, `log 63`, `log 15`, `log 5`; count `4` against `Li(20)/2 = 4.4301`; without `IsUnit 2`, `1` against `x/(2 log x)` | holds |
| 8.8 / `frobeniusPrimeCount_effective_abelian` | `K = L = ℚ`; `ℚ(i)`; quadratic | `#C/#G = 1`; coefficient `½` for primes `≡ 3 (4)`; `χ₈(5) = χ₋₈(5) = −1` | holds |
| 8.9 `Li` second term | `x = 10`, `10⁴` | `5.1204 − 4.3429 + 2.8854 = 3.6629`; `159.36` against `117.88`; split bounds `√x/log³2`, `8x/log³x` | holds |
| `hadamard_of_orderLE_one`, `zetaEntireCompletion_hadamard` | `f = exp`, `1 − s`; `ρ = 0`; `s` a zero | `(a,b) = (0,1)`, `(0,−1)`; `s/0 = 0` gives factor `1`; one factor `0` gives `HasProd 0 = f(ρ₀)`; `zetaEntireCompletion 0 = 1` | holds |
| `dirichletLFunction_convexity`, `riemannZeta_zeroFreeRegion` | `q = 1` | the trivial character mod `1` is primitive; exponent `¼ + δ/2`; `ζ < 0` on `[1 − c/log 3, 1)` | holds |
| R01 L-functions contract | exact-word search on main | 20 names found `0` times in the L-functions README; e.g. `completedDedekindZeta_one_sub` and `analyticAt_dedekindZetaC` are found | names undeclared (R01) |

## Not verifiable

These are paywalled books, cited by locator only. Their content was checked only for consistency with the statements, not against the text:
- Davenport, *Multiplicative Number Theory* §§11–20 (`davenport2000`, recorded as uncertified): 0.3, 5.3, 5.5, 5.6, 6.2–6.4, 7.5, 8.2–8.7.
- Lang, *Algebraic Number Theory* XVII §3, Theorem 3.1 (`lang1994`, uncertified): 8.4.
- Lagarias–Montgomery–Odlyzko, Lemma 2.3 (`lagarias1979`, uncertified): checked only through Kadiri's report, `kadiri2012` lines 65–73.
- Titchmarsh, Theorems 9.2–9.4 and §5.1; Iwaniec–Kowalski §§5.1–5.2; Lagarias–Odlyzko 1977, Theorems 1.3 and 9.2. These have no entry in the roadmap's `sources.toml` at all. The worker may want to record them as uncertified.

## Source issues

- **Misprint** in kadiri2012 at §1, display (1.6), printed p. 2: the source says Lagarias–Montgomery–Odlyzko show `L(s,χ,K)` has no zeros in the whole region (1.6); it should say no zeros there apart from the possible exceptional real zero of (1.5), which can lie in (1.6) near `γ = 0`; affects nothing.
