# Review of IntegralLattices (pull request #617 at b254b25)

**Verdict:** needs changes

In this folder the pull request changes three lines of `Suggested.lean`. They follow its own
Class Field Theory change, which dropped the `hquadratic` argument of `ringClassField`. The
branch forked from main at `eaf17b1`, and main then replaced this folder in `47fc6a3`. So the
head carries the old copy: README 2468 lines and `Suggested.lean` 1370 lines, against main's
3092 and 873. The three lines edit declarations that main no longer has.

R01, merging main and taking main's files, cures R02–R08 and the IntegralLattices part of R10.
I tested that on a scratch copy at this head's pins. R11–R16 are in main's text and remain after
R01. R13 is caused by this pull request's Class Field Theory edit, so its repair belongs in this
pull request.

## R01 (P1) — The folder is the stale copy, and its one hunk conflicts with main

- **Location.** `TauCetiRoadmap/IntegralLattices/Suggested.lean:1221, 1281, 1294`, the whole
  diff in this folder: `open TauCetiRoadmap.GlobalNumberFields` and
  `ClassFieldTheory.ringClassField K (orderOfNonsquareBinaryDiscriminant Δ hΔ sqrtΔ hsqrtΔ hquadratic)`.
- **Claim.** The hunk repairs `binaryRingClassField` and `gal_binaryRingClassField_equiv_pic`,
  which main's file no longer contains. As things stand the branch cannot merge. If the conflict
  were resolved toward the head, it would bring back the old copy with every defect in R02–R08.
  Main's `Suggested.lean` imports no roadmap module, so it needs no consumer repair for the
  ClassFieldTheory change.
- **Witness.** `git merge-tree --write-tree origin/main HEAD` reports "CONFLICT (content): Merge
  conflict in TauCetiRoadmap/IntegralLattices/Suggested.lean". `git merge-base --is-ancestor
  47fc6a3 HEAD` fails. Main's `Suggested.lean` contains no `ringClassField`.
- **Repair.** Merge `origin/main` and resolve this folder to main's files:
  `git checkout origin/main -- TauCetiRoadmap/IntegralLattices/README.md
  TauCetiRoadmap/IntegralLattices/Suggested.lean`. The pull request then changes nothing in this
  folder except what R13 asks for. Tested on a scratch copy at this head's pins:
  - Main's `Suggested.lean` elaborates with exit 0 and 31 warnings, all `declaration uses
    'sorry'`.
  - The dependency check on main's README reports `0 problem(s)`.
  - Text scans of main's copy count 0 for pull-request numbers, sorried definitions, examples,
    residue words, roadmap imports and `set_option`.

  This also cures four head-only defects in the sampled sections:
  - B5 has no locator (head 1167–1174). Main 1275–1285 cites Cox 2.8 and 2.13 and Cohen §5.6.
  - B6 has no Checks.
  - Head line 78 says Theta Series imports `TauCetiRoadmap.IntegralLattices.Suggested`. Theta
    Series' file on main imports only `Mathlib` and `TauCeti.*`.
  - "The character of `ℚ/ℤ`" (head 406) names the sorried local `expCircle` (R03).

## R02 (P1) — Gate `depcheck`: an upward edge and a cycle with OrthogonalTamagawaAndLatticeMass

- **Location.** `README.md:1762–1764`: "It is `OrthogonalTamagawaAndLatticeMass`'s first
  obligation". Also the table row at `README.md:2270`: "The local density at 2 (7D, not owned
  here) … which is why 7D is `OrthogonalTamagawaAndLatticeMass`'s".
- **Claim.** The check reads these sentences as supply edges to a roadmap that is later in the
  merge order (position 149) and that consumes this one.
- **Witness.** The check prints `UPWARD: IntegralLattices (on main) ->
  OrthogonalTamagawaAndLatticeMass (#149) at README lines [1763, 2270]`, then `CYCLE among:
  IntegralLattices, OrthogonalTamagawaAndLatticeMass`, then `2 problem(s)`. On main's README it
  prints `239 roadmaps, 2348 edges, 0 problem(s)`.
- **Repair.** R01; tested as above.

## R03 (P2) — Gate `sorry-data`: twelve sorried definitions, five duplicating Tau Ceti

- **Location.** `Suggested.lean` lines 133, 137, 141, 145, 188, 212, 244, 248, 293, 340, 698
  and 1231. For example, line 212: `noncomputable def expCircle (x : AddCircle (1 : ℚ)) : ℂ :=
  sorry`.
- **Claim.** Sorried data is forbidden, and five of these restate definitions that exist at the
  pin. One of them, line 1231 `orderOfNonsquareBinaryDiscriminant … := sorry`, is the order that
  the pull request's own hunk passes to `ringClassField`.
- **Witness.** The Tau Ceti counterparts at the pin `2fd255d`:
  - `IntegralLattice.scale` (`LinearAlgebra/IntegralLattice/Scaling.lean:76`) for `formTwist`;
  - `expCircle` (`Analysis/SpecialFunctions/Complex/Circle/Basic.lean:60`);
  - `FiniteQuadraticModule.gaussSign` (`FiniteBilinearModule/GaussSum.lean:514`);
  - `localizationToCompletion` (`NumberTheory/IntegralLattice/Localization/Basic.lean:154`);
  - `QuadraticOrder.numberFieldOrder` (`NumberTheory/QuadraticOrder/Field.lean:39`).
- **Repair.** R01. Main's file has no sorried definition.

## R04 (P3) — Gate `sorry-examples`: 27 admitted examples

- **Location.** `Suggested.lean` lines 445–1320. For example, line 466: `example :
  (CartanMatrix.E 8).det = 1 :=`, closed by `sorry`.
- **Witness.** Gate rule `sorry-examples`, 27 hits. Main's file has no `example`.
- **Repair.** R01.

## R05 (P3) — Gate `imports`: seven roadmap modules imported

- **Location.** `Suggested.lean:5–11`, from `import Completed.IntegralLattices.Suggested` to
  `import Completed.OrthogonalSpinGroups.Suggested`.
- **Witness.** Gate rule `imports`. Main's file imports `Mathlib` and twenty `TauCeti.*` modules
  only.
- **Repair.** R01.

## R06 (P3) — Gate `prnum`: pull-request numbers in the README

- **Location.** `README.md:7`: "interface already merged in upstream PR #200". Also line 273, and
  `#246` and `#255` at lines 40, 41, 89 and 117.
- **Witness.** Gate rule `prnum`. Main's README has no `#NNN`.
- **Repair.** R01.

## R07 (P3) — Gate `residue`: process words in the README

- **Location.** `README.md:169`: "Nothing here is a stand-in for it". Also line 478, and the
  process word "reviewed" at lines 6, 272, 312, 352 and 365.
- **Witness.** Gate rule `residue`, 2 hits. Main's README passes it.
- **Repair.** R01.

## R08 (P3) — Gate `statement-hygiene`: a `Nonempty` conclusion, in the theorem this hunk edits

- **Location.** `Suggested.lean:1287–1294`, where `gal_binaryRingClassField_equiv_pic` concludes
  `Nonempty ((… ≃ₐ[K] …) ≃* Pic (orderOfNonsquareBinaryDiscriminant …))`.
- **Witness.** Gate rule `statement-hygiene`: "P3 … repair: state the canonical map". Tau Ceti's
  `BinaryQuadraticForm.posDefProperClassEquivGal` is that named equivalence (R11).
- **Repair.** R01. Main has no such theorem.

## R09 (P3) — Gate `outside-folder`: two folders not named as this pull request's own

- **Location.** `Completed/LocalFieldsRamification/` (`COMPLETION.md`, `README.md`,
  `Suggested.lean`) and `Completed/LocalGaloisGroups/` (`README.md`, `Suggested.lean`).
- **Claim.** The brief names IntegralLattices, ClassFieldTheory and QuadraticFormInvariants as
  this pull request's folders, but not these two. The pull request's title and description are
  about LocalFieldsRamification.
- **Witness.** The worker's gate prints `outside-folder` with these five paths.
- **Repair.** Record `Completed/LocalFieldsRamification` and `Completed/LocalGaloisGroups` as this
  pull request's own folders, or move those changes to a pull request of their own. Nothing
  changes in this folder.

## R10 (P3) — Open heads conflict with this one in this folder, and no order is stated

- **Location.** `Suggested.lean`, the whole file. The description names only one revision that
  merges first, and it is neither of the pull requests below.
- **Witness.** The overlap report, re-run against heads indexed at 05:16:54Z, says two things:
  - "#617 and #1411 conflict in … `TauCetiRoadmap/IntegralLattices/Suggested.lean`";
  - "#617 and #1797 conflict in `TauCetiRoadmap/IntegralLattices/Suggested.lean`, …
    QuadraticFormInvariants …".
- **Repair.** R01 removes this pull request's hunk here, so the conflict in this folder
  disappears. State in the description which merges first against #1411, which also conflicts
  in the ClassFieldTheory files and `Completed/LocalGaloisGroups/Suggested.lean`. Do the same for
  #1797, which also conflicts in the QuadraticFormInvariants files.

## R11 (P2) — Layer B is in Tau Ceti at the pin; main's file says B2 and B3 cannot be stated

- **Location.** Main `Suggested.lean:75–79`: "it carries no `NumberField` instance and the order
  `ℤ[(Δ+√Δ)/2]` is not a `NumberFieldOrder` of it … and no ring class field exists at the pin".
  Main `README.md:1165–1290` presents B2–B5 as targets, with "This roadmap proves the
  composite, and neither half". The head has the same at 1032–1174.
- **Claim.** All three carriers exist at the pin, and B2 (both signs) and B3's composite are
  proved there. Most of B1, B4 and B5 is native as well. The README cites none of it.
- **Witness.** These all `#check` at `2fd255d`: `QuadraticAlgebra.instNumberField`,
  `QuadraticOrder.numberFieldOrder`, `ClassFieldTheory.ringClassField`,
  `BinaryQuadraticForm.posDefProperClassEquivPic`, `properClassEquivNarrowPic`,
  `posDefProperClassEquivGal`, `IntegralLattice.index_specialOrthogonalGroup_eq_two_iff_reflected`
  and `picClass_primitiveReducedForms_bijective`.
- **Repair.**
  - Replace the B2/B3 bullet of the docstring with a sentence saying they are proved in Tau Ceti,
    naming the declarations above.
  - Add their files to §*From Tau Ceti*, under `TauCeti/NumberTheory/`:
    `NumberField/QuadraticAlgebra.lean`; `QuadraticOrder/Field.lean`;
    `ClassFieldTheory/ClassFields/RingClass/Field.lean`;
    `BinaryQuadraticForm/Ideal/{PicEquivalence, Narrow/Equivalence, RingClassField, Reflection,
    ClassNumber}.lean`; `IntegralLattice/Binary/{NormForm, Isometry, NormOne, SplitClass,
    Determinant23}.lean`.
  - Rewrite B1–B5 as consumed and keep their Checks. Keep as a target only what the pin lacks,
    after checking the split branch against `BinaryQuadraticForm/Split/` and
    `QuadraticOrder/Split/`, which already classify the forms `(0, s, c)` and their stabilizers.
  - Point B3's supplier row at Tau Ceti's `ringClassField` and `ringClassArtinEquiv`.

  On the refuting instance, `posDefProperClassEquivGal` at `n = 23` matches the three reduced
  forms of B5's Check.

## R12 (P2) — B3's displayed isomorphism omits "positive definite" (sampled)

- **Location.** Head `README.md:1103–1107` and main `README.md:1209–1213`: "Gal(H_{𝒪_Δ}/K_Δ) ≃
  Pic 𝒪_Δ ≃ proper equivalence classes of primitive forms of discriminant Δ … for `Δ < 0`".
- **Claim.** For `Δ < 0` the primitive forms include the negative definite ones, so the right
  side is twice the size of `Pic`.
- **Witness.** At `Δ = −4`, `Pic ℤ[i]` is trivial, but `x² + y²` and `−x² − y²` are two proper
  classes. B2 itself restricts to positive definite forms, and so does Tau Ceti's
  `PosDefProperClass`.
- **Repair.** Write "proper equivalence classes of primitive positive definite forms of
  discriminant Δ". With that change, `Δ = −4` gives `1 = 1` and `Δ = −23` gives `3 = 3`.

## R13 (P3) — The Class Field Theory contract no longer matches this pull request's Class Field Theory

- **Location.** Main `README.md:479` (head 478): "Each of these takes an order in a number
  **field** together with `Module.finrank ℚ K = 2`". Main 1220–1221 (head 1114–1115) says the
  same of `ringClassField`.
- **Claim.** This pull request drops the quadratic hypothesis. At this head, `ringClassField`,
  `ringClassArtinMap` and `gal_ringClassField_equiv_pic` take only `O : NumberFieldOrder K`, and
  they re-export Tau Ceti's declarations. After the merge both sentences are false. Their
  conclusion still holds through `[Field K]`: `ℚ × ℚ` cannot be supplied.
- **Witness.** `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:704, 710, 721` at this head. Main's
  ClassFieldTheory `Suggested.lean:4318–4351` carried `(hK : Module.finrank ℚ K = 2)`.
- **Repair.** In both places, write that each takes a `NumberFieldOrder K`, hence `[Field K]` and
  `[NumberField K]`, and that B1's nonsquare constructor supplies the quadratic `K`. Main's lines
  1045–1047 already say this. Cite the objects as Tau Ceti's (R11). This is the README half of
  the consumer repair that the stale hunk made in `Suggested.lean`.

## R14 (P3) — Main's `Suggested.lean` restates theorems Tau Ceti proves, as headlines

- **Location.**
  - Main `Suggested.lean` lines 111 `vanDerBlij`, 211 `nonempty_isometry_iff_gaussSign_eq`, 228
    `milgram`, 357 `infinite_isometry_of_isIndefinite`, 570
    `exists_isEven_isUnimodular_isPosDef_iff`, 577
    `nonempty_isometry_typeE₈RootLattice_of_isEven_of_finrank_eq_eight` and 688
    `natCard_isometry_typeE₈RootLattice`.
  - Restatements in other forms: 271 (2F), 342 (4E rank 2), 586 and 595 (6C), 677 (6H).
- **Claim.** These are padding, or duplicates of native theorems, and the README presents them
  as targets. The paragraph "Two things that look like duplication and are not" (main 206–212)
  has two errors:
  - It calls Milgram's theorem at every signature this roadmap's, but Tau Ceti proves it.
  - It credits Theta Series with the positive definite case, but Theta Series' 6C states only
    even rank `n = 2k`.
- **Witness.** In a scratch file, each of the first seven closes with one term or `simp`. The
  sources are `vanDerBlij` (`Characteristic/VanDerBlij.lean:141`),
  `nonempty_isometry_iff_bilinear_isometry_and_gaussSign_eq` (`Comparison.lean:175`),
  `gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg` (`Milgram.lean:313`),
  `infinite_isometry_of_isIndefinite`, `exists_isEven_isUnimodular_isPosDef_iff`,
  `IsPosDef.nonempty_isometry_typeE₈RootLattice_of_isEven` and `card_isometry_typeE₈RootLattice`.
- **Repair.**
  - Delete the seven from `Suggested.lean` and name them in the docstring as proved in Tau Ceti.
  - List their files in §*From Tau Ceti*, together with `PosDef/Minkowski.lean:219`,
    `PosDef/SmallRankUnimodular.lean:378`, `Cancellation.lean:311` and
    `Binary/ClassNumber.lean:93`.
  - Keep the other-form restatements only with one clause each saying how they differ from the
    native theorem.
  - Reword the "Two things …" paragraph on both counts.

## R15 (P3) — "The single lattice carrier" displays fields the pinned structure lacks

- **Location.** Head `README.md:277–283` and main `README.md:223–229`: `[isLattice :
  carrier.IsLattice ℚ]` and `integral : ∀ x ∈ carrier, ∀ y ∈ carrier, form x y ∈ (1 : Submodule ℤ
  ℚ)`.
- **Witness.** `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63–73` has an explicit
  `isLattice` field and `le_dual : carrier ≤ form.dualSubmodule carrier`, and no `integral`
  field.
- **Repair.** Display the pinned fields and file. The two forms are equivalent: `ℤe` with
  `B(e,e) = 1/2` fails both, since its dual is `2ℤe ⊉ ℤe` and `1/2 ∉ ℤ`, while `A₁` satisfies
  both. The README's own "Dual lattice" paragraph already says that integrality is `L ≤ L^⋆`.

## R16 (P3) — 3E's Allcock–Gal–Mark locator names the unimodular theorem

- **Location.** Main `README.md:857`: "(Theorem 5.1 there, which proves the canonical symbol a
  complete invariant)". Head 874 gives no theorem number.
- **Witness.** In `allcock-gal-mark2016`:
  - line 686 is Theorem 5.1, which classifies unimodular lattices by dimension, type, sign and
    oddity;
  - line 849 is Theorem 6.2;
  - line 864 is Theorem 6.3;
  - line 917 is Corollary 6.4, the canonical form as a complete invariant.
- **Repair.** Cite "Theorems 6.2 and 6.3, p. 20, and Corollary 6.4, p. 21, with Theorem 5.1,
  p. 16, for the unimodular constituents". This is also the manifest's locator.

## Verified sound

**Change set.** `git diff origin/main...HEAD -- TauCetiRoadmap/IntegralLattices` consists of the
three changed lines of `Suggested.lean` at 1221, 1281 and 1294. Outside the brief's three named
folders the diff is the five `Completed/` files of R09. Since the fork, main has changed this
folder in `47fc6a3`, which rewrote the README and `Suggested.lean`, and in a generated progress
report.

**Gate, my run.** It reports:
- `prnum=2 sorry-data=12 sorry-examples=27 residue=2 imports=1 statement-hygiene=1 depcheck=2`;
- `outside-folder=9`, which is the five files of R09 plus the four ClassFieldTheory and
  QuadraticFormInvariants files the brief names;
- every other check 0.

These are the worker's figures.

**Elaboration.** `lake env lean` on this head's `Suggested.lean` exits 0 with 69 warnings, all
`declaration uses 'sorry'`. The changed lines elaborate against this head's
`ClassFieldTheory.ringClassField (O)`. Main's copy elaborates at the same pins with exit 0 and 31
`sorry` warnings.

**Signatures.** I put `#check @name` for the 68 head declarations into one scratch file, and it
elaborated with no error. I compared the elaborated types with the README:
- `vanDerBlij` carries `[FiniteDimensional ℚ V] [L.IsNondegenerate]`;
- `finite_classes_of_posDef` quantifies over symmetric positive definite `G` of determinant `d`;
- `padicDiscriminant` takes values in `SquareClassGroup ℚ_[p]`.

No binder was lost. The file is replaced under R01 in any case.

**Dependency check.**

```text
head:  UPWARD: IntegralLattices (on main) -> OrthogonalTamagawaAndLatticeMass (#149) at README lines [1763, 2270]
       CYCLE among: IntegralLattices, OrthogonalTamagawaAndLatticeMass
       depcheck: 239 roadmaps, 2345 edges, 2 problem(s)
main:  depcheck: 239 roadmaps, 2348 edges, 0 problem(s)
```

**Cross-roadmap citations resolved at this head, 13 in all.**
- Class Field Theory:
  - `ringClassField` at `Suggested.lean:704`;
  - `ringClassArtinMap` at 710;
  - `gal_ringClassField_equiv_pic` at 721;
  - `hilbertProductFormula` at 745.
- Quadratic Form Invariants:
  - `hilbertSymbol_productFormula` at `Suggested.lean:2578`;
  - `hilbertSymbol_eq_cohomological` at 2552;
  - heading "6D. The classification and its corollaries" at `README.md:2168`.
- Global Number Fields: `NumberFieldOrder.isProper_iff_isUnit_of_finrank_eq_two` is at
  `Completed/GlobalNumberFields/Suggested.lean:777`. The citation tool's lead on head line 477
  is a false positive, because it searched only the pins.
- Theta Series on main:
  - Layer 2, the bridge, at `README.md:484`;
  - 6C, Milgram's formula for positive definite lattices of even rank, at 769–782;
  - the conventions `exp(π i ‖v‖² τ)`, `(τ/i)^k = (-i)^k τ^k` and `(covolume L)⁻¹ =
    (det L)^{-1/2}` at 18, 27 and 761.
- Tau Ceti: `equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq` at
  `NumberTheory/LocalField/QuadraticForm/Classification.lean:190`.

**Library declarations opened at the pins (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`).**
- `IntegralLattice`: `Basic.lean:63–73`, and `finrank_carrier` at 126.
- `IsPosDef`, `IsNegDef`, `IsIndefinite`: `Signature.lean:171, 179, 188`. They match
  "Definiteness".
- `dualCarrier` (`Dual/Basic.lean:75`) is `form.dualSubmodule carrier`. It matches "Dual
  lattice".
- `rationalizationIsometry` (`Rationalization.lean:91`) is
  `(L.integralForm.baseChange ℚ).IsometryEquiv L.form`. It matches "Rational ambient space".
- `expCircle` (`Circle/Basic.lean:60`) is an `AddChar` with value `e^{2πi r}`.
- Mathlib needs `[Invertible (2 : Module.End R N)]` for `associated` (`QuadraticForm/Basic.lean:842`)
  and `[Invertible (2 : R)]` for `toMatrix'` and `discr` (1159). `baseChange` has the same need
  (`QuadraticForm/TensorProduct.lean:40`). This confirms the convention "Do not use the
  associated bilinear form over ℤ".
- The native declarations of R03, R11 and R14, at the lines quoted there.
- `Matrix.localDensityCount` (`LocalDensity/Basic.lean:110`) is defined over `ℤ_[p]`, while
  main's `localDensityCount` is over `ℤ`.

**Ownership against open pull requests.** I compared ownership with the closest open roadmaps
in vocabulary: Theta Series, OrthogonalTamagawaAndLatticeMass, LatticePackingsAndPerfectForms,
GeometryOfNumbersAndQuadraticArithmetic Part II and OrthogonalSpinGroups. Each cites this
roadmap's labels and claims no second ownership: for example 2E–2G, 6C, 6D, 7C, 1I and 1L, and
Theta Series' 6D. No README id cited here is dropped by an open head, and only R10's conflicts
remain.

**Headline theorems.** Main's docstring, lines 38–56, lists them:
- 1H (Nikulin 1.11.3), 1L, 1I;
- 2F, 2G;
- 4B, 4E, 4F;
- 5A; 5B, 5G and 5J (Nikulin 1.10.1, 1.10.2, 1.12.2, 1.12.4, 3.6.2);
- 6A, 6B, 6C, 6D, 6H, 6E, 6G;
- 7C, 7E;
- 9B.

Each is stated. The docstring names 3E/3G and 4C as not statable. Its claim for B2/B3 is false
(R11), and R14 lists the headlines Tau Ceti already proves. The head's own file is the old
catalogue, which R01 replaces.

**Adversarial pass.** Values were computed by hand in exact arithmetic, except the 7C counts,
which a brute-force count over `(ℤ/p^r)^4` produced.

| Statement | Instances | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| The bridge is theirs | `A₂` in both models | rational: Gram `!![2,−1;−1,2]`, `det 3`, `A_L = ℤ/3`; real: two vectors of length `√2` at 120°, covolume² = 3, `|L^∨/L| = 3` | agree; Theta Series Layer 2 exists | none |
| Two things look like duplication (Milgram) | `A₂`; `⟨2⟩` | `1 + 2e(1/3) = i√3 = √3·e(2/8)`, sign `2 = t₊−t₋`; `1 + i = √2·e(1/8)` holds, but Theta 6C excludes odd rank | formula true; attribution over-broad | R14 |
| The bilinear form is the primary datum | `A₂`; `⟨1⟩` | `Q = x² − xy + y²`, polar `2xx' − xy' − x'y + 2yy'` = Gram; `⟨1⟩`: `B(1,1)/2 = 1/2 ∉ ℤ`, no `Q`; `polar(x,x) = 2Q(x)` fixes `Q` | pass | none |
| Definiteness | `E₈(−1)`; `Ã₁ ⊕ ⟨−1⟩`; `x²+y²−3z²` | `NegDef` via `isPosDef_neg_iff`; `(t₊,t₀,t₋) = (1,1,1)`, indefinite and degenerate; `(2,0,1)` | pass; matches `Signature.lean:171–188` | none |
| Rational ambient space | `⟨2⟩ = ℤe` | `V = ℚ ⊗ ℤ = ℚ`, `B = 2xy`; `rationalizationIsometry` | pass | none |
| Dual lattice | `A₂`; `⟨2⟩`; `ℤe`, `B = 1/2` | `L^⋆/L = ℤ/3`, generator `(2e₁+e₂)/3`; `½ℤe/ℤe = ℤ/2`; dual `2ℤe ⊉ ℤe` | pass | R15 (display) |
| Genus symbols | `⟨1,−1,3⟩`, `⟨−1,−1,−3⟩`, `⟨3,3,−3⟩` | det `±3`, sign `−`; oddities `3`, `−5 ≡ 3`, `3`; one symbol (AGM line 72–76); SPLAG canonical-form error at AGM 919–924 | pass | R16 (locator) |
| Character of `ℚ/ℤ` | `1/2`, `1/4`; wrong model `e^{πix}` | `−1`, `i`; `e^{πi·1} = −1 ≠ 1`, so it is not well defined on `ℚ/ℤ` | pass on main; head names sorried def | R01, R03 |
| Theta conventions | `k = 1`; `A₂` | `τ/i = −iτ`; covolume `√3 = (det)^{1/2}`, `|A_L|^{-1/2} = 3^{-1/2}` | pass | none |
| Mass | rank 0, `⟨a⟩`, `I₂`, `E₈` | `m = 1`, `m⁺ = 1 ≠ 2m`; `m = 1/2`, `m⁺ = 1`; `1/8`; `1/696729600` | pass; 7A excludes rank 0 | none |
| B3 display | `Δ = −23`; `Δ = −4` | `#Pic = 3` = PD classes `(1,1,6),(2,±1,3)`; `#Pic = 1` vs all primitive classes `2` | fails as written | R12 |
| B3 composite | `n = 23` | `posDefProperClassEquivGal`: `#Gal = 3` | native | R11 |
| B4 | `!![4,1;1,6]`; `U`; `A₂` | norm-4: `±e₁`; norm-6: `±e₂` (`x = −1/2` rejected), `|O| = 2` vs `2·#𝒪ˣ = 4`; `|O(U)| = 4 = 2·2`; `|O(A₂)| = 12 = 2·6` | pass; native `index_specialOrthogonalGroup_eq_two_iff_reflected` | R11 |
| B5 | `Δ = −23`; `Δ = −3`; `Δ = 25` | `a ≤ √(23/3) < 3`: 3 reduced forms; `(1,1,1)` only; `φ(5) = 4` forms `5xy + cy²` | pass | R01 (head locator) |
| B6 | `x²+y²`; `x²−3y²`; `U` | `T(ℤ) = {±1, ±i}`, `w = 4`; `N(2+√3) = 1`, `T(ℤ)` infinite; `T(ℤ) = {±1}` | pass (main Checks) | R01 (head Checks) |
| B8 | `A₂`; genus of `!![4,1;1,6]` | `m = 1/12 = h⁺/(2w)`; `|O(!![2,1;1,12])| = 4` via `(x,y) ↦ (x+y,−y)`, `m = 1/4 + 1/2 = 3/4 = h⁺/(2w)`; `h/(2w) = 1/2` | pass | none |
| 7C counts (main docstring) | `U` at `p = 2, 3`; `I₂` at `p = 3, 5` | `6, 16, 32, 64` (`r = 1..4`), so `α₂ = 4`; `4, 12` → `4/3`; `8, 24` → `8/3`; `8` → `8/5`; formula `2(1 − ε/p)`, `ε = 1, −1, 1` | pass | none |
| Hunk: `binaryRingClassField` | this head's ClassFieldTheory | `ringClassField (O)` takes no `finrank` argument; IntegralLattices README says it does | Lean true, prose false | R13 |
| 1H (Nikulin 1.11.3) | `u⁽²⁾(2)`, `v⁽²⁾(2)`; `q₁`, `q₅` on `ℤ/2` | Gauss sums `2 = 2e(0)`, `−2 = 2e(4/8)`; `1/4 ≡ 5/4`, both `1 + i` | true; native | R14 |
| 1I, 1L | `⟨2⟩`, `A₂`, `E₈`; `⟨1⟩` | signs `1, 2, 0` = `t₊−t₋`; `w² ≡ 1 = σ` | true; native | R14 |
| 2F | `⟨a⟩` | main form `2√a ≤ 2√a`; native `πa ≤ 4·(π/4)·a` | equivalent; native | R14 |
| 6B, 6G | `n = 0, 4, 8`; orbit chain | `D₄` det `4`; `240·126·23040 = 696729600` | true; native | R14 |
| Single carrier | `A₁`; `ℤe`, `B = 1/2` | `le_dual` ⇔ `2 ∈ ℤ`; `2ℤe ⊉ ℤe` ⇔ `1/2 ∉ ℤ` | equivalent; display wrong | R15 |

## Not verifiable

- **Cox, *Primes of the form x² + ny²*.** Cited are Theorem 7.7, p. 137 (B2/B3, flagged
  uncertified); Theorem 3.9, p. 50 (B4, flagged); and Theorems 2.8, p. 27, and 2.13, p. 29 (B5).
  It is a commercial monograph with no open-repository copy and is not in the manifest. The
  statements were checked mathematically, and also against Tau Ceti's native proofs, whose
  module docstrings cite Cox §7.
- **Cohen, *A Course in Computational Algebraic Number Theory*,** §5.2 (B2, flagged) and §5.6
  (B5). Commercial monograph, no open copy.
- **Cassels, *An Introduction to the Geometry of Numbers*,** Chapter VIII (2F, flagged).
  Commercial monograph. The statement is checked against the native Tau Ceti theorem.
- **Conway–Sloane, *SPLAG*, Chapter 15** ("Genus symbols"). Commercial monograph. It is checked
  only through `allcock-gal-mark2016`.
- **`conway-sloane-mass1988`,** equation (1) and §§3, 6 ("Mass"). The manifest records it as
  waived.
- **`kawauchi-kojima1980`** (1G, flagged). The manifest records it as uncertified.
- **O'Meara, Serre, Milnor–Husemoller.** Books, cited at sampled targets only through statements
  checked mathematically above.

## Source issues

- **Error** in Conway–Sloane, *SPLAG* (cited by the README; no manifest key) at Chapter 15, the
  canonical form of 2-adic symbols (printed page not checked): the source says a sign can walk
  the whole length of a train, leaving at most one sign per train; it should allow several signs
  per train when a compartment's oddity blocks the walk (`allcock-gal-mark2016` lines 919–924);
  affects a stated result.
