import Mathlib

/-!
# Geometry of numbers and quadratic arithmetic, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. The finite-field Arf classification is
stated directly on quadratic forms with symplectic bases and quadratic Lagrangians.

The following headline theorems are not statable at the pins:
* integral polarisation and Witt injection, and canonical line-valued second
  residue: classical metabolic symmetric and quadratic Witt carriers over rings
  are missing;
* the Arf extension-degree law: native quadratic scalar extension
  `QuadraticForm.baseChange` requires invertibility of two;
* symmetric Dedekind, global-field, characteristic-two and DVR L-group tables,
  and their sign-shift comparisons: periodic Poincare L-spectra are missing;
* general arithmetic fracture, quadratic isometry lifting over rings with
  anti-structure, complete quadratic rigidity and henselian quadratic rigidity:
  Poincare categories, general noncommutative quadratic refinements and periodic
  L-spectra are missing; the native quadratic base-change API requires two
  invertible and cannot state integral dyadic lifting;
* the total-cokernel degree-three extension, number-field quadratic table,
  parity obstruction and nondyadic devissage: the ring Witt carriers and periodic L-spectra are missing;
* the E8 quadratic refinement comparison, dyadic integral Witt subgroup and
  integer arithmetic comparison: integral quadratic Witt carriers are missing;
* Eisenstein integral symmetric Witt group, integral restriction kernel/cokernel, zero
  quadratic base-change map, new local quadratic image, and corrected symmetric
  and quadratic L-group tables: integral Witt carriers and periodic L-spectra are
  missing.

The Dedekind quadratic/symmetric completion pullback, field L-computations,
generic sign shifts and the integer L-tables are consumed
from the supplier roadmaps specified in README.md.
-/

namespace TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmeticPartII

/-! ## Layer 0: integral forms and residue coordinates -/

/-- Over a finite field of characteristic two, two nonsingular quadratic forms
have equal absolute-trace Arf coordinates exactly when their orthogonal sum has
a quadratic Lagrangian. The six basis conditions specify symplectic bases and
therefore imply perfect polars; the half-dimensions may differ or be zero.
README §0.4; CDHHLMNNS-III-v4, proof of Corollary 2.3.10, p. 45.
-/
theorem arf_trace_classifies
    {k V W : Type*} [Field k] [Fintype k] [CharP k 2] [Algebra (ZMod 2) k]
    [AddCommGroup V] [Module k V] [FiniteDimensional k V]
    [AddCommGroup W] [Module k W] [FiniteDimensional k W]
    (q : QuadraticForm k V) (q' : QuadraticForm k W) (n m : ℕ)
    (b : Module.Basis (Fin n × Bool) k V)
    (b' : Module.Basis (Fin m × Bool) k W)
    (hee : ∀ i j, QuadraticMap.polar q (b (i, false)) (b (j, false)) = 0)
    (hff : ∀ i j, QuadraticMap.polar q (b (i, true)) (b (j, true)) = 0)
    (hef : ∀ i j, QuadraticMap.polar q (b (i, false)) (b (j, true)) =
      if i = j then 1 else 0)
    (hee' : ∀ i j, QuadraticMap.polar q' (b' (i, false)) (b' (j, false)) = 0)
    (hff' : ∀ i j, QuadraticMap.polar q' (b' (i, true)) (b' (j, true)) = 0)
    (hef' : ∀ i j, QuadraticMap.polar q' (b' (i, false)) (b' (j, true)) =
      if i = j then 1 else 0) :
    Algebra.trace (ZMod 2) k (∑ i : Fin n, q (b (i, false)) * q (b (i, true))) =
      Algebra.trace (ZMod 2) k (∑ i : Fin m, q' (b' (i, false)) * q' (b' (i, true))) ↔
    ∃ L : Submodule k (V × W),
      (∀ x ∈ L, (q.prod q') x = 0) ∧
      2 * Module.finrank k L = Module.finrank k (V × W) := by
  sorry

end TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmeticPartII
