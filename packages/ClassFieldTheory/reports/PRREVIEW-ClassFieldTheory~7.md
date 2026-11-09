# Review of ClassFieldTheory (pull request #1215 at edbf5e9)

**Verdict:** needs changes

Nine findings: four blocking (two P1, two P2) and five P3. The worker's gate fails (`build=16`), and a second consumer that the gate did not build fails too. No file of the pull request was changed by this review.

## Previous findings, checked first

The previous review read `9eebcb3`. The folder has changed by 2128 lines since, so this is a full review. No repair report marking a finding "not actionable in this package" was available.

| Previous finding | Passage at this head | Assessment |
|---|---|---|
| R01 (P1) consumer build fails | QuadraticFormInvariants now imports Tau Ceti (`TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:4–5`) and builds inside the gate. `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean:4` still imports this module. | **Partly repaired.** QuadraticFormInvariants is fixed. GlobalQuadraticForms still fails (R01 below), and Completed/LocalGaloisGroups also breaks (R02). |
| R02 (P2) statable headlines omitted | `Suggested.lean:35–37` now credits Tau Ceti's `localWeilArtinEquiv`. `Suggested.lean:124` states the principal ideal theorem. `Suggested.lean:22–23` consumes `Rep.projective_of_isZero_res`. | **Repaired.** |
| R03 (P2) README replans native objects | `README.md:70–73`: "Tau Ceti implements most of them at the pin; that material is consumed under Tau Ceti's names". Layers 0–6, 8, 9, 11, 12 and 14 are now contracts. | **Repaired.** Every Tau Ceti name the README cites resolves at the pin (Verified sound). The Layer 5 contract is still mis-stated (R03 below). |
| R04 (P2) equal-characteristic overlap | `README.md:173–174`: "The upper-numbering theorem and the conductor–discriminant formula of Layer 7 stay here in every characteristic". | **Partly repaired.** The boundary is now stated here. The FunctionFieldArithmetic head still states the same theorem (R04 below). |
| R05 (P2) ring class fields quadratic-only | `README.md:459–462`: "A ring class field is defined for **every** order `O` of every number field". | **Repaired.** |
| R06 (P2) Weil functoriality without separability | `README.md:1148–1150`: "a chosen `K`-embedding `ι : L →ₐ[K] Kˢ`", with the inseparable Check at 1168–1171. | **Repaired.** |
| R07 (P3) dimension restatements | No longer in `Suggested.lean`. | **Repaired.** |
| R08 (P3) shape, locators, Checks | `README.md:282` now gives "Chapter XIV §6, p. 163", and the backticked names resolve. The headings, contracts form, per-target *Needs:* lines and locators at the claims are unchanged. | **Partly repaired.** See R08 and R09 below. |

## R01 (P1) — The gate's build fails: GlobalQuadraticForms still uses the deleted declarations

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean:4`: "import TauCetiRoadmap.ClassFieldTheory.Suggested". The file also uses `TauCetiRoadmap.ClassFieldTheory.cyclicHasseNorm`, `IsFiniteLocalNorm`, `isGlobalNorm_iff_isLocalNormEverywhere`, `hilbertProductFormula` and `card_ideleClassNormQuotient` (lines 55–62, 71, 77–92).

**Claim.** This head removes every declaration GlobalQuadraticForms consumes from this module, so the repository build fails. README:175–176 says GlobalQuadraticForms "consumes Tau Ceti's `hilbertProductFormula`", which is not yet true.

**Witness.** The gate reports `build=16 FAIL`, starting with "Unknown identifier `TauCetiRoadmap.ClassFieldTheory.cyclicHasseNorm`" at GlobalQuadraticForms/Suggested.lean:55:7. A scratch copy reproduces 15 errors.

**Repair.** In this pull request, repoint `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` to Tau Ceti, as was done for QuadraticFormInvariants:

- Replace line 4 by the six imports `TauCeti.NumberTheory.ClassFieldTheory.Global.HasseNorm.Basic`, `…Global.Hilbert.Reciprocity`, `…Global.Reciprocity`, `…Global.Coefficients`, `TauCeti.NumberTheory.NumberField.LocalGlobal.Semilocal.Norm.LocalNorm` and `TauCeti.NumberTheory.NumberField.Global.Ideles.Norm.Relative`.
- Rename the theorems to `TauCeti.ClassFieldTheory.{cyclicHasseNorm, isGlobalNorm_iff_isLocalNormEverywhere, hilbertProductFormula, principalIdele, card_ideleClassNormQuotient}`.
- Rename the predicates and maps to `TauCeti.GlobalNumberFields.{IsFiniteLocalNorm, IsInfiniteLocalNorm, IsLocalNormEverywhere, ideleNormMap, ideleClassNormMap}`.
- Write the two examples with `x ∈ TauCeti.normGroup K L` on the global side, which is how `isGlobalNorm_iff_isLocalNormEverywhere` (HasseNorm/Basic.lean:170) is stated.

**Tested.** A scratch copy with exactly these changes elaborates with exit 0, only `sorry` warnings and no errors. Alternatively, merge the open GlobalQuadraticForms revision first; its head no longer imports this module. In that case, say so in this pull request's description and rebase on it.

## R02 (P1) — Completed/LocalGaloisGroups, a default build target, breaks and the gate did not build it

**Location.** `Completed/LocalGaloisGroups/Suggested.lean:11`: "import TauCetiRoadmap.ClassFieldTheory.Suggested". The file uses `ClassFieldTheory.H`, `kummerEquiv_mixed`, `h2MuEquivZMod_mixed`, `cyclotomicCharacter_artinMap(_padic)(_uniformizer)`, `muNRep`, `GalRep`, `muNRepEquivZMod`, `muNRep_ρ_eq_self`, `artinMap`, `absoluteGaloisGroupExtend`, `h2FpEquivZMod_of_mu` and `scd_p_absoluteGaloisGroup_eq_two` (lines 247–485, 1917). README:148–167 asserts that this consumer uses these objects "under Tau Ceti's names, without private stand-ins".

**Claim.** `lakefile.toml` builds `Completed` by default (`defaultTargets = ["TauCetiRoadmap", "Completed"]`). All of these names were declared by the version of this module on main (for example main's Suggested.lean:630, 987, 1131, 2272), and this head deletes them. Merging breaks the repository build, and the README's description of this consumer is false.

**Witness.** `lake env lean` on a scratch copy of the consumer at this head gives 31 errors, the first being "Unknown identifier `ClassFieldTheory.artinMap`" at line 247.

**Repair.** In this pull request:

- Migrate `Completed/LocalGaloisGroups/Suggested.lean` to the Tau Ceti names README:148–163 lists. For example: `continuousCohomology i (TauCeti.ClassFieldTheory.muNRep n F)` for `H n F i`; `kummerEquivOfCharZero F hn` (MuNRep.lean:358) for `kummerEquiv_mixed p F n hn`; `h2MuEquivZMod_mixed F n hn` (Brauer/RootsOfUnity.lean:145); `localCyclotomicCharacter_artinMap_unit`, `_padic` and `_uniformizer` (ExplicitCyclotomicSymbol/ArtinMap.lean:294 and neighbours); `strictCohomologicalDimensionAt_absoluteGaloisGroup_eq_two` for `scd_p_…`; `h2FpEquivZMod` for `h2FpEquivZMod_of_mu`.
- Derive `muNRep_ρ_eq_self`, which has no Tau Ceti counterpart, in the consumer from `smul_kummerCoeff_eq_self`.
- Add `Completed.LocalGaloisGroups.Suggested` to the targeted build of this pull request.

**Tested in part.** A scratch file repointing three of the consumer's closed proofs (Kummer, `H²(μ_n)`, and the ℚ_p cyclotomic normalization) to these Tau Ceti names elaborates with exit 0. The full migration was not carried out in this review.

## R03 (P2) — The Layer 5 contract drops the hypotheses of `finite_H` and of perfect duality

**Location.** `README.md:79–80`: "Local Tate duality for the named evaluation pairing, finiteness of `H⁰`, `H¹`, `H²` of a finite smooth discrete module". The same claim is at `README.md:865–867` and in the exit criterion at 894–896. Lines 163–165 say the smoothness hypothesis of `finite_H` is an instance argument.

**Claim.** Layer 5 is stated for every nonarchimedean local field, but neither statement holds at that generality as written. The README also misdescribes how `finite_H` takes smoothness.

**Witness.**
- `finite_H (hn : (n : F) ≠ 0) … (hA : IsSmoothDiscrete (ZMod n) A)` (FiniteCohomology/DegreeTwo.lean:97). Smoothness is an explicit argument, not an instance.
- `tateDualityPairing_perfect_mixed` carries `[CharZero F]` (Local/Duality/Perfect.lean:280).
- Counterexample: for F = 𝔽₂((t)) and A = ℤ/2, H¹ ≅ F/℘(F) is infinite, because t⁻¹, t⁻³, t⁻⁵, … are independent.

**Repair.**
- State finiteness for `(n : F) ≠ 0` and perfectness in characteristic zero with `n ≠ 0` and the trivialization `tr`, as the pinned declarations have them, and correct line 164 for `finite_H`.
- Add the 𝔽₂((t)), ℤ/2 Check.
- §1 item 2 claims local Tate duality without restriction, but the pin covers only characteristic zero. Either make the prime-to-`p` equal-characteristic case an open Layer 5 target or name its owner in Scope.

**Tested.** With `(n : F) ≠ 0` the counterexample is excluded, since 2 = 0 in F, while ℚ₂ with ℤ/2 (#H¹ = 8) is kept.

## R04 (P2) — Two owners for the equal-characteristic upper-numbering theorem

**Location.** `README.md:982–990`: `normResidue_map_unitFiltration` "for every `n : ℕ`", "in every characteristic" (also 168–174 and 1032–1035).

**Claim.** The open FunctionFieldArithmetic pull request (#1474, head c5d655e) still states and proves the same equal-characteristic comparison and a conductor statement for every characteristic. That gives two owners for one object. The previous review's R04 is unresolved from the other side.

**Witness.** FunctionFieldArithmetic `README.md:1116–1119` at that head: "for every finite abelian extension `L/K` and every integer `r≥0`, `Art_{L/K}(U_K^(r)) = Gal(L/K)^r`". Its README:1113–1114 states `conductor_existence_all` "in every characteristic". Both READMEs use the same y² − y = t⁻¹ Check.

**Repair.** Keep the theorem here and have FunctionFieldArithmetic §4.2 cite Layer 7's `normResidue_map_unitFiltration`. This roadmap is the earlier owner, and its route's input `unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot` (Local/Conductor/UpperNumbering.lean:64) has no characteristic hypothesis (variables at :56–59). Delete FunctionFieldArithmetic's comparison paragraph (1116–1121) and point `conductor_existence_all` at Tau Ceti's `conductorExponent_le_iff_upperRamificationGroup_eq_bot` (:121). Record that coordination in this pull request's description.

**Tested.** At 𝔽₂((t)) with y² − y = t⁻¹, the pinned lemma gives Art(U¹) = C₂ = G¹ and Art(U²) = 1 = G², so the conductor is 2. These are FunctionFieldArithmetic's values, with no Lubin–Tate input.

## R05 (P3) — The "local conductor–discriminant formula" restates Tau Ceti's; the open content is one comparison

**Location.** `Suggested.lean:96–115`: `discriminantExponent_eq_finsum_galoisCharacterConductorExp` and `conductorExponent_eq_iSup_galoisCharacterConductorExp`. `README.md:89` and the §3 table call the local conductor–discriminant formula an open target.

**Claim.** Tau Ceti already proves the local formula, `TauCeti.LocalFieldsRamification.finsum_artinConductorExponent_eq_discriminantExponent` (LocalField/Discriminant/Conductor.lean:58), summing over `χ : Gal →* Mˣ` with `M = ℂ` allowed. Both headlines differ from Tau Ceti only through the identity `galoisCharacterConductorExp K L χ = artinConductorExponent K L χ`.

**Witness.** In a scratch probe, given that identity, the first headline closes with `simp_rw [the identity]` followed by `exact (finsum_artinConductorExponent_eq_discriminantExponent K L ℂ).symm`. That is three tactics, exit 0.

**Repair.**
- Replace the two theorems by the comparison `galoisCharacterConductorExp_eq_artinConductorExponent`, with the current binders (`IsGalois`, `IsMulCommutative Gal(L/K)`, `ValuativeExtension`). This is the character form of the upper-numbering theorem.
- Cite the Tau Ceti formula, `conductorExponent_le_iff_upperRamificationGroup_eq_bot` and `artinConductorExponent_le_iff` (Herbrand/ArtinConductor.lean:83) in the Layer 7 contract.
- Keep the sum and the maximum as README corollaries.

**Tested.** The probe above elaborates with the comparison left as `sorry`.

## R06 (P3) — No Check separates upper from lower numbering in Layer 7

**Location.** `README.md:1008–1035`, the Layer 7 Checks: L = K, ℚ₂(i), ℚ₂(ζ₁₂), ℚ₂(√2), ℚ_p(μ_p), unramified, and the Artin–Schreier example.

**Claim.** In every one of these examples Herbrand's φ is the identity up to the last break. The most plausible wrong statement, `lowerRamificationGroup K L n` in place of `G^n`, therefore passes every Check.

**Witness.** ℚ₃(ζ₉)/ℚ₃ (Galois group ≅ C₆):
- Lower filtration: orders 6, 3, 3, 1 at 0, 1, 2, 3.
- Upper filtration: orders 6, 3, 1 at 0, 1, 2. Art(U²) = 1 = G², but G₂ has order 3.
- Character conductors 0, 1, 2, 2, 2, 2 sum to 9, matching disc = 3⁹, with maximum 2. The lower-numbering conductors would sum to 13.

**Repair.** Add this example as a negative-control Check: at n = 2, Art(U²) = 1 = G² while G₂ ≠ 1. Record the sum 9 against 13 and the maximum 2.

**Tested.** The values are computed in the adversarial table below. The Check rejects the lower-numbering model at n = 2 and accepts the stated theorem.

## R07 (P3) — Two other open revisions of this roadmap conflict with this one, and no merge order is stated

**Location.** The overlap listing for this roadmap reports conflicts with #617 (README) and #1411 (README and Suggested.lean). The description of this pull request names neither.

**Claim.** #617 carries the pre-rewrite README (2269 lines) and Suggested.lean (4403 lines) and keeps `Completed/LocalGaloisGroups/Suggested.lean:11` importing this module. #1411 states the same Layer 7 theorem as `map_unitFiltration_normResidue` (its Suggested.lean:1428), with an absolute form. Consumers depend on that name and that absolute form.

**Witness.**
- PadicPeriodRings (#940) README:119 and LocalAnabelianGeometry (#1811) README:145 cite `map_unitFiltration_normResidue`.
- ArithmeticGaloisRepresentations (#856) README:514 declares `gap:unit-filtration-reciprocity` on this roadmap and needs the absolute form, which this head does not state.

**Repair.**
- State in this pull request's description which of #617, #1411 and #1215 is rebased on which.
- Adopt one name, or give an old → new line in the README.
- For the absolute form (the closure of Art(U^n) in G_K^ab is the image of the absolute G_K^n), either state it as a Layer 7 target or record in Scope who owns it, so that the declared gap has an owner.

## R08 (P3) — Sampled conventions and examples have no locator at the claim; one supplier section is mis-cited

**Location and claim.**
- §§2.1, 2.3, 2.5, 2.6 and 2.7 and §§5.1–5.8 (README:220–487, 1601–1745) carry no theorem-and-page locator.
- §2.4 cites Tate 1952 and Nakayama 1957 with no theorem or page.
- The Hasse counterexample with 25 (README:1453–1454, 1717) has no locator.
- Layer 13's route (README:1496) cites "`NumberFieldArithmetic`, Layer 4.2" for the place-by-place exponent of `relDiscr`. Layer 4.2 there only localizes at a prime of `A`; the formula is NumberFieldArithmetic §5.10, with the completed different in §5.9.
- README:130 cites "the profinite-group roadmaps" without naming one.
- `Serre, Local Fields` is not in the manifest.

**Witness.** The cached texts support each claim at these locators:
- §2.4: `milne-cft line 3911` (II Thm 3.11, p. 84).
- §2.5: `milne-cft line 4822` (III Thm 3.1, p. 107).
- §2.3, scaled inflation: `milne-cft line 4833`.
- §2.6, uniformizer to Frobenius: `milne-cft line 4641` (III Prop 1.9, p. 102).
- §5.7: `milne-cft line 10642` (VIII Rem 3.2, p. 234).
- Principal ideal theorem: `milne-cft line 7252` (V Thm 3.17, p. 161).
- Ring class fields: `kopp-lagarias line 128`, line 160, line 174 (Thms 1.1–1.3, pp. 3–4).
- NumberFieldArithmetic: `Completed/NumberFieldArithmetic/README.md:1714–1720` (§5.10).

**Repair.** Put these locators in parentheses at the claims. Cite NumberFieldArithmetic §§5.9–5.10. Name ProfiniteProPGroups, or cite Mathlib alone. Record Serre's *Local Fields* in the manifest by locator, or rely on the readable Milne locators.

## R09 (P3) — README shape and process narrative

**Location and claim.**
- Headings: `## Purpose` instead of `**Summary.**`; numbered `## 1.`–`## 8.` headings; `## 3. Frozen public interface` instead of `## Exact supplier contracts` (From Mathlib / From Tau Ceti / From TauCetiRoadmap.X); no `## How to read the build`; no `## Downstream consumers`.
- Layers have no `### k.n` subsections and no closing `### Examples` and `### Dependencies`. Targets have no per-target `*Needs:*` lines.
- Process narrative:
  - README:493–494, "exact universe parameters may change during implementation";
  - README:1598–1599, "They should not wait for the inverse-limit absolute Artin map";
  - README:1738–1745, "should be added only after the following supplier maps have stable names" (stale: every named test already exists in Tau Ceti);
  - README:1852–1854, "a private provenance ledger is not a substitute";
  - "frozen" at 484 and 491.
- README:1589 announces "three errors" and lists four.
- README:809 calls a degree-2 corollary of `ker_artinMap` "the one target of this layer". It is not in Tau Ceti, not in the §3 open-target table, and not in Suggested.lean.
- README:1848–1850 cite GitHub repositories without commits.

**Repair.** Re-head to the house shape. Move the §1 consumer list to `## Downstream consumers`. Give the two open layers (7 and 13) per-target *Needs:* lines. Delete the process sentences. Fix "three" to "four". Turn the Layer 4 test into a Check. Drop the repository references, or pin commits.

## Verified sound

**Gate, build and binders.**
- `lake env lean` on `TauCetiRoadmap/ClassFieldTheory/Suggested.lean` exits 0 with exactly six `sorry` warnings (lines 67, 96, 109, 124, 135, 149).
- The seven elaborated types (the worker's signature listing, rechecked by this elaboration) were compared with their README statements. Every local-field, `ValuativeExtension`, `Module.Finite`, `IsGalois`, `IsMulCommutative` and `IsAbelianGalois` binder is present, and no declaration uses a section `variable`.
- The worktree is clean, and the outside-folder diff is empty apart from QuadraticFormInvariants, which is this pull request's own.
- Imports are `Mathlib` plus eight individual Tau Ceti modules, all present at the pin. There is no `set_option`, no sorry'd data and no `example`.

**Padding probe.** A scratch copy with `first | rfl | simp | infer_instance | exact <Tau Ceti lemma>` closes none of the six theorems. `simp` makes progress on `normResidue_map_unitFiltration` and on `abelianConductor_eq_lcm` but leaves goals; the other four fall through to `sorry`. R05 records the duplication that the probe cannot detect.

**Headline inventory.**
- Open headlines and where they are stated in Suggested.lean: the upper-numbering theorem (67), the local conductor–discriminant formula (96), the conductor as a maximum (109), the principal ideal theorem (124), and the global product and lcm formulas (135, 149).
- Already proved in Tau Ceti and correctly not restated in Suggested.lean: Tate and Tate–Nakayama, the Brauer invariant, local duality, the Euler characteristic, cd/scd, the absolute Artin map, local existence and the local correspondence, Weil reciprocity, Albert–Brauer–Hasse–Noether, global reciprocity and existence, the Hasse norm theorem, the class fields, Kronecker–Weber, and Hilbert reciprocity.
- Every headline is statable at the pins, as `README.md:1766` says.

**Dependency check** (prescribed command):

```text
depcheck: 238 roadmaps, 2352 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Suppliers: ProfiniteCohomology (`TauCetiRoadmap/` on main); LocalFieldsRamification, GlobalNumberFields and NumberFieldArithmetic (`Completed/` on main); Mathlib; Tau Ceti. FunctionFieldArithmetic is a consumer (ORDER line 352). No gaps are declared.

**Library declarations opened at the pins** (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`). There are 41. Paths are relative to the library roots; `CFT/` abbreviates `TauCeti/NumberTheory/ClassFieldTheory/`.
- Upper numbering and conductors: `CFT/Local/Conductor/UpperNumbering.lean:56–59, 64, 121, 130`; `TauCeti/NumberTheory/LocalField/Discriminant/Conductor.lean:58`; `…/Herbrand/ArtinConductor.lean:69, 83`; `…/UnitFiltration/Basic.lean:104` (U(K,0) = 𝒪ˣ); `…/Discriminant/Basic.lean:142`.
- Reciprocity and norms: `CFT/Local/Reciprocity.lean:162` (`normResidue`, the Artin direction); `TauCeti/RingTheory/Norm/Units.lean:110`; `TauCeti/RingTheory/DedekindDomain/Discriminant/Basic.lean:33` (`relDiscr = relNorm (different)`).
- Global class fields: `CFT/Global/AdmissibleModulus/Basic.lean:193`; `CFT/ClassFields/RayClassField.lean:123, 241, 262`; `CFT/Formation/PrincipalIdeal.lean:67`.
- Layer 5 contract: `CFT/FiniteCohomology/DegreeTwo.lean:97`; `CFT/Local/Duality/Perfect.lean:280`; `CFT/Local/EulerCharacteristic/Theorem.lean:98, 110`; `CFT/Brauer/RootsOfUnity.lean:145`; `CFT/MuNRep.lean:270, 358, 409`.
- Local existence, Weil group and dimension: `CFT/LocalExistence/Existence.lean:159, 176`; `CFT/LocalExistence/ArtinMap.lean:113`; `CFT/LocalExistence/Correspondence.lean:138`; `CFT/WeilGroup/Reciprocity.lean:58–59, 70`; `CFT/WeilGroup/Transfer.lean:112, 167`; `CFT/Local/CohomologicalDimension/AbsoluteGaloisGroup.lean:104`.
- Global existence and Hasse norm: `CFT/ClassFields/RingClass/Field.lean:111`; `CFT/ClassFields/KroneckerWeber.lean:178`; `CFT/GlobalExistence/Existence.lean:213`; `CFT/Global/HasseNorm/Basic.lean:154, 170`; `TauCeti/NumberTheory/NumberField/LocalGlobal/Semilocal/Norm/LocalNorm.lean:64, 79, 85`.
- Formations and generic cohomology: `CFT/Formation/ClassFormation.lean:98–112` (the seven fields listed in §2.2); `CFT/Formation/Basic.lean:152`; `TauCeti/RepresentationTheory/Homological/TateCohomology/Projective/Basic.lean:232`.
- Mathlib: `Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean:58` (one universe for R and G, as §2.1 says); `Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean:107`.

A mechanical scan of every backticked identifier in the README found each one declared at the pins or in ProfiniteCohomology (`cup_add_left`). About 110 further names were checked by exact declaration search; none is missing. The global conductor–discriminant formula and the principal ideal theorem are absent at the pin, so they are genuinely open.

**Cross-roadmap citations and ownership resolved.**
- `Completed/NumberFieldArithmetic/README.md:1086, 1123, 1714` (Layer 4 and §5.10); `Completed/LocalFieldsRamification/README.md:724` (Layer 3); `Completed/GlobalNumberFields/README.md:571` (Layer 11, orders and Pic).
- QuadraticFormInvariants at this head consumes Tau Ceti's `localSymbol` and Hilbert invariants (its Suggested.lean:4–5, 2471–2493), as README:177–180 says.
- Object searches over the open heads and main covered the upper-numbering theorem, `normResidue`, the conductor–discriminant formula, the principal ideal theorem, and equal-characteristic local duality.
  - The only second owner found is FunctionFieldArithmetic (R04).
  - ArithmeticGaloisRepresentations §3.5 owns the conductor–discriminant formula for Artin representations, a different object. AnalyticNumberTheoryPartI:1757, ArithmeticStatisticsPartI:48 and `Completed/NumberFieldArithmetic/README.md:99` cite this roadmap's Layer 13 for the abelian formula, which is consistent.
  - FilteredLocalGaloisGroups and HigherLocalClassFieldTheory restate nothing owned here.
- No declaration of Suggested.lean shares a fully qualified name with another readable roadmap.

**Source sample** (all 15 seeded targets):

| Target | Text inspected | Outcome |
|---|---|---|
| 2.1 Formations | Tau Ceti `Formation/Basic.lean:152`; Mathlib universe at TateCohomology/Basic.lean:58 | Profinite formulation and universe claim correct; no source locator (R08). Artin–Tate's original axioms are waived. |
| 2.2 Class formations | `ClassFormation.lean:98–112`; Artin–Tate XIV §6, p. 163 (waived) | The seven fields match §2.2 exactly; inv_cor is a theorem, not a field. |
| 2.3 Fundamental classes | `milne-cft line 4833` (III, p. 107) | Scaled inflation inf(u) = [V:V′]·u is supported; corestriction formula computed (table). No locator in README. |
| 2.4 Tate / Tate–Nakayama | `milne-cft line 3911` (II Thm 3.11, p. 84) | Hypotheses (a) H¹ = 0 and (b) H² cyclic of order \|H\|. README's third hypothesis follows from Cor∘Res (line 3919–3921), so the statement is equivalent. Tate 1952 and Nakayama 1957 are unread. |
| 2.5 Reciprocity direction | `milne-cft line 4822` (III Thm 3.1, p. 107) | Cup with u gives G^ab → K×/Nm; Artin is its inverse. Supported. |
| 2.6 Frobenius | `milne-cft line 4641` (III Prop 1.9, p. 102) | Frobenius ↦ class of π. Supported. The cyclotomic bullet has no locator. |
| 2.7 Further conventions | `kopp-lagarias line 128`, 160, 174 (pp. 3–4) | Ring class field of every order; Gal(H_O/K) ≅ Cl(O). Supported. |
| 5.1 Trivial layer | Tau Ceti `artinMap_trivialLayer` | Correct; no source needed. |
| 5.2 Kernel and cyclic layers | Tau Ceti `natCard_normQuotient`, `isGenerator_artinMap_iff` | Present; values in the table. |
| 5.3 Unramified | `milne-cft line 4641`; Tau Ceti `localArtinMap_Q2_zeta5` | ζ₅ ↦ ζ₅² verified. |
| 5.4 Quadratic | Tau Ceti `localArtinMap_quadratic_eq_*`, `globalArtinMap_Qi_prime` | Values in the table. The ∃s counterexample K(√d,√e) is correct. |
| 5.5 Cyclotomic | Tau Ceti `globalArtinMap_cyclotomic_prime`, `globalArtinMap_zeta5_two` | Values in the table. |
| 5.6 Towers | Tau Ceti `artinMap_groundInclusion`, `artinMap_groundNorm` | C₄ transfer g ↦ g² is distinct from the quotient. |
| 5.7 Downstream examples | `milne-cft line 10642` (VIII Rem 3.2, p. 234); `milne-cft line 7252` (V Thm 3.17, p. 161); Mathlib QR:107 | The 25 example, the principal ideal theorem and quadratic reciprocity are supported. No locators in README (R08). |
| 5.8 Mandatory suite | All seven Tau Ceti names | Present at the pin. |

Layer 13's formula was also checked: `milne-cft line 7423` (V Thm 3.27, p. 165), line 7436 (Rem 3.28) and line 7443 (Ex 3.30, ±p^{p−2}).

**Adversarial table.** Cₙ is cyclic of order n. Invariants are in ℚ/ℤ.

| Statement | Instance | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `normResidue_map_unitFiltration` | L = K, any n | LHS ⊥ in trivial Gal^ab; RHS ⊥ | holds | none |
| same | ℚ₂(i), n = 1, 2 | Art(U¹) = G (−1 not a sum of two squares), G¹ = G; Art(U²) = 1 = G² | holds | none |
| same | ℚ₂(√2), n = 2, 3 | 5 ≢ ±1 mod 8 so Art(U²) = G = G²; Art(U³) = 1 = G³ | holds; G^{n−1} model fails | none |
| same | ℚ₃(ζ₃), n = 0 | Art(−1) inverts ζ₃: image G = G⁰ = G₀ (order 2) | holds | none |
| same | ℚ₃(ζ₉), n = 2 | Art(U²) = 1, G² = 1; lower G₂ has order 3 | holds; lower-numbering model fails | R06 |
| same | unramified degree 2, n = 0 | Art(U⁰) = 1 = G⁰; using Kˣ for U⁰ gives order 2 | holds | none |
| same | 𝔽₂((t)), y² − y = t⁻¹ | Art(U¹) = C₂ = G¹; Art(U²) = 1 = G² | holds; two owners | R04 |
| `galoisCharacterConductorExp` | trivial χ; ℚ₂(i); ℚ₂(√2); ℚ₅(μ₅) | 0; 2; 3; 1 | determined | none |
| same, wrong models | geometric Art; lower numbering at ℚ₃(ζ₉) order-3 χ | same kernel, same value (normalization invisible); 2 vs 3 | lower model excluded only by R06's Check | R06 |
| same, junk value | sInf ∅ | never reached: the norm group is open, so U^n ⊆ N for large n | none | none |
| local Σ formula | L = K | δ = 0; Σ = 0 | holds | none |
| same | ℚ₂(i) | δ = 2 (disc −4); 0 + 2 | holds | none |
| same | ℚ₂(ζ₁₂), e = f = 2 | δ = f·d = 4; 0 + 0 + 2 + 2 (fixed fields ℚ₂, ℚ₂(ζ₃), ℚ₂(i), ℚ₂(√3)) | holds; d alone gives 2 | none |
| same | ℚ₃(ζ₉) | δ = 9 (disc 3⁹); 0 + 1 + 2·4 = 9; lower model gives 13 | holds | R06 |
| conductor = max | ℚ₅(μ₅); ℚ₃(ζ₉) | c = 1 = max, Σ = 3; c = 2 = max | holds | none |
| principal ideal theorem | K = ℚ | H = ℚ; (2) principal | holds | none |
| same | ℚ(√−5), 𝔭 = (2, 1+√−5) | 𝔭² = (2) = ((1+i)²), so 𝔭𝒪_H = (1+i); K(i) = K(√5) unramified (discs −4, 5 coprime) | holds | none |
| global product half | ℚ(i), v = 2 and v = 3 | 2 = 0 + 2; 0 = 0 + 0 | holds | none |
| same | ℚ(ζ₈), v = 2 | 8 = 0 + 2 + 3 + 3 | holds | none |
| same | ℚ(ζ₅), v = 5 | 3 = 0 + 1 + 1 + 1 | holds | none |
| global lcm half | ℚ(ζ₈) | max 3 gives (8); ∞: ℚ(i) has (4)∞, so ∞ ∈ (8)∞ | holds; product gives 8 | none |
| same, real clause | ℚ(√2) | ∞ ∉ (8); both characters lack ∞ | both sides false | none |
| 2.1 level | C₂ sign action on ℤ | A^{1} = ℤ, A^{C₂} = 0 | correct | none |
| 2.1 finiteness | G = ℤ discrete, V = 0 | index ∞; excluded by `CompactSpace` | binder needed | none |
| 2.2 range axiom | C₄; C = ℤ vs C = 0 | image {0, ¼, ½, ¾} vs {0} | excludes zero model | none |
| 2.2 / 2.7 res, cor | degree 2, x = ⅓ | res x = ⅔; cor(⅓) = ⅓ | distinct multipliers | none |
| 2.3 inflation | u₂ into C₄ layer | inf u₂ = 2u₄: ½ = 2·¼ | scaled | none |
| 2.3 corestriction | U′ of index 2 | cor u(U′,V) = [U:U′]·u = 2u; [U′:U] meaningless | correct index | none |
| 2.4 Tate | C₂, C = ℤ trivial | H¹ = 0; H² = ℤ/2; gives Ĥ⁰ = ℤ/2 ≅ Ĥ², Ĥ⁻¹ = 0 = Ĥ¹ | holds | none |
| 2.5 direction | C₄, class of π | Nak(σ) = π, Art(π) = σ; geometric gives σ³ | discriminating | none |
| 2.6 / 5.3 Frobenius | ℚ₂(ζ₅), x = 2 | 2 has order 4 mod 5; ζ₅ ↦ ζ₅² vs geometric ζ₅³ | discriminating | none |
| 2.6 cyclotomic | ℚ₃, u = 4 | χ_cyc(Art(4)) = 4⁻¹ = 7 mod 9; geometric gives 4 | discriminating | none |
| 2.7 ring class | cubic K, ℤ + f𝒪_K | index f² ≠ f | quadratic description is not general | none |
| 5.1 trivial layer | U/U | N = id; quotient 1; Art = 1 | holds | none |
| 5.2 cyclic generator | C₄, v(a) = 1 vs 2 | orders 4 vs 2 on both sides | iff discriminates | none |
| 5.4 local quadratic | ℚ₂(i), a = 2, −1 | N(1+i) = 2 so 1; −1 non-norm so τ | both directions | none |
| 5.4 global | ℚ(i): ℓ = 3, 5; ℚ(√5): ℓ = 2, 11 | τ, 1; τ (2 ≢ ±1 mod 5), 1 | holds | none |
| 5.5 cyclotomic | ℚ(ζ₅): 2, 3, 11; ℚ(ζ₈): 3, 5, 7 | ζ₅², ζ₅³, ζ₅; ζ₈³, ζ₈⁵, ζ₈⁷ | holds | none |
| 5.6 towers | ℚ(√5) ⊂ ℚ(ζ₅), ℓ = 2, 11; C₄ ⊃ C₂ | τ, 1; Ver(g) = g² vs quotient gC₂ | holds | none |
| 5.7 Hasse failure | ℚ(√13,√17), x = 25 | (17/13) = (4/13) = 1, 13 ≡ 8² mod 17; D₂ order 2; local everywhere true, global false | holds | locator R08 |
| Layer 10 lift criterion | same field | local degrees ≤ 2, lcm 2 < 4 = #H²(G, C_L) | image index 2 | none |
| Layer 12 meet formula | two D₄ over one biquadratic B | G = D₄ ×_{V₄} D₄ of order 16, G′ = ⟨(r², r²)⟩, G^ab order 8 vs B of degree 4 | caveat correct | none |
| Layer 8 conductor | ℚ₂, U(K,1)·⟨2⟩ | U⁰ = U¹ (𝔽₂ˣ = 1), so N = ℚ₂ˣ and conductor 0 | holds | none |
| Layer 5 finiteness | 𝔽₂((t)), A = ℤ/2 | H¹ ≅ F/℘F infinite; README says finite | false as written | R03 |
| Layer 5 Euler | ℚ₂: 𝔽₂; 𝔽₃; 0 | 8 = 2·2·2¹; 3 = 3·1·2⁰; 1 = 1·1·2⁰ | holds | none |
| Layer 5 dual action | ℚ₂, ℤ/3 with Frob = −1 | #H⁰ = 1; dual has Frob = (−1)(−1) = 1 so #H⁰ = 3 | holds | none |
| Layer 5 invariant | unramified cubic over ℚ₇, χ(Frob) = ⅓ | inv(7 ∪ δχ) = ⅓; geometric gives ⅔ | holds | none |
| Layer 9 inseparable | 𝔽₂((s)) over 𝔽₂((t)), t = s² | index 1 vs [L:K] = 2; no ι exists | binder needed | none |
| Layer 9 degrees | unramified quadratic; ℚ₂(i) | deg_K = 2·deg_L; deg_K = deg_L; both index 2 | holds | none |
| Layer 13 ring class | ℤ + 2ℤ[i]; ℚ(ζ₇ + ζ₇⁻¹) | disc −16, h = 2/(1·2) = 1; Minkowski bound (6/27)·7 = 14/9 < 2 | holds | none |
| Layer 12 admissibility | ℚ(i), modulus 1 and (4) | Cl = 1 but Art(3) ≠ 1; (ℤ/4)ˣ/±1 = 1 | rejection correct | none |
| Layer 14 | (−1, −1) over ℚ; p = 3, q = 7 | ramified at {2, ∞}: ½ + ½ = 0; (7/3)(3/7) = −1 = (−1)^{1·3} | holds | none |

There are 52 rows. Fields exclude the zero ring. Rank 0 appears as L = K and the trivial layer. p = 2 and p = 3 occur throughout, as do the unramified and equal-characteristic cases.

## Not verifiable

- **neukirch-ant** (settled as uncertified): V Thm 6.2 and VI §7, cited for the upper-numbering and principal ideal theorems, were not read. The readable Milne V Thm 3.17 supports the principal ideal theorem.
- **artin-tate** (waived): XIII and XIV §4 Thm 1 were not read.
- **Serre, *Local Fields*** XV §2 and IV §1/VI §2: not in the manifest and not readable legally here. The theorem number (#1411 cites XV §2 Thm 2) is unconfirmed.
- **Tate 1952, Nakayama 1957, NSW, Serre *Galois Cohomology*, Milne ADT, Cox, Weil 1951, Tate (Corvallis), Cassels–Fröhlich**: not in the manifest. No locator was certified beyond what the previous review recorded. Milne CFT II 3.11 and III 3.1 independently support §§2.4–2.5.
- The manifest entry `serre1961` (n° 3.1, p. 128: upper numbering and Herbrand's theorem, `serre1961 line 927`) is not cited by this README.

## Source issues

- **Gap** in milne-cft at V Theorem 3.27, printed p. 165: the source states the discriminant-as-product half of the conductor–discriminant formula but omits its proof, calling it a local statement; it should prove it or cite a proof; affects the proof.
