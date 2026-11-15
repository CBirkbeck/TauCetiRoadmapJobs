# Review of WeilConjectures (pull request #1208 at 9587601)

**Verdict:** accepted

Incremental re-review: the folder has 0 changed lines since 9587601; this round read the pull request's title and description, as they stand now, against the head. No finding.

## Previous findings

- R01 — repaired: the summary block now reads "Root bounds from weighted moments hold over any normed field; the unweighted power-sum converse and its all-powers equivalence need characteristic zero", as `TauCetiRoadmap/WeilConjectures/README.md:906, 938` say.
- R02 — repaired: the description now names "AnalyticToricGeometryPartII §6.1 also for the operational Chow/Minkowski-weight comparison of possibly singular complete fans, which this roadmap does not state", matching README:49–51; consumers as at README:1999–2002.

## Verified sound

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §5.5 unweighted power-sum converse (repaired summary sentence) | `𝔽₂((t))`, `α = (1,1)`; ℂ, `α = (3,3)` | Char 2: moments `1+1 = 0 ≤ 0·0ⁿ`, yet `|1| = 1 > 0`, so characteristic zero is needed. ℂ: moments `2·3ⁿ`, `C = 2`, `R = 3`, `|α_i| = 3 ≤ 3`. | Description now agrees with README:938 |
| §5.4 `norm_le_of_grouped_moment_bound` (same sentence) | char-2 family above; ℂ, `α = (3,3)`, `w = (1,1)` | Char 2: fibre weight `1+1 = 0`, the nonzero-weight hypothesis fails, nothing asserted. ℂ: fibre weight 2, moments `2·3ⁿ`, conclusion `‖3‖ ≤ 3`. | Sound over any normed field, as the description says |
| §7.16 `weilConjectures_smooth_proper` with `functional_equation_of_smooth_proper` (named in the summary) | `ℙ¹/𝔽₃` | `Z = 1/((1−T)(1−3T))`; reciprocal roots `1`, `3` = `q⁰`, `q¹`; `Z(1/(3T)) = 3T²/((3T−1)(T−1)) = +3T²·Z(T)`, and `q^{dχ/2}T^χ = 3T²` (`d = 1`, `χ = 2`). | Sound; sign `+` |
| §5.19 comparison with the pinned elliptic point count (described in the description) | `y² = x³ − x` over `𝔽₅` | Affine solutions by `x = 0..4`: 1, 1, 2, 2, 1 = 7, plus infinity = 8; `a = 6 − 8 = −2`, `|a| ≤ 2√5 ≈ 4.47`; `N₂ = 26 − (a² − 2·5) = 26 + 6 = 32`. | Sound; description matches README:1147–1153 |

The rows for all other statements stand as in the previous review, of 9587601.

- Description against the head, sentence by sentence: the title equals the README's H1; the pull request adds the roadmap (not on main; 2192 insertions, 0 deletions; 100 headings and 8 declarations added, none removed), and the description says nothing that the head contradicts; "six `sorry` declarations" = the 6 theorems beside the 2 real-bodied definitions.
- Supplier lists: the ten open suppliers and their numbers (#848, #849, #850, #856, #870, #929, #1002, #1040, #1062, #1313) are exactly the open new roadmaps the README cites as suppliers (resolved with `roadmaps list`); SchemeAndStackFoundations, EtaleCohomologyFoundations, AlgebraicCurves, EllipticCurves, ReductiveGroupsPartII are on main and AnalyticToricGeometry under `Completed/`; the three non-prerequisites resolve at their open heads: ShimuraCompactifications §§0.16–0.17, AnalyticToricGeometryPartII §§1.1–1.2 and §6.1, QWittVectors §§1.3–1.4a (headings present).
- Summary block: two curve routes (README:7), no semisimplicity assumption (README:85, 1359, 1983), nonprime `q` (README:1932), characteristic-zero scope of §§5.5–5.6 (README:938), weighted statements over any normed field (README:892–906, 1081–1083), `weilConjectures_smooth_proper` declared (`TauCetiRoadmap/WeilConjectures/Suggested.lean:145`).
- Gate on this head: `gate WeilConjectures: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate also records `build=0`.
- Elaboration: `lake env lean TauCetiRoadmap/WeilConjectures/Suggested.lean` gives six `declaration uses sorry` warnings (lines 70, 80, 94, 105, 122, 145) and nothing else, as the validation paragraph states.
- Dependency check: `depcheck: 245 roadmaps, 2242 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder.
- Seeded sample, signatures, padding probe: no sampled target lies in a changed passage (none changed); the eight declarations and their elaborated signatures are those of 9587601. The three "Lean names found nowhere" leads (README:130) are a supplier roadmap's names in the supplier table, untouched text.
- Overlap check: read DeligneWeightsAndPurity, AnalyticToricGeometryPartII, CurvesOverFiniteFields; nothing shared (DeligneWeightsAndPurity owns rationality, extraction and purity, cited here; AnalyticToricGeometryPartII cites WeilConjectures §6.4 as owner of the nonprojective threefold; CurvesOverFiniteFields leaves the cohomological route to this roadmap and declares no name of this `Suggested.lean`).
- Source independence: changed passages only; 0 passages changed, so none compared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- None this round. The earlier items on untouched text (Fulton for §§6.2–6.4, Kedlaya's published numbering for §6.9, Fujino–Sato for §6.4) were not re-attempted.

## Source issues

- none

## For the human reviewers

- none
