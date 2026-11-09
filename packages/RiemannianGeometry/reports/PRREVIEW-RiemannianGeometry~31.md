# Review of RiemannianGeometry (pull request #1683 at ea3cb9e)

**Verdict:** needs changes

There are two P3 findings and no blocking ones. Both come from edits made in this round. The gate passes and the dependency check is clean. `Suggested.lean` elaborates with only the 23 `sorry` warnings, and no declaration closes with one tactic. The seeded locator sample, every new locator and every headline locator I could read are correct.

## Status of the previous review's findings (review of ffb4475)

- **Previous R01 (P2): Morse index headline. Repaired.**
  - `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` line 150 now states `theorem morse_index {γ : ℝ → M} {a b : ℝ} (hab : a < b)`, together with `IsEndpointZeroSmoothSection` (line 121) and `indexForm` (line 131).
  - The module docstring (lines 75–78) now lists as not statable only the focal version, whose obstacle is "the shape operator of an immersed submanifold of a Riemannian manifold, absent at the pin". That obstacle is real: the only shape operator at the pin is `TauCeti.shapeOperator` (`TauCeti/Analysis/InnerProductSpace/ShapeOperator.lean:90`), defined for a map `V → E` into an inner-product space.
  - The README states the theorem with its API and Checks at lines 1548–1586.
- **Previous R02 (P3): five headlines without locators. Repaired.**
  - Hatcher, Theorem 4J.1 and Proposition 3C.8 (README line 1849; docstring lines 165–168).
  - Wilson, Problem 14 (README lines 3092–3095; docstring lines 448–452).
  - Taylor §8.2 (README line 3799; docstring lines 575–579) and Proposition 8.5.1 (README lines 3887–3895; docstring lines 595–599).
  - The vertex pole is now located by "the argument of Nicolaescu … proof of Theorem 6.2.6, p. 238" (README lines 3105–3113). All are in `## References`.
- **Previous R03 (P3): Weyl dimensions as roadmap files. Repaired.**
  - `TauCeti.oddOrthogonalWeylDimension`, `TauCeti.evenOrthogonalWeylDimension` and their one-row values are in `### From Tau Ceti` (README lines 672–684).
  - R8.3 cites them by name (lines 3825–3831), as does its *Needs:* line (lines 3926–3928).
- **Previous R04 (P3): unnamed Tau Ceti carriers. Repaired.**
  - `TauCeti.Manifold.curveVelocityWithin` is in the contract (README lines 426–430), and so is `TauCeti.Orientable` (lines 500–503).
  - R3.1's *Needs:* names `AbsolutelyContinuousOnInterval.intervalIntegrable_of_ae_hasDerivAt` and `.mono` (lines 1699–1702).
  - The stale commit link is replaced by name and file (lines 144–146).
- **Previous R05 (P3): missing Checks. Repaired, with one casualty.**
  - Checks were added to R3.4 (lines 2001–2026), R4.7 (lines 2402–2424) and R7.4 (lines 3609–3624), and I recomputed every value.
  - The R7.4 insertion deleted the first line of R7 item 5 (R01 below).
- **Previous R06 (P3): §1.2 Check wording. Repaired.** Lines 979–981 now read "this metric fails the predicate, so a predicate satisfied by every smooth metric is excluded".

## R01 (P3) — R7 item 5 lost its opening line when the R7.4 Checks were inserted

**Location.** `TauCetiRoadmap/RiemannianGeometry/README.md` lines 3623–3628. The last R7.4 Check ends "`…=e¹∧e²=binomial(2,2)e¹∧e²`." It is followed directly by "`Δ⁺|φ|²+2|∇φ|²=2Re⟨∇*∇φ,φ⟩` and Kato's inequality. The classical derivative formula is on φ≠0…", and then by "6. On closed connected M…".

**Claim.** The change set shows the line `5. Prove the section-norm identity` as deleted (`-5. Prove the section-norm identity`). The numbered list of R7.1–R7.8 now runs 1, 2, 3, 4, 6, 7, 8. The target "section-norm identity and Kato's inequality, with the weak inequality at the zero set" has lost its verb and number. It now reads as the tail of an R7.4 Check bullet, so a proof target sits inside a Checks list. R7.6 (item 6) uses this identity: its parallelism of harmonic forms under `ℛ_p≥0` is the Bochner argument built on it.

**Witness.** `grep -n "^[0-9]\. \|^   [0-9]\. "` on README lines 3530–3720 lists items at lines 3534, 3542, 3555, 3588, 3628, 3640 and 3665. No item 5 appears. The change set `scratch/changes.md` contains the removed line verbatim.

**Repair.** Restore the line at 3625 and re-indent the fragment as item 5. After the last R7.4 Check bullet, insert a blank line, then:

```
5. Prove the section-norm identity
   `Δ⁺|φ|²+2|∇φ|²=2Re⟨∇*∇φ,φ⟩` and Kato's inequality. The classical derivative
   formula is on φ≠0; at its zero set prove the Sobolev weak/a.e. inequality
   using `√(|φ|²+ε²)` and the completed K5a weak-regularity/domain API.
```

Re-running the grep then lists items 1–8 in order.

## R02 (P3) — The new vertex-pole route uses R4.3's covering criterion, which R5a.3's *Needs:* omits

**Location.** README lines 3105–3113 (R5a.3): "on the complete surface it is a covering map by the argument of Nicolaescu … the pulled-back metric on the tangent plane is positive definite and complete … A covering of the simply connected S by the connected tangent plane has one sheet". The *Needs:* line (lines 3170–3172) lists HopfRinow Layers 2–4, R2, R3 and R5a.2. Layer 5 `### Dependencies` (line 3308) says "R5a.3 additionally uses R2 and HopfRinow."

**Claim.** The route introduced in this round has three inputs that are named nowhere in R5a.3:

- **The covering step.** "A local Riemannian isometry from a nonempty complete manifold to a connected manifold is a surjective covering" is this roadmap's R4.3 item 3 (README lines 2167–2171). Nicolaescu's proof reaches it through his Exercise 6.2.5.
- **The pulled-back metric `exp*g`.** This is Tau Ceti's `Bundle.ContMDiffRiemannianMetric.pullback` (contract, README lines 477–481).
- **The one-sheet step.** This follows from Mathlib's monodromy lemma for coverings.

R4.4 lists R4.3 for the same argument (line 2201). R5a.3 does not, so an implementer of R5a.3 cannot see that it is blocked behind R4.3. Each input exists, so the target is not unowned; the *Needs:* line is incomplete.

**Witness.** Nicolaescu's proof (`nicolaescu-lectures` lines 10634–10639, p. 238) ends with "The theorem now follows from Exercise 6.2.5". That exercise (lines 10624–10628) asks for a surjective local isometry from a complete manifold to be a covering. At the pin, `IsCoveringMap.liftPath_apply_one_eq_of_homotopicRel` is at `Mathlib/Topology/Homotopy/Lifting.lean:379`.

**Repair.**

- Append to R5a.3's *Needs:* line: "R4.3 (a local Riemannian isometry from a complete manifold onto a connected one is a covering); Tau Ceti `Bundle.ContMDiffRiemannianMetric.pullback` (the metric exp*g on the tangent plane); Mathlib `IsCoveringMap.liftPath_apply_one_eq_of_homotopicRel` (a covering of a simply connected space by a path-connected one has one sheet)".
- Change Layer 5 `### Dependencies` to "R5a.3 additionally uses R2, R4.3 and HopfRinow."

R4 precedes R5, so this adds no cycle.

## Verified sound

**Gate and dependency check.** I re-ran the gate at ea3cb9e: `gate RiemannianGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The dependency check gives `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RiemannianGeometry'` is empty. Within the folder only `README.md` and `Suggested.lean` change; `Surfaces/` is untouched.

**Lean.**

- **Elaboration.** `lake env lean` on `Suggested.lean` gives 23 `declaration uses 'sorry'` warnings, at lines 109–600, and nothing else.
- **Padding probe.** On a scratch copy I replaced every `sorry` with `first | rfl | trivial | infer_instance | (simp; done) | (norm_num; done) | (aesop; done) | positivity | (exact le_rfl)`. All 23 fail. The four definitions (`IsEndpointZeroSmoothSection`, `indexForm`, `modelBallVolume`, `paraboloidGraph`) have real bodies and are needed to state headlines.
- **Signatures.** I compared `#check @name` for all 27 declarations with the README statements.
  - `IsEndpointZeroSmoothSection` drops `[FiniteDimensional ℝ E]`, `[I.Boundaryless]` and `[T2Space M]`, and `indexForm` drops `[I.Boundaryless]`. Neither body needs them, and `morse_index` carries all of them.
  - No theorem lost a binder, and nothing needed changing.

**Library declarations opened at the pins.**

- **Conjugate points and velocities (Tau Ceti).**
  - `TauCeti.Manifold.conjugateMultiplicity` (`Jacobi/Conjugate.lean:171`) is the dimension of `endpointJacobiFieldSpace hγ a t` (`:57`) inside `jacobiFieldSpace` (`Jacobi/Space.lean:49`), whose fields vanish off `Icc a b`. So the sum in `morse_index` is Milnor's.
  - `TauCeti.Manifold.curveVelocityWithin` (`MFDeriv/Curve.lean:135`) is `mfderivWithin … γ s t 1`, with junk value 0, as the contract says.
  - `TauCeti.Orientable` (`Orientation/Basic.lean:263`) asserts that a manifold orientation exists.
  - `CovariantDerivative.curvatureTensor` (`Curvature/Tensor.lean:152`) has argument order `x u v w ↦ R(u,v)w`. So `indexForm`'s `curvatureTensor (γ t) (X t) γ′ γ′` is `R(X,γ′)γ′`.
- **Weyl dimensions (Tau Ceti).** `TauCeti.oddOrthogonalWeylDimension` (`OddOrthogonal.lean:203`; one-row values `:299`, `:336`) and `TauCeti.evenOrthogonalWeylDimension` (`EvenOrthogonal.lean:183`; `:300`, `:363`) match the contract's `lᵢ`, `rᵢ` and binomials.
- **Shape operator (Tau Ceti).** `TauCeti.shapeOperator` (`ShapeOperator.lean:90`) and `TauCeti.secondFundamentalForm` (`SecondFundamentalForm.lean:82`) exist only for maps into inner-product spaces.
- **Locally symmetric curvature (Tau Ceti).** `CovariantDerivative.HasParallelCurvature` (`LocallySymmetric.lean:102`), `.hasParallelCurvature` (`:169`) and `hasParallelCurvature_iff_isLocallyConstant_scalarCurvature_of_finrank_eq_two` (`:221`).
- **Jacobi fields (Tau Ceti).** `IsJacobiFieldOn.wronskian_eq` (`Jacobi/Basic.lean:246`), `.eq_of_eq_of_alongCurveWithin_eq` (`Uniqueness.lean:161`), `.eq_zero_of_endpoints_eq_zero_of_sectionalCurvature_nonpos` (`Convexity.lean:176`) and `.exists_eq_curvatureCosine_smul_add_curvatureSine_smul` (`Model.lean:62`).
- **Covering monodromy (Mathlib).** `IsCoveringMap.liftPath_apply_one_eq_of_homotopicRel` (`Mathlib/Topology/Homotopy/Lifting.lean:379`).
- **All backticked identifiers.** A declaration index of the pinned Mathlib and Tau Ceti resolves 233 of the README's 253 backticked identifiers. Of the other 20:
  - 7 are the Tau Ceti declarations above.
  - 5 are roadmap targets on main: `basedLoopCWType`, `finiteSourceMappingCWType` and `reducedSuspensionSphereHomeomorph` (AlgebraicTopology), and `bundleDiskSphereRelCW` and `bundleDiskAttachmentCWModel` (CharacteristicClasses).
  - 8 are mathematical variables (`exp_p`, `u_i`, …).

**Cross-roadmap citations and ownership.**

- `roadmaps resolve` reports no unresolved cross-roadmap citation against main and the 457 open heads.
- ClassicalGroups on main has Layer 3 (line 237, "State the highest-weight classification for the connected groups first: SOₙ") and Layer 5 (line 297, "Give the Spₙ, SOₙ product forms likewise"), as the revised R8.3 cites.
- Overlaps: none dropped or added. #1187 also changes `Suggested.lean`; the description says "#1187 is rebased on this one".
- Ownership against the five closest open roadmaps:
  - PositiveMass §1.2 (head, lines 447–449) consumes R8.1–R8.2.
  - RicciFlow (head, line 1145) consumes R3's Morse index theorem.
  - CalibratedGeometry consumes R5a.1.
  - DifferentialGeometry mentions this roadmap once.
  - No second owner of the index form, Jacobi fields or spherical harmonics. `roadmaps grep 'indexForm|IsEndpointZeroSmoothSection|morse_index'` finds only this roadmap (main and #1187).

**Seeded sample, against the texts.**

- **§1.1.**
  - `andrews-dg-ch16` lines 101 and 105: Proposition 16.2.1, p. 154, with the slot convention `K(σ)=R(e1,e2,e1,e2)`.
  - `nicolaescu-lectures` line 8870 (Example 4.2.36, p. 195) and line 8888 (Exercise 4.2.38, p. 196, dimension ≥ 3).
- **§1.2.** `nicolaescu-lectures` line 4630: (3.3.7), p. 103, parallel transport as the solution of `∇_(d/dt)u=0`.
- **§1.3.**
  - `spacetime-guided-tour` lines 2919 and 2953: Lemmas 35 and 36, pp. 61–62.
  - `andrews-dg-ch16` lines 429–431: Corollary 16.8.5, p. 162. His `Rikjl=⟨∇_k∇_iE_j−…,E_l⟩` makes `R_ijkl=−⟨R(e_i,e_j)e_k,e_l⟩`, so `¼c_ijp c_klp` is `−¼[[X,Y],Z]` here, as the README says.
  - O'Neill is uncertified.
- **§2.1.** Milnor §14 and Lemma 14.4 are uncertified.
- **§2.2.**
  - `bishop-rg` lines 1885–1892: §6.11, the canonical frame by radial parallel translation, p. 41.
  - `bishop-rg` lines 1893–1904: Problem 6.12, connection forms `¼R(x dx−…)` vanishing at p.
  - `nicolaescu-lectures` lines 6793 and 6801: Proposition 4.1.25 and Lemma 4.1.26, p. 151.
  - `brewin-rnc` line 363 (p. 9) and lines 614–615: (11.1), p. 15, the `−⅙x^cx^dx^e∇_cR_adbe` term.
- **§2.3.** `bishop-rg` line 1872: Theorem 6.11, p. 41, `g_ij=δ_ij−⅓R_ihjk x^h x^k`.

**New locators of this round.**

- **Hatcher.**
  - `hatcher` line 20284: Theorem 4J.1, printed p. 471 (running head at line 20269), for connected CW complexes X.
  - `hatcher` line 12578: Proposition 3C.8, printed p. 288 (line 12543), for H_*(X;R) free.
  - S^(n−1) is a connected CW complex exactly when n ≥ 2, which matches `hn`.
- **Taylor.** All in `taylor-lie-groups`:
  - Line 14272: (8.2.2), p. 398.
  - Lines 14318–14319: (8.2.13), `λ²_k=k²+(n−2)k`, p. 399.
  - Line 14338: Proposition 8.2.1, p. 399.
  - Line 15017: "we will assume n ≥ 3", p. 415.
  - Line 15035: Proposition 8.4.2, p. 415.
  - Line 15222: Proposition 8.5.1, p. 421, for SO(n) acting by `f(R⁻¹ω)` (line 15191).
- **Wilson.** `wilson-dg-examples-3` line 78: Problem 14*, p. 2.
- **Nicolaescu.**
  - `nicolaescu-lectures` line 9512: Theorem 5.1.17 (Clairaut), p. 212.
  - `nicolaescu-lectures` lines 10630–10639: Theorem 6.2.6 and its proof, p. 238. Definition 6.2.1 (line 10606) allows empty preimages.

**Headline locators re-confirmed.**

- `eschenburg-comparison` line 346 (Theorem 3.3, p. 13) and line 372 (Rauch I, p. 14).
- `kwong-volume-comparison` line 1766: Theorem 10, p. 27.
- `zhu-ricci-comparison` line 292 (Theorem 3.1, p. 226) and line 426 (Corollary 3.3, p. 228).
- `nicolaescu-lectures`: line 9923 (Theorem 5.2.26, p. 220), line 10851 (Example 6.2.29, p. 243) and line 30622 (Theorem 12.2.5, p. 661).
- `bishop-rg` lines 2302 and 2324: Theorem 7.9 and Problem 7.11, p. 50.
- `spacetime-guided-tour` line 2845: Theorem 9, p. 60.
- `petersen-wink-bochner` line 39: Corollary, p. 1.

**Adversarial table** (values computed by me).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 item 4, `24r=B_Q(x,w;y,z)−B_Q(y,w;x,z)` | K=1 orthonormal x,y with z=y, w=x; ω-form on ℝ⁴ | 16−(−8)=24=24·1; ω: 8−(−8)=16≠24 | holds; negative control correct | none |
| §1.2 local symmetry and Einstein factor | `dx²+e^(2x²)dy²`; unit and radius-2 S³ | K=−2−4x², ∂ₓK(1)=−8; a=2 and ½ | holds | none |
| §1.3 warped curvature | (0,π)×_sin S², t=π/3; `dx²+e^(2x)dy²`; ℝ³∖0 | Ric(V,V)=4/3+2/3=2 (Δ⁺ reading gives 0); −f″/f=−1; vertical Ric 0 | holds | none |
| §1.3 O'Neill A, T and bi-invariant | `e^(2x)`, `e^(4x)`; Hopf S³→CP¹; `∇_XY=½[X,Y]` | T_UU=−∂x, −2∂x; \|A\|=1, K=1+3=4; R=¼[[X,Y],Z]−½[[X,Y],Z] | holds | none |
| §1.3 projective normalisation | X=[[0,−1],[1,0]]; diag(0,i) | −trX²/2=1=\|Xe₂\|; ½ vs 1 | holds | none |
| §1.3 conformal laws | Δ⁺=−Δ substitution | `Scal̃=e^(−2u)(Scal+2(n−1)Δ⁺u−(n−1)(n−2)\|du\|²)` matches the Δ form | holds | none |
| §2.1 Jacobi Checks | great circle, sin t·E; flat t²E | −sin t·E+sin t·E=0; residual 2E | holds | none |
| §2.2 transported frame | unit S², t=π/2; octant triangle | \|E_Y\|=1 vs 2/π≈0.637; holonomy π/2 | holds | none |
| §2.2 and §2.3 jets | unit S², e_a⊥v; λ_j rescaling | sin²t=t²−t⁴/3+…; Bishop δ−⅓\|v\|²; K(λ²g)=λ⁻²K, correction O(λ⁻²) | holds | none |
| `exists_jacobi_initial_data` | flat; constant geodesic | X=u+(t−a)v realises (u,v); solution space 2n | holds | none |
| `IsEndpointZeroSmoothSection` | sin(πt)E; tE; tent on [0,1] | in; fails X(1)=E; fails smoothness at ½ | discriminates | none |
| `indexForm` | flat sin(πt)E; S² sin(2t/3)E on [0,3π/2]; sign flip | π²/2; π/3−3π/4=−5π/12; π/3+3π/4>0 | sign pinned | none |
| `morse_index` | constant γ; great circle [0,π], [0,3π/2], [0,2π]; dim E=0 | 0=0; 0 (nullity n−1); n−1; n−1, not 2(n−1); only k=0 qualifies (form of 0 is 0) | holds | none |
| `singularHomology_loopSpace_sphere` | n=2, 3; n=1 | T(ℤ in degree 1): ℤ in every degree; ℤ in even degrees; H₀(ΩS¹)=⊕ℤ excluded by hn | holds | none |
| R3.4 degree convention | n=2 at v=e₂, s=¼; n=3; interval-first | det(e₂,−e₁,−e₀)=−1; det(e₂,e₃,e₁,−e₀)=+1; sign change (−1)^(n−1) gives +1 always | holds | none |
| `rauch_norm_ge_of_sectional_le` | sphere of radius 5/2, κ=1 | t=π/2: 1≤2.5 sin(π/5)=1.4695; t=5π/2: 1≤0 fails, excluded by guard | holds | none |
| `synge`, `synge_orientable_of_odd` | RP², T², RP³ | π₁=ℤ/2 nonorientable; K=0; odd, orientable, π₁=ℤ/2 | holds | none |
| `modelBallVolume` | (n,κ)=(2,0), (2,1), (3,0), n≤1 | r²/2; 1−cos r (2 at π); r³/3; r | holds | none |
| `guenther` | unit S², κ=1; n=1 | 2·(1−cos r)·π=2π(1−cos r)=vol; 2r=2r | equality, holds | none |
| `bishopGromov` | unit S² with flat model; H² | 2.888, 2.224, 1.273 at r=1, 2, π; 3.41, 4.34 increasing (excluded by Ric) | holds | none |
| `cartanHadamard_isCoveringMap` | ℝⁿ; flat torus | exp a translation; ℝⁿ→Tⁿ covering | holds | none |
| `bonnetMyers_distance`, `myers_finite_fundamentalGroup` | unit Sⁿ, λ=n−1; RPⁿ; n=1 | bound π=diam; π₁=ℤ/2; excluded by hdim | holds | none |
| `two_distinct_geodesics` | unit circle, angles πt/2 and −3πt/2 | same ends, points differ at t=½ | holds | none |
| `killingHopf_*` | n=0; n=1 | point; line not a circle (spherical excluded); (0,∞) with dt²/t² ≅ ℝ | holds | none |
| R4.7 new Checks | ball c\|dx\|²/(1−\|x\|²)²; d=log 3; hyperboloid; antipodal | K=−4/c; log((1+½)/(1−½))=log 3, tanh(d/2)=½; Lorentz square 1 vs cosh 2s; (−1)^(n+1) | holds | none |
| `three_simple_closed_geodesics` | round S² | three great circles; Ico-injectivity excludes double traversal | holds | none |
| `paraboloid_geodesic_crossings` | a=1; circle r≡1; bounds; crossing angle | r″(0)=1/(a(1+4a²))=1/5; residual −1; integrands ≥2s and 2a/s; θ(t_n)−θ(−t_n)=2(n+1)π; det=2ar′/R²>0 | holds | none |
| `paraboloid_vertex_pole` | vertex K; sphere of curvature 4 | K(0)=4/(1+0)²=4; Jacobi length r(ℓ)>0 vs sin(2ℓ)/2=0 at π/2 | holds; route Needs incomplete | R02 |
| R5a Gauss and Ricci equations | unit sphere; derivation from ∇^N_Xη=−S_ηX+∇^⊥_Xη | B=−⟨X,Y⟩ν; ⟨R^⊥η,ξ⟩=⟨R^Nη,ξ⟩+⟨[S_η,S_ξ]X,Y⟩ | holds | none |
| R5a.2 paraboloid H, K | z=r² | k₁=2/(1+4r²)^(3/2), k₂=2/(1+4r²)^(1/2): mean (2+4r²)/(1+4r²)^(3/2), K=4/(1+4r²)² | holds | none |
| R5b Dirichlet operator | Q=2uv; Q=−uv with c=2, 3; equator arc ℓ=3π/2 | L_D=2; −1 both ways (sign error 3); 4/9−1=−5/9, index 1 | holds | none |
| R6 `I_M` | unit circle, γ=(1−t,0), X=(1−t/b)(0,1) | 1/b−1: negative for b>1, kernel at b=1 | holds | none |
| R7.0 Bochner | f=x² on ℝ | −8+8+0=0 (dropping the 2 gives −4) | holds | none |
| R7.4 `ℛ_p` Checks | unit Sⁿ; S²×S²; degree 2 in dimension 2 | Σaᵢ*aⱼaᵢ*aⱼ=N and Σaᵢ*aⱼaⱼ*aᵢ=N(n−N+1), so ℛ_p=−p+p(n−p+1)=p(n−p), ℛ₁=n−1; R^Λ(e₁,e₂)(e¹∧e²)=a₁*(−e¹)−a₂*(e²)=0; Σaᵢ*aᵢ=2 | holds | none |
| R7 item 5 | numbered list | items 1, 2, 3, 4, 6, 7, 8 | item 5 lost its line | R01 |
| `subsingleton_deRhamCohomology_one_of_ricciTensor_pos` | flat S¹; S² minus two points | b₁=1 with Ric=0; b₁=1, noncompact | holds | none |
| `…_of_curvatureEndomorphism_pos` | S²×S²; Sⁿ minus two points | Rop≥0, b₂=2; b_(n−1)=1 | holds | none |
| `riemannianDist_eq_sSup_smooth` | ℝ, clamped identity | \|f x−f y\|=\|x−y\| | holds | none |
| `eq_harmonicSphereRestriction_of_laplaceBeltrami_eq_neg_mul` | S¹ cos θ; S² X₃, X₁X₂; S⁰ | λ=1; 2 and 6 (Δ⁺ reading −2); f(±1)=1,2 not in H₀∪H₁; Taylor k(k+n−2)=d(d+m−1) with n=m+1 | holds | none |
| `harmonic_irreducible` | N=2, 3, 4, 5 | two lines (x₁±ix₂)^d; 2d+1; (d+1)²; d=2: 14=15−1 | holds | none |
| R8.3 Weyl contract | B₁ at (d); D₂ at (d,0); N=2n+3 | (d+½)/½=2d+1; (d+1)²/1; binomial(d+2n+1,2n+1)=binomial(d+N−2,N−2), and Pascal gives dim H_d | holds | none |

## Not verifiable

- **Uncertified in the manifest; cited by locator only.**
  - Milnor, *Morse Theory*: Theorem 15.1, p. 83, now the `morse_index` docstring's locator; Theorem 14.1; §6; §§13–17.
  - O'Neill, Theorem 2 and Corollary 1.
  - Lee, *Introduction to Riemannian Manifolds*, Chapter 10.
  - Fulton–Harris, Lectures 18–19.
  - I checked Milnor's index statement against the computations in the table, not against the text.
- **Not in the package `sources.toml` and outside the seeded sample.** Homma, Azagra–Ferrera–López-Mesas–Rangel, Axler–Bourdon–Ramey, Toth–Ziller, Wang, Gage, Ma, Lauer, Grayson, Angenent, White, Allen–Layne–Tsukahara and Dobbins. This review edits no manifest, so I did not fetch them.
- **Not checked line by line.** The R4.9.6 curve-shortening programme (README lines 2601–2785), which is unchanged in this round. I spot-checked the Gauss–Bonnet identities ∫k ds+Area=2π for a disk and 0 for an annulus, the colatitude Fréchet distance r+2π sin r, and the latitude-π/6 endpoint distance `arccos(3/4+cos(2s)/4)`.
- **Ownership against open pull requests.** Checked against the sibling heads given (PositiveMass, RicciFlow, CalibratedGeometry, DifferentialGeometry) and by `roadmaps grep` over all 457 open heads. I did not check open pull requests whose files the brief does not give, beyond that grep.

## Source issues

- **Misprint** in taylor-lie-groups at §8.2, (8.2.11), p. 399: the source says the exponent of `r` must be positive; it should be nonnegative, since `k=0` (constants, eigenvalue 0) is admitted by (8.2.12); affects nothing.
- **Gap** in nicolaescu-lectures at proof of Theorem 6.2.6, p. 238: the source concludes by Exercise 6.2.5, which needs a surjective local isometry, while `exp_q` reaches only the component of q; it should assume M connected or apply the exercise componentwise; affects the proof.
- **Gap** in nicolaescu-lectures at Exercise 4.2.38, p. 196: the source says an Einstein manifold of dimension ≥3 has constant scalar curvature; it should assume M connected (unit and radius-two S³, disjoint, give a=2 and ½); affects nothing.
