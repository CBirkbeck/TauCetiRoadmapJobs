# Review of RiemannianGeometry (pull request #1683 at ffb4475)

**Verdict:** needs changes

Six findings: one P2 and five P3. The gate passes, the dependency check is clean, `Suggested.lean` elaborates with only `sorry` warnings, and no declaration closes with one tactic. The sampled locators (§§1.1–2.3) and all headline locators I could read are correct.

## R01 (P2) — The Morse index theorem is statable at the pins but is declared "not statable"

**Location.** `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` lines 71–73: "the Morse index theorem (R3) and its focal-point version (R6), which need the index form on continuous piecewise `C¹` sections of `γ*TM`, which has no carrier at the pin". The README states the theorem in R3 (lines 1517–1521).

**Claim.** The obstacle given is not real. R3 defines the index as the supremum of the dimensions of negative-definite subspaces. Smooth endpoint-zero sections are dense in the piecewise-`C¹` (and H¹) ones, and negative definiteness of a finite-dimensional subspace is an open condition. So the index over smooth sections is the same number. Every carrier needed for that version is at the pin: Mathlib's `alongCurveWithin` and `leviCivitaConnection`, and Tau Ceti's `curvatureTensor`, `curveVelocityWithin`, `IsGeodesicCurveOn` and `TauCeti.Manifold.conjugateMultiplicity` (`TauCeti/Geometry/Manifold/Riemannian/Jacobi/Conjugate.lean:171`). The theorem is a headline: it is the core of the "Jacobi and index theory" milestone, and the docstring itself lists it as one. Leaving out a statable headline is a P2.

**Witness.** I added `public import TauCeti.Geometry.Manifold.Riemannian.Jacobi.Conjugate` and the three declarations below to section `Intrinsic` of a scratch copy of `Suggested.lean`. It elaborates at the pins with only the `sorry` warning.

**Repair.** Add the import and these declarations to `Suggested.lean` (section `Intrinsic`, under a `Layer 3` heading). Both definitions have real bodies on native carriers:

```lean
/-- Smooth sections of `γ*TM` on `[a, b]` vanishing at both ends. -/
def IsEndpointZeroSmoothSection (γ : ℝ → M) (a b : ℝ) (X : ∀ t, TangentSpace I (γ t)) : Prop :=
  ContMDiffOn 𝓘(ℝ, ℝ) I.tangent ∞ (fun t ↦ TotalSpace.mk' E (γ t) (X t)) (Icc a b) ∧
    X a = 0 ∧ X b = 0

/-- The index form `∫ₐᵇ ⟨D_tX, D_tY⟩ − ⟨R(X,γ′)γ′, Y⟩` of `γ` on `[a, b]`. -/
def indexForm (γ : ℝ → M) (a b : ℝ) (X Y : ∀ t, TangentSpace I (γ t)) : ℝ :=
  ∫ t in a..b,
    (inner ℝ ((CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ X (Icc a b) t)
        ((CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ Y (Icc a b) t) -
      inner ℝ ((CovariantDerivative.leviCivitaConnection I M).curvatureTensor (γ t) (X t)
        (TauCeti.Manifold.curveVelocityWithin I γ (Icc a b) t)
        (TauCeti.Manifold.curveVelocityWithin I γ (Icc a b) t)) (Y t))

/-- R3, the Morse index theorem: the index of the index form on smooth endpoint-zero sections,
the largest dimension of a family on whose span the form is negative definite, is the sum of the
conjugate multiplicities at the parameters strictly between `a` and `b`. -/
theorem morse_index {γ : ℝ → M} {a b : ℝ} (hab : a < b)
    (hγ : TauCeti.Manifold.IsGeodesicCurveOn I γ (Icc a b)) :
    IsGreatest {k : ℕ | ∃ X : Fin k → (∀ t, TangentSpace I (γ t)),
        (∀ i, IsEndpointZeroSmoothSection γ a b (X i)) ∧
        ∀ c : Fin k → ℝ, c ≠ 0 → indexForm γ a b (∑ i, c i • X i) (∑ i, c i • X i) < 0}
      (∑ᶠ t ∈ Ioo a b,
        TauCeti.Manifold.conjugateMultiplicity hγ isPreconnected_Icc (left_mem_Icc.2 hab.le) t) := by
  sorry
```

I tested it on the instances that refute the docstring. On a flat unit segment there are no conjugate points, so the finite sum is 0. The form is `∫|X′|²≥0`, so no nonempty family qualifies, and `IsGreatest` holds at 0. On a unit great circle of S² with `[a,b]=[0,3π/2]`, the only interior conjugate parameter is π, with multiplicity 1. The field `sin(2t/3)E` has form `−5π/12<0`, so the index is 1.

Name `morse_index`, `IsEndpointZeroSmoothSection` and `indexForm` in R3 next to "Prove the Morse index theorem". Say there that the smooth-section index equals the piecewise-`C¹` index of the bulk form. Then rewrite the docstring paragraph. It should keep only the focal version (R6) as not statable, with its real obstacle: the shape operator `S_(γ′(a))` of a submanifold of a Riemannian ambient (R5a's B and S) has no carrier at the pin.

## R02 (P3) — Five headline theorems have no source locator

**Location.** README R3.3 (line 1782, `singularHomology_loopSpace_sphere`), R5a.3 (lines 2936–3035, `paraboloid_geodesic_crossings` and `paraboloid_vertex_pole`), R8.2 (line 3650, `eq_harmonicSphereRestriction_of_laplaceBeltrami_eq_neg_mul`) and R8.3 (lines 3727–3733, `harmonic_irreducible`), with the matching docstrings in `Suggested.lean`.

**Claim.** Every theorem needs its locator. These headlines carry none. R3.3 cites Lyons only for the stereographic Hopf picture. R3.2 cites Milnor's Theorem 17.3 for the CW model the n≥3 route uses, but not for the homology statement. R5a.3 and R8.2 cite nothing. R8.3 cites Fulton–Harris only for the torus and Borel conventions.

**Witness.** A search of README lines 1778–1884, 2936–3040, 3648–3670 and 3671–3767 for theorem, proposition, corollary, exercise and page locators finds only Lyons (pp. 13–15) and "Fulton–Harris" (Lecture 18–19 conventions).

**Repair.** For each of the five, add the theorem (or exercise) number and page of a legal source. Put it at the claim in the README, in the docstring and in `## References`. Record paywalled texts as `uncertified`, as already done for `milnor-morse-theory` and `fulton-harris`. Candidates to read: for n≥3, Milnor's application of Theorem 17.3 to Sⁿ in §17, plus a separate source for n=2. For the spherical eigenspaces, Axler–Bourdon–Ramey, Chapter 5, which is already a Reference. For the paraboloid, the textbook exercise the R5a.3 route follows. The worker adds the new keys to the package `sources.toml`.

## R03 (P3) — Tau Ceti's Weyl-dimension formulas are cited as a roadmap's files by a truncated path

**Location.** README lines 3674–3677 and 3761–3763: "existing numerical Weyl-dimension APIs (including `ClassicalGroups/WeylDimension/OddOrthogonal.lean` and `ClassicalGroups/WeylDimension/EvenOrthogonal.lean`)", attributed to "ClassicalGroups Layers 3/5".

**Claim.** These files are pinned Tau Ceti declarations, not roadmap files. Pinned declarations belong in the `From Tau Ceti` contract under their exact names and paths. The contract does not mention them.

**Witness.** `TauCeti/RepresentationTheory/ClassicalGroups/WeylDimension/OddOrthogonal.lean:203` defines `TauCeti.oddOrthogonalWeylDimension`, and `EvenOrthogonal.lean:183` defines `TauCeti.evenOrthogonalWeylDimension`. On main, `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/` holds only `README.md` and `Suggested.lean`.

**Repair.** Add both declarations, with their full paths, to `### From Tau Ceti` under an R8.3 sentence. Cite them by name in R8.3 and its *Needs:* line. Keep ClassicalGroups Layer 3 only for the highest-weight classification. Tie the R8.3 dimension Check to them. The type-B₁ formula at λ=(d) gives `(d+½)/(½)=2d+1`, and the type-D₂ formula at λ=(d,0) gives `(d+1)²`. These equal `dim H_d` for N=3 and N=4.

## R04 (P3) — Tau Ceti declarations consumed without being named where they are consumed

**Location and claim.**

1. `TauCeti.Orientable` (`TauCeti/Geometry/Manifold/Orientation/Basic.lean:263`) appears in `synge` and `synge_orientable_of_odd`. `TauCeti.Manifold.curveVelocityWithin` (`TauCeti/Geometry/Manifold/MFDeriv/Curve.lean`) appears in `rauch_norm_ge_of_sectional_le` and `paraboloid_geodesic_crossings`. Neither name occurs in the README.
2. R3.1's *Needs:* line (lines 1626–1641) omits `AbsolutelyContinuousOnInterval.intervalIntegrable_of_ae_hasDerivAt` and Mathlib's `AbsolutelyContinuousOnInterval.mono`. Its own contract paragraph (lines 442–449) uses both for the converse.
3. The curvature-tensor link in `## Conventions` (line 146) points to Tau Ceti commit `a91d3aa`, line 148. The pin is `2fd255d`.

**Witness.** A count of each name in the README returns 0 for `curveVelocityWithin` and for `TauCeti.Orientable`. `hasWeakLineDerivOn_Ioo_iff_exists_ae_eq_add_intervalIntegral` assumes `LocallyIntegrableOn u' (Ioo a b)` (`Interval.lean:217–218`). At the pin, `def curvatureTensor` is at `Curvature/Tensor.lean:152`.

**Repair.** Add both carriers, with file and one-clause meaning, to `### From Tau Ceti` (R2/R4 and R4.6 paragraphs). Add the two absolute-continuity names to R3.1's *Needs:*. Either point the link at `2fd255d…/Curvature/Tensor.lean#L152` or cite the declaration by name and file only.

## R05 (P3) — Owned definitions and sign conventions without Checks

**Location.**

- R3.4 (lines 1884–1932) fixes a degree sign `(−1)^(n+1)` and an e₂-reflection normalisation. It has no Checks block.
- R4.7, item 7 (lines 2205–2306), pins the ball metric `4|dx|²/(1−|x|²)²`, the hyperboloid metric, the comparison `Sⁿ/±1 → Projectivization` and the orientation parity of RPⁿ. It has no Checks.
- R7.4 (lines 3455–3474) fixes the sign of `ℛ_p=−Σ a_i*a_j R^Λ(e_i,e_j)`. It has no Checks.

**Claim.** Each owned definition needs at least three discriminating Checks. Each sign or normalisation needs a computed two-term witness.

**Witness.** The README's `**Checks.**` blocks sit at lines …1856, 1982, …, 2177, 2368…, 3387, 3441, 3624…. None falls in 1884–1933 or 2205–2306. Within R7.1–R7.8 there is one, at 3441, and it belongs to item 3.

**Repair.** Add Checks such as the following. I computed each value:

- **R7.4.** On the unit Sⁿ, `ℛ_p=p(n−p)Id`. At p=1 this is `n−1=Ric`; the opposite sign gives `−p(n−p)`. On a flat torus, `ℛ_p=0`. On the unit S²×S², the area form of one factor is parallel and harmonic, so `ℛ_2` kills it, consistent with b₂=2.
- **R4.7.** The metric `c|dx|²/(1−|x|²)²` has `K=−4/c`. So c=4 gives −1, and dropping the 4 gives −4. The distance from 0 to x is `log((1+|x|)/(1−|x|))`, which is `log 3≈1.0986` at |x|=½. Since `det(−Id_(ℝⁿ⁺¹))=(−1)^(n+1)`, RP¹ is orientable and RP² is not; the wrong model `det(−Id_(ℝⁿ))` reverses both.
- **R3.4.** Compute the degree of the unnormalised adjoint at n=2 and n=3 against the stated values −1 and +1. Show that the e₂ reflection is applied exactly at n=2.

## R06 (P3) — A §1.2 Check states the opposite of what it shows

**Location.** README lines 956–957: "hence ∇R≠0 there, excluding all smooth metrics from the predicate."

**Claim.** As written, this says the local-symmetry predicate excludes every smooth metric. The preceding two Checks show Euclidean space and the round sphere satisfy it.

**Witness.** For `dx²+e^(2x²)dy²`, `K=−2−4x²` and `∂_xK(1)=−8`. So this one metric fails `∇R=0`, which excludes only the wrong model "every smooth metric is locally symmetric".

**Repair.** Replace the clause with: "hence ∇R≠0 there: this metric fails the predicate, so a predicate satisfied by every smooth metric is excluded."

## Verified sound

**Gate and dependency check.** I re-ran the gate at ffb4475; every check reports 0 (`… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`). The dependency check output: `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`. Nothing outside the folder is changed. The ordering against #1187 is stated in the description ("#1187 is rebased on this one").

**Lean.** `lake env lean` on `Suggested.lean` gives 22 `declaration uses 'sorry'` warnings and nothing else.

- **Padding probe.** Every `sorry` was replaced by `first | rfl | trivial | infer_instance | (simp; done) | (norm_num; done) | (aesop; done)`. All 22 fail.
- **Signatures.** I compared `#check @name` for all 24 declarations (the worker's transcript, plus my own `#check` of `guenther` and `riemannianDist_eq_sSup_smooth`) with the README. No binder is lost and nothing changed.
- **Instance probe.**
  - The Euclidean Killing–Hopf target uses Mathlib's flat `instRiemannianBundleTangentSpaceRealModelWithCornersSelf`, and its inner product is the Euclidean one by `rfl`.
  - The sphere uses `TauCeti.instRiemannianBundleSphere`.
  - The half-space uses Tau Ceti's hyperbolic instance (`Hyperbolic/UpperHalfSpace/Basic.lean:343`).
  - Tangent norms come from the scoped Riemannian instance (`Mathlib/Topology/VectorBundle/Riemannian.lean:431–458`), so `Metric.ball 0 r` in `guenther` is the metric tangent ball.
- **Duplication.** Tau Ceti has no Jacobi-field existence theorem and no index form at the pin, so neither `exists_jacobi_initial_data` nor R01 duplicates it. I opened Jacobi/, Distance.lean and FirstVariation.lean to check.

**Library declarations opened at the pins (24).**

- **Weak derivatives:** `TauCeti.HasWeakLineDerivOn` (`TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:212`) and `Interval.lean:217, 257, 273, 302, 318`.
- **Absolute continuity:** `AbsolutelyContinuousOnInterval.intervalIntegrable_of_ae_hasDerivAt` and `.integral_eq_sub_of_ae_hasDerivAt` (`TauCeti/MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean:79, 105`); `.comp_of_contDiffAt` (`TauCeti/MeasureTheory/Function/AbsolutelyContinuous/Comp.lean:49`); Mathlib `.mono` (`Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean:179`).
- **Exponential map:** `riemannianExp`, `isOpen_setOfPred_mem_expDomain` and `contMDiffOn_riemannianExp_tangentBundle` (`Geodesic/Exponential.lean:104, 185, 193`).
- **Jacobi fields:** `IsJacobiFieldOn` (`Jacobi/Basic.lean:59`); `conjugateMultiplicity` and `conjugateMultiplicity_le` (`Jacobi/Conjugate.lean:171, 203`).
- **Measure and topology:** `isNullSet_image_criticalPoints` (`Sard/EqualDimension.lean:105`); `finite_fundamentalGroup_of_compactSpace` (`AlgebraicTopology/UniversalCover/Compact.lean:56`).
- **Curvature:** `finrank_mul_le_of_laplaceBeltrami_eq_neg_mul` (`Lichnerowicz.lean:82`); `eq_of_ricciTensor_eq_smul_inner` (`Curvature/Einstein.lean:162`); `hasConstantSectionalCurvature_iff_isConstantCurvatureTensor` (`Curvature/Polarization.lean:147`).
- **Isometries, models, orientation:** `RiemannianIsometry` (`Isometry/Basic.lean:44`); `Orientable` (`Orientation/Basic.lean:263`).
- **Weyl dimensions:** the two files of R03.
- **Mathlib Levi-Civita:** `leviCivitaConnection` and `isMetricCompatible_leviCivitaConnection` (`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:360, 384`).
- **Backticked names.** All 192 dotted backticked names in the README resolve to a declaration at the pins.

**Cross-roadmap citations resolved on main.**

- **Supplier roadmaps.** All 24 exist on main: HopfRinow, ConformalMapping and UniversalCovers under `Completed/`, and DifferentialGeometry, SmoothBundlesConnections, GeometricTopology, ComplexKahlerGeometry, PDE, PseudodifferentialOperators, GeneralizedCohomology, TopologicalKTheory, CharacteristicClasses, GeometricMeasureTheory, Isoperimetry, SpinGeometry, AlgebraicTopology, LieGroups, ClassicalGroups, CompactGroups, MorseTheory, HeegaardFloer, DGFloer and Yamabe.
- **Anchors.** All 7 resolve.
- **Section ids found:** B5.1, B5.2, B6.0, A1, E20, P1.0, P7a, G4.0b, T6.6, C2.0 (line 730), AT 8.11a, K5a, K7.1 (line 1407), DGFloer Layer 2, OptimalTransport Layer 7, M5, GT Layer 8, I6.
- **Roadmap-owned names found:** `basedLoopCWType`, `finiteSourceMappingCWType`, `bundleDiskSphereRelCW`, `bundleDiskAttachmentCWModel`, `reducedSuspensionSphereHomeomorph`, `HyperbolicMetric`.
- **Overlaps.** None reported. PositiveMass, RicciFlow, TeichmullerGeometry, NoncompactQuantumSymmetry and ManifoldOptimization all consume this roadmap (checked with `roadmaps grep` and `roadmaps show`), so none is a second owner.

**Seeded sample, against the texts.**

- **§1.1:** `andrews-dg-ch16` line 105 (Proposition 16.2.1, p. 154, slot convention at line 101); `nicolaescu-lectures` lines 8870 (Example 4.2.36, p. 195) and 8888 (Exercise 4.2.38, p. 196, dimension ≥3).
- **§1.2:** `nicolaescu-lectures` lines 4604–4660 (§3.3.2, (3.3.7), pp. 103–104).
- **§1.3:**
  - `spacetime-guided-tour` lines 2919 and 2971–2976 (Lemma 35, pp. 61–62, opposite sign confirmed: `R(V,X)Y=H(f)(X,Y)/f·V`) and lines 2953, 2981–2983 (Lemma 36, p. 62).
  - `andrews-dg-ch16` line 429 (Corollary 16.8.5, p. 162; his `R_A=−R`, giving `¼c_ijp c_klp`).
  - O'Neill is uncertified.
- **§2.1:** Milnor is uncertified.
- **§2.2:** `bishop-rg` lines 1885–1892 (§6.11, the radially transported canonical frame, p. 41) and 1893–1904 (Problem 6.12, connection forms vanishing at p); `nicolaescu-lectures` lines 6793 and 6801 (Proposition 4.1.25 and Lemma 4.1.26, p. 151); `brewin-rnc` lines 363 (§5, p. 9) and 615 ((11.1), p. 15, the `−⅙∇_cR_adbe` term).
- **§2.3:** `bishop-rg` line 1872 (Theorem 6.11, p. 41).

**Headline locators.**

- **Rauch:** `eschenburg-comparison` lines 346 (Theorem 3.3, p. 13) and 372 (Rauch I, p. 14).
- **Günther:** `kwong-volume-comparison` lines 1766–1784 (Theorem 10(2), p. 27; Gray's Theorem 3.17 at line 1751).
- **Bishop–Gromov:** `zhu-ricci-comparison` lines 292 and 426 (Theorem 3.1, p. 226; Corollary 3.3(1), p. 228).
- **Cartan–Hadamard, Myers, Bochner, injectivity radius:** `nicolaescu-lectures` lines 10630 (Theorem 6.2.6, p. 238), 9923 (Theorem 5.2.26, p. 220), 10851 (Example 6.2.29, p. 243), 30622 (Theorem 12.2.5(b), p. 661) and 6772 (Definition 4.1.23, p. 151).
- **Synge:** `bishop-rg` lines 2302 and 2324 (Theorem 7.9 and Problem 7.11, p. 50).
- **Killing–Hopf:** `spacetime-guided-tour` lines 2845 and 2874 (Theorem 9, p. 60, n≥2).
- **Two geodesics:** `caponio-javaloyes-morse` lines 14–20 (§1, p. 1).
- **Positive curvature operator:** `petersen-wink-bochner` lines 39–40 (Corollary, p. 1).
- **Three geodesics:** `taimanov-three-geodesics` line 30 (abstract).
- **Hopf picture:** `lyons-hopf` lines 391, 415 and 449 ((L), (M) and Figure 10, PDF pp. 13–15).

**Adversarial table** (values computed by me):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 item 4 `24r=B_Q(x,w;y,z)−B_Q(y,w;x,z)` | K=1 orthonormal x,y with z=y, w=x; the ω-form on ℝ⁴ without Bianchi | 16−(−8)=24=24·1; ω: 8−(−8)=16≠24 | holds; negative control correct | none |
| §1.1 item 3 Einstein constancy | unit S³, radius-2 S³, their union; n=1 | a=2 vs ½, so connectedness is needed; Ric=0 forces a=0 | holds | none |
| §1.2 local symmetry | `dx²+e^(2x²)dy²` | K=−(2+4x²), ∂ₓK(1)=−8 | value correct, wording wrong | R06 |
| §1.3 warped curvature | (0,π)×_sin S², t=π/3; ℝ³∖0 | Ric(V,V)=4/3+2/3=2=k (Δ⁺ reading gives 0); flat cone gives 0 | holds | none |
| §1.3 O'Neill T and A | `dx²+e^(2x)dy²`; `e^(4x)`; Hopf S³→CP¹ | Γˣ_yy=−e^(2x), T_UU=−∂x and −2∂x; K=1+¾·4=4 | holds | none |
| §1.3 bi-invariant curvature | `∇_XY=½[X,Y]` | R=¼[[X,Y],Z]−½[[X,Y],Z]=−¼[[X,Y],Z] | holds | none |
| §1.3 conformal laws | n=2 | `Scal̃=e^(−2u)(Scal−2Δu)` from the Δ⁺ form | holds | none |
| §2.1 Jacobi Checks | great circle, J=sin t·E; flat t²E | D²J+R=−sin t·E+sin t·E=0; residual 2E | holds | none |
| §2.2 transported frame | unit S², t=π/2 | \|E_Y\|=1 vs \|d exp(Y)\|=2/π≈0.637; octant holonomy π/2 | holds | none |
| §2.2 metric jet | unit S² | sin²t=t²−t⁴/3+…, matching `t²−⅓Kt⁴` | holds | none |
| §2.3 rescaling | c=λ² | K(cg)=K(g)/λ²; correction O(λ⁻²) | holds | none |
| `exists_jacobi_initial_data` | flat; constant geodesic | X=u+(t−a)v realises (u,v); not one-tactic | holds | none |
| `rauch_norm_ge_of_sectional_le` | sphere of radius 5/2 with κ=1 | t=π/2: 1≤2.5·sin(π/5)=1.4695; t=5π/2 (outside the guard): 1≤0 fails | holds with the guard | none |
| `synge`, `synge_orientable_of_odd` | RP², T², RP³; n=0; circle | ℤ/2 (non-orientable), ℤ² (K=0), RP³ odd and orientable; point; circle orientable | holds | R04 (contract) |
| `singularHomology_loopSpace_sphere` | n=2, 3; n=1 | ℤ in all degrees; ℤ in even degrees; H₀(ΩS¹)=⊕ℤ excluded | holds | R02 |
| `modelBallVolume` | (n,κ)=(2,0), (2,1), (3,0), (1,·), (0,·) | r²/2; 1−cos r (2 at π); r³/3; r; r | holds | none |
| `guenther` | unit S², κ=1, r<π; n=1 | 2·(1−cos r)·π=2π(1−cos r)=vol; 1·r·2=2r | equality, holds | none |
| `bishopGromov` | unit S²; hyperbolic plane | 2π(1−cos r)/r²=2.888, 2.224, 1.273 at r=1, 2, π; H²: 3.41, 4.34 increasing (excluded by the Ricci bound) | holds | none |
| `cartanHadamard_isCoveringMap` | ℝⁿ; flat torus | exp a translation; ℝⁿ→Tⁿ a covering | holds | none |
| `bonnetMyers_distance`, `myers_finite_fundamentalGroup` | unit Sⁿ with λ=n−1; RPⁿ; line with n=1 | bound π=diam (sharp); π₁=ℤ/2; n=1 excluded by `hdim` | holds | none |
| `two_distinct_geodesics` | circle of length 2π, angle θ | arcs θ and 2π−θ, opposite directions | holds | none |
| `killingHopf_*` | n=0, 1; n=1 sphere case | point; line; UpperHalfSpace ℝ⁰=(0,∞) with dt²/t²≅ℝ; line not a circle | holds | none |
| `three_simple_closed_geodesics` | round S² | three great circles; Ico-injectivity excludes double traversal | holds | none |
| `paraboloid_geodesic_crossings` | a=1; circle r≡1; bounds; crossings | r″(0)=1/(a(1+4a²))=1/5; residual −1; `T_a≥R²−a²`, `A_a≥2a log(R/a)`; det=2ar′/R²>0 | holds | R02 |
| `paraboloid_vertex_pole` | vertex vs sphere of curvature 4 | K(0)=4, radial Jacobi r(ℓ)>0 vs sin(2ℓ)/2=0 at π/2 | holds | R02 |
| `subsingleton_deRhamCohomology_one_of_ricciTensor_pos` | flat S¹; S² minus two points | b₁=1 with Ric=0; b₁=1 noncompact | holds | none |
| `…_of_curvatureEndomorphism_pos` | S²×S²; Sⁿ minus two points; n=2 | Rop≥0 with b₂=2; b_(n−1)=1; Rop>0 means K>0 | holds | none |
| `riemannianDist_eq_sSup_smooth` | ℝ, clamped identity | \|f x−f y\|=\|x−y\|; target norm \|·\| (instance probe) | holds | none |
| `eq_harmonicSphereRestriction_…` | S¹, S², S⁰ | cos θ with λ=1; X₃ with λ=2, X₁X₂ with λ=6; Δ⁺ reading gives λ=−2; f(±1)=1,2 fails | holds | R02 |
| `harmonic_irreducible` | N=2, 3, 4 | (x₁±ix₂)^d with characters e^(∓idθ); 2d+1 (B₁); (d+1)² (D₂) | holds | R02, R03 |
| R3 Morse index theorem | flat [0,1]; S² with L=3π/2 | sin(πt)E: π²/2>0, index 0; sin(2t/3)E: −5π/12, index 1 = multiplicity at π | statable at the pins | R01 |
| R3.1 H¹ converse | Cantor function; contract | FTC gives 0≠1; `Needs` omits the integrability lemma | holds | R04 |
| R5b Dirichlet operator | Q=2uv; Q=−uv with c=2, 3; equator arc ℓ=3π/2 | S=½Id, L_D=2Id; L_D=−Id both ways (sign error gives 3Id); 4/9−1=−5/9, index 1 | holds | none |
| R6 `I_M` | unit circle, γ=(1−t,0) | 1/b−1: negative for b>1, kernel at b=1 | holds | none |
| R7.0 Bochner | f=x² on ℝ | −8+8+0=0 (dropping the 2 gives −4) | holds | none |
| R7.4 `ℛ_p` | unit Sⁿ; S²×S² | p(n−p); ℛ_1=n−1=Ric; 0 on a factor's area form | holds; no Checks | R05 |
| R4.7 ball metric, RPⁿ | c\|dx\|²/(1−\|x\|²)²; n=1, 2 | K=−4/c; det(−Id_(ℝⁿ⁺¹))=+1, −1 | holds; no Checks | R05 |
| R8.5 Veronese map | \|F\|² on S² | 3s²/4+3sz²+(2z²−s)²/4=(s+z²)²=1 | holds | none |

## Not verifiable

- **Uncertified by the manifest; cited by locator only.** O'Neill (Theorem 2, Corollary 1), Milnor's *Morse Theory* (§6, §§13–17), Lee's IRM (Chapter 10) and Fulton–Harris (Lectures 18–19). I checked O'Neill's formula and Milnor's sign convention computationally (table rows), not against the text.
- **Not in the package `sources.toml` and outside the seeded sample.** Homma, Azagra–Ferrera–López-Mesas–Rangel, Axler–Bourdon–Ramey, Toth–Ziller, Wang, Gage, Ma, Lauer, Grayson, Angenent, White, Allen–Layne–Tsukahara, Dobbins, and Gray and Morse (through Kwong and Caponio–Javaloyes). I did not fetch them, because this review edits no manifest. The worker should add their keys.
- **Not checked line by line.** R4.9's curve-shortening programme (lines 2359–2676). I spot-checked its formulas: A′=A−2π; the barrier lifetime −log cos a; `Hess d=((α²+β²)cos d−2αβ)/sin d`; E₀′ and E₁′, which reduce to the K=1 forms.

## Source issues

- **Misprint** in zhu-ricci-comparison at Theorem 3.1, p. 226: the source says vol(A_{s,S})/vol(A_{r,R}) ≥ the model ratio, with A_{s,S} the outer annulus; it should be ≤ (inner annulus over outer ≥), as Lemma 3.2, the proof and Corollary 3.3(1) show; affects nothing.
- **Error** in nicolaescu-lectures at Theorem 5.2.26, p. 220: the source says Myers's bound diam ≤ πr holds in every dimension n; it should assume n ≥ 2, since for n=1 the Ricci hypothesis is empty and the complete line is unbounded; affects nothing.
- **Gap** in nicolaescu-lectures at Exercise 4.2.38, p. 196: the source says an Einstein manifold of dimension ≥3 has constant scalar curvature; it should assume M connected (round S³ of radii 1 and 2, disjoint); affects nothing.
- **Error** in caponio-javaloyes-morse at §1, p. 1: the source says Serre's theorem gives loop-space homology in infinitely many degrees whenever some H_i(M), i>0, is nonzero, e.g. M compact; it should require M simply connected (the circle fails); affects nothing.
- **Gap** in bishop-rg at Theorem 7.9, p. 50: the source states Synge's theorem for compact orientable even-dimensional M with positive curvature; it should assume M connected (two disjoint round spheres are not simply connected); affects nothing.
- **Misprint** in lyons-hopf at Figure 10, published p. 96: the source labels the 3-sphere with a stray minus sign; it should read S³; affects nothing; corrected in print at arXiv:2212.01642v1, p. 1 (author's errata).
