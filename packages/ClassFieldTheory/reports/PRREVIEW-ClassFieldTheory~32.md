# Review of ClassFieldTheory (pull request #1411 at 69323b7)

**Verdict:** needs changes

:robot: AI-assisted review (Claude Opus 5.5). This is a full review of `TauCetiRoadmap/ClassFieldTheory/` at this head. The folder is unchanged since a5227b0. There are seven findings, all P3. None is false, vacuous or unowned. The worker's gate passes; my own rerun differs only as explained under *Verified sound*.

## R01 (P3) — Target names of main's `Suggested.lean` that other roadmaps cite are dropped with no old → new line

**Location.** README:193–198. The renumbering list maps only §2.4, §2.5, §2.6 and §4. This head no longer declares the main names listed below.

**Claim.** The pull request drops these target names. Other roadmaps cite them as ClassFieldTheory's, so those citations break at the merge. The README gives no old → new line for them. The overlap tool lists only section ids, so it misses them.

**Witness.** Citations of the dropped names in other roadmaps, at main or at their open heads:

- `eq_zero_of_localInv_eq_zero` (main `Suggested.lean:3116`) is cited by:
  - ArithmeticGaloisRepresentations (#856), README:534 and :5014;
  - GL2AutomorphicRepresentationsAndTransfer (#931), README:407 and :1523;
  - PotentialModularityAndCompatibleSystems (#1075), README:1170;
  - AbelianVarietiesOverFiniteFields (#1720), README:388;
  - QuaternionArithmetic (#1722), README:274;
  - QuadraticFormInvariantsPartII (#1834), README:297.
- `sumLocalInv_eq_zero` (main `:3128`): #856 README:534 and :5014; #1720 README:388; #1722 README:274.
- `cd_p_absoluteGaloisGroup_eq_two` (main `:1898`): ArithmeticGaloisDuality (#858) README:472; #1834 README:296 and :1807.
- `localSymbol_kummerClass_eq_zero_iff` (main `:1242`): ClassicalArithmeticCompletion **on main** (README:169) and at #1409 (README:146). The citation on main breaks when this pull request merges.
- `muNRepCoeffDictionary_continuous` and `_equivariant` (main `:789–795`): QuadraticFormInvariants at #1187, README:584–585.

The sweep ran `roadmaps grep` over main and every open head. It covered the 90 names that main's `Suggested.lean` declares, that this head drops, and that have no Tau Ceti namesake. Hits in ClassFieldTheory's own revisions (#617, #1215) and in this pull request's folders are left out. The names above are all that remain.

**Repair.** Add one line per cited name to the list at README:193–198 (the heading becomes "Other roadmaps cite these sections and targets"). Each right-hand side below exists at the pin:
- `eq_zero_of_localInv_eq_zero` (main `Suggested.lean:3116`) → Tau Ceti's `brLocalization_injective` (`Global/Brauer/SumFormula.lean:135`);
- `sumLocalInv_eq_zero` (main `:3128`) → `sumLocalInv_brLocalization_eq_zero` (`SumFormula.lean:142`), now stated on `brLocalization K x`;
- `cd_p_absoluteGaloisGroup_eq_two` (main `:1898`) → `cohomologicalDimensionAt_absoluteGaloisGroup_eq_two` (`Local/CohomologicalDimension/AbsoluteGaloisGroup.lean:104`);
- `muNRepCoeffDictionary` and its `_continuous` and `_equivariant` laws (main `:785–795`) → `kummerCoeffEquivMuNRep` and `kummerCoeffEquivMuNRep_smul` (`MuNRep.lean:150`, `:165`);
- `localSymbol_kummerClass_eq_zero_iff` (main `:1242`) → `forall_localSymbol_kummerClass_eq_zero_iff` (`Local/HilbertPairing.lean:61`).

Tested: each right-hand name is in my index of the pinned Tau Ceti declarations, at the file and line given. Each old name appears exactly once on the left.

## R02 (P3) — Layer 7 restricts the continuity of `artinMap` to `K/ℚ_p`, and its reason fails in equal characteristic

**Location.** README:1383–1385: "For `K/ℚ_p` finite it is continuous (`continuous_artinMap`): the preimage … is `normGroup K L`, which contains the `[L:K]`-th powers, an open subgroup."

**Claim.** The pinned theorem has no characteristic hypothesis, so the README narrows it. The reason given also fails when the residue characteristic `p` divides `[L:K]` in equal characteristic. Layer 7's unit-filtration reciprocity is stated in both characteristics, and consumers read this sentence for the topology of the Artin image.

**Witness.**
- `continuous_artinMap` (`Local/ArtinMap.lean:249`) sits in the section of line 106, whose only binders are `[Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]`. Its proof uses `isOpen_localNormSubgroup`, which rests on `isOpen_normGroup` (`LocalField/Norm/Open.lean:102`).
- Take `K = 𝔽_p((t))` and `L` given by `y^p − y = t⁻¹`, of degree `p`. Then `(Kˣ)^p = 𝔽_p((t^p))ˣ` contains no `1 + t^m` with `p ∤ m`, so it contains no `U_K^(n)` and is not open. Meanwhile `normGroup K L ⊇ U_K^(2)`, since the conductor exponent is 2, so it is open.

**Repair.** Replace the sentence with: "It is continuous for every nonarchimedean local field (`continuous_artinMap`): the preimage of the open subgroup cutting out a finite abelian `L/K` is `normGroup K L`, which is open." On the witness: `normGroup K L ⊇ U_K^(2)` is open, while the `p`-th powers are not.

## R03 (P3) — Layer 5 cites Milne III 2.3–2.6 for the unit Herbrand quotient in either characteristic, but Milne proves Lemma 2.4 only in characteristic zero

**Location.**
- README:964–965: "Tau Ceti proves, in this order (Milne, *Class Field Theory*, III, Lemmas 2.3–2.6)". The first bullet's route is the lattice `A` with `A · A ⊆ πA` and the subgroup `1 + A`.
- README:1002–1003: "cardinal exactly `m`, in either characteristic".
- References README:2445–2446 cite Serre's Cassels–Fröhlich chapter with no locator.

**Claim.** The cited source supports the statement only in characteristic zero. Milne obtains the open cohomologically trivial subgroup of `U_L` from the exponential. The README's characteristic-free route `1 + A` is Serre's, and Serre's chapter is cited without a section or page.

**Witness.** Lemma 2.4 says Milne proves it "only for K of characteristic zero" (milne-cft line 4733), using the exponential (lines 4734–4741). The footnote sends the characteristic-`p` case to "p. 134 of Serre 1967b" (milne-cft line 4743); Serre 1967b is the Cassels–Fröhlich chapter (milne-cft line 12971).

**Repair.**
- At README:965, cite "(Milne, *Class Field Theory*, III, Lemmas 2.3–2.6, Lemma 2.4 in characteristic zero; for every characteristic, Serre, *Local class field theory*, in Cassels–Fröhlich, p. 134)".
- Give the References entry at README:2445 the same page.

Tested: `herbrandQuotient_unitFiltration_zero` (`UnitFiltration/TateCohomology.lean:291`) has no characteristic hypothesis, and its proof builds the lattice `1 + A`. So the corrected locator matches the pinned statement.

## R04 (P3) — The README and the module docstring say that IntegralLattices' Lean file uses this module; at this head it does not

**Location.**
- README:565–566 and `Suggested.lean:64–65`: "the Lean files of `LocalGaloisGroups`, `GlobalQuadraticForms` and `IntegralLattices` use through it".
- README:2406–2407: "`IntegralLattices` consumes `ringClassField`, `ringClassArtinMap`, `gal_ringClassField_equiv_pic` and the Hilbert invariants".

**Claim.** Both statements are false at this head. Since IntegralLattices is one of this pull request's own folders, the inconsistency lies inside the pull request. The stated reason for keeping `ringClassField`, `ringClassArtinMap` and `gal_ringClassField_equiv_pic` (`Suggested.lean:727–744`) in the file no longer holds.

**Witness.**
- `TauCetiRoadmap/IntegralLattices/Suggested.lean:3–21` imports only Mathlib and `TauCeti.*` modules.
- Its README:128 reads "Tau Ceti, natively: `TauCeti.ClassFieldTheory.ringClassField` and `TauCeti.ClassFieldTheory.ringClassArtinEquiv`", and README:453 and :1054–1056 likewise.
- From this roadmap it cites only `hilbertProductFormula` (README:480, :905, :1038), not the Hilbert invariants.

**Repair.**
- README:565–566 and `Suggested.lean:64–65`: say "`LocalGaloisGroups` and `GlobalQuadraticForms`".
- README:2406–2407: say "`IntegralLattices` consumes Tau Ceti's `ringClassField`, `ringClassArtinMap` and `ringClassArtinEquiv` natively, and Layer 14's `hilbertProductFormula`".
- Keep the three ring-class abbrevs, because other roadmaps cite them under this roadmap's name: GrossZagierAndArithmeticHeights README:156 and EllipticCurvePeriodsAndModularParametrizations README:315–316. Say so in the sentence at README:564–566.

## R05 (P3) — `conductorExponent_eq_sInf_upperRamificationGroup` is padding: one `exact` closes it

**Location.** `Suggested.lean:518–532`; README:1414 and :2415; module docstring `Suggested.lean:117–119`.

**Claim.**
- The declaration is a closed corollary, neither an open target nor a Tau Ceti declaration that a consumer's Lean file uses. README:557–570 itself admits only those two kinds to the file.
- No Lean file imports it: LocalGaloisGroups and GlobalQuadraticForms do not use it.
- It closes in one term from the library.

**Witness.** On a scratch copy elaborated with `lake env lean`, the following closes the statement with no error:

```lean
exact (IsLeast.csInf_eq ⟨(conductorExponent_le_iff_upperRamificationGroup_eq_bot K L).1 le_rfl,
  fun _ hn => (conductorExponent_le_iff_upperRamificationGroup_eq_bot K L).2 hn⟩).symm
```

**Repair.**
- Delete it from `Suggested.lean` and from the docstring item 6.
- In README:1413–1414, keep the statement in prose ("so `conductorExponent K L` is the least `n ≥ 0` with `G^n = 1`") without the name. Do the same at README:2415.
- PadicPeriodRings' supplier row (#940, README:34) cites the name, so add the line "`conductorExponent_eq_sInf_upperRamificationGroup` → Tau Ceti's `conductorExponent_le_iff_upperRamificationGroup_eq_bot`" to the list of R01.

Values: for `ℚ_2(√2)/ℚ_2`, `sInf {n | G^n = 1} = 3` and the conductor exponent is 3. Unramified: 0 = 0. `ℚ_p(ζ_p)`: 1 = 1.

## R06 (P3) — README:940 keeps `muNRepCoeffDictionary` as this roadmap's name, but nothing declares it

**Location.** README:939–941: "with `muNRepCoeffDictionary`, Tau Ceti's `kummerCoeffEquivMuNRep`, identifying its carrier".

**Claim.** A backticked name of this roadmap's own claims that `Suggested.lean` declares it. This head deleted the declaration (main `Suggested.lean:785`), Tau Ceti has no declaration of that name, and so the name is dangling.

**Witness.** My index of every declaration at the pinned Mathlib and Tau Ceti has no `muNRepCoeffDictionary`, and this head's `Suggested.lean` does not declare it.

**Repair.** Write "with Tau Ceti's `kummerCoeffEquivMuNRep` identifying its carrier with `KummerCoeff F n` equivariantly (`kummerCoeffEquivMuNRep_smul`)". The old name goes into the list of R01, because QuadraticFormInvariants at #1187 (README:584) cites `muNRepCoeffDictionary_continuous`.

## R07 (P3) — The pull request edits `Completed/LocalGaloisGroups/Suggested.lean`, which the brief does not name as one of its folders

**Location.** `Completed/LocalGaloisGroups/Suggested.lean:326` and `:485`. `git diff --stat origin/main...HEAD`, with the three named folders excluded, lists this file.

**Claim.** The file lies outside ClassFieldTheory, IntegralLattices and QuadraticFormInvariants. The edit is forced and correct: main's `h2MuEquivZMod_mixed` and `h2FpEquivZMod_of_mu` were `Nonempty (… ≃+ ZMod n)` statements, and this head makes them the canonical equivalences, so the importing consumer wraps them in `⟨…⟩`. This repeats R03 of the review at 15207f6.

**Repair.** Nothing changes in this folder. The pull request's folder list must include `Completed/LocalGaloisGroups`, as its description already says, so that the file gets its own review.

## Verified sound

**Gate, dependencies and build**
- The worker's gate at 69323b7 passes every check, with `build=0` (`gate.md`).
- My rerun without the folder list reports only `outside-folder=5`, all on IntegralLattices and QuadraticFormInvariants files, which the brief names as this pull request's own. Every other check is 0. The gate does not flag `Completed/LocalGaloisGroups`, so R07 rests on the brief's diff rule.
- The dependency check prints `depcheck: 237 roadmaps, 2312 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `lake env lean` on `Suggested.lean` exits 0 in 11 s. Its only warnings are five `sorry` warnings, at lines 406, 508, 558, 705 and 715.

**Signatures** (all 55 elaborated types in `signatures.md`, compared with the README)
- The two the tool flagged, `restrictAbsolute` and `absoluteGaloisGroupExtend`, lack local-field binders. That is correct: they are field-theoretic restriction and extension along an embedding.
- `map_unitFiltration_normResidue` keeps `[ValuativeExtension K L] [Module.Finite K L] [IsAbelianGalois K L]` and both fields' local-field binders.
- `localAbsoluteUpperRamificationGroup` and `closure_map_artinMap_unitFiltration` take one nonarchimedean local field. There is no characteristic hypothesis, as the README says (either characteristic).
- `relDiscr_eq_finprod_abelianConductor` has `[IsAbelianGalois K L]` over number fields.
- `algebraMap_vle_algebraMap_iff_of_finite_padic` assumes no continuity, as the README states.

**Padding probe**
- On a scratch copy, `first | rfl | simp | infer_instance | decide | (simp_all) | aesop` leaves all five `sorry` targets unsolved.
- The one-term closure of `conductorExponent_eq_sInf_upperRamificationGroup` is R05.
- The remaining closed declarations are aliases that other roadmaps' Lean files or READMEs use. LocalGaloisGroups uses `GalRep`, `H`, `muNRep`, `muNRepEquivZMod`, `muNRep_ρ_eq_self`, `kummerEquiv_mixed`, `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu`, `kummerCupPairing(_bil)`, `eulerCharacteristic_finrank_fp`, `normResidue`, `scd_p_absoluteGaloisGroup_eq_two`, `artinMap`, `absoluteGaloisGroupExtend`, `artinMap_norm`, the three cyclotomic theorems and the two `TateCohomology` ones.
- GlobalQuadraticForms uses `principalIdele`, `ideleNormMap`, `ideleClassNorm`, `card_ideleClassNormQuotient`, `cyclicHasseNorm`, the three norm predicates, `isGlobalNorm_iff_isLocalNormEverywhere` and `hilbertProductFormula`.
- `restrictAbsolute` is cited at LocalGaloisGroups README:178, and the `kummerClass` trio at QuadraticFormInvariants README:302.

**Headline theorems** (the README's Scope items 1–14)
- The open headlines are stated in `Suggested.lean`:
  - finite unit-filtration reciprocity;
  - its absolute form, with the one definition it needs;
  - the principal ideal theorem;
  - the conductor–discriminant formula.
- Every other headline is a Tau Ceti theorem at the pin and is named in the docstring's inventory. I opened these at the pin:
  - `tateTheorem` (`Formation/Tate/Theorem.lean:122–127`, with `h1`, `hcard` and `hgen` as separate arguments);
  - `ClassFormation.artinEquiv` (`Formation/ArtinMap.lean:139`);
  - `localClassFieldCorrespondence` (`LocalExistence/Correspondence.lean:138`) and its prime-to-residue-characteristic form (`:238`);
  - `localWeilArtinEquiv` (`WeilGroup/Reciprocity.lean:70`);
  - `exists_br_of_sum_eq_zero` (`Global/Brauer/Exactness.lean:98`);
  - `globalArtinMap_local` (`Global/LocalArtin/Compatibility.lean:179`);
  - `globalAbelianExistence` (`GlobalExistence/Existence.lean:213`) and `globalClassFieldCorrespondence` (`GlobalExistence/Correspondence.lean:118`);
  - `kroneckerWeber` (`ClassFields/KroneckerWeber.lean:178`).
- No file under `TauCeti/NumberTheory/ClassFieldTheory/` contains `sorry`.
- None of the five open targets is already at the pin:
  - In ClassFieldTheory, `IsPrincipal` occurs only in `ringClassArtinMap_eq_one_iff`.
  - `relDiscr` occurs only in `AdmissibleModulus/Ramification.lean`.
  - There is no absolute upper filtration.
  - Every Tau Ceti use of `ValuativeExtension ℚ_[p] F` assumes it, for example `LocalField/Cohomology.lean:73`, or bundles it in `FinitePadicExtension` (`AbsoluteRamificationIndex.lean:64`).

**Proof routes and their inputs at the pin**
- *Unit-filtration reciprocity.* I checked the three equivalences and both choices of `H`. The abelian hypothesis is used only for `M/K`, which is abelian. The inputs are:
  - `artinMap_restrict` (`Local/ArtinMap.lean:132`);
  - `localArtinMap_eq_zero_iff` (`Local/Reciprocity.lean:139`) and `normResidue_mk` (`:173`);
  - the conductor criterion (`Local/Conductor/UpperNumbering.lean:64`), with binders `[IsAbelianGalois K M]` only and no characteristic hypothesis;
  - `map_restrictNormalHom_upperRamificationGroup` (`LocalField/Herbrand/UpperQuotient.lean:98`);
  - Mathlib's `IntermediateField.restrictNormalHom_ker` (`FieldTheory/Galois/Basic.lean:437`) and `fixingSubgroup_fixedField` (`:283`);
  - the intermediate-field local structure (`LocalField/FiniteExtension/IntermediateField.lean:69, 75, 81, 97`).
- *Absolute form.* For both sides I checked closedness and their images in every finite abelian quotient. The right side is compact because `G_K^n` is closed in the compact `G_K`.
- *Finite projections.* I checked the finite-intersection argument. Its inputs are Mathlib's `AlgEquiv.restrictNormalHom_surjective` (`FieldTheory/Normal/Basic.lean:233`) and `InfiniteGalois.restrictNormalHom_continuous` (`FieldTheory/Galois/Profinite.lean:148`), and Tau Ceti's `AlgHom.valuativeExtension` (`LocalField/AlgebraicExtension/Basic.lean:314`). The real index is read through the ceiling (`lowerRamificationGroupReal_def`, `RamificationGroup.lean:282`), as the Check says.
- *Principal ideal theorem.*
  - `ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator` (`Formation/PrincipalIdeal.lean:67`);
  - `MonoidHom.transfer_commutator_eq_one` (`GroupTheory/Transfer/Commutator.lean:303`);
  - `hilbertClassArtinEquiv` (`ClassFields/RayClassField.lean:262`) and `fieldRange_le_hilbertClassField_iff` (`:362`).
- *Conductor–discriminant.*
  - `finsum_artinConductorExponent_eq_discriminantExponent` (`LocalField/Discriminant/Conductor.lean:58`, for abelian extensions);
  - `conductorExponent_fixedField_ker` (`UpperNumbering.lean:130`);
  - `IsAdmissibleModulus.conductorExponent_le_exponent` (`Global/AdmissibleModulus/Ramification.lean:116`) and `abelianConductor` (`Basic.lean:193`);
  - `relDiscr_def` (`RingTheory/DedekindDomain/Discriminant/Basic.lean:39`);
  - Mathlib's `MonoidHom.domRestrict_surjective` and `CommGroup.card_domRestrictHom_ker` (`GroupTheory/FiniteAbelian/Duality.lean:107, 133`).
  - The exponent count `Σ_χ f(χ|_D) = [G:D] · Σ_ψ f(ψ) = g · δ_𝔭` checks.
- *Valuation comparison.* I checked steps (i)–(iii):
  - Hensel needs `|1 − x| < 1 = |n|²`.
  - The minimal-polynomial argument leaves a strictly dominant term when `w(z) > 1` or `w(z) < 1`.
  - The statement holds whatever the residue characteristic of the valuation on `F`, since the argument never uses it.

**Ownership against open work** (the sibling checkouts and `roadmaps grep`)
- RamificationOfCompleteDiscretelyValuedFields (#1410, README:124–131, §4a.1 at :909) gives the local-field absolute filtration to this Layer 7. It owns the filtration over a general complete discretely valued field and proves the two agree. That matches README:137–144, so each object has one owner.
- PadicPeriodRings (#940, README:34, :120) and LocalAnabelianGeometry (#1811, README:145) cite `map_unitFiltration_normResidue`, which exists here.
- FunctionFieldArithmetic (#1474, README:1225–1240) re-derives the finite equality and states no target, as README:145–150 says.
- #617 and #1215 change this roadmap, and their heads conflict with this one. #1215's `Suggested.lean:96–133` carries the same Layer 7 objects under two other theorem names. The description states the rule: whichever merges first, the others rebase, keeping this head's three names. That is a stated order.
- The dropped §2.4–§2.6, cited by #999, #1692 and #1484, are mapped at README:195–197.

**Cross-roadmap citations resolved on main**
- ProfiniteCohomology:
  - Layer 5: `H1ConjInvariants`;
  - Layer 10: `longExact_exact`, `corestriction_comp_res`, `corestriction_mackey`, `shapiroIso`;
  - Layer 11: `cd_p_le_of_isClosed`, `cd_p_le_scd_p`, `strictCohomologicalDimensionAt_le_iff_forall_openSubgroup`;
  - Layer 12: `cup_coeffMap`, `cup_add_left`, `cup_gradedComm`, and `degreeCast`, which its README:1346 assigns to Layer 12.
- ProfiniteProPGroups: `cd_p_eq_of_isProPSylow` and `cd_p_le_iff_elementaryAbelian_of_isProP`.
- ModularInduction:
  - Layer 0: `modRepK0`, `lift`;
  - Layer 1: `ind` (`Suggested.lean:127`);
  - Layer 3: the three `latticeDefect_*` lemmas;
  - Layer 4: `modularArtin_exists_nsmul_mem_indCyclicCoprime` (`Suggested.lean:377`).
- The three leads in `citations.md` are these supplier names, so they are found, not missing.
- At the pin, my declaration index finds every backticked README name except English words, roadmap names, `GalRep` and `H` (declared here) and `muNRepCoeffDictionary` (R06). That includes all 68 names of Layers 1–4, each under `Formation/`.

**Sources sampled, read at their locators**
- "Exit criterion," (Layers 0, 1, 2) and "Implemented in Tau Ceti" (Layers 1, 2): every named declaration exists at the pin under `Formation/`, as listed above.
- "The coefficient objects": `muNRep` (`MuNRep.lean:137`), `isSmoothDiscrete_muNRep` (:176), `kummerCoeffEquivMuNRep` (:150) with `_smul` (:165), `unitsRep` (`Brauer/Basic.lean:111`) and `absoluteGaloisGroupRestrictEquiv` (`AbsoluteGaloisGroup/Basic.lean:340`) all exist. The exception is `muNRepCoeffDictionary` (R06).
- "Local units and the `H²` bound": Milne III, Lemmas 2.3–2.6, printed pp. 104–105 (milne-cft lines 4716–4758). They support everything except Lemma 2.4 outside characteristic 0 (R03).
- "The Hilbert symbol":
  - The pinned laws are `localSymbol_kummerClass_mul` (`Local/Symbol.lean:339`), `…_eq_zero_of_add_eq_one` (:355), `localSymbol_antisymm` (:364), `localSymbol_eq_zero_iff_mem_normGroup` (`CyclicClass.lean:293`) and `forall_localSymbol_kummerClass_eq_zero_iff` (`HilbertPairing.lean:61`).
  - So are `invMap_h2MuToBr_h2MuEquivZMod_symm` (`Brauer/RootsOfUnity.lean:129`) and `localArtinMap_quadratic_eq_hilbertSymbol` (`Local/Quadratic.lean:87`).
- "Smoothness": `finite_H` takes `hA : IsSmoothDiscrete` explicitly with `(n : F) ≠ 0` (`FiniteCohomology/DegreeTwo.lean:97–98`). `tateDualityPairing_perfect_mixed` takes `[CharZero F]`, `[DiscreteTopology A.V]` and the `Fact` (`Local/Duality/Perfect.lean:280–284`). The Euler characteristic takes the `Fact` without `DiscreteTopology` (`EulerCharacteristic/Theorem.lean:98, 110`). All three match the README.
- "The `p`-adic valuation": Jahnke–Koenigsmann, Theorem 2.1, p. 3 (jahnke-koenigsmann line 113) matches the README's statement of F. K. Schmidt's theorem. The deduction is also sound: the `p`-adic extension and `w` are both henselian, so they are equal.
- "The cyclotomic normalization":
  - Milne VII, Example 8.2, printed p. 221 (milne-cft line 10059), verifies the product formula over `ℚ(ζ_m)/ℚ`.
  - The three Tau Ceti theorems are at `Local/Cyclotomic.lean:364` and `Local/ExplicitCyclotomicSymbol/ArtinMap.lean:294, 311`, the files the README names.
- "Conductors": `conductorExponent`, `conductorIdeal` and `characterConductorExp` are at `Local/Conductor/Basic.lean:89, 94, 184`, and the criterion and its corollary at `UpperNumbering.lean:64, 121`.
- "Unit-filtration reciprocity":
  - Milne I, Proposition 4.4, printed p. 46 (milne-cft line 2410), is Herbrand's theorem for quotients.
  - The definition of the infinite filtration follows it (milne-cft lines 2415–2419).
  - Milne reads a real lower index through the ceiling (milne-cft line 2379).
  - The Serre locator is under *Not verifiable*.
- "Global Herbrand quotients and fixed points": Milne VII, pp. 206–211:
  - Proposition 2.7 gives `h(I_{L,T}) = ∏ n_v` (milne-cft line 9379);
  - Proposition 3.1 gives `n·h(U(T)) = ∏ n_v` (line 9470);
  - Lemma 4.1 gives `C_K ≅ C_L^G` (line 9574);
  - Lemma 4.2 gives `I_K = Kˣ I_S` (line 9583);
  - Theorem 4.3 gives `h(C_L) = [L:K]` (line 9603).
- "Exit criterion" of Layers 3–14: every named object exists at the pin, as checked above.
- Other locators checked:
  - Milne I 1.9, printed p. 23 (line 1321), the conductor;
  - V Example 3.11, p. 159 (line 7121);
  - V Theorem 3.17, p. 161 (line 7252), and Theorem 3.19, p. 163 (line 7323);
  - V Theorem 3.27 and Remark 3.28, p. 165 (lines 7423, 7436), with `f(χ) = f(L^H/K)`;
  - V Example 5.4, p. 179 (line 8142);
  - VII Corollary 4.4 (line 9619), Theorem 5.1 (line 9665), Proposition 7.2 and Lemma 7.3 (lines 9996, 10007), Theorem 8.1 and Lemmas 8.4–8.6 (lines 10042–10175), Lemmas 9.1, 9.3, 9.4 and Theorem 9.5 (lines 10189–10287, where Lemma 9.3 puts the infinite primes in `S`, as README:2093 notes), and Theorem A.3 (line 10318);
  - VIII, the lcm computation before Lemma 4.1 (lines 10901–10911), Theorems 4.2 and 4.7 (lines 10937, 11011);
  - II 3.11, Tate's theorem (line 3911);
  - Milne ADT I, Theorem 2.8 (milne-adt line 1227) and Lemmas 2.10 and 2.12 (lines 1266, 1350);
  - Kopp–Lagarias, Theorems 1.1–1.3 (kopp-lagarias lines 128, 160, 174), with the ring class field `H^O_{O,∅}` and its ramification only at primes containing `f(O)` (lines 162–165).

### Adversarial pass

One row per statement. The values were computed on each side.

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| `map_unitFiltration_normResidue` (finite unit-filtration reciprocity) | `L = K`; `ℚ_2(ζ_8)/ℚ_2` at `n = 0,1,2,3`; odd `p`, `ℚ_p(ζ_p)`; unramified `L`; `𝔽_p((t))`, `y^p − y = t⁻¹`; nonabelian `ℚ_2(∛2, ζ_3)` | `L = K`: `1 / 1`. `ℚ_2(ζ_8)`: `U^0 = U^1 = ℤ_2ˣ ↦ G / G^0 = G^1 = G`; `U^2 = 1+4ℤ_2 ↦ {1,5} / G^2 = {1,5}`; `U^3 = 1+8ℤ_2 ↦ 1 / G^3 = 1` (the `u ↦ σ_{u⁻¹ mod 8}` image of `1+4ℤ_2` is `{1,5}`). `ℚ_p(ζ_p)`: `n=0`: `G / G`; `n=1`: `1 / 1`. Unramified: `n=0`: `1 / G_0 = 1`. Artin–Schreier: `n=1`: `G / G`; `n=2`: `1 / 1`. Nonabelian: `U^0 ⊆ N` (norm limitation to the unramified `ℚ_2(ζ_3)`), but `G_0` has order 3 | true; the nonabelian case is excluded by `[IsAbelianGalois K L]` in the signature | none |
| Route step 2 (conductor criterion for `M/K`) | `H = ⟨σ_5⟩, ⟨σ_3⟩, ⟨σ_7⟩` in `(ℤ/8)ˣ`, `n = 2` | Fixed fields `ℚ_2(i)`, `ℚ_2(√−2)`, `ℚ_2(√2)` have conductor exponents `2, 3, 3`. `U^2 ⊆ N`: yes / no / no (`(5,−2)_2 = (5,2)_2 = −1`). `G^2 ⊆ H`: yes / no / no | agrees | none |
| `localAbsoluteUpperRamificationGroup` | `u = −1`; `u ∈ (−1, 0]` at the unramified level of degree `f`; level `ℚ_2(ζ_8)` and its subfield `ℚ_2(√2)`; lower-numbering model | `u = −1`: all of `G_K`. `u ∈ (−1,0]`: image `G_0 = 1` at the unramified level, against `Gal = ℤ/f` (the ceiling read, `RamificationGroup.lean:282`). `ℚ_2(ζ_8)`: `G` for `u ≤ 1`, `{1,5}` for `1 < u ≤ 2`, `1` for `u > 2`. `ℚ_2(√2)`: break 2, and the image of `{1,5}` is all of `Gal`, so the two levels agree. Lower model at depth 3: `G_3 = {1,5}`, but at the `ℚ_2(√2)` level `G_3 = 1` | definition determines the object; the lower model is excluded by the Check | none |
| `closure_map_artinMap_unitFiltration` | `n = 0`; wrong model `G_K^0 = G_K`; finite abelian quotients | `n = 0`: `artinMap(𝒪ˣ)` = image of `inertiaSubgroup K` (`Unramified.lean:475`), which is compact, so its closure equals itself = image of `G_K^0`. Wrong model gives image `G_K^ab`, but `unramifiedCoordinate(Art(u)) = 1 ≠ zHat.gen`. Each quotient `Gal(L/K)`: `Gal(L/K)^n / Gal(L/K)^n` | true, both sides closed | none |
| `conductorExponent_eq_sInf_upperRamificationGroup` | `ℚ_2(√2)`, unramified, `ℚ_p(ζ_p)`, `ℚ_2(ζ_8)` | `3 / 3`, `0 / 0`, `1 / 1`, `3 / 3` | true, closes in one term | R05 |
| `algebraMap_vle_algebraMap_iff_of_finite_padic` | `F = ℚ_2(i)`; trivial relation on `F`; a non-discrete `u` on `ℚ_5` extending the 3-adic valuation; `p = 2` | `ℚ_2(i)`: `v_F(2) = 2`, `v(2) = 1`, both `2 <ᵥ 1`. Trivial relation: `1 ≤ᵥ p` holds in `F` and fails in `ℚ_p`, excluded by `IsNonarchimedeanLocalField`. `ℚ_5`: `u(6) = u(3) < 1`, while `6 ∈ 1+5ℤ_5` is an `n`-th power for every `5 ∤ n`, so the value group is not discrete. `p = 2`: step (ii) needs no power and step (iii) reads `2 = 1 + 1` | true | none |
| `isPrincipal_map_hilbertClassField` | `K = ℚ`; `K = ℚ(√−5)`, `I = (2, 1+√−5)`; `I = 0`, `I = ⊤` | `ℚ`: `H = ℚ`, principal. `ℚ(√−5)`: `H = K(i)`, `I² = (2)`, `2 = −i(1+i)²`, so `I𝒪_H = (1+i)`. `I = 0` gives `0`, and `⊤` gives `(1)` | true | none |
| `relDiscr_eq_finprod_abelianConductor` | `L = K`; `ℚ(i)/ℚ`; `ℚ(ζ_5)/ℚ`; `ℚ(√2)/ℚ` | `(1) / (1)`; `(4) / 1·4`; `(125) / 1·5·5·5`; `(8) / 1·8` | true | none |
| Layer 5, unit Herbrand quotient and `H²` bound | `L = K`; cyclic of degree `m`; an infinite group | `#H² = 1`; `#H² = m`. An infinite group has natural cardinal `0`, which satisfies `≤ m` but does not divide `m` | true; locator only in characteristic 0 | R03 |
| Layer 5, Hilbert symbol | `ℚ_2`, `a = b = −1`; `ℚ_7`, `n = 3`, unramified cubic with parameter 7; `n = 2` | `1 ∈ ℤ/2`, since `x² + y² = −1` has no solution; the invariant is `1/3` and the coordinate `1` (negated: `2`); `−1 = 1` in `ℤ/2` | true | none |
| Layer 5, duality and Euler characteristic | `ℚ_2`, `M = μ_3`; `ℚ_p` (odd `p`), `A = ℤ/p`; `ℚ_2`, `A = ℤ/2` | `#H⁰ = 1`, `#H² = 3`, `#H¹ = 3 = #ℚ_2ˣ/(ℚ_2ˣ)³`; `#H¹ = p² = p·1·p`; `#H¹ = 8 = 2·2·2` | true | none |
| Layer 7, cyclotomic normalization | `ℚ_2`, `u = −1`; `u = −3` on `μ_16`; uniformizer `p` | `χ = −1`, so `i ↦ −i`; `(−3)⁻¹ ≡ 5 mod 16` (13 without the inverse); `p = N(1 − ζ_{p^n})`, so `χ(Art(p)) = 1` | true | none |
| Layer 7, continuity of `artinMap` | `𝔽_p((t))`, Artin–Schreier `L` of degree `p` | `(Kˣ)^p = 𝔽_p((t^p))ˣ` contains no `U^(n)`, so it is not open; `normGroup K L ⊇ U^(2)` is open | the README's reason fails; the pinned theorem holds in either characteristic | R02 |
| Layer 7, conductor criterion needs abelian | `ℚ_2(∛2, ζ_3)`, `S_3`, `e = 3`, `f = 2` | `U^0 ⊆ N(L) = N(ℚ_2(ζ_3))`, but `G^0` has order 3 | the Check is correct | none |
| Layer 2 Examples | unramified layer of degree 6 with `E` of degree 2; corestriction from the index-3 subgroup | restriction: `2 · 1/6 = 1/3`, of order `3 = [L:E]`; corestriction: `1/2 = 3 · 1/6`, while the reversed index `1/3` is not an integer | true | none |
| Layer 10, global Herbrand quotients | `L = K`; `ℚ(i)/ℚ`, `S = {∞, 2}`; added unramified nonsplit place | `1,1,1`; `∏ n_v = 4`, `h(U(T)) = 4/2 = 2`, `h(C_L) = 4/2 = 2 = [L:K]`; both `S`-quotients are multiplied by `n_v` and `h(C_L)` is unchanged | true (Milne VII 2.7, 3.1, 4.3) | none |
| Layer 10, lifting obstruction | `ℚ(√13, √17)`; `ℚ(√2, √3)`; cyclic | `(17/13) = (13/17) = 1`, 2 is inert/split, so every decomposition group has order ≤ 2: lcm `2 < 4`. At 2, none of `2, 3, 6` is a square in `ℚ_2`: local degree 4, so the lift is surjective. Cyclic: lcm = `[L:K]` | true (Milne VIII §4) | none |
| Layer 12, Kummer degree | `ℚ`, `p = 2`, `S = {(2)}`; `ℚ(ζ_3)`, `p = 3`, `S = {(1−ζ_3)}` | `[U(S):U(S)²] = 4 = 2^{1+1+0}`, field `ℚ(i,√2)` of degree 4; `[U(S):U(S)³] = 9 = 3^{1+0+1}` | true | none |
| Layer 12, ray-class admissibility | `ℚ(i)/ℚ`, modulus `1`, `(4)`, `(4)·∞` | ray class groups `1`, `1`, `(ℤ/4)ˣ`; the Artin symbol of 3 is nontrivial, so only `(4)·∞` is admissible | true | none |
| `card_ideleClassNormQuotient` | `L = K`; `ℚ(i)/ℚ` | `1 / 1`; `2 / 2` | true | none |
| `cyclicHasseNorm` | `ℚ(√13, √17)`, `x = 25` (Klein four) | a local norm everywhere but not a global norm, which `[IsCyclic (L ≃ₐ[K] L)]` excludes | true | none |
| `hilbertProductFormula` | `ℚ`, `(−1,−1)`; `(5,5)`; `(3,7)`; a complex place | `1 (∞) + 1 (2) = 0`; all `0` (`(5,5)_2 = 1`, `(5,5)_5 = (−1/5) = 1`); `1 (2) + 1 (7) = 0` (`(7/3) = 1`, `(3/7) = −1`, `(−1)^{3} = −1`); `0` | true | none |
| Layer 11 Frobenius tests | `ℚ(ζ_5)`, `ℓ = 2, 3, 11`; `ℚ(√5)`, `ℓ = 11, 7`; `ℚ_2(ζ_5)`, `Art(2)` | `ζ_5^2` (order 4), `ζ_5^3`, `ζ_5`; `1`, `τ`; `ζ_5^2`, against `ζ_5^3` for geometric Frobenius | true | none |
| Layer 13 ring class Checks | maximal order of `ℚ(√3)`; `ℚ(ζ_7 + ζ_7⁻¹)` | `h = 1` and `h⁺ = 2` (`N(2+√3) = 1`); Minkowski bound `(6/27)·7 = 14/9 < 2`, so `H_O = K` | true | none |

**Context and binders.** Each declaration's elaborated type carries the binders its statement needs (see the signature comparison above). There is no `def` or `instance` whose type loses a needed section binder.

## Not verifiable

- Serre, *Local Fields* (`serre-local-fields`, uncertified): XV §2, Theorem 2 and Corollary 3 to Theorem 1 (Layer 7); IV §4 (Layer 6 Example); VI §3; IX §§3–5. The source is paywalled, so these are cited by locator only.
- Neukirch, *Algebraic Number Theory* (`neukirch-ant`, uncertified): VII §11. NSW (`nsw`, uncertified): (3.3.4), (7.1.8), (7.2.5), (7.2.6), (7.3.1)–(7.3.4).
- Artin–Tate (`artin-tate`, waived): XIV §4, Theorem 1; Preliminaries §2, Theorem A; XIII §4; XIV §6, p. 163.
- Serre, *Local class field theory*, in Cassels–Fröhlich: the manifest does not record it, and I did not read it. Its p. 134 comes from Milne's footnote (milne-cft line 4743).
- These works are cited but not in the manifest, and I did not read them: Tate, Corvallis, Part 2, §1; Cox, §7, Proposition 7.22 and Theorem 9.18; Serre, *Galois Cohomology*, II §5.3; Serre, *A Course in Arithmetic*, III §§1–2; Lang, *Algebra*, III Theorem 7.1; Brown, VI §8; Rim 1959; Tate 1952; Nakayama 1957; Weil 1951.

## Source issues

- none

