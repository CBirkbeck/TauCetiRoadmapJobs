# Review of LefschetzStructures (pull request #1061 at ad5de98)

**Verdict:** needs changes

## R01 (P3) — 1.3's source line misdescribes Beilinson's cut as that of `lambdaAlgebraic_of_charpoly`

**Location** `TauCetiRoadmap/LefschetzStructures/README.md` 374–375: “where the characteristic-polynomial hypothesis holds automatically and the cut by projectors is that of `lambdaAlgebraic_of_charpoly`.)”

**Claim** Beilinson's cut is a different one. He cuts the given isomorphism `c′` with the projectors onto the degrees outside `[i, 2n − i]`, which his descending induction has already made algebraic. `lambdaAlgebraic_of_charpoly` instead assumes `ProjectorsAlgebraic` and cuts `w` as `π_i w π_{2n−i}`. README 534 says that 1.3 does this « instead ».

**Witness** Beilinson2012 lines 288–294: the projectors `p_j`, `|j| > i`, come from the induction hypothesis. With `n = 2` and `i = 1` these are the projectors onto `H⁰` and `H⁴`, while `lambdaAlgebraic_of_charpoly` uses `π_1` and `π_3` and assumes them algebraic.

**Repair** Change lines 374–375 to: “…where the characteristic-polynomial hypothesis holds automatically; its cut uses only the projectors onto the degrees outside `[i, 2n − i]`, which the descending induction has already made algebraic, whereas `lambdaAlgebraic_of_charpoly` assumes `ProjectorsAlgebraic` and cuts `w` as `π_i w π_{2n−i}` (2.4, Research context).)” Checked against Beilinson2012 lines 286–297 at `n = 2`, `i = 1`.

## Previous findings

- R01 — repaired: the description now opens “Adds the roadmap LefschetzStructures: … compared with the cohomology of varieties”. Its Layer 2 sentence names the dictionary (2.4) and says “Layer 1's theorems are not restated on `H(X)`”.
- R02 — repaired: README 366 reads “`exists_inverse_L_pow_of_charpoly`: fix `i ≤ n`;” and README 373 reads “(Source: Beilinson 2012, §2.3, proof of (b), which is the case `F = K = ℚ` for Betti cohomology …”. Its last clause is R01 of this report.
- R03 — repaired: README 350–351 reads “in a ring with grading idempotents and no module, both are hypotheses.”

## Verified sound

This is an incremental re-review of the 10 lines changed since `8bf2164`. Only the README changed: `Suggested.lean` is byte-identical, and nothing outside the folder differs from `origin/main`. The files outside the folder that changed since `8bf2164` come from the merge of main (`e68dbc89`).

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.3 source line: “the case `F = K = ℚ` … the characteristic-polynomial hypothesis holds automatically” | Beilinson2012 lines 178, 201, 212 | Complex projective `X`, all (co)homology with `ℚ` coefficients, so `K = F = ℚ`; the charpoly of every `ℚ`-endomorphism lies in `ℚ[T]` | sound | none |
| 1.3 source line: “the cut by projectors is that of `lambdaAlgebraic_of_charpoly`” | surface, `n = 2`, `i = 1` | Beilinson: `(1 − p_{−2}) c′ (1 − p_2)`, projectors onto `H⁰` and `H⁴` from the induction. 1.3: `π_1 w π_3`, with `ProjectorsAlgebraic` assumed | false as stated | R01 |
| 1.3 `exists_inverse_L_pow_of_charpoly` (its opening changed) | `ℚ[ξ]/(ξ³)`, `n = 2`, `i = 0`, `𝒜 = End_ℚ H`, `u = 2Λ² + π_2` | `u ξ² = 2`. On `H⁰`, `g = uL²` acts as `2`, with charpoly `T − 2`. `w = ½u`: `w ξ² = 1`, `L² w ξ² = ξ²`, `w ξ = ½ξ ≠ 0` | sound; `w` is not homogeneous, as the text says | none |
| 1.3 `lambdaAlgebraic_of_charpoly`, its cut | the same `w` | `π_0 w π_4` is `Λ²` on `H⁴` and `0` elsewhere, so it is `LowersDegreeBy 4` and a `w_0` for 1.2 | sound | none |
| 1.2 first Check (« as in the source » deleted) | `ℚ[ξ]/(ξ³)` with `w_0 = 2Λ²`; the shifts on `ℚ^(ℕ)` | `w_0 L² 1 = 2` and `L² w_0 ξ² = 2ξ²`, so both conditions fail together. Shifts: `wL = 1` but `Lw e₀ = 0`, one-sided only | sound | none |
| Description against this head (R01 of `8bf2164`) | 8 sentences against README 3–16, 42–99, 191–203, 517 and `Suggested.lean` line 3 | Layer 2 is the dictionary of 2.4. “Not restated” matches README 517. Only `import Mathlib`. 12 `sorry` warnings | sound | none |

The rows for the statements this change does not touch stand as in the previous review, of `8bf2164`.

- **Gate.** The worker's gate at `ad5de98` has every check at 0 (`build=0`) and reports OK. Re-run against the default order, every scanner is 0 except `depcheck: NOT IN ORDER: LefschetzStructures (insert it after its last supplier)`. That line is not a finding: the candidate order already lists the roadmap at line 95, right after MotivesAndAlgebraicCycles (line 94).
- **Dependency check** (candidate order, `--movable`): `depcheck: 245 roadmaps, 2234 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with 12 `declaration uses sorry` warnings and nothing else. The file is unchanged, so the earlier `#check @name` comparison and the one-tactic probe still hold.
- **Source locators checked against the text: 3.** README 373 against Beilinson2012 lines 201 and 286–297; README 527 and 538 against lines 178, 201, 212 and 247–252.
- **Cross-roadmap citations resolved: 17,** on main or at the open heads. MotivesAndAlgebraicCycles §§0.1, 0.2, 0.5, 2.2, 2.3, 7.3, 7.4; DeligneWeightsAndPurity §§9.6, 9.7; EtaleDualityAndPerverseSheaves §5.7; ComplexKahlerGeometry K6.1 (§6.3); EtaleCohomologyFoundations §§F.5–F.7; SchemeAndStackFoundations Layer 5; `Completed/HodgeStructures`; LieHighestWeight Layer 0 (see the remark below).
- **Library declarations opened at the Tau Ceti pin:** `TauCeti/Algebra/Lie/Sl2/Spectrum.lean:151` `exists_int_of_hasEigenvalue`; `Classification.lean:119`; `CompleteReducibility.lean:135`; `ClebschGordan.lean:275` `isInternal_cgSummand`.
- **Remark (untouched text).** README 51–53 and 171–173 give `𝔰𝔩₂` weight strings, irreducibles and complete reducibility to LieHighestWeight Layer 0. LieHighestWeight README line 76 on main places them in Tau Ceti `TauCeti/Algebra/Lie/Sl2/` (the files above), while README 159 says nothing is used from Tau Ceti.
- **Remark (correction).** The previous report's remark on README 538 was mistaken. Beilinson2012 lines 178 and 201 put §2 over `ℂ` with `ℚ` coefficients; line 102 belongs to §1.5.

Overlap check: read MotivesAndAlgebraicCycles, DeligneWeightsAndPurity and LefschetzPencilsAndVanishingCycles, the three closest open roadmaps (no roadmap on main or by results is listed). The change touches no shared object. Owners are as before: DeligneWeightsAndPurity §9.7 owns the primitive decomposition and pairings, MotivesAndAlgebraicCycles owns Weil theories, correspondences and the §7.3 predicates, and nothing is shared with LefschetzPencilsAndVanishingCycles.

Source independence: changed passages only. 3 passages (README 350–351, 366, 373–375) compared with 1 source (Beilinson2012 lines 286–297), none shared. The largest share is held jointly by Beilinson2012 and Arapura2006, 3 of 10 locators each. The arrangement was not compared again, since no layer was added, removed or reordered.

## Not verifiable

- Kleiman 1994, Theorem 4.1, pp. 14–15 (the source of 1.2, the section of the changed Check) and §5, pp. 16–19: the sources service found no legal copy. The publisher's landing page is in no licence class and there is no open repository copy.

## Source issues

- none

## For the human reviewers

- none
