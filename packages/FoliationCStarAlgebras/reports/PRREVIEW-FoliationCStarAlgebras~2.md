# Review of FoliationCStarAlgebras (pull request #3079 at c231df0)

**Verdict:** accepted

**Summary.** Accepted: both findings of the previous review are repaired, and the repairs are correct. The Check "Completeness is needed" of 3.2 now uses an example whose orbit spaces (an interval and a circle) are not homeomorphic, and the Hausdorff equivalence of 3.2 is stated for complete `T` with a counterexample Check for incomplete `T`. The four small corrections and the format note of the previous review are also repaired. One small correction remains, on the pull request's description, which still counts 11 `sorry`s where the file has 5; it does not block. Three points are left to the human reviewers, as before.

## C01 — The description's build line counts 11 `sorry`s; the file now has 5 and proves six statements

Under "Checks" the description says the build "succeeds; the only warnings are the 11 `sorry`s". At this head `Suggested.lean` proves `isQuasiAnalyticAt_of_analyticOnNhd` and the five flat-shift statements, and elaborates with 5 `sorry` warnings (`exists_isSliding`, `germ_eq_of_isSliding`, `germ_eq_of_homotopy`, `exists_structureGroupoid_holonomyMembers`, `isSliding_slope`). A reader of the description expects eleven open targets. Text that would be right: "succeeds; the only warnings are the 5 `sorry`s of the four Fo1 headlines and of the sanity check `isSliding_slope`; the quasi-analyticity theorem and the flat-shift sanity checks are proved in the file."

## Previous findings

- R01 — repaired: "the orbit space of `Hol_T^T` is the interval `(0, 1/2)` while that of `Hol` is the circle `ℝ/ℤ` … In the second item it is the anchor that fails: `t(G_T) = ℝ × (0, 1/2)` is not `M`."
- R02 — repaired: "`Hol_T^T` is Hausdorff when `Hol(M,F)` is, and for complete `T` the converse holds (both are then quasi-analyticity of `Γ_T`, Fo2.3)", with the new Check "Completeness in the Hausdorff criterion".
- C01 — repaired: "`f*(γ) = conj(f(γ⁻¹))`, as in Connes (1982, p. 17; 1994, p. 124) and Kordyukov (p. 26). Witness that the conjugate is needed: …".
- C02 — repaired: "the full algebras satisfy the same (Hilsum–Skandalis, Remarque 5, p. 206): the decomposition and Kasparov stabilization above run for the full norms, with OperatorAlgebraDynamics D6's equivalence module"; D6 added to the *Needs* line and to the scope paragraph.
- C03 — repaired: the module docstring and two section comments mark the flat-shift block and `isSliding_slope` as sanity checks, not targets; the flat-shift statements and the quasi-analyticity theorem are now proved.
- C04 — repaired: "`e_N` is the field over `y ∈ S¹` of the rank-one projections onto `ξ(·, y)`, Murray–von Neumann equivalent to `1 ⊗ e` for a rank-one projection `e`".
- N01 — repaired: `isSliding_slope (θ : ℝ) (v₀ : ℝ)` passes `(by simp)` for `1 ≤ ∞`; the elaborated type quantifies over `θ` and `v₀` only.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 3.2 Check "Completeness is needed" | lines `ℝ × {y}` of `ℝ × ℝ/ℤ`, `T = {0} × (0, 1/2)` | each leaf meets `T` at most once, trivial holonomy: `Hol_T^T` unit groupoid, orbits `(0,1/2)`; leaf space `ℝ/ℤ`, compact; saturation `ℝ × (0,1/2) ≠ M` | true; interval and circle not homeomorphic | none |
| 3.2 third bullet, Hausdorffness | arbitrary `T`; complete `T`; flat shift with `T = (−2,−1)` | `Hol_T^T ⊆ Hol` is a subspace, so Hausdorff passes down; `h = id` on `u < 0`: leaves circles, germ identity, `Hol_T^T` = units of `T`; `Hol` non-Hausdorff by 6.4 | forward implication for all `T`; converse fails without completeness, as the new Check says | none |
| Conventions, involution | one-arrow groupoid, `f = i` | without conjugate `f* * f = i·i = −1`; with it `(−i)·i = 1` | agrees | none |
| 5.2 full algebras | Remarque 5 read at its page; `p = 0` | source: result and method hold for the maximal algebra of `G` with a Haar system, printed p. 206; `p = 0` excluded by the standing `p ≥ 1` of 5.2 | supported as stated, Hausdorff case | none |
| 5.3 Check "Circle fibres" | `ξ ≥ 0` with `∫|ξ(·,y)|² = 1` | `y ↦ ξ(·, y)` is a nowhere-zero continuous section, so the line field is trivial and `e_N ∼ 1 ⊗ e`; corner `C(S¹)` | true | none |
| `isSliding_slope` | `t = 0`, `t = 1`, `v = v₀` | `Γ(v,0) = (0,v) = ι₀ v`; `Γ(v,1) = (1, v+θ) = ι₁(v+θ)`; `Γ(v₀,t) = (t, v₀+θt)` | agrees with the Check of 1.2; elaborated type has binders `θ v₀` only | none |
| `isQuasiAnalyticAt_of_analyticOnNhd` and the five flat-shift statements | elaborated at the pins | proofs compile; no `sorry` warning at their lines | proved | none |

The rows of the previous review, of `d70f7f8`, stand for the untouched statements.

- Source locators checked against the text: 1 (Hilsum–Skandalis, Remarque 5, printed p. 206, HilsumSkandalis1983 lines 178–188; Corollaire 6 on the same page, lines 189–195).
- Cross-roadmap citations resolved on main: OperatorAlgebraDynamics D6 (README line 2325), LieGroupoidsPoisson §G3.5 orbit-space invariance (README line 963), HilbertModules Layer 4 stabilization (README line 626).
- Elaboration of `TauCetiRoadmap/FoliationCStarAlgebras/Suggested.lean`: 5 `sorry` warnings (lines 101, 111, 119, 138, 219), nothing else; no `set_option`; the worker's automatic checks all passed.
- Dependency check: `depcheck: 125 roadmaps, 1417 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- `#check`-level signature of the one restated declaration (`isSliding_slope`) compared with the README Check of 1.2: agrees.
- No file outside the folder changed; no layer added, removed or reordered.
- Overlap check: read LieGroupoidsPoisson, Orbifolds, OperatorAlgebraDynamics, HyperbolicDynamicsAndThermodynamicFormalism; nothing shared (unchanged from the previous review; the change adds no object).

Source independence: changed passages only: 2 passages (the full-algebra sentence of 5.2, the involution convention) compared with 1 source reopened (Hilsum–Skandalis), none shared; largest share Kordyukov, 25 of 102 locators, as in the previous review; arrangement not compared again (no layer added, removed or reordered).

Research link: The headline targets are Connes's construction of `C*_r(V,F)` (1982; 1994, II.8) and the Hilsum–Skandalis stability theorem (1983), which Hilsum–Skandalis place beside the Connes–Skandalis longitudinal index theorem; Crainic–Moerdijk (2001) use the foliation-groupoid characterization for cyclic homology. Rests on the sources read.

## Not verifiable

- Connes 1982 p. 17, Connes 1994 p. 124 and Kordyukov p. 26 were not reopened for the reworded involution sentence; it now says what the previous review read on those pages.
- Muhly–Williams and Sims–Williams were not reopened: the README consumes them through OperatorAlgebraDynamics D5–D6.

## Source issues

- none

## For the human reviewers

- Fo7 consumes TracesOnCStarAlgebras Tr1.1–Tr1.2, a roadmap still in an open pull request by the same author; the description names it. This pull request merges after it.
- The definition of compatible charts in 2.2 (`TauCetiRoadmap/FoliationCStarAlgebras/README.md`, Fo2.2) tracks Kordyukov p. 23 clause by clause; the previous review judged it determined by the formulas. Whether that is acceptable is yours to decide.
- The description states that the README and `Suggested.lean` were drafted by an AI model and asks for review by someone working on foliations or groupoid C*-algebras.
