# Review of ZerosOfLFunctions (pull request #1913 at a8d2e95)

**Verdict:** needs changes

This is a full review of `a8d2e95`, which the previous review also read; the folder has not changed since. There are two findings, both P3, and no blocking finding. R01 is carried over from the previous review. R02 is new: a negative-control argument in 6.4 (4d) states its choices in the wrong order.

## R01 (P3) — No order is stated against #1907, which conflicts with this pull request in both files (previous R01, not repaired)

**Location.** The pull-request description ends "Merge order: no pending supplier." and never mentions #1907.

**Claim.** The description presents #1913 as independent of other open work on this roadmap. It is not: #1907 also revises `TauCetiRoadmap/ZerosOfLFunctions/`.

**Witness.** #1907 is still open at `123254c`. `git merge-tree --write-tree a8d2e95 123254c` reports `CONFLICT (content)` in `TauCetiRoadmap/ZerosOfLFunctions/README.md` and in `Suggested.lean`. The two declaration sets differ:
- #1907 has `dedekindZeta_zeroFreeRegion`, `completed_orderLE_one`, `gammaLogDerivBound`, `finite_zero_sum_le_logDeriv` and `riemannVonMangoldt_dedekindZeta`;
- this head has `riemannZeta_zeros_summable_ordinate` and `neg_re_logDeriv_riemannZeta_le`, which #1907 lacks.

**Repair.**
- Add one sentence to the description saying which of #1913 and #1907 merges first, and that the other rebases onto it.
- The rebased pull request then says which of the seven declarations above it keeps. The two Dedekind statements of #1907 are already covered here by `heckeLFunction_zeroFreeRegion` and `riemannVonMangoldt_heckeLFunction` at the unit character `1`.
- Test: the description names #1907 and an order.

## R02 (P3) — 6.4 (4d): the `ℚ(√D)` control fixes `D` before `σ`, and as written it fails as `σ → 1⁺`

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md` lines 1689–1691: "every `p ≤ B` splits, which pushes `−ζ'_K/ζ_K(σ)` above `2/(σ − 1) − O(1)` for `σ` near 1 and defeats any degree-two constant."

**Claim.** Read literally, `K = ℚ(√D)` is fixed and then `σ` tends to `1`. In that order the inequality is false, although the conclusion the passage draws (the term `½ log |d_K|` is needed) is correct.

**Witness.** Fix `D`. Then `L(1, χ_D) ≠ 0`, so `−L'/L(σ, χ_D)` tends to the finite value `−L'/L(1, χ_D)` as `σ → 1⁺`. Hence `−ζ'_K/ζ_K(σ) = 1/(σ − 1) + O_D(1)`, which lies below `2/(σ − 1) − C` once `σ − 1 < 1/(C + O_D(1))`, whatever constant `C` (even one depending on `B`) is allowed.

**Repair.** Choose `σ` first, then `D`. Replace the clause with: "for each `σ ∈ (1, 2]` and `ε > 0`, once `B ≥ B₀(σ, ε)` every `n ≤ B` has `χ_D(n) = 1` on prime powers, and the tail is at most `∑_{n > B} Λ(n) n^{−σ}`. So `−ζ'_K/ζ_K(σ) ≥ 2(−ζ'/ζ)(σ) − ε = 2/(σ − 1) − 2γ_E − ε + O(σ − 1)`, and at `σ = 1 + 1/M` with `M` large this exceeds `1/(σ − 1) + C` for every degree-two constant `C`."

Tested:
- On the refuting instance, a fixed `D` no longer contradicts the statement, because `D` now depends on `σ`.
- At `σ = 1.1` the corrected bound is `2(−ζ'/ζ)(1.1) − ε ≈ 18.9 − ε`, against `1/(σ − 1) + C = 10 + C`.
- `D ≡ 1 (mod 8 ∏_{p ≤ B} p)` gives `(D/p) = 1` for odd `p ≤ B` and splits `2`, as the passage says.

## Verified sound

### Gate, build, dependency check, form

- **Gate.** Re-run on this head, it reports every check at `0` and ends `OK`, including `outside-folder=0` and `stray-files=0`. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.NT"`). `git diff --stat origin/main...HEAD` touches only the two roadmap files.
- **Build.** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits `0` in 25 s. Its only output is 17 warnings, all "declaration uses `sorry`", at lines 99, 111, 125, 138, 156, 175, 190, 207, 220, 234, 252, 267, 283, 301, 315, 336 and 350.
- **Dependency check output.** `depcheck: 236 roadmaps, 2267 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line. The suppliers are all on main: LFunctions, ClassFieldTheory and ModularForms under `TauCetiRoadmap/`, and ContourIntegration, ArithmeticDirichletSeries, GlobalNumberFields, NumberFieldArithmetic and Chebotarev under `Completed/`. Every linked README exists.
- **Imports.** A single `import Mathlib` plus seven `TauCeti.*` modules, each present at the pin. No `set_option`, no `lemma`, and no sorry'd data.
- **Definitions.** The three definitions have real bodies on native carriers: `OrderLE`, `zeroCount` (a `finsum` of `divisor.toNat`) and `zetaEntireCompletion`. Expanding `s(s − 1)(Λ₀ − 1/s − 1/(1 − s))` gives `s(s − 1)Λ₀ + 1`, so the definition is right and its values at `0` and `1` are `1`.
- **Process words.** None. The one "removed" (README line 1033, "removed poles") is mathematical.

### Signatures and padding

- **Signatures.** I printed `#check @name` for all 20 declarations in one scratch file. Every binder is explicit in the declaration's own signature, and each elaborated type matches its README statement, including:
  - quantifier order, with `c` and `C` chosen before `K`, `q`, `𝔪`, `ψ` and `T`;
  - `[NeZero q]`, `χ.IsPrimitive`, `Module.finrank ℚ K = n` and `IsUnit (a : ZMod q)`;
  - closed versus open strips, `Ioc 0 T` versus `Icc (−T) T`, and `ContDiff ℝ ∞`.
- **Padding.** For the one-tactic probe I copied the file and replaced each `sorry` with `first | rfl | (simp; done) | infer_instance | (norm_num; done) | trivial | sorry`. All 17 theorems still report `sorry`. No declaration restates a definition, mirrors a Check or computes a small value.

### Headline theorems

The README Summary names five end theorems, and each is stated:

| End theorem | Lean statement |
| --- | --- |
| region for Dedekind zeta and primitive ray-class L-functions, uniform in degree `n` | `heckeLFunction_zeroFreeRegion` (the Dedekind case is `ψ = 1`, conductor `Modulus.one K`, `character_one`) |
| uniform Riemann–von Mangoldt for both families | `riemannVonMangoldt_heckeLFunction` |
| effective prime ideal theorem | `primeIdealCount_effective` |
| effective count in a ray class (width uniform in degree `n`) | `rayClassPrimeCount_effective` |
| effective abelian Chebotarev | `frobeniusPrimeCount_effective_abelian` |

Also stated are the `K = ℚ` forms and the deep lemmas behind them: Hadamard at order at most one and its `ζ` instance, 5.6a, 6.4d for `ζ`, convexity uniform over primitive Dirichlet characters, and the truncated and Weil explicit formulas.

The docstring names what the pins cannot state: the completed Dedekind and Hecke functions, and the exceptional-zero terms. I considered the general-field Weil formula 8.4. It could be stated on the open strip, as 7.5 is, but the Summary lists it among what is built, not among the end theorems, so its absence is not a finding.

### Seeded sample (15 targets)

- **1.1.** The three cited Tau Ceti declarations elaborate with the hypotheses the README uses:
  - `TauCeti.exists_differentiableOn_eqOn_exp_comp` (`Analysis/Complex/BranchLogRoot.lean:173`): simply connected, open, `DifferentiableOn`, `0 ∉ g '' U`;
  - the two image lemmas of `Conformal/ImageSimplyConnected.lean`: open, simply connected, differentiable, `InjOn`.

  Recomputed in plain Python: `logGamma δ 3 = 0.6931472 = log 2`. `Im log Γ` first reaches `π` on the rays `θ = π/2, π/4, 1/10` at `r ∈ (5.5386, 5.5391]`, `(4.1511, 4.1516]` and `(12.6261, 12.6266]`; the README gives 5.539, 4.151 and 12.626.
- **1.4a.**
  - Mathlib's `logDeriv_riemannZeta_one_sub` takes `∀ n : ℤ, s ≠ n` and `ζ s ≠ 0`, with the right side as quoted.
  - At `s = 2` the symmetric form holds: `−0.56996 + 1.98505 = 1.41509 = 0.86097 + 0.55412`.
  - At `s = −2` the junk values give `−0.1647` against `0.5541`.
  - `Im ψ(i) = 2.07667`.
  - Tau Ceti's `HasFunctionalEquation.eventuallyEq` is the punctured-germ equation `d.completed =ᶠ[𝓝[≠] s] d.rootNumber * d.dual.completed (1 − ·)`.
  - The Provenance row checks: at PrimeNumberTheoremAnd `127b50e`, `kadiri_thm_3_1_q1_functional_eq` has exactly the four hypotheses `s ≠ 1`, `s ≠ 0`, `ζ(s) ≠ 0` and `ζ(1 − s) ≠ 0`, and its conclusion is the symmetric form rearranged.
- **2.4.** `HeckeRing.GL2.Newform.analyticConductorAt_eq` (`Newforms/AnalyticInvariants.lean:133`) gives `N(‖s‖ + 3)(‖s + 1‖ + 3)`. `NormalizationTranslation.gammaC_eq` adds `w/2` to the shifts. For `Δ`: `9 · 10 = 90` at analytic `½`, equal to the value at arithmetic `6`, and `3.5 · 4.5 = 15.75` without the shift.
- **2.5.** `LFunctions/Suggested.lean` on main:
  - `dedekindZetaData` has conductor `(discr K).natAbs` (line 1056);
  - `heckeData` has conductor `natAbs d_K · absNorm 𝔣.finitePart`, real shifts the parities, and complex shifts `0` (lines 1632–1643).

  `ℚ(i)` gives `4 · 3 · 4 = 48`; `χ₋₄` gives `4 · 4 = 16`, against `4` without `𝔑𝔣`.
- **3.1.** Every name exists on main:
  - Layers 2–3: `mellinKernel` (1234), `mellinConstant` (1223), `completedPartialZeta_eq_mellin` (1245, at `s/2`), `mellinKernel_sub_const_isBigO` (1255, `O(exp(−c u^{1/n}))`), `continuousOn_mellinKernel` (1270), `mellinKernel_inv` (1278);
  - Layer 6: `Grossencharacter.heckeMellinTotal` (2390), `heckeMellinTotal_sub_const_isBigO` (2432), `heckeMellinTotal_inv` (2447), `completedHeckeLFunction_eq_mellin` (2550, at `(s + Tr p/n)/2`).

  The gamma-integral bound rederives by `v = c u^α`. The Check holds: `E₁(1) = 0.2194 < e^{−1} = 0.3679 < Γ(1) = 1`.
- **4.1.** Mathlib's `LocallyFiniteSupport.finite_inter_support_of_isCompact` and `MeromorphicOn.divisor_restrict` elaborate. Checks: `z(z − 1)` gives `2`; `z/(z − 1)` gives `zeroCount 1` against `divisorCount 0`; `sin πz` over `ℝ` gives the `finsum` junk value `0`.
- **5.2.** `E₁′ = −z e^z` and `logDeriv E₁ = −z/(1 − z)`. `‖E₁(−½) − 1‖ = 0.090204 ≤ 0.125`, against `0.5` for the genus-0 factor.
- **5.6.** For `ξ`, `b = −γ_E/2 − 1 + ½ log 4π = −0.0230957`. `e^s ξ` has `f(0) = 1` and `f(1) = e`, so it is excluded. For `χ₄`, `Λ(0) = Gammaℝ(1)·½ = ½` and `Λ(1) = 2·π⁻¹·π/4 = ½`. Kadiri §2.1.2 (`kadiri2012` lines 230–237) is the partial-fraction formula for `−Re ζ'_K/ζ_K` with the terms `½ log d_K`, `Re 1/s`, `Re 1/(s − 1)` and the gamma term, as the README says.
- **6.5.** On main: `heckeLFunction_ne_zero_of_one_le_re` (2680, needs `χ.character ≠ 1` and `1 ≤ Re s`), `meromorphicOrderAt_dedekindZetaC_one_add` (2688, `t ≠ 0`, order `0`), `meromorphicOrderAt_dedekindZetaC_one` (977) and `completedHeckeLFunction_one_sub_eventuallyEq` (1670, germ form covering the trivial character). For `χ₄` the completion at `1` is `½`.
- **7.3.** All five Tau Ceti declarations elaborate:
  - `exists_continuousOn_arg_lift_with_partition` (`Argument/Lift.lean:427`);
  - `integral_inv_sub_mul_deriv_eq_log_norm_add_I_mul_sum_log_im` (`Winding/SegmentSum.lean:154`);
  - `windingNumber_comp_eq_integral_logDeriv` (`LogDerivFTC.lean:227`);
  - `windingNumber_eq_integral_of_avoidance` and `intervalIntegrable_deriv_smul_logDeriv`.

  For `f = z`: `θ₀ = −3π/4`, `θ₄ = 5π/4`, variation `2π`, endpoint value `5/8`. `Re ζ(2 + it) ≥ 2 − ζ(2) = 0.3551`. Titchmarsh §9.3 is under Not verifiable.
- **7.5.**
  - `bennett2021` lines 56–58 and 83–84: Corollary 1.2, conductor `q > 1`, `T ≥ 5/7`, zeros with `0 < β < 1` and `|γ| ≤ T`, error `min{0.247 log qT + 6.894, …}`. Lines 73–76 describe the gap in Trudgian's proof.
  - `hasanalizade2022` lines 26–27 and 63–65: Corollary 1.2, `T ≥ 1`, error `0.228(log d_K + n_K log T) + 23.108 n_K + 4.520`.
  - `trudgian2015` lines 16–29: Theorem 1 (primitive nonprincipal `χ`, `T ≥ 1`) and Theorem 2.

  All three match the README's References.
- **8.4.** I rederived the formula and it matches the Lean statement term by term:
  - shift `(2) → (−1)`, with residues `m_ρ φ̃(ρ)` and `−φ̃(0) − φ̃(1)`;
  - `w = 1 − s` with `F(1 − w) = −F(w)` gives `−(2πi)⁻¹ ∫_{(2)} F(w) φ̃(1 − w) dw`;
  - `φ̌(y) = φ(1/y)/y` has transform `φ̃(1 − s)`;
  - the `(2πi)⁻¹ ∫ ds` to `(2π)⁻¹ ∫ dt` conversion, and `mellin φ (1 − (2 + tI))`;
  - the archimedean constant gives `−(log π) φ(1)`, and the discriminant term `log |d_K| φ(1)`.

  Lang is uncertified.
- **8.6.** For the quartic `χ` modulo `5` with `φ` supported in `(0.4, 0.6)`, only the `φ̌` term at `n = 2` survives: `log 2 · (−i)/2 = −0.3466i`, against `+0.3466i` with `χ`. This follows from the reflection to `χ̄`.
- **8.7.** All Tau Ceti names elaborate: `primeCount_eq_primeTheta_div_log_add_integral` (`AbelSummation.lean:494`, every real `x`), `higherPrimePowerTheta_le` (`HigherPrimePowers.lean:254`, `x ≥ 1`), `primePowerSummatory_indicator_sub_primeTheta`, `primePowerWeight_eq_vonMangoldt_re`, `idealSummatory_eq_primePowerSummatory`, and `primeCount_primesCongruent_isEquivalent_logIntegral` (`PrimesCongruent.lean:50`, `[NeZero m]`, `IsUnit (a : ZMod m)`). The width argument checks: `log(q(T + 3)) ≤ 2√log x` at `T = e^{√log x}` from `log x = 0.6957, 2.4958, 190.8684` at `q = 1, 3, 10⁶`, and `c₀ = c_n/(4n)` absorbs `log² T`.
- **8.9.** `logIntegral_eq_div_log_sub_add` (`LogIntegral.lean:180`, `2 ≤ x`), `integral_inv_log_pow_le` (`1 < a ≤ b`), `intervalIntegrable_inv_log_pow` and `isLittleO_integral_inv_log_sq` elaborate as cited. Values: `Li 10 = 5.12044`; `∫₂¹⁰ (log t)^{−2} dt = 3.66288`, the same by the second integration by parts; `Li x − x/log x` is `0.77749` against `1.88612` at `x = 10` and `159.356` against `117.882` at `x = 10⁴`.

### Library declarations opened

- **One scratch file.** It contains 228 `#check @…` lines covering every Mathlib and Tau Ceti name the README cites outside Provenance, and elaborates with 0 errors. Among them:
  - `TauCeti.Contour.argumentPrinciple_nullHomologous` (`Argument/Cycle.lean:110`);
  - `TauCeti.LFunctions.heckeLFunctionC` (`Hecke/Basic.lean:74`, `meromorphicContinuation 1` of the presented series, `0` without a continuation, per `Analysis/Meromorphic/Continuation.lean:72`) and `heckeLFunctionC_eq_primitive` (`Hecke/Basic.lean:130`);
  - the `PrimitiveRayClassCharacter` structure, `One` and `InvolutiveInv` (`Hecke/Primitive.lean:91, 175, 192`);
  - `rayClassArtinMap_idealClass` (`Reciprocity.lean:216`), `primeIdealTheorem` (`Prime/PrimeIdealTheorem.lean:39`) and `frobeniusPrimeCount` (`PrimeCounting/VonMangoldt.lean:177`);
  - `NormalizationTranslation.completed_eq`, whose factor `N^{−w/4}` makes 2.3's `continuedL analytic s = continuedL arithmetic (s + w/2)` exact;
  - `DirichletCharacter.LFunction_changeLevel` (`χ ≠ 1 ∨ s ≠ 1`, product over `N.primeFactors`) and `changeLevel_eq_one_iff`.
- **Grepped where no object file exists.** `perronFormula` (`Perron/Ideal.lean:161`), `TauCeti.LSeries.wienerIkehara` (`WienerIkehara/SharpCutoff.lean:300`), `primeNumberTheoremTransfer` (`Prime/Boundary.lean:171`) and `hasNaturalDensity_frobeniusPrimeSet` (`PrimeCounting/FrobeniusPrimeCount.lean:108`).
- **LFunctions contract names.** All 43 names in "From TauCetiRoadmap.LFunctions" resolve in `LFunctions/Suggested.lean` on main, in the layers cited: Layers 2–3 at lines 899–1429, Layer 4 at 1430–1513, Layers 5–6 at 1514–2675, Layer 7 from 2676. That includes the six `Grossencharacter.*` names the citation tool flagged, which are in `namespace Grossencharacter` (2092).

### Duplication and ownership

- **The pins.** The pinned Mathlib and Tau Ceti have no `weierstrassFactor`, `divisorCanonicalProduct`, `riemannXi`, zero-free region, Riemann–von Mangoldt count or explicit formula. The Tau Ceti hits for `zeroFree` are Euler-product logarithm lemmas, and `Analysis/Analytic/Hadamard.lean` is Hadamard's lemma `f z − f c = G z (z − c)`.
- **Open roadmaps.** I read the scopes of ExplicitZetaBounds, ExplicitNumberFields and ExplicitPrimeCounting through `roadmaps show`. Each cites this roadmap as the owner of the existential-constant forms and owns only explicit constants.
- **AnalyticNumberTheoryPartIII (#2008, at its head).** It cites §§3.4, 4.3, 6.2–6.5, 7.1, 7.2 and 8.5, all present here.
- **Consumers on main.**
  - AsymptoticExpansions and SpecialFunctionsEiLiErfIncompleteGamma link the anchors `#12-stirling-on-the-sector` and `#13-vertical-strips`, and both headings are unchanged.
  - AnalyticNumberTheoryPartI's contract table (README lines 81–90) matches this head.
  - This pull request adds 1.3a, 1.4a and 5.6a, and drops no subsection id.
- **Overlap tool.** It reports no dropped id and no id that only an open revision defines.

### Adversarial table

Every value was computed for this review, by hand or in plain Python, and appears in this table or in the seeded-sample notes above. "Holds" means the stated instance gives what the statement claims.

| Statement | Instances | Values computed (each side) | Result |
| --- | --- | --- | --- |
| 0.1 `OrderLE` | `exp z²` at order 1; `1/Γ(−n−½)`; `A < 0` | `e^{r²}/e^{r^{3/2}} → ∞`; `‖1/Γ(−n−½)‖ = Γ(n+3/2)/π` (log `n log n + O(n)`); `A' < 0` forces bounded, hence constant | holds |
| `zetaEntireCompletion` | `s = 0, 1` | `0·(−1)·Λ₀ + 1 = 1`; raw `s(s−1)Λ` gives `0` | holds |
| 1.1 `logGamma` | `s = 3`; three rays | `0.6931472 = log 2`; `r = 5.5391, 4.1516, 12.6266` | holds |
| 1.2 Stirling | DLMF sector, remainder | `S_δ ⊆ {|ph z| ≤ π − δ}`; remainder `≤ sec²(½ ph z)/(12‖z‖)` (`dlmf5` lines 104–108, 563–569) | holds |
| 1.3a | `Re s = ½`; `−½` | `‖Γ(½+it)‖² = π/cosh πt ≤ π`; `Γ(−½) = −2√π < 0` | holds |
| 1.4a | `s = 2`; `s = −2`; `ψ(i)` | `1.41509 = 1.41509`; `−0.1647 ≠ 0.5541`; `Im ψ(i) = 2.07667` | holds |
| 2.2 | `ζ` on `[−5, 5]` | `|t| + 8 ≤ (8/3)(|t| + 3)` (`3|t| + 24 ≤ 8|t| + 24`), so `C₁ = 1`, `C₂ = 8/3` | holds |
| 2.3 | translation, weight `w` | `N^{−s/2}·N^{−w/4} = N^{−(s+w/2)/2}`; shifts `+ w/2` | holds |
| 2.4 | `Δ`, `k = 12` | `90` against `15.75` unshifted | holds |
| 2.5 | `ℚ(i)`; `χ₋₄` | `48`; `16` (against `4`) | holds |
| 3.1 | `R = 0`, `c = α = 1`; `Λ₀(2m)` | `0.2194 < 0.3679 < 1`; `log ≈ m log m` | holds |
| 3.4 exponent | `σ = ½` | `(½+δ)²/(1+2δ) = ¼ + δ/2` | holds |
| 3.5 | `m = 10, 20`, height `2` | `π^{−m}‖Γ(m+i)‖ = 3.676796`, `13519751.806` | holds |
| 4.1 | `z(z−1)`; `z/(z−1)`; `sin πz` on `ℝ` | `2`; `1` against `0`; `finsum` `0` | holds |
| 4.3 | `z`; `z/10`; `1 − z/2` | bounds `2, 3.32, 1.71` against counts `1, 1, 0`; untrailed form gives `0 < 1` | holds |
| 4.6 | `z²(z−3)`, `(2, 4)`, `(3, 5)` | `1.386 ≤ 1.674`; `1.5325 = 1.5325` | holds |
| 5.2 `E₁` | `z = −½` | `0.090204 ≤ 0.125`; genus 0 gives `0.5` | holds |
| `hadamard_of_orderLE_one` | `exp`; `1 − s`; `ρ = 0` | `(a, b) = (0, 1)`, empty product; `(0, −1)`; Lean factor `(1 − s/0)e^{s/0} = 1` | holds |
| 5.6 | `ξ`; `e^s ξ`; `χ₄` | `b = −0.0230957`; `f(1)/f(0) = e`; `Λ(0) = Λ(1) = ½` | holds |
| `riemannZeta_zeros_summable_ordinate` | first pair; `−2` | `2/(1 + 14.1347²) = 0.00996`; `divisor Λ (−2) = 0` | holds |
| `heckeLFunction_zeroFreeRegion` | `n = 0`; log argument; nesting; `ψ = 1` at `1` | no field of degree `0`; argument `≥ 3^n`; factor `1.26186 < 1.27`; order `−1`, not positive | holds |
| `riemannZeta_zeroFreeRegion` | trivial zeros; `s = 1` | `Re −2 < 1 − c/log 3` for `c < 3 log 3`; `s = 1` excluded | holds |
| `dirichletLFunction_zeroFreeRegion` | `χ₀` mod 2; `χ₀` mod 6; mod 6 from mod 3 | edge `0.69343`; double zero at `0` enters at `c ≥ 2.89037`; zero at height `4.53236` enters at `c ≥ 3.81097`; cap `0.54931` | holds |
| `neg_re_logDeriv_riemannZeta_le` | `t → 0`, `δ = 2|t|`; `δ ≥ 1` | `Re 1/(2|t| + 2it) = 1/(4|t|)`; left side `≤ 0.5700`, right side `≥ −1 + C log t₀` | holds |
| 6.4d over `K` | termwise comparison | `∑_{N𝔞 = p^j} Λ_K(𝔞) ≤ n log p`, so `≤ n(−ζ'/ζ)(2)` for `σ ≥ 2` | holds |
| 6.4d `ℚ(√D)` control | `D` fixed, `σ → 1⁺` | `−ζ'_K/ζ_K = 1/(σ−1) + O_D(1)`, against the claimed `2/(σ−1) − O(1)` | **R02** |
| 6.5 | `χ₄` at `1` | `2·π⁻¹·π/4 = ½`, order `0` | holds |
| 7.1–7.2 | `z`; `z − 2`; `1/z` | `1 = 1`; `0` against `ord 1` (without windings); `−1` against `zeroCount 0` | holds |
| 7.3 | `f = z` on `[−1, 1]²` | `θ₀ = −3π/4`, `θ₄ = 5π/4`, `5/8` | holds |
| `riemannVonMangoldt` | `T = 2, 100` | `−0.6827` against `0`; `28.127` against `29` | holds |
| `riemannVonMangoldt_heckeLFunction` | `ℚ`, `ψ = 1`; constants | open-strip count `= 2N(T)`; `log(|d_K| T^n) ≥ 0.693n` absorbs `23.108n + 4.520` | holds |
| `riemannVonMangoldt_dirichlet` | `q ≥ 3`; `q = 1` | `log qT ≥ 1.792`, so `6.894 ≤ 3.85 log qT`; `q = 1` via `completedLFunction_modOne_eq` | holds |
| 7.5 confinement Check | `1 + 5·2^{−s} + 2·4^{−s}` | zeros at `Re 2.18953`, `−1.18953` (sum `1`) | holds |
| 8.2–8.3 residues | `ℚ`; `ℚ(i)`, `x = 2` | `c_ℚ = −log 2π = −1.8379`; `−log(1 − 1/x) = 0.6931` | holds |
| `chebyshevPsi_explicitFormula` | `x = T = 2` | `ψ(2) = 0.6931` against `2 − 1.8379 + 0.1438 = 0.3060`; gap `0.387 ≤ 0.4805C` | holds |
| `riemannZeta_weilExplicitFormula` | rederived; `φ = 0` | matches the Lean statement term by term; `0 = 0` | holds |
| 8.5 / `primeIdealCount_effective` | `ℚ`, `x = 10, 10⁶`; `ℚ(i)`, `x = 10` | `2.4849 ≤ 12.094`; `1102.42 ≤ 137682.40`; `78597.11 = 78498 + 99.11`; `1.386 ≤ 24.19` | holds |
| 8.6 | quartic `χ` mod 5 | `−0.3466i` against `+0.3466i` | holds |
| `rayClassPrimeCount_effective` | `q = 1, 3, 10⁶`; `(3)∞`; `(4)∞`, `x = 9` | thresholds `0.696, 2.496, 190.868`; `½` against `⅓`; `log 21 = 3.0445` against base-selected `log 63 = 4.1431` | holds |
| `primeCounting_progression_effective` | `q = 4`, `x = 20`; `a = 2` | `4` against `Li 20/2 = 4.4301`; count `1`, not a unit | holds |
| `frobeniusPrimeCount_effective_abelian` | `ℚ/ℚ`; `ℚ(i)/ℚ` | `π(x) − Li x`; conjugation class gives `p ≡ 3 (mod 4)`, coefficient `½` | holds |
| 8.8 exceptional term | `(8)∞` | `ker Φ = {1, 5}`; `χ₈(5) = χ₋₈(5) = −1` | holds |
| 8.9 `Li` | `x = 10, 10⁴` | `5.12044`; `3.66288`; `0.77749` against `1.88612`; `159.356` against `117.882` | holds |
| `dirichletLFunction_convexity` | `q = 1`; `q = 2` | `ζ(½) = −1.4604`; no primitive character modulo `2` | holds |
| 9 GRH bridge | `−2`; `1` | divisor of `Λ` is `0` and `−1` | holds |

## Not verifiable

- **Iwaniec–Kowalski §§5.1–5.2, Titchmarsh §5.1, §§9.2–9.4 and Theorems 9.2–9.4 (printed p. 214), Lagarias–Odlyzko 1977 Theorems 1.3 and 9.2.** These are paywalled books or proceedings with no key in the board's `sources.toml`. This review edits no manifest. The statements were checked by computation only (rows above).
- **Uncertified keys.** Davenport (`davenport2000`, §§11–20), Lang (`lang1994`, XVII §3) and Lagarias–Montgomery–Odlyzko (`lagarias1979`, Lemma 2.3) are settled as uncertified. Lemma 2.3 was read through `kadiri2012` lines 65–73.
- **DLMF 5.5.3 and 5.6.6.** The cache holds only §5.11. Checked by computation: `‖1/Γ(−n−½)‖ = Γ(n+3/2)/π`, and `‖Γ(½+it)‖² ≤ π`.

## Source issues

- **Misprint** in kadiri2012 at §1, display (1.6), arXiv p. 2: the source says Lagarias–Montgomery–Odlyzko prove Hecke L-functions have no zero at all in region (1.6); it should say no zero there except possibly the single real zero allowed by (1.5); affects nothing.
