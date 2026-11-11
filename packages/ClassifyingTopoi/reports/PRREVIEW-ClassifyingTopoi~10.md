# Review of ClassifyingTopoi (pull request #1997 at 6e9cb0f)

**Verdict:** needs changes

## R01 (P3) — the Mathlib contract omits two declarations the new 3.5 (a′) statement consumes

**Location** `TauCetiRoadmap/ClassifyingTopoi/README.md` line 861 (3.5 *Needs:*): "`ObjectProperty.ι`, `FirstOrder.Language.Hom`, `Equivalence.op`, `unopUnop`, `sheafToPresheaf`,"; lines 191–192 (contract): "Categories and examples: `FintypeCat.Skeleton`, … `FintypeCat.incl`, `unopUnop`, `yoneda`, …".

**Claim** The new conclusion of `exists_isClassifyingSite_fpModel` uses Mathlib's `ObjectProperty.ι` and `Equivalence.op`. The 3.5 *Needs:* line names both, but the From Mathlib contract names neither, although it lists the other names in that conclusion (`unopUnop`, `sheafToPresheaf`, `TypeCat.ofHom`).

**Witness** `Suggested.lean` line 552: `e.op.functor ⋙ unopUnop _ ⋙ ObjectProperty.ι _ ⋙ SetModel.forget T`. Mathlib `CategoryTheory/Opposites.lean:777` (`Equivalence.op`), `CategoryTheory/ObjectProperty/FullSubcategory.lean:59` (`ObjectProperty.ι`). Neither name occurs in README lines 171–231.

**Repair** In the "Categories and examples" bullet of From Mathlib, after "`unopUnop`," insert "`Equivalence.op`, `ObjectProperty.FullSubcategory`, `ObjectProperty.ι`,". `FPModel` already uses `ObjectProperty.FullSubcategory`, and the contract does not list it either.

## R02 (P3) — the description puts GrothendieckTopoi 1.2, 1.4 and 2.4 in the README's Scope

**Location** Description: "The README's Scope consumes, by roadmap name and section:", followed by "GrothendieckTopoi 1.1 (topoi), 1.2 (…) and 1.4 (…)" and "2.4 (inverse images of continuous maps, for the Examples of Layer 1)".

**Claim** The README's Scope and ownership section names none of GrothendieckTopoi 1.2, 1.4 or 2.4. The list in the description reproduces the Exact supplier contracts, which name all three.

**Witness** README lines 66–77 (Left to GrothendieckTopoi) cite 1.1, 2.1–2.2, 2.5, 4.1–4.2, 6.1, 6.5 and 6.6. Lines 212–226 (From GrothendieckTopoi) also cite 1.2, 1.4 and 2.4.

**Repair** Replace "The README's Scope consumes, by roadmap name and section:" with "The README's supplier contracts consume, by roadmap name and section:".

## Previous findings

- R01 — repaired: "One `0`-ary relation symbol `p` and the axioms `⊢ ∃ x, ⊤` and `⊤ ⊢ x = y`: the axioms make the carrier a one-point set" (line 527). The universe Check (535) and the two-symbol case (540) take the same axioms, so the 2.5 Check holds.
- R02 — repaired: "`(n, ⊤)` presents the free model on `n` generators, which has `2n` elements, so no free model has one element … splits in `FPModel T`, through the one-point set, but not in its full subcategory on the free models" (lines 894–897).
- R03 — repaired: 2.4 reads "… for some `ψ : GeometricFormula.{max u₁ u₂ u} L n`. Prove also that the objects underlying …" (line 554). (a′) names the generic carrier, which `Suggested.lean` lines 540–553 state through `SetModel.forget` and a `Nonempty (… ≅ …)` clause.
- R04 — repaired: "Images are stable under pullback, since every epimorphism is the coequalizer of its kernel pair (1.2) and such coequalizers are universal (GrothendieckTopoi 1.4)" (lines 476–477). GrothendieckTopoi 1.4 is in *Needs:* (482), Dependencies (649) and the contract (216); 2.4 is in the contract (220).
- R05 — repaired: "Six points need checking:" is followed by six bullets. The elaboration paragraph now speaks of "the previous head" and the last commit, and no longer says that the build has not run.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 2.2 (b), Frobenius route | epi `Bool → PUnit` pulled back along `PEmpty → PUnit`; `(∃ y, y * y = x) ∧ x * x = x` in ℤ | kernel pair has 4 pairs, an equivalence relation; pullback `PEmpty → PEmpty` is still its coequalizer; at `x = 0, 1, 2`: true, true, false on both sides | holds; each step supplied by GrothendieckTopoi 1.2, 1.4 | — |
| 2.3 Check, one symbol | `(PUnit, false)`, `(PUnit, true)`, `(Bool, false)` | one map false → true, none back; `(Bool, false)` fails `⊤ ⊢ x = y` at `(false, true)`; Sierpiński: 2 points, one 2-cell (GrothendieckTopoi 2.2, Checks) | holds | — |
| 2.3 Check, universe | `Type u` symbols; two symbols | subterminals of `Sheaf J (Type u)` inject into `Set C`, which is `u`-small; `not_small_type`; two symbols: 4 set-models, 4 points of presheaves on `2 × 2` | holds | — |
| 2.5 subsingleton Check (cites 2.3) | set-models of both theories | `{⊤ ⊢ x = y}`: `PEmpty → PUnit`; one symbol: `(1, false) → (1, true)`; both are the arrow category, and in any topos both are the poset of subterminals | holds now | — |
| 2.4 `exists_interp_eq_of_subobject` (reworded) | topos of 3.2, `n = 0` | upward-closed families of finite sets: none, the nonempty ones, all; 3 subterminals = `bot`, `top`, `ex top` | holds; prose and Lean agree | — |
| 3.5 `SetModel.forget` | `rfl` tests; constant functor `PUnit` | `obj M = M.carrier` and `map f x = f x` elaborate by `rfl`; the constant functor has 1 element at `Bool`, not 2 | determines the functor | — |
| 3.5 `exists_isClassifyingSite_fpModel` | theory of objects; `{⊤ ⊢ bot}`; terminal presheaf | `C ≃ FinSetᵒᵖ`, 2 elements at `Fin 2` (generic object of 3.2); `{⊤ ⊢ bot}`: empty `FPModel`, both sides the empty functor; terminal presheaf gives 1 ≠ 2 | holds (Caramello2012Syntactic lines 512–516) | R01 (contract) |
| 3.5 idempotents Check | free models for `n = 0, 1, 2`; one-point model | 0, 2, 4 elements; `r : {x, f x} → {*}`, `i(*) = f x`: `i ∘ r = e`, `r ∘ i = 𝟙`; no free model has 1 element | holds | — |
| 1.4 Examples (GrothendieckTopoi 2.4) | point `y : PUnit → Y` | `GeometricMorphism.ofContinuous`, `TopCat.Sheaf.pullback`; the inverse image along `y` is the stalk (GrothendieckTopoi 2.4, Checks) | holds | — |

Rows for the statements this change does not touch stand as in the previous review, of `997b188`.

- Source locators checked against the text: 2. Caramello2012Syntactic lines 507–516 (p. 189): the universal model in `[f.p.T-mod(Set), Set]` sends a sort to `M ↦ MA`. Caramello2017Lattices line 2321 (p. 65, Remark 14.2).
- Supplier sections at their heads. GrothendieckTopoi (6b3158d): 1.2 (`IsRegularEpiCategory`, every epimorphism effective, frames, `Subobject.exists` ⊣ pullback), 1.4 (`GiraudAxioms`, `isGrothendieckTopos_iff_giraudAxioms`), 2.2 Checks, 2.4. LocallyPresentableCategories (9deea52): 1.5, 3.1 and 3.5 are present.
- Library declarations opened at the pins: Mathlib `Logic/Small/Defs.lean:123`, `CategoryTheory/Opposites.lean:139,777`, `CategoryTheory/ObjectProperty/FullSubcategory.lean:59` and `CategoryTheory/Types/Basic.lean:129`. `ModelTheory/Bundled.lean:33–62` has no category of structures, so `SetModel.forget` duplicates nothing.
- Gate. The worker's gate at 6e9cb0f reports every check 0 with `build=0`, OK. My rerun reports every text check 0, OK. Depcheck: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` exits 0 with 27 `sorry` warnings and nothing else. In a scratch copy, `#check @SetModel.forget` and `#check @exists_isClassifyingSite_fpModel` give the README 3.5 (a′) statement with no binder lost, and two `rfl` tests elaborate. The only new declaration is a definition that the headline needs, so it is not padding.
- Outside the folder, `git diff --stat origin/main...HEAD` is empty. No open pull request changes this roadmap, and no cited id is dropped or defined only by a revision.
- Overlap check: read GrothendieckTopoi, TotallyDistributiveTopoi, LocallyPresentableCategories, HomotopyTheoryOfCategories, HigherToposTheory and InfinitaryLogic. Giraud's axioms and `B G` belong to GrothendieckTopoi (cited here and by TotallyDistributiveTopoi), and `Ind A` to LocallyPresentableCategories (cited). Nobody else owns set-models or `SetModel.forget`.
- Remark, no change asked: the title ends in a stray `---`.

## Not verifiable

- Johnstone, Elephant, D1.3.10 (2.2 (b), whose route this change rewords): OUP has no open copy. It is cited through Caramello2017Lattices, proof of Theorem 17.6, p. 81, which the previous review verified.

## Source issues

- none
