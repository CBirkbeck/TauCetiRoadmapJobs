# Review of EllipticKTheory (pull request #1489 at 4a5466c)

**Verdict:** accepted

:robot: AI review. Incremental re-review: `TauCetiRoadmap/EllipticKTheory/` changed by 0 lines since the previous review, which also read `4a5466c` and had no findings. This round reads the pull request's title and description against the head. No findings.

## Previous findings

- The previous report (of `4a5466c`) raised no finding, so there is nothing to account for.

## Verified sound

**The pull request's text against the head.** Each sentence of the title, the summary block and the prose was compared with the README and `Suggested.lean`; none is contradicted and no change is left unstated.

- Title "EllipticKTheory: roadmap" and "Roadmap folder `TauCetiRoadmap/EllipticKTheory` (README, `Suggested.lean`, `metadata.toml`)": the folder is absent from main and the pull request adds exactly these three files (3030 insertions, 0 deletions, 0 headings or declarations removed).
- "degrees zero to three … Weierstrass equation", the localisation sequence, SK₁, coniveau K₃, Adams weights, isogeny functoriality, Harder's theorem, minimal regular models, integral K₂, Bloch's classes: README Summary lines 3–19 and Layers 1–8 as headed.
- "`#K₂ᵢ(E) = 1 − a_q qⁱ + q²ⁱ⁺¹`": README lines 13 and 1772 and `card_twistedFrobeniusKernel` (Suggested.lean line 80) carry the same formula; recomputed in the table.
- The three consumers and what each uses: README lines 2717–2724 (EllipticRegulators: Layers 6–7; SpecialValuesBirchTate: §6.8 and §5.11; PadicHodgeRegulators: Layer 5).
- "The scheme is ModularCurves' `WeierstrassCurve.projModel`": README lines 180 and 511. "K₀, the tame symbol and Adams operations come from sibling roadmaps": KTheoryLowDegrees §§12.2, 12.4, K2SymbolsBrauer, SchemeKTheoryOperations (README lines 159–161, 330, 371, 383).
- "Quillen localisation and dévissage through the Cartan equivalence, since affine sequences do not glue": README lines 924–930. "regular non-smooth curves over imperfect fields": line 176. "geometric integrality covers singular cubics": §1.2, lines 545–552. "Bloch's classes extend to positive characteristic prime to C": §7.7, line 2441.
- "the Lean states only real-bodied definitions and theorems": 8 definitions with bodies, 6 theorems, no sorry'd data (gate `sorry-data=0`).
- "Validation": targeted build with `sorry` the only warning, `readme-ids-missing=0`, `set_option=0`, dependency gate 0 problems, outside-folder diff empty: all reproduced below.
- Every supplier the README names under `## Exact supplier contracts` is either on main (ModularCurves, EllipticCurves, AlgebraicCurves, JacobianChallenge, StableReduction, StableHomotopyKTheory) or among the open suppliers the description lists; no supplier is added or dropped unstated.

**Adversarial table.** The diff changes no statement; the row is for the statement the description cites.

| Statement | Instance | Values computed | Result | Change |
|---|---|---|---|---|
| `card_twistedFrobeniusKernel`, as quoted in the description | `y² = x³ + x` over `𝔽₅`, i = 1 | x = 0, 2, 3 give y = 0; x = 1, 4 give non-squares 2, 3; `#E = 4`, `a = 2`; `1 − 10 + 125 = 116`; `(1 − 5(1+2i))(1 − 5(1−2i)) = 16 + 100 = 116`; `116 = 4·29`, prime to 5 | formula = `deg(1 − qπ)`, whole kernel prime to p | none |
| same, i = 0 control | same curve | `1 − 2 + 5 = 4 = #E(𝔽₅)`, the full point group, not `K₀` | `1 ≤ i` in the Lean is needed; description quotes the order for `K₂ᵢ` | none |

The rows for all other statements stand as in the previous review, of `4a5466c`.

- Gate, rerun on this head: `gate EllipticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/EllipticKTheory/Suggested.lean` exits with six warnings, all `declaration uses sorry` (lines 80, 147, 155, 165, 210, 222), and nothing else.
- Diff outside the folder: empty. Worktree clean.
- Cross-roadmap citations resolved again at the suppliers' open heads: K2SymbolsBrauer §10.32c (function-field finiteness), KTheoryFiniteLocalFields §5.17 (Geisser–Levine concentration and field comparison), SchemeKTheoryOperations §6.9 (weight decompositions), KTheoryLowDegrees §12.4 (`K₀(E) ≃ ℤ ⊕ ℤ ⊕ E(k)`), K3BlochGroups §2.2 (injectivity and motivic edge), ArithmeticKTheory §3.2 (finiteness criterion, curveSteinbergHomology_fg): 6 of 6 present.
- `citations.md` lead `RegularProperModel.genericFibreInclusion`: declared in Suggested.lean; not missing.
- `overlaps.md`: no other open pull request changes this roadmap, no dropped id, no revision-only id, no second copy.
- Source locators: the folder is unchanged and no sampled target has a changed passage; the locators stand as verified in the earlier rounds. The three declared gaps are unchanged.

Overlap check: read K2SymbolsBrauer, KTheoryFiniteLocalFields, K3BlochGroups, ArithmeticKTheory, SchemeKTheoryOperations (open) and SchemeAndStackFoundations, EllipticCurves, AlgebraicCurves (main), at the sections this README cites; the results-and-headings list is empty. Shared objects, each with one owner: Milnor tame-kernel finiteness — K2SymbolsBrauer §10.32c; Geisser–Levine field comparison — KTheoryFiniteLocalFields §5.17; indecomposable K₃ edge — K3BlochGroups §2.2; Dedekind finiteness criterion — ArithmeticKTheory §3.2; weight decompositions — SchemeKTheoryOperations §6.9; divisor comparison — AlgebraicCurves Layer 12D.

Source independence: changed passages only; 0 passages changed, so 0 compared; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- **bloch** and **young** are settled as waived, **geisser-levine** and **grayson** as uncertified; their locators are cited as recorded.
- The description's sentence on AI assistance (the number of review and red-team rounds) describes the process, not the folder; it cannot be checked against the head.

## Source issues

- none

## For the human reviewers

- none
