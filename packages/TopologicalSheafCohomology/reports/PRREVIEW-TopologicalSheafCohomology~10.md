# Review of TopologicalSheafCohomology (pull request #2533 at 9a2bf74)
**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of 0 changed lines since `9a2bf74`; the folder is unchanged, and this round read the pull request's title and description sentence by sentence against the head and the diff with main. The one small correction of the previous review, on the description, is repaired, and every other sentence holds. No small corrections, no format notes, and nothing is left for a human to decide.

## Previous findings

The previous review had no finding. Its one small correction:

- C01 — repaired: the description now reads "The scope names these results and the Tau Ceti supplier contract lists the declarations", which is what the last bullet of Scope and ownership and "From Tau Ceti" do. No new problem introduced.

## Verified sound

| Statement | Instances tried | Roadmap side (computed) | Other side (source, library, Lean) | Result | Change |
|---|---|---|---|---|---|
| §1.3 headline `nonempty_cechCohomologyIsoRightDerived` (the description's "is stated" paragraph) | X=∅; X a point | ∅: F(∅)=0, so Čechⁿ=0 and RⁿΓ=0. Point: cover {pt} is final, complex F(pt) with differentials 0, id, 0, …; H⁰=F(pt), Hⁿ=0 | elaborated: `[CompactSpace] [T2Space]`, `Sheaf.forget ⋙ cechCohomology X (ModuleCat R) n ≅ Γ.rightDerived n`; Γ exact on a point, so RⁿΓ=0 for n>0 | agrees; description's sentence true | none |
| §2.1 headline `properFiniteFiberStalk` against the pinned map (the description's "Fiber stalk map" paragraph) | ∅→point; identity of a point | ∅→pt: (f_*F)_y=F(∅)=0, empty product 0, iso. Identity: stalk → one-factor product, the identity | `TauCeti/Topology/Sheaves/FiberStalk.lean:83` (map), `:256` `[T2Space X]`, `IsClosedMap f`, finite fiber; the local `def` is gone from `Suggested.lean` | agrees; description's sentence true | none |
| §0.1–0.2 and supplier contract: Godement resolution taken on sheaves of R-modules directly (the description's "Godement resolution" paragraph) | point with ℤ/4 | G⁰(ℤ/4)=ℤ/4, augmentation an isomorphism, cokernel 0, so ℤ/4 in degree 0 and zero above; H⁰=ℤ/4, Hⁿ=0 | `TauCeti/Topology/Sheaves/Godement.lean:358–365`: `[Abelian C] [HasColimits C] [HasProducts C]`, `X.Sheaf C ⥤ CochainComplex (X.Sheaf C) ℕ`; SchemeAndStackFoundations §2.5 on main names it | agrees | none |
| Description: what ImplicitAtlases consumes | — | README: §0.7 consumes TS1.1–TS1.2 and §1.4, §6.5 consumes TS1.1; comparison limited to K-sheaf complexes of bounded-below complexes of sheaves | ImplicitAtlases on main, supplier contract "From TauCetiRoadmap.TopologicalSheafCohomology" ("Used in §0.7 and §6.5"; §1.4 "Used in §0.7") and §0.7's comparison bullet (F^q=0 for q<b, F^K by §0.6) | agrees | none |

The rows for untouched statements stand as in the previous review, of `9a2bf74`.

- Folder: 0 lines changed since the head the previous review read; nothing is changed outside the folder.
- Pull request text: every sentence of the title and description checked against the diff with main (105 lines; 0 headings removed or added; `moduleCohomologyForgetComparison` renamed, local `fiberStalkMap` removed, `nonempty_cechCohomologyIsoRightDerived` added; two imports; three theorems, no definitions; the same three `### From` suppliers). None is contradicted, and no removal, renumbering or supplier change is left unstated.
- "No other roadmap cites the old name": a search of every roadmap on main and at the open heads finds `moduleCohomologyForgetComparison` only in this roadmap's own files on main.
- Library declarations opened at the pinned Tau Ceti for the description's claims: 12 (`cechCohomology`, `godementResolution`, `fiberStalkMap`, `fiberStalkMap_naturality`, `isIso_fiberStalkMap_id`, `fiberStalkMap_comp`, `isIso_fiberStalkMap`, `sheafModuleCatEquivLocallyConstant`, `FiniteOpenCover`, `FiniteOpenCover.exists_refinement`, `finiteCechCohomologyIso`, `isZero_cechCohomology_obj_of_isZero_sheafify`); the two corrected paths `Flasque/Basic.lean` and `SheafCohomology/Cech/Basic.lean` exist.
- Cross-roadmap citations resolved for the description: ImplicitAtlases §0.6, §0.7, §6.5 and SchemeAndStackFoundations §2.5, on main.
- Dependency check: `depcheck: 200 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives three `sorry` warnings (lines 34, 53, 72) and nothing else; the three elaborated types agree with the README statements (no binder lost).
- Automatic checks: all passed at this head.

Overlap check: read ImplicitAtlases, SmoothBundlesConnections, GromovWittenTheory; the open-cover Čech colimit and its derived comparison are owned here, compact-cover K-presheaf hypercohomology by ImplicitAtlases; nothing has two owners. No open pull request changes this roadmap, drops an id it cites, or cites an id it drops.

Source independence: changed passages only; the folder has no changed passage, so 0 passages compared; largest share stacks-cohomology, 15 of 24 locator citations, as in the previous review; no layer added, removed or reordered, so the contents comparison stands: independent.

Research link: §§1.1–1.2, 1.4 and 2.1 are the Čech foundations of Appendix A of Pardon (arXiv:1309.2370v6) for virtual fundamental cycles, consumed by ImplicitAtlases §0.7 and through it GromovWittenTheory; rests on the README's scope section and pardon Definition A.4.3, Lemmas A.4.8 and A.4.13.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
