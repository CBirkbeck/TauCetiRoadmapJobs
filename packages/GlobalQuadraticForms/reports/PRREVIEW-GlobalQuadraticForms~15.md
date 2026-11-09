# Review of GlobalQuadraticForms (pull request #1200 at 40494aa)

**Verdict:** needs changes

This is an incremental re-review of `TauCetiRoadmap/GlobalQuadraticForms/` at `40494aa10828a28812bb127ca8a1e234cb98f09f`: 104 lines changed since `15f0a4c`, the head the previous review read. Four of the six previous findings are repaired (R02, R04, R05, R06) and the repairs introduce no new problem. Two findings remain, both carried from the previous review:

- one P1, re-raised: the branch still pins Tau Ceti `358314d`, where sixteen cited declarations do not exist, and it does not merge with main;
- one P3: the pull request still conflicts with #1215 in this folder, and its description states no order and does not describe this head.

## R01 (P1) — The branch still pins Tau Ceti `358314d`, where 16 cited declarations do not exist, and it does not merge with main

Re-raised: R01 (repair report GATE~2, "Which pin").

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/README.md:140–141`: "There is no roadmap supplier. Every input below is a declaration of Mathlib or Tau Ceti at the pins." The contracts at :154–335 and the *Needs:* lines of 4.2, 4.3, 7.2, 7.3, 8.2 and 8.3 rest on this sentence.

**Claim.** Every cited input exists at this branch's pins.

**Witness.** `lake-manifest.json` at this head still pins Tau Ceti `358314d` and Mathlib `f6090c7`; main pins `2fd255d` and `1b1ccf4`. `origin/main` (`bfff257`) is not an ancestor of the head. `git merge-tree --write-tree HEAD origin/main` reports one content conflict, in `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean`. Four of the sixteen names the previous review listed, re-checked at `358314d` by grep over `TauCeti/`: `finrank_le_index_range_ideleClassNormMap`, `WittRing.globalToLocal`, `hilbertSymbol_productFormula` and `exists_pair_hilbertSymbol_eq_ite` occur in no file (the only hit for `isAdmissible_globalInvariants` is the different declaration `isAdmissible_globalInvariants_iff`, `FormInvariants.lean:165`). All exist at `2fd255d`, for example `FirstInequality.lean:108` and `WittLocalization.lean:48`.

**Why the reason fails.** The repair report is right that a repair job may not edit the manifest. The finding does not ask for a manifest edit: it asks for a merge of `origin/main`, which brings main's manifest with main's history, and whose only conflict is inside this folder. The repair commit `40494aa1` did not make that merge, so every value of the witness is unchanged since the previous review.

**Repair.**
1. Merge `origin/main` into the branch.
2. Resolve the one conflict by keeping this branch's `Suggested.lean` (and `README.md`).
3. Rerun the gate and its targeted build at main's pins.

**Tested.** `git merge-tree --write-tree -X ours HEAD origin/main` succeeds; the resulting tree differs from `origin/main` only in this folder's two files and carries main's `lake-manifest.json`. `Suggested.lean` uses only names whose statements are identical at both pins (the five imported modules and `WittRing.baseChange`, as the previous review checked), so it elaborates after the merge.

## R02 (P3) — #1215 changes this folder differently, the two heads conflict, and the description neither states an order nor describes this head

**Location.** The pull request's description. It is unchanged since the previous review: it names no order with #1215, describes "the rank-four plain/signed discriminant comparison" as the change, says the theorem statements are unchanged and that the branch "retains its `Completed.NumberFieldArithmetic.Suggested` import".

**Claim.** The description describes this change, and the change can merge independently of #1215.

**Witness.** `git merge-tree --write-tree HEAD 47ea9559` (the head of #1215, merge base `5f47f60`) reports content conflicts in both `TauCetiRoadmap/GlobalQuadraticForms/README.md` and `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean`; `git diff --stat` between the two heads on this folder is 82 and 30 changed lines. #1215's copy states 8.3 on `TauCeti.WittRing.globalToLocal` while this head keeps the inline map at `Suggested.lean:146–153`; the two READMEs word the 4.1, 5.1 and 8.4 repairs differently. At this head `Suggested.lean:3–8` imports Mathlib and five Tau Ceti modules and no roadmap module.

**Repair.**
1. State in the description which of #1200 and #1215 merges first (after R01's merge), and that the other rebases onto it and keeps in this folder only what the first does not change.
2. Rewrite the description to describe this head: both files rebuilt on Tau Ceti carriers; `Suggested.lean` with nine declarations and no roadmap import; Layers 0–3 and 4.4 resolved by the section map at README:53–75; the repairs of this round (seven transported inputs, split 5.1 *Needs*, `QuadraticMap.Nondegenerate`, the `SO` translation owner).

**Tested.** The conflict is reproduced from the two heads alone; nothing in this folder's text is at issue.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d`; `origin/main` is not an ancestor; `Suggested.lean` conflicts with main; the sampled names are absent at the pin. Re-raised as R01.
- R02 — repaired: "seven of the eight Tau Ceti inputs … the remaining one, the first inequality, is applied only to a model in `Type` inside 4.2" at :22–24, :93–95, :148–152, :341–343, :356–361 and :399–404. The first inequality's binders at main's pin (`FirstInequality.lean:103–109`: `K L : Type`, `[IsGalois K L] [IsCyclic Gal(L/K)]`) match the new wording, and 4.2's route at :444–446 already reduces to `K` in `Type`.
- R03 — not repaired: the description is the same text; #1215's head `47ea9559` conflicts in both files. Restated as R02.
- R04 — repaired: the *Needs* of 5.1 at :560–570 is split into the binary case (4.2 with `S = ∅`, the LowRank criterion, `discr_atFinitePlace`, the hyperbolic-class lemma), the ternary case (4.3, Mathlib diagonalization) and the quaternary consequence (ternary case over every number field in the universe of `K`, the quaternary theorem); all names exist at both pins (below).
- R05 — repaired: :96–97 names `QuadraticMap.Nondegenerate` "(written `Q.Nondegenerate`, a `QuadraticForm` being a `QuadraticMap` with values in its ring)", and :161–164 adds the "From Mathlib" bullet with the two conditions, `radical_eq_ker_polarBilin` and the three instances.
- R06 — repaired: :85–87, :899–902, :939–942 and the docstring at `Suggested.lean:128–130` name Orthogonal Tamagawa and Lattice Mass as the owner of the `H¹(K, SO(Q))` translation, with Orthogonal and Spin Groups consuming 4.3 and 6.1.

## Verified sound

**Gate and dependencies.**
- The worker's gate at this head reports every check 0, `build=0`, `OK`; my rerun of the text scanners and dependency check at this head also ends `OK`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The dependency check printed exactly `depcheck: 239 roadmaps, 2320 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- There is no roadmap supplier and no `gap:` contract; no `design/plan.json` is readable, as the brief says.

**Lean at the branch pins.**
- `lake env lean` on `Suggested.lean` exits 0 with exactly 8 `sorry` warnings, at lines 51, 68, 76, 84, 93, 111, 120 and 146 (8.3 moved one line down by the longer 8.4 docstring; the only Lean change is that docstring).
- `#check @name` for all 9 declarations in one scratch file importing the roadmap's module: every elaborated type is identical to the worker's listing and matches its README statement; no binder is lost. With `pp.explicit`, `hQ` and `hR` of `equivalent_iff_globalInvariants_eq` are `QuadraticMap.Nondegenerate … Q` and `… R` (the unapplied print in the plain listing is because `Q` is the structure's implicit argument, `Radical.lean:115`).
- `example (Q : QuadraticForm ℚ (Fin 2 → ℚ)) : Q.Nondegenerate = QuadraticMap.Nondegenerate (Q := Q) := rfl` elaborates, confirming the Conventions sentence; `abbrev QuadraticForm := QuadraticMap R M R` is `Basic.lean:160`.
- One-tactic probe: no sorried statement changed since the previous review, whose probe (`rfl`, `simp`, `infer_instance`, `aesop`, `decide`, `exact?`) closed none of the 8; carried forward.
- `equivalent_of_locallyEquivalent` (8.4) remains one term from 6.3 and is kept because main cites it by name (`TauCetiRoadmap/IntegralLattices/README.md:477`, `:916`, `:1028`).

**Library declarations opened for the changed passages**, file and line at the branch pin `358314d` (identical at `2fd255d` unless noted), each also pinned by `#check @` in a scratch file after building the four missing object files `RegularFormClass.LowRank`, `Global.Discriminant`, `Global.Quaternary`, `Global.HigherRank` (31 s):
- Mathlib `QuadraticMap.Nondegenerate` (`LinearAlgebra/QuadraticForm/Radical.lean:115`): a structure with fields `radical_eq_bot` and `rank_rad_polar_le : Module.rank R Q.polarBilin.ker ≤ 1`; `radical_eq_ker_polarBilin` (`:126`) under `[Invertible (2 : R)]`. The README bullet at :161–164 states exactly these.
- Mathlib `QuadraticForm.equivalent_weightedSumSquares_units_of_nondegenerate'` (`IsometryEquiv.lean:177`): hypothesis `(associated Q).SeparatingLeft`, conclusion a unit-weighted diagonal form; the README's "associated bilinear form is separating" is exact.
- Tau Ceti `QuadraticForm.not_anisotropic_iff_discr_eq_neg_one_of_finrank_eq_two` (`RegularFormClass/LowRank.lean:177`; `:173` at main): namespace `QuadraticForm` after `end TauCeti` at `:149`; variables `[Field K] [Invertible (2 : K)]`, `hQ : Q.Nondegenerate`, `finrank K V = 2`; conclusion `discr (formClass Q hQ) = squareClass (-1)`. Matches :292–293.
- Tau Ceti `QuadraticForm.discr_atFinitePlace` (`Global/Discriminant.lean:42`): the discriminant of `Q.atFinitePlace v` equals `squareClassMap` of the discriminant of `Q`. Matches :201–202.
- Tau Ceti `TauCeti.presentedForm` (`RegularFormClass/Basic.lean:105`, `weightedSumSquares K` of the unit weights), `nondegenerate_presentedForm` (`:139`, `[Invertible (2 : K)]`), `exists_presentedForm_equivalent` (`:641`, `[Invertible (2 : K)]`, finite-dimensional, `hQ : Q.Nondegenerate`). Matches :302–305.
- Tau Ceti `not_anisotropic_of_isLocallyIsotropic_quaternary` (`Global/Quaternary.lean:137`): `hternary` ranges over `L : Type u` (the universe of `K`, `:67`) and `p : RegularFormPresentation L` with `p.1 = 3`, on `presentedForm p`; `not_anisotropic_of_isLocallyIsotropic_of_five_le_finrank` (`Global/HigherRank.lean:87`): `ih` over `p : RegularFormPresentation K` with `p.1 + 1 = finrank`, on `presentedForm p`. Both state the lower-rank case for diagonal forms, as :302 says, and the quaternary consequence in 5.1 needs the ternary case "over every number field in the universe of `K`" (:569–570).
- Tau Ceti `exists_apply_ne_zero_locallyRepresentsScalar_neg` (`Global/ApproximateValue.lean:61`) is used by `not_anisotropic_prod_of_forall_represents` (`:142`, `:152`), which `not_anisotropic_prod_of_isLocallyIsotropic` (`HigherRank.lean:62`, `:72`) uses, which the higher-rank theorem uses (`:105`); `finite_setOfPred_anisotropic_atFinitePlace` is used at `HigherRank.lean:73`. So the moved sentence at :604–607 ("inputs of the Tau Ceti proof of that step, not of this target") is correct.
- Tau Ceti `QuadraticMap.Equivalent.globalInvariants_eq` (`Global/FormInvariants.lean:193`): `Q.Equivalent R → ∀ hQ hR, Q.globalInvariants hQ = R.globalInvariants hR`; the forward direction of 8.1, so the *Needs* at :839–840 (7.4 and this lemma; 7.3 only for the bijection) is exact.
- Tau Ceti at main's pin: `finrank_le_index_range_ideleClassNormMap` (`FirstInequality.lean:108`, variables `:66` and `:103–104`: `K : Type`, `L : Type`, `[IsGalois K L] [IsCyclic Gal(L/K)]`), matching :271–273 and the new 4.1 text.

**Cross-roadmap citations resolved for the changed passages.**
- `Completed/OrthogonalSpinGroups/README.md` on main: `:49` names `OrthogonalTamagawaAndLatticeMass` as the successor; `:925` opens its consumer contract; `:941–947` list `GlobalQuadraticForms.hasseMinkowski_equivalent` among what the successor must import; `:963–966` say that translating it into a pointed-set statement is the successor's work. The new text at :85–87, :899–902 and :939–942 says this. Remark, not a finding: the contract names 6.3 only; it does not mention 8.4 or `equivalent_of_locallyEquivalent`. 8.4 is the direction of 6.3 that the translation uses, and its named consumer on main is Integral Lattices (:943–944), which the README already says.
- OrthogonalTamagawaAndLatticeMass is not on main (merge order line 149) and its pull request is not among the sibling checkouts this brief gives, so ownership against that head was not checked; this README gives it nothing to supply and cites it only as a consumer.
- MetaplecticAutomorphicForms (#1063) cites "GlobalQuadraticForms Layer 3", which this pull request drops; the section map at :64–67 gives the Tau Ceti names for 3.1–3.3, so the dropped id resolves (as the previous review found).
- `roadmaps resolve` found no citation or Lean name missing anywhere.

**Sources (seeded sample where the changes fall).** The changes touch no locator. I re-read the three Milne locators the changed sections cite: Theorem 3.1, p. 234 (milne-cft line 10629, cyclic extension, norm everywhere locally implies norm globally; 5.1 ternary and 4.3); Proposition 3.7(b), (c), p. 236 (lines 10700–10702, binary isotropy iff `a` square, ternary isotropy iff `b` a norm from `k(√a)`; 5.1); Theorem 6.3, p. 252 (lines 11619–11621, forms equivalent at every `v` are equivalent; 8.4). Each supports the statement as written. The other sample targets (4.2, 5.5, 6.1–6.3, 7.2–7.4, 8.1–8.3) are unchanged and were verified by the previous review.

**Adversarial table.** Rows for the changed statements are computed here; rows for untouched statements are carried from the previous report (r11).

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 4.1 (changed): seven of the eight `Type`-only inputs reach every universe | `K : Type 1`, `L = K(√-1)` | the seven inputs mention only `K`, its places, forms and symbols; the eighth, `finrank_le_index_range_ideleClassNormMap`, takes `K L : Type`, `[IsGalois K L] [IsCyclic Gal(L/K)]` and concludes `finrank K L ≤ (ideleClassNormMap K L).range.index` | 7 transported, 1 applied in `Type` by 4.2 (:444–446) | none (R02 repaired) |
| 4.1 (changed): route of 4.2 after transport | `K : Type 1`, `a` square at every `v ∉ S` | model `K₀ : Type`; `a₀`, `σS`; `E₀ = K₀(√a₀) : Type`, degree `2`, cyclic; surjective norm gives index `1 < 2` | contradiction obtained in `Type`; conclusion `IsSquare a₀` transports back | none |
| Conventions (changed): `QuadraticMap.Nondegenerate` | `⟨1, -1⟩`, `⟨1, 0⟩`, zero form on `0`, over `ℚ` | polar Gram matrices `diag(2, -2)`, `diag(2, 0)`, empty; radicals `0`, `⟨e₂⟩`, `0`; `rank ker ≤ 1`: `0`, `1`, `0` | first and third satisfy both fields, second fails `radical_eq_bot` | none (R05 repaired) |
| Conventions (changed): `Q.Nondegenerate` is `QuadraticMap.Nondegenerate` | `Q : QuadraticForm ℚ (Fin 2 → ℚ)` | `rfl` proof of the equality elaborates | same predicate | none |
| 5.1 *Needs* (changed): binary case | `⟨1, 1⟩` over `ℚ(i)` and over `ℚ` | `discr = [1] = [-1]` in `ℚ(i)` since `-1 = i²`; LowRank criterion at every `v`, `discr_atFinitePlace` carries `[−1]` down, 4.2 with `S = ∅` lifts the square, hyperbolic-class lemma closes; over `ℚ` the criterion fails at `ℚ₃` | inputs listed are the inputs used | none (R04 repaired) |
| 5.1 *Needs* (changed): ternary case | `⟨1, 1, -2⟩`, `⟨1, 1, -3⟩` over `ℚ` | diagonalization by the Mathlib lemma (its `SeparatingLeft` hypothesis from regularity); `d = -1`, `a = 2 = 1² + 1²`, 4.3 both sides true; `a = 3`: `(−1, 3)₃ = −1`, both sides false | correct | none |
| 5.1 *Needs* (changed): quaternary consequence | `hternary` binder | `∀ (L : Type u) … (p : RegularFormPresentation L), p.1 = 3 → …` on `presentedForm p`; 5.1's ternary case is stated for every number field in every universe and every regular form, hence for `presentedForm p` (regular by `nondegenerate_presentedForm`) | hypothesis discharged | none |
| 5.5 *Needs* (changed) | `Q` of rank `5` over `ℚ` | the higher-rank theorem's `ih` is on diagonal forms of rank `4` over the same `K`; `exists_apply_ne_zero_locallyRepresentsScalar_neg` and `finite_setOfPred_anisotropic_atFinitePlace` are used inside its proof (`HigherRank.lean:72–73`, `ApproximateValue.lean:152`), not by 5.5 | the moved sentence is correct | none |
| 8.1 *Needs* (changed) | `⟨1, 1⟩` vs `⟨2, 2⟩` over `ℚ` | forward: `globalInvariants_eq` from the isometry `(x, y) ↦ (x + y, x − y)`; reverse: equal records, 7.4; 7.3 enters only for surjectivity onto admissible records | `7.4` and the lemma suffice for the iff | none |
| 8.4 and Scope (changed): `SO` translation owner | OSG on main `:49`, `:925`, `:941–947`, `:963–966` | successor `OrthogonalTamagawaAndLatticeMass`; the contract imports `hasseMinkowski_equivalent` and assigns the pointed-set translation to the successor | owner correctly named | none (R06 repaired) |
| Supplier pin | manifest at this head vs main | Tau Ceti `358314d` vs `2fd255d`; 4 sampled names at `0` files vs present; main not an ancestor; 1 conflict | unchanged | R01 |
| #1215 overlap | heads `40494aa` vs `47ea9559` | conflicts in both files; 82 and 30 differing lines | unchanged | R02 |
| 4.2 global square theorem [headline] | r11 row | `4 = 2²`; `−1`, `2`, `−4` fail at infinitely many primes; `16` an eighth power locally, not globally | true | carried from r11 |
| 4.3 quadratic Hasse norm adapter | r11 row | `5 = 1 + 4`; `(−1, 3)₃ = −1`; `1 − 2 = −1`; `x² + y² = −1` unsolvable in `ℝ` | both sides agree | carried from r11 |
| 5.5 isotropy [headline] | r11 row | rank 0, 1: F/F; `H`: T/T; `⟨1,1,−3⟩`: F/F at `ℚ₃`; `⟨1,1,1,1,1⟩`: F/F at `ℝ`; degenerate `⟨1, 0⟩`: T/T | holds | carried from r11 |
| 6.1 scalars [headline] | r11 row | `⟨1,1⟩` with `3, 5, −1`; zero form; `a = 0` | holds | carried from r11 |
| 6.2 forms [headline] | r11 row | `⟨3⟩ → ⟨1,1⟩` F/F; `⟨c⟩ → H`; inclusion; rank 2 into rank 1 F/F | holds | carried from r11 |
| 6.3 isometry [headline] | r11 row | `⟨1,1⟩ ≅ ⟨2,2⟩`; `⟨1⟩` vs `⟨−1⟩`; `⟨1,1,−3⟩` vs `⟨1,1,−1⟩` differ at `ℚ₃`; rank 0 | holds | carried from r11 |
| 7.2 existence | r11 row | `⟨−1,−1,−1⟩` signs; excluded rank-3 record; real rank-4 signs | correct | carried from r11 |
| 7.3 realization [headline] | r11 row | `ℚ(√5)` record; `⟨1⟩`; rank 0; rank 1 with two `−1` | correct | carried from r11 |
| 7.4 convention factor | r11 row | `⟨3⟩` over `ℚ₃`: `1` vs `−1 = (−1, d)₃` | correct | carried from r11 |
| 8.1 classification [headline] | r11 row | `[−1] = [−4]`; `(2, −2) = 1`; ranks `0 ≠ 1` | holds | carried from r11 |
| 8.2 hyperbolicity | r11 row | `⟨1,−1,2,−2⟩ ≅ 2H`; `⟨1,1⟩` not; odd rank | correct | carried from r11 |
| 8.3 Witt injectivity [headline] | r11 row | `[⟨1⟩]`, `[⟨1,1⟩]`, `[H]`, complex places | holds | carried from r11 |
| 8.4 corollary [headline] | this head | `(hasseMinkowski_equivalent Q hQ R hR).2 h` elaborates (`Suggested.lean:138`) | proved from 6.3 | none |
| Conventions: discriminants, `i<j` vs `i≤j`, `(−1, 3)` | r11 rows | `H`: plain `[−1]`, signed `[1]`; `(1,−1) = 1` vs `−1`; `(−1, 3)` is `−1` at exactly `3` and `2` | correct | carried from r11 |
| Contract: first-inequality counterexample | r11 row | `ℚ(∛2, ζ₃)/ℚ`: degree `6`, norm index `2` | correct | carried from r11 |

**Headline theorems.** The README's headlines are 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1, 8.3 and 8.4; all nine are stated in `Suggested.lean`, none changed in this round. None is native at either pin (the previous review's docstring grep; `WittLocalization.lean:40` at main's pin still says injectivity is not proved there).

**Ownership against open pull requests** was checked for the changed passages with the overlap report, `roadmaps resolve`, and the sibling checkout of #1215 (the only pull request changing this folder). The 8.4 owner question is settled against Orthogonal and Spin Groups on main; the OrthogonalTamagawaAndLatticeMass head is not among the checkouts this brief gives and was not read.

## Not verifiable

- **O'Meara, *Introduction to Quadratic Forms*** and **Serre, *A Course in Arithmetic*.** Both are settled as `uncertified` in the manifest; no changed passage adds or moves a locator into them, so nothing new was checked against them.
- **Elaboration at main's pins** (`2fd255d`, `1b1ccf4`). This review may run Lean only in this worktree at its own pins. The four newly cited Tau Ceti declarations and the first inequality were checked at main's pin by reading the source at the lines given above.

## Source issues

- none
