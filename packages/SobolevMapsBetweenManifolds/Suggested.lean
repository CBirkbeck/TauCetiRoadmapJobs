module
import Mathlib
import TauCeti.Analysis.Sobolev.WeakDeriv.Basic
import TauCeti.Geometry.Manifold.Measure
import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume
import TauCeti.Geometry.Manifold.Riemannian.VolumeForm

/-!
# Sobolev maps between manifolds: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. T1 is locality and the three Euclidean
chain rules. T2 is atlas independence, existence and uniqueness of the weak
differential, classical compatibility and the equivalence of null sets. T3 is
the local operator-norm criterion. T4 is the oriented Jacobian, Hadamard,
integrability and change of variables. T5 is the immersion comparison and its
isometric norm identity. T6 is Euclidean compatibility. T7 is independence of
embedding for compact boundaryless targets. All are statable at the pins.

The only new definitions are local membership predicates and the chart formula
for a weak differential. Differential fields are quantified explicitly, so the
signatures do not require a choice of a total weak differential.
-/

open MeasureTheory Set Bundle
open scoped ENNReal Manifold Topology Bundle

namespace TauCetiRoadmap.SobolevMapsBetweenManifolds

/-! ## Layer 1: local classes on Euclidean domains -/

/-- Local Lp membership means Lp membership on every compact subset of the set. -/
def MemLpLoc {X B : Type*} [TopologicalSpace X] [MeasurableSpace X]
    [NormedAddCommGroup B] (μ : Measure X) (p : ℝ≥0∞) (s : Set X) (g : X → B) : Prop :=
  ∀ K : Set X, IsCompact K → K ⊆ s → MemLp g p (μ.restrict K)

variable {E F G E' : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [hEdim : FiniteDimensional ℝ E]
  [MeasurableSpace E] [hEBorel : BorelSpace E]
  [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
  [MeasurableSpace E'] [BorelSpace E']
  [NormedAddCommGroup F] [NormedSpace ℝ F] [hFdim : FiniteDimensional ℝ F]
  [MeasurableSpace F] [BorelSpace F]
  [NormedAddCommGroup G] [NormedSpace ℝ G] [FiniteDimensional ℝ G]

/-- A first-order local Sobolev map on an open set has locally Lp values and a
locally Lp weak Fréchet derivative. Openness is part of this predicate on sets. -/
def MemW1pLoc {E F : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [MeasurableSpace E] [BorelSpace E]
    [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
    (μ : Measure E) [μ.IsAddHaarMeasure] (p : ℝ≥0∞) (s : Set E) (u : E → F) : Prop :=
  ∃ hs : IsOpen s, MemLpLoc μ p s u ∧ ∃ U : E → E →L[ℝ] F,
    TauCeti.HasWeakFDerivOn μ ⟨s, hs⟩ u U ∧ MemLpLoc μ p s U

/-- First-order local membership is detected on any open cover, including
uncountable covers, for every exponent from one to infinity (T1). -/
theorem memW1pLoc_iUnion (μ : Measure E) [μ.IsAddHaarMeasure]
    (p : ℝ≥0∞) (hp : 1 ≤ p) {ι : Type*} (s : ι → Set E)
    (hs : ∀ i, IsOpen (s i)) (u : E → F) :
    MemW1pLoc μ p (⋃ i, s i) u ↔ ∀ i, MemW1pLoc μ p (s i) u := by
  sorry

/-! ## Layer 2: chain rules on Euclidean domains -/

/-- Precomposition by a C1 local diffeomorphism preserves local Sobolev
membership and transports the actual weak derivative by the chain rule (T1). -/
theorem precomp_localDiffeomorph (μ : Measure E) [μ.IsAddHaarMeasure]
    (ν : Measure E') [ν.IsAddHaarMeasure] (p : ℝ≥0∞) (hp : 1 ≤ p)
    (Ω : TopologicalSpace.Opens E) (Ω' : TopologicalSpace.Opens E')
    (u : E → F) (U : E → E →L[ℝ] F) (θ : E' → E)
    (hθ : ContDiffOn ℝ 1 θ Ω') (hmap : MapsTo θ Ω' Ω)
    (hinv : ∀ y ∈ Ω', (fderiv ℝ θ y).IsInvertible)
    (hu : MemW1pLoc μ p Ω u) (hU : TauCeti.HasWeakFDerivOn μ Ω u U) :
    MemW1pLoc ν p Ω' (u ∘ θ) ∧
      TauCeti.HasWeakFDerivOn ν Ω' (u ∘ θ)
        (fun y => (U (θ y)).comp (fderiv ℝ θ y)) := by
  sorry

/-- A globally C1 map with uniformly bounded derivative may be composed with
an arbitrary Sobolev member, with the weak chain rule (T1). -/
theorem postcomp_boundedDerivative (μ : Measure E) [μ.IsAddHaarMeasure]
    (p : ℝ≥0∞) (hp : 1 ≤ p) (Ω : TopologicalSpace.Opens E)
    (u : E → F) (U : E → E →L[ℝ] F) (g : F → G)
    (hg : ContDiff ℝ 1 g) (L : ℝ) (hL : ∀ v, ‖fderiv ℝ g v‖ ≤ L)
    (hu : MemW1pLoc μ p Ω u) (hU : TauCeti.HasWeakFDerivOn μ Ω u U) :
    MemW1pLoc μ p Ω (g ∘ u) ∧
      TauCeti.HasWeakFDerivOn μ Ω (g ∘ u)
        (fun x => (fderiv ℝ g (u x)).comp (U x)) := by
  sorry

/-- For a continuous Sobolev member, a C1 map on any open neighbourhood of
its range suffices; no uniform derivative bound is needed (T1). -/
theorem postcomp_continuous (μ : Measure E) [μ.IsAddHaarMeasure]
    (p : ℝ≥0∞) (hp : 1 ≤ p) (Ω : TopologicalSpace.Opens E)
    (u : E → F) (U : E → E →L[ℝ] F) (g : F → G) (W : Set F)
    (hW : IsOpen W) (hg : ContDiffOn ℝ 1 g W)
    (hc : ContinuousOn u Ω) (hmap : MapsTo u Ω W)
    (hu : MemW1pLoc μ p Ω u) (hU : TauCeti.HasWeakFDerivOn μ Ω u U) :
    MemW1pLoc μ p Ω (g ∘ u) ∧
      TauCeti.HasWeakFDerivOn μ Ω (g ∘ u)
        (fun x => (fderiv ℝ g (u x)).comp (U x)) := by
  sorry

variable {H H' M N : Type*} [TopologicalSpace H] [TopologicalSpace H']
  [TopologicalSpace M] [ChartedSpace H M] [TopologicalSpace N] [ChartedSpace H' N]

/-! ## Layer 3: null sets and local integrability on manifolds -/

/-- Chartwise nullity is equivalent to zero Riemannian outer measure for a
continuous metric on a C1 Lindelöf manifold, including models with boundary (T2). -/
theorem isNullSet_iff_riemannianVolume_eq_zero
    (I : ModelWithCorners ℝ E H) [IsManifold I 1 M]
    [MeasurableSpace M] [BorelSpace M] [LindelofSpace M]
    [RiemannianBundle (fun x : M => TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M => TangentSpace I x)] (s : Set M) :
    TauCeti.IsNullSet I s ↔ TauCeti.riemannianVolume I M s = 0 := by
  sorry

/-! ## Layer 4: Sobolev classes on manifolds and the weak differential -/

/-- Vector-valued local Sobolev membership on a C1 boundaryless manifold is
membership in every preferred extended chart; continuity of the map is not required. -/
def MemVectorW1pLoc {E F : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [MeasurableSpace E] [BorelSpace E]
    [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
    {H M : Type*} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
    (I : ModelWithCorners ℝ E H) [I.Boundaryless]
    [IsManifold I 1 M] (p : ℝ≥0∞) (u : M → F) : Prop :=
  ∀ x : M, ∀ (μ : Measure E) [μ.IsAddHaarMeasure],
    MemW1pLoc μ p (extChartAt I x).target (u ∘ (extChartAt I x).symm)

/-- Continuous manifold-valued local Sobolev membership requires the weak
Euclidean condition on every source-target chart overlap. -/
def MemManifoldW1pLoc {E F : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [MeasurableSpace E] [BorelSpace E]
    [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
    {H H' M N : Type*} [TopologicalSpace H] [TopologicalSpace H']
    [TopologicalSpace M] [ChartedSpace H M] [TopologicalSpace N] [ChartedSpace H' N]
    (I : ModelWithCorners ℝ E H) (J : ModelWithCorners ℝ F H')
    [I.Boundaryless] [J.Boundaryless] [IsManifold I 1 M] [IsManifold J 1 N]
    (p : ℝ≥0∞) (f : M → N) : Prop :=
  Continuous f ∧ ∀ x : M, ∀ y : N, ∀ (μ : Measure E) [μ.IsAddHaarMeasure],
    MemW1pLoc μ p
      ((extChartAt I x).target ∩ (extChartAt I x).symm ⁻¹' (f ⁻¹' (extChartAt J y).source))
      (extChartAt J y ∘ f ∘ (extChartAt I x).symm)

/-- A weak manifold differential is a tangent-map field whose transport to
source-target charts is the actual weak Fréchet derivative of the representative. -/
def HasWeakMDeriv {E F : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [MeasurableSpace E] [BorelSpace E]
    [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
    {H H' M N : Type*} [TopologicalSpace H] [TopologicalSpace H']
    [TopologicalSpace M] [ChartedSpace H M] [TopologicalSpace N] [ChartedSpace H' N]
    (I : ModelWithCorners ℝ E H) (J : ModelWithCorners ℝ F H')
    [I.Boundaryless] [J.Boundaryless] [IsManifold I 1 M] [IsManifold J 1 N]
    (f : M → N) (D : (x : M) → TangentSpace I x →L[ℝ] TangentSpace J (f x)) : Prop :=
  Continuous f ∧ ∀ x : M, ∀ y : N, ∀ (μ : Measure E) [μ.IsAddHaarMeasure],
    ∃ hs : IsOpen ((extChartAt I x).target ∩
        (extChartAt I x).symm ⁻¹' (f ⁻¹' (extChartAt J y).source)),
      TauCeti.HasWeakFDerivOn μ ⟨_, hs⟩
        (extChartAt J y ∘ f ∘ (extChartAt I x).symm)
        (fun z => (mfderiv J 𝓘(ℝ, F) (extChartAt J y) (f ((extChartAt I x).symm z))).comp
          ((D ((extChartAt I x).symm z)).comp
            (mfderiv 𝓘(ℝ, E) I (extChartAt I x).symm z)))

variable (I : ModelWithCorners ℝ E H) (J : ModelWithCorners ℝ F H')
  [I.Boundaryless] [J.Boundaryless] [IsManifold I 1 M] [IsManifold J 1 N]

/-- Any two covering subatlases of the maximal C1 atlases detect precisely
the same continuous local Sobolev maps (T2). -/
theorem memManifoldW1pLoc_iff_atlases (p : ℝ≥0∞) (hp : 1 ≤ p) (f : M → N)
    (hf : Continuous f) (A : Set (OpenPartialHomeomorph M H))
    (B : Set (OpenPartialHomeomorph N H'))
    (hA : A ⊆ IsManifold.maximalAtlas I 1 M)
    (hB : B ⊆ IsManifold.maximalAtlas J 1 N)
    (hcoverA : ∀ x : M, ∃ e ∈ A, x ∈ e.source)
    (hcoverB : ∀ y : N, ∃ e ∈ B, y ∈ e.source) :
    MemManifoldW1pLoc I J p f ↔
      ∀ e ∈ A, ∀ e' ∈ B, ∀ (μ : Measure E) [μ.IsAddHaarMeasure],
        MemW1pLoc μ p
          ((e.extend I).target ∩ (e.extend I).symm ⁻¹' (f ⁻¹' e'.source))
          (e'.extend J ∘ f ∘ (e.extend I).symm) := by
  sorry

/-- On a Lindelöf source, a continuous local Sobolev map has a weak
differential, and any two such fields agree outside a chartwise null set (T2). -/
theorem exists_hasWeakMDeriv [LindelofSpace M] (p : ℝ≥0∞) (hp : 1 ≤ p)
    (f : M → N) (hf : MemManifoldW1pLoc I J p f) :
    (∃ D, HasWeakMDeriv I J f D) ∧
      ∀ D D', HasWeakMDeriv I J f D → HasWeakMDeriv I J f D' →
        TauCeti.IsNullSet I {x | D x ≠ D' x} := by
  sorry

/-- Every C1 map belongs to every first-order local class, with the
classical manifold differential as a weak differential (T2). -/
theorem contMDiff_memManifoldW1pLoc (p : ℝ≥0∞) (hp : 1 ≤ p)
    (f : M → N) (hf : ContMDiff I J 1 f) :
    MemManifoldW1pLoc I J p f ∧ HasWeakMDeriv I J f (mfderiv I J f) := by
  sorry

/-! ## Layer 5: the operator norm of the differential -/

/-- Given W11 membership and any weak differential, W1p membership is
exactly local Lp membership of its Riemannian operator norm (T3). -/
theorem memManifoldW1pLoc_iff_norm [LindelofSpace M]
    [MeasurableSpace M] [BorelSpace M]
    [RiemannianBundle (fun x : M => TangentSpace I x)]
    [RiemannianBundle (fun y : N => TangentSpace J y)]
    [IsContinuousRiemannianBundle E (fun x : M => TangentSpace I x)]
    [IsContinuousRiemannianBundle F (fun y : N => TangentSpace J y)]
    (p : ℝ≥0∞) (hp : 1 ≤ p) (f : M → N)
    (hf : MemManifoldW1pLoc I J 1 f)
    (D : (x : M) → TangentSpace I x →L[ℝ] TangentSpace J (f x))
    (hD : HasWeakMDeriv I J f D) :
    MemManifoldW1pLoc I J p f ↔
      MemLpLoc (TauCeti.riemannianVolume I M) p univ (fun x => ‖D x‖) := by
  sorry

/-! ## Layer 6: Jacobians -/

/-- The weak differential of an oriented equal-dimensional Sobolev map has
a unique pointwise Jacobian, characterized by pullback of the volume form;
it satisfies Hadamard and the local p/n integrability bound for positive n (T4). -/
theorem jacobian_hadamard_integrability [LindelofSpace M]
    [MeasurableSpace M] [BorelSpace M]
    [RiemannianBundle (fun x : M => TangentSpace I x)]
    [RiemannianBundle (fun y : N => TangentSpace J y)]
    [IsContinuousRiemannianBundle E (fun x : M => TangentSpace I x)]
    [IsContinuousRiemannianBundle F (fun y : N => TangentSpace J y)]
    (n : ℕ) (hn : 0 < n)
    (oM : TauCeti.Manifold.Orientation I M (Fin n))
    (oN : TauCeti.Manifold.Orientation J N (Fin n))
    (p : ℝ≥0∞) (hp : 1 ≤ p) (f : M → N)
    (hf : MemManifoldW1pLoc I J p f)
    (D : (x : M) → TangentSpace I x →L[ℝ] TangentSpace J (f x))
    (hD : HasWeakMDeriv I J f D) :
    ∃ j : M → ℝ,
      (∀ x, (TauCeti.riemannianVolumeForm oN (f x)).compContinuousLinearMap (D x) =
        j x • TauCeti.riemannianVolumeForm oM x) ∧
      (∀ j' : M → ℝ, (∀ x,
        (TauCeti.riemannianVolumeForm oN (f x)).compContinuousLinearMap (D x) =
          j' x • TauCeti.riemannianVolumeForm oM x) → j' = j) ∧
      (∀ x, |j x| = LinearMap.normDet (D x).toLinearMap) ∧
      (∀ x, |j x| ≤ ‖D x‖ ^ n) ∧
      MemLpLoc (TauCeti.riemannianVolume I M) (p / (n : ℝ≥0∞)) univ j := by
  sorry

/-- For a C1 open embedding, the density given by the absolute oriented
Jacobian computes target volume of every Borel image, with no multiplicity (T4). -/
theorem jacobian_changeOfVariables [LindelofSpace M] [LindelofSpace N]
    [MeasurableSpace M] [BorelSpace M] [MeasurableSpace N] [BorelSpace N]
    [RiemannianBundle (fun x : M => TangentSpace I x)]
    [RiemannianBundle (fun y : N => TangentSpace J y)]
    [IsContinuousRiemannianBundle E (fun x : M => TangentSpace I x)]
    [IsContinuousRiemannianBundle F (fun y : N => TangentSpace J y)]
    (n : ℕ) (oM : TauCeti.Manifold.Orientation I M (Fin n))
    (oN : TauCeti.Manifold.Orientation J N (Fin n))
    (f : M → N) (hf : ContMDiff I J 1 f) (he : Topology.IsOpenEmbedding f)
    (hi : ∀ x, Function.Bijective (mfderiv I J f x)) (j : M → ℝ)
    (hj : ∀ x, (TauCeti.riemannianVolumeForm oN (f x)).compContinuousLinearMap
      (mfderiv I J f x) = j x • TauCeti.riemannianVolumeForm oM x)
    (A : Set M) (hA : MeasurableSet A) :
    ((TauCeti.riemannianVolume I M).withDensity (fun x => ENNReal.ofReal |j x|)) A =
      TauCeti.riemannianVolume J N (f '' A) := by
  sorry

/-! ## Layer 7: Euclidean domains -/

/-- On an open Euclidean domain, manifold membership is exactly continuous
Euclidean local membership, and the manifold and Euclidean weak derivative
relations coincide under the native tangent identifications (T6). -/
theorem euclidean_compatibility (μ : Measure E) [μ.IsAddHaarMeasure]
    (p : ℝ≥0∞) (hp : 1 ≤ p) (Ω : TopologicalSpace.Opens E) (u : E → F) :
    (MemManifoldW1pLoc 𝓘(ℝ, E) 𝓘(ℝ, F) p (fun x : Ω => u x) ↔
      ContinuousOn u Ω ∧ MemW1pLoc μ p Ω u) ∧
    (∀ U : E → E →L[ℝ] F, ContinuousOn u Ω →
      (HasWeakMDeriv 𝓘(ℝ, E) 𝓘(ℝ, F) (fun x : Ω => u x) (fun x => U x) ↔
        TauCeti.HasWeakFDerivOn μ Ω u U)) := by
  sorry

/-! ## Layer 8: immersions, embeddings and the extrinsic class -/

/-- A C1 immersion detects continuous local Sobolev membership and transports
its weak differential by the immersion differential (T5). -/
theorem immersion_comparison (p : ℝ≥0∞) (hp : 1 ≤ p)
    (ι : N → G) (hι : ContMDiff J 𝓘(ℝ, G) 1 ι)
    (hi : ∀ y, Function.Injective (mfderiv J 𝓘(ℝ, G) ι y))
    (f : M → N) (hc : Continuous f) :
    (MemManifoldW1pLoc I J p f ↔ MemVectorW1pLoc I p (ι ∘ f)) ∧
      (∀ D : (x : M) → TangentSpace I x →L[ℝ] TangentSpace J (f x),
        HasWeakMDeriv I J f D →
        HasWeakMDeriv I 𝓘(ℝ, G) (ι ∘ f)
          (fun x => (mfderiv J 𝓘(ℝ, G) ι (f x)).comp (D x))) := by
  sorry

/-- For an isometric immersion the extrinsic differential has precisely the
intrinsic Riemannian operator norm, for every weak differential (T5). -/
theorem isometric_immersion_norm {V : Type*} [NormedAddCommGroup V]
    [InnerProductSpace ℝ V] [FiniteDimensional ℝ V]
    [RiemannianBundle (fun x : M => TangentSpace I x)]
    [RiemannianBundle (fun y : N => TangentSpace J y)]
    (ι : N → V) (hι : ContMDiff J 𝓘(ℝ, V) 1 ι)
    (hisom : ∀ y (v w : TangentSpace J y),
      inner ℝ (mfderiv J 𝓘(ℝ, V) ι y v) (mfderiv J 𝓘(ℝ, V) ι y w) = inner ℝ v w)
    (f : M → N) (D : (x : M) → TangentSpace I x →L[ℝ] TangentSpace J (f x))
    (hD : HasWeakMDeriv I J f D) :
    ∀ x, ‖(mfderiv J 𝓘(ℝ, V) ι (f x)).comp (D x)‖ = ‖D x‖ := by
  sorry

/-- For a compact boundaryless target, any two C1 embeddings define the same
extrinsic Sobolev class, including discontinuous members and p equal to infinity (T7). -/
theorem embedding_independence [CompactSpace N] (p : ℝ≥0∞) (hp : 1 ≤ p)
    (ι₁ : N → G) (ι₂ : N → E')
    (h₁ : Manifold.IsSmoothEmbedding J 𝓘(ℝ, G) 1 ι₁)
    (h₂ : Manifold.IsSmoothEmbedding J 𝓘(ℝ, E') 1 ι₂) (u : M → N) :
    MemVectorW1pLoc I p (ι₁ ∘ u) ↔ MemVectorW1pLoc I p (ι₂ ∘ u) := by
  sorry

end TauCetiRoadmap.SobolevMapsBetweenManifolds
