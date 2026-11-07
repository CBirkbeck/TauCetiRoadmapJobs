# GATE-MorseTheory~2: answers to human review

Head before: `2790aed`. Head after: `9a916c5` (one commit, not pushed). Files touched:
`TauCetiRoadmap/MorseTheory/README.md`, `TauCetiRoadmap/MorseTheory/Suggested.lean`.

## H01 (roed-math) — applied

`TauCetiRoadmap/MorseTheory/README.md` line 17: `[HomotopySpheres §4B](../HomotopySpheres/README.md)` → plain text `HomotopySpheres §4B`, as on main (main line 97). The folder `TauCetiRoadmap/HomotopySpheres/` exists neither on main (`eaf17b1`) nor at this branch's merge base. It exists only at the head of #1287 (`52ebd6f`), where `### 4B. Full real Bott proof spine` (README line 1341) consumes MorseTheory M5 (lines 1372–1374). MorseTheory names HomotopySpheres only as a consumer (Scope and ownership; Downstream consumers, line 1133), never as a supplier, so the plain-text citation adds no dependency on #1287. The other two mentions (lines 1037, 1133) were already plain text.

## Same defect elsewhere in the README (links that break on main or when an open revision merges)

The README's other relative links were checked against main `eaf17b1`. All their target files exist: AffineMorseLefschetz, HeegaardFloer, DifferentialGeometry, AlgebraicTopology, GeometricTopology, CharacteristicClasses, ComplexKahlerGeometry, ComplexManifolds, DGFloer and SymplecticGeometry/ConvexityToric. The anchors were also checked:

- `../ComplexKahlerGeometry/README.md#k7-projective-torus-and-hopf-examples` (line 943) exists on main. The open revisions #1398 (head checkout) and #1807 (`roadmaps show --pr 1807`) both rename the heading to `## Layer 7: …`, which drops that anchor. Both keep the labels `(K7.1)` and `(K7.2)` (#1398 lines 2154, 2211; #1807 lines 1962, 2000). Change: the link → `../ComplexKahlerGeometry/README.md`, with the text `ComplexKahlerGeometry K7.1 and K7.2` unchanged. The citation now resolves on main and at both heads, and cites no revision's numbering.
- `../DifferentialGeometry/README.md#layer-5-integration-and-stokes-theorem` exists on main and at the heads of #886 (line 721) and #1187 (line 504). The draft #334 has no Layer 5, but neither did its merge base, so #334 does not drop the anchor. No change.
- `../ComplexManifolds/README.md#milestone-1-restriction-of-scalars-and-atlas-transport` exists on main, and no open pull request revises ComplexManifolds. No change.

## Ids this pull request drops that main cites (from the overlap data)

This PR renames `## M2. …` and `## M5. …` to `## Layer 2: … (M2)` and `## Layer 5: … (M5)`. That drops two anchors HeegaardFloer links to on main: `#m2-compact-band-deformation-handles-and-cells` (HeegaardFloer line 647) and `#m5-morsebott-normal-bundles-and-attachments` (line 1064). The anchors cannot be kept: `<a id>` tags are refused by the gate's residue rule, and an `M2. …` heading would break the `## Layer k:` shape. Change: "How to read the build" (README lines 153–161) now lists the old → new section id for each of M1–M6, one line per id; each new id was checked against the slugs of the README's own headings.

Every plain-text citation of MorseTheory in other roadmaps uses the labels M1–M6 (`roadmaps grep`: M1 ×57, M2 ×59, M3 ×10, M4 ×23, M5 ×45, M6 ×2), and the layer headings keep those labels, so none of them breaks.

## Gate repair outside the review: `letI` in two headline signatures

The gate's statement-hygiene scan (the earlier gate runs on this PR predate it) reported three P3 hits: `letI := cs` in `exists_scalarRegularLevelData` (old line 78), and `letI := t` and `letI := cw` in `exists_morseCWModel` (old lines 111, 113). Change: the three lines are deleted. In Lean 4 a binder whose type is a class (`∃ cs : ChartedSpace …`, `∃ t : TopologicalSpace X`, `∃ cw : Topology.CWComplex …`) is already a local instance in its scope, so the statements are unchanged. Witness, from a temporary `set_option pp.explicit true in #check @…` appended to the file, built with the permitted `lake build`, then removed:

- in `exists_scalarRegularLevelData`, every argument after `@instTopologicalSpaceSubtype M (fun x => f x = c) inst_3` is the bound `cs` (8 occurrences of `cs`, no other `ChartedSpace` instance);
- in `exists_morseCWModel`, the instances are `@T2Space X t` and `@Topology.RelCWComplex.cell X t univ ∅ (@Topology.CWComplex.instRelCWComplex X t univ cw) j`.

The README text for both theorems (lines 427, 652–655) says the same thing as the restated Lean.

## Signature check (`#check @name` for every declaration)

A temporary `#check @name` was added for all 16 declarations (`criticalPoints`, `criticalCount`, `finite_criticalPoints_inter`, `exists_normalized_morseChart`, `exists_scalarRegularLevelData`, `sublevelInclusion`, `exists_sublevelDeformation`, `exists_morseCWModel`, `exists_proper_boundedBelow_morse`, `bettiNumber`, `strong_morse_inequalities`, `nonempty_homeomorph_sphere_of_two_criticalPoints`, `exists_degenerateCriticalLevelDeformation`, `exists_noCriticalOpenSublevelDeformation`, `exists_criticalCategoricalCover`, `exists_compactTrapped_gradient_limit`). They were elaborated once through `lake build TauCetiRoadmap.MorseTheory.Suggested` and then removed. Every theorem carries the standing binders `hfd hbd ht2 hsm hsc` through the `include` line. `sublevelInclusion` keeps only `[TopologicalSpace M]`, and `bettiNumber` keeps only `[Field k] [TopologicalSpace X]`; this matches the README Conventions ("`sublevelInclusion` needs only a topological space…"). No elaborated type changed except the removal of the `let` wrappers described above.

## Merge state against main (blocking for merge, outside the review)

main merged #1094 ("MorseTheory: degenerate critical-point bounds and sphere recognition", `53021f1`) after this branch's merge base `ffcc9d3`. `git merge-tree HEAD origin/main` reports content conflicts in both `README.md` and `Suggested.lean`. #1094's content is absent from this head:

- the Reeb/Schoenflies sphere-recognition material and the pinned `natCard_zerothHomotopy_sphere_compl_range_eq_two` / `isZero_reducedSingularHomologyFunctor_compl_range_closedBall` inputs;
- main's `### M4.1. Two critical points with arbitrary degeneracy`;
- main-only declarations such as `nonempty_homeomorph_sphere_of_two_euclidean_opens`, `exists_twoEuclideanOpenCover_of_two_criticalPoints`, `mgradient`, `tendsto_of_isMIntegralCurveOn_neg_mgradient`, `morse_inequalities`, `minimumCriticalCount_eq_extended_sInf` and `MorseFiniteWitness`.

main's README also cites `AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality` (main lines 69, 509), which #1652 drops. This PR must be rebased onto main (this PR onto the merged #1094, not the reverse) and the two revisions reconciled before merge. That rebase is not done here: this job may only add and commit on the checked-out branch, and the reconciliation needs its own full mathematics pass.

## Adversarial pass on the statements this round changed

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| README l.17 citation `HomotopySpheres §4B` | main `eaf17b1`; merge base `ffcc9d3`; #1287 head `52ebd6f` | file `TauCetiRoadmap/HomotopySpheres/README.md`: absent / absent / present; §4B heading at #1287: `### 4B. Full real Bott proof spine` (l.1341) | broken link on main; the plain-text id resolves at the head that defines it | link → plain text |
| README l.943 `ComplexKahlerGeometry K7.1 and K7.2` | main; #1398 head; #1807 head | anchor `k7-projective-torus-and-hopf-examples`: 1 / 0 / 0 headings; labels `(K7.1)`, `(K7.2)`: present at all three | anchor breaks on either merge; labels survive | anchor fragment dropped |
| README l.156–161 id map | 6 old main headings, 6 new headings | slug(`M2. Compact-band deformation, handles and cells`) = `m2-compact-band-deformation-handles-and-cells` → slug(`Layer 2: compact-band deformation, handles and cells (M2)`) = `layer-2-compact-band-deformation-handles-and-cells-m2`; M5: en dash dropped, `m5-morsebott-…` → `layer-5-morsebott-normal-bundles-and-attachments-m5`; all 6 targets are slugs of this README's headings | every new id resolves | added |
| `exists_scalarRegularLevelData` (no `letI`) | `finrank E = 0` (`Fin (0−1)` = `Fin 0` by ℕ-subtraction); M = ℝ, f = x, c = 0; M = ℝ², f = x² + y², c = 1; M = ℝ, f = x², c = 0 | n = 0: `mfderiv` maps the 0 space into ℝ, so it is not surjective; `hregular` forces the level set to be empty; the empty atlas, empty embedding and vacuous kernel clause make the statement true. ℝ, f = x: level set {0}, model `Fin 0 → ℝ` (a point), range {0} = ker(id) = {0}. Circle: model ℝ¹, tangent line = ker(2x, 2y). x², c = 0: `mfderiv` at 0 is 0, so `hregular` fails and the case is excluded | true in every case; the instance argument is `cs` at all 8 uses | `letI` deleted |
| `exists_morseCWModel` (no `letI`) | M = ∅; M = ℝ, f = x²; M = S¹, f = height; negative control M = ℝ, f = x | ∅: X = ∅, all cell types empty. x²: one 0-cell ≃ {0}, no 1-cell, X = point ≃ ℝ. S¹: cells in dimensions 0 and 1, X ≃ S¹. f = x (proper, no critical points, unbounded below): the conclusion would force X = ∅, but ℝ is not homotopy equivalent to ∅, so the statement fails without `BddBelow`, and `hb` is present | true on the positive instances; the bounded-below hypothesis is necessary and stated | `letI` deleted |

No new mathematical claim, locator or source was added, so `sources.toml` and `needs-references.toml` are untouched. No construction was added, so there is no new ownership question.

## Build, gate and direction check

- Build: `lake build TauCetiRoadmap.MorseTheory.Suggested` → `Build completed successfully (8992 jobs)`, 12 `declaration uses sorry` warnings (one per theorem), no other diagnostic.
- Gate summary line: `gate MorseTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck output: `depcheck: 239 roadmaps, 2358 edges, 0 problem(s)` (no UPWARD, CYCLE or `moved:` line).
- `roadmaps resolve TauCetiRoadmap/MorseTheory/README.md`: no unresolved cross-roadmap citation and no unresolved Lean name.
- Only an open revision defines: none.
- Untrusted text: the review contains no instructions beyond its suggested repair; nothing suspicious.
