# Review of ExplicitNumberFields (pull request #1944 at 43f46f2)

**Verdict:** needs changes

Incremental re-review of the 127 lines changed since `1af1d0f` (13 group headings with a one-paragraph introduction each, 17 subsection headings turned into bold run-in labels, one docstring of `Suggested.lean`), and the first check of the pull request's title and description against the head. The folder has no finding; the description has one.

## R01 (P3) — the description's "Approach and generality" paragraph is contradicted by the head

**Location** Pull request description, "Approach and generality": "Every bound is stated for a general number field of degree `n` and discriminant `d_K` […]; the results of the cited authors are instances of the general theorems."

**Claim** The head states many bounds for special classes of fields or for no field at all, and its targets are the cited authors' theorems themselves, not instances of more general theorems (1.1 excepted).

**Witness** `TauCetiRoadmap/ExplicitNumberFields/README.md`: 2.7 (line 1614) imaginary quadratic only; 5.2 abelian; 5.4 cubic and quartic; 5.5–5.6 CM-fields; 5.7 Galois; 4.5 only for `d_K ≥ D₀`; Layer 6 (line 78) bounds `g(p)`, `h(p)` for primes.

**Repair** Replace the paragraph by: "**Approach and generality.** The ideal counts, residue bounds, zero counts and zero-free regions are stated for every number field of degree `n` and discriminant `d_K` where the cited theorem allows it, and otherwise for the class it covers: imaginary quadratic fields (2.7), abelian fields (5.2), cubic and quartic fields (5.4), CM-fields (5.5–5.6), Galois fields and extensions (5.7, 7.2–7.5), and fields with `d_K` beyond an absolute threshold (4.5, the second region of 4.6). Layer 6 is about the least primitive roots modulo `p` and `p²`. The generalized Riemann hypothesis and finite computations enter only as named hypotheses. Each target is the cited theorem at its own generality; the convexity bound of 1.1 is the Dedekind instance of the general bound of ExplicitZetaBounds."

## Previous findings

- none: the review of `1af1d0f` had no finding (its R01 of the round before was already recorded as repaired).

## Verified sound

### Adversarial table

The diff changes no statement (the one Lean edit is the docstring of `idealCount_sunley`). The rows are for statements the new group paragraphs cite, recomputed at this head.

| Statement | Instances | Values (left vs right) | Result |
|---|---|---|---|
| 2.2 `idealCount_sunley`; group claim "error term in `n`, `d_K` and `x` alone" | `ℚ(i)`, `x = 10` | count `9`, `κ_K x = 7.85398`, error `1.14602`; right side `1.153·10³¹`, no `R_K`, `h_K` in it | true; claim matches |
| 2.4 `idealCount_debaene`; group claim "error terms in the regulator" | `ℚ(i)`, `x = 10`, `R = h = 1` | error `1.14602`; right side `2⁴⁰·√10 = 3.477·10¹²`; (A1), (A2), (B2) of 2.6 carry `R_K` | true; claim matches |
| 3.3 Friedman (in group 3.1) | `ℚ(i)` | `κ = π/4 = 0.785398 ≥ 0.36232/2 = 0.18116` | true |
| 4.1 Trudgian; group claim "for `T ≥ 1`" | `ℚ`, `T = 15`, `N = 2` | `|2 − (−0.61988)| = 2.61988 ≤ 10.67345` | true |
| 4.2 Hasanalizade–Shen–Wong (in group 4.1) | `ℚ`, `T = 15` | `|2.61988 + 1/4| = 2.86988 ≤ 27.77113` | true |
| 4.5 and 4.6 (group 4.5: "no zero for `|t| ≥ 1`") | `ℚ`, `|t| = 14.13` | Kadiri `σ ≥ 0.988548`; Lee `σ ≥ 0.963729`; both right of the zero at `σ = 1/2` | consistent |
| 6.3 end theorem named in the group paragraph, `g(p) < p^{5/8}` for `p > 3` | `p = 3, 5, 7, 409` | `g = 2, 2, 3, 21` against `1.98701, 2.73436, 3.37432, 42.88714` | false at `3`, true above: `p > 3` as stated |

The rows for every other statement stand as in the previous review, of `1af1d0f`.

### The new group paragraphs against the *Needs:* lines

Each "uses" clause was checked against the *Needs:* line of the section it names:

| Paragraph | Clause | *Needs:* line at the head | Result |
|---|---|---|---|
| 2.2 | "7.1 uses the count of 2.2" | 7.1 (README 3286): "2.2" | agrees |
| 2.4 | "7.5 uses 2.4 and its route" | 7.5 (3462): "2.1, 2.4 (Debaene's Theorem 11 and Lemma 12)" | agrees |
| 3.1 | "5.1 uses 3.1 and 3.2, and 5.6 uses 3.1 and 3.4" | 5.1 (2565): "3.1; 3.2"; 5.6 (2851): "3.1, 3.4" | agrees |
| 3.5 | "3.6 uses the quotient record, Garcia–Lee's Mertens lemma and the short-sum theorem" | 3.6 (2003): the same three, by name | agrees |
| 4.1 | "7.3 and 7.4 use the counts of 4.2" | 7.3 (3382), 7.4 (3419): "4.2" | agrees |
| 4.3 | "4.7–4.10, 5.6 and 7.3 use 4.3, and 4.8 also uses 4.4" | 4.7 (2364), 4.8 (2416), 4.9 (2468), 4.10 (2517), 5.6 (2851), 7.3 (3382): "4.3"; 4.8: "4.4" | agrees |
| 4.5 | "4.8 runs their argument with two changes, 4.10 uses 4.5, 7.3 uses 4.6, and 7.4 uses both" | 4.8 route (2381–2386): "with two changes"; 4.10: "4.5"; 7.3: "4.6"; 7.4: "4.5–4.7" | agrees |
| 5.1 | "5.6 uses the route of 5.2" | 5.6 (2851): "5.2's route" | agrees |
| 5.3 | "through the class-number lemma of 0.3 and divisor-sum bounds" | 5.3 (2652), 5.4 (2692): "0.1, 0.3"; ExplicitMultiplicativeFunctions §§7.5, 7.9 | agrees |
| 5.5 | "through the relative class-number formula of 0.4" | 5.5 (2717), 5.6 (2850): "0.4" | agrees |
| 6.1 | "6.3 uses both, and 6.4 and 6.5 use 6.1" | 6.3 (3053): "6.1, 6.2"; 6.4 (3120), 6.5 (3219): "6.1" | agrees |
| 6.3 | "6.5 takes `e`, `s`, `δ` as in 6.3" | 6.5 (3139, 3168): "`e`, `s`, `δ > 0` as in 6.3" | agrees |
| 7.2 | "under the generalized Riemann hypothesis or from the zero counts, regions and repulsion of Layer 4" | 7.2 (3340): `DedekindERH`; 7.3: 4.2, 4.3, 4.6, 4.8; 7.4: 4.2, 4.5–4.7, 4.10 | agrees |

### Counts

- **Ids.** All 17 sections that lost their `###` heading keep their number as a bold label (2.3, 2.5, 2.6, 3.2, 3.3, 3.4, 3.6, 4.2, 4.4, 4.6, 5.2, 5.4, 5.6, 6.2, 6.4, 7.3, 7.4); no id is dropped or renumbered. A grep of the README and `Suggested.lean` for the 12 replaced heading titles finds no stale reference.
- **Cross-roadmap citations resolved (6).** ExplicitZetaBounds README 215 cites "`ExplicitNumberFields` 4.6" (its `roadmaps resolve` lists nothing missing); ExplicitZetaBounds 3854; ComputationalNumberTheory README 124, 2196, 2219 and SpecialFunctionsGamma README 47 cite 1.1a, which is untouched.
- **Seeded sample.** Of the sampled targets, 2.4, 3.1, 4.5, 5.3 and 6.1 fall in changed lines (their group paragraphs, rows above); the statements and locators of the others are untouched. The README flags no locator as unverified.
- **Gate.** Rerun at `43f46f2`: every counter `0`, `OK`, exit code 0; the worker's gate also reports `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check.** `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`, exit code 0; no UPWARD, CYCLE or `moved:` line. The diff adds no supplier citation.
- **Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` for all 21 declarations: 16 warnings, all "declaration uses `sorry`", no error. The file has no `variable` block; the diff changes one docstring (line 145) and no signature, so the elaborated types and the padding probe of `1af1d0f` stand.
- **Description, other sentences.** Title and the three remaining paragraphs agree with the head: it adds the roadmap (3 files, 21 declarations); `g(p) < p^{5/8}` for `p > 3` (README 78, 3022–3023); least primitive root modulo `p²` below `p^{2/3}` for odd `p` (README 78, 3182, written `h(p)` there); Brauer–Siegel under *UniformQuadraticZeroGap* (README 2858–2860).
- **Declared gaps.** The diff touches neither `## Exact supplier contracts` nor a `gap:` contract.

Overlap check: read ExplicitPrimeCounting, ExplicitZetaBounds, ExplicitMultiplicativeFunctions, ExplicitCharacterSumsAndSieves (open heads) and AnalyticNumberTheoryPartI, ZerosOfLFunctions, LFunctions (main, as cited in Scope); nothing shared: each hands the number-field statements to this roadmap (ExplicitZetaBounds README 151, 168, 208; ExplicitMultiplicativeFunctions 213; ExplicitCharacterSumsAndSieves 1819) and this roadmap consumes theirs (README 116–130).

Source independence: changed passages only; 13 group paragraphs compared with 25 cached sources, none shared (longest common run 5 words, "at most m real zeros", `louboutin2015ijnt`); no layer added, removed or reordered, so the arrangement was not compared again.

### Remarks on untouched text (no change requested)

- 2.7, README 1636–1637: "the term `ζ_K(0)`, which is nonzero only for imaginary quadratic fields" also holds for `ℚ` (`ζ(0) = −1/2`); within 2.7 nothing depends on it. Carried from the previous report.

## Not verifiable

- `fehnker2026`, `gglm2026`, `palojarvisimonic2026`, `dglsw2025`, `daskadiring2025`, `greniemolteni2019`, `ahnkwon2019`, `kadiringwong2019`, `mcgownsorenson2024`, `cullyhugilltrudgian2021`, `tudzi2026`: recorded as uncertified; the group paragraphs that summarise 2.6, 3.6, 4.8, 5.4, 6.3 and 7.2–7.4 were checked against the README's own statements, not against these texts.

## Source issues

- none

## For the human reviewers

- **Scope.** 4.9 and 5.7 rest on a uniform Landau–Siegel gap whose sources are 2026 preprints (`guo2026`, `banks2026siegel`, `banks2026brauersiegel`, `openai2026siegel`, `kerr2026`, `green2026`; README 272); it enters as the hypothesis *UniformQuadraticZeroGap*.
- **Licence.** 1.1a cites `pntplus` (Apache 2.0, a public formalisation) for the digamma series; `digamma_series_remainder` in `Suggested.lean` states a remainder bound that file does not contain.
