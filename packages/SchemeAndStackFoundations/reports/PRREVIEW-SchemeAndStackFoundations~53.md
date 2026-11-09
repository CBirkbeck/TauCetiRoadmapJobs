# Review of SchemeAndStackFoundations (pull request #1854 at 56715a5)

**Verdict:** needs changes

At this head the folder is main's text plus one README change (+84/−9). The change adds a regular-local-ring paragraph and three Checks to §4.13 (README.md 5657–5718, 5762–5766) and a consumer sentence (7481–7484), and drops ModularCurves 0B and 9D from five `*Needs:*`/Dependencies lines (2436, 3053, 3230, 4890, 5031). `Suggested.lean` is byte-identical to main. The pins are main's: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9. This is a full review of the folder.

The worker's gate fails on 8 rules: tex 65, sorry-data 25, sorry-examples 101, imports 1, statement-hygiene 11, dropped 39, readme-ids-missing 15 and outside-folder 2. My rerun reproduces every count; without the pull request's folder list it reports 34 outside-folder hits, and `git diff` shows only 2 of them outside the named folders. Build is 0 and depcheck is 0.

## R01 (P1) — `absoluteFrobenius` lost `[Fact p.Prime]`; its sorry'd `map_add'` is false

Location: Suggested.lean 534 (`variable (p : ℕ) [Fact p.Prime]`) and 550–561 (`def absoluteFrobenius … map_zero' := by sorry; map_add' := by sorry`).

Claim: the `def` keeps only the section variables its type mentions. `[Fact p.Prime]` is dropped, so the definition covers every `p`, and its sorry'd ring-hom obligations are false for composite `p`.

Witness: `#check @…SchemeFrobenius.absoluteFrobenius` elaborates to `(p : ℕ) → (X : Scheme) → SchemeCharP X p → (X ⟶ X)`. Take `p = 4` and `X = Spec ℤ/4`: the stalk `ℤ/4` has `CharP 4`, and `map_add'` demands `(1+1)^4 = 1^4+1^4`, that is `0 = 2`. Nine further Frobenius declarations built on it also lack the binder (listed under Verified sound).

Repair: delete the `SchemeFrobenius` strand (see R03) and use the pinned `AlgebraicGeometry.Scheme.frobenius` (Tau Ceti `AlgebraicGeometry/Frobenius/Basic.lean:98`). Its `variable … [hp : Fact p.Prime]` is used by `powRingHom`, so `p = 4` is excluded. If any Frobenius declaration is kept, carry `[Fact p.Prime]` in its own signature.

## R02 (P2) — the new §4.13 paragraph plans results the pinned Tau Ceti already proves

Location: README.md 5657–5718 ("Regular local rings: Serre's theorem and localization" through the Koszul route), the `*Needs:*` line 5746–5753, the Checks 5762–5766 and the Downstream sentence 7481–7484.

Claim: the paragraph lists about sixteen targets and a proof route for 00OA. All of them are proved at the Tau Ceti pin, several under the proposed names.

Witness (Tau Ceti 2fd255d9):
- `TauCeti.globalDimension`: `RingTheory/GlobalDimension.lean:70` (00O6); `globalDimension_le_iff`, `globalDimension_le_iff_hasProjectiveDimensionLE` at `:85` and `:90`; `Submonoid.globalDimension_localization_le` at `:141` (00O8).
- `TauCeti.IsRegularLocalRing.isCohenMacaulay`: `RegularLocalRing/CohenMacaulay.lean:125`.
- `TauCeti.IsRegularLocalRing.free_of_isCohenMacaulay`: `RegularLocalRing/Free.lean:93` (00NT).
- `TauCeti.exists_resolution_maximalCohenMacaulay`: `CohenMacaulay/Resolution.lean:116` (00NG).
- `ModuleCat.projectiveDimension_add_depth_eq_depth`: `Depth/AuslanderBuchsbaum.lean:148` (090V).
- In `RegularLocalRing/ProjectiveDimension.lean`: `TauCeti.isRegularLocalRing_tfae` at `:392` (00OC); `finrank_cotangentSpace_le_projectiveDimension_quotient_maximalIdeal` at `:415` (00OA); `isRegularLocalRing_iff_globalDimension_lt_top` at `:376`; `IsRegularLocalRing.globalDimension_eq_ringKrullDim` at `:222`; the instance `isRegularRing_of_isRegularLocalRing` at `:441` (0AFS).

The paragraph also has three internal problems:
- The new `*Needs:*` line cites DerivedModuleAlgebra §0.K.1, while the Scope section (142–145) says DerivedModuleAlgebra is downstream and "not inputs to this roadmap".
- The Downstream sentence (7481–7484) and line 5714 say EnhancedDerivedSheaves E1.6 and AbhyankarLemma §3.3 consume this package. EnhancedDerivedSheaves on main states `isRegularLocalRing_of_projectiveDimension_residueField` as its own target (its README line 693, its Suggested.lean line 94). AbhyankarLemma §3.3 (line 364) takes 0AFS from PurityOfBranchLocus §0.3 and only 0567 from §4.13.

Repair: delete the paragraph's targets and the Koszul route, and the DerivedModuleAlgebra item of the `*Needs:*` line. Under `From Tau Ceti`, name the pinned declarations above with file and hypotheses (`[Small.{v} R]`, `[Nontrivial M]`, `supportDim = ringKrullDim` for 00NT). Rewrite the three Checks as Checks of those declarations. Make the Downstream sentence say that LocalPurity §2.1 and PurityOfBranchLocus §§0.3, 2.1 consume them through this contract; drop EnhancedDerivedSheaves and AbhyankarLemma from it.

## R03 (P2) — Suggested.lean and the README redeclare carriers and theorems proved at the Tau Ceti pin

Location: Suggested.lean 57–70, 172–219, 244–319, 490–501, 526–924, 932–1022, 1045–1058, 1502–1509, 1978–1984, 2152–2155, 2181–2193, 2428–2470. README §§0.5, 0.12, 0.17, 0.20, 0.21, 0.27, 0.29, 0.30, 1.3, 2.17, 4.1, 4.11, 4.13, 5.1, and the "Scheme and site contracts owned here" table (429–434).

Claim: these are the same objects, often under the same name, already in the pinned library, so they must be cited rather than restated.

Witness (Tau Ceti 2fd255d9; the folder's own PROGRESS.md and STATUS.md record most of them landing):
- Henselization: `RingTheory/Henselization/Algebra.lean:43`, `Henselian.lean:154`, `Lift.lean:130` (`existsUnique_lift`), `Lift.lean:142` (`algEquivOfHenselianRing`).
- Japanese and Nagata: `RingTheory/Japanese.lean:125`, `Nagata.lean:65`.
- Excellence: `RegularLocalRing/GeometricallyRegular.lean:70`, `RegularAlgebraMap.lean:54`, `Locus.lean:61`, `GRing.lean:57`; `RingTheory/Catenary.lean:56`.
- Pseudo-coherence: `AlgebraicGeometry/Modules/PseudoCoherent/Basic.lean:81`.
- Flat annihilators: `RingTheory/Flat/Annihilator.lean:67`, `:82`.
- Scheme Frobenius, all of §0.29 including the smooth rank: `Frobenius/Basic.lean:98`, `Relative.lean:84`, `Etale.lean:107`, `Smooth.lean:97`, `Twist.lean:83`, `:146`, `Iterate.lean:159`, `UniversalHomeomorphism.lean:105`, `:141`, `Finite.lean:44`.
- Normal schemes: `Scheme/Normal.lean:84`, `:177`, `:203`; `Morphisms/CodimensionOne/Basic.lean:91`, `:105`, `FiniteType.lean:103`, `Normal.lean:99`; `RamificationIdx/Basic.lean:74`, `Normal.lean:60`; `RegularLocalRing/Quotient.lean:98`.
- Algebraic spaces: `IsAlgebraicSpace` at `AlgebraicSpace/Basic.lean:195`, the same three clauses.
- `IsReplete`: `CategoryTheory/Limits/Replete.lean:91`.
- Thickenings and modifications: `IsThickening`, `IsFirstOrderThickening` at `Morphisms/Thickening.lean:69`, `:147`; `IsModification` at `Modification/Basic.lean:53`.
- Regular schemes: `IsRegular` at `Scheme/Regular/Scheme.lean:68`. `resolution_of_curves` is `Normalization/Regular.lean:112` with `Normalization/Modification.lean:59`.
- Chow groups: `cyclesOfDimension`, `RatEquiv`, `ChowGroup` at `Chow/Basic.lean:86`, `:257`, `:295`.

Repair: delete each redeclared definition and theorem from Suggested.lean. Restate the remaining headline theorems on the pinned carriers. In the README, move each item to `From Tau Ceti` with its exact name and file, delete its layer text, and remove the §0.29 and §0.30 rows of the "owned here" table. Keep in the layers only what is absent at the pin: adic thickening systems, formal completion, group spaces, torsors, the Nisnevich site, `IsJ2`, quasi-excellence and excellence, formal smoothness of scheme morphisms, SNC data, and the alteration theorems.

## R04 (P2) — AbundanceStatement is cited as a supplier, but it is on the never-cite list and not on main

Location: README.md 440–443 (four supplier-table rows), 767, 3448, 4727, 5652, 5731, 5737, 6623, 7207 ("Supplied by AbundanceStatement §4A / items 2–4"), 7219, 7271–7276, 7282, 7292, 7299, 7310, 7327, 7443, 7474.

Claim: §§5.9–5.10 take characteristic-zero degree, numerical-quotient, finite-generation and Nakai–Moishezon inputs from AbundanceStatement.

Witness:
- AbundanceStatement is not on main or in the merge order. It is open pull request #545 by another author, and it is on the brief's never-cite list.
- Line 440's link `../AbundanceStatement/README.md` resolves to nothing.
- The gate's `dropped` rule flags all 39 occurrences.

Repair: delete the four table rows and every "supplied by" sentence. The surface statements do not depend on the characteristic, so state them here once for all characteristics:
- Nakai–Moishezon for surfaces (Hartshorne 1977, Theorem V.1.10);
- finite generation of `Num S` (the Néron–Severi theorem the README already states for positive characteristic, 7289–7291).

Then drop the characteristic-zero/positive-characteristic split in §5.10 and the comparison targets *numericalQuotient_abundanceComparison* (7271–7277) and the §5.9 bridge.

## R05 (P2) — sorry'd data, with headline theorems stated on it

Location: Suggested.lean 550, 653, 710, 729, 744, 1115, 1539, 1541, 1552, 1568, 1582, 1649, 2053, 2073, 2112, 2164, 2442, 2530, 2532, 2534, 2536, 2542, 2549, 2562, 2569 (the gate's 25 hits).

Claim: `def` and `instance` bodies contain `sorry`, and headlines are stated on them. Examples:
- `grothendieck_existence` (2088) on `Scheme.formalCompletion` (2053) and `completionFunctor` (2073);
- `algebraize_hom` (2120) on `levelIncl` (2112);
- `derivedObject_gluing` (1628) beside `derivedHomPresheaf` (1582);
- `K0.toG0_bijective` (2587) on `K0.toG0` (2569).

Witness: the rule "no `sorry` in the body of a `def`, `abbrev`, `instance` or `opaque`" fails 25 times. R01 shows that one of these sorries is false.

Repair: give each a real body (for Chow, cite the pinned `Chow/Basic.lean:257` `RatEquiv`), or delete it and keep its README target with the intended signature. Delete every theorem that mentions a deleted definition, or restate it on a pinned carrier.

## R06 (P2) — the Hodge index theorem is statable at the pins but absent

Location: README.md 16–23 (an end theorem of the roadmap) and 7296–7298 (`hodge_index`). Suggested.lean has no such declaration, and its module docstring (14–19) does not say why.

Claim: `hodge_index` is a headline, and the pins have every carrier it needs.

Witness: this scratch file elaborates under `lake env lean` with exit 0 and a single `sorry` warning:
- `def surfacePairing k X L M := χ(O) − χ(L.dual) − χ(M.dual) + χ((L.tensorProduct M).dual)` using `Scheme.Modules.eulerCharBelow k X _ 3`;
- `theorem hodge_index [IsAlgClosed k] [IsProper (X ↘ Spec k)] [Smooth …] [IsIntegral X] (hdim : topologicalKrullDim X = 2) (hH : (LineBundleClass.mk H).IsAmple) (hDH : surfacePairing k X D H = 0) : surfacePairing k X D D ≤ 0`.

It uses only pinned `LineBundleClass.IsAmple` (`LineBundle/Ample.lean:71`), `InvertibleSheaf.tensorProduct` (`TensorProduct.lean:65`) and `InvertibleSheaf.dual` (`Dual.lean:44`). On `ℙ¹×ℙ¹` with `H = O(1,1)` and `D = O(1,−1)` it computes `H² = 2`, `D·H = 0` and `D² = −2` (see the table).

Repair: add this definition (a real body, no quotient) and `hodge_index` (Hartshorne 1977, Theorem V.1.9; the χ-form of the pairing is Exercise V.1.1), and list `surfacePairing` in §5.10's *Lean:* line.

## R07 (P3) — module docstring form; the file is an API catalogue

Location: Suggested.lean 14–19.

Claim: the docstring is not titled "<title>: target signatures". It does not say that README.md is the roadmap and this file is not, and it does not name the headlines that cannot be stated at the pins with what each lacks. Of the 229 sorry'd declarations, most are API lemmas rather than headlines. Examples: `schemeCharP_spec_iff`, `relativeFrobenius_fst/_snd/_unique`, `iteratedRelativeFrobenius_fst/_snd`, `Action.free_iff_mono`, `Torsor.trivial_iff_section`, `zariskiTopology_le_nisnevichTopology`, `nisnevichTopology_le_etaleTopology`, `localCohomology_degreeZero`, `strictTransform_supportComparison_affine`, `element_annihilator_flat_baseChange`.

Witness: the README's end theorems include Keel–Mori, coherent Grothendieck duality, the Brauer class of an Azumaya algebra, the Picard torsors of a curve, Schlessinger's theorem and GRR. None is stated, and none is named as not statable.

Repair: rewrite the docstring in the required form. Name each of those six with its missing carrier (algebraic stacks and coarse spaces; `f^!`; the étale `𝔾_m` and `H²`; Picard stacks; the Artinian deformation category and pro-representability; the Chow ring and Todd class). Delete the API lemmas; the README keeps them as targets.

## R08 (P3) — padding

Location: Suggested.lean 393, 569, 691, 695, 791, 2578–2583, 2284–2302, 2254–2269.

Claim:
- Five theorems close with one tactic on a scratch copy. Every `sorry` was replaced by `first | rfl | infer_instance | decide | (simp; done) | sorry`, and exactly these lost their warning: `universalHomeomorphismEtaleEquivalence_functor`, `absoluteFrobenius_base`, `iteratedSchemeFrobenius_zero`, `iteratedSchemeFrobenius_succ`, `qPowerFrobenius_eq_iterated`.
- `K0.toG0_not_injective_of_det` is a three-line proof that a nonzero kernel element exists.
- `nodal_codim_two_thickness_three_residual` computes small values. Its `[IsAlgClosed k] [CharZero k]` are unused: `k[a,b,s,t]/(ab−st)` has dimension 3 and embedding dimension 4 over any field.
- `node_local_structure_dvr` is a normal form whose `a = 0` branch is `rfl`.

Witness: the probe output went from 229 to 222 warnings. The other two lost warnings come from a `simp` heartbeat timeout in `RatEquiv` and its dependent example, which do not count.

Repair: delete these eight from Suggested.lean; the README keeps the statements.

## R09 (P3) — admitted examples

Location: Suggested.lean, 101 `example … := by sorry` (first at 81, 83, 85, 88, 89, 91, 94, 102, 111, 135, 159).

Claim: an admitted example tests nothing, and the gate fails 101 times. README line 284 promises "some Checks as `example`s".

Repair: delete them, keep the README Checks, and reword line 284.

## R10 (P3) — another roadmap's module is imported

Location: Suggested.lean 2: `import TauCetiRoadmap.AlgebraicVectorBundles.Suggested`. It is used at 1872, 2535–2537, 2550 and 2565.

Claim: the import rule admits only `Mathlib` and `TauCeti.*` modules, and the gate's `imports` check fails on this line.

Repair: drop the import. State the rank, `K0` and `det` targets on pinned carriers (`SheafOfModules.IsLocallyFree`, `TauCeti.AlgebraicGeometry.LineBundleClass`), or name them in the docstring as not statable.

## R11 (P3) — statement hygiene (11 gate hits)

Location: Suggested.lean 219, 646, 1378, 1387, 1535, 1898, 1960, 2297, 2480–2481, 2598.

Claim and witness:
- `Nonempty (… ≃ …)` conclusions: `fixed_of_henselian`, `localCohomology_degreeZero`, `localCohomology_flat_baseChange`, `lineBundleClass_spec_equiv_pic`.
- `letI` in signatures: `relativeFrobenius_smooth_rank`, `DQCoh.affineEquiv`, `vectorBundleDegree_pullback`, `nodal_codim_two_thickness_three_residual`, `CH_coprod`.
- `[Fintype k]` beside `[Field k]` in `weil_bound`.

The type-level bijections assert only equal cardinality. For example, `ℤ/4` and `(ℤ/2)²` are related by such a bijection, so `lineBundleClass_spec_equiv_pic` cannot tell the group structure apart.

Repair, as the gate names it: state the canonical map and `IsIso` of it (`≃*` for Pic), and keep `Nonempty` only in a `nonempty_*` corollary. Replace each `letI` with an instance binder. Use `[Finite k]` and `Nat.card k` in `weil_bound`.

## R12 (P3) — TeX-only syntax (65 gate hits)

Location: README.md 1788, 1862, 1874–1877, 1883, 1887, 1890, 1902, 1916, 1929, 1933, 1942–1943 (`O_{V(I)}`, `F_{p²}`, `X^{(p/S)}`, `F_{X/S}`, `t^{p−1}`, `p^{d(x)}`, `F_{q²}`).

Repair: use Unicode or code spans.

## R13 (P3) — backticked own names that Suggested.lean does not declare (15 gate hits)

Location: README §0.30: `IsNormalScheme.isIntegrallyClosed_of_isAffineOpen`, `.of_isOpenImmersion`, `.of_isRegular`, `.test_cusp`, `codimensionOneMap.test_square`, `codimensionOneMap_comp`, `codimensionOneMap_id`, `exists_regularSystem_of_quotient.test_parabola`, `isNormalScheme_Spec_iff`, `isNormalScheme_iff_forall_affineOpens`, `isReduced_iff_R0_S1`, `isReduced_of_isReduced_stalk`, `ramificationIdxAt.test_square`, `ramificationIdxAt_eq_dvr`, `ramificationIdxAt_pos`.

Witness: `IsNormalScheme.isIntegrallyClosed_of_isAffineOpen` and `.of_isOpenImmersion` exist at the pin (`Scheme/Normal.lean:195`, `:100`). `.of_isRegular` is the pinned instance `IsRegular.isNormal` (`Scheme/Regular/Scheme.lean:175`).

Repair: cite the pinned names under `From Tau Ceti`; write the rest in prose or italics.

## R14 (P3) — locators

Location and witness (Stacks book; the item's own tag versus the tag written):
- §1.17, line 2651: "Definition 83.8.1 (04A9)". 04A9 is Section 83.8; the definition is 04AA.
- §1.18, line 2751: `yonedaEquiv` cites "Lemma 8.6.3 (0432)", which is about stacks in setoids. The 2-Yoneda lemma is Categories, Lemma 4.41.2 (004B).
- §2.20, lines 4283, 4356 and 4364: "Definition 48.28.1 (0E2S)" should be 0E2T; "Remark 48.27.6 (0FVU)" should be 0FW0; "Example 48.3.9 (0A9D)" should be 0GEW. Each written tag is the section's.
- §5.7, line 7088 and Suggested.lean 2586: "Stacks, Lemma 36.37.4" is 0F8H, about homotopic maps of complexes. The cited fact is Lemma 36.38.4 (0FDI), `K₀ → K'₀` an isomorphism for Noetherian regular `X`, with Lemma 36.38.5 (0FDJ), `K₀(Vect) ≅ K₀(D_perf)` under the resolution property.
- Outside the sample, the same section-tag slip appears at lines 3375 (0CJZ for 0CK0), 3876 (03QQ for 03QV), 3905 (03RH for 03RM) and 3990 (09IP for 09IS).
- §0.28, line 1795 cites Lemma 26.17.6 (01JU) for a left-unit coherence that lemma does not state.

Repair: replace each tag with the item's own tag as listed. For §5.7, cite 0FDI and 0FDJ with 36.11.8 (0FDC). Drop the 26.17.6 citation at 1795.

## R15 (P3) — the supplier contract names stale pins

Location: README.md 343 "**From Mathlib** (`6b7abb3c76`)" and 384 "**From Tau Ceti** (`a91d3aaf`)".

Witness: `lake-manifest.json` at this head pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`.

Repair: name the manifest's pins.

## R16 (P3) — edits outside this pull request's named folders

Location: `Completed/ArithmeticDirichletSeries/README.md` 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` 76–78.

Witness: `git diff --stat origin/main...HEAD` lists both, and neither folder is among the pull request's own folders.

Repair: add the two folders to the pull request's own folders so each gets its review, or move the two sentence changes to a separate pull request.

## R17 (P3) — conflicting open heads with no stated order

Location: the pull request description, merge-order paragraph ("#1101 → #1807 → this pull request … #1808 is independent").

Witness: the overlap report lists #1276 (polarized adic systems) and #1656 (linear Noether normalization). Both change `TauCetiRoadmap/SchemeAndStackFoundations/README.md` and conflict with this head.

Repair: name #1276 and #1656 in the merge-order paragraph and say which is rebased on which.

## R18 (P3) — the ModularCurves edits are partial

Location: README.md 2436, 3053, 3230, 4890, 5031 (the dropped 0B and 9D citations), against 103–112, 416–419, 2428, 4879, 6027 and 6060.

Claim: no `*Needs:*` line now consumes ModularCurves 0B, yet the supplier contract still lists "0B (group objects and finite locally free group schemes)". §1.13 (2428) and §3.5 (4879) still invoke "ModularCurves 0B's convention", and §4.15 (6027, 6060) still uses 9D while 9D was dropped from §1.23.

Repair: write §1.13 and §3.5 against Mathlib's `GrpObj (Over.mk f)` convention, which the `*Needs:*` lines already cite. Remove 0B from the `From ModularCurves` contract, and keep 9D there only for §4.15.

## Verified sound

**Build and gate.**
- `lake env lean TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean`: exit 0 in 65 s, 229 `sorry` warnings and no other diagnostic.
- The gate rerun reproduces the counts above.
- `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)` (no UPWARD or CYCLE line).

**Signatures.** All 225 `#check @name` lines elaborate in one scratch file importing the built module. Their types match the README statements, with one exception: ten `SchemeFrobenius` declarations lack `[Fact p.Prime]` (`absoluteFrobenius`, `schemeFrobeniusTwist`, `schemeFrobeniusTwistBaseChangeIso`, `iteratedSchemeFrobenius`, `iteratedSchemeFrobeniusTwist`, `iteratedRelativeFrobenius`, `iteratedSchemeFrobeniusTwistZeroIso`, `iteratedSchemeFrobeniusTwistAddIso`, `qPowerFrobenius`; `SchemeCharP` needs no binder). Only `absoluteFrobenius` has a false obligation (R01). The other sorry'd proof fields were read and are true: formal-completion powers, the adic equation, `levelIncl`'s square, `RatEquiv` closure, extension-closedness, multiplicativity of `det`, and the dominance in `functionFieldMap`.

**Seeded sample, all 15 sections.**
- **Method.** 467 number–tag pairs in the whole README were matched against the cached Stacks book (`book.pdf` text); 442 match exactly. Of the rest, the single-item slips are R14, and the "Lemmas a–b (section tag)" ranges are acceptable section pointers.
- **§0.12.** 0A02 (adjoint and construction), 0A03, 09XI (5)⇒(2).
- **§0.20.** 032F, 032G, 032I, 032L, 032M, 032N, 032R, 032U, 032V, 032W, 0334, 0335, 03GH, 09E1, 0AVK, 07QV.
- **§0.26.**
  - `van-hoften` line 312 is §2.1.2, eq. (2.1.2) on p. 8; line 334 is Example 2.1.3, p. 8; line 412 is Def. 2.1.9, p. 10.
  - `zhu-2017`: line 2362 is §A.2.1, p. 49; line 2388 is Prop. A.15 with (A.2.1)–(A.2.2), p. 50; line 2413 is Cor. A.16.
  - `bhatt-scholze-2017`: line 696 is the §4 opening, p. 15; line 2454 is the proof of Prop. 11.41, p. 53.
- **§0.28.** 01JU (1), 01HM.
- **§0.29.** 03SM, 0CC7, 0CC8, 0CC9, 0CCA–0CCD, 0CCG, 0EBS, 054L.
- **§1.1.** 01BG, 023T, 04TQ, 04TR, 04TS.
- **§1.4.** 025Y.
- **§1.13.** 043H, 043Q, 06P9.
- **§1.17.** 048E, 048J, 048Q, 048T, 049Y (2), 04AE, 04S6 (3), 0BRH. Rydh 2013 (arXiv 0708.3333v2, the 36-page manuscript the README names): Lemma (4.3) and Thm (4.4) at lines 1019–1025, p. 20; Prop. (4.7) (B′) with its proof at lines 1046–1124, pp. 20–22; Remark (4.9)(4) at line 1136, pp. 22–23.
- **§1.18.** 026F, 02ZI, 02ZN, 0435, 04W9, 02ZP, 026G, 02ZL.
- **§1.24.** Milne, *Algebraic Groups* (iAG2017, author page): A.64 is on pp. 580–581, with the Hopf form on p. 581. 0CDQ is Stacks §35.6.
- **§2.17.** Bhatt–Scholze 2014 (arXiv 1309.1198v2): Def. 3.1.1 p. 16, Prop. 3.1.10 p. 17, Prop. 3.2.3 p. 18, Prop. 3.3.3 p. 19, Prop. 4.2.8 p. 29, Def. 2.4.1 p. 13, Lemma 2.4.9 p. 14, Thm 1.5 p. 3.
- **§2.20.** 0E2T, 0BV8, 0C0Z, 0FVV, 0BS2–0BS3, 0DI2, and Lemma 48.3.6 (0A9Q).
- **§5.7.** 0C1M, 00OC.
- **§5.11.** Milne AG ch. 11 (2024-11-04): Def. 11.12 p. 9; Thm 11.53, Cor. 11.54 and Ex. 11.55 p. 37; the Frobenius application p. 38.

**Pinned declarations opened.** About 65 Tau Ceti declarations, with the file:line given in R01–R03, R06 and R13. In Mathlib: `Scheme.ord` (`OrderOfVanishing.lean:52–62`, zero off coheight one, so `RatEquiv` is sound), and `IsRegularLocalRing.of_isRegularRing_of_isLocalRing` (`RegularLocalRing/Defs.lean:115`), `ModuleCat.projectiveDimension_le_projectiveDimension_of_isLocalizedModule` (`LocalProperties/ProjectiveDimension.lean:64`), `Module.free_quotSMulTop_iff_free` (`Regular/Free.lean:35`), `projective_iff_hasProjectiveDimensionLE_zero` (`Abelian/Projective/Dimension.lean:158`), `ShortComplex.Exact.liftFromProjective` (`ShortComplex/Exact.lean:948`), `Module.free_of_flat_of_isLocalRing` (`LocalRing/Module.lean:299`).

**Cross-roadmap citations resolved.**
- DerivedModuleAlgebra §0.K.1 is on main (README 516). EnhancedDerivedSheaves E1.6 is on main (README 693, Suggested 94). AbhyankarLemma §3.3 is on main (364).
- LocalPurity §2.1 and PurityOfBranchLocus §§0.3, 2.1 are at this head; they cite §4.13 (LocalPurity 34, 71, 270; PurityOfBranchLocus 251–253).
- ModularCurves 4D cites §0.12 (ModularCurves 1270); depcheck reports no cycle.
- Ownership against the closest open roadmap pull requests (#1796, #1840, #1754, #1743 at their heads): each only consumes this roadmap; none owns henselization, algebraic spaces, stacks, Nisnevich or replete topoi, dualising complexes, Chow groups or the regular-local-ring package.

**Headline theorems.** README lines 16–23 list: henselization and its universal property; Artin's bootstrap; Keel–Mori; coherent duality; the Brauer class of an Azumaya algebra; Picard torsors; Schlessinger; Grothendieck existence; algebraization of morphisms; de Jong's two alteration theorems; GRR; Hodge index; the Weil bound.
- Stated: `henselian`, `existsUnique_lift`, `artinBootstrap`, `grothendieck_existence`, `algebraize_hom`, `alteration_theorem`, `semistable_alteration_theorem`, `weil_bound`.
- `hodge_index` is statable and absent (R06). The rest go in the docstring (R07).

**Adversarial table.**

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `Henselization.IsNeighbourhood` (0.12) | `(ℤ,(5))` with `ℤ[1/2]`, `ℤ[1/5]`, `ℤ×ℤ` | `ℤ/5→(ℤ/5)[1/2]=ℤ/5` bijective; `ℤ/5→0` not; `ℤ/5→ℤ/5×ℤ/5` not surjective | holds | none |
| `henselian`, `existsUnique_lift` | `I=⊤`; `I=⊥`; `(ℤ,(5))→(ℤ_5,(5))` | `⊤`: colimit has terminal object 0; `J=⊤`, henselian forces `S=0`, unique `0→0`. `⊥`: `algebra = R`, lift is `f` | holds | R03 (pinned) |
| `fixed_of_henselian` | `(ℤ_p,(p))`; `(R,0)` | both henselian, so `R → algebra I` is an iso | holds | R03, R11 |
| `Ring.IsJapanese/IsNagata.of_complete_local` | `k[[x,y]]`; `k[ε]/ε²` | 032W; `R/p = k` is Japanese | holds | R03 |
| `IsQuasiExcellentRing.isNagata` | `ℤ`; `MvPolynomial ℕ ℚ` | `ℤ` is G and J-2, so Nagata; the second fails the Noetherian clause on both sides | holds | none |
| `IsUniversallyJapanese` Checks (0.20) | eventually-constant `𝔽₂` sequences; countable cusp `k[tᵢ²,tᵢ³]` | maps to domains have image `𝔽₂`, so finite type over `𝔽₂`; `T` is not finite over `R` (degree-one coefficient) | holds | none |
| `IsN1.test_finite_cusps` | `r = 0, 1, 2` | generators `{1}`, `{1,t₁}`, `{1,t₁,t₂,t₁t₂}`; `tᵢⁿ ∈ R` for `n ≥ 2` | holds | none |
| `PerfectlySmooth*` (0.26) | `Spec 𝔽_p → (𝔸¹)^perf` | the image is the closed point, not open | rejects | none |
| `wittScheme` (0.26) | `W_n(𝔽_p)`; `n = 1` | `ℤ/pⁿ`; `W₁X = X` | holds | none |
| `IsWeaklyNormal` (0.26) | `A¹` with `Y = Spec k[t,ε]/(ε²,tε)`; cusp | without "`Y` reduced", `Y→A¹` is finite, birational and a universal homeomorphism but not an isomorphism; cusp normalisation is not an isomorphism | README's "`Y` reduced" needed and present | none (source misprint) |
| `quotientToKernel` (0.28) | `𝔸²∖0 → 𝔸²`, `I=(x,y)` | image-ideal quotient `k[x,y]/(x,y)=k`; section-kernel quotient `0` | non-injective as claimed | none |
| `quotientPresheaf_not_sheaf` (0.28) | `ℙ¹`, two points | presheaf global value `k`; sheaf `k×k` | holds | none |
| `absoluteFrobenius` (0.29) | `p=4`, `Spec ℤ/4` | `(1+1)⁴ = 0`, `1⁴+1⁴ = 2` | **false obligation** | R01 |
| relative Frobenius rank (0.29) | `A¹_k`, `A²_k`, `A¹⊔A²` | ranks `p`, `p²`, `p` and `p²` (bases are monomials with exponents `< p`) | holds | R03 |
| `qPowerFrobenius_over` (0.29) | `k = 𝔽_{p²}`, `a = 2` | `F_k² = id`, so `F_X² ≫ f = f ≫ F_k² = f`; the single `F` is not a `k`-map | holds | R08 |
| `schemeCharP_iff_structureMap` | `∅`; `Spec ℤ/p` | unique map in both cases; `∅` vacuous | holds | none |
| `Action.free_iff_mono` (1.13) | `S₃` on itself; `𝔾_m` on `𝔸¹` | `(g,x)↦(gx,x)` injective, free; `(c,0),(1,0)↦(0,0)`, neither free nor mono | both sides agree | none |
| `AlgSpace` initial (1.4) | `h_∅`, sheaf `F` | `F(∅) = pt` (empty cover), `Hom(h_∅,F) = pt` | holds | none |
| `qcoh_fpqc_descent` Checks (1.1) | `0: O→O` | not invertible, so not a groupoid | holds | none |
| `finiteGroupQuotient_projective` (1.17) | `ℤ/2` on `ℙ¹_ℤ` by `x↦−x` | invariants `ℤ[x²,y²]`, `N=1`, `Y/Γ=ℙ¹_ℤ`; mod 2 the quotient map is Frobenius, not the identity | flat-base-change-only claim right | none |
| `IsGeometricQuotient` (1.17) | `Spec k[ε]/ε² → Spec k`, identity relation | topological clauses hold; `k → k[ε]/ε²` not iso | rejects | none |
| `artinBootstrap` | `F = h_X`, `U = X`; constant `Bool` presheaf | `X` itself is the atlas; `Bool` fails the empty-cover sheaf axiom | holds | R03 |
| `twoFiberProduct` (1.18) | `pt ×_{BG} pt` | `G` | holds | none |
| `stackification` (1.18) | trivial `ℤ/2`-torsors over `Spec ℝ` | two classes; `Spec ℂ` is the nontrivial one | holds | none |
| `CrossedModule` (1.24) | `SL₂(ℂ)→PGL₂(ℂ)`; `id: S₃→S₃` with trivial action | coker 1, ker `μ₂`; Peiffer `y = xyx⁻¹` fails | holds | none |
| `ContinuousSemilinearAction` (1.24) | character of `Gal(ℚ̄/ℚ)` with non-open kernel | stabiliser of `t` is `ker χ`, not open | rejects | none |
| `test_etale_not_replete` (2.17) | `μ_{ℓⁿ}` on `(Spec ℚ)_ét` | `lim μ_{ℓⁿ}(K) = 1` for every finite `K/ℚ`; leg to `μ_ℓ` not epi | holds | R03 (`IsReplete` pinned) |
| `brauer_functionField_curve_trivial` | `K = k(t)`; `K` algebraic over `k(t)` | `C₁` holds and passes to algebraic extensions, so `Br = 0` | holds | none |
| `artinSchreier_vanishing` | zero ring | no `CharP 0 p` instance, so excluded | holds | none |
| Serre duality (2.20) | `ℙ¹_k`, `ω = O(−2)` | `h¹(O) = 0 = h⁰(ω)`; `h⁰(O) = 1 = h¹(ω)` | holds | R14 tags |
| `isAzumaya_iff_positive_fibres_mulLeftRight` | `M₀(K)`; `K` over `K×K` | endomorphism map bijective but rank 0; unfaithful | both rejected | none |
| `vectorBundleDegree` (3.3) | genus 2, `E = O` | `deg O = 0`, `χ(O) = −1` | distinguishes | none |
| `genus_of_finite_etale` | `E → E` multiplication by 2, char ≠ 2 (`n = 4`) | `g_X − 1 = 0 = 4·0` | holds | none |
| `cohomologyDim_one_eq_zero_of_degree_gt` | `ℙ¹`, `O(1)` | `deg 1 > −2`; `h¹ = 0`, `h⁰ = 2 = 1+1−0` | holds | none |
| `lineBundleClass_spec_equiv_pic` | groups `ℤ/4` vs `(ℤ/2)²` | equal cardinality, so a bijection exists between non-isomorphic groups | content-free | R11 |
| `grothendieck_existence` | `ℙ¹_{k[[t]]}`, `𝓜_n = O(1)|X_n` | algebraizes to `O(1)` | holds | R05 |
| `algebraize_hom` | `X = Spec A`, `Y = 𝔸¹_A`; `X = 𝔸¹_A` | compatible `a_n` give `a ∈ lim A/tⁿ⁺¹ = A`; `x ↦ Σ tⁿxⁿ` is not algebraic, so properness is needed | holds | R05 |
| `resolution_of_curves` | cusp; node (`p` odd) | normalization `k[t]`, regular, a modification | holds | R03 |
| `alteration_theorem` | cusp, `Z` = singular point | `𝔸¹ ⊂ ℙ¹`, `B = {0,∞}` SNC, birational | holds | none |
| `semistable_alteration_theorem` | `ℤ_p[x,y]/(xy−p²)` | blow-up of the singular point gives three smooth components meeting transversally | holds | none |
| `exists_regularSystem_of_quotient` | `k[x,y]_(x,y)` with `I = (y−x²)`; `(y²−x³)` | `d = 2`, `c = 1`; cusp quotient not regular | holds | R03 |
| `Chow.RatEquiv` | `W` integral, `w` with coheight ≠ 1 | `Scheme.ord = 0` there, so only codimension-one terms count | sound | R05 (sorry'd fields) |
| `CH₀(Spec κ) ≅ ℤ`; DVR grading | closed point | height 0, coheight 1 | holds | none |
| `K0.toG0_bijective` | `ℙ¹`; nodal cubic | `ℤ² = ℤ²`; on the cubic `[L_λ]−[O]` is nonzero in `K₀` and zero in `G₀`, so regularity is needed | holds | R14 tag |
| `f_!` on `ℙ¹` (5.7) | `n = −1, −3` | `χ = 0`, `χ = −2 = n+1` | holds | none |
| Weil intersection table (5.11) | general `g`, `q` | `Γ₀² = −2gq`, `Δ₀² = −2g`, `Γ₀·Δ₀ = N−q−1` | holds | none |
| `weil_bound` | `ℙ¹/𝔽_q`; `y²=x³−x/𝔽₃`; Hermitian over `𝔽₄` | `N = q+1`; `N = 4`, bound `2√3`; `N = 9 = 4+1+2·1·2` | holds, sharp | R11 |
| `hodge_index` (proposed) | `ℙ¹×ℙ¹`, `H = O(1,1)`, `D = O(1,−1)` | `χ(O(a,b)) = (a+1)(b+1)`; `H² = 1−0−0+1 = 2`, `D·H = 1−0−0−1 = 0`, `D² = 1−0−0−3 = −2` | holds | R06 |
| §4.13 consumers | EnhancedDerivedSheaves E1.6; AbhyankarLemma §3.3 | E1.6 owns its statement; §3.3 cites PurityOfBranchLocus §0.3 | sentence false | R02 |

## Not verifiable

- Kisin 2017 (§1.24, §3.1.1 pp. 34–35, §3.2.1 pp. 39–40). The sources service found only the AMS landing page and no legal copy.
- Fulton 1998 (§5.7: §15.1, Examples 15.1.5, 15.1.8, Theorem 6.7; §5.10: §19.1). Paywalled; not fetched.
- SGA 6 Exposé 0 Appendice and Thomason–Trobaugh Exercise 8.6 (§5.7). Not fetched; no open archive is known to me.
- Hartshorne 1977 (§5.10, and the R04 and R06 repairs). The manifest records it as uncertified, so it is cited by locator only.
- de Jong 1996 is uncertified and outside the sample.

## Source issues

- **Misprint** in zhu-2017 at §A.2.1, p. 49 (`zhu-2017` line 2380): the source says a reduced finite-type `X` is weakly normal if every finite birational universal homeomorphism `Y → X` is an isomorphism; it should require `Y` reduced, since `A¹` with an embedded point at the origin would otherwise refute weak normality of `A¹`; affects nothing (the README adds the condition).
