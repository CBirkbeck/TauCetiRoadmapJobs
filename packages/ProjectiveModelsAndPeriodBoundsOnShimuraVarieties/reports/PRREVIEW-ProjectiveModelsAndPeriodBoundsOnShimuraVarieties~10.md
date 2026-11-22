# Review of ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (pull request #2910 at 01e6690)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ProjectiveModelsAndPeriodBoundsOnShimuraVarieties/`
**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 2 lines changed since `c2b2d8a` finds no finding. The one changed passage, the [FormalProof] entry of the References, now names the first commit of the repository, and that commit is its root commit and holds the cited files under `src/`; the title and description agree with this head. There is one format note, carried from the previous review, and no small correction. The points left for a human are those of the previous review.

## N01 — The References entry for Faltings–Chai (1990) still names no chapter or page for "the computation behind ArakelovGeometryAndAbelianHeights §5.3" (line 620); a chapter or section number would let a reader find it.

## Previous findings

- none: the previous report, of `c2b2d8a`, had no finding (no R01). Its small corrections: C01 (the description's suppliers) repaired: "…and NeronModelsAndSemistableAbelianVarieties (semistable reduction, §§3.1, 3.3, 3.10, which the formal proof uses to prove 7.31a (b′)) on main"; C02 (the commit) repaired: "the directory `src/` of the first commit of that repository, the source as published". Its N01 is not repaired and stands above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| References, [FormalProof] (line 622): `40e56bab…` is "the first commit of that repository, the source as published" | the commit's record on the repository's host | parents: empty list (a root commit); dated 2026-11-20; its message says it mirrors the published archive unchanged. Family index (lines 13–20) names the same hash | agree | none |
| The same entry: paths are "relative to the directory `src/`" of that commit | 7.31a (b′): `Development/AutomorphicSpectrum/Proofs/GeometryProofs/PartIHolds.lean`; 6.2a: `Development/AutomorphicSpectrum/Definitions/GlobalGeometry/IsHodgeGram.lean` | at `40e56bab` under `src/`: both exist, 1161 and 2608 bytes; the operator's copy (commit `e50d098`): 1161 and 2608 bytes, so the same files | agree | none |
| The entry's list of targets "6.2a, 6.7a, 6.9a, 7.12a, 7.17a, 7.31a and 9.1" | the targets whose text names [FormalProof] | lines 58–84 (6.2a), 171 (6.7a), 185 (6.9a), 217 (7.12a), 243–252 (7.17a), 397–481 (7.31a), 553 (9.1): seven targets, seven listed | agree | none |

The rows of the previous reviews for the statements this change does not touch (6.2a, 6.7a, 6.9a, 7.12a, 7.17a, 7.31a, 9.1 and their Checks) stand as in the previous review, of `c2b2d8a`. The change touches no statement; the seeded sample falls in the changed passage only through the list of targets in the third row.

- Source locators checked against the text: 1 (the commit of [FormalProof], on the repository's host), with 2 of its file paths read at that commit and compared with the copy the operator holds.
- Library declarations opened at the pins: none; the change makes no claim about Mathlib or Tau Ceti and `Suggested.lean` is unchanged (64 lines, no declaration).
- Cross-roadmap citations resolved: none changed; no citation is reported as found nowhere. The 20 Lean names reported as found nowhere are declarations of [FormalProof], named as such in the text.
- Dependency check output: `depcheck: 133 roadmaps, 1478 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed in the worker's run. Run by hand without the family's settings they report two things, both as the description says: the three files of the family index outside the folder, which are this pull request's own, and that the roadmap is not yet in the merge order.
- Elaboration: `lake env lean` on `Suggested.lean` gives no output and exit code 0. The file declares nothing, so there was nothing to `#check` and no one-tactic probe to run.
- The pull request's title and description were read against this head: it adds the roadmap (688 lines, no declaration); the eight suppliers on main and the one of the family match the supplier contracts; the sentence on `src/` of the first commit matches line 622; nothing to correct. Outside the folder the pull request changes only the three files of the family index, unchanged since `c2b2d8a`.
- Overlap check: read ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, HeightsForLogSingularMetrics, HodgeTateLatticesAndLubinTateLogarithms, DiscreteSeriesCoefficientsAndAutomorphicMetrics (open), ShimuraCompactifications, ArakelovGeometryAndAbelianHeights, PELModuli, NeronModelsAndSemistableAbelianVarieties (main) as in the previous review; nothing shared. The change adds, removes and reorders no layer and no target.

Source independence: changed passages only: 1 passage compared with 1 source ([FormalProof], a bibliographic entry with a commit hash, no prose of the source), none shared; largest share [FormalProof], 45 of 55 locators; the arrangement was not compared again, the change adding, removing and reordering no layer.

Research link: The headline targets are inputs of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (2026; README and [FormalProof], read). 6.2a rests on the growth computation of Faltings–Chai (1990); 7.17a and 7.31a extend Lan's integral compactifications (2016, 2017); these two rest on the README alone.

## Not verifiable

- The other [FormalProof] paths at the first commit `40e56bab`: two were read there; the rest were read in earlier reviews in the operator's copy, at the later commit `e50d098`.
- [Lan16], Propositions 6.1 and 6.4, pp. 32–35 (7.31a (a)): the DOI resolves only to the publisher's page, which is in no class I may read from.
- Lan (2017), Theorem 6.1 (the Route of 7.31a (b)): no copy in a place I may read from.
- Faltings–Chai (1990): listed in the References without a locator; nothing to check.

## Source issues

- **Misprint** in DN at Théorème 2.3, printed page 11: the source says the equivariant bundle is called `F` and then that `E` descends; it should be that `F` descends; affects nothing.

## For the human reviewers

- Scope: 6.9a, 7.12a and 7.31a (b′) rest on [FormalProof] alone, a Lean repository announced on 20 November 2026 and not refereed; no published text states these forms (README References).
- Licence: the family index says the formal proof "was published without a license" and is mirrored for verification only; the README restates its declarations as mathematics and `Suggested.lean` declares nothing.
- Not tested: [Lan16] and Lan (2017) could not be read, so 7.31a (a) and the bad-prime step of 7.31a (b) were not checked against them.
- Merge coordination: ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, at its open head (README line 82), still takes the cubical line bundle from "§7.31a (b)"; this head gives it in (b′) (ii) only.
- Family index: the family `README.md` has a section "When a roadmap is wrong" (line 46), a rule for contributions and reviews across the family; whether it belongs there is a project decision.
