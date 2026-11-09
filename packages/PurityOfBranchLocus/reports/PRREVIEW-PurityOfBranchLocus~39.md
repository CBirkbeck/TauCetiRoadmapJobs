# Review of PurityOfBranchLocus (pull request #1854 at 1ccc517)

**Verdict:** needs changes

This is a full review of the folder at 1ccc517. Against main, the folder's only change is commit cbd8b936, which rewrites README §0.3 into a pointer to SchemeAndStackFoundations §4.13. Its `Suggested.lean` and `metadata.toml` are byte-identical to main and to the head of #1807. The previous report read #1808 at c9403e2, whose copy of this folder is different (README md5 `b15ec1a8…` there, `6df3ffd8…` here), so only that report's gate finding carries over.

## R01 (P2) — The §2.2 end theorem is statable but absent from `Suggested.lean`

- **Location.** README lines 37–38: "The end theorems are `Scheme.Hom.exists_etale_of_formallyUnramified_stalk_codimOne` (0BMB, §2.1), `Scheme.Hom.etale_of_etaleAt_codimOne` (§2.2) and …". §2.2 is at README lines 271–280. `TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean` declares no `etale_of_etaleAt_codimOne`, and its module docstring (lines 4–22) does not call it unstatable.
- **Claim.** A headline theorem that is statable at the pins is missing from the acceptance test.
- **Witness.** Every carrier is pinned (`IsFinite`, `IsDominant`, `IsIntegral`, `genericPoint`, `Etale`, `IsRegularLocalRing`). I appended the signature below to a scratch copy of the file, and it elaborates with only the `sorry` warning.
- **Repair.** Add the following to `section Layer2` after `isEtaleAt_of_purity`, with a docstring stating §2.2 (this is the form #1808's head states):

  ```lean
  theorem etale_of_etaleAt_codimOne [IsLocallyNoetherian X] [IsLocallyNoetherian Y]
      [IsIntegral X] [IsIntegral Y] (f : X ⟶ Y) [IsFinite f] [IsDominant f]
      [∀ x : X, IsIntegrallyClosed (X.presheaf.stalk x)]
      [∀ y : Y, IsRegularLocalRing (Y.presheaf.stalk y)]
      (hgen : ∃ U : X.Opens, genericPoint X ∈ U ∧ Etale (U.ι ≫ f)) :
      Etale f ↔ ∀ x : X, ringKrullDim (X.presheaf.stalk x) = 1 →
        (f.stalkMap x).hom.FormallyUnramified := by
    sorry
  ```

  I tested it on README line 279's instance `𝔽_p(t) ⊂ 𝔽_p(t)[u]/(uᵖ − t)`. There the right side is vacuously true and `Etale f` is false, and `hgen` is false, so the instance is excluded.

## R02 (P2) — `Suggested.lean` restates five pinned Tau Ceti declarations that the README says it does not state

- **Location.** `Suggested.lean` lines 129–165:
  - `globalDimension`
  - `globalDimension_le_iff_hasProjectiveDimensionLE`
  - `isRegularLocalRing_of_projectiveDimension_residueField`
  - `isRegularLocalRing_iff_finite_globalDimension`
  - `isRegularLocalRing_localization`

  README §0.3 lines 146–147: "they are independent of purity and nothing here restates them".
- **Claim.** These declarations duplicate the pinned library, and the README and the Lean file disagree. None of the five names occurs in the README.
  - The docstrings at lines 136 and 143–144 name EnhancedDerivedSheaves E1.6 as their consumer. E1.6 (main, README line 693) states `isRegularLocalRing_of_projectiveDimension_residueField` itself and does not cite this roadmap.
  - The docstring at line 152 claims a localization statement that the theorem at line 156 does not make.
- **Witness.** Tau Ceti:
  - `TauCeti.globalDimension` (GlobalDimension.lean:70, same body, `@[stacks 00O6]`) and `TauCeti.globalDimension_le_iff_hasProjectiveDimensionLE` (:90);
  - in RegularLocalRing/ProjectiveDimension.lean: `TauCeti.IsRegularLocalRing.of_hasProjectiveDimensionLE` (:336), `TauCeti.isRegularLocalRing_iff_globalDimension_lt_top` (:376) and the instance `TauCeti.isRegularRing_of_isRegularLocalRing` (:441).
- **Repair.** Delete lines 129–165. Tested on a scratch copy importing `TauCeti.RingTheory.RegularLocalRing.ProjectiveDimension`: line 137 closes by `exact TauCeti.globalDimension_le_iff_hasProjectiveDimensionLE R n` and line 163 by `infer_instance`. The README side is R04 and R05.

## R03 (P3) — The gate fails on two files outside the folders the brief names as the pull request's own (previous R01, not repaired)

- **Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` lines 76–78.
- **Claim.** An edit outside the named folders is a finding, and the gate fails, so no acceptance is possible.
- **Witness.** The worker's gate at 1ccc517 reports `outside-folder=2 … FAIL`. `git diff --stat origin/main...HEAD`, excluding the 17 named folders, lists exactly these two files, from commits b96ce18d and 0d80dc9d (earlier e591d103 and 61e5385e).
- **Repair.** Either list ArithmeticDirichletSeries and SymplecticGeometry as folders of the pull request (its description already describes both cuts), or move the two hunks to another pull request.

## R04 (P3) — The supplier contracts cite SchemeAndStackFoundations §4.13 targets for results Tau Ceti already proves, and omit Tau Ceti's 0BMB in dimensions one and two

- **Location.** README lines 15–17, 61–64, 141–151, 253–254, 301 and 349. Line 150 reads: "AbhyankarLemma §3.3 consumes the localization statement from the same source."
- **Claim.** §§2.1 and 2.3 consume three facts: a regular local ring is normal, its localizations are regular (0AFS), and it is `IsRegularRing`. All three are pinned, yet they are cited as proposed names of SchemeAndStackFoundations §4.13 (its lines 5688–5691). The finite case of 0BMB over a regular local ring of dimension one or two, which is §2.1's base case, is pinned and not cited. Line 150 is also false: AbhyankarLemma (main, lines 31, 80–81, 363, 375) cites "PurityOfBranchLocus §0.3 (0AFS)".
- **Witness.**
  - `TauCeti.isRegularRing_of_isRegularLocalRing` (ProjectiveDimension.lean:441, `@[stacks 0AFS]`);
  - Mathlib `IsRegularRing.isRegularLocalRing_localization` (RegularLocalRing/Defs.lean:94);
  - `TauCeti.IsRegularRing.isIntegrallyClosed` (Normal.lean:55, 0567);
  - `TauCeti.Algebra.etale_of_isUnramifiedAt_height_eq_one_of_ringKrullDim_le_two` (Purity.lean:88, `@[stacks 0BMB]`).
- **Repair.**
  - Under "Owned elsewhere" and in §0.3, replace these SchemeAndStackFoundations §4.13 items with the four pinned names. Keep SchemeAndStackFoundations only for what is not pinned.
  - Add the Purity.lean theorem to the Tau Ceti list and to §2.1's *Needs:* as the finite case in dimensions one and two.
  - Change line 150 to: "AbhyankarLemma §3.3 cites this §0.3 for 0AFS, which is Tau Ceti's instance above."
  - Tested: with that import, `IsRegularLocalRing (Localization.AtPrime p)` for a regular local `R` is found by `infer_instance` (probe on line 163).

## R05 (P3) — §0.3 drops targets that open roadmap pull requests cite by name, with no old → new line

- **Location.** README §0.3, lines 141–151. Main's §0.3 stated `auslander_buchsbaum`, `IsRegularLocalRing.free_of_isCohenMacaulay`, `IsRegularLocalRing.globalDimension_le`, `isRegularLocalRing_tfae`, `isRegularLocalRing_of_projectiveDimension_residueField` and `globalDimension`; this head states none of them.
- **Claim.** These ids are dropped while other roadmaps cite them, and the README maps them only by a one-sentence summary, not one line per id.
- **Witness.**
  - AdicCoefficientsAndComparisonsPartII (its open head, README line 153) reads: "Consume §0.3, `IsRegularLocalRing.free_of_isCohenMacaulay` … and `auslander_buchsbaum`".
  - DeformationAndDerivedPatchingAlgebra (open head, line 574) cites §0.3's `IsRegularLocalRing.globalDimension_le` and `isRegularLocalRing_tfae`.
  - EnhancedDerivedSheaves (open head by another author, line 157) cites §0.3 as well.
- **Repair.** Add one line per moved id to §0.3:
  - `auslander_buchsbaum` and `IsRegularLocalRing.free_of_isCohenMacaulay` → SchemeAndStackFoundations §4.13 (not pinned);
  - `isRegularLocalRing_tfae` → Tau Ceti `TauCeti.isRegularLocalRing_tfae` (ProjectiveDimension.lean:392);
  - `IsRegularLocalRing.globalDimension_le` → `TauCeti.IsRegularLocalRing.globalDimension_eq_ringKrullDim` (:222);
  - `isRegularLocalRing_of_projectiveDimension_residueField` → `TauCeti.IsRegularLocalRing.of_hasProjectiveDimensionLE` (:336);
  - `globalDimension` → `TauCeti.globalDimension`.

## R06 (P3) — The claim that Mathlib lacks étale localization of a quasi-finite morphism is false at the pin

- **Location.** README lines 21–22: "it has neither 0BMB, nor étale localization of a quasi-finite morphism, nor a ramification or branch locus". §1.1 (lines 215–221) cites only the affine input 00UJ.
- **Witness.** Mathlib has `AlgebraicGeometry.exists_etale_isCompl_of_quasiFiniteAt` (AlgebraicGeometry/ZariskisMainTheorem.lean:46). For `f` separated and locally of finite type, quasi-finite at `x`, it gives an étale `g` whose image contains `f x` and a clopen `V` of `pullback f g`, finite over the source of `g`, containing a point over `x`.
- **Repair.**
  - In the Summary, say Mathlib has the separated case of étale localization but not Stacks 02LK.
  - In §1.1, cite the Mathlib lemma and state in one clause what 02LK adds: no separatedness, an elementary neighbourhood (`κ(u) = κ(s)`), a unique `v` over `u` with `κ(x) = κ(v)`, and stability under refinement.
  - Tested on the affine line with doubled origin over `𝔸¹`, at one origin: the Mathlib lemma needs `IsSeparated` and does not apply, while 02LK holds with `U = S` and `V` the chart containing `x`.

## R07 (P3) — The §0.1 unramified equivalence cites only a definition

- **Location.** README lines 115–116, the Stacks-alignment row at line 366, and `Suggested.lean` line 40: `@[stacks 02G4 "equivalence with the stalk form"]`.
- **Witness.** 02G4 (stacks-02G4 line 3333) is Definition 29.36.1 only. The equivalence of "unramified at `x`" with `Ω_{X/S,x} = 0`, for `f` locally of finite type, is Lemma 29.36.14 (02GF), conditions (1) and (3), at stacks-02GF lines 3448–3453.
- **Repair.**
  - Cite "Stacks, Lemma 29.36.14 (02GF), (1) ⇔ (3), `Ω_{X/S,x}` being the module of differentials of the stalk map" in §0.1 and in the table.
  - Change the attribute to `@[stacks 02GF "(1) ⇔ (3)"]`.
  - 02GF is already in the manifest.

## R08 (P3) — Padding: two declarations are one-term corollaries of other declarations in the file

- **Location.** `Suggested.lean` lines 78–85 (`ramificationLocus_eq_stacks`, whose own docstring says "This is `unramifiedAt_iff_stalkMap` pointwise") and lines 122–127 (`branchLocus_spec`).
- **Witness.** On a scratch copy, `exact Set.ext fun x => not_congr (unramifiedAt_iff_stalkMap f x).symm` closes the first and `exact congrArg _ ramificationLocus_spec` closes the second; the copy elaborates with no error.
- **Repair.** Delete both from `Suggested.lean`; the README keeps them as §0.4 targets (with italic names, see R10).

## R09 (P3) — The module docstring and imports are not in the acceptance-test form

- **Location.** `Suggested.lean` line 2 (`import TauCeti.RingTheory.RegularLocalRing.Basic`) and lines 5–10: "# Purity of the branch locus: suggested forms … **This file is not the roadmap and is not exhaustive.** … suggest Lean forms for particular milestones".
- **Witness.** The file elaborates unchanged without line 2 (exit 0, the same 21 `sorry` warnings), so the import is unused. The docstring names no headline theorem.
- **Repair.**
  - Retitle the docstring "Purity of the branch locus: target signatures".
  - Say that the roadmap is `README.md` and this file states its headline theorems against the pinned APIs: 0BMB in stalk, Stacks and affine form, §2.2, and §2.3's two codimension-one statements. Say that every headline is statable.
  - Delete line 2.

## R10 (P3) — The README backticks names of its own that `Suggested.lean` does not declare

- **Location.** README:
  - line 120 `Scheme.Hom.etaleAt_spec_iff`
  - line 124 `Scheme.Hom.quasiFiniteAt_of_appLE`
  - line 132 `isNormalDomain_iff_of_etale`
  - line 215 `exists_elementaryEtale_finite_of_isolated`
  - line 222 `etale_of_etale_comp_surjective`
  - Stacks-alignment rows at lines 366–368 and 376–377
- **Witness.** None of the five is declared in `Suggested.lean`. A backticked name of the roadmap's own claims a declaration there.
- **Repair.** Write them as proposed names in italics (*isNormalDomain_iff_of_etale*), as #1808's head of this README does. `etale_of_etaleAt_codimOne` is repaired by R01.

## R11 (P3) — The Checks carry Lean names, and two of the three loci have fewer than three discriminating Checks

- **Location.** README lines 202–209, 262–267 and 352–357 (`test_ramificationLocus_ne_nonEtaleLocus`, `test_purity_needs_regular`, …).
- **Witness.** A Check never names a Lean counterpart. `nonEtaleLocus` is computed only at line 203 (a point) and line 353 (`V(x)`). `branchLocus` is computed only on the square map, twice (lines 209 and 354).
- **Repair.**
  - Drop the `test_*` names.
  - Add Checks for the non-étale locus: it is all of `𝔸¹` for the Frobenius and empty for `𝔾_m ⊂ 𝔸¹`.
  - Add Checks for the branch locus:
    - for `Spec k → 𝔸¹` it is `∅` while `f '' nonEtaleLocus = {0}`, which excludes that wrong model;
    - for the Frobenius it is all of `𝔸¹`.

## R12 (P3) — The README lacks the standard sections

- **Location.** The headings at README lines 41–398.
- **Witness.** There is no `## Exact supplier contracts`, no `## How to read the build`, no per-layer `### Examples` or `### Dependencies`, and no `## Downstream consumers`. Of the 153 roadmaps on main, 62, 58, 57, 59 and 60 respectively carry these sections.
- **Repair.**
  - Move lines 53–78 into `## Exact supplier contracts`, with `From Mathlib`, `From Tau Ceti` and `From TauCetiRoadmap.<X>` subsections.
  - Add `## How to read the build`.
  - End each layer with `### Examples` (the Checks' examples) and `### Dependencies` (its *Needs:* lines).
  - Add `## Downstream consumers`, naming AbhyankarLemma §3.3, the only roadmap on main that cites a section of this one.

## R13 (P3) — The Provenance table pins no commit, and its paths are gone from the repository's current main

- **Location.** README lines 389–396: "Paths are under `lean/Pcf/`."
- **Witness.**
  - At the repository's main, the top level is `char-p`, `char-zero`, `legacy/entry-0` and `library`, and `lean/Pcf/Stacks/Purity` returns 404.
  - At commit `a39c3781…`, the commit Tau Ceti's `RegularLocalRing/Normal.lean` cites, `Tag0BMA.lean`, `Tag0BMBScheme.lean` and `Tag0BMBSchemeAPI.lean` exist.
- **Repair.** Write "at commit `a39c3781b9850b9f3d5cbc9920322a3b8e365ef2`" in the Provenance paragraph. At that commit `isStacksEtaleAt_of_zariskiNagataPurity` is in `Tag0BMBScheme.lean`, namespace `Pcf.Stacks`; re-check the other five names there.

## Previous findings

- **R01** (two files outside the named folders): not repaired. Both files are still in the diff against `origin/main`, re-added by b96ce18d and 0d80dc9d after 74e527e8 dropped them once. The worker's gate still reports `outside-folder=2 … FAIL`. It is R03 above.

## Verified sound

**Gate and build.**
- The worker's gate at 1ccc517 reports zero hits on every check except `outside-folder=2`, including `statement-hygiene`, `readme-ids-missing`, `stray-files` and `build`; the verdict is `FAIL`.
- My hand run with `--base origin/main` gives `outside-folder=34`. It cannot see the pull request's other folders, so it counts their files; the two files of R03 are among the 34.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.
- Dependency check: `depcheck: 239 roadmaps, 2351 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. PurityOfBranchLocus, LocalPurity, SchemeAndStackFoundations, ModularCurves and AbhyankarLemma are all on main.
- `lake env lean TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean` exits 0 with 21 `declaration uses 'sorry'` warnings, one per theorem (lines 41–268), and nothing else.

**Elaborated signatures.**
- I compared all 25 elaborated types (the worker's `#check @name` file, `signatures.md`) with the README statements, binder by binder. No binder is lost, and each `def` carries only `{X Y} (f)` or `(R) [CommRing R]`.
- The generality matches the README for every §0.1, §0.4, §2.1 and §2.3 statement:
  - `[LocallyOfFiniteType f]` on `unramifiedAt_iff_stalkMap`, `ramificationLocus_eq_stacks` and `isClosed_ramificationLocus`;
  - `[LocallyOfFinitePresentation f]` on `etaleAt_iff_stalkMap`;
  - `[Algebra.FinitePresentation R S]` on `nonEtaleLocus_spec` only;
  - `[IsFinite f]` on `isClosed_branchLocus`;
  - the §2.3 hypothesis list exactly as README line 291, with integral closedness of `X`'s stalks omitted from `ringKrullDim_stalk_eq_of_locallyQuasiFinite`, as README line 296 says.
- `x' ⤳ x` is Mathlib's `Specializes x' x` (`x ∈ closure {x'}`), so `x'` ranges over generizations, as in 0BMB (5) and in the "no proper generization" conditions of §2.3.

**One-tactic probe.** I ran it on every declaration on scratch copies.
- `ramificationLocus_eq_stacks`, `branchLocus_spec` (R08), `globalDimension_le_iff_hasProjectiveDimensionLE` and `isRegularLocalRing_localization` (R02) close.
- `simp` makes no progress on `isClosed_nonEtaleLocus` or on `ramificationLocus_subset_nonEtaleLocus`.
- No headline closes.

**Pinned declarations opened (25).**
- Mathlib, `AlgebraicGeometry/`:
  - `Morphisms/QuasiFinite.lean`: `Scheme.Hom.QuasiFiniteAt` (:333), `.quasiFiniteAt` (:337), `Scheme.Hom.quasiFiniteAt_iff_isOpen_singleton_asFiber` (:389);
  - `ZariskisMainTheorem.lean:46` `exists_etale_isCompl_of_quasiFiniteAt`;
  - `Morphisms/Etale.lean:136` `Etale.iff_flat_and_formallyUnramified`;
  - `Morphisms/LocalFlatDescent.lean:48`, the `DescendsAlong @Etale (@Surjective ⊓ @Flat ⊓ @QuasiCompact)` instance;
  - `Morphisms/UniversallyClosed.lean:46` `Scheme.Hom.isClosedMap`;
  - `ResidueField.lean:123` `Scheme.Hom.residueFieldMap`.
- Mathlib, `RingTheory/`:
  - `QuasiFinite/Basic.lean:368` `Algebra.QuasiFiniteAt`, whose docstring records that it differs from Stacks 00PL by dropping finite type;
  - `Etale/Locus.lean`: `IsEtaleAt` (:35, defined as `FormallyEtale R (Localization.AtPrime q)`), `etaleLocus` (:40), `isOpen_etaleLocus` (:93), `basicOpen_subset_etaleLocus_iff_etale` (:97);
  - `Unramified/Locus.lean`: `IsUnramifiedAt` (:47), `unramifiedLocus` (:52), `isOpen_unramifiedLocus` (:144, which needs `EssFiniteType`);
  - `Ideal/GoingDown.lean:44` `Algebra.HasGoingDown`, with the `@[stacks 00H8]` instance at `IntegralClosure/GoingDown.lean:48`;
  - `Ideal/KrullsHeightTheorem.lean:484` `Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown` (`@[stacks 00ON]`);
  - `Etale/QuasiFinite.lean:378` `Algebra.exists_etale_isIdempotentElem_forall_liesOver_eq` (`@[stacks 00UJ]`);
  - `ZariskisMainTheorem.lean:657` `ZariskisMainProperty.of_finiteType`;
  - `RegularLocalRing/Defs.lean`: `IsRegularLocalRing` (:52), `IsRegularRing` (:93).
- Tau Ceti, `RingTheory/RegularLocalRing/`:
  - `Basic.lean`: `isDomain` (:164), `quotient_span_singleton` (:188), `isDiscreteValuationRing_iff_ringKrullDim_eq_one` (:235);
  - `Flat.lean:74` `of_flat_of_formallyUnramified`, whose hypotheses are flat, formally unramified, `EssFiniteType` and a local homomorphism, as README line 72 says;
  - `CohenMacaulay.lean:125` `isCohenMacaulay`;
  - `Catenary.lean:50` `isUniversallyCatenary`;
  - plus the files named in R02 and R04.

**Sources sample.** Every target was read at its locator in the cache, and each supports the statement as written.
- §0.1:
  - 02G4 (stacks-02G4 line 3333);
  - 02GI (line 3528);
  - 02GU (1)⇔(4) (line 3626; (4) on line 3634);
  - 01TD (line 1605), which matches Convention 3's open-neighbourhood form with Mathlib's stalk `QuasiFiniteAt`;
  - the locator gap is R07.
- §0.2:
  - 025P is Proposition 41.19.7 (stacks-025P line 976): A is a normal domain iff B is;
  - 039S (line 943) and 025N (line 953);
  - 0258 (line 541): Convention 5's localization form is equivalent to it, and completion is excluded by both.
- §0.3:
  - 00OC (stacks-00OC line 12552), 0AFS (line 12566), 0567 (line 20195).
- §0.4:
  - 0BJH (stacks-0BJH lines 2479–2502): its proof uses the discriminant `D_π`, whose points are the `y′` over a ramified point, as the README says;
  - 0BJF (line 269): étale iff the discriminant is empty;
  - 0EA4 (lines 3019–3033): no quasi-finiteness, étale in codimension one, as README line 290 says;
  - 0ECD (line 3119), "maximal open subscheme where f is étale";
  - 02G3: the remark at stacks-02G3 lines 3345–3347 that the unramified points form an open set;
  - 01WM (line 4879).
- §1.1:
  - 02LK (stacks-02LK lines 5984–5997), conclusions (i)–(iii) and the refinement clause as stated;
  - 036W (stacks-036W line 3086);
  - 02VN (line 2792);
  - 00UJ (stacks-00UJ line 18397).
- §2.1:
  - 0BMB (stacks-0BMB lines 2524–2533), hypotheses (1)–(5) one-to-one with the Lean binders `IsDomain` + `IsIntegrallyClosed`, `IsRegularLocalRing`, `hqf`, `hdim` + `hpos`, `hunr`;
  - the proof at lines 2534–2564 uses étale localization, base change to `Spec 𝒪_{Y,y}`, going down, 0AFS and 0BMA, as README lines 246–252 sketch.
- §2.2: an *API* target with no locator. Its counterexample is computed in the table below.
- §2.3:
  - sga1 X 3.1 (line 8359, printed page 212) and I 9.5 (ii) (line 990);
  - 00Q9 (line 14138), 00H8 (line 4098), 00ON (line 12677), 00NQ (line 11925), 00NM (line 11885);
  - 02JU (stacks-02JU lines 6106–6114), equality when the base is universally catenary.
- No locator in the README is flagged as unverified.

**Cross-roadmap citations resolved.**
- LocalPurity, at this head (a folder of the pull request):
  - §2.1 `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` is at README line 265 and `Suggested.lean` line 115. Its torsion-free hypothesis holds in the 0BMB reduction, because `𝒪_{X,x}` is a normal local domain finite and injective over `𝒪_{Y,y}`.
  - Convention 5 is at line 118.
  - Lines 20 and 98 name this roadmap as consumer.
- SchemeAndStackFoundations, at this head: §0.17 (line 1138, `isCohenMacaulay_iff_forall_satisfiesSerreS` at 1173) and §4.13 (line 5643, `serre_normality_criterion` at 5735).
- On main:
  - ModularCurves §4D (line 1165): "locality and invariance under isomorphism and étale morphisms" at line 1189.
  - AbhyankarLemma §3.3 (line 333).
  - EnhancedDerivedSheaves E1.6 (line 689).
- All nine names in `citations.md` are accounted for:
  - seven are declared in `Suggested.lean`, or will be by R01;
  - one is the LocalPurity target above;
  - one is the Provenance name of R13.
- Observation for the other folders' reviews: ModularCurves §4D on main and SchemeAndStackFoundations §4.13 at this head (*IsRegular.of_etale*, line 5650) both claim étale invariance of regular schemes. This roadmap cites the former, which resolves.

**Overlaps and ownership.**
- #1807's head carries this folder byte-identical to this head.
- #1808's head carries a different version: it renumbers §0.4 to §0.3, adds the §2.2 headline, drops the global-dimension block and italicises proposed names. The overlap scan reports no conflict between #1808 and #1854 in this folder.
- No id this README cites is dropped by an open pull request (`overlaps.md`); the dropped ids this pull request causes are R05.
- `roadmaps grep` finds no other definition of a ramification, branch or non-étale locus of a morphism of schemes. BelyiMaps' `ramificationLocus_discrete` concerns holomorphic maps.
- This roadmap owns those loci. LocalPurity owns 0BMA, and PurityForFlatCohomology owns flat purity.
- No gaps are declared: there is no readable `design/plan.json` and no `gap:` contract.

**Headline theorems.** The README names three end theorems at lines 37–39, plus SGA 1 X 3.1 in its ramification form. Four are stated:
- `exists_etale_of_formallyUnramified_stalk_codimOne`, with its Stacks and affine forms;
- `ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus`;
- `ringKrullDim_stalk_eq_one_of_maximal_branchLocus`.

One is absent: R01.

**Adversarial table.** Notation:
- `k` is a field;
- *i* is the closed immersion `Spec k → 𝔸¹_k` at `0`;
- *Frob* is `t ↦ tᵖ` on `𝔸¹` in characteristic `p`;
- *sq* is `(x, y) ↦ (u, v) = (x², y)` on `𝔸²` in characteristic `≠ 2`;
- *quot* is `𝔸² → Spec k[x², xy, y²]` in characteristic `≠ 2`.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `unramifiedAt_iff_stalkMap` (§0.1) | *i*; *Frob* at 0; `Spec ℚ → Spec ℤ` | *i*: `Ω = 0`, both sides true; *Frob*: `Ω_x = 𝒪·dt ≠ 0`, both false; ℚ: stalk map an isomorphism, RHS true, LHS false (not of finite type) | holds; finite-type hypothesis needed and present | R07 |
| `etaleAt_iff_stalkMap` (§0.1) | *i*; `𝔾_m ⊂ 𝔸¹`; *Frob* | *i*: `k` has `t`-torsion, not flat, both false; open immersion: both true; *Frob*: flat (free of rank `p`) but `Ω ≠ 0`, both false | holds | none |
| *isNormalDomain_iff_of_etale* (025P) | `A = k[t]_(t) → B = (A[s]/(s² − 1 − t))_(t, s − 1)`; cusp `k[t², t³]_𝔪 → k[t]_(t)` | `2s` a unit, étale: both DVRs, true ↔ true; normalization of the cusp: `𝔪_A B = (t²) ≠ (t)`, not étale, false ↔ true | holds on étale maps, fails without étaleness | none |
| Convention 5 (0258) | completion `A → Â` of `k[t]_(t)` | flat, `𝔪Â` maximal, same residue field; not essentially of finite type, so excluded by 0258 (via Definition 41.3.1) and by the `C_𝔮` form alike | consistent | none |
| §0.3 block (Lean lines 129–165) | `k`; `k[ε]/(ε²)`; `R = k[x, y]_(x, y)`, `p = (x)` | gl.dim `k = 0`: true ↔ `∃ n, 0 ≤ n`; `k[ε]`: gl.dim `⊤`, false ↔ false; `R_p = k[x, y]_(x)` a DVR | true, but pinned | R02 |
| `ramificationLocus`, `nonEtaleLocus`, `branchLocus` (§0.4) | *i*; *Frob*; *sq*; `𝔾_m ⊂ 𝔸¹` | ramification / non-étale / branch: `∅ / {0} / ∅`; `𝔸¹ / 𝔸¹ / 𝔸¹`; `V(x) / V(x) / V(u)`; `∅ / ∅ / ∅`. Wrong model `f '' nonEtaleLocus` gives `{0} ≠ ∅` on *i* | sound | R11 |
| `ramificationLocus_spec` | `k[u] → k[x]`, `u ↦ x²`; `ℤ → ℚ` | `Ω_{S/R} = (S/(x))·dx`: unramified locus `D(x)`, complement `V(x)` = ramification locus; ℚ: both sides `∅` | holds without finiteness, as README line 194 says | none |
| `nonEtaleLocus_spec` | `k[t] → k`; `ℤ → ℚ` (not of finite presentation) | étale locus `∅`, complement `{pt}`, non-étale locus `{pt}`; ℚ: `FormallyEtale ℤ ℚ`, complement `∅`, but no open is étale, non-étale locus `{(0)}` | finite-presentation hypothesis needed and present | none |
| `isClosed_branchLocus` | *sq*; *sq* restricted to `𝔸² ∖ {(0, 1)}` | `V(u)` closed; restriction: `V(u) ∖ {(0, 1)}`, not closed | finiteness needed and present | none |
| `ramificationLocus_eq_stacks`, `branchLocus_spec` | probe | closed by the one-term proofs of R08 | padding | R08 |
| *exists_elementaryEtale_finite_of_isolated* (02LK) | `t ↦ t²` at 0; `k[x, y]/(xy) → k[x]` at the origin; line with doubled origin | `U = S`, `V = X`, one point, `κ = k`; fibre `k[y]`, origin not isolated, hypothesis false; non-separated: the Mathlib lemma does not apply, 02LK holds | sound | R06 |
| *etale_of_etale_comp_surjective* (036W) | *sq* with `g : D(x) ↪ 𝔸²`; *sq* with `g : D(x) ⊔ D(x − 1) → 𝔸²` | `g ≫ f` étale, `f` not (surjectivity needed); cover: `g ≫ f` ramified at `(0, 1) ∈ D(x − 1)`, false ↔ false | holds | none |
| `exists_etale_of_formallyUnramified_stalk_codimOne` (0BMB) | row 3's `A → B`; *sq*, *quot* at the origin; *Frob* at 0; `t ↦ (t, 0)`, `𝔸¹ → 𝔸²` | `d = 1`: `x ⤳ x` unramified, étale; *sq*: `hunr` false at `η_{V(x)}`, not étale; *quot*: target not regular; *Frob*: `hunr` false at `x`; `𝔸¹ → 𝔸²`: `hdim` is `1 ≠ 2`, unramified, not étale (`hdim` needed) | sound | none |
| `etaleAt_of_unramifiedAt_codimOne` | as above; `Spec ℚ → Spec ℤ` at `(0)` | same values; ℚ: no finite-type neighbourhood, `hqf` false, not étale | sound | none |
| `isEtaleAt_of_purity` | `k[u, v] → k[x, y]`, `(u, v) ↦ (x², y)`, `q = (x, y)`; `q = (x − 1, y)` | heights `2 = 2`; `q′ = (x)`: `Ω_{q′} ≠ 0`, `hunr` false, not étale; `x ∉ q`, so every height-one `q′ ⊆ q` has `Ω_{q′} = 0`, étale | sound | none |
| `etale_of_etaleAt_codimOne` (§2.2, absent) | `𝔽_p(t)[u]/(uᵖ − t)`; *sq*; `id`; *quot* | right side vacuously true, `Etale` false, `hgen` false; *sq*: false ↔ false; `id`: true ↔ true; *quot*: right side true, left side false, excluded by regularity | sound, statable | R01 |
| `ringKrullDim_stalk_eq_of_locallyQuasiFinite` | *sq* at the origin, `η_{V(x)}`, `η`; cusp `Spec k[t², t³] → 𝔸¹`; `𝔸¹ → 𝔸²` closed immersion | `2 = 2`, `1 = 1`, `0 = 0`; cusp `1 = 1` with `X` not normal; immersion `1 ≠ 2`, excluded by `IsDominant` | sound | none |
| `ramificationLocus_eq_nonEtaleLocus` | *sq*; *Frob*; *quot* (target not regular) | `V(x) = V(x)`; `𝔸¹ = 𝔸¹`; `{0} = {0}` | sound. Note: SGA 1 I 9.5 (ii) needs only `Y` normal, so the integral closedness of `X`'s stalks is used only by the 0BMB route | none |
| `ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus` | *sq* at `z = η_{V(x)}`; *Frob* at `z = η` without `hne`; *quot* at the origin | `dim = 1`; `dim 𝒪_η = 0 ≠ 1`, so `hne` is needed (it is false there); `dim = 2`, excluded by regularity | sound | none |
| `ringKrullDim_stalk_eq_one_of_maximal_branchLocus` | *sq* at `w = η_{V(u)}`; *Frob* at `w = η_Y` | `dim 𝒪_{Y,w} = 1`; `dim = 0` with `hne` false | sound | none |
| Checks of §§2.1 and 2.3 | *quot*; *sq* | *quot*: étale off the origin (free `±1` action), fibre `k[x, y]/(x², xy, y²)` of length 3, not étale, ramification locus `{0}` with `dim 𝒪 = 2`; *sq*: `V(x)`, `V(x)`, `V(u)` of height 1 | true | R11 (names only) |

## Not verifiable

- The Provenance names other than `isStacksEtaleAt_of_zariskiNagataPurity`. The README pins no commit (R13), so there is no fixed text to check them against. I checked that name at commit `a39c378`.
- Zariski 1958 and Nagata 1959: no claim in the README carries their locators. They are cited only as the origin of the theorem.

## Source issues

- **Misprint** in sga1 at X 3.1, remark after the theorem, printed page 212 (sga1 line 8367): the source says the condition `Z ≠ X` means the finite extension `R(Z)/R(X)` is separable; it should be the extension `R(X)/R(Y)` of function fields; affects nothing.
- **Error** in stacks-0BMA at Lemma 58.21.3 (2), PDF page 53 (stacks-0BMA lines 2506–2507): the source says every finite `A → B` with `B` normal, étale over the punctured spectrum, is étale; it should require `B` torsion free over `A`, since `A × A/𝔪` is finite, normal, étale there and not flat; affects a stated result.
