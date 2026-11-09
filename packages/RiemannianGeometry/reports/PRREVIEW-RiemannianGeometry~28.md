# Review of RiemannianGeometry (pull request #1683 at c4122c5)

**Verdict:** needs changes

This is an incremental re-review: 24 changed lines in `TauCetiRoadmap/RiemannianGeometry/README.md` since `7782529`. `Suggested.lean` is byte-identical to `7782529`. The pins are unchanged: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`.

- The gate passes, and the dependency check reports 0 problems.
- `Suggested.lean` elaborates with exactly 22 `sorry` warnings and nothing else.
- The previous review's R02 (R3.1's dangling *Needs:* line) is repaired. Its R01 (ordering against #1187) is not, and is carried over below.
- The repair introduces no new defect. The only finding is P3, so nothing is blocking.

## R01 (P3) — The description still does not order this pull request against #1187

This carries over the previous review's R01, first raised as R08 six rounds earlier. No repair report marks it as not actionable.

**Location.** The pull-request description. It names #1327 and #1974 but not #1187. It still says "`ParaboloidTargets.lean` illustrates the integral estimates" and that the new file "elaborates with exactly three admission warnings using the existing local Mathlib pin `6b7abb3c…`".

**Claim.**
- #1187 ("chore: bump TauCeti to ab00ba392", head `66ed0d4`) is still open and changes `TauCetiRoadmap/RiemannianGeometry/Suggested.lean`.
- Its head conflicts with this one there, and nothing says which of the two is rebased on the other.
- The folder has no `ParaboloidTargets.lean`. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, not the ones the description names.

**Witness.**
- `git merge-tree --write-tree --name-only c4122c5 66ed0d4` prints "CONFLICT (content): Merge conflict in TauCetiRoadmap/RiemannianGeometry/Suggested.lean".
- `roadmaps list` lists #1187 with RiemannianGeometry among its folders.
- In the pinned Tau Ceti checkout, `git merge-base --is-ancestor ab00ba392 2fd255d9` succeeds.

**Repair.**
1. Add one sentence to the description: "This pull request does not wait for #1187: #1187's Tau Ceti pin `ab00ba392` is an ancestor of this head's pin `2fd255d9`, so its change to `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` is superseded, and #1187 is rebased on this one."
2. Delete the `ParaboloidTargets.lean` paragraph and the sentences about the `6b7abb3c…` and `f6090c70…` pins.

Tested: the ancestor relation that justifies the stated order is the check above, and the conflict is the `merge-tree` line above.

## Previous findings

- R01 — not repaired: the description still says "`ParaboloidTargets.lean` illustrates the integral estimates, continuity/divergence and coordinate geodesic crossing statements" and names Mathlib pin `6b7abb3c…`. It names #1327 and #1974, not #1187. Carried over as R01.
- R02 — repaired: `README.md:1573–1580` now reads "*Needs:* PDE §1.1 (A1: the absolutely continuous representative of a `W^(1,p)(a,b)` class, … ); Tau Ceti `CovariantDerivative.eventuallyEq_sectionCoord_alongCurveWithin` (fixed-chart formula …) and `CovariantDerivative.contMDiffOn_alongCurveWithin` (along-curve regularity)". After the change, `grep "R2 along-curve\|PDE Lane A\|A\.1–6\|D16–19"` on the README returns nothing.

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Gate.** `gate … --base origin/main` prints every counter 0 (`set_option=0 … statement-hygiene=0 … readme-ids-missing=0 … depcheck=0 … stray-files=0 … outside-folder=0 source-material=0`) and `OK`, exit 0. The worker's run on this head also reports `build=0`.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RiemannianGeometry'` is empty.
- **Dependency check.** `gate --depcheck … --movable` prints `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`, exit 0, with no UPWARD, CYCLE or `moved:` line.
  - The new PDE edges are one-way: `grep RiemannianGeometry` on main's `TauCetiRoadmap/PDE/README.md` is empty.
  - PDE is on main, so it is a legal supplier for a roadmap on main.
- **Elaboration.** `lake env lean TauCetiRoadmap/RiemannianGeometry/Suggested.lean` exits 0 in 17 s. It gives 22 `declaration uses sorry` warnings, at lines 103, 120, 144, 155, 172, 214, 235, 252, 262, 273, 283, 314, 324, 336, 364, 397, 419, 450, 467, 492, 513 and 529, and nothing else.
- **Signatures.** `git diff --quiet 7782529 HEAD -- …/Suggested.lean` succeeds, so the previous review's `#check @` comparison of all 24 declarations still holds.
  - The worker's `signatures.md` at this head agrees with it.
  - Its 25th entry, `is` at line 363, is a parse of the docstring word "instance", not a declaration.
- **Padding.** The previous one-tactic probe (no theorem closes) stands for the unchanged file.

### The changed passages

- **PDE contract bullet (`README.md:690–693`).**
  - On main, PDE has A1–A6 at `TauCetiRoadmap/PDE/README.md:677, 720, 769, 803, 855, 905`, D16–D19 at `:1627, 1678, 1717, 1770` and E20–E22 at `:1837, 1877, 1927`.
  - §1.1 (`:682–689`) states, for `1 ≤ p ≤ ∞`, the absolutely continuous representative of a `W^{1,p}(a,b)` class, the endpoint fundamental theorem of calculus and integration by parts for two representatives. That is what the new clause attributes to it.
- **R3.1 *Needs:* (`README.md:1573–1580`).**
  - The 1-D embedding follows from the representative and the endpoint fundamental theorem of calculus by Cauchy–Schwarz, as stated (values in the table).
  - `CovariantDerivative.eventuallyEq_sectionCoord_alongCurveWithin` (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/AlongCurve/Regularity.lean:56`) needs `UniqueDiffOn 𝕜 s`, `t ∈ s`, `γ t` in the chart base set and a C¹ lift. It gives eventual equality of the chart reading of D_tV with `alongCurveInChartWithin`, which is the derivative of the coordinates plus the Christoffel contraction (module docstring).
  - `CovariantDerivative.contMDiffOn_alongCurveWithin` (`:132`): a C^n connection on every trivialization base set and a C^(n+1) lift on a `UniqueDiffOn` set give a C^n lift of D_tV.
  - Both match the Tau Ceti contract at `README.md:399–409`, including the C² manifold, `CompleteSpace 𝕜` and `FiniteDimensional 𝕜 E`.
  - "R3 first variation and compact-interval section spaces" refers to R3's ambient module of continuous piecewise C¹ sections on [a,b] (`README.md:1437–1440`).
- **Layer 3 Dependencies (`README.md:1885–1887`)** agree with the new *Needs:* line.
- **R5b (`README.md:3017–3018`).** The only change is the id format, "A1–A6, D16–D19 and E20–E22". All of these ids resolve (above).
- **Seeded sample.** No changed line falls in §§1.1–2.3, so the previous review's verification of the sample stands. I re-read three of its locators in the cache, and they are unchanged:
  - `andrews-dg-ch16` line 105 (Proposition 16.2.1, header "154" at line 104);
  - `bishop-rg` lines 1872–1875 (Theorem 6.11, `g_ij=δ_ij−⅓ΣR_ihjk x^h x^k`);
  - `nicolaescu-lectures` line 8870 (Example 4.2.36).

### Library declarations opened at the pins (this round)

- **Tau Ceti `2fd255d9`:**
  - `AlongCurve/Regularity.lean:56, 103, 132`;
  - `Analysis/Sobolev/WeakDeriv/Interval.lean:217, 257, 273, 302, 318, 354`;
  - `Analysis/Sobolev/WeakDeriv/Basic.lean:212` (`HasWeakLineDerivOn`, valued in a real Banach space F);
  - `Analysis/Sobolev/W1p/Basic.lean:370–373` (`W1p` is real-valued);
  - `MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean:158`;
  - `Geometry/Manifold/Riemannian/Geodesic/Exponential.lean:193`.
- **Mathlib `1b1ccf4b`:** `MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean:259`.

### Citations and ownership

- `roadmaps resolve` (the worker's run) finds no unresolved citation or Lean name.
- **The worker's `overlaps.md`:** no dropped id, no id defined only by an open revision, and no id this pull request drops; #1187 is R01.
- **A live `roadmaps overlaps RiemannianGeometry`** adds three items, all for the ComplexKahlerGeometry K7.1 anchor cited at `README.md:300`, which #1807, #1808 and #1854 drop.
  - That line is a permalink to commit `a452db2c`, and is untouched since `7782529`.
  - Each of those heads keeps a "Former numbering" list with "`K7.1` → 7.1" (e.g. #1807 line 489), so the citation stays valid under the overlap rules.
- **The open PDE revision #1614 (head `f019834`)** is a Lane-structured PDE README. The overlap tool lists no PDE id that it drops relative to its merge base.
- **Ownership.** No new object is introduced: the change only re-attributes inputs.

### Remarks on untouched text (no change requested)

- R3.1's body (`README.md:1537–1539`) and the scope (`:673–674`) make R3 own the vector-valued interval weak-derivative/absolute-continuity comparison. Tau Ceti already proves it Banach-valued:
  - `TauCeti.HasWeakLineDerivOn.exists_continuousOn_ae_eq`, `.integral_eq_sub`, `.absolutelyContinuousOnInterval` and `TauCeti.hasWeakLineDerivOn_Ioo_iff_exists_ae_eq_add_intervalIntegral` (`WeakDeriv/Interval.lean:257, 273, 302, 217`);
  - integration by parts for two absolutely continuous functions: Tau Ceti `AbsolutelyContinuousOnInterval.integral_mul_deriv_eq_deriv_mul_of_ae_hasDerivAt` and Mathlib `AbsolutelyContinuousOnInterval.integral_mul_deriv_eq_deriv_mul`.

  The new PDE §1.1 citation matches the scalar, coordinatewise route the body describes.
- R3.1's "local exponential charts along reference smooth paths" use Tau Ceti's `TauCeti.Manifold.contMDiffOn_riemannianExp_tangentBundle` (`Exponential.lean:193`). Neither the old nor the new *Needs:* line names it; the HopfRinow contract (`README.md:633`) covers `riemannianExp`.

### Adversarial table

The rows for the changed statements and their dependents, with values computed this round:

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| R3.1 *Needs:* embedding `\|u(y)−u(x)\|≤\|y−x\|^(1/2)‖u′‖_(L²(a,b))` | u=t on (0,1), x=0, y=¼; u=t², x=0, y=1; u′=1 on [x,y]; ℝ²-valued u=(t,t²), x=0, y=1; exponent 1 with u′=1 on [0,ε], ε=0.01 | 0.25≤0.5·1=0.5; 1≤1·√(4/3)=1.1547; y−x=(y−x)^½·(y−x)^½, so the bound is sharp; √2=1.4142≤√(1+4/3)=1.5275; with exponent 1, 0.01 vs 0.01·0.1=0.001 fails | true, and the exponent ½ is pinned | none |
| "follows from the first two by Cauchy–Schwarz" | derivation | ‖v(y)−v(x)‖=‖∫_x^y u′‖≤∫_x^y‖u′‖≤\|y−x\|^½(∫_a^b‖u′‖²)^½, using only the representative and the endpoint FTC | true | none |
| Contract: §1.1 supplies the representative, FTC and integration by parts | PDE `README.md:682–689` on main; Tau Ceti `W1p` | all three are stated for 1≤p≤∞, hence at p=2; scalar, as R3.1's coordinatewise route (`:1537–1539`) uses it | true | none |
| `eventuallyEq_sectionCoord_alongCurveWithin` as the fixed-chart formula | flat ℝ², γ(t)=(cos t, sin t), V=γ′, Cartesian and polar charts | Cartesian: Γ=0, D_tV=V′=−γ, norm 1; polar: V=(0,1), V′=0, Γ^r_θθ=−r=−1, so D_tV=−∂_r, norm 1, the same vector | true | none |
| `contMDiffOn_alongCurveWithin` as along-curve regularity | n=0, flat ℝ, γ(t)=t, V(t)=t\|t\| on [−1,1]; s a singleton | the lift is C¹ but not C²; D_tV=2\|t\| is continuous, not C¹, so exactly one derivative is lost; a singleton is not `UniqueDiffOn` and is excluded | true | none |
| Contract and R5b PDE ids | headings of PDE on main | A1–A6 at 677–905, D16–D19 at 1627–1770, E20–E22 at 1837–1927; §1.1 at 677 | all resolve | none |
| R3.1 Checks (depend on the changed line) | γ=t and t² on [0,1]; unit-speed triangular waves with n teeth | γ=t: E=½, L=1, 1=2·1·½; H¹ norm √(⅓+1)=1.1547=√(4/3); γ=t²: E=⅔, 1<4/3; waves: d_s(γ_n,γ_m)≤1/(2n)+1/(2m)→0 while d_s(γ_n,0)=1/(2n)+1→1 | true | none |

Rows carried forward from the previous report (PRREVIEW-RiemannianGeometry~27) for the untouched statements, values as computed there:

| Statement | Values (r27) | Result |
|---|---|---|
| §1.1 item 4 polarization `24r=…` | 16−(−8)=24=24K; ω⊗ω gives 16≠24 | true |
| §1.1 item 2, constant curvature | ⟨R(x,y)y,x⟩=κ; vacuous for n≤1 | true |
| §1.2 Checks | dx²+e^(2x²)dy² at x=1: K=−6, ∂ₓK=−8; S³: Ric=2g, ½g | true |
| §1.3 warped `R(V,X)Y`, `Ric(V,V)`, Euclidean warped | −f″/f=−1; Δ: 4/3+2/3=2, Δ⁺: 0; (k−1)g_N−(k−1)g_N=0 | true |
| §1.3 T-tensor, Andrews sign, O'Neill Hopf | norms 1 and 2; ¼⟨[X,Y],[Z,W]⟩; K_B=1+3=4, area π | true |
| §2.1 Checks, `exists_jacobi_initial_data`, d exp | D²J=0; sin t·E; residual 2E≠0; flat J(t)=tw | true |
| §2.2 frames, holonomy, jets | 1 vs sin t/t=0.636620; π/2; −⅓K\|v\|² | true |
| §2.3 R1.5 | 0.996671 vs 0.996667; K=λ⁻²=0.01 | true |
| R3 commutator, index Checks | sin r e_θ on both sides; I=0 and −1.309 | true |
| `rauch_norm_ge_of_sectional_le` | 1≤1.469463; t=5π/2 excluded by b<π | true |
| `guenther`, `bishopGromov`, `modelBallVolume` | 2.888366 on both sides; 2.888, 2.224, 1.273 nonincreasing; V=2 at κ=1, r=π | true |
| `cartanHadamard_isCoveringMap`, Bonnet–Myers, Synge | ℝ²→T²; π=diam Sⁿ; RP², T², RP³ excluded | true |
| `singularHomology_loopSpace_sphere` | n=2: ℤ in every degree; n=3: even degrees | true |
| Killing–Hopf ×3, `two_distinct_geodesics`, `three_simple_closed_geodesics` | point, line, S² with n≥2; e^(iπ/4)≠e^(−3iπ/4); three great circles | true |
| `paraboloid_geodesic_crossings`, `paraboloid_vertex_pole` | a=1: R₀=2.275594, t₀=6.467619≥4.178330, det=0.074453>0; r(ℓ)>0 | true |
| R5b Checks 1–4, `(L_D+c)⁻¹=S`, least eigenvalue | L_D=2Id vs ½Id; −1 at c=2,3; index 1; Q(φ,v)=2v(π/2) | true |
| R6 normal exponential, `I_M`, Hessian | kernel at t=1; 1/b−1; 2(1−t)=1,0,−2 | true |
| R7.0 Bochner, R7.6, R7.7 ⌊n/2⌋ | −8+8=0; S², flat S¹ excluded; (p−1)β<(n−1)α | true |
| `riemannianDist_eq_sSup_smooth` | ℝ²∖{0}: 2=sup 2 | true |
| R8 sphere eigenfunctions, `harmonic_irreducible`, polar Laplacian, five-coordinate map | λ=1, 2, 6; 2d+1; (d+1)²; 6/2=3 | true |
| R5a.2 paraboloid H, stereographic Γ; R4.9 flow identities | (2+0)/1=2; 2π cos r+2π(1−cos r)=2π | true |

## Not verifiable

- **Milnor, O'Neill, Lee and Fulton–Harris.** All four are settled as uncertified. No changed line cites them; the previous report lists their uses.
- **Ownership against ManifoldOptimization (#1506).** Not checked: the brief gives no checkout for it.

## Source issues

- none
