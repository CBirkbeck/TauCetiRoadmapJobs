# Review of StratifiedSpacesAndTameTopology (pull request #1519 at 8bb72e2)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since bd1eb6b. The folder is byte-identical to the head the previous review read, and the description is unchanged, so both findings of that review remain. Both are in the pull request's description; neither asks for a change to the folder.

## R01 (P3) — The description lists ShimuraVarieties §3.5a as a supplier

**Location:** Description, "Ownership and suppliers", first bullet under "It consumes:": "ShimuraVarieties §§3.4b–3.4e (o-minimal structures, definable maps, cell decomposition, dimension, definable choice, curve selection) and §3.5a (the o-minimality of `ℝ_an,exp`);"
**Claim:** The head consumes nothing from §3.5a. The README leaves the o-minimality of `ℝ_an,exp` to ShimuraVarieties, so the bullet states a supply edge the head does not have.
**Witness:** `TauCetiRoadmap/StratifiedSpacesAndTameTopology/README.md` 179–191 ("From ShimuraVarieties") lists §§3.4b–3.4e only; §3.5a occurs once, at 53–54, under what is left to other roadmaps; the *Needs:* lines 552, 587, 926, 963 name §§3.4b–3.4e only.
**Repair:** Replace the bullet with: "- ShimuraVarieties §§3.4b–3.4e (o-minimal structures, definable maps, the semialgebraic structure on `ℝ`, cell decomposition, dimension, definable choice, curve selection); the o-minimality of `ℝ_an,exp` (§3.5a) is left to ShimuraVarieties and is not consumed;"

## R02 (P3) — The description lists the triangulation theorems of R2.1 and A4.1 as consumed

**Location:** Description, "Ownership and suppliers", fourth bullet under "It consumes:": "RealAnalyticGeometry R2.1 (for bounded sets, 4.3 follows from it by inverting its homeomorphism), and AffineMorseLefschetz A4.1, whose existential triangulation of compact sets compact 4.3 implies;"
**Claim:** The head uses neither triangulation theorem. From R2.1 it takes only the comparison with the realization carrier, and AffineMorseLefschetz is not a supplier: 4.3 implies A4.1's theorem rather than using it.
**Witness:** `README.md` 213–214: R2.1 supplies its comparison of a finite `Geometry.SimplicialComplex ℝ E` with the realization carrier. Line 610: "No item of the layer uses A4.1's or R2.1's triangulation theorems." No "From AffineMorseLefschetz" contract exists.
**Repair:** Replace the bullet with: "- RealAnalyticGeometry R2.1, for its comparison of a finite `Geometry.SimplicialComplex ℝ E` with the realization carrier (the `TauCeti.IsTriangulable` corollary of 4.1). AffineMorseLefschetz A4.1 is not a supplier: compact 4.3 implies its triangulation theorem, and R2.1's bounded theorem implies 4.3 for bounded sets;"

## Previous findings

- R01 — not repaired: the description still reads "ShimuraVarieties §§3.4b–3.4e (…) and §3.5a (the o-minimality of `ℝ_an,exp`);" under "It consumes:". Written again as R01.
- R02 — not repaired: the description still reads "RealAnalyticGeometry R2.1 (for bounded sets, 4.3 follows from it …), and AffineMorseLefschetz A4.1, whose existential triangulation of compact sets compact 4.3 implies;". Written again as R02.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Compact 4.3 implies A4.1 (R02) | `A = {0} ∪ [1,2]` in `ℝ` | `Φ = id`; faces `{0},{1},{2},{1,2}`; `T` is all four; union `{0} ∪ {1} ∪ (1,2) ∪ {2} = A`, closed; `T` face-closed | README true: implied, not used | R02 (description) |
| R2.1 implies bounded 4.3 (R02) | `A = (0,1)` | R2.1 triangulates the closure `[0,1]`, `h = id`; restrict to `A`: `T = {{0,1}}`, union `(0,1)`; `{0},{1} ∉ T`, not a subcomplex | README true: 4.3 follows from R2.1, does not need it | R02 (description) |
| 4.3, unbounded case | `A = ℝ` | `Φ(x) = x/(1+|x|)` onto `(−1,1)`, graph `{y(1+|x|) = x}` semialgebraic; `T = {{−1,1}}`; inverse `y/(1−|y|)` continuous; outside R2.1 and A4.1 | true | none |
| Layers 4 and 7 without §3.5a (R01) | semialgebraic structure; `ℝ_exp`; `ℝ_an,exp` | *Needs:* 552 `§§3.4b–3.4e`, 587 `§3.4b`, 926 `§§3.4c, 3.4d`, 963 `§3.4b`; the structure is a hypothesis, so `ℝ_an,exp` is an instance, not an input | README true; description false | R01 (description) |
| `exists_triangulation_semialgebraic` (Lean 216) | `n = 0`, `A = ∅`; `n = 0`, `A = {pt}`; `A = ℝ` | `K` empty, `T = ∅`, `Φ '' ∅ = ∅` = empty union; `T = {{pt}}`, `intrinsicInterior` of a point is the point; `(−1,1)` = `intrinsicInterior ℝ (convexHull ℝ {−1,1})` | true | none |

The rows for the statements this round leaves untouched stand as in the previous review, of bd1eb6b.

- **The change.** `git diff bd1eb6b HEAD` is empty for the folder and for `lake-manifest.json` (Tau Ceti 2fd255d, Mathlib 1b1ccf4). `git diff --stat origin/main...HEAD` outside the folder is empty: the nine files listed as changed since bd1eb6b come from merging main and are not changes of this pull request.
- **The pull request's text.** Title = README line 1. "Adds the folder … changes nothing outside it" holds (3 files, 1276 insertions, 45 headings, 16 declarations). Scope items 1–7 match Layers 1–7; the `Suggested.lean` list and "4 `sorry` warnings" match the head. Only the two supplier bullets of R01 and R02 disagree with it.
- **Gate.** With the public order every check is 0 except `depcheck=1`, "NOT IN ORDER: StratifiedSpacesAndTameTopology (insert it after its last supplier)", which is not a defect; the worker's gate with the candidate order is all 0, `build=0`, `OK`.
- **Dependency check.** `depcheck: 245 roadmaps, 2232 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. In the candidate order this roadmap is line 232, after ShimuraVarieties (107) and AlgebraicTopologyPartII (231).
- **Elaboration.** `lake env lean` exits 0 with four `sorry` warnings only (171, 180, 206, 216). The file is unchanged, so the `#check @name` comparison of the earlier review stands (16 types, 0 lost binders).
- **Citations resolved this round, 14.** Open heads: ShimuraVarieties §§3.4b, 3.4c, 3.4d, 3.4e, 3.5a (README 818, 848, 878, 900, 939; `OMinimalStructure`, `DefinableMapOn`, `exists_oMinimalStructure_isSemialgebraic` at Suggested 83, 115, 143) and AlgebraicTopologyPartII §§16.1a–16.1e (README 1539, 1571, 1596, 1617, 1647; Suggested 289, 307). Main (2248bbb): RealAnalyticGeometry R2.1 (429), AffineMorseLefschetz A4.1 (946), GeometricTopology Layer 1 (783), DifferentialGeometry 5.5 (mapped to 5.5a/5.5b at 38). Pin: `TauCeti.IsTriangulable` (`TauCeti/Topology/Triangulable/Basic.lean` 38), `IsSemialgebraic` (`Semialgebraic/Basic.lean` 75), `IsSemialgebraicOn` (`Semialgebraic/Function.lean` 49). `overlaps.md` lists nothing; the two `citations.md` leads are this roadmap's own declarations (Suggested 171, 180).
- Remark on untouched text: README 224 says neither pin has the abstract boundary of a manifold with corners; Tau Ceti at the pin has `ModelWithCorners.AbstractBoundary` (`TauCeti/Geometry/Manifold/Corners/AbstractBoundary.lean`).
- Remark on untouched text: README 988 says "No roadmap cites this one"; the open heads of MixedHodgeModulesAndIrregularHodgeTheory (README 112, 267: §§7.2–7.3) and LogicAndDefinabilityInNumberTheory (README 26) now name it. Both are later in the order.

Overlap check: read AlgebraicTopologyPartII, PosetHomotopyAndSubgroupComplexes, LogicAndDefinabilityInNumberTheory, MixedHodgeModulesAndIrregularHodgeTheory and ShimuraVarieties (open), and AffineMorseLefschetz, RealAnalyticGeometry and TangentialBordism (main); the owners are as in the previous review: o-minimal structures ShimuraVarieties §§3.4b–3.4e; Whitney (b) and control data AlgebraicTopologyPartII §16.1; definable Whitney stratifications this roadmap §7.2; CAD triangulation of compact semialgebraic sets AffineMorseLefschetz A4.1; corner depth Tau Ceti's pin.

Source independence: changed passages only. The folder did not change and the description quotes no source passage, so 0 passages were compared; the largest share is lurie-ha, 18 of 73 source mentions, as in the previous review; the arrangement was not compared again because no layer changed.

## Not verifiable

- vdd1998 (van den Dries, *Tame Topology and o-minimal Structures*): no manifest key and no legal copy, so Chapter 8, (2.9) (4.1) is unchecked. Untouched by this round.
- bcr1998 Theorem 9.7.11 (7.3) and lee2013 Theorem 9.25 (5.4): settled as uncertified.

## Source issues

- none

## For the human reviewers

- none
