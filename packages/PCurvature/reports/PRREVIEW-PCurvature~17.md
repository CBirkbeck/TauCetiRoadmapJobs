# Review of PCurvature (pull request #1747 at d027b39)

**Verdict:** needs changes

Incremental re-review of 25 changed lines since 3fad9f2 (README only: the new section *Provenance: existing formalizations outside Tau Ceti*, lines 739–757, and its reference entry, lines 809–813). The roadmap text has no finding; the one finding is in the pull request's description.

## R01 (P3) — The description does not state the new Provenance section or its source

**Location:** the pull request's description: "Examples and Dependencies for each layer, then Downstream consumers, Research context and References." and the paragraph "**Sources.**".

**Claim:** The description lists the README's closing sections and its sources; the head has one more of each, and it is the one that names outside Lean code as possible material for adaptation.

**Witness:** `TauCetiRoadmap/PCurvature/README.md` line 739, `## Provenance: existing formalizations outside Tau Ceti`, between *Research context* and *References*; lines 809–813, the reference AxiomMath, *The Stacks Project in Lean*. Neither is in the description.

**Repair:** Replace the bullet by "Examples and Dependencies for each layer, then Downstream consumers, Research context, Provenance and References." and add after **Sources.**: "**Provenance.** A secondary section maps AxiomMath, *The Stacks Project in Lean* (Apache-2.0, commit c496df0d, Lean and Mathlib v4.35.0) to the targets: its `StacksFrontier/RingTheory/DeRham/Cartier` proves the Cartier isomorphism for algebras with Frobenius coordinates (behind 2.0 and 2.1). It is not a dependency; adaptation is agreed with its maintainers first."

## Previous findings

- none: the previous report, of 3fad9f2, had no finding.

## Verified sound

| Statement | Instances | Values each side | Result |
| --- | --- | --- | --- |
| 2.0 `kaehlerD_eq_zero_iff` beside the cited `inverseCartier_bijective_mvPolynomial` in degree `0` ("the Cartier isomorphism behind 2.0 and 2.1", line 752) | `A = 𝔽_p`, `B = 𝔽_p[x]` | cited map `b ↦ b^p`, image `𝔽_p[x^p]`; 2.0: `ker d = frobeniusImage = 𝔽_p[x^p]` | agree |
| The same, base not perfect ("for instance … over a perfect ring", line 751; "compared with the target here before it is used", line 746) | `A = 𝔽_p(t)`, `B = A[x]`; `A = 𝔽_p[ε]/ε²`, `B = A[t]` | cited map has image `𝔽_p(t^p)[x^p]`, resp. misses `ε`; `ker d = A[x^p]`, resp. `A[t^p]`, as 2.0 states. `IsFrobeniusCoordinates` fails: `Σ c_α^p x^α` never equals `t` | the cited theorem needs `PerfectRing A p`; 2.0 (relative twist) does not; the README's wording is exact |
| "No file name or tag there treats restricted Lie algebras, Jacobson's formula or the `p`-curvature …, Cartier descent itself (2.1), or Layers 3–4" (lines 756–757) | the 63,767 file names under `StacksFrontier` at the cited commit | `PCurvature`, `RestrictedLie`, `LieAlgebra`, `Honda`, `Kronecker`, `Chebotarev`: 0 hits. `Curvature`: 5 files, all curvature of completed connections. `Jacobson`: Jacobson rings and spaces. `FrobeniusDescent*`: Tag 0EXH (vector bundles and Frobenius pull-back), no connection | holds |

The rows for the other statements stand as in the previous review, of 3fad9f2.

- The cited repository, read at commit c496df0d: `LICENSE` is Apache 2.0; `lean-toolchain` is `leanprover/lean4:v4.35.0` and the Mathlib entry of its manifest has `inputRev` `v4.35.0` (the pin here is `v4.36.0-rc2`, so "earlier than our pin" holds); its README calls `StacksCore` human-reviewed and `StacksFrontier` written by AI agents, with no `sorry` in either.
- Files opened there, 6: `Cartier/InverseCartier.lean` (`inverseCartier`, no tag), `Cartier/Coordinates.lean` (`IsFrobeniusCoordinates`, `inverseCartier_bijective_of_isFrobeniusCoordinates`, no tag), `Cartier/Polynomial.lean` (`inverseCartier_bijective_mvPolynomial`, `[CharP A p] [PerfectRing A p]`, no tag), `DeRham/GaussManinConnection.lean` (`@[stacks 0FMN]`), `DeRham/KatzOdaConnection.lean` (`katzOdaConnection`), `Descent/FrobeniusDescentVectorBundles.lean` (Tag 0EXH). The three directories exist (5, 865 and 1,009 files).
- The diff changes no statement, heading of a layer, `*Needs:*` line, supplier citation or Lean declaration; `Suggested.lean` is unchanged since 3fad9f2. No target of the seeded sample falls in the changed passages. The section has the form the repository README asks of a provenance section (secondary, not prescriptive, coordination and licence stated).
- Cross-roadmap citations: the changed passages make none; they cite 2.0, 2.1 and Layers 0–4 of this roadmap, all present at the head.
- Gate (the worker's record at this head): every check 0, `build=0`, `OK`; nothing changed outside the folder.
- Dependency check, run for this review: `depcheck: 240 roadmaps, 2260 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration, `lake env lean` on `Suggested.lean`: exit 0, 11 `sorry` warnings (lines 71, 97, 109, 114, 119, 138, 160, 167, 174, 200, 224), nothing else.
- Remark on untouched text: the supplier contracts name the pinned revisions `f6090c70` (Mathlib) and `358314d4` (Tau Ceti), while `lake-manifest.json` at this head pins `1b1ccf4b` and `2fd255d9`. Declared gaps: none declared.

Overlap check: read LefschetzStructures (the only roadmap of the three closest-roadmap lists, score 0.08); nothing shared. No open pull request changes this roadmap, drops an id it cites or defines one it cites.

Source independence: changed passages only, 3 passages compared with 1 source (the cited repository's README and the module docstrings of `Cartier/Coordinates.lean` and `Cartier/Polynomial.lean`), none shared (longest common run 4 words); arrangement not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- That every file of the three cited directories builds without `sorry`: taken from the cited repository's README; the six files opened contain none, the others were not opened.
- Tags inside files: the sentence at lines 756–757 was checked against file names in the whole tier and against the tags of the six files opened, not against every `@[stacks]` attribute.
- Katz 1982, §9, and the published *Math. Comp.* version of Fürnsinn–Pannier: as in the previous review, not read.

## Source issues

- none

## For the human reviewers

- Licence: `TauCetiRoadmap/PCurvature/README.md` lines 741–747 name AxiomMath, *The Stacks Project in Lean* (Apache-2.0 `LICENSE` at the root; the six files opened carry no per-file notice) as material that may be adapted, by agreement with its maintainers.
- Licence: no declaration of `Suggested.lean` was compared with that repository in this round; the file is unchanged since before the repository was cited, and the repository has no file on its objects (table above).
- Licence: Fürnsinn–Pannier is cited as *Math. Comp.* (2026), doi:10.1090/mcom/4258, with arXiv:2510.00892v3 for the theorem numbers (`TauCetiRoadmap/PCurvature/README.md` lines 803–806), in *Research context* only; the journal version was not read.
- Scope: the README (lines 725–727) states that Theorem 1.3 of Fürnsinn–Pannier fails for a free factor `c`, a correction that no published source makes; the witness is computed in the previous review's table.
