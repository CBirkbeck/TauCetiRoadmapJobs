import Mathlib

/-!
# GanGrossPrasadUnitaryGroups: representative target signatures

The roadmap is README.md. This file records statements suggested against the pinned APIs
and is not exhaustive. The algebraic model uses representations already restricted to the
relative subgroup; the analytic categories and the period theorems are specified in README.md.
-/

namespace TauCetiRoadmap.GanGrossPrasadUnitaryGroups

open scoped TensorProduct

universe u v w

/-! ## Layer 1: Relative Hermitian geometry and Bessel data -/

/-- A vector frames the standard split Hermitian line precisely when it generates the
free rank-one module over the split quadratic algebra. -/
def splitLineFrame {F : Type u} [Field F] (e : F × F) : Prop := IsUnit e

/-- On the split Hermitian line, the norm of a basis vector is nonzero, and conversely.
The two coordinates must both be nonzero, including over a dyadic base field. -/
theorem splitLineFrame_iff_norm_ne_zero {F : Type u} [Field F] (e : F × F) :
    splitLineFrame e ↔ e.1 * e.2 ≠ 0 := by
  sorry

/-- The diagonal vector frames the split line with norm one; the rational vector
(2,1) also frames it, with norm two, so a frame need not have norm one. -/
example {F : Type u} [Field F] :
    (splitLineFrame ((1 : F), 1) ∧ (1 : F) * 1 = 1) ∧
    (splitLineFrame ((2 : ℚ), 1) ∧ (2 : ℚ) * 1 = 2) := by
  norm_num [splitLineFrame, Prod.isUnit_iff]

/-- A nonzero split idempotent has zero Hermitian norm and cannot frame the line. -/
example {F : Type u} [Field F] :
    ((1 : F), 0) ≠ 0 ∧ ¬ splitLineFrame ((1 : F), 0) ∧ (1 : F) * 0 = 0 := by
  simp [splitLineFrame, Prod.isUnit_iff]

/-! ## Layer 2: Local Bessel models, multiplicity one and tempered integrability -/

/-- The positive pairing in the period formula is linear in its first argument;
this is the swapped-slot specialization of the native complex inner product. -/
noncomputable def linearFirstPairing {V : Type v} [NormedAddCommGroup V] [InnerProductSpace ℂ V]
    (x y : V) : ℂ := inner ℂ y x

/-- The two scalar pairings pin the conjugation convention on an explicit witness. -/
example : linearFirstPairing Complex.I (1 : ℂ) = Complex.I ∧
    linearFirstPairing (1 : ℂ) Complex.I = -Complex.I := by
  simp [linearFirstPairing, RCLike.inner_apply]

/-- Scaling the first argument is linear, scaling the second is conjugate-linear,
and the zero vector has zero pairing in both positions. -/
example {V : Type v} [NormedAddCommGroup V] [InnerProductSpace ℂ V]
    (c : ℂ) (x y : V) :
    linearFirstPairing (c • x) y = c * linearFirstPairing x y ∧
    linearFirstPairing x (c • y) = star c * linearFirstPairing x y ∧
    linearFirstPairing (0 : V) x = 0 ∧ linearFirstPairing x (0 : V) = 0 := by
  simp [linearFirstPairing, mul_comm]

/-- The algebraic Bessel model is the native intertwiner space from the tensor of the
two restricted representations to the specified character line. No continuity or
admissibility is asserted by this algebraic specialization. -/
noncomputable abbrev algebraicBesselModel {H : Type u} [Group H]
    {V : Type v} [AddCommGroup V] [Module ℂ V]
    {W : Type w} [AddCommGroup W] [Module ℂ W]
    (ρV : Representation ℂ H V) (ρW : Representation ℂ H W)
    (ν : Representation ℂ H ℂ) :=
  Representation.IntertwiningMap (ρV.tprod ρW) ν

/-- A Bessel functional evaluated on a translated pure tensor transforms by the
specified character line. This is the finite-place equation of the roadmap. -/
theorem algebraicBesselModel_equivariant {H : Type u} [Group H]
    {V : Type v} [AddCommGroup V] [Module ℂ V]
    {W : Type w} [AddCommGroup W] [Module ℂ W]
    (ρV : Representation ℂ H V) (ρW : Representation ℂ H W)
    (ν : Representation ℂ H ℂ) (ℓ : algebraicBesselModel ρV ρW ν)
    (h : H) (v : V) (w : W) :
    ℓ ((ρV h v) ⊗ₜ[ℂ] (ρW h w)) = ν h (ℓ (v ⊗ₜ[ℂ] w)) := by
  sorry

/-- Multiplication intertwines a scalar character times the trivial action with
that same character. The values at one and at i pin the direction of covariance. -/
example {H : Type u} [Group H] (ν : Representation ℂ H ℂ) :
    ∃ ℓ : algebraicBesselModel ν (Representation.trivial ℂ H ℂ) ν,
      ℓ ((1 : ℂ) ⊗ₜ[ℂ] (1 : ℂ)) = 1 ∧
      ℓ (Complex.I ⊗ₜ[ℂ] (1 : ℂ)) = Complex.I := by
  let ℓ : algebraicBesselModel ν (Representation.trivial ℂ H ℂ) ν :=
    ⟨LinearMap.mul' ℂ ℂ, by
      intro h
      ext
      simp [Representation.tprod]⟩
  exact ⟨ℓ, by simp [ℓ]⟩

/-- The character target matters: for any Bessel functional, a tensor fixed by an
element whose target action is minus identity is annihilated. -/
example {H : Type u} [Group H]
    {V : Type v} [AddCommGroup V] [Module ℂ V]
    {W : Type w} [AddCommGroup W] [Module ℂ W]
    (ρV : Representation ℂ H V) (ρW : Representation ℂ H W)
    (ν : Representation ℂ H ℂ) (ℓ : algebraicBesselModel ρV ρW ν)
    (h : H) (v : V) (w : W)
    (hv : ρV h v = v) (hw : ρW h w = w)
    (hν : ν h = -LinearMap.id) : ℓ (v ⊗ₜ[ℂ] w) = 0 := by
  have he := Representation.IntertwiningMap.isIntertwining _ _ ℓ h (v ⊗ₜ[ℂ] w)
  simp only [Representation.tprod_apply, TensorProduct.map_tmul, hv, hw, hν,
    LinearMap.neg_apply, LinearMap.id_apply] at he
  have hz : (2 : ℂ) * ℓ (v ⊗ₜ[ℂ] w) = 0 := by linear_combination he
  exact (mul_eq_zero.mp hz).resolve_left (by norm_num)

/-! ## Layer 3: Root-number characters and the tempered local theorem -/

/-- In the additive sign group, the image of minus identity records the multiplicity
of each distinct appropriate-sign irreducible modulo two (GGP, Section 6). -/
def componentCentralElement {I : Type u} (multiplicity : I → ℕ) : I → ZMod 2 :=
  fun i => multiplicity i

/-- Evaluating any additive component character on the central element counts
multiplicities, whereas evaluating it on a single component generator counts one copy. -/
theorem componentCentralElement_character {I : Type u} [Fintype I] [DecidableEq I]
    (multiplicity : I → ℕ) (χ : (I → ZMod 2) →+ ZMod 2) :
    χ (componentCentralElement multiplicity) =
      ∑ i, (multiplicity i : ZMod 2) * χ (Pi.single i 1) := by
  sorry

/-- A repeated irreducible of multiplicity two has trivial central element, even
though the component group still has a nontrivial generator. -/
example : componentCentralElement (fun _ : Fin 1 => 2) = 0 ∧
    (Pi.single (0 : Fin 1) (1 : ZMod 2) : Fin 1 → ZMod 2) ≠ 0 := by
  constructor
  · funext i; change (2 : ZMod 2) = 0; decide
  · intro h
    have := congrFun h 0
    simp at this

/-- Two constituents occurring once each have both central coordinates. The additive
character summing these coordinates is one on each generator and zero on the central
element; a zero-dimensional parameter has the unique empty central element. -/
example :
    let χ : (Fin 2 → ZMod 2) →+ ZMod 2 :=
      { toFun := fun x => x 0 + x 1
        map_zero' := by simp
        map_add' := by intros; simp only [Pi.add_apply]; abel }
    componentCentralElement (fun _ : Fin 2 => 1) = (fun _ => 1) ∧
    componentCentralElement (fun i : Fin 0 => Fin.elim0 i) = 0 ∧
    χ (Pi.single (0 : Fin 2) 1) = 1 ∧
    χ (Pi.single (1 : Fin 2) 1) = 1 ∧
    χ (componentCentralElement (fun _ : Fin 2 => 1)) = 0 := by
  dsimp
  refine ⟨rfl, ?_, ?_, ?_, ?_⟩
  · funext i; exact Fin.elim0 i
  · simp
  · simp
  · decide

/-! ## Layer 6: Relative characters and the endoscopic spectral calculation -/

/-- The constituent sign group has one sign for each distinct cuspidal constituent
in each degree. Its coordinates are written additively (BPCZ, Section 10.3). -/
abbrev unitaryConstituentSigns (I : Type u) (J : Type v) := (I ⊕ J) → ZMod 2

/-- The full constituent sign group includes both degree-wise central signs. -/
theorem unitaryConstituentSigns_card (I : Type u) (J : Type v) [Finite I] [Finite J] :
    Nat.card (unitaryConstituentSigns I J) =
      2 ^ (Nat.card I + Nat.card J) := by
  sorry

/-- Two single-constituent degrees give four signs. -/
example : Nat.card (unitaryConstituentSigns (Fin 1) (Fin 1)) = 4 := by
  norm_num [unitaryConstituentSigns, Nat.card_eq_fintype_card, Fintype.card_fun]

/-- An endoscopic degree with two constituents and a degree with one give eight
signs; the empty pair has the trivial sign group. -/
example : Nat.card (unitaryConstituentSigns (Fin 2) (Fin 1)) = 8 ∧
    Nat.card (unitaryConstituentSigns (Fin 0) (Fin 0)) = 1 := by
  norm_num [unitaryConstituentSigns, Nat.card_eq_fintype_card, Fintype.card_fun]

/-- The numerical coefficient in the relative spectral contribution is the inverse
order of the full constituent sign group, with no quotient by a diagonal sign. -/
noncomputable def unitaryConstituentCoefficient (I : Type u) (J : Type v)
    [Finite I] [Finite J] : ℂ :=
  (Nat.card (unitaryConstituentSigns I J) : ℂ)⁻¹

/-- The relative spectral coefficient is the inverse power of two determined by the
actual two constituent counts (BPCZ, Theorem 8.1.4.1). -/
theorem unitaryConstituentCoefficient_eq (I : Type u) (J : Type v)
    [Finite I] [Finite J] :
    unitaryConstituentCoefficient I J =
      ((2 : ℂ) ^ (Nat.card I + Nat.card J))⁻¹ := by
  sorry

/-- Stable cuspidal base change gives the coefficient one quarter. -/
example : unitaryConstituentCoefficient (Fin 1) (Fin 1) = 1 / 4 := by
  norm_num [unitaryConstituentCoefficient, unitaryConstituentSigns, Nat.card_eq_fintype_card, Fintype.card_fun]

/-- Three constituents give one eighth, and an empty constituent pair gives one.
The empty case tests the sign-group definition, not a positive-rank global theorem. -/
example : unitaryConstituentCoefficient (Fin 2) (Fin 1) = 1 / 8 ∧
    unitaryConstituentCoefficient (Fin 0) (Fin 0) = 1 := by
  norm_num [unitaryConstituentCoefficient, unitaryConstituentSigns, Nat.card_eq_fintype_card, Fintype.card_fun]

end TauCetiRoadmap.GanGrossPrasadUnitaryGroups
