# Review of AlgebraicTopology (pull request #3170 at 57376f9)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 79 changed lines since `87e7f72`. The review covered the new §5.8, the new `Suggested.lean` theorem and the bookkeeping lines that cite §5.8. The new theorem is true and elaborates, and the three Checks hold. One finding blocks: §5.8's main target, the equivalence between pointed connected covers and the poset of subgroups of `π₁`, is described in `Suggested.lean` as impossible to state at the pins, but it can be stated through the category of elements of the pinned fibre functor, and a statement of that form elaborates. There are three small corrections (two about the §5.8 *Needs* line, one about the description) and one format note. Nothing is left for a human to decide.

## R01 (P2) — The §5.8 equivalence can be stated at the pins, so it should be in `Suggested.lean` rather than listed as unstatable

The point of §5.8, and of this pull request, is to upgrade the bare bijection to an equivalence of categories. As the file stands, the acceptance test checks only the bijection on degree-`n` classes. The module docstring (lines 86–88) gives the reason: the equivalence "needs a category of pointed connected covers, which the pins lack". That reason does not hold. The category §5.8 describes has objects (connected cover, point of the fibre over `x₀`) and morphisms the maps over `X` carrying point to point. That is exactly the category of elements, Mathlib's `CategoryTheory.Functor.Elements`, of the pinned fibre functor `TauCeti.CoveringSpace.fiberFunctor x₀` (`UniversalCover/Classification/FiberFunctor.lean:75`) restricted along `TauCeti.ConnectedCoveringSpace.forget X`. `Subgroup (FundamentalGroup X x₀)` is already a category through its order. The following statement elaborates at the pins with only the imports the file already has, and with a single `sorry` warning:

```lean
abbrev PointedConnectedCover {X : TopCat.{u}} (x₀ : X) :=
  (TauCeti.ConnectedCoveringSpace.forget X ⋙ TauCeti.CoveringSpace.fiberActionFunctor x₀ ⋙
    Action.forget (Type u) (FundamentalGroup X x₀)).Elements

theorem exists_pointedConnectedCover_equivalence (X : TopCat.{u}) [PathConnectedSpace X]
    [LocallyPathConnectedSpace X] [TauCeti.SemilocallySimplyConnectedSpace X] (x₀ : X) :
    ∃ E : PointedConnectedCover x₀ ≌ Subgroup (FundamentalGroup X x₀),
      ∀ c : PointedConnectedCover x₀, E.functor.obj c =
        (FundamentalGroup.mapOfEq ⟨c.1.proj, c.1.isCoveringMap_proj.continuous⟩ c.2.2).range := by
  sorry
```

The statement is a `Prop`, with no sorry'd data. The target category is thin, so fixing the functor on objects fixes the equivalence. The smallest repair has three parts:
- add this statement (or the same with `TauCeti.CoveringSpace.fiberFunctor x₀` and its module imported);
- replace the docstring sentence with a line naming the carrier;
- say in §5.8 (README line 1787) that the category is the category of elements of the fibre functor on connected covers.

## C01 — The §5.8 *Needs* line attributes the degree-`n` carriers to UniversalCovers, but they realise BelyiMaps §6.1

The line (README 1782–1784) lists `TauCeti.ConnectedPointedCover`, `TauCeti.ConnectedPointedCoverClass` and `mk_eq_mk_of_range_eq` "from the completed universal-covers roadmap". On main, these carriers are BelyiMaps §6.1's items (BelyiMaps README 2287–2294 and its *Tau Ceti:* line 2347), and the quotient classes are §6.3's (2620). The same holds for `markedClassEquiv` and `subgroupEquiv`, which §5.8 also uses. BelyiMaps consumes this roadmap (its Stage 1), so the attribution should not be turned into a supplier citation of BelyiMaps. Call these pinned Tau Ceti declarations, and keep "UniversalCovers" for the lifting criterion and the subgroup covers.

## C02 — The step "the degree is the index" is already pinned but is missing from the *Needs* line

The route derives the index-`n` slice using Hatcher, Proposition 1.32. A reader of the *Needs* line would take that step as work still to do. In fact it is Tau Ceti's `IsCoveringMap.card_fiber_eq_index` (`Topology/Homotopy/Monodromy/Basic.lean:301`), which states the number of points in the fibre of a path-connected cover equals the index of the recovered subgroup. Add it to the *Needs* line of §5.8.

## C03 — The description counts fifteen roadmaps; the title, the list and the head have sixteen

The description opens "This PR adds planned targets to fifteen roadmaps", but its bullet list names sixteen folders, matching the title and the folders the head changes. It would read "sixteen roadmaps".

## N01 — The two Hatcher locators in §5.8 lack pages

The text would read "Hatcher, Theorem 1.38, p.67" and "Hatcher, Proposition 1.32, p.61". Hatcher's remark on the partial ordering of covers, which supports the order-preserving part of the equivalence, is on p.68.

## Previous findings

- R01 (ClassifyingSpaces had no supplier-contract subsection): repaired. The README now has "### From TauCetiRoadmap.ClassifyingSpaces … Layer 1, items 1.1 and 1.2, the classification of pointed maps into an aspherical space" (lines 5630–5640).
- R02 (the description of an earlier pull request did not name ClassifyingSpaces as a supplier): not applicable. It concerned another pull request's text, and this change does not touch that supplier.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_connectedPointedCoverClass_equiv_index` (§5.8 slice) | X=point, n=1,2; S¹, n=3; S¹∨S¹, n=2,3 | point: 1/1 and 0/0; S¹: 1 class (z³)/1 subgroup (3ℤ); S¹∨S¹: 3/3, and 26 transitive pairs/2! = 13 / 13 index-3 subgroups | holds; one-tactic probe (`simp`, `exact?`, `aesop`) fails | C02 |
| same, n=0 (why `NeZero`) | S¹ | `ConnectedPointedCover x₀ 0` empty / `{H // H.index = 0}` = {⊥}, since `Subgroup.index` is 0 for infinite index | hypothesis needed, kept | none |
| §5.8 equivalence (README) | S¹; RP²; S¹∨S¹ with H and gHg⁻¹ | nℤ≤mℤ iff m∣n / z^(n/m) map exists iff m∣n; S²→RP² / 1≤ℤ/2; conjugates distinct pointed / distinct subgroups | true; statable via `Functor.Elements` (probe elaborates) | R01 |
| Check: universal cover initial, identity terminal | variance test | universal cover ↦ ⊥ (initial in the poset); id ↦ ⊤ (terminal); contravariant variant would swap them | true, tests direction | none |
| Check: connectedness needed | S¹⊔S¹→S¹ pointed in the first copy | recovered subgroup ℤ / identity cover ℤ; fibres 2 vs 1 points | true, not isomorphic | none |
| Thrice-punctured-sphere factorisation | types; n=1, 2 | `MarkedIsoClass n → ConnectedPointedCoverClass → {H // index n}` matches `subgroupEquiv`'s type; n=2: 3 marked classes / 3 index-2 subgroups of F₂ | consistent | C01 |
| Hatcher locators | Theorem 1.38, Proposition 1.32 | hatcher line 2977, p.67: path-connected, locally path-connected, semilocally simply connected; line 2707, p.61: X and cover path-connected | support the statements; order remark at line 3009, p.68 | N01 |

- Source locators checked against the text: 3 (hatcher lines 2707, 2977, 3009). None of the fifteen seeded targets (§§1.5, 3.4, 3.5, 4.6, 4.8, 4.10, 5.1, 5.2, 5.4, 5.6, 6.0, 8.1, 8.8c, 8.9, 8.12) lies in a changed or affected passage. No locator is flagged as unverified.
- Library declarations read at the pinned Tau Ceti (13 places):
  - `UniversalCover/Classification/`: `Pointed.lean` 101 and 153, `Existence.lean` 107, `RecoveredSubgroup.lean` 207, `NumberedFiber.lean` 156, 322 and 358, `Bijection.lean`, `FundamentalGroupAction.lean` 103, `FiberFunctor.lean` 75;
  - `Topology/Homotopy/Monodromy/Basic.lean` 301;
  - `ThricePuncturedSphere/SubgroupClassification.lean` 182 and `Classification.lean` 382.
  - No general index-`n` slice and no pointed equivalence exists at the pins.
- Cross-roadmap citations resolved: UniversalCovers (Completed) Stage 2 items 7–8; BelyiMaps on main §§6.1, 6.3 (2270–2347, 2506–2530).
- Ownership: UniversalCovers owns the bijection, which §5.8 consumes, and BelyiMaps owns the carriers. No roadmap on main or in an open pull request states the equivalence, so AlgebraicTopology owns it.
- Dependency check: `depcheck: 122 roadmaps, 1400 edges, 0 problem(s)`.
- Gate: the worker's checks all pass. My rerun without the pull request's folder list reports only `outside-folder=29`, and every one of those files lies in the sixteen folders this pull request owns.
- Elaboration: `lake env lean` on `Suggested.lean` gives 21 `sorry` warnings and nothing else. The elaborated type of the new theorem keeps all its binders (path-connected, locally path-connected, semilocally simply connected, `NeZero n`) and matches README 1786–1796. No other declaration changed.
- Record: no layer, item or id removed or retitled; the 10 deleted lines are all rewritten with additions. Overlaps: #2772 merges cleanly after this one; no dropped or revision-only ids.

Overlap check: read CharacteristicClasses, ClassifyingSpaces, DGFloer, DGFloerPartII, GeneralizedCohomology, StableHomotopyKTheory; nothing shared with §5.8 (StableHomotopyKTheory 2776 also assigns cover classification to UniversalCovers).

Source independence: 8 changed passages compared with 1 source (hatcher at 1.32, 1.38, p.68), none shared beyond the forced hypothesis list; largest share hatcher, 94 of 104 locators counted; contents not compared (no layer added, removed or reordered).

Research link: §8.5 owns the stable fundamental group at an end in the sense of Freedman–Quinn (fq1990, §7.7), and FourManifolds consumes it. §8.13 supplies the smoothing and transversality behind Thom's (1954, Chapter II) representation of low-codimension homology classes. §7.2's bundle formula is stated against Klein–Malkiewich–Ramzi (2022). This rests on the README (lines 3237–3238, 4164–4168, 2883).

## Not verifiable

- Nothing in the changed passages.

## Source issues

- none

## For the human reviewers

- none
