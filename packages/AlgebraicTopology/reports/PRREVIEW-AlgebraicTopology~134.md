# Review of AlgebraicTopology (pull request #3170 at 4aaba98)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 101 changed lines since `87e7f72`. The review covered the new §5.8, the three new declarations of `Suggested.lean`, and the bookkeeping lines that cite §5.8. The previous review's finding is repaired: the equivalence between pointed connected covers and the poset of subgroups of `π₁` is now stated through the category of elements of the pinned fibre functor, it elaborates, and it holds on every instance computed. No finding remains. There is one small correction (a sentence of the description) and one format note, neither blocking. Nothing is left for a human to decide.

## C01 — The description says categories and equivalences are listed as not statable, but this folder now defines the category and states the equivalence

The general paragraph of the description says "data (categories, functors, equivalences) is listed there as not statable". For this folder the head does the opposite: `Suggested.lean` defines `PointedConnectedCover` with a real body (lines 133–135) and states the equivalence as an existence statement (line 141), and its module docstring lists nothing of §5.8 as not statable. The AlgebraicTopology bullet of the description is right; only the general sentence is out of date. It would read: "data (categories, functors, equivalences) is listed there as not statable, except where a carrier at the pin lets it be stated (AlgebraicTopology §5.8)".

## N01 — "Item 8" in the Layer 5 introduction names an item the stage mapping does not have

The Layer 5 introduction (README line 1299) calls the new section "Item 8", while the mapping at lines 104–106 says Stage 5 has items 1–7 and lists §5.8 beside §5.0 as a section. "§5.8, pointed covers and subgroups, consumes only …" would match.

## Previous findings

- R01 (the §5.8 equivalence is statable at the pins and should be in `Suggested.lean`): repaired. The file now has "abbrev PointedConnectedCover … (… ⋙ TauCeti.CoveringSpace.fiberActionFunctor x₀ ⋙ Action.forget …).Elements" and "theorem exists_pointedConnectedCover_equivalence"; the docstring sentence is replaced by "The category of pointed connected covers of §5.8 is the category of elements …"; README §5.8 says "the category of elements of the fibre functor over x₀ on connected covers".
- C01 (carriers attributed to UniversalCovers): repaired. The *Needs* line now reads "and the pinned Tau Ceti degree-`n` carriers `TauCeti.ConnectedPointedCover` …", after "from the completed universal-covers roadmap;" closes the lifting criterion and subgroup covers.
- C02 (the degree is the index, missing from *Needs*): repaired: "the count `IsCoveringMap.card_fiber_eq_index` (the degree is the index)".
- C03 (fifteen roadmaps): repaired: "This PR adds planned targets to sixteen roadmaps."
- N01 (pages): repaired: "Hatcher, Theorem 1.38, p.67, with the partial order of covers on p.68" and "Proposition 1.32, p.61".

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_pointedConnectedCover_equivalence` (§5.8) | X = point; S¹; S¹∨S¹ with H, gHg⁻¹ of index 3; RP² | point: 1 object, 1 map / 1 subgroup; S¹: pointed map zⁿ→zᵐ exists iff m∣n / nℤ ≤ mℤ iff m∣n; conjugates: no pointed map / incomparable; S²→RP²: ⊥ ≤ ⊤ | holds; covariant direction right; one-tactic probe (`rfl`, `simp`, `infer_instance`, `exact?`) fails | none |
| `PointedConnectedCover` (definition) | object and morphism unfolded; disconnected cover | object = (connected cover, point of `proj ⁻¹' {x₀}`), map = map over X with F(f)e = e′; S¹⊔S¹ excluded by `ConnectedSpace` | the intended category; `Type (u+1)` | none |
| `exists_connectedPointedCoverClass_equiv_index` | point n=1,2; S¹ n=3; S¹∨S¹ n=2 | 1/1 and 0/0; 1 class (z³) / 1 subgroup (3ℤ); 3 pointed double covers / 3 index-2 subgroups of F₂ | holds; probe fails | none |
| same at n = 0 (why `NeZero`) | S¹ | `ConnectedPointedCover x₀ 0` empty (fibre ≃ `Fin 0` but holds the chosen point) / `{H // H.index = 0}` ∋ ⊥ | hypothesis needed | none |
| Check: universal cover initial, identity terminal | variance | universal cover ↦ ⊥ (least), identity ↦ ⊤ (greatest); a contravariant functor would swap them | true, tests direction | none |
| Check: connectedness needed | S¹⊔S¹→S¹ pointed in first copy | recovered subgroup ℤ / identity cover ℤ; fibres 2 points vs 1 | true | none |
| Thrice-punctured-sphere factorisation | types | `subgroupEquiv : MarkedIsoClass n ≃ {H // H.index = n}`; `markedClassEquiv : ConnectedPointedCoverClass basePt n ≃ MarkedIsoClass n`; composite slice ∘ markedClassEquiv⁻¹ has the type of `subgroupEquiv` | consistent | none |
| Hatcher locators of §5.8 | Thm 1.38, Prop 1.32, order remark | hatcher line 2977 on printed p.67 (three hypotheses as in §5.8); line 2707 on p.61 (X and cover path-connected); line 3009 on p.68 | support the statements | none |

- Source locators checked against the text: 3 (hatcher lines 2707, 2977, 3009, with printed pages 61, 67, 68). None of the fifteen seeded targets lies in a changed or affected passage; no locator is flagged as unverified.
- Library declarations opened at the pinned Tau Ceti: `Topology/Covering/Category.lean` 412 (`ConnectedCoveringSpace`, `ConnectedSpace` total space); `UniversalCover/Classification/FundamentalGroupAction.lean` 103; `NumberedFiber.lean` 156, 322, 358; `Pointed.lean` 101, 153; `Existence.lean` 107; `RecoveredSubgroup.lean` 207; `Topology/Homotopy/Monodromy/Basic.lean` 301; `ThricePuncturedSphere/SubgroupClassification.lean` 182; `ThricePuncturedSphere/Classification.lean` 382. No category of elements, no equivalence with `Subgroup` and no general index-`n` slice exists at the pin.
- Ownership: searched the open heads and main for pointed connected covers and the category of elements of the fibre functor; MorseNovikov (open) and UniversalCovers (Completed) cite or state only the bijection, and no sibling folder of this pull request cites or restates §5.8. AlgebraicTopology owns the equivalence and the slice.
- Dependency check: `depcheck: 115 roadmaps, 1323 edges, 0 problem(s)`.
- Automatic checks: all passed on this head.
- Elaboration: `lake env lean` on `Suggested.lean` gives 22 `sorry` warnings and nothing else. The elaborated types of the two new theorems keep every binder (path-connected, locally path-connected, semilocally simply connected, `NeZero n`) and agree with README §5.8.
- Record: no layer, item or id removed or retitled; one heading added (§5.8). Overlaps: the one other open pull request changing this folder merges cleanly and the description orders it after this one; no dropped or revision-only ids.

Overlap check: read CharacteristicClasses, ClassifyingSpaces, DGFloer, DGFloerPartII, GeneralizedCohomology, StableHomotopyKTheory; nothing shared with §5.8.

Source independence: changed passages only; 8 passages compared with 1 source (hatcher at Proposition 1.32, Theorem 1.38 and p.68), none shared beyond the forced list of three hypotheses; largest share hatcher, about 100 locators; contents not compared (no layer added, removed or reordered).

Research link: §8.5 owns the stable fundamental group at an end of Freedman–Quinn (1990, §7.7); §8.13 gives smooth representatives of low-codimension homology classes after Thom (1954); §7.2's bundle formula for the Euler characteristic is stated against Klein–Malkiewich–Ramzi (2022). Rests on the README (lines 2888, 3243, References).

## Not verifiable

- Nothing in the changed passages.

## Source issues

- none

## For the human reviewers

- none
