import Mathlib

/-!
# Étale homotopy types: target signatures

The roadmap is README.md; this file is not the roadmap. It records which of the roadmap's
headline theorems can be stated against the pinned APIs. It states higher derived-limit
vanishing for finite abelian inverse systems. The following other headline theorems are
not statable at the pins without a heavy construction or an artificial substitute.

Layer 0:
* Isaksen's simplicial model structure, properness and the strong-fibration presentation theorem
  lack the homotopy pro-local-system carrier and its model structure on pro-simplicial sets.
* Connected pointed homotopy detection and local-coefficient weak-equivalence detection lack
  those pro-local systems, their cohomology and the associated pointed homotopy category.

Layer 1:
* Sub-pro-group covering representability and invariance of covering categories lack native
  pro-coverings and the pointed pro-space homotopy category.
* Coverings as fibrations and homotopy-isomorphism base change with deck-equivariant cohomology
  lack the Isaksen model, its covering objects and their coefficient comparison.
* Full faithfulness of pro-classifying spaces, representability of maps into them and raw
  K(pi,1) recognition lack the classifying pro-space and raw homotopy-group carriers.

Layer 2:
* The derived constant/limit adjunction and nonabelian profinite derived-limit vanishing lack
  the unstable derived limit and nonabelian derived-limit carriers on these small pro-diagrams.
  The abelian higher-derived-limit assertion is stated below on native additive functors.
* Homotopy groups of materialization for profinite pro-spaces lack their derived materialization.
* Absolute monodromy orbit bijection, pointed isomorphism lifting, relative pointed surjectivity,
  relative isomorphism lifting and the stabilizer orbit bijection lack the pro-space homotopy
  categories and materialized path transport.

Layer 3:
* The profinite-completion universal property for a pro-group lacks the native general pro-group
  carrier and its finite-quotient completion construction.
* Profinite local-coefficient detection, raw K(pi,1) finite-cover effacement and its product
  theorem lack the raw etale type and its homotopy pro-groups.
* Etale local-coefficient comparison, raw/finite fundamental-group comparison, raw profiniteness,
  the field classifying equivalence and finite etale base change lack the rigid etale type.
* Galois-equivariant geometric cohomology transport and the elementary-fibration homotopy
  sequence lack that type, its cover tower and its homotopy-fiber comparison.
* The characteristic-zero finite etale product formula lacks the scheme finite-etale
  fiber-functor fundamental group and its geometric product comparison interface.

Layer 4:
* Open arithmetic image lacks the scheme finite-etale fiber-functor fundamental group.
* Pointed arithmetic lifting, arithmetic isomorphism lifting, the geometric orbit surjection and
  bijection, the outer fundamental-group map, the open-image restriction and the product mapping
  theorem lack the raw etale homotopy category and its arithmetic structural maps.

Layer 5:
* Algebraic evaluation representability lacks the supplied analytification/analytic-points
  functor on quasi-projective complex schemes. Continuous-function evaluation alone is not it.
* Smooth Cech descent and analytic etale hypercover descent lack that functor and its diagonal
  Betti realization. A definition on arbitrary simplicial topological spaces would not state
  these scheme theorems.

Layer 6:
* The p-profinite completion mapping-space universal property and its localized-model comparison
  lack the homotopy-coherent category of p-finite types and its Pro construction.
* Finite-type materialization comparison lacks that p-profinite carrier and materialization.
* The Betti-etale zigzag, mod-p cohomology/homology comparison on finite-type and specified-graded
  objects, field-automorphism naturality, and strictification of the functor and action lack the
  rigid etale realization, its completion, the analytic functor and coherent action carriers.

The stated theorem uses native injective resolutions and the native right-derived limit
functor. No substitute predicates, admitted data, API lemmas or boundary-case theorems are asserted.
-/

namespace TauCetiRoadmap.EtaleHomotopyTypes

open CategoryTheory CategoryTheory.Limits

universe u

/-! ## Layer 2: Materialization and relative monodromy -/

/-- Every positive right-derived inverse limit of a finite abelian group system over a
small cofiltered category vanishes. This is the abelian assertion of Schmidt–Stix Lemma A.7.
The native derived functor retains its injective-resolution existence hypothesis. -/
theorem finiteAbelianHigherLimits (I : Type u) [SmallCategory I] [IsCofiltered I]
    [HasInjectiveResolutions (I ⥤ AddCommGrpCat.{u})]
    (A : I ⥤ AddCommGrpCat.{u}) (hA : ∀ i, Finite (A.obj i))
    (n : ℕ) (hn : 0 < n) :
    letI : (lim : (I ⥤ AddCommGrpCat.{u}) ⥤ AddCommGrpCat.{u}).Additive :=
      Functor.additive_of_preserves_binary_products _
    IsZero (((lim : (I ⥤ AddCommGrpCat.{u}) ⥤ AddCommGrpCat.{u}).rightDerived n).obj A) := by
  sorry

end TauCetiRoadmap.EtaleHomotopyTypes
