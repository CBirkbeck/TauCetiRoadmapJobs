# Review of YangMillsConnectionsAndCaloricGauge (pull request #2164 at 8e1ec25)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README lines 349–354 cite "`TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed` (`Embedded.lean`: a closed subgroup `K` of a finite-dimensional real Lie group carries such data, modelled on its Lie algebra)"; §1.1's *Needs:* line (lines 527–528) names it with `range_lieMapSubtypeVal_eq`.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Contract: closed `K` carries data modelled on its Lie algebra (`Embedded.lean:137`) | hypotheses at the pin; `K = ⊤`, `K = {1}`, dense irrational line in `T²` | pin: `FiniteDimensional ℝ E`, `LieGroup I ∞ G`, `IsClosed K`, matching the README; `⊤`: model is the full Lie algebra; `{1}`: model `0`; dense line excluded by `IsClosed` | correct | none |
| Contract: the two cited declarations compose (`Differential.lean:225–230`) | scratch: `obtain ⟨d⟩ := nonempty_… hK`, then `d.range_lieMapSubtypeVal_eq` | model types agree (`(lieSubalgebraOfSubgroup K).toSubmodule` on both sides); `T2Space` let-binding vs instance argument agree (Prop); exit 0 | correct | none |
| §1.1 tangent space `g𝔤 = 𝔤g`, route via the range | `G = SU(2)` | model dimension `dim 𝔰𝔲(2) = 4 − 1 = 3` (skew-Hermitian `2 × 2`, trace condition) `= dim S³`; range of the differential at `1` is `𝔰𝔲(2)` | correct | none |

The rows for the untouched statements stand as in the previous review, of `35d692f`.

- **Library declarations opened at the pin (Tau Ceti):** `Geometry/Lie/Subgroup/Embedded.lean:111, 137, 157`; `Geometry/Lie/Subgroup/Differential.lean:83–88, 219–230`. Composition test (both declarations, closed `K` in a finite-dimensional real Lie group) elaborates at the pin with no error.
- **Elaboration.** `lake env lean` on `Suggested.lean`: exit 0, two `sorry` warnings (lines 139, 152). `Suggested.lean` is unchanged since `35d692f`.
- **Gate.** Re-run at `8e1ec25`: every check 0, `OK`. Dependency check: `depcheck: 236 roadmaps, 2139 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. No file changed outside the folder.
- **Pull request text.** Title and description read against this head: the change adds a citation of a Tau Ceti declaration within the already-stated "closed-subgroup theorem" input; no sentence is contradicted, and no supplier, section, headline or declaration is added or removed.
- **Citations.** The resolver reports no missing cross-roadmap citation or Lean name; the new Tau Ceti name was checked at the pin by hand (above).
- **Sample and sources.** No sampled target lies in the changed passages, and the diff changes no source locator; none was re-read.

## Not verifiable

- Nothing new. The `uncertified` sources are untouched by this change.

## Source issues

- none
