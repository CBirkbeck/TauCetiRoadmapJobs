import Mathlib
import TauCeti.Analysis.PositiveDefinite.Kernel.Kolmogorov
import TauCeti.RepresentationTheory.Continuous.Unitary.Basic

/-!
# Smooth representations of local groups, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states headline theorems
against the pinned APIs, using the native continuous representations and Kolmogorov spaces.

The following headlines are not statable with these APIs and a few simple definitions.
Weak-star compactness needs the integrated positive-type embedding into the L-infinity/weak-dual
model. The sum/closure and isolated-summand theorems need the unitary-equivalence quotient,
its Fell topology, and its Hilbert-sum comparison. Bernstein admissibility, the smooth/unitary
dual bijection, character-limit theorems of Milicic and Tadic, and Gan–Savin's generic-limit
result require the reductive rational-point smooth categories, Hecke/distribution characters,
and normalized parabolic functors. Howe–Moore in the algebraic-group setting and isolation
of Steinberg and supercuspidals need those rational-point groups and their named representations.
The spherical unitary classification, half-integral classification and split/nonsplit generic
temperedness tests need the Satake spherical constituent, affine/graded Hecke categories and
unitarity comparison. Aubert duality and parameter compatibility need the finite-length
Grothendieck group and semisimple local-parameter functor. Kazhdan–Lusztig classification,
central-point unitarity, complementary-series reduction and the extraneous-point lists need
enhanced Springer parameters and the spherical/graded-Hecke dictionary. The E8 extra-region
exclusion belongs to that dictionary; a theorem about four unrelated scalars would not state it.
-/

namespace TauCetiRoadmap.SmoothRepresentationsOfLocalGroupsPartII

noncomputable section

open scoped InnerProductSpace ComplexOrder ENNReal
open MeasureTheory Filter

universe u v w

/-! ## Layer SRU.0: Unitary representations and functions of positive type -/

/-- Strong continuity is continuity of each orbit map, separately from continuity of operators. -/
def IsStronglyContinuous {G : Type u} [Group G] [TopologicalSpace G]
    {H : Type v} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (π : ContRepresentation ℂ G H) : Prop :=
  ∀ v : H, Continuous (fun g : G => π g v)

/-- A representation is topologically irreducible if it is nonzero and has only the two
closed invariant complex subspaces. This is the shared Hilbert-space convention. -/
def IsTopologicallyIrreducible {G : Type u} [Group G]
    {H : Type v} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (π : ContRepresentation ℂ G H) : Prop :=
  Nontrivial H ∧ ∀ W : Submodule ℂ H, IsClosed (W : Set H) →
    (∀ g : G, ∀ v ∈ W, π g v ∈ W) → W = ⊥ ∨ W = ⊤

/-- Algebraic positive type on a possibly nonabelian group, using the kernel a⁻¹b.
Continuity is a separate condition. -/
def IsPositiveType {G : Type u} [Group G] (φ : G → ℂ) : Prop :=
  Matrix.PosSemidef (fun a b : G => φ (a⁻¹ * b))

/-- The convex set of continuous normalized positive-type functions. -/
def positiveTypeOne (G : Type u) [Group G] [TopologicalSpace G] : Set (G → ℂ) :=
  {φ | Continuous φ ∧ IsPositiveType φ ∧ φ 1 = 1}

/-- The positive-type coefficient uses Mathlib's inner product, linear in the second slot. -/
def ptCoeff {G : Type u} [Group G]
    {H : Type v} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (π : ContRepresentation ℂ G H) (v : H) (g : G) : ℂ :=
  inner ℂ v (π g v)

/-- GNS realization for a continuous positive-type function on an arbitrary topological group:
left translation on the native Kolmogorov features extends to a strongly continuous unitary
representation. The feature at the identity is its cyclic vector (BHV C.4.10). -/
theorem exists_gnsRep {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (φ : G → ℂ) (hcont : Continuous φ)
    (hφ : IsPositiveType φ) :
    ∃ π : ContRepresentation ℂ G (Matrix.PosSemidef.KolmogorovSpace hφ),
      TauCeti.ContRepresentation.IsUnitary π ∧ IsStronglyContinuous π ∧
      ∀ g a : G, π g (Matrix.PosSemidef.kolmogorovFeature hφ a) =
        Matrix.PosSemidef.kolmogorovFeature hφ (g * a) := by
  sorry

/-- A normalized positive-type function is an extreme point exactly when its GNS action
is topologically irreducible. The translation equation identifies the action with the
GNS construction, rather than an unrelated representation (BHV C.5.2). -/
theorem mem_extremePoints_positiveTypeOne_iff {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] (φ : G → ℂ)
    (hcont : Continuous φ) (hφ : IsPositiveType φ) (hnorm : φ 1 = 1)
    (π : ContRepresentation ℂ G (Matrix.PosSemidef.KolmogorovSpace hφ))
    (hunitary : TauCeti.ContRepresentation.IsUnitary π)
    (hstrong : IsStronglyContinuous π)
    (htranslation : ∀ g a : G, π g (Matrix.PosSemidef.kolmogorovFeature hφ a) =
      Matrix.PosSemidef.kolmogorovFeature hφ (g * a)) :
    φ ∈ Set.extremePoints ℝ (positiveTypeOne G) ↔ IsTopologicallyIrreducible π := by
  sorry

/-! ## Layer SRU.1: Weak containment and the Fell topology -/

/-- Coefficient weak containment: every coefficient is approximated on every compact set
by a finite sum of coefficients of the containing representation (BHV F.1.1). -/
def WeaklyContainedIn {G : Type u} [Group G] [TopologicalSpace G]
    {H : Type v} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    {H' : Type w} [NormedAddCommGroup H'] [InnerProductSpace ℂ H']
    (σ : ContRepresentation ℂ G H) (π : ContRepresentation ℂ G H') : Prop :=
  ∀ v : H, ∀ Q : Set G, IsCompact Q → ∀ ε : ℝ, 0 < ε →
    ∃ n : ℕ, ∃ z : Fin n → H', ∀ g ∈ Q,
      ‖ptCoeff σ v g - ∑ j, ptCoeff π (z j) g‖ < ε

/-- Milman's converse: the extreme points of a compact closed convex hull lie in the
closure of its generating set. This is the convex-geometric input for single coefficients. -/
theorem extremePoints_closure_convexHull_subset_closure
    {E : Type u} [AddCommGroup E] [Module ℝ E] [TopologicalSpace E]
    [IsTopologicalAddGroup E] [ContinuousSMul ℝ E] [T2Space E]
    [LocallyConvexSpace ℝ E] (S : Set E)
    (hcompact : IsCompact (closure (convexHull ℝ S))) :
    Set.extremePoints ℝ (closure (convexHull ℝ S)) ⊆ closure S := by
  sorry

/-- Godement's integrated criterion: an essentially bounded function has a continuous
positive-type representative exactly when all its compactly supported integrated quadratic
forms are real and nonnegative (BHV C.5.3). -/
theorem godement {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [T2Space G] [LocallyCompactSpace G] [SecondCountableTopology G]
    [MeasurableSpace G] [BorelSpace G] (μ : Measure G) [μ.IsHaarMeasure]
    (φ : Lp ℂ (⊤ : ℝ≥0∞) μ) :
    (∃ ψ : G → ℂ, Continuous ψ ∧ IsPositiveType ψ ∧ (ψ =ᵐ[μ] φ)) ↔
      ∀ f : CompactlySupportedContinuousMap G ℂ,
        (∫ y, ∫ x, f x * star (f y) * φ (y⁻¹ * x) ∂μ ∂μ).im = 0 ∧
        0 ≤ (∫ y, ∫ x, f x * star (f y) * φ (y⁻¹ * x) ∂μ ∂μ).re := by
  sorry

/-- Raikov's theorem: for normalized positive-type functions, convergence against every
L1 test function is equivalent to compact-open convergence (BHV C.5.6). -/
theorem raikov {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [T2Space G] [LocallyCompactSpace G] [SecondCountableTopology G]
    [MeasurableSpace G] [BorelSpace G] (μ : Measure G) [μ.IsHaarMeasure]
    {ι : Type v} (l : Filter ι) (φ : ι → C(G, ℂ)) (ψ : C(G, ℂ))
    (hφ : ∀ i, (φ i : G → ℂ) ∈ positiveTypeOne G)
    (hψ : (ψ : G → ℂ) ∈ positiveTypeOne G) :
    Tendsto φ l (nhds ψ) ↔
      ∀ f : Lp ℂ 1 μ, Tendsto (fun i => ∫ g, f g * φ i g ∂μ) l
        (nhds (∫ g, f g * ψ g ∂μ)) := by
  sorry

/-- An irreducible representation weakly contained in π has every unit-vector coefficient
approximable by a single unit-vector coefficient of π (BHV F.1.4). -/
theorem exists_coeff_approx_of_weaklyContainedIn
    {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [T2Space G] [LocallyCompactSpace G] [SecondCountableTopology G]
    {H : Type v} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    {H' : Type w} [NormedAddCommGroup H'] [InnerProductSpace ℂ H'] [CompleteSpace H']
    (σ : ContRepresentation ℂ G H) (π : ContRepresentation ℂ G H')
    (hσu : TauCeti.ContRepresentation.IsUnitary σ) (hπu : TauCeti.ContRepresentation.IsUnitary π)
    (hσc : IsStronglyContinuous σ) (hπc : IsStronglyContinuous π)
    (hirr : IsTopologicallyIrreducible σ) (hweak : WeaklyContainedIn σ π)
    (v : H) (hv : ‖v‖ = 1) (Q : Set G) (hQ : IsCompact Q) (ε : ℝ) (hε : 0 < ε) :
    ∃ w : H', ‖w‖ = 1 ∧ ∀ g ∈ Q, ‖ptCoeff σ v g - ptCoeff π w g‖ < ε := by
  sorry

end

end TauCetiRoadmap.SmoothRepresentationsOfLocalGroupsPartII
