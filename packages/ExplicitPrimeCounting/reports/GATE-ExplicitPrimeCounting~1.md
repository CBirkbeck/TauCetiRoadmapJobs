# GATE-ExplicitPrimeCounting~1: answers to the human review of `cac820b`

One review (CBirkbeck, 2026-11-13T11:35:05Z) with four findings F01–F04 (H01–H04) and two notes
for the human reviewers (H05 licence, H06 untested sources). All changes are in
`TauCetiRoadmap/ExplicitPrimeCounting/README.md`; `Suggested.lean` is unchanged. Commit `62095a29`.

## H01 (CBirkbeck) — applied

`buthe-2018` lines 685–704 and 800–819 confirm the finding: all 31 rows of Table 1 and all 31 rows of
Table 2 were printed, and no section used any row except through the envelope. README lines 1407–1421
(*ButheFinerRange*): the 62 printed pairs are replaced by "each of the thirty-one rows of its Table 1
(lines 685–704), at `x₀ = 2^j·10¹⁰, 2^j·10¹², 2^j·10¹⁴` (`0 ≤ j ≤ 6`) and `2^j·10¹⁶` (`0 ≤ j ≤ 9`)",
printing only the two rows that set the envelope, `(8·10¹⁰, −0.80, 0.86)` and `(1.6·10¹¹, −0.88, 0.68)`.
The Table 2 (`π*`) clause stays in the proposition, cited by locator (lines 800–819) without rows. The
envelope theorem (`−0.88 √x ≤ x − ψ(x) ≤ 0.86 √x` on `[100, 3.2·10¹³]`) and its use in §3.7 are
unchanged.

## H02 (CBirkbeck) — applied

`buthe-2016` lines 587–601 (12 rows) and 636–651 (13 rows) confirm the finding, and no other line of
the README or of any roadmap names *Buthe2016Table1* or *Buthe2016Table2*. README lines 1992–2002: the 25
printed `(b, δ₀)` pairs are replaced by the row counts, `b`-ranges and height bounds of the two tables
(`T ≤ 3.061·10¹⁰`, `T ≤ 2.445·10¹²`, from the captions) with one sample row each,
`(45, 3.5·10⁹, 1.11742·10⁻⁸)` and `(4000, 2.445·10¹², 1.90866·10⁻¹²)`. Both propositions, the theorem
they feed and the antitonicity argument are kept.

## H03 (CBirkbeck) — applied

The README itself printed 22 rows × 8 columns for each of Tables 7 and 7′ of
`fiori-kadiri-swidinsky-2023-psi`, and none of them was used: the instances use only the Table 8
interval rows. README lines 2808–2819 (*FioriKadiriSwidinskyDensity*): the 44 rows are replaced by the
grid of 22 abscissae (`0.6, 0.7, 0.8, 0.9`, `0.91, …, 0.99`, `0.991, …, 0.999`) and one sample row,
`(0.900, 0.1041, 0.3092, 0.3360, 25.3876, 12.0272, 6.0986, 2.8891)`. The two bounds asserted for every
row, the dependence of Table 7′ on `HiaryRecord`, and the Table 8 rows are unchanged.

## H04 (CBirkbeck) — applied

`fiori-kadiri-swidinsky-2023` lines 1347–1370 (Table 6, 9 rows) and 1371–1384 (Table 7, 11 rows), and
`broadbent-kadiri-lumley-ng-wilk-2021` lines 509–512 (12 values of `a₂`), confirm the finding. README
lines 2930–2935: the Corollary 23 and 24 lists become "each of the nine rows of their Table 6" and "each
of the eleven rows of their Table 7", keeping only the rows other statements use: `(0.826, 1/4, 1, 1)`
(input of the `0.4298` bound), `(121.107, 3/2, 2, 1)` (Corollary 22, used by Table 5's `ε_asymp` and a
Check) and one Table 7 sample. README lines 3236–3241: the `a₂(b)` list becomes "each of its twelve
pairs" with the corrected `a₂(35) ≤ 1.07087` and `(40, 1.04320)`, the value in *PsiThetaUpper*, which
ExplicitNumberFields also imports.

## H05 (CBirkbeck) — answered

The roadmap does not rely on a reuse licence for the arXiv or operator-local copies. Reading them is
permitted (open repository, or texts the operator holds). After H01–H04 the README reproduces no table
from them, only individual values with locators, each one used by a stated instance or a single sample
row. The *(preprint)* markings on §§2.6 and 3.8 and in the References follow the README's Conventions
(lines 338–341): a statement whose only source is a preprint is marked as such.

## H06 (CBirkbeck) — answered

The manifest has 93 sources: 60 certified with a cached text, 32 recorded `uncertified` (paywalled or
not legally readable, cited by locator only) and 1 `waived` (`cipolla-1902`). The 33 without text,
`dusart-2018`, `fiori-kadiri-swidinsky-2023-psi` and `lee-nosal-2026` among them, are exactly those 33,
so their values cannot be compared with a text. The H03 repair removed 44 of the rows taken from
`fiori-kadiri-swidinsky-2023-psi`; the one sample row kept was not re-checked against that source.

## Pattern search

Both scans (blocks with ≥ 7 numeric tuples and blocks with ≥ 18 decimals) found no further table printed
whole. Two candidates were looked at and left unchanged:

- *FioriKadiriSwidinskyZeroSums* (lines 1316–1320, 10 pairs). Every pair is a live input: §2.2 uses
  "every pair `(T₀, S₀)` there", the row `10⁷` is `ZetaZeroReciprocalSum`, and rows `10⁴`, `10⁵` appear
  in a Check.
- Dusart 2018's `θ` rows (§3.3). They are the statement of a theorem, collected from two versions rather
  than one table in source order. Rows are used: `(3, 1, 89 967 803)` is the input of §4.3, and
  *Dusart2018Range* (§1.3) restates the rows on `[x_k, 10¹⁹]`.

Consumers checked before removing rows: ExplicitNumberFields imports *ButheVerified*,
`Buthe2016Range` and *PsiThetaUpper* `(1 + 1.93378·10⁻⁸, 1.04320, e⁴⁰)`; ExplicitMultiplicativeFunctions
imports *ButheVerified*; EffectiveClassNumbers imports §0.3b. None of them cites a removed row
(`roadmaps grep` over main and the open heads).

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| *ButheFinerRange*, Table 1 grid | count of `x₀` | 7+7+7+10 = 31, matches lines 687–704 | holds | grid stated |
| Envelope on `[100, 3.2·10¹³]` | rows `x₀ ∈ [4·10¹⁰, 1.6·10¹³]` (10 rows) | min `M⁻` = −0.88 (1.6·10¹¹, 3.2·10¹¹), max `M⁺` = 0.86 (8·10¹⁰); coverage `[4·10¹⁰, 1.28·10¹²] ∪ [10¹², 3.2·10¹³]` ∪ (6.2) on `[100, 5·10¹⁰]` | holds | "attained at the two rows above" |
| Sign convention of `M⁻` | row `8·10¹⁰` | source caption bounds `(t − ψ(t))/√t`, `M⁻ = −.80` is the lower bound | `M⁻ √x ≤ x − ψ(x)` correct | none |
| *Buthe2016Table1/2* heights | captions | `3.061·10¹⁰ = 30 610 000 000 ≤ 30 610 046 000`; `2.445·10¹² ≤ 3 000 175 332 800` | antitonicity applies | heights from captions |
| *Buthe2016Table1/2* samples | `b = 45`, `b = 4000` | lines 590, 651: `(3.5·10⁹, 1.11742·10⁻⁸)`, `(2.445·10¹², 1.90866·10⁻¹²)` | match | — |
| `E₁` of Theorem 1 | cached `buthe-2016` | line 574 already contains `+ (e^{αε} − 1)` | rows are for the corrected statement | none |
| FKS Tables 7–7′ grid | count | 4 + 9 + 9 = 22 | matches former printed rows | grid stated |
| FKS sample row `σ = 0.9` | `c₁ = C₁/(2πd)` | `25.3876/(2π·0.3360) = 12.0255`; for `d ∈ [0.33595, 0.33605]`, `[12.0237, 12.0273]` ∋ `12.0272` | consistent "up to rounding of `d`" | — |
| FKS Table 6 rows | count; rows kept | 9 rows (lines 1362–1370); `(0.826, 0.25, 1.00, 1.000)`, `(121.107, 1.50, 2.00, 1.000)` | match | — |
| `0.4298` bound from row `(0.826, 1/4, 1)` | max of shape at `u = 1/4` | `0.826 · 0.70711 · 0.60653 = 0.35426 < 0.4298` | holds | none |
| Corollary 22 row | `121.107/R^{3/2}`, `R = 5.5666305` | `R^{3/2} = 13.13377`, ratio `9.22109` ≈ `9.2211` of (43) | consistent | none |
| FKS Table 7 sample | `E_π ≤ log² x/(8π√x)` | line 1376: range `8 ≤ log x ≤ 60.8` | match | — |
| `a₂(b)` values | all 12 `b`, formula (2.11)–(2.12) with (2.4) | `a₂(20) = 1.4262968`, `a₂(35) = 1.0708607 > 1.07086`, `a₂(40) = 1.0431971 ≤ 1.04320`, `a₂(43) = 1.0325207`, `a₂(50) = 1.0171752`, `a₂(100) − 1 = 2.420728·10⁻⁴`, `a₂(150) − 1 = 3.748067·10⁻⁶`, `a₂(200) − 1 = 7.711791·10⁻⁸`, `a₂(250) − 1 = 2.023358·10⁻⁸`, `a₂(300) − 1 = 1.935169·10⁻⁸` | only `b = 35` printed below the formula | `u = 1.07087` at `b = 35` kept |

## Lean, ownership and citations

- `Suggested.lean` was not edited and declares none of the affected propositions (they are italic README
  propositions), so the elaborated signatures in `signatures.md` stand and no `#check` pass was needed.
- No construction is added or moved. The affected propositions are stated nowhere else, on main or at the
  open heads listed in `open-pull-requests.md`, so this roadmap stays their owner.
- No cross-roadmap citation was added or changed.

## Build and gate

- `lake build TauCetiRoadmap.ExplicitPrimeCounting.Suggested`: `Build completed successfully (18650 jobs).`
  The only warnings are "declaration uses `sorry`".
- Gate, after the commit: `gate ExplicitPrimeCounting: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check: `depcheck: 213 roadmaps, 1891 edges, 0 problem(s)`. There is no UPWARD, CYCLE or
  `moved:` line.
