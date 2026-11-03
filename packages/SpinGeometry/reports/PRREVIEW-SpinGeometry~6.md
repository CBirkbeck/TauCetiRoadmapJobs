# Review of SpinGeometry (pull request #1780 at 9db41a5)

**Verdict:** needs changes

Full review of the folder `TauCetiRoadmap/SpinGeometry/` at `9db41a55985e3219c0e8e5f0b89feb0af3db6be8`; the folder changed by 448 lines since the head the previous review read. The pull request now rewrites `Suggested.lean` (18 declarations, 9 admitted), adds a `**Checks.**` block and a `*Needs:*` line under G1.1, attaches Nicolaescu and Lawson–Michelsohn locators to fourteen claims, replaces the seven commit-pinned links, and keeps the companion `SourcePauliTargets.lean`. The gate passes every check (`build=0`, `depcheck=0`, `sorry-data=0`, `imports=0`, `residue=0`). No file outside the folder changes (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty). Four findings, one blocking; the blocking one is the roadmap-level supply cycle inherited from main that every earlier round raised and this head leaves in place.

**Previous findings (review at 2d42cdf), finding by finding.**

| Previous | Status at 9db41a5 | Where |
| --- | --- | --- |
| R01 (P1) reciprocal supplier edges | not repaired: README lines 14, 37, 51, 62 and 934 still consume SpinRepresentations, RiemannianGeometry, CharacteristicClasses and GeneralizedCohomology, and all four consume SpinGeometry on main | R01 below |
| R02 (P2) admitted data `multiplicityEvaluation` | repaired: `Suggested.lean:100` is `theorem exists_multiplicityEvaluation [FiniteDimensional ℂ S] [Nontrivial S] : ∃ e : S ⊗[ℂ] multiplicitySpace Q ρ σ ≃ₗ[ℂ] E, ∀ s T, e (s ⊗ₜ T) = T.val s`, nothing on E; gate `sorry-data=0` | — |
| R03 (P2) trace headline absent, docstring inventory | repaired: `cliffordScalarTrace`, `cliffordScalarTrace_mul_two_pow`, `_reverse_mul_self_nonneg`, `_reverse_mul_self_eq_zero_iff` at lines 48–72; module docstring lines 15–29 names the five unstatable headlines and the carrier each lacks | — |
| R04 (P2) unidentifiable source, process language, anchor | repaired in the README: the Rieffel notes, "unread", "unresolved" and the `<a id>` anchor are gone, and the matrices are Checks under G1.1 (lines 157–188); the companion's docstring still speaks of the "quantum Riemannian notes' page2" and "page5's unclear matrix subscript" | R02 |
| R05 (P2) recurrence not in G1.1, private model | repaired: the recurrence sentence is deleted; the comparison names the public `realCliffordSignatureSwitchRecurrenceEquiv 0 0` composed with Cl(0,0) ≅ ℝ (line 165) | — |
| R06 (P3) companion is value-computing padding, no docstrings | not repaired: file unchanged | R02 |
| R07 (P3) seven commit-pinned links | repaired (`blob=0`; lines 62, 65, 68–76 are repository-relative) | — |
| R08 (P3) TeX fragments | repaired (`tex=0`; lines 117, 810 in code spans) | — |
| R09 (P3) import header | repaired: `module` / `public import Mathlib` / `public section` (lines 1–33), no Tau Ceti import needed | — |
| R10 (P3) no Checks, no `*Needs:*`, legacy shape | partly repaired: one Checks block and one `*Needs:*` line (G1.1); every other definition still has neither | R04 |
| R11 (P3) padding | repaired: `realCliffordPositiveRightVector(_square/_anticommute)`, `cliffordMultiplication_sq`, `even_finrank_of_quaternionicStructure` deleted | — |
| R12 (P3) names and docstrings out of step | repaired: all 18 Lean names occur in the README; the README backticks no undeclared name of its own (`realCliffordSpinorBundle`, `realSpinDiracIndexClass` and the G6.7 names lost their backticks); every declaration has a docstring | — |
| R13 (P3) no locators | repaired for every sampled target (table below); the manifest records `nicolaescu` certified and `abs`, `lawson-michelsohn` uncertified | — |

## R01 (P1) — Reciprocal supplier edges with four roadmaps on main

Re-raised: R01 of the review at 2d42cdf (and R01 of the three reviews of pull request #1674). No repair report marks it not actionable.

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:14` (SpinRepresentations L0–L4, L7, L9 supply), `:37` (RiemannianGeometry R1, R5, R7), `:51` (CharacteristicClasses C1, C3.5), `:62` (GeneralizedCohomology G5.5), `:934` ("GeneralizedCohomology G5.5 consumes Spin G1.3's trace").

**Claim:** these four roadmaps are suppliers of SpinGeometry.

**Witness:** on main, `TauCetiRoadmap/GeneralizedCohomology/README.md:1908` consumes "SpinGeometry G1.3's `cliffordScalarTrace`" and `:1772` consumes G5.0/G6.0; `TauCetiRoadmap/CharacteristicClasses/README.md:911, 930` consume SpinGeometry G4.1a; `TauCetiRoadmap/RiemannianGeometry/README.md:117, 1337, 1388` consume G1.2/G2.2/G3.4; `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:937, 1136` consume G1.1 and G4.1. Each pair is a two-way roadmap edge. The dependency check prints `depcheck: 205 roadmaps, 1673 edges, 0 problem(s)` only because none of the five roadmaps is in `ORDER.txt`; "suppliers are earlier in the merge order" has no solution for a pair that cite each other.

**Repair:** unchanged from the earlier rounds, and it cannot be done inside this diff alone: either split the shared early objects (the Clifford scalar trace and complexification of G1.3, the negative-form comparison of G1.1, the frame and rank-zero adapters of G4.1a, the finite exterior-module comparisons of G1.2/G2.2) into a foundations roadmap that both sides import, with the Dirac and index layers (G5–G6) as its consumer; or repoint the four reverse citations on main to that owner. Every target keeps its mathematics. Until one side is cut, the folder has no single direction of supply.

## R02 (P3) — The companion file computes values, lacks docstrings and still cites an unidentifiable source

**Location:** `TauCetiRoadmap/SpinGeometry/SourcePauliTargets.lean:9–11` ("the order recorded on the quantum Riemannian notes' page2 … page5's unclear matrix subscript"), `:26`, `:35`, `:39`, `:49`, `:89` (no docstrings).

**Claim:** the file is a companion of certificates for the G1.1 Checks.

**Witness:** every theorem is a 2×2 matrix identity closed by `fin_cases`/`simp` (file elaborates with exit 0 and no output), which is exactly the padding class "examples that compute values" and "declarations that mirror README Checks"; `native_quaternion_dictionary` restates `Quaternion.toComplexMatrix_apply` (Tau Ceti `Algebra/Quaternion/ComplexMatrix.lean:166–169`). The README no longer mentions any notes, so the docstring's "obscured quotient" and "unclear matrix subscript" refer to nothing a reader can open, in process language.

**Repair:** delete the file; the README's G1.1 Checks carry every identity with its value. If the project keeps companions, drop lines 8–12 in favour of one sentence naming the matrices, and docstring the five bare declarations.

## R03 (P3) — Process narrative and Mathlib pull-request numbers in References

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:950–956`: "Mathlib #41920 studies the positive-form pseudoscalar … Follow #44146's basis construction if adopted by Mathlib; build required interfaces in Tau Ceti now and replace equivalent declarations when supplied."

**Witness:** two pull-request numbers and a conditional plan ("if adopted", "now", "when supplied") that a reader a year from now cannot evaluate; inherited from main, untouched by this head.

**Repair:** delete the two sentences, or replace them by the mathematical fact (the positive-form pseudoscalar squares to `(−1)^(n(n−1)/2)` and is translated through G1.1's bivector sign).

## R04 (P3) — Only G1.1 has Checks and a `*Needs:*` line

**Location:** README G1.2–G6.7 (lines 190–918).

**Witness:** `grep -c '\*\*Checks\.\*\*'` is 1 and `grep -c '\*Needs:\*'` is 1, both in G1.1. The definitions `multiplicitySpace`, `chirality`, `positiveSpinors`/`negativeSpinors`, `diracInFrame`, `IsGeometricAction` and `cliffordScalarTrace` have API prose but no Checks bullets, and no target after G1.1 lists its inputs item by item. The gate accepts the `## G1.` heading style, so this is shape, not a rule failure.

**Repair:** three Checks per definition with computed values (the adversarial table below supplies them: for `cliffordScalarTrace` the Cl(0,1) and Q = 0 lines; for `chirality` the ℓ = 0 and ℓ = 1 values; for `multiplicitySpace` the S = ℂ², E = S ⊗ ℂ³ dimension count; for `IsGeometricAction` the c(e) = 1 negative control) and a `*Needs:*` line per target.

## Verified sound

**Scope of the check.** Both Lean files and the whole README read; the full diff against `origin/main` (174 changed README lines, `Suggested.lean` rewritten, companion +106) read line by line. Pins confirmed from `lake-manifest.json`: Tau Ceti `358314d4` (committed 2026-10-07) and Mathlib `f6090c70`; the scalar trace, Morita evaluation, `conjStar` and Fock modules the generated `STATUS.md` describes landed after that pin (the only `scalarTrace` at the pin is a private matrix helper in `Algebra/Lie/GeneralLinear/Clifford.lean:57`), so nothing in `Suggested.lean` duplicates a pinned declaration. Commands run from the worktree: `lake env lean TauCetiRoadmap/SpinGeometry/Suggested.lean` (exit 0; nine `declaration uses sorry` warnings at lines 56, 63, 70, 100, 126, 142, 148, 163, 197 and nothing else); `lake env lean TauCetiRoadmap/SpinGeometry/SourcePauliTargets.lean` (exit 0, no output); a scratch copy of the nine admitted theorems with `first | rfl | simp [defs] | infer_instance` (every one left an unsolved goal, so none is one-tactic padding; the ℓ = 0 instance `chirality Q ρ b = 1` does close by `simp [chirality]`); `#check` of the pinned carriers (`CovariantDerivative` with its 22 parameters and `toFun : (∀ x, V x) → ∀ x, TangentSpace I x →L[𝕜] V x`, `RiemannianBundle`, `OrthonormalBasis`, `ExteriorAlgebra.algebraMapInv`, `CliffordAlgebra.equivExterior` with `[Invertible 2]`, `LinearMap.mulLeft`, `QuadraticMap.PosDef`, `ModuleCat.matrixEquivalence`, `moritaEquivalenceMatrix`, `LinearMap.toMatrixAlgEquiv`, `Matrix.Module.smul_apply`, `EquivEven.Q' : QuadraticForm R (M × R)` with M first and e₀ last as README line 335 says, `star_ι`, `star_def`, `star_smul`, `TensorProduct.star_tmul`, `prodEquiv`, `Quaternion.ofComplex`). The worker's `signatures.md` matches my `#check` output; its "looks dropped" lead on `diracInFrame` is a false positive: `inst_7 : ∀ x, NormedAddCommGroup (W x)` and `inst_8 : ∀ x, InnerProductSpace ℂ (W x)` are in the elaborated type. No `set_option`, no admitted `example`, no sorry'd data, no computational algorithm, no copied passage.

The dependency command returned, in full: `depcheck: 205 roadmaps, 1673 edges, 0 problem(s)`; no UPWARD or CYCLE line. SpinGeometry, GeneralizedCohomology, CharacteristicClasses, RiemannianGeometry and SpinRepresentations are not in `ORDER.txt` (SpinGeometry is on main; not a defect), which is why R01 is invisible to it. PseudodifferentialOperators (ORDER line 9, open head of #952) and TangentialBordism (line 10) are earlier new-folder roadmaps; TangentialBordism B3.0 and IndexTheory I7.5 are cited only as downstream consumers.

**Library names in the README resolved at the pins** (one hit each, Tau Ceti unless marked): `CliffordAlgebra.evenUnitaryGroup` and `range_spinGroup_toUnits` (`Spin/EvenUnitary.lean:585`), `realCliffordSignatureSwitchRecurrenceEquiv (p q) : Cl(realCliffordForm (p+2) q) ≃ₐ Cl(realCliffordForm q p) ⊗ M₂(ℝ)` (`BottPeriodicity.lean:499`, so `0 0` is Cl(2,0) ≃ Cl(0,0) ⊗ M₂(ℝ) as line 165 says), `realCliffordZeroTwoEquivQuaternion_ι : ι v ↦ ⟨0, v 0, v 1, 0⟩` (`RealForm/Basic.lean:625`), `realCliffordForm` (`:112`), `Quaternion.toComplexMatrix_apply` (`ComplexMatrix.lean:166`: i ↦ [[i,0],[0,−i]] = iZ, j ↦ [[0,1],[−1,0]] = iY, k ↦ [[0,i],[i,0]] = iX, as line 169 says), `isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom` (`Topology/…/Spin/Covering.lean:52`), `instCompactSpaceRealCliffordSpinGroupZero` (`Compact.lean:265`), `pathConnectedSpace_realCliffordSpinGroupZero_add_two` (`Connected.lean:38`), `realCliffordSpinContinuousMulEquivUnitsRange` (`Real/Projection.lean:78`), `isEmbedding_specialOrthogonalToGeneralLinear`, `matrixSpecialOrthogonalEquivWeightedSumSquaresOne` (`WeightedSumSquares.lean:137`), `mem_range_specialOrthogonalToGeneralLinear_realCliffordForm_iff` (`RealSpecialOrthogonal.lean:100`), `realCliffordForm_zero_eq_weightedSumSquares_one`, `realCliffordSpinToSpecialOrthogonalRange_surjective` (`:175`), `realCliffordSpinToSpecialOrthogonalSmoothRange`, `…RangeLieMap_eq_lieMap` (`Geometry/Lie/…/Projection.lean:298`), `…CoordinateLieHom_eq_bivectorEquivSo`, `leftInvariantDerivationLieEquivGroupLieAlgebra_lieMap` (`Lie/Functor.lean:195`), `isLocalDiffeomorph_of_mfderiv_eq` (`LocalDiffeomorph.lean:428`), `nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed`, `Representation.IsQuaternionicStructure` (`QuaternionicStructure.lean:68`: fields `sq_eq_neg` and `isIntertwining`, as line 876 says; no evenness theorem there, so `even_finrank_of_conjLinear_square_neg` is not a duplicate), `TauCeti.spinAction` (`Polarization/CliffordAction.lean:230`), `SpinPolarizationData.cliffordEquivEnd`; Mathlib `Matrix.linftyOpNormedRing` (`Analysis/Matrix/Normed.lean:404`), `Matrix.Module.matrixModule` (`LinearAlgebra/Matrix/Module.lean:36`, scoped), `RingTheory/Morita/Matrix.lean`. The module docstring's "not statable" claims hold at the pins: the only Stiefel–Whitney classes are the field-theoretic ones (`FieldTheory/QuadraticForm/StiefelWhitney/`), the only Sobolev spaces are real `W^{k,p}(Ω)` on Euclidean domains (`Analysis/Sobolev/Wkp/Basic.lean:13–15`), and no declaration named a Dirac operator exists.

**Cross-roadmap citations resolved on main:** GeneralizedCohomology `## G5.` (`README.md:1373`, anchor as cited), TopologicalKTheory `## T7.` (`:1148`), ComplexKahlerGeometry `## K5.` (`:568`), CharacteristicClasses, RiemannianGeometry, SmoothBundlesConnections, DifferentialGeometry, AlgebraicTopology, `Completed/OrthogonalSpinGroups`, `Completed/HopfRinow`, `RepresentationTheory/SpinRepresentations` all exist at the linked paths. GeneralizedCohomology `:1908–1912` consumes exactly the objects G1.3 defines (`cliffordScalarTrace`, its regular-trace formula, τ_ℂ).

**Ownership.** `roadmaps grep` over the 440 open pull requests and main: `cliffordScalarTrace` is consumed by TemperleyLiebOperatorAlgebras (#867, `README.md:319`) and GeneralizedCohomology on main, declared nowhere else; `multiplicitySpace`, `Hom_Cl(`, `IsGeometricAction`, `cliffordMultiplication`, `diracInFrame`, `positiveSpinors`, `chirality`, `even_finrank_of_conjLinear` occur in no other roadmap's `Suggested.lean`; the Pauli matrices appear in TemperleyLiebOperatorAlgebras (`:876`, same matrices), LocalVariationalFieldTheory (`:676–677`, order (σ₃,σ₁,σ₂)) and NoncompactQuantumSymmetry (`:418`), none owning a dictionary for SpinGeometry's planes. The board's package index lists no competing package. Two open pull requests revise this folder (#1674 at 60cedda and this one); they touch different passages (G4.4a/G5/G6.0 versus G1.1, G1.3, `Suggested.lean`), and ownership between them was not otherwise checked.

**Source sample.** The brief names no target ids; the README has fifteen located claims after this head, and all fifteen were opened in `nicolaescu` (cache `d9ab8c5d…`, author copy, printed page = PDF page − 12, checked at Theorem 12.2.33: marker `=== page 685 ===` at line 31098, printed p. 673 at line 31099).

| Target (README line) | Locator | Passage | Finding |
| --- | --- | --- | --- |
| G1.2 (207) | Def. 12.1.10, p. 626 | line 29261: uv + vu = −2q(u,v)·1 | matches `cliffordMultiplication_anticommutator` with q = ⟨·,·⟩ |
| G1.3 (214) | Prop. 12.1.19, p. 630 | line 29392: Cl(V) ≅ End_ℂ(S) for even dim, not natural | matches the hypothesis ρ : Cl ≃ₐ End ℂ S |
| G1.3 (223) | Cor. 12.1.22, p. 632 | line 29466: every Cl_{2k}-module is S ⊗ W, W arbitrary; Rem. 12.1.23 W = Hom_Cl(S,E) | matches `exists_multiplicityEvaluation`, nothing on E |
| G1.3 (283) | §12.1.2, pp. 626–629 | line 29361 (printed p. 628): ordered monomials e_{i₁}⋯e_{i_k} form a basis | supports the trace theorem's basis step; the trace itself is not in Nicolaescu (computed below) |
| G1.4 (332) | Lemma 12.1.29, p. 634 | line 29553–29557: Ψ(x⁰ + x¹) = x⁰ + e₀x¹ | matches line 333–334 |
| G2.2 (377) | eq. (12.1.1), p. 633 | line 29514: Γω = i^{k+p(p−1)} ∗ω | matches |
| G3.3 (439) | Def. 12.1.64 (a2), p. 653 | line 30311–30312: ∇_X(c(α)u) = c(∇^M_X α)u + c(α)∇_X u | matches, with α a 1-form (musical to the README's vector) |
| G3.4 (449) | §12.2.1, p. 657 | line 30489–30491: d + d* is a geometric Dirac operator | matches |
| G4.3 (547) | Prop. 12.2.25, p. 669 | line 30950: spin structure iff w₂ = 0, manifolds | matches; the README's paracompact extension is C3.5's |
| G4.4 (553) | Rem. 12.2.28, p. 669; Ex. 12.2.35, p. 673 | lines 30957, 31121–31126: isomorphism via ε_α ∈ ℤ₂, H¹(T³;ℤ₂) acts freely and transitively | matches |
| G6.1 (775) | Prop. 12.1.66, p. 655 | line 30370–30392: formal self-adjointness via skew-Hermitian c(eⁱ) at normal coordinates | matches |
| G6.2 (820) | Thm. 12.1.67, p. 656 | line 30422–30424 with c(F) = Σ_{i<j} c(eⁱ)c(eʲ)F_ij at line 30418–30421 | matches the README's Σ_{i<j} form |
| G6.0/G6.3 (699, 828) | Thm. 12.2.33, p. 673 | line 31100–31101: D² = ∇*∇ + s/4 | matches |
| G6.4 (837) | Prop. 12.2.1, p. 657 | line 30497–30498: (g, ∇^g) is a Dirac structure with d + d* its operator | matches |
| G6.6 (862) | §12.2.3, p. 672 | line 31068 (printed p. 672): D̸ : C^∞(S⁺) → C^∞(S⁻) has symbol Clifford multiplication | matches |

**Adversarial table.** A = [[0,−1],[1,0]] and B = [[0,i],[i,0]] are the two-plane generators (A² = B² = −Id, AB + BA = 0); Γ = iAB = diag(1,−1). "Pass" means both sides agree on the instance.

| Statement / location | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `cliffordScalarTrace` is the degree-0 coefficient (`Suggested.lean:48`) | orthogonal e₁, e₂ | `changeForm_ι_mul_ι`: e₁e₂ ↦ e₁∧e₂ − B(e₁,e₂) = e₁∧e₂, degree-0 part 0; 1 ↦ 1; e₁e₁ = Q(e₁) ↦ Q(e₁) | Pass (Mathlib `Contraction.lean:279–285`) |
| `cliffordScalarTrace_mul_two_pow` (`:56`) | Cl(0,1), a = x + ye, e² = −1 | L_a = [[x,−y],[y,x]], tr = 2x; 2¹·τ(a) = 2x | Pass |
| same | V = 0 | 2⁰·τ(a) = a = tr(L_a) on a 1-dim algebra | Pass |
| same, degenerate Q | V = ℝ, Q = 0, a = x + ye, e² = 0 | L_a = [[x,0],[y,x]], tr = 2x = 2·τ(a) | Pass (every Q, as the docstring says) |
| same, general I | e_I with I ≠ ∅ | e_I e_J = ±(scalars)·e_{IΔJ}, never diagonal, tr = 0 = 2ⁿ·0 | Pass |
| `_reverse_mul_self_nonneg` (`:63`) | orthogonal basis, a = Σ a_I e_I | reverse(e_I)e_I = Π_{i∈I} Q(e_i) > 0; cross terms degree > 0, τ = 0; total Σ a_I² Π Q(e_i) ≥ 0 | Pass |
| `_reverse_mul_self_eq_zero_iff` (`:70`) | a = e₁ with Q(e₁) = 1; a = 0; Q = 0 negative control | τ = 1 ≠ 0; τ = 0; with Q = 0, a = e: reverse(e)e = 0 so τ = 0 with a ≠ 0, which is why `PosDef` is required | Pass |
| `multiplicitySpace` (`:87`) | S = ℂ², E = S ⊗ ℂ³ | dim Hom_Cl(S,E) = 3; 2·3 = 6 = dim E | Pass |
| `exists_multiplicityEvaluation` (`:100`) | S = ℂ (V = 0), E = ℕ →₀ ℂ; E = 0 | ℂ ⊗ Hom(ℂ,E) → E, 1 ⊗ T ↦ T(1), bijective; 0 ≅ 0 | Pass, no finiteness on E |
| same, why S is finite-dimensional | S infinite-dimensional | End(S)·e·End(S) is the finite-rank ideal, so S is not a generator and the counit fails | hypothesis needed, present |
| `IsGeometricAction` (`:119`) excludes the wrong models | c(e) = 1 on ℂ; c(e) = i (Hermitian? no: i is skew) with Q(e) = +1 | 1² = 1 ≠ −1 and 1† ≠ −1; Q(e) = 1 ≠ −‖e‖² | Pass (negative controls) |
| `cliffordMultiplication_anticommutator` (`:126`) | v = w = e₁; e₁ ⊥ e₂; v = 0 | 2A² = −2Id = (−2·1)·1; AB + BA = 0 = (−2·0)·1; 0 = 0 | Pass; uses `ι_mul_ι_add_swap` and only the first conjunct |
| `chirality` (`:136`) | ℓ = 0; ℓ = 1 | empty product, I⁰ = 1, Γ = 1 (closes by `simp`); iAB = diag(1,−1) | Pass |
| `chirality_sq` (`:142`) | ℓ = 1; general ℓ | (iAB)² = −(AB)² = −(−Id) = Id; (c₁⋯c_{2ℓ})² = (−1)^{ℓ(2ℓ−1)}(−1)^{2ℓ} = (−1)^ℓ, times I^{2ℓ} = (−1)^ℓ gives 1 | Pass |
| `chirality_anticommutes` (`:148`) | ℓ = 1, v = e₁; V = 0 | ΓA = [[0,−1],[−1,0]] = −AΓ; 1·0 = −(0·1) | Pass (even-dimensional volume anticommutes with vectors) |
| `isCompl_spinors` (`:163`) | plane; S = 0 | ker(Γ−1) = ⟨e₁⟩, ker(Γ+1) = ⟨e₂⟩, complementary via (1±Γ)/2; ⊥ and ⊥ are complementary in 0 | Pass |
| `diracInFrame_eq` (`:197`) | frames (e₁,e₂) and (e₂,−e₁); c = 0; n ≠ dim | c₁D₁ + c₂D₂ = c₂D₂ + (−c₁)(−D₁); 0 = 0; no orthonormal basis indexed by Fin n, vacuous | Pass (trace of the bilinear map (u,v) ↦ c(u)(Dv)) |
| `even_finrank_of_conjLinear_square_neg` (`:213`, proved) | V = ℂ², J(z₁,z₂) = (−z̄₂, z̄₁); V = ℂ | J² = −Id, dim 2 even; dim 1 needs a·ā = −1, impossible | Pass; the proof elaborates |
| G1.1 Pauli products (158–161) | XY, YZ, ZX; [X,Y] | [[i,0],[0,−i]] = iZ; [[0,i],[i,0]] = iX; [[0,1],[−1,0]] = iY; iZ − (−iZ) = 2iZ | Pass |
| G1.1 positive plane (177–180) | XZ; (XZ)²; coordinate determinant of (Id, X, Z, XZ) | [[0,−1],[1,0]] = −iY; −Id; rows (1,0,0,1),(0,1,1,0),(1,0,0,−1),(0,−1,1,0) give det 4 | Pass |
| G1.1 "the universal map is an isomorphism" (179) | dimensions | image spans M₂(ℝ), dim 4 = 2²; `positiveVector_square` matches `realCliffordForm 2 0 v = v₀² + v₁²` | Pass |
| G1.1 negative plane (181–182) | e₁, e₂, e₁e₂ | `realCliffordZeroTwoEquivQuaternion_ι`: e₁ ↦ i ↦ iZ, e₂ ↦ j ↦ iY; (iZ)(iY) = −ZY = iX = image of k; each square −Id | Pass |
| G1.1 negative control (183–188) | XYZ, ZYX; H = (X+Z)/√2 | i·Id, −i·Id; H² = Id, HXH = Z, HZH = X, HYH = −Y | Pass |
| G1.1 cyclic sign of (Z,Y,X) (185–186) | ZY, YX, XZ | −iX, −iZ, −iY | Pass |
| G1.1 "differ by an inner automorphism" (167) | two isomorphisms Cl(2,0) ≅ M₂(ℝ) | M₂(ℝ) central simple over ℝ: Skolem–Noether | Pass |
| G1.3 τ_ℂ positivity (298) | b positive line; b = 0 line | τ(a*a) = \|x\|² + \|y\|²; null set ℝe = ideal(e) = ideal(rad b) | Pass |
| G1.4 Ψ dictionary (333–334) | e_j ↦ e₀e_j with Q(e₀) = Q(e_j) = −1 | (e₀e_j)(e₀e_j) = −e₀²e_j² = −(−1)(−1) = −1 = e_j², and e₀e_j is even | Pass |
| G2.2 Γω = i^{ℓ+p(p−1)}∗ω (377) | n = 2, p = 0, 1, 2 | Γ1 = ie₁₂, Γe₁ = ie₂, Γe₁₂ = −i; phases i, i, −i | Pass |
| G6.2 curvature term (820) | Nicolaescu's c(F) | Σ_{i<j} c(eⁱ)c(eʲ)F_ij = ½Σ_{i,j} | Pass |
| G6.3 Lichnerowicz (828) | round S² | R^S₁₂ = −AB/2, contraction gives Id/2 = Scal/4 with Scal = 2 | Pass |
| G6.7 index 2α (900–902) | kernels of quaternionic dims r, s | complex dims 2r, 2s; index 2(r − s) | Pass |
| G6.7 raw volume (905–909) | n = 4 | ω₋² = 1; Γ = i²ω₋ = −ω₋ | Pass |
| Companion `source_cyclic_products` wrap | i = 2 | i+1 = 0, i+2 = 1 in Fin 3: XZ = −iY | Pass (no junk index) |

**Headline theorems.** Statable and stated: the normalized scalar trace and its positivity (G1.3), the Morita evaluation (G1.3), the negative-metric Clifford relation (G1.2), chirality square, anticommutation and splitting (G2.1), frame independence of the Dirac contraction (G6.1), the quaternionic parity (G6.7). Not statable and named in the docstring with the missing carrier: Lichnerowicz and Bochner (no Clifford-module bundle with connection), the closed H¹ realization (no bundle Sobolev spaces), spin existence and the H¹ torsor (no principal Spin bundle, no Čech w₂), the KO index class (no real Clifford classifier), ind D⁺ = 2α (no spinor bundle). No statable headline is absent; nothing is forced through a stand-in.

## Not verifiable

- Lawson–Michelsohn, *Spin Geometry*, Theorems II.1.7 (spin structures and the H¹ torsor), II.8.2 (Bochner identity) and II.8.8 (Lichnerowicz): paywalled, recorded `uncertified` in the manifest; cited by locator only, and the three statements are checked against Nicolaescu and by computation above instead.
- Atiyah–Bott–Shapiro, *Clifford modules* (G2.3, G6.0): paywalled, `uncertified`; the graded-product rank check is in the table.
- The worker's 15-target sample: no target list or seed was supplied; the fifteen located claims above are this review's own sample.
- Ownership against open pull requests whose files the brief does not give was not checked beyond `roadmaps grep`.

## Source issues

- none (no new misprint found in `nicolaescu` at the fifteen passages opened; the earlier rounds' Nicolaescu notes stand and are not repeated).
