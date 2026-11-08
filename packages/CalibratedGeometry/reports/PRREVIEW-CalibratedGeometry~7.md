# Review of CalibratedGeometry (pull request #946 at e65d893)
**Verdict:** needs changes

:robot: Independent AI review: a full review of the repaired head (783 changed lines since `37684bb`). The gate, the dependency check and the elaboration pass. All nine findings of the previous review are repaired. Four new findings, two blocking; both come from objects that the pinned Tau Ceti (`2fd255d9`) already has and that no earlier round opened: a comass file, and a tubular-neighbourhood library with a rough Hodge star that makes the second-variation headline statable. The worktree was not changed; every probe ran on scratch copies.

## R01 (P2) — Layer 1's frame-volume inequality, simple-vector comass and Riesz identification are pinned in Tau Ceti; `abs_eval_le_norm_mul_frameVolume` restates a pinned theorem

**Location.** `TauCetiRoadmap/CalibratedGeometry/README.md:44–47` ("its identification with the native operator norm, its comparison with the exterior-power Hilbert norm, the frame-volume inequality … (Layer 1)"); `:157–158` ("The native norm is an infimum of product-norm bounds; it is not an orthonormal-frame supremum, which is target 1.1"); 1.2 at `:366–375`; 1.3 at `:392–404` ("Identify a k-form with an element of the exterior power through `exteriorPower.alternatingMapLinearEquiv` and the Riesz isomorphism … Prove the simple-multivector form of 1.2"); `:1318` (GeometricCurrents consumes 1.2–1.3 from here); `TauCetiRoadmap/CalibratedGeometry/Suggested.lean:76`.

**Claim.** The comass characterization of the native norm, the frame-volume inequality `|φ v| ≤ ‖φ‖·vol(v)`, the simple-vector form and the Hilbert-norm comparison are built here, and the headline `abs_eval_le_norm_mul_frameVolume` is a result of this roadmap.

**Witness.** Tau Ceti `2fd255d9`, `TauCeti/Analysis/InnerProductSpace/Comass.lean`: `ContinuousAlternatingMap.le_opNorm_mul_norm_ιMulti` (`:101`, `‖ω v‖ ≤ ‖ω‖ * ‖ιMulti ℝ k v‖`, any normed target), `opNorm_le_iff_le_mul_norm_ιMulti` (`:115`, the norm is the comass in Harvey–Lawson's unit-simple-vector form), `norm_eq_norm_apply_orthonormalBasis` (`:123`, top degree), `TauCeti.norm_alternatingFormEquiv_le` (`:147`, `comass ≤ |φ|_H`), `exteriorPower.norm_formDualEquiv_le` (`:191`, mass `≤ √(n choose k)·norm`, the dual of 1.3's upper bound); `TauCeti/Analysis/InnerProductSpace/AlternatingForm.lean:71` `alternatingFormEquiv : ⋀[ℝ]^k V ≃ₗ[ℝ] V [⋀^Fin k]→L[ℝ] ℝ` (the Riesz identification, evaluation `⟪x, v₁∧⋯∧vₖ⟫` at `:77`) and `:154` `alternatingFormInner` (the Hilbert inner product of forms); `…/ExteriorPower/Basic.lean:152` `norm_ιMulti_sq` (`‖v₁∧⋯∧vₖ‖² = det gram v`) and `:156` Hadamard for wedges. On a scratch copy, `frameVolume v = ‖ιMulti ℝ k v‖` is proved from `LinearMap.normDet_sq_eq_det_gram` and `norm_ιMulti_sq`, and then `abs_eval_le_norm_mul_frameVolume` closes by `rw [this, ← Real.norm_eq_abs]; exact φ.le_opNorm_mul_norm_ιMulti v` (exit 0, no `sorry`). The previous reports' statement that Tau Ceti has no comass declaration was wrong at this pin.

**Repair.** Delete `abs_eval_le_norm_mul_frameVolume` from `Suggested.lean` (and `frameVolume`, which no other declaration uses). In the README: 1.2 consumes `le_opNorm_mul_norm_ιMulti` with `‖ιMulti ℝ k v‖` as the frame volume (keep the `normDet` identity as its one target, or define the volume as that norm); 1.3 consumes `alternatingFormEquiv`, `alternatingFormInner`, `opNorm_le_iff_le_mul_norm_ιMulti` for Harvey–Lawson's definition, `norm_alternatingFormEquiv_le` for the lower bound, and derives the upper bound `|φ|_H ≤ √(n choose k)·comass(φ)` in two lines from `norm_formDualEquiv_le` applied to `ξ = alternatingFormEquiv.symm φ` (`‖ξ‖² = (formDualEquiv ξ) φ ≤ √(n choose k)‖ξ‖‖φ‖`); 1.1's route cites `opNorm_le_iff_le_mul_norm_ιMulti` instead of "the comass form of 1.2". Rewrite the Scope bullet, the "From Mathlib" sentence at `:157–158` and the GeometricCurrents line at `:1318` so that Tau Ceti is the owner, and list the declarations above under "From Tau Ceti" with the file. `norm_eq_sSup_abs_orthonormal` may stay as Layer 1's headline: its `sSup` over orthonormal frames is not stated at the pin, although its proof is the orthonormalization inside `Comass.lean:66–96` plus the pinned iff.

## R02 (P2) — The special Lagrangian second-variation formula is statable at the pins; the docstring's reasons are false

**Location.** `TauCetiRoadmap/CalibratedGeometry/Suggested.lean:34–39`: "the pins have no normal bundle of an immersion into a Riemannian manifold and no variations of immersions with their variation fields"; `README.md:36–39` and 6.5 at `:1271–1276`.

**Claim.** The headline `δ²Vol(V) = ∫_N (|dβ|² + |δβ|²)` cannot be stated at the pins.

**Witness.** The statement below elaborates on a scratch copy of `Suggested.lean` with the two extra imports `TauCeti.Geometry.Manifold.Riemannian.HodgeStar` and `TauCeti.Analysis.InnerProductSpace.AlternatingForm`: exit 0, its `sorry` the only new warning. Its carriers are pinned: `TauCeti.RoughForm.hodgeStar` on rough forms (`TauCeti/Geometry/Manifold/Riemannian/HodgeStar.lean:73`), `TauCeti.alternatingFormInner` (`…/AlternatingForm.lean:154`), `ContinuousAlternatingMap.curryLeft` (Mathlib `Analysis/Normed/Module/Alternating/Curry.lean:38`), `mfderiv`, `deriv`, and this file's `immersionVolume`. A variation is a smooth map `ℝ × N → M` and its field a `mfderiv`; no bundle carrier is needed. The "no normal bundle" reason is also false as stated: the pin has the Euclidean normal bundle of a `C^(n+1)` immersion (`TauCeti/Geometry/Manifold/TubularNeighborhood/VectorBundle.lean`) and the intrinsic normal bundle with its normal exponential for embeddings into Riemannian manifolds (`…/TubularNeighborhood/Riemannian/Basic.lean:113`, `normalExp`).

**Repair.** Add under a `/-! ## Layer 6: … -/` heading (tested text; `ψ` is the fundamental form of `g`, `β = ι_V ψ|_N`, and `δβ` is read off as the function `±⋆d⋆β`, whose square is sign-free):

```lean
/-- The one-form `β = ι_V ψ` pulled back to `N` along `f`: `β_x(w) = ψ_{f x}(V x, df_x w)`. -/
def contractionPullback (ψ : RoughForm 𝓘(ℝ, E) M ℝ 2) (f : N → M) (V : N → E) :
    RoughForm I' N ℝ 1 := fun x ↦
  ((show E [⋀^Fin 2]→L[ℝ] ℝ from ψ (f x)).curryLeft (V x)).compContinuousLinearMap
    (mfderiv I' 𝓘(ℝ, E) f x)

/-- The Hodge energy density `|dβ|² + |δβ|²` of a rough one-form on an oriented Riemannian
`(m+1)`-manifold: the Gram norm of `dβ` and the function `±⋆d⋆β` read off through the rough
Hodge star. -/
def hodgeEnergyDensity {m : ℕ} [RiemannianBundle (fun x : N ↦ TangentSpace I' x)]
    (o : Manifold.Orientation I' N (Fin (m + 1))) (β : RoughForm I' N ℝ 1) : N → ℝ := fun x ↦
  alternatingFormInner (TangentSpace I' x) 2 (mextDeriv β x) (mextDeriv β x) +
    (RoughForm.hodgeStar o (k := m + 1) (l := 0) (by omega)
      (mextDeriv (RoughForm.hodgeStar o (k := 1) (l := m) (by omega) β)) x ![]) ^ 2

/-- **The special Lagrangian second variation**: for a compact phase-`θ` special Lagrangian
immersion `f` of a closed `(m+1)`-manifold into a Kähler manifold with fundamental form `ψ` and
normalized holomorphic volume form `Ω`, and a smooth family `F` through `f` with normal velocity
`V`, the second derivative of volume at `t = 0` is the Hodge energy `∫_N (|dβ|² + |δβ|²)` of
`β = ι_V ψ|_N` (McLean1998 line 598, Theorem 3.13). -/
theorem secondVariation_volume_eq_hodgeEnergy {m : ℕ} [I'.Boundaryless] [CompactSpace N]
    [T2Space N]
    (g : ContMDiffRiemannianMetric 𝓘(ℝ, E) ∞ E (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x))
    (hg : IsKahlerMetric g) (ψ : RoughForm 𝓘(ℝ, E) M ℝ 2)
    (hψ : ∀ x (v : Fin 2 → E), ψ x v = g.inner x (Complex.I • v 0) (v 1))
    (Ω : RoughForm 𝓘(ℝ, E) M ℂ (m + 1)) (hΩ : IsNormalizedHolomorphicVolumeForm g Ω) (θ : ℝ)
    (f : N → M) (hf : ContMDiff I' 𝓘(ℝ, E) ∞ f)
    (hinj : ∀ x, Function.Injective (mfderiv I' 𝓘(ℝ, E) f x))
    (o : Manifold.Orientation I' N (Fin (m + 1)))
    (hcal : IsCalibratedImmersion g (specialLagrangianForm Ω θ) f hf hinj o)
    (F : ℝ → N → M) (hF : ContMDiff (𝓘(ℝ, ℝ).prod I') 𝓘(ℝ, E) ∞ (Function.uncurry F))
    (hF0 : F 0 = f) (hFt : ∀ t, ContMDiff I' 𝓘(ℝ, E) ∞ (F t))
    (hFinj : ∀ t x, Function.Injective (mfderiv I' 𝓘(ℝ, E) (F t) x))
    (V : N → E) (hV : ∀ x, mfderiv 𝓘(ℝ, ℝ) 𝓘(ℝ, E) (fun t ↦ F t x) 0 1 = V x)
    (hVn : ∀ x w, g.inner (f x) (V x) (mfderiv I' 𝓘(ℝ, E) f x w) = 0) :
    letI : RiemannianBundle (fun x : N ↦ TangentSpace I' x) :=
      ⟨(g.pullback f (by simpa using hf) hinj).toRiemannianMetric⟩
    deriv (deriv fun t ↦ immersionVolume g (F t) (hFt t) (hFinj t) o) 0 =
      integralTopForm o (fun x ↦ hodgeEnergyDensity o (contractionPullback ψ f V) x •
        riemannianVolumeForm o x) := by
  sorry
```

The variable block is the complex ambient of the `SpecialLagrangianManifolds` section together with the real source `(E', H', N, I')` of the `Manifolds` section. The statement is McLean1998 Theorem 3.13 (line 598): minimality of `N` removes the acceleration term, so any smooth family with normal velocity `V` has this second variation. Then rewrite the docstring: the carriers missing for McLean's theorem are the moduli space (correct as written) and, for the Jacobi operator identification, a Jacobi operator; name `secondVariation_volume_eq_hodgeEnergy` in 6.5 and at `README.md:36–39`.

## R03 (P3) — Tubular neighbourhoods and the normal exponential are routed through GeometricTopology Layer 1 although they are pinned

**Location.** `README.md:94` ("Tubular neighbourhoods and normal exponential maps: GeometricTopology Layer 1"), `:267–268` and 6.1 at `:1072` ("Choose a tubular neighbourhood (GeometricTopology Layer 1)"), with 6.1's *Needs:* line.

**Claim.** The tubular neighbourhood of `N` and its normal-exponential description are a roadmap's to supply.

**Witness.** Tau Ceti `2fd255d9`, `TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/`: `TauCeti.normalExp` (`Basic.lean:113`, the normal exponential of a smooth embedding into a Riemannian manifold), `exists_partialDiffeomorph_normalExp_subset` (`Coordinates.lean:89`, a smooth inverse on a neighbourhood of the zero section inside any prescribed neighbourhood, `[SecondCountableTopology N] [Nonempty M]`, no compactness) and `exists_diffeomorph_normalBundle_riemannian_subset` (`Coordinates.lean:146`, the whole normal bundle onto an ambient neighbourhood). GeometricTopology Layer 1 on main (`TauCetiRoadmap/GeometricTopology/README.md:218–221`) cites Hirsch and Lee for the same theorem.

**Repair.** Cite these declarations under "From Tau Ceti" and in 6.1 and 6.4 (the tubular choices compared there are choices of `normalExp` domains); keep GeometricTopology Layer 1 for collars only, which the pin lacks outside knot theory.

## R04 (P3) — The period map is injective only on connected manifolds

**Location.** `README.md:214–215`: "the injective period map `TauCeti.deRhamCohomology.period` from `H¹_dR(M)` to homomorphisms `π₁(M, x) → ℝ`"; 5.3 at `:985–987`: "which determines the de Rham class through Tau Ceti's injective period map".

**Claim.** Periods at one base point determine a degree-one de Rham class.

**Witness.** `TauCeti/Geometry/Manifold/DeRham/Period.lean:468`, `period_injective [PreconnectedSpace M]`. On two disjoint circles, `dθ` on the component not containing `x` has every period at `x` zero and is not exact.

**Repair.** Add the hypothesis to the contract, and in 5.3 say that the phase class is determined by its periods on each connected component of the Lagrangian, applying `period_injective` componentwise.

## Previous findings

All nine findings of the previous review are repaired at this head:

- R01 (Campanato Hölder bound): 6.3 now states the local estimate for `|x − y| ≤ ρ₀/2` and the supremum bound with the `L²` term (`:1157–1170`), with the two-interval function and the `f(x) = x` on `(0, L)` family as negative controls (`:1223–1233`); the values recomputed below agree.
- R02 (fundamental theorem absent): `immersionVolume_le_of_isCalibratedImmersion` is stated (`Suggested.lean:134`), the docstring rewritten; the one new false docstring claim is R02 above.
- R03 (DifferentialGeometry Layers 6, 8, 9): the README cites only 1.4, 5.4 and 12.5, which resolve on main `665b395` (`DifferentialGeometry/README.md:325, :524, :930`) and at #886's head `e8165fc3` (`:537, :892, :1409`); smooth chains and de Rham cohomology are consumed from the pin.
- R04 (Campanato package owned): consumed by name at `:237–243` and `:1157–1176`; the `L¹` growth exponent `n − 1 + ζ` and the strict-exponent condition of the iteration lemma are stated.
- R05 (integral chain complex): 2.3 consumes `TauCeti.smoothSingularSubcomplex` with `SSet.chainComplex`, `SSet.chainComplexMap` and the naturality of `SSet.chainComplexFunctor` in the coefficient object (`:571–579`; Mathlib `AlgebraicTopology/SimplicialSet/Homology/Basic.lean:44, :73`).
- R06 (PDE drift): PDE 1.4 (A4) and 5.6 (E25) at `:295–300`, `:1191`, `:1248`; both resolve (`PDE/README.md:803, :2097`), and E25's scalar non-divergence `C²` statement matches the componentwise use.
- R07 (contracts): Hadamard cited from Tau Ceti (`:200–204`), R1 described as curvature calculus and R5a as the normal-bundle owner (`:257–263`), the Levi-Civita connection from Mathlib (`CovariantDerivative.leviCivitaConnection`, `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:360`), `TauCeti.IsSmoothTriangulation`, the pullback metric and the volume form listed.
- R08 (locators): 1.3 keeps II.(3.1) for the definition and gives the comparison its two-line proof (`:398–404`); 5.3 says Harvey–Lawson prove the flat case through (2.19) and the Kähler case is owned here (`:999–1001`).
- R09 (`hn`): deleted from `specialLagrangianFrame_iff` (`Suggested.lean:314`); 5.1 states the `n = 0` case (`:901–902`).

## Verified sound

**Gate, build, order.**
- The worker's gate on this head ends in `OK` with every scanner at 0, including `build=0`; no file outside the folder changed (`git diff --stat origin/main...HEAD` outside the folder is empty); the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- `lake env lean TauCetiRoadmap/CalibratedGeometry/Suggested.lean`: exit 0 in 11 s, eleven `sorry` warnings (lines 69, 76, 134, 168, 174, 223, 231, 264, 305, 314, 351) and nothing else.
- `gate --depcheck … --movable`: `depcheck: 239 roadmaps, 2430 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. `ORDER.txt`: TangentialBordism 15, CalibratedGeometry 226, DeRhamCohomologyAndDuality 395 (not cited).

**Signatures and padding.**
- All 25 elaborated signatures compared with the README. The four "dropped binder" leads are definitions whose types do not need the binder (`IsCalibration` without `FiniteDimensional ℝ E`; `IsKahlerMetric`, `IsNormalizedHolomorphicVolumeForm`, `specialLagrangianForm` without `FiniteDimensional ℂ E` or `IsManifold`); every theorem about them carries the hypotheses, so no statement lost generality or truth.
- One-tactic probe `first | rfl | simp | infer_instance | norm_num | aesop` on all eleven theorems: none closes. `abs_eval_le_norm_mul_frameVolume` closes from the pinned comass lemma after the volume identity (R01).
- `IsKahlerMetric`'s convention `ω(v,w) = g(iv,w)` agrees with the Conventions' witness: on flat `ℂ`, `ω(1,i) = g(i,i) = 1 = Im⟪1,i⟫`, and in general `g(iv,w) = Re(conj(i)⟪v,w⟫) = Im⟪v,w⟫`.
- `isCalibration_specialLagrangianForm` holds with only the Hermitian clause of `IsKahlerMetric` (closedness of `ω` is unused: the comass bound is Hadamard in a unitary frame, closedness is `Ω`'s). Noted, not raised: the sources state the Kähler setting.

**Seeded sample.** 15 targets, every locator read at the text:
- McLean1998 lines 27, 32, 37–48, 448 (Lemma 3.1), 450–462, 483 (Prop. 3.2), 486, 493, 510 (Thm 3.6), 519, 527, 530, 532, 539–550 (the map `F`), 572 (`F′(0)`), 580 (Lemma 3.12), 589–595, 598 (Thm 3.13, printed p. 723), 603 (Cor. 3.14);
- Joyce2001SLLectures lines 53 (Def. 2.1), 58–62, 70, 76 (phase convention), 90, 96 (Prop. 2.3), 107 (Prop. 2.4), 678 (Thm 5.1);
- Zust2025Products lines 59 (Thm 1.2), 74 (Cor. 1.4, copies of `Φ` in `⋀⁸ℝ³²`), 76 (`294/256`);
- Campanato1963 line 81 (`Ω` bounded and connected), line 224 (Teorema I.2, printed p. 183), line 238 (the polygonal chain uses connectedness);
- HarveyLawson1982 (cache copy): II.(3.1) line 370 p. 56, (3.3) line 380 and Lemma 3.5 line 393 p. 57, Thm 4.2 line 450 p. 59, Thm 6.11 line 807 and Lemma 6.13 line 814 p. 70, Prop. 7.10 line 1004 p. 76, Thm III.1.10 line 1412 and Cor. 1.11 line 1417 p. 89, Thm 2.3 line 1493 p. 91, Thm 2.13 line 1599 p. 95, Prop. 2.17 line 1647 p. 96.

**Library declarations opened at the pins.** Mathlib `1b1ccf4b`: `CovariantDerivative.leviCivitaConnection` (`LeviCivita.lean:360`), `SSet.chainComplexFunctor` and `chainComplexMap` (`Homology/Basic.lean:44, :73`), `ImplicitFunctionData.contDiffAt_implicitFunction` (`ImplicitContDiff.lean:41`), `LinearMap.continuous_of_finiteDimensional` (`FiniteDimension.lean:287`), `IsCoercive.continuousLinearEquivOfBilin`, `Matrix.gram` and `det_gram_ne_zero_iff_linearIndependent` (`GramMatrix.lean:40, :126`), `LinearMap.normDet` with `normDet_sq_eq_det_gram` (`NormDet.lean:69, :303`), the `ContinuousAlternatingMap` norm lemmas (`Alternating/Basic.lean:194, :310`), `norm_compContinuous_linearIsometryEquiv` (`Multilinear/Basic.lean:1038`), `Submodule.pow_mem_pow` (`Operations.lean:358`), `exteriorPower.alternatingMapLinearEquiv` (`ExteriorPower/Basic.lean:212`), `inner_ιMulti_ιMulti` (`InnerProductSpace/ExteriorPower.lean:127`), `ContMDiffRiemannianMetric` (`Riemannian.lean:245`), `ContinuousAlternatingMap.curryLeft` (`Curry.lean:38`).
Tau Ceti `2fd255d9`: `RoughForm` (`DifferentialForm/Basic.lean:41`), `IsSmoothForm` (`Smooth.lean:380`), `mextDeriv` (`ExtDeriv.lean:145`), `mpullback` (`Pullback/Basic.lean:241`), `mpullback_mextDeriv` (`Naturality.lean:249`, `C²` map), `RoughForm.wedge`, `homotopyOperator` (`HomotopyOperator.lean:100`), `integralTopForm` (`TopForm.lean:518`), `integralTopForm_mextDeriv` (`Integration/Stokes.lean:37`), `deRhamCohomology.period` and `period_injective` (`Period.lean:455, :468`), `smoothSingularSubcomplex`, `smoothSingularSubcomplexMap` (`SmoothSingular/Basic.lean:77, :205`), `SmoothSimplex.integral` (`Integral.lean:86`; no Stokes or smoothing theorem in that directory), `IsSmoothTriangulation` (`SmoothTriangulation/Basic.lean:47`), `ContMDiffRiemannianMetric.pullback` (`Riemannian/Pullback/Basic.lean:158`), `riemannianVolumeForm` (`VolumeForm.lean:55`), `RoughForm.hodgeStar` and `SmoothForm.hodgeStar` (`HodgeStar.lean:73, :296`), `SmoothForm.codifferential` with the sign `(−1)^(m(k+2)+1)` (`Codifferential.lean:88`), `SmoothAlmostComplexStructure.ofComplexManifold` (`AlmostComplexStructure.lean:76`), `ComplexManifold.isManifold_real` and `complexManifoldOrientation` (`Complex/Orientation.lean:195, :216`), `complexOrientation` as the orientation of `(b₀, i b₀, b₁, i b₁, …)` (`LinearAlgebra/Complex/Orientation.lean:156`), `W1p`, `W1p0` (`W1p/Basic.lean:372`, `Zero.lean:158`), `W1p.norm_value_le_mul_norm_gradient_of_subset_slab` (`Poincare/W1p0.lean:102`), `dist_preciseRepresentative_le_of_setAverage_norm_sub_le` (`Campanato.lean:257`), `holderOnWith_preciseRepresentative_of_setIntegral_norm_gradient_le` (`DirichletGrowth.lean:167`), `exists_le_mul_div_rpow_mul_add_mul_rpow_of_le_mul_add` (`DecayIteration.lean:109`), `PDE.energyFormH1` (`EnergyForm/Sobolev.lean:411`), `existsUnique_isWeakSolutionDirichlet` (`DirichletProblem.lean:334`), `stdSymplecticForm` (`StandardCompatible.lean:72`), `SymplecticForm.transport`, `AlmostComplexStructure.transport`, `IsLagrangian` (`Lagrangian/Basic.lean:115`), `complexAssociatedForm`, `hermitianCore` (`Hermitian.lean:78, :260`), `complexModule`, `TotallyRealLoop.maslovIndex` (`Maslov/Index.lean:99`), `Matrix.re_det_gram_le_prod_norm_sq` and `OrthonormalBasis.norm_det_le_prod_norm` (`Gram/Hadamard.lean:139, :77`), plus the comass, alternating-form, tubular-neighbourhood and second-fundamental-form files of R01–R03.

**Supplier citations resolved on main `665b395`.** DifferentialGeometry 1.4, 5.4, 12.5; PDE 1.4 (A4) `:803`, 5.6 (E25) `:2097`; ComplexKahlerGeometry K1 `:96`, K2 `:193`, K4 `:444`, K5a, K5b.0 `:1169`, K6.0 `:1245` (Kähler metrics as Hermitian metrics with closed fundamental form, their comparisons, complex submanifolds and curves), K6.1 `:1274`; AlgebraicTopology Stage 2 `:326`, Stage 3 item 1 `:481`, Stage 6 item 3 `:1180`; GeometricTopology Layer 1 `:177` and smoothing item 1 `:938`; RiemannianGeometry R1 `:179`, R5a `:1044`, R5a.1 `volumeVariation_isContDiff` `:1067–1069`, R5a.2 `:1103`, with CalibratedGeometry C3 named as consumer at `:1148`; PseudodifferentialOperators P1.0 `:164`, P5 `:927`, P6 `:1484`; SmoothBundlesConnections B1.4 `:421`, B2.5 (reductions) `:802`, B5 `:1070`; LieGroups Layer 2 (`RepresentationTheory/LieGroups/README.md:275`); CharacteristicClasses C1.1a `:246`; TopologicalKTheory T1.5 (item 5, `:228`) and T1.6a `:328`; GeneralizedCohomology G4.0b `:958`; HeegaardFloer F1.4 `:2195`, F2.6c `:2915`; GeometricCurrents' consumer lines `:65, :81, :88`. TangentialBordism B1.5 at #942's head `059ac6a9` (`README.md:632–660`, naming CalibratedGeometry 2.4 as consumer), in "Depends on" and before this roadmap in the order.

**Open revisions read by hand.** ComplexKahlerGeometry #1398 (`4f5ca964`) keeps K1, K2, K4, K5a, K5b.0, K6.0, K6.1 in its headings (`README.md:267, :406, :849, :996, :1806, :1949, :2070`); #1234 (`617869f6`) likewise; DifferentialGeometry #886 keeps 1.4, 5.4 and 12.5. `overlaps.md` lists no dropped id and no other pull request changing this folder.

**Ownership.** `roadmaps grep` for comass, calibration, Wirtinger, special Lagrangian and McLean finds only consumers (GeometricCurrents, ComplexComparisonPartII, GromovWittenTheory, HeegaardFloer F2.6c). Tau Ceti's comass file (R01) and tubular library (R03) are the only pinned owners found; no open roadmap builds calibrations.

**Adversarial table.** Values computed for the headlines, the sampled targets and every target a finding touches.

| Statement | Instances | Values computed (each side) | Result |
|---|---|---|---|
| `norm_eq_sSup_abs_orthonormal` | `2dx₁∧dx₂` on ℝ²; constant −3 (k = 0); k = 3 on ℝ² | ±2 on orthonormal frames, sup 2; {3}, 3 = ‖const‖; `sSup ∅ = 0 = ‖0‖` | holds; corollary of pinned `opNorm_le_iff_le_mul_norm_ιMulti` (R01) |
| `abs_eval_le_norm_mul_frameVolume` | `((1,0,0),(1,1,0))`, `dx₁∧dx₂`; `(v,v)`; `((2,0),(0,3))`; empty frame | `1 ≤ 1·1`; `0 ≤ 0`; normDet 6 = `‖ιMulti v‖`; 1 = 1 | holds; pinned (R01, probe exit 0) |
| 1.3 comparison | `dx₁∧dx₂+dx₃∧dx₄` on ℝ⁴; degree 1; `dx₁∧⋯∧dx_k` | `1 ≤ √2 ≤ √6`; equal; `1 = 1`; upper bound from `norm_formDualEquiv_le`: `‖ξ‖² ≤ √6‖ξ‖‖φ‖` | holds; pinned up to two lines (R01) |
| 1.4 Checks | k = 1 in ℝ; k = 2 in ℝ³; k = 0 | 2 points; `S²`, `6 − 3 = 3`; two rays | holds |
| 1.5 Checks | `dx₁∧dx₂` on `(e₁,e₂)`, `(e₂,e₁)`, `(e₁,e₃)`; `((2,0,0),(0,1/2,0))` | `1, −1, 0`; value 1, not orthonormal | holds |
| 1.6 Checks | `dx∧dx`; `ω₁∧ω₂`; Züst `Φ₁∧Φ₂` | ±1, `binomial(2,1) = 2`; 1 on `(e₁,ie₁,e₂,ie₂)`, `binomial(4,2) = 6`; `294/256 > 1` | holds |
| `IsCalibration` (2.1) | `dx₁∧dx₂`; `2dx₁∧dx₂`; `x₃dx₁∧dx₂`; constant −2 (k = 0) | comass 1, closed; comass 2; `d = dx₁∧dx₂∧dx₃`, comass `|x₃|`; `|−2| = 2 > 1` though `−2 ≤ 1` | holds; absolute bound needed |
| `immersionVolume`, `IsCalibratedImmersion` (2.2) | circle radius 2, both orientations; plane `x₃ = 0` reversed; plane `x₃ = x₁` | 4π, 4π (form and integral both flip); `f*φ = −dvol`; `f*φ = dvol/√2` | holds |
| 2.3 Stokes and mass | `σ(t) = t`, `η = x²`; folded `t ↦ |2t−1|`; `∂∂σ` | `∫₀¹2t = 1 = η(1) − η(0)`; mass 2, image length 1; 0 with signs, each vertex twice without | holds |
| 2.4 square | `[a,b,d]`, `[a,c,d]` | signs +1, −1; `[a,d]` coefficients −1, +1; `∂c = [a,b]+[b,d]−[c,d]−[a,c]` | holds |
| `immersionVolume_le_of_isCalibratedImmersion` (3.1) | flat torus, `t ↦ (t,0)` vs `t ↦ (t, sin(2πt)/4)`; reversed circle; k = 0 | periods `(1,0)` both, lengths `1 < ∫√(1+(π/2)²cos²) `; period −1, excluded; `#N ≤ Σ_{N′} sign(o′) ≤ #N′` with `η = 1` | holds in every degree |
| 3.2 / 3.3 | disk vs hemisphere; equator `Sᵐ ⊂ S^(m+1)` | `π ≤ 2π`; `(cos^m t)″(0) = −m`, −2π at m = 1 | holds |
| `standardKahlerForm`, `norm_standardKahlerForm` | n = 1 `(1,i)`, `(i,1)`; n = 0 | `Im(conj 1·i) = 1`, −1; zero form, so `hn` needed | holds |
| `isCalibratedFrame_standardKahlerForm_iff` | `(1,i)`, `(i,1)`, `(1,−i)`; n = 2 `(e₁,e₂)`; n = 0 | T/T, F/F, F/F, F/F (`ω = 0`), F/F | both directions |
| `kahlerPowerForm`, `norm_kahlerPowerForm` | n = r = 2; r = 0; r = 3 > n = 2 | `⟪ω̂², e₁∧ie₁∧e₂∧ie₂⟫/2! = 2/2 = 1`; constant 1; zero form | holds; `hr` needed |
| `isCalibratedFrame_kahlerPowerForm_iff` | n = 3, r = 2, `(e₁,ie₁,e₂,cos t·ie₂+sin t·e₃)`, t = 0, π, π/2 | `cos t` = 1 / −1 / 0; `u = (e₁,e₂)` at t = 0; reversed at π; real 4-plane at π/2 | T/T, F/F, F/F |
| `IsKahlerMetric` (4.3) | flat ℂⁿ; `dx²+4dy²` on ℂ; `|z|⁻²Re⟪·,·⟫` on `ℂ²∖0` | `ω(1,i) = g(i,i) = 1`; `g(i,i) = 4 ≠ 1`; `d(|z|⁻²)∧ω₀` has `−2x₁|z|⁻⁴ dx₁∧dx₂∧dy₂` | holds; both clauses needed |
| `immersionVolume_le_of_isKahlerMetric` | r = 0 (points); line `{z₂ = 0}` in ℂ², unit disk | `#N ≤ #N′` through `η = 1`; π against any surface with equal periods | holds; `complexOrientation` is `(b₀, ib₀, …)` so `f` is calibrated by `+ωʳ/r!` |
| `standardComplexVolume`, `norm_standardSpecialLagrangianForm` | n = 2 `(e₁,ie₂)`; n = 0, θ = π/2 | `det = i`; constant `cos(π/2) = 0`, so `hn` needed | holds |
| `specialLagrangianFrame_iff` | n = 2 `(e₁,ie₂)` at θ = 0, π/2; `(e₁,ie₁)`; n = 0 | `Re i = 0` F/F, `Re(−i·i) = 1` T/T; `Ω = 0`, `Im⟪e₁,ie₁⟫ = 1`, F/F; `cos θ = 1 ⇔ sin θ = 0 ∧ cos θ > 0` | holds for every n |
| `IsNormalizedHolomorphicVolumeForm` (5.3) | `dz` on ℂ; `2dz`; `dz̄`; `dz₁` on ℂ²; n = 0; `0 < n < m` | modulus 1 on `e^(iα)`; 2; `conj(i·1) = −i ≠ i`; 0 on `e₂`; constant of modulus 1; a hyperplane of `⋀ⁿℂᵐ` meets the Plücker cone, so none exists | holds; the 5.3 bullets agree |
| `specialLagrangianForm` | θ + π; θ + π/2 | `Re(−e^(−iθ)Ω) = −φ_θ`; `Re(−i e^(−iθ)Ω) = Im(e^(−iθ)Ω)` | holds |
| `isCalibration_specialLagrangianForm` | n = m unitary frame; real-orthonormal `v`; n > m; n = 0 | `Ω_x = c·det_u`, `|c| = 1`, `|det_ℂ v| ≤ Π‖v_i‖ = 1`; zero form; `|cos(θ − arg Ω_x)| ≤ 1` | holds; only the Hermitian clause used |
| 5.3 circle | radius ρ, `t = ie^(is)` | θ = s + π/2, `H = −e^(is)/ρ = J grad θ`, Maslov degree 2 | holds |
| 5.4 Checks | `ax²/2`; `x₁x₂`; `|x|²/2` | `arctan a`; `det[[1,i],[i,1]] = 2`, phase 0; `(1+i)² = 2i`, phase π/2 | holds |
| 6.1 sign | `V = Σa_j∂_(y_j)` on ℝⁿ | `β = −Σa_j dx_j`, `ι_V Im Ω = −★β`, `ω(∂_(y₁),∂_(x₁)) = −1` | holds |
| 6.2 Checks | S¹; two circles; Tⁿ | `∫f = 0`; per-component ±1, excluded; `b₁ = n` | holds |
| 6.3 Campanato (repaired) | two-interval `f`; `f(x) = x` on `(0,L)`, `ρ₀ = 1/2` | `[f] = 0`, Hölder seminorm `2^(−ζ)`, sup bound `1 ≤ C√10`; `[f] = (2/3)(1/2)^(2−2ζ)` (`∫_(−ρ)^ρ t² = 2ρ³/3`), seminorm `L^(1−ζ)` | holds; global bound correctly withheld |
| 6.3 iteration | n = 1, γ = 0.75; n = 2, 3 | `κ₀ = 0.5`; `2γ`, `1 + 2γ` in `(0, n)` | holds |
| 6.4 Checks | Tⁿ in T^(2n); n = 1 | n translations = `b₁`; one family = `b₁(S¹)` | holds |
| 6.5 second jet / `secondVariation_volume_eq_hodgeEnergy` | `A = (a)`; `diag(1,−1)`; `[[0,1],[−1,0]]`; flat torus, `V = Σa_j∂_(y_j)` | `a²`; `0`; `4 = (A₁₂ − A₂₁)²`; `β` constant, `dβ = 0 = δβ`, second variation 0 | holds; statable (R02, probe exit 0) |

## Not verifiable

- Munkres1966EDT (Chapter II, §10, via TangentialBordism B1.5) is waived; not read.
- Lee2012ISM Theorems 18.7 and 18.12 (2.3) are uncertified; cited by locator, not read.
- HarveyLawson1982 is recorded `uncertified`; the locators were checked against the article's text in the sources cache.
- The truth of the eleven admitted theorems is not established by the build; the instances above are hand computations.
- Ownership against ComplexKahlerGeometry #1807 was not checked: the brief gives no files for it.

## Source issues

- none
