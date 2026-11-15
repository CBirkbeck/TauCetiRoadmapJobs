# Review of LatticePackingsAndPerfectForms (pull request #1723 at 5efad72)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `5efad72`; this round reads the pull request's title and description against the head. One P3 finding, in the description; the folder's files need no change.

## R01 (P3) — the description names "perfect-form certificates", which the head does not contain

**Location:** pull request description, prose paragraph after the summary block: "perfect/eutactic/extreme forms with Voronoi's theorem and the perfect-form certificates".

**Claim:** The roadmap has no certificate target. Layer 4 states a completeness criterion and classification theorems, and the README says in terms that these are not procedures or certificate formats.

**Witness:** `README.md:1340–1351` (4.10): `perfectForms_complete` and the class counts are "mathematical classification and extremal-value targets, not enumeration procedures". "certificate" occurs only at `README.md:159` (IL 9B) and `:1777` (a negation); nowhere in `Suggested.lean`.

**Repair:** Replace the clause with: "perfect/eutactic/extreme forms with Voronoi's theorem, Voronoi's neighbour relation and the perfect-form classifications through rank eight".

## Previous findings

- none: the previous report (of `5efad72`, accepted) listed no finding.

## Verified sound

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| Description: "8 layers (Layers 0–7) and 47 numbered sections" | headings of `README.md` at the head | `## Layer` headings: 8 (0–7); `### k.n` headings per layer: 5 + 9 + 3 + 4 + 10 + 7 + 4 + 5 = 47 (Layer 4 runs 4.1–4.7, 4.9–4.11) | Pass |
| Summary block: "Hermite constants through rank eight and in rank 24" (`hermiteConstant_*`, 2.3, 4.10, 4.11) | A₂, A₃, D₄, D₅, E₆, E₇, E₈, Λ₂₄; Cohn–Elkies with r = 2 | `minⁿ/det`: 4/3, 8/4 = 2, 16/4 = 4, 32/4 = 8, 64/3, 128/2 = 64, 256/1; Leech 4/1^{1/24} = 4; `δ ≤ (2/2)²⁴·1 = 1` gives `γ₂₄ = 4δ^{1/12} ≤ 4` | Pass |
| Summary block: "perfect-form classifications through rank eight" (4.10) | ranks 4–8 | README counts 2, 3, 7, 33, 10916; dsv2007 line 95 and line 107 (Theorem 1.1) give 10916 in rank 8 | Pass |
| Description: "the revisions … which are the ones the branch and main pin" | `lake-manifest.json` at the head and at `origin/main` (`2248bbb`) | both: Tau Ceti `2fd255d997f4`, Mathlib `1b1ccf4b088b`; `README.md:288–289` names the same two | Pass |
| Description: `metadata.toml`: arXiv topic `math.MG` | the file | `topic = "math.MG"` | Pass |
| Summary block: "Mahler compactness gives attainment" (2.2) | n = 1; n = 0 | `README.md:132–136` consumes PMNT §4.9b in 2.2 and 4.7; [1] attains γ₁ = 1; at n = 0 `hermite = 0 ≠ 1`, so `0 < n` is needed and present | Pass |

The rows of the previous review, of `5efad72`, stand for every statement of the folder: no statement changed.

- Title and description: 14 sentences and bullets read against the head; one contradicted (R01). The title ("roadmap for …") and the file list agree with the change: the folder is not on main, 3 files added, 2854 insertions, no heading or declaration removed.
- Remark, no change asked: the summary block's "using the existing sphere packing formalisation" is read with `README.md:180` ("the migration source named in 4.11"); `README.md:1396–1397` says it is provenance and not a prerequisite.
- Remark, no change asked: Layer 4's numbering passes from 4.7 to 4.9; no text cites a 4.8.
- Gate at this head (the worker's): every check 0, including `build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`; OK.
- Dependency check, run this round: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Candidate lines: GeometryOfNumbersAndQuadraticArithmetic 55, ProbabilisticAndMetricNumberTheory 64 (on main), WeightsInEtaleCohomology 150, this roadmap 151.
- Elaboration, run this round: `lake env lean` on `Suggested.lean` exits 0 with 53 messages, all `declaration uses sorry`, as in the previous review.
- `git diff --stat origin/main...HEAD` outside the folder: empty. `overlaps.md`: no open pull request changes this roadmap, drops an id it cites, or defines one it cites. `citations.md`: no unresolved cross-roadmap citation; the 12 Lean-name leads are the 5 dotted names `Suggested.lean` declares and 7 LMFDB knowl ids.
- Overlap check: read IntegralLattices, GeometryOfNumbersAndQuadraticArithmetic, OrthogonalTamagawaAndLatticeMass, ThetaSeries, SuccessiveMinima, Rank24LatticeConstructions as compared in the earlier rounds; nothing shared (the folder did not change, and `overlaps.md` lists no roadmap close in results or headings).
- Source independence: changed passages only; the folder changed by 0 lines, so 0 passages compared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts": a statement about other pull requests, outside what this review reads.
- Conway–Sloane, *SPLAG*, Ch. 23 and Ch. 25: paywalled, cited by locator, as in the previous report.
- The LMFDB record `3.4.8.1.2` for `A₃`: only the label prefix was checked, as in the previous report.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md:180` names `math-inc/Sphere-Packing-Lean` as "the migration source named in 4.11", and `README.md:2141` lists it under References; its licence was not read. `Suggested.lean` states only `hermiteConstant_twentyFour` from 4.11.
