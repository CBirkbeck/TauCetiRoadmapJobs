# Review of SpinGeometry (pull request #1674 at 02d46b3)

**Verdict:** needs changes

:robot: Incremental AI re-review of the folder `TauCetiRoadmap/SpinGeometry/` at 02d46b3. The previous review read e586e98; since then the folder changed by 0 lines. What changed is the merge of main, which moved the pins of `lake-manifest.json` from Tau Ceti `358314d4` / Mathlib `f6090c70` to Tau Ceti `2fd255d9` / Mathlib `1b1ccf4b`. The gate passes and the dependency check reports no problem, but at the new Tau Ceti pin every theorem `Suggested.lean` admits is already a consequence of library declarations, so one finding remains. The AI does not approve or merge.

## R01 (P2) — At the merged pins Tau Ceti already proves all five admitted headlines; cite it and drop the targets

**Location.** `TauCetiRoadmap/SpinGeometry/Suggested.lean:69, 79, 114, 119, 134` (`multiplicityEvaluation_exists`, `cliffordScalarTrace_exists`, `chirality_sq`, `chirality_anticommutes`, `isCompl_spinors`); `README.md:7` "`Suggested.lean` states the headline theorems expressible against the pinned APIs"; `README.md:19–22` "Tau Ceti already has … raw orthogonal-product volume identities and real algebraic eight-periodicity. G1–G2 supply the geometric metric/complexification/chirality comparisons"; `README.md:108–112` (From Tau Ceti); G1.3 (`README.md:288–290`, `:351–353`) and G2.1 (`:465–468`).

**Claim.** These five statements are results the finished roadmap will prove, and the library lacks the regular scalar trace, the Morita evaluation and the normalized-volume chirality decomposition.

**Witness.** Tau Ceti at `2fd255d9` (none of these files exists at `358314d4`, the pin the previous review read):

- `TauCeti/LinearAlgebra/CliffordAlgebra/ScalarTrace/Basic.lean`: `CliffordAlgebra.scalarTrace` (:102), `scalarTrace_one` (:118), `scalarTrace_mul_comm` (:161), `scalarTrace_eq_inv_two_pow_mul_trace_mulLeft` (:259); `ScalarTrace/Positivity.lean`: `scalarTrace_conjStar_mul_self_nonneg` (:291), `scalarTrace_conjStar_mul_self_eq_zero_iff` (:336, hypothesis `(-Q).PosDef`); `ScalarTrace/BaseChange.lean:183` `scalarTrace_ofBaseChangeAux`; `Complexification.lean:206` `conjStar_ofBaseChangeAux`.
- `TauCeti/RingTheory/Morita/ModuleEnd.lean:184` `TauCeti.isotypicTensorEquivOfBijective : S ⊗[k] (S →ₗ[A] M) ≃ₗ[A] M` with `isotypicTensorEquivOfBijective_apply` (:189) and `isotypicEval_tmul` (`RingTheory/Semisimple/Multiplicity.lean:685`): evaluation `s ⊗ T ↦ T s`, no hypothesis on `M`.
- `TauCeti/LinearAlgebra/CliffordAlgebra/VolumeElement/Oriented.lean`: `volumeElement_eq` (:198, frame formula), `volumeElement_mul_ι_of_even` (:229), `volumeElement_mul_self` (:243); `VolumeElement/Complex.lean`: `complexVolume` (:94), `complexVolume_mul_ι_of_even` (:227), `complexVolume_mul_self` (:279); `VolumeElement/Eigenspace.lean:218` `isCompl_eigenspace_complexVolume` (arbitrary module `E`); `LinearAlgebra/Eigenspace/Separation.lean:71` `TauCeti.isCompl_eigenspace_one_neg_one`.

I copied the five statements verbatim into two scratch files importing `Mathlib` and these modules and proved each one from the declarations above (`lake env lean`, exit 0, no `sorry`, no error): the trace with `τ := scalarTrace Q` (formula, unit and cyclicity are the three library lemmas; positivity and faithfulness by transporting the two `conjStar` lemmas along the injective `ofBaseChangeAux ℂ Q`); the evaluation by `Module.compHom` along `ρ` and `σ` and `isotypicTensorEquivOfBijective` restricted to ℂ; `chirality_sq` and `chirality_anticommutes` by rewriting the frame product with `volumeElement_eq` at the orientation of `b` and applying `volumeElement_mul_self` (exponent `(2ℓ+1)/2 = ℓ`, so `(−1)^ℓ·(−1)^ℓ = 1`) and `volumeElement_mul_ι_of_even`; `isCompl_spinors` from the involution and `isCompl_eigenspace_one_neg_one`. The chirality proofs use only the clause `Q v = −⟨v,v⟩` of `IsGeometricAction`.

**Repair.**

1. `Suggested.lean`: delete the five theorems and the six definitions that exist only to state them (`multiplicitySpace`, `cliffordMultiplication`, `IsGeometricAction`, `chirality`, `positiveSpinors`, `negativeSpinors`). The file then states nothing; its module docstring says so, keeps the list of geometric headlines that are not statable with their missing carriers, and says that the algebraic Layer 1–2 headlines are in Tau Ceti. Remove the corresponding backticked names from the README (`:268`, `:288`, `:351`, `:452–453`, `:465–468`) so that README and Lean agree, and correct `README.md:7`.
2. `README.md` Scope and ownership (`:19–22`) and From Tau Ceti (`:108–112`): cite the declarations above by exact name and file as supplied, and state G1.3 and G2.1 as what remains beyond them (for instance the comparison of `CliffordAlgebra.scalarTrace` and `complexVolume` with the Fock model, the frame-ordered `Module.End` form if a consumer needs it, in one clause saying how it differs), not as the trace, evaluation and decomposition themselves.
3. The same pin has further files on the objects of Layers 1–2 that I opened only at their statement lists and did not compare line by line with the README targets: `CliffordAlgebra/Hermitian/Multiplicity.lean` (`multiplicityMetric`, the metric on the multiplicity space of G1.3), `VolumeElement/HodgeStar.lean` (`baseChangeExteriorAction_complexVolume`, G2.2's Hodge comparison), `VolumeElement/Prod.lean` (`complexProdTensor_complexVolume`, G2.3's product grading), `VolumeElement/Dual.lean`, `HalfSpinor.lean`, `OddSplitting.lean`, `Neg.lean`. Audit G1.1–G2.3 against them at `2fd255d9` and replace each target the pin states by a citation.

Tested on the refuting instance: with the five theorems gone no admitted statement of the file is provable from the pin, and the cited names resolve at `2fd255d9`.

## Previous findings

The previous report (PRREVIEW-SpinGeometry~15 at e586e98) was an acceptance with no finding of its own, so there is none to account for. The two items it recorded as settled, not actionable in the folder, are unchanged at this head and are not re-raised: the reciprocal roadmap-level citations with roadmaps on main (the dependency check still reports 0 problems), and the missing `authors`/`title`/`year` of the `kirby` and `nicolaescu` manifest records (the worker's manifest, not the pull request).

## Verified sound

**What changed.** `git diff e586e98 HEAD -- TauCetiRoadmap/SpinGeometry` is empty; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty (merge base = main f8836c4); the worktree is clean. The merge moved `lake-manifest.json` and `lean-toolchain` with main; `.lake/packages/mathlib` is at `1b1ccf4b` and `.lake/packages/TauCeti` at `2fd255d9`, as the manifest says.

**Gate.** The worker's run and mine at 02d46b3: every scanner 0 (`statement-hygiene=0`, `stray-files=0`, `outside-folder=0`, `depcheck=0`), the worker's with `build=0`, `OK`.

**Elaboration.** `lake env lean TauCetiRoadmap/SpinGeometry/Suggested.lean` at the new pins: exit 0, exactly five `declaration uses sorry` warnings (lines 69, 79, 114, 119, 134), nothing else. The 11 elaborated types of `signatures.md` match those the previous review compared with the README (no lost binder); the file is byte-identical. The one-tactic probe result of the earlier reports is superseded by R01: no single tactic closes them, but each follows from the pin in a few lines.

**Dependency check** (the required command):

```text
depcheck: 235 roadmaps, 2268 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Citations.** The worker's resolver lists no cross-roadmap citation or Lean name found nowhere against main f8836c4 and the open heads. Overlap leads of `overlaps.md`, each checked:

- ComplexKahlerGeometry `#k5-compact-hermitian-elliptic-theory-and-serre-duality` (`README.md:166`): the four open revisions that renumber it each carry a former-numbering map sending K5 to Layer 5 and K5a to 5.1–5.8 (at the heads of #1234 lines 365–366, #1807 line 551, #1808 "`K5` → Layer 5; `K5a` → 5.1–5.8", #1854 line 529), so the citation stays valid and needs no change.
- Pull request #1780 revises the same folder and conflicts in both files; the description's merge-order block states the order (this pull request first, #1780 rebased onto it). It still declares nine of the same fully qualified Lean names; R01's repair removes them here.
- Remark on untouched text, no change requested in this round: the headings `## Layer 1: …` and `## Layer 4: …` replace main's `## G1. …` and `## G4. …`, and the README has no former-numbering sentence; SpinRepresentations at the head of #1207 (lines 1100, 1102, 1575, 1576) links the anchors `#g1-negative-metric-clifford-modules-and-their-positive-metrics` and `#g4-spin-lifts-obstruction-and-classification`. GeneralizedCohomology on main (line 42) uses a commit permalink and is unaffected. The ids G1.1 and G4.1 themselves are kept in the subsection headings.
- Remark on the description, untouched since the previous review: its sentence "Added native covering/connectivity imports and checks" does not describe the head, whose `Suggested.lean` imports `Mathlib` alone and has no `#check`.

**Sources.** The seeded sample does not intersect any changed passage (there is none in the folder); the locator checks of the earlier reports stand (nicolaescu §12.1.5 pp. 636–637, Example 12.1.54 pp. 648–649; kirby Chapter IV pp. 33–34). No source was reopened this round.

**Ownership.** Unchanged for the geometric layers G3–G6: no roadmap on main, at the open heads the brief lists, or in the board packages constructs them. For Layers 1–2 the owner of the algebra is now Tau Ceti itself (R01). Ownership against open pull requests whose files the brief does not give was checked only through the grep index.

**Library declarations opened at the pin** (Tau Ceti `2fd255d9`): the 17 named in R01, each at the file and line given, plus `OrthonormalBasis.isOrthoᵢ_associated` (`CliffordAlgebra/OrthonormalBasis.lean:64`) and `ofBaseChangeAux_injective` (`CliffordAlgebra/BaseChange.lean:130`). `CliffordAlgebra/Chirality.lean` (`chirality`, `chirality_mul_self` :189, `chirality_mul_ι` :195) is the dimension-four case only (`Fact (finrank ℝ V = 4)`), a special case and not itself a duplicate.

**Adversarial table.** The first five rows are the statements the pin change touches, with what the scratch proofs computed. The remaining rows are carried unchanged from PRREVIEW-SpinGeometry~15 (which carried the older ones from ~5 and ~13), where each value was computed; the diff leaves every one of those statements untouched.

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| `cliffordScalarTrace_exists` (this head, new pin) | τ := `CliffordAlgebra.scalarTrace Q`; V=0; a = e, a = 1+e in rank 1 | formula = `scalarTrace_eq_inv_two_pow_mul_trace_mulLeft`; τ(1)=1; τ(ab)=τ(ba); V=0: 2⁰=1, τ=id on ℝ; τ(star e·e)=τ(−e²)=1; τ(star(1+e)(1+e))=τ((1−e)(1+e))=τ(1−e²)=2>0; scratch proof exit 0 | true, and proved by the pin: R01 |
| `multiplicityEvaluation_exists` (this head, new pin) | A=Cl(Q) acting through ρ, σ; S=ℂ, V=0; E=0 | lsmul = ρ bijective; `isotypicTensorEquivOfBijective` on s⊗T gives T(s); V=0: ℂ⊗Hom(ℂ,E) ≅ E; E=0: 0 ≅ 0; scratch proof exit 0 | true, and proved by the pin: R01 |
| `chirality_sq` (this head, new pin) | ℓ=0,1,2 | Γ = I^ℓ·ρ(vol); vol² = (−1)^((2ℓ+1)/2) = (−1)^ℓ; (I^ℓ)² = (−1)^ℓ; product 1, 1, 1; ℓ=0: empty product, Γ=Id | true, and proved by the pin: R01 |
| `chirality_anticommutes` (this head, new pin) | n=2ℓ even; v=b₀ in the plane | vol·ι v = −ι v·vol (`volumeElement_mul_ι_of_even`); plane: e₁e₂e₁ = −e₁e₁e₂ | true, and proved by the pin: R01 |
| `isCompl_spinors` (this head, new pin) | Γ involutive on S over ℂ; S=0; Γ=Id (ℓ=0) | ker(Γ−1) ⊕ ker(Γ+1) = S since 2 is a unit; S=0: ⊥,⊥; Γ=Id: ⊤,⊥ | true, and proved by the pin: R01 |
| Conventions: Clifford sign (~15, carried) | unit e; v=0 | c(e)²=−1=Q(e); c(0)²=0=Q(0) | holds |
| Conventions: symbols (~15, carried) | D=i∂ on ℝ, ξ=1 | σ_geom=i; σ_F=i·i=−1; σ_F(D²)=1=ξ² | holds |
| Conventions: curvature sign (~15, carried) | unit S² | R(e₁,e₂)e₂=e₁, R(e₁,e₂)e₁=−e₂; K=1; Scal=2 | holds |
| G1.1 base-change direction (~15, carried) | pin | `equivBaseChange ℂ Q : Cl(Q.baseChange ℂ) ≃ ℂ⊗Cl Q`; `.symm` maps the tensor carrier to the base-changed algebra | holds |
| G1.1 positive-to-negative map (~15, carried) | e with e²=+1 | (ie)²=−1 | holds |
| G1.1 rank 0 (~15, carried) | V=0 | Cl=ℝ; `evenUnitaryGroup`={±1}; native `spinGroup`={1} | holds, distinct as stated |
| G1.2 Fock plane (~15, carried) | e₁, e₂=Je₁ | c(e₁)=A, c(e₂)=B; A²=B²=−Id; AB+BA=0; Γ=iAB=diag(1,−1) | holds |
| G1.2 metric normalization (~15, carried) | w=e₁^(1,0) | h_ℂ(w,w)=1/2; h_J(e₁,e₂)=i=2h_ℂ(e₁^(1,0),e₂^(1,0)) | holds |
| G1.2 rescaling (~15, carried) | T=2^(p/2) on Λ^p | TεT⁻¹=√2ε; T(−2ι)T⁻¹=−√2ι | holds |
| G1.3 star positivity (~15, carried) | blades k=0..3 | star(e_I)e_I=+1 every k; τ(star a·a)=Σa_I² | holds; faithful |
| G1.3 negative control (~15, carried) | Q=+⟨·,·⟩ | star(e)e=−1, τ=−1<0 | hypothesis necessary |
| G1.3 normalization (~15, carried) | n=0,1,2 | tr L₁=1,2,4; 2^(−n)·tr=1 | holds |
| G1.3 cyclicity (~15, carried) | a=e₁,b=e₂; a=b=e₁ | 0=0; −1=−1 | holds |
| G1.3 Check (~15, carried) | a=1+e₁+2e₂ | τ(star a·a)=6; unnormalized trace of 1 is 4 | holds |
| G1.3 Morita evaluation (~15, carried) | V=0,S=ℂ,E=ℕ→₀ℂ; E=0; E=S; general E | T↦T(1) bijective; 0≃0; e(s⊗Id)=s; Hom(S,⊕_I S)=⊕_I ℂ | holds for infinite-dimensional E |
| G1.4 central label and ψ(ω) (~15, carried) | n=1; n=3; plane (e₁,e₀) | (ie)²=1; (i²e₁e₂e₃)²=1; ψ(ie₁)=−Γ | holds |
| G2.1 Γ² and anticommutation (~15, carried) | ℓ=0,1,2 | (c₁⋯c_2ℓ)²=(−1)^ℓ; (i^ℓ)²=(−1)^ℓ; Γ²=1; Γc_j=−c_jΓ | holds |
| G2.1 degenerate carriers (~15, carried) | ℓ=0; S=0 | Γ=Id, S⁺=⊤, S⁻=⊥; S=0 gives ⊥,⊥ complementary | holds |
| G2.1 unused clause (~15, carried) | Gram diag(1,2) | A†=[[0,2],[−1/2,0]]≠−A, Γ²=1 | skew-adjointness unused; note only |
| G2.2 Hodge formula (~15, carried) | plane p=0,1,2 | Γ1=i e₁₂, Γe₁=i e₂, Γe₁₂=−i; i^(1+p(p−1))*ω agrees | holds |
| G2.2 Hilbert–Schmidt; reverse-dual chirality (~15, carried) | plane Id; ℓ=1 | 2^(−1)·2=1; Γ_(S*)=(−1)^ℓΓ_Sᵀ=diag(−1,1) | holds |
| G2.3 product grading (~15, carried) | two planes | eigenvalues (1,−1,−1,1); cross terms (cΓ+Γc)⊗c_W=0 | holds |
| G3.1 trivial line (~15, carried) | a+be | ‖a+be‖²=a²+b² | holds |
| G3.3 Hermitian insufficient (~15, carried) | B=diag(i,−i), c(e₁)=A | BA−AB=[[0,−2i],[−2i,0]] | holds |
| G3.4 exterior operator (~15, carried) | ℝ, (f,h) | D(f,h)=(−h′,f′); D²(x²,0)=(−2,0)=−∂² | holds |
| G4.1a covers; G4.1b differential (~15, carried) | Spin(2) z=i,−1; θ↦2θ | z²=−1,1; kernel {±1}; derivative 2 | holds |
| G4.2 metric change (~15, carried) | g′=4g | B^(−1/2)=1/2; ‖e/2‖_g′=1 | holds |
| G4.3 obstruction (~15, carried) | S² plane bundles e=1,2 | w₂=1,0; lifts 0,1 | holds |
| G4.4 torsor (~15, carried) | S¹; T² | H¹ orders 2, 4; twice-twisted = original | holds |
| G4.4a skeletal classes; stabilization; rank-two criterion (~15, carried) | S¹ trivial rank 3; disc; TS²; H²=ℤ,e=2; e=1; H²=ℤ/2 | 2 classes = 2 lifts; cochain 1 but H²=0; e=2, w₂=0, one lift; c=1; none; ρ(e)≠0 | holds |
| G5.0 external action, adjoints, equivariance (~15, carried) | Cl(0,1); R_w, ε; g=e₁e₂ | C₊²=Id, c₋²=−Id, C₊c₋+c₋C₊=0; (R_wε)²=‖w‖²; even g commutes | holds |
| G5.3 characters; roots on S² (~15, carried) | z=cos θ+sin θ e₁e₂; e=2; e=1 | ρ(z)=diag(e^(−iθ),e^(iθ)); E weight z²; c₁(root)=1; 2c₁=1 unsolvable | holds |
| G6.0/G6.3 spin curvature; contraction (~15, carried) | S²; constant curvature n=0..4 | c₁c₂R^S=½=Scal/4; Σ=0,0,1/2,3/2,3=n(n−1)/4 | holds |
| G6.0 volume signs; KO calibrations (~15, carried) | Cl(0,4), Cl(0,8); circles, T² | sums 0; periodic kernel 1 → η, antiperiodic 0 | holds |
| G6.1 local operator (~15, carried) | D=i∂; f=x | D e^(ikx)=−k e^(ikx); [D,x]=c(e) | holds |
| G6.2 curvature factor; perturbation (~15, carried) | plane B; D′=D+Id | 2c₁c₂B; D′²−D²=2D+Id | holds |
| G6.3 twist (~15, carried) | F₁₂=if·Id | c₁c₂·if=fΓ, eigenvalues ±f | holds |
| G6.4 harmonics; G6.5 spectra (~15, carried) | flat circle; point; T²; Sⁿ | (1,1); (1,0); ℤ and ℤ+½; Scal=n(n−1) | holds |
| G6.6 symbol (~15, carried) | ξ≠0; t∈[0,1] | c(ξ)⁻¹=−c(ξ)/‖ξ‖²; |e^(iπt/2)|=1 | holds |
| G6.7 volume identities; quaternionic parity (~15, carried) | Cl(0,4); J(z,w)=(−w̄,z̄); flat T⁴ | ω₋²=1; R_ω=−Γ on even part; J²=−Id; index 0=2·0 | holds |
| G3.1 descent for non-compact G (~15 at e586e98, `:582–587`, Check `:602`) | G=ℝ, ρ(t)=rotation by 2t, μ(t)=diag(e^(−it),e^(it)); t=0.3, 1.1, 2.5; v=e₁ and v=e₂ | c(ρ(t)e₁)=cos2t·A+sin2t·B=[[0,−e^(−2it)],[e^(2it),0]]=μ(t)Aμ(t)⁻¹ (difference 0 to 2·10⁻¹⁶ numerically, equal exactly since a·(−1)·b⁻¹=−e^(−2it) and b·a⁻¹=e^(2it) for a=e^(−it), b=e^(it)); at e₂: c(ρ(t)e₂)=[[0,ie^(−2it)],[ie^(2it),0]]=μ(t)Bμ(t)⁻¹; μ unitary, ρ orthogonal, ℝ non-compact | holds; the Check's displayed value is right and the law holds on all of V, not only at e₁ |
| G5.3 comparison: existence (~15 at e586e98, `:1105–1108`) | X=S², e(E)=2; e(E)=1; X=point; H²=ℤ/2 with e its generator | 2c₁=2 ⇒ c₁=1 ⇒ one root (H¹(S²;ℤ/2)=0); 2c₁=1 has no integral solution ⇒ no root, and ρ(1)≠0 ⇒ w₂≠0 ⇒ no lift; point: one root, c₁=0; 2H²=0 so e∉2H² and no root, agreeing with G4.4a's Check `:958` | holds, both directions agree with G4.4a |
| G5.3 comparison: torsor action and Bockstein (~15 at e586e98, `:1108–1113`) | α∈H¹(X;ℤ/2) with real line ℓ_α; X=T²; X=ℝP³; α=0 | (L⊗ℓ_ℂ)^(⊗2)=L^(⊗2)⊗(ℓ⊗ℓ)_ℂ≅E via ℓ⊗ℓ≅ℝ, so roots go to roots; c₁(L⊗ℓ_ℂ)=c₁(L)+β(α) with β(α) the integral Bockstein, 2β(α)=0; T²: H²=ℤ torsion-free ⇒ β=0, c₁ unchanged; ℝP³: β(a)=generator of H²=ℤ/2≠0; α=0 acts trivially | holds; "vanishes when H²(X;ℤ) has no 2-torsion but not in general" is exactly right |
| G5.3 Check T² (~15 at e586e98, `:1122`) | trivial E on T² | roots = {φ: T²→U(1)}/{g²} = H¹(T²;ℤ)/2 = ℤ²/2ℤ² (the null-homotopic maps are squares): 4 = |H¹(T²;ℤ/2)|; every L has 2c₁=0 ⇒ c₁=0 in ℤ; the four G6.5 torus lifts match; a c₁-only count gives 1 | holds; negative control sound |
| G5.3 Check ℝP³ (~15 at e586e98, `:1123–1124`) | trivial E on ℝP³ | solutions of 2c₁=0 in H²(ℝP³;ℤ)=ℤ/2: c₁∈{0,a}, both realized (trivial line; γ_ℂ with c₁(γ_ℂ)=β(w₁γ)=a≠0 and γ_ℂ⊗γ_ℂ=(γ⊗γ)_ℂ trivial); H¹(ℝP³;ℤ)=0 so each L carries one root class; 2 = |H¹(ℝP³;ℤ/2)| | holds |
| G5.3 orientation reversal and labels (~15 at e586e98, `:1101`, unchanged words, re-read against the new paragraph) | J↦−J | E↦E̅, e(E)↦−e(E), c₁(L)↦−c₁(L): a root of E̅ is L̄ = L*, so S⁺ and S⁻ interchange, agreeing with "`S⁻` is the root of E, `S⁺` its dual" | holds |

## Not verifiable

- Lawson–Michelsohn Chapters I–II and Atiyah–Bott–Shapiro §§6 and 11 are settled as `uncertified` in the manifest (paywalled); cited by locator only, not opened.
- Kirby's OCR is unreadable at kirby line 1141 and 1156 (pp. 33–34); the surrounding lines carry every statement G4.4a cites (as in the previous report; not reopened).
- The files listed in item 3 of R01's repair were read at their statement lists only; whether each README target of G1.1–G2.3 is literally stated by them is left to the audit the repair asks for.

## Source issues

- none
