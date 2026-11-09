# Review of ClassifyingSpaces (pull request #1854 at 56715a5)

**Verdict:** needs changes

This is an incremental re-review. The previous review, r33, read c07dda7. `git diff c07dda7 HEAD -- TauCetiRoadmap/ClassifyingSpaces` is empty, so this folder has not changed.

This push did change text that this folder cites. Commit 1ccc5174 rewrites AlgebraicTopology Stage 8.8b and 8.8c in `TauCetiRoadmap/AlgebraicTopology/README.md` and `Suggested.lean`:
- 8.8b now owns Hatcher's Proposition 1B.9, which is this folder's item 11 and its third headline.
- 8.8c now cites the pinned killing tower instead of owning it.

As a result, R03 is partly repaired. It is written again with the new witness. The change also makes the killing-construction citations in this folder wrong, which is new finding R12.

None of the other ten previous findings is repaired; each is written again with its number. I re-checked every witness at this head. The pins are unchanged: Tau Ceti `2fd255d99`, Mathlib `1b1ccf4b`.

## R01 (P1) — Item 13 has a false Check: the join of the trivial group has infinitely many cells in each degree, not one

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 369–370: "The free `ℤ[G]`-module of `n`-chains of `E` has rank the number of `n`-cells of `B`: for the join of the trivial group, every rank is one."

**Claim.** For `G = 1`, `E = B` is the countable join of one-point sets. By item 1's own Check (lines 160–161), that is the infinite simplex on the vertices `{(i, 1) : i ∈ ℕ}`. Its `n`-cells are the `(n+1)`-element subsets of `ℕ`, so every rank is countably infinite.

**Witness.** In degree 0 the rank is `|ℕ|`. Item 18's Check (lines 477–478) says "the join has `ℤ^(ℕ)` and the standard complex `ℤ`", which contradicts this Check.

**Repair.** Replace the clause after the colon with "for the trivial group the rank in degree `n` is the number of `(n+1)`-element subsets of `ℕ`, already `ℤ^(ℕ)` in degree 0 (item 18)". Alternatively, use "for `ℤ` acting on `ℝ` over the one-vertex circle, every rank is one in degrees 0 and 1". Both versions agree with item 18's degree-0 value.

## R02 (P2) — Stages 1–4 plan, as targets, what the pinned Tau Ceti already proves in the roadmap's own suggested home

**Location.**
- Line 24: "Suggested home: `TauCeti/AlgebraicTopology/ClassifyingSpace/`".
- Lines 67–72, the ownership list.
- The Inventory, lines 134–138.
- Items 1–19, lines 150–487.

**Claim.** The suggested home exists at the pin as 30 files, and none of them contains `sorry`. They prove the constructions and theorems that the README states as this roadmap's targets. At this head the pull request's own AlgebraicTopology folder lists several of them as pinned (README lines 451–466): `TauCeti.PresentationComplex`, `TauCeti.cellularClassifyingSpace` and the killing tower.

**Witness.** All paths are under `TauCeti/AlgebraicTopology/ClassifyingSpace/` at the pin. I elaborated each name with `#check` at this head.
- `Basic.lean` 73: `classifyingSpace`.
- `EilenbergMacLane.lean` 104: `isEilenbergMacLaneSpaceOne_classifyingSpace`.
- `PresentationComplex.lean` 238: `PresentationComplex.fundamentalGroupMulEquiv`.
- `Comparison.lean` 287: `exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`.
- `Homology.lean` 69: `classifyingSpaceSingularHomologyIsoGroupHomology`.
- `LocalCoefficients.lean` 150: `classifyingSpaceTwistedCohomologyIsoGroupCohomology`.

**Repair.**
1. Rewrite `## Ownership and dependencies` and the Inventory as a `From Tau Ceti` contract that names these declarations by file.
2. Delete items 1–10, 13, 14 ¶1, 15, 16, 17 ¶1, 18 and 19 as targets.
3. Keep the `γ ↦ m(γ)⁻¹` convention and its `S₃` and `ℤ` Checks under `## Conventions`.
4. Keep as targets only what the pin lacks.
5. FreeGroupsAndLimitGroups on main cites "`ClassifyingSpaces` Stage 2 item 7" (its README lines 40, 2413, 2554 and 2771). Add a line "Stage 2 item 7 → `TauCeti.PresentationComplex`, `PresentationComplex.lean`" so that those citations can follow.

## R03 (P2) — Proposition 1B.9 and the comparison `c_G` still have two owners; this push moved 1B.9 into AlgebraicTopology but left it here

**Location.**
- Item 11, lines 295–309.
- `Suggested.lean` lines 71–84, `exists_continuousMap_mapOfEq_eq_of_isAspherical`.
- Lines 20–22, 67–72 ("the pointed comparison of the nerve model with the two models built here (Stage 3, item 14)") and 104–107.
- Item 14 ¶2, lines 376–388.

**Claim.** There are two problems.
- **Proposition 1B.9.** At this head AlgebraicTopology 8.8b owns it. Its README lines 2475–2502 state it, its `Suggested.lean` line 636 declares `exists_mapOfEq_eq_of_isAspherical_cwComplex`, and its README lines 105–106 say ClassifyingSpaces "consumes that classification … and owns no second proof of it". This folder still owns it as item 11 and as a headline. Item 11's *Needs:* line does not cite 8.8b, and neither do the "(11)" inputs of items 12, 14 and 15. The CS revisions at the heads of #1807 and #1808 also own 1B.9, in their Layer 1, while their AlgebraicTopology 8.8b owns "only its normalized comparison". That makes three claims on one theorem across open heads.
- **The comparison `c_G`.** AlgebraicTopology README line 2457 still constructs, "for a Hausdorff CW K(G,1) Z with a chosen identification κ_Z", the normalised pointed equivalence `c_G : Z → Bπ`. Item 14 ¶2 constructs the same map with the same normalisation and uniqueness.

**Witness.**
- My scratch probe states both headlines verbatim, and `example : @csItem11 = @atItem88b := rfl` elaborates: they are one proposition.
- At `Z = TauCeti.classifyingSpace S₃`, AlgebraicTopology line 2457 builds `c_G` and item 14 ¶2 builds it again.

**Repair.**
1. AlgebraicTopology supplies this roadmap, and its 8.8b builds `[X,Bπ]_*` and `c_G` from 1B.9, so 1B.9 must be owned there. Delete item 11 as a target, and delete `exists_continuousMap_mapOfEq_eq_of_isAspherical` from `Suggested.lean` and from README line 55.
2. Cite "AlgebraicTopology Stage 8 item 8b (`exists_mapOfEq_eq_of_isAspherical_cwComplex`)" wherever items 12, 14 and 15 use (11).
3. Have item 14 ¶2 consume 8.8b's `c_G` at the two models, with `κ_Z` from (5) and (10). Delete the ownership clauses at lines 20–22, 69 and 106–107.
4. Say in the description which revision of this folder wins over the 1B.9 layer at #1807 and #1808 (see R11).

After the repair, the probe's `cs_of_at` (the CS statement obtained as `atItem88b x hY φ`) is the only use left.

## R04 (P2) — The module docstring calls the local-coefficient comparison unstatable, but it elaborates at the pin

**Location.** `Suggested.lean` lines 31–33: "the system attached to a `G`-module through a chosen `π₁(X, x) ≃* G` is itself a construction of the roadmap". Scope item 4 (lines 45–47) makes this comparison part of the completion criterion.

**Witness.** `TauCeti.LocalCoefficientSystem.ofRepresentation` (`LocalCoefficient/Representation.lean` 80) attaches a local system to any representation of `π₁(X, x)`. My probe `probeLocalHom` elaborates at this head with only a `sorry` warning. Its conclusion is `Nonempty (groupHomology A n ≅ LocalCoefficientSystem.twistedHomology (ofRepresentation (X := TopCat.of X) x (A.ρ.comp Ψ.toMonoidHom)) n)`, under `[T2Space X] [CWComplex univ] [PathConnectedSpace X] (IsAspherical X x) (Ψ : π₁ ≃* G) (A : Rep k G)`.

**Repair.**
1. Add `nonempty_twistedHomology_iso_groupHomology` and `nonempty_twistedCohomology_iso_groupCohomology`. The cohomology target is `groupCohomology ((Rep.ihom A).obj (Rep.trivial k G N)) n`, which is the form of `classifyingSpaceTwistedCohomologyIsoGroupCohomology`.
2. Delete the docstring bullet at lines 31–33.

Asphericity must stay. For `X = S² ∨ S¹` with `A = ℤ`, `H₂` is `ℤ` on the topological side and `0` on the group side.

## R05 (P3) — The first two headlines of `Suggested.lean` follow in one term from the pin

**Location.** `Suggested.lean` lines 54–57 (`exists_cwComplex_isEilenbergMacLaneSpaceOne`) and 62–67 (`exists_cwComplex_dim_le_two_fundamentalGroup_mulEquiv`).

**Witness.** Both terms elaborate at this head without error.
- `probe1` is `⟨classifyingSpace G, inferInstance, inferInstance, inferInstance, classifyingSpaceBasepoint G, isEilenbergMacLaneSpaceOne_classifyingSpace G⟩`.
- `probe2` closes with `⟨PresentationComplex R, …, fun _ hn ↦ PresentationComplex.isEmpty_cell R hn, ⟨(PresentationComplex.fundamentalGroupMulEquiv R).trans e⟩⟩`. Here `R = (FreeGroup.lift id).ker`, and `e` comes from `Subgroup.normalClosure_eq_self` and `QuotientGroup.quotientKerEquivOfSurjective`.

**Repair.** Delete both theorems from `Suggested.lean` and name the pinned theorems in the module docstring. Remove the backticked names at README lines 53–54, 246 and 288.

## R06 (P3) — The base point is arbitrary in the item 11–12 headlines, but the cited proof treats only a 0-cell; item 12 does not say its headline is pointed

**Location.**
- `Suggested.lean` lines 76–84 and 91–97: `(x : X)`, with no vertex hypothesis.
- Item 11, lines 295–306.
- Item 12, lines 310–314, which never says the headline is pointed.

**Witness.**
- `hatcher-at` line 3912 treats a single 0-cell base point, and lines 3938–3942 send a maximal tree to `y₀` (pp. 90–91).
- The pinned `homotopicRel_singleton_of_mapOfEq_eq_of_cwComplex` (`EilenbergMacLane/Homotopic.lean` 220), re-elaborated, assumes `skeletonLT univ 1 = {x₀}`.
- Take `S¹` with its vertex at `1` and base point `−1`: the route's first step does not apply.

**Repair.** If R03 deletes the item-11 headline, only `exists_homotopyEquiv_of_isAspherical` remains. Either add `x ∈ Topology.RelCWComplex.skeletonLT (Set.univ : Set X) 1`, or add the well-pointedness of `(X, {x})` to the route, with an owner. In item 12, say "the equivalence can be taken pointed, `F(x) = y`, inducing `e`".

## R07 (P3) — Segal's remark on Milnor's join is in §3, not §2

**Location.** Line 152 ("Segal 1968, §2, the remark comparing `BG` with Milnor's join") and line 537 ("Section 2").

**Witness.** In `segal-1968`, §2 opens at line 64. §3 opens at line 95, on p. 107 (line 94). The comparison with Milnor's `(G*G*…)/G` is at lines 115–127, inside §3.

**Repair.** Replace "§2" with "§3, p. 107" at line 152, and "Section 2" with "Section 3" at line 537.

## R08 (P3) — Missing locators and Checks, a loose Check, and the README shape

**Location and witness.**
- **No locator** on the theorems of items 4, 5, 6, 10, 14, 15, 17 and 18.
- **Fewer than three Checks**: items 3, 6 and 9 have none; items 14, 16 and 18 have two each.
- **A loose Check.** Line 257 reads "`S = ∅`: a point". With `R = {1}`, the 2-cell is attached along the constant loop and the complex is `S²`.
- **Shape.** There is no `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k` with `### Examples` and `### Dependencies`, or `## Downstream consumers`.

**Repair.**
1. Give each target that remains after R02 a locator and three Checks. For item 17, use Hatcher §2.2 p. 148 and §3.H pp. 328–329 (`hatcher-at` lines 6471–6479 and 14326–14412).
2. Write line 257 as "`S = ∅`, `R = ∅`: a point; `R = {1}`: the 2-sphere".
3. Restructure under the house headings.

## R09 (P3) — Item 17 ¶2 asserts the three-model comparison for every coefficient ring, but its supplier gives it over `ℤ` only

**Location.** Line 447: "the composite is the identity on `groupCohomology` for every `A : Rep R G`". The ring `R` is never defined.

**Witness.** `TauCetiRoadmap/AlgebraicTopology/README.md` line 2513, at this head, supplies the bar-model comparison only "for every `A : Rep ℤ π`". With `R = 𝔽₂` and `G = ℤ/2`, the input is missing.

**Repair.** Write `A : Rep ℤ G` at line 447. Otherwise, request "every commutative ring `k`" from AlgebraicTopology 8.8b under `## Exact supplier contracts`.

## R10 (P3) — Two files outside the pull request's folders are edited, and the gate fails

**Location.** `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.

**Witness.** The worker's gate at 56715a5 reads `outside-folder=2 … FAIL` and lists exactly these two files. `git diff --stat origin/main...HEAD` outside the 17 named folders shows these two files: 4 insertions, 4 deletions.

**Repair.** Move both edits to a pull request of their own, or name both folders as this pull request's own.

## R11 (P3) — Other open pull requests change this folder with conflicting heads, and the description is out of date

**Location.** The description's merge-order paragraph says "#1101 → #1807 → this pull request … #1808 is independent of this pull request." Its AlgebraicTopology → ClassifyingSpaces bullet says "Stage 8.8b now states only the bar model's own normalized pointed interface".

**Witness.**
- `scratch/overlaps.md` reports that #1808 conflicts in `ClassifyingSpaces/README.md` and `Suggested.lean`, and #1187 in `Suggested.lean`.
- `roadmaps show ClassifyingSpaces --pr N` gives 304 lines (#1187), 970 (#1807), 1,057 (#1808) and 539 (#1854).
- Since 1ccc5174, 8.8b also owns 1B.9 (R03), so the bullet is false.

**Repair.** In the description:
1. Say which revision of this folder wins, and in what order it stands against #1808 and #1187.
2. Rewrite the 8.8b bullet to say that 8.8b owns 1B.9 and the bar interface.
3. State that the ClassifyingSpaces revisions at #1807 and #1808 must drop their 1B.9 layer.

## R12 (P3) — The killing construction is cited from AlgebraicTopology 8.8c, which at this head says it is pinned

**Location.**
- Lines 64–67: "the killing of a homotopy group by attaching cells are consumed from the algebraic-topology roadmap".
- Lines 101–104: "(its Stage 8 item 8c)".
- Item 8, lines 268–273: "owned by AlgebraicTopology Stage 8 item 8c and is consumed here".
- The Ordering paragraph, lines 493–494.

**Claim.** This push removed AlgebraicTopology's ownership. In its README at c07dda7, line 2518 read "likewise own the general higher-cell killing construction". At 56715a5, lines 2557–2570 replace this with the pinned `TauCeti.killHomotopyGroups` and say "The limit's homotopy groups are those pinned theorems, not a target here." This folder therefore cites a section for a statement it no longer makes.

**Witness.** The pinned names are all in `Homotopy/KillHomotopyGroups.lean`:
- `TauCeti.killHomotopyGroups`, line 169;
- `bijective_homotopyGroupMap_killHomotopyGroupsIncl`, line 260;
- `subsingleton_homotopyGroup_killHomotopyGroups`, line 269;
- `isEilenbergMacLaneSpaceOne_killHomotopyGroups`, line 320;
- `killHomotopyGroupsCWComplex`, line 358;
- `cwType_killHomotopyGroups`, line 400.

My probe `isEilenbergMacLaneSpaceOne_killHomotopyGroups (TopCat.of (PresentationComplex R)) (PresentationComplex.basepoint R)` elaborates. It is items 8–10 for any presentation.

**Repair.** Cite these six declarations, by file, in a `From Tau Ceti` contract. Delete the AlgebraicTopology 8.8c attribution at the four places above. The CW structure on the union is `killHomotopyGroupsCWComplex`, with the hypothesis "no cells above dimension `n`", which `PresentationComplex.isEmpty_cell` discharges for `n = 2`.

## Previous findings

- R01 — not repaired: lines 369–370 still read "for the join of the trivial group, every rank is one."
- R02 — not repaired: line 24 "Suggested home: `TauCeti/AlgebraicTopology/ClassifyingSpace/`"; items 1–19 unchanged; the Inventory, lines 134–138, still omits the pinned `ClassifyingSpace/` directory.
- R03 — partly repaired: AlgebraicTopology 8.8c now cites the pinned presentation and killing models, and 8.8b owns 1B.9. This folder still states item 11 and `exists_continuousMap_mapOfEq_eq_of_isAspherical`, and AlgebraicTopology line 2457 still builds `c_G` for every CW `K(G,1)`.
- R04 — not repaired: `Suggested.lean` lines 31–33, "is itself a construction of the roadmap."
- R05 — not repaired: lines 54 and 62 remain, and both still close by one term at this head.
- R06 — not repaired: `Suggested.lean` line 78 `[PathConnectedSpace X] (x : X)`, with no vertex hypothesis.
- R07 — not repaired: line 152 still has "Segal 1968, §2"; line 537 still has "Section 2."
- R08 — not repaired: line 257 still reads "`S = ∅`: a point, with trivial fundamental group."; the locators and the house shape are still absent.
- R09 — not repaired: line 447 still has "for every `A : Rep R G`".
- R10 — not repaired: the gate at 56715a5 still lists the same two files.
- R11 — not repaired: the description still says "#1808 is independent of this pull request."

## Verified sound

**What changed.**
- `git log c07dda7..HEAD` has two commits: 1ccc5174 (AlgebraicTopology) and 56715a57 (BordismFormalGroups).
- BordismFormalGroups does not cite ClassifyingSpaces: grep finds nothing.
- I read the whole AlgebraicTopology diff (README +107/−48, `Suggested.lean` +40/−18):
  - the 8.4 relative-Hurewicz change touches nothing cited here;
  - the 8.8b and 8.8c changes give R03 and R12;
  - no section this folder cites is renumbered: Stage 1 item 4, Stage 2 item 6, Stage 4 items 1, 3, 5, 7 and 8, and Stage 8 items 3, 5, 8a and 8c all still exist.

**Gate.**
- The worker's gate at 56715a5 has every counter at 0, `build=0` included, except `outside-folder=2` (R10).
- My own run of `gate … ClassifyingSpaces --base origin/main` has every content counter at 0 (`set_option`, `sorry-data`, `imports`, `statement-hygiene`, `readme-ids-missing`, `layer-ids`, `target-ids`, `depcheck`, `stray-files`, `source-material`). It reports `outside-folder=33` because it also counts the 16 other named folders. The two unnamed files are those of R10.

**Dependency check**, verbatim: `depcheck: 239 roadmaps, 2357 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. ClassifyingSpaces, AlgebraicTopology, GeometricTopology, ProfiniteCohomology and `Completed/UniversalCovers` are all on main.

**Elaboration.**
- `lake env lean …/Suggested.lean` exits 0. It gives six `declaration uses sorry` warnings, at lines 54, 62, 76, 91, 104 and 114, and nothing else.
- The imported object files `EilenbergMacLane/Basic` and `Cohomology/Basic` are present.
- `#check @` on all six declarations, in a scratch copy, matches `scratch/signatures.md` and the README:
  - headline 3 carries `[T2Space X] [CWComplex univ] [PathConnectedSpace X]` and `IsAspherical Y y`;
  - headline 4 carries both `T2Space`, both `CWComplex` and both `IsAspherical`;
  - headlines 5 and 6 carry `IsEilenbergMacLaneSpaceOne G X x`, with `k`, `G` and `X` in one universe.

  No binder is lost.

**Padding probe.** I replaced each `sorry` with `first | simp | rfl | infer_instance | aesop`. All six fail: unsolved goals at lines 57, 67 and 84, and "aesop made no progress" at lines 97, 110 and 119. With the pinned `ClassifyingSpace` modules imported, headlines 1 and 2 close by one term (R05).

**Pinned declarations opened or elaborated at this head** (Tau Ceti `TauCeti/AlgebraicTopology/`).
- `ClassifyingSpace/Basic.lean` 73 and 86.
- `ClassifyingSpace/EilenbergMacLane.lean` 104.
- `ClassifyingSpace/PresentationComplex.lean` 117, 238 and 329.
- `ClassifyingSpace/CWComplex.lean` 358 and 365.
- `ClassifyingSpace/Cellular.lean` 174.
- `ClassifyingSpace/Uniqueness.lean` 73: `IsAspherical.exists_homotopyEquiv`, under `[CWType X] [CWType Y]`, with an unpointed equivalence and a path `γ`.
- `ClassifyingSpace/Homology.lean` 69.
- `ClassifyingSpace/LocalCoefficients.lean` 150.
- `LocalCoefficient/Representation.lean` 80.
- `Singular/Twisted/Basic.lean` 672.
- `EilenbergMacLane/Homotopic.lean` 220.
- `Homotopy/KillHomotopyGroups.lean` 169, 260, 269, 320, 358 and 400.

**Cross-roadmap citations.**
- `roadmaps resolve` reports none unresolved.
- AlgebraicTopology at this head: lines 94–107 (ownership), 2457 (`c_G`), 2475–2502 (1B.9), 2513 (`Rep ℤ π`), 2557–2577 (the 8.8c pinned tower), and `Suggested.lean` 628–645.
- CharacteristicClasses lines 159 and 424 are unchanged and agree with Stage 1.
- FreeGroupsAndLimitGroups lines 40, 2413, 2554 and 2771 cite Stage 2 item 7, which still exists (R02 repair item 5).

**Overlap facts** (`scratch/overlaps.md`, each checked).
- #1187 and #1808 conflict with this folder; #1807 no longer does (R11).
- No id cited here is dropped by an open pull request.
- No id cited here is defined only by an open revision.
- This pull request drops no id.
- The closest roadmaps are revisions of AlgebraicTopology. At #1807 (line 100) and #1808 (line 110), 8.8b owns "only" the comparison. The ClassifyingSpaces revisions at #1807 (README lines 23–27, 41–47) and #1808 own 1B.9 (R03).

**Ownership.**
- `namespace TauCetiRoadmap.ClassifyingSpaces` occurs only in copies of this folder.
- `exists_mapOfEq_eq_of_isAspherical_cwComplex` and `exists_continuousMap_mapOfEq_eq_of_isAspherical` have different fully qualified names but state the same proposition (R03).

**Seeded sample, "Both models are wanted"** (lines 14–22).
- Milnor's join: `segal-1968` lines 115–127 (§3, p. 107).
- The presentation complex: `hatcher-at` line 2353 (Corollary 1.28, p. 52).
- Uniqueness: line 3897 (Theorem 1B.8, p. 90, for CW complexes).
- Proposition 1B.9: lines 3905–3907, for a connected CW complex.

The claim "not duplication" is contradicted by the pin (R02). The claim that the nerve comparison "is also a theorem of this roadmap" is contradicted by AlgebraicTopology line 2457 (R03).

**Adversarial table.** No statement in this folder changed. The rows marked (r33) are carried from r33, which carried them from r29's computations at c9c60d0. The rows marked (new) are computed at this head for the statements that the AlgebraicTopology change affects.

| Statement | Instances tried | Values computed (README side / other side) | Result | Change |
| --- | --- | --- | --- | --- |
| Item 11 vs AT 8.8b `exists_mapOfEq_eq_of_isAspherical_cwComplex` (new) | `rfl` between the two propositions; `X = Y = S¹`, `φ = ·2` | `@csItem11 = @atItem88b := rfl` elaborates; both demand `z ↦ z²`, `1 ↦ 2` on `π₁` | one theorem, two owners | R03 |
| Item 14 ¶2 vs AT line 2457 `c_G` (new) | `Z = classifyingSpace S₃`, `κ_Z = classifyingSpaceFundamentalGroupMulEquiv` | AT: `c_G : Z → Bπ`, identity on `S₃`, unique; item 14: the same map | two owners | R03 |
| Items 8–10 vs the pinned tower (new) | `S = {a}`, `R = {a²}`: `P_R = ℝP²`, cells (1, 1, 1) | `killHomotopyGroups 2`: `π₁ = ℤ/2` (bijective, `Nat.card (Fin 1) = 1 < 2`); `π_k = 0` for `k ≥ 2`; CW since `isEmpty_cell` for `n ≥ 3` | pinned; AT 8.8c disclaims | R12 |
| Headline 1, CW `K(G,1)` exists (r33) | `G = 1`; `ℤ`; `ℚ`; `probe1` re-elaborated | a point; `S¹` with cells (1, 1); Milnor model | true; one term | R05 |
| Headline 2, dim ≤ 2 (r33) | `ℤ/2`; `G = 1`; bound ≤ 1; `probe2` re-elaborated | `ℝP²` with cells (1, 1, 1); relator `x·x·x⁻¹ = x` gives a disk; a 1-complex has free `π₁ ≠ ℤ/2` | true, sharp | R05 |
| Headline 3, maps into aspherical (r33) | `X = Y = S¹`, `φ = ·2`; `X = Y = S²`, id vs const | `z ↦ z²`; both trivial on `π₁ = 1`, degrees 1 vs 0 | true; asphericity needed | R03 |
| Headline 3, base point not a vertex (r33; pin re-elaborated) | `S¹`, vertex `1`, `x = −1` | route needs a 0-cell (`hatcher-at` 3912, 3938–3942); pin assumes `skeletonLT univ 1 = {x₀}` | route gap | R06 |
| Headline 4, pointed uniqueness (r33) | `S¹`, `e = −1`; point vs Warsaw circle | `F = z ↦ z̄`, `F(1) = 1`, `F_* = −1`; Warsaw circle excluded by `CWComplex` | true | R06 |
| Headline 5, homology (r33) | `S¹`, `k = ℤ`; `ℝP^∞`, `k = ℤ` and `𝔽₂` | `H₀ = H₁ = ℤ`, `H₂ = 0` both; `H₁ = ℤ/2`, `H₂ = 0` both; `𝔽₂` in every degree both | true | none |
| Headline 5, negative control (r33) | `S² ∨ S¹`, `G = ℤ` | `H₂ = ℤ` vs `0` | hypothesis present | none |
| Headline 6, cohomology (r33) | `S¹`, `ℝP^∞`, `k = ℤ` | `H⁰ = H¹ = ℤ` both; `H¹ = 0`, `H² = ℤ/2` both | true | none |
| Local-coefficient comparison (r33; re-elaborated) | `probeLocalHom`; `S¹`, `A = k` with `t ↦ u ≠ 1` | elaborates; `H₀ = k/(u−1) = 0`, `H₁ = ker(u−1) = 0` both | statable, absent | R04 |
| Item 5 direction (r33) | `S₃`, `s = (12)`, `t = (23)` | `m(ℓ_s ℓ_t) = ts`; `γ ↦ m(γ)⁻¹` gives `st` | agrees with pin | none |
| Item 5 sign (r33) | `G = ℤ`, lift ends at `(0, 1)` | `m = 1`, image `−1` | true | none |
| Item 1 Checks (r33) | `G = 1`; `ℤ/2`; empty family | infinite simplex; `{(0,0),(0,1)}` not a face, `{(0,0),(1,1)}` a face; empty | true | none |
| Item 7 Checks (r33) | `R = ∅`; `R = {aⁿ}`; `S = ∅`, `R = {1}` | `FreeGroup S`; `ℤ/n`; `S²`, not a point | last Check loose | R08 |
| Item 13 rank Check (r33) | `G = 1`, degree 0 | Check: 1; actual `|ℕ|`; item 18: `ℤ^(ℕ)` | false | R01 |
| Item 13 circle Check (r33) | `ℤ` on `ℝ` over one-vertex `S¹` | `∂(1-cell) = t − 1` | true | none |
| Item 16 Check (r33) | `G = ℤ` | `ℤ[t^±] →(t−1) ℤ[t^±] →ε ℤ` exact | true | none |
| Item 18 Checks (r33) | `G = 1`, degree 0 | `ℤ^(ℕ)` vs `ℤ` | true | none |
| Item 17 ¶2 coefficients (r33; AT line 2513) | `R = 𝔽₂`, `G = ℤ/2` | AT supplies only `Rep ℤ π` | input missing | R09 |

**Remarks on untouched text** (not findings).
- The docstring's "the pinned `Topology.CWComplex` has no notion of a cellular group action" (lines 26–28) sits beside the pinned `instMulActionCellUniversalGSpace` (`ClassifyingSpace/CWComplex.lean` 281); R02 covers it.
- I could not find in AlgebraicTopology Stage 4 item 5 the "CW structure on the union of an expanding tower" that item 9 cites. `killHomotopyGroupsCWComplex` supplies it (R12).

## Not verifiable

- Milnor, "Construction of universal bundles, II" (1956): settled as uncertified, so it is cited by locator only. I read `segal-1968` lines 115–127 instead.
- Brown, *Cohomology of Groups*, §I.4 and Chapters I–III: settled as uncertified (items 13, 16 and 17).
- tom Dieck, *Transformation Groups*, §II.1: settled as uncertified (item 13).
- Schwamberger–Vogt, "Dold spaces in homotopy theory", §2: settled as uncertified (the Warsaw circle, item 12).

## Source issues

- **Gap** in hatcher-at at Proposition 1B.9, printed pp. 90–91: the statement allows any base point of the CW complex, but the proof handles only a base point that is a 0-cell (one 0-cell, then a maximal tree sent to the target base point); it should require a 0-cell base point or invoke well-pointedness of the pair; affects the proof.
