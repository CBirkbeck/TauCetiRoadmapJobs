# Review of GlobalQuadraticForms (pull request #1200 at 15f0a4c)

**Verdict:** needs changes

AI-assisted incremental re-review of `TauCetiRoadmap/GlobalQuadraticForms/` at `15f0a4cd2a54a454c23c678aacfa861baff271f4`, covering the 11 lines of `README.md` changed since `f6c50f2` (the head the previous review read), and everything that cites them. `Suggested.lean` has not changed. There is one finding, R01 (P1), carried over from the previous review. The previous P3 (R02) is repaired, and the repair is correct against both Tau Ceti pins.

## R01 (P1) — The branch still pins Tau Ceti `358314d`, where cited declarations do not exist, and it does not merge cleanly with main

Re-raised: R01 (repair report GATE~2, "Which pin": "this job may not touch the manifest").

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/README.md:136–137`: "There is no roadmap supplier. Every input below is a declaration of Mathlib or Tau Ceti at the pins." The contracts at :147–316 and the *Needs:* lines of 4.2, 4.3, 7.2, 7.3, 8.2 and 8.3 depend on this sentence.

**Claim.** Every input cited at this head exists at its pins.

**Witness.** At `15f0a4c`, `lake-manifest.json` still pins Tau Ceti `358314d4` and Mathlib `f6090c70`, with `lean4:v4.35.0-rc3`. Main pins `2fd255d9`, `1b1ccf4b` and `v4.36.0-rc2`. I re-grepped 9 of the cited names (`hilbertSymbol_productFormula`, `finrank_le_index_range_ideleClassNormMap`, `globalToLocal_eq_zero_iff`, `exists_locallyRepresents_prod`, `isAdmissible_ofLocalForms`, `exists_sq_sub_mul_sq_iff_forall_completion`, `exists_hilbertSymbol_eq_ite`, `locally_formClass_eq_nsmul_hyperbolicClass_iff`, `exists_discr_eq_equivalent_of_isRepresentedBy_prod`). Each has 0 hits in `TauCeti/` at `358314d` and 2–7 hits at `2fd255d`. Main's pin bump `a891cd19` is not an ancestor of this head. `git merge-tree HEAD origin/main` still reports `CONFLICT (content)` in `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean`.

**Why the reason fails.** The repair does not edit the manifest by hand. It merges `origin/main`, which brings main's manifest along with main's history. The only conflict is inside this roadmap's own folder. Until it is resolved the pull request cannot merge, whoever is allowed to touch the manifest. Because R01 is the only blocking finding and it is a re-raise, a human has to decide it.

**Repair.** The same as in the previous review:
1. Merge `origin/main` into the branch.
2. Resolve the single conflict in `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` by keeping this branch's file.
3. Rerun the gate, with its targeted build, at Tau Ceti `2fd255d`, Mathlib `1b1ccf4` and `lean4:v4.36.0-rc2`.

**Tested.** The other open pull request that changes this roadmap (#1215, head `024927f`) already holds the resolved state:
- It contains `a891cd19` and pins Tau Ceti `2fd255d`.
- `git diff 15f0a4c 024927f -- TauCetiRoadmap/GlobalQuadraticForms` is empty, so it carries this folder byte for byte.
- `git merge-tree HEAD 024927f` is clean.

So the resolution in step 2 produces a tree that already exists. That branch's build at main's pins was not run here (see Not verifiable).

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d` and Mathlib `f6090c7`. The 9 re-grepped names have 0 hits there. `a891cd19` is not an ancestor, and the test merge of `origin/main` conflicts in `Suggested.lean`. Re-raised as R01.
- R02 — repaired: the Local form theory bullet at :263–278 now lists `NumberTheory/LocalField/QuadraticForm/Hasse.lean`, with `TauCeti.RegularFormClass.discr` (:271–273) and `TauCeti.RegularFormClass.localHasse` (:273–275), each with a correct clause. The test count in :134–316 is now 1 each.

## Verified sound

**Gate and dependencies.**
- I reran the gate command at this head: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. Every check is 0. The worker's run with the targeted build reports `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalQuadraticForms'` is empty.
- `git diff --stat f6c50f2 HEAD` shows `README.md | 11 +++++++++--` only.
- The dependency check printed exactly `depcheck: 238 roadmaps, 2319 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. There is no roadmap supplier and no `gap:` contract.

**Lean, at the branch pins.**
- `lake env lean` on `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` exits 0 with exactly 8 `sorry` warnings, at lines 51, 68, 76, 84, 93, 111, 120 and 145.
- I put `#check @name` for all 9 declarations, plus the three newly listed Tau Ceti names and `localHasse_mk`, in one scratch file and elaborated it once.
  - Each type of `Suggested.lean` is unchanged from the previous report: `K : Type u_1`, `V` and `W` in their own universes, `Nondegenerate` on both forms, `a ≠ 0` in 6.1, `[Invertible 2]` in 8.3.
  - No binder was lost and nothing changed.
- The file is byte-identical to `f6c50f2`, so the previous padding probe still stands: all 8 sorried theorems fail `rfl`, `simp`, `infer_instance`, `aesop` and `exact?`, and `equivalent_of_locallyEquivalent` is one line from `hasseMinkowski_equivalent`.

**Library declarations opened for the changed lines** (`TauCeti/`, line at `358314d` / `2fd255d`).
- `NumberTheory/QuadraticForm/Global/Predicates.lean:189` / `:189`: `LocallyRepresentsScalar.of_represents`, typed `QuadraticMap.Represents Q a → Q.LocallyRepresentsScalar a`.
  - It has no nondegeneracy hypothesis and no `a ≠ 0`.
  - `LocallyRepresentsScalar` (`:85`) is the conjunction of `Represents (Q.atFinitePlace v) (algebraMap K _ a)` and `Represents (Q.atRealPlace w) (embedding_of_isReal w.2 a)`.
  - This matches the new clause at :195–196. The 6.1 *Needs:* line (:615–617) uses it for the global-to-local direction, which is the direction it proves.
- `LinearAlgebra/QuadraticForm/RegularFormClass/Discriminant.lean:122` / `:123`: `discr : RegularFormClass K → SquareClassGroup K` under `[Field K] [Invertible 2]`. It is a `Quotient.lift` of the square class of `∏ i, p.2 i`, well defined by `squareClass_prod_eq_of_equivalent`. The clause at :271–273 is exact.
- `NumberTheory/LocalField/QuadraticForm/Hasse.lean:91` / `:93`: `localHasse : RegularFormClass K → ℤˣ` under `[IsNonarchimedeanLocalField K] [Invertible 2]`. `localHasse_mk` gives `∏ i, ∏ j > i, hilbertSymbol (p.snd i) (p.snd j)`. The clause at :273–275 is exact, and it agrees with the Conventions at :104–106 (`i < j`, `1` in rank ≤ 1).
- The file list is correct at both pins: `Classification.lean:129`/`:132` (`eq_iff_rank_eq_and_discr_eq_and_localHasse_eq`) and `Realization.lean:113` (`exists_of_realization`) sit beside `Hasse.lean` in `NumberTheory/LocalField/QuadraticForm/`.
- "Weights" for the diagonal coefficients is Mathlib's term (`QuadraticMap.weightedSumSquares`). It is not invented vocabulary.

**Contracts cover the *Needs:* lines.** I took every backticked name on every *Needs:* line, 62 distinct names, and searched :134–316 for each. None is missing; before this head, `of_represents`, `discr` and `localHasse` were.

**Sources.** The diff adds and changes no locator, and none is flagged unverified. Of the seeded sample, only 4.1 (:368, :387) and 6.1 (:617) depend on the changed lines, through the three declarations above, which I checked at both pins. The sample's Milne locators were verified in earlier rounds and are untouched.

**Overlaps.**
- #1215 at `024927f` changes this roadmap. Its folder is identical to this head's and the heads merge cleanly, so there is no conflict and no order to state.
- The dropped Layer 3 is cited by the ClassFieldTheory README of #1215 (line 1915: "GlobalQuadraticForms Layers 3.3, 4.2–4.4 and 5.1") and by MetaplecticAutomorphicForms. The section map at :63–72 resolves 3.3 and 4.4 to Tau Ceti names, and 4.2, 4.3 and 5.1 still exist.

**Remark (untouched text, no change requested).** If #1215 merges first, the folder change here becomes a no-op and R01's conflict disappears with it.

**Adversarial table.** Rows marked "r5" are carried from the previous report, which cites r4 for its own carried rows. Computed rows are added for every changed statement.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Contract: `of_represents` | `Q = ⟨1,1⟩` over ℚ, `a = 2`; `a = 0`; zero-dimensional `Q` | global `(1,1) ↦ 2`; at `ℚ₃` the image of `(1,1)` gives `2`; at `ℝ`, `1+1 = 2`. `a = 0`: zero vector on both sides. Zero-dimensional: represents `0` only, on both sides | one direction, no regularity needed, matches the pinned type | none |
| Contract: `discr` (plain, independent of the diagonalization) | `⟨1,1⟩ ≅ ⟨2,2⟩` over ℚ via `2x²+2y² = (x+y)²+(x−y)²`; `⟨1,−1⟩`; rank 0 | `[1·1] = [1]`, `[2·2] = [4] = [1]`, equal; `⟨1,−1⟩`: plain `[−1]`, signed `(−1)^1·[−1] = [1]`, so the clause's plain discriminant is the Conventions' one; rank 0: empty product `[1]` (`discr_zero`) | correct | none |
| Contract: `localHasse` (`i < j`, independent of the diagonalization) | `⟨3⟩` over `ℚ₃`; `⟨1,1⟩` vs `⟨2,2⟩` over `ℚ₂`; `⟨1,1⟩` vs `⟨3,3⟩` over `ℚ₃` | `⟨3⟩`: `i<j` gives the empty product `1`, while the wrong `i≤j` model gives `(3,3)₃ = (3,−1)₃ = −1`; `ℚ₂`: `(1,1) = 1`, `(2,2) = (2,−1) = 1` since `−1 = 1² − 2·1²`, equal, as the isometry requires; `ℚ₃`: `(1,1) = 1`, `(3,3) = (3,−1) = −1`, both with `d = [1]`, so two classes | correct; the rank-1 instance excludes O'Meara's convention | none |
| Contracts vs *Needs:* lines | 62 backticked names | missing from :134–316: 0 (previous head: 3) | complete | none |
| 4.1 local-form transport, invariants, reindexed realization, local-isotropy Check (`ℚ(i)`, `(2±i)`) | r5 rows | `τU(cx) = c²·τU(x)`; `(τa,τb)_{K'} = (a,b)_K`; `i ≡ 2 mod (2−i)`, `2+i ≡ 4 = 2²` | correct | none |
| 4.1 places follow σ, real places, model in `Type` | r5 (r4) rows | as in r4 | correct | none |
| 4.2 warning: ℚ, `S = {∞}`, idele `√2` | r5 row | `α = √2 ∉ ℚ`; `√2 > 0` is a real square | correct | none |
| 4.2 global square [headline], 4.3, 5.1, 5.5, 6.1, 6.2, 6.3 [sample and headlines] | r5 (r4) rows | as in r4 | correct | none |
| 7.2 finite-place class count | r5 row | rank 1: `s = 1`; `⟨a,−a⟩`: one class; `⟨1,1⟩` vs `⟨3,3⟩` over `ℚ₃`: `1` vs `−1` | matches Milne VIII 6.10–6.11 | none |
| 7.2 real-place remark | r5 row | rank 4, `d = [1]`: `q = 0,2,4` give `s = 1, −1, 1`; rank 3: four distinct `(d,s)` | correct | none |
| 7.2 route in `Type u`; 7.2 existence; 7.3, 7.4, 8.1–8.4 | r5 (r4) rows | as in r4 | correct | none |
| Supplier pin | 9 names at `358314d` vs `2fd255d` | 0 hits each vs 2–7 hits each; test merge with main: 1 conflict | absent at the branch pin | R01 |

## Not verifiable

- **O'Meara, *Introduction to Quadratic Forms*** and **Serre, *A Course in Arithmetic*** are settled as `uncertified`. The changed lines cite neither.
- **Elaboration at main's pins** (`2fd255d`, `1b1ccf4`, `v4.36.0-rc2`) was not run. This review may run Lean only in this worktree, at its own pins, so the build of #1215's head with this identical folder was not checked either.

## Source issues

- none new. The Milne VIII issues recorded in earlier reports (misprints at lines 10777, 10788 and 11626–11627; the `c ≠ 0` gap at 10794–10804) still stand and are not repeated here.
