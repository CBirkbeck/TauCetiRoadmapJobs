import Mathlib

/-!
# Exotic monoidal structures and abstract automorphicity: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. The unit-free idempotent coherence
headline is statable by bundling a native tensor functor and its associator.

The following headlines are not statable at the pins:
* the rigidified triality lift: the smooth scalar metaplectic extension is missing;
* the singular-stratum and Kirillov spectral theorems, and local zeta comparison:
  the smooth balanced tensor, smooth Tor, triality kernel and Kirillov carriers are missing;
* the Whittaker unit, trace, unit-centre theorem and degeneracy-free equivalence:
  the smooth exotic product, Whittaker unit and firm Bernstein enrichment are missing;
* the spherical equivalence, joint generation, unique exotic associator, generic
  idempotent algebras and local convolution: the constructed exotic category and
  spherical coalgebra are missing;
* categorical Frobenius self-duality: the ordinary presentable complex-linear
  categorical tensor and smooth Eilenberg-Watts comparison are missing;
* the adelic monoidal structure, rational theta invariance, theta multiplication,
  global zeta comparison, Poincare image and compact automorphic algebra:
  the restricted tensor kernels and smooth automorphic function carriers are missing;
* fully faithful automorphic realization, its closure properties and automorphicity
  of matrix Schwartz space: the actual exotic algebra I and its modules are missing;
* the spin spherical coalgebra, convolution, section independence and weighted
  inverse-transpose automorphism: the theta characteristic and adelic coalgebra
  carriers and their constructed product are missing;
* the universal rank-one induction quotient, lax induction, localized unit and
  multiplicative intertwiner: the smooth normalization module, internal Hom and
  tensor-compatible localization are missing;
* automorphic adjunction, Weyl lifting, cuspidal/Eisenstein decomposition,
  irreducible automorphic comparison and finite-length restriction: the actual
  automorphic categories, smooth adelic torus functions and normalized functors
  are missing.
-/

namespace TauCetiRoadmap.ExoticMonoidalStructuresAndAbstractAutomorphicity

open CategoryTheory

universe v u

/-! ## Layer 5: Associativity, trace and local convolution -/

/-- A tensor functor with a natural associator satisfying the pentagon, with no
unit object assumed. This bundles native functors and isomorphisms; the two laws
are equations on their actual morphisms. -/
structure AssociativeTensor (C : Type u) [Category.{v} C] where
  tensor : C × C ⥤ C
  associator : ∀ X Y Z : C,
    tensor.obj (tensor.obj (X, Y), Z) ≅ tensor.obj (X, tensor.obj (Y, Z))
  naturality : ∀ {X Y Z X' Y' Z' : C}
    (f : X ⟶ X') (g : Y ⟶ Y') (h : Z ⟶ Z'),
    tensor.map (tensor.map (f, g), h) ≫ (associator X' Y' Z').hom =
      (associator X Y Z).hom ≫ tensor.map (f, tensor.map (g, h))
  pentagon : ∀ W X Y Z : C,
    tensor.map ((associator W X Y).hom, 𝟙 Z) ≫
        (associator W (tensor.obj (X, Y)) Z).hom ≫
        tensor.map (𝟙 W, (associator X Y Z).hom) =
      (associator (tensor.obj (W, X)) Y Z).hom ≫
        (associator W X (tensor.obj (Y, Z))).hom

/-- If the associativity defect of an invertible multiplication intertwines
multiplication in both variables, then the defect is the identity. This is the
unit-free idempotent theorem of Gurevich-Hadani, Theorem 3.1.2 and Appendix A. -/
theorem idempotent_coherence
    {C : Type u} [Category.{v} C] (T : AssociativeTensor C)
    (P : C) (θ : T.tensor.obj (P, P) ≅ P) (a : P ≅ P)
    (hdef : T.tensor.map (θ.hom, 𝟙 P) ≫ θ.hom ≫ a.hom =
      (T.associator P P P).hom ≫ T.tensor.map (𝟙 P, θ.hom) ≫ θ.hom)
    (hleft : T.tensor.map (a.hom, 𝟙 P) ≫ θ.hom = θ.hom ≫ a.hom)
    (hright : T.tensor.map (𝟙 P, a.hom) ≫ θ.hom = θ.hom ≫ a.hom) :
    a = Iso.refl P := by
  sorry

end TauCetiRoadmap.ExoticMonoidalStructuresAndAbstractAutomorphicity
