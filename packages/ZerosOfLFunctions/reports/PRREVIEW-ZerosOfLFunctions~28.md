# Review of ZerosOfLFunctions (pull request #1913 at e99b47b)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ZerosOfLFunctions/` at `e99b47b`. The folder changed by 158 lines since `c4cb18f`, the head the previous review read.

There are two findings, both P3, and no blocking finding:
- R01 is the previous R01, which is not repaired.
- R02 is new. It is in 8.5 and 8.7, whose text this head revised.

The previous R02 is repaired.

Summary of the checks:
- **Gate.** It passes.
- **Dependency check.** It reports 0 problems.
- **Elaboration.** `Suggested.lean` elaborates with `sorry` as its only warning.
- **Adversarial pass.** It found no false, vacuous or mis-scoped statement among the 3 definitions, the 17 theorems and the 15 sampled targets (table below).

Paths: `TauCeti/…` is a file of the Tau Ceti pin `2fd255d9`, and `Mathlib/…` a file of the Mathlib pin `1b1ccf4b`. Other roadmaps are read on main (`1bea835`) unless a pull request is named.

## R01 (P3) — No stated order against #1907, the other open pull request on this roadmap (previous R01, not repaired)

**Location.** The pull request's description, which is outside the folder. It names no other pull request; its last line reads "Merge order: no pending supplier."

**Claim.** Two open pull requests change `TauCetiRoadmap/ZerosOfLFunctions/`, and their heads conflict. One of them has to be rebased on the other before either merges, and the description has to say which.

**Witness.**
- `roadmaps overlaps ZerosOfLFunctions` reports "#1907 and #1913 conflict" in `README.md` and `Suggested.lean`.
- #1907 is still at `123254c`.
- Its `Suggested.lean` declares `completed_orderLE_one`, `finite_zero_sum_le_logDeriv`, `dedekindZeta_zeroFreeRegion` and `riemannVonMangoldt_dedekindZeta`, which are absent here.
- It lacks `riemannZeta_zeros_summable_ordinate` and `neg_re_logDeriv_riemannZeta_le`, which this head declares.

**Repair.** Add one sentence to the description saying which of #1913 and #1907 is rebased on the other. The rebased one then reconciles the declarations listed above.

**Test.** After the rebase, `roadmaps overlaps ZerosOfLFunctions` reports no conflict between the two heads.

## R02 (P3) — 8.5 and 8.7 pass from `ψ` to `π` by Abel summation alone, without removing the higher prime powers

**Location.** README 8.5, lines 1979–1982:

> By Abel summation (`TauCeti.idealSummatory_mul_eq_sub_integral_mul`) the number `π_K(x) = TauCeti.primeCount K Set.univ x` of nonzero prime ideals of norm at most `x` is `Li x + O(x exp(−c √log x))`

Its *Needs:* (lines 1991–1993) has no higher-prime-power input. README 8.7, lines 2096–2098 ("The passage to the prime count is Abel summation"), and its *Needs:* (lines 2118–2125) have the same gap.

**Claim.** `ψ_K` weights every prime power `𝔭^k`. Abel summation of `ψ_K` against `1/log t` therefore gives Riemann's prime-power count `Π_K = ∑_{𝔭^k} 1/k`, not `π_K`. The step from `ψ_K` to `π_K` needs `ψ_K − ϑ_K = O(√x log² x)` (Arithmetic Dirichlet Series §5.2), and no target, *Needs:* line or supplier contract names it.

The same holds for *rayClassPsi* in 8.7: it selects `𝔭^k` by the class of `𝔭^k`. The higher prime powers of one class are bounded by those of all classes. The estimates stay true, since the difference is absorbed in the error. But the route uses an input it never names, against the README's "No gaps" rule.

**Witness.**
- At `K = ℚ`, `x = 10⁶` (sieve):
  - Abel summation of `ψ` gives `Π(10⁶) = 78597.11`, against `π(10⁶) = 78498`;
  - `ψ(10⁶) − ϑ(10⁶) = 1102.42`.
- The missing step is at the pin:
  - `TauCeti.primePsi_sub_primeTheta` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/Psi.lean:210`);
  - `TauCeti.higherPrimePowerTheta_isBigO` (`…/HigherPrimePowers.lean:313`, "this is Layer 5.2's estimate").

**Repair.**
1. In 8.5, replace the quoted sentence with the following. `ψ_K − ϑ_K` is the higher-prime-power sum (`TauCeti.primePsi_sub_primeTheta`). That sum is `O(√x log² x)` (`TauCeti.higherPrimePowerTheta_isBigO`, Arithmetic Dirichlet Series §5.2). So `ϑ_K = TauCeti.primeTheta K Set.univ` satisfies the estimate of `ψ_K`, and Abel summation (`TauCeti.idealSummatory_mul_eq_sub_integral_mul`) of `ϑ_K` against `1/log t` gives `π_K(x) = Li x + O(x exp(−c √log x))`.
2. In 8.7, add one sentence: the prime powers `𝔭^k`, `k ≥ 2`, in the class `c` contribute at most `higherPrimePowerTheta K x = O(√x log² x)`, which is removed before the Abel summation.
3. Add Arithmetic Dirichlet Series §5.2 `TauCeti.higherPrimePowerTheta_isBigO`, §4.3 `TauCeti.primeTheta` and `TauCeti.primePsi_sub_primeTheta` to both *Needs:* lines.
4. List the two declarations, with their files, under "From Tau Ceti" next to `TauCeti.primePsi`.

**Test, at the instance above.**
- The pinned bound `higherPrimePowerTheta_le` (`HigherPrimePowers.lean:296`) gives `ψ − ϑ ≤ √x log² x/(2 log 2) = 137682` at `x = 10⁶`, against the true `1102.42`.
- Abel summation of `ϑ` against `1/log t` is exactly `π`, `78498`.

## Previous findings

- **R01 of round 27 — not repaired.** The description is unchanged on this point: it still names no order against #1907, and #1907 still conflicts (R01 above).
- **R02 of round 27 — repaired.** All five points are done, and the test passes:
  1. `primeIdealCount_effective` (`Suggested.lean:296–299`) is stated on `TauCeti.primeCount K Set.univ x - TauCeti.Real.logIntegral x`.
  2. `rayClassPrimeCount_effective` (lines 310–318) is stated on `TauCeti.primeCount K {P | ∃ h : P.asIdeal ∈ …integralIdealsPrimeTo 𝔪, …idealClass 𝔪 ⟨P.asIdeal, h⟩ = a} x`.
  3. `primeCounting_progression_effective` (lines 331–336) is stated on `TauCeti.primeCount ℚ {p | Ideal.absNorm p.asIdeal % q = a % q} x` under `[NeZero q]` and `IsUnit (a : ZMod q)`. This is the carrier and the hypotheses of `NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral` (`TauCeti/NumberTheory/Chebotarev/PrimeCounting/PrimesCongruent.lean:50`), character for character.
  4. "From Tau Ceti" (README lines 305–322) lists `TauCeti.primeCount`, `TauCeti.primePsi`, `TauCeti.primeIdealTheorem`, the progression theorem and `Rat.HeightOneSpectrum.absNorm_asIdeal`, with their files.
  5. 8.5 (lines 1983–1986) and 8.7 (lines 2106–2108 and 2114–2116) recover the qualitative theorems "as consistency theorems".
  - **Test.** The three restated theorems elaborate. My scratch proof (below) shows the `K = ℚ` carrier is the classical count.
- **No repair report** marks any finding "not actionable", so nothing is settled.

## Verified sound

### Gate, dependency check, elaboration, signatures

- **Gate.** My run of `gate … ZerosOfLFunctions --base origin/main` exits 0. Every check is 0 and it ends in `OK`:

  ```text
  gate ZerosOfLFunctions: set_option=0 blob=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's gate (`gate.md`) also has `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check.** It exits 0, with no UPWARD, CYCLE or `moved:` line:

  ```text
  depcheck: 236 roadmaps, 2263 edges, 0 problem(s)
  ```

  The suppliers are all on main: L-functions, Class Field Theory and Modular Forms under `TauCetiRoadmap/`; Arithmetic Dirichlet Series, Global Number Fields, Number Field Arithmetic, Chebotarev and Contour Integration under `Completed/`.
- **Elaboration.** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0 in 3.3 s. Its output is 17 "declaration uses `sorry`" warnings, at lines 98, 110, 124, 137, 155, 174, 185, 202, 215, 229, 247, 262, 278, 296, 310, 331 and 345, and nothing else. All 7 `TauCeti.*` imports have object files.
- **`#check @` comparison.**
  - A scratch copy appends `#check @name` for all 20 declarations and elaborates them in one run.
  - The file has no `variable` line, so no binder can be lost.
  - The three changed signatures agree in generality with README 8.5 and 8.7:
    - `primeIdealCount_effective` fixes `K`;
    - `rayClassPrimeCount_effective` fixes `n` before `c`, and `c` before `K`, `𝔪`, `a`;
    - `primeCounting_progression_effective` has `c` before `q`, `a`, and `[NeZero q]`, `IsUnit (a : ZMod q)` in its own signature.
  - The probe made no change to the file.
- **Carrier probe** (a scratch Lean file, exit 0, no `sorry`). It proves, for every `q a : ℕ` and `x : ℝ`, `TauCeti.primeCount ℚ {p | Ideal.absNorm p.asIdeal % q = a % q} x = #((Nat.primesBelow (⌊x⌋₊+1)).filter (· % q = a % q))`. The proof uses `TauCeti.primeCount_eq_card`, `Rat.HeightOneSpectrum.absNorm_asIdeal`, `Rat.HeightOneSpectrum.primesEquiv` and `Finset.card_bij`. This confirms the README 8.7 sentence (lines 2112–2114) that the count is `π(x; q, a)`. Two controls also hold:
  - `IsUnit (a : ZMod 1)` holds for every `a`, so `q = 1` is `π(x) = Li x + O(…)`;
  - `¬ IsUnit ((2 : ℕ) : ZMod 4)` holds by `decide`.

### Headline theorems and padding

- **Headlines.** The Summary (lines 11–15) names five end theorems. All five are stated:
  1. the de la Vallée Poussin region for Dedekind zeta and for ray-class L-functions: `heckeLFunction_zeroFreeRegion`, whose trivial character is 6.2;
  2. the uniform Riemann–von Mangoldt formula for both families: `riemannVonMangoldt_heckeLFunction`, whose trivial character is the Dedekind count;
  3. the effective prime ideal theorem: `primeIdealCount_effective`;
  4. the effective prime count in a ray class: `rayClassPrimeCount_effective`;
  5. the effective abelian Chebotarev count: `frobeniusPrimeCount_effective_abelian`.
- **The rest of the file.** The Summary also lists the truncated and Weil explicit formulas among what is built; they are stated at `K = ℚ` (`chebyshevPsi_explicitFormula`, `riemannZeta_weilExplicitFormula`), as the docstring says. Their classical `ℚ` instances, Hadamard at order ≤ 1, convexity and the two `ζ` lemmas of 5.6a and 6.4d are also stated.
- **What is not stated.** The module docstring names it and says why. The completed Dedekind and Hecke functions are absent at the pin: `completedDedekindZeta` and `completedHeckeLFunction` occur nowhere in Tau Ceti. The exceptional terms would be defined from a `sorry`'d witness.
- **One-tactic probe.** A scratch copy replaced every `sorry` by `first | (simp; done) | rfl | infer_instance | (norm_num; done) | exact?`. All 17 theorems fail: 13 with "`exact?` could not close the goal", and the 4 effective counts at the heartbeat limit. No declaration restates a definition, computes a value or mirrors a Check.

### Seeded sample of sources

| Target | Locator | What I checked | Result |
| --- | --- | --- | --- |
| 1.4 | DLMF 5.11.2 | dlmf5 lines 104 and 158–160 give `ψ(z) ∼ ln z − 1/(2z) − …` on `\|ph z\| ≤ π − δ`. Lines 563–569 bound the remainder by `sec^{2n+1}(½ ph z)` times the first neglected term, so the `O(1/‖s‖)` is uniform on `S_δ`. The two exact identities follow from `Gammaℝ s = π^{−s/2}Γ(s/2)` and `Gammaℂ s = 2(2π)^{−s}Γ(s)`. At a pole both `logDeriv` and `digamma` take the value `0` in Lean, so "off the poles" is needed. | supported |
| 1.5 | DLMF 5.11.9; L-functions Layer 0 | dlmf5 lines 488–492 give `\|Γ(x+iy)\| ∼ √(2π)\|y\|^{x−1/2}e^{−π\|y\|/2}` for fixed `x`. The uniformity in `σ ∈ [a,b]` comes from 5.11.1 (lines 104–108). `gammaFactor` is `∏ Gammaℝ(s+μ) ∏ Gammaℂ(s+ν)` and `degree = #gammaR + 2#gammaC` (`TauCeti/NumberTheory/LFunctions/Data/Basic.lean:106, 111`). The rate `πn/4`, `A(σ)` and the pole set were recomputed. | supported |
| 2.1 | conventions; Iwaniec–Kowalski (5.7) | IK is not readable (Not verifiable). The convention gives each `Gammaℂ(s+ν)` the two shifts `ν, ν+1`, which is `Γℂ = Γℝ(s)Γℝ(s+1)` and matches IK's all-`Γℝ` normalization. `1 ≤ analyticConductorAt` holds, and the three Checks were recomputed: `7/2`, `12`, `N`. | statement verified |
| 2.3 | Tau Ceti `NormalizationTranslation` | `TauCeti/NumberTheory/LFunctions/Data/Normalization.lean:124`, printed. It has `weight : ℤ`. `gammaR_eq` and `gammaC_eq` shift by `+weight/2`. `completed_eq` is `Λ_an(s) = N^{−w/4} Λ_ar(s + w/2)`. `ArithmeticLFunctionData` extends `AnalyticLFunctionData` (line 78). So `N^{−s/2}N^{−w/4} = N^{−(s+w/2)/2}` makes `continuedL analytic s = continuedL arithmetic (s + w/2)` exact, and the analytic shifts are the arithmetic ones plus `w/2`, as stated. | supported |
| 3.5 | DLMF 5.11.9, 1.5 | The same equation (dlmf5 lines 490–492). The gamma exponential `e^{−πn\|t\|/4}` dominates the polynomial wide-strip bound of 3.4. The Checks were recomputed (table). | supported |
| 4.1 | Mathlib | `MeromorphicOn.divisor_restrict` (`Mathlib/Analysis/Meromorphic/Divisor.lean:431`) and `LocallyFiniteSupport.finite_inter_support_of_isCompact` (`Mathlib/Topology/LocallyFinsupp.lean:108`). Restricted to the closed set `closure R ⊆ U`, the divisor has globally locally finite support, so the cited pair gives finiteness. | supported |
| 4.6 | Mathlib | `ValueDistribution.logCounting f 0 = (divisor f univ)⁺.logCounting` (`…/ValueDistribution/LogCounting/Basic.lean:351, 372`). `Function.locallyFinsuppWithin.logCounting D r = ∑ᶠ z, D_r z log(r/‖z‖) + D 0 log r` (line 97). `log_counting_zero_sub_logCounting_top` is at line 403. From these definitions, `n(r) log(R/r) ≤ N(R) − N(r)` for a nonnegative divisor. | supported |
| 5.2 | Mathlib; PrimeNumberTheoremAnd | The definition and its four laws were recomputed. `weierstrassFactor m z = (1 − z) exp(partialLogSum m z)`, at `127b50e` in `PrimeNumberTheoremAnd/Mathlib/Analysis/Complex/WeierstrassFactor.lean`, read from the open repository, with no `sorry`. | supported |
| 5.3 | Davenport §11 | Uncertified (Not verifiable). `Summable.multipliableLocallyUniformlyOn_one_add` (`Mathlib/Analysis/Normed/Module/MultipliableUniformlyOn.lean:137`: open `K`, a summable `u`, eventual `‖f i x‖ ≤ u i`, continuity) and `tprod_one_add_ne_zero_of_summable` (`Mathlib/Analysis/SpecialFunctions/Log/Summable.lean:214`) take exactly the inputs 5.1–5.2 supply. | route verified |
| 5.4 | Tau Ceti; Mathlib | `TauCeti.exists_differentiableOn_eqOn_exp_comp` (`TauCeti/Analysis/Complex/BranchLogRoot.lean:173`) takes `IsSimplyConnected U`, `IsOpen U`, `DifferentiableOn ℂ g U` and `0 ∉ g '' U`. At `U = univ` these come from `Convex.contractibleSpace`. | supported |
| 5.6a | route; PrimeNumberTheoremAnd | The comparison `‖ρ−2‖² ≤ 4 + (Im ρ)² ≤ 4(1+(Im ρ)²)` holds on `0 ≤ Re ρ ≤ 1`, in the right direction. `summable_riemannXi_divisorZeroIndex₀_norm_inv_sq` is at `127b50e` (`PrimeNumberTheoremAnd/Mathlib/NumberTheory/LSeries/RiemannZetaHadamard.lean`), with no `sorry`. | supported |
| 8.4 | Lang XVII §3, Theorem 3.1 | Uncertified. I re-derived the formula at `K = ℚ`: shift to `Re s = −1`, use `∫_{(−1)}F(s)ds = ∫_{(2)}F(1−u)du`, reflect `Λ'/Λ`, then use Mellin inversion `φ(y) = (2πi)⁻¹∫φ̃(s)y^{−s}ds`. The prime side is `−∑Λ(n)(φ(n)+φ̌(n))`, the archimedean term is `(2π)⁻¹∫(Γℝ'/Γℝ)(2+it)(φ̃(2+it)+φ̃(−1−it))dt`, and its constant part is `−(log π)φ(1)`. All three match `riemannZeta_weilExplicitFormula`. | route verified |
| 8.5 | Davenport §18; Tau Ceti | Davenport is uncertified. `primeCount`, `primeTheta` (`…/ArithmeticDirichletSeries/Counting.lean:630, 625`), `primePsi` (`Prime/Psi.lean:148`, base-selected, every `k ≥ 1`) and `primeIdealTheorem` (`Prime/PrimeIdealTheorem.lean:39`: `ψ ∼ x`, `ϑ ∼ x`, `π ∼ Li`) are as described. `primePsi K univ = ∑_{𝔑𝔞≤x}Λ_K` by `primePsi_eq_sum_range` and `normCoeff_vonMangoldt` (lines 515, 503). The `ψ→π` step is R02. | supported except R02 |
| 8.6 | Davenport §§19–20; Tau Ceti | Davenport is uncertified. `MultiplicativeIdealWeight.logDeriv_LSeries_eq_neg_tsum_vonMangoldtTransform` is right of the absolute-convergence abscissa, as stated. The trivial-zero orders `#{a_j = 0} + r₂` at `0` and `#{a_j ≡ m (2)} + r₂` at `−m` were recomputed from the poles of `Γℝ(s+a_j)` and `Γℂ(s)`. | supported |
| 8.7 | Davenport §20; Tau Ceti | Davenport is uncertified. `primeCount_primesCongruent_isEquivalent_logIntegral` (`PrimesCongruent.lean:50`) has the same set and hypotheses as the headline (probe above). `ZMod.isUnit_iff_coprime` is at `Mathlib/Data/ZMod/Basic.lean:813`. `natGenerator` and `primesEquiv` are at `Mathlib/NumberTheory/Padics/HeightOneSpectrum.lean:90, 109`. `absNorm_asIdeal` is at `TauCeti/NumberTheory/NumberField/Ideal/IntegersRat.lean:183`. The width `c₀ = min(c_n/(2n),1)/2` was re-derived from `(T+3)^n ≤ (2T)^n`. The `ψ→π` step is R02. | supported except R02 |

The README flags no locator as unverified. The 8.7 width Check `T² − qT − 3q ≥ 0` gives `log x = 0.69575, 2.49584, 190.86841` at `q = 1, 3, 10⁶`, as printed.

**Further locators re-read**, behind headline docstrings:
- **Kadiri.** kadiri2012 lines 65–73 (LMO (1.5)–(1.6), `R₄` independent of `K`) and lines 79–85 (Theorem 1.1).
- **Bennett–Martin–O'Bryant–Rechnitzer.** bennett2021 lines 56–58 (`0 < β < 1`, `|γ| ≤ T`), lines 83–84 (Corollary 1.2, `q > 1`, `T ≥ 5/7`) and lines 72–76 (the gap in Trudgian).
- **Hasanalizade–Shen–Wong.** hasanalizade2022 lines 26–27 and 63–65 (Corollary 1.2, `T ≥ 1`).

### Library declarations and cross-roadmap citations

- **Name check.** A scratch file ran `#check @name` on the 284 Lean-like names the README backticks before Provenance, against Mathlib and 75 Tau Ceti modules with object files. 185 resolve, including the new `TauCeti.primeCount`, `primeCount_eq_card`, `primePsi`, `primePsi_eq_sum_range`, `normCoeff_vonMangoldt`, `primeIdealTheorem`, `Rat.HeightOneSpectrum.absNorm_asIdeal`, `Rat.HeightOneSpectrum.primesEquiv` and `ZMod.isUnit_iff_coprime`. Of the 99 that fail:
  - 4 are prose tokens or file names (`E_p`, `S_0`, `Suggested.lean`, `LogDerivFTC.lean`), 5 are namespaces, and `polarOrder.support` is a field-dot expression;
  - 27 field or short names resolve when fully qualified, in a second run with 0 errors. Examples: `Complex.Gammaℝ_eq_zero_iff`, every `HasMeromorphicContinuation`, `HasDirichletAgreement`, `HasFunctionalEquation` and `NormalizationTranslation` field, `RayClassCharacter.eulerCorrection_one/_self`, `NumberField.artinSymbol`, `Rat.HeightOneSpectrum.natGenerator` and `TauCeti.Real.logIntegral_isEquivalent_div_log`;
  - 8 are in modules without object files, read in source at the pin: `analyticConductorAt` and `_eq`, `finiteEulerCorrection`, `perronFormula`, `primeCount_primesCongruent_isEquivalent_logIntegral` (cited both short and qualified), `tendsto_frobeniusPrimeCount`, `hasNaturalDensity_frobeniusPrimeSet`;
  - 52 are the L-functions names the README lists as not realized at the pin. All 52 occur in `TauCetiRoadmap/LFunctions/README.md` or its `Suggested.lean` on main;
  - `zeroCount` and `zetaEntireCompletion` are this file's own.
- **Section citations, all on main.**
  - Arithmetic Dirichlet Series §4.3 is "`primeTheta` and `primeCount`", §10.1 "`primePsi` with all prime powers present", and §5.2 the higher-prime-power estimate.
  - Chebotarev Layers 2, 11, 13 and 14 carry the Frobenius carriers.
  - The anchors of AsymptoticExpansions and SpecialFunctionsEiLiErfIncompleteGamma into §§1.2–1.3 resolve.
- **Overlaps.** I checked them with `roadmaps overlaps`:
  - no cited id is dropped by an open pull request;
  - no id is defined only by an open revision;
  - none of this pull request's ids is dropped elsewhere.

  The two citations of this roadmap elsewhere that don't resolve were already broken on main, not by this head: ComputationalNumberTheory cites §§4.9 and 7.2a, which main never had, and Chebotarev cites "layer 8.7" for the Frobenius effective count, which is 8.8 on main.
- **Ownership.**
  - **Effective counts, zero-free regions, Hadamard, 1.3a.** At the pins there is no effective prime count, zero-free region, Hadamard factorization or `‖Γ(s)‖ ≤ Γ(Re s)`. Mathlib has only `norm_Gamma_le_norm_Gamma_add_one`.
  - **Qualitative counts.** The qualitative ray-class prime count named in 8.7 as a consistency theorem is not at the pin: no `primeCount` asymptotic mentions `idealClass`.
  - **Closest open roadmaps.** ExplicitZetaBounds, ExplicitNumberFields and ExplicitPrimeCounting own explicit-constant refinements. They are open, later than this roadmap (on main), and cite it.
  - **Names.** Only #1907, the same roadmap, uses the namespace `TauCetiRoadmap.ZerosOfLFunctions`.
- **Provenance** (PrimeNumberTheoremAnd `127b50e`, open repository). `riemannXi_hadamard_factorization_no_monomial`, `logDeriv_riemannXi_eq_polynomial_derivative_add_tsum` and `summable_riemannXi_divisorZeroIndex₀_norm_inv_sq` have the shapes the table states, and the file has no `sorry`.

### Adversarial table

Values were computed this round:
- in pure Python: `log Γ` and digamma by shift plus Stirling series, `ζ` by Euler–Maclaurin and reflection, a sieve to `10⁶`, Simpson for `Li`;
- in Lean, for the probes named above.

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `OrderLE` (0.1) | `1/Γ` at `−n−½`; `exp(z²)` at `A = 1` | `log(Γ(n+3/2)/π)` grows as `n log n`, against `‖s‖^{A'}`; `exp(r²−r^{3/2}) → ∞` | sound | none |
| `zeroCount` (4.1) | `z(z−1)`, `z/(z−1)` on `closedBall 0 2`; `1/z`, `R = ∅ ⊆ {0}` | `2`; `1` against signed `0`; `0, 0` (and `0, 1` for `z`) | sound | none |
| `zetaEntireCompletion` (0.2) | `s = 0, 1, 2m` | `1, 1`; `2m(2m−1)π^{−m}(m−1)!ζ(2m)` | sound | none |
| 1.4 | `\|z\| = 100`, args `0, π/2, 3π/4` | `\|z\|·\|ψ(z) − log z\| = 0.50083, 0.50000, 0.49941` | sound | none |
| 1.4a | `s = 2`; `s = −2`; `ψ(i)` | `ζ'/ζ(2) + ζ'/ζ(−1) = 1.4150927` and right side `1.4150927 = γ + log 2π − 1`; junk `−0.16482` against `0.55412`; `Im ψ(i) = 2.0766740` against `½ + (π/2)coth π = 2.0766740` | sound | none |
| 1.5 | `gammaR = {0}`, `σ = ½, 2`, `t = 10, 100, 1000` | remainder `0.806357, 0.806046, 0.806043` (limit `0.806043`); `−0.5723649` three times | sound | none |
| 2.1 | `ζ` at `½`; `gammaC = {0}` at `0`; no gamma factor | `7/2`; `3·4 = 12`; `N` | sound | none |
| 2.3 | weight `w = k−1`, `gammaC = {0}` | analytic shift `(k−1)/2`; `N^{−s/2}N^{−w/4} = N^{−(s+w/2)/2}` | sound | none |
| 2.4 | `Δ`, `k = 12`, `N = 1`, `s = ½` | `(6+3)(7+3) = 90 = analyticConductorAt f 6`; `3.5·4.5 = 15.75` at the same numerical point | sound | none |
| 3.1 Check | `R = 0`, `c = α = 1` | `E₁(1) = 0.21938 < e^{−1} = 0.36788 < Γ(1) = 1` | sound | none |
| 3.4 | exponent at `σ = −δ, ½, 1+δ` | `½+δ`, `¼+δ/2`, `0` | sound | none |
| 3.5 Check | `‖Λ(2m+2i)‖`, `m = 10, 20` | `3.676797`, `13519751.806` | sound | none |
| 4.6 Checks | `z²(z−3)`, `(r,R) = (2,4), (3,5)` | `1.38629 ≤ 1.67398`; `1.53248 = 1.53248` | sound | none |
| 5.2 | `z = −½`; `z = 1` | `‖E₁ − 1‖ = 0.090204`; `E₁'(1) = −e` | sound | none |
| `dirichletLFunction_convexity` | `q = 1`, `t = 0, 100` | `\|ζ(½)\| = 1.460355`; `\|ζ(½+100i)\| = 2.692697` against `103^{1/4} = 3.185733` | sound | none |
| `hadamard_of_orderLE_one` / `zetaEntireCompletion_hadamard` | `b` for `zetaEntireCompletion`; `1 − s` | `b = −γ/2 − 1 + ½ log 4π = −0.0230957`; `1 − s = e^{−s}E₁(s)` | sound | none |
| `riemannZeta_zeros_summable_ordinate` (5.6a) | first pair; `1/Γ(s+½)` | `2/(1+14.134725²) = 0.0099606`; every summand `1`, which needs confinement | sound | none |
| `heckeLFunction_zeroFreeRegion` (6.4) | `n = 0`; nesting factor; 6.4b at `(2)` | vacuous; `1 + log(4/3)/log 3 = 1.26186 < 1.27`; `(log 2)/3 = 0.231049` | sound | none |
| `riemannZeta_zeroFreeRegion` | `s = −2` | in the region only if `c ≥ 3 log 3` | sound | none |
| `dirichletLFunction_zeroFreeRegion` | principal mod `2`, zero at `0` | `c ≤ log 3/2` puts the region in `Re s ≥ ½` | sound | none |
| `neg_re_logDeriv_riemannZeta_le` | `\|t\| ≥ t₀ > 1` makes `β + it` nontrivial | `1 + δ − β > δ > 0`; for `δ ≥ 1` the left side is `≤ \|ζ'/ζ(2)\| = 0.569961` | sound | none |
| `riemannVonMangoldt` | `T = 14, 100` | `N = 0` against `−0.44300`; `29` against `28.12734` | sound | none |
| `riemannVonMangoldt_dirichlet` | `q = 4, T = 10`; `q = 1, T = 100` | `2` against `2.70882`; `58` against `56.25469` | sound | none |
| `riemannVonMangoldt_heckeLFunction` | `ℚ`, `ψ = 1`, `T = 100` | open-strip count `58` against `56.25469`; error scale `log 100 = 4.605` | sound | none |
| 7.3 Check | `S(T)` along `2 → 2+iT → ½+iT` | `−0.641885, −0.915337, −0.982907` at `T = 0.5, 0.1, 0.02` (→ `−1`) | sound | none |
| `chebyshevPsi_explicitFormula` | `x = 100`, `T = 50` (10 zero pairs) | `ψ(100) = 94.04531` against `95.04034` (error scale `42.415`); with `+log 2π`, `98.71609` | sound | none |
| `riemannZeta_weilExplicitFormula` | constant of `A(φ)` | `−(log π/2)(φ(1)+φ̌(1)) = −(log π)φ(1)` | sound | none |
| `primeIdealCount_effective` (8.5) | `ℚ(i)`, `x = 10⁶` | `2·39175 + 87 + 1 = 78438` against `Li(10⁶) = 78626.5` | sound | none |
| `rayClassPrimeCount_effective` (8.7) | `n = 0`; `ℚ(√−5)`, `𝔪 = 1`, `x = 10⁶` | vacuous; principal `39114`, nonprincipal `39253` against `39313.3` | sound | none |
| `primeCounting_progression_effective` | `q = 8`, `x = 10⁶`; `q = 1`; `a = 2`, `q = 4` | `19552, 19653, 19623, 19669` against `19656.6`; `IsUnit` automatic (Lean); `¬IsUnit` (Lean), count `1` against `Li x/2` | sound | none |
| 8.7 Checks (new) | `𝔪 = (4)∞`, class of `3`, `x = 9`; `q = 4`, `x = 20` | prime powers in the class: `3, 7`, so `log 21 = 3.044522`; base-selected `log 63 = 4.143135`; count `4` (`3, 7, 11, 19`) against `Li 20/2 = 4.430068` | sound | none |
| `frobeniusPrimeCount_effective_abelian` | `ℚ(i)/ℚ`, both classes | `39175`, `39322` against `39313.3` | sound | none |
| 8.5 / 8.7 route | `K = ℚ`, `x = 10⁶` | `Π = 78597.11` against `π = 78498`; `ψ − ϑ = 1102.42 ≤ 137682` | route gap | R02 |
| 8.9 Checks | `x = 10, 10⁴` | `Li 10 = 5.12044`; `Li − x/log x = 0.77749` against `1.88612`, and `159.3558` against `117.8823` | sound | none |
| R01 | #1907 at `123254c` | 4 declarations only there, 2 only here | order unstated | R01 |

### Remarks outside the folder (no change asked of the folder)

- **The board's `sources.toml`.** It still records `trudgian2015` with venue "no. 294, pp. 2047–2058". bennett2021 lines 1149–1150 and hasanalizade2022 line 786 give no. 293, 1439–1450, as the README has it.

## Not verifiable

- **Iwaniec–Kowalski, *Analytic Number Theory*, §5.1 (5.7) and §5.2** (2.1's convention, 3.3, and the `dirichletLFunction_convexity` docstring). AMS, paywalled; not in the manifest or the sources cache. The normalization and the exponents were recomputed instead.
- **Titchmarsh, *The Theory of the Riemann Zeta-Function*, §5.1, §§9.2–9.4, Theorem 9.4, p. 214** (3.3, 4.5, 7.3, 7.4, 7.6). OUP, paywalled; not in the manifest. `N(100) = 29` and `S(T) → −1` were recomputed instead.
- **Davenport, *Multiplicative Number Theory*, §§11–20** (5.3, 5.5, 8.5–8.7). Settled as uncertified; cited by locator.
- **Lang, *Algebraic Number Theory*, XVII §3, Theorem 3.1** (8.4). Settled as uncertified. I re-derived the formula at `K = ℚ` instead.
- **Lagarias–Montgomery–Odlyzko 1979, Lemma 2.3** (6.4). Settled as uncertified; only its report in kadiri2012 lines 65–73 was read.
- **Lagarias–Odlyzko 1977, Theorems 1.3 and 9.2** (a remark in 8.8, for a statement not owned here). Academic Press, paywalled; not in the manifest.
- **DLMF 5.5.3 and 5.6.6** (0.1, 1.3a, 1.6). The cached DLMF text is §5.11 only. I recomputed the reflection values and the bound `‖Γ(s)‖ ≤ Γ(Re s)` from Euler's integral.

## Source issues

- **Misprint** in kadiri2012 at §1, display (1.6), p. 2 (arXiv v1): the source says LMO show `L(s,χ,K)` has no zeros in region (1.6), which near the real axis lies inside region (1.5), where one zero is allowed; it should be no zeros in (1.6) apart from the possible real zero of (1.5); affects nothing.
- **Gap** in trudgian2015 at the proofs of Theorems 1 and 2, pp. 1–12 (arXiv v4): the source treats one of the inequalities its auxiliary parameters must satisfy as redundant, which bennett2021 lines 72–76 show it is not; it should verify that inequality, so the stated constants are unproven; affects a stated result; corrected in print at bennett2021 Corollary 1.2 (Theorem 1) and hasanalizade2022 Corollary 1.2 (Theorem 2).
