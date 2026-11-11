# Review of ClassifyingSpaces (pull request #1807 at e65eef3)

**Verdict:** needs changes

This is an incremental re-review: 54 changed lines since 35d5208. They come from one commit, afdd14a. That commit rewrites two passages of `TauCetiRoadmap/ClassifyingSpaces/README.md`: the nerve-model bullet of *Scope and ownership* (lines 75–91) and the first *Downstream consumers* bullet (lines 1191–1201). It also changes one docstring line of `Suggested.lean` (line 49).

Other changes since 35d5208:
- The three other commits touch BordismFormalGroups, RigidAnalyticGeometry and TopologicalKTheory. None of them mentions this roadmap.
- `git diff --stat 35d5208 HEAD -- TauCetiRoadmap/AlgebraicTopology TauCetiRoadmap/CharacteristicClasses` is empty. The AlgebraicTopology folder in this pull request is the one r60 read.

The previous finding R01 is partly repaired and is carried below. The repair introduced no new problem.

## R01 (P2) — Hatcher 1B.9 still has two owners, and the claim that AlgebraicTopology 8.8b consumes Layer 1 is still false at this head and on main (carried from r60 R01)

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md`:
- line 83: "item 1.3 for the pointed homotopy equivalence), which that item consumes";
- lines 85–86: "is owned here, not in the algebraic-topology roadmap";
- lines 1193–1196: "Its inputs from this roadmap are Layer 1: item 1.1 … item 1.2 … and item 1.3".

**What the repair fixed.** Step 3 of r60's repair is done. Lines 75–79 and 1191–1192 now name only Milnor's model `TauCeti.classifyingSpace G`, which agrees with main's 8.8b, `c_G : Bπ ≃ classifyingSpace π` (main `AlgebraicTopology/README.md:3707`). The classification hypotheses (lines 84 and 1198) now match headline 1's binders.

**What still fails.** Steps 1–2 were not done, and the consumer claim at line 83 was kept.

**Witness.** This head's `AlgebraicTopology/Suggested.lean:693` still states `exists_mapOfEq_eq_of_isAspherical_cwComplex`, which is headline 1 binder for binder. Its README (lines 100–107 and 2857) says this roadmap "consumes that classification" and "owns no second proof of it".

Further witnesses, all re-read today:
- **The comparison is handed back and forth.** This head's `AlgebraicTopology/README.md:94–99` and `:2825–2829` say ClassifyingSpaces owns the normalised comparison of the bar model with the Milnor and presentation models. Line 76 here says that comparison belongs to AlgebraicTopology 8.8a–8.8b.
- **Main does not consume Layer 1.** Main's `AlgebraicTopology/README.md:139` says "nothing of it is consumed here". At lines 3707–3711 it makes `c_G` pointed itself, along the path given by the pinned `TauCeti.IsAspherical.exists_homotopyEquiv`. At lines 3720–3722 it proves `[X,Bπ]_*≃Hom(π₁X,π)` itself. Its 8.8b row (line 4691) lists only "Layer 8.8a bar model" and Tau Ceti as inputs.
- **This head does not consume Layer 1 either.** This head's 8.8b row (`AlgebraicTopology/README.md:3314`) lists "8.8a bar model, 4, 8.5", and lines 2854–2856 say its classification needs "nothing else of this roadmap".
- **The grep.** `roadmaps grep --fixed 'HomotopicRel f g {x}'` (index of 2026-11-11) returns:
  - #1807: `AlgebraicTopology/Suggested.lean:701` and `ClassifyingSpaces/Suggested.lean:92`;
  - #1808: `ClassifyingSpaces/Suggested.lean:90`;
  - #1854: `AlgebraicTopology/Suggested.lean:647`;
  - main: no hit.
- **The conflict.** `git merge-tree --write-tree HEAD origin/main` still reports conflicts in `AlgebraicTopology/README.md` and `AlgebraicTopology/Suggested.lean`. The pull request's own order puts #1652 (merged, 9ecced85) before this one for that folder.

**Repair.** Finish r60's repair. The AlgebraicTopology folder belongs to this pull request, and the two READMEs must say the same thing.
1. **Rebase.** Rebase this pull request's `AlgebraicTopology` folder onto main. When resolving the conflicts, drop these, since main's `AlgebraicTopology/Suggested.lean` does not state the theorem:
   - `exists_mapOfEq_eq_of_isAspherical_cwComplex` (this head's `AlgebraicTopology/Suggested.lean:685–702`, with its section comment);
   - its README mentions (this head's lines 556, 2833 and 2857);
   - the sentences at lines 94–107 and 2825–2829 that hand the bar/Milnor comparison to ClassifyingSpaces.
2. **AlgebraicTopology README.** In the rebased file, using main's line numbers:
   - line 139: replace "nothing of it is consumed here" by "Layer 8.8b consumes its Layer 1, items 1.1–1.3, and nothing else of it";
   - lines 3707–3711: take the pointed, π₁-normalised `c_G` from ClassifyingSpaces item 1.3 (items 1.1–1.2 for the map and its pointed uniqueness), instead of the path upgrade;
   - lines 3720–3722: obtain `[X,Bπ]_*≃Hom(π₁X,π)` for a path-connected pointed Hausdorff CW complex `X` as ClassifyingSpaces items 1.1–1.2 with the bar model as target. Main says "connected pointed CW complex", which lacks the Hausdorff hypothesis of headline 1. Keep the conjugation-orbit description and the componentwise treatment;
   - line 4691: add "ClassifyingSpaces Layer 1 items 1.1–1.3" to the 8.8b inputs.

An equivalent repair keeps main's path-based normalisation at lines 3707–3711. In that case drop item 1.3 from line 83 and lines 1195–1196 here, so that this README claims only items 1.1–1.2, for the classification. Step 1, and the line 139 and 3720–3722 edits of step 2, are still needed.

**Checked against the refuting instance.**
- After step 1 the grep has one #1807 hit, `ClassifyingSpaces/Suggested.lean:92`.
- The only edge between the two roadmaps is then AlgebraicTopology → ClassifyingSpaces. This README cites nothing of AlgebraicTopology as a supplier (line 86), so the edge creates no cycle. Today's dependency check is `0 problem(s)`.
- #1808 and #1854 merge after this pull request (shared-folder order) and follow when they rebase.

## Previous findings

- R01 — partly repaired: lines 75–79 and 1191–1192 now name Milnor's model alone. Line 83 still says "which that item consumes", lines 1193–1196 still list items 1.1–1.3, and `AlgebraicTopology/Suggested.lean:693` still states 1B.9. Carried as R01.

## Verified sound

**Gate and build.**
- The worker's gate at e65eef3 passes every check, including `build=0`.
- My own run, `gate … ClassifyingSpaces --base origin/main`, prints `0` for every content counter, including `set_option`, `sorry-data`, `statement-hygiene`, `readme-ids-missing`, `depcheck`, `stray-files` and `source-material`.
  - Its one failing counter is `outside-folder=26`: two files in each of the 13 sibling folders that the brief names as this pull request's own.
  - `git diff --stat origin/main...HEAD`, with those folders and this one excluded, is empty (exit 0).
- The dependency check (`gate --depcheck … --movable --content … --pr 1807`) prints `depcheck: 236 roadmaps, 2135 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- `lake env lean TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` exits 0 in 4 s. Its only warnings are four `declaration uses 'sorry'`, at lines 84, 102, 123 and 138.
- In a scratch copy, `#check @` of all four headlines prints types identical to `signatures.md`. No binder was lost:
  - headline 1: `T2Space X`, `CWComplex univ`, `PathConnectedSpace X`, `IsAspherical Y y`, universes `u_1` and `u_2`;
  - headline 2: both `T2Space`, both `CWComplex univ`, both `IsAspherical`;
  - headlines 3–4: `CommRing k`, `T2Space X`, `CWComplex univ`, `PathConnectedSpace X`, `IsAspherical X x`, `Ψ : π₁ ≃* G`.
- The Lean statements are unchanged, so these earlier results still stand:
  - the one-tactic padding probe of r57 (all four headlines resist one tactic);
  - the headline list (four statable headlines, all four stated).

**The changed passages.**
- **Pinned names the new text cites.** `TauCeti.classifyingSpaceFundamentalGroupMulEquiv` (README lines 79 and 1196) is at the pinned Tau Ceti (2fd255d, the same pin on main and here), `ClassifyingSpace/EilenbergMacLane.lean:67`. A scratch `#check` with that module imported gives `FundamentalGroup (classifyingSpace G) (classifyingSpaceBasepoint G) ≃* G`. The base point and the target `G` match the use at line 79.
- **Item 1.3 with Milnor's model as one side.** Headline 2 needs both sides to be Hausdorff CW and aspherical. For Milnor's model this holds:
  - `instCWComplexClassifyingSpace` (`ClassifyingSpace/CWComplex.lean:358`);
  - `instT2SpaceClassifyingSpace` (line 365);
  - `isEilenbergMacLaneSpaceOne_classifyingSpace` (checked in scratch).
  The nerve side is main's Layer 4.7 realization CW structure (main `AlgebraicTopology/README.md:3706`).
- **Classification hypotheses.** "Path-connected pointed Hausdorff CW complex" (lines 84 and 1198) is exactly headline 1's binders. The disconnected control is in the table.
- **`Suggested.lean:49`** now names Milnor's model only, as README line 76 does. No declaration of the file mentions the nerve model.
- **CharacteristicClasses.** "That item" at line 1201 is AlgebraicTopology 8.8b. CharacteristicClasses line 1005 consumes the classifying space of ℤ/2 "through AT8.8b's normalized model comparison" (unchanged since 35d5208).

**Library declarations opened at the pin: 6.**
- `ClassifyingSpace/EilenbergMacLane.lean:67`, together with its convention docstring at lines 64–66: a loop goes to `g` exactly when its lift from `⟨0, 1⟩` ends at `⟨0, g⁻¹⟩`.
- `ClassifyingSpace/CWComplex.lean:358` and `:365`.
- `ClassifyingSpace/Uniqueness.lean:73` (`IsAspherical.exists_homotopyEquiv`, `X Y : Type u`).
- `EilenbergMacLane/Basic.lean:63` (`isAspherical_iff`).
- `isEilenbergMacLaneSpaceOne_classifyingSpace`, by `#check`.

**Cross-roadmap citations resolved: 7.**
- `citations.md` lists nothing unresolved.
- AlgebraicTopology "Stage 8, items 8.8a and 8.8b" (lines 77 and 1191) resolves in two places:
  - on main at §8.8 (line 3695 onward), through main's numbering map at line 884;
  - at this head at lines 2805–2861.
  What 8.8b consumes is R01.
- CharacteristicClasses lines 171, 184, 1005 and 1089 cite AT8.8b and this roadmap consistently with line 1201.

**Overlaps.**
- #1808, #1854 and #1187 change this folder. The description fixes the order "this pull request → #1808 → #1854 → #1187 (pin bump)".
- No id this README cites is dropped by an open pull request, and none is defined only by an open revision.
- Remark on untouched text, no change requested: FreeGroupsAndLimitGroups line 29 (main and #1187) cites the anchor `#stage-2-the-cellular-model`. The *Stage and item numbers* list maps Stage 2 by name.

**Ownership against open pull requests.**
- `roadmaps grep` over main and the 439 open heads: the 1B.9 conclusion and `exists_mapOfEq_eq_of_isAspherical` give the hits listed under R01.
- No other roadmap states headlines 2–4 (r60's grep; those statements are unchanged).

**Sources (seeded sample).** None of 1.1–1.3 or 2.1–2.3 changed. I re-read the locators anyway:
- **1.1–1.3** (README lines 613, 733, 825): Hatcher, Theorem 1B.8 and Proposition 1B.9, p. 90. Page 90 starts at `hatcher-at` line 3884; Theorem 1B.8 is at lines 3897–3898 and Proposition 1B.9 at lines 3905–3907. The hypotheses are a connected CW `X` and a `K(G, 1)` target; the README explains at line 615 why asphericity is enough.
- **2.1** (line 893): Section 2.2, p. 148: `hatcher-at` lines 6441 and 6471.
- **2.1–2.3** (lines 895, 1002, 1061): Section 3.H, p. 328, at lines 14320 and 14326, and Example 3H.1, p. 329, at line 14372.
- The README flags no locator as unverified.

**Adversarial table.** Rows marked (r61) were computed for the changed passages at this head. The other rows are carried from the report named, for statements this diff leaves untouched.

| Statement | Instance | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Scope bullet, models compared (r61) | README 75–79 vs main AT 3707 vs head AT 96, 2826 | here: {`classifyingSpace G`}; main: {`classifyingSpace π`}; head AT: "Milnor and presentation models", comparison owned by ClassifyingSpaces | agrees with main; head AT hands the comparison back | R01 |
| "Which that item consumes" (r61) | README 83, 1193–1196 vs main AT 139, 4691 vs head AT 3314 | here: 8.8b inputs ⊇ {1.1, 1.2, 1.3}; main: {8.8a, Tau Ceti}, "nothing of it is consumed"; head: {8.8a, 4, 8.5} | contradiction | R01 |
| Classification hypotheses (r61) | `X = pt ⊔ S¹`, `x = pt`, `π = ℤ`, `Bπ = S¹` | `Hom(π₁(X, pt), ℤ) = Hom(1, ℤ)`: 1 element; `[X, S¹]_* = [S¹, S¹] = ℤ`: infinitely many | path-connectedness needed; matches headline 1's `PathConnectedSpace X` | none |
| Pinned π₁ identification (r61) | `G = ℤ/2` | `#check`: `π₁(classifyingSpace G, basepoint) ≃* G`; `Aut(ℤ/2) = 1`, so the normalisation is forced | holds | none |
| Item 1.3, nerve → Milnor (r61) | `G = ℤ`, both models `≃ S¹` | `e = id` is realized by the degree `+1` pointed map; degree `−1` realizes `e = −1`; Milnor side `CWComplex` (358), `T2` (365), K(G,1) | holds; the normalisation separates the two maps | none |
| `Suggested.lean:49` (r61) | file vs README 76 | both: "comparison with Milnor's model" belongs to AT; 0 declarations mention the nerve | consistent | none |
| Headline 1 duplicate (r61, re-read) | grep `HomotopicRel f g {x}` | #1807: `AlgebraicTopology/Suggested.lean:701` and `ClassifyingSpaces/Suggested.lean:92`; main: 0 | duplicate in this pull request | R01 |
| Headline 2 vs pinned `IsAspherical.exists_homotopyEquiv` (r60) | `X = Y = S¹`, `x = 1`, `y = −1` | pin: `e = id` with the path; headline: `F 1 = −1`, so `F z = −z` | headline strictly stronger | none |
| Headline 2, universes (r60) | `X : Type 0`, `Y : Type 1` | pin `X Y : Type u`; headline `u_1`, `u_2` | not covered by the pin | none |
| Headline 1 (r59) | `S¹ → S¹`, `φ = ×2` | `f(z) = z²`, `mapOfEq f : 1 ↦ 2`; degree-2 maps are homotopic rel `{1}` | holds | none |
| Headline 1, non-vertex base point (r59) | `X = [0, 1]`, `x = 1/2` | `π₁ = 1`; `H(s, t) = g((1 − s)t + s/2)` fixes `1/2` | holds | none |
| Headline 1, target control (r57) | `S² → S²` | `id`, `const` both trivial on `π₁`; degrees `1`, `0` | asphericity needed | none |
| Headline 2 (r59) | `X = Y = pt` | `F = id`, `F x = y` | holds | none |
| Headline 2, CW control (r57) | point vs Warsaw circle | both `π_n = 0`; not homotopy equivalent | CW hypotheses needed | none |
| Headline 3 (r59) | `G = ℤ`, `X = S¹`, trivial `ℤ` | `H_n = ℤ, ℤ, 0` on both sides (`n = 0, 1, 2`) | holds | none |
| Headline 3, twisted (r59) | `t ↦ −1` | `H₀ = ℤ/2`, `H₁ = 0` on both sides | holds | none |
| Headline 4 (r59) | `A = ℤ₋`, `N = ℤ` | `H⁰ = 0`, `H¹ = ℤ/2` on both sides | holds | none |
| Headlines 3/4, zero ring (r57) | `k = 0` | `0 = 0` | holds | none |
| Headlines 3/4, `A = k[G]` (r57) | Shapiro | `k, 0` on both sides | hold | none |
| 2.3 asphericity control (r57) | `S² ∨ S¹` | `H₂ = ℤ` vs `H₂(ℤ, ℤ) = 0` | asphericity needed | none |
| Hurewicz contract (r58) | `S¹`, counterclockwise `γ` | both sides the generator `1` | holds | none |
| Degenerate loop (r58) | `γ = refl x` | `[refl] = 0`; constant simplex a boundary | holds | none |
| 2.1 degree one (r58) | `ℤ/3`, `Ψγ = t` | `[t²] = 2`; FirstHomology `1` | holds; sign detected | none |
| `Φ = m⁻¹` (r57) | `S₃`, `s = (1 2)`, `t = (2 3)` | `ts ≠ st` | holds | none |
| Deck action sign (r57) | `ℤ`, `⟨t | ⟩` | `∂ = (t⁻¹ − 1)·base` | holds | none |
| 1.1 NDR data (r57) | `{0} ∪ {1/m}`; `S¹`; `B(F₂)` | retraction fails at `(1, 0)`; trace `1 → −i → −1`; `b ↦ aba⁻¹ ≠ b` | hold | none |
| 1.3, `e = −id` (r57) | `S¹` | degree `−1` | holds | none |
| 2.1 `ℤ/m`, torus (r57) | periodic resolution; `r = 2` | `H₁ = ℤ/m`, `H₂ = 0`; ranks `2`, `1` | hold | none |
| 2.2 circle, Bockstein (r57) | counterclockwise loop; `ℤ/2 → ℤ/4 → ℤ/2` | `1 ↦ −1`; `δ` an isomorphism | hold | none |
| 2.3 twisted circle (r57) | unit `u` | `H₀ = k/(u − 1)` | holds | none |

## Not verifiable

- `brown-cohomology`, Chapter III §1 (2.1–2.3): uncertified, no legal text held. The Hatcher locators at the same claims were verified.
- `schwamberger-vogt-2009`, §2 (the Warsaw circle): uncertified. The fact was checked by reasoning.
- `milnor-1956`, §3: uncertified, and cited only for the pinned model. Whether the join is in part I or part II remains unsettled (r60).

## Source issues

- none
