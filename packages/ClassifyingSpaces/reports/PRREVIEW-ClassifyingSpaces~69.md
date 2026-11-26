# Review of ClassifyingSpaces (pull request #3170 at 57376f9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 40 changed lines since `87e7f72`. The change adds item 1.4, the adjunction between π₁ and B on path-connected Hausdorff CW complexes, together with one sentence each in the build guide, the scope and the `Suggested.lean` docstring. Checked against the pinned pointed homotopy category and classifying-space functor, the hom-equivalence, the counit and the full faithfulness of B are all correct, and so are both Checks. Accepted, with no finding. There are two small corrections: the docstring names the wrong headlines for the hom-set bijection, and the supplier contracts omit the new item's inputs. There are also two format notes. Nothing is left for a human to decide.

## C01 — The `Suggested.lean` docstring credits the hom-set bijection of item 1.4 to both Layer 1 headlines, when only the first one supplies it

In the module docstring (`TauCetiRoadmap/ClassifyingSpaces/Suggested.lean`, lines 49–53), the adjunction's "hom-set bijections are the two Layer 1 headlines with target `TauCeti.classifyingSpace G`". The bijection `Hom(π₁(X, x), G) ≃ [X, BG]_*` is the existence and uniqueness clauses of the one headline `exists_continuousMap_mapOfEq_eq_of_isAspherical` (line 90), with `Y = BG`. README 1.4 says the same at line 485 ("a bijection by items 1.1 and 1.2"). The other Layer 1 headline, `exists_homotopyEquiv_of_isAspherical` (line 108, item 1.3), applied with target `BG` gives the comparison `c_X` of a `K(G, 1)`, not a hom-set bijection. A reader who matches the sentence against the file will look for the bijection in the wrong theorem. Would read: "its hom-set bijections are the existence and uniqueness clauses of `exists_continuousMap_mapOfEq_eq_of_isAspherical` with target `TauCeti.classifyingSpace G`".

The reason "is data" is also only half the story. The existence of the adjunction is a Prop. I elaborated `Nonempty ((P.ι ⋙ PointedHomotopyCat.fundamentalGroupFunctor) ⊣ P.lift classifyingSpaceHomotopyFunctor _)` at the pins, using one `ObjectProperty` with a real body. BelyiMaps in this same pull request states its adjunction in that form (`isRightAdjoint_res_subtype`). Item 1.4 is not among the README's headline theorems, so leaving it out is the author's choice. But the sentence would be accurate as "is a packaging of that headline and is not stated here", or the Prop form could be stated.

## C02 — The supplier contracts and the *Needs:* line do not record everything item 1.4 consumes

Item 1.4's *Needs:* line (README lines 490–493) cites `TauCeti.PointedHomotopyCat`, `TauCeti.PointedHomotopyCat.fundamentalGroupFunctor` (pinned in `TauCeti/AlgebraicTopology/Homotopy/PointedHomotopyCat.lean`), Mathlib's `CategoryTheory.Adjunction` and `CategoryTheory.ObjectProperty.FullSubcategory`. None of these appears under `## Exact supplier contracts` (*From Mathlib*, line 1047; *From Tau Ceti*, line 1080). The *From Tau Ceti* list does record, by file, every other pin outside the classifying-space directory, so a reader who uses it as the inventory of what the roadmap consumes misses the pointed homotopy category. The pull request's description says that the dependency lists were updated where a section was added, and these were not.

The *Needs:* line itself leaves out `TauCeti.isEilenbergMacLaneSpaceOne_classifyingSpace`, `TauCeti.classifyingSpaceFundamentalGroupMulEquiv` and the three instances `TauCeti.instPathConnectedSpaceClassifyingSpace`, `TauCeti.instCWComplexClassifyingSpace`, `TauCeti.instT2SpaceClassifyingSpace`, all of which the item's text uses. Add them to the *Needs:* line, and add a bullet for the pointed homotopy category (file, the two declarations, and that morphisms are classes up to homotopy relative to the base point) and one for the two Mathlib declarations.

## N01 — The scope sentence for item 1.4 sits under scope item 2 (pointed uniqueness, item 1.3), but the adjunction packages items 1.1 and 1.2, which are scope item 1

README lines 930–931. It would be easier to find at the end of scope item 1, "Maps into aspherical spaces".

## N02 — The `G = 1` Check of 1.4 cannot tell pointed homotopy classes from free ones

Free homotopy classes into the contractible space `B1` are also a point. A Check that tells them apart would take `X = S¹` and `G = S₃`. `Hom(ℤ, S₃)` has 6 elements and `[S¹, BS₃]_* = π₁(BS₃)` has 6, while free homotopy classes `S¹ → BS₃` are the 3 conjugacy classes. So the adjunction needs the pointed homotopy category.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.4 hom-equivalence `Hom(π₁(X,x), G) ≃ [X, BG]_*` (new) | `X = S¹`, `G = S₃`; `X = S²`; `X = pt ⊔ S¹` (excluded) | `6 = 6` pointed (free: 3); `S²`: `Hom(1, G)` and `π₂(BG) = 0` one element each; `pt ⊔ S¹`: `1` vs conjugacy classes | holds on 𝒞; pointed classes and path-connectedness both needed | none |
| 1.4 morphisms of 𝒞 (new) | pin `PointedHomotopyCat.lean` 67, 122, 142, 149 | morphisms = classes up to `HomotopicRel {basepoint}`; π₁ functor is `mapOfEq` | matches 1.1/1.2 conclusions | none |
| 1.4 counit (new) | pin `HomotopyFunctor.lean` 119–141 | counit `= homEquiv⁻¹(id_BG) = ψ_G ∘ π₁(id) = ψ_G`; pinned `hom.app G = classifyingSpaceFundamentalGroupMulEquiv G` | agree, direction `B ⋙ π₁ ⟶ 𝟭` | none |
| 1.4 naturality in `G` and in `X` (implicit) | `h : G → H`, pointed `g : X' → X` | `ψ_H ∘ π₁(Bh ∘ f) = h ∘ ψ_G ∘ π₁ f` (pinned square); `f ∘ g` induces `ψ⁻¹ ∘ φ ∘ π₁ g` | natural | none |
| 1.4 B fully faithful (new) | Mathlib `Adjunction.fullyFaithfulROfIsIsoCounit`; `G = ℤ`, `H = ℤ/2` | counit iso ⇒ right adjoint fully faithful; `[Bℤ, B(ℤ/2)]_* ≅ Hom(ℤ, ℤ/2)`, 2 elements | true; the pin has `Faithful` only | none |
| 1.4 B lands in 𝒞; Prop form (new) | pin `Basic.lean` 151, `CWComplex.lean` 358, 365; elaborated at the pins | `ObjectProperty.lift` and `Nonempty (L ⊣ R)` elaborate, `sorry` only | statable at the pins | C01 |
| 1.4 Check `G = 1` (new) | `X = S¹` | `Hom(ℤ, 1) = 1`; `B1 = EG` contractible, `[S¹, B1]_* = 1` | true; unpointed variant also passes | N02 |
| 1.4 Check Warsaw circle (new) | `W`, `q : W → W/L ≅ S¹`, `c = circleToClassifyingSpace` (pin `Circle.lean` 63, `C(Circle, B(Multiplicative ℤ))`) | `Hom(π₁W, ℤ) = 1`; `c ∘ q` not null: `c` homotopy equivalence, `q*` iso on Čech `Ȟ¹ = ℤ` | true; detects CW hypothesis | none |
| Scope sentence (new) | lines 930–931 | adjunction to the corestriction of B to 𝒞, scoped "on path-connected Hausdorff CW complexes" | true | N01 |
| `Suggested.lean` docstring 49–53 (new) | headlines at lines 90, 108 | bijection = line 90 only; line 108 with `Y = BG` gives `c_X` | misnames | C01 |
| 1.1, 1.2 locator (sample; cited by 1.4) | `hatcher-at` line 3905–3931 | 1B.9, p. 90: connected CW `X`, `Y` a `K(G,1)`, unique up to homotopy fixing `x₀`; cells `n > 2` use contractible cover only via `π_{n−1}` | agrees | none |
| 1.3 locator (sample) | `hatcher-at` line 3897 | 1B.8, p. 90: homotopy type of a CW `K(G,1)` determined by `G` | agrees | none |
| 2.1, 2.2, 2.3 locators (sample, untouched) | `hatcher-at` lines 6479, 14349–14370, 14373–14383 | §2.2 p. 148 `Hₙ(G)`; §3.H p. 328 chain and cochain definitions; Ex. 3H.1 p. 329 trivial module, both directions | agree | none |
| Headline `exists_continuousMap_mapOfEq_eq_of_isAspherical` (unchanged) | `X = Y = S¹`, `φ = ×2` | `z ↦ z²` pointed, degree 2; uniqueness rel `{1}` | matches 1.1/1.2 | none |
| Headline `exists_homotopyEquiv_of_isAspherical` (unchanged) | `X = S¹`, `Y = B(ℤ)`, `e` pinned | `circleToClassifyingSpace`, pointed, induces identity | matches 1.3 | none |
| Headlines `nonempty_twisted(Co)homology_iso_group(Co)homology` (unchanged) | `S¹`, `G = ℤ`, `A = ℤ` trivial | `H₁(S¹; ℤ) = ℤ = H₁(ℤ, ℤ)`; `H¹ = ℤ = H¹(ℤ, ℤ)` | match 2.3 | none |

- Dependency check: `depcheck: 122 roadmaps, 1388 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` gives four `sorry` warnings only (lines 90, 108, 129, 144). The diff changes only the docstring. The elaborated signatures agree with the README statements, and the one-tactic probe of the unchanged declarations stands as in the earlier reviews.
- Library declarations opened at the pins: 12 (`PointedHomotopyCat.lean` 67, 87, 122, 142, 149; `HomotopyFunctor.lean` 79, 107, 119, 137, 152; `EilenbergMacLane.lean` 67, 104; `Circle.lean` 63; instances at `Basic.lean` 151, `CWComplex.lean` 358, 365; Mathlib `Adjunction.fullyFaithfulROfIsIsoCounit`). Every name the diff adds exists with the stated meaning.
- Source locators checked against the text: 7 (Hatcher pp. 90, 90–91, 148, 328 twice, 329 twice). The diff adds none.
- Earlier findings: the previous review of this folder left none open.
- Automatic checks at this head: every check passed. No change outside the pull request's declared folders.
- Pull request text: the ClassifyingSpaces line ("new §1.4: `π₁ ⊣ B` … with counit …") agrees with the head; the claim that dependency lists were updated is addressed in C02.

Overlap check: read AlgebraicTopology (this pull request's head, items 8.8 and 8.14), FinitenessAndDualityOfGroups, CohomologyOfGroups, UniversalCovers, StableHomotopyKTheory (by search). No roadmap states the adjunction π₁ ⊣ B or the full faithfulness of B, so item 1.4 is owned here. The bijection with the nerve model `Bπ` (AlgebraicTopology 8.8) consumes items 1.1 and 1.2 and does not restate them. Nothing is shared.

Source independence: changed passages only. 5 passages (the statement of 1.4, its two Checks, the build-guide sentence, the scope sentence, the `Suggested.lean` paragraph) compared with 1 source (`hatcher-at` §1.B, pp. 90–91); none shared. Largest share `hatcher-at`, 14 of 18 locator mentions. The diff adds an item and no layer, so the contents were not compared again (independent in earlier reviews).

Research link: Layer 1 is Hatcher's Proposition 1B.9 and Theorem 1B.8 (Hatcher 2002) for arbitrary base points and non-CW aspherical targets. Layer 2 is the identification of the (co)homology of any CW `K(G, 1)` with group (co)homology (Brown 1982, Ch. III), the comparison used to compute group cohomology from geometric models. This rests on the README's motivation and its downstream consumers.

## Not verifiable

- Brown, Chapter III, Section 1; Milnor 1956; Schwamberger–Vogt 2009, §2: settled as uncertified and cited by locator only.

## Source issues

- none

## For the human reviewers

- none
