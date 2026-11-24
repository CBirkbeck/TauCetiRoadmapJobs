# Review of TopologicalSheafCohomology (pull request #2533 at 9a2bf74)
**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of 0 changed lines since `9a2bf74`; the folder is unchanged, and this round read the pull request's title and description, sentence by sentence, against the head and against the diff with main. Every sentence holds and no removal, renumbering or supplier change is left unstated. No small corrections, no format notes, and nothing is left for a human to decide.

## Previous findings

The previous review had no finding, no small correction and no format note; there is nothing to account for.

## Verified sound

| Statement | Instances tried | Roadmap side (computed) | Other side (source, library, Lean) | Result | Change |
|---|---|---|---|---|---|
| §1.3 headline `nonempty_cechCohomologyIsoRightDerived` (description: "is stated … naturally isomorphic functors of the sheaf") | X=∅; X a point, F=ℤ/4 | ∅: empty family is the greatest cover, complex 0, Čechⁿ=0; Γ=F(∅)=0, RⁿΓ=0. Point: Čech⁰=ℤ/4, Čechⁿ=0 (n>0) | elaborated type has `[CompactSpace] [T2Space]`, `Sheaf.forget ⋙ cechCohomology X (ModuleCat R) n ≅ Γ.rightDerived n`; Γ exact on a point: R⁰Γ=ℤ/4, RⁿΓ=0 | agrees; sentence true | none |
| §2.1 headline `properFiniteFiberStalk` on the pinned map (description: "Fiber stalk map") | ∅→pt; id of a point; {a,b}→pt | ∅→pt: F(∅)=0 → empty product 0, iso. Identity: one-factor product, identity. Two points, stalks ℤ, ℤ/2: (3,1)↦(3,1) | `TauCeti/Topology/Sheaves/FiberStalk.lean:83` (map), `:256` (`[T2Space X]`, `IsClosedMap f`, finite fiber); local `def fiberStalkMap` absent from `Suggested.lean` at head | agrees; sentence true | none |
| §§0.1–0.2 and supplier contract: Godement resolution on sheaves of R-modules directly (description: "Godement resolution") | point, ℤ/4 | F→G⁰(F) is the identity of ℤ/4, cokernel 0, so complex is ℤ/4 in degree 0, zero above; H⁰=ℤ/4, Hⁿ=0 | `TauCeti/Topology/Sheaves/Godement.lean:358–365`: `[Abelian C] [HasColimits C] [HasProducts C]`, `X.Sheaf C ⥤ CochainComplex (X.Sheaf C) ℕ`; C=`ModuleCat R` qualifies | agrees; sentence true | none |
| Description: what ImplicitAtlases consumes | — | README scope and Downstream consumers: §0.7 consumes TS1.1–TS1.2 and §1.4; §6.5 consumes TS1.1; comparison only for K-sheaf complexes of bounded-below sheaf complexes | ImplicitAtlases on main: §0.7 *Needs* "TS1.1, TS1.2 and §1.4"; §6.5 *Needs* "TS1.1"; §0.7 comparison bullet assumes F^q=0 for q<b, F^K by §0.6 | agrees | none |
| Description: "Stacks Lemma 20.9.2 is cited at p.10" | — | README §1.2: "Lemma 20.9.2, tag 01EG, p.10" | stacks-cohomology line 407 (tag 01EG), between the page-10 marker (line 400) and the page-11 marker (line 452) | agrees | none |

The rows for untouched statements stand as in the previous review, of `9a2bf74`.

- Folder: 0 lines changed since the head the previous review read; the pull request changes nothing outside the folder.
- Pull request text: the title, the three paragraphs of the summary block and every sentence of the prose checked against the diff with main (105 lines; no heading removed or added; `moduleCohomologyForgetComparison` renamed to `nonempty_moduleCohomologyForgetIso`, local `fiberStalkMap` removed, `nonempty_cechCohomologyIsoRightDerived` added; two `TauCeti.*` imports; three theorems and no definition; the same three supplier subsections; the removed §0.1 transport bullet and the dropped scope sentence are both stated). None is contradicted by the head.
- "No other roadmap cites the old name": a search of the roadmaps on main and at the open heads finds `moduleCohomologyForgetComparison` only in this roadmap's own two files on main.
- Library declarations opened at the pinned Tau Ceti for the description's claims: 13 (`cechCohomology` at `Topology/Sheaves/Cech/Colimit.lean:70`, `godementResolution` `Godement.lean:365`, `fiberStalkMap` `FiberStalk.lean:83`, `fiberStalkMap_naturality` `:109`, `isIso_fiberStalkMap_id` `:137`, `fiberStalkMap_comp` `:174`, `isIso_fiberStalkMap` `:256`, `locallyConstantRingCatSheaf` `LocallyConstant.lean:126`, `sheafModuleCatEquivLocallyConstant` `:491`, `FiniteOpenCover` `CoverSystems.lean:147`, `FiniteOpenCover.exists_refinement` `:192`, `finiteCechCohomologyIso` `Cech/Cofinal.lean:96`, `isZero_cechCohomology_obj_of_isZero_sheafify` `Cech/LocallyZero.lean:153`); the two corrected paths `Topology/Sheaves/Flasque/Basic.lean` and `CategoryTheory/Sites/SheafCohomology/Cech/Basic.lean` exist.
- Source locators checked for the description: 1 (Stacks Lemma 20.9.2, stacks-cohomology line 407, page 10).
- Cross-roadmap citations resolved for the description: ImplicitAtlases §0.6, §0.7, §6.5 and SchemeAndStackFoundations §2.5, on main.
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives three `sorry` warnings (lines 34, 53, 72) and nothing else; the three elaborated types agree with the README statements, no binder lost. One-tactic probe on the stalk headline: `exact isIso_fiberStalkMap F hf.isClosedMap (Set.toFinite _)` does not close it as written (the subtype-finiteness hypothesis must be converted); its docstring already says the pinned theorem proves it, as an earlier review asked. Automatic checks: all passed at this head.

Overlap check: read ImplicitAtlases, Hyperfunctions, GromovWittenTheory; the open-cover Čech colimit and its derived comparison are owned here, compact-cover K-presheaf hypercohomology by ImplicitAtlases; nothing has two owners. No open pull request changes this roadmap, drops an id it cites, or cites an id it drops.

Source independence: changed passages only; the folder has no changed passage, so 0 passages compared; largest share stacks-cohomology, 15 of 24 locator citations, as in the previous review; no layer added, removed or reordered, so the contents comparison stands: independent.

Research link: §§1.1–1.2, 1.4 and 2.1 are the Čech foundations of Appendix A of Pardon (arXiv:1309.2370v6) for virtual fundamental cycles, consumed by ImplicitAtlases §0.7 and through it GromovWittenTheory; rests on the README's scope section and pardon Definition A.4.3, Lemmas A.4.8 and A.4.13.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
