# Review of LocalPurity (pull request #1808 at c9403e2)

**Verdict:** needs changes

This is an incremental re-review. `TauCetiRoadmap/LocalPurity/` has 0 changed lines since `d1a45bf`, the head the previous review read. The commits since then touch only CharacteristicClasses and ComplexKahlerGeometry, and neither of those cites LocalPurity. The pins are unchanged (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`). So none of the nine previous findings is repaired. Each is restated below with the same number, re-checked at this head and at the pins. R01–R04 block. The push gate still fails (R06, R09).

## R01 (P2) — The headlines are stated through private stand-ins for pinned Tau Ceti definitions

**Location.** `TauCetiRoadmap/LocalPurity/Suggested.lean:65-96`: "`abbrev finiteEtale … abbrev FEt … def FEt.pullback … def puncturedSpectrum … def PurityHolds : Prop := (FEt.pullback (puncturedSpectrum A).ι).EssSurj`". The headlines at lines 106, 115 and 134 use these definitions.

**Claim.** The file defines its own finite étale carrier, punctured spectrum and purity predicate. Tau Ceti already has all three at the pin. The roadmap's own Scope (README line 58–59) says it "builds no second carrier".

**Witness.** `TauCeti.IsLocalRing.puncturedSpectrum` (`TauCeti/AlgebraicGeometry/PuncturedSpectrum.lean:52`). `restrictPunctured` and `PurityHolds` are at `…/FiniteEtale/PuncturedSpectrum.lean:55,63`, with `def PurityHolds : Prop := (restrictPunctured R).EssSurj`. The carrier equivalence is `TauCeti.FiniteEtaleScheme.equivOver` (`…/FiniteEtale/MorphismProperty.lean:39`).

**Repair.**
- Delete the five definitions at lines 63–98.
- Add `import TauCeti.AlgebraicGeometry.FiniteEtale.PuncturedSpectrum`.
- State `purityHolds_of_isRegularLocalRing … : TauCeti.IsLocalRing.PurityHolds A`.
- State `finiteEtale_extend_of_purity {X : Scheme.{u}} [IsNoetherian X] (U : X.Opens) (h : ∀ x : X, x ∉ U → TauCeti.IsLocalRing.PurityHolds (X.presheaf.stalk x)) : (TauCeti.FiniteEtaleScheme.pullback U.ι).EssSurj`.

Tested at this head: a scratch file with exactly these two statements, plus `etale_of_finiteNormal_of_isRegularLocalRing` unchanged, elaborates. Its only warnings are the three `declaration uses 'sorry'`.

## R02 (P2) — The README says Tau Ceti lacks this material, and plans targets that are already proved at the pin

**Location.** `README.md:14-18`: "Tau Ceti has finite étale schemes over a base and regular local rings as domains; … None of them has finite étale covers of punctured spectra or local purity." The same claim runs through the Scope (lines 48–56) and §§0.1, 0.2, 1.1 and 1.2. Lines 209–210 add "Tau Ceti's newer `FiniteEtaleScheme U` (not at this roadmap's pin)", which contradicts lines 61–62.

**Claim.** This is a false library claim. The roadmap owns, as its own targets, results that the pinned Tau Ceti already proves.

**Witness.** `TauCeti.IsLocalRing.PurityHolds` (`…/FiniteEtale/PuncturedSpectrum.lean:63`), `TauCeti.Algebra.etale_iff_isUnit_discr` (`RingTheory/Etale/Discriminant.lean:122`) and `TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two` (`RingTheory/RegularLocalRing/Purity.lean:75`) all exist at the pin `2fd255d`.

**Repair.**
- Rewrite lines 14–18.
- Move each item in the table below to "Owned elsewhere and consumed here" as "From Tau Ceti", with its name and module. All paths are under `TauCeti/` at the pin; I re-opened each one at this head.

| README target | Pinned declaration | File:line |
|---|---|---|
| §0.1 `flat_of_isCohenMacaulay` (00R4) | `TauCeti.Algebra.flat_of_isCohenMacaulay` | `RingTheory/RegularLocalRing/MiracleFlatness.lean:72` |
| §0.1 `flat_of_normal_dim_two` | `TauCeti.Algebra.flat_of_normal_dim_two` | same file, `:90` |
| §0.2 trace-form criterion | `TauCeti.Algebra.etale_iff_traceForm_nondegenerate` | `RingTheory/Etale/Discriminant.lean:66` |
| §0.2 discriminant criterion | `TauCeti.Algebra.etale_iff_isUnit_discr` (any commutative base) | same file, `:122` |
| §0.2 localization form | `TauCeti.Algebra.isUnit_discr_localization_iff` | same file, `:144` |
| §1.1 punctured spectrum and its API | `puncturedSpectrum`, `puncturedSpectrum_eq_iSup_basicOpen`, `isCompact_puncturedSpectrum` | `AlgebraicGeometry/PuncturedSpectrum.lean:52,81,99` |
| §1.1 purity and faithfulness for depth ≥ 1 | `PurityHolds`, `restrictPunctured_faithful_of_one_le_depth` | `…/FiniteEtale/PuncturedSpectrum.lean:63,119` |
| §1.2 0BM8, affine form | `TauCeti.AlgebraicGeometry.Spec.presheaf_map_leTop_bijective_of_isIntegral` | `AlgebraicGeometry/PuncturedSpectrum/Sections.lean:110` |
| §1.2 0BLK | `TauCeti.IsLocalRing.extends_iff_sections_finiteEtale` | `…/FiniteEtale/Extension.lean:111` |
| §1.2 0BM9: the category and full faithfulness | `FiniteNormalPuncturedEtaleAlg`, `restrictPuncturedSpec.fullyFaithful` | `…/FiniteEtale/FiniteNormal.lean:88,204` |
| §2.1 (2) for `d = 2` | `TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two` | `RingTheory/RegularLocalRing/Purity.lean:75` |
| §2.2 `restrictOpen_fullyFaithful_of_depth`, affine case | `TauCeti.FiniteEtaleScheme.fullyFaithfulPullbackιOfTwoLeDepth` | `…/FiniteEtale/FullyFaithful.lean:105` |
| Convention 5 counterexample | `not_flat_prod_residueField`, `not_etale_prod_residueField`, `isEtaleAt_prod_residueField` | `RingTheory/Etale/ProdResidueField.lean:147,153,82` |

- Cite depth as Mathlib's `IsLocalRing.depth` (`Mathlib/RingTheory/Depth/Basic.lean:78`), not SchemeAndStackFoundations §0.17 (Convention 4, line 116–117; the *Needs:* of §1.1).
- Cite Cohen–Macaulayness as Tau Ceti's `Module.IsCohenMacaulay` (`RingTheory/CohenMacaulay/Basic.lean:67`) and `TauCeti.Ring.IsCohenMacaulay` (`…/CohenMacaulay/Ring.lean:40`).
- Cite Serre's criterion as `TauCeti.forall_isDomain_and_isIntegrallyClosed_iff_satisfiesSerreR_one_and_satisfiesSerreS_two` (`RingTheory/SerreCondition/Normal.lean:214`).
- Delete the targets §0.1 and §0.2 and their Stacks-alignment rows.
- Delete the §1.1 definitions, their API, and 0BLK.
- Keep as targets only what is missing at the pin:
  - 0BM8 beyond the affine form;
  - the essential-surjectivity half of 0BM9;
  - §§1.3–1.4;
  - 0BMA (1), and (2) for `d ≥ 3`, citing the `d = 2` case;
  - the non-affine gluing of `restrictOpen_fullyFaithful_of_depth`;
  - §2.2's spreading out and 0EY7.
- Delete lines 209–212.
- Replace the Provenance table (lines 364–379) by the Tau Ceti modules, whose headers name the commit they were ported from, or delete it.
- Give every definition the roadmap keeps three Checks.

## R03 (P2) — The supplier for 0AFS and for depth `d` restates pinned Tau Ceti results

**Location.** `README.md:70-76`: SchemeAndStackFoundations §4.13 "concludes that a regular local ring is Mathlib's `IsRegularRing` … neither Mathlib's reverse implication … nor the regular-ring theorem by itself supplies it". The same supplier is cited at lines 16–17, 34, 37–40, 270–271, 286–290 and 326–328.

**Claim.** Both facts are pinned in Tau Ceti, and the first is an instance. Citing a roadmap section for them is supplier drift, and the sentence "neither … supplies it" is false at the pin.

**Witness.** `instance TauCeti.isRegularRing_of_isRegularLocalRing [IsRegularLocalRing R] : IsRegularRing R`, tagged `@[stacks 0AFS "second sentence"]` (`TauCeti/RingTheory/RegularLocalRing/ProjectiveDimension.lean:441`). `TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim` (`…/RegularLocalRing/CohenMacaulay.lean:110`). In a scratch file at this head, `example … [IsRegularLocalRing A] : IsRegularRing A := inferInstance` elaborates.

**Repair.**
- At all the lines above, cite those two declarations and `TauCeti.IsRegularRing.isIntegrallyClosed` (0567; an instance, `…/RegularLocalRing/Normal.lean:55`).
- Drop SchemeAndStackFoundations §4.13 from those *Needs:* lines and from the diagram at line 34.
- Delete the "neither … supplies it" sentence.

Tested at this head: for `A` regular local and `p` prime, `IsDomain (Localization.AtPrime p) ∧ IsIntegrallyClosed (Localization.AtPrime p)` closes by `⟨inferInstance, inferInstance⟩`. That is the normality step of §2.1, and it needs no roadmap supplier.

## R04 (P2) — Miracle flatness (00R4) has two owners in this pull request

**Location.**
- `README.md:52-53`: the roadmap owns "miracle flatness for a Cohen–Macaulay target (Algebra, Lemma 10.128.1 (00R4))".
- `README.md:135`: target `flat_of_isCohenMacaulay`.
- `README.md:141-143`: "ModularCurves §4D's miracle flatness … is the case of `flat_of_isCohenMacaulay`".

**Claim.** The same pull request makes SchemeAndStackFoundations §4.13 the owner of the identical statement, and ModularCurves now consumes that section. So lines 141–143 point at a ModularCurves section that no longer states the result. The statement is also pinned (R02).

**Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5850`: "Prove *miracle_flatness* (Stacks, Lemma 10.128.1 (00R4))". `TauCetiRoadmap/ModularCurves/README.md:309`: "Miracle flatness is SchemeAndStackFoundations §4.13's." `TauCeti.Algebra.flat_of_isCohenMacaulay` (`MiracleFlatness.lean:72`).

**Repair.**
- Delete the 00R4 ownership clause and the `flat_of_isCohenMacaulay` target.
- Cite `TauCeti.Algebra.flat_of_isCohenMacaulay` in §2.1's *Needs:*. Its hypotheses are `Module.IsCohenMacaulay S S` and the dimension equality.
- Delete lines 141–143.

## R05 (P3) — Padding in `Suggested.lean`

**Location.** `Suggested.lean:37` `flat_of_normal_dim_two`, `:46` `etale_iff_traceForm_nondegenerate`, `:54` `etale_iff_isUnit_discr`, `:126` `not_flat_prod_residueField`.

**Claim.** Each follows in one step from a pinned lemma. The last one is also a control that mirrors the README Checks `test_closed_point_factor` and `test_closed_point_factor_not_etale`.

**Witness.** On a scratch copy at this head, each of the following closes its statement:
- `exact TauCeti.Algebra.flat_of_normal_dim_two hinj hdim`;
- `exact TauCeti.Algebra.etale_iff_traceForm_nondegenerate K B`;
- `exact TauCeti.Algebra.etale_iff_isUnit_discr A B b`.

The fourth is `TauCeti.IsLocalRing.not_flat_prod_residueField A h` (`ProdResidueField.lean:147`), where `h : ¬IsField A` comes from `2 ≤ ringKrullDim A`.

**Repair.** Delete all four from `Suggested.lean`. The README keeps them as citations, per R02.

## R06 (P3) — Gate `readme-ids-missing` (4), and a target with no statement

**Location.** `README.md:187` `puncturedSpectrum_eq_iSup_basicOpen`. `README.md:251-252` `finiteEtale_extend_of_hypersurface`, and "its route through Lemma 58.20.6 as `finiteEtale_extend_of_localCohomology`". `README.md:322` `finiteEtale_extend_of_regular_codimTwo`.

**Claim.** These four backticked names belong to the roadmap but are not declared in `Suggested.lean`. `finiteEtale_extend_of_localCohomology` also has no hypotheses and no tag.

**Witness.** The gate on `c9403e2` reports `readme-ids-missing=4` with exactly these names. Stacks 58.20.6 is tag 0BLS (stacks-0BMA line 2449).

**Repair.**
- Write the first as the cited `TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen` (`PuncturedSpectrum.lean:81`), with its hypothesis `(Ideal.span s).radical = maximalIdeal R`.
- Write the other three as italic README-only names. AbhyankarLemma §3.3 cites the last one by name, and an italic name keeps that citation resolvable.
- State 58.20.6 with tag 0BLS and its hypotheses: `H¹_𝔪(A)` and `H²_𝔪(A)` are annihilated by a power of `f`, and `V_0` extends.

## R07 (P3) — README and Lean disagree on the headline names

**Location.** `README.md:42-43,264-265`: `IsLocalRing.purityHolds_of_isRegularLocalRing`, `Algebra.etale_of_finiteNormal_of_isRegularLocalRing`. `Suggested.lean:106,115`: the same names without the prefix.

**Claim.** The prefixed names are declared nowhere. Convention 6 puts ring-level statements in these namespaces, and a consumer cites the prefixed form.

**Witness.** The worker's citation scan reports both prefixed names as "found nowhere". `TauCetiRoadmap/PurityOfBranchLocus/README.md:57` cites `Algebra.etale_of_finiteNormal_of_isRegularLocalRing`.

**Repair.** Declare both with the prefix inside `namespace TauCetiRoadmap.LocalPurity`, and use the same names in the table rows at lines 358–359. Tested at this head: both elaborate with `sorry` as the only warning.

## R08 (P3) — Module docstring: wrong form and a false claim

**Location.** `Suggested.lean:5,17-19`: "…: suggested forms"; "Conditions whose Mathlib API does not exist at the pinned version (depth, Cohen–Macaulay) are not stated here".

**Claim.** The header is not in the "target signatures" form. It does not say which headlines are statable. The claim about depth and Cohen–Macaulay is false at the pins.

**Witness.** `noncomputable def IsLocalRing.depth` (`Mathlib/RingTheory/Depth/Basic.lean:78`). `def IsCohenMacaulay` in namespace `Module` (`TauCeti/RingTheory/CohenMacaulay/Basic.lean:67`).

**Repair.**
- Title it "Finite étale covers of punctured spectra and local purity: target signatures".
- Say that README.md is the roadmap and this file is not.
- Say that the file states the headlines 0BMA (1), 0BMA (2) and 0EY7 against the pinned Mathlib and Tau Ceti, and that all three are statable.
- Delete the depth/Cohen–Macaulay sentence and the sentence about the `MorphismProperty.Over` carrier (lines 16–17), which R01 makes obsolete.

## R09 (P3) — Gate `outside-folder` (2)

**Location.** `Completed/ArithmeticDirichletSeries/README.md:331` ("`LFunctions` consumes this package and supplies its own character-specific continuation") and `TauCetiRoadmap/SymplecticGeometry/README.md:77` ("adapters consumed by HeegaardFloer and consumed by DGFloer").

**Claim.** The pull request edits two roadmap folders that are not among the folders it claims as its own.

**Witness.** `git diff --stat origin/main...HEAD`, after excluding the 15 folders this pull request claims, lists exactly these two files, one line each. Neither folder is named in the title or the description.

**Repair.** Remove both edits from this branch, or name the two folders in the description so that each is reviewed as the pull request's own.

## Previous findings

- R01 — not repaired: `Suggested.lean:63-98` still defines `finiteEtale`, `FEt`, `FEt.pullback`, `puncturedSpectrum` and `PurityHolds`, and the headlines at lines 106, 115 and 134 use them.
- R02 — not repaired: `README.md:17-18` still says "None of them has finite étale covers of punctured spectra or local purity"; §§0.1, 0.2, 1.1 and 1.2 are still targets.
- R03 — not repaired: `README.md:74-76` still says "neither Mathlib's reverse implication … nor the regular-ring theorem by itself supplies it"; §4.13 is still the supplier at lines 34, 270, 286, 326.
- R04 — not repaired: `README.md:52-53` still owns "miracle flatness for a Cohen–Macaulay target", and lines 141–143 still cite "ModularCurves §4D's miracle flatness".
- R05 — not repaired: `Suggested.lean:37,46,54,126` unchanged; each still closes in one step from a pinned lemma (re-probed).
- R06 — not repaired: the gate on `c9403e2` reports `readme-ids-missing=4`, the same four names.
- R07 — not repaired: `Suggested.lean:106,115` still declare unprefixed names; `README.md:42-43` still uses the `IsLocalRing.`/`Algebra.` forms.
- R08 — not repaired: `Suggested.lean:5` still ends in "suggested forms"; lines 17–19 still claim depth and Cohen–Macaulay have no API at the pin.
- R09 — not repaired: the same two one-line edits to `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` remain on the branch.

## Verified sound

**The change since `d1a45bf`.**
- `git diff --stat d1a45bf c9403e2` touches only `TauCetiRoadmap/CharacteristicClasses/` (2 files) and `TauCetiRoadmap/ComplexKahlerGeometry/` (2 files).
- `grep LocalPurity` finds nothing in either folder, so the change makes no LocalPurity text wrong.
- `lake-manifest.json` is unchanged, so every pinned witness of the previous review still applies. I re-opened each one (below).
- Main moved from `54fc140` to `7bf4638` by one progress-report commit. That commit touches none of LocalPurity, SchemeAndStackFoundations, PurityOfBranchLocus, AbhyankarLemma or ModularCurves.

**Gate and build.**
- I ran the gate by hand on `c9403e2`. It fails on `readme-ids-missing=4` (R06). It also reports `outside-folder=27`, but 25 of those are the folders this pull request claims; the other 2 are R09. Every other check is 0.
- `lake env lean TauCetiRoadmap/LocalPurity/Suggested.lean` gives 7 warnings, all `declaration uses 'sorry'`, at lines 37, 46, 54, 106, 115, 126 and 134.
- The scratch probe file for R01, R03, R05 and R07 elaborates with 3 warnings, all `declaration uses 'sorry'`, on the three repaired headlines. The `inferInstance` example and the three one-step `exact` probes elaborate with no warning.
- Dependency check output: `depcheck: 238 roadmaps, 2346 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. LocalPurity and its suppliers SchemeAndStackFoundations, PurityOfBranchLocus and AbhyankarLemma are all on main.

**Signatures.** I compared the 12 elaborated types in the signature dump with their README statements. They are unchanged since the previous review, and no section binder is lost: `section Layer1` declares only `A` with `[CommRing A] [IsLocalRing A]`, and both of its declarations use them. The README generality (regular local, `d ≥ 2`; Noetherian `X`) matches the Lean.

**Library declarations re-opened at the pin (27).**
- Tau Ceti (24): `puncturedSpectrum` :52, `puncturedSpectrum_eq_iSup_basicOpen` :81, `isCompact_puncturedSpectrum` :99, `restrictPunctured` :55, `PurityHolds` :63, `restrictPunctured_faithful_of_one_le_depth` :119, `equivOver` :39, `flat_of_isCohenMacaulay` :72, `flat_of_normal_dim_two` :90, `etale_iff_traceForm_nondegenerate` :66, `etale_iff_isUnit_discr` :122, `isUnit_discr_localization_iff` :144, `presheaf_map_leTop_bijective_of_isIntegral` :110, `extends_iff_sections_finiteEtale` :111, `FiniteNormalPuncturedEtaleAlg` :88, `restrictPuncturedSpec.fullyFaithful` :204, `etale_of_finiteNormal_of_ringKrullDim_eq_two` :75, `fullyFaithfulPullbackιOfTwoLeDepth` :105, `not_flat_prod_residueField` :147, `not_etale_prod_residueField` :153, `isEtaleAt_prod_residueField` :82, `isRegularRing_of_isRegularLocalRing` :441, `IsRegularLocalRing.depth_eq_ringKrullDim` :110, `IsRegularRing.isIntegrallyClosed` :55.
- Mathlib (1): `IsLocalRing.depth` :78.
- Tau Ceti Cohen–Macaulay notions (2): `Module.IsCohenMacaulay` :67, `Ring.IsCohenMacaulay` :40.

The previous review's 30 Mathlib names are unaffected, since the pin is unchanged.

**Cross-roadmap citations re-resolved at this head (5).**
- SchemeAndStackFoundations README 5850 (*miracle_flatness*), 5861 (*IsRegularLocalRing.isCohenMacaulay*) and 5894 (*isRegularRing_of_isRegularLocalRing*).
- ModularCurves README 309.
- PurityOfBranchLocus README 56–58 (consumes §2.1 by the `Algebra.` name).

The other 16 citations the previous review resolved sit in files this change does not touch.

**Overlap.** The open pull requests #1807 and #1854 carry a LocalPurity README byte-identical to this head (`diff` empty). No id this roadmap cites is dropped by an open pull request. This pull request drops no LocalPurity id. Ownership against open pull requests was checked through the sibling checkouts and the roadmap index the brief provides.

**Sources.** No passage changed, so the seeded sample (§§0.1, 0.2, 1.1, 1.2, 1.3, 1.4, 2.1, 2.2) is carried from the previous review's 37 checked locators. I re-located 20 of them in the cached texts at the same lines:
- stacks-0BMA: 0BM7 2357, 0BM8 2366, 0BLK 2380, 0BM9 2391 (p. 51), 0BLF 2245, 0BLH 2266, 0BLL 2421, 0BLI 2283, 0EL8 2028, 0BM6 2342, 0BLJ 2351, 0BLS 2449, 0BLM 2459, 0BMA 2503 (p. 53), 0EY7 2604;
- stacks-00R4: 00R4 at line 14937;
- stacks-0BJF: 0BJF at line 269;
- stacks-0BQ5: 0BQ5 at 2571, 0EY3 at 2627;
- stacks-0EKS: 0EKS at line 2193.

I re-read the statements of 0BM9 (2391–2399) and 0BMA (2503–2507) for the Convention 5 correction.

**Adversarial pass.** No statement changed, so every row is carried from the previous review (`PRREVIEW-LocalPurity_r32`). Rows marked † I recomputed for this review.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 0BMA (1) `purityHolds_of_isRegularLocalRing` † | `d=1` `ℤ_(p)` with the cover `ℚ(√p)/ℚ`; `d=0` a field; `d=2` `k⟦x,y⟧` | DVR: the only candidate extension is the normalisation `ℤ_(p)[√p]`, ramified (disc `4p`), so purity fails and `d ≥ 2` is needed. Field: `U = ∅`, purity holds trivially. `k⟦x,y⟧`: hypotheses hold | true as stated (r32) | carrier (R01) |
| 0BMA (2) `etale_of_finiteNormal_…` † | `B = A × κ`; `B = 0`; `d=1` `ℤ_(p)[√p]` | `A×κ`: `κ` is killed by `𝔪 ≠ 0`, so not torsion free and excluded; over `U` it is `U → U`, étale, but not flat. `B=0`: vacuous, étale. `d=1`: hypotheses hold, `B` not étale, so `hd` is needed | true; torsion-freeness necessary (r32) | name (R07) |
| 0EY7 `finiteEtale_extend_of_purity` † | `X = Spec ℤ_(p)`, `U` the generic point; `X = 𝔸²`, `U = 𝔸²∖0`; `U = X` | closed point: purity fails, so the hypothesis fails and the cover `ℚ(√p)` does not extend. Origin of `𝔸²`: regular of dimension 2, so purity holds, and the conclusion holds. `U = X`: the functor is the identity | true; Stacks generality (Noetherian) matches (r32) | carrier (R01) |
| 00R4 miracle flatness | `R = k⟦x,y⟧`, `S = R[z]/(z², xz, yz)` | `dim S = 2 = 2 + 0`; depth 0, so not Cohen–Macaulay; `S ≅ R ⊕ k`, not flat | Check correct (r32) | cite Tau Ceti (R04) |
| `flat_of_normal_dim_two` | `A[z]/(z² − x)`; `k⟦x⁴,x³y,xy³,y⁴⟧` over `k⟦x⁴,y⁴⟧` | the first is free of rank 2; the second has rank 4 but 5 generators, is not normal, not flat | true (r32) | delete (R05) |
| trace-form criterion † | `k[x]/(x²)` in char ≠ 2; `K × K` | Gram matrix `[[2,0],[0,0]]`, det 0, not étale; `I₂`, det 1, étale | true (r32) | delete (R05) |
| discriminant criterion † | `ℤ_(p)[x]/(x² − d)`, `p` odd | trace matrix `[[2,0],[0,2d]]`, disc `4d`: a unit iff `d` is a unit; `d = p` gives `4p`, not étale | Checks correct (r32) | delete (R05) |
| localization form | `k⟦x,y⟧[z]/(z² − x)` at `(x)`, `(y)` | disc `4x`: a nonunit at `(x)`, a unit at `(y)` | true (r32) | cite (R02) |
| `puncturedSpectrum`, `…_eq_iSup_basicOpen` † | field; DVR; `k⟦x,y⟧` | `U = ∅`; `U = {η}`; `D(x) ∪ D(y) = Spec ∖ V(x,y)` | true (r32) | cite (R02, R06) |
| faithfulness for depth ≥ 1 | `A = k` | the two projections `k×k → k` agree on `U = ∅`, so not faithful at depth 0 | true (r32) | cite (R02) |
| 0BM8 / 0BLK | `k⟦x,y⟧`; `k⟦x,y⟧/(xy)` | `Γ(U,𝒪) = A`; at depth 1, `Γ(U,𝒪)` is not finite over `A` | true (r32) | cite (R02) |
| 0BM9 corrected † | `B = A × κ`, `A` normal of dimension ≥ 2 | `Γ(Spec B ×_X U, 𝒪) = Γ(U, 𝒪) = A ≠ B`: not in the essential image without torsion-freeness | correction needed and correct (r32) | — |
| §1.3, 0BLM | `k⟦x,y,z⟧`, `f = z` | depth 3; `(A,(z))` henselian | consistent (r32) | R06 for 0BLS |
| 0BQ5 / 0EY3 | `S = Spec ℤ`, `U = Spec ℤ[1/p]` | `Spec ℤ_(p) ×_S U = Spec ℚ`; `U` retrocompact | true (r32) | — |
| `finiteEtale_extend_of_regular_codimTwo` | `𝔸²`, `U = 𝔸²∖0` | affine opens Noetherian; regular of dimension ≥ 2 gives depth ≥ 2 and gluing | true (r32) | R06 |
| 0AFS instance / depth `d` † | `k⟦x,y⟧`; its localization at `(x)`; a field | depth 2 = dim 2 (`x, y` regular); DVR, regular; depth 0 = dim 0 | true; `inferInstance` closes (re-probed) | cite Tau Ceti (R03) |
| `test_purity_needs_regular` | `k[x²,xy,y²]_(0)`, `k[x,y]_(0)`, char ≠ 2 | `B/𝔪B` has dimension 3 ≠ 2 = degree; embedding dimension 3 > 2 | Check correct (r32) | — |

## Not verifiable

- I did not read the provenance repository (pcfawd-formalization) cited at README line 367. It is a secondary map that prescribes nothing, and R02 replaces it with the Tau Ceti modules.

## Source issues

- **Error** in stacks-0BMA at Lemma 58.20.3 (0BM9), p. 51: the source says sections give an equivalence onto all finite normal `A`-algebras étale over `U`; it should require `B` torsion free over `A`, since `A × A/𝔪` is not in the essential image; affects a stated result.
- **Error** in stacks-0BMA at Lemma 58.21.3 (0BMA), part (2), p. 53: the source says every finite normal `B` étale over the punctured spectrum is étale; `A × A/𝔪` is a counterexample, so it should require `B` torsion free over `A`; affects a stated result and the proof's step `dim B_𝔪′ = 2`.
- **Misprint** in stacks-0BQ5 at Lemma 32.20.4 (0EY3), p. 54: the source takes `U ⊂ U′ ⊂ X` for an open containing `s`; it should be `U ⊂ U′ ⊂ S`, since `X` names the scheme over `U′`; affects nothing.
