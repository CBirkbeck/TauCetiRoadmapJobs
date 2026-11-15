# Review of TropicalAndBerkovichArithmetic (pull request #1494 at e9a0ac4)

**Verdict:** needs changes

Incremental re-review of the 116 lines changed since `44a1641`, and of the pull request's title and description. One P3 finding; no P1 or P2.

## R01 (P3) — `StrictAnalyticSpace` is not a name the supplier has

**Location:** `TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:132`: “ClassicalAdicEtaleCohomology §3.1 (`StrictAnalyticSpace`, its Berkovich realization u and inverse s₀, the maximal Hausdorff quotient identification, …)”.

**Claim:** The backticked name is a declaration or named target of ClassicalAdicEtaleCohomology §3.1.

**Witness:** At the head of ClassicalAdicEtaleCohomology's open pull request, `README.md:1333` defines “the strict analytic spaces over `K`” in prose; neither its README nor its `Suggested.lean` (133 lines) contains `StrictAnalyticSpace`. The pinned Mathlib and Tau Ceti have no such name either.

**Repair:** Replace the parenthesis by prose, as the same repair did for the other names: “ClassicalAdicEtaleCohomology §3.1 (the Hausdorff strict analytic spaces, their Berkovich realization u and inverse s₀, the maximal Hausdorff quotient identification, and the boundary, properness, étale and smooth comparisons)”. Each item is at that section: lines 1333 and 1339–1350.

## Previous findings

- R01 — repaired: “ShimuraCompactifications §0.16 … Section 0.17 supplies the finite-fan toric morphisms” at README lines 11, 159, 1730 and 1926; no `C0.16`/`C0.17` remains. The supplier heads them `### 0.16` (line 746) and `### 0.17` (line 773).
- R02 — partly repaired: `abelianLog.*`, the nine qualified `StrictAnalyticSpace.*` names, `AnalyticTateQuotient` and `qePairPrincipalization` are replaced by the suppliers' prose items; the bare `StrictAnalyticSpace`, which the previous repair text kept, exists nowhere (R01 above).

## Verified sound

| Statement (changed or cited by a change) | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| 2.1 semistable vertex set, reworded definition | ℙ¹ with V=∅ and V={Gauss}; Tate curve, one type-2 point; two punctures in one ball | V=∅: one component, ℙ¹, neither ball nor annulus, rejected. Gauss: all components balls, 0 annuli, accepted. Tate: 1 annulus, rest balls, accepted. Two punctures: rejected | Same object as before the rewording; “finitely many” admits 0; — |
| 2.1 opening sentence: “Sections 2.3–2.7, 2.11, 2.21 and 5.4 need them” | Every `*Needs:*` line citing 2.1 or 2.2 | Citing sections found: 2.3 (2.1); 2.4, 2.5, 2.6, 2.7, 2.11, 2.21, 5.4 (2.2) | Lists agree; — |
| 2.3 opening sentence: “Sections 2.7, 2.9, 2.18 and 2.20 need these results” | `*Needs:*` lines citing 2.3–2.6 from outside the group | 2.7 and 2.18 cite 2.4; 2.9 cites 2.5; 2.20 cites 2.6 | Lists agree; — |
| 2.7 opening sentence: retraction for 2.13 and 3.6, continuity for 2.18, 2.20, 5.1 | `*Needs:*` lines citing 2.7 and 2.8 | 2.7 cited by 2.13, 3.6 (and 2.8 inside the group); 2.8 by 2.18, 2.20, 5.1 (and 2.9 inside) | Lists agree; — |
| 2.19 opening sentence: χ≤0 for the minimal skeleton, χ<0 for the stable set | Statements 2.20–2.23; G_m, ℙ¹, three-punctured ℙ¹ | 2.20 and 2.22 state χ≤0; 2.21 and 2.23 state χ<0. χ(G_m)=0, χ(ℙ¹)=2, χ(ℙ¹∖3 points)=−1: line intrinsic, none, tripod with one stable vertex | Bounds as in the targets; — |
| Grouped targets 2.2, 2.4–2.6, 2.8, 2.9, 2.20–2.23 | All 19 links whose text carries one of these numbers | Each link's title equals the bold-labelled target's title; each anchor is the enclosing `###` heading; 0 anchors without a heading in the whole README | No broken reference; — |
| 5.4 finite-subgraph faithful tropicalization, reworded | One-point Γ; a segment of length L with a primitive coordinate; coordinate T² | Point: distance 0 on both sides. Primitive slope: image length L. T²: image length 2L, not an isometry, so excluded | Hypotheses and conclusion unchanged from the previous head (finite Γ in H°, quasiprojective toric target, image meets T, isometry onto image); — |
| 2.11 and 2.13 `*Needs:*` (seeded sample; link targets changed) | The two changed links | 2.11 → “2.2 Skeleton…” under `### 2.1`; 2.13 → `### 2.7`; both headings exist with those titles | Resolved; — |
| Supplier parentheses at README 119, 132–133, 163, 2335 | Each prose item, in the supplier's text | AnabelianGeometryAndNonabelianChabauty 5.8 (line 7503): local logarithm, identity differential, functoriality, all-ℂ_p extension. ClassicalAdicEtaleCohomology 3.7: Tate quotient (1818), degree-one criterion (1831). Resolution 7.7 (1131) | Items present; `StrictAnalyticSpace` absent: R01 |

The rows for the statements the change leaves untouched stand as in the previous review, of `44a1641`. `Suggested.lean` is unchanged since then.

- Gate at this head (worker's record): every check 0, `build=0 OK`. Dependency check, run here: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration with `lake env lean` of `Suggested.lean`: six `sorry` warnings, nothing else. The nine elaborated signatures in the worker's listing show no dropped binder.
- No file changed outside the roadmap folder (the diff against `origin/main` outside it is empty).
- Cross-roadmap citations resolved in the changed lines: 5 (ShimuraCompactifications 0.16 and 0.17, AnabelianGeometryAndNonabelianChabauty 5.8, ClassicalAdicEtaleCohomology 3.1 and 3.7, ResolutionOfSingularitiesCharacteristicZero 7.7), each at its open head or on main.
- Source locators opened for the two reworded passages: bpr-structure line 335 (Definition 3.1) and bpr-metrics line 56 (Theorem 1.1); hypotheses match, longest shared run four words (“a finite set V”, “quasiprojective toric”).
- Pull request text against the head: the summary block, the prose paragraph, the validation line (build, 0 missing identifiers, 0 `set_option`, 0 sorry'd data, 0 outside paths) and the downstream claims (README lines 2523–2525) agree with this head; the change adds the folder, removes no heading and no declaration, and adds or drops no supplier since `44a1641`.
- Overlap facts: no other open pull request changes this roadmap, no cited id is dropped, no second copy on main.
- Design gaps: unchanged since `44a1641`; the change touches none of §§0.15a, 0.17a, 4.0, 6.1a–6.2, 7.0.

Overlap check: read ArithmeticDynamics, ArakelovGeometryAndAbelianHeightsPartII, ColemanIntegrationPartII, AdicSpacesPartV and ClassicalAdicEtaleCohomology as listed (no roadmap on main and none by results is listed); the change moves no object between owners; nothing shared.

Source independence: changed passages only; 6 passages (the two reworded statements and the four new section openings) compared with 2 sources (bpr-structure, bpr-metrics), none shared; largest share bpr-structure, 25 of the README's linked citations; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- berkovich-spectral (waived), fresnel-matignon, huber-1994 and huber-1996 (uncertified): as in the previous review; no changed passage cites them.

## Source issues

- none

## For the human reviewers

- The change groups §§2.1–2.9 under three headings; their locators still run through bpr-structure Definition 3.1 to Proposition 3.9 in the source's order (`README.md:1070–1213`). The arrangement was not compared again in this incremental round.
- berkovich-spectral is cited by locator under a waiver and three sources are uncertified (`README.md` References); their texts were not read in either round.
