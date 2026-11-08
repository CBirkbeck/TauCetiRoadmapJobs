# Review of ExplicitNumberFields (pull request #1944 at 4198f62)

**Verdict:** accepted

Scope: an incremental re-review of the 15 lines of `TauCetiRoadmap/ExplicitNumberFields/README.md` changed since `0990742` (two Checks of Layer 6: the `ω = 17` Check of 6.3 at lines 2636–2639 and the `ω(p − 1) = 14` Check of 6.4 at lines 2785–2793), and of the text that cites or depends on them (*McGownTrudgianOmegaChecks*, *McGownTrudgianWindowCheck*, *GrosswaldSieveVerification*, Bach's constant `c(p, x)`, the route of Grosswald's theorem under GRH, the source's window at `mcgowntrevinotrudgian2016` line 215). `Suggested.lean` is unchanged. Nothing outside the folder changed.

This report has no findings.

## Previous findings

- R01 — repaired: README.md:2786–2791 now read "`δ ≥ 1 − Σ_{4 ≤ i ≤ 14} 1/q_i ≥ 0.39296` (the sum is `0.607037` …) and the second alternative holds for every `p ≥ 1.71·10¹⁶` (at `p = 1.71·10¹⁶` with `δ = 0.39296` the left side is `1.30740·10⁸` …)".

## Verified sound

**The repaired Check of 6.4 (`ω(p − 1) = 14`), recomputed.** With `s = 11`, `ω − s = 3`, `x = √p − 2`, left side `(2 c(p, x)(2 + 10/δ) · 8 · log p)²` and `c(p, x)` as at README.md:2732 (checked against `mcgowntrevinotrudgian2016` lines 74–76):
- `q₁ ⋯ q₁₄ = 13082761331670030 = 1.308·10¹⁶`; `Σ_{i=4}^{14} 1/q_i = 0.6070366` (exact rational sum), so `δ ≥ 0.3929634 ≥ 0.39296`. The rational comparison confirms `0.39296` is a lower bound.
- At `p = 1.71·10¹⁶` and `δ = 0.39296` the left side is `1.3073974·10⁸`, below `√p − 2 = 1.3076697·10⁸`, and `c(p, √p − 2) = 0.696563`. The README gives `1.30740·10⁸`, `1.30767·10⁸` and `0.6966`, all correct.
- The left side decreases in `δ`, so `δ = 0.39296` bounds it from above for every admissible `p − 1`, which is the direction needed to show the alternative holds. The ratio of the two sides at `δ = 0.39296` is `0.99979` at `1.71·10¹⁶`, `0.93189` at `2·10¹⁶`, `0.45160` at `10¹⁷`, `0.019520` at `10²⁰` and `2.7·10⁻¹³` at `10⁴³`. It decreases monotonically on a grid of ratio `1.01` from `1.71·10¹⁶` to `10⁴³`. It also decreases analytically, because `c(p, √p − 2)` decreases (`0.696563 → 0.677889`) and `(log p)²/√p` decreases once `log p > 4`. So "holds for every `p ≥ 1.71·10¹⁶`" is true on the whole range `p < 10⁴³` of the predicate.
- At `p = 1.709·10¹⁶` the README's left side `1.30734·10⁸` is the value at the exact worst case `δ = 0.3929634` (`1.3073373·10⁸`). That is the right `δ` for showing failure, since a lower bound on `δ` would overstate the left side. At `δ = 0.39296` the value is `1.3073583·10⁸`. Either value exceeds `√p − 2 = 1.3072872·10⁸`.
- Threshold: at the exact `δ` the alternative first holds at `p = 1.709146·10¹⁶`; at `δ = 0.39296` it first holds at `1.709207·10¹⁶`. Both lie between `1.709·10¹⁶` and `1.71·10¹⁶`, as the README says, and both lie below the source's upper end `1.71·10¹⁶` (line 215: window `(1.30·10¹⁶, 1.71·10¹⁶)` for `n = 14`). With the old value `δ = 0.3930`, the ratio at `1.709·10¹⁶` would have been `0.99987`, which is the overstatement the parenthesis warns against.
- The sieve choice is consistent with the predicate at README.md:2728–2733 and with the source (lines 198–209: `s = n − 3` for `13 ≤ n ≤ 28`). `e`, the part of `p − 1` prime to its 11 largest prime factors, is even. Those factors are at least `q₄, …, q₁₄` respectively, so `δ ≥ δ_{14,11}`.

**The changed `ω = 17` Check of 6.3, recomputed.** `δ_{17,14} = 1 − Σ_{i=4}^{17} 1/q_i = 0.3358697`, which correctly rounds to `0.33587`. Left sides of (a), `13((2 + (s − 1)/δ) 2^{17−s})⁴`:
- `s = 12`: `2.811·10¹²`
- `s = 13`: `4.572·10¹¹`
- `s = 14`: `1.46189·10¹¹`, the least
- `s = 15`: `4.051·10¹¹`

This matches "least left side `1.462·10^{11}` at `s = 14`". `(q₁ ⋯ q₁₇)^{1/2} = 4.3849·10¹⁰`, matching `4.38·10^{10}`, and `(1.46189·10¹¹)² = 2.1371·10²²`, matching `2.14·10²²`. At `0.33587` the left side is `1.46189·10¹¹`; at the old `0.3359` it was `1.46139·10¹¹`. Both exceed `10¹¹`, so the conclusion that no `s` works at `ω = 17` is unaffected. The value is an equality to five places, not a bound.

**Gate and build.**
- `tauceti-roadmap … gate … ExplicitNumberFields --base origin/main`: every check `0` (set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material), result OK. The worker's gate on this head also reports build OK.
- `lake env lean TauCetiRoadmap/ExplicitNumberFields/Suggested.lean` gives exactly 13 warnings, all `declaration uses 'sorry'`, at lines 89, 122, 134, 146, 161, 182, 199, 211, 221, 235, 251, 272 and 286, and nothing else.
- `#check @name` for all 18 declarations on a scratch copy elaborates without error. The output is byte-identical, after whitespace normalisation, to `signatures.md`. No section binder is lost. The comparison with the README statements in the previous report stands, since `Suggested.lean` is unchanged.
- The one-tactic probe of the previous report (78 probes, none closes) stands for the same reason, so there is no padding.
- Outside-folder diff: none (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ExplicitNumberFields'` is empty).

**Dependency check.**

    depcheck: 244 roadmaps, 2465 edges, 0 problem(s)

There is no UPWARD, CYCLE or moved line. ExplicitNumberFields is line 274 of the order, after ExplicitZetaBounds (270), ExplicitPrimeCounting (271), ExplicitCharacterSumsAndSieves (272) and ExplicitMultiplicativeFunctions (273).

**Citations around the changed passages, resolved at the heads.**
- ExplicitMultiplicativeFunctions §9.1, cited at README.md:2660, 2688, 2757 and 2799: its heading is at line 3432 of its head. *PrimorialTableVerified* `26` is at lines 3436 and 3447 and is Layer 0.7's input (line 1006).
- ExplicitCharacterSumsAndSieves §4.1, cited at README.md:2649 and 2718: Burgess's moment bound, at line 1044 of its head.
- `citations.md` lists no cross-roadmap citation or Lean name found nowhere.
- `overlaps.md` reports no other pull request that changes this roadmap and no dropped id in either direction. The closest open roadmaps are the four suppliers and the ZerosOfLFunctions revision, which drops no id this README cites.
- The predicates *McGownTrudgianWindowCheck* (README.md:2633, 2639, 2659, 2687, 2717) and *GrosswaldSieveVerification* (2727, 2756, 2762, 2785, 2801) are used consistently with their definitions.

**Source read this round.** `mcgowntrevinotrudgian2016`:
- lines 68–76: Lemma 1, Bach's constant `c(p, x)`, `x ≥ 1`
- lines 185–210: Corollary 4, the choices of `s`
- line 215: the window for `n = 14`
- lines 241–243: Table 2, `0` exceptions for `n = 14`
- lines 252–255: the `68 030` exceptions

The README's descriptions match.

**Headline theorems.** These are unchanged and still stated:
- `classNumber_maximalRealSubfield_dvd`
- `idealCount_sunley`, `idealCount_debaene`, `classIdealCount_debaene`
- `rayClassIdealCount_gunRamareSivaraman`
- `dedekindZeta_residue_ge_friedman`, `dedekindZeta_residue_gt_stark`
- `classNumber_le_bordelles`, `relativeClassNumber_le`
- `leastPrimePrimitiveRoot_le_grh`
- `primeIdeal_mertens_garciaLee`
- `leastPrimeIdeal_ahnKwon`, `frobeniusPrimeCount_le_debaene`

The headlines that depend on the zeta function and the 6.3–6.5 bounds are named in the module docstring as not statable (previous report).

**Adversarial table.** The first two rows are new and cover the changed Checks. The other rows are the previous report's (r3), carried forward for statements the diff leaves untouched, with the values computed there.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 6.4 Check, *GrosswaldSieveVerification* at `ω = 14` (changed) | `δ = 0.3929634` (exact), `0.39296`, `0.3930`; `p = 1.709·10¹⁶, 1.70915·10¹⁶, 1.71·10¹⁶, 2·10¹⁶, 10¹⁷, 10²⁰, 10⁴³` | `Σ = 0.6070366`; at `1.71·10¹⁶`: `1.3073974·10⁸ < 1.3076697·10⁸`, `c = 0.696563`; at `1.709·10¹⁶`: `1.3073373·10⁸` (exact δ) and `1.3073583·10⁸` (`0.39296`) `> 1.3072872·10⁸`; thresholds `1.709146·10¹⁶`, `1.709207·10¹⁶`; ratio `0.99979 → 2.7·10⁻¹³`, monotone | sound |
| 6.3 Check, `ω = 17` (changed) | `s = 12, 13, 14, 15` | `δ_{17,14} = 0.3358697`; left sides `2.811·10¹²`, `4.572·10¹¹`, `1.46189·10¹¹`, `4.051·10¹¹`; `√(q₁⋯q₁₇) = 4.3849·10¹⁰`; square `2.1371·10²²` | sound |
| `classNumber_maximalRealSubfield_dvd`, `relativeClassNumber` (r3) | `ℚ(i)`, `ℚ(√−5)`, `ℚ(ζ₈)`; ℕ-division | `1∣1`, `1∣2`, `1∣1`; `3/2` truncates to `1` without the divisibility | sound |
| 0.4 formula (r3) | `ℚ(i)`, `ℚ(ζ₈)`, wrong power | `1·4·2·(π/4)/(2π) = 1`; `√32·0.8724·8/(4π²) = 1.00005`; `0.50001` | sound |
| `GRHMod` (r3) | `q = 1, 2, 4` | `q = 1`: RH; `q = 2`: zeros of `1 − 2^{−s}` on `Re s = 0` excluded by `0 < Re s` | sound |
| *UniformQuadraticZeroGap* (r3) | `c = 1/100`; `d = 10⁷, 9·10⁶`; `q = 1.3·10⁸, 1.2·10⁸` | `200/e = 73.576`; `196.19 ≥ 190.99`, `187.35` fails; `610.3 ≥ 603.5`, `588.9` fails | sound |
| `HasNormalTower`, `starkAlpha` (r3) | `ℚ(2^{1/4})`, `x⁴ − x − 1`, `ℚ`, `ℚ(ζ₇)⁺` | `16` (two-case rule `96`); `S₄`, no tower, `96`; `r = 0`; Galois, `4` | sound |
| `leastPrimePrimitiveRoot` (r3) | `m = 409, 2791, 11971, 2, 1` | `29`, `53`, `79`; `3`; junk `2` | sound |
| `idealCount_sunley` (r3) | `ℚ(i)`, `x = 10`; `n = 1` | `|9 − 7.854| = 1.146` vs `10^{31.06}`; right side `0` for `x < 1` at `n = 1` | sound |
| `idealCount_debaene`, `classIdealCount_debaene` (r3) | cubic `−23`; `ℚ(i)`; `ℚ` | `R = 0.281200`, `1 + log(Rh) = −0.2687`, `log⁺` gives `1`; `2⁴⁰ x^{1/2}`; bound `1` | sound |
| `rayClassIdealCount_gunRamareSivaraman` (r3) | `ℚ`, `𝔮 = (1)`, `(5)` | `F = 2`, `E = 1039.7`, bound `3729.9` (`1144.3` without `2^{r₁}`); main term `x/5` | sound |
| `dedekindZeta_residue_ge_friedman` (r3) | `ℚ(i)`, `ℚ(√5)`, `ℚ(ζ₅)`, cubic `−23` | `0.785 ≥ 0.181`; `0.430 ≥ 0.162`; `0.33984 ≥ 0.0324`; `0.3684 ≥ 0.0756` | sound |
| 3.1–3.6 (r3) | `ℚ(√5)`, cubic `−23`, Table 1, `x = 1.048…13.5`, `ℚ(√−5)`, `ℚ(√−14)` | `1.19624`; `9.206 ≥ 0.3684`; `2π²Λ₂ = 167.638`; `0.605016 < 1.421044`; `[0.0845, 19.48]`, `[0.003616, 454.9]` | sound |
| 4.1–4.10 (r3) | `ℚ`, `T = 15`; `ℚ(i)`, `T = 100`; `ℚ(ζ₇)⁺`; `n = 3`, `d = 23` | bound `10.673`; `156.64 ± 19.507`; `0.7246`; `c₁ = 0.34315`, `c₂ = 1.07180`; `8.080` vs `40.80`; `0.9358` | sound |
| `dedekindZeta_residue_gt_stark` (r3) | `c₄`; `ℚ(ζ₇)⁺` | `c₄ = 43.162115`, `1/(16c₄) = 0.00144803`; `κ = 0.30026 > 0.001488` | sound |
| `classNumber_le_bordelles` (r3) | `ℚ(√−14)`, cubic `−23`, `ℚ`, `ℚ(√5)` | `11.19 ≥ 4`, `60.25 ≥ 4`; `94.30 ≥ 1`; `1 = 1`; `4.035` | sound |
| `relativeClassNumber_le` (r3) | `ℚ(i)`, `ℚ(√−3)`, `d = 163`, `ℚ(√−5)`, `ℚ(ζ₈)` | `4.798`, `4.939`, `56.27`, `11.59 ≥ 2`, `12.72` | sound |
| 5.1, 5.2, 5.4, 5.6 (r3) | `ℚ(√5)`, `ℚ(i)`, `ℚ(√−3)`; `b = 193`; `ℚ(ζ₇)⁺` | `2.446`, `2.399`, `2.470`; `9333 ≤ 9376.9`; `B_k = 0.94664` | sound |
| 6.1 / 6.2 (r3) | `ℤ/6`; `ℤ/2 × ℤ/2`; `p = 101`, `H = 4`, `h = 2`; `p = 7` | `1`, `0`; `−1`, `1`; `8` integers, `15.40`; overlap at `2` | sound |
| 6.3 `δ ≤ 0` Check (r3) | first ten primes, first nine | `Σ 1/p = 1.0334`, `0.99896` | sound |
| `leastPrimePrimitiveRoot_le_grh` (r3) | `10⁹ + 7`, `1000000021` | `9894.6 < 31620.8`; `4.36·10⁶` | sound |
| 6.4 Grosswald small cases (r3) | `p = 409, 2791, 11971` | `18.22`, `50.83`, `107.41` | sound |
| 6.5 (r3) | `A(q₀)`, condition (3), Robin | `A(10¹²) = 0.188846`, `A(10²³³) = 0.160684`; least ratio `9.25 ≥ 8.1`; `118.149` | sound |
| `primeIdeal_mertens_garciaLee` (r3) | `ℚ(i)`, `x = 10, 2` | product `0.28444`, `0.91619`; `M ∈ [−1.664, 0.336]` | sound |
| `leastPrimeIdeal_ahnKwon` (r3) | `ℚ(i)/ℚ` | least `3`, `5`; `241.7` | sound |
| `frobeniusPrimeCount_le_debaene` (r3) | `L = ℚ`, `x = 3, 10⁶, 2, e` | `15.05 ≥ 2`; `7.088·10⁵ ≥ 78498`; `−56.78` (excluded by `x > e`) | sound |

**Remark on wording.** The parenthesis at README.md:2787, "rounding `δ` up to `0.3930` would overstate it", is a statement about the mathematics and reads timelessly. The gate's round-labels and process scanners pass. No change is requested.

## Not verifiable

- Nothing in the changed passages: their only source, `mcgowntrevinotrudgian2016`, is in the cache and was read at the cited lines.
- The previous report's list (texts settled as uncertified or not re-read: `washington1997`, `friedman1989`, `rademacher1959`, `louboutin2000`, `louboutin2001`, `chen2022`, `cullyhugilltrudgian2021`, `tudzi2026`, `odlyzko1976`, `bachsorenson1996`, `greniemolteni2016`, `lang1994`, `kadiringwong2019`, `fehnker2026` and the 2026 preprints) concerns untouched text and was not reopened.

## Source issues

- **Misprint** in mcgowntrevinotrudgian2016 at proof of Corollary 4, p. 5 (line 204): the source bounds `δ` for `n = 15`, `s = 12` by `1 − (1/7 + 1/13 + ⋯ + 1/47) > 0.3717`; it should read `1/7 + 1/11 + ⋯` and `> 0.3716` (exact value `0.371687`); affects nothing (the threshold `3.2·10¹⁶` survives: `3.1975·10¹⁶` at the exact `δ`).
