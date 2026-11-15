# Review of HyperellipticCurves (pull request #1707 at b238f61)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `b238f61`. The folder is settled; this round reads the pull request's title and description against the head. Both findings are in the description and are repaired by editing it; no file of the roadmap needs to change.

## R01 (P3) — the description reverses the direction of supply with the heights and effective Diophantine roadmaps

**Location:** pull request description, summary block, "Why Tau Ceti wants it": "They supply torsion and local arithmetic for the heights and effective Diophantine roadmaps".

**Claim:** The head consumes both roadmaps and supplies neither; a reader of this sentence expects them to be consumers, which with the description's own "Depends on" list (#1017, #1046) would be a cycle.

**Witness:** `TauCetiRoadmap/HyperellipticCurves/README.md` lines 496–508 list both under "From named Tau Ceti roadmaps"; "Downstream consumers" (lines 2300–2306) names six other roadmaps; neither open head mentions `HyperellipticCurves`.

**Repair:** Replace the sentence by: "They take the descent, Selmer and local-solubility notions from the heights and effective Diophantine roadmaps and evaluate them on hyperelliptic equations; the canonical-models, group-actions, curves-over-finite-fields and abelian-varieties-over-finite-fields roadmaps consume the equation dictionary, the involution criterion and the genus-two Euler factors."

## R02 (P3) — "local solvability of the Jacobian"

**Location:** pull request description, first paragraph after the summary block: "and the 2-torsion, Euler factors and local solvability of the Jacobian".

**Claim:** The head states local solvability for the curve, not for its Jacobian; for the Jacobian the notion is empty, since the identity is a point over every completion.

**Witness:** README §5.5 "Local solvability of hyperelliptic models", line 2183: `isLocallySolvable W := ∀ v, C(ℚ_v) ≠ ∅`. For `y² = −x⁶ − 1`: `C(ℝ) = ∅` while `0 ∈ J(ℝ)`.

**Repair:** Replace by: "and the 2-torsion and Euler factors of the Jacobian and the local solvability of the curve".

## Previous findings

- none: the review of `b238f61` was an acceptance with no finding.

## Verified sound

| Statement | Instances and computed values | Result |
| --- | --- | --- |
| 5.5 local solvability (R02) | `y² = −x⁶ − 1`: `4f + h² = −4x⁶ − 4 < 0` on ℝ, leading coefficient `−4`, no real root, `Y² = −1` at infinity, so `C(ℝ) = ∅`; `J(ℝ) ∋ 0`. | The predicate is the curve's; R02. |
| 5.5 bound `p > 4g²` | `p + 1 − 2g√p > 1 ⇔ √p > 2g`. `g = 2`: `p = 17` gives `18 − 16.49 = 1.51 > 1`; `p = 13` gives `14 − 14.42 < 0`. | Threshold as stated in the README. |
| Direction of supply (R01) | `ORDER.txt`: heights 148, effective Diophantine methods 185, this roadmap 372. Search of all open heads and main for `HyperellipticCurves`: 0 hits in either supplier; FunctionFieldArithmetic line 3618 lists it as a consumer of its §§5.1, 5.3, 5.6. | Both are suppliers only; R01. |
| Description: "6 layers and 45 milestones" | Layers 0–5; numbered sections 6 + 5 + 7 + 7 + 13 + 7 = 45. | Correct. |
| Description: "Depends on" (generated block) | README's suppliers not on main: 8 (ArithmeticGaloisRepresentations, AutomorphicLFunctionsAndLocalFactors, EffectiveDiophantineMethods, FunctionFieldArithmetic, heights, Néron models, periods, relative Jacobians) = the 8 listed; AlgebraicCurves, EllipticCurves, StableReduction, JacobianChallenge, SchemeAndStackFoundations and the two completed roadmaps are on main. | Agrees. |

The rows for every statement of the roadmap stand as in the previous review, of `b238f61`.

- Description against the head, sentence by sentence: the title (adds a roadmap; the folder is not on main at `8c39af0`), the three paragraphs of the summary block, the prose paragraph and the three file bullets. Besides R01 and R02 each is supported: Weierstrass models over commutative rings (lines 32–33), Igusa and Mestre (Layer 2), local and global minimal models and Liu (Layer 3), cluster pictures in odd residue characteristic (Layer 4), 2-torsion, descent, Euler factors, real period and the BSD quotient as an implication (Layer 5), the LMFDB table (lines 148–180), `metadata.toml` `topic = "math.NT"`, 35 declarations in `Suggested.lean`.
- No section, headline or declaration is removed (0 headings and 0 declarations removed against the base), so the description has no removal to state.
- Gate at `b238f61`, my run: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate also records `build=0`.
- Dependency check: `depcheck: 241 roadmaps, 2247 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/HyperellipticCurves/Suggested.lean`: 16 `declaration uses sorry` warnings (lines 112, 156, 173, 191, 196, 203, 208, 226, 275, 288, 310, 316, 344, 348, 368, 375), nothing else; the same as at the previous review, the file being unchanged.
- Changes outside the folder: `git diff --stat origin/main...HEAD` outside it is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Overlaps: no other open pull request changes this roadmap, no dropped id, no revision-only id, no cross-roadmap citation unresolved; the 18 unresolved Lean names of the resolver are LMFDB knowl ids, this roadmap's `Model.weierstrassForm` and the external declarations of the Provenance section, as at the previous review.
- Overlap check: read the ownership passages of CurvesOverFiniteFields (lines 99, 143), CanonicalModelsAndGonality (line 177), AbelianVarietiesOverFiniteFields (lines 121, 161), EffectiveDiophantineMethods §3.23, NeronModelsAndSemistableAbelianVarieties, EllipticCurves, AlgebraicCurves; each hands hyperelliptic equations and genus-two invariants to this roadmap or is cited by it as owner; nothing has two owners. The third list is empty.
- Source independence: changed passages only; 0 passages changed, so 0 compared; the arrangement was not compared again (no layer added, removed or reordered).
- Remark, no change asked: the description says "over any ring"; the head's carrier is over a commutative ring, as the summary block says.

## Not verifiable

- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts" and the AI-assistance line: statements about the pull request series, not about this folder; not checked.
- The source locators of the seeded sample were not re-read: the folder is unchanged since the review of `b238f61`, which read them or lists the texts it could not read.

## Source issues

- none

## For the human reviewers

- none
