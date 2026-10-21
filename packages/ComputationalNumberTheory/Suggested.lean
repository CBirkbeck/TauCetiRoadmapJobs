import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.PointCount
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.LocalCondition
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.TwoTorsion
import TauCeti.AlgebraicGeometry.EllipticCurve.DivisionPolynomial.Descent
import TauCeti.NumberTheory.ModularForms.SturmBound
import TauCeti.NumberTheory.LocalField.Squares

/-!
# ComputationalNumberTheory: representative target signatures

The roadmap is README.md. This file records statements suggested against the pinned APIs;
it is not exhaustive. Light definitions give mathematical presentations and predicates on
native carriers. Theorems marked `sorry` are targets.
-/

noncomputable section

open Polynomial
open scoped MatrixGroups

namespace TauCetiRoadmap.ComputationalNumberTheory

/-! ## Layer CN.0: Exact presentations -/


section Algebraic

/-- **Isolated algebraic root certificate** (README 0.8): a nonzero rational polynomial and a
closed rational rectangle containing exactly one of its complex roots. Repeated roots are allowed;
uniqueness concerns distinct roots. -/
structure AlgebraicRootCertificate where
  poly : ℚ[X]
  poly_ne_zero : poly ≠ 0
  re : NonemptyInterval ℚ
  im : NonemptyInterval ℚ
  isolates : ∃! z : ℂ, aeval z poly = 0 ∧ ((re.fst : ℝ) ≤ z.re ∧ z.re ≤ re.snd) ∧
    ((im.fst : ℝ) ≤ z.im ∧ z.im ≤ im.snd)

/-- The decoded value of a certificate: the unique root in its rectangle. -/
def AlgebraicRootCertificate.value (c : AlgebraicRootCertificate) : ℂ :=
  c.isolates.exists.choose

/-- The isolated rational-polynomial root lies in the native relative algebraic closure. -/
theorem AlgebraicRootCertificate.value_mem_algebraicClosure (c : AlgebraicRootCertificate) :
    c.value ∈ algebraicClosure ℚ ℂ := by
  sorry

/-- Every root in the isolating rectangle equals the decoded root. -/
theorem AlgebraicRootCertificate.value_unique (c : AlgebraicRootCertificate) (z : ℂ)
    (hz : aeval z c.poly = 0) (hre : (c.re.fst : ℝ) ≤ z.re ∧ z.re ≤ c.re.snd)
    (him : (c.im.fst : ℝ) ≤ z.im ∧ z.im ≤ c.im.snd) : z = c.value := by
  sorry

/-- **Exact arithmetic of isolated algebraic numbers** (README 0.10–0.12). -/
theorem algebraic_add_certificate (a b : AlgebraicRootCertificate) :
    ∃ c : AlgebraicRootCertificate, c.value = a.value + b.value := by
  sorry

/-- The product of two presented algebraic values has an isolated-root presentation. -/
theorem algebraic_mul_certificate (a b : AlgebraicRootCertificate) :
    ∃ c : AlgebraicRootCertificate, c.value = a.value * b.value := by
  sorry

/-- The inverse of a nonzero presented algebraic value has an isolated-root presentation. -/
theorem algebraic_inv_certificate (a : AlgebraicRootCertificate) (ha : a.value ≠ 0) :
    ∃ c : AlgebraicRootCertificate, c.value = a.value⁻¹ := by
  sorry

/-- `X² − 1` has two roots in `[−2, 2] × [0, 0]`, so no certificate isolates it there. -/
theorem AlgebraicRootCertificate.two_root_box_impossible : ¬ ∃ c : AlgebraicRootCertificate, c.poly = X ^ 2 - 1 ∧
    c.re = NonemptyInterval.pure (0 : ℚ) + ⟨(-2, 2), by norm_num⟩ ∧ c.im = NonemptyInterval.pure 0 := by
  sorry

/-- A rational number is presented by its linear polynomial and its singleton rectangle. -/
def rationalRootCertificate (r : ℚ) : AlgebraicRootCertificate where
  poly := X - C r
  poly_ne_zero := by
    intro h
    have h1 := congrArg (fun f : ℚ[X] => f.coeff 1) h
    simpa using h1
  re := NonemptyInterval.pure r
  im := NonemptyInterval.pure 0
  isolates := by
    refine ⟨(r : ℂ), ?_, ?_⟩
    · simp [NonemptyInterval.pure]
    · intro z hz
      exact sub_eq_zero.mp (by simpa using hz.1)

/-- Decoding the rational presentation is the usual rational embedding. -/
theorem rationalRootCertificate_value (r : ℚ) : (rationalRootCertificate r).value = r := by
  have h := (rationalRootCertificate r).isolates.exists.choose_spec.1
  simpa [AlgebraicRootCertificate.value, rationalRootCertificate] using h

/-- Equality of isolated algebraic presentations is equality of their decoded native values. -/
def algebraicEqual (a b : AlgebraicRootCertificate) : Prop := a.value = b.value

/-- Zero, rational addition and distinct expressions for five sixths decode correctly. -/
example : (rationalRootCertificate 0).value = 0 ∧
    (rationalRootCertificate (1 / 2)).value + (rationalRootCertificate (1 / 3)).value = 5 / 6 ∧
    algebraicEqual (rationalRootCertificate (1 / 2 + 1 / 3)) (rationalRootCertificate (5 / 6)) := by
  norm_num [algebraicEqual, rationalRootCertificate_value]

/-- Distinct rational values are not made equal by their presentation data. -/
example : ¬ algebraicEqual (rationalRootCertificate (1 / 2)) (rationalRootCertificate (1 / 3)) := by
  norm_num [algebraicEqual, rationalRootCertificate_value]

/-- The repeated polynomial root zero has a valid singleton presentation. -/
theorem AlgebraicRootCertificate.repeated_zero : ∃ c : AlgebraicRootCertificate,
    c.poly = X ^ 2 ∧ c.re = NonemptyInterval.pure 0 ∧ c.im = NonemptyInterval.pure 0 := by
  sorry

end Algebraic

section Padic

/-- **Canonical finite `p`-adic approximation** (README 0.14): either the zero ball `(N, N, 0)` or
`v < N` with a mantissa `0 < s < p^(N − v)` prime to `p`. -/
structure PadicApproximation (p : ℕ) where
  precision : ℤ
  valuation : ℤ
  mantissa : ℕ
  canonical : (valuation = precision ∧ mantissa = 0) ∨
    (valuation < precision ∧ 0 < mantissa ∧ mantissa < p ^ (precision - valuation).toNat ∧
      ¬ p ∣ mantissa)

/-- The exact rational centre `p^v · s`. -/
def PadicApproximation.center {p : ℕ} (a : PadicApproximation p) : ℚ :=
  (p : ℚ) ^ a.valuation * a.mantissa

/-- The closed ball of radius `p^(−N)` around the centre, in Mathlib's `ℚ_[p]`. -/
def PadicApproximation.denotation {p : ℕ} [Fact p.Prime] (a : PadicApproximation p) :
    Set ℚ_[p] :=
  {x | ‖x - (a.center : ℚ_[p])‖ ≤ (p : ℝ) ^ (-a.precision)}

/-- The rational centre belongs to its denoted p-adic ball. -/
theorem PadicApproximation.center_mem {p : ℕ} [Fact p.Prime] (a : PadicApproximation p) :
    (a.center : ℚ_[p]) ∈ a.denotation := by
  sorry

/-- At `p = 3`, `(N, v, s) = (0, −1, 1)` is canonical with centre `1/3`. -/
example : (⟨0, -1, 1, Or.inr (by decide)⟩ : PadicApproximation 3).center = 1 / 3 ∧
    ∀ N : ℤ, (⟨N, N, 0, Or.inl ⟨rfl, rfl⟩⟩ : PadicApproximation 3).valuation = N ∧
      (⟨N, N, 0, Or.inl ⟨rfl, rfl⟩⟩ : PadicApproximation 3).center = 0 := by
  norm_num [PadicApproximation.center]

/-- A nonzero mantissa divisible by `p` is not canonical. -/
example : ¬ ∃ a : PadicApproximation 3, a.valuation < a.precision ∧ a.mantissa = 3 := by
  rintro ⟨⟨N, v, s, h⟩, hv, rfl⟩
  rcases h with ⟨h1, h2⟩ | ⟨-, -, -, h4⟩
  · simp at h2
  · exact h4 (dvd_refl 3)

end Padic

section FiniteFields

variable {F : Type*} [Field F] [Fintype F]

/-- **Rabin irreducibility certificate** (README 0.15), as a finite family of mathematical conditions:
`f` is monic of positive degree `n`, divides `X^(q^n) − X`, and is coprime to `X^(q^(n/s)) − X`
for every prime `s ∣ n`. Coprimality expresses existence of Bézout identities. -/
structure RabinCertificate (f : F[X]) : Prop where
  monic : f.Monic
  natDegree_pos : 0 < f.natDegree
  dvd_frobenius : f ∣ X ^ (Fintype.card F ^ f.natDegree) - X
  coprime : ∀ s ∈ f.natDegree.primeFactors,
    IsCoprime (X ^ (Fintype.card F ^ (f.natDegree / s)) - X) f

/-- The Frobenius divisibility and coprimality conditions imply irreducibility. -/
theorem RabinCertificate.irreducible {f : F[X]} (h : RabinCertificate f) : Irreducible f := by
  sorry

/-- Every monic irreducible finite-field polynomial satisfies the Rabin conditions. -/
theorem RabinCertificate.exists_of_irreducible {f : F[X]} (hm : f.Monic) (hf : Irreducible f) :
    RabinCertificate f := by
  sorry

/-- The boundary comparison specified in README 0.15. -/
theorem RabinCertificate.quadratic_two : RabinCertificate (X ^ 2 + X + 1 : (ZMod 2)[X]) := by
  sorry

/-- `X² + 1 = (X − 2)(X − 3)` over `ZMod 5`: rejected. -/
theorem RabinCertificate.quadratic_five_impossible [Fact (Nat.Prime 5)] : ¬ RabinCertificate (X ^ 2 + 1 : (ZMod 5)[X]) := fun h => by
  sorry

/-- Every monic linear polynomial satisfies the Rabin predicate, including degree one. -/
theorem RabinCertificate.linear (a : F) : RabinCertificate (X - C a) := by
  sorry

/-- The eighth cyclotomic polynomial has no irreducible reduction at any rational prime. -/
theorem RabinCertificate.cyclotomic_eight_impossible (p : ℕ) [Fact p.Prime] :
    ¬ RabinCertificate (X ^ 4 + 1 : (ZMod p)[X]) := by
  sorry

/-- **Certified presentation of a finite field** (README 0.16). -/
structure FiniteFieldPresentation (F K : Type*) [Field F] [Fintype F] [Field K] [Algebra F K] where
  poly : F[X]
  rabin : RabinCertificate poly
  root : K
  aeval_root : aeval root poly = 0
  finrank_eq : Module.finrank F K = poly.natDegree

/-- The algebra map `F[X]/(f) → K` sending the class of `X` to the root. -/
def FiniteFieldPresentation.lift {K : Type*} [Field K] [Algebra F K]
    (P : FiniteFieldPresentation F K) : AdjoinRoot P.poly →ₐ[F] K :=
  AdjoinRoot.liftAlgHom P.poly (Algebra.ofId F K) P.root P.aeval_root

/-- A root with the full degree induces a bijection from the root quotient. -/
theorem FiniteFieldPresentation.bijective {K : Type*} [Field K] [Algebra F K]
    (P : FiniteFieldPresentation F K) : Function.Bijective P.lift := by
  sorry

/-- The isomorphism `F[X]/(f) ≃ₐ[F] K` sending the class of `X` to the root. -/
def FiniteFieldPresentation.equiv {K : Type*} [Field K] [Algebra F K]
    (P : FiniteFieldPresentation F K) : AdjoinRoot P.poly ≃ₐ[F] K :=
  AlgEquiv.ofBijective P.lift P.bijective

/-- The presentation equivalence sends the quotient root to the specified root. -/
theorem FiniteFieldPresentation.equiv_root {K : Type*} [Field K] [Algebra F K]
    (P : FiniteFieldPresentation F K) : P.equiv (AdjoinRoot.root P.poly) = P.root := by
  simp only [FiniteFieldPresentation.equiv, FiniteFieldPresentation.lift, AlgEquiv.ofBijective_apply]
  exact AdjoinRoot.liftAlgHom_root _ _ _ _

/-- Every finite extension of a finite field has a root presentation. -/
theorem FiniteFieldPresentation.exists (K : Type*) [Field K] [Algebra F K] [FiniteDimensional F K] :
    Nonempty (FiniteFieldPresentation F K) := by
  sorry

/-- The degree-one presentation over the prime field has the prescribed polynomial and root. -/
theorem FiniteFieldPresentation.prime_field_five [Fact (Nat.Prime 5)] : ∃ P : FiniteFieldPresentation (ZMod 5) (ZMod 5),
    P.poly = X - C 2 ∧ P.root = 2 := by
  sorry

/-- Every presentation polynomial is the minimal polynomial of its specified root. -/
theorem FiniteFieldPresentation.minpoly_eq {K : Type*} [Field K] [Algebra F K]
    (P : FiniteFieldPresentation F K) : minpoly F P.root = P.poly := by
  sorry

/-- The quadratic presentation in characteristic two sends the quotient generator and its
translate to the expected roots, satisfying `α²=α+1`. -/
theorem FiniteFieldPresentation.quadratic_two {K : Type*} [Field K] [Algebra (ZMod 2) K]
    (P : FiniteFieldPresentation (ZMod 2) K) (hP : P.poly = X ^ 2 + X + 1) :
    P.equiv (AdjoinRoot.root P.poly + 1) = P.root + 1 ∧ P.root ^ 2 = P.root + 1 := by
  sorry

/-- A degree-one presentation over the base field has the constant-polynomial inverse. -/
theorem FiniteFieldPresentation.linear_inverse (P : FiniteFieldPresentation F F)
    (a : F) (hP : P.poly = X - C a) (x : F) :
    P.equiv.symm x = AdjoinRoot.mk P.poly (C x) := by
  sorry

/-- **Change of presentation with an explicit inverse** (README 0.17). -/
structure PresentationChange (f g : F[X]) where
  b : F[X]
  c : F[X]
  dvd_b : g ∣ f.comp b
  dvd_c : f ∣ g.comp c
  dvd_inv : f ∣ b.comp c - X

/-- Equal-degree monic irreducibles admit mutually inverse polynomial root substitutions. -/
theorem exists_presentationChange {f g : F[X]} (hfm : f.Monic) (hgm : g.Monic) (hf : Irreducible f)
    (hg : Irreducible g) (hdeg : f.natDegree = g.natDegree) : Nonempty (PresentationChange f g) := by
  sorry

/-- Over `ZMod 3`, `(X + 2, X + 1)` changes `X² + 1` into `X² + X + 2`. -/
theorem PresentationChange.translate_three : Nonempty (PresentationChange (X ^ 2 + 1 : (ZMod 3)[X]) (X ^ 2 + X + 2)) := by
  sorry

/-- The identity substitutions give inverse presentation data. -/
theorem PresentationChange.identity (f : F[X]) : Nonempty (PresentationChange f f) := by
  exact ⟨⟨X, X, by simp, by simp, by simp⟩⟩

/-- A root substitution need not be its own inverse: scaling by two over the field of seven elements. -/
theorem PresentationChange.scaling_seven_impossible :
    ¬ ∃ P : PresentationChange (X ^ 3 - 2 : (ZMod 7)[X]) (X ^ 3 - 2),
      P.b = 2 * X ∧ P.c = 2 * X := by
  sorry

end FiniteFields

/-! ## Layer CN.1: Primality and factorization certificates -/

section Primality

/-- **Recursive Pratt certificate** (README 1.1): the leaf `2`, or a node `(n, a, children)`
whose children certify the prime factors of `n − 1`, repeated with multiplicity. -/
inductive PrattCertificate where
  | two
  | node (n a : ℕ) (children : List PrattCertificate)

/-- The value: `2` at the leaf and the stored `n` at a node. -/
def PrattCertificate.value : PrattCertificate → ℕ
  | .two => 2
  | .node n _ _ => n

/-- Raw trees retain their value even when they do not meet the validity conditions. -/
example : PrattCertificate.two.value = 2 ∧ (PrattCertificate.node 3 2 [.two]).value = 3 ∧
    (PrattCertificate.node 1 0 []).value = 1 := by decide

/-- Arithmetic conditions at a Pratt node: bounds, child product, Lucas congruences. -/
def PrattCertificate.nodeConditions (n a : ℕ) (cs : List PrattCertificate) : Prop :=
  3 ≤ n ∧ 0 < a ∧ a < n ∧ (cs.map PrattCertificate.value).prod = n - 1 ∧
    a ^ (n - 1) % n = 1 ∧ ∀ c ∈ cs, a ^ ((n - 1) / c.value) % n ≠ 1

mutual
/-- Validity is the Lucas conditions at each node, and validity of all its children. -/
def PrattCertificate.valid : PrattCertificate → Prop
  | .two => (2 : ℕ).Prime
  | .node n a cs => PrattCertificate.nodeConditions n a cs ∧ PrattCertificate.validList cs
/-- Every member of a finite list of Pratt trees is valid. -/
def PrattCertificate.validList : List PrattCertificate → Prop
  | [] => ∀ c ∈ ([] : List PrattCertificate), c.value.Prime
  | c :: cs => PrattCertificate.valid c ∧ PrattCertificate.validList cs
end

/-- The first odd-prime tree is valid, while the analogous candidate for nine fails. -/
example : PrattCertificate.two.valid ∧ (PrattCertificate.node 3 2 [.two]).valid ∧
    ¬ (PrattCertificate.node 9 2 [.two, .two, .two]).valid := by
  norm_num [PrattCertificate.valid, PrattCertificate.validList,
    PrattCertificate.nodeConditions, PrattCertificate.value]

/-- **Soundness of Pratt certificates** (README 1.3). -/
theorem PrattCertificate.sound (c : PrattCertificate) (h : c.valid) : c.value.Prime := by
  sorry

/-- **Completeness of Pratt certificates** (README 1.4). -/
theorem PrattCertificate.complete (n : ℕ) (hn : n.Prime) :
    ∃ c : PrattCertificate, c.valid ∧ c.value = n := by
  sorry

mutual
/-- **Bit size of a Pratt tree** (README 1.5): one tag bit, the binary lengths of `n`, `a` and the
child count, and the sizes of all children, repeated children charged repeatedly. -/
def prattBitSize : PrattCertificate → ℕ
  | .two => 1
  | .node n a cs => 1 + (Nat.log 2 n + 1) + (Nat.log 2 a + 1) + (Nat.log 2 cs.length + 1) +
      prattBitSizeList cs
/-- The total size of a list of trees. -/
def prattBitSizeList : List PrattCertificate → ℕ
  | [] => 0
  | c :: cs => prattBitSize c + prattBitSizeList cs
end

/-- Pratt size counts the tag and every repeated child. -/
example : prattBitSize .two = 1 ∧ prattBitSize (.node 3 2 [.two]) = 7 ∧
    prattBitSize (.node 5 2 [.two]) < prattBitSize (.node 5 2 [.two, .two]) := by decide

/-- **Quadratic size of Pratt certificates** (README 1.6). -/
theorem pratt_small_certificate : ∃ C : ℕ, ∀ n : ℕ, n.Prime →
    ∃ c : PrattCertificate, c.valid ∧ c.value = n ∧
      prattBitSize c ≤ C * (Nat.log 2 n + 1) ^ 2 := by
  sorry

/-- **Strong Miller–Rabin liar** (README 1.7): with `n − 1 = 2^h·t`, `t` odd, either `a^t = 1` or
`a^(t·2^j) = −1` in `ZMod n` for some `j < h`. The sample space is `1, …, n − 1`. -/
def StrongLiar (n a : ℕ) : Prop :=
  1 < n ∧ Odd n ∧ 0 < a ∧ a < n ∧
    ((a : ZMod n) ^ ((n - 1) / 2 ^ (n - 1).factorization 2) = 1 ∨
      ∃ j < (n - 1).factorization 2,
        (a : ZMod n) ^ ((n - 1) / 2 ^ (n - 1).factorization 2 * 2 ^ j) = -1)

/-- A prime base passes and input one fails the roadmap strong-liar predicate. -/
example : StrongLiar 7 3 ∧ ¬ StrongLiar 1 1 := by decide

/-- The composite `2047=23*89` passes the strong test at base two. -/
theorem strongLiar_2047_composite : StrongLiar 2047 2 ∧ ¬ (2047).Prime := by
  sorry

/-- **Prime inputs pass every admissible base** (README 1.8). -/
theorem strongLiar_of_prime (n a : ℕ) (hn : n.Prime) (hodd : Odd n) (ha : 0 < a) (han : a < n) :
    StrongLiar n a := by
  sorry

/-- **The Miller–Rabin bound** (README 1.9): an odd composite `n` has at most `(n − 1)/4` strong
liars among `1, …, n − 1`. -/
theorem strongLiar_card_le (n : ℕ) (hn : 1 < n) (hodd : Odd n) (hc : ¬ n.Prime) :
    4 * Nat.card {a : ℕ // StrongLiar n a} ≤ n - 1 := by
  sorry

/-- **Independent rounds** (README 1.10). -/
theorem millerRabin_rounds_bound (n k : ℕ) (hn : 1 < n) (hodd : Odd n) (hc : ¬ n.Prime) :
    4 ^ k * Nat.card {t : Fin k → ℕ // ∀ i, StrongLiar n (t i)} ≤ (n - 1) ^ k := by
  sorry

/-- The multiplicative order of the residue class of `n` modulo `r`. -/
def aksOrder (n r : ℕ) : ℕ := orderOf (n : ZMod r)

/-- Binary length, with length one assigned to zero. -/
def aksLen (n : ℕ) : ℕ := Nat.log 2 n + 1

/-- The least AKS-admissible modulus, with sentinel zero at `n ≤ 1`. -/
def aksParameter (n : ℕ) : ℕ :=
  if hn : n ≤ 1 then 0 else
    Nat.find (show ∃ r : ℕ, 2 ≤ r ∧ (1 < Nat.gcd n r ∨
        (Nat.Coprime n r ∧ 4 * aksLen n ^ 2 < aksOrder n r)) from
      ⟨n, by omega, Or.inl (by simpa using (show 1 < n by omega))⟩)

/-- Two and nine have moduli two and three; one has the zero sentinel. -/
theorem aksParameter_two_nine_one :
    aksParameter 2 = 2 ∧ aksParameter 9 = 3 ∧ aksParameter 1 = 0 := by
  sorry

/-- **AKS polynomial congruences** (README 1.12): `(X + j)^n ≡ X^n + j` modulo `X^r − 1` over
`ZMod n` for `1 ≤ j ≤ ℓ`. -/
def AKSIdentities (n r ℓ : ℕ) : Prop :=
  ∀ j : ℕ, 1 ≤ j → j ≤ ℓ →
    (X + C (j : ZMod n)) ^ n %ₘ (X ^ r - 1) = (X ^ n + C (j : ZMod n)) %ₘ (X ^ r - 1)

/-- Characteristic five gives the prime identity; an empty range also passes at composite nine. -/
theorem AKSIdentities.five_and_empty_nine : AKSIdentities 5 2 3 ∧ AKSIdentities 9 2 0 := by
  sorry

/-- The characteristic-five congruence holds at every modulus and every finite length. -/
theorem AKSIdentities.five_all (r ℓ : ℕ) : AKSIdentities 5 r ℓ := by
  sorry

/-- An empty family of AKS identities holds even at composite inputs. -/
example (n r : ℕ) : AKSIdentities n r 0 := by
  intro j hj h0
  omega

/-- **Shoup's AKS test** (README 1.13), as an arithmetic predicate excluding
`n ≤ 1` and perfect powers, and imposing the finite congruence family up to `2·len(n)·⌊√r⌋ + 1`. -/
def AKSAccepts (n : ℕ) : Prop :=
  1 < n ∧ (¬ ∃ a b : ℕ, 1 < a ∧ 1 < b ∧ a ^ b = n) ∧
    (aksParameter n = n ∨ (Nat.gcd n (aksParameter n) = 1 ∧
      AKSIdentities n (aksParameter n) (2 * aksLen n * Nat.sqrt (aksParameter n) + 1)))

/-- The primality wrapper accepts `2` and rejects the perfect power `9`. -/
theorem AKSAccepts.two_and_not_nine : AKSAccepts 2 ∧ ¬ AKSAccepts 9 := by
  sorry

/-- Input one fails the arithmetic AKS predicate independently of its congruences. -/
example : ¬ AKSAccepts 1 := by simp [AKSAccepts]

/-- **Correctness of AKS** (README 1.14). -/
theorem aks_correct (n : ℕ) : AKSAccepts n ↔ n.Prime := by
  sorry

/-- **Pocklington's prime-divisor congruence** (README 1.15): under the witness hypotheses every
prime divisor `p` of `n` satisfies `F ∣ p − 1`. -/
theorem pocklington_prime_divisor (n F : ℕ) (hn : 1 < n) (hF1 : 1 < F) (hF : F ∣ n - 1)
    (h : ∀ q, q.Prime → q ∣ F →
      ∃ a : ℕ, a ^ (n - 1) ≡ 1 [MOD n] ∧ Nat.Coprime (a ^ ((n - 1) / q) - 1) n)
    (p : ℕ) (hp : p.Prime) (hpn : p ∣ n) : F ∣ p - 1 := by
  sorry

/-- **Pocklington's criterion** (README 1.16): if `F ∣ n − 1`, `n < F²`, and every prime
`q ∣ F` has a witness `a` with `a^(n−1) ≡ 1` and `gcd(a^((n−1)/q) − 1, n) = 1`, then `n` is
prime. The witness may depend on `q` (a natural number; an integer witness reduces modulo `n`),
and `F` need not be coprime to `(n − 1)/F`. -/
theorem pocklington_prime (n F : ℕ) (hn : 1 < n) (hF1 : 1 < F) (hF : F ∣ n - 1) (hF2 : n < F ^ 2)
    (h : ∀ q, q.Prime → q ∣ F →
      ∃ a : ℕ, a ^ (n - 1) ≡ 1 [MOD n] ∧ Nat.Coprime (a ^ ((n - 1) / q) - 1) n) :
    n.Prime := by
  sorry

/-- **Finite Pocklington certificate** (README 1.17): Pratt trees for the certified part `F` of
`n − 1`, one witness per occurrence. -/
structure PocklingtonCertificate where
  entries : List (PrattCertificate × ℕ)

/-- The certified part `F`. -/
def PocklingtonCertificate.factor (c : PocklingtonCertificate) : ℕ :=
  (c.entries.map fun e => e.1.value).prod

/-- Validity of Pocklington data: the certified part exceeds `√n` and its witnesses
satisfy the prime-divisor congruences. -/
def PocklingtonCertificate.valid (c : PocklingtonCertificate) (n : ℕ) : Prop :=
  1 < n ∧ 1 < c.factor ∧ c.factor ∣ n - 1 ∧ n < c.factor ^ 2 ∧
    ∀ e ∈ c.entries, e.1.valid ∧ e.2 ^ (n - 1) % n = 1 ∧
      Nat.gcd (e.2 ^ ((n - 1) / e.1.value) - 1) n = 1

/-- Three copies of two certify seventeen; one copy does not exceed its square root. -/
example : (PocklingtonCertificate.mk [(.two, 3), (.two, 3), (.two, 3)]).valid 17 ∧
    ¬ (PocklingtonCertificate.mk [(.two, 3)]).valid 17 ∧
    ¬ (PocklingtonCertificate.mk []).valid 17 := by
  norm_num [PocklingtonCertificate.valid, PocklingtonCertificate.factor,
    PrattCertificate.valid, PrattCertificate.value]

/-- **Soundness of Pocklington certificates** (README 1.18). -/
theorem PocklingtonCertificate.sound (c : PocklingtonCertificate) (n : ℕ)
    (h : c.valid n) : n.Prime := by
  sorry

/-- **Integer factorization with prime certificates** (README 1.19). -/
structure IntegerFactorCertificate where
  negative : Bool
  factors : List PrattCertificate

/-- The signed product of the certified primes. -/
def IntegerFactorCertificate.value (c : IntegerFactorCertificate) : ℤ :=
  (if c.negative then -1 else 1) * (c.factors.map fun q => (q.value : ℤ)).prod

/-- Integer factor validity: every prime tree is valid and the signed product is `z`. -/
def IntegerFactorCertificate.valid (c : IntegerFactorCertificate) (z : ℤ) : Prop :=
  (∀ q ∈ c.factors, q.valid) ∧ c.value = z

/-- The same prime trees present twelve and the empty negative product presents minus one. -/
example : (IntegerFactorCertificate.mk false [.two, .two, .node 3 2 [.two]]).valid 12 ∧
    (IntegerFactorCertificate.mk true []).valid (-1) := by
  norm_num [IntegerFactorCertificate.valid, IntegerFactorCertificate.value,
    PrattCertificate.valid, PrattCertificate.validList, PrattCertificate.nodeConditions,
    PrattCertificate.value]

/-- **Soundness** (README 1.20): an accepted certificate lists primes whose signed product is `z`. -/
theorem IntegerFactorCertificate.sound (c : IntegerFactorCertificate) (z : ℤ)
    (h : c.valid z) : c.value = z ∧ z ≠ 0 ∧ ∀ q ∈ c.factors, q.value.Prime := by
  sorry

/-- **Completeness** (README 1.21). -/
theorem IntegerFactorCertificate.complete (z : ℤ) (hz : z ≠ 0) :
    ∃ c : IntegerFactorCertificate, c.valid z := by
  sorry

/-- No valid signed prime product presents the integer zero. -/
theorem IntegerFactorCertificate.zero_invalid (c : IntegerFactorCertificate) : ¬ c.valid 0 := by
  sorry

end Primality

section Factorization

variable {F : Type*} [Field F] [Fintype F] [DecidableEq F]

/-- **Factorization certificate over a finite field** (README 1.22): a nonzero constant and
distinct Rabin-certified monic factors with positive exponents whose product is `f`. -/
structure FiniteFieldFactorCertificate (f : F[X]) where
  lead : F
  lead_ne_zero : lead ≠ 0
  factors : List (F[X] × ℕ)
  rabin : ∀ g ∈ factors, RabinCertificate g.1
  exp_pos : ∀ g ∈ factors, 0 < g.2
  nodup : (factors.map Prod.fst).Nodup
  eq_prod : f = C lead * (factors.map fun g => g.1 ^ g.2).prod

/-- Multiplicity two is stored as an exponent on the single distinct linear factor. -/
theorem FiniteFieldFactorCertificate.square_linear_three [Fact (Nat.Prime 3)] :
    ∃ c : FiniteFieldFactorCertificate ((X - 1) ^ 2 : (ZMod 3)[X]),
      c.factors = [(X - 1, 2)] ∧ c.lead = 1 := by
  sorry

/-- The unit polynomial has an empty finite-field factor presentation. -/
example : ∃ c : FiniteFieldFactorCertificate (1 : F[X]), c.lead = 1 ∧ c.factors = [] := by
  refine ⟨⟨1, one_ne_zero, [], ?_, ?_, ?_, ?_⟩, rfl, rfl⟩ <;> simp

/-- The split quadratic over the field of five elements has its two distinct linear factors. -/
theorem FiniteFieldFactorCertificate.five_split :
    ∃ c : FiniteFieldFactorCertificate (X ^ 2 + 1 : (ZMod 5)[X]),
      c.lead = 1 ∧ c.factors = [(X - C 2, 1), (X - C 3, 1)] := by
  sorry

/-- A nonzero scalar times monic factors cannot present the zero polynomial. -/
theorem FiniteFieldFactorCertificate.zero_impossible :
    ¬ Nonempty (FiniteFieldFactorCertificate (0 : F[X])) := by
  sorry

/-- **Soundness** (README 1.23): the certified factors are Mathlib's normalized factors. -/
theorem FiniteFieldFactorCertificate.sound {f : F[X]} (c : FiniteFieldFactorCertificate f) :
    f ≠ 0 ∧ f.leadingCoeff = c.lead ∧
      UniqueFactorizationMonoid.normalizedFactors f =
        (c.factors.map fun g => Multiset.replicate g.2 g.1).sum := by
  sorry

/-- **Completeness** (README 1.24). -/
theorem FiniteFieldFactorCertificate.complete {f : F[X]} (hf : f ≠ 0) :
    Nonempty (FiniteFieldFactorCertificate f) := by
  sorry

/-- **Transport along a change of presentation** (README 1.25). -/
theorem transport_finite_factorization {K : Type*} [Field K] [Fintype K] [DecidableEq K]
    (e : F ≃+* K) {f : F[X]} (c : FiniteFieldFactorCertificate f) :
    ∃ c' : FiniteFieldFactorCertificate (f.map e.toRingHom),
      c'.factors = c.factors.map fun g => (g.1.map e.toRingHom, g.2) := by
  sorry

end Factorization

/-- **Hensel lifting modulo `p^k`** (README 1.26): a coprime monic factorization modulo `p` of a
monic `f ∈ ℤ[X]` lifts uniquely to a monic factorization modulo `p^k`. -/
theorem henselLift (p : ℕ) [Fact p.Prime] (k : ℕ) (hk : 1 ≤ k) (f : ℤ[X]) (hf : f.Monic)
    (g₀ h₀ : (ZMod p)[X]) (hg₀ : g₀.Monic) (hh₀ : h₀.Monic) (hcop : IsCoprime g₀ h₀)
    (hfac : f.map (Int.castRingHom (ZMod p)) = g₀ * h₀) :
    ∃! gh : (ZMod (p ^ k))[X] × (ZMod (p ^ k))[X],
      gh.1.Monic ∧ gh.2.Monic ∧
      gh.1.map (ZMod.castHom (dvd_pow_self p (by omega)) (ZMod p)) = g₀ ∧
      gh.2.map (ZMod.castHom (dvd_pow_self p (by omega)) (ZMod p)) = h₀ ∧
      f.map (Int.castRingHom (ZMod (p ^ k))) = gh.1 * gh.2 := by
  sorry

/-- **Rational polynomial factor certificate** (README 1.27): a nonzero scalar and monic
irreducible factors over `ℚ`, with multiplicity by repetition. -/
structure RationalFactorCertificate (f : ℚ[X]) where
  lead : ℚ
  lead_ne_zero : lead ≠ 0
  factors : List ℚ[X]
  monic : ∀ g ∈ factors, g.Monic
  irreducible : ∀ g ∈ factors, Irreducible g
  eq_prod : f = C lead * factors.prod

/-- The zero polynomial has no factor certificate. -/
example (c : RationalFactorCertificate 0) : False := by
  have hp : c.factors.prod ≠ 0 := List.prod_ne_zero_iff.mpr
    (fun g hg => (c.monic g hg).ne_zero)
  exact (mul_ne_zero (Polynomial.C_ne_zero.mpr c.lead_ne_zero) hp) c.eq_prod.symm

/-- Units use an empty list, and repeated rational factors stay repeated in the presentation. -/
example : (∃ c : RationalFactorCertificate 1, c.lead = 1 ∧ c.factors = []) ∧
    (∃ c : RationalFactorCertificate ((X - 1) ^ 2), c.factors = [X - 1, X - 1]) := by
  constructor
  · refine ⟨⟨1, by norm_num, [], ?_, ?_, by simp⟩, rfl, rfl⟩
    · simp
    · simp
  · refine ⟨⟨1, by norm_num, [X - 1, X - 1], ?_, ?_, by simp [pow_two]⟩, rfl⟩
    · intro g hg
      have hg1 : g = X - 1 := by simpa using hg
      subst g
      simpa using (monic_X_sub_C (1 : ℚ))
    · intro g hg
      have hg1 : g = X - 1 := by simpa using hg
      subst g
      simpa using (irreducible_X_sub_C (1 : ℚ))

/-- **Certified rational factorization** (README 1.28): every nonzero rational polynomial has a
certificate, and the scalar is its leading coefficient. -/
theorem exists_rationalFactorCertificate (f : ℚ[X]) (hf : f ≠ 0) :
    ∃ c : RationalFactorCertificate f, c.lead = f.leadingCoeff := by
  sorry

/-! ## Layer CN.2: Order presentations and local arithmetic -/

section NumberFields

open NumberField
open scoped nonZeroDivisors

variable {K : Type*} [Field K] [NumberField K]

/-- **Finite order basis certificate** (README 2.1): a `ℚ`-basis of `K`, integer coordinates of
`1` and integer structure constants. Maximality is not asserted. -/
structure OrderBasisCertificate (K : Type*) [Field K] [NumberField K] (n : ℕ) where
  basis : Fin n → K
  linearIndependent : LinearIndependent ℚ basis
  span_eq_top : Submodule.span ℚ (Set.range basis) = ⊤
  oneCoord : Fin n → ℤ
  one_eq : ∑ i, (oneCoord i : K) * basis i = 1
  structureConst : Fin n → Fin n → Fin n → ℤ
  mul_eq : ∀ i j, basis i * basis j = ∑ k, (structureConst i j k : K) * basis k

/-- The integer span of the certified basis. -/
def OrderBasisCertificate.lattice {n : ℕ} (b : OrderBasisCertificate K n) : Submodule ℤ K :=
  Submodule.span ℤ (Set.range b.basis)

/-- The integer span of the basis is closed under multiplication. -/
theorem OrderBasisCertificate.mul_mem {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) {x y : K}
    (hx : x ∈ b.lattice) (hy : y ∈ b.lattice) : x * y ∈ b.lattice := by
  sorry

/-- A full order cannot have rank zero. -/
example {K : Type*} [Field K] [NumberField K] : ¬ Nonempty (OrderBasisCertificate K 0) := by
  rintro ⟨b⟩
  have h := b.one_eq
  simp at h

/-- A singleton half-basis is not closed under integral multiplication. -/
theorem OrderBasisCertificate.half_basis_impossible :
    ¬ ∃ b : OrderBasisCertificate ℚ 1, b.basis = fun _ => 1 / 2 := by
  sorry

/-- **Multiplier ring of a lattice** (README 2.2): `{x ∈ K | x·I ⊆ I}` for any `ℤ`-submodule `I`;
the zero lattice has the whole field as multiplier ring. -/
def multiplierRing {L : Type*} [Field L] [CharZero L] (I : Submodule ℤ L) : Subalgebra ℤ L where
  carrier := {x | ∀ y ∈ I, x * y ∈ I}
  mul_mem' {a b} ha hb y hy := by rw [mul_assoc]; exact ha _ (hb y hy)
  add_mem' {a b} ha hb y hy := by rw [add_mul]; exact I.add_mem (ha y hy) (hb y hy)
  algebraMap_mem' r y hy := by
    rw [algebraMap_int_eq, eq_intCast, ← zsmul_eq_mul]
    exact I.smul_mem r hy

/-- Multiplier membership means stabilizing every lattice element. -/
theorem mem_multiplierRing {L : Type*} [Field L] [CharZero L] (I : Submodule ℤ L) (x : L) :
    x ∈ multiplierRing I ↔ ∀ y ∈ I, x * y ∈ I := Iff.rfl

/-- Every field element stabilizes the zero lattice. -/
example : multiplierRing (⊥ : Submodule ℤ ℚ) = ⊤ := by
  ext x; simp [mem_multiplierRing]

/-- `1/2` does not stabilize `ℤ ⊆ ℚ`. -/
theorem multiplierRing_half_impossible : (1 / 2 : ℚ) ∉ multiplierRing (Submodule.span ℤ {(1 : ℚ)}) := by
  sorry

/-- The order certificate for `ℚ` has basis `[1]`, and its integer span excludes `1/2`. -/
theorem OrderBasisCertificate.rational_singleton : ∃ b : OrderBasisCertificate ℚ 1,
    b.basis = (fun _ => 1) ∧ (1 / 2 : ℚ) ∉ b.lattice := by
  sorry

/-- The multipliers of the integer lattice inside the rationals are exactly the integers. -/
theorem multiplierRing_integer_lattice :
    multiplierRing (Submodule.span ℤ {(1 : ℚ)}) = (⊥ : Subalgebra ℤ ℚ) := by
  sorry

/-- **Local maximality of an order** (README 2.3): every integral element has a multiple prime to
`p` in `R`. -/
def IsPMaximal (R : Subalgebra ℤ K) (p : ℕ) : Prop :=
  ∀ x : K, IsIntegral ℤ x → ∃ a : ℤ, ¬ (p : ℤ) ∣ a ∧ (a : K) * x ∈ R

/-- At `p = 1` no denominator passes. -/
example : ¬ IsPMaximal (⊥ : Subalgebra ℤ ℚ) 1 := by
  intro h
  obtain ⟨a, ha, -⟩ := h 1 isIntegral_one
  simp at ha

/-- The native integer order in the rationals is locally maximal at every rational prime. -/
theorem isPMaximal_integer_order (p : ℕ) [Fact p.Prime] :
    IsPMaximal (⊥ : Subalgebra ℤ ℚ) p := by
  sorry

/-- Enlargement preserves the prime-to-p denominator-clearing property. -/
theorem isPMaximal_mono {K : Type*} [Field K] [NumberField K]
    (R S : Subalgebra ℤ K) (p : ℕ) (hRS : R ≤ S) (hR : IsPMaximal R p) : IsPMaximal S p := by
  intro x hx
  obtain ⟨a, ha, hax⟩ := hR x hx
  exact ⟨a, ha, hRS hax⟩

/-- **Nilradical from a Frobenius kernel** (README 2.4). -/
theorem nilpotent_iff_frobenius_zero (p : ℕ) [Fact p.Prime] {A : Type*} [CommRing A]
    [Algebra (ZMod p) A] [FiniteDimensional (ZMod p) A] (k : ℕ)
    (hk : Module.finrank (ZMod p) A ≤ p ^ k) (x : A) : IsNilpotent x ↔ x ^ (p ^ k) = 0 := by
  sorry

/-- **The `p`-radical in field coordinates** (README 2.5): the radical of `pR` in `R`, viewed as
a lattice in `K`. For a prime `p` and an order `R` it is the set of `x ∈ R` with a positive power
in `pR`. -/
def pRadicalLattice (R : Subalgebra ℤ K) (p : ℕ) : Submodule ℤ K :=
  ((Ideal.span {(p : R)}).radical.restrictScalars ℤ).map (R.val.toLinearMap.restrictScalars ℤ)

/-- The radical lattice consists of elements with a positive power in pR. -/
theorem mem_pRadicalLattice {K : Type*} [Field K] [NumberField K] (R : Subalgebra ℤ K) (p : ℕ) (hp : p.Prime)
    (hR : (Subalgebra.toSubmodule R).FG) (x : K) :
    x ∈ pRadicalLattice R p ↔ x ∈ R ∧ ∃ k ≥ 1, ∃ y ∈ R, x ^ k = (p : K) * y := by
  sorry

/-- In the usual integer order of `ℚ`, the `3`-radical contains `3` and excludes `1`. -/
theorem pRadicalLattice_integer_three : (3 : ℚ) ∈ pRadicalLattice (⊥ : Subalgebra ℤ ℚ) 3 ∧
    (1 : ℚ) ∉ pRadicalLattice (⊥ : Subalgebra ℤ ℚ) 3 := by
  sorry

/-- The zero radical of a characteristic-zero order is zero. -/
theorem pRadicalLattice_zero {K : Type*} [Field K] [NumberField K]
    (R : Subalgebra ℤ K) : pRadicalLattice R 0 = ⊥ := by
  sorry

/-- **Multiplier criterion for `p`-maximality** (README 2.6), for an order `R` (finitely generated,
spanning `K` over `ℚ`). -/
theorem pRadical_multiplier_eq_iff {K : Type*} [Field K] [NumberField K] (R : Subalgebra ℤ K)
    (hfg : (Subalgebra.toSubmodule R).FG) (hspan : Submodule.span ℚ (R : Set K) = ⊤)
    (p : ℕ) [Fact p.Prime] :
    multiplierRing (pRadicalLattice R p) = R ↔ IsPMaximal R p := by
  sorry

/-- **Integral basis certificate** (README 2.7): an order basis whose lattice is the ring of
integers. -/
structure IntegralBasisCertificate (K : Type*) [Field K] [NumberField K] (n : ℕ)
    extends OrderBasisCertificate K n where
  maximal : ∀ x : K, IsIntegral ℤ x ↔ x ∈ toOrderBasisCertificate.lattice

/-- The maximal order of `ℚ` is certified by the singleton basis `[1]`. -/
theorem IntegralBasisCertificate.rational_singleton : ∃ b : IntegralBasisCertificate ℚ 1, b.basis = (fun _ => 1) := by
  sorry

/-- An integral basis has positive rank, including for the rational field. -/
theorem IntegralBasisCertificate.rank_pos {K : Type*} [Field K] [NumberField K]
    {n : ℕ} (c : IntegralBasisCertificate K n) : 0 < n := by
  cases n with
  | zero => have h := c.one_eq; simp at h
  | succ n => omega

/-- The rational half cannot lie in the native integral lattice of a certified integral basis. -/
theorem IntegralBasisCertificate.half_not_mem (c : IntegralBasisCertificate ℚ 1) :
    (1 / 2 : ℚ) ∉ c.lattice := by
  sorry

/-- **An integral basis extending any full order exists** (README 2.8). -/
theorem exists_integralBasisCertificate_extending {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) :
    ∃ c : IntegralBasisCertificate K n, b.lattice ≤ c.lattice := by
  sorry

/-- **Prime-ideal decomposition certificate** (README 2.9). -/
structure PrimeIdealFactorCertificate (K : Type*) [Field K] [NumberField K] (p : ℕ) where
  factors : List (Ideal (𝓞 K) × ℕ)
  distinct : (factors.map Prod.fst).Nodup
  prime : ∀ x ∈ factors, x.1.IsPrime ∧ x.1 ≠ ⊥ ∧ 0 < x.2
  product : Ideal.span {(p : 𝓞 K)} = (factors.map fun x => x.1 ^ x.2).prod

/-- A prime ideal product representing a rational prime has at least one factor. -/
theorem PrimeIdealFactorCertificate.nonempty {K : Type*} [Field K] [NumberField K] {p : ℕ} (hp : p.Prime)
    (c : PrimeIdealFactorCertificate K p) : c.factors ≠ [] := by
  sorry

/-- The rational prime `2` has exactly one prime ideal factor, with exponent one, in `ℚ`. -/
theorem PrimeIdealFactorCertificate.rational_two : ∃ c : PrimeIdealFactorCertificate ℚ 2,
    c.factors = [(Ideal.span {(2 : 𝓞 ℚ)}, 1)] := by
  sorry

/-- Zero exponents and zero ideals cannot pad a prime-ideal decomposition. -/
example {K : Type*} [Field K] [NumberField K] {p : ℕ}
    (c : PrimeIdealFactorCertificate K p) :
    (∀ I, (I, 0) ∉ c.factors) ∧ ∀ e, (⊥, e) ∉ c.factors := by
  constructor
  · intro I h
    exact (Nat.lt_irrefl 0) (c.prime (I, 0) h).2.2
  · intro e h
    exact (c.prime (⊥, e) h).2.1 rfl

end NumberFields

section Newton

/-- **Exact `φ`-adic expansion** (README 2.16): the `i`-th coefficient of `f` in base `φ` is
`(f /ₘ φ^i) %ₘ φ`. -/
def phiExpansion {R : Type*} [CommRing R] (φ f : R[X]) (i : ℕ) : R[X] :=
  (f /ₘ φ ^ i) %ₘ φ

/-- The finite sum of φ-coefficients times powers of φ reconstructs the polynomial. -/
theorem phiExpansion_reconstruct {R : Type*} [CommRing R] (φ f : R[X]) (hφ : φ.Monic)
    (hm : 0 < φ.natDegree) :
    f = ∑ i ∈ Finset.range (f.natDegree / φ.natDegree + 1), phiExpansion φ f i * φ ^ i := by
  sorry

/-- The boundary comparison specified in README 2.16. -/
theorem phiExpansion_X (f : ℤ[X]) (i : ℕ) : phiExpansion X f i = C (f.coeff i) := by
  sorry

/-- Zero has only zero φ-coefficients. -/
example (φ : ℤ[X]) (i : ℕ) : phiExpansion φ 0 i = 0 := by simp [phiExpansion]

/-- Shifting the base from X to X−1 gives the three coefficients 1,2,1 for X². -/
theorem phiExpansion_shifted_square :
    phiExpansion (X - 1 : ℤ[X]) (X ^ 2) 0 = 1 ∧
    phiExpansion (X - 1 : ℤ[X]) (X ^ 2) 1 = 2 ∧
    phiExpansion (X - 1 : ℤ[X]) (X ^ 2) 2 = 1 := by
  sorry

/-- **Gauss valuation of a coefficient** (README 2.17): `⊤` for the zero polynomial. -/
def coefficientValuation (p : ℕ) (a : ℤ[X]) : WithTop ℕ :=
  a.support.inf fun i => ((padicValInt p (a.coeff i) : ℕ) : WithTop ℕ)

/-- Zero coefficients give infinite Gauss valuation. -/
example (p : ℕ) : coefficientValuation p 0 = ⊤ := by simp [coefficientValuation]

/-- Coefficient support excludes zero coefficients from the Gauss valuation. -/
theorem coefficientValuation_three_controls :
    coefficientValuation 3 (3 * X + 9) = 1 ∧ coefficientValuation 3 (X ^ 2) = 0 := by
  sorry

/-- **A finite negative `φ`-Newton side** (README 2.18): from `(s, u)` to `(s + e·d, u − h·d)`,
slope `−h/e`, `gcd(e, h) = 1`, endpoints on the line and every point on or above it. The theorems
that use it assume `p` prime and `φ` monic of positive degree. -/
def IsPhiNewtonSide (p : ℕ) (φ f : ℤ[X]) (s u e h d : ℕ) : Prop :=
  0 < e ∧ 0 < h ∧ 0 < d ∧ Nat.Coprime e h ∧ h * d ≤ u ∧
    coefficientValuation p (phiExpansion φ f s) = u ∧
    coefficientValuation p (phiExpansion φ f (s + e * d)) = (u - h * d : ℕ) ∧
    ∀ i, ∀ v : ℕ, coefficientValuation p (phiExpansion φ f i) = v →
      e * u + h * s ≤ e * v + h * i ∧ (e * v + h * i = e * u + h * s → s ≤ i ∧ i ≤ s + e * d)

/-- `X² − 3` has slope `−1/2`; assigning slope `−1` fails the endpoint data. -/
theorem phiSide_X_sq_sub_three : IsPhiNewtonSide 3 X (X ^ 2 - 3) 0 1 2 1 1 ∧
    ¬ IsPhiNewtonSide 3 X (X ^ 2 - 3) 0 1 1 1 2 := by
  sorry

/-- The zero polynomial has no finite φ-side at any displayed endpoints. -/
example (p s u e h d : ℕ) (φ : ℤ[X]) : ¬ IsPhiNewtonSide p φ 0 s u e h d := by
  simp [IsPhiNewtonSide, coefficientValuation, phiExpansion]

/-- Normalize each integer φ-coefficient by the side ordinate before reducing in the
residue quotient, then assemble the residual polynomial (README 2.19). -/
def phiResidualPolynomial (p : ℕ) (φ f : ℤ[X]) (s u e h d : ℕ) :
    Polynomial (AdjoinRoot (φ.map (Int.castRingHom (ZMod p)))) :=
  ∑ j ∈ Finset.range (d + 1), Polynomial.monomial j
    (AdjoinRoot.mk (φ.map (Int.castRingHom (ZMod p)))
      ((∑ i ∈ (phiExpansion φ f (s + e * j)).support, Polynomial.monomial i
        ((phiExpansion φ f (s + e * j)).coeff i / (p : ℤ) ^ (u - h * j))).map
          (Int.castRingHom (ZMod p))))

/-- A monic polynomial with one finite negative φ-side and irreducible residual polynomial
is irreducible over `ℚ_p` (README 2.20). -/
theorem ore_residual_irreducible (p : ℕ) [Fact p.Prime] (φ f : ℤ[X])
    (hφ : φ.Monic) (hm : 0 < φ.natDegree)
    (hirr : Irreducible (φ.map (Int.castRingHom (ZMod p)))) (hf : f.Monic)
    (e h d : ℕ) (hside : IsPhiNewtonSide p φ f 0 (h * d) e h d)
    (hred : f.map (Int.castRingHom (ZMod p)) =
      (φ.map (Int.castRingHom (ZMod p))) ^ (e * d))
    (hres : Irreducible (phiResidualPolynomial p φ f 0 (h * d) e h d)) :
    Irreducible (f.map (Int.castRingHom ℚ_[p])) := by
  sorry

/-- Zero input gives zero residual output even for raw, uncertified side data. -/
example (p s u e h d : ℕ) (φ : ℤ[X]) : phiResidualPolynomial p φ 0 s u e h d = 0 := by
  simp [phiResidualPolynomial, phiExpansion]

/-- The slope minus one half of X²−3 has residual Y−1. -/
theorem phiResidual_X_sq_sub_three : phiResidualPolynomial 3 X (X ^ 2 - 3) 0 1 2 1 1 = X - 1 := by
  sorry

/-- The repeated root in (X−3)² remains repeated in its residual polynomial. -/
theorem phiResidual_repeated_linear :
    phiResidualPolynomial 3 X ((X - 3) ^ 2) 0 2 1 1 2 = (X - 1) ^ 2 := by
  sorry

open ValuativeRel IsNonarchimedeanLocalField in
/-- A unit in a characteristic-zero nonarchimedean local field is a square iff it is a
square modulo `4π`, for any uniformizer `π` (README 2.22). -/
theorem isSquare_iff_isSquare_mod (L : Type*) [Field L] [ValuativeRel L]
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] [CharZero L]
    (π : 𝒪[L]) (hπ : Irreducible π) (u : (𝒪[L])ˣ) :
    IsSquare ((u : 𝒪[L]) : L) ↔
      ∃ w : 𝒪[L], (u : 𝒪[L]) - w ^ 2 ∈ Ideal.span {4 * π} := by
  sorry

/-- The degree-one primes above `p` count the roots in `ℚ_p`; a generating root identifies
`K` with `ℚ[X]/(f)` (README 2.23). -/
theorem card_padicRoots_eq (K : Type*) [Field K] [NumberField K]
    (f : ℚ[X]) (hf : f.Monic) (hirr : Irreducible f) (θ : K)
    (hθ : aeval θ f = 0) (hgen : Algebra.adjoin ℚ {θ} = ⊤)
    (p : ℕ) [Fact p.Prime] :
    Nat.card {x : ℚ_[p] // aeval x f = 0} =
      Nat.card {P : Ideal (NumberField.RingOfIntegers K) //
        P.IsPrime ∧ P ≠ ⊥ ∧ P ∣ Ideal.span {(p : NumberField.RingOfIntegers K)} ∧
          P.ramificationIdx ℤ = 1 ∧ P.inertiaDeg ℤ = 1} := by
  sorry

/-- The native `ℤ_p` specialization of the unit-square criterion, including `p=2`. -/
theorem isSquare_iff_isSquare_mod_padic (p : ℕ) [Fact p.Prime] (u : ℤ_[p]ˣ) :
    IsSquare (u : ℚ_[p]) ↔
      ∃ w : ℤ_[p], (u : ℤ_[p]) - w ^ 2 ∈ Ideal.span {(4 * p : ℤ_[p])} := by
  sorry

open ValuativeRel IsNonarchimedeanLocalField in
/-- In a ramified dyadic field with `π²=2`, the unit `3+2π` passes the square-residue
criterion, with square root `1+π`. -/
theorem ramified_dyadic_unit_square (L : Type*) [Field L] [ValuativeRel L]
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] [CharZero L]
    (π : 𝒪[L]) (hπ : Irreducible π) (hπsq : (π : L) ^ 2 = 2)
    (u : (𝒪[L])ˣ) (hu : ((u : 𝒪[L]) : L) = 3 + 2 * (π : L)) :
    IsSquare ((u : 𝒪[L]) : L) ∧
      ∃ w : 𝒪[L], (u : 𝒪[L]) - w ^ 2 ∈ Ideal.span {4 * π} := by
  have hs : IsSquare ((u : 𝒪[L]) : L) := by
    refine ⟨1 + (π : L), ?_⟩
    rw [hu]
    linear_combination -hπsq
  exact ⟨hs, (isSquare_iff_isSquare_mod L π hπ u).mp hs⟩

end Newton

/-- **Finite local expansion certificate** (README 2.21). -/
structure LocalExpansionCertificate (L : Type*) [NormedField L] (π x : L) (N : ℕ) where
  pi_ne_zero : π ≠ 0
  norm_pi_lt_one : ‖π‖ < 1
  valuation : ℤ
  digits : Fin N → L
  digits_le : ∀ i, ‖digits i‖ ≤ 1
  error_le : ‖x - π ^ valuation * ∑ i, digits i * π ^ (i : ℕ)‖ ≤ ‖π‖ ^ (valuation + N)

/-- Zero has a zero-digit expansion at every finite length and every supplied uniformizer. -/
example {L : Type*} [NormedField L] (π : L) (hπ : π ≠ 0) (hπnorm : ‖π‖ < 1)
    (N : ℕ) : Nonempty (LocalExpansionCertificate L π 0 N) := by
  refine ⟨⟨hπ, hπnorm, 0, fun _ => 0, ?_, ?_⟩⟩
  · intro i; simp
  · simp only [zero_mul, Finset.sum_const_zero, mul_zero, sub_zero, norm_zero, zero_add]
    positivity

/-- A uniformizer inverse has the exact one-digit expansion with initial exponent minus one. -/
theorem LocalExpansionCertificate.uniformizer_inverse {L : Type*} [NormedField L]
    (π : L) (hπ : π ≠ 0) (hnorm : ‖π‖ < 1) :
    ∃ c : LocalExpansionCertificate L π π⁻¹ 1, c.valuation = -1 ∧ c.digits 0 = 1 := by
  sorry

/-- A precision-one zero centre cannot enclose one when the uniformizer has norm below one. -/
theorem LocalExpansionCertificate.one_not_zero_centre {L : Type*} [NormedField L]
    (π : L) (hπ : π ≠ 0) (hnorm : ‖π‖ < 1) :
    ¬ ∃ c : LocalExpansionCertificate L π 1 1, c.valuation = 0 ∧ ∀ i, c.digits i = 0 := by
  sorry

/-! ## Layer CN.3: Exact modular and elliptic arithmetic data -/

section Modular

open scoped MatrixGroups
open _root_.UpperHalfPlane _root_.ModularForm

/-- **Integral `q`-expansion lattice at level one** (README 3.1): the forms whose width-one
`q`-expansion coefficients are all integers (the set is already a lattice, so it is its own span).
It lives on the `q`-expansion side, distinct from the integral modular-symbol module. -/
def integralModularLattice (k : ℤ) : Submodule ℤ (ModularForm 𝒮ℒ k) :=
  Submodule.span ℤ {f | ∀ n, ∃ a : ℤ, (qExpansion 1 f).coeff n = a}

/-- The integer Fourier lattice consists exactly of coefficientwise integral forms. -/
theorem mem_integralModularLattice (k : ℤ) (f : ModularForm 𝒮ℒ k) :
    f ∈ integralModularLattice k ↔ ∀ n, ∃ a : ℤ, (qExpansion 1 f).coeff n = a := by
  sorry

/-- The zero form belongs even to the weight-zero integral lattice. -/
example : (0 : ModularForm 𝒮ℒ 0) ∈ integralModularLattice 0 := Submodule.zero_mem _

/-- The constant coefficient of half E₄ obstructs integrality. -/
theorem half_eisenstein_four_not_integral :
    ((1 / 2 : ℂ) • ModularForm.E₄) ∉ integralModularLattice 4 := by
  sorry

/-- **Integral cusp-form lattice** (README 3.2). -/
def integralCuspLattice (k : ℤ) : Submodule ℤ (CuspForm 𝒮ℒ k) :=
  Submodule.span ℤ {f | ∀ n, ∃ a : ℤ, (qExpansion 1 f).coeff n = a}

/-- The integer cusp lattice consists exactly of coefficientwise integral cusp forms. -/
theorem mem_integralCuspLattice (k : ℤ) (f : CuspForm 𝒮ℒ k) :
    f ∈ integralCuspLattice k ↔ ∀ n, ∃ a : ℤ, (qExpansion 1 f).coeff n = a := by
  sorry

/-- The boundary comparison specified in README 3.1. -/
theorem eisenstein_four_integral : ModularForm.E₄ ∈ integralModularLattice 4 := by
  sorry

/-- The boundary comparison specified in README 3.2. -/
theorem half_discriminant_not_integral : ((1 / 2 : ℂ) • CuspForm.discriminant) ∉ integralCuspLattice 12 := by
  sorry

/-- The normalized discriminant has integral Fourier coefficients. -/
theorem discriminant_integral : CuspForm.discriminant ∈ integralCuspLattice 12 := by
  sorry

/-- The weight-zero cusp lattice has no nonzero element. -/
theorem integralCuspLattice_weight_zero : integralCuspLattice 0 = ⊥ := by
  sorry

/-- **The Miller basis exists** (README 3.3): for even `k` there is a `ℤ`-basis of the integral
cusp lattice whose first `d` coefficients form the identity matrix. -/
theorem exists_millerBasis (k : ℕ) (hk : Even k) :
    ∃ b : Module.Basis (Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k : ℤ)))) ℤ (integralCuspLattice k),
      ∀ i j, (qExpansion 1 (b i : CuspForm 𝒮ℒ (k : ℤ))).coeff (j.val + 1) =
        if i = j then 1 else 0 := by
  sorry

/-- **Level-one congruence Sturm bound** (README 3.4). -/
theorem levelOne_congruence_sturm (k : ℕ) (p : ℕ) (hp : p.Prime)
    (f : integralModularLattice (k : ℤ))
    (h : ∀ n ≤ k / 12, ∃ a : ℤ, (p : ℤ) ∣ a ∧ (qExpansion 1 (f : ModularForm 𝒮ℒ (k : ℤ))).coeff n = a) :
    ∀ n, ∃ a : ℤ, (p : ℤ) ∣ a ∧ (qExpansion 1 (f : ModularForm 𝒮ℒ (k : ℤ))).coeff n = a := by
  sorry

/-- **Level-one Hecke recurrence** (README 3.6): the coefficient formula of `T_p` on level-one cusp
forms, as a predicate on a supplied endomorphism. -/
def HasLevelOnePrimeRecurrence (k p : ℕ) (T : Module.End ℂ (CuspForm 𝒮ℒ (k : ℤ))) : Prop :=
  ∀ (f : CuspForm 𝒮ℒ (k : ℤ)) (m : ℕ), (qExpansion 1 (T f)).coeff m =
    (qExpansion 1 f).coeff (p * m) + if p ∣ m then (p : ℂ) ^ (k - 1) * (qExpansion 1 f).coeff (m / p) else 0

/-- Width-one Fourier coefficients determine at most one endomorphism with the given recurrence. -/
theorem heckeRecurrence_unique (k p : ℕ) (T U : Module.End ℂ (CuspForm 𝒮ℒ (k : ℤ)))
    (hT : HasLevelOnePrimeRecurrence k p T) (hU : HasLevelOnePrimeRecurrence k p U) : T = U := by
  sorry

/-- At weight `12`, `T₂` acts on `Δ` by `−24`. -/
theorem heckeRecurrence_discriminant_two : HasLevelOnePrimeRecurrence 12 2 ((-24 : ℂ) • LinearMap.id) := by
  sorry

/-- Weight two has the zero recurrence, but the zero operator fails the weight-twelve recurrence. -/
theorem heckeRecurrence_zero_controls :
    HasLevelOnePrimeRecurrence 2 2 0 ∧ ¬ HasLevelOnePrimeRecurrence 12 2 0 := by
  sorry

/-- **The coefficient at `107` of `ΔE₄²E₆`** (README 3.8). -/
theorem weight26_coeff_107 :
    (qExpansion 1 (fun z : ℍ => ModularForm.discriminant z * ModularForm.E₄ z ^ 2 *
      ModularForm.E₆ z)).coeff 107 = (35830422465487817813321292 : ℂ) := by
  sorry

/-- **Ordinary reduction at `107`** (README 3.9). -/
theorem weight26_ordinary_107 : (35830422465487817813321292 : ZMod 107) = -1 := by decide

end Modular

section EllipticCurves

/-- **Point counts as a character sum** (README 3.17): in odd characteristic, for `a₁ = a₃ = 0`,
Tau Ceti's projective count is `q + 1 + Σ χ(f(x))`, the singular point included. -/
theorem pointCount_eq_charSum {F : Type*} [Field F] [Fintype F] [DecidableEq F]
    (hF : ringChar F ≠ 2) (W : WeierstrassCurve F) (h₁ : W.a₁ = 0) (h₃ : W.a₃ = 0) :
    (W.pointCount : ℤ) = Fintype.card F + 1 +
      ∑ x : F, quadraticChar F (x ^ 3 + W.a₂ * x ^ 2 + W.a₄ * x + W.a₆) := by
  sorry

/-- The projective trace in odd characteristic is the negative quadratic-character sum. -/
theorem frobeniusTrace_eq_neg_charSum {F : Type*} [Field F] [Fintype F] [DecidableEq F]
    (hF : ringChar F ≠ 2) (W : WeierstrassCurve F) (h₁ : W.a₁ = 0) (h₃ : W.a₃ = 0) :
    W.frobeniusTrace = -∑ x : F, quadraticChar F (x ^ 3 + W.a₂ * x ^ 2 + W.a₄ * x + W.a₆) := by
  sorry

/-- `y² = x³ + x + 1` over `ZMod 5` has `9` points. -/
theorem pointCount_five_cubic [Fact (Nat.Prime 5)] : (⟨0, 0, 0, 1, 1⟩ : WeierstrassCurve (ZMod 5)).pointCount = 9 := by
  sorry

/-- Odd characteristic, singular models and characteristic two give discriminating point counts. -/
theorem pointCount_small_character_controls :
    (⟨0, 0, 0, 1, 0⟩ : WeierstrassCurve (ZMod 3)).pointCount = 4 ∧
    (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 5)).pointCount = 6 ∧
    (⟨0, 0, 0, 0, 1⟩ : WeierstrassCurve (ZMod 2)).pointCount = 3 := by
  sorry

section LocalImage

variable {K : Type*} [Field K] [DecidableEq K] (W : WeierstrassCurve.Affine K) [W.IsElliptic]
  [W.IsCharNeTwoNF]

/-- **The subgroup generated by certified abscissae** (README 3.18): the classes of `x − T`, in
Tau Ceti's square-class group `W.M`, for a finite list of abscissae in the local field; a
certificate uses the images of rational abscissae. -/
def localImageSpan (xs : List K) : Subgroup W.M :=
  Subgroup.closure ((fun x => W.μX x) '' {x | x ∈ xs})

/-- An empty abscissa list generates the trivial local-image subgroup. -/
example : localImageSpan W [] = ⊥ := by
  simp [localImageSpan]

/-- Each abscissa with `f(x)` a nonzero square is the class of an actual point. -/
theorem localImageSpan_le_range (xs : List K)
    (hxs : ∀ x ∈ xs, W.f.eval x ≠ 0 ∧ IsSquare (W.f.eval x)) :
    localImageSpan W xs ≤ (WeierstrassCurve.Affine.μ (W := W)).range := by
  sorry

end LocalImage

/-- **The size check completes a local image at a prime** (README 3.19). -/
theorem localImageSpan_eq_range_of_card_padic (p : ℕ) [Fact p.Prime] [DecidableEq ℚ_[p]]
    (W : WeierstrassCurve.Affine ℚ_[p]) [W.IsElliptic] [W.IsCharNeTwoNF] (xs : List ℚ_[p])
    (hxs : ∀ x ∈ xs, W.f.eval x ≠ 0 ∧ IsSquare (W.f.eval x))
    (hcard : Nat.card (localImageSpan W xs) =
      (1 + Nat.card {x : ℚ_[p] // W.f.eval x = 0}) * (if p = 2 then 2 else 1)) :
    localImageSpan W xs = (WeierstrassCurve.Affine.μ (W := W)).range := by
  sorry

/-- **The size check at the real place** (README 3.19). -/
theorem localImageSpan_eq_range_of_card_real [DecidableEq ℝ] (W : WeierstrassCurve.Affine ℝ)
    [W.IsElliptic] [W.IsCharNeTwoNF] (xs : List ℝ)
    (hxs : ∀ x ∈ xs, 0 < W.f.eval x)
    (hcard : 2 * Nat.card (localImageSpan W xs) = 1 + Nat.card {x : ℝ // W.f.eval x = 0}) :
    localImageSpan W xs = (WeierstrassCurve.Affine.μ (W := W)).range := by
  sorry

/-- **`p`-saturated subgroups** (README 3.22). -/
def IsPSaturated {A : Type*} [AddCommGroup A] (G : AddSubgroup A) (p : ℕ) : Prop :=
  ∀ a : A, p • a ∈ G → a ∈ G

/-- The full group is saturated for every natural multiplier. -/
example {A : Type*} [AddCommGroup A] (p : ℕ) : IsPSaturated (⊤ : AddSubgroup A) p :=
  fun a _ => AddSubgroup.mem_top a

/-- `6ℤ` is `5`-saturated and not `2`-saturated in `ℤ`. -/
theorem isPSaturated_six_integers : IsPSaturated (AddSubgroup.zmultiples (6 : ℤ)) 5 ∧
    ¬ IsPSaturated (AddSubgroup.zmultiples (6 : ℤ)) 2 ∧
    ¬ IsPSaturated (AddSubgroup.zmultiples (6 : ℤ)) 3 := by
  sorry

/-- A finite-index subgroup is p-saturated exactly when its index is prime to p. -/
theorem isPSaturated_iff_not_dvd_index {A : Type*} [AddCommGroup A] (G : AddSubgroup A)
    (p : ℕ) (hp : p.Prime) (hG : G.FiniteIndex) : IsPSaturated G p ↔ ¬ p ∣ G.index := by
  sorry

/-- **`p`-saturation by finitely many divisibility tests** (README 3.23): for generators `g`, no
combination with a coefficient prime to `p` is divisible by `p` in `A`, and `A[p] ⊆ G`, exactly
when `G` is `p`-saturated and the generators are independent modulo `pG`. -/
theorem isPSaturated_iff_forall_not_dvd {A : Type*} [AddCommGroup A] (p : ℕ) (hp : p.Prime)
    {m : ℕ} (g : Fin m → A) :
    ((∀ b : Fin m → ℤ, (∃ y : A, ∑ i, b i • g i = p • y) → ∀ i, (p : ℤ) ∣ b i) ∧
      ∀ a : A, p • a = 0 → a ∈ AddSubgroup.closure (Set.range g)) ↔
    (IsPSaturated (AddSubgroup.closure (Set.range g)) p ∧
      ∀ b : Fin m → ℤ, (∃ y ∈ AddSubgroup.closure (Set.range g), ∑ i, b i • g i = p • y) →
        ∀ i, (p : ℤ) ∣ b i) := by
  sorry

/-- **The quotient-generating saturation criterion** (README 3.23): the listed elements need
only generate `G / pG`, allowing prime-to-`p` torsion to be omitted. -/
theorem isPSaturated_iff_forall_not_dvd_of_span_quotient {A : Type*} [AddCommGroup A]
    (G : AddSubgroup A) (p : ℕ) (hp : p.Prime) {m : ℕ} (g : Fin m → A)
    (hg : ∀ i, g i ∈ G)
    (hgen : ∀ x ∈ G, ∃ b : Fin m → ℤ, ∃ y ∈ G, x = ∑ i, b i • g i + p • y) :
    ((∀ b : Fin m → ℤ, (∃ y : A, ∑ i, b i • g i = p • y) → ∀ i, (p : ℤ) ∣ b i) ∧
      ∀ a : A, p • a = 0 → a ∈ G) ↔
    (IsPSaturated G p ∧
      ∀ b : Fin m → ℤ, (∃ y ∈ G, ∑ i, b i • g i = p • y) → ∀ i, (p : ℤ) ∣ b i) := by
  sorry

/-- An empty candidate space cannot compensate for omitted ambient `2`-torsion. -/
example : (IsPSaturated (⊤ : AddSubgroup (ZMod 3)) 2 ∧
      AddSubgroup.closure (Set.range (Fin.elim0 : Fin 0 → ZMod 3)) ≠ ⊤) ∧
    ¬ IsPSaturated (⊥ : AddSubgroup (ZMod 2)) 2 ∧
    ¬ IsPSaturated ((⊤ : AddSubgroup ℤ).prod (⊥ : AddSubgroup (ZMod 2))) 2 := by
  constructor
  · constructor
    · intro a _; exact AddSubgroup.mem_top a
    · simp
  · constructor
    · intro h
      have h1 := h 1 (by norm_num)
      norm_num at h1
    · intro h
      have h1 := h (0, 1) (by norm_num)
      norm_num at h1

/-- **Exact divisibility test** (README 3.24): `P = (x, y)` is divisible by `p` in `W(ℚ)` exactly
when a rational root `x₀` of `Φ_p − x·ΨSq_p` carries a point `Q` with `p•Q = P`. -/
theorem mem_nsmul_iff_exists_root (W : WeierstrassCurve ℚ) [W.IsElliptic] (p : ℕ) (hp : p.Prime)
    (x y : ℚ) (h : W.toAffine.Nonsingular x y) :
    (∃ Q : W.toAffine.Point, p • Q = .some x y h) ↔
      ∃ x₀ : ℚ, (W.Φ p - C x * W.ΨSq p).eval x₀ = 0 ∧
        ∃ (y₀ : ℚ) (h₀ : W.toAffine.Nonsingular x₀ y₀), p • (.some x₀ y₀ h₀ : W.toAffine.Point) = .some x y h := by
  sorry

end EllipticCurves

/-! ## Layer CN.4: Quantitative analytic bounds and finite Gram data -/

section Intervals

/-- **Signed rational interval product** (README 4.1): the hull of the four corner products.
Mathlib's `NonemptyInterval` product is the monotone one and does not apply here. -/
def intervalMul (I J : NonemptyInterval ℚ) : NonemptyInterval ℚ :=
  ⟨(min (min (I.fst * J.fst) (I.fst * J.snd)) (min (I.snd * J.fst) (I.snd * J.snd)),
    max (max (I.fst * J.fst) (I.fst * J.snd)) (max (I.snd * J.fst) (I.snd * J.snd))),
    (min_le_left _ _).trans ((min_le_left _ _).trans ((le_max_left _ _).trans (le_max_left _ _)))⟩

/-- **Enclosure under multiplication** (README 4.2). -/
theorem intervalMul_sound (I J : NonemptyInterval ℚ) (x y : ℝ)
    (hx : (I.fst : ℝ) ≤ x ∧ x ≤ I.snd) (hy : (J.fst : ℝ) ≤ y ∧ y ≤ J.snd) :
    ((intervalMul I J).fst : ℝ) ≤ x * y ∧ x * y ≤ (intervalMul I J).snd := by
  sorry

/-- `[−1, 1]·[−1, 1]` has lower endpoint `−1`, not `1`. -/
example :
    (intervalMul ⟨(-2, 3), by norm_num⟩ ⟨(-4, 5), by norm_num⟩).fst = -12 ∧
    (intervalMul ⟨(-2, 3), by norm_num⟩ ⟨(-4, 5), by norm_num⟩).snd = 15 ∧
    (intervalMul ⟨(-1, 1), by norm_num⟩ ⟨(-1, 1), by norm_num⟩).fst = -1 := by
  norm_num [intervalMul]

/-- The singleton zero annihilates every signed interval. -/
example (I : NonemptyInterval ℚ) : intervalMul (NonemptyInterval.pure 0) I =
    NonemptyInterval.pure 0 := by
  ext <;> simp [intervalMul]

/-- **Partial interval reciprocal** (README 4.3): failure exactly when the interval contains `0`. -/
def intervalInv (I : NonemptyInterval ℚ) : Option (NonemptyInterval ℚ) :=
  if h : I.fst ≤ 0 ∧ 0 ≤ I.snd then none
  else some ⟨(I.snd⁻¹, I.fst⁻¹), by
    have hle := I.fst_le_snd
    by_cases h0 : 0 < I.fst
    · exact inv_anti₀ h0 hle
    · have hs : I.snd < 0 := by
        by_contra hs; exact h ⟨le_of_not_gt h0, le_of_not_gt hs⟩
      exact (inv_le_inv_of_neg hs (lt_of_le_of_lt hle hs)).2 hle⟩

/-- **Enclosure under reciprocal** (README 4.4). -/
theorem intervalInv_sound (I J : NonemptyInterval ℚ) (h : intervalInv I = some J) (x : ℝ)
    (hx : (I.fst : ℝ) ≤ x ∧ x ≤ I.snd) : x ≠ 0 ∧ (J.fst : ℝ) ≤ x⁻¹ ∧ x⁻¹ ≤ J.snd := by
  sorry

/-- Signed reciprocals reverse endpoints and the singleton zero is rejected. -/
example :
    intervalInv ⟨((2 : ℚ), 4), by norm_num⟩ = some ⟨(1 / 4, 1 / 2), by norm_num⟩ ∧
    intervalInv ⟨((-4 : ℚ), -2), by norm_num⟩ = some ⟨(-1 / 2, -1 / 4), by norm_num⟩ ∧
    intervalInv (NonemptyInterval.pure 0) = none := by
  decide

/-- **Outward dyadic rounding** (README 4.5): floor and ceiling on the `2^(−p)` grid. -/
def dyadicHull (p : ℕ) (I : NonemptyInterval ℚ) : NonemptyInterval ℚ :=
  ⟨((⌊2 ^ p * I.fst⌋ : ℚ) / 2 ^ p, (⌈2 ^ p * I.snd⌉ : ℚ) / 2 ^ p), by
    apply div_le_div_of_nonneg_right _ (by positivity)
    exact (Int.floor_le _).trans
      ((mul_le_mul_of_nonneg_left I.fst_le_snd (by positivity)).trans (Int.le_ceil _))⟩

/-- Outward rounding at precision zero sends `−1/3` to `[−1,0]`. -/
example :
    (dyadicHull 2 (NonemptyInterval.pure (1 / 3))).fst = 1 / 4 ∧
    (dyadicHull 2 (NonemptyInterval.pure (1 / 3))).snd = 1 / 2 ∧
    (dyadicHull 0 (NonemptyInterval.pure (-1 / 3))).fst = -1 ∧
    (dyadicHull 0 (NonemptyInterval.pure (-1 / 3))).snd = 0 := by
  norm_num [dyadicHull]

/-- Exact zero is unchanged by outward rounding at every precision. -/
example (p : ℕ) : dyadicHull p (NonemptyInterval.pure 0) = NonemptyInterval.pure 0 := by
  ext <;> simp [dyadicHull]

/-- **Width added by rounding** (README 4.6). -/
theorem dyadicHull_width (p : ℕ) (I : NonemptyInterval ℚ) :
    (dyadicHull p I).snd - (dyadicHull p I).fst < I.snd - I.fst + 2 / 2 ^ p := by
  sorry

/-- **Rational complex boxes** (README 4.7). -/
def complexBoxSet (R I : NonemptyInterval ℚ) : Set ℂ :=
  {z | ((R.fst : ℝ) ≤ z.re ∧ z.re ≤ R.snd) ∧ ((I.fst : ℝ) ≤ z.im ∧ z.im ≤ I.snd)}

/-- The singleton imaginary box contains `i` and excludes zero. -/
example : Complex.I ∈ complexBoxSet (NonemptyInterval.pure 0) (NonemptyInterval.pure 1) ∧
    0 ∉ complexBoxSet ⟨(1, 2), by norm_num⟩ ⟨(-1, 1), by norm_num⟩ := by
  norm_num [complexBoxSet]

/-- The zero singleton rectangle denotes precisely the zero complex number. -/
example : complexBoxSet (NonemptyInterval.pure 0) (NonemptyInterval.pure 0) = {0} := by
  ext z
  change ((0 ≤ z.re ∧ z.re ≤ 0) ∧ (0 ≤ z.im ∧ z.im ≤ 0)) ↔ z = 0
  constructor
  · rintro ⟨hr, hi⟩
    apply Complex.ext <;> simp only [Complex.zero_re, Complex.zero_im] <;> linarith
  · rintro rfl; norm_num

/-- **Unique integer extraction** (README 4.8). -/
def uniqueInteger (I : NonemptyInterval ℚ) : Option ℤ :=
  if ⌈I.fst⌉ = ⌊I.snd⌋ then some ⌈I.fst⌉ else none

/-- **Recovery of a known integral value** (README 4.9). -/
theorem uniqueInteger_sound (I : NonemptyInterval ℚ) (z w : ℤ)
    (hz : (I.fst : ℝ) ≤ z ∧ (z : ℝ) ≤ I.snd) (h : uniqueInteger I = some w) : z = w := by
  sorry

/-- Integer recovery distinguishes a unique integer, two integers, and no integer. -/
example :
    uniqueInteger ⟨((3 / 4 : ℚ), 5 / 4), by norm_num⟩ = some 1 ∧
    uniqueInteger ⟨((0 : ℚ), 1), by norm_num⟩ = none ∧
    uniqueInteger (NonemptyInterval.pure (1 / 2)) = none := by
  norm_num [uniqueInteger]

end Intervals

section ExplicitFormula

open Real

/-- **The Odlyzko tail kernel** (README 4.14): `r(x) = 2π² e^(−x)/(x² + π²)²`. -/
def ctTailKernel (x : ℝ) : ℝ :=
  2 * π ^ 2 * exp (-x) / (x ^ 2 + π ^ 2) ^ 2

/-- The kernel's normalization at zero is `2/π²`. -/
example : ctTailKernel 0 = 2 / Real.pi ^ 2 := by
  simp only [ctTailKernel, neg_zero, Real.exp_zero, zero_pow (by decide : 2 ≠ 0), zero_add, mul_one]
  field_simp [Real.pi_ne_zero]
  <;> ring

/-- The Odlyzko kernel is strictly positive at every real argument. -/
theorem ctTailKernel_pos (x : ℝ) : 0 < ctTailKernel x := by
  unfold ctTailKernel; positivity

/-- The kernel decreases from zero to one and is not even. -/
theorem ctTailKernel_strict_controls :
    ctTailKernel 1 < ctTailKernel 0 ∧ ctTailKernel 1 < ctTailKernel (-1) := by
  sorry

/-- **Geometric tail bound** (README 4.15). -/
theorem ctTailKernel_tail (α b : ℝ) (hα : 0 < α) (hb : 0 ≤ b) (N : ℕ) :
    Summable (fun n : ℕ => ctTailKernel (α * (b + n))) ∧
      ∑' n : ℕ, ctTailKernel (α * (b + (N + n))) ≤ ctTailKernel (α * (b + N)) / (1 - exp (-α)) := by
  sorry

/-- The alternating Odlyzko series differs from its first `N` terms by at most the
first omitted positive term, including `N=0` (README 4.16). -/
theorem ctTailKernel_alternating_tail (α b : ℝ)
    (hα : 0 < α) (hb : 0 ≤ b) (N : ℕ) :
    |(∑' n : ℕ, (-1 : ℝ) ^ n * ctTailKernel (α * (b + n))) -
      ∑ n ∈ Finset.range N, (-1 : ℝ) ^ n * ctTailKernel (α * (b + n))| ≤
        ctTailKernel (α * (b + N)) := by
  sorry

/-- A right-half-plane digamma truncation has an explicit vanishing tail (README 4.17a). -/
theorem digamma_series_remainder (z : ℂ) (hz : 0 < z.re) (N : ℕ) (hN : 1 ≤ N) :
    ‖Complex.digamma z - (-(Real.eulerMascheroniConstant : ℂ) +
      ∑ n ∈ Finset.range N, ((n + 1 : ℂ)⁻¹ - (n + z)⁻¹))‖ ≤
      ‖z - 1‖ / ((N : ℝ) - 1 + min 1 z.re) := by
  sorry

/-- The derivative of digamma has the corresponding reciprocal-square tail (README 4.17a). -/
theorem trigamma_series_remainder (z : ℂ) (hz : 0 < z.re) (N : ℕ) (hN : 1 ≤ N) :
    ‖deriv Complex.digamma z - ∑ n ∈ Finset.range N, (n + z)⁻¹ ^ 2‖ ≤
      1 / ((N : ℝ) - 1 + min 1 z.re) := by
  sorry

/-- The weighted alternating kernel tail starts after `n=N`, on its decreasing range. -/
theorem ctTailKernel_weighted_alternating_tail (α : ℝ) (hα : 0 < α) (N : ℕ)
    (hN : 1 ≤ α * (N + 1)) :
    |(∑' n : ℕ, (-1 : ℝ) ^ n * (n + 1) * ctTailKernel (α * (n + 1))) -
      ∑ n ∈ Finset.range N, (-1 : ℝ) ^ n * (n + 1) * ctTailKernel (α * (n + 1))| ≤
        (N + 1) * ctTailKernel (α * (N + 1)) := by
  sorry

end ExplicitFormula

/-- **Complete isolation of the roots of a rational polynomial** (README 4.19). -/
theorem exists_disjoint_root_certificates (f : ℚ[X]) (hf : f ≠ 0) :
    ∃ l : List AlgebraicRootCertificate, (∀ c ∈ l, c.poly = f) ∧ (l.map (·.value)).Nodup ∧
      l.Pairwise (fun c d => Disjoint (complexBoxSet c.re c.im) (complexBoxSet d.re d.im)) ∧
      ∀ z : ℂ, aeval z f = 0 ↔ z ∈ l.map (·.value) := by
  sorry

/-- Continued Dirichlet values away from a principal pole admit arbitrarily narrow
rational complex rectangles (README 4.20). -/
theorem exists_dirichletLBox {q : ℕ} [NeZero q] (χ : DirichletCharacter ℂ q)
    (hχ : χ.IsPrimitive) (z : ℂ) (hz : χ = 1 → z ≠ 1) (P : ℕ) :
    ∃ R I : NonemptyInterval ℚ, χ.LFunction z ∈ complexBoxSet R I ∧
      R.snd - R.fst ≤ 1 / (2 : ℚ) ^ P ∧ I.snd - I.fst ≤ 1 / (2 : ℚ) ^ P := by
  sorry

/-- Integral level-one cusp-form values have rational enclosures of every binary precision. -/
theorem exists_cuspLBox (k : ℤ) (hk : 0 < k)
    (f : CuspForm 𝒮ℒ k) (hf : f ∈ integralCuspLattice k) (z : ℂ) (P : ℕ) :
    ∃ R I : NonemptyInterval ℚ, ModularForm.L hk f z ∈ complexBoxSet R I ∧
      R.snd - R.fst ≤ 1 / (2 : ℚ) ^ P ∧ I.snd - I.fst ≤ 1 / (2 : ℚ) ^ P := by
  sorry

/-- A nonzero cusp-form value separates the two signs in enclosure arithmetic (README 4.21). -/
theorem delta_L_twelve_bounds :
    (1 / 2 : ℝ) < (ModularForm.L (by norm_num : (0 : ℤ) < 12) CuspForm.discriminant 12).re ∧
    (ModularForm.L (by norm_num : (0 : ℤ) < 12) CuspForm.discriminant 12).re < 3 / 2 ∧
    (ModularForm.L (by norm_num : (0 : ℤ) < 12) CuspForm.discriminant 12).im = 0 := by
  sorry

/-- Two continued conductor-one values have explicit rational complex enclosures. -/
theorem dirichlet_conductor_one_controls :
    (1 : DirichletCharacter ℂ 1).LFunction 2 ∈
      complexBoxSet ⟨((8 / 5 : ℚ), 5 / 3), by norm_num⟩ (NonemptyInterval.pure 0) ∧
    (1 : DirichletCharacter ℂ 1).LFunction 0 = -1 / 2 := by
  sorry

/-- Every native continued L-value of the zero cusp form is zero. -/
theorem cuspLBox_zero (k : ℤ) (hk : 0 < k) (z : ℂ) :
    ModularForm.L hk (0 : CuspForm 𝒮ℒ k) z = 0 := by
  sorry

/-- Negating the discriminant reflects its nonzero L-value into a negative rational rectangle. -/
theorem delta_neg_L_twelve_bounds :
    ModularForm.L (by norm_num : (0 : ℤ) < 12) (-CuspForm.discriminant) 12 ∈
      complexBoxSet ⟨((-3 / 2 : ℚ), -1 / 2), by norm_num⟩ (NonemptyInterval.pure 0) := by
  sorry

/-- **Platt's bounded-height theorem** (README 4.22): for primitive characters of modulus
`q ≤ 400000`, zeros in the strip up to height `H(q)` lie on the critical line; the parity in `H(q)`
is that of the modulus. -/
theorem platt_bounded_height {q : ℕ} [NeZero q] (hq : q ≤ 400000) (χ : DirichletCharacter ℂ q)
    (hχ : χ.IsPrimitive) (s : ℂ) (hs : 0 < s.re ∧ s.re < 1)
    (ht : |s.im| ≤ if Even q then max (10 ^ 8 / (q : ℝ)) (7.5 * 10 ^ 7 / (q : ℝ) + 200)
      else max (10 ^ 8 / (q : ℝ)) (3.75 * 10 ^ 7 / (q : ℝ) + 200))
    (h0 : χ.LFunction s = 0) : s.re = 1 / 2 := by
  sorry

/-- **Platt's central nonvanishing** (README 4.23). -/
theorem platt_central_nonvanishing {q : ℕ} [NeZero q] (hq : q ≤ 2000000)
    (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) : χ.LFunction (1 / 2) ≠ 0 := by
  sorry

/-- **No real zeros for conductor at most `400000`** (README 4.24). -/
theorem small_conductor_no_real_zero {q : ℕ} [NeZero q] (hq : q ≤ 400000)
    (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (s : ℝ) (hs : 0 < s ∧ s < 1) :
    χ.LFunction s ≠ 0 := by
  sorry

section Gram

variable {n : ℕ}

/-- **Entrywise lower bounds on effective vectors** (README 4.25). -/
theorem effectiveGram_lower (A B : Matrix (Fin n) (Fin n) ℝ) (hAB : ∀ i j, B i j ≤ A i j)
    (x : Fin n → ℝ) (hx : ∀ i, 0 ≤ x i) :
    ∑ i, ∑ j, B i j * x i * x j ≤ ∑ i, ∑ j, A i j * x i * x j := by
  sorry

/-- Integer points of the rational quadratic sublevel set; finiteness requires positive
 definiteness of the matrix (README 4.26). -/
def ellipsoidPoints (G : Matrix (Fin n) (Fin n) ℚ) (t : Fin n → ℚ) (R : ℚ) :
    Set (Fin n → ℤ) :=
  {x | ∑ i, ∑ j, G i j * ((x i : ℚ) - t i) * ((x j : ℚ) - t j) ≤ R}

/-- Coordinatewise bounds admit `(1,1)`, but the unit disk excludes it. -/
example : (![0, 0] : Fin 2 → ℤ) ∈ ellipsoidPoints 1 0 1 ∧
    (![1, 0] : Fin 2 → ℤ) ∈ ellipsoidPoints 1 0 1 ∧
    (![1, 1] : Fin 2 → ℤ) ∉ ellipsoidPoints 1 0 1 := by
  norm_num [ellipsoidPoints, Fin.sum_univ_two, Matrix.one_apply]

/-- The hexagonal form and a half-integer centre distinguish true quadratic regions from boxes. -/
example :
    (![1, -1] : Fin 2 → ℤ) ∈ ellipsoidPoints (!![2, 1; 1, 2]) 0 2 ∧
    (![1, 1] : Fin 2 → ℤ) ∉ ellipsoidPoints (!![2, 1; 1, 2]) 0 2 ∧
    (![0] : Fin 1 → ℤ) ∈ ellipsoidPoints 1 (fun _ => 1 / 2) (1 / 4) ∧
    (![1] : Fin 1 → ℤ) ∈ ellipsoidPoints 1 (fun _ => 1 / 2) (1 / 4) ∧
    (![-1] : Fin 1 → ℤ) ∉ ellipsoidPoints 1 (fun _ => 1 / 2) (1 / 4) := by
  norm_num [ellipsoidPoints, Fin.sum_univ_two, Fin.sum_univ_succ, Matrix.one_apply]

/-- Positive-definite rational quadratic sublevels have finitely many integer points,
with membership exactly the quadratic inequality (README 4.27). -/
theorem ellipsoidPoints_complete (G : Matrix (Fin n) (Fin n) ℚ) (hG : G.PosDef)
    (t : Fin n → ℚ) (R : ℚ) :
    (ellipsoidPoints G t R).Finite ∧ ∀ x : Fin n → ℤ,
      x ∈ ellipsoidPoints G t R ↔
        ∑ i, ∑ j, G i j * ((x i : ℚ) - t i) * ((x j : ℚ) - t j) ≤ R := by
  sorry

/-- The two displayed positive-definite binary ellipsoids have five and seven integer points. -/
theorem ellipsoidPoints_binary_counts :
    (ellipsoidPoints (1 : Matrix (Fin 2) (Fin 2) ℚ) 0 1).ncard = 5 ∧
    (ellipsoidPoints (!![2, 1; 1, 2] : Matrix (Fin 2) (Fin 2) ℚ) 0 2).ncard = 7 := by
  sorry

/-- A nonpositive-definite zero form admits infinitely many integer vectors at bound zero. -/
theorem ellipsoidPoints_zero_form_infinite :
    (ellipsoidPoints (0 : Matrix (Fin 1) (Fin 1) ℚ) 0 0).Infinite := by
  sorry

/-- In dimension zero, the empty vector has value zero independently of matrix and centre. -/
theorem ellipsoidPoints_zero_dim (G : Matrix (Fin 0) (Fin 0) ℚ) (t : Fin 0 → ℚ)
    (R : ℚ) (x : Fin 0 → ℤ) : x ∈ ellipsoidPoints G t R ↔ 0 ≤ R := by
  simp [ellipsoidPoints]

/-- The translated one-dimensional quadratic region consists exactly of zero and one. -/
theorem ellipsoidPoints_shifted_one :
    ellipsoidPoints (1 : Matrix (Fin 1) (Fin 1) ℚ) (fun _ => 1 / 2) (1 / 4) =
      {(![0] : Fin 1 → ℤ), (![1] : Fin 1 → ℤ)} := by
  sorry

open Matrix in
/-- **Loewner lower bounds** (README 4.28). -/
theorem loewnerGram_lower (A B : Matrix (Fin n) (Fin n) ℝ) (h : (A - B).PosSemidef)
    (x : Fin n → ℝ) : x ⬝ᵥ (B *ᵥ x) ≤ x ⬝ᵥ (A *ᵥ x) := by
  sorry

/-- **Rational witness of Gram negativity** (README 4.29): a nonzero nonnegative rational vector
whose quadratic form with the upper endpoints is negative. -/
structure NegativeGramCertificate (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) where
  vector : Fin n → ℚ
  nonneg : ∀ i, 0 ≤ vector i
  ne_zero : vector ≠ 0
  upper_neg : ∑ i, ∑ j, (I i j).snd * vector i * vector j < 0

/-- In dimension zero no nonzero negative Gram witness exists. -/
example (I : Matrix (Fin 0) (Fin 0) (NonemptyInterval ℚ)) :
    ¬ Nonempty (NegativeGramCertificate I) := by
  rintro ⟨c⟩
  apply c.ne_zero
  funext i
  exact Fin.elim0 i

/-- The negative interval admits a witness, whereas a straddling interval admits none. -/
example : Nonempty (NegativeGramCertificate (n := 1) (fun _ _ => ⟨(-2, -1), by norm_num⟩)) ∧
    ¬ Nonempty (NegativeGramCertificate (n := 1) (fun _ _ => ⟨(-1, 1), by norm_num⟩)) := by
  constructor
  · refine ⟨⟨fun _ => 1, ?_, ?_, ?_⟩⟩
    · intro i; norm_num
    · intro h
      have h0 := congrFun h 0
      norm_num at h0
    · norm_num [Fin.sum_univ_succ]
  · rintro ⟨c⟩
    have h := c.upper_neg
    norm_num [Fin.sum_univ_succ] at h
    nlinarith [sq_nonneg (c.vector 0)]

/-- **Soundness** (README 4.30): every real matrix inside the intervals is negative on the
witness. -/
theorem NegativeGramCertificate.sound (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ))
    (c : NegativeGramCertificate I) (A : Matrix (Fin n) (Fin n) ℝ)
    (hA : ∀ i j, ((I i j).fst : ℝ) ≤ A i j ∧ A i j ≤ (I i j).snd) :
    ∑ i, ∑ j, A i j * c.vector i * c.vector j < 0 := by
  sorry

/-- Validity of a rational nonnegative Gram witness uses the upper interval endpoints. -/
def GramWitnessValid (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ))
    (t : Fin n → ℚ) : Prop :=
  (∀ i, 0 ≤ t i) ∧ t ≠ 0 ∧ ∑ i, ∑ j, (I i j).snd * t i * t j < 0

/-- A negative interval admits the unit vector; a straddling interval and the zero vector fail. -/
example : GramWitnessValid (n := 1) (fun _ _ => ⟨(-2, -1), by norm_num⟩) (fun _ => 1) ∧
    ¬ GramWitnessValid (n := 1) (fun _ _ => ⟨(-1, 1), by norm_num⟩) (fun _ => 1) ∧
    ¬ GramWitnessValid (n := 1) (fun _ _ => ⟨(-2, -1), by norm_num⟩) (fun _ => 0) := by
  norm_num [GramWitnessValid, Fin.sum_univ_succ, funext_iff]

/-- A valid raw Gram witness gives the proof-bearing record with exactly that vector. -/
theorem GramWitnessValid_certificate (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ))
    (t : Fin n → ℚ) (h : GramWitnessValid I t) :
    ∃ c : NegativeGramCertificate I, c.vector = t := by
  exact ⟨⟨t, h.1, h.2.1, h.2.2⟩, rfl⟩

end Gram

/-- A finite Gram family is valid when every row is a valid rational witness. -/
def GramDatasetValid
    (rows : List (Σ n : ℕ, Matrix (Fin n) (Fin n) (NonemptyInterval ℚ) × (Fin n → ℚ))) : Prop :=
  ∀ r ∈ rows, GramWitnessValid r.2.1 r.2.2

/-- Empty families are valid without establishing completeness. -/
example : GramDatasetValid [] := by simp [GramDatasetValid]

/-- One negative row is valid; adjoining a zero-vector row makes the family invalid. -/
example : GramDatasetValid [⟨1, (fun _ _ => ⟨(-2, -1), by norm_num⟩), (fun _ => 1)⟩] ∧
    ¬ GramDatasetValid
      [⟨1, (fun _ _ => ⟨(-2, -1), by norm_num⟩), (fun _ => 1)⟩,
       ⟨1, (fun _ _ => ⟨(-2, -1), by norm_num⟩), (fun _ => 0)⟩] := by
  norm_num [GramDatasetValid, GramWitnessValid, Fin.sum_univ_succ, funext_iff]

/-- **The multiplicity lift** (README 4.34): `x_(i,r) = t_i/m_i` turns the block matrix
`A·δ − K_(ij)` into `β = (A/m_i)δ_ij − K_ij`. -/
theorem multiplicityGram_lift {n : ℕ} (m : Fin n → ℕ) (hm : ∀ i, 0 < m i) (A : ℝ)
    (Kmat : Matrix (Fin n) (Fin n) ℝ) (t : Fin n → ℝ) :
    ∑ a : (Σ i, Fin (m i)), ∑ b : (Σ i, Fin (m i)),
        ((if a = b then A else 0) - Kmat a.1 b.1) * (t a.1 / m a.1) * (t b.1 / m b.1) =
      ∑ i, ∑ j, ((if i = j then A / m i else 0) - Kmat i j) * t i * t j := by
  sorry

/-- The actual five-coordinate lift for blocks two and three has quadratic value minus 34. -/
example :
    ∑ a : (Σ i : Fin 2, Fin ((![(2 : ℕ), 3] : Fin 2 → ℕ) i)),
      ∑ b : (Σ i : Fin 2, Fin ((![(2 : ℕ), 3] : Fin 2 → ℕ) i)),
        ((if a = b then (6 : ℝ) else 0) -
          (!![1, 2; 2, 4] : Matrix (Fin 2) (Fin 2) ℝ) a.1 b.1) *
        ((![(2 : ℝ), 3] : Fin 2 → ℝ) a.1 / (![(2 : ℕ), 3] : Fin 2 → ℕ) a.1) *
        ((![(2 : ℝ), 3] : Fin 2 → ℝ) b.1 / (![(2 : ℕ), 3] : Fin 2 → ℕ) b.1) = -34 := by
  have h := multiplicityGram_lift (![(2 : ℕ), 3]) (by decide)
    6 (!![1, 2; 2, 4]) (![(2 : ℝ), 3])
  convert h using 1 <;> norm_num [Fin.sum_univ_two]

end TauCetiRoadmap.ComputationalNumberTheory
