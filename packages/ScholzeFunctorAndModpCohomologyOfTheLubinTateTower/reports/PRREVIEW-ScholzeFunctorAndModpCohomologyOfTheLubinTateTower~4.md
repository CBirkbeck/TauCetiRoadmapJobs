# Review of ScholzeFunctorAndModpCohomologyOfTheLubinTateTower (pull request #1757 at 020986b)

**Verdict:** accepted

No finding. Incremental re-review of 20 changed lines since fe3535f (README only), plus the pull request's title and description read against this head. Acceptance is conditional on the seven declared supplier gaps, as before.

## Previous findings

The previous report, of `fe3535f`, had no finding; there is nothing to account for.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §4.1 opening sentence, "Sections 4.4 and 6.3 consume it" | every `*Needs:*` line of Layers 4–6 | §4.4 needs §§4.1–4.3 (`README.md:674`); §6.3 needs §§4.1–4.3 (line 842); §§5.1–5.4, 6.1, 6.2, 6.4 cite none of 4.1–4.3 | sentence exact | none |
| §5.1 opening sentence, "Section 5.4 consumes all three, and §§6.1–6.4 consume §5.2" | same | §5.4 needs §§5.1–5.3 (line 771); §5.2 appears in the Needs of 6.1 (797), 6.2 (823), 6.3 (842), 6.4 (860) | sentence exact | none |
| §4.1 globalisation and §4.2 quaternion algebras (cited by the new sentence) | [E:ℚ]=2 and 4 | D₀ ramified at 2, 4 real places; D at (2−1)+1=2, (4−1)+1=4 places; both even, so both algebras exist; odd degree 3 gives 3, excluded | even degree needed, present | none |
| §5.1 finite image (cited by the new sentence) | zero family; k at one index; ⊕ℕk at one index; exact sequence with outer dims 1, 2 | support 0/1/1, dims 0/1/∞: finite, finite, fails; middle dim ≤3, support ≤ union | definition discriminates | none |
| §5.3 count of central characters (run-in part of §5.1) | p=3, 5; p=2 | ℚ_pˣ/p^ℤ≅ℤ_pˣ, pro-p part acts trivially on k̄ˣ-characters, leaving 𝔽_pˣ: 2 and 4 characters; p=2 outside the hypothesis p>2 | finite, as used | none |
| Internal citations of the regrouped parts | §4.2, §4.3, §5.2, §5.3 across the README | run-in titles at lines 621, 639, 711, 740 keep their numbers; the 11, 3, 7 and 2 lines that name them literally resolve to them; each part keeps its own statement, locators, Checks and `*Needs:*` | no citation broken | none |

The diff changes no statement; the rows of every other statement stand as in the previous review, of `fe3535f`.

- Source locators reread at the regrouped sections (sample target 5.1, and 4.1): CDN23 line 1814 (§4.2, p. 43, definition of finite image), line 1893 and line 1906 (p. 45), line 1583 (Proposition 4.5, p. 37); DPS23 line 1748 (Proposition 8.1, p. 37): 5 of 5 agree. The other fourteen sampled targets are untouched by the diff.
- Library declarations: `Suggested.lean` is byte-identical to `fe3535f`; elaborated at this head with `sorry` warnings at lines 70, 120, 138 and nothing else; the five elaborated signatures equal those of the previous round (no section binder lost).
- Cross-roadmap citations: none added or changed; the resolver reports none missing; the roadmaps that cite this one (ProetaleCohomologyOfPAdicCurvesAndTowers, ModpRepresentationsOfGL2OverLocalFields, LubinTateFormalModulesAndQuasiCanonicalLifts at their open heads) cite §0.2, §5.4 and Layer 6 only, none of the four regrouped parts.
- Gate, rerun on this head: `set_option=0 … layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0`. Outside-folder diff empty.
- Dependency check: `depcheck: 239 roadmaps, 2255 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Gaps: 7 slugs in the README, the same 7 in the plan.
- Pull request text, read against the head: title and summary block (coefficients, vanishing above 2(r−1), Moore for odd p, the four end theorems, the two named Lean theorems, the consumer PadicLocalLanglandsForGL2Qp Part II with §§2.5, 5.3–5.4, 6.1–6.3), the folder's three files, 0 `set_option`, 0 sorry'd data, 0 outside paths: 12 sentences checked, none contradicted. The pull request adds the roadmap (not on main), so the regrouping removes no id that main defines and needs no statement in the description.
- Remark, no change asked: §§4.2, 4.3, 5.2 and 5.3 are now bold run-in titles under `### 4.1` and `### 5.1` (the form YangMillsConnectionsAndCaloricGauge uses on main), so a reader of `### k.n` headings alone sees 23 targets where the previous head had 27.

Overlap check: read CompletedCohomologyAndLocalGlobalCompatibility, ModpRepresentationsOfGL2OverLocalFields, ProetaleCohomologyOfPAdicCurvesAndTowers (scope and consumer paragraphs at their open heads); nothing shared: the change adds no object, and ownership of the period torsor (§0.6 there), the mod-p classification and the component theorem (§7.1 there) is as the previous review recorded.

Source independence: changed passages only: 2 passages compared with 2 sources (CDN23, DPS23), none shared; largest share CDN23, 35 of 85 line locators; the diff adds, removes or reorders no layer, so the contents comparison stands as in the previous review.

## Not verifiable

- BW00, Chapter IX, Proposition 2.3: settled as uncertified, cited by locator only, untouched by the diff.
- The description's account of the review rounds before the port is a statement about the board, not about the head; the board holds two package reviews and four red-team reports for this roadmap.
- Ownership against open pull requests beyond the three closest roadmaps was not rechecked: the diff adds no object.

## Source issues

- none

## For the human reviewers

- none
