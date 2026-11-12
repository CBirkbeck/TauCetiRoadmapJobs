# Review of RiemannianGeometry (pull request #2226 at cfff95b)

**Verdict:** needs changes

## R01 (P3) — R5c and R7.9 are cited but defined only by unmerged revisions; no merge order is stated

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md` lines 4029–4031: "consumes R1's Euclidean limits of rescaled metrics, R3, R4.1–R4.5, R5a, R5b, R5c, R7.0, R7.6, R7.9 and R8.2."

**Claim:** Neither main nor this head defines R5c or R7.9. They exist only at the heads of the open revisions #2222 and #2223 of this roadmap. The description says only "the merge of this branch with the four suppliers" and never names them, so merging this pull request first leaves two dangling ids on main.

**Witness:** main's `RiemannianGeometry/README.md`: 0 matches for `R5c|R7\.9`. At this head the only match is line 4030. `### R5c.` is at #2222 README line 3347, and `### R7.9.` is at #2223 README line 3746.

**Repair:** Add to the description: "Merge order: this pull request merges after #2222 (R5c), #2223 (R7.9), #2224 (R4.1 smooth upper distance barriers) and #2225 (Surfaces Layer 6), whose sections the parent's Downstream consumers sentence and MinimalSurfaces MS1 cite." Alternatively, rebase this branch on those four.

## R02 (P3) — The parent's ownership sentence gives the sub-roadmap the tangency principle, which GeometricCurrents G6 owns

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md` lines 21–22: "owns the theory of smooth minimal hypersurfaces built on R5a and R5b: minimal graphs, monotonicity and the tangency principle, the half-space theorem,"

**Claim:** The sub-roadmap owns only the boundary form of the tangency principle and monotonicity for smooth proper immersions. It consumes the interior tangency principle (the strong one-sided maximum principle) and varifold monotonicity from GeometricCurrents G6. The parent sentence credits the sub-roadmap with both in full.

**Witness:** `GeometricCurrents/README.md` line 703 on main: "Own the strong one-sided maximum principle for smooth minimal hypersurfaces". `MinimalSurfaces/README.md` line 30 ("boundary form of the tangency principle") and lines 71–73.

**Repair:** Replace "monotonicity and the tangency principle" with "monotonicity for smooth proper minimal immersions and the boundary form of the tangency principle (the interior principle is GeometricCurrents G6's)".

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result |
|---|---|---|---|
| 1.1 item 4, `24r=B_Q(x,w;y,z)−B_Q(y,w;x,z)` | expansion by multilinearity; orthonormal pair in K=+1 | B_Q=8(r(x,y,z,w)+r(x,z,y,w)); difference 8(2r+r)=24r. K=1: 16−(−8)=24=24·1 | holds |
| 1.1 item 4 Check without Bianchi, r=ω⊗ω on ℝ⁴ | (e₁,e₂,e₃,e₄) | B_Q terms 8 and −8, right side 16; 24r=24; cyclic sum 1≠0 | Check correct |
| 1.1 item 3, Einstein constancy | unit S³, radius-2 S³, dimension 1 | a=2, a=1/2 (disjoint union shows connectedness is needed); dimension 1: Ric=0, a=0 | holds |
| 1.2 Check g=dx²+e^(2x²)dy² | K=−G″/G with G=e^(x²) | K=−2−4x²; ∂ₓK(1)=−8≠0, so ∇R≠0 | holds |
| 1.3 warped-product R | hyperbolic plane f=eˣ; S^(k+1) f=sin t; ℝ^(k+1)∖0 f=r | mixed K=−1 and 1; vertical K=1/sin²t−cot²t=1; flat case 0 | holds |
| 1.3 warped-product Ric(V,V), sign of Δ | k=2, t=π/3 on S³ | 4/3+2/3=2=k with Δ=div grad; reading Δ⁺ instead gives 0 | holds, sign pinned |
| 1.3 conformal Ric̃, Scal̃ | Δ=div grad forms; n=2 | −(Δu+(n−2)\|du\|²)=Δ⁺u−(n−2)\|du\|²; n=2: e^(−2u)(Scal−2Δu) | holds |
| 1.3 bi-invariant R=−¼[[X,Y],Z] against Andrews | Ad-invariance, Andrews' slot order | ⟨R(X,Y)Y,X⟩=¼\|[X,Y]\|²; Andrews R_ijkl=¼c_ijp c_klp equals ⟨R(e_i,e_j)e_l,e_k⟩ | consistent |
| 1.3 Rop contractions, S²×H² Check | orthonormal basis | Ric(u,u)=Σ⟨R(e_i,u)u,e_i⟩; tr Rop=Σ_(i<j)K_ij=Scal/2; eigenvalues +1, −1, four 0 | holds |
| 1.3 O'Neill T Checks | dx²+e^(2x)dy², dx²+e^(4x)dy² | Γˣ_yy=−e^(2x) gives T_UU=−∂x; Γˣ_yy=−2e^(4x) gives T_UU=−2∂x | holds |
| 1.3 projective normalization and Hopf curvature | X=[[0,−1],[1,0]], diag(0,i) | 1 and \|Xe₂\|=1; 1/2 and 1; K=1+3⟨X,JY⟩²∈[1,4]; CP¹ area π | holds |
| 2.1 Jacobi Checks | flat u+tv; sin t·E on S²; flat t²E | D²J+R(J,γ′)γ′ is 0, −sin t E+sin t E=0, and residual 2E | holds |
| 2.2 cubic normal-coordinate jet | Taylor series of J with J‴(0)=−R(e_i,v)v, J⁗(0)=−2(∇_vR)(e_i,v)v | ⟨J_i,J_j⟩/t²=δ−⅓⟨R⟩t²−⅙⟨∇R⟩t³; sphere: sin²t=t²−t⁴/3+O(t⁶) | holds |
| 2.2 transported-frame Checks | S² at t=π/2; octant triangle | coordinate norm 2/π against transported norm 1; holonomy π/2 equals area 4π/8 | holds |
| 2.3 Euclidean limits of rescaled metrics | g_j=λ_j²F_j*g at x, \|x\|≤L | coefficients (exp*g)_(E_jx/λ_j)(E_je_a,E_je_b)=δ+O(L²λ_j⁻²); K(g_j)=λ_j⁻²K(g) with c=λ_j² | holds |
| `exists_jacobi_initial_data` | flat line; S² great circle; a=b | u+(t−a)v; sin(t−a)E; a<b excludes the singleton | holds |
| `morse_index` | Sⁿ great circle on [0,π] and [0,3π/2]; constant geodesic | 0 and n−1; f=sin(2t/3): (3π/4)(4/9−1)<0; constant geodesic: index 0 | holds |
| `singularHomology_loopSpace_sphere` | n=2, 3; n=1 | ℤ in every degree; ℤ in even degrees, 0 in odd; ΩS¹ has H₀=⊕_ℤℤ, excluded by hn | holds |
| `rauch_norm_ge_of_sectional_le` | flat with κ=0; S² with κ=1; tangential X with κ=−1 | t=t; sin t=sin t; sinh t>t would fail, excluded by hnormal | holds |
| `synge` | S², RP², flat T², dimension 0 | π₁=1; RP² fails orientability; T² fails K>0; point | holds |
| `synge_orientable_of_odd` | RP³; S¹ (K hypothesis vacuous) | orientable with π₁=ℤ/2; S¹ orientable | holds |
| `modelBallVolume` | κ=1, n=2; κ=0, n=3; n=1 | 1−cos r; r³/3 (times 4π gives 4πr³/3); r | matches docstring |
| `guenther` | S² with κ=1; ℝ² with κ=1; n=0 | 2π(1−cos r) on both sides; πr²≥2π(1−cos r); 0≤vol | holds |
| `bishopGromov` | ℝⁿ with κ=0; circle of length L, n=1 | ratio ω_(n−1) constant; min(2r,L)/r nonincreasing | holds |
| `cartanHadamard_isCoveringMap` | flat T²; ℝ²∖0 | ℝ²→T² is a covering; incomplete ℝ²∖0 excluded by CompleteSpace | holds |
| `bonnetMyers_distance` | unit Sⁿ with λ=n−1 | bound π√1=π equals the diameter (sharp) | holds |
| `myers_finite_fundamentalGroup` | RPⁿ | π₁=ℤ/2, finite | holds |
| `two_distinct_geodesics` | S² with non-antipodal p,q; S¹ | short and long great-circle arcs; the two directions | holds |
| `killingHopf_euclidean` | n=0, 1 | a point; ℝ (S¹ is not simply connected) | holds |
| `killingHopf_sphere` | n=1 | ℝ satisfies K=1 vacuously and is not S¹, so 2≤n is needed | holds |
| `killingHopf_hyperbolic` | n=1 | {t>0} with dt²/t² is isometric to ℝ via log t | holds |
| `three_simple_closed_geodesics` | round S²; triaxial ellipsoid | infinitely many great circles; exactly three principal ellipses (sharp) | holds |
| `paraboloid_geodesic_crossings` | meridian | angular momentum 0, excluded by hmomentum; meridians do not self-cross | holds |
| `paraboloid_vertex_pole` | K=f′f″/(r(1+f′²)²) with f=r² | 4/(1+4r²)²; 4 at the vertex; model conjugate distance π/√4=π/2 | holds |
| `subsingleton_deRhamCohomology_one_of_ricciTensor_pos` | flat S¹; S² minus two points; Sⁿ | Ric=0, b₁=1 excluded; noncompact, b₁=1; b₁=0 | holds |
| `subsingleton_deRhamCohomology_of_curvatureEndomorphism_pos` | S²×S²; Sⁿ; n=2 | Rop≥0, b₂=2 excluded; Rop=Id, b_p=0; Rop>0 means K>0, b₁=0 | holds |
| `riemannianDist_eq_sSup_smooth` | ℝ with x≠y; x=y | a smoothed clamp of t attains \|x−y\|; sup{0}=0 | holds |
| `eq_harmonicSphereRestriction_of_laplaceBeltrami_eq_neg_mul` | S¹ with cos dθ; S² with z; S⁰ | λ=d²; λ=2=1·2; f=(1,2) on S⁰ excluded by hm | holds |
| `harmonic_irreducible` | N=2, d=1; N=3, d=1; d=0 | characters e^(∓iθ), excluded by hN; ℂ³ irreducible; constants | holds |
| R01: R5c, R7.9 | main, this head, open heads | main: 0 hits; head: line 4030 only; #2222 line 3347; #2223 line 3746 | defined only by open revisions |
| R02: tangency principle | GeometricCurrents on main; MinimalSurfaces scope | G6 line 703 owns the interior principle; MinimalSurfaces line 30 owns the boundary form | parent overclaims |

- Source locators checked against the text, 28 in all, every one matching its theorem number and printed page: andrews-dg-ch16 2 (Prop. 16.2.1 p. 154, Cor. 16.8.5 p. 162); nicolaescu-lectures 9 (§3.3.2 with (3.3.7) pp. 103–104, Prop. 4.1.25 and Lemma 4.1.26 p. 151, Ex. 4.2.36 p. 195, Ex. 4.2.38 p. 196, Thm 5.1.17 p. 212, Thm 6.2.6 p. 238, Thm 12.2.5(b) p. 661); bishop-rg 3 (Thm 6.11, §6.11, Problem 6.12, p. 41); brewin-rnc 2 (§5 p. 9, (11.1) p. 15); spacetime-guided-tour 2 (Lemma 35 pp. 61–62, Lemma 36 p. 62); hatcher 2; taylor-lie-groups 5; kwong-volume-comparison 1; petersen-wink-bochner 1; wilson-dg-examples-3 1.
- Library: the 56 Tau Ceti and Mathlib names of Layers 1–2 resolve at the pins. Four statements opened: `Jacobi/Basic.lean:59` (`IsJacobiFieldOn`, geodesic field included), `Riemannian/Scaling.lean:298`, `LeviCivita/WarpedProd.lean:150`, `AlongCurve/Regularity.lean:132`. The pinned `Jacobi/` has no existence theorem, so `exists_jacobi_initial_data` is not already proved.
- Cross-roadmap citations: R5c and R7.9 (R01); GeometricCurrents G6 (R02). The resolver lead "AlgebraicTopology AT4.6" is AlgebraicTopology §4.6, Projective spaces, on main: a false positive.
- Gate rerun at cfff95b: every check 0, OK. Dependency check: `depcheck: 206 roadmaps, 1912 edges, 0 problem(s)`. No change outside the two roadmap folders.
- `lake env lean` on `Suggested.lean` (unchanged by this pull request): 23 `declaration uses sorry` warnings and nothing else. `#check @` of every entry: `IsEndpointZeroSmoothSection` and `indexForm` drop only binders their bodies do not use, and `morse_index` carries them; the entry `is` is a docstring artefact.
- The one-tactic probe (`rfl | simp | infer_instance | trivial`) on a scratch copy closes none of the 23 theorems.
- Overlap check: read RicciFlow, PositiveMass, Surfaces (main), Surfaces at #2225, GeometricCurrents (main), ManifoldOptimization, DGFloer, DGFloerPartII and SmoothBundlesConnections. Shared objects and their owners: R1–R4 and R7.0, owned by RiemannianGeometry (RicciFlow, DGFloerPartII and ManifoldOptimization consume them); R5b's full-scalar stability inequality, owned by RiemannianGeometry (PositiveMass consumes it); the interior tangency principle, owned by GeometricCurrents G6 (R02). Hersch balancing with `λ₁·A ≤ 8π·deg` is also stated in CanonicalModelsAndGonality §8.4 (open); the owner is to be settled in the MinimalSurfaces review.

## Not verifiable

- milnor-morse-theory (§14 p. 77, Lemma 14.4 pp. 80–81, Thm 15.1 p. 83; used in 2.1 and by `morse_index`): settled as uncertified, no legal text in the cache.
- oneill-submersion (Theorem 2 and Corollary 1; used in the 1.3 projective block): settled as uncertified, no legal text in the cache.

## Source issues

- **Gap** in andrews-dg-ch16 at Proposition 16.2.1, p. 154: the explicit formula uses sectional curvatures of planes spanned by e_i±e_k and e_j±e_l, which are defined only for pairwise distinct indices; it should treat components with a repeated index (all components when n≤3) separately or use the unnormalised numerator; affects the proof.
