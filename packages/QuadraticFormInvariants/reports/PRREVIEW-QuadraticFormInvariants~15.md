# Review of QuadraticFormInvariants (pull request #1215 at 1abcd32)

**Verdict:** needs changes

This is an incremental re-review. The folder `TauCetiRoadmap/QuadraticFormInvariants/` is byte-identical to `edbf5e9`: 0 changed lines. Since then the pull request has changed only `ClassFieldTheory`, `GlobalQuadraticForms` and `Completed/LocalGaloisGroups/Suggested.lean`.

- The consumer build now passes, so the previous R04 is repaired.
- The other fifteen previous findings are not repaired and are carried below as R01–R15. Each says which previous number it was. Line numbers are unchanged because the folder is unchanged.
- R16 is new: an edit outside the folders this pull request owns.

## R01 (P1) — `squareClass_finite` lost its local-field binders and is false

Carried from the previous R01, not repaired.

**Location.** `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:975`: "instance squareClass_finite [Invertible (2 : K)] : Finite (Kˣ ⧸ Subgroup.square Kˣ) := sorry". The local-field binders are on the section `variable` line 909, which the instance does not keep.

**Claim.** The README (Layer 6A) states finiteness of `Kˣ/(Kˣ)²` for a nonarchimedean local field. The instance's type mentions no local-field class, so those binders are dropped.

**Witness.** At this head, `#check @TauCetiRoadmap.QuadraticFormInvariants.squareClass_finite` prints `∀ (K : Type u_1) [Field K] [Invertible 2], Finite (Kˣ ⧸ Subgroup.square Kˣ)`. This is false at `K = ℚ`: the classes of distinct primes are distinct.

**Repair.** Delete the instance; the README keeps the statement. If a Lean form is wanted, write a `theorem` with `[ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]` in its own signature. At `K = ℚ` that hypothesis fails, so the corrected statement no longer applies there.

## R02 (P1) — The completion audit's outstanding square is proved at the pin

Carried from the previous R02, not repaired.

**Location.** `README.md:35`: "Audit status: incomplete. This roadmap remains active." Also `README.md:85–95`, "Stage 2 still requires the full Brauer/cohomology naturality square for every Brauer class", and the stage programme at 798–830.

**Claim.** The README says the upward-`ULift` naturality square for `brauerExplicitH2Equiv` is open.

**Witness.** At the pinned Tau Ceti (`2fd255d`), `TauCeti.brauerExplicitH2Equiv_uliftEquiv` (`Algebra/CrossedProduct/BaseChange/ULift.lean:205`) is that square for every `x : BrauerGroup K`. Its continuous form is `brauerCohomologyEquiv_uliftEquiv` (`:228`).

**Repair.**
- Delete `## Completion audit` (33–150) and the stage programme (798–830). Both are also process narrative: dates, TauCeti pull-request numbers and "now available".
- Cite the two theorems under scope and ownership.
- Re-derive "Remaining comparisons and computations" (839–899) against the pin.

## R03 (P1) — Data with a `sorry` body, and theorems about it that cannot be proved

Carried from the previous R03, not repaired. The gate reports `sorry-data=9`.

**Location.** `Suggested.lean`:
- `cliffordHomI2` (826) and `cliffordHomI2Bar` (868);
- `squareClass_finite` (975);
- `kummerSquareClassEquiv` (1573) and `resHUnits` (1623);
- `cocycleOfSplitting` (1839) and `TwoCocycle.comap` (1866);
- `brauerCohomologyEquiv` (2324) and `brauer2EquivH2` (2329).

**Claim.** Each body is an opaque `sorryAx` term. Theorems about them, such as `brauerCohomologyEquiv_crossedProductClass` (2340) and `brauer2EquivH2_quaternionClass` (2400), can therefore only be closed by `sorry`.

**Witness.** Each has a real Tau Ceti definition at the pin:
- `TauCeti.brauerCohomologyEquiv` (`Algebra/CrossedProduct/Comparison.lean:274`);
- `brauer2EquivH2` (`TwoTorsion.lean:152`);
- `cliffordHomI2` and `cliffordHomI2Bar` (`Witt/Clifford.lean:142, 187`);
- `kummerSquareClassEquiv` (`MuTwo/Basic.lean:668`);
- `cocycleOfSplitting` (`Splitting/Basic.lean:321`);
- `TwoCocycle.comap` (`CrossedProduct/Basic.lean:201`);
- `galoisResUnits` (`UnitsRestriction.lean:62`).

**Repair.**
- Delete the nine declarations and every theorem that mentions them.
- Cite the Tau Ceti names in the supplier contracts.
- QFI's own `TwoCocycle`, `CrossedProduct`, `crossedProductClass`, `GaloisCocycle`, `h2MuToUnits` and `Br2` have Tau Ceti counterparts. Delete them with the theorems about them.

## R04 (P2) — The bridges restate, more narrowly, theorems Tau Ceti already proves

Carried from the previous R05, not repaired.

**Location.** `Suggested.lean`:
- `cup_kummerClass_eq_zero_iff_hilbertSymbol` (2458);
- `hilbertSign` (2466);
- `localSymbol_eq_zero_iff_cup` (2503);
- `hilbertSymbol_eq_cohomological` (2520);
- `hilbertSymbol_productFormula` (2548).

`README.md:2649`: "This sublayer is the canonical owner of the Kummer-cup/norm-equation criterion"; also 1998, "The Hilbert symbol is this roadmap's, in both halves".

**Claim.** QFI claims to own these comparisons and states them over a local field.

**Witness.** At this head, `#check @…hilbertSymbol_eq_cohomological` still carries `[IsNonarchimedeanLocalField F]`. The pinned `TauCeti.hilbertSymbol_eq_cohomological` and `localSymbol_eq_zero_iff_cup` (`MuTwo/LocalSymbol.lean:191, 157`) need only `Invertible 2`. The pin also has `hilbertSymbol_productFormula` (`Global/ProductFormula.lean:67`) and `cup_kummerClass_eq_zero_iff` (`CupNorm.lean:103`).

**Repair.**
- Delete the five declarations.
- Cite the Tau Ceti names with their files, at their field-general generality.
- Rewrite the ownership sentences at 26–31, 1998 and 2649 to say that Tau Ceti owns these results.
- The consumer changes go in `GlobalQuadraticForms`, which at this head names the bridges only in prose (`README.md:130, 375, 460–462, 522–525`; `Suggested.lean:315`). Repoint those to the Tau Ceti names. `GlobalQuadraticForms/Suggested.lean:69–72, 267, 466–505` uses only `hilbertSymbol`, `hilbertSymbol_mul`, `hilbertSymbol_neg_self`, `exists_hilbertSymbol_eq_neg_one` and `localHasse`, so it needs no change.

## R05 (P3) — `Suggested.lean` is an API catalogue that restates Tau Ceti

Carried from the previous R06, not repaired.

**Location.** The whole file: 335 declarations. The module docstring (39–102) neither lists the headline theorems nor says which ones are statable.

**Witness.** Several declarations close in one step from a library lemma:
- `hilbertSymbol_comm` by `exact TauCeti.hilbertSymbol_comm _ _`;
- `hilbertSymbol_mul` by `exact TauCeti.hilbertSymbol_mul_right …`.

Others restate pinned declarations:
- `hilbertSymbol_padicTwo` (1400) restates `TauCeti.hilbertSymbol_padicTwo` (`PadicTwo.lean:180`);
- `relativeStiefelWhitney_quadraticExtension` (3761) restates `TauCeti.sw2Class_formClass_traceTransfer_smul_sq` (`QuadraticExtension.lean:249`).

**Repair.** Delete every declaration that restates or wraps a pinned declaration. Keep three things:
- a module docstring that lists the headline theorems, each with the Tau Ceti declaration that proves it;
- `#check` lines that pin those declarations;
- the `export` aliases that consumers import.

The README keeps every statement as a target or Check.

## R06 (P3) — Two other open pull requests change this roadmap, and no order is stated

Carried from the previous R07, not repaired.

**Location.** The pull request description. It names neither #1797 nor #1187, and no comment on the pull request states an order.

**Witness.** Both are still open. #1797 (head `9864ff4`) conflicts with this pull request in `QuadraticFormInvariants/README.md` and `Suggested.lean`. #1187 (head `66ed0d4`) conflicts in `Suggested.lean`. Source: `roadmaps overlaps`.

**Repair.** State the order in the description. Either merge #1797 first and rebase this folder's edits onto it, or drop them from this pull request. Do not repeat what #1797 already changes.

## R07 (P3) — Imports of other roadmaps' modules

Carried from the previous R08, not repaired.

**Location.** `Suggested.lean:2`, `import TauCetiRoadmap.ProfiniteCohomology.Suggested`, and `:3`, `import Completed.LocalFieldsRamification.Suggested`. The gate reports `imports=1`.

**Witness.** README 656–664 and 724–735 say that both roadmaps re-export Tau Ceti declarations as abbreviations.

**Repair.** Import the `TauCeti.*` modules those abbreviations point to, and use the Tau Ceti names.

## R08 (P3) — Ten `example`s are admitted with `sorry`

Carried from the previous R09, not repaired.

**Location.** `Suggested.lean:1415, 1420, 1425, 1438, 1443, 2744, 2756, 2784, 2792, 3799`. The gate reports `sorry-examples=10`.

**Witness.** Two of them are pinned theorems: 1415 is `TauCeti.hilbertSymbol_neg_one_neg_one_padicTwo` (`PadicTwo.lean:145`), and 1425 is `TauCeti.hilbertSymbol_two_five_padicTwo` (`:163`).

**Repair.** Delete all ten; they remain README Checks. For 1415 and 1425, the README cites the two Tau Ceti theorems.

## R09 (P3) — The README cites two Pfister roundness theorems that do not exist

Carried from the previous R10, not repaired.

**Location.** `README.md:1427–1428`: `TauCeti.oneFoldPfister_smul_equivalent_of_mem_unitValueSet` and `TauCeti.twoFoldPfister_smul_equivalent_of_mem_unitValueSet`.

**Witness.** Neither name is in the pinned Tau Ceti. At this head, `#check @TauCeti.oneFoldPfister_smul_equivalent_iff` elaborates to an `iff` over any `CommRing R`, with `c : Rˣ` (`Witt/Round.lean:44`; the two-fold form is at `:61`).

**Repair.** Cite `TauCeti.oneFoldPfister_smul_equivalent_iff` and `TauCeti.twoFoldPfister_smul_equivalent_iff` with their file.

## R10 (P3) — Supplier names are written as if they were this roadmap's own

Carried from the previous R11, not repaired. The gate reports `readme-ids-missing=11`.

**Repair.** Qualify each name with its owner:
- 90: `TauCeti.brauerCohomologyEquiv_baseChange`;
- 385: `TauCeti.RegularFormClass.discr_baseChange`;
- 528: `IntermediateField.finrank_adjoin_simple_eq_two_of_sq_mem_notMem`;
- 541: `TauCeti.Algebra.discr_one_elem_eq_of_sq_algebraMap` (it is in `FieldTheory/Trace.lean:78`);
- 677 and 1663: `TauCetiRoadmap.LocalFieldsRamification.map_norm_unitFiltration_zero`;
- 782: `TauCeti.hilbertSymbol_mul_right`;
- 786: `TauCeti.sw1Class_traceTransfer_mk_rankOne`;
- 1196: `QuaternionAlgebra.map_ker_reₗ_of_algEquiv`;
- 1288–1289: `TauCeti.RegularFormClass.signedDiscr_add`, `…signedDiscr_mk_rankOne_mul` and `…signedDiscr_mul`.

## R11 (P3) — Some Tau Ceti local objects this roadmap uses are not universe polymorphic

Carried from the previous R12, not repaired.

**Location.** `README.md:718–719`: "Tau Ceti's local objects are universe polymorphic, so both local bridges are stated for `F : Type u`". Also 6E milestone 2 (2265–2268) and the 6C cyclic-index route (1993).

**Witness.** Several are stated for `F : Type` only:
- `tateDualityPairing_perfect_mixed` (`Local/Duality/Perfect.lean:280`);
- `h2MuEquivZMod_mixed` (`Brauer/RootsOfUnity.lean:145`, under `variable (F : Type)` at :68);
- `index_normGroup_of_isCyclic` (`Brauer/LocalH2Bound.lean:70`, under `variable (K L : Type)` at :55).

This head's `Completed/LocalGaloisGroups/Suggested.lean:307–310` says the same of `h2MuEquivZMod_mixed`.

**Repair.**
- Limit the sentence to `muNRep`, `kummerClass`, `kummerCupPairing` and `localSymbol`.
- State 6E milestone 2 and the cyclic-index route for `K : Type`.

## R12 (P3) — The conductor summary in 6C item 11 drops "d odd, 0 < d < 2e"

Carried from the previous R13, not repaired.

**Location.** `README.md:2112–2113`: "`U(K, 2e−d+1) ⊆ N(K(√a)ˣ)` and `U(K, 2e−d) ⊄ N(K(√a)ˣ)` for a unit `a` of defect exponent `d`".

**Witness.** Take `K = ℚ₂` and `a = 5`. Then `d = 2 = 2e`, and `ℚ₂(√5)/ℚ₂` is unramified. So every unit is a norm and `U(ℚ₂, 0) ⊆ N`, which contradicts the second half.

**Repair.** Write "for a unit `a` whose defect exponent `d` is odd with `0 < d < 2e`", as 6B case 3 (1941–1948) does.

## R13 (P3) — House-style violations in 6C, and a pull-request reference

Carried from the previous R14, not repaired.

**Location.**
- `README.md:1991–1995` ("6C alternative early norm-index construction"):
  - Lean names without backticks: `TauCeti.index_normGroup_of_isCyclic`, `TauCeti.algebraicExtensionValuativeRel`;
  - missing spaces: "The full6B defect", "classical6D", "do6E/7B";
  - process wording: "already proved".
- `README.md:785`: "generalized by TauCeti#22016".

**Repair.** Rewrite the block in house prose, with every name in backticks and a space before each number. Delete the TauCeti pull-request reference.

## R14 (P3) — The TeX scanner fails on 14 lines

Carried from the previous R15, not repaired. The gate reports `tex=14`.

**Location.** `README.md:594`, plus 13 hits at 1283, 1285, 1525, 1847, 1865, 1875, 2083, 2383, 2978, 2979 and 3119. Line 594 reads "A ≃ₐ[K] M_{finrank K A}(K)`".

**Witness.** The code span on 593–594 is broken across the line, so `M_{finrank K A}` falls outside it. The other 13 hits are inside fenced `text` blocks. I believe these are scanner false positives, but the gate still fails on them.

**Repair.**
- Join 593–594 into one code span.
- In the fences, write `^(mn)`, `^(n(n−1)/2)`, `_(L/K)` and similar in place of brace groups.

## R15 (P3) — Stray file `NativeCompletion.md`

Carried from the previous R16, not repaired. The gate reports `stray-files=1`.

**Location.** `TauCetiRoadmap/QuadraticFormInvariants/NativeCompletion.md`, linked from README 112, 113, 118, 119 and 124.

**Repair.** Delete the file and the links; the sources are the README's references. Cite the Tau Ceti declarations instead.

## R16 (P3) — An edit outside the folders this pull request owns

New at this head.

**Location.** `Completed/LocalGaloisGroups/Suggested.lean` (62 insertions, 50 deletions since `edbf5e9`). The gate reports `outside-folder: Completed/LocalGaloisGroups/Suggested.lean`.

**Claim.** The pull request's own folders are `ClassFieldTheory`, `GlobalQuadraticForms` and this one. The description does not mention `LocalGaloisGroups`, so the gate fails on the edit.

**Witness.** The edit migrates `LocalGaloisGroups` from the deleted `TauCetiRoadmap.ClassFieldTheory` names, such as `kummerEquiv_mixed` and `h2FpEquivZMod_of_mu`, to Tau Ceti's names. At this head `lake env lean` on the file exits 0 with no error.

**Repair.** Choose one:
- Name the migration of `Completed/LocalGaloisGroups/Suggested.lean` in the pull request description, so that the file is reviewed as this pull request's own.
- Keep the `TauCetiRoadmap.ClassFieldTheory` names it uses, so that it needs no edit.

The edit itself is correct (see the table below).

## Previous findings

- R01 — not repaired: `Suggested.lean:975` "instance squareClass_finite [Invertible (2 : K)] : Finite (Kˣ ⧸ Subgroup.square Kˣ) := sorry", still elaborating without local-field binders.
- R02 — not repaired: `README.md:35` "Audit status: incomplete. This roadmap remains active." and 85 "Stage 2 still requires the full Brauer/cohomology naturality square".
- R03 — not repaired: the gate reports `sorry-data=9`, with lines 826, 868, 975, 1573, 1623, 1839, 1866, 2324 and 2329 unchanged.
- R04 — repaired: `GlobalQuadraticForms/Suggested.lean:61–68, 77, 82–99` now cite `TauCeti.ClassFieldTheory.cyclicHasseNorm`, `TauCeti.GlobalNumberFields.IsFiniteLocalNorm` and the other names directly. The gate's targeted build reports `build=0`, and the repair introduces nothing this folder depends on.
- R05 — not repaired: `Suggested.lean:2520` `hilbertSymbol_eq_cohomological` with `[IsNonarchimedeanLocalField F]`; `README.md:2649` "This sublayer is the canonical owner of the Kummer-cup/norm-equation criterion".
- R06 — not repaired: 335 declarations; the module docstring (39–102) has no headline list.
- R07 — not repaired: the description names neither #1797 nor #1187; both are open and conflicting.
- R08 — not repaired: `Suggested.lean:2–3` import `TauCetiRoadmap.ProfiniteCohomology.Suggested` and `Completed.LocalFieldsRamification.Suggested`.
- R09 — not repaired: the gate reports `sorry-examples=10` at the same ten lines.
- R10 — not repaired: `README.md:1427–1428` `TauCeti.oneFoldPfister_smul_equivalent_of_mem_unitValueSet`, `…twoFold…`.
- R11 — not repaired: the gate reports `readme-ids-missing=11`, the same eleven names.
- R12 — not repaired: `README.md:718–719` "Tau Ceti's local objects are universe polymorphic, so both local bridges are stated for `F : Type u`".
- R13 — not repaired: `README.md:2112–2113` "for a unit `a` of defect exponent `d`".
- R14 — not repaired: `README.md:1991–1995`, unbackticked names and "The full6B defect"; 785 "generalized by TauCeti#22016".
- R15 — not repaired: the gate reports `tex=14`, the same lines.
- R16 — not repaired: `NativeCompletion.md` is still present (`stray-files=1`).

## Verified sound

**Gate.** This head's gate (`gate.md`) fails on `tex=14`, `sorry-data=9`, `sorry-examples=10`, `imports=1`, `readme-ids-missing=11`, `stray-files=1` and `outside-folder=1`. Every failure is one of R03, R07, R08, R10, R14, R15 or R16. `build=0`, `depcheck=0`, `statement-hygiene=0`, `set_option=0`. Re-running it here (without the targeted build) gives the same counts. It lists `outside-folder` 5 because that run did not know the pull request's own folders.

**Depcheck.** `depcheck: 239 roadmaps, 2363 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 in 56 s with 136 `sorry` warnings and no other message, the same as at `edbf5e9`. A scratch `#check @` file reconfirms R01, R04 and R09 at this head. The pins are unchanged: `lake-manifest.json` is not in the diff, and Tau Ceti is at `2fd255d`. So every pinned citation of the previous review still holds. I reopened 13 of those declarations at the pin, listed in R02–R04 and R08–R09.

**The supplier changes this folder depends on.**
- This folder's `Suggested.lean` imports no `TauCetiRoadmap.ClassFieldTheory` module.
- The README cites the class-field-theory roadmap's Layer 5 (local pairing) and Layer 14 (Hilbert reciprocity). At this head they are the headings at `ClassFieldTheory/README.md:836` (local coefficients, the Brauer group, the local invariant and duality; it names `localSymbol` and `kummerCupPairing`) and `:1565` (Hilbert reciprocity; it names `finiteHilbertInvariantAt` and `hilbertProductFormula`). Both citations resolve.
- The `ClassFieldTheory` diff since `edbf5e9` touches only the cyclotomic normalization `cyclotomicCharacter_artinMap` (Layer 7) and the `LocalGaloisGroups` and `GlobalQuadraticForms` consumer paragraphs. Its paragraph on this roadmap is unchanged.
- The `GlobalQuadraticForms` diff touches only class-field and idele names. It still consumes QFI's `hilbertSymbol`, `hilbertSymbol_mul`, `hilbertSymbol_neg_self`, `exists_hilbertSymbol_eq_neg_one`, `localHasse`, `formClass` and `discr` (`Suggested.lean:69–72, 267, 373, 466–505`). All of them are still declared here.

**Seeded sample.** The folder is unchanged, so no sampled passage is a changed passage. I rechecked each one against the changed suppliers and the pin.
- "Audit status: incomplete" (README 35): still false at the pin (R02).
- "From the local-fields-ramification roadmap" (653): the supplier is unchanged by this head, and the previous review resolved its 33 declarations.
- "From Tau Ceti's class field theory" (680): all 22 names in the table resolve in `TauCeti/NumberTheory/ClassFieldTheory/` at the pin. Some examples:
  - `GalRep` and `muNRep` at `MuNRep.lean:130, 137`;
  - `h2MuEquivZMod` at `Brauer/RootsOfUnity.lean:89`, with hypothesis `IsUnit (n : F)`;
  - `h2EquivZModOfMuNRepIso` at `:156`;
  - `kummerClass` at `MuNRep.lean:283`;
  - `kummerCupPairing` and `kummerCupPairing_bil` at `Local/Symbol.lean:207, 257`;
  - `localSymbol` at `:320`;
  - `tateDualityPairing_perfect_mixed` at `Local/Duality/Perfect.lean:280`, for `F : Type`;
  - `finiteHilbertInvariantAt`, `infiniteHilbertInvariantAt` and `finiteHilbertSupport` at `Global/Hilbert/Invariant.lean:93, 143, 371`;
  - `hilbertProductFormula` at `Global/Hilbert/Reciprocity.lean:65`.
  
  `TauCeti.absoluteGaloisGroupRestrictEquiv` is at `FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:340`.
- "From the profinite-cohomology roadmap" (723): the supplier is unchanged by this head.
- "The Hilbert symbol is this roadmap's, in both halves" (1998) and "This sublayer is the canonical owner…" (2649): Tau Ceti owns both at the pin (R04).
- "Compatibility with the cup product" (2283): sound, as the previous review found; the native step is `TauCeti.brauer2EquivH2_quaternionClass` (`CupProduct.lean:362`).

**The outside-folder file (R16), checked as in a full review.**
- `lake env lean` on `Completed/LocalGaloisGroups/Suggested.lean` exits 0 with 104 `sorry` and linter warnings and no error.
- Every Tau Ceti name its changed docstrings cite exists at the pin:
  - `localCyclotomicCharacter_artinMap_unit` (`Local/ExplicitCyclotomicSymbol/ArtinMap.lean:311`, with `[ValuativeExtension ℚ_[p] F]` at 313, as the docstring says);
  - `localCyclotomicCharacter_artinMap_padic_uniformizer` (`Local/Cyclotomic.lean:364`);
  - `absoluteGaloisGroupExtend` (`AbsoluteGaloisGroup/FiniteExtension.lean:252`);
  - `muNRep_ρ_apply_eq_self` (`MuNRep.lean:189`);
  - `kummerEquivOfCharZero` (`:358`);
  - `TauCeti.TateCohomology.primaryComponent_tateCohomology_eq_bot` (`TateCohomology/PrimaryComponent.lean:81`).

**Ownership against open pull requests.**
- `overlaps.md` lists no dropped ids and no revision-only ids.
- The two pull requests that change this roadmap are covered by R06.
- Closest in vocabulary:
  - QuadraticFormInvariantsPartII (#1834): disjoint, as the previous review found.
  - OrthogonalSpinGroups (#1181): its scope defers square classes, `hilbertSymbol`, `localHasse` and local classification to this roadmap and keeps the spinor norm. This README never mentions the spinor norm, so neither claims the other's objects.
  - ProfiniteCohomology (#616, #1187): a supplier, cited and not restated.

**Remark on untouched text (no change asked).** `ClassFieldTheory/README.md:183–186` still says that `QuadraticFormInvariants` proves the agreement with `localSymbol`. That is the ownership R04 moves to Tau Ceti, and the class-field-theory review covers it.

**Headline theorems.** These are unchanged from the previous report's table. Each headline is a pinned Tau Ceti declaration:
- the four-fold splitting criterion;
- the local classification and realization;
- Kahn's formula in degrees 1 and 2;
- `Br ≅ H²` and `Br[2] ≅ H²(μ₂)`;
- the cup–norm theorem;
- the cohomological comparison;
- the product formula;
- the `ℚ₂` formula;
- the `ULift` square.

**Adversarial table.** Rows marked "r14" are carried from the previous report for statements this head leaves untouched. Rows marked "new" were computed here.

| Statement | Instance | Values on each side | Result | Change |
|---|---|---|---|---|
| `squareClass_finite` (975), new | `#check @` at this head; `K = ℚ` | The type is `∀ K [Field K] [Invertible 2], Finite (Kˣ ⧸ square)`. At ℚ the classes `[2], [3], [5], …` are pairwise distinct, so the quotient is infinite. | false | R01 |
| `hilbertSymbol_eq_cohomological` (2520), r14 | `ℚ₂`, `a = b = −1`; `ℚ₃`, `a = b = −1` | `ℚ₂`: `ε(7)² = 1`, so the symbol is `−1`; `H²` has 2 elements and the cup is nonzero, so `hilbertSign 1 = −1`. `ℚ₃`: units, so `+1` on both sides. | true | R04: no local hypothesis needed |
| `hilbertSymbol_productFormula` (2548), r14 | `ℚ`, `a = b = −1` | Invariants `1` at 2 and `1` at ∞, sum `0` in `ZMod 2`. Signs `(−1)(−1) = 1`. | true but restated | R04 |
| ℚ₂ Gram matrix (2118–2131), r14 | basis `−1, 2, 5` | `(−1,−1) = −1`; `(2,5) = −1` since `ω(5) = 1`; the other four entries are `+1`. The determinant is `≡ 1 mod 2`. | matches | none |
| `serreEps`, `serreOmega` (1381–1389), r14 | `u = 1, 3, 5, 7` | `ε = 0,1,0,1`; `ω = 0,1,1,0`. | matches | R05: duplicate |
| Odd-residue formula (2083), r14 | `ℚ₃`, `a = b = 3` | Formula `(−1)^1 = −1`. Directly, `3 = x² − 3y²` forces `y² ≡ −1 mod 3`, which has no solution, so `−1`. | matches | none |
| Anisotropic quaternary form (6D), r14 | `⟨1,1,1,1⟩` over `ℚ₂` | `d = 1` and `s = +1`, but `(−1,−1) = −1`. | anisotropic, matches | none |
| `(dim, d, s)` over `ℝ` (2235), r14 | `±⟨1,1,1,1⟩` | Both have `d = 1` and `s = +1`; the signatures are `4` and `−4`. | incomplete, as stated | none |
| Realization exceptions (2191), r14 | `n = 2`, `d = [−1]` | `⟨a,−a⟩` gives `s = +1` only. | matches | none |
| Discriminant formulas (1283–1285), r14 | `⟨a⟩`, `⟨b⟩` | `d±⟨a,b⟩ = −ab = (−1)^1·a·b`. | matches | R14 is notation only |
| 6B conductor, case 3 (1947), r14 | `ℚ₂`, `a = −1`, `d = 1` | `v(disc ℚ₂(i)) = 2 = 2e−d+1`; `U(2) ⊆ N`; 3 is not a norm. | matches | none |
| 6C item 11 (2112), r14 | `ℚ₂`, `a = 5`, `d = 2` | The claim gives `U(ℚ₂,0) ⊄ N`, but every unit is a norm (unramified). | false | R12 |
| Defect counterexample (1975), r14 | `−1, 5, −5` over `ℚ₂` | `𝔡(−5) = 2ℤ₂ ≠ 8ℤ₂ = 𝔡(−1)𝔡(5)`. | matches | none |
| `galoisEvens2_kummerClass` (3692), r14 | `ℝ ⊂ ℂ`; `ℚ₂(i)`, `a = 1+2i` | `ℂ`: `0 = 0`. `ℚ₂`: `Tr = 2`, `N = 5`, so the value is `(2)∪(5) ≠ 0`. | consistent | none |
| `relativeStiefelWhitney_quadraticExtension` (3761), r14 | `ℝ ⊂ ℂ` | `Tr_*⟨a⟩ ≅ ⟨1,−1⟩`; `w₁`: `(−1) = (−1)`; `w₂`: `0 = 0`. | true | R05: native |
| 6E milestone 2 (2265), r14 | `K : Type 1` | `h2MuEquivZMod_mixed` needs `F : Type`. | ill-typed | R11 |
| QFI's citation of class-field-theory Layers 5 and 14 (680–681), new | the class-field-theory README at this head | Layer 5 at :836 names `localSymbol`; Layer 14 at :1565 names `hilbertProductFormula`. | resolves | none |
| LGG `localCyclotomicCharacter_artinMap_padic` (outside the folder), new | `F = ℚ_p`, `u = 1+p` | In the arithmetic normalization, `Art(u)` acts on `μ_{p^∞}` by `ζ ↦ ζ^(u⁻¹)`, so `χ = (1+p)⁻¹`. The right-hand side is `u⁻¹ = (1+p)⁻¹`. The geometric normalization would give `1+p` and is excluded. | true | none |
| LGG `…_padic_uniformizer` (outside the folder), new | `F = ℚ_p`, `x = p` | `N(1 − ζ_{p^n}) = Φ_{p^n}(1) = p`, so `Art(p)` fixes `ℚ_p(μ_{p^∞})` and `χ = 1`. The statement says `1`. | true | none |
| LGG `nonempty_cohomFp_two_addEquiv_of_mu` after `omit [FinitePadicExtension F p]` (outside the folder), new | `F = 𝔽₄((t))`, `p = 3`; `F = 𝔽₂((t))`, `p = 2` | `𝔽₄((t))`: `H²(G_F, 𝔽₃) ≅ Br(F)[3] ≅ ℤ/3`, true without the omitted hypothesis. `𝔽₂((t))`: `x² − 1 = (x−1)²`, so there is no primitive square root of 1 and `hζ` excludes the case. The proof is closed and elaborates. | true | none |
| LGG Kummer example (outside the folder), new | `F = ℚ₂`, `n = 2` | `H¹(G, μ₂) ≅ ℚ₂ˣ/(ℚ₂ˣ)²`, of order 8. The count `p·#μ_p·#𝓀^(v(p)) = 2·2·2 = 8`. | matches | none |

**Binder audit.** The folder is unchanged and the pins are unchanged, so the previous audit of 285 `#check @` lines stands: only `squareClass_finite` lost binders. I reconfirmed it at this head (first row).

**Gaps.** None declared.

## Not verifiable

- serre1973cia, omeara1963, serre1979lf and scharlau1985 are recorded as uncertified, so no text was available. Their formulas were checked by computation (the table above, carried from the previous report).
- Lam (2005), Gille–Szamuely (2017) and Grove (2002) are not in the manifest. No sampled passage changed at this head, so nothing new depends on them. The claims that cite them were checked against the pinned Tau Ceti instead.

## Source issues

- none
