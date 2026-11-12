# Review of RiemannianGeometry (pull request #2226 at 3866361)

**Verdict:** needs changes

## R01 (P3) — The new consumer sentence gives the sub-roadmap R4.4, which it never uses

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md` lines 4031–4033: "The sub-roadmap [Minimal surfaces](MinimalSurfaces/README.md) consumes R1's Euclidean limits of rescaled metrics, R3, R4.1–R4.5, R5a, R5b, R5c, R7.0, R7.6, R7.9 and R8.2."

**Claim:** The range R4.1–R4.5 includes R4.4 (Cartan–Hadamard, R4 item 4, line 2217). MinimalSurfaces does not consume R4.4, so the sentence records a supply edge that does not exist. The description's MS1 bullet repeats the same range.

**Witness:** `MinimalSurfaces/README.md` has 0 matches for `R4\.4`, `Cartan` and `Hadamard`. Its MS1 (lines 149–285) cites only R4.1, R4.2, R4.3 and R4.5 from R4.

**Repair:** Replace "R3, R4.1–R4.5, R5a" with "R3, R4.1–R4.3, R4.5, R5a". In the description's MS1 bullet, replace "R4.1–R4.5" with "R4.1–R4.3, R4.5".

## R02 (P3) — Two R1-owned theorems of §1.1 have no locator

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md` lines 923–924: "Flat curvature on an open set is equivalent to a local Euclidean isometry around every point of that set." Lines 892–895: "R1 owns … the moving-frame form of R and ∇R through the connection 1-forms of a smooth local frame".

**Claim:** §1.2 (lines 986–988) names the flat ⇔ locally Euclidean equivalence as owned here, and item 1 owns the moving-frame form. Neither cites a source.

**Witness:** spacetime-guided-tour line 2122 (p. 46, Theorem 7) states flat ⇔ R=0 and cites Lee's second edition, Th. 7.10 (line 2121, reference line 5289). bishop-rg line 578 (§3.11, p. 13) gives the second structural equation Φ = dϕ + ϕ∧ϕ.

**Repair:** After "around every point of that set." insert "(Lee, *Introduction to Riemannian Manifolds*, second edition, Theorem 7.10; Barzen–Leymann, *Mathematics of Spacetime*, Theorem 7, p. 46)". After "components smooth on the frame's domain." insert "(Bishop, *Riemannian Geometry*, §3.11, p. 13, the second structural equation; Bishop's curvature operator is the negative of ours, so his Φ is the matrix of our R)".

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result |
|---|---|---|---|
| 1.1 item 4, `24r=B_Q(x,w;y,z)−B_Q(y,w;x,z)` | orthonormal x,y, K=+1, z=y, w=x | B_Q(x,x;y,y)=Q(2x,2y)=16; B_Q(y,x;x,y)=0−4−4+0=−8; 16+8=24=24·r | holds |
| 1.1 item 4, reduction | expansion over s,t=±1, then skew symmetries and Bianchi | B_Q(x,w;y,z)=8(r(x,y,z,w)+r(x,z,y,w)); difference 8(2r+r(x,z,y,w)−r(y,z,x,w))=24r | holds over any commutative ring |
| 1.1 item 4 Check without Bianchi, r=ω⊗ω | (e₁,e₂,e₃,e₄) on ℝ⁴ | B_Q terms 8 and −8, so the right side is 16; 24r=24; cyclic sum 1≠0 | Check correct |
| 1.1 item 2, constant curvature in dimensions 0 and 1 | u=aw, v=bw | ⟨u,v⟩w−⟨w,v⟩u=ab\|w\|²w−ab\|w\|²w=0=R for every κ; slot order matches Tau Ceti `Metric.lean:141` | holds |
| 1.1 item 3, Einstein constancy | unit S³; radius-2 S³; dimension 1 | a=2 and a=½, so a disjoint union is not constant; dimension 1 has Ric=0 and a=0; pin needs finrank≠0, ≠2, preconnected | holds |
| 1.1 item 3, flat ⇔ locally Euclidean | flat T²; unit S² | R=0 with Euclidean charts; R≠0 with no Euclidean chart | true; no locator (R02) |
| 1.2 Check g=dx²+e^(2x²)dy² | K=−G″/G, G=e^(x²) | G″=(2+4x²)G, so K=−2−4x²; ∂ₓK(1)=−8≠0 | holds |
| 1.2 Checks on spheres | metric ×4; S³ of radius 2 | K=1/4 with ∇R=0; Ric=2·¼g=½g | holds |
| 1.3 warped R(V,W)U, R(V,X)Y | (0,π)×_sin S^k | vertical: 1/sin²t−cot²t=1; mixed: −(−sin t)/sin t=1; opposite sign to Barzen–Leymann L35 | holds |
| 1.3 warped Ric(V,V), sign of Δ | k=2, t=π/3 | (k−1)/sin²t−(−1+(k−1)cot²t)=4/3+2/3=2; reading Δ⁺ gives 0 | holds |
| 1.3 warped, flat case | ℝ^(k+1)∖0 with f=r | Hess f=0 and \|grad f\|²=1 cancel R_N; vertical Ric (k−1)−(k−1)=0 | holds |
| 1.3 conformal Scal̃ | n=2, u=log(2/(1+r²)) on ℝ² | Δu=−4/(1+r²)²; e^(−2u)(0−2Δu)=2, the unit sphere | holds |
| 1.3 bi-invariant R=−¼[[X,Y],Z] | Jacobi identity; Andrews' R(u,v,w,z)=g(R(v,u)w,z) | ¼[X,[Y,Z]]−¼[Y,[X,Z]]−½[[X,Y],Z]=−¼[[X,Y],Z]; this gives Andrews' ¼c_ijp c_klp | consistent |
| 1.3 Rop contractions | orthonormal basis; S²×H² | Σ⟨R(e_i,u)u,e_i⟩=Ric(u,u); tr Rop=Σ_(i<j)K_ij=Scal/2; eigenvalues +1, −1 and four 0 | holds |
| 1.3 O'Neill T Checks | dx²+e^(2x)dy²; dx²+e^(4x)dy² | Γˣ_yy=−e^(2x) gives T_UU=−∂x; Γˣ_yy=−2e^(4x) gives −2∂x | holds |
| 1.3 projective normalization | [[0,−1],[1,0]]; diag(0,i); complex line in S³ | 1=\|Xe₂\|²; ½ against 1; K=1+¾·4=4; radius ½ gives CP¹ area π | holds |
| 2.1 Jacobi Checks | flat u+tv; sin t·E on S²; flat t²E | residuals 0, −sin t E+sin t E=0, and 2E≠0 | holds |
| 2.2 cubic jet | J‴(0)=−R(e_i,v)v, J⁗(0)=−2(∇_vR)(e_i,v)v | ⟨J_i,J_j⟩/t²=δ−⅓⟨R⟩t²−⅙⟨∇R⟩t³; S²: sin²t=t²−t⁴/3+…; Bishop R^B=−R agrees | holds |
| 2.2 transported-frame Checks | S² at t=π/2; octant triangle | coordinate norm sin t/t=2/π against 1; holonomy π/2 equals area 4π/8 | holds |
| 2.3 Euclidean limits of rescaled metrics | g_j=λ_j²F_j*g on \|x\|≤L; Euclidean g; n=1 | (exp*g)(E_je_a,E_je_b) at E_jx/λ_j is δ+O(L²λ_j⁻²); K(g_j)=λ_j⁻²K; δ exactly | holds |
| R01: parent sentence against MS1 | MinimalSurfaces citations | R4.1: 15, R4.2: 3, R4.3: 3, R4.5: 6; R4.4, Cartan, Hadamard: 0 | range overstates |
| `exists_jacobi_initial_data` | flat line; S² great circle; a=b | u+(t−a)v; normal part u cos(t−a)+v sin(t−a); a<b excludes the singleton | holds |
| `indexForm`, `IsEndpointZeroSmoothSection` | X=fE on a unit great circle | ⟨D_tX,D_tX⟩−⟨R(X,γ′)γ′,X⟩=f′²−f² | matches docstring |
| `morse_index` | Sⁿ great circle on [0,π] and [0,3π/2]; constant geodesic | 0 and n−1; f=sin(2t/3) gives (3π/4)(4/9−1)<0; constant geodesic has index 0 | holds |
| `singularHomology_loopSpace_sphere` | n=2, 3; n=1 | ℤ in every degree; ℤ in even degrees and 0 in odd; ΩS¹ H₀ of infinite rank, excluded by hn | holds |
| `rauch_norm_ge_of_sectional_le` | κ=0 flat; κ=1 S²; κ=−1 H² | t=t; sin t=sin t; sinh t=sinh t (equality); tangential field excluded by hnormal | holds |
| `synge` | S²; RP²; flat T²; dimension 0 | π₁=1; nonorientable; K=0; a point | holds |
| `synge_orientable_of_odd` | RP³; S¹ | orientable with π₁=ℤ/2; orientable, curvature hypothesis vacuous | holds |
| `modelBallVolume` | κ=1, n=2; κ=0, n=3; n=0, 1 | 1−cos r; r³/3; r | matches docstring |
| `guenther` | S² with κ=1, r<π; complete 1-manifold | 2π(1−cos r) on both sides; 2·r=2r on both sides | holds |
| `bishopGromov` | ℝⁿ with κ=0; circle of length L, n=1 | ratio n·vol(Bⁿ), constant; min(2r,L)/r nonincreasing | holds |
| `cartanHadamard_isCoveringMap` | flat T²; ℝ²∖0 | ℝ²→T² is a covering; ℝ²∖0 is incomplete, excluded | holds |
| `bonnetMyers_distance` | unit Sⁿ with λ=n−1 | π√1=π, the diameter | holds, sharp |
| `myers_finite_fundamentalGroup` | RPⁿ | π₁=ℤ/2 | holds |
| `two_distinct_geodesics` | S² with non-antipodal p,q; S¹ | short and long great-circle arcs; the two directions | holds |
| `killingHopf_euclidean` | n=0, 1 | a point; ℝ (S¹ is not simply connected) | holds |
| `killingHopf_sphere` | n=1 | ℝ satisfies K=1 vacuously and is not S¹, so 2≤n is needed | holds |
| `killingHopf_hyperbolic` | n=1 | (0,∞) with dt²/t² is isometric to ℝ via log t | holds |
| `three_simple_closed_geodesics` | round S²; triaxial ellipsoid | infinitely many great circles; exactly three principal ellipses | holds |
| `paraboloid_geodesic_crossings` | meridian | angular momentum 0, excluded by hmomentum; meridians do not cross themselves | holds |
| `paraboloid_vertex_pole` | f=r² | K=f′f″/(r(1+f′²)²)=4/(1+4r²)², 4 at the vertex; no critical point of exp | holds |
| `subsingleton_deRhamCohomology_one_of_ricciTensor_pos` | flat S¹; S² minus two points; Sⁿ | Ric=0 with b₁=1; noncompact with b₁=1; b₁=0 | holds |
| `subsingleton_deRhamCohomology_of_curvatureEndomorphism_pos` | S²×S²; Sⁿ; n=2 | Rop≥0 with b₂=2; Rop=Id with b_p=0; Rop>0 means K>0 and b₁=0 | holds |
| `riemannianDist_eq_sSup_smooth` | ℝ with x≠y; x=y | a smoothed clamp of t attains \|x−y\|; sup{0}=0 | holds |
| `eq_harmonicSphereRestriction_of_laplaceBeltrami_eq_neg_mul` | S¹ with cos dθ; S² with z; S⁰ | λ=d²; λ=2=1·2; S⁰ excluded by hm | holds |
| `harmonic_irreducible` | N=2, d=1; N=3, d=1; d=0 | characters e^(∓iθ), excluded by hN; ℂ³ irreducible; constants | holds |

- Previous findings: R01 (r37) is repaired. The description now says "This pull request merges after #2222 (R5c), #2223 (R7.9), #2224 (R4.1 smooth upper distance barriers) and #2225 (Surfaces Layer 6)", and R5c and R7.9 are at #2222 line 3387 and #2223 line 3832. R02 (r37) is repaired: lines 22–24 now read "monotonicity for smooth proper minimal immersions and the boundary form of the tangency principle (the interior principle is GeometricCurrents G6's)", matching GeometricCurrents line 703 on main.
- Source locators: 16 checked against the text, each matching its number and printed page. andrews-dg-ch16: lines 105 (p. 154) and 429 (p. 162). nicolaescu-lectures: lines 4604–4630 (pp. 103–104), 6793 and 6801 (p. 151), 8870 (p. 195), 8888 (p. 196). spacetime-guided-tour: lines 2919 (pp. 61–62), 2953 (p. 62), 2122 (p. 46). bishop-rg: lines 1872, 1885, 1893 (p. 41) and 578 (p. 13). brewin-rnc: lines 363 (p. 9) and 614 (p. 15).
- Library at the pins: all 56 namespaced names of Layers 1–2 and the 5 unqualified Jacobi names of §2.1 resolve. Opened: `Einstein.lean:162`, `Schur.lean:197`, `Scaling.lean:298`, `Curvature/Metric.lean:141`, `LeviCivita/Prod.lean:82` and `LeviCivita/WarpedProd.lean:150`. `Jacobi/Comparison.lean:50` is only the κ=0 norm bound, so Rauch is not proved at the pin. `SecondFundamentalForm.lean:82` and `ShapeOperator.lean:90` are maps between normed spaces only, so the docstring's not-statable list holds.
- Cross-roadmap citations resolved: SBC B6.0 (main line 1306: uniform normal radius on compacts, variable-base exp), B5.0, B1.4, B1.5, B2.1 and B4.1; ComplexKahlerGeometry K7.1 (2700) and K5a (1440); RepresentationTheory/LieGroups Layers 0–2. Two overlap leads are false: GeneralizedCohomology G4.0b is defined on main at line 1082, and #1807's anchor change is mapped by its former-numbering table (line 488). The resolver lead AlgebraicTopology AT4.6 is §4.6 on main (line 1666).
- Gate: the worker's gate at 3866361 passes every check. The dependency check prints `depcheck: 206 roadmaps, 1912 edges, 0 problem(s)`. `git diff --stat` outside the two roadmap folders is empty.
- Elaboration: `lake env lean` on `Suggested.lean` gives 23 `declaration uses 'sorry'` warnings and nothing else. `#check @` signatures: `IsEndpointZeroSmoothSection` drops `FiniteDimensional`, `Boundaryless` and `T2Space`, and `indexForm` drops `Boundaryless`. Their bodies use none of these, and `morse_index` carries them. The entry `is` is a docstring artefact.
- One-tactic probe (`first | rfl | trivial | infer_instance | simp`) on a scratch copy: 23 errors, so it closes none of the 23 theorems.
- Overlap check: read RicciFlow, PositiveMass, Surfaces (main), LorentzianGeometry (#2232), DGFloerPartII, SmoothBundlesConnections (#2127), GeometricCurrents G6 and CanonicalModelsAndGonality §8.4. Each consumes R1–R8 and none owns them. The interior tangency principle is G6's. Hersch balancing and λ₁A≤8πd are claimed by MinimalSurfaces 10.3–10.4 and by CanonicalModelsAndGonality §8.4 (#1726); that is the MinimalSurfaces review's matter.

## Not verifiable

- milnor-morse-theory (§14 p. 77, Lemma 14.4 pp. 80–81, Theorem 15.1 p. 83; used by §2.1 and `morse_index`): settled as uncertified, with no legal text in the cache.
- oneill-submersion (Theorem 2 and Corollary 1; used by the §1.3 projective block): settled as uncertified, with no legal text in the cache.
- lee-irm (Theorem 7.10, proposed in R02): settled as uncertified. Its content is confirmed only through spacetime-guided-tour line 2121, which cites it.

## Source issues

- **Gap** in andrews-dg-ch16 at Proposition 16.2.1, p. 154: the polarization formula uses sectional curvatures of the planes spanned by e_i±e_k and e_j±e_l, which are orthonormal only for pairwise distinct indices; it should treat components with a repeated index separately, or use the unnormalized numerator; affects the proof.
- **Misprint** in andrews-dg-ch16 at §16.1, p. 151: the defining display of R(X,Y)Z differentiates twice along Y in its second term; it should be the second derivative along X then Y, ∇_X∇_Y Z; affects nothing.
- **Misprint** in andrews-dg-ch16 at the proof of Proposition 16.1.1, p. 151: the bracket term is expanded with [X,Y] where the definition has [Y,X], so the coefficient claimed to vanish is −2[X,Y](f); with [Y,X] it vanishes; affects the proof.
