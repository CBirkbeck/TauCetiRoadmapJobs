# Review of ClassifyingSpaces (pull request #1807 at 806b373)

**Verdict:** needs changes

## R01 (P2) — The nerve-target case of Hatcher 1B.9 still has two owners (carried from r61 R01)

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md:82–84`: "is owned here, as items 1.1 and 1.2, for every aspherical target and every base point. The bijection `[X, Bπ]_* ≃ Hom(π₁(X), π)` of that roadmap's item 8.8, for its nerve model `Bπ`, is the case of items 1.1 and 1.2".

**Claim.** The repair removed the false claim that AlgebraicTopology 8.8b consumes Layer 1, and the duplicate Lean theorem is gone. AlgebraicTopology 8.8 still plans its own proof of the case this README says it owns, so one result still has two owners.

**Witness.** This head's `AlgebraicTopology/README.md:4264–4266`: "the generic CW/cover proof is supplied only here. For each connected pointed CW complex X prove `[X,Bπ]_*≃Hom(π₁X,π)` … (Hatcher, Proposition 1B.9, p.90)". Line 149 says of this roadmap "nothing of it is consumed here". The *Needs:* line 4232 names none of it.

**Repair.** Edit this pull request's `AlgebraicTopology/README.md`. This README needs no change.
- Lines 4264–4265: replace "the generic CW/cover proof is supplied only here. For each connected pointed CW complex X prove `[X,Bπ]_*≃Hom(π₁X,π)`" with "the generic CW/cover proof of the bar model is supplied only here. For each connected pointed Hausdorff CW complex X obtain `[X,Bπ]_*≃Hom(π₁X,π)` from ClassifyingSpaces Layer 1, items 1.1 and 1.2, with target Bπ (aspherical by 8.8a), composed with 8.8a's identification π₁(Bπ)≃π". Keep the conjugation-orbit description and the componentwise treatment.
- Line 4232 (*Needs:*): append "; ClassifyingSpaces Layer 1, items 1.1 and 1.2, for the pointed classification".
- Lines 148–149: replace "and nothing of it is consumed here" with "and Layer 8.8 consumes its items 1.1 and 1.2 for the pointed classification of maps into Bπ, and nothing else of it".

Checked against the refuting instance:
- After the repair, Hatcher 1B.9 has one owner, items 1.1–1.2 here. `roadmaps grep --fixed 'HomotopicRel f g {x}'` already returns only `ClassifyingSpaces/Suggested.lean:92` in #1807.
- This README names nothing of AlgebraicTopology as a supplier (lines 86–87, and every *Needs:* line). The new AlgebraicTopology → ClassifyingSpaces edge therefore closes no cycle.
- CharacteristicClasses (lines 1033–1036) still cites AlgebraicTopology 8.8's bijection. That citation stays valid.

## Previous findings

- R01 — partly repaired: lines 80–87 no longer say that 8.8b consumes Layer 1, and the duplicate of headline 1 in `AlgebraicTopology/Suggested.lean` is gone. `AlgebraicTopology/README.md:4264–4266` still proves `[X,Bπ]_*≃Hom(π₁X,π)` itself. Carried as R01.

## Verified sound

| Statement | Instance | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| 1B.9 owned here for every aspherical target (lines 80–83); headline 1 | `X = S¹`, `x = 1`, `Y` = Warsaw circle (path-connected, all `π_n = 0`, not CW) | `Hom(ℤ, 1)`: 1 element; `[S¹, W]_*`: 1 class (`π₁(W) = 1`) | holds; the general target is covered | none |
| Same, every base point | `X = S¹` with one 0-cell at `1`, `x = −1`, `Y = S¹`, `φ = id` | `f = id`, `f(−1) = −1`, degree 1; any `g` with `g(−1) = −1` inducing `id` has degree 1, homotopic to `id` rel `{−1}` | holds | none |
| AT 8.8 bijection is the case `Y = Bπ` (lines 83–86) | `π = S₃`, `X = S¹` | `|Hom(ℤ, S₃)| = 6`; `[S¹, BS₃]_* = π₁(BS₃) = S₃`: 6; unpointed: 3 conjugacy classes on both sides | holds | none |
| Same | `π = ℤ/2`, `X = RP²` | `|Hom(ℤ/2, ℤ/2)| = 2`; `[RP², RP^∞]_* = H¹(RP²; ℤ/2)`: 2 | holds | none |
| Single owner of the `Bπ` case | CS 80–86 vs AT head 4232, 4264–4266, 149 | CS: items 1.1–1.2 cover target `Bπ`; AT 8.8 inputs: {§4.7, §6.1, nerve, Tau Ceti}, proves it itself | two owners | R01 |
| "Consumes nothing from AT" (lines 86–87) | every *Needs:* line, supplier contracts | AT named in *Needs:*: 0 times; contracts: *From Mathlib*, *From Tau Ceti* only; AT mentions at lines 77, 84–86, 1198, none as supplier | holds | none |
| Downstream bullet, CC C1.1b (lines 1192–1196) | `G = ℤ/2` | join of `N` copies of `S⁰` is `S^(N−1)` (`π_(N−1) = ℤ ≠ 0`); countable join `S^∞`, orbit space `RP^∞`; pin `CountableJoin.lean:40` "weak topology"; CC 564–566 "weak-topology model" | holds | none |
| Downstream bullet, `RP^∞` through AT 8.8 (lines 1197–1199) | CC C1.5a | CC 1033–1036 cites AT8.8's bijection; CC 205 cites AT8.8's bar model of `ℤ/2`; citations of this roadmap in C1.5a: 0 | holds | none |

The rows for the untouched statements (headlines 2–4, Layers 1–2 Checks, conventions) stand as in the previous review, of `e65eef3`.

- **Gate.** The worker's gate at 806b373 passes every check, `build=0` included. My own run prints 0 for every content counter. Its only failure, `outside-folder=23`, counts the 23 files of the 12 sibling folders that this pull request owns. With those 12 folders and this one excluded, `git diff --stat origin/main...HEAD` is empty (exit 0).
- **Dependency check.** `depcheck: 237 roadmaps, 2141 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean …/Suggested.lean` exits 0 in 4 s; the only warnings are four `declaration uses 'sorry'`, at lines 84, 102, 123 and 138.
  - In a scratch copy, `#check @` of all four headlines gives the types in `signatures.md`; no binder was lost.
  - `Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are unchanged since e65eef3.
- **Source locators: 2.** Hatcher, Theorem 1B.8 and Proposition 1B.9, printed p. 90: `hatcher-at` lines 3884, 3897 and 3905–3907. Items 2.1–2.3 of the sample are untouched by the diff and stand as verified in r61.
- **Library declarations opened at the pin: 3.** `ClassifyingSpace/CountableJoin.lean:40` (the weak topology), `ClassifyingSpace/Basic.lean:73` (the orbit space), and `EilenbergMacLane/Basic.lean:59` (`IsAspherical`: path-connected and `π_(n+2)` trivial).
- **Cross-roadmap citations resolved: 6.** At this head: AT §8.8 (4226), 8.8a (150), 8.8b (4251), CC C1.1b (471, 564–566), C1.5a (1020–1036) and CC line 205. `citations.md` lists none unresolved.
- **Overlaps.** #1808 and #1854 change this folder, in the order given in the description. `git merge-tree HEAD origin/main` is clean. #1854's head gives 1B.9 to AlgebraicTopology (`ClassifyingSpaces/README.md:88`, `AlgebraicTopology/Suggested.lean:639`); it rebases after this pull request.
- **Remarks on untouched text (no change requested).**
  - FreeGroupsAndLimitGroups, line 29 on main, cites the anchor `#stage-2-the-cellular-model`, which the *Stage and item numbers* list maps by name.
  - CharacteristicClasses line 189 cites this roadmap for the pinned join model; that belongs to CharacteristicClasses' own review.

## Not verifiable

- `brown-cohomology`, Chapter III §1 (items 2.1–2.3): uncertified, no legal text; the diff does not touch it.
- `schwamberger-vogt-2009`, §2 (the Warsaw circle): uncertified; the diff does not touch it.
- `milnor-1956`, §3: uncertified; cited only for the pinned model, which the pinned docstring `CountableJoin.lean:40` describes.

## Source issues

- none
