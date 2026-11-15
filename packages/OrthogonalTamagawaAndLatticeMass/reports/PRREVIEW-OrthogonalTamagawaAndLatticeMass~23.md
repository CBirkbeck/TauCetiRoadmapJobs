# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at d4f1571)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `d4f1571`; this round reads the pull request's title and description, as they stand now, against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "Two open roadmap pull requests are suppliers" (#851, #1175) and lists "AdelicAlgebraicGroups (AA.1–4: adelic points, quotient measures, the Tamagawa normalization and strong approximation)" among the roadmaps cited as they are on main.

## Verified sound

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | Description, Layer 1, rank ≥ 3 expression; `genusMass_eq` | I₃ | 2R₃ = 2π⁻³·Γ(1/2)Γ(1)Γ(3/2) = π⁻²; D = 1; β₂ = 6; odd primes π²/8; product 0.0208333 = 1/48 = 1/(2³·3!) | Description, README line 286 and Lean lines 81–88 agree | none |
| 2 | Description, "in rank two the same expression holds"; `genusMass_eq_rank_two` | n = 2 | 2π^(−3/2)Γ(1/2)Γ(1) = 0.63662 = 2/π; exponent (n+1)/2 = 3/2; Lean has `2 / Real.pi`, `(3 : ℝ) / 2` | Agree | none |
| 3 | Description, Layer 3 "Bernoulli product … through B₃₈"; `evenUnimodularMass_eq` | m = 0, 2, 4, 8 | `bernoulliFullMass` 0 → 0 (mass 1, excluded by n > 0); 2 → 1/576; 4 → 1/696729600; 8 → 691/277667181515243520000; B₃₈ = 2929993913841559/6 | Agree | none |
| 4 | Description, Layer 4 "exactly 2 classes in rank 16"; `rank16_classNumber` | the two reference classes | 1/(2·696729600²) + 1/(2¹⁵·16!) = 691/277667181515243520000 = M₁₆ exactly | Agree | none |
| 5 | Description, "more than 10⁷ … 10⁵¹"; `rank32_classNumber_lower_bound`, `rank40_classNumber_lower_bound` | m = 16, 20 | 2M₃₂ = 80618465.87 > 10⁷; 2M₄₀ = 8.786·10⁵¹ > 10⁵¹ | Agree | none |
| 6 | Description, Layer 4 Weyl orders | D₄, E₆, E₇ | 2³·4! = 192; 72·6! = 51840; 126·2⁵·6! = 2903040 | Agree with README line 512 | none |

The rows of the previous reviews for the untouched statements stand as in the previous review, of `d4f1571`.

- **Description against the head, sentence by sentence.** Title, summary block, "What this adds", Layers 0–4, the binary branch, "Out of scope", "Ownership", "Suppliers", "Suggested.lean" and "Library revisions" agree with the head: a new roadmap, 3 files, 741 lines, 43 headings, nothing removed; 8 theorems and the one definition `bernoulliFullMass`; the module docstring names the six unstatable groups the description lists.
- **Pins.** `lake-manifest.json` at the head and on main (`2248bbb`): Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`, as the description and README line 28 say.
- **Cross-roadmap claims of the description resolved, 9.** IntegralLattices on main, README lines 83–88 (7B → §1.1, one bullet of 7C → §1.2, 7F → §1.3, 7H → §§2.3, 3.1, 7I → §4.1, 7D → §§2.1–2.2) and line 1531 (4D and the rank-≥3 half of 4E); OrthogonalSpinGroups (main, `Completed/`) lines 775–781 (3A) and 300.
- **Supplier status, 16 roadmaps.** On main: AdelicAlgebraicGroups, IntegralLattices, OrthogonalSpinGroups, ReductiveGroups, GlobalNumberFields, TauberianBoundaryConvergence, ImaginaryQuadraticClassNumber, RootSystems, ReflectionInvariantTheory, Rank24LatticeConstructions, CFSGBasicProperties, SporadicOrders, AlgebraicCodingTheory. Open, adding new folders: GeometryOfNumbersAndQuadraticArithmetic (#851), ArithmeticStatisticsPartV (#1175), EndoscopicTransferAndUnitaryTraceComparison (#999), at merge-order lines 55, 56, 151 against 152.
- **Dependency check** printed `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.
- **Gate.** The worker's gate and my rerun at `d4f1571` print `OK`, every counter 0. No file changed outside the folder.
- **Elaboration.** `lake env lean` of `Suggested.lean` prints eight ``declaration uses `sorry` `` warnings (lines 67, 81, 99, 123, 133, 139, 144, 150) and nothing else; the file has no `variable` or `include`.
- **Overlaps.** `overlaps.md` lists no pull request changing this roadmap, no dropped id and no id only a revision defines; the one lead of `citations.md`, `IntegralQuadraticLattice.ofCarrier`, is the GeometryOfNumbersAndQuadraticArithmetic §2.2 name (README line 76), a supplier's declaration and not a pinned one.

Overlap check: read IntegralLattices (main, its ownership table and downstream list); RootSystems, Rank24LatticeConstructions and ThetaSeries were not read again, the folder being unchanged; shared objects: genus, mass, local density, class finiteness of definite and binary lattices — owner IntegralLattices and Tau Ceti; Eichler, 7B, 7D, 7F, 7H, 7I — owner this roadmap, by IntegralLattices' own table.

Source independence: changed passages only; the folder did not change, so 0 passages compared with 0 sources and the arrangement was not compared again.

## Not verifiable

- O'Meara, *Introduction to Quadratic Forms*, 104:4–5 (§0.3 and the docstring of `finite_genusClasses_of_isIndefinite`): recorded as uncertified and settled; cited by its locator alone.

## Source issues

- none

## For the human reviewers

- **Licence.** The description says the roadmap was "Prepared with OpenAI Codex (GPT-6), using Luna source transcriptions"; what those transcriptions are and under what terms the sources were read is not stated in the pull request.
- **Licence.** README line 586 takes the 23 finite factors and the Leech order from Borcherds's online table (an author page, no stated licence) as locators for values that §4.2 proves; no table is reproduced.
- **Not tested.** Wording and arrangement were not compared this round (no changed passage); O'Meara's text has never been read (uncertified).
