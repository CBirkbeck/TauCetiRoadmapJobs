module
import Mathlib

/-!
# Yang–Mills connections and the caloric gauge: target signatures

The roadmap is README.md; this file is not the roadmap. This acceptance test concerns the
roadmap's headline theorems against the pinned APIs. None of the following full signatures
is statable at the pins with only a few simple definitions. They require constructed
analytic or geometric carriers, rather than unspecified predicates for their conclusions.

* Layer 3, rough gauge invariance of curvature and finite energy (§3.2): missing the
  critical local matrix-Sobolev gauge action on rough connections and its weak curvature.
  Scalar Sobolev spaces and smooth vector-bundle covariant derivatives do not supply it.
* Layer 4, Uhlenbeck's Coulomb gauge with uniqueness and continuity (§4.1), and critical
  point removal (§4.2): missing the rough connection and gauge carriers, weak curvature,
  and normal trace on their critical Sobolev domains.
* Layer 5, the good global gauge (§5.2), topological-class locality and gauge invariance
  (§5.4), and the trivial-class characterisation (§5.5): missing rough connections, their
  gauges at infinity, and the topological-class quotient constructed from those gauges.
  The scalar homogeneous space TauCeti.D1p0 (with p = d/2) carries the remainders
  coefficientwise, but not the connections or the quotient. HomotopyGroup alone is not
  that quotient for disconnected groups.
* Layer 6, characteristic-number transgression and topological invariance (§6.2), the
  integrated Bogomol'nyi bound with equality characterisation (§6.3), and integrality
  and completeness of the SU(2) instanton number (§6.4): missing weak curvature of a
  finite-energy rough connection, its evaluated invariant polynomial forms, and its
  topological class. An inequality on arbitrary integrable functions or six arbitrary
  coefficient fields would not state these theorems on connections.
* Layer 7, harmonic regularity, removal and decay (§§7.2–7.3), the sharp energy gap
  (§7.5), and the attained ground state (§7.7): missing weak harmonic Yang–Mills
  connections, their curvature energy and invariant pairing. A smooth-only potential
  would omit the critical weak hypotheses of these headlines.
* Layer 8, homogeneous covariant elliptic invertibility (§8.2) and parabolic estimates
  with decay (§§8.3–8.4): TauCeti.D1p0 supplies the scalar first-order space Ḣ¹(ℝ⁴), but
  the realised fractional spaces Ḣ^σ and Ẇ^{σ,p}, the Besov spaces ℓ¹L² and ℓ²L¹Ḣ^σ, and
  the covariant operators on those distribution spaces are missing. Inhomogeneous scalar
  Wkp, Mathlib's inhomogeneous Bessel-potential scale and an abstract semigroup do not
  identify these spaces or these operators.
* Layer 9, local well-posedness, stability and continuation (§§9.3–9.4), flat limits of
  the nonlinear and linearised flows (§9.5), the Dichotomy Theorem (§9.6), and the
  Threshold Theorem (§9.7): missing the local-caloric solution carrier on the critical
  connection space (coefficientwise TauCeti.D1p0), its weak curvature, maximal lifespan
  and caloric size, and the harmonic-bubble convergence interface. These constructions cannot be a short bundle
  of native data or a free Prop-valued field.
* Layer 10, flat connections as pure gauges and the caloric-gauge theorem (§§10.1–10.2),
  caloric bounds and the C¹ split caloric manifold (§§10.3–10.4), and tangent spaces
  with the nonlinear div–curl decomposition (§10.5): missing the Banach space ℋ,
  the caloric subset, and the linearised heat-flow solution and limit operators.
  Manifold.IsSmoothEmbedding supplies the chart predicate, but not those carriers.

The README states all these targets, their hypotheses, supplier contracts, APIs and Checks.
No abstract surrogate or restricted special case is substituted for a headline here.
-/

namespace TauCetiRoadmap.YangMillsConnectionsAndCaloricGauge

end TauCetiRoadmap.YangMillsConnectionsAndCaloricGauge
