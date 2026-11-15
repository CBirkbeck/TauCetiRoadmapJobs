# Review of ArakelovGeometryAndAbelianHeightsPartII (pull request #1833 at 1dce7a6)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 1dce7a6: the folder is unchanged, and this round reads the pull request's title and description against the head. Three sentences of the description are contradicted by the head (all P3); the roadmap files need no change.

## R01 (P3) — The description says the Lean states definitions and theorems; it declares nothing

**Location:** pull request description, paragraph "Roadmap folder …": "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti; every target is in the README."

**Claim:** At this head `Suggested.lean` contains no definition and no theorem, so a reader is told an acceptance test exists that does not.

**Witness:** `TauCetiRoadmap/ArakelovGeometryAndAbelianHeightsPartII/Suggested.lean` lines 76–78: the namespace opens and closes with nothing between; line 12, in its docstring: "None of the headline theorems is statable at the pins".

**Repair:** Replace the clause by: "`Suggested.lean` declares nothing: its module docstring names every headline theorem as not statable at the pinned Mathlib and Tau Ceti, with the carrier each lacks; every target is in the README."

## R02 (P3) — The validation line reports a `sorry` warning the build does not produce

**Location:** pull request description, paragraph "Validation": "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** The build of this head emits no warning at all, because the file has no `sorry`.

**Witness:** `lake env lean` on `TauCetiRoadmap/ArakelovGeometryAndAbelianHeightsPartII/Suggested.lean` at 1dce7a6 exits 0 with empty output; the file contains no declaration (R01).

**Repair:** Replace by: "the targeted Lake build succeeds with no warning (the file declares nothing, so there is no `sorry`)".

## R03 (P3) — "None of the adelic, admissible-metric or curve-moduli positivity material exists in … an earlier roadmap" contradicts the README's supplier contracts

**Location:** pull request description, first prose paragraph: "none of the adelic, admissible-metric or curve-moduli positivity material exists in Mathlib, Tau Ceti or an earlier roadmap."

**Claim:** The README imports part of each of the three from earlier roadmaps, and the description's own summary block says the adelic theory extends the ArithmeticDynamics carrier.

**Witness:** `README.md` line 9: "ArithmeticDynamics §§4.1a, 4.3, 4.3a and 4.4 owns … quasi-projective adelic bundles/intersections/heights over global fields"; line 11: GrossZagierAndArithmeticHeights owns "archimedean admissible metrics"; line 13: StableReductionPartII supplies "maximal-variation Hodge positivity".

**Repair:** Replace by: "Earlier roadmaps supply only the global-field adelic slice (ArithmeticDynamics §4.3a), the archimedean admissible metric (GrossZagierAndArithmeticHeights §2.4) and curve-moduli Hodge positivity (StableReductionPartII §§6.9, 6.21–6.22); the arbitrary-base adelic theory, the non-archimedean and family admissible metrics and the bigness theorems exist in no library or earlier roadmap."

## Previous findings

- The previous report (of 1dce7a6) had no finding; its own previous R01 (the looper-silverman-wilms-2021 page locators) stands repaired: README lines 1399 and 2022 are unchanged at this head.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §13.10 (the description's "two-sided comparison … constants depending only on g > 1") | function-field constants at g = 2; number-field case h ≤ 1 and h ≥ max(1, 24·abs(c₅)) | c₃ = 4⁻¹⁶/12 ≈ 1.9·10⁻¹¹, c₄ = 12; h ≤ 1: c′ = c₀/5 > 0; h large: h/12 + c₅ ≥ h/24 | constants depend on g only; description agrees with README | none |
| §13.5 (the description's "function-field lower bound uses graph inequalities and the arithmetic Hodge index bound") | g = 2, 3, 4 | A = 107.25, 96.94, 139; 12/A = 0.1119, 0.1238, 0.0863, each ≥ 1/12 = 0.0833 | lower bound h/12 follows from §13.4(1) and §10.2 alone; no slope inequality in the `*Needs:*` line | none |
| Summary block: "admissible metrics for every positive genus", end theorems for g > 1 | g = 1, 2 | canonical degree 2g − 2 = 0, 2; README Conventions put Layers 7–8 and §9.1 at g ≥ 1, §9.2 onward at g > 1 | description agrees | none |

The rows for all other statements stand as in the previous review, of 1dce7a6.

- Gate re-run on this head: every check 0 (set_option, sorry-data, imports, statement-hygiene, readme-ids-missing, depcheck, stray-files, outside-folder, source-material and the rest), OK; the worker's gate reports build=0.
- Dependency check with `--movable`: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. No declaration, so no `#check` comparison and no one-tactic probe.
- Diff since 1dce7a6: 0 lines in the folder; `git diff --stat origin/main...HEAD` outside the folder is empty.
- Description against the head, sentences confirmed: the folder holds README, `Suggested.lean`, `metadata.toml`; the pull request adds the roadmap (not on main; 2265 insertions, 0 deletions); Part I's stopping point matches README line 7; the consumer sentence matches `## Downstream consumers`; §4.9 identifies the two adelic carriers; the 13 supplier subsections are the 11 open roadmaps of the dependency list plus JacobianChallenge and SchemeAndStackFoundations, both on main.
- Cross-roadmap citations resolved for R03 (3): ArithmeticDynamics §4.3a (its README line 5962), GrossZagierAndArithmeticHeights §2.4 (line 766), StableReductionPartII §§6.21–6.22 (lines 7060, 7074), each at its open head.
- Source locators: none re-read (no passage changed); the seeded sample falls in no changed passage.
- Overlap check: read HeightsRationalPointsAndObstructionsPartII, ArithmeticDynamics, ArakelovGeometryAndAbelianHeights; global-field quasi-projective adelic Picard group: ArithmeticDynamics §4.3a owns, §4.9 here cites and compares; uniform Bogomolov and small points: HeightsRationalPointsAndObstructionsPartII owns and cites §§4.6–13.7 here; Part I has no adelic, admissible or Deligne-pairing target. Nothing has two owners.
- Source independence: changed passages only: 0 passages changed, none to compare; largest share yuan-2026, 86 of 209 locators; contents not compared again (no layer added, removed or reordered).

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
