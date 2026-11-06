# Review of ClassifyingSpaces (pull request #1808 at 925dc8b)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 0439c6d. `git diff --stat 0439c6d 925dc8b -- TauCetiRoadmap/ClassifyingSpaces` is empty: the README (304 lines, Stage/item form), `Suggested.lean` (232 lines, 27 declarations), `PROGRESS.md`, `STATUS.md` and `metadata.toml` are byte-identical to the copy the previous review read, and still the copy on `origin/main` plus the three-line README change at lines 96–98. The commits since then (`1b0434eb`, `925dc8b0`) touch only `TauCetiRoadmap/AlgebraicCurves/`, which this roadmap neither cites nor is cited by. The Tau Ceti pin is unchanged (`2fd255d997f47c0b5d834ee416c7015d55444ce5` at this head and on `origin/main`). The worker's gate at this head fails on the same three counters as before (`sorry-data=27 outside-folder=2 build=2`); the dependency check is clean. Every finding of the previous review therefore stands, re-verified at this head below, and none is new.

## R01 (P1) — Twenty-seven sorry'd data declarations, one `sorry` inside a theorem statement, and a definition that lost its `[Group G]`

**Location.** `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` lines 39, 49, 54, 56, 63, 65, 74, 76, 90, 92, 94, 96, 100, 112, 133, 135, 138, 142, 148, 150, 153, 160, 163, 188, 190, 206, 212 (the gate's `sorry-data` list at 925dc8b); line 120 (`FundamentalGroup.mapOfEq (classifyingSpaceMap G φ) sorry γ`); line 49 (`noncomputable def universalGSpaceBasepoint : universalGSpace G := sorry`).

**Claim.** Every `def` and `instance` of the file except `universalGSpace` (42), its topology (45), `classifyingSpace` (68) and its topology (71) has body `sorry`, and those four rest on the sorry'd `countableJoin` (39) and `MulAction` instance (63); so every theorem in the file mentions sorry'd data. Line 120 puts a `sorry` proof term inside the statement of `fundamentalGroup_classifyingSpaceMap`, so its type depends on `sorryAx`. Line 49 elaborates to `(G : Type u) → universalGSpace G` with no `One G` or `Group G` binder (the worker's `signatures.md` flags it), so "the vertex at index 0 labelled by 1" cannot be written; the pin's `TauCeti.universalGSpaceBasepoint` takes `[One G]` (`TauCeti/AlgebraicTopology/ClassifyingSpace/CountableJoin.lean` 46).

**Witness.** Gate at 925dc8b: `sorry-data=27`. `lake env lean TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` at this head: exit 0, 39 `declaration uses sorry` warnings, nothing else. All 27 objects exist at the pin with real bodies (R03), so none is a definition "needed to make a headline statable".

**Repair.** Unchanged from the previous review: delete every `def`, `abbrev` and `instance`; import the pinned modules (`TauCeti.AlgebraicTopology.ClassifyingSpace.Comparison`, `.Uniqueness`, `.Homology`, `.Cohomology`) and state on `TauCeti.universalGSpace`, `TauCeti.classifyingSpace`, `TauCeti.cellularClassifyingSpace` only the headlines the pin lacks: the pointed uniqueness of line 178 (as written), the existence clause of item 11 for an arbitrary path-connected Hausdorff CW complex, and the (co)homology identification for an arbitrary Hausdorff CW `K(G, 1)` over any commutative ring in one universe. Delete `exists_isEilenbergMacLaneSpaceOne` (108) and `singularHomology_classifyingSpace_iso_groupHomology` (225), which close from the pin in one term (R03). Then `#check @name` on each kept declaration against the README.

## R02 (P1) — The gate's build check fails on the module-system advisory

**Location.** `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` line 1 (`import Mathlib`).

**Claim.** The worker's gate reports `build=2 FAIL`, both lines being lake's advisory that a file importing `Mathlib` from the module-system build should start with `module`. Elaboration is otherwise clean (R01), but the build counter conditions acceptance.

**Witness.** `scratch/gate.md` at 925dc8b, section `## build (2)`.

**Repair.** Put the file in module form as this pull request's other Lean files are (`TauCetiRoadmap/AlgebraicCurves/Suggested.lean` at `1b0434eb` gained the same header): `module`, then `public import Mathlib` and `public import TauCeti.…` for each module whose declarations appear in a public signature, then `@[expose] public section`; rebuild with `lake build TauCetiRoadmap.ClassifyingSpaces.Suggested` and confirm `sorry` is the only warning.

## R03 (P2) — Stages 1–4 plan, and `Suggested.lean` re-declares, what the pinned Tau Ceti proves under the README's own suggested home

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` line 22 ("Suggested home: `TauCeti/AlgebraicTopology/ClassifyingSpace/`"), lines 49–56, 103–105, items 1–19 (lines 116–260); `Suggested.lean` lines 39–228.

**Claim.** At the pin that directory has 30 files and no `sorry` (`grep -rl sorry` over it at this head: no file) and proves what items 1–19 plan; the README presents them as targets and the Lean file declares them again. The item-by-item map of the previous review (R03 there) is unchanged; re-confirmed at this head by file and line: `universalGSpace` (`CountableJoin.lean` 41), `universalGSpaceBasepoint` (46), `classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff` (`EilenbergMacLane.lean` 77), `exists_isEilenbergMacLaneSpaceOne` (120), `universalGSpaceHomeomorphUniversalCover` (129), `classifyingSpaceSingularHomologyIsoGroupHomology` (`Homology.lean` 69), `cellularHomotopyEquivClassifyingSpace` (`Comparison.lean` 211), `instSemilocallySimplyConnectedSpaceCellularClassifyingSpace` (275), `exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace` (287), `IsAspherical.exists_homotopyEquiv` (`Uniqueness.lean` 17, 39), `killHomotopyGroups` (`Homotopy/KillHomotopyGroups.lean` 169) and the rest of the previous list (`PresentationComplex`, `cellularClassifyingSpace`, `cwComplexPreimage`, `IsQuotientCoveringMap.cwComplexQuotient`, `classifyingSpaceHomotopyFunctor`, `universalGSpaceResolution`, `universalGSpaceChainComplexToStandardComplex`, `classifyingSpaceFirstHomologyAddEquiv`, the circle, wedge, torus and finite-cyclic examples).

**Witness.** The previous review's probe at the same pin elaborated `#check` of all 55 names and closed line 108 by projecting `TauCeti.exists_isEilenbergMacLaneSpaceOne G` and line 225, restated on `TauCeti.classifyingSpace G`, by `⟨(TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology ℤ G n).symm⟩`; the pin and the file are unchanged, so the probe's result stands. The folder's own `STATUS.md` lines 9–25 names the same declarations as done.

**Repair.** Unchanged: rewrite the README in the house shape (R08) so that `## Exact supplier contracts`, `From Tau Ceti`, lists the declarations above by name and file and consumes both models, their comparison, the CW structures, the resolutions and the (co)homology identifications from the pin; keep as targets only what the pin lacks (the general-CW existence clause of item 11, the pointed uniqueness of item 12, the general-CW (co)homology identification transported along `IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv`), each with a `*Needs:*` line naming the pinned declarations it starts from; move the conventions of items 5 and 16 to `## Conventions` with the pinned declarations that fix them and a two-term witness.

## R04 (P2) — AlgebraicTopology and ClassifyingSpaces supply each other: Stage 8 → Stages 2–4 here → AT 8.8b

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 72–80 ("Stage 2 below consumes van Kampen, the Stage 4 CW machinery … Stages 3 and 4 consume Whitehead, Hurewicz and the cellular comparison"); `TauCetiRoadmap/AlgebraicTopology/README.md` at 925dc8b lines 93–101, 2045–2049 ("Compare this bar model pointedly with ClassifyingSpaces' Milnor and … uses only the actual CS Stage3/4 model"), 2062, and the table row at line 2412 ("8.8b normalized model comparison | AT8.8a bar model; CS Stage3 items11–15 and Stage4 items16–18 | 8.9").

**Claim.** This roadmap consumes AlgebraicTopology Stage 8 (Hurewicz 8.3, Whitehead 8.5) in Stages 3–4, and AlgebraicTopology 8.8b, in the same Stage 8, consumes this roadmap's Stages 3–4: a coarse cycle between the two roadmaps' layers. The dependency check does not see it because the AT citations are prose and a table row, not `*Needs:*` lines (`depcheck: 240 roadmaps, 2347 edges, 0 problem(s)` at this head).

**Witness.** The lines quoted, read at 925dc8b (`grep -n 'ClassifyingSpaces\|CS Stage' TauCetiRoadmap/AlgebraicTopology/README.md`: lines 93, 97, 100, 2045, 2048, 2049, 2062, 2412, unchanged since 0439c6d). AlgebraicTopology is one of this pull request's own folders.

**Repair.** Unchanged: after R03 this roadmap needs nothing of AlgebraicTopology (van Kampen, cellular approximation, Whitehead and Hurewicz enter only through pinned theorems); lines 72–80 become a consumer sentence naming AlgebraicTopology 8.8b, and `## Downstream consumers` lists it. In `TauCetiRoadmap/AlgebraicTopology/README.md` the citations "CS Stage3 items11–15 and Stage4 items16–18" (lines 2046, 2049, 2062, 2412) name the pinned declarations instead (`TauCeti.classifyingSpace`, `TauCeti.cellularClassifyingSpace`, `TauCeti.cellularHomotopyEquivClassifyingSpace`, `TauCeti.IsAspherical.exists_homotopyEquiv`, `TauCeti.universalGSpaceResolution`).

## R05 (P2) — The presentation-complex `K(A, 1)` tower has two roadmap owners and a third in the library

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 52–55 ("It owns three pieces of general CW machinery that no other roadmap owns: killing a homotopy group by attaching cells and the colimit of the resulting tower (Stage 2, items 8 and 9)"), items 7–10 (lines 159–176); `TauCetiRoadmap/AlgebraicTopology/README.md` at 925dc8b lines 2118–2124 ("extend over the presentation cells using their null relations … likewise own the general higher-cell killing construction with its connectivity and preserved lower-group claims").

**Claim.** The general higher-cell killing construction is item 8 here, is owned by AlgebraicTopology 8.8c there, and at the pin is `TauCeti.killHomotopyGroups` (`KillHomotopyGroups.lean` 169, with `killHomotopyGroupsCWComplex` 358 and `killHomotopyGroupsFundamentalGroupMulEquiv` 301 for `1 < n`). Three owners of one construction.

**Witness.** The lines quoted at 925dc8b (AT lines 2120, 2123 unchanged); the pinned file and lines above.

**Repair.** Unchanged: both READMEs cite the pin; here items 7–10 become citations under R03; in `TauCetiRoadmap/AlgebraicTopology/README.md` lines 2118–2124 cite `TauCeti.killHomotopyGroups` and `TauCeti.PresentationComplex` and keep only what the pin lacks (the `n ≥ 2` models and their normalisation).

## R06 (P2) — Scope item 1 promises the cellular model is locally path-connected and semilocally simply connected, and no item or supplier provides it

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 30–34 ("Each is proved path-connected, locally path-connected and semilocally simply connected, so that the classification theorems of the universal-covers roadmap apply to it"); item 10, lines 174–176.

**Claim.** Item 4 proves the standing hypotheses for the simplicial model only; for the cellular model nothing in the README proves or cites them (`STATUS.md` line 27 says the same). The pin supplies exactly this: `instSemilocallySimplyConnectedSpaceCellularClassifyingSpace` (`Comparison.lean` 275), `instDeltaGeneratedSpaceOfCWComplexUniv` (a Hausdorff CW complex is delta-generated, hence locally path-connected) and `exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace` (`Comparison.lean` 287), whose conclusion carries both hypotheses.

**Witness.** The lines quoted at 925dc8b; the pinned file and lines; Hatcher, Proposition A.4, p. 522 (`hatcher-at` line 22629).

**Repair.** Unchanged: cite the three declarations in the `From Tau Ceti` contract (R03) as the supplier of item 1's promise; "the existence theorem in the same form as Stage 1's" is `exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`.

## R07 (P3) — Two files outside the pull request's own folders are edited

**Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 ("`LFunctions` consumes this package and supplies its own character-specific continuation"); `TauCetiRoadmap/SymplecticGeometry/README.md` line 77 ("boundary and sign adapters consumed by HeegaardFloer and consumed by DGFloer").

**Claim.** The brief's diff command outside the fifteen named folders lists these two files, one line each, at 925dc8b as at 0439c6d. Neither folder is named as the pull request's own.

**Witness.** `git diff --stat origin/main...HEAD` with the fifteen exclusions: `2 files changed, 2 insertions(+), 2 deletions(-)`; the gate: `outside-folder=2`.

**Repair.** Unchanged: move the two one-line edits to a pull request of their own, or name the two folders as this pull request's own so that they get reviews; the SymplecticGeometry line also repeats "consumed by" and reads "consumed by HeegaardFloer and by DGFloer".

## R08 (P3) — The README is not in the house shape, carries process narrative, states no Checks and no locators at the claims, and leaves the `π₁(BG) ≅ G` direction unsaid

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` throughout: headings `## Scope and completion criterion` (24), `## Ownership and dependencies` (49), `## Inventory` (85), `## Stage k` (111, 154, 178, 223), `## Ordering` (262), `## Acceptance checks` (273); line 22 ("Suggested home"), 58 ("now complete"), 64 ("fixes a direction and must say which"), 259 ("The first two are new"), 292–294 (Hatcher cited by section only); `Suggested.lean` lines 9–13 and the "Milestone N" labels.

**Claim.** No `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, no `## Layer k` with `### k.n` subsections, no `*Needs:*` line, no API bullets, no `**Checks.**` list on any definition (the global `## Acceptance checks` has six bullets for nineteen items); no claim in items 1–19 carries a locator; the direction of `π₁(BG) ≅ G` is announced as something the roadmap "must say" and never said (the pin fixes it: `γ ↦ g` iff the lift of `γ` from `⟨0, 1⟩` ends at `⟨0, g⁻¹⟩`, `EilenbergMacLane.lean` 77, so the loop of `B(ℤ)` whose lift ends at `⟨0, n⟩` goes to `−n`); "now complete", "Suggested home", "the first two are new" and the Lean docstring are process narrative; the Hatcher reference "Section 1.B for … the presentation complex" points at a section that only mentions `X_G` (`hatcher-at` 3881–3886, p. 89–90).

**Witness.** The lines quoted at 925dc8b; `hatcher-at` lines 3881–3886, 3897 (Theorem 1B.8, p. 89), 3905 (Proposition 1B.9, p. 89), 15407 (Example 4.16, p. 354), 22534 (Proposition A.1, p. 520).

**Repair.** Unchanged: the rewrite of R03 in the house shape (`# Roadmap: classifying spaces of discrete groups`, `**Summary.**`, `## Scope and ownership`, `## Conventions` with the direction witness above and the deck convention `UniversalCover.deckFundamentalGroupEquiv_symm_op`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k` sections with `*Needs:*` lines, API bullets, three Checks per definition and a locator at each claim, `### Examples`, `### Dependencies`, `## Downstream consumers` naming AlgebraicTopology 8.8b, CharacteristicClasses and FreeGroupsAndLimitGroups Layer 10, `## References`); timeless wording; the Lean docstring in the "<title>: target signatures" form.

## Previous findings

- R01 — not repaired: `Suggested.lean` is byte-identical to 0439c6d; lines 39–212 still carry 27 sorry'd data declarations, line 120 the `sorry` in a statement, line 49 the basepoint without `[One G]`.
- R02 — not repaired: line 1 is still `import Mathlib` with no `module` header; the gate reports `build=2`.
- R03 — not repaired: README items 1–19 (lines 116–260) still plan what the pin proves, and the Lean file re-declares the carriers.
- R04 — not repaired: README lines 72–80 and AlgebraicTopology README lines 93–101, 2045–2062, 2412 unchanged.
- R05 — not repaired: README lines 52–55 and 159–176, AlgebraicTopology README lines 2118–2124 unchanged.
- R06 — not repaired: README lines 30–34 and 174–176 unchanged; no citation of the three pinned declarations.
- R07 — not repaired: the two outside-folder edits are in the diff at 925dc8b; gate `outside-folder=2`.
- R08 — not repaired: the README keeps the Stage/item headings, the process wording at lines 22, 58, 64, 259, and no Checks or locators.

## Verified sound

**Change set.** `git diff --stat 0439c6d 925dc8b -- TauCetiRoadmap/ClassifyingSpaces`: empty. `git diff --stat origin/main...HEAD -- TauCetiRoadmap/ClassifyingSpaces`: README only, 3 insertions, 2 deletions (lines 96–98, the sentence on Mathlib's singular homology functor, true at the pin: `AlgebraicTopology.singularHomologyFunctor`, elaborated in the file's own line 227). The two commits since 0439c6d (`1b0434eb`, `925dc8b0`) change only `TauCetiRoadmap/AlgebraicCurves/README.md` and `Suggested.lean`; this README does not cite AlgebraicCurves and AlgebraicCurves does not cite this roadmap. Outside the fifteen named folders: the two files of R07 and nothing else. Tau Ceti pin at this head and on `origin/main`: `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

**Gate.** Worker's gate at 925dc8b: `sorry-data=27 outside-folder=2 build=2 FAIL`, every other counter 0. Dependency check at this review, verbatim: `depcheck: 240 roadmaps, 2347 edges, 0 problem(s)`; no UPWARD or CYCLE line; ClassifyingSpaces is not in `ORDER.txt` (it is a roadmap on main). Its cited suppliers are on main: `Completed/UniversalCovers`, `TauCetiRoadmap/GeometricTopology` Layer 11, `TauCetiRoadmap/AlgebraicTopology` Stages 1, 2, 4, 8, `TauCetiRoadmap/ProfiniteCohomology`.

**Elaboration.** `lake env lean TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` from the worktree at 925dc8b: exit 0 in 32 s, 39 `declaration uses sorry` warnings, nothing else. The worker's `signatures.md` (27 declarations) matches the previous review's reading: the one dropped binder is R01's line 49; the uniqueness statement (178) carries `T2Space` and `CWComplex` on both sides; the homology statement (225) is on `Type` and `ℤ` against the README's "any commutative ring".

**Pinned declarations re-opened at this head** (file under `TauCeti/AlgebraicTopology/ClassifyingSpace/` unless said): `universalGSpaceBasepoint` (`CountableJoin.lean` 46, `[One G]`), `classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff` (`EilenbergMacLane.lean` 77), `exists_isEilenbergMacLaneSpaceOne` (120), `universalGSpaceHomeomorphUniversalCover` (129), `classifyingSpaceSingularHomologyIsoGroupHomology` (`Homology.lean` 69), `cellularHomotopyEquivClassifyingSpace` (`Comparison.lean` 211), `instSemilocallySimplyConnectedSpaceCellularClassifyingSpace` (275), `exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace` (287), `IsAspherical.exists_homotopyEquiv` (`Uniqueness.lean` 17, 39), `killHomotopyGroups`, `killHomotopyGroupsFundamentalGroupMulEquiv`, `killHomotopyGroupsCWComplex` (`TauCeti/AlgebraicTopology/Homotopy/KillHomotopyGroups.lean` 169, 301, 358); the directory has 30 files and `grep -rl sorry` finds none. The pin being unchanged, the previous review's probe (55 `#check`s and the two one-term closures) was not re-run.

**Seeded sample, "Both models are wanted"** (README lines 14–20), re-read: `hatcher-at` 3844–3859 (Example 1B.7, p. 89: the ordered-tuple `EG` is contractible, `G` acts freely by left multiplication, a covering-space action, `BG = EG/G` is a `K(G, 1)`); 3876–3886 (pp. 89–90: `BG` is large and functorial; the other construction starts from a 2-complex with fundamental group `G`, for example `X_G` of a presentation, and attaches cells of dimension ≥ 3 without changing `π₁`); 3897–3898 (Theorem 1B.8, p. 89, uniqueness of the homotopy type of a CW `K(G, 1)`); 3905–3907 (Proposition 1B.9, p. 89, maps out of a connected CW complex); `segal-1968` 115–127 (Milnor's `(G * G * …)/G`, obtained from `BG` by collapsing degenerate simplices, contractible by (2.1)). The paragraph's four claims hold as the previous review found: uniformity in `G` without a presentation, the cellular model as the presentation complex with higher cells, the comparison making "the" classifying space well defined, and each model proving things about the other (at the pin the cellular model's semilocal simple connectivity is transported from Milnor's, `Comparison.lean` 272–277, and the uniqueness theorem goes through the cellular model, `Uniqueness.lean` 78–88).

**Cross-roadmap citations resolved at 925dc8b and on main.** UniversalCovers (Completed), GeometricTopology Layer 11, AlgebraicTopology Stages 1, 2, 4, 8 and items 8.3, 8.5, 8.8a–c (lines 93–101, 2045–2062, 2118–2124, 2412), ProfiniteCohomology; consumers: AlgebraicTopology 8.8b, CharacteristicClasses (cites AT 8.8b), FreeGroupsAndLimitGroups on main ("`ClassifyingSpaces` Stage 2.7"). The worker's `roadmaps resolve`: nothing unresolved.

**Ownership.** Unchanged from the previous review: `TauCetiRoadmap.ClassifyingSpaces.*` declarations appear only in copies of this folder's `Suggested.lean` (main, #1187, #1807, #1808); AlgebraicTopology's `Suggested.lean` declares `groupClassifyingSpace` as the realized nerve of `SingleObj G`, its own 8.8a model. Against the pinned library: R03.

**Adversarial table.** The folder is unchanged, so every row is carried from the previous review (PRREVIEW-ClassifyingSpaces~12), with its values; no statement changed, so no row is added.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 the countable join complex (r12) | `G` trivial; `G = ℤ/2`; `A i = ∅` for all `i` | trivial `G`: faces = all nonempty finite subsets of `ℕ`, contractible, `BG = EG`; `ℤ/2`: vertices `(i, ±1)`, at most one sign per index, `S^∞`, orbit space `ℝP^∞`; empty family: empty realization | sound; at the pin as `indexedJoin` | R03 |
| 1.2 weak contractibility needs infinitely many nonempty factors (r12) | `A 0 = S⁰`, rest empty; `A 0 = pt`, rest empty | two points, not path-connected; a point | sound; pin uses `[Nonempty G]` | none |
| 1.3 `classifyingSpaceProj_eq_iff`, `∃! g, g • x = y` (r12) | trivial `G`; `ℤ/2` on vertices; an interior point of `{(0,1),(1,1)}` under `g = −1` | `x = y ↔ ∃! g ∈ {1}`; `(−1) • (0,1) = (0,−1)`, unique; the image lies in the disjoint simplex `{(0,−1),(1,−1)}`, so `g • x = x` forces `g = 1` | sound; pin states `∃! g, g • y = x` | none |
| 1.5 direction of `π₁(BG) ≃* G` (r12) | `G = ℤ`, the loop whose lift from `⟨0, 1⟩` ends at `⟨0, n⟩` | pin: `γ ↦ g ↔` lift ends at `⟨0, g⁻¹⟩`, so this loop goes to `−n`; README line 64 leaves it unsaid | convention unstated | R08 |
| 2.8–2.9 killing `π_n`, `n ≥ 2`, and the tower (r12) | `Y = S²`, `n = 2`; `Y` a point | attach 3-cells along generators of `π₂ = ℤ`; tower kills `π₂, π₃, …`, keeps `π₁ = 1`, limit contractible; point: constant tower | sound; pin `killHomotopyGroups n X x`, `n ≠ 0`, Hausdorff | R03, R05 |
| 2.10 standing hypotheses of the cellular model (r12) | the tautological presentation | pin: `exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace G` concludes LPC ∧ SLSC ∧ `K(G,1)`; README promises at 30–34, no route at 174–176 | overclaim, supplied by the pin | R06 |
| 3.12 uniqueness needs CW type on both sides (r12) | a point and the Warsaw circle; two Hausdorff CW `K(G, 1)` | both aspherical with trivial `π₁`, not homotopy equivalent; CW case: 1B.8/1B.9 give pointed `f`, `g` with `gf ≃ id` rel base point | sound; pin has the unpointed form with a path | keep (R01) |
| 3.13 lifted and quotient CW structures (r12) | `S^∞ → ℝP^∞` (`ℤ/2`); `ℝ → S¹` (`ℤ`) | each `n`-cell of `ℝP^∞` lifts to two cells, one orbit per cell; `ℝ` with 0-cells `ℤ`, 1-cells `(n, n+1)`, `ℤ` free on cells, quotient `S¹` | sound; pin `cwComplexPreimage` (`T2Space B`), `cwComplexQuotient` (`T2Space E`, free on open cells) | R03 |
| 4.16 the augmented cellular complex of `E` is a free resolution (r12) | trivial `G`; `ℤ/2` on `S^∞` | ordered chains of `Δ^∞`, exact, `ℤ`-free; one free `ℤ[ℤ/2]`-generator per degree, boundaries alternate `1 − t`, `1 + t`, exact | sound; pin `universalGSpaceResolution k G` | R03 |
| 4.18 join resolution versus standard resolution (r12) | trivial `G`, degree 0; face maps; equivariance | degree 0: `ℤ[ℕ × G]` of infinite rank versus `ℤ[G] = ℤ` of rank 1, not isomorphic; `{(i₀,g₀),…,(iₙ,gₙ)} ↦ (g₀,…,gₙ)` commutes with faces, `h • (i, g) = (i, hg)` matches the diagonal action | sound; pin `universalGSpaceStandardHomotopyEquiv` | R03 |
| 4.19 Checks (r12) | `G = S₃`; `G = ℤ/n`, `H₂`; `H₀` | `H₁(BS₃; ℤ) = ℤ/2`; `H₂(B(ℤ/n); ℤ) = 0`, `H₁ = ℤ/n`; `H₀ = ℤ ≠ 0` so the pin's `NeZero i` is needed | sound | R03 |
| Lean 49 `universalGSpaceBasepoint` (r12, re-read at 925dc8b) | elaborated type | `(G : Type u) → universalGSpace G`, no `One G` | dropped binder | R01 |
| Lean 108 `exists_isEilenbergMacLaneSpaceOne` (r12) | `X = TauCeti.classifyingSpace G` | closes by projecting the pin's `exists_isEilenbergMacLaneSpaceOne G` | padding at this pin | R01, R03 |
| Lean 120 `fundamentalGroup_classifyingSpaceMap` (r12, re-read) | the statement's type | contains `sorry` for the base-point equation | depends on `sorryAx` | R01 |
| Lean 178 pointed uniqueness (r12) | `hX.exists_homotopyEquiv hY e` | yields `e : X ≃ₕ Y` and `γ : Path (e x) y`; `e x = y` and the pointed equation stay open | not at the pin, keep | none |
| Lean 225 homology headline (r12, re-read) | `X = classifyingSpace G`, `k = ℤ`, universe 0 | `⟨(classifyingSpaceSingularHomologyIsoGroupHomology ℤ G n).symm⟩` elaborates; README asks any `k` | padding on the model; narrower than the README | R01, R03 |
| Lean 193 the two models agree (r12) | the tautological presentation | pin `cellularHomotopyEquivClassifyingSpace R e` for every `e : PresentedGroup R ≃* G` | theorem of the pin | R03 |

## Not verifiable

- Milnor, "Construction of universal bundles, II", Ann. of Math. 63 (1956): settled as uncertified; cited by locator only. Segal §3 (`segal-1968` lines 115–127) read instead.
- Brown, *Cohomology of Groups*, §I.4 and Chapters I–III: settled as uncertified; cited by locator only (items 13, 16, 18).
- tom Dieck, *Transformation Groups*, §II.1: settled as uncertified; cited by locator only (item 13).
- Schwamberger–Vogt, "Dold spaces in homotopy theory", §2: settled as uncertified; the Warsaw-circle claim is standard; the locator into the paper is not confirmed.
- Ownership against open pull requests whose files the brief does not list: not checked beyond the worker's index and `roadmaps grep` of the previous review.

## Source issues

- none
