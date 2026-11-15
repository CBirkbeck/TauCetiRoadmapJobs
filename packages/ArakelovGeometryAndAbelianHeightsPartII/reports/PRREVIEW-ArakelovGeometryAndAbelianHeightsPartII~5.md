# Review of ArakelovGeometryAndAbelianHeightsPartII (pull request #1833 at 581cf9f)

**Verdict:** accepted

Incremental re-review of 6 changed lines since 1dce7a6 (the library line locators of `README.md` lines 41, 45 and 47), and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: the description now reads "`Suggested.lean` declares nothing: its module docstring names every headline theorem as not statable at the pinned Mathlib and Tau Ceti, with the carrier each lacks; every target is in the README."
- R02 — repaired: "the targeted Lake build succeeds with no warning (the file declares nothing, so there is no `sorry`)"; `lake env lean` on the file exits 0 with empty output.
- R03 — repaired: "Mathlib and Tau Ceti contain none of the adelic, admissible-metric or curve-moduli positivity material at the pins. Earlier roadmaps supply parts of it, which the README imports by section"; the five citations that follow resolve (below).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `README.md` line 41: `NumberField.prod_abs_eq_one` "includes infinite-place multiplicities", needs x ≠ 0 | x = 2 over ℚ; x = 2 over ℚ(i); x = 0 | ℚ: 2·(1/2) = 1. ℚ(i): one complex place, 2² = 4; prime above 2 has norm 2, v(2) = 2, so 2⁻² = 1/4; product 1. x = 0: product 0 ≠ 1 | pinned statement at `ProductFormula.lean:98` has `w x ^ w.mult` and `x ≠ 0`; agrees | none |
| `README.md` line 41: `Projectivization.logHeight` relative; [1:2] gives log 2 over ℚ, 2 log 2 over a quadratic field | ℚ; ℚ(i); ℚ(√2) | ℚ: max(1,2)·1 = 2, log 2. ℚ(i): max(1,2)² = 4 at the complex place, finite sup 1, log 4 = 2 log 2. ℚ(√2): two real places, 2·2 = 4 | agrees with `Height.mulHeight` (product over the place multiset, no 1/[K:ℚ]) | none |
| `README.md` line 47: `eulerDegree` is χ(L) − χ(𝒪) through H¹; canonical degree 2 at g = 2, 0 at g = 1 | g = 1, 2; L = 𝒪 | 2g − 2 = 0, 2; χ(ω) − χ(𝒪) = (g − 1) − (1 − g) = 0, 2; L = 𝒪 gives 0 | agrees with `Degree.lean:74` (difference of `eulerCharBelow … 2`) and `SerreDuality.lean:223` | none |
| `README.md` line 45: `InvertibleSheaf` is a full subcategory, morphisms module maps | zero map 𝒪 → 𝒪; zero sheaf | zero map is a morphism and not an isomorphism; zero sheaf has rank 0 ≠ 1 on a nonempty scheme | agrees with `Basic.lean:119` (`ObjectProperty.FullSubcategory (SheafOfModules.isInvertible X)`) | none |

The rows for all other statements stand as in the previous review, of 1dce7a6.

- Library declarations opened at the pins (7 of 7 changed or adjacent locators land on the declaration line): `prod_abs_eq_one` at `Mathlib/NumberTheory/NumberField/ProductFormula.lean:98`; `Projectivization.logHeight` at `Mathlib/NumberTheory/Height/Projectivization.lean:54`; `InvertibleSheaf` at `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:119`; `AbelianVariety` at `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`; the two `eulerDegree` at `TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:74` and 130; `eulerDegree_canonicalBundle` at `TauCeti/AlgebraicGeometry/LineBundle/SerreDuality.lean:223`. No other pinned-file line locator occurs in `README.md` or `Suggested.lean`.
- Gate re-run on this head: every check 0, OK; the worker's gate reports build=0. `git diff --stat origin/main...HEAD` outside the folder is empty (the files listed as changed since 1dce7a6 come from the merge of main).
- Dependency check with `--movable`: `depcheck: 242 roadmaps, 2246 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. No declaration, so no `#check` comparison and no one-tactic probe.
- Description against the head, cross-roadmap citations resolved at the open heads (11 sections, 5 roadmaps): HeightsRationalPointsAndObstructions §§5.17a "Arithmetic divisor action", 5.17b "Adelic model limits"; ArithmeticDynamics §4.3a; TropicalAndBerkovichArithmetic §§6.6–6.8; GrossZagierAndArithmeticHeights §§2.4, 2.8, 2.10; StableReductionPartII §§6.9, 6.21, 6.22. Each matches what the description and `README.md` lines 9–13 say it supplies.
- Description against the head, other sentences confirmed: the pull request adds the roadmap (not on main; 2265 insertions, 0 deletions, no heading or declaration removed); the folder holds `README.md`, `Suggested.lean`, `metadata.toml`; Part I's stopping point matches `README.md` line 7; §4.9 identifies the two adelic carriers; no file of the pinned Mathlib or Tau Ceti mentions adelic line bundles or admissible metrics; the summary block agrees with the headings it names.
- Source locators: none re-read (the changed passages carry no source locator); the seeded sample falls in no changed passage.
- Overlap check: read HeightsRationalPointsAndObstructionsPartII, ArithmeticDynamics, ArakelovGeometryAndAbelianHeights; global-field quasi-projective adelic Picard group: ArithmeticDynamics §4.3a owns, §4.9 here cites and compares; uniform Bogomolov and small points: HeightsRationalPointsAndObstructionsPartII owns and cites this roadmap; Part I has no adelic, admissible or Deligne-pairing target. Nothing has two owners.
- Source independence: changed passages only: 3 passages compared (line locators into the pinned libraries, no source text involved), none shared; largest share yuan-2026, 86 of 209 locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- moret-bailly-1989 Théorème 2.5 (§10.12): settled as uncertified.
- faltings-1984 Theorem 6 and pp. 401–402 (§§10.11–10.12): settled as uncertified.
- Heinz, Proposition 4.3 (§7.4 route): cited only through yuan-2026 p. 112; the text itself was not consulted.
- The description's "5 independent review rounds and 2 red-team rounds": a statement about the process, not checkable against the head.

## Source issues

- none

## For the human reviewers

- Licence: yuan-2026, the source of 86 of 209 locators, is read from the author manuscript on the author's faculty page (README References), with the journal reference Annals of Mathematics 203 (2026) given beside it.
- Licence: yuan-zhang-2025 (56 locators) and looper-silverman-wilms-2021 are cited in the README References by arXiv version only (2105.13587v9, 2101.11593v3), with no journal or book reference.
- Scope: `Suggested.lean` states no theorem: its docstring lists all headline theorems as not statable at the pins, so the build tests nothing about the mathematics.
