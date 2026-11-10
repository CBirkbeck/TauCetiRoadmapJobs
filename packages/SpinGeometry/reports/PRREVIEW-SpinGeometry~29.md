# Review of SpinGeometry (pull request #1674 at 58f89ec)

**Verdict:** needs changes

This is a full re-review of `TauCetiRoadmap/SpinGeometry/` at 58f89ecd. The folder changed by 4478 lines since 3e31368, the head review ~28 read. The AI does not approve or merge.

- The gate passes on this head. The dependency check reports 0 problems. `Suggested.lean` elaborates with `sorry` as its only warning.
- All four findings of review ~28 are repaired (details below).
- One P3 finding remains, and it is not blocking. The Lean carrier `SpinStructure` lets its own frame map choose the orientation, but G4.4's torsor and the lift counts in the Checks only hold once an orientation is fixed.

## Previous findings (review ~28 at 3e31368)

- **~28 R01** (five pointwise declarations were padding in `Suggested.lean`): **repaired.**
  - `Suggested.lean` now declares only `SpinStructure` (`:89`) and `nonempty_spinStructure_iff_exists_eulerClass_eq_two_smul` (`:127`).
  - The README keeps the five as prose targets without Lean names: `README.md:715–716` "Record the geometric convention as a predicate on a real algebra map ρ into End_ℂ(S)", and `:2312–2313` "from the pointwise frame contraction Σ_j c(e_j)∇^E_(e_j)s".
  - `grep` finds none of `cliffordMultiplication`, `IsGeometricAction` or `diracInFrame` in the folder.
- **~28 R02** (the README had reverted to the older layout): **repaired.** The README now has:
  - `:1` "# Roadmap: clifford bundles, spin structures, and Dirac geometry", with the Summary at `:3`;
  - `:13` "## Scope and ownership" and `:66` "## Conventions";
  - `:135` "## Exact supplier contracts", split into From Mathlib (`:137`), From Tau Ceti (`:170`) and From the named roadmaps (`:417`);
  - `:505` "## How to read the build", with the former-heading table at `:519–526`;
  - Layers 1–6 at `:566`, `:971`, `:1263`, `:1461`, `:1882` and `:2111`, each ending with `### Examples` and `### Dependencies`;
  - `:2683` "## Downstream consumers" and `:2699` "## References".
- **~28 R03** (HopfRinow L1 and RiemannianGeometry R5 cited for objects with other owners): **repaired.**
  - `grep` finds no "HopfRinow" and no "R5". `:439` reads "[RiemannianGeometry R1,R7]".
  - Mathlib `CovariantDerivative.leviCivitaConnection` is cited in G3.3 (`:1381–1382`), G3.4 (`:1419–1420`, with the Tau Ceti smoothness instance), G5.1 (`:1988–1990`), G6.1 (`:2362–2365`) and G6.5 (`:2525–2526`).
  - G6.5 uses "CharacteristicClasses C7.3's radial stable framing `TSⁿ⊕ε¹≃εⁿ⁺¹`" (`:2517–2518`).
- **~28 R04** (Proposition 12.1.42 cited for the kernel): **repaired.** `:1477–1479` reads "Nicolaescu, Proposition 12.1.41, p. 640, for the surjection with kernel ℤ₂, and Proposition 12.1.42, p. 641, for the covering". `nicolaescu` lines 29793–29800 confirm both.

No earlier finding was marked "not actionable in this package" in a way I still dispute; see "Settled item" under Verified sound.

## R01 (P3) — G4.4's torsor and the lift counts hold for a fixed orientation, which the `SpinStructure` carrier does not fix

**Location.**
- `README.md:1610–1623` (G4.2): "For n≥1 this is the structure `SpinStructure` … Its frame map lands in the full orthonormal frame bundle; … the orientation of V is the one for which these frames are positive."
- `:1719–1727` (G4.4): "Given one lift, twist by a principal Z/2-bundle … Prove this action is free and transitive on equivalence classes, giving an H¹(X;Z/2) torsor".
- The counts in the Checks: G4.2 `:1656–1659` ("two structures" on the circle), G4.4 `:1751–1753` ("S¹ … two structures … T²: four; Sⁿ for n≥2: one") and G4.4a `:1853–1854` (TS² "has one spin structure").

**Claim.**
- G4.2 defines a lift for an oriented V, then names `SpinStructure` as that object for n≥1. But `SpinStructure` has no orientation parameter: its frame map picks the orientation.
- Equivalences preserve the frame map (`:1589`), so they preserve the induced orientation. For an orientable V of rank n≥1, the equivalence classes of `SpinStructure` are therefore one H¹(X;ℤ/2)-torsor for each orientation, not one torsor.
- Read on the README's own carrier, G4.4's "free and transitive" is false, and so are the counts in the three Checks. Nothing in the README says that the torsor and the counts are for a fixed orientation.

**Witness.**
- X a point, V=ℝ², n=2. A `SpinStructure` is a Spin(2)-torsor P with an equivariant frame map, whose image is one of the two SO(2)-orbits of frames of ℝ². There are two classes, one for each orientation, but H¹(pt;ℤ/2)=0.
- Over S¹ with V=TS¹ (n=1), there are four classes, against the two in G4.2's Check.

**Repair.**
1. In G4.2, after "…for which these frames are positive.", add: "Equivalences preserve the frame map and hence this orientation. For an orientable V, the equivalence classes of these structures are the disjoint union, over the orientations of V, of the classes of lifts of Fr⁺_SO(V)."
2. In G4.4, replace "Given one lift," with "Fix an orientation of V. Given one lift of Fr⁺_SO(V) for it,".
3. Add a G4.2 Check, worded without Lean names:
   - Over a point with V=ℝ², Spin structures whose frame map lands in the full frame bundle have two classes, one per orientation; for a fixed orientation there is one, matching H¹(pt;ℤ/2)=0.
   - Over S¹ with V=TS¹ there are four classes, two per orientation.

Test on the refuting instances: with a fixed orientation, the point has 1 class = |H¹(pt;ℤ/2)| and S¹ has 2 = |H¹(S¹;ℤ/2)|.

## Verified sound

**Head, scope and gate.**
- `git rev-parse HEAD` is 58f89ecd and the worktree is clean. The pins are Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty. The folder holds README.md, Suggested.lean, metadata.toml (`topic = "math.DG"`) and the generated STATUS.md and PROGRESS.md, all present on main.
- My own gate run ends `OK`, with every check at 0. That includes set_option, sorry-data, imports, statement-hygiene, readme-ids-missing, layer-ids, target-ids, depcheck, stray-files and outside-folder. The worker's run adds `build=0`.

**Dependency check** (the required command):

```text
depcheck: 233 roadmaps, 2264 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. This roadmap is on main, and every supplier it names is on main: SpinRepresentations, OrthogonalSpinGroups (Completed), SmoothBundlesConnections, RiemannianGeometry, DifferentialGeometry, ComplexKahlerGeometry, CharacteristicClasses, AlgebraicTopology, TopologicalKTheory, GeneralizedCohomology and PseudodifferentialOperators. Every relative link resolves on main 71c8f21. So do the anchors `#k5-…`, `#t7-…` and `#g5-…` (ComplexKahlerGeometry `:568`, TopologicalKTheory `:1517`, GeneralizedCohomology `:1373`).

**Settled item, not re-raised: reciprocal supply.** CharacteristicClasses, SpinRepresentations, RiemannianGeometry and GeneralizedCohomology each consume early sections here and supply later ones. Repair rounds marked this not actionable in the package, and review ~21 accepted the reason. The reason still holds at this head:
- The sections they consume cite none of them back. G1.1–G1.3 name only the pins. G2.2 names G1–G2 and ComplexKahlerGeometry K5. G3.1–G3.4 name SmoothBundlesConnections, ComplexKahlerGeometry K5 and the pins. G4.1a/b name G1.1, SmoothBundlesConnections B2 and the pins.
- The edge exists on main's own copy, which lists the interleaving under Downstream consumers (`:2685–2691`).
- CharacteristicClasses C3.5 on main cites "SpinGeometry G4.1a owns rank0/rank1 …" (`CharacteristicClasses/README.md:1195`), matching G4.1a `:1500` "This subsection precedes C3.5".

**Build and signatures.**
- `lake env lean TauCetiRoadmap/SpinGeometry/Suggested.lean` exits 0. Its only output is `127:8: warning: declaration uses 'sorry'`.
- I elaborated one scratch file with `#check @SpinStructure` and `#check @nonempty_spinStructure_iff_exists_eulerClass_eq_two_smul`. The types match `signatures.md` and the README statement in G4.4a (`:1822–1826`):
  - a Hausdorff `Topology.CWComplex` base in `Type`;
  - `finrank ℝ F = 2`;
  - `FiberBundle`, `VectorBundle` and `IsContinuousRiemannianBundle`;
  - `IsThomClass F E u` for `u` in degree `finrank ℝ F`;
  - conclusion `Nonempty (SpinStructure F E 2) ↔ ∃ c, eulerClass … u = 2 • c`.
- `SpinStructure` keeps every binder its fields use (`[TopologicalSpace (TotalSpace F E)]`, the fibre inner products, `[NeZero n]`). The theorem carries all its hypotheses in its own signature. There is no `variable` block.
- Imports are `Mathlib` plus four Tau Ceti modules, all present at the pin with object files. There is no `set_option`, no `lemma` and no sorry'd data.

**Padding probe.** I replaced the headline's `sorry` with `simp`, `rfl`, `infer_instance`, `exact Iff.rfl` and `constructor <;> intro h <;> simp_all`. All five fail. `SpinStructure` is the one definition the headline needs, and no Spin structure exists at the pins: `grep` for `SpinStructure`/`spinStructure` in Mathlib and Tau Ceti finds only Pin-lift matrices under `LinearAlgebra/Matrix/PinPlusPlane/`. Nothing is padding.

**Headline theorems.** From the README and the module docstring:
- G4.3: existence iff w₂=0.
- G4.4: the H¹ torsor.
- G4.4a: skeletal comparison and the rank-two criterion.
- G5.3: plane-bundle square roots.
- G6.1: closed-base self-adjointness.
- G6.2: Bochner formula.
- G6.3: Lichnerowicz formula and PSC vanishing.
- G6.4: D=d+d*.
- G6.0: KO index class.
- G6.6: symbol class.
- G6.7: ind D⁺=2α.

Only the rank-two criterion is stated. Every other headline is named in the docstring with the carrier it lacks. I checked those absences at the pins:
- Stiefel–Whitney classes exist only under `FieldTheory/QuadraticForm/StiefelWhitney/`.
- There is no bundle tensor product. Mathlib's `Topology/VectorBundle/` and Tau Ceti's `Topology/VectorBundle/` have none. Tau Ceti's `CoordinateFunctor` (`FiniteRank/CoordinateFunctor.lean:49`) acts on bundle cores, but the only instances at the pin are realification and complexification.
- There is no topological K-theory. `IdempotentRange.lean:23` only mentions it in prose.

**Library declarations opened at the pins (24).**
- Tau Ceti `2fd255d9`:
  - `OrthonormalFrameBundle` (`Topology/VectorBundle/OrthonormalFrame/Basic.lean:109`), whose topology is induced from pointwise evaluation (`:227`).
  - `PrincipalBundle` (`Topology/FiberBundle/Principal.lean:156`).
  - `thomPair` (`EulerClass.lean:108`), `IsThomClass` (`:245`) and `eulerClass` (`:356`).
  - `realCliffordSpinGroupZero` (`Spin/Real/Basic.lean:102`), with its compactness instance (`Spin/Compact.lean:265`).
  - `spinVectorAction` (`Spin/Action.lean:79`).
  - `fiberBundleCoreOfGroupCocycle` (`GroupCocycle.lean:90`), its principal instance (`:294`) and `homeomorphOfCohomologous` (`:198`).
  - `toOrientationCover_eq_toOrientationCover_iff` (`Orientation/OrthonormalFrame.lean:120`) and `orientationCoverHomeomorph` (`:309`).
  - `PrincipalBundle.contMDiffFiberBundle_iff` (`Geometry/Manifold/FiberBundle/Principal.lean:96`).
  - `curvatureOperator` (`Curvature/Basic.lean:89`): ∇_X∇_Yσ−∇_Y∇_Xσ−∇_[X,Y]σ, the README's sign.
  - `IsMetricCompatible.inner_curvatureTensor_eq_neg` (`Curvature/Metric.lean:111`).
  - `curvatureTensor_cyclic_eq_zero` (`Bianchi.lean:83`, assuming zero torsion) and `inner_curvatureTensor_swap_pairs` (`:102`).
  - `scalarCurvature_eq_sum_riemannCurvatureTensor` (`Riemann.lean:93`): Σ_j Σ_k Rm(b_k,b_j,b_j,b_k), as the README states.
  - `SmoothForm.codifferential` (`Riemannian/Codifferential.lean:88`): sign (−1)^(m(j+1)+1).
  - `codifferential_neg_orientation` (`:121`).
  - `integralTopForm_inner_mextDeriv_eq_inner_codifferential` (`:252`), assuming boundaryless, T2 and σ-compact, with one form compactly supported.
  - `parityTwistedRightAction` (`Regular.lean:63`).
  - `prod_map_ι_sq_scalar` (`VolumeElement/Basic.lean:267`): (−1)^(n choose 2)·ΠQ(v_i), which gives Scope's `(−1)^(n(n+1)/2)` for the negative form.
- Mathlib `1b1ccf4b`: `leviCivitaConnection` (`CovariantDerivative/LeviCivita.lean:360`) under `IsManifold I 2` (`:153`), `IsContMDiffRiemannianBundle I 1` (`:173`) and `FiniteDimensional` (`:206`), and `IsLeviCivitaConnection.uniqueness` (`:256`) on differentiable fields. This matches `README.md:160–168`.

**Backticked names.** All 351 Lean-shaped spans of the README were resolved at the pins, namespace-qualified. The ones not found there are:
- this roadmap's 2 declarations;
- the scope `Matrix.Norms.Operator`;
- the 11 GeneralizedCohomology G5.5 targets, all of which are in that README on main (for example `realMixedCliffordCStarModelEquiv` `:1910`, `realFiniteCliffordHilbertModuleStabilization` `:2040`, `realNegativeCliffordFamilyIndex` `:2099`).

**Cross-roadmap citations resolved on main 71c8f21.**
- CharacteristicClasses:
  - C1.0 (`:214–245`): oriented SO(n) subbundle, inverse-square-root metric transport, Sylvester derivative, rank-zero frame.
  - C1.6 (`:715`).
  - C3.2 (`:1106–1121`): "w_n=e(E) mod2, w₁ is the orientation-cover class".
  - C3.5 (`:1185`).
  - C7.3 (`:1851–1858`): "extend by the radial normal line to `TS^n⊕ε¹≅ε^(n+1)`".
- AlgebraicTopology §8.9 (table `:2108`).
- SpinRepresentations Layer 2 `SpinCompactTopologyFoundation` (`:520`).
- GeneralizedCohomology G5.5. Its link to G1.3 (`:42`) is pinned to commit 41b8e275, so the dropped anchor does not break it.

**Overlaps (all 7 items checked).**
- **#1780.** Its head is byte-identical to 4e5e6a06 (`roadmaps show SpinGeometry --pr 1780` against `git show`), an ancestor of HEAD. The description's merge-order block states "#1780 → this pull request".
- **`#k5-compact-hermitian-elliptic-theory-and-serre-duality`.** It is dropped by #1234, #1807, #1808 and #1854, and each maps it:
  - #1234: `:365–366` "K5 is now Layer 5", at e86d496c;
  - #1807: `:551`, which names the anchor;
  - #1808: `:567` "`K5` → Layer 5; `K5a` → 5.1–5.8";
  - #1854: table row `:529`.
- **Anchors this PR drops.** `#g1-…` and `#g4-…` are cited by SpinRepresentations (#1207 at 60e7039e, `:1099`, `:1101`, `:1574`, `:1575`) and by GeneralizedCohomology (pinned link). The former-heading table (`:519–526`) maps G1–G6 to Layers 1–6, and the G1.1 and G4.1 labels stay in the subsection headings.
- **Closest open roadmaps** (#1207, #1807, #1808, #1854, #1077).
  - SpinRepresentations (#1207 `:40–41`) states that SpinGeometry G1–G6 owns Clifford bundles, spin structures and Dirac operators.
  - The CharacteristicClasses revisions keep C1.0 and C3.5. #1808 `:520–521` and #1854 `:508–510` say the spin-lift obstruction consumes C3.5 afterwards.
  - IndexTheory (#1077 `:270–273`) and TangentialBordism (#942 `:467`) consume G1–G6.
  - `roadmaps grep` for spin-structure ownership finds no second owner. TopologicalKTheory's "GeneralizedCohomology G5.0 owns its subsequent Spin lift" is a specific application.

**Pull-request description.** Every claim I checked matches the head:
- the layout, the G4.1a/G4.1b/G4.4a headings and the former-heading table;
- the Levi-Civita, C7.3 and R1/R7 citations;
- the 12.1.41/12.1.42 locators;
- the four Tau Ceti imports.

**Source sample (15 targets).**
- Printed pages come from the running heads of `nicolaescu` (printed = PDF − 12). Kirby is read from the OCR running heads.
- Every page and statement matches, except the slips listed under Source issues, neither of which the README copies.
- Lawson–Michelsohn and Atiyah–Bott–Shapiro locators are under Not verifiable.

| Target | Locator in README | Source line (printed page) | Supports the statement? |
| --- | --- | --- | --- |
| G1.2 Polarization and the Fock metric | Prop. 12.1.19 pp. 630–631; h=g+ig(·,J·) p. 630; §2.2.4 ΛʳB p. 60; (2.2.8) p. 61; Def. 12.1.10 p. 626 | 29392–29440 (h at 29406, √2 creation/contraction at 29424–29439); 2916–2918; 2935; 29261–29265 | yes; h(Ju,v)=ih(u,v), linear in the first slot as stated |
| G1.3 Adjoints, Morita evaluation and scalar trace | Prop. 12.1.19 p. 630; Prop. 12.1.27 p. 634; Cor. 12.1.22, Rem. 12.1.23 p. 632; §12.1.2 p. 629 | 29392; 29526–29531 ("unique up to a multiplicative constant"); 29466–29472; 29358–29361 (ordered monomials) | yes |
| G2.1 Intrinsic chirality | p. 632 (Γ=i^k e₁⋯e_2k); Ex. 12.1.24 p. 632 | 29473–29479; 29486–29489 (S± ≅ Λ^(even/odd,0)) | yes |
| G2.3 Graded products and twists | Def. 2.2.42 p. 58; p. 633 (S⊗̂W, chirally graded = purely even W) | 2826–2832; 29492–29499 | yes; LM I §§1, 5 and ABS §1 not verifiable |
| G3.3 Compatible connections | Def. 12.1.64(a2) p. 653; Lemma 12.1.31 p. 636 | 30311–30313; 29637–29642 (arbitrary connection on P) | yes |
| G4.1 Frame adapters | Prop. 12.1.41 p. 640; Prop. 12.1.42 p. 641; Ex. 12.1.54 pp. 648–649 | 29793–29795; 29798–29800; 30117–30125 (e^(iθ)↦e^(2iθ)) | yes |
| G4.2 Principal spin lifts | Kirby Ch. IV p. 33; Nicolaescu §12.2.3 pp. 668–669; Ex. 12.2.30 p. 670 | `kirby` 1133–1152; 30914–30927 (cocycle lifts, smooth tangent case); 30984 | yes |
| G5.0 Real regular spinors | §12.1.2 pp. 628–629, Ex. 12.1.15, Ex. 12.1.18 | 29341–29348 (c=e_v−i_v, c(v)²=−\|v\|²); 29351–29354; 29377 | yes |
| G5.1 Complex spinor bundles | Prop. 12.1.30 p. 635; §12.2.3, Lemma 12.2.32 pp. 670–672 | 29562–29565; 31005–31058 | yes |
| G5.2 Bundle products | LM I §§1, 5; ABS §1 | — | not verifiable (uncertified) |
| G5.3 Plane-bundle square roots | Ex. 12.1.54 pp. 648–649 | 30117–30125 | yes, the squaring cover |
| G6.2 General square formula | Thm. 12.1.67 p. 656 | 30418–30424 (D²=∇*∇+c(F), c(F)=Σ_(i<j)c_ic_jF_ij) | yes; LM II.8.2 not verifiable |
| G6.3 Lichnerowicz formulas | Thm. 12.2.33 p. 673; Ex. 12.1.68 p. 657 | 31100–31101; 30468–30478 (product twist adds c_W(F(∇^W))) | yes |
| G6.6 Compact-support symbol | §12.2.3 p. 672 | 31059–31069 (D⁺'s symbol is Clifford multiplication) | yes |
| G6.7 Quaternionic kernels | §12.1.8 pp. 651–653 | 30250–30274 (Γ=−e₁e₂e₃e₄, S±₄ of SU(2)×SU(2), quaternionic) | yes |

Also checked outside the sample:
- Lemma 12.1.29 (p. 634, line 29557: Ψ(x⁰+x¹)=x⁰+e₀x¹).
- Ex. 12.1.25 / (12.1.1) (p. 633, line 29514: Γω=i^(k+p(p−1))∗ω, letters renamed in G2.2).
- Props. 12.1.65–12.1.66 (pp. 654–655).
- Prop. 12.2.1 (p. 657).
- Prop. 12.2.25 (p. 669, "for manifolds").
- Rem. 12.2.28 / Ex. 12.2.29 (p. 669, free and transitive H¹ action).
- Ex. 12.2.35 (p. 673, eight structures on T³).
- Kirby p. 34 (`kirby` 1155–1167: w₂=0 iff spin; torsor over H¹; ε¹ for n=2 and ε² for n=1 at 1131–1132).

**Adversarial table.** Every value below was recomputed this round.

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| Headline `nonempty_spinStructure_iff_exists_eulerClass_eq_two_smul` (G4.4a) | X=∅; X=pt; S² with TS² and with e=±1; ℝP² with its nontrivial oriented plane bundle; u↦−u; non-orientable E | ∅: H²=0, both sides true. pt: e=0=2·0, and P=Spin(2) maps onto the frames of one orientation. TS²: e=±2=2(±1), spin. e=1: 1∉2ℤ, w₂≠0. ℝP²: H²(ℝP²;ℤ)=ℤ/2, 2H²=0, ρ:ℤ/2→ℤ/2 injective, so w₂≠0; both sides false. −u gives −e, divisibility unchanged. Non-orientable: no Thom class, so `hu` cannot hold. A `SpinStructure` forces orientability, because local sections of P give continuous local frames | holds; none |
| `SpinStructure` (G4.2) | n=1 over S¹; n=2 over a point; constant frame map; a frame map without `toFrame_smul` | n=1: ±1 acts trivially on ℝ¹, so both points of P_x map to one frame; P is a double cover. n=2 over a point: 2 classes, one per orientation (R01). A constant frame map needs b₀=b₀∘ρ(g) for every g, false for z(π/4) (a quarter turn). Without equivariance a trivial P over a non-spin bundle would map to one frame per point | determines its object; R01 |
| G4.4 torsor | pt and S¹, free versus fixed orientation | free: 2 and 4 classes, against \|H¹\|=1 and 2; fixed: 1 and 2 | needs the orientation fixed (R01) |
| G1.1 Pauli dictionary | X, Y, Z; Hadamard H | XY=[[i,0],[0,−i]]=iZ, YZ=[[0,i],[i,0]]=iX, ZX=[[0,1],[−1,0]]=iY; XZ=[[0,−1],[1,0]]=−iY with square −Id; coordinate determinant ±4 (blocks −2 and 2); XYZ=iId, ZYX=−iId; HXH=Z, HYH=−Y | holds |
| G1.1 bivector sign | z=cosθ+sinθ e₁e₂ | positive form: ze₁z⁻¹=cos2θe₁−sin2θe₂; negative form: cos2θe₁+sin2θe₂ | holds |
| G1.2 Fock metric | ℝ²=ℂ, w=e₁^(1,0)=(e₁−ie₂)/2 | g_ℂ(w̄,w)=(1+1)/4=1/2; c(e₁)1=√2w; c(e₁)²1=−2·½=−1; ⟨c(e₁)1,w⟩=√2/2=1/√2; native action ⟨w,w⟩=½≠1 | holds |
| G1.2 Gram determinant | orthonormal w₁, w₂ | det=1; antisymmetrized tensor squared norm 2, its half ½ | holds |
| G1.3 trace and evaluation | Cl(0,1); Q=0; negative plane a=1+e₁+2e₂; S=ℂ²⊕ℂ² | L_a=[[x,−y],[y,x]], trace 2x=2τ(a); Q=0: [[x,0],[y,x]], trace 2x; τ(a*a)=1+1+4=6; τ(star(e)e)=−e²=−1 for positive e; Hom_Cl(S,ℂ²)=ℂ², S⊗Hom of dimension 8≠2 | holds |
| G1.4 odd labels | n=1; n=3 with (iZ,iY,iX) | n=1: (ie₁)²=1; n=3: c₁c₂c₃=i³ZYX=(−i)(−i)=−Id, ω_ℂ=i²ω=+Id; Γ_(u₁,Ju₁)=i(iZ)(iY)=−X, c(u)=iX=(−i)(−X); ψ(e₁e₂e₃)=e₀e₁e₂e₃=−e₁e₂e₃e₀; plane (e₁,e₀): ψ(ie₁)=−ie₁e₀=−Γ | holds |
| G2.1 chirality | negative plane; rotated frame; Fock vacuum | Γ=i·iX=−X, S⁺=ℂ(1,−1), iZ(1,−1)=i(1,1); cross term cs(c₂²−c₁²)=0; c(e₂)=i√2(ε(w)+ι(w̄)), c(e₂)c(e₁)1=2i·½=i, Γ1=i(−i)=1 | holds |
| G2.2 star formula | plane, k=0,1,2 | Γ1=ie₁∧e₂=i∗1; Γe₁=ie₂=i∗e₁; Γ(e₁∧e₂)=−i=i³∗(e₁∧e₂); Γe₂=−ie₁; Γ(1+ie₁∧e₂)=1+ie₁∧e₂ | holds |
| G2.3 graded product | two planes; Koszul swap; negative point | cross anticommutator (cΓ+Γc)⊗c=0; Γ_(V⊕W)=−c c⊗c c=Γ_V⊗Γ_W; the signed swap gives (−1)^(\|s\|\|t\|)c_Wt⊗s on both sides, the unsigned one fails on odd s; Γ=−1 gives c(0,w)=−c_W(w) | holds |
| G3.1 descent | a=1+ω in Cl(ℝ³,−g); SO(2); G=ℝ | ω²=(−1)^6=1, a²=2a, \|a²\|=2√2=√2·2; μ(R_θ) acts by 1 on S⁺ and e^(iθ) on S⁻; both sides at e₁ equal [[0,−e^(−2it)],[e^(2it),0]] | holds |
| G3.3 curvature | unit S²; A=iY dx¹ | R^S(e₁,e₂)=¼(−c₁c₂+c₂c₁)=−½c₁c₂; [R^S,c₁]=−½(2c₂)=−c₂=c(R(e₁,e₂)e₁); [iY,iZ]=−2iX≠0 | holds |
| G3.4 frames | unit S² | ∇_(e₂)e²=−cotθ e¹, de²=cotθ e¹∧e²=d(sinθ dφ), d*e²=0 | holds |
| G4.1 signs | positive plane; φ∈(−π,π) | [e₁e₂,e₁]=−2e₂, [e₁e₂,e₂]=2e₁; R_φ is reached by ±(cos(φ/2)−sin(φ/2)e₁e₂) | holds |
| G4.2 metric change | B=diag(4,1) | g′(e₁/2,e₁/2)=g(2e₁,e₁/2)=1; B⁻¹ gives g′-norm ½; Sylvester eigenvalues √b_i+√b_j>0 | holds |
| G5.0 actions | n=1; n=2 | C₊(e)e=−e²=1; c₋(e)e=−1; anticommutator on 1 is −1+1=0; z·e₁=cosθe₁+sinθe₂; C₊(e₁)C₊(e₂)1=−e₂e₁=e₁e₂ | holds |
| G5.1 ranks and degrees | S² | S⁻=E^(1/2) of degree 1, S⁺ of degree −1 (K^(±1/2) with K=T*S²) | holds |
| G5.2 products | two planes; signed points | chiral ranks (1,1)·(1,1)→(2,2), virtual rank 0; negative point (0,1) negates the class | holds |
| G5.3 roots | ρ(z); ℝP³; S² with e=1 | ρ(z)=cosθ−i sinθ Γ gives e^(∓iθ) on S^±; (S⁻)² has weight z²=E; c₁(γ_ℂ)=β(a)≠0 in H²(ℝP³;ℤ)=ℤ/2; 2c=1 has no solution | holds |
| G6.0 module norm | T³, s=1+ω; S² | ω*=−reverse(ω)=ω, ⟨s,s⟩_A=2+2ω, C*-norm 4 against scalar part 2; c₁c₂(−L_(e₁e₂)/2)=½=Scal/4 | holds |
| G6.1 operator | (iZ,iY); circle c=i; ℝ | D²=−∂₁²−∂₂² (cross term −(ZY+YZ)=0); De^(ikθ)=−ke^(ikθ); σ_F(1)=i·i=−1 | holds |
| G6.2 contraction | ordered pairs | c₂c₁R(e₂,e₁)=c₁c₂B, so the sum over all ordered pairs needs ½ | holds |
| G6.3 Lichnerowicz | unit S², S³ | ½=2/4; round S³ Scal=6, D²≥3/2 | holds |
| G6.4 de Rham | flat circle | c(dx)(f,h dx)=(−h,f dx), D(f,h dx)=(−h′,f′dx), kernel dimensions (1,1) | holds |
| G6.6 symbol | flat plane; point | iY(1,−1)=−(1,1), so c(v)(1,−1)=i(v₁+iv₂)(1,1), winding +1; K_c(pt) class 1, and −1 for σ=−1 | holds |
| G6.7 parity and volume | J on ℂ; Cl(0,4) | J²z=\|a\|²z≠−z; ω₋²=(−1)^6(−1)^4=1; C₊ chain e₄→e₃e₄→e₂e₃e₄→e₁e₂e₃e₄=ω₋; K3: ind=2=2·1 | holds |

## Not verifiable

- Lawson–Michelsohn (Thm. II.1.7, II.8.2, II.8.8; Ch. I §§1, 5) and Atiyah–Bott–Shapiro (§§1, 6, 11) are settled in the manifest as `uncertified`. They are cited by locator only, and I did not open them. These are the G2.3, G4.3, G4.4, G5.2, G6.0, G6.2 and G6.3 locators into them.
- The Kirby text is an OCR of an image-only scan. Pages 33–34 are legible (`kirby` 1114–1167). Lines 1141 and 1156 are garbled, and I did not rely on them.
- I did not re-resolve the Atiyah–Bott–Shapiro DOI this round.

## Source issues

- **Error** in nicolaescu at Example 12.2.31(d), p. 670: the source says w₂(ℝPⁿ)=0 exactly when n≡3 mod 4. It should say that ℝPⁿ (n≥2) is spin exactly when n≡3 mod 4; w₂(ℝPⁿ)=C(n+1,2)a² also vanishes for n≡0 mod 4 (for example ℝP⁴). Affects nothing.
- **Misprint** in nicolaescu at Example 12.1.54, p. 649: the source names the squaring map's domain Spin(1); it should be Spin(2), the example being the case n=2. Affects nothing.
