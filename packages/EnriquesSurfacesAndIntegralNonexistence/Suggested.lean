import Mathlib
import TauCeti.LinearAlgebra.IntegralLattice.Discriminant.Quadratic

/-!
# EnriquesSurfacesAndIntegralNonexistence: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: the dyadic representative comparison and
the two native discriminant groups with their isotropic classes. The pins are
Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and
Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

The numerical-lattice isometry of an Enriques surface is not statable at these pins:
the geometric Enriques predicate and numerical surface Picard quotient are missing.
The canonical-cover, Picard-descent and Enriques-to-Jacobian comparison theorems
lack relative surface Picard spaces, canonical torsors and genus-one surface models.
The configuration exclusions and arbitrary-characteristic restricted-configuration
theorem lack those surface and fibre carriers. The W₂ lifting criterion and
miniversal deformation theorem lack Enriques deformation functors. Finite-field
and integral nonexistence lack the Enriques predicate and its algebraic-space family
stack. None is replaced here by an abstract predicate or a bounded substitute.

Curve intersection uses negative root squares. The native discriminant quadratic
map is half the full norm modulo the integers.
-/

namespace TauCetiRoadmap.EnriquesSurfacesAndIntegralNonexistence

open TauCeti

/-! ## Layer 3: point counts, dyadic twists and integral Picard constancy -/

/-- The eight rational representatives `(−1)^e 2^a 5^b` of dyadic square classes. -/
def dyadicRepresentative (e a b : Fin 2) : ℚ :=
  (-1) ^ e.val * 2 ^ a.val * 5 ^ b.val

/-- Every nonzero dyadic number has exactly one of the eight specified square classes. -/
theorem dyadic_square_classes (x : ℚ_[2]) (hx : x ≠ 0) :
    ∃! t : Fin 2 × Fin 2 × Fin 2,
      IsSquare (x / (dyadicRepresentative t.1 t.2.1 t.2.2 : ℚ_[2])) := by sorry

/-! ## Layer 6: ten-curve lattices and the I₄* exclusion -/

/-- The first Gram matrix, in the order `(C₁,…,C₈,R,F)` of README 6.1. -/
def firstGram : Matrix (Fin 10) (Fin 10) ℤ := !![
  -2,1,0,0,0,0,0,0,0,0;
  1,-2,1,0,0,0,0,0,0,0;
  0,1,-2,1,0,0,0,0,0,0;
  0,0,1,-2,1,0,0,0,1,0;
  0,0,0,1,-2,1,0,0,0,0;
  0,0,0,0,1,-2,1,1,0,0;
  0,0,0,0,0,1,-2,0,0,0;
  0,0,0,0,0,1,0,-2,0,0;
  0,0,0,1,0,0,0,0,-2,1;
  0,0,0,0,0,0,0,0,1,0]

/-- The second Gram matrix, the orthogonal sum `D₈(−1) ⊕ U`, in README 6.1. -/
def secondGram : Matrix (Fin 10) (Fin 10) ℤ := !![
  -2,1,0,0,0,0,0,0,0,0;
  1,-2,1,0,0,0,0,0,0,0;
  0,1,-2,1,0,0,0,0,0,0;
  0,0,1,-2,1,0,0,0,0,0;
  0,0,0,1,-2,1,0,0,0,0;
  0,0,0,0,1,-2,1,1,0,0;
  0,0,0,0,0,1,-2,0,0,0;
  0,0,0,0,0,1,0,-2,0,0;
  0,0,0,0,0,0,0,0,0,1;
  0,0,0,0,0,0,0,0,1,0]

/-- The first Gram matrix is symmetric. -/
theorem firstGram_symmetric : firstGram.IsSymm := by
  apply Matrix.IsSymm.ext
  intro i j
  fin_cases i <;> fin_cases j <;> decide

/-- The second Gram matrix is symmetric. -/
theorem secondGram_symmetric : secondGram.IsSymm := by
  apply Matrix.IsSymm.ext
  intro i j
  fin_cases i <;> fin_cases j <;> decide

/-- Specialize the native Gram-lattice constructor to the first integer matrix. -/
noncomputable def firstLattice : IntegralLattice (Fin 10 → ℚ) :=
  IntegralLattice.ofGramMatrix (Pi.basisFun ℚ (Fin 10)) firstGram firstGram_symmetric

/-- Specialize the native Gram-lattice constructor to the second integer matrix. -/
noncomputable def secondLattice : IntegralLattice (Fin 10 → ℚ) :=
  IntegralLattice.ofGramMatrix (Pi.basisFun ℚ (Fin 10)) secondGram secondGram_symmetric

/-- The first ten-curve lattice has discriminant group `(ℤ/2)²`. -/
theorem firstLattice_discriminant_group :
    Nonempty (firstLattice.DiscriminantGroup ≃+ (ZMod 2 × ZMod 2)) := by sorry

/-- Zero and the two spinor classes are exactly the isotropic discriminant classes
of the first ten-curve lattice, which is even, in the native half-norm convention. -/
theorem firstLattice_isotropic_card :
    ∃ hL : firstLattice.IsEven, Nat.card {x : firstLattice.DiscriminantGroup //
      firstLattice.discriminantQuadraticMap hL x = 0} = 3 := by sorry

/-- The second ten-curve lattice has discriminant group `(ℤ/2)²`. -/
theorem secondLattice_discriminant_group :
    Nonempty (secondLattice.DiscriminantGroup ≃+ (ZMod 2 × ZMod 2)) := by sorry

/-- Zero and the two spinor classes are exactly the isotropic discriminant classes
of the second ten-curve lattice, which is even, in the native half-norm convention. -/
theorem secondLattice_isotropic_card :
    ∃ hL : secondLattice.IsEven, Nat.card {x : secondLattice.DiscriminantGroup //
      secondLattice.discriminantQuadraticMap hL x = 0} = 3 := by sorry

end TauCetiRoadmap.EnriquesSurfacesAndIntegralNonexistence
