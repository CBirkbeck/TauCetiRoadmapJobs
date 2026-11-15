# Review of ClassifyingTopoi (pull request #1997 at 02a2761)

**Verdict:** needs changes

## R01 (P3) — the description's supplier list and commit account predate this head

**Location:** pull request description, supplier contracts: "1.2 (epimorphisms, coproducts, epimorphisms as coequalizers of their kernel pairs, and the frame property of subobject lattices) … 1.4 (…, for 1.4 and 2.2 (b))"; Acceptance test: "The last commit states the definability of 2.4".

**Claim:** At this head 2.4 also consumes GrothendieckTopoi 1.2 (`IsGrothendieckTopos.wellPowered`) and 1.4. The last commit makes that change, not the one stating definability. The description says neither.

**Witness:** README 267–270: "lattices, and `IsGrothendieckTopos.wellPowered`, for 2.4) … for 1.4, 2.2 (b) and 2.4)"; *Needs:* of 2.4, lines 796–799. `git log -1` at the head: 02a27613, "R01: the route of 2.4 cites GrothendieckTopoi 1.2".

**Repair:** Replace the bullet with "- GrothendieckTopoi 1.1 (topoi), 1.2 (epimorphisms, coproducts, epimorphisms as coequalizers of their kernel pairs, the frame property of subobject lattices, and `IsGrothendieckTopos.wellPowered`, for 2.4), the Examples of Layer 1 (`B G` as `Action (Type u) G`, for Convention 5 and 3.3) and 1.4 (Giraud's axioms: universal coproducts and universal coequalizers, so images and epimorphic families are stable under pullback, for 1.4, 2.2 (b) and 2.4);". Change "The last commit states the definability of 2.4" to "A later commit states the definability of 2.4". After that sentence, add: "The last commit makes the route of 2.4 take the `u`-smallness of subobject lattices from GrothendieckTopoi 1.2 (`IsGrothendieckTopos.wellPowered`) and the stability of epimorphic families under pullback from 1.4, and adds Mathlib `Shrink` and `WellPowered` to the contract."

## R02 (P3) — the 1.4 gloss credits universal coequalizers alone with the pullback-stability of epimorphic families

**Location:** `TauCetiRoadmap/ClassifyingTopoi/README.md` lines 798–799, "1.4 (universal coequalizers: epimorphic families are stable under pullback, so `K` is a topology)"; contract lines 269–270, "coequalizers of internal equivalence relations are universal, so images are stable under pullback, for 1.4, 2.2 (b) and 2.4".

**Claim:** Pullback-stability of jointly epimorphic families also needs universal coproducts. Universal coequalizers alone do not give it. GrothendieckTopoi 1.4 provides both, but the gloss names only one.

**Witness:** In abelian groups surjections are pullback-stable. Yet `i₁, i₂ : ℤ ⟶ ℤ ⊕ ℤ` are jointly epimorphic, and their pullbacks along the diagonal are both `0 ⟶ ℤ`, which are not jointly epimorphic. GrothendieckTopoi README 360: "`u`-small coproducts, disjoint … and universal".

**Repair:** Lines 798–799: "1.4 (universal coproducts and universal coequalizers: epimorphic families are stable under pullback, so `K` is a topology)". Lines 269–270: "1.4 (Giraud's axioms: coequalizers of internal equivalence relations are universal, so images are stable under pullback, for 1.4 and 2.2 (b); with universal coproducts, epimorphic families are stable under pullback, for 2.4)".

## Previous findings

- R01 — repaired: README 767–768 reads "a `u`-small set of subobjects (GrothendieckTopoi 1.2, `IsGrothendieckTopos.wellPowered`)". The *Needs:* of 2.4 (796–799) adds GrothendieckTopoi 1.2, 1.4 and Mathlib `WellPowered`, `Shrink`. From Mathlib (235–237), the GrothendieckTopoi contract (268–270) and the Dependencies (904–906) follow. The repair introduced R02.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 2.4 `exists_interp_eq_of_subobject`: `u`-small subobject lattices (README 767–768) | one-point site `(Discrete PUnit, ⊥)`; empty site; `C : Type u`, any `J` | `Subobject (Mⁿ) ≃ Set (Mⁿ) : Type u`; degenerate topos: one subobject; a subsheaf of `X` is a point of `Π c : C, Set (X c) : Type u` | `WellPowered.{u}` (`Subobject X` is `Small.{u}`) is what the route needs; GrothendieckTopoi `Suggested.lean:126` states it | — |
| 2.4 route: `K`, the epimorphic families of `Sheaf J (Type u)`, is a topology on `D` (README 783–784, 798) | `Type u`: `{0}, {1} ⟶ {0,1}` along `g : {a,b,c} → {0,1}`, `a ↦ 0`; abelian groups: `i₁, i₂` along the diagonal | pullbacks `{a}`, `{b,c}`, jointly surjective; in abelian groups both pullbacks are `0`, not jointly epimorphic | stability uses universal coproducts too | R02 |
| 2.4 `exists_interp_eq_of_subobject`, Lean against README 763–766 | elaborated type of `Suggested.lean:330` | `T : GeometricTheory.{u} L`, `C : Type u`, `[SmallCategory C]`, `ψ : GeometricFormula.{u} L n`, `U.interp ψ = S` | same generality as the README | — |

The rows for the statements this change does not touch stand as in the previous review, of `5edce8c`.

- Gate rerun at 02a2761: every check 0, OK; the worker's gate has `build=0`. Dependency check: `depcheck: 245 roadmaps, 2229 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 28 `sorry` warnings and nothing else. The diff touches only `README.md`, so the previous one-tactic probe (0 of 28 closed) and the `#check @` comparison still apply.
- Source locators checked against the text, 1: Car12a, Lemma 3.2 and its proof, p. 182 (Car12a lines 249–265). The representables of the geometric syntactic site are closed under subobjects, which supports README 768–769.
- Library declarations opened at the pin, 5: Mathlib `Logic/Small/Defs.lean:51` (`Shrink`), `CategoryTheory/Subobject/WellPowered.lean:50` (`WellPowered`), `CategoryTheory/Subobject/Types.lean:58`, `CategoryTheory/Generator/Basic.lean:952` (`HasDetector.wellPowered`), `CategoryTheory/Generator/Sheaf.lean:62` (`hasSeparator`, needs `Preadditive A`). The pin has no `WellPowered (Sheaf J (Type u))`, so GrothendieckTopoi 1.2 is the owner.
- Cross-roadmap citations resolved, 3, all GrothendieckTopoi (open head). 1.2 (README 308–334): `IsGrothendieckTopos.wellPowered`, frames of subobjects, jointly epimorphic = effective epimorphic families; `Suggested.lean:126`. 1.4 (README 356–387): universal disjoint coproducts, universal effective coequalizers. 2.5.
- Overlap check: read GrothendieckTopoi (open; 1.2 and 1.4, the sections newly cited) and the overlap report (no other pull request changes this roadmap; no dropped or revision-only id). Only GrothendieckTopoi declares `IsGrothendieckTopos.wellPowered`. Ownership against ToposTheoreticBridges, TotallyDistributiveTopoi, LocallyPresentableCategories and InfinitaryModelExistence stands as in the previous review: nothing shared.
- Source independence: changed passages only. 4 passages compared with 1 source, none shared: From Mathlib 232–239, From GrothendieckTopoi 265–281, 2.4 763–800, Dependencies 903–906, against Car12a lines 249–265. No layer was added, removed or reordered, so the arrangement stands as in the previous review: largest share Elephant, 15 of 55 locators; contents independent.

## Not verifiable

- none for the changed passages. The paywalled texts of the previous review (Elephant, Mac Lane–Moerdijk, Makkai–Reyes, Hakim 1972) are cited only in passages this change does not touch.

## Source issues

- none

## For the human reviewers

- **Not tested.** Elephant has the largest share of the locators (15 of 55) and Mac Lane–Moerdijk has 11. Neither text could be read, so the wording of 1.1–1.5, 2.1–2.3 and 3.2–3.4 and the page ranges were not compared with them.
- **Scope.** The route of 2.4 through the site of definable objects of a classifying site (`TauCetiRoadmap/ClassifyingTopoi/README.md` lines 772–793) is the roadmap's own argument. The cited sources prove definability only on the syntactic site. The description asks for a specialist's reading.
