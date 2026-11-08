# Review of ExplicitNumberFields (pull request #1944 at aef9b8c)

**Verdict:** needs changes

This is an incremental re-review of the 6 lines that changed since `016bb4a`, all in `TauCetiRoadmap/ExplicitNumberFields/README.md`:
- README.md:1323 adds `pntplus` to the locator of 1.1a's series identities.
- README.md:3529–3532 adds the reference entry for `pntplus`.
- A second commit deletes the `ieantn` entry, which no section cited.

`Suggested.lean` is unchanged, and nothing outside the folder changed. The gate passes, as do the dependency check and the elaboration. There is one P3 finding: the new citation is attached to two identities, but its source contains only one of them, and its locator is a file on a moving branch.

## R01 (P3) — `pntplus` is cited for both series identities but proves only the digamma one, and the locator names no declaration and no commit

**Location.**
- README.md:1323: "Prove the series identities (`dlmf` 5.7.6 and 5.15.1, `pntplus`): for `Re z > 0`,".
- README.md:3530–3532: "file `PrimeNumberTheoremAnd/Mathlib/Analysis/SpecialFunctions/Gamma/DigammaSeries.lean` (`pntplus`, cited for 1.1a)".

**Claim.** `pntplus` is cited for both identities:
- `ψ(z) = −γ + Σ (1/(n+1) − 1/(n+z))`;
- `ψ'(z) = Σ 1/(n+z)²`.

The reference entry points at a whole file on the repository's default branch, with no declaration and no commit.

**Witness.** At commit `9ecc1b6` the file's main statements are `Complex.hasSum_digamma`, `Complex.digamma_eq_tsum` and `Complex.hasSum_digamma_of_re_pos`; it has no trigamma series. The project deletes upstreamed files (commit `efed0f9`, "drop upstreamed CostaPereira").

**Repair.**
1. README.md:1323 becomes: "Prove the series identities (`dlmf` 5.7.6 and 5.15.1; the first also `pntplus` `Complex.hasSum_digamma_of_re_pos`): for `Re z > 0`,".
2. The reference entry ends: "file `PrimeNumberTheoremAnd/Mathlib/Analysis/SpecialFunctions/Gamma/DigammaSeries.lean` at commit `9ecc1b67cdbc36f4fab3ebeb5d6d25512392a078` (R. Sneiderman, 2026): `Complex.hasSum_digamma_of_re_pos`, `Complex.digamma_eq_tsum` and the term bound `Complex.norm_inv_add_one_sub_inv_le` (`pntplus`, cited for the digamma series of 1.1a)."

I tested the repair on a scratch copy of the folder with exactly these two edits:
- The gate's text checks print `OK`.
- `roadmaps resolve` lists no name or citation that it cannot find.
- The raw file at that full hash opens, and both theorems are there.

## Previous findings

- None. The previous report (at `016bb4a`) raised no finding. The two repairs it confirmed are unchanged at this head: README.md:1284–1285 (the Rademacher, Lee and Sunley locator of 1.1) and README.md:2636–2639 (the Cully-Hugill–Trudgian Corollary 1 locator of 5.4).

## Verified sound

### Gate, dependency check, elaboration

- **Gate.** I reran `gate … ExplicitNumberFields --base origin/main` at `aef9b8c`. It printed `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, with exit code 0. The worker's gate also reports `build=0`.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ExplicitNumberFields'` is empty.
- **Dependency check.** The output is `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)`. It has no UPWARD, CYCLE or `moved:` line.
  - The merge order lists ExplicitZetaBounds at 265, ExplicitMultiplicativeFunctions at 269 and ExplicitNumberFields at 270.
  - The changed passage cites no roadmap.
- **Elaboration.** `lake env lean` on a copy of `Suggested.lean` with `#check @name` appended for all 21 declarations gives 16 warnings, all "declaration uses `sorry`". There are no errors and no other warnings.
- **`#check @name`.** All 21 elaborated types agree with `signatures.md` up to notation (`rexp`/`exp`, `log⁺`/`posLog`, `𝓞 K`/`RingOfIntegers K`, `π`/`pi`). The file has no `variable` block, and I changed nothing.
  - In particular, `digamma_series_remainder` and `trigamma_series_remainder` carry `0 < z.re` and `1 ≤ N`.
  - They have the bounds `‖z − 1‖/(N − 1 + min 1 z.re)` and `1/(N − 1 + min 1 z.re)`, as at README.md:1327–1328.
- **One-tactic probe.** On a scratch copy, I replaced each `sorry` by `first | (simp; done) | rfl | (norm_num; done) | trivial | decide | infer_instance | (positivity; done) | (nlinarith; done) | sorry`. All 16 theorems still fall through to `sorry`, so nothing in the file is padding.

### The changed passages

**The series identities of 1.1a, at their sources.**
- DLMF 5.7.6 is at `dlmf` lines 252–256: the digamma series for `z ≠ 0, −1, −2, …`.
- DLMF 5.15.1 (`ψ'(z) = Σ_{k≥0} 1/(k+z)²`, same condition) is not in the cached extraction, which holds §5.7 only. I read it at dlmf.nist.gov/5.15.
- `pntplus`: I read the module docstring and the declaration headers of the file, on the default branch and at commit `9ecc1b67cdbc36f4fab3ebeb5d6d25512392a078`. Its licence is Apache 2.0, the file contains no `sorry`, and the Lean theorems are as R01 says.

**Uniform convergence on `{Re z ≥ a₀, |z| ≤ R}`.** I compared the README's term bound with `pntplus`'s at `z = 0.3 + 2i` (`a₀ = 0.3`, `R = |z|`), giving the actual term against `(R+1)/(n + a₀)²` (README.md:1351–1352) and against `(R+1)/(a(n+1)²)` (`Complex.norm_inv_add_one_sub_inv_le`):

| `n` | actual term | README bound | `pntplus` bound |
|---|---|---|---|
| 0 | `1.04776` | `33.582` | `10.075` |
| 1 | `0.44416` | `1.7884` | `2.5186` |
| 5 | `0.06234` | `0.10760` | `0.27985` |
| 50 | `0.000825` | `0.001195` | `0.003873` |

Both bounds dominate, and both are summable. The trigamma terms are at most `1/(n + a₀)²`, independently of `R`.

**Library at the pins.**
- Mathlib `Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean` (153 lines) has no series: there is no `tsum`, `HasSum` or `∑'` in it, and no `deriv digamma` or "trigamma" anywhere in the pinned Mathlib. Its declarations are:
  - `digamma` (line 48), `digamma_one` (56), `digamma_one_half` (59);
  - `digamma_apply_add_one` (64), `digamma_apply_add_nat` (72), `digamma_nat_add_one` (85);
  - `digamma_one_sub` (94), `meromorphic_digamma` (108), `digamma_two_mul` (124).
- The pinned Tau Ceti has no digamma or trigamma declaration.
- The Mathlib names on 1.1a's *Needs:* line resolve at the pin:

| Declaration | File and line |
|---|---|
| `Real.tendsto_harmonic_sub_log` | `NumberTheory/Harmonic/EulerMascheroni.lean:153`, namespace `Real` |
| `hasDerivAt_of_tendstoLocallyUniformlyOn` | `Analysis/Calculus/UniformLimitsDeriv.lean:489` |
| `HasDerivAt.real_of_complex` | `Analysis/Complex/RealDeriv.lean:47` |
| `Complex.differentiableOn_tsum_of_summable_norm` | `Analysis/Complex/LocallyUniformLimit.lean:171` |
| `Complex.hasSum_deriv_of_summable_norm` | `Analysis/Complex/LocallyUniformLimit.lean:182` |
| `AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq` | `Analysis/Analytic/IsolatedZeros.lean:234` |
| `Real.BohrMollerup.tendsto_log_gamma` | `Analysis/SpecialFunctions/Gamma/BohrMollerup.lean:293` |
| `Complex.Gamma_ofReal` | `Analysis/SpecialFunctions/Gamma/Basic.lean:419` |
| `Complex.differentiableAt_Gamma` | `Analysis/SpecialFunctions/Gamma/Deriv.lean:75` |
| `Complex.Gamma_ne_zero` | `Analysis/SpecialFunctions/Gamma/Beta.lean:427` |

**Keys.**
- `pntplus` occurs only at README.md:1323 and in its entry.
- No `ieantn` remains anywhere in the README, so the deletion leaves no dangling key.
- The new entry sits in alphabetical order, between Kerr–McGown–Trudgian and Lamzouri–Li–Soundararajan.

**Consumers of 1.1a.** None of these consumers changed, and the citation changes no statement:
- 4.3's sign of the gamma terms (README.md:2083);
- 4.5, 4.7, 4.8 and 7.2–7.4 through the remainders;
- ComputationalNumberTheory §4.18, which consumes `digamma_series_remainder` and `trigamma_series_remainder` (its README lines 125 and 401).

**Ownership of the series identities.**
- Mathlib and Tau Ceti at the pins: absent, as above.
- ZerosOfLFunctions 1.4 on main (README lines 478–484) has the digamma asymptotic and the gamma-factor logarithmic derivatives, but no series.
- ConformalMappingPartII 4.7 (#1407 at its head, README line 678) cites DLMF 5.7.6 without stating it as a target.
- Remark, not a finding. The ZerosOfLFunctions revision #1907 (README line 502 at its head) adds `ψ'(x) = Σ_{k≥0} (k + x)⁻²` for real `x > 0` and the monotonicity of `ψ` on `(0, ∞)`. This overlaps the real-axis bullet of 1.1a (README.md:1334–1336).
  - A revision is never a dependency.
  - 1.1a's complex identity on `Re z > 0`, which the complex remainders need, is not provided by it.
  - Once that revision merges, 1.1a's monotonicity bullet can cite ZerosOfLFunctions 1.4.
- Remark on untouched generality, passed by earlier reviews. DLMF 5.7.6, DLMF 5.15.1 and `pntplus` `Complex.hasSum_digamma` hold for every `z ∉ −ℕ`. 1.1a states the identities on `Re z > 0`, which is all that its remainders and consumers use.

**The seeded sample.**
- None of the 15 sampled targets (0.4, 0.6, 2.2, 2.3, 3.1, 3.4, 3.5, 4.2, 4.3, 4.8, 5.4, 5.7, 6.1, 6.4, 6.5) lies in the changed passages, and none cites them.
- 2.3 (README.md:1450–1488), 4.2, 4.3 and 6.5 are unchanged since the reviews that read them at their locators (r7, r8). Changes to the region of 5.7 since then were read by r9 and r10.
- I recomputed 2.3, 4.2 and 4.3 this round; see the table.
- The README flags no locator of its own as unverified. README.md:2022 reports that a source did not verify Trudgian's ranges; it is not a flag on a locator of this roadmap.

**Overlaps.** `overlaps.md` lists no open pull request that changes this roadmap, no dropped id and no id that only an open revision defines.

### Headline theorems

All 16 theorems of `Suggested.lean` are stated, and the module docstring names those that cannot be stated (unchanged):

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

- The first row has values computed this round for the changed statement.
- The rows for 2.3, 4.2 and 4.3 were recomputed this round on unchanged text.
- The rows for 5.7 and 6.5 carry forward earlier reports (r8, r7) for those sampled targets, which the previous table lacked.
- Every other row carries forward the previous report (r10, at `016bb4a`), which carried the rows of the review before it (r9) for untouched statements.

| Statement | Instances | Values (left vs right) | Result |
|---|---|---|---|
| 1.1a series identities (this round) | `z = 1/2, 1 + i, 0.5 + 3i, 0.01, 3`. Series summed to `2·10⁵` terms plus an asymptotic tail; `ψ` by recurrence and Stirling | `ψ`: `−1.963510026` both sides (`= −γ − 2 log 2`), `0.094650321 + 1.076674047i` both, `1.093886532 + 1.570796306i` both, `−100.560885458` both, `0.922784335` both (`= 3/2 − γ`). `ψ'`: `4.934802201` both (`= π²/2`), `0.463000097 − 0.794233543i` both, `0.000000129 − 0.336552753i` both, `10001.621213528` both, `0.394934067` both (`= π²/6 − 5/4`) | true on `Re z > 0` as stated |
| 2.3 `A_L(n)` (recomputed) | `n = 1, 2, 3, 13, 14` | `𝔪(1) = 0.7854 < 1` (undefined, so `n ≥ 2` is needed); `𝔪(2) = 2.4674`, `λ(2) = 1.47319·10⁹`, `A_L(2) = 2.49133·10¹⁰`; `A_L(3) = 8.45088·10¹¹`, both equal to `lee2023ideals` Table 1; `A_L(13) = 2.527·10³³` and `A_L(14) = 8.950·10³⁵`, both finite and positive across the change of formula at `n = 13` | matches |
| 4.2 HSW (recomputed) | `ℚ`, `T = 15`, `|γ| ≤ T` count `N = 2` | main term `−0.61988`; `|2 + 0.620 + 1/4| = 2.870 ≤ 27.771` | true |
| 4.3 constants (recomputed) | `m = 1`; `c₂` | `c₁ = 0.343146`, `c'₁ = 0.620756`, threshold `e^{1.241517} = 3.46085`; `c₂ = 1.071797` | matches the README |
| 5.7 (r8) | worst case `(1 − β) log d = c₀`; no zero | `κ ≥ c c₀/log d`; `c/log d ≥ c c₀/log d` since `c₀ ≤ 1/4` | `C = c min(c₀, 1/4)` |
| 6.5 (r7) | `A(10¹²)`, `A(10²³³)`; `h(3), h(5), h(7), h(40487)`; KMT condition (3) at `ω = 9`, `p = 10¹²` | `0.188846` (`5.21801·10⁶` at `q = 10¹²`), `0.160684`; `2, 2, 3, 10`; margin `≈ 8.2` with Rosser–Schoenfeld for `e < 26895` | matches |
| 1.1 Rademacher (r10) | `K = ℚ`, `η = 1/2` at `s = −1/2`, `−0.4`, `−0.4 + 5i`, `0.2 + 3i`; left edge `s = −1/2 + it` at `t = 1, 5, 20` | `0.2078862 = 0.2078862` (attained); `0.24717 < 0.36071`; `0.66415 < 6.15987`; `0.47909 < 5.29333`; `0.22307 < 0.86486`, `0.65636 < 6.03330`, `3.03346 < 24.89203` | `≤` on the closed strip, attained at `s = −η` |
| 1.1 Rademacher (r10) | `K = ℚ(i)` at `s = −1/2`; at `s = 1/2 + 10i` | `|ζ_K(−1/2)| = 0.057206 < 0.172867`; `|ζ_K| = 0.68773 ≤ 66.552` | true |
| 5.4 quartic bound (r10) | `Σ_{m≤x} τ₄(m)` at `x = 192, 193, 194, 200` | `9329 > 9300.72` (the threshold is needed); `9333 ≤ 9376.90`; `9349 ≤ 9453.28`; `9881 ≤ 9915.68` | true from `b ≥ 193` |
| 0.1 `μ_K`, `b_K` (r9) | `ℚ(i)`; `ℚ(√−14)`; `ℚ` | `μ = 0.6366`, `b = 1.273`; `b = 4.7640`; `μ_ℚ = 1` against `4/π` for the `r₁`-exponent model | as stated |
| 0.2 `Π_K(p)` (r9) | `ℚ(i)` at `2, 5, 3`; `ℚ` at `6`; quartic with `2` inert or ramified | `2`, `1.5625`, `9/8`; `3 > 6/5`; `1/15` against `2/16` | primes only; "iff" true |
| 0.3 class-number lemma (r9) | `ℚ(√−14)` at `b = 2.9` and at `b_K`; `n = 2` | `3 < 4`, `8 ≥ 4`; `27 ≤ 33.026`; `16 ≤ 22.545` | as stated |
| 0.4 `relativeClassNumber`, `classNumber_maximalRealSubfield_dvd` (r9) | `ℚ(i)`; `ℚ(ζ₈)`; `ℚ(√−5)` | `1`; `1.000`, `d_K/d_{K⁺} = 32`; `2` | true |
| 0.4a continued Euler product (r9) | `ℚ(i) ⊂ ℚ(ζ₈)`; `s = 0`; `s = 1` | imprimitive product vanishes at `2πi/log 2`; `−1/4 = −h/w`; `0` against `−0.977 κ_F` | primitive characters needed; `s ≠ 1` needed |
| 0.5 predicates (r9) | `q = 2`; `√d/log d`; `r = 0` | `Re s = 0` excluded; minimum `1.3591`; only `ℚ` | as stated |
| 0.6 `leastPrimePrimitiveRoot` (r9) | `p = 7, 409, 2791, 11971` | `(3,3), (21,29), (6,53), (10,79)` against `0.65, 18.22, 50.83, 107.41` | matches Checks |
| 1.1a remainders (r9) | `z = 3`; `1 + i`; trigamma at `(0.999, 50)`, `(0.1, 1)`, `(1, 1)` | `5/6 ≤ 2`; `0.60174 ≤ 1`; `0.019802 ≤ 0.02`, `1.43330 ≤ 10`, `0.644934 ≤ 1` | true; `min(1, Re z)` needed |
| 2.1 Widmer (r9) | `D = 1`; `D = 2` disc | `≤ 1 ≤ 2`; `128πR` | true |
| 2.2 `idealCount_sunley` (r9) | `ℚ(i)`, `x = 10`; `n = 1` | `9` against `7.854`, right side `> e^{61.4}`; `n = 1` excluded | true; `n ≥ 2` needed |
| 2.4 Debaene counts (r9) | cubic `−23`; `ℚ` | `1 + log(Rh) = −0.2687`, `log⁺` gives `1`; `|⌊x⌋ − x| ≤ 1` | true with `log⁺` |
| 2.5 ray-class count (r9) | `ℚ`, `𝔮 = (1)`, `(5)` | `3729.86` against `< 1`; `1144.25` without `2^{r₁}`; main term `x/5` | true |
| 3.1 (r9) | `ℚ(√5)` | `1 − β ≥ 0.359802`; kernel increasing iff `u ≥ 1/2` | `β ≥ 1/2` needed |
| 3.2 (r9) | cubic `−23` | `0.368409 ≤ 9.206` | true |
| 3.3 Friedman (r9) | `ℚ(ζ₅)`; cubic `−23`; `n = 1` | `0.339837 ≥ 0.032407`; `0.368409 ≥ 0.0756`; `2 < 4` | `n ≥ 2` needed |
| 3.4 Louboutin (r9) | `Λ_{{2}}`; thresholds | `8.492641`; `2293.01` against `36000`; `167.638`, `2682.208` | matches source |
| 3.5 Mertens lemma (r9) | `x = 1.048, 2, 7, 13.5` | `2.79859 ≤ 4.71341`; `0.60502 ≤ 1.42104`; `0.248963 ≤ 0.249988`; `0.125980 ≤ 0.155306` | true |
| 4.1 Trudgian (r9) | `ℚ`, `T = 15`; `ℚ(i)`, `T = 100` | `2.620 ≤ 10.67`; `156.64 ± 19.51` covers `[150.08, 166.68]` | true |
| 4.4 (r9) | `S⁴ + 2S³ − 2S² − 4S + 2` | `S₀ = 0.454334`, second root `1.221332`; `C₂ = 0.620756` | root in `[0, 1]` |
| 4.5 Kadiri (r9) | `ℚ`, `|t| = 14.13` | `0.98855` against `0.932`; `0.620732 < 0.620756` | consistent |
| 4.7 `starkAlpha`, Stark (r9) | `c₄`; `ℚ(ζ₇)⁺` | `43.162115`; `0.0014883 < κ = 0.30026` | true |
| 4.8 DGLSW (r9) | `n = 3`, `d = 23`; `n = 2` | denominator `8.0799`; `0.6207556 ≤ 0.6207565` | as stated |
| 5.1 (r9) | `ℚ(√5)`, `ℚ(i)`, `ℚ(√−3)` | `2.4456`, `2.3990`, `2.4697` | true |
| 5.2 (r9) | `ℚ(ζ₅)`; `d = 163`; `ℚ(√5)` | `9.808 ≥ 0.9624`; `13.23 ≥ 1`; `0.8997 ≥ 0.4812` | true |
| 5.3 `classNumber_le_bordelles` (r9) | `ℚ(√−14)`; cubic `−23`; `ℚ` | `60.246 ≥ 4`; `94.30 ≥ 1`; `1 ≤ 1` | true |
| 5.4 cubic bound (r9) | `τ₃` at `b = 1000, 100, 10, 2`; sign of `γ₁` | `29425 / 29964.17`, `1471 / 1552.33`, `53 / 66.41`, `4 ≤ 6.637`; `0.48633` against `0.04944` | true |
| 5.5 `relativeClassNumber_le` (r9) | `ℚ(i)`, `ℚ(√−3)`, `ℚ(√−5)`, `ℚ(ζ₈)` | `4.798`, `4.939`, `11.592 ≥ 2`, `12.717` | true |
| 5.6 (r9) | `ℚ(√−3)`, `c = 2` | `1.1077 > h = 1` | threshold needed, as stated |
| 6.1 Vinogradov (r9) | `ℤ/6`; `ℤ/2 × ℤ/2` | `1`, `0`; `−1` | cyclic only |
| 6.4 `leastPrimePrimitiveRoot_le_grh` (r9) | `p = 10⁹ + 7`; `1000000021` | `9894.6 < 31620.8`; `4.3635·10⁶` | true |
| 7.1 `primeIdeal_mertens_garciaLee` (r9) | `ℚ(i)`, `x = 10` | `0.916188`, with `e^{−γ}` `0.288816` | normalisation pinned |
| 7.2 (r9) | `ℚ(i)`, `x = 100` | `|ψ − x| = 6.07 ≤ 94.763` | true |
| 7.3 (r9) | `ℚ(i)/ℚ` | `log x ≥ 2801.0`, `λ_L = 1.9605` | matches source |
| 7.4 least prime ideal (r9) | `ℚ(i)/ℚ` | `3`, `5`; `241.6` | true |
| 7.5 `frobeniusPrimeCount_le_debaene` (r9) | `L = ℚ` at `x = 2, e, 10⁶` | `−56.78`; `5.437`; `7.09·10⁵ ≥ 78498` | `x > e`, `log⁺` needed |

### Counts

- I read three sources for the changed text: `dlmf` lines 252–256, DLMF §5.15 online, and the `pntplus` file at the default branch and at `9ecc1b6`.
- I opened 19 pinned Mathlib declarations: the 9 listed in `Digamma.lean` and the 10 in the *Needs:* table above.
- I resolved three cross-roadmap passages: ZerosOfLFunctions 1.4 on main and at the head of #1907, ConformalMappingPartII 4.7, and ComputationalNumberTheory §4.18.
- I elaborated 21 declarations, probed 16 theorems, and computed 4 adversarial rows this round.

### For the worker (outside this pull request, not reviewed)

The board's `sources.toml` for this package has no `pntplus` entry.

## Not verifiable

- The `pntplus` file was read through GitHub's raw view with a page reader. I read the declaration headers, the module docstring and the commit history of the path, but not the proofs. The repair rests only on the headers and on the absence of a trigamma statement, both of which I checked twice, at the default branch and at the pinned commit.
- These texts are recorded as uncertified or waived. They are untouched by the diff and were not read this round:
  - `rademacher1959`, `cullyhugilltrudgian2021` in print, `louboutin2000`, `louboutin2001`, `louboutin2015mmj`, `friedman1989`, `washington1997`, `stark1974`;
  - `lang1994`, `chen2022`, `ramare2001`, `ramare2025`, `palojarvisimonic2026`, `bachsorenson1996`, `mcgownsorenson2024`, `tudzi2026`, `leenosal2026`;
  - `lamzourilisoundararajan2015`, `kadiriwong2022`, `odlyzko1976`, `luzamanzhao2026`, `kadiring2012`, `cholemkeoliverzaman2025`, `amberger2026`, `openai2026siegel`, `kerr2026`, `green2026`.

## Source issues

- none
