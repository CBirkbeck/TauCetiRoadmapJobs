# Review of ZerosOfLFunctions (pull request #1913 at c4cb18f)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ZerosOfLFunctions/` at `c4cb18f`, the head the previous review read. Nothing in the folder changed. The pull request's title and description did change. There are two findings, both P3, and no blocking finding:

- R01 carries the part of the previous R01 that is still open.
- R02 is new: three effective-count headlines restate a prime-counting carrier that Tau Ceti already has.

Summary of the checks:
- **Gate.** It passes.
- **Dependency check.** It reports 0 problems.
- **Elaboration.** `Suggested.lean` elaborates with `sorry` as its only warning.
- **Adversarial pass.** It found no false, vacuous or mis-scoped statement among the 3 definitions, the 17 theorems and the 15 sampled targets (table below).

Paths: `TauCeti/…` is a file of the Tau Ceti pin `2fd255d9`, and `Mathlib/…` a file of the Mathlib pin `1b1ccf4b`. Other roadmaps are read on main (`1bea835`) unless a pull request is named.

## R01 (P3) — No stated order against #1907, the other open pull request on this roadmap (previous R01, partly repaired)

**Location.** The pull request's description, which is outside the folder. It names no other pull request; its merge-order line reads "no pending supplier".

**Claim.** Two open pull requests change `TauCetiRoadmap/ZerosOfLFunctions/`. One of them has to be rebased on the other, and the description has to say which.

**Witness.** `roadmaps overlaps ZerosOfLFunctions` reports "#1907 and #1913 conflict" in both files. #1907's `Suggested.lean` (head `123254c`):
- declares `completed_orderLE_one`, `gammaLogDerivBound`, `finite_zero_sum_le_logDeriv`, `dedekindZeta_zeroFreeRegion`, `riemannVonMangoldt_dedekindZeta`, absent here;
- lacks `riemannZeta_zeros_summable_ordinate` and `neg_re_logDeriv_riemannZeta_le`.

**Repair.** Add one sentence to the description saying which of #1913 and #1907 is rebased on the other. The rebased one then reconciles the declarations listed above.

**Test.** After the rebase, `roadmaps overlaps ZerosOfLFunctions` reports no conflict between the two heads.

## R02 (P3) — The effective counts restate Tau Ceti's prime-counting carrier instead of citing it

**Location.**
- `Suggested.lean`:
  - `primeIdealCount_effective` (lines 293–298) uses `Set.ncard {P : HeightOneSpectrum (𝓞 K) | absNorm P ≤ x}`;
  - `rayClassPrimeCount_effective` (lines 309–319) uses the same carrier;
  - `primeCounting_progression_effective` (lines 327–331) uses `(Nat.primesBelow (⌊x⌋₊ + 1)).filter (· ≡ a [MOD q])`.
- README 8.5 (lines 1948–1950) and 8.7 (lines 2059–2064), and the supplier contracts "From Tau Ceti" (lines 217–324).

**Claim.** At the pin, Tau Ceti already has:
- the count of the primes of a set `S` of norm at most `x`;
- the Chebyshev function `ψ_K` over `S`;
- the qualitative prime ideal theorem and its arithmetic-progression form.

The effective headlines strengthen those theorems, but they are stated on hand-written carriers, and the README never names the library objects. Its grep for `primeCount`, `primePsi` and `primeIdealTheorem` finds nothing. By contrast, 8.8 is stated on the library's `frobeniusPrimeCount` and recovers `tendsto_frobeniusPrimeCount` as a consistency theorem.

**Witness.**
- `TauCeti.primeCount K S x` and `TauCeti.primePsi K S x`: `TauCeti/NumberTheory/ArithmeticDirichletSeries/Counting.lean:630` and `Prime/Psi.lean:148`.
- `TauCeti.primeIdealTheorem`: `Prime/PrimeIdealTheorem.lean:39`, stating `primeCount K Set.univ ~[atTop] logIntegral`.
- `NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral`: `Chebotarev/PrimeCounting/PrimesCongruent.lean:50`.

**Repair.**
1. State `primeIdealCount_effective` on `TauCeti.primeCount K Set.univ x - TauCeti.Real.logIntegral x`.
2. State `rayClassPrimeCount_effective` on `TauCeti.primeCount K {P | ∃ h : P.asIdeal ∈ integralIdealsPrimeTo 𝔪, idealClass 𝔪 ⟨P.asIdeal, h⟩ = a} x`.
3. State `primeCounting_progression_effective` on `TauCeti.primeCount ℚ {p | Ideal.absNorm p.asIdeal % q = a % q} x`, with `[NeZero q]` and `IsUnit (a : ZMod q)`. These are the carrier and hypotheses of the qualitative theorem. Alternatively, keep the `ℕ` carrier and state the bridge in 8.7.
4. List `TauCeti.primeCount`, `TauCeti.primePsi`, `TauCeti.primeIdealTheorem` and `NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral`, with their files, under "From Tau Ceti".
5. In 8.5 and 8.7, add one sentence each recovering the qualitative theorem by discarding the error through `Li x ∼ x/log x`, as 8.8 already does.

**Test.**
- In a scratch copy of `Suggested.lean`, the three restated theorems elaborate against the pins.
- In the same copy, a proof (`primeCount_eq_card`, `Set.ncard_coe_finset`, `simp [normLE]`) shows `TauCeti.primeCount K Set.univ x = Set.ncard {P | (absNorm P.asIdeal : ℝ) ≤ x}` for every `x`. So the mathematics of the headlines does not change.

## Previous findings

- **R01 of round 26 — partly repaired.**
  - Repaired: the title is now "growth, conductor, zero-free-region and explicit-formula layers revised, with the exceptional-zero alternative kept". The description says that the nonexistence of Landau–Siegel zeros and Siegel's theorem are outside the roadmap, and that AnalyticNumberTheoryPartI consumes Layers 0–8. The merge-order sentence now reads "no pending supplier", so the reliance on an open problem and on AnalyticNumberTheoryPartI is gone.
  - Not repaired: the order against #1907 is still unstated (R01 above).
- **No repair report** marks any finding "not actionable", so nothing is settled.

## Verified sound

### Gate, dependency check, elaboration, signatures

- **Gate.** My run of `gate … ZerosOfLFunctions --base origin/main` prints every check at 0 and `OK`, with exit 0:

  ```text
  gate ZerosOfLFunctions: set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
  ```

  `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check.** It exits 0, with no UPWARD, CYCLE or `moved:` line:

  ```text
  depcheck: 236 roadmaps, 2263 edges, 0 problem(s)
  ```

  Every supplier is on main: L-functions, Class Field Theory and Modular Forms under `TauCetiRoadmap/`; Arithmetic Dirichlet Series, Global Number Fields, Number Field Arithmetic, Chebotarev and Contour Integration under `Completed/`.
- **Elaboration.** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0 in 8.5 s. Its output is 17 "declaration uses `sorry`" warnings, at lines 97, 109, 123, 136, 154, 173, 184, 201, 214, 228, 246, 261, 277, 293, 309, 327 and 340, and nothing else.
- **`#check @` comparison.**
  - A scratch copy with `#check @name` for all 20 declarations elaborates once with 0 errors.
  - The file has no `variable` line, so no binder can be lost. Every hypothesis is in the declaration's own signature (`[IsAbelianGalois K L]`, `[NeZero q]`, `χ.IsPrimitive`, `Module.finrank ℚ K = n`).
  - The elaborated types agree in generality with README 3.4, 5.5, 5.6a, 6.2–6.4, 6.4d, 7.4–7.5, 8.3–8.5, 8.7 and 8.8. In particular, 6.4, 7.5 and 8.7 fix the degree before `K`, and 8.5 and 8.8 fix the field or extension.
  - The probe made no change to the file.
- **Parsing and definition probes** (scratch file, exit 0):
  - `φ (n : ℝ)⁻¹ / n = φ ((n : ℝ)⁻¹) / (n : ℂ)` holds by `rfl`, so the Weil formula's prime side is `φ(1/n)/n`.
  - `ContDiff ℝ (↑⊤) φ` elaborates as `∞`, not `ω`.
  - `zetaEntireCompletion 0 = zetaEntireCompletion 1 = 1`.
  - `zetaEntireCompletion s = s (s − 1) completedRiemannZeta s` for `s ≠ 0, 1` (`completedRiemannZeta_eq`, `field_simp`).
  - `Differentiable ℂ zetaEntireCompletion` (`differentiable_completedZeta₀`).

### Headline theorems and padding

- **Headlines.** The README Summary (lines 11–15) names five end theorems. All five are stated:
  1. `heckeLFunction_zeroFreeRegion`;
  2. `riemannVonMangoldt_heckeLFunction`;
  3. `primeIdealCount_effective`;
  4. `rayClassPrimeCount_effective`;
  5. `frobeniusPrimeCount_effective_abelian`.

  With them come their `ℚ` instances, Hadamard at order ≤ 1, and the `ζ` lemmas of 5.6a and 6.4d. The module docstring names what is not statable and why: the completed Dedekind and Hecke functions are absent at the pin (I confirmed `completedDedekindZeta` and `completedHeckeLFunction` are absent), and the exceptional terms would be defined from a `sorry`'d witness.
- **One-tactic probe.** A scratch copy replaced every `sorry` by `first | (simp; done) | rfl | infer_instance | (norm_num; done) | (aesop; done) | exact?`. All 17 theorems fail: 13 with "`exact?` could not close the goal" and the 4 effective counts with heartbeat timeouts. No declaration restates a definition, computes a value or mirrors a Check.

### Seeded sample of sources

| Target | Locator | What I checked | Result |
| --- | --- | --- | --- |
| 1.3 | DLMF 5.11.9 with 5.11.1 | dlmf5 lines 488–492 give `|Γ(x+iy)| ∼ √(2π)|y|^{x−1/2}e^{−π|y|/2}`. Lines 104–108 give 5.11.1 on `|ph z| ≤ π−δ`, and lines 563–569 the remainder bound. These supply the uniformity in `σ ∈ [a,b]` and the `O(1/|t|)`; the true error is `O(1/t²)` (table). | supported |
| 1.4 | DLMF 5.11.2 | dlmf5 lines 156–160 (`ψ(z) ∼ ln z − 1/(2z) − …`, same sector) and lines 566–569 (remainder times `sec^{2n+1}(½ ph z)`). The two exact identities were recomputed at `2+3i`. | supported |
| 1.5 | DLMF 5.11.9; L-functions Layer 0 | `AnalyticLFunctionData.degree = #gammaR + 2#gammaC` and `gammaFactor` (`TauCeti/NumberTheory/LFunctions/Data/Basic.lean:106, 111`). The rate `πn/4` and `A(σ)` were recomputed. | supported |
| 2.2 | none (2.1) | Constants recomputed. The lower bound uses `max(3, |t|+3−M) ≥ (3/(M+3))(|t|+3)`. | verified |
| 2.4 | Tau Ceti | `HeckeRing.GL2.Newform.analyticConductorAt` (`TauCeti/NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean:125`) and `analyticConductorAt_eq`, `N(‖s‖+3)(‖s+1‖+3)` (line 133). | supported |
| 3.3 | Iwaniec–Kowalski §5.2; Titchmarsh §5.1 | Not legally readable (Not verifiable). The gamma-quotient exponent `(n/2)(1+2δ)` was recomputed (table). | mathematics verified |
| 3.4 | none at the claim | The strip bound has no locator of its own. It is assembled from 3.2 (Mathlib `PhragmenLindelof.vertical_strip`) and 3.3, as 6.4 and 8.3 are assembled. I recomputed the exponent `(½+δ)(1+δ−σ)/(1+2δ)`: `½+δ`, `¼+δ/2` and `0` at `σ = −δ, ½, 1+δ`. | mathematics verified |
| 5.3 | Davenport §11 | Uncertified (Not verifiable). The route lemmas `Summable.multipliableLocallyUniformlyOn_one_add`, `tprod_one_add_ne_zero_of_summable` and `TendstoLocallyUniformlyOn.differentiableOn` resolve at the Mathlib pin. | route verified |
| 5.4 | Tau Ceti; Mathlib | `TauCeti.exists_differentiableOn_eqOn_exp_comp` (`TauCeti/Analysis/Complex/BranchLogRoot.lean:173`): `IsSimplyConnected U`, `IsOpen U`, `0 ∉ g '' U`. `is_const_of_deriv_eq_zero` and `Complex.exp_eq_exp_iff_exists_int` resolve. | supported |
| 5.5 | Davenport §§11–12 | Uncertified. PrimeNumberTheoremAnd at `127b50e` states `Complex.Hadamard.hadamard_factorization_of_order` with `EntireOfOrderAtMost ρ f := Differentiable ℂ f ∧ ∀ ε > 0, ∃ C > 0, ‖f z‖ ≤ exp(C(1+‖z‖)^{ρ+ε})`, with no `sorry` in the file. That agrees with `OrderLE _ ρ` for `ρ ≥ 0`, as Provenance says. | route verified |
| 6.2 | Kadiri, Theorem 1.1 | kadiri2012 lines 79–85: for `d_K` large, no zero in (1.7) for `|Im s| ≥ 1`, and at most one, real and simple, in (1.8) for `|Im s| ≤ 1`. Lines 65–73 give LMO's (1.5)–(1.6), with `R₄` independent of `K`. | supported |
| 6.5 | L-functions Layers 3, 5, 7 | On main, in L-functions `Suggested.lean`: `heckeLFunction_ne_zero_of_one_le_re` (line 2680, `χ.character ≠ 1`), `meromorphicOrderAt_dedekindZetaC_one_add` (line 2688, `t ≠ 0`, order `0`), `meromorphicOrderAt_dedekindZetaC_one` (line 977, order `−1`) and `completedHeckeLFunction_one_sub_eventuallyEq` (line 1670, every `χ`). | supported |
| 7.2 | Tau Ceti | `argumentPrinciple_nullHomologous` (`TauCeti/Analysis/Contour/Argument/Cycle.lean:110`) has hypotheses: `U` open; analytic and nonzero on `U \ S`; meromorphic of order `ord` on `S`; piecewise `C¹`, closed, avoiding `S`, null-homologous. Its conclusion is `2πi ∑ windingNumber · ord`. `residue_logDeriv_eq_meromorphicOrderAt` is at `Residue/LogDeriv.lean:63`. | supported |
| 7.3 | Tau Ceti; Titchmarsh §9.3 | `exists_continuousOn_arg_lift_with_partition` (`Argument/Lift.lean:427`); `windingNumber_eq_integral_of_avoidance` (`Winding/Number/Basic.lean:170`); `integral_inv_sub_mul_deriv_eq_log_norm_add_I_mul_sum_log_im` (`Winding/SegmentSum.lean:154`); `windingNumber_comp_eq_integral_logDeriv` (`LogDerivFTC.lean:227`). The three-step chain composes as written. Titchmarsh is Not verifiable; `S(T) → −1` was recomputed. | supported |
| 8.4 | Lang XVII §3, Theorem 3.1 | Uncertified. I re-derived the formula at `K = ℚ` from the shift to `Re s = −1`, the reflection `Λ'/Λ(s) = −Λ'/Λ(1−s)` and Mellin inversion; it matches `riemannZeta_weilExplicitFormula` term by term (table). The general `K` adds `(log|d_K|)φ(1)` from `½ log|d_K|` against `φ(1) + φ̌(1)`. | route verified |

The README flags no locator as unverified.

**Further locators re-read** (these sit behind headline docstrings):
- **Bennett–Martin–O'Bryant–Rechnitzer.** bennett2021 lines 56–58 (`N(T,χ)` over `0 < β < 1`, `|γ| ≤ T`), lines 83–84 (Corollary 1.2: `q > 1`, `T ≥ 5/7`) and lines 73–76 (the gap in Trudgian).
- **Hasanalizade–Shen–Wong.** hasanalizade2022 lines 26–27 (`N_K(T)`, open strip) and lines 63–65 (Corollary 1.2, `T ≥ 1`).
- **Trudgian.** trudgian2015 lines 19–27 (Theorems 1–2). The README's "Math. Comp. 84 (2015), 1439–1450" is confirmed by bennett2021 lines 1149–1150.

### Library declarations and cross-roadmap citations

- **Name check.** A scratch command resolved the 309 Lean-like names the README backticks before Provenance against Mathlib plus 34 imported Tau Ceti modules.
  - 231 resolve.
  - 16 of the remaining 78 are not declarations: prose tokens (`E_p`, `S_0`, `d_K`, `c_n`, `n_p`, `d.dual`, `polarOrder.support`), file names and namespaces.
  - 10 (7 declarations, some cited both short and qualified) are in Tau Ceti modules without object files; I found them in the source at the pin:
    - `analyticConductorAt` and `_eq` (`AnalyticInvariants.lean:125, 133`);
    - `finiteEulerCorrection` (`DedekindZeta/PartialZeta.lean:198`);
    - `tendsto_frobeniusPrimeCount` and `hasNaturalDensity_frobeniusPrimeSet` (`Chebotarev/PrimeCounting/FrobeniusPrimeCount.lean:91, 108`);
    - `perronFormula` (`Perron/Ideal.lean:161`);
    - `rayClassIdealMainTerm_eq` (`NumberField/Global/RayClass/MainTerm.lean:62`).
  - The other 52 are the L-functions names that the README lists as not realized at the pin, and all of them occur in the L-functions README or `Suggested.lean` on main. Examples: `heckeMellinTotal` (its `Suggested.lean`, 12 occurrences), `completedDedekindZeta_one_sub`, `heckeRootNumber`, `partialZeta_eq_sum_heckeLFunctionC`, `three_four_one_nonneg`.
- **Opened at the pin.**
  - `heckeLFunctionC := meromorphicContinuation 1 (LSeries …)` (`TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:74`). The continuation is `MeromorphicNFOn … univ` or `0` (`Analysis/Meromorphic/Continuation.lean:72`).
  - `threeFourOneCombination_nonneg` for `‖z‖ ≤ 1` (`LSeries/ThreeFourOne.lean:107`).
  - `hasSum_idealTerm_vonMangoldt` on `1 < Re s` (`ArithmeticDirichletSeries/Prime/DedekindZeta.lean:69`).
  - `eulerCorrection_one` (`LFunctions/Hecke/Primitive.lean:278`).
  - `rayClassArtinMap` (`ClassFieldTheory/Global/AdmissibleModulus/Reciprocity.lean:128`, `K L : Type` at line 119) and `rayClassArtinMap_idealClass` (line 216); `isAdmissibleModulus_abelianConductor` (`AdmissibleModulus/Basic.lean:208`).
  - `frobeniusPrimeCount` (`Chebotarev/PrimeCounting/VonMangoldt.lean:177`).
  - `AnalyticLFunctionData` and its three predicates (`Data/Basic.lean:82–197`) and `HasFunctionalEquation.eventuallyEq` (line 269).
- **Provenance** (PrimeNumberTheoremAnd at `127b50e`, read from the open repository).
  - `StrongPNT` states `(ψ − id) =O x exp(−c (log x)^{1/2})`.
  - `ZeroInequality` covers `|t| ≥ 2`.
  - `ShiftTwoBound` and `ShiftOneBound` are the two 6.4d inputs.
  - `summable_norm_inv_pow_divisorZeroIndex₀` is in the namespace `EntireOfOrderAtMost`.

  None of these has `sorry` in the part I read. Rows 5.3, 5.5, 6.2, 6.4d and 8.5 agree with their declarations.
- **Consumers on main.** Their anchors resolve to this head's headings: AsymptoticExpansions §§1.2–1.3 (`#12-stirling-on-the-sector`, `#13-vertical-strips`) and SpecialFunctionsEiLiErfIncompleteGamma §1.2.
- **Duplication and ownership.**
  - **At the pins.** Grep of the pinned Mathlib and Tau Ceti finds no Weierstrass factor, canonical product, Hadamard factorization (`Mathlib/Analysis/Complex/Hadamard.lean` is the three-lines theorem), holomorphic `log Γ` (`BohrMollerup` is real), zero-free region, zero count, Riemann–von Mangoldt formula or explicit formula.
  - **The qualitative prime counts.** Tau Ceti's `primeIdealTheorem` and `primeCount_primesCongruent_isEquivalent_logIntegral` are qualitative, so 8.5 and 8.7 duplicate no theorem. Only the carrier is restated (R02).
  - **8.9 and SpecialFunctionsEiLiErfIncompleteGamma.** That roadmap, on main, derives the expansion of `li` from DLMF 6.12.2 in its §8.4 (`expIntegralEi_isBigO`) and §8.2 (`logIntegral_eq_principalLogIntegral_sub`), which contains 8.9's two-term case. This roadmap is the owner of 8.9 because that roadmap consumes this one's §§1.2–1.3. A citation in the other direction would close a cycle, and 8.9 was already on main before this pull request.
  - **Open pull requests.** I checked them with `roadmaps overlaps`:
    - no id this README cites is dropped by an open pull request;
    - no id is defined only by an open revision;
    - none of this pull request's ids is dropped elsewhere;
    - the only other pull request on this roadmap is #1907 (R01).

    The closest-vocabulary roadmaps (ExplicitZetaBounds, ExplicitNumberFields, AnalyticNumberTheoryPartIII, ExplicitPrimeCounting) are open and later, and must cite this roadmap, which is on main.
  - **Names.** No other roadmap's `Suggested.lean` uses the namespace `TauCetiRoadmap.ZerosOfLFunctions`.

### Adversarial table

Values were computed this round:
- in pure Python: complex `log Γ` and digamma by shift plus Stirling series, `ζ` by Euler–Maclaurin, a sieve to `10⁶`, and `li(10⁶) − li(2) = 78626.504`;
- in Lean, for the probes named above.

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `OrderLE` (0.1) | `exp(z²)` at `A = 1`; `1/Γ`; constant `1` at `A = −1` | `exp(r²)/exp(r^{3/2})` at `r = 10`: `e^{68.4}`. `log‖1/Γ(−n−½)‖ = 15.147, 364.901` at `n = 10, 100` against `n log n = 23.0, 460.5`, so not of exponential type. `exp(‖s‖^{A'}) ≥ 1`. | sound | none |
| `zeroCount` (4.1) | `z(z−1)`, `z/(z−1)` on `closedBall 0 2`; `f = 0` | `2`; `1` (signed count `0`); `0` | sound | none |
| `zetaEntireCompletion` (0.2) | `s = 0, 1`; `s ∉ {0,1}`; entirety | Lean: `1`, `1`; `= s(s−1)Λ(s)`; `Differentiable` | sound | none |
| `dirichletLFunction_convexity` | `q = 1`, `t = 0, 100` | `‖ζ(½)‖ = 1.46035`; `‖ζ(½+100i)‖ = 2.69270` against `103^{1/4} = 3.18573` | sound | none |
| `hadamard_of_orderLE_one` | `1 − s` at `½`; `cos` at `1`; `f = exp` | `e^{−½}E₁(½) = 0.5`; `∏_{k<2·10⁵}(1−1/((k+½)²π²)) = 0.5403026` against `cos 1 = 0.5403023`; empty product with `b = 1` | sound | none |
| `zetaEntireCompletion_hadamard` | `B` | `−γ/2 − 1 + ½ log 4π = −0.0230957` | sound | none |
| `riemannZeta_zeros_summable_ordinate` | first zeros; trivial zero `−2` | first pair `0.0099606`, ten pairs `0.0270163`; `ord Λ(−2) = 0` (over `riemannZeta` each trivial zero would add `1`) | sound | none |
| `heckeLFunction_zeroFreeRegion` | `n = 0`; `ℚ(i)`, `ψ = 1`, zero `½ + 6.0209i`; nesting | vacuous (`finrank ≥ 1`); `log(4·9.0209²) = 5.785`, so the zero is outside the region iff `c < 2.893`; `1 + log(4/3)/log 3 = 1.2619 < 1.27` | sound | none |
| `riemannZeta_zeroFreeRegion` | `s = −2`; `½ + 14.1347i` | excluded iff `c < 3 log 3 = 3.2958`; iff `c < ½ log 17.135 = 1.4206` | sound | none |
| `dirichletLFunction_zeroFreeRegion` | `q = 2` principal (zeros of `1 − 2^{−s}` on `Re s = 0`) | region edge `1 − (½ log 3)/log 6 = 0.6934 > 0` | sound | none |
| `neg_re_logDeriv_riemannZeta_le` | `t = 14.1347`, `δ = 0.05, 0.2, 1, 3`; `t → 0`, `δ = 2|t|` | second clause `−1.44488 ≤ −1.81818 + 2.64863·C` needs `C ≥ 0.141` (`0.121` at `δ = 1`); first clause `0.52334` needs `C ≥ 0.198`; `4t·LHS = 0.97706, 0.99769`, while `log t < 0` | sound; threshold needed | none |
| `riemannVonMangoldt` | `T = 14, 100` | `0` against `−0.4430`; `29` against `28.1273` | sound | none |
| `riemannVonMangoldt_heckeLFunction` | `ℚ(i)`, `ψ = 1`, `T = 10` | open-strip count `2` (`±6.0209`) against main term `1.0049`, error scale `log 400 = 5.99` | sound | none |
| `riemannVonMangoldt_dirichlet` | `q = 4`, `T = 10`; `q = 1`, `T = 100` | `2` against `2.7088`; `58` against `56.2547` | sound | none |
| `chebyshevPsi_explicitFormula` | `x = 100`, `T = 50` (10 zero pairs); sign of `log 2π` | `ψ(100) = 94.04531` against `95.04034` (error `−0.995`, scale `42.415`); with `+log 2π`, `98.716` | sound | none |
| `riemannZeta_weilExplicitFormula` | reflection; constant; parse | `J₋ = −(2πi)⁻¹∫_{(2)}Λ'/Λ(u)φ̃(1−u)du`; `mellin(φ(1/y)/y) = φ̃(1−s)`; `−(log π/2)(φ(1)+φ̌(1)) = −(log π)φ(1)`; `rfl` parse probe | sound | none |
| `primeIdealCount_effective` | `ℚ(i)`, `x = 10⁶` | `2·39175 + 87 + 1 = 78438` against `78626.504` | sound | R02 (carrier) |
| `rayClassPrimeCount_effective` | `n = 0`; `ℚ(√−5)`, `𝔪 = 1` | vacuous; `39114`, `39253` against `39313.252` | sound | R02 |
| `primeCounting_progression_effective` | `q = 8`, `x = 10⁶` | `19552, 19653, 19623, 19669` against `19656.626` | sound | R02 |
| `frobeniusPrimeCount_effective_abelian` | `ℚ(i)/ℚ`, both classes | `39175`, `39322` against `39313.252` | sound | none |
| 1.1 Check | crossings of `Im logΓ = π` along rays | `r = 5.539, 4.152, 12.627` at `θ = π/2, π/4, 0.1` (grid `0.001`) against the README's `5.539, 4.151, 12.626` | sound | none |
| 1.3 | `σ = −1, ½, 2`; `t = 10, 100, 1000` | `−0.0049752, −5·10⁻⁵, −5·10⁻⁷`; `0`; `+0.0049752, …` (`O(1/t²)`, inside the stated `O(1/|t|)`) | sound | none |
| 1.4 | `|z| = 100` at args `0, π/2, 3π/4`; `Gammaℝ` at `2+3i` | `|z|·|ψ − log z| = 0.5008, 0.5000, 0.4994`; formula `−0.350016+0.618858i` equals the numerical derivative | sound | none |
| 1.4a | `s = 2`; `s = −2`; `ψ(i)` | `1.41508` (numerical derivative) against `γ + log 2π − 1 = 1.41509`; junk case `−0.16482` against `0.55412`; `Im ψ(i) = 2.0766740` | sound | none |
| 1.5 | `gammaR = {0}`, `σ = ½, 2` | `0.80636, 0.80605, 0.80604`; `−0.57236` three times (bounded) | sound | none |
| 2.2 | `ζ` on `[−5, 5]` | ratio range `[1, 8/3]` | sound | none |
| 2.4 | `Δ` at `s = ½` | `90 = analyticConductorAt f 6`; same point `15.75` | sound | none |
| 3.3 | `log‖Γℝ(1−s)/Γℝ(s)‖ − ½(1+2δ) log t`, `δ = ½` | `−1.83663, −1.83786, −1.83788` (→ `−log 2π = −1.83788`) | sound | none |
| 3.4 | exponent at `σ = −δ, ½, 1+δ` | `½+δ`, `¼+δ/2`, `0` | sound | none |
| 3.5 Check | `‖Λ(2m+2i)‖`, `m = 10, 20` | `3.67680`, `13519751.81` | sound | none |
| 5.3–5.5 | `cos`; `1 − s`; `exp(z+πi)` | row of `hadamard_of_orderLE_one`; `exp(z+πi) = −exp z` | sound | none |
| 6.5 | `χ₄` at `1` | `2·(1/π)·(π/4) = 0.5`, order `0` | sound | none |
| 7.2 | `[−1,1]²`: `z`, `z−2`, `1/z` | `1.0000000`, `−2.9·10⁻⁹`, `−1.0000000` | sound | none |
| 7.3 | `S(T)`, `T = 0.5, 0.1, 0.02`; `f = z` | `−0.64188, −0.91534, −0.98291` (→ `−1`); `θ(0) = −2.3561945 = −3π/4` | sound | none |
| 8.4 | `K = ℚ` | as `riemannZeta_weilExplicitFormula`; `log|d_ℚ| = 0` | sound | none |
| 8.9 Checks | `x = 10, 10⁴` | `Li − x/log x = 0.7775` against `1.8861`, and `159.3558` against `117.8823`; `∫₂¹⁰ dt/log²t = 3.66288` | sound | none |
| R01 | #1907 at `123254c` | 5 declarations only there, 2 only here | order unstated | R01 |
| R02 | `primeCount K univ x` against `ncard` | equal for every `x` (Lean proof); the restated theorems elaborate | carrier convention | R02 |

### Remarks outside the folder (no change asked of the folder)

- **The board's `sources.toml`.**
  - It records `trudgian2015` with venue "no. 294, pp. 2047–2058". The published data are no. 293, 1439–1450 (bennett2021 lines 1149–1150; hasanalizade2022 lines 785–786), as the README has them.
  - It has no entry for Titchmarsh, Iwaniec–Kowalski or Lagarias–Odlyzko 1977, which the README cites by locator.

## Not verifiable

- **Iwaniec–Kowalski, *Analytic Number Theory*, §§5.1–5.2** (2.1's convention, 3.3, and the `dirichletLFunction_convexity` docstring). AMS, paywalled; not in the manifest or the sources cache. The exponents were recomputed instead.
- **Titchmarsh, *The Theory of the Riemann Zeta-Function*, §5.1, §§9.2–9.4, Theorem 9.4, p. 214** (3.3, 4.5, 7.3, 7.4, 7.6). OUP, paywalled; not in the manifest. `N(100) = 29` and `S(T) → −1` were recomputed instead.
- **Davenport, *Multiplicative Number Theory*, §§11–20** (5.3, 5.5 and 8.x). Settled as uncertified; cited by locator.
- **Lang, *Algebraic Number Theory*, XVII §3, Theorem 3.1** (8.4). Settled as uncertified. I re-derived the formula at `K = ℚ` instead.
- **Lagarias–Montgomery–Odlyzko 1979, Lemma 2.3** (6.4). Settled as uncertified; only its report in kadiri2012 lines 65–73 was read.
- **Lagarias–Odlyzko 1977, Theorems 1.3 and 9.2** (a remark in 8.8, for a statement not owned here). Academic Press, paywalled; not in the manifest.
- **DLMF 5.5.3 and 5.6.6** (0.1, 1.3a, 1.6). The cached DLMF text is §5.11 only. I recomputed the values used (reflection, and `|Γ(x+iy)/Γ(x)|² = ∏(1 + y²/(x+n)²)⁻¹ ≤ 1`).

## Source issues

- **Misprint** in kadiri2012 at §1, display (1.6), p. 2 (arXiv v1): the source says LMO show `L(s,χ,K)` has no zeros in region (1.6), which near the real axis lies inside region (1.5), where one zero is allowed; it should be no zeros in (1.6) apart from the possible real zero of (1.5); affects nothing.
- **Gap** in trudgian2015 at the proofs of Theorems 1 and 2, pp. 1–12 (arXiv v4): the source treats one of the inequalities its auxiliary parameters must satisfy as redundant, which bennett2021 lines 73–76 show it is not; it should verify that inequality, so the stated constants are unproven; affects a stated result; corrected in print at bennett2021 Corollary 1.2 (Theorem 1) and hasanalizade2022 Corollary 1.2 (Theorem 2).
