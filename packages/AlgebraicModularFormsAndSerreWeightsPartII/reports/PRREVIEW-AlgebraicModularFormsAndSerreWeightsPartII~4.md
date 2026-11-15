# Review of AlgebraicModularFormsAndSerreWeightsPartII (pull request #1822 at e1209cb)

**Verdict:** accepted

Incremental re-review of 0 changed lines since e1209cb: the folder is byte-identical to the head the previous review read, nothing changed outside it, and this round read the pull request's title and description against the head. No finding.

## Previous findings

- The previous review (of e1209cb) was an acceptance with no finding; its one earlier finding (R01 of the review before it, the four prose contract titles) stays repaired: the three removed titles occur 0 times in the README.

## Verified sound

**The pull request's title and description against the head.**

| Sentence of the title or description | What the head shows | Result |
|---|---|---|
| Title "AlgebraicModularFormsAndSerreWeightsPartII: roadmap"; "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)" | folder absent on the base; diff adds exactly 3 files, 1483 insertions, 0 deletions; 0 headings and 0 declarations removed | agrees |
| "coefficients in any module over a complete DVR finite over ℤ_p, K/O included" | README §1.1: forms defined for every O-module M, O a complete DVR finite over ℤ_p; "No flatness hypothesis on M" | agrees |
| "Coefficients are tensored into the sheaf before sections are taken, since tensoring the sections misses H¹ torsion" | §1.1 Check: 0→H⁰(E₀)/ϖ^m→H⁰(E₀/ϖ^m)→H¹(E₀)[ϖ^m]→0; Conventions "Tensor coefficients into the sheaf before taking H⁰" | agrees |
| "the operators U, V, Z, Z₂, X₂ with a corrected integral Q₂" | §§5.3, 5.4, 5.7; Scope paragraph lists the same six | agrees |
| "p=2 and 3 are treated wherever the formulas are defined, and secondary Hasse duality holds at every prime" | Conventions "integral constructions treat p=2,3 whenever their formulas are defined"; §3.2 "u=1 on the whole interior, at every prime" | agrees |
| "Literal double-coset sums keep their tame multiplicity, since dividing by it can fail on torsion coefficients" | §5.2 Check: e=3, p=3, degrees 12 and 4, "scalar averaging by e can be undefined on torsion coefficients" (recomputed below) | agrees |
| "the formal headline is … `relIndex_conj_diag_eq_tameIndex_mul`"; "Suggested.lean states the one headline statable at the pins … and names the geometric headlines that lack carriers" | `Suggested.lean` declares exactly that one theorem (line 71); its module docstring lists ten groups of headlines with the missing carriers | agrees |
| the contents sentence (rank strata … marked Klingen operator) | each item is a section at the head: §§1.3–1.4, 2.1–2.3, 3.1–3.7, 4.1–4.4, 5.2–5.7, 6.1–6.3, 7.3–7.6, 8.2–8.7, 9.1–9.4 | agrees |
| "extends AlgebraicModularFormsAndSerreWeights from modular curves to the spherical, Klingen and paramodular genus-two models" | README Summary and Scope: base roadmap Layers 1–7 supply the modular-curve direction; Layers 1–9 here are genus two; Klingen and paramodular models through gap:siegel-parahoric-models | agrees |
| "GSp4NonregularModularityLifting imports the secondary Hasse geometry, theta injectivity and the oriented reciprocity"; "Higher Hida and Coleman comparisons use the integral ordinary target and its Klingen operator, and torsion applications use integral Hecke correspondences" | README Scope paragraph 5 and `## Downstream consumers` say the same (Layer 3, Layer 8, §6.3; Layer 9 and §9.4; Layer 7) | agrees with this head (see the remark below) |
| "Roadmaps on main are cited by name; everything else named in the README is a consumer"; the eight suppliers of the task list | 13 `### From TauCetiRoadmap.*` suppliers: 6 on main (AlgebraicVectorBundles, ModularForms, AdelicAlgebraicGroups, ClassicalArithmeticCompletion, SchemeAndStackFoundations, ReductiveGroupsPartII), 7 open, the 7 unchecked boxes; AdelicAlgebraicGroups ticked | agrees |
| "Validation: … `sorry` as the only warning; README identifiers missing from the Lean: 0; no `set_option` overrides (0); sorry'd data: 0; … 0 problem(s) …; the outside-folder diff has 0 path(s)" | re-run below: one `sorry` warning; gate readme-ids-missing=0 set_option=0 sorry-data=0 outside-folder=0; depcheck 0 problem(s) | agrees |

No section, headline theorem, declaration or supplier was removed or renumbered by this pull request (it adds the roadmap), so the description leaves no such change unstated.

**Adversarial table** (the diff changes no statement; one row for the statement the description cites, and one for the README Check behind its torsion sentence).

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| `relIndex_conj_diag_eq_tameIndex_mul` (§5.2) | N=1; Γ(7)∩red₅⁻¹Stab⟨(1,1)⟩, p=3; N=p | N=1: ZMod 1 trivial, both sides p+1. Borel of SL₂(𝔽₅) 20, two Borels meet in 4, e=5; 24/6=4; degree 20=4·5. N=p excluded by `p.Coprime N` | matched | none |
| §5.2 Check e=3 (description: dividing by the multiplicity fails on torsion) | p=3, H=⟨A⟩, A=[[0,−1],[1,−1]] mod 7 | A²=[[6,1],[6,0]], A³=1; gAg⁻¹=[[0,4],[5,6]]∉H, so H∩gHg⁻¹=1, e=3, degree 12≡0 mod 3, local degree 4≡1 | matched | none |

Rows for all other statements stand as in the previous review, of e1209cb.

- Remark (untouched text, no change asked here): README Scope paragraph 5 says GSp4NonregularModularityLifting §§3.2, 4.1–4.2, 4.4, 4.7 import Layers 3, 5, 6, 8 by section; at that roadmap's open head 11b3de3 its README line 11 still says its §3.2 "owns secondary Hasse geometry" and §4.2 the theta construction and injectivity, and names this roadmap 0 times. This roadmap is the earlier one in the merge order (254 against 290), so the citation is that pull request's to add.
- Gate re-read at this head (worker's run): every check 0, build=0, `OK`. Dependency check re-run with `--movable`: `depcheck: 244 roadmaps, 2233 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration re-run with `lake env lean` at the pins: one warning, `declaration uses 'sorry'` at `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeightsPartII/Suggested.lean` line 71; the worker's elaborated signature equals the §5.2 statement, 0 dropped binders.
- Folder diff since e1209cb: 0 lines; `git diff --stat origin/main...HEAD` outside the folder: empty; working tree clean.
- Source locators: none re-read (no passage changed; the description carries no locator). Seeded sample: no target falls in a changed passage.
- Cross-roadmap citations: the worker's resolver lists none unresolved; the one Lean-name lead, `Lang.lang_surjective`, is ReductiveGroupsPartII's, as in the earlier reviews. HigherHidaAndColemanTheory at its open head cites this roadmap's §7 (12 times), consistent with the description's consumer sentence.
- Declared gaps: 8 slugs, unchanged; not re-examined.
- Overlap check: read GSp4NonregularModularityLifting, HigherHidaAndColemanTheory, PadicFamiliesPartII (scope paragraphs at their open heads); the secondary Hasse geometry and genus-two theta injectivity are shared with GSp4NonregularModularityLifting, owner this roadmap (earlier in the merge order), as the remark above records; nothing else shared.
- Source independence: changed passages only: 0 passages compared (the folder did not change since e1209cb); largest share CG20, 49 of 125 source-id occurrences; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- "after 4 independent review rounds and 2 red-team rounds on the job board" (description, AI-assistance line): a statement about the board's history, not about the head; not checked.

## Source issues

- none

## For the human reviewers

- GSp4NonregularModularityLifting (open pull request, head 11b3de3, README line 11) still claims ownership of the secondary Hasse geometry and theta injectivity that this roadmap's Scope paragraph 5 owns; the two texts disagree until that pull request cites this roadmap.
