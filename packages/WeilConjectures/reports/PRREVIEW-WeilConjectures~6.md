# Review of WeilConjectures (pull request #1208 at 9587601)

**Verdict:** needs changes

Incremental re-review: the folder has 0 changed lines since 9587601, so this round read the pull request's title and description against the head. Two sentences of the description are contradicted by the README; both repairs are edits of the description only.

## R01 (P3) — The summary claims every moment lemma holds over any normed field

**Location:** pull request description, `<!-- roadmap-summary -->` block, "Approach and generality": "The moment lemmas hold over any normed field, and quasi-elliptic and nonclassical Enriques surfaces are included."

**Claim:** The unweighted moment statements of §§5.5–5.6 need characteristic zero; only the weighted statements (§§5.2–5.4, 5.7, 5.15, and `norm_le_of_grouped_moment_bound`) hold over every normed field.

**Witness:** `TauCetiRoadmap/WeilConjectures/README.md:938`: "For a characteristic-zero normed field and any finite family `α` …". Over 𝔽₂ with the trivial norm, `α = (1,1)`: every moment is 0 (`C = R = 0`), yet `|α_i| = 1` (README:926–928).

**Repair:** Replace the sentence by: "The weighted moment lemmas hold over any normed field (the unweighted power-sum converse and its equivalence need characteristic zero), and quasi-elliptic and nonclassical Enriques surfaces are included."

## R02 (P3) — AnalyticToricGeometryPartII is not named "only as a consumer"

**Location:** pull request description, dependencies paragraph: "The README names ShimuraCompactifications and AnalyticToricGeometryPartII only as consumers, and QWittVectors only as the owner of the carrier of a formula this roadmap excludes; none of them is a prerequisite."

**Claim:** The README also names AnalyticToricGeometryPartII in "Scope and ownership", as the owner of a neighbouring comparison that this roadmap does not state.

**Witness:** `TauCetiRoadmap/WeilConjectures/README.md:49–51`: "AnalyticToricGeometryPartII §6.1's operational Chow/Minkowski-weight comparison for possibly singular complete fans has a different scope from the smooth Chow-ring and cycle comparison here."

**Repair:** Replace the sentence by: "The README names ShimuraCompactifications (§§0.16–0.17) and AnalyticToricGeometryPartII (§§1.1–1.2) as consumers, AnalyticToricGeometryPartII §6.1 also as the owner of the operational Chow comparison for singular complete fans, which this roadmap does not state, and QWittVectors only as the owner of the carrier of a formula this roadmap excludes; none of them is a prerequisite."

## Previous findings

- none: the previous report, of 9587601, raised no finding (its R01–R04 bullets recorded repairs of the review before it, and the folder is unchanged since).

## Verified sound

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §5.5 unweighted power-sum converse (R01) | `𝔽_p((t))`, `α = (1,…,1)` (`p` copies); ℂ, `α = (2,2)` | Char `p`: moments `p·1 = 0 ≤ 0·0ⁿ`, but `|1| = 1 > 0`: fails without characteristic zero. ℂ: moments `2·2ⁿ`, `C = R = 2`, `|α_i| = 2`. | README sound; description overclaims (R01) |
| §5.4 `norm_le_of_grouped_moment_bound` (R01) | same char-`p` family; `α = (2,2)`, `w = (1,1)` over ℂ | Char `p`: fibre weight `p = 0`, hypothesis `hw` fails, no claim. ℂ: weight 2, moments `2·2ⁿ`, bound `‖2‖ ≤ 2`, equality. | Sound over any normed field |
| §7.16 `weilConjectures_smooth_proper` (named in the summary) | `ℙ¹/𝔽₂` | `P = (1−T, 1, 1−2T)`; zeros `1`, `1/2` have moduli `2⁰`, `2^{−1}` = `q^{−i/2}`; reciprocal roots `1`, `2` = `q^{i/2}`, as the summary says; degrees `(1,0,1)` symmetric. | Sound |
| §5.19 comparison (described in the description) | `y² = x³ − x` over `𝔽₅` | `pointCount` 8, `a = −2`; `S₂ = (−2)(−2) − 5·2 = −6`, `N₂ = 26 + 6 = 32 = 4·8`. | Sound; description matches |

The rows for all other statements stand as in the previous review, of 9587601.

- Description against the head, sentence by sentence: title equals the README's H1; folder contents (README, `Suggested.lean`, `metadata.toml`) as listed; the pull request adds the roadmap (not on main: 2192 insertions, 0 deletions, 100 headings and 8 declarations added, none removed).
- Supplier lists: the ten open suppliers and their numbers (#848, #849, #850, #856, #870, #929, #1002, #1040, #1062, #1313) agree with `roadmaps list` and are exactly the roadmaps the README cites that are not on main, apart from the three non-prerequisites; SchemeAndStackFoundations, EtaleCohomologyFoundations, AlgebraicCurves, EllipticCurves and ReductiveGroupsPartII are on main, AnalyticToricGeometry under `Completed/`.
- Pinned-library paragraph: every item it lists (finite-field extensions, `Matrix.charpolyRev`, Laurent series, point count, Hasse bound, genus-one zeta, projective Weierstrass model, Artin–Schreier function fields, representation-ring characters, toric fans) is in "From Mathlib and Tau Ceti" (README:107–216); §§5.19, 7.4, 7.5, 7.6 read as described (README:1143–1157, 1682–1742).
- Validation paragraph: `lake build TauCetiRoadmap.WeilConjectures.Suggested` succeeds with six `sorry` warnings and Lake's `module` notice, as stated; `lake env lean TauCetiRoadmap/WeilConjectures/Suggested.lean` gives the six `sorry` warnings (lines 70, 80, 94, 105, 122, 145) and nothing else.
- Gate on this head: `gate WeilConjectures: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate also records `build=0`.
- Dependency check: `depcheck: 247 roadmaps, 2246 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder.
- Seeded sample and signatures: no sampled target lies in a changed passage (none changed); the eight elaborated signatures are those the previous review compared, with no lost section binder.
- Overlap check: the overlap file lists no shared roadmap, dropped id or revision-only id; the scopes of the closest roadmaps (DeligneWeightsAndPurity, AnalyticToricGeometryPartII, CurvesOverFiniteFields) were not re-read this round, the folder being unchanged since the review that read them.
- Source independence: changed passages only; 0 passages changed, so none compared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- None this round. The earlier items on untouched text (Fulton for §§6.2–6.4, Kedlaya's published numbering for §6.9, Fujino–Sato for §6.4) were not re-attempted.

## Source issues

- none

## For the human reviewers

- none
