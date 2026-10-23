import Mathlib
import TauCeti.Algebra.BrauerGroup.Group
import TauCeti.Algebra.CentralSimple.Index

/-!
# Archimedean regulators, primitive periods and arithmetic volumes: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs.

The following headlines are not statable at the pins:
* Layer 1: the exact order and nonzero leading coefficient of the continued
  Dedekind function at 1-n require its global continuation and analytic germ.
* Layer 2: the specified Chern-normalized Borel regulator, its real isomorphism,
  torsion kernel and restriction/transfer laws require actual higher Quillen
  K-groups, the continuous Borel class and the arithmetic comparison maps.
* Layer 3: the rational zeta-product volume of arithmetic norm-one quotients
  requires the algebraic norm-one group, adelic gauge and quotient carriers.
* Layer 4: the compact and arithmetic primitive-period determinants and common
  compact-fibre comparison require the compact dual, arithmetic cohomology
  algebras and invariant-form comparison maps.
* Layer 5: the primitive-period determinant, including rank zero, requires its
  actual cohomological comparison; the homotopy-to-Tate lattice conversion
  requires stable SU/SO, its integral homotopy lattice and the suspended
  character; the integral regulator lattice, zeta covolume and S-integer/order
  transport require actual higher K-groups and the specified regulator.
* Layer 6: the geometric point Deligne identification and Borel equals twice
  Beilinson require geometric Deligne cohomology and the independent universal
  regulator; the rational Adams-weight theorem requires higher K-groups and
  their Adams operations.

The period-index equality and existence of division algebras split at infinity
are stated on native algebra carriers. No replacement regulator is introduced.
-/

namespace TauCetiRoadmap.BorelRegulators

universe u

/-! ## Layer 3: Division algebras, rational gauges and arithmetic volume -/

/-- Over every number field, the order of the Brauer class of a finite-dimensional
central simple algebra equals its index, including the split class of period one.
See Poonen, Theorem 1.5.36(iv). -/
theorem period_eq_index (F : Type u) [Field F] [NumberField F]
    (A : CSA.{u, u} F) :
    orderOf (TauCeti.BrauerGroup.mk A) = TauCeti.Algebra.index F A := by
  sorry

/-- Every degree at least two occurs for a central division algebra over a number
field that splits at every real and complex embedding. Splitting means a full
matrix algebra after the scalar extension determined by that embedding.
See Borel 1977, Lemma 2.2. -/
theorem exists_divisionAlgebra_split_at_infinity
    (F : Type u) [Field F] [NumberField F] (a : ℕ) (ha : 2 ≤ a) :
    ∃ (D : Type u) (_ : DivisionRing D) (_ : Algebra F D)
      (_ : Algebra.IsCentral F D) (_ : FiniteDimensional F D),
      Module.finrank F D = a ^ 2 ∧
      (∀ σ : F →+* ℝ, letI : Algebra F ℝ := σ.toAlgebra
        TauCeti.Algebra.IsSplittingField F D ℝ) ∧
      (∀ σ : F →+* ℂ, letI : Algebra F ℂ := σ.toAlgebra
        TauCeti.Algebra.IsSplittingField F D ℂ) := by
  sorry

end TauCetiRoadmap.BorelRegulators
