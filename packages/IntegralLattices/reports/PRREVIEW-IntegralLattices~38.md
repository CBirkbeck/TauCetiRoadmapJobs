# Review of IntegralLattices (pull request #617 at b22a824)

**Verdict:** needs changes

This is an incremental re-review of 61 changed lines since `a208c66`:
- `TauCetiRoadmap/IntegralLattices/README.md`: 51 lines.
- `TauCetiRoadmap/IntegralLattices/Suggested.lean`: 10 lines, all in the module docstring. No declaration changed.

The pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`) have not changed.

Status of the previous findings:
- R04 and R05 are repaired.
- R01–R03 are not repaired and are raised again here as R01–R03. They are all about how this pull request is packaged, not about the roadmap's mathematics.
- One new finding, R04, is in the docstring text this round added.

All four findings are P3. None is P1 or P2.

## R01 (P3) — Gate `outside-folder`: files under `Completed/` still change in this pull request

- **Location.** `git diff --stat origin/main...HEAD` still lists files outside the three folders this pull request owns:
  - `Completed/LocalFieldsRamification/{COMPLETION.md, README.md, Suggested.lean}`;
  - `Completed/LocalGaloisGroups/{README.md, Suggested.lean}`.
- **Claim.** These files are not in the IntegralLattices, ClassFieldTheory or QuadraticFormInvariants folders. So the gate fails, and this folder cannot be accepted while it does.
- **Witness.**
  - The worker's gate at `b22a824` prints `outside-folder=4 … FAIL`.
  - My rerun prints `outside-folder=9`: the same four `Completed/` files plus five files of the two sibling folders. Every other scanner is 0.
- **Repair.** Do one of the following, then rerun the gate until `outside-folder` lists only files of folders this pull request owns:
  - name `Completed/LocalFieldsRamification` and `Completed/LocalGaloisGroups` as this pull request's own folders, so that each gets its own review; or
  - move those changes to a separate pull request. The title and description are about LocalFieldsRamification.

## R02 (P3) — #1411 rewrites this folder differently, and no merge order is stated

- **Location.** The description's revision paragraph: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1410".
- **Claim.** #1411 changes both IntegralLattices files, and its head conflicts with this one. Nothing says which pull request is rebased onto the other.
- **Witness.** `roadmaps overlaps IntegralLattices` (index of 2026-11-09T22:45:27Z) reports "#617 and #1411 conflict in … `TauCetiRoadmap/IntegralLattices/README.md`, `TauCetiRoadmap/IntegralLattices/Suggested.lean`". The description is unchanged.
- **Repair.**
  1. Rebase onto main first (R03).
  2. State in the description which of #617 and #1411 merges first, and that the other rebases onto it.
  3. Do not restate in one what the other already changes.

## R03 (P3) — The head still does not merge with main: both IntegralLattices files conflict with main's version from #1239

- **Location.** `TauCetiRoadmap/IntegralLattices/README.md` and `Suggested.lean`. This round's changed passages lie inside conflict hunks:
  - the Scope list at README.md:58–64;
  - the paragraph after the §*From Tau Ceti* table at 518–533;
  - the OTM consumer bullet at 3514–3516.
- **Claim.** The merge base is still `eaf17b1`. Main's `47fc6a3` ("IntegralLattices: classification and mass prerequisite constructions", #1239) rewrote both files. Main's `Suggested.lean` has 65 declaration lines and this head's has 37, so the head cannot merge as it stands.
- **Witness.** `git merge-tree --write-tree origin/main b22a824` prints "CONFLICT (content)" for both files: 83 hunks in the README and 14 in `Suggested.lean`.
- **Repair.**
  1. Rebase onto current main (`3090489`) and resolve the 83 + 14 hunks.
  2. For each declaration or section of main's version that the rebased head retires, say in §*Scope and ownership* where it now lives: a native name, or a target of this roadmap.
  3. Rerun the gate, `lake env lean` and `roadmaps overlaps`.
  4. Test: `git merge-tree --write-tree origin/main <new head>` prints no CONFLICT line.

## R04 (P3) — The new docstring sentence on the binary dictionary leaves out its two restrictions

- **Location.** `Suggested.lean:74–76`: "the dictionary between proper classes of primitive binary forms and the Picard and narrow Picard groups of quadratic orders, with its composition laws (`posDefProperClassEquivPic`, `properClassEquivNarrowPic`, B2, B3)".
- **Claim.** The sentence makes the dictionary's domain *all* proper classes of primitive binary forms. The native declarations it names are narrower:
  - for `Δ < 0`, only the positive definite classes;
  - for `Δ > 0`, only nonsquare `Δ`.

  The README's B3 says that the positive definite restriction "is needed". The square branch has no `Pic` (B1, B3).
- **Witness.**
  - `Δ = −4`: `x² + y²` and `−x² − y²` are 2 proper classes, but `#Pic ℤ[i] = 1`. The domain of `posDefProperClassEquivPic 4` is `PosDefProperClass 4`, with 1 class.
  - `Δ = 25`: `properClassEquivNarrowPic` requires `[Fact (¬ IsSquare D)]` (`Ideal/Narrow/Equivalence.lean:106`).
- **Repair.** Replace the clause with: "the dictionary between proper classes of primitive binary forms of nonsquare discriminant `Δ` (the positive definite ones when `Δ < 0`) and the Picard and narrow Picard groups of the quadratic orders, with its composition laws (…)".
  - Tested: `Δ = −4` gives `1 = 1`; `Δ = 12` gives `h⁺ = 2` on both sides; `Δ = 25` is excluded.
  - Optional: the paragraph at `Suggested.lean:129–135` now repeats this sentence, and either one can be deleted.

## Previous findings

- R01 — not repaired: the worker's gate at `b22a824` prints `outside-folder=4`, listing the three `Completed/LocalFieldsRamification` files and `Completed/LocalGaloisGroups/README.md`. Raised again as R01.
- R02 — not repaired: the description still reads "…which merge first: #1410", and `roadmaps overlaps` still reports #617 and #1411 conflicting in both IntegralLattices files. Raised again as R02.
- R03 — not repaired: `git merge-tree --write-tree origin/main b22a824` prints CONFLICT for both files (83 + 14 hunks, merge base `eaf17b1`). Raised again as R03.
- R04 — repaired: README.md:59–61 now lists "B1, B4 … in full" and "a part of each of 1G, 3D, 3I, B2, B3, B5, N0, N1, 4A, 5A, 5J, 7C and 7E". The OTM bullet (3515–3516) now points to "the two lists of §*Scope and ownership*".
- R05 — repaired: README.md:1906 now reads "**4A. Class sets and class numbers.**" and row 2191 reads "T `isometryClass`, …; L 4C for `spn`; L B2, B5 for the binary counts".

## Verified sound

**Gate, dependencies and build.**
- Gate:
  - the worker's run at `b22a824`: every scanner is 0 except `outside-folder=4` (R01); `build=0`;
  - my rerun: every scanner is 0 except `outside-folder=9`, which also counts the sibling folders.
- The dependency check (`gate --depcheck … --movable`) prints `depcheck: 236 roadmaps, 2292 edges, 0 problem(s)`. There is no UPWARD and no CYCLE line.
- `lake env lean …/Suggested.lean` exits 0 in 8 s. Its only diagnostics are 15 `declaration uses sorry` warnings, at lines 271, 290, 314, 331, 377, 384, 405, 418, 432, 447, 459, 478, 491, 553 and 580. That is the previous set shifted by 6 lines.
- The 36 `#check @…` lines of `signatures/SignatureCheck.lean` elaborate with 0 errors, and no section binder is lost.
- The Lean diff since `a208c66` touches only docstring lines 73–80. So the previous one-tactic probe still applies: all 15 `sorry`s fail `first | rfl | infer_instance | simp | trivial | decide | aesop`, and none is padding. The list of headline theorems and the docstring's list of what is not statable are unchanged.

**The changed passages against the milestone bodies and the pin.**
- **"Exactly the milestones of the first list other than 7G carry "(native)"" (README.md:63–64).** `grep '(native)'` finds exactly 21 milestone headings: 1H:699, 1I:727, 1L:741, 2F:783, 2G:808, 3A:842, 3B:875, 3C:912, 3F:995, B1:1207, B4:1557, 4E:2086, 4F:2099, 4G:2152, 6B:2489, 6C:2503, 6D:2522, 6G:2629, 6H:2651, 7A:2830 and 9B:3159. These are exactly the first list without 7G (21 of 21). The `###` headings N0 (1799) and N1 (1867) carry no tag.
- **The two partial lists agree.** Scope (60–61) and the paragraph after the table (522–530) name the same 13 labels in the same order.
- **Each new native claim was checked against its body and at the pin.** Paths are under `TauCeti/` unless given in full.
  - **B1 in full.** `binaryOrder` (`NumberTheory/IntegralLattice/Binary/Order.lean:43`). Row 1776 reads "native (…); no prerequisites here".
  - **B4 in full.**
    - `specialOrthogonalGroupEquivNormOneUnits` (`Binary/NormOne.lean:72`; finrank 2, `L.form ≠ 0`, a `MulEquiv` onto `QuadraticOrder.normOneUnits`);
    - `index_specialOrthogonalGroup_eq_two_iff_reflected` (`Binary/Isometry.lean:127`).
  - **B2: the dictionary and the split class group.**
    - `posDefProperClassEquivPic` (`BinaryQuadraticForm/Ideal/PicEquivalence.lean:55`; discriminant `−n`, `n ≠ 0`);
    - `properClassEquivNarrowPic` (`Ideal/Narrow/Equivalence.lean:106`; `0 < D`, `¬ IsSquare D`);
    - `splitProperClassEquivUnits` (`Split/Composition.lean:133`, `SplitProperClass s ≃* (ZMod s)ˣ`).
  - **B3: the principal genus theorem at a fundamental discriminant.** The body (1432–1440) says the ideal-theoretic statement is native in both signs and keeps the comparison with 3F as the target. At the pin, in `NumberTheory/Multiquadratic/Quadratic/`:
    - `isSquare_iff_forall_genusCharFunNarrowClassGroupHom_eq_one` (`GenusCharacter/PrincipalGenus.lean:150`; `K = ℚ(√d)` with `d` squarefree, on `NarrowClassGroup K`, so in both signs);
    - `mem_range_…_iff` (`GenusCharacter/PrincipalGenus.lean:79`);
    - `exists_…_eq` (`GenusCharacter/Independence.lean:97`);
    - `narrowTwoRank_eq_ncard_ramifiedPrimes_sub_one` (`TwoRank.lean:239`).
  - **B5.**
    - `posDefProperClass_mk_primitiveReducedForms_bijective` (`PrimitiveReduced.lean:111`);
    - `picClass_primitiveReducedForms_bijective` and `nat_card_pic` (`Ideal/ClassNumber.lean:93`, 104; for `Δ = −n`);
    - `exists_finset_forall_exists_smul_mem` (`FiniteClasses.lean:48`, hypothesis `D ≠ 0`, both branches);
    - the square count through `splitProperClassEquivUnits`.

    The remaining target is the `Δ > 0` cycles (1624–1627).
  - **N1: the values at odd primes not dividing `det L`.** The body (1869–1882) and the native declarations:
    - `map_spinorNorm_comap_integralOrthogonalSubgroup_eq_unitSquareClasses` (`NumberTheory/QuadraticForm/OrthogonalGroup/Integral/SpinorNorm.lean:360`; `p ≠ 2`, an orthogonal basis of unit norms, `[Nontrivial ι]`);
    - `localSpinorNormImage_eq_bot_of_finrank_le_one` (`SpinorNormImage.lean:99`);
    - `eventually_…` (`Integral/CompactOpen.lean:152`);
    - `isOpen_…` (`SpinorNormImage.lean:88`).

    The remaining targets are the images at `p ∣ 2 det L`.
  - **5A: the unimodular case.** `sameGenus_iff_of_isUnimodular` (`NumberTheory/IntegralLattice/UnimodularGenus.lean:48`: signatures equal and parities agree) and `sameGenus_of_isEven_of_isUnimodular` (`EvenUnimodularGenus.lean:58`). The remaining target is Corollary 1.9.4 in general.
  - **4A.** It keeps `cls ⊆ spn ⊆ gen` as its target (1915–1916). Its heading, its row (2191) and its *Needs* now agree.
- **"The rows of §*From Tau Ceti* name the declarations that supply each of them."** Every label added this round appears in the "Consumed by" column:
  - B1: rows 455 and 487–489;
  - B2: rows 454, 487, 488, 491 and 492;
  - B3: rows 490–494;
  - B4: rows 487, 490 and 491;
  - B5: rows 487 and 492;
  - N1: rows 484 and 485, which name the N1 theorems above;
  - 5A: row 500, which names both unimodular theorems.
- **The ⚠ paragraph of Layer B (1186–1192)** repeats the Scope list's Layer B part word for word.
- **`Suggested.lean:73–80`.** All six names it adds exist at the pin, at the lines above. The B4 clause pairs `SO(L)` with the index criterion, so together they describe `O(L)`. R04 is the one defect.

**Cross-roadmap citations resolved.**
- OrthogonalTamagawaAndLatticeMass at its open head (`e35529e`) cites IntegralLattices:
  - §§4A–4C and N0–N1 (line 189), 2G, 3F, 7A and 7C (305), B1/B2 (372), B2/B3/B4 (421), B2/B3/B4/B7/B8 (453), and B1–B8 with 2C, 3, 4B, 7A, 7C and 7E (470);
  - 4D, 7B, 7H and 7I only as its own labels (lines 9, 187, 209, 673).

  The edited bullet now covers every native milestone OTM cites, because it points to the two Scope lists.
- `overlaps.md`:
  - no cited id is dropped by an open pull request or defined only by an open revision, and this pull request drops no id that other roadmaps cite;
  - #1187 (a pin bump) changes this folder without a conflict;
  - #1411 is R02.
- `citations.md` lists 13 Lean names "found nowhere" (README 672–674, 2262, 2292, 2582–2584, 3008–3017). All are in text this diff leaves untouched, and the gate's `readme-ids-missing` is 0.
- The changed text adds no object, so there is nothing new to check for duplication or ownership.

**Adversarial table.**
- Rows marked *new* were computed this round, for the changed passages.
- Rows marked *r37* are carried from `PRREVIEW-IntegralLattices~37`, which carried its *r35* rows, for statements this diff leaves untouched.

| Statement | Instances | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| Scope "first list" against "(native)" headings (*new*) | all bold milestone headings | 21 tagged headings; 21 labels in the list besides 7G; symmetric difference empty | holds | none |
| B3 principal genus, fundamental `Δ < 0` (*new*) | `Δ = −84` (χ₃, χ₇, δ; `N = −21 ≡ 3 (mod 4)`) | reduced forms `(1,0,21)`, `(3,0,7)`, `(2,2,11)`, `(5,4,5)`, so `h = 4`; representing `1`, `19`, `23`, `5`, the tuples are `(+,+,+)`, `(+,−,−)`, `(−,+,−)`, `(−,−,+)`; `2^{μ−1} = 4` genera of one class; `ker Φ = 1 = C²` | holds | none |
| B3 principal genus, fundamental `Δ > 0` (*new*) | `Δ = 12` (χ₃, δ) | `x² − 3y²` represents `1`, tuple `(+,+)`; `−x² + 3y²` represents `−1`, tuple `(−,−)`; `h⁺ = 2 = 2^{μ−1}`; `C² = 1` | holds | none |
| B5 native counts (*new*) | `Δ = −23`; `Δ = −84`; `Δ = 25`; `Δ = 1`; `Δ = 0` | `#Pic = 3 = #` reduced forms; `4 = 4`; `φ(5) = 4` forms `(0,5,c)`; `φ(1) = 1`; `Δ = 0` excluded by `hD : D ≠ 0` | holds | none |
| N1 native value at odd `p ∤ det L` (*new*) | `⟨1⟩ ⊕ ⟨1⟩` at `p = 3`; `⟨1⟩` at `p = 3` | `θ(s_{e₁} s_{e₁+e₂}) = 1·2 = 2`, a nonsquare unit, so `H₃` has order 2 = the unit square classes (of 4 classes); rank 1: `H₃ = 1` | holds | none |
| 5A unimodular case (*new*) | `E₈²`/`D₁₆⁺`; `I₈`/`E₈` | signatures `(16,0)` = `(16,0)`, both even, so same genus; `(8,0)` = `(8,0)`, parities differ, so different genera | holds | none |
| B4 in full (*new*) | `!![4,1;1,6]`; `!![2,1;1,12]`; `A₂`; `U` | `(2,1,3)` and `(2,−1,3)` both reduced, so `[O:SO] = 1`; `(1,1,6) ~ (1,−1,6)`, so `[O:SO] = 2`; `#SO(A₂) = #ℤ[ω]ˣ = 6`, `#O = 12`; `SO(U) = {±1}`, `#O(U) = 4` | holds | none |
| Docstring binary dictionary (*new*) | `Δ = −4`; `Δ = 12`; `Δ = 25` | 2 proper classes against `#Pic ℤ[i] = 1`; `2 = h⁺ = 2`; 4 classes, no `Pic`, `¬ IsSquare` required | fails as worded | R04 |
| Docstring ring class field (*new*) | `Δ = −23` | 3 positive definite classes `= [H:K] = 3` | holds | none |
| 4A partly native (r37) | genus of `!![4,1;1,6]`; `⟨1⟩` | `h⁺ + a = 3 + 1 = 4 = 2h`; `1 + 1 = 2·1`; `2 ≤ 3 ≤ 4` | holds | none |
| 5J necessity native (r37) | `(1;1,0,1)`; `(0;4,0,0)` | `⟨2⟩`, `δ = 1`; clause 4 needs `8 ∣ 4`, false | holds | none |
| B3 characters at 2 (r37) | `Δ = −8, −24, −16, −32, −12, 24, 8, 12` | `δε`, `ε`, `δ`, `{δ,ε}`, none, `δε`, `ε`, `δ` | holds (576/576) | none |
| B3 step 1 factorization (r37) | `Δ = −36, 45, −128` | `δ`; `χ₅`; `δε` | holds | none |
| B3 step 3 (r37) | `Δ = −4, 45`; `Δ = −3, 96, 60` | `[SO:SO²] = 2`, `4`; `2 = 2¹`, `8 = 2³`, `8 = 2³` | holds | none |
| B3 step 4, genus count (r37) | `Δ = 96, 60, 180, 45, 12, −24` | `h⁺`/genera/ambiguous: `4/4/4`, `4/4/4`, `2/2/2`, `2/2/2`, `2/2/2`, `2/2/2` | holds | none |
| B3 split remark (r37) | `Δ = 25` | 2 involutions against `2^{μ−1} = 1` | nonsquare hypothesis present | none |
| B1 `disc N_L = −4 det L` (r37) | `A₂`; `U`; `!![3,1;1,4]` | `−12 = −4·3`; `4 = −4·(−1)`; `−44 = −4·11` | holds | none |
| B2 sign clause, definite restriction (r37) | `Δ = 12`; `±(x²+y²)` | `h⁺ = 2`, `h = 1`; 2 against 1 | holds | none |
| B3 ring class field (r37) | `Δ = −23` | `3 = [H:K]` | holds | none |
| B6 integral points (r37) | `Δ = −4`; `12`; `U` | `{±1,±i}`; infinite (`2+√3`); `{±1}` | holds | none |
| B7 volumes (r37) | `Δ = −4`; `12`; `U` | `π/2`; `log(2+√3) = 1.31696`; 1 | holds | none |
| B8 masses (r37) | `A₂`; genus of `!![4,1;1,6]` | `1/12`; `1/4 + 1/2 = 3/4 = h⁺/(2w)` | holds | none |
| N0 determinant `−1` (r37) | `⟨4⟩`@2; `U`@2; `⟨1⟩⊕⟨2⟩`@3 | `s_e = −1`; swap; `s_{e₁+e₂}(e₁) ∉ L₃` | holds | none |
| 4B classes / proper classes (Lean, r37) | `⟨1⟩`; genus of `!![4,1;1,6]` | 1 = 1; 2 = 2, 3 = 3 | holds | none |
| 5A `sameGenus_iff_of_isEven` (Lean, r37) | `E₈²`/`D₁₆⁺`; `⟨2⟩⊕⟨−2⟩`/`U(2)` | true/true; false/false | holds | none |
| 5B (Lean, r37) | `⟨6⟩`@3; `(1,0,q₁^{(3)}(3))`; `(0,2,·)` | `6 = 6`; false/false; true/true | holds | none |
| 5G 1.12.2, 1.12.4 (Lean, r37) | `S = 0`; `⟨2a⟩ ↪ U` | `8 ∣ l₊−l₋`; `e + af` primitive of norm `2a` | holds | none |
| 5J sufficiency (Lean, r37) | `(1;1,0,1)`; `(0;4,0,0)` | `⟨2⟩`; clause 4 fails | agrees | none |
| 6A (Lean, r37) | `U⊕E₈⊕E₈(−1)`/`U⁹`; `U`/`⟨1⟩⊕⟨−1⟩` | `(9,0,9)` both; parities differ | holds | none |
| 6E (Lean, r37) | `D₁₆E₈`/`E₈³`; Leech | 720 = 720 roots, multisets differ; no norm-2 vectors | holds | none |
| 7E (Lean, r37) | `n = 0,1,2,3` | `vol SO = 1, 1, 2π, 8π²`; `vol O(1) = 2` | holds | none |
| 7C stabilizer index (r37) | `⟨a⟩`; rank 0 | 2; 1 | holds | none |

**Remark (untouched text, no change asked).** README.md:1384–1385 says the Kronecker character is a product "of a proper subset in general". At `Δ = −12`, `−16` and `−27` it uses every assigned character, so "in general" should be read as "possibly".

## Not verifiable

- **The seeded sample B1–B8 against its sources.** No locator in Layer B changed this round, so the sample does not fall in the changed text. Its native claims are confirmed at the pin above. Its sources cannot be read legally:
  - Cox, *Primes of the form x² + ny²* (B2 Theorem 7.7, B3 Theorem 3.15, B4 Theorem 3.9, B5 Theorems 2.8 and 2.13): a paywalled text that is not in the manifest, and the README marks it uncertified.
  - Cohen, GTM 138, §§5.2 and 5.6: recorded as uncertified.
  - Cassels, *Rational Quadratic Forms*, Chapter 13 (B6): marked uncertified, not in the cache.
  - Conway–Sloane, *Low-dimensional lattices IV* (B8): waived.
- **Elsewhere.** Kawauchi–Kojima (1G) is uncertified, and Cassels, *An Introduction to the Geometry of Numbers*, Chapter VIII (2F), is uncertified.

## Source issues

- none
