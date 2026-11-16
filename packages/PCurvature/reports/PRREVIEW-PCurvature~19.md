# Review of PCurvature (pull request #1747 at 4201786)

**Verdict:** accepted

Incremental re-review of 8 changed lines since e8f959c: one sentence of `TauCetiRoadmap/PCurvature/README.md` (lines 743–747, the *Provenance* section) is reworded; `Suggested.lean` and every target are untouched. No finding.

## Previous findings

- none to account for: the previous report, of e8f959c, was an acceptance with no finding of its own (its R01 bullet recorded a repair of an earlier report's finding, and the description still carries that repair).

## Verified sound

| Statement | Instances | Values each side | Result |
| --- | --- | --- | --- |
| 2.0 `kaehlerD_eq_zero_iff` (the changed paragraph's section cites 2.0 and 2.1) | `p = 3`, `R = 𝔽₃`, `A = 𝔽₃[t]`: `a = t³ + t⁶`, `a = t⁴`, `a = 2` | `d(t³ + t⁶) = (3t² + 6t⁵) dt = 0`, in `𝔽₃[t³]`; `d(t⁴) = t³ dt ≠ 0`, `t⁴ ∉ 𝔽₃[t³]`; `d2 = 0`, `2 ∈ R` | both sides agree |
| 2.0 `apply_eq_zero_of_mem_frobeniusImage` | same `A`, `D = d/dt`; non-smooth `A = 𝔽₃[t]/(t²)`, `D = t·d/dt` | `D(t³) = 3t² = 0`, `D(2t³·t⁶) = 0`, `D t = 1` with `t ∉ 𝔽₃[t³]`; in `𝔽₃[t]/(t²)` the image is `𝔽₃` and `D` kills constants | holds |
| README lines 743–745, changed sentence, against the cited repository at commit `c496df0` | its root `README.md` and `lean-toolchain` at that commit | the repository describes `StacksCore` as human-reviewed and `StacksFrontier` as written by AI agents, the tiers differing in who reviewed the code; it does not call the latter unreviewed; toolchain `v4.35.0`; Apache 2.0 | the new wording is what the repository says; the old "records it as unreviewed" was not |

The rows for the other statements stand as in the previous review, of e8f959c.

- `git diff e8f959c 4201786`: one file, `TauCetiRoadmap/PCurvature/README.md`, 4 insertions and 4 deletions, all in one paragraph; no heading, target, supplier or Lean statement changes. `git diff --stat origin/main...HEAD` outside the folder: empty.
- Source locators checked against the text, 1: the root `README.md` of the outside repository at commit `c496df0` (tier descriptions, licence), with its `lean-toolchain`. No seeded-sample target falls in the changed passage.
- Description against the head: its Provenance paragraph ("Apache-2.0, commit c496df0, Lean and Mathlib v4.35.0 … not a dependency") never repeated the replaced clause, so the change leaves no sentence of it wrong; title, layers, suppliers and declaration list match the 36 headings and 19 declarations.
- Cross-roadmap citations and library declarations: none in the changed passage; the worker's citation check lists no cross-roadmap citation found nowhere (its two Lean-name leads, `DerivedDeRham.smoothCartier` and `SchemeFrobenius.schemeFrobeniusTwist`, are supplier-roadmap names resolved on main in the previous review).
- Gate (the worker's record at this head): every check 0, `build=0`, `OK`.
- Dependency check, run for this review: `depcheck: 251 roadmaps, 2385 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Declared gaps: none declared.
- Elaboration, `lake env lean` on `Suggested.lean`: exit 0, 11 `sorry` warnings (lines 71, 97, 109, 114, 119, 138, 160, 167, 174, 200, 224), nothing else.
- Remark, no change asked: the generated `depends-on` block still lists CrystallineCohomology and DerivedDeRhamCohomology beside the open FormalConnectionsOpers; both are on main.

Overlap check: read LefschetzStructures (the only entry of the three closest-roadmap lists, score 0.08, open); nothing shared. No open pull request changes this roadmap, drops an id it cites or defines one it cites.

Source independence: changed passages only, 1 passage compared with 1 source (the outside repository's root `README.md` at `c496df0`), none shared beyond the tier names and the standard compound "human-reviewed"; arrangement not compared again, since no layer is added, removed or reordered.

## Not verifiable

- As in the previous review: that every file of the three cited directories of the outside repository builds without `sorry` (its `README.md` asserts it; nothing was built here); the tags inside files not opened; Katz 1982, §9, and the published *Math. Comp.* version of Fürnsinn–Pannier.
- The description's "who have not been contacted about this roadmap" and "is not adapted in `Suggested.lean`": the author's statements.

## Source issues

- none

## For the human reviewers

- Licence: `TauCetiRoadmap/PCurvature/README.md` lines 741–747 name AxiomMath, *The Stacks Project in Lean* (Apache-2.0) as material that may be adapted by agreement with its maintainers; the description says they have not been contacted.
- Licence: no declaration of `Suggested.lean` was compared with that repository; the file predates the citation and, by an earlier review's file-name search, the repository has no file on its objects.
- Licence: Fürnsinn–Pannier is cited as *Math. Comp.* (2026), doi:10.1090/mcom/4258, with arXiv:2510.00892v3 for the theorem numbers (`TauCetiRoadmap/PCurvature/README.md` lines 803–806), in *Research context* only; the journal version was not read.
- Scope: the README (lines 725–727) states that Theorem 1.3 of Fürnsinn–Pannier fails for a free factor `c`, a correction that no published source makes; the witness is in the table of the review of 3fad9f2.
