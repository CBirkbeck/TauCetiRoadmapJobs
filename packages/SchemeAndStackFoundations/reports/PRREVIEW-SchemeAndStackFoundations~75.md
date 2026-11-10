# Review of SchemeAndStackFoundations (pull request #1656 at 1bfff38)

**Verdict:** needs changes

This is a full review of the repaired head. The folder changed by 1030 README lines since `e053553`; `Suggested.lean` did not change. No file outside the folder differs from `origin/main` (merge base `eaf17b10`). The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with only `sorry` warnings. Four of the previous review's five findings are repaired; R02 (italics) is partly repaired.

Seven findings remain, two of them blocking:

- Layer 0 still plans as targets, under "specified in this README only" or "Prove what the pin lacks", results that the pinned Tau Ceti proves (§§0.2, 0.4, 0.7, 0.8, 0.10, 0.12, 0.14, 0.20). The Scope still claims the catenary, Cohen–Macaulay, Nagata and henselization packages as owned here (R01).
- §0.12's recognition predicate `IsLocalRing.IsHenselization` is a second owner of ModularCurves Layer 4D's `IsHenselization` on main. The README says three times that ModularCurves 4D consumes §0.12, but on main ModularCurves supplies this roadmap and consumes nothing from it (R02).
- `QCoh.higherDirectImage_vanishing` is the pinned `AlgebraicGeometry.Scheme.Hom.exists_subsingleton_cohomology_of_isAffine` and closes with one `exact` (R03).
- Three pinned names cited in the rewritten §0.17 do not exist under those names (R04).
- README-only names are still set in backticks, and some pinned names are set in italics (R05).
- Two §2.19 locators are wrong (R06), and one §3.7 locator is wrong (R07).

## Previous findings (review of e053553)

- **R01 (P2), depth, Cohen–Macaulay and Serre carriers planned: repaired.** §0.17 opens "Depth, Cohen–Macaulay modules and rings, and Serre's conditions are Mathlib's and Tau Ceti's. This subsection consumes them … and keeps as targets only what the pins lack" (`README.md:1500–1502`). It keeps the single target *satisfiesSerreS_two_iff_hartogs* and gives the old → new dictionary (`:1611–1630`). §0.18 opens "Cohen–Macaulay module sheaves and schemes are Tau Ceti's" (`:1674`), and §4.13 cites `TauCeti.forall_isDomain_and_isIntegrallyClosed_iff_satisfiesSerreR_one_and_satisfiesSerreS_two` (`:6334`, at `SerreCondition/Normal.lean:214`). The "From Tau Ceti" list names the files (`:475–487`). I checked 132 of the cited names in Lean (§§0.12, 0.17, 0.18, 0.30); three are wrong (R04). The Scope sentence for §0.19 is repaired (`:253–255`). The Layer-0 "This roadmap owns" paragraph is not (R01 below).
- **R02 (P3), backticked README-only names: partly repaired.** 246 spans were italicised, but at least 20 README-only names are still backticked, and four pinned names are italicised (R05).
- **R03 (P3), §2.21 strand: repaired.** "The strand `Coherent` of `Suggested.lean` contains `D_QCoh(O_X)` and the affine equivalence of §2.18; this subsection is specified in this README only" (`:5001–5002`). This matches `Suggested.lean`.
- **R04 (P3), Milne AV pages: repaired.** §3.6 now reads "Remark 1.4 (a)–(b), p. 86; Theorem 1.6, p. 88; Remarks 1.10–1.12, pp. 89–90; Propositions 1.13–1.14, p. 90" (`:5557–5558`). In `milne-av` the printed folio is the extraction page minus six: "85" closes extraction page 91 (line 3473), and "86 CHAPTER III" opens page 92 (line 3475). Remark 1.4 is at line 3491 (p. 86), Theorem 1.6 at 3582 (p. 88), Remarks 1.10–1.12 at 3626, 3647 and 3654 (pp. 89–90), and Propositions 1.13–1.14 at 3666 and 3677 (p. 90).
- **R05 (P3), order against the conflicting pull requests: repaired.** The description's merge-order paragraph now states "#1276 → **this pull request** → #1807 → #1808 → #1854" for the shared folder. The stale sentences (the module `LinearNoetherNormalizationTargets`, "Existing README content is preserved") remain. The repair report answered them as outside the package ("the worker rewrites it"). That reason is correct, so I treat it as settled and do not re-raise it.

## R01 (P2) — Layer 0 plans as targets what the pinned Tau Ceti proves, and the Scope claims the pinned packages

**Location.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1233–1247`: "Prove *isNeighbourhood_self* …, *isNeighbourhood_localization* …, *isNeighbourhood_tensor* … *extended_le_jacobson*"; `:1228–1229`: "the other lemmas of this subsection are specified in this README only". Also `:1132–1136`, `:1771`, `:667`, `:758`, `:924`, `:1070`, `:1426`, and `:57–59`: "This roadmap owns … henselization of pairs, the catenary, Cohen–Macaulay, Nagata and excellent packages".

**Claim.** These are this roadmap's targets: §0.20's list is introduced as "what the pin lacks", and §0.12's lemmas and §0.10's predicates are "specified in this README only".

**Witness.** Each item below is declared at Tau Ceti `2fd255d9` with the stated content. I opened each file, and the names marked † elaborate in a scratch `#check` file.

| README target | Pinned declaration (Tau Ceti `2fd255d9`) |
|---|---|
| §0.2: "Prove … `p` is of finite type, … finite, integral, a closed immersion … iff …" (`:667–672`) | `relativeSpec_finiteType_iff`, `_finitePresentation_iff`, `_finite_iff`, `_etale_iff`, `_integral_iff`, `_isClosedImmersion_iff` (`AlgebraicGeometry/RelativeSpec/MorphismProperties.lean:69–132`); `isAffineHom_relativeSpecToBase` (`RelativeSpec/SubalgebraPresheaf.lean:238`) |
| §0.4 *qcoh_extension*, parts (1) and (2) of 01PE (`:758–763`) | `AlgebraicGeometry.Scheme.Modules.exists_isQuasicoherent_restrict_iso` and `exists_mono_restrict_iso_of_isQuasicoherent` (`Modules/Quasicoherent/Extension.lean:51`, `:62`; they need only `[QuasiCompact j]`, not `X` qcqs) |
| §0.7 *topologicalKrullDimAt_eq_stalk* and the first two clauses of *dimension_theory_finiteType* (`:924–930`) | `TauCeti.AlgebraicGeometry.topologicalKrullDimAt_eq_ringKrullDim_stalk_add_toNat_trdeg_residueField` (`Scheme/LocalDimension.lean:105`, `dim_x X = dim O_{X,x} + trdeg κ(x)`), `topologicalKrullDimAt_eq_iSup_toNat_trdeg_residueField`, `topologicalKrullDimAt_eq_iSup_topologicalKrullDim_irreducibleComponents` |
| §0.8 *etale_coordinates* (054L, `:1070–1072`) | `AlgebraicGeometry.SmoothOfRelativeDimension.exists_etale_affineSpace` and `Smooth.exists_etale_affineSpace` (`Morphisms/Smooth/EtaleCoordinates.lean:86`, `:98`: an affine open `V ∋ x` with `V → 𝔸^n_S` étale over `S`) |
| §0.10 *IsLocalRing.IsUnibranch*, *IsLocalRing.IsGeometricallyUnibranch*, *Scheme.IsGeometricallyUnibranchAt*, and `IsGeometricallyUnibranch X` with `.of_isIntegrallyClosed` (`:1132–1137`) | `IsLocalRing.IsUnibranch` (`RingTheory/LocalRing/Unibranch.lean:57`), `IsLocalRing.IsGeometricallyUnibranch` (`:110`, 0BPZ), `.of_isIntegrallyClosed` (`:149`), `AlgebraicGeometry.Scheme.IsGeometricallyUnibranchAt` (`AlgebraicGeometry/Scheme/Unibranch.lean:43`), class `AlgebraicGeometry.IsGeometricallyUnibranch` (`:54`) with `.of_isNormalScheme` (`:64`) |
| §0.12, first paragraph: *isNeighbourhood_self*, *isNeighbourhood_localization*, *isNeighbourhood_tensor*, *extended_le_jacobson*, *fixed_of_henselian*, *exists_etale_lift*, *etale_lift_unique*, *exists_stage_quotient_unit*, *exists_stage_simple_root*/*simple_root_lift*, *map_comp_unit*, *quotient_naturality* | `TauCeti.Henselization.isNeighbourhood_self` (`RingTheory/Henselization/Neighbourhood.lean:91`), `isNeighbourhood_localization` (`:147`), `isNeighbourhood_tensor` (`:246`), `extended_le_jacobson` (`Jacobson.lean:56`), `bijective_algebraMap_of_henselianRing` (`Lift.lean:155`), `nonempty_unique_algHom_of_isNeighbourhood` (`Section.lean:294`, 09XI), `algHom_ext_of_map_le_jacobson` (`Lift.lean:67`), `isUnit_quotient_stage_iff` (`Henselian.lean:82`), `exists_hom_isRoot_sub_mem` (`Henselian.lean:95`), `map_comp_algebraMap` (`Map.lean:66`), `quotientMap_comp_reducedMap` (`Map.lean:111`) |
| §0.14 parts of *henselian_pair_characterisations*, *henselian_pair_permanence* and *henselian_local_finite_algebras* (`:1426–1443`) | `TauCeti.henselianRing_iff_forall_comp_surjective` (`RingTheory/Henselian/Section.lean:159`, condition (2) of 09XI), `TauCeti.HenselianRing.bijOn_quotient_mk_isIdempotentElem` (`Idempotent.lean`), `RingHom.henselianRing_of_surjective` (quotients, `Quotient.lean:34`), `Ideal.henselianRing_pi_iff` (all products, `Product.lean:113`), `Ring.DirectLimit.henselianRing` (directed colimits, 0FWT, with 0FWU in its docstring), `Ideal.henselianRing_radical`, `Ideal.henselianRing_radical_iff`, `Ideal.henselianRing_of_le` (`Radical.lean:34`, `Ideal.lean:110`, `:41`), `TauCeti.HenselianLocalRing.comp_bijective` and `TauCeti.IsFiniteEtaleSplit.of_henselianLocalRing` (04GG, `Etale.lean:106`, `:149`) |
| §0.20 "Prove what the pin lacks": *isJapanese_iff_isN1_of_charZero*, *isJapanese_iff_purelyInseparable*, *of_isIntegrallyClosed_charZero*, *isJapanese_of_dedekind_charZero*, *IsJapanese.localization*, *IsJapanese.of_finite_extension* (finite case), *IsJapanese.polynomial*, the N-1 local criterion, *nagata_normalization_finite* (`:1771–1792`) | `TauCeti.Ring.isJapanese_iff_isN1` (`RingTheory/Japanese.lean:320`; perfect fraction field, so characteristic zero included), `isJapanese_iff_isPurelyInseparable` (`:359`, any characteristic), `IsJapanese.of_isIntegrallyClosed` (`:221`), `isJapanese_of_isLocalization` (`:375`, 032G), `IsJapanese.of_finite` (`:228`, 032I finite case), `TauCeti.Ring.IsJapanese.polynomial` and `.mvPolynomial` (`RingTheory/IntegralClosure/MvPolynomial.lean:82`, `:72`, 032O), `isN1_iff_exists_isIntegrallyClosed_localization_away_and_isN1_localization_atPrime` (`Japanese.lean:629`, 0333), `TauCeti.AlgebraicGeometry.isFinite_fromNormalization_of_isJapanese` (`AlgebraicGeometry/Normalization/Finite.lean:120`, 0AVK, with the weaker Japanese hypothesis on affine opens) |
| Scope `:57–59` "This roadmap owns … henselization of pairs, the catenary, Cohen–Macaulay, Nagata and excellent packages"; Layer table `:29`; `:253` "Owned here for others. Henselization of pairs (§0.12 …)" | Contradicted by the README itself: §0.12 says "The pinned Tau Ceti library implements the definitions, the main theorem and the universal properties" (`:1225–1226`); §0.16 says "This subsection owns no further target"; §§0.17–0.18 and §0.20 open "… are Tau Ceti's" |

**Repair.** Rewrite each affected subsection the way §§0.16–0.18 are now written. Open with the pinned declarations and their files, give the Stacks tags they prove, and keep as targets only what the pin lacks. On the evidence above, that is:
- §0.2: *relativeSpec_modulesEquiv*.
- §0.4: part (3) of 01PE and 01PF, 0G41 and 01PI.
- §0.7: the field-extension clause, *fiberDimAt*, *geometric_irreducible_components* and the fibre-dimension targets.
- §0.8: the pointwise restriction to the smooth locus, if wanted.
- §0.10: the henselization characterisations, `.of_etale`, `.baseChange_sepClosed` and *jacobian_etale_algebra*.
- §0.12: *exists_stage_monic_polynomial* and the section-selector route lemmas, only if they are kept as a proof route.
- §0.14: the remaining characterisations, integral extensions, the `I`-adically complete case, 0D4A, 09ZL, the quasi-finite clause and Elkik.
- §0.20: *isNagata_iff_isUniversallyJapanese*, *IsNagata.of_finiteType*, *IsNagata.polynomial*, *IsNagata.integralClosure_finite*, the quasi-finite case of 032I, `Ring.IsJapanese.of_complete_local`, `Ring.IsNagata.of_complete_local`, `Excellence.IsQuasiExcellentRing.isNagata` and *IsNagata.not_nonJapaneseDVR*.

Add the files to "From Tau Ceti, the carriers and theorems that Layers 0–5 consume instead of restating" (`:430`). Give the old → new dictionary for names other roadmaps cite, as `:1611–1630` does; for example, SchemeKTheoryOperationsPartII cites §§0.7 and 0.16–0.18 by section. In `:57–59`, `:29` and `:253`, replace "henselization of pairs, the catenary, Cohen–Macaulay, Nagata and excellent packages" with what Layer 0 still owns: relative Proj for arbitrary graded algebras, the Hartogs characterisation of `(S_2)`, CM- and `(S_n)`-quasi-excellence, the J-2 and quasi-excellent predicates, and the remaining targets listed above.

**Checked on the refuting instances.**
- `isNeighbourhood_localization` at `(ℤ, (5))` with `x = 2` (a unit mod 5) gives the README Check *neighbourhood_invert_two*.
- `Ring.IsJapanese.polynomial` gives `ℤ[X]` Japanese, the case of *IsJapanese.polynomial* over the README Check *test_int*.
- `IsLocalRing.IsGeometricallyUnibranch.of_isIntegrallyClosed` gives *IsLocalRing.isGeometricallyUnibranch_of_field*.
- `exists_isQuasicoherent_restrict_iso` applies to `j : 𝔸² ∖ 0 → 𝔸²`, which is quasi-compact.

## R02 (P2) — §0.12's recognition predicate duplicates ModularCurves Layer 4D's `IsHenselization` on main and reverses its supply

**Location.** `README.md:1291–1300`: "define the class `IsLocalRing.IsHenselization R L Rh` …". `Suggested.lean:142–159` declares the class and `Henselization.local_henselization`. `README.md:116–118`: "ModularCurves Layer 4D … consumes §0.12 and supplies nothing here". The same claim is at `:261–264` and `:8008–8010` ("ModularCurves Layer 4D consumes §0.12's henselization of a local ring (`local_henselization`, stated through … `IsLocalRing.IsHenselization`)").

**Claim.** This roadmap owns the recognition predicate of henselizations and strict henselizations, and ModularCurves Layer 4D consumes it.

**Witness.** On main, `TauCetiRoadmap/ModularCurves/README.md:2009–2027` defines "the class `IsHenselization ψ`": `A` henselian local, ind-étale over `R`, and `ψ : A → L` surjective. It serves every henselisation, strict ones included, through `StrictHenselization.isHenselization`, `IsHenselization.existsUnique_comp_eq` (08HR) and `.bijective_of_comp_eq` (08HT). Its `Suggested.lean:637` declares the class. The same README's `:3542–3549` reads "SchemeAndStackFoundations consumes Layers 0B–0G, 4D (the regular locus …) … Nothing of this roadmap consumes SchemeAndStackFoundations". Main's SchemeAndStackFoundations has no `IsHenselization` (0 hits). The open #1808 still keeps the class in ModularCurves 4D at its head `705e4f6` (README line 2089), and it merges after this pull request in the stated chain.

**Repair.** ModularCurves is on main and is this roadmap's supplier, so this roadmap cites it. In §0.12, replace the definition of `IsLocalRing.IsHenselization` and its uniqueness targets (*bijective_lift*, *bijective_strictLift*, *isHenselization_strictHenselization*) with a citation of ModularCurves Layer 4D's `IsHenselization`, `StrictHenselization.isHenselization`, `IsHenselization.existsUnique_comp_eq` and `IsHenselization.bijective_of_comp_eq`. State *Scheme.isHenselization_strictLocalRing* on that predicate, through the point `strictLocalRing s → Ω`, as a README target. Delete `IsLocalRing.IsHenselization` and `Henselization.local_henselization` from `Suggested.lean`, which may not import another roadmap's module, and say so in its docstring. `Scheme.strictLocalRing` and its two theorems need neither. In `:116–118`, `:261–264` and `:8008–8010`, replace the claim that ModularCurves 4D consumes §0.12 by the relation main records: this roadmap consumes ModularCurves 4D. Check on the refuting instance: for `R = ℤ_(5)` and `ψ : ℤ_(5)^h → 𝔽_5`, ModularCurves' three fields hold. That is the case the README's *isHenselization_reject_completion* tests against `ℤ_5`.

## R03 (P3) — `QCoh.higherDirectImage_vanishing` is a pinned theorem

**Location.** `Suggested.lean:543–549`: "theorem higherDirectImage_vanishing {X S : Scheme.{u}} (f : X ⟶ S) [QuasiCompact f] [QuasiSeparated f] [IsAffine S] : ∃ N : ℕ, ∀ (F : X.Modules) [F.IsQuasicoherent] (p : ℕ), N ≤ p → Subsingleton …". README `:3983` and `:4014`.

**Witness.** Tau Ceti `AlgebraicGeometry/Cohomology/QuasiSeparated.lean:186` states `AlgebraicGeometry.Scheme.Hom.exists_subsingleton_cohomology_of_isAffine` with the same binders and the same conclusion (01XH). In a scratch copy that adds `public import TauCeti.AlgebraicGeometry.Cohomology.QuasiSeparated`, `exact AlgebraicGeometry.Scheme.Hom.exists_subsingleton_cohomology_of_isAffine f` closes the theorem. The file then elaborates with 55 `sorry` warnings instead of 56, and no error.

**Repair.** Delete `higherDirectImage_vanishing` from `Suggested.lean`. In §2.6 (`:3983`, `:4014`), cite `AlgebraicGeometry.Scheme.Hom.exists_subsingleton_cohomology_of_isAffine`, `Scheme.Modules.exists_subsingleton_cohomology` and `Scheme.Hom.exists_isZero_higherDirectImage` (the last over a quasi-compact base) in place of the name. Keep *higherDirectImage_unbounded_base* as a Check.

## R04 (P3) — three pinned names in §0.17 do not exist as cited

**Location.** `README.md:1524`: "`TauCeti.depth_localizedModule_self`"; `:1563–1564`: "`Module.Polynomial.isCohenMacaulay_localization_atPrime`, `Module.MvPolynomial.isCohenMacaulay_localization_atPrime`"; `:1626`: "*IsCohenMacaulay.polynomial* → `Module.Polynomial.isCohenMacaulay_localization_atPrime`".

**Witness.** In a scratch file importing the cited Tau Ceti modules, `#check @TauCeti.depth_localizedModule_self`, `@Module.Polynomial.isCohenMacaulay_localization_atPrime` and `@Module.MvPolynomial.isCohenMacaulay_localization_atPrime` fail with "Unknown identifier/constant". The declarations are `Ideal.depth_localizedModule_self` (`RingTheory/Depth/Basic.lean:621`, in `namespace Ideal`) and the root-namespace `Polynomial.isCohenMacaulay_localization_atPrime` and `MvPolynomial.isCohenMacaulay_localization_atPrime` (`RingTheory/CohenMacaulay/Flat.lean:158`, `:173`, after `end Module` at `:148`). The other 129 of the 132 names of §§0.12, 0.17, 0.18 and 0.30 that I checked resolve (`Scheme.Hom.coheight_apply_eq_one` after importing `CodimensionOne/FiniteType.lean`).

**Repair.** Write `Ideal.depth_localizedModule_self`, `Polynomial.isCohenMacaulay_localization_atPrime` and `MvPolynomial.isCohenMacaulay_localization_atPrime` at the three places.

## R05 (P3) — README-only names still in backticks, and pinned names in italics

**Location.**
- §0.28's suffix API: `` `_mk` ``, `` `_naturality` ``, `` `_injective` ``, `` `_factor` `` and others (`:2275–2301`).
- `` `Sheaf.higherDirectImage` `` (`:147`, `:3736`), `` `Sheaf.H.pullback` `` (`:3722`, `:3727`), `` `higherDirectImage_δ` `` (`:3739`).
- "Define `` `IsEquivRel s t` ``" (`:2621`).
- Dotted API items of README-only names: §1.24's `` `.comp` ``, `` `.standard` ``, `` `.linear_iff` ``, `` `.finite` ``, `` `.isGroupoid` ``, `` `.isoClasses` ``, `` `.aut` `` (`:3526–3546`), and `` `.comp` ``, `` `.baseChange` ``, `` `.pullback` `` after italic names at `:2125`, `:2133`, `:2725`, `:3276`, `:4295` and `:5725`.
- `` `equivariantCohomology_δ` `` (`:5196`); §3.5's `` `_one` ``, `` `_pullback` ``, `` `_comp` ``, `` `_baseChange` ``, `` `_det` `` (`:5523–5525`).
- §3.7's `` `tensor` ``, `` `baseChange` ``, "Define `` `sectionStack X` ``", `` `forget` ``, `` `zeroSection` ``, `` `symmetricPowerEquiv` ``, `` `add` `` (`:5587–5596`).
- "Define `` `Spf A` ``" (`:6000`), `` `c1_eq` `` (`:7409`), "Define `` `Chow.IsRegularImmersion` ``" (`:7482`), "prove `` `adjunction` ``" (`:7839`).
- The converse: *IsThickening.isUniversalHomeomorphism* (`:512`, `:5714`) and *IsRegular.isNormal* (`:2415`) are italicised although they are the pinned `TauCeti.AlgebraicGeometry.IsThickening.isUniversalHomeomorphism` (`Morphisms/Thickening.lean:124`, an instance) and `TauCeti.AlgebraicGeometry.IsRegular.isNormal`. `:1947` backticks the first of these correctly.

**Witness.** The README's rule (`:303–306`): "a name in backticks is a declaration of `Suggested.lean`, of the pinned Mathlib or Tau Ceti, or of another roadmap named beside it; every proposed name of a README-only target or API item … is set in italics". None of the names in the list is declared in `Suggested.lean` (111 declarations), and none is a pinned declaration with that full name.

**Repair.** Italicise the listed names, and set the two pinned names in backticks.

## R06 (P3) — two §2.19 locators

**Location.** `README.md:4737–4741`: "*upperShriek_smooth* (for `f` smooth of relative dimension `d`, `f^! K ≅ f^* K ⊗ Ω^d_{X/Y}[d]`; Lemmas 48.17.3, 48.17.11) … [Stacks, Lemmas 48.17.9(5) and 48.17.11]".

**Witness.** Lemma 48.17.9 (0B6U) has parts (a)–(e). The base-change formula `Lf^*K ⊗ f^!O_Y ≅ f^!K` is part (e) (`stacks-project`, book PDF, lines 196752–196759); there is no part (5). Lemma 48.17.3 (0AA1, line 196663) gives only a noncanonical `f^! ≅ Lf^*[1]` for the projection `𝔸¹_Y → Y`. Lemma 48.17.11 (0B6V, line 196804) gives invertibility of `f^!O_Y` for lci `f`. Neither identifies `f^!O_Y` with `Ω^d_{X/Y}[d]`. That identification is Lemma 48.15.7 (0BRT, line 196231, smooth proper `f`) and Lemma 48.29.2 (0E9Z, line 198108, an isomorphism at the points where `f` is smooth, for `f` factoring through an immersion into a proper smooth `P`).

**Repair.** Write "Lemmas 48.17.9 (e) and 48.17.11". For *upperShriek_smooth*, cite Lemmas 48.15.7 (0BRT) and 48.29.2 (0E9Z) for the identification with `Ω^d_{X/Y}[d]`, keep 48.17.3 for the local form, and say that the general smooth case is glued from these by the Čech construction of this subsection.

## R07 (P3) — the §3.7 locator for the two components of the kernel of the norm

**Location.** `README.md:5611–5613`: "on Picard schemes the kernel of `Nm : Pic_{X'} → Pic_X` has two connected components (Yun–Zhang 2017, §6.1, proof of Proposition 6.1 (1), p. 40)".

**Witness.** In `yun-zhang`, p. 40 has the exact sequence of étale sheaves and the induced sequence of Picard stacks (lines 2224–2226). It defines `Prym_{X'/X} = ker(Nm)` as "the usual Prym variety divided by the trivial action of μ₂" (lines 2244–2246), and says nothing about components. The two components are in §5.4.1, p. 35 (lines 1946–1948): `Bun_T ≅ Pic_{X'}/Pic_X` has coarse space "a group scheme with two components". The statement itself is true; it is Mumford's theorem on Prym varieties for a connected étale double cover.

**Repair.** Cite "Yun–Zhang 2017, §5.4.1, p. 35, with the exact sequence in the proof of Proposition 6.1 (1), p. 40".

## Verified sound

**Gate, dependency check, elaboration and probe.**
- Full gate run (`tauceti-roadmap … gate … --base origin/main`) at 1bfff38: every check `=0` and "OK". The worker's gate, with the targeted build, reports the same with `build=0`. The folder holds `README.md`, `Suggested.lean`, `PROGRESS.md`, `STATUS.md` and `metadata.toml`, as on main.
- Dependency check (`gate --depcheck … --movable --pr 1656`) output: `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. It cannot see R02's reverse-supply sentences, which are prose.
- `lake env lean TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` exits 0 in 47 s, with 56 `declaration uses sorry` warnings and no other diagnostic. Pins on both the branch and main: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`.
- One-tactic probe on a scratch copy: every `sorry` was replaced by `first | rfl | infer_instance | (simp; done) | decide | trivial | exact ⟨inferInstance⟩ | sorry`. 55 warnings remain; the only theorem that closes is `universalHomeomorphismEtaleEquivalence_functor` (`:262`, by `rfl`). Its settled disposition holds: #1276, which merges before this pull request in the stated chain, is open at head `b311bda`, and its `Suggested.lean` declares `_coverPreserving`, `_comp` and `_baseChange` but no `_functor`. The targeted `exact` probe of R03 is the second closure.
- Signatures: the four "looks dropped `[Category.{u} A]`" flags (`etalePushforward`, `isRightAdjoint_etalePushforward`, `etalePullback`, `preservesFiniteLimits_etalePullback`) are false positives; each elaborated type carries `Category.{u_1, u_2} A`.

**Library declarations opened at the pins.**
- §0.17: in Lean, all 30 depth names, all 26 Cohen–Macaulay ring and module names, and all 18 Serre-condition names, except R04's three. Among them: `IsLocalRing.depth_hom_ge` (`bound ≤ 2`, finite `M`, `N`), `LinearMap.bijective_of_depth` (`R` Noetherian, no finiteness on `M`), `LinearMap.injective_of_forall_localization`, `IsLocalRing.depth_eq_iInf_localization_maximal` (`[IsLocalRing R] [Module.Finite R S]`), `IsLocalRing.depth_eq_add_of_flat` (`[IsLocalHom (algebraMap R S)] [Module.Flat R S]`), `isCohenMacaulay_iff_supportDim_le_depth` (`[Nontrivial M]`), `TauCeti.AlgebraicGeometry.tilde_toOpen_bijective_of_two_le_depth`, and the instance `TauCeti.Ring.IsCohenMacaulay.of_isRegularRing` (`Ring.lean:126`).
- §0.18: 16 names, including `Scheme.Hom.isCohenMacaulay_of_syntomic_of_field` and `Scheme.Modules.annihilator`.
- §0.30: 24 names, including `Scheme.Hom.coheight_apply_eq_one` (`CodimensionOne/FiniteType.lean:103`) and `Ideal.exists_regularSystem_of_quotient`.
- §0.12: 18 names from `TauCeti/RingTheory/Henselization/` and `StrictHenselization/`.
- The R01 table, with files and lines. `TauCeti/AlgebraicGeometry/AlgebraicSpace/Basic.lean` has 19 names, which match §1.3's pinned API. The five targets §1.3 keeps are absent there.
- `TauCeti.ModuleTower.finiteReduction_isEquivalence` (`Algebra/Category/ModuleCat/Tower/Reduction.lean`, 087W for complete Noetherian rings) is the algebraic input of §4.8's sheaf-level *coherentFormalModuleEquivSpec*, which is not at the pin.
- No J-2 or quasi-excellence predicate is at the pin (0 hits), so §0.21's two definitions stand. Serre's affineness criterion is not at the pin, so `isAffine_of_H1_vanishing` stands.

**Cross-roadmap citations resolved.**
- The worker's 94 "Lean names found nowhere" are this roadmap's own `Suggested.lean` declarations, plus the EtaleCohomologyFoundations `VanishingCycles.*` names.
- No cross-roadmap citation was found nowhere.
- ModularCurves on main: 0B–0G, 4D (R02), 7D (`ArtinianTestAlgebra`), 9D.
- Main's EtaleCohomologyFoundations builds `ν` in §F.4.3, on this roadmap's §2.17. This head moves `ν` down into §2.10, which is allowed because this roadmap is upstream of ECF. The open ECF revision (#1891) carries the matching "whichever merges second" sentence. No change is needed here.

**Overlap facts.**
- No id this README cites is dropped by an open pull request, and none is defined only by an open revision. This pull request drops no id that others cite.
- The four pull requests that change this folder (#1276, #1807, #1808, #1854) are ordered in the description (previous R05).
- Closest in vocabulary are #1840, #853, #1796, #1891 and #1743. #1796 and #1743 cite this roadmap's sections, and `roadmaps grep` for `IsNisnevichCovering`, `ElementaryDistinguishedSquare`, `reflexiveHull`, `upperShriek`, `schlessinger_hull` and `exists_linear_normalization` finds them only here, or cited from here (MotivesAndAlgebraicCycles §2.12–2.14, PELModuli §4.4, ComplexComparisonPartII §2.19).
- Ownership against #853 and #1891 was checked only through `roadmaps grep`.

**Seeded source sample.** Stacks tags were read in the book PDF (`stacks-project`, cache `5b3a46c2`). For §§4.2–4.4 I matched every number–tag pair by script and then read each statement.

| Target | Locators checked | Outcome |
|---|---|---|
| 0.6 | 0AVU 127311 (stated for integral `X`; "the same definition … in more general situations"), 0AY0 127319, 0AY3 127338, 0AY4 127355, 0AY2 127333, 0EBH 127360, 0EBJ 127392 (integral `X`, depth ≥ 2 on `Z`), 0AY7 127427, 0AY6 127405 (three conditions, (3)(a)–(c)), 0EBI 127387 (two parts), 0E9I 126805 | As cited; the integrality-free extension is argued correctly from `depth_hom_ge` and `bijective_of_depth` |
| 0.7a | Milne AG (cache `8222dff2`, v6.10) Lemma 2.43 line 1955 (p. 52, `k` infinite), Theorem 2.44 line 1969, Theorem 2.45 line 1974, Lemma 2.46 line 1986 (p. 53), the reducedness remark line 1979, Remark 2.47 line 2008 (stated for irreducible `V`); Milne CA (`1839ca7a`) Remark 8.4 line 1417 (printed p. 35, line 1403); 00OY 33616, 00GQ 24395, 05DR 24429 | As cited |
| 0.12 | 04HX 229950, 03PS 229971, 03QK 229926, 04GQ 40547, 08HT 40443, 0A03 58735, 03QO 231715 (stated for sheaves of sets), 01YW 130903, 04GW 40683, 15.12.1 (0A02) 58669, 15.11.5 (09XH) 58433, 15.11.6 (09XI) 58462 | As cited; duplication in R01 and R02 |
| 0.19 | `cesnavicius-2021` Definition 1.2 line 61 (p. 2), Example 1.3 line 67, §2.8 line 237 (p. 6), §2.10 line 268 (p. 7) | As cited |
| 0.30 | 033I 113293, 033J 113299, 033K 113308, 00PD 34111, 00H8 24717, 02JE 351914 (§110.19), 09E4 72654, 00NR 32627 | As cited |
| 1.3 | 025Y 252169, Lemma 65.6.2 (025Z) 252197, 02X2 252243 | As cited |
| 1.24 | `kisin-2017` §3.1.1 lines 1550–1563 (pp. 34–35, condition (1) at line 1561), §3.2 heading line 1765 (p. 39), §3.2.1 line 1770 (p. 40); Milne iAG2017 (cache `503f1a7d`) A.64 line 23817, printed pp. 580–581 (folio 581 at line 23837), with the Hopf-algebra sentence at 23838; Stacks §35.6 (0CDQ) 142177 | As cited |
| 2.13 | `morel-voevodsky` Proposition 1.1 line 1765, Definition 1.2 line 1774 (pp. 95–96), Definition 1.3 line 1790 (p. 96, reduced induced structure), Proposition 1.4 line 1802, Lemma 1.5 line 1830, Lemma 1.6 line 1851, Remark 1.7 line 1858 (p. 98); 03A0 14640 | As cited |
| 2.19 | 0A9E 194634, 0A9F (Example 48.3.2) 194647, 0A9I 194671, 0A9Q 194691, 0B6I 194736, 0A9D 194627, §37.62 159873, 0F42 196260, 0AA0/0ATX/0ATY/0B6T 196274–196575, 0A9Y 196254, 0AU0 196639, 0AA1 196663, 0B6U 196752, 0B6V 196804, 0E9U 196853, 0FWI 196880, 0A9W 196079, 0DA7 300547, 0D9X 300211; Nayak (cache `f88460d6`) §2.1 [A]–[D] lines 269–341, Theorem 2.2.4 line 458; Block–Holstein–Wei (cache `54ec2be3`) §3.2 line 308, §4.1 line 381, §4.3 line 538, Definition 4.3 line 608, Corollary 3 line 665 | Two wrong (R06); the rest as cited |
| 3.7 | `yun-zhang` §3.2.1 line 901 (p. 16), proof of Proposition 3.1 (2) line 998 (p. 18), §6.1.1 line 2150, Proposition 6.1 line 2192 (p. 39), its proof on p. 40 (lines 2206–2246), §5.4.1 lines 1944–1948 (p. 35); 0BA0 187165 (separably closed `k`; surjective for `d ≥ g`, smooth for `d ≥ 2g − 1`), 062Y 128288, 0B9D 186806 | One wrong (R07) |
| 4.2 | 06GC 311808, 06G9 311789, 06GD 311826, 06GH 311909, 06GW 312066 | As cited |
| 4.3 | 06GT 312314, 06GS 312304, 06IH 313371, 06HW 312853, 06IG 313365, 06J2 314032, 06J9 314178, 06HY 312930, 0D3G 313672, 06J6 314109, 06JA 314181, 06HX 312925, 06J4 314080, 06J7 314114, 06JI 314297 | As cited (see Source issues for 06J6) |
| 4.4 | 06HG 312554, 06H3 312336, 06HC 312481, 06HR 312711, 06IY 313986, 06IL 313848, 06T4 313817, 06GX 312298, 06IR 313860, 06T5 313825, 06T2 313731, 06T3 313776, 06T8 313920, 06IV 313869, 06IW 313578, 06IX 313968, 06JM 314381, 06JB 314185 | As cited |
| 5.2 | 02R3 (§42.12) 176537, 02S0 (§42.20) 177114, 0AZ0 (§42.41) 179602, 02RA (§42.14) 176679, 02RF (§42.15) 176770, 02RV (§42.19) 176991, 02TY 179104 (`E = Spec Sym*(E)`, the dual convention noted), 02QR 176385, 02QO 176351 | As cited; Fulton under Not verifiable |
| 5.8 | 02UO (§42.66) 183060 (proper smooth `f`, locally free `R^i f_* E`) | As cited; Fulton under Not verifiable |
| 5.10 | Hartshorne V.1 and Fulton §§15.2, 19.1 | Not verifiable (below) |

**Adversarial table.** One row per statement. The rows cover the sampled targets, every headline of `Suggested.lean`, and every target that a finding touches.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| `exists_linear_normalization` | `n = 0`; `k[X,E]/(E²)`; `𝔽₂[X,Y]/(XY(X+Y))`; `A = 0` | `adjoin ∅ = ⊤` forces `A = k`, `d = 0`; `d = 1`, `C = (1 0)`, basis `1, E`, `(0 1)` fails (`E` nilpotent); linear forms `x, y, x+y` each give `A/(ℓ)` a polynomial ring, so not finite, while `z = x²+xy+y²` gives `x³ − zx = −xy(x+y) = 0`, injective since `y ↦ 0` sends `z ↦ X²`; `[Nontrivial A]` excludes `0` | Pass |
| §0.6 *reflexive_extension_of_depth*, Checks | `Spec k[x,y,z,w]/(xw)` at `0`; two planes in `𝔸⁴`; `k[t] ⊕ k[t]/(t)` | CM hypersurface of dimension 3, depth 3, `j_*O_U = O_X`; depth `1`, `j_*O_U = O_{P₁} × O_{P₂} ≠ O_X`; double dual `k[t]` versus `j_*` from `D(t)` `= k[t,t⁻¹]` | Pass |
| §0.17 *satisfiesSerreS_two_iff_hartogs* | `M = R = k[x,y]`, `Z = 0`; `M = k[x,y,z]/(x)`; `k[x,y]/(x²,xy)` | `Γ(𝔸²∖0) = k[x,y]`; `(x,y)` has height 2 in `Spec R` and 1 in `Supp`, so the support hypothesis is needed; embedded `(x,y)` has height 1, so `(S_1)` is needed; converse at `p` with height ≥ 2 via `Z = V(p)` and 0DWR/0AVZ gives depth ≥ 2 | Pass |
| §0.17 Checks on pinned carriers | `bijective_of_depth` with `𝔪 ⊂ k[x,y]`; `depth_hom_ge` with `Hom(𝔪,R)`; `depth_eq_add_of_flat` with `k[x]_(x) → k[x,y]_(x,y)` | `depth 𝔪_𝔪 = 1` from `0 → 𝔪 → R → k → 0`, not surjective; `Hom(𝔪,R) = R`, depth 2; `2 = 1 + 1` | Pass |
| §0.10 Checks (pinned predicates) | node `y² = x²(x+1)`; cusp `y² = x³`; `ℝ[x,y]/(x²+y²)` | two branches; one point over `0` with residue `k`; normalisation `ℂ[t]` local, residue `ℂ/ℝ` of degree 2, so not geometrically unibranch | Pass; carriers pinned (R01) |
| `unibranch_finite_components` | `Spec(ℚ × ℚ(i)) → Spec ℚ`; eventually-constant sequences over `𝔽₂` | two clopen points, each finite étale; `{m∞}` closed and not open, outside local Noetherianity | Pass |
| `IsLocalRing.IsHenselization`, `local_henselization` | `k`; `ℤ_(5)` versus `ℤ_5`; strict henselization at `𝔽̄_5` | `IsHenselization k k k`; `ℤ_5` is not ind-étale (it would equal the countable `ℤ_(5)^h`); residue `𝔽̄_5 ≠ 𝔽_5` | True, but duplicates ModularCurves 4D (R02) |
| `Scheme.strictLocalRing` and its two theorems | `Spec 𝔽_p`, `s : Spec 𝔽̄_p → S`; Zariski stalk of `Spec ℤ_(5)` | `𝔽_p^sep = 𝔽̄_p`, henselian, separably closed; `x² + 1` has simple roots `2, 3` mod 5 and none in `ℚ`, so the Zariski stalk is not henselian | Pass |
| §0.12 *sections_reject_nonclosed_residue* | `R = ℤ_(5)^h`, `P = Spec R[x]/(x²−2)` | `2` is not a square mod 5, so `P(S) = ∅`; `P_s ≠ ∅` over `𝔽̄_5` | Pass |
| §0.19 predicates | `Spec k`; `∅`; `(S_0)` | formal fibres of a field are fields, so CM; vacuous; `min(0, dim) ≤ depth` always, so equivalent to local Noetherianity | Pass |
| `Ring.IsJapanese.of_complete_local`, `IsNagata.of_complete_local` | `k[[t]]`; `k[[x,y]]/(xy)` | complete DVR, Japanese (032W); complete Noetherian local, Nagata | Pass |
| `IsJ2`, `IsQuasiExcellentRing.isNagata` | `ℤ`; `k[x₀,x₁,…]` | G-ring and J-2, so Nagata; not Noetherian, both predicates false | Pass |
| §0.20 pinned items (R01) | `ℤ[X]`; `ℤ_(p)` localisation | `Ring.IsJapanese.polynomial` gives `ℤ[X]` Japanese; `isJapanese_of_isLocalization` gives `ℤ_(p)` Japanese | Pinned (R01) |
| §0.23a `etaleSite`, `isEquivalence_etaleSite` | `f = 𝟙`; `Spec k → Spec k[ε]` | identity functor; étale `k[ε]`-algebras ≃ étale `k`-algebras (04DZ) | Pass; `_functor` settled |
| §0.30 Checks | `x ↦ x²` on `𝔸¹`, `2` invertible; `y − x²`, `y² − x³` in `k[x,y]_(x,y)` | `e = 2` at `0`, `e = 1` at `1`; `y − x² ∉ 𝔪²` with regular quotient; cusp quotient not regular | Pass |
| §1.3 Checks | quotient of `h_{Spec L}` by `Gal(L/K)` on `Spec L ⊔ Spec L`; constant `{0,1}` | classes of `(id,id)` and `(id,σ)` agree on each component and differ globally, so not separated; `F(∅) = {0,1} ≠ pt` | Pass |
| `isAlgebraicSpace_pullback`, `EtaleLocal.baseChange` | `h_X ×_{h_Z} h_Y`; `P = Etale` | `h_{X ×_Z Y}`; étale is stable under base change and étale-local | Pass |
| `Action.free_iff_mono`, `IsTorsor`, `Torsor.trivial_iff_section` | trivial action of `μ₂` over `ℂ`; `G` acting on itself; `Spec ℂ → Spec ℝ` for `ℤ/2` | `(g,x) ↦ (x,x)` not mono, not free; identity section, trivial; no real point, nontrivial | Pass |
| `torsorRepresentability`, `artinBootstrap` | `P = G`; `F = U = h_X`, `a = 𝟙` | trivial torsor; algebraic space | Pass |
| `galois_descent_affine` (§1.24) | `L = k`; `L/k` quadratic, `A = L ⊗ B`; a character `χ` with non-open kernel | `B = A`; `B` recovered; the stabiliser of `t` is `ker χ`, not open, so excluded by `open_stabilizer` | Pass |
| §1.24 crossed-module Checks | `SL₂(ℂ) → PGL₂(ℂ)`; `id : S₃ → S₃` with trivial action | `coker = 1`, `ker = μ₂`; `y ≠ xyx⁻¹` in `S₃`, so the Peiffer identity fails | Pass |
| `Scheme.etalePushforward`, `isRightAdjoint_…`, `preservesFiniteLimits_etalePullback`, `toProEt_isContinuous` | `f = 𝟙`; `X = Spec k`, `k` separably closed | identity adjunction; both sites trivial | Pass |
| `noetherianSpace_vanishing` | point, `d = 0`; spectrum of a DVR, `d = 1` | `H^p = 0` for `p > 0`; `H² = 0` | Pass |
| `higherDirectImage_vanishing` | `∐_n ℙⁿ → ∐_n Spec k` | base not affine; `Rⁿf_*` of `O(−n−1)` is nonzero for every `n` | Pinned (R03) |
| `isAffine_of_H1_vanishing` | `ℙ¹`; `𝔸² ∖ 0` | `H¹(O(−2)) = k ≠ 0`, not affine; `H¹(O) ≠ 0`, not affine; 01XF needs only quasi-compactness | Pass |
| `nonempty_localCohomology_flat_baseChange` | `ℤ → ℚ`, `I = (p)` | `H^q_{(p)}(M) ⊗ ℚ = 0 = H^q_{(1)}(M_ℚ)` | Pass |
| `artinSchreier_vanishing`, `brauer_functionField_curve_trivial` | `Spec 𝔽_p[t]`; `K` algebraic over `k(t)` | affine of characteristic `p`, `H² = 0`; `Br = colim` of `Br` of finite extensions `= 0` (Tsen) | Pass |
| Nisnevich carriers (§2.12) | `Spec ℂ → Spec ℝ`; `{Spec ℤ[1/10], Spec ℤ[1/2][x]/(x²+1)}` over `ℤ[1/2]` | residue `ℂ ≠ ℝ`, not a covering; disc `−4` invertible, so étale, and over `(5)` `x²+1 = (x−2)(x−3)` gives `𝔽₅` points | Pass |
| `ElementaryDistinguishedSquare`, `isPullback_of_isSheaf` (§2.13) | `p(s) = s² + 2s` on `V = 𝔸¹ ∖ {−1,−2}`; `U = X` | `p' = 2s + 2 ≠ 0` on `V`, `p⁻¹(0) ∩ V = {0}` with residue `ℚ`; `Z = ∅` with ideal `⊤`; the diagonal of étale `p` is clopen and lies over `Z`, so `V ×_X V`'s condition reduces to `U`'s | Pass |
| `isReplete_proetale` | `(Spec ℚ)_ét` with the `μ_{ℓⁿ}` tower | the limit leg is not epi there, as the README contrasts | Pass |
| `DQCoh.nonempty_affineEquiv` | `A = ℤ`, `M = ℤ/2` | `M~` has quasi-coherent cohomology | Pass |
| §2.19 Checks | `i : Spec k → 𝔸¹` at `0`; `ℙⁿ → Spec k`; `𝔸¹ → Spec k` | `RHom(k,k)` has `H⁰ = H¹ = k`; `Li^*k ⊗ k[−1]` in degrees `0, 1`; `a_f(k) = O(−n−1)[n]`; `Hom_k(k[x],k)` versus `O[1]` | Pass |
| Brauer (§2.22) | `ℍ/ℝ`, `B = ℂ`; `A = k` over `k × k` | `ℂ ⊗ ℍ ≅ M₂(ℂ)`; rank `0` at a prime, so not Azumaya | Pass |
| Curve headlines (§§3.1–3.3) | `ℙ¹_ℚ ⊗ ℂ`; Euler sequence on `ℙ¹`; `z ↦ z²` with `O(1)`; étale double cover of genus 2; `Spec ℚ(i)/ℚ` | `g = 0`; `−1 + 1 = 0`; `2 = 2·1`; `g' − 1 = 2(2 − 1)`; not geometrically integral, excluded | Pass |
| `nonempty_lineBundleClass_spec_mulEquiv_pic` | `ℤ[√−5]`; `R = 0` | `ℤ/2` on both sides; trivial | Pass |
| §3.7 *picard_norm_sequence*, Abel Checks | `X' = X ⊔ X` étale-locally; real conic `x²+y²+z² = 0`, `d = 1` | `a ↦ (a,a)`, `(a,b) ↦ (a/b, b/a)`, norm `ab`: exact; `Pic¹ = Spec ℝ`, `a₁` a nonsplit conic, not `ℙ(E)` | Pass; locator R07 |
| §4.2 Checks | `k[ε] → k`; `k[x]/(x³) → k`; `k[ε] ×_k k[ε]` | kernel `(ε)` with `𝔪ε = 0`, small; `𝔪·(x) = (x²) ≠ 0`, not small, two steps; cotangent space of dimension 2 | Pass |
| §4.3 Checks | subterminal `F` over `k[[a,b]]` with `(ε,0)`, `(0,ε)`; `act(v,x) = v + 2x` on `ℤ/3`; `h_{k[[t]]}/±` | both factors a point, product empty, so `H1` fails; `act(0,1) = 2 ≠ 1`; `(x,y)` and `(x,−y)` have the same image, so `H2` fails while `H1` holds | Pass |
| §4.4 *versal_not_hull*, *IsVersal.exists_hull_of_H1H2* | `k[[t,s]] → h_{k[[t]]}` | power-series extension, smooth; tangent map `k² → k` not injective; hull `k[[t]]` with `r = 1` | Pass |
| `FormallySmooth`, `smooth_iff_formallySmooth` | `Spec k → 𝔸¹` with `T' = Spec k[ε]` | a lift would need `ε = 0`, so not formally smooth | Pass |
| `grothendieck_existence`, `algebraize_hom`, `generic_flatness` | `X = Spec A` adic; `Bl₀𝔸² → 𝔸²` | `M = lim M_n` (087W); flat over `𝔸² ∖ 0`, fibre dimension 1 at `0` | Pass |
| `alteration_theorem`, `semistable_alteration_theorem`, `curve_fibration_field_reduction` | `Spec k`; `ℙ¹_{ℤ_p}`; `ℚ(i)/ℚ` | trivial alteration; smooth special fibre, `H = ∅`; components geometrically integral over `ℚ(i)` | Pass |
| §5.2 base-change square, localisation | `Spec k' → Spec k` of degree `d` with `𝔸¹_k`; `𝔸¹ ⊃ 𝔾_m` | both sides `d[𝔸¹_k]`; `CH₀(𝔸¹) = 0 → CH₀(𝔾_m) → 0` | Pass |
| `nonempty_CH_coprod` | `∐_ℕ Spec κ`, `k = 0` | `∏ ℤ` on both sides | Pass |
| §5.8 Checks | `ℙⁿ`, `O(d)`; smooth divisor `D` | `χ = binom(n+d, n)`; `ch(i_*O_D) = 1 − e^{−[D]}` | Pass |
| §5.10 Checks | `ℙ¹ × ℙ¹`; `ℙ²`; `E × E` | `12 = 8 + 4`, `χ(O(a,b)) = (a+1)(b+1)`, `D = (1,−1)` with `D·H = 0` and `D² = −2`; `12 = 9 + 3`; rank `2 + rank End E` = 3, 4, 6 | Pass |
| `weil_bound` | `y² + y = x³` over `𝔽₂` | 3 points, `|3 − 3| = 0 ≤ 2√2` | Pass |

**Declared gaps.** None are declared (no readable `design/plan.json`), and the README states no `What <Supplier> must provide` contract.

## Not verifiable

- Fulton 1998 (§5.2 Theorems 1.4 and 1.7, Propositions 1.7–1.9, Theorem 3.3(a); §5.8 Theorem 15.2 and Corollary 15.2.1; §5.10 Example 15.2.2 and §19.1): no legal copy in the sources cache.
- Hartshorne 1977 (§5.10: V.1 Proposition 1.5, Exercise 1.3, Theorem 1.6, Remark 1.6.1, Lemma 1.7, Corollary 1.8, Theorem 1.9, Exercise 1.9, Theorem 1.10, and the note to Exercise 1.7): settled as uncertified.
- Kleiman 1966, Lang–Néron 1959 and Schlessinger 1968, Theorem 2.11 (§§4.4, 5.10): not fetched in this review.
- Outside the sample I did not re-read the locators. That includes Grothendieck's *Le groupe de Brauer* and the §§2.20–2.23 sources that the previous review sampled.

## Source issues

- **Error** in stacks-project at Remark 90.16.5 (06J6), Chapter 90 §16, printed p. 6567: the source says that for set-valued functors (RS) is exactly Schlessinger's (H4); it should say (RS) implies (H4). The functor that is a point when `a_A = 0` or `b_A = 0`, over `k[[a,b]]`, satisfies (H4) but not (RS). Affects nothing.
