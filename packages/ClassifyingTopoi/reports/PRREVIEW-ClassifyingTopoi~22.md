# Review of ClassifyingTopoi (pull request #1997 at 08e6c9a)

**Verdict:** needs changes

## R01 (P3) — the sentence added to the description splits the name `IsClassifyingSite.exists_interp_eq_of_subobject`

**Location:** pull request description, Acceptance test: "A later commit states the definability of 2.4 (`IsClassifyingSite. The two commits after it make the route of 2.4 take … to the contract.exists_interp_eq_of_subobject`) for every classifying site in every universe".

**Claim:** The repair of the previous R01 put its new 45-word sentence inside the code span of the declaration name. The name of the 2.4 headline no longer appears in the description. The backticks also pair across the inserted sentence, so prose renders as code and `u`, `IsGrothendieckTopos.wellPowered`, `Shrink` and `WellPowered` render as plain text.

**Witness:** `TauCetiRoadmap/ClassifyingTopoi/Suggested.lean:330` declares `IsClassifyingSite.exists_interp_eq_of_subobject`. In the description, "`IsClassifyingSite." is followed by the 45-word sentence and then by "exists_interp_eq_of_subobject`)".

**Repair:** Replace the passage from "A later commit states" to the end of "… 3.5 (a), (c) and (d)." with: "A later commit states the definability of 2.4 (`IsClassifyingSite.exists_interp_eq_of_subobject`) for every classifying site in every universe, with a route through the site of definable objects and maps of the given site, and with it the converse of 2.5 (`IsClassifyingSite.exists_quotient_theory`), 3.6 (a) (`exists_quotient_isSetModel_iff_isHomogeneous`) and 3.5 (a), (c) and (d). The two commits after it make the route of 2.4 take the `u`-smallness of subobject lattices from GrothendieckTopoi 1.2 (`IsGrothendieckTopos.wellPowered`) and the stability of epimorphic families under pullback from 1.4, with universal coproducts and universal coequalizers, and add Mathlib `Shrink` and `WellPowered` to the contract." Then continue with "A scratch copy of the new `Suggested.lean` …".

## Previous findings

- R01 — partly repaired: the supplier bullet now reads "1.2 (…, and `IsGrothendieckTopos.wellPowered`, for 2.4) … 1.4 (Giraud's axioms: universal coproducts and universal coequalizers, … for 1.4, 2.2 (b) and 2.4)". The commit sentence was placed inside a code span, which is this report's R01.
- R02 — repaired: README 798–799 reads "1.4 (universal coproducts and universal coequalizers: epimorphic families are stable under pullback, so `K` is a topology)". Contract 269–271 reads "… for 1.4 and 2.2 (b); with universal coproducts, epimorphic families are stable under pullback, for 2.4)".

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 2.4 route: `K`, the families epimorphic in `Sheaf J (Type u)`, is a topology on `D`, by GrothendieckTopoi 1.4 (README 783–784, 798–800) | `Sh(S¹)`: arcs `U ∪ V = S¹`, `y U, y V ⟶ 1`, pulled back along `y W ⟶ 1` with `W ∩ V = ∅`, `W ⊆ U`; abelian groups: `i₁, i₂` along the diagonal | `Γ(y U) = Γ(y V) = ∅`, `Γ 1 = {*}`: epimorphic, though not surjective on sections. Pullbacks `y W`, `y ∅ = 0`, containing `𝟙 (y W)`: epimorphic. Abelian groups: pullbacks `0, 0`, and `0 ⟶ ℤ` is not epi | uses universal coproducts and universal coequalizers, both supplied by GrothendieckTopoi 1.4 (README 360–362) | — |
| Contract, GrothendieckTopoi 1.4: images are stable under pullback, "for 1.4 and 2.2 (b)" (README 269–270) | `Type u`: `f : {1,2,3} → {x,y,z}`, `1,2 ↦ x`, `3 ↦ y`, with `g : {p,q} → {x,y,z}`, `p ↦ x`, `q ↦ z`; and `g` from `∅` | `im (g*f) = {p} = g⁻¹{x,y}`; from `∅`, both are `∅` | holds; this README's 1.4 (483) and 2.2 (b) (679, 689) cite GrothendieckTopoi 1.4 for it, and 2.4 does not | — |
| 2.4 `IsClassifyingSite.exists_interp_eq_of_subobject`, Lean (`Suggested.lean:330`) against README 763–766 | `T = {⊤ ⊢ bot}`; the one-point site `(Discrete PUnit, ⊥)` for `{⊢ ∃ x, ⊤, ⊤ ⊢ x = y}` | degenerate topos: `U.pow n` is initial and terminal, with 1 subobject, `interp bot`. One-point site: `Subobject 1 = {⊥, ⊤}`, which are `interp bot` and `interp top` | `T : GeometricTheory.{u} L`, `C : Type u`, `ψ : GeometricFormula.{u} L n`: the same generality as the README | — |

The rows for the statements this change does not touch stand as in the previous review, of `02a2761`.

- Gate rerun at 08e6c9a: every check is 0, OK, and the worker's gate has `build=0`. Dependency check: `depcheck: 245 roadmaps, 2233 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty. The four outside files changed since 02a2761 come from the merge of main.
- Elaboration: `lake env lean` on `Suggested.lean` gives 28 `sorry` warnings and nothing else, at the pins of `lake-manifest.json` (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`). `Suggested.lean` has not changed since 02a2761, so the one-tactic probe (0 of 28 closed) and the `#check @` comparison of the previous review still apply.
- Cross-roadmap citations resolved at GrothendieckTopoi's open head: the 15 ids of the reflowed contract. Conventions 1 (README 117) and 4 (138); 1.1; 1.2 (309–324, with `IsGrothendieckTopos.wellPowered` at its `Suggested.lean:127`); the Examples of Layer 1 (392); 1.4 (357–366); 2.1 (404–412); 2.2 `homEquivInverse` (437); 2.4 `ofContinuous` (482); 2.5 (525); 4.1 (652); 4.2 (684–687); 6.1 (949); 6.5 (1060, 1064); 6.6 (1110).
- Internal agreement: 2.4's *Needs:* (794–800), the Dependencies of Layer 2 (903–906) and the contract (265–281) all name GrothendieckTopoi 1.2 and 1.4 for 2.4.
- Source locators checked against a text: 0. The changed passages carry no source locator, and the seeded sample meets them only at the *Needs:* line of 2.4.
- Overlap check: read GrothendieckTopoi (open; every section the reflowed contract names). `roadmaps grep` for the pullback-stability of epimorphic families finds only this README. ToposTheoreticBridges, TotallyDistributiveTopoi, LocallyPresentableCategories, InfinitaryModelExistence, InfinitaryLogic and CountableModelCounting stand as in the previous review: nothing shared. No other pull request changes this roadmap, and no id is dropped or defined only by an open revision.
- Source independence: changed passages only. 2 passages compared, the contract (265–281) and the *Needs:* of 2.4 (794–800). They cite no source, so 0 sources. Against GrothendieckTopoi 1.4 (README 357–366), which they cite, they share only the standard names "universal coproducts" and "universal coequalizers". No layer was added, removed or reordered, so the arrangement stands as in the previous review: largest share Elephant, 15 of 55 locators; contents independent.

## Not verifiable

- none for the changed passages. The paywalled texts of the previous review (Elephant, Mac Lane–Moerdijk, Makkai–Reyes, Hakim 1972) are cited only in passages this change does not touch.

## Source issues

- none

## For the human reviewers

- **Not tested.** Elephant has the largest share of the locators (15 of 55) and Mac Lane–Moerdijk has 11. Neither text could be read, so the wording of 1.1–1.5, 2.1–2.3 and 3.2–3.4 and the page ranges were not compared with them.
- **Scope.** The route of 2.4 through the site of definable objects of a classifying site (`TauCetiRoadmap/ClassifyingTopoi/README.md` lines 772–793) is the roadmap's own argument. The cited sources prove definability only on the syntactic site. The description asks for a specialist's reading.
