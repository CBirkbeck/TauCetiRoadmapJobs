# Review of LefschetzStructures (pull request #1061 at 8bf2164)

**Verdict:** needs changes

## R01 (P3) — The description's Layer 2 is an earlier head's transport layer, not the dictionary of 2.4

**Location** Pull-request description, ¶1: “Lefschetz structures and the theory of algebraic operators on them, transported to the cohomology of varieties.” … “Layer 2: … and Layer 1's theorems on `H(X)` with established cases imported as theorems.”

**Claim** The description is unchanged and still describes a Layer 2 that transports Layer 1's theorems to `H(X)` and imports the established cases. At this head Layer 2 delivers only the dictionary of 2.4 with MotivesAndAlgebraicCycles §7.3's predicates. The text also never says that the pull request adds a new roadmap.

**Witness** `TauCetiRoadmap/LefschetzStructures/README.md` 3–4: “then compare it with the cohomology of varieties”; 94–95: the established cases “reach Layer 1 only through the dictionary”; §2.4: “this section proves only the dictionary”.

**Repair** Replace the first sentence with “Adds the roadmap LefschetzStructures: the linear algebra of Lefschetz structures and the theory of algebraic operators on them, compared with the cohomology of varieties.” Replace the Layer 2 sentence with “Layer 2: Lefschetz data on MotivesAndAlgebraicCycles' minimal Weil theory, `𝒜(X)` from all graded correspondences, the Lefschetz and algebraic structures on `H(X)`, and the dictionary (2.4) between Layer 1's four properties on `H(X)` and MotivesAndAlgebraicCycles §7.3's `B_H(X)`, `C_ℚ,H(X)`, `D_ℚ,H(X)` and Hodge standard positivity; Layer 1's theorems are not restated on `H(X)`, and the established cases stay MotivesAndAlgebraicCycles §7.4's.”

## R02 (P3) — 1.3 has lost its source: “the source's statement” now refers to nothing

**Location** `TauCetiRoadmap/LefschetzStructures/README.md` 366 and 373–375: “`exists_inverse_L_pow_of_charpoly`, the source's statement: fix `i ≤ n`; …” and “*Needs:* 1.1, 1.2. (For Betti cohomology with `ℚ` coefficients, the same passage … is Beilinson 2012, §2.3, proof of (b).)”

**Claim** The change deleted the only source 1.3 named for its three theorems. “The source's statement” has no referent, and the remaining parenthesis is an analogue, not a locator for the statement; line 196 promises each item “its source”.

**Witness** Change since `2886ce3`, third hunk: “(Source: Montpellier fonds, folder 16, pp. 47–48, …;” removed, nothing put in its place. `grep -n Source` on §1.3 at this head: no hit between lines 362 and 390.

**Repair** Line 366: replace “, the source's statement: fix” with “: fix”. Lines 373–375: “*Needs:* 1.1, 1.2. (Source: Beilinson 2012, §2.3, proof of (b), which is the case `F = K = ℚ` for Betti cohomology, where the characteristic-polynomial hypothesis holds automatically and the cut by projectors is that of `lambdaAlgebraic_of_charpoly`.)” Checked against Beilinson2012 lines 286–297. A published locator for the criterion with `F ≠ K`, if the author has one, is added beside it.

## R03 (P3) — 1.2's first Check attributes the module-free ring setting to “the source”, which is now Kleiman 1994 alone

**Location** `TauCetiRoadmap/LefschetzStructures/README.md` 350–351: “in a ring with grading idempotents and no module, as in the source, both are hypotheses.”

**Claim** The clause was written when 1.2's source line named the notes' abstract criterion first. The only source 1.2 now names is Kleiman 1994, Theorem 4.1, a theorem on correspondences acting on the cohomology of a variety, where a module is present.

**Witness** Change since `2886ce3`, second hunk: “(Source: Montpellier fonds, folder 16, pp. 4–12, no. 6, criterion `(6.3)_i`, …; Kleiman 1994, Theorem 4.1, pp. 14–15.)” becomes “(Source: Kleiman 1994, Theorem 4.1, pp. 14–15.)”; line 351 is unchanged.

**Repair** Delete “, as in the source”: “…and `w_i` maps `H^{2n−i}` to `H^i`; in a ring with grading idempotents and no module, both are hypotheses.” (Kleiman 1994 was not readable this round; if its Theorem 4.1 does state both conditions for a module-free ring, keep the clause and say so with the page.)

## Previous findings

- R01 — not repaired: the description still reads “transported to the cohomology of varieties” and “Layer 1's theorems on `H(X)` with established cases imported as theorems”; raised again as R01.

## Verified sound

Incremental re-review of 16 changed lines since `2886ce3` (README only; `Suggested.lean` byte-identical; no file changed outside the folder: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/LefschetzStructures'` is empty). No mention of the Montpellier fonds remains in the README, the Lean file or the References.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2 `lambdaAlgebraic_of_inverses`, formula `Σ_j Σ_{β<n−j} L^β w_j L^{n−j−β−1} p_{j,β+1}` (source line changed) | `ℚ[ξ]/(ξ³)`, `n = 2`, `w_0 = Λ²`, `w_1 = Λ`, `w_2 = 1` | `P⁰ = ⟨1⟩`, others 0. `β=0`: `Λ²Lξ = Λ²ξ² = 1 = Λξ`; `β=1`: `LΛ²ξ² = ξ = Λξ²`; on `1`: no term, `Λ1 = 0` | sound | none |
| 1.3 `exists_inverse_L_pow_of_charpoly` (source deleted) | `ℚ[ξ]/(ξ³)`, `n = 2`, `i = 0`, `u = 2Λ²`; `i = n`; `K = ℚ(√2)`, `u = √2Λ²` | `uL²|H⁰ = 2`, charpoly `T − 2`, `w = ½u = Λ²`: `wL²1 = 1`, `L²wξ² = ξ²`. `i = n`: exponent 0, `w = f(u)u` is 1 on `H^n`. `√2`: charpoly `T − √2 ∉ ℚ[T]`, hypothesis fails | sound; unsourced | R02 |
| 1.3 parenthesis, Beilinson 2012 §2.3 (b) (changed passage) | Beilinson2012 lines 244–252, 286–297 | source: descending induction on `i`, projectors `p_j`, `|j| > i`, cut `c′`, `A = c′L^i`, `f ∈ ℚ[t]`, inverse `f(A)c′`; coefficients ℚ, no charpoly hypothesis needed | supports the analogue as written | R02 uses it |
| 0.1 odd-degree Example (attribution deleted) | `V = K²`, `φ` standard symplectic, `W = K`; `φ = 0` | `n = 2`: `L²: 1 ↦ ξ²` bijective; `L: H¹ → H³ = V̌`, `x ↦ φ(·,x)` bijective iff `φ` nondegenerate; `P² = ker(L|H²) = W`. `φ = 0`: `L|H¹ = 0`, fails | sound | none |
| Description, Layer 2 sentence and “transported” (R01) | the two clauses against README 3–4, 94–95, §2.4 | README says “compare”, “proves only the dictionary”, established cases via 2.4 only | contradicted | R01 |

The rows for the statements this change does not touch stand as in the previous review, of `2886ce3`.

- **Gate**: the worker's gate at this head has every scanner 0, `build=0`, OK.
- **Dependency check** (candidate order, `--movable`): `depcheck: 245 roadmaps, 2232 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- **Elaboration**: `lake env lean` on `Suggested.lean` exits 0 with 12 `declaration uses sorry` warnings and nothing else; the file is unchanged, so the signature comparison and the one-tactic probe of the earlier rounds stand.
- **Source locators checked against the text**: 2 (README 375 and 527–529, both Beilinson2012 lines 244–252 and 286–297). Kleiman 1994, now the sole source of 1.2, could not be read (below).
- **Cross-roadmap citations**: the diff adds, removes or changes none; the tools' resolve list and overlap list are empty.
- **Pull-request text**: title and 7 description sentences read against the head; two contradicted (R01). The deletion of the unpublished-notes citations changes nothing the description states.
- **Remark (untouched text)**: README 116 still attributes the name « pseudo-inverse » to Grothendieck with no citation; README 538 says Beilinson's §2 works over `ℂ`, while Beilinson2012 line 102 assumes a field of characteristic 0.

Overlap check: read MotivesAndAlgebraicCycles, DeligneWeightsAndPurity and LefschetzPencilsAndVanishingCycles (the three closest open roadmaps; none is listed on main or by results); the change touches no shared object. Owners as before: the primitive decomposition and pairings are DeligneWeightsAndPurity §9.7's; Weil theories, correspondences and the §7.3 predicates are MotivesAndAlgebraicCycles'; nothing is shared with LefschetzPencilsAndVanishingCycles.

Source independence: changed passages only; 1 passage (README 373–375) compared with 1 source (Beilinson2012 lines 286–297), none shared; largest share now Beilinson2012, 3 of 9 locators; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Kleiman 1994, Theorem 4.1, pp. 14–15 (sole source of 1.2 after this change) and §5, pp. 16–19: the sources service found no legal copy (publisher page unclassified, arXiv search unavailable); the locator is not confirmed.
- Kleiman 1968: same result; not fetched as a possible published source for 1.3.
- Grothendieck 1969, Lieberman 1968, André 2004, Katz–Messing 1974, Arapura 2006: in untouched passages, not fetched this round. The package records no `sources.toml`.

## Source issues

- none

## For the human reviewers

- none
