# Review of ExplicitZetaBounds (pull request #1954 at d7f47a1)

**Verdict:** needs changes

Nine findings: one P1, five P2, three P3. The gate passes, the file elaborates with `sorry` as its only warning, and the dependency check is clean. All 20 headline statements that I checked numerically hold, and the source sample matches its locators, with the exceptions below.

## R01 (P1) — The admissibility definition admits degree 0, so its own law and one of its Checks are false

Location: `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 475–484, 501: "`0 ≤ a k` for `k ≤ n`, `a 0 < a 1`, and … `(Finset.range (n + 1))`"; "Admissibility implies `n ≥ 1`"; "Every degree-zero polynomial `(a₀)` fails".

Claim: admissibility forces `n ≥ 1`, and no degree-zero polynomial is admissible. The value `a 1` is junk outside the range, so with `n = 0` 7.3's `A = f_n(0) − a₀` is `0`.

Witness: `n = 0`, `a = (1, 2, 0, …)`: `a 0 = 1 < a 1 = 2`, and the combination over `range 1` is `P(θ) = 1 ≥ 0`, so the vector is admissible with `n = 0`.

Repair: add "`a k = 0` for `k > n`" to the definition (or require `1 ≤ n`). Tested: with the extra clause the witness has `a 1 = 0 ≤ a 0` and fails; `(3, 4, 1)` is still admissible (`2(1 + cos θ)² ≥ 0`); `(1, 2)` still fails at `θ = π`.

## R02 (P2) — 7.3: Kadiri's criterion has the wrong constant and covers neither the smoothing nor the θ-range of the headline instance

Location: `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 1763–1771: "`θ ∈ (π/2, π)` … `h_θ`, `g₁(θ)`, `d₁(θ)` … as defined in `mossinghofftrudgian2015` lines 164–220 … for every `R₀ ≥ max(r, A g₁(θ)/((1 − κ)² K(w₀, θ)))`".

Claim: given the certificate `C(η) ≤ 0`, this criterion yields the instances 5.69693, 5.68371, 5.573412 and 5.558691; the last is `riemannZeta_ne_zero_classical`. `mossinghofftrudgian2015` (3.1), line 263, carries `(A/2) g₁(θ)(1 − κ)`, as `jangkwon2014` does.

Witness: `jangkwon2014` lines 597–598: `η log γ₀ ≥ K/((A/2)(1 − κ)h(0))`, so `R₀ = A g₁(1 − κ)/(2K)`; at κ = 0.439672 the README's threshold is `11.37` times that. `mty2024` lines 1363–1368 use `h⁽¹⁾`, `θ = 1.13489`.

Repair:
- Write the threshold as `A g₁(θ)(1 − κ)/(2 K(w₀, θ))`, and the refined form (3.1) as `(A/2) g₁(θ)(1 − κ) min_{η₁} max{1/K(w₁, θ), 1/(K(w₀, θ) − C(η₁))}`.
- State the criterion for any smoothing in the class of `mty2024` lines 1281–1284: `C²` on `[0, d₁]`, compact support, Laplace transform nonnegative on the positive axis. Give as instances Kadiri's `h⁽⁴⁾` (`θ ∈ (π/2, π)`), Heath-Brown's `h⁽¹⁾` (`θ ∈ (0, π/2)`, `d₁ = 2θ cot θ`, `g₁ = (θ tan θ + 3θ cot θ − 3) sec²θ`) and Xylouris' `h⁽⁵⁾` (`jangkwon2014` line 598).
- Kadiri's instance used `T₀ = 3 330 657 430.697` (`mossinghofftrudgian2015` line 227). Name `RH(30 610 046 000)`, which covers it, instead of `RH(3·10¹²)`.

Tested: at κ = 0.439672 the corrected formula is the displayed inequality of `jangkwon2014` line 598.

## R03 (P2) — Two headlines rest on bounded-height zero data of `ζ` but carry no recorded-verification hypothesis

Location: `TauCetiRoadmap/ExplicitZetaBounds/Suggested.lean` line 173, `abs_zetaZeroCount_sub_le (T : ℝ) (hT : Real.exp 1 ≤ T)`, and line 236, `LFunction_ne_zero_kadiri`; neither has an `RiemannHypothesisUpTo` argument. Conventions, README lines 173–175: a recorded verification "is a hypothesis of every theorem that uses it".

Claim: both are proved without any proposition about the zeros of `ζ`. Yet README 5.2 itself says "a bounded-height Riemann hypothesis alone does not bound `S(T)`".

Witness: `bellottiwong2025` lines 121–124 and 1038–1054 use `|S(T)| ≤ 2.5167` below `30 610 046 000`, from Platt's zeros. `kadiri2018` lines 142–147 and 668–669 use McCurley's region, principal character included, which README 7.5 states only given `RH`.

Repair:
- In 0.4, record "`|S(T)| ≤ 2.5167` for `0 ≤ T ≤ 30 610 046 000`" (`bellottiwong2025` (1.2)) as a recorded verification. State the Lean form for `T ≥ 30 610 046 000`, the analytic range (lines 1036–1037). Keep `T ≥ e` in the README, given that verification.
- Add `(hRH : RiemannHypothesisUpTo 545439823)` to `LFunction_ne_zero_kadiri`, and "given `RH(545 439 823)`" with *Needs:* 7.3 to the 7.5 item. This suffices: `log max(q, q|t|, 10) ≥ log|t|` puts the principal-character region inside 7.3's `9.645908801` region.

## R04 (P2) — The van der Corput toolkit has two owners: this roadmap and the open ExplicitCharacterSumsAndSieves pull request (#1948)

Location: `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 79–80: "`ExplicitCharacterSumsAndSieves` comes after this roadmap in the merge order and takes the Kusmin–Landau lemma and the derivative tests from 4.1–4.4." The same claim is at line 2310.

Claim: the consumer cites 4.1–4.5. In fact its lines 101–110 also plan the B-process (`patelyang2024` Lemmas 2.1–2.3) and Yang's recursive tests for its own Part II.

Witness: at its head, `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/README.md` lines 45–47 own the van der Corput inequality and the derivative tests. Line 522 states Kusmin–Landau from `ariasdereyna2024` lines 90–104, and its `Suggested.lean` line 99 declares `kusmin_landau`. It never cites ExplicitZetaBounds.

Repair: this roadmap is earlier in the order (merge order positions 270 and 272), so it keeps ownership and must serve the consumer's generality.
- Widen 4.2 to the finite van der Corput inequality for arbitrary complex coefficients (the consumer's §0.3).
- Add Patel's corrected third–fifth derivative tests and Arias de Reyna's iterated inequality with constant `2 + 2√2`, if the consumer needs them.
- Record that the consumer's §§0.3 and 1.1–1.6, and its Part II items, cite 4.1–4.5. One of the two pull requests is rebased on the other before either merges.

## R05 (P2) — Gaps that consumers declared on this roadmap are neither provided nor refused, and two of its propositions are restated downstream

Location: `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 2297–2320 (Downstream consumers). None of the requested items appears elsewhere: grep for "four zeros", "Nosal", "1237", "guo", "dglsw" and "iterated Perron" finds nothing.

Claim: the consumers take only what lines 2299–2318 list.

Witness (open pull requests, at their heads):
- `TauCetiRoadmap/ExplicitPrimeCounting/README.md` lines 385, 389, 393 and 397;
- `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md` line 425;
- `TauCetiRoadmap/ExplicitNumberFields/README.md` lines 472, 486 and 491;
- `TauCetiRoadmap/ExplicitPrimeCounting/Suggested.lean` line 115 redefines `RiemannHypothesisUpTo` with 0.2's body.

Repair: for each item below, either add it here with its locator, or list it under "Not owned here" with the reason. For Ramaré's `ζ` density, 8.2 already gives the reason: `kadirilumleyng2018` lines 93–95. Then rewrite "Downstream consumers" to match.
- At most four zeros with `σ ≥ 1 − 1/(3.82 log x)`.
- The Ramaré–Rumely region with `C₁(χ, H)`.
- Ramaré's `ζ` density with an explicit `A`, and the Johnston–Yang constants.
- The Lee–Nosal form of the `N(T)` bound.
- `|1/ζ| ≤ 1237 (log t)^{11/12}` and its two companions.
- The iterated Perron identity.
- The `dglsw2025` polynomials.
- Guo's gap `1/100`.

The consumers cite "target 8 … target 20", which are the sections 5.2, 5.3, 5.4, 6.5, 7.3 with 7.5, 7.6, 7.7–7.9, Layer 8 and 0.2–0.4. ExplicitPrimeCounting's §1.1 and §1.7 (*RealZeroGap*, which is 7.9's *HasLandauSiegelGap*) become citations in that pull request.

## R06 (P2) — Statable headlines absent from `Suggested.lean`: the Dirichlet zero densities and the quadratic `L(1, χ)` lower bound

Location: `TauCetiRoadmap/ExplicitZetaBounds/Suggested.lean` lines 54–58: "inputs to the theorems below (… Kadiri's density 8.1) … the zero densities of 8.2 and 8.4 … which serve the prime-counting consumers". README lines 68–72 own Dirichlet zero densities and the quadratic lower bounds of 9.3.

Claim: these are lemmas on the way to the stated theorems, or not headlines.

Witness: `thornerzaman2024` lines 64–65 give `N(σ, Q) ≤ 10^88 (10^421 Q^99)^{1−σ}` for `σ ≥ 39/40`; it is statable with `dirichletZeroCount`'s count. `luzamanzhao2026` lines 96–99 is statable as is. The *Needs:* of 8.3 and 8.5 (lines 2135, 2181) omit 8.1.

Repair:
- Add Thorner–Zaman's first bound, with a count that sums `dirichletZeroCount`-style orders over primitive `χ` of conductor `≤ Q` (`β > σ`, `|γ| ≤ Q`).
- Add Lu–Zaman–Zhao's `1/(8 log q) ≤ L(1, χ)` for primitive quadratic `χ` with `3 ≤ q ≤ 10¹⁰`.
- Correct the docstring's reasons for 8.1 and 8.2, or state them too.

Tested: at `Q = 3` the count includes `ζ`, whose pole at `1` has order `−1` and contributes `toNat = 0`.

## R07 (P3) — 2.6: Nemes' Theorem 1.3 constant is misread

Location: `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 768–769: "`|R_N(z)| ≤ (1 + ζ(N)) Γ(N)/((2π)^{N+1}|z|^N) · (2√N + 1/2)`"; Check at lines 796–797: "`0.000355`".

Claim: Nemes' factor is `2√N + 1/2`. The README's form is true but weaker than the source.

Witness: `nemes2015` lines 543–553: the bound is `(1/2)(B_N (1 + 1/N)^{(N+1)/2} √N/(1 + ζ(N)) + 1)` times the prefactor, and the product is shown to be `< 2`. Hence the factor is `(2√N + 1)/2`.

Repair: use `(2√N + 1)/2`. The Check becomes `2.644934 · 1.914214/24805.0 = 0.000204` at `N = 2`, `z = 10`, still above the true `3.20·10⁻⁵`.

## R08 (P3) — The ComputationalNumberTheory §4.22 contract includes modulus 1

Location: `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 288–290: "§4.22: `platt_bounded_height`: for primitive `χ` of modulus `q ≤ 400 000`, every zero …".

Claim: this is the range consumed. Yet 0.3 (lines 419–442) says the range starts at `q = 2`, and that "1 ≤ q" would make `RH(10⁸)` a consequence of the supplier. The supplier's §4.22 reads "q≤400000" at its head too.

Witness: `DirichletCharacter.isPrimitive_one_level_one` and `DirichletCharacter.LFunction_modOne_eq` make modulus 1 primitive with L-function `riemannZeta`. Primitive characters of modulus `≤ 4·10⁵` number `29 565 923 838`, against Platt's `29 565 923 837` (`platt2016grh` line 952).

Repair: write the contract as `2 ≤ q ≤ 400 000`, and record the same lower bound as a requirement on ComputationalNumberTheory §4.22.

## R09 (P3) — `ralaivaosaonarazakarinoro2026` is cited by the published numbering, but the line numbers refer to the arXiv text

Location: `TauCetiRoadmap/ExplicitZetaBounds/README.md` line 1948, "Theorem 1.1, `ralaivaosaonarazakarinoro2026`", and line 2346, "arXiv:2001.05782v2. Cited for: Theorem 1.1". Line 2325 says line numbers refer to the arXiv version.

Claim: the locator matches the text read.

Witness: `ralaivaosaonarazakarinoro2026` line 69 numbers the result "Theorem 1", with constant `6.5`.

Repair: cite "Theorem 1 of arXiv v2 (Theorem 1.1, constant `6.035`, in the journal version)", with a version note in the manifest.

## Verified sound

**Gate and build.**
- The worker's gate: every check passed.
- Dependency check, run myself: `depcheck: 244 roadmaps, 2461 edges, 0 problem(s)`.
- `lake env lean TauCetiRoadmap/ExplicitZetaBounds/Suggested.lean`: 20 `declaration uses sorry` warnings and nothing else.
- I compared the elaborated type of each of the 25 declarations with its README statement. No binders were lost, and the generality is the same on both sides.
- One-tactic probe: `first | rfl | simp | norm_num | positivity | infer_instance` left all 20 theorems open (20 errors), so there is no padding.
- The single `import Mathlib`, no `set_option`, docstrings, `theorem` throughout, the namespace and the layer section comments are all as required. Every Lean name appears in the README.

**Source sample.** Every sampled locator was read at its line:
- 1.2: `alzer1997` 520–528.
- 1.3: `alzer1997` 649–662.
- 4.5a: `simonic2020` 177–205; `kadiri2013density` 107–133, with `C = 2.19457`.
- 4.6: `hiarypatelyang2024` 72–85; `ford2002zerofree` 139.
- 6.4: `ramare2016density` 828–843.
- 6.6: `donahelfgottzunigaalterman2022` 78–120; `simonic2020` 89–92; `kadiri2013density` 137–162.
- 7.3: `mossinghofftrudgian2015` 111, 117–118, 129, 227, 240, 263–266; `mty2024` 86–97, 107–119, 1279–1385; `jangkwon2014` 10–15, 597–603; `kadiri2005` 14, 992; `bellottitrudgianyang2026` 67–87.
- 7.5: `kadiri2002thesis` 1958–1980, 2063–2068; `kadiri2018` 16–18; `thornerzaman2024` 164–170, 219–226; `luzamanzhao2026` 39–44.
- 7.8, 7.9: `luzamanzhao2026` 39–42; `banks2026` 89–107.
- 8.1: `kadiri2013density` 46–54; `kadirilumleyng2018` 59.
- 9.2: `plattsaadeddin2013` 27–37; `saadeddin2016` 29–31, 56–65, 791–799.

**Headline sources.**
- `hiarypatelyang2024` 64–65, `patel2022` 61–66, `hiaryleongyang2025` 31–43.
- `ford2002vinogradov` 28–31, 167–234.
- `bellottiwong2025` 14–38.
- `bmor2021` 56–63, 569–577.
- `mty2024` 53–54, 96–97; `yang2024` 53–55, 88–89, 2326–2333.
- `bordignon2019` 63–71; `bordignon2020` 56–66.
- `kadirilumleyng2018` 18–19, 74–87; `bellotti2025density` 21, 91–101.
- `ramaretmeemt` 88–100; `mossinghoffstarichkovatrudgian2022` 44–49.
- `ramare2016density` 39–44, 83–92, 654.
- `platt2016grh` 951–963; `platt2017zeros` 524–528.

**Library declarations at the pins.**
- 85 Mathlib names cited by the README elaborate with `#check`. Among them:
  - `RiemannHypothesis` (`Mathlib/NumberTheory/LSeries/RiemannZeta.lean:185`);
  - `meromorphicOrderAt` (`Mathlib/Analysis/Meromorphic/Order.lean:50`, value `0` off meromorphy);
  - `MulChar.IsQuadratic` (`Mathlib/NumberTheory/MulChar/Basic.lean:443`, which includes the trivial character, hence the `χ ≠ 1` clauses);
  - `DirichletCharacter.LFunction_changeLevel` (requires `χ ≠ 1 ∨ s ≠ 1`);
  - `HurwitzZeta.hurwitzZeta : UnitAddCircle → ℂ → ℂ`, whose class of `1` is the class of `0`, so the `u = 1` case reads `|ζ(s) − 1|`.
- Tau Ceti, opened at the pin:
  - `TauCeti/Analysis/SpecialFunctions/Trigonometric/NonnegCombination.lean`:48, 57, 66, 83;
  - `TauCeti/NumberTheory/LSeries/ThreeFourOne.lean`:99;
  - `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Basic.lean`:142, 204;
  - `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Formula.lean`:130, 229.
- Neither library states anything that Layers 1–9 restate. The nearest is `DirichletCharacter.norm_LFunction_le_level_mul_norm_div_re`, which is not restated. Mathlib's Stirling file covers factorials only.

**Cross-roadmap citations resolved (about 40).**
- On main:
  - ZerosOfLFunctions 1.1, 1.4, 1.6, 3.4, 4.3, 4.5, 5.5, 5.6, 6.3, 6.4 (4d), 6.5, 7.1–7.4, and Layer 9 (*HasZerosInRects*, line 1590; *AllOnCriticalLine*, line 1619);
  - LFunctions Layers 0, 3 and 4 (`AnalyticLFunctionData` with degree, gamma factor and dual; `dedekindZetaData`; `dirichletData`);
  - Completed ArithmeticDirichletSeries 6.3–6.4.
- At the heads of their pull requests:
  - AnalyticNumberTheoryPartI §§0.9, 0.23a (`gammaRemainder.slit_logGamma`, derivative bound `j! sec^{j+2}/(8|z|^{j+1})`), 0.34 (`landau_siegel_exclusion`), 0.34a, 1.5 (`6π`), 1.5a (`3π/2`), 1.6, 1.7, 3.23;
  - AnalyticNumberTheoryPartII §4.3a (the Barnes `G` remainder, a separate object);
  - AsymptoticExpansions §13.1 (`sum_Icc_eq_eulerMaclaurin`) and Layer 5. This is a new-roadmap pull request by another author and is named in the description;
  - ComputationalNumberTheory §§4.22 and 4.24;
  - SieveMethodsAndPrimePatterns §§2.6 and 2.9 (`sharp_additive_largeSieve`, `sharp_primitive_largeSieve`).
- The README's claim that no earlier roadmap states Vinogradov's mean value theorem holds: a grep finds it only here.

**Adversarial table.**

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| `RiemannHypothesisUpTo` (0.2) | `H < 0`; `H = 14`; strip dropped | vacuous; no zero below `14.134725` (`kadiri2005` 992); `ζ(−2) = 0` with `Re = −2` | sound | — |
| `zetaZeroCount` (5.2) | `T = 14, 15, 100` | `N = 0, 1, 29`; main term `−0.443`, `28.127` | sound | — |
| `dirichletZeroCount` (5.3) | `χ₋₄`, `T = 10` | `N = 2` (zeros `±6.0209`) in `[0.78, 5.14]` | sound | — |
| `zetaZeroDensityCount` (8.3) | `σ = 0.9`, `T = H₀` under `RH(H₀)` | count `0` < bound `1.915·10⁸` | sound | — |
| `vinogradovCount` (4.9a) | `J_{2,1}(2)`; `J_{2,2}(3)`; `s = 0`; `P < 1` | `6` (Parseval `6`); `15 = 2·9 − 3`; `1`; `0` | sound | — |
| *IsAdmissibleCosinePolynomial* (0.5) | `(3,4,1)`; `(1,2)`; `n = 0`, `a = (1,2,0,…)` | `P ≥ 0` (yes); `P(π) = −1` (no); admissible with `n = 0` | defect | R01 |
| *HasLandauSiegelGap* (7.9) | `q = 3`, `10¹⁰`, `10¹¹` | `0.002731` against `0.182048`; `1.303·10⁻⁴` against `8.686·10⁻³`; `1.184·10⁻⁴` | sound | — |
| `norm_Gamma_bounds` (2.5) | 242 points, `σ ∈ [0.001, 60]`, `|t| ∈ [0.01, 300]`; `s = 1 + i` | least log-margins `9.3·10⁻¹⁰` (lower) and `5.6·10⁻⁴` (upper); `0.4440 < 0.52156 ≤ 0.6972` | sound | — |
| `norm_LFunction_le_rademacher` (3.2) | `χ₋₃`, `χ₋₄`, `χ₅`, quartic mod 5; `η ≤ 1/2`; `σ ∈ [−η, 1+η]` | largest ratios `0.548`, `0.407`, `0.521`, `0.585`; quartic mod 5 at `(1/2, −1/2, 10)`: `12.17 ≤ 20.81` | sound | — |
| `norm_riemannZeta_criticalLine_le` (4.7) | `t ∈ [3, 60]`, step `0.05` | largest ratio `0.8210` at `t = 45.6`; bound at `t = 3` is `0.8154` | sound | — |
| `norm_riemannZeta_one_add_le` (4.8) | `t ∈ [3, 60]`; `t = 3` | Patel ratio at most `0.6443`; `0.63797 ≤ 1.0986`; HLY bound `20.22` | sound | — |
| `vinogradovCount_le_ford` (4.9a) | `k = 1000`, `s = 2k²` and `s = 3 213 463` | `Δ_s = 11 343` and `1001.7`; exponent `≥ s` (diagonal lower bound) | sound | — |
| `norm_riemannZeta_le_richert` (4.10) | `σ ∈ {0.5, 0.75, 0.9, 1}`, `t ∈ [3, 60]`; `u = 0.3`, `s = 0.6 + 5i` | ratio at most `0.0129`; `0.522 ≤ 640.6` | sound | — |
| `abs_zetaZeroCount_sub_le` (5.2) | `T = e`, `100` | `0.795 ≤ 8.184` and `≤ 3.886`; `0.873 ≤ 8.921`, `4.482` | true; hypothesis missing | R03 |
| `dirichletZeroCount_explicit` (5.3) | primitive `χ`, `q ∈ {3,4,5,7,8,9,11}`, at `ℓ = 1.567` | lowest zeros against thresholds: `8.0397 > 8.0362`, `6.02 > 5.53`, `4.133 > 4.022`, `2.509 > 2.302`, `>1.2 > 0.737` | sound (tight) | — |
| `riemannZeta_ne_zero_classical` (7.3) | `|t| = 2`, `3·10¹²` | boundary `0.740461`, `0.993738` | true; route broken | R02 |
| `riemannZeta_ne_zero_littlewood` (7.4) | `t = 3`, `e^{200}` | `1 − σ = 0.00403`; `0.0012477 > 0.0008995` | sound | — |
| `LFunction_zeroFree_mcCurley` (7.5) | `q = 3`; pole at `1` | region `σ ≥ 0.905635`; order `−1`, not `> 0` | sound | — |
| `LFunction_ne_zero_kadiri` (7.5) | `q = 3`, `t = 0`; zero `1/2 ± 4.133i` mod 5 | region `σ ≥ 0.837457`; zero outside it | true; hypothesis missing | R03 |
| `riemannZeta_ne_zero_vinogradovKorobov` (7.6) | `|t| = 3`, `e^{1000}` | `log log 3 = 0.094 > 0`; `1 − σ ≤ 9.505·10⁻⁵` | sound | — |
| `LFunction_real_zero_le_bordignon` (7.7) | `q = 4·10⁵ + 1`; `β ≤ 0` | bound `0.9924 > 0` | sound | — |
| `LFunction_real_ne_zero_luZamanZhao` (7.8) | `q = 1, 2`; `q = 4`; mod 6 from `χ₋₃` | vacuous; `[0.855730, 1)`; factor `1 + 2^{−σ} > 0` | sound | — |
| `inv_norm_riemannZeta_one_add_le` (7.10) | `t ∈ [3, 60]` | ratio at most `0.00261`; `1.5675 ≤ 5042.9` | sound | — |
| `zetaZeroDensityCount_nine_tenths_lt` (8.3) | `T = H₀` | `0 < 1.915·10⁸` | sound | — |
| `zetaZeroDensityCount_le_bellotti` (8.5) | `T = 10¹³`, `σ = 0.9927`; `σ = 1` | `2.22·10¹¹` against trivial `2.16·10¹³`; `0` | sound | — |
| `norm_LFunction_one_le_ramare` (9.1) | `q = 3, 4, 5, 8`; all 22 primitive `χ` mod `104` | `0.6046 ≤ 1.2575`, …; largest ratio `0.99278` (`1.848351` against `1.861792`) | sound | — |
| `norm_LFunction_one_ge` (9.3) | quartic mod 5; `q ≤ 4` | `0.88858 ≥ 0.222066`; none exist for `q ≤ 4` | sound | — |
| 1.2 | `x = 1`; `ψ(1)`, `ψ(0.2)` | `0 > −0.081061`; `−0.5833 < −0.5772 < −0.5`; `−6.193 < −5.289 < −4.109` | sound | — |
| 1.3 | `k = 1, 2` at `x = 1` | `1.5 < 1.644934 < 1.6667`; `2 < 2.404114 < 2.5` | sound | — |
| 2.4 | `z = i`; `z = −1/2 + 2i` | `0.000934`; `Re ξ = −0.010044` | sound | — |
| 2.7 | `z = 1`, `10i` | `0.0772 ≤ 0.125`; `0.000834 ≤ 0.003536`; `√2/|σ+2+it|²` re-derived | sound | — |
| 4.5a | `c = 1`, `t₀ = 14.1347` | `C = 2.19457` = printed `2.1946` | sound | — |
| 4.6 | `t = 200` | `|Σ| = 2.79642`; bound `5.98878 ≥ |ζ| = 5.58978` | sound | — |
| 6.4 | `a = (1, 1)` | deviation `2.885 ≤ 20.66`; `c₀ = 1.315407` | sound | — |
| 6.6 | `T = 4` | `107.2` (σ = 1/2), `43.54` (σ = 1) | sound | — |
| 7.1 | `s = 2` | zero sum `0.069066`; first pair `0.014848` | sound | — |
| 7.3 criterion | κ = 0.439672 | README threshold / true threshold `= 11.37` | defect | R02 |
| 7.5 | `q = 3`; `Q = 3`; `q = 10¹⁰` | `0.837457`; `0.905635`; `0.995657` | sound | — |
| 8.1 | `T = H₀` | `1.70·10¹⁰`, `1.35·10¹⁰` against trivial `5.19·10¹⁰` | sound | — |
| 9.2 | `q = 3, 12, 17` | `0.6046 ≤ 1.2046`; `0.7603 ≤ 1.1966`; `1.01609 ≤ 1.39649` | sound | — |
| 2.6 (Nemes) | `N = 2`, `z = 10` | README `0.000355`; correct `0.000204`; true `3.20·10⁻⁵` | defect | R07 |
| 0.3 count | primitive characters, `q ≤ 4·10⁵` | `29 565 923 838`, or `…837` without `q = 1` | sound | R08 |

**Ownership against open pull requests.**
- Checked: the four Explicit* siblings, ZerosOfLFunctions (#1913, a revision; it drops no id cited here), and SieveMethodsAndPrimePatterns.
- Results: one double owner (R04); unanswered and restated objects (R05).

## Not verifiable

- `dlmf` §5.9 (2.4), `davenport2000` §12 (7.1) and `preissmann1984` (6.4): uncertified, no text. The formulas were re-derived. `c₀` matches its quotation in `ramare2016density` line 839.
- `gabcke1979` (4.6): waived. It is used only through `hiarypatelyang2024` Lemma 2.1.
- `rademacher1959` (2.8, 3.2) and `mccurley1984` (7.5): uncertified. Checked through `bmor2021` lines 569–577, `thornerzaman2024` lines 164–170 and `kadiri2018` lines 142–147.
- `kadiri2005` criterion (10): text cached but OCR-damaged around the criterion. The constant was checked against `jangkwon2014` and `mossinghofftrudgian2015` instead (R02).

## Source issues

- **Misprint** in `platt2016grh` at Theorem 7.1, p. 14 (lines 955–963): the source says GRH holds for primitive characters of modulus up to 400 000; it should say from modulus 3 (or 2), since line 952's 29 565 923 837 L-functions exclude the trivial character mod 1; affects a stated result.
