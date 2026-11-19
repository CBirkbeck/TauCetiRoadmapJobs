# Review of TopologicalSheafCohomology (pull request #2533 at 7b1730f)
**Verdict:** accepted

**Summary.** Accepted. Both earlier findings are repaired. The §1.3 compact Hausdorff Čech/derived comparison is now stated against Tau Ceti's `TauCeti.Topology.cechCohomology`; it elaborates at the pins, and no single tactic closes it. The Godement contract and the §0.1 Check now describe the resolution that SchemeAndStackFoundations §2.5 actually supplies, and the ℤ/4 computation in that Check is correct. One small correction remains (§0.1 asks for an equivalence that is already at the pin), with no format notes and nothing left for a human to decide.

## C01 — §0.1 asks for the constant-ring equivalence, which the pinned Tau Ceti already provides, and nothing in the README names it

An implementer reading §0.1 (line 57, with the unit/counit bullet on line 59) would build again an equivalence that is already at the pin. `TopCat.sheafModuleCatEquivLocallyConstant` (`TauCeti/Topology/Sheaves/LocallyConstant.lean:491`) is the equivalence between `X.Sheaf (ModuleCat.{u} R)` and `SheafOfModules.{u} (locallyConstantRingCatSheaf X R)`, for any ring R. It is exactly the construction §0.1 describes:
- a locally constant function acts by gluing its constant actions on its level sets;
- the inverse restricts along the constant functions;
- the unit and counit are the identity on sections.

The previous review pointed to this declaration. The rewritten paragraph now names the pinned carriers of §§1.2–1.3 and 2.1, but names this one nowhere.

A clause in §0.1 would fix this, for example "Tau Ceti's `TopCat.sheafModuleCatEquivLocallyConstant` is this equivalence", together with a bullet under "From Tau Ceti". Any compatibilities the pin lacks (with the native ring-sheaf module forgetful functors, with restriction and with stalks) remain targets.

## Previous findings

- R01 — repaired: "`nonempty_cechCohomologyIsoRightDerived` states that for each n≥0 the §1.2 colimit, carried by Tau Ceti's `TauCeti.Topology.cechCohomology` on the underlying presheaf, and RⁿΓ_R are naturally isomorphic functors of F" (line 149). The theorem is in `Suggested.lean` at line 53, and the module docstring names only §1.4 as not statable.
- R02 — repaired: "Consume §2.5's Godement resolution of sheaves with values in an abelian category with products and colimits, … taken with values in `ModuleCat.{u} R` … with no transport through §0.1's equivalence" (line 47). Line 9 and the Check on line 75 match it.
- C01 — repaired: the local definition is gone, and the theorem is stated for `TopCat.Presheaf.fiberStalkMap`. Its docstring (lines 69–71) and line 42 say that `TopCat.Presheaf.isIso_fiberStalkMap` proves it.
- C02 — repaired: "`TauCeti/Topology/Sheaves/Flasque/Basic.lean`" (line 38) and "`TauCeti/CategoryTheory/Sites/SheafCohomology/Cech/Basic.lean`" (line 40).
- C03 — repaired: "identifying with them, through its §0.6, the compact-cover hypercohomology of the K-sheaf complexes attached to bounded-below complexes of sheaves" (line 222).
- N01 — repaired: `nonempty_moduleCohomologyForgetIso` (line 69; `Suggested.lean` line 34).
- N02 — repaired: "Stacks, Lemma 20.9.2, tag 01EG, p.10" (line 135).

## Verified sound

| Statement | Instances | Roadmap side (computed) | Other side (source, library, Lean) | Result | Change |
|---|---|---|---|---|---|
| §0.1 headline `nonempty_moduleCohomologyForgetIso` (renamed) | point, R=F=ℤ/4; R=F=ℤ/2; X=∅ | V RⁿΓ_R = ℤ/4, 0, 0, …; ℤ/2 case H¹=0; ∅ gives 0 | Ext^n_Ab(ℤ,ℤ/4) = ℤ/4, 0, 0, …; ℤ/2 not ℤ-injective, H¹=0 still; probes `Iso.refl`, `infer_instance`, `simp`, `rfl` fail | consistent, not padding | none |
| §0.1 Check, line 75 | point, F=ℤ/4 | G⁰=∏ₓ(iₓ)_*Fₓ=ℤ/4, F→G⁰ iso, Z¹=0, G¹=G(0)=0: complex ℤ/4, 0, 0, … | Stacks 20.30.1 (line 3083, pp.65–66): ℤ/4 each degree, dⁿ=Σ(−1)^i id = 0, id, 0, …; both H⁰=ℤ/4, Hⁿ=0 | true | none |
| §0.1 Check, line 64 | point, F=ℤ; ℤ ⊕ ℤ[−1] | Godement ℤ, 0, 0, …: H⁰=ℤ, Hⁿ=0; extra summand gives H¹=ℤ | SchemeAndStackFoundations §2.5 Check: one-point resolution has cohomology M in degree 0 only | consistent | none |
| Godement contract, lines 9 and 47 | C = `ModuleCat.{u} R` | Abelian, colimits, products.{u} hold; augmentation, flasque terms, exactness, restriction; `Sheaf.H` comparison abelian only | §2.5 on main, README lines 4275–4286; `Godement.lean:358`, `:365`, `:372`, `:377`, `:394` | matches | none |
| §0.2 (sample), line 83 | point, ℤ --2→ ℤ in degrees 0,1, b=0 | Godement on a point is the identity resolution; total ℤ --2→ ℤ: H⁰=0, H¹=ℤ/2 | Check line 91; Stacks 20.30.2 (line 3110, p.66) | consistent | none |
| §1.2 locator (sample), line 135 | Stacks Lemma 20.9.2 | cited at p.10 | line 407, page 10 begins line 400: sheaf iff F(U)→Ȟ⁰(U,F) bijective | correct | none |
| §1.3 headline `nonempty_cechCohomologyIsoRightDerived` (sample, new) | X=∅; point; S¹ two arcs, R=ℤ, n=1 | ∅: Čech 0; point: F(pt) in degree 0, zero above; S¹: (a,b)↦(b−a,b−a), Čech¹=ℤ | ∅: RⁿΓ=0; point: Γ exact; R¹Γ(S¹;ℤ)=ℤ; Stacks 20.16.2 (line 1169, p.26): Hausdorff quasi-compact | true; elaborates; probes fail | none |
| `TauCeti.Topology.cechCohomology` contract, line 41 | variable block, order | no hypothesis on X; preadditive, products.{u}, homology, colimits of shape `PointOpenCover X` | `Cech/Colimit.lean:61–70`; `CoverSystems.lean:71–72` (≤ is existence of refinement); ModuleCat instance inferred | accurate | none |
| §2.1 headline `properFiniteFiberStalk` (sample, restated) | {a,b}→pt, stalks ℤ, ℤ/2; (0,1)→ℝ; two origins→ℝ | (3,1)↦(3,1), iso; ℤ→0 not iso (not proper); diagonal ℤ→ℤ² not onto (not Hausdorff) | closes by `isIso_fiberStalkMap F hf.isClosedMap (hfin y)` (`FiberStalk.lean:256`: T2, closed, finite fiber) | true; docstring says so | none |
| `fiberStalkMap` contract, line 42 | hypotheses as listed | map: colimits and products; iso: concrete, limits, forget preserves limits and filtered colimits, reflects isos | `FiberStalk.lean:77`, `:83`, `:109`, `:137`, `:174`, `:188–190`, `:256` | accurate | none |
| §0.1 equivalence, line 57 | two discrete points, R=ℤ | Γ(R_X)=ℤ², (2,3)·(a,b)=(2a,3b) | `TopCat.sheafModuleCatEquivLocallyConstant` (`LocallyConstant.lean:491`, any ring; global sections R×R on two points) | at pin, not named | C01 |
| Downstream sentence, line 222 | ImplicitAtlases on main | only K-sheaf complexes from bounded-below complexes of sheaves are compared with §1.4 | ImplicitAtlases README line 202 (F^K from §0.6) | accurate | none |
| `Suggested.lean` docstring, lines 11–18 | hypercohomology carriers at the pins | claims §1.4 diagram and pagewise colimits absent | no "hypercohomology" in pinned Mathlib or Tau Ceti; no Čech/derived iso at pin | accurate | none |

The rows for statements this change does not touch (§1.1 with the prism sign, the §1.2 Checks, §1.4, the conventions) stand as in the previous review, of `c360674`.

- Source locators checked against the text: 4, all on the stated pages. They are Stacks 20.9.2 (p.10), 20.16.2 (pp.26–28), 20.30.1 (pp.65–66) and 20.30.2 (p.66), at stacks-cohomology lines 407, 1169, 3083 and 3110.
- Library declarations opened at the pins (about 25):
  - `Cech/Colimit.lean:61–70`
  - `CoverSystems.lean:51`, `:71`, `:97`
  - `SheafCohomology/Cech/Colimit.lean:92`, `:127`
  - `FiberStalk.lean:77–256`
  - `Godement.lean:358–394`
  - `LocallyConstant.lean:491`
  - `Flasque/Basic.lean:82`, `:135`, `:142`
  - `SheafCohomology/Cech/Basic.lean:496`, `:644`

  `rightDerivedIsoOfResolution` and `rightDerivedΓIsoGodement` are not at the pin, so the claim on line 30 still holds.
- Cross-roadmap citations resolved on main (faef063): SchemeAndStackFoundations §2.5, and ImplicitAtlases lines 56, 84–88, 202, 216 and 766. No roadmap on main or at an open head cites the old names `moduleCohomologyForgetComparison` or the local `fiberStalkMap`.
- Dependency check: `depcheck: 200 roadmaps, 2189 edges, 0 problem(s)`. All four supplier roadmaps are on main.
- Elaboration: `lake env lean Suggested.lean` exits 0 with three `sorry` warnings (lines 34, 53, 72). The `#check @` types match the README. The one-tactic probes fail on lines 34 and 53. Line 72 closes with one term, which its docstring now states.
- Automatic checks: all passed at this head, and the rerun gate reports every count 0. The diff is 94 lines in `README.md` and `Suggested.lean`, with nothing outside the folder.
- Pull request title and description: checked against this head; every sentence holds, including "no section is added, removed or renumbered".
- Ownership: no open pull request changes this roadmap or co-owns its objects. The pinned Tau Ceti carriers now named (`cechCohomology`, `fiberStalkMap`) implement this roadmap's own §1.2 and §2.1 targets, as its progress log records.

Overlap check: read ImplicitAtlases, SmoothBundlesConnections and GromovWittenTheory; the open-roadmap and results lists were empty. Shared objects and their owners:
- The open-cover Čech colimit of §1.2: the target is owned here and its carrier is Tau Ceti's `cechCohomology`. ImplicitAtlases §0.7 and GromovWittenTheory consume it.
- Compact-cover K-presheaf hypercohomology: owned by ImplicitAtlases.
- Čech diagrams over smooth good covers: owned by SmoothBundlesConnections, whose scope names this roadmap as the owner of the cover colimit and its derived comparison.

Source independence: changed passages only. 12 passages were compared with stacks-cohomology (Lemmas 20.9.2, 20.16.2, 20.30.1, 20.30.2) and with the pinned Tau Ceti docstrings. Nothing is shared beyond forced phrases: the longest common run is 8 words, "to the product of the stalks over the fiber", against the docstring of `isIso_fiberStalkMap`. The largest share of locators is stacks-cohomology, 28 of 50 locator mentions in the previous count; this change removes the §0.1 pair 20.30.1–20.30.2 and adds 20.30.1 in a Check. No layer is added, removed or reordered, so the previous contents comparison (independent) stands.

Research link: §§1.1–1.2 and 1.4 are the open-cover Čech foundations that Pardon (arXiv:1309.2370, Geom. Topol. 2016) uses for virtual fundamental cycles. ImplicitAtlases §0.7, and GromovWittenTheory through it, consume them. This rests on README line 10 and on pardon Appendix A, Definition A.4.3 and Lemma A.4.13.

## Not verifiable

- none: every locator in the changed passages was read in the cached Stacks text, and ownership was checked against every open head with the roadmap search.

## Source issues

- none

## For the human reviewers

- none
