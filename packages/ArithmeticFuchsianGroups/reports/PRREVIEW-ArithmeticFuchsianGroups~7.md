# Review of ArithmeticFuchsianGroups (pull request #2026 at a0992d0)

**Verdict:** needs changes

Incremental re-review: the folder is unchanged since 5fdb26d (0 lines; `a0992d0` merges main). The gate passes. The four findings are all in the pull request's description, which no longer matches the head.

## R01 (P3) — the description names a proof method the README does not contain

**Location:** pull request description, summary block: "the finiteness of arithmetic lattices of a given signature with Odlyzko's discriminant bounds proved by exact rational certificates".

**Claim:** The head proves the two bounds analytically and has no certificate.

**Witness:** `README.md` has no occurrence of "certificate". §1.3b (lines 716–746) uses the Stark identity and inequality (13) via the maximum principle; §1.5 (lines 915–961) uses the explicit formula with a kernel.

**Repair:** Replace the clause with: "the finiteness of arithmetic lattices of bounded covolume and of a given signature, with Odlyzko's discriminant estimate (5) proved for every signature and an explicit totally real bound `|d_k| ≥ a₀R₀ⁿ`".

## R02 (P3) — what TeichmullerGeometry consumes is misstated

**Location:** pull request description, summary block: "Fixed-signature finiteness and the commensurator criterion are what TeichmullerGeometry needs for its arithmetic exceptions and its generic locus of lattices maximal among discrete PGL overgroups".

**Claim:** TeichmullerGeometry takes §1.1, §1.4 and §3.1; it does not consume the commensurator criterion.

**Witness:** `README.md` lines 1394–1401 list §1.1, §1.4 and §3.1. TeichmullerGeometry's contract at its open head (its `README.md` line 102) names the same three, and that file has no occurrence of "commensurator".

**Repair:** Replace the sentence with: "TeichmullerGeometry takes the lattices `Γ(O)` (§1.1) and fixed-signature finiteness (§1.4) for its arithmetic locus, and the identification of `Isom(ℍ)` with `PGL₂(ℝ)` (§3.1); surfaces in its generic locus satisfy the hypotheses of Layer 3. The Gassmann covers give the first explicit isospectral pair in the library."

## R03 (P3) — the L-function roadmaps do not consume FuchsianOrbifolds

**Location:** pull request description: "They consume AdelicAlgebraicGroups and the L-function roadmaps while those roadmaps consume the geometric layers of FuchsianOrbifolds".

**Claim:** Only AdelicAlgebraicGroups consumes FuchsianOrbifolds; LFunctions and ZerosOfLFunctions do not.

**Witness:** On main, `TauCetiRoadmap/LFunctions/README.md` and `TauCetiRoadmap/ZerosOfLFunctions/README.md` contain no "FuchsianOrbifolds"; the merge order has them at lines 29 and 48, before FuchsianOrbifolds at 49. AdelicAlgebraicGroups cites it (its `README.md` lines 594, 5523).

**Repair:** Replace with: "They consume AdelicAlgebraicGroups, which itself consumes the geometric layers of FuchsianOrbifolds (layers 0, 1, 4 and 5), so the two halves have to be separate roadmaps for the dependency order to be acyclic."

## R04 (P3) — the supplier sentence names two of thirteen suppliers and omits the four not on main

**Location:** pull request description: "Its suppliers AdelicAlgebraicGroups (the class-number finiteness and the adelic measure normalisation) and FuchsianOrbifolds are on main."

**Claim:** The sentence reads as the list of suppliers; the head has thirteen supplier roadmaps, four of them not on main.

**Witness:** `README.md` lines 286, 298, 318 and 355 take Tamagawa number one, the ramification-set classification, the explicit formula and the `L²` adapter from four roadmaps absent from main (1a19c9f), as the description's own Depends-on block lists.

**Repair:** Replace with: "Of its suppliers, FuchsianOrbifolds, AdelicAlgebraicGroups, ClassicalArithmeticCompletion, LFunctions, ZerosOfLFunctions, ReductiveGroupsPartII, RepresentationTheory, FreeGroupsAndLimitGroups and PseudodifferentialOperators are on main; EndoscopicTransferAndUnitaryTraceComparison (§6.2, Tamagawa number one), GL2AutomorphicRepresentationsAndTransfer (R17.1.5), SmallRamificationAndAbelianVarietyBaseCases (§§1.0, 1.6) and NoncompactQuantumSymmetry (M1) are still open and merge first."

## Previous findings

- none: the review of 5fdb26d had no finding.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §1.2 covolume formula (cited by the description's "covolumes through Tamagawa number one") | `k = ℚ`, `O = M₂(ℤ)`, `n = 1` | `8π·ζ(2)/(4π²) = 8π·(π²/6)/(4π²) = 1.0471976 = π/3` | holds | none |
| §1.3b `discr_ge_odlyzko_five` (R01) | `k = ℚ`, `(r₁, r₂) = (1, 0)` | right side `58.6·e^(−70) = 2.3296·10⁻²⁹ ≤ 1 = |d_ℚ|` | holds | none |
| §1.5 `discr_ge_totallyReal` (R01) | `n = 2`; table row `n₀ = 32` | `a₀R₀² = 0.20652 < 5`; `45.415·e^(−15.467/32) = 28.00824 > 28.008`, margin `0.0002` as the Check says | holds | none |
| §1.4 fixed-signature finiteness (R02) | consumer contract | TeichmullerGeometry's open head cites §1.1, §1.4, §3.1; 0 occurrences of "commensurator" there | README's Downstream consumers correct; description not | R02 |

The rows for all other statements stand as in the previous review, of `5fdb26d`.

- Folder diff `5fdb26d..a0992d0`: empty. `git diff --stat origin/main...HEAD` outside the folder: empty (the files listed as changed outside are main's, brought in by the merge).
- Gate re-run at this head: every counter 0, `OK`; the worker's run adds `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Merge order: this roadmap line 291, TeichmullerGeometry line 292.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 17 warnings, all `declaration uses sorry` (lines 84, 92, 110, 147, 155, 167, 177, 191, 200, 210, 218, 226, 232, 240, 252, 262, 276). The file is unchanged, so signatures, headlines and the padding probe stand as in the previous review.
- Description claims checked and found correct: the title; adds a new roadmap (not on main); the three-layer summary; Layer 3's order-32 pair; AdelicAlgebraicGroups and FuchsianOrbifolds on main; no other roadmap on main or open states an explicit isospectral pair (`roadmaps grep isospectral`: only PseudodifferentialOperators P7a's transplantation theorem, which this roadmap consumes).
- Cross-roadmap citations resolved this round: the thirteen supplier roadmaps located (nine on main at 1a19c9f, four as open new-roadmap pull requests); `overlaps.md` lists no dropped id and no other pull request changing this folder. The two `roadmaps resolve` leads are in untouched text resolved by the earlier reviews.
- Overlap check: read QuaternionArithmetic, KleinianGroups, TeichmullerGeometry, FuchsianOrbifoldsPartII (open), FuchsianOrbifolds, AdelicAlgebraicGroups (main); real splittings, `Γ(O)`, the ramification set and fixed-signature finiteness are owned here and cited by QuaternionArithmetic (§§1.1, 1.2, 1.4) and TeichmullerGeometry (§§1.1, 1.4, 3.1); FuchsianOrbifolds (lines 34–35, 159–160) hands arithmetic lattices and commensurators to this roadmap; nothing has two owners.
- Source independence: changed passages only; the diff is empty, so 0 passages compared with 0 sources; the arrangement was not compared again (no layer added, removed or reordered).
- Sources: the seeded sample falls in no changed passage; the README flags no locator as unverified.

## Not verifiable

- Maclachlan–Reid, Theorems 11.2.1 and 11.3.1, and Margulis, Chapter IX: recorded as uncertified (paywalled); untouched.
- The text of the description after any cut in the quoted copy: outside this check.

## Source issues

- none

## For the human reviewers

- Licence: §1.5 (`README.md` lines 931–961) tabulates 31 rows of constants drawn from `odlyzko1976tables`, an unpublished 1976 table set; the reference is at lines 986–988. Whether these numerical rows may be reproduced is a human's decision.
