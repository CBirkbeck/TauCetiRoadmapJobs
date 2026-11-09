# Review of PurityOfBranchLocus (pull request #1807 at 9d475e2)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines since 64a16e1. `TauCetiRoadmap/PurityOfBranchLocus/` (README.md, Suggested.lean, metadata.toml) is byte-identical to the state the previous review read. The pins are also unchanged: Mathlib `1b1ccf4b0`, Tau Ceti `2fd255d99`, `v4.36.0-rc2`.

Since 64a16e1 the pull request rewrote 25 files in 13 other folders. Two of them are suppliers this README cites, LocalPurity and SchemeAndStackFoundations. The SchemeAndStackFoundations rewrite makes this README's §4.13 citations for the regular-local-ring chain wrong; that is the new finding R10. None of the nine previous findings is repaired. Each was re-witnessed at this head and at the pins this round, and each is written again below.

## R01 (P2) — The pinned Tau Ceti already proves Layers 0–1 and two §2.3 targets, which the README plans as its own

- **Location.** `TauCetiRoadmap/PurityOfBranchLocus/README.md`:
  - lines 12–14: "this roadmap supplies the pointwise vocabulary in stalk form, the permanence of normality under étale homomorphisms of local rings, étale localization of a quasi-finite morphism";
  - lines 43–51 (*This roadmap owns*);
  - §§0.1, 0.2, 0.4 and 1.1;
  - §2.3, lines 295–320.
- **Claim.**
  - Every target of §§0.1, 0.2, 0.4 and 1.1, with its Checks, is a sorry-free declaration of Tau Ceti at the pin, sometimes more general. So are two of the four §2.3 targets.
  - The README cites none of them and claims to own them.
  - It sends 0AFS, regular ⇒ normal and the étale invariance of regularity to roadmaps (SchemeAndStackFoundations §4.13, ModularCurves §4D) instead of to the pinned declarations.
- **Witness (re-opened this round).**
  - `TauCeti/AlgebraicGeometry/Morphisms/RamificationLocus.lean` line 104 defines `ramificationLocus` exactly as README §0.4 does.
  - Line 197 of the same file proves `ramificationLocus_eq_nonEtaleLocus` for `[IsNormalScheme Y]`.
  - All nine files of the map below have zero occurrences of `sorry` at `2fd255d99`.
- **Repair.**
  1. Add the declarations below to a `From Tau Ceti` supplier list, with names, files and their pinned hypotheses.
  2. Delete the matching targets and Checks from §§0.1, 0.2, 0.4, 1.1 and 2.3.
  3. Rewrite the Summary, the layer table and *This roadmap owns* so that they name only what remains here: 0BMB in all dimensions (scheme, Stacks and affine forms), §2.2, and the two codimension-one theorems of §2.3.
  4. Keep §0.3 and §0.1 as one-line pointers to their pinned owners, because other roadmaps cite them:
     - AbhyankarLemma on main (README lines 31, 363, 375) cites "PurityOfBranchLocus §0.3 (0AFS)";
     - CrystallineCohomology (open) README line 445 cites "§0.1's `Scheme.Hom.unramifiedAt_iff_stalkMap`".

  Map of the pinned declarations (paths under `TauCeti/`):

| README target | Pinned Tau Ceti declaration | File, line |
|---|---|---|
| §0.1 `unramifiedAt_iff_stalkMap`, `etaleAt_iff_stalkMap` | `AlgebraicGeometry.Scheme.Hom.unramifiedAt_iff_stalkMap`, `…etaleAt_iff_stalkMap` (same statements) | `AlgebraicGeometry/Morphisms/StalkMap.lean` 201, 222 |
| §0.1 `etaleAt_spec_iff` and its unramified analogue | `Scheme.Hom.etaleAt_spec_iff`, `Scheme.Hom.unramifiedAt_spec_iff` | ibid. 363, 376 |
| §0.1 `quasiFiniteAt_of_appLE`; Convention 3 (01TD) | `Scheme.Hom.quasiFiniteAt_of_appLE`, `Scheme.Hom.exists_appLE_quasiFiniteAt_iff` | ibid. 389, 418 |
| §0.2 `isNormalDomain_iff_of_etale` (025P) | `TauCeti.Algebra.isNormalDomain_iff_of_etale` (no Noetherian hypothesis) | `RingTheory/Etale/Normal.lean` 164 |
| 039S and 025N at stalks (cited from ModularCurves §4D) | `Scheme.Hom.ringKrullDim_stalk_eq_of_etale`, `Scheme.Hom.isRegularLocalRing_stalk_iff_of_etale` | `AlgebraicGeometry/Morphisms/Etale/Stalk.lean` 46; `AlgebraicGeometry/Scheme/Regular/LocalRing.lean` 113 |
| 0AFS localization and `IsRegularRing` (cited from SchemeAndStackFoundations §4.13) | instance `TauCeti.isRegularRing_of_isRegularLocalRing`, `@[stacks 0AFS "second sentence"]`, with Mathlib's `IsRegularRing.isRegularLocalRing_localization` (`RingTheory/RegularLocalRing/Defs.lean` 94) | `RingTheory/RegularLocalRing/ProjectiveDimension.lean` 441 |
| `IsRegular.isNormal` (cited from SchemeAndStackFoundations §4.13) | `TauCeti.AlgebraicGeometry.IsRegular`, instance `IsRegular.isNormal` | `AlgebraicGeometry/Scheme/Regular/Scheme.lean` 68, 175 |
| §0.4: the three loci | `Scheme.Hom.ramificationLocus`, `nonEtaleLocus`, `branchLocus` | `AlgebraicGeometry/Morphisms/RamificationLocus.lean` 104, 111, 116 |
| §0.4 `ramificationLocus_eq_stacks`, `isClosed_*`, `ramificationLocus_subset_nonEtaleLocus` | `ramificationLocus_eq_setOf_not_exists`, `isClosed_ramificationLocus`, `isClosed_nonEtaleLocus`, `ramificationLocus_subset_nonEtaleLocus`, `isClosed_branchLocus` (for any universally closed `f` locally of finite type, not only finite) | ibid. 170, 179, 185, 189, 217 |
| §0.4 `*_spec` | `ramificationLocus_specMap`, `branchLocus_specMap`, `nonEtaleLocus_specMap` | ibid. 225, 233, 241 |
| §0.4 Checks; §2.3 Check `test_purity_branchLocus_square` | `example`s and `TauCeti.AlgebraicGeometry.ramificationLocus_square`, `branchLocus_square`, `nonEtaleLocus_square`, `isGenericPoint_branchLocus_square` | `Examples/AlgebraicGeometry/Morphisms/RamificationLocus.lean` 74, 83, 129, 249, 258, 298, 325 |
| §1.1 `exists_elementaryEtale_finite_of_isolated` (02LK) | `Scheme.Hom.exists_elementaryEtale_finite_of_isolated`; persistence `Scheme.Hom.exists_finite_open_baseChange` | `AlgebraicGeometry/Morphisms/ElementaryEtale/Basic.lean` 70; `…/BaseChange.lean` 44 |
| §1.1 `etale_of_etale_comp_surjective` (036W) | `AlgebraicGeometry.Etale.of_comp_surjective` (`g` flat and surjective, `f` LFP; the case §2.1 uses) | `AlgebraicGeometry/Morphisms/StalkMap.lean` 509 |
| §2.3 `ringKrullDim_stalk_eq_of_locallyQuasiFinite` | `Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite` (`IsNormalScheme Y`, no Noetherian hypothesis) | `AlgebraicGeometry/Morphisms/LocallyQuasiFinite.lean` 142 |
| §2.3 `ramificationLocus_eq_nonEtaleLocus` | `Scheme.Hom.ramificationLocus_eq_nonEtaleLocus` | `AlgebraicGeometry/Morphisms/RamificationLocus.lean` 197 |
| §2.1 inputs: dimension one, dimension two, the I 9.5 (ii) route | `Scheme.Hom.exists_etale_of_formallyUnramified_stalkMap_of_isDedekindDomain`, `Scheme.Hom.exists_etale_of_formallyUnramified_stalkMap_of_ringKrullDim_le`, `TauCeti.Algebra.etale_of_isUnramifiedAt_height_eq_one_of_ringKrullDim_le_two` (0BMB for `dim ≤ 2`) | `StalkMap.lean` 303, 324; `RingTheory/RegularLocalRing/Purity.lean` 88 |

## R02 (P2) — Suggested.lean restates pinned Tau Ceti declarations and five statements the README disowns

- **Location.** `TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean`:
  - lines 38–127: Layer 0, with two §0.1 theorems, the three loci and seven API theorems;
  - lines 129–165: `globalDimension`, `globalDimension_le_iff_hasProjectiveDimensionLE`, `isRegularLocalRing_of_projectiveDimension_residueField`, `isRegularLocalRing_iff_finite_globalDimension`, `isRegularLocalRing_localization`;
  - lines 226–246: the two §2.3 auxiliary theorems.
- **Claim.**
  - (a) None of these is a headline, and each restates a pinned Tau Ceti declaration (R01).
  - (b) README §0.3 (lines 141–147) says the regular-local-ring statements belong to another owner and that "nothing here restates them". None of the five names of lines 129–165 appears in the README.
  - (c) The docstrings on lines 136 and 144 name EnhancedDerivedSheaves E1.6 as a consumer, which the README does not say.
- **Witness (probe re-run this round).** I made a scratch copy of the file at this head, importing these modules:
  - `TauCeti.AlgebraicGeometry.Morphisms.RamificationLocus`, `…LocallyQuasiFinite` and `…StalkMap`;
  - `…Scheme.Regular.Scheme`;
  - `TauCeti.RingTheory.RegularLocalRing.ProjectiveDimension` and `TauCeti.RingTheory.GlobalDimension`.

  It elaborates with exit 0 and no error. In it:
  - the three loci (lines 61–76) and `globalDimension` (line 132) are each `rfl` to Tau Ceti's;
  - `exact Scheme.Hom.<lemma>` closes lines 41, 50, 82, 90, 95, 99, 104, 109, 116 and 124;
  - `exact TauCeti.globalDimension_le_iff_hasProjectiveDimensionLE R n` closes line 137;
  - `infer_instance` closes line 163;
  - lines 232 and 241 close in two lines: `have : TauCeti.AlgebraicGeometry.IsRegular Y := ⟨inferInstance⟩`, then `exact f.ringKrullDim_stalk_eq_of_locallyQuasiFinite x` (resp. `exact f.ramificationLocus_eq_nonEtaleLocus`).
- **Repair.**
  1. Delete lines 32–167 and 226–246.
  2. Import `TauCeti.AlgebraicGeometry.Morphisms.RamificationLocus` and `TauCeti.AlgebraicGeometry.Scheme.Regular.Scheme`.
  3. State the ramification-locus headline of §2.3 on Tau Ceti's locus:

     ```lean
     [IsIntegral X] [IsIntegral Y] [TauCeti.AlgebraicGeometry.IsNormalScheme X]
     [TauCeti.AlgebraicGeometry.IsRegular Y] (f : X ⟶ Y) [LocallyOfFiniteType f]
     [LocallyQuasiFinite f] [IsDominant f] (hne : f.ramificationLocus ≠ Set.univ) (z : X)
     (hz : z ∈ f.ramificationLocus) (hmax : ∀ z' ∈ f.ramificationLocus, z' ⤳ z → z' = z) :
     ringKrullDim (X.presheaf.stalk z) = 1
     ```

  4. State the same for `w ∈ f.branchLocus`, concluding `ringKrullDim (Y.presheaf.stalk w) = 1`.
  5. Write the class names fully qualified, or `open TauCeti.AlgebraicGeometry`. A bare `IsRegular Y` resolves to Mathlib's regular-element predicate.

  **Tested this round:** both statements elaborate in the probe (`Probe.lean`, lines 308 and 316), each with one `declaration uses sorry` warning and nothing else.

## R03 (P2) — The §2.2 end theorem is statable at the pins but absent from Suggested.lean

- **Location.** README lines 37–38 ("`Scheme.Hom.etale_of_etaleAt_codimOne` (§2.2)") and 271–281. `Suggested.lean` has no such declaration. Its `theorem` lines are 41, 50, 82, 90, 95, 99, 104, 109, 116, 124, 137, 146, 156, 163, 181, 198, 213, 232, 241, 253 and 268.
- **Claim.** One of the three named end theorems is missing from the acceptance test, and the module docstring does not say it is unstatable.
- **Witness.** Every carrier exists at the pins:
  - Mathlib's `IsFinite`, `IsDominant`, `genericPoint`, `Etale` and `Scheme.Hom.stalkMap`;
  - Tau Ceti's `IsNormalScheme` (`AlgebraicGeometry/Scheme/Normal.lean` 84) and `IsRegular` (`Regular/Scheme.lean` 68).

  The statement below elaborated in this round's probe (`Probe.lean` line 300) with `sorry` only.
- **Repair.** Add, with a docstring:

  ```lean
  theorem etale_of_etaleAt_codimOne [IsIntegral X] [IsIntegral Y]
      [TauCeti.AlgebraicGeometry.IsNormalScheme X] [TauCeti.AlgebraicGeometry.IsRegular Y]
      (f : X ⟶ Y) [IsFinite f] [IsDominant f]
      (hgen : ∃ U : X.Opens, genericPoint X ∈ U ∧ Etale (U.ι ≫ f)) :
      Etale f ↔ ∀ x : X, ringKrullDim (X.presheaf.stalk x) = 1 →
        (f.stalkMap x).hom.FormallyUnramified
  ```

  Write `hgen` in this form in the README too. The README's own negative control, `𝔽_p(t^{1/p})/𝔽_p(t)`, violates `hgen`: there the right side holds vacuously and the left side is false.

## R04 (P3) — Checks carry backticked Lean names that no declaration has

- **Location.** README lines 202, 204, 208, 262, 265, 352 and 355:
  - `test_ramificationLocus_ne_nonEtaleLocus`, `test_ramificationLocus_frobenius`, `test_branchLocus_square`;
  - `test_purity_needs_regular`, `test_purity_needs_codimOne`;
  - `test_purity_branchLocus_square`, `test_purity_branchLocus_needs_regular`;

  and the cross-reference on line 344.
- **Claim.** A Check never names a Lean counterpart, and a backticked name of this roadmap's own claims a declaration in `Suggested.lean`.
- **Witness (re-grepped this round).** None of the seven names occurs in `Suggested.lean`. None is declared in Mathlib or Tau Ceti at the pins. Tau Ceti mentions five of them only in italics inside docstrings (`Examples/AlgebraicGeometry/Morphisms/RamificationLocus.lean` line 67 and following).
- **Repair.** Drop the backticked names and keep the prose, also on line 344. After R01, only the two §2.1 Checks and the second §2.3 Check stay here.

## R05 (P3) — §2.2's *Needs:* line omits what its route uses

- **Location.** README lines 276–281: "§2.1 applies at the remaining points after the codimension-one and dimension-equality inputs are supplied … *Needs:* §2.1."
- **Claim.** The route uses two inputs its *Needs:* line does not list:
  - the dimension equality that 0BMB takes as hypothesis (4). That is the §2.3 statement `ringKrullDim_stalk_eq_of_locallyQuasiFinite`, in a later section;
  - Mathlib `FormallyUnramified.stalkMap`, for the "only if" direction.
- **Witness.** `exists_etale_of_formallyUnramified_stalk_codimOne` takes `hdim : ringKrullDim (X.presheaf.stalk x) = ringKrullDim (Y.presheaf.stalk (f x))` (`Suggested.lean` line 185). §2.2's hypotheses do not include it.
- **Repair.**
  1. Change the line to: *Needs:* §2.1; Tau Ceti `Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite`; Mathlib `IsFinite`, `IsDominant`, `genericPoint`, `FormallyUnramified.stalkMap` (`AlgebraicGeometry/Morphisms/FormallyUnramified.lean` 148).
  2. Say in the sketch that a finite morphism is locally quasi-finite and locally of finite type.

## R06 (P3) — README shape: no supplier-contract, build-reading or consumer sections, and no layer-closing Examples/Dependencies

- **Location.** The README's `##` headings are on lines 41, 83, 111, 211, 228, 359, 386 and 398: Scope and ownership, Conventions, Layers 0–2, Stacks alignment, Provenance, References. Its `###` headings are 0.1–0.4, 1.1 and 2.1–2.3 only.
- **Claim.** The required shape includes the following, and the README has none of them:
  - `## Exact supplier contracts`;
  - `## How to read the build`;
  - `### Examples` and `### Dependencies` closing each layer;
  - `## Downstream consumers`.
- **Witness.** None of these headings occurs. The suppliers are a bullet list inside Scope (lines 53–78). The consumers are named nowhere as such. They include:
  - AbhyankarLemma on main;
  - CrystallineCohomology, LefschetzPencilsAndVanishingCycles and FiniteFlatGroupsAndIntegralPadicHodgeTheory, which cite §§0.1, 2.1–2.2;
  - the roadmaps of R09.
- **Repair.**
  1. Move lines 53–78 into `## Exact supplier contracts`, extended by R01's Tau Ceti list.
  2. Add a one-paragraph `## How to read the build`.
  3. Close each layer with `### Examples` and `### Dependencies`.
  4. Add `## Downstream consumers`.

## R07 (P3) — The module docstring is in the old "suggested forms" framing

- **Location.** `Suggested.lean` lines 5–10: "Purity of the branch locus: suggested forms … not exhaustive … suggest Lean forms for particular milestones … discharging all of them finishes neither a layer nor the roadmap."
- **Claim.** The file is the roadmap's acceptance test. Its docstring must:
  - be titled "…: target signatures";
  - say that the file states the headline theorems against the pins;
  - say which headlines are not statable.
- **Witness.** The form rules for `Suggested.lean`. Every headline is statable at the pins: the probe of R02 and R03 elaborates.
- **Repair.** Retitle the docstring "Purity of the branch locus: target signatures". Say that the roadmap is `README.md`. Say that this file states 0BMB in three forms, the global corollary and the two codimension-one theorems on Tau Ceti's loci, and that every headline is statable at the pins.

## R08 (P3) — The provenance path does not exist in the cited repository

- **Location.** README line 391 ("Paths are under `lean/Pcf/`."). Lines 395–396 give unqualified names with no commit.
- **Claim.** The locator into the cited formalization is wrong and is not pinned to a commit.
- **Witness (re-checked this round through the GitHub contents API, read-only).**
  - The root of `tdupu/pcfawd-formalization` holds `.github`, `LICENSE`, `README.md`, `char-p`, `char-zero`, `legacy` and `library`.
  - The path `lean` answers 404 Not Found.
  - `library/Pcf/Stacks/Purity/` exists and holds the purity files.
- **Repair.**
  1. Write "Paths are under `library/Pcf/` at commit `<sha>`", with namespace-qualified names.
  2. The 0.4/2.3 row is superseded by Tau Ceti's `RamificationLocus.lean` (R01): say so in one clause, or drop the row.

## R09 (P3) — §0.3 drops target ids that other roadmaps cite, with no old → new lines

- **Location.** README §0.3, lines 141–151. Against main, the pull request deletes these ids from §0.3:
  - `globalDimension`, `globalDimension_le_iff`, `globalDimension_le_iff_hasProjectiveDimensionLE`, `globalDimension_localization_le`;
  - `IsRegularLocalRing.free_of_isCohenMacaulay`, `IsRegularLocalRing.globalDimension_le`, `auslander_buchsbaum`;
  - `isRegularLocalRing_of_projectiveDimension_residueField`, `IsRegularLocalRing.isRegularLocalRing_localization`.
- **Claim.** These dropped ids are cited elsewhere, and the README gives no old → new mapping, so the citation on main breaks at the merge.
- **Witness (re-checked this round with `roadmaps grep`).**
  - ArtinAlgebras on main, `TauCetiRoadmap/RepresentationTheory/ArtinAlgebras/README.md` lines 73, 218–220 and 1077: `TauCetiRoadmap.PurityOfBranchLocus.globalDimension`, `…globalDimension_le_iff`, `…globalDimension_le_iff_hasProjectiveDimensionLE`.
  - AdicCoefficientsAndComparisonsPartII (open), README lines 16 and 151–153: "Consume §0.3, `IsRegularLocalRing.free_of_isCohenMacaulay` … and `auslander_buchsbaum`".
  - DeformationAndDerivedPatchingAlgebra (open), README lines 13 and 80: §0.3 as owner of global dimension.
  - EnhancedDerivedSheaves (open), README lines 157 and 814: `isRegularLocalRing_of_projectiveDimension_residueField`.
- **Repair.** Add one line per moved id to §0.3, each pointing to its pinned owner (paths under `TauCeti/`). SchemeAndStackFoundations at this head names the same declarations in its `From Tau Ceti` contract (its README lines 415–447).
  - `globalDimension` → `TauCeti.globalDimension` (`RingTheory/GlobalDimension.lean` 70);
  - `globalDimension_le_iff` (065T) → `TauCeti.globalDimension_le_tfae` (ibid. 108);
  - `globalDimension_le_iff_hasProjectiveDimensionLE` → `TauCeti.globalDimension_le_iff_hasProjectiveDimensionLE` (ibid. 90);
  - `globalDimension_localization_le` (00O8) → `Submonoid.globalDimension_localization_le` (ibid. 141);
  - `auslander_buchsbaum` (090V) → `ModuleCat.projectiveDimension_add_depth_eq_depth` (`RingTheory/Depth/AuslanderBuchsbaum.lean` 148);
  - `IsRegularLocalRing.free_of_isCohenMacaulay` (00NT) → `TauCeti.IsRegularLocalRing.free_of_isCohenMacaulay` (`RingTheory/RegularLocalRing/Free.lean` 93);
  - `IsRegularLocalRing.globalDimension_le` (00O7) → `TauCeti.IsRegularLocalRing.globalDimension_eq_ringKrullDim` (`RingTheory/RegularLocalRing/ProjectiveDimension.lean` 222);
  - `isRegularLocalRing_of_projectiveDimension_residueField` (00OC) → `TauCeti.IsRegularLocalRing.of_hasProjectiveDimensionLE` (ibid. 336; there the residue field is `Shrink (R ⧸ maximalIdeal R)`);
  - `isRegularLocalRing_localization` (0AFS) → instance `TauCeti.isRegularRing_of_isRegularLocalRing` (ibid. 441), with Mathlib's `IsRegularRing.isRegularLocalRing_localization`.

## R10 (P3) — SchemeAndStackFoundations §4.13 no longer states the regular-local-ring chain this README cites it for

- **Location.** README:
  - lines 15–17: "Serre's characterization … and its consequence that a localization of a regular local ring is regular (Stacks 0AFS) are SchemeAndStackFoundations §4.13";
  - lines 61–64;
  - §0.3, lines 141–147: "are targets of SchemeAndStackFoundations §4.13, stated there in Mathlib's projective-dimension vocabulary";
  - §2.1, lines 251 and 253–254.
- **Claim.** This pull request's revision of SchemeAndStackFoundations removed these targets from §4.13. That section now says they are at the Tau Ceti pin and restates none of them. The README therefore cites a supplier section for statements it no longer makes.
- **Witness.** SchemeAndStackFoundations README at this head:
  - lines 5461–5463 say the homological theory of regular local rings is at the Tau Ceti pin, consumed through its `From Tau Ceti` contract, and "this subsection restates none of it";
  - lines 437–439 name `TauCeti.IsRegularLocalRing.of_hasProjectiveDimensionLE`, `TauCeti.isRegularLocalRing_iff_globalDimension_lt_top` and `TauCeti.isRegularRing_of_isRegularLocalRing`.
- **Repair.** In those five places, replace "SchemeAndStackFoundations §4.13" by the pinned declarations:
  - 00OC: `TauCeti.IsRegularLocalRing.of_hasProjectiveDimensionLE` (`RingTheory/RegularLocalRing/ProjectiveDimension.lean` 336);
  - 0AFS, first sentence: `TauCeti.isRegularLocalRing_iff_globalDimension_lt_top` (ibid. 376);
  - 0AFS, second sentence and the regular-ring conclusion: the instance `TauCeti.isRegularRing_of_isRegularLocalRing` (ibid. 441), with Mathlib's field `IsRegularRing.isRegularLocalRing_localization` (`RingTheory/RegularLocalRing/Defs.lean` 94);
  - regular ⇒ normal: `TauCeti.AlgebraicGeometry.IsRegular.isNormal` (`AlgebraicGeometry/Scheme/Regular/Scheme.lean` 175).

  Keep SchemeAndStackFoundations §§0.17 and 4.13 only for `isCohenMacaulay_iff_forall_satisfiesSerreS` and `serre_normality_criterion`. Both are still targets there, at its README lines 1248 and 5493. This repair is part of R01's repair and agrees with R09's mapping.

## Previous findings

- R01 — not repaired: README lines 43–51 still say "This roadmap owns the stalk forms of 'étale at `x`' … the ramification, non-étale and branch loci … elementary étale localization … (02LK); étaleness is étale local on the source (036W)", with no Tau Ceti citation.
- R02 — not repaired: `Suggested.lean` lines 38–165 and 226–246 are unchanged. They declare the Layer 0 loci and API, `globalDimension` with four regular-local-ring theorems, and the two §2.3 auxiliaries. All of them close from the pin in this round's probe.
- R03 — not repaired: README lines 37–38 still name "`Scheme.Hom.etale_of_etaleAt_codimOne` (§2.2)" as an end theorem; `Suggested.lean` still has no such declaration.
- R04 — not repaired: README line 202, "`test_ramificationLocus_ne_nonEtaleLocus`: the closed immersion `Spec k ⟶ 𝔸¹_k`…", and the six other backticked Check names are unchanged.
- R05 — not repaired: README line 281, "*Needs:* §2.1."
- R06 — not repaired: the `##` headings are still Scope and ownership, Conventions, Layers 0–2, Stacks alignment, Provenance, References.
- R07 — not repaired: `Suggested.lean` line 5, "# Purity of the branch locus: suggested forms".
- R08 — not repaired: README line 391, "Paths are under `lean/Pcf/`."; the repository still has no `lean` directory.
- R09 — not repaired: README §0.3, lines 141–151, gives a prose pointer to SchemeAndStackFoundations §4.13 and no old → new line. The citers on main and in open pull requests are listed above.

## Verified sound

**Change since 64a16e1.**
- `git diff --stat 64a16e1 HEAD` touches 25 files, all in the 13 other folders that the brief names as this pull request's own. Nothing changes in `TauCetiRoadmap/PurityOfBranchLocus/`, `lake-manifest.json` or `lean-toolchain`.
- `git diff --stat origin/main...HEAD` with those 14 folders excluded is empty.
- The diff since 64a16e1 mentions this roadmap only in LocalPurity and SchemeAndStackFoundations. I checked both against this README:
  - LocalPurity at this head still has §2.1 (README line 689), with `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` (its `Suggested.lean` line 45: `[Module.IsTorsionFree A B]`, `2 ≤ ringKrullDim A`).
  - LocalPurity still has Convention 5, the torsion-free correction (line 116), and still names this roadmap's §2.1 as a consumer (line 851). README lines 55–57 still resolve.
  - §2.1's route meets LocalPurity's hypotheses in dimension `≥ 2`: `B` is a normal local domain finite and injective over `A`, hence torsion free. Dimension one goes through the discrete valuation ring.
  - SchemeAndStackFoundations at this head is R10.

**Gate.**
- The worker's gate at 9d475e2 passes every check, `build=0` included.
- I re-ran it standalone with `--base origin/main`. Every check is 0 except `outside-folder=26`, and those 26 files are exactly the two files of each of the 13 other folders the brief names as this pull request's own.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- My dependency check printed the line below, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 236 roadmaps, 2268 edges, 0 problem(s)
```

**Elaboration.**
- `lake env lean` on `TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean` at the pins exits 0. It gives 21 `declaration uses sorry` warnings and nothing else (lines 41, 50, 82, 90, 95, 99, 104, 109, 116, 124, 137, 146, 156, 163, 181, 198, 213, 232, 241, 253, 268).
- The worker's `signatures.md` lists 25 elaborated types with no dropped binder. The file is unchanged, so the earlier binder-by-binder comparison with the README stands.

**Probe (scratch, this round).**
- The copy of the file described in R02 elaborates with exit 0 and exactly ten `sorry` warnings:
  - lines 146 and 156;
  - the three 0BMB forms;
  - the two §2.3 codimension-one theorems;
  - the three added statements of R02 and R03.
- The four `rfl` examples pass, and the fourteen closures of R02 hold.
- Line 146 does not close by one `exact`, because Tau Ceti's 00OC lemma takes the residue field as `Shrink (R ⧸ maximalIdeal R)` (`ProjectiveDimension.lean` 336–337). It remains a restatement the README disowns (R02 (b)).

**Sources.** No passage changed, so the earlier verification of the seeded sample stands. I re-read these lines in the cache this round, and each supports the sentence that cites it:
- `stacks-0BMB` lines 2524–2533: hypotheses (1)–(5) match `Suggested.lean` lines 181–189 (§2.1).
- `stacks-025P` line 976 (§0.2).
- `stacks-02LK` line 5984 and `stacks-036W` line 3086 (§1.1).
- `sga1` lines 8359–8364, X 3.1, printed p. 212: `f` quasi-finite dominant, `X` normal, `Y` regular locally Noetherian, `Z ≠ X` ⇒ `dim 𝒪_{X,z} = 1` at the generic points of `Z` (§2.3).
- From the previous report, unchanged text: `stacks-0BMA` line 2503, `stacks-00OC` line 12552, `stacks-0AFS` lines 12566–12567 and `stacks-01TD` lines 1617–1619.
- The README flags no locator as unverified.

**Library declarations opened at the pins (this round).**
- `TauCeti/AlgebraicGeometry/Morphisms/RamificationLocus.lean`:
  - the loci at lines 104, 111 and 116;
  - lines 170, 179, 185, 189 and 197;
  - `isClosed_branchLocus` at line 217, with hypotheses `[UniversallyClosed f] [LocallyOfFiniteType f]`;
  - the `*_specMap` lemmas at lines 225, 233 and 241.
- `Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite` (`LocallyQuasiFinite.lean` 142–146).
- `StalkMap.lean` 201, 222, 363, 376 and 389.
- `TauCeti.globalDimension` and `globalDimension_le_iff_hasProjectiveDimensionLE` (`GlobalDimension.lean` 70, 90).
- In `ProjectiveDimension.lean`: `isRegularLocalRing_iff_globalDimension_lt_top` (376), `of_hasProjectiveDimensionLE` (336) and the instance `isRegularRing_of_isRegularLocalRing` (441).
- `IsRegular` (68) and `IsRegular.isNormal` (175) in `Regular/Scheme.lean`.
- `isNormalDomain_iff_of_etale` (`Etale/Normal.lean` 164).
- Mathlib `IsRegularRing` with its field `isRegularLocalRing_localization` (`RingTheory/RegularLocalRing/Defs.lean` 93–97).
- The nine files of R01's map all have zero `sorry` at the pin.

**Cross-roadmap citations resolved at this head.**
- LocalPurity §2.1 and Convention 5: as above.
- SchemeAndStackFoundations:
  - §0.17 (line 1211) with `IsLocalRing.depth` (1213) and `isCohenMacaulay_iff_forall_satisfiesSerreS` (1248);
  - §4.13 (line 5450) with `serre_normality_criterion` (5493), and `IsRegular.isNormal` named as pinned (5456);
  - the rest of the §4.13 citations is R10.
- ModularCurves on main: §4D (line 1882).
- AbhyankarLemma on main: lines 31, 363 and 375 cite §0.3 (0AFS).
- `citations.md` lists nine names found nowhere:
  - six are this roadmap's own declared names, written with the `Scheme.Hom.`/`Algebra.` prefix of Convention 6;
  - `etale_of_etaleAt_codimOne` is R03;
  - `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` is LocalPurity's (resolved);
  - `Pcf.codim_eq_one_of_algebra` is in the external provenance repository (R08).

**Ownership and overlaps.**
- `overlaps.md` names #1808 and #1854 as other open pull requests changing this roadmap.
  - #1854's copy of this README is identical to this head's.
  - #1808 carries a rewritten copy, and its conflicts with this pull request are in other folders.
  - This pull request's description orders #1808 after it.
- No dropped id is reported by the tool; R09 tracks target names, which the tool does not.
- No open roadmap owns a second ramification or branch locus of schemes; the owner is the pinned Tau Ceti (R01).
- No gaps are declared: there is no readable `design/plan.json` and no `gap:` contract.

**Remarks on untouched text:** none beyond the findings.

**Adversarial table.** Notation: `k` is a field. The "square map" is `(x, y) ↦ (u, v) = (x², y)` on `𝔸²_k` with `2 ≠ 0`. "Frobenius" is `t ↦ tᵖ` on `𝔸¹_k` in characteristic `p`. The "quotient" is `𝔸² → Spec k[x², xy, y²]`. No statement changed since 64a16e1, so every row is carried from the previous report (r42) with its computed values. The closures and the elaborations of the restated headlines were recomputed at 9d475e2 in this round's probe.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 0BMB scheme form, `Suggested.lean` 181 (r42) | `t ↦ t²` at `t = 1` and at `t = 0`; square map at origin; `Spec 𝔽_p(t^{1/p}) → Spec 𝔽_p(t)` | `t = 1`: `m_Y𝒪_X = (t−1)`, `d = 1`, étale. `t = 0`: `Ω = k[t]dt/(2t) ≠ 0`, `hunr` fails, not étale. Square map: `Ω` at `η_{V(x)}` is `≠ 0`, `hunr` false, not étale. Fields: `dim 0`, `hpos` false | agrees with stacks-0BMB 2528–2533 | none |
| 0BMB Stacks form, 198 (r42) | `𝔾_m ↪ 𝔸¹` at `t = 1`; `hqf` against 01TD | all hypotheses true, étale; `hqf` = right side of Tau Ceti `exists_appLE_quasiFiniteAt_iff` | sound | none |
| 0BMB affine form, 213 (r42) | `k[u, v] → k[x, y]`, `u ↦ x²`, `v ↦ y`; `𝔮 = (x−1, y)` vs `(x, y)` | `(x−1, y)`: heights `2 = 2`, `2x` a unit, `IsEtaleAt`. `(x, y)`: `(x) ≤ 𝔮` has `Ω_{(x)} ≠ 0`, `hunr` false, not étale | sound | none |
| §2.2 `etale_of_etaleAt_codimOne` (r42; re-elaborated this round, `Probe.lean` 300) | `𝔽_p(t^{1/p})/𝔽_p(t)`; square map; `𝟙 Y` | inseparable: `hgen` false, left false, right vacuously true. Square map: `hgen` true, left false, right false at `η_{V(x)}`. Identity: true ⇔ true | correct with `hgen`; absent from Lean | R03 |
| §2.2 route, *Needs:* (r42) | `dim 𝒪_{X,x} = dim 𝒪_{Y,f x}`, `f` finite dominant | square map: `2 = 2` at origin, `1 = 1` at `η_{V(x)}`; supplied by §2.3/Tau Ceti, not §2.1 | *Needs:* incomplete | R05 |
| `…_maximal_ramificationLocus`, 253 (r42; Tau Ceti form re-elaborated, `Probe.lean` 308) | square map; Frobenius; quotient; separable `Spec L → Spec K` | square map: `R = V(x)`, `z = η_{V(x)}`, `dim 1`. Frobenius: `R = univ`, `hne` false (without it `0 ≠ 1`). Quotient: `R = {0}`, `dim 2`, excluded by non-regular `Y`. Separable: `R = ∅`, vacuous | sound | R02 (restate on Tau Ceti's locus) |
| `…_maximal_branchLocus`, 268 (r42; Tau Ceti form re-elaborated, `Probe.lean` 316) | square map; Frobenius | square map: `B = V(u)`, `dim 𝒪_{Y,w} = 1`. Frobenius: `B = 𝔸¹`, `w = η`, `dim 0`; `hne` needed | sound | R02 |
| `ringKrullDim_stalk_eq_of_locallyQuasiFinite`, 232 (closure recomputed this round) | square map at origin and at `η_{V(x)}`; the pinned lemma | `2 = 2`; `1 = 1`; closes by `exact f.ringKrullDim_stalk_eq_of_locallyQuasiFinite x` once `IsRegular Y` | true; duplicate | R02 |
| `ramificationLocus_eq_nonEtaleLocus`, 241 (closure recomputed this round) | square map; closed immersion `Spec k → 𝔸¹` | `V(x) = V(x)`; `∅ ≠ {pt}`, excluded (not dominant); closes by `exact f.ramificationLocus_eq_nonEtaleLocus` | true; duplicate | R02 |
| §0.1, 41 and 50 (r42; closures recomputed this round) | closed immersion at `0`; Frobenius at `0`; `𝔾_m ↪ 𝔸¹` | closed immersion: unramified true/true, étale false/false (`t`-torsion). Frobenius: unramified false/false. Open immersion: true/true. Each closes by `exact Scheme.Hom.<same name> f x` | true; duplicate | R01, R02 |
| §0.4 loci and their seven API theorems, 61–127 (closures recomputed this round) | scratch probe | the three definitions are `rfl` to Tau Ceti's loci; the seven theorems close by `exact` of `…_setOf_not_exists`, `isClosed_*`, `…_subset_…`, `…_specMap` | duplicate | R01, R02 |
| §0.4 Checks (r42) | closed immersion; Frobenius; square map | closed immersion: `Ω_{k/k[t]} = 0`, `R = ∅`, non-étale `{pt}`. Frobenius: `Ω = k[t]dt`, `R = 𝔸¹`. Square map: `R = V(x)`, `B = V(u)` | correct; in Tau Ceti Examples | R01, R04 |
| §0.2 025P (r42) | `A = k[t]_(t)`, `C = A[s]/(s² − t − 1)`, `𝔮 = (t, s − 1)`; the cusp with `C = A` | `C` case: both normal (`B` a DVR). Cusp: both non-normal | true; Tau Ceti `Normal.lean` 164 | R01 |
| §0.3 0AFS, consumed (closure recomputed this round) | `k[x, y]_(x,y)` at `(x)` | `k[x, y]_(x)`: embedding dimension `1 = dim 1`, regular; `infer_instance` closes line 163 | true; duplicate; supplier now Tau Ceti | R01, R02, R10 |
| `globalDimension`, `globalDimension_le_iff_hasProjectiveDimensionLE`, 132 and 137 (recomputed this round) | probe | `globalDimension R = TauCeti.globalDimension.{u} R` by `rfl`; 137 closes by one `exact` | duplicate; cited on main by ArtinAlgebras | R02, R09 |
| §1.1 02LK, 036W (r42) | `t ↦ t²` at `0`; `k[x, y]/(xy) → k[x]` at origin; `g = 𝟙` | `t ↦ t²`: `U = S`, `V = X`, `κ(x) = κ(v) = k`. `k[x, y]/(xy)`: origin not isolated (fibre is the `y`-axis). `g = 𝟙`: étale ⇔ étale | true; in Tau Ceti | R01 |
| Convention 3, stalkwise quasi-finite (r42) | `𝔸¹ → Spec k` at `(t)`; `Spec k[t]/(t²) → Spec k` | `k[t]_(t)` not quasi-finite over `k`; `k[t]/(t²)` quasi-finite | agrees with stacks-01TD 1617–1619 | none |
| §2.1 route through LocalPurity §2.1 (this round) | `A = k[x, y]_(x,y)`, `B` = localization of `k[x, y]` at the origin over the square map; `d = 1` | square map: `B` finite over `A`, a domain, `A → B` injective, so torsion free; `2 ≤ dim A = 2`; LocalPurity's `hpunct` fails along `V(x)`, consistent with non-étaleness. `d = 1` handled by the DVR case, outside LocalPurity's `2 ≤ dim A` | consistent with LocalPurity at this head | none |

## Not verifiable

- O. Zariski (1958) and M. Nagata (1959) are cited only as the origin of the theorem, with no locator-bearing claim. I did not open them.
- I read the provenance repository only through its GitHub directory listings (R08). I did not re-read its declarations' statements.
- Ownership against open pull requests was checked through the sibling checkouts the brief gives and through `roadmaps grep`/`roadmaps show`. Nothing else was fetched.

## Source issues

- **Misprint** in sga1 at Exposé X, remark after Théorème 3.1, printed page 212 (sga1 lines 8366–8367): the source says the condition `Z ≠ X` means the finite extension `R(Z)/R(X)` is separable; it should be the extension `R(X)/R(Y)` of function fields; affects nothing.
