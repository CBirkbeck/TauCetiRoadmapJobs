# Review of AnalyticNumberTheoryPartI (pull request #1126 at 8984606)

**Verdict:** accepted

No findings. The one finding of the previous report is repaired. The other five changed lines merge duplicated locators, and each merged locator checks out against the source text.

This is an incremental re-review of the 12 README lines (6 insertions, 6 deletions) changed since 6d2ce47. `Suggested.lean` is byte-identical to that head (blob `7637d3c` at both). Paths are relative to `TauCetiRoadmap/AnalyticNumberTheoryPartI/`.

## Previous findings

- R01 — repaired: `README.md:2110` now reads "`L′/L(0,χ)=0.647790−0.088336i` and `L′/L(1,χ̄)=0.157865+0.088336i`, whose sum is the real number `−log 5+γ+log(2π)=0.805655` on both sides". The addends now sum to `0.805655` (row K).

## Verified sound

**Gate, build and form.**
- Gate re-run at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's run on this head also records `build=0`.
- Dependency check: `depcheck: 239 roadmaps, 2356 edges, 0 problem(s)`, exit 0. There is no UPWARD, CYCLE or moved line.
- `lake env lean …/Suggested.lean` exits 0 in 13 s. Its output is 62 lines, every one of them ``declaration uses `sorry` ``.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AnalyticNumberTheoryPartI'` is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- The file is unchanged, so neither the one-tactic probe nor the `#check @name` binder pass was re-run. The previous report's probe (62 of 62 sorried declarations stay open) still applies. `signatures.md` lists 112 declarations with 0 flagged.
- Overlaps: no other open pull request changes this roadmap, none drops a cited id, and nothing is defined only by an open revision. The changed lines add no object, supplier citation, *Needs:* edge or Lean name, so the ownership position of the previous rounds stands.
- Citations: the 10 leads in the citations file (`BeurlingPrimeSystem.integerCount`, `atkinson.phase₁`, `zetaSecondMoment.mean_square`, …) are all declared in `Suggested.lean`; I grepped each one.

**Changed passages, against the source text.**

| README line | Section | Change | Checked against | Result |
| --- | --- | --- | --- | --- |
| 1993 | 2.38 | two locators merged: "§4, Theorem 4.2, p.20, Forum Math. Pi 13 (2025), e19, citing Lemke Oliver–Thorner [Pas17, Proposition A.2] and Thorner–Zaman [TZ21, Theorem 1.2]" | Published Forum Math. Pi PDF (CC BY 4.0), fetched this round through the sources service. §4 begins on printed p.19, and Theorem 4.2 is on p.20. The paragraph before it attributes the theorem to Proposition A.2 of the Lemke Oliver–Thorner appendix to [Pas17], with [TZ21, Theorem 1.2] as a stronger variant. The bibliography gives [TZ21] as Thorner–Zaman, Adv. Math. 378 (2021). In arXiv v2 the theorem is on p.19 (`loww2025` lines 967–980), as the manifest's `version_note` records. Hypotheses (`Q,T>1`, `1/2≤σ<1`, `ε>0`, `c=c([k:ℚ])`, primitive characters of conductor `𝔮`) match §2.38's statement | correct |
| 2110 | 2.44 | `0.157864` → `0.157865` | recomputed in row K | correct; previous R01 repaired |
| 2124 | 2.45 | locator rewritten: "proof of Corollary 3.3, p.384, where `\|L′(1,ρ)/L(1,ρ)\|` is bounded to control the `L′/L` terms of Theorem 3.2, p.383" | `tsimerman2018` lines 158 and 186: Theorem 3.2, on p.383, has the terms `L′(0,ρ)/L(0,ρ)`. Lines 212 and 223–226: on p.384 the proof reduces these to bounding `\|L′(1,ρ)/L(1,ρ)\|` | correct; the previous remark on the duplicated [64] citation is resolved |
| 2162 | 2.48 | two locators merged: "§4, Lemma 4.3 and its full proof, pp.20–22, Forum Math. Pi 13 (2025), e19" | Published PDF: Lemma 4.3 is stated on p.20. Its proof starts on p.21 and closes on p.22, just before Lemma 4.4, which is also on p.22 as the manifest note says. The statement matches the source: the set `E` is chosen before `4≤Y≤X`, the factor is `1/8`, the error is `C_{[k:ℚ],ε₁}Y^{σ₁}log²(X Disc k)` with `σ₁=max(1−ε₁/(4c),1/2)`, and `\|E\|≪Disc(k)^{ε₁}X^{ε₁}` | correct |
| 2427 | 3.13 | two locators merged: "Introduction (§1), p.3, exceptional families; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version); Koukoulopoulos …" | `ghoshsarnak2022`: §1 starts on p.1 (line 29). The three exceptional families and their `C′K/√log K` count are on p.3 (lines 125–130). §4.1 is on pp.12–13 (lines 497–518), with the `O(K(log K)^(−1/2))` count. The density `K^(1/2)(log K)^(−1/2)` is on p.24 (lines 1282–1286). arXiv's listing shows v3 (30 May 2022) as the latest version, published in Invent. Math. 2022 | correct |
| 2465 | 3.16 | locator merged: "§8, Proposition 8.1 and the density count after it, pp.22–24" | `ghoshsarnak2022`: §8 starts on p.22 (line 1182) and Proposition 8.1 is on p.23 (line 1226). In (i) and (ii) every prime factor of `ν` lies in half the reduced classes mod 8 (`{1,3}`, `{±1}`). The density count follows on p.24 (lines 1282–1286) | correct |

**Dependents of the changed sections.** None of the changed lines touches a statement, so no dependent changes meaning. The lines that cite these sections are:
- §2.48's *Needs:* cites §2.38 (`:2164`).
- `:1745`, `:1912` and `:2209` cite §2.44 or §2.45.
- §3.31's *Needs:* cites §3.13 (`:3133`), and its [82] locator (`:3131`) uses the same pages as the merged §3.13 locator.
- §3.32's *Needs:* cites §3.16 (`:3145`).
- No other line quotes a §2.44 value (`grep 0.15786|0.805655` hits only `:2110`).

**Seeded sample.** Two of the 15 targets fall in changed passages: 2.48 and 3.16. Both were checked above for theorem number, page, hypotheses and support, with values in rows N and P. §3.31 depends on §3.13 (row Q). §3.15 shares the [82] pages (row R). The other 11 targets (0.3, 0.13, 0.16, 0.17, 0.25, 2.2a, 2.11, 2.32, 3.29, 3.30, 3.43) lie outside the change and its dependents, so they were not re-reviewed. The README flags no locator as unverified (`grep -i unverified` is empty).

**Adversarial table.** Rows K, M, L′, N, O, P, Q and R are new, computed this round in scratch scripts. Every other row is carried from the previous report (r15, at 6d2ce47) for statements this head leaves untouched.

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| K | §2.44 example, `E=ℚ(ζ₅)`, `χ(2)=i` | `ρ̄` and `ρ` pairings | `L(0,χ)=−(1/5)Σaχ(a)=0.6+0.2i`. Lerch gives `L′/L(0,χ)=0.6477902834−0.0883361326i`. Euler–Maclaurin at `s=1` (2000 terms, 8 Bernoulli corrections) gives `L(1,χ̄)=0.8648062660−0.2041530661i` and `L′/L(1,χ̄)=0.1578645354+0.0883361326i`. The `ρ̄` sum is `0.8056548189+7·10⁻¹⁶i`, against `−log5+γ+log2π=0.8056548189`. Printed: `0.647790+0.157865=0.805655`. The `ρ` sum is `0.8056548−0.1766723i`. Control for the routine: `L(1,χ₋₄)=0.7853981634=π/4`, and `L′/L(1,χ₋₄)=0.2456095848` both directly and from the closed form `γ+2log2+3logπ−4logΓ(1/4)` | holds; R01 repaired |
| M | §2.45 `\|L′/L(1,ρ)\|≤C_{g,ε}D_E^ε` | `ρ=χ` on `ℚ(ζ₅)` (`D_E=125`); `χ₋₄` on `ℚ(i)` (`D_E=4`) | `\|L′/L(1,χ)\|=0.1808991≤125^0.1=1.6207`; `0.2456096≤4^0.1=1.1487` | consistent; locator correct |
| L′ | §2.38 → §2.48 exceptional-set count | `Q=X`, `T=X^(1/2)`, `σ=σ₁`, `ε=ε₁/4` | `(D X^(3/2))^(c(1−σ₁)+ε₁/4)`: with `1−σ₁=ε₁/(4c)` the exponent is `ε₁/2`, giving `D^(ε₁/2)X^(3ε₁/4)≤D^(ε₁)X^(ε₁)`. In the `max` branch `ε₁>2c`, `σ₁=1/2`, so `c/2+ε₁/4<ε₁/2`, the same bound | holds |
| N | §2.48 lower bound, `k=ℚ` | `F=ℚ(i),ℚ(√−3),ℚ(√5),ℚ(√2),ℚ(√−5)`; `4≤Y<200`, `Y=10⁶` | `Y=4`, `F=ℚ(i)`: `π(4;F,e)=0` against main term `π(2)/8=0.125`, so a positive `C` is needed even at the bottom of the range. Worst deficits are `−0.125, −0.25, −0.375, −0.25` and `+0.75` (never negative). `Y=10⁶`: `π(Y;F,e)∈[39140,39231]` against `π(5·10⁵)/8=5192.25` | consistent |
| O | §3.13 / `landau_ramanujan` | product truncated at `10⁶`; `K=1,3,5,13,10⁴,10⁶` | `C_L=0.7642236`, and the Lean `HasProd … (√2·C)` gives the same `C`. Counts are `1, 2, 4, 8`. `2749` against `C_L K/√logK=2518.2`. `216341` against `205606.6` (ratio `1.052`, slow `1+O(1/log K)`). `9` is counted, `3` is not | holds |
| P | §3.16 `X/√log X` counts | `X=10⁶` (scale `269039.8`); `(M,R)=(4,{1}),(4,{3}),(8,{1,7}),(8,{1,3}),(5,{1,4})` | Classes outside `H` count 0 in every case. Normalised counts in `H`: `(4,{1})` class 1 `0.3267`. `(4,{3})` class 1 `0.2335`, class 3 `0.2688`. `(8,{1,7})` (Proposition 8.1(ii) family) `0.1423, 0.1424`. `(8,{1,3})` (8.1(i)) `0.2039, 0.2039`. `(5,{1,4})` `0.1307, 0.1305` | holds |
| Q | §3.31 union at cutoff 13 | three families | sums of two squares `{1,2,4,5,8,9,10,13}`; `4(k−1)=u²+3v²`: `{1,2,4,5,8,10,13}`; `k−4` a square: `{4,5,8,13}`; union of size 8, as printed | holds |
| R | §3.15 `≤1+√max(K−4,0)` | `K=3,4,5,13,1000` | `0≤1`, `1≤1`, `2≤2`, `4≤4`, `32≤32.56` | holds |
| K′, H″ | §2.44 on other odd characters; §2.22 against §2.44 | as in r15 | mod 7: `0.4691826` both sides; `2×0.8056548=1.6113096` | holds (r15 rows K′, H″) |
| J, L | §3.3 `a_K(m)≤d_n(m)`; §3.27 | as in r15 | `a(29)=6=d₆(29)`; `787≤7069≤36543` | holds (r15 rows J, L) |
| G, H, H′, I, C′ | §§2.17a, 2.22, 2.46, 3.4 | as in r15 | `0.78956835=\|L(1,χ)\|²`, consistent with row K's `L(1,χ̄)`; `1.6113096`; `[0.1479,6.4405]`; `1.7321` | holds (r15) |
| A–F | §§0.11b, 1.8a, 0.14, [116] paths | as in r15 | `−0.575344` against `−γ`; `F(2+i)=0.3763046204−0.1484734538i` | holds (r15) |
| 1–36 | §§0.1–0.34c, 1.2–1.9, 2.2a–2.16, 3.2–3.34 | as in r15 | e.g. §0.5 `155.2433<168<176.2001`; §2.9a least margin `0.000184` | holds (r15) |

**Library declarations.** The changed lines name none. The §3.13 row was checked against `landau_ramanujan` and `sumsOfTwoSquaresCount` (`Suggested.lean:914–924`): the counted set is `Finset.Icc 1 ⌊x⌋₊` filtered by `∃ u v : ℤ`, and the product exponent is `(-1 / 2 : ℝ)`.

**Remarks on untouched text (no change requested).** None. The previous remark about [73] missing from `sources.toml` is obsolete: the manifest now has `thornerzaman2017` (DOI `10.2140/ant.2017.11.1135`).

## Not verifiable

- Koukoulopoulos, *The Distribution of Prime Numbers* (AMS GSM 203): Chapter 13, (13.1)–(13.2), Theorem 13.2 on pp.130–134, and Exercise 13.4 on p.140. These are cited in the changed lines of §§3.13 and 3.16. The book is not openly available, and the sources service has no legal copy. The Ghosh–Sarnak half of each locator was verified.
- The earlier list stands for untouched passages: Jutila, Serre, Neukirch, Rosser–Schoenfeld 1962, Iwaniec–Kowalski, Montgomery–Vaughan, Titchmarsh, Friedlander–Iwaniec 2018 (uncertified), Kadiri 2005, and the printed pages of [73].

## Source issues

- **Misprint** in loww2025 at the proof of Lemma 4.3, printed p.21 of Forum Math. Pi 13, e19 (p.19 of arXiv v2): the proof says it takes `σ₁` as in the statement but sets `σ₁=1−ε₁/(4c)`, without the statement's maximum with 1/2; it should be `σ₁=max(1−ε₁/(4c),1/2)`, which Theorem 4.2's range `σ≥1/2` needs; affects nothing.
- **Misprint** in tsimerman2018 at the proof of Corollary 3.3, printed page 384: the source says log-differentiating the Artin functional equation bounds `L′/L(1,ρ)+L′/L(0,ρ)`; it should be `L′/L(0,ρ)+L′/L(1,ρ̄)`, since the two sums differ by `2i·Im L′/L(1,ρ)`; affects nothing.
- **Gap** in tsimerman2018 at the proof of Corollary 3.3, printed page 384: the source bounds `L′(1,ρ)` by Cauchy's formula on a small circle about 1 with the convexity bound, which presumes `L(s,ρ)` holomorphic on that disc (Artin holomorphy); it should apply Cauchy to each Hecke factor of a Brauer decomposition, as §2.45 does; affects the proof.
