# Review of SchemeAndStackFoundations (pull request #1656 at 16d66b3)

**Verdict:** needs changes

This is a full review of the repaired head. Since 4ebdad2 the folder changed by 538 lines in one commit (455 README lines, 83 Lean lines). No file outside the folder changes against `origin/main` (merge base `eaf17b10`). All six findings of the previous review are repaired (below). The worker's gate passes, the dependency check reports no problem, and the file elaborates with only `sorry` warnings.

Nine findings remain, three of them blocking. The pinned Tau Ceti (`2fd255d9`, 2026-11-04) now contains, with proofs, many of the objects this roadmap still plans and redeclares:

- scheme Frobenius with the §0.29 headline properties;
- the normal-scheme, codimension-one and ramification API of §0.30;
- the Japanese, Nagata and excellence carriers of §§0.20–0.21;
- the annihilator and Proj base-change theorems;
- algebraic spaces, `SchPseudofunctor` and `IsReplete`;
- thickenings, modifications, regular schemes, vector-bundle degree and Chow groups.

The README claims ownership of these, and `Suggested.lean` redeclares 44 of them under this roadmap's namespace (R01–R03). The other six findings are P3:

- four padding declarations (R04);
- fourteen definitions that no statement uses (R05);
- two locator slips in §2.21 (R06);
- a Tau Ceti name that does not exist at the pin (R07);
- 650 Check labels set as Lean names (R08);
- no stated merge order against the four open pull requests that conflict with this one (R09).

## Previous findings (review of 4ebdad2)

- **R01 (P2), the cycle between §0.12 and ModularCurves 4D: repaired.** No `*Needs:*` line names ModularCurves 4D any more. §0.12 ends "*Needs:* §0.13 (ind-étale algebras); Mathlib `HenselianRing`, … `TauCeti.StrictHenselization.algebra`, `TauCeti.StrictHenselization.lift`" (`README.md:1183–1188`). §0.10 cites "Tau Ceti `TauCeti.StrictHenselization.algebra`" (`:1029–1030`). Scope `:111–116` now says ModularCurves 4D "consumes §0.12 and supplies nothing here".
- **R02 (P3), the nine statement-hygiene hits: repaired.** The gate reports `statement-hygiene=0`. The three `Nonempty` conclusions are renamed `nonempty_*` (`Suggested.lean:906`, `:1039`, `:1228`, `:1640`). `vectorBundleDegree_pullback` uses `f.finrank (genericPoint Y)` (`:1185`; checked in the table). `nodal_codim_two_thickness_three_residual` is deleted. `weil_bound` takes `[Finite k]` and uses `Nat.card k` (`:1661–1668`). `localCohomology_degreeZero` is restated as an existential (`:899`); see R04.
- **R03 (P3), ownership of the recognition predicate: repaired.** "So are the recognition predicate of henselizations and strict henselizations of local rings (§0.12, `IsLocalRing.IsHenselization` …), which ModularCurves Layer 4D consumes" (`README.md:256–259`). The general-base case is reduced to `R_𝔭`, and "no second predicate is introduced for a general base" (`:1171–1174`).
- **R04 (P3), §0.13 restating the pinned ind-étale class: repaired.** "The ind-étale predicate is Tau Ceti's `TauCeti.Algebra.IndEtale R S` … Its API at the pin is not restated here" (`README.md:1247–1253`). All eight names cited there exist at the pin (`TauCeti/RingTheory/Etale/IndEtale.lean:79–132`, `Weakly.lean:101`).
- **R05 (P3), the twelve backticked README-only names: repaired.** All twelve are now italic (`README.md:124`, `:680`, `:1448`, `:1460–1471`, `:1500`, `:1708`, `:3133`, `:3140`). The general class is R08.
- **R06 (P3), two locator slips: repaired.** "(Stacks, Definition 48.28.1 (0E2T))" (`README.md:4692`). 0CDU is gone, and the torsor clause is now cited to §3.6's *picardComponent_torsor* (`:5094–5096`).

## R01 (P2) — scheme Frobenius is defined at the pin, and its headline properties are proved there

**Location.** `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean:24–27`: "§0.29: the properties of absolute and relative Frobenius of a scheme … The pinned Mathlib has no Frobenius endomorphism of a scheme". `README.md:2141–2142` says the same. `README.md:471–472` lists §0.29's Frobenius maps among the "Scheme and site contracts owned here". `Suggested.lean:387–403` declares `SchemeFrobenius.SchemeCharP` and three theorems about it.

**Claim.** The §0.29 headline is not statable at the pins, so the file states only the characteristic-`p` predicate.

**Witness.** At the pinned Tau Ceti:

- `AlgebraicGeometry.Scheme.frobenius` (`TauCeti/AlgebraicGeometry/Frobenius/Basic.lean:98`, a real body);
- `Scheme.Hom.relativeFrobenius` (`Relative.lean:84`);
- `universally_isHomeomorph_relativeFrobenius` (`UniversalHomeomorphism.lean:141`);
- `isIso_relativeFrobenius` for étale `π` (`Etale.lean:107`);
- `finrank_relativeFrobenius_of_smoothOfRelativeDimension`, rank `p ^ n` (`Smooth.lean:97`).

**More witness.** The file's `SchemeCharP` and its theorems are also pinned:

| Suggested.lean | Pinned Tau Ceti |
|---|---|
| `SchemeCharP` | `TauCeti.AlgebraicGeometry.SchemeCharP` (`Scheme/Characteristic.lean:43`, the same stalkwise condition) |
| `schemeCharP_spec_iff` | `SchemeCharP.spec_iff_natCast_eq_zero` (`:117`) |
| `schemeCharP_iff_structureMap` | `.iff_structureMap` (`:132`) |
| `schemeCharP_of_hom` | `.of_hom` (`:112`) |

**Repair, `Suggested.lean`.** Delete the §0.29 item of the module docstring and the four `SchemeFrobenius` declarations. State in their place what the pin lacks, on Tau Ceti's carriers, for example integrality of `Scheme.frobenius`. If nothing is missing, state nothing.

**Repair, README.** Rewrite §0.29 as a consumer of the pinned `Frobenius/*.lean` and `Scheme/Characteristic.lean`, listing the names in "From Tau Ceti". Keep only the missing items as targets. Keep the heading, with one line per old label giving the pinned name: *absoluteFrobenius* → `Scheme.frobenius`, *relativeFrobenius* → `Scheme.Hom.relativeFrobenius`, *iteratedSchemeFrobenius* → `Scheme.iterateFrobenius`, *qPowerFrobenius* → `Scheme.qPowerFrobenius`. EtaleCohomologyFoundations F.0.4 on main cites these labels (its `README.md:250–254`). Move the two §0.29 rows out of the "owned here" table (`:471–472`).

**Checked on the refuting instance.** For `π : 𝔸¹_{𝔽_p} → Spec 𝔽_p`, the pinned `finrank_relativeFrobenius_of_smoothOfRelativeDimension` with `n = 1` gives rank `p`. That is the README's "finite locally free of rank p^d" at `d = 1`.

## R02 (P2) — Layer 0 strands redeclare pinned Tau Ceti carriers and theorems

**Location.** Several Layer 0 strands of `Suggested.lean`: `:93` (§0.3), `:117` (§0.5), `:210–218` (§0.20), `:238–276` (§0.21), `:365–376` (§0.27) and the whole §0.30 strand `:409–505`. The README plans the same objects in §§0.3, 0.5, 0.20, 0.21, 0.27 and 0.30 without citing Tau Ceti. Its table `:473` lists "§0.30 / `NormalSchemes.IsNormalScheme`, … `NormalSchemes.ramificationIdxAt`" as owned here. The Summary (`:16–17`) lists "the henselization of a pair with its universal property" as an end theorem of Layer 0.

**Claim.** These are this roadmap's carriers and targets.

**Witness.** Each row is a pinned Tau Ceti declaration with the same definition or statement. Several have identical binders and docstrings.

| Suggested.lean | Pinned Tau Ceti (`2fd255d9`) |
|---|---|
| `Proj.isPullback_baseChange` (`:93`) | `AlgebraicGeometry.Proj.isPullback_baseChange` (`AlgebraicGeometry/ProjectiveSpectrum/BaseChange.lean:178`, with the maps named). Probe: `⟨_, _, Proj.isPullback_baseChange 𝒜 R'⟩` closes the file's statement under the pinned instance. |
| `PseudoCoherence.IsPseudoCoherentSheaf` (`:117`) | `AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent` (`AlgebraicGeometry/Modules/PseudoCoherent/Basic.lean:81`) |
| `Ring.IsJapanese`, `Ring.IsNagata` (`:210`, `:217`) | `TauCeti.Ring.IsJapanese` (`RingTheory/Japanese.lean:125`, identical binders), `TauCeti.Ring.IsNagata` (`RingTheory/Nagata.lean:65`). Also `IsN1` (`:118`) and `IsUniversallyJapanese` (`UniversallyJapanese.lean:67`). |
| `Excellence.GeometricallyRegular`, `RegularAlgebraMap`, `regularLocus`, `IsGRing`, `IsCatenary` (`:238`–`:270`) | `TauCeti.Excellence.GeometricallyRegular` (`RingTheory/RegularLocalRing/GeometricallyRegular.lean:70`), `RegularAlgebraMap` (`RegularAlgebraMap.lean:54`), `regularLocus` (`Locus.lean:61`), `IsGRing` (`GRing.lean:57`), `IsCatenary` (`RingTheory/Catenary.lean:56`) |
| `FlatAnnihilator.annihilator_flat_baseChange`, `element_annihilator_flat_baseChange` (`:365`, `:372`) | `TauCeti.annihilator_flat_baseChange`, `TauCeti.element_annihilator_flat_baseChange` (`RingTheory/Flat/Annihilator.lean:67`, `:82`) |
| `NormalSchemes.IsNormalScheme`, `.isReduced`, `.isDiscreteValuationRing_stalk` (`:416–435`) | `TauCeti.AlgebraicGeometry.IsNormalScheme` (`AlgebraicGeometry/Scheme/Normal.lean:84`), instance `IsNormalScheme.isReduced` (`:177`), `IsNormalScheme.isDiscreteValuationRing_stalk` (`:203`, the same docstring and tag). Probe: `exact isReduced_of_isReduced_stalk X` closes `.isReduced`. |
| `coheight_eq_one_of_coheight_apply_eq_one`, `coheight_apply_eq_one`, `coheight_apply_eq_one_of_isNormalScheme`, `codimensionOneMap`, `codimensionOneMap_surjective` (`:441–474`) | `AlgebraicGeometry.Scheme.Hom.coheight_eq_one_of_coheight_apply_eq_one` (`Morphisms/CodimensionOne/Basic.lean:72`), `.coheight_apply_eq_one` (`CodimensionOne/FiniteType.lean:103`), `.coheight_apply_eq_one_of_coheight_eq_one` (`CodimensionOne/Normal.lean:99`), `.codimensionOneMap` (`Basic.lean:91`), `.codimensionOneMap_surjective` (`:105`) |
| `ramificationIdxAt`, `ramificationIdxAt_comp` (`:478`, `:485`) | `Scheme.Hom.ramificationIdxAt` (`Morphisms/RamificationIdx/Basic.lean:74`, the same body), `.ramificationIdxAt_comp_of_coheight_eq_one` (`RamificationIdx/Normal.lean:60`, which needs no finiteness of `f` or `g`) |
| `exists_regularSystem_of_quotient` (`:497`) | `Ideal.exists_regularSystem_of_quotient` (`RingTheory/RegularLocalRing/Quotient.lean:98`, the same statement) |

The README-only API of §0.20 and §0.30 is pinned as well:

- `IsJapanese.isN1` and `.of_field` (`Japanese.lean:205`, `:210`);
- `IsN1.of_isIntegrallyClosed` (`:148`), which is the Check `IsN1.test_isIntegrallyClosed`;
- `IsNagata.quotient`, `.localization`, `.of_field` and `isNagata_iff_of_span_eq_top` (`Nagata.lean:86`, `:137`, `:109`, `:171`);
- `IsUniversallyJapanese.of_forall_isIdempotentElem` (`UniversallyJapanese.lean:140`), the idempotent-ring Check of `:1577`;
- `isNormalScheme_iff_forall_affineOpens`, `isNormalScheme_Spec_iff` and `IsNormalScheme.isIntegrallyClosed_of_isAffineOpen` (`Scheme/Normal.lean:153`, `:181`, `:195`);
- `codimensionOneMap_comp`, `_id` and `_finite_preimage_singleton` (`CodimensionOne/Basic.lean:127`, `:138`, `:117`);
- `ramificationIdxAt_pos` (`RamificationIdx/Basic.lean:87`).

The Summary's first end theorem is `TauCeti.Henselization.existsUnique_lift` (`RingTheory/Henselization/Lift.lean:130`), which §0.12 already cites as pinned.

**Repair, `Suggested.lean`.** Delete the redeclared definitions and the theorems already proved at the pin. Restate what stays on Tau Ceti's carriers, importing the modules named above:

- `Ring.IsJapanese.of_complete_local` and `Ring.IsNagata.of_complete_local` on `TauCeti.Ring.IsJapanese` and `TauCeti.Ring.IsNagata`;
- `Excellence.IsQuasiExcellentRing.isNagata` on `TauCeti.Excellence.IsGRing`, `regularLocus` and `TauCeti.Ring.IsNagata`.

Keep `PseudoCoherence.IsPseudoCoherentModule`: AdicEtaleGeometry on main opens it (`AdicEtaleGeometry/Suggested.lean:72`), and it is not the pinned sheaf predicate. Restate `isPseudoCoherentSheaf_iff_affineOpens` with `Scheme.Modules.IsPseudoCoherent`.

**Repair, README.** List every pinned name in "From Tau Ceti" with its file. In §§0.3, 0.5, 0.20, 0.21, 0.27 and 0.30, replace "Define"/"Prove" by consumption of these names, keeping only what the pin lacks. Delete the §0.30 row of the "owned here" table and record §0.30 as a Scope deferral to Tau Ceti. In the Summary, replace the Layer 0 end theorem by one this roadmap proves and the pin lacks, or drop it. Tau Ceti already has part of 09XI (`RingTheory/Henselian/Idempotent.lean:169–179`).

**Checked on the refuting instance.** After the change, `Proj.isPullback_baseChange` is cited and not stated, and `⟨_, _, AlgebraicGeometry.Proj.isPullback_baseChange 𝒜 R'⟩` gives the old existential form, which I elaborated.

## R03 (P2) — the Layers 1–5 carriers redeclare pinned Tau Ceti carriers

**Location.** `Suggested.lean:543`, `:546`, `:553–566` (Layer 1), `:1008` (§2.17), `:1156–1163` (§3.3), `:1247–1253` (§4.1), `:1376–1421` (§§4.11, 4.13) and `:1599–1634` (§5.1). The README defines the same objects in §§1.3, 1.18, 2.17, 3.3, 4.1, 4.11, 4.13 and 5.1, citing no Tau Ceti counterpart.

**Claim.** These are this roadmap's carriers.

**Witness.**

| Suggested.lean | Pinned Tau Ceti |
|---|---|
| `SchemePresheaf`, `SchPseudofunctor` (`:543`, `:546`) | `TauCeti.AlgebraicGeometry.SchemePresheaf` (`AlgebraicGeometry/AlgebraicSpace/Basic.lean:68`), `TauCeti.AlgebraicGeometry.SchPseudofunctor` (`AlgebraicGeometry/Stack/Basic.lean:37`); both identical abbrevs |
| `Spaces.RepresentableDiagonal`, `Spaces.EtaleAtlas`, `Spaces.IsAlgebraicSpace` (`:553–566`) | `TauCeti.AlgebraicGeometry.Spaces.RepresentableDiagonal` (`:74`), `.EtaleAtlas` (`:113`, the same two `MorphismProperty.presheaf` fields), `.IsAlgebraicSpace` (`:195`, sheaf, diagonal, atlas) with `.yoneda_obj` (`:215`), which is the README's *IsAlgebraicSpace.of_scheme* |
| `Proetale.IsReplete` (`:1008`) | `TauCeti.IsReplete` (`CategoryTheory/Limits/Replete.lean:91`, with `epi_π_app` at `:107`) |
| `Curve.isFiniteLocallyFreeOfRank`, `Curve.vectorBundleDegree` (`:1156`, `:1161`) | `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.FixedRank` (`AlgebraicGeometry/VectorBundle/FixedRank.lean:71`), `FixedRank.vectorBundleDegree` (`VectorBundle/Degree.lean:82`, the same `eulerCharBelow k X E 2 − r · eulerCharBelow k X 𝒪 2`). Additivity is at `:150`, under finiteness hypotheses. |
| `Formal.IsThickening`, `Formal.IsFirstOrderThickening` (`:1247`, `:1252`) | `TauCeti.AlgebraicGeometry.IsThickening`, `.IsFirstOrderThickening` (`AlgebraicGeometry/Morphisms/Thickening.lean:69`, `:147`, the same fields), with the §4.1 API (`isThickening_iff_ker_le_nilradical`, `IsFirstOrderThickening.SpecMap_iff`, `isUniversalHomeomorphism` at `:124`) |
| `Formal.IsModification`, `Formal.IsRegular` (`:1376`, `:1409`) | `TauCeti.AlgebraicGeometry.IsModification` (`Morphisms/Modification/Basic.lean:53`, the same dense-open condition), `TauCeti.AlgebraicGeometry.IsRegular` (`Scheme/Regular/Scheme.lean:68`) |
| `Formal.resolution_of_curves` (`:1416`) | `isRegular_normalization_fromSpecStalk_genericPoint` (`AlgebraicGeometry/Normalization/Regular.lean:112`, under `IsLocallyNoetherian`) and the instance `isModification_fromNormalization_fromSpecStalk_genericPoint` (`Normalization/Modification.lean:58`). Together they prove the theorem at the pin. |
| `Chow.cyclesOfDimension`, `RatEquiv`, `ChowGroup`, `cycleClass` (`:1599–1634`) | `TauCeti.AlgebraicGeometry.Chow.cyclesOfDimension` (`AlgebraicGeometry/Chow/Basic.lean:86`, dimension `height x`), `RatEquiv` (`:257`, locally finite families), `ChowGroup` (`:295`), `cycleClass` (`:304`), all for any locally Noetherian `X` |

The headlines `alteration_theorem` and `semistable_alteration_theorem` are stated through `Formal.IsRegular` and the duplicated thickening and modification classes. They therefore do not apply to the library's notions.

**Repair, `Suggested.lean`.**

- Delete the redeclared carriers and `resolution_of_curves`.
- Import the pinned modules, and state `artinBootstrap`, `torsorRepresentability`, `isAlgebraicSpace_pullback`, `alteration_theorem`, `grothendieck_existence` (through `TauCeti.AlgebraicGeometry.IsThickening`), `vectorBundleDegree_pullback`, `nonempty_CH_coprod` and `isReplete_proetale` on the pinned carriers.
- `Proetale.IsReplete` is opened by EnhancedDerivedSheaves on main (`EnhancedDerivedSheaves/Suggested.lean:31`). Delete it together with repointing that file to `TauCeti.IsReplete`, and say so in the README until then.

**Repair, README.** List the pinned names under "From Tau Ceti". Rewrite §§1.3, 1.18, 2.17, 3.3, 4.1, 4.11, 4.13 and 5.1 to consume them, keeping as targets only what the pin lacks (for example *IsAlgebraicSpace.diagonal_locallyQuasiFinite*, `FormallySmooth`, `IsAlteration`, `SNCData`).

**Checked on the refuting instance.** For `V(xy) ⊂ 𝔸²_k`, `IsStrictNormalCrossings` stated with the pinned `IsRegular` holds with the same components (computed in the table).

## R04 (P3) — four padding declarations in `Suggested.lean`

**Location.**

- `Suggested.lean:897`, `localCohomology_degreeZero`: "∃ f : (localCohomology I 0).obj M ⟶ M, Function.Injective f.hom ∧ Set.range f.hom = …".
- `:1368`, `strictTransform_supportComparison_affine`.
- `:1460`, `Formal.DeJong.node_local_structure_dvr`.
- `:1478`, `node_local_structure_dvr_nonzero_of_generic_smooth`.

**Claim.** These are headline statements.

**Witness.**

- `localCohomology_degreeZero` is the degree-zero boundary case. As restated, it no longer names the map its docstring describes (`φ ↦ φ 1`). For `M = ℤ/4 ⊕ ℤ` and `I = (2)`, the inclusion composed with `−1` on `ℤ/4` also satisfies it.
- `strictTransform_supportComparison_affine` follows from Mathlib's `Ideal.exists_pow_le_of_le_radical_of_fg` in eight lines. I elaborated that proof.
- `node_local_structure_dvr` is `IsDiscreteValuationRing.eq_unit_mul_pow_irreducible`, which the README's own contracts already list (`README.md:330`), plus the substitution `u = εu'`.
- `node_local_structure_dvr_nonzero_of_generic_smooth` excludes the boundary case `a = 0`.

**Repair.** Delete the four from `Suggested.lean`. The README keeps them as targets (§2.7, §4.11, §4.18).

## R05 (P3) — fourteen definitions that no statement uses

**Location.** `Suggested.lean`:

- `:279` `Excellence.IsExcellentRing`;
- `:318` `Scheme.Hom.etaleSiteComp`;
- `:607` `Spaces.smallEtale` (and its instance);
- `:682` and `:686` `Groups.IsInvariant`, `Groups.IsCategoricalQuotient`;
- `:713`, `:723` and `:740` `Stacks.StackInGroupoids`, `ValuativeLift`, `ValuativeLift.reidentify`;
- `:822` `Scheme.etaleAdjunction`;
- `:852` `Scheme.proetalePushforward`;
- `:986` `ElementaryDistinguishedSquare.toSquare`;
- `:1047` and `:1056` `Coherent.DQCohPlus`, `DQCohPlus.toDerived`;
- `:1651` `Chow.HasResolutionProperty`.

**Claim.** These are definitions a headline needs.

**Witness.** Each name occurs in no theorem or instance of the file. A reference count over all 172 declarations finds them unused, or used only by each other. `proetalePushforward` is what the module docstring offers in place of the unstatable §2.10 headline ("the file states `ν` and `ν_*`", `:32–34`). That is a substitute, which the rules exclude.

**Repair.** Delete them, and drop their backticks in the README's *Lean:* lines and the "owned here" table (`README.md:475–478`). The README keeps them as targets.

## R06 (P3) — §2.21 locators

**Location.**

- `README.md:4809–4812`: "Define `NormalizedDualizing A ω` for a Noetherian local ring: `RHom_A(κ, ω) ≅ κ[0]` … (Stacks, Lemma 47.16.1)".
- `:4815–4818`: "the properties (1)–(9) of Stacks, Section 48.19 …: … composition, flat base change, the formulas for open immersions, finite morphisms … and smooth morphisms".

**Claim.** Lemma 47.16.1 defines normalized dualizing complexes, and Section 48.19's list contains flat base change and the open-immersion and smooth formulas.

**Witness.**

- Lemma 47.16.1 (0AX1) says a finite local map carries a normalized dualizing complex to one (`stacks-project`, book `5b3a46c2` line 193170). Normalization is defined in Section 47.16's opening paragraph, 0A7M (line 193164).
- Section 48.19's list (lines 196939–196966) has no flat base change and no open immersion, and its item (9) is for smooth proper `f`.

**Repair.**

- Cite "Stacks, Section 47.16 (0A7M) and Lemma 47.15.12 (0A7L)" for the definition, and keep 0AX1 for `finite_local`.
- Cite flat base change to Lemma 48.18.1 (0E9U) and étale morphisms (open immersions included) to Lemma 48.18.2 (0FWI).
- Restrict the smooth formula to smooth proper `f` (48.19 (9), Lemma 48.15.7 (0BRT)), or give a source for smooth separated `f`.

## R07 (P3) — a Tau Ceti name that does not exist at the pin

**Location.** `README.md:194–195`: "Genus-one curves with a degree-one bundle have a rational point: `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.exists_linearlyEquivalent_ofPoint_of_genus_eq_one`". The same name is at `:5121`, and unqualified at `:5096`.

**Claim.** The scheme statement is pinned, and Scope defers it.

**Witness.** No declaration of that name exists at `2fd255d9`. The only one is `TauCeti.Divisor.exists_linearlyEquivalent_ofPoint_of_genus_eq_one` (`TauCeti/FieldTheory/FunctionField/Elliptic/Basic.lean:97`): a degree-one divisor of a genus-one function field is linearly equivalent to a place of degree one.

**Repair.** Cite that name and file, and describe it as the function-field form. In Scope, say the scheme form is §3.2's *genus_one_curves*, owned here.

## R08 (P3) — 650 Check labels are backticked Lean names

**Location.** For example `README.md:2468`: "- `EtaleEquivRel.test_diagonal`: the diagonal …". `:298` gives the README's own rule: italics only "inside the strands of `Suggested.lean`".

**Claim.** README-only names outside the strands may be backticked.

**Witness.** I parsed every `**Checks.**` block: 650 of the 856 Check bullets begin with a backticked identifier, and none of them is declared in `Suggested.lean`. Under the house rules, a Check names no Lean counterpart, and a backticked name of this roadmap's own claims a declaration. API names in prose show the same pattern (`EtaleEquivRel.ofAtlas`, `Stack.stackification`, `Spf.discrete_eq_spec`).

**Repair.** Drop the labels or set them in italics. Italicise README-only API and target names everywhere, and rewrite `:293–300` to state the rule for the whole README.

## R09 (P3) — no stated order against four conflicting open pull requests

**Location.** The pull request description, and the folder as a whole.

**Witness.** The overlap facts list #1276, #1807, #1808 and #1854 as changing this roadmap, each conflicting with this head in `README.md`; #1276 and #1808 also conflict in `Suggested.lean`. The description names none of them and states no order.

**Repair.** Say in the description which of these is rebased on which before merging. #1276 is by the same author and also repairs this folder. Do not restate what the other changes. For example: this pull request merges after #1276 and rebases on it, and #1807, #1808 and #1854 rebase on whichever lands.

## Verified sound

**Gate, dependency check, elaboration.**

- The worker's gate at 16d66b3: all checks 0, `build=0`, "Every check passed".
- `PROGRESS.md`, `STATUS.md` and `metadata.toml` are the standard roadmap files (JacobianChallenge on main has the same set; `stray-files=0`).
- The dependency check (`gate --depcheck … --movable`) printed `depcheck: 237 roadmaps, 2341 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` exits 0 with 76 `declaration uses sorry` warnings and no other diagnostic (36 s). The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`.

**One-tactic probe.** I replaced each of the 76 `sorry`s, in a scratch copy, by `first | rfl | infer_instance | simp | decide | trivial | exact ⟨inferInstance⟩`. The run hit Lean's error cap, so I re-ran the 22 declarations after line 1100.

- Only `universalHomeomorphismEtaleEquivalence_functor` (`:346`) closes, by `rfl`. This is the previous reviews' settled disposition: #1276 deletes it, still so at its current head 7a1c656.
- Two further probes closed `IsNormalScheme.isReduced` (one library lemma) and `strictTransform_supportComparison_affine` (eight lines); see R02 and R04.

**Signatures.** I compared the elaborated types of all 173 declarations, from the worker's signature transcript at this head, with their README statements.

- The five "looks dropped `[Category.{u} A]`" flags (`etalePushforward`, `isRightAdjoint_etalePushforward`, `etalePullback`, `etaleAdjunction`, `preservesFiniteLimits_etalePullback`) are false positives: each carries `Category.{u_1, u_2} A`, with the scheme universe `u_1`.
- The seven declarations this commit changed elaborate as their README statements say. `vectorBundleDegree_pullback` uses Mathlib `Scheme.Hom.finrank`: `RingHom.finrank` is `Module.rankAtStalk` (`Mathlib/RingTheory/Flat/Rank.lean:139`), so at the generic point it is `[K(X) : K(Y)]`.

**Library declarations opened at the pins.** Beyond the R01–R03 tables:

- Mathlib: `localCohomology` (`Algebra/Homology/LocalCohomology.lean:173`, defined through ideal powers, so `localCohomology_degreeZero` holds for every ring); `Scheme.Hom.finrank` (`AlgebraicGeometry/Morphisms/FlatRank.lean:89`); `IsAzumaya` (`Algebra/Azumaya/Defs.lean:60`); `IsDedekindDomain.flat_iff_torsion_eq_bot` (`RingTheory/Flat/TorsionFree.lean:137`, the ring form of 0AUW, so the scheme statement `flat_over_dedekind` is not a duplicate); `Ideal.exists_pow_le_of_le_radical_of_fg`.
- Tau Ceti: the henselization and ind-étale API cited by §§0.12–0.13 (`RingTheory/Henselization/*`, `RingTheory/Etale/IndEtale.lean:68–132`, `StrictHenselization/Lift.lean:105`); `TauCeti.Divisor.exists_linearlyEquivalent_ofPoint_of_genus_eq_one` (R07).

**Cross-roadmap citations resolved.**

- On main: ModularCurves 4D, 0B–0G, 7D, 9D; JacobianChallenge A–F; StableReduction 1–4; AlgebraicVectorBundles L0B (`README.md:228`) and L0C (`:254`); AlgebraicCurves 7, 12B.0, 12E (`:335`, `:901`); GrothendieckEulerForms Layers 2–3 (`:352`, `:452`); QuadraticFormInvariants 7B (`:325`).
- EtaleCohomologyFoundations on main declares the `VanishingCycles.*` names this README lists as its consumers (six of the eight; `curveEndomorphismTrace` and `etaleTraceFormulaFinite` are InverseGalois's). Its F.0.4 consumes §§0.23a and 0.29 (see R01).
- No roadmap the brief forbids as a supplier is cited, and AbundanceStatement is gone. The worker's citation list reports no cross-roadmap citation found nowhere.

**Overlap facts.**

- No id this README cites is dropped by an open pull request, and none is defined only by an open revision. This pull request drops no id that others cite: `spaceNakaiMoishezon`, `c1_degree_curve` and `muEtale`, which #1754 and #1891 cite, are present.
- The four conflicting pull requests are R09.
- Closest in vocabulary, read at their heads: #1840 PurityForFlatCohomology, #1796 AdicCoefficientsAndComparisonsPartII, #1754 AlgebraicModuliForArithmeticGeometryPartII and #1891 EtaleCohomologyFoundations all consume this roadmap by section and own nothing it owns. The gaps #1796 and #1754 declare on it are for this roadmap's own job.
- `roadmaps grep` finds `strictLocalRing`, `IsHenselization`, `NonabelianH1`, `IsNisnevichCovering`, `etalePushforward` and `quotientSheaf` in this folder only.

**Seeded source sample.** The Stacks text read is the book PDF in the sources cache (`5b3a46c2`, version ed88ff78), cited as `stacks-project`. No README locator is labelled unverified.

| Target | Locators checked (book line) | Outcome |
|---|---|---|
| 0.20 | 032F 41455, 032M 41563, 032N 41567, 032G 41473, 032I 41483, 032O 41580, 032L 41516, 032W 41730, 0333 41616, 032R 41680, 0334 41868, 0335 41948, 032U 41719, 032T 41713, 032V 41721, 03GH 41688, 09E1 41960, 07QV 63582, 0AVK 121810 (its five hypotheses hold for `Spec L → X`), 032S 41709 | All as cited |
| 1.3 | 025Y 252169, 65.6.2 (025Z) 252197 | As cited |
| 1.9 | 03HL 256399, 03HI 256923, 03ZM 260055, 02X5 252788, 0AHR 253396, 0AHS 253413 | As cited |
| 1.19 | 02ZW 322257, 03YJ (Section 94.10) 322406, 026O 322589, 04T2 322802, 03YO 322627, 06N3 337969 | As cited |
| 2.1 | 08J6 93050, 072Z 93009, 03F3 92363, 03YU 92375, 072W 92416, 0730 93032 | As cited |
| 2.3 | 03AH 92221, 03AI 92234, 03AJ 92237 | As cited |
| 2.9 | 03DR (Lemma 35.8.8), 03PK (Section 59.28) 229281; "Lemma 35.8.1" is cited by number only | As cited |
| 2.11 | 03P8 229140, 040N 229322, 040O 229344, 040Q 229385, 03PL 229288, 0A3J (Section 59.63) 232345, 0A3K 232352, 03QN (Section 59.55) 231712 with 03QO, 03QP 231733, 0959, 0EYP | As cited |
| 2.18 | 06YZ 145828, 08DT 145837, 06Z0 145906, 08J7 95760, 0B6E 95900, 08DX 145997, 0A6H 146898, 0ATN 146928, 08DW 145968, 08D5 146010, 08DZ 146074, 09IP (Section 36.15) 147555, 08ET 148091, 08E4 146794 | As cited; parenthesised tags are section tags for ranges |
| 2.21 | 0A7B 193020, 0A87 194506, 0A86 194481, 0AX1 193170, 0A7M 193164, 0AU3 (Section 48.19) 196934–196966, 0E9U 196853, 0FWI 196880, 0BRT 196231 | Two slips (R06) |
| 2.23 | `kings-sprang` lines 3754–3794 (arXiv 1912.03657v4): Definition A.1 p. 79, Definitions A.2–A.3 and (A.1.1) p. 80 | As cited; Grothendieck 1957 under Not verifiable |
| 3.2 | 0C1C 211975, 0C1D 211993, 0C1F 212007, 0AYZ 138457, 0C6M 211702, 0C6T 211709, 0C6N 211748 (Gorenstein, given by smoothness), 0E3B 213383, 0AYY 138432, 0E3A 213362, 0E3C 213398, 0E3D 213411, 0H2V 213417 (geometrically integral, given by smooth and geometrically connected), 0B5E 211394 | As cited; Tau Ceti name drift (R07) |
| 4.1 | 04EX 150881, 02H0 152422, 02H8 151257, 02HG 151660, 02HH 152450, 02H4 152471, 0D0F 152550, 02H6 152481, 02HM 151764, 02HE 151358, 00TN 38127, 04FG 151783, 02H5 151815, 04FH 151830, 04FJ 151846, 04FK 151852, 02FQ 85818, 0D0E 152541, 06B5 152532 | As cited |
| 4.8 | 0AIZ 304815, 0AMC 304827, 0GBA 304861 ((2) is `Spf Â`), 087X (Lemma 30.23.2) 125534, 0881 125585, 087W 125514 | As cited |
| 4.17 | de Jong 1996 (Numdam copy in the cache, printed page = 49 + page index): 2.3–2.4 lines 174–189 (p. 55), 3.1 line 470 (p. 62) | As cited; the Lean `IsStrictNormalCrossings` is equivalent to 2.4 a)–c) (table) |

**Adversarial table.** It covers the sampled targets, the headlines, and every statement a finding touches.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| §0.20 `Ring.IsJapanese`, `Ring.IsNagata` | `ℤ`; zero ring; DVR of 09E1; `MvPolynomial ℕ ℚ`; eventually constant `𝔽₂`-sequences `E` | `ℤ` Dedekind of characteristic 0: N-2 by 032L, and `ℤ/p` are fields, so Nagata. Zero ring: Noetherian with no primes, Nagata. 09E1: N-1 not N-2, which excludes the model "Japanese = N-1". `MvPolynomial ℕ ℚ` is not Noetherian. In `E`, `e² = e`, so any image in a domain is `𝔽₂` and `E` is universally Japanese, while the finitely supported ideal is not f.g. | Pass; carriers are Tau Ceti's (R02) |
| `nagata_normalization_finite` (0AVK) | `X` integral Nagata, `Spec L → X`, `L/K(X)` finite | quasi-compact (one-point source), quasi-separated (affine source), `κ(x) = L` f.g. over `K(X)`, reduced | Pass |
| `Ring.IsNagata.of_complete_local` | `k[[t]]`; `ℤ_(p)` | complete Noetherian local, so Nagata (032W); `ℤ_(p)` is not complete and not covered; `IsAdicComplete` includes Hausdorff | Pass |
| §1.3 `IsAlgebraicSpace` and its Checks | `h_X`; presheaf `Spec L / Gal`; constant `{0,1}` | `h_X` algebraic (025Z). On `Spec L ⊔ Spec L`, `(id,id)` and `(id,σ)` agree componentwise, but `σ∘(id,id) = (σ,σ) ≠ (id,σ)`: not separated, equality presheaf not a sheaf, diagonal not representable. Constant presheaf has value `{0,1}` at `∅`, not a point. | Pass |
| §1.9 Checks | doubled origin; `𝔸¹/ℤ` in characteristic 0 | `U ∩ V = 𝔸¹∖0` is quasi-compact and the diagonal is not closed: quasi-separated, not separated; `R = ⊔_{n∈ℤ} 𝔸¹ → 𝔸¹×𝔸¹` is not quasi-compact: not quasi-separated | Pass |
| §1.19 Checks | `Bμ_p` over `𝔽_p`; `BG` finite constant; `B𝔾_m` | `μ_p = Spec 𝔽_p[t]/(t−1)^p`, `Ω ≠ 0`, diagonal not unramified, so not DM (06N3); `BG` has an étale atlas; `𝔾_m` is not unramified | Pass |
| §2.1 `etalePushforward_reject_exact` | `𝔾_{m,k} → Spec k`, `k = k̄`, `n ∈ k^×` | `R¹f_*μ_n = k[t,t⁻¹]^×/n = (k^×·t^ℤ)/n = ℤ/n ≠ 0` | Pass |
| §2.1 `test_pullback_not_iso` | `Spec ℂ → Spec ℝ`, `ℤ/2` | `H¹(ℝ, ℤ/2) = ℤ/2 → H¹(ℂ, ℤ/2) = 0` | Pass |
| §2.3 `NonabelianH1` Checks | `ℤ/2` on `(Spec ℝ)_ét`; `GL_n`, Zariski, `A` local; `S₃` | `Hom(ℤ/2, ℤ/2)` gives two classes; every Zariski cover of local `Spec A` contains `Spec A`, one class; `(12)(13) = (132)` has order 3 | Pass |
| §2.9 `mu S n` Checks | `μ_p` over `𝔽_p`, reduced `R`; `𝔽_p[ε]/(ε^p)`; `μ_1`; `μ_2(ℚ)` | `t^p = 1 ⇒ (t−1)^p = 0 ⇒ t = 1`; `(1+ε)^p = 1+ε^p = 1`; trivial; `{±1}` | Pass |
| §2.11 Kummer, Artin–Schreier, `Etale.artinSchreier_vanishing` | `Spec K`, characteristic `p`, `n = p`; `n = 1`; `Spec 𝔽_p[t]`; `X = ∅` | fppf `H¹ = K^×/K^{×p}`, while `μ_p(L) = 1` for reduced `L` makes étale `H¹ = 0`; `μ_1` trivial; `H^q = 0` for `q ≥ 2` (0A3K (1)); `∅` excluded, since the zero ring is not `CharP` at a prime | Pass |
| §2.18 Checks; `DQCoh.nonempty_affineEquiv` | `ℙ¹_k`, `O(−2)`; `(ℤ/2)~ ⊗^L (ℤ/2)~`; `⊕_n k[t]`; `A = ℤ`, `M = ℤ/2` | `H⁰ = 0`, `H¹ = k`, so `k[−1]`; `Tor₁^ℤ = ℤ/2` in degree `−1`; `(t^{−n})_n` misses the image of `(∏A)_t` at coordinate `r+1`; `M~` is supported at `(2)` with quasi-coherent cohomology; any model of `D(A)` | Pass |
| §2.21 dualizing complexes | DVR `R`; regular local of dimension `d`; `k[x,y]/(x²,xy)` at origin | `Ext⁰(κ,R) = 0`, `Ext¹ = κ`: `R[1]` normalized, `R[0]` not; `Ext^d(κ,A) = κ`: `A[d]` normalized; dimension 1, depth 0: cohomology in degrees `−1, 0` | Mathematics passes; locators R06 |
| §2.23 Checks | `ℤ/2` on a point, `ℤ_sign` vs `ℤ_triv`; `Γ = ℤ`, Ind vs Coind | `Hom_Γ(ℤ_sign, ℤ_triv) = {a : −a = a} = 0`; `ℤ[ℤ]` has countable rank, `Map(ℤ,ℤ)` is uncountable | Pass |
| `Curve.genus_of_finite_etale` | double étale cover of genus 2; `n = 1`; covers of `ℙ¹` | `g_X − 1 = 2·1`, `g_X = 3`; `g_X = g_Y`; `g_X = 1 − n ≥ 0` forces `n = 1`; `χ(O_X) = nχ(O_Y) + deg f_*O_X`, and trace self-duality gives `deg = 0` | Pass |
| `Curve.cohomologyDim_one_eq_zero_of_degree_gt` | `g = 0`, `O(−1)`; `g = 1`, `O(P)`; `K_X` | `−1 > −2`: `h¹ = 0`, `h⁰ = −1+1−0 = 0`; `h⁰(O(P)) = 1`; `deg K = 2g−2` is not `>`, and `h⁰(K) = g ≠ g−1` | Pass |
| §3.2 *genus_one_curves*, conic Check | `E` with `O(O)`; `x²+y²+z²` over `ℝ` | degree-one sheaf gives a point (0E3B); `Pic = 2ℤ`, no point | Pass; R07 |
| §4.1 classes and Checks; `smooth_iff_formallySmooth` | `Spec k → Spec k[ε]`; `Spec k → Spec k[x]/(x³)`; `Spec k → 𝔸¹` | `(ε)² = 0`; `(x)² = (x²) ≠ 0`: a thickening, not first order; not surjective, so not a thickening; the lift `t ↦ ε` is impossible, so not formally smooth, though locally of finite presentation | Pass; carriers are Tau Ceti's (R03) |
| §4.8 Checks | `k[x] → k[[x]]`; `A = k[x₀, x₁, …]`, `I = 0` | `1/(1−x) = Σxⁿ ∉ k[x]`: the completion functor is not full; `A/(x_i)` is finite, not finitely presented | Pass |
| §4.17 `IsStrictNormalCrossings` | `V(xy) ⊂ 𝔸²`; `V(xy(x−y))`; nodal cubic; repeated component | `(x)(y) = (xy)`, strata of codimension 1, 1, 2: SNC. Triple point: codimension 2 ≠ 3, not SNC. Cubic: one component, singular at the node, not SNC. Repeated `D_i`: `D_{i,j} = D_i` has codimension 1 ≠ 2, excluded. Agrees with de Jong 2.4. | Pass |
| `weil_bound` | `ℙ¹_{𝔽₂}`; `y²+y = x³` over `𝔽₂`; `y²+y = x³+x` | `|3−3| = 0 ≤ 0`; points `(0,0),(0,1),∞`: `0 ≤ 2√2`; five points: `|5−3| = 2 ≤ 2.83` | Pass |
| `alteration_theorem` | `X = Spec k`, `Z = ⊤` | `X₁ = X̄₁ = Spec k`, `B = ⊤`, support `∅ = ∅ ∪ ∅`; `hZ : Z ≠ ⊥` excludes all of `X` | Pass; `IsRegular` should be Tau Ceti's (R03) |
| `semistable_alteration_theorem` | `R = ℤ_p`, `X = ℙ¹_R`, `Z` the special fibre | `R₁ = R`, `X₁ = X̄₁ = X`, `H = ∅`: smooth special fibre, geometrically irreducible generic fibre | Pass |
| `grothendieck_existence`; `algebraize_hom` | `X = Spec A`, `I` the closed fibre; `X = Y`, `g_n = id` | compatible f.p. `A/I^{n+1}`-modules, `M = lim M_n` finite (087W); `G = id`, unique by separatedness | Pass |
| `artinBootstrap`, `torsorRepresentability` | `F = U = h_X`, `a = id`; `P = G` | algebraic space; trivial torsor | Pass |
| `exists_linear_normalization` | `n = 0`; `k[X,E]/(E²)`; `𝔽₂`, `XY(X+Y)` | `A = k`, `d = 0`; `d = 1` with basis `1, E`; finite field excluded by `[Infinite k]`, and each linear form divides `XY(X+Y)` | Pass |
| `local_henselization`; `Scheme.isSepClosed_residueField_strictLocalRing` | `R = k`, `ℤ_(5)`; `Spec 𝔽_p`, `Ω = 𝔽̄_p` | three fields from the pinned API, not one tactic (probe); strict local ring `𝔽̄_p` | Pass |
| `isPseudoCoherentSheaf_iff_affineOpens` | DVR `R`, `j_!O_{Spec K}` | sections `0` and `K` are pseudo-coherent, but the sheaf is not quasi-coherent: the QC clause is needed | Pass; carrier R02 |
| `flat_over_dedekind` | `ℤ[x]/(2x)`; `ℤ[x]/(x²−4)` | component `V(2)` does not dominate and `x` is 2-torsion, so the hypothesis is needed; reduced, both components dominate, torsion-free, so flat | Pass |
| `unibranch_finite_components` | `Spec(ℚ × ℚ(i)) → Spec ℚ` | two clopen points, each finite étale | Pass |
| `vectorBundleDegree_pullback` | `z ↦ z²` on `ℙ¹`, `E = O(1)` | `f.finrank η = [k(z):k(z²)] = 2`; `deg O(2) = 2 = 2·1` | Pass; carrier R03 |
| `brauer_functionField_curve_trivial` | `k(t)`; an algebraic closure of `k(t)` | 03RD with 03RC; `Br` of a directed union of function fields is the colimit, `0` | Pass (wider than 03RD, as the *Lean:* line `:4317` says) |
| `nonempty_CH_coprod`; `nonempty_lineBundleClass_spec_mulEquiv_pic` | `∐_ℕ Spec κ`, `k = 0, −1`; `ℤ`, `ℤ[√−5]` | `∏ℤ` and `0` on both sides; `Pic = 0`, `ℤ/2` on both sides | Pass |
| `SchemeCharP` and its three theorems | `∅`; `Spec ℤ/6`, `p = 2` | both sides vacuous; the stalk `𝔽_3` has `2 ≠ 0` and `2 ≠ 0` in `ℤ/6`, so both sides false | True; pinned (R01) |
| §0.29 Frobenius headline | `𝔸¹_{𝔽_p} → Spec 𝔽_p` | pinned rank theorem gives `p^1` | Statable and proved at the pin (R01) |
| `Proj.isPullback_baseChange` | elaboration probe | `⟨_, _, Proj.isPullback_baseChange 𝒜 R'⟩` closes it | Pinned (R02) |
| `IsNormalScheme.isReduced`; `coheight_*`; `ramificationIdxAt_comp`; `exists_regularSystem_of_quotient` | probe; `z ↦ z²` and `z ↦ z⁴` on `𝔸¹` at `0`; `k[x,y]_{(x,y)}`, `I = (y−x²)` | one library lemma; coheight 1 on both sides; `e = 4 = 2·2`; generators `x, y−x²`, `c = 1` | True; pinned (R02) |
| `resolution_of_curves` | `Spec k[t², t³]` | normalization `k[t]`, regular, finite, iso over `D(t²)` | True; pinned (R03) |
| `localCohomology_degreeZero` | `ℤ/4 ⊕ ℤ`, `I = (2)` | the torsion is `ℤ/4`; `ι` and `ι∘(−1)` both satisfy the existential | True; padding (R04) |
| `strictTransform_supportComparison_affine` | elaboration probe | eight lines from `Ideal.exists_pow_le_of_le_radical_of_fg` | True; padding (R04) |
| `node_local_structure_dvr`, `…_nonzero_of_generic_smooth` | `a = 0`; `a = 3·7²` in `ℤ_(7)` | `a = ε π^n` by the listed Mathlib lemma, `u ↦ εu'`; at `a = 0` the Jacobian `(v, u)` of `uv` vanishes at the origin | True; padding (R04) |

**Settled, not re-raised.** The previous reports' dispositions rest on #1276 and still hold at its current head 7a1c656:

- the JacobianChallenge cycle (R01 of the review of 18d3246);
- the `rfl`-closing `universalHomeomorphismEtaleEquivalence_functor`, absent from #1276's `Suggested.lean`.

## Not verifiable

- Grothendieck 1957 (Tôhoku), Chapter V §5.1, Proposition 5.1.1, p. 196 (§2.23): not in the sources cache and not fetched in this round. The Kings–Sprang locators were read.
- The equation tag "(30.23.3.1) (0880)" (§4.8): the PDF extraction of the Stacks book does not show it. Lemma 30.23.4 (0881) refers to that functor.
- The manifest key `stacks-project` caches only the Stacks index page (`6d2ec1c3`). The book text read is the cached `book.pdf` (`5b3a46c2`, version ed88ff78).
- The brief lists `de-jong-1996` as uncertified. A Numdam copy is in the cache (`9e4e7dab`) and is what I read.
- I did not re-read the locators outside the seeded sample. That includes Fulton 1998, Hartshorne 1977, Poonen 2017 and Cadman 2005, which the previous review also left unread.

## Source issues

- none
