# Review of MathematicalBilliards (pull request #2255 at 5b627bb)

**Verdict:** needs changes

## R01 (P3) — The summary block attributes "symplectic billiards" to Tau Ceti

**Location:** pull request description, `<!-- roadmap-summary -->` block, "Approach and generality": "The construction reuses Mathlib’s circle lifts, measurable actions and structure groupoids, together with Tau Ceti’s plane topology, symplectic billiards and Bochner theorem."

**Claim:** The head reuses no symplectic billiards and nothing on billiards from Tau Ceti: the smooth billiard map is the roadmap SymplecticGeometry/CotangentLagrangian C3.1, and the README excludes symplectic billiards.

**Witness:** `TauCetiRoadmap/MathematicalBilliards/README.md` line 15: "Not part of this roadmap: … outer and symplectic billiards"; line 71 heading `From TauCetiRoadmap.SymplecticGeometry/CotangentLagrangian`; no file of the pinned Tau Ceti contains "billiard" (0 hits).

**Repair:** Replace the sentence by: "The construction reuses Mathlib’s circle lifts, measurable actions and structure groupoids, Tau Ceti’s plane topology, Bochner theorem and strongly continuous unitary groups, and the smooth billiard map of SymplecticGeometry/CotangentLagrangian C3.1."

## Previous findings

- R01 — repaired: the sentence "In open pull requests of ours: none. …" is gone; the Dependencies paragraph now reads "the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them".

## Verified sound

| Statement | Instances and values computed | Source or pin read | Result |
|---|---|---|---|
| Description, summary block, "Tau Ceti’s … symplectic billiards" (R01) | files of the pinned Tau Ceti containing "billiard": 0; README supplier headings: Mathlib, Tau Ceti, CotangentLagrangian, IntegrableSystems, Surfaces, GeometricTopology | README lines 15, 59, 71 | description contradicted |
| Description: "two distinct periodic orbits of every type (p, q) with 0 < p < q"; §6.4 `ConvexTable.exists_two_periodic_orbits` | Lean binders `p q : ℕ`, `0 < p`, `p < q`, no coprimality; ellipse semi-axes 2, 1, type `(2, 4)`: axes twice, gaps `ℓ/2`, `s_{j+4} = s_j + 2ℓ`, perimeters 16 and 8, vertex sets differ | `Suggested.lean` lines 249–252; README line 536 | description agrees with the head |
| Description: "ClassicalErgodicTheory already cites §§12.1–12.5 and Layers 7–8 of this roadmap as their owner" | supplier heading there: "From TauCetiRoadmap.MathematicalBilliards — §§12.1–12.5, Layers 7–8"; `*Needs:*` lines cite §§8.2–8.3, 12.1–12.5 | ClassicalErgodicTheory README (open head) lines 288, 317, 1093, 1201 | agrees |
| Description: "without … separability of the Hilbert space"; Lipschitz graphs for `k ≥ 2`; periodic orbits at `C¹` | README: "No separability is assumed" (§12.3, §12.4.1); `k ≥ 2` in §5.3; `k ≥ 1` in §6.4 | README lines 424, 536, 899, 919 | agrees |

The rows for the statements of the folder stand as in the previous review, of `5b627bb`: the folder changed by 0 lines.

- Incremental re-review: 0 changed lines in the folder since `5b627bb`; no file changed outside the folder; this round read the title and description against the head.
- Description sentences checked against the head: 17 (summary block 3 paragraphs, prose paragraph, folder line); 1 contradicted (R01). The title, "adds a roadmap", agrees with the change (1320 insertions, 0 deletions, roadmap not on main).
- Cross-roadmap citations resolved this round: 2 (ClassicalErgodicTheory at its open head, lines 288 and 317; SymplecticGeometry/CotangentLagrangian on main); the four supplier roadmaps are on main.
- Gate at this head: every check 0, `OK`. Dependency check: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: nine `sorry` warnings, nothing else.
- Overlap check: read ClassicalErgodicTheory, PlanarTopology, TeichmullerGeometry, ProbabilisticAndMetricNumberTheory, IntegrableSystems, CotangentLagrangian, ConformalMapping (scopes as in the previous review; the overlap list reports no shared, dropped or revision-only id); nothing shared.
- Source independence: changed passages only: 0 passages changed in the folder, so none compared; largest share BialyMironov2022, 16 of 90 locators, and the contents comparison (independent) stand as in the previous review; the seven waived or uncertified sources could not be read.

## Not verifiable

- The description's "6 independent review rounds and 2 red-team rounds on the job board": a statement about process, not checkable against the head.
- The locators into the seven waived or uncertified sources (KatokHasselblatt1995, Tabachnikov2005, ChernovMarkarian2006, BoldrighiniKeaneMarchetti1978, MasurTabachnikov2002, ZemlyakovKatok1975, KerckhoffMasurSmillie1986): no text, as in the previous review.

## Source issues

- none

## For the human reviewers

- Licence: Hochman2012 (README line 976) is unpublished lecture notes on the author's page; Layer 12 cites it for the `ℤ`-action analogues of §§12.1–12.5.
- Not tested: wording and arrangement were not compared with the seven waived or uncertified sources (47 of 90 locators); Layers 7–11 cite, besides ChaikaForni2026, only these.
