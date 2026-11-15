# Review of RelativisticQuantumFieldTheory (pull request #1772 at 4d88833)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 4d88833; this round reads the pull request's title and description against the head. The folder is unchanged and stands as accepted; both findings are in the description's prose and need no change to the roadmap.

## R01 (P3) — The description counts six Lean companions; the head has one file

**Location:** pull request description, second paragraph: "six native Lean companions provide representative targets."

**Claim:** The head carries six Lean files of representative targets.

**Witness:** At 4d88833 the folder holds `README.md`, `Suggested.lean`, `metadata.toml`. The branch history adds and then deletes `CourseExamplesSuggested.lean`, `FreeEuclideanReflectionTargets.lean`, `MassivePrescriptionTargets.lean`, `MasslessLimitTargets.lean`, `TorusGreenTargets.lean`.

**Repair:** Replace the sentence by: "This pull request adds the roadmap folder `TauCetiRoadmap/RelativisticQuantumFieldTheory/`. The README fixes conventions, prerequisite ownership and analytic hypotheses; `Suggested.lean` states the headline theorems of Layers 1, 5, 6 and 7 that are statable at the pins (14 theorems, 44 declarations), and its docstring names those that are not."

## R02 (P3) — The validation paragraph gives the wrong file and `sorry` counts

**Location:** pull request description, Validation paragraph: "All six companions elaborate against the main dependency revisions used for preparation, with only 23 intentional theorem admissions."

**Claim:** Six files elaborate, with 23 admitted theorems.

**Witness:** `lake env lean TauCetiRoadmap/RelativisticQuantumFieldTheory/Suggested.lean` at 4d88833: exit 0, exactly 14 `declaration uses sorry` warnings (lines 92, 101, 133, 141, 160, 188, 202, 245, 289, 309, 316, 337, 347, 358); no other Lean file exists.

**Repair:** Replace the sentence by: "`Suggested.lean` elaborates against the pinned Mathlib and Tau Ceti with 14 `sorry` warnings, one per stated theorem, and nothing else."

## Previous findings

- The previous report (of 4d88833) had no findings at this head. Its R10 and R11 (manifest records `bm23` and `os75`, outside the folder) were settled there and are not raised again; the folder has not changed since.

## Verified sound

| # | Statement | Instances and computed values (each side) | Result |
|---|---|---|---|
| D1 | Description: "exact n*s seminorm and factorial input growth, with an explicit free-field s=6 estimate" (README §7 OSGrowth, lines 4503–4535; free model, lines 4926–4946) | `C^n/n!≤e^C` gives `C^n√(n!)≤e^C(n!)^(3/2)`: `A=e^C`, `B=3/2`. Weight `(1+|x|²)^(3n)`, exponent `n·s/2=3n`, so `s=6`. `n=2`: `N_(2,12)`, order 12, weight exponent 6. Matchings `r=2`: `9≤24`. | description agrees |
| D2 | Description: "the null-sector counterexample prevents an invalid operator-triviality inference" (§4.12–§4.13, lines 1209–1263) | README: `A(f)A(g)Ω=0` so vacuum weak locality holds trivially, yet `F₀₁(f)Ω≠0`; quotient of `F`-polynomial vectors is `ℂΩ`. Operator `F≠0`, quotient trivial: the two differ. | description agrees |
| D3 | Summary block: "Shale's theorem retains arbitrary one-particle Hilbert spaces"; "Hilbert–Schmidt criteria" (§10.1–§10.3, lines 5413–5469) | README §10.2: "arbitrary complete complex Hilbert space h, including zero, finite-dimensional and nonseparable". `S=cosh t+sinh t·C`: `β=sinh(t)C`, `‖β‖²_HS=sinh²t·dim h`: finite for `dim h<∞`, `∞` on `ℓ²(ℕ)`, `t≠0`. | description agrees |
| D4 | Description: six companions, 23 admissions, against `Suggested.lean` | Files: 1 Lean file. Theorems with `sorry`: 14. Declarations: 44. Description: 6 and 23. | R01, R02 |
| D5 | Scaling-degree extension `existsUnique_extension_of_scalesBelow` (cited by the summary's "distributional extension with scaling-degree … control") | `∂^αδ₀` on `ℝⁿ`: degree `n+|α|≥n>σ`, so no point-supported ambiguity under `σ<n`; `|x|^(−a)`, `0<a<1`, `n=1`: degree `a<1`, unique extension. Signature has `hσ : σ < n`. | sound |

The rows for the roadmap's own statements stand as in the previous review, of `4d88833`.

- Description sentences read against the head: 14 (title, three summary paragraphs, four prose paragraphs). Contradicted: 2 (R01, R02). The rest agree: title against the README title; the eleven named results of the summary against Layers 1, 3, 4, 6–11; "changes only the RQFT directory" against an empty diff outside the folder; `0.9 RealLineBoundary` (line 245) precedes its Layer 6 uses (line 2200).
- Removed sections, removed declarations, dropped suppliers: none to state (the roadmap is not on main; 192 headings and 44 declarations added, 0 removed).
- Gate rerun at 4d88833: every check 0, `OK`, exit 0 (the worker's gate adds `build=0`).
- Elaboration: `lake env lean` on `Suggested.lean`, exit 0, 14 `sorry` warnings, nothing else.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Merge order: NoncompactQuantumSymmetry 158, QuantumFoundations 215, StochasticCalculus 216, this roadmap 217.
- `overlaps.md` and `citations.md` list nothing; no other open pull request changes this folder; no file changed outside it.
- Overlap check: read NoncompactQuantumSymmetry, QuantumFoundations, LocalVariationalFieldTheory (the lists are unchanged since the previous review, which resolved their shared objects as supplier citations); nothing shared.
- Source independence: changed passages only; 0 passages changed in the folder, so none compared; arrangement not compared again (no layer added, removed or reordered).
- Remark, no change requested: the description's "the link names its immutable contract" refers to no link in the prose; the only reference to QuantumFoundations there is the generated `depends-on` block.

## Not verifiable

- "two independent text-only reviews cover the entire mathematical programme … all findings are addressed" (description, Validation): a statement about the authoring process; nothing at the head records it.
- The uncertified and waived sources (`weinberg95`, `os75`, `unsw-qft`, `sw64`, `haag96`, `rs75`, `hormander83`, `bs80`, `tong-qft`, `strocchi67`, `strocchi70`) are cited by locator only, as in the previous review; no locator changed.

## Source issues

- none

## For the human reviewers

- Scope: two of the most cited sources are course notes: `borcherds-qft` (Borcherds–Barnard lecture notes, arXiv math-ph/0204014; "Borcherds" occurs 64 times in the README) and `unsw-qft` (unpublished UNSW notes, waived; "UNSW" 35 times, cited by page).
- Licence: the description says "verified gpt-6-luna readers supplied Markdown from source images"; which sources were transcribed from images, and under what licence, is not recorded in the folder.
- Not tested: wording and arrangement were not compared this round (0 changed lines); `unsw-qft` has no text in the sources cache, so it has not been compared in any round.
