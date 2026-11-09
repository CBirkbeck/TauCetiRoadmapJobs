# Review of LocalPurity (pull request #1854 at 63ceb10)

**Verdict:** needs changes

This is an incremental re-review. `TauCetiRoadmap/LocalPurity/` has not changed since `56715a5`, the head the previous review read. The one commit since then (`63ceb10`) changes only `TauCetiRoadmap/AlgebraicCurves/README.md`, which does not cite LocalPurity. The pins have not moved: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`.

None of the nine previous findings is repaired. Each is stated again below under its old number and re-checked this round at this head and at the pins. R01–R03 block, and the push gate still fails (R05, R06).

The previous review's two routes still apply:
- bring this folder to a version that answers R01–R09;
- drop LocalPurity from this pull request. Its change here is still byte-identical, in both files (diffed this round), to the copy at #1807's head `64a16e1`, and #1807 comes before this pull request in its stated merge order.

#1808 at `a96d197` carries a rewritten LocalPurity folder (441-line README, 77-line `Suggested.lean`) that has its own review.

## R01 (P2) — The headlines are stated through private stand-ins for pinned Tau Ceti definitions

- **Location.** `TauCetiRoadmap/LocalPurity/Suggested.lean` lines 63–96 define `finiteEtale`, `FEt`, `FEt.pullback`, `puncturedSpectrum` and `PurityHolds`, and the headlines at lines 104–137 are stated through them. README lines 209–210 read: "When replacing the prototype `FEt U` by Tau Ceti's newer `FiniteEtaleScheme U` (not at this roadmap's pin)".
- **Claim.**
  - The pinned Tau Ceti already has these objects, so 0BMA (1) and 0EY7 are stated through a second carrier. That contradicts Scope lines 58–59 ("builds no second carrier").
  - The sentence at lines 209–210 is false: `FiniteEtaleScheme` is at the pin.
  - README lines 42–44 name the end theorems `IsLocalRing.purityHolds_of_isRegularLocalRing` and `Algebra.etale_of_finiteNormal_of_isRegularLocalRing`, but the Lean file declares them without those namespaces. The citation resolver finds neither name anywhere.
- **Witness.** At the pin, `TauCeti/AlgebraicGeometry/FiniteEtale/PuncturedSpectrum.lean:63` defines `PurityHolds` as `(restrictPunctured R).EssSurj`, where `restrictPunctured R : FiniteEtaleScheme (Spec R) ⥤ FiniteEtaleScheme (puncturedSpectrum R)`. `puncturedSpectrum` is at `AlgebraicGeometry/PuncturedSpectrum.lean:52`. All three were `#check`ed this round.
- **Repair.**
  - Delete the five declarations and import `TauCeti.AlgebraicGeometry.FiniteEtale.PuncturedSpectrum`.
  - State the headlines on the Tau Ceti carriers, in the README's namespaces:

    ```lean
    theorem IsLocalRing.purityHolds_of_isRegularLocalRing (A : Type u) [CommRing A]
        [IsRegularLocalRing A] (hd : 2 ≤ ringKrullDim A) : TauCeti.IsLocalRing.PurityHolds A := by
      sorry

    theorem AlgebraicGeometry.finiteEtale_extend_of_purity {X : Scheme.{u}} [IsNoetherian X]
        (U : X.Opens) (h : ∀ x : X, x ∉ U → TauCeti.IsLocalRing.PurityHolds (X.presheaf.stalk x)) :
        (TauCeti.FiniteEtaleScheme.pullback U.ι).EssSurj := by
      sorry
    ```

  - State `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` with its current binders.
  - Delete README lines 209–212.

  Both statements above elaborate at the pins in this round's scratch probe, exactly as written, with `sorry` as the only warning.

## R02 (P2) — The README says Tau Ceti lacks this material, and plans targets that are already proved at the pin

- **Location.**
  - README lines 16–18: "None of them has finite étale covers of punctured spectra or local purity."
  - "This roadmap owns" (lines 48–56).
  - The "Prove …" sentences of §0.1 (135–143), §0.2 (154–165), §1.1 (182–189) and §1.2 (196–209), the `d = 2` step of §2.1, and `restrictOpen_fullyFaithful_of_depth` in §2.2.
- **Claim.** The sentence at lines 16–18 is false, and these targets duplicate pinned declarations. §0.2 also narrows 0BJF to a local base. Stacks 49.3.1 (0BJF) is stated for any finite locally free morphism, and the pinned theorem holds over any commutative ring.
- **Witness.**
  - `TauCeti/AlgebraicGeometry/FiniteEtale/Extension.lean:110–111` has `@[stacks 0BLK] theorem extends_iff_sections_finiteEtale`, which is the README's §1.2 name.
  - `TauCeti/RingTheory/Etale/Discriminant.lean:121` has `Algebra.etale_iff_isUnit_discr (A B : Type*) [CommRing A] …`, with no `IsLocalRing` binder.
- **Repair.**
  - Add "From Tau Ceti" supplier entries by exact name and module, and replace each matching "Prove `X`" by a one-line citation.
  - Keep the section numbers: PurityOfBranchLocus and AbhyankarLemma cite §§2.1–2.2.
  - Rewrite lines 12–18 to say what Tau Ceti has.

  Every name in the table below was `#check`ed this round:

  | README target | Pinned Tau Ceti declaration (module, line) |
  | --- | --- |
  | §0.1 `flat_of_isCohenMacaulay` (00R4) | `TauCeti.Algebra.flat_of_isCohenMacaulay` (`RingTheory.RegularLocalRing.MiracleFlatness`, 72) |
  | §0.1 `flat_of_normal_dim_two` | `TauCeti.Algebra.flat_of_normal_dim_two` (same module, 90) |
  | §0.2 trace-form criterion | `TauCeti.Algebra.etale_iff_traceForm_nondegenerate` (`RingTheory.Etale.Discriminant`, 66) |
  | §0.2 `etale_iff_isUnit_discr` | `TauCeti.Algebra.etale_iff_isUnit_discr`, any commutative base (121) |
  | §0.2 localization form | `TauCeti.Algebra.isUnit_discr_localization_iff` (144) |
  | §1.1 punctured spectrum, restriction, purity | `TauCeti.IsLocalRing.puncturedSpectrum`, `restrictPunctured`, `PurityHolds` |
  | §1.1 API | `TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen` (81), `isCompact_puncturedSpectrum` (99), `restrictPunctured_faithful_of_one_le_depth` (`FiniteEtale.PuncturedSpectrum`, 119) |
  | §1.2 0BM8, affine form | `TauCeti.AlgebraicGeometry.Spec.presheaf_map_leTop_bijective_of_isIntegral` (`AlgebraicGeometry.PuncturedSpectrum.Sections`, 110) |
  | §1.2 0BLK | `TauCeti.IsLocalRing.extends_iff_sections_finiteEtale` |
  | §1.2 0BM9, full faithfulness | `TauCeti.IsLocalRing.FiniteNormalPuncturedEtaleAlg` (88), `TauCeti.IsLocalRing.restrictPuncturedSpec.fullyFaithful` (`AlgebraicGeometry.FiniteEtale.FiniteNormal`, 204) |
  | §2.1 (2) for `d = 2` | `TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two` (`RingTheory.RegularLocalRing.Purity`, 75) |
  | §2.1 Check `A × A/𝔪` | `TauCeti.IsLocalRing.not_flat_prod_residueField` (`RingTheory.Etale.ProdResidueField`, 147) |
  | §2.2 affine full faithfulness | `TauCeti.FiniteEtaleScheme.fullyFaithfulPullbackιOfTwoLeDepth` (`AlgebraicGeometry.FiniteEtale.FullyFaithful`, 105) |

  Keep as targets only what the pins lack:
  - 0BM8 in its scheme form;
  - the essential-surjectivity half of the corrected 0BM9;
  - §§1.3–1.4;
  - 0BMA (1) in every dimension, and 0BMA (2) for `d ≥ 3`;
  - §2.2 apart from the affine full faithfulness.

## R03 (P2) — The supplier for 0AFS, depth `d` and normality restates pinned Tau Ceti results

- **Location.**
  - README lines 34–40, 70–76, 144–146, 213, 269–271, 286–290 and 326–328, which cite SchemeAndStackFoundations §4.13.
  - Convention 4 (lines 116–117): "depth is SchemeAndStackFoundations' `IsLocalRing.depth`".
  - `Suggested.lean` lines 17–19: "Conditions whose Mathlib API does not exist at the pinned version (depth, Cohen–Macaulay) are not stated here".
- **Claim.** §§0.1 and 2.1–2.2 wait on a SchemeAndStackFoundations §4.13 target for three facts that the pins already prove:
  - a regular local ring is a regular ring (0AFS);
  - a regular local ring of dimension `d` has depth `d`;
  - the localizations of a regular local ring are normal domains.

  Depth and Cohen–Macaulayness also exist at the pins, so the `Suggested.lean` docstring is false.
- **Witness.**
  - `TauCeti/RingTheory/RegularLocalRing/ProjectiveDimension.lean:441` has `instance isRegularRing_of_isRegularLocalRing`.
  - `…/RegularLocalRing/CohenMacaulay.lean:110` has `depth_eq_ringKrullDim`, and line 125 has `isCohenMacaulay`.
  - Mathlib's `IsLocalRing.depth` elaborates at the pin.
- **Repair.**
  - Cite from Tau Ceti:
    - `TauCeti.isRegularRing_of_isRegularLocalRing`;
    - `TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim` and `TauCeti.IsRegularLocalRing.isCohenMacaulay`;
    - `TauCeti.IsRegularRing.isIntegrallyClosed` (module `TauCeti.RingTheory.RegularLocalRing.Normal`, line 55, a low-priority instance) with `TauCeti.IsRegularLocalRing.isDomain`.
  - In Convention 4, take depth to be Mathlib's `IsLocalRing.depth (ModuleCat.of A A)`.
  - Cite SchemeAndStackFoundations §§0.17 and 4.13 only for what the pins lack.
  - Update the diagram (line 34), the paragraph at lines 37–40, and the *Needs:* lines of §§0.1 and 2.1–2.2.
  - Rewrite `Suggested.lean` lines 16–19.

  The supplier entry has to name the `Normal` module. In this round's probe, the goal for a prime `p` of a regular local ring `A`, `IsDomain (Localization.AtPrime p) ∧ IsIntegrallyClosed (Localization.AtPrime p)`:
  - closes by `⟨inferInstance, inferInstance⟩` once `TauCeti.RingTheory.RegularLocalRing.Normal` is imported;
  - fails to synthesize `IsIntegrallyClosed` without that import.

## R04 (P3) — Padding in `Suggested.lean`

- **Location.** `Suggested.lean`:
  - lines 37–41, `flat_of_normal_dim_two`;
  - lines 46–49, `etale_iff_traceForm_nondegenerate`;
  - lines 54–57, `etale_iff_isUnit_discr`;
  - lines 126–128, `not_flat_prod_residueField`, which also mirrors the README Checks at lines 217–219 and 295–297.
- **Claim.** Each one closes with a single pinned lemma.
- **Witness.** This round, on a scratch copy, these closes gave no error and no `sorry` warning:
  - `exact TauCeti.Algebra.flat_of_normal_dim_two hinj hdim`;
  - `exact TauCeti.Algebra.etale_iff_traceForm_nondegenerate K B`;
  - `exact TauCeti.Algebra.etale_iff_isUnit_discr A B b`;
  - `exact TauCeti.IsLocalRing.not_flat_prod_residueField A (…)`, where `¬ IsField A` is read off `hd` through `ringKrullDim_eq_zero_of_isField`.
- **Repair.** Delete the four theorems from `Suggested.lean`, together with `section Layer0`. The README keeps them as citations (R02).

## R05 (P3) — Gate `readme-ids-missing` (4)

- **Location.** README line 187, `puncturedSpectrum_eq_iSup_basicOpen`; lines 251–252, `finiteEtale_extend_of_hypersurface` and `finiteEtale_extend_of_localCohomology`; line 322, `finiteEtale_extend_of_regular_codimTwo`.
- **Claim.** The README presents these four names as this roadmap's declarations, and `Suggested.lean` declares none of them.
- **Witness.** The gate rerun at `63ceb10` reports `readme-ids-missing=4`, with exactly these names.
- **Repair.**
  - Cite the first by its pinned name, `TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen`.
  - State the 0BLM and 0BLS targets in prose without a backticked name, for example "the local Lefschetz extension theorem of §1.4".
  - For `finiteEtale_extend_of_regular_codimTwo`, either state it in `Suggested.lean` as a headline or describe it in prose. It is statable at the pins; its source is SGA 1 X Corollaire 3.3 (see R09).
  - Rerun the gate.

## R06 (P3) — Gate `outside-folder`: two files outside the declared folders

- **Location.** `Completed/ArithmeticDirichletSeries/README.md` (1 line) and `TauCetiRoadmap/SymplecticGeometry/README.md` (3 lines).
- **Claim.** The pull request edits two roadmap folders that are not among the folders this review's brief declares as its own, so neither gets a review of its own.
- **Witness.** `git diff --stat origin/main...HEAD`, with the 17 declared folders excluded, lists exactly these two files (4 insertions, 4 deletions). The gate rerun reports them among `outside-folder=34`; the other 32 paths are in declared folders.
- **Repair.** Move the two edits to a pull request of their own, or declare both folders as this pull request's own.

## R07 (P3) — The §1.1 and §1.2 definitions lack discriminating Checks

- **Location.** §1.1 (lines 180–192) defines the punctured spectrum and `PurityHolds` and has no `**Checks.**` block. §1.2 defines `FiniteNormalPuncturedEtaleAlg` and has a single Check (lines 216–219).
- **Claim.** Each definition needs at least three Checks.
- **Witness.** `grep -n '^\*\*Checks'` gives lines 148, 169, 216 and 294, so §1.1 has no block. The block at line 216 has one bullet.
- **Repair.** Add the following Checks, computed in earlier rounds and unchanged since.
  - For §1.1:
    - **`A` a field.** `U = ∅`, so purity holds. Restriction is not faithful: the two projections `A × A → A` agree over `∅`.
    - **`A = ℤ_(p)`, `p` odd.** `ℚ(√p)` over `U = Spec ℚ` does not extend, because the discriminant of `ℤ_(p)[√p]` is `4p`, which is not a unit.
    - **`A = k⟦x, y⟧`.** `U` is quasi-compact but not affine, since `Γ(U, 𝒪) = A`.
  - For §1.2, with `char k ≠ 2`:
    - `A × A` is in the category.
    - `A[z]/(z² − x)` is excluded: it is ramified at `(z)`, which lies over `(x) ≠ 𝔪`.
    - `A × A/𝔪` is excluded by torsion-freeness (the existing Check).

## R08 (P3) — README shape and timeless wording

- **Location.** The README lacks four parts of the house shape:
  - `## Exact supplier contracts`: the contracts are Scope bullets at lines 58–96;
  - `## How to read the build`;
  - `### Examples` and `### Dependencies` at the end of each layer;
  - `## Downstream consumers`.

  Process wording appears at lines 209–210 ("prototype", "newer", "not at this roadmap's pin"), 276–277 ("remains a separate corollary") and 277 ("now gives").
- **Claim.** These depart from the house shape and from the timeless rule.
- **Witness.** `grep -n '^## \|^### '` lists Scope and ownership, Conventions, Layers 0–2 with §§0.1–2.2, Stacks alignment, Provenance and References, and none of the missing headings.
- **Repair.**
  - Move the supplier bullets into `## Exact supplier contracts`, with subsections `From Mathlib`, `From Tau Ceti` and `From TauCetiRoadmap.SchemeAndStackFoundations`.
  - Add a one-paragraph `## How to read the build`.
  - End each layer with `### Examples` and `### Dependencies`.
  - Move PurityOfBranchLocus §2.1 and AbhyankarLemma §§2.1–2.2 (lines 20–23, 98–100) under `## Downstream consumers`.
  - Reword the three phrases.

## R09 (P3) — Locators: an unused SGA 1 reference, the SGA 1 result actually proved, and a missing tag

- **Location.**
  - README line 388 cites SGA 1, Exposé X, Théorème 3.1, and no target uses it.
  - Line 322 marks `finiteEtale_extend_of_regular_codimTwo` as *API*, and its alignment row (line 362) has "—".
  - Line 252 cites "Lemma 58.20.6" without its tag.
- **Claim.** SGA 1 X 3.1 is Zariski–Nagata purity of the branch locus, which belongs to PurityOfBranchLocus. The SGA 1 result proved here is Corollaire 3.3: for a regular locally Noetherian `X` and a closed subset of codimension `≥ 2`, restriction of étale covers to the complement is an equivalence.
- **Witness.**
  - `sga1` line 8394: Corollaire 3.3.
  - `sga1` line 8359: Théorème 3.1 concerns a quasi-finite morphism.
  - `stacks-0BMA` line 2449: Lemma 20.6 is tag 0BLS.
- **Repair.**
  - At `finiteEtale_extend_of_regular_codimTwo` and in its alignment row, cite "SGA 1, Exposé X, Corollaire 3.3 (essential surjectivity; regularity required only along `X ∖ U`)".
  - In the References, replace Théorème 3.1 by Corollaire 3.3.
  - Write "Lemma 58.20.6 (0BLS)".

## Previous findings

- R01 — not repaired: `Suggested.lean` lines 63–96 still define `finiteEtale`, `FEt`, `FEt.pullback`, `puncturedSpectrum` and `PurityHolds`. README 209–210 still reads "When replacing the prototype `FEt U` by Tau Ceti's newer `FiniteEtaleScheme U` (not at this roadmap's pin)".
- R02 — not repaired: README 17–18 still reads "None of them has finite étale covers of punctured spectra or local purity", and §§0.1–1.2 still say "Prove" for pinned declarations.
- R03 — not repaired: README line 34 still reads "SchemeAndStackFoundations §4.13 (Serre's theorem, 0AFS) ──→ Layer 2 §2.1". Convention 4 still says "depth is SchemeAndStackFoundations' `IsLocalRing.depth`".
- R04 — not repaired: `flat_of_normal_dim_two`, `etale_iff_traceForm_nondegenerate`, `etale_iff_isUnit_discr` and `not_flat_prod_residueField` remain at lines 37, 46, 54 and 126. Each closes by one `exact` in this round's probe.
- R05 — not repaired: the gate at `63ceb10` reports `readme-ids-missing=4`, with the same four names.
- R06 — not repaired: `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` are still changed outside the declared folders.
- R07 — not repaired: §1.1 still has no `**Checks.**` block, and §1.2 still has the single Check `test_closed_point_factor` at lines 216–219.
- R08 — not repaired: the README still has no `## Exact supplier contracts`, `## How to read the build` or `## Downstream consumers`. "prototype" (line 209), "remains a separate corollary" (276–277) and "now gives" (277) remain.
- R09 — not repaired: line 388 still cites "SGA 1, Exposé X, Théorème 3.1"; line 252 still reads "Lemma 58.20.6" without 0BLS.

## Verified sound

**Change set.**
- `git diff --stat 56715a57 63ceb102` touches only `TauCetiRoadmap/AlgebraicCurves/README.md` (22 insertions, 7 deletions).
- `grep LocalPurity` finds nothing in that file.
- SchemeAndStackFoundations and PurityOfBranchLocus did not change between these two heads.
- `lake-manifest.json` is unchanged; the checked-out packages are Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`.

**Gate and build.**
- I reran the gate at `63ceb10`. It fails on `readme-ids-missing=4` (R05) and `outside-folder=34`. Of those 34 paths, 32 are in the 17 declared folders and 2 are real (R06).
- Every other check is 0, including `set_option`, sorry-data, imports, statement-hygiene, stray-files and depcheck.
- `lake env lean TauCetiRoadmap/LocalPurity/Suggested.lean` gives exactly 7 warnings, all `declaration uses 'sorry'`, at lines 37, 46, 54, 106, 115, 126 and 134.
- The dependency check prints `depcheck: 239 roadmaps, 2355 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The suppliers (Mathlib, Tau Ceti, SchemeAndStackFoundations) are on main.

**Signature check.** One scratch file (a copy of `Suggested.lean` with `#check @name` appended for all 12 declarations) was elaborated once.
- Each elaborated type equals the corresponding type in the worker's signature list.
- No section binder is lost: `etale_of_finiteNormal_of_isRegularLocalRing` keeps `[Module.Finite A B] [Module.IsTorsionFree A B]`, `hnormal` and `hpunct`; `finiteEtale_extend_of_purity` keeps `[AlgebraicGeometry.IsNoetherian X]`.
- Nothing in the file changed.

**Pinned declarations re-opened this round (26, by `#check`, with source lines for those listed).**
- From `FiniteEtale/PuncturedSpectrum`, `PuncturedSpectrum` and `FiniteEtale/Extension`:
  - `TauCeti.IsLocalRing.PurityHolds` (`FiniteEtale/PuncturedSpectrum.lean:63`), `restrictPunctured`, `restrictPunctured_faithful_of_one_le_depth` (:119), with `restrictPunctured_faithful` (:84) and `restrictPunctured_faithful_iff` (:92) opened in the source;
  - `puncturedSpectrum` (`PuncturedSpectrum.lean:52`), `puncturedSpectrum_eq_iSup_basicOpen` (:81, hypothesis `(span s).radical = 𝔪`), `isCompact_puncturedSpectrum` (:99);
  - `extends_iff_sections_finiteEtale` (`Extension.lean:111`, hypothesis `2 ≤ depth (ModuleCat.of A A)`).
- Algebra:
  - `TauCeti.Algebra.flat_of_isCohenMacaulay` (`MiracleFlatness.lean:72`, `S` local Noetherian, not necessarily finite) and `flat_of_normal_dim_two` (:90);
  - `etale_iff_traceForm_nondegenerate` (`Discriminant.lean:66`), `etale_iff_isUnit_discr` (:121, any commutative `A`) and `isUnit_discr_localization_iff` (:144);
  - `etale_of_finiteNormal_of_ringKrullDim_eq_two` (`Purity.lean:75`, only for `ringKrullDim A = 2`, with normality at maximal ideals and unramifiedness off the closed point);
  - `not_flat_prod_residueField` (`ProdResidueField.lean:147`, hypothesis `¬ IsField A`).
- Regular local rings: `isRegularRing_of_isRegularLocalRing` (`ProjectiveDimension.lean:441`), `IsRegularLocalRing.depth_eq_ringKrullDim` (`CohenMacaulay.lean:110`), `isCohenMacaulay` (:125), `isDomain`, and `IsRegularRing.isIntegrallyClosed` (`Normal.lean:55`).
- Finite étale schemes and sections: `FiniteEtaleScheme`, `FiniteEtaleScheme.pullback`, `fullyFaithfulPullbackιOfTwoLeDepth` (`FullyFaithful.lean:105`), `FiniteNormalPuncturedEtaleAlg`, `restrictPuncturedSpec.fullyFaithful` (`FiniteNormal.lean:204`, normal Noetherian domain of dimension `≥ 2`), and `Spec.presheaf_map_leTop_bijective_of_isIntegral` (`Sections.lean:110`).
- Mathlib's `IsLocalRing.depth` (valued in `ℕ∞`, needs `Small`).

**Cross-roadmap citations re-resolved at this head.** All 16 SchemeAndStackFoundations names the README cites are at the same lines as last round. Each is in its section of SchemeAndStackFoundations' README:
- §0.6 `coherent_hartogs` (707);
- §0.9 `finite_presentation_limits` (859);
- §0.14 `henselian_finiteEtale_equivalence` (1080);
- §0.17:
  - `Module.depth` (1140) and `IsLocalRing.depth` (1142);
  - `Ring.IsCohenMacaulay.of_isRegularRing` (1158);
  - `Module.SatisfiesSerreS` (1169) and `isCohenMacaulay_iff_forall_satisfiesSerreS` (1173);
- §2.7 `localCohomology_module_comparison` (3499) and `depth_localCohomology_vanishing` (3512);
- §4.8 `CoherentFormalModule` (5393);
- §4.13 (heading at 5643):
  - `IsRegular.isNormal` (5648);
  - `IsRegularLocalRing.isCohenMacaulay` (5658);
  - `isRegularRing_of_isRegularLocalRing` (5691);
  - `serre_normality_criterion` (5735).

The headings §§0.6, 0.9, 0.14, 0.17, 2.7, 4.7 and 4.8 are at lines 678, 848, 1068, 1138, 3482, 5339 and 5383.

Downstream citations still resolve:
- PurityOfBranchLocus at this head cites LocalPurity §2.1 (lines 12, 32, 55, 253).
- AbhyankarLemma on main cites §§2.1–2.2 (lines 28, 55, 265–268).

**Overlaps.**
- No id this README cites is dropped by an open pull request, and no cited id is defined only by an open revision. This pull request drops no LocalPurity id.
- #1807 at `64a16e1` carries this folder byte-identical to this head (README and `Suggested.lean`, diffed this round).
- #1808 at `a96d197` carries a rewritten folder, and the overlap tool reports no conflict in this folder. Either merge order leaves #1808's text, so no order needs to be stated for this folder.
- Ownership of 0BMA, 0EY7, 0BM9 and 0BLM: there is no second owner. PurityForFlatCohomology (#1840) consumes LocalPurity; it does not restate it.

**Seeded sample (8 targets; 29 locators re-located this round at the cached-text lines).**
- 0.1: 00R4 (`stacks-00R4` line 14937).
- 0.2: 0BJF (`stacks-0BJF` line 269).
- 1.1: 0BM7 (`stacks-0BMA` line 2357).
- 1.2: 0BM8, 0BLK and 0BM9 (lines 2366, 2380, 2391).
- 1.3:
  - 0BLF, 0BLH, 0BLI, 0BM6, 0BLJ, 0BLL and 0EL8 (lines 2245, 2266, 2283, 2342, 2351, 2421, 2028);
  - 0EII, 0EKP and 0EKS (`stacks-0EKS` lines 1923, 2094, 2193);
  - 05ER and 05EU (`stacks-09ZL` lines 11528, 11624).
- 1.4: 0BLM and 0BLS (`stacks-0BMA` lines 2459, 2449); 09ZL (`stacks-09ZL` line 1758).
- 2.1:
  - 0BMA (`stacks-0BMA` line 2503);
  - SGA 2 X Théorème 3.4 (i) (`sga2` line 3390);
  - 0AFS, 00NP, 00H8 and 00ON (`stacks-00R4` lines 12566, 11920, 4098, 12677).
- 2.2: 0EY7 (`stacks-0BMA` line 2604); 0BQ5 and 0EY3 (`stacks-0BQ5` lines 2571, 2627); SGA 1 X 3.1 and 3.3 (`sga1` lines 8359, 8394).

Theorem numbers, hypotheses and conclusions agree with the README, except as R09 says. The README flags no locator as unverified.

**Adversarial pass.** No statement changed, so no new row is needed.
- These rows are carried from the previous review (r40, itself carried from r35), with the values computed there.
- The rows marked "Lean this round" were re-run in this round's scratch probe at the same pins.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 0BMA (1) `purityHolds_of_isRegularLocalRing` (r35) | `d = 0` (field); `ℤ_(p)`; `k⟦x,y⟧`; `k[x²,xy,y²]_(0)` | field: `U = ∅`, `hd` false; `ℤ_(p)`: `ℚ(√p)` needs `ℤ_(p)[√p]`, `disc = 4p ∉ A^×`, `hd` false; `k⟦x,y⟧`: `U ⊔ U` extends to `X ⊔ X`; `edim = 3 ≠ 2` for the cone, so it is excluded | sound, `hd` needed |
| 0BMA (2) `etale_of_finiteNormal_…` (r35) | `B = 0`; `A × κ`; `A[z]/(z²−x)`; `A[z]/(z²−u)`, `u ∈ A^×` | `0`: hypotheses vacuous, `0` étale; `A × κ`: `x·(0,1) = 0`, not torsion free, excluded; `z²−x`: `disc = 4x ∉ A^×`, `hpunct` fails at `(z)`; `z²−u`: `disc = 4u` a unit, étale | sound |
| Convention 5, `A × A/𝔪` (r35) | `A = k⟦x,y⟧` | `(A×κ)_{𝔭×κ} = A_𝔭`, `(A×κ)_{A×0} = κ`; `Spec(A×κ) ×_X U = U ⊔ ∅`; `Γ = A ≠ A×κ` | the correction is needed and correct |
| 0EY7 `finiteEtale_extend_of_purity` (r35) | `U = ⊤`; `X = Spec ℤ_(p)` with `U = {η}`; `U = ∅` | `⊤`: pullback is an equivalence; `{η}`: purity fails at the closed point and `ℚ(√p)` does not extend; `∅`: `FÉt(∅) = {∅}` | sound |
| `flat_of_normal_dim_two` (r35; Lean this round) | `B = k⟦y⟧ = A/(x)`; `B = A[z]/(z²−x)` | first: not injective, excluded by `hinj`; second: free on `1, z`; closes by `exact TauCeti.Algebra.flat_of_normal_dim_two hinj hdim` | sound; padding (R04) |
| `etale_iff_traceForm_nondegenerate` (r35; Lean this round) | `K[x]/(x²)`; `𝔽_p(t^{1/p})/𝔽_p(t)`; `B = 0` | Gram `[[2,0],[0,0]]`, det 0, not étale; trace form ≡ 0, inseparable; `0`: both sides true; closes by one `exact` | sound; padding |
| `etale_iff_isUnit_discr` (r35; Lean this round) | `ℤ_(p)[x]/(x²−d)`; empty basis | `det [[2,0],[0,2d]] = 4d`, a unit iff `d ∈ A^×`; empty basis: `det = 1`; the pinned version has no `IsLocalRing` binder | sound; narrower than 0BJF (R02) |
| `not_flat_prod_residueField` (r35; Lean this round) | `A = k⟦x,y⟧` | `x·(0,1) = 0`, `x ≠ 0`, so not flat; closes by the pinned lemma with `¬ IsField A` from `hd` | true; padding |
| `puncturedSpectrum`, `PurityHolds` stand-ins (r35; `#check` this round) | compared with the Tau Ceti definitions | same carrier `{closedPoint}ᶜ`; same `EssSurj` of restriction; a different over-category type (`(@IsFinite ⊓ @Etale).Over ⊤` against `FiniteEtaleScheme`) | duplicate (R01) |
| `restrictPunctured_faithful`, depth `≥ 1` (r35) | `A` a field | `U = ∅`: the projections `A×A → A` agree after restriction | the hypothesis is needed |
| 0BLK `extends_iff_sections_finiteEtale` (r35) | `A = ℤ_(p)` (depth 1) | `V = U` extends, but `Γ(V) = ℚ` is not finite over `A` | the hypothesis is needed and present |
| corrected 0BM9 (r35) | `A × κ`; `A[z]/(z²−x)`; `A × A` | the first two are outside the category; `Γ(U ⊔ U) = A × A` | sound with the correction |
| 0BLM, `d ≥ 3` step (r35) | `d = 3`, `f ∈ 𝔪∖𝔪²` | `A/f` regular of dimension 2; `depth A = 3 ≥ 3` | sound |
| `test_flat_needs_cohenMacaulay` (r35) | `k⟦x,y⟧[z]/(z²,xz,yz)` | `dim S = 2 = 2 + 0`; `z ∈ soc`, depth 0; not flat | the Check is correct |
| `test_discr_dual_numbers` (r35) | `k[x]/(x²)` | `Tr(1)=2`, `Tr(x)=Tr(x²)=0`, `disc = 0` | correct; `char ≠ 2` is unused |
| `test_purity_needs_regular` (r35) | `k[x²,xy,y²]_(0)`, `B = k[x,y]_(0)` | `±1` acts freely off 0, so étale over `U`; an extension would force regularity, but `edim A = 3 > 2` | the Check is correct |
| 0AFS via Tau Ceti (r35; Lean this round) | `k⟦x,y⟧`, `𝔭 = (x)` | `A_𝔭` is a DVR; `IsRegularRing A` by `inferInstance`; normal localizations by `inferInstance` only with `TauCeti.RingTheory.RegularLocalRing.Normal` imported | pinned (R03) |

**Remark on untouched text, no change requested.** A `## Provenance` section (lines 364–379) describes an external formalization. The previous reviews passed it.

## Not verifiable

- Nothing in the seeded sample was unreadable. Every text is a cached open copy: the Stacks Project chapter PDFs, SGA 1 (arXiv math/0206203) and SGA 2 (arXiv math/0511279).
- #1808's rewritten LocalPurity folder is not reviewed here: it has its own review.
- EtaleHomotopyTypes (open, README lines 155–161) addresses two contracts to LocalPurity (`gap:relative-etale-depth`, `gap:relative-homotopical-purity`). This roadmap does not declare them, they are not this folder's change, and they are not reviewed here.

## Source issues

- **Error** in stacks-0BMA at Lemma 58.20.3 (0BM9), p. 51: the source says global sections give an equivalence onto all finite normal A-algebras étale over U; it should restrict to A-torsion-free algebras, since A × A/𝔪 lies in that category and is no Γ(V, 𝒪_V); affects a stated result.
- **Error** in stacks-0BMA at Lemma 58.21.3 (0BMA), part (2), p. 53: the source says every finite normal B with finite étale restriction to the punctured spectrum is étale; it should assume B torsion free over A, as A × A/𝔪 is such a B and not flat; affects a stated result.
- **Misprint** in stacks-0BQ5 at Lemma 32.20.4 (0EY3), p. 54: the source takes the open U′ inside X; it should be inside the base scheme S of Lemma 32.20.3; affects nothing.
