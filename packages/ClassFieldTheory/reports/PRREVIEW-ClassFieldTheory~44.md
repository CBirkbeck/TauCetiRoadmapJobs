# Review of ClassFieldTheory (pull request #1411 at 5bfdf39)

**Verdict:** needs changes

This is an incremental re-review of the 124 lines changed in this folder since 6819093. Every change inside the folder is correct:
- the closure is dropped from the absolute unit-filtration statement;
- the former-label table is in a form the overlap check reads;
- the nondegeneracy theorem is stated in the right variable.

Two P3 findings remain, and neither is in the folder's text. The merge-order paragraph of the description still names the theorem by its old name. The edit to `Completed/LocalGaloisGroups` is still outside the folders recorded for this pull request. Nothing inside `TauCetiRoadmap/ClassFieldTheory/` needs to change.

## R01 (P3) — The merge-order paragraph still names the old theorem `closure_map_artinMap_unitFiltration`

**Location.** The pull request description (`scratch/pull-request.md`), *Merge order*: "this head's definition name `localAbsoluteUpperRamificationGroup` and its theorem names `map_unitFiltration_normResidue` and `closure_map_artinMap_unitFiltration` survive, and #1215's renamed copies are dropped on rebase".

**Claim.** This is the unrepaired part of the previous R01, whose repair asked for the rename to be recorded where the merge order is stated. The folder now declares `map_artinMap_unitFiltration` (`Suggested.lean:540`), and the old name occurs nowhere in it. Whoever rebases #1215 or #617 onto this head, or this head onto them, is told to keep a declaration that no longer exists.

**Witness.**
- `roadmaps grep 'closure_map_artinMap_unitFiltration'` finds the old name only in #1215's README line 281, where it maps the old name to `map_artinMap_unitFiltration_eq_upper`.
- The same grep finds no occurrence in this folder.
- So #1215 and this head now give the same theorem two different new names.

**Repair.** Change the paragraph to: "its theorem names `map_unitFiltration_normResidue` and `map_artinMap_unitFiltration` survive, and #1215's copies `normResidue_map_unitFiltration` and `map_artinMap_unitFiltration_eq_upper` are dropped on rebase". Every name in the repaired sentence resolves at this head: `Suggested.lean:503`, `:524` and `:540`, and #1215 README line 281.

## R02 (P3) — The forced edit to `Completed/LocalGaloisGroups` is still outside the folders recorded for this pull request

Carried from the previous R02. It is not repaired.

**Location.** `Completed/LocalGaloisGroups/Suggested.lean:326` and `:485`, as changed against main: "`⟨ClassFieldTheory.h2MuEquivZMod_mixed p F n hn⟩`" and "`⟨ClassFieldTheory.h2FpEquivZMod_of_mu p F _ (muNRepIsoTrivialFp p F ζ hζ)⟩`".

**Claim.** The folders recorded for this pull request are `TauCetiRoadmap/ClassFieldTheory/`, `TauCetiRoadmap/IntegralLattices/` and `TauCetiRoadmap/QuadraticFormInvariants/`. The completed roadmap's file lies outside all three. It is changed because this folder made `h2MuEquivZMod_mixed` and `h2FpEquivZMod_of_mu` canonical equivalences.

**Witness.**
- `git diff --stat origin/main...HEAD`, restricted to everything outside the three folders, lists `Completed/LocalGaloisGroups/Suggested.lean | 4 ++--`.
- The description names the folder as its own, but the board's folder list for this review does not.
- The targeted build does not build `Completed.LocalGaloisGroups.Suggested`.

**Repair.** No change inside this folder. Have `Completed/LocalGaloisGroups` recorded as one of this pull request's folders where the board reads them, so that the adaptation is reviewed and built with this head. Keep the two lines: reverting to `Nonempty`-valued declarations would contradict the README's own rule at lines 588–591.

## Previous findings

- R01 — partly repaired: `Suggested.lean:540–543` now states "`(TauCeti.unitFiltration K n).map (artinMap K) = (localAbsoluteUpperRamificationGroup K ⟨n, …⟩).map (QuotientGroup.mk' …)`". The README (lines 576, 1511–1518, 1544–1552, 1563–1566, 1579–1585, 1603–1605) and docstring item 6 match it. The description still names the old theorem; carried as R01.
- R02 — not repaired: `Completed/LocalGaloisGroups/Suggested.lean | 4 ++--` is still changed outside the three recorded folders, and this review's folder list still omits it; carried as R02.
- R03 — repaired: README 197–212 is a table headed "| Former label | Where it is now |", and `roadmaps overlaps ClassFieldTheory` at this head lists no dropped id that another roadmap cites.
- R04 — repaired: README 1065–1070 reads "`b` pairs to zero with every `a` exactly when `b ∈ (Kˣ)ⁿ` … The first-variable form … follows by `localSymbol_antisymm`", which matches Tau Ceti `Local/HilbertPairing.lean:61–64`.

## Verified sound

**Gate, build and order.**
- The worker's gate at this head passes every check (`scratch/gate.md`, build=0).
- My rerun without the sibling-folder declaration reports `outside-folder=5`. All five are in the declared sibling folders: `IntegralLattices/{README.md,Suggested.lean}` and `QuadraticFormInvariants/{NativeCompletion.md,README.md,Suggested.lean}`. Every check inside this folder is 0.
- Dependency check, verbatim: `depcheck: 235 roadmaps, 2264 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean`: exit 0, with exactly five `declaration uses sorry` warnings, at lines 401, 503, 540, 687 and 697, and nothing else.

**Signatures.** I ran `#check @` in a scratch copy on `map_artinMap_unitFiltration`, `localAbsoluteUpperRamificationGroup`, `map_unitFiltration_normResidue` and `artinMap`.
- `map_artinMap_unitFiltration` elaborates as `∀ K [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] (n : ℕ), Subgroup.map (artinMap K) (unitFiltration K n) = Subgroup.map (QuotientGroup.mk' …topologicalClosure) (localAbsoluteUpperRamificationGroup K ⟨↑n, ⋯⟩)`.
- It has no characteristic hypothesis, which matches README 1446–1447 and 1503–1504 ("in either characteristic").
- The other three signatures are unchanged from `scratch/signatures.md`.

**One-tactic probe.** On a scratch copy I replaced the `sorry` of `map_artinMap_unitFiltration` with `first | rfl | simp | infer_instance | exact?`. The result is "`exact?` could not close the goal", so it is not padding. Tau Ceti at the pin has only the depth-0 case, `map_artinMap_unitFiltration_zero` (`Local/Unramified.lean:475`). It has no all-depth statement and no declaration of the same name.

**Declarations opened at the pins for the changed passages.**
- Tau Ceti, unit-filtration reciprocity:
  - `isCompact_unitFiltration` (`LocalField/UnitFiltration/Basic.lean:478`). Its variable block at `:93–94` has only `[IsNonarchimedeanLocalField K]`.
  - `continuous_artinMap` (`ClassFieldTheory/Local/ArtinMap.lean:248`), with the same context at `:106–107`.
  - `map_artinMap_unitFiltration_zero` (`Local/Unramified.lean:475`), stated for `unitFiltration K 0` and `inertiaSubgroup K`.
  - `unramifiedCoordinate_artinMap` (`:407`).
  - `Nat.cast_mem_ramificationIndexDomain` (`LocalField/RamificationGroup.lean:89`).
  - The roadmap alias `artinMap` is `TauCeti.ClassFieldTheory.artinMap K` (`Suggested.lean:455–457`), so the two Tau Ceti facts apply to it.
- Mathlib: `Field.absoluteGaloisGroupAbelianization` is `TopologicalAbelianization` (`FieldTheory/AbsoluteGaloisGroup.lean:101`). `QuotientGroup.instT3Space` for a closed normal subgroup (`Topology/Algebra/Group/Quotient.lean:163`) makes `G_K^ab` Hausdorff, as README 1516–1517 claims.
- Tau Ceti, Layer 5 *The Hilbert symbol* (README 1034–1087, which contains the changed nondegeneracy bullet):
  - `localSymbol_kummerClass_mul` (`Local/Symbol.lean:339`), `localSymbol_kummerClass_eq_zero_of_add_eq_one` (`:355`), `localSymbol_antisymm` (`:364`), `kummerCupPairing_bil` (`:257`) and `kummerCupPairing_bil_comm` (`:270`).
  - `localSymbol_eq_zero_iff_mem_normGroup` (`Local/CyclicClass.lean:293`) and `forall_localSymbol_kummerClass_eq_zero_iff` (`Local/HilbertPairing.lean:61`). Its proof takes exactly the route the README now describes: norm group `⊤` for `K⟮s⟯`, then the cyclic norm index.
  - `index_normGroup_of_isCyclic` (`Brauer/LocalH2Bound.lean:70`, for cyclic Galois `L/K` of finite degree).
  - `h2MuEquivZMod` (`Brauer/RootsOfUnity.lean:89`), `invMap_h2MuToBr_h2MuEquivZMod_symm` (`:129`) and `h2MuToBr` (`Brauer/Torsion.lean:67`).
  - `muNRepEquivZMod_generator` (`MuNRep.lean:433`), `localArtinMap_quadratic_eq_hilbertSymbol` (`Local/Quadratic.lean:87`) and `Rep.FiniteCyclicGroup.periodicIso` (`TateCohomology/Periodic.lean:346`).
- Former-label table (README 197–212). All 13 rows resolve:
  - The three section rows point to the headings at lines 302, 373 and 419.
  - `kummerCoeffEquivMuNRep`, `continuous_kummerCoeffEquivMuNRep` and `kummerCoeffEquivMuNRep_smul` (`MuNRep.lean:150`, `:154`, `:165`).
  - `cohomologicalDimensionAt_absoluteGaloisGroup_eq_two` (`Local/CohomologicalDimension/AbsoluteGaloisGroup.lean:104`).
  - `conductorExponent_le_iff_upperRamificationGroup_eq_bot` (`Local/Conductor/UpperNumbering.lean:121`).
  - `localClassFieldCorrespondencePrimeToResidueCharacteristic`, `LocalNormSubgroupsPrimeTo` and `AbelianLayerPrimeTo` (`LocalExistence/Correspondence.lean:238`, `:189`, `:194`).
  - `brLocalization` (`Global/InvariantSum.lean:145`).
  - `brLocalization_injective` and `sumLocalInv_brLocalization_eq_zero` (`Global/Brauer/SumFormula.lean:135`, `:142`).
  - `TauCeti.GlobalNumberFields.unitEmbedding_mem_range_ideleNormMap_iff` (`Ideles/Norm/LocalNorm.lean:42`, namespace at `:35`).
  - Mathlib's `NumberField.IdeleGroup.unitEmbedding` (`NumberTheory/NumberField/AdeleRing.lean:110`).

**Seeded sample, where it falls in the changed passages.**
- *The Hilbert symbol* (README 1034) carries no source locator. Every Tau Ceti law it names is resolved above. The nondegeneracy bullet now agrees both with the pinned theorem's variable order and with the table row at README 206.
- Layer 7's *Exit criterion* (README 1603–1605) names `cyclotomicCharacter_artinMap`, `map_unitFiltration_normResidue` and `map_artinMap_unitFiltration`. All three are declared in `Suggested.lean`, and the last two are the open targets of the layer.
- The other sampled targets lie in untouched text: the remaining *Exit criterion* paragraphs, *Implemented in Tau Ceti*, *The Kummer class*, *Local units and the `H²` bound*, *Smoothness*, *Local duality and the Euler characteristic*, *The principal ideal theorem* and *The conductor–discriminant formula*. The previous review checked them, and they are unchanged here.

**Citations and ownership.**
- `roadmaps grep` finds no roadmap, on main or at an open head, that cites the closure form or uses a closure of an Artin image. The closure form is `topologicalClosure … artinMap`, or "closure of artinMap".
- No consumer (RamificationOfCompleteDiscretelyValuedFields, FunctionFieldArithmetic, PadicPeriodRings, FilteredLocalGaloisGroups) names either theorem. So the rename breaks no citation outside the description (R01).
- `roadmaps overlaps ClassFieldTheory` at this head:
  - #617 and #1215 change this roadmap and conflict with this head; the description states the order of rebasing.
  - No id this README cites is dropped by an open pull request, and no id is defined only by an open revision.
  - No id this pull request drops is cited elsewhere.
- Since 6819093 the sibling folders IntegralLattices and QuadraticFormInvariants changed no line that mentions ClassFieldTheory.
- One remark on untouched text, which asks for no change. The principal ideal theorem's route (README 2222–2229) proves the ideal form of the ground-level inclusion inside the target. So the gap found in the other open revision of this roadmap does not arise here.

**Adversarial pass.** Rows 1–9 cover the changed statements, with values computed here. Rows 10 onwards are carried from the previous review (r40) for statements this change leaves untouched.

| # | Statement | Instance | Left side / right side | Result |
|---|---|---|---|---|
| 1 | `map_artinMap_unitFiltration` | `K = ℚ_p`, `n = 0` | `Art(ℤ_pˣ)` = inertia of `ℚ_p^ab/ℚ_p` / image of `G_K^0` = image of inertia of `G_K`, the same group; this is `map_artinMap_unitFiltration_zero` | holds |
| 2 | same | `K = ℚ_3`, `n = 1`, level `ℚ_3(ζ_9)` | image of `1 + 3ℤ_3` under `u ↦ σ_(u⁻¹ mod 9)` is `{1, 7, 4}` / `G^1 = Gal(ℚ_3(ζ_9)/ℚ_3(ζ_3)) = {a ≡ 1 mod 3} = {1, 4, 7}` | holds |
| 3 | same, wrong model: shifted depth `U^n ↔ G^(n−1)` | as in row 2 | LHS has order `3` / `G^0` is all of `(ℤ/9)ˣ`, order `6` | the shift is excluded |
| 4 | same | `K = ℚ_2`, level `ℚ_2(ζ_8)`, `n = 2, 3` | `n = 2`: `{1, 5}` / `G^2 = {1, 5}`; `n = 3`: `{1}` / `G^3 = 1` | holds |
| 5 | same, equal characteristic | `𝔽_p((t))`, level `y^p − y = t⁻¹`, `n = 1, 2` | `n = 1`: `ℤ/p` / `G^1 = G` (break 1); `n = 2`: `1` / `1`; no characteristic hypothesis in the signature | holds |
| 6 | same, closure | every `n` | `U(K,n)` is compact (`isCompact_unitFiltration`), `artinMap` is continuous and `G_K^ab` is T2 (`QuotientGroup.instT3Space`), so LHS equals its closure; the old and new statements are equivalent and the new one is stronger as an API | holds |
| 7 | same, normalization | `x ↦ Art(x)⁻¹` instead of `Art` | the image of a subgroup is the same under either map, so this statement cannot detect the Frobenius normalization; that is pinned by `unramifiedCoordinate_artinMap` and the Layer 7 Examples | no change needed |
| 8 | depth-0 Check, wrong model `G_K^0 = G_K` | `n = 0` | image of units ⊆ `ker unramifiedCoordinate` (`v_K(u) = 0`), while `unramifiedCoordinate(Art π)` is the generator `zHat.gen`, not the identity, so the image of `G_K` is not reached | excluded, as the Check says |
| 9 | Layer 5 nondegeneracy, second variable | `ℚ_7`, `n = 3`: `b = 7`, `a = 2`; `b = 8` | cubes mod 7 are `{1, 6}`, so the tame symbol `2^((7−1)/3) = 4 ≢ 1 mod 7`: `(2, 7) ≠ 0`, and `7 ∉ (ℚ_7ˣ)³`. For `b = 8 = 2³`, `K(8^(1/3)) = K` has degree `1`, the norm group is everything, and `b` pairs to zero with all `a` | holds in both directions |
| 9b | same | `ℚ_2`, `n = 2`: `b = 5`; `b = 17` | `(2, 5)_2 = −1` and `5` is not a square; `17 ≡ 1 mod 8` is a square and pairs to zero with every `a` | holds |
| 9c | perfectness | `ℚ_7`, `n = 3` | `#ℚ_7ˣ/(ℚ_7ˣ)³ = 9` on both sides; trivial kernel on both sides gives `9 ≤ #Hom(A, ℤ/3) = 9` | perfect |
| 10 | `algebraMap_vle_algebraMap_iff_of_finite_padic` (r40) | `ℚ_2(i)`, `(2,1)`, `(1,2)` | true, false / true, false | holds |
| 11 | `map_unitFiltration_normResidue` (r40) | `L = K`; `ℚ_2(√2)`, `n = 2, 3` | `{1}/{1}`; `G/G`, `1/1` | holds |
| 12 | same (r40) | `ℚ_p(ζ_p)`, `n = 0, 1`; unramified `n = 0` | `G/G`, `1/1`; `1/1` | holds |
| 13 | same, wrong model: lower numbering (r40) | `ℚ_2(ζ_8)`, depth 3 | `{1}` / `G_3 = ⟨σ_5⟩` while `G^3 = 1` | the upper numbering is right |
| 14 | same, non-abelian (r40) | `ℚ_2(∛2, ζ_3)`, group `S_3` | `U^(0) ⊆ N` / `#G_0 = 3` | `IsAbelianGalois` is needed |
| 15 | `localAbsoluteUpperRamificationGroup` (r40) | `u = −1`; `u ∈ (−1, 0]` at an unramified level of degree `f` | `G_K`; restriction trivial, while `G_K ↠ ℤ/f` | ceiling convention right |
| 16 | `isPrincipal_map_hilbertClassField` (r40) | `ℚ(√−5)`, `I = (2, 1+√−5)`, `H = K(i)` | `(I𝒪_H)² = (2) = ((1+i)²)`, so `I𝒪_H = (1+i)` | holds |
| 17 | `relDiscr_eq_finprod_abelianConductor` (r40) | `ℚ(i)`; `ℚ(ζ_5)` | `(4) = (1)(4)`; `(5³) = (1)(5)(5)(5)`, against `(5)` for lcm | holds; a product |
| 18 | `eulerCharacteristic_finrank_fp` (r40) | `ℚ_p` with `p` odd; `ℚ_2` | `2 = 1+0+1`; `3 = 1+1+1` | holds |
| 19 | Layer 5 duality Check (r40) | `ℚ_2`, `μ_3`, `ℤ/3` | `(1,3,3)`, `(3,1,3)` | holds |
| 20 | `scd_p_absoluteGaloisGroup_eq_two` (r40) | `ℓ = p`, `ℓ ≠ p` | `2 / 2` | holds |
| 21 | `cyclotomicCharacter_artinMap_padic` (r40) | `p = 2`, `u = −3` on `μ_16` | `(−3)⁻¹ ≡ 5`, against `13` | sign pinned |
| 22 | `hilbertProductFormula` (r40) | `ℚ`: `(−1,−1)`, `(3,7)`, `(5,5)` | sums `0`, `0`, `0` | holds |
| 23 | `cyclicHasseNorm` (r40) | `ℚ(√13, √17)`, `x = 25` | local norm everywhere, not a global norm | cyclic hypothesis needed |
| 24 | `card_ideleClassNormQuotient` (r40) | `ℚ(i)/ℚ`; `L = K` | `2/2`; `1/1` | holds |
| 25 | Layer 7 conductor formula (r40) | `ℚ_2(√2)`, `ℚ_p(ζ_p)`, unramified | `3 = 1+2`, `1 = 1+0`, `0` | holds |
| 26 | Layer 12 Kummer degree (r40) | `ℚ`, `p = 2`, `S = {2}`; `ℚ(ζ_3)`, `p = 3` | `4 = 2^2`; `9 = 3^2` | holds |
| 27 | Layer 6 Frobenius (r40) | `ℚ_2(ζ_5)/ℚ_2` | `Art(2)(ζ_5) = ζ_5²`, against geometric `ζ_5³` | holds |
| 28 | Layer 5 coordinate sign (r40) | `ℚ_7`, `n = 3` | `1` / negated `2` | holds |

## Not verifiable

- serre-local-fields (uncertified, paywalled): XV §2, Theorem 2 and Corollary 3 to Theorem 1, the locator of both unit-filtration statements. The statement was checked mathematically (rows 1–6) and, as in the previous review, against Milne I 1.11 (milne-cft lines 1374–1378).
- Whether `Completed/LocalGaloisGroups/Suggested.lean` builds at this head. Its imports `Completed.ProfiniteProPGroups.Suggested` and `Completed.LocalFieldsRamification.Suggested` are not built in this worktree, and the commands allowed here do not build them. The two forced lines are unchanged since 6819093 (see R02).
- Ownership against the open pull requests whose files this brief gives was checked by `roadmaps grep` and `roadmaps overlaps` (above). Nothing else was searched.

## Source issues

- none
