# Review of ZerosOfLFunctions (pull request #1913 at df1d605)

**Verdict:** needs changes

This is an incremental re-review of the 21 lines of `TauCetiRoadmap/ZerosOfLFunctions/README.md` that changed since `a8d2e95`. `Suggested.lean` is unchanged, and nothing outside the folder changed. The previous R02 (the order of choices in the `ℚ(√D)` control of 6.4 (4d)) is repaired, and the repair is mathematically correct, with every value in its new Check recomputed. The previous R01 is not repaired and is carried below. It is P3 and concerns the pull-request description only. The gate passes and there is no blocking finding.

## R01 (P3) — No order is stated against #1907, which conflicts with this pull request in both files (previous R01, not repaired)

**Location.** The pull-request description ends "Merge order: no pending supplier." and never mentions #1907.

**Claim.** The description presents #1913 as independent of the other open work on this roadmap. It is not: #1907 (head `123254c` in the index of 2026-11-09T22:45:27Z) also revises `TauCetiRoadmap/ZerosOfLFunctions/`.

**Witness.** `git merge-tree --write-tree df1d605 123254c` reports `CONFLICT (content)` in `TauCetiRoadmap/ZerosOfLFunctions/README.md` and in `Suggested.lean`. The declaration sets also differ:
- only #1907 declares `completed_orderLE_one`, `dedekindZeta_zeroFreeRegion`, `finite_zero_sum_le_logDeriv`, `riemannVonMangoldt_dedekindZeta` and the `noncomputable def gammaLogDerivBound` (its `Suggested.lean` line 210);
- only this head declares `riemannZeta_zeros_summable_ordinate` and `neg_re_logDeriv_riemannZeta_le`.

**Repair.**
- Add one sentence to the description saying which of #1913 and #1907 merges first, and that the other then rebases onto it.
- The pull request that rebases says which of the seven declarations above it keeps. The two Dedekind statements of #1907 are already covered here by `heckeLFunction_zeroFreeRegion` and `riemannVonMangoldt_heckeLFunction` at the unit character `1`.
- Test: the description names #1907 and an order.

No repair report marks this finding `not actionable in this package`: the package's `reports/` folder holds only review and gate reports.

## Previous findings

- R01 — not repaired: the description still ends "Merge order: no pending supplier." and names neither #1907 nor an order. `git merge-tree` of `df1d605` and `123254c` still conflicts in both files. Carried as R01.
- R02 — repaired: README lines 1689–1699 now say "the witness chooses `σ` before the field". They fix `σ`, then `B`, then a prime `D ≡ 1 (mod 8 ∏_{p ≤ B} p)`, and explain why no fixed `D` works as `σ → 1⁺`.

## Verified sound

### The repair of R02: 6.4 (4d), README lines 1689–1699

Each step was checked separately.

1. **Reduction.** Without `½ log |d_K|`, the `t = 0` bound gives `−(logDeriv ζ_K)(σ) ≤ 1/(σ − 1) + C` for quadratic `K`, with `C` absolute because (4d)'s constants depend on `n = 2` alone. The step is valid: for a zero `ρ = β + iγ` of `Λ_K` with `β ≤ 1 < σ`, the term `Re (1/(σ − ρ)) = (σ − β)/|σ − ρ|²` is positive, so dropping the subtracted sum only weakens the bound.
2. **The expansion of `−ζ'/ζ` at `1`.** `ζ(s) = 1/(s − 1) + γ_E + O(s − 1)` gives `−ζ'/ζ(s) = 1/(s − 1) − γ_E + O(s − 1)`. Numerically, `−ζ'/ζ(1 + u) − 1/u` is `−0.57534` at `u = 0.01` and `−0.57603` at `u = 0.001`, against `−γ_E = −0.57722`.
3. **The order of choices.** First `σ`, so that `2(−ζ'/ζ)(σ) − 1/(σ − 1) = 1/(σ − 1) − 2γ_E + O(σ − 1)` exceeds `C + 1`. Then `B`, from a convergent tail. Then `D`, which needs Dirichlet's theorem: the pin has it as `Nat.forall_exists_prime_gt_and_eq_mod` (`Mathlib/NumberTheory/LSeries/PrimesInAP.lean:443`, hypothesis `IsUnit a`, here `a = 1`).
4. **Splitting.**
   - A prime `D ≡ 1 (mod 4)` gives `d_K = D`.
   - `D ≡ 1 (mod 8)` splits `2`.
   - For odd `p ≤ B`, `D ≡ 1 (mod p)` gives `p ∤ D` and `(D/p) = 1`, so `p` splits.
5. **The lower bound.** At norm `p^j` the only prime-power ideals are `𝔭^j` and `𝔭'^j`, each with `Λ_K = log p`, so a split `p` contributes `2 log p · p^{−jσ}`. Since `p^j ≤ B` forces `p ≤ B`, the result is `≥ 2(−ζ'/ζ)(σ) − 2·tail > 1/(σ − 1) + C`. Every other term is nonnegative.
6. **No single field.** For fixed `D`, `ζ_K = ζ · L(·, χ_D)` and `L(1, χ_D) ≠ 0`. Computed for `K = ℚ(√5)`:
   - `L(1, χ₅) = 0.430409`, which is `2 log φ/√5`;
   - `−(logDeriv ζ_K)(1 + u) − 1/u` is `−1.2884`, `−1.3923` and `−1.4026` at `u = 0.1`, `0.01` and `0.001`, so it stays bounded;
   - the earlier wording's `2/u` would be `20`, `200` and `2000`.

### The new Check: README lines 1776–1782

Recomputed in plain Python, using Euler–Maclaurin for `ζ` and a sieve to `10⁶`:

| Quantity | README | Computed |
| --- | --- | --- |
| `−(ζ'/ζ)(1.1)` | `≈ 9.4410` | `9.441036` |
| `2(−ζ'/ζ)(1.1) − 10` | `≈ 8.882` | `8.882073` |
| `2 ∑_{p^j ≤ 10⁶} log p · p^{−1.1 j}` | `≈ 13.858` | `13.858098` (above `13.85`, so `C < 3.85` is refuted) |
| tail `∑_{n > 10⁶} Λ(n) n^{−1.1}` | not stated | `2.511987`, against the integral estimate `10 · 10^{−0.6} = 2.511886` |
| `½ ϑ(10⁶)` | `≈ 4.99 · 10⁵` | `499242.09`; `D > 8 ∏_{p ≤ 10⁶} p` gives `½ log D > ½ ϑ(10⁶)` |
| least prime `≡ 1 (mod 1680)` | `3361` | `3361` (`1681 = 41²` is not prime) |
| `3361 mod 8`, `(3361/3)`, `(3361/5)`, `(3361/7)` | `1`, `1`, `1`, `1` | `1`, `1`, `1`, `1` |

- **Consistency with the bound.** For quadratic `K`, a termwise comparison gives `−(logDeriv ζ_K)(1.1) ≤ 2 · 9.441 = 18.882`. That is far below `10 + 4.99 · 10⁵`, so the Check's "untouched" is right.
- **Consistency with the route.** At `σ = 1.1` the route needs `C < 18.882 − 11 = 7.882`, and `2·tail < 1` needs `B ≳ 20^{10} ≈ 10^{13}`. The Check instead computes the partial sum at `B = 10⁶` directly and refutes only `C < 3.85`. The two agree.

### Notation, gate, build, dependency check

- **Notation.** Every symbol the changed text uses is used elsewhere in the README:
  - `Λ_K(𝔞)` at lines 270, 370 and 373;
  - `ϑ` at lines 329 and 404;
  - `γ_E` at lines 785 and 1477;
  - `logDeriv ζ_K` at line 1677.
- **Other citers.** The other citers of 6.4d are README lines 918 and 2580 and `Suggested.lean` lines 38 and 201. All of them cite the (4d) statement, which the change leaves as it was.
- **Gate.** Re-run on `df1d605`. Every check is at `0`, including `outside-folder`, `stray-files` and `statement-hygiene`, and it ends `OK`. `git diff --stat a8d2e95 HEAD` touches only `README.md` (+18 −3). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ZerosOfLFunctions'` is empty.
- **Build.** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits `0`. Its only output is 17 "declaration uses `sorry`" warnings, at lines 99, 111, 125, 138, 156, 175, 190, 207, 220, 234, 252, 267, 283, 301, 315, 336 and 350, the same as at `a8d2e95`.
- **Dependency check.** Output: `depcheck: 236 roadmaps, 2268 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Signatures and padding.** `Suggested.lean` is byte-identical to `a8d2e95`, so the previous review's `#check @name` comparison of all 20 declarations and its one-tactic probe stand. The worker's elaborated-signature listing reports 0 lost binders.

### Seeded sample

None of the 15 seeded targets (0.2, 0.3, 1.3a, 1.5, 2.3, 4.1, 4.3, 4.6, 5.3, 5.4, 5.6, 6.2, 7.4, 8.6, 8.9) falls in the changed passages. Spot checks:
- **6.2.** The README cites Kadiri Theorem 1.1 for regions with `|Im s| ≥ 1` and `|Im s| ≤ 1` when `d_K` is large. That is `kadiri2012` lines 79–80, with the abstract at lines 9–16.
- **Kadiri §2.1.2.** Behind (4d), Kadiri §2.1.2 (`kadiri2012` lines 230–237) has the terms `½ log d_K`, `Re 1/s`, `Re 1/(s − 1)`, the gamma term and `−∑ Re 1/(s − ρ)`, as the changed text uses them.
- **Previous review.** It verified 4.1, 5.6, 8.6 and 8.9; those passages are unchanged.

### Duplication, ownership, overlaps

- **Duplication and ownership.** The change adds no definition, theorem or supplier citation, so it raises no new duplication or ownership question.
- **Overlap tool.** It reports no dropped id, no id that only an open revision defines, and no id this pull request drops. #1907 is the only other open pull request on this roadmap (R01).

### Remark on untouched text (no change requested)

README lines 1681–1685, the route of (4d), list `½ log N` among the terms of the expansion. They then say that 1.4 bounds the gamma term by `½ log analyticConductorAt d (it) + O(1)`. Taken literally, the two pieces add up to `log N + ½ log (archimedean factors)`, more than the stated `½ log analyticConductorAt d (it) + O(1)`. The intended bound for the gamma term is `½ log (analyticConductorAt d (it)/N) + O(1)`. The stated (4d) bounds themselves are right: at `t = 0` and `σ ∈ (1, 2]`, Kadiri's formula gives `½ log d_K + O(n)`.

### Adversarial table

Rows marked "r35" are carried from the previous report (`PRREVIEW-ZerosOfLFunctions~35`) for statements this diff leaves untouched, with the values computed there. The rows marked "this review" are new and were computed for this review.

| Statement | Instances | Values computed (each side) | Result |
| --- | --- | --- | --- |
| 0.1 `OrderLE` (r35) | `exp z²` at order 1; `1/Γ(−n−½)`; `A < 0` | `e^{r²}/e^{r^{3/2}} → ∞`; `‖1/Γ(−n−½)‖ = Γ(n+3/2)/π`; `A' < 0` forces constant | holds |
| `zetaEntireCompletion` (r35) | `s = 0, 1` | `1`, `1`; raw `s(s−1)Λ` gives `0` | holds |
| 1.1 `logGamma` (r35) | `s = 3`; three rays | `0.6931472 = log 2`; `r = 5.5391, 4.1516, 12.6266` | holds |
| 1.2 Stirling (r35) | DLMF sector | remainder `≤ sec²(½ ph z)/(12‖z‖)` (`dlmf5` lines 104–108, 563–569) | holds |
| 1.3a (r35) | `Re s = ½`; `−½` | `‖Γ(½+it)‖² = π/cosh πt ≤ π`; `Γ(−½) = −2√π` | holds |
| 1.4a (r35) | `s = 2`; `s = −2`; `ψ(i)` | `1.41509 = 1.41509`; `−0.1647 ≠ 0.5541`; `Im ψ(i) = 2.07667` | holds |
| 2.2 (r35) | `ζ` on `[−5, 5]` | `C₁ = 1`, `C₂ = 8/3` | holds |
| 2.3 (r35) | weight `w` | `N^{−s/2}·N^{−w/4} = N^{−(s+w/2)/2}` | holds |
| 2.4 (r35) | `Δ` | `90` against `15.75` unshifted | holds |
| 2.5 (r35) | `ℚ(i)`; `χ₋₄` | `48`; `16` against `4` | holds |
| 3.1 (r35) | `R = 0`, `c = α = 1` | `0.2194 < 0.3679 < 1` | holds |
| 3.4 exponent (r35) | `σ = ½` | `(½+δ)²/(1+2δ) = ¼ + δ/2` | holds |
| 3.5 (r35) | `m = 10, 20` | `3.676796`, `13519751.806` | holds |
| 4.1 (r35) | `z(z−1)`; `z/(z−1)`; `sin πz` on `ℝ` | `2`; `1` against `0`; `finsum` `0` | holds |
| 4.3 (r35) | `z`; `z/10`; `1 − z/2` | bounds `2, 3.32, 1.71` against counts `1, 1, 0` | holds |
| 4.6 (r35) | `z²(z−3)` | `1.386 ≤ 1.674`; `1.5325 = 1.5325` | holds |
| 5.2 `E₁` (r35) | `z = −½` | `0.090204 ≤ 0.125`; genus 0 gives `0.5` | holds |
| `hadamard_of_orderLE_one` (r35) | `exp`; `1 − s`; `ρ = 0` | `(0, 1)`; `(0, −1)`; factor `1` | holds |
| 5.6 (r35) | `ξ`; `e^s ξ`; `χ₄` | `b = −0.0230957`; ratio `e`; `Λ(0) = Λ(1) = ½` | holds |
| `riemannZeta_zeros_summable_ordinate` (r35) | first pair; `−2` | `0.00996`; divisor `0` | holds |
| `heckeLFunction_zeroFreeRegion` (r35) | `n = 0`; nesting; `ψ = 1` at `1` | no field; `1.26186 < 1.27`; order `−1` | holds |
| `riemannZeta_zeroFreeRegion` (r35) | trivial zeros; `s = 1` | `Re −2 < 1 − c/log 3`; excluded | holds |
| `dirichletLFunction_zeroFreeRegion` (r35) | `χ₀` mod 2, 6; mod 6 from mod 3 | `0.69343`; `2.89037`; `3.81097`; cap `0.54931` | holds |
| `neg_re_logDeriv_riemannZeta_le` (r35) | `t → 0`, `δ = 2|t|` | `1/(4|t|)`; `≤ 0.5700` against `≥ −1 + C log t₀` | holds |
| 6.4d over `K` (r35) | termwise | `≤ n(−ζ'/ζ)(2)` for `σ ≥ 2` | holds |
| 6.4d reduction (this review) | zero terms at real `σ > 1` | `Re 1/(σ − ρ) = (σ−β)/|σ−ρ|² > 0` for `β ≤ 1` | holds |
| 6.4d `−ζ'/ζ` at `1` (this review) | `u = 0.01, 0.001` | `−0.57534`, `−0.57603` against `−γ_E = −0.57722` | holds |
| 6.4d `ℚ(√D)` control, order `σ`, `B`, `D` (this review) | `σ = 1.1` | route needs `C < 7.882`; split `2` at `j = 1` contributes `2 log 2 · 2^{−1.1} = 0.64673` | holds |
| 6.4d "no single field" (this review) | `ℚ(√5)`, `u = 0.1, 0.01, 0.001` | excess over `1/u`: `−1.288`, `−1.392`, `−1.403`, against `1/u` for the old claim | holds |
| 6.4 Check, `σ = 1.1`, `B = 10⁶` (this review) | as stated | `9.441036`; `8.882073`; `13.858098 > 13.85`; `½ϑ = 499242.09`; quadratic upper bound `18.882` | holds |
| 6.4 Check, `B = 10` (this review) | `D ≡ 1 (mod 1680)` | `1681 = 41²`; `3361` prime; residues `1, 1, 1, 1` | holds |
| 6.5 (r35) | `χ₄` at `1` | `½`, order `0` | holds |
| 7.1–7.2 (r35) | `z`; `z − 2`; `1/z` | `1 = 1`; `0`; `−1` against `0` | holds |
| 7.3 (r35) | `f = z` | `θ₀ = −3π/4`, `θ₄ = 5π/4`, `5/8` | holds |
| `riemannVonMangoldt` (r35) | `T = 2, 100` | `−0.6827` against `0`; `28.127` against `29` | holds |
| `riemannVonMangoldt_heckeLFunction` (r35) | `ℚ`, `ψ = 1` | open-strip count `2N(T)`; `0.693n` absorbs `23.108n + 4.520` | holds |
| `riemannVonMangoldt_dirichlet` (r35) | `q ≥ 3`; `q = 1` | `6.894 ≤ 3.85 log qT`; `modOne` | holds |
| 7.5 confinement (r35) | `1 + 5·2^{−s} + 2·4^{−s}` | `Re 2.18953`, `−1.18953` | holds |
| 8.2–8.3 (r35) | `ℚ`; `ℚ(i)`, `x = 2` | `−1.8379`; `0.6931` | holds |
| `chebyshevPsi_explicitFormula` (r35) | `x = T = 2` | `0.6931` against `0.3060`; gap `0.387 ≤ 0.4805C` | holds |
| `riemannZeta_weilExplicitFormula` (r35) | rederived; `φ = 0` | term by term; `0 = 0` | holds |
| `primeIdealCount_effective` (r35) | `ℚ`, `x = 10, 10⁶`; `ℚ(i)` | `2.4849 ≤ 12.094`; `1102.42 ≤ 137682.40`; `1.386 ≤ 24.19` | holds |
| 8.6 (r35) | quartic `χ` mod 5 | `−0.3466i` against `+0.3466i` | holds |
| `rayClassPrimeCount_effective` (r35) | `q = 1, 3, 10⁶`; `(4)∞`, `x = 9` | `0.696, 2.496, 190.868`; `3.0445` against `4.1431` | holds |
| `primeCounting_progression_effective` (r35) | `q = 4`, `x = 20` | `4` against `4.4301` | holds |
| `frobeniusPrimeCount_effective_abelian` (r35) | `ℚ(i)/ℚ` | coefficient `½` on `p ≡ 3 (mod 4)` | holds |
| 8.8 (r35) | `(8)∞` | `ker Φ = {1, 5}`; `χ₈(5) = −1` | holds |
| 8.9 `Li` (r35) | `x = 10, 10⁴` | `5.12044`; `3.66288`; `0.77749` against `1.88612` | holds |
| `dirichletLFunction_convexity` (r35) | `q = 1, 2` | `ζ(½) = −1.4604`; none modulo `2` | holds |
| 9 GRH bridge (r35) | `−2`; `1` | divisor `0`, `−1` | holds |

## Not verifiable

- **Iwaniec–Kowalski, Titchmarsh and Lagarias–Odlyzko 1977.** These are paywalled books or proceedings with no key in `sources.toml`. They are untouched by this diff; see the previous report.
- **Uncertified keys.** `davenport2000`, `lang1994` and `lagarias1979` are settled as uncertified and cited by locator. The changed text cites none of them.

## Source issues

- **Misprint** in kadiri2012 at §1, display (1.6), arXiv p. 2: the source says Lagarias–Montgomery–Odlyzko show Hecke L-functions have no zero at all in region (1.6); it should say no zero there except possibly the single real zero allowed by (1.5); affects nothing.
