# Review of ClassifyingSpaces (pull request #1854 at df0367f)

**Verdict:** needs changes

This is an incremental re-review. The previous review, r39, read 56715a5. `git diff 56715a5 HEAD -- TauCetiRoadmap/ClassifyingSpaces` is empty, so this folder has not changed. The pins are also unchanged: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`.

Of the seven commits since 56715a5, only b9f2c11b touches a folder this one cites. It rewrites AlgebraicTopology Stage 8.8b. The 8.8b route now covers a base point that is not a 0-cell (AlgebraicTopology README lines 2495–2537), and its `Suggested.lean` docstring at line 634 says the base point "need not be a `0`-cell". This gives R06 a simpler repair: consume 8.8b. It does not repair R06, because this folder still uses its own item-11 route.

I re-checked every witness at this head. The AlgebraicTopology line numbers moved and are updated below. All twelve findings stand, and none is repaired. I found no new defect.

## R01 (P1) — Item 13 has a false Check: the join of the trivial group has infinitely many cells in each degree, not one

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 369–370: "The free `ℤ[G]`-module of `n`-chains of `E` has rank the number of `n`-cells of `B`: for the join of the trivial group, every rank is one."

**Claim.** For `G = 1` we have `E = B`, the countable join of one-point sets. By item 1's own Check (lines 160–161), that is the infinite simplex on `{(i, 1) : i ∈ ℕ}`. Its `n`-cells are the `(n+1)`-element subsets of `ℕ`, so every rank is countably infinite.

**Witness.** The rank in degree 0 is `|ℕ|`. Item 18's Check (lines 477–478) says "the join has `ℤ^(ℕ)` and the standard complex `ℤ`", which contradicts this Check.

**Repair.** Replace the clause after the colon with "for the trivial group the rank in degree `n` is the number of `(n+1)`-element subsets of `ℕ`, already `ℤ^(ℕ)` in degree 0 (item 18)". Alternatively, use "for `ℤ` acting on `ℝ` over the one-vertex circle, every rank is one in degrees 0 and 1". Both versions agree with item 18's degree-0 value.

## R02 (P2) — Stages 1–4 plan, as targets, what the pinned Tau Ceti already proves in the roadmap's own suggested home

**Location.**
- Line 24: "Suggested home: `TauCeti/AlgebraicTopology/ClassifyingSpace/`".
- The ownership list, lines 63–73.
- The Inventory, lines 112–142, which never names that directory.
- Items 1–19, lines 150–487.

**Claim.** The suggested home exists at the pin as 30 files, and `grep -c sorry` finds none in any of them. Those files prove the constructions and theorems that the README states as this roadmap's own targets.

**Witness.** Files under `TauCeti/AlgebraicTopology/ClassifyingSpace/` at the pin, each name elaborated at this head:
- `Basic.lean` 73: `classifyingSpace`.
- `EilenbergMacLane.lean` 104: `isEilenbergMacLaneSpaceOne_classifyingSpace`.
- `PresentationComplex.lean` 238: `fundamentalGroupMulEquiv`.
- `Comparison.lean` 287.
- `Homology.lean` 69.
- `LocalCoefficients.lean` 150.

**Repair.**
1. Rewrite `## Ownership and dependencies` and the Inventory as a `From Tau Ceti` contract that names these declarations by file.
2. Delete items 1–10, 13, 14 ¶1, 15, 16, 17 ¶1, 18 and 19 as targets.
3. Keep the `γ ↦ m(γ)⁻¹` convention and its `S₃` and `ℤ` Checks under `## Conventions`.
4. Keep as targets only what the pin lacks.
5. Add old → new lines so that citing roadmaps can follow:
   - "Stage 2 item 7 → `TauCeti.PresentationComplex`, `PresentationComplex.lean`", cited by FreeGroupsAndLimitGroups on main (README lines 40, 2413, 2554 and 2771);
   - "Stage 1 → `TauCeti.classifyingSpace`, `Basic.lean`", cited by this pull request's CharacteristicClasses (README lines 442–446).

## R03 (P2) — Proposition 1B.9 and the comparison `c_G` each have two owners: AlgebraicTopology 8.8b and this folder

**Location.**
- Item 11, lines 295–309.
- `Suggested.lean` lines 71–84, `exists_continuousMap_mapOfEq_eq_of_isAspherical`.
- Lines 20–22, 67–72 and 104–107.
- Item 14 ¶2, lines 376–388.

**Claim.**
- **Proposition 1B.9.** AlgebraicTopology 8.8b owns it: its README lines 2487–2549 and its `Suggested.lean` line 639 (`exists_mapOfEq_eq_of_isAspherical_cwComplex`). Its README lines 105–107 say ClassifyingSpaces "consumes that classification … and owns no second proof of it". This folder states it again as item 11 and as a headline. Neither item 11's *Needs:* nor the "(11)" inputs of items 12, 14 and 15 cite 8.8b.
- **The comparison `c_G`.** AlgebraicTopology README lines 2469–2474 build, for any Hausdorff CW `K(G,1)` `Z` with `κ_Z`, the normalised pointed equivalence `c_G : Z → Bπ`. Item 14 ¶2 builds the same map.

**Witness.** The probe `example : @exists_continuousMap_mapOfEq_eq_of_isAspherical.{u, v} = @atItem88b.{u, v} := rfl` elaborates at this head. Here `atItem88b` is 8.8b's statement copied verbatim, so the two are one proposition. The ClassifyingSpaces revisions at #1807 (README line 531) and #1808 (line 516) also own 1B.9.

**Repair.**
1. Delete item 11 as a target, and delete `exists_continuousMap_mapOfEq_eq_of_isAspherical` from `Suggested.lean` and from README line 55.
2. Cite "AlgebraicTopology Stage 8 item 8b (`exists_mapOfEq_eq_of_isAspherical_cwComplex`)" wherever items 12, 14 and 15 use (11).
3. Have item 14 ¶2 consume 8.8b's `c_G` at the two models, with `κ_Z` taken from (5) and (10).
4. Delete the ownership clauses at lines 20–22, 69 and 106–107.

## R04 (P2) — The module docstring calls the local-coefficient comparison unstatable, but it elaborates at the pin

**Location.** `Suggested.lean` lines 31–33: "the system attached to a `G`-module through a chosen `π₁(X, x) ≃* G` is itself a construction of the roadmap". Scope item 4 (lines 45–47) makes this comparison part of the completion criterion.

**Witness.** `TauCeti.LocalCoefficientSystem.ofRepresentation` (`LocalCoefficient/Representation.lean` 80) builds the system. The probe `probeLocalHom` elaborates at this head. Its conclusion is `Nonempty (groupHomology A n ≅ LocalCoefficientSystem.twistedHomology (ofRepresentation (X := TopCat.of X) x (A.ρ.comp Ψ.toMonoidHom)) n)`, under `IsAspherical X x` and `Ψ : π₁ ≃* G`.

**Repair.**
1. Add `nonempty_twistedHomology_iso_groupHomology`, as in the probe.
2. Add `nonempty_twistedCohomology_iso_groupCohomology`, with target `groupCohomology ((Rep.ihom A).obj (Rep.trivial k G N)) n`. That is the form of `classifyingSpaceTwistedCohomologyIsoGroupCohomology` (`ClassifyingSpace/LocalCoefficients.lean` 150).
3. Delete the docstring bullet at lines 31–33.

Asphericity must stay. For `X = S² ∨ S¹` with `A = ℤ`, `H₂` is `ℤ` on the topological side and `0` on the group side.

## R05 (P3) — The first two headlines of `Suggested.lean` follow in one term from the pin

**Location.** `Suggested.lean` lines 54–57 (`exists_cwComplex_isEilenbergMacLaneSpaceOne`) and 62–67 (`exists_cwComplex_dim_le_two_fundamentalGroup_mulEquiv`).

**Witness.** Both terms elaborate at this head without error.
- The first is `⟨classifyingSpace G, inferInstance, inferInstance, inferInstance, classifyingSpaceBasepoint G, isEilenbergMacLaneSpaceOne_classifyingSpace G⟩`.
- The second is `⟨PresentationComplex R, …, fun _ hn ↦ PresentationComplex.isEmpty_cell R hn, ⟨(fundamentalGroupMulEquiv R).trans e⟩⟩`, with `R` the kernel of `FreeGroup.lift (MonoidHom.id G)`.

**Repair.** Delete both theorems from `Suggested.lean` and name the pinned theorems in the module docstring. Remove the backticked names at README lines 53–54, 246 and 288.

## R06 (P3) — The base point is arbitrary in the item 11–12 headlines, but the route given here treats only a 0-cell; item 12 does not say its headline is pointed

**Location.**
- `Suggested.lean` lines 76–84 and 91–97: `(x : X)` and `{x : X}`, with no vertex hypothesis.
- Item 11's route, lines 301–305.
- Item 12, lines 310–318, which never says the headline is pointed.

**Witness.**
- `hatcher-at` lines 3912 and 3938–3945, pp. 90–91, treat a base point that is a 0-cell.
- The pinned `homotopicRel_singleton_of_mapOfEq_eq_of_cwComplex` (`EilenbergMacLane/Homotopic.lean` 220), re-elaborated, assumes `skeletonLT univ 1 = {x₀}`.
- Take `S¹` with 0-cells `±1` and base point `i`: the route's first step does not apply.

**Repair.** This is now simpler than at r39. Item 12 should take its pointed map from AlgebraicTopology 8.8b instead of (11), which is also R03's repair. The route in 8.8b's README lines 2523–2537 moves a base point inside a cell to a 0-cell. The headline then needs no vertex hypothesis. In item 12, add "the equivalence can be taken pointed, `F(x) = y`, inducing `e`".

## R07 (P3) — Segal's remark on Milnor's join is in §3, not §2

**Location.** Line 152 ("Segal 1968, §2, the remark comparing `BG` with Milnor's join") and line 537 ("Section 2").

**Witness.** In `segal-1968`, §2 opens at line 64. §3 opens at line 95, on p. 107. The comparison with Milnor's `(G*G*…)/G` is at lines 115–127, inside §3.

**Repair.** Replace "§2" with "§3, p. 107" at line 152, and "Section 2" with "Section 3" at line 537.

## R08 (P3) — Missing locators and Checks, a loose Check, and the README shape

**Location and witness.**
- **No locator** on the theorems of items 4, 5, 6, 10, 14, 15, 17 and 18.
- **Fewer than three Checks**: items 3, 6 and 9 have none; items 14, 16 and 18 have two each.
- **A loose Check.** Line 257 reads "`S = ∅`: a point". With `R = {1}`, the 2-cell is attached along the constant loop and the complex is `S²`.
- **Shape.** There is no `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k` with `### Examples` and `### Dependencies`, or `## Downstream consumers`.

**Repair.**
1. Give each target that remains after R02 a locator and three Checks.
2. Write line 257 as "`S = ∅`, `R = ∅`: a point; `R = {1}`: the 2-sphere".
3. Restructure under the house headings.

## R09 (P3) — Item 17 ¶2 asserts the three-model comparison for every coefficient ring, but its supplier gives it over `ℤ` only

**Location.** Line 447: "the composite is the identity on `groupCohomology` for every `A : Rep R G`". The ring `R` is never defined.

**Witness.** `TauCetiRoadmap/AlgebraicTopology/README.md` line 2562, at this head, supplies the bar-model comparison only "for every `A : Rep ℤ π`". With `R = 𝔽₂` and `G = ℤ/2`, the input is missing.

**Repair.** Write `A : Rep ℤ G` at line 447. Otherwise, request "every commutative ring `k`" from AlgebraicTopology 8.8b under `## Exact supplier contracts`.

## R10 (P3) — Two files outside the pull request's folders are edited, and the gate fails

**Location.** `Completed/ArithmeticDirichletSeries/README.md` (1 line) and `TauCetiRoadmap/SymplecticGeometry/README.md` (3 lines).

**Witness.** The worker's gate at df0367f reads `outside-folder=2 … FAIL`. The brief's `git diff --stat origin/main...HEAD`, outside the 17 named folders, lists exactly these two files: 4 insertions and 4 deletions.

**Repair.** Move both edits to a pull request of their own, or name both folders as this pull request's own.

## R11 (P3) — Other open pull requests change this folder with differing heads, and the description is out of date

**Location.** The description's merge order reads "#1101 → #1807 → this pull request … #1808 is independent of this pull request". Its bullet reads "Stage 8.8b now states only the bar model's own normalized pointed interface".

**Witness.**
- `roadmaps show ClassifyingSpaces --pr N` gives 304 lines (#1187), 1,146 (#1807), 1,057 (#1808) and 539 (#1854).
- `scratch/overlaps.md` reports that #1808 conflicts in both of this folder's files, and #1187 in `Suggested.lean`.
- AlgebraicTopology README lines 2487–2549 show that 8.8b owns 1B.9.

**Repair.** In the description:
1. Say which revision of this folder wins, and in what order it stands against #1807, #1808 and #1187.
2. Rewrite the 8.8b bullet to say that 8.8b owns 1B.9 and the bar interface.
3. State that the revisions at #1807 and #1808 drop their 1B.9 layer.

## R12 (P3) — The killing construction is cited from AlgebraicTopology 8.8c, which says it is pinned

**Location.**
- Lines 64–67.
- Lines 101–104: "(its Stage 8 item 8c)".
- Item 8, lines 268–273: "owned by AlgebraicTopology Stage 8 item 8c and is consumed here".
- The Ordering paragraph, lines 493–494.

**Claim.** AlgebraicTopology README lines 2607–2617 use the pinned `TauCeti.killHomotopyGroups` and say "The limit's homotopy groups are those pinned theorems, not a target here." The section is therefore cited for a statement it does not make.

**Witness.** The pinned declarations are in `Homotopy/KillHomotopyGroups.lean`: `killHomotopyGroups` at line 169, and further declarations at lines 260, 269, 320, 358 and 400. The probe `isEilenbergMacLaneSpaceOne_killHomotopyGroups (TopCat.of (PresentationComplex R)) (PresentationComplex.basepoint R)` elaborates at this head. It is items 8–10 for any presentation.

**Repair.**
1. Cite these six declarations, by file, in a `From Tau Ceti` contract.
2. Delete the 8.8c attribution at the four places above.
3. The CW structure on the union is `killHomotopyGroupsCWComplex`. Its hypothesis "no cells above dimension `n`" is discharged for `n = 2` by `PresentationComplex.isEmpty_cell`.

## Previous findings

- R01 — not repaired: lines 369–370 still read "for the join of the trivial group, every rank is one."
- R02 — not repaired: line 24 still reads "Suggested home: `TauCeti/AlgebraicTopology/ClassifyingSpace/`"; items 1–19 and the Inventory, lines 112–142, are unchanged.
- R03 — not repaired: item 11 and `Suggested.lean` lines 76–84 still state 1B.9; item 14 ¶2 still builds `c_G`; nothing cites AlgebraicTopology 8.8b.
- R04 — not repaired: `Suggested.lean` lines 31–33 still read "is itself a construction of the roadmap."
- R05 — not repaired: lines 54 and 62 remain, and both still close by one term at this head.
- R06 — not repaired: `Suggested.lean` line 78 still reads `[PathConnectedSpace X] (x : X)`, with no vertex hypothesis; item 12 still cites (11), not 8.8b.
- R07 — not repaired: line 152 still reads "Segal 1968, §2"; line 537 still reads "Section 2."
- R08 — not repaired: line 257 still reads "`S = ∅`: a point, with trivial fundamental group."; the locators and the house shape are still absent.
- R09 — not repaired: line 447 still reads "for every `A : Rep R G`".
- R10 — not repaired: the gate at df0367f lists the same two files.
- R11 — not repaired: the description still says "#1808 is independent of this pull request."
- R12 — not repaired: lines 269–271 still read "owned by AlgebraicTopology Stage 8 item 8c and is consumed here".

## Verified sound

**What changed.** `git log 56715a5..HEAD` has seven commits: AlgebraicCurves, LocalPurity, ReductiveGroups, BanachSpaceTheory, AlgebraicTopology (b9f2c11b), BordismFormalGroups and CharacteristicClasses.
- AlgebraicCurves, BanachSpaceTheory, BordismFormalGroups, LocalPurity and ReductiveGroups never mention ClassifyingSpaces: grep finds nothing.
- CharacteristicClasses cites ClassifyingSpaces at README lines 54, 442–446, 717 and 1205, for the weak-topology countable join of a discrete group. Stage 1 provides that, so the citation resolves (see R02 repair item 5).
- I read the whole AlgebraicTopology diff (README +66/−8, `Suggested.lean` +5/−2). It adds:
  - the pinned skeletal theorems to the inventory (lines 396–399 and 455–464);
  - the 8.8b uniqueness route and the non-0-cell reduction (lines 2495–2537);
  - a Check (lines 3020–3028).

  No section this folder cites is renumbered.

**Gate.**
- The worker's gate at df0367f has every counter at 0, `build=0` included, except `outside-folder=2` (R10).
- My own run of `gate … ClassifyingSpaces --base origin/main` has every content counter at 0. It reports `outside-folder=35` because it also counts the 16 other named folders. The only files outside those folders are the two of R10.

**Dependency check**, verbatim: `depcheck: 239 roadmaps, 2325 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. All suppliers are on main and in `ORDER.txt`: AlgebraicTopology, GeometricTopology, ProfiniteCohomology and `Completed/UniversalCovers`.

**Elaboration.**
- `lake env lean …/Suggested.lean` exits 0. It gives six `declaration uses sorry` warnings, at lines 54, 62, 76, 91, 104 and 114, and nothing else.
- `#check @` on all six declarations, in a scratch copy, matches `scratch/signatures.md` and the README:
  - headline 3 carries `[T2Space X] [CWComplex univ] [PathConnectedSpace X]` and `IsAspherical Y y`;
  - headline 4 carries both `T2Space`, both `CWComplex` and both `IsAspherical`;
  - headlines 5 and 6 carry `IsEilenbergMacLaneSpaceOne G X x`, with `k`, `G` and `X` in one universe.

  No binder is lost. Nothing was changed.
- The probe file (R03, R04, R05, R12) exits 0, with no error.

**Padding probe.** I replaced every `sorry` with `first | simp | rfl | infer_instance | aesop`. All six fail: unsolved goals at lines 57, 67 and 84, and "aesop made no progress" at lines 97, 110 and 119. With the pinned `ClassifyingSpace` modules imported, headlines 1 and 2 close by one term (R05).

**Pinned declarations re-opened at this head** (Tau Ceti `TauCeti/AlgebraicTopology/`).
- `ClassifyingSpace/Basic.lean` 73 and 86.
- `ClassifyingSpace/EilenbergMacLane.lean` 104.
- `ClassifyingSpace/PresentationComplex.lean` 117, 238, 288 and 329.
- `ClassifyingSpace/CWComplex.lean` 358 and 365.
- `ClassifyingSpace/Comparison.lean` 287.
- `ClassifyingSpace/Uniqueness.lean` 73.
- `ClassifyingSpace/Homology.lean` 69.
- `ClassifyingSpace/LocalCoefficients.lean` 150.
- `LocalCoefficient/Representation.lean` 80.
- `Singular/Twisted/Basic.lean` 672.
- `EilenbergMacLane/Homotopic.lean` 138 and 220.
- `EilenbergMacLane/Basic.lean` 90.
- `Homotopy/KillHomotopyGroups.lean` 169, 260, 269, 320, 358 and 400.

**Cross-roadmap citations.**
- `roadmaps resolve` reports none unresolved.
- AlgebraicTopology at this head:
  - lines 94–107 (ownership);
  - lines 2469–2474 (`c_G`);
  - lines 2487–2549 (1B.9);
  - line 2562 (`Rep ℤ π`);
  - lines 2607–2626 (the pinned tower);
  - `Suggested.lean` 628–648.
- Stage 1 item 4, Stage 2 item 6, Stage 4 items 1, 3, 5, 7 and 8, and Stage 8 items 3, 5, 8a and 8c all exist.
- FreeGroupsAndLimitGroups on main cites Stage 2 item 7 at lines 40, 2413, 2554 and 2771. That item exists.

**Overlap facts** (`scratch/overlaps.md`, each checked).
- #1187 and #1808 conflict with this folder (R11).
- No id cited here is dropped by an open pull request.
- No id cited here is defined only by an open revision.
- This pull request drops no id.
- The closest roadmaps in vocabulary are revisions of AlgebraicTopology:
  - at #1807, its 8.8b owns 1B.9 (lines 104 and 2549), and so does the ClassifyingSpaces revision at #1807 (line 531);
  - at #1808, the ClassifyingSpaces revision owns 1B.9 (line 516), and its AlgebraicTopology revision does not mention 1B.9;
  - #1652 cites 1B.9 at line 3051, and #1663 at line 2798.

  The second owner is R03.

**Ownership.** `namespace TauCetiRoadmap.ClassifyingSpaces` occurs only in copies of this folder. No fully qualified name is shared, but item 11 and AlgebraicTopology 8.8b are one proposition (R03).

**Seeded sample, "Both models are wanted"** (lines 14–22).
- Milnor's join: `segal-1968` lines 115–127 (§3, p. 107).
- The presentation complex: `hatcher-at` line 2353 (Corollary 1.28, p. 52).
- Uniqueness: line 3897 (Theorem 1B.8, p. 90, for CW complexes).
- Proposition 1B.9: lines 3905–3907 (p. 90, for a connected CW complex).

The locators are correct. The claim "not duplication" is contradicted by the pin (R02). The claim that the nerve comparison "is also a theorem of this roadmap" is contradicted by AlgebraicTopology lines 2469–2474 (R03).

**Adversarial table.** No statement in this folder changed.
- Rows marked (r39) are carried from r39, which carried r33's computations.
- Rows marked (new) are computed at this head for the statements the AlgebraicTopology change touches.

| Statement | Instances tried | Values computed (README side / other side) | Result | Change |
| --- | --- | --- | --- | --- |
| Item 11 vs AT 8.8b (new) | `rfl` between the two propositions at df0367f | elaborates; AT adds "x need not be a 0-cell" | one theorem, two owners | R03 |
| AT 8.8b two-0-cell Check, recomputed (new) | `S¹`, 0-cells `x = 1`, `v = −1`; `f = z^k`, `g = z^k·exp(iπ(1−Re z)/2)` | `f(1) = g(1) = 1`; `f(−1) = (−1)^k`, `g(−1) = −(−1)^k`; `deg g = k + 0`; `t`-homotopy fixes `1` | true; tracks at `v` must be chosen | remark |
| Headlines 3 and 4, base point not a vertex (new) | `S¹`, 0-cells `±1`, `x = i`; `φ = ·k` | `z ↦ (−iz)^k`: `i ↦ 1`, degree `k`; the route here (lines 301–305) needs a 0-cell; AT 2523–2537 reduces to one | true; route gap here | R06 |
| Item 14 ¶2 vs AT `c_G` (r39; lines now 2469–2474) | `Z = classifyingSpace S₃` | both build `c_G`, identity on `S₃`, unique | two owners | R03 |
| Items 8–10 vs the pinned tower (r39; re-elaborated) | `S = {a}`, `R = {a²}`: `ℝP²`, cells (1, 1, 1) | `π₁ = ℤ/2` kept; `π_k = 0` for `k ≥ 2`; CW by `isEmpty_cell` | pinned; AT 8.8c disclaims | R12 |
| Headline 1, CW `K(G,1)` (r39; re-elaborated) | `G = 1`; `ℤ`; `ℚ` | a point; `S¹` with cells (1, 1); Milnor model | true; one term | R05 |
| Headline 2, dim ≤ 2 (r39; re-elaborated) | `ℤ/2`; `G = 1`; bound ≤ 1 | `ℝP²`; disk; a 1-complex has free `π₁ ≠ ℤ/2` | true, sharp; one term | R05 |
| Headline 3 (r39) | `S¹ → S¹`, `φ = ·2`; `S²`, id vs const | `z ↦ z²`; trivial on `π₁ = 1`, degrees 1 vs 0 | true; asphericity needed | R03 |
| Headline 4 (r39) | `S¹`, `e = −1`; point vs Warsaw circle | `F = z̄`, `F(1) = 1`, `F_* = −1`; Warsaw excluded by `CWComplex` | true | R06 |
| Headline 5 (r39) | `S¹`, `k = ℤ`; `ℝP^∞`, `ℤ` and `𝔽₂` | `H₀ = H₁ = ℤ`, `H₂ = 0`; `H₁ = ℤ/2`, `H₂ = 0`; `𝔽₂` in every degree | true | none |
| Headline 5, negative control (r39) | `S² ∨ S¹`, `G = ℤ` | `H₂ = ℤ` vs `0` | hypothesis present | none |
| Headline 6 (r39) | `S¹`, `ℝP^∞`, `k = ℤ` | `H⁰ = H¹ = ℤ`; `H¹ = 0`, `H² = ℤ/2` | true | none |
| Local-coefficient comparison (r39; re-elaborated) | `probeLocalHom`; `S¹`, `t ↦ u ≠ 1` | elaborates; `H₀ = k/(u−1) = 0`, `H₁ = ker(u−1) = 0` | statable, absent | R04 |
| Item 5 direction (r39) | `S₃`, `s = (12)`, `t = (23)` | `m(ℓ_s ℓ_t) = ts`; `γ ↦ m(γ)⁻¹` gives `st` | agrees with pin | none |
| Item 5 sign (r39) | `G = ℤ`, lift ends at `(0, 1)` | `m = 1`, image `−1` | true | none |
| Item 1 Checks (r39) | `G = 1`; `ℤ/2`; empty family | infinite simplex; `{(0,0),(0,1)}` not a face, `{(0,0),(1,1)}` a face; empty | true | none |
| Item 7 Checks (r39) | `R = ∅`; `R = {aⁿ}`; `S = ∅`, `R = {1}` | `FreeGroup S`; `ℤ/n`; `S²`, not a point | last Check loose | R08 |
| Item 13 rank Check (r39) | `G = 1`, degree 0 | Check: 1; actual `|ℕ|`; item 18: `ℤ^(ℕ)` | false | R01 |
| Item 13 circle Check (r39) | `ℤ` on `ℝ` over one-vertex `S¹` | `∂(1-cell) = t − 1` | true | none |
| Item 16 Check (r39) | `G = ℤ` | `ℤ[t^±] →(t−1) ℤ[t^±] →ε ℤ` exact | true | none |
| Item 18 Checks (r39) | `G = 1`, degree 0 | `ℤ^(ℕ)` vs `ℤ` | true | none |
| Item 17 ¶2 coefficients (r39; AT line 2562) | `R = 𝔽₂`, `G = ℤ/2` | AT supplies only `Rep ℤ π` | input missing | R09 |

**Remarks on untouched text** (not findings).
- Item 11's uniqueness route (lines 304–305) works "relative to `X × {0, 1} ∪ {x} × [0, 1]`" and does not say how the tracks at other 0-cells are chosen. AlgebraicTopology's new Check (lines 3020–3028) shows that the choice matters. R03's repair removes the route.
- The docstring's "no notion of a cellular group action" (lines 26–28) sits beside the pinned `instMulActionCellUniversalGSpace` (`ClassifyingSpace/CWComplex.lean` 281). R02 covers it.

## Not verifiable

- Milnor (1956): settled as uncertified, so it is cited by locator only. I read `segal-1968` lines 115–127 instead.
- Brown, *Cohomology of Groups*, §I.4 and Chapters I–III: settled as uncertified (items 13, 16 and 17).
- tom Dieck, *Transformation Groups*, §II.1: settled as uncertified (item 13).
- Schwamberger–Vogt (2009), §2: settled as uncertified (the Warsaw circle, item 12).

## Source issues

- **Gap** in hatcher-at at Proposition 1B.9, printed pp. 90–91: the statement allows any base point of the CW complex, but the proof handles only a base point that is a 0-cell (one 0-cell, or a maximal tree deformation-retracted onto it); it should require a 0-cell base point or invoke the homotopy extension property of the base point; affects the proof.
