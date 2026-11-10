# Review of SpinGeometry (pull request #1674 at 63ffb1c)

**Verdict:** needs changes

This is a full AI re-review of `TauCetiRoadmap/SpinGeometry/` at 63ffb1c. The AI does not approve or merge.

- Both findings of the previous review are repaired (details under "Previous findings").
- The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with `sorry` as its only warning.
- Three P3 findings remain, none blocking:
  - R01: the Levi-Civita connection and the curvature identities are cited to roadmaps although the pins have them;
  - R02: the locator for G2.3 and G5.2 does not contain what they state;
  - R03: one G1.2 Check calls squared norms "norms".

## R01 (P3) — The Levi-Civita connection, the curvature operator and the scalar curvature are pinned, but Layers 3, 5 and 6 cite HopfRinow L1 and RiemannianGeometry R1 for them

**Location.**
- `README.md:291–293`: "[HopfRinow L1] supplies the actual Levi-Civita covariant derivative. [RiemannianGeometry R1,R5,R7] supplies curvature identities".
- The *Needs:* lines at `:930` (G3.4, "HopfRinow L1"), `:1361` (G5.1, "HopfRinow L1 for tangent bundles"), `:1694` (G6.2, "RiemannianGeometry R1") and `:1721` (G6.3, "RiemannianGeometry R1 curvature identities"), and Layer 3's Dependencies at `:945`.
- Conventions `:104` fixes `R(X,Y)=[∇_X,∇_Y]−∇_[X,Y]` without naming a pinned carrier.

**Claim.** HopfRinow L1 supplies the Levi-Civita connection, and RiemannianGeometry R1 supplies the curvature identities.

**What is wrong.** The previous review's R01 (pinned objects credited to roadmaps) has one more instance.
- `Completed/HopfRinow/README.md:28–33` itself consumes the positive connection from Mathlib and Tau Ceti. Its Layer 1 owns only the nondegenerate and parameter-family extension, which no SpinGeometry target uses.
- The curvature objects that G3.3, G6.2 and G6.3 use are declarations of Tau Ceti `2fd255d9`, with the README's sign.

**Witness.**
- Mathlib `CovariantDerivative.leviCivitaConnection` (`Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:360`).
- Tau Ceti, under `Geometry/Manifold/VectorBundle/CovariantDerivative/`:
  - `CovariantDerivative.curvatureOperator` (`Curvature/Basic.lean:89`), with ∇X∇Y−∇Y∇X−∇[X,Y], Lee's sign;
  - `curvatureTensor` (`Tensor.lean:152`);
  - `curvatureTensor_cyclic_eq_zero` (`Bianchi.lean:83`);
  - `Bundle.ContMDiffRiemannianMetric.scalarCurvature` (`Scalar.lean:212`).

**Repair.**
1. Under "From Mathlib", add `CovariantDerivative.leviCivitaConnection` and `CovariantDerivative.IsMetricCompatible` from `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean` and `Metric.lean`.
2. Under "From Tau Ceti", add a G3–G6 bullet for the files under `Geometry/Manifold/VectorBundle/CovariantDerivative/`:
   - `LeviCivita/Regularity.lean`: `CovariantDerivative.instContMDiffCovariantDerivativeLeviCivitaConnection`;
   - `Curvature/Basic.lean`: `CovariantDerivative.curvatureOperator`, the curvature of a covariant derivative on any vector bundle, which serves as R^E in G3.3 and G6.2;
   - `Curvature/Tensor.lean`: `CovariantDerivative.curvatureTensor`;
   - `Curvature/Bianchi.lean`: `CovariantDerivative.curvatureTensor_cyclic_eq_zero` and `CovariantDerivative.IsMetricCompatible.inner_curvatureTensor_swap_pairs`;
   - `Curvature/Riemann.lean`: `CovariantDerivative.scalarCurvature_eq_sum_riemannCurvatureTensor`;
   - `Curvature/Scalar.lean`: `Bundle.ContMDiffRiemannianMetric.scalarCurvature`.
3. In Conventions (`:104`), say that `R(X,Y)` is `CovariantDerivative.curvatureOperator`.
4. Rewrite `:291–293`:
   - Cite the connection and the curvature identities from the pins.
   - Keep HopfRinow only if a target uses its nondegenerate extension.
   - Keep RiemannianGeometry R1, R5 and R7 for what they add beyond the pin: normal-coordinate jets, ∇R, the pullback and normal connections, and the Weitzenböck comparison.
5. Repoint the *Needs:* at `:930`, `:945` and `:1361` to the pinned connection, and the one at `:1721` to the pinned Bianchi identity and scalar contraction.

**Tested.**
- On the unit S², `sectionalCurvature` (`Curvature/Sectional.lean:77`) is ⟨R(u,v)v,u⟩/det Gram. For an orthonormal pair this gives ⟨R(e₁,e₂)e₂,e₁⟩=1, which is the README's Check R(e₁,e₂)e₂=e₁.
- The scalar curvature is then 2, and Scal/4=½, the G6.3 Check.
- So the pinned sign agrees with the Conventions, and citing it changes no formula.

## R02 (P3) — G2.3 and G5.2 cite Nicolaescu p. 633 for graded-product laws and a K-class product that it does not contain

**Location.**
- `README.md:797` (G2.3): "(Nicolaescu, graded-module discussion, p. 633.)"
- `README.md:1382` (G5.2): "(Nicolaescu, graded-module discussion, p. 633, followed by associated-bundle transport.)"

**Claim.** Page 633 supports the targets kept in G2.3 and the input to G5.2:
- G2.3: product chirality, associativity, Koszul symmetry, unit, orientation reversal, the duality sign and the comparison with `CliffordAlgebra.prodEquiv`;
- G5.2: `[S⁺(V⊕W)]−[S⁻(V⊕W)]` as a product.

**Witness.**
- Nicolaescu lines 29492–29499 (p. 633) say only that the graded modules over one space are S⊗̂W.
- Chapter 12 has no orthogonal sum V⊕W, product action or K-class.
- The pinned `LinearAlgebra/CliffordAlgebra/Prod.lean:50–53` cites Lawson–Michelsohn I §§1, 5 and Atiyah–Bott–Shapiro (ABS) §1.

**Repair.**
- G2.3: replace the parenthesis with "(Nicolaescu, Definition 2.2.42, p. 58, for the s-tensor product and its grading, and p. 633 for graded modules as S⊗̂W; Lawson–Michelsohn, Chapter I, §§1 and 5, and Atiyah–Bott–Shapiro, §1, for the graded tensor product of the Clifford algebras and modules of an orthogonal sum.)"
- G5.2: replace the parenthesis with "(Lawson–Michelsohn, Chapter I, §§1 and 5, and Atiyah–Bott–Shapiro, §1, for the graded product of the spinor modules of an orthogonal sum, followed by associated-bundle transport.)"
- Both of those texts are settled as `uncertified` and are cited by locator only.

**Tested.**
- Definition 2.2.42 is at Nicolaescu line 2826 (PDF page 70 = printed p. 58). It defines (E⊗̂F)_ε=⊕_(i+j≡ε) E_i⊗F_j.
- On two Fock planes this gives even and odd dimensions 2 and 2, which is G2.3's first Check.

## R03 (P3) — G1.2's fourth Check calls squared norms "norms"

**Location.** `README.md:478`: "equal to its H-norm; the norm of the antisymmetrized tensor w₁⊗w₂−w₂⊗w₁ is 2 and that of its half is 1/2, so neither tensor convention is H in degree two."

**Claim.** The norm of the antisymmetrized tensor is 2, and the norm of its half is 1/2.

**Witness.**
- ‖w₁⊗w₂−w₂⊗w₁‖² = ⟨w₁,w₁⟩⟨w₂,w₂⟩ − 0 − 0 + ⟨w₂,w₂⟩⟨w₁,w₁⟩ = 2. So the norm is √2, and the half has norm 1/√2.
- 2 and 1/2 are the squared norms. The adjacent Checks (`:475`, `:477`) correctly say "squared norm".

**Repair.** Replace the clause with "equal to its squared H-norm; the squared norm of the antisymmetrized tensor w₁⊗w₂−w₂⊗w₁ is 2 and that of its half is 1/2, so neither tensor convention is H in degree two."

**Tested.**
- In squared norms, H gives 1, while the two tensor conventions give 2 and 1/2. The Check still separates both conventions from H.
- It now reads correctly for Mathlib's `‖·‖`.

## Previous findings (PRREVIEW-SpinGeometry~24)

- **R01 (P3, objects credited to roadmaps although Tau Ceti has them): repaired.**
  - "From Tau Ceti" lists the pinned objects, by name:
    - `README.md:209–243`: principal-bundle pullback and `trivializationOfSection`; `fiberBundleCoreOfGroupCocycle`, its principal instance and `homeomorphOfCohomologous`; `VectorBundleOrientation`, `VectorBundleOrientationCover` and `nonempty_iff_exists_section`; `toOrientationCover`, `orientedRel` and `orientationCoverHomeomorph`; the smooth principal atlas.
    - `:258–271`: `SmoothForm.hodgeStar`, `codifferential`, `codifferential_neg_orientation` and the formal adjointness.
  - The roadmap citations are narrowed:
    - `:316–326` cites T6.4 for "numerability, homotopy invariance …, bundle morphisms, associated bundles and extension of the structure group". It cites C1.0 for the oriented subbundle, the metric-change transport and the rank-zero conventions, and C3.2 for w₁.
    - `:1038–1045` (G4.2) names the pinned carriers.
    - `:1186–1191` (G4.4a) classifies orientations as sections of `VectorBundleOrientationCover`.
    - `:1168` (G4.4) needs "Tau Ceti's cocycle gluing and cohomologous-cocycle homeomorphism".
    - `:301–306` narrows K5 to complex- and bundle-valued forms and the analysis.
  - The sentence "C1 owns its continuous orthonormal/oriented frames" is gone.
  - R01 above is a residue of the same pattern, for objects the previous review did not list.
- **R02 (P3, G1.2 locator): repaired.**
  - `:466–469` now cites Prop. 12.1.19, pp. 630–631, for the Fock action; §2.2.4, ΛʳB, p. 60, and (2.2.8), p. 61, for the Gram determinant; and Prop. 12.1.27, p. 634.
  - I checked the pages: ΛʳB is at line 2916 (PDF 72 = p. 60), (2.2.8) at line 2935 (PDF 73 = p. 61), and Prop. 12.1.27 at line 29526 (p. 634).

The previous review's report marks nothing "not actionable", so nothing is re-raised.

## Verified sound

**Head, scope and gate.**
- `git rev-parse HEAD` = 63ffb1c8; the worktree is clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty.
- Main has not touched the folder since the merge base f8836c48 (`git diff f8836c48 origin/main -- TauCetiRoadmap/SpinGeometry` is empty).
- The pins are Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`.
- My gate run: `gate SpinGeometry: set_option=0 … imports=0 … statement-hygiene=0 … readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run adds `build=0`.

**Dependency check** (the required command):

```text
depcheck: 233 roadmaps, 2263 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or `moved:` line.
- SpinGeometry is on main. Every supplier it names is on main, and all twelve relative links resolve on main 5996bd15.
- TangentialBordism B3.0 and IndexTheory I7.5 are named only as downstream consumers, in text already on main (main SpinGeometry lines 698, 843, 860).

**Build, signatures, padding.**
- `lake env lean TauCetiRoadmap/SpinGeometry/Suggested.lean`: exit 0. The only output is `116:8: warning: declaration uses 'sorry'`. `Suggested.lean` is unchanged since 2de5c72.
- `#check @` of both declarations in a scratch copy:
  - `SpinStructure` takes `[NeZero n]` and binds X, F, E with their fibre norms and inner products;
  - the theorem takes `[T2Space X] [Topology.CWComplex Set.univ]`, `finrank ℝ F = 2`, `[FiberBundle F E] [VectorBundle ℝ F E] [IsContinuousRiemannianBundle F E]` and `IsThomClass F E u`.
  - Both agree with README `:1056–1072` and `:1233–1238`. No binder is lost, and nothing changed.
- One-tactic probe: the theorem body replaced by `simp` gives "`simp` made no progress". The theorem is not padding, and `SpinStructure` is the one definition it needs.

**Library declarations opened at the pins (40).**
- Tau Ceti, bundles and orientations:
  - `TauCeti.PrincipalBundle.pullback` (`Topology/FiberBundle/Principal.lean:423`; it needs nonempty fibres) and `trivializationOfSection` (`:363`; needs `IsTopologicalGroup`);
  - `fiberBundleCoreOfGroupCocycle` (`GroupCocycle.lean:90`; the cocycle law is `c j k b * c i j b = c i k b`), `principalBundle_fiberBundleCoreOfGroupCocycle` (`:294`), `homeomorphOfCohomologous` (`:198`);
  - `OrthonormalFrameBundle.associatedHomeomorph` (`OrthonormalFrame/Basic.lean:564`) and `OrthonormalFrameBundle.pullbackHomeomorph` (`OrthonormalFrame/Pullback.lean:97`);
  - `VectorBundleOrientation` (`Orientation/Basic.lean:192`), `VectorBundleOrientationCover` (`Cover.lean:84`), `VectorBundleOrientation.nonempty_iff_exists_section` (`Cover.lean:498`);
  - `OrthonormalFrameBundle.toOrientationCover` (`Orientation/OrthonormalFrame.lean:80`), `toOrientationCover_eq_toOrientationCover_iff` (`:120`: same orientation iff they differ by an orthogonal map of positive determinant), `orientedRel` (`:138`), `orientationCoverHomeomorph` (`:309`, with `[Nonempty ι]`, i.e. positive rank).
- Tau Ceti, smooth bundles:
  - `ContMDiffFiberBundle` (`Geometry/Manifold/FiberBundle/Basic.lean:122`) and `ManifoldTotalSpace` (`:189`);
  - `PrincipalBundle.contMDiffFiberBundle_iff` (`FiberBundle/Principal.lean:96`, given `ContMDiffMul`), `ContMDiff.division` and `totalSpaceMk_smul` (same file).
- Tau Ceti, forms and codifferential:
  - `SmoothForm` (`DifferentialForm/Smooth.lean:479`), `mextDerivₗ` (`Regularity.lean:478`), `integralTopForm_mextDeriv_eq_zero` (`BoundarylessStokes.lean:122`), `Manifold.Orientation` (`Orientation/Basic.lean:32`);
  - `SmoothForm.hodgeStar` (`Riemannian/HodgeStar.lean:296`) and `hodgeStar_hodgeStar` (`:102`);
  - `SmoothForm.codifferential` (`Codifferential.lean:88`), defined as `(−1)^(m(k+2)+1)⋆d⋆` on (k+1)-forms, so `(−1)^(m(j+1)+1)` with j=k+1, as the README says;
  - `codifferential_neg_orientation` (`:121`);
  - `integralTopForm_inner_mextDeriv_eq_inner_codifferential` (`:252`), under `[BoundarylessManifold I M] [T2Space M] [SigmaCompactSpace M]` with one of the two forms compactly supported, as the README says.
- Tau Ceti, Clifford algebra: `Module.End.eigenspaceTensorMapEquiv` (`Eigenspace/TensorProduct/Involution.lean:114`), `AlgHom.cliffordProdTensor` (`CliffordAlgebra/Prod.lean:102`), `CliffordAlgebra.complexProdTensor` (`VolumeElement/Prod.lean:139`). Neither Prod file has an associativity, symmetry or unit law, so G2.3's kept laws are genuine targets.
- Tau Ceti, curvature (R01): `curvatureOperator` (`Curvature/Basic.lean:89`), `curvatureTensor` (`Tensor.lean:152`), `curvatureTensor_cyclic_eq_zero` and `inner_curvatureTensor_swap_pairs` (`Bianchi.lean:83/:102`), `scalarCurvature_eq_sum_riemannCurvatureTensor` (`Riemann.lean:93`), `sectionalCurvature` (`Sectional.lean:77`), `ContMDiffRiemannianMetric.scalarCurvature` (`Scalar.lean:212`, built on Mathlib's Levi-Civita connection).
- Mathlib: `CliffordAlgebra.prodEquiv` (`LinearAlgebra/CliffordAlgebra/Prod.lean:170`; the module docstring's `equivProd` is stale) and `CovariantDerivative.leviCivitaConnection` (`CovariantDerivative/LeviCivita.lean:360`).
- A scan of all 222 backticked Lean-like names in the README against both pins:
  - 210 are declared at the pins;
  - the other 12 are roadmap-level names on main: SpinRepresentations' `SpinCompactTopologyFoundation`, and eleven GeneralizedCohomology G5.5 names, each found in its README.

**Docstring claims re-checked at the pins.**
- The only Stiefel–Whitney files are field-theoretic (`FieldTheory/QuadraticForm/StiefelWhitney/`).
- No `TensorProduct` occurs under `Topology/VectorBundle/` in either library.
- The only associated-bundle construction is the frame-specific `associatedRel`/`associatedHomeomorph`.
- There is no Levi-Civita connection on form bundles and no Clifford-module bundle.
- So every headline the docstring calls not statable still lacks the carrier it names.

**Cross-roadmap citations resolved on main 5996bd15.**
- CharacteristicClasses:
  - C1.0 (lines 214–243): the metric change h₁(u,v)=h₀(Hu,v), the inverse square root, the Sylvester derivative, the composition comparison, the rank-zero zero-frame carrier and the determinant-sign cover;
  - C3.2 (line 1115): "w₁ is the orientation-cover class" and w_n=e mod 2;
  - C3.5, and C7.3 item 3.
- TopologicalKTheory T6.4 (lines 1286–1340): numerability, homotopy invariance over X×I, morphisms, cocycles with cover refinement, associated bundles and extension along homomorphisms.
- `Completed/HopfRinow/README.md:28–33` (see R01).
- RiemannianGeometry: R1 (line 186), R5 (line 1072), R7 (line 1323).
- SmoothBundlesConnections: B1.1 (315), B2.1 (559), B2.5 (802), B3.3 (936), B4 (977), B6.0 (1306).
- PseudodifferentialOperators: `### P1.0.` (164) and Layers 4–6 (782, 927, 1484).
- The anchors GeneralizedCohomology `#g5-…` (1373) and TopologicalKTheory `#t7-…` (1517).
- `SpinCompactTopologyFoundation` (SpinRepresentations line 520), and AlgebraicTopology 8.9 (line 2108).
- ComplexKahlerGeometry K5 (line 568), which has the Gram⊗h_E metric (K5 lines 17, 45).

**Overlaps (all 7 items checked).**
- #1780 conflicts in both files. The description's merge-order block puts this pull request first ("this pull request → #1780"). #1780's `Suggested.lean` declares no `SpinStructure`.
- ComplexKahlerGeometry `#k5-…` (`README.md:341`) is dropped by #1234, #1807, #1808 and #1854. Each maps it at its head:
  - #1234 lines 366–367: "K5 is now Layer 5";
  - #1807 line 551 and #1854 line 529: the anchor → Layer 5;
  - #1808 line 567: `K5` → Layer 5.
- The CharacteristicClasses revisions #1807, #1808 and #1854 keep C1.0's metric-change and Sylvester text (#1807 lines 355/365, #1808 line 586, #1854 lines 575/582) and C3.2's "w₁ is the orientation-cover class" (#1807 line 1683, #1808 line 2060, #1854 line 2037).
- This pull request drops `#g1-…` and `#g4-…`:
  - GeneralizedCohomology on main (line 42) links a commit permalink (41b8e275), which does not break.
  - SpinRepresentations #1207 (60e7039e, lines 1099, 1101, 1574, 1575) is covered by the former-heading table (`README.md:359–366`). The overlap tool still lists the ids; the table's header reads "Former heading", which the tool may not recognize.
- Closest open roadmaps:
  - IndexTheory #1077 (6d85f5d4) consumes SpinGeometry G1–G6 and G6.7 (its README lines 270–273, 1544) and owns no Spin structure or Lichnerowicz formula.
  - A search of all open heads' Lean files finds `SpinStructure` only in this pull request.
- So this roadmap remains the single owner of bundle-level Spin structures and the rank-two criterion. CharacteristicClasses C3.5 owns only the universal w₂.

**Adversarial table.** It covers the headline and its definition, the 15 sampled targets, the targets this round changed (G4.2, G4.4, G4.4a) and the targets the findings touch.

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| Rank-two criterion (headline, G4.4a) | X=∅; X=pt; S² with TS² and with the Hopf plane bundle, both orientations; ℝP² with γ⊕γ; ℂP^∞ with L and L⊗L; T² with ε²; a non-orientable plane bundle | ∅: H²=0, the empty family is a structure, both sides hold. pt: e=0=2·0, trivial Spin(2)-bundle with frame b₀∘ρ(g). S²: e=2=2·1 and w₂=0; e=1∉2ℤ and w₂=1; reversed: −2=2·(−1) holds, −1 fails. ℝP²: e=β(a)≠0 in ℤ/2 with 2H²=0, so the right side fails, and w₂=a²≠0, so the left fails. ℂP^∞: x is not divisible and w₂≠0; 2x=2·x with root L. T²: e=0, four structures. Non-orientable: no u satisfies `IsThomClass`, so the theorem is vacuous; also no structure | true in both directions in every case; no change |
| `SpinStructure` (G4.2), defining laws | P=X×Spin(2) with frame b₀∘ρ(g); wrong models: constant frame map, P=Fr⁺ acted on through ρ, wrong n | Satisfies: frame(p·h)(v)=b₀ρ(g)ρ(h)v=frame(p)(ρ(h)v). Constant map: needs b₀=b₀ρ(h) for h=e^{iπ/4}, but ρ(h) is a quarter turn, so false. Fr⁺ through ρ: −1 acts trivially, contradicting freeness of the torsor action. n≠rank: frames ℝⁿ≃E_x are empty over every point, so only X=∅ admits a structure | the definition fixes its object; no change |
| G4.2 metric change (changed this round) | g′=4g; noncommuting B₁=diag(4,1) and its conjugate by a 45° rotation | B=4Id, B^(−1/2)=Id/2: g′(e/2,e/2)=1, while g′(2e,2e)=16. det B^(−1/2)=2^(−n)>0, and (B^(−1/2)f)∘A=B^(−1/2)(f∘A). Since B₁B₂≠B₂B₁, (B₁B₂)^(1/2)≠B₁^(1/2)B₂^(1/2) | holds, and matches C1.0 lines 228–236 |
| G4.4 twist by cocycle gluing (changed) | trivial oriented line on S¹, 2-arc cover | lift g̃=1 gives the disconnected cover; ε=(1,−1) on the two overlaps gives ε·g̃ glued by `fiberBundleCoreOfGroupCocycle` = the connected cover; twisting twice gives ε²=1; ε changed by δη is cohomologous (η central) | holds; 2=\|H¹(S¹;ℤ/2)\| |
| G4.4a orientations (changed) | Möbius and trivial line on S¹, one 0-cell and one 1-cell | Möbius: transport around the 1-cell flips the vertex frame, so there is no extendible frame, w₁≠0, and no section of the cover. Trivial: 2 classes, \|H⁰(S¹;ℤ/2)\|=2 | holds |
| G4.4a skeletal and low rank | trivial rank 3 on S¹; TS² | π₁SO(3)=ℤ/2 gives 2 classes = 2 lifts. TS²⊕ε¹≅ε³ gives skeletal data, while e(TS²)=2≠0 blocks an unstabilized 2-frame. Stabilization adds ε¹ (n=2) and ε² (n=1), as in Kirby line 1131 | holds |
| G1.2 Fock action, Gram target, Checks (sampled; R03) | unit J-plane, w=√2e₁^(1,0); h_ℂ-orthonormal w₁,w₂ | g_ℂ(v¹⁰,v⁰¹)=¼(1+1)=½. c(e₁): 1↦w, w↦−√2·√2·½=−1. c(e₂): 1↦iw, w↦−√2(−i)√2·½=i. det[[1,0],[0,1]]=1=H(w₁∧w₂,w₁∧w₂). ‖w₁⊗w₂−w₂⊗w₁‖²=2, so the norm is √2 | target holds; Check wording R03 |
| G1.3 traces (sampled) | negative line a+be; a=1+e₁+2e₂; null e | L=[[a,−b],[b,a]], so ½·2a=a and (a−be)(a+be)=a²+b². a*a=1+1+4−2(e₁e₂+e₂e₁)=6. reverse(e)e=e²=0 | holds |
| G2.3 graded product (sampled; R02) | two Fock planes; odd f; negative point | ΓV⊗ΓW eigenvalues (1,−1,−1,1), even/odd dimensions 2/2. Koszul: c(v)e⊗f↦(−1)^(\|e\|+1)f⊗c(v)e=(Γ_W⊗c(v))((−1)^\|e\|f⊗e). Negative point: c(0,w)=−c_W(w) | laws hold; locator gap R02 |
| G3.1 (sampled) | G=ℝ, ρ(t)=rotation by 2t, μ=diag(e^(−it),e^(it)) | c(ρ(t)e₁)=cos2t c(e₁)+sin2t c(e₂)=[[0,−e^(−2it)],[e^(2it),0]]=μc(e₁)μ⁻¹ | holds; the source assumes no compactness (line 29607) |
| G3.3 (sampled) | B=diag(i,−i), c(e₁)=[[0,−1],[1,0]] | Bc=[[0,−i],[−i,0]] and cB=[[0,i],[i,0]], so [B,c]=[[0,−2i],[−2i,0]]≠0, while B†=−B | holds |
| G3.4, G6.4 d* identification (R01 context) | ℝ, f=x², h=0; flat circle | c(dx)(f,h)=(−h,f), D(f,h)=(−h′,f′), D²(x²,0)=(−2,0). Pinned d*: ⋆(h dx)=h, ⋆(h′dx)=h′, sign (−1)^(1·2+1)=−1, so d*(h dx)=−h′=−ι(e)∇_e(h dx). Circle harmonic dimensions (1,1) | holds |
| G4.1 (sampled) | Spin(2)→SO(2); rank 1 | z=i↦−1 and z=−1↦1, so the kernel is {±1}; d(2θ)/dθ=2; Spin(1)={±1}→SO(1)={1} | holds |
| G4.3 (sampled) | Hopf plane bundle on S²; trivial bundle | e=1, so w₂=1 and there is no lift; transition lifts 1 give triple discrepancy 1, which is 0 additively | holds; not statable (no vector-bundle w₂) |
| G5.2 (sampled; R02) | two planes; signed points | (1,1)⊗(1,1) gives (1+1, 1+1)=(2,2), virtual 0=0·0; (1,0) preserves, (0,1) swaps and negates | holds; locator gap R02 |
| G5.3 (sampled) | z=cosθ+sinθe₁e₂ with e_i²=−1; θ=π/2; ℝP³ | ze₁z⁻¹=e₁z⁻²=cos2θe₁+sin2θe₂. Fock: c(e₁e₂)1=−i and c(e₁e₂)w=iw, so S⁺↦e^(−iθ) and S⁻↦e^(iθ); at π/2: E −1, S± −i, i. H²(ℝP³;ℤ)=ℤ/2 and c₁(γ_ℂ)=β(a)≠0 | holds |
| G6.1 (sampled) | ℝ with c(e)=i; Fourier coefficients 1/k | De^(ikx)=i·ik e^(ikx)=−ke^(ikx), D² eigenvalue k²; σ_geom(1)=i, σ_F(1)=i·i=−1. Σ1/k²<∞ but Σk²/k²=∞ | holds |
| G6.2 (sampled) | plane curvature B | Σ_(i,j)c_ic_jR(e_i,e_j)=c₁c₂B+c₂c₁(−B)=2c₁c₂B, so the ordered sum needs ½; (D+1)²=D²+2D+1 | holds; matches Thm 12.1.67 |
| G6.3 Lichnerowicz (sampled; R01) | unit S² with README/Tau Ceti sign | R^S(e₁,e₂)=¼[(−1)c₁c₂+(1)c₂c₁]=−½c₁c₂; c₁c₂·(−½c₁c₂)=−½(−1)=½=Scal/4; [−½c₁c₂,c(e₁)]=−c₂=c(R(e₁,e₂)e₁) | holds |
| G6.7 (sampled) | J(z,w)=(−w̄,z̄); a line; T⁴ | J²(z,w)=(−z,−w); \|a\|²=−1 has no solution; kernels 2 and 2 give 0=2(1−1); Γ=i²e₁e₂e₃e₄=−ω₋, as at Nicolaescu line 30267 | holds; not statable |
| Conventions: curvature and Clifford signs (R01) | unit S²; unit e | Tau Ceti K=⟨R(u,v)v,u⟩/det Gram=1 for R(e₁,e₂)e₂=e₁ and R(e₁,e₂)e₁=−e₂; c(e)²=−1=Q(e) | holds; name the pinned carrier (R01) |

**Sources: the seeded sample.**
- Nicolaescu's printed page is the PDF page − 12, checked at line 2863 (PDF 71 = p. 59), line 29491 (PDF 645 = p. 633) and line 30322 (PDF 666 = p. 654).
- Kirby's printed pages 33–34 are PDF pages 41–42.
- The README flags no locator as unverified.

| Target | Cited locator | Where it is | Supports the statement |
| --- | --- | --- | --- |
| G1.2 | Prop. 12.1.19, pp. 630–631; §2.2.4, pp. 60–61; Prop. 12.1.27, p. 634 | lines 29392–29456; 2912–2935; 29526–29541 | yes: Fock action with √2 and g_ℂ contraction; ΛʳB=det(B(v_i,w_j)); compatible metric unique up to a constant |
| G1.3 | Cor. 12.1.22, Rem. 12.1.23, p. 632; Prop. 12.1.27, p. 634 | lines 29466–29472, 29526–29548 | yes: E=S⊗W, W=Hom_Cl(S,E) |
| G2.3 | graded-module discussion, p. 633 | lines 29492–29499 | only for graded modules as S⊗̂W; R02 |
| G3.1 | §12.1.5, Ex. 12.1.33, pp. 636–637 | lines 29599–29662 | yes: Lie group, orthogonal ρ, invariant tensor c∈V*⊗E*⊗E (the §12.1.5 heading is on p. 635) |
| G3.3 | Lemma 12.1.31, p. 636; Def. 12.1.64(a2), p. 653 | lines 29637–29643, 30311–30314 | yes, including the Levi-Civita footnote (line 29643) |
| G4.1 | Prop. 12.1.42, pp. 640–641; Ex. 12.1.54, pp. 648–649 | lines 29793–29812, 30117–30125 | yes: covering, connected for dim≥2; Spin(2) squaring (misprint below) |
| G4.2 | §12.2.3, pp. 668–669; Kirby IV, p. 33 | lines 30914–30951; kirby lines 1133–1152 | yes: smooth cocycle lifts; principal Spin(n) covering over CW complexes |
| G4.3 | Prop. 12.2.25, p. 669 | lines 30934–30951 | yes, for tangent bundles (the README says so) |
| G5.2 | graded-module discussion, p. 633 | lines 29492–29499 | no orthogonal-sum product or K-class; R02 |
| G5.3 | Ex. 12.1.54, pp. 648–649 | lines 30117–30125 | yes, for the squaring cover |
| G6.1 | Def. 12.1.64, Props. 12.1.65–12.1.66, pp. 653–655 | lines 30304–30392 | yes: Dirac structure, existence, formal self-adjointness via (a2) |
| G6.2 | Thm. 12.1.67, p. 656 | lines 30403–30465 | yes: D²=∇*∇+Σ_(i<j)c(e_i)c(e_j)F_ij |
| G6.3 | Thm. 12.2.33, p. 673; Ex. 12.1.68, p. 657 | lines 31070–31101; 30468–30478 | yes: contraction to s/4 (proof p. 672); the twisted square formula |
| G6.4 | Prop. 12.2.1, p. 657; Ex. 12.1.25, p. 633 | lines 30497–30530; 29500–29514 | yes: d+d* is the Dirac operator of (g,∇^g), d*=−Σι∇ at normal-frame points; (12.1.1) |
| G6.7 | §12.1.8, pp. 651–653 | lines 30201–30282 | yes: Cl₄≅M₂(ℍ), Spin(4)=SU(2)², Γ=−e₁e₂e₃e₄, quaternionic S±₄ |

## Not verifiable

- Lawson–Michelsohn (Chapters I–II) and Atiyah–Bott–Shapiro (§§1, 6, 11) are settled as `uncertified` (paywalled). They are cited by locator only and were not opened. That includes the locators R02 proposes, which follow the pinned Tau Ceti file `LinearAlgebra/CliffordAlgebra/Prod.lean:50–53`.
- Kirby's OCR is unreadable at kirby line 1141 and partly garbled at lines 1155–1156. Lines 1115–1140 and 1157–1170 carry every statement the roadmap cites.
- Ownership against open pull requests was checked through the sibling checkouts and the `roadmaps` tools, as listed above.

## Source issues

- **Misprint** in nicolaescu at Example 12.1.54, p. 649: the source writes the squaring map e^{iθ}↦e^{2iθ} as a map out of Spin(1); it should be the map Spin(2)→SO(2); affects nothing.
- **Misprint** in nicolaescu at Exercise 12.1.61, p. 652: the source refers to §10.1.3 for the Fock isomorphism, but §10.1.3 is "Formal adjoints"; it should refer to §12.1.3 (proof of Proposition 12.1.19, pp. 630–631); affects nothing.
- **Misprint** in nicolaescu at the proof of Theorem 12.2.33, p. 672: when the curvature term is split into two sums, the distinct-index sum is printed without a coefficient; it should carry −1/8, like the original sum; affects nothing (that sum vanishes by Bianchi).
