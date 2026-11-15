# Review of ComplexMultiplicationAndExplicitReciprocityPartII (pull request #1695 at 72c447f)

**Verdict:** needs changes

## R01 (P3) — The description derives the CM lift heights from the averaged formula

**Location:** pull request description, summary block (`<!-- roadmap-summary -->`): “From that mean come individual CM height bounds, Galois-orbit lower bounds […], polynomial heights of CM lifts, and finiteness of CM points of bounded moduli degree.” The prose paragraph repeats it: “The shared formula supplies […] polynomial heights of CM lifts”.

**Claim:** The polynomial height bound for CM lifts is a consequence of the averaged Colmez formula.

**Witness:** `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:183`: “Layer 13 supplies the independent period-coordinate estimate”. The *Needs* line of §13.4 (README:1249) lists §13.3, §13.1 and two suppliers; no target of Layers 9–12 except the definition §12.1 (through §13.1).

**Repair:** In the summary block: “From that mean come individual CM height bounds and Galois-orbit lower bounds for primitive and then for all CM points of A_g. An independent period-coordinate estimate gives polynomial heights of CM lifts; the orbit bound and the lift heights together give finiteness of CM points of bounded moduli degree.” In the prose paragraph: “The shared formula supplies individual CM height bounds and primitive and general center-order Galois-orbit bounds; with the independent polynomial height bound for CM lifts these give finiteness at bounded polarized moduli degree.” Tested on §13.5's *Needs* (README:1259): §12.5, §13.4, §13.1, as the new text says.

## R02 (P3) — The plan still points the absolute-Hodge gap at §B1.3

**Location:** `packages/ComplexMultiplicationAndExplicitReciprocityPartII/design/plan.json:4281`, `"section": "§B1.3"`, gap `absolute-hodge-padic-comparison`. Previous R01, unchanged. The file is on the board, not in the pull request; the folder's `README.md:89` already says “extending §1.3”.

**Claim:** The declared extension is located at AutomorphicBundles §B1.3.

**Witness:** AutomorphicBundles at its indexed head: line 876 is “### 1.3 Descended Hodge-tensor realizations” under “## Layer 1: canonical principal bundles of Hodge and abelian type” (line 806); no heading or text “B1.3”.

**Repair:** In the plan's `gaps` entry for this slug, `"section": "§1.3"`. It then equals README:89 and README:412 (“AutomorphicBundles §1.3 (gap:absolute-hodge-padic-comparison)”). Nothing in the pull request's folder changes.

## Previous findings

- R01 — not repaired: plan:4281 still reads `"section": "§B1.3"`; README:89 reads “extending §1.3”, which resolves. Carried as R02; the repair is outside the pull request's folder.

## Verified sound

:robot: Independent AI incremental re-review; 0 changed lines in the folder since `72c447f`. This round read the pull request's title and description against the head.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §9.1 averaged Colmez formula, as the description states it (“mean Faltings height … through the quadratic Hecke logarithmic derivative at 0 and D_E, D_F”) | g=1, E=ℚ(i), D_E=4, D_F=1, one type up to conjugation | ℓ(0)=−log 4+2 log(Γ(1/4)/Γ(3/4))=0.7831888; right side −0.3915944−0.3465736−0.9189385=−1.6571065. Left: η(i)=0.7682254, h_Fal=−log 2π−2 log η(i)=−1.3105329, h_Falt=h_Fal−(log 2)/2=−1.6571065. | Agree to 7 places; sign and factor of every term as in README:27 and §9.1. No change. |
| Description: lift heights “come from” the mean (R01) | *Needs* of §§13.1–13.5 | §13.4 ← §13.3, §13.1; §13.3 ← §13.2, §13.1; §13.1 ← §12.1 (definition). Count of Layer 9–11 targets reached: 0. §13.5 ← §12.5, which reaches §11.3 and §10.3. | Refutes the sentence for §13.4 only; orbit bounds and finiteness do use the mean. R01. |
| LT.2 contract (README:97), now resolved at the supplier's open head | π^r u with r=0, u=2 over ℚ₅; r=1, u=1 | Supplier §2.5 (its README:1162–1165): χ_π(Art_K(π^r u))=u⁻¹, so 2↦3 mod 5 and π↦1; README:97 states χ_π(rec_K(π^r u))=u⁻¹. Ids LT.2 and the four cited headings found at its lines 494–499. | Same convention on both sides. No change. |
| Absolute-Hodge gap locator (R02) | Heading search at the supplier's head | “1.3” headings: 1 (line 876); “B1.3” occurrences: 0; slug identical in plan and README. | Locator defect in the plan only. R02. |

Rows for every other statement stand as in the previous review, of `72c447f`.

- Description sentences checked against the head: 14 (summary block 9, prose 5). Correct apart from R01: it says it adds the roadmap folder with its three files (diff: 1418 insertions, 0 deletions, 3 files); two Lean headlines named, both declared; “either route alone suffices” = README:183 and §9.1; “defined but never assumed” = §0.4 and §9.1; 3 review and 2 red-team rounds match the board's reports.
- Gate rerun at this head: every check 0, OK. Outside-folder diff: 0 paths. Worktree clean before and after.
- Dependency check: `depcheck: 243 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD or CYCLE line. LubinTateFormalModulesAndQuasiCanonicalLifts is at line 360 of the merge order, this roadmap at 387.
- Elaboration: `lake env lean` on `Suggested.lean` gives two `sorry` warnings (lines 53, 75) and nothing else; targeted build succeeds (8963 jobs).
- Signatures: both elaborated types compared with README §§10.1–10.2; each keeps g>0, ε>0, `Field`, `NumberField`, `IsCMField`, degree 2g; no binder lost. Unchanged since the previous review, so the one-tactic probe was not repeated.
- Cross-roadmap citations resolved afresh: 2 (LT.2 at its open head, AutomorphicBundles §1.3 at its indexed head). The citation resolver lists none missing; the overlap tool lists no dropped id, no second copy, no other pull request changing this folder.
- Overlap check: searched main and the open heads for the averaged Colmez formula as a target; GrossZagierAndArithmeticHeights, ArakelovGeometryAndAbelianHeights, HilbertModularVarietiesAndShimuraCurves, ComplexMultiplicationAndExplicitReciprocity cite the source for their own targets and none states the formula; nothing shared. Their scope sections were not reread this round; FaltingsFinitenessAndIsogenyTheoremsPartII and AnalyticNumberTheoryPartI stand as audited before.
- Source independence: changed passages only; the folder changed by 0 lines, so 0 passages compared with 0 sources; largest share A, 39 of 86 bracketed locators; no layer added, removed or reordered, so the contents were not compared again.
- Remark on untouched text: the README's Summary sentence “Use their common average to bound … and obtain polynomial heights of CM lifts” can be read as R01's claim; README:183 settles the reading.

## Not verifiable

- The nine declared supplier gaps are contracts, not proved statements; this review checked only that slugs agree between plan and README.
- The source sample was not reread: no passage of the folder changed, and the previous reviews' locator checks stand.
- “AI assistance: codex (gpt-6.1-sol) ported the package”: the round counts match the board's reports; the tool and model named cannot be checked from the files.

## Source issues

- none

## For the human reviewers

- The description does not mention that the README declares nine supplier gaps (README:71, 89, 117, 131, 141, 151, 153, 161, 163); two name roadmaps on main (ClassFieldTheory Layer 13, GlobalNumberFields Layer 11) as the place of the extension.
- R02 concerns a board file outside the pull request; whether it should hold back approval of the folder is yours to decide.
