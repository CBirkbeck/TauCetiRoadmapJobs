# Review of ExplicitZetaBounds (pull request #1954 at ef8fe89)

**Verdict:** needs changes

This is an incremental re-review of the 79 lines that changed since `297a91d`, all in `TauCetiRoadmap/ExplicitZetaBounds/README.md`: §3.1, §4.9, §7.4 and two entries of the references. `Suggested.lean` is unchanged. R01 of the previous review is repaired, and every number the repair adds was recomputed. One number is wrong: an interval endpoint in the new negative-control Check of 4.9 is rounded the wrong way.

## R01 (P3) — 4.9 Check: the |log| control fails only from `log t = 29.7903`, not from `29.79`

**Location.** README line 1981, the new Check of 4.9: "the ratio of the target to the interpolated bound at `k = 4` is `0.998722` at `t = T_4` and below `1` on `29.79 < log t ≤ log T_4`".

**Claim.** At `σ = 5/7`, the ratio `1.546 t^{1/14} log t / (0.618^{4/7} |1.31 + s|^{23/21} |log(1.31 + s)| / |s − 1|)` crosses `1` at `log t = 29.790278`, not at `29.79`. Strictly above `29.79` it is still above `1`. So the Check's interval is false on `(29.79, 29.79028)`. The endpoint `29.79` also appears in the previous review's own description of this finding, which rounded it down.

**Witness.** Computed with mpmath at 40 digits, `σ = 5/7`:

| `log t` | ratio |
|---|---|
| `29.7901` | `1.0000042` |
| `29.7902` | `1.0000019` |
| `29.7903` | `0.9999995` |
| `29.791` | `0.9999829` |

**Repair.** In README line 1981, replace "`29.79 < log t ≤ log T_4`" by "`29.7903 ≤ log t ≤ log T_4`". This was tested on the refuting instance: the ratio is `0.9999995` at `29.7903` and decreases to `0.998722` at `log T_4 = 29.8442`.

## Previous findings

- R01 — repaired: README 1936–1966 now interpolates `(s − 1)ζ(s)` with the factors `0.618`, `1.31 + s` and `G(s) = (1/2) log((1.31 + s)(3.31 − s))`. The README states and justifies the three properties of `G`, and 7.4 (3074–3083) and 3.1 (1197–1201, Check 1220–1225) make the same change.

How the repair was checked:

- The three bullets of 4.9 all hold:
  - `Re((1.31 + s)(3.31 − s)) = t² + 4.3361 + 2σ − σ²`;
  - `Re G ≥ log|1.31 + s|` exactly when `σ ≤ 1`;
  - `Re G ≥ log|t|`, and `|G| ≥ 0.81326`.
- The edge hypotheses hold with `|G|`:
  - from the first item of 4.7, 3.3 and `PatelRecord` for `|t| ≥ 3`;
  - from all three clauses of `YangRecord` (0.4b, README 643–648) for `|t| ≤ 3`.
- The exponents interpolate to `0.618^{2−2σ} |1.31 + s|^{(4−σ)/3}` in 4.9, and to Yang's `(10 − 14σ)/3`, `(14σ − 7)/3` and `(25 − 8σ)/18` in 7.4.
- The repair introduced one new problem, R01 above.

## Verified sound

### Gate, build, dependencies, Lean (run here at ef8fe89)

- **Gate.** `gate … ExplicitZetaBounds --base origin/main` prints every check at `0` and ends `OK`. The worker's `gate.md` agrees and records `build=0`.
- **Dependency check.** `depcheck: 239 roadmaps, 2356 edges, 0 problem(s)`, exit 0, with no UPWARD, CYCLE or `moved:` line. ExplicitZetaBounds is line 265 of the merge order.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ExplicitZetaBounds'` prints nothing. `git diff --stat 297a91d HEAD` shows only the README.
- **Elaboration.** `lake env lean TauCetiRoadmap/ExplicitZetaBounds/Suggested.lean` exits 0 with 43 warnings, all ``declaration uses `sorry` ``.
- **Carried forward unchanged.** The file is unchanged, so these results of the previous report still stand:
  - the `#check @name` signature comparison: no `variable` block, no lost binder;
  - the one-tactic probe: all 43 theorems fail;
  - the headline-theorem audit.
- **New supplier name.** The diff adds one library name, Mathlib `Complex.log`, to the *Needs:* line of 4.9. It is at `Mathlib/Analysis/SpecialFunctions/Complex/Log.lean:30` at the pin.

### Sources: the seeded sample where it falls in the changed passages

**3.1, against `fiori2025`:**
- Theorem 1 is at lines 47–64. It requires:
  - `G_i` holomorphic with `G_i(s̄) = conj G_i(s)`;
  - the lower growth bound, and the growth bound on `f`;
  - `α_i, β_i ≥ 0`;
  - monotonicity of `|G_i|` only when `α_i ≠ β_i`.
- The other locators:
  - Remark 2 (negative exponents): lines 65–70;
  - the standard factors `e^{α} = A` and `Q + s` with `Q > −a`: lines 71–73;
  - Remark 4: lines 91–109, where `|log(Q + s)| ≥ log|Q + s|`;
  - Lemma 5: lines 110–114;
  - the error in Trudgian's lemma: lines 13–18.
- §3, lines 241–277: `G_{Q₁,Q₂}(s) = (1/2) log((Q₁ + s)(Q₂ − s))` with `Q₁ + a ≥ 1` and `Q₂ − b ≥ 1` (line 244), and `log|t| < |G| < (1 + O(1/(t² log t))) log|t|` (line 272).
- The README's claims are proved directly:
  - `Re((Q₁ + s)(Q₂ − s)) = (Q₁ + σ)(Q₂ − σ) + t² ≥ 1`;
  - `Re G > 0` on the strip: `|Q₁ + s|, |Q₂ − s| ≥ 1`, and both equal `1` only at `t = 0` with `σ = a = b`, which is impossible.

**4.9, against `yang2024`:**
- (3.4): lines 722–728.
- (3.7)–(3.9): lines 756–770, with `log|Q₀ + s|` at 767–769.
- (3.10)–(3.15): lines 771–830.
  - `A(t₀)` at 801–814 is `(2.31²/t₀² + 1)^{23/42}(1 + log(2.31²/t₀² + 1)/(2 log t₀))`.
  - "`A(t₀) ≤ 1.4747`" is at line 823, and "`A(t₀) ≤ 1.0001`" at line 825.

**7.4, against `yang2024`:**
- Lemma 4.3 is at lines 1542–1597. The edge bounds are at 1550–1553, (4.21) at 1555, `C₁` and `C₂` at 1582–1594, and `t₀ = 10¹²` at 1595.
- The OCR text drops the minus sign of `1.546^{−7/3}` in `C₁`. With it, `log C₁ + log C₂ = 1.658255`, matching Yang's `1.659`.

**References.** The `yang2024` and `fiori2025` entries (README 3934, 3937) list exactly the items now cited.

**Consumers.** The sample targets that depend on the changed routes use only the unchanged statements of 4.9 and 7.4:
- 5.2 (README 2169–2178);
- 8.5 (3658–3685), the region of 7.4.

The 5.2 cross-reference "(3.1, Checks)" at line 2187 still points to the Trudgian-lemma Check.

### Adversarial table

- **Values.** New rows are computed here with mpmath at 30–50 digits. Rows marked "r13" are carried forward from the previous report (`PRREVIEW-ExplicitZetaBounds_r13`) for statements this diff leaves untouched.
- **Grids.**
  - `σ`: 41 values on `[5/6, 1]`.
  - `t`: 401 log-spaced values on `[3, e^{8.7}]`, plus a step of `0.01` on `[3, 5]`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 3.1 Fiori's `G` admissible (new) | `Q₁ = 1.31`, `Q₂ = 3.31`, `[1/2, 1]` and `[1/2, 5/7]` | `Q₁ + a = 1.81`, `Q₂ − b = 2.31` and `2.596`; `min Re G = 0.81326` at `σ = 1/2`, `t = 0` | ✓ |
| 3.1 new Check | `Q = 1.31`, `s = 5/7 + iT₄`, `log T₄ = 29.8442` (`T₄ = 9.1447·10¹²`) | `\|log(Q + s)\|/log\|Q + s\| = 1.0013842`; `(\|G\| − log t)/log t = 1.086·10⁻²⁷` | ✓ |
| 4.9 bullet 1 | `σ = 1/2, 1`, `t = 0` | `1.31 · 3.31 = 4.3361`; `(1.81)(2.81) = 5.0861`, `G = 0.813256` | ✓ |
| 4.9 bullet 2 | `σ = 5/7`, `t = 0`; `σ = 1` | `Re G − log\|1.31 + s\| = 0.12432`; `0` (equality) | ✓ |
| 4.9, `e^{8.7} ≤ t ≤ T_k` | `max_{σ∈[1/2,1]}(\|G\| − log t)` at `t = e^{8.7}`; `A(e^{8.7})`; the `A` factor with `\|G\|` | `7.79·10⁻⁸ < 10⁻⁷`; `1.0000000896`; `1.0000000900 ≤ 1.0001` | ✓ |
| 4.9 constants of `T_k` | `6 log(1.546/1.0001)`, `−6 log 0.618` | `2.6134257 > 2.6134`; `2.8876009 > 2.8876` | ✓ |
| 4.9, `3 ≤ t ≤ e^{8.7}`, `k ≥ 5` | ratio `1.546 log t`/bound, `σ ∈ [5/6, 1]` | minimum `1.010774` at `σ = 1`, `t = 3` | ✓ |
| 4.9, `3 ≤ t ≤ e^{8.7}`, `k = 4` | target/bound at `σ = 5/7` | minimum `1.336197` at `t = 3` | ✓ |
| 4.9, Yang's `A(3)` (new source issue) | (3.12) at `t₀ = 3`; `log t₁(k)` of (3.14) | `A(3) = 1.563807`; with it `11.07, 6.70, 5.07, 3.97` (`k = 4…7`); with `1.4747`, `13.53, 9.34, 8.703, 9.52` | ✓ as the README states |
| 4.9 negative-control Check | `k = 4` at `T₄`; `k = 5` at `t = 3`; crossing | `\|log\|`: `0.998722`, `0.971157`; `G`: `1.000104`, `1.176874`; Yang's form: `1.000104`, `1.201485`; crossing at `log t = 29.790278` | ✗ R01 (endpoint) |
| 4.9, `\|log\|` at larger `k` | `k = 6, 7, 8`, `t = 3` | `0.9071, 0.8734, 0.8551` (the control fails for every `k ≥ 5`) | ✓ |
| 7.4 Lemma 4.3 with `G` | `t₀ = 10¹²`, `η = 2/7` and `1/2` | `log C₂ = 4.279043`; `log C₁ + log C₂ = 1.658255`; constant needed `1.658242, 1.658233`; margins `0.000758, 0.000767` | ✓ |
| 7.4 Lemma 4.3 with `\|log(1.31 + s)\|` | the same | `sup \|log\|/log t = 1.0016146` at `t₀`, decreasing (`1.0013759` at `10¹³`); constant needed `1.659856` | ✓ (fails, as stated) |
| 7.4 edge `σ = 5/7`, `\|t\| ≤ 3` | `YangRecord` with `\|G\|`; the 4.9 interpolation at `σ = 5/7` | `\|(s − 1)ζ(s)\| = 0.8411, 0.9349, 1.2262, 1.7525` at `t = 0…3` against `2.7302, 3.4031, 5.3001, 8.1788`; `0.618^{4/7}\|Q + s\|^{1/42} ≤ 0.78319 < 1.546` | ✓ |
| 4.9 statement, its YangRecord Check | r13 | `1.000104` at `T₄`; `0.730177 < 0.732668`; `4.443458` vs `3.345888` | ✓ (r13) |
| 3.2 `norm_continuedL_le_rademacher` | r13 | minimum relative margin `0` (attained for `ζ` at `s = −1/2`) | ✓ (r13) |
| 2.5 `norm_Gamma_bounds`, 3.2a, 3.4 | r13 | log-margins `1.9·10⁻⁶`, `0.00416`; `1.274`, `10.071`; `100.5779 > … > 1` | ✓ (r13) |
| 4.5b, 4.5c, 4.7, 4.8, 4.10 | r13 | `1.6·10⁻²³`, `0.0071`; errors below bounds; `0.2768`; `0.4606`, `2.3957`; `80.49` | ✓ (r13) |
| 5.2, 5.2a and the 0.4 records | r13 | margins `7.128`, `2.682`, `2.3079`, `1.3283`, `8.1528`, `2.5148`, `1.5767` | ✓ (r13) |
| 7.3, 7.3a, 7.4 statement, 7.5–7.9 | r13 | `0.740461`; `0.982680`; `0.837457`, `0.942140`; `0.990460`; `0.0076021` | ✓ (r13) |
| 8.1, 8.3–8.5, 9.1–9.3 | r13 | `1.702195·10¹⁰`; `2.22295·10¹¹` vs `2.156·10¹³`; L(1, χ) margins `0.0134`–`0.3527` over 4709 characters | ✓ (r13) |

### Citations and ownership

- **Cross-roadmap citations.** The diff adds none. The two leads in `citations.md` resolve at the head of SieveMethodsAndPrimePatterns: `SieveTaper.sharp_additive_largeSieve` at `Suggested.lean` line 225 (namespace opened at 209) and `SieveApplications.sharp_primitive_largeSieve` at line 250 (opened at 245).
- **Overlaps.** `overlaps.md` lists no open pull request that changes this roadmap and no dropped id.
- **Objects.** The factor `G` is a route device inside 4.9 and 7.4, not a new definition. No ownership question arises.

## Not verifiable

Carried forward from the previous report; nothing in this diff depends on them.

- **Image-only scans this worker cannot read without OCR**, listed in `needs-references.toml`:
  - `chirrehelfgott2025` (0.4, 3.4, 5.2a, 6.3a);
  - `leong2026` and `leeLeong2022` (7.10);
  - `hoffstein1981` (9.3);
  - `cullyhugilljohnston2025` (6.2).
- **Uncertified works, cited by locator only:**
  - `rademacher1959`, `ramare2022excursions`, `backlund1918`, `rosser1941`, `lehman1966`;
  - `montgomeryvaughan1974`, `preissmann1984`, `elliott1987`;
  - `ramare2001`, `davenport2000`, `titchmarsh1986`, `mccurley1984`, `dlmf`, `cullyhugilltrudgian2021`;
  - `gabcke1979`, which is waived.
- **OCR quality.** `fiori2025` is an OCR extraction. The bound `π/(b − a)` on `C₃` and the factor `1/2` of `G_{Q₁,Q₂}` are garbled at lines 51 and 242–243; the reading above follows the structure of the formulas.

## Source issues

- **Error** in yang2024 at §3.1, after (3.14), p. 16 (line 823): the source says `A(3) ≤ 1.4747`, so `t₁(k) ≥ e^{8.7}` for every `k ≥ 4`; it should be `A(3) = 1.5638` by (3.12), giving `t₁(k) ≥ e^{8.7}` only for `k = 4`; affects the proof.
