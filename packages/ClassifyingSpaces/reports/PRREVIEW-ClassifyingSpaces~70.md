# Review of ClassifyingSpaces (pull request #3170 at f17d28c)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 40 changed lines since `87e7f72`. The change adds item 1.4 (the fundamental group is left adjoint to B on path-connected Hausdorff CW complexes) with one sentence each in the build guide, the scope and the `Suggested.lean` docstring; the folder is unchanged since the previous review, which left no finding. Checked again at the pins, the hom-equivalence, the counit, the full faithfulness of B and both Checks are correct. Accepted with no finding; two small corrections (the docstring names the wrong headlines for the hom-set bijection, and the supplier contracts omit the new item's inputs) and two format notes, none blocking. Nothing is left for a human to decide.

## C01 — The `Suggested.lean` docstring credits the hom-set bijection of item 1.4 to both Layer 1 headlines, but one headline alone supplies it

In the module docstring (`TauCetiRoadmap/ClassifyingSpaces/Suggested.lean`, lines 49–53) the adjunction's "hom-set bijections are the two Layer 1 headlines with target `TauCeti.classifyingSpace G`". A reader matching that sentence to the file looks for half of the bijection in the wrong theorem. The bijection `Hom(π₁(X, x), G) ≃ [X, BG]_*` is the existence clause and the uniqueness clause of the single headline `exists_continuousMap_mapOfEq_eq_of_isAspherical` (line 90) with `Y = BG`, as README 1.4 itself says ("a bijection by items 1.1 and 1.2"). The other Layer 1 headline, `exists_homotopyEquiv_of_isAspherical` (line 108, item 1.3), gives a homotopy equivalence of two `K(G, 1)` spaces, not a bijection of hom-sets. Would read: "its hom-set bijections are the existence and uniqueness clauses of `exists_continuousMap_mapOfEq_eq_of_isAspherical` with target `TauCeti.classifyingSpace G`".

The stated reason, "is data", covers the adjunction itself but not its existence, which is a proposition: `Nonempty ((P.ι ⋙ PointedHomotopyCat.fundamentalGroupFunctor) ⊣ P.lift classifyingSpaceHomotopyFunctor _)`, with `P` an `ObjectProperty` with a real body, elaborates at the pins with `sorry` as the only warning. Item 1.4 is not one of the README's headline theorems, so omitting it is the author's choice; the sentence would be accurate as "is a packaging of that headline and is not stated here", or the existence form could be stated.

## C02 — The supplier contracts and the *Needs:* line of item 1.4 do not record everything the item consumes

Item 1.4's *Needs:* line (README lines 490–493) names `TauCeti.PointedHomotopyCat` and `TauCeti.PointedHomotopyCat.fundamentalGroupFunctor` (pinned in `TauCeti/AlgebraicTopology/Homotopy/PointedHomotopyCat.lean`, lines 122 and 149) and Mathlib's `CategoryTheory.Adjunction` and `CategoryTheory.ObjectProperty.FullSubcategory`. None of the four appears under `## Exact supplier contracts`: the *From Tau Ceti* "Functoriality" bullet (line 1112) mentions the pointed homotopy category only in words, as the target of B, and lists no file for it, so a reader who takes that section as the inventory of what the roadmap consumes misses the category and its π₁ functor. The pull request's description says the dependency lists were updated where a section was added; here they were not.

The *Needs:* line in turn omits `TauCeti.isEilenbergMacLaneSpaceOne_classifyingSpace`, `TauCeti.classifyingSpaceFundamentalGroupMulEquiv` and the three instances `TauCeti.instPathConnectedSpaceClassifyingSpace`, `TauCeti.instCWComplexClassifyingSpace`, `TauCeti.instT2SpaceClassifyingSpace`, all of which the item's text uses. Add them to the *Needs:* line, and add one contract bullet for the pointed homotopy category (its file, the two declarations, and that its morphisms are classes of based maps up to homotopy relative to the base point) and one for the two Mathlib declarations.

## N01 — The scope sentence for item 1.4 sits under scope item 2 (pointed uniqueness, item 1.3), while the adjunction packages items 1.1 and 1.2

README lines 930–931. It would be easier to find at the end of scope item 1.

## N02 — The `G = 1` Check of item 1.4 does not tell pointed homotopy classes from free ones

Free classes into the contractible `B1` are also a point. A Check that separates them: `X = S¹`, `G = S₃` gives `Hom(ℤ, S₃)` with 6 elements and `[S¹, BS₃]_* = π₁(BS₃)` with 6, while the free classes are the 3 conjugacy classes.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.4 hom-equivalence `Hom(π₁(X,x), G) ≃ [X, BG]_*` (new) | `X = S¹`, `G = S₃`; `X = S²`; `G = 1` | 6 = 6 pointed (free: 3 conjugacy classes); `S²`: `Hom(1, G)` and `π₂(BG) = 0`, one element each; `G = 1`: 1 = 1 | holds on 𝒞; pointed classes needed | none |
| 1.4 morphisms of 𝒞 against 1.1/1.2 (new) | pin `PointedHomotopyCat.lean` 67, 87, 122, 149 | morphisms are classes modulo `HomotopicRel {basepoint}`; π₁ on maps is `FundamentalGroup.mapOfEq` | same relation and same induced map as the line-90 headline | none |
| 1.4 counit (new) | pin `HomotopyFunctor.lean` 119–148 | `homEquiv⁻¹(id_BG) = ψ_G ∘ π₁(id) = ψ_G`; pinned `hom.app G = classifyingSpaceFundamentalGroupMulEquiv G`, direction `B ⋙ π₁ ≅ 𝟭` | agree | none |
| 1.4 naturality (implicit) | `h : G → H`; pointed `g : X' → X` | `ψ_H ∘ π₁(Bh ∘ f) = h ∘ ψ_G ∘ π₁ f` by the pinned naturality square; `π₁(f ∘ g) = ψ⁻¹ ∘ φ ∘ π₁ g` | natural in both variables | none |
| 1.4 B fully faithful (new) | `G = ℤ`, `H = ℤ/2`; Mathlib `Adjunction.fullyFaithfulROfIsIsoCounit` | `[Bℤ, B(ℤ/2)]_* = Hom(ℤ, ℤ/2)`, 2 elements; pin has only `Faithful` (line 152) | true, and new relative to the pin | none |
| 1.4 B lands in 𝒞; existence form (new) | pin `Basic.lean` 151, `CWComplex.lean` 358, 365; a probe statement elaborated at the pins | three instances exist; `Nonempty (L ⊣ R)` with `ObjectProperty.lift` elaborates, `sorry` only | statable as a proposition | C01 |
| 1.4 Check `G = 1` (new) | `X = S¹` | `Hom(ℤ, 1)` one element; `B1` contractible, `[S¹, B1]_*` one element; free classes also one | true; passes for the unpointed variant too | N02 |
| 1.4 Check Warsaw circle (new) | `W`, `q : W → W/L ≅ S¹`, pinned `circleToClassifyingSpace : C(Circle, B(Multiplicative ℤ))` (`Circle.lean` 63) | `Hom(π₁W, ℤ)` one element; `[W, S¹] = Ȟ¹(W) = ℤ` with `[q]` a generator, so `c ∘ q` not null | true; separates the CW hypothesis | none |
| Build-guide and scope sentences (new) | README lines 71–74, 930–931 | "packages items 1.1 and 1.2 for the target `BG`": matches the hom-equivalence; scope restricted to path-connected Hausdorff CW | true | N01 |
| `Suggested.lean` docstring 49–53 (new) | headlines at lines 90, 108 | bijection = both clauses of line 90; line 108 with `Y = BG` gives a homotopy equivalence | misnames | C01 |
| 1.1, 1.2 (sample; cited by 1.4) | `hatcher-at` lines 3905–3907, 3912–3935 | Prop. 1B.9, p. 90: connected CW `X`, `Y` a `K(G,1)`, map unique up to homotopy fixing `x₀`; cells `n > 2` via contractible cover | locator and statement agree | none |
| 1.3 (sample) | `hatcher-at` lines 3897–3898, 3908–3911 | Thm 1B.8, p. 90; deduced from 1B.9 by inverse isomorphisms | agrees | none |
| 2.1, 2.2, 2.3 (sample, untouched) | `hatcher-at` lines 6474–6479; 14364–14370; 14373–14383 | §2.2 p. 148 `Hₙ(G)`; §3.H p. 328 `Cₙ(X̃) ⊗_π M` and `Hom_{ℤ[π]}(Cₙ(X̃), M)`; Ex. 3H.1 p. 329 trivial module, homology and cohomology | agree | none |
| Headline `exists_continuousMap_mapOfEq_eq_of_isAspherical` (unchanged) | `X = Y = S¹`, `φ = ×2` | `z ↦ z²` pointed, induces ×2; unique rel `{1}` since `[S¹, S¹]_* = ℤ` | matches 1.1/1.2 | none |
| Headline `exists_homotopyEquiv_of_isAspherical` (unchanged) | `X = S¹`, `Y = Bℤ` | `circleToClassifyingSpace`, pointed equivalence inducing the pinned identification | matches 1.3 | none |
| Headlines `nonempty_twisted(Co)homology_iso_group(Co)homology` (unchanged) | `X = S¹`, `G = ℤ`, `A = ℤ` trivial | `H₁(S¹; ℤ) = ℤ = H₁(ℤ, ℤ)`; `H¹(S¹; ℤ) = ℤ = H¹(ℤ, ℤ)` | match 2.3 | none |

- Source locators checked against the text: 7 (Hatcher pp. 90, 90–91, 148, 328 twice, 329 twice); the diff adds no locator.
- Library declarations opened at the pins: 11 in Tau Ceti (`PointedHomotopyCat.lean` 67, 87, 122, 149; `HomotopyFunctor.lean` 107, 119, 137, 152; `EilenbergMacLane.lean` 67, 104; `Circle.lean` 63; instances at `Basic.lean` 151, `CWComplex.lean` 358, 365) and Mathlib's `Adjunction.fullyFaithfulROfIsIsoCounit`. Every name the diff adds exists with the stated meaning.
- Cross-roadmap citations: the diff adds none; the tools report none unresolved.
- Dependency check: `depcheck: 113 roadmaps, 1290 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` gives four `sorry` warnings (lines 90, 108, 129, 144) and nothing else. The diff changes only the module docstring; the four elaborated signatures agree with the README statements and none lost a binder.
- Record: the README at the merge base has two layers; the head keeps both with their items and adds item 1.4 under a new id. No layer or item removed or renumbered; no `Suggested.lean` declaration removed.
- Earlier findings: the previous review left none; its two small corrections and two format notes stand unchanged, since the folder did not change.
- Automatic checks at this head: all passed. No change outside the folders the pull request declares. Pull request text: the ClassifyingSpaces line agrees with the head; its sentence on updated dependency lists is the subject of C02.

Overlap check: read AlgebraicTopology (this pull request's head, 8.8 and 8.14, and main), FinitenessAndDualityOfGroups, CohomologyOfGroups, UniversalCovers, StableHomotopyKTheory (by search); nothing shared. No roadmap states the adjunction of π₁ with B or the full faithfulness of B, so item 1.4 is owned here; the pinned `TauCeti.fundamentalGroupFunctor_map_bijective_cellularClassifyingSpace` is the bijection for maps out of the cellular model only.

Source independence: changed passages only: 5 passages (the statement of 1.4, its two Checks, the build-guide sentence, the scope sentence, the `Suggested.lean` paragraph) compared with 1 source (`hatcher-at` §1.B, pp. 90–91), none shared; largest share `hatcher-at`, 14 of 18 locators; the diff adds no layer, so the contents were not compared again.

Research link: Layer 1 is Proposition 1B.9 and Theorem 1B.8 of Hatcher (2002) for arbitrary base points and non-CW aspherical targets; Layer 2 identifies the (co)homology of any CW `K(G, 1)` with group (co)homology (Brown 1982, Ch. III), the comparison used to compute group cohomology from geometric models. Rests on the README's overview and downstream consumers.

## Not verifiable

- Brown, Chapter III, Section 1; Milnor 1956; Schwamberger–Vogt 2009, §2: settled as uncertified, cited by locator only; none is cited by the changed text.

## Source issues

- none

## For the human reviewers

- none
