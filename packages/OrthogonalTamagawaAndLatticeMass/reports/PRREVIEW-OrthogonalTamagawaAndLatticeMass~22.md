# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at d4f1571)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `d4f1571`; this round reads the pull request's title and description against the head. One P3 finding, in the description only; the folder needs no change.

## R01 (P3) — The description calls AdelicAlgebraicGroups an open pull request; it is on main

**Location:** pull request description, **Suppliers**: "Three open roadmap pull requests are suppliers: - AdelicAlgebraicGroups (#792): adelic points, quotient measures, the Tamagawa normalization and strong approximation (AA.1–4)."

**Claim:** Three suppliers are still open pull requests, AdelicAlgebraicGroups among them, and the list of roadmaps cited "as they are on main" is complete without it.

**Witness:** main (`276e711`) has `TauCetiRoadmap/AdelicAlgebraicGroups/`, added by commit `ff532637` "Roadmap: adelic algebraic groups (#792)"; the description's own `depends-on` block ticks #792.

**Repair:** Write "Two open roadmap pull requests are suppliers:" and keep the bullets of GeometryOfNumbersAndQuadraticArithmetic (#851) and ArithmeticStatisticsPartV (#1175). Move AdelicAlgebraicGroups into the next list: "The README also cites these roadmaps, as they are on main: AdelicAlgebraicGroups (AA.1–4: adelic points, quotient measures, the Tamagawa normalization and strong approximation), IntegralLattices, …".

## Previous findings

- none: the previous report, of `d4f1571`, was an acceptance with no finding; the five findings it accounted for (of `cd58321`) were repaired there and the folder has not changed since.

## Verified sound

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | Description, Layer 1: the rank ≥ 3 expression, `genusMass_eq` | I₃ | 2R₃ = 2π⁻³·√π·1·(√π/2) = π⁻²; D = 1; β₂ = 6; odd primes (3/4)ζ(2) = π²/8; product 1/48 = 1/(2³·3!) | True; description, README line 286 and Lean lines 83–88 agree | none |
| 2 | Description, "in rank two the same expression holds", `genusMass_eq_rank_two` | n = 2 | 2R₂ = 2π^(−3/2)·Γ(1/2)·Γ(1) = 2/π; exponent (n+1)/2 = 3/2; Lean has `2 / Real.pi` and `(3 : ℝ) / 2` | Agree | none |
| 3 | Description, Layer 3 and Layer 4 numbers | m = 4, 8, 16, 20 | `bernoulliFullMass 4` = 1/696729600; M₁₆ = 691/277667181515243520000 = 1/(2·696729600²) + 1/(2¹⁵·16!); 2M₃₂ = 80618465.87 > 10⁷; 2M₄₀ = 8.786·10⁵¹ > 10⁵¹; B₃₈ = 2929993913841559/6 | Agree | none |

The rows of the previous reviews for the untouched statements stand as in the previous review, of `d4f1571`.

- **Description against the head, sentence by sentence.** Title, summary block, "What this adds", Layers 0–4, the binary branch, "Out of scope", "Ownership", "Suggested.lean" and "Library revisions" agree with the head. Added roadmap: 3 files, 741 lines, 43 headings, no section or declaration removed. `Suggested.lean` has 8 theorems and the one definition `bernoulliFullMass`; its docstring names the six unstatable groups the description lists.
- **Pins.** `lake-manifest.json` at the head and on main: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`, as the description and README line 28 say.
- **Cross-roadmap claims of the description resolved, 9.** IntegralLattices on main, README lines 82–88: 4D and half of 4E → §0.3, 7B → §1.1, one bullet of 7C → §1.2, 7F → §1.3, 7H → §§2.3, 3.1, 7I → §4.1, 7D → §§2.1–2.2, each as the description lists it. OrthogonalSpinGroups (main, `Completed/`) line 775 is 3A, and lines 781 and 300 hand the algebraic Spin groups and the approximation applications here.
- **Supplier status, 16 roadmaps.** On main: AdelicAlgebraicGroups (R01), IntegralLattices, OrthogonalSpinGroups, ReductiveGroups, GlobalNumberFields, TauberianBoundaryConvergence, ImaginaryQuadraticClassNumber, RootSystems, ReflectionInvariantTheory, Rank24LatticeConstructions, CFSGBasicProperties, SporadicOrders, AlgebraicCodingTheory. Open: GeometryOfNumbersAndQuadraticArithmetic (#851), ArithmeticStatisticsPartV (#1175), EndoscopicTransferAndUnitaryTraceComparison (#999), all earlier in the merge order (lines 55, 56, 151 against 152).
- **Dependency check** printed `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.
- **Gate.** The worker's gate and my rerun at `d4f1571` print `OK`, every counter 0. No file changed outside the folder.
- **Elaboration.** `lake env lean` of `Suggested.lean` prints eight ``declaration uses `sorry` `` warnings (lines 67, 81, 99, 123, 133, 139, 144, 150) and nothing else. The elaborated types in the worker's signature list equal the README statements; no `variable` or `include` in the file.
- **Overlaps.** `overlaps.md` lists no pull request changing this roadmap, no dropped id and no id only a revision defines; the one lead of `citations.md`, `IntegralQuadraticLattice.ofCarrier`, is the GeometryOfNumbersAndQuadraticArithmetic §2.2 name resolved in the earlier review.

Overlap check: read IntegralLattices (main, its ownership table); RootSystems, Rank24LatticeConstructions and ThetaSeries were not read again, the folder being unchanged; shared objects: genus, mass, local density, class finiteness of definite and binary lattices — owner IntegralLattices and Tau Ceti; Eichler, 7B, 7D, 7F, 7H, 7I — owner this roadmap, by IntegralLattices' own table.

Source independence: changed passages only; the folder did not change, so 0 passages compared with 0 sources and the arrangement was not compared again.

## Not verifiable

- O'Meara, *Introduction to Quadratic Forms*, 104:4–5 (§0.3 and the docstring of `finite_genusClasses_of_isIndefinite`): recorded as uncertified and settled; cited by its locator alone.

## Source issues

- none

## For the human reviewers

- **Licence.** The description says the roadmap was "Prepared with OpenAI Codex (GPT-6), using Luna source transcriptions"; what those transcriptions are and under what terms the sources were read is not stated in the pull request.
- **Licence.** README line 586 takes the 23 finite factors and the Leech order from Borcherds's online table (an author page, no stated licence) as locators for values that §4.2 proves; no table is reproduced.
- **Not tested.** Wording and arrangement were not compared this round (no changed passage); O'Meara's text has never been read (uncertified).
