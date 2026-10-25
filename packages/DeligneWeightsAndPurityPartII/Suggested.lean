import Mathlib

/-!
# Deligne weights and purity, part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. The native complementary-pair form of
the equivariant Poincaré splitting is statable; applying it in each degree gives
the graded splitting of README §4.4, including a nontrivial top-degree character.

The following headlines are not statable at the pins:
* Detection on closed subgroups, transport, direct-summand purity, finite-extension
  invariance and good reduction (§§0.5–0.10) lack the canonical monodromy filtration,
  monodromy-grade purity and relative local monodromy datum interfaces.
* Deligne's cohomological equal-characteristic theorem and its global-function-field
  consequence (§§1.1–1.2) lack the normalized lisse cohomology representation and its
  monodromy-graded weight interface.
* The coordinate tilt of the completed Kummer tower and its marked Galois equivalence
  (§§2.1–2.4) lack the tower completion, perfectoid-field and functorial tilt carriers
  and comparison maps. Tilting transfer (§2.5) also lacks relative purity.
* Degreewise local constancy and punctured-disc Riemann existence (§§3.2–3.3) lack
  analytic étale sites, derived direct image, oc-quasi-constructibility and Kummer
  covers. Huber's characteristic-zero locally constant-sheaf neighbourhood theorem and
  Ito's all-invertible-order constant-coefficient theorem in either characteristic
  (§3.4), with its Galois-stable application (§3.6), lack analytic and pseudo-adic
  support cohomology, uniform annular direct images and their descent comparisons.
  Cup compatibility (§3.5) uses native Ext functoriality, but its geometric
  application lacks those sites and the module-sheaf cohomology comparison.
* The tilted approximation (§4.1) lacks the toric models, open projection and tube
  interfaces. The multiplicative equivariant comparison (§4.2), its top-degree
  isomorphism (§4.3) and the geometric stable summand (§4.5) lack that actual
  comparison map and the normalized algebraic–adic cohomology comparisons.
* Scholze's Theorem 9.6 and the projective-space/product complete-intersection
  corollaries (§§4.6–4.7) lack the fan-based toric scheme and embedding, set-theoretic
  complete-intersection and geometric weight–monodromy interfaces.

Mathlib's scheme cohomology and absolute Galois group alone do not provide these
constructions or predicates. No abstract proposition is used in their place.
-/

namespace TauCetiRoadmap.DeligneWeightsAndPurityPartII

/-! ## Layer 4: The comparison and toric complete intersections -/

/-- A map of complementary perfect pairings which multiplies the top coordinate
by a nonzero scalar is injective in both arguments. Its first image has as a
complement the annihilator of its second image. If both maps intertwine group
representations and the target pairing transforms by the top character, the two
complementary subspaces are stable. Applied degree by degree to cup products,
this is the equivariant Poincaré splitting used in Scholze's Theorem 9.6. -/
theorem duality_splitting
    {E G U U' V V' : Type*} [Field E] [Group G]
    [AddCommGroup U] [Module E U] [FiniteDimensional E U]
    [AddCommGroup U'] [Module E U'] [FiniteDimensional E U']
    [AddCommGroup V] [Module E V] [FiniteDimensional E V]
    [AddCommGroup V'] [Module E V'] [FiniteDimensional E V']
    (p : U →ₗ[E] U' →ₗ[E] E) (q : V →ₗ[E] V' →ₗ[E] E)
    [p.IsPerfPair] [q.IsPerfPair]
    (a : U →ₗ[E] V) (b : U' →ₗ[E] V') (c : E) (hc : c ≠ 0)
    (hpair : ∀ x y, q (a x) (b y) = c * p x y)
    (ρU : Representation E G U) (ρU' : Representation E G U')
    (ρV : Representation E G V) (ρV' : Representation E G V')
    (ha : ∀ g x, a (ρU g x) = ρV g (a x))
    (hb : ∀ g y, b (ρU' g y) = ρV' g (b y))
    (χ : G →* Eˣ)
    (hq : ∀ g x y, q (ρV g x) (ρV' g y) = (χ g : E) * q x y) :
    Function.Injective a ∧ Function.Injective b ∧
      IsCompl (LinearMap.range a) (LinearMap.ker ((q.flip.comp b).flip)) ∧
      (∀ (g : G) (x : V), x ∈ LinearMap.range a → ρV g x ∈ LinearMap.range a) ∧
      (∀ (g : G) (x : V), x ∈ LinearMap.ker ((q.flip.comp b).flip) →
        ρV g x ∈ LinearMap.ker ((q.flip.comp b).flip)) := by
  sorry

end TauCetiRoadmap.DeligneWeightsAndPurityPartII
