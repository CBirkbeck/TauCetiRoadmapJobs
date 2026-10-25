import Mathlib
import TauCeti.NumberTheory.ModularForms.Newforms.Newform

/-!
# GL₂ modularity lifting, part II: target signatures

The roadmap is README.md; this file is not the roadmap. It records the roadmap's
headline theorems against the pinned APIs. The minimal weight-one modularity and
finite-image theorems are stated below using native Galois groups, valuation subrings
and classical newforms. The other headlines lack the following arithmetic carriers.

* Balanced coherent homology (Layer 1): missing the integral Katz Hodge cohomology
  and compact dual coherent homology of the actual diamond-level curves, with Hecke action.
* Hasse doubling and individual ordinary projections (Layer 2): missing Katz weight-one
  forms over finite coefficient quotients and the compatible high-weight ordinary Hecke images.
* Torsion weight-one local–global compatibility in all three Frobenius cases (Layer 3):
  missing the actual Katz torsion Hecke image and its arithmetic Galois representation.
* Minimal weight-one R = T and conductor rank one, including torsion (Layer 4):
  missing the minimal global deformation ring, conductor Katz module and its Hecke image.
* Type-bundle local freeness, arbitrary coefficient base change and cusp-corrected duality
  (Layer 5): missing the compactified modular-curve cover and its invariant-pushforward bundles.
* Minimal weight-one R = T with vexing types and its generic rank (Layer 6): missing
  the CDT coefficient bundles, their Hecke images and the matching minimal deformation ring.
* Global scalar type-three comparison and integral character twisting (Layer 7):
  missing the matching ordinary global deformation family and character-restricted Hecke images.
* Scalar-Frobenius multiplicity two (Layer 7): missing the modular Jacobian, full Hecke
  ideal, ordinary eigenvalue-adorned global ring and variable-determinant type-three comparison.
* Localized Bianchi amplitude and balancedness, including the conditional 3-primary case
  (Layer 9): missing arithmetic PGL₂ orbifold homology with the prescribed Hecke localization,
  minimal-type coefficients and stabilizer/duality comparison.
* Conditional minimal Bianchi R = T (Layer 10): missing the matched minimal deformation
  ring and Hecke homology image on which the all-level Conjecture A hypothesis is stated.
* Dimension-zero Bianchi complete intersection and exact generic rank (Layer 10):
  missing that same arithmetic Hecke ring and its actual finite-level automorphic type spaces.
* Minimal semistable Bianchi modularity lifting (Layer 10): missing the exact local
  minimality conditions, residual minimal-level homology and matched automorphic realization.

The native classical newform carrier states the characteristic-zero modularity conclusion;
it does not replace integral Katz forms in the R = T headlines above.
No matrix calculation, arbitrary ring isomorphism or free proposition replaces a headline.
-/

namespace TauCetiRoadmap.GL2ModularityLiftingPartII


/-! ## Layer 4: Minimal weight-one modularity and finite image -/

/-- A valuation of the algebraic closure of ℚ lies above ℓ when its residue field
has characteristic ℓ. Primality is part of the predicate. -/
def IsPlaceAbove (ℓ : ℕ) (v : ValuationSubring (AlgebraicClosure ℚ)) : Prop :=
  ℓ.Prime ∧ ringChar (IsLocalRing.ResidueField v) = ℓ

/-- Unramifiedness at ℓ means trivial action of every inertia group above ℓ. -/
def IsUnramifiedAt {A : Type*} [CommRing A]
    (ρ : Field.absoluteGaloisGroup ℚ →* Matrix.GeneralLinearGroup (Fin 2) A)
    (ℓ : ℕ) : Prop :=
  ∀ v : ValuationSubring (AlgebraicClosure ℚ), IsPlaceAbove ℓ v →
    ∀ g : v.inertiaSubgroup ℚ, ρ g.val.val = 1

/-- Arithmetic Frobenius at v acts on its residue field by the ℓ-th power map. -/
def IsArithFrobAt (ℓ : ℕ) (v : ValuationSubring (AlgebraicClosure ℚ))
    (g : Field.absoluteGaloisGroup ℚ) : Prop :=
  IsPlaceAbove ℓ v ∧ ∃ h : g ∈ v.decompositionSubgroup ℚ,
    ∀ a : IsLocalRing.ResidueField v,
      MulSemiringAction.toRingAut (v.decompositionSubgroup ℚ)
        (IsLocalRing.ResidueField v) ⟨g, h⟩ a = a ^ ℓ

/-- Entrywise continuity into the maximal-ideal-adic topology on the coefficient ring. -/
def IsAdicallyContinuous {A : Type*} [CommRing A] [IsLocalRing A]
    (ρ : Field.absoluteGaloisGroup ℚ →* Matrix.GeneralLinearGroup (Fin 2) A) : Prop :=
  letI : TopologicalSpace A := (IsLocalRing.maximalIdeal A).adicTopology
  ∀ i j : Fin 2, Continuous (fun g => (ρ g).val i j)

/-- Absolute reducibility on H: after extending to the algebraic closure of the
coefficient field there is an invariant line. -/
def IsReducibleOn {k : Type*} [Field k]
    (ρ : Field.absoluteGaloisGroup ℚ →* Matrix.GeneralLinearGroup (Fin 2) k)
    (H : Subgroup (Field.absoluteGaloisGroup ℚ)) : Prop :=
  ∃ W : Submodule (AlgebraicClosure k) (Fin 2 → AlgebraicClosure k),
    Module.finrank (AlgebraicClosure k) W = 1 ∧
    ∀ g : H, ∀ w ∈ W, Matrix.mulVec ((ρ g).val.map (algebraMap k (AlgebraicClosure k))) w ∈ W

/-- The actual submodule fixed by inertia, as an intersection of kernels. -/
def inertiaInvariants {A : Type*} [CommRing A]
    (ρ : Field.absoluteGaloisGroup ℚ →* Matrix.GeneralLinearGroup (Fin 2) A)
    (v : ValuationSubring (AlgebraicClosure ℚ)) : Submodule A (Fin 2 → A) :=
  ⨅ g : v.inertiaSubgroup ℚ,
    LinearMap.ker (Matrix.mulVecLin (ρ g.val.val).val - LinearMap.id)

/-- The residual hypotheses of CG18 §3.1, including the nonzero inertia invariants
at ramified reducible decomposition groups. Oddness uses complex conjugation on ℚ̄. -/
def IsWeightOneResidual (p : ℕ) {k : Type*} [Field k]
    (ρ : Field.absoluteGaloisGroup ℚ →* Matrix.GeneralLinearGroup (Fin 2) k) : Prop :=
  3 ≤ p ∧ IsAdicallyContinuous ρ ∧ ¬ IsReducibleOn ρ ⊤ ∧ IsUnramifiedAt ρ p ∧
  (∃ (c : Field.absoluteGaloisGroup ℚ) (ι : AlgebraicClosure ℚ →+* ℂ),
    (∀ z, ι ((show AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ from c).toRingEquiv z) = star (ι z)) ∧ Matrix.det (ρ c).val = -1) ∧
  ∀ ℓ : ℕ, ℓ.Prime → ¬ IsUnramifiedAt ρ ℓ →
    ∀ v : ValuationSubring (AlgebraicClosure ℚ), IsPlaceAbove ℓ v →
      IsReducibleOn ρ (v.decompositionSubgroup ℚ) → inertiaInvariants ρ v ≠ ⊥

/-- CG18 Definition 3.1 with Q empty. The residue identification fixes the lift;
the determinant has order dividing |k|−1, hence is its Teichmüller lift. At vexing
primes reduction is injective on the full inertial image; at ramified reducible
nonvexing places the fixed submodule is a rank-one direct summand. -/
def IsMinimalLift (p : ℕ) {A k : Type*} [CommRing A] [IsLocalRing A]
    [Field k] [Fintype k] (e : IsLocalRing.ResidueField A ≃+* k)
    (ρbar : Field.absoluteGaloisGroup ℚ →* Matrix.GeneralLinearGroup (Fin 2) k)
    (ρ : Field.absoluteGaloisGroup ℚ →* Matrix.GeneralLinearGroup (Fin 2) A) : Prop :=
  (∀ g, Matrix.GeneralLinearGroup.map (e.toRingHom.comp (IsLocalRing.residue A))
      (ρ g) = ρbar g) ∧
  (∀ g, Matrix.det (ρ g).val ^ (Fintype.card k - 1) = 1) ∧
  (∀ ℓ : ℕ, ℓ.Prime → IsUnramifiedAt ρbar ℓ → IsUnramifiedAt ρ ℓ) ∧
  ∀ ℓ : ℕ, ℓ.Prime → ¬ IsUnramifiedAt ρbar ℓ →
    ∀ v : ValuationSubring (AlgebraicClosure ℚ), IsPlaceAbove ℓ v →
      ((ℓ % p = p - 1 ∧ ¬ IsReducibleOn ρbar (v.decompositionSubgroup ℚ) ∧
          IsReducibleOn ρbar ((v.inertiaSubgroup ℚ).map (v.decompositionSubgroup ℚ).subtype)) →
        Set.InjOn (Matrix.GeneralLinearGroup.map
          (e.toRingHom.comp (IsLocalRing.residue A)))
          (Set.range (fun g : v.inertiaSubgroup ℚ => ρ g.val.val))) ∧
      (IsReducibleOn ρbar (v.decompositionSubgroup ℚ) →
        (Nonempty (A ≃ₗ[A] inertiaInvariants ρ v) ∧
          ∃ C : Submodule A (Fin 2 → A), IsCompl (inertiaInvariants ρ v) C))

/-- A genuinely minimal unramified-at-p lift over the integers of a finite
extension of ℚₚ is realized by a primitive weight-one newform. The embedding
into ℂ compares its Frobenius traces with the normalized q-coefficients.
CG18 Corollary 1.5 with Definition 3.1 minimality; includes vexing primes. -/
theorem minimal_weight_one_modularity
    (p : ℕ) [Fact p.Prime]
    (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Algebra (PadicInt p) O] [Module.Finite (PadicInt p) O] [CharZero O]
    [IsLocalHom (algebraMap (PadicInt p) O)]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (k : Type*) [Field k] [Fintype k] [CharP k p]
    (e : IsLocalRing.ResidueField O ≃+* k)
    (ρbar : Field.absoluteGaloisGroup ℚ →* Matrix.GeneralLinearGroup (Fin 2) k)
    (ρ : Field.absoluteGaloisGroup ℚ →* Matrix.GeneralLinearGroup (Fin 2) O)
    (hres : IsWeightOneResidual p ρbar) (hcont : IsAdicallyContinuous ρ)
    (hmin : IsMinimalLift p e ρbar ρ) :
    ∃ (N : ℕ) (_ : NeZero N) (f : HeckeRing.GL2.Newform N 1)
      (ι : FractionRing O →+* ℂ),
      ∀ (ℓ : ℕ), ℓ.Prime → Nat.Coprime ℓ (N * p) → IsUnramifiedAt ρ ℓ ∧
        ∀ (v : ValuationSubring (AlgebraicClosure ℚ))
          (g : Field.absoluteGaloisGroup ℚ), IsArithFrobAt ℓ v g →
            (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff ℓ =
              ι (algebraMap O (FractionRing O) (Matrix.trace (ρ g).val)) ∧
            f.dirichletLift ℓ =
              ι (algebraMap O (FractionRing O) (Matrix.det (ρ g).val)) := by
  sorry

/-- Every minimal lift of an odd absolutely irreducible residual representation
unramified at p to a complete Noetherian local O-algebra with its finite residue
field has finite image, including torsion and nilpotent coefficient rings.
CG18 Corollary 1.6 and Lemma 4.14; includes vexing primes. -/
theorem minimal_lift_finite_image
    (p : ℕ) [Fact p.Prime]
    (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Algebra (PadicInt p) O] [Module.Finite (PadicInt p) O] [CharZero O]
    [IsLocalHom (algebraMap (PadicInt p) O)]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (A : Type*) [CommRing A] [IsLocalRing A] [IsNoetherianRing A]
    [Algebra O A] [IsLocalHom (algebraMap O A)]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    (k : Type*) [Field k] [Fintype k] [CharP k p]
    (eO : IsLocalRing.ResidueField O ≃+* k)
    (e : IsLocalRing.ResidueField A ≃+* k)
    (he : ∀ x : O, e (IsLocalRing.residue A (algebraMap O A x)) =
      eO (IsLocalRing.residue O x))
    (ρbar : Field.absoluteGaloisGroup ℚ →* Matrix.GeneralLinearGroup (Fin 2) k)
    (ρ : Field.absoluteGaloisGroup ℚ →* Matrix.GeneralLinearGroup (Fin 2) A)
    (hres : IsWeightOneResidual p ρbar) (hcont : IsAdicallyContinuous ρ)
    (hmin : IsMinimalLift p e ρbar ρ) : (Set.range ρ).Finite := by
  sorry

end TauCetiRoadmap.GL2ModularityLiftingPartII
