import Mathlib
import TauCeti.RingTheory.RegularLocalRing.Basic

/-!
# Direct summands and big Cohen–Macaulay algebras: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs, using only transparent predicates on
native rings, modules, ideals and regular sequences.

The following headlines are not statable at the pins:
* Perfectoid covers and their almost faithful flatness: integral perfectoid
  algebras and the almost module category are missing.
* The full/partial modification criterion, including double sequences: the
  degree-bounded pointed modification and full algebra modification carriers,
  their finite sequences and their comparison are missing.
* Finite covers killing positive derived coherent cohomology, the equivalence
  of splinters and derived splinters in characteristic p, characteristic-zero
  derived splitting, and the derived direct summand theorem: the native
  A-module-valued derived global-sections functor with its geometric unit is
  missing. Degreewise abelian-group cohomology does not supply this morphism.

All algebra and module hypotheses below are explicit in declaration signatures.
-/

namespace TauCetiRoadmap.DirectSummandsAndBigCohenMacaulay

open IsLocalRing
open scoped TensorProduct Pointwise

universe u v

/-! ## Layer 0: Splittings and big Cohen–Macaulay modules -/

/-- An algebra splits when its unit admits a linear retraction, without a
multiplicativity requirement on the retraction. -/
def SplitAlgebra (R : Type u) (S : Type v) [CommRing R] [CommRing S]
    [Algebra R S] : Prop :=
  ∃ ρ : S →ₗ[R] R, ρ 1 = 1

/-- The finite-list form of a system of parameters: dimension-length, membership
in the maximal ideal, and maximal-ideal radical. -/
def ParameterSystem (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] (xs : List R) : Prop :=
  ringKrullDim R = xs.length ∧ (∀ x ∈ xs, x ∈ maximalIdeal R) ∧
    (Ideal.ofList xs).radical = maximalIdeal R

/-- Big Cohen–Macaulayness for a parameter list, for arbitrary modules. The
nonzero maximal-ideal quotient is required separately from weak regularity. -/
def BigCMFor (R : Type u) (M : Type v) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] [AddCommGroup M] [Module R M] (xs : List R) : Prop :=
  ParameterSystem R xs ∧ RingTheory.Sequence.IsWeaklyRegular M xs ∧
    maximalIdeal R • (⊤ : Submodule R M) ≠ ⊤

/-- Balanced big Cohen–Macaulayness means weak regularity of every parameter
system and a nonzero maximal-ideal quotient, with no module finiteness assumed. -/
def BalancedBigCM (R : Type u) (M : Type v) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] [AddCommGroup M] [Module R M] : Prop :=
  maximalIdeal R • (⊤ : Submodule R M) ≠ ⊤ ∧
    ∀ xs : List R, ParameterSystem R xs → RingTheory.Sequence.IsWeaklyRegular M xs

/-- Tensor purity of an algebra, tested on modules in the base universe.
Finite presentations suffice, so this test detects purity in larger universes. -/
def PureAlgebra (R : Type u) (S : Type v) [CommRing R] [CommRing S]
    [Algebra R S] : Prop :=
  ∀ (M : Type u) [AddCommGroup M] [Module R M],
    Function.Injective (fun m : M => m ⊗ₜ[R] (1 : S))

/-- Maximal-adic completion of an arbitrary big Cohen–Macaulay module is
balanced (André, §4.1, p. 85). -/
theorem completion_balanced (R : Type u) (M : Type v) [CommRing R]
    [IsLocalRing R] [IsNoetherianRing R] [AddCommGroup M] [Module R M]
    (xs : List R) (h : BigCMFor R M xs) :
    BalancedBigCM R (AdicCompletion (maximalIdeal R) M) := by
  sorry

/-- Balanced big Cohen–Macaulay modules over regular local rings are faithfully
flat (André, Remarque 4.2.1, with the height and Tor indices distinguished). -/
theorem balanced_faithfullyFlat (R : Type u) (M : Type v) [CommRing R]
    [IsRegularLocalRing R] [AddCommGroup M] [Module R M]
    (h : BalancedBigCM R M) : Module.FaithfullyFlat R M := by
  sorry

/-! ## Layer 1: Purity and the characteristic-p theorem -/

/-- A pure algebra over a complete Noetherian local ring has a linear retraction;
no finiteness or integrality of the algebra is required. -/
theorem complete_pure_split (R : Type u) (S : Type v) [CommRing R] [CommRing S]
    [Algebra R S] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (maximalIdeal R) R] (h : PureAlgebra R S) :
    SplitAlgebra R S := by
  sorry

/-- Hochster's direct summand theorem in positive characteristic, for every
finite injective algebra over a regular ring (André, Annexe A.3). -/
theorem directSummand_charP (R : Type u) (S : Type v) [CommRing R]
    [CommRing S] [Algebra R S] [IsRegularRing R] [Module.Finite R S]
    (p : ℕ) [Fact p.Prime] [CharP R p]
    (h : Function.Injective (algebraMap R S)) : SplitAlgebra R S := by
  sorry

/-! ## Layer 2: André's unramified theorem -/

/-- Finite injective algebras over W(k)[[T_1,...,T_n]] split for every perfect
field k of characteristic p (André, Théorème 0.2.1). -/
theorem andre_unramified (p : ℕ) [Fact p.Prime] (k : Type u) [Field k]
    [CharP k p] [PerfectRing k p] (n : ℕ) (S : Type v) [CommRing S]
    [Algebra (MvPowerSeries (Fin n) (WittVector p k)) S]
    [Module.Finite (MvPowerSeries (Fin n) (WittVector p k)) S]
    (h : Function.Injective (algebraMap (MvPowerSeries (Fin n) (WittVector p k)) S)) :
    SplitAlgebra (MvPowerSeries (Fin n) (WittVector p k)) S := by
  sorry

/-! ## Layer 3: Bhatt's mixed-characteristic theorem -/

/-- Every finite injective algebra over a complete mixed-characteristic regular
local ring splits, including ramified rings (Bhatt, Theorem 5.4). -/
theorem bhatt_mixed (R : Type u) (S : Type v) [CommRing R] [CommRing S]
    [Algebra R S] [IsRegularLocalRing R] [CharZero R]
    [IsAdicComplete (maximalIdeal R) R] [Module.Finite R S]
    (p : ℕ) [Fact p.Prime] [CharP (ResidueField R) p]
    (h : Function.Injective (algebraMap R S)) : SplitAlgebra R S := by
  sorry

/-! ## Layer 4: Almost Cohen–Macaulay algebras and existence -/

/-- Almost Cohen–Macaulayness for specified compatible p-power roots. The zeroth
root is regular, some root survives the maximal-ideal quotient, and every root
kills every parameter colon obstruction (André, Définition 4.1.1(3)). -/
def AlmostCMFor (R : Type u) (D : Type v) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] [CommRing D] [Algebra R D] (xs : List R)
    (p : ℕ) [Fact p.Prime] [CharP (ResidueField R) p] (roots : ℕ → D) : Prop :=
  ParameterSystem R xs ∧
  Function.Injective (fun z : D => roots 0 * z) ∧
  (∀ n, roots (n + 1) ^ p = roots n) ∧
  (∃ n, roots n ∉ (maximalIdeal R).map (algebraMap R D)) ∧
  ∀ (i : ℕ) (hi : i < xs.length) (z : D),
    algebraMap R D xs[i] * z ∈ (Ideal.ofList (xs.take i)).map (algebraMap R D) →
    ∀ n, roots n * z ∈ (Ideal.ofList (xs.take i)).map (algebraMap R D)

/-- An almost Cohen–Macaulay algebra with regular root parameter gives a
balanced big Cohen–Macaulay algebra (André, Proposition 4.1.2). -/
theorem almostCM_exists_balanced (R : Type u) (D : Type v) [CommRing R]
    [IsLocalRing R] [IsNoetherianRing R] [CommRing D] [Algebra R D]
    (xs : List R) (p : ℕ) [Fact p.Prime] [CharP (ResidueField R) p]
    (roots : ℕ → D) (h : AlmostCMFor R D xs p roots) :
    ∃ (C : Type u) (_ : CommRing C) (_ : Algebra R C), BalancedBigCM R C := by
  sorry

/-- The absolute integral closure of a characteristic-p local domain that is a
quotient of a Gorenstein local ring is balanced big Cohen–Macaulay. Gorensteinness
is expressed by finite self-injective dimension on the native module category
(Huneke–Lyubeznik, Theorem 2.1 and Corollary 2.3). -/
theorem absoluteIntegralClosure_charP (R : Type u) (A : Type v) [CommRing R]
    [IsLocalRing R] [IsNoetherianRing R] [IsDomain R] [CommRing A]
    [IsLocalRing A] [IsNoetherianRing A] (n : ℕ)
    [CategoryTheory.HasInjectiveDimensionLE (ModuleCat.of A A) n]
    (f : A →+* R) (hf : Function.Surjective f)
    (p : ℕ) [Fact p.Prime] [CharP R p] :
    BalancedBigCM R (integralClosure R (AlgebraicClosure (FractionRing R))) := by
  sorry

/-- Every Noetherian local ring containing Q has a balanced big Cohen–Macaulay
algebra (Hochster–Huneke, as recalled in André §0.7 and §4.3). -/
theorem exists_balanced_charZero (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] [Algebra ℚ R] :
    ∃ (C : Type u) (_ : CommRing C) (_ : Algebra R C), BalancedBigCM R C := by
  sorry

/-- Every Noetherian local ring has a balanced big Cohen–Macaulay algebra, with
no characteristic, reducedness or p-torsion-freeness restriction (André 0.7.1). -/
theorem exists_balanced (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] :
    ∃ (C : Type u) (_ : CommRing C) (_ : Algebra R C), BalancedBigCM R C := by
  sorry

/-! ## Layer 5: The direct summand theorem and flat domination -/

/-- Every finite injective algebra over a Noetherian regular ring admits a
linear retraction (André 0.2.1; Bhatt 1.1 and 5.4). -/
theorem directSummand (R : Type u) (S : Type v) [CommRing R] [CommRing S]
    [Algebra R S] [IsRegularRing R] [Module.Finite R S]
    (h : Function.Injective (algebraMap R S)) : SplitAlgebra R S := by
  sorry

/-- Every finite cover of a regular ring is dominated by an algebra faithfully
flat over the base (André, Théorème 0.7.2). -/
theorem finiteCover_flatDomination (R : Type u) (S : Type v) [CommRing R]
    [CommRing S] [Algebra R S] [IsRegularRing R] [Module.Finite R S]
    (h : Function.Injective (algebraMap R S)) :
    ∃ (T : Type (max u v)) (_ : CommRing T) (_ : Algebra R T),
      (∃ f : S →ₐ[R] T, Module.FaithfullyFlat R T) := by
  sorry

/-- The inclusion into the absolute integral closure splits for a complete
regular local ring; completeness is essential (André, Annexe A.3, corrected). -/
theorem absoluteIntegralClosure_split (R : Type u) [CommRing R]
    [IsRegularLocalRing R] [IsAdicComplete (maximalIdeal R) R] :
    SplitAlgebra R (integralClosure R (AlgebraicClosure (FractionRing R))) := by
  sorry

/-- The monomial theorem, including the empty parameter list: the product to a
smaller exponent does not belong to the ideal of the larger pure powers. -/
theorem monomial_noncontainment (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] (xs : List R) (hx : ParameterSystem R xs)
    (m n : ℕ) (hmn : m < n) : xs.prod ^ m ∉ Ideal.ofList (xs.map (fun x => x ^ n)) := by
  sorry

/-! ## Layer 6: Weak functoriality and pure subrings -/

/-- Separability is tested on the residue-field map induced by the specified
local algebra map, rather than on an unrelated field algebra structure. -/
noncomputable def SeparableResidueMap (B : Type u) (B' : Type v) [CommRing B]
    [CommRing B'] [Algebra B B'] [IsLocalRing B] [IsLocalRing B']
    [IsLocalHom (algebraMap B B')] : Prop :=
  letI := (ResidueField.map (algebraMap B B')).toAlgebra
  Algebra.IsSeparable (ResidueField B) (ResidueField B')

/-- Injective complete mixed-characteristic domain maps with regular target and
separable residue extension admit a compatible square of balanced big
Cohen–Macaulay algebras (André, §4.4, pp. 87–88). -/
theorem weakFunctoriality_regularTarget (B : Type u) (B' : Type v)
    [CommRing B] [CommRing B'] [Algebra B B'] [IsLocalRing B]
    [IsNoetherianRing B] [IsDomain B] [IsRegularLocalRing B']
    [IsLocalHom (algebraMap B B')] [CharZero B] [CharZero B']
    [IsAdicComplete (maximalIdeal B) B] [IsAdicComplete (maximalIdeal B') B']
    (p : ℕ) [Fact p.Prime] [CharP (ResidueField B) p] [CharP (ResidueField B') p]
    (hinj : Function.Injective (algebraMap B B')) (hsep : SeparableResidueMap B B') :
    ∃ (C : Type u) (_ : CommRing C) (_ : Algebra B C)
      (C' : Type v) (_ : CommRing C') (_ : Algebra B' C'),
      BalancedBigCM B C ∧ BalancedBigCM B' C' ∧
      ∃ γ : C →+* C', ∀ b : B,
        γ (algebraMap B C b) = algebraMap B' C' (algebraMap B B' b) := by
  sorry

/-- Pure mixed-characteristic local subrings of regular local rings, with
separable residue extension, are Cohen–Macaulay: every parameter list is regular
on the source itself (André, Théorème 4.4.2). -/
theorem pureSubring_cohenMacaulay (B : Type u) (B' : Type v) [CommRing B] [CommRing B']
    [Algebra B B'] [IsLocalRing B] [IsNoetherianRing B] [IsRegularLocalRing B']
    [IsLocalHom (algebraMap B B')] [CharZero B] [CharZero B']
    (p : ℕ) [Fact p.Prime] [CharP (ResidueField B) p] [CharP (ResidueField B') p]
    (hpure : PureAlgebra B B') (hsep : SeparableResidueMap B B') :
    ∀ xs : List B, ParameterSystem B xs → RingTheory.Sequence.IsRegular B xs := by
  sorry

end TauCetiRoadmap.DirectSummandsAndBigCohenMacaulay
