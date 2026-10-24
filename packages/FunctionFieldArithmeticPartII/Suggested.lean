import Mathlib

/-!
# Function field arithmetic, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned APIs, using native root-chart, tensor and exterior-power carriers.

The following headline theorems are not statable at the pins with a few simple definitions:
* Relative regular root geometry lacks the native finite-root stack and its morphism properties.
* The coherent infinite root stack, its fpqc quotient and arbitrary base change lack the
  coherent root pseudofunctor and the represented band-action quotient.
* Infinite affine coinvariants lack the coherent root-colimit coaction and its rational-character
  grading; constructing that coaction is a substantial roadmap target.
* The infinite DVR reduced gerbe, fpqc Kummer classification and non-fppf torsor lack the
  relative infinite gerbe and fpqc torsor groupoid carriers.
* The root Picard square quotient and signed adelic equivalence lack the root Picard stack,
  its degree components and the completed-lattice gluing functor.
* Symmetric lisse lines across collisions and their multiplication lack the root symmetric-power
  stack and its adic lisse coefficient category.
* Exterior-power cohomology of root symmetric powers lacks stack étale cohomology with these
  coefficients and its Frobenius action. Its linear Koszul-invariant input is stated below.
* High-degree Abel–Jacobi descent lacks the root Abel–Jacobi morphism and stack lisse descent.
* The normalized character sheaf in every integer degree lacks the graded root Picard stack
  and its lisse category with Frobenius.
* The ramified norm complex and its torsor obstructions lack the root multiplicative sheaf,
  its norm and their compatible torsor groupoids.
* Quadratic Frobenius trace comparison lacks the root Picard character sheaf and its trace.
-/

namespace TauCetiRoadmap.FunctionFieldArithmeticPartII

open scoped TensorProduct Polynomial

universe u v

/-! ## Layer 1: Native root coordinates and affine comparison -/

/-- The affine root-chart algebra, including nonunit and nilpotent parameters. -/
abbrev rootChart (A : Type u) [CommRing A] (f : A) (n : ℕ) :=
  AdjoinRoot ((Polynomial.X : A[X]) ^ n - Polynomial.C f)

/-- The left coaction in unit-root coordinates sends the chart root to the product of the
unit-root coordinate and the chart root, and fixes the coefficients. -/
noncomputable def rootChartCoaction (A : Type u) [CommRing A] (f : A) (n : ℕ) :
    rootChart A f n →ₐ[A] (rootChart A 1 n) ⊗[A] (rootChart A f n) := by
  let h := AdjoinRoot.root ((Polynomial.X : A[X]) ^ n - Polynomial.C (1 : A))
  let t := AdjoinRoot.root ((Polynomial.X : A[X]) ^ n - Polynomial.C f)
  have hh : h ^ n = 1 := by
    have e := AdjoinRoot.eval₂_root ((Polynomial.X : A[X]) ^ n - Polynomial.C (1 : A))
    simpa only [Polynomial.eval₂_sub, Polynomial.eval₂_pow, Polynomial.eval₂_X,
      Polynomial.eval₂_C, Polynomial.eval₂_one, map_one, sub_eq_zero] using e
  have ht : t ^ n = algebraMap A (rootChart A f n) f := by
    have e := AdjoinRoot.eval₂_root ((Polynomial.X : A[X]) ^ n - Polynomial.C f)
    simpa only [Polynomial.eval₂_sub, Polynomial.eval₂_pow, Polynomial.eval₂_X,
      Polynomial.eval₂_C, AdjoinRoot.algebraMap_eq, sub_eq_zero] using e
  refine AdjoinRoot.liftAlgHom _ (Algebra.ofId A _) (h ⊗ₜ[A] t) ?_
  simp only [Polynomial.eval₂_sub, Polynomial.eval₂_pow, Polynomial.eval₂_X,
    Polynomial.eval₂_C]
  rw [Algebra.TensorProduct.tmul_pow, hh, ht]
  change 1 ⊗ₜ[A] algebraMap A (rootChart A f n) f -
    algebraMap A (rootChart A 1 n ⊗[A] rootChart A f n) f = 0
  rw [Algebra.TensorProduct.algebraMap_apply']
  exact sub_self _

/-- The root-chart torsor comparison sends a pure tensor to the left coaction of its first
factor multiplied by the right inclusion of its second factor. -/
noncomputable def rootChartComparison (A : Type u) [CommRing A] (f : A) (n : ℕ) :
    (rootChart A f n) ⊗[A] (rootChart A f n) →ₐ[A]
      (rootChart A 1 n) ⊗[A] (rootChart A f n) :=
  Algebra.TensorProduct.lift (rootChartCoaction A f n)
    Algebra.TensorProduct.includeRight (fun _ _ => Commute.all _ _)

/-- The root-chart comparison is injective exactly at exponent one or at a regular parameter. -/
theorem rootChartComparison_injective_iff (A : Type u) [CommRing A] (f : A)
    (n : ℕ) (hn : 0 < n) :
    Function.Injective (rootChartComparison A f n) ↔
      n = 1 ∨ Function.Injective (fun a : A => f * a) := by
  sorry

/-- The root-chart comparison is surjective exactly at exponent one or at a unit parameter. -/
theorem rootChartComparison_surjective_iff (A : Type u) [CommRing A] (f : A)
    (n : ℕ) (hn : 0 < n) :
    Function.Surjective (rootChartComparison A f n) ↔ n = 1 ∨ IsUnit f := by
  sorry

/-- The kernel consists of independent annihilator coordinates for the wraparound indices. -/
theorem rootChartComparison_kernel (A : Type u) [CommRing A] (f : A)
    (n : ℕ) (hn : 0 < n) :
    Nonempty ((LinearMap.ker (rootChartComparison A f n).toLinearMap) ≃ₗ[A]
      ({ij : Fin n × Fin n // n ≤ ij.1.val + ij.2.val} →
        LinearMap.ker (LinearMap.mul A A f))) := by
  sorry

/-- The module cokernel has one copy of A/(f) for each strictly lower-triangular coordinate. -/
theorem rootChartComparison_cokernel (A : Type u) [CommRing A] (f : A)
    (n : ℕ) (hn : 0 < n) :
    Nonempty (((rootChart A 1 n ⊗[A] rootChart A f n) ⧸
      LinearMap.range (rootChartComparison A f n).toLinearMap) ≃ₗ[A]
      ({ik : Fin n × Fin n // ik.2.val < ik.1.val} →
        A ⧸ Ideal.span ({f} : Set A))) := by
  sorry

/-- The matrix of the root-chart comparison in the source monomial and target character
bases, using the same pair indexing on rows and columns. -/
def rootChartComparisonMatrix (A : Type u) [CommRing A] (f : A) (n : ℕ) :
    Matrix (Fin n × Fin n) (Fin n × Fin n) A :=
  fun r c => if r.1 = c.1 ∧ r.2.val = (c.1.val + c.2.val) % n then
    f ^ ((c.1.val + c.2.val) / n) else 0

/-- The root-chart comparison determinant includes the sign of each cyclic row block. -/
theorem rootChartComparisonMatrix_det (A : Type u) [CommRing A] (f : A)
    (n : ℕ) (hn : 0 < n) :
    (rootChartComparisonMatrix A f n).det =
      (-1 : A) ^ ((n - 1) * (n * (n - 1) / 2)) * f ^ (n * (n - 1) / 2) := by
  sorry

/-! ## Layer 7: Symmetric lisse lines and exterior cohomology -/

/-- Antisymmetrization identifies the exterior power with Koszul-signed invariant tensors
whenever the factorial is a unit. No finite-generation hypothesis is imposed. -/
theorem exteriorPower_koszul_invariants (A : Type u) [CommRing A]
    (V : Type v) [AddCommGroup V] [Module A V] (d : ℕ)
    (hd : IsUnit (d.factorial : A)) :
    Function.Injective (exteriorPower.toTensorPower A V d) ∧
      ∀ t : ⨂[A]^d V,
        t ∈ LinearMap.range (exteriorPower.toTensorPower A V d) ↔
          ∀ σ : Equiv.Perm (Fin d),
            PiTensorProduct.reindex A (fun _ : Fin d => V) σ t =
              (Equiv.Perm.sign σ : ℤ) • t := by
  sorry

end TauCetiRoadmap.FunctionFieldArithmeticPartII
