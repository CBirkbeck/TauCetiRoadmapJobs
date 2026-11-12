# Review of RiemannianGeometry (pull request #2226 at 4788ed5)

**Verdict:** accepted

## Previous findings

- R01 (previous review of `9cfb02f`): repaired. The description now reads "**Edits to the parent README.** A paragraph listing the sub-roadmap after the opening; one sentence in "Downstream consumers"; and two locators in R1 (§1.1) with their References entries: Bishop, *Riemannian Geometry*, §3.11, p. 13, … and Barzen–Leymann, *Mathematics of Spacetime*, Theorem 7, p. 46". `git diff origin/main...HEAD` on the parent README has exactly these hunks.
- The two findings repaired before that round still hold at this head. They are the consumer range at README lines 4036–4038 and the §1.1 locators at lines 896–898 and 928–929. `git diff --stat 9cfb02f HEAD` touches only `MinimalSurfaces/`.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result |
|---|---|---|---|
| §1.1 item 1, Bishop's Φ is the matrix of our R | bishop-rg line 572 (R_XY=D_[X,Y]−D_XD_Y+D_YD_X), line 580 (matrix −Φ); unit S² | ours = −Bishop's, so the matrix is +Φ; Φ¹₂(e₁,e₂)=1=K | holds; §3.11 on p. 13 (marker at line 561) |
| §1.1 item 3, flat on U ⇔ locally Euclidean | flat T²; open cap of unit S²; dimension 1 | R=0 and ℝ²→T² a local isometry; K=1≠0, so no Euclidean chart; R=0 with an arclength chart | holds both ways; spacetime-guided-tour line 2122 on p. 46 |
| §1.1 item 4, `24r=B_Q(x,w;y,z)−B_Q(y,w;x,z)` | symbolic; orthonormal x,y with K=1; ω(e₁,e₂)=ω(e₃,e₄)=1 | 4(4r+2r(x,z,y,w)−2r(y,z,x,w))=24r by Bianchi; 16−(−8)=24; 8−(−8)=16≠24 | identity and both Checks hold |
| §1.1 item 3, Einstein constancy | unit S³; S³ of radius 2; dimension 1 | a=2; a=2·¼=½; Ric=0, so a=0 | holds; nicolaescu lines 8870 (p. 195) and 8888 (p. 196) |
| §1.2 Checks and (3.3.7) | dx²+e^(2x²)dy²; 4·(unit S²); (3.3.7) | K=−f″/f=−2−4x², ∂ₓK(1)=−8; K=¼; ∇_(d/dt)u=0 | holds; nicolaescu lines 4630 and 4641 (pp. 103–104) |
| §1.3 warped product | dx²+e^(2x)dy²; (0,π)×_sin S², k=2, t=π/3; ℝ³∖0 | ⟨R(V,X)X,V⟩=−1; Ric(V,V)=4/3+2/3=2 (Δ⁺ reading gives 0); R=0 | agrees with B–L Lemmas 35–36 (lines 2971–2983) after the sign flip |
| §1.3 conformal and Lie-group laws | e^(2u)g; bi-invariant metric; Andrews line 431 | −(Δu+(n−2)\|du\|²)g = (Δ⁺u−(n−2)\|du\|²)g; K=−¼⟨[[X,Y],Y],X⟩=¼\|[X,Y]\|² | consistent; Andrews Cor. 16.8.5 is on p. 162 |
| §1.3 O'Neill and projective Checks | S³→CP¹; X=[[0,−1],[1,0]], diag(0,i); e^(2x), e^(4x) | 1+¾·4=4; 1=1, and ½ against 1; T_UU=−∂ₓ and −2∂ₓ | hold |
| §2.1 Jacobi Checks | sin t·E on a great circle; t²E flat | −sin t·E+sin t·E=0; residual 2E | hold; `IsJacobiFieldOn` contains the geodesic field (Jacobi/Basic.lean:59) |
| §2.2 jets and Brewin sign | unit S², t=π/2; brewin-rnc lines 363 and 614 | \|d exp_(tT)(Y)\|=2/π against a transported norm of 1; R_acbd xᶜxᵈ=⟨R(e_a,v)v,e_b⟩=\|v\|² | consistent with sin²t=t²−t⁴/3 |
| §2.2 Bishop §6.11 and Problem 6.12; Nicolaescu 4.1.25–26 | bishop-rg lines 1888–1904; nicolaescu lines 6793–6802 | frame transported along radial geodesics, ϕᵢⱼ=¼Rᵢⱼₕₖ(xʰdxᵏ−xᵏdxʰ)=0 at p; ∂g(q)=0, Γ(q)=0 | p. 41 and p. 151 confirmed |
| §2.3 rescaled limit | g_j(e_a,e_b)(x) against exp*g at E_jx/λ_j; K(λ²g) | λ_j²·λ_j⁻² cancels; correction O(L²λ_j⁻²); K scales by λ_j⁻² | holds; Bishop Thm 6.11 (line 1872, p. 41) |
| Parent opening paragraph, lines 21–29 | MinimalSurfaces headings at this head | MS2 graphs, MS3.1–3.2, MS4.2, MS5, MS6, MS7.5, MS8, MS9, MS10.2/10.4, MS11.2, MS12 | each named item exists |
| Downstream sentence, lines 4036–4038 | parent ids cited in MinimalSurfaces/README.md | R1.5:14, R3:5, R4.1:15, R4.2:3, R4.3:3, R4.5:6, R5a:24, R5b:20, R5c:28, R7.0:9, R7.6:5, R7.9:16, R8.2:5 | exact; no other id cited |
| `exists_jacobi_initial_data` | flat γ; dimension 0 | X=u+(t−a)v; u=v=0 | holds |
| `morse_index` | unit S² on [0,3π/2] and [0,π]; constant γ | ∫(4/9)cos²−sin²=−5π/12 with sum 1; empty sum 0; ∫\|X′\|²≥0 with sum 0 | sides agree |
| `singularHomology_loopSpace_sphere` | n=2; n=3; i=0 | ℤ in every degree; ℤ in even degrees; H₀=ℤ | holds; hatcher lines 20284 (p. 471) and 12578 (p. 288) |
| `rauch_norm_ge_of_sectional_le` | unit S², κ=1; radius 5/2 at t=π/2 and 5π/2 | sin t≤sin t; 1≤1.4695; 1≤0 fails, so b<π/√κ is needed | holds; eschenburg lines 346 (p. 13) and 372 (p. 14) |
| `synge` | S²; RP²; flat T²; a point | π₁=1; nonorientable; K=0; trivially simply connected | holds; bishop-rg line 2302 (p. 50) |
| `synge_orientable_of_odd` | RP³; S¹ (hK vacuous) | orientable with π₁=ℤ/2; orientable | holds; bishop-rg line 2324 (p. 50) |
| `guenther` | unit S², κ=1; flat ℝ²; n=1; n=0 | 2π(1−cos r) on both sides; 2·(r²/2)·π=πr²; 2r; 0≤vol | equality where expected |
| `bishopGromov` | ℝ²; hyperbolic plane, κ=−1; circle of length L | 2π constant; 2π(cosh r−1)/(cosh r−1)=2π; min(2s,L)/s nonincreasing | holds; zhu lines 292 (p. 226) and 426 (p. 228) |
| `cartanHadamard_isCoveringMap` | flat T²; hyperbolic plane; unit S² | ℝ²→T² covering; diffeomorphism; K=1 violates hK | holds; nicolaescu line 10630 (p. 238) |
| `bonnetMyers_distance` | unit Sⁿ with λ=n−1; RP³ | bound π = antipodal distance; diameter π/2≤π | holds; nicolaescu line 9923 (p. 220) |
| `myers_finite_fundamentalGroup` | RP³; flat T³ | π₁=ℤ/2; Ric=0 fails λ>0 and π₁=ℤ³ | holds; nicolaescu line 10851 (p. 243) |
| `two_distinct_geodesics` | unit S² with non-antipodal p,q; circle | short and long great-circle arcs; the two arcs | holds; caponio-javaloyes line 14 |
| `killingHopf_euclidean` | n=0; n=1 | a point; the line (the circle is not simply connected) | holds |
| `killingHopf_sphere` | n=1; n=2 | the line passes hK vacuously, so hn is needed; S² | holds; spacetime-guided-tour line 2845 (p. 60) |
| `killingHopf_hyperbolic` | n=1: UpperHalfSpace ℝ⁰ with dt²/t² | log is an isometry onto ℝ | holds |
| `three_simple_closed_geodesics` | round S²; constant curve | great circles; a constant γ fails InjOn on [0,T) | holds |
| `paraboloid_geodesic_crossings` | a=1 | r″(0)=1/5; A_a(R)≥2a log(R/a)→∞; det=2a r′/R²>0 | holds; wilson line 78 (p. 2) |
| `paraboloid_vertex_pole` | K(0)=4 against the curvature-4 sphere; r=1 | r(ℓ)>0 for every ℓ>0; ℓ(1)≈1.4789, \|d exp(w)\|≈0.6762<1 | holds |
| `subsingleton_deRhamCohomology_one_of_ricciTensor_pos` | unit S³; flat S¹; S² minus 2 points | b₁=0; Ric=0 fails; noncompact with b₁=1 | holds; nicolaescu line 30622 (p. 661) |
| `subsingleton_deRhamCohomology_of_curvatureEndomorphism_pos` | Sⁿ (ℛ_p=p(n−p)); S²×S² | b_p=0; Rop≥0 with b₂=2 is excluded | holds; petersen-wink line 39 (p. 1) |
| `riemannianDist_eq_sSup_smooth` | x=y; the line | sup{0}=0; smoothed truncations of t↦t−x give values tending to \|x−y\| | holds; azagra line 89 (p. 2) |
| `eq_harmonicSphereRestriction_of_laplaceBeltrami_eq_neg_mul` | S²: X₃, X₁X₂; S¹: cos dθ | λ=2=1·2; 6=2·3; d² | holds; taylor lines 14318 and 14338 (p. 399) |
| `harmonic_irreducible` | N=3, d=1; N=2, d=1 | dimension 3, irreducible; (x₁±ix₂) span invariant lines, excluded | holds; taylor lines 15222 (p. 421) and 15017 (p. 415) |

- Source locators checked against the text: 41 in total. They are Bishop (6), Andrews (2), Nicolaescu (11), Barzen–Leymann (4), Brewin (2), Eschenburg (2), Zhu (2), Kwong Theorem 10(2) at line 1766 (p. 27) (1), Hatcher (2), Taylor (5), Petersen–Wink (1), Caponio–Javaloyes (1), Azagra (1) and Wilson (1).
- Library declarations opened at the pin: 20 Tau Ceti declarations. Among them are Polarization.lean:147, Schur.lean:197, Einstein.lean:162, Jacobi/Basic.lean:59, Conjugate.lean:171, Trigonometric/Curvature.lean:40, Jacobi/Comparison.lean:50, SectionalPolarization.lean:62, Scaling.lean:298, Isometry/LocallySymmetric.lean:85 and 140, Normal/Coordinates.lean:270 and 292, BiInvariant.lean:241, WarpedProd.lean:150, Prod.lean:82, Curvature/LocallySymmetric.lean:221, Restriction.lean:64, Gauss/Basic.lean:127 and Jacobi/Exponential.lean:155. Mathlib's `TangentSpace` has no norm instance of its own (IsManifold/Basic.lean:1074–1092), so the norms and `Metric.ball` in `guenther` and `rauch_norm_ge_of_sectional_le` are Riemannian. No pinned declaration proves any of the 23 headlines.
- Cross-roadmap citations, resolved on main: GeneralizedCohomology: G4.0b at line 1082, with the G4 heading at line 936. #1807 maps G4 to its Layer 4 in a former-numbering table. AlgebraicTopology: §4.6 at line 1666 (the "AT4.6" lead is this shorthand), §8.11a at line 3971 and `reducedSuspensionSphereHomeomorph` at line 4599. Other anchors: CharacteristicClasses C2 at line 728, HeegaardFloer Lane M at line 217, Isoperimetry I3 and I6 at lines 182 and 397, GeometricMeasureTheory G3 at line 183 and Yamabe Y9 at line 308. R5c, R7.9 and R4.1's barriers come from #2222, #2223 and #2224, which the description's merge order names. All four sibling pull requests merge cleanly with this head.
- Gate: the worker's gate passes every check at 4788ed5. The dependency check prints `depcheck: 206 roadmaps, 1913 edges, 0 problem(s)`. There are no changes outside the roadmap folders.
- Elaboration: `lake env lean` on `Suggested.lean` gives 23 `declaration uses sorry` warnings and nothing else. The `#check @` comparison shows binders dropped only on two `def`s. `IsEndpointZeroSmoothSection` loses `[FiniteDimensional ℝ E]`, `[I.Boundaryless]` and `[T2Space M]`, and `indexForm` loses `[I.Boundaryless]`. Neither body uses them, and `morse_index` re-supplies them. The one-tactic probe (`first | rfl | infer_instance | simp | norm_num`) closes none of the 23 theorems. Every Lean name appears in the README.
- Overlap check: read Surfaces (main and #2225), RicciFlow, HopfRinow, PositiveMass (main and #2247), GeometricCurrents, LorentzianGeometry (#2232), ManifoldOptimization (#1506), Yamabe (#2248) and CanonicalModelsAndGonality (#1726). Bishop–Gromov: R4.1 owns it, and PositiveMass line 45 leaves it here. The R5b stability form: R5b owns it; GeometricCurrents and PositiveMass §3.1 cite it. B, S and submersions: R5a and R1 own them; ManifoldOptimization and LorentzianGeometry cite them. Simons' identity and interior tangency: GeometricCurrents G6 owns them, and the new paragraph cites it. The Yang–Yau degree bound (MinimalSurfaces 10.4, also stated in CanonicalModelsAndGonality §8.4) is left to the MinimalSurfaces review. Nothing else is shared.

## Not verifiable

- milnor-morse-theory (§14, p. 77, and Lemma 14.4, pp. 80–81, for §2.1; Theorem 15.1, p. 83, for `morse_index`): settled as uncertified, so no text was read.
- oneill-submersion (Theorem 2 and Corollary 1, for §1.3): uncertified. The formula K_B=K+¾\|[X,Y]^v\|² was checked only by computation (S³→CP¹ gives 4).
- lee-irm (Theorem 7.10 through Barzen–Leymann in §1.1; Chapter 10 in R4.6): uncertified. It is confirmed only through spacetime-guided-tour lines 2121 and 5289.
- Morse, *The Calculus of Variations in the Large*, Theorem 13.3, p. 239: seen only as quoted at caponio-javaloyes-morse line 14.
- fulton-harris (Lectures 18–19, for R8.3): uncertified and outside the sample.

## Source issues

- **Misprint** in andrews-dg-ch16 at §16.1, p. 151: the source writes the second term of R(X,Y)Z as ∇_Y(∇_Y Z); it should be ∇_X(∇_Y Z), as the tensoriality computation on the same page uses; affects nothing.
- **Error** in caponio-javaloyes-morse at §1, p. 1: the source says Serre's theorem gives based-loop homology in infinitely many degrees whenever some positive-degree homology is nonzero, e.g. for every compact M; it should assume M simply connected, since the circle's based loop space is homotopy-discrete; affects nothing.
