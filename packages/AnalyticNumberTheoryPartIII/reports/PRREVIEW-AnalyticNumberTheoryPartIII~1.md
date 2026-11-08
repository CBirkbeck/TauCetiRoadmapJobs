# Review of AnalyticNumberTheoryPartIII (pull request #2008 at 4feb791)

**Verdict:** needs changes

Seven findings: one blocking (R01, P2) and six P3. The gate fails on one rule (R02), so the folder cannot be accepted at this head. Every headline statement in `Suggested.lean` survived the adversarial pass, and so did every Check I recomputed. The defects are policy, locator and ownership defects, plus one padded declaration.

## R01 (P2) — A primality certificate in the Examples of Layer 13

**Location.** `TauCetiRoadmap/AnalyticNumberTheoryPartIII/README.md` lines 1485–1495, the last Example of Layer 13. It reads: "Route: `211` and `313` by `norm_num`; the two nineteen-digit numbers by Lucas's test `lucas_primality` applied recursively (a Pratt certificate), from `3 999 999 999 999 999 790 = 2 · 5 · …`". Line 284 also lists `lucas_primality` under From Mathlib for this Example only.

**Claim.** The Example proves `EvenGoldbachUpTo (4·10¹⁸ + 4)` by giving two nineteen-digit primes, the factorizations of `p − 1` and `q − 1` down to factors below `10⁷`, and a tactic route. That is a primality certificate together with an implementation plan. The planning principles exclude computational algorithms, and the house style names "certificates" and "implementations" explicitly. A principle violation is blocking.

**Witness.** I checked the arithmetic and it is correct: `3 999 999 999 999 999 791 + 211 = 4·10¹⁸ + 2`, both summands pass Miller–Rabin, and the stated factorizations multiply out. So the problem is the kind of content, not its truth.

**Repair.** Delete the whole bullet at lines 1485–1495, and remove `lucas_primality` from the From Mathlib list (line 284). The Kadiri–Lumley Example already ends at `OddGoldbachUpTo ((4 · 10¹⁸ − 4) · 1 966 196 911 + 4)`, so no other text depends on the deleted bullet. I checked that nothing else in the README or in `Suggested.lean` refers to it.

## R02 (P3) — Gate failure: TeX syntax outside code spans (`tex`, 4 hits)

**Location.** README lines 1375–1376, the initial-score bound of 13.1. The code span `` `score_L(A₀) ≤ … + Σ_{p≤n/L} M log n `` opens on line 1375 and closes on line 1376.

**Claim.** The gate scans line by line. A code span that crosses a line break therefore leaves `Σ_{…}` outside any span on both lines. The gate rerun on this head reports `tex=4 FAIL` with every other rule at 0, the targeted build included.

**Witness.** Gate output: `tex: line 1375: - *The initial score.* Prove `score_L(A₀) ≤ n log(1/(1 − 1/M)) + Σ_{p≤n/L} M log n`, followed by three hits on line 1376.

**Repair.** Keep each code span on one line. For example: "Prove that `score_L(A₀)` is at most the sum of the five terms `n log(1/(1 − 1/M))`, `Σ_{p≤n/L} M log n`, `Σ_{p≤√n} M log² n/log 2`, `Σ_{n/L≤p≤n} (n/p) log(n/p)` and `Σ_{p≤L} (M log n + M L² π(n)) log L`". Break lines only between spans, then rerun the gate. Alternatively, put the whole bound in an indented code block.

## R03 (P3) — 8.1a and 8.1b have no locator

**Location.** README line 666 (8.1a: "this is `rectangle_boundary_integral_eq_sum_circleIntegral` (ieantn)") and line 712 (8.1b: "… (ieantn)"). References, lines 1556–1558.

**Claim.** The only citation for these two theorems is `ieantn`, a whole GitHub project, given with no file, no declaration name, no commit and no theorem number. That is a target without a locator. It is also the only support for the sharpness clause of 7.4 besides `brown1967`.

**Witness.** References line 1556 names the repository URL only. Nothing in the README or in the manifest pins a file or a declaration.

**Repair.** Give each of 8.1a and 8.1b an exact locator. One option is the IEANTN file path and declaration name at a stated commit. The other is a textbook theorem number for the Cauchy theorem on a rectangle with finitely many disjoint discs removed, recorded as `uncertified` if the text is paywalled. Record whichever you choose in `sources.toml` (see R04).

## R04 (P3) — Three cited sources are missing from the manifest

**Location.** README lines 556–557 (`brown1967`), and lines 426, 438, 497, 557, 622, 666, 712, 1332–1334, 1343, 1417, 1426–1427, 1475, 1482–1483 and 1488 (`primenumbertheoremand`, `ieantn`). References, lines 1550–1558. The manifest is `packages/AnalyticNumberTheoryPartIII/sources.toml`.

**Claim.** Every cited work must have a manifest entry. These three keys have none: the manifest lists 14 ids, and none of them is `brown1967`, `ieantn` or `primenumbertheoremand`.

**Witness.** `grep '^id' sources.toml` returns the 14 keys from `kontorovichtao-pntplus` to `dlmf-ch6`. I asked the sources service for Brown (1967), J. Math. Anal. Appl. 18, 75–84. It answered "DOI prefix 10.1016 belongs to a paywalled publisher (not resolved) … uncertified".

**Repair.**
- Add `brown1967` as `uncertified` with its DOI and the locator Theorem 1.
- Add `ieantn` with repository URL, commit and the file/declaration locators of R03.
- For `primenumbertheoremand`, either add an entry with file locators, or drop it at 7.1, 7.3, 8.1 and 13.1. At those places `kontorovichtao-pntplus`, which is the blueprint of the same project, already carries exact line locators.

## R05 (P3) — The 10.1 locator misdescribes Theorem 4.5.3

**Location.** README line 953: "(lines 1502–1506, Theorem 4.5.3, stated there as `O(εX log X)` for `ε ≥ 1/X`)".

**Claim.** The source states `ψ_ε(X) = ψ(X) + O(εX log X)` with no condition relating `ε` and `X`. The restriction `ε ≥ 1/X` is not in the text. The README's own second Check of 10.1 shows that the unrestricted form fails when `εX < 1`.

**Witness.** `kontorovichtao-pntplus` lines 1502–1503 state Theorem 4.5.3 with no hypothesis on `ε`. Counterexample: at `X = 2`, `a = Λ`, symmetric `ν` and `ε ≤ log₂(3/2)`, `ψ(2) − ψ_ε(2) = log 2 − (log 2)/2 = (log 2)/2`, while `εX log X = 2ε log 2 → 0`.

**Repair.** Write "(lines 1502–1506, Theorem 4.5.3, stated there as `O(εX log X)` with no condition on `ε`; the term `+1`, which the second Check shows is needed when `εX < 1`, is added here)".

## R06 (P3) — Padding: `samplingSum_aliasing_sharp` is a computed instance

**Location.** `TauCetiRoadmap/AnalyticNumberTheoryPartIII/Suggested.lean` lines 108–118; README line 556 ("this is `samplingSum_aliasing_sharp`").

**Claim.** The declaration fixes one explicit `G`, namely `e^{−πiξ/(2W)}` on `(W, 3W)`, and one point `t = 1/(4W)`. Its conclusion is three computed values: the limit `−2W`, `f(t) = 2W` and `∫_{|ξ|>W} |G| = 2W`. It is the extremal example of `exists_tendsto_samplingSum_norm_sub_le`, and the README's first Check of 7.4 is its `W = 1/2` case. A declaration that computes values or mirrors a Check is padding, even when, as here, the value is true and the probe tactics do not close it.

**Witness.** In the `W = 1/2` Check, the terms are `−4/(π²(2n − 1)²)` with sum `−1`, against `f(1/2) = 1`. That is the declaration's content at one value of `W`.

**Repair.** Delete `samplingSum_aliasing_sharp` from `Suggested.lean`. In README line 556, replace "; this is `samplingSum_aliasing_sharp`" with plain prose that keeps the sharpness statement; the gate checks backticked names of this roadmap. The docstring of `exists_tendsto_samplingSum_norm_sub_le` may say in prose that the constant is attained.

## R07 (P3) — 9.1's product formula restates AsymptoticExpansions §8.1 without citing it

**Location.** README lines 822–824, the second API bullet of 9.1: "If `(x, y) ↦ f(y) g(x/y) x^{s−1}/y` is integrable on `(0, ∞)²`, then the Mellin transform of `f ⋆ g` at `s` is `mellin f s · mellin g s`". Scope, lines 154–157, cites AsymptoticExpansions §8.2 but not §8.1.

**Claim.** AsymptoticExpansions (an open new-roadmap pull request by another author) states the same theorem in Parseval variables in §8.1. What another open roadmap already states is cited, not restated. The README already does this for the neighbouring §8.2.

**Witness.** `TauCetiRoadmap/AsymptoticExpansions/README.md` lines 907–909 at that pull request's head: for `I(x) = ∫₀^∞ f(t) h(xt) dt`, `𝓜I(z) = 𝓜f(1 − z) 𝓜h(z)`. With `F(t) = f(1/t)/t`, the substitution `t = 1/y` gives `I = f ⋆ h` and `𝓜F(1 − z) = ∫ f(u) u^{z−1} du = 𝓜f(z)`, so the two statements agree.

**Repair.** Next to the §8.2 bullet under Not owned here, add: "the Parseval form `𝓜[x ↦ ∫ f(t) h(xt) dt](z) = 𝓜f(1 − z) 𝓜h(z)`: AsymptoticExpansions §8.1; 9.1 differs in using the convolution variables `f ⋆ g` at `x > 0`, with integrability on `(0, ∞)²`, the form that 9.4 uses".

## Verified sound

**Gate and dependency check.**
- Gate rerun at this head: `tex=4 FAIL`, every other counter 0. The targeted build passes, and so do `sorry-data`, `set_option`, `imports`, `readme-ids-missing`, `depcheck` and `outside-folder`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- Dependency check, as run: `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. In the merge order this roadmap sits at line 271, after its suppliers ZerosOfLFunctions (48), AnalyticNumberTheoryPartI (49), ProbabilisticAndMetricNumberTheory (60), ArithmeticDirichletSeriesPartII (90), ExplicitZetaBounds (265) and ExplicitPrimeCounting (267). LFunctions, ZerosOfLFunctions, TauberianBoundaryConvergence and ToeplitzOperators are on main; ContourIntegration and ArithmeticDirichletSeries are on main under `Completed`.

**Elaboration.**
- `lake env lean` on `Suggested.lean` exits 0, with exactly 28 "declaration uses `sorry`" warnings and nothing else. The file has 28 theorems and 8 definitions, all with real bodies.
- In a scratch probe I ran `#check @` on all 36 declarations and on the 90 Mathlib and Tau Ceti names the README cites; everything elaborates. I compared each elaborated type with its README statement and found no lost binder; the file has no `variable` block. The coercions in the new 7.4 theorems are as intended: `n : ℤ` is cast into `𝓕⁻ G (↑n / (2 * W))` and `Real.sinc` is cast to `ℂ`. `LSeries_generalizedDivisor` uses exactly the series of `riemannZeta_eq_exp_LSeries`.

**Padding probe.** I replaced every `sorry` with `first | rfl | (simp; done) | (norm_num; done) | decide | infer_instance | positivity`. None of the 28 theorems closed: all 28 sorry warnings remain. The only padding is the computed instance of R06.

**Library declarations opened at the pins.**
- Tau Ceti:
  - `TauCeti.Contour.classicalResidueTheorem_nullHomologous` (`TauCeti/Analysis/Contour/Residue/Cycle.lean:226`). Its hypotheses are an open `U`, differentiability on `U ∖ S`, meromorphy on `S ∩ U`, and a piecewise-`C¹` closed null-homologous curve; this matches the README contract.
  - `BoundedVariationOn.integral_deriv_smul_eq_neg_integral_vectorMeasure` (`TauCeti/Analysis/BoundedVariation/OneDimensional.lean:48`). It takes a `C¹` compactly supported real test function and no integrability of `f`, as claimed.
  - `TauCeti.Contour.tendsto_integral_sin_div_atTop` (`…/HalfDisc/SineIntegral.lean:351`).
  - `TauCeti.truncatedPerronKernel_one`, `c ≠ 0`, value `π⁻¹ arctan(T/c)` (`…/Perron/Basic.lean:204`), and `TauCeti.truncatedPerron_LSeries` (`…/Perron/Formula.lean:130`).
  - `heckeLFunctionC_eq_primitive` and `heckeLFunctionC_eventuallyEq_primitive` (`TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:130, 138`).
  - `finite_rayClassGroup`, an instance (`…/RayClass/Finite.lean:155`).
  - `MultiplicativeIdealWeight` (`…/ArithmeticDirichletSeries/Weight.lean:116`) and `normCoeff` (`…/NormCoeff.lean:100`).
- Mathlib:
  - `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`: its four-edge expression is the one 8.1, 8.1a and 8.1b use.
  - `Complex.borelCaratheodory` (`0 < M`, `MapsTo` into `Re ≤ M`).
  - `Real.one_add_sq_mul_norm_fourier_le` (`ContDiff ℝ 2`, `iteratedDeriv k` integrable for `k ≤ 2`).
  - `mellinInv_mellin_eq` (`Mathlib/Analysis/MellinInversion.lean:92`).
  - `mellin_comp_rpow` and `hasMellin_one_Ioc` (`0 < Re s`).
  - `AnalyticOnNhd.sum_divisor_le` (`1 ≤ M`, sphere bound).
  - `Filter.Tendsto.cesaro` and `cesaro_smul`: the same `(N)⁻¹ Σ_{i<N}` convention as 12.1.
  - `LSeries_zeta_mul_Lseries_moebius` (`Mathlib/NumberTheory/LSeries/Dirichlet.lean:296`).
  - `Nat.exists_prime_lt_and_le_two_mul`.

**Duplication by object.**
- Pinned Mathlib and Tau Ceti contain none of the following:
  - a completely-multiplicative predicate on `ArithmeticFunction`;
  - Dirichlet series of `σ_ν`, `d_z`, `2^ω`, `μ²`, `λ` or `φ`;
  - a Tauberian theorem for Cesàro means;
  - a rectangle residue theorem;
  - Fourier decay for bounded variation (`TauCeti/Analysis/Fourier/Decay.lean` treats smooth compactly supported functions only);
  - a derivative form of Borel–Carathéodory (Mathlib's file has only the value form);
  - Mellin convolution or smoothed cutoffs.
- Open roadmaps:
  - Goldbach ranges and the prime ladder have no other owner. SieveMethodsAndPrimePatterns has only Selberg/Chen upper bounds. CircleMethodThreePrimes excludes Helfgott's numerical values. ExplicitCharacterSumsAndSieves defers to SieveMethodsAndPrimePatterns.
  - Borel–Carathéodory appears in ExplicitZetaBounds, ExplicitMultiplicativeFunctions and Part I only as a route.
  - No other roadmap states Ramanujan's identity, Erdős 392, Landau's lemma or the Hardy–Landau theorem.
  - ProbabilisticAndMetricNumberTheoryPartII and ArithmeticDirichletSeriesPartII own `squaredSinc`, a different kernel.
  - AsymptoticExpansions §8.2, the full-line shift, is correctly distinguished from 8.1, 8.1a and 8.1b. AsymptoticExpansions §8.1 is R07.
- The ownership claims against Part I §§0.30a and 0.33a, ExplicitPrimeCounting §§2.1 and 3.1, and ArithmeticDirichletSeries §0.2 match what those sections say.
- I read the open pull requests for this check from their heads: #1126, #1167, #1415, #1421, #1838, #1857, #1924, #1945, #1954 and #1684.

**Cross-roadmap citations resolved (49 section-level citations).**
- ZerosOfLFunctions on main: §§3.4 ("wide strips above the poles", line 755), 4.3, 6.2, 6.3 (*IsExceptionalZero*), 6.4 (*heckeZeroFreeConstant*, `≤ log 3/2`), 6.5, 7.1 (*rectBoundary*), 7.2, 8.5 and 8.6.
- LFunctions Layers 3, 5 and 7.
- ContourIntegration Layers 2–4.
- ArithmeticDirichletSeries §§0.2, 6.3 and 6.4, and Layers 6, 9 and 10.
- TauberianBoundaryConvergence N1–N2.
- ToeplitzOperators T1.
- AnalyticNumberTheoryPartI at #1126: §§0.11c, 0.30a (`riemannZeta_local_logDeriv`), 0.33, 0.33a (`riemannZeta_deriv_logDeriv_bound`), 1.2a, 3.1, 3.3, 3.4, 3.22 and 3.24a (`riemannZeta_pow_four_eq_mul_LSeries_divisor_sq`); the Lean names are present in its `Suggested.lean`.
- AnalyticNumberTheoryPartII Layers 4–6.
- ArithmeticDirichletSeriesPartII §§0.1 (`HasLaplace`), 3.2 and 5.1 (`LSeriesHasSum_zeta_pow`, in its `Suggested.lean` at line 305).
- ProbabilisticAndMetricNumberTheory §0.1a: `powOfAdditive`, `IsCompletelyAdditive.powOfAdditive_mul` and `isMultiplicative_powOfAdditive_cardDistinctFactors` are README targets there. The citation tool's lead on `powOfAdditive_mul` is therefore a supplier README name, not a defect.
- ExplicitPrimeCounting §§1.4, 2.1, 3.1, 3.6, 7.1 (`x > 2 010 759.9`, `x/16597`), 7.2 (`28 314 000`, `10 726 905 041`) and 7.3 (`Δ = 1 946 282 821` at `e⁵⁹`, `1 966 196 911` at `e⁶⁰`, open interval).
- ExplicitZetaBounds §6.1, Layer 7 and §7.6.
- AsymptoticExpansions §8.2.
- SpecialFunctionsEiLiErfIncompleteGamma Layer 9.

**Sources: the seeded sample (15 targets), checked at their locators.**
- 7.2 is supported by `dlmf-ch6`; I fetched §§6.2, 6.12 and 6.16 through the sources service without touching the manifest.
  - DLMF 6.2.19 gives `Si = π/2 − f cos − g sin`.
  - DLMF 6.12.7–6.12.8 at `n = 0` give `0 < f ≤ 1/x` and `0 < g ≤ 1/x²`.
  - §6.16(i) puts the first maximum of `Si` at `π`.
  - The DLMF bounds give `1/x + 1/x² ≤ 2/x` for `x ≥ 1`. For `x < 1`, `|π/2 − I| ≤ π/2 < 2/x`. The integration-by-parts route gives `2/x` for every `x > 0`.
- 7.4 cites `brown1967`, which is not verifiable (see below).
- 8.1: `kontorovichtao-pntplus` Theorem 4.1.2, Lemmas 4.1.2–4.1.4 (lines 621–642), Definitions 4.1.3–4.1.5 and Lemma 4.1.1 (lines 596–613). The source has simple poles only; the README says so.
- 8.2: Theorem 5.3.2 (lines 1751–1758), `16MR²/(R − r)³` at `k = 1`, `f(0) = 0`.
- 9.1: Definition 4.3.1, Lemma 4.3.2 and Theorem 4.3.1 (lines 893–946).
- 9.2: Theorem 4.3.2 (lines 947–962), `O(1/|s|)` on `σ₁ ≤ Re s ≤ 2`, the case `k = 1`.
- 9.3: Definition 4.3.2, Lemma 4.3.3, Theorem 4.3.3 and Lemma 4.3.4 (lines 964–1005).
- 10.1: Definition 4.5.2 and Theorem 4.5.2 (lines 1463–1498); Theorem 4.5.3 is R05.
- 10.2:
  - `platttrudgian2020` lines 21–32: Ingham's `exp(−½(1 − ε)ω)`, with `ω = min_{t≥1}`. Taking the infimum over `t ≥ 3` instead changes `ω` by at most `log 3` for decreasing `η`.
  - `platttrudgian2020` lines 54–56: Pintz.
  - `kontorovichtao-pntplus` Definition 4.5.3 (lines 1507–1516), Theorem 4.6.1 (lines 1673–1683) and Theorem 4.6.2 (line 1684).
- 11.1: Definition 9.1.8 and Theorems 9.1.66–9.1.67 (lines 3590–3604).
- 11.2: Definitions 9.1.3–9.1.5, Theorems 9.1.12–9.1.29 and Theorem 9.1.32 (lines 3151–3323), half-plane `Re s > 1`, `Re(s − ν) > 1`.
- 11.3: Theorem 9.1.33 (lines 3324–3329), with all four half-plane conditions as stated; Theorems 9.1.34, 9.1.36 and 9.1.50 (lines 3336, 3353–3363, 3489–3494).
- 11.4: Theorems 9.1.49, 9.1.57, 9.1.68 and 9.1.70 (lines 3454, 3533, 3605, 3626); line 3631 is the source's own correction to `Re s > 2`.
- 12.1: `estradavindas2012littlewood` lines 32–35, the one-sided Hardy–Littlewood theorem for Abel means. Cesàro summability implies Abel summability, so it gives 12.1.
- 13.1:
  - Theorems 8.1.1–8.1.2 (lines 3096–3101), the framework (lines 2984–3095) and Sublemma 8.1.16 (line 3080).
  - The README's tiny-prime bound `M L² π(n)` and `M log n/log 2` are the forms the source's proofs actually give; see Source issues.
  - `alexeevetal2025factorial` line 75 names problem 391.
- Outside the sample: `helfgottplatt2013` lines 9–10 and 27–31, and `oliveiraesilva-herzog-pardi2014` lines 13–15.

**The adversarial pass.** Every row gives the instance and the values computed on each side. Numerical values come from scratch quadrature and Euler–Maclaurin code; brute-force values from exhaustive search.

| Statement | Instances tried | Values computed (left vs right) | Result | Change |
|---|---|---|---|---|
| 7.1 `norm_fourier_le_eVariationOn_div` | `1_[0,1]` at `ξ = 1/2`; `ξ = 0`; `1_[0,∞)` | `2/π` vs `V/(2π·½) = 2/π` (equality); at `ξ = 0`, `1` vs junk `V/0 = 0`, so `ξ ≠ 0` is needed; `1_[0,∞)`: `V = 1`, limit `1`, not integrable | holds, constant sharp | none |
| 7.1 derivative and `C²` forms | tent at `ξ = 1/2`, `ξ = 0`; `1/(1+t²)` | `4/π² = 4/π²`; `1 ≤ 1 + 1/π²`; `max |f″|(1+t²) = 2` at `0` (`9/8` elsewhere), so `A = 2`; `π ≤ 2(π + 1/(4π)) = 6.442` | holds | none |
| 7.2 Dirichlet-integral bounds | `x = π, 2π, −1` | `I(π) = 1.85194 > π/2`; `0.2811 ≤ 0.6366`; `I(2π) = 1.41815`, `0.1526 ≤ 0.3183`; `x = −1`: `2.517 > −2`, so `x > 0` is needed | holds | none |
| 7.3 `tendsto_truncated_mellinInv` | `1_(0,1]`, `σ = 1`, `x₀ = 1`, `T = 10`; `σ = 0` | `arctan(10)/π = 0.46827 → 1/2 = (1 + 0)/2`; at `σ = 0` the Mellin integral diverges and the truncation is `0 ≠ 1/2` | holds; hypothesis needed | none |
| 7.3 windowed error | `e^{−σu}1_{u≥0}` at `(σ,T) = (1,10), (10,1), (1000,1)`; merely integrable `h` | errors `0.0317, 0.468, 0.4997` vs `min_δ(σδ + 2/(Tδ)) = 0.894, 8.94, 89.4`; tail `→ log 2/(2π) = 0.110` vs `‖h‖₁/(T₀δ) ≤ 1/T₀` | holds; BV needed | none |
| 7.4 `exists_tendsto_samplingSum_norm_sub_le` | `W = ½`, extremal `G`, `t = ½`; `t = m/(2W)`; `t = ¼` | terms `−4/(π²(2n−1)²)`, `S = −1` vs `f = 1`: error `2 = 2·∫|G| = 2`; sample point error `0`; `f(¼) = −2√2 i/π`, not real | holds, with equality | none |
| 7.4 `samplingSum_aliasing_sharp` | general `W`, `t = 1/(4W)` | `f(t) = ∫_W^{3W} 1 = 2W`; `g_t = −e^{2πiξt}` on `(W,3W)`, so `S = −2W`; `∫|G| = 2W` | true; padding | R06 |
| 8.1 `rectangle_boundary_integral_eq_residues` | `1/s` on `[−1,1]²`; `1/(s−2)`, `P = ∅`; `1/s²`; `exp(1/s)` | four edges `1.5708i` each, sum `6.28319i = 2πi`; `0`; `0`; edge `2πi` vs junk residue `0`, so meromorphy is needed | holds | none |
| 8.1 U-shaped form | `1/s`, `σ = ±1`, `T = 1` | right `π/2` = left `−π/2` + `(top − bottom)/i = −π` + `2π·1`; the clockwise sign gives `5π/2 ≠ π/2` | holds | none |
| 8.1a `…_sum_circleIntegral` | `exp(1/s)`, `r = ½`; `1/s`, `P = {0, 0.3}` | edge `6.28319i`, circle `6.28319i`; overlapping discs give `4πi` vs edge `2πi` | holds; disjointness needed | none |
| 8.1b `vertical_integral_eq_lShaped_add_sum_circleIntegral` | `eˢ` at `w = 0.5+0.5i, −0.3+i, 1+0.2i`, `T = 2`; `eˢ/(s − ρ₀)`, `ρ₀ = −1+1.2i`, `r = 0.3` | `−3.84949+2.47173i` both sides for all three `w`; `−2.220891+1.129016i` both sides; with `−Σ∮`, `2.08784−0.54613i` | holds | none |
| 8.2 `norm_iteratedDeriv_le_borelCaratheodory` | extremal at `M = R = 1`, `r = ½`, `k = 1,2,3`; `k = 0`, `f ≡ i` | `8, 32, 192` both sides; `k = 0` would claim `‖i‖ ≤ 0` | holds; `k ≥ 1` needed | none |
| 8.3 `norm_logDeriv_sub_sum_zeros_le` | `(z − 3/10)e^{2z}`, `R = 1`; `z − z₀ − ε` | `M = log(0.7e²/0.3) = 2.847`, left side `2`; without the zero sum `1/ε` vs `C log((1+ε)/ε)` | holds | none |
| 9.1 *mellinConv* | `1_(0,1] ⋆ 1_(0,1]`; `x = 0`; `1_[1,2] ⋆ 1_[1,2]` | `log(1/x)`, value `1` at `e^{−1}`, transform `1/s²`; `(g⋆f)(0) = log 2` vs `(f⋆g)(0) = 0`; `log 2` at `2`, support `[1,4]` | holds | R07 (citation) |
| 9.2 bump transforms | `(x−1)²(2−x)²`; `max(0,1−x)²` | `𝓜ν(0) = 0.0225887 = 4 log 2 − 11/4`; `∫ν = 1/30`; `𝓜ν(1) = 0.033333 = −𝓜ν′(2)`; `2/(s(s+1)(s+2))` has poles | holds | none |
| 9.3 `deltaSpike` | `ε = ½`; `y = 2` | support `[2^{−½}, 2^{½}]` vs wrong `[1/4, 4]`; `2^ε − 1 ≤ 2ε log 2` at `ε = 1`: `1 ≤ 1.386` | holds | none |
| 9.4 `mellin_smoothCutoff`, `norm_mellin_smoothCutoff_le` | non-symmetric bump, `ε = ½`, `s = 1.3+2i`; `ε = 1/20` | formula `0.307724−0.328529i`, direct Mellin quadrature `0.307711−0.328562i`, opposite normalisation `0.496173+0.098891i`; cutoff at `1` is `0.70647`; `0.23536−0.35129i` vs `1/s = 0.22847−0.35149i`; opposite moduli `0.506, 0.762, 16.37, 1.91·10⁴` | holds | none |
| 10.1 `smoothedSum_eq_mellinInv` and comparison | `a = δ₁`; `a ≡ 1`, `X = 2`, symmetric `ν`, `ε ≤ log₂(3/2)` | reduces to Mellin inversion; difference `2 − (1 + ½) = ½` vs `CB(εX+1) log X = C(2ε+1)`; without `+1`, `2Cε → 0` | holds; `+1` needed | R05 (locator) |
| 10.2 `inghamExponent`, `norm_sum_sub_mul_le_of_zeroFreeRegion` | `η = 1/log t`, `log x = 100`; `η ≡ ¼`; the `T₀` example | `20` at `log t = 10`; `25 + log 3 = 26.0986` at `t = 3`; `ω ≥ log T₀`, choice by `η(T)` saves `exp(−2 log T₀/log²(T₀+3)) → 1`, by `η(T+3)` saves `1/T` with `T > T₀ − 3`; lower-bound hypothesis on the linear piece: `T₀ = 6 ≥ 9^{1/√2} = 4.73` | holds | none |
| 10.3 `logDeriv_heckeLFunctionC_bound` | `K = ℚ`, `χ = 1`; imprimitive trivial character mod `2` | residue of `−ζ′/ζ` at `1` is `+1 = δ_χ`; zeros of `1 − 2^{−s}` on `Re s = 0`, outside `R_c` (`Re s ≥ 1 − c/log 3 ≥ ½` for `c ≤ (log 3)/2`); `G` shifts by `−log 2·2^{−s}/(1−2^{−s})`, bounded; residue of `L` is `½`, `δ_χ` unchanged | holds | none |
| 11.1 *IsCompletelyMultiplicative* | `λ`, `μ`, `λ ⋆ μ²` | `λ(4) = 1 = λ(2)²`, `λ(12) = −1`; `μ(4) = 0 ≠ 1`; `(λ ⋆ μ²)(4) = 0 − 1 + 1 = 0` | holds | none |
| 11.2 `sigmaC`, `LSeries_sigmaC`, `abscissaOfAbsConv_sigmaC` | `ν = 1, −1, ½, 2, −2`; `s = 3` | `12`, `2`, `3 + √2 = 4.41421`; abscissas `3`, `1`; `ζ(3)ζ(2) = 1.977304`; at `Re ν = 0`, `√(2+2c) ≥ 1 + c` on `[−1,1]` | holds | none |
| 11.2 `generalizedDivisor` and its series and abscissa | `z = ½, 2, 3, i, 0` | `3/8`; `(d_{½} ⋆ d_{½})(p²) = 1`; `Σ d_{½}n^{−2} = 1.282550 = √ζ(2)`; `d_3(4) = 6`; at `s = 3`, `exp(i·0.184034) = 0.983113+0.182997i`; `Ring.choose` gives `1 ≠ 3`; `z = 0`: abscissa `⊥` | holds | none |
| 11.3 `LSeries_sigmaC_mul_sigmaC` | `α = 0.3+i`, `β = −0.2+0.5i`, `s = 2.6+i`; `α = β = 0`; `α = 2`, `s = 3` | right side `2.485612−0.364635i`, Euler product to `2·10⁵` `2.485612−0.364635i`; coefficients `(k+1)²`; `ζ(3)³/ζ(6) = 1.707291`; boundary series diverges | holds | none |
| 11.4 series and abscissas | `s = 3`, `s = 4` | `1.420308`, `1.181565`, `0.846335`, `ζ(3)/ζ(4) = 1.110627`; `Σ(p−1)/p² = ∞`, so the abscissa of `φ` is `2` | holds | none |
| 12.1 `tendsto_of_cesaro_of_mul_ge`, `…_norm_mul_le` | `(−1)ⁿ`; `1`; `(−1)ⁿ/√n`; shift `a₀` by `d` | means `→ ½`, `S_N` alternates, `n a_n` unbounded below; means diverge; `n a_n` unbounded; both limits move by `d` (mean by `d(N−1)/N`) | holds | none |
| 13.1 `factorialFactorCount` and asymptotics | `n = 4…10`, `B = n, n²`; `(6,7)`; `n = 100`, `M = L = 2` | brute force `4,4,5,6,7,7` and `2,2,3,3,3,4`; `(16,4) ↦ 2`, `(4,4) ↦ 3`; `(6,7) ↦ 0` (junk), `(7,7) ↦ 5`; `|A₀| = 80`, waste `24.81 ≤ 69.31`, balances as stated, score `55.33`, `(log 100! + score)/log 100 = 91` exactly; lower bound `log n!/(2 log n) = n/2 − n/(2 log n) + O(1)` | holds | R02 (gate) |
| 13.2 `oddGoldbachUpTo_of_primeGaps` | `Δ = 2`, `x₀ = 2`, `H = 30`; `Δ ≤ 0`; `Δ = 3/2`, `n = 9` | Bertrand at `⌊x/2⌋` gives the hypothesis; every odd `n ∈ [7,56]` is a sum of three primes (search); `Δ ≤ 0` makes the hypothesis false at `x ≥ max(x₀,1)`; largest prime `5` leaves `4 = 2+2`, while `p = 2` leaves `7` | holds | none |
| 13.2 Examples | Schoenfeld, Ramaré–Saouter, Kadiri–Lumley | `x₀(1 − 1/16598) = 2 010 760.85 > 2 010 759.9`; `(4·10¹⁸−4)·28 314 000+4 = 113 255 999 999 999 999 886 744 004`; `e⁵⁹ = 4.201·10²⁵ < 1.1325·10²⁶ < e⁶⁰ = 1.142·10²⁶ < 7.785·10²⁷` | true | R01 for the certificate bullet |
| Conventions witnesses | `𝓕1_[0,1](½)`, `4^{½}`, `log ζ(2)`, Cesàro at `N = 2`, `ω_η` | `−2i/π`; `2`; `0.497700`; `½`; `20` | hold | none |

## Not verifiable

- `brown1967` Theorem 1 (7.4). The sources service resolves it only to a paywalled publisher page (DOI prefix 10.1016). The conversion from Brown's angular-frequency constant `π⁻¹` to `2` in `ξ`-variables is consistent, and the sharp instance is verified by computation above. The theorem text itself was not read.
- `ieantn` and `primenumbertheoremand` (7.1, 7.3, 7.4, 8.1, 8.1a, 8.1b, 13.1, 13.2). No file or declaration locator is given, so there is nothing to open (R03, R04).
- The settled uncertified texts, cited by locator only: `montgomeryvaughan2007` Ch. 5 §5.1 and Ch. 6 §6.1; `titchmarsh1986` Ch. I and III; `iwanieckowalski2004` (1.25), (1.28)–(1.33), (1.35) and Ch. 5; `tenenbaum2015` II.4–II.5; `apostol1976` Ch. 2 and 11; `hardy1949`; `katznelson2004` Ch. I.

## Source issues

- **Misprint** in kontorovichtao-pntplus at Lemma 4.1.4, printed p. 17 (line 636): the source says the rectangle integral of `g + A/(s − p)` is `A`; it should be `2πiA`, or `A` for the `1/(2πi)`-normalised integral of Definition 4.1.2; affects nothing.
- **Gap** in kontorovichtao-pntplus at Lemma 4.3.9, printed p. 27 (line 1107): the source says `𝓜(1̃_ε)(s) = 𝓜ν(εs)/s` with no condition on `s`; it should assume `Re s > 0`, since `1̃_ε = 1` near `0` makes the integral diverge otherwise; affects a stated result.
- **Error** in kontorovichtao-pntplus at Theorem 4.5.3, printed p. 37 (line 1502): the source says `ψ_ε(X) = ψ(X) + O(εX log X)` for all `ε, X`; it should be `O((εX + 1) log X)`, because at `X = 2` the difference stays `(log 2)/2` as `ε → 0`; affects a stated result.
- **Gap** in kontorovichtao-pntplus at Sublemma 8.1.11, printed p. 76 (line 3047): the source says a tiny prime's deficit is at most `M log n + M L π(n)`; its proof (up to `L` copies in each of up to `M L π(n)` removed factors) gives `M L² π(n)`; affects nothing.
- **Gap** in kontorovichtao-pntplus at Sublemmas 8.1.9–8.1.10, printed pp. 75–76 (lines 3039, 3044): the source says surplus and deficit are at most `M log n`; its proof (at most `log n/log 2` powers of `p`) gives `M log n/log 2`; affects nothing.
- **Gap** in kontorovichtao-pntplus at Theorem 9.1.36, printed p. 84 (line 3353): the source states `ζ(s)³ = ζ(2s) Σ τ(n²) n^{−s}` with no half-plane; it should restrict to `Re s > 1`, as Theorem 9.1.50 does; affects a stated result.
- **Gap** in kontorovichtao-pntplus at Theorem 9.1.68, printed p. 89 (line 3605): the source states `L(λ, s) = ζ(2s)/ζ(s)` with no half-plane; it should restrict to `Re s > 1`; affects a stated result.
- **Misprint** in kontorovichtao-pntplus at Lemma 3.1.3, printed p. 6 (line 187): the source ends the statement with an absolute constant `C` that does not occur in it; the clause should be deleted; affects nothing.
- **Misprint** in kontorovichtao-pntplus at the proof of Lemma 4.3.4, printed pp. 24–25 (lines 985, 1006): the source cites "Lemma 4.3.1" and "Theorem 4.3.5" for steps that are Corollary 4.3.1 and Lemma 4.3.3; affects nothing.
