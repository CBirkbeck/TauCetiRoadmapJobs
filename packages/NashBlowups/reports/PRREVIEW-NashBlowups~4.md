# Review of NashBlowups (pull request #2413 at dd3e0e3)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: "Dependencies. Every supplier is on main: AlgebraicModuliForArithmeticGeometry §§1.3 and 5.4 … DiophantineApproximationAndTranscendence §5.6. No pull request has to merge before this one."

## Verified sound

| Statement | Instances tried | Roadmap side (computed) | Other side (computed, or source at locator) | Result | Change |
|---|---|---|---|---|---|
| §4.4 `smooth_iff_hasLocallyFreeQuotientOfDifferentials_of_charZero` (named in the description's summary) | cusp `y² = x³` over `ℚ`, `d = 1`; same cusp over `𝔽₂` | relation `2y dy = 3x² dx` forces `b = (3t/2)a`: `a` unit gives `b ∉ k[t², t³]`, else both non-units, no quotient; char 2: `dx ↦ 0, dy ↦ 1` is a quotient | cusp singular: false ↔ false; char 2 has a quotient on a singular curve, excluded by `[CharZero k]` | holds | none |
| §5.4 `smooth_iff_hasLocallyFreeQuotientOfDifferentials_of_isNormalScheme` (the description's "normal `X` over a perfect field of characteristic `p`") | cone `z² = xy`, char 2, `d = 2` | relation `x dy + y dx = 0`; `x v = −y u` in `A²` gives `u = xc`, `v = yc` (`A` free over `k[x, y]` on `1, z`), so the image mod `𝔪` has rank `≤ 1 < 2` | cone singular at the origin: false ↔ false | holds | none |
| Description, "Dependencies" (R01) | the six suppliers and two boundary citations | "Every supplier is on main"; "No pull request has to merge before this one" | all eight folders on main at `51d880d`; headings §§1.3, 5.4, 0.23, 0.7, 0.11, 0.17, 0.23, 0.30, 4.11, 4.13, E1.6, 2.15, 7.8, 5.6, R3.6 present | holds | none |

The rows for all other statements stand as in the previous review, of `dd3e0e3`.

- Folder: 0 changed lines since `dd3e0e3`; nothing changes outside `TauCetiRoadmap/NashBlowups/`; no statement, layer or supplier changed, so no source locator was re-read.
- Pull request text against the head: title and every sentence of the summary block and of the prose read against `TauCetiRoadmap/NashBlowups/README.md` (Summary, Scope and ownership, Exact supplier contracts, How to read the build, §§4.3, 6.3, Downstream consumers) and the module docstring of `TauCetiRoadmap/NashBlowups/Suggested.lean`; none contradicted. The roadmap is new on main (1877 insertions, 0 deletions; 3 Lean declarations added, none removed), as the title and the folder sentence say.
- Cross-roadmap citations: the 15 sections the description names resolved on main at `51d880d`; the supplier list equals the README's six `From TauCetiRoadmap.*` subsections; AdicSpacesPartIII §R3.6 and ResolutionOfSingularitiesCharacteristicZero §7.8 occur in the README only under Scope and ownership (lines 76, 67), as the description says.
- Remark: the generated `depends-on` block is headed "suppliers still open; they merge first" above two ticked entries; both roadmaps are on main, and the `merge-order` block and the prose say so.
- Gate rerun at this head: every check passes. Dependency check: `depcheck: 234 roadmaps, 2228 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives two `declaration uses sorry` warnings only; the three elaborated signatures agree with README §§0.7, 4.4, 5.4, no binder lost.
- Overlap check: read SchemeAndStackFoundations (main and its open revision), PurityOfBranchLocus, DirectSummandsAndBigCohenMacaulay, AbhyankarLemma; nothing shared. No open pull request changes this roadmap, drops an id it cites, or defines one it cites.
- Source independence: changed passages only; 0 passages changed in the folder, so none compared; largest share nashModificationNotes2024, 23 of 109 locators; contents compared with nashModificationNotes2024 in the previous review: independent, and no layer was added, removed or reordered since.

## Not verifiable

- hironaka1983: uncertified in the manifest; cited by locator only, for scope.
- spivakovsky1990: uncertified; cited by locator only, for scope.
- semple1954: uncertified; cited by locator only, for the history of the iteration.
- teissier1982: uncertified; cited by locator only, for a downstream consumer.
- ega1: uncertified; cited by locator only, for the Grassmannian convention.
- The description's sentence on AI assistance (the number of review and red-team rounds) describes the process, not the head; not checked.

## Source issues

- none

## For the human reviewers

- **Licence.** Three cited texts are unpublished: nashModificationNotes2024 (arXiv:2404.09102v1, the source with the largest share of locators), hamann2003 (arXiv:math/0311006v1) and alperModuli (author's page, draft of 19 August 2024); README lines 1760, 1768, 1769.
