# Review of ClassFieldTheory (pull request #1411 at eb95acd)

**Verdict:** needs changes

This is a full review of the head. Since `71f458c` the folder changed in one place: Layer 7 no longer defines the absolute upper ramification groups, and consumes them from RamificationOfCompleteDiscretelyValuedFields §4a.1 instead. In `Suggested.lean` the five `absoluteUpperRamificationGroup` declarations are gone, and `closure_map_artinMap_unitFiltration` now takes the group as an argument together with a hypothesis that characterises it. Everything else is the text the previous review read.

The gate fails for three reasons:
- `build=6`: QuadraticFormInvariants breaks on this module's imports (R01).
- `depcheck=1`: a new UPWARD edge, the price of the Layer 7 change (R02).
- `statement-hygiene=9` (R09).

Of the previous review's twelve findings, one is repaired: the two-owner conflict with #1410, which was part of its R05. Every other finding is still open.

## R01 (P1) — The build fails in QuadraticFormInvariants, and IntegralLattices breaks behind it (previous R01, not repaired)

**Location:** `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:1–58`, the import list. On main it also imported `Completed.NumberFieldArithmetic.Suggested` and three other roadmap modules. The declaration `ringClassArtinMap` (main's line 4327) is gone.

**Claim:** Two roadmaps on main import `TauCetiRoadmap.ClassFieldTheory.Suggested`, and this head breaks both.
- **QuadraticFormInvariants** used three Tau Ceti lemmas that it reached only through the dropped imports.
- **IntegralLattices** checks a name this file no longer declares.

**Witness:**
- The gate fails at `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:2852`, `2858`, `2920` and `2924` with "Unknown identifier/constant". The missing lemmas are `TauCeti.Algebra.trace_eq_zero_of_sq_algebraMap_of_not_mem_range` (`FieldTheory/Trace.lean:46`) and `Algebra.IsQuadraticExtension.norm_algebraMap_add_algebraMap_mul` and `…trace_…` (`RingTheory/Norm/Quadratic.lean:171,182`).
- In a scratch file that imports this head's module, opens `TauCeti` and sits inside `namespace TauCetiRoadmap.IntegralLattices`, `#check ClassFieldTheory.ringClassArtinMap` fails with "Unknown identifier". This is the check at `TauCetiRoadmap/IntegralLattices/Suggested.lean:419`.

**Repair:**
1. **QuadraticFormInvariants.** Add `import TauCeti.FieldTheory.Trace` and `import TauCeti.RingTheory.Norm.Quadratic` to `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean`. Tested: a scratch copy with exactly these two lines elaborates against this head (exit 0, only `sorry` warnings).
2. **IntegralLattices.** Either repoint line 419 to `TauCeti.ClassFieldTheory.ringClassArtinMap`, or declare `ringClassArtinMap` here as an `abbrev` of it.
3. **Ordering.** Both edits lie outside this folder, so they go in a pull request that merges first, and this description states that order. Restoring roadmap imports here is not allowed, because the gate's `imports` rule forbids them.

## R02 (P2) — The dependency check reports an UPWARD supplier edge

**Location:**
- `README.md:164` (the supplier row "`RamificationOfCompleteDiscretelyValuedFields` §4a.1: `absoluteUpperRamificationGroup`, …");
- `README.md:1533–1538` (*Needs:* of unit-filtration reciprocity);
- `README.md:2419` (the Layer 7 row of §7).

**Claim:** ClassFieldTheory is on main. It now cites RamificationOfCompleteDiscretelyValuedFields, which exists only in the open draft #1410 and is listed second in the merge order. If this pull request merged first, main would cite a section that main does not contain.

The edge is not a cycle. At #1410's head, ClassFieldTheory is mentioned only at lines 88 and 1027 of its README, both as consumers, and nothing there consumes ClassFieldTheory. The citation is also correct in content: §4a.1 (README line 696; `Suggested.lean:181`, `202`, `220`) defines `absoluteUpperRamificationGroup K O u` and its finite projections. Its fourth bullet states the local-field agreement that the `_habs` hypothesis of `closure_map_artinMap_unitFiltration` encodes.

**Witness:** The dependency check, run on this head, prints:

```text
UPWARD: ClassFieldTheory (on main) -> RamificationOfCompleteDiscretelyValuedFields (#2) at README lines [164, 1533, 2419]
depcheck: 238 roadmaps, 2354 edges, 1 problem(s)
```

**Repair:** Keep the single-owner design, which #1410's README line 1027 also states. Merge #1410 before this pull request, as the description's `depends-on` says, then rebase and re-run the gate. Once RamificationOfCompleteDiscretelyValuedFields is on main, the three edges become main-to-main citations and the check no longer reports them. Until then, the folder cannot be accepted.

Do not revert to defining `absoluteUpperRamificationGroup` here. That brings back the two-owner conflict with #1410, which this head repairs.

## R03 (P2) — Objects that Tau Ceti defines at the pin are defined again here, with bodies of their own (previous R02, not repaired)

**Location:**
- global: `Suggested.lean:1585–1601`, `1653–1674`, `1682–1714`;
- local: `1290–1299`, `1360–1373`;
- local units: `792–809`.

**Claim:** These declarations rebuild pinned objects instead of naming them.
- **Hilbert invariants.** Tau Ceti's `finiteHilbertSupport` is the support of the invariants (`Global/Hilbert/Invariant.lean:371`), and its `infiniteHilbertInvariantAt` is a Brauer invariant (`:143`). This file's support is "the places where 2, a or b is a non-unit" (line 1698), and its infinite invariant is a sign rule (line 1689). Tau Ceti also proves `hilbertProductFormula` (`Global/Hilbert/Reciprocity.lean:65`).
- **The unramified coordinate.** `unramifiedCoordinate` is rebuilt through the `sorry`'d `topologicalClosure_commutator_le_ker_restrictMaximalUnramifiedHom`.
- **`restrictAbsolute`.** It is restriction to the finite extension, which Tau Ceti already has.
- **The global class-field family.** `GlobalNormSubgroups`, `exists_globalClassField`, `globalClassField` (built with `.choose`), `ringClassNormSubgroup` and `ringClassField`.
- **`unitsFiniteLayerRep`.** Tau Ceti uses `unitFiltration L 0` for the local units.

**Witness:** Take K = ℚ and a = b = 5.
- This file's `finiteHilbertSupport` is {2, 5}.
- Tau Ceti's is ∅: (5,5)₂ = 1 because ε(5) = 2 is even, and (5,5)₅ = (5,−1)₅ = (−1/5) = 1.

Also, `gal_ringClassField_equiv_pic` closes by `exact ⟨(TauCeti.ClassFieldTheory.ringClassArtinEquiv O).symm⟩` at this head (probe P5 under Verified sound).

**Repair:**
1. Make each declaration above an `abbrev` of its Tau Ceti counterpart. This keeps the names that GlobalQuadraticForms and IntegralLattices use (`finiteHilbertSupport`, `finiteHilbertInvariantAt`, `infiniteHilbertInvariantAt`, `ringClassField`, `ideleNormMap`, …).
2. Delete `topologicalClosure_commutator_le_ker_restrictMaximalUnramifiedHom`, `exists_globalClassField`, `unitsFiniteLayerRep` and `herbrandQuotient_units_eq_one`, and cite `herbrandQuotient_unitFiltration_zero` in their place.
3. In README Layer 14 (line 2151), describe `finiteHilbertSupport` as the support of the invariants.

## R04 (P2) — Layer 7 re-plans pinned results, at narrower generality (previous R03, not repaired)

**Location:**
- `README.md:1476–1488`: "This roadmap proves two intermediate targets for every finite totally ramified abelian extension `E/F` … with their unit-filtration API intended for LocalFieldsRamification".
- `README.md:1391–1392`: "is proved here".
- `Suggested.lean:1399–1409`, `1440–1447` and `1497–1534`.

**Claim:** Tau Ceti already proves these at the pin:
- `map_unitFiltration_norm_eq_of_upper_eq_bot` is `TauCeti.map_normUnits_unitFiltration_psiNat_eq_of_upperRamificationGroup_eq_bot` (`NumberTheory/LocalField/Norm/Surjectivity.lean:223`). Tau Ceti proves it for every finite Galois `L/K`, so the abelian and totally ramified hypotheses are unnecessary.
- The conductor formula is a corollary of `conductorExponent_le_iff_upperRamificationGroup_eq_bot` (`Local/Conductor/UpperNumbering.lean:121`).
- The three cyclotomic theorems are `localCyclotomicCharacter_artinMap_padic_uniformizer` (`Local/Cyclotomic.lean:364`), `…_padic` and `…_unit` (`ExplicitCyclotomicSymbol/ArtinMap.lean:294,311`).

**Witness:**
- The probe `exact TauCeti.map_normUnits_unitFiltration_psiNat_eq_of_upperRamificationGroup_eq_bot hr` closes the first target at this head (P3).
- Over ℚ₂, the S₃ field `ℚ₂(∛2, ζ₃)` is tame with e = 3. It has G¹ = 1 and ψ(1) = 3, so Tau Ceti gives N(U_L^(3)) = U^(1). The roadmap's target excludes this extension.

**Repair:**
1. Keep as Layer 7 targets only the results that are open at the pin: `map_unitFiltration_normResidue`, `sup_norm_unitFiltration_eq_of_upper_eq_top` and `closure_map_artinMap_unitFiltration`.
2. Cite the Tau Ceti theorems above under the supplier contracts. Consume the first norm equality for every Galois extension, and drop its induction from the proof route.
3. Delete `map_unitFiltration_norm_eq_of_upper_eq_bot` from `Suggested.lean`. Keep `conductorExponent_eq_sInf_upperRamificationGroup` only as a stated corollary.
4. Make the cyclotomic three aliases of the Tau Ceti theorems, since LocalGaloisGroups consumes them.
5. Correct "is proved here" at line 1392.

## R05 (P2) — Two headlines that are statable at the pins are absent (previous R04, not repaired)

**Location:** `Suggested.lean:129–134`: "Two headlines of this item are stated in `README.md` only and not in this file: the principal ideal theorem in its arithmetic form … and the abelian conductor–discriminant formula".

**Claim:** The docstring names no missing carrier for either headline, and both are statable at the pins. Tau Ceti proves only the abstract form of the principal ideal theorem, `ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator`, so the arithmetic form is open.

**Witness:**
- The principal ideal theorem: with `TauCeti.NumberTheory.ClassFieldTheory.ClassFields.RayClassField` imported, `(I.map (algebraMap (𝓞 K) (𝓞 (TauCeti.ClassFieldTheory.hilbertClassField K)))).IsPrincipal`, for `I : Ideal (𝓞 K)` and with no further hypothesis, elaborates in a scratch file (exit 0).
- The conductor–discriminant formula: its carriers exist at the pins, `abelianConductor` (`Global/AdmissibleModulus/Basic.lean:193`) and `relDiscr` (`RingTheory/DedekindDomain/Discriminant/Basic.lean:33`).

**Repair:**
1. State the principal ideal theorem as above, with the README's locator.
2. State the conductor–discriminant formula with `relDiscr` and the finite parts of `abelianConductor` of the fixed fields of character kernels.
3. Remove the docstring sentence. If a carrier proves to be missing, name it there instead.

## R06 (P2) — FunctionFieldArithmetic still owns unit-filtration reciprocity in equal characteristic (previous R05, partly repaired)

**Location:** `README.md:182–186`: "Unit-filtration reciprocity (Layer 7) is this roadmap's in both characteristics … `FunctionFieldArithmetic` consumes it rather than restating it".

**Claim:** At #1474's head, FunctionFieldArithmetic §4.2 states the same equality, and its absolute form, as its own target. The object therefore has two owners.

The #1410 half of the previous R05 is repaired: §4a.1 is owned there and consumed here, and both READMEs say so (#1410 README lines 99–108 and 1027).

**Witness:** At #1474's head, `TauCetiRoadmap/FunctionFieldArithmetic/README.md:1115–1121` states, for every finite abelian `L/K` in equal characteristic and every integer `r ≥ 0`, that `Art_{L/K}(U_K^(r)) = Gal(L/K)^r`, and the same for every abelian algebraic `E/K`. Its proof route goes through Lubin–Tate (lines 1138–1150).

**Repair:**
1. In #1474 §4.2, replace that paragraph and its proof by a citation of ClassFieldTheory Layer 7 (`map_unitFiltration_normResidue`, `closure_map_artinMap_unitFiltration`).
2. Name #1474 in this description's merge-order paragraph.

## R07 (P2) — The "LocalFieldsRamification Layer 3" supplier citations are dropped by #617 (previous R06, not repaired)

**Location:** `README.md:1332`, `1485`, `1497` and `1535`, for example "*Needs:* LocalFieldsRamification Layer 3 (the prime-degree graded norms and their consequences, …)".

**Claim:** #617 rewrites LocalFieldsRamification, and its head has no Layer 3. These supplier citations break when #617 merges.

**Witness:** At #617's head, `LocalFieldsRamification/README.md` has `## Layer 0`, `## Layer 1` and `## Layer 2: the Hasse–Arf theorem` only (lines 300, 368, 477). On main, Layer 3 is at `Completed/LocalFieldsRamification/README.md:724`.

**Repair:** Cite the pinned declarations, which works whichever way #617 goes:
- `upperRamificationGroup_quotient` and `upperRamificationGroup_fixedField` (`NumberTheory/LocalField/Herbrand/UpperQuotient.lean:234,264`);
- `LocalFieldsRamification.psiNat` (`Herbrand/Basic.lean:511`);
- `map_normUnits_unitFiltration_psiNat_le` (`Norm/Herbrand.lean:167`);
- the graded norms of `Norm/Graded.lean`;
- `LocalFieldsRamification.hasseArf` (`Herbrand/HasseArf/Abelian.lean:50`).

## R08 (P3) — Padding: `sorry`'d restatements of pinned theorems (previous R07, not repaired)

**Location:** for example `Suggested.lean:485` (`tateIso_cor`), `579–619` (the four functoriality diagrams and norm limitation), `207–273` (Layer 0), `884–902`, `1080–1148`, `1194`, `1246`, `1340` and `1604`.

**Claim:** These `sorry` targets restate theorems that Tau Ceti proves at the pin.

Two of them are also narrower than the library. `localSymbol_kummerClass_mul` and `…_steinberg` require `IsUnit (n : 𝒪[K])`, which excludes n = 2 over ℚ₂, the case Layer 14 needs. Tau Ceti requires only `IsUnit (n : K)`.

**Witness:** Each of seven probes on this head closes with one `exact` of the Tau Ceti declaration (P1–P7 under Verified sound). For example:
- `exact TauCeti.ClassFieldTheory.ClassFormation.normSubgroup_maximalAbelianLayer cf V`;
- `exact TauCeti.ClassFieldTheory.artinMap_norm L (iota := iota) x τ hτ`.

**Repair:**
1. Delete the restatements; the README keeps each as a cited Tau Ceti fact.
2. Where a roadmap on main consumes the name, replace the `sorry` by an alias of the Tau Ceti declaration instead. Those names are `projective_ker_of_isZero_res`, `primaryComponent_tateCohomology_eq_bot`, `artinMap_norm`, `eulerCharacteristic_finrank_fp`, `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu`, `scd_p_absoluteGaloisGroup_eq_two`, `cyclicHasseNorm`, `isGlobalNorm_iff_isLocalNormEverywhere`, `card_ideleClassNormQuotient` and `hilbertProductFormula`.
3. Layer 0's "This layer's targets" (README lines 663–717) are all Tau Ceti's at the pin: `Rep.isZero_res_of_projective`, `Rep.projective_of_isZero_res` and `Rep.isZero_res_of_exact` (`TateCohomology/Projective/Basic.lean:123,232,251`); `Rep.projective_ker_of_isZero_res` (`NakayamaRim.lean:117`); `Submodule.free_of_isPrincipalIdealRing` (`LinearAlgebra/FreeModule/PID.lean:42`); and `primaryComponent_tateCohomology_eq_bot` (`TateCohomology/PrimaryComponent.lean`). Turn the layer into supplier citations.

## R09 (P3) — The gate's nine statement-hygiene hits, and a commented-out code block (previous R08, partly changed)

**Location:**
- `Suggested.lean:884`, `889`, `896` and `1671`: conclusions of the form `Nonempty (… ≃ …)`;
- `1464–1476`: `letI`/`haveI` inside the `_habs` hypothesis of `closure_map_artinMap_unitFiltration`;
- `1599–1601`: `.choose` in `globalClassField`;
- `1449–1457`: a comment block containing a commented-out `open TauCetiRoadmap.RamificationOfCompleteDiscretelyValuedFields (…)` and "not importable here".

**Witness:**
- The gate reports `statement-hygiene=9`.
- README §6 (line 2391) itself excludes "an arbitrary `Nonempty (X ≃ Y)` where a canonical map is required".
- The house form allows no process comments or dead code; what is not statable belongs in the module docstring, which already says it (lines 100–102).

**Repair:**
1. The repairs of R03 and R08 remove the hits at 884, 889, 896, 1599 and 1671. The canonical data are `h2MuEquivZMod`, `h2EquivZModOfMuNRepIso` and `ringClassArtinEquiv`.
2. For the four `letI`/`haveI` hits, put this before the theorem:

   ```lean
   attribute [local instance] TauCeti.finiteIntermediateFieldValuativeRel
     TauCeti.finiteIntermediateFieldTopology TauCeti.finiteIntermediateField_isNonarchimedeanLocalField
     TauCeti.finiteIntermediateField_valuativeExtension
   ```

   Then drop the four `letI`/`haveI` lines from `_habs`. Tau Ceti documents these structures as meant to be installed locally (`FiniteExtension/IntermediateField.lean:67`).

   Tested: the rewritten theorem elaborates against this head, and `type_of% @closure_map_artinMap_unitFiltration' = type_of% @closure_map_artinMap_unitFiltration := rfl` checks, so the statement is unchanged.
3. Delete the comment block at lines 1449–1457.

## R10 (P3) — Stale and contradictory claims about what is at the pin (previous R09, not repaired)

**Location:**
1. `README.md:369–370`: "all are Tau Ceti's except `tateIso_res_trans`, a target of Layer 3".
2. `Suggested.lean:109` and `116` call `localClassFieldCorrespondence_primeToResidueCharacteristic`, `eq_zero_of_localInv_eq_zero` and `sumLocalInv_eq_zero` "`README.md` targets".
3. `README.md:663` and `673` place the Nakayama–Rim theorems "in Tau Ceti's `TateCohomology` namespace".
4. `Suggested.lean:1079` cites `TauCeti.card_powerClasses_mixed`.
5. `README.md:2237`, `2295`, `2298` and `2320` use the names `localNormQuotientEquivZMod_unramified`, `globalArtinMap_quadratic_prime`, `globalArtinMap_Qsqrt5_prime` and `globalArtinMap_zeta5_restrict_Qsqrt5`.
6. `README.md:1094` describes `IsSmoothDiscrete` as "every point stabilizer open", and `Suggested.lean:1083`, `1091`, `1109`, `1130` and `1142` add `[DiscreteTopology A.V]` beside it.
7. `Suggested.lean:1597` says "quadratic-order ring class fields".

**Witness, item by item:**
1. `tateIso_res_trans` is at `Formation/Tate/Naturality.lean:152`.
2. Tau Ceti has `localClassFieldCorrespondencePrimeToResidueCharacteristic` (`LocalExistence/Correspondence.lean:238`), `sumLocalInv_brLocalization_eq_zero` (`Global/Brauer/SumFormula.lean:142`) and `brLocalization_injective_of_subsingleton_h1_globalFormation` (`LocalizationKernel.lean:154`).
3. The Nakayama–Rim theorems are in `namespace Rep` (`Projective/Basic.lean:96`, `NakayamaRim.lean:73`).
4. Tau Ceti's count is `TauCeti.card_powerClasses` (`LocalField/PowerSubgroup/Basic.lean:288`).
5. None of the four names exists in Tau Ceti or in this file.
6. `IsSmoothDiscrete` has the field `discreteTopology : DiscreteTopology X.V` (`SmoothDiscrete/Basic.lean:261`), so the extra binder is implied.
7. `ringClassField` is defined for every order.

**Repair:** Correct each item as its witness says. Cite the Tau Ceti names, delete the redundant binder, write "every order", and remove the Lean names from the §5 Checks, since a Check never names a Lean counterpart.

## R11 (P3) — A false Check in §5.6 (previous R10, not repaired)

**Location:** `README.md:2328–2329`: "In a cyclic group of order four, transfer to the subgroup of order two is not interchangeable with the quotient map; the statement must use the actual transfer."

**Claim:** In C₄ the two maps agree, up to the unique isomorphism of groups of order 2. The distinction exists in the Klein four group.

**Witness:** Let G = C₄ = ⟨g⟩ and H = ⟨g²⟩. For abelian G, the transfer is V(x) = x^[G:H], so V(g) = g² and ker V = H = ker q; V is q followed by G/H ≅ H. In V₄, by contrast, V(x) = x² = 1 while q ≠ 1.

**Repair:** Attribute the transfer/quotient distinction to the Klein four case `ℚ(√5,√13)/ℚ`, where transfer to an order-2 subgroup is trivial. For the cyclic case, say instead that it distinguishes inclusion (g² ↦ g²) from transfer (g ↦ g², which is onto H).

## R12 (P3) — Conflicting open pull requests with no stated order (previous R11, not repaired)

**Location:** the pull request description, whose merge-order paragraph names only #1410. It also still describes #1410 as "LocalFieldsRamification as amended by #1410", although #1410 is the new roadmap RamificationOfCompleteDiscretelyValuedFields.

**Witness:** The overlap scan finds two open pull requests that change this roadmap and conflict with this head:
- #1215 conflicts in `README.md` and `Suggested.lean`;
- #617 conflicts in `README.md`.

**Repair:** State which of #1215, #617 and #1411 is rebased onto which before any of them merges, add #1474 (R06), and correct the description of #1410.

## R13 (P3) — README shape and process wording (previous R12, not repaired)

**Location:**
- Shape: line 3 ("## Summary"); the numbered sections `## 1.` … `## 8.`; Layers as `###` under `## 4. Build plan`, with none of the 15 layers ending in `### Examples`/`### Dependencies`; §3's "Frozen public interface" target table (lines 517–590).
- Process and provisional wording:
  - line 59 ("Suggested home:");
  - line 520 ("may change during implementation");
  - line 639 ("audit and complete");
  - lines 397–399 ("the theorem number is not certified against the text", "it should be proved … if it is not already available");
  - line 2082 ("this locator is not certified against the text");
  - lines 2205–2206 ("The first versions may be proved for finite-level maps. They should not wait …");
  - lines 2353–2359 ("should be added only after the following supplier maps have stable names");
  - lines 2502–2504 ("as the supplier audit is completed").
- Implementation sources: lines 2498–2501 (`kbuzzard/ClassFieldTheory`, the FLT repository).

**Witness:** The house shape requires a `**Summary.**` paragraph, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, and `## Layer k` sections that each end with `### Examples` and `### Dependencies`. It allows no target catalogue tables and no provisional or process wording.

**Repair:**
1. Reshape to the house headings.
2. Fold §3 into per-layer prose.
3. Delete the process sentences and the implementation-repository references.
4. Cite Nakayama and Artin–Tate XIII §4 by locator, without the certification remark.

## Previous findings

- **R01 (build):** not repaired. Same six errors; the IntegralLattices break is reconfirmed. This report's R01.
- **R02 (duplicate definitions):** not repaired. R03.
- **R03 (Layer 7 re-plans pinned results):** not repaired. The text at lines 1476–1488 and the theorem at `Suggested.lean:1401` are unchanged. R04.
- **R04 (absent headlines):** not repaired. `Suggested.lean:129–134` is unchanged. R05.
- **R05 (two owners):**
  - The #1410 half is **repaired**. Lines 177–181 now read "`RamificationOfCompleteDiscretelyValuedFields` owns the absolute upper ramification groups `G_K^u` (§4a.1, …); Layer 7 consumes them", which agrees with #1410's line 1027. That repair introduces R02.
  - The #1474 half is not repaired (R06).
  - The description is partly repaired: its merge order "#1410 → this PR" now matches the README (R12).
- **R06 (#617 drops Layer 3):** not repaired. R07.
- **R07 (padding):** not repaired. R08.
- **R08 (hygiene):**
  - The hits moved: the Layer 7 `letI`/`haveI` are now in `_habs`.
  - The count is still 9.
  - A tested repair is given in R09.
- **R09 (stale claims):** not repaired, all seven items. R10.
- **R10 (C₄ Check):** not repaired. R11.
- **R11 (conflicting pull requests):** not repaired. R12.
- **R12 (shape):** not repaired. R13.

## Verified sound

**Gate and build.**
- The worker's gate on this head reports `statement-hygiene=9`, `depcheck=1` and `build=6`, and FAIL; every other count is 0.
- Nothing outside the folder changed: `git diff --stat origin/main...HEAD` lists only `README.md` and `Suggested.lean`.
- `lake env lean` on `Suggested.lean` exits 0 with 54 `sorry` warnings and no other message.

**Dependency check** (`--movable`), run by me:

```text
UPWARD: ClassFieldTheory (on main) -> RamificationOfCompleteDiscretelyValuedFields (#2) at README lines [164, 1533, 2419]
depcheck: 238 roadmaps, 2354 edges, 1 problem(s)
```

This is not a false positive: it is a true sequencing constraint (R02). There is no cycle; I read #1410's README lines 88, 99–108 and 1027.

**Elaborated signatures.** I compared the 146 elaborated types in `signatures.md` against the README. The 8 flagged declarations (`kummerEquiv_unit`, `brRes`, `brCor`, `localFormation`, `brInfl`, `restrictAbsolute`, `iota_restrictAbsolute_apply`, `absoluteGaloisGroupExtend`) drop only local-field instances. Their bodies (`Suggested.lean:745–749`, `1290–1299`, `1330–1333`) are Galois-theoretic or cohomological and use none of them, so nothing changes. `closure_map_artinMap_unitFiltration` keeps every binder it needs.

**One-tactic probes.** These were run in a scratch file importing this head's module plus the Tau Ceti modules named, elaborated with `lake env lean`, exit 0. Each probe is `example : type_of% @<name> := by intro …; exact …`.

| Probe | Declaration | Closed by |
|---|---|---|
| P1 | `ClassFormation.tateIso_cor` | `TauCeti.ClassFieldTheory.ClassFormation.tateIso_cor cf T r x` |
| P2 | `ClassFormation.normSubgroup_maximalAbelianLayer` | `TauCeti.ClassFieldTheory.ClassFormation.normSubgroup_maximalAbelianLayer cf V` |
| P3 | `map_unitFiltration_norm_eq_of_upper_eq_bot` | `TauCeti.map_normUnits_unitFiltration_psiNat_eq_of_upperRamificationGroup_eq_bot hr` |
| P4 | `card_ideleClassNormQuotient` | `TauCeti.ClassFieldTheory.card_ideleClassNormQuotient K L` |
| P5 | `gal_ringClassField_equiv_pic` | `⟨(TauCeti.ClassFieldTheory.ringClassArtinEquiv O).symm⟩` |
| P6 | `subsingleton_h3_unitsRep` | `TauCeti.ClassFieldTheory.subsingleton_h3_unitsRep K` |
| P7 | `artinMap_norm` | `TauCeti.ClassFieldTheory.artinMap_norm L (iota := iota) x τ hτ` |

The other `sorry`'d theorems outside Layer 7 are the text of `71f458c`, whose 31 probes closed the same way. Open at the pin, by contrast: `map_unitFiltration_normResidue`, `sup_norm_unitFiltration_eq_of_upper_eq_top` and `closure_map_artinMap_unitFiltration`.

**Other scratch elaborations.**
- QuadraticFormInvariants with the two imports of R01: exit 0.
- The IntegralLattices names: `ringClassArtinMap` is unknown; `hilbertProductFormula`, `ringClassField`, `gal_ringClassField_equiv_pic`, `finiteHilbertSupport`, `finiteHilbertInvariantAt` and `infiniteHilbertInvariantAt` resolve.
- The principal ideal theorem statement of R05: exit 0.
- The `letI`-free `closure_map_artinMap_unitFiltration'` of R09: exit 0, definitionally the same statement.

**Library declarations opened at the pin.** File and line are given in the findings. In addition:
- `TauCeti.finiteIntermediateFieldValuativeRel`, `…Topology`, `…_valuativeExtension` and `…_isNonarchimedeanLocalField` (`FiniteExtension/IntermediateField.lean:69,75,81,97`);
- `hilbertClassField` (`ClassFields/RayClassField.lean:241`) and `ringClassArtinEquiv` (`ClassFields/RingClass/Field.lean:178`);
- `tateIso_res` (`Naturality.lean:145`) and `tateIso_cor` (`:164`);
- `artinMap_norm` (`Local/ArtinMap.lean:345`);
- the Tau Ceti Hilbert definitions (`Invariant.lean:93,143,371`);
- the §5.8 suite, all present: `artinMap_trivialLayer` (`Formation/TrivialLayer.lean:149`), `localNormSubgroup_top` (`LocalExistence/NormSubgroup.lean:199`), `localArtinMap_uniformizer` (`Local/Unramified.lean:342`), `localArtinMap_quadratic_eq_nontrivial_iff_not_norm` (`Local/Quadratic.lean:57`), `globalArtinMap_Qi_prime` (`Global/Cyclotomic/Gaussian.lean:45`), `globalArtinMap_cyclotomic_prime` (`Cyclotomic/Prime.lean:42`) and `not_isAdmissibleModulus_one_Qi` (`AdmissibleModulus/Basic.lean:239`);
- the other §5 names, present: `localArtinMap_unit_of_unramified` (`Unramified.lean:389`), `localArtinMap_Q2_zeta5` (`Local/Cyclotomic.lean:205`), `localArtinMap_cyclotomic_uniformizer` (`:166`), `isGenerator_artinMap_iff` (`Formation/ArtinMap.lean:230`), `natCard_normQuotient` (`ClassFormation.lean:303`) and `primeIdeleClass` (`Global/LocalArtin/Frobenius.lean:87`).

**Cross-roadmap citations resolved.**
- RamificationOfCompleteDiscretelyValuedFields §4a.1 at #1410's head (README line 696; `Suggested.lean:181`, `202`, `220`). `absoluteUpperRamificationGroup_zero` there concludes equality with Mathlib's `ValuationSubring.inertiaSubgroup`; the agreement with Tau Ceti's `inertiaSubgroup` is that section's fourth bullet, as row 164 says.
- #617's LocalFieldsRamification layers (R07).
- #1474's §4.2 (R06).
- The 7 leads in `citations.md` are roadmap-level names on main:
  - `card_powerClasses_mixed` and `localLogarithm`: `Completed/LocalFieldsRamification/README.md` (line 451 for the first);
  - `cd_p_le_of_isClosed`, `cd_p_le_scd_p` and `corestriction_comp_res`: `TauCetiRoadmap/ProfiniteCohomology/README.md`;
  - `longExact_exact`: ProfiniteCohomology and `Completed/ProfiniteProPGroups`;
  - `cd_p_eq_of_isProPSylow`: `Completed/ProfiniteProPGroups/README.md`.
- `TauCetiRoadmap/RepresentationTheory/ModularInduction/README.md` exists on main.
- No declaration of this file reuses the fully qualified name of another roadmap's declaration. The absolute group is now a bound variable, not `TauCetiRoadmap.ClassFieldTheory.absoluteUpperRamificationGroup`.

**Sources checked at their locators** (cached texts):
- `milne-cft` II Theorem 3.11, p. 84 (line 3911). Hypotheses (a) and (b) for every subgroup. §2.4's third hypothesis, that `res_H(u)` generates, follows from them through cor∘res = (G:H), as Milne's proof notes (line 3919), so §2.4 states a correct, slightly redundant form.
- `milne-cft` VII Example 8.2, p. 221 (line 10059). The local symbols are [sign a] at ∞, [p^s] at p ∤ m, and [u⁻¹] at ℓ | m, as Layer 7 step 1 defines them.
- `kopp-lagarias` Theorem 1.1 (line 128): any order and any level datum (O; m, Σ), as Layer 13 cites.
- `serre1961` n° 3.1, after Proposition 3 (lines 931–938): the upper filtration of an infinite extension by passage to the limit. This is cited by #1410 §4a.1 and no longer by this README.

**Adversarial table.** Rows cover the sampled §§2.1–2.7 and §§5.1–5.8, the headlines, and every target a finding touches.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §2.1 layer `Γ = U/V`, ground level `A^U/N(A^V)` | G = Ẑ, A = ℤ trivial, U = nẐ ⊇ V = mnẐ; V = U | Γ = ℤ/m, N = ·m, quotient ℤ/m = Γ^ab; at V = U: Γ = 1, quotient 0 | sound | none |
| §2.2 axiom 4 | unramified layer of degree 6, intermediate E of degree 2 | inv u = 1/6; inv_E(res u) = 2·(1/6) = 1/3, of order 3 = [L:E] | sound | none |
| §2.3 res, cor, infl | [U:V] = 6, [U':V] = 2, [U:U'] = 3; infl with [U:V] = 2, [V:V'] = 3 | res: 3·(1/6) = 1/2 = inv u_{U',V}; cor: 1/2 = 3·(1/6); infl: 1/2 = 3·(1/6); the reversed index [U':U] = 1/3 is not an integer | sound | none |
| §2.4 Tate hypotheses | C₂ on ℂˣ by conjugation; C₂ trivially on ℤ/2 | ℂˣ: H¹ = 0, #H² = #ℝˣ/ℝ>0 = 2 = #Ĥ⁻²(C₂,ℤ); ℤ/2: H¹ = ℤ/2 ≠ 0, so `_h1` excludes it | sound | none |
| §2.5 `artinEquiv = nakayamaNegTwo.symm` | ℚ₂(ζ₅), Art(2) | ζ₅ ↦ ζ₅²; the inverse direction gives ζ₅³, since 2⁻¹ ≡ 3 mod 5 | sound | none |
| §2.6 χ_cyc(Art u) = N(u)⁻¹ | ℚ₂, u = −3 on μ₁₆; u = −1 on μ₄ | (−3)⁻¹ ≡ 13⁻¹ ≡ 5 mod 16, against 13 without the inverse; −1 ∉ N(ℚ₂(i)) since (−1,−1)₂ = −1, so i ↦ −i | sound | none |
| §2.7 Ĥ⁰ has no naive inflation | G = C₄ ⊇ H = C₂, A = ℤ trivial | N_{G/H}(A^H) = 2ℤ ⊄ N_G A = 4ℤ, so ℤ/2 → ℤ/4, x ↦ x is undefined; the natural map is ℤ/4 → ℤ/2 | sound | none |
| §5.1 trivial layer | U/U | A^U/N = 0 and (U/U)^ab = 1 | sound | none |
| §5.2 cyclic layer | Γ = C_n | #Ĥ⁰ = #Ĥ⁻² = n = [U:V]; a generator corresponds to a generator under the isomorphism | sound | none |
| §5.3 unramified | ℚ₂(ζ₅), ord₅ 2 = 4; ℚ₂ with m = 2 | Kˣ/N ≅ ℤ/4 with 2 ↦ 1, Art(2): ζ₅ ↦ ζ₅²; the excluded formula gives (−1)² = 1 ≠ −1 | sound, but one name is missing | R10 |
| §5.4 local quadratic | ℚ₂(i), a = −1; L = K(√d,√e); the zero pairing | (−1,−1)₂ = −1 ⇔ Art(−1) = τ; L of degree 4 is excluded by [L:K] = 2; the zero pairing gives 0 ≠ 1 | sound | none |
| §5.4 global quadratic | ℚ(i), ℓ = 3, 5; ℚ(√5), ℓ = 11, 7 | i³ = −i, 5 splits; 11 ≡ 1 gives 1, 7 ≡ 2 gives τ | sound, but two names are missing | R10 |
| §5.5 cyclotomic | ℚ(ζ₅), ℓ = 2, 3, 11; ℚ(ζ₈), ℓ = 3, 5, 7 | ζ₅², ζ₅³, ζ₅; ζ₈³, ζ₈⁵, ζ₈⁷; conductors 4, 8, 5 | sound | none |
| §5.6 C₄ transfer | C₄ ⊇ C₂; V₄ ⊇ C₂ | C₄: V(g) = g², ker V = ker q; V₄: V ≡ 1, q ≠ 1 | false for C₄ | R11 |
| §5.6 ℚ(√5) ⊂ ℚ(ζ₅) | ℓ = 11, 7 | 11 ≡ 1 is a square mod 5, so trivial; 7 ≡ 2 is not, so nontrivial | sound | none |
| §5.7 Hasse norm counterexample | ℚ(√13,√17) | (17/13) = (4/13) = 1, (13/17) = 1; 2 is inert in ℚ(√13) (13 ≡ 5 mod 8) and splits in ℚ(√17); every decomposition group is cyclic and G = V₄ | sound | none |
| §5.7 cubic Pic | ℚ(ζ₇ + ζ₇⁻¹), d = 49 | Minkowski bound (3!/3³)·7 = 14/9 < 2, so h = 1 | sound | none |
| §5.8 suite | the seven names | all at the pin (listed above) | sound | none |
| `map_unitFiltration_normResidue` | ℚ₂(√2) at n = 2, 3; F_p((t)) with y^p − y = t⁻¹ at n = 1, 2; ℚ_p(ζ_p) at n = 0, 1 | v_L(2√2) = 3, so the lower break is 2 and so is the upper; images G, 1 against G², G³; (5,2)₂ = (−1)³ = −1, so 5 ∉ N; break 1: G, 1; tame: G, 1 | sound | none |
| `closure_map_artinMap_unitFiltration` | ℚ_p at n = 0; ℚ₂(ζ₈) at n = 0..3; `_habs` | Art(ℤ_pˣ) is compact and equals the image of I_K; lower groups G₀ = G₁ = G, G₂ = G₃ = {1,5}, G₄ = 1 give upper images G, G, {1,5}, 1, matching #1410's Check; `_habs` is an iff, so it fixes the subgroup and is satisfiable | sound | R02, R09 |
| `conductorExponent_eq_sInf…` | unramified; ℚ₅(ζ₅); ℚ₂(√2); ℚ₂(ζ₈) | 0, 1, 3, 3 on both sides | sound, but a pinned corollary | R04 |
| `map_unitFiltration_norm_eq_of_upper_eq_bot` | ℚ₂(∛2, ζ₃), e = 3, f = 2 | G¹ = 1 and ψ(1) = 3, so N(U_L^(3)) = U^(1) by Tau Ceti; the target excludes this extension | narrower than the pin | R04 |
| `sup_norm_unitFiltration_eq_of_upper_eq_top` | ℚ₂(√2), r = 2 | N(1+√2) = −1 ∉ 1 + 4ℤ₂, so ℤ₂ˣ = N(U_L)·U^(2) | sound | none |
| `hilbertProductFormula` | ℚ with (3,7), (−1,−1), (5,5) | (3,7) at ∞, 3, 7, 2: 0 + 0 + 1 + 1 = 0; (−1,−1): 1 + 1 = 0; (5,5): support {2,5} here, ∅ in Tau Ceti, every value 0 | sound, but duplicate definitions | R03 |
| `cyclicHasseNorm` | ℚ(i)/ℚ, x = 3 and x = 5 | 3 is no sum of two squares, and v₃(3) is odd in the unramified ℚ₃(i), so both sides are false; 5 = N(2+i), so both are true | sound, but at the pin | R08 |
| `card_ideleClassNormQuotient` | ℚ(i)/ℚ; L = K | 2 = 2; 1 = 1; probe P4 closes it | sound, but at the pin | R08 |
| `gal_ringClassField_equiv_pic` | maximal order of ℚ(√3) | Pic = 1, ring class field K; narrow h = 2 does not enter; probe P5 closes it | sound, but `Nonempty` | R03, R09 |
| principal ideal theorem (absent) | K = ℚ; ℚ(√−5) with I = (2, 1+√−5) | ℚ: H = ℚ; I² = (2) and 2 = −i(1+i)² in H = K(i), so I𝒪_H = (1+i); the statement elaborates | statable, absent | R05 |
| `localSymbol_kummerClass_mul` | ℚ₂, n = 2 | `IsUnit (2 : ℤ₂)` is false, so the case is excluded; `IsUnit (2 : ℚ₂)` is true | narrower than the pin | R08 |
| `eulerCharacteristic_mixed` | ℚ_p (p odd) with ℤ/p; ℚ₂ with ℤ/2 | p² = p·1·p, since dim ℚ_pˣ/p = 2; 8 = 2·2·2, since #ℚ₂ˣ/(ℚ₂ˣ)² = 8 | sound, but at the pin | R08 |
| Layer 8 conductor Checks | ℚ₂ with U^(1)·⟨2⟩; ℚ_p(ζ_p) with U^(1)·⟨p⟩ | U^(0) = U^(1) = ℤ₂ˣ, so the subgroup is ℚ₂ˣ, the trivial extension with conductor 0; N(1 − ζ_p) = Φ_p(1) = p, N(U_L) = U^(1), index p − 1, conductor 1 | sound | none |
| Layer 14 quadratic reciprocity Check | p = 3, q = 7 | (7/3) = 1, (3/7) = −1, (−1)^{(2·6)/4} = −1 | sound | none |
| Layer 13 Checks | maximal order of ℚ(√3); ℤ + f𝒪_K in a cubic field | fundamental unit 2 + √3 has norm 1, so narrow h = 2 while Pic = 1; index f² ≠ f | sound | none |
| `kummerClass` junk values | n = 0; n = p in characteristic p | value 0, so `kummerClass_mul` and `localSymbol_antisymm` hold trivially | sound | none |
| depcheck edge | #1410 citing ClassFieldTheory | only consumer mentions (lines 88, 1027), so no cycle | upward, not cyclic | R02 |
| consumers of this module | QuadraticFormInvariants; IntegralLattices line 419 | 6 build errors, fixed by two imports (exit 0); unknown `ringClassArtinMap` | build fails | R01 |

**Ownership against open work.**
- By object, over main, the board packages and the open heads given, I searched for the absolute upper filtration, unit-filtration reciprocity, ring class fields and the Hilbert invariants.
- The overlaps found are #1410 (now settled), #1474 (R06), #617 (R07, R12) and #1215 (R12).
- Ownership against the open pull requests whose files the brief did not provide was not checked.

## Not verifiable

- **The texts behind the sampled §2.4 locators.**
  - J. Tate, Ann. of Math. 56 (1952), and T. Nakayama, Ann. of Math. 65 (1957); the README flags the latter as unverified at line 397. Both are on JSTOR, behind a paywall; there is no open copy in Numdam, EuDML or GDZ, and neither is in the manifest. Milne II 3.11 confirms the statement of Tate's theorem.
  - Artin–Tate, Preliminaries §2 Theorem A and XIV §4 Theorem 1: waived, cited by locator.
- **Artin–Tate elsewhere.** XIV §1 (§2.1), the IIIa–IIId axioms (§2.2), the four diagrams (§5.6), and XIII §4 for the principal ideal theorem (flagged at line 2082). All waived.
- **Serre, *Local Fields*.** IV §4 (§5.3) and XV §2, V §§3 and 6, IV §3 Prop 14 (Layer 7). Springer, behind a paywall, and not in the manifest.
- **Other texts not in the manifest, with no legal copy located:** Serre, *Galois Cohomology*; Neukirch, Schmidt and Wingberg; Milne, *Arithmetic Duality Theorems*; Brown; Rim 1959; Lang, *Algebra*; Cox; Tate, Corvallis; Weil 1951.
- **Neukirch, *ANT*:** uncertified, cited by locator only.

## Source issues

- none
