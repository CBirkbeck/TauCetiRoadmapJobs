# Review of IntegralLattices (pull request #617 at cca39ab)

**Verdict:** needs changes

This is an incremental re-review of the 26 lines changed since `b22a824`:
- `TauCetiRoadmap/IntegralLattices/README.md`: 3 lines, in step 1 of B3.
- `TauCetiRoadmap/IntegralLattices/Suggested.lean`: 23 lines, all in the module docstring. No declaration changed.

The pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`) have not changed. Main has moved from `3090489` to `f8836c4`.

Status of the previous findings:
- R04 is repaired, and the repair introduces no new problem.
- R01–R03 are not repaired. They are raised again here as R01–R03, with this head's witnesses. All three are about how the pull request is packaged; none is about the roadmap's mathematics.
- The changed passages contain no new defect.

All three findings are P3. None is P1 or P2.

## R01 (P3) — Gate `outside-folder`: files under `Completed/` still change in this pull request

- **Location.** `git diff --stat origin/main...HEAD` lists 5 files outside the three folders this pull request owns (958 insertions, 3167 deletions):
  - `Completed/LocalFieldsRamification/{COMPLETION.md, README.md, Suggested.lean}`;
  - `Completed/LocalGaloisGroups/{README.md, Suggested.lean}`.
- **Claim.** These files are not in the IntegralLattices, ClassFieldTheory or QuadraticFormInvariants folders. So the gate fails, and this folder cannot be accepted while it fails.
- **Witness.**
  - The worker's gate at `cca39ab` prints `outside-folder=4 … FAIL`.
  - My rerun prints `outside-folder=9`: the same four `Completed/` files plus five files of the two sibling folders. Every other scanner is 0.
- **Repair.** Do one of the following, then rerun the gate until `outside-folder` lists only files of folders this pull request owns:
  - name `Completed/LocalFieldsRamification` and `Completed/LocalGaloisGroups` as this pull request's own folders, so that each gets its own review; or
  - move those changes to a separate pull request. The title and description are about LocalFieldsRamification.

## R02 (P3) — #1411 rewrites this folder differently, and no merge order is stated

- **Location.** The revision paragraph of the description: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1410".
- **Claim.** #1411 changes both IntegralLattices files, and its head conflicts with this one. Nothing says which pull request is rebased onto the other.
- **Witness.** `overlaps.md` (index of 2026-11-09T23:46:03Z) reports that "#617 and #1411 conflict in … `TauCetiRoadmap/IntegralLattices/README.md`, `TauCetiRoadmap/IntegralLattices/Suggested.lean`", and in five other files. The description is unchanged.
- **Repair.**
  1. Rebase onto main first (R03).
  2. State in the description which of #617 and #1411 merges first, and that the other rebases onto it.
  3. Do not restate in one pull request what the other already changes.

## R03 (P3) — The head still does not merge with main: both IntegralLattices files conflict with main's version from #1239

- **Location.** `TauCetiRoadmap/IntegralLattices/README.md` and `Suggested.lean`. The merge base is still `eaf17b1`.
- **Claim.** Main's `47fc6a3` ("IntegralLattices: classification and mass prerequisite constructions", #1239) rewrote both files after the merge base. Main's `91ba40ae` touched the folder again. So the head cannot merge as it stands.
- **Witness.** `git merge-tree --write-tree origin/main cca39ab`, with `origin/main` at `f8836c4`, prints "CONFLICT (content)" for both files: 83 hunks in the README and 14 in `Suggested.lean`, as at `b22a824`.
- **Repair.**
  1. Rebase onto current main (`f8836c4`) and resolve the 83 + 14 hunks.
  2. For each declaration or section of main's version that the rebased head retires, say in §*Scope and ownership* where it now lives: a native name, or a target of this roadmap.
  3. Rerun the gate, `lake env lean` and `roadmaps overlaps`.
  4. Test: `git merge-tree --write-tree origin/main <new head>` prints no CONFLICT line.

## Previous findings

- R01 — not repaired: the worker's gate at `cca39ab` prints `outside-folder=4`, listing the three `Completed/LocalFieldsRamification` files and `Completed/LocalGaloisGroups/README.md`. Raised again as R01.
- R02 — not repaired: the description still reads "…which merge first: #1410", and `overlaps.md` still reports #617 and #1411 conflicting in both IntegralLattices files. Raised again as R02.
- R03 — not repaired: `git merge-tree --write-tree origin/main cca39ab` prints CONFLICT for both files (83 + 14 hunks; merge base `eaf17b1`). Raised again as R03.
- R04 — repaired: `Suggested.lean:74–78` now reads "proper classes of primitive binary forms of nonsquare discriminant `Δ` … onto `Pic` for the positive definite classes when `Δ < 0` … and onto `NarrowPic` for all classes when `Δ > 0`".

## Verified sound

**Gate, dependencies and build.**
- The gate:
  - the worker's run at `cca39ab`: every scanner is 0 except `outside-folder=4` (R01); `build=0`;
  - my rerun: every scanner is 0 except `outside-folder=9`, which also counts the sibling folders.
- The dependency check (`gate --depcheck … --movable --pr 617`) prints `depcheck: 236 roadmaps, 2292 edges, 0 problem(s)`. There is no UPWARD and no CYCLE line.
- `lake env lean …/Suggested.lean` finishes in 8 s with no error. Its only diagnostics are 15 `declaration uses sorry` warnings, at lines 266, 285, 309, 326, 372, 379, 400, 413, 427, 442, 454, 473, 486, 548 and 575. That is the previous set shifted by −5 lines, the docstring's net change.
- The 36 `#check @…` lines of `signatures/SignatureCheck.lean` elaborate with 0 errors, and no section binder is lost.
- No declaration changed since `b22a824`, so three earlier results still apply:
  - the one-tactic probe: all 15 `sorry`s fail `first | rfl | infer_instance | simp | trivial | decide | aesop`, so none is padding;
  - the list of headline theorems is unchanged;
  - the docstring's list of what is not statable (3E/3G and 4C) is unchanged.

**The changed docstring (`Suggested.lean:74–84`) against the pin.** Paths are under `TauCeti/NumberTheory/`.
- **`numberFieldOrder`** (`QuadraticOrder/Field.lean:39`):
  - it takes `D % 4 = 0 ∨ D % 4 = 1` and `[Fact (¬ IsSquare D)]`;
  - its value is a `NumberFieldOrder (QuadraticAlgebra ℚ D 0)`;
  - `numberFieldOrder_discr` (line 54) gives discriminant `D`.

  This matches "the order … of discriminant `Δ` in the number field `QuadraticAlgebra ℚ Δ 0`".
- **`posDefProperClassEquivPic`** (`BinaryQuadraticForm/Ideal/PicEquivalence.lean:55`) is `PosDefProperClass n ≃ Pic (numberFieldOrder (−n))`. So for `Δ < 0` the domain is the positive definite classes.
- **`properClassEquivNarrowPic`** (`Ideal/Narrow/Equivalence.lean:106`):
  - it takes `[Fact (¬ IsSquare D)]` and `0 < D`;
  - its domain is the orbits of `SL(2, ℤ)` on `primitiveForms D`, that is, all proper classes.
- **The composition laws.** `posDefProperClassToPic_mk_mul_of_united` (`Ideal/Composition.lean:192`) and `properClassToNarrowPic_mk_mul_of_united` (`Ideal/Narrow/Composition.lean:131`).
- **`posDefProperClassEquivGal`** (`Ideal/RingClassField.lean:83`) is `posDefProperClassEquivPic` followed by `(ringClassArtinEquiv _).toEquiv`.
  - `ringClassArtinEquiv : Pic O ≃* Gal(ringClassField O/K)` is in namespace `TauCeti.ClassFieldTheory` (`ClassFieldTheory/ClassFields/RingClass/Field.lean:90`, 178), as the docstring's qualified name says.
- **`specialOrthogonalGroupEquivNormOneUnits`** (`IntegralLattice/Binary/NormOne.lean:72`):
  - it takes `finrank ℚ V = 2` and `hL : L.form ≠ 0`;
  - its target is `QuadraticOrder.normOneUnits (L.binaryDiscriminant hV) _`, a subgroup of `(toSubalgebra …)ˣ`;
  - that subalgebra is `binaryOrder` by `binaryOrder_def`, which is `rfl` (`Binary/Order.lean:43`, 50).

  This matches "with nonzero form as the norm-one units of its order".
- **`index_specialOrthogonalGroup_eq_two_iff_reflected`** (`Binary/Isometry.lean:127`) is the improper-automorphism criterion.
- **The deleted paragraph.** It said that the dictionary and the ring class field are proved at the pin and not restated. The frame of the docstring's list, "proved in Tau Ceti at the pin, and so are consumed rather than stated" (line 52), now says the same. Nothing that the paragraph recorded is lost: README row 488 keeps `QuadraticAlgebra.instNumberField` and `numberFieldOrder`, and row 491 keeps the three equivalences.

**The changed README passage (B3, step 1, README.md:1384–1386).**
- The assigned characters were computed from the README's own table (README.md:1361–1365, with `N = Δ/4`), and the Kronecker character from `Δ₀` (rows in the table below).
- The parenthetical "(all, `χ₃`, at `Δ = −12`; only `δ` of `χ₃, δ` at `Δ = −36`)" agrees with the worked-example row at README.md:3391. That row gives `(−36 | ·) = δ`, with tuples `(+,+)` and `(−,+)` for `(1,0,9)` and `(2,2,5)`.
- The remark of the previous review on "a proper subset in general" is resolved: the text now says "of all of them or of a proper subset".

**Cross-roadmap citations, overlaps and ownership.**
- The changed text cites no other roadmap and adds no object. So there is nothing new to check for duplication or ownership against main or the open pull requests.
- `overlaps.md`:
  - no cited id is dropped by an open pull request or defined only by an open revision, and this pull request drops no id that other roadmaps cite;
  - #1187 (a pin bump) changes this folder without a conflict;
  - #1411 is R02.
- `citations.md` lists 13 Lean names "found nowhere" (README 672–674, 2263, 2293, 2583–2585, 3009–3018). All are in text this diff leaves untouched, and the gate's `readme-ids-missing` is 0.
- No repair report marks R01–R03 as not actionable.

**Adversarial table.**
- Rows marked *new* were computed this round, for the changed passages.
- Rows marked *r38* are carried from `PRREVIEW-IntegralLattices~38`, for statements this diff leaves untouched. Rows marked *r38←r37* are rows that report carried from `~37`.

| Statement | Instances | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| B3 step 1: the Kronecker character uses all, or a proper subset, of the assigned characters (*new*) | `Δ = −12`; `−36`; `−48`; `20`; `−84` | `N = −3`, assigned `{χ₃}`, `Δ₀ = −3`, `(−3 \| ·) = χ₃`: all. `N = −9`, `{χ₃, δ}`, `Δ₀ = −4`, `δ`: proper subset. `N = −12 ≡ 4 (8)`, `{χ₃, δ}`, `Δ₀ = −3`, `χ₃`: proper subset. `N = 5`, `{χ₅}`, `Δ₀ = 5`, `χ₅`: all. Fundamental, `δχ₃χ₇`: all | holds | none |
| B3 step 1 against worked example 3391 (*new*) | `Δ = −36`: `(1,0,9)`, `(2,2,5)` | values 1 and 5 give `(χ₃, δ) = (+,+)`, `(−,+)`; `δ ≡ +1` on both; `h = 2 = 2^{μ−1}` | agrees | none |
| Docstring binary dictionary, repaired (*new*) | `Δ = −4`; `−23`; `12`; `25` | `#PosDefProperClass 4 = 1 = #Pic ℤ[i]`; `3 = 3`; all proper classes `2 = h⁺(ℤ[√3]) = 2`; `25` excluded by "nonsquare" and by `[Fact (¬ IsSquare D)]` | holds | none (R04 repaired) |
| Docstring ring class field (*new*) | `Δ = −23` | 3 classes `(1,1,6)`, `(2,±1,3)` `= [H:K] = 3` (`finrank_ringClassField_neg_twenty_three_eq_three`, `RingClassField.lean:200`) | holds | none |
| Docstring B4: "with nonzero form" (*new*) | zero form of rank 2; `x²` (`Δ = 0`); `A₂` | `SO = SL(2,ℤ)`, nonabelian, so it is no group of norm-one units: correctly excluded. For `x²`: `SO = {!![s,0;c,s]}` and norm-one units `{±1 + yω/2}` are both `{±1} × ℤ`. For `A₂`: `#SO = 6 = #ℤ[ω]ˣ` | holds | none |
| Scope "first list" against "(native)" headings (r38) | all bold milestone headings | 21 tagged headings; 21 labels besides 7G; symmetric difference empty | holds | none |
| B3 principal genus, fundamental `Δ < 0` (r38) | `Δ = −84` | `h = 4`; tuples `(+,+,+)`, `(+,−,−)`, `(−,+,−)`, `(−,−,+)`; `ker Φ = 1 = C²` | holds | none |
| B3 principal genus, fundamental `Δ > 0` (r38) | `Δ = 12` | tuples `(+,+)`, `(−,−)`; `h⁺ = 2 = 2^{μ−1}`; `C² = 1` | holds | none |
| B5 native counts (r38) | `Δ = −23, −84, 25, 1, 0` | `3 = 3`; `4 = 4`; `φ(5) = 4`; `φ(1) = 1`; `Δ = 0` excluded by `D ≠ 0` | holds | none |
| N1 native value at odd `p ∤ det L` (r38) | `⟨1⟩ ⊕ ⟨1⟩` at `p = 3`; `⟨1⟩` | `θ = 2`, a nonsquare unit, so `#H₃ = 2`; rank 1: `H₃ = 1` | holds | none |
| 5A unimodular case (r38) | `E₈²`/`D₁₆⁺`; `I₈`/`E₈` | `(16,0)` both even, so same genus; parities differ, so different genera | holds | none |
| B4 in full (r38) | `!![4,1;1,6]`; `!![2,1;1,12]`; `A₂`; `U` | `[O:SO] = 1`; `2`; `#O(A₂) = 12`; `#O(U) = 4` | holds | none |
| 4A partly native (r38←r37) | genus of `!![4,1;1,6]`; `⟨1⟩` | `3 + 1 = 4 = 2h`; `1 + 1 = 2`; `2 ≤ 3 ≤ 4` | holds | none |
| 5J necessity native (r38←r37) | `(1;1,0,1)`; `(0;4,0,0)` | `⟨2⟩`, `δ = 1`; clause 4 needs `8 ∣ 4`, false | holds | none |
| B3 characters at 2 (r38←r37) | `Δ = −8, −24, −16, −32, −12, 24, 8, 12` | `δε`, `ε`, `δ`, `{δ,ε}`, none, `δε`, `ε`, `δ` | holds (576/576) | none |
| B3 step 1 factorization (r38←r37) | `Δ = −36, 45, −128` | `δ`; `χ₅`; `δε` | holds | none |
| B3 step 3 (r38←r37) | `Δ = −4, 45`; `Δ = −3, 96, 60` | `[SO:SO²] = 2`, `4`; `2 = 2¹`, `8 = 2³`, `8 = 2³` | holds | none |
| B3 step 4, genus count (r38←r37) | `Δ = 96, 60, 180, 45, 12, −24` | `4/4/4`, `4/4/4`, `2/2/2`, `2/2/2`, `2/2/2`, `2/2/2` | holds | none |
| B3 split remark (r38←r37) | `Δ = 25` | 2 involutions against `2^{μ−1} = 1` | nonsquare hypothesis present | none |
| B1 `disc N_L = −4 det L` (r38←r37) | `A₂`; `U`; `!![3,1;1,4]` | `−12 = −4·3`; `4 = −4·(−1)`; `−44 = −4·11` | holds | none |
| B2 sign clause, definite restriction (r38←r37) | `Δ = 12`; `±(x²+y²)` | `h⁺ = 2`, `h = 1`; 2 against 1 | holds | none |
| B6 integral points (r38←r37) | `Δ = −4`; `12`; `U` | `{±1,±i}`; infinite (`2+√3`); `{±1}` | holds | none |
| B7 volumes (r38←r37) | `Δ = −4`; `12`; `U` | `π/2`; `log(2+√3) = 1.31696`; 1 | holds | none |
| B8 masses (r38←r37) | `A₂`; genus of `!![4,1;1,6]` | `1/12`; `1/4 + 1/2 = 3/4 = h⁺/(2w)` | holds | none |
| N0 determinant `−1` (r38←r37) | `⟨4⟩`@2; `U`@2; `⟨1⟩⊕⟨2⟩`@3 | `s_e = −1`; swap; `s_{e₁+e₂}(e₁) ∉ L₃` | holds | none |
| 4B classes / proper classes (Lean, r38←r37) | `⟨1⟩`; genus of `!![4,1;1,6]` | 1 = 1; 2 = 2, 3 = 3 | holds | none |
| 5A `sameGenus_iff_of_isEven` (Lean, r38←r37) | `E₈²`/`D₁₆⁺`; `⟨2⟩⊕⟨−2⟩`/`U(2)` | true/true; false/false | holds | none |
| 5B (Lean, r38←r37) | `⟨6⟩`@3; `(1,0,q₁^{(3)}(3))`; `(0,2,·)` | `6 = 6`; false/false; true/true | holds | none |
| 5G 1.12.2, 1.12.4 (Lean, r38←r37) | `S = 0`; `⟨2a⟩ ↪ U` | `8 ∣ l₊−l₋`; `e + af` primitive of norm `2a` | holds | none |
| 5J sufficiency (Lean, r38←r37) | `(1;1,0,1)`; `(0;4,0,0)` | `⟨2⟩`; clause 4 fails | agrees | none |
| 6A (Lean, r38←r37) | `U⊕E₈⊕E₈(−1)`/`U⁹`; `U`/`⟨1⟩⊕⟨−1⟩` | `(9,0,9)` both; parities differ | holds | none |
| 6E (Lean, r38←r37) | `D₁₆E₈`/`E₈³`; Leech | 720 = 720 roots, multisets differ; no norm-2 vectors | holds | none |
| 7E (Lean, r38←r37) | `n = 0,1,2,3` | `vol SO = 1, 1, 2π, 8π²`; `vol O(1) = 2` | holds | none |
| 7C stabilizer index (r38←r37) | `⟨a⟩`; rank 0 | 2; 1 | holds | none |

## Not verifiable

- **The seeded sample B1–B8 against its sources.**
  - This round's README change falls in B3, step 1, and carries no locator. Its mathematics is checked by computation in the table above.
  - The native claims of Layer B are confirmed at the pin, above and in the previous report.
  - The sources cannot be read legally:
    - Cox, *Primes of the form x² + ny²* (B2 Theorem 7.7, B3 Theorem 3.15, B4 Theorem 3.9): paywalled, not in the manifest; the README marks it uncertified (README.md:1327, 1433, 1568).
    - Cohen, GTM 138, §5.2: recorded as uncertified.
    - Cassels, *Rational Quadratic Forms*, Chapter 13 (B6): marked uncertified, not in the cache.
    - Conway–Sloane, *Low-dimensional lattices IV* (B8): waived.
- **Elsewhere.** Kawauchi–Kojima (1G) and Cassels, *An Introduction to the Geometry of Numbers*, Chapter VIII (2F), are uncertified.

## Source issues

- none
