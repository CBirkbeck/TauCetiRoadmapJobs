# Review of ClassFieldTheory (pull request #1411 at 71f458c)

**Verdict:** needs changes

This is a full review of the head, which rewrites both files: `Suggested.lean` drops from about 4,500 to 1,756 lines, and the plain gate now has `sorry-data=0`, `imports=0`, `residue=0`, `long-fences=0`, `tex=0` and `depcheck=0`. Two kinds of problem remain. First, the build fails: QuadraticFormInvariants fails now, and IntegralLattices fails behind it. Second, the rewritten acceptance test restates, as open `sorry` targets or as fresh definitions, results that Tau Ceti already proves at the pin. Of the 59 `sorry`'d theorems, 31 close with a single `exact`/`apply` of a Tau Ceti declaration, 18 more are Tau Ceti theorems in another spelling, and 10 are genuinely open. The Tau Ceti pin is `2fd255d9` and the Mathlib pin is `1b1ccf4b`.

## R01 (P1) — The build fails in QuadraticFormInvariants, and IntegralLattices fails behind it

**Location:** `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:1–58`, the import list. On main, lines 16–19 imported four roadmap modules, including `Completed.NumberFieldArithmetic.Suggested`. The rewrite also drops the declaration `ringClassArtinMap` (main's line 4327).

**Claim:** Two roadmaps on main import this module and break.
- QuadraticFormInvariants used three Tau Ceti lemmas that it reached only through those transitive imports: `TauCeti.Algebra.trace_eq_zero_of_sq_algebraMap_of_not_mem_range`, `Algebra.IsQuadraticExtension.norm_algebraMap_add_algebraMap_mul` and `…trace_algebraMap_add_algebraMap_mul`.
- IntegralLattices checks a name this file no longer declares.

**Witness:** The worker's targeted build fails at `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:2852`, `2858`, `2920` and `2924` with "Unknown identifier/constant". Separately, `TauCetiRoadmap/IntegralLattices/Suggested.lean:419` contains `#check ClassFieldTheory.ringClassArtinMap`, which with IntegralLattices' imports elaborates to "Unknown identifier" at this head.

**Repair:**
1. **QuadraticFormInvariants.** Add `import TauCeti.FieldTheory.Trace` and `import TauCeti.RingTheory.Norm.Quadratic` to `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean`. Tested: a scratch copy with exactly these two lines elaborates against this head, with exit 0 and only `sorry` and linter warnings.
2. **IntegralLattices.** Either keep `ringClassArtinMap` here as an `abbrev` of `TauCeti.ClassFieldTheory.ringClassArtinMap` (in `ClassFields/RingClass/Field.lean:264`, together with the R02 repair), or repoint IntegralLattices' line 419.
3. **Ordering.** Both edits outside this folder go in a pull request that merges first, and this pull request's description must state that order. Restoring the roadmap imports here is not an option, because the gate's `imports` rule forbids them.

GlobalQuadraticForms and IntegralLattices cannot be elaborated until QuadraticFormInvariants builds. Every `ClassFieldTheory.*` name they use resolves at this head except the one above. Completed/LocalGaloisGroups, which also imports this module, elaborates against this head with exit 0.

## R02 (P2) — Objects Tau Ceti defines at the pin are defined a second time, with bodies of their own

**Location:** `Suggested.lean:1587–1601`, `1622–1639`, `1688–1712` and `1716–1745` (global); `1289–1313` and `1357–1372` (local); `791–808` (local units).

**Claim:** These declarations re-construct pinned objects instead of naming them:
- **Hilbert invariants.** Tau Ceti's `finiteHilbertSupport` is the support of the invariants (`Global/Hilbert/Invariant.lean:371`); this file's is the set of places where 2, `a` or `b` is a non-unit. Tau Ceti's `infiniteHilbertInvariantAt` is a Brauer invariant (`:143`); this file's is a sign rule. The two pairs share names across two namespaces.
- **`unramifiedCoordinate`.** It is re-derived through the `sorry`'d `topologicalClosure_commutator_le_ker_restrictMaximalUnramifiedHom`, whereas Tau Ceti's `TauCeti.unramifiedCoordinate` (`LocalField/Unramified/Coordinate.lean:77`) is a lift that needs no such lemma.
- **`restrictAbsolute`.** It is Tau Ceti's `AlgHom.restrictNormalHom` (`FieldTheory/Galois/Restriction.lean:73`) composed with the comparison, which is the map Tau Ceti's `artinMap_restrict` uses.
- **The global class field family.** `GlobalNormSubgroups`, `exists_globalClassField`, `globalClassField` (built with `.choose`), `ringClassNormSubgroup` and `ringClassField` restate `GlobalExistence/Correspondence.lean:55,74` and `ClassFields/RingClass/Field.lean:98,111`.
- **`unitsFiniteLayerRep`.** It is a second carrier for the local units. Tau Ceti uses `unitFiltration L 0` for them (`herbrandQuotient_unitFiltration_zero`, `UnitFiltration/TateCohomology.lean:291`).

**Witness:** Take K = ℚ and a = b = 5. This file's `finiteHilbertSupport` is {2, 5}; Tau Ceti's is ∅, since (5,5)₂ = (5,5)₅ = 1. Also, `gal_ringClassField_equiv_pic` closes by `exact ⟨(TauCeti.ClassFieldTheory.ringClassArtinEquiv O).symm⟩`, and `unramifiedCoordinate_artinMap` closes with Tau Ceti's lemma.

**Repair:**
1. Make each of these declarations an `abbrev` of its Tau Ceti counterpart. That keeps the names that QuadraticFormInvariants, GlobalQuadraticForms and IntegralLattices use.
2. Delete `topologicalClosure_commutator_le_ker_restrictMaximalUnramifiedHom`, `exists_globalClassField`, `unitsFiniteLayerRep` and `herbrandQuotient_units_eq_one`, and cite `herbrandQuotient_unitFiltration_zero`.
3. Replace the `Nonempty` theorem `gal_ringClassField_equiv_pic` by the data `ringClassArtinEquiv`.
4. In the README, describe `finiteHilbertSupport` as the support (lines 2181–2183) and `restrictAbsolute` through `AlgHom.restrictNormalHom` (lines 1347–1352).

Checked by hand on the witness: after aliasing there is one `finiteHilbertSupport`, and it is ∅ at (5,5).

## R03 (P2) — The new Layer 7 re-plans pinned results, and at narrower generality

**Location:**
- `README.md:1508–1520`: "This roadmap proves two intermediate targets for every finite totally ramified abelian extension `E/F` … The general abelian consequences are targets here, with their unit-filtration API intended for LocalFieldsRamification."
- `README.md:1387–1392`, on the cyclotomic normalization: "is proved here".
- `Suggested.lean:1400–1408`, `1441–1446` and `1535–1572`.

**Claim:** Three of the new Layer 7 targets are Tau Ceti theorems at the pin.
- **The first filtered-norm target.** Tau Ceti's `map_normUnits_unitFiltration_psiNat_eq_of_upperRamificationGroup_eq_bot` (`NumberTheory/LocalField/Norm/Surjectivity.lean:223`) proves it for every finite Galois `L/K`. The README's abelian and totally ramified hypotheses are unnecessary.
- **The conductor consequence.** It is `conductorExponent_le_iff_upperRamificationGroup_eq_bot` and `conductorExponent_fixedField_ker` (`Local/Conductor/UpperNumbering.lean:121,130`).
- **The three cyclotomic normalizations.** They are `localCyclotomicCharacter_artinMap_padic_uniformizer` (`Local/Cyclotomic.lean:364`), `localCyclotomicCharacter_artinMap_padic` and `localCyclotomicCharacter_artinMap_unit` (`Local/ExplicitCyclotomicSymbol/ArtinMap.lean:294,311`).

The `exact` probes close `map_unitFiltration_norm_eq_of_upper_eq_bot` and two of the three cyclotomic theorems.

**Witness:** Over ℚ₂, take the S₃ splitting field of `x³ − 2` (tame, e = 3, f = 2). There G¹ = 1 and ψ(1) = 3, so Tau Ceti gives N(U_L^(3)) = U^(1). The roadmap's target excludes this extension.

**Repair:**
1. Keep as Layer 7 targets only what is open at the pin: `map_unitFiltration_normResidue`, `sup_norm_unitFiltration_eq_of_upper_eq_top`, the five laws of `absoluteUpperRamificationGroup`, and `closure_map_artinMap_unitFiltration`.
2. Cite the Tau Ceti theorems above under Exact supplier contracts. Rewrite the proof route so that the first norm equality is consumed for every Galois extension, and drop its induction.
3. Delete `map_unitFiltration_norm_eq_of_upper_eq_bot` from `Suggested.lean`. Keep `conductorExponent_eq_sInf_upperRamificationGroup` only as a stated corollary of Tau Ceti's iff.
4. Make the three cyclotomic theorems re-exports, since LocalGaloisGroups consumes them at `Completed/LocalGaloisGroups/Suggested.lean:333–361`.
5. Correct "is proved here" (README line 1389) and README line 210 accordingly.

## R04 (P2) — Two headlines that are statable at the pins are absent

**Location:** `Suggested.lean:129–134`: "Two headlines of this item are stated in `README.md` only and not in this file: the principal ideal theorem in its arithmetic form … and the abelian conductor–discriminant formula."

**Claim:** The docstring names no missing carrier for either headline, and both are statable. Tau Ceti proves only the abstract form of the principal ideal theorem (`ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator`), so the arithmetic form is open.

**Witness:** With `TauCeti.NumberTheory.ClassFieldTheory.ClassFields.RayClassField` imported, `(I.map (algebraMap (𝓞 K) (𝓞 (TauCeti.ClassFieldTheory.hilbertClassField K)))).IsPrincipal` elaborates for `I : Ideal (𝓞 K)`. For the second headline, `relDiscr` and `abelianConductor` (`Global/AdmissibleModulus/Basic.lean:193`) exist at the pins.

**Repair:** State the principal ideal theorem in that form, with the README's hypotheses and locator. State the conductor–discriminant formula with `relDiscr` and the finite parts of `abelianConductor` of the fixed fields of character kernels. If a carrier turns out to be missing, the docstring must name it instead. Tested: the first statement elaborates as written.

## R05 (P2) — Two open roadmaps still claim objects this README now owns

**Location:** `README.md:177–186`. It says the absolute upper groups of a local field "are owned here", that the RamificationOfCompleteDiscretelyValuedFields filtration "restricts to these groups", and that "`FunctionFieldArithmetic` consumes it rather than restating it".

**Claim:** Each object has two owners at the open heads.

The FunctionFieldArithmetic passage is in its §4.2 (heading at line 1101) and also states the absolute form.

**Witness:**
- #1410's head, `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md:769`: "ClassFieldTheory consumes §4a.1".
- #1474's head, `TauCetiRoadmap/FunctionFieldArithmetic/README.md:1116–1121`: states `Art_{L/K}(U_K^(r)) = Gal(L/K)^r` in equal characteristic as its own target.

**Repair:**
1. In #1410, replace line 769 by "on a nonarchimedean local field, `G_K^n` at integer `n` is ClassFieldTheory Layer 7 `absoluteUpperRamificationGroup`", and prove the restriction there.
2. In #1474 §4.2, replace the comparison by a citation of ClassFieldTheory Layer 7 (`map_unitFiltration_normResidue`, `closure_map_artinMap_unitFiltration`).
3. Rewrite this pull request's description. It still lists "LocalFieldsRamification as amended by #1410" as a dependency and "#1410 → this PR" as the merge order, although the README no longer consumes #1410. State the actual order with #1410 and #1474.

## R06 (P2) — The "LocalFieldsRamification Layer 3" supplier citations are dropped by #617

**Location:** `README.md:1331`, `1460`, `1473`, `1517`, `1529` and `1566`, for example the *Needs:* line "LocalFieldsRamification Layer 3 (the upper numbering, `upperRamificationGroup_quotient` and `upperRamificationGroup_fixedField`)".

**Claim:** These are supplier citations of a layer that #617 removes.

**Witness:** At #617's head, `Completed/LocalFieldsRamification/README.md` has Layers 0–2 only (lines 298, 366 and 475). Lines 41 and 55–59 there list the upper numbering, ψℕ, the shifted norm inclusion and the graded norms as already in Tau Ceti.

**Repair:** Cite the pinned declarations directly, which is valid whichever way #617 goes:
- `Subgroup.upperRamificationGroup_quotient` and `upperRamificationGroup_fixedField` (`NumberTheory/LocalField/Herbrand/UpperQuotient.lean:234,264`);
- `comap_restrictScalarsHom_upperRamificationGroup` (`:129`) and `map_restrictNormalHom_upperRamificationGroup` (`:98`);
- `LocalFieldsRamification.psiNat` (`Herbrand/Basic.lean:511`);
- `map_normUnits_unitFiltration_psiNat_le` (`Norm/Herbrand.lean:167`);
- the graded norms of `Norm/Graded.lean`;
- `LocalFieldsRamification.hasseArf` (`Herbrand/HasseArf/Abelian.lean:50`).

Checked: each of these names exists at the pin.

## R07 (P3) — Padding: restatements of pinned theorems

**Location:** For example `Suggested.lean:484` `tateIso_cor`, `578–618` (the four diagrams and norm limitation), `222–281` (Layer 0), `883–901`, `1079–1147` and `1245–1271`.

**Claim:** These `sorry` targets restate theorems Tau Ceti proves at the pin. The `Nonempty` theorems at lines 883–901 are also the source of three gate hits (R08).

In four of the probes the Tau Ceti term is composed with this file's `kummerClass_eq` or wrapped in `⟨…⟩`. The full list is under Verified sound.

**Witness:** In a copy of the file, replacing each `sorry` by one `exact`/`apply` of the Tau Ceti declaration closes 31 of them, for example `exact TauCeti.ClassFieldTheory.ClassFormation.tateIso_cor cf T r x`.

**Repair:**
1. Delete the restatements from `Suggested.lean`; the README keeps each as a cited Tau Ceti fact.
2. For names a roadmap on main consumes by this file's name, re-export the Tau Ceti declaration (`alias`) instead of restating it with `sorry`, as README §6 permits. Those names are `projective_ker_of_isZero_res`, `primaryComponent_tateCohomology_eq_bot`, `artinMap_norm`, `eulerCharacteristic_finrank_fp`, `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu`, `scd_p_absoluteGaloisGroup_eq_two`, the cyclotomic three (all used by LocalGaloisGroups), and `cyclicHasseNorm`, `isGlobalNorm_iff_isLocalNormEverywhere`, `card_ideleClassNormQuotient` and `hilbertProductFormula` (used by GlobalQuadraticForms).
3. Two restatements are also narrower than the library: `localSymbol_kummerClass_mul` and `…_steinberg` require `IsUnit (n : 𝒪[K])`, which excludes n = 2 over ℚ₂, the case Layer 14 needs, whereas Tau Ceti requires only `IsUnit (n : K)`.

## R08 (P3) — The nine statement-hygiene hits of the gate

**Location:** `Suggested.lean:884`, `891`, `900` and `1710` (conclusions of the form `Nonempty (… ≃ …)`); `1493–1497` (`letI`/`haveI` in the signature of `map_restrictNormalHom_absoluteUpperRamificationGroup`); `1639` (`.choose` inside `globalClassField`).

**Witness:** The gate reports `statement-hygiene=9`. README §6 (line 2424) itself excludes "an arbitrary `Nonempty (X ≃ Y)` where a canonical map is required".

**Repair:** The repairs of R02 and R07 remove the hits at 884, 891, 900, 1639 and 1710: the canonical data are `h2MuEquivZMod`, `h2EquivZModOfMuNRepIso` and `ringClassArtinEquiv`. For the remaining four hits, declare `TauCeti.finiteIntermediateFieldValuativeRel`, `…Topology`, `…_isNonarchimedeanLocalField` and `…_valuativeExtension` as `attribute [local instance]` before the Layer 7 block, and drop the `letI`/`haveI` from both the definition and the theorem.

## R09 (P3) — Stale and contradictory claims about what is at the pin

**Location:**
1. `README.md:368–369`: "all are Tau Ceti's except `tateIso_res_trans`, a target of Layer 3". This contradicts `Suggested.lean:84–85`.
2. `Suggested.lean:108` and `115` call `localClassFieldCorrespondence_primeToResidueCharacteristic`, `eq_zero_of_localInv_eq_zero` and `sumLocalInv_eq_zero` "`README.md` targets".
3. `README.md:662` places the Nakayama–Rim theorems "in Tau Ceti's `TateCohomology` namespace".
4. `Suggested.lean:1078` cites `TauCeti.card_powerClasses_mixed`.
5. `README.md:2268`, `2326–2329` and `2351` use the names `localNormQuotientEquivZMod_unramified`, `globalArtinMap_quadratic_prime`, `globalArtinMap_Qsqrt5_prime` and `globalArtinMap_zeta5_restrict_Qsqrt5`.
6. `README.md:1090–1094` describes `IsSmoothDiscrete` as "every point stabilizer open" and adds `[DiscreteTopology A.V]` as a separate binder.
7. `Suggested.lean:1635` says "quadratic-order ring class fields".

**Claim:** Taking the items in order:
1. `tateIso_res_trans` is Tau Ceti's, at `Formation/Tate/Naturality.lean:152`.
2. Tau Ceti has all three, as `localClassFieldCorrespondencePrimeToResidueCharacteristic` (`LocalExistence/Correspondence.lean:238`), `sumLocalInv_brLocalization_eq_zero` (`Global/Brauer/SumFormula.lean:142`) and `brLocalization_injective_of_subsingleton_h1_globalFormation`.
3. The Nakayama–Rim theorems are `Rep.*` at the pin.
4. `TauCeti.card_powerClasses_mixed` exists nowhere in Tau Ceti.
5. The four test names exist neither in Tau Ceti nor in this file.
6. `IsSmoothDiscrete` already contains discreteness, so the separate binder is implied.
7. `ringClassField` is defined for every order.

**Witness:** `TauCeti.IsSmoothDiscrete` has the field `discreteTopology : DiscreteTopology X.V` (`ContCohomology/SmoothDiscrete/Basic.lean:259–264`). A search of the pinned Tau Ceti for `card_powerClasses_mixed` returns nothing.

**Repair:** Correct each item as the claim says: cite the Tau Ceti names, delete the redundant binder from the four Layer 5 statements, write "every order", and remove the Lean names from the §5 Checks (house rule: a Check never names a Lean counterpart).

## R10 (P3) — A false Check in §5.6

**Location:** `README.md:2359–2360`: "In a cyclic group of order four, transfer to the subgroup of order two is not interchangeable with the quotient map; the statement must use the actual transfer."

**Claim:** In C₄ the two maps agree up to the unique isomorphism of the groups of order 2.

In V₄, by contrast, the transfer V ≡ 1 while the quotient q ≠ 1.

**Witness:** Let G = C₄ = ⟨g⟩ and H = ⟨g²⟩. For abelian G, V(g) = g^[G:H] = g². So ker V = H = ker q, and V is q followed by the unique isomorphism G/H ≅ H.

**Repair:** Attribute the transfer/quotient distinction to the Klein four case (`ℚ(√5,√13)`), where transfer to an order-2 subgroup is trivial. Say instead that the cyclic case distinguishes inclusion from transfer: inclusion is g² ↦ g², while transfer is surjective onto H. Checked on both groups as above.

## R11 (P3) — A conflicting open pull request with no stated order

**Location:** The pull request description, whose merge-order paragraph names only #1410.

**Witness:** #1215 ("ClassFieldTheory: correct hypotheses, conductors and lifting") also rewrites both files. Its head has a 305-line `Suggested.lean` with 17 `sorry`s and none of the unit-filtration statements, and `git diff --stat` against this head shows about 1,400 README lines differing.

**Repair:** State in the description which of #1215 and #1411 is rebased onto the other before either merges, and do not restate what the other already changes.

## R12 (P3) — README shape and process wording (the previous R10, unrepaired)

**Location:**
- Shape: `README.md:3` ("## Summary"); the numbered `## 1.` … `## 8.` sections; Layers as `###` under `## 4. Build plan`, with no `### Examples`/`### Dependencies`; §3, the "Frozen public interface" target table (lines 516–590).
- Process wording: lines 59–74 ("Suggested home"), 519 ("may change during implementation"), 638 ("audit and complete"), 2236, 2384, 2531–2533, 396 and 2113 ("not certified against the text").
- Implementation sources: lines 2527–2529.

**Witness:** The house shape requires `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k` each ending with `### Examples` and `### Dependencies`, and no target catalogue tables.

**Repair:** Reshape to the house headings. Fold §3 into per-layer prose, delete the process sentences and the implementation-repository references, and cite Artin–Tate (waived) and Nakayama by locator without the certification remark.

## Previous findings

- **R01 (UPWARD to RamificationOfCompleteDiscretelyValuedFields): repaired.** Layer 7 now owns `absoluteUpperRamificationGroup` (lines 1449–1484), no supplier citation of #1410 remains, and the dependency check reports 0 problems. The two-owner conflict with #1410 that remains is R05.
- **R02 ("§4a.1" exists nowhere): repaired.** "4a.1" no longer occurs in the README.
- **R03 (sorry'd data): repaired.** The gate reports `sorry-data=0`, and `invMap`, `artinMap` and `tateDual` are aliases of the Tau Ceti declarations. Two definitions still depend on `sorry`'d propositions (`unramifiedCoordinate`, `globalClassField`); see R02.
- **R04 (native declarations redeveloped): partly repaired.** The aliases replace `invMap`, `tateDual` and `artinMap`, and quadratic reciprocity is now a Check. The remaining duplicates are R02, R03 and R07.
- **R05 (FunctionFieldArithmetic overlap): partly repaired.** Lines 182–186 now state the split, but #1474's head still restates the result (R05).
- **R06 ("load-bearing"): repaired.** Lines 2140–2144 call the congruence description the quadratic specialization. The residual wording at `Suggested.lean:1635` is in R09.
- **R07 (free coordinate `tr`): repaired.** `invCoordinate` (Tau Ceti's `h2MuEquivZMod`) and `localHilbertSymbol` fix the arithmetic coordinate. `localSymbol` keeps `tr` and is documented as auxiliary (lines 1030–1040).
- **R08 (roadmap imports): repaired.** The gate reports `imports=0`. The consequence of dropping those imports is R01.
- **R09 (padding): partly repaired.** `tateIso_res`, `tateIso_res_trans`, `ker_artinMap` and `surjective_artinMap` are gone, and many others remain (R07).
- **R10 (README shape and locators): partly repaired.** The Artin–Tate existence locator is now XIV §6, p. 163 (line 2482), and the principal ideal theorem has hypotheses and a locator (lines 2107–2113). The shape is unchanged (R12).
- **R11 (residue, fence, tex): repaired.** The gate reports `residue=0`, `long-fences=0` and `tex=0`.

## Verified sound

**Gate and build.** The plain gate at this head gives `statement-hygiene=9`, every other count 0, and FAIL; the worker's run adds the 6 build errors (R01).

**Dependency check** (`--movable`):

```text
depcheck: 239 roadmaps, 2425 edges, 0 problem(s)
```

ClassFieldTheory is on main and is not listed in the merge order. Nothing outside the folder changed: `git diff --stat origin/main...HEAD` lists only `README.md` and `Suggested.lean`.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 30 s, with 59 `sorry` warnings and nothing else. I ran `#check @` on every declaration, 148 extracted by regex; one was a docstring word, and the other 147 elaborate. I compared each elaborated type with its README statement. The 8 declarations `signatures.md` flags as having lost a binder (`kummerEquiv_unit`, `brRes`, `brCor`, `localFormation`, `brInfl`, `restrictAbsolute`, `iota_restrictAbsolute_apply`, `absoluteGaloisGroupExtend`) drop only local-field instances that the Tau Ceti constructions do not use, so nothing changes. One difference: `cd_p_absoluteGaloisGroup_eq_two` and `scd_p_absoluteGaloisGroup_eq_two` elaborate at `cohomologicalDimensionAt.{u_1,0}`, a free coefficient universe, while README §2.1 fixes universe 0. They remain true, since cd is universe-independent, but they are stronger than Tau Ceti's universe-0 theorems.

**One-tactic probes.** All rounds ran on copies in scratch. The extra Tau Ceti modules were built from cache with `lake build`.
- **Closed by one `exact`/`apply` of the Tau Ceti declaration (31):**
  - Layer 0 and the abstract layers: `Submodule.free_of_isPrincipalIdealRing`, `isZero_res_of_projective`, `primaryComponent_tateCohomology_eq_bot`, `projective_of_isZero_res`, `projective_ker_of_isZero_res`, `tateIso_cor`, `artinMap_groundInclusion`, `artinMap_groundNorm`, `artinMap_conj`, `artinMap_quotient`, `normSubgroup_maximalAbelianLayer`;
  - Layer 5: `kummerEquiv_unit_mk`, `kummerEquiv_mixed_mk`, `herbrandQuotient_units_eq_finrank_of_isCyclic`, `index_normGroup_of_isCyclic`, `h2MuEquivZMod_unit`, `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu`, `localSymbol_kummerClass_mul`, `tateDualityPairing_perfect_mixed`;
  - Layers 6–7: `localClassFormation_inv`, `localArtinMap_eq_frobenius_pow_valuation`, `subsingleton_h3_unitsRep`, `artinMap_norm`, `unramifiedCoordinate_artinMap`, `map_unitFiltration_norm_eq_of_upper_eq_bot`, `cyclotomicCharacter_artinMap_padic_uniformizer`, `cyclotomicCharacter_artinMap_padic`;
  - global: `exists_globalClassField`, `card_ideleClassNormQuotient`, `gal_ringClassField_equiv_pic`.
- **Same theorem at the pin in another spelling (18):**
  - `isZero_res_of_exact` (argument order differs);
  - `herbrandQuotient_units_eq_one` (Tau Ceti uses the `unitFiltration L 0` carrier);
  - `localSymbol_kummerClass_steinberg` (`…_eq_zero_of_add_eq_one`), `localSymbol_antisymm` and `localSymbol_eq_zero_iff_mem_normGroup` (all three behind the `n = 0` wrapper of `kummerCupPairing`);
  - `localSymbol_kummerClass_eq_zero_iff` (Tau Ceti's `forall_localSymbol_kummerClass_eq_zero_iff` is the second-variable form);
  - `finite_H`, `eulerCharacteristic_mixed` and `eulerCharacteristic_finrank_fp` (no `DiscreteTopology` binder in Tau Ceti);
  - `localArtinMap_uniformizer` (stated with `IsUniformizer`);
  - `cd_p…` and `scd_p…` (the universe difference above);
  - `artinMap_restrict` (through `restrictAbsolute`);
  - `cyclotomicCharacter_artinMap` (Tau Ceti adds `[ValuativeExtension ℚ_[p] F]`);
  - `cyclicHasseNorm` and `isGlobalNorm_iff_isLocalNormEverywhere` (membership in `normGroup` instead of an existential);
  - `finiteHilbertInvariantAt_eq_zero_of_not_mem` and `hilbertProductFormula` (the R02 definitions).
- **Open at the pin (10):** `map_unitFiltration_normResidue`, `sup_norm_unitFiltration_eq_of_upper_eq_top`, `conductorExponent_eq_sInf_upperRamificationGroup` (a corollary of Tau Ceti's iff), the five laws of `absoluteUpperRamificationGroup`, `closure_map_artinMap_unitFiltration`, and the auxiliary `topologicalClosure_commutator_le_ker_restrictMaximalUnramifiedHom` (R02).

**Consumers on main.**
- `Completed/LocalGaloisGroups/Suggested.lean` elaborates against this head (exit 0).
- A copy of `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` with the two R01 imports elaborates (exit 0).
- I resolved every `ClassFieldTheory.*` name used by GlobalQuadraticForms (10 names) and IntegralLattices (7 names). All resolve except `ringClassArtinMap`.

**Library declarations opened at the pin** (file and line in the witnesses above): `TauCeti.IsSmoothDiscrete` (`SmoothDiscrete/Basic.lean:259`); `TauCeti.unramifiedCoordinate` (`Unramified/Coordinate.lean:77`); `localCyclotomicCharacter` (`AbsoluteGaloisGroup/Cyclotomic/Character.lean:33`, Mathlib's `cyclotomicCharacter` on the ring automorphism); `globalClassField` (`GlobalExistence/Correspondence.lean:74`, a `.choose` of `globalAbelianExistence`, which is why the copy here is definitionally equal); `h2MuEquivZMod_mixed` and `h2EquivZModOfMuNRepIso` (`Brauer/RootsOfUnity.lean:145,…`); `unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot` (`UpperNumbering.lean:64`); `forall_localSymbol_kummerClass_eq_zero_iff` (`Local/HilbertPairing.lean:61`); and the Layer 3 replacements listed in R06.

**Cross-roadmap citations resolved.** The 7 leads in `citations.md` (`card_powerClasses_mixed`, `localLogarithm`, `cd_p_le_of_isClosed`, `cd_p_le_scd_p`, `corestriction_comp_res`, `longExact_exact`, `cd_p_eq_of_isProPSylow`) are roadmap-level names in `Completed/LocalFieldsRamification/README.md`, `TauCetiRoadmap/ProfiniteCohomology/README.md` and `Completed/ProfiniteProPGroups/README.md` on main. `TauCetiRoadmap/RepresentationTheory/ModularInduction/README.md` exists on main. #617, #1410, #1474 and #1215 were read at their heads (R05, R06, R11). No declaration of `Suggested.lean` reuses the fully qualified name of a declaration in another roadmap's `Suggested.lean`.

**Sources checked at their locators** (cached texts):
- Milne, *CFT* v4.03 (`milne-cft`):
  - II Thm 3.11, Tate's theorem, p. 84 (line 3911);
  - III Lemmas 2.3–2.6, p. 104 (lines 4716–4751; Lemma 2.5 gives h(U_L) = 1 and h(Lˣ) = n, Lemma 2.6 gives #H² ∣ n);
  - V Example 3.11, p. 159 (line 7121);
  - V Example 5.4, p. 179 (line 8142);
  - VII Prop 2.7 through Cor 4.4, pp. 206–211 (lines 9379–9619);
  - VII Thm 5.1, p. 212;
  - VII Prop 7.2 and Lemma 7.3, p. 220;
  - VII Thm 8.1 and Example 8.2, p. 221 (lines 10042 and 10059);
  - VII Lemmas 9.1, 9.3 and 9.4 and Thm 9.5, pp. 223–226;
  - VII Thm A.3, p. 226;
  - VIII Thm 4.7, p. 242 (line 11011).

  "I §1, Remark 1.9" (`README.md:1655`) is the unlabelled numbered paragraph 1.9 on p. 23 (line 1321), which defines the local conductor and supports the claim.
- Serre 1961 (`serre1961`), n° 3.1, the paragraph after Proposition 3, p. 128 (lines 931–938): the upper groups of an infinite Galois extension are defined by passing to the limit, as cited at `README.md:1468`.
- Kopp–Lagarias (`kopp-lagarias`), Theorems 1.1–1.3 (lines 128–186): any order and level datum (O; m, Σ); the ring class field is H^O_{O,∅}, and Thm 1.3 gives Art_O.

**Adversarial table.** Rows cover the sampled §§2.1–2.7 and §§5.1–5.8, the headlines, and every finding target.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §2.1 layer `Γ = U/V`, `A^U/N(A^V)` | G = Ẑ, A = ℤ trivial, U = nẐ ⊇ V = mnẐ; V = U | Γ = ℤ/m, N = ·m, quotient ℤ/m; at V = U: Γ = 1, quotient 0 | sound | none |
| §2.2 axioms 3–4 | unramified layer of degree 6, intermediate E of degree 2 | inv u = 1/6; inv_E(res u) = 2·(1/6) = 1/3, of order 3 = [L:E] | sound | none |
| §2.3 restriction / corestriction / inflation scalings | [U:V] = 6, [U':V] = 2, [U:U'] = 3; inflation with [U:V] = 2, [V:V'] = 3 | cor: 1/2 = 3/6; inflation: 1/2 = 3/6; the reversed index [U':U] would give the wrong invariant | sound | none |
| §2.4 `tateTheorem` hypotheses | C₂ acting on ℂˣ; C₂ acting trivially on ℤ/2 | ℂˣ: H¹ = 0, #H² = 2, and Ĥ⁻² = C₂ ≅ ℝˣ/ℝ>0; ℤ/2: H¹ = ℤ/2 ≠ 0, so `_h1` fails | sound | none |
| §2.5 `artinEquiv = nakayamaNegTwo.symm` | ℚ₂(ζ₅), Art(2) | ζ₅ ↦ ζ₅²; the inverse direction gives ζ₅³ (2⁻¹ ≡ 3 mod 5) | sound | none |
| §2.6 χ_cyc(Art u) = N(u)⁻¹ | ℚ₂ with u = −3 on μ₁₆ and u = −1 on μ₄; ℚ(ζ_m) | (−3)⁻¹ ≡ 5 mod 16, against 13 without the inverse; −1 ∉ N(ℚ₂(i)) since (−1,−1)₂ = −1, so i ↦ −i; globally, Art_p(ℓ⁻¹) acts by ℓ, giving ζ ↦ ζ^ℓ | sound | none |
| §2.7 directions on subgroups and fields; Ĥ⁰ inflation | V₁ ≤ V₂; V = ⊤ | N(V₁) ≤ N(V₂) while the fixed fields reverse; ⊤ ↦ Kˣ; N_G A ⊆ N_{G/H} A^H, so the naive Ĥ⁰ inflation is undefined | sound | none |
| §5.1 trivial layer | U/U | A^U/N = 0 and (U/U)^ab = 1 | sound | none |
| §5.2 cyclic layer | Γ = C_n | #A^U/N = n = [U:V] | sound | none |
| §5.3 unramified tests | ℚ₂(ζ₅) (2 has order 4 mod 5); m = 2 over ℚ₂ | Kˣ/N ≅ ℤ/4 with π ↦ 1; the excluded formula would give (−1)² = 1 ≠ −1 | sound | none |
| §5.4 local quadratic, exact K(√d) | ℚ₂(i) with a = −1; L = K(√d,√e) | Art(−1) = τ ⇔ (−1,−1)₂ = −1; the degree-4 L is excluded by [L:K] = 2 | sound | none |
| §5.4 global quadratic | ℚ(i) with ℓ = 3, 5; ℚ(√5) with ℓ = 11, 7 | i³ = −i; 5 splits; 11 ≡ 1 splits; 7 ≡ 2 mod 5 gives τ | sound | none |
| §5.5 cyclotomic values | ℚ(ζ₅) with ℓ = 2, 3, 11; ℚ(ζ₈) with ℓ = 3, 5, 7 | 2 has order 4; 11 ≡ 1 acts trivially; ζ₈ ↦ ζ₈^ℓ | sound | none |
| §5.6 C₄ transfer sentence | C₄ ⊇ C₂; V₄ ⊇ C₂ | C₄: V(g) = g², and ker V = ker q = H; V₄: V ≡ 1 while q ≠ 1 | false for C₄ | R10 |
| §5.6 ℚ(√5) ⊂ ℚ(ζ₅) restriction | ℓ = 11, 7 | 11 is a square mod 5, so trivial; 7 is not, so nontrivial | sound | none |
| §5.7 Hasse norm counterexample | ℚ(√13,√17) | (17/13) = (4/13) = 1; (13/17) = 1; 2 is inert in ℚ(√13) and splits in ℚ(√17); all decomposition groups have order ≤ 2, so lcm 2 < 4 | sound | none |
| §5.7 cubic Pic | ℚ(ζ₇+ζ₇⁻¹), d = 49 | Minkowski bound (3!/3³)·7 = 14/9 < 2, so h = 1 | sound | none |
| §5.8 mandatory suite | the seven names | all exist at the pin (`TrivialLayer.lean:149`, `LocalExistence/NormSubgroup.lean:199`, `Local/Unramified.lean:342`, `Local/Quadratic.lean:57`, `Cyclotomic/Gaussian.lean:45`, `Cyclotomic/Prime.lean:42`, `AdmissibleModulus/Basic.lean:239`) | sound | none |
| `absoluteUpperRamificationGroup` images | ℚ₂(ζ₈) at n = 0..3; ℚ_p(ζ_p) at n = 0, 1; an unramified quotient at n = 0 | images G, G, {1,5}, 1 (lower group G₃ = {1,5} and φ(3) = 2); G of order p−1, then 1; 1 | sound | none |
| `map_unitFiltration_normResidue` | ℚ₂(√2) at n = 2, 3; F_p((t)) with y^p − y = t⁻¹ at n = 1, 2; ℚ_p(ζ_p) at n = 0, 1 | images G, 1 against G² = G, G³ = 1 (break 2, v(disc) = 3, 5 ∉ N, 1 + 8ℤ₂ ⊆ squares); G, 1 against break 1; G, 1 | sound | none |
| `sup_norm_unitFiltration_eq_of_upper_eq_top` | ℚ₂(√2), r = 2 | N(1+√2) = −1 ∉ 1 + 4ℤ₂, so ℤ₂ˣ = N(U)·U^(2) | sound | none |
| `map_unitFiltration_norm_eq_of_upper_eq_bot` | S₃ = Gal(ℚ₂(∛2,ζ₃)/ℚ₂), v = 1 | G¹ = 1 and ψ(1) = 3, so N(U_L^(3)) = U^(1) by Tau Ceti; the target excludes this extension | narrower than the pin | R03 |
| `conductorExponent_eq_sInf…` | unramified; ℚ₅(ζ₅); ℚ₂(√2); ℚ₂(ζ₈) | sInf on one side and conductor on the other: 0, 1, 3, 3 on both | sound, but at the pin | R03 |
| `closure_map_artinMap_unitFiltration` | ℚ_p at n = 0 | Art(ℤ_pˣ) is compact, equal to the image of I_K ≅ ℤ_pˣ | sound | none |
| `hilbertProductFormula` | ℚ with (3,7), (−1,−1), (5,5) | (3,7): 1 + 0 + 1 + 0 = 0; (−1,−1): 1 + 1 = 0; (5,5): this file sums over {2,5}, Tau Ceti's support is ∅, and every value is 0 | sound, but duplicate definitions | R02 |
| `localSymbol_kummerClass_mul` hypotheses | ℚ₂, n = 2 | `IsUnit (2 : ℤ₂)` is false, so excluded; `IsUnit (2 : ℚ₂)` is true | narrower than the pin | R07 |
| `eulerCharacteristic_mixed` and `…_finrank_fp` | ℚ_p (p odd) with ℤ/p; ℚ₂ with ℤ/2 | p² = p·1·p; 8 = 2·2·2; 3 = 1 + 1 + 1 | sound, but at the pin | R07 |
| `normSubgroup_maximalAbelianLayer` | Gal(ℚ(∛2,ζ₃)/ℚ) = S₃ | maximal abelian subfield ℚ(ζ₃); both indices are 2 | sound, but at the pin | R07 |
| `artinMap_groundInclusion` | ℚ(√5,√13) over E = ℚ(√5) | transfer V₄ → C₂ is trivial; for ℓ inert in ℚ(√5), Frob_{ℓ𝒪_E} = Frob_ℓ² = 1 | sound, but at the pin | R07 |
| `card_ideleClassNormQuotient`; `cyclicHasseNorm` | ℚ(i)/ℚ and L = K; ℚ(√13,√17) | indices 2 and 1; V₄ is excluded by `IsCyclic` | sound, but at the pin | R07 |
| `gal_ringClassField_equiv_pic` | maximal order of ℚ(√3) | Pic = 1 and the ring class field is K (narrow h = 2 does not enter) | sound, but `Nonempty` | R02, R08 |
| principal ideal theorem (absent) | the `IsPrincipal` statement in R04 | it elaborates at the pins | statable, absent | R04 |
| `kummerClass` and `kummerCupPairing` junk values | n = 0; n = p in characteristic p | value 0 and the zero pairing; `kummerClass_mul` and `localSymbol_antisymm` hold trivially there | sound | none |
| consumers of this module | QuadraticFormInvariants; IntegralLattices line 419 | 6 build errors; unknown `ringClassArtinMap` | build fails | R01 |

**Ownership against open work.** I searched by object over main, the board packages and the open heads given: the absolute upper filtration, unit-filtration reciprocity, ring class fields and Hilbert invariants. The overlaps found are R05 (with #1410 and #1474), R06 (#617) and R11 (#1215). Ownership against the other open pull requests whose files the brief did not provide was not checked.

## Not verifiable

- **Nakayama, Ann. of Math. 65 (1957)** (`README.md:396`, flagged by the README as unverified) and **Tate, Ann. of Math. 56 (1952)**: JSTOR, paywalled. I found no open copy in Numdam, EuDML or GDZ, and neither is in the manifest.
- **Serre, *Local Fields*** (IV §3 Prop 14; IV §4; XV §2 Thm 2 and Cor 3 to Thm 1; V §§3, 6) and **Serre, *Galois Cohomology*** (II §5.3): Springer, paywalled, not in the manifest.
- **Neukirch, Schmidt and Wingberg** ((3.3.4), (7.1.8), (7.2.5), (7.3.1)–(7.3.4)), **Milne, *Arithmetic Duality Theorems*** (I 2.8), **Brown** (VI §8), **Rim 1959**, **Lang, *Algebra*** (III 7.1), **Cox** (Prop 7.22), and **Tate, Corvallis**: not in the manifest, and no legal copy was located.
- **Artin–Tate** (waived) and **Neukirch, *ANT*** (uncertified): cited by locator only, as settled.

## Source issues

- none
