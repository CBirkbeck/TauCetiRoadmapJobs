# Review of ClassifyingSpaces (pull request #1807 at d524e59)

**Verdict:** needs changes

## R01 (P3) — The description leaves out the new supply edge AlgebraicTopology → ClassifyingSpaces, which the check reads as a loop of two

**Location.** The description's sentence "So is ClassifyingSpaces: the check reads its `TauCeti/AlgebraicTopology/` paths as citations." Its "Ownership moves" bullet lists what AlgebraicTopology gains but does not say that 8.8 and 8.14 now consume this roadmap.

**Claim.** At this head, AlgebraicTopology 8.8 and 8.14 obtain the pointed classification (Hatcher 1B.9) from items 1.1 and 1.2, and this README's new bullet lists them as consumers. The description of a loop-cutting pull request does not state this ownership move or the new supplier. The check also reads three ClassifyingSpaces lines as citations of AlgebraicTopology: lines 361 and 419 are Tau Ceti paths, and line 970 is Mathlib's `AlgebraicTopology.singularHomologyFunctor`, which is not a path. With the new edge, the check therefore reads the two roadmaps as a loop of two.

**Witness.** The check's `supplier_edges`, run on the two READMEs, gives:
- at 8a250a2: ClassifyingSpaces → AlgebraicTopology (units 360, 407, 954), and no edge back;
- at d524e59: the same, plus AlgebraicTopology → ClassifyingSpaces at AlgebraicTopology lines 4245 and 5148, the new *Needs:* lines.

**Repair.** Replace that sentence of the description with: "So is ClassifyingSpaces: the check reads its `TauCeti/AlgebraicTopology/` file paths and Mathlib's `AlgebraicTopology.singularHomologyFunctor` as citations, although it consumes only Mathlib and Tau Ceti. AlgebraicTopology 8.8 and 8.14 now take the pointed classification of maps into an aspherical space (Hatcher, Proposition 1B.9) from ClassifyingSpaces items 1.1 and 1.2, which lists them as consumers. The check therefore reads the two as a loop of two that no real supply closes." If the three README units are reworded so that the check no longer reads them (last bullet of *Verified sound*), drop the last sentence and the "So is ClassifyingSpaces" clause instead.

## R02 (P3) — The CharacteristicClasses consumer bullet says the `RP^∞` comparison does not go through this roadmap

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md:1195–1199`: "Its comparison of `RP^∞` with a classifying space of `ℤ/2` goes through the [algebraic-topology roadmap], Stage 8, item 8.8, not through this roadmap."

**Claim.** CharacteristicClasses C1.5a compares `RP^∞` with `Bℤ/2` by the pointed map that AlgebraicTopology 8.8's bijection assigns. At this head, 8.8 obtains that bijection from items 1.1 and 1.2, as the next bullet (line 1200) says. The clause "not through this roadmap" is therefore false.

**Witness.** `CharacteristicClasses/README.md:1033–1035`: "by the pointed map that AT8.8's bijection `[X,Bπ]_*≃Hom(π₁X,π)` … assigns to the isomorphism π₁(RP∞)≅ℤ/2". `AlgebraicTopology/README.md:4278–4279`: "obtain `[X,Bπ]_*≃Hom(π₁X,π)` from ClassifyingSpaces Layer 1, items 1.1 and 1.2".

**Repair.** Replace "goes through the [algebraic-topology roadmap](../AlgebraicTopology/README.md), Stage 8, item 8.8, not through this roadmap." with "is cited from the [algebraic-topology roadmap](../AlgebraicTopology/README.md), Stage 8, item 8.8, whose pointed map from `RP^∞` to the nerve model of `ℤ/2` is the case of items 1.1 and 1.2 described in the next bullet; the characteristic-classes roadmap cites no item of this roadmap directly."

Tested on `X = RP^∞`, which is path-connected Hausdorff CW, with target `Bℤ/2` (aspherical by AlgebraicTopology 8.8a) and `φ` the isomorphism. Items 1.1–1.2 give exactly one pointed class. It is the one C1.5a uses (table row 6).

## Previous findings

- R01 — repaired: `AlgebraicTopology/README.md:4277–4280` "For each connected pointed Hausdorff CW complex X obtain `[X,Bπ]_*≃Hom(π₁X,π)` from ClassifyingSpaces Layer 1, items 1.1 and 1.2, with target Bπ (aspherical by 8.8a)". *Needs:* line 4245 and line 149 are updated to match. The repair caused R01 and R02 above.
- R02 — repaired: the description now says "Its Stages 1–4 become Layers 1–2, with an item map". Its summary says "drops AlgebraicTopology and GeometricTopology", and its prose says "ClassifyingSpaces' drops 26 named declarations, adds three headlines".

## Verified sound

| Statement | Instance | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| New bullet: AlgebraicTopology 8.8 as items 1.1–1.2 with target `Bπ` | `π = S₃`, `X = S¹ ∨ S¹` | `|Hom(F₂, S₃)| = 36`; `[S¹∨S¹, BS₃]_* = π₁(BS₃)²`: 36 | holds | none |
| Same | `π = ℤ/2`, `X = T²` | `|Hom(ℤ², ℤ/2)| = 4`; `[T², RP^∞]_* = H¹(T²; ℤ/2)`: 4 | holds | none |
| New bullet: AlgebraicTopology 8.14, `n = 1` | `X = S¹`, `Y` = Warsaw circle `W` | `|Hom(ℤ, 1)| = 1`; `[S¹, W]_* = 1` (W weakly contractible). `W ≄ pt = B1`, so only items 1.1–1.2 cover this case | holds | none |
| Same | `X = RP²`, `Y = S¹` | `|Hom(ℤ/2, ℤ)| = 1`; `[RP², S¹]_* = H¹(RP²; ℤ) = 0`: 1 | holds | none |
| Hypotheses of 8.14 at `n = 1` against headline 1 | AlgebraicTopology CW = native `CWComplex` + `T2Space` (lines 258–259); `Y` path-connected, `π_i Y = 0` for `i > 1` | `[T2Space X]`, `CWComplex univ`, `PathConnectedSpace X`, any `x`; `IsAspherical Y y` = path-connected ∧ `π_(n+2)` trivial | match; universes independent | none |
| CharacteristicClasses C1.5a's pointed map (R02) | `X = RP^∞`, `π = ℤ/2`, `φ` iso | `|Hom(ℤ/2, ℤ/2)| = 2`; `[RP^∞, Bℤ/2]_* = H¹(RP^∞; ℤ/2)`: 2. `φ` goes to the nonzero class, through items 1.1–1.2 | through this roadmap | R02 |
| Supply as the check reads it (R01) | `supplier_edges`, CS and AT READMEs | main: CS→AT at line 96, no edge back. 8a250a2: CS→AT at 360, 407, 954, no edge back. d524e59: the same, plus AT→CS at 4245, 5148 | loop of two as read; real supply acyclic | R01 |

The rows for the untouched statements stand as in the previous review, of 8a250a2: headlines 2–4, the Checks of Layers 1–2 and the conventions.

- **Gate.** My run at d524e59 prints 0 for every content counter, including `depcheck=0`. Its only failure, `outside-folder=24`, counts the 24 files of the 12 sibling folders this pull request owns. With those folders and this one excluded, `git diff --stat origin/main...HEAD` is empty. The worker's gate, build included, passes.
- **Dependency check.** For ClassifyingSpaces: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`. For AlgebraicTopology at this head: `206 roadmaps, 1936 edges, 0 problem(s)`. Neither prints an UPWARD or CYCLE line; both roadmaps are on main, so a loop between them is not reported.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` exits 0 in 5 s. The only warnings are four `declaration uses 'sorry'` (lines 84, 102, 123 and 138). The file is unchanged since 8a250a2, so `signatures.md` stands.
- **Source locator re-read: 1.** `hatcher-at` lines 3905–3907, Proposition 1B.9, printed p. 90 (line 3884). It is the locator of the result that the new bullet's consumers, 8.8 and 8.14, cite.
- **Library declaration at the pin: 1.** `TauCeti.IsAspherical`, `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59`.
- **Cross-roadmap citations resolved at this head: 6.** AlgebraicTopology 8.8 (4245, 4277–4281), 8.14 (5148, 5164–5170), 146–150 and 258–259; CharacteristicClasses C1.5a (1032–1035, 1055) and 204–206. AlgebraicTopology's `Suggested.lean` declares no pointed-classification theorem, so the result has one owner.
- **Overlaps.** Unchanged: #1808 and #1854 change this folder after this pull request, by the shared-folder order. No open pull request drops an id this README cites. The *Stage and item numbers* list maps `#stage-2-the-cellular-model` (FreeGroupsAndLimitGroups, main line 29).
- **Remark.** The check reads the edge CS→AT only from README lines 361 and 419 (Tau Ceti paths) and line 970 (the Mathlib name in item 2.1's *Needs:*). A scratch copy that writes these as `../Homotopy/KillHomotopyGroups.lean`, `../EilenbergMacLane/Resolution.lean` and "its singular homology functor (*From Mathlib*)" reads no CS→AT edge.

## Not verifiable

- `brown-cohomology`, Chapter III §1 (items 2.1–2.3): uncertified, with no legal text. This passage is untouched since the previous review.
- `schwamberger-vogt-2009`, §2 (the Warsaw circle): uncertified. Only the table's negative instance uses it.
- `milnor-1956`, §3: uncertified. It is cited only for the pinned model.

## Source issues

- none
