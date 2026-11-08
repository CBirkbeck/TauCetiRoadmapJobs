# Review of ExplicitNumberFields (pull request #1944 at 016bb4a)

**Verdict:** accepted

This is an incremental re-review of the 27 lines that changed since `0b173fb`. All 27 are in `TauCetiRoadmap/ExplicitNumberFields/README.md`: the locator of 1.1 and a new Check there, the locator of 5.4's quartic bound, and the reference entry for `cullyhugilltrudgian2021`. `Suggested.lean` is unchanged, and nothing outside the folder changed.

Both findings of the previous review are repaired, and the repairs introduce no new problem. The gate passes, as do the dependency check and the elaboration of `Suggested.lean`.

The acceptance is conditional on the three declared supplier gaps, which the diff does not touch: `gap:artin-norm-compatibility` (README.md:597), `gap:explicit-mertens-second` (README.md:797) and `gap:bach-grh-smoothed-sum` (README.md:804). The previous review checked each of them.

## Findings

None.

## Previous findings

- R01 — repaired: README.md:1284–1285 now reads "(`rademacher1959`, Theorem 4; restated at `lee2023ideals` lines 173–179 as Theorem 2.2, and at `sunley1973` lines 148–158 as Lemma 2.2, on the open strip `−η < σ < 1 + η`)".
- R02 — repaired: README.md:2637–2639 now reads "Prove the quartic bound (`cullyhugilltrudgian2021` Corollary 1, from display (8) of its Theorem 1, in the numbering of arXiv:1911.07369 v1, where the corollary's display writes `x` for `b`; …)".

## Verified sound

### Gate, dependency check, elaboration

- **Gate.** I reran `gate … ExplicitNumberFields --base origin/main` at `016bb4a`. It printed `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate also reports `build=0`.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ExplicitNumberFields'` is empty.
- **Dependency check.** The output is `depcheck: 235 roadmaps, 2427 edges, 0 problem(s)`. It has no UPWARD, CYCLE or `moved:` line.
  - This roadmap is at position 272 of the merge order.
  - The two suppliers that the changed passages cite come earlier: ExplicitZetaBounds at 267 and ExplicitMultiplicativeFunctions at 271.
  - ZerosOfLFunctions is on main.
- **Elaboration.** `lake env lean TauCetiRoadmap/ExplicitNumberFields/Suggested.lean` gives 16 warnings, all `declaration uses 'sorry'`, and nothing else.
- **`#check @name`.** I appended `#check @name` for all 21 declarations to a scratch copy of the file and elaborated it. All 21 elaborated types agree verbatim with `signatures.md`, and the file has no `variable` block. Nothing changed.
- **One-tactic probe.** On a scratch copy, I replaced each `sorry` by `first | (simp; done) | rfl | (norm_num; done) | trivial | decide | infer_instance | (positivity; done) | (nlinarith; done) | sorry`. All 16 theorems still fall through to `sorry`, so nothing in the file is padding.

### The changed passages, read at their sources and suppliers

**1.1, locator.** The three sources agree with the closed-strip, non-strict statement of README.md:1281–1283.
- `sunley1973` lines 148–158 is Lemma 2.2. It holds on the strip `−η < σ < 1 + η` with `0 < η ≤ 1/2`, has a strict `<`, and its proof reads "See [14, p. 200]".
- `lee2023ideals` lines 173–179 is Theorem 2.2, Rademacher's form, on the closed strip `−η ≤ σ ≤ 1 + η` with `≤`.
- ExplicitZetaBounds §3.2 at its head (#1954, README lines 1154–1197) states the same closed-strip `≤` with pole factor `3|(1+s)/(1−s)|`. Its first Check is the same attainment at `s = −1/2`.

**1.1, the new Check.** I recomputed every value in it.
- `ζ(−1/2) = −0.2078862250`, and `ζ(3/2)/(4π) = 0.2078862250`.
- On the right side, `3|(1/2)/(3/2)| = 1` and `((1/2)/(2π))^{(1 + 1/2 + 1/2)/2} = 1/(4π)`, so the bound is `ζ(3/2)/(4π)`. The bound is attained, and a strict `<` on the closed strip would be false.
- The claim that Sunley's strict form holds on the open strip is also correct. With `B(s)` the right side, `Δ log B = −n(1+σ)/|1+s|² < 0` on `σ > −1`. Hence `log|ζ_K| − log B` is strictly subharmonic, and it is `≤ 0` on the closed strip by the theorem. By the maximum principle it is `< 0` on the open strip.

**1.1, its consumers and the citations in the reflowed paragraph.**
- 2.2 (README.md:1424–1434) moves the contour to `Re s = −η` and applies 1.1 "on the new line". It needs the closed-strip form, which 1.1 states; Sunley's open-strip lemma alone would not reach that line. 1.1 and 2.2 are therefore consistent.
- AnalyticNumberTheoryPartI §2.15a at its head (#1126) states `0 ≤ a_K(n) ≤ d_d(n)` and `ζ_K(s) ≤ ζ(s)^d`, with `d_d` the `d`-fold divisor function.
- ZerosOfLFunctions 3.1 on main is "Finite order from split Mellin integrals" (its README line 636).
- LFunctions Layer 3 `dedekindZetaData` is unchanged; the previous review resolved it.

**5.4, locator.** I read arXiv:1911.07369 v1, the only version arXiv lists.
- Theorem 1 is on p. 2, and its display (8) is `Σ_{n≤x} d₄(n) ≤ (1/3) x log³ x` for `x ≥ 193`.
- Corollary 1 is on p. 3: a quartic field with Minkowski bound `b ≥ 193`. Its conclusion is printed in the variable `x`, as the README says.
- Theorem 2 is on p. 4 and concerns `Σ d(n)²`.

**The new reference entry.** Crossref has DOI 10.1007/s11139-020-00333-3 as The Ramanujan Journal 56(1) (2021) 141–149, "Two explicit divisor sums", by Cully-Hugill and Trudgian. The arXiv abstract page links the same DOI.

**5.4, the supplier.** ExplicitMultiplicativeFunctions §7.5 at its head (#1946, README lines 3352–3374) proves "Cully-Hugill–Trudgian's Theorem 1" and the bound `≤ (1/3) x log³ x` for `x ≥ 193`. It does so under *DivisorPowerRangeVerified* `7560² (6·10^5)`, the hypothesis 5.4 carries.
- I checked the supplier's reason for `7560` in place of the source's `5560`: `Δ(x⁻)` is `−30.595`, `−33.086` and `−35.037` against `0.397√x = 30.130`, `32.544` and `34.518` at `x = 5760, 6720, 7560`.
- With `x₀ = 7560`, `F₁ = 2.002 + 2.382 + 0.794/8.931 = 4.473 ≤ 4.48`.

**5.4, the rest of the README.** README.md:399 ("Cully-Hugill–Trudgian's Theorems 1–2") and the §7.5 contract at README.md:722–727 agree with the corrected numbering. No other passage cites Cully-Hugill–Trudgian.

**Ownership and overlaps.** The diff adds no object and no new citation, and `overlaps.md` lists no dropped id and no open revision of this roadmap. The previous review's ownership audit stands unchanged.

**The board manifest (outside this pull request, not reviewed).** The board manifest still records `locator = "Theorem 2"` and no `arxiv` key for `cullyhugilltrudgian2021`, and `design/plan.json` (line 402) still has "Theorem 2 and its corollary". I note this for the worker only.

### Adversarial table

The first three rows have values computed this round for the changed statements. The other rows carry forward the previous review (r9, at `0b173fb`) for statements the diff leaves untouched.

| Statement | Instances | Values (left vs right) | Result |
|---|---|---|---|
| 1.1 Rademacher (this round) | `K = ℚ`, `η = 1/2` at `s = −1/2`, `−0.4`, `−0.4 + 5i`, `0.2 + 3i`; left edge `s = −1/2 + it` at `t = 1, 5, 20` | `0.2078862 = 0.2078862` (attained); `0.24717 < 0.36071`; `0.66415 < 6.15987`; `0.47909 < 5.29333`; `0.22307 < 0.86486`, `0.65636 < 6.03330`, `3.03346 < 24.89203` | `≤` on the closed strip, attained at `s = −η`; strict only inside |
| 1.1 Rademacher (this round) | `K = ℚ(i)` (`n = 2`, `d_K = 4`) at `s = −1/2`; at `s = 1/2 + 10i` | `L(−1/2, χ₋₄) = 0.275180` from `L(3/2, χ₋₄) = 0.864503`; `|ζ_K(−1/2)| = 0.057206 < 0.172867`; `|ζ_K| = 0.68773 ≤ 66.552` (the Check's `66.5`) | true; gamma shift `1` not attained |
| 5.4 quartic bound (this round) | `Σ_{m≤x} τ₄(m)` at `x = 192, 193, 194, 200`; 5.3's second form at `193`; `ℚ(ζ₅)` | `9329 > 9300.72` (fails: the threshold is needed); `9333 ≤ 9376.90`; `9349 ≤ 9453.28`; `9881 ≤ 9915.68`; `2·193·log³193 = 56261.42 = 6 × 9376.90`; `b_K = 1.6992` | true from `b ≥ 193`, as stated |
| 0.1 `μ_K`, `b_K` (r9) | `ℚ(i)`; `ℚ(√−14)`; `ℚ` | `μ = 0.6366`, `b = 1.273`; `b = 4.7640`; `μ_ℚ = 1` against `4/π` for the `r₁`-exponent model | as stated |
| 0.2 `Π_K(p)` (r9) | `ℚ(i)` at `2, 5, 3`; `ℚ` at `6`; quartic with `2` inert or ramified | `2`, `1.5625`, `9/8`; `3 > 6/5`; `1/15` against `2/16` | primes only; "iff" true |
| 0.3 class-number lemma (r9) | `ℚ(√−14)` at `b = 2.9` and at `b_K`; `n = 2` | `3 < 4`, `8 ≥ 4`; `27 ≤ 33.026`; `16 ≤ 22.545` | as stated |
| 0.4 `relativeClassNumber`, `classNumber_maximalRealSubfield_dvd` (r9) | `ℚ(i)`; `ℚ(ζ₈)`; `ℚ(√−5)` | `1`; `1.000`, `d_K/d_{K⁺} = 32`; `2` | true |
| 0.4a continued Euler product (r9) | `ℚ(i) ⊂ ℚ(ζ₈)`; `s = 0`; `s = 1` | imprimitive product vanishes at `2πi/log 2`; `−1/4 = −h/w`; `0` against `−0.977 κ_F` | primitive characters needed; `s ≠ 1` needed |
| 0.5 predicates (r9) | `q = 2`; `√d/log d`; `r = 0` | `Re s = 0` excluded; minimum `1.3591`; only `ℚ` | as stated |
| 0.6 `leastPrimePrimitiveRoot` (r9) | `p = 7, 409, 2791, 11971` | `(3,3), (21,29), (6,53), (10,79)` against `0.65, 18.22, 50.83, 107.41` | matches Checks |
| 1.1a digamma, trigamma remainders (r9) | `z = 3`; `1 + i`; trigamma at `(0.999, 50)`, `(0.1, 1)`, `(1, 1)` | `5/6 ≤ 2`; `0.60174 ≤ 1`; `0.019802 ≤ 0.02`, `1.43330 ≤ 10`, `0.644934 ≤ 1` | true; `min(1, Re z)` needed |
| 2.1 Widmer (r9) | `D = 1`; `D = 2` disc | `≤ 1 ≤ 2`; `128πR` | true |
| 2.2 `idealCount_sunley` (r9) | `ℚ(i)`, `x = 10`; `n = 1` | `9` against `7.854`, right side `> e^{61.4}`; `n = 1` excluded | true; `n ≥ 2` needed. Its use of 1.1 on `Re s = −η` is rechecked above. |
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

- I read four passages at their locators: `sunley1973` lines 95–165, `lee2023ideals` lines 34–44 and 165–185, and arXiv:1911.07369 v1 pp. 2–6.
- I resolved four cross-roadmap citations in the changed text: ExplicitZetaBounds §3.2, ExplicitMultiplicativeFunctions §7.5, AnalyticNumberTheoryPartI §2.15a and ZerosOfLFunctions 3.1.
- I elaborated 21 declarations and probed 16 theorems.

## Not verifiable

- `rademacher1959` is uncertified. I checked its Theorem 4 only through Lee's restatement (`lee2023ideals` lines 173–179) and Sunley's Lemma 2.2.
- `cullyhugilltrudgian2021` in print: Springer's page redirects to a sign-in, so only the Crossref metadata was read. The README cites the numbering of arXiv v1, the version I read.
- These texts, recorded as uncertified or waived, were not read this round. They are untouched by the diff and were listed in r9: `louboutin2000`, `louboutin2001`, `louboutin2015mmj`, `friedman1989`, `washington1997`, `stark1974`, `lang1994`, `chen2022`, `ramare2001`, `ramare2025`, `palojarvisimonic2026`, `bachsorenson1996`, `mcgownsorenson2024`, `tudzi2026`, `leenosal2026`, `lamzourilisoundararajan2015`, `kadiriwong2022`, `odlyzko1976`, `luzamanzhao2026`, `kadiring2012`, `cholemkeoliverzaman2025`, `amberger2026`, `openai2026siegel`, `kerr2026`, `green2026`.

## Source issues

- **Misprint** in cullyhugilltrudgian2021 at Corollary 1, p. 3 (arXiv v1): the source says the quartic class-number bound is `h_K ≤ (1/3) x log³ x`, although its hypothesis is on the Minkowski bound `b ≥ 193`; it should be `h_K ≤ (1/3) b log³ b`; affects nothing.
- **Gap** in cullyhugilltrudgian2021 at §2, the bound for `E₂`, p. 5, with (4) on p. 2 (arXiv v1): the source says `|Δ(t)| ≤ 0.397√t` holds for every real `t ≥ 5560` and integrates it there, but it fails just below `5760`, `6720`, `7560` (`Δ(7560⁻) = −35.04` against `34.52`); it should be the row from real `t ≥ 7560`, with `x < 7560²` checked directly, still giving `F₁ = 4.473 ≤ 4.48`; affects the proof.
- **Gap** in cullyhugilltrudgian2021 at §2, the bound for `E₃`, p. 5 (arXiv v1): the source says `(1/2)∫₁^x Δ(t) t^{−3/2} dt` is at most `(α/2) log x`, applying (4) on all of `[1, x]`, where (4) fails (`Δ(1) = 0.846 > 0.397`); it should bound `∫₁^{x₀}` separately: `∫₁^{5560} |Δ(t)| t^{−3/2} dt = 2.02 ≤ 0.397 log 5560 = 3.42`; affects the proof.
