import Mathlib

/-!
# SelmerIwasawaCohomologyPartII: representative target signatures

The roadmap is README.md. This file records statements suggested against the pinned APIs
and is not exhaustive. The finite diagonal period is evaluated on the native definite
Shimura sets supplied in the roadmap; it retains the source of a correspondence and its
fibre multiplicities. Geometric and arithmetic headline statements use the native carriers
specified in README.md.
-/

namespace TauCetiRoadmap.SelmerIwasawaCohomologyPartII

open scoped BigOperators

universe u v w z t

/-! ## Layer 5: First geometric and explicit reciprocity laws -/

/-- The definite diagonal period sums a test function over the source of its two legs,
counting each source point. See README §5.1 and LTXZZ Theorem 7.2.8(3). -/
def definiteDiagonalPeriod {S : Type u} [Fintype S] {X : Type v} {Y : Type w}
    {R : Type z} [AddCommMonoid R] (a : S → X) (b : S → Y) (f : X × Y → R) : R :=
  ∑ s : S, f (a s, b s)

/-- The diagonal period is additive in its test function, including with torsion coefficients. -/
theorem definiteDiagonalPeriod_add {S : Type u} [Fintype S] {X : Type v} {Y : Type w}
    {R : Type z} [AddCommMonoid R] (a : S → X) (b : S → Y) (f g : X × Y → R) :
    definiteDiagonalPeriod a b (f + g) =
      definiteDiagonalPeriod a b f + definiteDiagonalPeriod a b g := by
  sorry

/-- Scalar multiplication commutes with the period; no division by the source cardinality
is used. The coefficient semiring can have positive characteristic. -/
theorem definiteDiagonalPeriod_smul {S : Type u} [Fintype S] {X : Type v} {Y : Type w}
    {R : Type z} [Semiring R] (a : S → X) (b : S → Y) (c : R) (f : X × Y → R) :
    definiteDiagonalPeriod a b (c • f) = c • definiteDiagonalPeriod a b f := by
  sorry

/-- An additive coefficient map carries the period to the period after coefficient change.
Ring reduction and scalar extension are particular cases. -/
theorem definiteDiagonalPeriod_map {S : Type u} [Fintype S] {X : Type v} {Y : Type w}
    {R : Type z} [AddCommMonoid R] {T : Type t} [AddCommMonoid T]
    (a : S → X) (b : S → Y) (h : R →+ T) (f : X × Y → R) :
    h (definiteDiagonalPeriod a b f) = definiteDiagonalPeriod a b (h ∘ f) := by
  sorry

/-- Relabelling the source by an equivalence preserves both the period and its multiplicities. -/
theorem definiteDiagonalPeriod_reindex {S : Type u} [Fintype S]
    {S' : Type t} [Fintype S'] {X : Type v} {Y : Type w}
    {R : Type z} [AddCommMonoid R] (e : S' ≃ S) (a : S → X) (b : S → Y)
    (f : X × Y → R) :
    definiteDiagonalPeriod (a ∘ e) (b ∘ e) f = definiteDiagonalPeriod a b f := by
  sorry

/-- Summing over graph pairs weights each value by the cardinality of its full source fibre.
This is the definite-function multiplicity identity of README §§5.1 and 6.1. -/
theorem definiteDiagonalPeriod_fiber {S : Type u} [Fintype S]
    {X : Type v} [Fintype X] {Y : Type w} [Fintype Y]
    {R : Type z} [AddCommMonoid R] (a : S → X) (b : S → Y) (f : X × Y → R) :
    definiteDiagonalPeriod a b f =
      ∑ q : X × Y, Nat.card {s : S // (a s, b s) = q} • f q := by
  sorry

/-- A nonzero definite period has a nonzero value on at least one source point.
The converse can fail by cancellation, as the signed two-point example shows. -/
theorem definiteDiagonalPeriod_exists_ne_zero {S : Type u} [Fintype S]
    {X : Type v} {Y : Type w} {R : Type z} [AddCommMonoid R]
    (a : S → X) (b : S → Y) (f : X × Y → R)
    (h : definiteDiagonalPeriod a b f ≠ 0) :
    ∃ s : S, f (a s, b s) ≠ 0 := by
  sorry

/-- Singleton, double-fibre and empty-source controls distinguish counting from averaging
and ensure that an empty correspondence contributes zero. -/
example :
    definiteDiagonalPeriod (fun _ : PUnit => PUnit.unit)
        (fun _ : PUnit => PUnit.unit) (fun _ => (1 : ℤ)) = 1 ∧
    definiteDiagonalPeriod (fun _ : Bool => PUnit.unit)
        (fun _ : Bool => PUnit.unit) (fun _ => (1 : ℤ)) = 2 ∧
    definiteDiagonalPeriod (fun _ : Fin 0 => PUnit.unit)
        (fun _ : Fin 0 => PUnit.unit) (fun _ => (1 : ℤ)) = 0 := by
  norm_num [definiteDiagonalPeriod, Fintype.sum_bool]

/-- Two nonzero signed graph values can cancel; two coincident points also have zero
period in characteristic two. Neither fact permits replacing counting by averaging. -/
example :
    definiteDiagonalPeriod (fun s : Bool => s) (fun _ : Bool => PUnit.unit)
        (fun q : Bool × PUnit => if q.1 then (1 : ℤ) else -1) = 0 ∧
    definiteDiagonalPeriod (fun _ : Bool => PUnit.unit)
        (fun _ : Bool => PUnit.unit) (fun _ => (1 : ZMod 2)) = 0 := by
  norm_num [definiteDiagonalPeriod, Fintype.sum_bool]

end TauCetiRoadmap.SelmerIwasawaCohomologyPartII
