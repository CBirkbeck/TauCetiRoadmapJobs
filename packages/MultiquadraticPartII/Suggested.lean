import Mathlib
import TauCeti.NumberTheory.Multiquadratic.Quadratic.GenusCharacter.OrdinaryTwoRank
import TauCeti.NumberTheory.BinaryQuadraticForm.Basic

/-!
# MultiquadraticPartII: representative target signatures

The roadmap is README.md. This file records definitions and theorem signatures
statable against the pinned Mathlib and Tau Ceti APIs and is not exhaustive.
The existing narrow class group, genus quotient, prime-discriminant characters,
fractional ideals and `TauCeti.BinaryQuadraticForm ℤ` are the carriers. The
form character evaluates the Kronecker character at a represented integer;
its evaluation law makes the choice independent when the factor is a
fundamental divisor. The comparison uses the explicit coefficient ideal.

The baseline is Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and
Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.
-/

open Polynomial NumberField TauCeti.Multiquadratic
open scoped MatrixGroups
open scoped NumberField nonZeroDivisors

namespace TauCetiRoadmap.MultiquadraticPartII

variable {K : Type*} [Field K] [NumberField K] {θ : 𝓞 K} {d : ℤ}

/-! ## Layer 0: the quadratic narrow defect -/

/-- The quadratic narrow-to-wide kernel is the displayed pair, with coincident
entries allowed. The quadratic presentation suffices for either signature.
(Duke–Imamoḡlu–Tóth, §2, pp.950–951.) -/
theorem ker_toClassGroup_eq_pair
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
    (A : NarrowClassGroup K) :
    NarrowClassGroup.toClassGroup A = 1 ↔
      A = 1 ∨ A = NarrowClassGroup.mkPrincipal
        (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin)) := by
  sorry

/-- A real class character has a unique wide descent exactly when it kills
the distinguished principal class. Both quantified maps are homomorphisms.
(Duke–Imamoḡlu–Tóth, §7, p.971, after (7.7).) -/
theorem existsUnique_wideCharacter_iff
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
    (χ : NarrowClassGroup K →* ℤˣ) :
    (∃! ψ : ClassGroup (𝓞 K) →* ℤˣ,
      ψ.comp (NarrowClassGroup.toClassGroup (K := K)) = χ) ↔
      χ (NarrowClassGroup.mkPrincipal
        (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin))) = 1 := by
  sorry

/-- Narrow lifts form a singleton when a norm-minus-one unit exists and a
pair exchanged by `J` otherwise. (Duke–Imamoḡlu–Tóth, §2, pp.950–951.) -/
theorem narrowDefect_fiber_boundary
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hd : 0 < d) :
    let J := NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin))
    (∀ A B : NarrowClassGroup K,
      NarrowClassGroup.toClassGroup B = NarrowClassGroup.toClassGroup A ↔
        B = A ∨ B = J * A) ∧
    ((∃ u : (𝓞 K)ˣ, Algebra.norm ℚ (((u : 𝓞 K) : K)) = -1) ↔ J = 1) ∧
    (J ≠ 1 → ∀ A : NarrowClassGroup K, J * A ≠ A ∧ J * (J * A) = A) := by
  sorry

/-- The trivial, odd and square-defect cases of descent distinguish the
narrow quotient from the quotient by squares.
(Duke–Imamoḡlu–Tóth, §7, p.971, after (7.7).) -/
theorem wideCharacter_boundary
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    let π := NarrowClassGroup.toClassGroup (K := K)
    let J := NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin))
    (∃! ψ : ClassGroup (𝓞 K) →* ℤˣ, ψ.comp π = 1) ∧
    (∀ χ : NarrowClassGroup K →* ℤˣ, χ J = -1 →
      ¬ ∃ ψ : ClassGroup (𝓞 K) →* ℤˣ, ψ.comp π = χ) ∧
    (IsSquare J → ∀ χ : NarrowClassGroup K →* ℤˣ,
      ∃! ψ : ClassGroup (𝓞 K) →* ℤˣ, ψ.comp π = χ) := by
  sorry

/-! ## Layer 1: the number of classes in a narrow genus -/

/-- Every narrow genus has the narrow class number divided by the genus
quotient cardinality. The integral identity avoids negative natural exponents
and also holds for imaginary quadratic presentations.
(Duke–Imamoḡlu–Tóth, §4, p.959, (4.1)–(4.2).) -/
theorem card_genusFiber_mul_twoPow {s : Finset ℤ}
    (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = fundamentalDiscriminant d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d)
    (g : NarrowClassGroup.ElementaryTwoQuotient K) :
    2 ^ (s.card - 1) *
      Nat.card {A : NarrowClassGroup K // TauCeti.elementaryTwoQuotientMk A = g} =
        Nat.card (NarrowClassGroup K) := by
  sorry

/-- One, two and three signed factors give respectively one, two and four
genera, with the corresponding fibre sizes.
(Duke–Imamoḡlu–Tóth, §4, p.959, (4.1)–(4.2).) -/
theorem genusFiber_smallFactorizations {s : Finset ℤ}
    (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = fundamentalDiscriminant d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d)
    (g : NarrowClassGroup.ElementaryTwoQuotient K) :
    let n := Nat.card {A : NarrowClassGroup K // TauCeti.elementaryTwoQuotientMk A = g}
    (s.card = 1 → Nat.card (NarrowClassGroup.ElementaryTwoQuotient K) = 1 ∧
      n = Nat.card (NarrowClassGroup K)) ∧
    (s.card = 2 → Nat.card (NarrowClassGroup.ElementaryTwoQuotient K) = 2 ∧
      2 * n = Nat.card (NarrowClassGroup K)) ∧
    (s.card = 3 → Nat.card (NarrowClassGroup.ElementaryTwoQuotient K) = 4 ∧
      4 * n = Nat.card (NarrowClassGroup K)) := by
  sorry

/-- In a cyclic group of order eight each genus fibre has four elements,
whereas two-torsion has two. This is a boundary of the fibre interpretation
of (4.1)–(4.2), Duke–Imamoḡlu–Tóth, §4, p.959. -/
theorem genusFiber_cyclicEight_boundary :
    (∀ g : TauCeti.ElementaryTwoQuotient (Multiplicative (ZMod 8)),
      Nat.card {x : Multiplicative (ZMod 8) // TauCeti.elementaryTwoQuotientMk x = g} = 4) ∧
    Nat.card (TauCeti.ElementaryTwoQuotient (Multiplicative (ZMod 8))) = 2 ∧
    Nat.card {x : Multiplicative (ZMod 8) // x ^ 2 = 1} = 2 := by
  sorry

/-! ## Layer 2: signs, principal genera and arithmetic criteria -/

/-- The composite genus character on the different class is the sign of
either complementary factor. Positivity of the discriminant is essential.
(Duke–Imamoḡlu–Tóth, §7, p.971, before (7.8), in the real case.) -/
theorem genusCharacter_J_eq_sign_prod {s t : Finset ℤ}
    (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = fundamentalDiscriminant d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d)
    (hd : 0 < d) (hts : t ⊆ s) :
    ((genusCharFunNarrowClassGroupHom hs heven hprod hmin hgen hsf hts
      (NarrowClassGroup.mkPrincipal
        (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin)))) : ℤ) =
          (∏ P ∈ t, P).sign ∧
      (∏ P ∈ t, P).sign = (∏ P ∈ s \ t, P).sign := by
  sorry

/-- A positive signed prime-discriminant product has all factors positive
exactly when no prime of residue three modulo four divides it. This includes
the empty factorization of one. (Duke–Imamoḡlu–Tóth, §4, p.960.) -/
theorem primeDiscriminants_positive_iff {D : ℤ} {s : Finset ℤ}
    (hD : 0 < D) (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = D) :
    (∀ P ∈ s, 0 < P) ↔
      ∀ p : ℕ, p.Prime → (p : ℤ) ∣ D → p % 4 ≠ 3 := by
  sorry

/-- For a positive fundamental discriminant, the general two-square
valuation criterion becomes a no-prime-divisor criterion. Zero coordinates and
nonprimitive representations are allowed. (Duke–Imamoḡlu–Tóth, §4, p.960.) -/
theorem fundamental_sumTwoSquares_iff {D : ℤ}
    (hD : 0 < D) (hfund : IsFundamentalDiscriminant D) :
    (∃ x y : ℤ, D = x ^ 2 + y ^ 2) ↔
      ∀ p : ℕ, p.Prime → (p : ℤ) ∣ D → p % 4 ≠ 3 := by
  sorry

/-- The different class is square exactly when the positive fundamental
discriminant has no prime divisor of residue three, or is a sum of two squares.
This does not assert that the class is trivial.
(Duke–Imamoḡlu–Tóth, §4, p.960; §7, p.971.) -/
theorem J_square_iff_sumTwoSquares {s : Finset ℤ}
    (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = fundamentalDiscriminant d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d)
    (hd : 0 < d) :
    (IsSquare (NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin))) ↔
        ∀ p : ℕ, p.Prime → (p : ℤ) ∣ fundamentalDiscriminant d → p % 4 ≠ 3) ∧
    (IsSquare (NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin))) ↔
        ∃ x y : ℤ, fundamentalDiscriminant d = x ^ 2 + y ^ 2) := by
  sorry

/-- A prime divisor of residue three obstructs a trivial different class
and a norm minus one integral unit, and forces the narrow/wide class-number
ratio to be two. (Duke–Imamoḡlu–Tóth, §2, p.951.) -/
theorem J_ne_one_of_prime_threeModFour {s : Finset ℤ}
    (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = fundamentalDiscriminant d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d)
    (hd : 0 < d) {p : ℕ} (hp : p.Prime)
    (hpD : (p : ℤ) ∣ fundamentalDiscriminant d) (hp4 : p % 4 = 3) :
    NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin)) ≠ 1 ∧
    ¬ (∃ u : (𝓞 K)ˣ, Algebra.norm ℚ (((u : 𝓞 K) : K)) = -1) ∧
    Nat.card (NarrowClassGroup K) = 2 * Nat.card (ClassGroup (𝓞 K)) := by
  sorry

/-- Signed dyadic and complementary factors fix the normalization at minus
one; positive products and a negative discriminant have different sign rules.
(Duke–Imamoḡlu–Tóth, §7, p.971, before (7.8).) -/
theorem genusCharacter_factorSigns_boundary :
    genusCharFun {-4} (-1) = -1 ∧ genusCharFun {-8} (-1) = -1 ∧
    genusCharFun {8} (-1) = 1 ∧ genusCharFun ∅ (-1) = 1 ∧
    (∏ P ∈ ({-4, -3} : Finset ℤ), P) = 12 ∧
    (∏ P ∈ ({-8, -3} : Finset ℤ), P) = 24 ∧
    (∏ P ∈ ({8, 17} : Finset ℤ), P) = 136 ∧
    genusCharFun {-4, -3} (-1) = 1 ∧ genusCharFun {8, 17} (-1) = 1 ∧
    (1 : ℤ).sign ≠ (-4 : ℤ).sign := by
  sorry

/-- The positive-factor criterion includes one and the positive dyadic
factor; negative discriminants and two even factors are negative controls.
(Duke–Imamoḡlu–Tóth, §4, p.960, specialized prime-discriminant criterion.) -/
theorem primeDiscriminants_boundary :
    (∀ D ∈ ({1, 5, 8, 40, 136} : Finset ℤ),
      ∀ p : ℕ, p.Prime → (p : ℤ) ∣ D → p % 4 ≠ 3) ∧
    (3 : ℤ) ∣ 12 ∧ (3 : ℤ) ∣ 24 ∧
    (∀ p : ℕ, p.Prime → (p : ℤ) ∣ (-4 : ℤ) → p % 4 ≠ 3) ∧
    (∏ P ∈ ({-4, -8} : Finset ℤ), P) = 32 ∧
    (∀ p : ℕ, p.Prime → (p : ℤ) ∣ (32 : ℤ) → p % 4 ≠ 3) := by
  sorry

/-- Positive fundamental examples permit nonprimitive coordinates; nine
shows why fundamentality is needed. (Duke–Imamoḡlu–Tóth, §4, p.960.) -/
theorem fundamental_sumTwoSquares_boundary :
    (1 : ℤ) = 1 ^ 2 + 0 ^ 2 ∧ (5 : ℤ) = 1 ^ 2 + 2 ^ 2 ∧
    (8 : ℤ) = 2 ^ 2 + 2 ^ 2 ∧ (136 : ℤ) = 6 ^ 2 + 10 ^ 2 ∧
    (¬ ∃ x y : ℤ, (12 : ℤ) = x ^ 2 + y ^ 2) ∧
    (9 : ℤ) = 0 ^ 2 + 3 ^ 2 ∧ (3 : ℤ) ∣ 9 ∧
    ¬ IsFundamentalDiscriminant (9 : ℤ) := by
  sorry

/-- The norm-minus-one unit `1 + θ` collapses the defect for radicand two.
(Duke–Imamoḡlu–Tóth, §2, pp.950–951, norm-unit criterion.) -/
theorem quadratic_two_boundary
    (hmin : minpoly ℤ θ = X ^ 2 - C (2 : ℤ))
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    (∃ u : (𝓞 K)ˣ, (u : 𝓞 K) = 1 + θ ∧ Algebra.norm ℚ (((u : 𝓞 K) : K)) = -1) ∧
    NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin)) = 1 := by
  sorry

/-- Radicands three and seven have nonsquare defects, no norm-minus-one
integral units, and class-number ratio two.
(Duke–Imamoḡlu–Tóth, §2, p.951; §4, p.960.) -/
theorem quadratic_three_seven_boundary (hd : d = 3 ∨ d = 7)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    ¬ IsSquare (NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin))) ∧
    ¬ (∃ u : (𝓞 K)ˣ, Algebra.norm ℚ (((u : 𝓞 K) : K)) = -1) ∧
    Nat.card (NarrowClassGroup K) = 2 * Nat.card (ClassGroup (𝓞 K)) := by
  sorry

/-- Radicand thirty-four has a square but nontrivial defect and no integral
unit of norm minus one. (Duke–Imamoḡlu–Tóth, §2, p.951; §4, p.960;
elementary negative-Pell boundary, not an assertion that square means trivial.) -/
theorem quadratic_thirtyFour_boundary
    (hmin : minpoly ℤ θ = X ^ 2 - C (34 : ℤ))
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    IsSquare (NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin))) ∧
    NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin)) ≠ 1 ∧
    ¬ (∃ u : (𝓞 K)ˣ, Algebra.norm ℚ (((u : 𝓞 K) : K)) = -1) := by
  sorry

/-! ## Layer 3: genus characters of binary forms -/

/-- The genus character `χ_δ([a, b, c])`, `δ = ∏ P ∈ t, P`: the value of `genusCharFun t` at an
integer represented by `a x² + b x y + c y²` and coprime to `δ`, and `0` if there is none. The
represented integer is chosen by choice; when `δ` is a fundamental divisor of the discriminant the
value does not depend on the choice (`binaryFormGenusChar_eq_of_represents`). This is the genus
character of Duke–Imamoḡlu–Tóth, §9, p.978, and Gross–Kohnen–Zagier, Ch. I §2, p.508, including
its zero value on forms whose content meets `δ`. -/
noncomputable def binaryFormGenusChar (t : Finset ℤ) (Q : TauCeti.BinaryQuadraticForm ℤ) : ℤ := by
  classical
  exact if h : ∃ m : ℤ, IsCoprime m (∏ P ∈ t, P) ∧
      ∃ x y : ℤ, Q.eval x y = m then
    genusCharFun t h.choose
  else 0

/-- Evaluation law: if `δ = ∏ P ∈ t, P` is a fundamental divisor of `Q.discrim`, the form
character is the Kronecker character at any represented integer coprime to `δ`, of either sign.
The congruence condition on the cofactor cannot be dropped: `x² + 2y²` has discriminant
`(-4) · 2` and represents `1` and `3`. (Gross–Kohnen–Zagier, Ch. I §2, pp.508–509.) -/
theorem binaryFormGenusChar_eq_of_represents {t : Finset ℤ}
    (ht : ∀ P ∈ t, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ t, ∀ P' ∈ t,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    {Q : TauCeti.BinaryQuadraticForm ℤ} {δ' : ℤ} (hδ' : δ' % 4 = 0 ∨ δ' % 4 = 1)
    (hdisc : Q.discrim = (∏ P ∈ t, P) * δ') {x y : ℤ}
    (hcop : IsCoprime (Q.eval x y) (∏ P ∈ t, P)) :
    binaryFormGenusChar t Q = genusCharFun t (Q.eval x y) := by
  sorry

/-- Zero law: the form character vanishes exactly when the content of the form is not coprime
to `δ`. A form whose content is coprime to `δ` represents an integer coprime to `δ`.
(Gross–Kohnen–Zagier, Ch. I §2, pp.508–509.) -/
theorem binaryFormGenusChar_eq_zero_iff {t : Finset ℤ}
    (ht : ∀ P ∈ t, IsPrimeDiscriminant P) (Q : TauCeti.BinaryQuadraticForm ℤ) :
    binaryFormGenusChar t Q = 0 ↔
      ¬ IsCoprime (Int.gcd Q.a (Int.gcd Q.b Q.c) : ℤ) (∏ P ∈ t, P) := by
  sorry

/-- The empty factor has value one even on the zero form.
(Gross–Kohnen–Zagier, Ch. I §2, p.508, empty Kronecker product.) -/
theorem binaryFormGenusChar_empty (Q : TauCeti.BinaryQuadraticForm ℤ) :
    binaryFormGenusChar ∅ Q = 1 := by
  sorry

/-- Scalar multiplication multiplies the character by the Kronecker value of
that scalar, including zero and negative scalars.
(Gross–Kohnen–Zagier, Ch. I §2, p.508, imprimitive extension.) -/
theorem binaryFormGenusChar_smul {t : Finset ℤ}
    (ht : ∀ P ∈ t, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ t, ∀ P' ∈ t,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (Q : TauCeti.BinaryQuadraticForm ℤ) {δ' : ℤ}
    (hδ' : δ' % 4 = 0 ∨ δ' % 4 = 1)
    (hdisc : Q.discrim = (∏ P ∈ t, P) * δ') (μ : ℤ) :
    binaryFormGenusChar t ⟨μ * Q.a, μ * Q.b, μ * Q.c⟩ =
      genusCharFun t μ * binaryFormGenusChar t Q := by
  sorry

/-- Substitution by any integral invertible matrix preserves the represented
integers. Here the displayed form is `Q ∘ g`; no discriminant condition is
needed because the predicates from which choice selects an integer coincide.
(Gross–Kohnen–Zagier, Ch. I §2, pp.508–509, representation definition.) -/
theorem binaryFormGenusChar_comp (t : Finset ℤ)
    (Q : TauCeti.BinaryQuadraticForm ℤ) (g : GL (Fin 2) ℤ) :
    binaryFormGenusChar t
      ⟨Q.a * g 0 0 ^ 2 + Q.b * g 0 0 * g 1 0 + Q.c * g 1 0 ^ 2,
       2 * Q.a * g 0 0 * g 0 1 + Q.b * (g 0 0 * g 1 1 + g 0 1 * g 1 0) +
         2 * Q.c * g 1 0 * g 1 1,
       Q.a * g 0 1 ^ 2 + Q.b * g 0 1 * g 1 1 + Q.c * g 1 1 ^ 2⟩ =
      binaryFormGenusChar t Q := by
  sorry

/-- Proper equivalence uses the pinned action `γ • Q = Q ∘ γ⁻¹`.
(Gross–Kohnen–Zagier, Ch. I §2, p.508, proper invariance.) -/
theorem binaryFormGenusChar_proper (t : Finset ℤ)
    (Q : TauCeti.BinaryQuadraticForm ℤ) (γ : SL(2, ℤ)) :
    binaryFormGenusChar t (γ • Q) = binaryFormGenusChar t Q := by
  sorry

/-- Negating the form multiplies its character by the sign of the factor.
(Gross–Kohnen–Zagier, Ch. I §2, p.508, scaling by minus one.) -/
theorem binaryFormGenusChar_neg {t : Finset ℤ}
    (ht : ∀ P ∈ t, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ t, ∀ P' ∈ t,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (Q : TauCeti.BinaryQuadraticForm ℤ) {δ' : ℤ}
    (hδ' : δ' % 4 = 0 ∨ δ' % 4 = 1)
    (hdisc : Q.discrim = (∏ P ∈ t, P) * δ') :
    binaryFormGenusChar t ⟨-Q.a, -Q.b, -Q.c⟩ =
      (∏ P ∈ t, P).sign * binaryFormGenusChar t Q := by
  sorry

/-- The form character at a positive fundamental discriminant is the narrow ideal genus
character of the oriented class of the form's coefficient ideal `a ℤ + ((-b + ω) / 2) ℤ`,
`ω² = D`: the class of that ideal when `a > 0`, and `J` times it when `a < 0`. Either square
root `ω` may be used. (Duke–Imamoḡlu–Tóth, §2, p.952, and §9, p.978, before Proposition 5.) -/
theorem formCharacter_eq_idealCharacter {s t : Finset ℤ}
    (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = fundamentalDiscriminant d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d)
    (hd : 0 < d) (hts : t ⊆ s)
    (ω : K) (hω : ω ^ 2 = (fundamentalDiscriminant d : K))
    (Q : TauCeti.BinaryQuadraticForm ℤ) (hdisc : Q.discrim = fundamentalDiscriminant d)
    (𝔞 : (FractionalIdeal (𝓞 K)⁰ K)ˣ)
    (h𝔞 : ∀ z : K, z ∈ (𝔞 : FractionalIdeal (𝓞 K)⁰ K) ↔
      ∃ u v : ℤ, z = u * Q.a + v * ((-Q.b + ω) / 2)) :
    binaryFormGenusChar t Q =
      ((genusCharFunNarrowClassGroupHom hs heven hprod hmin hgen hsf hts
        (if 0 < Q.a then NarrowClassGroup.mk 𝔞
          else NarrowClassGroup.mkPrincipal
              (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin)) *
            NarrowClassGroup.mk 𝔞) : ℤˣ) : ℤ) := by
  sorry

/-- At the empty factor both form and ideal characters equal one, even
when zero is the represented integer. No zero ideal is used.
(Duke–Imamoḡlu–Tóth, §9, p.978, empty-factor comparison.) -/
theorem formCharacter_empty {s : Finset ℤ}
    (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = fundamentalDiscriminant d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d)
    (Q : TauCeti.BinaryQuadraticForm ℤ) :
    binaryFormGenusChar ∅ Q = 1 ∧
    (∀ A : NarrowClassGroup K,
      genusCharFunNarrowClassGroupHom hs heven hprod hmin hgen hsf
        (Finset.empty_subset s) A = 1) ∧
    binaryFormGenusChar ∅ ⟨0, 0, 0⟩ = 1 := by
  sorry

/-- The empty factor is one on every form, including zero. -/
example (Q : TauCeti.BinaryQuadraticForm ℤ) : binaryFormGenusChar ∅ Q = 1 := by
  unfold binaryFormGenusChar
  split_ifs with h
  · simp
  · exact absurd ⟨Q.a, by simpa using isCoprime_one_right, 1, 0, by
      simp [TauCeti.BinaryQuadraticForm.eval]⟩ h

/-- Content divisible by two forces the imprimitive discriminant-48 value to zero. -/
example : binaryFormGenusChar {-4} ⟨2, 0, -6⟩ = 0 := by
  unfold binaryFormGenusChar
  split_ifs with h
  · obtain ⟨m, hm, x, y, rfl⟩ := h
    have h2 : (2 : ℤ) ∣ (⟨2, 0, -6⟩ : TauCeti.BinaryQuadraticForm ℤ).eval x y :=
      ⟨x ^ 2 - 3 * y ^ 2, by simp [TauCeti.BinaryQuadraticForm.eval]; ring⟩
    have h4 : (2 : ℤ) ∣ ∏ P ∈ ({-4} : Finset ℤ), P := by simp
    have := IsCoprime.isUnit_of_dvd' hm h2 h4
    norm_num [Int.isUnit_iff] at this
  · rfl

/-- At discriminant minus fifteen the two proper classes have distinct
form-character values. (Gross–Kohnen–Zagier, Ch. I §2, p.508.) -/
theorem binaryFormGenusChar_negFifteen_classes :
    binaryFormGenusChar {5} ⟨2, 1, 2⟩ = -1 ∧
    binaryFormGenusChar {5} ⟨1, 1, 4⟩ = 1 := by
  sorry

/-- The discriminant-twelve sign witness and the `T` substitution fix both
the sign of represented integers and the inverse-matrix convention.
(Duke–Imamoḡlu–Tóth, §2, p.952, (2.3)–(2.5); §9, p.978.) -/
theorem binaryFormGenusChar_discriminantTwelve :
    binaryFormGenusChar {-4} ⟨1, 0, -3⟩ = 1 ∧
    binaryFormGenusChar {-4} ⟨-1, 0, 3⟩ = -1 ∧
    genusCharFun {-4} (-3) = 1 ∧ genusCharFun {-4} 3 = -1 ∧
    ModularGroup.T • (⟨1, 0, -3⟩ : TauCeti.BinaryQuadraticForm ℤ) = ⟨1, -2, -2⟩ ∧
    binaryFormGenusChar {-4} (ModularGroup.T • ⟨1, 0, -3⟩) = 1 := by
  sorry

/-- The invalid cofactor two gives distinct arithmetic values at represented
integers of one form, so the evaluation law requires the cofactor congruence.
(Gross–Kohnen–Zagier, Ch. I §2, pp.508–509.) -/
theorem binaryFormGenusChar_invalidCofactor :
    (⟨1, 0, 2⟩ : TauCeti.BinaryQuadraticForm ℤ).discrim = -8 ∧
    (⟨1, 0, 2⟩ : TauCeti.BinaryQuadraticForm ℤ).eval 1 0 = 1 ∧
    (⟨1, 0, 2⟩ : TauCeti.BinaryQuadraticForm ℤ).eval 1 1 = 3 ∧
    genusCharFun {-4} 1 ≠ genusCharFun {-4} 3 := by
  sorry

/-- The discriminant-twelve coefficient ideals are the unit, `(θ)`, and
unit ideals, respectively. Their oriented classes are `1`, `J`, `J`.
(Duke–Imamoḡlu–Tóth, §2, p.952, (2.3)–(2.5), and §9, p.978.) -/
theorem formCharacter_discriminantTwelve_orientation
    (hmin : minpoly ℤ θ = X ^ 2 - C (3 : ℤ))
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
    (𝔞₁ 𝔞₃ 𝔞neg : (FractionalIdeal (𝓞 K)⁰ K)ˣ)
    (h₁ : ∀ z : K, z ∈ (𝔞₁ : FractionalIdeal (𝓞 K)⁰ K) ↔
      ∃ u v : ℤ, z = u + v * (θ : K))
    (h₃ : ∀ z : K, z ∈ (𝔞₃ : FractionalIdeal (𝓞 K)⁰ K) ↔
      ∃ u v : ℤ, z = u * 3 + v * (θ : K))
    (hneg : ∀ z : K, z ∈ (𝔞neg : FractionalIdeal (𝓞 K)⁰ K) ↔
      ∃ u v : ℤ, z = u * (-1) + v * (θ : K)) :
    let J := NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin))
    (𝔞₁ : FractionalIdeal (𝓞 K)⁰ K) = 1 ∧
    (𝔞₃ : FractionalIdeal (𝓞 K)⁰ K) = FractionalIdeal.spanSingleton (𝓞 K)⁰ (θ : K) ∧
    (𝔞neg : FractionalIdeal (𝓞 K)⁰ K) = 1 ∧
    NarrowClassGroup.mk 𝔞₁ = 1 ∧ NarrowClassGroup.mk 𝔞₃ = J ∧
    J * NarrowClassGroup.mk 𝔞neg = J ∧
    binaryFormGenusChar {-4} ⟨1, 0, -3⟩ = 1 ∧
    binaryFormGenusChar {-4} ⟨3, 0, -1⟩ = -1 ∧
    binaryFormGenusChar {-4} ⟨-1, 0, 3⟩ = -1 ∧
    ModularGroup.S • (⟨-1, 0, 3⟩ : TauCeti.BinaryQuadraticForm ℤ) = ⟨3, 0, -1⟩ ∧
    (¬ ∃ x y : ℤ, (⟨1, 0, -3⟩ : TauCeti.BinaryQuadraticForm ℤ).eval x y = -1) ∧
    (∀ χ : NarrowClassGroup K →* ℤˣ, χ J = -1 →
      χ (NarrowClassGroup.mk 𝔞₁) = 1 ∧ χ (NarrowClassGroup.mk 𝔞₃) = -1 ∧
      χ (J * NarrowClassGroup.mk 𝔞neg) = -1) := by
  sorry

/-- Discriminant five has unit coefficient ideal; both its factors have
value one. (Duke–Imamoḡlu–Tóth, §2, p.952; §9, p.978.) -/
theorem formCharacter_discriminantFive
    (hmin : minpoly ℤ θ = X ^ 2 - C (5 : ℤ))
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
    (𝔞 : (FractionalIdeal (𝓞 K)⁰ K)ˣ)
    (h𝔞 : ∀ z : K, z ∈ (𝔞 : FractionalIdeal (𝓞 K)⁰ K) ↔
      ∃ u v : ℤ, z = u + v * ((-1 + (θ : K)) / 2)) :
    (𝔞 : FractionalIdeal (𝓞 K)⁰ K) = 1 ∧ NarrowClassGroup.mk 𝔞 = 1 ∧
    binaryFormGenusChar ∅ ⟨1, 1, -1⟩ = 1 ∧
    binaryFormGenusChar {5} ⟨1, 1, -1⟩ = 1 := by
  sorry

end TauCetiRoadmap.MultiquadraticPartII
