# Review of RiemannianGeometry (pull request #1683 at df3f6d4)

**Verdict:** accepted

This is an incremental re-review of the 59 lines changed in `TauCetiRoadmap/RiemannianGeometry/README.md` since ea3cb9e. `Suggested.lean` and every file outside the folder are unchanged.

- Both previous findings are repaired, and the repairs introduce no new defect.
- The gate passes and the dependency check reports 0 problems.
- `Suggested.lean` elaborates with only its 23 `sorry` warnings.
- Every declaration newly cited in the README exists at the pin, under the name, file and hypotheses the README gives.

This report has no findings.

## Previous findings

- R01 — repaired: README line 3667 now reads "5. Prove the section-norm identity", followed by "`Δ⁺|φ|²+2|∇φ|²=2Re⟨∇*∇φ,φ⟩` and Kato's inequality…". The R7 list items sit at lines 3576, 3584, 3597, 3630, 3667, 3671, 3683 and 3708, numbered 1–8.
- R02 — repaired: R5a.3's *Needs:* (lines 3198–3214) now adds "R4.3 (a local Riemannian isometry from a nonempty complete manifold onto a connected one is a surjective covering)", the pullback metric, `IsCoveringMap.injective` and the Mathlib simple-connectivity and diffeomorphism inputs. Line 3350 reads "R5a.3 additionally uses R2, R3, R4.3 and HopfRinow."

## Verified sound

**Gate.** I re-ran the gate at df3f6d4 and it printed:

`gate RiemannianGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

**Dependency check.** It printed `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.

**Changed files.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RiemannianGeometry'` is empty. `git diff --stat ea3cb9e HEAD` touches only `README.md` (51 insertions, 8 deletions).

**Elaboration.** `lake env lean` on `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` gives 23 `declaration uses 'sorry'` warnings, at lines 109–600, and nothing else.

**Unchanged `Suggested.lean` checks.** The file is unchanged since ea3cb9e, so the following carry over from the previous report (r31):
- The padding probe: all 23 `sorry`s survive a one-tactic `first | rfl | … | positivity` probe.
- The `#check @name` comparison.
  - The two leads in `scratch/signatures.md` are the same as in r31. `IsEndpointZeroSmoothSection` drops `[FiniteDimensional ℝ E]`, `[I.Boundaryless]` and `[T2Space M]`, and `indexForm` drops `[I.Boundaryless]`. Neither body needs them, and `morse_index` carries all of them.
  - The "instance `is`, line 415" lead is the word "instance" in the docstring of `three_simple_closed_geodesics`, not a declaration.

**Library declarations opened at the pins (10, all new or newly applied in this change).**
- Mathlib:
  - `IsLocalDiffeomorph.diffeomorphOfBijective` (`Mathlib/Geometry/Manifold/LocalDiffeomorph.lean:372`): it takes only `hf : IsLocalDiffeomorph I J n f` and `hf' : Function.Bijective f`.
  - `Homeomorph.contractibleSpace` (`Mathlib/Topology/Homotopy/Contractible.lean:90`): for `[ContractibleSpace Y]` and `e : X ≃ₜ Y`, it gives `ContractibleSpace X`.
  - The instance `SimplyConnectedSpace.ofContractible` (`Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:82`).
  - The instance `RealTopologicalVectorSpace.contractibleSpace` (`Mathlib/Analysis/Convex/Contractible.lean:41`): it covers every real topological vector space with continuous addition and scalar multiplication, so every real normed space.
- Tau Ceti:
  - `TauCeti.isLocalDiffeomorph_of_mfderiv_eq` (`TauCeti/Geometry/Manifold/LocalDiffeomorph/Basic.lean:459`).
    - Hypotheses: `RCLike 𝕂`, `[CompleteSpace E]`, `[BoundarylessManifold I M]`, `ContMDiff I J n f` and `1 ≤ n`, with the differential a continuous linear equivalence at every point.
    - The contract does not state the field or the completeness of the model space. Both hold under the Conventions (line 129: finite-dimensional real manifolds).
  - `IsCoveringMap.injective` (`TauCeti/Topology/Homotopy/Covering.lean:108`): it needs `[PathConnectedSpace E]` and `[SimplyConnectedSpace X]`, and not surjectivity.
  - `Bundle.ContMDiffRiemannianMetric.pullback` and `pullback_inner` (`TauCeti/Geometry/Manifold/Riemannian/Pullback/Basic.lean:158`, `:193`): they need a globally `ContMDiff I J (n+1) f` with injective `mfderiv`, and `[FiniteDimensional ℝ E]`.
  - `TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback` (`TauCeti/Geometry/Manifold/Riemannian/Isometry/LeviCivita.lean:130`): `df_x(∇ᴹ_v f*Y)=∇ᴺ_(df_x v)Y`. It is already in the contract at README line 371.
  - `TauCeti.Manifold.contMDiffOn_riemannianExp_tangentBundle` (`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Exponential.lean:193`): it needs `[T2Space M]`. `paraboloid_vertex_pole` does not assume `T2Space S`, but Hausdorffness follows from the diffeomorphism `e` onto ℝ².

**Cross-roadmap and internal citations resolved.**
- R4.3 item 3 (README lines 2186–2190) states both criteria the new text uses:
  - a local Riemannian isometry from a nonempty complete manifold to a connected one is a surjective covering;
  - a local diffeomorphism with `|df(v)|≥|v|` and complete domain is a covering.
- R4 is Layer 4 and R5 is Layer 5. Layer 4's Dependencies (lines 2822–2834) do not mention R5, so there is no cycle.
- HopfRinow is on main under `Completed/HopfRinow/README.md`. Its Layer 3 ("Base-point propagation", lines 488–490 there) gives completeness from `exp_p` being everywhere defined at one point, and that is the "completeness of exp*g from its radial geodesics" now cited.
- `scratch/citations.md` reports no unresolved citation against main and 458 open heads.
- `scratch/overlaps.md` reports:
  - no dropped ids in either direction;
  - #1187 also changes `Suggested.lean`, and the description states the order: #1187 is rebased on this one.
- The change adds no owned object: every new item is a contract citation or a proof-route step. Ownership is therefore as r31 found it.

**Source re-read for the changed route.**
- `nicolaescu-lectures` lines 10624–10639, p. 238: Exercise 6.2.5 and the proof of Theorem 6.2.6.
  - The proof argues that the pullback `h` is positive definite, the lines `t↦tv` are `h`-geodesics for all t, Hopf–Rinow gives completeness, and the exercise finishes.
  - README lines 3125–3137 paraphrase this, without copying, and add the connectedness of the target that the exercise omits.
- Seeded sample: §1.1–§2.3 are untouched by the change. r31 verified each locator, and I re-confirmed five of them:
  - `andrews-dg-ch16` lines 101 and 105;
  - `bishop-rg` line 1872;
  - `nicolaescu-lectures` line 4630;
  - `spacetime-guided-tour` line 2919;
  - `brewin-rnc` line 614.
- The README flags no locator as unverified.

**Remark on untouched text (no change requested).** R5a.3's *Needs:* opens "HopfRinow (Completed) Layers 2–4 (geodesic ODE, exponential map, …" (line 3198, unchanged). In HopfRinow, the geodesic equation and the exponential map are Layer 1 (line 264 there).

**Adversarial table.** Rows marked r31 are carried from the previous report for statements this change leaves untouched. The other rows are new and their values are mine.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| R5a.3 vertex-pole route (lines 3121–3137) | paraboloid vertex; flat plane; round sphere K=4; punctured line→circle | paraboloid: `dr/dℓ=1/√(1+4r²)∈(0,1]`, so r(ℓ)>0 for ℓ>0 and exp has no critical point. `exp*g=dℓ²+r(ℓ)²dθ²`; radial lines are geodesics for all ℓ; the balls {ℓ≤R} are compact, so it is complete. R4.3 then gives a surjective covering, and S≅ℝ² is simply connected, so one sheet. Flat plane: r=ℓ, `exp*g` flat, both criteria apply. K=4 sphere: r=sin(2ℓ)/2=0 at ℓ=π/2, `exp*g` degenerates, and the premise excludes it. Punctured line→circle: local isometry, incomplete domain, not a covering, so the completeness step is needed | holds | none |
| New Check `\|d(exp)_v(w)\|=r(ℓ)/ℓ` (lines 3158–3161) | r=1; flat; sphere K=4 at ℓ=π/4; Jacobi equation | ℓ(1)=√5/2+arsinh(2)/4=1.118034+0.360909=1.478943 (midpoint sum 1.478943; ODE 1.47895); ratio 0.676159<1. Flat: ratio 1. K=4: (½)/(π/4)=0.6366. `r″+Kr=−4r/(1+4r²)²+4r/(1+4r²)²=0` at r=½, 1, 2 | holds; the norm criterion fails as stated | none |
| R5a.3 *Needs:* (lines 3198–3214) | each named input | the 9 library names resolve at the files above; R4.3 item 3 at 2186; HopfRinow Layer 3 base-point propagation; R2, R3, R5a.2 unchanged | complete; no upward edge | none |
| Mathlib contract for R5a.3 (lines 189–197) | S≅ℝ² via e; S¹; x↦x³ | ℝ² contractible ⇒ S contractible ⇒ simply connected. S¹ is not contractible, and ℝ→S¹ is a non-injective covering, consistent with the hypothesis. x↦x³ is bijective but not a local diffeomorphism at 0 (derivative 0), so `diffeomorphOfBijective` does not apply | holds | none |
| Tau Ceti contract for R5a.3 (lines 599–607) | two-copy cover ℝ⊔ℝ→ℝ; ℝ→S¹; x↦x³ | not injective: excluded by path-connectedness, then by simple connectivity. Differential 0 at 0: excluded by the IFT's invertibility hypothesis | holds | none |
| Layer 5 Dependencies (line 3350) | against the *Needs:* line | R2, R3, R4.3, HopfRinow on both | agrees | none |
| R7 item 5 (lines 3667–3670) | numbered list; main's text | items 1–8 in order; text identical to main's item 5 | restored | none |
| `paraboloid_vertex_pole` (Lean statement unchanged) | vertex K; sphere of curvature 4 | K(0)=4/(1+0)²=4; r(ℓ)>0 against sin(2ℓ)/2=0 at π/2; the route's inputs now all listed | holds | none (r31 R02 repaired) |
| §1.1 item 4, `24r=B_Q(x,w;y,z)−B_Q(y,w;x,z)` | K=1 orthonormal x,y with z=y, w=x; ω-form on ℝ⁴ | 16−(−8)=24=24·1; ω: 8−(−8)=16≠24 | holds (r31) | none |
| §1.2 local symmetry and Einstein factor | `dx²+e^(2x²)dy²`; unit and radius-2 S³ | K=−2−4x², ∂ₓK(1)=−8; a=2 and ½ | holds (r31) | none |
| §1.3 warped curvature | (0,π)×_sin S², t=π/3; `dx²+e^(2x)dy²`; ℝ³∖0 | Ric(V,V)=4/3+2/3=2; −f″/f=−1; vertical Ric 0 | holds (r31) | none |
| §1.3 O'Neill A, T and bi-invariant | `e^(2x)`, `e^(4x)`; Hopf S³→CP¹; `∇_XY=½[X,Y]` | T_UU=−∂x, −2∂x; \|A\|=1, K=1+3=4; R=¼[[X,Y],Z]−½[[X,Y],Z] | holds (r31) | none |
| §1.3 projective normalisation and conformal laws | X=[[0,−1],[1,0]]; Δ⁺=−Δ | −trX²/2=1=\|Xe₂\|; `Scal̃=e^(−2u)(Scal+2(n−1)Δ⁺u−(n−1)(n−2)\|du\|²)` | holds (r31) | none |
| §2.1 Jacobi Checks | great circle sin t·E; flat t²E | −sin t·E+sin t·E=0; residual 2E | holds (r31) | none |
| §2.2 transported frame | unit S², t=π/2; octant triangle | \|E_Y\|=1 vs 2/π≈0.637; holonomy π/2 | holds (r31) | none |
| §2.2 and §2.3 jets | unit S², e_a⊥v; λ rescaling | sin²t=t²−t⁴/3+…; δ−⅓\|v\|²; K(λ²g)=λ⁻²K | holds (r31) | none |
| `exists_jacobi_initial_data` | flat; constant geodesic | X=u+(t−a)v; solution space 2n | holds (r31) | none |
| `IsEndpointZeroSmoothSection`, `indexForm` | sin(πt)E; tE; tent; S² sin(2t/3)E on [0,3π/2] | in; fails X(1)=E; fails at ½; π²/2; π/3−3π/4=−5π/12 | holds (r31) | none |
| `morse_index` | constant γ; great circle on [0,π], [0,3π/2], [0,2π] | 0; 0; n−1; n−1, not 2(n−1) | holds (r31) | none |
| `singularHomology_loopSpace_sphere` | n=2, 3; n=1 | ℤ in every degree; ℤ in even degrees; excluded by hn | holds (r31) | none |
| `rauch_norm_ge_of_sectional_le` | sphere of radius 5/2, κ=1 | 1≤2.5 sin(π/5)=1.4695; t=5π/2 excluded | holds (r31) | none |
| `synge`, `synge_orientable_of_odd` | RP², T², RP³ | nonorientable; K=0; orientable with π₁=ℤ/2 | holds (r31) | none |
| `modelBallVolume`, `guenther`, `bishopGromov` | (2,0), (2,1), (3,0); unit S²; H² | r²/2, 1−cos r, r³/3; 2π(1−cos r); 2.888, 2.224, 1.273 vs 3.41, 4.34 | holds (r31) | none |
| `cartanHadamard_isCoveringMap` | ℝⁿ; flat torus | translation; ℝⁿ→Tⁿ | holds (r31) | none |
| `bonnetMyers_distance`, `myers_finite_fundamentalGroup` | unit Sⁿ; RPⁿ; n=1 | π=diam; ℤ/2; excluded | holds (r31) | none |
| `two_distinct_geodesics`, `killingHopf_*` | unit circle; n=0, 1 | points differ at t=½; point; (0,∞) with dt²/t²≅ℝ | holds (r31) | none |
| `three_simple_closed_geodesics` | round S² | three great circles | holds (r31) | none |
| `paraboloid_geodesic_crossings` | a=1; circle r≡1 | r″(0)=1/5; residual −1; det=2ar′/R²>0 | holds (r31) | none |
| R5a, R5b, R6 identities | unit sphere; Q=2uv; unit circle | B=−⟨X,Y⟩ν; L_D=2; 1/b−1 | holds (r31) | none |
| R7.0, R7.4 | f=x²; unit Sⁿ; S²×S² | −8+8=0; ℛ_p=p(n−p); ℛ₂ω₁=0 | holds (r31) | none |
| Bochner headlines | flat S¹; S² minus two points; S²×S² | b₁=1; b₁=1; b₂=2 | holds (r31) | none |
| `riemannianDist_eq_sSup_smooth` | ℝ, clamped identity | \|f x−f y\|=\|x−y\| | holds (r31) | none |
| R8 headlines and Weyl contract | S¹, S²; N=2…5; B₁, D₂ | λ=1, 2, 6; 2d+1, (d+1)²; (d+½)/½ | holds (r31) | none |

## Not verifiable

- **Uncertified in the manifest; cited by locator only (carried from r31).**
  - Milnor, *Morse Theory*: Theorem 15.1, Theorem 14.1, §6 and §§13–17.
  - O'Neill: Theorem 2 and Corollary 1.
  - Lee, *Introduction to Riemannian Manifolds*: Chapter 10.
  - Fulton–Harris: Lectures 18–19.
- **Outside the change and the seeded sample.** The sources r31 lists as absent from the package `sources.toml` (Homma, Toth–Ziller, Gage, Grayson and others) are cited only in untouched text. This review edits no manifest and did not fetch them.
- **Ownership against open pull requests.** This change adds no owned object. I relied on `scratch/overlaps.md` and `scratch/citations.md`, both computed over the 458 open heads; r31's sibling comparison (PositiveMass, RicciFlow, CalibratedGeometry, DifferentialGeometry) stands.

## Source issues

- **Gap** in nicolaescu-lectures at proof of Theorem 6.2.6, p. 238: the source finishes with Exercise 6.2.5, which needs a surjective local isometry, but `exp_q` reaches only the component of q; it should assume M connected or argue componentwise; affects the proof.
