import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist.Basic

/-!
# Rank-zero and rank-one Birch–Swinnerton-Dyer theory, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs.

The low finite-Selmer/corank comparison, complementary Heegner-field theorem,
Selmer-corank-one comparison over that field, augmentation-control theorem,
Heegner specialization-factor comparison, non-torsion Heegner-point theorem,
Eisenstein p-infinity converse, rank equality with full Sha finiteness, and
finite-Selmer converse are not statable at the pins: the classical odd-primary
elliptic Selmer groups with their Kummer and Sha identifications, arithmetic
ordinary anticyclotomic Selmer modules, normalized Heegner families and continued
elliptic L-function with its analytic order are missing interfaces. Native
continuous-cohomology kernels and raw L-series do not provide those comparisons.

The positive admissible ratio-stratum theorem, relative analytic-rank proportion
bounds, positive absolute low-rank proportions and nineteen-a3 admissible density
3/8 are not statable at the pins: they additionally need the actual isogeny-kernel
character, its local twisting comparison and the arithmetic Selmer-ratio family.
A squarefree residue count alone would not state the admissible-density theorem.

The local good-reduction obstruction is statable using native quadratic twists
and minimal models. Its quantification over all nonzero 3-adic twist parameters
includes every rational quadratic twist. Model invariant computations and API
checks belong to README.md.
-/

namespace TauCetiRoadmap.RankZeroOneBSDPartII

/-! ## Layer 5: Concrete models and scope diagnostics -/

/-- The rational elliptic model y² + xy + 3y = x³, whose j-invariant has
3-adic valuation -3. -/
def scopeObstructionCurve : WeierstrassCurve ℚ where
  a₁ := 1
  a₂ := 0
  a₃ := 3
  a₄ := 0
  a₆ := 0

/-- No quadratic twist of y² + xy + 3y = x³ has good reduction over ℚ₃.
Good reduction is tested on a native minimal model over ℤ₃; the raw twist uses
trace zero and norm -d, so its discriminant parameter is 4d. -/
theorem no_good_three_twist (d : ℚ_[3]) (hd : d ≠ 0) :
    ¬ (((scopeObstructionCurve.map (algebraMap ℚ ℚ_[3])).quadraticTwistOf 0 (-d)).minimal
      ℤ_[3]).HasGoodReduction ℤ_[3] := by
  sorry

end TauCetiRoadmap.RankZeroOneBSDPartII
