# Review of GenericDoublePointInterpolation (pull request #1472 at 211ae44)
**Verdict:** accepted

## Previous findings

- R01 — repaired: The description names only ArithmeticStatisticsPartV (§3.28) as the additional consumer, agreeing with `TauCetiRoadmap/GenericDoublePointInterpolation/README.md:51` and `:1683`; EffectiveBoundsPartII is absent from both lists.
- R02 — repaired: The description now includes quadric, plane, cubic, quartic and univariate bases and the every-degree theorem with exceptions, agreeing with `TauCetiRoadmap/GenericDoublePointInterpolation/README.md:1495` and `Suggested.lean:252`. The affine endpoint retains d≥5.

## Verified sound

| Statement cited by the repaired description | Instances tried | Computed rank | Formula / comparison | Result |
| --- | --- | --- | --- | --- |
| `alexanderHirschowitzRank`, degrees zero and one | Over ℚ, r=3: d=0 at 0,e₁,e₂; d=1 at 0,e₁ | 1; 4 | min(1,12)=1; min(4,8)=4 | Both included |
| `alexanderHirschowitzRank`, quadric exclusion | Over ℚ, r=3,d=2 at 0,e₁ | 7 | min(10,8)=8; quadric formula 10−3=7 | 2≤q≤r correctly excluded |
| `quarticDoublePointRank` | Over ℚ, r=5,d=4 at 0,e₁ | 12 | min(126,12)=12 | Agrees |
| `univariateHermiteRank` | Over 𝔽₂, d=3 at 0,1 | 4 | min(4,4)=4 | No characteristic-zero hypothesis needed |
| `genericDoublePointRank` | Over ℚ, r=1,d=5 at 0,2 | 4 | min(6,4)=4 | Agrees |

Rows for untouched statements stand as in the previous review, of `6326e74`.

- Change: 0 folder lines since `6326e74`; 3 added files against the PR base, 2089 insertions, no deletions or outside-folder paths. The title, summary block and description agree with this addition.
- Source checks: 0 seeded targets intersect changed folder passages; BO lines 22–40 (Theorem 1.1, p.1) reread for the repaired description's rank formula and exception list.
- Signatures: the supplied elaborated types of the 4 headlines in the table retain their field, characteristic, dimension and exception hypotheses; no Lean declaration changed.
- Supplier citations: 10 section references across AlgebraicVectorBundles, DiophantineApproximationAndTranscendence, SchemeAndStackFoundations and AlgebraicModuliForArithmeticGeometry resolved; ArithmeticStatisticsPartV §3.28 confirms the consumer interface.
- Gate: worker's gate passes all checks, including build; rerun gate also reports `OK`. Dependency output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Elaboration: `lake env lean` succeeds with 17 `sorry` warnings only; targeted `lake build TauCetiRoadmap.GenericDoublePointInterpolation.Suggested` succeeds, with `sorry` warnings and the Mathlib module-system notice.
- Overlap check: read EffectiveBoundsPartII (#1516), ArithmeticInterpolationDeterminants (main); coefficient adapters, first jets, generic rank, universal minors and first-jet Hermite rank remain owned by GenericDoublePointInterpolation, as their ownership paragraphs specify. The third closest-roadmap list is empty.
- Source independence: changed passages only; 0 changed folder passages, hence 0 new wording/reuse comparisons. No layer was added, removed or reordered; the previous arrangement check stands.

## Not verifiable

- The description's AI-assistance round counts concern board history, not the head; not independently checked.
- As in the previous review: BO lines 879–890 do not establish the compatible mixed-stratum specialization of README §4.3, which the roadmap states as its own target.

## Source issues

- none

## For the human reviewers

- none
