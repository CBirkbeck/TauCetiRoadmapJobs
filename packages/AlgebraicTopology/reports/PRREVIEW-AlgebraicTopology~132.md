# Review of AlgebraicTopology (pull request #1807 at d524e59)

**Verdict:** needs changes

## R01 (P3) — ClassifyingSpaces is a supplier with no entry under the supplier contracts

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` 4245 (§8.8 *Needs*): "ClassifyingSpaces Layer 1, items 1.1 and 1.2, for the pointed classification"; likewise 5148 (§8.14 *Needs*). `## Exact supplier contracts` (316–972) has no ClassifyingSpaces subsection.

**Claim.** The change makes ClassifyingSpaces a supplier, but the contracts section still lists only UniversalCovers, GeometricTopology and DifferentialGeometry, so the hypotheses assumed of items 1.1 and 1.2 are stated nowhere in the contracts.

**Witness.** README 943, 950, 961 are the only `### From TauCetiRoadmap.*` headings. ClassifyingSpaces README 42–49 states the hypotheses: path-connected Hausdorff CW source, arbitrary base point, aspherical target, independent universes.

**Repair.** After the DifferentialGeometry subsection, before "Each use below retains", add:

"### From TauCetiRoadmap.ClassifyingSpaces

Layer 1, items 1.1 and 1.2: for a path-connected Hausdorff CW complex X with an arbitrary base point x and an aspherical pointed space (Y,y), in independent universes, every homomorphism π₁(X,x)→π₁(Y,y) is induced by a pointed map, and two pointed maps inducing the same homomorphism are homotopic relative to {x}. Consumed by 8.8 with Y the nerve model Bπ and by the case n=1 of 8.14. Nothing else of that roadmap is consumed, and it consumes nothing of this one."

## R02 (P3) — The description does not say that AlgebraicTopology now consumes ClassifyingSpaces

**Location.** Description, second paragraph and "Ownership moves": "it removes the dependencies of AlgebraicTopology on CharacteristicClasses, ComplexKahlerGeometry, DGFloer, GeneralizedCohomology and TopologicalKTheory"; "ClassifyingSpaces … drops AlgebraicTopology and GeometricTopology".

**Claim.** The description lists the suppliers AlgebraicTopology drops and never names the one it gains, nor the move of the pointed classification `[X,Bπ]_*≃Hom(π₁X,π)` out of §8.8.

**Witness.** Main, README 138–139: "nothing of it is consumed here". Head, README 149–150: "Layer 8.8 and §8.14 consume its items 1.1 and 1.2 for the pointed classification of maps into an aspherical space".

**Repair.** Add to the "Ownership moves" bullet: "The classification of pointed maps from a path-connected Hausdorff CW complex into an aspherical space (Hatcher, Proposition 1B.9) has one owner, ClassifyingSpaces Layer 1, items 1.1 and 1.2; AlgebraicTopology §8.8 and the case n=1 of §8.14 obtain it from there, so ClassifyingSpaces becomes a supplier of AlgebraicTopology and consumes nothing of it."

## Previous findings

- R01 — repaired: README 2337–2339 cites "Hatcher, §3.C, Exercise 11, p.292, for the integral Pontryagin ring, and Example 3.16, p.216, for the cohomology ring"; hatcher line 12759 is that exercise.
- R02 — repaired: README 2079–2084 attaches "Hatcher, Proposition 4.21, p.356, for coefficient groups" to `isIso_singularHomologyMap` only; the local-coefficient half cites `isIso_twistedHomologyMap` alone.
- R03 — repaired: §2.3 is deleted; the item map (1004–1009) sends Stage 2 item 3 to Tau Ceti; the contract bullet (394–410) names the declarations; §§3.3, 5.2 and 8.4 cite the supplier contracts.
- R04 — repaired: the description now reads "regrading and convergence of Tau Ceti's filtered-complex spectral sequence (§5.0)" and "§8.16 (T³→S² for Serre fibrations S³→S² whose fibres have H₃=0)".
- R05 — repaired: the description has "retitles §§8.14–8.15" and "StableHomotopyKTheory (#1227) AlgebraicTopology §8.8d for Serre classes (§§3.34–3.36)".
- R06 — repaired: a search of the README for the word "HA" finds nothing; lines 202, 2038 and 4612 read without it.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| §8.8 `[X,Bπ]_*≃Hom(π₁X,π)` from ClassifyingSpaces 1.1, 1.2 | X=point; X=S¹, π=S₃; X=S²; Warsaw circle into S¹ | 1 / 1; 6 pointed classes / 6 homomorphisms, 3 unbased / 3 conjugacy classes; π₂(Bπ)=0 gives 1 / 1; essential map vs Hom(1,ℤ)=1, excluded (not CW) | holds; hypotheses equal the supplier's (Hausdorff CW, path-connected, aspherical target) | R01 |
| §8.14, case n=1 | X=S¹∨S¹, Y=K(S₃,1); X=Y=S² | 36 / 36; [S²,S²]_*=ℤ vs Hom(1,1)=1, excluded since π₂Y≠0 | holds; "CW" is Hausdorff by Conventions (README 259–260); Hatcher 1B.9 at hatcher 3905, p.90 | R01 |
| Contract bullet, pair and triple sequences | (D¹,S⁰); triple (X,A,∅) | δ: generator of H₁(D¹,S⁰)=ℤ ↦ [1]−[0], kernel of H₀(S⁰)→H₀(D¹) is ℤ(1,−1); triple sequence equals the pair sequence | all twelve Tau Ceti names and both Mathlib names exist at the pins | none |
| §5.4 locator | hatcher 12759–12760 | integral Pontryagin ring of Tⁿ is exterior on degree-1 classes; n=1: ℤ, ℤ | locator holds | none |
| §4.10 locator | hatcher 15508–15510 | Proposition 4.21 gives all coefficient groups; no local-system claim attached to it now | locator holds | none |

Rows for untouched statements stand as in the previous review, of `9979497`.

- Source locators checked against the text: 3 (hatcher 3905 for Proposition 1B.9, p.90; 12759 for §3.C Exercise 11, p.292; 15508 for Proposition 4.21, p.356). §8.14 is the only seeded target in a changed passage.
- Library declarations opened at the pin: `Singular/Relative.lean` 284, 441, 458, 463, 468, 497 (namespace `TopPair`); `Singular/Triple.lean` 152, 171, 193, 198, 203, 237 (namespace `TauCeti.TopTriple`); Mathlib `Algebra/Homology/HomologySequence.lean` 282 and 324 (`CategoryTheory.ShortComplex.ShortExact.δ`, `δ_eq`).
- Cross-roadmap citations resolved: ClassifyingSpaces Layer 1 items 1.1 (README 586) and 1.2 (README 731) at this head, with its headline `exists_continuousMap_mapOfEq_eq_of_isAspherical` (`TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` 84); its Layer 1 Dependencies (876–880) name only the pins, so the edge is one-way. ClassifyingSpaces' consumer bullet (1200–1203) matches.
- Dependency check: `depcheck: 206 roadmaps, 1936 edges, 0 problem(s)`; run on ClassifyingSpaces as well: 0 problems.
- Gate: the worker's gate passes every check. My rerun, given no list of the pull request's folders, reports `outside-folder=24`, all inside the 12 folders the brief names as the pull request's own; the diff outside the 13 folders is empty.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the 20 `sorry` warnings; the file is unchanged since `9979497`, so the signature comparison and padding probe of the previous review stand.
- Overlaps: no dropped id, no revision-only id; #1808 and #1854 follow this pull request in the stated shared-folder order. No README text still cites §2.3.
- Remark: the lead `Singular.BrouwerFixedPoint` (README 465) is a module name; `TauCeti/AlgebraicTopology/Singular/BrouwerFixedPoint.lean` exists at the pin.

## Not verifiable

- Nothing in the changed passages; the uncertified and uncached texts listed in the previous review are untouched by this change.

## Source issues

- none
