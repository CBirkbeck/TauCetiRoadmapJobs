# Review of ExplicitZetaBounds (pull request #1954 at 0889de2)

**Verdict:** needs changes

This is an incremental re-review of the 128 lines changed since `faca04c`, covering `TauCetiRoadmap/ExplicitZetaBounds/README.md` and `TauCetiRoadmap/ExplicitZetaBounds/Suggested.lean`. The previous review had four findings, and all four are repaired. One new P3 locator problem came in with the repair of the old R02 (R01 below). Nothing is blocking. The gate passes.

## R01 (P3) — Kadiri's thesis: the narrowed locator no longer covers the "real, simple, non-principal" clause

**Location.** `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 2762–2766: "(Kadiri, Théorème 11.1, `kadiri2002thesis` lines 1976–1980, English form (115) at lines 2063–2068) … has at most one zero in the region … and such a zero is real, simple and belongs to a real non-principal character".

**Claim.** The repair narrowed the line range from 1958–1980 to 1976–1980. Théorème 11.1 (lines 1976–1980) and Théorème 12.1 (lines 2063–2068) say only that `L_q(s)` has at most one zero in the region. The clause about that zero is in the chapter introductions, at line 1964 in French and line 2054 in English. The old range included line 1964; the new one does not. As a result, the item points to a passage that does not contain part of the statement it attributes to it. The README already cites the introduction (line 1960) for "q ≥ 2", in the same item.

**Witness.** `kadiri2002thesis` line 1964 (French) and line 2054 (English) both say that such a zero, if it exists, is real, simple and belongs to a real non-principal character. Neither Théorème 11.1 (printed p. 56) nor Théorème 12.1 (printed p. 58), as rendered, contains this clause. The manifest still records "lines 1958–1980".

**Repair.** Cite the clause where the source states it: "(Kadiri, Théorème 11.1, `kadiri2002thesis` lines 1976–1980, with the clause on the zero at line 1964; English form (115) at lines 2063–2068, clause at line 2054)". The mathematics needs no change. The tested instance is `q = 3`: the region's boundary is at least `0.7157`, and the clause on lines 1964 and 2054 is exactly what the item asserts.

## Previous findings

- R01 — repaired: README 2645–2647 now has three single-line code spans, "`Re Σ_{n≥1} Λ(n) n^{−s} f(log n) = … + Re F(s − 1)`", "`− Σ_ρ m_ρ Re F(s − ρ)`", "`+ Re((1/2πi) ∫_{1/2−i∞}^{1/2+i∞} …)`". The gate gives `tex=0`.
- R02 — repaired: README 2762–2778 now reads "for `q ≥ 3` … at most one zero in the region `σ ≥ 1 − 1/(6.4355 log(max(q, q|t|)/1.7367))`", and derives the narrower `max(q, q|t|, 1.7367)` form for `q ≥ 2` with the note on `q = 2`. The repair narrowed the locator; that problem is R01 above.
- R03 — repaired: `ZetaZeroFreeUpTo`, `LeongRecord`, `PlattSaadEddinRecord`, `ClassicalZeroFreeRegion` and `ZetaZeroDensityBound` are deleted from `Suggested.lean`. All 18 README lines with these names (549, 605, 618, 2615–2626, 2999, 3029, 3186–3201, 3358, 3362, 3431, 3453) are now in italics, and the module docstring (lines 11–18, 78–82) is adjusted.
- R04 — repaired: `sources.toml` records `grahamvaaler1981` (DOI `10.1090/S0002-9947-1981-0607121-1`, `publisher-open`), `chirrehelfgott2025` (`arxiv = "2512.15709v1"`) and `fks2023psi` (`arxiv = "2204.02588v3"`). README 2270 adds "Theorem 9, lines 407–408".

## Verified sound

**Gate, build and dependencies (run here at `0889de2`).**
- `gate … ExplicitZetaBounds --base origin/main`: every check is `0`, including `tex=0`, `latex=0`, `readme-ids-missing=0`, `stray-files=0`, `outside-folder=0` and `depcheck=0`, and it ends `OK`. The worker's `gate.md` agrees and reports `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ExplicitZetaBounds'` prints nothing. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- `lake env lean …/Suggested.lean` at the pin gives 37 warnings, all ``declaration uses `sorry` `` (one per `theorem`; there are 38 `theorem` lines, one of which is a word in a docstring), and no other message.
- `#check @name` for all 63 declarations, on a copy of the file in scratch: exit 0 and no errors. The elaborated types match `signatures.md`. No theorem statement changed since `faca04c`; only the five definitions and docstring text were removed. The previous review compared every signature with its README statement, so nothing new needed comparing. There is no `variable` block, so no binder can be lost.
- Depcheck output: `depcheck: 237 roadmaps, 2423 edges, 0 problem(s)`. It prints no UPWARD, CYCLE or `moved:` line. In the merge order, ExplicitZetaBounds is at line 267, after ZerosOfLFunctions (48), AnalyticNumberTheoryPartI (49) and SieveMethodsAndPrimePatterns (56), and before ExplicitPrimeCounting (269).
- Every remaining definition in `Suggested.lean` is used by a theorem. I checked this by grep: `PlattCentralRecord` (line 135), `HiaryLeongYangRecord` (652), `BordignonRecord` (638), `MossinghoffStarichkovaTrudgianRecord` (765), `LuZamanZhaoLOneRecord` and `LuZamanZhaoRecord` (776–777), `vinogradovCount` (446), and `zetaOrdinateInvSqSum` through `BrentPlattTrudgianRecord` (208). Every backticked record left in README 0.4/0.4b is declared.

**Changed passages, read at the source.**
- `kadiri2002thesis`: I rendered PDF pages 59 and 61 (printed pp. 56 and 58). (111) and (115) read `σ ≥ 1 − 1/(R₁ log(max(q, q|t|)/c))` with `R₁ = 6.4355`, `c = 1.7367`, so the README's source form is the printed one. Line 1960 has "lorsque q ≥ 2", and line 2049 has "for q ≥ 2". Lines 1976–1980 are Théorème 11.1 and lines 2063–2068 are Théorème 12.1. For R01, the clause is at 1964 and 2054.
- `grahamvaaler1981`: line 407 is "Theorem 9", which gives a unique extreme majorant `M_f` and minorant `m_f` for every `f` of the form (1.18)–(1.20). With `ν = δ_λ`, (1.18) is `E(λ, x)`, the README's `I_λ` (`grahamvaaler1981` lines 123–132), and the condition `∫ λ⁻¹ dν = 1/λ < ∞` holds. Theorem 6 (lines 332–333) gives `m ≤ E ≤ M`. The locator is correct.
- ExplicitPrimeCounting's gap `dirichlet-zero-free-constants` (its README line 501) asks for exactly the narrower form "for `q ≥ 2` … `σ > 1 − 1/(6.4355 log max(q, q|t|, 1.7367))`". README 2769–2775 now states that form as a consequence, so the supplier contract still holds.
- `roadmaps grep` for the five deleted names: ExplicitMultiplicativeFunctions (#1946) cites "`LeongRecord` (ExplicitZetaBounds §0.4b)" by section, and that section still states the record. ExplicitPrimeCounting (#1945) has its own `TauCetiRoadmap.ExplicitPrimeCounting.ClassicalZeroFreeRegion`, which no longer shares a short name with a Lean name here.
- `overlaps.md`: no other pull request changes this roadmap, and no dropped ids. `citations.md`: the three Lean names it lists (`SieveTaper.sharp_additive_largeSieve`, `SieveApplications.sharp_primitive_largeSieve`, `gammaRemainder.slit_logGamma`) are on untouched lines, and the previous review resolved them.

**Seeded sample, where the changes fall.** 0.4b (italicised records; I re-read `saadeddin2016` lines 791–799 and `plattsaadeddin2013` lines 33–37 and 547–557, `kadiri2005` line 992 and `thornerzaman2024` line 305 for the `14` record), 6.3a (the Graham–Vaaler locator above), and 7.3/7.3a (the display of R01 and the predicate text). The other sampled targets (0.5, 2.5, 2.9, 3.2a, 4.5c, 5.2a, 5.3, 5.4, 6.1a, 6.6, 7.1, 7.7) are untouched since `faca04c`, which the previous review checked.

**Adversarial table.** The rows for changed statements were computed here. Untouched statements carry the previous report's rows (PRREVIEW-ExplicitZetaBounds~8, table "Adversarial table").

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| 7.5 first item, source form (`q ≥ 3`) | `q = 3, 4`, `t = 0` | boundary `0.71573`, `0.81375` (`log(3/1.7367) = 0.54663`) | ✓ |
| 7.5 source form vs 7.3 | `q = 3`, `|t| = 2`; `|t| = 10`; `|t| = 10⁶` | `0.87466 ≥ 0.74046`; `0.94546 ≥ 0.92187`; `0.98918 ≥ 0.98698`. `min_{|t|≥2} (6.4355 log(3|t|/1.7367) − 5.558691 log|t|) = 4.1256` at `|t| = 2` | ✓ |
| 7.5 source form, Euler-factor zeros | `q = 4`, `t = 2π/log 2 = 9.0647` | boundary `0.94886 > 0`, so the zero on `Re s = 0` is outside | ✓ |
| 7.5 narrower form (`q ≥ 2`) | `q = 2, 3, 4`, `t = 0`; `q = 2`, `|t| = 2` | `0.77582`, `0.85856`, `0.88791`; `0.88791 ≥ 0.74046`. `min_{|t|≥2} (6.4355 log(2|t|) − 5.558691 log|t|) = 5.0685` | ✓ |
| 7.5 narrower ⊂ source (`q ≥ 3`) | `3 ≤ q ≤ 59`, `0 ≤ t < 5` step `10⁻³` | no grid point with narrower boundary < source boundary | ✓ |
| 7.5 source form at `q = 2` | `t = 0`; `|t| = 9.0647` | boundary `−0.10079`, containing `s = 0` with `(1 − 2⁰)ζ(0) = 0`; at the next Euler-factor zero the boundary is `0.93375 > 0`, so `s = 0` is the only zero in the region. "At most one" holds, the non-principal clause fails, as README 2775–2778 says | ✓ |
| 6.3a extremal values (GV Thm 9) | `ν = 1` | `Σ_{n≥0} e^{−n} − 1 = 0.58198`, `1 − 1/(e − 1) = 0.41802`, sum `1 = ∫ (sin πx/πx)²` | ✓ |
| 7.3a predicate (now prose) | `R = 5.558691`, `t₀ = 2`; `R' = 5.573412` at `|t| = 10` | the predicate at `(5.558691, 2)` is the contrapositive of `riemannZeta_ne_zero_classical`; boundaries `0.921871 ≤ 0.922077` (monotonicity) | ✓ |
| 0.4b records (now prose), 8.3a predicate | as in report ~8 | `LeongRecord` ratios `0.0707`, `0.0376`; 8.3 instance `11.499`, `3.186`, `(4/15)`, `(16/5)` | carried |

**Headline theorems and padding.** No theorem changed. There are still 37 theorems, and the module docstring still names the one unstatable headline (Rademacher's bound for a general record) with its missing carrier. The deletions removed the padding the previous review found (its R03). The previous one-tactic probe stands.

**Remark on another roadmap (no change asked here).** ExplicitPrimeCounting's `ClassicalZeroFreeRegion` docstring (its `Suggested.lean` 154–156) does not name §7.3a here as the owner. That roadmap's own review should settle this.

## Not verifiable

- `chirrehelfgott2025`: the cache now marks the extraction image-only. The 6.3a locators into it did not change, and the previous review checked them against a readable extraction.
- `leong2026`, `leeLeong2022`, `hoffstein1981`: image-only in the cache, and there is no OCR on this worker. None of their locators changed.
- The uncertified and waived works listed in the previous report. None of their locators changed.

## Source issues

- none
