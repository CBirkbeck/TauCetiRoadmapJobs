# Review of LogicAndDefinabilityInNumberTheory (pull request #2276 at 8761a1c)

**Verdict:** accepted

Incremental re-review of 12 changed lines since 3a5156d, with the pull request's title and description read against this head. No finding. The acceptance is conditional on the four declared supplier gaps (see the last section).

## Previous findings

- R01 — repaired: `README.md` line 551 now reads “Theorem 1.4, p.3; §2.1, pp.5–6, where (p.6) X(O_F) is regarded as a subset of X(F).” The convention is at `geometric_stabilisation_via_p_adic_integration` line 268, after the page-6 marker of line 264.
- R02 — repaired: `README.md` lines 24, 109, 1657 and 1659 state the contract “for a smooth complex algebraic variety S, a closed complex analytic subset E⊆S^an and … A⊆S^an∖E”, the form registered under the slug in `packages/LogicAndDefinabilityInNumberTheory/design/plan.json`. The repair introduced no new problem.

## Verified sound

| Statement | Instances tried | Left side / constructed value | Right side / required value | Result; change |
| --- | --- | --- | --- | --- |
| gap:definable-remmert-stein as restated (line 109) | S=ℙᴺ∖Z; S a smooth proper non-projective threefold; M a disc in ℙ¹ | first two are smooth algebraic varieties, S^an a complex manifold; the disc is not an S | Peterzil–Starchenko Theorem 4.4 (`peterzil_starchenko_agc` line 596, p.12): M any complex manifold, E analytic of any dimension | Contract is an instance of the source theorem; README and plan now state the same ambient space; none |
| §6.8 route with S=W (lines 1657–1659) | Y=𝔸¹∖{0}⊂ℙ¹; Y the cone xy=z² in 𝔸³⊂ℙ³; E=Y; E=∅ | W=ℙᴺ∖(Ȳ∖Y): ℙ¹∖{0,∞}=Y; ℙ³∖{hyperplane}=𝔸³, smooth though Y is singular; A=∅, closure ∅; closure of A is A | W Zariski-open, hence a smooth quasi-projective variety; Y closed in W; Y∖E closed in W∖E | Contract applies with S=W; closure lies in Y; none |
| §6.8, definability hypothesis | Y=𝔸¹, E={0}: A=𝔸¹∖{0}; A={1/n : n≥1} | closure 𝔸¹, analytic; closure {1/n}∪{0}, not analytic at 0 | A definable: yes; no (infinitely many components) | Statement holds on the first, the second is excluded by definability; none |
| §6.9 route (line 1675) | Y singular, closed in Zariski-open W | A closed in Y, so closed, analytic and definable in smooth W | ShimuraVarieties §3.5d at its open head: S smooth, W⊂S^an closed analytic definable ⇒ algebraic | Applies with S=W; algebraic in W, hence in Y; none |
| §2.9 locator (line 551) | arXiv v2 pages 5 and 6 | §2.1 opens on p.5 (source line 248); subset convention at line 268 | page marker for p.6 at line 264 | “pp.5–6, where (p.6)” is correct; none |

Rows for the untouched statements stand as in the previous review, of 3a5156d.

- Source locators checked against the text: 3 (Groechenig–Wyss–Ziegler §2.1, pp.5–6; Peterzil–Starchenko Theorem 4.4, p.12; Mok–Pila–Tsimerman Theorem 2.1 and §2.2, p.5, `ax_schanuel_for_shimura_varieties` lines 170–196). The seeded sample has no target in the changed passages; §6.7, which §6.8 cites, gives the Zariski-open W its definable structure as the route uses it.
- Cross-roadmap citations resolved: ShimuraVarieties §3.5d at its open head (definable Chow for smooth S; no closure theorem stated there, so the gap stays a declared contract); the slug `definable-remmert-stein` has one wording in `plan.json` and in the README; the *Needs:* lines of §§6.8–6.9 are unchanged and agree with the text.
- Gate, my run at 8761a1c: every check 0, `OK`; the worker's run includes the targeted build (`build=0`). Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 11 `sorry` warnings and nothing else; 14 declarations (3 definitions with bodies, 11 theorems), none with a lost binder in the worker's signatures. The diff changes no Lean statement, so no one-tactic probe was due.
- Pull request text against this head, sentence by sentence: it adds the folder with three files (README, `Suggested.lean`, `metadata.toml`; nothing outside the folder); the eight layer bullets match the headings of Layers 0–7; seventeen `### From TauCetiRoadmap.*` suppliers, eleven on main (nine active, RealAlgebraicGeometry and Chebotarev completed) and six open, as listed; ComplexComparisonPartII and StratifiedSpacesAndTameTopology occur once each, in Scope only; the four gaps are named with their suppliers and sections, and gap:definable-remmert-stein is described “in a smooth complex algebraic variety”, as at this head; the Lean imports Mathlib and one Tau Ceti module. The summary block agrees with the README's Summary and Conventions. No sentence is contradicted and no change is left unstated.
- Overlap check: read ShimuraVarieties, StratifiedSpacesAndTameTopology, AbelianSchemesAndArithmeticModuliPartII, HeightsRationalPointsAndObstructions, RandomGraphs, ComputabilityTheory, ClassicalArithmeticCompletion; nothing shared. No other open pull request changes this roadmap, and none drops an id it cites.
- Source independence: changed passages only; 3 passages compared with 3 sources, none shared beyond what the statement of the closure theorem forces; no layer added, removed or reordered, so the arrangement was not compared again; the result of the review of a546807 (largest share Cluckers–Loeser, contents independent) stands.

## Not verifiable

- Bosch–Lütkebohmert–Raynaud §7.3, Proposition 6, p.180 (`blr`, uncertified): cited by locator in §2.10(a); the text was not read.
- As before: `review_source_27`, `schneider`, `hodges` (uncertified) and the waived `vd_dr_tame`, `vd_dr_macintyre_marker`, `pila_wilkie`, `cl_addenda` are cited by locator only.

## Source issues

- none

## For the human reviewers

- The primary texts of Denef, Schneider, Bosch–Lütkebohmert–Raynaud and Hodges are cited by locator without the text (uncertified); four further citations are waived (vd_dr_tame, vd_dr_macintyre_marker, pila_wilkie, cl_addenda).
- This acceptance is conditional on the four declared supplier gaps (README lines 77, 107, 109, 119), none of which its supplier states yet: NeronModelsAndSemistableAbelianVarieties §4.6, ShimuraVarieties §§3.5a and 3.5d, AbelianSchemesAndArithmeticModuliPartII B2.6.
