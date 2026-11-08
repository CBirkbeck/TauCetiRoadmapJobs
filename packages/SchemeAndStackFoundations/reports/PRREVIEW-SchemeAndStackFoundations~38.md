# Review of SchemeAndStackFoundations (pull request #1807 at 70140e6)

**Verdict:** needs changes

The folder at this head is main's text plus one change: a regular-local-ring paragraph and three Checks added to §4.13 (README.md lines 5657–5718, 5746–5753, 5762–5766, 7481–7484) and the removal of ModularCurves 0B, 0D and 9D from four `*Needs:*`/Dependencies lines (2436, 3053, 3230, 4890, 5031). `Suggested.lean` is byte-identical to main. The pins are main's (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9). The worker's gate fails on seven text rules (tex 65, sorry-data 25, sorry-examples 101, imports 1, statement-hygiene 11, dropped 39, readme-ids-missing 15); the build passes. Findings R01–R04 are the new paragraph and the pin; R05–R13 are gate rules, padding, locators and the overlap report.

## R01 (P2) — §4.13's regular-local-ring paragraph re-plans what the pinned Tau Ceti already proves

Location: README.md lines 5657–5718 ("Regular local rings: Serre's theorem and localization" through the Koszul proof sketch), the `*Needs:*` line 5746–5753 and the consumer sentence 7481–7484.

Claim: fourteen new targets (`IsRegularLocalRing.isCohenMacaulay`, `globalDimension`, `globalDimension_le_iff`, `globalDimension_le_iff_hasProjectiveDimensionLE`, `globalDimension_localization_le`, `Module.free_of_quotSMulTop_free`, `IsRegularLocalRing.free_of_isCohenMacaulay`, `exists_resolution_maximalCohenMacaulay`, `IsRegularLocalRing.globalDimension_le`, `auslander_buchsbaum`, `projectiveDimension_residueField_ge`, `projectiveDimension_residueField_le`, `isRegularLocalRing_tfae`, `isRegularLocalRing_iff_finite_globalDimension`, `IsRegularLocalRing.isRegularLocalRing_localization`, `isRegularRing_of_isRegularLocalRing`) and a Koszul proof route for 00OA.

Witness: every one exists at the Tau Ceti pin, several under the very name the paragraph proposes:
- `TauCeti/RingTheory/GlobalDimension.lean`: `globalDimension` (line 70, `WithBot ℕ∞`), `globalDimension_le_iff_hasProjectiveDimensionLE` (90), `globalDimension_le_tfae` (108, tag 065T: all modules, finite modules, cyclic modules), `Submonoid.globalDimension_localization_le` (141, tag 00O8).
- `TauCeti/RingTheory/RegularLocalRing/ProjectiveDimension.lean`: `IsRegularLocalRing.hasProjectiveDimensionLE` (195) and `globalDimension_eq_ringKrullDim` (222, tag 00O7), `of_hasProjectiveDimensionLE` (336, the residue-field converse), `isRegularLocalRing_iff_globalDimension_lt_top` (376), `isRegularLocalRing_tfae` (392, tag 00OC), `finrank_cotangentSpace_le_projectiveDimension_quotient_maximalIdeal` (415, tag 00OA), `isRegularRing_of_globalDimension_lt_top` (427), the instance `isRegularRing_of_isRegularLocalRing` (441, tag 0AFS: a regular local ring is Mathlib's `IsRegularRing`, so its prime localizations are regular), and tag 00OE.
- `TauCeti/RingTheory/Depth/AuslanderBuchsbaum.lean`: `ModuleCat.projectiveDimension_add_depth_eq_depth` (148, tag 090V, hypotheses `[Module.Finite R M] [Nontrivial M]` and `projectiveDimension M ≠ ⊤`), `projectiveDimension_quotient_maximalIdeal_le_ringKrullDim` (184, tag 00OB).
- `TauCeti/RingTheory/RegularLocalRing/Free.lean`: `free_of_isCohenMacaulay` (93, tag 00NT, with `supportDim = ringKrullDim`); `TauCeti/RingTheory/CohenMacaulay/Resolution.lean`: `exists_resolution_maximalCohenMacaulay` (116, tag 00NG); `TauCeti/RingTheory/RegularLocalRing/CohenMacaulay.lean`: `depth_eq_ringKrullDim` (110) and `isCohenMacaulay` (125).
- Mathlib `RingTheory/Regular/Free.lean` line 35: `Module.free_quotSMulTop_iff_free` already covers the "Noetherian-local form" (finite over Noetherian gives `FinitePresentation`; `maximalIdeal ≤ jacobson`), so `Module.free_of_quotSMulTop_free` is a one-line specialization.

The Needs line also cites a Mathlib name that does not exist at the pin: `projective_iff_hasProjectiveDimensionLE_zero` (line 5765 region, in the 00OA route); the pinned name is `projective_iff_hasProjectiveDimensionLT_one` (`Mathlib/RingTheory/LocalProperties/ProjectiveDimension.lean` line 52). And `IsRegularLocalRing.isCohenMacaulay` is placed in Layer 4 although §0.17's `Ring.IsCohenMacaulay.of_isRegularRing` (Layer 0, line 1158) is the statement it says it underlies; a Layer-0 item resting on a Layer-4 target inverts the build order.

Repair: delete the paragraph's targets and the Koszul route; in `## Exact supplier contracts`, under `From Tau Ceti`, cite the pinned declarations above by name and file, with their hypotheses (`[Small.{v} R]`, `Nontrivial M`, `supportDim = ringKrullDim`); rewrite the three Checks (5762–5766) as Checks of the cited declarations or delete them; make the Downstream sentence (7481–7484) say that LocalPurity §2.1, PurityOfBranchLocus §§0.3, 2.1 and AbhyankarLemma §3.3 consume these Tau Ceti declarations through this roadmap's supplier contract; drop `projective_iff_hasProjectiveDimensionLE_zero`. Nothing of this chain is left to plan here.

## R02 (P2) — Suggested.lean and the README API redeclare objects the pinned Tau Ceti provides

Location: Suggested.lean lines 57–64, 177–218, 244–317, 372–387, 550–797, 935–1016, 1035–1070, 1978–1983, 2152–2170, 2428–2467; README.md §0.17 (1138–1250), §0.30, §4.13 line 5646–5648.

Claim: these are this roadmap's own definitions ("Key definitions ... on Mathlib's schemes and Tau Ceti's carriers", docstring line 15), and README §0.17 defines depth, Cohen–Macaulay modules and rings and Serre's conditions.

Witness, at Tau Ceti 2fd255d9 (the folder's own PROGRESS.md records most of these landing between 2026-10-16 and 2026-10-25):
- `class IsNormalScheme` (`AlgebraicGeometry/Scheme/Normal.lean` 84) with `of_isOpenImmersion` (100), `isNormalScheme_iff_forall_affineOpens` (153), `isNormalScheme_Spec_iff` (181), `isIntegrallyClosed_of_isAffineOpen` (195), `isDiscreteValuationRing_stalk` (203): Suggested.lean 935–951 redeclares the class and `isDiscreteValuationRing_stalk`; four of the gate's "readme-ids-missing" names are exactly these pinned names.
- `class IsRegular` (`AlgebraicGeometry/Scheme/Regular/Scheme.lean` 68), `isRegular_Spec_iff` (166), instance `IsRegular.isNormal` (175): Suggested.lean 2181 and README 5646–5648 (`isRegular_spec_iff`, `IsRegular.isNormal`) restate them.
- `class IsThickening`, `IsFirstOrderThickening` (`AlgebraicGeometry/Morphisms/Thickening.lean` 69, 147): Suggested.lean 1978, 1983.
- `class IsModification` (`AlgebraicGeometry/Morphisms/Modification/Basic.lean` 53): Suggested.lean 2152.
- `SchemePresheaf`, `RepresentableDiagonal`, `EtaleAtlas`, `IsAlgebraicSpace` (`AlgebraicGeometry/AlgebraicSpace/Basic.lean` 68, 74, 113, 195): Suggested.lean 1035–1056.
- `cyclesOfDimension`, `RatEquivFamily` (`AlgebraicGeometry/Chow/Basic.lean` 86, 112): Suggested.lean 2428, 2442.
- `Ring.IsNagata` (`RingTheory/Nagata.lean` 65), `Ring.IsJapanese` (`RingTheory/Japanese.lean` 125), `IsGRing` (`RingTheory/RegularLocalRing/GRing.lean` 57), `GeometricallyRegular` (`.../GeometricallyRegular.lean` 70), `RegularAlgebraMap` (`.../RegularAlgebraMap.lean` 54), `regularLocus` (`.../Locus.lean` 61): Suggested.lean 244–291.
- the henselization of a pair (`RingTheory/Henselization/Neighbourhood.lean`, `Algebra.lean`, `Henselian.lean`, `Lift.lean`): Suggested.lean 177–218 (`IsNeighbourhood`, `algebra`, `henselian`, `existsUnique_lift`).
- iterated relative Frobenius and its twist isomorphisms (`AlgebraicGeometry/Frobenius/Twist.lean` 83–289, `Iterate.lean`, `UniversalHomeomorphism.lean`): Suggested.lean 686–797.
- `IsPseudoCoherentOver` (`Algebra/Module/PseudoCoherent/Basic.lean` 89): Suggested.lean 57–64.
- `IsLocalRing.depth` is Mathlib's (`RingTheory/Depth/Basic.lean` 78, `ℕ∞`, Ext definition tagged 00LI), `depth_le_supportDim` and `depth_quotSMulTop_succ_eq_depth` are Tau Ceti's (`RingTheory/Depth/Basic.lean` 341, 364), `Module.IsCohenMacaulay` and `Ring.IsCohenMacaulay` with `isCohenMacaulay_iff_of_isLocalRing`, `isCohenMacaulay_iff_forall_isMaximal`, `IsCohenMacaulay.localization`, `isCohenMacaulay_quotSMulTop_iff`, `associatedPrimes_eq_minimalPrimes` are Tau Ceti's (`RingTheory/CohenMacaulay/Basic.lean` 67, 176, 219; `Ring.lean` 40–121), `SatisfiesSerreS` is `RingTheory/SerreCondition/Basic.lean` 85, and `Scheme.IsCohenMacaulay.of_isRegular` is `AlgebraicGeometry/Scheme/CohenMacaulay.lean` 211: README §0.17 defines all of these as its own API.
- `IsGeometricallyUnibranch` (`AlgebraicGeometry/Scheme/Unibranch.lean` 54): README §0.10 defines it.

Repair: delete each redeclared definition and its API from Suggested.lean and state the headline theorems on the pinned carriers; in the README move each to `## Exact supplier contracts` (`From Tau Ceti`, exact name and file) and keep in the layers only what is absent at the pin (adic thickening systems and `Spf`, formal completion, group spaces and torsors, strict normal crossings data, the absolute integral closure, the Nisnevich site, `IsJ2`, quasi-excellent and excellent rings, formal smoothness of scheme morphisms, the relative-spectrum module equivalence). Convert the four pinned names of the gate's readme-ids list (`IsNormalScheme.isIntegrallyClosed_of_isAffineOpen`, `IsNormalScheme.of_isOpenImmersion`, `isNormalScheme_Spec_iff`, `isNormalScheme_iff_forall_affineOpens`) into Tau Ceti citations.

## R03 (P2) — AbundanceStatement is cited as a supplier but is neither on main nor citable

Location: README.md lines 440–443 (four rows of the "Other supplier contracts" table), 767, 3448, 4727, 5652, 5731, 5737, 6623, 7207 ("Supplied by AbundanceStatement §4A / items 2–4").

Claim: §5.9's characteristic-zero divisor–curve degree, §5.10's numerical Cartier quotient, finite generation and Nakai–Moishezon criterion are supplied by AbundanceStatement §§4A, 4B, 4D.

Witness: no `TauCetiRoadmap/AbundanceStatement` or `Completed/AbundanceStatement` exists on main (65770b9); the only AbundanceStatement is pull request #545 (a new roadmap by another author, in the brief's never-cite list); the gate's `dropped` rule flags all 39 occurrences. Line 440's link `../AbundanceStatement/README.md` resolves to nothing at the merge.

Repair: delete the four table rows and the nine "supplied by" sentences; state the four characteristic-zero facts §5.9–§5.10 need as targets here with their hypotheses and locators (Hartshorne or Fulton for the degree of a restricted line bundle on a curve's normalization, Kleiman for Nakai–Moishezon), or cite a roadmap on main that owns them.

## R04 (P2) — sorry'd data in Suggested.lean

Location: Suggested.lean lines 550, 653, 710, 729, 744, 1115, 1539, 1541, 1552, 1568, 1582, 1649, 2053, 2073, 2112, 2164, 2442, 2530, 2532, 2534 (the gate's 25 hits), and the structure-field sorries at 47, 78, 84, 87, 107, 120.

Claim: these `def`s and `local instance`s are the roadmap's key definitions.

Witness: `absoluteFrobenius` (550) has `map_zero'`, `map_add'` and `naturality` by `sorry`; `derivedHomPresheaf` (1582), `restrictedGluingData` (1649), `Scheme.formalCompletion` (2053), `completionFunctor` (2073), `RatEquiv` (2442) are sorry'd data on which later theorems are stated; the gate rule "no `sorry` in the body of a `def`, `abbrev`, `instance` or `opaque`" fails 25 times.

Repair: give each a real body on a pinned carrier (for Frobenius and `RatEquiv` the pinned `AlgebraicGeometry/Frobenius` and `Chow/Basic.lean` carriers of R02 already exist), or delete it and state its README target with the intended signature; every theorem mentioning a sorry'd definition goes with it or is restated on the pinned carrier.

## R05 (P3) — admitted examples

Location: Suggested.lean, 101 `example … := by sorry` lines (first at 81, 83, 85, 88, 89, 91, 94, 102, 111, 135, 159, 222–236, 267–268; the gate lists all).

Claim: Checks are carried as examples.

Witness: an admitted example tests nothing; the gate rule "every `example` is proved" fails 101 times; the README (line 284) itself promises "some Checks as `example`s".

Repair: delete every admitted example; the README's `**Checks.**` bullets keep the statements. Keep a proved example only where it tests something nontrivial about a kept definition.

## R06 (P3) — a second roadmap's module is imported

Location: Suggested.lean line 2: `import TauCetiRoadmap.AlgebraicVectorBundles.Suggested`.

Claim: the file uses AlgebraicVectorBundles' declarations.

Witness: the import rule admits `import Mathlib` and `TauCeti.*` modules only; the gate's `imports` check fails on this line; the worker's signatures step could not even elaborate the file from the content checkout because that roadmap's object file is absent there.

Repair: drop the import; state the Layer-3 degree and norm statements on Tau Ceti's `LineBundleClass`, `Scheme.Modules` and finite-locally-free carriers at the pin, or name them in the module docstring as not statable.

## R07 (P3) — statement hygiene (11 gate hits)

Location: Suggested.lean 219 (`fixed_of_henselian` concludes `Nonempty (algebra I ≃ₐ[R] R)`), 646 (`letI` in the signature of `relativeFrobenius_smooth_rank`), 1378 and 1387 (`localCohomology_degreeZero`, `localCohomology_flat_baseChange` conclude `Nonempty (… ≃ …)`), 1535 (`letI` in `DQCoh.affineEquiv`), 1898 (`letI` in `vectorBundleDegree_pullback`), 1960 (`lineBundleClass_spec_equiv_pic` concludes `Nonempty (… ≃ …)`), 2297 (`letI` in `nodal_codim_two_thickness_three_residual`), 2480–2481 (`letI` in `CH_coprod`), 2598 (`[Fintype k]` beside `[Field k]` in `weil_bound`).

Repair, as the gate names it: state the canonical map and `IsIso` of it (or name the isomorphism as data) and keep `Nonempty` only in a `nonempty_*` corollary; replace each `letI` by an instance binder or a named instance; `[Finite k]` with `Nat.card k` in `weil_bound`.

## R08 (P3) — TeX-only syntax in §0.29 (65 gate hits)

Location: README.md lines 1788, 1862, 1874–1877, 1883, 1887, 1890, 1902, 1916, 1929, 1933, 1942–1943 (`O_{V(I)}`, `F_{p²}`, `X^{(p/S)}`, `×_{S,F_S}`, `F_{X/S}`, `t^{p−1}`, `p^{d(x)}`, `F_{Spec k}^a`, `X_{k′}`, `F_{q²}`).

Repair: write the subscripts and superscripts in Unicode or put each formula in a code span, as the gate rule says; check the internal links if a heading changes.

## R09 (P3) — backticked own names that Suggested.lean does not declare (15 gate hits)

Location: README.md, the names `IsNormalScheme.isIntegrallyClosed_of_isAffineOpen`, `IsNormalScheme.of_isOpenImmersion`, `IsNormalScheme.of_isRegular`, `IsNormalScheme.test_cusp`, `codimensionOneMap.test_square`, `codimensionOneMap_comp`, `codimensionOneMap_id`, `exists_regularSystem_of_quotient.test_parabola`, `isNormalScheme_Spec_iff`, `isNormalScheme_iff_forall_affineOpens`, `isReduced_iff_R0_S1`, `isReduced_of_isReduced_stalk`, `ramificationIdxAt.test_square`, `ramificationIdxAt_eq_dvr`, `ramificationIdxAt_pos` (§0.30).

Repair: the four that exist at the Tau Ceti pin (R02) become `From Tau Ceti` citations; `IsNormalScheme.of_isRegular` cites the pinned instance `IsRegular.isNormal`; the rest are stated in prose or italics, never by adding declarations.

## R10 (P3) — padding: five declarations close by one tactic

Location: Suggested.lean 393 (`universalHomeomorphismEtaleEquivalence_functor`), 569 (`absoluteFrobenius_base`), 691 (`iteratedSchemeFrobenius_zero`), 695 (`iteratedSchemeFrobenius_succ`), 791 (`qPowerFrobenius_eq_iterated`).

Witness: on a scratch copy with every `sorry` replaced by `first | rfl | infer_instance | decide | (simp; done) | sorry`, elaborated with `lake env lean`, exactly these five lost their `sorry` warning (elaboration of the original: 229 `sorry` warnings and no other diagnostic; of the probe: 222, plus a heartbeat timeout in `RatEquiv` and its dependents, which do not count). Each restates a defining equation: the functor of `asEquivalence` (387–389), `base := 𝟙` (552), the two clauses of the recursion (686–688), the definition of `qPowerFrobenius` (785–788).

Repair: delete them from Suggested.lean; the README keeps the statements as API bullets.

## R11 (P3) — locators

- README.md 3641–3643 (§2.10, `smoothGroup_fppf_etale_comparison`): "Česnavičius 2018, §2, proof of Proposition 2.3 and Remark 2.7, Appendix A". The cached text (cesnavicius-2018, arXiv 1711.06456v4) has Proposition 2.3 at line 147 (injectivity of `H²` of a torus under a finite flat extension), only an aside at line 202 that identifies fppf and étale cohomology *with `𝔾_m` coefficients* by citing [Gro68b, 11.7], no Remark 2.7 heading, and an Appendix A (line 566) on fields of dimension ≤ 1. The comparison for an arbitrary smooth commutative group scheme is Grothendieck, *Le groupe de Brauer III*, Théorème 11.7 (Dix exposés, 1968). Repair: cite that primary source (record it in `sources.toml`; cite by locator if only a paywalled copy exists).
- README.md 885–887 (§0.10): `isUnibranch_iff_irreducible_henselization` and the strict-henselization form are both cited to "Stacks, Lemma 15.108.5". Lemma 15.108.5 (06DM, stacks line 71973) is the strict henselization statement; the henselization statement is Lemma 15.108.3 (0BQ0, line 71875). Repair: cite 0BQ0 for the first.
- README.md 1529–1530 (§0.23a): "Theorems 59.45.1–59.45.2 (04DZ)": 04DZ is Theorem 59.45.2 (line 230930); Theorem 59.45.1 is 0BTY (line 230899). Repair: give both tags.
- README.md Needs line of §4.13 (5765 region): `projective_iff_hasProjectiveDimensionLE_zero` (see R01).

## R12 (P3) — conflicting open heads with no stated order

Location: pull-request description, merge-order paragraph ("No open pull request must merge before this one. The stacked ModularCurves and SchemeAndStackFoundations move follows #1101 and this pull request.").

Witness: the overlap report lists #1276 (Scheme foundations: algebraize polarized adic systems) and #1656 (linear Noether normalization) as conflicting with #1807 in `TauCetiRoadmap/SchemeAndStackFoundations/README.md`; both revise this folder and neither is named. (#1808 and #1854 conflict only in other folders of this pull request.)

Repair: name #1276 and #1656 in the merge-order paragraph and say which is rebased on which; do not restate here what those heads already change (both convert Suggested.lean to the module form and prune it, which bears on R02, R04–R07, R10).

## R13 (P3) — consumer sentences that the consumers do not support

Location: README.md 7481–7484 and 5711–5718.

Claim: "EnhancedDerivedSheaves E1.6 consumes `isRegularLocalRing_of_projectiveDimension_residueField` and `globalDimension_le_iff_hasProjectiveDimensionLE`"; "AbhyankarLemma §3.3 consume[s] the regular-local-ring package of §4.13: Serre's theorem, the regularity of localizations ... and the regular-ring conclusion".

Witness: EnhancedDerivedSheaves on main states both as its own targets (README E1.6, line 693, "Global dimension of regular rings (`isRegularRing_projectiveDimension_le`, `isRegularLocalRing_of_projectiveDimension_residueField`)", with Stacks locators, and declares them in its Suggested.lean, lines 88 and 94); it cites nothing in §4.13 for them. AbhyankarLemma §3.3 on main (lines 363–364) takes 0AFS from PurityOfBranchLocus §0.3 and from §4.13 only normality (tag 0567). Two owners of Serre's converse (this folder and EnhancedDerivedSheaves) are what remains after R01 unless both cite the pin.

Repair: with R01, say that EnhancedDerivedSheaves E1.6 and AbhyankarLemma §3.3 use the pinned Tau Ceti declarations named in the supplier contract (AbhyankarLemma for `IsRegular.isNormal` and the regular-ring instance), and leave EnhancedDerivedSheaves' own statement to its own revision; the pull request may instead add EnhancedDerivedSheaves to its folders and repoint E1.6, in which case the sentence stands.

## Verified sound

**Scope of the change.** `git diff origin/main...HEAD -- TauCetiRoadmap/SchemeAndStackFoundations`: README.md only, +84/−9 (the §4.13 paragraph, three Checks, the Needs line, the Downstream sentence, five ModularCurves drops). No file outside the fifteen folders the brief names is changed (`git diff --stat` with the exclusions: empty). Pins: the branch and main `lake-manifest.json` both pin Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b; `.lake/packages/TauCeti` is at 2fd255d9.

**Gate and build.** The worker's gate: build=0, depcheck=0, stray-files=0, outside-folder=0, set_option=0, blob=0, latex=0, prnum=0, private-paths=0, round-labels=0, long-fences=0, layer-ids=0, target-ids=0; the seven failing rules are R04–R09 and R03. Elaboration of `Suggested.lean` with `lake env lean` from the worktree: exit 0 in 68 s, 229 `declaration uses sorry` warnings and no other warning or error. The dependency check with `--order ORDER.txt --movable --content <main>`: `depcheck: 239 roadmaps, 2432 edges, 0 problem(s)`; no UPWARD or CYCLE line (SchemeAndStackFoundations, ModularCurves, DerivedModuleAlgebra, EnhancedDerivedSheaves, LocalPurity and PurityOfBranchLocus are all main roadmaps, not in ORDER.txt; DerivedModuleAlgebra's README cites SchemeAndStackFoundations nowhere, so the new `DerivedModuleAlgebra §0.K.1` edge (its heading is at DerivedModuleAlgebra README line 516) creates no cycle).

**Consumers at this head.** PurityOfBranchLocus §0.3 (lines 139–151) and §2.1 (251–254) and LocalPurity §2.1 (262–288) now cite SchemeAndStackFoundations §4.13 for 0AFS, the regular-ring conclusion and the local Cohen–Macaulay statement, as the paragraph says; AdicCoefficientsAndComparisonsPartII (#1796, lines 16, 153) and DeformationAndDerivedPatchingAlgebra (#1034, §3.1 line 564, §3.2) cite PurityOfBranchLocus §0.3's `auslander_buchsbaum`, `IsRegularLocalRing.free_of_isCohenMacaulay`, `IsRegularLocalRing.globalDimension_le` and `isRegularLocalRing_tfae`; the paragraph keeps those names, so those citations still resolve through §0.3 (and, after R01, through the pin).

**Overlaps.** Ids this README cites that an open pull request drops: none; ids only an open revision defines: none; ids this pull request drops that others cite: none (the removed ModularCurves 0B/0D/9D citations are consumptions, not ids of this roadmap; the remaining ModularCurves 0C, 0E and 4D citations resolve on main). Closest open roadmaps by vocabulary (AdicCoefficientsAndComparisonsPartII, PurityForFlatCohomology, AlgebraicModuliForArithmeticGeometry and Part II, EtaleDualityAndPerverseSheavesPartII): none owns the regular-local-ring chain; PurityForFlatCohomology and DirectSummandsAndBigCohenMacaulay (#1735, line 407) consume Auslander–Buchsbaum from DeformationAndDerivedPatchingAlgebra §3.1, which consumes it from PurityOfBranchLocus §0.3.

**Seeded sample (every locator opened at the cached text; `stacks` is the cached Stacks book, line numbers of its text).**
- 0.2: 01LX Lemma 27.4.6 (line 110708: relative Spec affine, `A → π_* O` iso), 01T2 29.15.2 (116559), 01TQ 29.22.2 (117170), 01S7 29.11.2 (116133, affine ⇒ separated and quasi-compact), 02K8 29.45.2 (120222), 01WI 29.45.3 (120234), 01QO 29.2.1 (115389), 01SB 29.11.7 (116222: quasi-coherent modules on an affine morphism ↔ quasi-coherent `A`-modules). `CommMon.relativeSpec` exists at the Tau Ceti pin (14 files).
- 0.10: 0BPZ Definition 15.108.1 (71813, unibranch and geometrically unibranch as stated), 03RV Lemma 59.64.4 (232536: finite locally constant ↔ `h_U` for finite étale `U → X`), 04MF Lemma 5.9.6 (6987: locally Noetherian ⇒ locally connected); Couveignes 2019 Theorem 1 (couveignes-2019 line 18, page 1) and Proposition 2 (line 251, page 7: the Jacobian-localized scheme is smooth, zero-dimensional and contains `Spec K` as a component, with the stated bounds); Česnavičius 2020 Lemma 5.1 (cesnavicius-2020 line 696: Noetherian semilocal, geometrically unibranch localizations). Lemma 15.108.5 is R11.
- 0.11: 02KH Lemma 30.5.2 flat base change (123108), 02L5 35.23.20 (144035), 02L7 35.23.22 (144068), 02KU 35.23.6 (143889), 02KZ 35.23.14 (143987), 02L1 35.23.16 (143993), 02VL 35.23.29 (144130), 02VN 35.23.31 (144143), 02V5 29.36.10 (118762), 02G7 29.36.11 (118766), 02G8 29.36.12 (118783), 02GE 29.36.13 (118797), 02GF 29.36.14 (118807, with the "locally of finite type" hypothesis the README carries); BMPSTWW 2020 Convention 4.1 (bmpstww-2020 line 1547, page 35: `X⁺` as the limit over finite integral covers inside a fixed algebraic closure of `K(X)`).
- 0.23a: 04DZ Theorem 59.45.2 (230930: integral, universally injective, surjective ⇒ `V ↦ V ×_Y X` is an equivalence of étale schemes), section 04DY (230894). Pinned names `Scheme.Etale`, `smallEtaleTopology`, `smallEtalePretopology` (`AlgebraicGeometry/Sites/Etale.lean` 55), `MorphismProperty.Over.pullback`, `CoverPreserving` all exist.
- 1.1: 01BG Lemma 17.10.4 (78247), 023T Proposition 35.5.2 (142123: fpqc descent of quasi-coherent sheaves effective, functor fully faithful), 04TQ/04TR/04TS Lemmas 7.26.1/4/5 (14069, 14152, 14189). `fpqcTopology`, `IsStack`, `DescentData`, `ModuleCat.Descent` exist at the pin.
- 1.12: 02Z1 Example 65.14.1 (252806, characteristic ≠ 2), 071S Lemma 66.34.1 (256130: free action of an abstract group ⇒ quotient sheaf is an algebraic space), 02Z7 Example 65.14.8 (252943, characteristic zero; the README takes ℚ), 0AHR Lemma 66.3.3 (253396).
- 1.13: 043H Definition 78.5.1 (287788), 043Q Definition 78.8.1 (287916), Definition 78.8.2 = 06P8 (287949), 06P9 Lemma 78.8.3 (287953: free iff `(a, pr₂)` is a monomorphism). `GrpObj`, `ModObj`, `Over.cartesianMonoidalCategory`, Tau Ceti `ConstantGroup.groupScheme` exist at the pins.
- 1.16: Poonen 2017 Theorem 4.5.2 (poonen-2017 line 4551: twists ↔ `H¹(G, Aut X_{k'})`), §5.12.5.2 (6494, contracted products), §6.5.6.4 (7555, subtraction of torsors, `Z ×^G T⁻¹` a `G^τ`-torsor).
- 2.4: sections 071J (92183) and 03AG (92220), 0CJZ Lemma 21.11.1 (92794, gerbe with abelian automorphism sheaves). `Sheaf.H.δ` (`Sites/SheafCohomology/ExactSequences.lean` 60), `longSequence_exact₃` (138), `HasSheafify` exist.
- 2.10: section 0DDK (238108), 03DW Proposition 35.9.3 (142651: `H^q(S, F) = H^q((Sch/S)_τ, F^a)` for all five topologies). Česnavičius 2018 is R11.
- 2.11: 03P8 Theorem 59.24.1 (229140: `H¹_τ(X, 𝔾_m) = Pic X` for fppf, syntomic, smooth, étale, Zariski), 040N Lemma 59.28.3 (229322, fppf and syntomic), 040O Remark 59.28.4 (229344), 040Q Lemma 59.28.5 (229385), 03PL Lemma 59.28.1 (229288), section 0A3J (232346), 0A3K Lemma 59.63.1 (232352: affine ⇒ vanishing for `q ≥ 2`; qcqs of dimension `d` ⇒ for `q ≥ 2 + d`), section 03QN (231713), 59.55.1 = 03QO (231715), 59.55.2 = 03QP (231733), 59.55.3 = 0959, 59.55.4 = 0EYP.
- 2.16: section 0A2M (232770), Proposition 59.67.4 = 03R8, Definition 59.67.5 = 03R9, Theorem 59.67.8 = 03RC (`C₁ ⇒ Br = 0`), Theorem 59.67.10 = 03RD (Tsen), Lemmas 59.67.11–12 = 03RF, 03RG; section 03RH (232955), Theorem 59.68.1 = 03RI, Lemmas 59.68.2 = 03RJ, 59.68.4 = 03RL, Theorem 59.68.5 = 03RM (233016: `H^q(X, 𝔾_m) = 0` for `q ≥ 2`); 0DHM Lemma 85.36.4 (301947, proper hypercovering, `D⁺`) and 0DHP Lemma 85.36.6 (301963, ph hypercovering, spectral sequence); a proper hypercovering is a ph hypercovering.
- 2.17: Bhatt–Scholze 2014 (bhatt-scholze-2014, arXiv 1309.1198v2): Definition 3.1.1 (line 701, page 16), Proposition 3.2.3 (798, page 18; (1) replete, (2) `D(X)` compactly generated), Proposition 4.2.8 (1361, page 29), Proposition 3.3.3 (852, page 19), Proposition 3.1.10 (755, page 17), Definition 2.4.1 (604, page 13), Lemma 2.4.9 (652, page 14), Theorem 1.5 (98, page 3). `ProEt.topology` exists at the pin (`AlgebraicGeometry/Sites/ElladicCohomology.lean`).
- 4.7: 07E8 Definition 15.37.1 (61480), 0AIF Definition 87.9.9 (304390), 0AID Definition 87.9.7 (304357). `IsAdicComplete`, `AdicCompletion.of_bijective` (`RingTheory/AdicCompletion/Basic.lean` 670) exist.
- 4.8: 0AIZ Lemma 87.14.2 (304815), 0AMC Definition 87.14.3 (304827), 0GBA Lemma 87.14.6 (304861: (2) `X_{/T} = Spf(A^∧)` for `T = V(I)`, `I` finitely generated; (3) Noetherian), 087X Lemma 30.23.2 (125534: `Coh(X, I)` abelian for Noetherian `X`), 0881 Lemma 30.23.4 (125585), 087W Lemma 30.23.1 (125514: Noetherian `A`, `Coh(X, I) ≃` finite `A^∧`-modules). `AdicCompletion.map_exact` (`Exactness.lean` 183), `flat_of_isNoetherian` (`AsTensorProduct.lean` 378), `IdealSheafData.subscheme`, `SheafOfModules.IsFinitePresentation` exist.

**§4.13 (the new text) against the Stacks book.** 00O6 Definition 10.109.10 (33106), 065T Lemma 10.109.12 (33146), 00O8 Lemma 10.109.13 (33159), 00NS Lemma 10.106.5 (32640: `x ∈ 𝔪` a nonzerodivisor on `M`, `M/xM` free over `R/xR` ⇒ `M` free), 00NT Lemma 10.106.6 (32649), 00NG Lemma 10.104.9 (32494: `R` Cohen–Macaulay of dimension `d`, `M` of depth `e`, `0 → K → F_{d−e−1} → ⋯ → F₀ → M → 0` with `K` maximal Cohen–Macaulay), 00O7 Proposition 10.110.1 (33176), 090V Proposition 10.111.1 (33303, nonzero finite `M` of finite projective dimension), 00OA Lemma 10.110.3 (33192), 00OB Lemma 10.110.4 (33241), 00OC Proposition 10.110.5 (33250), 0AFS Lemma 10.110.6 (33264, both sentences), 0CXF Lemma 10.109.7 (33069, condition (7)), 00MT Lemma 10.102.2 (32151), 00LS Lemma 10.71.4 (28570), 00OE Lemma 10.110.8 (33280), 00NQ Lemma 10.106.3 (32619). Every locator is right; the Koszul route of 00OA restates the Stacks proof. The paragraph is sound mathematics that the pin already contains (R01).

**Adversarial table.** Values computed on each side; rows for the seeded targets, the §4.13 statements and the Checks they touch.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §4.13 `globalDimension` = sup of `projectiveDimension` | a field `k`; the zero module | every `k`-module free, pd 0; pd 0 = ⊥; sup = 0 | Check `globalDimension_test_field` holds; pin `globalDimension_eq_zero_of_isSemisimpleRing` | cite pin (R01) |
| `isRegularLocalRing_iff_finite_globalDimension` | `k[ε]/ε²` | `𝔪 = (ε)`, spanFinrank 1, dim 0 ⇒ not regular; minimal resolution of `k` is `⋯ →ε R →ε R → k`, pd ∞ | both sides false, iff holds; pin `regularLocus_trivSqZeroExt_eq_empty` | cite pin |
| | DVR `O`, `π` | regular of dim 1; `0 → O →π O → k`, pd κ = 1 < ∞ | both true | none |
| `auslander_buchsbaum` | `M = O` over a DVR; `M = k`; `M = k` over a field; `M = 0` | 0 + 1 = 1; 1 + 0 = 1; 0 + 0 = 0; pd ⊥, depth ⊤: excluded by "nonzero" | holds; pin has `[Nontrivial M]` | cite pin |
| `projectiveDimension_residueField_ge` | `k[ε]`; DVR; field | dim 𝔪/𝔪² = 1 ≤ ∞; 1 ≤ 1; 0 ≤ 0 | holds | cite pin (00OA at `LocalRing/ProjectiveDimension.lean` 237) |
| `projectiveDimension_residueField_le` | DVR; `k[ε]` | n = 1 ≤ dim 1; hypothesis fails (pd ∞) | holds | cite pin (00OB) |
| `IsRegularLocalRing.globalDimension_le` (length `d − e`) | `M = κ` over `R` regular of dim `d`; `M = R`; `M = 0` | Koszul resolution length `d`, depth 0, `d − 0 = d`; length 0, depth `d`, `d − d = 0`; depth ⊤, truncated `d − ⊤ = 0`, zero resolution | holds, junk value harmless | cite pin |
| `exists_resolution_maximalCohenMacaulay` | `R = k[[x,y]]`, `M = k` | `d = 2, e = 0`: `0 → K → F₁ → F₀ → k → 0` with `K = R` (second Koszul syzygy), maximal CM | holds; `R` Cohen–Macaulay is needed and supplied | cite pin |
| `Module.free_of_quotSMulTop_free` | `O` DVR, `M = O`, `x = π`; `M = k`, `x = π` | `O/π = k` free over `k` ⇒ `O` free; `π` not `k`-regular: hypothesis fails although `k/πk = k` is free and `k` is not `O`-free | regularity hypothesis is necessary; Mathlib's lemma has it | cite Mathlib |
| `IsRegularLocalRing.free_of_isCohenMacaulay` | `R = k[[x,y]]`, `M = R/(y)`; `M = R` | `M` CM of depth 1 ≠ dim 2, not free; `R` free | "maximal" (supportDim = dim) is necessary; pin carries it | cite pin |
| `IsRegularLocalRing.isCohenMacaulay` | field; DVR; `k[ε]` | depth 0 = dim 0; depth 1 = dim 1; `k[ε]` is CM (depth 0 = dim 0) and not regular | converse false, direction right; pin `TauCeti.IsRegularLocalRing.isCohenMacaulay` | cite pin |
| `isRegularLocalRing_localization_test_plane` | `k[x,y]_{(x,y)}` at `(x)`; at `(0)` | `k[x,y]_{(x)}`, DVR, regular of dim 1; `k(x,y)`, field | holds | cite pin instance |
| 0.2 relative Spec | `A = O_S`; `A = 0`; `A = O_S[t]` | `Spec_S O_S = S`, identity; empty scheme, affine over `S`; `𝔸¹_S`, finite type not finite | the five equivalences hold | none |
| 0.10 unibranch Checks | node `y² = x²(x+1)`, char ≠ 2; cusp; `ℝ[x,y]/(x²+y²)`; field | normalization `k[t]`, `x = t²−1`: two points `t = ±1` over the origin; `k[t]`, one point, residue `k`; `ℂ[t]`, one point, residue `ℂ/ℝ` separable; trivially | not unibranch; geometrically unibranch; unibranch not geometrically; geometrically unibranch | none |
| 0.10 `unibranch_finite_components` | `X = ∅`; eventually constant sequences in `𝔽₂^ℕ` | no components; stalks `𝔽₂`, `{m_∞}` a closed non-open component, `i` not étale | hypothesis "locally Noetherian" necessary (negative control holds) | none |
| 0.11 `field_extension_descent` | `Spec k[t]`; infinitely many points, `k'` infinite-dimensional | `k'[t] = k[t] ⊗ k'`; `∏ k' ≠ (∏ k) ⊗ k'` | qcqs hypothesis necessary | none |
| 0.11 `unramified_criteria` | `Spec 𝔽_p(t^{1/p}) → Spec 𝔽_p(t)`; `Spec k ⊔ Spec k → Spec k` | `Ω ≠ 0`, inseparable fibre: not unramified; diagonal open immersion, fibres separable | holds | none |
| 0.23a Checks | `Spec 𝔽_{p²} → Spec 𝔽_p`; cusp normalization; node normalization; nil thickening | self-product two points: not universally injective; integral, bijective, radicial: universal homeomorphism; two points over the node; universal homeomorphism | the four Checks agree with 04DZ's hypotheses | none |
| 1.1 Checks | `Spec R → Spec S` faithfully flat; `QCoh(T)`, `T ≠ ∅` | descent data = comodules; `0 : O → O` not an isomorphism | holds | none |
| 1.12 | folded line in char 2; `𝔸¹_{𝔽_p}/ℤ` | `x ↦ −x` is the identity, no example; `p·ℤ` acts trivially, action not free | char ≠ 2 and char 0 hypotheses necessary; README uses ℚ | none |
| 1.13 `Action.IsFree`, `free_iff_mono` | `G` on itself by translation; `𝔾_m` on `𝔸¹`; trivial group | `(g·x, x) = (x, x) ⇒ g = 1`; `c·0 = 0` for all `c`; unique action | holds | none |
| 1.16 contracted product | `G ×^G X`; `Spec L ×^{ℤ/2} Spec L`, `L/K` quadratic | `≅ X`; `L ⊗_K L ≅ L × L` with the diagonal action acting on each factor, quotient `Spec K ⊔ Spec K`; presheaf quotient has no `K`-point since `P(K) = ∅` | Checks hold | none |
| 1.16 `test_line_bundle` sign | `L = O(1)` on `ℙ¹`, `g·φ = φ∘g⁻¹` | frame torsor twisted by scaling gives `L`, degree +1 (the inverse convention gives −1) | convention pinned by a witness | none |
| 2.4 boundary | trivial torsor; split epi `X₂ → X₃` | `δ(1) = 0`; `H¹(X₂) → H¹(X₃)` onto, `δ = 0` | holds | none |
| 2.10 Checks | `Spec ℝ`, `μ₂`; `Spec 𝔽_p[t,t⁻¹]`, `μ_p` | `H¹_Zar = 0`, `H¹_ét = ℝ^×/ℝ^{×2} = ℤ/2`; `H¹_fppf = (𝔽_p^× × t^ℤ)/p = ℤ/p` (Pic = 0, `p ∤ p−1`), étale `μ_p` zero sheaf on reduced schemes (`x^p = 1 ⇒ (x−1)^p = 0`) so `H¹_ét = 0` | holds | locator R11 |
| 2.11 Kummer, Artin–Schreier | `n = 1`; `Spec 𝔽_p(t)`, `n = p`; `H¹(Spec k, ℤ/p)` | `μ₁ = 0`; fppf `K^×/K^{×p} ∋ t ≠ 1`, étale `0`; `k/(x^p − x)k` | holds; `H^q = 0` for `q ≥ 2` affine and `q ≥ d+2` qcqs agree with 0A3K | none |
| 2.16 | `𝔸¹_{k̄}`; `ℙ¹_{k̄}`; nodal cubic | `Pic = 0`, `H^q(𝔾_m) = 0` for `q ≥ 1`; `H¹ = ℤ`, `H² = 0`; descent from `ℙ¹` and the two preimages gives `H¹(C, ℤ/n) = ℤ/n` since `H¹(ℙ¹_{k̄}, ℤ/n) = 0` | holds | none |
| 2.17 replete | Types; `Sh((Spec ℚ)_ét)`, tower `μ_{ℓ^{n+1}} → μ_{ℓ^n}` | surjections closed under sequential limits; limit sections over any finite étale `U` are compatible `ℓ`-power roots of unity in a number field, `0`, legs zero, not epi | holds | none |
| 2.17 w-contractible | `Spec k̄`; `Spec ℚ` | ind-étale faithfully flat `k̄ → B` has `B ≠ 0` a filtered colimit of products of `k̄`, a point gives a section; `ℚ → ℚ̄` has no section | holds | none |
| 4.7 adic systems | cubic tower; `Spf ℤ_p`; `Spec k[[t]]`; `End ℤ_p`; `k[[s,t]] → k[[s]]`; `k[[t]]`, `(t)` vs `(t²)` | `ker ι₁ = 0 ≠ (t²) = (ker(X₀→X₂))²`; one point; two points; identity only (ℤ dense); `(s)` not an ideal of definition; `(t)² ⊆ (t²)` but `(t) ⊄ (t²)` | all Checks hold | none |
| 4.8 completion | `k[[t]]`, `·t`; `𝔸¹_k` at 0; `I = ⊥`, `I = ⊤`; `k[x₀,x₁,…]`, `A/(x₀,x₁,…)`; `ℤ/p^m`; `k[x] → k[[x]]` | injective but zero mod `t`; `k[t]/t^{n+1}`; constant system, empty system; cyclic, kernel not finitely generated; `p^m = 0` so complete; `1/(1−x) ∉ k[x]`, not full | all Checks hold; termwise exactness correctly denied | none |

**Lean form.** `#check @name` comparison was not run for the 104 theorems because R02 and R04 replace most of their carriers; the elaboration itself showed every signature type-checks at the pin. In-statement `sorry` in structure fields (lines 47, 78, 84, 87, 107, 120) are counted under R04.

**Ownership against open pull requests** was checked for the regular-local-ring chain (DeformationAndDerivedPatchingAlgebra #1034, DirectSummandsAndBigCohenMacaulay #1735, AdicCoefficientsAndComparisonsPartII #1796, PurityForFlatCohomology #1840, EnhancedDerivedSheaves on main) with the result in R13 and Verified sound; it was not checked for the rest of main's text.

## Not verifiable

- Poonen 2017 was read from the author's pre-publication copy (poonen-2017, licence class author-page); its numbering matched the three locators, so the published GSM 186 numbering was not separately checked.
- Abramovich–Olsson–Vistoli 2008, Česnavičius 2021, de Jong 1996, Kleiman, Fulton, Liu, Grothendieck's Tôhoku and Brauer III, and the other works the README cites outside the seeded sample were not opened in this round.
- Grothendieck, *Le groupe de Brauer III*, Théorème 11.7 (the primary source R11 asks for) was not fetched; the roadmap's manifest has no key for it.

## Source issues

- none
