# Review of ClassifyingSpaces (pull request #1854 at c07dda7)

**Verdict:** needs changes

This is an incremental re-review. The previous review, r29, read c9c60d0. `git diff --stat c9c60d0 HEAD -- TauCetiRoadmap/ClassifyingSpaces TauCetiRoadmap/AlgebraicTopology` is empty, so neither this folder nor its supplier folder in this pull request has changed. The only commit since c9c60d0, c07dda7, touches `TauCetiRoadmap/CharacteristicClasses/README.md` and `Suggested.lean`.

None of r29's eleven findings is repaired, so each is written again below, with the same number. I re-checked every witness at this head: the line numbers, the AlgebraicTopology passages, the pinned declarations, the scratch probes, the gate and the other open heads. Two witnesses were updated: #1807's revision of this folder now has 970 lines (R11), and the AlgebraicTopology line for `Rep ℤ π` is 2466 (R09).

The pins are unchanged from main: Tau Ceti `2fd255d99`, Mathlib `1b1ccf4b`.

## R01 (P1) — Item 13 has a false Check: the join of the trivial group has infinitely many cells in each degree, not one

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 369–370: "The free `ℤ[G]`-module of `n`-chains of `E` has rank the number of `n`-cells of `B`: for the join of the trivial group, every rank is one."

**Claim.** For `G = 1`, `E = B` is the countable join of one-point sets. Item 1's own Check (lines 160–161) says this is the infinite simplex on the vertices `{(i, 1) : i ∈ ℕ}`. Its `n`-cells are the `(n+1)`-element subsets of `ℕ`, so every rank is countably infinite.

**Witness.** In degree 0 the rank is `|ℕ|`. Item 18's Check (lines 477–478) says "the join has `ℤ^(ℕ)` and the standard complex `ℤ`", which contradicts the item 13 Check.

**Repair.** Replace the clause after the colon with: "for the trivial group the rank in degree `n` is the number of `(n+1)`-element subsets of `ℕ`, already `ℤ^(ℕ)` in degree 0 (item 18)". Alternatively, use the finite example "for `ℤ` acting on `ℝ` over the one-vertex circle, every rank is one in degrees 0 and 1". Tested: both versions agree with item 18's degree-0 value.

## R02 (P2) — Stages 1–4 plan, as targets, what the pinned Tau Ceti already proves in the roadmap's own suggested home

**Location.**
- Line 24: "Suggested home: `TauCeti/AlgebraicTopology/ClassifyingSpace/`".
- Lines 67–72: "It owns the two models (Stages 1 and 2), … the transfer of CW structures … the chain-level comparison …".
- The Inventory (lines 134–138), which lists only the universal cover, `IsAspherical`, `IsEilenbergMacLaneSpaceOne` and recognition.
- Items 1–19 (lines 150–487).

**Claim.** The suggested home exists at the pin. It holds 30 files, and `grep -rln sorry` over it finds nothing. It proves the constructions and theorems that the README states as targets of this roadmap. The principles require that what exists at the pins is cited by exact name and file, not planned again.

**Witness.** All paths are under `TauCeti/AlgebraicTopology/ClassifyingSpace/` at the pin.
- `Basic.lean` 73: `classifyingSpace`.
- `EilenbergMacLane.lean` 67 and 104: `classifyingSpaceFundamentalGroupMulEquiv` and `isEilenbergMacLaneSpaceOne_classifyingSpace`.
- `Comparison.lean` 211 and 287: `cellularHomotopyEquivClassifyingSpace` and `exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`.
- `Homology.lean` 69 and `Cohomology.lean` 89.
- `LocalCoefficients.lean` 150.

r29 R02 lists the full map, 71 names in 23 files. I reopened the names above, and `#check` elaborates them at this head.

**Repair.**
1. Rewrite `## Ownership and dependencies` and the Inventory as a `From Tau Ceti` contract that names r29's declarations by file.
2. Delete items 1–10, 13, 14 ¶1, 15, 16, 17 ¶1, 18 and 19 as targets.
3. Keep the `γ ↦ m(γ)⁻¹` convention and its `S₃`/`ℤ` Checks under `## Conventions`, pinned by `classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff`.
4. Keep as targets only what the pin lacks:
   - item 11 existence for an arbitrary path-connected Hausdorff CW source;
   - the pointed form of item 12;
   - item 17 for an arbitrary Hausdorff CW `K(G, 1)`, including local coefficients (R04);
   - whatever of items 14 ¶2 and 17 ¶2 survives R03.

## R03 (P2) — Three objects have two owners: this roadmap and this pull request's own AlgebraicTopology folder

**Location.** Here: lines 20–22 ("its comparison with the two models here, normalised to be the identity on `G`, is also a theorem of this roadmap"), lines 106–107, item 11 (lines 295–306), item 14 ¶2 (lines 376–386) and items 7–10.

In `TauCetiRoadmap/AlgebraicTopology/README.md` at this head:
- line 2435: "For a Hausdorff CW K(G,1) Z with a chosen identification κ_Z:π₁Z≅G, construct … the pointed map c_G:Z→Bπ";
- line 2454: "pointed CW complex X prove `[X,Bπ]_*≃Hom(π₁X,π)`";
- line 2510: "the group-presentation 2-complex, followed by killing successive higher homotopy groups".

**Claim.**
- **The comparison `c_G`.** AlgebraicTopology 8.8b builds the normalised pointed equivalence `c_G` for *every* Hausdorff CW `K(G, 1)`, which includes both models here. Item 14 ¶2 builds the same map with the same normalisation and uniqueness. AlgebraicTopology lines 2446–2450 say that ClassifyingSpaces owns it, and line 2435 builds it anyway.
- **Maps into `Bπ`.** AlgebraicTopology 8.8 proves the `Y = Bπ` case of item 11, and it constructs `c_G` through that case.
- **The presentation model.** AlgebraicTopology 8.8c builds the presentation-complex tower, and so do items 7–10.

**Witness.** Take `Z = TauCeti.classifyingSpace S₃` with `κ_Z = classifyingSpaceFundamentalGroupMulEquiv`. AlgebraicTopology line 2435 produces `Z → Bπ`, the identity on `S₃` and unique up to pointed homotopy. Item 14 ¶2 asks for the inverse of the same map.

**Repair.** Give each object one owner, upstream.
1. Item 14 ¶2 consumes 8.8b's `c_G` at the two pinned models, and the ownership sentences at lines 20–22 and 106–107 go. Otherwise, narrow AlgebraicTopology line 2435 to the bar model's own identification; that edit belongs in that folder.
2. Move the general item 11 (any aspherical target) into AlgebraicTopology 8.8 and cite it here.
3. Cite `TauCeti.PresentationComplex`, `TauCeti.killHomotopyGroups` and `TauCeti.cellularClassifyingSpace` for items 7–10.

## R04 (P2) — The module docstring calls the local-coefficient comparison unstatable, but it elaborates at the pin

**Location.** `Suggested.lean` lines 31–33: "the system attached to a `G`-module through a chosen `π₁(X, x) ≃* G` is itself a construction of the roadmap". Scope item 4 (lines 45–47) makes this comparison part of the completion criterion.

**Claim.** `TauCeti.LocalCoefficientSystem.ofRepresentation` (`LocalCoefficient/Representation.lean` 80) attaches a local system to any representation of `π₁(X, x)`. Composing the representation with `Ψ` is one term, so the headline is statable at the pins and missing from `Suggested.lean`.

**Witness.** I re-ran the probe at this head: `probeLocalHom` in my scratch probe elaborates with only a `sorry` warning. Its conclusion is `Nonempty (groupHomology A n ≅ LocalCoefficientSystem.twistedHomology (LocalCoefficientSystem.ofRepresentation (X := TopCat.of X) x (A.ρ.comp Ψ.toMonoidHom)) n)`, under `[T2Space X] [CWComplex univ] [PathConnectedSpace X] (IsAspherical X x) (Ψ : π₁ ≃* G) (A : Rep k G)`.

**Repair.**
1. Add `nonempty_twistedHomology_iso_groupHomology` and its cohomology analogue `nonempty_twistedCohomology_iso_groupCohomology` to `Suggested.lean`. The cohomology target is `groupCohomology ((Rep.ihom A).obj (Rep.trivial k G N)) n`, which is the form of `classifyingSpaceTwistedCohomologyIsoGroupCohomology`.
2. Delete the docstring bullet at lines 31–33.
3. Restate item 17's cohomology clause in that form.

Asphericity must stay: for `X = S² ∨ S¹` with `A = ℤ`, `H₂` is `ℤ` on the topological side and `0` on the group side.

## R05 (P3) — The first two headlines of `Suggested.lean` follow in one term from the pin

**Location.** `Suggested.lean` lines 54–57 (`exists_cwComplex_isEilenbergMacLaneSpaceOne`) and 62–67 (`exists_cwComplex_dim_le_two_fundamentalGroup_mulEquiv`).

**Witness.** I re-ran both terms at this head in my scratch probe, and both elaborate without error.
- `probe1` is `⟨classifyingSpace G, inferInstance, inferInstance, inferInstance, classifyingSpaceBasepoint G, isEilenbergMacLaneSpaceOne_classifyingSpace G⟩`.
- `probe2` builds `P` from `FreeGroup.lift id` and `Subgroup.normalClosure_eq_self`, then closes with `⟨PresentationComplex P.rel, …, fun _ hn ↦ PresentationComplex.isEmpty_cell P.rel hn, ⟨(PresentationComplex.fundamentalGroupMulEquiv P.rel).trans P.presentedGroupEquiv⟩⟩`.

**Repair.** Delete both theorems from `Suggested.lean`. Name the pinned theorems in the module docstring, and remove the two backticked names from README lines 53–54, 246 and 288.

## R06 (P3) — The base point is arbitrary in items 11–12 and their headlines, but the cited proof treats only a 0-cell; item 12 does not say its headline is pointed

**Location.**
- README item 11, lines 295–306: "with base point `x`", and the route "a one-cell goes to a loop representing the image of its class".
- `Suggested.lean` lines 76–84 and 91–97: `(x : X)`, with no vertex hypothesis.
- Item 12, lines 310–314, never says the headline is pointed.

**Witness.** Hatcher's proof treats only a base point that is a 0-cell: `hatcher-at` line 3912 (the single 0-cell case) and lines 3938–3942 (a maximal tree sent to `y₀`), pp. 90–91. Take `S¹` with one vertex at `1` and base point `−1`: the route's first step does not apply. The pin's `homotopicRel_singleton_of_mapOfEq_eq_of_cwComplex` itself assumes `skeletonLT univ 1 = {x₀}`.

**Repair.** Choose one:
- add `x ∈ Topology.RelCWComplex.skeletonLT (Set.univ : Set X) 1` to both headlines and "with base point a vertex" to items 11–12;
- or add the well-pointedness of `(X, {x})`, with an owner, to item 11's route.

In item 12, add "for Hausdorff CW complexes the equivalence can be taken pointed, `F(x) = y`, inducing `e`".

## R07 (P3) — Segal's remark on Milnor's join is in §3, not §2

**Location.** README line 152 ("Segal 1968, §2, the remark comparing `BG` with Milnor's join") and line 537 ("Section 2").

**Witness.** In `segal-1968`, §2 ("Categories and classifying spaces") opens at line 64. §3 ("The classifying space of a topological group") opens at line 95, on p. 107 (line 94). The comparison with Milnor's `(G*G*…)/G` is at lines 115–127, inside §3.

**Repair.** Replace "§2" with "§3, p. 107" at line 152, and "Section 2" with "Section 3" at line 537.

## R08 (P3) — Missing locators and Checks, a loose Check, and the README shape

**Location and witness.**
- **No locator** on the theorems of items 4, 5, 6, 10, 14, 15, 17 and 18. For item 17, Hatcher §2.2 p. 148 and §3.H pp. 328–329 apply (`hatcher-at` lines 6471–6479 and 14326–14412).
- **Fewer than three Checks**: items 3, 6 and 9 have none; items 14, 16 and 18 have two each.
- **Item 7's Check at line 257**, "`S = ∅`: a point", is loose. With `R = {1}` the 2-cell is attached along the constant loop and the complex is `S²`.
- **Shape.** There is no `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k` with `### Examples` and `### Dependencies`, or `## Downstream consumers`.

**Repair.**
1. Give each target that remains after R02 a locator and three Checks.
2. Write the item 7 Check as "`S = ∅`, `R = ∅`: a point; `R = {1}`: the 2-sphere, also simply connected".
3. Restructure under the house headings.

## R09 (P3) — Item 17 ¶2 asserts the three-model comparison for every coefficient ring, but its supplier gives it over `ℤ` only

**Location.** README line 447: "the composite is the identity on `groupCohomology` for every `A : Rep R G`". The ring `R` is not defined anywhere in this README.

**Witness.** `TauCetiRoadmap/AlgebraicTopology/README.md` line 2466 supplies the bar-model comparison "for every `A : Rep ℤ π`". With `R = 𝔽₂` and `G = ℤ/2`, no AlgebraicTopology item supplies the input.

**Repair.** Write `A : Rep ℤ G` at line 447. If arbitrary rings are wanted, request "every commutative ring `k`" from AlgebraicTopology 8.8 under `## Exact supplier contracts`.

## R10 (P3) — Two files outside the pull request's folders are edited, and the gate fails

**Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` lines 76–78.

**Witness.** The worker's gate at c07dda7 reads `outside-folder=2 … FAIL` and lists exactly these two files. `git diff --stat origin/main...HEAD` outside the 17 named folders shows these two files, with 4 insertions and 4 deletions.

**Repair.** Move both edits to a pull request of their own, or name both folders as this pull request's own.

## R11 (P3) — Other open pull requests change this folder with conflicting heads, and the description calls one of them independent

**Location.** The description's merge-order paragraph: "#1101 → #1807 → this pull request … #1808 is independent of this pull request."

**Witness.**
- `scratch/overlaps.md` reports that #1808 and #1854 conflict in `ClassifyingSpaces/README.md` and `Suggested.lean`, and that #1187 conflicts in `ClassifyingSpaces/Suggested.lean`.
- `roadmaps show ClassifyingSpaces --pr N` gives README lengths of 304 lines (#1187), 970 (#1807), 1,057 (#1808) and 539 (#1854).
- This folder is commit 113b939 (an ancestor of HEAD), which is in #1807's history. #1807's head now carries a later revision.

**Repair.** Say in the description which revision of this folder wins and in what order it stands against #1808 and #1187. For example: drop this folder's changes from this pull request, rebase #1808 on #1807, and re-elaborate `Suggested.lean` on #1187's pin.

## Previous findings

- R01 — not repaired: line 369–370 still reads "for the join of the trivial group, every rank is one."
- R02 — not repaired: line 24 "Suggested home: `TauCeti/AlgebraicTopology/ClassifyingSpace/`"; items 1–19 unchanged; the Inventory (lines 134–138) still omits the pinned `ClassifyingSpace/` directory.
- R03 — not repaired: README lines 20–22 "is also a theorem of this roadmap"; AlgebraicTopology line 2435 "For a Hausdorff CW K(G,1) Z … construct … the pointed map c_G:Z→Bπ" unchanged.
- R04 — not repaired: `Suggested.lean` lines 31–33 "the system attached to a `G`-module through a chosen `π₁(X, x) ≃* G` is itself a construction of the roadmap."
- R05 — not repaired: `exists_cwComplex_isEilenbergMacLaneSpaceOne` (line 54) and `exists_cwComplex_dim_le_two_fundamentalGroup_mulEquiv` (line 62) remain; both still close by one term.
- R06 — not repaired: `Suggested.lean` line 78 `[PathConnectedSpace X] (x : X)` with no vertex hypothesis; README item 12 silent on pointedness.
- R07 — not repaired: line 152 "Segal 1968, §2, the remark comparing `BG` with Milnor's join"; line 537 "Section 2."
- R08 — not repaired: line 257 "`S = ∅`: a point, with trivial fundamental group."; items 4–6, 10, 14, 15, 17, 18 still lack locators; house shape absent.
- R09 — not repaired: line 447 "the composite is the identity on `groupCohomology` for every `A : Rep R G`".
- R10 — not repaired: the gate at c07dda7 still lists `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.
- R11 — not repaired: the description still reads "#1808 is independent of this pull request."

## Verified sound

**What changed.**
- `git diff c9c60d0 HEAD -- TauCetiRoadmap/ClassifyingSpaces TauCetiRoadmap/AlgebraicTopology` is empty.
- The only file changes are in `TauCetiRoadmap/CharacteristicClasses/`, which has a review of its own. I checked its two citations of this roadmap:
  - README line 159 ("treats discrete groups with the weak-topology countable join");
  - README line 424 ("compare the weak-topology model of ClassifyingSpaces").

  Both agree with Stage 1 here, and neither cites a section id of this roadmap.

**Gate.**
- The worker's gate at c07dda7 has every counter at 0, `build=0` included, except `outside-folder=2` (R10).
- My own run of `gate … ClassifyingSpaces --base origin/main` has every content counter at 0 (`set_option`, `sorry-data`, `imports`, `statement-hygiene`, `readme-ids-missing`, `layer-ids`, `target-ids`, `depcheck`, `stray-files`, `source-material`). It reports `outside-folder=33` because it also counts the pull request's 16 other named folders. The two files that are not in a named folder are those of R10.

**Dependency check**, verbatim: `depcheck: 238 roadmaps, 2346 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.**
- `lake env lean …/Suggested.lean` exits 0. It gives six `declaration uses sorry` warnings, at lines 54, 62, 76, 91, 104 and 114, and nothing else.
- The imports are `Mathlib`, `TauCeti.AlgebraicTopology.EilenbergMacLane.Basic` and `TauCeti.AlgebraicTopology.Cohomology.Basic`, and their object files are present.
- I compared the six elaborated types in `scratch/signatures.md`, and `#check @` output on a scratch copy, with the README:
  - headline 3 carries `[T2Space X] [CWComplex univ] [PathConnectedSpace X]` and `IsAspherical Y y`;
  - headline 4 carries both `T2Space`, both `CWComplex` and both `IsAspherical`, and is pointed (R06);
  - headlines 5 and 6 carry `IsEilenbergMacLaneSpaceOne G X x`, with `k`, `G` and `X` in one universe.

  No binder is lost.

**Padding probe.** On a scratch copy with each `sorry` replaced by `first | simp | rfl | infer_instance | aesop`, all six declarations fail: unsolved goals at lines 57, 67 and 84, and "aesop made no progress" at lines 97, 110 and 119. With the pinned `ClassifyingSpace` modules imported, headlines 1 and 2 close by one term (R05). Headline 5 closes by `⟨(classifyingSpaceSingularHomologyIsoGroupHomology k G n).symm⟩` only at `X = classifyingSpace G`, so it is kept.

**Pinned declarations opened and elaborated at this head.**
- `IsAspherical.exists_homotopyEquiv` (`ClassifyingSpace/Uniqueness.lean` 73).
- `classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff` (`EilenbergMacLane.lean` 77). Its conclusion is that the end vertex is `⟨0, g⁻¹⟩`, matching the README's `γ ↦ m(γ)⁻¹`.
- `exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace` (`Comparison.lean` 287). It concludes `LocallyPathConnectedSpace` and `SemilocallySimplyConnectedSpace`.
- `exists_mapOfEq_cellularClassifyingSpace`.
- `homotopicRel_singleton_of_mapOfEq_eq_of_cwComplex`, which assumes `skeletonLT univ 1 = {x₀}`.
- `classifyingSpaceTwistedCohomologyIsoGroupCohomology` (`LocalCoefficients.lean` 150).
- `LocalCoefficientSystem.ofRepresentation` (`LocalCoefficient/Representation.lean` 80).
- `twistedHomology` (`Singular/Twisted/Basic.lean` 672).
- `classifyingSpace` (`Basic.lean` 73).
- `classifyingSpaceSingularHomologyIsoGroupHomology` (`Homology.lean` 69) and `classifyingSpaceSingularCohomologyIsoGroupCohomology` (`Cohomology.lean` 89).

**Cross-roadmap citations.**
- `roadmaps resolve` reports none unresolved.
- AlgebraicTopology at this head:
  - 8.8 (line 2422), the 8.8b `c_G` paragraph (2435), `[X,Bπ]_*` (2454), the ownership sentence (2446–2450) and `Rep ℤ π` (2466);
  - 8.8c's `n = 1` presentation tower (2510).
- CharacteristicClasses lines 159 and 424, as above.

**Overlap facts** (`scratch/overlaps.md`, each checked).
- #1187, #1807 and #1808 change this roadmap (R11). #1807 no longer conflicts with this head in this folder, because 113b939 is in its history.
- No id cited here is dropped by an open pull request.
- No id cited here is defined only by an open revision.
- This pull request drops no id.
- The closest roadmaps are revisions of AlgebraicTopology (#1797, #1808, #1652, #1663, #1807). I compared against this pull request's own AlgebraicTopology folder (R03).

**Ownership.**
- `roadmaps grep -i 'countable join'` finds only consumer notes in GeometricTopology (#1517 line 896, #1791 line 880, #1797) and an unrelated VonNeumannAlgebras line.
- `namespace TauCetiRoadmap.ClassifyingSpaces` occurs only in copies of this folder (main, #1187, #1807, #1808, #1854).

**Seeded sample, "Both models are wanted"** (README lines 14–22). The paragraph has no locator. I re-read its sources:
- Milnor's join: `segal-1968` lines 115–127, §3, p. 107.
- The presentation model: `hatcher-at` line 2353, Corollary 1.28, p. 52.
- Uniqueness: line 3897, Theorem 1B.8, p. 90, for CW complexes.

The claim that building both is "not duplication" is contradicted by the pin (R02). The claim that the nerve comparison "is also a theorem of this roadmap" is contradicted by AlgebraicTopology line 2435 (R03).

**Adversarial table.** No statement changed. The rows are carried from r29, which computed them at c9c60d0. Where noted, I re-ran the computation at this head.

| Statement | Instances tried | Values computed (README side / other side) | Result | Change |
| --- | --- | --- | --- | --- |
| Headline 1, CW `K(G,1)` exists (r29) | `G = 1`; `ℤ`; `ℚ` | a point; `S¹` with cells (1, 1); Milnor model; `probe1` term re-elaborated at this head | true; one term from pin | R05 |
| Headline 2, dim ≤ 2 (r29) | `ℤ/2`; `G = 1`; bound ≤ 1 | `ℝP²` with cells (1, 1, 1); relator `x·x·x⁻¹ = x` gives a disk; a 1-complex has free `π₁` ≠ `ℤ/2`; `probe2` re-elaborated | true, sharp | R05 |
| Headline 3, maps into aspherical (r29) | `X = Y = S¹`, `φ = ·2`; `X = Y = S²`, id vs const | `z ↦ z²`, `1 ↦ 2`; both trivial on `π₁ = 1`, degrees 1 vs 0, not homotopic | true; asphericity needed | none |
| Headline 3, base point not a vertex (r29) | `S¹`, vertex `1`, `x = −1` | true by well-pointedness; route needs a 0-cell (`hatcher-at` 3912, 3938–3942) | route gap | R06 |
| Headline 4, pointed uniqueness (r29) | `S¹`, `e = −1`; point vs Warsaw circle | `F = z ↦ z̄`, `F(1) = 1`, `F_* = −1`; Warsaw circle has trivial `πₙ`, not contractible, excluded by `CWComplex` | true; stronger than pin | R06 |
| Headline 5, homology (r29) | `S¹`, `k = ℤ`; `ℝP^∞`, `k = ℤ`, `𝔽₂` | `H₀ = H₁ = ℤ`, `H₂ = 0` both sides; `H₁ = ℤ/2`, `H₂ = 0` both; `𝔽₂` every degree both | true | none |
| Headline 5, negative control (r29) | `S² ∨ S¹`, `G = ℤ` | `H₂ = ℤ` vs `H₂(ℤ; ℤ) = 0` | hypothesis needed, present | none |
| Headline 6, cohomology (r29) | `S¹`, `ℝP^∞`, `k = ℤ` | `H⁰ = H¹ = ℤ` both; `H¹ = 0`, `H² = ℤ/2` both | true | none |
| Local-coefficient comparison (r29; re-elaborated) | `probeLocalHom`; `S¹`, `A = k` with `t ↦ u ≠ 1`, `k` a field | elaborates at the pin; `H₀ = k/(u−1) = 0`, `H₁ = ker(u−1) = 0` both sides | statable, absent | R04 |
| Item 5 direction (r29) | `S₃`, `s = (12)`, `t = (23)` | `m(ℓ_s ℓ_t) = ts`; `γ ↦ m(γ)⁻¹` gives `st`; the pin: `γ ↦ g` iff end `⟨0, g⁻¹⟩` (re-checked) | agrees with pin | none |
| Item 5 sign (r29) | `G = ℤ`, lift ends at `(0, 1)` | `m = 1`, image `−1` | true | none |
| Item 1 Checks (r29) | `G = 1`; `ℤ/2`; empty family | infinite simplex; `{(0,0),(0,1)}` not a face, `{(0,0),(1,1)}` a face; empty | true | none |
| Item 7 Checks (r29) | `R = ∅`; `R = {aⁿ}`; `S = ∅`, `R = {1}` | `FreeGroup S`; `ℤ/n`; `S²`, not a point | last Check loose | R08 |
| Item 13 rank Check (r29) | `G = 1`, degree 0 | Check: rank 1; actual `|ℕ|`; item 18: `ℤ^(ℕ)` | false | R01 |
| Item 13 circle Check (r29) | `ℤ` on `ℝ` over one-vertex `S¹` | `∂(1-cell) = t − 1` | true | none |
| Item 16 Check (r29) | `G = ℤ` | `ℤ[t^±] →(t−1) ℤ[t^±] →ε ℤ` exact | true | none |
| Item 18 Checks (r29) | `G = 1`, degree 0 | `ℤ^(ℕ)` vs `ℤ`, not iso | true | none |
| Item 14 ¶2 vs AT 8.8b (r29; AT re-read at 2435) | `Z = classifyingSpace S₃` | AT builds `c_G : Z → Bπ`; item 14 builds its inverse | two owners | R03 |
| Item 17 ¶2 coefficients (r29; AT line 2466) | `R = 𝔽₂`, `G = ℤ/2` | AT supplies only `Rep ℤ π` | input missing | R09 |

## Not verifiable

- Milnor, "Construction of universal bundles, II" (1956): settled as uncertified, so it is cited by locator only. I read `segal-1968` lines 115–127 (§3) instead.
- Brown, *Cohomology of Groups*, §I.4 and Chapters I–III: settled as uncertified (items 13, 16 and 17).
- tom Dieck, *Transformation Groups*, §II.1: settled as uncertified (item 13).
- Schwamberger–Vogt, "Dold spaces in homotopy theory", §2: settled as uncertified (the Warsaw circle in item 12).

## Source issues

- **Gap** in hatcher-at at Proposition 1B.9, printed pp. 90–91: the statement allows any base point of the CW complex, but the proof handles only a base point that is a 0-cell (one 0-cell, then a maximal tree sent to the target base point); it should require a 0-cell base point or invoke well-pointedness of the pair; affects the proof.
