# Review of ClassifyingTopoi (pull request #1997 at 0e6bf1d)

**Verdict:** needs changes

## R01 (P3) — the new definition `GeometricFormula.IsCoherent` has no Checks

**Location:** `TauCetiRoadmap/ClassifyingTopoi/README.md` lines 313–316, "the predicate `GeometricFormula.IsCoherent` (*coherent* formulas: `top`, `equal`, `rel` are coherent, … `iSup φ` when its index type is `Finite` …)", and the Checks of 1.1, lines 330–344.

**Claim:** A definition needs at least three discriminating Checks. None of the four Checks of 1.1 evaluates `IsCoherent`, and no other section does.

**Witness:** The Checks of 1.1 test `bot`, the torsion disjunction, `ex` and relabelling. `IsCoherent` occurs only at README lines 314 and 502 and in `Suggested.lean` at lines 88–94 and 256.

**Repair:** Add to the Checks of 1.1:
- "The empty and the binary disjunction are coherent: `bot`, over `PEmpty`, and a disjunction over `Bool` of two atomic formulas (`Finite PEmpty`, `Finite Bool`). A definition requiring a nonempty index type would make `bot`, and the sequents `R_φ ⊢ bot` of 1.5, not coherent."
- "Coherence is a condition on the syntax: the disjunction over `ULift ℕ` of copies of `top` is not coherent, since `ULift ℕ` is infinite, although it is realized at every assignment of every structure, as `top` is."
- "Coherence passes to subformulas: `and top χ`, for the torsion formula `χ` of the second Check, is not coherent, although its outer connective is finitary. Every sequent of `torsorTheory G` (3.3) is coherent exactly when `G` is finite, because its transitivity axiom is a disjunction over `G`: this holds for `Multiplicative (ZMod 2)` and fails for `Multiplicative ℤ`."

## R02 (P3) — the supplier contract and the *Needs:* line of 3.3 do not state what the new route of 3.3 consumes

**Location:** README lines 274–277, "6.5 (connected nonempty projective objects, Roos's theorem `exists_equiv_presheaf_iff_essential_points`), 6.6 (…), for 3.3, 3.5 and 3.6"; the *Needs:* line of 3.3, lines 919–922.

**Claim:** 3.3 takes from 6.5 the identification of essential points with the idempotent completion, which the contract does not name. The contract also lists 3.3 as a consumer of 6.6. The *Needs:* line omits the Mathlib idempotent-completion API that the route uses.

**Witness:** The route at lines 914–916 says "their categories of essential points, the idempotent completions (GrothendieckTopoi 6.5)". GrothendieckTopoi 6.5 (open head) states that the essential points of `Cᵒᵖ ⥤ Type u` form `Idempotents.Karoubi C`. The Dependencies at line 1205 give "6.5 (3.3 and 3.5), 6.6 (3.5–3.6)".

**Repair:** In the contract, write: "6.5 (connected nonempty projective objects, Roos's theorem `exists_equiv_presheaf_iff_essential_points`, and the essential points of `Cᵒᵖ ⥤ Type u` forming `Idempotents.Karoubi C`), for 3.3 and 3.5; 6.6 (`IsIrreducibleObject` and `isIrreducibleObject_iff_projective_preservesCoproducts`), for 3.5 and 3.6." On the *Needs:* line of 3.3, add Mathlib `IsIdempotentComplete`, `Idempotents.Karoubi`, `Idempotents.toKaroubi_isEquivalence` and `SingleObj.toEnd`.

## R03 (P3) — Downstream consumers understates what ToposTheoreticBridges consumes

Partly repaired R04 of the previous review.

**Location:** README lines 1327–1330, "ToposTheoreticBridges (open pull request) consumes 2.1 (classifying sites), 2.5 (…) and 2.6 (`MoritaEquivalent`) in its Layer 4, and cites 3.2, 4.1 and 4.2 in Checks and Examples."

**Claim:** At its head, ToposTheoreticBridges also consumes 1.1, 1.3, 1.4 and 2.4, and also cites 4.3 and the Checks of 2.5. It uses `exists_quotient_theory` for sites in `Type u`, and this head states that theorem only in `max u₁ u₂ u`.

**Witness:** ToposTheoreticBridges (open, 1c43589), README line 450: "*Needs:* 3.1; ClassifyingTopoi 1.1, 1.3, 1.4, 2.1, 2.4, 2.5, 2.6". Line 480: "(ClassifyingTopoi 4.3)". Line 80 (Convention 4): "(ClassifyingTopoi 2.5, Checks)". Line 435 uses `exists_quotient_theory` for surjectivity.

**Repair:** "ToposTheoreticBridges (open pull request) consumes in its Layer 4: 1.1, 1.3 and 1.4 (`GeometricTheory`, `CatStructure`, `CatStructure.IsModel`, `CatStructure.map`, `CatStructure.IsModel.map`); 2.1; 2.4 (`IsClassifyingSite.exists_equivalence`); 2.5 (`IsClassifyingSite.exists_quotient_topology`, and `IsClassifyingSite.exists_quotient_theory`, which is stated in the universe `max u₁ u₂ u` of 2.3); and 2.6 (`MoritaEquivalent`). It cites the Checks of 2.5, 3.2 and 4.1–4.3 in its Conventions, Checks and Examples. No roadmap on main consumes ClassifyingTopoi."

## Previous findings

- R01 — repaired: `Suggested.lean` 349–357 and 641–649 have "`{T : GeometricTheory.{max u₁ u₂ u} L}` … `Type (max u₁ u₂ u)`". README 793–796 gives the route through `[[φ]]` and 2.4. Both statements are added to the sentence of 3.5 (991) and to the module docstring.
- R02 — repaired: `IsCoherent` is defined at README 313–316 and `Suggested.lean` 87–94. `exists_morleyization` has "`(∀ σ ∈ T', σ.lhs.IsCoherent ∧ σ.rhs.IsCoherent) ∧`". The new definition has no Checks: R01.
- R03 — repaired: the route of 3.3 at 914–918 goes through "GrothendieckTopoi 6.5". *Needs:* has "GrothendieckTopoi 2.5, 6.5"; Dependencies has "6.5 (3.3 and 3.5)". The contract wording is loose: R02.
- R04 — partly repaired: lines 1327–1330 name ToposTheoreticBridges, but list only 2.1, 2.5 and 2.6 and the citations of 3.2, 4.1 and 4.2. R03.
- R05 — repaired: the description says "It states 28 headline theorems". It names `GeometricFormula.IsCoherent`, 1.5, InfinitaryModelExistence 5.1 (on main) and Tau Ceti's `morleyize` family, and puts the converse of 2.5 and 3.6 (a) in `max u₁ u₂ u`.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `GeometricFormula.IsCoherent` | `bot`; `iSup` over `ULift ℕ` of `top`; `and top χ`; torsor transitivity | `Finite PEmpty`: coherent (elaborated); `¬Finite (ULift ℕ)`: not coherent, realized everywhere (elaborated); `True ∧ False`; `ZMod 2` finite, `ℤ` not | defines the coherent fragment; no Checks | R01 |
| 1.5 `exists_morleyization`, coherence conjunct | the five constructor groups; previous `ℕ`-indexed witness | disjunctions over `PEmpty` and `Bool`, both `Finite`; `R_φ[castAdd 1]` is a `rel`, so coherent; `⊤ ⊢ ⋁ (k : ℕ)` excluded by `¬Finite ℕ` | holds; witness excluded | — |
| 2.5 `exists_quotient_theory` | `L : Language.{1, 0}`, constants indexed by `Type`, `u = 0`; ring language; `J' = ⊤` | `T : GeometricTheory.{1}`, `C : Type 1`, as 2.3 and 2.4; `max 0 0 u = u`, no loss; empty sieve gives `φ ⊢ bot`, degenerate topos | route reaches | — |
| 2.5, the added converse route | `F_M` sending a `J'`-sieve `S` on `c` to an epi; family `[[φᵢ]] → a(yc)` | `f*(aS) = f*(a yc)` iff each pullback `[[ψᵢ]] ≤ [[φᵢ]]` is preserved, iff `φᵢ ⊢ ψᵢ` holds in `f*U` (1.4) | agrees with Car09, proof of Thm 3.6 | — |
| 3.6 (a) `exists_quotient_isSetModel_iff_isHomogeneous` | 3.5 (a′) at `max u₁ u₂ u`; `J = ⊥` | `exists_isClassifyingSite_fpModel` is polymorphic in `u` and instantiates; `SetModel T` carriers in `Type (max u₁ u₂ u)`; `J = ⊥` gives `T' = T` | holds | — |
| 3.3 `moritaEquivalent_torsorTheory_iff`, new route | `Multiplicative (ZMod 4)` against `ZMod 2 × ZMod 2`; monoid `{1, e}` | a group's only idempotent is `1`, so `Karoubi (SingleObj G) ≌ SingleObj G`; `End` has an element of order 4 against none; `{1, e}`: two Karoubi objects | route sound; contract short | R02 |
| Downstream consumers | ToposTheoreticBridges head, lines 80, 450, 466–480 | consumes 1.1, 1.3, 1.4, 2.1, 2.4, 2.5, 2.6; cites 2.5 Checks, 3.2, 4.1–4.3; README states 2.1, 2.5, 2.6; 3.2, 4.1, 4.2 | understated | R03 |
| one-tactic probe, 3 changed theorems | `first \| rfl \| infer_instance \| simp_all \| trivial \| aesop` | 3 failures, 0 closed | no padding | — |

The rows for the untouched statements stand as in the previous review, of 25e5b86.

- Gate at 0e6bf1d, rerun: every check 0, OK. Dependency check: `depcheck: 245 roadmaps, 2206 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 28 `sorry` warnings and nothing else. `#check @` on `exists_morleyization`, `IsClassifyingSite.exists_quotient_theory`, `exists_quotient_isSetModel_iff_isHomogeneous` and `GeometricFormula.IsCoherent` shows each elaborated type as in the README, with every binder kept.
- Source locators in the changed passages checked against the text: 3. Car09 (arXiv:0905.0299v1): Theorem 3.6, line 483, with the construction of the converse at lines 532–559; Theorem 14.4, line 2393. Car08 (arXiv:0805.2187v1): Theorem 4.6, line 335.
- Library declarations opened at the pins: Mathlib `CategoryTheory/Idempotents/Basic.lean:54` (`IsIdempotentComplete`), `CategoryTheory/Idempotents/Karoubi.lean:43, 231` (`Karoubi`, `toKaroubi_isEquivalence`), `CategoryTheory/SingleObj.lean:102` (`SingleObj.toEnd`). Neither Mathlib nor Tau Ceti `ModelTheory` has a coherent-formula predicate.
- Cross-roadmap citations resolved at the heads: GrothendieckTopoi (open, 6b3158d) 6.5 (essential points of `Cᵒᵖ ⥤ Type u` form `Karoubi C`) and 6.6; ToposTheoreticBridges (open, 1c43589) lines 47–49, 118–127, 435, 450 and 466–480.
- Overlap check: read ToposTheoreticBridges and GrothendieckTopoi (open) at their heads, and InfinitaryModelExistence (main) 5.1. Searched for coherent formulas across every roadmap: no other owner. The idempotent completion of presheaf topoi belongs to GrothendieckTopoi 6.5 and is cited. TotallyDistributiveTopoi, LocallyPresentableCategories, InfinitaryLogic and CountableModelCounting are as in the previous review: nothing shared.
- Source independence: changed passages only. 8 passages compared with 3 sources and none shared: the `IsCoherent` definition, the two coherence sentences of 1.5, the converse route of 2.5 against Car09 lines 532–559, the universe sentences of 3.5 and 3.6 (a) against Car09 line 2393 and Car08 line 335, the route of 3.3, and three docstrings. The largest shares are Elephant and Caramello 2017, 15 each of 61 locators. No layer was added, removed or reordered, so the arrangement was not compared again.
- Remarks on untouched text, no change asked: Summary lines 22–26 state definability and the converse of 2.5 without the universe `max u₁ u₂ u`. `Suggested.lean` line 251 is 105 characters long.

## Not verifiable

- Johnstone, Elephant, D1.1, cited for coherent formulas in 1.1: paywalled (OUP), with no open copy. The other items of the previous list (Mac Lane–Moerdijk, Makkai–Reyes, Hakim) are cited only in unchanged passages.

## Source issues

- none

## For the human reviewers

- **Not tested.** Elephant has 15 of the README's 61 locators (tied largest) and Mac Lane–Moerdijk has 11. Neither text could be read, so the wording of 1.1–1.5, 2.1–2.3 and 3.2–3.4 was not compared with them.
- **Scope.** The converse of 2.5 and 3.6 (a) are now stated only in the universe `max u₁ u₂ u`. Whether to plan the general statement, definability on every classifying site in every universe, is a choice of scope.
