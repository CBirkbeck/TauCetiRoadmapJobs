# Review of GlobalQuadraticForms (pull request #1200 at 9c4d328)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/GlobalQuadraticForms/` at `9c4d328` (the README changed by 324 lines since `5cb0012`; `Suggested.lean` is unchanged). Three findings, all P3. R03 of the previous review is repaired. R01 and R02 are not, and both need the author's action on the branch and the description, not on the folder. R03 below is new.

## R01 (P3) — The branch still pins Tau Ceti `358314d`, where 22 declarations the README names do not exist, and main is not merged

Re-raised: "Which pin" (repair report GATE-GlobalQuadraticForms~2). That report says the branch "must take main's manifest before it merges; this job may not touch the manifest". The reason fails because no manifest edit is needed: `git diff --stat origin/main...HEAD -- lake-manifest.json lean-toolchain` is empty, so merging `origin/main` takes main's manifest unchanged.

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/README.md:151–154`: "read at the revisions the content repository's manifest records: Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`."

**Claim.** This head's manifest records those revisions, so the declarations the README names exist at the pins.

**Witness.** `lake-manifest.json` at `9c4d328` pins Tau Ceti `358314d4` and Mathlib `f6090c70`; the merge base with main is still `fa41b37`. A declaration-line grep of that Tau Ceti finds none of the 22 names listed under Verified sound, for example `WittRing.globalToLocal_wittClass_formClass` and `ideleClassNormMap_surjective_of_forall_range_normUnits_eq_top`. `git merge-tree HEAD origin/main` conflicts in `Suggested.lean`.

The count rose from 17 to 22 because this head's repairs cite six more declarations that exist only at `2fd255d` and drop one (`globalToLocal_eq_zero_iff`).

**Why P3 and not P1.** The branch does not change the manifest, so any merge into main uses `2fd255d`/`1b1ccf4b`, where all 22 names exist with the statements the README gives (opened below).

**Repair.**
- Merge `origin/main` into the branch.
- Resolve the single conflict in `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` by keeping this branch's file.
- Rerun the gate.

Tested: `Suggested.lean` is byte-identical to the file earlier rounds elaborated at main's pins (exit 0, 8 `sorry` warnings); its five Tau Ceti imports exist at both pins.

## R02 (P3) — #1215 carries a conflicting copy of this folder, no merge order is stated, and the description does not describe this head

**Location.** The pull-request description: "Correct the rank-four plain/signed discriminant comparison in both §5.1 … retains its `Completed.NumberFieldArithmetic.Suggested` import."

**Claim.** This pull request can merge independently of #1215, and the text describes this head.

**Witness.** #1215 is at `7fd8d8ca`. `git merge-tree --write-tree 9c4d328 7fd8d8ca` reports conflicts in this folder's `README.md` and `Suggested.lean`; the two copies differ in 202 README lines and 45 Lean lines. This head's 5.1 has no rank-four comparison and its `Suggested.lean` imports no roadmap module.

The copies have moved closer: this head now has #1215's record route for 7.3 and its fuller *Needs:* lines. They still differ in substance: #1215 states 8.3 as `Function.Injective (TauCeti.WittRing.globalToLocal K)`, drops `equivalent_of_locallyEquivalent` from Lean (Integral Lattices on main cites it at `README.md:477`, `:916`), and has an item 3 in 4.1 and a complex-place map line that this head lacks.

**Repair.** Choose one order and state it in both descriptions:
- **This pull request first** (after R01): #1215 drops its copy of this folder and reapplies only its differences.
- **#1215 first:** this pull request is closed or reduced to what #1215's copy lacks.

Either way, rewrite this description so that it describes this head: both files rebuilt on Tau Ceti carriers; nine declarations and no roadmap import; Layers 0–3 and 4.4 resolved by the section map; main's 4.1, 4.5, 5.2–5.4, 7.1 and Layer 9 dropped.

## R03 (P3) — 8.2's route cites `formClass_atFinitePlace` for the localizations of `m · H`, which needs two further pinned facts; Tau Ceti states the step directly

**Location.** `README.md:1037–1039`: "That is the class of the localizations of the global sum `m · H` of hyperbolic planes (`QuadraticForm.formClass_atFinitePlace`, `QuadraticForm.formClass_atRealPlace`)".

**Claim.** The two cited lemmas give that the localizations of `m · H` have class `m • H`.

**Witness.** `formClass_atFinitePlace` (`Global/Classification.lean:87`) concludes only `formClass Q_v = RegularFormClass.baseChange K_v (formClass Q)`. Reaching `m • hyperbolicClass K_v` also needs `RegularFormClass.baseChange_nsmul` and `RegularFormClass.baseChange_hyperbolicClass` (`RegularFormClass/BaseChange.lean:360`, `:377`), which 8.2 does not name.

Tau Ceti at `2fd255d` already proves the step in one statement each: `QuadraticForm.formClass_atFinitePlace_eq_nsmul_hyperbolicClass` (`Global/Hyperbolicity.lean:139`) and `QuadraticForm.formClass_atRealPlace_eq_nsmul_hyperbolicClass` (`:79`): if `formClass Q = m • hyperbolicClass K`, the localization at each place has class `m • H`.

**Repair.** In the route of 8.2, in its *Needs:* line and in the "Form classes, hyperbolicity and Witt rings" contract, cite `QuadraticForm.formClass_atFinitePlace_eq_nsmul_hyperbolicClass` and `QuadraticForm.formClass_atRealPlace_eq_nsmul_hyperbolicClass` for this step, in place of the two `formClass_at…Place` lemmas (which no other step of 8.2 uses).

Tested: `⟨1, -1, 2, -2⟩` over `ℚ` has class `2 • H`; the two lemmas give class `2 • H` at every `ℚ_p` and at `ℝ`, which with `TauCeti.formClass_eq_iff` is the local isometry with `2 · H` that 6.3 then globalizes.

## Previous findings

- **R01 (r29): not repaired.** `README.md:151–154` is unchanged; the manifest still pins `358314d4`/`f6090c70`; main is not merged. Restated as R01 with the count corrected to 22.
- **R02 (r29): not repaired.** The description is unchanged; #1215 (now `7fd8d8ca`) still conflicts in both files. Restated as R02.
- **R03 (r29): repaired.** 4.1 now reads "when `w'.comap σ` is real, its complex embedding is that of `w'` composed with `σ` (`…comap_embedding_of_isReal`), and `…embedding_of_isReal_apply` reads both real embeddings inside `ℂ`" (`README.md:451–454`), with the lemma on the *Needs:* line (`:489`) and under "From Mathlib" (`:204`). 6.3's *Needs:* line (`:843–845`) now has `QuadraticForm.LocallyEquivalent.locallyRepresents` and `LinearMap.injective_iff_surjective_of_finrank_eq_finrank`. Both exist at both pins (`Predicates.lean:243`; `FiniteDimensional/Lemmas.lean:204` at `1b1ccf4b`).

## Verified sound

**Gate and dependency check.**
- **Gate.** The worker's line is all zeros with `build=0`, `OK`. My rerun of the text scanners and dependency check printed every check at 0 and `OK`, exit 0.
- **No change outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalQuadraticForms'` is empty.
- **Dependency check.** Output: `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. There is no roadmap supplier and no `gap:` contract.

**Lean.**
- **Elaboration.** `lake env lean` on `Suggested.lean` at the branch pins: exit 0, exactly 8 `sorry` warnings (lines 51, 68, 76, 84, 93, 111, 120, 147).
- **Signatures.** `#check @name` for all 9 declarations in a scratch copy. Every binder is kept: `[FiniteDimensional K V]` in 5.5, 6.1–6.3, 8.1 and 8.4; `[Invertible 2]` in 8.3; `a ≠ 0` in 6.1; `K`, `V`, `W` in three independent universes; 7.3 on `Fin I.rank → K`. Each agrees with its README statement; nothing changed.
- **One-tactic probe.** Each `sorry` replaced by `first | rfl | decide | infer_instance | (simp; done) | (aesop; done) | (simp_all; done) | exact?`: all 8 fail. 8.4 is a one-term corollary of 6.3, kept because Integral Lattices on main cites `equivalent_of_locallyEquivalent` by name.
- **File form.** No `set_option`, no `lemma`, one `import Mathlib`, five `TauCeti.*` modules present at both pins, one module docstring, section comments in README order, a docstring on every declaration.

**Library declarations.** I extracted the 250 backticked names of the README and grepped each at both pins. All library names resolve at `2fd255d`/`1b1ccf4b`. The 22 absent at `358314d` (R01):

`GlobalFormInvariants.IsLocalRealization.exists_locallyRepresents_prod`, `GlobalFormInvariants.isAdmissible_ofLocalForms`, `GlobalFormInvariants.isLocalRealization_ofLocalForms`, `QuadraticForm.exists_discr_eq_equivalent_of_isRepresentedBy_prod`, `QuadraticForm.formClass_atRealPlace`, `QuadraticForm.globalInvariants_hasseProduct_eq_one`, `QuadraticForm.isAdmissible_globalInvariants`, `QuadraticForm.locally_formClass_eq_nsmul_hyperbolicClass_iff`, `QuadraticForm.nondegenerate_weightedSumSquares_neg_self_mul`, `QuadraticForm.nondegenerate_weightedSumSquares_one_neg`, `QuadraticMap.IsRepresentedBy.exists_equivalent_prod`, `TauCeti.ClassFieldTheory.exists_sq_sub_mul_sq_iff_forall_completion`, `TauCeti.ClassFieldTheory.finrank_le_index_range_ideleClassNormMap`, `TauCeti.GlobalNumberFields.ideleClassNormMap_surjective_of_forall_range_normUnits_eq_top`, `TauCeti.NonabelianH1`, `TauCeti.NumberField.QuadraticForm.Sqrt5.exists_admissible_rank_three`, `TauCeti.NumberField.QuadraticForm.exists_anisotropic_and_not_anisotropic_away_from_realPlace`, `TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite`, `TauCeti.NumberField.QuadraticForm.exists_pair_hilbertSymbol_eq_ite`, `TauCeti.WittRing.globalToLocal`, `TauCeti.WittRing.globalToLocal_wittClass_formClass`, `TauCeti.hilbertSymbol_productFormula`.

Declarations newly cited by this head, opened at `2fd255d` (Tau Ceti) and `1b1ccf4b` (Mathlib) and compared with the README's glosses (38):
- **Mathlib.** `embedding_of_isReal_apply` (`InfinitePlace/Basic.lean:244`); `Module.finrank_baseChange` (`Dimension/Constructions.lean:375`); `LinearMap.injective_iff_surjective_of_finrank_eq_finrank` (`FiniteDimensional/Lemmas.lean:204`); `injective_iff_map_eq_zero` (additive form of `Algebra/Group/Hom/Basic.lean:181`); `radical_eq_ker_polarBilin` (`QuadraticForm/Radical.lean:126`).
- **Localization.** `atFinitePlaceProd`, `atRealPlaceProd` (`Operations.lean:41`, `:53`, isometry equivalences); `atFinitePlace_neg`, `atRealPlace_neg` (`:180`, `:188`); `atFinitePlace_smul`, `atRealPlace_smul` (`:212`, `:222`, scaling by the image of the scalar); `atFinitePlaceWeightedSumSquares`, `atRealPlaceWeightedSumSquares` (`Localization.lean:265`, `:278`); `Nondegenerate.atRealPlace`, `Equivalent.atRealPlace` (`:177`, `:207`); `formClass_atFinitePlace` (`Classification.lean:87`), `formClass_atRealPlace` (`Localization.lean:230`); `discr_atFinitePlace` (`Discriminant.lean:42`).
- **Predicates.** `LocallyEquivalent.locallyRepresents` (`Predicates.lean:243`); `LocallyRepresents.locallyRepresentsScalar` (`:257`); `LocallyRepresentsScalar.of_represents` (`:189`); `isLocallyIsotropic_smul_sq_prod` (`:105`, on `(-a) • sq ⊥ W`, no `a ≠ 0` needed).
- **Local form theory.** `IsometryEquiv.represents_iff` (`Representation.lean:184`); `not_anisotropic_prod_of_represents_neg` (`:220`, carries `a ≠ 0`); `IsRepresentedBy.exists_equivalent_prod` (`:277`, `[Invertible 2]`, `Q₁` finite-dimensional, both regular: as glossed); `nondegenerate_smul_iff` (`Radical.lean:151`, `IsUnit a`); `nondegenerate_smul_sq` (`:677`); `Nondegenerate.exists_isUnit` (`:530`, `[Nontrivial V]`, matching "on a nonzero space"); `Nondegenerate.prod` (`:60`); Witt cancellation (`Witt/Cancellation.lean:196`, regular finite-dimensional summand) and Witt extension (`Witt/Extension.lean:50`, only the subspace regular, so 6.2's local step needs no regularity of `R_v`).
- **Correction planes.** `CorrectionPlanes.lean:69`, `:74`: `![1, -b]` and `![a, -(a*b)]` for `a b : Kˣ`.
- **Classes and Witt rings.** `formClass_eq_iff` (`RegularFormClass/Basic.lean:677`), `formClass_prod` (`:726`), `formClass_presentedForm` (`:703`), `formClass_smul` (`TensorProduct.lean:421`, `a : Kˣ`); `wittClass_eq_zero_iff` (`Witt/Ring.lean:364`, anisotropic part zero), `wittClass_surjective` (`:371`), `add_neg_one_mul` (`:108`, equals `rank x • H`); `wittDecomposition` (`Witt/Decomposition.lean:262`); `globalToLocal_wittClass_formClass` (`WittLocalization.lean:188`).
- **Ideles.** `ideleClassNormMap_surjective_of_forall_range_normUnits_eq_top` (`Ideles/Norm/Surjective.lean:198`): `K L : Type*`, a `Finset` of finite places, `normUnits` range `⊤` outside it, conclusion surjectivity. It matches the gloss and steps 3–4 of 4.2.
- **72:1 reduction.** `exists_locallyRepresents_prod` (`PrescribedLocalForms.lean:140`, `K : Type` at `:69`) returns `W`, `a`, `b`, the local representation, and "global representation ⇒ a regular `Q` on `Fin I.rank → K` with `Q.globalInvariants hQ = I`". That is exactly what the new route of 7.3 uses; `exists_isLocalRealization` is at `LocalRealization.lean:405`.
- **No pin proves a headline.** `WittLocalization.lean:40` still says injectivity is the Hasse–Minkowski theorem for Witt classes and does not prove it; no injectivity statement for `globalToLocal` exists; `exact?` closes none of the eight.

**Sources: the seeded sample** (`milne-cft`; printed page = PDF page − 9, checked at page markers 238, 245, 264, 265).

| Target | Locator | Checked at | Result |
|---|---|---|---|
| 4.1 | no literature locator | 20 pinned declarations on its *Needs:* line | present at `2fd255d`/`1b1ccf4b` |
| 4.2 | VIII Thm 1.1 (`n = 2`), Ex. 1.3, p. 229 | lines 10384–10386, 10397 | `n = 2` needs only `−1 ∈ K`; "all but finitely many primes" ✓; exercise ✓ |
| 4.3 | VIII Thm 3.1, p. 234 | lines 10629–10631 | cyclic `L/K`; norm at every `v` ⇒ global norm ✓ |
| 5.1 | Thm 3.5, p. 235; Prop. 3.7(b),(c), p. 236; proof, p. 237 | lines 10686–10689, 10698–10702, 10772–10778 | ✓; the source prints "Theorem 1.1" for `n = 3, 4` (Source issues) |
| 5.5 | O'Meara 66:1 | not readable | Milne Thm 3.5(b), line 10689, states it |
| 6.1 | O'Meara 66:3 | not readable | Milne Cor. 3.6, line 10694, states it |
| 6.2 | O'Meara 66:3 | not readable | — |
| 6.3 | O'Meara 66:4 | not readable | Milne Thm 6.3, line 11619, states it |
| 7.2 | O'Meara 72:1; Thm 6.10, Prop. 6.11, p. 255; p. 256 | lines 11745, 11758–11760, 11781–11790 | local classes ✓; "determine `t` when `r ≤ 3` but not for `r > 3`" ✓; Thm 6.12, line 11792, states 72:1 |
| 7.3 | O'Meara 72:1 | — | as 7.2 |
| 7.4 | Thm 6.3, p. 252; Thm 6.10, p. 255 | lines 11619, 11745; Remark 6.6, line 11677 | ✓; factor `(−1, d)_v` between the conventions ✓ |
| 8.1 | O'Meara 66:5 | not readable | follows from Milne 6.3 and 6.10 |
| 8.2 | Thm 6.3, p. 252; Prop. 6.2, p. 251 | lines 11619, 11574 | ✓ |
| 8.3 | Thm 6.3, p. 252 | line 11619 | ✓ |
| 8.4 | Thm 6.3, p. 252 | line 11619 | ✓ |

**Adversarial table** (values computed this round).

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conventions: discriminants | `H`, `⟨1,1⟩` | `(−1)^(2·1/2) = −1`; `H`: plain `[−1]`, signed `[1]`; `⟨1,1⟩`: plain `[1]`, signed `[−1]` | as stated | none |
| Conventions: `i<j` vs `i≤j` | `H` over `ℝ`; `⟨3⟩` over `ℚ₃` | `(1,−1) = 1` vs `(1,1)(1,−1)(−1,−1) = −1`; `1` vs `(3,3)_3 = (3,−1)_3 = −1` | differ by `(−1,d)_v` | none |
| Conventions: real Hasse sign | rank 4, `q = 0, 2, 4` | `(−1)^0 = 1`, `(−1)^1 = −1`, `(−1)^6 = 1` | `(4,0)`, `(0,4)` not separated | none |
| Conventions: zero form | rank 0 | record `(0, [1], 1, 0)`; `1 ≤ 0` false | realized, not admissible | none |
| 4.1 finite places | conjugation on `ℚ(i)`, `𝔭 = (2+i)` | mod `2−i`: `i ≡ 2`, `2+i ≡ 4 = 2²`; `v_𝔭(2+i) = 1` | correspondence must follow `σ` | none |
| 4.1 real embeddings (new Check) | `ℚ(√5)`, `σθ = 1−θ`, `w'`: `θ ↦ 1.618…` | `w'.comap σ`: `θ ↦ −0.618…`; `σQ = ⟨1, 1−θ, 1−θ⟩` at `w'`: signs `+,−,−`, index `1`; `Q` at `w'`: `3` | as stated | none |
| 4.2 [headline] | `ℚ`: `a = 4, −1, 2, −4`; `ℚ(i)`: `−1` | `4 = 2²`: T/T; `−1`, `−4` nonsquare at `p ≡ 3 (4)`: F/F; `2` nonsquare at `p ≡ ±3 (8)`: F/F; `−1 = i²`: T/T | holds | none |
| 4.2, `n = 8` | `16` over `ℚ` | `x⁸−16 = (x²−2)(x²+2)(x²+2x+2)(x²−2x+2)`; `(−1/p)(2/p)(−2/p) = (4/p) = 1`; `16^(1/8) = √2 ∉ ℚ` | false, exceptional set `{2}` | none |
| 4.2, steps 3–4 lemma | `E = ℚ(√a)`, `v ∉ S` split | `K_v ⊗ E ≅ K_v × K_v`, norm `(x,y) ↦ xy` onto: `normUnits` range `⊤` | hypothesis of the Tau Ceti lemma met | none |
| 4.2, step 3 caution | idele `(√2, 1, 1, …)`, `S = {∞}` | `α = 1`: `√2 > 0` a real square; equality would need `α = √2 ∉ ℚ` | remark correct | none |
| 4.3 | `d = −1`: `a = 5, 3, −1`; `d = 2`: `a = −1` | `5 = 1+4`: T/T; `(−1,3)_3 = −1`: F/F; `−1 < 0`: F/F; `1−2 = −1`: T/T | agree | none |
| 5.1 binary | `⟨1,1⟩` over `ℚ(i)`, `ℚ`; `⟨1,−2⟩` | `1+i² = 0`: T/T; fails at `ℚ₃`: F/F; `2` nonsquare at `3`: F/F | holds, finite places suffice | none |
| 5.1 ternary scaling | `⟨a₁,a₂,a₃⟩ = ⟨1,1,−2⟩`, `⟨1,1,−3⟩` | `d = −a₂/a₁ = −1`, `a = −a₃/a₁ = 2 = 1²+1²`: T/T; `a = 3`, `(−1,3)_v = −1` at `2`, `3`: F/F | holds | none |
| 5.5 [headline] | rank 0; `⟨5⟩`; `H`; `5⟨1⟩`; `⟨1,1,1,1,−1⟩` | F/F; F/F; T/T; F (`ℝ`)/F; `1−1 = 0`: T/T | holds | none |
| 5.5 higher-rank step | `U = ⟨1,1⟩`, `W = ⟨1,−1,1⟩` | `x = 0`: `b = 0`, singular; `x = (1,0)`: `b = 1`, `W(0,1,0) = −1` | `U(x) ≠ 0` needed | none |
| 6.1 [headline] | `⟨1,1⟩`: `a = 3, −1, 5`; `H`: `7`; zero form: `1` | F/F; F/F; T/T; `4²−3² = 7`: T/T; F/F | holds | none |
| 6.2 [headline] | `⟨3⟩→⟨1,1⟩`; `⟨5⟩→H`; rank 2 into rank 1 | F/F (`ℚ₃`); `(3,−2)`: `9−4 = 5`: T/T; F/F | holds | none |
| 6.2 local step | `⟨c⟩ ⊥ Q'_v ↪ ⟨c⟩ ⊥ R'_v` | polar complement of `(1,0)`: `2ct = 0 ⇒ t = 0`, so `0 × R'_v` | Witt extension suffices | none |
| 6.3 [headline] | `H` vs `⟨2,−2⟩`; `⟨1⟩` vs `⟨−1⟩`; `⟨1,1,−3⟩` vs `⟨1,1,−1⟩` | `2−2 = 0`, isotropic regular plane: T/T; F/F (`ℝ`); F/F (`ℚ₃`) | holds | none |
| 7.2 | `⟨−1,−1,−1⟩`; rank 3, `d = [1]`, `R = ⟨1,1,1⟩`, `s_2 = −1` | `(−1)³ · (−1)^3 = 1`; `(−1) · 1 = −1` | hypotheses hold / fail as stated | none |
| 7.2 correction planes | `P = ⟨1,−b⟩`, `P' = ⟨a,−ab⟩` | `[−b] = [−a²b]`; `(a,−ab) = (a,−a)(a,b) = (a,b)`; `(1,−b) = 1` | sign flips where `(a,b)_v = −1` | none |
| 7.3 [headline] | `⟨1⟩`; zero record; `ℚ(√5)` record | admissible, realized; rank 0 not admissible; `(−1)·1·(−1) = 1`, admissible | as stated | none |
| 7.3, ⚠ remark | `V` with `V_v ≅ U_v`, `d(I) = [1]` | `d(V)/d(I)` a square in every `K_v` ⇒ square by 4.2, `S = ∅` | remark correct; record route avoids it | none |
| 8.1 [headline] | `⟨1,1,−1⟩` vs `⟨1,2,−2⟩`; `⟨1,1⟩` vs `⟨2,2⟩`; zero forms | `[−1] = [−4]`, signs `1`, index `2`; `(2,2)_v = 1` as `4−2 = 2`, `(x+y)²+(x−y)² = 2x²+2y²`; equal | holds | none |
| 8.2 | `⟨1,−1,2,−2⟩`; `⟨1,1⟩`; rank 3 | class `2 • H`, local classes `2 • H`: T/T; `[1] ≠ [−1]`: F/F; odd: F | holds; step for `m · H` needs the lemmas of R03 | R03 |
| 8.2, Witt classes | `Q = ⟨1,1,−3⟩`, `R = ⟨1,1,−1⟩` | `Q ⊥ −R`: class `[Q] + ⟨−1⟩[R]`; not hyperbolic at `ℚ₃` | both sides F | none |
| 8.3 [headline] | `[⟨1,1⟩]`, `[H]`, `[⟨1⟩]` | real signature `2 ≠ 0`; `0`; odd dimension | consistent with injectivity | none |
| 8.4 [headline] | the proof term | `(hasseMinkowski_equivalent Q hQ R hR).2 h` elaborates (exit 0) | holds from 6.3 | none |

**Headline theorems.** 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1, 8.3 and 8.4: all nine are stated in `Suggested.lean`, none through a stand-in, and the module docstring says each is statable.

**Overlaps, citations, ownership.**
- `scratch/overlaps.md`: no cited id dropped, none defined only by an open revision, none dropped here and cited elsewhere; one conflicting head, #1215 (R02). The worker's citation resolver lists nothing unresolved.
- Citations of this roadmap on main still resolve: Integral Lattices `README.md:477`, `:916` (`hasseMinkowski_equivalent`, `equivalent_of_locallyEquivalent`), `:2306` (6.3); `Completed/OrthogonalSpinGroups/README.md:947`, `:965`; Classical Arithmetic Completion `:165`, `:189` (4.4, resolved by the map lines).
- This head adds no new object: every change since `5cb0012` is a route, a gloss or a *Needs:* entry. The ownership grep of earlier rounds (namespace and theorem names only on main, #1200 and #1215) was not repeated beyond that.

## Not verifiable

- **O'Meara, *Introduction to Quadratic Forms*** (`omeara`, uncertified): 58:7, 65:15, 66:1, 66:3, 66:4, 66:5, 71:19, 71:19a, 72:1 are cited by locator only. Milne independently states 65:15, 66:1, 66:3 for scalars, 66:4 and 72:1; 66:3 for forms (6.2) and 58:7 rest on O'Meara alone.
- **Serre, *A Course in Arithmetic*** (`serre`, uncertified): the `i < j` convention is confirmed through Milne Remark 6.6 (`milne-cft` line 11677); the other three locators are not verifiable.
- **Elaboration at main's pins** was not rerun; the file is unchanged since the rounds that ran it there.
- **#1215's description** was not readable with this job's tools; that it names no order is carried from the review of #1215.

## Source issues

- **Misprint** in milne-cft at Chapter VIII, proof of Theorem 3.5(b), p. 237: the source says the three- and four-variable cases follow from Proposition 3.7(c),(d) and Theorem 1.1; it should be Theorem 3.1, the Hasse norm theorem, since 3.7(c),(d) reduce isotropy to norms; affects nothing.
