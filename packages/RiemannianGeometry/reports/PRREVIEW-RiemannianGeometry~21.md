# Review of RiemannianGeometry (pull request #1683 at bc24c8c)

**Verdict:** needs changes

Incremental re-review of the 23 lines of `TauCetiRoadmap/RiemannianGeometry/README.md` changed since `693f3b7` (the head the previous review read): the R4.8 Morse/Serre parenthetical and its references entry. `Suggested.lean` is byte-identical to that head (same md5), `lake-manifest.json` is unchanged, and no file outside the folder changed. The previous review's R02 (the Serre clause overstated on part of the headline's range) is repaired: the passage now splits by the fundamental group and both halves are correct. The previous review's R01 (the branch pins a Tau Ceti that is not main's, so the README cites declarations that do not exist at the branch pin and the Lean file imports modules main's pin no longer has, with a content conflict against main) is untouched by this change and remains the only blocking finding. The gate passes, the dependency check reports no problem, the file elaborates at the branch pin with `sorry` the only warning, and the one-tactic probe closes nothing.

## R01 (P1) — Not repaired: the folder is pinned to two different libraries, and the branch still conflicts with main

**Location.** `TauCetiRoadmap/RiemannianGeometry/Suggested.lean:10–12` (`public import TauCeti.Geometry.Manifold.Riemannian.Sphere`, `…Hyperbolic.UpperHalfSpace`, `TauCeti.Geometry.Manifold.Orientation`), `:77` (`def IsJacobiFieldOn`), `:104` (`def modelSine`); `README.md:182`, `:201` ("`IsJacobiFieldOn` in `Suggested.lean` writes out the same three clauses"), `:207–208` ("`modelSine` in `Suggested.lean` has the same three-case definition as `TauCeti.curvatureSine`"), `:674–680`, `:1199–1200`.

**Claim.** The 23 changed lines touch none of the previous report's repair steps 1–4: the branch's `lake-manifest.json` still pins Tau Ceti `358314d4` and Mathlib `f6090c70` while main pins `2fd255d9` and `1b1ccf4b`; the three imports are unchanged; `IsJacobiFieldOn` and `modelSine` are still declared and the README still describes them as copies of `TauCeti.Manifold.IsJacobiFieldOn` and `TauCeti.curvatureSine`. The folder is therefore consistent at neither pin. At the branch pin the README's Tau Ceti supplier contract for R1, R2, R4.1, R7.0 and R8.1 names declarations that do not exist (the list of the previous report; two are re-verified below). At main's pin the three imported modules do not exist, so `Suggested.lean` does not build there, and the two definitions duplicate library declarations.

**Witness.** Re-run at this head. `git merge-tree --write-tree origin/main HEAD` lists three stages for `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` and prints `CONFLICT (content)`. In the Tau Ceti checkout at the branch pin `358314d4`: no file contains `IsJacobiFieldOn` or `def curvatureSine`, and `exists_eq_curvatureCosine_smul_add_curvatureSine_smul` (README `:195`, `:721`) occurs in no file. In the Tau Ceti checkout at main's pin `2fd255d9`: `Analysis/SpecialFunctions/Trigonometric/Curvature.lean:40` (`def curvatureSine`), `Geometry/Manifold/Riemannian/Jacobi/Basic.lean:59` (`structure IsJacobiFieldOn`), `Riemannian/Sphere/Basic.lean`, `Hyperbolic/UpperHalfSpace/Basic.lean` and `Orientation/Basic.lean` exist, while `Riemannian/Sphere.lean`, `Hyperbolic/UpperHalfSpace.lean` and `Manifold/Orientation.lean` do not. The worker's own signature tool at main's pin failed for exactly this reason (missing object file for `TauCeti/Geometry/Manifold/Riemannian/Sphere`).

**Repair.** As in the previous report: (1) merge `origin/main` into the branch, keeping this head's import block for the one conflict; (2) replace the three imports by `TauCeti.Geometry.Manifold.Riemannian.Sphere.Basic`, `TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.UpperHalfSpace.Basic` and `TauCeti.Geometry.Manifold.Orientation.Basic`; (3) delete `IsJacobiFieldOn` and `modelSine`, state `exists_jacobi_initial_data` and `rauch_norm_ge_of_sectional_le` on `TauCeti.Manifold.IsJacobiFieldOn I γ X (Icc a b)` and `TauCeti.curvatureSine κ t`, and `modelBallVolume` on `TauCeti.curvatureSine`; delete the README sentences at `:201`, `:207–208`, `:679–680` and `:1199–1200` that say the Lean file copies them, and the clause at `Suggested.lean:19–21` naming the two definitions; (4) re-run the gate and the targeted build at the merged pins.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d4`; `Suggested.lean:10–12` still imports `Riemannian.Sphere`, `Hyperbolic.UpperHalfSpace`, `Manifold.Orientation`; `IsJacobiFieldOn` (`:77`) and `modelSine` (`:104`) remain; `git merge-tree` still conflicts. Raised again as R01.
- R02 — repaired: `README.md:1495–1506` now says "For simply connected M this is a special case of Morse's theorem … Serre's theorem supplies that hypothesis for a compact simply connected manifold of positive dimension, whose top mod-2 homology is nonzero"; `:1506–1509` "For nontrivial π₁(M) the loop-space hypothesis fails in general (on the circle and the flat torus the based loop space is homotopy equivalent to the discrete group π₁(M), with homology in degree 0 only) and the two geodesics come from distinct lifted path classes, as in the route below"; the references entry `:2849–2855` says the same. Checked below (table); the repair introduced no new problem.
- r15 R01 (the pull-request description states no order between this head and #1327, #1187 and #1974) — unchanged and settled by the repair report's reason (a repair job cannot edit the description); the description quoted in `scratch/pull-request.md` still names none of them.

## Verified sound

### The changed passage (R4.8 and its references entry)

- **Morse's theorem as recalled.** `caponio-javaloyes-morse` line 14–18: complete connected Riemannian M, `H_*(ΩM, K)` nontrivial in infinitely many dimensions for a coefficient field K ⇒ any two points are joined by infinitely many geodesics (Morse, Theorem 13.3, p. 239). The README's restatement (`:1498–1501`) matches it; infinitely many geodesics from p to q, affinely parametrized on [0,1], contain two that differ at some t, so the headline is a special case there.
- **Serre's clause, restricted.** The README now asks for M compact, simply connected, of positive dimension, with nonzero top mod-2 homology. A compact connected boundaryless manifold of dimension n ≥ 1 has `H_n(M; 𝔽₂) ≅ 𝔽₂`; a simply connected one has n ≥ 2 (the only compact connected 1-manifold is the circle). Serre's theorem (simply connected, finite-type, non-acyclic over K ⇒ `H_i(ΩM; K) ≠ 0` for infinitely many i) then applies with K = 𝔽₂. The sentence is correct, and the parenthetical rightly says the source's wider "every compact manifold" clause (line 18–20) needs a restriction (Source issues of the previous report, carried below).
- **The nontrivial-π₁ branch.** `ΩM ≃ π₁(M)` (discrete) for aspherical M, so `H_i(ΩS¹; K) = H_i(ΩT²; K) = 0` for i > 0: the loop-space hypothesis fails, as the README says. The route it points to (`:1526`, "Nontrivial fundamental group already gives distinct lifted path classes") is sound for every nontrivial π₁, finite or infinite: the path-homotopy classes from p to q are a π₁(M)-torsor, so there are at least two; each contains a length-minimizing geodesic (lift to the complete universal cover, Hopf–Rinow, project); geodesics in distinct classes are distinct paths on [0,1]. Together the two branches cover the headline's whole range (`[ConnectedSpace M] [CompactSpace M]`, `1 ≤ finrank ℝ E`).
- **Remark, no change requested.** "needs the simple connectivity" (`:1504–1505`) names Serre's hypothesis; finite π₁ with a non-contractible universal cover also makes the loop-space hypothesis hold (`RP³`: `ΩRP³ ≃ ℤ/2 × ΩS³`), and the README's second branch handles such M anyway, so nothing is lost.
- **References entry** (`:2849–2855`): the URL and version (arXiv:1105.3923v2) match the cache's header (`caponio-javaloyes-morse` line 5); the "used by R4.8 for simply connected M" clause matches the section text; the circle counterexample it records is the one computed above.

### Gate, direction, elaboration

- **Gate.** The worker's gate at this head prints every counter zero, `build=0`, `OK`; my own run of `gate … --base origin/main` prints every counter zero, `OK` (my run prints no `build=` token, the worker's does). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RiemannianGeometry'` is empty: no file changed outside the folder.
- **Dependency check.** `gate --depcheck … --movable` prints `depcheck: 239 roadmaps, 2324 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean` with `#check @` for all 20 declarations exits 0 in 56 s with exactly 16 `declaration uses sorry` warnings (lines 90, 114, 137, 148, 183, 200, 210, 221, 231, 262, 272, 284, 312, 342, 363, 393) and prints all 20 types. The file is byte-identical to the head the previous two reviews elaborated, so the binder comparison of those reports stands (`two_distinct_geodesics` carries `[ConnectedSpace M] [CompactSpace M]`, `1 ≤ Module.finrank ℝ E`, `p ≠ q`, and concludes two geodesics on `Icc 0 1` from p to q differing at some `t ∈ Icc 0 1`, as the README states).
- **Padding.** Replacing each `sorry` by `first | rfl | infer_instance | (simp; done) | (intros; simp_all; done) | (constructor; done)` on a scratch copy leaves 16 errors and 0 sorries: nothing closes in one tactic at the branch pin.
- **Form.** Unchanged: one module docstring, `public import Mathlib` plus nine `TauCeti.*` modules that exist at the branch pin, no `set_option`, no `lemma`, no sorry'd data, a docstring on every declaration.

### Seeded sample

The seeded targets (1.1 Curvature identities; 1.2 Local symmetry and the Einstein factor; 1.3 Metric changes, Lie groups and submersions; 2.1 Jacobi fields and their initial data; 2.2 Normal-coordinate jets) lie entirely outside the 23 changed lines (`:1492–1512`, `:2849–2855`), and no changed passage cites or depends on them; their locators were read by the previous reviews and are unchanged at this head.

### Adversarial table

Rows for the changed statement were computed this round; rows for untouched statements carry the previous reports' values (r19, r20).

| Statement | Instances | Values on the two sides | Result |
|---|---|---|---|
| `two_distinct_geodesics` against the split Morse/Serre route (changed passage) | `S¹`, p = 0, q = π/2; `T²`; `S²`; `RP³`; `RP²`; point | `S¹`: π₁ = ℤ, path classes from p to q indexed by k ∈ ℤ, each with exactly one geodesic `t ↦ (π/2 + 2πk)t`, lengths π/2, 3π/2, 5π/2, …; k = 0 and k = −1 differ at t = ½ (π/4 versus −3π/4); `ΩS¹ ≃ ℤ`, `H_i = 0` for i > 0, so the first branch does not apply and the second does. `T²`: π₁ = ℤ², same. `S²`: simply connected, `H_2(S²; 𝔽₂) = 𝔽₂ ≠ 0`, `H_k(ΩS²; ℤ) = ℤ` for all k ≥ 0, Morse applies; for non-antipodal p, q the great-circle arcs of lengths d and 2π − d already differ. `RP³`: π₁ = ℤ/2, two path classes, second branch; `ΩRP³ ≃ ℤ/2 × ΩS³` has `H_{2k} ≠ 0` too. `RP²`: π₁ = ℤ/2, second branch. Point: excluded by `1 ≤ finrank` (one geodesic only). | both branches true on every instance; together they cover the headline's range |
| Serre's clause as restricted (changed passage) | compact simply connected of dimension n ≥ 2; `S¹` (the source's clause) | n ≥ 2: `H_n(M; 𝔽₂) = 𝔽₂`, Serre gives `H_i(ΩM; 𝔽₂) ≠ 0` for infinitely many i; `S¹`: `H_1(S¹; 𝔽₂) = 𝔽₂ ≠ 0` yet `H_i(ΩS¹) = 0` for i > 0 | the restricted clause holds; the source's clause fails on `S¹` |
| `rauch_norm_ge_of_sectional_le` against Rauch I | r20 row | `J = sin t·E`: `sin t ≤ sin t` on [0, π); radius 5/2 sphere: at t = π/2, `1 ≤ 1.4695`; `D_tJ(0) = 0` gives `0 ≤ 0` | unchanged (r20) |
| `synge`, `synge_orientable_of_odd` against Bishop 7.9, 7.11 | r20 rows | `S² ⊔ S²` excluded only by `ConnectedSpace`; `RP²`: π₁ = ℤ/2 nonorientable; `T²`: K ≡ 0; `RP³ = SO(3)`: orientable, π₁ = ℤ/2 | unchanged (r20) |
| Killing–Hopf triple against Barzen–Leymann Thm 9 | r20 row | r = 1: unit `S²`, `ℍ²(1)` ≅ half-plane `(dx² + dt²)/t²`; n = 1: `(0,∞)` with `dt²/t²` ≅ ℝ via log; n = 0: point | unchanged (r20) |
| `three_simple_closed_geodesics` against Taimanov | r20 row | round `S²`: equator and two meridian great circles, period 2π, injective on [0, 2π), three distinct ranges | unchanged (r20) |
| constant-curvature characterization (1.1 item 2) | r19 row | unit `S²`: `κ(⟨Z,Y⟩X − ⟨Z,X⟩Y) = e₁ = ⟨R(e₁,e₂)e₂,e₁⟩ e₁`; flat: 0 = 0; dim 1: both sides 0 for every κ | unchanged (r19) |
| Einstein factor (1.1 item 3, 1.2) | r19 row | `S³`: a = 2; radius 2: a = ½; `dx² + e^(2x²)dy²`: `K = −2 − 4x²`, `∂ₓK(1) = −8`; dim 1: a = 0 | unchanged (r19) |
| 1.3 conformal, bi-invariant, O'Neill, projective | r19 rows | `Scal̃ = c⁻² Scal`; `−¼[[X,Y],Z]`; `T_UU = −∂x`, norms 1 and 2; `K = 1 + 3⟨X,JY⟩² ∈ [1, 4]`, `CP¹` area π | unchanged (r19) |
| Jacobi predicate and 2.2 jets | r19 rows | residuals 0, 0, `2E`; `sin(π/2)/(π/2) = 0.6366`; `t² − t⁴/3` | unchanged (r19) |
| R3 index Checks, R3.1, R3.2 | r19 rows | `π²/2`; `I = 0`, `−5π/12`; `H¹` norm 1.1547; `E_Δ = ½` | unchanged (r19) |
| `modelSine`, `modelBallVolume`, `bishopGromov` | r19 rows | 1, 1.5708, 2.3013; `r²/2`, `1 − cos r`, `r³/3`; ratios 2.888, 2.224, 1.273 nonincreasing on `S²`, 3.412, 4.339 increasing on `H²` | unchanged (r19) |
| `cartanHadamard_isCoveringMap`, `bonnetMyers_distance`, `myers_finite_fundamentalGroup` | r19 rows | `ℝⁿ`, `T²`, point; λ = n − 1, bound π; `RP^n`: ℤ/2 | unchanged (r19) |
| R4.6 Checks, R4.9 Checks, `paraboloidGraph`, R5a, R6, R7.0, R7.3–R7.4, `riemannianDist_eq_sSup_smooth`, Fischer, R8 | r19 rows | inj ∞, π, π, 2π; d = 0.4841, defect 0.0159; `r''(0) = 0.2`, `K(0) = 4`; `S_ν = −Id`; `Δ⁺(4x²) = −8`; `D*D = −∂² − 2i∂ + 1`; `sSup = 1 = dist`; `Δr⁴ = 20r²`; `C(4,2) − C(2,0) = 5` | unchanged (r19) |

### Library declarations opened

- **Branch pin (Tau Ceti `358314d4`, the worktree's `lake-manifest.json`).** Every name `Suggested.lean` uses resolves (the elaboration above). `Geometry/Manifold/Riemannian/Sphere.lean`, `Hyperbolic/UpperHalfSpace.lean`, `Manifold/Orientation.lean` exist; no file contains `IsJacobiFieldOn`, `def curvatureSine` or `exists_eq_curvatureCosine_smul_add_curvatureSine_smul` (R01).
- **Main's pin (Tau Ceti `2fd255d9`, the content checkout's `lake-manifest.json`).** `Riemannian/Jacobi/Basic.lean:59` (`structure IsJacobiFieldOn`), `Analysis/SpecialFunctions/Trigonometric/Curvature.lean:40` (`def curvatureSine`), `Riemannian/Sphere/Basic.lean`, `Hyperbolic/UpperHalfSpace/Basic.lean`, `Orientation/Basic.lean` exist; the three modules the branch imports do not (R01).

### Cross-roadmap citations, ownership and overlaps

- **Citations.** The citations tool finds no unresolved cross-roadmap citation or Lean name; the changed passage cites no roadmap section (its "route below" is R4.8's own text, `:1526–1533`, which cites DGFloer Layer 1 and AlgebraicTopology as before).
- **Overlaps** (`scratch/overlaps.md`, unchanged since r19): #1187, #1327 and #1974 conflict with this head in the folder; the order question is settled as under Previous findings. The GeometricTopology fragment `#the-smoothing-and-triangulation-comparison-far-horizon` (`:1048`, outside the change) is defined on main, which the citation reads; #903 and #1797 revise a roadmap on main, so they are not dependencies. No id this pull request drops is cited elsewhere; no citation depends on an open revision.
- **Ownership.** No new object entered the folder in this change (the passage only re-justifies an existing headline), so the ownership audit of r19 (RicciFlow, Surfaces #1974, PositiveMass, ManifoldOptimization, DifferentialGeometry) stands.

### Remarks on untouched text (no change requested)

- "mod2 class" (`:1590`) and "mod2 Thom class" (`:1592`) are run-together tokens of the kind the r19 R02 listed, in text the previous reviews passed.

## Not verifiable

- **Morse, *The Calculus of Variations in the Large*, Theorem 13.3, p. 239**: not in the cache; cited only through Caponio–Javaloyes's recollection (`caponio-javaloyes-morse` line 14–17).
- **Serre's theorem** (Caponio–Javaloyes's reference [17]): not in the cache; its statement is checked from the standard form (simply connected, finite type, non-acyclic), which is what the README now assumes.
- **Settled uncertified keys.** O'Neill 1966, Milnor's *Morse Theory*, Lee's *Introduction to Riemannian Manifolds* and Fulton–Harris are cited by locator only.
- **Main's pin.** The Lean commands of this job run in the worktree's environment (branch pin); R01 rests on the file listings and declaration greps of the content checkout's Tau Ceti at `2fd255d9`, on `git merge-tree`, and on the worker's failed signature elaboration at that pin.
- **Heads not given.** #1187, #1327, #1974, #903 and #1797 were not re-read this round; their overlap facts are the tool's and the previous reviews'.

## Source issues

- **Error** in caponio-javaloyes-morse at §1, p. 1 (line 18–20): the source says Serre's theorem makes the based loop space's homology nontrivial in infinitely many dimensions whenever some `H_i(M, K)` with `i > 0` is nonzero, for example when `M` is compact; it should be restricted to simply connected `M` (or finite fundamental group with non-contractible universal cover), since for the circle or a torus the based loop space is homotopy equivalent to the discrete fundamental group and has homology in degree 0 only; affects a stated result (the introductory recollection), not the paper's Theorem 1.1, which assumes unbounded Betti numbers of `ΩM` directly.
