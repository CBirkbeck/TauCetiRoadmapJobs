# Review of ClassifyingTopoi (pull request #1997 at 373af3b)

**Verdict:** accepted

## Previous findings

- R01 — repaired: the description now reads "A later commit states the definability of 2.4 (`IsClassifyingSite.exists_interp_eq_of_subobject`) for every classifying site in every universe, … The two commits after it make the route of 2.4 take the `u`-smallness of subobject lattices from GrothendieckTopoi 1.2 …".

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 2.4 `IsClassifyingSite.exists_interp_eq_of_subobject` (`Suggested.lean:330`, README 761–764), named in the repaired sentence | `objectTheory` with 3.2's `genericObject` on `(FintypeCat.Skeletonᵒᵖ, ⊥)`; `n = 0, 1, 2` | Subfunctors closed under all maps of finite sets. `U⁰ = 1`: `∅`, `{X ≠ ∅}`, all (3). `U¹`: `∅`, all (2). `U²`: `∅`, diagonal, all (3) | definable as `bot`, `ex top`, `top`; `bot`, `top`; `bot`, `equal x₀ x₁`, `top`. `x₀ ≠ x₁` is not closed under maps. Lean generality equals README's | — |
| 2.5 converse `IsClassifyingSite.exists_quotient_theory` (`Suggested.lean:348`, README 839–841), named in the description | `objectTheory` on `(FintypeCat.Skeletonᵒᵖ, ⊥)` with `J' = ⊥` and with `J' = ⊤` | `J' = ⊥`: `T' = T`. `J' = ⊤`: the empty sieve covers, so only terminal sheaves; `T' = {⊤ ⊢ bot}` forces `1 ≤ 0` in `Subobject 1`, so `1 ≅ 0` | holds: a model of `T'` exists only in a degenerate topos, where the unique functor is a left exact left adjoint | — |

The rows for the statements this change does not touch stand as in the previous review, of `08e6c9a`.

- Gate rerun at 373af3b: every check is 0, OK, and the worker's gate has `build=0`. Dependency check: `depcheck: 246 roadmaps, 2241 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `git diff 08e6c9a 373af3b` is empty. Nothing outside the folder differs from origin/main.
- Elaboration: `lake env lean` on `Suggested.lean` gives 28 `sorry` warnings (28 theorems) and nothing else, at Mathlib `1b1ccf4` and Tau Ceti `2fd255d`. `Suggested.lean` last changed at `258f897`, so the one-tactic probe and the `#check @` comparison stand.
- Description against the head: 28 theorems; module form (`Suggested.lean:1–4`, `50`); the two unstated parts (docstring 34–39); universes (docstring 40–43, `Suggested.lean:330`); `Shrink` and `WellPowered` (README 235–236); `isSheaf_Γ` and `Scheme.Ga` for 4.2 (README 1325–1326); `SetModel.forget` (`Suggested.lean:577`). All agree.
- Cross-roadmap citations resolved at GrothendieckTopoi's head `46fa6f3`: Conventions 1 (117) and 4 (138); 1.1 (287); 1.2 (309, with `IsGrothendieckTopos.wellPowered` at its `Suggested.lean:127`); 1.4 (357); the Examples of Layer 1 (388); 2.1 (404); 2.2 (`homEquivInverse`, its Lean 231); 2.4 (`ofContinuous`, 270); 2.5 (`IsFiltering`, 296); 4.1 (650); 4.2 (672); 6.1 (946); 6.5 (1053); 6.6 (1088). LocallyPresentableCategories 1.5 (its README 361) at `a051ce9`. InfinitaryModelExistence 5.1 on main (its README 542).
- Seeded sample: none of the 15 targets lies in a changed passage, since the folder did not change. Source locators checked against a text this round: 0.
- Overlap check: read ToposTheoreticBridges (`62e6753`: README 48–50 leave geometric theories, classifying sites and Morita equivalence to this roadmap), GrothendieckTopoi (README 111, 1629) and LocallyPresentableCategories (README 91, 985) (both put classifying topoi of geometric theories out of scope), TotallyDistributiveTopoi, InfinitaryModelExistence, InfinitaryLogic and CountableModelCounting (no mention). Nothing is shared, and this roadmap owns its objects. No other pull request changes this roadmap, and no id is dropped or defined only by an open revision.
- Source independence: changed passages only. 0 passages compared with 0 sources: the folder did not change, and the repaired description sentence cites no source. No layer was added, removed or reordered, so the arrangement stands as in the previous review: largest share Elephant, 15 of 55 locators; contents independent.

## Not verifiable

- none for this change. The paywalled texts (Elephant, Mac Lane–Moerdijk, Makkai–Reyes, Hakim 1972) are cited only in passages this change does not touch.

## Source issues

- none

## For the human reviewers

- **Not tested.** Elephant has the largest share of the locators (15 of 55) and Mac Lane–Moerdijk has 11. Neither text could be read, so the wording of 1.1–1.5, 2.1–2.3 and 3.2–3.4 and the page ranges were not compared with them.
- **Scope.** The route of 2.4 through the site of definable objects of a classifying site (`TauCetiRoadmap/ClassifyingTopoi/README.md` lines 772–793) is the roadmap's own argument. The cited sources prove definability only on the syntactic site. The description asks for a specialist's reading.
