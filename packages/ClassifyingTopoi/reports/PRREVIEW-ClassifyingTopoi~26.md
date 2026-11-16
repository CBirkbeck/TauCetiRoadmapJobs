# Review of ClassifyingTopoi (pull request #1997 at 6309116)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: "defines morphisms of topoi and their composition, in particular between sheaf topoi (Tag 00XA, `MorphismOfTopoi.lean`, `ToposDefs.lean`), the morphism of sheaf topoi of a morphism of sites (Tag 00XC, `MorphismOfTopoi.lean`)" (`TauCetiRoadmap/ClassifyingTopoi/README.md:1414–1416`).
- R02 — repaired: "`MorphismOfTopoiRing.lean` carries sheaves of commutative rings … (Tag 00YV) … Together they give 1.4 for the theory of commutative rings, without the local-ring sequent … No file name or tag there treats geometric formulas or their interpretation in a topos for an arbitrary theory (Layer 1)" (README 1418–1424).

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Tag pairing, README 1414–1416 | Stacks 00XA, 00XC; the attributes of `ToposDefs.lean` and `MorphismOfTopoi.lean` at c496df0 | 00XA = Def. 7.15.1 (morphisms, composition) ↔ `@[stacks 00XA]` on `SheafToposMorphism`, `.comp`; `MorphismOfTopoi`, `.comp` (SGA 4 IV 3.3.1). 00XC = Lemma 7.15.2 ↔ `IsMorphismOfSites.morphismOfTopoi` | Holds | — |
| 00YV ↔ `MorphismOfTopoiRing.lean`, README 1418–1419 | Stacks 00YV; the file's definitions | 00YV = Prop. 7.44.3, the adjoint pair `(f⁻¹, f_*)` on sheaves of rings and other structures. File: `inverseImageRing ⊣ pushforwardRing` on `Sheaf _ CommRingCat`; docstring: the commutative-ring case of 00YV | Holds | — |
| "identifies that inverse image with the ring object transported", README 1420–1421 | `inverseImageRing f`; `commRingObjObj_eq_sheafCommRingObj` | `inverseImageRing f` is `pullbackCommRingSheafFunctor J f.inverseImage` (`ToposCommRingImageAdjunction.lean`). The theorem equates `Φ.commRingObjObj O` with the ring object of `pullbackCommRingSheaf J Φ O` for `[PreservesFiniteProducts Φ] [Φ.Braided]` | Holds. Its `Braided` is the cartesian one (`mu_comp_prodComparison`) | — |
| 1.4 for commutative rings without the local sequent, README 1421–1422 (cites 457–466, 600–601) | `Φ` = stalk at 0 of `C(ℝ, ℝ)` on `ℝ` (left exact left adjoint); `Φ = X ↦ X × X` on `Type u` (finite products only), `M = ℤ/2` | Germs at 0: `x` is not a unit and `1 − x` (value 1) is a unit, so the ring is local. `(ℤ/2)²` satisfies the eight equations; at `x = (1,0)`: `x·(a,b) = (a,0) ≠ (1,1)` and `(1−x)·(a,b) = (0,b) ≠ (1,1)` | Finite products carry only the equations; locality needs 1.4's left exact left adjoint, as stated | — |
| "No file name or tag there treats … an arbitrary theory", README 1422–1426 | the `Topos/` listing at c496df0 (62 files) | `MorphismOfTopoiPolynomialEvaluation.lean`: polynomial evaluation on sheaves of commutative rings (Tag 04I6). `JointlyLocallyInhabited.lean`: covers, not local rings. No file treats arbitrary theories, classifying sites, Diaconescu or presheaf type | Holds | — |

The rows for the statements this change does not touch stand as in the previous review, of `8ab628d`.

- **Gate:** I reran it at 6309116: every text check is 0 and the result is OK. The worker's gate has `build=0`. Dependency check: `depcheck: 257 roadmaps, 2432 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty, and `git diff 8ab628d HEAD` touches only `README.md` (+12 −7).
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 28 `sorry` warnings and nothing else. `Suggested.lean` last changed at `258f897`, so the one-tactic probe and the `#check @` comparison stand.
- **External code opened, AxiomMath at c496df0:** the `Topos/` listing (62 files) and seven files: `MorphismOfTopoi`, `ToposDefs`, `MorphismOfTopoiRing`, `InverseImageCommRingObj`, `MorphismOfTopoiPolynomialEvaluation` and `JointlyLocallyInhabited`, plus `Algebra/Category/ModuleCat/Sheaf/ToposCommRingImageAdjunction`.
- **Stacks locators checked against the text:** 3 (00XA, 00XC, 00YV).
- **Cross-roadmap citations:** resolved in GrothendieckTopoi at its open head: 2.1 (its README 404), 2.2 (434) and 2.4 (479). Its provenance section (1643–1650) now pairs 00XC with `MorphismOfTopoi.lean` and 00XA with `ToposDefs.lean`, as this README does. The previous review's remark on its swapped pairing no longer applies.
- **Description against the head:** its Provenance paragraph names 00XA, 00XC and 04I9, and the 00YV ring-object files as 1.4 for commutative rings, in agreement with README 1414–1426. "Nothing outside the folder changes" holds; three files; 28 theorems. The seeded sample meets the changed passage only through its citation of 1.4.
- **Overlap check:** I read ToposTheoreticBridges (README 48–50 leave geometric theories, classifying sites and Morita equivalence to ClassifyingTopoi) and GrothendieckTopoi (its only classifying topos is `B G`, README 392) at their open heads. LocallyPresentableCategories, TotallyDistributiveTopoi, InfinitaryModelExistence, InfinitaryLogic and CountableModelCounting stand as read in the previous review. The changed passage maps external code and claims no object. Nothing is shared, and no id is dropped.
- **Source independence:** changed passages only. 5 passages compared with 2 sources (Stacks 00XA/00XC/00YV; the AxiomMath file docstrings), with at most 5 consecutive words shared ("of a morphism of topoi", a standard phrase). Largest share Elephant, 15 of 59 locators. No layer was added, removed or reordered, so the comparison of contents stands: independent.

## Not verifiable

- Mac Lane–Moerdijk X.3, pp. 533–539, and Elephant D1.2: these are the locators of 1.4, which the changed passage cites. Both are paywalled, the manifest records no copy, and they are cited by locator only.

## Source issues

- none

## For the human reviewers

- **Not tested.** Elephant has the largest share of the locators (15 of 59) and Mac Lane–Moerdijk has 11. Neither text could be read, so the wording of 1.1–1.5, 2.1–2.3 and 3.2–3.4 and the page ranges were not compared with them.
- **Scope.** The route of 2.4 through the site of definable objects of a classifying site (`TauCetiRoadmap/ClassifyingTopoi/README.md` lines 772–793) is the roadmap's own argument. The cited sources prove definability only on the syntactic site.
- **Licence.** README 1404–1429 maps two AI-written Lean repositories: AxiomMath Stacks (Apache-2.0, its README) and LeanPool (Apache-2.0 in its file headers; README 1465–1467 states no licence). Nothing in `Suggested.lean` is adapted from either.
