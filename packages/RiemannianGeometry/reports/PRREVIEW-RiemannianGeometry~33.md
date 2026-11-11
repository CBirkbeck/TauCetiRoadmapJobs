# Review of RiemannianGeometry (pull request #2222 at 85cb8cb)

**Verdict:** needs changes

## R01 (P1) — R5c cites Tau Ceti declarations that do not exist at the pin

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md` lines 3438–3443, 3530, 3535, 3609, 3611, 3653: "For scalar L, Tau Ceti's `TauCeti.Manifold.SobolevH1` with `SobolevH1.toLp`, and `SobolevH1.dirichletForm` plus `SobolevH1.potentialForm` of q (`…/Sobolev/H1.lean` and `Sobolev/Schrodinger.lean`), are V, J and Q".

**Claim:** R5c treats the following as supplied, but none of them exists at the pinned Tau Ceti, so the inputs are unowned:
- the closed scalar carrier `TauCeti.Manifold.SobolevH1` with `toLp`, `dirichletForm` and `potentialForm`;
- item 4's route: `TauCeti.Manifold.apply_eq_of_laplaceBeltrami_eq_zero` and `TauCeti.Manifold.exists_integral_sq_sub_average_le_mul_integral_norm_sq_mgradient`;
- two Checks: `TauCeti.Manifold.exists_pos_mul_integral_sq_le_integral_norm_sq_mgradient_add_integral_mul_sq` and `TauCeti.Manifold.eq_zero_of_laplaceBeltrami_eq_mul`;
- Layer 5's "closed-manifold H¹ space and Poincaré–Wirtinger inequality".

**Witness:** At Tau Ceti 2fd255d, `grep -rn` over `TauCeti/` finds none of the seven names, and `TauCeti/Geometry/Manifold/Riemannian/Sobolev/` does not exist. Green's first identity is `TauCeti.Manifold.integral_mul_laplaceBeltrami` (`Riemannian/DivergenceTheorem.lean:312`).

**Repair:**
1. Delete the sentence that runs from "For scalar L, Tau Ceti's `TauCeti.Manifold.SobolevH1`" to "so that the scalar statements below hold on it." In the closed case, K5a's first-order Sobolev space of the trivial line is V.
2. Replace "a harmonic function on a closed connected manifold is constant (`TauCeti.Manifold.apply_eq_of_laplaceBeltrami_eq_zero`)" with "a harmonic function f on a closed connected manifold is constant, since Green's first identity `TauCeti.Manifold.integral_mul_laplaceBeltrami` with g=f gives ∫|∇f|²=0".
3. Replace the text from "and Tau Ceti's Poincaré–Wirtinger inequality `TauCeti.Manifold.exists_integral_sq_sub_average_le_mul_integral_norm_sq_mgradient`," to "has least constant λ₁(Δ⁺)⁻¹." with "and prove the Poincaré–Wirtinger inequality `∫(f−a)²≤λ₁(Δ⁺)⁻¹∫|∇f|²`, a the mean of f, whose least constant is λ₁(Δ⁺)⁻¹."
4. In the Check, replace the text from "For a continuous q≥0, … Tau Ceti's `…_add_integral_mul_sq` is μ₁(Δ⁺+q)>0" to "(`TauCeti.Manifold.eq_zero_of_laplaceBeltrami_eq_mul`)" with "For a smooth q≥0, not identically 0, on a closed connected M, Q(u,u)=∫|∇u|²+∫qu² vanishes only for u=0 (u is a constant c with c²∫q=0), so μ₁(Δ⁺+q)>0 and Lh=0 has only the solution 0".
5. At line 3653, replace "Green identities, closed-manifold H¹ space and Poincaré–Wirtinger inequality." with "Green identities."

## R02 (P1) — R5c makes PositiveMass, a consumer of this roadmap, its supplier

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md` lines 3490–3494, and also lines 51–52 and 3649–3655: "On a closed connected M this is PositiveMass 3.0 for the operator Δ⁺+q, which is consumed and not proved again".

**Claim:**
- PositiveMass on main consumes this roadmap (R1, R4.1, R5a–R5b, R7.8 and R8). Citing PositiveMass 3.0 here makes each roadmap supply the other.
- "PositiveMass 3.0 uses no R5 target" checks only sections, so it does not restore a single direction of supply. In any case, 3.0 reaches R1 through PositiveMass 0.4.
- The dependency check does not report this pair, because both roadmaps are on main.

**Witness:** PositiveMass README line 134 reads "From TauCetiRoadmap.RiemannianGeometry (on main)". The *Needs:* line of its 3.0 (line 679) lists 0.4, and 0.4 (lines 335–337) uses "RiemannianGeometry R1's law for `e^(2u) g`".

**Repair:** Move the notion down into R5c.
1. In item 1, replace the text from "On a closed connected M this is [PositiveMass 3.0](…)" to "R5c owns the Dirichlet case, where φ₁ vanishes on ∂D." with "In the Dirichlet case φ₁ vanishes on ∂D."
2. Replace "A route: for item 1 in the Dirichlet case, let u lie" with "A route: for item 1, let u lie". The |u|, K5a-regularity and C13 argument applies verbatim when D=M.
3. Delete the PositiveMass clause at lines 51–52.
4. Delete "PositiveMass 3.0 for the closed-manifold first eigenfunction," at lines 3649–3650.
5. Delete the sentence "PositiveMass 3.0 uses no R5 target, so 3.0 → R5c and R5b → PositiveMass 3.1 form no cycle."
6. Delete the PositiveMass bullet "On a closed connected manifold … this creates no cycle" from the description.

PositiveMass 3.0, and Yamabe Y1 item 2, which owns the same statement, then cite R5c in their own revisions.

## R03 (P2) — R5b and R5c both own the Dirichlet realization

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md`:
- line 47: "R5c owns the same realization for a symmetric Schrödinger operator `∇*∇+K` … of which R5b's is the normal-bundle case";
- line 3409: "Own the same statements for (E,∇,K)";
- line 3646: "R5c uses R5b's Dirichlet realization".

**Claim:**
- R5b keeps ownership of the realization: the form on W¹,²₀, L_D, the boundary H² estimate and the domain identification (lines 3262–3340).
- R5c owns the same statements again, at a generality that makes R5b's operator "the instance". One object therefore has two owners.
- Layer 5's Dependencies says that R5c consumes R5b's realization, while R5c says that R5b is derived from R5c.

**Witness:** R5b, line 3264: "own their finite-chart Riemannian normal-bundle specialization". R5c, lines 3409–3415: "Own the same statements for (E,∇,K)… so that R5b is the instance named above".

**Repair:** Make R5b the single owner, at the general level.
1. At line 3264, replace "own their finite-chart Riemannian normal-bundle specialization:" with "own their finite-chart specialization to a smooth real vector bundle E with fibre metric, metric connection ∇ and smooth pointwise-symmetric potential K, the normal bundle ν_f with ∇⊥ and the curvature potential being the case of Q:". State R5b's L_D, H² estimate and domain identification for that (E,∇,K).
2. In R5c, replace the text from "Own the same statements for (E,∇,K). R5b's construction uses" to "so that R5b is the instance named above." with "Consume them for (E,∇,K)." Keep R5c's W^(k+2,2) estimate.
3. At line 47, replace "R5c owns the same realization for" with "R5c owns, on R5b's realization of".

## R04 (P2) — R5c's statable closed-manifold headlines are absent from `Suggested.lean`

**Location:** `TauCetiRoadmap/RiemannianGeometry/Suggested.lean`, module docstring (lines 22–86), which neither states nor names any R5c result. `README.md` lines 3486–3507, items 1 and 4.

**Claim:** Two R5c headlines are statable on Tau Ceti's `laplaceBeltrami`, `mgradient` and `riemannianVolume`, but neither is stated:
- the first positive eigenvalue of Δ⁺ on a closed connected manifold, with its eigenfunction and Rayleigh characterization;
- the closed-case principal eigenfunction of Δ⁺+q, which R5c owns after the R02 repair.

R5c's domain statements are not named as not statable.

**Witness:** A scratch copy of `Suggested.lean` with the section below inserted after `end Paraboloid` elaborates with 25 `sorry` warnings and no other message. On the unit circle, λ=1, f=sin, and the Rayleigh bound is Wirtinger's inequality.

**Repair:** Insert after `end Paraboloid`:

```lean
/-! ## Layer 5: Schrödinger operators on closed manifolds -/

section Schrodinger

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [I.Boundaryless] [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]
  [MeasurableSpace M] [BorelSpace M] [SecondCountableTopology M]
  [IsContinuousRiemannianBundle E (fun x : M => TangentSpace I x)]

/-- R5c, item 4: on a closed connected Riemannian manifold of positive dimension the first
positive eigenvalue `λ₁` of `Δ⁺ = −Δ` exists, has a smooth eigenfunction (`Δf = −λ₁ f` for Tau
Ceti's `Δ = div grad`), and is the least Rayleigh quotient `∫|∇g|²/∫g²` of the smooth functions
of mean zero. On the unit circle `λ₁ = 1` with `f = sin`. -/
theorem exists_pos_laplaceBeltrami_eigenvalue_isLeast [CompactSpace M] [ConnectedSpace M]
    [Nontrivial E] :
    ∃ lam : ℝ, 0 < lam ∧
      (∃ f : M → ℝ, ContMDiff I 𝓘(ℝ) ∞ f ∧ f ≠ 0 ∧
        ∀ x, TauCeti.Manifold.laplaceBeltrami I f x = -lam * f x) ∧
      ∀ g : M → ℝ, ContMDiff I 𝓘(ℝ) ∞ g → ∫ x, g x ∂TauCeti.riemannianVolume I M = 0 →
        lam * ∫ x, g x ^ 2 ∂TauCeti.riemannianVolume I M ≤
          ∫ x, ‖TauCeti.Manifold.mgradient I g x‖ ^ 2 ∂TauCeti.riemannianVolume I M := by
  sorry

/-- R5c, item 1 on a closed connected manifold: for a smooth `q` the lowest eigenvalue `μ` of
`Δ⁺ + q` has a smooth positive eigenfunction `φ` spanning its eigenspace among smooth functions,
and `μ` is the least Rayleigh quotient `(∫|∇u|² + ∫qu²)/∫u²`. -/
theorem exists_pos_eigenfunction_neg_laplaceBeltrami_add [CompactSpace M] [ConnectedSpace M]
    (q : M → ℝ) (hq : ContMDiff I 𝓘(ℝ) ∞ q) :
    ∃ (mu : ℝ) (φ : M → ℝ), ContMDiff I 𝓘(ℝ) ∞ φ ∧ (∀ x, 0 < φ x) ∧
      (∀ x, -TauCeti.Manifold.laplaceBeltrami I φ x + q x * φ x = mu * φ x) ∧
      (∀ u : M → ℝ, ContMDiff I 𝓘(ℝ) ∞ u →
        (∀ x, -TauCeti.Manifold.laplaceBeltrami I u x + q x * u x = mu * u x) →
          ∃ c : ℝ, u = c • φ) ∧
      ∀ u : M → ℝ, ContMDiff I 𝓘(ℝ) ∞ u →
        mu * ∫ x, u x ^ 2 ∂TauCeti.riemannianVolume I M ≤
          ∫ x, ‖TauCeti.Manifold.mgradient I u x‖ ^ 2 + q x * u x ^ 2
            ∂TauCeti.riemannianVolume I M := by
  sorry

end Schrodinger
```

Then make the module docstring and the README agree with the file:
1. Add "the first positive eigenvalue of Δ⁺ and the closed-manifold principal eigenfunction of Δ⁺+q (R5c)" to the docstring's statable list.
2. Add to its not-statable paragraph: "R5c's Dirichlet realization, strict domain monotonicity and scalar Dirichlet problem, which need a smooth-boundary domain of a manifold and sections smooth up to its boundary, absent at the pin".
3. Name the two theorems in backticks in R5c's items 4 and 1.

## R05 (P3) — The supplier contracts omit R5c's new inputs

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md` "Exact supplier contracts" (lines 176–855). Line 778: "[PDE A1–A6, D16–D19, E20–E22](../PDE/README.md): Sobolev, trace and energy/interior estimates for R5b's normal-Jacobi Dirichlet specialization."

**Claim:** R5c consumes the following, and none of it appears in the contracts:
- VariationalMethods 3.1 and 4.1–4.4;
- PDE C13;
- Tau Ceti `TauCeti.Manifold.laplaceBeltrami_eq_sum_hessian`, `TauCeti.W1p.posPartAbove`, `TauCeti.W1p.posPart_mem_w1p0Submodule`, `TauCeti.W1p0.extendByZeroL`, `TauCeti.Manifold.integral_mul_laplaceBeltrami_right_eq_left` and `IsCoercive.finiteDimensional_eigenspace_formSolutionOperator`.

The Scope paragraph (line 54) also cites VariationalMethods "4.1–4.4", while R5c uses 3.1 as well.

**Witness:** Lines 176–855 contain no "VariationalMethods", no "C13" and none of the six names. R5c cites them at lines 3375, 3448, 3456, 3511–3524 and 3516.

**Repair:**
1. Add the bullet "- [VariationalMethods](../VariationalMethods/README.md) 3.1, 4.1–4.4: compact form pairs, the ordered eigenbasis, expansions, Courant–Fischer and the counting function, at 𝕜=ℝ, for R5c."
2. Change the PDE bullet to "A1–A6, C13, D16–D19, E20–E22 … for R5b's normal-Jacobi Dirichlet specialization and R5c's bundle realization, strong maximum principle (C13) and global `H^(k+2)` regularity (E20)".
3. Add a Tau Ceti paragraph "For R5c" that names the six declarations with their files: `Riemannian/Laplacian.lean`, `Analysis/Sobolev/W1p/ChainRule.lean`, `W1p/Truncation.lean`, `W1p/Extension.lean`, `Riemannian/DivergenceTheorem.lean` and `Variational/Spectrum.lean`. Add `TauCeti.Manifold.integral_mul_laplaceBeltrami` from the R01 repair.
4. At line 54, replace "4.1–4.4" with "3.1 and 4.1–4.4".

## R06 (P3) — R5c has no *Needs:* lines

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md`, R5c, lines 3347–3628. The only dependency statement is Layer 5's "R5c uses R5b's Dirichlet realization … Green identities" (lines 3646–3653).

**Claim:** R5c's blocks have different inputs, but a single layer-level sentence covers all of them:
- the closed case uses K5a;
- the higher boundary estimate uses PDE A4–A6 and E20;
- the principal eigenfunction uses C13 and the truncations;
- the Dirichlet problem uses GeometricTopology Layer 1 and Lax–Milgram.

An implementer proving one block cannot see what it needs.

**Witness:** Lines 3347–3628 contain no `*Needs:*`. The R5a subsections do carry *Needs:* lines (2874, 2943, 3001, 3030, 3206).

**Repair:** End each block with its own line. Combined with the repairs above, the lines are:
- after the realization paragraphs: "*Needs:* R5b; ComplexKahlerGeometry K5a (closed case); PDE A4–A6, E20; PseudodifferentialOperators P1.0; SmoothBundlesConnections B2–B4; Tau Ceti `IsCoercive.formSolutionOperator`, `IsCoercive.finiteDimensional_eigenspace_formSolutionOperator`, `TauCeti.Manifold.laplaceBeltrami_eq_sum_hessian`."
- after the min–max and index paragraphs: "*Needs:* VariationalMethods 3.1, 4.1–4.4; PDE A6; the realization above."
- after the scalar principal eigenfunction route: "*Needs:* PDE C13; VariationalMethods 4.1, 4.3; Tau Ceti `TauCeti.W1p.posPartAbove`, `TauCeti.W1p.posPart_mem_w1p0Submodule`, `TauCeti.W1p0.extendByZeroL`, `TauCeti.Manifold.integral_mul_laplaceBeltrami_right_eq_left`, `TauCeti.Manifold.integral_mul_laplaceBeltrami`."
- after the Dirichlet problem route: "*Needs:* GeometricTopology Layer 1; Mathlib `IsCoercive.continuousLinearEquivOfBilin`; PDE A6, C13; the boundary estimate above."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 item 4, `24r=B_Q(x,w;y,z)−B_Q(y,w;x,z)` | K=1 orthonormal x,y with z=y, w=x; ω on ℝ⁴ at (e₁,e₂,e₃,e₄) | 16−(−8)=24=24·r(x,y,y,x); ω: 8−(−8)=16≠24 | holds; Check discriminates | none |
| §1.1 item 2, Andrews locator | `andrews-dg-ch16` lines 101, 105 | Prop. 16.2.1 on p. 154; slot convention K(σ)=R(e₁,e₂,e₁,e₂) | locator correct | none |
| §1.1 item 3, Einstein locators | `nicolaescu-lectures` lines 8870, 8888 | Ex. 4.2.36 p. 195 (λ=s/n); Exercise 4.2.38 p. 196 (dim≥3) | correct | none |
| §1.2 Checks and locator | `dx²+e^(2x²)dy²`; S³ of radius 1 and 2; line 4630 | K=−(2+4x²), ∂ₓK(1)=−8; a=2, ½; (3.3.7) spans pp. 103–104 | holds | none |
| §1.3 warped product | (0,π)×_sin S², k=2, t=π/3; `dx²+e^(2x)dy²`; `spacetime-guided-tour` 2919–2982 | Ric(V,V)=4/3+2/3=2; ⟨R(V,X)X,V⟩=−1; source R(V,X)Y=+Hess f/f·V | holds; Lemmas 35/36 pp. 61–62 | none |
| §1.3 bi-invariant metric | `andrews-dg-ch16` line 429 | Cor. 16.8.5 p. 162, R_ijkl=¼c_ijp c_klp ↔ −¼[[X,Y],Z] | correct | none |
| §1.3 Hopf normalisation | X=[[0,−1],[1,0]]; X=diag(0,i); Y=JX | 1=\|Xe₂\|=1; ½ against 1; K=1+3·1=4 | holds | none |
| §2.1 Jacobi Checks | sin t·E on unit S²; t²E flat | −sin t·E+sin t·E=0; residual 2E | holds | none |
| §2.2 frame and locators | unit S², t=π/2; octant triangle; `bishop-rg` 1885, 1893 | 1 against 2/π=0.637; holonomy π/2; §6.11 and Problem 6.12 on p. 41 | holds | none |
| §2.2 jet | unit S², e⊥v; `brewin-rnc` 363, 615; Nicolaescu 6793, 6801 | sin²\|v\|/\|v\|²=1−\|v\|²/3; −⅓R_acbd x^c x^d (p. 9), (11.1) p. 15; p. 151 | holds | none |
| §2.3 rescaling | λ²g; `bishop-rg` line 1872 | K(λ²g)=λ⁻²K; Theorem 6.11 p. 41, δ−⅓ΣR_ihjk x^h x^k | holds | none |
| `exists_jacobi_initial_data` | flat; constant geodesic | J=u+(t−a)v; solution space of dimension 2n | holds | none |
| `IsEndpointZeroSmoothSection`, `indexForm` | sin(πt)E on [0,1]; tE; S², f=sin(2t/3) on [0,3π/2] | member; X(1)=E≠0; (3π/4)(4/9−1)=−5π/12 | holds | none |
| `morse_index` | great circle on [0,π], [0,3π/2], [0,2π] in Sⁿ | 0; n−1; n−1 (conjugate point 2π is an endpoint) | holds | none |
| `singularHomology_loopSpace_sphere` | n=2; n=3; n=1 | ℤ in every degree; ℤ even, 0 odd; excluded by 2≤n | holds | none |
| `rauch_norm_ge_of_sectional_le` | sphere of radius 5/2, κ=1, t=π/2 | 2.5·sin(π/5)=1.4695≥1 | holds | none |
| `synge`, `synge_orientable_of_odd` | RP², RP³, flat T² | RP² non-orientable, excluded; RP³ orientable; K=0 excluded | holds | none |
| `modelBallVolume`, `guenther` | (κ,n)=(0,2),(1,2),(0,3); unit S² | r²/2; 1−cos r; r³/3; both sides 2π(1−cos r) | holds | none |
| `bishopGromov` | H² against κ=0 | vol/(r²/2)=6.82 at r=1, 8.68 at r=2: increasing, Ric=−1 excluded | hypothesis needed | none |
| `cartanHadamard_isCoveringMap` | ℝⁿ; flat Tⁿ | identity; ℝⁿ→Tⁿ with deck group ℤⁿ | holds | none |
| `bonnetMyers_distance`, `myers_finite_fundamentalGroup` | unit Sⁿ; RPⁿ; n=1 | diam π=π/√1; π₁=ℤ/2; excluded by 2≤dim | holds | none |
| `two_distinct_geodesics`, `killingHopf_*` | unit circle, p≠q; n=1 hyperbolic and spherical | two arcs differ at t=½; (0,∞) with dt²/t²≅ℝ; line excluded by 2≤n | holds | none |
| `three_simple_closed_geodesics`, paraboloid theorems | round S²; vertex | great circles; K(0)=4/(1+0)²=4, r(ℓ)>0 for ℓ>0 | holds | none |
| Bochner headlines | S², flat T², S²×S² | b₁=0; Ric=0 excluded (b₁=2); curvature operator not positive, b₂=2 | holds | none |
| `riemannianDist_eq_sSup_smooth`, R8 headlines | ℝ; S¹, S²; N=2 | \|x−y\|; d², d(d+1)=0,2,6; span{z^d, z̄^d} reducible | holds | none |
| R5c normal potential K | hypersurface, u=φν | ⟨Ku,u⟩=−(Ric(ν,ν)+\|A\|²)φ² with K(σ)=⟨R(X,Y)Y,X⟩ | matches R5b's Q | none |
| R5c coercive shift | c>k₀ | Q+c‖Ju‖²≥‖∇u‖²+(c−k₀)‖u‖²≥min(1,c−k₀)‖u‖²_V | holds | none |
| R5c realization | R5b lines 3262–3340 against R5c 3405–3427 | same L_D, H² estimate and domain, stated twice | two owners | R03 |
| R5c min–max and index | unit circle, q=−1; totally geodesic S²⊂S³ | −1,0,0,3,3: index 1; −2, 0 (×3), 4 (×5): index 1, nullity 3 | holds | none |
| R5c item 1 | (0,π)∪(2π,3π); Möbius bundle; closed M | μ₁=μ₂=1; μ₁=μ₂=¼ with zeros; closed case cited from PositiveMass 3.0 | Dirichlet case holds | R02 |
| R5c items 2 and 3 | circle q=−1, q=0; (π/4,3π/4)⊂(0,π); arc ℓ<2π⊂circle | μ₁=−1, no positive solution; h=1; 4>1; (π/ℓ)²>¼>0 | holds | none |
| R5c item 4 | unit circle; unit S² | λ₁=1 (∫cos²/∫sin²=1); λ₁=2 with multiplicity 3 | holds; route cites absent names | R01, R04 |
| R5c Dirichlet problem | (0,π): q=0, f=φ=1; q=−2; q=−1 | u=1+x(π−x)/2, −u″=1; u(π/2)=1/cos(√2π/2)=−1.651; cos x+b sin x=−1 at π | holds | none |
| R5c positivity and Friedrichs | Q(u⁻,u⁻); D with a closed component | Q(u,u⁻)=−Q(u⁻,u⁻)=∫fu⁻≥0 ⇒ u⁻=0; closed component has μ₁=0 | holds | none |
| R5c Tau Ceti citations | pin 2fd255d | 7 names and 2 files absent; 7 cited names present | unowned | R01 |
| R5c and PositiveMass | PositiveMass lines 134, 337, 679 | PositiveMass consumes R1, R4.1, R5a–b, R7.8, R8; 3.0→0.4→R1 | mutual supply | R02 |
| Spectral gap and principal eigenfunction | scratch copy of `Suggested.lean` | 25 `sorry` warnings, no other message; S¹: λ=1, f=sin | statable, absent | R04 |

- **Gate and changed files:**
  - Re-running the gate at 85cb8cb reports 0 in every check and `OK`.
  - `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RiemannianGeometry'` is empty.
  - The previous review (r32, #1683 at df3f6d4) had no findings, so there is nothing to re-check.
- **Dependency check:** `depcheck: 206 roadmaps, 1913 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. It does not see the RiemannianGeometry–PositiveMass pair of R02.
- **Elaboration and probe:**
  - `lake env lean` on `Suggested.lean` gives 23 `sorry` warnings (lines 109–600) and nothing else.
  - All 23 `sorry`s survive the one-tactic probe `first | rfl | (simp; done) | infer_instance | positivity | trivial | decide`.
  - The `#check` leads are `IsEndpointZeroSmoothSection` and `indexForm`. Both bodies need none of the binders they drop, and `morse_index` carries those binders.
- **Source locators checked against the text (15):**
  - `andrews-dg-ch16` 101, 105, 429;
  - `nicolaescu-lectures` 4630, 6793, 6801, 8870, 8888;
  - `spacetime-guided-tour` 2919, 2953;
  - `bishop-rg` 1872, 1885, 1893;
  - `brewin-rnc` 363, 615.
  - The README flags no locator as unverified.
- **Library declarations opened at the pins (11 present, 7 absent):**
  - `Laplacian.lean:601`, `W1p/ChainRule.lean:913`, `W1p/Truncation.lean:205`, `W1p/Extension.lean:229`;
  - `DivergenceTheorem.lean:302`, `:312`, `:337`;
  - `Variational/Spectrum.lean:459`, `Gradient/Basic.lean:73`, `VolumeDensity/Volume.lean:82`;
  - Mathlib `IsCoercive.continuousLinearEquivOfBilin` (through the existing contract).
- **Cross-roadmap citations resolved:**
  - ComplexKahlerGeometry 5.7 (K5a): real bundles and nonnegative Laplace-type systems, with the eigenvalues of P equal to κ−λ.
  - VariationalMethods 3.1 and 4.1–4.4: indexing from 0, with the counting function in 4.4.
  - PDE: C13 (variable symmetric coefficients, Gilbarg–Trudinger 3.5), E20 (global `H^(k+2)`), A6 (trace kernel and extension).
  - PositiveMass 3.0: `aΔ⁺+V`.
  - The `AT4.6` lead is AlgebraicTopology §4.6 (line 1666).
  - GeneralizedCohomology G4.0b is on main (line 1082). #1807 maps "G4" to Layer 4 in a former-numbering table, so the anchor needs no change.
- **Overlap check:**
  - Read: RicciFlow, Surfaces, PositiveMass, MinimalSurfaces (#2226), ManifoldOptimization, DGFloerPartII, SmoothBundlesConnections, plus Yamabe and PDE (found by object).
  - Shared objects:
    - The closed-manifold principal eigenfunction is owned by PositiveMass 3.0 and by Yamabe Y1 item 2. Both consume this roadmap, so the owner should be R5c (R02).
    - The Euclidean Dirichlet spectrum belongs to PDE D19, which R5c consumes.
    - Positive Jacobi functions belong to MinimalSurfaces MS7, which consumes R5c.
  - #2223–#2226 change other lines of this README and merge cleanly with this head.

## Not verifiable

- Gilbarg–Trudinger, Theorems 3.5, 8.12–8.14, 8.37 and 8.38 are behind a paywall. The sources service resolved DOI prefix 10.1007 to a paywalled page, so the citation is uncertified. The description states that 8.12 and 8.37 were cited from memory. Theorem 3.5 matches PDE C13's citation on main.
- Milnor, *Morse Theory*, §14 and Lemma 14.4 (§2.1), and O'Neill, Theorem 2 and Corollary 1 (§1.3), are uncertified in the manifest and are cited by locator only.

## Source issues

- none
