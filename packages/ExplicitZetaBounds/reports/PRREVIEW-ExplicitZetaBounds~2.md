# Review of ExplicitZetaBounds (pull request #1954 at 3e44c3f)

**Verdict:** needs changes

Five findings: four P2 and one P3. The gate passes, `Suggested.lean` elaborates with 23 `sorry` warnings and nothing else, and the dependency check is clean. Every headline I evaluated numerically holds. Every one of the 15 sampled targets matches its locator, except 6.1a, which has none (R05). Two of the P2 findings (R01, R02) arise because the sibling pull requests have not followed the ownership this README now claims.

## Previous findings (review at d7f47a1)

- **R01 (P1, `n = 0` admissible): repaired.** Lines 529–531 now read "`0 ≤ a k` for `k ≤ n`, `a k = 0` for `k > n`, `a 0 < a 1`". The witness `(1, 2, 0, …)` with `n = 0` now fails because `a 1` must be `0`. `(3, 4, 1)` is still admissible.
- **R02 (P2, Kadiri's criterion): repaired.** Line 1947 reads "`R₀ ≥ max(r, A g₁ (1 − κ)/(2 K(w₀)))`". The refined (3.1) form, the smoothing class (lines 1937–1940), the instances `h⁽⁴⁾`, `h⁽¹⁾` and `h⁽⁵⁾`, and `RH(30 610 046 000)` for Kadiri's `T₀` are all present. I recomputed Kadiri's first iterate from this formula: see the 7.3 row of the table.
- **R03 (P2, missing recorded-verification hypotheses): repaired.**
  - `abs_zetaZeroCount_sub_le` now assumes `30610046000 ≤ T` (`Suggested.lean` line 189).
  - `LFunction_ne_zero_kadiri` now assumes `RiemannHypothesisUpTo 545439823` (line 255).
  - 0.4 records `|S(T)| ≤ 2.5167` (line 503).
  - The reason the new docstring gives for not stating the range `T ≥ e` is false: see R03 below.
- **R04 (P2, van der Corput toolkit with two owners): partly repaired.** ExplicitCharacterSumsAndSieves now cites §§4.1–4.3. However, this head widened 4.2 and 4.4 to two objects that the sibling still keeps: see R01.
- **R05 (P2, gaps consumers declared): partly repaired.**
  - The iterated Perron identity is now owned (6.1a).
  - The other requested items are now refused under "Not owned here" (lines 142–169).
  - The consumers still declare those items as gaps on this roadmap: see R02.
- **R06 (P2, statable headlines absent): partly repaired.**
  - `primitiveLZeroCount_le_thornerZaman` and `LFunction_one_ge_luZamanZhao` (lines 363 and 404) are new, and 8.1 is now stated (line 314).
  - The reason given for not stating 8.2 contradicts the README: see R04.
- **R07 (P3, Nemes' factor): repaired.** Line 829 now has "`(2√N + 1)/2`". I recomputed the Check at `N = 2`, `z = 10`: the bound is `0.00020411` against the true `3.2026·10⁻⁵`.
- **R08 (P3, Platt's range including modulus 1): repaired here.** Line 329 now reads "`2 ≤ q ≤ 400 000`". The supplier's `platt_bounded_height` (ComputationalNumberTheory `Suggested.lean` line 577, #1408 at ed098d6) still has only `q ≤ 400000`. That is a matter for the supplier's pull request; the consumption here is sound.
- **R09 (P3, Ralaivaosaona–Razakarinoro numbering): repaired.** See lines 2164–2166 and 2603.

## R01 (P2) — Two objects of 4.2 and 4.4 are also owned by the open ExplicitCharacterSumsAndSieves pull request

**Location.** `TauCetiRoadmap/ExplicitZetaBounds/README.md`:
- lines 83–86: "takes from 4.1–4.5 its finite van der Corput inequality (its §0.3), the Kusmin–Landau lemmas and the second to fifth derivative tests (its §§1.1–1.5)";
- likewise lines 2562–2566;
- the objects themselves are stated at lines 1096–1098 (4.2) and 1180–1200 (4.4).

**Claim.** The toolkit has one owner, this roadmap, and the sibling takes 4.2's complex-coefficient inequality and 4.4's Patel tests from here.

**Witness.** At #1948, head 3fa29b0, `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/README.md`:
- lines 60–66 say "Kept here: van der Corput's inequality for arbitrary complex coefficients (§0.3) … Patel's third, fourth and fifth derivative tests (§§1.1–1.2)";
- lines 414–420 and 559–568 state them word for word as 4.2 and 4.4 do here;
- its `Suggested.lean` declares `third_derivative_test`, `fourth_derivative_test` and `fifth_derivative_test` (lines 95, 115 and 140).

A third instance of the same pattern: at #1946, head bca454b, `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md` line 2923 plans Kusmin–Landau "stated and proved here as part of this target". That is 4.1.

**Repair.** Ownership must stay here. Merge order position 270 is before the sibling's 272, and the route of 4.8 (Patel's `|ζ(1 + it)|` bound) uses Patel's tests, so they cannot be cited from a later roadmap.
- ExplicitCharacterSumsAndSieves deletes its §0.3, its §§1.1–1.2 and the three Lean theorems, and cites §4.2 (complex `b_n`) and §4.4 (Patel's tests).
- ExplicitMultiplicativeFunctions cites §4.1 for Kusmin–Landau.
- Say in this pull request's description that #1948 is rebased onto this head before either merges.
- If the sibling keeps them as variants instead, delete the claim at lines 83–86 and 2562–2566 that it takes them from here.

Tested: the two statements agree token for token, for example the `α₃` and `β₃` of README line 1186 and of the sibling's line 566.

## R02 (P2) — Objects the consumers ask this roadmap for and that this README hands back have no owner

**Location.** `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 142–169: "that only `ExplicitPrimeCounting` uses, which states each with the theorem that needs it". Lines 160–169 hand the `1/ζ` bounds, the `dglsw2025` polynomials and Guo's gap to their consumers in the same way.

**Claim.** Each listed object is stated by the consumer that uses it.

**Witness.** Each consumer, at its head, still declares the object as a gap on ExplicitZetaBounds and states it nowhere itself:
- `TauCetiRoadmap/ExplicitPrimeCounting/README.md` (#1945, 1ab1590):
  - line 411, the Ramaré–Rumely `C₁(χ, H)` region;
  - line 415, at most four zeros with `σ ≥ 1 − 1/(3.82 log x)`;
  - line 419, the `min(0.28 log T, …)` form and Trudgian's bound with `7/8`;
  - line 423, the explicit `A`, the `965` form and the Johnston–Yang constants.
- `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md` line 463, the three bounds `1237 (log t)^{11/12}`, `30.812 log t` and `e^{146} log t`.
- `TauCetiRoadmap/ExplicitNumberFields/README.md` lines 516 and 521, the `dglsw2025` polynomials and Guo's `1/100`.

**Repair.** Give each object one owner before either pull request merges.
- Either each consumer withdraws these gap contracts and states the object next to the theorem that uses it, which is what lines 142–169 say;
- or this roadmap adds the object as a target with its locator.

Gaps that this head already meets need no change: `gap:iterated-perron` is met by 6.1a, and Kadiri's polynomial and `F₁₆` are named certificates in 7.3. Record in this README's merge-order paragraph which consumer heads carry the withdrawals.

## R03 (P2) — The `T ≥ e` form of the Bellotti–Wong headline is statable; the module docstring says it is not

**Location.** `TauCetiRoadmap/ExplicitZetaBounds/Suggested.lean` lines 58–60: "neither a complex logarithm of `Γ` nor such an argument exists in Mathlib or Tau Ceti at the pins, so 5.2 is stated on its analytic range". The README Summary (lines 24–25) lists "for `T ≥ e` given the recorded bound for `S(T)`" as an end theorem.

**Claim.** The hypothesis `|S(T)| ≤ 2.5167` cannot be stated at the pins.

**Witness.**
- The pinned Mathlib has `Complex.digamma := logDeriv Gamma` (`Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean:48`). With it, `ϑ(T) = ∫₀^T (Re ψ(1/4 + it/2) − log π)/2 dt`, and so `S(T) = N(T) − ϑ(T)/π − 1`.
- Tau Ceti also has `TauCeti.Contour.exists_continuousOn_arg_lift_with_partition` (`TauCeti/Analysis/Contour/Argument/Lift.lean:427`).

**Repair.** Add a one-line `riemannSiegelTheta` with that integral as its body. Then state the second theorem: from `∀ T, 0 ≤ T → T ≤ 30610046000 → |zetaZeroCount T − riemannSiegelTheta T / π − 1| ≤ 2.5167`, both bounds hold for `Real.exp 1 ≤ T`. Delete the false sentence.

Tested: the integral reproduces mpmath's `siegeltheta`. At `T = 100` it gives `ϑ/π + 1 = 29.00241`, and at `T = 14.14` it gives `0.45043`; these are the values of the 0.4 Checks.

## R04 (P2) — The README plans 8.2 as a target to prove, while `Suggested.lean` withholds it as possibly mistaken

**Location.**
- `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 2322–2333 say "Given `RH(545 439 823)` … prove", and lines 2332–2333 confine the reported mistake to "The bound for `ζ` alone".
- `Suggested.lean` lines 62–65: "records to contain a mistake (in its bound for `ζ` alone) without saying which of its statements the mistake reaches".

**Claim.** The two files disagree. Either 8.2 is sound, in which case it is a statable headline that is absent, or it is in doubt, in which case the README asserts it without that doubt.

**Witness.**
- `kadirilumleyng2018` lines 93–95 quote only the `ζ` bound of p. 326 and add that there is a mistake in Ramaré's paper.
- `ramare2016density` lines 83–92 state Theorem 1.1 as the README has it.
- Ramaré's current text on his author page (ramare-olivier.github.io, DensityEstimate-34) prints the same constants with no correction. I found no corrigendum.

**Repair.** Decide.
- If the mistake concerns only the `Q = 1` bound, which is the README's reading, state Theorem 1.1 in `Suggested.lean`, with a count `N(σ, T, χ)` of zeros with `σ ≤ Re ρ < 1`, `|Im ρ| ≤ T` built like `dirichletZeroCount`, and drop the docstring reason.
- Otherwise, write the doubt into 8.2 and state the target only for what the source supports.

Tested: the statement is elaborable with the pinned names `Nat.totient`, `DirichletCharacter.IsPrimitive` and `meromorphicOrderAt`.

## R05 (P3) — 6.1a states Landau's iterated Perron identity without a source

**Location.** `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 1712–1727: "For an integer `j ≥ 1`, real `c > max(κ_a, 0)` and `x > 0`, prove that …". There is no locator anywhere in the section or the References.

**Claim.** Every target carries a locator.

**Witness.** Neither 6.1a nor the References names a source for this identity; ExplicitNumberFields' `gap:iterated-perron` (line 505) gives none either.

**Repair.** Cite a text that states the identity, with its theorem or section, and record it in `sources.toml`. The mathematics is correct: the residues `(−1)^m y^{−m}/(m!(j − m)!)` sum to `(1 − 1/y)^j/j!`, and both Checks recompute (`2`, `2` and `2.0`).

## Verified sound

**Gate, build, signatures.**
- I ran the gate myself at 3e44c3f; every check passed, including `outside-folder=0` and `stray-files=0`. The pull request changes only the folder's three files.
- Dependency check, run myself: `depcheck: 244 roadmaps, 2465 edges, 0 problem(s)`. No UPWARD or CYCLE line. Merge order: SieveMethodsAndPrimePatterns 269, ExplicitZetaBounds 270, the Explicit* consumers 271–274. AsymptoticExpansions (#1857, another author's new roadmap) is named in the description's merge-order paragraph.
- `lake env lean` on `Suggested.lean`: 23 `declaration uses sorry` warnings (23 theorems), nothing else.
- I put `#check @` for all 31 declarations into one scratch file and elaborated it. No section binder is lost, because the file has no `variable` block. Each elaborated type matches its README statement in generality: for example `q > 1` with `IsPrimitive`, `χ ≠ 1` with `IsQuadratic`, and `RiemannHypothesisUpTo` heights 545439823, 30610046000 and `3·10¹²` as in 0.4.
- One-tactic probe on a scratch copy: `first | rfl | (simp; done) | (norm_num; done) | positivity | infer_instance | (intros; simp_all; done)` left all 23 theorems open, so there is no padding. All 8 definitions are needed by a headline.
- Single `import Mathlib`, no `set_option`, `theorem` throughout, layer section comments, and a docstring on every declaration.

**Source sample (all read at the cited lines).**
- 0.2: `DirichletGRH` is ANT PartI §1.6 (open head, line 991).
- 1.6: `mortici2011psi` lines 67–75, proved for all real `x > 0` (line 178).
- 2.5: derivation re-done.
- 3.5: `thornerzaman2024` lines 319–321; [1] is Bennett–Sharpley (line 1630).
- 4.6: `hiarypatelyang2024` lines 72–85.
- 4.7: `hiarypatelyang2024` 64–65 and 147–159; `hiary2016zeta` 65–66; `patelyang2024` 49–50; `thornerzaman2024` 317 and 366–379; `hiary2016hybrid` 16–20 and 57–59 (bold `q = q|t|`); `benligoeltwisszaman2026` 145–147.
- 4.8: `patel2022` 61–66; `hiaryleongyang2025` 31–43 and 109–117.
- 4.9a: `ford2002vinogradov` 123–130, 167–234 and 283–290; `bellotti2024` 183–230.
- 5.3: `bmor2021` 56–63 and 1030–1049.
- 6.1: `ramare2007eigen` 742–759; `cullyhugilljohnston2023` 141–163.
- 6.5: Checks recomputed; sources under Not verifiable.
- 7.2: `ford2002zerofree` 96–106, 137–143, 324 and 1272; `mty2024` 107–119; `bellotti2025density` 349–365.
- 7.3: `mossinghofftrudgian2015` 117–118, 152–179, 182–240 and 249–270; `jangkwon2014` 10–15, 215–217, 345–354, 436–445 and 556–603; `mty2024` 96–97 and 1279–1385; `bellottitrudgianyang2026` 67–87.
- 8.2: `ramare2016density` 39–44, 83–92 and 208–213; `kadirilumleyng2018` 93–95.
- Also read: `kadiri2018` 16–18 and 130–147; `thornerzaman2024` 31–66, 156–170, 219–226, 853 and 1193 (Lemma 2.1 is used only up to `3·10¹²`, so `RH(3·10¹²)` suffices); `luzamanzhao2026` 39–44 and 96–99; `kadiri2013density` 42–54 and Table 1 rows 655 and 660; `bellottiwong2025` 112–124, 199–202 and 1024–1054.

**Library declarations opened at the pins.**
- 97 Mathlib names (those the README cites, and `Complex.digamma_def`) elaborate with `#check`, among them `Complex.digamma`, `Complex.borelCaratheodory`, `MeromorphicOn.circleAverage_log_norm`, `Real.Gamma_mul_Gamma_add_half` and `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`.
- Tau Ceti:
  - `NonnegCombination.lean`: 48, 57 (an `abbrev`), 66 and 83;
  - `ThreeFourOne.lean`: 99;
  - `Perron/Basic.lean`: 142 and 204;
  - `Perron/Formula.lean`: 130 and 229;
  - `Contour/Argument/Lift.lean`: 427.

**Cross-roadmap citations resolved.**
- ZerosOfLFunctions on main: Layer 0 (*IsFiniteOrder*, line 372), 1.1, 1.4, 1.6, 3.4, 4.3, 4.5, 5.5, 5.6, 6.3, 6.4, 6.5, 7.1–7.4 (*S* `(T)`, line 1237) and Layer 9 (line 1586).
- LFunctions on main: `AnalyticLFunctionData` (`Suggested.lean` 117, `degree` 128, `gammaFactor` 130, `dual` 160, `HasDirichletAgreement` 178, `HasMeromorphicContinuation` 184); `riemannZetaData`, `dedekindZetaData` and `dirichletData` (README 415, 795, 861).
- Completed ArithmeticDirichletSeries 6.3 and 6.4 (lines 267, 275).
- AnalyticNumberTheoryPartI §§0.9, 0.23a (`gammaRemainder.slit_logGamma`, line 626), 0.34, 0.34a, 1.5, 1.5a, 1.6, 1.7 and 3.23.
- AsymptoticExpansions §13.1 (`sum_Icc_eq_eulerMaclaurin`) and Layer 5.
- ComputationalNumberTheory §§4.22 and 4.24.
- SieveMethodsAndPrimePatterns §2.6 (line 2151), §2.9 (line 2316), `SieveTaper.sharp_additive_largeSieve` (`Suggested.lean` 156) and `SieveApplications.sharp_primitive_largeSieve` (181).
- The three "found nowhere" leads of the citation scan are these supplier names, so all three resolve.

**Ownership.**
- Checked against ExplicitCharacterSumsAndSieves, ExplicitPrimeCounting, ExplicitMultiplicativeFunctions and ExplicitNumberFields at the heads above, and ZerosOfLFunctions #1913, which drops no id cited here.
- Vinogradov's mean value theorem and the Riemann–Siegel formula occur in no other roadmap.
- ExplicitCharacterSumsAndSieves consumes 6.5 correctly (its line 80).

**Adversarial table.**

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| `RiemannHypothesisUpTo` (0.2) | `H < 0`; strip dropped; closed-strip imprimitive law | vacuous; `ζ(−2) = 0`, `Re = −2`; zero `2πi/log 2` at height `9.0647` | sound | — |
| `GRH(q, H)` (0.2) | `q = 2`; `q = 1` | no primitive χ, vacuous; `L = ζ`, equals `RH(H)` | sound | — |
| *IsAdmissibleCosinePolynomial* (0.5) | `(3,4,1)`; `(1,2)`; `n = 0`, `(1,2,0,…)` | `2(1+cos θ)² ≥ 0`; `P(π) = −1`; `a 1 = 0` forced, fails | sound | R01 old repaired |
| `vinogradovCount` (4.9a) | `J₂,₁(2)`, `J₂,₂(3)`, `J₃,₃(2)`, `P < 1` | `6`, `15`, `20` by brute force (permutations only), `0` | sound | — |
| `zetaZeroCount` (5.2) | `T = 14, 15, 100`; `T = 3.0610046·10¹⁰` | `0, 1, 29`; `N = 103 800 788 359` against main `…357.756` | sound | — |
| `dirichletZeroCount` (5.3) | `χ₋₄`, `T = 10` | `2` (zeros `±6.0209`) in `[0.78, 5.14]` | sound | — |
| `zetaZeroCountRight` / `zetaZeroDensityCount` | `σ = 9/10`, `T = H₀`, given `RH(H₀)` | `0` against `1.70·10¹⁰` and `1.918·10⁸`; a zero at `β = 9/10` counts in `N` only | sound | — |
| `primitiveLZeroCount`, `largestRealZero` (8.4) | `Q = 3`; `Q = 5` | factors `ζ`, `L(χ₋₃)`; pole order `−1` gives `0`; `β₁(3) = −1` (`L(0, χ₋₃) = 1/3`); `β₁(5) = 0` | sound | — |
| `norm_Gamma_bounds` (2.5) | 400 random `s`, `σ ∈ [0.0005, 90]`, `|t| ∈ [0.005, 450]`; `1 + i`; `1/2 + 10i` | least log-margins `6.2·10⁻¹⁰` (lower), `3.7·10⁻⁴` (upper); `0.4440 < 0.52156 ≤ 0.6972`; `3.777532·10⁻⁷ = √(2π)e^{−5π}` | sound | — |
| `norm_LFunction_le_rademacher` (3.2) | 13 primitive χ of conductor 3, 4, 5, 7, 8, 12; `η ∈ {0.05, 1/2}`; `σ ∈ {−η, 0, 1/2, 1, 1+η}`; `t ∈ {0, 2, 10, 30}` | largest ratio `0.737`: `64.35 ≤ 87.32`, sextic mod 7, `σ = −1/2`, `t = 30` | sound | — |
| `norm_riemannZeta_criticalLine_le` (4.7) | `t ∈ [3, 60]`, step `0.05` | largest ratio `0.8210`; bound at 3 is `0.8154` | sound | — |
| 4.7 (other items) | Thorner–Zaman sum; hybrid at `q = 64`, `t = 200`; Lehman at `t = 0.2`, `200` | `2·0.749397 = 1.498793 ≤ 1.4988`; `8910.98` against `31.66`; `1.6896 > 1.461`; margin `1.58` | sound | — |
| `norm_riemannZeta_one_add_le` (4.8) | `t ∈ [3, 60]`, step `0.05` | ratios at most `0.6443` (Patel), `0.4852` (HLY) | sound | — |
| `vinogradovCount_le_ford` (4.9a) | `k = 1000`, `s = 2k²` and `s = 3 213 463` | `Δ_s = 11 343.3` and `1001.70`; upper limit of `s` `3 213 463.01` | sound | — |
| `norm_riemannZeta_le_richert` (4.10) | `σ ∈ {0.5,…,1}`, `t ∈ ±[3, 60]`, `u ∈ {0.01, 0.2, 0.5, 0.99, 1}` | largest ratios `0.0105` (ζ), `0.0104` (Hurwitz) | sound | — |
| `abs_zetaZeroCount_sub_le` (5.2) | `T = 3.0610046·10¹⁰` | `|N − M| = 1.2438 ≤ 11.295` and `≤ 6.8785` | sound | R03 (range `T ≥ e`) |
| `dirichletZeroCount_explicit` (5.3) | `q = 3`, `T = 5/7`; `χ₋₄`, `T = 10` | `ℓ = 0.259`, `N = 0`; `ℓ = 2.0333`, main `2.959`, error `2.182` | sound | — |
| `riemannZeta_ne_zero_classical` (7.3) | `|t| = 2`, `3·10¹²` | `σ ≥ 0.740461`, `0.993738` | sound | — |
| 7.3 criterion | Kadiri's polynomial, `θ = 1.848`, `w₀ = 0.579471`, `κ = 0.44213` | `a = (1.3646158, 2.3292025, 1.4314625, 0.5875, 0.125)`; `d₁ = 1.051620`, `g₁ = 147.84112`; `K(w₀) = 31.0393`; threshold `5.94294` against printed `5.942924085`; old reading `68.459` (×`11.519`); `K` rises `31.04 → 32.82` on `[w₀, 1]` | sound | R02 old repaired |
| `riemannZeta_ne_zero_littlewood` (7.4) | `t = e^{200}`; `|t| = 3` | `0.0012477 > 0.0008995`; `log log 3 = 0.094` | sound | — |
| `LFunction_zeroFree_mcCurley` (7.5) | `q = 3`, `|t| ≤ 1`; principal factor at `|t| = 2`, `10⁹` | `σ ≥ 0.905635`; `0.94214`; `0.99525` inside Ford's `0.99430` | sound | — |
| `LFunction_ne_zero_kadiri` (7.5) | `q = 3`, `|t| ≤ 1`; first zero of `L(χ₋₃)` | `σ ≥ 0.837457`; at `8.04` the boundary is `0.9439 > 1/2` | sound | — |
| `riemannZeta_ne_zero_vinogradovKorobov` (7.6) | `|t| = e^{1000}`; `|t| = 3` | `9.5051·10⁻⁵`; `σ ≥ 0.9626` | sound | — |
| `LFunction_real_zero_le_bordignon` (7.7) | `q = 4·10⁵`; `β ≤ 0` | `0.0076020`, `0.00095025`; trivially satisfied | sound | — |
| `LFunction_real_ne_zero_luZamanZhao` (7.8) | `q = 1, 2`; `q = 4`; `q = 10¹⁰` | no χ with `χ ≠ 1`; `[0.855730, 1)` with `L(σ, χ₋₄) > 0`; `0.991314` | sound | — |
| `inv_norm_riemannZeta_one_add_le` (7.10) | `t ∈ [3, 300]`, step `0.25` | largest ratio `0.00254`; `1.5675 ≤ 5042.9` | sound | — |
| `zetaZeroCountRight_le_kadiri` (8.1) | `T = 3.061·10¹⁰` | `1.70·10¹⁰`, `1.35·10¹⁰` against true `0` | sound | — |
| `zetaZeroDensityCount_nine_tenths_lt` (8.3) | `T = H₀` | `0 < 1.918·10⁸` | sound | — |
| `primitiveLZeroCount_le_thornerZaman` (8.4) | `Q = 3`, `σ = 39/40` | count `0` against `10^{99.71}`; `min(1, 2 log 3) = 1` | sound | — |
| `zetaZeroDensityCount_le_bellotti` (8.5) | `T = 10¹³`, `σ = 0.9927`; `σ = 1` | `2.22·10¹¹` against trivial `2.16·10¹³`; `1.62·10¹¹` | sound | — |
| 8.2 | `Q ≤ 4·10⁵`, `T ≤ 10⁸/Q`; `σ = 0.52`, `Q²T ≥ 10⁹` | count `0`; `σ₀ ≥ 0.5039 > 1/2` | sound | R04 |
| `norm_LFunction_one_le_ramare` (9.1) | 353 primitive χ of conductor `q ≤ 53` prime, plus 4, 8, 12 | largest ratios `0.870` (odd), `0.784` (even), `0.910`, `0.786` (`2 ∣ q`) | sound | — |
| `norm_LFunction_one_ge` (9.3) | 334 non-quadratic primitive χ, prime `q ≤ 53`; quartic mod 5 | largest bound/value `0.2499`; `0.888577 ≥ 0.222066` | sound | — |
| `LFunction_one_ge_luZamanZhao` (9.3) | 19 quadratic primitive χ | largest bound/value `0.188` (`q = 3`: `0.11378 ≤ 0.60460`) | sound | — |
| 1.4 | `θ_x` at `x = 1, 2, 10, 100, 0.5, 0.9` | `0.33593, 0.51176, 0.87001, 0.98632, 0.32076, 0.32036` | sound | — |
| 1.6 | `x = 0.01 … 20`, step `0.01`; `x = 1`; `x = 20` | no violation; `−0.009968 ∈ (−0.075347, 0.059375)`; fraction `0.953` | sound | — |
| 2.4, 2.7, 2.8 | `Re ξ(i)`; `Re ξ(−1/2+2i)`; `ψ(10i)`; `σ = −1/2`, `t = 100` | `0.0009346`; `−0.010044`; `2.303419 + 1.620796i`; quotient `50.0006 = |(1+s)/2|` | sound | — |
| 3.5 | `F` constant; `e^{az}`; `exp(e^{−iπ(z−1/2)})` | equality; `a/2 = a/2`; `0` on both lines against `e^{πt}` (`c = π`) | sound | — |
| 4.5a, 4.6 | Kadiri's `C`; `t = 200` | `2.19457`; `n₁ = 5`, `|Σ| = 2.79642`, `5.98878 ≥ 5.58978`, RSL `7.42107` | sound | — |
| 6.1, 6.1a | `F = 1`, `x = 1`; `x = 3`, `j = 1, 2`; `F = ζ`, `x = 2.5` | error `2 ≥ 1/2`, kernel equality at `y = 1`; `2`, `2`; `2.0 = ∫⌊y⌋` | sound | R05 (locator) |
| 6.5 | `X = {0, 1/2}`, `N = 1` | weights `1/4`, `0.2754`; `0.5508|a|² ≤ |a|²` | sound | — |
| 7.2 | `t = 1.88·10¹⁴`; `e^{64.1}` | `0.0042384` against `0.0054738`; `0.0028064` against `0.0028066` | sound | — |

## Not verifiable

These texts are recorded uncertified or waived and have no cached text. Each target's formula or Check was re-derived or recomputed instead:
- `montgomeryvaughan1974` (Corollary 3) and `elliott1987` (Lemma 1), for 6.5;
- `preissmann1984` (`c₀`);
- `montgomery1994ten`, `logan1988` and `gallagher1970` (6.3);
- `rademacher1959` (2.8, 3.2);
- `backlund1918` and `rosser1941` (3.3, 5.2);
- `delange1987` and `bastienrogalski2002` (3.4);
- `andrewsberndt2013` and `mortici2011ramanujan` (1.4);
- `ramare2001` (9.1), through `ramaretmeemt` lines 88–100;
- `mccurley1984`, through `thornerzaman2024` lines 164–170 and `kadiri2018` lines 142–147;
- `lehman1966`, `lehman1970`, `dlmf`, `davenport2000`, `titchmarsh1986` and `louboutin2015`;
- `gabcke1979` (waived), used only through `hiarypatelyang2024` Lemma 2.1.

## Source issues

- **Misprint** in `mty2024` at §9, p. 24 (line 1357): the source says Mossinghoff and Trudgian computed `R₀ = 5.574312`; it should be `5.573412`, as in their Theorem 1 and in `mty2024` line 1352; affects nothing.
- **Misprint** in `ramare2016density` at §11.1, p. 350 (line 1569): the source says the condition `σ ≥ 0.65` of Theorem 1.1 makes `σ₀ > 1/2`; it should be `σ ≥ 0.52`, which suffices since `Q²T ≥ 10⁹` gives `σ₀ ≥ 0.5039`; affects nothing.
