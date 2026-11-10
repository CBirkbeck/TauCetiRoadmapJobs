# Review of GlobalQuadraticForms (pull request #1200 at 8fe49f4)

**Verdict:** needs changes

Incremental re-review of the 2 README lines changed since `3219a96` (`Suggested.lean` is unchanged). The previous R03 is repaired and the repair is correct. R01 and R02 are not repaired; neither needs an edit of the folder: R01 needs a merge of main into the branch, R02 a stated order with #1215 and a description of this head. Nothing else stands between this folder and acceptance.

## R01 (P3) — The branch still pins Tau Ceti `358314d`, where 23 declarations the README names do not exist, and main is not merged

Re-raised: "Which pin" (repair report GATE-GlobalQuadraticForms~2). Its reason, that the branch "must take main's manifest" and the job may not touch the manifest, fails: `git diff --stat origin/main...HEAD -- lake-manifest.json lean-toolchain` is empty, so merging `origin/main` takes main's manifest with no manifest edit.

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/README.md:151–154`: "read at the revisions the content repository's manifest records: Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`."

**Claim.** This head's manifest records those revisions, so the declarations the README names exist at the pins.

**Witness.** `lake-manifest.json` at `8fe49f4` pins Tau Ceti `358314d4` and Mathlib `f6090c70`; main (`f8836c4`) pins `2fd255d9` and `1b1ccf4b`. The merge base is still `fa41b37`. `git merge-tree --write-tree HEAD origin/main` reports one conflict, in `Suggested.lean`. The count of 23 absent names is carried from the previous report; this head's change removes a file name only.

**Why P3.** The branch does not change the manifest, so a merge into main uses main's pins, where all 23 names exist with the statements the README gives.

**Repair.**
- Merge `origin/main` into the branch.
- Resolve the single conflict in `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` by keeping this branch's file.
- Rerun the gate.

Tested in earlier rounds: this `Suggested.lean` (unchanged since `9c4d328`) elaborates at main's pins with 8 `sorry` warnings, and its five Tau Ceti imports exist at both pins.

## R02 (P3) — #1215 carries a conflicting copy of this folder, no order is stated, and the description does not describe this head

**Location.** The pull-request description: "Correct the rank-four plain/signed discriminant comparison in both §5.1 … retains its `Completed.NumberFieldArithmetic.Suggested` import."

**Claim.** This pull request can merge independently of #1215, and the text describes this head.

**Witness.** #1215 is at `c1d130b8`; `git merge-tree --write-tree 8fe49f4 c1d130b8` reports conflicts in this folder's `README.md` and `Suggested.lean`. #1215's copy drops `equivalent_of_locallyEquivalent`, which Integral Lattices on main cites (`README.md:477`, `:916`, `:1028`). This head's 5.1 has no rank-four comparison and its `Suggested.lean` imports no roadmap module.

**Repair.** Choose one order and state it in both descriptions:
- **This pull request first** (after R01): #1215 drops its copy of this folder and reapplies only its differences.
- **#1215 first:** this pull request is closed or reduced to what #1215's copy lacks (the 8.4 declaration that Integral Lattices cites).

Either way, rewrite this description so that it describes this head: both files rebuilt on Tau Ceti carriers; nine declarations and no roadmap import; Layers 0–3 and 4.4 resolved by the section map; main's 4.1, 4.5, 5.2–5.4, 7.1 and Layer 9 dropped.

## Previous findings

- R01 — not repaired: `README.md:151–154` is unchanged; the manifest still pins `358314d4`/`f6090c70`; main is not merged. Restated as R01.
- R02 — not repaired: the description is unchanged; #1215 (`c1d130b8`) still conflicts in both files and no order is stated. Restated as R02.
- R03 — repaired: the bullet now reads "Localization (`NumberTheory/QuadraticForm/Global/Localization.lean`, `Operations.lean`, `Discriminant.lean`, `CompletionTower.lean`)" (`README.md:221–222`). The repair introduced no new problem.

## Verified sound

**The changed passage (1), checked at Tau Ceti `2fd255d`.** All 19 declarations the Localization bullet names (`README.md:221–237`) are in the four files it still lists, and none is in `Global/Classification.lean`:
- `Localization.lean`: `unitAtFinitePlace` (:43), `unitAtRealPlace` (:67), `atFinitePlace` (:90), `atRealPlace` (:96), `atComplexEmbedding` (:105), `Nondegenerate.atFinitePlace` (:169), `Nondegenerate.atRealPlace` (:177), `QuadraticMap.Equivalent.atFinitePlace` (:198), `QuadraticMap.Equivalent.atRealPlace` (:207), `atFinitePlaceWeightedSumSquares` (:265), `atRealPlaceWeightedSumSquares` (:278);
- `Operations.lean`: `atFinitePlaceProd` (:41), `atRealPlaceProd` (:53), `atFinitePlace_neg` (:180), `atRealPlace_neg` (:188), `atFinitePlace_smul` (:212), `atRealPlace_smul` (:222);
- `Discriminant.lean`: `discr_atFinitePlace` (:42);
- `CompletionTower.lean`: `IsLocallyIsotropic.baseChange` (:217).

`Classification.lean` declares nine theorems (:87–:226); the only one this bullet ever named, `formClass_atFinitePlace` (:87), is cited nowhere in the README (grep: 0 hits). The four other bullets that cite that file (`README.md:261`, `:267`, `:324`, `:366`) still list it, so no bullet loses a locator.

**Gate and dependency check.**
- **Gate.** The worker's line is all zeros with `build=0`, `OK`. My rerun printed every check at 0 and `OK`, exit 0.
- **No change outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalQuadraticForms'` is empty.
- **Dependency check.** Output: `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. There is no roadmap supplier and no `gap:` contract.

**Lean.**
- **Elaboration.** `lake env lean` on `Suggested.lean` at the branch pins: exit 0, exactly 8 `sorry` warnings (lines 51, 68, 76, 84, 93, 111, 120, 147).
- **Signatures, one-tactic probe, file form.** `Suggested.lean` is unchanged since `9c4d328`; the worker's elaborated signatures of the 9 declarations show no lost binder. The `#check` comparison and the probe (all 8 fail) are carried from the earlier reports.

**Sources: the seeded sample.** None of the fifteen sampled targets (4.1–4.3, 5.1, 5.5, 6.1–6.3, 7.2–7.4, 8.1–8.4) falls in the changed passage, which is a file list of the supplier contract and carries no source locator. Their checks are carried from the previous reports.

**Adversarial table.** The diff changes no statement, definition or convention, so no row is new; every row is carried from the previous report (PRREVIEW-GlobalQuadraticForms~34, "Adversarial table", and through it ~31). The 8.2 rows are repeated with their values because 8.2 was the last statement changed.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Localization bullet (file list) | 19 names against 5 files at `2fd255d` | 11 + 6 + 1 + 1 = 19 found in the four listed files; 0 in `Classification.lean` | list exact | none |
| 8.2 (carried, ~34) | `⟨1,−1,2,−2⟩` over `ℚ`, `m = 2` | rank `4 = 2·2`; `d = [4] = [1]`; `s_v = (−1,−1)_v` on both sides, `−1` at `v = 2` | local classes `2 • H` on both sides; isometric by 6.3 | none |
| 8.2, `m = 0` (carried) | zero form on the zero space | presentation `(0, ∅)`; local classes `0 = 0 • H` | holds, no junk value | none |
| 8.2, negative control (carried) | `⟨1,1⟩` over `ℚ`, `m = 1` | `d = [1]`, needs `[−1]`; index `2 ≠ 1` | F locally / F globally | none |
| Conventions (4 rows); 4.1 (2); 4.2 [headline] (4); 4.3; 5.1 (2); 5.5 [headline] (2); 6.1, 6.2 (2), 6.3 [headlines]; 7.2 (2); 7.3 [headline] (2); 7.4; 8.1 [headline]; 8.2 Witt classes; 8.3, 8.4 [headlines] | as in ~31 | as in ~31 | holds | none |

**Headline theorems.** 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1, 8.3 and 8.4: all nine are stated in `Suggested.lean` (unchanged), none through a stand-in.

**Overlaps, citations, ownership.**
- `scratch/overlaps.md`: no cited id dropped, none defined only by an open revision, none dropped here and cited elsewhere; one conflicting head, #1215 (R02). The worker's citation resolver lists nothing unresolved.
- The change adds no object and no cross-roadmap citation, so the ownership search was not repeated.

## Not verifiable

- **O'Meara** (`omeara`) and **Serre** (`serre`) are uncertified and cited by locator only; nothing in the changed passage cites them.
- **Elaboration at main's pins** was not rerun; the file is unchanged since the rounds that ran it there.
- **#1215's description** was not readable with this job's tools; that it names no order is carried from the review of #1215 at `c1d130b`.

## Source issues

- none
