# Review of GeometricTopology (pull request #1797 at 5cb54fc)

**Verdict:** accepted

Incremental re-review of the 77 lines changed since `ff51f30`. No finding.

## Previous findings

- none. The previous report (at `ff51f30`) raised no finding.

## Verified sound

What changed in `TauCetiRoadmap/GeometricTopology/` since `ff51f30`: the route of the reduction in 6.4 (`README.md` lines 8289–8298) is reworded, with no change of statement; `PROGRESS.md` and `STATUS.md` are main's generated files, brought in by the merge of main (`git diff origin/main HEAD` on the folder shows `README.md` and `Suggested.lean` only). `Suggested.lean` and the pins (`lake-manifest.json`, Tau Ceti `2fd255d`) are unchanged.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 6.4 reduction, reworded route (lines 8289–8298), against `levine2016` lines 113–126 | `n = 0`; `P` the core `S¹ × {pt}`; `X = D⁴`; a rational ball `X` with torsion `H₁` | **`n = 0`:** `K` unknot, `J_P` slice, the route ends with `P(unknot)` slice in a rational ball: the hypothesis is contradicted, as it should be. **Core pattern:** `X_P = D⁴`, `J_P` unknot, `∂W` is `0`-surgery on `−K = P(−K)`. **Euler characteristics:** `χ(X) = 1`, `χ(W) = 2`, after sphere surgery `2 − 2 + 0 = 0 = χ(S¹ × D³)`, after the last handle `1 = χ(D⁴)`. **Sphere:** framing `0` in a homology sphere is the Seifert framing, so self-intersection `0`. **Torsion `H₁(X)`:** `W` is only a rational homology `S² × D²`; the README says rational, the source says "homology". | holds | none |
| Locator "from its third sentence on" | proof of Proposition 1.3 | sentence 1 supposes the disc (line 113), sentence 2 normalises the singular points (lines 113–115, replaced here by the definition of a disc with conical singularities), sentence 3 starts the construction (line 115) | holds | none |
| `levine_homology_concordance_theorem` (cited by the changed passage, line 8311) | `Y = S³`, `X = D⁴` | pinned `TauCeti.LevineHomologyConcordanceTheorem` (`KnotTheory/HomologyConcordance.lean` line 74) asks for `K ⊂ Y` concordant to no knot of `S³`; with `Y = S³` every `K` is concordant to itself, so the witness must have `Y ≠ S³`, as `Y_P` is | holds | none |

The rows for all other statements stand as in the previous review, of `ff51f30`.

- Source locators checked against the text: 2 (`levine2016` Proposition 1.3 and its proof, lines 110–126; Theorem 1.2, lines 89–91). No target of the seeded sample falls in a changed passage; the README flags no locator as unverified.
- Library declarations opened at the pin: 2 (`TauCeti.SphereSurgery`, `Topology/Surgery/Basic.lean` line 189; `TauCeti.LevineHomologyConcordanceTheorem`, `KnotTheory/HomologyConcordance.lean` line 74). The sections the passage names, 4.11 and 5.2, exist (lines 6633 and 7251).
- Cross-roadmap citations, resolved again because main moved to `1a19c9f` and three suppliers were revised there. AlgebraicTopology now has Layers, and its lines 851–884 map "Stage k item m" to §k.m, so the Stage citations (lines 1138–1157) and item 6.5 (§6.5, linking forms and degree) stand. DifferentialGeometry line 38 maps 5.5 to 5.5a and 5.5b, and its Layers 3, 4, 5, 12 and items 8.3 (smoothing theorem, boundaryless route by relative Whitney approximation), 8.4 and 12.4 are as cited. ReductiveGroups §11A is at its line 5721. `roadmaps resolve`: nothing unresolved.
- Gate, re-run with `--base origin/main`: every check `0`, `outside-folder=0`, `OK`; the worker's run adds `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Dependency check: `depcheck: 246 roadmaps, 2260 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 34 messages, all `declaration uses sorry`, for 34 theorems. `#check @name` for the 34 in one scratch copy: types as in the previous audit, no binder lost (the file has no `variable`), nothing changed. One-tactic probe (`first | rfl | trivial | decide | infer_instance | (simp; done) | exact fun _ => trivial | sorry`): all 34 fall back to `sorry`, so nothing is padding.
- The description against this head: "This pull request changes GeometricTopology alone" and "this branch carries main's two files unchanged" hold (empty diff outside the folder); #1791 is still open and still conflicts in this README, and the stated order (rebased onto this revision) is unchanged. The rewording of one route needs no mention.
- Overlap check: read FourManifolds, RibbonKnots, TeichmullerGeometry, KhovanovHomology, DiagrammaticCoherence, HomotopySpheres; nothing shared. RibbonKnots (new in the list) owns ribbon discs and ribbon concordance and cites this roadmap's 3.4, 4.3, 4.4, 4.10, 5.1, 6.1, 6.2, 8.1, 8.3.1, 8.5.2 and 11.2, all of which exist at this head; this README states no ribbon target. DiagrammaticCoherence is a named downstream consumer (line 11046).
- Source independence: changed passages only; 1 passage compared with 1 source (`levine2016` lines 113–126), none shared: the longest common runs are the forced phrases "is smoothly slice in `X`" and "a smooth slice disc for `P(−K)`", the sentences are built differently, and the boundary identification is placed before the sphere where the source places it after. No layer was added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- The identification of `∂W` with the `0`-surgery on `P(−K)` rests on the source's Figure 1(b–c), which the extracted text does not contain; it was checked on the core pattern only (row 1).
- Ownership against open pull requests: RibbonKnots was read through `roadmaps show`; PlanarTopology and SurfaceTopology (one open pull request) were not read at their head, and this README cites neither.

## Source issues

- **Misprint** in levine2016 at the proof of Proposition 1.3, printed p. 3 (line 126): the source says the final slice disc contradicts the conclusion of Theorem 1.1; it should be the conclusion of Theorem 1.2, the hypothesis of the proposition; affects nothing.
- **Misprint** in levine2016 at the proof of Proposition 1.3, printed p. 3 (lines 118 and 123): the source says the two intermediate manifolds are a homology `S² × D²` and a homology `S¹ × D³`; it should be rational homology, since the ball is only a rational homology ball; affects nothing.

## For the human reviewers

- none
