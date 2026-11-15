# Review of LefschetzStructures (pull request #1061 at 2886ce3)

**Verdict:** needs changes

## R01 (P3) — The description's Layer 2 is an earlier head's transport layer, not the dictionary of 2.4

**Location** Pull-request description, ¶1: “Lefschetz structures and the theory of algebraic operators on them, transported to the cohomology of varieties.” … “Layer 2: … and Layer 1's theorems on `H(X)` with established cases imported as theorems.”

**Claim** The description is unchanged since the previous review and still describes a Layer 2 that transports Layer 1's theorems to `H(X)` and imports the established cases. At this head Layer 2 does neither: it delivers the dictionary of 2.4 with MotivesAndAlgebraicCycles §7.3's predicates, which the description never mentions. The text also never says that the pull request adds a new roadmap.

**Witness** README 3–4: “then compare it with the cohomology of varieties”; 517: “this section proves only the dictionary”; 523: “they are not restated on `H(X)`”; 96: the established cases “reach Layer 1 only through the dictionary”.

**Repair** Replace the first sentence with “Adds the roadmap LefschetzStructures: the linear algebra of Lefschetz structures and the theory of algebraic operators on them, compared with the cohomology of varieties.” Replace the Layer 2 sentence with “Layer 2: Lefschetz data on MotivesAndAlgebraicCycles' minimal Weil theory, `𝒜(X)` from all graded correspondences, the Lefschetz and algebraic structures on `H(X)`, and the dictionary (2.4) between Layer 1's four properties on `H(X)` and MotivesAndAlgebraicCycles §7.3's `B_H(X)`, `C_ℚ,H(X)`, `D_ℚ,H(X)` and Hodge standard positivity; Layer 1's theorems are not restated on `H(X)`, and the established cases stay MotivesAndAlgebraicCycles §7.4's.” Both sentences agree with README lines 3–4, 96 and 504–523.

## Previous findings

- R01 — not repaired: the description still reads “transported to the cohomology of varieties” and “Layer 1's theorems on `H(X)` with established cases imported as theorems”; raised again as R01 above.

## Verified sound

Incremental re-review of 0 changed lines since `9f3f7c1`. `git diff --quiet 9f3f7c1 HEAD -- TauCetiRoadmap/LefschetzStructures` succeeds. The one new commit merges main; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/LefschetzStructures'` is empty, so the three folders listed as changed outside this one are main's own. The pins are unchanged (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, `v4.36.0-rc2`).

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Description, Layer 2 sentence and “transported” (R01) | the two clauses against README 3–4, 96, 517, 523 | README 4 says “compare”; 517 “proves only the dictionary”; 523 “not restated on `H(X)`”; 96 routes established cases through 2.4 only | contradicted | R01 |
| `lambda_pow_L_pow`, `L_pow_lambda_pow` with `IsLefschetzInverse` (description: “the Lefschetz inverse `Λ`”) | `ℚ[ξ]/(ξ³)`, `n = 2`; `i = 0, 1, 2` | `P⁰ = ⟨1⟩`, `P² = 0`; `Λ1 = 0`, `Λξ = 1`, `Λξ² = ξ` (bounds `2 ≤ 4`, `4 ≤ 4`); `Λ²L²1 = 1`; `L²Λ²ξ² = ξ²`; `i = 1`: `H¹ = 0`; `i = 2`: exponent `0` | sound | none |
| Description boundary: DeligneWeightsAndPurity §9.7 names | its head `fae1b73` (unchanged) | §9.6 at README line 3045, §9.7 at 3055; `primitivePiece` at Suggested.lean 148, `lefschetzDecomposition` at 155 | resolved | none |
| Description boundary: MotivesAndAlgebraicCycles §§7.3–7.4 | its head `4cfd9b7` (unchanged) | §7.3 at line 1345, §7.4 at 1371 | resolved | none |
| Description boundary: EtaleDualityAndPerverseSheaves §5.7 | its head, now `54256cd` | heading at line 5675; `abstractPrimitiveDecomposition` named at 5744 | resolved | none |
| Description: “`𝔰𝔩₂` representations are LieHighestWeight's”; Kähler case is ComplexKahlerGeometry K6.1's | main `2248bbb` | LieHighestWeight's former-numbering table, lines 74–76, maps old Layer 0 to three Tau Ceti declarations; K6.1 label present in ComplexKahlerGeometry | resolved | none |
| Description: `Suggested.lean` covers Layers 0–1, imports only Mathlib, `sorry` the only warning | `lake env lean` | exit 0; 12 `declaration uses sorry` warnings; 0 other warnings or errors | true | none |

The rows for the statements this change does not touch stand as in the previous review, of `9f3f7c1`.

- **Gate**: the worker's gate at this head has every scanner 0, `build=0`, OK. Run again with the brief's command (configured order), every scanner is 0 except `depcheck: NOT IN ORDER: LefschetzStructures`, which is not a finding.
- **Dependency check** (candidate order, `--movable`): `depcheck: 245 roadmaps, 2232 edges, 0 problem(s)`; no UPWARD or CYCLE line (MotivesAndAlgebraicCycles 93, LefschetzStructures 94).
- **Elaboration**: exit 0, 12 `sorry` warnings and nothing else. The file is byte-identical to the one probed before, so the signature comparison and the one-tactic probe of the earlier rounds stand.
- **Pull-request text**: the title and 7 description sentences were read against the head; two are contradicted (R01). The depends-on block is generated and outside this check.
- **Citations re-resolved at current heads**: 9 (the rows above, HodgeStructures under `Completed/`, SchemeAndStackFoundations and EtaleCohomologyFoundations on main); the tools' resolve list is empty; no overlap item is listed.
- **Remark (untouched text)**: README line 51 cites `gradedLefschetz_vectorSpace_compat`; no roadmap on main or at an open head other than this one contains that name (`roadmaps grep`: one hit, this README).

Overlap check: read MotivesAndAlgebraicCycles (`4cfd9b7`) and DeligneWeightsAndPurity (`fae1b73`), the two closest open roadmaps (none is listed on main or by results), and EtaleDualityAndPerverseSheaves §5.7 (`54256cd`). Shared objects and owners as before: the primitive decomposition and pairings are DeligneWeightsAndPurity §9.7's, adapted by 0.2 and 0.5; the categorical decomposition is EtaleDualityAndPerverseSheaves §5.7's; Weil theories, correspondences and the §7.3 predicates are MotivesAndAlgebraicCycles', and 2.4 is a dictionary to them.

Source independence: changed passages only. The folder is byte-identical to `9f3f7c1`, so 0 passages were compared with 0 sources, and the arrangement was not compared again (no layer added, removed or reordered). Largest share: the Montpellier fonds (folders 14 and 16), 4 of 14 locators; contents not compared, because that text was not read in any round.

## Not verifiable

- Montpellier fonds folders 14 and 16; Kleiman 1968 and 1994; Grothendieck 1969; Lieberman 1968; André 2004: they sit in passages untouched since `9f3f7c1` and were not fetched this round. The package records no `sources.toml`.

## Source issues

- none

## For the human reviewers

- Not tested: the largest share of the README's locators, 4 of 14, is Grothendieck's Montpellier fonds (folders 14 and 16; README lines 22, 228, 348, 378). No round has read them, so wording and arrangement were not checked against them.
- Sources: the Montpellier fonds are unpublished manuscripts. They are the cited source for 1.2 (alongside Kleiman 1994, Theorem 4.1), for 1.3 (alongside Beilinson 2012, §2.3) and for one 0.1 Check. Every other cited source is a published, refereed text.
