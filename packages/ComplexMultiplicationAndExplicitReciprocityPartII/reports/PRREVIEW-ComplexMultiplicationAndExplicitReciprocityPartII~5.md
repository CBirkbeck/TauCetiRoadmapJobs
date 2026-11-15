# Review of ComplexMultiplicationAndExplicitReciprocityPartII (pull request #1695 at 75a3fac)

**Verdict:** needs changes

## R01 (P3) — Two Mathlib line locators in the geometry-of-numbers contract are still those of the earlier pin

**Location:** `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:149`: “`NumberField.mixedEmbedding.covolume_integerLattice` (`Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean`, line 124) and `ZLattice.covolume_div_covolume_eq_relIndex'` (`Mathlib/Algebra/Module/ZLattice/Covolume.lean`, line 170)”.

**Claim:** At the pinned Mathlib the two declarations are at lines 124 and 170.

**Witness:** At the pin of this head (Mathlib `1b1ccf4`), `Discriminant/Basic.lean:124` is the `rfl` closing the preceding proof and the theorem is at line 126; `Covolume.lean:171` is `theorem covolume_div_covolume_eq_relIndex'`. Lines 124 and 170 were right at the pin of `72c447f` (Mathlib `f6090c7`).

**Repair:** In README:149 write “line 126” for `NumberField.mixedEmbedding.covolume_integerLattice` and “line 171” for `ZLattice.covolume_div_covolume_eq_relIndex'`. Tested: both lines at the pin open with the `theorem` keyword and the cited name. The third locator of that paragraph (`TauCeti/LinearAlgebra/IntegralLattice/Basic.lean`, line 63) is right as it stands.

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: summary block: “A period-coordinate estimate independent of the mean bounds CM lift heights polynomially; with the orbit bound, this gives finiteness”; prose: “come from a period-coordinate estimate that does not use the formula”. README Summary reworded to match.
- R02 — not repaired: deferred (D01)

## Verified sound

:robot: Independent AI incremental re-review of 14 changed lines since `72c447f` (README lines 3, 43, 45, 47, 53, 55, 57), and of the pull request's title and description against this head.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| README Summary (changed): lift heights come from “a period-coordinate estimate that does not use the average” | *Needs* closure of §13.4 | §13.4 ← §13.3, §13.1; §13.3 ← §13.2, §13.1; §13.2 ← suppliers only; §13.1 ← §12.1; §12.1 ← suppliers only. Targets of Layers 9–11 reached: 0. | Holds; agrees with README:183 and both description sentences. |
| README Summary (changed): “combine it with the orbit bound for finiteness” | *Needs* of §13.5 | §13.5 ← §12.5, §13.4, §13.1; §12.5 ← §11.3 ← §11.2 ← §10.3 (uses the average). | Holds: finiteness uses the average only through the orbit bound. |
| README:43 (changed locators), regulator ratio cited for `relative_class_number_growth` | g=1, 2, 3 | Mathlib `CMField.lean:439–440`: `regulator K / regulator K⁺ = 2 ^ rank K * (indexRealUnits K)⁻¹`; rank g−1 gives 1/Q, 2/Q, 4/Q. README: 2^(g−1)/Q_E; degree six “2 or 4”: 4/2=2, 4/1=4. | Agree. |
| README:55 (changed locators), order discriminant | O=ℤ[2i]⊂ℚ(i) | `Discriminant.lean:115`: `O.discr = O.index ^ 2 * NumberField.discr K`; index 2, disc K=−4, so −16; disc of basis {1,2i}: det[[2,0],[0,−8]]=−16. | Agree with “disc O=[O_K:O]² disc K”. |
| README:149 (R01), covolume of a CM ideal | I=ℤ[i], g=1, D_E=4 | `Discriminant/Basic.lean:126–128`: `(2⁻¹) ^ nrComplexPlaces K * √|discr K|` = 2⁻¹·2 = 1; README: 2^(−g)√D_E[O_E:I] = 1. | Statement agrees; only the two line numbers are stale. R01. |

Rows for every other statement stand as in the previous review, of `72c447f`.

- Library locators checked at the pins of this head (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`): 30 line numbers in README:43–57 and 149; 28 open on the cited declaration (the 20 that the diff changed, the 7 unchanged ones in lines 51 and 53, and `IntegralLattice/Basic.lean:63`), 2 do not (R01). `Suggested.lean` carries no line locator.
- Description sentences read against the head: 14 (summary block 9, prose 5); none contradicted. Title and “adds the roadmap folder” agree with the diff against the base (1418 insertions, 0 deletions, 3 files; 2 Lean declarations added, both named). “the Mathlib and Tau Ceti that main pins”: `lake-manifest.json` at this head equals `origin/main`'s.
- Gate rerun at this head: every check 0, OK (worker's gate: the same, with `build=0`). Outside-folder diff against the base: 0 paths; the files listed as changed outside the folder since `72c447f` are those of the merge of main. Worktree clean before and after.
- Dependency check: `depcheck: 239 roadmaps, 2255 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` at the new pins gives two `sorry` warnings (lines 53 and 75) and nothing else. The two elaborated signatures keep g>0, ε>0, `Field`, `NumberField`, `IsCMField` and degree 2g; the Lean file is unchanged since `72c447f`, so the one-tactic probe was not repeated.
- Cross-roadmap citations: the diff changes none; the citation resolver lists none missing, and the overlap tool lists no dropped id, no second copy and no other pull request changing this folder.
- Overlap check: the diff adds no object; GrossZagierAndArithmeticHeights, ComplexMultiplicationAndExplicitReciprocity, FaltingsFinitenessAndIsogenyTheoremsPartII, ArakelovGeometryAndAbelianHeights, HilbertModularVarietiesAndShimuraCurves and AnalyticNumberTheoryPartI stand as audited in the earlier reviews (scope sections not reread this round); nothing shared.
- Source independence: changed passages only; 1 prose passage (the README Summary's new sentences) compared with 2 sources (T abstract and introduction, PT), none shared; the other changed passages are line numbers; largest share A, 39 of 86 bracketed locators; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- The nine declared supplier gaps are contracts, not proved statements; this round checked only that `gap:absolute-hodge-padic-comparison` still reads §1.3 in the README (lines 89, 412) and §B1.3 in the plan (D01).
- The seeded source sample was not reread: no passage with a source locator changed.
- “AI assistance: codex (gpt-6.1-sol) ported the package”: the tool and model named cannot be checked from the files.

## Source issues

- none

## For the human reviewers

- The description does not mention that the README declares nine supplier gaps (README:71, 89, 117, 131, 141, 151, 153, 161, 163); two name roadmaps on main (ClassFieldTheory Layer 13, GlobalNumberFields Layer 11) as the place of the extension.
- D01 concerns a board file outside the pull request (`packages/ComplexMultiplicationAndExplicitReciprocityPartII/design/plan.json:4281`, `"section": "§B1.3"`); whether it should hold back approval of the folder is yours to decide.
