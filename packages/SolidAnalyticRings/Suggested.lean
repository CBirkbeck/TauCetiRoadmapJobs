import Mathlib

/-!
# Solid spectral analytic coefficients: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. At universe zero, §1.5's abelian
solidification, countable integer-product compact projective generator and
ordinary derived-category reflection are statable below. Compactness in the
abelian category means preservation by Hom of filtered colimits indexed in
Lean universe 1, the hom universe of the native category.

The remaining headlines are not statable at the pins, for the indicated missing
carriers.

* Layer 1, §1.2: the fully faithful symmetric monoidal discrete spectral
  embedding, left adjoint to point evaluation, lacks the concrete stable
  spectrum carrier and the enhanced category of light spectral hypersheaves.
* Layer 1, §1.5: the closed abelian solid tensor needs the solidification
  functor as constructed data. The enhanced derived comparison and derived
  product-tensor theorem need the enhanced light solid category and its
  monoidal structure; the pinned ordinary DerivedCategory has no derived
  tensor. Above universe zero the marked convergent-sequence carrier and
  its transport of §1.3 are also missing.
* Layer 2, §2.1: solidity detected on every homotopy sheaf and the complete
  homotopy t-structure lack light spectral hypersheaves, their null object
  and homotopy sheaves.
* Layer 2, §2.2: connective symmetric monoidal solidification and the free
  spectral measure formula lack the enhanced light solid spectral category,
  its reflection and its spectral internal Hom.
* Layer 2, §2.3: the symmetric monoidal HZ-linear derived comparison and
  bounded-below integer detection lack solid spectra, spectral HZ-modules
  and the enhanced derived light solid abelian category.
* Layer 2, §2.4: the countable sphere-product compact generator and its
  module versions lack spectra, solid spectral tensor and enhanced spectral
  module categories.
* Layer 3, §3.1: the countable product solid tensor comparison lacks the
  sphere and solid spectral tensor.
* Layer 3, §3.3: the independent split-tower tensor and diagonal comparisons
  lack coherent spectral towers and solid spectral tensor.
* Layer 3, §3.4: balancing on solid spectral modules and dualizable scalar
  change through limits lack enhanced spectral algebra/module categories
  and relative solid tensor. The generic bar formalism is supplied by
  EnhancedDerivedSheaves rather than constructed here.
* Layer 4, §4.1: countable limits commuting with omega-one-filtered colimits
  on light spectral sheaves and fixed-algebra modules lack these enhanced
  carriers and their coherent diagram categories.
* Layer 5, §§5.3–5.4: the completed block-sum spectral null-family theorem,
  in every homotopy degree and natural for finite-output block maps, lacks
  connective solid spectral algebras, their marked cofiber towers and
  coherent spectral module completion. A proper-profile predicate alone
  cannot state this theorem.
* Layer 6, §6.1: uniformly bounded-below free solid resolutions lack solid
  spectral module categories, their compact generator and realizations.
* Layer 6, §6.2: the sharp connectivity bound for general scalar quotient
  completion lacks solid spectral modules, spectral homotopy groups and
  coherent cofiber-tower limits.
* Layer 6, §6.3: uniformly bounded-below realization commuting with quotient
  completion, with the skeletal tail bound, lacks the same enhanced module
  and simplicial realization carriers.
* Layer 6, §6.4: the prime-power null-family theorem (with marked spectral
  fibers), the fully faithful prime-completed embedding, bounded-below
  tensor closure and completed-sphere monoidal comparison lack ordinary
  spectra, light solid spectra and coherent derived prime completions.
* Layer 7, §7.2: completed tensor, scalar-extension adjunction and commuting-
  square comparisons lack spectral analytic structures as reflective full
  enhanced module subcategories and their relative solid tensors.
* Layer 7, §7.3: spectral summability localization as an analytic structure,
  including connective preservation, lacks the solid spectral generator,
  spectral analytic structures and enhanced localization functors.
* Layer 7, §7.4: the integer-measure spectral comparison on the specified
  common light presentation diagrams
  lacks the supplier's enhanced analytic-measure module category, the light
  HZ-linear spectral realization and coherent site/cutoff comparisons.

The native site and ordinary light sheaves are usable inputs. The remaining
headlines require more than simple definitions on those carriers.
The spectral, enhanced derived monoidal and analytic constructions themselves
are targets of this roadmap and its named suppliers.
-/

namespace TauCetiRoadmap.SolidAnalyticRings

open CategoryTheory Limits MonoidalCategory LightProfinite LightCondensed

noncomputable section

/-! ## Layer 1: Light spectral sheaves and the null-sequence test -/

/-- On the marked convergent sequence, shift each natural number up by one and fix infinity. -/
def natShift : ℕ∪{∞} ⟶ ℕ∪{∞} :=
  CompHausLike.ofHom _ ⟨OnePoint.map (· + 1), OnePoint.continuous_map continuous_of_discreteTopology
    (by simpa [Filter.coclosedCompact_eq_cocompact, Filter.cocompact_eq_cofinite,
      Nat.cofinite_eq_atTop] using Filter.tendsto_add_atTop_nat 1)⟩

/-- The inclusion of the marked limit point into the convergent sequence. -/
def inftyPoint : LightProfinite.of PUnit ⟶ ℕ∪{∞} :=
  CompHausLike.ofHom _ (ContinuousMap.const _ OnePoint.infty)

/-- The free light condensed integer module on a null sequence, with its limit point killed. -/
abbrev nullSeq : LightCondAb :=
  cokernel ((free ℤ).map (lightProfiniteToLightCondSet.map inftyPoint))

/-- The endomorphism of the integer null-sequence object induced by the marked shift. -/
def nullShift : nullSeq ⟶ nullSeq :=
  cokernel.desc _ ((free ℤ).map (lightProfiniteToLightCondSet.map natShift) ≫ cokernel.π _) (by
    have h : inftyPoint ≫ natShift = inftyPoint := by ext x; rfl
    rw [← Category.assoc, ← Functor.map_comp, ← Functor.map_comp, h]
    exact cokernel.condition _)

/-- A light condensed abelian group is solid when one minus shift-precomposition is
invertible on its internal Hom from the null-sequence object (RC Definition 3.2.1, p.16). -/
def IsLightSolid : ObjectProperty LightCondAb := fun B =>
  IsIso (𝟙 ((ihom nullSeq).obj B) - (MonoidalClosed.pre nullShift).app B)

/-- The light solid inclusion has a left adjoint, and the countable product of discrete
integers is a solid compact projective generator, with filtered index categories in
Lean universe 1 (RC Theorem 3.2.4(2),(12), p.17). -/
theorem isLightSolid_reflective_and_generator :
    IsLightSolid.ι.IsRightAdjoint ∧
      ∃ h : IsLightSolid (∏ᶜ fun _ : ℕ => (discrete (ModuleCat ℤ)).obj (ModuleCat.of ℤ ℤ)),
        Projective (⟨_, h⟩ : IsLightSolid.FullSubcategory) ∧
        IsFinitelyPresentable.{1} (⟨_, h⟩ : IsLightSolid.FullSubcategory) ∧
        IsSeparator (⟨_, h⟩ : IsLightSolid.FullSubcategory) := by
  sorry

/-- The ordinary derived category's full subcategory of complexes with light-solid
cohomology has a left-adjoint reflection (RC Theorem 3.2.4(5)–(6), p.17). -/
theorem derivedLightSolid_isRightAdjoint [HasDerivedCategory LightCondAb] :
    (ObjectProperty.ι (fun K : DerivedCategory LightCondAb =>
      ∀ n : ℤ, IsLightSolid ((DerivedCategory.homologyFunctor LightCondAb n).obj K))).IsRightAdjoint := by
  sorry

end

end TauCetiRoadmap.SolidAnalyticRings
