# Review of SpinGeometry (pull request #1674 at c708ec0)

**Verdict:** accepted

This is an incremental AI re-review of `TauCetiRoadmap/SpinGeometry/` at c708ec0: the 89 lines of `README.md` changed since 63ffb1c, and what cites or depends on them. The AI does not approve or merge; the folder is ready for a human's final approval.

- All three findings of the previous review are repaired, and the repairs introduce no new problem.
- The gate passes, the dependency check reports 0 problems, and `Suggested.lean` (unchanged) elaborates with `sorry` as its only warning.
- No finding remains.

## Previous findings (PRREVIEW-SpinGeometry~26)

- R01 — repaired: `README.md:330–339` "The Levi-Civita connection, its smoothness, the curvature operator and tensor, the first Bianchi identity, the curvature symmetries and the scalar curvature are the pinned declarations under From Mathlib and From Tau Ceti above."
  - "From Mathlib" (`:148–158`) names `CovariantDerivative.IsMetricCompatible`, `leviCivitaConnection`, `isLeviCivitaConnection_leviCivitaConnection` and `IsLeviCivitaConnection.uniqueness`.
  - "From Tau Ceti" (`:286–310`) names the smoothness instance, `curvatureOperator`, `curvatureTensor`, the skew-adjointness, the first Bianchi identity, pair interchange, `riemannCurvatureTensor` and both scalar curvatures.
  - Conventions (`:104–106`) names `CovariantDerivative.curvatureOperator` as R(X,Y).
  - The *Needs:* lines of G3.3 (`:953`), G3.4 (`:978`), G5.1 (`:1410`), G6.2 (`:1747`) and G6.3 (`:1774`) and Layer 3's Dependencies (`:993–995`) point at the pins.
  - HopfRinow is no longer cited anywhere. RiemannianGeometry is kept only for R1 item 4 (orthonormal geodesic frames, G6.2) and R7 (the real Weitzenböck comparison, G6.4). R5 is dropped; no target's *Needs:* used it.
- R02 — repaired: `:841–845` "(Nicolaescu, Definition 2.2.42, p. 58, for the s-tensor product and its grading, and p. 633 for the graded modules over one space as S⊗̂W; Lawson–Michelsohn, Chapter I, §1, and Atiyah–Bott–Shapiro, §1, …)".
  - G5.2 (`:1431–1435`) cites Lawson–Michelsohn I §§1, 5 and Atiyah–Bott–Shapiro §1, and attributes the K-class identity to the ring law of TopologicalKTheory T2.
  - The References entry for Atiyah–Bott–Shapiro now lists §1.
- R03 — repaired: `:522` "equal to its squared H-norm; the squared norm of the antisymmetrized tensor w₁⊗w₂−w₂⊗w₁ is 2 and that of its half is 1/2".

The previous review's report marks nothing "not actionable", so nothing is re-raised.

## Verified sound

**Head, scope and gate.**
- `git rev-parse HEAD` = c708ec06; the worktree is clean.
- `git diff --stat 63ffb1c HEAD` shows `TauCetiRoadmap/SpinGeometry/README.md` only (72 insertions, 17 deletions). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty.
- The pins are unchanged: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`.
- My gate run: `gate SpinGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 … imports=0 … statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run adds `build=0`.

**Dependency check** (the required command):

```text
depcheck: 233 roadmaps, 2263 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The change removes one supplier (HopfRinow) and adds none.

**Build, signatures, padding.**
- `lake env lean TauCetiRoadmap/SpinGeometry/Suggested.lean`: the only output is `116:8: warning: declaration uses 'sorry'`.
- `Suggested.lean` is byte-identical to the file the previous review read. Its two elaborated signatures (`SpinStructure` and `nonempty_spinStructure_iff_exists_eulerClass_eq_two_smul`) are the ones that review compared with the README, and its `simp` probe (no progress) carries forward. No Lean statement is touched by the change.

**Library declarations opened at the pins for the changed passages (14).** Each exists where the README says, with the hypotheses and formula the README gives.

- Mathlib, `Geometry/Manifold/VectorBundle/CovariantDerivative/`:
  - `IsMetricCompatible` (`Metric.lean:156`), with the docstring formula `X⟨σ,τ⟩=⟨∇_Xσ,τ⟩+⟨σ,∇_Xτ⟩`. It needs a finite-dimensional fibre model and a C¹ bundle.
  - `leviCivitaConnection` (`LeviCivita.lean:360`), under `IsManifold I 2 M`, `IsContMDiffRiemannianBundle I 1` and a finite-dimensional model: the README's "C¹ metric on a C² manifold with finite-dimensional model".
  - `isLeviCivitaConnection_leviCivitaConnection` (`:409`): metric-compatible and torsion-free.
  - `IsLeviCivitaConnection.uniqueness` (`:256`), for `Y` differentiable at the point: the README's "unique on differentiable vector fields".
- Tau Ceti, same folder:
  - `instContMDiffCovariantDerivativeLeviCivitaConnection` (`LeviCivita/Regularity.lean:357`), for `IsManifold I ∞ M` and a C^∞ metric.
  - `curvatureOperator` (`Curvature/Basic.lean:89`): `∇_X∇_Yσ−∇_Y∇_Xσ−∇_[X,Y]σ`, over any nontrivially normed field and any fibre bundle with a covariant derivative, with no regularity hypothesis.
  - `curvatureTensor` (`Curvature/Tensor.lean:152`), under `T2Space M`, `IsManifold I ∞ M` and finite-dimensional E and F.
  - `IsMetricCompatible.inner_curvatureTensor_eq_neg` (`Curvature/Metric.lean:111`): `⟨R(u,v)w,z⟩=−⟨w,R(u,v)z⟩`.
  - `curvatureTensor_cyclic_eq_zero` (`Curvature/Bianchi.lean:83`), for zero torsion.
  - `IsMetricCompatible.inner_curvatureTensor_swap_pairs` (`:102`), for a metric-compatible torsion-free connection.
  - `riemannCurvatureTensor` (`Curvature/Riemann.lean:66`): `Rm(u,v,w,z)=⟨R(u,v)w,z⟩`.
  - `scalarCurvature_eq_sum_riemannCurvatureTensor` (`:93`): `Σ_j Σ_k Rm(b_k,b_j,b_j,b_k)`.
  - `CovariantDerivative.scalarCurvature` (`Curvature/Scalar.lean:64`, the metric trace of Ricci) and `Bundle.ContMDiffRiemannianMetric.scalarCurvature` (`:212`, that of the Levi-Civita connection of g).
- The README's remark on normal coordinates is true at the pin: `Geometry/Manifold/Riemannian/Geodesic/Normal/Coordinates.lean:199` and `:266` prove that the normal coordinate fields have vanishing covariant derivative at the centre. A search of `TauCeti/Geometry` finds no orthonormal geodesic (radially parallel) frame, so the citation of RiemannianGeometry R1 for it is not a duplicate of the pin.

**Cross-roadmap citations resolved on main 71c8f21.**
- RiemannianGeometry R1 (line 186), item 4 (line 216): "Build smooth orthonormal geodesic frames at a point". R7 (line 1323), item 4 (lines 1363–1377): the real-bundle Weitzenböck comparison, which itself consumes SpinGeometry G1.2, G2.2 and G3.4 but not G6.4, so there is no cycle at target level (the depcheck agrees).
- SmoothBundlesConnections B2.1 (line 559; exterior-power bundles at line 563) and B3.3 (line 936; exterior connections at lines 941, 949), as G3.4's new *Needs:* says.
- TopologicalKTheory T2 (line 757): "K-rings, universal properties and exterior operations", as G5.2's locator says.

**Sources for the changed locators.**
- Nicolaescu, Definition 2.2.42: line 2826, PDF page 70 = printed p. 58. It defines the s-tensor product with `(E⊗̂F)_ε=⊕_(i+j≡ε) E_i⊗F_j`.
- Nicolaescu p. 633 (lines 29492–29499): the graded modules over one space are S⊗̂W. The README now cites the page for exactly that.
- The seeded sample falls in the changed passages only at G2.3, G5.2, G6.2 and G6.3 (locators and *Needs:* lines); the other sampled targets are untouched and carry forward from the previous review's source table.

**Overlaps (all 7 items checked).**
- #1780 conflicts in both files. The description's merge-order block states the order: "#1780 → this pull request".
- ComplexKahlerGeometry `#k5-…` (now `README.md:385`) is dropped by #1234, #1807, #1808 and #1854. Each maps it to Layer 5 at its head, as recorded in the previous review. The citing line is not changed by this round.
- The dropped ids `#g1-…` and `#g4-…` are covered by the former-heading table (`README.md:403–410`).
- The change adds no object that another roadmap owns: it replaces roadmap citations by library citations. Ownership of bundle-level Spin structures and of the rank-two criterion is as the previous review found.

**Adversarial table.** Rows marked "r26" carry forward from PRREVIEW-SpinGeometry~26 for statements the diff leaves untouched. The other rows are recomputed for the changed passages.

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| Conventions: R(X,Y) is `curvatureOperator` (changed) | unit S² with orthonormal e₁,e₂; flat ℝⁿ with coordinate fields | README: R(X,Y)=[∇_X,∇_Y]−∇_[X,Y]. Pin: ∇_X∇_Yσ−∇_Y∇_Xσ−∇_[X,Y]σ; the two expressions are identical. S²: R(e₁,e₂)e₂=e₁, so K=⟨R(e₁,e₂)e₂,e₁⟩=1>0, "positive round-sphere curvature". Flat: 0−0−0=0 | holds |
| Scalar contraction cited by G6.3 (changed) | unit S², b=(e₁,e₂) | Σ_(j,k)Rm(b_k,b_j,b_j,b_k): (j,k)=(1,2) gives ⟨R(e₂,e₁)e₁,e₂⟩=1; (2,1) gives ⟨R(e₁,e₂)e₂,e₁⟩=1; the diagonal terms are 0. Scal=2 and Scal/4=½, which is G6.3's Check | holds |
| Skew-adjointness cited by G6.3 (changed) | unit S², u=e₁, v=e₂ | ⟨R(e₁,e₂)e₂,e₁⟩=1 and −⟨e₂,R(e₁,e₂)e₁⟩=−⟨e₂,−e₂⟩=1 | holds |
| First Bianchi identity cited by G6.3 (changed) | unit S², (u,v,w)=(e₁,e₂,e₁) | R(e₁,e₂)e₁+R(e₂,e₁)e₁+R(e₁,e₁)e₂=−e₂+e₂+0=0 | holds |
| Pair interchange (changed) | unit S², (u,v,w,z)=(e₁,e₂,e₂,e₁) | ⟨R(e₁,e₂)e₂,e₁⟩=1 and ⟨R(e₂,e₁)e₁,e₂⟩=1 | holds |
| Levi-Civita contract (changed) | ℝ with g=dx²; a C¹ but not C² metric | ℝ: ∇_∂∂=0, torsion 0, ∂⟨∂,∂⟩=0=2⟨∇_∂∂,∂⟩. The pin asks only a C¹ metric on a C² manifold, as the README says; smoothness of the connection is claimed only for C^∞ data | holds |
| G6.2 normal-frame input (changed *Needs:*) | plane curvature B; polar frame on ℝ²∖0 versus a geodesic frame | Σ_(i,j)c_ic_jR(e_i,e_j)=2c₁c₂B, so the i<j sum has coefficient 1. The polar frame has ∇_(e_θ)e_θ=−e_r/r≠0, so the first-order terms survive without ∇E_i(p)=0; a radially parallel frame kills them | holds; R1 item 4 is the right input |
| G2.3 locator (changed) | two Fock planes under Def. 2.2.42 | even part: E₀⊗F₀⊕E₁⊗F₁ of dimension 1+1=2; odd part: 1+1=2. This is G2.3's first Check | holds |
| G5.2 locator (changed) | two planes; ranks (1,1) and (1,1) | S⁺(V⊕W)=S⁺⊗S⁺⊕S⁻⊗S⁻ has rank 2 and S⁻(V⊕W) rank 2; virtual rank 0=(1−1)(1−1), the ring law applied to the graded isomorphism | holds |
| G1.2 fourth Check (changed) | h_ℂ-orthonormal w₁,w₂ | det[[1,0],[0,1]]=1; ‖w₁⊗w₂−w₂⊗w₁‖²=1+1=2; ‖½(…)‖²=2/4=½. The values 1, 2, ½ are pairwise distinct | holds; the wording is now "squared" |
| Rank-two criterion (headline, G4.4a) | r26: ∅, pt, S² with TS² and Hopf, ℝP², ℂP^∞, T², non-orientable | r26: e=2=2·1 with w₂=0; e=1∉2ℤ with w₂=1; ℝP²: β(a)≠0 with 2H²=0, both sides fail | r26; untouched |
| `SpinStructure` (G4.2) | r26: trivial model; constant frame map; Fr⁺ through ρ; wrong n | r26: the constant map needs b₀=b₀ρ(h), false for a quarter turn; −1 acting trivially contradicts freeness | r26; untouched |
| G4.2 metric change, G4.4 twist, G4.4a orientations and skeletal data | r26 | r26: B=4Id gives g′(e/2,e/2)=1; ε twist gives 2=\|H¹(S¹;ℤ/2)\|; Möbius has no section; π₁SO(3)=ℤ/2 | r26; untouched |
| G1.3, G3.1, G4.1, G4.3, G5.3, G6.1, G6.7 (sampled) | r26 | r26: a*a=6 for a=1+e₁+2e₂; μc(e₁)μ⁻¹=[[0,−e^(−2it)],[e^(2it),0]]; kernel {±1}; e=1 gives w₂=1; S± at π/2: −i, i; De^(ikx)=−ke^(ikx); kernels 2, 2 | r26; untouched |
| G3.3 curvature compatibility (statement untouched; *Needs:* changed) | r26: B=diag(i,−i) | r26: [B,c(e₁)]=[[0,−2i],[−2i,0]]≠0. New: the pinned `curvatureOperator` takes any fibre bundle with a covariant derivative, so R^E of a complex bundle over a real base is its curvature as a real bundle | holds |
| G3.4, G6.4 (statement untouched; *Needs:* changed) | r26: ℝ, f=x², h=0 | r26: D(f,h)=(−h′,f′), D²(x²,0)=(−2,0), d*(h dx)=−h′ | r26; the *Needs:* names declarations that exist |
| G6.3 Lichnerowicz (statement untouched; *Needs:* changed) | r26: unit S² | r26: c₁c₂·(−½c₁c₂)=½=Scal/4, with Scal=2 from the pinned contraction above | holds |

**Remarks on untouched or sound text (no change requested).**
- G3.4's *Needs:* reads "Mathlib's `CovariantDerivative.leviCivitaConnection` and its smoothness `…instContMDiffCovariantDerivativeLeviCivitaConnection`"; the instance is Tau Ceti's, as "From Tau Ceti" and Layer 3's Dependencies say. The sentence does not claim otherwise.
- G3.1 (`:886`) still applies the Clifford bundle "to pullback/normal bundles". Its *Needs:* never named RiemannianGeometry R5, so dropping R5 from the supplier contract makes nothing wrong.

## Not verifiable

- Lawson–Michelsohn (Chapter I, §§1 and 5) and Atiyah–Bott–Shapiro (§1) are settled as `uncertified` (paywalled). They are cited by locator only and were not opened. The new locators follow the pinned Tau Ceti file `LinearAlgebra/CliffordAlgebra/Prod.lean:50–53`, which cites the same sections for the same statement.
- Ownership against open pull requests was checked through the sibling checkouts and the overlap list, as above.

## Source issues

- none
