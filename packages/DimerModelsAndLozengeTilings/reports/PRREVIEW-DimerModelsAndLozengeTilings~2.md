# Review of DimerModelsAndLozengeTilings (pull request #2422 at 72bfddb)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: README line 2074, "*Needs:* 8.5; Mathlib `intervalIntegral`, `tendsto_integral_exp_inner_smul_cocompact`, `circleIntegral`, `deriv_circleMap`, `circleIntegral.integral_sub_zpow_of_ne`, `circleIntegral.integral_sub_inv_of_mem_ball`, `DiffContOnCl.circleIntegral_eq_zero`"; line 2270, "*Needs:* 4.4, 9.1, 9.3, 9.4, 9.6"; all five are listed under From Mathlib with their lines.
- R02 — repaired: 2.9 now has three API bullets (dart dichotomy, additivity and reversal sum, `H(v) − H(u) ≤ positiveSteps p`) and three new Checks (line 1024 on), separating it from the all-darts and reversed-orientation models.
- R03 — repaired: the manifest records `gibbsmeasure` (certified, Apache 2.0); README line 2451 reads "Y. Dillies, M. Cipollina", with locators lines 34–63 and 163–171.
- R04 — repaired: the description now reads "Dependencies: none. … ClassicalErgodicTheory, which is an open roadmap pull request by another author. No target here uses any of them".

## Verified sound

| Target | Instances tried | Left side (computed) | Right side (computed) | Result |
| --- | --- | --- | --- | --- |
| 9.1 inner integrals | `r = 1.3`; `a = 0.7+0.4i` with `n = 0,1,3,−2`; `a = 2.1−0.5i` with `n = 0,1,−3,2`; `a = 0`, `n = ±1` | quadrature: `0`, `.7692`, `.1502+.2549i`, `0`; `.4506+.1073i`, `0`, `−.0601−.0814i`, `0`; `1`, `0` | stated formula: identical (difference `< 10⁻⁸`) | agree |
| 9.1 route | `circleIntegral f 0 1` for `f = z^{n−1}/(a+rz)` | `∫₀^{2π} i e^{iθ} e^{i(n−1)θ}/(a+re^{iθ}) dθ` | `i ∫ e^{inθ}/(a+re^{iθ}) dθ`, so factor `(2πi)⁻¹`; residue at `0` for `n ≤ 0`, `|a|>r`: `(−r)^{−n}a^{n−1}` | agree |
| 9.1 Angles, row formula | `w = (1,1.6,1.3)`, `d = (m,−1)`, `m = 1,2,3`; `n = −d₂ = 1` | φ first, inner `[|w₃+w₂e^{iθ}|<w₁]/w₁`: `−.19869`, `.15523`, `−.09547` | `(−1)^m sin(θ₁m)/(πm)`: `−.19869`, `.15523`, `−.09547`; arc `cos θ < −cos θ₁` | agree |
| 9.1 Check `G(0,−2)` | `w = (1,1,1)`, θ first, `n = 0` | `[|1+e^{−iφ}|>1]/(1+e^{−iφ})` integrated: `−0.057672` | `√3/(2π) − 1/3 = −0.057669`; region `cos φ > −1/2` | agree |
| 9.7(a) diagonal via 9.1 | `v_i = v_j`, `w(0.3,0.45) = (.8090,.9877,.7071)` | `d = (0,−1)`, `n = 1`: `w₁G_w = θ₁/π`; `cos θ₁ = .5878`, `θ₁ = .9425` | `K_ξ(v;v) = s = 0.3`, `0.3π = .9425` | agree |
| 1.5 `tilingSubgraph` API | `{W(0)}` free tilings `{(0,1)}`, `{(e₁,2)}`, `{(0,3)}`; hexagon `T_a` | each edge lies in a face outside `R`: subgraph edgeless; `M ∩ E°(R) = ∅` | `T_a`: three disjoint edges of the 6-cycle, all in `E°(R₆)`; spanning (`toSubgraph`) | agree |
| 2.8 `IsFlip` API | `A = {(v,3),(v−e₁,1),(v−e₂,2)}`, `B = {(v,1),(v,2),(v−e₃,3)}`; `M = A ∪ {(v,1)}` | `A`, `B` each meet all six faces once; `A ⊆ M`, `M ∩ B = ∅` gives `M' ∖ B ∪ A = M` | `M = A ∪ {(v,1)}`: `M' = B`, reverse gives `A ≠ M`: hypothesis needed | agree |
| 2.8 heights | flip at `v`, increments `c₀ + (1−2c₀)1_M` | before: `H(v+e_k) = H(v) = H(v−e_k)+1` | after: `H'(v) = H(v)−1`, all six increments match `M'`; `V(R)∖{v}` connected via the hexagon | agree |
| 2.9 `positiveSteps` | `0→e₁→e₃→0`; `0→e₃`; hexagon `(−1,0)→0→(1,0)` | `2`, reverse `1`, sum `3`; `1`; `2` | all-darts `3,3`; Gorin orientation `0` vs `H_{M₁}` rise `1`; reversed `0` vs `h(1,0)−h(−1,0) = 0−(−1) = 1` | agree; models excluded |
| 6.3 `rowCode` API | `e₁ +ᵥ ω`; `M ∈ Φ₂`; `M₁, M₂, M₃`; `ε = 1_{[0,∞)}` | `ω⟨(x−1,0),0⟩ = σ(rowCode ω)(x)`; `W(x,y)`, `B(x,y)` force `[((x,y),1)] = [((x,y+1),1)]` | `M₁ ↦ true`, `M₂, M₃ ↦ false`; `σε = 1_{[1,∞)}`, opposite shift `1_{[−1,∞)}` | agree |
| 8.1 `torusPartitionFunction` API | `n₁ = n₂ = 1`; `1 × 2`; `2 × 2`; `n₁ = 0` | `w₁+w₂+w₃` (3 tilings); `w ≡ 1`: `5`, `9` | 8.3 Checks `5`, `9`; `n₁ = 0` admits infinitely many tilings, so `n₁, n₂ ≥ 1` is needed | agree |
| 4.5 gibbsmeasure locators | gibbsmeasure lines 34–63, 163–171 | `IsConsistent` 34–39, `Specification` 54–63 | `IsGibbsMeasure` 166, `isGibbsMeasure_iff_forall_bind_eq` 169–171 | agree |

The rows of the previous review for untouched statements stand as in the previous review, of `8ce8e79`; `Suggested.lean` is unchanged since then.

- Source locators checked against the text: 4 (gibbsmeasure lines 34–63 and 163–171; kenyon2009 lines 976–1007 and gorin2021 lines 2256–2279 for the 9.1 angles and row formula).
- Library declarations opened at the Mathlib pin `1b1ccf4`: 5, all at the cited lines: `deriv_circleMap` (`CircleIntegral.lean`:130), `circleIntegral` (:435), `circleIntegral.integral_sub_zpow_of_ne` (:615), `circleIntegral.integral_sub_inv_of_mem_ball` (:748), `DiffContOnCl.circleIntegral_eq_zero` (`CauchyIntegral.lean`:479).
- Cross-roadmap citations resolved: ClassicalErgodicTheory §0.3, §1.4, §5.1, §8.4 at its open head `e3c5108`; `roadmaps resolve` finds nothing unresolved. The `Specification.IsGibbs` lead is this roadmap's own declaration.
- Pull request text: title and description checked against this head. The repairs add only API, Checks and inputs, so there is no change for the description to state. ContourIntegration is under `Completed/` on main.
- Gate re-run at this head: every check 0, OK. Dependency check: `depcheck: 240 roadmaps, 2252 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `lake env lean` of `Suggested.lean` gives 18 `sorry` warnings and nothing else. Since the file is unchanged, the previous `#check @` comparison and one-tactic probe stand.
- Overlap check: read ClassicalErgodicTheory and PointProcesses (open), Exchangeability, ProbabilisticAndMetricNumberTheory and MathematicalBilliards (main). The changed passages add no shared object: circle integrals are Mathlib's, and the inner-integral evaluation and `rowCode` are this roadmap's own.
- Source independence: 9 passages compared with 3 sources (changed passages only: 2.8, 2.9, 6.3, 8.1, 9.1 ×2, 9.7, 4.5, References), none shared beyond formulas and declaration names. Largest share is gorin2021, as in the previous review. No layer was added, removed or reordered, so the contents were not compared again.

## Not verifiable

- None in the changed passages. thurston1990 and georgii2011 remain uncertified, as recorded in the previous review.

## Source issues

- none

## For the human reviewers

- **Licence.** `Specification` (`Suggested.lean` lines 299–310) follows the shape of `Specification` and `IsConsistent` in github.com/YaelDillies/gibbs-measure, `GibbsMeasure/Specification.lean` at commit fffe01e3 (lines 34–63; header Apache 2.0, Y. Dillies, M. Cipollina). README 4.5 and the references acknowledge it.
