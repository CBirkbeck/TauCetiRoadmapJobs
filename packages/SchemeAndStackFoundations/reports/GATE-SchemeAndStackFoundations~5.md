# GATE-SchemeAndStackFoundations~5: answers to the unanswered review comments on `4ebdad2`

Repairs are in commit `16d66b3` (on top of `4ebdad2`, not pushed). Numbering: the external-formalisations
note is H01; the six design edits are H02–H07 (the author's application report restates them as items
1–6, which are answered there); the further points of that application report are H08–H13; the review
of `4ebdad2` is H14–H19 (F01–F06) and H20 (its build claim). Line numbers are those of `16d66b3`.

## H01 (CBirkbeck) — answered

The note is a list of pointers into three external repositories and asks for no change. None of them is a
Tau Ceti supplier, so the README cites none of them; under the repository README's porting guidance a
file-by-file map could only go into a secondary provenance section, which this roadmap does not have.
None of the pointed-to statements was checked here.

## H02 (CBirkbeck) — applied

§0.23a: at `4ebdad2` and unchanged here, `Scheme.Hom.etaleSite` (base change via
`MorphismProperty.Over.pullback`), `etaleSite_isContinuous`, `etaleSite_preservesFiniteLimits`,
`etaleSiteComp` (`Over.pullbackComp`) and `isEquivalence_etaleSite` are in `Suggested.lean` (§0.23a block).
`universalHomeomorphismEtaleEquivalence` is `(etaleSite f).asEquivalence`. *etaleSiteId*,
*etaleSiteBaseChange* and the pseudofunctor are README-only (README §0.23a). All of these elaborate in the
`#check` pass below.

## H03 (CBirkbeck) — applied

§2.1 "The small étale site": `Scheme.etalePushforward`, `isRightAdjoint_etalePushforward`,
`etalePullback` (`Functor.sheafPullback`), `etaleAdjunction` (`sheafAdjunctionContinuous`) and
`preservesFiniteLimits_etalePullback` are declared, for any `A` with `[Category.{u} A]`. The elaborated
types carry `[Category.{u_1, u_2} A]` at the scheme universe, so the signature report's five
"`[Category.{u} A]` looks dropped" leads are false positives.

## H04 (CBirkbeck) — applied

§2.5: *Etale.overEquiv U* `: Over U ≌ U.left.Etale`, *Etale.overEquiv_coverPreserving*,
*Etale.overEquiv_restriction* and four Checks are at README §2.5. They are README-only, because the pin
has no body for the equivalence. It is named as the slice input for Čech, Godement and extension by zero.

## H05 (CBirkbeck) — applied

§2.10: `Scheme.toProEt` (`Over.changeProp` along `etale_le_weaklyEtale`), `toProEt_isContinuous` and
`proetalePushforward` (`Category.{u+1}`) are in Lean. *proetalePullback*, *proetaleAdjunction* and
*proetaleComparison* (`sheafCompose` with `ModuleCat.uliftFunctor`, then `ν^*`, the only change of
universe) are in README §2.10. §2.17's last paragraph consumes this `ν` and builds no second one.

## H06 (CBirkbeck) — applied

§0.12: `class IsLocalRing.IsHenselization R L Rh` (henselian, `TauCeti.Algebra.IndEtale R Rh`, and a
residue-field identification `L ≃+* κ(Rh)` compatible with `R`) and
`Henselization.local_henselization : IsHenselization R κ (TauCeti.Henselization.algebra 𝔪)` elaborate as
in the README. 08HT uniqueness goes through `TauCeti.Henselization.lift` and
`TauCeti.StrictHenselization.lift` (README-only *bijective_lift*, *bijective_strictLift*). This round
cut the ModularCurves 4D edge out of this paragraph (H14) and stated ownership (H16).

## H07 (CBirkbeck) — applied

§0.12 "Strict local rings of schemes": `Scheme.strictLocalRing s` (the `pointSmallEtale` presheaf fibre of
`U ↦ Γ(U, 𝒪_U)`), `henselianLocalRing_strictLocalRing` and `isSepClosed_residueField_strictLocalRing` are
in Lean. 04HX (*isHenselization_strictLocalRing*), *strictLocalization*, *isLimitStrictLocalizationCone*
and *isIso_toPresheafFiber_of_strictlyHenselian* (stated for every presheaf and coefficient category) are
README-only.

## H08 (CBirkbeck) — answered

Confirmed: `TauCeti/AlgebraicGeometry/Sites/` at the pin `2fd255d9` contains only `Big/` and
`SmallAffineZariski.lean`, and no file `EtaleSepClosed*` exists anywhere in the pinned Tau Ceti. So the
README states the field case `R = Ω` as a special case of the presheaf theorem and cites no Tau Ceti name,
which is correct.

## H09 (CBirkbeck) — answered

Confirmed: the pins have no ring map from the Zariski stalk `𝒪_{S,x}` to `Scheme.strictLocalRing s`.
Building it means building a cocone from open neighbourhoods into étale neighbourhoods, a construction
rather than one of the "few simple definitions". So 04HX stays README-only (*Scheme.stalkToStrictLocalRing*,
*isHenselization_strictLocalRing*), and the module docstring of `Suggested.lean` says so (§0.12 entry).

## H10 (CBirkbeck) — answered

Keeping these README-only is correct under the acceptance-test rules (`Suggested.lean` carries only
headlines and the definitions they need). The stated reason is not exact for `ν^*`, though. Mathlib's
`Functor.sheafPullback` would give *Scheme.proetalePullback* a body exactly as it gives
`Scheme.etalePullback` one (`Suggested.lean` §2.1); it is README-only because no headline needs it.

## H11 (CBirkbeck) — answered

`Etale.constZMod` is unchanged. The `ULift.{u}` lifts the value object `ZMod p : Type` into
`AddCommGrpCat.{u}`, so that it can be the value of a constant sheaf on `X.Etale` for `X : Scheme.{u}`. Any
universe-`u` coefficient category forces it. It does not lift the coefficient category, so it agrees with
§2.1's convention that no coefficient category changes universe. Whether this matches the external
decision record "D1" could not be checked here (that record is not readable from this job).

## H12 (CBirkbeck) — answered

On main, EtaleCohomologyFoundations §F.4.3 reads "Using SchemeAndStackFoundations §2.17 construct ν". At
this head that citation still lands on ν: §2.17's last paragraph names §2.10's `Scheme.toProEt` as the
only ν, and "Downstream consumers" records `VanishingCycles.etaleProetaleAdicComparison` as built on
`Scheme.toProEt` (§2.10). The open EtaleCohomologyFoundations revision (#1891, head `c10a0bb`, §F.4.3
"The comparison morphism ν") builds the same inclusion `X.Etale → X.ProEt`, `ν_*`, `ν^*` and the
`ModuleCat.uliftFunctor` change of universe a second time. This roadmap is upstream of
EtaleCohomologyFoundations, so §2.10 is the single owner, and that revision should cite
SchemeAndStackFoundations §2.10. Editing it is outside this folder.

## H13 (CBirkbeck) — answered

The gate summary in the application report left out two failures. At `4ebdad2` the gate reports
`statement-hygiene=9`, and against today's main it also reports `dropped=39`: citations of
AbundanceStatement and CommRingFactorizationSystems, which may not be cited as suppliers. Both are
repaired at `16d66b3` (H15 and the section "Dropped suppliers" below), and the gate now passes.

## H14 (CBirkbeck) — applied

The §0.12 ↔ ModularCurves 4D cycle is cut by citing the pinned carrier, not the roadmap:
- §0.12's *Needs:* no longer names "ModularCurves 4D" (`README.md:1183`).
- `:1181` reads "the pinned carrier `TauCeti.StrictHenselization.algebra R Ω` satisfies".
- The supplier list (`:462`) describes `TauCeti/RingTheory/StrictHenselization/` as the colimit of pointed
  étale neighbourhoods, and the "From ModularCurves" contract drops 4D (`:437`).

The same edge also sat in §0.10 (`:1010`, `:1030`), in the Layer 0 conventions (`:519`) and in Layer 0's
Dependencies, and is removed there too. The Scope bullet (`:108–116`) now says that ModularCurves 4D states
miracle flatness and the openness of the regular locus, consumes §0.12 and supplies nothing here. No line
of the README names ModularCurves 4D as a supplier.

## H15 (CBirkbeck) — applied differently

Each of the nine hits is repaired. The rename also covers two more `Nonempty` conclusions that the old
`letI` hits had hidden (`DQCoh.affineEquiv`, `CH_coprod`):
- `localCohomology_degreeZero` now asserts an injective `A`-linear `f : H⁰_I(M) ⟶ M` whose range is the
  `I`-power torsion. That is stronger than the old `Nonempty (≃)` of types, which only equated
  cardinalities.
- `nonempty_localCohomology_flat_baseChange`, `DQCoh.nonempty_affineEquiv` (now with a
  `[HasDerivedCategory (ModuleCat A)]` binder in place of the `letI`), `nonempty_lineBundleClass_spec_mulEquiv_pic`
  (now `≃*`) and `nonempty_CH_coprod` are renamed. The README keeps the original names
  (*localCohomology_flat_baseChange*, *DQCoh.affineEquiv*, *lineBundleClass_spec_equiv_pic*, *CH_coprod*)
  for the natural maps. That keeps EnhancedDerivedSheaves' citation of `Coherent.DQCoh.affineEquiv` and
  DeformationAndDerivedPatchingAlgebraPartII's citation of `localCohomology_flat_baseChange` landing on
  §§2.18 and 2.7. The canonical `M ↦ M~` functor on `D(A)` cannot be stated at the pin, because Mathlib
  has no `PreservesFiniteLimits (tilde.functor R)`.
- `vectorBundleDegree_pullback` now uses Mathlib's `f.finrank (genericPoint Y)`. This removes both the
  `letI` and a `show … by sorry` that sat inside the statement.
- `CH_coprod` takes `[(∐ X).Over …]`, `[LocallyOfFiniteType …]` and the equation `hX`.
- `weil_bound` takes `[Finite k]` with `Nat.card k`.
- `nodal_codim_two_thickness_three_residual` is deleted from Lean. It mirrored a README Check (now
  *italic* at README §4.18), and computed examples are not acceptance tests.

## H16 (CBirkbeck) — applied

"Owned here for others" (`:256–259`) now says that §0.12 owns `IsLocalRing.IsHenselization`, with
uniqueness through the canonical lifts, and that ModularCurves 4D consumes it together with
`local_henselization`. "Downstream consumers" (`:7741–7743`) records the same consumer. §0.12
(`:1170–1173`) handles a field-valued point `R → L` of an arbitrary ring by applying the predicate to
`R_𝔭` (`𝔭 = ker`), with no second predicate. The open ModularCurves revision (#1101, head `c97e999`)
still declares its own `IsHenselization ψ` and says it no longer consumes this roadmap. That revision
cannot be cited (it revises a roadmap on main), so the owner stays §0.12, consistent with main.
Whichever of the two merges second must be reconciled with this predicate.

## H17 (CBirkbeck) — applied differently

§0.13 now cites the pinned `TauCeti.Algebra.IndEtale` with its pinned API (`of_isColimit`, `of_etale`,
`of_equiv`, `flat`, `baseChange`, `of_isLocalization`, `localization`). The review's repair would have kept
`IndEtale.weaklyEtale` as a target, but it is also at the pin
(`TauCeti.Algebra.IndEtale.weaklyEtale`, `TauCeti/RingTheory/Etale/Weakly.lean:101`). So the only API
target left is *IndEtale.comp*, now with the locator Stacks Lemma 61.7.3 (097K).

The same defect is repaired for the henselization properties. These are now cited as pinned:
`Henselization.indEtale`, `faithfullyFlat_of_le_jacobson`, `quotient_pow_bijective`/`quotientPowEquiv`/`completionEquiv`,
`isNoetherianRing`/`faithfullyFlat_adicCompletion`, `directLimitEquiv`, `quotientBaseChangeEquiv` and
`algEquivOfRadicalEq`. The parts the pin lacks stay as targets: the filtered (non-directed) colimit, the
integral base change, 0H7Q, recognition, `at_prime` and `padic`.

## H18 (CBirkbeck) — applied

All twelve listed names are now *italic*, and the pattern is repaired across the README. A mechanical scan
found every backticked name whose first component is a namespace of `Suggested.lean`; 49 of them, at 61
places, are declared neither in the file nor at the pins (checked by `#check` against the pins), and all
are now italic. Three more names collided with this roadmap's own namespace and are written in full:
`TauCeti.Henselization.algebra`, `TauCeti.Henselization.map` and
`TauCeti.AlgebraicGeometry.Scheme.CartierDivisor.toLineBundleClassHom`. At `:124` the README now says
that *Scheme.Modules.Cohomology.formalFunctionsIso* and its file are proposed and exist nowhere at the
pins. `roadmaps resolve` now reports no Lean name found nowhere.

## H19 (CBirkbeck) — applied

`:4692` "Definition 48.28.1 (0E2S)" → "(0E2T)". In the Stacks text, 0E2S is Section 48.28 and 0E2T is
Definition 48.28.1 (Stacks book text in the sources cache, `5b3a46c2` line 197836).
`:5092–5095`: "Lemma 0CDU (1)" is dropped, since Lemma 53.17.2 is about `Pic(X_{k'})[n]` (`5b3a46c2`
line 212479). The Picard-torsor clause is now "the genus-one case of §3.6's *picardComponent_torsor*",
and §3.6 is added to §3.2's *Needs:*.

## H20 (CBirkbeck) — answered

Confirmed. The targeted build's only non-`sorry` warnings are Lake's module-system warnings, each printed
twice, on `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean`, `TauCetiRoadmap/EnhancedDerivedSheaves/Suggested.lean`
and `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean`. All three are main's files outside this folder; this
folder's file starts with `module` and raises none.

## Dropped suppliers (gate `dropped=39`, not raised by a reviewer)

AbundanceStatement and CommRingFactorizationSystems may not be cited as suppliers, and neither is on main.
The notions this roadmap took from them now move down into this roadmap:
- **Supplier table and comparisons.** The "Other supplier contracts" table (all four rows AbundanceStatement)
  is deleted, along with the comparison-only targets `*_abundanceSpecialization`/`*_abundanceComparison` in
  §§0.7, 2.6, 3.3, 4.13 and 5.10.
- **§5.9.** *surface_pairing* (`C · D = deg_C(O(D)|_C)` over every field) is now proved here.
- **§5.10.** Finite generation of `Num S` is now proved in every characteristic by the theorem of the base,
  which yields *Num.free_finiteRank*. *nakai_moishezon* is proved in every characteristic (Hartshorne V.1
  Thm 1.10, already cited). Its Checks are restated without the supplier.
- **§0.23.** The affine universal-homeomorphism criterion and the nil-ideal thickening are owned here, with
  the latter derived from Lemma 29.46.5.
- **Layer 5 and consumers.** The Layer 5 Dependencies and the AbelianSchemesAndArithmeticModuli consumer
  sentence are updated.

## Build and gate

- Build (`lake build TauCetiRoadmap.SchemeAndStackFoundations.Suggested TauCetiRoadmap.AdicEtaleGeometry.Suggested TauCetiRoadmap.EnhancedDerivedSheaves.Suggested`):
  `Build completed successfully (19050 jobs)`, exit 0. This file gives 76 `declaration uses 'sorry'`
  warnings and no errors; the other warnings are the six module-system warnings of H20.
- Gate: `gate SchemeAndStackFoundations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Direction check (`gate --depcheck … --movable`): `depcheck: 236 roadmaps, 2419 edges, 0 problem(s)`, with
  no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.

## Signature check

A scratch file with `#check @name` for all 172 declarations of `16d66b3` was elaborated once against the
built module.
- 170 resolve under `TauCetiRoadmap.SchemeAndStackFoundations`. The other two are the pre-existing
  `_root_.IsAzumaya.exists_etale_matrix_splitting` and `.etale_matrix_splitting_of_finite_cover`.
- Elaborated types of every changed declaration were compared with the README:
  `localCohomology_degreeZero`, `nonempty_localCohomology_flat_baseChange`, `DQCoh.nonempty_affineEquiv`,
  `vectorBundleDegree_pullback` (carrying `{k} [Field k]` from the section), `nonempty_lineBundleClass_spec_mulEquiv_pic`,
  `nonempty_CH_coprod` (carrying `κ`) and `weil_bound`. Each agrees with its README statement, and no
  binder is lost.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `localCohomology_degreeZero` | `I = ⊥`; `I = ⊤`; `ℤ`, `I = (p)`, `M = ℤ/p²`; `k[x₀,x₁,…]/(x_j^{j+2})`, `I = (x_j)` | `⊥`: torsion `= M = colim Hom(A, M)`. `⊤`: `n = 0` forces `m = 0`, and `H⁰ = colim Hom(0, M) = 0`. `ℤ/p²`: `I`-torsion has order `p`, `I`-power torsion and `H⁰` have order `p²`. Non-Noetherian ring: torsion `0`, as in the Check of §2.7 | holds; one-power torsion is the wrong model and is excluded by `∃ n` | restated (H15) |
| `nonempty_localCohomology_flat_baseChange` | `A = B`; `ℤ → ℚ`, `I = (p)`, `M = ℤ`, `q = 1` | `ℚ ⊗ ℤ[1/p]/ℤ = 0`, and `IB = ℚ` gives `H¹_ℚ(ℚ) = 0` | holds | renamed |
| `DQCoh.nonempty_affineEquiv` | `A = 0`; `A = k` | `Spec 0 = ∅`, so both categories are trivial; `D(k) ≌ D_QCoh(Spec k)`; any `HasDerivedCategory` model is equivalent to the standard one | holds | binder, rename |
| `vectorBundleDegree_pullback` | `f = 𝟙`; relative Frobenius of `ℙ¹` over `𝔽_p` with `O(1)`; finiteness of `f` | `finrank = 1`; `deg F^*O(1) = p = [K(X):K(Y)]`. Dominant `f` has fibres over closed points that are proper closed subsets, hence finite, and the generic fibre is `{η_X}`; so `f` is proper and quasi-finite, hence finite, and `rankAtStalk` at `η_Y` is `[K(X):K(Y)]` | holds | restated |
| `nonempty_lineBundleClass_spec_mulEquiv_pic` | `R = 0`, `ℤ`, `ℤ[√−5]` | trivial = trivial; `ℤ/2 = ℤ/2` | holds | `≃` → `≃*` |
| `nonempty_CH_coprod` | `I = ∅`; `I = Fin 1`; `∐_ℕ Spec κ` | `CH(∅) = 0 = ∏_∅`; `hX` pins the structure map to `Sigma.desc`; `CH₀ = ∏_ℕ ℤ` (Check `CH_coprod_countable_points`) | holds | binders, rename |
| `weil_bound` | `ℙ¹/𝔽_q`; `E/𝔽₂` with 5 points | `|q+1−(q+1)| = 0 ≤ 0`; `|5−3| = 2 ≤ 2√2` | holds | `Finite`/`Nat.card` |
| §0.12, field-valued point of a general base | `ℤ → 𝔽_p`; `ℤ → ℚ` | `ℤ_(p)^h`; the field `ℚ` | holds | sentence added |
| Scope: `StrictHenselization.algebra R Ω` satisfies `IsHenselization R Ω` | pinned inputs | `henselianLocalRing` needs `[Field Ω]`; `toTarget_surjective` and `ker_toTarget_eq_maximalIdeal` give `κ ≅ Ω` over `R`; `IndEtale.of_isColimit` gives ind-étale | holds | carrier from pin |
| *IndEtale.comp* | `R → R[1/f] → R[1/fg]` | localizations are ind-étale (pinned), and so is the composite | holds | locator 097K |
| §0.13 claim that `R^h → R^∧` is faithfully flat | `R` Noetherian | `faithfullyFlat_adicCompletion` gives `(R^h)^∧` faithfully flat over `R^h`, and `completionEquiv : R^∧ ≃ₐ[R] (R^h)^∧` transfers it | holds | cited |
| `test_henselization_quotient` | `n = 1` | `ℤ_(5)/5 = 𝔽₅` | holds | pinned name |
| *surface_pairing* | line `L` in `ℙ²` with `D = L`; normalization `ν` | `L·L = 1 = deg O(1)|_L`; `ν` birational gives `finrank 1`, so `deg ν^*L = deg L` | holds | owned here |
| `Num` finite in every characteristic | `ℙ²`; `E × E` | `Num ℙ² = ℤ`, `L² = 1`; rank `2 + rank End E` is 3 or 4, and 6 when `E` is supersingular | holds | Checks restated |
| *nakai_moishezon*, every characteristic | `ℙ¹ × ℙ¹`, `O(a,b)`; `−H` | `O(a,b)² = 2ab > 0` and `O(a,b)·F_i > 0` exactly when `a, b > 0`; `(−H)² > 0` but `−H·C < 0` | holds | Checks restated |
| `numericalQuotient_scalarExtensions` | `ℙ¹ × ℙ¹` | matrix `[[0,1],[1,0]]`, eigenvalues `±1`, signature `(1,1)`, `ρ = 2` | holds | restated |
| §0.23 affine criterion and thickening | `A → A/N` with `N` nil but not nilpotent | `Spec(A/N) → Spec A` is a bijective closed immersion, integral and universally injective, so 29.46.5 applies | holds | owned here |
| *genus_one_curves* (H19) | `E` elliptic | `deg O(O) = 1`; for `deg L = 1 > 0 = 2g−2`, `h⁰ = 1`, and the zero divisor has degree 1, which gives a rational point | holds | locator |
| 0E2T | Stacks text | Definition 48.28.1 is tag 0E2T | holds | tag |

## Ownership, overlaps, sources

- **Ownership.**
  - `IsLocalRing.IsHenselization` and ν are owned here, as H16 and H12 explain.
  - The strict henselization and the ind-étale predicate are cited from the pinned Tau Ceti.
  - The open revisions of ModularCurves (#1101) and EtaleCohomologyFoundations (#1891) were read with
    `roadmaps show`; both restate an object owned here.
- **Overlaps.** No id this README cites is dropped by an open pull request, and no id of this roadmap
  that others cite is dropped. Section ids are unchanged; renamed Lean names keep their README names.
  #1276, #1807, #1808 and #1854 conflict with this branch in this folder. #1808 removes every
  ModularCurves citation, including the 4D lines edited here, so the two agree in direction; whichever
  merges second rebases on the other.
- **Sources.** No source was fetched and no `needs-references.toml` was written.
  - Stacks tags were checked against the cached Stacks book text.
  - The Hartshorne, Lang–Néron and Kleiman locators were already in the README and were not re-read.
  - The package's `sources.toml` has no Stacks entry. That is outside this job's files.
