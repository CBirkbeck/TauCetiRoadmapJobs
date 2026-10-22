import Mathlib

/-!
# OverconvergentAutomorphicForms: representative target signatures

The roadmap is README.md. This file records light definitions and theorem
signatures statable against the pinned APIs and is not exhaustive. It fixes the
integral tensor algebra, the inverse norm coordinate, the conversion from left
to right automorphy, and the antidiagonal dual and determinant-line conventions.
-/

open NumberField TensorProduct

noncomputable section

namespace TauCetiRoadmap.OverconvergentAutomorphicForms

/-! ## Layer 0: weights and analytic coefficient representations -/

namespace HilbertWeight

variable (F : Type*) [Field F] [NumberField F] (p : ℕ) [Fact p.Prime]

/-- The integral algebra with scalars on the left. -/
abbrev Op : Type _ := ℤ_[p] ⊗[ℤ] 𝓞 F

/-- Base change preserves finiteness of the integral lattice. -/
instance : Module.Finite ℤ_[p] (Op F p) := inferInstance
/-- Base change preserves a basis of the integral lattice. -/
instance : Module.Free ℤ_[p] (Op F p) := inferInstance
/-- The finite-module topology over the p-adic integers. -/
instance : TopologicalSpace (Op F p) := moduleTopology ℤ_[p] (Op F p)
/-- The chosen topology is the module topology. -/
instance : IsModuleTopology ℤ_[p] (Op F p) := ⟨rfl⟩
/-- Multiplication is continuous for the module topology. -/
instance : IsTopologicalRing (Op F p) :=
  IsModuleTopology.isTopologicalRing ℤ_[p] (Op F p)

/-- The compact finite-free algebra underlying the compact weight torus. -/
theorem compactSpace_Op : CompactSpace (Op F p) := by
  sorry

/-- The integral algebra has the degree of the number field as its rank. -/
theorem finrank_Op : Module.finrank ℤ_[p] (Op F p) = Module.finrank ℚ F := by
  rw [Module.finrank_baseChange, RingOfIntegers.rank]

/-- the determinant norm on the full integral algebra. -/
def normAlgebra : Op F p →* ℤ_[p] :=
  Algebra.norm ℤ_[p]

/-- Compatibility on every integral element, before restriction to units. -/
theorem norm_tmul_one (a : 𝓞 F) :
    normAlgebra F p ((1 : ℤ_[p]) ⊗ₜ[ℤ] a) =
      ((Algebra.norm ℤ a : ℤ) : ℤ_[p]) := by
  sorry

/-- Restrict the determinant norm to units. The generic-fibre product over embeddings,
`normUnits_embeddings` of README §0.1, is a splitting-field comparison. -/
def normUnits : (Op F p)ˣ →* ℤ_[p]ˣ :=
  Units.map (normAlgebra F p)

/-- The determinant norm is continuous on the compact unit group. -/
theorem continuous_normUnits : Continuous (normUnits F p) := by
  sorry

/-- Global units map to the actual integral algebra. -/
def unitsToOp : (𝓞 F)ˣ →* (Op F p)ˣ :=
  Units.map (Algebra.TensorProduct.includeRight : 𝓞 F →ₐ[ℤ] Op F p).toMonoidHom

/-- Compatibility with the global determinant norm. -/
theorem normUnits_unitsToOp (η : (𝓞 F)ˣ) :
    (normUnits F p (unitsToOp F p η) : ℤ_[p]) =
      ((Algebra.norm ℤ (η : 𝓞 F) : ℤ) : ℤ_[p]) := by
  sorry

/-- kernel of reduction on units. -/
def principalUnits (r : ℕ) : Subgroup (Op F p)ˣ :=
  (Units.map (Ideal.Quotient.mk (Ideal.span {((p : Op F p)) ^ r})).toMonoidHom).ker

/-- Greater depth gives a smaller principal-unit subgroup. -/
theorem principalUnits_antitone : Antitone (principalUnits F p) := by
  sorry

/-- Principal congruence subgroups are open and have finite index, including depth zero. -/
theorem open_finiteIndex_principalUnits (r : ℕ) :
    IsOpen (principalUnits F p r : Set (Op F p)ˣ) ∧
      (principalUnits F p r).FiniteIndex := by
  sorry

/-- Scalar and sign values retain the full integral-algebra rank. -/
example (a : ℤ_[p]) :
    normAlgebra F p (algebraMap ℤ_[p] (Op F p) a) =
      a ^ Module.finrank ℤ_[p] (Op F p) ∧
      normAlgebra F p (-1) = (-1) ^ Module.finrank ℤ_[p] (Op F p) := by
  constructor
  · exact Algebra.norm_algebraMap a
  · change Algebra.norm ℤ_[p] (-1 : Op F p) = _
    rw [← map_one (algebraMap ℤ_[p] (Op F p)), ← map_neg, Algebra.norm_algebraMap]

/-- Zero and one distinguish the determinant norm from a constant character. -/
example : normAlgebra F p 0 = 0 ∧ normAlgebra F p 1 = 1 := by
  exact ⟨Algebra.norm_zero, map_one _⟩

/-- Restricting to units preserves the underlying determinant value. -/
example (u : (Op F p)ˣ) :
    (normUnits F p u : ℤ_[p]) = normAlgebra F p (u : Op F p) := by
  rfl

/-- Global inclusion is the tensor inclusion, rather than the scalar norm. -/
example (η : (𝓞 F)ˣ) :
    (unitsToOp F p η : Op F p) = (1 : ℤ_[p]) ⊗ₜ[ℤ] (η : 𝓞 F) := by
  rfl

/-- Reduction at depth zero has zero quotient and hence full unit kernel. -/
example : principalUnits F p 0 = ⊤ := by
  ext x
  simp only [Subgroup.mem_top, iff_true]
  change (Units.map (Ideal.Quotient.mk
    (Ideal.span {((p : Op F p)) ^ 0})).toMonoidHom) x = 1
  have hI : Ideal.span {((p : Op F p)) ^ 0} = ⊤ := by simp
  let : Subsingleton (Op F p ⧸ Ideal.span {((p : Op F p)) ^ 0}) :=
    Ideal.Quotient.subsingleton_iff.mpr hI
  exact Subsingleton.elim _ _

section Weights

variable (R : Type*) [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]

/-- Continuous geometric character points of the supplied compact character space. -/
abbrev GeomWeight := ContinuousMonoidHom (Op F p)ˣ Rˣ

/-- Arithmetic characters have two compact torus coordinates. -/
abbrev ArithWeight := ContinuousMonoidHom ((Op F p)ˣ × ℤ_[p]ˣ) Rˣ

/-- The pair of characters `(w,t)`. README §0.2's `arithWeight_restrict_left`,
`arithWeight_restrict_right` and `arithWeight_mk_unique` express its coordinate universal property. -/
def ArithWeight.mk (w : GeomWeight F p R)
    (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ) : ArithWeight F p R :=
  (w.comp (ContinuousMonoidHom.fst _ _)) *
    (t.comp (ContinuousMonoidHom.snd _ _))

/-- The underlying inverse-norm map; its continuity is a separate theorem. -/
def weightDualMap : (Op F p)ˣ →* ((Op F p)ˣ × ℤ_[p]ˣ) where
  toFun := fun x ↦ (x ^ 2, (normUnits F p x)⁻¹)
  map_one' := by simp
  map_mul' := fun x y ↦ by
    ext1 <;> simp only [Prod.fst_mul, Prod.snd_mul, map_mul, mul_inv]
    exact mul_pow x y 2

/-- Continuity promotes the algebraic inverse-norm map to a continuous homomorphism. -/
theorem continuous_weightDualMap : Continuous (weightDualMap F p) := by
  sorry

/-- Pull back the arithmetic character along the underlying group map. -/
def weightMap (κ : ArithWeight F p R) : (Op F p)ˣ →* Rˣ :=
  κ.toMonoidHom.comp (weightDualMap F p)

/-- The algebraic pullback is continuous and hence defines a geometric weight. -/
theorem continuous_weightMap (κ : ArithWeight F p R) :
    Continuous (weightMap F p R κ) := by
  sorry

omit [NumberField F] in
/-- The geometric weight is the square character times the inverse norm character.
README §0.2's `weightMap_norm_factor` is the case w=1, and
`weightMap_totallyPositiveUnit` applies the norm-one identity at a totally positive global unit. -/
theorem weightMap_mk_apply (w : GeomWeight F p R)
    (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ) (x : (Op F p)ˣ) :
    weightMap F p R (ArithWeight.mk F p R w t) x =
      w x ^ 2 * (t (normUnits F p x))⁻¹ := by
  exact congrArg₂ (· * ·) (map_pow w x 2) (map_inv t _)

/-- all congruence units have norm one.
Total positivity is unnecessary for the central kernel. -/
theorem congruence_unit_norm_one (N : ℕ) (hN : 4 ≤ N) (η : (𝓞 F)ˣ)
    (hη : (η : 𝓞 F) - 1 ∈ Ideal.span {(N : 𝓞 F)}) :
    normUnits F p (unitsToOp F p η) = 1 := by
  sorry

/-- Central cancellation, also for congruence units with mixed real signs. -/
theorem weightMap_mk_congruenceUnit (N : ℕ) (hN : 4 ≤ N)
    (w : GeomWeight F p R) (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ)
    (η : (𝓞 F)ˣ) (hη : (η : 𝓞 F) - 1 ∈ Ideal.span {(N : 𝓞 F)}) :
    (weightMap F p R (ArithWeight.mk F p R w t) (unitsToOp F p η))⁻¹ *
      w (unitsToOp F p η) ^ 2 = 1 := by
  sorry

/-- Both one-coordinate pullbacks fix the square and inverse conventions. -/
example (w : GeomWeight F p R) (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ)
    (x : (Op F p)ˣ) :
    weightMap F p R (ArithWeight.mk F p R 1 t) x =
        (t (normUnits F p x))⁻¹ ∧
      weightMap F p R (ArithWeight.mk F p R w 1) x = w x ^ 2 := by
  constructor <;> rw [weightMap_mk_apply] <;> simp

/-- Two nontrivial coordinate values give 2, detecting the erroneous value 8. -/
example [Fact (Nat.Prime 5)] (w : GeomWeight F 5 ℚ_[5]) (t : ContinuousMonoidHom ℤ_[5]ˣ ℚ_[5]ˣ)
    (x : (Op F 5)ˣ) (hw : (w x : ℚ_[5]) = 2)
    (ht : (t (normUnits F 5 x) : ℚ_[5]) = 2) :
    (weightMap F 5 ℚ_[5] (ArithWeight.mk F 5 ℚ_[5] w t) x : ℚ_[5]) = 2 := by
  rw [weightMap_mk_apply]
  simp only [Units.val_mul, Units.val_pow_eq_pow_val, Units.val_inv_eq_inv_val, hw, ht]
  norm_num

/-- Each coordinate is recovered, with no exchange of the two factors. -/
example (w : GeomWeight F p R) (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ)
    (x : (Op F p)ˣ) (y : ℤ_[p]ˣ) :
    ArithWeight.mk F p R w 1 (x, y) = w x ∧
      ArithWeight.mk F p R 1 t (x, y) = t y := by
  simp [ArithWeight.mk]

/-- The trivial pair reconstructs the trivial character. -/
example : ArithWeight.mk F p R 1 1 = 1 := by
  ext
  simp [ArithWeight.mk]

/-- Identity and products are respected in both inverse-norm coordinates. -/
example (x y : (Op F p)ˣ) : weightDualMap F p 1 = (1, 1) ∧
    weightDualMap F p (x * y) = weightDualMap F p x * weightDualMap F p y := by
  exact ⟨map_one _, map_mul _ _ _⟩

end Weights
end HilbertWeight

/-! ## Layer 1: right automorphy and coefficient descent -/

/-- Invert both the group argument and its coefficient factor. -/
def rightCocycleOfLeft {Γ X C : Type*} [Group Γ] [Group C]
    (K : Γ → X → C) (γ : Γ) (x : X) : C := (K γ⁻¹ x)⁻¹

/-- inversion converts a left cocycle to
the right cocycle for `x ⋅ γ = γ⁻¹ • x`; invert the coefficient as well. -/
theorem right_cocycle_of_left {Γ X C : Type*} [Group Γ] [Group C]
    [MulAction Γ X] (K : Γ → X → C)
    (hK : ∀ γ δ x, K (γ * δ) x = K γ (δ • x) * K δ x)
    (γ δ : Γ) (x : X) :
    rightCocycleOfLeft K (γ * δ) x =
      rightCocycleOfLeft K γ x * rightCocycleOfLeft K δ (γ⁻¹ • x) := by
  simp only [rightCocycleOfLeft]
  rw [mul_inv_rev, hK, mul_inv_rev]

/-- The identity left cocycle on a noncommutative group retains the right order. -/
example :
    let A := Matrix.GeneralLinearGroup.mkOfDetNeZero
      (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) (by norm_num [Matrix.det_fin_two])
    let B := Matrix.GeneralLinearGroup.mkOfDetNeZero
      (!![1, 0; 1, 1] : Matrix (Fin 2) (Fin 2) ℚ) (by norm_num [Matrix.det_fin_two])
    let K := fun (γ : Matrix.GeneralLinearGroup (Fin 2) ℚ) (_ : Unit) ↦ γ
    rightCocycleOfLeft K (A * B) () = A * B ∧
      rightCocycleOfLeft K (A * B) () ≠ B * A := by
  dsimp only
  simp only [rightCocycleOfLeft, inv_inv]
  refine ⟨trivial, ?_⟩
  intro h
  have h00 := congrArg (fun M : Matrix.GeneralLinearGroup (Fin 2) ℚ ↦ M 0 0) h
  norm_num [Matrix.GeneralLinearGroup.mkOfDetNeZero, Matrix.mul_apply,
    Fin.sum_univ_succ] at h00

/-- The identity left cocycle on scalar units retains the scalar; the trivial cocycle stays one. -/
example (γ : ℚˣ) :
    rightCocycleOfLeft (fun (δ : ℚˣ) (_ : Unit) ↦ δ) γ () = γ ∧
      rightCocycleOfLeft (fun (_ : ℚˣ) (_ : Unit) ↦ (1 : ℚˣ)) γ () = 1 := by
  simp [rightCocycleOfLeft]

/-! ## Layer 6: the wild coefficient-map normalization -/

namespace HilbertAutomorphy

variable {R : Type*} [CommRing R]

/-- The lower-row denominator of the Hilbert fractional coordinate action.
`lowerFactor_one` and `lowerFactor_diagonal` in README §6.4 are its identity and diagonal APIs. -/
def lowerFactor (γ : Matrix (Fin 2) (Fin 2) R) (z : R) : R :=
  γ 1 0 * z + γ 1 1

/-- Conjugation by the uniformizer matrix preserves the denominator after scaling z.
The uniformizer is a unit in the generic-fibre coefficient algebra. -/
theorem wild_factor_conjugation (ϖ : Rˣ) (γ : Matrix (Fin 2) (Fin 2) R) (z : R) :
    lowerFactor
      (Matrix.diagonal ![(ϖ : R), 1] * γ *
        Matrix.diagonal ![((ϖ⁻¹ : Rˣ) : R), 1]) ((ϖ : R) * z) =
      lowerFactor γ z := by
  simp [lowerFactor, Matrix.mul_apply, Fin.sum_univ_succ, mul_assoc]

/-- Identity, diagonal and both unipotent denominators; the dyadic lower factor is retained. -/
example (a d b c z : R) :
    lowerFactor !![a, 0; 0, d] z = d ∧
      lowerFactor (1 : Matrix (Fin 2) (Fin 2) R) z = 1 ∧
      lowerFactor !![1, b; 0, 1] z = 1 ∧
      lowerFactor !![1, 0; c, 1] z = c * z + 1 ∧
      lowerFactor !![1, 0; 2, 1] (1 : R) = 3 := by
  simp [lowerFactor]
  ring

/-- At p=5 the reversed conjugation changes a unit denominator from 126 to 3126. -/
example :
    lowerFactor
      ((!![5, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) * !![1, 0; 25, 1] *
        !![1 / 5, 0; 0, 1]) 25 = 126 ∧
    lowerFactor
      ((!![1 / 5, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) * !![1, 0; 25, 1] *
        !![5, 0; 0, 1]) 25 = 3126 := by
  norm_num [lowerFactor, Matrix.mul_apply, Fin.sum_univ_succ]

end HilbertAutomorphy

/-! ## Layer 8: Siegel and general-group coefficient comparisons -/

namespace Siegel

variable {n R : Type*} [Fintype n] [DecidableEq n] [CommRing R]

/-- The dual factor in the antidiagonal symplectic basis. README §8.1's
`antidiagonalDualFactor_add` expands the sum; `antidiagonalDualFactor_basisChange`
uses the reversal-basis substitution (ZW)(WC)=ZC when W²=I. -/
def antidiagonalDualFactor (W A C Z : Matrix n n R) : Matrix n n R :=
  W * (A + Z * C).transpose * W

/-- The transposed lower block precedes the period coordinate in the dual factor. -/
theorem antidiagonal_dual_factor (W A C Z : Matrix n n R)
    (hW : W * W = 1) (hZ : W * Z.transpose * W = Z) :
    antidiagonalDualFactor W A C Z =
      W * A.transpose * W + (W * C.transpose * W) * Z := by
  conv_rhs => rw [← hZ]
  simp [antidiagonalDualFactor, Matrix.transpose_add, Matrix.transpose_mul, Matrix.mul_add,
    Matrix.add_mul, Matrix.mul_assoc, ← Matrix.mul_assoc W W, hW]

/-- The algebraic determinant-line function; analytic restriction is a separate target. -/
def determinantLineMap {S : Type*} [CommRing S] (χ : Rˣ →* Sˣ) :
    S →ₗ[S] (Matrix.GeneralLinearGroup n R → S) where
  toFun a g := a * (χ (Matrix.GeneralLinearGroup.det g) : S)
  map_add' a b := by funext g; exact add_mul a b _
  map_smul' r a := by funext g; simp [mul_assoc]

/-- Evaluation at the identity recovers the scalar. -/
theorem determinantLineMap_injective {S : Type*} [CommRing S]
    (χ : Rˣ →* Sˣ) : Function.Injective (determinantLineMap (n := n) χ) :=
  fun a b h => by simpa [determinantLineMap] using congrFun h 1

/-- Transpose translation acts on the determinant line by χ(det h). -/
theorem determinantLineMap_translation {S : Type*} [CommRing S]
    (χ : Rˣ →* Sˣ) (a : S) (h g : Matrix.GeneralLinearGroup n R) :
    let hT : Matrix.GeneralLinearGroup n R :=
      ⟨(h : Matrix n n R).transpose, (↑h⁻¹ : Matrix n n R).transpose,
        by rw [← Matrix.transpose_mul, Units.inv_mul, Matrix.transpose_one],
        by rw [← Matrix.transpose_mul, Units.mul_inv, Matrix.transpose_one]⟩
    determinantLineMap χ a (hT * g) =
      (χ (Matrix.GeneralLinearGroup.det h) : S) * determinantLineMap χ a g := by
  sorry

/-- The signed block convention for the change to the other row graph chart. -/
def atkinLehnerBlock (q : R) : Matrix (Sum n n) (Sum n n) R :=
  Matrix.fromBlocks 0 1 (-(q • (1 : Matrix n n R))) 0

/-- The scaled Atkin–Lehner matrix lands in the other graph chart. -/
theorem atkin_lehner_chart (q : R) (Z : Matrix n n R) :
    (Matrix.fromCols (1 : Matrix n n R) Z) *
      (atkinLehnerBlock q : Matrix (Sum n n) (Sum n n) R) =
    Matrix.fromCols (-(q • Z)) (1 : Matrix n n R) := by
  unfold atkinLehnerBlock
  rw [Matrix.fromCols_mul_fromBlocks]
  simp

/-- Trivial character, identity evaluation and zero scalar test the determinant line. -/
example {S : Type*} [CommRing S] (χ : Rˣ →* Sˣ)
    (a : S) (g : Matrix.GeneralLinearGroup n R) :
    determinantLineMap (1 : Rˣ →* Sˣ) a g = a ∧
      determinantLineMap (n := n) χ a 1 = a ∧ determinantLineMap χ 0 g = 0 := by
  simp [determinantLineMap]

/-- A diagonal gives 6 and an upper unipotent fixes every scalar on the line. -/
example (a : ℚ) :
    determinantLineMap (MonoidHom.id ℚˣ) 1
      (Matrix.GeneralLinearGroup.mkOfDetNeZero !![2, 0; 0, 3]
        (by norm_num [Matrix.det_fin_two])) = 6 ∧
      determinantLineMap (MonoidHom.id ℚˣ) a
        (Matrix.GeneralLinearGroup.mkOfDetNeZero !![1, 7; 0, 1]
          (by norm_num [Matrix.det_fin_two])) = a := by
  norm_num [determinantLineMap, Matrix.GeneralLinearGroup.det,
    Matrix.GeneralLinearGroup.mkOfDetNeZero, Matrix.det_fin_two]

/-- A lower symplectic block distinguishes the two dual-factor orders. -/
example :
    let W : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 1, 0]
    let Z : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 0, 0]
    let C : Matrix (Fin 2) (Fin 2) ℚ := !![0, 0; 3, 0]
    antidiagonalDualFactor W 1 C Z ≠ 1 + Z * (W * C.transpose * W) ∧
      antidiagonalDualFactor 0 1 C Z = 0 := by
  dsimp only
  refine ⟨?_, by simp [antidiagonalDualFactor]⟩
  intro h
  have h00 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℚ ↦ M 0 0) h
  norm_num [antidiagonalDualFactor, Matrix.mul_apply, Matrix.vecMul, dotProduct,
    Matrix.add_apply, Fin.sum_univ_succ] at h00

/-- In rank one the dual factor agrees with the scalar denominator. -/
example (a c z : R) :
    antidiagonalDualFactor (1 : Matrix (Fin 1) (Fin 1) R)
      (fun _ _ ↦ a) (fun _ _ ↦ c) (fun _ _ ↦ z) 0 0 = a + z * c := by
  unfold antidiagonalDualFactor
  rw [one_mul, mul_one]
  change a + ∑ _ : Fin 1, z * c = a + z * c
  simp

/-- The other graph chart gives [-6,1] at q=2 and z=3. -/
example :
    Matrix.fromCols (!![1] : Matrix (Fin 1) (Fin 1) ℚ) !![3] *
      atkinLehnerBlock (n := Fin 1) (2 : ℚ) =
      Matrix.fromCols (!![-6] : Matrix (Fin 1) (Fin 1) ℚ) !![1] := by
  rw [atkinLehnerBlock, Matrix.fromCols_mul_fromBlocks]
  congr 1 <;> ext i j <;> fin_cases i <;> fin_cases j <;>
    norm_num [Matrix.mul_apply, Fin.sum_univ_succ]

/-- A zero graph has a valid second-chart image without inverting Z. -/
example (q : R) :
    (Matrix.fromCols (1 : Matrix n n R) (0 : Matrix n n R)) *
      (atkinLehnerBlock q : Matrix (Sum n n) (Sum n n) R) =
      Matrix.fromCols (0 : Matrix n n R) (1 : Matrix n n R) := by
  simpa using (atkin_lehner_chart q (0 : Matrix n n R))

end Siegel

end TauCetiRoadmap.OverconvergentAutomorphicForms
