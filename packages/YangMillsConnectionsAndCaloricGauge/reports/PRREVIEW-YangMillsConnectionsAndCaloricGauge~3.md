# Review of YangMillsConnectionsAndCaloricGauge (pull request #2164 at 35d692f)

**Verdict:** needs changes

## R01 (P3) — The declaration that supplies the hypothesis of `range_lieMapSubtypeVal_eq` is not named

**Location.** README lines 349–352 and 518–525: "`TauCeti.Lie.EmbeddedLieSubgroupData.range_lieMapSubtypeVal_eq` (`Differential.lean`: for embedded-subgroup data modelled on the Lie algebra of `K`, as the closed-subgroup theorem supplies, …)".

**Claim.** The only closed-subgroup declaration the contract and §1.1's *Needs:* line name is `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed`. It gives data on some model space `E'`, not on the Lie algebra of `K`, so it does not supply the hypothesis of the cited range theorem.

**Witness.** Tau Ceti `Geometry/Lie/Subgroup/Embedded.lean:111`: `IsEmbeddedLieSubgroup K` is `∃ E' …, Nonempty (EmbeddedLieSubgroupData I K E')`. `Differential.lean:225`: the theorem takes `d : EmbeddedLieSubgroupData I K (lieSubalgebraOfSubgroup K).toSubmodule`. `Embedded.lean:137` supplies that.

**Repair.** In the contract, replace "as the closed-subgroup theorem supplies" with "which `TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed` (`Embedded.lean`) supplies for closed `K`", and add that name to §1.1's *Needs:* line before `range_lieMapSubtypeVal_eq`. Checked: `#check` of both declarations elaborates at the pin and the model spaces agree.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 116–121 state `MemLp (fun x => A x j a b) 2 (volume.restrict K)`, `MemLp (fun x => DA x v j a b) …` and `MemLp (fun x => curvature A DA x j k a b) 2 volume`; README lines 1465–1471 say "every entry".
- R02 — repaired: README lines 336–352 cite the four declarations (with `unitsLieAlgebraEquiv_Ad` for the matrix form of `Ad`), §1.1's bullet is a route from them, lines 518–525 and 1493–1496 list them, and `Suggested.lean` lines 20–24 cite the special-unitary theorem. The repair introduced R01 above.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| `IsFiniteEnergySU2Potential` (entrywise fields) | `A = 0`, `DA = 0`; Frobenius against entries | all five fields close (`simp`, `TauCeti.hasWeakFDerivOn_zero`); `‖M‖_F² = Σ\|M_ab\|²` and `‖DA x‖² ≤ Σ_i‖DA x e_i‖²`, so the class is unchanged | correct | none |
| `exists_int_instantonNumber_eq` | `A = 0`; one-tactic probes | `instantonNumber 0 0 = 0` by `simp`; `simp`, `norm_num [instantonNumber]`, `⟨_, rfl⟩` leave the goal open | correct, not padding | none |
| `exists_potential_instantonNumber_eq` | `n = 0`; one-tactic probes | `n = 0`: `A = 0` is a witness; `simp` and `norm_num [instantonNumber]` leave the goal open | correct, not padding | none |
| §1.1 tangent space `g𝔤 = 𝔤g` | `SU(2)`, `g = diag(i,−i)`, `X = [[0,1],[−1,0]]` | `gXg⁻¹ = [[0,−1],[1,0]] = −X ∈ 𝔰𝔲(2)`; `gX = [[0,i],[i,0]] = (gXg⁻¹)g` | correct | none |
| §1.1 `Ad(g)𝔤 = 𝔤` from the pinned inclusion | `g ∈ K ⊆ N(K)`; `g` and `g⁻¹` | `LieAlgebra.lean:395` gives `Ad(g)𝔤 ⊆ 𝔤` for `g ∈ N(K)`; applied to `g⁻¹`: `𝔤 ⊆ Ad(g)𝔤` | correct | none |
| Contract: `𝔰𝔲(n)` and `Matrix.specialUnitaryGroup` | `SpecialUnitary.lean:98`; `i·1` for `n = 2` | pinned statement `Aᴴ = −A ∧ A.trace = 0`; `i·1` is skew-Hermitian with trace `2i ≠ 0`, excluded; `mem_iff` (line 69) matches carriers | correct | none |
| Contract: range of the differential of the inclusion | `Differential.lean:225–230`; `Embedded.lean:111, 137, 157` | theorem needs data on `(lieSubalgebraOfSubgroup K).toSubmodule`; line 157 gives `∃ E'`; line 137 gives the needed model | citation gap | R01 |

The rows for the untouched statements stand as in the previous review, of `4db2911`.

- **Library declarations opened at the pin (Tau Ceti):** `Geometry/Lie/Subgroup/LieAlgebra.lean:359, 395`; `Unitary.lean:136`; `SpecialUnitary.lean:98`; `Differential.lean:230`; `Embedded.lean:111, 137, 157`; `Units.lean:58`; `Geometry/Lie/Adjoint/Units/Basic.lean:160`; `LinearAlgebra/Matrix/GeneralLinearGroup/SpecialUnitary.lean:69`. All nine names added by the diff exist under the stated namespaces and files, and `#check` elaborates each.
- **Elaboration.** `lake env lean` on `Suggested.lean`: exit 0, two `sorry` warnings (lines 139, 152). `#check @` of the five declarations and of the two changed fields matches README §6.4.
- **Gate.** Re-run at `35d692f`: every check 0, `OK`. Dependency check: `depcheck: 236 roadmaps, 2139 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line; merge-order line 14, after SmoothBundlesConnections (13). No file changed outside the folder.
- **Pull request text.** Title and description read against this head: no sentence is contradicted; the change adds no supplier, section or declaration and removes none.
- **Sample and sources.** No sampled target lies in a changed passage, and the diff changes no source locator; none was re-read.
- **Overlaps and citations.** No open pull request changes this roadmap or drops an id it cites; the resolver reports no missing citation or Lean name.

## Not verifiable

- Nothing new. The `uncertified` sources listed in the previous review are untouched by this change.

## Source issues

- none
