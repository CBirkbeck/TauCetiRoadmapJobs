# Review of SpinGeometry (pull request #1674 at 2de5c72)

**Verdict:** needs changes

This is a full AI re-review of `TauCetiRoadmap/SpinGeometry/` at 2de5c72. The AI does not approve or merge.

- Both findings of the previous review are repaired.
- The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with `sorry` as its only warning.
- The rank-two headline is mathematically sound in every instance tried.
- Two P3 findings remain; neither is blocking. Both concern what the README cites, not what it states.

## R01 (P3) — Layers 3–4 and the supplier contracts credit roadmaps for orientations, oriented frames, principal-bundle pullback and gluing, the smooth Hodge star and the codifferential, all of which the pinned Tau Ceti already has

**Location.**
- `README.md:268–269`: "T6.4 owns the continuous numerable principal/associated-bundle category; CharacteristicClasses C1 owns its continuous orthonormal/oriented frames".
- `README.md:976–978`: "T6.4's numerable principal-bundle category for pullback and descent and CharacteristicClasses C1.0's positively oriented SO(n) subbundle".
- `README.md:1109`: "classify C1.0's determinant-cover orientations".
- `README.md:1091`: *Needs:* "principal central-bundle descent".
- `README.md:252–256`: K5 "supplies the smooth transport of the pinned pointwise Gram metric and Hodge stars … to exterior-form bundles, formal adjoints".

**Claim.** These objects come from TopologicalKTheory T6.4, CharacteristicClasses C1/C1.0 and ComplexKahlerGeometry K5.

**What is wrong.** The README contradicts itself. Lines 207–213 take `TauCeti.OrthonormalFrameBundle` from Tau Ceti, while lines 268–269 say C1 owns the orthonormal frames. Each object cited to a roadmap above is a declaration of the pinned Tau Ceti `2fd255d9`:
- principal-bundle pullback: `TauCeti.PrincipalBundle.pullback`;
- principal bundles glued from a cocycle: `TauCeti.fiberBundleCoreOfGroupCocycle` with `TauCeti.principalBundle_fiberBundleCoreOfGroupCocycle` and `TauCeti.homeomorphOfCohomologous`;
- orientations and the determinant cover: `TauCeti.VectorBundleOrientation` and `TauCeti.VectorBundleOrientationCover`;
- the orientation of a frame: `TauCeti.OrthonormalFrameBundle.toOrientationCover` with `orientedRel` and `orientationCoverHomeomorph`;
- the smooth real Hodge star `TauCeti.SmoothForm.hodgeStar`;
- the codifferential `TauCeti.SmoothForm.codifferential`, with its formal adjointness to d.

**Witness.** In Tau Ceti `2fd255d9`: `Topology/FiberBundle/Principal.lean:423`, `GroupCocycle.lean:90/:198/:294`, `Topology/VectorBundle/Orientation/Basic.lean:192`, `Cover.lean:84`, `OrthonormalFrame.lean:80/:138/:309`, `Geometry/Manifold/Riemannian/HodgeStar.lean:296`, `Codifferential.lean:88/:252`.

**Repair.**
1. In "From Tau Ceti", extend the G4.2/G4.4a bullet with these files and declarations:
   - `Topology/FiberBundle/Principal.lean` (`TauCeti.PrincipalBundle.pullback`);
   - `Topology/FiberBundle/GroupCocycle.lean` (the cocycle gluing, its principal instance, `homeomorphOfCohomologous`);
   - `Topology/VectorBundle/Orientation/Basic.lean`, `Cover.lean` and `OrthonormalFrame.lean` (`VectorBundleOrientation`, `VectorBundleOrientationCover`, `VectorBundleOrientation.nonempty_iff_exists_section`, `toOrientationCover`, `orientedRel`, `orientationCoverHomeomorph`).
2. Add a G3.4/G6.4 bullet for `Geometry/Manifold/Riemannian/HodgeStar.lean` and `Codifferential.lean` (`SmoothForm.hodgeStar`, `SmoothForm.codifferential`, `SmoothForm.integralTopForm_inner_mextDeriv_eq_inner_codifferential`).
3. Rewrite `:266–269` and `:976–978` to cite T6.4 only for numerability and the numerable category. Cite C1/C1.0 only for what they add beyond the pin, such as the w₁ classification and the rank-zero frame conventions. Delete "C1 owns its continuous orthonormal/oriented frames".
4. Point `:1109` at sections of `VectorBundleOrientationCover`, and `:1091` at the pinned cocycle gluing.
5. Restrict `:252–256` to complex forms and the analytic theory.

**Tested.** On the trivial plane bundle over S¹ with orientation o, `toOrientationCover_eq_toOrientationCover_iff` makes the frames carried to o an SO(2)-torsor in each fibre. This is C1.0's positive subbundle, defined from the pin. On ℝ, `SmoothForm.codifferential` of h dx has sign (−1)^(1·2+1) = −1, so it gives −h′, matching G3.4's Check.

## R02 (P3) — G1.2's locator does not contain the Gram-determinant target or the *-representation bullet it is cited for

**Location.** `README.md:401–409`: "Prove that H is the exterior Gram metric of `h_ℂ|_W` … The normalized Fock action is a *-representation for the Gram metric … (Nicolaescu, Proposition 12.1.19, pp. 630–631.)"

**Claim.** Proposition 12.1.19 supports the kept target.

**Witness.**
- The proposition (nicolaescu lines 29392–29456, pp. 630–631) constructs the Fock action and an orthonormal basis of V^{1,0}. It defines no metric on Λ•V^{1,0} and has no Gram determinant.
- The determinant pairing on Λʳ is (2.2.8) in §2.2.4 (nicolaescu lines 2912–2935, pp. 60–61).
- The compatible metric, unique up to scale, is Proposition 12.1.27 (line 29526, p. 634).

**Repair.** Replace the parenthesis with: "(Nicolaescu, Proposition 12.1.19, pp. 630–631, for the Fock action; §2.2.4, the pairing ΛʳB and (2.2.8), pp. 60–61, for the Gram determinant; Proposition 12.1.27, p. 634, for the compatible Hermitian metric and its uniqueness up to a positive scalar.)"

**Tested.** For h_ℂ-orthonormal w₁, w₂, (2.2.8) gives det[[1,0],[0,1]] = 1, which equals H(w₁∧w₂, w₁∧w₂). Pages 630–631 contain no such computation.

## Previous findings (PRREVIEW-SpinGeometry~22)

- **R01 (P2, rank-two criterion not stated): repaired.**
  - `Suggested.lean:78–105` defines `SpinStructure`, and `:116–127` states `nonempty_spinStructure_iff_exists_eulerClass_eq_two_smul` with the requested signature. It adds `[NeZero n]`, which the README justifies at `:1001–1003`.
  - The README names both declarations (`:989`, `:1151`).
  - The summary (`:7–11`) and the module docstring (`:13–15`) now say that the criterion is stated.
  - The docstring bullets `:28–34` name w₂, the ℤ/2 twist and the skeletal quotient.
  - The description's list of non-statable headlines is corrected.
- **R02 (P3, K5 cited for the pinned Hodge star and Gram metric): repaired.**
  - The pointwise package is cited at `:131–138` and `:196–206`.
  - The definitional half of G2.2's target is deleted (`:662–664`). The remaining half is stated on `ExteriorAlgebra.baseChangeEquiv` and `sesqComplexification` (`:664–670`).
  - K5 is narrowed at `:35–36`, `:576–578`, `:683` and `:757–759`.
  - The same pattern recurs one level up, for the smooth real Hodge star and the codifferential. That is part of R01 above, not a residue of the requested repair.

The last repair report marks nothing "not actionable", so nothing is re-raised.

## Verified sound

**Head, scope and gate.**
- `git rev-parse HEAD` = 2de5c725; the worktree is clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty.
- The pins are Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`.
- My gate run: `gate SpinGeometry: set_option=0 … imports=0 … statement-hygiene=0 … depcheck=0 metadata=0 stray-files=0 … source-material=0 OK`. The worker's run adds `build=0`.
- `lake env lean TauCetiRoadmap/SpinGeometry/Suggested.lean`: exit 0. The only output is `116:8: warning: declaration uses 'sorry'`.
- The `module`/`public import` header is the form of 56 `Suggested.lean` files on main, and the gate accepts it.

**Dependency check** (the required command):

```text
depcheck: 233 roadmaps, 2263 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. SpinGeometry is on main, and every supplier it names is on main at 2485dfb: SmoothBundlesConnections, Completed/HopfRinow, RiemannianGeometry, DifferentialGeometry, ComplexKahlerGeometry, CharacteristicClasses, AlgebraicTopology, TopologicalKTheory, GeneralizedCohomology, PseudodifferentialOperators, RepresentationTheory/SpinRepresentations and Completed/OrthogonalSpinGroups. The order G4.1a → CharacteristicClasses C3.5 → G4.3 is item-level, is already on main in both READMEs (main SpinGeometry line 423, CharacteristicClasses line 1223), and the check reports no cycle.

**Cross-roadmap citations resolved on main:**
- CharacteristicClasses C1.0 (line 214), C3.2 (line 1115: w_n = e mod 2, the rank-two route), C3.5 (lines 1185–1229) and C7.3 (item 3 of C7: radial normal line, `TS^n⊕ε¹≅ε^(n+1)`);
- AlgebraicTopology 8.9 (line 2108);
- TopologicalKTheory T6.4 (lines 67–73) and the T7 anchor (line 1517);
- SpinRepresentations `SpinCompactTopologyFoundation` (line 520);
- GeneralizedCohomology's G5 anchor (line 1373) and all eleven `realFiniteClifford…`/`realMixedClifford…`/`realNegativeCliffordFamilyIndex`/`realHilbertClosedFunctionalCalculus` names;
- PseudodifferentialOperators' four anchors (`### P1.0.` line 164; Layers 4–6, lines 782, 927, 1484).

**Library declarations at the pins.**
- A scan of every backticked Lean-like name in the README (206 tokens) against Tau Ceti and Mathlib found all of them. The one exception is `Matrix.Norms.Operator`, which is a scope (`Mathlib/Analysis/Matrix/Normed.lean:497`).
- A Lean `#check @` file confirmed the namespaced names new in this round: `CliffordAlgebra.realCliffordSpinGroupZero`, `CliffordAlgebra.spinVectorAction`, `TauCeti.PrincipalBundle`, `TauCeti.OrthonormalFrameBundle`, `TauCeti.thomPair`, `TauCeti.IsThomClass`, `TauCeti.eulerClass`, `exteriorPower.inner_ιMulti_ιMulti`, `OrthonormalBasis.exteriorPower`, `exteriorPower.hodgeStar`, `ExteriorAlgebra.baseChangeEquiv`, `Topology.CWComplex`, `IsContinuousRiemannianBundle`.
- Statements opened:
  - `PrincipalBundle`: every atlas trivialization is equivariant, which makes the fibres torsors (`Principal.lean:156`, `smul_eq_smul_iff`, `isPretransitive`);
  - `OrthonormalFrameBundle`: pairs of a base point and `V ≃ₗᵢ E b`, with the induced pointwise topology (`Basic.lean:109`, `:227`);
  - `spinVectorAction`: `x·m·star x` (`Spin/Action.lean:79/:95`);
  - `realCliffordSpinGroupZero n = spinGroup (realCliffordForm n 0)`, with weights +1 (`Spin/Real/Basic.lean:102`, `RealForm/Basic.lean:113`);
  - `IsThomClass`: `FiniteDimensional ℝ F` and the ℤ-span of every fibre restriction is ⊤ (`EulerClass.lean:245`);
  - `eulerClass`: restriction to H(E) followed by the zero-section pullback (`:356`);
  - `IsContinuousRiemannianBundle` (Mathlib `Riemannian.lean:60`) and `CWComplex` with `closed'` (Mathlib `Classical/Basic.lean:135`);
  - `CliffordAlgebra.equivBaseChange` maps `Cl(Q.baseChange A) ≃ A⊗Cl(Q)` (Mathlib `BaseChange.lean:182`), so the Conventions' `.symm` is right.
- Not at the pin, so they stay targets:
  - G1.2's Gram formula: no determinant in `Fock/` or `ExteriorAlgebra/HermitianMetric.lean`;
  - G2.2's wedge-form comparison: no Tau Ceti file uses `ExteriorAlgebra.baseChangeEquiv`.

**`Suggested.lean` signatures, probes and headlines.**
- `#check @` and `#print` of both declarations match the README:
  - a Hausdorff CW base, `F` of finrank 2, a continuous fibre metric and a Thom class u;
  - the structure's ten fields, with `toFrame_smul` elaborating to `frame(p·g)(v) = frame(p)(spinVectorAction g v)`.
  - No binder is lost, and nothing changed.
- One-tactic probe: `simp` on the theorem reports "made no progress", so it is not padding. `SpinStructure` is the one definition the headline needs.
- Generality probe: the same theorem with `F : Type*` also elaborates. Only X and E need `Type`, which the docstring explains; the model fibre's universe is immaterial, so I request no change.
- Docstring claims checked at the pins:
  - The only Stiefel–Whitney files are `FieldTheory/QuadraticForm/StiefelWhitney/`.
  - There is no `TensorProduct` in Mathlib's or Tau Ceti's `Topology/VectorBundle/`.
  - There is no general associated-bundle construction (only the frame-specific `associatedHomeomorph`).
  - There are no spinor bundles, Clifford bundles, Dirac operators or KO. `Riemannian/Lichnerowicz.lean` is the scalar eigenvalue estimate, not the spin formula.
- Headline list:
  - G4.4a rank-two criterion: stated.
  - Not statable at the pins (the docstring names the missing carrier for each): G4.3 w₂ obstruction; G4.4 torsor; G4.4a skeletal comparison; G5.3 square roots; G6.1 closed domains; G6.2–G6.3 Lichnerowicz; G6.4 de Rham operator (d* is pinned but the Clifford-connection operator on forms is not); G6.0 KO index; G6.7 quaternionic kernels.

**Overlaps (each lead checked).**
- ComplexKahlerGeometry `#k5-…` (`README.md:284`) is dropped by four open revisions. Each maps it:
  - #1234 at line 366 ("K5 is now Layer 5");
  - #1807 line 551 and #1854 line 529, both naming the anchor itself;
  - #1808 line 567 (`K5` → Layer 5).
- #1807 and #1808 keep the CharacteristicClasses labels C1.0, C3.2, C3.5 and C7.3 (#1807 line 36).
- #1780 changes this folder and conflicts in both files. The description's merge-order block puts this pull request first. #1780's `Suggested.lean` declares no `SpinStructure`.
- This pull request drops the anchors `#g1-…` and `#g4-…`:
  - SpinRepresentations #1207 cites them at lines 1100–1102 and 1575–1576 through the kept ids G1.1 and G4.1, and the former-heading table (`README.md:302–309`) maps them.
  - GeneralizedCohomology on main (line 42) uses a commit permalink.
- Ownership by object: TangentialBordism, FourManifolds, StringOrientation, HomotopySpheres, IndexTheory and CharacteristicClasses consume "SpinGeometry G4". CharacteristicClasses C3.5 owns only the universal w₂ cocycle. Only this pull request's `Suggested.lean` declares `SpinStructure`, so this roadmap owns the bundle-level Spin structure and the rank-two criterion.

**Adversarial table.** It covers the headline and its definition, the 15 sampled targets and the targets the findings touch.

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| Rank-two criterion (headline, G4.4a) | X=∅; X=pt; S² with TS² (e=2), the Hopf plane bundle (e=1) and both reversed; ℝP³ with γ⊕γ and with ε²; ℂP^∞ with L and L⊗L; T² with ε² | ∅: H²=0 and the empty family is a structure, so both sides hold. pt: H²=0 and `PrincipalBundle.trivial` gives a structure. S²: 2=2·1 and w₂=0, so both hold; 1∉2ℤ and w₂=1, so both fail; −2=2·(−1) holds, −1 fails. ℝP³: e=β(a)≠0 with 2H²=0, so the right side fails, and w₂=a²≠0, so the left fails; ε² gives e=0 and two structures. ℂP^∞: x is not divisible and w₂≠0; 2x is divisible, with root L. T²: e=0, four structures | true in both directions in every case; no change |
| `SpinStructure` (G4.2), defining laws | trivial plane bundle with P=X×Spin(2) and frame b₀∘ρ(g); wrong models: constant frame map, inverse convention, P=Fr⁺ acted on through ρ | Satisfies: continuous, over the identity, and frame(p·h)=b₀ρ(g)ρ(h). Constant map: needs b₀=b₀ρ(h) for all h, false for h=e^{iπ/4}. Inverse convention gives b₀ρ(h)⁻¹ρ(g)⁻¹≠b₀ρ(g)⁻¹ρ(h) for ρ(h)²≠1. Fr⁺ through ρ: −1 acts trivially, contradicting `smul_eq_self_iff` | definition fixes its object; no change |
| G4.2 metric change and Checks (sampled) | g′=4g; trivial line over S¹ | B=4Id and B^(−1/2)=Id/2, so g′(e/2,e/2)=1 versus g′(2e,2e)=16; Spin(1)={±1}, giving the trivial and the Möbius double cover, two lifts with w₂=0 | holds |
| G4.3 obstruction (headline, not statable) | Hopf bundle on S²; trivial bundle | w₂=1 gives no lift; with transition lifts 1 the triple discrepancy is 1, which is 0 additively | holds; not statable (no vector-bundle w₂) |
| G4.4 torsor (sampled) | S¹, T², S² | lifts: 2=|H¹(S¹;ℤ/2)|, 4, 1; twisting twice by ε gives ε²=1 | holds; matches Remark 12.2.28 |
| G4.4a skeletal and low rank (sampled) | trivial rank-3 bundle on S¹; TS² | π₁SO(3)=ℤ/2 gives 2 classes = 2 lifts; TS²⊕ε¹=ε³ gives skeletal data while e(TS²)=2≠0 blocks an unstabilized 2-frame; stabilization ε^(3−n) gives ε¹ (n=2) and ε² (n=1), as in Kirby p.33 | holds |
| G4.1 (sampled) | Spin(2)→SO(2) | z=i↦−1 and z=−1↦1, so the kernel is {±1}; d(2θ)/dθ=2 | holds |
| G1.2 Fock action and Gram target (sampled; R02) | unit J-plane; basis (1,w) with w=√2e₁^{1,0} | g_ℂ(v¹⁰,v⁰¹)=¼(1+1)=½ and h_ℂ(v¹⁰,w¹⁰)=(g(v,w)−ig(v,Jw))/2; c(e₁): 1↦w, w↦−√2·√2·½=−1; c(e₂): 1↦iw, w↦i; T∘native=Fock∘T since 2^((p+1)/2)2^(−p/2)=√2 and 2^((p−1)/2)(−2)2^(−p/2)=−√2; Gram det of w₁∧w₂ is 1 | holds; locator gap R02 |
| G1.3 traces (sampled) | negative line a+be; a=1+e₁+2e₂; null e | L_{a+be}=[[a,−b],[b,a]], so ½·2a=a and τ(a*a)=a²+b²; τ=1+1+4=6 against the unnormalized 4; reverse(e)e=0 | holds |
| G2.2 (12.1.1) (sampled) | plane, p=0,1,2 | directly Γ1=ie₁₂, Γe₁=ie₂, Γe₁₂=−i; formula i^(1+p(p−1))⋆ gives i, i and i³=−i | holds |
| G2.2 checks | plane S* | induced dual parity diag(1,−1) against reverse-dual chirality (−1)¹Γᵀ=diag(−1,1); Hilbert–Schmidt tr Id=2, normalized 2^(−1)·2=1 | holds |
| G3.1 (sampled) | G=ℝ, ρ(t)=rotation by 2t, μ=diag(e^(−it),e^(it)) | c(ρ(t)e₁) and μc(e₁)μ⁻¹ both equal [[0,−e^(−2it)],[e^(2it),0]] | holds; source assumes no compactness |
| G3.3 (sampled) | B=diag(i,−i), c(e₁)=[[0,−1],[1,0]] | Bc=[[0,−i],[−i,0]] and cB=[[0,i],[i,0]], so [B,c]=[[0,−2i],[−2i,0]]≠0 | holds |
| G3.4 (sampled; R01) | ℝ, f=x², h=0 | c(dx)(f,h)=(−h,f) and D(f,h)=(−h′,f′); D²(x²,0)=(−2,0); pinned d* sign (−1)^(1·2+1)=−1 gives d*(h dx)=−h′ | holds |
| G5.0 (sampled) | Cl(0,1), basis (1,e) | C₊(e)=[[0,1],[1,0]] and c₋=[[0,−1],[1,0]]; C₊c₋=diag(1,−1) and c₋C₊=diag(−1,1), sum 0; R_e squares to −Id | holds |
| G5.3 (sampled) | z=cosθ+sinθe₁e₂, e_i²=−1; θ=π/2; ℝP³ | ze₁z⁻¹=cos2θe₁+sin2θe₂; on S± c(z)=cosθ∓i sinθ, i.e. z^(∓1); at θ=π/2 E gets −1 and S± get −i and i; H²(ℝP³;ℤ)=ℤ/2 and c₁(γ_ℂ)=β(a)≠0 | holds |
| G6.3 Lichnerowicz (headline, not statable) | unit S² | Nicolaescu p.672: ¼Σ_{i,j}R_ijij=¼·2=½=Scal/4 | holds; not statable (no spinor bundle) |
| G6.4 (sampled) | flat circle; point; plane | harmonic dimensions (1,1) and (1,0); Γ1=ie₁₂ while parity fixes 1, and Γe₁=ie₂ while parity gives −e₁ | holds |
| G6.6 (sampled) | ξ=(3,4); t∈[0,1] | c(ξ)²=−25, inverse −c(ξ)/25; |e^(iπt/2)|=1 with endpoints c(ξ) and ic(ξ) | holds |
| G6.7 (headline, sampled, not statable) | J(z,w)=(−w̄,z̄); a line; T⁴; rank 4 | J²=(−z,−w); |a|²=−1 has no solution; kernels 2 and 2 give 0=2(1−1); Γ=i²e₁e₂e₃e₄=−ω₋, as at nicolaescu line 30267 | holds; not statable |
| Conventions: curvature and Clifford signs | unit S²; unit e | R(e₁,e₂)e₂=K(⟨e₂,e₂⟩e₁−⟨e₁,e₂⟩e₂)=e₁ and R(e₁,e₂)e₁=−e₂; c(e)²=−1=Q(e) | holds |

**Sources: the seeded sample.** Nicolaescu's printed page is the PDF page − 12, checked at nicolaescu line 29491 (PDF 645 = p. 633) and line 30322 (PDF 666 = p. 654). Kirby's printed pages 33–34 are PDF pages 41–42.

| Target | Cited locator | Where it is | Supports the statement |
| --- | --- | --- | --- |
| G1.2 | Prop. 12.1.19, pp. 630–631 | nicolaescu lines 29392–29456 | the Fock action only; R02 |
| G1.3 | Cor. 12.1.22, Rem. 12.1.23 p.632; Prop. 12.1.27 p.634 | lines 29466–29472, 29526–29541 | yes: E=S⊗W, W=Hom_Cl(S,E), compatible metric unique up to a constant |
| G2.2 | Ex. 12.1.25, (12.1.1), p.633 | lines 29500–29514 | yes: twisting space S*, degree grading = super product, Γ formula |
| G3.1 | §12.1.5, Ex. 12.1.33, pp. 636–637 | lines 29599–29662 | yes: Lie group, orthogonal ρ, invariant c ∈ V*⊗E*⊗E, no compactness |
| G3.3 | Lemma 12.1.31 p.636; Def. 12.1.64(a2) p.653 | lines 29637–29643, 30304–30314 | yes, including the Levi-Civita footnote |
| G3.4, G6.4 | Prop. 12.2.1 p.657; Ex. 12.1.25 p.633 | lines 30497–30530 | yes: Levi-Civita on forms is a Dirac structure with operator d+d*; the chiral grading comes from (12.1.1) |
| G4.1 | Prop. 12.1.42 pp. 640–641; Ex. 12.1.54 pp. 648–649 | lines 29793–29812, 30117–30125 | yes: covering, connected for n≥2, Spin(2) squaring (source misprint below) |
| G4.2 | §12.2.3 pp. 668–669; Kirby IV p.33 | lines 30914–30951; kirby lines 1133–1152 | yes: smooth cocycle lifts; principal covering description over CW complexes |
| G4.4 | Rem. 12.2.28, Ex. 12.2.29, p.669 | lines 30957–30981 | yes: free and transitive H¹(M;ℤ/2) action |
| G4.4a | Kirby IV pp. 33–34 | kirby lines 1115–1170 | yes: skeletal definition for n≥3, ε¹ for n=2 and ε² for n=1, w₂=0 iff spin, H¹ classification |
| G5.0 | §12.1.2 pp. 628–629, Ex. 12.1.15, Ex. 12.1.18 | lines 29316–29377 | yes: ordered monomials, c(x†)=c(x)*, symbol map |
| G5.3 | Ex. 12.1.54 pp. 648–649 | lines 30117–30125 | yes for the squaring cover |
| G6.6 | §12.2.3 p.672 | lines 31059–31069 | yes: the chiral block's symbol is Clifford multiplication |
| G6.7 | §12.1.8 pp. 651–653 | lines 30201–30289 | yes: Cl₄≅M₂(ℍ), Spin(4)=SU(2)², Γ=−e₁e₂e₃e₄, quaternionic S±₄ |

The README flags no locator as unverified.

## Not verifiable

- Lawson–Michelsohn, Chapters I–II, and Atiyah–Bott–Shapiro, §§6 and 11, are settled as `uncertified` (paywalled). They are cited by locator only and were not opened.
- Kirby's OCR is unreadable at kirby line 1141 and partly garbled at lines 1155–1156 (the w₁ sentence on p. 34). Lines 1133–1140 and 1157–1170 carry every statement the roadmap cites.

## Source issues

- **Misprint** in nicolaescu at Example 12.1.54, p. 649: the source writes the squaring map e^{iθ}↦e^{2iθ} as a map out of Spin(1); it should be the map Spin(2)→SO(2); affects nothing.
- **Misprint** in nicolaescu at Exercise 12.1.61, p. 652: the source refers to §10.1.3 for the Fock isomorphism, but §10.1.3 is on formal adjoints; it should refer to §12.1.3 (proof of Proposition 12.1.19, pp. 630–631); affects nothing.
- **Misprint** in nicolaescu at the proof of Theorem 12.2.33, p. 672: when the curvature term is split into two sums, the source omits the coefficient of the distinct-index sum; it should carry −1/8, like the original sum; affects nothing (that sum vanishes by Bianchi).
