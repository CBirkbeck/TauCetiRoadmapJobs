# Review of GlobalQuadraticForms (pull request #1200 at 3219a96)

**Verdict:** needs changes

Incremental re-review of the 32 README lines changed since `9c4d328` (`Suggested.lean` is unchanged). Three findings, all P3. The previous R03 (8.2's route) is repaired and the repair is correct at main's pins. R01 and R02 are not repaired; both need action on the branch and the description, not on the folder. R03 below is a stale file name the repair left behind.

## R01 (P3) — The branch still pins Tau Ceti `358314d`, where 23 declarations the README names do not exist, and main is not merged

Re-raised: "Which pin" (repair report GATE-GlobalQuadraticForms~2). That report says the branch "must take main's manifest before it merges; this job may not touch the manifest". The reason fails because no manifest edit is needed: `git diff --stat origin/main...HEAD -- lake-manifest.json lean-toolchain` is empty, so merging `origin/main` takes main's manifest unchanged.

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/README.md:151–154`: "read at the revisions the content repository's manifest records: Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`."

**Claim.** This head's manifest records those revisions, so the declarations the README names exist at the pins.

**Witness.** `lake-manifest.json` at `3219a96` pins Tau Ceti `358314d4` and Mathlib `f6090c70`; the merge base with main is still `fa41b37`. The two lemmas this head newly cites, `QuadraticForm.formClass_atFinitePlace_eq_nsmul_hyperbolicClass` and `QuadraticForm.formClass_atRealPlace_eq_nsmul_hyperbolicClass`, are absent from that Tau Ceti (no `Global/Hyperbolicity.lean` declaration of either name). `git merge-tree HEAD origin/main` conflicts in `Suggested.lean`.

The count is 23: the 22 of the previous report, less `QuadraticForm.formClass_atRealPlace` (no longer cited), plus these two.

**Why P3 and not P1.** The branch does not change the manifest, so any merge into main uses `2fd255d`/`1b1ccf4b`, where all 23 names exist with the statements the README gives.

**Repair.**
- Merge `origin/main` into the branch.
- Resolve the single conflict in `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` by keeping this branch's file.
- Rerun the gate.

Tested: `Suggested.lean` is byte-identical to the file earlier rounds elaborated at main's pins (exit 0, 8 `sorry` warnings); its five Tau Ceti imports exist at both pins.

## R02 (P3) — #1215 carries a conflicting copy of this folder, no merge order is stated, and the description does not describe this head

**Location.** The pull-request description: "Correct the rank-four plain/signed discriminant comparison in both §5.1 … retains its `Completed.NumberFieldArithmetic.Suggested` import."

**Claim.** This pull request can merge independently of #1215, and the text describes this head.

**Witness.** #1215 is now at `c1d130b8`. `git merge-tree --write-tree 3219a96 c1d130b8` reports conflicts in this folder's `README.md` and `Suggested.lean`; the two copies differ in 242 README lines and 45 Lean lines. #1215 states 8.3 as `Function.Injective (TauCeti.WittRing.globalToLocal K)` (`Suggested.lean:136`) and drops `equivalent_of_locallyEquivalent`, which Integral Lattices on main cites (`README.md:477`, `:916`, `:1028`). This head's 5.1 has no rank-four comparison and its `Suggested.lean` imports no roadmap module, so the description is of another head.

**Repair.** Choose one order and state it in both descriptions:
- **This pull request first** (after R01): #1215 drops its copy of this folder and reapplies only its differences.
- **#1215 first:** this pull request is closed or reduced to what #1215's copy lacks.

Either way, rewrite this description so that it describes this head: both files rebuilt on Tau Ceti carriers; nine declarations and no roadmap import; Layers 0–3 and 4.4 resolved by the section map; main's 4.1, 4.5, 5.2–5.4, 7.1 and Layer 9 dropped.

## R03 (P3) — The Localization contract still lists `Classification.lean`, from which it now cites nothing

**Location.** `README.md:220–222`: "Localization (`NumberTheory/QuadraticForm/Global/Localization.lean`, `Operations.lean`, `Discriminant.lean`, `CompletionTower.lean`, `Classification.lean`)".

**Claim.** Each listed file holds a declaration the bullet names.

**Witness.** The only name of that bullet in `Global/Classification.lean` was `QuadraticForm.formClass_atFinitePlace` (`:87` at `2fd255d`), which this head removed. The file's other eight declarations (`:99`–`:226`) are cited by the bullets at `README.md:261`, `:267`, `:324` and `:366`, each of which lists the file itself.

**Repair.** Delete `, `Classification.lean`` from the file list at `README.md:222`. Tested: the remaining names of the bullet resolve in `Localization.lean`, `Operations.lean`, `Discriminant.lean` and `CompletionTower.lean`; no bullet loses a locator.

## Previous findings

- R01 — not repaired: `README.md:151–154` is unchanged; the manifest still pins `358314d4`/`f6090c70`; main is not merged. Restated as R01 with the count corrected to 23.
- R02 — not repaired: the description is unchanged; #1215 (now `c1d130b8`) still conflicts in both files. Restated as R02.
- R03 — repaired: 8.2 now reads "A regular form of class `m • H` over `K` has class `m • H` at every finite and every real place (`…formClass_atFinitePlace_eq_nsmul_hyperbolicClass`, `…formClass_atRealPlace_eq_nsmul_hyperbolicClass`)" (`README.md:1040–1043`), with both on the *Needs:* line (`:1063–1064`) and in the contract (`:391–392`). The repair left the stale file name of R03 above.

## Verified sound

**Gate and dependency check.**
- **Gate.** The worker's line is all zeros with `build=0`, `OK`. My rerun printed every check at 0 and `OK`, exit 0.
- **No change outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalQuadraticForms'` is empty.
- **Dependency check.** Output: `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. There is no roadmap supplier and no `gap:` contract.

**Lean.**
- **Elaboration.** `lake env lean` on `Suggested.lean` at the branch pins: exit 0, exactly 8 `sorry` warnings (lines 51, 68, 76, 84, 93, 111, 120, 147).
- **Signatures, one-tactic probe, file form.** `Suggested.lean` is unchanged since `9c4d328` (`git diff --stat 9c4d328 HEAD` lists only the README); the worker's elaborated signatures of the 9 declarations show no lost binder. The `#check` comparison and the probe (all 8 fail) are carried from the previous report.

**The changed passages (3), each opened at `2fd255d`.**
- **8.2 route** (`README.md:1037–1045`). Every step is a pinned declaration:
  - `QuadraticForm.locally_formClass_eq_nsmul_hyperbolicClass_iff` (`Global/Hyperbolicity.lean:116`) gives rank `2m` from local classes `m • H`;
  - `TauCeti.formClass_presentedForm` (`RegularFormClass/Basic.lean:703`) says the class of `presentedForm p` is the class of `p`, and `TauCeti.nondegenerate_presentedForm` (`:145`, `[Invertible (2 : K)]`, available over a number field) says it is regular. Classes are a quotient of presentations, so `m • H` has one;
  - `QuadraticForm.formClass_atFinitePlace_eq_nsmul_hyperbolicClass` (`Hyperbolicity.lean:139`) and `QuadraticForm.formClass_atRealPlace_eq_nsmul_hyperbolicClass` (`:79`, `[Invertible (2 : K)]`) take `formClass Q hQ = m • hyperbolicClass K` to the same class at each place. Their proofs use `baseChange_nsmul` and `baseChange_hyperbolicClass`, the two facts the previous route lacked;
  - `TauCeti.formClass_eq_iff` (`Basic.lean:677`) turns equal classes into isometry, in independent universes for the two spaces, which the presented form on `Fin p.1 → K` needs.
  None of the four is derived from 6.3 or 8.2.
- **8.2 *Needs:* line** (`:1061–1069`): lists exactly the declarations the two routes name; the two `formClass_at…Place` lemmas are gone and no remaining sentence of the README names them (grep: 0 hits).
- **Contract** (`:387–394`): the gloss "a regular form whose class over `K` is `m` times the hyperbolic class has that class at every finite and every real place" is the statement of the two lemmas, and `Global/Hyperbolicity.lean` is in that bullet's file list (`:382`).

**Sources: the seeded sample.** Only 8.2 falls in the changed passages. `milne-cft` line 11619 (Theorem 6.3, p. 252: forms equivalent over every `K_v` are equivalent over `K`) and line 11574 (Proposition 6.2, p. 251: Witt cancellation for a nondegenerate subspace) support the statement and the cancellation remark as written. The other fourteen sampled targets are untouched; their rows are in the previous report.

**Adversarial table.** The row for 8.2 is computed this round; every other row is carried from the previous report (PRREVIEW-GlobalQuadraticForms~31, "Adversarial table"), whose statements the diff leaves untouched.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 8.2, new route | `⟨1,−1,2,−2⟩` over `ℚ`, `m = 2` | rank `4 = 2·2`; `d = [4] = [1] = 2·[−1]`; `s_v = (−1,2)(−1,−2)(2,−2) = (−1,−1)_v = (−1,−1)_v^C(2,2)`; index `2`. Presentation `(4, (1,−1,1,−1))`: same `s_v = (−1,−1)_v`, `−1` at `v = 2` on both sides | local classes `2 • H` on both sides; isometric by 6.3 | none |
| 8.2, `m = 0` | zero form on the zero space | presentation `(0, ∅)`, form on `Fin 0 → K`, regular; local classes `0 = 0 • H` | holds, no junk value | none |
| 8.2, negative control | `⟨1,1⟩` over `ℚ`, `m = 1` | `d = [1]`, needs `[−1]`: differ at `p ≡ 3 (mod 4)`; index `2 ≠ 1` | F locally / F globally | none |
| 8.2, odd rank | `⟨1,1,−1⟩` | rank `3 ≠ 2m` | F / F | none |
| Conventions (4 rows); 4.1 (2); 4.2 [headline] (4); 4.3; 5.1 (2); 5.5 [headline] (2); 6.1, 6.2 (2), 6.3 [headlines]; 7.2 (2); 7.3 [headline] (2); 7.4; 8.1 [headline]; 8.2 Witt classes; 8.3, 8.4 [headlines] | as in the previous report | as in the previous report | holds | none |

**Headline theorems.** 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1, 8.3 and 8.4: all nine are stated in `Suggested.lean` (unchanged), none through a stand-in.

**Overlaps, citations, ownership.**
- `scratch/overlaps.md`: no cited id dropped, none defined only by an open revision, none dropped here and cited elsewhere; one conflicting head, #1215 (R02). The worker's citation resolver lists nothing unresolved.
- The change adds no object and no cross-roadmap citation, so the ownership search was not repeated.

## Not verifiable

- **O'Meara** (`omeara`) and **Serre** (`serre`) are uncertified and cited by locator only; nothing in the changed passages cites them.
- **Elaboration at main's pins** was not rerun; the file is unchanged since the rounds that ran it there.
- **#1215's description** was not readable with this job's tools; that it names no order is carried from the review of #1215.

## Source issues

- none
