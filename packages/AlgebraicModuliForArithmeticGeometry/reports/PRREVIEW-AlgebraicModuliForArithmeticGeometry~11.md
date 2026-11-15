# Review of AlgebraicModuliForArithmeticGeometry (pull request #853 at e5f9c4c)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `e5f9c4c`. The folder is unchanged; this round read the pull request's title and description, as they stand now, against this head. No finding. README locations are relative to `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/`.

## Previous findings

- R01 — repaired: "This roadmap consumes no section of ComplexComparisonPartII. It names §§C−1.1–C−1.4, C1.9 and C3.2a–C3.2g only to mark the edge of its scope". No *Needs:* line of the README names that roadmap.
- R02 — repaired: "Its logarithmic comparisons (C5.5) and §9.10 here both consume the logarithmic core of CrystallineCohomology §§CR.5:log-algebra.4/CR.5.1; neither roadmap supplies it to the other."
- R03 — repaired: "effective fpqc descent of quasi-coherent modules on algebraic spaces, extending the scheme case of SchemeAndStackFoundations §1.1" and "built on the characteristic-zero resolution and SNC compactification that ResolutionOfSingularitiesCharacteristicZero supplies".
- R04 — repaired: the list of roadmaps on main now has twelve names, each cited by the README and each on main; PadicMeasuresIwasawaAlgebras and RigidAnalyticGeometry are gone, ResolutionOfSingularitiesCharacteristicZero is added.
- R05 — repaired: "Consumers of this roadmap (ModularCurvesPartII, AbelianSchemesAndArithmeticModuli, PELModuli, ShimuraVarieties, ComplexComparisonPartII and FiniteEquivalenceRelations) are listed in the README's Downstream consumers section."

## Verified sound

| Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- |
| `hilbertSerre` (headline, §1.5; the summary block's "Hilbert–Serre covers Artinian lengths") | `A=k[ε]/(ε²)`, one variable, `M=A[x]`; `A=k`, same `M` | Non-reduced: length of `ℳ_n` is 2 for `n≥0`, 0 for `n<0`; series `2/(1−T)`, `e=1`, eventual polynomial 2, degree 0 < 1. Field: lengths 1, series `1/(1−T)` | Lengths, not ranks, as the description says; signature has `[IsArtinianRing A]`; no change |
| `logDeRhamComplex` (§9.10; R02's sentence) | `𝔸¹_ℚ`, `D=V(x)`; ComplexComparisonPartII C5.5 at its head | `d(xᵐ)=m·xᵐ·dlog x`, `Ω¹(log D)` free on `dlog x`. `README.md:10258` *Needs:* CR.5:log-algebra.4 and CR.5.1. C5.5 (head lines 4115–4641): 0 citations of this roadmap, CR.5 cited at 4118, 4333, 4347 | Description now agrees; no change |
| §3.1 fpqc descent (R03's first phrase) | `Spec ℂ→Spec ℝ`, datum `(ℂⁿ, conjugation)` | Descends to `ℝⁿ`, rank `n` on both sides. Scheme case: SchemeAndStackFoundations §1.1 (main line 2793); `README.md:1159` "states no second version" | Description now agrees; no change |
| Roadmaps on main the README cites (R04's list) | every folder of main, counted in `README.md` | SchemeAndStackFoundations 417, ModularCurves 59, StableReduction 31, ResolutionOfSingularitiesCharacteristicZero 27, JacobianChallenge 19, AlgebraicVectorBundles 10, ReductiveGroupsPartII 10, AdicSpacesPartII 9, AdicSpacesPartIII 8, DerivedModuleAlgebra 8, EnhancedDerivedSheaves 7, GroebnerGeometry 5; no other | The twelve listed are exactly the twelve cited; no change |
| ComplexComparisonPartII consumption sentence (§§7.1, 7.3, 7.6.1, 7.7) | its head, *Needs:* lines | §7.1 `artin_stack_criterion` (line 2462); §7.3 `universalFlatteningProperSupport` (2439); §7.6.1 `relativePicardSheaf` (2509); §7.7 `spaceDQCoh`, `spacePerfect` (2337, 2364) | Each named section is consumed there and exists here (`README.md:8832`, `9121`, `9433`, `9540`); no change |

The rows of the earlier reviews of `e5f9c4c` for untouched statements stand as recorded there.

- Gate run by this review at `e5f9c4c`: every counter 0, `OK`; the worker's run with the targeted build has `build=0`. Nothing changed outside the folder. Dependency check (`--movable`): `depcheck: 245 roadmaps, 2213 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration (`lake env lean` on `Suggested.lean`): five `sorry` warnings (lines 48, 73, 87, 119, 131), nothing else. The file is unchanged, so earlier signature checks and one-tactic probes stand.
- Description: the title, the three paragraphs of the summary block and the four prose paragraphs were read sentence by sentence against this head; none is contradicted. "Nine layers" matches `## Layer 1` to `## Layer 9`; the layer contents, the folder's three files, the single `TauCeti.*` import and the seven Lean declarations are as stated; the text says the folder is added, and nothing is removed or renumbered.
- Cross-roadmap citations resolved for the description: 5 sections of ComplexComparisonPartII's head, SchemeAndStackFoundations §1.1 (main line 2793) and §4.14 (main line 7025), CrystallineCohomology CR.5 through both consumers. Merge order: CrystallineCohomology 25 < this roadmap 36 < ComplexComparisonPartII 41; the six consumers the description names are those of `README.md:10364–10385`.
- Overlap check: read FunctionFieldArithmeticPartII, StableReductionPartII and ComplexComparisonPartII (open), SchemeAndStackFoundations and ResolutionOfSingularitiesCharacteristicZero (main), as the previous review did; the overlap listing is unchanged (no shared pull request, no dropped id). Owners: scheme fpqc descent, SchemeAndStackFoundations §1.1; resolution and SNC compactification, ResolutionOfSingularitiesCharacteristicZero; complex analytification and complex GAGA, ComplexComparisonPartII; the logarithmic core, CrystallineCohomology; the rest, this roadmap.
- Source independence: changed passages only, and there are none (0 changed lines), so nothing was compared; no layer was added, removed or reordered, so the arrangement was not compared again. The Stacks project has the largest share of source mentions, as recorded in the previous review.
- The seeded sample falls in untouched text; no locator was opened this round.

## Not verifiable

- Nothing in this round's checks. The items the review at `b58cf53` listed concern untouched text and stand as recorded there.

## Source issues

- none

## For the human reviewers

- none
