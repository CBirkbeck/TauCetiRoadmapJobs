# Review of GlobalQuadraticForms (pull request #1200 at f028c07)

**Verdict:** needs changes

This is an incremental re-review of the 29 lines of `TauCetiRoadmap/GlobalQuadraticForms/README.md` that changed between `a6625dc` (read by r23) and `f028c07`: the "Section and name map" (lines 53–78) was reworded so that each line says which Tau Ceti declarations a cited id resolves to. `Suggested.lean` is unchanged. R01 and R02 of r23 are not repaired and are restated below. The reworded lines carry one defect of their own (R03): five of the declarations they point to are stated only for number fields in `Type`, which the lines do not say.

## R01 (P1) — The branch still pins Tau Ceti `358314d`, where four of the declarations the changed lines point to do not exist, and it does not merge with main

Re-raised: R01 (repair report GATE~2, "Which pin"). The reason given there, that the repair job may not touch `lake-manifest.json`, still fails: no manifest edit is needed (below).

**Location.** `README.md:53–54`: "A citation of one of the ids below resolves to the Tau Ceti declarations named on its line"; `:146–147`: "Every input below is a declaration of Mathlib or Tau Ceti at the pins."

**Claim.** Every declaration the section map and the contracts name exists at this branch's pins.

**Witness.** `lake-manifest.json` at this head pins Tau Ceti `358314d4` and Mathlib `f6090c70`; main (`1bea835`) pins `2fd255d9` and `1b1ccf4b`. I grepped both Tau Ceti trees for the 25 declarations the map names. Four exist only at `2fd255d`: `TauCeti.hilbertSymbol_productFormula` (`NumberTheory/QuadraticForm/Global/ProductFormula.lean:67`), `QuadraticForm.globalInvariants_hasseProduct_eq_one` (same file, `:107`), `TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite` (`SignPrescription.lean:154`) and `exists_pair_hilbertSymbol_eq_ite` (`:191`). `ProductFormula.lean` and `SignPrescription.lean` do not exist at `358314d`. The Scope citation `TauCeti.NonabelianH1` (`:87`) is likewise at `2fd255d` only (`RepresentationTheory/Homological/ContCohomology/Nonabelian/Basic.lean:190`). The other 21 names resolve at both pins.

**Merge state.** `origin/main` is not an ancestor of `f028c07`; the merge base is `fa41b37`. `git merge-tree --write-tree HEAD origin/main` reports exactly one content conflict, in this folder's `Suggested.lean` (main's commit `a891cd19`, the pin bump, touched one line of a declaration this branch deletes). `git diff --stat origin/main...HEAD -- lake-manifest.json lean-toolchain` is empty, so a merge of main takes main's manifest with no manifest edit by anyone.

**Repair.** Merge `origin/main` into the branch, resolve the single conflict in `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` by keeping this branch's file, and rerun the gate with its targeted build at main's pins. Between the pins the five Tau Ceti modules `Suggested.lean` imports change only by additions (r17, r23), so no statement changes meaning.

## R02 (P3) — #1215 carries a different copy of this folder, the two heads conflict, neither description states an order, and this description does not describe this head

**Location.** The pull request's description: "Fix rank-four discriminant sign comparison … incorporates current main and retains its `Completed.NumberFieldArithmetic.Suggested` import."

**Claim.** This pull request can merge independently of #1215, and its description describes this head.

**Witness.** #1215 has moved to `7498694` ("7.3 routed through the 72:1 reduction, complete Needs of 4.3–8.2"). `git merge-tree --write-tree f028c07 7498694` (merge base `fa41b37`) reports content conflicts in this folder's `README.md` and `Suggested.lean`; the two copies differ by `+352/−157` lines. This head's `Suggested.lean` imports no roadmap module and main is not an ancestor of it. In the changed region itself the copies differ: #1215's map (its lines 53–79) marks the `Type`-only declarations and adds `QuadraticForm.isAdmissible_globalInvariants`; this head's does neither.

**Repair.** Choose one order and state it in both descriptions: either #1215 merges first and this pull request keeps in this folder only what #1215's copy lacks (closing it if nothing remains), or this pull request merges first (after R01) and #1215 drops its copy of this folder and re-applies only its differences. Rewrite this description to describe this head: both files rebuilt on Tau Ceti carriers, nine declarations and no roadmap import, Layers 0–3 and 4.4 resolved by the section map.

## R03 (P3) — Four section-map lines resolve the 4.4 citations to declarations stated only for `K : Type`, without saying so

**Location.** `README.md:70`, "4.4, the localized product formula, resolves to `TauCeti.hilbertSymbol_productFormula`"; `:73–74` (`exists_hilbertSymbol_eq_ite`); `:75–76` (`exists_pair_hilbertSymbol_eq_ite`); `:77–78` (`globalInvariants_hasseProduct_eq_one`).

**Claim.** A citation of 4.4 resolves to the named declaration.

**Witness.** At `2fd255d`, `ProductFormula.lean:61` and `:100` and `SignPrescription.lean:72` declare `variable {K : Type}`, so all four theorems hold for number fields in `Type` only. The id they replace is stated for `K : Type u`: main's `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean:263` has `variable {K : Type u}` over `hilbertSymbol_localized_productFormula` (`:312`), `exists_hilbertSymbol_eq_neg_one_iff` (`:333`) and `exists_hilbertSymbol_eq_neg_one_iff_pair` (`:350`). Both open consumers of these ids state their number field as `Type*`: QuaternionArithmetic (`Suggested.lean:118`, citing 4.4 at `README.md:272` and `:605`) and GL2AutomorphicRepresentationsAndTransfer (`Suggested.lean:81`, citing `exists_hilbertSymbol_eq_neg_one_iff_pair` at `README.md:408`). For them the map points to a theorem that does not apply; the universe-general statement is this roadmap's own 4.1 ("Together these give the other seven inputs for number fields in every universe", `:411–416`), which the map does not mention. The README states the fact for its own use (`:99–101`, `:147–152`) but not on the lines a consumer reads. The other 4.4 line (`:71–72`) is fine: `hilbertSymbol_real` is over `ℝ` and `hilbertSymbol_unitAtRealPlace_eq_neg_one_iff` takes `K : Type*` (`ArchimedeanSymbol.lean:95`). The Layer 0–3 lines are fine: every declaration there takes `K : Type u`.

**Repair.** On lines 70, 73, 75 and 77 add ", stated for `K` in `Type`; for a number field in any universe the statement is 4.1's transport of it", or put one sentence to that effect in the map's lead-in at `:53–54`, naming the four declarations. #1215's copy of the map (its `:53–55`, `:71–79`) already carries the per-line "in `Type`" annotation, so adopting that wording also narrows R02.

Tested on QuaternionArithmetic's ramification realization: for `F : Type 1` the annotated line sends the reader to 4.1, whose first fact gives a model `F' : Type`, whose second fact transports the prescribed sign family back along the correspondence of places; the unannotated line sends the reader to a theorem whose `K` cannot be instantiated at `F`.

## Previous findings

- R01 — not repaired: "There is no roadmap supplier. Every input below is a declaration of Mathlib or Tau Ceti at the pins." The manifest still pins `358314d`/`f6090c7`; main `1bea835` is not an ancestor; one conflict in `Suggested.lean`. Restated as R01.
- R02 — not repaired: the description still says it "incorporates current main and retains its `Completed.NumberFieldArithmetic.Suggested` import". #1215 is now at `7498694` and still conflicts in both files. Restated as R02.

## Verified sound

**Gate and dependency check.**
- My rerun of the gate printed every check at 0, ending `source-material=0 OK`. The worker's line adds `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalQuadraticForms'` is empty.
- The dependency check printed exactly `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. There is no roadmap supplier and no `gap:` contract.
- `scratch/overlaps.md`: no id this README cites is dropped by an open pull request, no id this pull request drops is cited elsewhere, and the only other pull request changing this folder is #1215 (R02).

**Lean at the branch pins** (the file is unchanged since `a6625dc`).
- `lake env lean` on `Suggested.lean` exits 0 with exactly 8 `sorry` warnings (lines 51, 68, 76, 84, 93, 111, 120, 147).
- I elaborated the worker's `#check @name` file for all 9 declarations: the types are identical to the signature listing and to r23's. `K : Type u_1`; `V`, `W` in independent universes; `hQ`, `hR` are `QuadraticMap.Nondegenerate`; 8.3 carries `[Invertible 2]`; no binder is lost.
- One-tactic probe on a scratch copy, each of the 8 `sorry` replaced by `by first | rfl | simp | infer_instance | aesop | decide`: 8 errors at the 8 sites (5 "unsolved goals", 3 failures of the last alternative). None closes; no padding. 8.4 has a real body.

**The changed lines, name by name** (Tau Ceti at `358314d` and `2fd255d`; paths under `TauCeti/NumberTheory/QuadraticForm/Global/` unless noted).
- Layer 0: `atFinitePlace` (`Localization.lean:88`/`:90`), `atRealPlace` (`:94`/`:96`), `atComplexEmbedding` (`:103`/`:105`), `IsLocallyIsotropic` (`Predicates.lean:51`), `LocallyRepresentsScalar` (`:85`), `LocallyRepresents` (`:66`), `LocallyEquivalent` (`:147`), `equivalent_atComplexEmbedding_iff_finrank_eq` (`ComplexPlaces.lean:65`/`:66`): all at both pins, all `K : Type u`.
- Layer 1: `realPositiveIndex` (`Signature.lean:80`/`:84`), `realNegativeIndex` (`:85`/`:89`; the `GlobalFormInvariants.realNegativeIndex` of `Invariants.lean:131` is a different declaration, correctly not the one named), `equivalent_atRealPlace_iff_realSignature_eq` (`:340`/`:343`): both pins.
- Layer 2: `finiteHasse` (`FiniteHasse.lean:79`), `hasFiniteMulSupport_finiteHasse` (`HasseSupport.lean:39`), `equivalent_atFinitePlace_iff_finrank_eq_and_discr_eq_and_finiteHasse_eq` (`Classification.lean:110`/`:116`): both pins.
- Layer 3: `GlobalFormInvariants` (`Invariants.lean:90`, in `TauCeti.NumberField.QuadraticForm`), `IsAdmissible` (`:178`, in its namespace), `globalInvariants` (`FormInvariants.lean:77`), `isAdmissible_globalInvariants_iff` (`:165`): both pins, `K : Type u`.
- 4.4: `hilbertSymbol_real` (`HilbertSymbol/Archimedean.lean:59`, over `ℝˣ`) and `hilbertSymbol_unitAtRealPlace_eq_neg_one_iff` (`ArchimedeanSymbol.lean:105`/`:102`): both pins. The four `2fd255d`-only declarations are under R01; their glosses match their statements: the product formula is `∏ᶠ_v (a_v,b_v)_v · ∏_w (a_w,b_w)_w = 1`; `exists_hilbertSymbol_eq_ite` takes `b`, `S`, `T` with `b` a nonsquare on `S`, negative on `T`, `#S + #T` even, and gives `a` with `(a,b)_v = if v ∈ S then −1 else 1` (71:19a); `exists_pair_hilbertSymbol_eq_ite` gives `a, b` from `S`, `T` and parity alone (71:19); `globalInvariants_hasseProduct_eq_one` is `(Q.globalInvariants hQ).hasseProduct = 1`. The old name `exists_hilbertSymbol_eq_neg_one_iff_pair` (main `Suggested.lean:350`, `= −1 ↔ v ∈ Tf`) and the `ite` form agree.

**Cross-roadmap citations of the mapped ids, resolved this round.**
- QuaternionArithmetic (#1722) `README.md:272`, `:605`: 4.4 product formula and `exists_hilbertSymbol_eq_neg_one_iff_pair`, 5.5, 6.1, 6.3. Map line 75 serves the name; universes under R03.
- GL2AutomorphicRepresentationsAndTransfer (#931) `README.md:408`: §4.4 `exists_hilbertSymbol_eq_neg_one_iff_pair`. Same.
- MetaplecticAutomorphicForms (#1063) `README.md:1627`, `:1828`: Layers 3, 7, 8. Layer 3 is mapped at `:66–69`; Layers 7 and 8 exist here.
- ClassicalArithmeticCompletion on main `README.md:165`, `:783`, `:793`: 4.4's real symbol and product formula, at `K = ℚ`, which is in `Type`. Mapped at `:70–72`; Downstream consumers `:971–972` says so.
- IntegralLattices on main `README.md:1794`: the realization theorem and the product formula, by description. 7.3 exists; the product formula is mapped.

**Sources.** The changed lines cite no source. The seeded sample (4.1–4.3, 5.1, 5.5, 6.1–6.3, 7.2–7.4, 8.1–8.4) is untouched text, verified in r17, r23 and r24 against `milne-cft` (Thm 1.1, Ex. 1.3, Thm 3.1, Thm 3.5, Prop 3.7, Prop 6.2, Thm 6.3, Thm 6.10, Prop 6.11).

**Adversarial table.** Rows for the changed lines were computed this round; rows marked "r23" or "r17" carry those reports' values for untouched statements.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Section map: every named declaration exists at the pins | 25 names, two trees | 21 at both pins; 4 at `2fd255d` only (`ProductFormula.lean:67`, `:107`; `SignPrescription.lean:154`, `:191`); 0 at neither | false at the branch pin | R01 |
| Section map: universe of the resolved declarations | 25 names | 20 take `K : Type u` or `Type*`; `hilbertSymbol_real` is over `ℝ`; 4 take `K : Type` vs main's 4.4 `K : Type u` (`Suggested.lean:263`) | narrows four citations | R03 |
| Section map: glosses vs statements | 71:19a vs 71:19 | `exists_hilbertSymbol_eq_ite` binds `b` and needs `hS`, `hT`; `exists_pair_…` binds `∃ a b` with parity only | "prescribed second argument" / "pair" correct | none |
| Section map: `realNegativeIndex` | two declarations of that name | `QuadraticForm.realNegativeIndex Q w : ℕ` (form) vs `GlobalFormInvariants.realNegativeIndex I w = n − p_w` (record) | the map names the form one, as Layer 1 needs | none |
| Section map: `IsAdmissible` | `IsAdmissible` declarations in the tree | 3 at `358314d`, 4 at `2fd255d`; the map's `GlobalFormInvariants.IsAdmissible` is `Invariants.lean:178` | unambiguous | none |
| Downstream consumers `:971` | CAC at `K = ℚ` | `ℚ : Type`; `hilbertSymbol_real` over `ℝ` | the `Type`-only declarations apply | none |
| Supplier pin (R01) | manifest vs main | `358314d`/`f6090c7` vs `2fd255d`/`1b1ccf4`; 1 conflict; manifest three-dot diff empty | not repaired | R01 |
| #1215 overlap (R02) | heads `f028c07` vs `7498694` | 2 conflicting files; `+352/−157` | not repaired | R02 |
| Scope / 8.4: `H¹(K, SO(Q))` (r23) | `Q = ⟨1,1⟩` over `ℚ`, twists `⟨a,a⟩` | reflection has `det = −1`; `H¹(ℚ, SO(Q)) ≅ ℚ*/N(ℚ(i)*)`; `a = 2` trivial, `a = 3` fails at `ℚ₃`, `a = −1` fails at `ℝ` | kernel `{1}` | none |
| 5.1 quaternary paragraph (r23) | `⟨1,1,1,−3⟩`, `⟨1,1,1,−7⟩` | T/T; F/F (`ℚ₂`); `L = ℚ(√−7) : Type` | `hternary` discharged | none |
| 5.5 route (r23) | `K = ℚ`, `V = ULift.{1} (Fin 5 → ℚ)`, `⟨1,1,1,1,−1⟩` | `Q(1,0,0,0,1) = 0`: T/T; `⟨1,1,1,1,1⟩`: F/F at `ℝ`; `n − 1 = 4`, no truncation | route complete | none |
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
- README:190–191 glosses `comap_embedding_of_isReal` as "the pulled-back real embedding is the composite"; at the pin the lemma equates complex embeddings `K →+* ℂ` under a reality hypothesis (r23).
- `equivalent_of_locallyEquivalent` is a one-term corollary of 6.3, kept for Integral Lattices on main (`README.md:477`, `:916`, `:1028`); #1215 deletes it. Settling this is part of R02's choice of order.

## Not verifiable

- **O'Meara, *Introduction to Quadratic Forms*** (`omeara`, uncertified) and **Serre, *A Course in Arithmetic*** (`serre`, uncertified): not needed for the changed lines, which cite no source.
- **Elaboration at main's pins.** The brief allows Lean only in this worktree, which is at `358314d`. That the four `2fd255d`-only declarations and `TauCeti.NonabelianH1` resolve after the R01 merge rests on reading their declarations in the content checkout's Tau Ceti at `2fd255d`.

## Source issues

- none
