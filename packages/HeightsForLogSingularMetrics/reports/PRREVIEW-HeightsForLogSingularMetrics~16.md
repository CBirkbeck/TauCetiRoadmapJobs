# Review of HeightsForLogSingularMetrics (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HeightsForLogSingularMetrics/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 4 lines changed since `e47c8ec`, both in 4.3a: the sentences of (b) and (d) that say in which form [FormalProof] has Moriwaki's inequality, the equality for nef bundles and the two minima statements, and which forms its main theorems apply. I read each named file and declaration in the formal proof's source at the commit the family cites and checked each "applied" and "not applied" claim against the dependency closure of its main theorems; all hold. No statement of the roadmap changes and no finding remains. There is no small correction and one format note; one point about scope is left to the human reviewers, as before.

## N01 — Two declarations of [FormalProof] are named in 4.3a (d) without their files.

The scheme forms `GlobalTheory.T.self_intersection_lower_height` and `GlobalTheory.T.self_intersection_upper_dense_small` (line 113) are the only [FormalProof] names of the section given without a path. They are in `Development/AbelianVarietyTheory/Proofs/DivisorProofs/SelfIntersectionLowerHeightStatement.lean` and `…/SelfIntersectionUpperDenseSmallStatement.lean`; adding the paths would match the other locators.

## Previous findings

- none: the previous report, of `e47c8ec`, had no finding. Its small correction C01 (the description said PELModuli, DiamondsAndVStacks and ShimuraVarieties are changed) no longer applies: at this head each of the three differs from `main` in exactly the `*Needs:*` line the description names (M2.5 adds SchemeAndStackFoundations §4.3; D2.7 adds PerfectoidSpaces §P2.5; §7.3 adds §7.5).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 4.3a (b), statement unchanged; its [FormalProof] sentence rewritten | `Spec ℤ`, `O(c)`, `d = 1` | `vol^ = max(c, 0)`, `L̄^d = c`: `max(c,0) ≥ c`; `MoriwakiBigStatement` concludes `II(…) ≤ arVolP(…)`, the same direction | holds; locator says the same |
| 4.3a (b): "the form that its main theorems apply, in the coordinates of a multiprojective embedding" | `MoriwakiBigStatement`, `moriwakiBig_outright` | variety is `mCoordIdeal y` in `MRing ι` with `Birational y`; both names in the closure; 30 or more closure declarations refer to the statement | true |
| 4.3a (b): `VolGe` "for schemes … no step of its main theorems applies" | closure users of `VolGe` and of its proof | hypotheses `X : Scheme`, `HermLB p`, `NefFib`, `SemiPos`; users: its proof and two bundles of published theorems; every theorem that applies it (`arithmetic_volume_le_count`, `self_intersection_upper_dense_small`, `squeeze_of_tieAr`) is outside the closure | true |
| 4.3a (b): `VolNef`, equality for nef bundles, "no step applies it" | `O(c)`, `c ≥ 0` and `c < 0`; closure users | `c ≥ 0`: `max(c,0) = c`; `c < 0` is not nef (point of height `c < 0`); the only theorems applying it (`flagHt_obj`, `self_intersection_lower_height`, `squeeze_of_tieAr`) are outside the closure | true |
| 4.3a (d), statement unchanged; coordinates sentence added | `Spec ℤ`, `d = 1`, `deg = 1`, `M̄ = O(c)` | lower: `c ≥ e` gives `M̄¹ = c ≥ 1·e·1`; upper: `c ≤ e` gives `c ≤ 1·e·1`; formal factor `(D+1)·e·geomDeg P A D` with `D + 1 = d` | holds; same shape |
| 4.3a (d): "multihomogeneous prime ideal … line `O(a)` … metric a function on the affine cones … semipositivity relative to an ideal contained in that prime" | `SuccessiveMinimaLowerBound`, `SuccessiveMinimaUpperBound` | binders `P P0 : Ideal (MRing ι)`, `IsArithVar P (D+1)`, `P0 ≤ P`, `IsSemipositiveRel P0 P A`, `A : HermLine ι` with `A.a`, `A.h z`; neither asks ampleness or bigness | true |
| 4.3a (d): the scheme forms "are not used by its main theorems" | `GlobalTheory.T.self_intersection_lower_height`, `…upper_dense_small` | both exist in the source (hypotheses `VolNef`, resp. `VolGe`, and `ArCalc`); neither is in the closure | true |

The rows of the previous review, of `e47c8ec`, stand for the untouched statements.

- [FormalProof] locators checked against the source at the cited commit: 5 files and 8 declarations (`MoriwakiBigStatement`, `moriwakiBig_outright`, `VolGe`, `VolNef`, the two `SuccessiveMinima…Bound` statements, the two `GlobalTheory.T.self_intersection_…` theorems); all exist at the paths given.
- Closure of the main theorems: membership of 14 names read from its index, and the direct users of 10 names listed in one pass over the kernel export (127 rows).
- Cross-roadmap citations in the changed sentences, resolved at this head: ArakelovGeometryAndAbelianHeightsPartII §§0.1, 0.3, 4.3, 4.8 and HeightsRationalPointsAndObstructions §5.17f; all 5 exist. ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties cites 4.3a and 4.3a (d) at four places; the statements it cites are unchanged.
- Record: no heading, layer id or item changes; `Suggested.lean` is unchanged and declares nothing, so there is no signature to compare and nothing to probe for padding.
- Seeded sample: of its six targets only 4.3a falls in the change; its changed locators are the rows above. The published locators of 4.3a (Moriwaki, Zhang) are untouched and stand as verified in the previous review.
- Automatic checks: the worker's checks all passed. My own run reports only the pull request's files in its other folders: all 132 changed files lie in the folders the pull request owns.
- Dependency check: `depcheck: 20 roadmaps, 39 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no message.

Overlap check: read ChowFormsAndHeightsOfSubvarieties, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties and HeightsRationalPointsAndObstructionsPartII (open); the change adds no object. Owners as before: Moriwaki's inequality, ArakelovGeometryAndAbelianHeightsPartII §0.3a (cited); Zhang's successive minima for ample bundles, HeightsRationalPointsAndObstructions §5.17f (cited); the absolute Siegel lemma, HeightsRationalPointsAndObstructions §5.17f.1 (cited).

Source independence: changed passages only; 2 passages compared with 1 source ([FormalProof], Lean declarations: the two sentences describe signatures in prose and share no wording); largest share [FormalProof], about 26 of 44 locators in the layers; contents not compared, the diff adding, removing or reordering no layer.

Research link: Layers 0 and 4 extend the arithmetic intersection and volume theory of Gillet–Soulé (1990), Zhang (1995), Moriwaki (2009) and Yuan–Zhang (2021) to log-log singular metrics; 16.1 sharpens the linear slope bounds of Bost (1996) and Gaudron (2019); the roadmap serves the formal proof announced by Alpöge (2026). Rests on the README's overview and References.

## Not verifiable

- "[FormalProof] also states and proves it for schemes": the proof of `VolGe` (`GlobalTheory.VolBr.volGe_of_hilbertSamuel`) takes three published statements as hypotheses, which a later theorem supplies; I read that theorem's statement and did not trace the proofs of the three inputs.
- Gaudron–Rémond (2017), Gaudron (2019), the displayed inequalities of Bost's Proposition 5.3, and the works cited without a locator (Maillot, Tamvakis, Burgos Gil–Kramer–Kühn, Kühn, Gillet–Soulé, Bost–Gillet–Soulé) remain unread, as in the previous review; the change does not touch them.

## Source issues

- none

## For the human reviewers

- The decision on general roadmaps was applied: no section leaves this folder; 4.3a and 4.3b keep their statements and name ArakelovGeometryAndAbelianHeightsPartII §0.3a and HeightsRationalPointsAndObstructions §5.17f.1, which state the published theorems. The other decision does not concern this folder.
- Scope fact: the *Origin* labels of 14.1 and 16.1 say "particular to this proof"; their only source is [FormalProof] and [Announcement] (Alpöge, 2026), with Mourougane (2003), Bost (1996) and Gaudron (2019) cited as nearest published results.
- Not tested: [FormalProof] has the largest share of the locators; in this round only the two changed sentences were compared with it, and its arrangement was not compared with the layers.
