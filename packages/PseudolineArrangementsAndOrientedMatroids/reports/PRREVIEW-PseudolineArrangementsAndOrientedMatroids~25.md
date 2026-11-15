# Review of PseudolineArrangementsAndOrientedMatroids (pull request #1523 at 837b31e)

**Verdict:** accepted

Incremental re-review of 8 changed lines since d37350b. No finding.

## Previous findings

- R01 — repaired: the description now reads "Whether the uniform reconstruction of 8.4 (ii) extends to non-uniform simple rank-3 chirotopes with no bigonal element is open. The README records it in Scope and in the Research context, and it is not a target."
- R02 — repaired: the description opens "Adds the new roadmap `PseudolineArrangementsAndOrientedMatroids` (`README.md`, `Suggested.lean`, `metadata.toml`). No other folder changes."

## Verified sound

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 3.8 (b), four elements in general position (cited by the deleted sentence) | ordinary vertex `a ∩ b`; `c`, `d` through two further vertices of `a`; case `b, c, d` concurrent | take `e` through a third vertex of `b`: `{a,b,c,e}` fails only if `e ∋ a∩c`, `{a,b,d,e}` only if `e ∋ a∩d`; not both | true | none |
| 3.8 (b), the three alternatives | fifth element through 0, 1, 2 of the six vertices of `Q`; `n = 5` with a diagonal `f` | 0: five in general position; 1: three and two, none through both; 2: opposite pair. `Q ∪ {f}`: `f` on 2 vertices, bigonal, excluded | true | none |
| 3.8 (b), two diagonals | `f` through `a∩b`, `c∩d`; `g` through `a∩c`, `b∩d` | triple points `{a,b,f}`, `{c,d,f}`, `{a,c,g}`, `{b,d,g}`: six elements, four vertices of three | complete quadrangle | none |
| 3.8 (c), `m = 6` alternative | quadrangle `e₁, e₂, e₃, e₁−e₂, e₁−e₃, e₂−e₃`, delete `e₂−e₃` | `e₁` stays on `{e₁,e₂,e₁−e₂}` and `{e₁,e₃,e₁−e₃}` only: 2 vertices, bigonal | Check holds | none |
| Research context, "`n > 13` … fewer than `n/2`" (the sentence the diff shortens) | `n = 7`, `n = 13` | Kelly–Moser: 3 < 3.5 ordinary vertices; the 13-line configuration: 6 < 6.5 | the bound on `n` is needed; agrees with 3.8's "`n ≠ 7`" for `6n/13` (42/13 ≤ 3 fails only at 7) | none |
| Description: "only `sorry` warnings (51)" | elaboration of this head | exit 0, 51 `sorry` warnings, no other message | right | none |
| Description: "No other folder changes" | `git diff --stat origin/main...HEAD` outside the folder | 0 lines; the folder is +1801, +958, +1 | right | none |

The rows for the untouched statements stand as in the previous review, of d37350b.

- **The diff.** It deletes one sentence of the Research context and one References entry (the unpublished Montpellier notes, folder 80) and adds nothing. At this head no line of `README.md` or `Suggested.lean` mentions the manuscript, folder 80 or "see References" for it; the remaining mentions of Grothendieck (README lines 143, 1284, 1785; `Suggested.lean` line 131) cite the published *Esquisse*. `Suggested.lean` is unchanged since d37350b.
- **Dangling references.** 3.8's "(Research context)" at README line 885 still resolves: the `n/2` question remains at lines 1705–1709. No text cites the removed References entry.
- **Remark (no change asked).** 3.8 (b) and (c) now carry no source locator; they are stated with complete routes from 3.8 (a), which the rows above recompute. See the last section.
- **Gate.** The worker's gate on 837b31e gives 0 on every counter, `build=0`. My run of the brief's command matches except `depcheck=1`, "NOT IN ORDER", which reads the default order; the candidate order lists the roadmap at line 412.
- **Dependency check** against the candidate order: `depcheck: 245 roadmaps, 2230 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/Suggested.lean`: exit 0, 51 `sorry` warnings only.
- **The description, against the head.** Read in full again; no sentence mentions the deleted citation, and none is contradicted by the head. The diff changes no supplier, section, heading or declaration, so nothing is left unstated.
- **Sources.** The diff adds no locator, and no seeded target lies in changed text; no locator was rechecked this round.

Overlap check: read SurfaceTopology (open), RootSystems (main and its open revision); the third list is empty. `GMap` is owned here (SurfaceTopology is on the never-cite list); `geometric_faithfulness` is owned by RootSystems §1.3, which this roadmap cites. The overlap tool reports no dropped id, no second copy and no other pull request changing this folder.

Source independence: changed passages only; the diff adds no prose, so 0 passages compared with 0 sources; largest shares of name mentions Felsner–Goodman 2017 (22) and BLSWZ (20), as before; contents not compared again, since no layer was added, removed or reordered.

## Not verifiable

- Carried over, in untouched text: BLSWZ *Oriented Matroids*, Levi 1926, Ringel 1956, Roudneff–Sturmfels 1988, Björner–Edelman–Ziegler 1990, Goodman–Pollack 1984, the *Esquisse* and Coxeter–Moser (paywalled or not found).

## Source issues

- none

## For the human reviewers

- **Scope.** README 3.8 (b) and (c) (lines 823–851) now cite no source. Their only citation, deleted at 17f1025b, was Grothendieck's unpublished notes (Montpellier fonds, folder 80); I know of no refereed source stating them. They are not headlines of `Suggested.lean`.
- **Not tested.** No passage was compared with a source this round. BLSWZ (20 mentions) is paywalled, and no review has compared its wording.
