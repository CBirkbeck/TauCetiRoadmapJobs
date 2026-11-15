# Review of PseudolineArrangementsAndOrientedMatroids (pull request #1523 at d37350b)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines since d37350b. The folder's files are settled. This round checks the title and description against the head.

## R01 (P3) — The description cites a "Grothendieck's skeleton question" that the README no longer names

**Location:** Pull request description, paragraph **Out of scope**: "Grothendieck's skeleton question appears only as motivation. Its proved cases, faithfulness and uniform reconstruction, are targets with their hypotheses and proof routes."

**Claim:** This sentence describes an earlier head. At d37350b the non-uniform question is not attributed to Grothendieck, and the README gives no locator for it. It appears only as a non-target in Scope and as an open question in the Research context.

**Witness:** README lines 78 and 1704 state the question without attribution. Folder 80 is cited only for pp. 20–28, at lines 1790–1793. At aa4a788d, line 429 had read "is Grothendieck's question (folder 80, pp. 39–54) … motivation only"; 8a1d1ab0 removed that.

**Repair:** Replace the two sentences with: "Whether the uniform reconstruction of 8.4 (ii) extends to non-uniform simple rank-3 chirotopes with no bigonal element is open. The README records it in Scope and in the Research context, and it is not a target. The proved cases, faithfulness (8.4 (i)) and uniform reconstruction (8.4 (ii)), are targets with their hypotheses and proof routes."

## R02 (P3) — The description does not say that the pull request adds a new roadmap

**Location:** Pull request description, opening sentence: "Covers flag systems (`GMap n D` on arbitrary dart types, their cells, Euler characteristic, orientability and orientation double cover); chirotopes and covector oriented matroids; …"

**Claim:** Nothing in the description says whether the pull request adds a roadmap or revises one on main.

**Witness:** `git diff --stat origin/main...HEAD`: the folder is absent on main and is added whole (README.md +1807, Suggested.lean +958, metadata.toml +1, no deletions). The description's only "adds" is "the Mathlib names it adds".

**Repair:** Open the description with: "Adds the new roadmap `PseudolineArrangementsAndOrientedMatroids` (`README.md`, `Suggested.lean`, `metadata.toml`). No other folder changes."

## Previous findings

- none: the review of d37350b raised no finding of its own. Its R01 and R02 were the findings of the review of 8b1e5c0, and it recorded both as repaired.

## Verified sound

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 8.4 (ii) uniform reconstruction, "at least four" (touched by R01) | 3 and 4 lines in general position | n = 3: 3 vertices, 6 edges in parallel pairs, 48 = 2³·3! label-compatible automorphisms against 24. n = 4: octahedral graph, both groups have order 24 | hypothesis needed; README Check agrees | none |
| The non-uniform question (R01) | README lines 78 and 1704, References lines 1790–1793 | "not a target", "is open"; no attribution; folder 80 cited for pp. 20, 22, 24 and 28 only | the description's attribution is unsupported | R01 |
| 0.4 `isConnected_orientationDoubleCover_iff`, cited by the description | projective plane on 4 darts; sphere with a loop | PP: flag-graph triangle 0, 1, 3, so the cover is connected and the right side is true. Sphere: 4-cycle, orientable, two lifts, both sides false | true | none |
| The same theorem, its hypotheses | one dart with every `adj i = 1`; empty `D` | one dart: the cover's 2 darts are swapped, so it is connected, but `G` is orientable: `hfix` is needed. Empty: the left side holds, the right fails: `Nonempty` is needed | hypotheses needed | none |
| 0.4 `natCard_cell_orientationDoubleCover` | projective plane on 4 darts | the residues of {1,2}, {0,2} and {0,1} are 4-cycles; (1,1,1) with χ = 1 becomes (2,2,2) with χ = 2 | true | none |
| 9.5 cover of the hemi-icosahedron, cited by the description | `H₃` of order 120, centre of order 2 | 60 flags, (6,15,10), χ = 1, become 120 flags, (12,30,20), χ = 2: the icosahedron | true; consistent with 0.4 | none |
| 9.6 `card_torusGroup`, `cellNumbers_torusGMap` (`{3,6}` in the description) | n = 3 | 108 flags: 108/12 = 9 vertices of degree 6, 108/4 = 27 edges, 108/6 = 18 triangles, χ = 0 | matches `12 n²` and `(n², 3n², 2n²)` | none |
| 4.4 Felsner–Weil ("bijection" in the description) | m = 3, 4, 5 | signotopes 2, 8, 62; commutation classes of reduced words of the longest permutation 2, 8, 62; `(+,−,+,+)` has 2 sign changes | true; README 4.4 states the bijection | none |
| Description: "only `sorry` warnings (51)" | elaboration of this head | 51 `sorry` warnings, nothing else, exit 0; 56 theorems, 5 proved in place | right | none |
| Description: no `sorryAx` in definitions, no one-tactic theorem | `#print axioms` on 48 definitions; `rfl`, `simp`, `infer_instance`, `trivial`, `aesop` on 51 sorried theorems | 0 depend on `sorryAx`; 51 of 51 probes fail | right | none |
| Description: Tau Ceti's longest element is crystallographic | `TauCeti/LinearAlgebra/RootSystem/LongestElement.lean` | `[P.IsCrystallographic]` at line 128 covers `longestElement` at line 197 | right | none |

The rows for the untouched statements stand as in the previous review, of d37350b.

- **Gate.**
  - The worker's gate on d37350b gives 0 on every counter, including `build=0`.
  - My run of the brief's command matches, except `depcheck=1`: "NOT IN ORDER: PseudolineArrangementsAndOrientedMatroids". That counter reads the gate's default order. The candidate order lists the roadmap at line 412, so this is not a defect.
- **Dependency check** against the candidate order: `depcheck: 245 roadmaps, 2207 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/Suggested.lean` exits 0 with 51 `sorry` warnings. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **The description, against the head.** All 30 checkable claims were checked: content list, ownership, suppliers, out-of-scope list, README shape, `Suggested.lean` form, headline list, "Builds on" list, local checks and gate. All but R01 hold, and R02 is the one omission.
  - All 58 `### k.n` subsections have a *Needs:* line and at least three Checks.
  - Every layer has Examples and Dependencies.
- **Citations on main 9573ec4 and at the pins.**
  - RootSystems §1.3 is README line 515, and `geometric_faithfulness` is `Suggested.lean` line 73; the open revision of RootSystems keeps §1.3 and its `geometric_faithfulness` target.
  - GraphConnectivityAndFlows Target 1.1 is README line 224.
  - BelyiMaps covers ribbon graphs and dessins (README lines 5, 12–13).
  - Tau Ceti's `CoxeterSystem.geometricRepresentation` is at `TauCeti/GroupTheory/Coxeter/Geometric.lean` line 479, and `geometricRepresentation_simple` at line 485.
- **"No roadmap on main owns them."** A grep of main and `Completed/` finds no mention of `GMap`, chirotopes, pseudolines, signotopes, flag systems, the cartographic group or oriented matroids.
- **Sources.** No seeded target lies in changed text, and the README flags no locator as unverified. No locator was rechecked this round.

Overlap check: read SurfaceTopology (open), RootSystems (main and its open revision) and BelyiMaps (main).
- SurfaceTopology still defines the `GMap`/`GMap2` vocabulary (for example `GMap2.eulerChar`). It is on the never-cite list and outside the merge order, so this roadmap owns the carrier.
- `geometric_faithfulness` is owned by RootSystems §1.3, which this roadmap cites.
- Ribbon graphs and dessins are owned by BelyiMaps.

Source independence: changed passages only. The folder changed by 0 lines, so no passage was compared this round. The largest shares of name mentions in the README are Felsner–Goodman 2017 (22) and BLSWZ (20). Contents were not compared again, since no layer was added, removed or reordered.

## Not verifiable

- These are carried over and lie in untouched text: BLSWZ *Oriented Matroids*, Levi 1926, Ringel 1956, Roudneff–Sturmfels 1988, Björner–Edelman–Ziegler 1990, Goodman–Pollack 1984, the *Esquisse* and Coxeter–Moser (paywalled or not found).

## Source issues

- none

## For the human reviewers

- **Licence.** README References lines 1790–1793 cite Grothendieck's unpublished manuscript (Montpellier fonds, folder 80, an image-only institutional scan) for 3.8 (b) and 3.8 (c). It is an unpublished source.
- **Not tested.** No passage was compared with a source this round. BLSWZ (20 mentions) is paywalled, and neither this review nor the previous one compared its wording.
