# Review of RiemannianGeometry (pull request #1683 at e32d289)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/RiemannianGeometry/README.md` and `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` at `e32d289`.
- **Pins.** Unchanged since the previous review: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`.
- **Outside the folder.** Nothing changes: `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Gate.** Passes, and the dependency check reports 0 problems.
- **Elaboration.** `Suggested.lean` elaborates with exactly 20 `declaration uses sorry` warnings and nothing else.
- **Previous findings.** Neither finding of the previous review is repaired (R03, R04).
- **New findings.**
  - The Tau Ceti files added at the current pin now prove several constructions that the README still plans as its own (R01, R02).
  - An open GeometricTopology revision drops a supplier anchor (R05).
  - There are three P3 items (R06–R08).

## R01 (P2) — R6 claims to own the squared-distance genericity and exhaustion theorems, which Tau Ceti proves

**Location.** `README.md:2559–2560`: "Own the squared-distance exhaustion and genericity theorems here; no supplier states them." The targets follow in `:2560–2573`: properness of `h_q` for closed embeddings, and the almost-everywhere nondegeneracy and Morse property.

**Claim.** The pinned Tau Ceti states all three results, in greater generality than R6:
- `TauCeti.ae_forall_isManifoldNondegenerateCriticalPoint_norm_sq_sub_comp` (`TauCeti/Geometry/Manifold/Morse/SquaredDistance.lean:57`): for a `C²` immersion `i : M → V` of a second-countable boundaryless manifold into a finite-dimensional inner-product space, every critical point of `‖i x − a‖²` is nondegenerate, for almost every `a` and every Haar measure.
- `TauCeti.ae_isMorse_norm_sq_sub_comp` (`:98`): for a smooth immersion, `‖i x − a‖²` is `TauCeti.IsMorse` for almost every `a`.
- `TauCeti.isProperMap_norm_sq_sub_comp` (`TauCeti/Topology/Maps/Proper/Metric.lean:67`): for a closed embedding, the squared distance is proper.

R6's targets are the special case of a `C²` closed embedding into `ℝⁿ`. So "no supplier states them" is false at the pin, and R6 claims an object the library owns. Neither file exists at the old Tau Ceti pin `358314d4` (`git cat-file`), so the pin bump made the paragraph stale.

**Witness.**
- `SquaredDistance.lean:98–100` concludes `∀ᵐ a ∂μ, IsMorse I (fun y ↦ ‖i y - a‖ ^ 2)` from `ContMDiff I 𝓘(ℝ, V) ∞ i` and an injective `mfderiv`.
- `Proper/Metric.lean:67` takes `hi : Topology.IsClosedEmbedding i`.

**Repair.**
1. Replace `:2559–2573`, up to "…for almost every q (the almost-everywhere nondegeneracy is Milnor, *Morse Theory*, §6, Theorem 6.6)", with one sentence: R6 consumes these three Tau Ceti declarations for the properness and genericity of `h_q`.
2. Keep as a Check the non-closed example: the open unit disc with `q=(2,0)`, where `h_q` has no minimum.
3. Keep R6's own two chart lemmas and their comparison with R5a's `B`, `S` and normal connection. They are not in the library.
4. Add the three declarations, with their files, to the "From Tau Ceti" contract.
5. In R6's `*Needs:*` line and its Dependencies paragraph ("its genericity uses the pinned equal-dimension Sard theorem and R4.6's null-set transfer"), name these declarations.

Tested: the three names resolve at the pinned Tau Ceti with the hypotheses quoted.

## R02 (P2) — R1.3, R2, R3, R4.3, R4.4 and R4.7 plan constructions that the pinned libraries already contain

**Location and claim.** One bullet per passage. I opened each declaration at the pin.

- **R1.3** (`README.md:557–561, 571–573`).
  - Quoted: "construct the corresponding bi-invariant metric on the native Lie-group carrier and prove invariance and completeness"; "Prove every finite-dimensional left-invariant Riemannian metric … is complete."
  - At the pin: `TauCeti.leftInvariantMetric` (`TauCeti/Geometry/Manifold/Riemannian/LieGroup/LeftInvariant.lean:161`), `leftInvariantMetric_inner_mfderiv_mul_left` (`:216`), `leftInvariantMetric_inner_mfderiv_mul_right` (`:252`: for an Ad-invariant form, right translations are isometries) and `completeSpace_leftInvariantMetric` (`:358`). Also `completeSpace_of_inner_mulInvariantVectorField` (`:328`): every left-invariant metric is complete, with no compactness.
- **R2** (`README.md:743–745`).
  - Quoted: "First upgrade native C² `IsGeodesicCurveOn` solutions for a smooth metric to C^∞ on the interval interior … give the endpoint version when the geodesic extends to an open interval."
  - At the pin: `TauCeti.Manifold.IsGeodesicCurveOn.contMDiffOn_infty` (`Riemannian/Geodesic/Smoothness.lean:252`). It holds up to the endpoints on any `UniqueDiffOn` parameter set, with no extension.
- **R3** (`README.md:964–967`).
  - Quoted: "Define conjugacy by a **nonzero** Jacobi field vanishing at both endpoints; multiplicity is the dimension of that solution subspace … Multiplicity≤n−1".
  - At the pin: `TauCeti.Manifold.IsConjugateOn` (`Riemannian/Jacobi/Conjugate.lean:80`), `conjugateMultiplicity` (`:171`), `conjugateMultiplicity_pos_iff` (`:192`) and `conjugateMultiplicity_le` (`:203`).
- **R4.3** (`README.md:1492, 1498, 1502`).
  - Quoted: "define g_E(v,w)=g(dp(v),dp(w)) … smooth and positive"; the fibre/loop-class bijection; "if the connected universal-cover manifold … is compact … finiteness".
  - At the pin:
    - `Bundle.ContMDiffRiemannianMetric.pullback` (`Riemannian/Pullback/Basic.lean:158`), along any immersion;
    - `TauCeti.UniversalCover.fiberEquivFundamentalGroup` (`TauCeti/AlgebraicTopology/UniversalCover/Basic.lean:171`);
    - `TauCeti.UniversalCover.finite_fundamentalGroup_of_compactSpace` (`…/UniversalCover/Compact.lean:56`).
- **R4.4** (`README.md:1505`, with its `*Needs:*` "R3 (no conjugate points under K≤0)").
  - Quoted: "Establish its nonsingular/expanding differential by R2/comparison".
  - At the pin: `TauCeti.Manifold.norm_le_norm_mfderiv_riemannianExp_of_sectionalCurvature_nonpos` (`Riemannian/Jacobi/Comparison.lean:50`), which gives `‖w‖ ≤ ‖d(exp_p)_v w‖` on `expDomain`. Also `not_isConjugateOn_of_sectionalCurvature_nonpos` (`Jacobi/Conjugate.lean:222`).
- **R4.7 and Scope** (`README.md:36–37, 1653–1655`).
  - Quoted: "R4.7 owns the free properly discontinuous isometric quotient construction"; "Construct the quotient atlas, descended metric and covering".
  - At the pin:
    - Mathlib `MulAction.instChartedSpaceQuotient` (`Mathlib/Geometry/Manifold/Instances/Quotient.lean:50`);
    - Tau Ceti `TauCeti.instIsManifoldQuotient` and `TauCeti.isLocalDiffeomorph_quotientMk` (`TauCeti/Geometry/Manifold/Instances/Quotient.lean:242, 253`);
    - `Bundle.ContMDiffRiemannianMetric.quotient` and `isLocalRiemannianIsometry_descend` (`Riemannian/Pullback/Descent.lean:258, 189`);
    - Mathlib `isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul` (`Mathlib/Topology/Covering/Quotient.lean`).

`LeftInvariant.lean`, `Pullback/`, `UniversalCover/Compact.lean`, `Jacobi/Comparison.lean` and `Jacobi/Conjugate.lean` are absent at the old pin `358314d4`. The README's own Scope section says such items "are inputs, not construction targets". The R4.4 `*Needs:*` line also blocks Cartan–Hadamard behind R3's index theory, for a fact the library already provides.

**Witness.**
- `Jacobi/Conjugate.lean:203–206` concludes `conjugateMultiplicity hγ hs ha b ≤ Module.finrank ℝ E - 1` under `curveVelocityWithin I γ s a ≠ 0`.
- `Pullback/Descent.lean:258` defines the metric on `MulAction.orbitRel.Quotient G M` descended along a free, properly discontinuous, smooth, isometric action.

**Repair.**
1. Delete each restated construction from its section. Cite the declarations above, with their files, in the "From Tau Ceti" and "From Mathlib" contracts.
2. Keep only what goes beyond the library:
   - R1.3: the normal homogeneous metric on G/H;
   - R2: nothing from its opening sentence;
   - R3: the identification with `ker d exp_(bv)` and with the nullity of the endpoint index form;
   - R4.3: completeness of the pulled-back metric, second countability and the universal-cover atlas;
   - R4.4: the covering criterion and the simply connected consequences;
   - R4.7: descent of completeness and curvature, and the space-form specializations.
3. Rewrite the Scope sentence so that R4.7 owns the space-form quotients built on the library's quotient. PseudodifferentialOperators P7a can keep citing R4.7.
4. In R4.4's `*Needs:*`, replace "R3 (no conjugate points under K≤0)" with the Tau Ceti declaration.

Tested: every name above resolves at the pins with the hypotheses quoted.

## R03 (P2) — Not repaired (previous R01): `Suggested.lean` still restates Tau Ceti's Jacobi predicate and model sine

**Location.**
- `Suggested.lean:105` (`def IsJacobiFieldOn`), `:132` (`def modelSine`), and `:17–21` of the docstring ("the Jacobi predicate `IsJacobiFieldOn`, the model function `modelSine`");
- `README.md:219–220` ("`IsJacobiFieldOn` in `Suggested.lean` writes out the same three clauses"), `:225–226`, `:753–754` and `:1373–1374`.

**Claim.** Nothing has changed since the previous review, and the pins are the same. `TauCeti.Manifold.IsJacobiFieldOn` (`Riemannian/Jacobi/Basic.lean:59`) and `TauCeti.curvatureSine` (`Analysis/SpecialFunctions/Trigonometric/Curvature.lean:40`) are the same objects as the local copies. The following are stated against the copies: `exists_jacobi_initial_data`, `rauch_norm_ge_of_sectional_le` and `modelBallVolume`, hence also `guenther` and `bishopGromov`. Each therefore needs a bridge lemma before Tau Ceti's Jacobi API applies. That is one object with two owners.

**Witness.** In a scratch copy at the pins:
- `IsJacobiFieldOn (I := I) γ X s ↔ TauCeti.Manifold.IsJacobiFieldOn I γ X s` closes by `TauCeti.Manifold.isJacobiFieldOn_iff.symm`;
- `modelSine κ t = TauCeti.curvatureSine κ t` closes by a three-case `simp` with `curvatureSine_of_pos` and `curvatureSine_of_neg`.

**Repair.** The same repair as before:
1. Import `TauCeti.Geometry.Manifold.Riemannian.Jacobi.Basic` and `TauCeti.Analysis.SpecialFunctions.Trigonometric.Curvature`.
2. Delete both definitions.
3. State `exists_jacobi_initial_data` on `TauCeti.Manifold.IsJacobiFieldOn I γ X (Icc a b)`, and `rauch_norm_ge_of_sectional_le` on `TauCeti.Manifold.IsJacobiFieldOn I γ X (Icc 0 b)` with `TauCeti.curvatureSine κ t`.
4. Define `modelBallVolume` with `TauCeti.curvatureSine`.
5. Remove the docstring clause and the four README sentences that describe the copies.

Tested: the scratch copy states the two restated theorems this way and elaborates with 24 `sorry` warnings and no error.

## R04 (P2) — Not repaired (previous R02): the R7.6 Ricci case and the R7.7 curvature-operator cases are statable, but the docstring says they are not

**Location.** `Suggested.lean:50–52`: "the Bochner vanishing theorems (R7.6, R7.7), which need the Weitzenböck curvature term on `p`-forms, absent at the pin, and whose Ricci case `b₁ = 0` needs the de Rham cohomology of a manifold, absent at the pin". The headlines are R7.6 ("positive Ricci kills b_1") and R7.7 ("positive Rop on closed connected n≥3 gives b_2=0"; "any positive Rop kills all interior Betti numbers").

**Claim.** Both carriers exist at the pin:
- `TauCeti.deRhamCohomology I M k` (`TauCeti/Geometry/Manifold/DeRham/Basic.lean:127`);
- `CovariantDerivative.curvatureEndomorphism` (`…/CovariantDerivative/Curvature/ExteriorSquare.lean:60`, with `⟪Rop(u∧v), w∧z⟫ = ⟪R(u,v)z, w⟫`).

With the pinned `ricciTensor`, these state all three cases. The docstring's reason is therefore false, and three statable headlines are missing.

**Witness.** With the `Intrinsic` binders and `[CompactSpace M]`, both of these elaborate in the scratch copy:
- `(∀ x v, v ≠ 0 → 0 < Ric_x(v,v)) → Subsingleton (TauCeti.deRhamCohomology I M 1)`;
- `(∀ x β, β ≠ 0 → 0 < ⟪Rop_x β, β⟫) → 0 < p → p < finrank ℝ E → Subsingleton (deRhamCohomology I M p)`.

**Repair.** The same repair as before:
1. Add `/-! ## Layer 7: Bochner vanishing -/` with these two theorems. The second contains the `n ≥ 3`, `p = 2` case and the all-interior-degrees statement.
   - Use no `ConnectedSpace`: R7.6 says the statements are componentwise.
   - For Rop, use `(CovariantDerivative.leviCivitaConnection I M).curvatureEndomorphism (CovariantDerivative.isMetricCompatible_leviCivitaConnection I) x`.
2. Name both theorems in R7.6 and R7.7.
3. Add both carriers, with their files, to the "From Tau Ceti" contract.
4. Rewrite `:50–52` so that it lists only the general positive-`ℛ_p` vanishing and the `λ>(p−1)Λ` criterion as blocked by the missing Weitzenböck term on `p`-forms.

Tested: both statements elaborate at the pins (scratch copy: 24 `sorry` warnings, no error). The rows R7.6 and R7.7 of the table check them on S², RP², T², S¹, S³ and S²×S².

## R05 (P2) — Two open GeometricTopology revisions drop the supplier anchor R3.2 cites

**Location.** `README.md:1146` (R3.2): "[GeometricTopology's smoothing-and-triangulation comparison](../GeometricTopology/README.md#the-smoothing-and-triangulation-comparison-far-horizon) supplies a smooth triangulation". The same item is named by number at `:27–28`, `:291` and `:1170` ("smoothing-and-triangulation item 1").

**Claim.** This is a supplier citation: R3.2's marked-point refinement consumes the triangulation. The overlap tool reports that the open GeometricTopology revisions #903 and #1797 no longer define this anchor. At #903's head the item is Layer 11.3, and that README records the move. On main it is item 1, "Smooth implies PL … (a smooth triangulation, Whitehead)" (`GeometricTopology/README.md:938`). The anchor and the "item 1" numbering break when either revision merges. The README cites no form of the id that survives at those heads.

**Witness.** In GeometricTopology's README at #903's head:
- `:776–778` sends `#the-smoothing-and-triangulation-comparison-far-horizon` item 1 to Layer 11.3;
- `:7887` is "### 11.3 Smooth triangulations and combinatorial manifolds".

**Repair.** Cite the object, not the numbering. In the four places, write "GeometricTopology's smooth-triangulation theorem (every smooth manifold admits a smooth triangulation, Whitehead)". Link `../GeometricTopology/README.md` without an anchor.
- This resolves on main (item 1 of the comparison) and at #903's head (Layer 11.3).
- It makes neither revision a dependency.

Tested: main's item 1 and #903's Layer 11.3 state that same theorem. I did not read #1797's head (see Not verifiable).

## R06 (P3) — The mixed polarization in `Suggested.lean` is an algebraic identity on free variables, not a headline

**Location.** `Suggested.lean:78` (`twentyFour_mul_apply_eq_of_cyclic_eq_zero`), named in the docstring at `:24–25` and in `README.md:468`.

**Claim.** The statement is about an arbitrary four-linear form `T` on an arbitrary module over a commutative ring. Its conclusion is algebra on its three hypotheses, and it mentions no object of the roadmap: no connection, no curvature, no manifold. A headline names the roadmap's objects.

Its proof has the shape of Tau Ceti's six-term lemma `LinearMap.six_mul_apply_eq_of_cyclic_eq_zero`. That lemma is closed by `simp only [map_add, LinearMap.add_apply]` and one `linear_combination` (`TauCeti/LinearAlgebra/Multilinear/SectionalPolarization.lean:71–72`).

The identity itself is true (table row 1), so this is padding, not an error.

**Witness.** Expanded over the 256 symbols `T(a,b,c,d)`, `24T(x,y,z,w) − (B_Q(x,w;y,z) − B_Q(y,w;x,z))` lies in the ℤ-span of the 768 instances of `h₁`, `h₂`, `h₃` (integer Hermite reduction): one expansion, one linear combination.

**Repair.**
1. Delete the theorem and its `Polarization` section from `Suggested.lean`.
2. Remove "the mixed polarization of the sectional numerator (R1, §1.1 item 4)" from the docstring.
3. At `README.md:468`, drop the backticked name and keep §1.1 item 4 and its Checks in prose.

## R07 (P3) — Four targets without a source locator

**Location.**
- Günther's comparison (`README.md:1420–1426`; headline `guenther`, `Suggested.lean:233`);
- R1.5 (`README.md:900–921`, §2.3);
- the radial-parallel frame and its API (`README.md:835–880`, §2.2);
- §1.2's parallel-transport characterization of `∇R=0` (`README.md:510–516`).

**Claim.** Each is a theorem target without a theorem, page or section locator. For Günther, the only cached text on lower volume bounds from upper sectional bounds is a remark in Bishop's notes, not a statement (`bishop-rg` lines 2820–2825, §9.5, p. 61).

**Witness.**
- "Günther" occurs only at `README.md:1420` and `:1424`, and neither line cites a source.
- §2.3 contains no reference at all.

**Repair.** Give each target a theorem-level locator and record any new work in `sources.toml`. The manifest's settled `lee-irm` key can be cited by locator for §1.2 and §2.2. The statements themselves need no change.

## R08 (P3) — The description no longer orders this pull request against #1187

**Location.** The pull-request description, which names #1327 and #1974 but not #1187.

**Claim.** #1187 changes `TauCetiRoadmap/RiemannianGeometry/Suggested.lean`, and the overlap tool reports that its head conflicts with this one. Its Tau Ceti pin `ab00ba392` is an ancestor of this head's pin `2fd255d9`, so #1187 is superseded for this folder. The earlier description said so; the current one does not.

**Witness.**
- In the pinned Tau Ceti checkout, `git merge-base --is-ancestor ab00ba392 2fd255d9` succeeds.
- The overlap tool lists `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` among #1187's conflicting files.

**Repair.** Add one sentence to the description: this pull request does not wait for #1187, whose pin is an ancestor of the current pin, so #1187's change to this folder is obsolete.

## Previous findings

- **r22 R01: not repaired.** `Suggested.lean:105` still reads `def IsJacobiFieldOn (γ : ℝ → M) (X : ∀ t, TangentSpace I (γ t)) (s : Set ℝ) : Prop :=`, and `:132` still reads `def modelSine (κ t : ℝ) : ℝ :=`. `README.md:219` still says "writes out the same three clauses". Raised again as R03.
- **r22 R02: not repaired.** `Suggested.lean:50–52` still says that the Ricci case "needs the de Rham cohomology of a manifold, absent at the pin". Raised again as R04.

No repair report marks either finding as not actionable.

## Verified sound

### Gate, direction, elaboration, binders, padding

- **Gate.** My run of `gate … --base origin/main` prints every counter 0, ending with `source-material=0 OK`, and exits 0. The worker's gate also reports `build=0`. Nothing changes outside the folder.
- **Dependency check.** `gate --depcheck … --movable` prints `depcheck: 237 roadmaps, 2310 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with exactly 20 `declaration uses sorry` warnings, at lines 78, 118, 142, 166, 177, 194, 233, 254, 271, 281, 292, 302, 333, 343, 355, 383, 416, 438, 466 and 487.
- **Binders.** One scratch file `#check @`s all 24 declarations (20 theorems and 4 definitions) and adds the R03 and R04 repairs. It exits 0 with 24 `sorry` warnings. Each elaborated type keeps the binders its README statement needs:
  - `synge`: `[I.Boundaryless] [T2Space M] [ConnectedSpace M] [CompactSpace M] [TauCeti.Orientable I M]`;
  - `guenther` and `bishopGromov`: `[ConnectedSpace M] [CompleteSpace M] [MeasurableSpace M] [BorelSpace M] [SecondCountableTopology M] [IsContinuousRiemannianBundle …]`;
  - Killing–Hopf: the `1`, `2` and `∞` bundle instances, `ConnectedSpace`, `CompleteSpace` and `SimplyConnectedSpace`.

  The signature tool flags two things, both harmless:
  - The "lost binder" `[I.Boundaryless]` on `def IsJacobiFieldOn` is not used by the predicate, and R03 deletes the definition.
  - Its "instance `is`" at line 382 is the docstring word "instance".
- **Padding.** I replaced every `sorry` by `first | rfl | infer_instance | (simp; done) | (intros; simp_all; done) | (constructor; done) | (exact ⟨_, fun _ => rfl⟩) | (left; rfl) | (right; rfl)`. The result has 20 errors, one at each of the 20 theorems, and 0 sorries, so none closes in one tactic. R06 is raised on the headline criterion instead.
- **Form.** The file has:
  - `public import Mathlib` plus ten `TauCeti.*` modules, all present at the pin;
  - no `set_option`, no `lemma` and no sorry'd data;
  - one module docstring and a docstring on every declaration.

### Seeded sample (sources read in the cache)

- **1.1.**
  - `andrews-dg-ch16` line 105 (Proposition 16.2.1, printed p. 154, line 104) proves that the sectional curvatures determine the curvature tensor, using Bianchi.
  - Line 101 gives his slot convention `K(σ)=R(e₁,e₂,e₁,e₂)`, as the README says. Line 12 gives his `R(X,Y)Z` with the opposite sign, which matches the README's "opposite curvature sign" remark.
  - His final display has a sign slip (Source issues). The roadmap does not use that display.
  - Nicolaescu: Example 4.2.36 (`nicolaescu-lectures` line 8870, p. 195) gives `λ = s/n`, and Exercise 4.2.38 (line 8888, p. 196) proves constancy for `n ≥ 3`. Both match item 3.
  - Tau Ceti: `hasConstantSectionalCurvature_iff_isConstantCurvatureTensor` (`Curvature/Polarization.lean:147`), `eq_of_forall_hasSectionalCurvatureAt` (`Schur.lean:197`), `eq_of_ricciTensor_eq_smul_inner` (`Einstein.lean:162`), `riemannCurvatureTensor` (`Riemann.lean:66`) and `LinearMap.six_mul_apply_eq_of_cyclic_eq_zero` (`SectionalPolarization.lean:62`).
- **1.2.** `hasParallelCurvature_iff_isLocallyConstant_scalarCurvature_of_finrank_eq_two` is at `LocallySymmetric.lean:221`. The Checks are recomputed in the table. The parallel-transport clause has no locator (R07).
- **1.3.**
  - `andrews-dg-ch16` line 429 (Corollary 16.8.5, p. 162, line 410) gives `R_ijkl=¼c_ijp c_klp` in his sign. In the README's convention, with totally skew `c_ijk`, this is `⟨R(E_i,E_j)E_k,E_l⟩ = −¼c_ijp c_klp`, i.e. `−¼[[X,Y],Z]`, as the README says.
  - Tau Ceti: `apply_mulInvariantVectorField` (`BiInvariant.lean:155`), `curvatureTensor_one` (`:241`), `ricciTensor_leviCivitaConnection_rescale` (`Conformal.lean:443`), `scalarCurvature_rescale` (`:509`), `curvatureOperator_leviCivitaConnection_rescale` (`:149`) and `completeSpace_ofRiemannianMetric_of_isPretransitive_isom` (`Homogeneous.lean:79`).
  - O'Neill is under Not verifiable. The Lie-group construction is R02.
- **2.1.** Tau Ceti:
  - `IsJacobiFieldOn` (`Jacobi/Basic.lean:59`) and `wronskian_eq` (`:246`);
  - `eq_of_eq_of_alongCurveWithin_eq` (`Uniqueness.lean:161`);
  - `eq_zero_of_endpoints_eq_zero_of_sectionalCurvature_nonpos` (`Convexity.lean:176`);
  - `finrank_jacobiFieldSpace_le` (`Space.lean:163`);
  - `exists_eq_curvatureCosine_smul_add_curvatureSine_smul` (`Model.lean:62`);
  - `isJacobiFieldOn_mfderiv_riemannianExp` (`Exponential.lean:91`);
  - `symmL_alongCurveInChartWithin` (`AlongCurve/Chart.lean:69`).

  None of these proves existence from initial data (`jacobiInitialData` is only injective), so `exists_jacobi_initial_data` is a genuine target. Milnor is under Not verifiable.
- **2.2.**
  - `nicolaescu-lectures` line 6793 (Proposition 4.1.25, printed p. 151) gives `g_ij(q)=δ_ij` and vanishing first derivatives.
  - `brewin-rnc` line 363 (§5, p. 9) gives `g_ab = g_ab − ⅓x^c x^d R_acbd − ⅙x^c x^d x^e ∂_c R_adbe + O(ε⁴)`. Line 615 (equation (11.1), p. 15) gives the covariant `∇_c R_adbe` form.
  - On the unit sphere, `R_acbd x^c x^d = +K|v|²` for `e_a=e_b ⊥ v`, as the README says. Otherwise `sin²t/t²` would not be `1 − t²/3 + …`.
  - The radial-frame paragraph has no locator (R07).
- **2.3.** No locator (R07). The statement is checked in the table.

### Other locators read

- `bishop-rg`: line 2302 (Theorem 7.9, p. 50) and line 2324 (Problem 7.11, p. 50) match `synge` and `synge_orientable_of_odd`.
- `zhu-ricci-comparison`: line 292 (Theorem 3.1, p. 226) and line 426 (Corollary 3.3(1), p. 228) match `bishopGromov`.
- `lyons-hopf`: Investigations (L) and (M) at lines 391 and 415, and Figure 10 at line 449, are on arXiv v1 PDF pp. 13–15, as cited. (L) gives the line and the circles, and (M) their linking.

### Library declarations opened (file:line at the pins)

Tau Ceti `2fd255d9`:
- `Morse/SquaredDistance.lean:57, 98`; `Topology/Maps/Proper/Metric.lean:67, 74`; `Morse/Basic.lean:110, 212`;
- `Riemannian/LieGroup/LeftInvariant.lean:161, 216, 252, 328, 343, 358`;
- `Riemannian/Geodesic/Smoothness.lean:252`;
- `Jacobi/Conjugate.lean:80, 171, 192, 203, 222`; `Jacobi/Comparison.lean:50`;
- `Riemannian/Pullback/Basic.lean:158, 193`; `Pullback/Descent.lean:95, 189, 226, 258`;
- `Instances/Quotient.lean:242, 253`;
- `AlgebraicTopology/UniversalCover/Basic.lean:171`; `UniversalCover/Compact.lean:56`;
- `DeRham/Basic.lean:127, 204`; `Curvature/ExteriorSquare.lean:60`;
- `RingTheory/MvPolynomial/Harmonic/Orthogonal.lean:122`; `Analysis/SpecialFunctions/Trigonometric/Curvature.lean:40, 50, 66`;
- `Analysis/InnerProductSpace/SecondFundamentalForm.lean`.

Mathlib `1b1ccf4b`: `Geometry/Manifold/Instances/Quotient.lean:50` and `Topology/Covering/Quotient.lean:262–290`.

Absent at the pin, as the docstring says:
- an index-form carrier on piecewise `C¹` sections;
- a second fundamental form between manifolds (Tau Ceti's is for maps into normed spaces only);
- a mean curvature;
- an injectivity radius or cut locus;
- a Weitzenböck term on forms.

The Hodge star and the codifferential exist (`Riemannian/HodgeStar.lean`, `Codifferential.lean`), but no positive-`ℛ_p` statement can be formed from them alone.

`harmonicRep` acts by `orthogonalGroup σ R` over the coefficient ring, i.e. by complex orthogonal matrices over ℂ. So the hand-written real `SO(N)` action in `harmonic_irreducible` does not restate it.

### Citations resolved

- **Backticked names.** Of the README's 152 backticked tokens, 126 are library or roadmap names of at least four characters (the rest are file names and short notation). 118 resolve at the pins or in `Suggested.lean`. Of the other 8:
  - `C_glue`, `b_exit` and `b_gap` are notation;
  - `finiteSourceMappingCWType` and `basedLoopCWType` are on main in AlgebraicTopology;
  - `bundleDiskSphereRelCW` and `bundleDiskAttachmentCWModel` are on main in CharacteristicClasses;
  - `reducedSuspensionSphereHomeomorph` is on main in AlgebraicTopology and DGFloer.
- **Supplier roadmaps.**
  - On main or Completed: HopfRinow, ConformalMapping, UniversalCovers, DifferentialGeometry, SmoothBundlesConnections (B1.4, B1.5, B2.1, B4.x, B5.0, B5.1, B5.2, B6.0 all present), GeometricTopology, ComplexKahlerGeometry, PseudodifferentialOperators (P1.0 and the P7a layer present), PDE, GeneralizedCohomology, TopologicalKTheory, CharacteristicClasses, GeometricMeasureTheory, Isoperimetry, SpinGeometry, AlgebraicTopology (8.11a present), DGFloer, RepresentationTheory/LieGroups, RepresentationTheory/ClassicalGroups, RepresentationTheory/CompactGroups, MorseTheory, HeegaardFloer, AffineMorseLefschetz, Yamabe, NoncommutativeGeometry and OptimalTransport.
  - R5b's UnboundedOperators §4.7 (UO-D06) is at #1027's head (`OperatorTheory/UnboundedOperators/README.md:703`). VariationalMethods §§2.3, 2.4, 5.1 and 5.2 are at #1028's head, which adds a new roadmap folder.
  - Main's README already cites both, and the dependency check accepts them.
- **Consumers.** RicciFlow (#1023 head), PositiveMass (#956 head) and the roadmaps on main cite R1–R8 by ids that still exist at this head, including R1.4 and R1.5 as section labels. The overlap tool reports no dropped id.

### Ownership against open work

- I searched the Lean files at the open heads and on main for Bishop–Gromov, Cartan–Hadamard, Bonnet–Myers, Synge, Rauch, Günther, Killing–Hopf, `harmonic_irreducible` and the loop-space theorem. They occur only in this folder, plus #1187's copy of this same file.
- RicciFlow (#1023) consumes this roadmap's R1–R4, and PositiveMass (#956) its R1–R5, R4.1, R7.8 and R8. Neither owns them.
- No `Suggested.lean` declaration reuses a fully qualified name from a roadmap I can read.

### Adversarial table

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| §1.1 item 4, `twentyFour_mul_apply_eq_of_cyclic_eq_zero` | universal over ℤ; random algebraic curvature tensor on ℝ⁴; constants 12 and 48 | ℤ-membership of `24T − RHS` in the span of the 768 hypothesis instances: yes (Hermite pivots 1 and 2). Random tensor: `24r = −7.865184`, RHS `−7.865184`. With 12 or 48 in place of 24: not in the span | true over every commutative ring; constant 24 forced (R06 is about form only) |
| §1.1 item 4 Checks | K=1, orthonormal x,y with z=y, w=x; ω with `ω(e₁,e₂)=ω(e₃,e₄)=1` | `B_Q(x,x;y,y)=16`, `B_Q(y,x;x,y)=−8`, difference `24 = 24·r(x,y,y,x)`. ω: `8−(−8)=16 ≠ 24`, Bianchi sum `1 ≠ 0` | Checks exact |
| Andrews Prop. 16.2.1 display | random tensor, index tuples (1,2,3,4), (1,2,2,1), (1,3,2,4), (2,3,4,1) | printed: 0.200078, 0.482429, −1.144167, 1.344246; true `R_A`: −0.195630, 0.289457, −0.392747, 0.197117; with the sixth-term signs reversed: equal to `R_A` | source misprint |
| §1.2 Checks | `dx²+e^(2x²)dy²`; unit and radius-2 S³; their disjoint union | `K=−2−4x²`, `∂ₓK(1)=−8`; `a=2` and `a=1/2`; union Einstein with unequal factors | correct; connectedness and `n≠2` guards needed |
| §1.3 conformal Scal law | n=2, flat metric, `u=−log y` | `Δ⁺u=−1/y²`, `Scal̃ = y²·2·(−1/y²) = −2 = 2K`, K=−1 (hyperbolic) | sign dictionary correct |
| §1.3 O'Neill A and T Checks | S³→CP¹; `dx²+e^(2x)dy²`; `dx²+e^(4x)dy²` | `|A_XY|=1`, `K_B=1+3=4`; `Γˣ_yy=−e^(2x)`, `T_UU=−∂x`, norm 1; `T_UU=−2∂x`, norm 2 | correct |
| §1.3 projective normalization | `X=[[0,−1],[1,0]]`; `diag(0,i)` | `−tr(X²)/2 = 1 = |Xe₂|²`; ½ vs 1 | correct |
| §2.1, `exists_jacobi_initial_data` | flat line; unit great circle `sin t·E`; `t²E`; constant geodesic | `u+tv`: residual 0; `−sin t + sin t = 0`; residual `2E`; for constant γ, `X=u+(t−a)v` solves `D²X=0` | true; data (u,v) attained |
| §2.2 jets and radial frame | unit S², `t=π/2`; octant triangle; Brewin on S² | coordinate vector `sin t/t = 0.636620 = 2/π` vs transported norm 1; holonomy = area = π/2; `sin²t = t² − t⁴/3 + 2t⁶/45` vs Brewin's `−⅓K|v|²` | correct |
| §2.3 R1.5 | unit S², λ=10, ρ=1; Euclidean N | angular coefficient `λ²sin²(ρ/λ)/ρ² = 0.996671` vs `1−ρ²/(3λ²) = 0.996667`; `K(g_j)=λ⁻²=0.01`; flat: `g_j` exactly Euclidean | true; no locator (R07) |
| R3 index Checks | flat `sin(πt)`; unit sphere L=π and 3π/2 | `I=π²/2=4.934802`; `I=0`; `I=(2π/3−3π/2)/2=−1.308997=−5π/12` | correct |
| `singularHomology_loopSpace_sphere` | n=2, 3; n=1; i=0 | n=2: ℤ in every degree (Poincaré series `(1+t)/(1−t²)=1/(1−t)`); n=3: ℤ in even degrees; i=0: `n−1 ∣ 0`, H₀=ℤ (ΩSⁿ connected); n=1: H₀ = ⊕_ℤ ℤ | true; `2 ≤ n` needed |
| `rauch_norm_ge_of_sectional_le` | K=κ=1; radius-5/2 sphere with κ=1; κ=−1 | `sin t ≤ sin t`; t=π/2: `1 ≤ 1.469463`; t=5π/2: `1 ≤ 0` false, excluded by `hmodel`; `s₋₁(π/2)=2.301299` | true; guard needed |
| `guenther` | unit S², κ=1, r=1; flat ℝ²/ℤ², κ=0, r=0.5 and 0.6; circle of length 2π, r=π; ℍ² with κ=0, r=1; n=0 | `2π(1−cos 1)=2.888366` both sides; `π/4=0.785398` both sides; at r=0.6, `(±0.5,0)` have the same image, so `hinj` fails (inj=1/2); `2π` both sides; `3.412276 ≥ 3.141593`; LHS 0 | true; the `hinj` ⇔ `r ≤ inj(p)` argument checked |
| `bishopGromov` | unit S² with κ=0; ℍ² (Ric=−g); circle of length L | `vol/r²` = 2.888, 2.224, 1.273 at r=1, 2, π (nonincreasing); ℍ²: 3.412, 4.339 (increasing, Ricci hypothesis violated); `min(2r,L)/r` nonincreasing | true; Ricci hypothesis needed |
| `cartanHadamard_isCoveringMap` | flat T²; ℍ²; S²; S¹ | `exp_p:ℝ²→T²` covering; ℍ²: diffeomorphism; S²: K=1 violates `hK`; S¹: covering ℝ→S¹ | true |
| `bonnetMyers_distance`, `myers_finite_fundamentalGroup` | unit Sⁿ with λ=n−1; RP³; S²×S¹; n=1 | `π√1 = π = diam` (sharp); RP³: π₁=ℤ/2, diam π/2; S²×S¹: `Ric(∂θ,∂θ)=0` violates; n=1 excluded by `hdim` | true |
| `synge`, `synge_orientable_of_odd` | point, S², RP², flat T², RP³, S³ | point simply connected; RP² fails orientability; T² fails strict K>0; RP³ odd, orientable, π₁=ℤ/2 | true |
| Killing–Hopf (three cases) | n=0, 1, 2 | n=0: point; n=1: line, not a circle (sphere guard `2 ≤ n`); ℍ¹ = (0,∞) with `dt²/t²`, isometric to ℝ by log | true |
| `two_distinct_geodesics` | unit circle, p=1, q=i; ℝ | `e^(iπt/2)` and `e^(−3iπt/2)` at t=½: `e^(iπ/4) ≠ e^(−3iπ/4)`; ℝ has one geodesic | true; compactness needed |
| `three_simple_closed_geodesics` | round S² | three great circles, T=2π, injective on [0,2π), distinct images | true |
| `paraboloid_geodesic_crossings` | a=1 and a=½ | a=1: `R₀=2.275594`, `t₀=6.467619`; `R₁=10.289815`, `t₁=109.142121`; `R₂=49.358898`; `T≥R²−a²`: 6.4676 ≥ 4.1783; `A≥2a log(R/a)`: 3.1416 ≥ 1.6445; chart determinant `2a r′/R = 0.169425`; `r″(0)=0.2`. a=½: `R₀=3.763459`, `t₀=15.343929`, `R₁=86.321884` | true; radii and times increase |
| `paraboloid_vertex_pole` | radial Jacobi field `r(ℓ)` vs round K=4 | ℓ=0.5: 0.446334 vs 0.420735; ℓ=1: 0.763927 vs 0.454649; ℓ=π/2: 1.040423 vs 0; ℓ=3: 1.554045 vs −0.139708 | no conjugate point |
| `riemannianDist_eq_sSup_smooth` | ℝ; ℝ²∖{0} with p=(−1,0), q=(1,0) | ℝ: smoothed clamps give `|f p − f q| → |p−q|`; punctured plane: intrinsic distance 2, not attained; f=x gives 2 | true without completeness |
| `harmonic_irreducible` | N=3, d=1; N=2, d=1; N=4, d=2; d=0 | N=3: the 3-dim standard representation; N=2: `R_θ·(x₁−ix₂) = e^(iθ)(x₁−ix₂)`, an invariant line; N=4: dim 9 = (2+1)²; d=0: dim 1 | true; `3 ≤ N` needed |
| R6 genericity (R01) | unit circle in ℝ², q=0 and q=(2,0) | q=0: `h ≡ 1`, every point degenerate; q is the focal centre, a null set; q=(2,0): `h=5−4cos θ`, `h″(0)=4`, `h″(π)=−4`, Morse | the Tau Ceti theorem covers it |
| R7.6 (R04) | S², RP², flat T², S¹, S²×S¹ | Ric=g gives H¹=0 on S² and RP²; T²: Ric=0, H¹=ℝ², excluded; S¹: Ric≡0, excluded; S²×S¹: `Ric(∂θ,∂θ)=0`, H¹=ℝ, excluded | true; strict positivity needed |
| R7.7 (R04) | S³, RP³, S², S²×S² | Rop=Id gives H²=0 on S³ and RP³; S²: p=2=n is not interior (H²=ℝ); S²×S²: `Rop(e₁∧e₃)=0`, excluded (H²=ℝ²) | true; `p < n` guard sharp |
| R7.0 Checks | line `x²`; unit circle `sin x`; unit S² | `−8+8+0=0` (−4 without the factor 2); λ=1, no bound for n=1; λ=2=nk with `Hess f=−fg` | correct |
| R8.5 map | the five-coordinate map on S² | sum of squares `= (x²+y²+z²)² = 1`; induced metric 3g; radius `√(m/λ) = √(2/6) = 1/√3` | correct |
| R5a Gauss and Ricci signs | unit S²⊂ℝ³ with `B=−⟨X,Y⟩ν` | `⟨R(X,Y)Y,X⟩ = 1·1 − 0 = 1`; `⟨R^⊥η,ξ⟩ = ⟨R^Nη,ξ⟩ + ⟨[S_η,S_ξ]X,Y⟩` rederived from `∇η = −S_η + ∇^⊥η` | correct |
| R3.3c Hopf picture | `j(u)`, σ, H | `|j|² = 1`; `σ(j(u)) = (Re u, Im u, 0)`; `H(0,ζ)=(0,0,1)`, `H(1,0)=(0,0,−1)`; `dH(ζ/2,0)=(1,0,0)`, `dH(iζ/2,0)=(0,1,0)` | correct |

## Not verifiable

- **O'Neill 1966.** The 1.3 sample's Theorem 2 and Corollary 1 are settled uncertified. I checked the curvature formula `K_B = K + ¾|[X,Y]^v|²` by computation (table), not against the text.
- **Milnor, *Morse Theory*.** The 2.1 sample's §14, p. 77, and Lemma 14.4, pp. 80–81, are settled uncertified.
- **Lee, *Introduction to Riemannian Manifolds*, and Fulton–Harris.** Settled uncertified and cited by locator only; outside the sample.
- **#1797's head.** The brief gives no checkout, so I did not read it. The overlap tool's fact that it drops the GeometricTopology anchor is used in R05 as reported.
- **Ownership against open pull requests outside the listed checkouts.** Not checked. This includes ManifoldOptimization (#1506), which the overlap tool lists.

## Source issues

- **Misprint** in andrews-dg-ch16 at Proposition 16.2.1, p. 154: the source says the final formula has the four one-sixth terms with signs −,−,+,+ on `K(e_j∧e_l)`, `K(e_i∧e_k)`, `K(e_i∧e_l)`, `K(e_j∧e_k)`; it should be +,+,−,− on these terms, as the proof's previous lines give; affects nothing.
