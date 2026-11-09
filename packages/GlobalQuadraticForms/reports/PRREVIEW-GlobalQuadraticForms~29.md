# Review of GlobalQuadraticForms (pull request #1200 at 5cb0012)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/GlobalQuadraticForms/` at `5cb0012` (no change since r27). Three findings, all P3. R01 and R02 of r27 are not repaired. R03 is new.

## R01 (P3) — The branch pins Tau Ceti `358314d`, where 17 declarations the README names do not exist, and main is not merged

Re-raised: "Which pin" (repair report GATE-GlobalQuadraticForms~2). That report says the branch "must take main's manifest before it merges; this job may not touch the manifest". The reason fails because no manifest edit is needed. `git diff --stat origin/main...HEAD -- lake-manifest.json lean-toolchain` is empty, so merging `origin/main` takes main's manifest unchanged.

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/README.md:151–153`: "read at the revisions the content repository's manifest records: Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`."

**Claim.** The sentence assumes that this head's manifest records those revisions, so that the declarations the README names exist at the pins.

**Witness.** `git show 5cb0012:lake-manifest.json` pins Tau Ceti `358314d4`. At that pin `grep -rn` finds none of the 17 names listed under Verified sound, for example `finrank_le_index_range_ideleClassNormMap` and `WittRing.globalToLocal`. `git merge-tree HEAD origin/main` reports a conflict in `Suggested.lean`.

r27 counted 5 absent names. The correct count is 17. They include the inputs of the routes of 4.2, 4.3, 7.2, 7.3, 8.2 and 8.3, and `TauCeti.NonabelianH1` from Scope. One Mathlib path is also affected: `HeightOneSpectrum.adicCompletion` is in `RingTheory/DedekindDomain/AdicValuation.lean` at `f6090c7`, while `README.md:183` names `AdicValuation/Completion.lean`, which exists only at `1b1ccf4b`.

**Why P3 and not P1.** The branch does not change the manifest, so any merge into main uses `2fd255d`/`1b1ccf4b`. At those revisions all 17 names exist with the statements the README gives (checked below). The defect is in the branch's state, not in the mathematics.

**Repair.**
- Merge `origin/main` into the branch.
- Resolve the single conflict in `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` by keeping this branch's file.
- Rerun the gate.

Tested: `Suggested.lean` imports five Tau Ceti modules. In each of them, every declaration line present at `358314d` is identical at `2fd255d`. The only differences are additions: `Witt/BaseChange.lean` gains 3 theorems and `Localization.lean` gains 2. r27 elaborated this unchanged file at main's pins: 8 `sorry` warnings, exit 0.

## R02 (P3) — #1215 carries a conflicting copy of this folder, neither description states a merge order, and this description does not describe this head

**Location.** The pull-request description: "Correct the rank-four plain/signed discriminant comparison in both §5.1 and the associated quaternary-descent prototype docstring … retains its `Completed.NumberFieldArithmetic.Suggested` import."

**Claim.** The description implies two things: this pull request can merge independently of #1215, and the text describes this head.

**Witness.** #1215's checkout is at `41af5ecd`. `git merge-tree --write-tree 5cb0012 41af5ecd` reports conflicts in this folder's `README.md` and `Suggested.lean` (+345/−152). This head's 5.1 contains no rank-four comparison, and its `Suggested.lean` imports no roadmap module.

The two copies now differ in substance:
- **4.1:** #1215 adds an item 3, which states the seven transported inputs in every universe, and adds `embedding_of_isReal_apply` (see R03).
- **4.4 section map:** #1215 adds a map line for the complex place.
- **8.3:** #1215 states it as `Function.Injective (TauCeti.WittRing.globalToLocal K)`.
- **8.4:** #1215 deletes `equivalent_of_locallyEquivalent` from Lean and maps that name to 8.4. Integral Lattices on main cites the name (`README.md:477`, `:916`, `:1028`).

r28 (the review of #1215 at `293f615`) records that #1215's description names only ClassFieldTheory.

**Repair.** Choose one order and state it in both descriptions:
- **#1215 first:** #1215 merges first, and this pull request is closed or reduced to whatever #1215's copy lacks.
- **This pull request first:** this pull request merges first, after R01, and #1215 drops its copy of this folder and reapplies only its differences.

Either way, rewrite this description so that it describes this head:
- both files are rebuilt on Tau Ceti carriers;
- `Suggested.lean` has nine declarations and no roadmap import;
- Layers 0–3 and 4.4 are resolved by the section map;
- main's 4.1, 4.5, 5.2–5.4, 7.1 and Layer 9 are dropped. No roadmap cites any of these ids (checked below).

## R03 (P3) — 4.1 credits `comap_embedding_of_isReal` with the real-embedding correspondence, and 6.3's route uses two pinned inputs its *Needs:* line omits

**Location.**
- `README.md:395–396`: "the infinite places correspond through `w' ↦ w'.comap σ`, which preserves reality (`NumberField.InfinitePlace.isReal_comap_iff`) and real embeddings (`NumberField.InfinitePlace.comap_embedding_of_isReal`)."
- `README.md:723–728`: the route and *Needs:* line of 6.3.

**Claim.** The cited lemma gives the correspondence of real embeddings, and 6.3's *Needs:* line lists every input of its route.

**Witness.** Mathlib `NumberTheory/NumberField/InfinitePlace/Ramification.lean:90–91` concludes `(w.comap f).embedding = w.embedding.comp f`, which is about the `ℂ`-valued embedding. `atRealPlace` uses `embedding_of_isReal`, which is linked to it by `embedding_of_isReal_apply` (`InfinitePlace/Basic.lean:244`). The README cites that lemma nowhere. 6.3's route also needs local representation from local isometry before it can apply 6.2.

The second gap in 6.3: the route reads "local isometry gives equal rank …, 6.2 gives an injective isometry" (`README.md:723–725`). Two steps of that route are not on its *Needs:* line (`README.md:727–728`):
- Passing from `LocallyEquivalent` to `LocallyRepresents` is Tau Ceti `QuadraticForm.LocallyEquivalent.locallyRepresents` (`NumberTheory/QuadraticForm/Global/Predicates.lean:243`).
- "An injective linear map between spaces of the same finite dimension is bijective" is Mathlib `LinearMap.injective_iff_surjective_of_finrank_eq_finrank` (`LinearAlgebra/FiniteDimensional/Lemmas.lean:197` at `f6090c7`, `:204` at `1b1ccf4b`).

**Repair.**
- **4.1, item 2.** Write: "and real embeddings: when `w'.comap σ` is real, its complex embedding is that of `w'` composed with `σ` (`NumberField.InfinitePlace.comap_embedding_of_isReal`), and `NumberField.InfinitePlace.embedding_of_isReal_apply` reads both real embeddings in `ℂ`". Add `embedding_of_isReal_apply` to the *Needs:* line of 4.1 (`README.md:427–430`) and to "From Mathlib".
- **6.3.** Add `QuadraticForm.LocallyEquivalent.locallyRepresents` and `LinearMap.injective_iff_surjective_of_finrank_eq_finrank` to its *Needs:* line and to the contracts.

Tested:
- Take `K = ℚ(√5)`, `σθ = 1 − θ`, and `w'` the real place with `θ ↦ (1 + √5)/2`. The real embedding of `w'.comap σ` sends `θ ↦ (1 − √5)/2 = w'(σθ)`. The two Mathlib lemmas together give exactly this.
- For `H` and `⟨2, −2⟩` over `ℚ`, the 6.3 route closes with the two added inputs: `LocallyRepresents` holds at every place, and both spaces have `finrank` equal to `2`.

## Previous findings

- **R01 (r27): not repaired.** `README.md:151–153` is unchanged, the branch manifest still pins `358314d4`/`f6090c70`, and the merge base is still `fa41b37`. The conflict with main persists. The count of absent names is corrected from 5 to 17. Restated as R01.
- **R02 (r27): not repaired.** The description is unchanged. #1215 moved from `293f615f` to `41af5ecd` and still conflicts in both files. No merge order is stated. Restated as R02.

## Verified sound

**Gate and dependency check.**
- **Gate.** My rerun of `gate … GlobalQuadraticForms --base origin/main` printed every check at 0 and `OK`, exit 0. The worker's line also has `build=0`.
- **No change outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalQuadraticForms'` is empty.
- **Dependency check.** It printed exactly `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. There is no roadmap supplier and no `gap:` contract.

**Lean.**
- **Elaboration.** `lake env lean` on `Suggested.lean` at the branch pins exits 0. It prints exactly 8 `sorry` warnings, at lines 51, 68, 76, 84, 93, 111, 120 and 147, and nothing else.
- **Signatures.** I ran `#check @name` for all 9 declarations in a scratch copy. Every binder is kept, including `[FiniteDimensional K V]` in 5.5, 6.1–6.3 and 8.4, where it does not occur in the type, and `[Invertible 2]` in 8.3. Each type matches its README statement in generality:
  - `K` is in any universe;
  - `V` and `W` are in independent universes;
  - 7.3 is stated on `Fin I.rank → K`;
  - 6.1 carries `a ≠ 0`;
  - 4.2 is stated on `Kˣ` with a `Finset` of finite places.
- **One-tactic probe.** I replaced each `sorry` with `first | rfl | decide | infer_instance | (simp; done) | (aesop; done) | (simp_all; done)`. All 8 fail.
- **8.4.** It has a real one-term proof from 6.3. It is kept because Integral Lattices on main cites `equivalent_of_locallyEquivalent` by name, so it is not padding.
- **File form.** There is no `set_option`, no `lemma`, a single `import Mathlib`, five `TauCeti.*` modules that exist at both pins, one module docstring, section comments in README order, and a docstring on every declaration.

**Library declarations, at the pins.** I extracted the README's backticked names and checked each one by grep at both pins.

All resolve at `2fd255d`. The following 17 are absent at `358314d` (R01):
- `GlobalFormInvariants.IsLocalRealization.exists_locallyRepresents_prod`
- `GlobalFormInvariants.isAdmissible_ofLocalForms`
- `GlobalFormInvariants.isLocalRealization_ofLocalForms`
- `QuadraticForm.exists_discr_eq_equivalent_of_isRepresentedBy_prod`
- `QuadraticForm.globalInvariants_hasseProduct_eq_one`
- `QuadraticForm.isAdmissible_globalInvariants`
- `QuadraticForm.locally_formClass_eq_nsmul_hyperbolicClass_iff`
- `TauCeti.ClassFieldTheory.exists_sq_sub_mul_sq_iff_forall_completion`
- `TauCeti.ClassFieldTheory.finrank_le_index_range_ideleClassNormMap`
- `TauCeti.NonabelianH1`
- `TauCeti.NumberField.QuadraticForm.Sqrt5.exists_admissible_rank_three`
- `TauCeti.NumberField.QuadraticForm.exists_anisotropic_and_not_anisotropic_away_from_realPlace`
- `TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite`
- `TauCeti.NumberField.QuadraticForm.exists_pair_hilbertSymbol_eq_ite`
- `TauCeti.WittRing.globalToLocal`
- `TauCeti.WittRing.globalToLocal_eq_zero_iff`
- `TauCeti.hilbertSymbol_productFormula`

Declarations opened and compared with the README's glosses:
- **Predicates and localizations.** The four predicates (`Predicates.lean:51`, `:66`, `:85`, `:147`) are conjunctions over finite and real places. `atFinitePlace` and `atRealPlace` are `baseChange` (`Localization.lean:88`, `:94`).
- **The record.** It has an unrestricted `rank : ℕ` (`Invariants.lean:90–98`). The seven clauses of `IsAdmissible` (`:178–195`) are exactly the list at `README.md:246–248`. `globalInvariants` is defined at `FormInvariants.lean:77–83`.
- **Witt ring.** `WittRing.baseChange` is genuine scalar extension (`Witt/BaseChange.lean:211`), so 8.3 is not vacuous. At `2fd255d`, `globalToLocal`'s real component is `baseChange` along `embedding_of_isReal` (`WittLocalization.lean:94`, `:167`), which is the map the Lean statement writes out.
- **Hilbert symbol.** It is `1` exactly when `b = x² − a y²` is solvable (`HilbertSymbol/Basic.lean:46–47`), as in the README.
- **Regularity.** Mathlib `QuadraticMap.Nondegenerate` (`Radical.lean:115`) means radical `⊥` and polar kernel of rank at most `1`, as `README.md:175–178` says.
- **Inputs at `2fd255d`:**
  - the first inequality needs `IsGalois`, `IsCyclic` and `L : Type` (`FirstInequality.lean:103–108`);
  - the quadratic Hasse norm theorem includes every infinite completion (`HasseNorm/Quadratic.lean:45`);
  - `mem_range_ideleNormMap_iff` is placewise (`Range.lean:115`);
  - `exists_fieldUnit_isSquare_div_at_places` is at `SquareClass.lean:40`;
  - the quaternary step's hypothesis is the ternary case over every `L : Type u`, for `presentedForm p` with `p.1 = 3` (`Quaternary.lean:137`);
  - the rank-≥5 step's `ih` concerns `presentedForm p` with `p.1 + 1 = finrank` (`HigherRank.lean:87`);
  - the definite obstruction has rank `n + 1 ≥ 5` (`DefiniteObstruction.lean:68`);
  - the 72:1 reduction is at `PrescribedLocalForms.lean:140`.
- **"Eight inputs in `Type`" is exact.** `variable {K : Type}` occurs at `ProductFormula.lean:61` and `:100`, `PrescribedLocalForms.lean:69`, `SignPrescription.lean:72`, `HasseNorm/Quadratic.lean:41` and `FirstInequality.lean:68`. The other files with that binder (`CohomologicalSymbol.lean`, `HasseNorm/Basic.lean`, `Sqrt5.lean`) supply no general input.
- **No pin proves a headline.**
  - No global square theorem exists in Tau Ceti or Mathlib.
  - `WittLocalization.lean:40` says injectivity is not proved.
  - There is no unconditional Hasse–Minkowski.

**Sources: the seeded sample.** All locators below are against `milne-cft` (printed page = PDF page − 9).

| Target | Locator | Checked at | Result |
|---|---|---|---|
| 4.1 | no literature locator | its inputs are the 19 pinned declarations named on its *Needs:* line, all present at both pins | supported by declarations; see R03 |
| 4.2 | VIII Thm 1.1 (`n = 2`), Ex. 1.3, p. 229 | lines 10384, 10397 | `n = 2` needs only `−1 ∈ K`; the "16 is an eighth power" Check matches |
| 4.3 | VIII Thm 3.1, p. 234 | line 10629 | cyclic hypothesis; `K(√d)/K` is cyclic of order 2 |
| 5.1 | Thm 3.5, p. 235; Prop. 3.7(b),(c), p. 236; proof of 3.5(b), p. 237 | lines 10686, 10700–10702, 10772–10778 | binary case via 3.7(b) + Thm 1.1 ✓; ternary case: the source prints "Theorem 1.1", and the README's Theorem 3.1 is the correct reading (Source issues) |
| 5.5 | O'Meara 66:1 | not readable | Milne Thm 3.5(b), p. 235, line 10689 states it |
| 6.1 | O'Meara 66:3 | not readable | Milne Cor. 3.6, p. 236, line 10694 states it |
| 6.2 | O'Meara 66:3 | not readable | — |
| 6.3 | O'Meara 66:4 | not readable | Milne Thm 6.3, p. 252, line 11619 states it |
| 7.2 | O'Meara 72:1; Thm 6.10, Prop. 6.11, p. 255; p. 256 | lines 11745, 11758, 11781–11785 | local classes and the rank-≤3 real remark ✓; Milne Thm 6.12, p. 256, line 11792 states 72:1 |
| 7.3 | O'Meara 72:1, through 7.2 | — | as for 7.2 |
| 7.4 | Thm 6.3, p. 252; Thm 6.10, p. 255 | lines 11619, 11745; Remark 6.6, lines 11677–11691 | the factor `(−1, d)_v` between `i ≤ j` and `i < j` ✓ |
| 8.1 | O'Meara 66:5 | not readable | follows from Milne 6.3, 6.10 and Sylvester's law (line 11640) |
| 8.2 | Thm 6.3, p. 252; Prop. 6.2, p. 251 | lines 11619, 11574 | ✓ |
| 8.3 | Thm 6.3, p. 252, through 8.2 | line 11619 | ✓ |
| 8.4 | Thm 6.3, p. 252 | line 11619; Remark 6.4, line 11629 (for `O`) | ✓ |
| Conventions | Serre IV §2.1 (`i < j`) | Milne Remark 6.6, line 11677: "Serre 1970 defines ε" as the product over `i < j` | ✓ |

**Adversarial table** (all values computed this round).

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conventions: discriminants | `H`, `⟨1,1⟩`, `n = 2` | `(−1)^(2·1/2) = −1`; `H`: plain `[−1]`, signed `[1]`; `⟨1,1⟩`: plain `[1]`, signed `[−1]` | as stated | none |
| Conventions: `i<j` vs `i≤j` | `H` over `ℝ` | `(1,−1) = 1`; `(1,1)(1,−1)(−1,−1) = −1` | differ, as stated | none |
| Conventions: real Hasse sign | `⟨−1,−1⟩`; `p⟨1⟩ ⊥ q⟨−1⟩` | `(−1)^(2·1/2) = −1 = (−1,−1)_ℝ`; Tau Ceti `realHasse = (−1)^(q.choose 2)` (`Invariants.lean:142`) | agree | none |
| Conventions: zero form | rank 0 | record `(0, [1], 1, 0)`; radical `⊥`, polar-kernel rank `0 ≤ 1`, so regular; `one_le_rank` fails | realized, not admissible | none |
| 4.1 places | conjugation `σ` on `ℚ(i)`, `𝔭 = (2+i)` | mod `2−i`: `i ≡ 2`, `2+i ≡ 4 = 2²` (a unit mod 5), so a square at `𝔭̄`; `v_𝔭(2+i) = 1`, so a nonsquare at `𝔭`; `σ(2+i) = 2−i` is a square at `𝔭` | the correspondence must follow `σ` | none |
| 4.1 real embeddings | `ℚ(√5)`, `σθ = 1−θ`, `w'`: `θ ↦ 1.618…` | the real embedding of `w'.comap σ` sends `θ ↦ −0.618… = (1−√5)/2`; `comap_embedding_of_isReal` gives only the `ℂ`-valued `embedding` | needs `embedding_of_isReal_apply` | R03 |
| 4.1 model in `Type` | `ℚ(√5)`, minimal polynomial `X²−X−1` | `AdjoinRoot (X²−X−1) : Type`; real places `X̄ ↦ (1±√5)/2`; `⟨1,θ,θ⟩` has indices `3` and `1` | as stated | none |
| 4.2 [headline] | `ℚ`: `a = 4, −1, 2, −4`; `ℚ(i)`: `a = −1` | `4 = 2²`: T/T; `−1` is a nonsquare at `p = 3, 7, 11, …`: hypothesis F, conclusion F; `2` is a nonsquare at `p = 3, 5, 11, 13`; `−4` is a nonsquare at `p ≡ 3 (4)`; `ℚ(i)`: `−1 = i²`, `S = ∅`, T/T | holds | none |
| 4.2, `n = 8` analogue | `16` over `ℚ` | `x⁸−16 = (x²−2)(x²+2)(x²+2x+2)(x²−2x+2)`; `(−1/p)(2/p)(−2/p) = (4/p) = 1`; `16^(1/8) = √2 ∉ ℚ` | false with exceptional set `{2}`, as stated | none |
| 4.2, step 3 caution | `ℚ`, `S = {∞}`, the idele `(√2, 1, 1, …)` | `α = 1`: `√2 > 0` is a square in `ℝ`; equality would force `α = √2 ∉ ℚ` | the ⚠ remark is correct | none |
| 4.2, first-inequality contract | `ℚ(∛2, ζ₃)/ℚ` | degree `6`; maximal abelian subextension `ℚ(ζ₃)`, norm index `2` | `6 ≰ 2`: the cyclic hypothesis is needed | none |
| 4.3 | `d = −1`: `a = 5, 3, −1`; `d = 2`, `a = −1` | `5 = 1+4`: T/T; `(−1,3)_3 = (−1/3) = −1`: F/F; `−1 < 0`: F/F (`ℝ`); `1−2 = −1`: T/T | agree | none |
| 5.1 binary | `⟨1,1⟩` over `ℚ(i)`; `⟨1,1⟩` over `ℚ`; `⟨1,−2⟩` over `ℚ` | `1+i² = 0`: T/T; F/F (`ℚ₃`); `2` a nonsquare at `p ≡ ±3 (8)`: F/F | holds using finite places only | none |
| 5.1 ternary | `⟨1,1,−2⟩`, `⟨1,1,−3⟩`, `⟨1,1,1⟩` | `1+1−2 = 0`: T/T; `(−1,3) = −1` exactly at `2`, `3`: F/F; `(−1,−1) = −1` exactly at `2`, `ℝ`: F/F | holds; an even number of places | none |
| 5.1 quaternary consequence | `⟨1,1,1,−3⟩`, `⟨1,1,1,−7⟩` | `1+1+1−3 = 0`: T/T; `−7 ≡ 1 (8)`, so `7 ≡ −1` in `ℚ₂ˣ/(ℚ₂ˣ)²`, and `⟨1,1,1⟩` misses `−1`: F/F | Tau Ceti's hypothesis (`p.1 = 3`, `L : Type u`) is discharged | none |
| 5.5 [headline] | rank 0; `⟨5⟩`; `H`; `⟨1,1,1,1,1⟩`; `⟨1,1,1,1,−1⟩` | F/F; F/F; T/T; F (`ℝ`)/F; `1−1 = 0`: T/T | holds | none |
| 5.5 higher-rank step | `U = ⟨1,1⟩`, `W = ⟨1,−1,1⟩` | `x = 0`: `b = 0`, and `⟨0⟩ ⊥ W` is singular; `x = (1,0)`: `b = 1`, `W(0,1,0) = −1 = −b` | `U(x) ≠ 0` is needed | none |
| 6.1 [headline] | `⟨1,1⟩` with `a = 3, −1, 5`; `H` with `a = 7`; zero form with `a = 1` | F/F (`ℚ₃`); F/F (`ℝ`, `ℚ₂`); T/T; `4²−3² = 7`: T/T; F/F | holds | none |
| 6.2 [headline] | `⟨3⟩→⟨1,1⟩`; `⟨1,1⟩→⟨1,1,1,1⟩`; `⟨5⟩→H`; rank 2 into rank 1 | F/F (`ℚ₃`); T/T; `((1+5)/2, (1−5)/2) = (3,−2)`, `9−4 = 5`: T/T; F/F (`finrank_le`) | holds | none |
| 6.3 [headline] | `H` vs `⟨2,−2⟩`; `⟨1⟩` vs `⟨−1⟩`; `⟨1,1,−3⟩` vs `⟨1,1,−1⟩` | T/T; F/F (`ℝ`); both have signature `(2,1)`, F/F (`ℚ₃`) | holds; the route needs two inputs | R03 |
| 7.2 | `⟨−1,−1,−1⟩`; rank 3, `d = [1]`, `R = ⟨1,1,1⟩`, `s_2 = −1` | `s_2 = (−1)³ = −1`, real `(−1)^3 = −1`, product `1`; product `(−1)·1 = −1` | the hypotheses hold and fail as stated | none |
| 7.2 correction planes | `P = ⟨1,−b⟩`, `P' = ⟨a,−ab⟩` | `[−b] = [−a²b]`; `(a,−ab) = (a,−a)(a,b) = (a,b)`; `(1,−b) = 1` | the sign flips exactly where `(a,b)_v = −1` | none |
| 7.2 real classes | rank 4, `d = [1]`, `q = 0, 2, 4` | Hasse signs `1`, `−1`, `(−1)^6 = 1` | `(4,0)` and `(0,4)` are not separated | none |
| 7.3 [headline] | `⟨1⟩`; the zero record; rank 1, `T = {3,5}`; rank 2, `d = [−1]`, `T = {3,5}`; the `ℚ(√5)` record | admissible and realized; rank `0`: not admissible; product `(−1)² = 1` but not admissible (`Invariants.lean:267`); the same for rank 2 (`:287`); `(−1)·1·(−1) = 1`, admissible, `⟨1,θ,θ⟩` | as stated | none |
| 7.4 convention | `⟨3⟩` over `ℚ₃` | `i≤j`: `(3,3)_3 = (3,−1)_3 = (−1/3) = −1`; `i<j`: `1`; factor `(−1,3)_3 = −1` | as stated | none |
| 8.1 [headline] | `⟨1,1,−1⟩` vs `⟨1,2,−2⟩`; `⟨1,1⟩` vs `⟨2,2⟩`; two zero forms; zero form vs `⟨1⟩` | `[−1] = [−4]`, `s = 1`, `p = 2` on both sides; `(2,2) = 1` because `4−2 = 2`, and `(x+y)²+(x−y)² = 2x²+2y²`; equal records and isometric; neither | holds | none |
| 8.2 | `⟨1,−1,2,−2⟩`; `⟨1,1⟩`; rank 3 | `≅ 2H`: T/T; `[1] ≠ [−1]`: F/F; odd rank: F | holds | none |
| 8.3 [headline] | `[⟨1,1⟩]`, `[H]`, `[⟨1⟩]` over `ℚ` | real signature `2 ≠ 0`; `0`; odd dimension at every `ℚ_p` | consistent with injectivity; the Lean map is `globalToLocal` | none |
| 8.4 [headline] | the proof term; `H¹(ℚ, SO(⟨1,1⟩))` | `(hasseMinkowski_equivalent Q hQ R hR).2 h` elaborates; twists `⟨a,a⟩`: `a = 2` is isometric, `a = 3` fails at `ℚ₃` (`(3,3)_3 = −1`), `a = −1` fails at `ℝ` | the kernel is trivial | none |
| Layer 8 Example | `⟨1,1,−3⟩ ⊥ ⟨−1,−1,1⟩` | equals `[⟨1,1,−3⟩] − [⟨1,1,−1⟩]`; the two forms are not isometric at `ℚ₃` | nonzero | none |

**Headline theorems.** The README's headlines are 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1, 8.3 and 8.4. All nine are stated in `Suggested.lean`, and none is forced through a stand-in. 7.2 is reached from 7.3 by Tau Ceti's `isAdmissible_ofLocalForms` and `IsLocalRealization.equivalent_at*`.

**Overlaps and citations.**
- **Overlap report.** `scratch/overlaps.md` lists no dropped id cited elsewhere and no id that only an open revision defines. The one conflicting head is #1215 (R02).
- **Dropped ids.** My own `roadmaps grep` finds no citation, on main or at any open head, of main's 4.1 (vector weak approximation), 4.5, 5.2–5.4, 7.1 or Layer 9. 4.1 is reused for transport and is cited nowhere under its old meaning.
- **Dropped Lean names.** Main's `Suggested.lean` declares 32 names that this head drops. Only `exists_hilbertSymbol_eq_neg_one_iff_pair` is cited, by #931 at `:408`, `:1521`, `:2265` and `:2275`. The map line at `README.md:80–81` resolves it.
- **Citations of this roadmap on main.** All resolve:
  - Classical Arithmetic Completion's 4.4 real symbol and localized product formula resolve to the map lines;
  - Integral Lattices: `hasseMinkowski_equivalent` and `equivalent_of_locallyEquivalent` (`:477`, `:916`, `:1028`), the realization theorem (`:1793`, which is 7.3) and 6.3 (`:2306`);
  - `Completed/OrthogonalSpinGroups`: `:947`, `:965`.
- **Citations at open heads.** The sections they cite all exist: #851 (Layers 5–6), #1063 (Layers 3, 4, 7), #1175 and #1017 (Layer 5), #1181 (4.3, 6.1, 6.3, 8.4), and #617's Integral Lattices (§7.3, `exists_globalForm_of_isAdmissible`).

**Ownership.**
- **This roadmap's names.** `namespace TauCetiRoadmap.GlobalQuadraticForms` and its theorem names occur only on main, in #1200 and in #1215, all of which are this roadmap.
- **Hasse–Minkowski.** Class Field Theory (`README.md:216`) and Quadratic Form Invariants (`:31`, `:3433`) on main assign it to this roadmap.
- **Global square theorem.** Class Field Theory on main excludes Grunwald–Wang (`:243`), and no roadmap states local squares to global ones.
- **Other roadmaps.** Quadratic Form Invariants Part II (#1834) owns characteristic two and Pfister forms. No other roadmap owns transport along number-field isomorphisms.
- **The `H¹` assignment in Scope.** It matches `Completed/OrthogonalSpinGroups/README.md:963–967`, whose successor is Orthogonal Tamagawa and Lattice Mass (`:49`).

**Remarks.** These are not findings, and no change is requested.
- "Orthogonal and Spin Groups consumes 4.3 and 6.1" (`README.md:977`) is true at the open revision #1181. On main, Orthogonal and Spin Groups says its global suppliers "are inputs only to OrthogonalTamagawaAndLatticeMass" (`:70–71`).
- O'Meara 71:19/71:19a and three of the four Serre locators appear only under References.

## Not verifiable

- **O'Meara, *Introduction to Quadratic Forms*** (`omeara`, uncertified, paywalled): 58:7, 65:15, 66:1, 66:3, 66:4, 66:5, 71:19, 71:19a and 72:1 are cited by locator only.
  - The verified Milne text independently states 65:15 (Thm 1.1), 66:1 (Thm 3.5(b)), 66:3 for scalars (Cor. 3.6), 66:4 (Thm 6.3) and 72:1 (Thm 6.12).
  - 66:3 for forms (6.2) and 58:7 rest on O'Meara alone.
- **Serre, *A Course in Arithmetic*** (`serre`, uncertified): the `i < j` convention of IV §2.1 is confirmed through Milne Remark 6.6 (`milne-cft` line 11677). III §1.2 Thm 1, III §2.2 Thm 3 and IV §3.2 Thm 8 are not verifiable.
- **Elaboration at main's pins** was not rerun, because the content checkout is read-only for this job. I compared the imported modules' declaration lines across the pins instead (R01). r27 reports exit 0 with 8 `sorry` warnings there.
- **#1215's description** could not be read with the tools of this job. The statement that it names no order is carried from r28.

## Source issues

- **Misprint** in milne-cft at Chapter VIII, proof of Theorem 3.5(b), p. 237: the source says the three- and four-variable cases follow from Proposition 3.7(c),(d) and Theorem 1.1; it should be Theorem 3.1, the Hasse norm theorem, since 3.7(c),(d) reduce isotropy to norms; affects nothing.
- **Misprint** in milne-cft at Chapter VIII, proof of Theorem 3.5(b), p. 237: the source says the induction assumes Theorem 3.1b for n − 1 variables; it should be Theorem 3.5(b); affects nothing.
- **Gap** in milne-cft at Chapter VIII, proof of Theorem 3.5(b), p. 237: when the exceptional set S is empty nothing forces c = ax₁² + bx₂² to be nonzero, which the induction needs for cY² − r to be nondegenerate; it should choose x₁, x₂ with c ≠ 0; affects the proof.
- **Misprint** in milne-cft at Chapter VIII, proof of Theorem 6.3, p. 252: the source names the complement of aZ² in q′ first q′₁ and then q₂; it should be q′₁ throughout; affects nothing.
