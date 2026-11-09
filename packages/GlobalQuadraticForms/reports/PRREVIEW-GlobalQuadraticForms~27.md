# Review of GlobalQuadraticForms (pull request #1200 at 5cb0012)

**Verdict:** needs changes

This is an incremental re-review of the 27 lines of `TauCetiRoadmap/GlobalQuadraticForms/README.md` that changed between `f028c07` (read by r25) and `5cb0012`: the lead-in of the section and name map now says which lines resolve to declarations stated for number fields in `Type` and that 4.1 carries them to every universe; five map lines carry the "in `Type`" mark and the Layer 3 line adds `QuadraticForm.isAdmissible_globalInvariants`; the supplier-contracts lead-in names the revisions of Tau Ceti and Mathlib the declarations are read at; and the gloss of `NumberField.InfinitePlace.comap_embedding_of_isReal` is corrected. `Suggested.lean` is unchanged. R03 of r25 is repaired and the r25 remark on the `comap` gloss is resolved. R01 and R02 of r25 remain; R01 is partly repaired and is kept at P3 (below), R02 is unchanged.

## R01 (P3) — The branch's manifest still pins Tau Ceti `358314d`, where five of the declarations the README names do not exist, and the branch does not merge cleanly with main

Re-raised: R01 (repair report GATE~2, "Which pin"). The reason given there, that the repair job may not touch `lake-manifest.json`, still fails: no manifest edit is needed. `git diff --stat origin/main...HEAD -- lake-manifest.json lean-toolchain` is empty, so a merge of `origin/main` takes main's manifest with no edit by anyone.

**Location.** `README.md:150–153`: "Every input below, and every declaration the section map names, is a declaration of Mathlib or Tau Ceti, read at the revisions the content repository's manifest records: Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`."

**Claim.** The declarations the README names exist at the pins of the branch this pull request asks to merge.

**Witness.** The worktree's `lake-manifest.json` at `5cb0012` pins Tau Ceti `358314d4` and Mathlib `f6090c70`; main (`3090489`) and #1215 (`293f615f`) pin `2fd255d9` and `1b1ccf4b`. At `358314d` the files `NumberTheory/QuadraticForm/Global/ProductFormula.lean` and `SignPrescription.lean` do not exist, so `TauCeti.hilbertSymbol_productFormula`, `QuadraticForm.globalInvariants_hasseProduct_eq_one`, `QuadraticForm.isAdmissible_globalInvariants` (`ProductFormula.lean:67`, `:107`, `:117` at `2fd255d`), `exists_hilbertSymbol_eq_ite` and `exists_pair_hilbertSymbol_eq_ite` (`SignPrescription.lean:154`, `:191`) are absent there. `origin/main` is not an ancestor of `5cb0012` (merge base `fa41b37`); `git merge-tree --write-tree HEAD origin/main` reports one content conflict, in `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean`.

**Why P3 and not P1.** The README's sentence is now true of the revisions it names: every declaration it lists exists at `2fd255d`/`1b1ccf4b` (checked name by name below), and main's manifest records exactly those revisions. `Suggested.lean` imports only modules whose statements are the same at both pins: it elaborates in the worktree (8 `sorry` warnings, exit 0) and a scratch copy elaborates from the content checkout at main's pins (8 `sorry` warnings, exit 0). What remains is a repository-state defect, not a false claim.

**Repair.** Merge `origin/main` into the branch, resolve the single conflict in `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` by keeping this branch's file, and rerun the gate with its targeted build at main's pins. Tested: the branch's `Suggested.lean`, unchanged, elaborates against `2fd255d`/`1b1ccf4b`.

## R02 (P3) — #1215 carries a different copy of this folder, the two heads conflict, neither description states an order, and this description does not describe this head

**Location.** The pull request's description: "Fix rank-four discriminant sign comparison … incorporates current main and retains its `Completed.NumberFieldArithmetic.Suggested` import."

**Claim.** This pull request can merge independently of #1215, and its description describes this head.

**Witness.** #1215 is at `293f615f` (the index of 2026-11-09 lists `7498694`, an ancestor). `git merge-tree --write-tree 5cb0012 293f615f` (merge base `fa41b37`) reports content conflicts in this folder's `README.md` and `Suggested.lean`; the two copies of the folder differ by `+352/−166` lines. This head's `Suggested.lean` imports no roadmap module, and main is not an ancestor of it. The section and name map is now worded almost identically in the two copies (this head `:53–81`, #1215 `:53–79`), so the remaining divergence is elsewhere in the folder.

**Repair.** Choose one order and state it in both descriptions: either #1215 merges first and this pull request keeps in this folder only what #1215's copy lacks (closing it if nothing remains), or this pull request merges first (after R01) and #1215 drops its copy of this folder and re-applies only its differences. Rewrite this description to describe this head: both files rebuilt on Tau Ceti carriers, nine declarations and no roadmap import, Layers 0–3 and 4.4 resolved by the section map.

## Previous findings

- R01 — partly repaired: "read at the revisions the content repository's manifest records: Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`" now names main's pins, which is true there; the branch's manifest still pins `358314d`/`f6090c7` and main is not an ancestor. Restated as R01 (P3).
- R02 — not repaired: the description still says it "incorporates current main and retains its `Completed.NumberFieldArithmetic.Suggested` import"; #1215 at `293f615f` conflicts in both files; no order stated. Restated as R02.
- R03 — repaired: `README.md:54–57` says the map's declarations hold "for number fields in every universe except where a line says in `Type`; for those, the statement … is its transport through 4.1", and lines 73, 74–75, 78–79, 80–81 and 82–83 carry the mark on exactly the five declarations stated with `variable {K : Type}`.

## Verified sound

**Gate and dependency check.**
- My rerun of the gate printed every check at 0, ending `source-material=0 OK`; the worker's line adds `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalQuadraticForms'` is empty: no change outside the folder.
- The dependency check printed exactly `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. There is no roadmap supplier and no `gap:` contract.
- `scratch/overlaps.md`: no id this README cites is dropped by an open pull request, no id this pull request drops is cited elsewhere, and the only other pull request changing this folder is #1215 (R02).

**Lean** (the file is unchanged since `a6625dc`).
- `lake env lean` on `Suggested.lean` in the worktree exits 0 with exactly 8 `sorry` warnings (lines 51, 68, 76, 84, 93, 111, 120, 147) and nothing else.
- A scratch copy elaborated from the content checkout, at main's pins `2fd255d`/`1b1ccf4b`, exits 0 with the same 8 warnings: the pin bump of R01 changes nothing in the file.
- The elaborated signatures of the 9 declarations are identical to r25's listing; no section binder is lost. The one-tactic probe of r25 (none of the 8 `sorry`s closes by `rfl`, `simp`, `infer_instance`, `aesop` or `decide`) carries forward unchanged; 8.4 has a real body.

**The changed lines, name by name** (Tau Ceti at `2fd255d`, the revision the README names; paths under `TauCeti/NumberTheory/QuadraticForm/Global/` unless noted).
- `QuadraticForm.isAdmissible_globalInvariants` (`ProductFormula.lean:117`): arguments `Q`, `hQ : Q.Nondegenerate`, `hn : 1 ≤ Module.finrank K V`; conclusion `(Q.globalInvariants hQ).IsAdmissible`; under `variable {K : Type}` (`:100`). The map's gloss "the admissibility of the record of a regular form of positive rank … in `Type`" matches. It is the resolution of main's 3.3 statement `globalInvariants_isAdmissible` (main `Suggested.lean:244`, `K : Type u`, hypothesis `hrank : 1 ≤ Module.finrank K V`), so the `Type` caveat is needed and is given. No roadmap other than this folder's two copies cites either name (`roadmaps grep`).
- The five marked declarations are the only ones in the map under `variable {K : Type}`: `ProductFormula.lean:61` (`hilbertSymbol_productFormula`), `:100` (`globalInvariants_hasseProduct_eq_one`, `isAdmissible_globalInvariants`), `SignPrescription.lean:72` (`exists_hilbertSymbol_eq_ite`, `exists_pair_hilbertSymbol_eq_ite`).
- The 20 unmarked declarations are universe-polymorphic: `Localization.lean:80` (`K : Type u`), `Predicates.lean:45`, `ComplexPlaces.lean:59`, `Signature.lean:74`, `FiniteHasse.lean:72`, `HasseSupport.lean:34` (`Type*`), `Classification.lean:81`, `Invariants.lean:83` (`Type*`), `FormInvariants.lean:71`, `ArchimedeanSymbol.lean:95` (`Type*`); `TauCeti.hilbertSymbol_real` is over `ℝˣ` (`NumberTheory/HilbertSymbol/Archimedean.lean:59`). The lead-in's "every universe except where a line says in `Type`" is exact.
- The eight inputs the contracts list as stated in `Type` are all under `variable {K : Type}`: the five above, `ClassFieldTheory/Global/IdeleClass/FirstInequality.lean:68` (`finrank_le_index_range_ideleClassNormMap`, `:108`), `ClassFieldTheory/Global/HasseNorm/Quadratic.lean:41` (`exists_sq_sub_mul_sq_iff_forall_completion`, `:45`) and `PrescribedLocalForms.lean:69` (`exists_locallyRepresents_prod`, `:140`). "Seven of the eight" in Conventions (`:98–100`) and 4.1 (`:377–382`) agree with the one exception named, the first inequality.
- The map lead-in's route ("a model in `Type` by the first fact, the declaration there, and the conclusion back by the second") is 4.1's structure: item 1 (`:384`) gives the model, item 2 (`:388–427`) transports regularity, the record and `IsAdmissible` along the reindexing, and the closing paragraph (`:429–434`) states the same route. For `isAdmissible_globalInvariants` the rank is unchanged (the same group `V`), regularity transports by item 2, and admissibility of the reindexed record is admissibility of the record.
- `NumberField.InfinitePlace.comap_embedding_of_isReal` (Mathlib `NumberTheory/NumberField/InfinitePlace/Ramification.lean:90–91` at both `1b1ccf4b` and `f6090c7`): hypothesis `(w.comap f).IsReal`, conclusion `(w.comap f).embedding = w.embedding.comp f`. The new gloss ("when the pulled-back place is real, its embedding into `ℂ` is the embedding of the original place composed with the ring homomorphism") matches; r25's remark is resolved.
- Naming revisions in a README is house practice: 78 READMEs on main carry a 40-hex revision (for example CoboundaryExpansion `README.md:117`, PDE `README.md:271`).

**Cross-roadmap citations of the mapped ids** (resolved in r25 and unchanged: QuaternionArithmetic #1722 `README.md:272`, `:605`; GL2AutomorphicRepresentationsAndTransfer #931 `:408`; MetaplecticAutomorphicForms #1063 `:1627`, `:1828`; ClassicalArithmeticCompletion on main `:165`, `:783`, `:793`; IntegralLattices on main `:1794`). The `Type` marks now tell the two open consumers that state their field as `Type*` where the universe-general form is (4.1).

**Sources.** The changed lines cite no source. The seeded sample (4.1–4.3, 5.1, 5.5, 6.1–6.3, 7.2–7.4, 8.1–8.4) is untouched text, verified in r17, r23 and r24 against `milne-cft` (Thm 1.1, Ex. 1.3, Thm 3.1, Thm 3.5, Prop 3.7, Prop 6.2, Thm 6.3, Thm 6.10, Prop 6.11).

**Adversarial table.** Rows for the changed lines were computed this round; rows marked "r25", "r23" or "r17" carry those reports' values for untouched statements.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Contracts lead-in: revisions named vs manifests | main, #1215, branch manifests | main `2fd255d9`/`1b1ccf4b`; #1215 same; branch `358314d4`/`f6090c70` | true of main, not of the branch | R01 |
| Section map: every named declaration exists at the named revision | 26 names at `2fd255d` | 26 found; at `358314d` 21 found, 5 absent (`ProductFormula.lean`, `SignPrescription.lean` missing) | true at `2fd255d` | R01 |
| Section map lead-in: universes | 26 names | 5 under `{K : Type}`, all marked; 20 under `Type u`/`Type*`, none marked; 1 over `ℝˣ` | exact | none |
| Layer 3 line: `isAdmissible_globalInvariants` | `⟨1⟩` over `ℚ`; zero form | `hQ` holds, `hn : 1 ≤ 1`, record `(1,[1],s≡1,p=1)` admissible; zero form: `hn : 1 ≤ 0` fails, record not admissible (`:98`, `:146`) | gloss "positive rank" needed and present | none |
| Layer 3 line vs main's 3.3 | main `Suggested.lean:244` | `K : Type u`, `hrank : 1 ≤ finrank` vs `K : Type`, `hn : 1 ≤ finrank` | same statement, narrower universe, marked | none |
| Lead-in route vs 4.1 | `K : Type 1`, `Q` regular, rank `n ≥ 1` | item 1: model `K' : Type`; item 2: `σQ` regular, rank `n`; record reindexed, `IsAdmissible` preserved | transport closes | none |
| "Seven of the eight" | the 8 listed names | 8 under `{K : Type}`; 7 transported by 4.1; 1 (`finrank_le_index_…`, `FirstInequality.lean:108`, binds `L : Type`) used only in 4.2 | consistent | none |
| `comap_embedding_of_isReal` gloss | `Ramification.lean:90` | hyp `(w.comap f).IsReal`; concl `(w.comap f).embedding = w.embedding.comp f` | matches | none |
| `isReal_comap_iff` gloss (untouched) | same file | pulling back along a ring isomorphism preserves reality | as r23 | none |
| Branch vs #1215 (R02) | `5cb0012` vs `293f615f` | 2 conflicting files; `+352/−166`; map regions near-identical | not repaired | R02 |
| Scope / 8.4: `H¹(K, SO(Q))` (r23) | `Q = ⟨1,1⟩` over `ℚ`, twists `⟨a,a⟩` | reflection has `det = −1`; `H¹(ℚ, SO(Q)) ≅ ℚ*/N(ℚ(i)*)`; `a = 2` trivial, `a = 3` fails at `ℚ₃`, `a = −1` fails at `ℝ` | kernel `{1}` | none |
| 5.1 quaternary paragraph (r23) | `⟨1,1,1,−3⟩`, `⟨1,1,1,−7⟩` | T/T; F/F (`ℚ₂`); `L = ℚ(√−7) : Type` | `hternary` discharged | none |
| 5.5 route (r23) | `K = ℚ`, `V = ULift.{1} (Fin 5 → ℚ)`, `⟨1,1,1,1,−1⟩` | `Q(1,0,0,0,1) = 0`: T/T; `⟨1,1,1,1,1⟩`: F/F at `ℝ`; `n − 1 = 4` | route complete | none |
| Conventions: discriminants (r17) | `H`, `⟨1,1⟩` | plain `[−1]`, signed `[1]`; plain `[1]`, signed `[−1]` | correct | none |
| Conventions: `i<j` vs `i≤j` (r17) | `H` over `ℝ` | `1` vs `−1` | differ, as stated | none |
| Conventions: zero form (r17) | rank 0 | record `(0,[1],1,0)`, fails `1 ≤ n` | realized, not admissible | none |
| 4.1 transport (r17) | conjugation on `ℚ(i)`; `ℚ(√5)` | `2+i ≡ 4` mod `2−i`; indices `3`, `1` | correct | none |
| 4.2 [headline] (r17) | `a = 4, −1, 2, −4`; `16` for `n = 8` | square; nonsquare at `p ≡ 3 (4)`; at `p ≡ ±3 (8)`; as `−1`; `16` not an 8th power in `ℚ₂` | true; `n = 8` analogue false | none |
| 4.2 contract (r17) | `ℚ(∛2, ζ₃)/ℚ` | degree `6`, norm index `2` | cyclic hypothesis needed | none |
| 4.3 (r17) | `d = −1`, `a = 5, 3, −1`; `d = 2`, `a = −1` | T/T; F/F (`ℚ₃`); F/F (`ℝ`); T/T | agree | none |
| 5.1 binary and ternary (r17) | `⟨1,1⟩`; `⟨1,1,−2⟩`, `⟨1,1,−3⟩`, `⟨1,1,1⟩` | isotropic over `ℚ(i)`; T/T; F/F (`ℚ₃`); `−1` at `ℝ`, `ℚ₂` only | correct | none |
| 5.5 [headline] (r17) | rank 0, 1; `H`; `⟨1,1,−3⟩`; `⟨1,1,1,1,1⟩`; `⟨1,0⟩` | F/F; F/F; T/T; F/F; F/F; T/T | holds | none |
| 6.1 [headline] (r17) | `⟨1,1⟩`, `a = 3, −1`; `H`; zero form; `a = 0` | F/F; F/F; T/T; F/F; excluded by `ha` | holds | none |
| 6.2 [headline] (r17) | `⟨3⟩ → H`; `⟨3⟩ → ⟨1,1⟩`; rank 2 into rank 1 | `(2,−1) ↦ 3`; F/F (`ℚ₃`); F/F | holds | none |
| 6.3 [headline] (r17) | `H` vs `⟨2,−2⟩`; `⟨1⟩` vs `⟨−1⟩`; `⟨1,1,−3⟩` vs `⟨1,1,−1⟩` | T/T; F/F (`ℝ`); F/F (`ℚ₃`) | holds | none |
| 7.2 (r17) | `⟨−1,−1,−1⟩`; rank 3, `s₂ = −1`, `R = ⟨1,1,1⟩` | product `1`; product `−1` fails | correct | none |
| 7.3 [headline] (r17) | `⟨1⟩`; zero form; rank 1 and rank 2 (`d = [−1]`), `T = {3,5}` | admissible; not; not; not | correct | none |
| 7.4 convention (r17) | `⟨3⟩` over `ℚ₃` | `−1` vs `1`, factor `(−1,3)₃ = −1` | as stated | none |
| 8.1 [headline] (r17) | `⟨1,1,−1⟩` vs `⟨1,2,−2⟩`; `⟨1,1⟩` vs `⟨2,2⟩`; zero forms | equal records; isometric; equal | holds | none |
| 8.2 (r17) | `⟨1,−1,2,−2⟩`; `⟨1,1⟩`; odd rank | `≅ 2H`; `d ≠ [−1]`; rank `≠ 2m` | correct | none |
| 8.3 [headline] (r17) | `[⟨1,1⟩]`, `[H]`, `[⟨1⟩]`; `ℚ(i)` | signature `2`; `0`; odd; `[⟨1,1⟩] = 0` over `ℚ(i)` | holds | none |
| 8.4 (r23) | `Suggested.lean:132` | body `(hasseMinkowski_equivalent Q hQ R hR).2 h` | proved from 6.3 | none |
| `ℚ(√5)` example (r17) | record `(3,[1], −1 at (2), 3, 1)` | `(−1)·1·(−1) = 1` | admissible | none |

**Headline theorems.** The README's headlines are 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1, 8.3 and 8.4. All nine are stated in `Suggested.lean`; the diff adds and removes none.

**Ownership.** The changed lines assign nothing to this roadmap: they point citations at Tau Ceti. Checked against #1215 (the only other revision of this folder) and the consumers above; no second owner of Hasse–Minkowski or of the global classification appears in the open heads the brief lists.

**Remarks on untouched text** (not findings, no change requested).
- `equivalent_of_locallyEquivalent` is a one-term corollary of 6.3, kept for Integral Lattices on main (`README.md:477`, `:916`, `:1028`); #1215 deletes it. Settling this is part of R02's choice of order.

## Not verifiable

- **O'Meara, *Introduction to Quadratic Forms*** (`omeara`, uncertified) and **Serre, *A Course in Arithmetic*** (`serre`, uncertified): not needed for the changed lines, which cite no source.

## Source issues

- none
