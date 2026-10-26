import Mathlib

/-!
# Exotic monoidal structures and abstract automorphicity: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs when their carriers exist. The
unit-free idempotent coherence theorem of README §5.1 is stated below against
native categorical carriers of Mathlib.

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

/-! ## Layer 5: Associativity, trace and local convolution -/

universe v u

/-- A unit-free tensor category structure on `C`: a tensor bifunctor, given by its action on
objects and on pairs of morphisms with preservation of identities and composition, an
associator `(X ⊗ Y) ⊗ Z ≅ X ⊗ (Y ⊗ Z)` natural in all three variables, and the pentagon
identity. No unit object, unitors or symmetry are part of the data (GH11, §3.1, p. 10). -/
structure UnitFreeTensor (C : Type u) [Category.{v} C] where
  /-- The tensor product of two objects. -/
  tensorObj : C → C → C
  /-- The tensor product of two morphisms. -/
  tensorHom {X X' Y Y' : C} : (X ⟶ X') → (Y ⟶ Y') → (tensorObj X Y ⟶ tensorObj X' Y')
  tensor_id (X Y : C) : tensorHom (𝟙 X) (𝟙 Y) = 𝟙 (tensorObj X Y)
  tensor_comp {X X' X'' Y Y' Y'' : C} (f : X ⟶ X') (f' : X' ⟶ X'') (g : Y ⟶ Y')
      (g' : Y' ⟶ Y'') :
      tensorHom (f ≫ f') (g ≫ g') = tensorHom f g ≫ tensorHom f' g'
  /-- The associativity constraint. -/
  assoc (X Y Z : C) : tensorObj (tensorObj X Y) Z ≅ tensorObj X (tensorObj Y Z)
  assoc_naturality {X X' Y Y' Z Z' : C} (f : X ⟶ X') (g : Y ⟶ Y') (h : Z ⟶ Z') :
      tensorHom (tensorHom f g) h ≫ (assoc X' Y' Z').hom =
        (assoc X Y Z).hom ≫ tensorHom f (tensorHom g h)
  pentagon (W X Y Z : C) :
      tensorHom (assoc W X Y).hom (𝟙 Z) ≫ (assoc W (tensorObj X Y) Z).hom ≫
          tensorHom (𝟙 W) (assoc X Y Z).hom =
        (assoc (tensorObj W X) Y Z).hom ≫ (assoc W X (tensorObj Y Z)).hom

/-- The idempotent theorem of Gurevich–Hadani, without a unit: let `T` be a unit-free tensor
category structure on `C`, let `θ : P ⊗ P ≅ P` be an idempotent and let `a : P ≅ P` be its
associativity defect, so that `(θ ⊗ id) ≫ θ ≫ a = α ≫ (id ⊗ θ) ≫ θ`. If `a` intertwines `θ`
on both sides, `(a ⊗ id) ≫ θ = θ ≫ a = (id ⊗ a) ≫ θ`, then `a` is the identity, so `θ` is
compatible with the associator (GH11, Theorem 3.1.2, p. 10, proved in Appendix A, p. 15). -/
theorem idempotent_defect_eq_id {C : Type u} [Category.{v} C] (T : UnitFreeTensor C) (P : C)
    (θ : T.tensorObj P P ≅ P) (a : P ≅ P)
    (hdef : T.tensorHom θ.hom (𝟙 P) ≫ θ.hom ≫ a.hom =
      (T.assoc P P P).hom ≫ T.tensorHom (𝟙 P) θ.hom ≫ θ.hom)
    (hl : T.tensorHom a.hom (𝟙 P) ≫ θ.hom = θ.hom ≫ a.hom)
    (hr : T.tensorHom (𝟙 P) a.hom ≫ θ.hom = θ.hom ≫ a.hom) :
    a.hom = 𝟙 P := by
  sorry

end TauCetiRoadmap.ExoticMonoidalStructuresAndAbstractAutomorphicity
