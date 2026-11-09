# Review of SchemeAndStackFoundations (pull request #1808 at dc47c7e)

**Verdict:** needs changes

Scope: `TauCetiRoadmap/SchemeAndStackFoundations/README.md` (7796 lines) and `Suggested.lean` (2808 lines) at `dc47c7e`. Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. Against main, this pull request changes the folder by +561/−69. The changes are the new §0.3a (relative Grassmannian), the new §0.12a (strict henselization: 23 declarations moved from ModularCurves), `Formal.ArtinianTestAlgebra` (§4.2) and supplier-text edits. The gate fails on nine rules. Findings are ordered by severity.

## R01 (P1) — the acceptance test imports another roadmap's module and states theorems on its `sorry`'d `rank` and `determinantObj`

- **Location.** `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean`:
  - line 2: `import TauCetiRoadmap.AlgebraicVectorBundles.Suggested`;
  - lines 2042–2043: `abbrev isFiniteLocallyFreeOfRank … := TauCetiRoadmap.AlgebraicVectorBundles.isFiniteLocallyFreeOfRank X r E`;
  - used as hypotheses at lines 2054 and 2066 (`vectorBundleDegree_add_of_shortExact`, `vectorBundleDegree_pullback`);
  - lines 2758–2762: `K0.det` is built from `AlgebraicVectorBundles.determinantObj`.
- **Claim.** The hypothesis `isFiniteLocallyFreeOfRank E r` unfolds to `rank ⟨E, h⟩ = const r`, where `rank` is `sorry`. No proof can extract anything from it, so the two degree theorems cannot be proved as stated. `K0.det` and `K0.toG0_not_injective_of_det` mention `sorry`'d data. The import itself fails the gate's `imports` rule: only `import Mathlib` and `TauCeti.*` modules are allowed.
- **Witness.** `TauCetiRoadmap/AlgebraicVectorBundles/Suggested.lean` lines 167–169 read `noncomputable def rank … : LocallyConstant X ℕ := by sorry`, and `determinantObj … := by sorry` is in the same file. Instance: `vectorBundleDegree_pullback` with `X = Y`, `f = 𝟙`, `E = O_X`, `r = 1` cannot be used, because `hE : rank ⟨O_X, _⟩ = const 1` is unprovable.
- **Repair.**
  - Drop the import.
  - State constant rank with a real body on Mathlib carriers: `∀ x, ∃ U : X.Opens, x ∈ U ∧ Nonempty (E.restrict U.ι ≅ SheafOfModules.free (R := U.toScheme.ringCatSheaf) (ULift (Fin r)))`. This is the pattern of `IsPseudoCoherentSheaf`, lines 67–73, which elaborates in this file.
  - Remove `K0`, `K0.det`, `K0.toG0`, `finiteLocallyFreeExact` and their theorems from `Suggested.lean`. They need the owner's carriers, so they stay README targets of §5.7.
  - Update the README's supplier paragraph (lines 402–405, "`Suggested.lean` imports the owner module …").

## R02 (P2) — `Suggested.lean` and the README re-plan objects the pinned Tau Ceti already proves, including the two strands this pull request adds

- **Location.**
  - `Suggested.lean`:
    - strands: `Henselization` (175–241), `StrictHenselization` (254–409), `Ring.IsJapanese`/`IsNagata` (413–435), `Excellence.IsGRing` and `IsCatenary` (462, 479), `FlatAnnihilator` (661–672), `SchemeFrobenius` (697–1095) and `NormalSchemes` (1099–1193);
    - single declarations: `SchemePresheaf`, `SchPseudofunctor` and `Spaces.RepresentableDiagonal`/`EtaleAtlas` (1206–1229), `Proetale.IsReplete` (1673), `Formal.IsThickening`/`IsFirstOrderThickening` (2149–2155) and `Chow.cyclesOfDimension`/`RatEquiv`/`ChowGroup`/`cycleClass` (2624–2666).
  - README §0.3a, lines 598–603: "Mathlib supplies … nothing else: neither the scheme, nor its charts, nor representability. Construct the affine charts …".
- **Claim.** Each of these objects exists, with real data and `sorry`-free proofs, at the Tau Ceti pin. The README cites none of them. It names §0.12 under "Owned here for others" (line 234) and plans §0.3a's charts, gluing and points from scratch. What exists at the pins is cited, not restated.
- **Witness.** Files and lines at the pinned Tau Ceti; `grep sorry` over all of these files returns nothing.
  - `RingTheory/Henselization/Lift.lean:130 existsUnique_lift`, `:142 algEquivOfHenselianRing`; `Henselization/Henselian.lean:154 instance henselian`.
  - `RingTheory/StrictHenselization/Lift.lean:166 existsUnique_lift`, `:203 exists_isLocalHom_lift`; `StrictHenselization/Etale.lean:111 existsUnique_algHom_of_etale`; `StrictHenselization/MaximalIdeal.lean:80`.
  - `AlgebraicGeometry/Frobenius/Relative.lean:84 relativeFrobenius`; `Frobenius/Smooth.lean:97 finrank_relativeFrobenius_of_smoothOfRelativeDimension`; `Frobenius/Etale.lean:107`; `Frobenius/Twist.lean:116`; `Frobenius/FiniteField.lean:44`.
  - `AlgebraicGeometry/Grassmannian/Basic.lean:189 chartι`, `:224 transition_chartι`; `Grassmannian/Points.lean schemeHomEquiv`; `Grassmannian/Proper.lean:132`.
  - `RingTheory/Flat/Annihilator.lean:67,82`; `RingTheory/Japanese.lean:125`; `RingTheory/Nagata.lean:65`; `RingTheory/Catenary.lean:56`; `RingTheory/RegularLocalRing/GRing.lean:57`; `RingTheory/RegularLocalRing/Quotient.lean` (`exists_regularSystem_of_quotient`).
  - `CategoryTheory/Limits/Replete.lean:91`.
  - `AlgebraicGeometry/Scheme/Normal.lean:84`; `Morphisms/CodimensionOne/Basic.lean:91`; `Morphisms/RamificationIdx/Basic.lean:74`.
  - `Morphisms/Thickening.lean:69,147`; `AlgebraicSpace/Basic.lean:68,74,113`; `Stack/Basic.lean:37`; `Chow/Basic.lean:86,257,295`.
- **Repair.**
  - Delete these declarations from `Suggested.lean`, with the Checks attached to them.
  - In the README, move each object to "Already stated or built elsewhere" and to `From Tau Ceti`, with its full name and file. Keep as targets only what the pin lacks:
    - §0.12a: `isSepClosed_residueField`, `isNoetherianRing_algebra_iff` with the 06LJ completion clauses, and `localization_equiv`;
    - §0.29: the coherent-twist statements absent from `TauCeti/AlgebraicGeometry/Frobenius/*`;
    - §0.3a: the globalisation over a non-affine base and the rank-one and Plücker comparisons, citing `Module.Grassmannian.scheme`, `chartι` and `schemeHomEquiv` for the affine case.
  - Correct line 234 ("Owned here for others: Henselization of pairs").
  - Tested on one instance: `FlatAnnihilator.annihilator_flat_baseChange` is literally `(TauCeti.annihilator_flat_baseChange).symm`. The two statements read side by side are the same equation reversed; that module's object file is not built in this worktree.

## R03 (P2) — `sorry` in the bodies of definitions and instances (gate `sorry-data`, 25 hits)

- **Location.** `Suggested.lean` lines 721, 824, 881, 900, 915, 1286, 1710, 1712, 1723, 1739, 1753, 1820, 2249, 2269, 2308, 2360, 2638, 2726, 2728, 2730, 2732, 2738, 2745, 2758 and 2765. Example, line 729: `map_zero' := by sorry   map_add' := by sorry } naturality := by sorry } prop := by sorry }`.
- **Claim.** The principles forbid `sorry` in a `def`, `abbrev`, `instance` or `opaque`. In every hit the data is specified and the `sorry` discharges a proof field: ring-hom laws, pullback conditions, `hom_inv_id`, subgroup closure, `map_conflation`, or a `Prop`-valued local instance. The statements are therefore meaningful, but the rule is blocking.
- **Witness.** The gate's `sorry-data` list, re-run on this head: 25 entries, identical to the worker's.
- **Repair.**
  - R02 removes the Frobenius (721–915), `NormalSchemes` and `Chow.RatEquiv` (2638) hits, since the pinned versions are proved; R01 removes 2745–2765.
  - For the rest (§2.18's `derivedRestrict*`, `derivedHomPresheaf`, `restrictedGluingData` and local instances; §4.7–§4.10's `formalCompletion`, `completionFunctor`, `levelIncl`; `smallEtale_compose`; `IsAlteration.functionFieldMap`; `finitelyPresentedExact`), either discharge the proof fields or move the definition, and every theorem mentioning it, to the README as a target with its intended signature.

## R04 (P2) — AbundanceStatement and CommRingFactorizationSystems are cited as suppliers; both are on the do-not-cite list and neither is on main

- **Location.** README:
  - AbundanceStatement: lines 431–434 (four supplier-table rows), 821–824, 3634, 4913, 5845, 5934, 5940, 6836, 7420–7540 and 7656.
  - CommRingFactorizationSystems: lines 1627 and 1631. Line 1627 reads "CommRingFactorizationSystems F2 / `CommRingCat.WeakNormalization.univHomeo` (by JakobScholbach) supplies the affine criterion."
- **Claim.** These roadmaps may not be cited as suppliers. Both are other authors' open pull requests (#545 and #453), not roadmaps on main. The characteristic-zero surface inputs of §§5.9–5.10 and the affine universal-homeomorphism criterion of §0.23 therefore have no permitted owner.
- **Witness.** The gate's `dropped` rule, 39 hits. `roadmaps list`: "#545 AbundanceStatement (new) @RoktimMascharak" and "#453 CommRingFactorizationSystems (new)". The content repository's main has neither folder.
- **Repair.**
  - Delete the four AbundanceStatement rows and the `*_abundanceComparison` and `*_abundanceSpecialization` targets. §5.10 already owns the characteristic-free carrier `Chow.NumericallyEquivalent` and the positive-characteristic Nakai–Moishezon criterion (lines 432–434). State the characteristic-zero cases as specialisations proved here.
  - In §0.23, state the affine criterion "integral, universally injective and surjective ⇔ universal homeomorphism" for ring maps as a target here, under Stacks Lemma 29.46.5 (04DF), already cited at line 1626.

## R05 (P3) — the module docstring does not account for the headline theorems

- **Location.** `Suggested.lean` lines 14–22: "Key definitions and headline theorems of the roadmap … ModularCurves consumes them."
- **Claim.** The README Summary (lines 16–23) names these end theorems:
  - henselization of a pair (§0.12);
  - Artin's bootstrap and Keel–Mori (Layer 1);
  - Grothendieck duality and the Brauer class of an Azumaya algebra (Layer 2);
  - Picard torsors of a curve without a rational point (Layer 3);
  - Schlessinger's theorem, Grothendieck existence, algebraization and de Jong (Layer 4);
  - GRR, the Hodge index theorem and the Weil bound (Layer 5).

  Seven are not stated: Keel–Mori, duality, the Brauer class map, Picard torsors, Schlessinger, GRR and Hodge index. The docstring names none of them or the carrier each lacks. It also lacks the required form: "<title>: target signatures", and the statement that README.md is the roadmap.
- **Witness.**
  - At the pins there is no ample-line-bundle predicate, no Artinian coefficient category and no étale `𝔾_m` Brauer group. `grep 'class IsAmple|Schlessinger|ArtinLocal'` over Mathlib and Tau Ceti finds nothing.
  - The henselization headline stated here is already a theorem at the pin (R02).
- **Repair.** Rewrite the docstring in the required form. Name each unstated headline with the missing carrier (ampleness; the Artinian category `C_Λ`; `Br(X)` as torsion in `H²_ét(X, 𝔾_m)`; the Picard functor; the Chern character and Todd class; algebraic stacks and coarse spaces). Drop the consumer sentence.

## R06 (P3) — 101 admitted `example`s, and a convention that announces them

- **Location.** `Suggested.lean`, gate `sorry-examples`, from line 84 to line 2724; for example line 225 `example (I : Ideal R) : IsNeighbourhood I (CommAlgCat.of R R) := by sorry`. README Conventions, item 5, lines 277–278: "`Suggested.lean` contains the key definitions with real bodies and the headline theorems …, with some Checks as `example`s". The *Lean:* lines repeat it, for example lines 898–899, 1083–1084 and 2298.
- **Claim.** An admitted example tests nothing, and README Checks are not mirrored in Lean.
- **Witness.** 101 gate hits. Elaboration: 244 `sorry` warnings, of which 101 are examples.
- **Repair.** Delete every admitted `example`, as well as the partly proved cusp example at lines 2394–2411. Rewrite Conventions item 5 and the *Lean:* lines so that the Checks live in the README only.

## R07 (P3) — padding: one-tactic theorems and definitions that no headline needs

- **Location and witness.** On a scratch copy elaborated with `lake env lean` (exit 0, no errors), these sorried theorems close in one tactic:
  - `SchemeFrobenius.relativeFrobenius_fst`, `relativeFrobenius_snd`, `iteratedRelativeFrobenius_fst` and `iteratedRelativeFrobenius_snd` close by `pullback.lift_fst _ _ _` or `pullback.lift_snd _ _ _`;
  - `relativeFrobenius_unique` closes by `pullback.hom_ext (hfst.trans (pullback.lift_fst _ _ _).symm) (hsnd.trans (pullback.lift_snd _ _ _).symm)`;
  - `iteratedSchemeFrobenius_zero`, `iteratedSchemeFrobenius_succ`, `qPowerFrobenius_eq_iterated`, `absoluteFrobenius_base` and `universalHomeomorphismEtaleEquivalence_functor` close by `rfl`.

  Already proved in place, and trivial: `StrictHenselization.hom_ext` (321–325), `Chow.K0.toG0_not_injective_of_det` (2774–2779), and the `ValuativeCriterion` example (1438–1443), which restates Mathlib's `IsProper.eq_valuativeCriterion`.

  Definitions that no theorem uses: `Formal.ArtinianTestAlgebra` (2197, added by this pull request), `Stacks.StackInGroupoids`, `ValuativeLift` and `.reidentify` (1394–1434), `Coherent.DQCohPlus` and `.toDerived` (1901–1911), `Groups.IsCategoricalQuotient` (1367), and `Spaces.smallEtale` with `smallEtale_compose` (1276–1293).

  `ArtinianTestAlgebra` also differs from README §4.2 (lines 5309–5315). The README says "a perfect field `k`" and "with no second carrier"; the structure takes `[CommRing k]` with no perfectness and is a second, bundled carrier.
- **Repair.** Delete all of these from `Suggested.lean`; the README keeps them as targets.

## R08 (P3) — statement hygiene (gate, 11 hits) and related form defects

- **Location.**
  - The gate's 11 hits:
    - `Nonempty (_ ≃ _)` conclusions without the `nonempty_` prefix: lines 222, 1549, 1558 and 2131;
    - `letI` in a signature: lines 817, 1706, 2069, 2493, 2676 and 2677;
    - `[Fintype k]` beside `[Field k]`: line 2794.
  - Further form defects:
    - a global `instance instHasDerivedCategoryModules` (1692);
    - declarations placed in Mathlib's namespace, `_root_.IsAzumaya.exists_etale_matrix_splitting` and `_root_.IsAzumaya.etale_matrix_splitting_of_finite_cover` (1943, 1954);
    - `sorry` inside statements: `show f (genericPoint X) ⤳ genericPoint Y by sorry` (2068) and `letI : LocallyOfFiniteType … := by sorry` (2677);
    - `∃! f : X ⟶ Spec (CommRingCat.of (ULift (ZMod p))), True` (713).
- **Claim.** Lines 1549 and 2131 promise less than the README. README line 3690 asks for "the native degree-zero group is the union of the annihilators"; line 4978 asks for `LineBundleClass (Spec R) ≃ CommRing.Pic R` as a comparison of groups. A bare `Nonempty (A ≃ B)` between types says only that the cardinalities agree.
- **Witness.** `Nonempty (ℤ/p^∞ ≃ ℚ)` holds, so line 1549's form cannot tell the `p`-power torsion of `M = ℤ/p^∞ ⊕ ℤ` from any other countable set.
- **Repair.**
  - State the canonical maps and their bijectivity: an `AddEquiv` or `LinearEquiv` for 1549 and 1558, a `MulEquiv` for 2131.
  - Use instance binders instead of `letI`, and `[Finite k]` with `Nat.card k`.
  - Move the derived-category instance into the statement that needs it.
  - Put the `IsAzumaya` theorems under `TauCetiRoadmap.SchemeAndStackFoundations`.
  - Replace the in-statement `sorry`s by hypotheses: `IsDominant f` already gives the specialisation; pass `LocallyOfFiniteType` as a binder.

## R09 (P3) — TeX-only syntax in §§0.28–0.29 (gate `tex`, 65 hits)

- **Location.** README lines 1929–2084, for example line 2015: "`= X^{(p/S)} = X ×_{S,F_S} S`, with projections π₁ to X and π₂ to S" (outside code spans).
- **Claim.** `_{…}` and `^{…}` outside code spans are not allowed.
- **Witness.** 65 gate hits, all in §0.28–§0.29.
- **Repair.** Put each formula in a code span (`X^(p/S) = X ×_(S,F_S) S`) or write it in Unicode. After R02 most of §0.29 becomes a citation of `TauCeti/AlgebraicGeometry/Frobenius/*`.

## R10 (P3) — backticked names presented as this roadmap's own but declared nowhere in `Suggested.lean` (gate, 15 hits)

- **Location.** README §0.30, lines 2103–2130, for example "`isNormalScheme_iff_forall_affineOpens` …", "`codimensionOneMap_comp` and `codimensionOneMap_id`", "`ramificationIdxAt_pos`"; also line 1327 (`isReduced_iff_R0_S1`).
- **Claim.** A backticked own name claims a declaration in `Suggested.lean`. Most of these are pinned library names.
- **Witness.** At the pinned Tau Ceti:
  - `TauCeti/AlgebraicGeometry/Scheme/Normal.lean` has `isNormalScheme_iff_forall_affineOpens`, `isNormalScheme_Spec_iff`, `IsNormalScheme.of_isOpenImmersion` and `isIntegrallyClosed_of_isAffineOpen`;
  - `Morphisms/CodimensionOne/Basic.lean` has `codimensionOneMap_comp` and `codimensionOneMap_id`;
  - `Morphisms/RamificationIdx/Basic.lean` has `ramificationIdxAt_pos`;
  - Mathlib `AlgebraicGeometry/Properties.lean` has `isReduced_of_isReduced_stalk`.
- **Repair.** Cite these with their full names and files, as part of R02. Set the remaining names (`of_isRegular`, `isReduced_iff_R0_S1`, `ramificationIdxAt_eq_dvr` and the `test_*` Checks) in italics as README-only.

## R11 (P3) — locators

- (a) §0.8, README lines 859–864: `generic_fibre_spreading` and `fibre_locus_constructible` claim six fibre properties: geometrically reduced, irreducible, integral, connected, normal and smooth. They cite only Stacks 37.26.2 (0576), 37.26.4 (0578) and 37.26.5 (0579), which treat geometrically reduced fibres only; 0576 is about base change, not spreading out. Witness: `stacks-project` line 154398 (0576) and 154430 (0578); irreducible components are §37.27 (line 154514) and connected components §37.28 (line 154751). Repair: cite §37.27, §37.28 and the normal/smooth spreading results (or EGA IV₃ 9.7.7), property by property.
- (b) §2.9, line 3781: "[Stacks, Lemma 35.8.8](https://stacks.math.columbia.edu/tag/03DR)". Tag 03DR is Section 35.8. Lemma 35.8.8 is 0GN7, and it covers τ ∈ {Zariski, étale, smooth, syntomic, fppf}, not fpqc (`stacks-project` line 142526). Repair: link 0GN7, and say that the fpqc case is the README's own argument from Lemma 35.8.1 (03DT, line 142390).
- (c) §0.19, line 1423: `IsSnQuasiExcellent` cites "§2.8, pp. 6–7". (S_n)-quasi-excellence is defined in §2.10, p. 7; §2.8 is the openness of the (S_n)-loci (`cesnavicius-2021` lines 237 and 268). Repair: §2.10, p. 7.
- (d) `Suggested.lean` lines 1274–1275: the docstring of `Spaces.smallEtale` cites Stacks Definition 66.18.1 (03ED), whose objects are schemes (`stacks-project` line 254507), but the declaration's objects are spaces. Repair: Definition 66.18.2 (03G0), line 254522, which README line 2475 already cites.
- (e) README lines 337 and 378: "From Mathlib (`6b7abb3c76`)" and "From Tau Ceti (`a91d3aaf`)". These are not the pins (`1b1ccf4b`, `2fd255d9`). Repair: the pinned commits.
- (f) `Suggested.lean` line 1677: `isReplete_proetale` cites only Bhatt–Scholze Proposition 4.2.8, which gives local weak contractibility. Repleteness also needs Proposition 3.2.3(1) (`bhatt-scholze-2014` lines 798 and 1361). Repair: cite both.

## R12 (P3) — files outside the pull request's folders

- **Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77.
- **Claim.** Neither folder is among this pull request's own.
- **Witness.** `git diff --stat origin/main...HEAD` with the 15 own folders excluded lists exactly these two files, one line each.
- **Repair.** Remove both edits from this pull request, or name the two folders in its description.

## R13 (P3) — conflicting open heads with no stated order

- **Location.** The description's merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → this pull request".
- **Claim.** Two other open pull requests change this roadmap and conflict with this head. Neither is ordered.
- **Witness.** `scratch/overlaps.md`: "#1276 and #1808 conflict in `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, `…/Suggested.lean`"; the same for #1656.
- **Repair.** State which of #1276, #1656 and this pull request rebases on which.

## R14 (P3) — a consumer sentence the consumer does not support

- **Location.** README line 628: "AlgebraicModuliForArithmeticGeometry §1.3 consumes it and builds on it the coherent extension …".
- **Claim.** At its open head, AlgebraicModuliForArithmeticGeometry takes the Grassmannian from ModularCurves §0G, not from §0.3a here.
- **Witness.** That README, line 249: "*Grassmannians.* ModularCurves §0G constructs `Gr_d(E)` for finite locally free `E` with its affine …".
- **Repair.** Drop the sentence. The consumer roadmap, not this README, records what it consumes.

## Verified sound

**Gate.**
- Re-run on this head with `--base origin/main`. It gives the same counts as the worker's run: `tex` 65, `sorry-data` 25, `sorry-examples` 101, `imports` 1, `statement-hygiene` 11, `dropped` 39 and `readme-ids-missing` 15.
- `outside-folder` is 27 here: 25 files are in this pull request's own folders, and 2 are the files of R12.
- `build` 0.

**Elaboration.** `lake env lean TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` from the worktree: exit 0 in 58 s, 244 `declaration uses sorry` warnings, and no other message.

**Signatures.**
- I dumped the elaborated type of all 520 constants of the module from a scratch file importing it.
- `StrictHenselization.IsPointedNeighbourhood` and `Neighbourhood` lose `[IsLocalRing R]` and `[IsSepClosure …]`. This is harmless: their types mention neither, and `algebra` and every theorem keep all seven binders.
- I found no signature narrower than its README statement among the headlines checked: the rows below, plus `artinBootstrap`, `grothendieck_existence`, `algebraize_hom`, `semistable_alteration_theorem` and `K0.toG0_bijective`.

**Dependency check.** `depcheck: 238 roadmaps, 2353 edges, 0 problem(s)`, with no UPWARD or CYCLE line. SchemeAndStackFoundations is on main.

**Locators verified against the text (seeded sample).** Matches unless the line says otherwise.
- §0.6: Stacks 0AVU, 0AY0, 0AY3, 0AY4, 0AY2, 0EBH, 0EBJ, 0AY7, 0AY6, 0EBI and 0E9I. All numbers match. Note that 0AY4 needs only integral `X`, so the README's added normality for `IsReflexive.dual` is harmless.
- §0.8: 0AUW, 038F, 01UA, 004Z, 054L, 04KV, 056T, 033N, 057G, 055U, and EGA IV₃ Théorème 12.2.4 (v), (viii) on printed p. 183 (`ega-iv-3` line 7512). 0576, 0578 and 0579: see R11(a).
- §0.11: 02KH, 02L5, 02L7, 02KU, 02KZ, 02L1, 02VL, 02VN, 02V5, 02G7, 02G8, 02GE and 02GF; the Ω criterion is 02GF (3). BMP+ Convention 4.1 is on p. 35 of arXiv v3 (`bmp-2020` line 1547).
- §0.19: Česnavičius Definition 1.2 and Example 1.3, p. 2 (`cesnavicius-2021` lines 61 and 67); §2.10, p. 7. See R11(c).
- §0.27: Lemma 10.40.4 is 07T8, both assertions (line 25077); Lemma 10.12.10 is 00DF.
- §1.3: Definition 65.6.1 (025Y) and Lemma 65.6.2 (025Z).
- §1.19: 02ZW, 03YJ (Section 94.10), 026O, 04T2, 03YO and 06N3.
- §1.24: Milne, *Algebraic Groups*, A.64, pp. 580–581 (`milne-iag` line 23817).
- §2.9: 03DT, 0GN7 and 03PK (Section 59.28). See R11(b).
- §2.14:
  - Morel–Voevodsky §3.1: Prop. 1.8 p. 98, Prop. 1.9 and Ex. 1.10 p. 99, Defs 1.12–1.13 and Prop. 1.16 p. 100, Lemma 1.17 p. 101 (`morel-voevodsky` lines 1871, 1885, 1891, 1921, 1929, 1946, 1964);
  - Voevodsky arXiv:0805.4578: Def. 3.3, Thm. 3.2 and Lemma 3.5 (`voevodsky-cd` lines 490, 454, 541).
- §2.17: Bhatt–Scholze arXiv v2: Def. 3.1.1 p. 16, Prop. 3.2.3 p. 18, Prop. 3.3.3 p. 19, Prop. 3.1.10 p. 17, Def. 2.4.1 p. 13, Lemma 2.4.9 p. 14, Thm. 1.5 p. 3 and Prop. 4.2.8 p. 29.
- §3.1: 0A24, 0A26, 0A27, 0A28, 0BY7, 0BY9 (exactly `genus_baseChange`), 0CE4 and 0BY4.
- §4.4: 06HG, 06H3, 06HC, 06HR, 06IY, 06IL (Section 90.15), 06T4, 06GX, 06IR, 06T5, 06T2, 06T3, 06T8, 06IV, 06IW, 06IX, 06JM and 06JB. All 18 match.
- §5.6: 0FDP (finite type; applied locally), 0FBR (Section 42.60), 0FC0 (Section 42.62, product over locally finite type schemes with no separatedness), 067R, 0FF2, 0FF3 (immersions allowed) and 0FF4.
- Headline tags: 04S6. Condition (3) is exactly `artinBootstrap`'s hypotheses, with fppf-local surjectivity equivalent to surjectivity for flat locally finitely presented maps. Also 07QV, 032W, 04SK, 02X2, 03MJ, 04RD, 03G0, 03LP, 043H, 043Q, 06P9, 04TY and 048J.

**Library declarations opened.** All are at the pin and listed with file and line in R01, R02 and R10. Also Mathlib `AlgebraicGeometry/Sites/Proetale.lean:98` (`Scheme.ProEt`, weakly étale, matching Bhatt–Scholze).

**Cross-roadmap citations resolved.**
- ModularCurves in this pull request cites §0.3a (line 536), §§0.12a, 0.21 and 4.13 (lines 1305 and 1333), §4.2 (line 1574), §1.17 (line 446), §1.1 (line 492), §1.23 (line 2074) and §4.15 (line 164). Each section exists here.
- AlgebraicModuliForArithmeticGeometry (#853 head): see R14.
- Ownership against open pull requests: a search for other owners of strict henselization and the relative Grassmannian finds none besides the pinned library (R02).
- Overlaps: no cited id is dropped by an open pull request; no id is defined only by an open revision; no id this pull request drops is cited elsewhere.

**Adversarial table** (values computed; "dup" means the object is also at the pin, see R02).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §0.6 `coherent_hartogs` | 𝔸² ∖ 0; 𝔸¹ ∖ 0 | depth `k[x,y]_(x,y)` = 2 ⇒ Γ = k[x,y]; depth 1 ⇒ Γ = k[x,x⁻¹] ≠ k[x] | sound; depth hypothesis needed |
| §0.6 `reflexive_extension_of_depth` | `k[x,y,z,w]/(xw)`; two planes in 𝔸⁴ | CM, depth 3 ⇒ `j_*O_U = O_X`; depth 1 ⇒ `j_*O_U = k[z,w] × k[x,y] ≠ O_X` | sound |
| §0.6 `IsReflexive` | `ℤ/2` on Spec ℤ; `(x,y) ⊂ k[x,y]` | dual 0, double dual 0 ≠ ℤ/2; `I^∨∨ = k[x,y] ≠ I` | sound |
| §0.8 `flat_over_dedekind` | `S ⊔ 𝔸¹_S` over `k[t]`; `k[t]/(t²)`; `k[t]/(t)` | flat, fibre dimensions 0 and 1; `t`-torsion ⇒ not flat (non-reduced, excluded); a non-dominating component ⇒ not flat (excluded) | sound |
| §0.8 `quasi_sections` | generic point of 𝔸¹_k; separable closed point | residue `k(t)`, not closed ⇒ excluded; section after `Spec L` | sound |
| §0.11 `field_extension_descent` (Γ) | ℙ¹_k; `∐_ℕ Spec k` | `Γ = k`, `k ⊗ k' = k'`; `k^ℕ ⊗ k' ≠ k'^ℕ` for infinite `[k':k]` | qcqs needed, present |
| §0.11 `unramified_criteria` | `k[x]/x²`; ℂ/ℝ; `𝔽_p(t^(1/p))` | Ω = k dx ≠ 0; Ω = 0; Ω ≠ 0 | sound |
| §0.19 `quasiExcellent_cm_sn` | `k[ε]/ε²`; n = 0 | CM (dimension 0); (S_0) vacuous ⇒ ⇔ locally Noetherian | sound |
| §0.27 `element_annihilator_flat_baseChange` | ℤ/4 → ℤ/2; ℤ/4 → (ℤ/4)² | Ann(2) = (2) ↦ 0, but 1 ⊗ 2 = 0 has Ann = ℤ/2 (non-flat fails); (2) = (2) | sound; dup |
| §1.3 `IsAlgebraicSpace` | constant {0,1}; `h_X` | F(∅) has 2 points ≠ 1 ⇒ not a sheaf; `h_X` is a space (025Z) | sound; dup |
| §1.3 `EtaleAtlas` | `h_∅ → h_{Spec k}` | base change along id is ∅ → Spec k, not surjective | sound |
| §1.19 `IsDeligneMumford` | Bμ_p over 𝔽_p; BG finite; B𝔾_m | Lie(μ_p) = k ≠ 0 ⇒ diagonal ramified ⇒ not DM; DM; not DM | sound |
| §1.24 `galois_descent_affine` | L = k; Q̄[t^±] with discontinuous χ; finite L/k | B = A; Stab(t) = ker χ not open ⇒ excluded; Krull topology discrete ⇒ every action allowed | sound |
| §1.24 `CrossedModule` | SL₂(ℂ) → PGL₂(ℂ); id on S₃, trivial action | coker 1, ker μ₂; (12)(13)(12)⁻¹ = (23) ≠ (13) ⇒ Peiffer fails | sound |
| §2.9 `mu S n` | μ_p over 𝔽_p; μ₁; μ₂(ℚ) | reduced T: (t−1)^p = 0 ⇒ t = 1; 1+ε on `𝔽_p[ε]/ε^p`; 0; {±1} | sound |
| §2.9 `bigSheaf_fullyFaithful` | Frobenius on 𝔾_a over 𝔽_p | additive and natural; t ↦ t^p ≠ t on 𝔽_p[t] ⇒ not O-linear | sound |
| §2.14 `brownGersten_vanishing` | square-only counterexample | F(∅) ≃ A[1] ≠ 0; F(pt ⊔ pt) ≃ Cone(A → A²) ≃ A[0]; `a_Nis H^n F = 0` | reduced condition needed, present |
| §2.14 `nisnevich_cohomological_dimension` | Spec k; Spec ℝ | `H^q_Nis = 0` for q > 0; `H²_ét(𝔾_m) = ℤ/2` but `H²_Nis = 0` | sound |
| §2.17 `IsReplete` | Spec ℚ_ét, μ_(ℓ^(n+1)) → μ_(ℓ^n); Type | lim = discrete part of ℤ_ℓ(1) = 0 (stabiliser Gal(Q̄/ℚ(μ_ℓ^∞)) not open) ⇒ legs not epi; Type replete | sound; dup |
| §3.1 `isAffine_or_isProper` | 𝔸¹; ℙ¹ | affine, not proper; proper, not affine; both would force dimension 0 | sound |
| §3.1 `genus_baseChange` | ℙ¹_L/k with [L:k] = 2; `y² = x^p − t` | `H⁰ = L⊗L`, dimension 2 over L (fails without `H⁰ = k`); genus (p−1)/2 kept, `u = x − s` gives a cusp of normalisation genus 0 | sound |
| §4.4 `schlessinger_hull` | `h_{k[[t]]}/±`; `k[[t,s]] → h_{k[[t]]}` | θ identifies the classes of (ε,ε) and (ε,−ε) ⇒ H2 fails ⇒ no hull; tangent map k² → k not injective ⇒ versal but not a hull | sound |
| §4.4 `schlessinger_prorepresentable` | `h_R`; one-point functor | RS holds (06JB); tangent space 0, represented by Λ | sound |
| §4.17 `IsStrictNormalCrossings` | V(xy); nodal cubic; family (C̃, E, E) | strata of codimension 1, 1, 2, all regular; singular at the node; stratum {E,E} = E has codimension 1 ≠ 2 ⇒ rejected | sound |
| §5.6 `Chow.intersect` | 𝔸¹ with doubled origin L; ℙⁿ | closure of Δ ∋ (0₁,0₂) ⇒ immersion, handled by 0FF3; [0₁]·[L] = [0₁]; A = ℤ[h]/(h^(n+1)) | sound |
| §5.6 `graphPullback` | constant ℙ¹ → p; pr₁ | `f*O(1) = O` ⇒ `f*[p] = 0`; `[{p} × ℙ¹]` (0FF4) | sound |
| `Henselization.existsUnique_lift` | I = ⊤; I = ⊥; (ℤ,(5)) | algebra = 0, and J = S forces S = 0, so g is unique; algebra = R, g = f; ℤ[1/2] is a neighbourhood, ℤ[1/5] (ℤ/5 → 0) and ℤ×ℤ (ℤ/5 → (ℤ/5)²) are not | sound; dup |
| `StrictHenselization.existsUnique_lift` | R = 𝔽_p, Ω = S = F̄_p, φ = id | R^sh = F̄_p, f = id unique; hφ forces locality (r ∈ 𝔪 ⇒ φ(0) = 0) | sound; dup |
| `artinBootstrap` | F = U = h_X, a = id | sheaf, representable, flat lfp, surjective ⇒ space | matches 04S6(3) |
| `IsAzumaya.exists_etale_matrix_splitting` | M_d(A); ℍ/ℝ, d = 2; d = 0 | B = A; ℍ ⊗ ℂ ≅ M₂(ℂ); `Matrix (Fin 0)` is the zero ring, not faithful over a nonzero base, so Azumaya already forces d > 0 there | sound; R08 namespace |
| `grothendieck_existence` | A = k (I = 0); ℙ¹_(k[[t]]) | every level is X; O(n) on the levels algebraizes to O(n) | sound |
| `algebraize_hom` | maps 0, 1 on levels 0, 1 | no a with a ≡ 0 (t), a ≡ 1 (t²) ⇒ not a compatible system | sound |
| `alteration_theorem` | X = Spec k, Z = ⊤ | X₁ = X̄₁ = Spec k, B = empty product = ⊤, support ∅; Z = ⊥ excluded | sound |
| `weil_bound` | ℙ¹/𝔽_q; y² = x³ + x over 𝔽₃; y² = x³ − x over 𝔽₅ | q+1 = q+1; 4 points, \|4−4\| = 0 ≤ 2√3; 8 points, \|8−6\| = 2 ≤ 2√5 ≈ 4.47 | sound; R08 `Fintype` |
| `relativeFrobenius_smooth_rank` | 𝔸¹_k; 𝔸¹ ⊔ 𝔸² | t ↦ t^p with basis 1,…,t^(p−1), rank p; ranks p and p², no uniform d | sound; dup |
| `relativeFrobenius_etale_isIso` | 𝟙 over 𝔽_p[t] | absolute Frobenius not iso (𝔽_p[t] not perfect); relative Frobenius iso | sound; dup |
| `brauer_functionField_curve_trivial` | k(t), k = k̄; ℝ(t) | Br = 0; (−1,−1) ≠ 0 in Br ℝ(t) ⇒ `IsAlgClosed` needed | sound |
| `vectorBundleDegree_pullback` | X = Y, f = 𝟙, E = O | `hE` reduces to `rank … = const 1` with `rank := sorry` ⇒ unprovable | R01 |
| `lineBundleClass_spec_equiv_pic` | R = ℤ | Pic ℤ = 0: true, but `Nonempty (≃)` holds between any two equinumerous types | R08 |
| `localCohomology_degreeZero` | ℤ, (p), ℤ/p^∞ ⊕ ℤ | torsion ℤ/p^∞; `Nonempty (ℤ/p^∞ ≃ ℚ)` also holds | R08 |
| `IsQuasiExcellentRing.isNagata` | a field; `MvPolynomial ℕ k` | both properties; neither (not Noetherian) | sound (07QV); dup |
| `unibranch_finite_components` | eventually constant 𝔽₂-sequences, p = 𝟙 | component {𝔪∞} closed, not open | local Noetherianity needed, present |
| `isAffine_of_H1_vanishing` | ∅; ℙ¹ | Spec 0 is affine; H¹(O(−2)) = k ≠ 0, so the hypothesis fails | sound |

## Not verifiable

- Kisin 2017 (JAMS), §3.1.1 and §3.2.1, cited in §1.24 for `SemilinearAut` and `CrossedModule`. The sources service found no legal copy: the DOI landing page `pubs.ams.org` is on a host in no licence class.
- de Jong 1996 (§4.17 and §§4.18–4.20): settled as `uncertified`, so it is cited by locator only.
- Fulton 1998, Propositions 8.1.1, 8.2 and 8.3 (§5.6): Springer, paywalled, and not in the manifest.
- Gabber–Kelly, Theorems 2.3 and 2.6 (§2.14, a comparison remark), and Schlessinger 1968, Theorem 2.11 (§4.4): not fetched in this review.

## Source issues

- none
