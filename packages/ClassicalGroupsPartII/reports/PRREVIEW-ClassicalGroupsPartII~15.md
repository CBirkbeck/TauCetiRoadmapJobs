# Review of ClassicalGroupsPartII (pull request #1492 at a8badcd)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: the description now reads “Open suppliers: ArithmeticGaloisRepresentations (#856) §7.3; PELModuli (#966) §§M0.5–M0.8. ClassicalGroups §§3A.1–3A.3 are on main.”, and the `roadmap-summary` block no longer carries “- [ ] depends on: #1192”.

## Verified sound

The folder is unchanged since a8badcd, so no statement changed. The rows below were recomputed this round with an exact integer script, for the statements the description's text cites.

| Statement (location) | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| `fullInvariantPresentation` (`Suggested.lean:109`; CG.2.4); the description's “full representation ring … Weyl invariants” | g=1,2,3; every flip and every pair permutation applied to each F_k | all six F_k fixed; augmentations 2; 4, 5; 6, 14, 14, equal to binom(2g,k)−binom(2g,k−2) | True; none |
| `positiveInvariantPresentation` (`Suggested.lean:136`; CG.3.2); the description's “polynomial ring over Z in [ν] and the [P_k]” | g=1,2,3 | minimum cone value over the monomials of each F_k is 0; t has cone value 1; t⁻¹ has −1, so it is excluded | True; none |
| `mem_positiveSubring` (`Suggested.lean:130`; CG.3.1); the description's “support criterion” | g=1: t/z², t, t⁻¹ | cone values −1, 1, −1; t=z·(t/z) lies in the generated ring, t/z² and t⁻¹ do not | True; none |
| CG.2.4 change of generators (README 1219, 1352); the description's “unitriangular change of generators” | g=3, k=2,3 | F₂ has 13 monomials with coefficient sum 14 (the constant-weight term t has coefficient 2); F_k = e_k(x) + lower terms, diagonal coefficient 1 | True; none |

The rows for the other statements stand as in the previous review, of a8badcd.

- **Pull-request text.** Title, summary block and prose read against the head: g≥1 and characteristic zero (README 3–5), the two ring isomorphisms (README 8), orbit-sum recurrence (1200, 1350), `MvPolynomial.esymmAlgEquiv` (173, 1371), triangular change of generators (1219, 1352), no averaging over W (145, 1211), no embedding into ℂ (115, 355), fppf quotient and rational points (61, 428), every integer multiplier exponent (595), Downstream consumers (1666–1670). Three files, 21 declarations, empty outside-folder diff: all as described. No sentence is contradicted and no change is left unstated.
- **Suppliers named in the description.** #856 ArithmeticGaloisRepresentations (head 00e8930) and #966 PELModuli (head ba37185) are open; §7.3 and §§M0.5–M0.8 resolve at those heads, with `SimilitudeGroup.GSp`, `SimilitudeGroup.multiplier`, `IntegralPELDatum.siegel`, `IntegralPELDatum.toRational`, `RationalPELDatum.coordinatePoints` and `similitudeGroupStructure`. ClassicalGroups (848b62d0) and ReductiveGroups are on main. The 5 unresolved-name leads are these suppliers' names, found at their heads.
- **Library.** `MvPolynomial.esymmAlgEquiv` opened at the pin: `Mathlib/RingTheory/MvPolynomial/Symmetric/FundamentalTheorem.lean:341`.
- **Gate.** `gate … ClassicalGroupsPartII --base origin/main`: every counter 0, result `OK`.
- **Dependency check.** `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Merge order: ArithmeticGaloisRepresentations 58, PELModuli 117, ClassicalGroupsPartII 205.
- **Elaboration.** `lake env lean TauCetiRoadmap/ClassicalGroupsPartII/Suggested.lean` exits 0; the only warnings are `declaration uses sorry` at lines 109, 130 and 136.
- **Overlaps.** No other open pull request changes this roadmap; no cited id is dropped by an open pull request or defined only by an open revision.
- **Sample.** The seeded sample (“Consequences to check”, “Construction and proof”) falls on no changed passage; the declared gaps on ReductiveGroups Layers 1 and 3 stand as stated at README 258, 278 and 304.

Overlap check: read ReductiveGroups, ClassicalGroups and FlagVarieties (main) and ReductiveGroupsPartIII, ShimuraData and LieHighestWeightPartII (open). The split highest-weight theory is owned by ReductiveGroups §10A–10B and the complex Sp₂g exterior blocks by ClassicalGroups §3A; both are cited here. Nothing else is shared.

Source independence: changed passages only. The diff since a8badcd changes no passage, so 0 passages were compared, and the arrangement was not compared again because no layer moved. The largest share is `yu`, 25 of 40 linked source locators.

## Not verifiable

- The description was read from the worker's quoted copy; the open state of #856 and #966 was read from the roadmap index, not from the pull-request pages.
- The description's count of review rounds (“0 independent review rounds and 2 red-team rounds”) is a statement about the job board, not about the head, and was not checked.
- The source texts were not re-read, because no source locator changed.

## Source issues

- none

## For the human reviewers

- none
