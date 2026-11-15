# Review of VectorBundlesAndIsocrystalsPartII (pull request #2264 at d2f7530)

**Verdict:** accepted

Incremental re-review: the folder is unchanged since d2f7530 (0 lines); this round reads the pull request's title and description against the head. No finding.

## Previous findings

- none: the previous report (of d2f7530) listed no finding of its own; its carried R01 was recorded there as repaired, and README §§4.2 and 4.9 still read as it describes.

## Verified sound

The statements the description cites, recomputed at this head:

| Statement | Instances tried | Computed value | Comparison value | Result | Change |
| --- | --- | --- | --- | --- | --- |
| §0.2, `semilinearRep_equivariant_map_smul` (description: "Théorème A") | W₁=W₂=ℂ_p, f=mult. by c; f: ℂ_p→ℂ_p(1); W₁=0 | Equivariance forces σ̂(c)=c, so c∈K; into ℂ_p(1) the scalar lies in H⁰(G_K,C(1))=0; zero source gives 0 | f(c′w)=c′f(w) in all three; README Checks give K, 0, 0 | True; non-linear candidate σ̂₀≠1 is not equivariant (G_K has trivial centre) | none |
| §0.10, `fundamental_extension_surjective` (description: "Théorème 4.1") | E=ℚ_p⊕ℂ_p, V=ℚ_p, η=second projection; η=0; η=projection to V⊂ℂ_p; V=0 | η(E)=ℂ_p≠0=η(V), ker η=V, finrank 1; η=0 and η onto ℚ_p have η(E)=η(V); V=0 gives ker 0 | finrank V=1; both non-surjective maps excluded by `hne`; finrank V=0 | Conclusion holds; hypothesis excludes the two wrong maps | none |
| §6.7 height–rank formula (summary block, last sentence) | W=ℚ_p, C, C/ℚ_p, ℚ_p²⊕(C/ℚ_p)³ | (rank h, rank Ext¹)=(1,0),(0,0),(0,1),(2,3) | ht+Ext¹=1+0, 0+0, −1+1, −1+3 | Equal in all four; opposite sign would give −4 for the last | none |
| §4.9 general Fréchet comparison (description, third paragraph) | W=0; W=C^I, I finite; W=Ĉ | Hom and Ext¹ parameters 0; C^I; evaluation of a↦a⊗1 at 1 is 1 | 0→0; §4.7's finite-dimensional value C^I; every continuous functional on Ĉ sends 1 to 0 | Statement covers Ĉ, where the separable route fails, as the description says | none |
| §5.4 full faithfulness of reasonable qBCs (summary block) | W=W′=C/ℚ_p, map = multiplication by p | Inverse p⁻¹; ht = dim V₂ − dim V₁ = 0−1 = −1 on both sides | qBC isomorphism preserving height −1 | Agrees with §5.1 convention and the Conventions Check | none |

The rows for untouched statements stand as in the previous review, of d2f7530.

- Pull request text: title and 23 sentences of the description (summary block and prose) read against the head; 0 contradicted. It states that the roadmap is added (89 headings, 3 Lean declarations, nothing removed or renumbered); its 11 direct suppliers are exactly those of README `## Exact supplier contracts` (FiniteFlatGroupsAndIntegralPadicHodgeTheory under the PadicHodgeTheory heading); the two stated headlines and the definition match `Suggested.lean` lines 46, 62, 83; the four headline groups named as not statable are in its docstring, lines 22–35.
- Sources: 6 locators the description relies on checked: Fontaine03 lines 213 (Théorème A, p. 290), 254 (Théorème A′, p. 291), 1816 (Théorème 4.1, p. 329); CN25 lines 387 (Theorem 2.1, p. 9), 939 (Proposition 3.27, p. 20), 1291 (Proposition 4.22, p. 27). The seeded sample falls in no changed passage.
- Suppliers: CompactOperators, PerfectoidSpaces, PerfectoidTowers and DiamondsAndVStacks are on main; the other 7 suppliers are earlier in the merge order; CstConjectureForDaggerVarieties and CohomologyComparisons are later and named only as consumers. Resolver: 0 unresolved citations, 0 unresolved Lean names. The declared contract gap:G-HOM is unchanged; acceptance is conditional on it.
- Gate at this head: every scanner 0, `OK`. Dependency check: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`.
- Elaboration: `Suggested.lean` elaborates with 2 `sorry` warnings (lines 62, 83) and nothing else; the 3 elaborated signatures compared with README Conventions, §0.2 and §0.10: 0 lost binders, no change.
- Changes outside the folder: none.

Overlap check: read CstConjectureForDaggerVarieties, VectorBundlesAndIsocrystals, PadicHodgeTheory, PadicPeriodRings, ProetaleCohomologyOfPAdicCurvesAndTowers and main's PerfectoidTowers; no pull request changes this roadmap, no cited id is dropped, and ownership is as in the previous review (classical BC and sympathetic VS: VectorBundlesAndIsocrystals; period rings and the Galois action on ℂ_p: PadicPeriodRings; Sen theory: PadicHodgeTheory; almost C-representations, TVS, period Pairs, qBC and the height functor: this roadmap); nothing shared.

Source independence: changed passages only; 0 passages changed in the folder, so none to compare; largest share CN25, 79 of 132 locators, as in the previous review; no layer added, removed or reordered, so the contents comparison stands: independent.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
