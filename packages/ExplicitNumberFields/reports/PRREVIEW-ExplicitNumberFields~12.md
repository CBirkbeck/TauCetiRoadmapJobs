# Review of ExplicitNumberFields (pull request #1944 at 1af1d0f)

**Verdict:** accepted

This is an incremental re-review of the 9 lines that changed since `aef9b8c`, all in `TauCetiRoadmap/ExplicitNumberFields/README.md`:
- README.md:1323–1324 narrow the `pntplus` citation of 1.1a to the digamma series and name the theorem.
- README.md:3530–3535 pin the `pntplus` reference entry to a commit and name its two theorems.

`Suggested.lean` did not change, and nothing outside the folder changed. This report has no findings: R01 is repaired, the repair introduces no new problem, and the gate passes.

## Previous findings

- R01 — repaired. README.md:1323–1324 now reads "(`dlmf` 5.7.6 and 5.15.1; the digamma one also `pntplus` `Complex.hasSum_digamma_of_re_pos`)". README.md:3532–3535 pins commit `9ecc1b67…` and names `Complex.hasSum_digamma_of_re_pos` and `Complex.digamma_eq_tsum`.
  - The repair omits the term bound `Complex.norm_inv_add_one_sub_inv_le` that R01's repair text also listed. Nothing now cites `pntplus` for the convergence of the series, so the omission leaves no defect.

## Verified sound

### Gate, dependency check, elaboration

- **Gate.** I reran `gate … ExplicitNumberFields --base origin/main` at `1af1d0f`. It printed `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, with exit code 0. The worker's gate (`gate.md`) also reports `build=0`, and every check passed.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ExplicitNumberFields'` is empty. `git diff --stat aef9b8c..HEAD` reports one file, `README.md`, with 6 insertions and 3 deletions.
- **Dependency check.** The output is `depcheck: 239 roadmaps, 2358 edges, 0 problem(s)`, with exit code 0. It has no UPWARD, CYCLE or `moved:` line.
  - The merge order lists ExplicitZetaBounds at 265, ExplicitMultiplicativeFunctions at 269 and ExplicitNumberFields at 270.
  - The changed passages cite no roadmap.
- **Elaboration.** I ran `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` appended for all 21 declarations. It gives 16 warnings, all "declaration uses `sorry`", and no errors or other warnings.
- **`#check @name`.** A script compared the 21 elaborated types with `signatures.md` after normalising whitespace: 21 matched and 0 differed. The file has no `variable` block, and I changed nothing.
  - `digamma_series_remainder` and `trigamma_series_remainder` keep `0 < z.re` and `1 ≤ N`.
  - They keep the bounds `‖z − 1‖/(N − 1 + min 1 z.re)` and `1/(N − 1 + min 1 z.re)`, as at README.md:1328–1329.
- **One-tactic probe.** On a scratch copy, I replaced each of the 16 `sorry` by `first | (simp; done) | rfl | (norm_num; done) | trivial | decide | infer_instance | (positivity; done) | (nlinarith; done) | sorry`. All 16 still report "declaration uses `sorry`", so the file has no padding.

### The changed passages

**`pntplus` at the pinned commit.** The cached text was fetched from the raw file at commit `9ecc1b67cdbc36f4fab3ebeb5d6d25512392a078`; its sha256 is recorded in the board manifest.
- Lines 6–8: copyright 2026, Robby Sneiderman, Apache 2.0. This matches "(R. Sneiderman, 2026)".
- Lines 57 and 893: `namespace Complex` … `end Complex`, so the full names are `Complex.…`.
- Lines 355–357: `hasSum_digamma_of_re_pos {z₀ : ℂ} (hz₀ : 0 < z₀.re)` gives `HasSum (fun m ↦ (m+1)⁻¹ − (z₀+m)⁻¹) (digamma z₀ + γ)`. This is exactly 1.1a's digamma identity on `Re z > 0`.
- Lines 574–576: `digamma_eq_tsum` is the same identity as a formula, for `z ∉ −ℕ`.
- The file contains no `sorry`. It also has no trigamma series and no derivative of `digamma` (a grep for `trigamma` and `deriv digamma` finds nothing). The citation is therefore right to cover "the digamma one" only.
- The commit is on the upstream repository: the GitHub commit page reads "Bump to Lean/Mathlib v4.32.0 (#1638)", with no "does not belong to any branch" warning.

**The function in `pntplus` is Mathlib's `digamma`.** `pntplus` imports `Mathlib.Analysis.SpecialFunctions.Gamma.Digamma` and unfolds `digamma_def, logDeriv_apply` (line 475). At the pin, `Digamma.lean:48` defines `digamma := logDeriv Gamma`, and `:50` has `digamma_def`. This is the `ψ` of README.md:1317.

**`dlmf`.**
- 5.7.6 is at `dlmf` lines 252–256: the digamma series for `z ≠ 0, −1, −2, …`.
- 5.15.1, `ψ'(z) = Σ_{k≥0} 1/(k+z)²` with the same condition, I read at dlmf.nist.gov/5.15.

**Supplier discipline.** 1.1a's *Needs:* line (README.md:1372–1376) lists only Mathlib declarations and not `pntplus`, so the citation is not being used as a supplier.

**`roadmaps resolve` leads.** The two Lean names it lists, `Complex.hasSum_digamma_of_re_pos` (README 1324) and `Complex.digamma_eq_tsum` (README 3534), are `pntplus` names at its lines 355 and 574. Both occurrences attribute them to `pntplus`, and neither claims a declaration at the pins. The leads are false positives.

**Keys.**
- `pntplus` occurs only at README.md:1323 and in its entry (3530–3535).
- The entry stays in alphabetical order, between Kerr–McGown–Trudgian and Lamzouri–Li–Soundararajan.
- The board's `sources.toml` now records `pntplus`: url and `fetched_from` at the commit, `cited_for = ["1.1a (the digamma series)"]`, and a `version_note` that says "no trigamma series". This closes the previous report's note for the worker.

**Consumers of 1.1a.** The diff changes no statement and no Lean name, so nothing these consumers cite moves:
- 4.3 (README.md:2126), 4.5 (2196), 4.7 (2348), 4.8 (2402), 4.10 (2502), 7.2 (3312) and 7.3 (3356) cite "1.1a" by section number.
- ComputationalNumberTheory cites `digamma_series_remainder` and `trigamma_series_remainder` by name, at its README lines 124–125, 401, 2195–2196 and 2219 and at `Suggested.lean`:495–496 (its open head).

**Ownership of the series identities.**
- Pins: neither the pinned Mathlib nor Tau Ceti has `hasSum_digamma`, `digamma_eq_tsum` or `trigamma`, and Tau Ceti has no file that mentions `digamma`.
- Open roadmaps (`roadmaps grep`):
  - AnalyticNumberTheoryPartI README 1139 states Gauss's integral `digamma_eq_integral`, a different representation.
  - SpecialFunctionsEiLiErfIncompleteGamma README 922–925 and 1048–1052 use Mathlib's `Complex.digamma` with no series target.
  - ConformalMappingPartII README 1198 cites DLMF 5.7.6 as a source only.
- 1.1a remains the only owner, as its Scope says (README.md:54–56).

### The seeded sample

- None of the 15 sampled targets (0.3, 0.6, 2.1, 2.5, 2.7, 3.1, 3.2, 4.3, 4.8, 5.2, 5.6, 5.7, 6.3, 7.2, 7.3) lies in the changed lines.
- 4.3, 4.8, 7.2 and 7.3 depend on 1.1a; their *Needs:* lines are listed above, and the change alters nothing they use.
- The previous table had no rows for 2.7 and 6.3, so I computed them this round on unchanged text (see the table below).
- I matched 6.3's locators against `mcgowntrudgian2020`, and they agree with the README's hypotheses:
  - lines 59–60: Theorem 1, `p ≥ 10⁵⁶`, `r ≥ 2`;
  - line 72: Corollary 1;
  - line 85: Corollary 2;
  - lines 88–93: Theorem 2, `e` even, `δ > 0`;
  - lines 416–430: `W(p, h, r)` and Theorem 3, with `h ≥ 2`, `H ≥ 2h` and `2H² < hp`.
- The README flags none of its own locators as unverified.

### Declared gaps and overlaps

- The diff touches neither `## Exact supplier contracts` nor any `gap:` contract.
- `overlaps.md` lists no open pull request that changes this roadmap, no dropped id, and no id that only an open revision defines.

### Remarks on untouched text (no change requested)

- 2.7, README.md:1636–1637: "the term `ζ_K(0)`, which is nonzero only for imaginary quadratic fields". `ζ(0) = −1/2` is nonzero for `K = ℚ` too, since the order of `ζ_K` at `0` is `r₁ + r₂ − 1`. Within 2.7, where `K` is imaginary quadratic, nothing depends on this.
- Carried from the previous report: DLMF 5.7.6, DLMF 5.15.1 and `pntplus` `Complex.hasSum_digamma` hold for every `z ∉ −ℕ`. 1.1a states the identities on `Re z > 0`, which is all that its remainders and consumers use.

### Headline theorems

`Suggested.lean` did not change. Its 16 theorems state these headlines, and the module docstring names the headlines that cannot be stated at the pins:

| Target | Theorems |
|---|---|
| 0.4 | `classNumber_maximalRealSubfield_dvd` |
| 1.1a | `digamma_series_remainder`, `trigamma_series_remainder` |
| 2.2 | `idealCount_sunley` |
| 2.4 | `idealCount_debaene`, `classIdealCount_debaene` |
| 2.5 | `rayClassIdealCount_gunRamareSivaraman` |
| 3.3 | `dedekindZeta_residue_ge_friedman` |
| 4.7 | `dedekindZeta_residue_gt_stark` |
| 5.3 | `classNumber_le_bordelles` |
| 5.5 | `relativeClassNumber_le` |
| 6.4 | `leastPrimePrimitiveRoot_le_grh` |
| 7.1 | `primeIdeal_mertens_garciaLee` |
| 7.4 | `leastPrimeIdeal_ahnKwon`, `leastPrimeIdeal_kadiriNgWong` |
| 7.5 | `frobeniusPrimeCount_le_debaene` |

### Adversarial table

- The first two rows are computed this round for the changed statement, the 1.1a series identities with their new `pntplus` locator.
- The rows for 2.7 and 6.3 are computed this round on unchanged text, for the seeded sample.
- Every other row carries forward the previous report (r11, at `aef9b8c`), for statements the diff leaves untouched. The marker after r11 gives the round that computed the row.
- `ψ` was computed by recurrence and Stirling with Bernoulli terms. Each series was summed to `4·10⁵` terms, plus an Euler–Maclaurin tail.

| Statement | Instances | Values (left vs right) | Result |
|---|---|---|---|
| 1.1a digamma identity, cited to `pntplus` `hasSum_digamma_of_re_pos` (this round) | `z = 2, 0.5+0.5i, 5−2i, 0.05, 0.001+10i`; outside the domain, `z = i` | `ψ(z)` against `−γ + Σ(1/(n+1) − 1/(n+z))`: `0.4227843351` both (`= 1 − γ`); `−0.8681073626 + 1.4406595200i` both; `1.5953607461 − 0.4169611288i` both; `−20.4978449913` both; `2.3034142686 + 1.6206964933i` both; at `z = i`, `0.0946503206 + 2.0766740475i` both | true on `Re z > 0`, as stated and as in `pntplus` line 355 |
| 1.1a degenerate case in Lean (this round) | `z = 0`, with Mathlib's `0⁻¹ = 0` and `digamma_zero` (`Digamma.lean:53`) | series: the `n = 0` term is `1 − 0 = 1` and the rest telescopes to `−1`, total `0`; right side `digamma 0 + γ = 0.5772157` | false at `z = 0`, so `0 < z.re` (or `z ∉ −ℕ`) is needed, and both the README and `pntplus` carry it |
| 1.1a trigamma identity, `dlmf` 5.15.1 only (this round) | same `z` | `ψ'(z)` against `Σ 1/(n+z)²`: `0.6449340668` both (`= π²/6 − 1`); `0.7838024955 − 2.3518921986i` both; `0.1853453633 + 0.0818196330i` both; `401.5323573` both; `−0.0049900500 − 0.0998339966i` both | true on `Re z > 0` |
| 2.7 Checks (this round) | `ℚ(i)` at `X = 10, 100`; `ℚ(√−3)` at `X = 10`; `ζ_K(0)` at `d = 4, 3`; against 2.3 | counts `9` against `7.854`, error `1.146 ≤ 3.0162`; `79` against `78.540`; `6` against `6.0460`, `+1/6` gives `0.1207`; `−1/4 = −h/w`, `−1/6 = −h/w`; `A_L(2)·4^{1/3}·log 4 = 5.482·10¹⁰` | Checks match |
| 6.3 Checks (this round) | `g(p)` for `p = 3, 7, 23, 409`; `ω` bound at `10²²`; `δ` sums | `g = 2, 3, 5, 21` against `p^{5/8} = 1.9870, 3.3743, 7.0971, 42.887`; `p^{1/4} = 316228`, `2^{18} = 262144 <` it `< 2^{20}`, so `ω ≤ 8`; `Σ_{3..29} 1/q = 1.033439`, `Σ_{3..23} = 0.998956`, `δ = 0.00104`; `2·3⋯29 = 6469693230`; `0.999√p < √p − 2` iff `p > 4·10⁶`; at `p = 3`, `2H² ≥ 8h² > 3h` | Checks match; `p > 3` is sharp |
| 1.1a series identities (r11) | `z = 1/2, 1+i, 0.5+3i, 0.01, 3` | `ψ`: `−1.963510026`, `0.094650321 + 1.076674047i`, `1.093886532 + 1.570796306i`, `−100.560885458`, `0.922784335`, both sides each; `ψ'`: `4.934802201`, `0.463000097 − 0.794233543i`, `0.000000129 − 0.336552753i`, `10001.621213528`, `0.394934067`, both sides each | true |
| 2.3 `A_L(n)` (r11) | `n = 1, 2, 3, 13, 14` | `𝔪(1) = 0.7854 < 1`; `A_L(2) = 2.49133·10¹⁰`; `A_L(3) = 8.45088·10¹¹`; `A_L(13) = 2.527·10³³`, `A_L(14) = 8.950·10³⁵` | matches; `n ≥ 2` |
| 4.2 HSW (r11) | `ℚ`, `T = 15`, `N = 2` | `|2 + 0.620 + 1/4| = 2.870 ≤ 27.771` | true |
| 4.3 constants (r11) | `m = 1`; `c₂` | `c₁ = 0.343146`, `c'₁ = 0.620756`, threshold `3.46085`; `c₂ = 1.071797` | matches |
| 5.7 (r11 ← r8) | `(1 − β) log d = c₀`; no zero | `κ ≥ c c₀/log d`; `c/log d ≥ c c₀/log d` | `C = c min(c₀, 1/4)` |
| 6.5 (r11 ← r7) | `A(10¹²)`, `A(10²³³)`; `h(3), h(5), h(7), h(40487)` | `0.188846`, `0.160684`; `2, 2, 3, 10`; KMT margin `≈ 8.2` | matches |
| 1.1 Rademacher (r11 ← r10) | `ℚ`, `η = 1/2`, `s = −1/2, −0.4, −0.4+5i, 0.2+3i` | `0.2078862 = 0.2078862`; `0.24717 < 0.36071`; `0.66415 < 6.15987`; `0.47909 < 5.29333` | `≤`, attained at `s = −η` |
| 1.1 Rademacher (r11 ← r10) | `ℚ(i)`, `s = −1/2`; `s = 1/2 + 10i` | `0.057206 < 0.172867`; `0.68773 ≤ 66.552` | true |
| 5.4 quartic (r11 ← r10) | `Σ τ₄` at `x = 192, 193, 194, 200` | `9329 > 9300.72`; `9333 ≤ 9376.90`; `9349 ≤ 9453.28`; `9881 ≤ 9915.68` | true from `193` |
| 0.1 (r11 ← r9) | `ℚ(i)`; `ℚ(√−14)`; `ℚ` | `μ = 0.6366`, `b = 1.273`; `b = 4.7640`; `μ_ℚ = 1` against `4/π` | as stated |
| 0.2 (r11 ← r9) | `ℚ(i)` at `2, 5, 3`; `ℚ` at `6` | `2`, `1.5625`, `9/8`; `3 > 6/5` | primes only |
| 0.3 (r11 ← r9) | `ℚ(√−14)`, `b = 2.9` and `b_K`; `n = 2` | `3 < 4`, `8 ≥ 4`; `27 ≤ 33.026`; `16 ≤ 22.545` | as stated |
| 0.4 (r11 ← r9) | `ℚ(i)`; `ℚ(ζ₈)`; `ℚ(√−5)` | `1`; `1.000`, ratio `32`; `2` | true |
| 0.4a (r11 ← r9) | `ℚ(i) ⊂ ℚ(ζ₈)`; `s = 0`; `s = 1` | imprimitive zero at `2πi/log 2`; `−1/4 = −h/w`; `0` against `−0.977 κ_F` | primitive, `s ≠ 1` |
| 0.5 (r11 ← r9) | `q = 2`; `√d/log d`; `r = 0` | `Re s = 0` excluded; min `1.3591`; only `ℚ` | as stated |
| 0.6 (r11 ← r9) | `p = 7, 409, 2791, 11971` | `(3,3), (21,29), (6,53), (10,79)` against `0.65, 18.22, 50.83, 107.41` | matches |
| 1.1a remainders (r11 ← r9) | `z = 3`; `1+i`; trigamma `(0.999, 50)`, `(0.1, 1)`, `(1, 1)` | `5/6 ≤ 2`; `0.60174 ≤ 1`; `0.019802 ≤ 0.02`, `1.43330 ≤ 10`, `0.644934 ≤ 1` | `min(1, Re z)` needed |
| 2.1 Widmer (r11 ← r9) | `D = 1`; `D = 2` | `≤ 1 ≤ 2`; `128πR` | true |
| 2.2 (r11 ← r9) | `ℚ(i)`, `x = 10`; `n = 1` | `9` against `7.854`; `n = 1` excluded | `n ≥ 2` |
| 2.4 (r11 ← r9) | cubic `−23`; `ℚ` | `1 + log(Rh) = −0.2687`, `log⁺` gives `1`; `|⌊x⌋ − x| ≤ 1` | `log⁺` needed |
| 2.5 (r11 ← r9) | `ℚ`, `𝔮 = (1), (5)` | `3729.86` against `< 1`; `1144.25` without `2^{r₁}`; main term `x/5` | true |
| 3.1 (r11 ← r9) | `ℚ(√5)` | `1 − β ≥ 0.359802`; kernel increasing iff `u ≥ 1/2` | `β ≥ 1/2` |
| 3.2 (r11 ← r9) | cubic `−23` | `0.368409 ≤ 9.206` | true |
| 3.3 (r11 ← r9) | `ℚ(ζ₅)`; cubic `−23`; `n = 1` | `0.339837 ≥ 0.032407`; `0.368409 ≥ 0.0756`; `2 < 4` | `n ≥ 2` |
| 3.4 (r11 ← r9) | `Λ_{{2}}`; thresholds | `8.492641`; `2293.01` against `36000`; `167.638`, `2682.208` | matches |
| 3.5 (r11 ← r9) | `x = 1.048, 2, 7, 13.5` | `2.79859 ≤ 4.71341`; `0.60502 ≤ 1.42104`; `0.248963 ≤ 0.249988`; `0.125980 ≤ 0.155306` | true |
| 4.1 (r11 ← r9) | `ℚ`, `T = 15`; `ℚ(i)`, `T = 100` | `2.620 ≤ 10.67`; `156.64 ± 19.51` covers `[150.08, 166.68]` | true |
| 4.4 (r11 ← r9) | `S⁴ + 2S³ − 2S² − 4S + 2` | `S₀ = 0.454334`; `C₂ = 0.620756` | root in `[0, 1]` |
| 4.5 (r11 ← r9) | `ℚ`, `|t| = 14.13` | `0.98855` against `0.932`; `0.620732 < 0.620756` | consistent |
| 4.7 (r11 ← r9) | `c₄`; `ℚ(ζ₇)⁺` | `43.162115`; `0.0014883 < 0.30026` | true |
| 4.8 (r11 ← r9) | `n = 3`, `d = 23`; `n = 2` | denominator `8.0799`; `0.6207556 ≤ 0.6207565` | as stated |
| 5.1 (r11 ← r9) | `ℚ(√5)`, `ℚ(i)`, `ℚ(√−3)` | `2.4456`, `2.3990`, `2.4697` | true |
| 5.2 (r11 ← r9) | `ℚ(ζ₅)`; `d = 163`; `ℚ(√5)` | `9.808 ≥ 0.9624`; `13.23 ≥ 1`; `0.8997 ≥ 0.4812` | true |
| 5.3 (r11 ← r9) | `ℚ(√−14)`; cubic `−23`; `ℚ` | `60.246 ≥ 4`; `94.30 ≥ 1`; `1 ≤ 1` | true |
| 5.4 cubic (r11 ← r9) | `τ₃` at `b = 1000, 100, 10, 2` | `29425 ≤ 29964.17`, `1471 ≤ 1552.33`, `53 ≤ 66.41`, `4 ≤ 6.637` | true |
| 5.5 (r11 ← r9) | `ℚ(i)`, `ℚ(√−3)`, `ℚ(√−5)`, `ℚ(ζ₈)` | `4.798`, `4.939`, `11.592 ≥ 2`, `12.717` | true |
| 5.6 (r11 ← r9) | `ℚ(√−3)`, `c = 2` | `1.1077 > h = 1` | threshold needed |
| 6.1 (r11 ← r9) | `ℤ/6`; `ℤ/2 × ℤ/2` | `1`, `0`; `−1` | cyclic only |
| 6.4 (r11 ← r9) | `p = 10⁹ + 7`; `1000000021` | `9894.6 < 31620.8`; `4.3635·10⁶` | true |
| 7.1 (r11 ← r9) | `ℚ(i)`, `x = 10` | `0.916188`; `e^{−γ}` `0.288816` | pinned |
| 7.2 (r11 ← r9) | `ℚ(i)`, `x = 100` | `|ψ − x| = 6.07 ≤ 94.763` | true |
| 7.3 (r11 ← r9) | `ℚ(i)/ℚ` | `log x ≥ 2801.0`, `λ_L = 1.9605` | matches |
| 7.4 (r11 ← r9) | `ℚ(i)/ℚ` | `3`, `5`; `241.6` | true |
| 7.5 (r11 ← r9) | `L = ℚ` at `x = 2, e, 10⁶` | `−56.78`; `5.437`; `7.09·10⁵ ≥ 78498` | `x > e`, `log⁺` |

### Counts

- **Sources read this round:**
  - `pntplus` lines 6–8, 29–51, 57, 355–357, 475, 490–492, 574–576 and 893, plus a grep of the whole file;
  - `dlmf` lines 252–256, and DLMF §5.15 online;
  - `mcgowntrudgian2020` lines 59–60, 72, 85, 88–93 and 416–430;
  - the GitHub commit page of `9ecc1b6`.
- **Pinned Mathlib opened:** `Analysis/SpecialFunctions/Gamma/Digamma.lean` at lines 48 (`digamma`), 50 (`digamma_def`) and 53 (`digamma_zero`). I also grepped the pinned Mathlib and Tau Ceti for `hasSum_digamma`, `digamma_eq_tsum` and `trigamma`, with no match.
- **Cross-roadmap passages resolved:**
  - ComputationalNumberTheory README lines 124–125, 401, 2195–2196 and 2219, and its `Suggested.lean` lines 495–496;
  - AnalyticNumberTheoryPartI README line 1139;
  - SpecialFunctionsEiLiErfIncompleteGamma README lines 922–925 and 1048–1052;
  - ConformalMappingPartII README line 1198.
- **Lean:** 21 declarations elaborated and compared, and 16 theorems probed.
- **Adversarial rows computed this round:** 5.

## Not verifiable

- `ramare2025` is recorded as uncertified. For 2.7 I recomputed only the README's Checks, not Theorem 1.1 or Corollaries 1.4–1.6 at their locators. 2.7 is untouched by the diff.
- `mcgownsorenson2024` is recorded as uncertified. I did not recompute the record `g(6525032504501281) = 417` of 6.3's Checks; I computed only `p^{5/8} = 7.658·10⁹` for it.
- I read the `pntplus` declaration headers, its docstrings and the one proof line I cite (475), not the full proofs. The file contains no `sorry`.
- These texts are recorded as uncertified or waived. They are untouched by the diff and were not read this round:
  - `rademacher1959`, `cullyhugilltrudgian2021`, `louboutin2000`, `louboutin2001`, `louboutin2015mmj`, `friedman1989`, `washington1997`, `stark1974`;
  - `lang1994`, `chen2022`, `ramare2001`, `palojarvisimonic2026`, `bachsorenson1996`, `tudzi2026`, `leenosal2026`, `lamzourilisoundararajan2015`;
  - `kadiriwong2022`, `odlyzko1976`, `luzamanzhao2026`, `kadiring2012`, `cholemkeoliverzaman2025`, `amberger2026`, `openai2026siegel`, `kerr2026`, `green2026`.

## Source issues

- none
