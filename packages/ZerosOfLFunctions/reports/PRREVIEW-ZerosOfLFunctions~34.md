# Review of ZerosOfLFunctions (pull request #1913 at a8d2e95)

**Verdict:** needs changes

This is a full review of `a8d2e95`, the head the previous review read; the folder has not changed since. There is one finding, P3, and it is not about the mathematics.

## R01 (P3) — No order is stated against #1907, which conflicts with this pull request in both files (previous R01, not repaired)

**Location.** The pull-request description ends: "Merge order: no pending supplier." Nothing in it mentions #1907.

**Claim.** The description presents #1913 as independent of other open work on this roadmap. It is not: #1907 also revises `TauCetiRoadmap/ZerosOfLFunctions/`, and the two heads conflict.

**Witness.** `git merge-tree --write-tree a8d2e95 123254c` (the head of #1907) reports `CONFLICT (content)` in both `TauCetiRoadmap/ZerosOfLFunctions/README.md` and `Suggested.lean`. The two declaration sets also differ:
- #1907 declares `dedekindZeta_zeroFreeRegion`, `completed_orderLE_one`, `gammaLogDerivBound`, `finite_zero_sum_le_logDeriv` and `riemannVonMangoldt_dedekindZeta`, which this head lacks;
- #1907 lacks `riemannZeta_zeros_summable_ordinate` and `neg_re_logDeriv_riemannZeta_le`, which this head declares.

**Repair.** Add one sentence to the description saying which of #1913 and #1907 merges first and that the other rebases onto it. The rebased pull request then says which of the seven declarations above it keeps. This head already covers the two Dedekind statements of #1907 through `heckeLFunction_zeroFreeRegion` and `riemannVonMangoldt_heckeLFunction` at the trivial character, so they need not be restated. Test: the description names #1907 and an order.

## Previous findings

- R01 (round 33), no order against #1907 — **not repaired**. The description still reads "Merge order: no pending supplier.", and #1907 is still at `123254c` with the conflict above. Carried as R01.

## Verified sound

### Gate, build and dependency check

- The gate, re-run on this head, reports every check at `0` and `OK`. The worker's gate on this head also reports `build=0`.
- `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0. Its only output is 17 warnings, all "declaration uses `sorry`", at lines 99, 111, 125, 138, 156, 175, 190, 207, 220, 234, 252, 267, 283, 301, 315, 336 and 350.
- The dependency check prints `depcheck: 236 roadmaps, 2264 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` lists no file outside the folder.
- The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- No `set_option`, no sorry'd data, a single `import Mathlib`, and seven `TauCeti.*` imports, each of which exists at the pin.

### Signatures and padding

- I printed `#check @name` for all 20 declarations in a scratch copy. Every binder is explicit in the declaration's own signature, and each elaborated type matches its README statement: quantifier order, `[NeZero q]`, `Module.finrank ℚ K = n`, primitivity and the open versus closed strips.
- The one-tactic probe replaced each `sorry` with `first | rfl | (simp; done) | infer_instance | sorry`. None of the 17 theorems closed; all 17 still report `sorry`.
- The three definitions have real bodies on native carriers.
- No declaration mirrors a Check or computes a small value.

### Headline theorems

The README Summary names five end theorems, and each is stated:

| End theorem | Lean statement |
| --- | --- |
| the region for Dedekind zeta and primitive ray-class L-functions | `heckeLFunction_zeroFreeRegion` (at `ψ = 1` it is the Dedekind region) |
| the uniform Riemann–von Mangoldt formula for both families | `riemannVonMangoldt_heckeLFunction` |
| the effective prime ideal theorem | `primeIdealCount_effective` |
| the effective prime count in a ray class | `rayClassPrimeCount_effective` |
| the effective abelian Chebotarev count | `frobeniusPrimeCount_effective_abelian` |

`Suggested.lean` also states:
- Hadamard's theorem, `hadamard_of_orderLE_one`, with its `ζ` instance `zetaEntireCompletion_hadamard`;
- the `K = ℚ` forms: `riemannZeta_zeroFreeRegion`, `dirichletLFunction_zeroFreeRegion`, `riemannVonMangoldt`, `riemannVonMangoldt_dirichlet`, `chebyshevPsi_explicitFormula`, `riemannZeta_weilExplicitFormula` and `primeCounting_progression_effective`;
- `dirichletLFunction_convexity`;
- the two `ζ` lemmas 5.6a and 6.4d.

The module docstring names what the pins cannot state: the completed Dedekind and Hecke functions, and the exceptional-zero terms of 8.5–8.8.

### Seeded sample (15 targets)

**1.1 (holomorphic branch of `log Γ`).** The three cited Tau Ceti declarations elaborate with the hypotheses the README uses:
- `TauCeti.exists_differentiableOn_eqOn_exp_comp`: simply connected, open, differentiable, `0 ∉ g '' U`;
- `TauCeti.isOpen_image_of_differentiableOn_of_injOn`;
- `TauCeti.isSimplyConnected_image_of_differentiableOn_of_injOn`: open, simply connected, differentiable, injective.

`S_δ = exp '' Ω_δ` holds because `‖exp w‖ = e^{Re w} > 1` exactly when `Re w > 0`, and `arg exp w = Im w` for `|Im w| < π`. The Check values reproduce: `logGamma δ 3 = 0.693147 = log 2`, and `Im log Γ` first reaches `π` along the rays `θ = π/2, π/4, 1/10` at `r = 5.539, 4.152, 12.627` (README: 5.539, 4.151, 12.626, within my 0.0005 step).

**1.2 (Stirling on the sector).** Checked against `dlmf5`:
- line 104 gives the sector `|ph z| ≤ π − δ`, which contains `S_δ`, and lines 106–108 give 5.11.1;
- §5.11(ii) at lines 563–569 bounds the remainder after `n = 1` terms by `sec²(½ ph z)` times `1/(12z)`. On the sector that is at most `1/(12‖s‖ sin²(δ/2))`, so `O(1/‖s‖)` with a constant depending on `δ`, as stated;
- `logGamma δ 2 = 0 = Ln Γ(2)`, and `S_δ` is a connected subset of `ℂ ∖ (−∞, 0]`, so the branch is DLMF's `Ln Γ`.

**2.2 (two-sided comparison).** No external locator; the statement is elementary and was verified by computation:
- With `M` bounding `|Im μ|`, each factor `‖σ + it + μ‖ + 3` lies between `(3/(3 + M))(|t| + 3)` (equality at `|t| = M`) and `(1 + (max(|a|, |b|) + M)/3)(|t| + 3)`.
- The `ζ` Check gives `C₁ = 1` and `C₂ = 8/3` on `[−5, 5]`, since `|t| + 8 ≤ (8/3)(|t| + 3)`.

**2.5 (the two families).** Checked on main in `LFunctions/Suggested.lean`:
- `dedekindZetaData` has conductor `(discr K).natAbs` (line 1056);
- `heckeData` has conductor `|d_K| · N(𝔣)` (line 1640);
- the Checks reproduce: `4 · 3 · 4 = 48` for `ℚ(i)`, and `4 · (1 + 3) = 16` for `χ₋₄` (`4` without `N𝔣`).

**3.3 (the two edges).** For one `Gammaℝ` factor with real shift `μ`, the real parts at `1 − s` and `s` are `(1 + δ + μ)/2` and `(−δ + μ)/2`. Their difference `½ + δ`, summed over the degree, gives `(n/2)(1 + 2δ) log |t|`. Together with `N^{1/2+δ}` this is `≍ q(s)^{1/2+δ}`, as stated. The Iwaniec–Kowalski and Titchmarsh locators are under Not verifiable.

**5.1 (zeros of a function of finite order).** The route is Jensen through `AnalyticOnNhd.sum_divisor_le`, whose hypotheses are `0 < |r| < |R|`, `1 ≤ M`, analyticity on the closed ball and `f c ≠ 0`. With `R = 2r`, `n(r) ≤ ((2r)^{A+ε} + C)/log 2`. For `A < 0` the function is constant and nonzero, and the count is `0`.

**5.5 (Hadamard at order at most one).** Davenport §11 is uncertified; the statement was checked against the Lean signature:
- At `ρ = 0` the factor is `(1 − s/0) e^{s/0} = 1` in Lean, and `m₀ = 0` because `f 0 ≠ 0`.
- `f = exp` gives `(a, b) = (0, 1)` with an empty product.
- `f = 1 − s` gives `1 − s = e^{−s} E₁(s)`.

**7.1 (the rectangle as a contour).** `TauCeti.Contour.windingNumber : (ℝ → ℂ) → ℝ → ℝ → ℂ → ℂ` matches `windingNumber (rectBoundary R) 0 4 z`. Null-homology follows from `TauCeti.Contour.isNullHomologous_iff` (winding number `0` at every `w ∉ U`), since `U ⊇ R`.

**7.2 (argument principle on a rectangle).** `TauCeti.Contour.argumentPrinciple_nullHomologous` elaborates with exactly the hypotheses the README lists: `IsOpen U`, analytic and nonvanishing off `S`, meromorphic with integer orders on `S`, and a closed, piecewise-`C¹`, null-homologous curve avoiding `S`. Its conclusion is `∫ deriv γ • logDeriv f (γ t) = 2πi ∑ windingNumber · ord`. The counterexample to dropping the winding numbers holds: the integral is `0`, while `∑ ord = 1`.

**7.3 (argument variation and S(T)).** The four cited declarations elaborate:
- `exists_continuousOn_arg_lift_with_partition`: needs `a ≤ b`, continuity and avoidance; gives a monotone partition and a slit-plane condition;
- `windingNumber_eq_integral_of_avoidance`;
- `integral_inv_sub_mul_deriv_eq_log_norm_add_I_mul_sum_log_im`: the log-norm term plus `i` times the segment sum;
- `windingNumber_comp_eq_integral_logDeriv`.

Both Checks reproduce. For `f z = z`, `θ 0 = −3π/4` and `θ 4 = 5π/4`. Near the pole at `1`, `arg ζ ≈ −arg(s − 1)` runs from `0` to `−π`, so `S(T) → −1`.

**7.4 (Riemann–von Mangoldt for `ζ`).** At `T = 100` the main term is `28.127` against `N = 29`; at `T = 2` it is `−0.683` against `N = 0`. Both are within `C log T`. The confinement route uses Mathlib names that resolve.

**7.5 (uniformity in the conductor).** Three cached sources check:
- `bennett2021` lines 83–84: Corollary 1.2, conductor `q > 1`, `T ≥ 5/7`, error `0.247 log qT + 6.894`. Lines 73–76 describe the gap in Trudgian's proof as the README does.
- `hasanalizade2022` lines 63–65: Corollary 1.2, `T ≥ 1`, error `0.228(log d_K + n_K log T) + 23.108 n_K + 4.520`. Lines 26–27 count zeros with `0 < β < 1` and `|γ| ≤ T`.
- `trudgian2015` lines 19–27: Theorems 1 and 2.

**8.1 (truncated Perron, consumed).** The Tau Ceti declarations match:
- `truncatedPerronKernel_one` (`Perron/Basic.lean:204`) gives `π⁻¹ arctan(T/c)`;
- `truncatedPerron_LSeries` (`Perron/Formula.lean:130`) and `norm_truncatedPerron_LSeries_sub_sum_le` (`Perron/Formula.lean:229`) take `0 < x`, `0 < c`, `T ≥ 0` or `T > 0`, `x` off the support and summability on the line;
- `perronFormula` is at `Perron/Ideal.lean:161`.

**8.2 (the contour shift).** The residues were recomputed:
- `x` at `1`, and `−m x^ρ/ρ` at each zero;
- at `0`, the expansion `(−r/s + c_K)(1/s + log x)` has residue `c_K − r log x`;
- at the trivial zeros, `(order) x^{−m}/m`, summing to `−((r₁ + r₂)/2) log(1 − x^{−2}) + (r₂/2) log((x + 1)/(x − 1))`.

**8.6 (the Hecke instance).** For the quartic `χ` modulo `5`, only the `φ̌` term at `2` survives: `log 2 · conj(i)/2 = −0.3466i`, against `+0.3466i` with `χ`. The orders at `0` and `−m` follow from the poles of `Gammaℝ(s + a_j)` and `Gammaℂ`.

### Library declarations opened at the pins

**Tau Ceti.**
- `Data/Basic.lean`: lines 82–98 (`AnalyticLFunctionData`; note `polarOrder : ℂ →₀ ℕ` and `gammaR : Multiset ℂ`), 174 (`HasDirichletAgreement`), 183 (`HasMeromorphicContinuation`) and 193 (`HasFunctionalEquation`). Every field name the README uses exists.
- `HasFunctionalEquation.eventuallyEq` and `dual_completed`, by `#check`.
- `heckeLFunctionC` and `heckeLFunctionC_eq_primitive` (`1 < Re s`, with `eulerCorrection`), by `#check`.
- `HeckeRing.GL2.Newform.analyticConductorAt_eq`, equal to `N(‖s‖ + 3)(‖s + 1‖ + 3)`, by `#check`.
- `primeCount` and `primeTheta` (on `Set (HeightOneSpectrum (𝓞 K))`), by `#check`.
- `HigherPrimePowers.lean:296`, `Prime/PrimeIdealTheorem.lean:39`, `Prime/DedekindZeta.lean:69`, `Prime/Psi.lean:106, 185, 210`, `AbelSummation.lean:494`, `LogIntegral.lean:180, 321`.
- `ClassFieldTheory/Global/AdmissibleModulus/Basic.lean:208` and `Reciprocity.lean:128, 161, 216`.
- `NumberField.Chebotarev.frobeniusPrimeCount` (returns `ℕ`; `[IsGalois K L]`), by `#check`.

**Mathlib.**
- `completedRiemannZeta_eq`, `DirichletCharacter.completedLFunction_modOne_eq`, `DirichletCharacter.LFunction_changeLevel` (`χ ≠ 1 ∨ s ≠ 1`), `Complex.Gammaℝ_eq_zero_iff`, `PhragmenLindelof.vertical_strip` (growth `exp(B exp(c|Im z|))` with `c < π/(b − a)`) and `AnalyticOnNhd.sum_divisor_le`, all by `#check`.
- `Gamma/Digamma.lean`, lines 48–124.

**Duplication.** The pinned Mathlib has no complex Stirling formula (`Analysis/SpecialFunctions/Stirling.lean` is the factorial form), no Hadamard factorization and no zero-free region: `grep` finds no `weierstrassFactor`, `divisorCanonicalProduct`, `EntireOfOrderAtMost` or `riemannXi`. None of the 17 theorems is already at the pins. The `library-matches.md` leads are definitions or weaker facts, such as `riemannZeta_ne_zero_of_one_le_re` and `logDeriv_riemannZeta_one_sub`, which the README consumes.

### Cross-roadmap citations and consumers

- In `LFunctions/Suggested.lean` on main, the contract names resolve at the layers cited: `completedDedekindZeta_one_sub` (1046), `dedekindZetaData` (1053), `partialZeta_eq_sum_heckeLFunctionC` (1620), `heckeData` (1632), `completedHeckeLFunction_one_sub_eventuallyEq` (1670), `heckeLFunction_ne_zero_of_one_le_re` (2680) and `meromorphicOrderAt_dedekindZetaC_one_add` (2688).
- `ClassFieldTheory/README.md` line 593 lists `rayClassArtinMap`, `rayClassArtinMap_idealClass` and `rayClassArtinMap_surjective`.
- Every linked supplier README exists on main: LFunctions, ClassFieldTheory, ModularForms, and the Completed roadmaps ContourIntegration, ArithmeticDirichletSeries, GlobalNumberFields, NumberFieldArithmetic and Chebotarev.
- Consumers on main still find what they cite:
  - AsymptoticExpansions links the anchors of §1.2 and §1.3, and both headings are unchanged.
  - AnalyticNumberTheoryPartI's contract table (README lines 81–90) matches this head row by row. For example, its 6.2–6.4 row asks for at most one exceptional `β`, simple, real character, `β ≥ 1/2`, which is 6.3 here (lines 1615–1616). Its 0.1–0.2 row asks for `s(s − 1)Λ` without the factor `1/2`, which is `zetaEntireCompletion`.

### Ownership against open pull requests

- The overlap tool reports no id this README cites that an open pull request drops, no id that only an open revision defines, and no id this pull request drops.
- I read the scopes of the closest roadmaps through `roadmaps show`:
  - ExplicitZetaBounds, ExplicitNumberFields and ExplicitPrimeCounting own the explicit-constant versions (explicit Stirling, the explicit Riemann–von Mangoldt counts of Hasanalizade–Shen–Wong and Trudgian, explicit regions). This roadmap states existential-constant forms and cites those papers only as sources.
  - Chebotarev (#1187) excludes zero-free regions and effective bounds.
  - AnalyticNumberTheoryPartIII (#2008, read at its head) cites §§3.4, 4.3, 6.2–6.5, 7.1, 7.2 and 8.5 here as a supplier.
- ZerosOfLFunctions is on main, so it is earlier than all of them. No object has two owners.

### Provenance

The Provenance section's PrimeNumberTheoremAnd claims were checked against that repository at commit `127b50e`. I read its files through the GitHub API, because the sources cache holds only the project's README.
- All 13 names occur in the files the table gives. For example, `divisorCanonicalProduct` is at `Mathlib/Analysis/Complex/DivisorIndex.lean:87`, `ZeroInequality` at `StrongPNT.lean:2214` and `riemannZeta.N` at `IEANTN/ZetaDefinitions.lean:137`, the last with `Set.Ioo 0 T`, as the README says.
- The listed files contain no `sorry`, except `IEANTN/Kadiri.lean`. Its 14 occurrences all lie outside `kadiri_thm_3_1_q1_functional_eq` (lines 728–741).

### Adversarial table

The values were computed by hand and in plain Python.

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| 1.1 `logGamma` | `s = 3`; rays `θ = π/2, π/4, 1/10` | `0.693147 = log 2`; `Im = π` first at `r = 5.539, 4.152, 12.627` (README 5.539, 4.151, 12.626) | holds |
| 1.2 Stirling | sector bound | remainder `≤ 1/(12‖s‖ sin²(δ/2))`; at `δ → 0` it is unbounded, matching the stated `δ`-dependence | holds |
| 1.4a FE of `ζ'/ζ` | `s = 2`; `s = −2` | `−0.56996 + 1.98505 = 1.41509 = 0.86097 + 0.55412`; junk `0 + (−0.1648)` against `0.5541`; `Im ψ(i) = 2.07667` | holds |
| 2.2 comparison | `ζ` on `[−5, 5]`; shift `M` | `C₁ = 1`, `C₂ = 8/3`; general `C₁ = (3/(3 + M))^n` | holds |
| 2.4 newform | `Δ`, `k = 12` | `9 · 10 = 90` at analytic `½` = arithmetic `6`; `3.5 · 4.5 = 15.75` unshifted | holds |
| 2.5 families | `ℚ(i)`; `χ₋₄` | `48`; `16` (`4` without `N𝔣`) | holds |
| 3.3 edges | one `Gammaℝ`, real `μ` | real-part gap `½ + δ`, so exponent `(n/2)(1 + 2δ)`; `q^{1/2+δ}` | holds |
| 3.5 strip growth | `m = 10, 20` at height `2` | `π^{−m} ‖Γ(m + i)‖ = 3.67680`, `13519751.81` | holds |
| 5.1 zero count | `R = 2r` | `n(r) ≤ ((2r)^{A+ε} + C)/log 2`; `A < 0` gives `0` | holds |
| 5.2 `E₁` | `z = −½` | `‖E₁ − 1‖ = 0.09020 ≤ 0.125`; genus 0 gives `0.5` | holds |
| 5.5 / `hadamard_of_orderLE_one` | `exp`; `1 − s`; `ρ = 0` | `(a, b) = (0, 1)`; `(0, −1)`; factor `1`, `m₀ = 0` | holds |
| 5.6 / `zetaEntireCompletion_hadamard` | `ξ`; `e^s ξ` | `b = −0.0230957 = −∑ Re 1/ρ`; `e^s ξ` gives `b = 0.9769`, `f(1) = e ≠ ‖f(0)‖` | holds |
| 5.6a / `riemannZeta_zeros_summable_ordinate` | first pair; trivial zeros; `1/Γ(s + ½)` | `0.00996`; divisor of `Λ` at `−2` is `0`; control summands all `1`, divergent | holds |
| 6.2–6.4 / `heckeLFunction_zeroFreeRegion` | `K = ℚ`, `ψ = 1`; `n = 0`; nesting | edge `1 − c/log 3` at `t = 0`; trivial zeros outside for `c < log 3`; no field of degree `0`; factor `1.2619 < 1.27`; LMO containment for `c < 1/R₄` | holds |
| `riemannZeta_zeroFreeRegion` | `t = 0`; `s = 1` | `ζ(σ) < 0` on `(0, 1)`; `s = 1` excluded | holds |
| `dirichletLFunction_zeroFreeRegion` | principal mod `2`, mod `6`; mod `6` from mod `3` | edge `0.6934`; double zero at `0` enters at `c ≥ 2.890`; zero at height `4.5324` enters at `c ≥ 3.811`; cap `0.549` | holds |
| `neg_re_logDeriv_riemannZeta_le` | `t → 0` with `δ = 2|t|`; `δ ≥ 1` | `1/(4|t|)` against `log |t| → −∞`; `|ζ'/ζ(2)| = 0.5700`; clause 2 vacuous below `14.13` | holds |
| 7.1 `rectBoundary` | `[0, 1]²`; degenerate | windings `1`, `0`; clockwise `−1`; `rectBoundary R 1 = σ₂ + it₁` | holds |
| 7.2 argument principle | `z`; `z − 2`; `1/z` | `1 = 1`; `0` against `∑ ord = 1` without windings; `−1` against `zeroCount 0` | holds |
| 7.3 variation | `f = z` on `[−1, 1]²`; small `T` | `θ 0 = −3π/4`, `θ 4 = 5π/4`, ratio `1`, endpoint `5/8`; `S → −1` | holds |
| `riemannVonMangoldt` | `T = 2, 100` | main term `−0.683` against `0`; `28.127` against `29` | holds |
| `riemannVonMangoldt_heckeLFunction` | `K = ℚ`, `ψ = 1`; constants | open-strip count `2N(T)`; constant term over `log(|d_K| T^n) ≥ 0.693n` absorbed | holds |
| `riemannVonMangoldt_dirichlet` | `q = 1`; `q = 3` | `completedLFunction_modOne_eq`; `log(qT) ≥ log 6 = 1.79` absorbs `6.894` | holds |
| 7.5 confinement Check | `ζ(1 + 5·2^{−s} + 2·4^{−s})` | extra zeros at `Re = 2.1895, −1.1895` (sum `1`); `2^s + 5 + 2·2^{−s}` is invariant under `s ↦ 1 − s` | holds |
| 8.1 kernel at `1` | `x = 1` | `(2π)⁻¹ ∫ c/(c² + t²) dt = π⁻¹ arctan(T/c)` | holds |
| 8.2–8.3 residues | `ℚ`; `ℚ(√5)`; `ℚ(i)`, `x = 2` | `c_ℚ = −1.8379`; double pole at `0`; `−log(1 − 1/x) = 0.6931` | holds |
| `chebyshevPsi_explicitFormula` | `x = T = 2` | `ψ(2) = 0.6931` against `0.3060`; gap `0.387 ≤ 0.48C`; near-prime-power term `≤ x log² x/(T log 2)` | holds |
| `riemannZeta_weilExplicitFormula` | rederived; `φ = 0`; `n = 0` | shift `(2) → (−1)`, `w = 1 − s` gives `φ̃(1 − s)`, Mellin inversion gives `φ(n)` and `φ(1/n)/n`; `0 = 0`; `Λ(0) = 0` | holds |
| 8.5 / `primeIdealCount_effective` | `ℚ`, `x = 10, 10⁶`; `ℚ(i)`, `x = 10` | `log 12 = 2.4849 ≤ 12.094`; `1102.42 ≤ 137682.4`; Riemann count `78597.11 = 78498 + 99.11`; `2 log 2 ≤ 24.19` | holds |
| 8.6 Hecke instance | quartic `χ` mod `5` | `−0.3466i` against `+0.3466i` | holds |
| `rayClassPrimeCount_effective` | `q = 1, 3, 10⁶`; `(3)∞` | thresholds `log x = 0.696, 2.496, 190.868`; `1/#Cl = 1/2`, not `rayClassIdealMainTerm = 1/3` | holds |
| `primeCounting_progression_effective` | `q = 4`, `a = 3, 2`, `x = 20` | `4` against `Li 20/2 = 4.4301`; `a = 2` gives count `1` (non-unit) | holds |
| `frobeniusPrimeCount_effective_abelian` | `K = L = ℚ`; `ℚ(i)/ℚ` | `π(x)`; conjugation class `p ≡ 3 (mod 4)`, coefficient `1/2` | holds |
| 8.8 exceptional-term Check | `(8)∞` kernel | `ker = {1, 5}`; `χ₈(5) = χ₋₈(5) = −1` | holds |
| 8.9 `Li` | `x = 10, 10⁴` | `5.1204`; `∫ = 3.6629`; `0.7775` against `1.8861`, `159.35` against `117.88` | holds |
| `dirichletLFunction_convexity` | `q = 1`, `t = 0`; mod `2` | `ζ(½) = −1.4604`; no primitive character modulo `2` | holds |

## Not verifiable

- Iwaniec–Kowalski §5.1 (5.7) and §5.2 (2.1, 3.3, 3.4) and Titchmarsh §5.1, §§9.2–9.4, Theorems 9.2–9.4, printed p. 214 (4.5, 7.3, 7.4, 7.6). Both books are paywalled, and `sources.toml` records neither, so this review had no manifest key to cite them by and edits no manifest. Checked by computation only (rows above).
- Davenport §§11–20 (`davenport2000`), Lang XVII §3 (`lang1994`) and Lagarias–Montgomery–Odlyzko Lemma 2.3 (`lagarias1979`) are recorded as uncertified. Lemma 2.3 was checked through `kadiri2012` lines 65–73.
- Lagarias–Odlyzko 1977, Theorems 1.3 and 9.2 (the remark in 8.8): not in the cache.
- DLMF 5.5.3 and 5.6.6 (0.1, 1.3a): the cache holds only §5.11. Checked by computation: `‖1/Γ(−n − ½)‖ = Γ(n + 3/2)/π`, and `‖Γ(½ + it)‖² = π/cosh πt ≤ π`.

## Source issues

- **Misprint** in kadiri2012 at §1, display (1.6), arXiv p. 2: the source says Lagarias–Montgomery–Odlyzko prove Hecke L-functions have no zero at all in region (1.6); it should say no zero there except the possible single zero of region (1.5); affects nothing.
