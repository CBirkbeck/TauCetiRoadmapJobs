# Review of QuadraticFormInvariants (pull request #1215 at edbf5e9)

**Verdict:** needs changes

This is a full review of the folder at this head. The pull request edits only the class-field-theory bridge in both files. R04, R05 and R07 bear on those edits. The other findings were already on main, but the gate and this review hold the whole folder to them.

## R01 (P1) — `squareClass_finite` lost its local-field binders and is false

**Location.** `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:975`: "instance squareClass_finite [Invertible (2 : K)] : Finite (Kˣ ⧸ Subgroup.square Kˣ) := sorry", inside `section LocalField`, whose `variable` line (909) carries the local-field hypotheses.

**Claim.** The README (Layer 6A) states finiteness of `Kˣ/(Kˣ)²` for a nonarchimedean local field. An `instance` keeps only the section variables its type mentions. The type mentions none of `ValuativeRel`, `TopologicalSpace` or `IsNonarchimedeanLocalField`, so those binders are dropped.

**Witness.** `#check @squareClass_finite` elaborates to `∀ (K : Type u_1) [Field K] [Invertible 2], Finite (Kˣ ⧸ Subgroup.square Kˣ)`. At `K = ℚ` this is false: for distinct primes `p, q`, `p/q` is not a square, so the prime classes are pairwise distinct.

**Repair.** Delete the instance. The statement stays in the README. If a local finiteness fact is wanted in Lean, it is a `theorem` with `[ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]` in its own signature. It follows from `TauCeti.finite_multiplicativeSquareClassGroup_iff` (`FieldTheory/SquareClassGroup/Multiplicative.lean:132`) together with the supplier's power-class count. At `K = ℚ` the hypothesis `IsNonarchimedeanLocalField ℚ` fails, so the corrected statement no longer applies.

## R02 (P1) — The completion audit's outstanding square is proved at the pin

**Location.** `README.md:35` "Audit status: incomplete. This roadmap remains active."; `README.md:85–95` "Stage 2 still requires the full Brauer/cohomology naturality square … The roadmap remains active until the full square is proved"; the three-stage programme at `README.md:798–830`.

**Claim.** The README says the upward-`ULift` naturality square for `brauerExplicitH2Equiv` is not proved, and that it is the reason the roadmap stays active.

**Witness.** Pinned Tau Ceti `2fd255d`: `TauCeti.brauerExplicitH2Equiv_uliftEquiv` (`Algebra/CrossedProduct/BaseChange/ULift.lean:205`) is exactly the displayed equation, with `e = ULift.ringEquiv.symm`, for every `x : BrauerGroup K`. `brauerCohomologyEquiv_uliftEquiv` (`:228`) is its continuous form.

**Repair.**
- Delete `## Completion audit (2026-10-28)` (lines 33–150) and the stage programme (798–830). These are also process narrative: dates, TauCeti#22016/#22020/#22022, commit hashes, "now available", "do not yet".
- Under scope and ownership, cite the two theorems above as Tau Ceti's.
- Every other headline is also at the pin (table under Verified sound). The README's "Remaining comparisons and computations" (839–899) must be re-derived against the pin, and anything that is now native moves to the supplier contracts.

## R03 (P1) — Data with a `sorry` body, and theorems about it that cannot be proved

**Location.** Gate `sorry-data`, `Suggested.lean`:
- `cliffordHomI2` (826) and `cliffordHomI2Bar` (868);
- `squareClass_finite` (975, see R01);
- `kummerSquareClassEquiv` (1573) and `resHUnits` (1623);
- `cocycleOfSplitting` (1839) and `TwoCocycle.comap` (1866, its `isCocycle`);
- `brauerCohomologyEquiv` (2324) and `brauer2EquivH2` (2329).

**Claim.** A `sorry` body is an opaque `sorryAx` term. Theorems that characterise it can only be closed by `sorry`, so the file can never pass as an acceptance test. Examples: `brauerCohomologyEquiv_crossedProductClass` (2340), `brauerCohomologyEquiv_unique` (2358), `brauer2EquivH2_quaternionClass` (2400), `cliffordHomI2_pfisterClass` (834) and `kummerSquareClassEquiv_kummerClass` (1580).

**Witness.** Tau Ceti defines each of these with a real body:

| QFI copy | Tau Ceti declaration | File and line |
|---|---|---|
| `brauerCohomologyEquiv` | `TauCeti.brauerCohomologyEquiv`, with `brauerCohomologyEquiv_crossedProductClass` proved | `Algebra/CrossedProduct/Comparison.lean:274` |
| `brauer2EquivH2` | `TauCeti.brauer2EquivH2` | `TwoTorsion.lean:152` |
| `cliffordHomI2`, `cliffordHomI2Bar` | `TauCeti.cliffordHomI2`, `cliffordHomI2Bar` | `LinearAlgebra/QuadraticForm/Witt/Clifford.lean:142`, `:187` |
| `kummerSquareClassEquiv` | `TauCeti.kummerSquareClassEquiv` | `FieldTheory/GaloisCohomology/MuTwo/Basic.lean:668` |
| `cocycleOfSplitting` | `TauCeti.cocycleOfSplitting` | `Algebra/CrossedProduct/Splitting/Basic.lean:321` |
| `TwoCocycle.comap` | `TauCeti.TwoCocycle.comap`, with the cocycle identity proved | `Algebra/CrossedProduct/Basic.lean:201` |
| `resHUnits` | `TauCeti.galoisResUnits` | `FieldTheory/GaloisCohomology/UnitsRestriction.lean:62` |

**Repair.**
- Delete the nine declarations and every theorem that mentions them.
- Cite the Tau Ceti names above in the supplier contracts.
- QFI's own `TwoCocycle`, `CrossedProduct`, `crossedProductClass`, `GaloisCocycle`, `h2MuToUnits` and `Br2` have Tau Ceti counterparts too (`TauCeti.TwoCocycle`, `BrauerGroup.crossedProductClass`, `TauCeti.h2MuToUnits` at `MuTwo/BrauerTorsion.lean:62`, `twoTorsion`). Delete them with the theorems about them.

## R04 (P1) — The targeted build fails

**Location.** Gate `build` (16 lines). `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean:55–62, 71, 77–78, 87–93`.

**Claim.** The gate builds this module together with its consumer `GlobalQuadraticForms`, and that build fails.

**Witness.** Running `lake env lean` on QFI's `Suggested.lean` exits 0 with only 136 `sorry` warnings. The failure is in the consumer: "GlobalQuadraticForms/Suggested.lean:55:7: Unknown identifier `TauCetiRoadmap.ClassFieldTheory.cyclicHasseNorm`". The same holds for `isGlobalNorm_iff_isLocalNormEverywhere`, `hilbertProductFormula`, `card_ideleClassNormQuotient` and the other names this pull request deletes from `ClassFieldTheory/Suggested.lean`.

**Repair.** The cause is the class-field-theory change in this pull request, not this folder. Either keep those `TauCetiRoadmap.ClassFieldTheory` names, or repoint `GlobalQuadraticForms/Suggested.lean:20–27, 55–93` to the native names. Then rerun the gate. No acceptance is possible while the gate fails.

## R05 (P2) — The rewritten bridges restate, more narrowly, theorems Tau Ceti already proves

**Location.** `Suggested.lean`:
- `localSymbol_eq_zero_iff_cup` (2503) and `hilbertSymbol_eq_cohomological` (2520), both with `[IsNonarchimedeanLocalField F]`;
- `hilbertSymbol_productFormula` (2548);
- `hilbertSign` (2466);
- `cup_kummerClass_eq_zero_iff_hilbertSymbol` (2458), which also carries local-field hypotheses.

`README.md:26–31, 696–721, 1998–2009, 2649–2654`: "This sublayer is the canonical owner of the Kummer-cup/norm-equation criterion".

**Claim.** The README says QFI owns these comparisons and proves them over a local field. Its export `hilbertSymbol_productFormula` never mentions the norm-equation symbol at any place.

**Witness.**
- `TauCeti.hilbertSymbol_eq_cohomological` and `TauCeti.localSymbol_eq_zero_iff_cup` (`FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean:191, 157`) hold for every field with `Invertible 2`, with no local hypothesis.
- `TauCeti.hilbertSymbol_productFormula` (`NumberTheory/QuadraticForm/Global/ProductFormula.lean:67`) multiplies the norm-equation symbols over the places.
- `TauCeti.cup_kummerClass_eq_zero_iff` (`MuTwo/CupNorm.lean:103`) is the cup–norm theorem.
- Probes (scratch copy, elaborated): QFI's `hilbertSymbol_eq_cohomological` closes from the Tau Ceti theorem plus `hilbertSign x = TauCeti.hilbertSign x` (by `decide`). QFI's product formula closes from `TauCeti.ClassFieldTheory.hilbertProductFormula` with `TauCeti.hilbertSign_sum` and `hilbertSign_add`.

**Repair.**
- Delete the five declarations above from `Suggested.lean`. Where a consumer imports a QFI name (`GlobalQuadraticForms/Suggested.lean:63–66, 309`), add it to the existing `export TauCeti (…)` line instead.
- In the README, cite `TauCeti.hilbertSymbol_eq_cohomological`, `TauCeti.localSymbol_eq_zero_iff_cup`, `TauCeti.hilbertSymbol_productFormula`, `TauCeti.hilbertSign` (`Data/ZMod/IntUnitsPower.lean:62`) and `TauCeti.cup_kummerClass_eq_zero_iff_hilbertSymbol_eq_one` (`CupNorm.lean:132`) with their files, at their field-general generality.
- Rewrite the ownership sentences at 26–31, 1998 and 2649 to say that Tau Ceti owns these results.

## R06 (P3) — `Suggested.lean` is an API catalogue that restates Tau Ceti

**Location.** Whole file: 335 declarations (188 theorems, 102 definitions, 41 examples). The module docstring (lines 39–102) has no list of headline theorems and does not say what is or is not statable.

**Claim.** The file should hold the headline theorems only. Here every headline is already a pinned Tau Ceti theorem (table under Verified sound), and most of the other declarations restate or wrap Tau Ceti.

**Witness.** One-tactic probes on a scratch copy, all elaborated without error:
- `hilbertSymbol_comm`: `exact TauCeti.hilbertSymbol_comm _ _`;
- `hilbertSymbol_congr_sq`: `exact TauCeti.hilbertSymbol_congr_sq …`;
- `hilbertSymbol_neg_self`: `exact TauCeti.hilbertSymbol_neg_self _`;
- `hilbertSymbol_mul`: `exact TauCeti.hilbertSymbol_mul_right …`;
- `hilbertSymbol_unramified`: `simp only [hilbertSymbol, TauCeti.hilbertSymbol_def, hu b]`, matching `TauCeti.hilbertSymbol_unramified` at `UnramifiedClass.lean:263`.

The four-fold criterion example (406–421) is `:= TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae a b`. `hilbertSymbol_padicTwo` (1400) and `serreEps`/`serreOmega` (1381–1389) restate `TauCeti.hilbertSymbol_padicTwo` (`LocalField/QuadraticForm/PadicTwo.lean:180`) and `Padics/SerreSigns.lean:72, 77`. `relativeStiefelWhitney_quadraticExtension` (3761) restates `TauCeti.sw2Class_formClass_traceTransfer_smul_sq` (`StiefelWhitney/QuadraticExtension.lean:249`) on copied carriers.

**Repair.** Delete from `Suggested.lean` every declaration that restates or wraps a pinned declaration. Keep three things:
- the module docstring, listing the headline theorems and naming the Tau Ceti declaration that proves each;
- `#check` lines that pin those declarations;
- the `export` aliases that consumers import.

The README keeps every statement as a target or Check.

## R07 (P3) — Two other open pull requests change this roadmap, and no order is stated

**Location.** The pull request description names neither one.

**Witness.**
- #1797 rewrites `QuadraticFormInvariants/Suggested.lean` to Tau Ceti aliases. Its head imports `TauCeti.FieldTheory.GaloisCohomology.MuTwo.LocalSymbol` and `…Global.ProductFormula` and does not import `TauCetiRoadmap.ClassFieldTheory.Suggested`. It conflicts with this pull request in both files of this folder.
- #1187 conflicts in `Suggested.lean`.

**Repair.** State the order. #1797 removes the import that forces this pull request's edits here. So merge #1797 first and drop this folder's edits from this pull request, or rebase them onto #1797's head. Do not repeat what #1797 already changes.

## R08 (P3) — Imports of other roadmaps' modules

**Location.** Gate `imports`: `Suggested.lean:2` `import TauCetiRoadmap.ProfiniteCohomology.Suggested` and `:3` `import Completed.LocalFieldsRamification.Suggested`.

**Claim.** `Suggested.lean` may import only `Mathlib` and individual `TauCeti.*` modules.

**Witness.** `README.md:656–664` and `724–735` say that both roadmaps re-export Tau Ceti declarations under their own names, as abbreviations.

**Repair.** Import the `TauCeti.*` modules those abbreviations point to (listed in those README paragraphs) and use the Tau Ceti names. After R03 and R06, few remain.

## R09 (P3) — Ten `example`s are admitted with `sorry`

**Location.** Gate `sorry-examples`: `Suggested.lean:1415, 1420, 1425, 1438, 1443, 2744, 2756, 2784, 2792, 3799`.

**Claim.** An admitted `example` is never written in `Suggested.lean`.

**Witness.** Two of them are pinned theorems:
- 1415 is `TauCeti.hilbertSymbol_neg_one_neg_one_padicTwo` (`PadicTwo.lean:145`);
- 1425 is `TauCeti.hilbertSymbol_two_five_padicTwo` (`:163`).

**Repair.** Delete all ten. They remain README Checks. For 1415 and 1425, the README can cite the two Tau Ceti theorems.

## R10 (P3) — The README cites two Pfister roundness theorems that do not exist

**Location.** `README.md:1427–1428`: `TauCeti.oneFoldPfister_smul_equivalent_of_mem_unitValueSet` and `TauCeti.twoFoldPfister_smul_equivalent_of_mem_unitValueSet`.

**Witness.** Neither name occurs at the pinned Tau Ceti. `LinearAlgebra/QuadraticForm/Witt/Round.lean:44, 61` has `TauCeti.oneFoldPfister_smul_equivalent_iff` and `twoFoldPfister_smul_equivalent_iff`. They are `iff` statements over any commutative ring, with parameters that need not be units.

**Repair.** Cite those two names and their file.

## R11 (P3) — Supplier names are written as if they were this roadmap's own

**Location.** Gate `readme-ids-missing` (11 names).

**Repair.** Qualify each name with its owner:

| Line | Name to write |
|---|---|
| 90 | `TauCeti.brauerCohomologyEquiv_baseChange` |
| 385 | `TauCeti.RegularFormClass.discr_baseChange` |
| 528 | `IntermediateField.finrank_adjoin_simple_eq_two_of_sq_mem_notMem` |
| 541 | `TauCeti.Algebra.discr_one_elem_eq_of_sq_algebraMap` (it is in `FieldTheory/Trace.lean:78`, not `EffectiveBounds/TraceForm.lean`) |
| 677, 1663 | `TauCetiRoadmap.LocalFieldsRamification.map_norm_unitFiltration_zero` |
| 782 | `TauCeti.hilbertSymbol_mul_right` |
| 786 | `TauCeti.sw1Class_traceTransfer_mk_rankOne` |
| 1196 | `QuaternionAlgebra.map_ker_reₗ_of_algEquiv` |
| 1288–1289 | `TauCeti.RegularFormClass.signedDiscr_add`, `…signedDiscr_mk_rankOne_mul`, `…signedDiscr_mul` |

## R12 (P3) — Some Tau Ceti local objects this roadmap uses are not universe polymorphic

**Location.** `README.md:718–719`: "Tau Ceti's local objects are universe polymorphic, so both local bridges are stated for `F : Type u`"; 6E milestone 2 (2265–2268); the 6C cyclic-index route (1993).

**Witness.** Each of these is stated for `Type` only:
- `TauCeti.ClassFieldTheory.h2MuEquivZMod` and `h2MuEquivZMod_mixed` (`Brauer/RootsOfUnity.lean:68`, `variable (F : Type)`);
- `invMap` (`Brauer/Invariant.lean:98`);
- `tateDualityPairing_perfect_mixed` (`Local/Duality/Perfect.lean:280`);
- `TauCeti.index_normGroup_of_isCyclic` (`Brauer/LocalH2Bound.lean:55`).

**Repair.**
- Limit the sentence to `muNRep`, `kummerClass`, `kummerCupPairing` and `localSymbol`.
- State 6E milestone 2 and the cyclic-index route for `K : Type`.

## R13 (P3) — The summary of the conductor in 6C item 11 drops "d odd, 0 < d < 2e"

**Location.** `README.md:2111–2113`: "`U(K, 2e−d+1) ⊆ N(K(√a)ˣ)` and `U(K, 2e−d) ⊄ N(K(√a)ˣ)` for a unit `a` of defect exponent `d`".

**Witness.** Take `K = ℚ₂`, `a = 5`. Then `d = 2 = 2e`, and `ℚ₂(√5)/ℚ₂` is unramified, so every unit of `ℤ₂` is a norm. That makes `U(ℚ₂, 0) ⊆ N`, contradicting the second half of the claim. 6B case 3 (1941–1948) carries the right hypothesis.

**Repair.** Write "for a unit `a` whose defect exponent `d` is odd with `0 < d < 2e`".

## R14 (P3) — House-style violations in 6C and a pull-request reference

**Location.**
- `README.md:1991–1995` (the "6C alternative early norm-index construction" block): Lean names without backticks (`TauCeti.algebraicExtensionValuativeRel`, `TauCeti.index_normGroup_of_isCyclic`, `QuadraticAlgebra.det_toLinearMap_eq_norm`); missing spaces ("Layer2", "precede6D without6E/7B", "of6B", "Layer0/3's", "classical6D"); process wording ("already proved", "selected native supplier").
- `README.md:785`: "generalized by TauCeti#22016".

**Repair.** Rewrite the block in house prose, with every name in backticks and a space before each number. Delete the reference to TauCeti#22016.

## R15 (P3) — The TeX scanner fails on 14 lines

**Location.** Gate `tex`: README lines 594, 1283, 1285, 1525 (two hits), 1847 (two hits), 1865, 1875, 2083, 2383, 2978, 2979, 3119.

**Witness.**
- Line 594 is prose. The code span on lines 593–594 is broken across the line, so `M_{finrank K A}` is read outside it.
- The other 13 hits are inside fenced `text` blocks. The rule exempts code blocks, so I believe these are false positives of the scanner. The gate still fails on them.

**Repair.**
- Join lines 593–594 into one code span.
- In the fenced blocks, write `^(mn)`, `^(n(n−1)/2)`, `_(L/K)`, `^(v_K(b))` and similar in place of brace groups.

## R16 (P3) — Stray file `NativeCompletion.md`

**Location.** Gate `stray-files`. The README links the file at lines 112, 113, 118, 119 and 126.

**Repair.** Delete the file and those links. Cite the Tau Ceti declarations instead. The README's references are the sources.

## Verified sound

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0. It prints 136 `sorry` warnings and no other message. There is no `set_option`: this pull request removed the 51 lines that main had.

**Binder audit.** I wrote `#check @name` for 285 declarations in one scratch file and elaborated it once. One declaration lost binders: `squareClass_finite` (R01). `dyadicLevel`, `IsUniformizer`, `quadraticDefect` and `defectExponent` keep their local-field binders.

**Depcheck.** `depcheck: 239 roadmaps, 2362 edges, 0 problem(s)`. All five cross-roadmap links resolve: `Completed/LocalFieldsRamification`, `Completed/Multiquadratic`, `ClassFieldTheory`, `ProfiniteCohomology` and `RepresentationTheory/SemisimpleAlgebras`.

**Seeded sample.**
- "From the local-fields-ramification roadmap": all 33 declarations resolve in `Completed/LocalFieldsRamification/Suggested.lean`.
- "From Tau Ceti's class field theory": all 23 names resolve at the pin. Spot checks: `h2MuEquivZMod` at `Brauer/RootsOfUnity.lean:89`, with hypothesis `IsUnit (n : F)` and normalisation `k/n ↦ k` (`toRatAddCircle_h2MuEquivZMod`); `localSymbol` at `Local/Symbol.lean:320`, defined as the cup product followed by `tr`; `hilbertProductFormula` at `Global/Hilbert/Reciprocity.lean:65`, for `K : Type`. The class-field-theory README at this head has Layer 5 (local invariant and duality) at line 829 and Layer 14 (Hilbert reciprocity) at line 1550, as cited.
- "From the profinite-cohomology roadmap": every contract name resolves in `ProfiniteCohomology/Suggested.lean`.
- "Audit status": false at the pin (R02).
- "The Hilbert symbol is this roadmap's" and "canonical owner": both are owned by Tau Ceti at the pin (R05).
- "Compatibility with the cup product": the step `ι[(a,b)] = (a)∪(b)`, followed by `ε[(a,b)] = (a,b)_K`, is sound. Its natives are `TauCeti.brauer2EquivH2_quaternionClass` (`CupProduct.lean:362`) and the binary case of milestone 1.

**Headline theorems, each a pinned Tau Ceti declaration.**

| Headline | Tau Ceti declaration | File and line |
|---|---|---|
| Four-fold splitting criterion | `TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae` | `Algebra/Quaternion/SplittingCriterion.lean:156` |
| Local classification by `(dim, d, s)` | `TauCeti.RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq` | `NumberTheory/LocalField/QuadraticForm/Classification.lean:132` |
| Realization | `exists_of_realization` | `Realization.lean:113` |
| Kahn's formula in degree 1 | `TauCeti.sw1Class_traceTransfer_mk_rankOne` | `StiefelWhitney/Transfer.lean:137` |
| Kahn's formula in degree 2 | `TauCeti.sw2Class_formClass_traceTransfer_smul_sq` | `StiefelWhitney/QuadraticExtension.lean:249` |
| `Br` compared with `H²` | `TauCeti.brauerCohomologyEquiv` | `Comparison.lean:274` |
| `Br(K)[2]` compared with `H²(G_K, μ₂)` | `brauer2EquivH2` | `TwoTorsion.lean:152` |
| Cup–norm theorem | `TauCeti.cup_kummerClass_eq_zero_iff` | `MuTwo/CupNorm.lean:103` |
| Comparison with the cohomological symbol | `TauCeti.hilbertSymbol_eq_cohomological` | `MuTwo/LocalSymbol.lean:191` |
| Product formula | `TauCeti.hilbertSymbol_productFormula` | `Global/ProductFormula.lean:67` |
| `ℚ₂` formula | `TauCeti.hilbertSymbol_padicTwo` | `PadicTwo.lean:180` |
| `ULift` square | `TauCeti.brauerExplicitH2Equiv_uliftEquiv` | `BaseChange/ULift.lean:205` |

**Source.** In kahn1984, Lemme II.2.1 is at lines 763–765 (printed p. 241) and Prop. II.3.5 at lines 1044–1058. Both match README 2978–2979, 3119 and `Suggested.lean:3692, 3761`, including the basis `(1, √d/a)` (line 782) and `(2,2) = (2,−1) = 0` (line 769).

**Adversarial pass.** Each row gives the instance and the values computed on each side.

| Statement | Instance | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `hilbertSymbol_eq_cohomological` (2520) | `ℚ₂`, `a = b = −1`; `ℚ₃`, `a = b = −1` | `ℚ₂`: `ε(7)ε(7) = 1`, so the symbol is `−1`. `H²(G_ℚ₂, μ₂)` has 2 elements, so every `tr` is the unique isomorphism, the cup is nonzero, and `hilbertSign 1 = −1`. `ℚ₃`: both arguments are units, so `+1` on both sides. | true | R05: no local hypothesis needed |
| `hilbertSymbol_productFormula` (2548) | `ℚ`, `a = b = −1` | Invariants: `1` at 2 and `1` at ∞, sum `0` in `ZMod 2`. Signs: `(−1)(−1) = 1`. The probe closes it from `hilbertProductFormula`. | true but weak | R05 |
| ℚ₂ Gram matrix (2118–2131) | basis `−1, 2, 5` | `(−1,−1)`: `ε(7)² = 1` → `−1`. `(−1,2)`: `ω(7) = 0` → `+1`. `(−1,5)`: `0` → `+1`. `(2,2)`: `0` → `+1`. `(2,5)`: `ω(5) = 1` → `−1`. `(5,5)`: `0` → `+1`. Determinant ≡ 1 mod 2. | matches | none |
| `serreEps`, `serreOmega` (1381–1389) | `u = 1, 3, 5, 7` | `(u−1)/2 = 0,1,2,3`, so `ε = 0,1,0,1`. `(u²−1)/8 = 0,1,3,6`, so `ω = 0,1,1,0`. | matches | R06: duplicate |
| Odd-residue formula (2083) | `ℚ₃`, `a = b = 3` | Formula: `(−1)^(1·1·1) = −1`. Direct: `3 = x² − 3y²` forces `x = 3x'`, then `3x'² − y² = 1`, then `y² ≡ −1 mod 3`, which has no solution, so `−1`. | matches | none |
| Rank-4 isotropy and the anisotropic quaternary form (6D) | `⟨1,1,1,1⟩` over `ℚ₂` | `d = 1`, `s = (+1)^6 = +1`, `(−1,−1) = −1`. Neither condition holds, so the form is anisotropic. | matches | none |
| `(dim, d, s)` is incomplete over `ℝ` (2235) | `±⟨1,1,1,1⟩` | Both have `d = 1` and `s = (−1)^6 = +1`. Signatures are 4 and −4. | matches | none |
| Realization exceptions (2191) | `n = 2`, `d = [−1]` | The form is `⟨a,−a⟩`, so `s = +1` and `−1` is never realized. For `n = 1`, the empty product gives `+1`. | matches | none |
| Discriminant formulas (1283–1285) | `q = ⟨a⟩`, `r = ⟨b⟩` | `d±⟨a,b⟩ = −ab`; RHS `(−1)^1·a·b = −ab`. Tensor: `(−1)^0 ab = ab`. The general exponent identity is `(m+n)(m+n−1)/2 = m(m−1)/2 + n(n−1)/2 + mn`. | matches | none |
| 6B conductor, case 3 (1947) | general `d` odd `< 2e`; `ℚ₂`, `a = −1` | `w = (√a−x)/π^((d−1)/2)` is Eisenstein, with `v(disc) = 2e−d+1`. For `ℚ₂(i)`: `v(−4) = 2`, `U(2) ⊆ N`, and 3 is not a norm. | matches | none |
| 6C item 11 (2112) | `ℚ₂`, `a = 5`, `d = 2e = 2` | Claimed `U(ℚ₂,0) ⊄ N`; actually every unit is a norm (unramified). | false | R13 |
| Defect counterexample (1975) | `−1`, `5`, `−5` over `ℚ₂` | `3 − x² ≡ 2 mod 8`, so `𝔡(−5) = 2ℤ₂ ≠ 8ℤ₂ = 𝔡(−1)𝔡(5)`. | matches | none |
| Ramified-base control (1927) | `π² = 2`, `a = 5` | `(π+½)² − 5·¼ = 2 + π − 1 = 1 + π`, a unit. | matches | none |
| `galoisEvens2_kummerClass` (3692) | `ℝ ⊂ ℂ`; `ℚ₂(i)`, `a = 1+2i` | `ℂ`: LHS `N(0) = 0`; RHS `(2p)∪(p²+q²) + (2)∪(−1) = 0`. `ℚ₂`: `Tr = 2`, `N = 5`, so `(2)∪(5) + 0 ≠ 0`. With `a = c ∈ K`: `(2)∪(−1) + (c)∪(−d) = (c)∪(−d)`, which equals `c∪c + χ∪c` from the supplier. | consistent | none |
| `relativeStiefelWhitney_quadraticExtension` (3761) | `ℝ ⊂ ℂ`, any `a` | `Tr_*⟨a⟩` has Gram determinant `−4|a|² < 0`, so it is `⟨1,−1⟩`. `w₁`: `(−1) = (−1) + (N a) = (−1)`. `w₂`: `0 = 0 + 0 + 0`. | true | R06: native |
| `Tr_*⟨1⟩ ≅ ⟨2, 2d⟩` (Layer 9) | basis `1, √d` | `Tr 1 = 2`, `Tr d = 2d`, `Tr √d = 0`. | matches | none |
| `squareClass_finite` (975) | `K = ℚ` | The elaborated type applies to ℚ, but there are infinitely many prime classes. | false | R01 |
| `brauerCohomologyEquiv_crossedProductClass` (2340) | any `K` | The LHS is a `sorryAx` term with no equations. | unprovable | R03 |
| 6E milestone 2 (2265) | `K : Type 1` | `h2MuEquivZMod` needs `Type`. | ill-typed | R12 |

**Checks I found correct.** `(5,5)_ℚ₂ = +1`, witnessed by `5 = 25 − 20`. `(2,−1) = +1`, since `2 = 1² + 1²`. `(π,π) = (π,−1) = χ(−1)`.

**Ownership against open pull requests.** I compared this folder with #1797 and #1187 (R07), with QuadraticFormInvariantsPartII (#1834), whose scope is characteristic two, higher Pfister theory and higher invariants and is disjoint from this one, and with GlobalQuadraticForms on main.

**Gaps.** None declared.

## Not verifiable

- serre1973cia, omeara1963, serre1979lf and scharlau1985 are recorded as uncertified, so no text was available. I checked their formulas by computation instead (table above).
- Lam (2005, cited as PRIMARY at README 3337), Gille–Szamuely (2017) and Grove (2002) are not in the manifest. No legal open copy is known to me, and I did not fetch them. The seeded "canonical owner" cites Serre *Local Fields* XIV §2 Prop. 4–5 and Gille–Szamuely 4.7. I checked that claim against the pinned Tau Ceti instead.

## Source issues

- none
