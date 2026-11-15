# Review of ArithmeticFuchsianGroups (pull request #2026 at a0992d0)

**Verdict:** accepted

Incremental re-review of 0 changed lines since a0992d0: the folder is unchanged; this round read the pull request's title and description, rewritten since the previous review, against the head. No finding.

## Previous findings

- R01 — repaired: the description now says estimate (5) and the totally real bound are "proved analytically, by the Stark identity with the maximum principle and by the explicit formula with Odlyzko's kernel"; no "certificate" remains (§1.3b, §1.5).
- R02 — repaired: "TeichmullerGeometry takes Γ(O) and fixed-signature finiteness for its arithmetic locus, and the identification of hyperbolic isometries with PGL₂(ℝ)"; matches `README.md` Downstream consumers (§1.1, §1.4, §3.1).
- R03 — repaired: "they consume AdelicAlgebraicGroups, which itself consumes FuchsianOrbifolds layers 0, 1, 4 and 5"; the L-function roadmaps are no longer named as consumers of FuchsianOrbifolds.
- R04 — repaired: "Of its thirteen supplier roadmaps, nine are on main: … Four are open new-roadmap pull requests that merge first", each with its section; counts and sections agree with the head.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §1.2 covolume formula (description: "covolume, for maximal O, from Tamagawa number one") | `k = ℚ`, `O = M₂(ℤ)`, `n = 1`, no ramified prime | `8π·ζ(2)/(4π²) = 8π·(π²/6)/(4π²) = π/3 = 1.04720`, FuchsianOrbifolds' cusped minimum | holds | none |
| §1.3b `discr_ge_odlyzko_five` and its totally real weakening (description: "estimate (5) holds in every signature") | `(r₁, r₂) = (2, 0)`, `ℚ(√5)`; `(0, 1)`, `ℚ(i)` | `58.6²·e^(−70) = 1.37·10⁻²⁷ ≤ 5`; `21.8²·e^(−70) = 1.89·10⁻²⁸ ≤ 4`; `70·log₁₀3 = 33.398 < 34` | holds | none |
| §1.4 Takeuchi from Borel's bound (description: "Borel's finiteness … and Takeuchi's for a fixed signature") | signature `(3; −)` | covolume `2π(2·3 − 2) = 8π`, so the case `C = A = 8π` of `finite_conj_isArithmetic_covolume_le` | holds | none |
| §2.2 `isArithmetic_iff_dense_commensurator` (description: "arithmetic exactly when its commensurator is dense") | `PSL₂(ℤ)`; the `(2,3,7)` group | commensurator of `PSL₂(ℤ)` contains the image of `GL₂⁺(ℚ)`, dense; `(2,3,7)` arithmetic, so excluded from Layer 3, as §3.3's Check says | holds | none |
| §3.4 covers (description: "order-32 Gassmann pair … genus at least three") | `g = 3` | index `32/4 = 8`; `2h − 2 = 8·4`, `h = 17`; area `8·8π = 64π = 4π(17 − 1)` | holds | none |

The rows for all other statements stand as in the previous review, of `a0992d0`.

- Description sentences checked against the head: 21 (summary block and prose); none contradicted. It states that the pull request adds a new roadmap folder with three files, the layers, the not-statable headline and its reason (matches the `Suggested.lean` docstring), the suppliers and the consumers. Title matches the README's.
- Supplier count: 13 roadmaps under `## Exact supplier contracts`; 9 present on main (1a19c9f), 4 absent from main and open as new-roadmap pull requests. Sections resolved at the open heads: EndoscopicTransferAndUnitaryTraceComparison §6.2, GL2AutomorphicRepresentationsAndTransfer R17.1.5 (ramification realization and isomorphism by local splitting), SmallRamificationAndAbelianVarietyBaseCases §§1.0 and 1.6, NoncompactQuantumSymmetry M1 (finite-index lattice-quotient adapter).
- Consumers resolved at their open heads: QuaternionArithmetic cites §§1.1, 1.2, 1.4 (its `README.md` lines 205, 361); TeichmullerGeometry cites §1.1, §1.4, §3.1 (its `README.md` lines 100–102). AdelicAlgebraicGroups on main cites FuchsianOrbifolds layers 0, 1, 4 (line 5523) and 1, 4, 5 (line 5582).
- Gate re-run at this head: every counter 0, `OK`; the worker's run adds `build=0`. Folder diff since the previous review: empty; `git diff --stat origin/main...HEAD` outside the folder: empty.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Merge order: this roadmap line 291, TeichmullerGeometry line 292.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 17 warnings, all `declaration uses sorry`. The file is unchanged, so signatures, headlines and the padding probe stand as in the earlier reviews.
- Overlap check: read QuaternionArithmetic, KleinianGroups, TeichmullerGeometry, FuchsianOrbifoldsPartII (open), FuchsianOrbifolds, AdelicAlgebraicGroups, NoncongruenceModularForms (main); real splittings, `Γ(O)`, the ramification set, the covolume formula and fixed-signature finiteness are owned here and cited by QuaternionArithmetic and TeichmullerGeometry; nothing has two owners. `overlaps.md`: no dropped id, no other pull request changing this folder, no second copy.
- Source independence: changed passages only; the diff is empty, so 0 passages compared with 0 sources; the arrangement was not compared again (no layer added, removed or reordered). The seeded sample falls in no changed passage; the two `roadmaps resolve` leads (`Building.exists_fixedPoint_of_bounded`, `Reduction.finite_classes`) are supplier-roadmap names in untouched text.

## Not verifiable

- Maclachlan–Reid, Theorems 11.2.1 and 11.3.1, and Margulis, Chapter IX: recorded as uncertified (paywalled); untouched.
- The text of the description after any cut in the quoted copy: outside this check.

## Source issues

- none

## For the human reviewers

- Licence: §1.5 (`TauCetiRoadmap/ArithmeticFuchsianGroups/README.md` lines 931–961) tabulates 31 rows of constants drawn from `odlyzko1976tables`, an unpublished 1976 table set; the reference is at lines 986–988. Whether these numerical rows may be reproduced is a human's decision.
