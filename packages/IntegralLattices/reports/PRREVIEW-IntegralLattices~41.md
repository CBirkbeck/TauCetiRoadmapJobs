# Review of IntegralLattices (pull request #617 at dec9d6b)

**Verdict:** needs changes

This is an incremental re-review of the 67 lines changed since `cca39ab`:
- Only `TauCetiRoadmap/IntegralLattices/PROGRESS.md` and `STATUS.md` changed. Both are generated files, and both are now byte-identical to main's.
- `README.md` and `Suggested.lean` are byte-identical to `cca39ab`.
- The head is a merge of main `8fe2a7be` with the head `6aa9b5bf` of #1215 (ClassFieldTheory).
- The pins have not changed: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`.

Status of the previous findings:
- R02 and R03 are repaired, and neither repair introduces a problem in this folder.
- R01 is only partly repaired. The description now names LocalFieldsRamification as this pull request's own roadmap, but the gate still fails on the four `Completed/` files. It is raised again as R01.

There is one finding, at P3. None is P1 or P2.

## R01 (P3) — Gate `outside-folder`: four files under `Completed/` still change in this pull request

- **Location.** These files change, and none of them is in a folder this brief names as the pull request's own:
  - `Completed/LocalFieldsRamification/COMPLETION.md`, `README.md` and `Suggested.lean`;
  - `Completed/LocalGaloisGroups/README.md`.

  The description reads: "This pull request's own roadmap is LocalFieldsRamification. It carries the revision of IntegralLattices…"
- **Claim.** Naming LocalFieldsRamification in the description does not register with the gate, so the gate still fails. This folder cannot be accepted while it fails.
- **Witness.**
  - The worker's gate at `dec9d6b` prints `outside-folder=4 … FAIL` and lists exactly these four files.
  - My rerun lists the same four files, plus seven files of the ClassFieldTheory, GlobalQuadraticForms and QuadraticFormInvariants folders. Those three folders are this pull request's own, so the seven are not part of this finding.
  - Every other scanner is 0.
- **Repair.** Do one of the following:
  1. **Open the IntegralLattices revision as its own pull request** (recommended). Nothing ties it to the LocalFieldsRamification change:
     - `TauCetiRoadmap/IntegralLattices/README.md` and `Suggested.lean` mention neither LocalFieldsRamification nor LocalGaloisGroups (0 matches);
     - `Suggested.lean` imports only Mathlib and `TauCeti.*` modules.

     Update the "Shared folders" order for `IntegralLattices` to match (the new pull request → #1411 → #1187).
  2. **Or keep this pull request as it is**, and either move the `Completed/` changes to a separate pull request, or have the board register `Completed/LocalFieldsRamification` and `Completed/LocalGaloisGroups` as this pull request's own folders, each with its own review.

  **Test.** Rerun `gate … IntegralLattices --base origin/main` until `outside-folder` lists no `Completed/` file.

## Previous findings

- R01 — partly repaired: the description now says "This pull request's own roadmap is LocalFieldsRamification", but the gate at `dec9d6b` still prints `outside-folder=4` for the three `Completed/LocalFieldsRamification` files and `Completed/LocalGaloisGroups/README.md`. Raised again as R01.
- R02 — repaired: the merge-order block now reads "`IntegralLattices`: **this pull request** → #1411 → #1187 (pin bump)", each "rebased onto the ones before it". #1411's IntegralLattices text is built on this head (826 changed README lines against 2191 for main).
- R03 — repaired: the merge base is now `8fe2a7be`, which contains `47fc6a3c` (#1239) and `91ba40ae`. `git merge-tree --write-tree origin/main dec9d6b`, with main at `2485dfb`, prints no CONFLICT line.

## Verified sound

**Gate, dependencies and build.**
- The gate:
  - the worker's run at `dec9d6b`: every scanner is 0 except `outside-folder=4` (R01); `build=0`;
  - my rerun: the same, with `outside-folder=11` (R01's four files plus seven files of the sibling folders).
- The dependency check (`gate --depcheck … --movable --pr 617`) prints `depcheck: 234 roadmaps, 2289 edges, 0 problem(s)`. There is no UPWARD and no CYCLE line.
- `lake env lean …/Suggested.lean` finishes in 15 s with no error. Its only diagnostics are 15 `declaration uses sorry` warnings, at lines 266, 285, 309, 326, 372, 379, 400, 413, 427, 442, 454, 473, 486, 548 and 575. That is the same set as at `cca39ab`.
- The 36 `#check @…` lines of the signature file elaborate with 0 errors. No declaration changed, so no section binder can have been lost.
- `README.md` and `Suggested.lean` are byte-identical to `cca39ab`. So four earlier results still apply:
  - the one-tactic probe: all 15 `sorry`s fail, so none is padding;
  - the list of headline theorems;
  - the docstring's list of what is not statable (3E/3G and 4C);
  - the adversarial rows below that are carried from earlier reports.

**The changed files.**
- `PROGRESS.md` and `STATUS.md` are equal to main's (`git diff origin/main HEAD` on them is empty).
- STATUS's `readme_sha` `aa12468…` is the SHA-256 of main's README, not of this head's (`78527cf…`). So its coverage describes main's text until it is regenerated after the merge. That is expected for a generated file, and it is not a finding.

**R03: what main's version had that this head retires.**
- Main's `Suggested.lean` has 65 declarations and this head's has 36; 36 of main's are not here.
- I spot-checked 17 of them. Each one has a home, either a native declaration at the pin that the README cites by name or a declaration of this head's `Suggested.lean`:
  - `milgram` → `gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg`;
  - `natCard_isometry_typeE₈RootLattice` → `card_isometry_typeE₈RootLattice` (`RootLattice/TypeE/WeylGroup.lean:272`);
  - `equivalent_one_or_e8_sum_one_of_unimodular_posDef_nine` → `nonempty_isometry_of_isUnimodular_of_finrank_le_nine`;
  - the cancellation trio (`e8SumE8Gram`, `d16PlusGram`, `gramIsometric_e8SumE8_sum_U_d16Plus_sum_U`) → `nonempty_isometry_orthogonalSum_hyperbolicPlane_e8PowLattice`;
  - `finite_classes_of_posDef` → `finite_genusClasses`;
  - the three `localDensityCount` lemmas → the native `localDensityCount` family;
  - `vanDerBlij`, `infinite_isometry_of_isIndefinite` and `exists_isEven_isUnimodular_isPosDef_iff` are cited under their own names, which exist at the pin;
  - `exists_twoElementaryLattice_iff` → `twoElementaryLatticeWithInvariants_of_twoElementaryAdmissible` (README.md:2433);
  - `isometric_mem_of_sum_eq_genusMass` → `StoredClassNumberCertificate.classNumber_eq_classNumber_lattice` (README.md:514);
  - `IsGenusMass`, a Gram-matrix predicate in main's file → the native `mass` (README.md:510);
  - `sphereArea`, a helper of main's 7E, → this head's `oEuclideanMeasure_eq_orthogonalGroupMeasure` and the native volume and sphere-measure APIs (README.md:72, 2964).
- These retirements were made in repair commits `9601e634` and `39e86283`, both ancestors of `cca39ab` and reviewed then. The merge itself retires nothing, because the folder's README and Lean file are unchanged by it.

**Citations that the merge could have broken.** The merge changed the READMEs of GlobalQuadraticForms, QuadraticFormInvariants, RootSystems and ModularForms, all of which this README cites. Each citation was resolved at this head.
- **GlobalQuadraticForms §7.3, `exists_globalForm_of_isAdmissible`** (README.md:550, 2306, 2456):
  - it is GQF README:989 and `Suggested.lean:113`;
  - `GlobalFormInvariants` at the pin (`QuadraticForm/Global/Invariants.lean:90`) has the fields `rank`, `discr`, `finiteHasse` and `realPositiveIndex`. These are exactly row 550's list;
  - `IsAdmissible.one_le_rank` (line 180) is unchanged since `cca39ab`.
- **GlobalQuadraticForms 6.3, `hasseMinkowski_equivalent`** (README.md:549, 2756): GQF README:894 and `Suggested.lean:95`, stated as `Q.Equivalent R ↔ Q.LocallyEquivalent R`.
- **RootSystems Layer 3 §3.1** (README.md:553): it is RootSystems README:687, the classification by `TauCeti.existsUnique_dynkinType` (`RootSystem/FiniteType/Classification.lean:88`). This matches the use in 6C and 6G.
- **ClassFieldTheory** is cited by roadmap name only. Its README:118, 126 and 647 still describe the ring class field of every order and `hilbertProductFormula` as native. At the pin these are `ClassFieldTheory/Global/Hilbert/Reciprocity.lean:65` and `ClassFields/RingClass/Field.lean:111` and 178.
- **QuadraticFormInvariants** names IntegralLattices as a consumer (README:1652, 2737), consistently with this README's lines 66–69 and 136.
- **ModularForms**: its Summary (integral weight, Hecke theory, newforms) matches owner row 151.

**Roadmaps new on main since the previous review.** QuadraticCharactersAndReduction, RootSystemsPartII, RamificationOfCompleteDiscretelyValuedFields, PolylogarithmFunctions, SpecialFunctionsAiry and ClusterAlgebras.
- None of them mentions IntegralLattices (0 matches).
- RootSystemsPartII is about folding root pairings, not lattices.

**`overlaps.md` and `citations.md`.**
- No cited id is dropped by an open pull request or defined only by an open revision, and this pull request drops no id that other roadmaps cite.
- #1187 is a pin bump; #1411 is covered under R02.
- The 13 Lean names of `citations.md` are declarations of this roadmap's own `Suggested.lean`. For example, `NikulinDecomposition.padicDiscriminant`, `NikulinGenerator.realizationDet`, `HasCyclicTwoSummand`, `oEuclideanMeasure`, `RootfulNiemeierType.eq_of_nonempty_isometry_lattice` are all in its declaration list. The tool searched only the pinned libraries. The gate's `readme-ids-missing` is 0.

**The description.**
- "It carries the revision of IntegralLattices, which is main's text with the review repairs applied" holds. `1ee3a8c3` restored main's #1239 text, and the head descends from main `8fe2a7be`.
- The build claim for `IntegralLattices` holds (above).
- No repair report marks R01 as not actionable.

**Remarks on untouched text.** These need no change and do not block.
- **`equivalent_of_locallyEquivalent`.** README.md:549, 1051 and 1175 cite it as a GlobalQuadraticForms declaration.
  - At `cca39ab` and on main it is declared there (`Suggested.lean:544`).
  - At this head GQF 8.4 (README:1171–1176) says it is the reverse direction of `hasseMinkowski_equivalent`, "not a separate declaration", and that IntegralLattices cites it under that name.

  That mapping keeps the citation valid. Citing `hasseMinkowski_equivalent` (6.3) with GQF 8.4 directly would remove the alias.
- **B3, step 1.** Its factorization of `(Δ | ·)` is a proof step. It overlaps QuadraticCharactersAndReduction §1.3 (now on main), which does not mention IntegralLattices. Tau Ceti's `fundamentalDiscriminantChar_mul`, `…_neg_four`, `…_eight`, `…_neg_eight` and `…_oddPrimeDiscriminant` (`Multiquadratic/FundamentalDiscriminant/Values.lean`) are citable for it.

**Adversarial table.**
- Rows marked *new* were computed this round, for the supplier statements whose owners changed in the merge.
- Rows marked *r40* are carried from `PRREVIEW-IntegralLattices~40`. Rows marked *r40←r38* (or *←r37*) are rows that report carried.

| Statement | Instances | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| 5B input: GQF §7.3 `exists_globalForm_of_isAdmissible` at this head (*new*) | record `(1, 2·ℚˣ², s ≡ +1, p_∞ = 1)`; rank-0 record | `1 ≤ 1`, `p ≤ n`, `d_∞ = +` matches `(−1)^0`, Hasse product `1`: admissible, realized by `⟨2⟩`. Rank 0 fails `one_le_rank`; 5B condition 2 then forces `l(A_q) = 0`, so the zero lattice works and no rational form is needed | holds | none |
| 3H/4B/6A input: GQF 6.3 `hasseMinkowski_equivalent` with its reverse direction 8.4 (*new*) | `H` vs `⟨2,−2⟩`; `⟨1,1,−3⟩` vs `⟨1,1,−1⟩`; `⟨1,−1⟩` vs `U ⊗ ℚ` | true/true; discriminant ratio `3`, not a square in `ℚ` or `ℚ₃`: false/false; both `≅ H`: true/true | holds | none |
| 6C/6G input: RootSystems §3.1 and the native order of `O(E₈)` (*new*) | `E₈` Cartan matrix | det `1`, rank 8, 240 roots; unique valid type `E8`; `#O(E₈) = 2¹⁴·3⁵·5²·7 = 16384·243·25·7 = 696729600 = #W(E₈)` (`weylGroup_typeE₈RootLattice_eq_top`) | holds | none |
| B3 step 1: the Kronecker character uses all, or a proper subset, of the assigned characters (r40) | `Δ = −12`; `−36`; `−48`; `20`; `−84` | `{χ₃}`, `χ₃`: all. `{χ₃, δ}`, `δ`: subset. `{χ₃, δ}`, `χ₃`: subset. `{χ₅}`, `χ₅`: all. `δχ₃χ₇`: all | holds | none |
| B3 step 1 against worked example 3391 (r40) | `Δ = −36`: `(1,0,9)`, `(2,2,5)` | `(χ₃, δ) = (+,+)`, `(−,+)`; `h = 2 = 2^{μ−1}` | agrees | none |
| Docstring binary dictionary (r40) | `Δ = −4`; `−23`; `12`; `25` | `1 = #Pic ℤ[i]`; `3 = 3`; `2 = h⁺(ℤ[√3])`; `25` excluded by `[Fact (¬ IsSquare D)]` | holds | none |
| Docstring ring class field (r40) | `Δ = −23` | 3 classes `= [H:K] = 3` | holds | none |
| Docstring B4: "with nonzero form" (r40) | zero form of rank 2; `x²`; `A₂` | `SO = SL(2,ℤ)` nonabelian, excluded; `{±1} × ℤ` both sides; `#SO = 6 = #ℤ[ω]ˣ` | holds | none |
| Scope "first list" against "(native)" headings (r40←r38) | all bold milestone headings | 21 tagged; 21 labels besides 7G; symmetric difference empty | holds | none |
| B3 principal genus, fundamental `Δ < 0` (r40←r38) | `Δ = −84` | `h = 4`; four tuples; `ker Φ = 1 = C²` | holds | none |
| B3 principal genus, fundamental `Δ > 0` (r40←r38) | `Δ = 12` | `(+,+)`, `(−,−)`; `h⁺ = 2 = 2^{μ−1}` | holds | none |
| B5 native counts (r40←r38) | `Δ = −23, −84, 25, 1, 0` | `3 = 3`; `4 = 4`; `φ(5) = 4`; `φ(1) = 1`; `0` excluded | holds | none |
| N1 at odd `p ∤ det L` (r40←r38) | `⟨1⟩ ⊕ ⟨1⟩` at `p = 3`; `⟨1⟩` | `#H₃ = 2`; `1` | holds | none |
| 5A unimodular case (r40←r38) | `E₈²`/`D₁₆⁺`; `I₈`/`E₈` | `(16,0)` both even: same genus; parities differ | holds | none |
| B4 in full (r40←r38) | `!![4,1;1,6]`; `!![2,1;1,12]`; `A₂`; `U` | `[O:SO] = 1`; `2`; `12`; `4` | holds | none |
| 4A partly native (r40←r38←r37) | genus of `!![4,1;1,6]`; `⟨1⟩` | `3 + 1 = 4 = 2h`; `1 + 1 = 2` | holds | none |
| 5J necessity native (r40←r38←r37) | `(1;1,0,1)`; `(0;4,0,0)` | `⟨2⟩`, `δ = 1`; `8 ∣ 4` false | holds | none |
| B3 characters at 2 (r40←r38←r37) | `Δ = −8, −24, −16, −32, −12, 24, 8, 12` | `δε`, `ε`, `δ`, `{δ,ε}`, none, `δε`, `ε`, `δ` | holds (576/576) | none |
| B3 step 3 (r40←r38←r37) | `Δ = −4, 45`; `−3, 96, 60` | `2`, `4`; `2¹`, `2³`, `2³` | holds | none |
| B3 step 4, genus count (r40←r38←r37) | `Δ = 96, 60, 180, 45, 12, −24` | `4/4/4`, `4/4/4`, `2/2/2` ×4 | holds | none |
| B1 `disc N_L = −4 det L` (r40←r38←r37) | `A₂`; `U`; `!![3,1;1,4]` | `−12`; `4`; `−44` | holds | none |
| B2 sign clause (r40←r38←r37) | `Δ = 12`; `±(x²+y²)` | `h⁺ = 2`, `h = 1`; 2 against 1 | holds | none |
| B6 integral points (r40←r38←r37) | `Δ = −4`; `12`; `U` | `{±1,±i}`; infinite (`2+√3`); `{±1}` | holds | none |
| B7 volumes (r40←r38←r37) | `Δ = −4`; `12`; `U` | `π/2`; `log(2+√3) = 1.31696`; `1` | holds | none |
| B8 masses (r40←r38←r37) | `A₂`; genus of `!![4,1;1,6]` | `1/12`; `1/4 + 1/2 = 3/4 = h⁺/(2w)` | holds | none |
| N0 determinant `−1` (r40←r38←r37) | `⟨4⟩`@2; `U`@2; `⟨1⟩⊕⟨2⟩`@3 | `s_e = −1`; swap; `s_{e₁+e₂}(e₁) ∉ L₃` | holds | none |
| 4B classes / proper classes (r40←r38←r37) | `⟨1⟩`; genus of `!![4,1;1,6]` | `1 = 1`; `2 = 2`, `3 = 3` | holds | none |
| 5A `sameGenus_iff_of_isEven` (r40←r38←r37) | `E₈²`/`D₁₆⁺`; `⟨2⟩⊕⟨−2⟩`/`U(2)` | true/true; false/false | holds | none |
| 5B (r40←r38←r37) | `⟨6⟩`@3; `(1,0,q₁^{(3)}(3))`; `(0,2,·)` | `6 = 6`; false/false; true/true | holds | none |
| 5G 1.12.2, 1.12.4 (r40←r38←r37) | `S = 0`; `⟨2a⟩ ↪ U` | `8 ∣ l₊−l₋`; `e + af` primitive, norm `2a` | holds | none |
| 6A (r40←r38←r37) | `U⊕E₈⊕E₈(−1)`/`U⁹`; `U`/`⟨1⟩⊕⟨−1⟩` | `(9,0,9)` both; parities differ | holds | none |
| 6E (r40←r38←r37) | `D₁₆E₈`/`E₈³`; Leech | 720 = 720 roots, multisets differ; no norm-2 vectors | holds | none |
| 7E (r40←r38←r37) | `n = 0,1,2,3` | `vol SO = 1, 1, 2π, 8π²`; `vol O(1) = 2` | holds | none |
| 7C stabilizer index (r40←r38←r37) | `⟨a⟩`; rank 0 | `2`; `1` | holds | none |

## Not verifiable

- **The seeded sample B1–B8 against its sources.**
  - No README passage changed, so the sample does not fall in a changed passage. Its native claims were confirmed at the pin in earlier reports, and the pin is unchanged.
  - The sources cannot be read legally:
    - Cox, *Primes of the form x² + ny²* (B2 Theorem 7.7, B3 Theorem 3.15, B4 Theorem 3.9): paywalled, and marked uncertified in the README;
    - Cohen, GTM 138, §5.2: recorded as uncertified;
    - Cassels, *Rational Quadratic Forms*, Chapter 13 (B6): uncertified;
    - Conway–Sloane, *Low-dimensional lattices IV* (B8): waived.
- **Elsewhere.** Kawauchi–Kojima (1G) and Cassels, *An Introduction to the Geometry of Numbers*, Chapter VIII (2F), are uncertified.

## Source issues

- none
