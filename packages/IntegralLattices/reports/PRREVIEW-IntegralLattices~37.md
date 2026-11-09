# Review of IntegralLattices (pull request #617 at a208c66)

**Verdict:** needs changes

This is an incremental re-review: 22 changed lines since `adfe4b1`, all in `TauCetiRoadmap/IntegralLattices/README.md`. `Suggested.lean`, `lake-manifest.json` and the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`) have not changed. None of the previous findings R01–R03 is repaired, so they are raised again here as R01–R03. The repair also introduced two new findings, R04 and R05. All five findings are P3; none is P1 or P2.

## R01 (P3) — Gate `outside-folder`: files under `Completed/` still change in this pull request

- **Location.** `git diff --stat origin/main...HEAD` lists files outside the three folders this pull request owns:
  - `Completed/LocalFieldsRamification/{COMPLETION.md, README.md, Suggested.lean}`;
  - `Completed/LocalGaloisGroups/{README.md, Suggested.lean}`.
- **Claim.** These files lie outside the IntegralLattices, ClassFieldTheory and QuadraticFormInvariants folders. So the gate fails, and while it fails this folder cannot be accepted.
- **Witness.**
  - The worker's gate at `a208c66` prints `outside-folder=4 … FAIL`; every other scanner, including `build`, is 0.
  - My rerun prints `outside-folder=9`: the same four `Completed/` files, plus five files of the two sibling folders this pull request owns.
- **Repair.** Do one of the following, then rerun the gate until `outside-folder` lists only files of folders this pull request owns:
  - name `Completed/LocalFieldsRamification` and `Completed/LocalGaloisGroups` as this pull request's own folders, so that each gets its own review; or
  - move those changes to a separate pull request. The title and description are about LocalFieldsRamification.

## R02 (P3) — #1411 rewrites this folder differently, and no merge order is stated

- **Location.** The description's revision paragraph: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1410".
- **Claim.** #1411 (a draft) changes both IntegralLattices files, and its head conflicts with this one. Nothing says which pull request is rebased onto which.
- **Witness.** `roadmaps overlaps IntegralLattices` (index of 2026-11-09T21:18:22Z) reports "#617 and #1411 conflict in … `TauCetiRoadmap/IntegralLattices/README.md`, `TauCetiRoadmap/IntegralLattices/Suggested.lean`". The description is unchanged.
- **Repair.**
  1. First rebase onto main (R03).
  2. Then state in the description which of #617 and #1411 merges first, and that the other rebases onto it.
  3. Do not restate in one what the other already changes.

## R03 (P3) — The head still does not merge with main: both IntegralLattices files conflict with the version main merged in #1239

- **Location.** `TauCetiRoadmap/IntegralLattices/README.md` and `Suggested.lean`. All three passages changed this round lie inside conflict hunks, on this head's side. In the merged tree:
  - the new Scope paragraph is at line 86, in the hunk opening at 75;
  - the reworded paragraph after the §*From Tau Ceti* table is at line 606 (hunk at 596);
  - the reworded OTM consumer bullet is at lines 4472–4473 (hunk at 4466).
- **Claim.**
  - The merge base is still `eaf17b1`.
  - Main's `47fc6a3` ("IntegralLattices: classification and mass prerequisite constructions", #1239) rewrote both files. For example, main's `Suggested.lean` has 62 declarations, and this head's has 35.
  - So the head cannot merge as it stands.
- **Witness.** `git merge-tree --write-tree origin/main a208c66` prints "CONFLICT (content)" for both files: 83 hunks in the README and 14 in `Suggested.lean`.
- **Repair.**
  1. Rebase onto current main (`3090489`) and resolve the 83 + 14 hunks.
  2. For each declaration or section of main's version that the rebased head retires, say in §*Scope and ownership* where it now lives: a native name, or a target of this roadmap.
  3. Rerun the gate, `lake env lean` and `roadmaps overlaps`.
  4. Test the repair: `git merge-tree --write-tree origin/main <new head>` must print no CONFLICT line.

## R04 (P3) — The new list of native milestones in §*Scope and ownership* leaves out Layer B

- **Location.** README.md:58–63. The paragraph says that "Many milestones of the layers below are proved in Tau Ceti at the pin":
  - in full: "1H, 1I, 1L, 2F, 2G, 3A, 3B, 3C, 3F, 4E, 4F, 4G, 6B, 6C, 6D, 6G, 6H, 7A and 9B", plus 7G in ranks 0 and 1;
  - in part: "1G, 3D, 3I, 4A, 5J, N0, 7C and 7E".

  The edited OTM consumer bullet (3508–3511) also has a native list, and it too has no Layer B label.
- **Claim.**
  - §*Scope and ownership* is the README's one place for "already in the library". Its list says the rest of each partly native milestone is a target here.
  - Layer B's own text says Tau Ceti proves B1 and B4 in full, and parts of B2, B3 and B5. None of the five labels is in the Scope list.
  - So the list gets these milestones wrong. B1 and B4 have no target here, yet they look like targets. The native parts of B2, B3 and B5 are not shown as native.
  - The OTM bullet also leaves out N0's native stabilizer comparison and Layer B, although OTM cites both: its README cites "§§4A–4C and N0–N1" (its lines 50 and 189) and "B1/B2" and "B2/B3/B4" (lines 372 and 421).
- **Witness.**
  - README.md:1182–1184: "Tau Ceti proves B1 and B4 in full, the form–ideal dictionary and the split class group of B2, the composition laws and the ring class field of B3, and the reduced forms and class counts of B5".
  - The B1 and B4 headings (1201, 1551) carry "(native)".
  - Rows 1770 and 1773 read "native (…); no prerequisites here".
  - At the pin:
    - `binaryOrderEquivProductOfSq` (`Binary/Order.lean:141`);
    - `index_specialOrthogonalGroup_eq_two_iff_reflected` (`Binary/Isometry.lean:127`);
    - `posDefProperClassEquivPic` (`Ideal/PicEquivalence.lean:55`);
    - `posDefProperClassEquivGal` (`Ideal/RingClassField.lean:83`);
    - `nat_card_pic` (`Ideal/ClassNumber.lean:104`).
- **Repair.**
  - In README.md:59–61, add B1 and B4 to the "in full" list, and B2, B3 and B5 to "a part of each of".
  - In the paragraph after the §*From Tau Ceti* table (519–526), add Layer B's native parts in its words: "the form–ideal dictionary and split class group of B2, the composition laws and ring class field of B3, the reduced forms and class counts of B5". Or make that paragraph point to the ⚠ paragraph at 1181–1185.
  - In the OTM bullet (3510–3511), add "the stabilizer comparison of N0, B1, B4 and the native parts of B2, B3 and B5". Or replace the parenthetical with "every milestone §*Scope and ownership* names as native". That makes the two lists unable to drift apart.
  - Test: every label whose heading carries "(native)" (1H, 1I, 1L, 2F, 2G, 3A, 3B, 3C, 3F, B1, B4, 4E, 4F, 4G, 6B, 6C, 6D, 6G, 6H, 7A, 9B) must then appear in the Scope list.

## R05 (P3) — 4A is now listed as partly native, but its heading still marks it native

- **Location.** README.md:1900: "**4A. Class sets (native).**". The changed passages at 61 and 523 now list 4A as partly native ("the class sets, class numbers and their relations of 4A").
- **Claim.**
  - The README marks a milestone "(native)" in its heading exactly when nothing in it is a target. Every other partly native milestone has an untagged heading: 1G (641), 3D (938), 3I (1059), N0 (1793), 5J (2405), 7C (2847), 7E (2947), and B2, B3 and B5.
  - 4A keeps a target: "What remains a target is the inclusion `cls ⊆ spn ⊆ gen` once 4C defines the middle term" (1909–1910).
  - So the repair corrected the two lists but not the heading. The heading now contradicts both of them.
- **Witness.**
  - README.md:1900 against 1909–1910 and line 61.
  - The 4A dependency row (2185) already lists "L 4C for `spn`".
- **Repair.** Drop "(native)" from the 4A heading. For example: "**4A. Class sets, and their place between the class and the genus.**" Then the heading agrees with lines 61 and 523 and with row 2185.

## Previous findings

- R01 — not repaired: the worker's gate at `a208c66` still prints `outside-folder=4`. It lists the three `Completed/LocalFieldsRamification` files and `Completed/LocalGaloisGroups/README.md`. Raised again as R01.
- R02 — not repaired: the description still reads "…which merge first: #1410", and `roadmaps overlaps` still reports #617 and #1411 conflicting in both IntegralLattices files. Raised again as R02.
- R03 — not repaired: `git merge-tree --write-tree origin/main a208c66` prints CONFLICT for both files: 83 + 14 hunks, merge base `eaf17b1`. This round's three changed passages lie inside conflict hunks. Raised again as R03.

## Verified sound

**Gate, dependencies and build.**
- Gate:
  - the worker's run at `a208c66`: every scanner is 0 except `outside-folder=4` (R01); `build=0`;
  - my rerun: every scanner is 0 except `outside-folder=9`, which also counts the two sibling folders this pull request owns.
- The dependency check (`gate --depcheck … --movable`) prints `depcheck: 236 roadmaps, 2288 edges, 0 problem(s)`. There is no UPWARD and no CYCLE line.
- `lake env lean …/Suggested.lean` exits 0 in 10 s. The only diagnostics are 15 `declaration uses sorry` warnings, at lines 265, 284, 308, 325, 371, 378, 399, 412, 426, 441, 453, 472, 485, 547 and 574.
- The 36 `#check @…` lines of `signatures/SignatureCheck.lean` elaborate with 0 errors. For example, `twoElementaryLatticeWithInvariants_of_twoElementaryAdmissible : ∀ (δ : ZMod 2) (tp tm a : ℕ), TwoElementaryAdmissible δ tp tm a → TwoElementaryLatticeWithInvariants δ tp tm a`. No section binder is lost.
- `Suggested.lean` is byte-identical to `adfe4b1`, at the same pins. So the previous round's one-tactic probe still applies: all 15 `sorry`s fail `first | rfl | infer_instance | simp | trivial | decide | aesop`, and none is padding.

**The changed passages, checked against the milestone bodies.**
- **The "in full" list (README.md:59–61).** Each of the 19 labels, and 7G for ranks 0 and 1, was checked against its milestone's own text. Each body states that nothing is a target, or only the rank-2 case for 7G:
  - 1H:704, 1I:726, 1L:742, 2G:812, 3A:862–863, 3B:892, 3C:920, 3F:1001;
  - 4E:2082, 4F:2096, 4G:2160;
  - 6B:2487, 6C:2503, 6D:2525, 6G:2632, 6H:2651;
  - 7A:2833, 9B:3165, 7G:3063;
  - 2F (778–788) states only the native inequality.

  That is 20 of 20 consistent. The only defect is what the list leaves out (R04).
- **"The rows of §*From Tau Ceti* name the declarations".** Each listed label appears in the "Consumed by" column of at least one row, for example 4E at rows 486 and 501, 6H at 507, 9B at 509 and 513, and 5J at 503.
- **The two lists agree with each other.** The Scope paragraph (58–63) and the paragraph after the table (517–526) list the same full and partial milestones.
- **The "partly native" claims.** Each is checked against the pin and the remaining target:
  - **4A.** At the pin:
    - `genusClasses` (`TauCeti/NumberTheory/IntegralLattice/ClassNumber.lean:76`);
    - `classNumber` (same file, line 144);
    - `genusProperClasses` and `properClassNumber` (`ProperClassNumber.lean:75`, 153);
    - `properClassNumber_add_card_eq_two_mul_classNumber` (line 217), with hypotheses `0 < finrank ℚ V` and `L.genusClasses.Finite`, as README 1907 says;
    - `classNumber_le_properClassNumber` (line 234) and `properClassNumber_le_two_mul_classNumber` (line 243), with no hypothesis.

    The remaining target is `cls ⊆ spn ⊆ gen` (1909).
  - **5J.** `TwoElementaryLatticeWithInvariants.twoElementaryAdmissible` (`TauCeti/LinearAlgebra/IntegralLattice/TwoElementary.lean:303`) takes a `TwoElementaryLatticeWithInvariants` (a `def`, line 285) and returns `TwoElementaryAdmissible` (a `structure`, line 81). The converse is `Suggested.lean:426`. The module docstring (Suggested.lean:77–78) and the docstring of the sufficiency theorem (Suggested.lean:423) already call the necessity half native.
- **Layer B declarations opened at the pin.** These are in `TauCeti/NumberTheory/IntegralLattice/Binary/` unless another path is given (cited in R04):
  - `binaryNormForm` (`NormForm.lean:43`) and `binaryDiscriminant` (`NormForm.lean:177`);
  - `binaryProperClass` (`Orientation.lean:95`);
  - `binaryOrder`, `binaryNumberFieldOrder`, `binaryNumberFieldOrder_conductor` and `binaryOrderEquivProductOfSq` (`Order.lean:43`, 106, 124, 141);
  - `specialOrthogonalGroupEquivNormOneUnits` (`NormOne.lean:72`);
  - `index_specialOrthogonalGroup_eq_two_iff_reflected` (`Isometry.lean:127`);
  - `index_specialOrthogonalGroup_eq_two_iff_narrowPicClass_sq_eq_one` and `IsPosDef.index_specialOrthogonalGroup_eq_two_iff_picClass_sq_eq_one` (`Ambiguous.lean:55`, 79);
  - in `TauCeti/NumberTheory/BinaryQuadraticForm/`:
    - `posDefProperClassEquivPic` (`Ideal/PicEquivalence.lean:55`);
    - `properClassEquivNarrowPic` (`Ideal/Narrow/Equivalence.lean:106`);
    - `splitProperClassEquivUnits` (`Split/Composition.lean:133`);
    - `posDefProperClassToPic_mk_mul_of_united` (`Ideal/Composition.lean:192`);
    - `properClassToNarrowPic_mk_mul_of_united` (`Ideal/Narrow/Composition.lean:131`);
    - `posDefProperClassEquivGal` (`Ideal/RingClassField.lean:83`);
    - `posDefProperClass_mk_primitiveReducedForms_bijective` (`PrimitiveReduced.lean:111`);
    - `picClass_primitiveReducedForms_bijective` and `nat_card_pic` (`Ideal/ClassNumber.lean:93`, 104);
    - `exists_finset_forall_exists_smul_mem` (`FiniteClasses.lean:48`);
  - `ringClassArtinEquiv` (`TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean:178`).
- **Also opened at the pin:** `infinite_isometry_of_isIndefinite` and `…_of_anisotropic` (`IndefiniteIsometry.lean:171`, 124), and `finite_genusClasses_of_finrank_eq_two` (`Binary/ClassNumber.lean:93`). These are the 4E and 4F claims the "in full" list relies on.

**Cross-roadmap citations resolved.**
- OrthogonalTamagawaAndLatticeMass, at its open head: its README cites IntegralLattices §§2G, 3C, 3E, 3F, 3I, 4A–4C, N0–N1, 5A, 6C, 6D, 6E, 6G, 7A, 7C, 7E, 7G and B1–B8, with the 4E rank-≥ 3 half and 4D as its own (lines 50, 187–189, 263–305, 372, 421, 470). This matches the bullet's consumed set "Layers 0–4, 5A, 6C–6E, 6G, 7A, 7C, 7E, 7G, B1–B8 and 9B". Its native parenthetical is incomplete (R04).
- `overlaps.md`:
  - it reports no id dropped by an open pull request, no id only an open revision defines, and no id of this roadmap that this pull request drops;
  - #1187 (a Tau Ceti pin bump across many roadmaps) changes this folder but is not reported as conflicting, so it needs no stated order;
  - #1411 is R02.
- The changed text introduces no new object, so there is nothing new to check for duplication or ownership.

**Adversarial table.**
- Rows marked *new* were computed this round, for the changed passages.
- Rows marked *r35* are carried from the previous report (`PRREVIEW-IntegralLattices~35`) for statements this diff leaves untouched.

| Statement | Instances | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| Scope "in full" list (*new*) | the 19 labels and 7G ranks 0–1, against their bodies | 20/20 bodies state that no target remains (7G: only rank 2) | holds | none |
| Scope list against "(native)" headings (*new*) | the 21 tagged headings other than 4A | 19 listed; B1 (1201) and B4 (1551) missing; B2, B3, B5 partly native (1182–1184), missing from the partial list | fails | R04 |
| 4A partly native (*new*) | genus of `!![4,1;1,6]` (`Δ = −23`); `⟨1⟩` | `h⁺ + a = 3 + 1 = 4 = 2·2 = 2h`; `1 + 1 = 2 = 2·1` (rank 1 > 0, `[O:SO] = 2`); `h = 2 ≤ h⁺ = 3 ≤ 4` | holds; target 1909 remains | R05 (heading) |
| 5J necessity native, sufficiency target (*new*) | `⟨2⟩` = `(1;1,0,1)`; `(0;4,0,0)` | `q(1/2) = 1/4 ∉ ½ℤ/ℤ` so `δ = 1`; clauses 1, 2 and 5 hold (`1 ≤ 1`, `2` even, `1 ≡ 1 (mod 8)`), the others are vacuous; `(0;4,0,0)`: clause 4 needs `8 ∣ 4`, false | holds | none |
| OTM bullet native list (*new*) | OTM README lines 50, 189, 372, 421 | cited natives: 2G, 3A–3C, 3F, 3I, 4A, N0, 6C, 6D, 6G, 7A, 7C, 7E, 7G, 9B, B1–B5; listed: all but N0, B1–B5 | incomplete | R04 |
| B3 characters at 2 (r35, bf) | `Δ = −8, −24, −16, −32, −12, 24, 8, 12` | principal values mod 8 → `δε`, `ε`, `δ`, `{δ,ε}`, none, `δε`, `ε`, `δ`; rule agrees | holds (576/576) | none |
| B3 step 1 factorization (r35, bf) | `Δ = −36, 45, −128` | `(−36\|m) = δ(m)`; `(45\|m) = χ₅(m)`; `(−128\|m) = δε(m)` | holds (576/576) | none |
| B3 step 3, part 1 (r35) | `x²+y²`, `g = !![0,1;1,0]`; `(5,5,−1)` | eigenvalues `±1`, `(1,1) ⊥ (1,−1)`; `s_{e₁}(e₂) = e₂ − e₁` | holds | none |
| B3 step 3, part 2 (r35, bf) | `Δ = −4`; `Δ = 45` | `[SO:SO²] = 2`; `[SO:SO²] = 4`, 2 of 4 with `a > 0` | holds | none |
| B3 step 3 count (r35, bf) | `Δ = −3, 96, 60` | `2 = 2¹`; `4+4 = 8 = 2³`; `4+4 = 8 = 2³` | holds (283/283) | none |
| B3 step 4, genus count (r35, bf) | `Δ = 96, 60, 180, 45, 12, −24` | `h⁺`/genera/ambiguous: `4/4/4`, `4/4/4`, `2/2/2`, `2/2/2`, `2/2/2`, `2/2/2` | holds | none |
| B3 Checks `Δ = −8, −24, 45, −20, −36` (r35) | listed forms | `h = 1 = 2⁰`; `(+,+)`/`(−,−)`; `h⁺(45) = 2`; `h = 2`; image `= ker δ` | holds | none |
| B3 split remark `Δ = 25` (r35) | `(ℤ/5ℤ)ˣ` | 2 involutions against `2^{μ−1} = 1` | nonsquare hypothesis needed, present | none |
| B1 `disc N_L = −4 det L` (r35) | `A₂`; `U`; `!![3,1;1,4]` | `−12 = −4·3`; `4 = −4·(−1)`; `−44 = −4·11` | holds | none |
| B2 oriented sign clause (r35) | `Δ = 12`: `±(x² − 3y²)` | ideals `𝒪₁₂`, `√3𝒪₁₂`; `h⁺ = 2`, `h = 1` | holds | none |
| B2 positive-definite restriction (r35) | `±(x²+y²)` | 2 proper classes against `#Pic ℤ[i] = 1` | holds | none |
| B3 ring class field (r35) | `Δ = −23` | 3 reduced forms `= [H:K] = 3` | holds | none |
| B4 `[O:SO]` (r35) | `!![2,1;1,12]`; `!![4,1;1,6]`; `A₂`; `U` | `4/2`; `2/2`; `12/6`; `4/2` | holds | none |
| B5 class counts (r35) | `Δ = −23, −44, 25` | 3; 3; `φ(5) = 4` | holds | none |
| B6 integral points (r35) | `Δ = −4`; `12`; `U` | `{±1,±i}`; infinite (`2+√3`); `{±1}` | holds | none |
| B7 volumes (r35) | `Δ = −4`; `12`; `U` | `π/2`; `log(2+√3) = 1.31696`; 1 | holds | none |
| B8 masses (r35) | `A₂`; genus of `!![4,1;1,6]` | `1/12`; `1/4 + 1/2 = 3/4 = h⁺/(2w)` | holds | none |
| N0 determinant `−1` (r35) | `⟨4⟩`@2; `U`@2; `⟨1⟩⊕⟨2⟩`@3 | `s_e = −1`; swap; `s_{e₁+e₂}(e₁) ∉ L₃` | holds | none |
| 4B classes / proper classes (Lean, r35) | `⟨1⟩`; genus of `!![4,1;1,6]` | 1 = 1; 2 = 2 and 3 = 3 | holds | none |
| 5A `sameGenus_iff_of_isEven` (Lean, r35) | `E₈²`/`D₁₆⁺`; `⟨2⟩⊕⟨−2⟩`/`U(2)` | true/true; false/false | holds | none |
| 5B `padicDiscriminant_eq_squareClass_gramDet` (Lean, r35) | `⟨6⟩`@3; `⟨2⟩`, `⟨10⟩`@2 | `6 = 6`; excluded by `hp` | holds | none |
| 5B `exists_evenLattice_iff` / `_of_lt` (Lean, r35) | `(1,0,q₁^{(3)}(3))`; `(0,2,·)`; `(1,1,0)` | false/false; true/true; `U` | holds | none |
| 5G 1.12.2, 1.12.4 (Lean, r35) | `S = 0`; `⟨2a⟩ ↪ U` | `8 ∣ l₊−l₋`; `e+af` primitive of norm `2a` | holds | none |
| 5J sufficiency (Lean, r35) | `(1;1,0,1)`; `(0;4,0,0)` | `⟨2⟩`; clause 4 fails | agrees | none |
| 6A even/odd (Lean, r35) | `U⊕E₈⊕E₈(−1)`/`U⁹`; `U`/`⟨1⟩⊕⟨−1⟩` | `(9,0,9)` both; parities differ | holds | none |
| 6E (Lean, r35) | `D₁₆E₈`/`E₈³`; Leech | 720 = 720 roots, multisets differ; no norm-2 vectors | holds | none |
| 7E (Lean, r35) | `n = 0,1,2,3` | `vol SO = 1, 1, 2π, 8π²`; `vol O(1) = 2` | holds | none |
| 7C stabilizer index (r35) | `⟨a⟩`; rank 0 | 2; 1 | holds | none |

**Remark (untouched text, no change asked).** As the previous report noted, README.md:1370–1371 reads "of a proper subset in general". At `Δ = −12`, `−16` and `−27` the product uses every assigned character, so "in general" must be read as "possibly".

## Not verifiable

- **Cox, *Primes of the form x² + ny²*** (B2 Theorem 7.7, B3, B4 Theorem 3.9, B5 Theorems 2.8 and 2.13): not in the manifest and not retried, since this review edits no manifest. The changed passages do not cite it.
- **Cohen, GTM 138, §§5.2 and 5.6** (B2, B5): recorded as uncertified; not read.
- **Cassels.** *Rational Quadratic Forms*, Chapter 13 (B6), and *An Introduction to the Geometry of Numbers*, Chapter VIII (2F): not in the cache; not read.
- **Conway–Sloane, the mass formula paper** (B8): waived. **Kawauchi–Kojima** (1G): uncertified.
- **The seeded sample B1–B8 against its sources.** This incremental round does not cite any of them in the changed passages, so their locators were not reread. The native declarations they name are confirmed at the pin above.

## Source issues

- none
