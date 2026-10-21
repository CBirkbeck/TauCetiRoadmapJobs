import Mathlib

/-!+# CohomologyComparisonsPartII: representative target signatures

The roadmap is README.md. This file records statements suggested against the pinned APIs
and is not exhaustive. The coordinate lattices use a chosen ordinary Tate generator.
The semistable differentials are the actual degree-zero realization of the total fibre;
restriction to rational scalars includes semilinear arithmetic Frobenius.
Layers 2, 3, 6 and 7 remain in README.md: their geometric realization, site and
coefficient-category carriers are not present at the pins.
-/

/-! ## Layer 1: Filtered Frobenius connections and extension evaluation -/

namespace TauCetiRoadmap.CohomologyComparisonsPartII.FilFMIC

/-- One degree of the explicit fibre differential in the coordinate convention
`d(a,b) = (da, f(a) - db)`. This is a coordinate map, with the complex supplied by
the mapping-cone construction. AM Definition 2.4, AM line 255–258. -/
def fiberCoordinatesDifferential {A A' B B' : Type*}
    [AddCommGroup A] [Module ℚ A] [AddCommGroup A'] [Module ℚ A']
    [AddCommGroup B] [Module ℚ B] [AddCommGroup B'] [Module ℚ B']
    (dA : A →ₗ[ℚ] A') (dB : B →ₗ[ℚ] B') (f : A →ₗ[ℚ] B')
    (x : A × B) : A' × B' :=
  (dA x.1, f x.1 - dB x.2)

/-- Multiplication by two enters with positive sign, while the shifted target
differential enters with negative sign. -/
example :
    fiberCoordinatesDifferential (0 : ℚ →ₗ[ℚ] ℚ) LinearMap.id
      ((2 : ℚ) • LinearMap.id) (1, 0) = (0, 2) ∧
    fiberCoordinatesDifferential (0 : ℚ →ₗ[ℚ] ℚ) LinearMap.id
      ((2 : ℚ) • LinearMap.id) (0, 1) = (0, -1) := by
  norm_num [fiberCoordinatesDifferential]

/-- Zero coordinates give zero under the actual fibre-coordinate map. -/
example {A A' B B' : Type*}
    [AddCommGroup A] [Module ℚ A] [AddCommGroup A'] [Module ℚ A']
    [AddCommGroup B] [Module ℚ B] [AddCommGroup B'] [Module ℚ B']
    (dA : A →ₗ[ℚ] A') (dB : B →ₗ[ℚ] B') (f : A →ₗ[ℚ] B') :
    fiberCoordinatesDifferential dA dB f (0, 0) = (0, 0) := by
  simp [fiberCoordinatesDifferential]

end TauCetiRoadmap.CohomologyComparisonsPartII.FilFMIC

/-! ## Layer 4: Classical period maps and their precise ranges -/

namespace TauCetiRoadmap.CohomologyComparisonsPartII.Syntomic

/-- The EN lattice in a Tate coordinate: the span of the inverse of `p^a * a!`,
where `a = r / (p - 1)`. EN Section 2.2, EN line 306. -/
def enLattice (p r : ℕ) [Fact p.Prime] : Submodule (PadicInt p) (Padic p) :=
  Submodule.span (PadicInt p)
    {((p : Padic p) ^ (r / (p - 1)) *
      (Nat.factorial (r / (p - 1)) : Padic p))⁻¹}

/-- The CN lattice in a Tate coordinate for the specified decomposition exponent `a`.
The inclusive endpoint convention is retained in the choice of exponent.
CN Section 2.4.3, CN line 968–979. -/
def cnLattice (p a : ℕ) [Fact p.Prime] : Submodule (PadicInt p) (Padic p) :=
  Submodule.span (PadicInt p) {((p : Padic p) ^ a)⁻¹}

/-- The floor-normalized CN lattice is contained in the EN lattice, for every prime
and nonnegative weight, on the actual p-adic scalar carriers. -/
theorem cnLattice_le_enLattice (p r : ℕ) [Fact p.Prime] :
    cnLattice p (r / (p - 1)) ≤ enLattice p r := by
  sorry

/-- The CN generator has factorial coordinate in the EN generator, with no inverse
asserted for the resulting finite-level coefficient inclusion. -/
theorem modifiedLattice_generator (p r : ℕ) [Fact p.Prime] :
    ((p : Padic p) ^ (r / (p - 1)))⁻¹ =
      (Nat.factorial (r / (p - 1)) : Padic p) *
        ((p : Padic p) ^ (r / (p - 1)) *
          (Nat.factorial (r / (p - 1)) : Padic p))⁻¹ := by
  sorry

/-- At weight zero both coordinate lattices are the ordinary integer lattice. -/
example (p : ℕ) [Fact p.Prime] :
    enLattice p 0 = Submodule.span (PadicInt p) {(1 : Padic p)} ∧
      cnLattice p 0 = Submodule.span (PadicInt p) {(1 : Padic p)} := by
  constructor <;> simp [enLattice, cnLattice]

/-- At `p = 2`, weight two detects the factorial; exponents one and zero detect
the two CN decompositions of weight one. -/
example :
    enLattice 2 2 = Submodule.span (PadicInt 2) {(8 : Padic 2)⁻¹} ∧
      cnLattice 2 2 = Submodule.span (PadicInt 2) {(4 : Padic 2)⁻¹} ∧
      cnLattice 2 1 = Submodule.span (PadicInt 2) {(2 : Padic 2)⁻¹} ∧
      cnLattice 2 0 = Submodule.span (PadicInt 2) {(1 : Padic 2)} ∧
      (4 : Padic 2)⁻¹ = 2 * (8 : Padic 2)⁻¹ ∧
      (2 : ZMod 2) = 0 := by
  norm_num [enLattice, cnLattice]

end TauCetiRoadmap.CohomologyComparisonsPartII.Syntomic

/-! ## Layer 5: Semistable and rational descent adapters -/

namespace TauCetiRoadmap.CohomologyComparisonsPartII.ClassicalSyntomic

/-- The first differential of the degree-zero semistable total fibre:
`x` maps to `((1 - phi / p^r)x, iota x, N x)`.
NN Section 3.2, NN line 1366–1384. -/
def semistableD0 (p r : ℕ) {D E : Type*}
    [AddCommGroup D] [Module ℚ D] [AddCommGroup E] [Module ℚ E]
    (phi N : D →ₗ[ℚ] D) (iota : D →ₗ[ℚ] E) (x : D) : D × E × D :=
  (x - (p : ℚ) ^ (-(r : ℤ)) • phi x, iota x, N x)

/-- The second differential of that total fibre. Its exponent is the integer
`1 - r`, so at weight zero the lower operator is `1 - p * phi`.
NN Section 3.2, NN line 1374–1384. -/
def semistableD1 (p r : ℕ) {D E : Type*}
    [AddCommGroup D] [Module ℚ D] [AddCommGroup E] [Module ℚ E]
    (phi N : D →ₗ[ℚ] D) (y : D × E × D) : D :=
  N y.1 - (y.2.2 - (p : ℚ) ^ (1 - (r : ℤ)) • phi y.2.2)

/-- Frobenius–monodromy compatibility makes the displayed semistable
differential square zero. All hypotheses are explicitly bound. -/
theorem semistable_d_squared (p r : ℕ) [Fact p.Prime]
    {D E : Type*} [AddCommGroup D] [Module ℚ D]
    [AddCommGroup E] [Module ℚ E]
    (phi N : D →ₗ[ℚ] D) (iota : D →ₗ[ℚ] E)
    (h : N.comp phi = (p : ℚ) • phi.comp N) (x : D) :
    semistableD1 p r phi N (semistableD0 p r phi N iota x) = 0 := by
  sorry

/-- Transporting classical monodromy to the negative p-normalized convention
scales the third and final terms by `-1/e`. These are its two chain-map equations. -/
theorem semistable_baseConvention_differentials (p r e : ℕ) (he : e ≠ 0)
    {D E : Type*} [AddCommGroup D] [Module ℚ D]
    [AddCommGroup E] [Module ℚ E]
    (phi N : D →ₗ[ℚ] D) (iota : D →ₗ[ℚ] E) (x : D) (a c : D) (b : E) :
    semistableD0 p r phi ((-(e : ℚ)⁻¹) • N) iota x =
      (x - (p : ℚ) ^ (-(r : ℤ)) • phi x, iota x, (-(e : ℚ)⁻¹) • N x) ∧
    semistableD1 p r phi ((-(e : ℚ)⁻¹) • N) (a, b, (-(e : ℚ)⁻¹) • c) =
      (-(e : ℚ)⁻¹) • semistableD1 p r phi N (a, b, c) := by
  sorry

/-- The zero vector has zero image under both actual differentials. -/
example (p r : ℕ) {D E : Type*}
    [AddCommGroup D] [Module ℚ D] [AddCommGroup E] [Module ℚ E]
    (phi N : D →ₗ[ℚ] D) (iota : D →ₗ[ℚ] E) :
    semistableD0 p r phi N iota 0 = (0, 0, 0) ∧
      semistableD1 p r phi N (0, (0 : E), 0) = 0 := by
  constructor <;> simp [semistableD0, semistableD1]

/-- On the rank-two block, weights zero and one fix the lower exponent.
The third conjunction fixes the sign and factor of the ramification-two adapter. -/
example :
    let phi : (ℚ × ℚ) →ₗ[ℚ] (ℚ × ℚ) :=
      (LinearMap.fst ℚ ℚ ℚ).prod (2 • LinearMap.snd ℚ ℚ ℚ)
    let N : (ℚ × ℚ) →ₗ[ℚ] (ℚ × ℚ) :=
      (LinearMap.snd ℚ ℚ ℚ).prod 0
    semistableD0 2 0 phi N LinearMap.id (0, 1) = ((0, -1), (0, 1), (1, 0)) ∧
    semistableD0 2 1 phi N LinearMap.id (0, 1) = ((0, 0), (0, 1), (1, 0)) ∧
    semistableD1 2 0 phi N ((0, -1), (0, 1), (1, 0)) = (0, 0) ∧
    semistableD1 2 1 phi N ((0, 0), (0, 1), (1, 0)) = (0, 0) ∧
    semistableD0 2 0 phi ((-(2 : ℚ)⁻¹) • N) LinearMap.id (0, 1) =
      ((0, -1), (0, 1), (-(1 / 2), 0)) ∧
    semistableD1 2 0 phi ((-(2 : ℚ)⁻¹) • N)
      ((0, -1), (0, 1), (-(1 / 2), 0)) = (0, 0) := by
  norm_num [semistableD0, semistableD1]

end TauCetiRoadmap.CohomologyComparisonsPartII.ClassicalSyntomic
