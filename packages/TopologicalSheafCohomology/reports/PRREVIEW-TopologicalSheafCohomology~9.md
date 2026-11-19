# Review of TopologicalSheafCohomology (pull request #2533 at 9a2bf74)
**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 13 lines changed since `7b1730f`; the change repairs the one small correction of the previous review by naming six pinned Tau Ceti declarations in §§0.1, 1.2, 1.3, the scope and the supplier contract, and each was opened at the pin and says what the README now says of it. One small correction on the pull request's description, no format notes, and nothing is left for a human to decide.

## C01 — The description says the scope lists the newly named declarations; the scope names the results only

In the description's paragraph "Pinned results named where the README asked for them", the last sentence reads "The scope and the Tau Ceti supplier contract list these declarations." At this head the last bullet of Scope and ownership (line 13) names the three results in words ("the constant-ring equivalence of §0.1", the "finite-cover comparison on compact spaces", "the vanishing of §1.3 for presheaves with zero sheafification") and refers to "the exact declarations listed below"; the declaration names stand in §§0.1, 1.2, 1.3 and under "From Tau Ceti" (lines 42–44). The sentence would be right as: "The scope names these results and the Tau Ceti supplier contract lists the declarations." Every other sentence of the title and description holds against the head and the diff with main.

## Previous findings

The previous review had no finding. Its one small correction:

- C01 — repaired: §0.1 now opens "Tau Ceti's `TopCat.sheafModuleCatEquivLocallyConstant` is the equivalence between sheaves of R-modules and modules over R_X"; §1.2 names `FiniteOpenCover`, `exists_refinement`, `finiteCechCohomologyIso`; §1.3 names `isZero_cechCohomology_obj_of_isZero_sheafify`; lines 42–44 list them. No new problem introduced.

## Verified sound

| Statement | Instances tried | Roadmap side (computed) | Other side (source, library, Lean) | Result | Change |
|---|---|---|---|---|---|
| §0.1 and line 44: `TopCat.sheafModuleCatEquivLocallyConstant`, unit and counit the identity on sections, any ring R | two points with R=ℤ; R=0 | Γ(R_X)=ℤ²; (2,3)·(a,b)=(2a,3b); constants (n,n) give n(a,b); unit s↦s. R=0: both categories trivial | `LocallyConstant.lean:491` `[Ring R]`, `X.Sheaf (ModuleCat R) ≌ SheafOfModules (locallyConstantRingCatSheaf X R)`; lines 470–479 unit components `= s` by `rfl`; sheaf at line 126 | matches | none |
| §1.2 and line 42: finite indexed covers cofinal on compact X, colimit over them ≅ `cechCohomology`, `CompactSpace` only | X=∅; Sierpiński space; ℝ with (−n,n) | ∅: n=0 family covers, tuple products over an empty index set are 0, colimit 0=Čech(∅). Sierpiński: {X} refines every cover. ℝ: no finite refinement | `CoverSystems.lean:147` (n, `ULift (Fin n) → Opens X`, cover), `:192` `[CompactSpace X]`; `Cech/Cofinal.lean:96` iso of functors, `[CompactSpace X]`, no separation | matches; compactness needed | none |
| §1.2 locators | Pardon Lemma A.4.4, Remark A.4.1; Stacks §20.15 | compact X, finite covers suffice; refinement with index map | pardon line 5267 (p.120), line 5231 (p.119); stacks-cohomology line 1066 (tag 09UY, pp.24–25) | on stated pages | none |
| §1.3 bullet and line 43: P(∅)=0 and P^#=0 give zero Čech cohomology, pinned on compact normal X | {a,b} discrete with P(∅)=ℤ, else 0; Sierpiński | {a,b}: P^#=0, C⁰=0, C¹ cocycles c_ab+c_ba=0, Čech¹=ℤ≠0, so P(∅)=0 is needed. Sierpiński (normal): P^#=0 forces P(X)=P({η})=0 | `Cech/LocallyZero.lean:153`: `[CompactSpace X] [NormalSpace X]`, `HasWeakSheafify`, `WEqualsLocallyBijective`, `h₀ : IsZero (P.obj (op ⊥))`; `:66` kills every cochain by a point-neighborhood refinement; compact T2 ⇒ normal | matches | none |
| §1.3 locator | Stacks Lemma 20.16.2 | Hausdorff quasi-compact, shrinking in the proof | stacks-cohomology line 1169 (tag 09V2), proof to page 28 (lines 1194, 1250) | pp.26–28 | none |
| §1.3 headline `nonempty_cechCohomologyIsoRightDerived` (cited by the changed bullet) | X=∅; point | ∅: both 0; point: F(pt) in degree 0, 0 above | elaborated type unchanged: `[CompactSpace] [T2Space]`, `Sheaf.forget ⋙ cechCohomology X (ModuleCat R) n ≅ Γ.rightDerived n` | true, unchanged | none |

The rows for untouched statements stand as in the previous review, of `7b1730f`.

- Source locators checked against the text: 4 in the changed passages (stacks-cohomology 2, pardon 2), all on the stated pages.
- Library declarations opened at the pinned Tau Ceti: 6 newly cited (`FiniteOpenCover`, `FiniteOpenCover.exists_refinement`, `finiteCechCohomologyIso`, `isZero_cechCohomology_obj_of_isZero_sheafify`, `locallyConstantRingCatSheaf`, `sheafModuleCatEquivLocallyConstant`), each in the file the README gives.
- Cross-roadmap citations: the diff adds or changes none.
- Dependency check: `depcheck: 200 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives three `sorry` warnings (lines 34, 53, 72) and nothing else; the file is unchanged since `7b1730f`, and the three elaborated types agree with the README statements (no binder lost).
- Automatic checks: all passed at this head; nothing is changed outside the folder.
- Pull request text: title and description read against the head and the diff with main (2 declarations removed, 2 added, no heading changed, imports and three headlines as stated); one sentence imprecise (C01).

Overlap check: read ImplicitAtlases, SmoothBundlesConnections, GromovWittenTheory; the open-cover Čech colimit and its derived comparison are owned here, compact-cover K-presheaf hypercohomology by ImplicitAtlases; nothing has two owners. No open pull request changes this roadmap, drops an id it cites, or cites an id it drops.

Source independence: changed passages only; 7 passages compared with 2 sources (stacks-cohomology, pardon), none shared; largest share stacks-cohomology, 15 of 24 locator citations; the diff adds, removes or reorders no layer, so the contents comparison stands: independent.

Research link: §§1.1–1.2, 1.4 and 2.1 are the Čech foundations of Appendix A of Pardon (arXiv:1309.2370v6) for virtual fundamental cycles, consumed by ImplicitAtlases §0.7 and through it GromovWittenTheory; rests on the README's scope section and pardon Definition A.4.3, Lemmas A.4.8 and A.4.13.

## Not verifiable

- none: every text cited in the changed passages was read at its locator.

## Source issues

- **Misprint** in stacks-cohomology at §20.15 (tag 09UY), p.24: the source says the map of the first index function minus that of the second equals dh+hd; it should be the second minus the first, as the computation in §20.25, p.47, gives for the same h; affects nothing.
- **Misprint** in pardon at Lemma A.3.2, p.118: the source says the compact set K lies in X; it should be K in Y, since the neighborhoods are preimages of opens of Y containing K; affects nothing.
- **Misprint** in pardon at Remark A.4.1, p.119: the source says each member indexed by β lies in the member indexed by f(α); it should be f(β); affects nothing.

## For the human reviewers

- none
