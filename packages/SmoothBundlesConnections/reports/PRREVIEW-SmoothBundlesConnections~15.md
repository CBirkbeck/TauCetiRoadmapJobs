# Review of SmoothBundlesConnections (pull request #2127 at c1d15cd)

**Verdict:** accepted

No findings. Incremental re-review of the 97 lines changed since `06c60b8` (all in `TauCetiRoadmap/SmoothBundlesConnections/README.md`; `Suggested.lean` unchanged).

## Deferred findings

- D01 — stands

## Previous findings

- R01 — not repaired: deferred (D01)
- R02 — repaired: "**Refinement maps and homotopies.** Consume Tau Ceti's refinement maps of native Čech complexes"; the nine declarations are in the Tau Ceti supplier row and the `*Needs:*` line; the insertion formula survives only as a Check.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Refinement maps and homotopies (B6.1): direction and factors | `r : κ → ι`, `V a ≤ U (r a)`; identity; composite; empty index | pinned `cechComplexMap (φ : mk U ⟶ mk V) : Č(V,P) ⟶ Č(U,P)`, so `mk V ⟶ mk U` gives `Č(U) → Č(V)`; factor `φ.f ∘ a`; `(φ ≫ ψ) ↦ map ψ ≫ map φ`; empty cover: zero complex | agrees with the pin | none |
| Same: hypotheses | abelian A with `HasProducts.{w}`; `ι κ : Type w`; `Opens X` | pin asks `Preadditive A`, `HasProducts.{w} A`, `HasFiniteProducts C`, and `CategoryWithHomology A` for cohomology: all implied; no sheaf condition in any signature | README no weaker than the pin | none |
| Change of coefficients | additive `F : A ⥤ B`; finite-dimensional ℚ-spaces with an ℕ-indexed cover | pin: `Preadditive B`, `HasProducts.{w} B`, `F.Additive`, `PreservesLimitsOfShape (Discrete (Fin (n+1) → ι)) F`; `ℚ^ℕ` is not finite-dimensional, so excluded | agrees | none |
| Diagram over a system of covers | preorder J; good covers ordered by refinement | pin: `hE : i ≤ j → Nonempty (E j ⟶ E i)`, value `J ⥤ (Cᵒᵖ ⥤ A) ⥤ A`; `SmoothGoodCover.Index : Type`, cover index `ι : Type`, so `w = 0` fits `exists_smoothGoodCover_refining` | agrees | none |
| Check: sign of the homotopy on `U=(X,X)`, `V=(X)` | cochain `(2,5)`, r selecting 0, s selecting 1 | `T_r=2`, `T_s=5`; Mathlib `Homotopy f g`: `f = dH + Hd + g`, so `H(δ(2,5)) = 2−5 = −3`; insertion `h`: `(δ(2,5))_(0,1) = 5−2 = 3 = T_s−T_r`; `H⁰`: `{(a,a)} ≅ P(X)`, both maps the identity | sound; `h` is `Homotopy T_s T_r`, `−h` the other | none |
| Coefficient maps and the connecting morphism (`*Needs:*` only) | the cited "refinement maps" | resolves to the paragraph above, now Tau Ceti's `cechComplexMap` | sound | none |
| Downstream: ComplexKahlerGeometry 2.5 | main, lines 758 and 773 | "SmoothBundlesConnections B6 supplies scalar good-cover comparison"; `*Needs:*` "B6's scalar good-cover comparison" | README claim now matches main | none |

The rows for the untouched statements stand as in the previous review, of `06c60b8`.

- Source locators checked against the text: 1 in the changed passages (Stacks, *Cohomology of Sheaves*, §15, Tag 09UY, p. 24: stacks-cohomology lines 1065–1087; insertion formula with `c` before `c′`, as the Check has it).
- Library declarations opened at the pin: 12. Tau Ceti `CategoryTheory/Sites/SheafCohomology/Cech/Basic.lean`: `cechComplexMap` (278), `cechComplexMap_f_π` (285), `cechComplexMap_id` (293), `cechComplexMap_comp` (300), `cechComplexMap_naturality` (311), `cechComplexMapHomotopy` (377), `cechComplexHomologyMap_eq` (419); `Cech/Coefficients.lean`: `cechComplexFunctorMapIso` (139); `Cech/Colimit.lean`: `cechCohomologyDiagram` (92). Mathlib: `CategoryTheory.Limits.FormalCoproduct` (`CategoryTheory/Limits/FormalCoproducts/Basic.lean` 48), `CategoryTheory.cechComplexFunctor` (`CategoryTheory/Sites/SheafCohomology/Cech.lean` 65), `Homotopy.comm` (`Algebra/Homology/Homotopy.lean` 128).
- Cross-roadmap citations resolved: ComplexKahlerGeometry 2.5 on main and at the head of its open revision; no roadmap on main or open cites this roadmap for refinement maps (CharacteristicClasses and ImplicitAtlases cite TopologicalSheafCohomology TS1.1 for them).
- Gate rerun on this head: every counter 0, `OK`; the worker's run adds `build=0`. Dependency check: `depcheck: 265 roadmaps, 2585 edges, 0 problem(s)`. No file changed outside the folder.
- Elaboration: `Suggested.lean` elaborates with seven `sorry` warnings and nothing else; no Lean statement changed, so signatures and the padding probe stand as before.
- Pull request text read against this head: the summary block and the Layer 6 paragraph state the consumption of Tau Ceti's refinement maps, the nine names, the removal from the ownership list, the remaining Check, and what ComplexKahlerGeometry 2.5 consumes; no sentence contradicted, no change unstated.
- Overlap check: read ComplexKahlerGeometry, CharacteristicClasses, TopologicalKTheory, ManifoldOptimization, RiemannianManifoldsWithConvexBoundary, DifferentialGeometry, LieGroupoidsPoisson; soft/fine-sheaf acyclicity is shared with ComplexKahlerGeometry 2.5 (D01, owner B6.1); refinement maps of Čech complexes are no longer owned here (Tau Ceti's); nothing else shared. The other open pull request on this folder merges first and merges cleanly, as the description states.
- Source independence: changed passages only; 3 passages compared with 1 source (stacks-cohomology lines 1066–1087), none shared beyond the formula; largest share Kolář–Michor–Slovák, 26 of 78 locators, unchanged; no layer added, removed or reordered, so contents not compared again.

## Not verifiable

- Nothing in the changed passages. The items of the previous review (Kolář–Michor–Slovák body text, Kobayashi–Nomizu I, Lee, Freed, Schreiber–Waldorf) stand.

## Source issues

- **Misprint** in stacks-cohomology at §15, Tag 09UY, p. 24: the source says the refinement maps for `c` and `c′` satisfy `γ − γ′ = d∘h + h∘d` for its displayed insertion homotopy; it should be `γ′ − γ = d∘h + h∘d`, since in degree 0 `h(ds)_i = s_(c′ i) − s_(c i)`; affects nothing.

## For the human reviewers

- **Not tested.** The most-cited source is Kolář–Michor–Slovák (26 of 78 locators). Its contents page was read in the previous review; its body text was not searchable in the fetched extraction, so wording was not compared with it.
- **Scope of D01.** ComplexKahlerGeometry 2.5 (main lines 744 and 748; same sentences at the head of its open revision) still plans fine-implies-acyclic, which B6.1 owns here; the change it needs is in that folder, not this one.
