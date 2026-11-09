# Review of ZerosOfLFunctions (pull request #1913 at a77d09a)

**Verdict:** needs changes

This is an incremental re-review of the 8 lines that changed since `df1d605`. They are all in `TauCetiRoadmap/ZerosOfLFunctions/README.md` (+7 −1), in the route of 6.4 (4d). `Suggested.lean` is unchanged, and nothing outside the folder changed.

The change corrects how the route of (4d) counts the conductor `N`, which the previous review raised as a remark on untouched text. The correction is right, and every value in it was recomputed. The previous R01 is not repaired and is carried below. It is P3 and concerns the pull-request description only. The gate passes and there is no blocking finding.

## R01 (P3) — No order is stated against #1907, which conflicts with this pull request in both files (previous R01, not repaired)

**Location.** The pull-request description ends "Merge order: no pending supplier." and never mentions #1907.

**Claim.** The description presents #1913 as independent of the other open work on this roadmap. It is not: #1907 (head `123254c`, index of 2026-11-09T23:20:04Z) also revises `TauCetiRoadmap/ZerosOfLFunctions/`.

**Witness.** `git merge-tree --write-tree a77d09a 123254c` reports `CONFLICT (content)` in `README.md` and in `Suggested.lean`.
- Only #1907 declares `completed_orderLE_one`, `dedekindZeta_zeroFreeRegion`, `finite_zero_sum_le_logDeriv`, `riemannVonMangoldt_dedekindZeta` and `gammaLogDerivBound`.
- Only this head declares `neg_re_logDeriv_riemannZeta_le` and `riemannZeta_zeros_summable_ordinate`.

**Repair.**
- Add one sentence to the description saying which of #1913 and #1907 merges first, and that the other then rebases onto it.
- The pull request that rebases says which of the seven declarations above it keeps.
  - The two Dedekind statements of #1907 are already covered here by `heckeLFunction_zeroFreeRegion` and `riemannVonMangoldt_heckeLFunction` at the unit character `1`.
  - #1907's `finite_zero_sum_le_logDeriv` (its `Suggested.lean` lines 214–221) counts the conductor once (`½ log q + C_Γ`), as the repaired (4d) route here does.
- Test: the description names #1907 and an order.

No repair report marks this finding `not actionable in this package`: the package's `reports/` folder holds only review and gate reports.

## Previous findings

- R01 — not repaired: the description still ends "Merge order: no pending supplier." and names neither #1907 nor an order. `git merge-tree` of `a77d09a` and `123254c` still conflicts in `README.md` and `Suggested.lean`. Carried as R01.

## Verified sound

### The changed passage: 6.4 (4d), README lines 1684–1690

The previous review remarked that the route listed `½ log N` among the terms and then also bounded the gamma term by `½ log analyticConductorAt d (it)`, which counts `N` twice. The route now bounds the real part of the gamma term by `½ log (analyticConductorAt d (it)/N) + O(1)` and adds `½ log N` to it. Each claim was checked.

1. **The decomposition.** In Kadiri §2.1.2 (`kadiri2012` line 237), `−Re ζ_K'/ζ_K(s)` has `½ log d_K` and `Re γ_K'/γ_K(s)` as separate terms, besides the zero sum and `Re 1/s + Re 1/(s − 1)`. So the gamma term carries no conductor, and bounding it by the archimedean factors alone is the right accounting.
2. **The archimedean quotient.** By the Conventions (README lines 154–157), `analyticConductorAt d s` is `N ∏_j (‖s + μ_j‖ + 3) ∏_k (‖s + ν_k‖ + 3)(‖s + ν_k + 1‖ + 3)`. So `analyticConductorAt d (it)/N` is exactly the product of the archimedean factors, and `½ log N + ½ log (analyticConductorAt d (it)/N) = ½ log analyticConductorAt d (it)`.
3. **The bound follows from 1.4 and the convention.** Take `1 < σ ≤ 2` and real shifts, as for finite-order characters (line 1650).
   - For `Gammaℝ(s + μ)`: `Re logDeriv = ½ Re ψ((s + μ)/2) − ½ log π ≤ ½ log |s + μ| + O(1)`, and `|s + μ| ≤ ‖it + μ‖ + 2`.
   - For `Gammaℂ(s + ν)`: `Re ψ(s + ν) − log 2π ≤ log |s + ν| + O(1)`, and `|s + ν|² ≤ (‖it + ν‖ + 3)(‖it + ν + 1‖ + 3)`.
   - Summing gives `½ log (analyticConductorAt d (it)/N) + O(n)`.
   - 1.4 and 2.2 are on 6.4's `*Needs:*` line (README line 1757).
4. **The `ζ` example.** Recomputed with a complex digamma written for this check (recurrence plus the asymptotic series, Bernoulli numbers to `B₁₄`):
   - `ψ(1) = −0.5772156649`, which matches Mathlib `Complex.digamma_one` (`Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean:56`).
   - `logDeriv Gammaℝ 2 = ψ(1)/2 − (log π)/2 = −0.8609728`, against the README's `≈ −0.8610`. Here `Gammaℝ s = π^(−s/2) Γ(s/2)` (`Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:46`).
   - `½ log 3 = 0.5493061`, which is `½ log (analyticConductorAt d 0/1)` for the `ζ` record.
5. **The limit `½ log 2π`.** The gap `½ log (|t| + 3) − Re logDeriv Gammaℝ (σ + it)`:

   | `σ` | `t = 10` | `t = 100` | `t = 10⁴` | `t = 10⁶` |
   | --- | --- | --- | --- | --- |
   | `1.01` | `1.050960` | `0.933726` | `0.919089` | `0.918940` |
   | `1.5` | `1.050329` | `0.933720` | `0.919089` | `0.918940` |
   | `2` | `1.048447` | `0.933701` | `0.919089` | `0.918940` |

   The limit is `½ log 2π = 0.9189385`, as stated.
6. **Notation.** Every symbol the change uses occurs elsewhere in the README:
   - `digamma` at lines 729 and 808;
   - `gammaR = {0}` at line 806;
   - the `ζ` record at line 914;
   - `γ_E` at lines 785 and 808;
   - `N` as the conductor at line 155.

   The text is Unicode with no LaTeX and no process words.
7. **Other citers.** The (4d) statement itself (lines 1673–1681) is unchanged. So are its citers at README lines 918, 1782, 2586 and 2606 and `Suggested.lean` lines 38 and 201, so nothing that depends on the passage changes. The change resolves the previous review's remark; there is no remaining inconsistency between the listed terms and the bound.

### Gate, build, dependency check

- **Gate.** Re-run on `a77d09a`: every check is at `0`, including `outside-folder`, `stray-files` and `statement-hygiene`, and it ends `OK`.
  - `git diff --stat df1d605 HEAD` touches only `README.md` (+7 −1).
  - `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ZerosOfLFunctions'` is empty.
- **Build.** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits `0`. Its only output is 17 "declaration uses `sorry`" warnings, at lines 99, 111, 125, 138, 156, 175, 190, 207, 220, 234, 252, 267, 283, 301, 315, 336 and 350, the same as at `df1d605`.
- **Dependency check.** Output: `depcheck: 236 roadmaps, 2268 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Signatures and padding.** `Suggested.lean` is byte-identical to `df1d605` and `a8d2e95`, so the earlier `#check @name` comparison of all 20 declarations and the one-tactic probe stand. The worker's elaborated-signature listing reports 0 lost binders.

### Seeded sample

None of the 15 seeded targets falls in the changed passage: 0.1, 1.3a, 2.3, 3.3, 4.1, 4.2, 5.6, 5.6a, 6.2, 7.2, 8.1, 8.3, 8.5, 8.6 and 8.9.

Spot checks:
- **6.2.** The README cites Kadiri Theorem 1.1 for the regions `|Im s| ≥ 1` and `|Im s| ≤ 1` when `d_K` is large. That is `kadiri2012` lines 79–82, on p. 2.
- **8.5.** Its pinned declarations exist where cited:
  - `TauCeti.primePsi_sub_primeTheta` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/Psi.lean:210`);
  - `TauCeti.higherPrimePowerTheta_le` (`…/HigherPrimePowers.lean:296`, hypothesis `1 ≤ x`, as the README states);
  - `TauCeti.primeCount_eq_primeTheta_div_log_add_integral` (`…/AbelSummation.lean:494`);
  - `TauCeti.Real.logIntegral_eq_div_log_sub_add` (`TauCeti/Analysis/SpecialFunctions/LogIntegral.lean:180`, hypothesis `2 ≤ x`).
- **Earlier rounds.** The previous reviews verified 4.1, 5.6, 6.2, 8.6 and 8.9; those passages are unchanged.

### Duplication, ownership, overlaps

- **Duplication and ownership.** The change adds no definition, theorem, supplier citation or `*Needs:*` edge, so it raises no new duplication or ownership question.
- **Overlap tool.** It reports no dropped id, no id that only an open revision defines, and no id this pull request drops. #1907 is the only other open pull request on this roadmap (R01).

### Adversarial table

Rows marked "r36" are carried from the previous report (`PRREVIEW-ZerosOfLFunctions~36`, which carried most of them from `~35`) for statements this diff leaves untouched, with the values computed there. The rows marked "this review" cover the changed passage.

| Statement | Instances | Values computed (each side) | Result |
| --- | --- | --- | --- |
| 0.1 `OrderLE` (r36) | `exp z²` at order 1; `1/Γ(−n−½)`; `A < 0` | `e^{r²}/e^{r^{3/2}} → ∞`; `‖1/Γ(−n−½)‖ = Γ(n+3/2)/π`; `A' < 0` forces constant | holds |
| `zetaEntireCompletion` (r36) | `s = 0, 1` | `1`, `1`; raw `s(s−1)Λ` gives `0` | holds |
| 1.1 `logGamma` (r36) | `s = 3`; three rays | `0.6931472 = log 2`; `r = 5.5391, 4.1516, 12.6266` | holds |
| 1.2 Stirling (r36) | DLMF sector | remainder `≤ sec²(½ ph z)/(12‖z‖)` (`dlmf5` lines 104–108, 563–569) | holds |
| 1.3a (r36) | `Re s = ½`; `−½` | `‖Γ(½+it)‖² = π/cosh πt ≤ π`; `Γ(−½) = −2√π` | holds |
| 1.4a (r36) | `s = 2`; `s = −2`; `ψ(i)` | `1.41509 = 1.41509`; `−0.1647 ≠ 0.5541`; `Im ψ(i) = 2.07667` | holds |
| 2.2 (r36) | `ζ` on `[−5, 5]` | `C₁ = 1`, `C₂ = 8/3` | holds |
| 2.3 (r36) | weight `w` | `N^{−s/2}·N^{−w/4} = N^{−(s+w/2)/2}` | holds |
| 2.4 (r36) | `Δ` | `90` against `15.75` unshifted | holds |
| 2.5 (r36) | `ℚ(i)`; `χ₋₄` | `48`; `16` against `4` | holds |
| 3.1 (r36) | `R = 0`, `c = α = 1` | `0.2194 < 0.3679 < 1` | holds |
| 3.4 exponent (r36) | `σ = ½` | `(½+δ)²/(1+2δ) = ¼ + δ/2` | holds |
| 3.5 (r36) | `m = 10, 20` | `3.676796`, `13519751.806` | holds |
| 4.1 (r36) | `z(z−1)`; `z/(z−1)`; `sin πz` on `ℝ` | `2`; `1` against `0`; `finsum` `0` | holds |
| 4.3 (r36) | `z`; `z/10`; `1 − z/2` | bounds `2, 3.32, 1.71` against counts `1, 1, 0` | holds |
| 4.6 (r36) | `z²(z−3)` | `1.386 ≤ 1.674`; `1.5325 = 1.5325` | holds |
| 5.2 `E₁` (r36) | `z = −½` | `0.090204 ≤ 0.125`; genus 0 gives `0.5` | holds |
| `hadamard_of_orderLE_one` (r36) | `exp`; `1 − s`; `ρ = 0` | `(0, 1)`; `(0, −1)`; factor `1` | holds |
| 5.6 (r36) | `ξ`; `e^s ξ`; `χ₄` | `b = −0.0230957`; ratio `e`; `Λ(0) = Λ(1) = ½` | holds |
| `riemannZeta_zeros_summable_ordinate` (r36) | first pair; `−2` | `0.00996`; divisor `0` | holds |
| `heckeLFunction_zeroFreeRegion` (r36) | `n = 0`; nesting; `ψ = 1` at `1` | no field; `1.26186 < 1.27`; order `−1` | holds |
| `riemannZeta_zeroFreeRegion` (r36) | trivial zeros; `s = 1` | `Re −2 < 1 − c/log 3`; excluded | holds |
| `dirichletLFunction_zeroFreeRegion` (r36) | `χ₀` mod 2, 6; mod 6 from mod 3 | `0.69343`; `2.89037`; `3.81097`; cap `0.54931` | holds |
| `neg_re_logDeriv_riemannZeta_le` (r36) | `t → 0`, `δ = 2|t|` | `1/(4|t|)`; `≤ 0.5700` against `≥ −1 + C log t₀` | holds |
| 6.4d over `K` (r36) | termwise | `≤ n(−ζ'/ζ)(2)` for `σ ≥ 2` | holds |
| 6.4d reduction (r36) | zero terms at real `σ > 1` | `Re 1/(σ − ρ) = (σ−β)/|σ−ρ|² > 0` for `β ≤ 1` | holds |
| 6.4d `−ζ'/ζ` at `1` (r36) | `u = 0.01, 0.001` | `−0.57534`, `−0.57603` against `−γ_E = −0.57722` | holds |
| 6.4d `ℚ(√D)` control (r36) | `σ = 1.1` | route needs `C < 7.882`; split `2` contributes `0.64673` | holds |
| 6.4d "no single field" (r36) | `ℚ(√5)`, `u = 0.1, 0.01, 0.001` | excess over `1/u`: `−1.288`, `−1.392`, `−1.403` | holds |
| 6.4 Check, `σ = 1.1`, `B = 10⁶` (r36) | as stated | `9.441036`; `8.882073`; `13.858098 > 13.85`; `½ϑ = 499242.09`; quadratic bound `18.882` | holds |
| 6.4 Check, `B = 10` (r36) | `D ≡ 1 (mod 1680)` | `1681 = 41²`; `3361` prime; residues `1, 1, 1, 1` | holds |
| 6.4d gamma term, `ζ` record at `s = 2` (this review) | `N = 1`, `gammaR = {0}` | `ψ(1)/2 − (log π)/2 = −0.8609728` (README `≈ −0.8610`); bound side `½ log 3 = 0.5493061` | holds |
| 6.4d gamma term, `ζ` record, `|t| → ∞` (this review) | `σ = 1.01, 1.5, 2`; `t = 10, 10², 10⁴, 10⁶` | gap `1.0510 / 0.93373 / 0.919089 / 0.918940`; `½ log 2π = 0.9189385` (README `≈ 0.9189`) | holds |
| 6.4d conductor counted once (this review) | `ℚ(√5)`: `N = 5`, `gammaR = {0, 0}`, `t = 0`, `s = 2` | gamma term `2 · (−0.86097) = −1.72195`; `½ log N + ½ log 9 = 0.80472 + 1.09861 = 1.90333 = ½ log 45`; double count gives `log 5 + ½ log 9 = 2.70805` | holds |
| 6.4d `Gammaℂ` factor (this review) | `ℚ(i)`, `gammaC = {0}`, `s = 2` | `ψ(2) − log 2π = −1.4150927`; `½ log ((0 + 3)(1 + 3)) = ½ log 12 = 1.2424533` | holds |
| 6.4d against Kadiri (this review) | (2.1.2), `kadiri2012` line 237 | `½ log d_K` and `Re γ_K'/γ_K` are separate terms | holds |
| 6.5 (r36) | `χ₄` at `1` | `½`, order `0` | holds |
| 7.1–7.2 (r36) | `z`; `z − 2`; `1/z` | `1 = 1`; `0`; `−1` against `0` | holds |
| 7.3 (r36) | `f = z` | `θ₀ = −3π/4`, `θ₄ = 5π/4`, `5/8` | holds |
| `riemannVonMangoldt` (r36) | `T = 2, 100` | `−0.6827` against `0`; `28.127` against `29` | holds |
| `riemannVonMangoldt_heckeLFunction` (r36) | `ℚ`, `ψ = 1` | open-strip count `2N(T)`; `0.693n` absorbs `23.108n + 4.520` | holds |
| `riemannVonMangoldt_dirichlet` (r36) | `q ≥ 3`; `q = 1` | `6.894 ≤ 3.85 log qT`; `modOne` | holds |
| 7.5 confinement (r36) | `1 + 5·2^{−s} + 2·4^{−s}` | `Re 2.18953`, `−1.18953` | holds |
| 8.2–8.3 (r36) | `ℚ`; `ℚ(i)`, `x = 2` | `−1.8379`; `0.6931` | holds |
| `chebyshevPsi_explicitFormula` (r36) | `x = T = 2` | `0.6931` against `0.3060`; gap `0.387 ≤ 0.4805C` | holds |
| `riemannZeta_weilExplicitFormula` (r36) | rederived; `φ = 0` | term by term; `0 = 0` | holds |
| `primeIdealCount_effective` (r36) | `ℚ`, `x = 10, 10⁶`; `ℚ(i)` | `2.4849 ≤ 12.094`; `1102.42 ≤ 137682.40`; `1.386 ≤ 24.19` | holds |
| 8.6 (r36) | quartic `χ` mod 5 | `−0.3466i` against `+0.3466i` | holds |
| `rayClassPrimeCount_effective` (r36) | `q = 1, 3, 10⁶`; `(4)∞`, `x = 9` | `0.696, 2.496, 190.868`; `3.0445` against `4.1431` | holds |
| `primeCounting_progression_effective` (r36) | `q = 4`, `x = 20` | `4` against `4.4301` | holds |
| `frobeniusPrimeCount_effective_abelian` (r36) | `ℚ(i)/ℚ` | coefficient `½` on `p ≡ 3 (mod 4)` | holds |
| 8.8 (r36) | `(8)∞` | `ker Φ = {1, 5}`; `χ₈(5) = −1` | holds |
| 8.9 `Li` (r36) | `x = 10, 10⁴` | `5.12044`; `3.66288`; `0.77749` against `1.88612` | holds |
| `dirichletLFunction_convexity` (r36) | `q = 1, 2` | `ζ(½) = −1.4604`; none modulo `2` | holds |
| 9 GRH bridge (r36) | `−2`; `1` | divisor `0`, `−1` | holds |

## Not verifiable

- **Iwaniec–Kowalski, Titchmarsh and Lagarias–Odlyzko 1977.** These are paywalled books or proceedings with no key in `sources.toml`. The changed passage cites none of them; see the earlier reports.
- **Uncertified keys.** `davenport2000`, `lang1994` and `lagarias1979` are settled as uncertified and cited by locator. The changed passage cites none of them.

## Source issues

- **Misprint** in kadiri2012 at §1, display (1.6), arXiv p. 2: the source says Lagarias–Montgomery–Odlyzko show Hecke L-functions have no zero at all in region (1.6); it should say no zero there except possibly the single real zero allowed by (1.5); affects nothing.
