# Review of IntegralLattices (pull request #1411 at cded4a2)

**Verdict:** needs changes

In this folder the pull request changes only `Suggested.lean`: one hunk, lines 1218–1297, adapting
three declarations to its own Class Field Theory change. The branch forked from main at `eaf17b1`.
Main then replaced this folder in `47fc6a3`, so the head still carries the old copy: README 2468
lines and `Suggested.lean` 1373 lines, against main's 3092 and 873. The hunk edits declarations
that main no longer has.

- R01–R10 concern the head's copy and the pull request. R01, merging main and taking main's files
  for this folder, cures R02–R08 and the part of R10 that concerns this folder.
- R11–R17 are defects in main's text, which R01 brings in. They remain after R01.
- R13 is caused by this pull request's Class Field Theory change, so its repair belongs in this
  pull request.

## The previous review's findings at this head

| Id | Status | Evidence |
| --- | --- | --- |
| R01 stale copy, conflict | not repaired | The hunk now also requalifies `TauCeti.GlobalNumberFields.NumberFieldOrder` and wraps the Class Field Theory equivalence in `⟨…⟩`. `git merge-tree --write-tree origin/main HEAD` still conflicts in this `Suggested.lean`. |
| R02 depcheck | not repaired | Same `UPWARD` and `CYCLE` lines (R02 below). |
| R03 sorried data | not repaired | Gate `sorry-data=12`. |
| R04 admitted examples | not repaired | Gate `sorry-examples=27`. |
| R05 roadmap imports | not repaired | `Suggested.lean:5–11`. |
| R06 PR numbers | not repaired | README 7 and 273. |
| R07 residue | not repaired | README 169 and 478. |
| R08 `Nonempty` conclusion | not repaired | `Suggested.lean:1291`. |
| R09 outside folder | partly | `Completed/LocalFieldsRamification` has left the diff. `Completed/LocalGaloisGroups/Suggested.lean` (2 lines) remains; the description now names it, the brief does not. |
| R10 conflicting heads | partly | The description now gives the rule for #617: "whichever of the three merges first, the other two are rebased onto it". #1797 is still not mentioned. |
| R11–R16 | not repaired | Main's README and `Suggested.lean` are byte-identical to what the previous review read. Each finding is re-verified at the pins below. |

## R01 (P1) — The folder is the stale copy, and its hunk conflicts with main

- **Location.** `TauCetiRoadmap/IntegralLattices/Suggested.lean:1221–1297`, the whole diff in this
  folder: "`open TauCetiRoadmap.GlobalNumberFields`", "`TauCeti.GlobalNumberFields.NumberFieldOrder
  K := sorry`", "`⟨ClassFieldTheory.gal_ringClassField_equiv_pic K …⟩`".
- **Claim.** The hunk repairs `orderOfNonsquareBinaryDiscriminant`, `binaryRingClassField` and
  `gal_binaryRingClassField_equiv_pic`. Main's file has none of these. The branch cannot merge,
  and resolving the conflict toward the head would bring back the old copy with R02–R08. Main's
  `Suggested.lean` imports no roadmap module, so it needs no consumer repair for the Class Field
  Theory change.
- **Witness.** `git merge-tree --write-tree origin/main HEAD` prints "CONFLICT (content): Merge
  conflict in TauCetiRoadmap/IntegralLattices/Suggested.lean". `47fc6a3` is not an ancestor of
  `cded4a2`. Main's `Suggested.lean` contains no `ringClassField`.
- **Repair.** Merge `origin/main` and resolve this folder to main's files:
  `git checkout origin/main -- TauCetiRoadmap/IntegralLattices/README.md
  TauCetiRoadmap/IntegralLattices/Suggested.lean`. The pull request then changes nothing here
  except R13's two sentences.
  - **Tested on a scratch copy at this head's pins.** Main's `Suggested.lean` elaborates with
    exit 0 and 31 warnings, all `declaration uses 'sorry'`. The dependency check on main's README
    prints `0 problem(s)`. Main's copy has no `#NNN`, no sorried definition, no `example`, no
    roadmap import and no `set_option`.
  - **Head-only defects in the sampled sections that this also cures:**
    - "Positive definite, not definite" (head 324–329) says that for a negative definite form
      the set `{x | β x x ≤ C}` is infinite. Rank 0 gives `{0}`. Main 270–277 restricts the
      claim to positive rank.
    - "Owned here, consumed there" (head 218–230) claims the carrier, the dual and the
      discriminant forms as this roadmap's, and head line 78 says Theta Series imports this
      file. Both are Tau Ceti's, and Theta Series' `Suggested.lean` on main imports only
      `Mathlib` and 11 `TauCeti.*` modules.
    - B7 (head 1185–1210) fixes no real normalization and has no Checks. It also fibres the
      split quotient over "the finite split class set of B5". At `Δ = 25` the base is
      `(ℤ/5)ˣ/{±1}`, of order 2, while B5 counts `φ(5) = 4` classes. Main 1310–1366 corrects all
      three.

## R02 (P1) — Gate `depcheck`: an upward edge and a cycle with OrthogonalTamagawaAndLatticeMass

- **Location.** `README.md:1762–1764`: "It is `OrthogonalTamagawaAndLatticeMass`'s first
  obligation, and `α_p` as defined above is exactly what it must be shown equal to". Also the
  table row at `README.md:2270`.
- **Claim.** The check reads these sentences as supply edges to a roadmap that is later in the
  merge order (line 149) and that consumes this one.
- **Witness.** The check prints `UPWARD: IntegralLattices (on main) ->
  OrthogonalTamagawaAndLatticeMass (#149) at README lines [1763, 2270]` and `CYCLE among:
  IntegralLattices, OrthogonalTamagawaAndLatticeMass`. On main's README it prints `0 problem(s)`.
- **Repair.** R01, tested as above.

## R03 (P2) — Gate `sorry-data`: twelve sorried definitions, five duplicating Tau Ceti

- **Location.** `Suggested.lean` lines 133, 137, 141, 145, 188, 212, 244, 248, 293, 340, 698 and
  1233. For example, line 212: "`noncomputable def expCircle (x : AddCircle (1 : ℚ)) : ℂ :=
  sorry`".
- **Claim.** Sorried data is forbidden. Five of these definitions restate definitions that exist
  at the pin, and line 1233 is the order that the hunk passes to `ringClassField`.
- **Witness.** At the Tau Ceti pin `2fd255d`:
  - `IntegralLattice.scale` (`LinearAlgebra/IntegralLattice/Scaling.lean:76`);
  - `expCircle` (`Analysis/SpecialFunctions/Complex/Circle/Basic.lean:60`);
  - `FiniteQuadraticModule.gaussSign` (`LinearAlgebra/FiniteBilinearModule/GaussSum.lean:514`);
  - `localizationToCompletion` (`NumberTheory/IntegralLattice/Localization/Basic.lean:154`);
  - `QuadraticOrder.numberFieldOrder` (`NumberTheory/QuadraticOrder/Field.lean:39`).
- **Repair.** R01. Main's file has no sorried definition.

## R04 (P3) — Gate `sorry-examples`: 27 admitted examples

- **Location.** `Suggested.lean:445–1320`, for example line 466: "`example : (CartanMatrix.E 8).det
  = 1 :=`", closed by `sorry`.
- **Witness.** Gate rule `sorry-examples`, 27 hits. Main's file has no `example`.
- **Repair.** R01.

## R05 (P3) — Gate `imports`: seven roadmap modules imported, 34 of their declarations `#check`ed

- **Location.** `Suggested.lean:5–11`, from "`import Completed.IntegralLattices.Suggested`" to
  "`import Completed.OrthogonalSpinGroups.Suggested`". Also the `#check` block from line 399, for
  example "`#check QuadraticFormInvariants.hilbertSymbol`".
- **Claim.** The file imports roadmap modules, one of them (`TauCetiRoadmap.ClassFieldTheory.Suggested`)
  still in this pull request, and `#check`s roadmap declarations rather than only pinned library
  declarations.
- **Witness.** Gate rule `imports`. `grep -c '^#check'` gives 34. Main's file imports `Mathlib`
  and twenty `TauCeti.*` modules only, and has no `#check`.
- **Repair.** R01.

## R06 (P3) — Gate `prnum`: pull-request numbers in the README

- **Location.** `README.md:7`: "interface already merged in upstream PR #200". Also line 273, and
  `#246` and `#255` at lines 40–41, 89 and 117.
- **Witness.** Gate rule `prnum`. Main's README has no `#NNN`.
- **Repair.** R01.

## R07 (P3) — Gate `residue`: process words in the README

- **Location.** `README.md:169`: "Nothing here is a stand-in for it". Also line 478, and the word
  "reviewed" at lines 6, 272, 312, 352 and 365.
- **Witness.** Gate rule `residue`, 2 hits. Main's README passes it.
- **Repair.** R01.

## R08 (P3) — Gate `statement-hygiene`: a `Nonempty` conclusion in the theorem this hunk edits

- **Location.** `Suggested.lean:1291–1297`: `gal_binaryRingClassField_equiv_pic` concludes
  "`Nonempty ((binaryRingClassField … ≃ₐ[K] binaryRingClassField …) ≃* TauCeti.GlobalNumberFields.Pic …)`".
- **Claim.** The conclusion discards data that is available.
- **Witness.** Gate: "P3 … repair: state the canonical map". At this head, Class Field Theory's
  `gal_ringClassField_equiv_pic` is a named `MulEquiv`, `(ringClassArtinEquiv O).symm`
  (`TauCetiRoadmap/ClassFieldTheory/Suggested.lean:1009–1012`).
- **Repair.** R01. Main has no such theorem.

## R09 (P3) — Gate `outside-folder`: `Completed/LocalGaloisGroups/Suggested.lean`

- **Location.** `Completed/LocalGaloisGroups/Suggested.lean:326, 485`: "`⟨ClassFieldTheory.h2MuEquivZMod_mixed
  p F n hn⟩`" and "`⟨ClassFieldTheory.h2FpEquivZMod_of_mu p F _ (muNRepIsoTrivialFp p F ζ hζ)⟩`".
- **Claim.** The description names this folder as one of the pull request's own, but the brief
  that the board issues does not, so the change is outside every folder under review.
- **Witness.** The worker's gate prints `outside-folder: Completed/LocalGaloisGroups/Suggested.lean`.
  `git diff --stat` gives 2 insertions and 2 deletions there.
- **Repair.** Have the board record `Completed/LocalGaloisGroups` as this pull request's folder,
  where it reads the folders, or move the two lines to a pull request of their own. Nothing
  changes in this folder.

## R10 (P3) — #1797 conflicts with this head in this folder, and no order is stated

- **Location.** `Suggested.lean`, the hunk at 1218–1297. The description's merge-order paragraph
  names #617, #1215, #1410 and #1474, but not #1797.
- **Witness.** The overlap report at the index of 2026-11-09: "#1411 and #1797 conflict in
  `TauCetiRoadmap/IntegralLattices/Suggested.lean`, `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean`".
- **Repair.** After R01 there is no hunk in this folder, so the conflict here disappears. State in
  the description which of #1411 and #1797 rebases onto the other, because the
  QuadraticFormInvariants conflict remains.

## R11 (P2) — Layer B is in Tau Ceti at the pin; main's file says B2 and B3 cannot be stated

- **Location.** Main `Suggested.lean:75–79`: "it carries no `NumberField` instance and the order
  `ℤ[(Δ+√Δ)/2]` is not a `NumberFieldOrder` of it … and no ring class field exists at the pin".
  Main `README.md:1031–1414` presents B1–B5 as targets owned here.
- **Claim.** All three carriers exist at the pin, and B2 (both signs), B3's composite and most of
  B4 and B5 are proved there. The docstring's reason is false, statable headlines are absent, and
  the README cites none of it. Main's B2–B5 row also takes `finite_narrowPic` from Global Number
  Fields, but it is a native instance.
- **Witness.** At `2fd255d`:
  - `QuadraticAlgebra.instNumberField` (`NumberField/QuadraticAlgebra.lean:41`);
  - `QuadraticOrder.numberFieldOrder` (`Field.lean:39`);
  - `posDefProperClassEquivPic` (`PicEquivalence.lean:55`);
  - `properClassEquivNarrowPic` (`Narrow/Equivalence.lean:106`);
  - `posDefProperClassEquivGal` (`RingClassField.lean:83`);
  - `index_specialOrthogonalGroup_eq_two_iff_reflected` (`Binary/Isometry.lean:127`);
  - `finite_narrowPic` (`RayClass.lean:297`).
- **Repair.**
  - Replace the B2/B3 bullet of the docstring with a sentence saying that they are proved in Tau
    Ceti, naming the declarations above and `ringClassArtinEquiv`
    (`ClassFieldTheory/ClassFields/RingClass/Field.lean:178`).
  - Add these files to §*From Tau Ceti*, all under `TauCeti/NumberTheory/`:
    - `NumberField/QuadraticAlgebra.lean`;
    - `QuadraticOrder/Field.lean`;
    - `BinaryQuadraticForm/Ideal/{PicEquivalence, Narrow/Equivalence, RingClassField, ClassNumber}.lean`;
    - `IntegralLattice/Binary/{Isometry, NormForm, NormOne, SplitClass, Ambiguous, ClassNumber}.lean`.
  - Drop `finite_narrowPic` from the Global Number Fields row.
  - Rewrite B1–B5 as consumed and keep their Checks. Keep as targets only what the pin lacks.
  - Point B3's supplier row at Tau Ceti's `ringClassField` and `ringClassArtinEquiv`.
  - On the refuting instance, `posDefProperClassEquivGal` at `n = 23` gives the 3 reduced forms
    `(1,1,6), (2,±1,3)`.

## R12 (P2) — B3's displayed isomorphism omits "positive definite" (sampled)

- **Location.** Main `README.md:1209–1213` (head 1103–1107): "`Gal(H_{𝒪_Δ}/K_Δ) ≃ Pic 𝒪_Δ ≃ proper
  equivalence classes of primitive forms of discriminant Δ` for `Δ < 0`".
- **Claim.** For `Δ < 0` the primitive forms include the negative definite ones, so the right
  side is twice the size of `Pic`.
- **Witness.** At `Δ = −4`, `Pic ℤ[i]` is trivial, but `x² + y²` and `−x² − y²` are two proper
  classes. B2 (main 1082) and Tau Ceti's `PosDefProperClass` restrict to positive definite forms.
- **Repair.** Write "proper equivalence classes of primitive positive definite forms of
  discriminant Δ". With that, `Δ = −4` gives `1 = 1` and `Δ = −23` gives `3 = 3`.

## R13 (P3) — The Class Field Theory contract no longer matches this pull request's Class Field Theory

- **Location.** Main `README.md:479`: "Each of these takes an order in a number **field** together
  with `Module.finrank ℚ K = 2`". Main 1220–1221 says the same of `ringClassField`.
- **Claim.** At this head, `ringClassField`, `ringClassArtinMap` and `gal_ringClassField_equiv_pic`
  take only `O : TauCeti.GlobalNumberFields.NumberFieldOrder K` and re-export Tau Ceti's
  declarations. After the merge both sentences are false. The conclusion survives through
  `[Field K]`.
- **Witness.** `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:995, 1002, 1009` at this head.
  Main's Class Field Theory `Suggested.lean:4318–4319` has `(hK : Module.finrank ℚ K = 2)`.
- **Repair.** In both places, write that each takes a `NumberFieldOrder K`, hence `[Field K]` and
  `[NumberField K]`, and that B1's nonsquare constructor supplies the quadratic `K`. Main
  1045–1047 already says this. Cite the objects as Tau Ceti's (R11).

## R14 (P3) — Main's `Suggested.lean` restates seven theorems that Tau Ceti proves

- **Location.** Main `Suggested.lean` lines 111 `vanDerBlij`, 211
  `nonempty_isometry_iff_gaussSign_eq`, 228 `milgram`, 357 `infinite_isometry_of_isIndefinite`,
  570 `exists_isEven_isUnimodular_isPosDef_iff`, 577
  `nonempty_isometry_typeE₈RootLattice_of_isEven_of_finrank_eq_eight` and 688
  `natCard_isometry_typeE₈RootLattice`.
- **Claim.** These are padding: each closes with one term or one `simp`. The paragraph "Two
  things that look like duplication and are not" (main 206–212) has two errors:
  - it calls Milgram's theorem this roadmap's, but Tau Ceti proves it;
  - it credits Theta Series with the positive definite case, but Theta Series' 6C states only
    even rank `n = 2k`.
- **Witness.** In a scratch copy with seven native imports added, each `sorry` was replaced by
  one term or `simp`. The copy elaborates with exit 0, and the `sorry` warnings drop from 31 to
  24. `h₂` of 1H is reported unused.
- **Repair.**
  - Delete the seven declarations and name them in the docstring as proved in Tau Ceti:
    - `vanDerBlij` (`Characteristic/VanDerBlij.lean:141`);
    - `nonempty_isometry_iff_bilinear_isometry_and_gaussSign_eq` (`FiniteBilinearModule/Comparison.lean:175`);
    - `gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg` (`Milgram.lean:313`);
    - `infinite_isometry_of_isIndefinite` (`IndefiniteIsometry.lean:171`);
    - `exists_isEven_isUnimodular_isPosDef_iff` (`PosDef/EvenUnimodular.lean:163`);
    - `IsPosDef.nonempty_isometry_typeE₈RootLattice_of_isEven` (`PosDef/SmallRankUnimodular.lean:407`);
    - `card_isometry_typeE₈RootLattice` (`TypeE/WeylGroup.lean:272`).
  - List their files in §*From Tau Ceti*.
  - Reword the "Two things" paragraph on both counts.

## R15 (P3) — "The single lattice carrier" displays fields the pinned structure lacks

- **Location.** Main `README.md:223–229` (head 277–283): "`[isLattice : carrier.IsLattice ℚ]`"
  and "`integral : ∀ x ∈ carrier, ∀ y ∈ carrier, form x y ∈ (1 : Submodule ℤ ℚ)`".
- **Witness.** `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63–73` has an explicit
  `isLattice` field and `le_dual : carrier ≤ form.dualSubmodule carrier`, and no `integral` field.
- **Repair.** Display the pinned fields and name the file. The two forms are equivalent: `ℤe` with
  `B(e,e) = 1/2` fails both, since `2ℤe ⊉ ℤe` and `1/2 ∉ ℤ`, and `A₁` satisfies both.

## R16 (P3) — 3E's Allcock–Gal–Mark locator names the unimodular theorem

- **Location.** Main `README.md:857`: "(Theorem 5.1 there, which proves the canonical symbol a
  complete invariant)". Head 874 gives no theorem number.
- **Witness.** In `allcock-gal-mark2016`, line 686 (p. 16) is Theorem 5.1, which classifies
  unimodular lattices. The canonical form as a complete invariant is Corollary 6.4, line 917
  (p. 21), which follows from Theorems 6.2 and 6.3 (lines 849 and 864, p. 20).
- **Repair.** Cite "Theorems 6.2 and 6.3, p. 20, and Corollary 6.4, p. 21, with Theorem 5.1, p.
  16, for the unimodular constituents". This is the manifest's locator.

## R17 (P2) — The genus, class, mass and local-density layer is native at the pin and is restated on parallel carriers

- **Location.**
  - Main `README.md`: 776 (3B), 929 (3I), 1507 (4A), 2076 (6D), 2376 (7A), 2395 (7C) and 2657
    (9B), which present these as targets owned here.
  - Main `Suggested.lean`: 255 `GramSameGenus`, 639 `d16Plus_sameGenus_not_isometric_e8SumE8`,
    700 `localDensityCount`, 709 and 724 (7C), 846 `IsGenusMass` and 860 (9B).
- **Claim.** Tau Ceti already defines the genus, the class sets, the mass and the local density,
  and proves most of these milestones. The README cites none of it. `Suggested.lean` states 6D, 7C
  and 9B through its own Gram-level definitions instead of the native ones.
- **Witness.** In `NumberTheory/IntegralLattice/` at `2fd255d`:
  - `SameGenus` (`Genus.lean:77`);
  - `classNumber` (`ClassNumber.lean:144`);
  - `mass` and `properMass_eq_two_mul_mass` (`Mass.lean:91, 154`);
  - `sum_inv_natCard_isometry_eq_mass_iff` (`Mass.lean:221`);
  - `isEmpty_isometry_e8PowLattice_checkerboardPlusLattice` (`EvenUnimodularGenus.lean:82`);
  - `Matrix.localDensityCount_succ_of_dvd` (`LocalDensity/Basic.lean:508`).
- **Repair.**
  - **§*From Tau Ceti*.** Add rows for:
    - `SameGenus`, `genusClasses`, `classNumber`, `IsPosDef.finite_genusClasses`,
      `genusProperClasses` and `properClassNumber`;
    - `mass`, `properMass`, `properMass_eq_two_mul_mass`, `mass_eq_one_of_finrank_eq_zero`,
      `mass_eq_inv_two_of_finrank_eq_one` and `sum_inv_natCard_isometry_eq_mass_iff`;
    - `exists_isJordanSplitting_localIntegralForm` (`JordanSplitting.lean:68`);
    - `DyadicJordanProfile` and `dyadicJordanProfile` (`Dyadic/DensityExponent/`);
    - `Matrix.localDensityCount` and `Matrix.localDensity` (`LocalDensity/Basic.lean:110, 546`),
      with `tendsto_localDensityCount_div_of_card_eq_two_mul_add_one` and `…_add_two` (711,
      737) and `LocalDensity/EulerProduct.lean`;
    - `sameGenus_e8PowLattice_checkerboardPlusLattice` (`EvenUnimodularGenus.lean:72`);
    - `IsNeighbor.sameGenus` (`Neighbor.lean:43`);
    - `StoredGenusCertificate` and `StoredClassNumberCertificate` (`LMFDB/`).
  - **The covered labels.** Treat the `ℤ_p` case of 3B, the `ℤ₂` case of 3I, and 4A, 6D, 7A, 7C
    and 9B the way main already treats 0A–2E (README 455): keep the label so that the citations
    of OrthogonalTamagawaAndLatticeMass and LatticePackingsAndPerfectForms stay valid, cite the
    native declaration, and keep the Checks. Keep as targets only what the pin lacks: 3B over
    finite extensions of `ℚ_p`, 3I over unramified extensions of `ℚ₂`, and 4A's spinor-genus
    inclusions.
  - **`Suggested.lean`.** Delete `localDensityCount`, `localDensityCount_succ_eq`,
    `localDensityCount_eq_of_odd_of_not_dvd`, `IsGenusMass`, `isometric_mem_of_sum_eq_genusMass`
    and `d16Plus_sameGenus_not_isometric_e8SumE8`, together with the Gram vocabulary only they use,
    and name them in the docstring as proved in Tau Ceti.
  - **Tested on the refuting instances.** At `k = 2` the native pair is `E₈²` and `D₁₆⁺`.
    Mapped through `Int.cast`, `U` at `p = 3` has the native counts 4 and 12, as computed below.

## Verified sound

**Change set.**
- `git diff origin/main...HEAD -- TauCetiRoadmap/IntegralLattices` is the one hunk of R01.
- Outside the brief's three named folders the diff is the two lines of R09.
- Main changed this folder after the fork in three commits: `47fc6a3`, `4c8edc2` and `91ba40a`.
  The last two touch only `PROGRESS.md` and `STATUS.md`.

**Gate, my run.**
- `prnum=2 sorry-data=12 sorry-examples=27 residue=2 imports=1 statement-hygiene=1 depcheck=2`.
- `outside-folder=4`: R09's file plus the three Class Field Theory and QuadraticFormInvariants
  files the brief names.
- Every other check 0.

These are the worker's figures.

**Elaboration** (`lake env lean`, at this head's pins):
- This head's `Suggested.lean`: exit 0, 69 warnings, all `declaration uses 'sorry'`, plus the
  output of the 34 `#check` lines.
- Main's copy: exit 0, 31 warnings, all `sorry`.

**Signatures.** I appended `#check @name` for every declaration to a copy of each file:
- **Head.** 67 of the 70 extracted names elaborated. The other three are words my extractor took
  from docstrings (`identifies`, `monoid,`), not declarations. The hunk's `binaryRingClassField`
  elaborates against `ClassFieldTheory.ringClassField (O)` with no `finrank` argument.
- **Main.** All 65 elaborated with no error. I compared each with the README:
  - `vanDerBlij` carries `[FiniteDimensional ℚ V] [L.IsNondegenerate]`;
  - `finite_classes_of_posDef` quantifies over symmetric positive definite `G` of determinant `d`;
  - `localDensityCount_eq_of_odd_of_not_dvd` uses `n * (n - 1) / 2` only under `0 < n`;
  - `exists_primitiveEmbedding_iff` uses `lp - S.sigPos` only under `S.sigPos ≤ lp`.

No binder was lost, and no change was needed.

**Dependency check.**

```text
head:  UPWARD: IntegralLattices (on main) -> OrthogonalTamagawaAndLatticeMass (#149) at README lines [1763, 2270]
       CYCLE among: IntegralLattices, OrthogonalTamagawaAndLatticeMass
       depcheck: 239 roadmaps, 2343 edges, 2 problem(s)
main:  depcheck: 239 roadmaps, 2346 edges, 0 problem(s)
```

**Cross-roadmap citations of main's README, resolved at this head (11):**
- Quadratic Form Invariants `hilbertSymbol_productFormula` (`Suggested.lean:2580`).
- Class Field Theory:
  - `hilbertProductFormula` (1040);
  - `ringClassField` (995);
  - `ringClassArtinMap` (1002);
  - `gal_ringClassField_equiv_pic` (1009).
- Global Quadratic Forms `hasseMinkowski_equivalent` (439) and `equivalent_of_locallyEquivalent`
  (544).
- Global Number Fields `picEquivUnitsIdealClassMonoid` (`Completed/…/Suggested.lean:798`) and
  `finite_narrowPic` (991).
- Orthogonal and Spin Groups `orthogonalBaseChangeReal` (1025), `spinorNorm_reflection` (420) and
  `transvectionLiftHom` (904).
- Root Systems §3.1 (`README.md:506`).
- Theta Series on main: Layer 1 (423), Layer 2 (484), and 6C at even rank `n = 2k` (Gauss-sum
  layer, 703–790).

The citation tool's lead `NumberFieldOrder.isProper_iff_isUnit_of_finrank_eq_two` (head README
477) is a false positive: it is at `Completed/GlobalNumberFields/Suggested.lean:777`.

**Library declarations opened at the pins** (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`):
- **The carrier and its conventions.**
  - `IntegralLattice` (`Basic.lean:63–73`) and `finrank_carrier` (126).
  - `IsPosDef`, `IsNegDef := (−Q).PosDef` and `IsIndefinite := 0 < sigPos ∧ 0 < sigNeg`
    (`Signature.lean:171, 179, 188`). They match "Definiteness".
  - `dualCarrier = form.dualSubmodule carrier` (`Dual/Basic.lean:75`). It matches "Dual
    lattice".
  - `ofIntegralForm` on `ℚ ⊗[ℤ] M` with `B.baseChange ℚ` (`Rationalization.lean:118`) and
    `rationalizationIsometry` (91). They match "Rational ambient space".
  - `expCircle`, an `AddChar` (`Circle/Basic.lean:60`).
  - `integralNorm_apply` (`Norm.lean:109`).
- **The native declarations of R11, R14 and R17**, at the lines quoted there.
- **Supporting native declarations**, all opened:
  - `SameGenus` (`Genus.lean:77`, signature plus `localIntegralForm` equivalence at every prime);
  - `mass` and `properMass` (`Mass.lean:91, 100`);
  - `localDensityCount_succ_of_dvd`, with explicit `r > 2e` where `2 det A ∣ p^e`;
  - `tendsto_localDensityCount_div_of_card_eq_two_mul_add_one` (`Basic.lean:711`);
  - `properClassEquivNarrowPic`, defined for `0 < D` and nonsquare `D`;
  - `picClass_primitiveReducedForms_bijective` (`BinaryQuadraticForm/Ideal/ClassNumber.lean:93`).

**Sources (sampled).** I read `allcock-gal-mark2016`:
- line 54, p. 2: the correction of the canonical form;
- lines 58–76, p. 2: type, sign `det ≡ ±1` or `±3 (mod 8)`, and oddity as the diagonal sum
  mod 8;
- lines 72–76: the example `1⁻³₃`;
- line 323, p. 8: type I/II;
- line 686, p. 16: Theorem 5.1;
- lines 849, 864, 917, pp. 20–21: Theorems 6.2, 6.3 and Corollary 6.4;
- lines 919–924, p. 21: SPLAG's error.

They support "Genus symbols" as written. R16 is the only locator defect found.

**Ownership against open pull requests.** I compared the closest open roadmaps in vocabulary
(sibling checkouts):
- OrthogonalTamagawaAndLatticeMass consumes §§2G, 6C, 6D, 7C (`README.md:9, 18`).
- LatticePackingsAndPerfectForms consumes §§2E–2G, 4A, 6G (97, 331, 1635).
- GeometryOfNumbersAndQuadraticArithmetic Part II cites 1I and 1L (16, 83).
- Theta Series on main consumes.

None claims an object owned here, and no README id cited here is dropped by an open head.

**Headline theorems.** Main's docstring lines 38–56 list them:
- 1H, 1L, 1I;
- 2F, 2G;
- 4B, 4E, 4F;
- 5A, 5B, 5G, 5J;
- 6A, 6B, 6C, 6D, 6E, 6G, 6H;
- 7C, 7E;
- 9B.

Each is stated. The docstring names 3E/3G and 4C as not statable. I checked the pin: there is no
genus-symbol carrier and no spinor-genus quotient. The B2/B3 claim is false (R11). R14 and R17
list the headlines Tau Ceti already proves.

**Adversarial pass.** Values were computed by hand in exact arithmetic. The Gram determinants,
automorphism orders, reduced forms and density counts were checked by a brute-force script.

| Statement | Instances | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Owned there, and not consumed here | `E₈`; Theta Series layers | `r_{E₈}(2) = 240 = 240·σ₃(1)`, counted as roots here; Theta Series Layers 1, 5, 6, 7 at README 423, 673, 703, 854 | pass | none |
| Owned here, consumed there (head only) | carrier, `A_L`, `q_L` | native `Basic.lean:63`, `DiscriminantGroup`; Theta Series' 12 imports are `Mathlib` and `TauCeti.*` | head false | R01 |
| Two things that look like duplication | `⟨2⟩`; `A₂` | `1 + i = √2·e(1/8)`, rank 1 outside Theta 6C (`n = 2k`); `1 + 2e(1/3) = i√3 = √3·e(2/8)`, `t₊ − t₋ = 2` | formula true; attribution over-broad, and Milgram native | R14 |
| Definiteness | `E₈(−1)`; `Ã₁`; `x²+y²−3z²` | `IsNegDef = (−Q).PosDef` ⇔ `PosDef(L(−1))`; `Ã₁` Gram `!![2,−2;−2,2]`, `(t₊,t₀,t₋) = (1,1,0)`, not indefinite; `(2,0,1)`, indefinite | pass | none |
| Positive definite, not definite | `E₈(−1)`, `C = 0`; rank 0 | sublevel is all of `E₈(−1)`, infinite; rank 0 gives `{0}`, finite | head false at rank 0; main pass | R01 |
| Rational ambient space | `⟨2⟩ = ℤe` | `ℚ ⊗ ℤ ≅ ℚ`, `B(x,y) = 2xy`, as `ofIntegralForm` | pass | none |
| Dual lattice | `A₂`; `⟨2⟩`; `ℤe`, `B = 1/2` | `L^⋆/L ≅ ℤ/3`; `½ℤe/ℤe ≅ ℤ/2`; dual `2ℤe ⊉ ℤe` | pass | none |
| Two invariants with different names | `⟨2⟩`; `E₈`; `u(2)`, `v(2)` | `q = 1/4`, sum `1 + i`, sign `1 = t₊ − t₋`; `A = 0`, sum 1, sign 0, `8 ≡ 0`; sums `2`, `−2`, signs 0 and 4 | pass | none |
| Genus symbols | `U` at 2; `⟨1,−1,3⟩`, `⟨−1,−1,−3⟩`, `⟨3,3,−3⟩` | `det −1 ≡ 7`, sign `+`, type II: `1^{+2}_{II}`; det `±3`, sign `−`, oddities `3, −5 ≡ 3, 3`: one symbol `1^{−3}_3` | pass | R16 (3E) |
| Nikulin's notation | `⟨2⟩`, `⟨10⟩` over `ℤ₂`; `ℤ/6`; `Λ_{K3}` | `q = 1/4` and `5/4 ≡ 1/4`; dets 2, 10, ratio `5 ≢ 1 (mod 8)`, a nonsquare; `l(ℤ/6) = 1 = max(1,1)`; rank `6 + 16 = 22`, signature `(3,19)` | pass | none |
| B1 | `A₂`; `x²+y²` on `⟨2e₁,e₂⟩` | `N = 2x²−2xy+2y²`, content 2, `Δ = −3`, `disc N = −12 = −4 det`; `4x²+y²`, content 1 | pass | none |
| B2 | `Δ = −3`; `Δ = 12` | one reduced form `(1,1,1)`; `x² − 3y² = −1` impossible mod 3, both forms give `𝔞 = ℤ[√3]`; sign clause gives `√12·𝒪`, generator norm `−12`, the nontrivial class of `NarrowPic` (order 2) | pass; native | R11 |
| B3 display | `Δ = −4`; `Δ = −23` | `#Pic = 1` against 2 primitive proper classes `±(x²+y²)`, but 1 positive definite class; `#Pic = 3` = reduced `(1,1,6), (2,±1,3)` | fails as written | R12 |
| B3 split | `Δ = 25`; `Δ = 64` | genera `{1,4}` and `{2,3}`, two classes each, torus base `(ℤ/5)ˣ/{±1}` of order 2; every `t ∈ (ℤ/8)ˣ` has `t² = 1`, base trivial, 4 genera | pass | none |
| B4 | `!![4,1;1,6]`, `!![2,1;1,12]`, `A₂`, `U` | brute force `(|O|, |SO|) = (2,2), (4,2), (12,6), (4,2)`; `2·#𝒪ˣ = 4, 4, 12` | pass, index 1 at det 23 | R11 |
| B7 | `x²+y²`; `x²−3y²`; `U` | `2π/4 = π/2`; `log(2+√3) ≈ 1.317`; `𝔸ˣ/ℚˣ` infinite, modulus kernel volume 1 | main pass; head's split base wrong | R01 |
| B8 | `A₂`; genus of `!![4,1;1,6]` | `h⁺ = 1`, `w = 6`, `m = 1/12`; `h⁺ = 3`, `a = 1`, `w = 2`: `m = 1/4 + 1/2 = 3/4 = h⁺/(2w)`, against `h/(2w) = 1/2` | pass | none |
| 1H | `u(2)`, `v(2)`; `q₁(2)`, `q₅(2)` | one bilinear module, signs 0 and 4, not isometric; `1/4 ≡ 5/4`, isometric | true; native | R14 |
| 1L | `⟨1⟩`; `⟨2⟩` | `t₊ − t₋ = 1`, odd `w` has `w² ≡ 1 (mod 8)`; without unimodularity, `1` against even `2k²` | true; native | R14 |
| 1I | `⟨2⟩`; `A₂` | sign 1 = 1; sign 2 = 2 | true; native | R14 |
| 2F | `I₂`; `A₂`; `⟨a⟩` | `π ≤ 4`; `π·√2·√2 ≈ 6.28 ≤ 4√3 ≈ 6.93`; `2√a ≤ 2√a` | true | none |
| 2G | `n = 1`, `d = 5`; `d = −1` | one class `(5)`; no positive definite `G`, `S = ∅` | true; native genus form | R17 |
| 4F | `U ⊕ ⟨1⟩`; `U` | infinite; `|O(U)| = 4`, excluded by `3 ≤ rank` | true; native | R14 |
| 5A | `E₈²`, `D₁₆⁺`; `I₈`, `E₈` | both `(16,0,0)`, `A = 0`; `I₈` odd, outside | true | none |
| 5B (`exists_evenLattice_of_lt`) | `q = 0`, `(8,0)`; `q_{⟨2⟩}`, `(2,1)` | `8 ≡ 0`, `0 < 8`: `E₈`; `1 ≡ 1`, `1 < 3`: `⟨2⟩ ⊕ U` | true | none |
| 5G | `(0,0)`; `(1,0)` into `(1,1)` | iff `lp ≡ lm (mod 8)`; `⟨2k⟩ ↪ U` by `(1,k)`, `2·1 ≤ 2` | true | none |
| 6B | `n = 0, 4, 8` | zero lattice; `D₄` det 4, none; `E₈` | true; native | R14 |
| 6C | `I₉`; `E₈ ⊕ I₁` | 18 and 2 vectors of norm 1 | true | none |
| 6D | `d16PlusGram` | det 1, leading minors at least 1, diagonal even | true; native at `k = 2` | R17 |
| 6G | `E₈` | `240·126·23040 = 696729600` | true; native | R14 |
| 7C | `U` at `p = 3, 2`; `I₂` at `p = 3, 5` | counts `4, 12` give `4/3 = 2(1 − 1/3)`; `16, 32 = 2^{r+2}`; `8` gives `8/3`, `ε = −1`; `8` gives `8/5`, `ε = 1` | true; native over `ℤ_[p]` | R17 |
| 7E | `SO(1), SO(2), SO(3)`; `O(0), O(1)` | `1`; `2π`; `2π·4π = 8π²`; `1`; 2 points `= 2·1` | true | none |
| 9B | `E₈`, `S = {E₈}` | `m = 1/696729600` (native `mass_typeE₈RootLattice`), sum equal, complete | true; native | R17 |
| Single carrier display | `A₁`; `ℤe`, `B = 1/2` | `le_dual` and `integral` agree on both | equivalent; display wrong | R15 |
| Class Field Theory contract | head `ringClassField (O)` | no `finrank` binder at `ClassFieldTheory/Suggested.lean:995` | prose false after merge | R13 |
| Hunk | head `binaryRingClassField` | elaborates; its `Nonempty` drops the head's `MulEquiv` | true, data lost | R01, R08 |

## Not verifiable

- **Cox, *Primes of the form x² + ny²*** (cited for B2/B3, B4 and B5; README-flagged
  uncertified): Theorem 7.7 p. 137, Theorem 3.9 p. 50, Theorems 2.8 p. 27 and 2.13 p. 29. It is a
  commercial monograph, with no open copy and no manifest key. The statements were checked
  mathematically and against Tau Ceti's native proofs, whose docstrings cite Cox §7.
- **Cohen, *A Course in Computational Algebraic Number Theory*** (cited for B2 and B5),
  §§5.2, 5.6: commercial monograph, flagged uncertified.
- **Cassels, *An Introduction to the Geometry of Numbers*** (cited for 2F), Chapter VIII:
  commercial monograph, flagged uncertified.
- **Conway–Sloane, *SPLAG*, Chapter 15** (cited for "Genus symbols"): commercial monograph,
  checked only through `allcock-gal-mark2016`.
- **`conway-sloane-mass1988`** (cited for "Mass"): waived in the manifest.
- **`kawauchi-kojima1980`** (cited for 1G): uncertified in the manifest.
- **Nikulin, *Integral symmetric bilinear forms and some of their geometric applications*
  (1979)**, Theorem 1.9.1 (cited for "Nikulin's notation") and Theorems 1.10.1–1.12.4: not in
  the manifest or the cache. This review edits no manifest, so it was not fetched. The statements
  were checked on `⟨2⟩` and `⟨10⟩` only.
- **O'Meara, Serre, Milnor–Husemoller and Cho**: cited outside the sample, not opened.
  `voight2023` (4G) and `boya-sudarshan-tilma2003` (7E) are cached but outside the sample.

## Source issues

- **Error** in Conway–Sloane, *SPLAG* (no manifest key) at Chapter 15, the canonical form of
  2-adic symbols (printed page not checked): the source says that a sign can walk the whole length
  of a train, leaving at most one sign per train; it should allow several signs per train when a
  bad compartment blocks the walk (`allcock-gal-mark2016` lines 919–924); affects a stated result.
