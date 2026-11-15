# Review of StratifiedSpacesAndTameTopology (pull request #1519 at 96086c5)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 8bb72e2. The folder and `lake-manifest.json` are byte-identical to the head the previous review read. The description now carries the repairs of both earlier findings, and this review raises no new finding.

## Previous findings

- R01 — repaired: the description now reads "ShimuraVarieties §§3.4b–3.4e (…, the semialgebraic structure on `ℝ`, …); the o-minimality of `ℝ_an,exp` (§3.5a) is left to ShimuraVarieties and is not consumed;". This matches README 179–191 and 53–54.
- R02 — repaired: the description now reads "RealAnalyticGeometry R2.1, for its comparison of a finite `Geometry.SimplicialComplex ℝ E` with the realization carrier (…). AffineMorseLefschetz A4.1 is not a supplier: compact 4.3 implies its triangulation theorem, …". This matches README 213–214 and 610.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Compact 4.3 implies A4.1 (description, R02 repair) | `A = [0,1]` in `ℝ`, marks `(0,1)` and `{0}` (A4.1's own Check) | `Φ = id`; faces `{0},{1},{0,1}`, all in `T`; union `[0,1]`, closed; marks are the open edge and the vertex `{0}` | true: 4.3 implies A4.1 and does not use it | none |
| R2.1 bounded theorem implies bounded 4.3 (R02 repair) | `A = (0,1]`, no marks | R2.1: `X = [0,1]`, `τ = id`; cells inside `A`: `{1}`, `(0,1)`; `T = {{1},{0,1}}`, which lacks `{0}`, so it is not a subcomplex; `Φ = τ⁻¹` on `A` | true | none |
| §3.4b semialgebraic structure consumed; §3.5a not consumed (R01 repair) | ShimuraVarieties Suggested 143; `s = {x 0 > 0}`, `s = {x 0 ∈ ℤ}` in `ℝ¹` | first set: semialgebraic and definable; second: neither (infinitely many points). *Needs:* 552, 587, 926, 963 name §§3.4b–3.4e only | description agrees with README | none |
| `exists_triangulation_semialgebraic` (Lean 216), cited by the R02 repair | `n = 2`, `A = S¹`, `ℬ = {{(1,0)}}` | triangle `(1,0),(−1,1),(−1,−1)`; gauge `g = max(x+2y, x−2y, −x)`, `g(1,0) = 1`; `Φ = x/g(x)` maps onto `∂Δ`; `T` = 3 vertices + 3 edges; `T' = {{(1,0)}}`; inverse `y/‖y‖` | true | none |

Rows for the statements this round leaves untouched stand as in the previous review, of 8bb72e2.

- **The change.** `git diff 8bb72e2 HEAD` is empty for the folder, `lake-manifest.json` and `lean-toolchain`. `git diff --stat origin/main...HEAD` outside the folder is empty. The four outside files listed in the change set come from merging main and are not changes of this pull request.
- **The pull request's text.** Title = README line 1. "Adds the folder … changes nothing outside it" holds: 3 files, 1276 insertions, 45 headings, 16 declarations. Scope items 1–7 match Layers 1–7. The supplier bullets match README 179–220. The `Suggested.lean` list, the unstatable 4.1 with `OMinimalStructure` (Suggested 33–34) and "4 `sorry` warnings" all match the head.
- **Gate.** With the public order, every check is 0 except `depcheck=1`: "NOT IN ORDER: StratifiedSpacesAndTameTopology (insert it after its last supplier)", which is not a defect. The worker's gate with the candidate order is all 0, with `build=0` and `OK`.
- **Dependency check.** `depcheck: 245 roadmaps, 2232 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. In the candidate order this roadmap is line 232, after ShimuraVarieties (107) and AlgebraicTopologyPartII (231).
- **Elaboration.** `lake env lean` exits 0 with four `sorry` warnings only (171, 180, 206, 216). The file is unchanged, so the earlier `#check @name` comparison stands (16 types, 0 lost binders; `signatures.md` agrees).
- **Citations resolved this round, 21.**
  - ShimuraVarieties, open head: §§3.4b–3.4e and 3.5a (its README 818, 848, 878, 900, 939); `OMinimalStructure`, `OMinimalStructure.DefinableMapOn`, `exists_oMinimalStructure_isSemialgebraic` (its Suggested 83, 115, 143).
  - AlgebraicTopologyPartII, open head at ccdd821: §§16.1a–16.1e (its README 1539–1647); `IsSmoothStratification`, `ControlData`, `IsWhitneyStratification` (its Suggested 289, 307, 454).
  - Main at 1a19c9f, where only MinimalSurfaces changed since 2248bbb: RealAnalyticGeometry R2.1 (429), AffineMorseLefschetz A4.1 (946), GeometricTopology Layer 1 (783), DifferentialGeometry 5.5 (mapped to 5.5a/5.5b at 38), AlgebraicTopology Stage 7 (883), `Completed/RealAlgebraicGeometry`.
  - Pin: `TauCeti.IsTriangulable` (`Triangulable/Basic.lean` 38), `IsSemialgebraic` (`Semialgebraic/Basic.lean` 75), `IsSemialgebraicOn` (`Function.lean` 49), `IsCollar` (`Collar/Global.lean` 46), `IsLocallyCollared.isCollared` (`Brown.lean` 459), `orderComplex` (`OrderComplex.lean` 57).
- Remark on untouched text: README 224 and Suggested 37–38 say neither pin has the abstract boundary of a manifold with corners. Tau Ceti at the pin has `ModelWithCorners.AbstractBoundary` (`TauCeti/Geometry/Manifold/Corners/AbstractBoundary.lean` 279).
- Remark on untouched text: README 988 says "No roadmap cites this one". The open heads of MixedHodgeModulesAndIrregularHodgeTheory (README 112, 267) and LogicAndDefinabilityInNumberTheory (README 26) name it. Both come later in the order.

Overlap check: read AlgebraicTopologyPartII, PosetHomotopyAndSubgroupComplexes, LogicAndDefinabilityInNumberTheory, MixedHodgeModulesAndIrregularHodgeTheory and ShimuraVarieties (open), and AffineMorseLefschetz, RealAnalyticGeometry and TangentialBordism (main). `overlaps.md` lists no shared roadmap and no dropped id. Owners:
- o-minimal structures: ShimuraVarieties §§3.4b–3.4e;
- Whitney (b) and control data: AlgebraicTopologyPartII §16.1;
- order complexes: Tau Ceti's pin, consumed by PosetHomotopyAndSubgroupComplexes and here;
- definable Whitney stratifications: this roadmap, §7.2;
- CAD triangulation of compact semialgebraic sets: AffineMorseLefschetz A4.1;
- corner depth: Tau Ceti's pin.

Source independence: changed passages only. The folder did not change and the description's changed bullets quote no source passage, so 0 passages were compared. The largest share is lurie-ha, 18 of 73 source mentions, as in the previous review. The arrangement was not compared again because no layer changed.

## Not verifiable

- vdd1998 (van den Dries, *Tame Topology and o-minimal Structures*): there is no manifest key and no legal copy, so Chapter 8, (2.9) (cited for 4.1, of which 4.3 is the specialization) is unchecked. This round does not touch it.
- bcr1998 Theorem 9.7.11 (7.3) and lee2013 Theorem 9.25 (5.4): settled as uncertified.

## Source issues

- none

## For the human reviewers

- none
