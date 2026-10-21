import Mathlib
import TauCeti.Combinatorics.Enumerative.Partition.Conjugate

/-!
# QSeriesPartitionsAndMockModularForms: representative target signatures

The roadmap is README.md. This file records statements suggested against the pinned APIs
and is not exhaustive.
-/

namespace TauCetiRoadmap.QSeriesPartitionsAndMockModularForms

open scoped BigOperators

noncomputable section

/-! ## Layer 1: finite, integer-indexed and formal q-products -/

/-- The finite q-Pochhammer product retains the factor with index zero. -/
def qPochhammerFin {K : Type*} [CommRing K] (a q : K) (n : ℕ) : K :=
  ∏ j ∈ Finset.range n, (1 - a * q ^ j)

/-- The empty finite product is one, including in the zero ring. -/
theorem qPochhammerFin_zero {K : Type*} [CommRing K] (a q : K) :
    qPochhammerFin a q 0 = 1 := by
  sorry

/-- Adjoining the last index gives the finite product recurrence. -/
theorem qPochhammerFin_succ {K : Type*} [CommRing K] (a q : K) (n : ℕ) :
    qPochhammerFin a q (n + 1) = qPochhammerFin a q n * (1 - a * q ^ n) := by
  sorry

/-- Ring homomorphisms preserve finite q-products. -/
theorem qPochhammerFin_map {K L : Type*} [CommRing K] [CommRing L]
    (f : K →+* L) (a q : K) (n : ℕ) :
    f (qPochhammerFin a q n) = qPochhammerFin (f a) (f q) n := by
  sorry

/-- Concatenation shifts the initial parameter by the length of the first block. -/
theorem qPochhammer_concat {K : Type*} [CommRing K] (a q : K) (n m : ℕ) :
    qPochhammerFin a q (n + m) =
      qPochhammerFin a q n * qPochhammerFin (a * q ^ n) q m := by
  sorry

/-- Inverting a unit parameter and unit base gives the triangular q-power. -/
theorem qPochhammer_invert_base {K : Type*} [CommRing K] (a q : Kˣ) (n : ℕ) :
    qPochhammerFin (a : K) (q : K) n =
      (-(a : K)) ^ n * (q : K) ^ (n * (n - 1) / 2) *
        qPochhammerFin ((a⁻¹ : Kˣ) : K) ((q⁻¹ : Kˣ) : K) n := by
  sorry

/-- At base zero only the initial factor survives in a nonempty product. -/
theorem zeroBase {K : Type*} [CommRing K] (a : K) (n : ℕ) :
    qPochhammerFin a 0 0 = 1 ∧ qPochhammerFin a 0 (n + 1) = 1 - a := by
  sorry

/-- In a subsingleton coefficient ring the empty product is also zero. -/
theorem zeroRing {K : Type*} [CommRing K] [Subsingleton K] (a q : K) :
    qPochhammerFin a q 0 = 0 := by
  sorry

/-- The index-zero factor is visible in the length-two expansion. -/
example {K : Type*} [CommRing K] (a q : K) :
    qPochhammerFin a q 2 = 1 - a - a * q + a ^ 2 * q := by
  simp [qPochhammerFin, Finset.prod_range_succ]
  ring

/-- Base one remains legitimate for a finite product. -/
example : qPochhammerFin (2 : ℤ) 1 2 = 1 := by
  norm_num [qPochhammerFin, Finset.prod_range_succ]

/-- Coefficient d of the positive formal tail uses the first d+1 positive factors. -/
def formalQPochhammerTail {K : Type*} [CommRing K] (a : K) : PowerSeries K :=
  PowerSeries.mk fun d => PowerSeries.coeff d
    (∏ j ∈ Finset.range (d + 1),
      (1 - PowerSeries.C a * (PowerSeries.X : PowerSeries K) ^ (j + 1)))

/-- The full formal product includes its constant factor 1-a. -/
def formalQPochhammer {K : Type*} [CommRing K] (a : K) : PowerSeries K :=
  PowerSeries.C (1 - a) * formalQPochhammerTail a

/-- Every positive formal tail has constant coefficient one and is a unit. -/
theorem formalQPochhammer_tail_unit {K : Type*} [CommRing K] (a : K) :
    PowerSeries.constantCoeff (formalQPochhammerTail a) = 1 ∧
      IsUnit (formalQPochhammerTail a) := by
  sorry

/-- The coefficients through degree two retain the index-zero factor. -/
theorem formalFirstCoefficients {K : Type*} [CommRing K] (a : K) :
    PowerSeries.coeff 0 (formalQPochhammer a) = 1 - a ∧
    PowerSeries.coeff 1 (formalQPochhammer a) = -a * (1 - a) ∧
    PowerSeries.coeff 2 (formalQPochhammer a) = -a * (1 - a) := by
  sorry

/-- Reduction modulo two changes the signs but preserves the positive-tail coefficients. -/
theorem formalModTwo :
    PowerSeries.coeff 0 (formalQPochhammerTail (1 : ZMod 2)) = 1 ∧
    PowerSeries.coeff 1 (formalQPochhammerTail (1 : ZMod 2)) = 1 ∧
    PowerSeries.coeff 2 (formalQPochhammerTail (1 : ZMod 2)) = 1 := by
  sorry

/-- With parameter zero every factor of the positive tail is one. -/
example {K : Type*} [CommRing K] : formalQPochhammerTail (0 : K) = 1 := by
  ext d
  simp [formalQPochhammerTail]

/-- The full product at parameter one vanishes, rather than becoming a unit. -/
example {K : Type*} [CommRing K] : formalQPochhammer (1 : K) = 0 := by
  simp [formalQPochhammer]

/-- The stabilized formal positive tail is the limit of the positive finite products. -/
theorem formalQPochhammerTail_coeff_stable {K : Type*} [CommRing K]
    (a : K) (d N : ℕ) (h : d ≤ N) :
    PowerSeries.coeff d (∏ j ∈ Finset.range N,
      (1 - PowerSeries.C a * (PowerSeries.X : PowerSeries K) ^ (j + 1))) =
      PowerSeries.coeff d (formalQPochhammerTail a) := by
  sorry

/-- On the open unit disc finite products tend to the analytic product. -/
theorem qPochhammerFin_tendsto_pointwise (a q : ℂ) (hq : ‖q‖ < 1) :
    Filter.Tendsto (fun n => qPochhammerFin a q n) Filter.atTop
      (nhds (∏' j : ℕ, (1 - a * q ^ j))) := by
  sorry

/-- The finite-prefix adapter converges locally uniformly in both parameters on the disc. -/
theorem qPochhammerFin_tendsto :
    TendstoLocallyUniformlyOn
      (fun n : ℕ => fun p : ℂ × ℂ => qPochhammerFin p.1 p.2 n)
      (fun p : ℂ × ℂ => ∏' j : ℕ, (1 - p.1 * p.2 ^ j))
      Filter.atTop {p : ℂ × ℂ | ‖p.2‖ < 1} := by
  sorry

/-! ## Layer 2: basic hypergeometric series on their actual domains -/

/-- A Bailey pair includes the unit domain; normalization at index zero is separate. -/
noncomputable def baileyPair {K : Type*} [CommRing K]
    (a q : K) (α β : ℕ → K) : Prop :=
  (∀ n, IsUnit (qPochhammerFin q q n) ∧ IsUnit (qPochhammerFin (a * q) q n)) ∧
  ∀ n, β n = ∑ r ∈ Finset.range (n + 1),
    α r * Ring.inverse (qPochhammerFin q q (n - r) * qPochhammerFin (a * q) q (n + r))

/-- The zero pair is admitted on the same unit domain as every other pair. -/
example {K : Type*} [CommRing K] (a q : K)
    (h : ∀ n, IsUnit (qPochhammerFin q q n) ∧
      IsUnit (qPochhammerFin (a * q) q n)) :
    baileyPair a q (fun _ => 0) (fun _ => 0) := by
  constructor
  · exact h
  · intro n
    simp

/-- At a=q=0 the normalized delta sequence transforms to the constant sequence one. -/
example {K : Type*} [CommRing K] :
    baileyPair (0 : K) 0 (fun n => if n = 0 then 1 else 0) (fun _ => 1) := by
  constructor
  · intro n
    simp [qPochhammerFin]
  · intro n
    simp [qPochhammerFin, Ring.inverse_one]

/-- The first Bailey relation distinguishes the denominator index n+r from n-r. -/
theorem baileyFirstRelation {K : Type*} [CommRing K]
    (a q : K) (α β : ℕ → K) (h : baileyPair a q α β) :
    β 1 = α 0 * Ring.inverse ((1 - q) * (1 - a * q)) +
      α 1 * Ring.inverse ((1 - a * q) * (1 - a * q ^ 2)) := by
  sorry

/-- The q-binomial theorem on the open bidisc, in the normalization of Gasper (1.2.8). -/
theorem qBinomial (a q z : ℂ) (hq : ‖q‖ < 1) (hz : ‖z‖ < 1) :
    HasSum (fun n : ℕ => qPochhammerFin a q n * z ^ n / qPochhammerFin q q n)
      ((∏' j : ℕ, (1 - a * z * q ^ j)) / (∏' j : ℕ, (1 - z * q ^ j))) ∧
    Summable (fun n : ℕ => ‖qPochhammerFin a q n * z ^ n / qPochhammerFin q q n‖) := by
  sorry

/-- Base inversion gives the large-base binomial theorem on its actual radius domain. -/
theorem qBinomial_largeBase (a q z : ℂ) (hq : 1 < ‖q‖) (hz : ‖a * z / q‖ < 1) :
    HasSum (fun n : ℕ => qPochhammerFin a q n * z ^ n / qPochhammerFin q q n)
      ((∏' j : ℕ, (1 - z / q * (q⁻¹) ^ j)) /
        (∏' j : ℕ, (1 - a * z / q * (q⁻¹) ^ j))) ∧
    Summable (fun n : ℕ => ‖qPochhammerFin a q n * z ^ n / qPochhammerFin q q n‖) := by
  sorry

/-- Euler's inverse series is a disc identity; the quadratically weighted series is entire in z. -/
theorem euler_qExponential (q z : ℂ) (hq : ‖q‖ < 1) :
    (‖z‖ < 1 →
      HasSum (fun n : ℕ => z ^ n / qPochhammerFin q q n)
        ((∏' j : ℕ, (1 - z * q ^ j))⁻¹) ∧
      Summable (fun n : ℕ => ‖z ^ n / qPochhammerFin q q n‖)) ∧
    HasSum (fun n : ℕ => q ^ (n * (n - 1) / 2) * z ^ n / qPochhammerFin q q n)
      (∏' j : ℕ, (1 + z * q ^ j)) ∧
    Summable (fun n : ℕ => ‖q ^ (n * (n - 1) / 2) * z ^ n / qPochhammerFin q q n‖) := by
  sorry

/-! ## Layer 3: polynomial identities and partition-series adapters -/

/-- The ordinary partition adapter has the native finite partition count as coefficient. -/
theorem partitionSeries_coeff {K : Type*} [CommSemiring K] (n : ℕ) :
    PowerSeries.coeff n (Nat.Partition.genFun (fun _ _ => (1 : K))) =
      (Fintype.card (Nat.Partition n) : K) := by
  sorry

/-- Both Rogers-Ramanujan identities, with nonzero Euler-tail denominators on the disc. -/
theorem rogersRamanujan_hasSum (q : ℂ) (hq : ‖q‖ < 1) :
    HasSum (fun n : ℕ => q ^ (n * n) / qPochhammerFin q q n)
      ((∏' j : ℕ, ((1 - q ^ (5 * j + 1)) * (1 - q ^ (5 * j + 4))))⁻¹) ∧
    HasSum (fun n : ℕ => q ^ (n * n + n) / qPochhammerFin q q n)
      ((∏' j : ℕ, ((1 - q ^ (5 * j + 2)) * (1 - q ^ (5 * j + 3))))⁻¹) ∧
    Summable (fun n : ℕ => ‖q ^ (n * n) / qPochhammerFin q q n‖) ∧
    Summable (fun n : ℕ => ‖q ^ (n * n + n) / qPochhammerFin q q n‖) := by
  sorry

/-! ## Layer 4: rank, crank and arithmetic progressions -/

/-- Rank is the largest part minus the number of parts, with empty value zero. -/
def partitionRank {n : ℕ} (p : Nat.Partition n) : ℤ :=
  ((p.parts.toFinset.sup id : ℕ) : ℤ) - (p.parts.card : ℤ)

/-- Crank counts parts strictly greater than the number of ones when there are ones. -/
def partitionCrank {n : ℕ} (p : Nat.Partition n) : ℤ :=
  let o := p.parts.count 1
  if o = 0 then ((p.parts.toFinset.sup id : ℕ) : ℤ)
  else ((p.parts.filter (fun j => o < j)).card : ℤ) - (o : ℤ)

/-- Rank of the singleton partition is zero. -/
example : partitionRank (Nat.Partition.ofSums 1 {1} (by decide)) = 0 := by decide

/-- The strict-filter witness has rank minus one. -/
example : partitionRank (Nat.Partition.ofSums 7 {3, 2, 1, 1} (by decide)) = -1 ∧
    partitionRank (Nat.Partition.ofSums 6 {3, 3} (by decide)) = 1 ∧
    partitionRank (Nat.Partition.ofSums 6 {2, 2, 2} (by decide)) = -1 := by decide

/-- The ordinary crank at size one is minus one. -/
example : partitionCrank (Nat.Partition.ofSums 1 {1} (by decide)) = -1 := by decide

/-- The strict inequality and the no-ones branch give different largest-part behavior. -/
example : partitionCrank (Nat.Partition.ofSums 7 {3, 2, 1, 1} (by decide)) = -1 ∧
    partitionCrank (Nat.Partition.ofSums 6 {3, 3} (by decide)) = 3 := by decide

/-- Both statistics of any partition of zero vanish. -/
theorem rankCrankEmpty (p : Nat.Partition 0) :
    partitionRank p = 0 ∧ partitionCrank p = 0 := by
  sorry

/-- Native conjugation negates rank. -/
theorem partitionRank_conjugate {n : ℕ} (p : Nat.Partition n) :
    partitionRank (TauCeti.conjugate p) = -partitionRank p := by
  sorry

/-- Residue counts are finite fibers of an integer statistic on native partitions. -/
noncomputable def partitionResidueCount
    (s : (n : ℕ) → Nat.Partition n → ℤ) (t : ℕ) (r : ZMod t) (n : ℕ) : ℕ :=
  (Finset.univ.filter (fun p : Nat.Partition n => (s n p : ZMod t) = r)).card

/-- Summing the residue fibers recovers every partition once. -/
theorem partitionResidueCounts_sum
    (s : (n : ℕ) → Nat.Partition n → ℤ) (t : ℕ) [NeZero t] (n : ℕ) :
    (∑ r : ZMod t, partitionResidueCount s t r n) = Fintype.card (Nat.Partition n) := by
  sorry

/-- Modulo one the sole residue count is the ordinary partition count. -/
theorem filterOne (s : (n : ℕ) → Nat.Partition n → ℤ) (n : ℕ) :
    partitionResidueCount s 1 0 n = Fintype.card (Nat.Partition n) := by
  sorry

/-- The multiplied character filter remains valid without dividing by the modulus. -/
theorem partitionResidueCounts_filter_complex
    (s : (n : ℕ) → Nat.Partition n → ℤ) (t : ℕ) (ht : 0 < t)
    (ζ : ℂ) (hζ : IsPrimitiveRoot ζ t) (r n : ℕ) :
    (t : ℂ) * (partitionResidueCount s t (r : ZMod t) n : ℂ) =
      ∑ j ∈ Finset.range t, ζ ^ (-(r : ℤ) * (j : ℤ)) *
        ∑ p : Nat.Partition n, ζ ^ (s n p * (j : ℤ)) := by
  sorry

/-- A constant-zero statistic has no partitions in the nonzero residue class. -/
example (n : ℕ) : partitionResidueCount (fun _ _ => 0) 2 1 n = 0 := by
  classical
  simp [partitionResidueCount]

/-- At size one rank lies in class zero and crank in class one modulo two. -/
theorem filterTwo :
    partitionResidueCount (fun _ p => partitionRank p) 2 0 1 = 1 ∧
    partitionResidueCount (fun _ p => partitionCrank p) 2 1 1 = 1 := by
  sorry

/-- Modulus one gives an empty residue fiber for no partition statistic. -/
example (s : (n : ℕ) → Nat.Partition n → ℤ) :
    partitionResidueCount s 1 0 0 = Fintype.card (Nat.Partition 0) := by
  classical
  simp [partitionResidueCount]

/-- The rank dissections yield equidistribution in the two Ramanujan progressions. -/
theorem rank_equidistribution_five_seven (n : ℕ) :
    (∀ r s : ZMod 5, partitionResidueCount (fun _ p => partitionRank p) 5 r (5 * n + 4) =
      partitionResidueCount (fun _ p => partitionRank p) 5 s (5 * n + 4)) ∧
    (∀ r s : ZMod 7, partitionResidueCount (fun _ p => partitionRank p) 7 r (7 * n + 5) =
      partitionResidueCount (fun _ p => partitionRank p) 7 s (7 * n + 5)) := by
  sorry

/-- Ordinary crank is equidistributed for all three specified prime progressions. -/
theorem crank_equidistribution_five_seven_eleven (ℓ d n : ℕ)
    (h : (ℓ = 5 ∧ d = 4) ∨ (ℓ = 7 ∧ d = 5) ∨ (ℓ = 11 ∧ d = 6))
    (r s : ZMod ℓ) :
    partitionResidueCount (fun _ p => partitionCrank p) ℓ r (ℓ * n + d) =
      partitionResidueCount (fun _ p => partitionCrank p) ℓ s (ℓ * n + d) := by
  sorry

/-- The residue-five eleven-dissection has zero coefficient at size forty-nine. -/
theorem dissectionCrankFortyNine (r : ZMod 11) :
    partitionResidueCount (fun _ p => partitionCrank p) 11 r 49 = 15775 := by
  sorry

/-- Rank does not give the corresponding eleven-equidistribution. -/
theorem rankElevenFails :
    partitionResidueCount (fun _ p => partitionRank p) 11 1 6 = 2 := by
  sorry

/-- Prime-power partition congruences use any representative of the inverse of 24. -/
theorem partition_primePowerCongruences (ℓ r δ n : ℕ)
    (hℓ : ℓ = 5 ∨ ℓ = 7 ∨ ℓ = 11) (hr : 1 ≤ r)
    (hδ : δ < ℓ ^ r) (hcong : Nat.ModEq (ℓ ^ r) (24 * δ) 1) :
    (if ℓ = 7 then 7 ^ (r / 2 + 1) else ℓ ^ r) ∣
      Fintype.card (Nat.Partition (ℓ ^ r * n + δ)) := by
  sorry

/-- At exponent three the seven-adic guarantee cannot be increased to 343. -/
theorem sevenExponent :
    49 ∣ Fintype.card (Nat.Partition 243) ∧ ¬343 ∣ Fintype.card (Nat.Partition 243) := by
  sorry

/-- Decimation extracts coefficients divisible by the index; it is a linear operator. -/
def qSeriesDecimation {K : Type*} [CommSemiring K] (t : ℕ)
    (f : PowerSeries K) : PowerSeries K :=
  PowerSeries.mk fun n => PowerSeries.coeff (t * n) f

/-- Successive coefficient extractions multiply their indices. -/
theorem qSeriesDecimation_comp {K : Type*} [CommSemiring K]
    (s t : ℕ) (f : PowerSeries K) :
    qSeriesDecimation s (qSeriesDecimation t f) = qSeriesDecimation (s * t) f := by
  sorry

/-- Decimation is linear over every commutative coefficient semiring. -/
theorem qSeriesDecimation_add_smul {K : Type*} [CommSemiring K]
    (t : ℕ) (c : K) (f g : PowerSeries K) :
    qSeriesDecimation t (f + c • g) = qSeriesDecimation t f + c • qSeriesDecimation t g := by
  sorry

/-- Pulling out a series supported in multiples of t gives the projection formula. -/
theorem qSeriesDecimation_pullout {K : Type*} [CommSemiring K]
    (t : ℕ) (ht : t ≠ 0) (f g : PowerSeries K) :
    qSeriesDecimation t (PowerSeries.expand t ht f * g) = f * qSeriesDecimation t g := by
  sorry

/-- The coefficient-one term of the decimated quadratic records its coefficient two. -/
example : PowerSeries.coeff 1
    (qSeriesDecimation 2 (1 + PowerSeries.X + 2 * (PowerSeries.X : PowerSeries ℤ) ^ 2)) = 2 := by
  norm_num [qSeriesDecimation, PowerSeries.coeff_mul]

/-- Index one preserves every coefficient. -/
example {K : Type*} [CommSemiring K] (f : PowerSeries K) : qSeriesDecimation 1 f = f := by
  ext n
  simp [qSeriesDecimation]

/-- Decimation cannot be a ring homomorphism: it kills X but sends X squared to X. -/
theorem decimationNotMultiplicative :
    qSeriesDecimation 2 (PowerSeries.X : PowerSeries ℤ) = 0 ∧
    qSeriesDecimation 2 ((PowerSeries.X : PowerSeries ℤ) ^ 2) = PowerSeries.X := by
  sorry

/-! ## Layer 5: theta normalizations, error kernels and completed Lerch sums -/

/-- The shifted native theta has derivative minus two pi eta cubed at the origin. -/
theorem zwegersOddTheta_deriv_zero (τ : ℂ) (hτ : 0 < τ.im) :
    HasDerivAt (fun z : ℂ => Complex.I *
      Complex.exp ((Real.pi : ℂ) * Complex.I * τ / 4 + (Real.pi : ℂ) * Complex.I * z) *
      jacobiTheta₂ (z + (τ + 1) / 2) τ)
      (-2 * (Real.pi : ℂ) * ModularForm.eta τ ^ 3) 0 := by
  sorry

/-- The two central terms fix the odd theta shift and its factor i. -/
theorem oddThetaPair (z τ : ℂ) :
    Complex.I * Complex.exp ((Real.pi : ℂ) * Complex.I * τ / 4 +
      (Real.pi : ℂ) * Complex.I * z) *
      (jacobiTheta₂_term 0 (z + (τ + 1) / 2) τ +
        jacobiTheta₂_term (-1) (z + (τ + 1) / 2) τ) =
    Complex.I * Complex.exp ((Real.pi : ℂ) * Complex.I * τ / 4) *
      (Complex.exp ((Real.pi : ℂ) * Complex.I * z) -
        Complex.exp (-(Real.pi : ℂ) * Complex.I * z)) := by
  sorry

/-! ## Layer 8: harmonic weak Maass spaces, Fourier parts and shadows -/

/-- The antiholomorphic Wirtinger derivative uses real derivatives in directions 1 and i. -/
noncomputable def wirtingerBar (F : ℂ → ℂ) (τ : ℂ) : ℂ :=
  (fderiv ℝ F τ 1 + Complex.I * fderiv ℝ F τ Complex.I) / 2

/-- The holomorphic-weight xi operator conjugates the antiholomorphic derivative. -/
noncomputable def maassXi (k : ℝ) (F : ℂ → ℂ) (τ : ℂ) : ℂ :=
  2 * Complex.I * (τ.im ^ k : ℝ) * star (wirtingerBar F τ)

/-- The weight-k Laplacian in real coordinates on the upper half-plane. -/
noncomputable def maassLaplacian (k : ℝ) (F : ℂ → ℂ) (τ : ℂ) : ℂ :=
  -(τ.im : ℂ) ^ 2 *
    (fderiv ℝ (fun z => fderiv ℝ F z 1) τ 1 +
      fderiv ℝ (fun z => fderiv ℝ F z Complex.I) τ Complex.I) +
    (k : ℂ) * Complex.I * (τ.im : ℂ) *
      (fderiv ℝ F τ 1 + Complex.I * fderiv ℝ F τ Complex.I)

/-- Constants have zero antiholomorphic derivative. -/
example (c τ : ℂ) : wirtingerBar (fun _ => c) τ = 0 := by
  simp [wirtingerBar]

/-- The imaginary coordinate has antiholomorphic derivative i/2. -/
example (τ : ℂ) : wirtingerBar (fun z : ℂ => (z.im : ℂ)) τ = Complex.I / 2 := by
  have h : HasFDerivAt (fun z : ℂ => (z.im : ℂ))
      (Complex.ofRealCLM.comp Complex.imCLM) τ :=
    (Complex.ofRealCLM.comp Complex.imCLM).hasFDerivAt
  rw [wirtingerBar, h.fderiv]
  simp

/-- Xi sends y at weight zero to one. -/
example (τ : ℂ) : maassXi 0 (fun z : ℂ => (z.im : ℂ)) τ = 1 := by
  have h : HasFDerivAt (fun z : ℂ => (z.im : ℂ))
      (Complex.ofRealCLM.comp Complex.imCLM) τ :=
    (Complex.ofRealCLM.comp Complex.imCLM).hasFDerivAt
  rw [maassXi, wirtingerBar, h.fderiv]
  norm_num

/-- Xi sends i times y to minus i, witnessing antilinearity. -/
example (τ : ℂ) : maassXi 0 (fun z : ℂ => Complex.I * (z.im : ℂ)) τ = -Complex.I := by
  have h : HasFDerivAt (fun z : ℂ => Complex.I * (z.im : ℂ))
      (Complex.I • (Complex.ofRealCLM.comp Complex.imCLM)) τ :=
    (Complex.I • (Complex.ofRealCLM.comp Complex.imCLM)).hasFDerivAt
  rw [maassXi, wirtingerBar, h.fderiv]
  norm_num

/-- The Laplacian kills every constant. -/
example (k : ℝ) (c τ : ℂ) : maassLaplacian k (fun _ => c) τ = 0 := by
  simp [maassLaplacian]

/-- Constants have zero xi-image at every weight. -/
theorem xiConstant (k : ℝ) (c τ : ℂ) : maassXi k (fun _ => c) τ = 0 := by
  sorry

/-- Holomorphicity forces the antiholomorphic Wirtinger derivative to vanish. -/
theorem wirtingerBar_holomorphic (F : ℂ → ℂ) (τ : ℂ)
    (hF : DifferentiableAt ℂ F τ) : wirtingerBar F τ = 0 := by
  sorry

/-- At weight zero y is harmonic and y squared is not harmonic. -/
theorem laplacianZeroModes (τ : ℂ) (hτ : 0 < τ.im) :
    maassLaplacian 0 (fun z : ℂ => (z.im : ℂ)) τ = 0 ∧
    maassLaplacian 0 (fun z : ℂ => (z.im : ℂ) ^ 2) τ = -2 * (τ.im : ℂ) ^ 2 := by
  sorry

/-- Xi is antilinear where the underlying real derivative exists. -/
theorem xi_antilinear (k : ℝ) (c : ℂ) (F : ℂ → ℂ) (τ : ℂ)
    (hF : DifferentiableAt ℝ F τ) :
    maassXi k (fun z => c * F z) τ = star c * maassXi k F τ := by
  sorry

/-- On C-squared functions the holomorphic-weight Laplacian is minus xi composed with xi. -/
theorem maassLaplacian_eq_neg_xi_xi (k : ℝ) (F : ℂ → ℂ)
    (hF : ContDiffOn ℝ 2 F {z : ℂ | 0 < z.im}) (τ : ℂ) (hτ : 0 < τ.im) :
    maassLaplacian k F τ = -maassXi (2 - k) (maassXi k F) τ := by
  sorry

/-- Imaginary powers pin the Laplacian sign and both zero-frequency solutions. -/
theorem holomorphicWeightOperators_zeroMode (k s : ℝ) (τ : ℂ) (hτ : 0 < τ.im) :
    maassLaplacian k (fun z : ℂ => (z.im ^ s : ℝ)) τ =
      ((-s * (s + k - 1) * τ.im ^ s : ℝ) : ℂ) := by
  sorry

/-- At weight one the second constant Fourier mode is logarithmic. -/
theorem maassLaplacian_log (τ : ℂ) (hτ : 0 < τ.im) :
    maassLaplacian 1 (fun z : ℂ => (Real.log z.im : ℂ)) τ = 0 := by
  sorry

/-- A growing antiholomorphic Fourier mode has a polar holomorphic shadow. -/
theorem fourierPolarShadow (τ : ℂ) (hτ : 0 < τ.im) :
    maassXi 0 (fun z => star (Complex.exp (-2 * (Real.pi : ℂ) * Complex.I * z))) τ =
      4 * (Real.pi : ℂ) * Complex.exp (-2 * (Real.pi : ℂ) * Complex.I * τ) := by
  sorry

/-! ## Layer 9: completed kernels and meromorphic Jacobi coefficients -/

/-- Completing the square identifies each positive-index component with native theta. -/
theorem jacobiThetaComponent_eval (m : ℕ) (hm : 0 < m) (l : ℤ) (z τ : ℂ)
    (hτ : 0 < τ.im) :
    HasSum (fun j : ℤ => Complex.exp
      ((Real.pi : ℂ) * Complex.I * ((l : ℂ) + 2 * (m : ℂ) * j) ^ 2 * τ / (2 * m) +
        2 * (Real.pi : ℂ) * Complex.I * ((l : ℂ) + 2 * (m : ℂ) * j) * z))
      (Complex.exp ((Real.pi : ℂ) * Complex.I * (l : ℂ) ^ 2 * τ / (2 * m) +
        2 * (Real.pi : ℂ) * Complex.I * l * z) *
        jacobiTheta₂ (2 * (m : ℂ) * z + l * τ) (2 * (m : ℂ) * τ)) := by
  sorry

/-! ## Layer 10: explicit third-, fifth- and seventh-order mock theta vectors -/

/-- Ramanujan's third-order f on the open unit disc, using its actual unilateral summands. -/
noncomputable def thirdOrderF (q : ℂ) : ℂ :=
  ∑' n : ℕ, q ^ (n * n) / qPochhammerFin (-q) q n ^ 2

/-- The third-order f has constant term one, including at base zero. -/
example : thirdOrderF 0 = 1 := by
  unfold thirdOrderF
  rw [tsum_eq_single 0]
  · simp [qPochhammerFin]
  · intro n hn
    have hn' : n * n ≠ 0 := Nat.mul_ne_zero hn hn
    simp [zero_pow hn']

/-- The third-order f converges absolutely on its entire disc domain. -/
theorem thirdOrderF_hasSum (q : ℂ) (hq : ‖q‖ < 1) :
    HasSum (fun n : ℕ => q ^ (n * n) / qPochhammerFin (-q) q n ^ 2) (thirdOrderF q) ∧
    Summable (fun n : ℕ => ‖q ^ (n * n) / qPochhammerFin (-q) q n ^ 2‖) := by
  sorry

/-- The first three nonconstant Taylor coefficients are the signed partition ranks. -/
theorem thirdRankSigns : deriv thirdOrderF 0 = 1 ∧
    deriv (deriv thirdOrderF) 0 = -4 ∧
    deriv (deriv (deriv thirdOrderF)) 0 = 18 := by
  sorry

/-- Specialization of the actual rank series at minus one gives the third-order f. -/
theorem thirdOrderF_rank (q : ℂ) (hq : ‖q‖ < 1) :
    HasSum (fun n : ℕ =>
      (∑ p : Nat.Partition n, (-1 : ℂ) ^ partitionRank p) * q ^ n) (thirdOrderF q) := by
  sorry

end

end TauCetiRoadmap.QSeriesPartitionsAndMockModularForms
