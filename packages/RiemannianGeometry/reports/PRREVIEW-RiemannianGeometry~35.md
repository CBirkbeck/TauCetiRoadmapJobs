# Review of RiemannianGeometry (pull request #2224 at 55c157f)

**Verdict:** needs changes

## R01 (P1) — Three cited Tau Ceti declarations do not exist at the pin

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:2188`, `:2212`, `:2230`, the *Needs:* line `:2305–2312` and Layer 4 Dependencies `:2976–2978`: "is Tau Ceti's `TauCeti.Manifold.exponentialVariation` of γ"; "Tau Ceti's `TauCeti.curvatureCotangent κ ℓ`"; "`TauCeti.Manifold.hasDerivAt_toReal_pathELength_of_norm_curveVelocity_eq_one`".

**Claim:** The barrier's variation, its gradient step and its model constant rest on three Tau Ceti declarations that the pinned Tau Ceti does not contain, so these inputs have no owner at the pin.

**Witness:** Pinned Tau Ceti 2fd255d: `grep -rn` over `TauCeti/` finds none of the three names; `#check` of each gives "Unknown identifier"; `Trigonometric/Curvature.lean` defines only `curvatureSine`, `curvatureCosine`; `Riemannian/FirstVariation.lean` varies energy only.

**Repair:** (a) Replace "`TauCeti.curvatureCotangent κ ℓ`" with "`TauCeti.curvatureCosine κ ℓ / TauCeti.curvatureSine κ ℓ`, which is s_κ′(ℓ)/s_κ(ℓ) by `TauCeti.hasDerivAt_curvatureSine`". (b) Replace the length lemma with: "the central curve has unit speed, so the s-derivative at s=0 of L(γ_(sw)) equals that of the energy ½∫|∂_tγ_(sw)|², which Tau Ceti's `TauCeti.Manifold.hasDerivAt_energy` (`Riemannian/FirstVariation.lean`) gives with free endpoints". (c) Replace "Thus (s,t)↦γ_(sw)(t) is Tau Ceti's `TauCeti.Manifold.exponentialVariation` of γ along W_w:" with "Thus (s,t)↦γ_(sw)(t)=exp_(γ(t))(sW_w(t)) is a smooth variation of γ, by `TauCeti.Manifold.contMDiffOn_riemannianExp_tangentBundle`:". Make the same three changes in the *Needs:* line, and in Layer 4 Dependencies replace "Tau Ceti's exponential variation and first variation of length" with "Tau Ceti's exponential map and first variation of energy". All replacement names resolve at the pin.

## R02 (P2) — The barrier Laplacian comparison is statable at the pins but absent from `Suggested.lean`

**Location:** `TauCetiRoadmap/RiemannianGeometry/Suggested.lean:35–38`: "the Rauch comparison under an upper sectional bound (R4.1), Günther's volume comparison under an upper sectional bound (R4.1), the Bishop–Gromov relative-volume monotonicity". The README states the barrier theorem at `:2201–2216`.

**Claim:** The block's end theorem is the Laplacian comparison at a possible cut point through a smooth upper barrier, the R4.1 result that the MinimalSurfaces sub-roadmap consumes. Every carrier it needs exists at the pins, yet `Suggested.lean` does not state it, and its docstring does not list it as not statable.

**Witness:** The statement below, added to the `GlobalDistance` section of a scratch copy of `Suggested.lean`, elaborates under `lake env lean` with only the `sorry` warning. Its carriers (`laplaceBeltrami`, `ricciTensor`, `curvatureSine`, `curvatureCosine`, `dist`) are all pinned.

**Repair:** Add this to the `GlobalDistance` section. Add "the Laplacian comparison at a possible cut point through smooth upper barriers (R4.1)" to the docstring's list. In the README block, after the bullet list, add "`exists_upper_barrier_laplaceBeltrami_le` states the first and last items."

```lean
/-- R4.1, Laplacian comparison through smooth upper barriers: for a unit-speed geodesic `γ` on
`[0, ℓ]`, `ℓ > 0`, minimizing from `γ 0` to `γ ℓ`, with `Ric(γ′,γ′) ≥ (n−1)κ` along it and
`ℓ < π/√κ` when `κ > 0`, some function smooth at `γ ℓ`, equal to `ℓ` there and at least
`dist (γ 0)` near it, has Laplacian at most `(n−1) s_κ′(ℓ)/s_κ(ℓ)` at `γ ℓ`, which may be a cut
point of `γ 0`. -/
theorem exists_upper_barrier_laplaceBeltrami_le {γ : ℝ → M} {ℓ κ : ℝ} (hℓ : 0 < ℓ)
    (hγ : TauCeti.Manifold.IsGeodesicCurveOn I γ (Icc 0 ℓ))
    (hunit : ∀ t ∈ Icc 0 ℓ, ‖TauCeti.Manifold.curveVelocityWithin I γ (Icc 0 ℓ) t‖ = 1)
    (hmin : dist (γ 0) (γ ℓ) = ℓ)
    (hRic : ∀ t ∈ Icc 0 ℓ, ((Module.finrank ℝ E : ℝ) - 1) * κ ≤
      (CovariantDerivative.leviCivitaConnection I M).ricciTensor (γ t)
        (TauCeti.Manifold.curveVelocityWithin I γ (Icc 0 ℓ) t)
        (TauCeti.Manifold.curveVelocityWithin I γ (Icc 0 ℓ) t))
    (hmodel : 0 < κ → ℓ < Real.pi / Real.sqrt κ) :
    ∃ f : M → ℝ, ContMDiffAt I 𝓘(ℝ, ℝ) ∞ f (γ ℓ) ∧ f (γ ℓ) = ℓ ∧
      (∀ᶠ x in nhds (γ ℓ), dist (γ 0) x ≤ f x) ∧
      TauCeti.Manifold.laplaceBeltrami I f (γ ℓ) ≤
        ((Module.finrank ℝ E : ℝ) - 1) *
          (TauCeti.curvatureCosine κ ℓ / TauCeti.curvatureSine κ ℓ) := by
  sorry
```

## R03 (P3) — The Tau Ceti supplier contract omits the block's pinned inputs

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:481–484`: "For R4.1, `TauCeti.curvatureSine` and `TauCeti.curvatureCosine` in `TauCeti/Analysis/SpecialFunctions/Trigonometric/Curvature.lean` are the solutions of y″+κy=0".

**Claim:** The block consumes nine pinned Tau Ceti declarations, but the "From Tau Ceti" contract never names them or states their files and hypotheses.

**Witness:** README lines 199–704 name none of `riemannianLog`, `exists_isNormalDomain_ball`, `mfderiv_riemannianExp_zero`, `TauCeti.Manifold.hessian`, `laplaceBeltrami_eq_sum_hessian`, `hessian_self_nonneg_of_isLocalMin`, `laplaceBeltrami_nonpos_of_isLocalMax`, `ricciTensor_eq_sum_inner`, `inner_eq_of_alongCurveWithin_eq_zero`.

**Repair:** After line 484 add: "For R4.1's smooth upper distance barriers, on a boundaryless Hausdorff manifold with a smooth metric: `TauCeti.Manifold.exists_isNormalDomain_ball` and `TauCeti.Manifold.riemannianLog` (`Riemannian/Geodesic/Normal/Basic.lean`), a normal ball about 0 in every tangent space and the logarithm of a normal domain; `TauCeti.Manifold.mfderiv_riemannianExp_zero` (`Riemannian/Geodesic/Exponential.lean`), d(exp_p)_0=Id; `TauCeti.Manifold.hessian` and `TauCeti.Manifold.laplaceBeltrami_eq_sum_hessian` (`Riemannian/Laplacian.lean`), Hess f(v,w)=⟨∇_v grad f,w⟩ and Δf its trace in every orthonormal basis; `TauCeti.Manifold.hessian_self_nonneg_of_isLocalMin` and `TauCeti.Manifold.laplaceBeltrami_nonpos_of_isLocalMax` (`Riemannian/MaximumPrinciple.lean`), for f C² at x; `CovariantDerivative.ricciTensor_eq_sum_inner` (`Curvature/Ricci.lean`), Ric(u,v)=Σ_i⟨e_i,R(e_i,u)v⟩ in an orthonormal basis; `CovariantDerivative.IsMetricCompatible.inner_eq_of_alongCurveWithin_eq_zero` (`AlongCurve/Metric.lean`), two parallel fields along a differentiable curve on a preconnected parameter set with unique derivatives keep their inner product; and `TauCeti.Manifold.hasDerivAt_energy` (`Riemannian/FirstVariation.lean`), the free-endpoint first variation of ½∫|γ′|² for a family C² near {0}×[a,b]."

## R04 (P3) — The free-endpoint second variation of length is stated in R4.1, but R3 owns the length second variation

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:2237–2246`: "Derive from R3's second energy variation, with its endpoint acceleration terms, the second variation of length of a smooth variation Γ of the unit-speed geodesic γ with free endpoints".

**Claim:** R3 already targets the second variation of length and its tangential degeneracy. The roadmap therefore states one formula in two items. Consumers who look for the moving-endpoint length formula in R3 do not find its free-endpoint form.

**Witness:** README 1536–1538 (R3): "For length, use normal fields along a unit-speed nonconstant geodesic and state the tangential/reparametrization degeneracy separately". The open MinimalSurfaces sub-roadmap cites "R3 and R4.2" for second variation with moving endpoints.

**Repair:** Move the sentence "Derive from R3's second energy variation … only the normal part of V enters." (lines 2237–2246) with its display into R3, directly after "state the tangential/reparametrization degeneracy separately." In R4.1 write instead: "By R3's second variation of length with free endpoints, with A=0 because every transverse curve is a geodesic, and with `W_w^⊥=W_(w^⊥)`, …". Add R3 (second variation of length with free endpoints) to the block's *Needs:*.

## R05 (P3) — Lynch is cited by appendix only, and the κ>0 case has no locator

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:2258–2260` and `:4298–4302`: "(Lynch, *The Cheng–Yau gradient estimate for Jacobi fields*, Appendix B, for this second-variation comparison with the modulation f when κ≤0)".

**Claim:** The locator names no statement and no page. Lynch covers only κ≤0, in his normalization k², and nothing is cited for the block's κ>0 statement.

**Witness:** Lynch, arXiv:2611.12758v1, Proposition B.1, p. 15: hypothesis Ric+∇²φ−dφ⊗dφ/(N−n) ≥ −(N−1)k², k ≥ 0; conclusion (N−1)k coth(kr) in the barrier sense. The modulated second variation is in its proof, p. 16. There is no κ>0 case.

**Repair:** In both places replace "Appendix B" with "Proposition B.1 and its proof, pp. 15–16, for constant weight and N=n, his k being √k here". After the parenthesis at 2260 add "(for every real κ: Wei, *Manifolds with a lower Ricci curvature bound*, §3, inequality (3.1), Lemma 3.4 and Theorem 3.6, pp. 3–4)". Add Wei (arXiv:math/0612107) to References.

## R06 (P3) — The description's Suppliers paragraph names Tau Ceti declarations that the pin lacks

**Location:** Pull-request description, **Suppliers.**: "Tau Ceti's `exponentialVariation`, first variation of length with boundary terms, … and `curvatureCotangent`"; "(Tau Ceti has it only along radial geodesics in a normal domain…)"; **Edits.**: "the supplier-contract lists are not changed".

**Claim:** Three named Tau Ceti inputs and the radial parallel transport do not exist at the pin. The Edits sentence becomes false once R03 is repaired.

**Witness:** Pinned Tau Ceti 2fd255d has no `exponentialVariation`, no first variation of length and no `curvatureCotangent` (R01). It also has no parallel-transport declaration under `VectorBundle/CovariantDerivative/AlongCurve/`.

**Repair:** "**Suppliers.** R3's second variation of energy and of length; SmoothBundlesConnections B5.0 for parallel transport along γ (Tau Ceti at the pin has none); HopfRinow Layers 1–2; Tau Ceti's exponential map on its open domain, `riemannianLog`, `hasDerivAt_energy`, `curvatureSine` and `curvatureCosine`, `hessian`, `laplaceBeltrami_eq_sum_hessian`, `ricciTensor_eq_sum_inner` and the maximum-principle lemmas, now listed in the Tau Ceti supplier contract." and "**Edits.** The block in R4.1; the free-endpoint length formula in R3; the R4.1 paragraph of the Tau Ceti supplier contract; one sentence in Layer 4's Dependencies; the references; `Suggested.lean` gains `exists_upper_barrier_laplaceBeltrami_le`."

## Verified sound

| Statement | Instance | Left side (computed) | Right side (computed) | Result |
|---|---|---|---|---|
| Barrier bound Δr̃(p̄) ≤ (n−1)s_κ′(ℓ)/s_κ(ℓ) | ℝ³, κ=0, ℓ=2, r̃=\|x\| | Δ\|x\| = (n−1)/ℓ = 1 | (n−1)/ℓ = 1 | equality, holds |
| Barrier bound | hyperbolic n=2, κ=−1, ℓ=1, f=sinh t/sinh 1 | ∫(cosh²+sinh²)/sinh²1 = coth 1 = 1.3130 | coth 1 = 1.3130 | equality; f=t/ℓ gives 1.3333, weaker |
| Barrier bound | Sⁿ antipode, ℓ=π, κ=0, f=t/π | (n−1)(1/π−π/3) = −0.729(n−1) | (n−1)/π = 0.318(n−1) | holds; Δ⁺ form 0.729 ≥ −0.318 |
| Barrier bound | S², κ=1, ℓ=3π/4 | (n−1)cot ℓ = −1 | cot(3π/4) = −1 | equality, negative bound |
| Guard ℓ<π/√κ | κ=1, ℓ=π | s_1(π)=0 | f=s_κ(t)/s_κ(ℓ) undefined | guard needed; antipode via κ=0 |
| x coth x ≤ 1+x | x=1; x→0⁺ | 1.3130; →1 | 2; →1 | holds |
| Tangential direction | ℝⁿ, r̃(p̄+sp̄/ℓ) | ℓ+s: first derivative 1, second 0 | Hess formula with w^⊥=0: 0 | agrees |
| Hessian = bulk index integral at W_(w^⊥) | ℝⁿ, w ⊥ p̄ | Hess\|x\|(w,w) = \|w\|²/ℓ | ∫₀^ℓ \|w\|²/ℓ² dt = \|w\|²/ℓ | agrees |
| Trace step Σ⟨R(P_te_i,γ′)γ′,P_te_i⟩ = Ric(γ′,γ′) | S², K=1 | 1 (one normal direction) | Ric(γ′,γ′)=1 | agrees |
| (n−1)f′²−f²Ric ≤ (n−1)(ff′)′, ∫ = f′(ℓ) | κ=−1, ℓ=1 | ∫(f′²+f²) = 1.3130 | f′(1)=coth 1=1.3130 | agrees |
| Second variation of length = energy formula − ∫⟨D_tV,γ′⟩² | ℝ², Γ=(t,st) on [0,ℓ] | L=ℓ√(1+s²), L″(0)=ℓ | ∫\|D_tV^⊥\|² = ℓ, A=0 | agrees |
| Same, tangential | Γ=(t+st,0) | L=ℓ(1+s), L″=0 | E″−∫⟨D_tV,γ′⟩² = ℓ−ℓ = 0 | agrees |
| API: F(r̃)Q ≤ F(dist)Q | F(r)=(R²−r²)², r<R, Q≥0 | r̃≥dist ⇒ F(r̃)≤F(dist) | equality at p̄ (r̃(p̄)=ℓ) | holds |
| R02 statement (probe) | ℝ³, ℓ=2, κ=0 | Δ\|x\|(p̄)=1 | 2·(1/2)=1 | holds; elaborates at pins |
| Lynch Prop B.1 vs README reference | φ const, N=n, k²↦k | (n−1)k coth(kr), k≥0 | README (n−1)√k coth(√k r) | agrees; κ≤0 only (R05) |
| 1.1.2 polarization (Andrews Prop 16.2.1, p. 154) | text at locator | R_ijkl through six sectional curvatures, Bianchi used | README claim: K determines R | locator correct |
| 1.1.4 24r = B_Q(x,w;y,z) − B_Q(y,w;x,z) | orthonormal, K=1, z=y, w=x | 16 − (−8) = 24 | 24·r(x,y,y,x) = 24 | holds |
| Same | random algebraic curvature tensor on ℝ⁴ | 1751.3232 | 24r = 1751.3232 | holds |
| Same, no Bianchi | r=ω⊗ω, ω=e¹²+e³⁴ | 8 − (−8) = 16 | 24 | fails, as the Check says |
| 1.1.3 Einstein constancy (Nicolaescu Ex. 4.2.38 p. 196; Ex. 4.2.36 p. 195) | unit S³; radius-2 S³ | a=2 | a=1/2 | disjoint union excluded; locators correct |
| 1.2 ∇R=0 Check | dx²+e^(2x²)dy² | K=−2−4x² | ∂_xK(1)=−8≠0 | fails predicate, as stated |
| 1.2 transport ODE (Nicolaescu §3.3.2, (3.3.7), pp. 103–104) | text | ∇_(d/dt)u=0, u(0)=u₀ | README use | locator correct |
| 1.3 warped R(V,X)Y=−f⁻¹Hess f(X,Y)V | dx²+e^(2x)dy² | ⟨R(V,X)X,V⟩=−f″/f=−1 | hyperbolic K=−1 | holds |
| 1.3 vertical Ricci, Δ=div grad | (0,π)×_sin S², t=π/3 | 4/3+2/3 = 2 | unit-sphere value k=2 | holds; Δ⁺ reading gives 0 |
| 1.3 warped (Barzen–Leymann Lemmas 35–36, pp. 61–62) | text | B–L R(V,X)Y=+H(f)(X,Y)V/f | README −f⁻¹Hess f: opposite sign, as stated | locator correct |
| 1.3 bi-invariant R=−¼[[X,Y],Z] (Andrews Cor. 16.8.5 p. 162) | ad-invariant product | ⟨R(e_i,e_j)e_k,e_l⟩ = −¼⟨[e_i,e_j],[e_k,e_l]⟩ | Andrews R_ijkl=+¼c_ijp c_klp | opposite sign, as stated |
| 1.3 O'Neill Hopf Check | S³→CP¹, \|v[X,Y]\|=2 | 1+¾·4 = 4 | CP¹ curvature 4 | holds |
| 1.3 T-tensor Checks | e^(2x); e^(4x) | T_UU=−∂x; −2∂x | Γˣ_yy=−e^(2x); −2e^(4x) | holds |
| 1.3 Lie-algebra norm | X=[[0,−1],[1,0]]; diag(0,i) | −trX²/2 = 1; 1/2 | \|Xe₂\| = 1; 1 | as stated |
| 2.1 Jacobi Checks | unit great circle, J=sin t E; flat J=t²E | −sin t + sin t = 0; 2E | 0; 0 | Jacobi; not Jacobi |
| 2.2 frame Check | S², t=π/2 | \|d exp_(tT)(Y)\| = sin t/t = 2/π | transported norm 1 | differ, as stated |
| 2.2 holonomy Check | trirectangular triangle on S² | rotation π/2 | enclosed area 4π/8 = π/2 | holds |
| 2.2 jet (Brewin p. 9 and (11.1) p. 15; Bishop §6.11, Prob. 6.12 p. 41; Nicolaescu 4.1.25–26 p. 151) | unit sphere | sin²t = t²−t⁴/3+O(t⁶) | t²−⅓K t⁴, K=1 | agrees; locators correct |
| 2.3 rescaled limit (Bishop Thm 6.11 p. 41) | v=E_j(x)/λ_j | correction ⅓\|R\|\|x\|²λ_j⁻² | K(λ²g)=λ⁻²K(g), c=λ² | O(λ⁻²); locator correct |
| `exists_jacobi_initial_data` | ℝⁿ, γ=te₁ on [0,1] | X=u+tv | X(0)=u, D_tX(0)=v | holds |
| `morse_index` | S² great circle [0,3π/2]; [0,π] | index 1 (I(sin(2t/3)E)=−5π/12); 0 | mult(π)=1; empty sum 0 | holds |
| `singularHomology_loopSpace_sphere` | n=3; n=2 | ℤ even, 0 odd; ℤ all degrees | H_*(ΩS³)=ℤ[x₂]; H_*(ΩS²) ℤ each degree | holds; n=1 excluded |
| `rauch_norm_ge_of_sectional_le` | radius-5/2 sphere, κ=1, t=π/2 | sin(π/2)=1 | (5/2)sin(π/5)=1.4695 | holds; t=5π/2 excluded by b<π |
| `synge`, `synge_orientable_of_odd` | S²; RP³; S¹ | simply connected; orientable; orientable | π₁(RP³)=ℤ/2 not required trivial | holds |
| `guenther` | S², κ=1, r<π | 2·(1−cos r)·π | cap area 2π(1−cos r) | equality |
| `bishopGromov` | S², κ=0, r=1, 2 | 4π(1−cos 1)=5.777 | 4π(1+cos(π−2))/4 = 4.449 | nonincreasing |
| `cartanHadamard_isCoveringMap` | flat T² | exp: ℝ²→T² | universal covering | holds |
| `bonnetMyers_distance` | unit Sⁿ, λ=n−1 | diam = π | π√((n−1)/(n−1)) = π | equality |
| `myers_finite_fundamentalGroup` | RPⁿ, Ric=(n−1)g | π₁=ℤ/2 | finite | holds |
| `two_distinct_geodesics` | circle of length 2π, p≠q | two arcs | differ at an interior parameter | holds |
| `killingHopf_*` | n=0; n=1 | points; {t>0}, dt²/t² ≅ ℝ via log t | sphere case excludes n=1 | holds |
| `three_simple_closed_geodesics` | triaxial ellipsoid | three principal ellipses | three distinct images | holds |
| `paraboloid_vertex_pole` | z=r² | K=4/(1+4r²)², 4 at r=0 | meridian Jacobi length r>0 | no conjugate point |
| `subsingleton_deRhamCohomology_one_of_ricciTensor_pos` | flat S¹; RP² | b₁=1 (Ric=0 excluded) | b₁(RP²;ℝ)=0 | holds |
| `subsingleton_deRhamCohomology_of_curvatureEndomorphism_pos` | Sⁿ; S²×S² | Rop=Id, H^p=0 | Rop≥0 only, b₂=2 excluded | holds |
| `riemannianDist_eq_sSup_smooth` | ℝ, x=0, y=1; x=y | sup of smooth bounded 1-Lipschitz values = 1 | dist = 1; sSup{0}=0 | holds |
| `eq_harmonicSphereRestriction_of_laplaceBeltrami_eq_neg_mul` | S¹; S², d=1 | λ=d²; λ=2 | d(d+m−1): d²; 1·2 | holds |
| `harmonic_irreducible` | N=2, d=1; N=3, d=1 | lines x₁±ix₂ invariant; ℂ³ standard | excluded by N≥3; irreducible | holds |

- Source locators checked against the text: 16 (Andrews 2, Nicolaescu 5, Barzen–Leymann 2, Bishop 3, Brewin 2, Lynch 1, Wei 1); all correct except R05.
- Library declarations opened at the pin: Tau Ceti `Laplacian.lean:135, 238, 601`, `MaximumPrinciple.lean:75, 82`, `Geodesic/Normal/Basic.lean:163, 225`, `Geodesic/Exponential.lean:185, 193, 320`, `Curvature/Ricci.lean:88`, `AlongCurve/Metric.lean:476`, `FirstVariation.lean:212`, `Energy.lean:64`, `Trigonometric/Curvature.lean:40, 89`; Mathlib `IsManifold/Basic.lean:1033`, `Topology/VectorBundle/Riemannian.lean:420–431`. The three names of R01 are absent.
- Cross-roadmap citations resolved: SmoothBundlesConnections B5.0 (main line 1072; also kept at the head of the open revision of SmoothBundlesConnections), HopfRinow Layers 1–2 (Completed), GeneralizedCohomology G4.0b (main line 1082; the overlap lead "only an open revision defines §G4.0b" is a false positive; one open revision renames the heading anchor but keeps "(G4.0)" in its §4.0 heading), AlgebraicTopology AT4.6 = main §4.6 Projective spaces (the citation lead is a false positive).
- Gate: every check passed (worker's gate). Dependency check: `depcheck: 206 roadmaps, 1912 edges, 0 problem(s)`.
- Elaboration: `lake env lean Suggested.lean` gives 23 `sorry` warnings and nothing else. `#check @name` was run for all 27 declarations; the elaborated types match the README. `IsEndpointZeroSmoothSection` and `indexForm` drop `FiniteDimensional`, `Boundaryless` and `T2Space` binders that their bodies do not use, and `morse_index` carries them. No change needed.
- Padding: none of the 23 theorems closes by one tactic; each needs Jacobi, variation, comparison or Hodge theory absent at the pin. The four definitions are the ones the headlines need.
- Overlap check: read Surfaces (main and its open revision), MinimalSurfaces (open), ManifoldOptimization (open), DGFloerPartII (open), SmoothBundlesConnections (main and its open revision), RicciFlow (main) and HopfRinow (main). Shared objects and owners: smooth upper distance barrier, RiemannianGeometry R4.1 (no other roadmap states it; MinimalSurfaces cites it); parallel transport, SmoothBundlesConnections B5.0; exponential map and normal domains, HopfRinow Layers 1–2; moving-endpoint second variation of length, RiemannianGeometry R3 (R04). The four other open revisions of this roadmap merge cleanly with this head, and none touches R4.1.

## Not verifiable

- `milnor-morse-theory` (§14 p. 77, Lemma 14.4 pp. 80–81, Theorems 14.1 and 15.1): the manifest settles it as uncertified, and no legal text is available.
- `oneill-submersion` (Theorem 2, Corollary 1): settled as uncertified; no legal text is available.

## Source issues

- none
