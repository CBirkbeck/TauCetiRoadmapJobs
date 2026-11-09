# Review of RiemannianGeometry (pull request #1683 at a09b302)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/RiemannianGeometry/README.md` and `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` at `a09b302`.

- **Pins.** Unchanged since the previous review: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`.
- **Outside the folder.** Nothing changes: `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Gate.** My gate run prints every counter 0 and `OK`; the worker's run also reports `build=0`.
- **Dependency check.** `depcheck: 236 roadmaps, 2281 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `Suggested.lean` elaborates with exit code 0 and exactly 21 `declaration uses sorry` warnings.
- **Previous findings.** Seven of the previous review's eight findings are repaired (R01–R07). Its R08 is not, and is raised again as R03.
- **New findings.**
  - The README still plans, as its own targets, results that the pinned Tau Ceti proves: curvature identities, local symmetry, scaling, products, the exponential differential, normal coordinates and isometry groups (R01).
  - R8.2's eigenspace identification is statable at the pins but is neither stated nor named in `Suggested.lean` (R02).
  - One sentence of R7.7 has no main verb (R04).

## R01 (P2) — R1.1, R1.2, R1.3, R2.1, §2.2 and R4.7 still plan results that the pinned Tau Ceti proves

**Location and claim.** Each passage below states, as a target to prove or construct, a result that the pinned Tau Ceti already has. None of these declarations is cited anywhere in the README. This is the same class of defect as the previous review's R02. That repair covered the items it listed; these remain. All Tau Ceti paths below are under `TauCeti/Geometry/Manifold/`.

- **R1.1 item 1** (`README.md:547–559`).
  - Quoted: "Supply every missing metric symmetry, pair interchange and both Bianchi identities, their coordinate and moving-frame formulas, and smoothness … Induced tensor connections define ∇R; prove … isometry naturality … pin the Ricci identity".
  - At the pin, in `VectorBundle/CovariantDerivative/Curvature/`:
    - `CovariantDerivative.curvatureTensor_cyclic_eq_zero` and `CovariantDerivative.IsMetricCompatible.inner_curvatureTensor_swap_pairs` (`Bianchi.lean:83, 102`);
    - `CovariantDerivative.IsMetricCompatible.inner_curvatureTensor_eq_neg` (`Metric.lean:111`);
    - `CovariantDerivative.covariantDerivative_curvatureOperator_cyclic_eq_zero` (`SecondBianchi.lean:127`);
    - `CovariantDerivative.secondCovariantDerivative_sub_swap` and `…_of_isTorsionFree` (`SecondCovariantDerivative.lean:76, 92`), the Ricci identity with and without its torsion correction;
    - `CovariantDerivative.curvatureTensor_symm_trivializationAt` (`Coordinates.lean:149`);
    - `CovariantDerivative.contMDiff_curvatureTensorCLM` (`Smoothness.lean:65`);
    - `CovariantDerivative.derivCurvatureTensor` (`Derivative.lean:348`);
    - and, in `Riemannian/Isometry/LocallySymmetric.lean:85`, `TauCeti.IsLocalRiemannianIsometry.mfderiv_derivCurvatureTensor`.
- **R1.2** (`README.md:574–580, 638–640`).
  - Quoted: "Define local symmetry by ∇R=0"; "Constant sectional curvature implies local symmetry"; the API "invariance under local isometry".
  - At the pin:
    - `CovariantDerivative.HasParallelCurvature` and `CovariantDerivative.HasConstantSectionalCurvature.hasParallelCurvature` (`Curvature/LocallySymmetric.lean:102, 169`);
    - `TauCeti.IsLocalRiemannianIsometry.hasParallelCurvature` (`Riemannian/Isometry/LocallySymmetric.lean:140`).
  - The README cites only the surface theorem from the first file.
- **R1.3** (`README.md:682–685`), and §2.3 and Downstream consumers, which attribute "R1's constant-scaling law" to R1 (`:1065`, `:3277`).
  - Quoted: "Metric scaling, products, pullbacks, conformal changes and warped products get full connection/curvature transformation laws … a constant scaling c>0 preserves the connection and scales K by 1/c."
  - At the pin:
    - in `Riemannian/Scaling.lean`, `Bundle.ContMDiffRiemannianMetric.leviCivitaConnection_rescale_const_apply` (`:160`), `ricciTensor_…_rescale_const` (`:275`), `scalarCurvature_rescale_const` (`:288`) and `sectionalCurvature_leviCivitaConnection_rescale_const` (`:298`);
    - in `Curvature/Prod.lean`, `TauCeti.Manifold.tangentSpaceProdEquiv_curvatureTensor_leviCivitaConnection_prod`, `ricciTensor_leviCivitaConnection_prod` and `scalarCurvature_leviCivitaConnection_prod` (`:124, 153, 176`);
    - in `LeviCivita/WarpedProd.lean:150`, `TauCeti.Manifold.IsWarpedProduct.tangentSpaceProdEquiv_leviCivitaConnection_prodVectorField`.
- **R2.1** (`README.md:930–932`).
  - Quoted: "Prove `d exp_(tv)(tw)=X(t)` for X(0)=0,D_tX(0)=w, by uniqueness from Tau Ceti's radial Jacobi field".
  - At the pin: this is `TauCeti.Manifold.IsJacobiFieldOn.eq_mfderiv_riemannianExp` (`Riemannian/Jacobi/Exponential.lean:155`).
- **§2.2** (`README.md:1031–1033`).
  - Quoted: "In a normal chart prove first derivatives of g vanish (Nicolaescu … Proposition 4.1.25, p. 151)".
  - At the pin: `TauCeti.Manifold.IsNormalDomain.mfderiv_inner_normalCoordinateField_self` and `…leviCivitaConnection_normalCoordinateField_self` (`Riemannian/Geodesic/Normal/Coordinates.lean:292, 270`).
- **R4.7** (`README.md:1805–1807, 1846–1847`).
  - Quoted: "complete the missing surjectivity/isometry-group descriptions"; "Local isometries of a connected source are determined by value and tangent map at one point. Identify round-sphere isometries with O(n+1)".
  - At the pin:
    - `LinearIsometryEquiv.unitSphereIsomHom_surjective` and `LinearIsometryEquiv.unitSphereIsomMulEquiv` (`Riemannian/Isometry/Sphere/Classification.lean:93, 163`);
    - `TauCeti.UpperHalfSpace.exists_eq_similarity_or_exists_eq_inversion_mul_similarity` (`Riemannian/Isometry/UpperHalfSpace.lean:397`);
    - `TauCeti.RiemannianIsometry.ext_of_mfderiv_eq` (`Riemannian/Isometry/Ext.lean:112`), which covers isometries but not local isometries.

**Witness.**
- `Normal/Coordinates.lean:292–295` concludes `mfderiv I 𝓘(ℝ, ℝ) (fun q ↦ ⟪X_{w₁} q, X_{w₂} q⟫) p = 0`.
- `Isometry/Sphere/Classification.lean:93` states `Function.Surjective (unitSphereIsomHom …)`.
- `Scaling.lean:298` multiplies sectional curvature by `c⁻¹`.

**Repair.**
1. Delete each restated target from its passage. In its place write one sentence that cites the declarations above by name and file. Add them to the "From Tau Ceti" contract.
2. Keep only what goes beyond the library:
   - R1.1: the moving-frame formulas, the SBC B4 matrix comparison with `(d_∇)²=R∧·`, and the torsion/affine difference comparisons;
   - R1.2: restriction to open submanifolds, the parallel-transport characterization, and flat ⇔ locally Euclidean;
   - R1.3: the pullback laws and warped-product curvature;
   - R2.1: the varying-basepoint version;
   - §2.2: the quadratic and cubic jets and the radial-parallel frame;
   - R4.7: the extension of `ext_of_mfderiv_eq` to local isometries, O⁺(n,1) and E(n)=ℝⁿ⋊O(n).
3. At `:1065` and `:3277`, replace "R1's constant-scaling law (§1.3)" with `Bundle.ContMDiffRiemannianMetric.sectionalCurvature_leviCivitaConnection_rescale_const`. Do the same in R1.5's `*Needs:*` (`:1078`).

Tested: every name above resolves at the pinned Tau Ceti, at the file and line given.

## R02 (P2) — R8.2's eigenspace identification is statable at the pins but is neither stated nor named

**Location.**
- `Suggested.lean:28–41` (the statable list) and `:54–62` (the not-statable list). Neither mentions R8.2.
- `README.md:3119`: "prove that restriction identifies the constructed harmonic degree-d space with the entire smooth and L² eigenspace for λ_d=d(d+m−1)".

**Claim.** The spectrum of the round sphere is the central theorem of R8 ("Spherical harmonics"), and R8.4's Takahashi theorem rests on it. Every carrier it needs is at the pins:
- the round metric on `Metric.sphere` (`Riemannian/Sphere/Basic.lean:77–86`);
- `TauCeti.Manifold.laplaceBeltrami` (`Riemannian/Laplacian.lean:238`);
- `MvPolynomial.harmonicSphereRestriction` (`TauCeti/Analysis/MvPolynomial/Sphere.lean:115`).

A statable headline that is absent is P2. Even if it were judged not statable, the docstring would have to name it.

**Witness.** The theorem in the repair below, added to a scratch copy of `Suggested.lean` together with the two imports, elaborates with 22 `sorry` warnings and no error.

**Repair.**
1. Add `public import TauCeti.Geometry.Manifold.Riemannian.Laplacian` and `public import TauCeti.Analysis.MvPolynomial.Sphere`.
2. In `section SphericalHarmonics`, add:

```lean
/-- R8.2: on the unit round sphere `Sᵐ ⊂ ℝᵐ⁺¹`, `m ≥ 1`, every nonzero smooth eigenfunction of
Tau Ceti's Laplace–Beltrami operator, `Δf = −λf` with `Δ = div grad`, has `λ = d(d + m − 1)` for a
degree `d` and is the restriction of a harmonic homogeneous polynomial of degree `d`. -/
theorem eq_harmonicSphereRestriction_of_laplaceBeltrami_eq_neg_mul {m : ℕ} (hm : 1 ≤ m)
    (f : Metric.sphere (0 : EuclideanSpace ℝ (Fin (m + 1))) 1 → ℝ)
    (hf : ContMDiff (𝓡 m) 𝓘(ℝ, ℝ) ∞ f) (hf0 : f ≠ 0) {lam : ℝ}
    (heig : ∀ x, TauCeti.Manifold.laplaceBeltrami (𝓡 m) f x = -lam * f x) :
    ∃ d : ℕ, lam = (d : ℝ) * ((d : ℝ) + m - 1) ∧
      ∃ p : MvPolynomial.harmonicSubmodule (Fin (m + 1)) ℝ d,
        ⇑(MvPolynomial.harmonicSphereRestriction (Fin (m + 1)) d p) = f := by
  sorry
```

3. Name the theorem in R8.2. Add the round metric, `laplaceBeltrami` and `MvPolynomial.harmonicSphereRestriction` to the R8 contract.
4. Add "the eigenspaces of the round-sphere Laplacian (R8.2)" to the docstring's statable list.

Tested: on the instances in table row R8.2. `m ≥ 1` is needed: on `S⁰`, λ = 0 arises from both d = 0 and d = 1.

## R03 (P3) — The description still does not order this pull request against #1187

Re-raised: R08 of the previous review. No repair report marks it as not actionable.

**Location.** The pull-request description. It names #1327 and #1974 but not #1187.

**Claim.** The overlap tool reports that #1187 changes `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` and that its head conflicts with this one. #1187's Tau Ceti pin `ab00ba392` is an ancestor of this head's `2fd255d9`. Nothing in the description says which pull request is rebased on which.

**Witness.** The overlap tool (`roadmaps overlaps RiemannianGeometry`) lists `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` among #1187's conflicting files.

**Repair.** Add one sentence to the description: this pull request does not wait for #1187, whose Tau Ceti pin is an ancestor of the current pin, so #1187's change to this folder is superseded.

## R04 (P3) — R7.7's pinching sentence has no main verb

**Location.** `README.md:2967–2970`: "If Rop has eigenvalues in [α,β] with α>β/2>0, then Ric≥(n−1)α and this criterion for 1≤p≤⌊n/2⌋ and use duality for the remaining interior degrees, killing all interior Betti numbers".

**Claim.** The clause "and this criterion for 1≤p≤⌊n/2⌋" has no verb. As written, the target does not say what is proved: that the criterion applies in those degrees.

**Witness.** The mathematics is sound. With λ=(n−1)α and Λ=β, the inequality (n−1)α>(p−1)β follows from α>β/2 exactly when p≤(n+1)/2. For n=5 and p=2 it reads 4α>β. On the unit sphere both sides of the bound are p(n−p).

**Repair.** Replace it with: "If Rop has eigenvalues in [α,β] with α>β/2>0, then Ric≥(n−1)α, so the criterion λ>(p−1)Λ holds for 1≤p≤⌊n/2⌋. Poincaré duality covers the remaining interior degrees, so all interior Betti numbers vanish".

## Previous findings

- **R01 (R6 squared distance): repaired.** `README.md:2751–2764` now reads "The squared-distance exhaustion and genericity theorems are Tau Ceti's and are consumed here". It names `TauCeti.isProperMap_norm_sq_sub_comp` and the two `ae_…` theorems. The contract at `:337–347` lists them, and the open-disc Check is kept.
- **R02 (R1.3, R2, R3, R4.3, R4.4, R4.7): repaired.** All the named items now cite the library:
  - `:696–701`: `TauCeti.leftInvariantMetric` and the completeness theorems;
  - `:888–891`: `contMDiffOn_infty`;
  - `:1122–1127`: `IsConjugateOn` and `conjugateMultiplicity_le`;
  - `:1661–1671`: the pullback, the fibre bijection and the finiteness of π₁;
  - `:1684–1687`: R4.4 `*Needs:*` names `norm_le_norm_mfderiv_riemannianExp_of_sectionalCurvature_nonpos`;
  - `:1828–1843`: the quotient atlas, covering and descended metric.
- **R03 (local `IsJacobiFieldOn`, `modelSine`): repaired.** Both definitions are deleted. `Suggested.lean:90, 104, 113, 183` use `TauCeti.Manifold.IsJacobiFieldOn` and `TauCeti.curvatureSine`.
- **R04 (Bochner headlines): repaired.** `Suggested.lean:433, 450` state both theorems. The docstring at `:58–60` now lists only the general `ℛ_p` statements as not statable.
- **R05 (GeometricTopology anchors): repaired.** `README.md:28, 419, 1309, 1334` cite "GeometricTopology's smooth-triangulation theorem (Whitehead…)" without an anchor or item number. It resolves to main's GeometricTopology §11.3 (`README.md:7887`).
- **R06 (polarization padding): repaired.** The theorem is gone from `Suggested.lean`. §1.1 item 4 (`README.md:584–633`) keeps it in prose with no backticked name of its own.
- **R07 (four locators): repaired.**
  - Günther: Kwong, Theorem 10(2), p. 27 (`:1590–1596`).
  - R1.5: Bishop, Theorem 6.11, p. 41 (`:1069–1071`).
  - The radial frame: Bishop, §6.11 and Problem 6.12, p. 41 (`:993–996`).
  - §1.2: Nicolaescu, §3.3.2, (3.3.7), pp. 103–104 (`:648–649`).
  - All four were verified in the text (see the sample below).
- **R08 (#1187 ordering): not repaired.** Raised again as R03.

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Gate.** `gate … --base origin/main` prints all counters 0 (`set_option=0 … depcheck=0 … stray-files=0 … outside-folder=0 source-material=0`) and `OK`, exit 0.
- **Dependency check.** `gate --depcheck … --movable` prints `depcheck: 236 roadmaps, 2281 edges, 0 problem(s)`.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with 21 `sorry` warnings, at lines 86, 103, 127, 138, 155, 197, 218, 235, 245, 256, 266, 297, 307, 319, 347, 380, 402, 433, 450, 475 and 496, and nothing else.
- **Signatures.** One scratch file appends `#check @` for all 23 declarations (21 theorems, 2 definitions). It exits 0. Each elaborated type keeps the binders its README statement needs:
  - the Bochner pair: `[I.Boundaryless] [T2Space M] [CompactSpace M]`;
  - `guenther` and `bishopGromov`: `[ConnectedSpace M] [CompleteSpace M] [MeasurableSpace M] [BorelSpace M] [SecondCountableTopology M] [IsContinuousRiemannianBundle …]`;
  - `riemannianDist_eq_sSup_smooth`: `[ConnectedSpace M] [SecondCountableTopology M] [IsRiemannianManifold I M]`;
  - Killing–Hopf: the order-1, order-2 and smooth bundle instances.

  The signature tool's "instance `is`" at line 346 is the docstring word "instance". Nothing changed.
- **Padding.** I replaced every `sorry` by `first | rfl | infer_instance | (simp; done) | (intros; simp_all; done) | (constructor <;> simp; done) | (exact ⟨_, fun _ => rfl⟩) | (left; rfl) | (right; rfl) | (intro _ _; exact Subsingleton.intro) | trivial`. The result has exactly 21 errors, one per theorem body, and 0 `sorry`s, so no headline closes in one tactic. None restates a definition or mirrors a Check.
- **Form.** The file has:
  - `public import Mathlib` plus 14 `TauCeti.*` modules, all present at the pin;
  - no `set_option`, no `lemma` and no sorry'd data;
  - one module docstring, `/-! ## Layer k -/` section comments, and a docstring on every declaration.

### Seeded sample, read in the cache

- **1.1 Curvature identities.**
  - `andrews-dg-ch16` line 105 (printed p. 154, line 104): Proposition 16.2.1. Line 101 gives the slot convention `K(σ)=R(e₁,e₂,e₁,e₂)`, as `README.md:609–610` says.
  - `nicolaescu-lectures` line 8870 (Example 4.2.36: λ = s/n; PDF p. 207 = printed p. 195) and line 8888 (Exercise 4.2.38, dimension ≥ 3; printed p. 196) match item 3.
  - Item 4's identity is checked numerically in the table.
- **1.2 Local symmetry.**
  - `nicolaescu-lectures` line 4604 (§3.3.2) and line 4630 (equation (3.3.7)) define transport by the initial-value problem `∇_(d/dt)u=0`. Line 4641 shows printed p. 104, so the locator pp. 103–104 is right.
  - The Tau Ceti surface theorem is at `Curvature/LocallySymmetric.lean:221`.
  - The R1.2 duplication is R01.
- **1.3 Metric changes.**
  - `andrews-dg-ch16` line 429 (Corollary 16.8.5, printed p. 162 at line 410): `R_ijkl=¼c_ijp c_klp` in his sign. In the README's convention, with totally skew `c`, this is −¼[[X,Y],Z].
  - `TauCeti.completeSpace_of_isPretransitive_isom_of_finiteDimensional` is at `Riemannian/Homogeneous.lean:60`.
  - The curvature-operator API (`Curvature/ExteriorSquare.lean:104, 123, 150`; `Isometry/ExteriorSquare.lean:61`) and the descent API (`Pullback/Descent.lean:266, 295`) resolve.
  - O'Neill is under Not verifiable.
- **2.1 Jacobi fields.**
  - Tau Ceti's `IsJacobiFieldOn`, `eq_of_eq_of_alongCurveWithin_eq`, `jacobiFieldSpace`, `conjugateMultiplicity_le` (`Jacobi/Conjugate.lean:203`, with `curveVelocityWithin … ≠ 0`) and `exists_eq_curvatureCosine_smul_add_curvatureSine_smul` resolve.
  - None of them proves existence from initial data, so `exists_jacobi_initial_data` is a genuine target.
  - Milnor is under Not verifiable.
- **2.2 Normal-coordinate jets.**
  - `bishop-rg` line 1885 (§6.11, p. 41, marker at line 1865) defines the canonical frame by parallel translation along radial geodesics. Line 1893 (Problem 6.12) gives its second-order expansion, with connection forms `¼R(x dx − x dx)` that vanish at p. Both are as cited.
  - `nicolaescu-lectures` line 6793 (Proposition 4.1.25, printed p. 151) gives `g_ij(q)=δ_ij` and vanishing first derivatives.
  - `brewin-rnc` line 363 (p. 9) and line 615 (equation (11.1), p. 15) give the third-order expansion. Its sign matches `sin²t/t² = 1 − t²/3 + …`.
- **2.3 Euclidean limits.**
  - `bishop-rg` line 1872 (Theorem 6.11, p. 41) gives `g_ij = δ_ij − ⅓ΣR_ihjk x^h x^k + …`. On the unit sphere this is `1 − |v|²/3` for i=j⊥v, the README's `−⅓⟨R(e_a,v)v,e_b⟩`.

### Other locators read

- `kwong-volume-comparison` line 1766 (Theorem 10, p. 27, marker at line 1755). Item (2), line 1771, gives `F ≥ exp(−∫∫β^{ij}R̂_k(…)) s_k(r)^(n−1)` under `s_k > 0` on (0,r]. Under K ≤ k the exponent is ≥ 0, so `F ≥ s_k^(n−1)`, as `guenther`'s docstring says. Gray's *Tubes*, Theorem 3.17, is cited at line 1752.
- `petersen-wink-bochner` line 39 (Corollary, p. 1): a closed n-manifold, n ≥ 3, with a ⌈n/2⌉-positive curvature operator has `b_p = 0` for `0 < p < n`. No connectedness is assumed. This matches `Suggested.lean:444–446`.
- `nicolaescu-lectures` line 30622 (Theorem 12.2.5(b), PDF p. 673 = printed p. 661): compact, connected, oriented, with Ric ≥ 0 and somewhere > 0, gives `b₁ = 0`. This matches `:428`.
- `nicolaescu-lectures`:
  - Theorem 5.2.26 (line 9923, printed pp. 220–221). Its proof at line 9952 uses `Ric ≥ (n−1)/r²`, i.e. the README's λ=(n−1)/r².
  - Theorem 6.2.6 (line 10630, p. 238) and Example 6.2.29 (line 10851, p. 243).

### Library declarations opened (file:line at the pins)

Tau Ceti `2fd255d9` (paths under `TauCeti/Geometry/Manifold/` unless stated):
- `VectorBundle/CovariantDerivative/Curvature/`: `Bianchi.lean:46, 83, 102`; `SecondBianchi.lean:127`; `SecondCovariantDerivative.lean:76, 92, 103`; `Metric.lean:59, 111`; `Smoothness.lean:49, 65`; `Derivative.lean:348, 415`; `Coordinates.lean:149`; `LocallySymmetric.lean:102, 137, 169, 221`; `Prod.lean:124, 153, 176`; `ExteriorSquare.lean:104, 123, 150`; `Tensor.lean:152`.
- `VectorBundle/CovariantDerivative/LeviCivita/WarpedProd.lean:150`.
- `Riemannian/`:
  - `Scaling.lean:160, 275, 288, 298`;
  - `Isometry/LocallySymmetric.lean:85, 140`; `Isometry/Sphere/Classification.lean:55, 93, 163`; `Isometry/Sphere/Basic.lean:136, 162`; `Isometry/UpperHalfSpace.lean:397`; `Isometry/Ext.lean:57, 112`; `Isometry/Local.lean:89–197`; `Isometry/ExteriorSquare.lean:61`;
  - `Geodesic/Normal/Coordinates.lean:270, 292`; `Geodesic/Gauss/Basic.lean:127`;
  - `Jacobi/Exponential.lean:91, 155`; `Jacobi/Comparison.lean:50`; `Jacobi/Conjugate.lean:203`;
  - `Homogeneous.lean:60`; `Laplacian.lean:238`; `Bochner.lean:171`; `Lichnerowicz.lean:82`;
  - `Sphere/Basic.lean:61, 77, 82, 88`; `Pullback/Descent.lean:266, 295`.
- `Instances/UniversalCover.lean:64, 68, 72`.
- `TauCeti/Analysis/MvPolynomial/Sphere.lean:49, 115, 126`; `TauCeti/AlgebraicTopology/UniversalCover/RealProjective/FundamentalGroup/Basic.lean:137`; `TauCeti/Topology/Homotopy/HomotopyGroup/Map.lean:45`.

Absent at the pin, so R7.0's and R4's remaining targets stand:
- the integrated Bochner identity and its equality case;
- a piecewise first variation with corners;
- a local-isometry covering theorem;
- completeness of quotient and pulled-back metrics;
- a hyperboloid model;
- an index-form carrier, injectivity radius, cut locus and mean curvature between manifolds.

`README.md:110` links `curvatureTensor` at the older Tau Ceti commit `a91d3aaf` (line 148). That commit is an ancestor of the pin, where the declaration is at `Tensor.lean:152`.

### Citations resolved

- **Backticked names.** Of the README's 190 backticked tokens, every library name of four or more characters resolves at the pins or in `Suggested.lean`. The exceptions are:
  - notation: `C_glue`, `b_exit`, `b_gap`, `T_pM`, `exp_p`;
  - roadmap targets on main: `finiteSourceMappingCWType`, `basedLoopCWType` and `reducedSuspensionSphereHomeomorph` in AlgebraicTopology; `bundleDiskSphereRelCW` and `bundleDiskAttachmentCWModel` in CharacteristicClasses.
- **Supplier roadmaps.**
  - On main: GeometricTopology Layers 1, 7, 8 and §11.3; Yamabe Y9 (`README.md:308`); the rest as before (HopfRinow, SmoothBundlesConnections, PseudodifferentialOperators P1.0, ComplexKahlerGeometry K5a/K7.1, AlgebraicTopology, CharacteristicClasses, DGFloer, MorseTheory, …).
  - Main's README already cites UnboundedOperators §4.7 and VariationalMethods, and the dependency check accepts them.
  - The overlap tool reports no id that this pull request drops and no id that only an open revision defines.
- **Surfaces sub-roadmap.** Its anchors `#r6-focal-geometry-and-squared-distance-morse-functions` and `#r496a-length-controlled-parametric-regularization`, and its R4.2 citation, resolve at this head.

### Ownership against open work

- The Lean files at the open heads and on main contain no Bishop–Gromov, Günther, Cartan–Hadamard, Synge, Killing–Hopf, Rauch, Lyusternik–Schnirelmann or Betti-vanishing statement outside this folder. #1187's copy of this file is the exception.
- RicciFlow (#1023) Layer 7 owns Ricci-flow sphere theorems for 2-positive curvature operators, not Betti vanishing.
- PositiveMass (#956) consumes R4.1's Bishop–Gromov, and NoncompactQuantumSymmetry (#1015) consumes R4.4. Neither owns the objects.
- No `Suggested.lean` declaration reuses a fully qualified name from a roadmap I can read.

### Adversarial table

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 item 4 mixed polarization | three random Kulkarni–Nomizu sums on ℝ⁴; K=1 orthonormal pair; the skew form ω | `24r` = −0.794565, −3.441479, −15.227840; `B_Q−B_Q` equal to 9 digits, Bianchi sum ≤ 7e−16. K=1: 16−(−8)=24=24·1. ω: 8−(−8)=16 ≠ 24 | true; Checks exact | none |
| §1.1 item 2 low dimensions | n=0, 1 | no two-plane, every κ satisfies both sides | consistent with Tau Ceti | none |
| §1.2 Checks | `dx²+e^(2x²)dy²`; unit and radius-2 S³; their union | √G=e^{x²}, K=−(2+4x²), ∂ₓK(1)=−8; a=2 and a=1/2; union Einstein with unequal factors | true; connectedness and n≠2 needed | R01 (cite `HasParallelCurvature`) |
| §1.2 transport characterization | flat ℝⁿ; unit S² | transport = Id, constant fields parallel; R=g∧g and ∇g=0, so R is preserved | true | none |
| §1.3 conformal Scal | n=2, flat, u=−log y | Δ⁺u=−1/y², Scal̃=y²·2·(−1/y²)=−2=2K with K=−1 | sign dictionary right | none |
| §1.3 Rop contractions | unit S³; S²×H² | Ric(u,u)=Σᵢ⟨Rop(eᵢ∧u),eᵢ∧u⟩=2\|u\|², Scal=2·tr Rop=2·3=6; eigenvalues +1, −1, 0⁴ | matches §1.3 Examples | none |
| §1.3 O'Neill and projections | Hopf S³→CP¹; `dx²+e^(2x)dy²`, `e^(4x)`; x=log 2 | \|A_XY\|=1, K=1+3=4; Γˣ_yy=−e^{2x}, T_UU=−∂x (norm 1) and −2∂x (norm 2); \|∂y\|=2 | true | none |
| §1.3 G/H completeness | SO(3)/SO(2); ℝ/{0} | round S² complete; dt² complete; both transitive by isometries | true | none |
| §1.3 projective normalization | X=[[0,−1],[1,0]]; diag(0,i); CP¹ | 1=1; 1/2 vs 1; area 4π(1/2)²=π | true | none |
| R1.3 constant scaling | unit S², c=4 | K=1/4 = c⁻¹·1, as `Scaling.lean:298` | true, already in Tau Ceti | R01 |
| `exists_jacobi_initial_data` | flat; great circle; constant geodesic; a=b | u+tv, residual 0; −sin t E + sin t E = 0; u+(t−a)v solves D²X=0; Icc a a not UniqueDiffOn, so excluded by `a<b` | true | none |
| §2.2 frame and jets | unit S², t=π/2; octant triangle; basis (2e₁,…); Brewin on S² | \|d exp(Y)\|=2/π=0.636620 vs transported norm 1; rotation π/2 = area; norm 2 vs 1; sin²t=t²−t⁴/3+…, coefficient −⅓K | true | R01 (first jet is Tau Ceti's) |
| §2.3 R1.5 | unit S², λ=10, ρ=1; flat N | 100·sin²(0.1)=0.996671 vs 1−1/300=0.996667; K(g_j)=0.01; flat g_j exactly Euclidean | true | R01 (scaling citation) |
| R4.1 model API | s₄; V scaling, n=2, κ=1, c=2, r=1 | first zero π/2, s₄′(0)=1; V_{1/4}(2)=4(1−cos 1)=1.838791 = c²V₁(1) | true | none |
| `rauch_norm_ge_of_sectional_le` | K=κ=1; radius-5/2 sphere vs κ=1; tangential J=tγ′, κ=−1 | sin t=sin t; t=π/2: 1 ≤ 1.469463; at t=5π/2, 1 ≤ 0 fails, excluded by `hmodel`; sinh 1=1.175201 > \|J\|=1, excluded by `hnormal` | true; both guards needed | none |
| `guenther` | unit S², κ=1, r=1; flat torus, r=0.5; n=1; n=0 | 2.888366 both sides; 0.785398 both sides; 2r both sides; LHS 0 | true; `hinj` ⇔ r ≤ inj(p) | none |
| `bishopGromov` | unit S² with κ=0 and κ=1; ℍ² with κ=0; n=0; circle | vol/V₀ = 5.776732, 4.448956, 2.546479 at r=1, 2, π (nonincreasing); vol/V₁ = 6.283185 constant; ℍ²: 6.824553 → 8.677694 (increasing; Ric=−g violates); point: 1/r; circle: min(2r,L)/r | true | none |
| `cartanHadamard_isCoveringMap` | flat T²; S¹; S² | ℝ²→T² covering; ℝ→S¹ covering; S² has K=1 > 0, excluded | true | none |
| `bonnetMyers_distance`, `myers_finite_fundamentalGroup` | unit Sⁿ, λ=n−1; n=0; RP³; S²×S¹ | π·√1=π=diam; n=0: π·√(−1/λ)=0=dist (`Real.sqrt` of a negative is 0); π₁=ℤ/2; Ric(∂θ,∂θ)=0, excluded | true | none |
| `synge`, `synge_orientable_of_odd` | point, S², RP², flat T², RP³, S¹ | simply connected; simply connected; fails orientability; fails K>0; odd, orientable, π₁=ℤ/2; hK vacuous, orientable | true | none |
| `singularHomology_loopSpace_sphere` | n=2, 3, 1; i=0 | n=2: (1+t)/(1−t²)=1/(1−t), ℤ in all degrees; n=3: ℤ in even degrees; n=1: H₀=⊕_ℤℤ, excluded; i=0: ℤ | true; `2 ≤ n` needed | none |
| Killing–Hopf (three cases) | n=0, 1, 2 | point = point; line = line, (0,∞) with dt²/t² ≅ ℝ by log; S², sphere case needs n≥2 | true | none |
| `two_distinct_geodesics` | unit circle, p=1, q=i; ℝ | e^{iπ/4} ≠ e^{−3iπ/4} at t=1/2; one geodesic on ℝ | true; compactness needed | none |
| `three_simple_closed_geodesics` | round S² | three great circles, T=2π, injective on [0,2π), distinct ranges | true | none |
| `paraboloid_geodesic_crossings` | a=1, a=1/2 | a=1: R₀=2.275594, t₀=6.467619 ≥ R₀²−1=4.1783; A=π ≥ 2 log R₀=1.644483; R₁=10.289815, R₂=49.358898; r″(0)=1/5; Cartesian det 2a r′/R=0.169425. a=1/2: R₀=3.763459, t₀=15.343929, R₁=86.321884; r″(0)=1 | true; radii and times increase | none |
| `paraboloid_vertex_pole` | radial Jacobi r(ℓ) vs round K=4 | ℓ=0.5: 0.446334 vs 0.420735; ℓ=1: 0.763927 vs 0.454649; ℓ=π/2: 1.040423 vs 0; ℓ=3: 1.554045 vs −0.139708 | no conjugate point | none |
| `subsingleton_deRhamCohomology_one_of_ricciTensor_pos` | S², RP², flat T², S¹, S²∖{2 pts}, dim 0 | Ric=g: H¹=0 for S² and RP² (b₁(RP²)=0); T²: Ric=0, b₁=2, excluded; S¹: excluded; noncompact b₁=1, excluded; H¹=0 | true; strict positivity and compactness needed | none |
| `subsingleton_deRhamCohomology_of_curvatureEndomorphism_pos` | S³, RP³; S² at p=1; CP²; S²×S²; Sⁿ∖{2 pts} | Rop=Id: H¹=H²=0; K>0: b₁=0; FS Rop ≥ 0 with a kernel, b₂=1, excluded; mixed kernel, b₂=2, excluded; noncompact b_{n−1}=1, excluded | true; `p<n` sharp (S²: H²=ℝ) | none |
| `riemannianDist_eq_sSup_smooth` | ℝ²∖{0}, p=(−1,0), q=(1,0); f=0 | intrinsic dist 2, not attained, sup 2 via smoothed clamps of x₁; set nonempty and bounded by dist | true without completeness | none |
| `harmonic_irreducible` | N=2, 3, 4; d=0 | N=2: R_θ·(x₁−ix₂)=e^{iθ}(x₁−ix₂), an invariant line; N=3, d=1: standard rep; N=4, d=2: dim 10−1=9=(2+1)²; d=0: dim 1 | true; `3 ≤ N` needed | none |
| R8.2 (R02) | m=1; m=2; m=0 | m=1: λ=d², cos dθ = Re(x₁+ix₂)^d; m=2: λ=0, 2, 6 with dims 1, 3, 5, z on S² has Δz=−2z; m=0: λ=0 from d=0 and d=1 | true for m ≥ 1 | R02 |
| R7.7 pinching (R04) | unit Sⁿ, α=β=1; n=5, p=2 | p(n−1−(p−1)) = p(n−p) both sides; (n−1)α=4α > β | true, sentence garbled | R04 |
| R3 index Checks | flat sin(πt); unit sphere L=π, 3π/2 | I=π²/2=4.934802; I=0; I=−1.308997=−5π/12 | true | none |
| R6 genericity (Tau Ceti) | unit circle, q=0 and q=(2,0) | h≡1, all degenerate, q=0 is the focal centre; h=5−4cos θ, h″(0)=4, h″(π)=−4 | covered by Tau Ceti | none |
| R7.0 Checks | line x²; unit circle; unit S² | −8+8+0=0 (−4 without the factor 2); λ=1, no bound for n=1; λ=2=nk | true | none |

## Not verifiable

- **O'Neill 1966 (1.3) and Milnor, *Morse Theory* (2.1).** Both are settled `uncertified` and cited by locator only. I checked O'Neill's `K_B=K+¾|[X,Y]^v|²` by computation (table), not against the text.
- **Lee, *Introduction to Riemannian Manifolds*, and Fulton–Harris.** Settled `uncertified`; outside the sample.
- **Works outside the manifest and the cache.** These are cited in References but not recorded in the package's `sources.toml`, so I did not read them. All are outside the seeded sample, and none of their locators is flagged unverified.
  - Homma, Theorem 7.1, p. 24 and Example 8.2, p. 27 (R7.0, R7.4).
  - Azagra–Ferrera–López-Mesas–Rangel, Theorem 1, p. 2 (R7.8).
  - Axler–Bourdon–Ramey, Proposition 5.5 and Theorem 5.7 (R8.1).
  - Toth–Ziller, pp. 84–85 (R8.1).
  - Lauer §§4, 8; Dobbins, Lemma 2.2; Ma; Gage; Grayson; Angenent; White; Allen–Layne–Tsukahara (all R4.9).
  - Wang's notes.
- **Ownership against open pull requests outside the listed checkouts.** Not checked. This includes ManifoldOptimization (#1506), which the overlap tool lists.

## Source issues

- none
