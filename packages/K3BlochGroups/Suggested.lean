import Mathlib

/-!
# K3BlochGroups: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap’s headline
theorems against the pinned APIs: the integral diagonal of the antisymmetric tensor cokernel,
the power-map action on cyclic homology, the characteristic-localized third homology of
finite SL₂ and the formally-real order-six theorem. The tensor cokernel and the pre-Bloch
presentation and its symbols are simple definitions on native carriers.

The homological Quillen K₃ comparison and its Hopf kernel lack a Quillen K-group carrier and
plus-construction maps at the pins. The Milnor injection and motivic edge lack the shared
Milnor and motivic carriers. The Suslin exact sequence, its finite-to-infinite compatibility,
transcendental rigidity and arithmetic quotient theorems lack Quillen K₃, the Bloch boundary
and enhanced Tor, and the configuration spectral sequences. The finite Chern isomorphism
also lacks finite-coefficient K-theory and its étale Chern map. The Rogers detector lacks
the supplier’s interval Rogers function and its descent map. These headline results remain in
the README with their full hypotheses. Finite-support certificates and generic kernel-fibre
identities are elementary interfaces, not substitute headlines.
-/

namespace TauCetiRoadmap.K3BlochGroups

open CategoryTheory TensorProduct

/-! ## Layer 3: Bloch presentations with integral conventions -/

/-- The antisymmetric tensor cokernel over any commutative ring, retaining diagonal 2-torsion. -/
abbrev antisymSquare (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M] :=
  (M ⊗[R] M) ⧸ LinearMap.range
    ((LinearMap.id : (M ⊗[R] M) →ₗ[R] (M ⊗[R] M)) +
      (TensorProduct.comm R M M).toLinearMap)

/-- For any abelian group A, the canonical exterior projection is onto with kernel A/2A,
embedded by a ↦ a ∧ a. The final equivalence states exactly the relations on that diagonal. -/
theorem antisymSquare_diagonal_exact (A : Type*) [AddCommGroup A] :
    ∃ p : antisymSquare ℤ A →ₗ[ℤ] (⋀[ℤ]^2 A),
      Function.Surjective p ∧
      (∀ a b : A, p (Submodule.Quotient.mk (a ⊗ₜ[ℤ] b)) = exteriorPower.ιMulti ℤ 2 ![a, b]) ∧
      (∀ z : antisymSquare ℤ A, p z = 0 ↔ ∃ a : A,
        z = (Submodule.Quotient.mk (a ⊗ₜ[ℤ] a) : antisymSquare ℤ A)) ∧
      (∀ a b : A,
        (Submodule.Quotient.mk (a ⊗ₜ[ℤ] a) : antisymSquare ℤ A) =
          (Submodule.Quotient.mk (b ⊗ₜ[ℤ] b) : antisymSquare ℤ A) ↔
        ∃ c : A, a - b = 2 • c) := by
  sorry

/-- The unreduced free symbol on nonzero field elements, extended by zero at zero.
In particular the raw symbol of one is still a free generator. -/
noncomputable def preBlochRawSymbol {F : Type*} [Field F] (x : F) : FreeAbelianGroup Fˣ := by
  classical
  exact if h : x ≠ 0 then FreeAbelianGroup.of (Units.mk0 x h) else 0

/-- Suslin’s pre-Bloch presentation for any field: kill the symbol of one and precisely
five-term expressions at admissible pairs, retaining integral diagonal torsion in its boundary. -/
abbrev preBloch (F : Type*) [Field F] :=
  (FreeAbelianGroup Fˣ) ⧸ AddSubgroup.closure
    {r : FreeAbelianGroup Fˣ | r = preBlochRawSymbol (1 : F) ∨
      ∃ x y : F, x ≠ 0 ∧ x ≠ 1 ∧ y ≠ 0 ∧ y ≠ 1 ∧ x ≠ y ∧
        r = preBlochRawSymbol x - preBlochRawSymbol y + preBlochRawSymbol (y / x) -
          preBlochRawSymbol ((1 - x⁻¹) / (1 - y⁻¹)) +
          preBlochRawSymbol ((1 - x) / (1 - y))}

/-- The pre-Bloch symbol, including its zero extension at zero; the presentation kills one. -/
noncomputable def preBlochSymbol {F : Type*} [Field F] (x : F) : preBloch F :=
  QuotientAddGroup.mk (preBlochRawSymbol x)

/-! ## Layer 4: Configuration homology and the Suslin sequence -/

/-- `cyclicHomology_maps` (§4.15): the power-`a` endomorphism of a cyclic group of order `m`
acts on `H_{2j-1}(C_m, ℤ) ≅ ℤ/m` by `a ^ j`, with the identity coefficient map. At `m = 7`,
`a = 2`, `j = 2` this is multiplication by `4` on `H₃`, the weight-two action of §4.18. -/
theorem cyclicHomology_power_map (m : ℕ) [NeZero m] (a j : ℕ) (hj : 1 ≤ j)
    (φ : Rep.trivial ℤ (Multiplicative (ZMod m)) ℤ ⟶
      Rep.res (powMonoidHom a) (Rep.trivial ℤ (Multiplicative (ZMod m)) ℤ))
    (hφ : φ.hom.toLinearMap = LinearMap.id) :
    ∃ e : groupHomology (Rep.trivial ℤ (Multiplicative (ZMod m)) ℤ) (2 * j - 1) ≃+
        ZMod m,
      ∀ z, e (groupHomology.map (powMonoidHom a) φ (2 * j - 1) z) = (a : ZMod m) ^ j * e z := by
  sorry

/-! ## Layer 5: Finite fields and arithmetic examples -/

/-- The prime-to-characteristic part of unstable SL₂ homology is cyclic of order q²−1.
Hutchinson, Corollary 3.6, arXiv v2, pp14–15. -/
theorem finite_sl2_localized_homology (F : Type) [Field F] [Fintype F]
    (p : ℕ) [Fact p.Prime] [CharP F p] :
    Nonempty (groupHomology
      (Rep.trivial (Localization (Submonoid.powers (p : ℤ)))
        (Matrix.SpecialLinearGroup (Fin 2) F)
        (Localization (Submonoid.powers (p : ℤ)))) 3 ≃+
      ZMod (Fintype.card F ^ 2 - 1)) := by
  sorry

/-- For every formally real field, the universal Bloch cycle [2]+[−1] has exact
additive order six. Its order in the Bloch subgroup equals its order in the pre-Bloch group. -/
theorem blochC_order_six (F : Type*) [Field F] [IsFormallyReal F] :
    addOrderOf (preBlochSymbol (2 : F) + preBlochSymbol (-1 : F)) = 6 := by
  sorry

end TauCetiRoadmap.K3BlochGroups
