import Mathlib
import TauCeti.Algebra.Octonion.Basic

/-!
# Exceptional theta correspondences for G2: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. The split-octonion null-space geometry
is statable on the native octonions using two elementary predicates.

The other headline theorems are not statable at the pins:
* The represented automorphism group and its pinned Chevalley comparison lack the
  split G2 group scheme and the group-level comparison.
* Exceptional minimal representations and their five Jacquet filtrations lack
  the exceptional group models and smooth admissible representation categories.
* The three Howe duality theorems, theta dichotomy, universal division
  nonvanishing in residue characteristic different from 3, tempered preservation,
  all explicit lift tables and the discrete-series trichotomy lack those
  categories, normalized induction and the exceptional theta modules.
* The supercuspidal spin-pole/Shalika/theta equivalence additionally lacks the
  ramified Langlands-Shahidi spin local factor.
* Quaternion relative quotients and embeddings, the Steinberg relative discrete
  summand and compact-real SU2 periods lack actual octonion group actions and
  their smooth and unitary relative representation models.
* The global minimal residue and its local identification, quaternion-period
  nonvanishing, the two definite cuspidality criteria, split globally generic
  nonvanishing and its supercuspidal cuspidality criterion lack the exceptional
  adelic Eisenstein, residual representation and theta-kernel carriers.
* Real infinitesimal-character matching lacks exceptional real Harish-Chandra
  modules and their central-character comparison.
-/

namespace TauCetiRoadmap.ExceptionalThetaCorrespondencesForG2

/-! ## Layer 0: octonion geometry and complex parameters -/

/-- An octonion automorphism is a linear equivalence preserving the unit and the
ordered octonion product. -/
def IsOctonionAutomorphism (F : Type*) [Field F]
    (g : TauCeti.Octonion F ≃ₗ[F] TauCeti.Octonion F) : Prop :=
  g 1 = 1 ∧ ∀ x y, g (x * y) = g x * g y

/-- A null subspace lies in the trace kernel and has identically zero ordered
multiplication. Norm isotropy alone is insufficient. -/
def IsNullSubspace (F : Type*) [Field F]
    (W : Submodule F (TauCeti.Octonion F)) : Prop :=
  W ≤ TauCeti.Octonion.imaginary F ∧
    ∀ x ∈ W, ∀ y ∈ W, x * y = 0

/-- A null subspace of the split octonions over a characteristic-zero field has
 dimension at most two (Harris--Khare--Thorne, Appendix A.1). -/
theorem nullSubspace_finrank_le_two (F : Type*) [Field F] [CharZero F]
    (W : Submodule F (TauCeti.Octonion F)) (hW : IsNullSubspace F W) :
    Module.finrank F W ≤ 2 := by
  sorry

/-- Any two positive-dimensional null subspaces of the same dimension are
conjugate by an octonion automorphism (Gan--Savin, section 2.4; HKT, Appendix A.1). -/
theorem nullSubspace_transitive (F : Type*) [Field F] [CharZero F]
    (W W' : Submodule F (TauCeti.Octonion F))
    (hW : IsNullSubspace F W) (hW' : IsNullSubspace F W')
    (hpos : 0 < Module.finrank F W)
    (hdim : Module.finrank F W = Module.finrank F W') :
    ∃ g : TauCeti.Octonion F ≃ₗ[F] TauCeti.Octonion F,
      IsOctonionAutomorphism F g ∧ W.map g.toLinearMap = W' := by
  sorry

/-- Incident null line-plane flags form one orbit under octonion automorphisms
(Gan--Savin, section 2.4). Incidence and dimension hypotheses are explicit. -/
theorem nullFlag_transitive (F : Type*) [Field F] [CharZero F]
    (L W L' W' : Submodule F (TauCeti.Octonion F))
    (hW : IsNullSubspace F W) (hW' : IsNullSubspace F W')
    (hLW : L ≤ W) (hLW' : L' ≤ W')
    (hL : Module.finrank F L = 1) (hL' : Module.finrank F L' = 1)
    (hplane : Module.finrank F W = 2) (hplane' : Module.finrank F W' = 2) :
    ∃ g : TauCeti.Octonion F ≃ₗ[F] TauCeti.Octonion F,
      IsOctonionAutomorphism F g ∧
      L.map g.toLinearMap = L' ∧ W.map g.toLinearMap = W' := by
  sorry

end TauCetiRoadmap.ExceptionalThetaCorrespondencesForG2
