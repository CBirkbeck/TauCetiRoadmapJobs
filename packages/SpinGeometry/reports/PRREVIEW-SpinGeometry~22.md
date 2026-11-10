# Review of SpinGeometry (pull request #1674 at 8fa7f9b)

**Verdict:** needs changes

:robot: This is a full AI re-review of `TauCetiRoadmap/SpinGeometry/` at 8fa7f9b. The previous review read 02d46b3, and the folder has since changed by 846 lines. That review's single finding is repaired (see "Previous findings" below). The gate passes and the dependency check reports no problem. Two new findings remain. The first: the rank-two Spin criterion of G4.4a can be stated at the pins, but `Suggested.lean` does not state it. The second: Layer 2 cites ComplexKahlerGeometry K5 for a pointwise Hodge star and Gram metric that are already native at the pins, and one of its kept targets is true by definition. The AI does not approve or merge.

## R01 (P2) — The rank-two Spin criterion of G4.4a can be stated at the pins, but `Suggested.lean` states nothing

**Location.** `Suggested.lean:9` "At the pins it states none."; `Suggested.lean:22–23` "Spin obstruction/classification … need the principal Spin lift"; `README.md:7` "No headline theorem is statable against the pinned APIs"; G4.4a `README.md:1070–1072` "Prove Spin existence iff e(V) belongs to 2H²(X;Z)".

**Claim.** The geometric headlines lack carriers at the pins. In particular, the docstring says the principal Spin lift is missing.

**Witness.** Tau Ceti `2fd255d9` has every carrier the criterion needs: `TauCeti.PrincipalBundle` (`Topology/FiberBundle/Principal.lean:156`), `TauCeti.OrthonormalFrameBundle` (`Topology/VectorBundle/OrthonormalFrame/Basic.lean:109`), `spinVectorAction`, and `TauCeti.eulerClass`/`IsThomClass` (`Topology/VectorBundle/EulerClass.lean:356`, `:245`). The statement below elaborates.

**Repair.**
1. Add the following to `Suggested.lean` under `/-! ## Layer 4: Spin lifts, obstruction and classification -/`. It imports `TauCeti.Topology.FiberBundle.Principal`, `TauCeti.Topology.VectorBundle.OrthonormalFrame.Basic`, `TauCeti.Topology.VectorBundle.EulerClass` and `TauCeti.Topology.Algebra.CliffordAlgebra.Spin.Compact`. It is one structure with a real body and no sorry'd data, plus the theorem:

```lean
structure SpinStructure {X : Type w} [TopologicalSpace X] (F : Type*) (E : X → Type w)
    [TopologicalSpace (TotalSpace F E)]
    [∀ x, NormedAddCommGroup (E x)] [∀ x, InnerProductSpace ℝ (E x)] (n : ℕ) where
  P : X → Type w
  [topTotal : TopologicalSpace (TotalSpace (realCliffordSpinGroupZero n) P)]
  [topFiber : ∀ x, TopologicalSpace (P x)]
  [act : ∀ x, MulAction (realCliffordSpinGroupZero n)ᵐᵒᵖ (P x)]
  [fiberBundle : FiberBundle (realCliffordSpinGroupZero n) P]
  [principal : TauCeti.PrincipalBundle (realCliffordSpinGroupZero n) P]
  toFrame : TotalSpace (realCliffordSpinGroupZero n) P →
    OrthonormalFrameBundle ℝ F E (EuclideanSpace ℝ (Fin n))
  continuous_toFrame : Continuous toFrame
  proj_toFrame : ∀ p, (toFrame p).proj = p.proj
  toFrame_smul : ∀ (x : X) (p : P x) (g : realCliffordSpinGroupZero n) (v : Fin n → ℝ),
    TotalSpace.mk' F (toFrame ⟨x, op g • p⟩).proj
        ((toFrame ⟨x, op g • p⟩).frame (WithLp.toLp 2 v)) =
      TotalSpace.mk' F (toFrame ⟨x, p⟩).proj
        ((toFrame ⟨x, p⟩).frame (WithLp.toLp 2 (spinVectorAction _ g v)))

theorem nonempty_spinStructure_iff_exists_eulerClass_eq_two_smul
    {X : Type} [TopologicalSpace X] [T2Space X] [Topology.CWComplex (Set.univ : Set X)]
    (F : Type) [NormedAddCommGroup F] [InnerProductSpace ℝ F] (hF : finrank ℝ F = 2)
    (E : X → Type) [TopologicalSpace (TotalSpace F E)]
    [∀ x, NormedAddCommGroup (E x)] [∀ x, InnerProductSpace ℝ (E x)]
    [FiberBundle F E] [VectorBundle ℝ F E] [IsContinuousRiemannianBundle F E]
    (u : (thomPair F E).singularCohomology (ModuleCat.of ℤ ℤ) ℤ (ModuleCat.of ℤ ℤ) (finrank ℝ F))
    (hu : IsThomClass F E u) :
    Nonempty (SpinStructure F E 2) ↔
      ∃ c, (eulerClass (ModuleCat.of ℤ ℤ) ℤ (ModuleCat.of ℤ ℤ) F E (finrank ℝ F)).hom u = 2 • c := by
  sorry
```

   The structure is G4.2's definition: a principal Spin(n)-bundle with an equivariant map to the frame bundle over the identity. The induced isomorphism `P×_Spin SO(n) ≃ Fr⁺` follows because both fibres are torsors. The theorem is G4.4a's criterion at G4.4a's generality: a Hausdorff CW base, no finiteness, and the orientation given by the Thom class u. Divisibility by 2 does not depend on the sign of u. `X : Type` is needed because `ModuleCat.{0} ℤ` has the coproducts that integral singular cohomology uses.
2. Name both declarations in the README: the definition in G4.2 and the theorem in G4.4a's rank-two paragraph.
3. Rewrite `README.md:7–9` and `Suggested.lean:8–9` to say that this criterion is stated.
4. Replace the docstring bullet at `Suggested.lean:22–23` with what remains missing:
   - the Stiefel–Whitney class w₂ of a real vector bundle, for G4.3. The only `StiefelWhitney` files at the pin are for quadratic forms over fields;
   - the central-line twisting action, for G4.4's torsor;
   - the frame-section homotopy quotient, for G4.4a's skeletal equivalence.
5. Correct the description's sentence "the geometric headlines (…, the Spin obstruction and classification, …) are not statable with a few simple definitions" in the same way.

Tested on the refuting instance: a scratch copy of `Suggested.lean` with these additions (a `module` header and `public import`s) elaborates at the pins (exit 0, one `declaration uses sorry` warning). `#check @…` shows every binder of the README statement in the elaborated type, including `[Topology.CWComplex Set.univ]`, `[IsContinuousRiemannianBundle F E]` and `IsThomClass F E u`. The table below checks the statement on the empty base, a point, S² (e = 1 and e = 2), ℝP³ and ℂP^∞.

## R02 (P3) — Layer 2 cites ComplexKahlerGeometry K5 for a Hodge star and Gram metric that are native at the pins; half of G2.2's first target is a definition

**Location.** `README.md:203–205` "K5 supplies the shared exterior Gram metrics, pointwise real Hodge star and its complex-linear extension"; `:522` "Consume K5's pointwise real Hodge star"; G2.2 `:610–612` "prove that `Orientation.complexHodgeStar` is the complex-linear extension of K5's pointwise real Hodge star". The same citation appears at `:29–31`, `:625`, `:699–700` and `Suggested.lean:38–42`.

**Claim.** These are K5 carriers, so matching `Orientation.complexHodgeStar` with them is a target.

**Witness.** `Orientation.complexHodgeStar` is defined as `(o.hodgeStar hkl).baseChange ℝ ℂ _ _` (`HodgeStar/Complex.lean:57`), and `complexHodgeStar_tmul` (`:63`) is `rfl`. `Orientation.wedgePairing_hodgeStar` (`HodgeStar/Isometry.lean:118`) is K5's `α∧*β=⟨α,β⟩vol`. Mathlib's `exteriorPower.inner_ιMulti_ιMulti` (`ExteriorPower.lean:127`) is the Gram metric.

**Repair.**
- Under "From Tau Ceti" and "From Mathlib", cite as G2.2's consumed pointwise package:
  - `Orientation.hodgeStar` (`Analysis/InnerProductSpace/HodgeStar/Basic.lean:194`), `Orientation.wedgePairing_hodgeStar` and `Orientation.hodgeStarIsometry` (`Isometry.lean:80`);
  - `Orientation.complexHodgeStar` with `complexHodgeStar_tmul`, `sesqComplexification_complexHodgeStar` (`Complex.lean:86`) and `barHodgeStar` (`:126`);
  - Mathlib's `exteriorPower.inner_ιMulti_ιMulti` and `OrthonormalBasis.exteriorPower` (`Mathlib/Analysis/InnerProductSpace/ExteriorPower.lean:127`, `:144`).
- Delete the definitional half of G2.2's first target.
- Keep its second half, stated on pinned carriers: the wedge-basis form ``Matrix.toLinearMapₛₗ₂ … (e.toBasis.baseChange ℂ).ExteriorAlgebra`` used by `CliffordAlgebra.inv_two_pow_mul_trace_adjoint_map_equivExterior_symm_mul` equals `LinearMap.BilinForm.sesqComplexification (innerₗ (⋀[ℝ]^k V))` degree by degree, under `ℂ⊗⋀V ≅ ⋀(ℂ⊗V)`.
- Restrict the K5 citations at `:29–31`, `:203–205`, `:522–528`, `:625` and `:699–700` to what K5 adds beyond the pins (bundle transport and the analytic theory).
- Correct `Suggested.lean:38–42` to match.

Tested: in the plane, Tau Ceti's star gives `⋆1=e₁₂, ⋆e₁=e₂, ⋆e₂=−e₁, ⋆e₁₂=1`. K5's characterization gives the same values, and in general `wedgePairing_hodgeStar` together with the isometry forces equality, so K5's star is `Orientation.hodgeStar`.

## Previous findings

PRREVIEW-SpinGeometry~20's R01 (P2: the pin already proves the five admitted theorems) is **repaired**:
- `Suggested.lean` now has no declaration. Its docstring, at `:11–17`, says that "The algebraic results of Layers 1 and 2 are theorems of the pinned Tau Ceti".
- G1.3 now reads "Consume the following; this subsection keeps no target." (`README.md:373`), and G2.1 says the same (`:532`).
- "From Tau Ceti" (`README.md:128–181`) lists every supplying file for G1.1–G2.3.
- Item 3 of the repair (the audit of G1.1–G2.3) was carried out. G1.1, G1.3 and G2.1 keep no target. I checked the targets kept in G1.4, G2.2 (the Φ equivalence) and G2.3 against `OddSplitting.lean`, `HalfSpinor.lean`, `VolumeElement/EquivEven.lean`, `Prod.lean`, `VolumeElement/Prod.lean`, `VolumeElement/GradedModule.lean` and `RingTheory/Morita/Eigenspace.lean`. None of them is stated at the pin. The exception is the first half of G2.2's first target (R02).

The previous review's two remarks are also resolved:
- The former-heading table (`README.md:253–260`) maps the `## G1.`–`## G6.` anchors to Layers 1–6.
- The description sentence about "covering/connectivity imports" is gone.

The repair report of round 20 marks nothing "not actionable", so nothing is re-raised.

## Verified sound

**Head, scope and gate.**
- `git rev-parse HEAD` = 8fa7f9b9. The worktree is clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty.
- The pins are Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, as in `lake-manifest.json`.
- My gate run: `gate SpinGeometry: set_option=0 … statement-hygiene=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run adds `build=0`.
- `lake env lean TauCetiRoadmap/SpinGeometry/Suggested.lean`: exit 0, no output. The file has no declaration, so there was no `#check @` to compare and no one-tactic probe to run.

**Dependency check** (the required command):

```text
depcheck: 234 roadmaps, 2263 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. SpinGeometry is on main, and every supplier it names is on main:
- SmoothBundlesConnections B2.1, B3.3, B6.0;
- HopfRinow Layer 1; RiemannianGeometry R1, R5, R7; DifferentialGeometry;
- ComplexKahlerGeometry K5; CharacteristicClasses C1.0, C3.2, C3.5, C7.3; AlgebraicTopology 8.9;
- TopologicalKTheory T2, T3, T4, T6.4, T7; GeneralizedCohomology G5.5;
- PseudodifferentialOperators P1.0, P4–P6;
- SpinRepresentations Layers 2 and 7; OrthogonalSpinGroups.

Each section or item resolved on main at be0b3b11. CharacteristicClasses C3.2 states `w_n=e(E) mod2` (line 1115), which the rank-two criterion needs. TangentialBordism and IndexTheory appear only as downstream consumers. The eleven GeneralizedCohomology G5.5 names (`realFiniteCliffordHilbertModuleStabilization`, `realNegativeCliffordFamilyIndex`, …) and `SpinCompactTopologyFoundation` (SpinRepresentations line 520) exist on main.

**Library declarations.**
- A namespace-aware scan of every backticked name in the README against the pins resolved all Tau Ceti and Mathlib names. The exceptions are Mathlib's `Star` instance, written `CliffordAlgebra.star`, and short forms such as `range_spinGroup_toUnits` that follow their namespaced sibling.
- All 49 file paths under "From Tau Ceti" exist.
- Statements opened and compared with the README:
  - `scalarTrace` (`ScalarTrace/Basic.lean:102`, `[Invertible (2:R)]`);
  - the positivity lemmas (`Positivity.lean:213–287`, hypotheses `Q(bᵢ)≤0` or `0≤Q v` with finite-dimensional V);
  - `complexConj` and `conjStar` (`Complexification.lean:71`, `:154`);
  - `complexVolume` = `I^((n+1)/2) • ofBaseChangeAux (volumeElement)` (`VolumeElement/Complex.lean:94`);
  - `baseChangeExteriorAction_complexVolume_of_eq_two_mul` (`HodgeStar.lean:149`, exponent `ℓ+k(k−1)`);
  - `inv_two_pow_mul_trace_adjoint_map_equivExterior_symm_mul` (`ScalarTrace/Representation.lean:187`);
  - `parityTwistedRight_apply` (`Regular.lean:49`, `involute s * ι Q v`, matching G5.0's `C₊(w)s=ε(s)·ι₋(w)`);
  - the Fock metric file docstring (`Fock/Metric.lean`) and `ExteriorAlgebra/HermitianMetric.lean`. The second has no Gram-determinant lemma, so G1.2's kept target is not at the pin.

**Overlaps (each lead checked).**
- ComplexKahlerGeometry `#k5-…` (`README.md:235`): the four revisions that drop the anchor each map it. #1234 at line 365 sends K1–K8 to Layers 1–8; #1807 line 551 and #1808 line 567 send `K5`→Layer 5 and `K5a`→5.1–5.8; #1854 has a former-numbering table at line 515. The citation stays valid.
- #1780 (the same folder) conflicts in both files. The description's merge-order block puts this pull request first. #1780's `Suggested.lean` declares no `SpinStructure`, so R01's name does not clash.
- The anchors this revision drops (`#g1-…`, `#g4-…`) are cited at the head of SpinRepresentations' open pull request (lines 1099–1101, 1574–1575). The table at `README.md:253–260` gives the old→new map, and ids G1.1 and G4.1 are kept. GeneralizedCohomology on main (line 42) uses a commit permalink.
- Ownership by object: IndexTheory (line 74), SpectralManifolds (line 35), TangentialBordism (lines 137, 467) and SpinRepresentations (line 41) all hand Spin structures, spinor bundles, Dirac operators and Lichnerowicz to SpinGeometry. No `Suggested.lean` on main or at an open head declares a Spin structure on vector bundles. QuadraticFormInvariants' `IsPinLift` is a matrix-level predicate. This roadmap owns R01's `SpinStructure`.

**Adversarial table.** The rows cover the sampled targets, the headline theorems and the targets the findings touch. Rows for statements unchanged since 02d46b3 and not resampled stand as computed in PRREVIEW-SpinGeometry~20.

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| R01 rank-two criterion (G4.4a) | X=∅; X=pt; S² with e=1 and e=2; ℝP³ with γ_ℂ; ℂP^∞ with L and L⊗L | ∅: H²=0 and the empty family is a lift, so both sides hold. pt: Spin(2)-torsor and H²=0, so both hold. S²: e=1∉2ℤ and w₂=1, so no lift; e=2=2·1 and TS² is spin. ℝP³: H²=ℤ/2, 2H²=0, e(γ_ℂ)=β(a)≠0 and w₂=a²≠0. ℂP^∞: e(L)=x∉2ℤ with w₂≠0; e(L²)=2x with root L | true in both directions; statable: R01 |
| G4.3 obstruction (headline) | S² e=1; TS²; trivial bundle | w₂=1 gives no lift; w₂=0 gives a lift; lifted discrepancy 1 is 0 in additive ℤ/2 | holds; not statable (no vector-bundle w₂ at the pins) |
| G4.4 torsor (sampled) | S¹; T²; S² | lifts = |H¹(·;ℤ/2)| = 2, 4, 1; twisting twice gives the identity | holds; matches Nicolaescu Remark 12.2.28 |
| G4.4a skeletal (sampled) | trivial rank-3 bundle on S¹; TS² | π₁SO(3)=ℤ/2 gives 2 classes = 2 lifts; TS²⊕ε¹ trivial with 1 lift, but no global 2-frame | holds |
| G4.2 metric change (sampled) | g′=4g | B=4Id, B^(−1/2)=Id/2, ‖e/2‖²_g′=1, versus ‖2e‖²_g′=16 | holds |
| G1.4 two-factor evaluation (sampled) | rank 1, E=S₊⊕S₊⊕S₋ | dim E⁺=2=2⁰·2 and dim E⁻=1=2⁰·1 | holds |
| G1.4 labels and ψ (sampled) | n=1, c(e)=∓i; plane (e₁,e₀) | ω=i(−i)=1 and ω=−1; ψ(ie₁)=ie₀e₁ while Γ=ie₁e₀=−ie₀e₁, so ψ(ω)=−Γ; with e₀ first, Γ=ie₀e₁=ψ(ω) | holds |
| G1.4 restriction intertwiners | n=1, orientation (e₁,e₀) | ω acts by −μ on Γ=μ: on S⁻ (μ=−1) ω=+1, giving S₊; on S⁺ ω=−1, giving S₋ | holds as stated |
| G1.2 Fock action (consumed) | unit J-plane | g_ℂ(v¹⁰,v⁰¹)=½; c(e₁): 1↦w, w↦−√2·√2·½=−1; c(e₂): 1↦iw, w↦i; c₁c₂1=−i and c₂c₁1=i, sum 0; Γ1=i(−i)=1 | holds |
| G1.2 kept Gram target | w₁,w₂ h-orthonormal; degree 0 | det[[1,0],[0,1]]=1=H; empty determinant 1=H(1,1); ‖w₁⊗w₂−w₂⊗w₁‖²=2 | holds |
| G2.1 Γ (consumed) | n=2ℓ | reverse sign (−1)^(ℓ(2ℓ−1))=(−1)^ℓ gives star Γ=(−1)^ℓΓ; κ(i^ℓ)=(−1)^ℓi^ℓ gives conjStar Γ=Γ; Γ²=(−1)^ℓ(−1)^ℓ(−1)^(2ℓ)=1 | holds |
| G2.2 Γ on forms | plane, p=0,1,2 | directly, c(e₂)1=e₂ and c(e₁)e₂=e₁₂, so Γ1=ie₁₂; Γe₁=ie₂; Γe₁₂=i³·1=−i; matches i^(ℓ+p(p−1)) | holds |
| G2.2 first target (R02) | c⊗x; plane basis | complexHodgeStar(c⊗x)=c⊗hodgeStar x by `rfl`; Tau Ceti's ⋆ and K5's * agree on 1, e₁, e₂, e₁₂ | definitional: R02 |
| G2.2 Φ parity and chirality | plane, A=c(e₁) | Γc(e₁)Γ=−c(e₁), odd; induced dual parity diag(1,−1) versus reverse-dual chirality diag(−1,1) | holds |
| G2.3 duality law | ℓ even and odd | c(v,w)ᵀ=c_Vᵀ⊗1+Γ_Vᵀ⊗c_Wᵀ; the product of reverse duals uses (−1)^ℓΓ_Vᵀ; for odd ℓ, conjugating by Id⊗Γ_(F*) flips the second term, since Γ_(F*)c_Wᵀ=−c_WᵀΓ_(F*) | holds |
| G2.3 Koszul swap | homogeneous e, f | S∘c(v,0) and c″(0,v)∘S both give (−1)^((|e|+1)|f|) f⊗c_Ve; S∘c(0,w) and c″(w,0)∘S both give (−1)^(|e||f|) c_Wf⊗e; the swap isometry has sign (−1)^(2ℓ_V·2ℓ_W)=+1 | holds |
| G2.3 orientation reversal and unit | T=Id⊗Γ_W; zero space with either orientation | T(Γ_V⊗c_W)T=−Γ_V⊗c_W and T(c_V⊗1)T=c_V⊗1; Γ=1 gives c(0,w)=c_W, Γ=−1 gives −c_W | holds |
| G3.1 (sampled) | G=ℝ non-compact, ρ(t)=rotation by 2t, μ(t)=diag(e^(−it),e^(it)) | both sides at e₁ equal [[0,−e^(−2it)],[e^(2it),0]] | holds; Nicolaescu p.636 assumes no compactness |
| G3.3 (sampled) | B=diag(i,−i), c(e₁)=[[0,−1],[1,0]]; unit S² | Bc=[[0,−i],[−i,0]] and cB=[[0,i],[i,0]], so [B,c]=[[0,−2i],[−2i,0]]≠0; [−½c₁c₂,c₁]=−c₂=c(R(e₁,e₂)e₁) | holds |
| G3.4 (sampled) | ℝ; f=x², h=0 | c(dx)(f,h)=(−h,f); D(f,h)=(−h′,f′)=(d*(h dx),df); D²(x²,0)=(−2,0)=−∂² | holds |
| G5.0 (sampled) | Cl(0,1), basis (1,e) | C₊(e): 1↦e, e↦−e·e=1, matrix [[0,1],[1,0]]; c₋ matrix [[0,−1],[1,0]]; C₊c₋1=1 and c₋C₊1=−1, sum 0; untwisted right multiplication squares to −Id | holds |
| G5.1 (sampled) | ranks 2, 4, 1 | 2 with halves (1,1); 4 with (2,2); rank 1: one factor of dimension 1, the sum of both factors 2 | holds |
| G6.2 (sampled) | flat line; plane curvature B; D+Id | D²=c(e)²∂²=−∂² with empty curvature sum; Σ_(i<j) gives c₁c₂B, while the ordered full sum gives 2c₁c₂B (p.656: Σ_(i<j)=½Σ_(i,j)); (D+1)²=D²+2D+1 | holds |
| G6.3 Lichnerowicz (headline, sampled) | unit S² | R^S(e₁,e₂)=¼[(−1)c₁c₂+(1)c₂c₁]=−½c₁c₂; remainder −½(c₁c₂)²=½=Scal/4; flat torus Scal=0 with constant parallel spinors | holds; not statable (no spinor bundle at the pins) |
| G6.4 (sampled) | flat circle; point | harmonic forms of dimensions (1,1) and (1,0) | holds |
| G6.6 (sampled) | ξ≠0, t∈[0,1] | c(ξ)·(−c(ξ)/|ξ|²)=1; |e^(iπt/2)|=1 | holds |
| G6.7 (headline, sampled) | J(z,w)=(−w̄,z̄); a complex line; flat T⁴; rank-4 Γ | J²=(−z,−w); |a|²=−1 has no solution; kernels 2 and 2, index 0=2(1−1); Γ=i²ω₋=−ω₋, as in Nicolaescu p.652 (Γ=−e₁e₂e₃e₄) | holds; not statable |
| Conventions: Clifford sign | unit e; v=0 | c(e)²=−1=Q(e); c(0)²=0 | holds |

The remaining headlines are not statable at the pins, for these reasons: G5.3 square roots (no tensor square of complex line bundles), G6.0 real KO index (no KO), G6.1 closed domains (no bundle Sobolev carriers), and G6.4 de Rham operator (no Clifford-module Dirac operator). The docstring's bullets for these are accurate.

**Sources: the seeded sample.** Nicolaescu's printed page is PDF page − 12. This was checked at §12.1.2 (PDF 638, printed 626), §12.1.8 (660/648) and §12.2.3 (680/668). Each sampled locator was opened at its line:

| Target | Cited locator | Where it is | Supports the statement |
| --- | --- | --- | --- |
| G1.4 | Lemma 12.1.29, Prop. 12.1.30, pp. 634–635 | nicolaescu lines 29553–29575 | yes: Ψ(x₀+x₁)=x₀+e₀x₁ and Cl(V)≅End(S⁺)⊕End(S⁻) for or(V⊕ℝ)=or∧or(ℝ); the evaluation and labels are derived as stated |
| G3.1 | §12.1.5, Example 12.1.33, pp. 636–637 | lines 29600–29662 | yes: Lie group G, orthogonal ρ, unitary μ, c invariant in V*⊗E*⊗E, no compactness assumed |
| G3.3 | Lemma 12.1.31 p.636; Def. 12.1.64(a2) p.653 | lines 29635–29642, 30311–30314 | yes, including the Levi-Civita requirement |
| G3.4 | Prop. 12.2.1, p.657 | line 30497 | yes |
| G4.2 | §12.2.3, pp. 668–669 | lines 30914–30938 | yes for smooth tangent lifts, given as cocycles; the README says the principal and paracompact form uses other suppliers |
| G4.3 | Prop. 12.2.25, p.669 | line 30950 | yes |
| G4.4 | Remark 12.2.28, Exercise 12.2.29, p.669 | lines 30957–30981 | yes: free and transitive H¹ action |
| G4.4a | Kirby Ch. IV, pp. 33–34 | kirby lines 1114–1164 (PDF 41–42) | yes: skeletal definition (n≥3), stabilization by ε¹ (n=2) and ε² (n=1), the principal description, w₂=0 and H¹; the rank-two criterion is attributed to CharacteristicClasses C3.2 |
| G5.0 | §12.1.2, pp. 628–629, Exercise 12.1.15, Example 12.1.18 | lines 29316–29377 | yes |
| G5.1 | §12.2.3, Lemma 12.2.32, pp. 670–672 | lines 31005–31058 | yes |
| G6.2 | Thm 12.1.67, p.656 | lines 30418–30424 | yes: c(F)=Σ_(i<j) |
| G6.3 | Thm 12.2.33 p.673; Exercise 12.1.68 p.657 | lines 31100–31101, 30468 | yes |
| G6.4 | Prop. 12.2.1 p.657; Example 12.1.25 p.633 | lines 30497, 29500 | yes |
| G6.6 | §12.2.3, p.672 | lines 31059–31069 (page rendered) | yes: the symbol of the chiral block is Clifford multiplication |
| G6.7 | §12.1.8, pp. 651–653 | lines 30201–30282 | yes: Cl₄≅M₂(ℍ), Spin(4)=SU(2)², Γ=−e₁e₂e₃e₄, quaternionic S±₄ |

The README flags no locator as unverified.

## Not verifiable

- Lawson–Michelsohn, Chapters I–II, and Atiyah–Bott–Shapiro, §§6 and 11, are settled as `uncertified` (paywalled). They are cited by locator only and were not opened.
- Kirby's OCR is unreadable at kirby line 1141 (p.33). The lines around it carry every statement G4.4a cites.

## Source issues

- **Misprint** in nicolaescu at the proof of Theorem 12.2.33, p. 672: splitting c(F(∇̂)) into two sums, the source omits the factor on the distinct-index sum; it should carry −1/8, like the original sum; affects nothing (that sum vanishes by Bianchi).
