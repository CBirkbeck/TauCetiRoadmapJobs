import Mathlib

/-!
# K3SurfacesAndSymplecticBoundedness: representative target signatures

The roadmap is README.md. This file records statements suggested against the pinned APIs
and is not exhaustive.
-/

namespace TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness

/-! ## Layer 4: Picard lattices and arithmetic rank boundedness -/

/-- For every odd prime and every matrix size, the first principal congruence subgroup
of the p-adic general linear group has no nonidentity element of finite order.
The integral consequence is used in Huybrechts, Chapter 17, proof of Lemma 2.6. -/
theorem GeneralLinearGroup.oddCongruenceKernel_torsionFree
    (ell : ℕ) [Fact ell.Prime] (hodd : ell ≠ 2) (n : ℕ)
    (A : Matrix.GeneralLinearGroup (Fin n) (PadicInt ell))
    (hred : Matrix.GeneralLinearGroup.map
      (PadicInt.toZMod : PadicInt ell →+* ZMod ell) A = 1)
    (hfinite : IsOfFinOrder A) : A = 1 := by
  sorry

/-- Reduction modulo an odd prime is injective on every finite subgroup of the
p-adic general linear group, including in matrix size zero. -/
theorem finiteSubgroup.reduction_injective
    (ell : ℕ) [Fact ell.Prime] (hodd : ell ≠ 2) (n : ℕ)
    (H : Subgroup (Matrix.GeneralLinearGroup (Fin n) (PadicInt ell))) [Finite H] :
    Function.Injective (fun A : H => Matrix.GeneralLinearGroup.map
      (PadicInt.toZMod : PadicInt ell →+* ZMod ell) A.val) := by
  sorry

/-- Every finite subgroup of the integral general linear group embeds into the
general linear group over the field with three elements by entrywise reduction.
Huybrechts, Chapter 17, proof of Lemma 2.6. -/
theorem finiteSubgroup.integral_reduction_injective
    (n : ℕ) (H : Subgroup (Matrix.GeneralLinearGroup (Fin n) ℤ)) [Finite H] :
    Function.Injective (fun A : H => Matrix.GeneralLinearGroup.map
      (Int.castRingHom (ZMod 3)) A.val) := by
  sorry

end TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness
