import Mathlib

/-!
# Quantitative isogenies and uniform integral Tate bounds: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs.

The period theorem, short-endomorphism spanning bound and endomorphism-discriminant
estimate require the polarized abelian complex-lattice realization and stable
Faltings height.
The polarized rational isogeny estimate also requires represented polarizations
and that height.
Polarization-free discriminant bounds, quantitative
simple factorization and the rational, relative and geometric isogeny bounds require
stable Faltings height and the abelian degree API. The sharp surface avoidance-period
estimate requires polarized period lattices and the Hermitian cotangent slope;
the quadratic elliptic bounds require stable height and its j-invariant comparison. The adelic product
comparison, uniform residual Tate refinement, uniform integral number-field theorem,
finitely generated field Tate comparison, endomorphism-preserving specialization,
and the supported-image and full finitely generated field index theorems require
abelian Tate modules and their integral geometric-endomorphism action. These
headlines are not statable on those carriers at the pins and are not replaced by
abstract predicates or matrix estimates here.
-/

namespace TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheoremsPartII

/-! ## Layer 3: Order discriminants and class indices -/

/-- The signed regular-trace discriminant of an integral basis of an order.
The trace is that of left multiplication on the whole order, not reduced trace.
Masser–Wüstholz, Factorization estimates, §2, pp. 8–9. -/
noncomputable def regularOrderDiscriminant {D : Type*} [Ring D]
    (O : Subring D) {m : ℕ} (b : Module.Basis (Fin m) ℤ O) : ℤ :=
  Matrix.det (fun i j => Matrix.trace
    (LinearMap.toMatrix b b (LinearMap.mulLeft ℤ (b i * b j))))

/-- The regular norm on the real scalar extension of a rational algebra, in
coordinates of a rational basis. The displayed multiplication matrices are the
scalar extensions of left multiplication, so no commutativity is assumed. -/
noncomputable def regularNormCoordinates {D : Type*} [Ring D] [Algebra ℚ D]
    {m : ℕ} (b : Module.Basis (Fin m) ℚ D) (x : Fin m → ℝ) : ℝ :=
  Matrix.det (fun i j => ∑ k, x k * (b.repr (b k * b j) i : ℝ))

/-- The discriminant-normalized supremum of volumes of bounded symmetric convex
bodies in the strict regular-norm unit region. Coordinate volume is ordinary real
Lebesgue volume, including at complex places. Masser–Wüstholz, §2, pp. 8–9. -/
noncomputable def divisionNormBody {D : Type*} [DivisionRing D] [Algebra ℚ D]
    {m : ℕ} (b : Module.Basis (Fin m) ℚ D) : ℝ :=
  Real.sqrt |(Matrix.det (fun i j =>
    LinearMap.trace ℚ D (LinearMap.mulLeft ℚ (b i * b j))) : ℝ)| *
  sSup {v : ℝ | ∃ C : Set (Fin m → ℝ), Bornology.IsBounded C ∧
    Convex ℝ C ∧ (interior C).Nonempty ∧
    (∀ x, x ∈ C ↔ -x ∈ C) ∧
    (∀ x ∈ C, |regularNormCoordinates b x| < 1) ∧
    v = (MeasureTheory.volume C).toReal}

/-- Every finite-dimensional division rational algebra has normalized norm-body
invariant at least two to its rational dimension. The center need not be rational.
Masser–Wüstholz, Factorization estimates, Lemma 3.3, p. 13. -/
theorem division_norm_body_lower_bound
    (D : Type*) [DivisionRing D] [Algebra ℚ D] [FiniteDimensional ℚ D]
    {m : ℕ} (b : Module.Basis (Fin m) ℚ D) :
    (2 : ℝ) ^ m ≤ divisionNormBody b := by
  sorry

/-- Every full order lattice in a finite-dimensional division rational algebra,
in every positive module rank, contains a free order sublattice whose finite
additive index is at most the absolute regular discriminant to the half-rank.
Right modules are obtained by applying this theorem to the opposite algebra.
Masser–Wüstholz, Factorization estimates, Class Index Lemma, pp. 8–10. -/
theorem class_index_bound
    (D : Type*) [DivisionRing D] [Algebra ℚ D] [FiniteDimensional ℚ D]
    (O : Subring D) {m : ℕ} (b : Module.Basis (Fin m) ℤ O)
    (hO : Submodule.span ℚ (O : Set D) = ⊤)
    (e : ℕ) (he : 0 < e) (M : Submodule O (Fin e → D))
    [Module.Finite ℤ M]
    (hM : Submodule.span ℚ (M : Set (Fin e → D)) = ⊤) :
    ∃ f : (Fin e → O) →ₗ[O] M, Function.Injective f ∧
      f.range.toAddSubgroup.index ≠ 0 ∧
      (f.range.toAddSubgroup.index : ℝ) ≤
        Real.rpow (|regularOrderDiscriminant O b| : ℝ) ((e : ℝ) / 2) := by
  sorry

end TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheoremsPartII

