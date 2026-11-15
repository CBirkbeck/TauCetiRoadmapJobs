# Review of SheafTheoreticSmithTheory (pull request #1734 at f19b8c8)

**Verdict:** accepted

Incremental re-review of 2 changed lines since 9184217 (one sentence of `TauCetiRoadmap/SheafTheoreticSmithTheory/README.md`, line 14), together with the pull request's title and description read against this head. No finding.

## Previous findings

- R01 — repaired: the description's summary block now reads "It builds loop Grassmannians of split connected reductive groups over any field, with affine flags and convolution, Beilinson–Drinfeld and semi-infinite geometry", and a prose paragraph names §3.0 and the four bordering roadmaps.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| README line 14 (changed): §3.0 "identifies it with that of GlobalShtukasAndFunctionFieldLanglands, GeometricSatakeAndFusion and FormalConnectionsOpers on their fields" | The identifications §3.0 states (README line 654) and the supplier contracts (lines 90, 94, 98) | Line 654: `F⊇F_q` gives GlobalShtukasAndFunctionFieldLanglands §1.1 and GeometricSatakeAndFusion §0.29; `F=ℂ` gives FormalConnectionsOpers §3A.5. Three identifications, three names; EndoscopicTransferAndUnitaryTraceComparison §3.2 in none | agrees; the earlier "theirs" would have counted four |
| §3.0 finite-field identification (cited by the changed sentence) | `H=G_m`, `F=F̄_q`; control: imperfect `K=F_p(s)` in place of `F_q` | Schubert varieties are points `Spec F_q`, base change `Spec F`, reduced. `1+εt⁻¹∈Gr(F[ε])` is not a reduced point: matched on the functor side (one-leg fibre), not the Schubert side. Control: `K(s^{1/p})⊗_K K(s^{1/p})=L[x]/(x−s^{1/p})^p`, nonreduced | agrees: perfectness of `F_q` is used and stated (line 654) |
| §8.1 `algebra_tate_diagonal` (cited by the description) | `A=F₂×F₂`, swap, `p=2`; `A=ℤ`, `σ=id`, `p=3` | Swap: `Tr(1,0)=(1,1)=1`, quotient the zero ring, δ unique. `ℤ`: transfer ideal `(3)`, `(a+b)³−a³−b³=3ab(a+b)∈(3)`, δ is reduction mod 3 | agrees with the description's "every commutative ring" |

The rows for every other statement stand as in the previous review, of `9184217`.

- Description sentences checked against the head: 17 (summary block and prose), all agree. The new ones: the loop-Grassmannian sentence of the summary block (README lines 7, 642, 650, 654); the paragraph on §3.0 and its four neighbours (README lines 14, 654); "AInfCohomology and EndoscopicTransferAndUnitaryTraceComparison are named only to mark ownership boundaries" (each occurs once, in Scope, lines 14 and 16; neither has a supplier heading or a `*Needs:*` line). The description states that the pull request adds the folder; the worker's change record agrees (1768 insertions, 0 deletions, 0 headings or declarations removed).
- Cross-roadmap citations of the changed sentence resolved at the open heads: GlobalShtukasAndFunctionFieldLanglands §§1.1–1.3 (headings "1.1 Beilinson–Drinfeld Grassmannians", "1.2 Schubert bounds", "1.3 Global Hecke chains"), GeometricSatakeAndFusion §0.29 ("Equal-characteristic Schubert models and coefficient comparison"), FormalConnectionsOpers §3A.5 ("Loop Grassmannian, affine flags and the Cartan decomposition", over ℂ), EndoscopicTransferAndUnitaryTraceComparison §3.2 ("The equal-characteristic local loop quotient"): 4 of 4 exist as cited.
- Source locator opened: Zhu17 line 1570 (Definition 3.1.1, p.38), as cited in §3.0. No target of the seeded sample lies in the changed sentence.
- Gate rerun at f19b8c8: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0`. The three-dot diff against the base outside the folder is empty.
- Dependency check: `depcheck: 236 roadmaps, 2240 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/SheafTheoreticSmithTheory/Suggested.lean`: two `declaration uses sorry` warnings (lines 61, 73), nothing else. The file is unchanged since 9184217; the elaborated types of the worker's signature file were compared with §§8.1–8.2 (`Fact p.Prime`, `CharP κ p`, `PerfectRing κ p`, `σ ^ p = 1` all present; nothing changed).
- Overlap check: read GeometricSatakeAndFusion, GlobalShtukasAndFunctionFieldLanglands, EtaleDualityAndPerverseSheaves, HeckeStacksAndLocalShtukas, GeometricSatakeAndFusionPartII; shared object the loop Grassmannian: over an arbitrary field this roadmap §3.0, finite-field Schubert models GeometricSatakeAndFusion §0.29, Beilinson–Drinfeld over curves over finite fields and finite-extension Satake GlobalShtukasAndFunctionFieldLanglands §§1.1–1.3, 1.14. The overlap record lists no other pull request changing this roadmap, no dropped id and no second copy.
- Source independence: changed passages only; 1 passage compared (the changed sentence of line 14, which names roadmaps and cites no source) with 1 source (Zhu17, for §3.0), none shared; largest share Feng24, 78 of 150 line locators; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Don93, Theorem 1.1: `uncertified`, cited by locator.
- The description's sentence on AI assistance (the counts of review and red-team rounds) describes the job board, not the head; not checked.

## Source issues

- none

## For the human reviewers

- none
