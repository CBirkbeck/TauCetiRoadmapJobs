# Review of ExplicitPrimeCounting (pull request #1945 at 62095a2)

**Verdict:** accepted

No finding. Incremental re-review of the 130 lines changed since `cac820b` (`TauCetiRoadmap/ExplicitPrimeCounting/README.md` only; `Suggested.lean` is unchanged). The change replaces five printed source tables by their locators, row counts and the rows the roadmap uses.

## Previous findings

- The previous review (of `cac820b`) was an acceptance with no finding: there is nothing to account for.

## Verified sound

| Statement | Instance | Values (each side) | Result | Change |
|---|---|---|---|---|
| *ButheFinerRange*, Table 1 clause (§1.3) | `buthe-2018` lines 685–704 | 7 + 7 + 7 + 10 = 31 rows; `8·10¹⁰`: `(−.80, .86)` at line 690; `16·10¹⁰`: `(−.88, .68)` at line 691 | count, locator, two rows match | none |
| *ButheFinerRange*, consequence on `[100, 3.2·10¹³]` | rows `4·10¹⁰ … 6.4·10¹¹`, `10¹² … 1.6·10¹³` | cover `[4·10¹⁰, 3.2·10¹³]`; least `M⁻ = −0.88` (`1.6·10¹¹`, `3.2·10¹¹`), greatest `M⁺ = 0.86` (`8·10¹⁰`); the excluded row `3.2·10¹³` has `0.93` | `(−0.88, 0.86)` right; agrees with the row `(100, 3.2·10¹³, 0.88, 0.86)` of §3.7 | none |
| *ButheFinerRange*, `π*` clause | `buthe-2018` lines 800–819 | Table 2 has the same 31 `x₀` (lines 802–819) | locator and count match | none |
| *Buthe2016Table1* (§2.3) | `buthe-2016` lines 587–601 | 12 rows, `e⁴⁵ … e³⁰⁰⁰`; line 590: `e⁴⁵`, `T = 3.5·10⁹`, `δ₀ = 1.11742·10⁻⁸`; every `T ≤ 3.061·10¹⁰ ≤ 30 610 046 000` | match | none |
| *Buthe2016Table2* (§2.3) | `buthe-2016` lines 636–651 | 13 rows, `e⁵⁵ … e⁴⁰⁰⁰`; line 651: `T = 2.445·10¹²`, `δ₀ = 1.90866·10⁻¹²`; every `T ≤ 2.445·10¹² ≤ 3 000 175 332 800` | match | none |
| *FioriKadiriSwidinskyDensity*, Tables 7–7′ (§3.4) | abscissae; the row at `0.900` | 4 + 9 + 9 = 22; its `c₁ = 12.0272` equals `c̃₁` of the Table 8 row `(0.89, 0.90, 12.0272, 2.9717)` printed just above | count right, consistent; the table itself not readable (below) | none |
| §3.4a consequences, Table 6 | `fiori-kadiri-swidinsky-2023` lines 1347–1370 | 9 rows (lines 1362–1370); line 1363 `(0.826, 0.25, 1.00, 1.000)`; line 1369 `(121.107, 1.50, 2.00, 1.000)`, the caption naming it the row of Corollary 22; "See Corollary 23" | match | none |
| §3.4a consequences, Table 7 | lines 1371–1384 | 11 rows (lines 1373–1384); lines 1375–1376: `(1/8π) log² x · x^{−1/2}`, `8 ≤ log x ≤ 60.8`; "See Corollary 24" | match | none |
| §3.4a, the `0.4298` bound | the row `(0.826, 1/4, 1, 1)` still printed | `0.826 (1/4)^{1/4} e^{−1/2} = 0.35426 < 0.4298`; `1/e = 0.3679` | route keeps its input | none |
| §3.7, the values of `a₂(b)` | `broadbent-kadiri-lumley-ng-wilk-2021` lines 509–512; formula (2.12) at the 12 points | 7 + 5 = 12 pairs; formula: `1.426297, 1.219594, 1.121056, 1.0708607, 1.0431971, 1.032521, 1.017175, 1 + 2.42073·10⁻⁴, 1 + 3.74807·10⁻⁶, 1 + 7.71179·10⁻⁸, 1 + 2.02336·10⁻⁸, 1 + 1.93517·10⁻⁸` | each at most the printed value except `b = 35` (`1.0708607 > 1.07086`), as the text says; `1.07087` holds | none |
| §3.7, *PsiThetaUpper* `(1 + 1.93378·10⁻⁸, 1.04320, e⁴⁰)` | `b = 40` | formula `1.0431971 ≤ 1.04320`; printed `1.04320` at line 510 | match | none |

The rows for the untouched statements stand as in the previous review, of `cac820b`.

- Source locators checked against the text: 7 (`buthe-2018` Tables 1 and 2; `buthe-2016` Tables 1 and 2; `fiori-kadiri-swidinsky-2023` Tables 6 and 7; `broadbent-kadiri-lumley-ng-wilk-2021` lines 509–512), all matching.
- Dependents of the removed rows: the README was searched for 30 of the removed values and for every mention of *ButheFinerRange*, *Buthe2016Table1/2*, *FioriKadiriSwidinskyPiTables*, *FioriKadiriSwidinskyDensity*, Tables 6, 7, 7–7′ and `a₂(`; every row a later passage uses is still printed where it is used (lines 1410–1411, 2817, 2931–2937, 3222, 3255–3256). `roadmaps grep` finds none of these propositions cited by another roadmap, on main or open.
- Library declarations: the diff names none; `Suggested.lean` is byte-identical to `cac820b`, so the signature comparison and the one-tactic probe of the previous review stand.
- Cross-roadmap citations in the changed passages: ExplicitZetaBounds §4.7 (`HiaryRecord`) and this roadmap's §§0.3, 1.1, 2.2, 3.4, 3.7, all untouched and existing; `scratch/overlaps.md` lists no dropped id and no other pull request changing the folder.
- Gate: the worker's gate at `62095a2` and my rerun report every check `0`, "OK"; no file changed outside the folder; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ExplicitPrimeCounting/Suggested.lean` gives 16 "declaration uses `sorry`" warnings and nothing else.
- Dependency check: `depcheck: 218 roadmaps, 1938 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Pull request text: the title and description describe nothing the change alters (the description's "Finite-range verifications and tables are named propositions used as hypotheses" holds at this head); no supplier, heading or Lean declaration is added or removed.

Overlap check: read ExplicitZetaBounds, ExplicitMultiplicativeFunctions, ExplicitNumberFields (as in the previous review; the change moves no ownership); nothing shared.

Source independence: changed passages only; 5 passages compared with 4 sources (`buthe-2018`, `buthe-2016`, `fiori-kadiri-swidinsky-2023`, `broadbent-kadiri-lumley-ng-wilk-2021`), none shared, and the change removes the five tables that were carried over row by row, keeping at most two rows of each; the diff adds, removes and reorders no layer, so the arrangement was not compared again. The text of `fiori-kadiri-swidinsky-2023-psi` could not be read.

## Not verifiable

- `fiori-kadiri-swidinsky-2023-psi` Tables 7–7′ (settled as uncertified, cited by locator): the retained row `(0.900, 0.1041, 0.3092, 0.3360, 25.3876, 12.0272, 6.0986, 2.8891)` and the 22 abscissae are unchanged from the text the previous review read, and were checked only for internal consistency.
- The items of the previous report's `## Not verifiable` stand unchanged.

## Source issues

- **Misprint** in broadbent-kadiri-lumley-ng-wilk-2021 at the table of values of `a₂` after Corollary 5.1, arXiv v2 p. 9: the source says `a₂(35) = 1.07086`; it should be at least `1.0708607` (so `1.07087` rounded up), by its own formula (2.12); affects nothing.

## For the human reviewers

- **Licence.** *ButheFinerRange*, *Buthe2016Table1/2*, *FioriKadiriSwidinskyPiTables* and *FioriKadiriSwidinskyDensity* now assert source tables by locator and row count without printing them (`TauCetiRoadmap/ExplicitPrimeCounting/README.md` lines 1407–1422, 1997–1999, 2809–2819, 2930–2935): whether that form suits the project is yours to decide.
- **Scope.** Sections 2.6 and 3.8 and several instances rest on sources marked *(preprint)* in the README (`chirre-helfgott-2025`, `fiori-jaskari-2026`, `banks-2026`; lines 1666–1667, 2087, 3173, 3313).
