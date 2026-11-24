# Review of GeometricCurrents (pull request #2490 at 6ca5f0e)

**Verdict:** accepted

**Summary.** Accepted: no finding. The folder is unchanged since the previous review of this head, so this round read the pull request's title and description against the head and against the change from main; every sentence checked agrees with the files (the new item G3a, the 25 declarations removed and the two added, the dropped supplier rows, the re-resolved citations, the three library pull-request links replaced). The two format notes of the previous review stand, none blocking, and nothing is left for a human to decide.

## N01 — Backticked names of this roadmap that `Suggested.lean` does not declare

Carried from the previous review. Names in code font such as `integralCurrentHomologySingularIso` (README line 449) and `locallyMinimizingIntegralHypersurface_regular` (line 984) are declared nowhere, and the Lean docstring says their theorems are not statable at the pins, so a reader cannot tell them from the declared `perimeter_simonsRegion_le`. A phrase such as "a theorem we call …" at each would do.

## N02 — One library pull request is still cited by number in the native-floor paragraph

Carried from the previous review. Line 143 keeps the link "Mathlib's area-formula design #39120" beside the pointers that now name pinned declarations. A clause naming the statement meant would outlast the pull-request number.

## Previous findings

The previous review had no finding and no small correction; its two format notes are accounted for here.

- N01 — not repaired: `integralCurrentHomologySingularIso` (449), `locallyMinimizingIntegralHypersurface_regular` (984) and similar names remain backticked and undeclared (N01 above).
- N02 — not repaired: line 143 still reads "Follow Mathlib's area-formula design #39120" (N02 above).

## Verified sound

| Statement | Instances tried | Values computed (README or description side / check side) | Result | Change |
|---|---|---|---|---|
| `perimeter_simonsRegion_le` (description: "for every m ≥ 4 … null-measurable set that differs from it only inside a compact subset of Ω", hypothesis `4 ≤ m`) | elaborated type; G7 lines 1072–1077 | type: `4 ≤ m`, `Ω : Opens`, `NullMeasurableSet F`, `IsCompact K`, `K ⊆ Ω`, `symmDiff F (simonsRegion m) ⊆ K`, perimeter ≤; README the same | description, README and Lean agree | none |
| Divergence factor `(m−1)(a²+b²)−(m+2)ab` (G7, "exactly when m≥4") | a=b=1 for m=3,4,5; m=4 general; discriminant | a=b=1: m−4 = −1, 0, 1; m=4: 3(a−b)²; discriminant (m+2)²−4(m−1)² = 3m(4−m) ≤ 0 iff m ≥ 4 | true; description's "for every m ≥ 4" right | none |
| Filling bound `FV_d(f_#α) ≤ Lᵈ FV_d(α)` needs L > 0 (description, "Filling"; README 620–621, 653–657) | constant f, d = 1, α = ⟨y⟩ | boundaries of 1-chains have coefficient sum 0, ⟨y⟩ has 1, so FV_1(f_#⟨y⟩)=∞; right side 0¹·∞ = 0 | fails at L = 0 as both say | none |
| Lipschitz chains (seeded; README 552–568) | RiedwegSchaeppi2009 lines 191–215; LeuzingerYoung2017 lines 705–709 | source: §2.2 begins p. 4, Definition 2.4 on p. 5, integral Lipschitz chains a subgroup, boundary Σ(−1)ʲ faces; LY p. 15 subcomplex of singular chains | locators and content as cited | none |
| Volume and mass (seeded; 570–577) | LeuzingerYoung2017 lines 712–748 | source p. 16: nonzero cᵢ, distinct simplices, vol by Jacobian, mass = Σ\|cᵢ\| vol, weighted integral (11), bound by sup norm, mass_Z | as README says ("through the Jacobian") | none |
| Filling volume (seeded; 612–618) | LeuzingerYoung2017 lines 749–758 | source p. 16: FV_d(α) = inf of mass over fillings; the function defined "if Y is (d−1)-connected", sup over cycles of mass ≤ V | README's remark on the dropped hypothesis accurate | none |
| `Suggested.lean` on main (description: 25 declarations, two `sorry` definitions) | main's file | `def massMeasure … := by sorry` (line 108), `def intervalCurrent … := by sorry` (line 175); 25 names removed, 2 added | as described | none |

The rows for untouched statements stand as in the previous review, of `6ca5f0e`.

- Source locators checked against the text: 3 seeded targets, 5 locators (RiedwegSchaeppi2009 §2.2 and Definition 2.4, pp. 4–5; LeuzingerYoung2017 §2.4, pp. 15, 15–16 and 16), all as the README says.
- Library declarations opened at the pins: `AlternatingMap.map_linearDependent` (Mathlib/LinearAlgebra/Alternating/Basic.lean line 783); `TauCeti.AffineChain` in the pinned Tau Ceti's Singular/Subdivision files; the rest stand from the previous review.
- Cross-roadmap citations resolved on main for the description's claims: ComplexKahlerGeometry §5.1 (K5a), PDE §5.6 (E25) and §5.7 (E26), GeometricTopology's anchor table mapping the smoothing-and-triangulation item 1 to Layer 11.3, CalibratedGeometry's "Layer 2: Calibrated immersions and integral smooth chains (C2)" heading; CalibratedGeometry on main does not mention HomotopySpheres.
- Description against the diff: the three removed library pull-request links (two of Tau Ceti, one of Mathlib) and the roadmap links pinned to commits are gone; VariationalMethods and UnboundedOperators UO-D06 no longer occur in the README; no other roadmap, on main or at an open head, names any of the removed declarations.
- Dependency check: `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Automatic checks rerun on this head: all pass; the pull request changes nothing outside this folder.
- Elaboration: `lake env lean` on `Suggested.lean` prints only the `sorry` warning at line 58; the file has no `variable`, so no binder is lost.
- Overlaps: no open pull request changes this roadmap, drops an id it cites, or cites an id it drops.

Overlap check: read Varifolds, CalibratedGeometry, GeometricMeasureTheory (main) and MinimalSurfaces (open) as in the previous review; the folder did not change, and nothing is shared: Varifolds owns varifolds, GeometricMeasureTheory rectifiability and Gauss–Green, CalibratedGeometry comass, GeometricCurrents the Simons-region minimality.

Source independence: changed passages only; the folder has no changed passage, so no new wording was compared; the three seeded passages of G3a were set beside LeuzingerYoung2017 lines 705–758 and RiedwegSchaeppi2009 lines 191–215, none shared beyond formulas; no layer added, removed or reordered, so the arrangement stands as compared before (largest share LeuzingerYoung2017: independent).

Research link: G3a's filling volume functions are those in which Leuzinger–Young (2017) state their bounds for arithmetic groups; G3's comparison is Riedweg–Schäppi's (2009) for Lipschitz chains; G7 states Bombieri–De Giorgi–Giusti's (1969) minimality of the Simons cones; G6–G7 feed nonspin positive mass (PositiveMass Layer 3). Rests on the sources read and the README.

## Not verifiable

- Federer, Simon, Mitsuishi, Wickramasekera and Hutchings: listed in References without claim-level locators in the passages this round reads; not opened.
- Whether the Mathlib pull request named at line 143 is contained in the pinned Mathlib was not determined.

## Source issues

- none

## For the human reviewers

- none
