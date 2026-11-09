# Review of ZerosOfLFunctions (pull request #1913 at 00e590f)

**Verdict:** needs changes

This is an incremental re-review of the 141 README lines changed since `e99b47b`. `Suggested.lean`, the pins and every file outside the folder are unchanged.

The change repairs the previous R02:
- 8.5 and 8.7 now pass from `ψ` to `π` through `ϑ`, after removing the higher prime powers;
- the supplier contracts, both *Needs:* lines and the Layer 8 dependencies name every new input.

The repair introduces no new problem. Every new declaration resolves at the pin with the stated hypotheses, and every new Check value was recomputed.

One finding remains, and it is not blocking: the previous R01 (P3), carried as R01.

Summary of the checks:
- **Gate:** passes.
- **Dependency check:** 0 problems.
- **Elaboration:** `sorry` is the only warning.

Paths: `TauCeti/…` is a file of the Tau Ceti pin `2fd255d9`, and `Mathlib/…` a file of the Mathlib pin `1b1ccf4b`. Other roadmaps are read on main (`3090489`) unless a pull request is named.

## R01 (P3) — No stated order against #1907, the other open pull request on this roadmap (previous R01, not repaired)

**Location.** The pull request's description, outside the folder. It names no other pull request, and its last line reads "Merge order: no pending supplier."

**Claim.** Two open pull requests change `TauCetiRoadmap/ZerosOfLFunctions/`, and their heads conflict. One has to be rebased on the other before either merges, and the description has to say which.

**Witness.**
- `roadmaps overlaps ZerosOfLFunctions`, run this round, reports "#1907 and #1913 conflict in `README.md`, `Suggested.lean`".
- #1907 is still at `123254c`. Its `Suggested.lean` declares four theorems this head lacks: `completed_orderLE_one`, `finite_zero_sum_le_logDeriv`, `dedekindZeta_zeroFreeRegion` and `riemannVonMangoldt_dedekindZeta`.
- #1907 lacks `riemannZeta_zeros_summable_ordinate` and `neg_re_logDeriv_riemannZeta_le`, which this head declares at lines 137 and 202.

**Repair.** Add one sentence to the description saying which of #1913 and #1907 is rebased on the other. The rebased one then reconciles the declarations listed above.

**Test.** After the rebase, `roadmaps overlaps ZerosOfLFunctions` reports no conflict between the two heads.

## Previous findings

- R01 — not repaired: the description still ends "Merge order: no pending supplier." and names no order against #1907, whose head `123254c` still conflicts in `README.md` and `Suggested.lean` (R01 above).
- R02 — repaired: README 8.5 (line 2007): "The prime count is reached through `ϑ_K = TauCeti.primeTheta K Set.univ`, not through `ψ_K`…"; 8.7 (line 2156): "the prime count first removes the higher prime powers…". Contracts, *Needs:* lines and Layer 8 dependencies name the inputs.

No repair report exists, so no finding is settled as "not actionable".

## Verified sound

### Gate, dependency check, elaboration

- **Gate.** My run of `gate … ZerosOfLFunctions --base origin/main` exits 0 and ends in `OK`. Every check is 0:

  ```text
  gate ZerosOfLFunctions: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's gate (`gate.md`) also has `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- **Dependency check.** It exits 0, with no UPWARD, CYCLE or `moved:` line:

  ```text
  depcheck: 236 roadmaps, 2263 edges, 0 problem(s)
  ```

- **Elaboration.** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0. Its output is 17 "declaration uses `sorry`" warnings, at lines 98, 110, 124, 137, 155, 174, 185, 202, 215, 229, 247, 262, 278, 296, 310, 331 and 345, and nothing else.
- **Signatures.** `Suggested.lean` has a 0-line diff since `e99b47b`. The previous `#check @` comparison and one-tactic probe still apply: the file has no `variable` line, and none of the 17 theorems closes in one tactic.

### The R02 repair, at the pin

A scratch file elaborated `#check @` for 16 declarations and one proved `example`, with exit 0 and no `sorry`:
- the 16 are the 15 Tau Ceti names the repair cites, plus `TauCeti.IdealArithmeticFunction.vonMangoldt`;
- the `example` is `primePsi K Set.univ x − primeTheta K Set.univ x = higherPrimePowerTheta K x`, proved by `rw [primePsi_sub_primeTheta, higherPrimePowerTheta_apply]; congr 1; ext A; simp`. This confirms the 8.5 sentence and the "From Tau Ceti" gloss "which is `primePsi K Set.univ x − primeTheta K Set.univ x`".

Each declaration has the meaning the README gives it:

| Declaration (file:line) | What the elaborated statement says | README use |
| --- | --- | --- |
| `primeTheta`, `primeCount` (`…/ArithmeticDirichletSeries/Counting.lean:625, 630`) | `primeSummatory` of `S.indicator (log 𝔑v)` and of `S.indicator 1` | `ϑ_K`, `π_K` |
| `primePsi_sub_primeTheta` (`…/Prime/Psi.lean:210`) | `ψ_S − ϑ_S = primePowerSummatory` of the base-in-`S` indicator of `higherPrimePowerWeight` | 8.5 at `S = univ` |
| `primePowerSummatory_indicator_sub_primeTheta` (`Psi.lean:185`) | for `T` with `ofPrime v ∈ T ↔ v ∈ S`, `Σ_T primePowerWeight − ϑ_S = Σ_T higherPrimePowerWeight` | 8.7 with `T_c`, `S_c` |
| `higherPrimePowerWeight` (`…/HigherPrimePowers.lean:186`) | `log 𝔑(base)` if the exponent is `≥ 2`, else `0` | "the `𝔭^k`, `k ≥ 2`" |
| `higherPrimePowerTheta_le` (`HigherPrimePowers.lean:296`) | `1 ≤ x →` the sum is `≤ finrank ℚ K/(2 log 2) · √x log² x` | 8.5, 8.7 bound |
| `higherPrimePowerTheta_isBigO` (line 313) | `O(√x log² x)` at `atTop` | contracts |
| `primePowerSummatory_isBigO_of_le_higherPrimePowerWeight` (line 346) | `0 ≤ C` and `‖w A‖ ≤ C · higherPrimePowerWeight A` give `O(√x log² x)` | 8.7 at `C = 1` |
| `idealSummatory_eq_primePowerSummatory` (`Counting.lean:600`) | `v` agreeing with `w` on prime powers and `0` off `IsPrimePow` has the same summatory function | 8.7 *rayClassPsi* |
| `primeCount_eq_primeTheta_div_log_add_integral` (`…/AbelSummation.lean:494`) | for every real `x`, `π_S = ϑ_S/log x + ∫_{Ioc 2 x} ϑ_S(t)/(t log² t)` | 8.5, 8.7 Abel step |
| `Real.logIntegral_eq_div_log_sub_add` (`Analysis/SpecialFunctions/LogIntegral.lean:180`) | `2 ≤ x →` `Li x = x/log x − 2/log 2 + ∫_2^x (log t)^(−2)` | main-term constant |
| `primePowerWeight_eq_vonMangoldt_re` (`Psi.lean:106`) | `primePowerWeight A = Re Λ_K(A)` | 8.7 weight |

Notes on the 8.7 route:
- **Hypotheses are met.** The hypothesis `ofPrime v ∈ T_c ↔ v ∈ S_c` holds by the definitions of `T_c` and `S_c`, and `Λ_K` vanishes off the prime powers. With weight `T_c.indicator higherPrimePowerWeight`, the `C = 1` domination holds because `higherPrimePowerWeight_nonneg`.
- **Uniformity in `K`.** The bound depends on `K` only through `finrank ℚ K = n`, as both 8.7 and the `ℚ(i)` Check say.
- **Arithmetic Dirichlet Series sections on main.** Every section the new text cites carries the named content:
  - §4.2 (`Completed/ArithmeticDirichletSeries/README.md:227`): summatory functions on ideals, primes and prime powers;
  - §4.3 (line 234): `primeTheta` and `primeCount`;
  - §5.2 (line 249): the `O(√x log² x)` higher-prime-power estimate, with the hypotheses for other weights;
  - §6.1 (line 258): Abel summation;
  - §6.2 (line 264): `ϑ ∼ δx ⟹ π ∼ δ Li`;
  - §10.1 (line 359): `primePsi`;
  - §10.2 (line 366): "Remove higher prime powers".

  The Scope's "Layers 0–2, 4–6 and 10" and Layer 8's dependency line "§§2.3, 4.2–4.3, 5.2, 6.1–6.4, 10.1–10.2" agree with these.
- **Contract coverage.** Three Tau Ceti names cited in the body are absent from the "From Tau Ceti" list: 8.7's `primePowerWeight_eq_vonMangoldt_re` (new) and 8.9's `integral_inv_log_pow_le` and `intervalIntegrable_inv_log_pow` (untouched, `LogIntegral.lean:102, 92`). All three resolve. Their sections, Arithmetic Dirichlet Series §10.2 and §6.2, are in the contracts, which name declarations or sections, so no change is asked.

### The analysis behind the new prose, recomputed

- **8.5 error term.** `d/dt log(t e^{−c√log t}) = (1 − c/(2√log t))/t`, positive for `log t > c²/4`. So `|E(t)| ≤ C x e^{−c√log x}` on `[t₁, x]`, and `∫_{t₁}^x dt/(t log² t) ≤ 1/log t₁` keeps the same `c`. "The monotonicity of `t exp(−c √log t)` for large `t`" therefore suffices.
- **8.7 main term.** For `f` differentiable, `f(x)/log x + ∫_2^x f/(t log² t) = ∫_2^x f'/log t + f(2)/log 2`:
  - `f = t/h` gives `Li x/h + 2/(h log 2)`;
  - `f = t^β/β` with `u = t^β` gives `Li(x^β) − Li(2^β) + 2^β/(β log 2)`, defined for `2^β > 1`.

  Both are as printed, and both agree with the untouched bullet that keeps "the fixed lower-endpoint constant … separately".

### Seeded sample

Of the sampled targets, only 8.7 falls in changed text, and 8.8 depends on it.
- **8.7.** Its Tau Ceti inputs are checked in the table above. Davenport §20 is uncertified (Not verifiable).
- **8.8.** It obtains the Frobenius count from 8.7's prime count over the fibre `Φ⁻¹(σ_C)`, so it inherits the repaired step and has no `ψ → π` step of its own. Its pinned inputs resolve:
  - `rayClassArtinMap`, `rayClassArtinMap_surjective`, `rayClassArtinMap_idealClass` (`TauCeti/NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Reciprocity.lean:128, 161, 216`);
  - `isAdmissibleModulus_abelianConductor` (`AdmissibleModulus/Basic.lean:208`);
  - `frobeniusPsi`, `frobeniusPrimeCount` (`TauCeti/NumberTheory/Chebotarev/PrimeCounting/VonMangoldt.lean:165, 177`);
  - `tendsto_frobeniusPrimeCount`, `hasNaturalDensity_frobeniusPrimeSet` (`FrobeniusPrimeCount.lean:91, 108`).
- **The rest of the sample** (0.2, 1.3a, 1.4a, 2.5, 3.1, 5.3, 6.2, 7.3, 7.5, 8.1, 8.3, 8.4 and 8.6) lies in text the diff leaves untouched. It was not re-read this round. The previous report's readings of 5.3, 8.4 and 8.6 stand.

### Citations and overlaps

- **Cross-roadmap citations.** `roadmaps resolve` finds none unresolved. Its 13 Lean-name leads are the Provenance names of PrimeNumberTheoremAnd (README lines 2460–2463) and the Hecke Mellin names (lines 454–457), all in untouched text. The previous report checked them.
- **Overlaps.** `roadmaps overlaps`, run this round, reports:
  - no cited id dropped by an open pull request;
  - no id defined only by an open revision;
  - no id of this pull request dropped elsewhere;
  - only #1907 as a conflicting change (R01).

  The closest open roadmaps are ExplicitZetaBounds, ExplicitNumberFields, AnalyticNumberTheoryPartIII, Chebotarev and ExplicitPrimeCounting. The change adds no owned object, so ownership is as in the previous report.

### Adversarial table

Values for the changed statements were computed this round: in pure Python (a sieve to `10⁶`, the exact step-function Abel integral, midpoint quadrature for `Li`) and in Lean (the probe above). Rows marked "r28" carry forward the previous report's values for statements the diff leaves untouched.

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| 8.5 `ψ_K − ϑ_K = higherPrimePowerTheta` | Lean, all `K`, `x`; `ℚ` at `x = 10, 10⁶` | proved (no `sorry`); `2.4849 ≤ 12.0942`; `1102.4225 ≤ 137682.398` | sound | none |
| 8.5 Abel identity (`π` from `ϑ`) | `ℚ`, `x = 10, 100` | `4.0000` / `π = 4`; `25.0000` / `π = 25` | sound | none |
| 8.5 main-term constant | `x = 100` | `x/log x + ∫_2^x log⁻² = 31.96636` / `Li x + 2/log 2 = 31.96637` | sound | none |
| 8.5 Check 1 (`ℚ`, `x = 10`) | `ψ`, `ϑ`, `Π`, `π` | `7.8320 = log 2520`; `5.3471 = log 210`; `ψ − ϑ = 2.4849 = log 12`; `Π = 5.3333 = 16/3`, `π = 4` | sound | none |
| 8.5 Check 2 (`ℚ`, `x = 10⁶`) | `Π − π`, `Σ_{k≥2} π(x^{1/k})/k` | `78597.1117 − 78498 = 99.1117` / `99.1117` | sound | none |
| 8.5 Check 3 (`ℚ(i)`, `x = 10`) | prime-ideal norms; higher powers | `{2, 5, 5, 9}`; `(1+i)²`, `(1+i)³`: `1.3863 = 2 log 2 ≤ 24.1883`; `log 9 = 2.1972` | sound | none |
| 8.5 error via monotonicity | derivative of `log(t e^{−c√log t})` | `> 0` iff `log t > c²/4`; tail factor `≤ 1/log t₁` | sound | none |
| 8.7 `T_c`/`S_c` split | `ℚ`, `(4)∞`, class of `1`, `x = 9` | *rayClassPsi* `2.70805 = log 15`; `ϑ = 1.60944`; difference `1.09861 ≤ 2.48491` | sound | none |
| 8.7 Abel of `x/h` | `h = 2`, `x = 100` | `15.98318` / `Li x/2 + 1/log 2 = 15.98318` | sound | none |
| 8.7 Abel of `x^β/β` | `β = 0.6, 0.9`, `x = 100` | `11.94632` / `11.94633`; `23.86645` / `23.86646` | sound | none |
| 8.7 Check (new) | Abel of *rayClassPsi* against `1/log t` | `1 + 1/2 = 1.5` / prime count `1` | sound | none |
| `OrderLE` (0.1) | r28 | `log(Γ(n+3/2)/π)` grows as `n log n`; `exp(r² − r^{3/2}) → ∞` | sound | none |
| `zeroCount` (4.1) | r28 | `2`; `1` against signed `0`; `0, 0` | sound | none |
| `zetaEntireCompletion` (0.2) | r28 | `1, 1`; `2m(2m−1)π^{−m}(m−1)!ζ(2m)` | sound | none |
| 1.4a | r28 | `1.4150927` both sides; `Im ψ(i) = 2.0766740` both sides | sound | none |
| 1.5 | r28 | remainder `0.806357, 0.806046, 0.806043` (limit `0.806043`) | sound | none |
| 2.1, 2.3, 2.4 | r28 | `7/2`, `12`, `N`; shift `(k−1)/2`; `90` at `Δ` | sound | none |
| 3.1, 3.4, 3.5 Checks | r28 | `0.21938 < 0.36788 < 1`; exponents `½+δ, ¼+δ/2, 0`; `3.676797`, `13519751.806` | sound | none |
| 5.2, 5.6a | r28 | `0.090204`, `E₁'(1) = −e`; `0.0099606` | sound | none |
| `dirichletLFunction_convexity` | r28 | `2.692697` / `103^{1/4} = 3.185733` | sound | none |
| `hadamard_of_orderLE_one` / `zetaEntireCompletion_hadamard` | r28 | `b = −0.0230957` | sound | none |
| `riemannZeta_zeros_summable_ordinate` | r28 | `0.0099606`; `1/Γ(s+½)` summands `1` | sound | none |
| `heckeLFunction_zeroFreeRegion`, `riemannZeta_…`, `dirichletLFunction_…` | r28 | `n = 0` vacuous; `1.26186 < 1.27`; `0.231049`; `c ≤ log 3/2` | sound | none |
| `neg_re_logDeriv_riemannZeta_le` | r28 | `1 + δ − β > δ`; `0.569961` | sound | none |
| `riemannVonMangoldt`, `_dirichlet`, `_heckeLFunction` | r28 | `0` / `−0.44300`; `29` / `28.12734`; `2` / `2.70882`; `58` / `56.25469` | sound | none |
| `chebyshevPsi_explicitFormula`, `riemannZeta_weilExplicitFormula` | r28 | `94.04531` / `95.04034`; `−(log π)φ(1)` | sound | none |
| `primeIdealCount_effective` | r28 | `ℚ(i)`, `x = 10⁶`: `78438` / `Li = 78626.5` | sound | none |
| `rayClassPrimeCount_effective` | r28 | `ℚ(√−5)`: `39114`, `39253` / `39313.3` | sound | none |
| `primeCounting_progression_effective` | r28 | `q = 8`: `19552…19669` / `19656.6`; `a = 2, q = 4`: `¬IsUnit` (Lean) | sound | none |
| `frobeniusPrimeCount_effective_abelian` | r28 | `ℚ(i)/ℚ`: `39175`, `39322` / `39313.3` | sound | none |
| 8.9 Checks | r28 | `Li 10 = 5.12044`; `0.77749` / `1.88612` | sound | none |
| R01 | #1907 at `123254c` | 4 declarations only there, 2 only here | order unstated | R01 |

### Remarks on text outside the folder (no R-number, no change asked of the folder)

- The board's `sources.toml` still records `trudgian2015` as "no. 294, pp. 2047-2058". bennett2021 lines 1149–1150 and hasanalizade2022 line 786 give no. 293, pp. 1439–1450, as the README has it. The previous report noted the same.

## Not verifiable

- **Davenport, *Multiplicative Number Theory*, §§18 and 20** (8.5, 8.7). Settled as uncertified and cited by locator. The repaired route was checked against the pinned declarations instead.
- **Lagarias–Odlyzko 1977, Theorems 1.3 and 9.2** (a remark in 8.8, for a statement not owned here). Academic Press, paywalled; not in the manifest.
- The other unreadable texts (Iwaniec–Kowalski, Titchmarsh, Lang and LMO 1979) are cited only in text the diff leaves untouched. The previous report lists them.

## Source issues

This round read no source passage beyond the pinned libraries. The two issues the previous report recorded, in kadiri2012 and trudgian2015, stand.

- none
