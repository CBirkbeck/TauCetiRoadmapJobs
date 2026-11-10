# Review of SpinGeometry (pull request #1780 at 30cc27d)

**Verdict:** needs changes

Incremental re-review of `TauCetiRoadmap/SpinGeometry/` at `30cc27d`. The previous review read `ab00492`. Since then the folder has changed by 0 lines, and no file outside it differs from main (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty). The head is a merge of main (`f8836c4`), which moved the pins of `lake-manifest.json` and `lean-toolchain`: Mathlib `f6090c70` → `1b1ccf4b`, Tau Ceti `358314d4` → `2fd255d9`, Lean v4.36.0-rc2. That pin move is the change reviewed here. The gate passes and the file elaborates. However, at the new Tau Ceti pin seven of the nine admitted headline theorems, and the G1.3/G2.1/G2.2 objects they come from, are library theorems. One blocking finding follows.

## R01 (P2) — The new Tau Ceti pin proves seven of the nine admitted headlines and owns the G1.3/G2.1/G2.2 objects

**Location.**
- `TauCetiRoadmap/SpinGeometry/Suggested.lean:56, 63, 70, 100, 142, 148, 163`: `cliffordScalarTrace_mul_two_pow`, `cliffordScalarTrace_reverse_mul_self_nonneg`, `cliffordScalarTrace_reverse_mul_self_eq_zero_iff`, `exists_multiplicityEvaluation`, `chirality_sq`, `chirality_anticommutes`, `isCompl_spinors`.
- The definitions that exist only to state them, at `:48, 87, 136, 155, 159`.
- `README.md:19–28`: "Tau Ceti already has … raw orthogonal-product volume identities and real algebraic eight-periodicity … G1–G2 supply the geometric metric/complexification/chirality comparisons with those objects."
- G1.3 (`README.md:241–357`), G2.1 (`:442–452`) and G2.2 (`:497`).

**Claim.** The README presents the following as targets of this roadmap, and `Suggested.lean` admits seven of them as headlines still to be proved:
- the scalar trace with its regular-trace formula, cyclicity, invariances, positivity and faithfulness, and the null set of the trace pairing;
- the conjugate-linear Clifford star and the compatible positive metric, unique up to a positive scalar;
- the multiplicity evaluation `S⊗Hom_Cl(S,E) ≃ E`;
- the normalized volume Γ: frame independence, Γ² = 1, anticommutation, the ±1 splitting with its projections, and Γ on forms.

**Witness.** At the now-pinned Tau Ceti `2fd255d9`, `cliffordScalarTrace Q = CliffordAlgebra.scalarTrace Q` holds by `rfl`. A scratch copy of the seven statements, verbatim with the file's definitions, is proved from the declarations below with no error and no `sorry`.

**Repair.**
1. `Suggested.lean`: delete the seven theorems and `cliffordScalarTrace`, `multiplicitySpace`, `chirality`, `positiveSpinors` and `negativeSpinors`. Say in the module docstring that these algebraic headlines are theorems of the pinned Tau Ceti, and name them. What remains is `cliffordMultiplication_anticommutator` (with `cliffordMultiplication` and `IsGeometricAction`), `diracInFrame_eq` and `even_finrank_of_conjLinear_square_neg`. This is the same change that #1674 at `8fa7f9b` already made to its `Suggested.lean`; the description orders #1674 first and this pull request is to be rebased onto it, so the rebase must not re-add these statements.
2. `README.md:16–28` (the Tau Ceti suppliers): cite, by exact name and file at `2fd255d9`:
   - `CliffordAlgebra.scalarTrace` (`LinearAlgebra/CliffordAlgebra/ScalarTrace/Basic.lean:102`), `scalarTrace_involute` (:133), `scalarTrace_reverse` (:140), `scalarTrace_mul_comm` (:161), `trace_mulLeft_eq_two_pow_mul_scalarTrace` (:250), `scalarTrace_eq_of_algEquiv` (:268);
   - `scalarTrace_reverse_mul_self_nonneg` and `scalarTrace_reverse_mul_self_eq_zero_iff` (`CliffordAlgebra/OrthogonalBasis.lean:515, 542`);
   - from `ScalarTrace/Positivity.lean`: `scalarTrace_conjStar_mul_self_nonneg` (:291), `scalarTrace_complexConj_reverse_mul_self_eq_zero_iff_mem_span_radical` (:300), `scalarTrace_conjStar_mul_self_eq_zero_iff` (:336), `posDef_iff_forall_scalarTrace_reverse_mul_self_eq_zero` (:347);
   - `CliffordAlgebra.complexConj` and `CliffordAlgebra.conjStar` (`CliffordAlgebra/Complexification.lean:71, 154`);
   - `exists_sesqForm_map_eq_map_conjStar` (`Hermitian/Spinor.lean:78`), `existsUnique_pos_mul_of_surjective` (`Hermitian/Complex.lean:140`) and `TauCeti.multiplicityMetric` (`Hermitian/Multiplicity.lean:62`);
   - `TauCeti.isotypicTensorEquivOfBijective` (`RingTheory/Morita/ModuleEnd.lean:184`);
   - `CliffordAlgebra.volumeElement` (`VolumeElement/Oriented.lean:89`) with `volumeElement_eq` (:198), `volumeElement_mul_ι_of_even` (:229) and `volumeElement_mul_self` (:243);
   - from `VolumeElement/Complex.lean`: `CliffordAlgebra.complexVolume` (:94), `complexVolume_neg_orientation` (:106), `complexVolume_eq` (:112), `conjStar_complexVolume` (:208), `complexVolume_mul_eq_involute_mul` (:236), `complexVolume_mul_self` (:279);
   - from `VolumeElement/Eigenspace.lean`: `isCompl_eigenspace_complexVolume` (:218) and the two projection lemmas (:239, :250);
   - `eigenspaceTwistingGradingEquiv` (`VolumeElement/GradedModule.lean:179`), `baseChangeExteriorAction_complexVolume_of_eq_two_mul` (`VolumeElement/HodgeStar.lean:149`), and `TauCeti.isCompl_eigenspace_one_neg_one` (`LinearAlgebra/Eigenspace/Separation.lean:71`).

   All the `CliffordAlgebra/…` paths are under `TauCeti/LinearAlgebra/`.
3. G1.3, G2.1 and G2.2: replace each target the list covers with a citation. Keep only what goes beyond the library, each item with one clause saying how it differs: for instance the Fock and exterior Gram comparisons, the odd-dimensional ψ comparison, and, if a consumer needs it, the frame-ordered form `Γ = i^ℓ ρ(e₁⋯e_(2ℓ))` in `Module.End ℂ S` for a real algebra map ρ (that is ρ applied to `volumeElement_eq`). Drop the backticked names of the deleted declarations (`:250, 253, 309, 313, 333–334, 442, 445, 448, 450, 474–475, 489`). Keep their Checks as prose about the library objects.
4. Keep the ids G1.3, G2.1 and G2.2. In G1.3, add one sentence saying that the scalar trace formerly named `cliffordScalarTrace` is Tau Ceti's `CliffordAlgebra.scalarTrace`: GeneralizedCohomology on main (`README.md:1908`) consumes "SpinGeometry G1.3's `cliffordScalarTrace`".

**Tested on the refuting instance.** These are the proofs in the scratch copy. At this head they elaborate with no error and no `sorry`.
- The regular-trace formula is `(trace_mulLeft_eq_two_pow_mul_scalarTrace a).symm`.
- Positivity and faithfulness: take an orthogonal basis from `LinearMap.BilinForm.exists_orthogonal_basis`, then apply `scalarTrace_reverse_mul_self_nonneg` or `_eq_zero_iff`, with `hQ (b i) (b.ne_zero i)`.
- Chirality: `chirality Q ρ b = I^ℓ • ρ (volumeElement Q b.toBasis.orientation)` follows from `volumeElement_eq`, `OrthonormalBasis.isOrthoᵢ_associated` and `map_list_prod`. Then `volumeElement_mul_self` with `(2ℓ+1)/2 = ℓ` gives Γ² = 1, `volumeElement_mul_ι_of_even` gives anticommutation, and `TauCeti.isCompl_eigenspace_one_neg_one` gives the splitting. These proofs use only the clause `Q v = −⟨v,v⟩` of `IsGeometricAction`.
- Evaluation: put module structures on S and E along ρ and σ with `Module.compHom`, check that `Algebra.lsmul` is ρ (so it is bijective), and identify `S →ₗ[Cl] E` with `multiplicitySpace` by a ℂ-linear equivalence. `isotypicTensorEquivOfBijective`, restricted to ℂ, then sends `s ⊗ T` to `T s`.

With the seven statements deleted, `diracInFrame_eq` remains admitted: the pin has no Dirac contraction. So does `cliffordMultiplication_anticommutator` (see the remark below).

## Previous findings

The ids below are those of the previous report (PRREVIEW-SpinGeometry~19 at `ab00492`).

- R01 — not repaired: `README.md:14` "supplied by [SpinRepresentations L0–L4,L7,L9]" and `:42`, `:56`, `:67` are unchanged. Main at `4452ffa` still cites back: SpinRepresentations `:937–938, 1136–1137`; RiemannianGeometry `:124, 1367, 1418`; GeneralizedCohomology `:41–42, 1067, 1071, 1385, 1908`; CharacteristicClasses `:1195, 1214, 1994`. Settled; not re-raised (reason under Verified sound).
- R02 — repaired: #1674 at `8fa7f9b` now states nothing in its `Suggested.lean` (namespace `TauCetiRoadmap.SpinGeometry`, no declaration), so there are no shared fully qualified names. The description states the order "#1674 (SpinGeometry) → **this pull request** (#1780)".

## Verified sound

**What changed.** `git diff ab00492 HEAD -- TauCetiRoadmap/SpinGeometry` is empty. Against main, the pull request's diff is `README.md | 807` and `Suggested.lean | 234`, nothing else. The merge base is main `f8836c4`. `lake-manifest.json` (235 lines) and `lean-toolchain` changed with main. `.lake/packages/mathlib` is at `1b1ccf4b` and `.lake/packages/TauCeti` at `2fd255d9`, as the manifest says. The worktree is clean.

**Gate.** The worker's run passes with `build=0`. My run at `30cc27d`: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.

**Dependency check.** `gate --depcheck … --movable --pr 1780` prints `depcheck: 234 roadmaps, 2263 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line for SpinGeometry.

**Elaboration at the new pins.** `lake env lean TauCetiRoadmap/SpinGeometry/Suggested.lean` exits 0 in 10 s. It prints exactly nine `declaration uses sorry` warnings (lines 56, 63, 70, 100, 126, 142, 148, 163, 197) and nothing else: no deprecation and no error. The proved `even_finrank_of_conjLinear_square_neg` (:213) elaborates without `sorry` at the new Mathlib.

**Signatures.** I elaborated a scratch copy with `#check @name` for all 18 declarations at the new pins. Every type is the one `signatures.md` records and the previous review compared with the README; nothing changed. The three trace theorems carry `[FiniteDimensional ℝ V]`, and the positivity pair also carries `Q.PosDef`. `exists_multiplicityEvaluation` carries `ρ : CliffordAlgebra Q ≃ₐ[ℂ] Module.End ℂ S`, `[FiniteDimensional ℂ S]` and `[Nontrivial S]`. `diracInFrame` and `diracInFrame_eq` keep `[∀ x, InnerProductSpace ℂ (W x)]`, `[FiberBundle F W]` and `[Bundle.RiemannianBundle …]`, so the worker's single "lost binder" lead on `diracInFrame` is again a false positive.

**One-tactic probe at the new pins.** Each `sorry` of a scratch copy was replaced by `first | (simp; done) | (rfl; done) | (infer_instance; done) | (exact?; done) | sorry`. It exits 0 in 113 s with the same nine `sorry` warnings and no `Try this`. No admitted statement closes in one tactic; R01 is about few-line consequences of the library, not one-tactic padding.

**Library names cited by the README, re-resolved at the new pins** (the change could have broken them):
- A scratch file with `import Mathlib`, the 24 Tau Ceti modules involved and 70 `#check @…` lines elaborated. 69 names resolved as written.
- `SpinPolarizationData.cliffordEquivEnd` resolves as `TauCeti.SpinPolarizationData.cliffordEquivEnd` (`RepresentationTheory/Spin/Structure.lean:180`). The README names it right after `TauCeti.spinAction` under "Tau Ceti already has", as at the old pin.
- Three names in modules without object files were read in source: `CliffordAlgebra.equivEvenProdOfOddLength` (`OddSplitting.lean:388`), `Representation.IsQuaternionicStructure` (`RepresentationTheory/QuaternionicStructure.lean:72`) and `TauCeti.CliffordAlgebra.realCliffordSpinToSpecialOrthogonalCoordinateLieHom_eq_bivectorEquivSo` (`Geometry/Lie/CliffordAlgebra/Spin/Differential.lean:246`).
- The six Tau Ceti paths the README quotes exist at `2fd255d9`: `LinearAlgebra/CliffordAlgebra/Lipschitz/Action.lean`, `Topology/Algebra/CliffordAlgebra/Spin/Covering.lean`, `…/Spin/Compact.lean`, `Geometry/Lie/CliffordAlgebra/Spin/Projection.lean`, `…/Spin/Differential.lean` and `RepresentationTheory/QuaternionicStructure.lean`.
- Mathlib at `1b1ccf4b`: `CovariantDerivative` (`Geometry/Manifold/VectorBundle/CovariantDerivative/Basic.lean:366`, `toFun : (Π x, V x) → Π x, TangentSpace I x →L[𝕜] V x`, so `diracInFrame_eq`'s linearity premise stands), `Bundle.RiemannianBundle` (`Topology/VectorBundle/Riemannian.lean:420`), `CliffordAlgebra.equivExterior` (`Contraction.lean:351`, `[Invertible 2]`), `ExteriorAlgebra.algebraMapInv` (`Basic.lean:151`), `LinearMap.mulLeft` (`Defs.lean:1018`), `QuadraticMap.PosDef` (`QuadraticForm/Basic.lean:1090`), `CliffordAlgebra.star_ι` (`Star.lean:50`), `Quaternion.ofComplex` (`Analysis/Quaternion.lean:138`), `moritaEquivalenceMatrix` (`RingTheory/Morita/Matrix.lean:205`) and `Matrix.Module.matrixModule` (a scoped instance, `LinearAlgebra/Matrix/Module.lean:36`).

**Reciprocal supplier edges (the previous R01), not re-raised.** The repair rounds marked this not actionable in this folder because the four reverse citations are in folders on main. That reason is correct:
- The forward citations (`README.md:14, 42, 56, 67`) are also on main's own copy of this README, so the cycle predates the pull request.
- The sections the four roadmaps consume (G1.1, G1.2, G1.3, G2.2, G3.4, G4.1a, G4.1b) cite none of them back, so the section-level order is acyclic (the previous report's dependency row; the `*Needs:*` lines are unchanged).
- No edit inside this folder removes the edge without re-planning SpinRepresentations L0–L4, RiemannianGeometry R1/R5/R7, CharacteristicClasses C1/C3.5 or GeneralizedCohomology G5.5.
- The dependency check reports 0 problems.

The review of the sibling #1674 (~15, ~20) treats the same edges as settled. The open loop-cutting revisions #1807 and #1854 still cite SpinGeometry in CharacteristicClasses (2 and 7 mentions) and GeneralizedCohomology (15 and 14). One part of the edge goes away with R01's repair: once G1.3's scalar trace is Tau Ceti's `CliffordAlgebra.scalarTrace`, GeneralizedCohomology `:1908` can cite Tau Ceti instead of SpinGeometry. That is a change to GeneralizedCohomology, not to this folder.

**Overlaps (`overlaps.md`, each item checked).**
- #1674 conflicts with this pull request in both files. The order is stated in the description's merge-order block, and #1674 at `8fa7f9b` already carries the `Suggested.lean` change that R01 asks for here.
- The ComplexKahlerGeometry anchor `#k5-compact-hermitian-elliptic-theory-and-serre-duality` cited at `README.md:81` is mapped by all four revisions that drop it:
  - #1234 (`e86d496`): the sentence "K5 is now Layer 5", with the label K5a kept;
  - #1807 (`da5e14d`): the former-numbering list, line 551;
  - #1808 (`705e4f6`): line 567;
  - #1854 (`48aba52`): the "Former numbering" table, lines 515–530.

  So the citation stays valid and needs no change.
- No id that this pull request drops is cited elsewhere. The closest-vocabulary roadmaps (SpinRepresentations #1207, IndexTheory #1077, SpectralManifolds #1158, GeneralizedCohomology #1187/#1807) were not re-audited: none of their objects is touched by the change.

**Sources.** The seeded sample does not fall in a changed passage (none exists). For the passages R01 touches I re-opened the cached `nicolaescu` text (printed page = marker − 12):
- Corollary 12.1.22 at `nicolaescu` line 29466 (marker 644, printed p. 632): every complex Cl_2k-module is S_2k ⊗ W, as G1.3 `:253` cites;
- the ordered-monomial basis at `nicolaescu` line 29360 (marker 641, p. 629), as `:313` cites.

The other 17 locators are carried from the previous report's table.

**Adversarial table.** The rows for statements the pin move leaves untouched are carried from PRREVIEW-SpinGeometry~19, with its computed values (Pauli matrices X, Y, Z; Clifford elements as coordinate tuples). The rows for the seven statements R01 touches were recomputed this round with a pure-Python script (Clifford products by blade sorting; 2×2 and 4×4 complex matrices).

| Statement / location | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| G1.1 Pauli dictionary (`:167–198`), carried | X, Y, Z; H = (X+Z)/√2 | XY = iZ, YZ = iX, ZX = iY; XYZ = i·Id, ZYX = −i·Id; HYH = −Y | Pass (~19) |
| G1.2 `IsGeometricAction`, `cliffordMultiplication_anticommutator` (Lean 119, 126), carried | c(e₁) = iZ, c(e₂) = iY; V = ℝ, c = 1 | (iZ)² = −Id; c₁c₂ + c₂c₁ = 0; c = 1 squares to +1 ≠ −1 and is Hermitian: both clauses fail | Pass (~19) |
| G1.3 `cliffordScalarTrace_mul_two_pow` (Lean 56) vs `trace_mulLeft_eq_two_pow_mul_scalarTrace` | n = 2, a = 1.5 + 2e₁ − 0.5e₂ + 3e₁e₂, q ∈ {(1,1), (−1,−1), (1,−1), (0,1)} | tr(L_a) = 6.0 and 2²·τ(a) = 6.0 for all four forms; neither statement has a hypothesis on Q; τ = `scalarTrace` by `rfl` | Same statement: R01 |
| G1.3 `…_reverse_mul_self_nonneg` (Lean 63) vs `scalarTrace_reverse_mul_self_nonneg` | same a | τ(reverse(a)a) = Σ a_I² Π q: (1,1): 15.5 ≥ 0; (1,−1): −3.0 < 0, so `Q.PosDef` (present in both) is needed | Same statement: R01 |
| G1.3 `…_eq_zero_iff` (Lean 70) vs `scalarTrace_reverse_mul_self_eq_zero_iff`, `posDef_iff_forall_…` | q = (0,1), a = e₁ | τ(reverse(e₁)e₁) = 0.0 with e₁ ≠ 0: faithfulness fails without definiteness, which is exactly the library's `posDef_iff` | Same statement: R01 |
| G1.3 `exists_multiplicityEvaluation` (Lean 100) vs `isotypicTensorEquivOfBijective` | S = ℂ², E = ℂ² ⊗ ℂ³ | dim Hom_Cl(S,E) = 3, 2·3 = 6 = dim E; the library asks for finite projective S and bijective `lsmul` (= ρ an equivalence), nothing on E; ours adds `[Nontrivial S]` | Library at least as general: R01 |
| G2.1 `chirality_sq` (Lean 142) vs `volumeElement_mul_self` | ℓ = 1, c = (iZ, iY); ℓ = 2, c = (iX⊗I, iY⊗I, iZ⊗X, iZ⊗Y) (relations c_ic_j + c_jc_i = −2δ_ij checked); ℓ = 0 | ℓ = 1: ρ(vol) = iX, vol² = −Id = (−1)^((2+1)/2), Γ = i·iX = −X, Γ² = Id; ℓ = 2: vol² = +Id = (−1)^((4+1)/2), Γ = i²·vol = diag(1,−1,−1,1), Γ² = Id; ℓ = 0: i⁰·(empty product) = Id | Same statement after applying ρ: R01 |
| G2.1 normalization of `chirality` vs `complexVolume` | n = 2ℓ, ℓ = 0, 1, 2 | `complexVolume` uses i^((n+1)/2) = i^0, i^1, i^2; `chirality` uses i^ℓ = i^0, i^1, i^2 | Same Γ |
| G2.1 `chirality_anticommutes` (Lean 148) vs `volumeElement_mul_ι_of_even` | as above | Γc_k + c_kΓ = 0 for k = 1, 2 (ℓ = 1) and k = 1, …, 4 (ℓ = 2) | Same statement after applying ρ: R01 |
| G2.1 `isCompl_spinors` (Lean 163) vs `isCompl_eigenspace_one_neg_one` | ℓ = 1; ℓ = 2 | ℓ = 1: Γ = −X, S⁺ = span(1,−1), S⁻ = span(1,1); ℓ = 2: tr Γ = 0, ranks 2 and 2 | Same statement: R01 |
| G2.2 `Γω = i^(ℓ+p(p−1)) ⋆ω` (`:497`) vs `baseChangeExteriorAction_complexVolume_of_eq_two_mul` | plane, ℓ = 1, p = 0 and p = 2 | i^1 ⋆1 = i e₁∧e₂ = Γ1; i^(1+2) = −i = Γ(e₁∧e₂)/⋆(e₁∧e₂) (the previous review's plane Check); same exponent ℓ + k(k−1) in the library | Same statement: R01 |
| G1.4 n = 3 labels (`:416–421`), carried | c(e_j) = iZ, iY, iX | (iZ)(iY)(iX) = −Id, ω_ℂ = +Id, λ = −i | Pass (~19) |
| G2.3 graded product (`:556–561`), carried | two negative planes | Γ_{V⊕W} = Γ_V ⊗ Γ_W; rank S⁺ = 2 of 4 | Pass (~19) |
| G3.1 Gram norm (`:608–611`), carried | a = 1 + ω, ω² = 1 | \|a²\| = 2√2 = √2·\|a\|² | Pass (~19) |
| G3.3 curvature on S² (`:672–675`), carried | R^S = −½c₁c₂ | [R^S, c₁] = −c₂; coefficient ½ instead of ¼ gives −2c₂ | Pass (~19) |
| G3.4 flat plane and S² (`:687–700`), carried | f, f e₁; e² = sin θ dφ | D(fe₁) = (d + d*)(fe₁); de² = cos θ dθ∧dφ | Pass (~19) |
| G4.1a/G4.1b (`:741–755`), carried | θ = 0.7; e₁ ∈ Cl(0,2) | z e₁ z⁻¹ = (0.170, 0.985); twisted conjugation by e₁ has determinant −1 | Pass (~19) |
| G4.2 metric change (`:855–862`), carried | B = diag(4,1) | Sylvester eigenvalues {2, 3, 4} > 0 | Pass (~19) |
| G5.0 n = 1 (`:949–954`), carried | Cl(0,1) | anticommutator on 1: −1 + 1 = 0 | Pass (~19) |
| G5.3 weights (`:1029–1035`), carried | θ = 0.7 | e^{−iθ} = 0.7648 − 0.6442i | Pass (~19) |
| G6.0 T³ norm (`:1184–1204`), carried | s = 1 + ω | eigenvalues 4 and 0; Scal(S³)/4 = 3/2 | Pass (~19) |
| G6.1 `diracInFrame_eq` (Lean 197), carried | rotated frame; (2e₁, e₂); n = 0 | cross terms cancel; (2e₁, e₂) gives 4c₁∇₁ + c₂∇₂ ≠ D; empty sums 0 = 0; `toFun` still `→L` in the direction at the new Mathlib | Pass (~19) |
| G6.6 symbol winding (`:1354–1360`), carried | v on the circle | coefficients i, −1, −i, −0.8 + 0.6i; winding +1 | Pass (~19) |
| G6.7 `even_finrank_of_conjLinear_square_neg` (Lean 213, proved), carried | J(z₁,z₂) = (−z̄₂, z̄₁); J z = a z̄ on ℂ | J²z = −z; dimension 1: J²z = \|a\|²z ≠ −z | Pass (~19); proof re-elaborated at the new pins |
| Dependency paragraph (`:1454–1462`), carried | each clause | 0 of 7 consumed sections cite the four roadmaps back; reverse lines on main re-read at `4452ffa` (above) | Section order acyclic |

**Remarks (untouched text the previous review passed; no change requested).**
- `cliffordMultiplication_anticommutator` (Lean 126) is a three-line consequence of Mathlib's `CliffordAlgebra.ι_mul_ι_add_swap` (`LinearAlgebra/CliffordAlgebra/Basic.lean:263`), via `polar Q v w = −2⟨v,w⟩`. That lemma predates this change.
- The description's sentence "The new companion proves the finite matrix identities, the existing quaternion embedding dictionary and the native positive-form universal generator map" has no file at this head: the pull request changes only `README.md` and `Suggested.lean`.

**Declared gaps.** None are declared (no readable `design/plan.json`), and no `*Needs:*` line cites a section or declaration that does not exist where cited (`citations.md`: none found nowhere; the cited library names are listed above).

## Not verifiable

- Lawson–Michelsohn, *Spin Geometry* (Theorems II.1.7, II.8.2, II.8.8; G4.3, G4.4, G6.0, G6.2, G6.3) and Atiyah–Bott–Shapiro, *Clifford modules* (G2.3, G6.0) are paywalled and recorded `uncertified` in the manifest; they are cited by locator only.
- The manifest's `kirby` entry (cited for "G4.4a") is not cited by the README, which has no G4.4a. Nothing depends on it, so it was not opened.

## Source issues

- none
