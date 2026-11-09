# Review of ExplicitZetaBounds (pull request #1954 at cea8938)

**Verdict:** accepted

This is an incremental re-review of the 86 lines that changed since `ef8fe89`. All of them are in `TauCetiRoadmap/ExplicitZetaBounds/README.md`. `Suggested.lean` and `metadata.toml` are unchanged, and nothing outside the folder changed.

The diff does three things:
- it repairs R01 of the previous review;
- it re-rounds twenty more thresholds and crossing points in the scope paragraph on the `0.28 log T` form and in 4.3, 4.7, 4.9a, 5.2, 5.2a, 7.2, 7.3, 7.4, 7.10 and 9.2;
- in 7.2 it restates the simplified Ford region with `J₂`, the second branch of `J`, and adds `J ≤ J₂` to the implication.

Every number the diff adds was recomputed here, using Python double-precision floats and bisection to relative error `10⁻¹⁵`. Each one is correct. Each is also rounded on the side that keeps its claim true: an "only for" or "only once" threshold is a necessary condition, and a "from … on" or "below 1 on" range lies inside the true set. This report has no findings.

## Previous findings

- R01 — repaired: README line 1981 now says "below `1` on `29.7903 ≤ log t ≤ log T_4` (it crosses `1` at `log t = 29.79028`)". Recomputed at `σ = 5/7`:
  - the crossing is at `log t = 29.7902785`;
  - the ratio is `0.9999995` at `29.7903`;
  - it decreases monotonically, over 1001 grid points, to `0.998722` at `log T_4 = 29.8442`.

## Verified sound

### Gate, dependencies, build (run here at cea8938)

- **Gate.** `gate … ExplicitZetaBounds --base origin/main` prints every check at `0` and ends `OK`. The worker's `gate.md` agrees and records `build=0`.
- **Dependency check.** It prints `depcheck: 239 roadmaps, 2357 edges, 0 problem(s)` and exits 0, with no UPWARD, CYCLE or `moved:` line. ExplicitZetaBounds is line 265 of the merge order.
- **Diff scope.**
  - `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ExplicitZetaBounds'` prints nothing.
  - `git diff --stat ef8fe89 HEAD` shows only the README (48 insertions, 38 deletions).
  - `git diff ef8fe89 HEAD -- …/Suggested.lean` is empty.
- **Elaboration.** `lake env lean TauCetiRoadmap/ExplicitZetaBounds/Suggested.lean` exits 0 with 43 warnings, all ``declaration uses `sorry` ``.
- **Carried forward unchanged.** The file is unchanged, so these results of the previous reports (r14, r13) still stand:
  - the `#check @name` signature comparison: no `variable` block, and `signatures.md` reports 0 lost binders;
  - the one-tactic probe: all 43 theorems fail;
  - the headline-theorem audit.
- **README and Lean agree.** I grepped `Suggested.lean` for every number the diff touches. Only one docstring carries any of them: that of `riemannZeta_ne_zero_littlewood` (Suggested.lean line 709), "contains this region only for `log |t| ≥ 50.13`". This is consistent with the README's new exact interval `50.1324… ≤ L ≤ 170.2635…`, and it is true as a necessary condition. No Lean statement depends on a changed number.
- **Stale copies.** I grepped the README for the old values. The only one left is "at most `(1/5) log t + 2` from `t = 13.368` on" (line 2232). It is true, because `13.368 > 13.36783`, the meeting point.

### The changed passages, recomputed

| README line | Claim | Computed | Result |
|---|---|---|---|
| 201–203 | `0.143 L − 0.443 log L = 1.588` at `L = 20.45508`; `e^{20.456} = 7.65·10⁸` | root `20.4550801`; `e^{20.456} = 7.6547·10⁸`; derivative zero at `L = 3.0979` | ✓ |
| 1567 (4.3) | `A − 4/√π = 0.53692…`, its square `0.28828…` | `A = 2.7936838` (`ariasdereyna2024` line 189); `0.5369255`, `0.2882890` | ✓ |
| 1866 (4.7) | `4(t/2π)^{1/4} ≥ 1.6895` on `[0.2, 3]` | value at `t = 0.2` is `1.6895557` | ✓ |
| 1902 (4.7) | Patel–Yang `66.7 t^{27/164}` against `0.618 t^{1/6} log t`, crossing at `log t = 89.90382` | root `89.9038201`, with log-difference `+2.6·10⁻⁷` at `89.9038` and `−1.05·10⁻⁶` at `89.9039`; one sign change on `[log 3, 1000]`; `79.924` at `t = 3` | ✓ |
| 1905 (4.7) | hybrid `9.05·7(q\|t\|)^{1/6}log^{3/2}(q\|t\|)` against `2.97655(q\|1+it\|)^{1/4}`, crossing at `123.368`, wins only for `> 123.36` | root `123.3680136` for `q = p⁶`, `p = 2, 3, 5, 7, 11`; `8910.98` and `31.660` at `q = 64`, `t = 200` | ✓ |
| 1981 (4.9) | R01 | see above | ✓ |
| 2062 (4.9a) | `133.66 log 9.463 = 300.386…`; `132.94357 log 8.7979 = 289.087…` | `300.38607`, `289.08753` | ✓ |
| 2149, 2253 (5.2) | the two Bellotti–Wong bounds cross at `log T = 447.98114`; the first is smaller from `e^{447.982}`; line 38 prints `447.981`, below the crossing | root `447.9811435`; second minus first is `−1.58·10⁻⁶` at `447.981` and `+9.4·10⁻⁶` at `447.982` | ✓ |
| 2250 (5.2) | Rosser's right side against `2.5167 + 1/(40T)`: `2.51769` and `2.51781` at `T = 22.5`, meeting at `22.5097` | `2.5176899`, `2.5178111`; root `22.509728`; at `T = 14`, `2.379448 < 2.518486` | ✓ |
| 2257 (5.2) | `(1/5) log t + 2` meets `2.5167 + 1/(40t)` at `13.36783` | root `13.3678265`; at `t = 14`, `2.527811` against `2.518486` | ✓ |
| 2318 (5.2a) | `(0.1095, 0.2042, 3.0305)` with `7/8`: Rosser implies it only for `L ≤ 24.632`, the first Bellotti–Wong bound plus `7/8` only for `L ≥ 708.59`, and the second plus `7/8` never | roots `24.631831` and `708.592280`; the minimum of the third difference is `1.426492` at `L = 31.412` | ✓ |
| 2808–2812 (7.2) | for `t ≥ 1.88·10¹⁴` the `log 3` exact region implies the `mty2024` form with `J₂`, because `J ≤ J₂`, `c₆ < 0.0196/(J₂ + 1.15)` and `0.675 < 0.685` | numerator 1 is larger and denominator 1 is smaller, both positive; minimum relative margin of `c₆` `0.2031` on `L ∈ [32.8675, 700]`; ratio `c₆(J₂ + 1.15)/0.0196 → 0.664` at `L = 10³ … 10⁹`; minimum relative width gap `0.00113` | ✓ |
| 2848–2851 (7.2 Check) | branches of `J` (with `log 3`) cross at `log t = 32.86822`, `t = 1.88143·10¹⁴`; `J₂ − J ≤ 4.03·10⁻⁵` before the crossing; at `1.88·10¹⁴`, `c₆ = 0.0013921`, `0.0196/(J₂ + 1.15) = 0.0017470`, widths `0.0042735` and `0.0042383` | `32.8682236`; `1.881430·10¹⁴`; maximum `4.0236·10⁻⁵`; `0.00139214`, `0.00174704`, `0.00427351`, `0.00423829` | ✓ |
| 2936 (7.3) | `9.645908801 log 17/4.087217801 = 6.686435…` | `4.0872178010`; `6.6864353` | ✓ |
| 3079 (7.4) | `21.233/5.573412 = 3.809695…`, `L ≤ 45.1366…` | `3.8096950`; `e^{3.809695} = 45.136671` | ✓ |
| 3097–3099 (7.4) | on `L ≥ 20.12`, the simplified `log 0.618` region contains Yang's exactly for `50.1324… ≤ L ≤ 170.2635…`, Ford's exact region exactly for `40.8978… ≤ L ≤ 185.6440…`, and Theorem 4 nowhere | two sign changes each on `[20.12, 400]`: `50.132457`, `170.263523`; `40.897862`, `185.644022`; Theorem 4 contains it only for `L ≤ e^{21.233/8.464} = 12.288` | ✓ |
| 3126 (7.4 Check) | the simplified width `0.0014214873` at `e^{170.2}` serves only with `M₁ ≤ 0.04709721` | `0.0014214873 · 170.2/log 170.2 = 0.0470972079`; `M₁ log L/L = 0.0014215052`; `1/21.233 = 0.0470965` | ✓ |
| 3433–3435 (7.10) | `431.7/30.812 = 14.0107…`, `431.7/29.388 = 14.6896…`, `log t > 2.3968·10⁶` | `14.010775`, `14.689669`, `e^{14.689669} = 2.396858·10⁶` | ✓ |
| 3765 (9.2) | `(1/4) log q + (1/2) log 2 ≤ (1/2) log q − 0.02012` from `log q ≥ 1.46678`; at `q = 8`, `0.866434 ≤ 1.019601` | threshold `1.4667744`; `0.8664340`, `1.0196008` | ✓ |

### Sources where the changed passages cite them (seeded sample 4.3 and 5.2 included)

**4.3** (`ariasdereyna2024`):
- Lemma 4 at lines 109–114: `(ΛY + 2)(1 + 4/√(πλ)) + 1` under `0 < λ ≤ f'' ≤ Λ`.
- Lemma 5 at lines 183–189: `A(ΛY + 2)/√λ` for `Y ≥ 1`, with `A = 2.79368380731…`.

**5.2** (`bellottiwong2025`):
- Theorem 1.1 at lines 31–38, both bounds, with the threshold `exp(447.981)` at line 38.
- Table 1 at lines 50–60: Rosser `2.4630` at line 54, Trudgian `3.3850` at line 56, Hasanalizade–Shen–Wong `9.4925` at line 58.
- The `387899.2` of line 61.

**7.2:**
- `ford2002zerofree` Theorem 3 at lines 96–103 (`J` is the minimum of two branches, with `log 3`), and (9.9) at lines 1342–1346 (`M₀ = 0.675`, `c₇ = 0.155`).
- `mty2024` (1.8) at lines 107–112, where `J(t) = (1/6) log t + log log t + log 3`. This is the README's `J₂`, so the restatement matches the source.

**4.9a:**
- `ford2002vinogradov` line 130 gives `(9.463, 133.66)`, and lines 2292–2295 give `Y = 300`.
- `bellotti2024` line 230 gives `(8.7979, 132.94357)`.

**7.3 and 7.4:**
- `mty2024` lines 11 and 48 give `5.558691` and `5.573412`.
- `yang2024` line 2327 gives `t₀ = exp(170.2)`, and line 2338 gives `M₁ = 0.0470978`.

**4.7:**
- `hiarypatelyang2024` lines 64–65 (`0.618`) and `patelyang2024` lines 49–50 (`66.7 t^{27/164}`).
- `thornerzaman2024` line 317 (`2.97655 (q|1 + it|)^{1/4}`).
- `hiary2016hybrid` lines 57–59, with line 16. Line 16 defines the analytic conductor as the script letter `q` equal to `q|t|`, which the OCR prints as a plain `q`, so the README's `(q|t|)` is the right reading of (5).

**9.2:** `saadeddin2016` lines 29–31.

### Adversarial table

The changed statements and Checks are the rows of the table above, with their computed values. Two more rows test their degenerate cases:

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 7.2 implication on the gap below the branch crossing | `t ∈ [1.88·10¹⁴, 1.88143·10¹⁴]`, where the minimum in `J` is the first branch, so `J < J₂` | `J₂ − J ≤ 4.0236·10⁻⁵`; at `1.88·10¹⁴` the widths are `0.0042735 ≥ 0.0042383` | ✓ |
| 7.2 implication as `t → ∞` | `L = 10³, 10⁴, 10⁶, 10⁹` | `c₆`: `7.431·10⁻⁵, 7.759·10⁻⁶, 7.811·10⁻⁸, 7.812·10⁻¹¹`, against `1.115·10⁻⁴, 1.168·10⁻⁵, 1.176·10⁻⁷, 1.176·10⁻¹⁰` | ✓ |

The rows below are carried forward from the previous report (`PRREVIEW-ExplicitZetaBounds_r14`, which carries `r13`) for the statements this diff leaves untouched:

| Statement | Values (from r14) | Result |
|---|---|---|
| 3.1 Fiori's `G` admissible; its Check | `min Re G = 0.81326`; `1.0013842`, `1.086·10⁻²⁷` | ✓ (r14) |
| 4.9 bullets 1–2; the range `e^{8.7} ≤ t ≤ T_k`; the constants of `T_k` | `4.3361`, `5.0861`; `7.79·10⁻⁸ < 10⁻⁷`, `A(e^{8.7}) = 1.0000000896`; `2.6134257`, `2.8876009` | ✓ (r14) |
| 4.9 on `3 ≤ t ≤ e^{8.7}` | `k ≥ 5`: minimum `1.010774`; `k = 4`: minimum `1.336197` | ✓ (r14) |
| 7.4 Lemma 4.3 with `G`; its edge at `σ = 5/7` | margins `0.000758`, `0.000767`; `0.8411 … 1.7525` against `2.7302 … 8.1788` | ✓ (r14) |
| 3.2 `norm_continuedL_le_rademacher` | minimum relative margin `0` (at `ζ`, `s = −1/2`) | ✓ (r13) |
| 2.5 `norm_Gamma_bounds`, 3.2a, 3.4 | `1.9·10⁻⁶`, `0.00416`; `1.274`, `10.071` | ✓ (r13) |
| 4.5b, 4.5c, 4.7, 4.8, 4.10 | `1.6·10⁻²³`, `0.0071`; `0.2768`; `0.4606`, `2.3957`; `80.49` | ✓ (r13) |
| 5.2, 5.2a and the 0.4 records | margins `7.128`, `2.682`, `2.3079`, `1.3283`, `8.1528`, `2.5148`, `1.5767` | ✓ (r13) |
| 7.3, 7.3a, 7.4 statement, 7.5–7.9 | `0.740461`; `0.982680`; `0.837457`, `0.942140`; `0.990460`; `0.0076021` | ✓ (r13) |
| 8.1, 8.3–8.5, 9.1–9.3 | `1.702195·10¹⁰`; `2.22295·10¹¹` against `2.156·10¹³`; `L(1, χ)` margins `0.0134`–`0.3527` over 4709 characters | ✓ (r13) |

### Citations and ownership

- **What the diff adds.** No cross-roadmap citation, no library name and no new object.
- **The two leads in `citations.md`** resolve at the head `66e58fc` of SieveMethodsAndPrimePatterns, which is §2.9 of its README (line 2403):
  - `SieveTaper.sharp_additive_largeSieve` is at `Suggested.lean` line 225, with its namespace opened at line 209;
  - `SieveApplications.sharp_primitive_largeSieve` is at line 250, with its namespace opened at line 245.
- **Overlaps.** `overlaps.md` lists no open pull request that changes this roadmap and no dropped id. The closest roadmaps in vocabulary are ExplicitPrimeCounting, ExplicitNumberFields, ExplicitMultiplicativeFunctions and two ZerosOfLFunctions pull requests. The diff does not change what this roadmap owns relative to them.

## Not verifiable

These are carried forward from the previous report.

- **Image-only scans this worker cannot read without OCR**, listed in `needs-references.toml`:
  - `chirrehelfgott2025` (5.2, 6.3a);
  - `leeLeong2022` and `leong2026` (7.10);
  - `hoffstein1981` (9.3);
  - `cullyhugilljohnston2025` (6.2).
  The changed Check of 7.10 depends on these. Its arithmetic is recomputed above, but its constants `431.7`, `30.812` and `29.388` were not checked against the text.
- **Uncertified works, cited by locator only:**
  - `rademacher1959`, `ramare2022excursions`, `backlund1918`, `rosser1941`, `lehman1966`;
  - `montgomeryvaughan1974`, `preissmann1984`, `elliott1987`;
  - `ramare2001`, `davenport2000`, `titchmarsh1986`, `mccurley1984`, `dlmf`, `cullyhugilltrudgian2021`;
  - `gabcke1979`, which is waived.

  Rosser's constants `0.137`, `0.443` and `1.588`, used in the changed 5.2 and 5.2a thresholds, were checked only through `bellottiwong2025` Table 1, line 54.

## Source issues

- **Misprint** in bellottiwong2025 at Theorem 1.1, p. 1 (line 38): the source says the first estimate is the sharper one from `T = exp(447.981)` on; it should be from `exp(447.98114)`, since at `log T = 447.981` the second is still smaller by `1.6·10⁻⁶`; affects nothing.
