# Review of LocalPurity (pull request #1808 at d1a45bf)

**Verdict:** needs changes

The pull request changes only `TauCetiRoadmap/LocalPurity/README.md` in this folder: it repoints Serre's theorem (Stacks 0AFS) and "a regular local ring of dimension `d` has depth `d`" from PurityOfBranchLocus §0.3 to SchemeAndStackFoundations §4.13. This is a full review of the folder at this head. The main defect is that the pinned Tau Ceti already proves a large part of Layers 0–1 and the dimension-two case of §2.1. The README says Tau Ceti has none of this, and `Suggested.lean` restates it behind private stand-ins. R01–R04 block; R05–R09 are P3. The push gate fails (R06, R09).

## R01 (P2) — The headlines are stated through private stand-ins for pinned Tau Ceti definitions

**Location.** `TauCetiRoadmap/LocalPurity/Suggested.lean:65-96`: `finiteEtale`, `FEt`, `FEt.pullback`, `puncturedSpectrum`, `PurityHolds`. All three headlines (lines 106, 115, 134) are stated in terms of `PurityHolds`/`FEt.pullback`.

**Claim.** The file builds its own finite étale carrier, its own punctured spectrum and its own purity predicate. The repository README (Prototyping) asks instead for prototyping "against that implementation instead of restating it behind a private stand-in". The roadmap's own Scope (README line 58–59) also says it "builds no second carrier".

**Witness.** At the pin, `TauCeti.IsLocalRing.puncturedSpectrum` is at `TauCeti/AlgebraicGeometry/PuncturedSpectrum.lean:52`. `TauCeti.IsLocalRing.restrictPunctured` and `TauCeti.IsLocalRing.PurityHolds` are at `TauCeti/AlgebraicGeometry/FiniteEtale/PuncturedSpectrum.lean:55,63`; `PurityHolds` is "`(restrictPunctured R).EssSurj`". `TauCeti.FiniteEtaleScheme.equivOver` (`…/FiniteEtale/MorphismProperty.lean:40`) identifies Tau Ceti's carrier with the file's `FEt`.

**Repair.**
- Delete the five definitions.
- Import `TauCeti.AlgebraicGeometry.FiniteEtale.PuncturedSpectrum`.
- State `purityHolds_of_isRegularLocalRing … : TauCeti.IsLocalRing.PurityHolds A`.
- State `finiteEtale_extend_of_purity {X : Scheme.{u}} [IsNoetherian X] (U : X.Opens) (h : ∀ x : X, x ∉ U → TauCeti.IsLocalRing.PurityHolds (X.presheaf.stalk x)) : (TauCeti.FiniteEtaleScheme.pullback U.ι).EssSurj`.

Tested: a scratch copy with exactly these statements, plus `etale_of_finiteNormal_of_isRegularLocalRing` unchanged, elaborates with `sorry` as the only warning.

## R02 (P2) — The README says Tau Ceti lacks this material, and plans targets that are already proved at the pin

**Location.** `README.md:14-18`: "Tau Ceti has finite étale schemes over a base and regular local rings as domains; … None of them has finite étale covers of punctured spectra or local purity". The same claim runs through Scope lines 48–56, §0.1, §0.2, §1.1 and §1.2. Line 209–210 adds: "Tau Ceti's newer `FiniteEtaleScheme U` (not at this roadmap's pin)". That contradicts line 61–62, which cites it at the pin. The Provenance table (lines 371–376) maps these targets to the pcfawd repository.

**Claim.** This is a false library claim. The roadmap owns, as its own targets, results the pinned Tau Ceti already proves. The Tau Ceti files' headers say they were "Ported from … pcfawd-formalization at commit `9a20b3f`".

**Witness.** README target → pinned declaration (all files under `TauCeti/` at the pin):

| README target | Pinned declaration | File:line |
|---|---|---|
| §0.1 `flat_of_isCohenMacaulay` (00R4) | `TauCeti.Algebra.flat_of_isCohenMacaulay` | `RingTheory/RegularLocalRing/MiracleFlatness.lean:72` |
| §0.1 `flat_of_normal_dim_two` | `TauCeti.Algebra.flat_of_normal_dim_two` | same file, `:90` |
| §0.2 trace-form criterion | `TauCeti.Algebra.etale_iff_traceForm_nondegenerate` | `RingTheory/Etale/Discriminant.lean:66` |
| §0.2 discriminant criterion | `TauCeti.Algebra.etale_iff_isUnit_discr`, over any commutative ring | same file, `:122` |
| §0.2 localization form | `TauCeti.Algebra.isUnit_discr_localization_iff` | same file, `:144` |
| §1.1 punctured spectrum and its API | `puncturedSpectrum_eq_iSup_basicOpen`, `isCompact_puncturedSpectrum` | `AlgebraicGeometry/PuncturedSpectrum.lean:81,99` |
| §1.1 faithfulness for depth ≥ 1 | `restrictPunctured_faithful_of_one_le_depth` | `…/FiniteEtale/PuncturedSpectrum.lean:119` |
| §1.2 0BM8, affine form | `TauCeti.AlgebraicGeometry.Spec.presheaf_map_leTop_bijective_of_isIntegral` | `AlgebraicGeometry/PuncturedSpectrum/Sections.lean:110` |
| §1.2 0BLK | `TauCeti.IsLocalRing.extends_iff_sections_finiteEtale` | `…/FiniteEtale/Extension.lean:111` |
| §1.2 0BM9: the category and full faithfulness | `TauCeti.IsLocalRing.FiniteNormalPuncturedEtaleAlg`, `restrictPuncturedSpec.fullyFaithful` | `…/FiniteEtale/FiniteNormal.lean:88,204` |
| §2.1 (2) for `d = 2` | `TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two` | `RingTheory/RegularLocalRing/Purity.lean:75` |
| §2.2 `restrictOpen_fullyFaithful_of_depth`, affine case | `TauCeti.FiniteEtaleScheme.fullyFaithfulPullbackιOfTwoLeDepth` | `…/FiniteEtale/FullyFaithful.lean:105` |
| Convention 5 counterexample | `TauCeti.IsLocalRing.not_flat_prod_residueField`, `not_etale_prod_residueField`, `isEtaleAt_prod_residueField` | `RingTheory/Etale/ProdResidueField.lean:147,153,82` |

In the same way, depth is Mathlib's `IsLocalRing.depth` (`Mathlib/RingTheory/Depth/Basic.lean:78`), not SchemeAndStackFoundations §0.17 (Convention 4, line 79, the *Needs:* of §1.1). Cohen–Macaulayness is Tau Ceti's `Module.IsCohenMacaulay` (`RingTheory/CohenMacaulay/Basic.lean:67`) and `TauCeti.Ring.IsCohenMacaulay` (`…/Ring.lean:40`). Serre's criterion is `TauCeti.forall_isDomain_and_isIntegrallyClosed_iff_satisfiesSerreR_one_and_satisfiesSerreS_two` (`RingTheory/SerreCondition/Normal.lean:214`).

**Repair.**
- Rewrite lines 14–18.
- Move every item in the table to "Owned elsewhere and consumed here" as "From Tau Ceti", with name and module.
- Delete the targets §0.1 and §0.2 and their Stacks-alignment rows. Their Checks become the README's descriptions of the cited statements, or are deleted.
- Delete the §1.1 definitions, API and 0BLK.
- Keep only what is missing at the pin:
  - 0BM8 beyond the affine form;
  - the essential-surjectivity half of 0BM9;
  - §§1.3–1.4;
  - 0BMA (1), and (2) for `d ≥ 3`, with `d = 2` cited;
  - the non-affine gluing of `restrictOpen_fullyFaithful_of_depth`;
  - §2.2's spreading out and 0EY7.
- Delete lines 209–212.
- Replace the Provenance table by the Tau Ceti modules, or delete it.
- Any definition this roadmap keeps carries three Checks. §1.1 has none today.

## R03 (P2) — The new supplier for 0AFS and for depth `d` restates pinned Tau Ceti results

**Location.** This is the pull request's own change. `README.md:70-76` says SchemeAndStackFoundations §4.13 "concludes that a regular local ring is Mathlib's `IsRegularRing` … neither Mathlib's reverse implication … nor the regular-ring theorem by itself supplies it". The same supplier is cited at lines 16–17, 34, 37–40, 270–271, 286–290 and 326–328.

**Claim.** Both facts are pinned in Tau Ceti, and the first is an instance. A citation of a roadmap section that plans a result already in the pinned library is supplier drift. The sentence "neither … supplies it" is false at the pin.

**Witness.**
- `instance TauCeti.isRegularRing_of_isRegularLocalRing [IsRegularLocalRing R] : IsRegularRing R`, tagged `@[stacks 0AFS "second sentence"]` (`TauCeti/RingTheory/RegularLocalRing/ProjectiveDimension.lean:441`).
- `TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim` (`…/RegularLocalRing/CohenMacaulay.lean:110`).
- `example … [IsRegularLocalRing A] : IsRegularRing A := inferInstance` elaborates.

**Repair.**
- Cite these two declarations, and `TauCeti.IsRegularRing.isIntegrallyClosed` (0567, `…/RegularLocalRing/Normal.lean:54`), at all the lines above.
- Drop SchemeAndStackFoundations §4.13 from those *Needs:* lines and from the diagram at line 34.
- Delete the "neither … supplies it" sentence.

Tested: for `A` regular local and `p` prime, `IsDomain (Localization.AtPrime p) ∧ IsIntegrallyClosed (Localization.AtPrime p)` closes by `⟨inferInstance, inferInstance⟩` at the pins. That is the normality step of §2.1 (Convention 3) with no roadmap supplier.

## R04 (P2) — Miracle flatness (00R4) has two owners after this pull request

**Location.**
- `README.md:52-53`: the roadmap "owns … miracle flatness for a Cohen–Macaulay target (Algebra, Lemma 10.128.1 (00R4))".
- `README.md:135`: target `flat_of_isCohenMacaulay`.
- `README.md:141-143`: "ModularCurves §4D's miracle flatness … is the case of `flat_of_isCohenMacaulay`".

**Claim.** The same pull request makes SchemeAndStackFoundations §4.13 the owner of the identical statement. ModularCurves §4D now consumes that section, so line 141–143 points at a section that no longer states miracle flatness. The statement is also pinned (R02).

**Witness.**
- `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5850`: "Prove *miracle_flatness* (Stacks, Lemma 10.128.1 (00R4))", with the same hypotheses.
- `TauCetiRoadmap/ModularCurves/README.md:309`: "Miracle flatness is SchemeAndStackFoundations §4.13's."
- `TauCeti.Algebra.flat_of_isCohenMacaulay` (`MiracleFlatness.lean:72`).

**Repair.**
- Delete the 00R4 ownership clause and the `flat_of_isCohenMacaulay` target here.
- Cite `TauCeti.Algebra.flat_of_isCohenMacaulay` (hypotheses: `Module.IsCohenMacaulay S S` and the dimension equality) in §2.1's *Needs:*.
- Delete lines 141–143.

SchemeAndStackFoundations should cite the same declaration; that is for its own review.

## R05 (P3) — Padding in `Suggested.lean`

**Location.** `Suggested.lean:37` `flat_of_normal_dim_two`, `:46` `etale_iff_traceForm_nondegenerate`, `:54` `etale_iff_isUnit_discr`, `:126` `not_flat_prod_residueField`.

**Claim.** These follow from pinned lemmas. The last one is a control that mirrors the README Checks `test_closed_point_factor` and `test_closed_point_factor_not_etale`.

**Witness.** One-tactic probe on a scratch copy:
- `exact TauCeti.Algebra.flat_of_normal_dim_two hinj hdim` closes the first.
- `exact TauCeti.Algebra.etale_iff_traceForm_nondegenerate K B` closes the second.
- `exact TauCeti.Algebra.etale_iff_isUnit_discr A B b` closes the third.
- The fourth is `TauCeti.IsLocalRing.not_flat_prod_residueField A h`, where `h : ¬IsField A` comes from `2 ≤ ringKrullDim A`.

**Repair.** Delete all four from `Suggested.lean`. The README keeps the statements, as citations per R02.

## R06 (P3) — Gate `readme-ids-missing` (4), and a target with no statement

**Location.**
- `README.md:187`: `puncturedSpectrum_eq_iSup_basicOpen`.
- `README.md:251-252`: `finiteEtale_extend_of_hypersurface`, and "its route through Lemma 58.20.6 as `finiteEtale_extend_of_localCohomology`".
- `README.md:322`: `finiteEtale_extend_of_regular_codimTwo`.

**Claim.** These four backticked names of the roadmap's own are not declared in `Suggested.lean`. `finiteEtale_extend_of_localCohomology` also has no hypotheses and no tag.

**Witness.** The gate run on this head reports `readme-ids-missing=4` with exactly these names. Stacks 58.20.6 is tag 0BLS (stacks-0BMA line 2449). Its hypotheses are that H¹_𝔪(A) and H²_𝔪(A) are killed by a power of `f`, and that `V_0` extends.

**Repair.**
- Write the cited name `TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen`, with its hypothesis `(Ideal.span s).radical = maximalIdeal R`, in place of the first.
- Write the other three as italic README-only names, the convention SchemeAndStackFoundations uses. AbhyankarLemma §3.3 cites the last one by name, and its citation stays resolvable.
- State 58.20.6 with tag 0BLS and the hypotheses above.

## R07 (P3) — README and Lean disagree on the headline names

**Location.**
- `README.md:42-43,264-265`: `IsLocalRing.purityHolds_of_isRegularLocalRing`, `Algebra.etale_of_finiteNormal_of_isRegularLocalRing`.
- `Suggested.lean:106,115`: the same names without the `IsLocalRing.`/`Algebra.` prefix.

**Claim.** The prefixed names are declared nowhere. Convention 6 puts ring-level statements in these namespaces. PurityOfBranchLocus cites the `Algebra.` form.

**Witness.** The citations scan reports both prefixed names as "found nowhere". `TauCetiRoadmap/PurityOfBranchLocus/README.md:57` cites `Algebra.etale_of_finiteNormal_of_isRegularLocalRing`.

**Repair.** Declare them as `IsLocalRing.purityHolds_of_isRegularLocalRing` and `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` inside `namespace TauCetiRoadmap.LocalPurity`, and use the same names in the table rows at lines 358–359. Tested: both elaborate, with `sorry` as the only warning.

## R08 (P3) — Module docstring: wrong form and a false claim

**Location.** `Suggested.lean:4-19`: the title "…: suggested forms", and "Conditions whose Mathlib API does not exist at the pinned version (depth, Cohen–Macaulay) are not stated here".

**Claim.** The header is not the "target signatures" form. It does not say which headlines are statable. The claim about depth and Cohen–Macaulay is false at the pins.

**Witness.** Mathlib has `IsLocalRing.depth` (`Mathlib/RingTheory/Depth/Basic.lean:78`). Tau Ceti has `Module.IsCohenMacaulay` (`TauCeti/RingTheory/CohenMacaulay/Basic.lean:67`).

**Repair.** Use "Finite étale covers of punctured spectra and local purity: target signatures". Say that README.md is the roadmap and this file is not, that the file states the headlines 0BMA (1), 0BMA (2) and 0EY7 against the pinned Mathlib and Tau Ceti, and that all of them are statable at the pins. Delete the depth/Cohen–Macaulay sentence.

## R09 (P3) — Gate `outside-folder` (2)

**Location.** `Completed/ArithmeticDirichletSeries/README.md:331` and `TauCetiRoadmap/SymplecticGeometry/README.md:77`. Each is a one-line rewording.

**Claim.** The pull request edits two roadmap folders that are not among the folders it claims as its own.

**Witness.** The gate on this head lists exactly these two files under `outside-folder`. Neither folder appears in the pull request's title, its description, or the list of folders under review.

**Repair.** Remove both edits from this branch, or name the two folders in the description so that they are reviewed as the pull request's own.

## Verified sound

**Gate and build.**
- The gate on `d1a45bf` reports `readme-ids-missing=4` (R06) and `outside-folder=2` once the folders this pull request claims are excluded (R09). Every other check is 0.
- `lake env lean TauCetiRoadmap/LocalPurity/Suggested.lean` gives 7 warnings, all `declaration uses 'sorry'`.
- Dependency check: `depcheck: 240 roadmaps, 2433 edges, 0 problem(s)`. LocalPurity, SchemeAndStackFoundations, PurityOfBranchLocus and AbhyankarLemma are all on main, so there is no upward or cyclic supply.

**Signatures.** I compared the elaborated types of all 12 declarations with their README statements. No section binder is lost: `section Layer1` declares only `A` with `[CommRing A] [IsLocalRing A]`, and both of its declarations use them. The generality matches the README. The three headlines also elaborate on the pinned carriers (R01) and with namespaced names (R07).

**Overlap.**
- The open pull requests #1807 and #1854 carry a LocalPurity README identical to this head (`diff` is empty), so there is no conflicting head for this folder.
- No id this roadmap cites is dropped by an open pull request, and this pull request drops no LocalPurity id.
- PurityForFlatCohomology (open, new) already records that Tau Ceti "realises LocalPurity §1.1" (its README lines 86–90). It consumes `purityHolds_of_isRegularLocalRing` and `finiteEtale_extend_of_purity`, which keep their names under the repairs.

**Cross-roadmap citations resolved at this head (16).**
- SchemeAndStackFoundations: §0.6 `coherent_hartogs` (line 774); §0.9 `finite_presentation_limits` (913); §0.14 *henselian_finiteEtale_equivalence* (1217); §0.17 `Module.SatisfiesSerreS` (1306), `isCohenMacaulay_iff_forall_satisfiesSerreS` (1310), `Ring.IsCohenMacaulay.of_isRegularRing` (1295); §2.7 `depth_localCohomology_vanishing` (3698), `localCohomology_module_comparison` (3685); §4.8 `Formal.Scheme.CoherentFormalModule` (5639); §4.13 `serre_normality_criterion` (5938), *IsRegular.isNormal* (5841), *isRegularRing_of_isRegularLocalRing* and *IsRegularLocalRing.isCohenMacaulay* (5859–5898).
- PurityOfBranchLocus §2.1 consumes §2.1 (line 56).
- AbhyankarLemma consumes §§2.1–2.2 (lines 28, 265–267).
- ModularCurves §4D is stale (R04).

**Library names opened at the pin.**
- Mathlib (30, all resolved by `#check`): `Algebra.HasGoingDown` (`@[stacks 00H8]`, `IntegralClosure/GoingDown.lean:48`), `Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown` (`@[stacks 00ON]`, `Ideal/KrullsHeightTheorem.lean:483`), `traceForm_nondegenerate_tfae` (`@[stacks 0BIL]`, `Trace/Basic.lean:507`), `Algebra.discr`, `Algebra.traceForm`, `Algebra.trace_localization`, `Algebra.TensorProduct.basis`, `IsRegularLocalRing` (extends `IsLocalRing`, `IsNoetherianRing`; `RegularLocalRing/Defs.lean:52`), `IsRegularRing`, `IsRegularLocalRing.of_isRegularRing_of_isLocalRing`, `MorphismProperty.Over.pullback`, `PrimeSpectrum.basicOpen`, `IsLocalRing.closedPoint`, `integralClosure`, `IsIntegralClosure`, `Algebra.IsEtaleAt`, `AdicCompletion`, `AdicCompletion.flat_of_isNoetherian`, `localCohomology`, `Ideal.height_le_one_of_isPrincipal_of_mem_minimalPrimes`, `Module.free_of_flat_of_isLocalRing`, `Module.flat_of_isLocalized_maximal`, `Module.IsTorsionFree`, `CommAlgCat`, `IsNoetherian`, `IsLocallyNoetherian`, `Scheme.Opens`, `IsAffineOpen`, `IsLocalRing.depth`.
- Tau Ceti (24): `TauCeti.IsRegularLocalRing.isDomain`, `TauCeti.IsRegularLocalRing.quotient_span_singleton`, `TauCeti.FiniteEtaleScheme` (`FiniteEtale/Basic.lean:66`), and the 21 declarations listed in R01–R04.

**Sources (37 locators checked, all correct).**
- Chapter 58 (stacks-0BMA):
  - 0BL6 (line 529); 0BN9 (550).
  - 0EL8 (2028): the hypotheses and conclusion match the target.
  - 0BLF (2245); 0BLH (2266); 0BLI (2283).
  - 0BM6 (2342): H¹, H² killed by a power of `f`, and a henselian pair, as the README states.
  - 0BLJ (2351): depth ≥ 3.
  - 0BM7 (2357): purity is essential surjectivity, `A` Noetherian.
  - 0BM8 (2366): depth ≥ 2 at closed points of `Y`.
  - 0BLK (2380): depth ≥ 2, and equivalence (1) ⇔ (2).
  - 0BM9 (2391); 0BLL (2421); 0BLS (2449).
  - 0BLM (2459): depth ≥ 3, and `V_0` extends.
  - 0BMA (2503): regular, `d ≥ 2`, parts (1) and (2).
  - 0EY7 (2604): an open immersion of *Noetherian* schemes, matching the README's generality and `[IsNoetherian X]`.
- Algebra (stacks-00R4): 00R4 (14937), 00GV (3976), 00NP (11920), 00NQ (11925), 031S (20161), 0567 (20195), 0AFS (12566), 00H8 (4098), 00ON (12677).
- Discriminants 0BJF (stacks-0BJF line 269); its field case is in the proof (273–285).
- More on Algebra (stacks-09ZL): 09ZL (1758), 05ER (11528), 05EU (11624).
- Divisors 0E9I (stacks-0E9I line 335).
- Algebraic and Formal Geometry (stacks-0EKS): 0EKS (2193), 0EII (1923), 0EKP (2094).
- Limits (stacks-0BQ5): 0BQ5 (2571), 0EY3 (2627).
- SGA 2, Exposé X, Théorème 3.4 (i) (sga2 line 3390, p. 94).
- SGA 1, Exposé X, Théorème 3.1 (sga1 line 8359, p. 212).

The Convention 5 correction to 0BM9 and 0BMA (2) is right; see Source issues.

**Adversarial pass.**

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 0BMA (1) `purityHolds_of_isRegularLocalRing` | `d=1`: `ℤ_(p)`, cover `ℚ(√p)` of `U=Spec ℚ`; `d=0`: field; `d=2`: `k⟦x,y⟧`; A1 singularity | DVR: the only extension would be the normalisation `ℤ_(p)[√p]`, which is ramified, so purity fails and `d≥2` is needed; field: `U=∅`, purity holds trivially; A1 singularity: purity fails (normal, not regular) | true as stated | carrier only (R01) |
| 0BMA (2) `etale_of_finiteNormal_…` | `B=0`; `B=A×κ`; `B=A×_k A`; `d=1` `ℤ_(p)[√p]`; `d=0` `𝔽_p(t^{1/p})/𝔽_p(t)` | `0`: hypotheses vacuous, étale ✓; `A×κ`: κ is torsion, excluded; `A×_k A`: localization at its maximal ideal is not a domain, excluded by `hnormal`; `d=1`, `d=0`: hypotheses hold, not étale, so `hd` is needed | true; torsion-freeness is necessary | name (R07) |
| 0EY7 `finiteEtale_extend_of_purity` | `X=Spec ℤ_(p)`, `U` generic; `X=𝔸²`, `U=𝔸²∖0`; cone over a conic; `U=X`; `X=∅` | purity fails at the closed point and so does the conclusion; at `0` purity holds and every cover extends; vertex: purity fails and the μ₂ cover does not extend; `U=X`, `X=∅`: nothing to extend | true; Stacks's generality matches | carrier only (R01) |
| 00R4 miracle flatness | `R=k⟦x,y⟧`, `S=R[z]/(z²,xz,yz)` | `dim S=2=2+0`; `z` is killed by `(x,y,z)`, so depth 0 and not Cohen–Macaulay; `S≅R⊕k` as an `R`-module, not flat ✓ | Check correct | cite Tau Ceti (R04) |
| `flat_of_normal_dim_two` | `B=A[z]/(z²−x)`; `B=k⟦x⁴,x³y,xy³,y⁴⟧` over `k⟦x⁴,y⁴⟧` | the first is free of rank 2 ✓; the second has rank 4 but 5 generators (`1,x³y,xy³,x⁶y²,x²y⁶`), not normal (`x²y²` integral), not flat: normality is needed | true | delete (R05) |
| trace-form criterion | `k[x]/(x²)` in char ≠2 and char 2; `𝔽_p(t^{1/p})`; `K×K`; `B=0` | Gram matrices `[[2,0],[0,0]]` and `[[0,0],[0,0]]`, det 0, not étale; zero form; `I₂`, det 1, étale; the empty form is nondegenerate and `0` is étale | true | delete (R05) |
| discriminant criterion | `ℤ_(p)[x]/(x²−d)` for `p` odd, `d` a unit; `d=p`; `p=2`, `d=−3` | disc `4d` (unit, étale); `4p` (nonunit, ramified); `−12` (nonunit; mod 2, `(x+1)²` is not reduced, not étale) | Checks correct | delete (R05) |
| localization form | `B=k⟦x,y⟧[z]/(z²−x)` at `(x)`, `(y)` | disc `4x`: nonunit at `(x)`, ramified; unit at `(y)`, étale | true | cite (R02) |
| `puncturedSpectrum`, `puncturedSpectrum_eq_iSup_basicOpen` | field; DVR; `k⟦x,y⟧` with generators `x,y`; `s=∅` for a field | `U=∅`; `U={η}`; `D(x)∪D(y)=Spec∖V(x,y)`; the empty supremum is `∅` | true | cite (R02, R06) |
| faithfulness for depth ≥ 1 | `A=k` (depth 0); depth ≥ 1 | the two projections `k×k→k` agree on `U=∅`, so not faithful; depth ≥1 gives dim ≥1, `U` dense, faithful | true (weaker than Tau Ceti's iff) | cite (R02) |
| 0BM8 / 0BLK | `A=k⟦x,y⟧`, `V=U`; `A=k⟦x,y⟧/(xy)` (depth 1); the A1 cover | `Γ(U,𝒪)=A`, finite étale ✓; at depth 1, `Γ(U,𝒪)` is not finite over `A`, so the depth hypothesis is needed; `Γ=k⟦x,y⟧`, not étale over the invariants, so no extension ✓ | true | cite (R02) |
| 0BM9 corrected | `B=A×κ`, `A` normal of dim ≥2 | `Γ(Spec B ×_X U)=Γ(U,𝒪)=A≠B`: not in the essential image of the uncorrected category | correction needed and correct | — |
| §1.3, 0BLM | `A=k⟦x,y,z⟧`, `f=z` | depth 3, `(A,(z))` henselian, so the hypotheses hold; purity on both sides is consistent with the conclusion | consistent | R06 for 0BLS |
| 0BQ5 / 0EY3 `spread_from_localScheme` | `S=Spec ℤ`, `U=Spec ℤ[1/p]`, `s=(p)` | `Spec ℤ_(p) ×_S U = Spec ℚ`; Noetherian, so `U` is retrocompact | true | — |
| `finiteEtale_extend_of_regular_codimTwo` | `𝔸²`, `U=𝔸²∖0` | affine opens are Noetherian; regular of dim ≥2 gives depth ≥2 and full faithfulness, which glues the extensions | true; statable (elaborated) | R06 |
| 0AFS instance / depth `d` | `k⟦x,y⟧` at `(x)`; `k⟦x,y⟧`; a field | DVR, regular ✓; `x,y` regular sequence, depth 2 = dim 2; depth 0 = dim 0 | true | cite Tau Ceti (R03) |
| `test_purity_needs_regular` | `A=k[x²,xy,y²]_(0)`, `B=k[x,y]_(0)`, char ≠2 | one prime over `𝔪`, so `B` is local and finite; μ₂ is free off `0`, so étale over `U`; `B/𝔪B` has dimension 3 ≠ 2 = degree, not étale; `A` has embedding dimension 3 > 2, normal, not regular | Check correct | — |

## Not verifiable

- I did not read the provenance repository (pcfawd-formalization) cited at README line 367. It is a secondary map that prescribes nothing, and R02 replaces it with the Tau Ceti modules, whose headers name the commit they were ported from.
- Ownership against open pull requests was checked through the sibling checkouts and the roadmap index the brief provides; nothing remained unchecked.

## Source issues

- **Error** in stacks-0BMA at Lemma 58.20.3 (0BM9), p. 51: the source says sections give an equivalence onto all finite normal `A`-algebras étale over `U`; it should require `B` torsion free over `A`, since `A × A/𝔪` is not in the essential image; affects a stated result.
- **Error** in stacks-0BMA at Lemma 58.21.3 (0BMA), part (2), p. 53: the source says every finite normal `B` étale over the punctured spectrum is étale; `A × A/𝔪` is a counterexample, so it should require `B` torsion free over `A`; affects a stated result and the proof's step `dim B_𝔪′ = 2`.
- **Misprint** in stacks-0BQ5 at Lemma 32.20.4 (0EY3), p. 54: the source takes `U ⊂ U′ ⊂ X` for an open containing `s`; it should be `U ⊂ U′ ⊂ S`, since `X` names the scheme over `U′`; affects nothing.
