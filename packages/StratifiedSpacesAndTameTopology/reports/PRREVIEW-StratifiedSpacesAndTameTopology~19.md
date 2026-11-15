# Review of StratifiedSpacesAndTameTopology (pull request #1519 at bd1eb6b)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 1b76d50. The folder is byte-identical to the head the previous review accepted. Both findings are in the pull request's description, which this round checks against the head.

## R01 (P3) — The description lists ShimuraVarieties §3.5a as a supplier

**Location:** Description, "Ownership and suppliers", first bullet: "ShimuraVarieties §§3.4b–3.4e (o-minimal structures, definable maps, cell decomposition, dimension, definable choice, curve selection) and §3.5a (the o-minimality of `ℝ_an,exp`);"
**Claim:** The head uses nothing from §3.5a. The README only leaves the o-minimality of `ℝ_an,exp` to ShimuraVarieties, so the bullet adds a supply edge the head does not have.
**Witness:** `README.md` 179–191 ("From ShimuraVarieties") lists §§3.4b–3.4e only. §3.5a appears only at 53–54, under "Left to other roadmaps". The *Needs:* lines 552, 587, 926 and 963 name only §§3.4b–3.4e.
**Repair:** Replace the bullet with: "- ShimuraVarieties §§3.4b–3.4e (o-minimal structures, definable maps, the semialgebraic structure on `ℝ`, cell decomposition, dimension, definable choice, curve selection); the o-minimality of `ℝ_an,exp` (§3.5a) is left to ShimuraVarieties and is not consumed;"

## R02 (P3) — The description lists the triangulation theorems of R2.1 and A4.1 as consumed

**Location:** Description, "Ownership and suppliers", fourth bullet: "RealAnalyticGeometry R2.1 (for bounded sets, 4.3 follows from it by inverting its homeomorphism), and AffineMorseLefschetz A4.1, whose existential triangulation of compact sets compact 4.3 implies;"
**Claim:** The bullet sits under "It consumes:", but the head uses neither triangulation theorem. It takes from R2.1 only the comparison with the realization carrier. AffineMorseLefschetz is not a supplier at all: 4.3 implies A4.1's theorem rather than using it.
**Witness:** `README.md` 213–214: R2.1 supplies its comparison of a finite `Geometry.SimplicialComplex ℝ E` with the realization carrier (the `TauCeti.IsTriangulable` corollary of 4.1). Line 610: no item uses A4.1's or R2.1's triangulation theorems. There is no AffineMorseLefschetz contract.
**Repair:** Replace the bullet with: "- RealAnalyticGeometry R2.1, for its comparison of a finite `Geometry.SimplicialComplex ℝ E` with the realization carrier (the `TauCeti.IsTriangulable` corollary of 4.1). AffineMorseLefschetz A4.1 is not a supplier: compact 4.3 implies its triangulation theorem, and R2.1's bounded theorem implies 4.3 for bounded sets;"

## Previous findings

- none: the review of 1b76d50 raised no findings. Its remark on scope item 7 of the description ("`C¹` cells") is resolved: the item now reads "`C^p` cells".

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 4.3 implies A4.1, compact case (R02) | `A = [0,1]`, `B = {1/2}` | `Φ = id`; `T` is the vertices `0, 1/2, 1` and two edges; the union `[0,1]` is closed and `T` is closed under faces, so `T` is a subcomplex | README true; A4.1's theorem is implied, not used | R02 |
| R2.1 implies 4.3, bounded case (R02) | `A = (0,1]` | R2.1 triangulates the closure `[0,1]` with `h = id`; `Φ = h⁻¹` on `A`; `T = {{1},{0,1}}`, not a subcomplex | README true; R2.1's theorem implies 4.3, and 4.3 does not need it | R02 |
| 4.3, unbounded case | `A = [0,∞)` | `Φ = x/(1+x)` onto `[0,1)`; `T = {{0},{0,1}}` and `{1} ∉ T`; this `A` is outside both A4.1 and R2.1 | true | none |
| 4.1 corollary through R2.1's comparison (R02 repair) | `A = [0,1]`; `A = (0,1]` | `[0,1]`: `T` is a subcomplex and `|K| = [0,1]` is the realization of one edge, so `IsTriangulable` holds; `(0,1]` is not closed and is excluded | true | none |
| Layers 4 and 7 without §3.5a (R01) | the semialgebraic structure; `ℝ_exp`; `ℝ_an,exp` | *Needs:* 552, 587, 926 and 963 name §§3.4b–3.4e only. Layer 7 assumes an o-minimal expansion as a hypothesis, so `ℝ_an,exp` is an instance, not an input | README true; description false | R01 |
| `exists_triangulation_semialgebraic` (Lean 216) | `n = 0`; `A = ∅`; `A = [0,∞)` | `T = {{pt}}`; `K` empty; `x/(1+x)` onto `[0,1)`, the union of the open simplices of `{0}` and `{0,1}` (`intrinsicInterior ℝ (convexHull ℝ τ)`, 223, 226) | true | none |

The rows for statements this round leaves untouched stand as in the review of 1b76d50.

- **The change and the pull request's text.** The folder is byte-identical to 1b76d50. `git diff --stat origin/main...HEAD` shows nothing outside the folder, and `lake-manifest.json` is unchanged (Tau Ceti 2fd255d, Mathlib 1b1ccf4). The title matches README line 1. "Adds the folder … changes nothing outside it" holds: 3 files, 1276 insertions. Scope items 1–7 match Layers 1–7. Each of the 29 `### k.n` sections has one *Needs:* line and one **Checks.** block. The 17 sources match the 17 References entries. The description's `Suggested.lean` list matches docstring lines 22–28 and 33–41, and no definition body uses `sorry` (58–167, 187–201).
- **Gate and order.** With the public order, the brief's gate passes every check except `depcheck=1`: "NOT IN ORDER: StratifiedSpacesAndTameTopology (insert it after its last supplier)". The brief says this is not a defect. With `--build --order` set to the candidate order, every check is 0, `build=0`, `OK`, which agrees with the worker's gate. The dependency check prints `depcheck: 245 roadmaps, 2234 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. In the candidate order this roadmap is line 232, after ShimuraVarieties (107) and AlgebraicTopologyPartII (231).
- **Elaboration.** `lake env lean` exits 0. Its only output is four `sorry` warnings, at 171, 180, 206 and 216, which matches the description's "4 `sorry` warnings". The file is unchanged, so the `#check @name` comparison of 1b76d50 stands; `signatures.md` lists 16 types with 0 lost binders.
- **Citations resolved this round.** At the open heads: ShimuraVarieties §§3.4b, 3.4c, 3.4d, 3.4e and 3.5a (README 818, 848, 878, 900, 939), and AlgebraicTopologyPartII §§16.1a–16.1e (README 1539–1647; `IsSmoothStratification`, `ControlData` and `IsWhitneyStratification` at Suggested 289, 307, 454). On main: RealAnalyticGeometry R2.1 (429), AffineMorseLefschetz Layer 5 A4.1 (946), GeometricTopology Layer 1 (783), and DifferentialGeometry 5.5, which main maps to 5.5b (38–39, 1924). `overlaps.md` reports nothing. The two `citations.md` leads are this roadmap's own declarations (Suggested 171, 180).
- Remark on untouched text: README 224 says neither pin has "the abstract boundary of a manifold with corners". Tau Ceti at the pin has `ModelWithCorners.AbstractBoundary` (`TauCeti/Geometry/Manifold/Corners/AbstractBoundary.lean` 279) and `ModelWithCorners.depth` (`Depth.lean` 391).
- Remark on untouched text: README 988 says "No roadmap cites this one". The open head of MixedHodgeModulesAndIrregularHodgeTheory now cites §§7.2–7.3 as a supplier (its README 113–115) and comes later in the order (266).
- Remark on untouched text: README 70–72 write `Cᵏ` and `Cᵖ` inside code spans, while Layer 7 writes ASCII `C^p`.

Overlap check: read AlgebraicTopologyPartII, PosetHomotopyAndSubgroupComplexes, LogicAndDefinabilityInNumberTheory, MixedHodgeModulesAndIrregularHodgeTheory and ShimuraVarieties (open), and AffineMorseLefschetz, RealAnalyticGeometry and TangentialBordism (main). Every shared object has one owner:
- o-minimal structures: ShimuraVarieties §§3.4b–3.4e, consumed here and by LogicAndDefinabilityInNumberTheory;
- Whitney (b) and control data: AlgebraicTopologyPartII §16.1;
- definable Whitney stratifications: this roadmap §7.2, consumed by MixedHodgeModulesAndIrregularHodgeTheory;
- triangulation of compact semialgebraic sets with its CAD construction: AffineMorseLefschetz A4.1, which 4.3 implies and does not restate;
- McCord's carrier map: PosetHomotopyAndSubgroupComplexes, which 1.4 does not state;
- corner depth: Tau Ceti's pin (TangentialBordism).

Source independence: changed passages only. The folder did not change, and the description cites no source passage, so no passage was compared. The largest share is lurie-ha, 18 of 73 source mentions. The arrangement was not compared again because no layer changed.

## Not verifiable

- vdd1998 (van den Dries, *Tame Topology and o-minimal Structures*): no manifest key and no legal copy, so Chapter 4, §2 and Chapter 8, (2.9) (4.1) are unchecked. Untouched by this round.
- bcr1998 Theorem 9.7.11 (7.3) and lee2013 Theorem 9.25 (5.4) are settled as uncertified.

## Source issues

- none

## For the human reviewers

- none
